void ProResDecoderRegister()
{
  __CFDictionary *Mutable;
  __CFDictionary *v1;
  uint64_t vars8;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  v1 = Mutable;
  if (Mutable)
  {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F1ED20], (const void *)*MEMORY[0x263EFFB40]);
    CFDictionarySetValue(v1, @"CMClassImplementationID", @"com.apple.videotoolbox.videodecoder.appleproreshw");
  }
  if (AppleProResHW_CheckPlatform())
  {
    if (!v1) {
      return;
    }
  }
  else
  {
    VTRegisterVideoDecoderWithInfo();
    VTRegisterVideoDecoderWithInfo();
    VTRegisterVideoDecoderWithInfo();
    VTRegisterVideoDecoderWithInfo();
    VTRegisterVideoDecoderWithInfo();
    VTRegisterVideoDecoderWithInfo();
    VTRegisterVideoDecoderWithInfo();
    VTRegisterVideoDecoderWithInfo();
    if (!v1) {
      return;
    }
  }

  CFRelease(v1);
}

uint64_t AppleProResHW_CheckPlatform(void)
{
  CFDictionaryRef v0 = IOServiceMatching("AppleProResHW");
  if (v0)
  {
    io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x263F0EC88], v0);
    if (MatchingService)
    {
      IOObjectRelease(MatchingService);
      return 0;
    }
    else
    {
      uint64_t v2 = 3758097088;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        AppleProResHW_CheckPlatform();
      }
    }
  }
  else
  {
    uint64_t v2 = 3758097085;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      AppleProResHW_CheckPlatform();
    }
  }
  return v2;
}

uint64_t worker(void *a1)
{
  while (1)
  {
    pthread_mutex_lock(*(pthread_mutex_t **)a1);
    while (!*(void *)(*((void *)a1 + 4) + 40))
    {
      unsigned __int8 v2 = atomic_load(*((unsigned __int8 **)a1 + 1));
      if (v2) {
        break;
      }
      pthread_cond_wait(*((pthread_cond_t **)a1 + 2), *(pthread_mutex_t **)a1);
    }
    unsigned __int8 v3 = atomic_load(*((unsigned __int8 **)a1 + 1));
    if (v3) {
      break;
    }
    v4 = (int64x2_t *)*((void *)a1 + 4);
    uint64_t v5 = *(void *)(*(void *)(v4->i64[1] + (((unint64_t)v4[2].i64[0] >> 6) & 0x3FFFFFFFFFFFFF8))
                   + 8 * (v4[2].i64[0] & 0x1FF));
    v4[2] = vaddq_s64(v4[2], (int64x2_t)xmmword_262C0ED00);
    std::deque<void *>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)v4, 1);
    pthread_cond_signal(*((pthread_cond_t **)a1 + 3));
    pthread_mutex_unlock(*(pthread_mutex_t **)a1);
    (*(void (**)(void))v5)(*(void *)(v5 + 8));
    MEMORY[0x263E5F2D0](v5, 0x80C40803F642BLL);
  }
  pthread_mutex_unlock(*(pthread_mutex_t **)a1);
  return 0;
}

void ThreadPool::ThreadPool(ThreadPool *this, int a2, int a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *(_OWORD *)this = 0u;
  *((_DWORD *)this + 12) = a2;
  *((_DWORD *)this + 13) = a3;
  *((unsigned char *)this + 224) = 0;
  pthread_mutex_init((pthread_mutex_t *)this + 1, 0);
  pthread_cond_init((pthread_cond_t *)((char *)this + 128), 0);
  pthread_cond_init((pthread_cond_t *)((char *)this + 176), 0);
  pthread_attr_init(&v4);
  pthread_attr_setdetachstate(&v4, 1);
  atomic_store(0, (unsigned __int8 *)this + 224);
  operator new[]();
}

void sub_262BEDC44(_Unwind_Exception *a1)
{
  std::deque<void *>::~deque[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void ThreadPool::~ThreadPool(ThreadPool *this)
{
  atomic_store(1u, (unsigned __int8 *)this + 224);
  unsigned __int8 v2 = (pthread_mutex_t *)((char *)this + 64);
  pthread_mutex_lock((pthread_mutex_t *)this + 1);
  while (1)
  {
    uint64_t v3 = *((void *)this + 5);
    if (!v3) {
      break;
    }
    unint64_t v4 = *((void *)this + 4);
    uint64_t v5 = *(void *)(*(void *)(*((void *)this + 1) + ((v4 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v4 & 0x1FF));
    if (v5)
    {
      MEMORY[0x263E5F2D0](v5, 0x80C40803F642BLL);
      unint64_t v4 = *((void *)this + 4);
      uint64_t v3 = *((void *)this + 5);
    }
    *((void *)this + 4) = v4 + 1;
    *((void *)this + 5) = v3 - 1;
    std::deque<void *>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this, 1);
  }
  pthread_cond_broadcast((pthread_cond_t *)((char *)this + 128));
  pthread_mutex_unlock(v2);
  if (*((_DWORD *)this + 13))
  {
    unint64_t v6 = 0;
    do
      pthread_join(*(pthread_t *)(*((void *)this + 7) + 8 * v6++), 0);
    while (v6 < *((unsigned int *)this + 13));
  }
  uint64_t v7 = *((void *)this + 7);
  if (v7) {
    MEMORY[0x263E5F2B0](v7, 0x20C8093837F09);
  }
  uint64_t v8 = *((void *)this + 29);
  if (v8) {
    MEMORY[0x263E5F2D0](v8, 0x20C40769AC3DALL);
  }
  pthread_cond_destroy((pthread_cond_t *)((char *)this + 128));
  pthread_mutex_destroy(v2);

  std::deque<void *>::~deque[abi:ne180100](this);
}

void sub_262BEDDC4(_Unwind_Exception *a1)
{
  std::deque<void *>::~deque[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void ThreadPool::addTask(ThreadPool *this, void *(*a2)(void *), void *a3)
{
}

uint64_t ThreadPool::getTaskQueueSize(pthread_mutex_t *this)
{
  unsigned __int8 v2 = this + 1;
  pthread_mutex_lock(this + 1);
  uint64_t v3 = *(unsigned int *)&this->__opaque[32];
  pthread_mutex_unlock(v2);
  return v3;
}

uint64_t std::deque<void *>::~deque[abi:ne180100](void *a1)
{
  unsigned __int8 v2 = (void **)a1[1];
  uint64_t v3 = (void **)a1[2];
  unint64_t v4 = (char *)v3 - (char *)v2;
  if (v3 == v2)
  {
    uint64_t v5 = a1 + 5;
  }
  else
  {
    uint64_t v5 = a1 + 5;
    unint64_t v6 = a1[4];
    uint64_t v7 = &v2[v6 >> 9];
    uint64_t v8 = (uint64_t)*v7;
    uint64_t v9 = (uint64_t)*v7 + 8 * (v6 & 0x1FF);
    while ((void *)v9 != *(char **)((char *)v2 + (((a1[5] + v6) >> 6) & 0x3FFFFFFFFFFFFF8))
                        + 8 * ((a1[5] + v6) & 0x1FF))
    {
      v9 += 8;
      if (v9 - v8 == 4096)
      {
        uint64_t v10 = (uint64_t)v7[1];
        ++v7;
        uint64_t v8 = v10;
        uint64_t v9 = v10;
      }
    }
  }
  *uint64_t v5 = 0;
  if (v4 >= 0x11)
  {
    do
    {
      operator delete(*v2);
      uint64_t v3 = (void **)a1[2];
      unsigned __int8 v2 = (void **)(a1[1] + 8);
      a1[1] = v2;
      unint64_t v4 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  unint64_t v11 = v4 >> 3;
  if (v11 == 1)
  {
    uint64_t v12 = 256;
  }
  else
  {
    if (v11 != 2) {
      goto LABEL_15;
    }
    uint64_t v12 = 512;
  }
  a1[4] = v12;
LABEL_15:
  while (v2 != v3)
  {
    v13 = *v2++;
    operator delete(v13);
  }

  return std::__split_buffer<void **>::~__split_buffer((uint64_t)a1);
}

uint64_t std::__split_buffer<void **>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != v3) {
    *(void *)(a1 + 16) = v2 + ((v3 - v2 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  unint64_t v4 = *(void **)a1;
  if (*(void *)a1) {
    operator delete(v4);
  }
  return a1;
}

uint64_t std::deque<void *>::__maybe_remove_front_spare[abi:ne180100](uint64_t a1, int a2)
{
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 < 0x200) {
    a2 = 1;
  }
  if (v2 < 0x400) {
    int v4 = a2;
  }
  else {
    int v4 = 0;
  }
  if ((v4 & 1) == 0)
  {
    operator delete(**(void ***)(a1 + 8));
    *(void *)(a1 + 8) += 8;
    *(void *)(a1 + 32) -= 512;
  }
  return v4 ^ 1u;
}

void std::deque<void *>::push_back(void *a1, void *a2)
{
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[1];
  if (v4 == v5) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = ((v4 - v5) << 6) - 1;
  }
  uint64_t v7 = a1[5];
  unint64_t v8 = v7 + a1[4];
  if (v6 == v8)
  {
    std::deque<void *>::__add_back_capacity(a1);
    uint64_t v5 = a1[1];
    uint64_t v7 = a1[5];
    unint64_t v8 = a1[4] + v7;
  }
  *(void *)(*(void *)(v5 + ((v8 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v8 & 0x1FF)) = *a2;
  a1[5] = v7 + 1;
}

void std::deque<void *>::__add_back_capacity(void *a1)
{
  unint64_t v2 = a1[4];
  BOOL v3 = v2 >= 0x200;
  unint64_t v4 = v2 - 512;
  if (v3)
  {
    uint64_t v5 = (uint64_t)(a1 + 3);
    uint64_t v6 = (char *)a1[3];
    a1[4] = v4;
    uint64_t v7 = (void *)a1[1];
    unint64_t v8 = (char *)a1[2];
    uint64_t v11 = *v7;
    uint64_t v9 = (char *)(v7 + 1);
    uint64_t v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(void *)unint64_t v8 = v10;
      a1[2] += 8;
      return;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v33 = 1;
      }
      else {
        unint64_t v33 = (uint64_t)&v8[-*a1] >> 2;
      }
      v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void **>>(v5, v33);
      v35 = &v34[8 * (v33 >> 2)];
      v37 = &v34[8 * v36];
      v38 = (uint64_t *)a1[1];
      unint64_t v8 = v35;
      uint64_t v39 = a1[2] - (void)v38;
      if (v39)
      {
        unint64_t v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v40 = 8 * (v39 >> 3);
        v41 = &v34[8 * (v33 >> 2)];
        do
        {
          uint64_t v42 = *v38++;
          *(void *)v41 = v42;
          v41 += 8;
          v40 -= 8;
        }
        while (v40);
      }
      goto LABEL_30;
    }
LABEL_5:
    uint64_t v13 = v12 >> 3;
    BOOL v14 = v12 >> 3 < -1;
    uint64_t v15 = (v12 >> 3) + 2;
    if (v14) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = v13 + 1;
    }
    uint64_t v17 = -(v16 >> 1);
    uint64_t v18 = v16 >> 1;
    v19 = &v9[-8 * v18];
    int64_t v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      uint64_t v9 = (char *)a1[1];
    }
    unint64_t v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_33;
  }
  uint64_t v21 = a1[2];
  unint64_t v22 = (v21 - a1[1]) >> 3;
  uint64_t v23 = a1[3];
  uint64_t v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(void *)&long long v54 = operator new(0x1000uLL);
      std::__split_buffer<void **>::push_back(a1, &v54);
      return;
    }
    *(void *)&long long v54 = operator new(0x1000uLL);
    std::__split_buffer<void **>::push_front((uint64_t)a1, &v54);
    v44 = (void *)a1[1];
    unint64_t v8 = (char *)a1[2];
    uint64_t v45 = *v44;
    uint64_t v9 = (char *)(v44 + 1);
    uint64_t v10 = v45;
    a1[1] = v9;
    if (v8 != (char *)a1[3]) {
      goto LABEL_33;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v46 = 1;
      }
      else {
        unint64_t v46 = (uint64_t)&v8[-*a1] >> 2;
      }
      v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void **>>((uint64_t)(a1 + 3), v46);
      v35 = &v34[8 * (v46 >> 2)];
      v37 = &v34[8 * v47];
      v48 = (uint64_t *)a1[1];
      unint64_t v8 = v35;
      uint64_t v49 = a1[2] - (void)v48;
      if (v49)
      {
        unint64_t v8 = &v35[v49 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v50 = 8 * (v49 >> 3);
        v51 = &v34[8 * (v46 >> 2)];
        do
        {
          uint64_t v52 = *v48++;
          *(void *)v51 = v52;
          v51 += 8;
          v50 -= 8;
        }
        while (v50);
      }
LABEL_30:
      v43 = (char *)*a1;
      *a1 = v34;
      a1[1] = v35;
      a1[2] = v8;
      a1[3] = v37;
      if (v43)
      {
        operator delete(v43);
        unint64_t v8 = (char *)a1[2];
      }
      goto LABEL_33;
    }
    goto LABEL_5;
  }
  if (v23 == *a1) {
    unint64_t v25 = 1;
  }
  else {
    unint64_t v25 = v24 >> 2;
  }
  v56 = a1 + 3;
  *(void *)&long long v54 = std::__allocate_at_least[abi:ne180100]<std::allocator<void **>>((uint64_t)(a1 + 3), v25);
  *((void *)&v54 + 1) = v54 + 8 * v22;
  *(void *)&long long v55 = *((void *)&v54 + 1);
  *((void *)&v55 + 1) = v54 + 8 * v26;
  v53 = operator new(0x1000uLL);
  std::__split_buffer<void **>::push_back(&v54, &v53);
  v27 = (void *)a1[2];
  uint64_t v28 = -7 - (void)v27;
  while (v27 != (void *)a1[1])
  {
    --v27;
    v28 += 8;
    std::__split_buffer<void **>::push_front((uint64_t)&v54, v27);
  }
  v29 = (char *)*a1;
  long long v30 = v54;
  long long v31 = v55;
  *(void *)&long long v54 = *a1;
  *((void *)&v54 + 1) = v27;
  long long v32 = *((_OWORD *)a1 + 1);
  *(_OWORD *)a1 = v30;
  *((_OWORD *)a1 + 1) = v31;
  long long v55 = v32;
  if (v27 != (void *)v32) {
    *(void *)&long long v55 = v32 + (-(v32 + v28) & 0xFFFFFFFFFFFFFFF8);
  }
  if (v29) {
    operator delete(v29);
  }
}

void sub_262BEE3EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  operator delete(v13);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void std::__split_buffer<void **>::push_back(void *a1, void *a2)
{
  uint64_t v5 = (char *)a1[3];
  uint64_t v4 = (uint64_t)(a1 + 3);
  uint64_t v6 = *(char **)(v4 - 8);
  if (v6 == v5)
  {
    uint64_t v7 = (char *)a1[1];
    uint64_t v8 = (uint64_t)&v7[-*a1];
    if ((unint64_t)v7 <= *a1)
    {
      if (v6 == (char *)*a1) {
        unint64_t v18 = 1;
      }
      else {
        unint64_t v18 = (uint64_t)&v6[-*a1] >> 2;
      }
      v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void **>>(v4, v18);
      uint64_t v21 = &v19[8 * (v18 >> 2)];
      unint64_t v22 = (uint64_t *)a1[1];
      uint64_t v6 = v21;
      uint64_t v23 = a1[2] - (void)v22;
      if (v23)
      {
        uint64_t v6 = &v21[v23 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v24 = 8 * (v23 >> 3);
        unint64_t v25 = &v19[8 * (v18 >> 2)];
        do
        {
          uint64_t v26 = *v22++;
          *(void *)unint64_t v25 = v26;
          v25 += 8;
          v24 -= 8;
        }
        while (v24);
      }
      v27 = (char *)*a1;
      *a1 = v19;
      a1[1] = v21;
      a1[2] = v6;
      a1[3] = &v19[8 * v20];
      if (v27)
      {
        operator delete(v27);
        uint64_t v6 = (char *)a1[2];
      }
    }
    else
    {
      uint64_t v9 = v8 >> 3;
      BOOL v10 = v8 >> 3 < -1;
      uint64_t v11 = (v8 >> 3) + 2;
      if (v10) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = v9 + 1;
      }
      uint64_t v13 = -(v12 >> 1);
      uint64_t v14 = v12 >> 1;
      uint64_t v15 = &v7[-8 * v14];
      int64_t v16 = v6 - v7;
      if (v6 != v7)
      {
        memmove(&v7[-8 * v14], v7, v6 - v7);
        uint64_t v6 = (char *)a1[1];
      }
      uint64_t v17 = &v6[8 * v13];
      uint64_t v6 = &v15[v16];
      a1[1] = v17;
      a1[2] = &v15[v16];
    }
  }
  *(void *)uint64_t v6 = *a2;
  a1[2] += 8;
}

{
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  int64_t v14;
  char *v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;

  uint64_t v4 = (char *)a1[2];
  if (v4 == (char *)a1[3])
  {
    uint64_t v5 = (char *)a1[1];
    uint64_t v6 = (uint64_t)&v5[-*a1];
    if ((unint64_t)v5 <= *a1)
    {
      if (v4 == (char *)*a1) {
        int64_t v16 = 1;
      }
      else {
        int64_t v16 = (uint64_t)&v4[-*a1] >> 2;
      }
      uint64_t v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void **>>(a1[4], v16);
      v19 = &v17[8 * (v16 >> 2)];
      uint64_t v20 = (uint64_t *)a1[1];
      uint64_t v4 = v19;
      uint64_t v21 = a1[2] - (void)v20;
      if (v21)
      {
        uint64_t v4 = &v19[v21 & 0xFFFFFFFFFFFFFFF8];
        unint64_t v22 = 8 * (v21 >> 3);
        uint64_t v23 = &v17[8 * (v16 >> 2)];
        do
        {
          uint64_t v24 = *v20++;
          *(void *)uint64_t v23 = v24;
          v23 += 8;
          v22 -= 8;
        }
        while (v22);
      }
      unint64_t v25 = (char *)*a1;
      *a1 = v17;
      a1[1] = v19;
      a1[2] = v4;
      a1[3] = &v17[8 * v18];
      if (v25)
      {
        operator delete(v25);
        uint64_t v4 = (char *)a1[2];
      }
    }
    else
    {
      uint64_t v7 = v6 >> 3;
      uint64_t v8 = v6 >> 3 < -1;
      uint64_t v9 = (v6 >> 3) + 2;
      if (v8) {
        BOOL v10 = v9;
      }
      else {
        BOOL v10 = v7 + 1;
      }
      uint64_t v11 = -(v10 >> 1);
      uint64_t v12 = v10 >> 1;
      uint64_t v13 = &v5[-8 * v12];
      uint64_t v14 = v4 - v5;
      if (v4 != v5)
      {
        memmove(&v5[-8 * v12], v5, v4 - v5);
        uint64_t v4 = (char *)a1[1];
      }
      uint64_t v15 = &v4[8 * v11];
      uint64_t v4 = &v13[v14];
      a1[1] = v15;
      a1[2] = &v13[v14];
    }
  }
  *(void *)uint64_t v4 = *a2;
  a1[2] += 8;
}

void std::__split_buffer<void **>::push_front(uint64_t a1, void *a2)
{
  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = a1 + 24;
    uint64_t v7 = *(unsigned char **)(a1 + 24);
    uint64_t v8 = *(unsigned char **)(a1 + 16);
    if (v8 >= v7)
    {
      if (v7 == v4) {
        unint64_t v12 = 1;
      }
      else {
        unint64_t v12 = (v7 - v4) >> 2;
      }
      uint64_t v13 = 2 * v12;
      uint64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void **>>(v6, v12);
      uint64_t v5 = &v14[(v13 + 6) & 0xFFFFFFFFFFFFFFF8];
      int64_t v16 = *(uint64_t **)(a1 + 8);
      uint64_t v17 = v5;
      uint64_t v18 = *(void *)(a1 + 16) - (void)v16;
      if (v18)
      {
        uint64_t v17 = &v5[v18 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v19 = 8 * (v18 >> 3);
        uint64_t v20 = v5;
        do
        {
          uint64_t v21 = *v16++;
          *(void *)uint64_t v20 = v21;
          v20 += 8;
          v19 -= 8;
        }
        while (v19);
      }
      unint64_t v22 = *(char **)a1;
      *(void *)a1 = v14;
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v17;
      *(void *)(a1 + 24) = &v14[8 * v15];
      if (v22)
      {
        operator delete(v22);
        uint64_t v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      uint64_t v9 = (v7 - v8) >> 3;
      if (v9 >= -1) {
        uint64_t v10 = v9 + 1;
      }
      else {
        uint64_t v10 = v9 + 2;
      }
      uint64_t v11 = v10 >> 1;
      uint64_t v5 = &v4[8 * (v10 >> 1)];
      if (v8 != v4)
      {
        memmove(&v4[8 * (v10 >> 1)], v4, v8 - v4);
        uint64_t v4 = *(char **)(a1 + 16);
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v11];
    }
  }
  else
  {
    uint64_t v5 = *(char **)(a1 + 8);
  }
  *((void *)v5 - 1) = *a2;
  *(void *)(a1 + 8) -= 8;
}

{
  char *v4;
  char *v5;
  unsigned char *v6;
  unsigned char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;

  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = *(unsigned char **)(a1 + 16);
    uint64_t v7 = *(unsigned char **)(a1 + 24);
    if (v6 >= v7)
    {
      if (v7 == v4) {
        uint64_t v11 = 1;
      }
      else {
        uint64_t v11 = (v7 - v4) >> 2;
      }
      unint64_t v12 = 2 * v11;
      uint64_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void **>>(*(void *)(a1 + 32), v11);
      uint64_t v5 = &v13[(v12 + 6) & 0xFFFFFFFFFFFFFFF8];
      uint64_t v15 = *(uint64_t **)(a1 + 8);
      int64_t v16 = v5;
      uint64_t v17 = *(void *)(a1 + 16) - (void)v15;
      if (v17)
      {
        int64_t v16 = &v5[v17 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v18 = 8 * (v17 >> 3);
        uint64_t v19 = v5;
        do
        {
          uint64_t v20 = *v15++;
          *(void *)uint64_t v19 = v20;
          v19 += 8;
          v18 -= 8;
        }
        while (v18);
      }
      uint64_t v21 = *(char **)a1;
      *(void *)a1 = v13;
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v16;
      *(void *)(a1 + 24) = &v13[8 * v14];
      if (v21)
      {
        operator delete(v21);
        uint64_t v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      uint64_t v8 = (v7 - v6) >> 3;
      if (v8 >= -1) {
        uint64_t v9 = v8 + 1;
      }
      else {
        uint64_t v9 = v8 + 2;
      }
      uint64_t v10 = v9 >> 1;
      uint64_t v5 = &v4[8 * (v9 >> 1)];
      if (v6 != v4)
      {
        memmove(&v4[8 * (v9 >> 1)], v4, v6 - v4);
        uint64_t v4 = *(char **)(a1 + 16);
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v10];
    }
  }
  else
  {
    uint64_t v5 = *(char **)(a1 + 8);
  }
  *((void *)v5 - 1) = *a2;
  *(void *)(a1 + 8) -= 8;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<void **>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

BOOL interchange_compression::check_valid_lossy_level(interchange_compression *this, unsigned int a2)
{
  unsigned int v2 = this - 1;
  BOOL result = 0;
  if (a2 || v2 >= 2)
  {
    BOOL v3 = a2 == 6 || a2 == 8;
    BOOL v4 = v3;
    if (this != 2 || !v4)
    {
      BOOL v5 = a2 != 25 && a2 - 9 >= 2;
      BOOL v6 = !v5;
      if ((this != 3 || !v6) && (a2 > 0x1A || ((1 << a2) & 0x4C00000) == 0 || v2 >= 2)) {
        return 1;
      }
    }
  }
  return result;
}

void interchange_compress_plane(const void *a1, unsigned __int8 *a2, unsigned __int8 *a3, unsigned int a4, unsigned int a5, unsigned int a6, BOOL a7, unsigned int a8, interchange_compression *a9)
{
  uint64_t v9 = MEMORY[0x270FA5388](a1, a2, a3);
  uint64_t v81 = v14;
  uint64_t v82 = v15;
  uint64_t v101 = *MEMORY[0x263EF8340];
  if (v13) {
    uint64_t v16 = 16;
  }
  else {
    uint64_t v16 = 32;
  }
  uint64_t v93 = v16;
  if ((v12 | 2) != 0xA) {
    interchange_compress_plane();
  }
  int v17 = v13;
  int v18 = v12;
  unsigned int v19 = v11;
  unsigned int v20 = v10;
  uint64_t v21 = v9;
  if (v13) {
    int v22 = 8;
  }
  else {
    int v22 = 1;
  }
  if (v13) {
    int v23 = 10;
  }
  else {
    int v23 = 3;
  }
  if (v13) {
    char v24 = 4;
  }
  else {
    char v24 = 5;
  }
  char v85 = v24;
  if (v12 == 8) {
    unsigned int v25 = v22;
  }
  else {
    unsigned int v25 = v23;
  }
  unsigned int v80 = interchange_compression::lossy_parameters[28 * v25 + 4 + a9];
  interchange_compression::compressor::compressor((interchange_compression::compressor *)v99, v25, 0, (interchange_compression *)a9, 0);
  memset((void *)v100, 0, sizeof(v100));
  if (v19)
  {
    uint64_t v73 = 0;
    unsigned int v88 = 0;
    unsigned int v26 = (v93 - 1 + v20) >> v85;
    unsigned int v27 = (v93 - 1 + v19) >> v85;
    unsigned int v28 = 32 - __clz(v27 - 1);
    if (v27 >= 2) {
      unsigned int v29 = v28;
    }
    else {
      unsigned int v29 = 0;
    }
    unsigned int v30 = 32 - __clz(v26 - 1);
    if (v26 < 2) {
      unsigned int v30 = 0;
    }
    if (v30 >= v29) {
      uint64_t v31 = v29;
    }
    else {
      uint64_t v31 = v30;
    }
    char v32 = 5;
    if (v17) {
      char v32 = 3;
    }
    char v77 = v32;
    char v78 = 2 * v31;
    uint64_t v75 = (v31 + 1) & 0x1FFFFFFFELL;
    uint64x2_t v74 = (uint64x2_t)vdupq_n_s64(v31 - 1);
    uint64_t v71 = v93 * v20;
    int v33 = 2 * v20;
    int64x2_t v34 = vdupq_n_s64(2uLL);
    int v72 = 1;
    int64x2_t v76 = v34;
    int v79 = v31;
    do
    {
      if (v20)
      {
        uint64_t v35 = 0;
        unint64_t v36 = v88 >> v85;
        int v84 = v36 * ((v93 - 1 + v20) >> v85);
        uint64x2_t v37 = (uint64x2_t)vdupq_n_s64(v36);
        uint64_t v38 = v73;
        int v39 = v72;
        uint64x2_t v83 = v37;
        do
        {
          unint64_t v40 = v35 >> v85;
          if (v31)
          {
            uint64x2_t v41 = (uint64x2_t)vdupq_n_s64(v40);
            int8x16_t v42 = 0uLL;
            uint64_t v43 = v75;
            int64x2_t v44 = (int64x2_t)xmmword_262C13600;
            do
            {
              int8x16_t v45 = v42;
              int64x2_t v46 = v44;
              uint64x2_t v47 = (uint64x2_t)vnegq_s64(v44);
              int8x16_t v48 = (int8x16_t)vdupq_n_s64(1uLL);
              int8x16_t v49 = (int8x16_t)vaddq_s64(v46, v46);
              int8x16_t v42 = vorrq_s8(vorrq_s8((int8x16_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v41, v47), v48), (uint64x2_t)v49), (int8x16_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v37, v47), v48), (uint64x2_t)vorrq_s8(v49, v48))), v45);
              int64x2_t v44 = vaddq_s64(v46, v34);
              v43 -= 2;
            }
            while (v43);
            int8x16_t v50 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v46, v74), v45, v42);
            int8x8_t v51 = vorr_s8(*(int8x8_t *)v50.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v50, v50, 8uLL));
          }
          else
          {
            int8x8_t v51 = 0;
          }
          int v52 = 0;
          v53 = (unsigned __int8 *)(v82 + (v40 + v84) * v80);
          long long v54 = (unsigned char *)(v81 + ((*(void *)&v51 | ((v40 | (v88 >> v85)) >> v31 << v78)) << v77));
          uint64_t v87 = v38;
          int v86 = v39;
          uint64_t v89 = v35;
          do
          {
            int v55 = 0;
            int v92 = v52;
            int v56 = v52 + v88;
            uint64_t v91 = v38;
            int v90 = v39;
            do
            {
              int v96 = v55;
              v97 = v54;
              uint64_t v57 = 0;
              uint64_t v95 = v38;
              int v58 = v38;
              int v94 = v39;
              int v59 = v39;
              uint64_t v60 = 4;
              do
              {
                uint64_t v61 = 0;
                unsigned int v62 = v59;
                uint64_t v63 = v60;
                do
                {
                  if (v56 + (int)v57 >= v19 || (int)v35 + (int)v61 >= v20)
                  {
                    *(_DWORD *)&v99[v63 + 4652] = 0;
                    if (v17) {
                      *(unsigned int *)((char *)v100[0][0] + v63) = 0;
                    }
                  }
                  else if (v17)
                  {
                    uint64_t v64 = v62 - 1;
                    if (v18 == 8)
                    {
                      int v65 = *(unsigned __int8 *)(v21 + v64);
                      int v66 = *(unsigned __int8 *)(v21 + v62);
                    }
                    else
                    {
                      int v65 = *(unsigned __int16 *)(v21 + 2 * v64);
                      int v66 = *(unsigned __int16 *)(v21 + 2 * v62);
                    }
                    v69 = (unsigned int *)((char *)v100[0][0] + v63);
                    *(v69 - 1) = v65;
                    _DWORD *v69 = v66;
                  }
                  else
                  {
                    uint64_t v67 = (v58 + v61);
                    if (v18 == 8) {
                      int v68 = *(unsigned __int8 *)(v21 + v67);
                    }
                    else {
                      int v68 = *(unsigned __int16 *)(v21 + 2 * v67);
                    }
                    *(_DWORD *)&v99[v63 + 4652] = v68;
                  }
                  ++v61;
                  v63 += 16;
                  v62 += 2;
                }
                while (v61 != 8);
                ++v57;
                v60 += 128;
                v59 += v33;
                v58 += v20;
              }
              while (v57 != 4);
              *(void *)v98 = 0;
              interchange_compression::compressor::compress((interchange_compression::compressor *)v99, (unsigned int (*)[4][8][4])v100, 8u, 4u, v53, &v98[1], v98);
              int v33 = 2 * v20;
              uint64_t v70 = v98[0];
              unsigned char *v97 = v98[1];
              long long v54 = v97 + 1;
              v53 += v70;
              int v55 = v96 + 8;
              LODWORD(v35) = v35 + 8;
              int v39 = v94 + 16;
              uint64_t v38 = v95 + 8;
            }
            while (v96 + 8 < v93);
            int v52 = v92 + 4;
            int v39 = v90 + 8 * v20;
            uint64_t v38 = v91 + 4 * v20;
            LODWORD(v35) = v89;
          }
          while (v92 + 4 < v93);
          uint64_t v35 = v89 + v93;
          int v39 = v86 + 2 * v93;
          uint64_t v38 = v87 + v93;
          LODWORD(v31) = v79;
          int64x2_t v34 = v76;
          uint64x2_t v37 = v83;
        }
        while ((int)v89 + (int)v93 < v20);
      }
      v72 += 2 * v71;
      v73 += v71;
      v88 += v93;
    }
    while (v88 < v19);
  }
}

void interchange_compression::compressor::compress(interchange_compression::compressor *this, unsigned int (*a2)[4][8][4], unsigned int a3, unsigned int a4, unsigned __int8 *a5, unsigned int *a6, unsigned int *a7)
{
  uint64_t v328 = *MEMORY[0x263EF8340];
  if (a3 - 9 <= 0xFFFFFFF7) {
    interchange_compression::compressor::compress();
  }
  if (a4 - 5 <= 0xFFFFFFFB) {
    interchange_compression::compressor::compress();
  }
  uint64_t v8 = this;
  uint64_t v9 = (char *)this + 4652;
  if (!interchange_compression::compressor::check_valid_predictors(this, a3, a4) || *v9)
  {
    int v10 = 0;
    unsigned int v11 = *((_DWORD *)v8 + 1150);
    int v12 = &interchange_compression::memory_parameters[11 * v11];
    int v13 = 8 * v12[5];
    unsigned int v14 = v12[7];
    goto LABEL_6;
  }
  if (*((_DWORD *)v8 + 1150) == 27)
  {
    int v264 = 0;
    v265 = a2;
  }
  else
  {
    unint64_t v266 = 0;
    int v264 = 0;
    v267 = (char *)v8 + 196;
    v265 = a2;
    do
    {
      interchange_compression::compressor::compute_deltas(v8, v266, a2, a3, a4);
      unsigned int v268 = interchange_compression::compressor::compute_smallest_predictor(v8, v266, a3, a4);
      v301[v266] = v268;
      v264 += vaddvq_s32(vmulq_s32(*(int32x4_t *)&v267[212 * v268], (int32x4_t)xmmword_262C13610));
      ++v266;
      v267 += 1060;
    }
    while (v266 < *(unsigned int *)&interchange_compression::format_table[52 * *((unsigned int *)v8 + 1150) + 8]);
  }
  int header = interchange_compression::compressor::create_header(v8, (unsigned int (*)[4])v301, v265);
  unsigned int v11 = *((_DWORD *)v8 + 1150);
  unsigned int v14 = interchange_compression::memory_parameters[11 * v11 + 7];
  int v13 = v264 + header + v14 - 8;
  if (v11 != 27)
  {
    int v270 = 0;
    if (*(_DWORD *)&interchange_compression::format_table[52 * v11 + 8] <= 1u) {
      int v271 = 1;
    }
    else {
      int v271 = *(_DWORD *)&interchange_compression::format_table[52 * v11 + 8];
    }
    v272 = (_DWORD *)((char *)v8 + 4272);
    int v10 = 1;
    while (1)
    {
      if (!*v272) {
        interchange_compression::compressor::compress();
      }
      int v273 = *((unsigned __int8 *)v272 - 4);
      if ((~v273 & 3) != 0) {
        break;
      }
      if ((v273 & 0x10) != 0)
      {
        if (*((_DWORD *)v8 + 1154) != 2) {
          break;
        }
        BOOL v274 = 0;
        if (v11 != 21 || v270 != 1 || (v273 & 4) != 0) {
          goto LABEL_352;
        }
      }
      else if ((v273 & 4) != 0)
      {
        break;
      }
      BOOL v274 = (v273 & 8) == 0;
LABEL_352:
      v10 &= v274;
      ++v270;
      v272 += 3;
      if (v271 == v270) {
        goto LABEL_6;
      }
    }
    BOOL v274 = 0;
    goto LABEL_352;
  }
  int v10 = 1;
  unsigned int v11 = 27;
LABEL_6:
  size_t v15 = interchange_compression::memory_parameters[11 * v11 + 5];
  if (v15 >> v14 <= 1) {
    unsigned int v16 = 1;
  }
  else {
    unsigned int v16 = v15 >> v14;
  }
  unsigned int v17 = (v16 - 1 + ((v13 + 7) >> 3)) / v16;
  unsigned int v18 = v16 * v17;
  uint64_t v19 = *((unsigned int *)v8 + 1151);
  if (v19)
  {
    unint64_t v20 = interchange_compression::lossy_parameters[28 * v11 + 8 + v19];
    if (v18 > v20)
    {
      BOOL v21 = 1;
      if (!*v9) {
        BOOL v21 = v9[1] != 0;
      }
      unsigned int v22 = 0;
      uint64_t v23 = 0;
      unint64_t v276 = v20 >> 2;
      int v297 = 16843009 * v21;
      uint32x4_t v24 = (uint32x4_t)xmmword_262C13640;
      v25.i64[0] = 0x100000001;
      v25.i64[1] = 0x100000001;
      uint32x4_t v26 = (uint32x4_t)xmmword_262C13630;
      uint32x4_t v27 = (uint32x4_t)xmmword_262C13620;
      unsigned int v28 = a2;
      v275 = v8;
      v278 = a7;
      while (1)
      {
        uint64_t v29 = 0;
        unsigned int v30 = *((_DWORD *)v8 + 1150);
        uint64_t v31 = *(unsigned int *)&interchange_compression::format_table[52 * v30 + 8];
        uint64_t v32 = v31 <= 1 ? 1 : v31;
        uint64_t v292 = v23;
        uint64_t v293 = v32;
        size_t v33 = 4 * v32;
        unsigned int v34 = v22;
        do
        {
          if (v30 != 27)
          {
            uint32x4_t v35 = (uint32x4_t)vdupq_n_s32(v34);
            int8x16_t v36 = (int8x16_t)vshlq_u32((uint32x4_t)vandq_s8((int8x16_t)vshlq_u32(v35, v27), v25), v26);
            int8x16_t v37 = (int8x16_t)vshlq_u32((uint32x4_t)vandq_s8((int8x16_t)vshlq_u32(v35, v24), v25), v26);
            memcpy(&v300[v29], (*v28)[(unint64_t)(vorr_s8(*(int8x8_t *)v36.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v36, v36, 8uLL)).u32[0] | v36.i32[1])][vorr_s8(*(int8x8_t *)v37.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v37, v37, 8uLL)).u32[0] | v37.i32[1]], v33);
            uint32x4_t v27 = (uint32x4_t)xmmword_262C13620;
            uint32x4_t v26 = (uint32x4_t)xmmword_262C13630;
            v25.i64[0] = 0x100000001;
            v25.i64[1] = 0x100000001;
            uint32x4_t v24 = (uint32x4_t)xmmword_262C13640;
          }
          ++v34;
          v29 += 16;
        }
        while (v29 != 128);
        unsigned int v296 = v30;
        unsigned int v38 = (2 * v292) & 0x3FFFFFFC;
        unsigned int v39 = (2 * v292) & 2;
        unsigned int v40 = v38 + 4;
        BOOL v72 = a3 >= v38;
        unsigned __int32 v41 = a3 - v38;
        if (!v72) {
          unsigned __int32 v41 = 0;
        }
        if (v40 <= a3) {
          unsigned __int32 v42 = 4;
        }
        else {
          unsigned __int32 v42 = v41;
        }
        unsigned int v43 = v39 + 2;
        BOOL v72 = a4 >= v39;
        unsigned __int32 v44 = a4 - v39;
        if (!v72) {
          unsigned __int32 v44 = 0;
        }
        if (v43 <= a4) {
          unsigned __int32 v45 = 2;
        }
        else {
          unsigned __int32 v45 = v44;
        }
        uint64_t v289 = *((unsigned int *)v8 + 1151);
        uint64_t v286 = (v289 - 1);
        if (v286 > 2) {
          interchange_compression::compressor::compress();
        }
        unsigned int v277 = v22;
        int v46 = *((_DWORD *)v8 + 1152);
        unsigned int v294 = v46 & 0xFFFFFFFE;
        if (v30 != 27) {
          break;
        }
LABEL_33:
        *(void *)v320 = 0;
        uint64_t v321 = 0;
        memset(v319, 0, sizeof(v319));
        v318[0] = interchange_compression::get_id((interchange_compression *)*(unsigned int *)&interchange_compression::format_table[52 * v30 + 12]);
        uint64x2_t v47 = (unsigned int *)&interchange_compression::format_table[52 * v30];
        v318[1] = interchange_compression::get_id((interchange_compression *)v47[4]);
        v318[2] = interchange_compression::get_id((interchange_compression *)v47[5]);
        v318[3] = interchange_compression::get_id((interchange_compression *)v47[6]);
        interchange_compression::derive_sharing(v31, (uint64_t)v318, v327, v320, (int (*)[4])v319, v48);
        if (v30 == 27)
        {
          uint64_t v314 = 0;
          uint64_t v315 = 0;
          long long v312 = 0u;
          long long v313 = 0u;
          long long v310 = 0u;
          long long v311 = 0u;
          long long v308 = 0u;
          long long v309 = 0u;
          long long v307 = 0u;
          int v49 = *((unsigned __int8 *)&v298[-1] + v292);
          goto LABEL_258;
        }
        uint64_t v97 = 0;
        if (v42) {
          BOOL v98 = v45 == 0;
        }
        else {
          BOOL v98 = 1;
        }
        int v99 = v98;
        int v284 = v99;
        v100 = v322;
        do
        {
          unsigned int v101 = *(_DWORD *)&interchange_compression::format_table[52 * v296 + 12 + 4 * v97];
          uint64_t id = interchange_compression::get_id((interchange_compression *)v101);
          int v103 = id;
          int v104 = v327[v97];
          v105 = &interchange_compression::dq_consts[160 * id + 10 * v104];
          unint64_t v291 = *((void *)v105 + 1);
          int v106 = interchange_compression::dq_lossy_level[3 * id + v286];
          int v107 = v105[4];
          LODWORD(v105) = v105[5];
          v108 = &v317[v97];
          _DWORD *v108 = v106 + v107;
          v109 = &v316[v97];
          unsigned int *v109 = v105 + v106;
          int v110 = v320[v97];
          int v111 = v319[v97];
          interchange_compression::adjust_level(id, v104, v110, v111, v108, v109, v112);
          if (v103 == 5 && v104 == 1 && v111 - v110 <= 1) {
            *((unsigned char *)&v298[-1] + v292) = 1;
          }
          v115.i64[0] = 0x100000001;
          v115.i64[1] = 0x100000001;
          if (v46 == 1)
          {
            uint64_t v116 = 0;
            if (v103 == 4) {
              int v117 = 2139095040;
            }
            else {
              int v117 = 0;
            }
            if (v103 == 3) {
              int v117 = 31744;
            }
            int v118 = *((unsigned __int8 *)&v298[-1] + v292);
            v119 = v100;
            do
            {
              uint32x4_t v120 = (uint32x4_t)vdupq_n_s32(v116);
              int8x16_t v121 = (int8x16_t)vshlq_u32((uint32x4_t)vandq_s8((int8x16_t)vshlq_u32(v120, (uint32x4_t)xmmword_262C13640), v115), (uint32x4_t)xmmword_262C13630);
              int8x16_t v122 = (int8x16_t)vshlq_u32((uint32x4_t)vandq_s8((int8x16_t)vshlq_u32(v120, (uint32x4_t)xmmword_262C13620), v115), (uint32x4_t)xmmword_262C13630);
              unsigned __int32 v123 = vorr_s8(*(int8x8_t *)v121.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v121, v121, 8uLL)).u32[0] | v121.i32[1];
              if ((vorr_s8(*(int8x8_t *)v122.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v122, v122, 8uLL)).u32[0] | v122.i32[1]) < v45
                && v123 < v42)
              {
                BOOL v126 = (v117 & ~*v119) == 0 || *v119 == 1 << (v101 - 1);
                v118 |= v126;
                *((unsigned char *)&v298[-1] + v292) = v118;
              }
              ++v116;
              v119 += 4;
            }
            while (v116 != 8);
          }
          if (v284) {
            *((unsigned char *)&v298[-1] + v292) = 1;
          }
          if (v291 >> v316[v97] > 1 << interchange_compression::lossy_parameters[28 * v296 + 12 + 4 * v289 + v97]) {
            *((unsigned char *)&v298[-1] + v292) = 1;
          }
          ++v97;
          ++v100;
        }
        while (v97 != v293);
        uint64_t v127 = 0;
        uint64_t v314 = 0;
        uint64_t v315 = 0;
        long long v312 = 0u;
        long long v313 = 0u;
        long long v310 = 0u;
        long long v311 = 0u;
        long long v308 = 0u;
        long long v309 = 0u;
        v128 = v324;
        v129 = v322;
        long long v307 = 0u;
        do
        {
          unsigned int v130 = *(_DWORD *)&interchange_compression::format_table[52 * v296 + 12 + 4 * v127];
          int v131 = interchange_compression::get_id((interchange_compression *)v130);
          uint64_t v132 = 0;
          unsigned int v133 = v327[v127];
          unsigned int v134 = v317[v127];
          if (v130 < v134) {
            unsigned int v134 = v130;
          }
          v317[v127] = v134;
          v135 = &interchange_compression::dq_consts[160 * v131 + 10 * v133];
          if (v135[5]) {
            unsigned int v136 = v130;
          }
          else {
            unsigned int v136 = 0;
          }
          if (v136 >= v316[v127]) {
            unsigned int v136 = v316[v127];
          }
          v316[v127] = v136;
          unint64_t v137 = *((void *)v135 + 1);
          uint64_t v138 = v325[v127] & (-1 << (v130 - v134));
          *((_DWORD *)&v314 + v127) = v138;
          if (v137 >> v136 <= 1) {
            uint64_t v139 = 1;
          }
          else {
            uint64_t v139 = v137 >> v136;
          }
          v140 = v129;
          v141.i64[0] = 0x100000001;
          v141.i64[1] = 0x100000001;
          do
          {
            int v142 = *v140;
            v140 += 4;
            int v143 = v142 - v138;
            uint32x4_t v144 = (uint32x4_t)vdupq_n_s32(v132);
            int8x16_t v145 = (int8x16_t)vshlq_u32((uint32x4_t)vandq_s8((int8x16_t)vshlq_u32(v144, (uint32x4_t)xmmword_262C13640), v141), (uint32x4_t)xmmword_262C13630);
            int8x16_t v146 = (int8x16_t)vshlq_u32((uint32x4_t)vandq_s8((int8x16_t)vshlq_u32(v144, (uint32x4_t)xmmword_262C13620), v141), (uint32x4_t)xmmword_262C13630);
            unsigned __int32 v147 = vorr_s8(*(int8x8_t *)v146.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v146, v146, 8uLL)).u32[0] | v146.i32[1];
            if ((vorr_s8(*(int8x8_t *)v145.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v145, v145, 8uLL)).u32[0] | v145.i32[1]) >= v42
              || v147 >= v45)
            {
              int v143 = 0;
            }
            *(_DWORD *)&v128[4 * v132++] = v143;
          }
          while (v132 != 8);
          if (v130 == 2 && v137 >> v136 > 1) {
            interchange_compression::compressor::compress();
          }
          uint64_t v149 = 0;
          unsigned int v150 = 0;
          unsigned int v151 = ~(-1 << v130);
          unsigned int v152 = 1 << (v130 - 1);
          uint64_t v153 = 2 * v139 - 1;
          uint64_t v154 = v326[v127];
          int v49 = *((unsigned __int8 *)&v298[-1] + v292);
          if (v139 >= 0) {
            uint64_t v155 = v139;
          }
          else {
            uint64_t v155 = v139 + 1;
          }
          uint64_t v285 = v155 >> 1;
          uint64_t v287 = v139 + v152;
          unint64_t v156 = v137 + v138;
          unint64_t v157 = 1 << v130;
          unint64_t v158 = (1 << v130) - 1;
          uint64_t v159 = (1 << v130) - 1;
          v160 = v129;
          do
          {
            if (v154 == v149) {
              goto LABEL_240;
            }
            if (v136) {
              uint64_t v161 = *(unsigned int *)&v128[4 * v149] / v139;
            }
            else {
              LODWORD(v161) = 0;
            }
            v162 = (int *)&v307 + 7 * v127 + v150;
            int *v162 = v161;
            if (v139 < 2)
            {
              int v165 = 0;
              goto LABEL_200;
            }
            unint64_t v163 = *(unsigned int *)&v128[4 * v149];
            if (v163)
            {
              if (!(v163 % v139) && ((v163 / v139) & 1) != 0)
              {
                if (!v138 && v161 == 1)
                {
                  int v165 = 0;
                  uint64_t v166 = *v160;
                  if (((v139 ^ v166) & v153) != 0)
                  {
                    int v167 = 0;
                    goto LABEL_201;
                  }
                  goto LABEL_246;
                }
                if (v294 != 2)
                {
                  BOOL v191 = 0;
                  goto LABEL_256;
                }
                uint64_t v190 = *v160;
                if (v190 != v152)
                {
                  BOOL v191 = v287 == v190;
LABEL_256:
                  int v165 = !v191;
                  goto LABEL_196;
                }
              }
            }
            int v165 = 0;
LABEL_196:
            LODWORD(v166) = *v160;
            if (((v139 ^ *v160 ^ v138) & v153) != 0) {
              goto LABEL_200;
            }
            if (v138) {
              goto LABEL_247;
            }
LABEL_246:
            if (v139 != v163)
            {
LABEL_247:
              if (v294 != 2)
              {
                BOOL v189 = 0;
                goto LABEL_254;
              }
              if (v166 != v152)
              {
                BOOL v189 = v287 == v166;
LABEL_254:
                int v167 = !v189;
                goto LABEL_201;
              }
            }
LABEL_200:
            int v167 = 0;
LABEL_201:
            uint32x4_t v168 = (uint32x4_t)vdupq_n_s32(v149);
            int8x16_t v169 = (int8x16_t)vshlq_u32((uint32x4_t)vandq_s8((int8x16_t)vshlq_u32(v168, (uint32x4_t)xmmword_262C13640), v141), (uint32x4_t)xmmword_262C13630);
            int8x16_t v170 = (int8x16_t)vshlq_u32((uint32x4_t)vandq_s8((int8x16_t)vshlq_u32(v168, (uint32x4_t)xmmword_262C13620), v141), (uint32x4_t)xmmword_262C13630);
            unsigned __int32 v171 = vorr_s8(*(int8x8_t *)v169.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v169, v169, 8uLL)).u32[0] | v169.i32[1];
            int v172 = v165 ^ v167;
            if ((vorr_s8(*(int8x8_t *)v170.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v170, v170, 8uLL)).u32[0] | v170.i32[1]) < v45
              && v171 < v42
              && v172 != 0)
            {
              interchange_compression::compressor::compress();
            }
            if (v165)
            {
              LODWORD(v161) = v161 - 1;
              int *v162 = v161;
            }
            if ((unint64_t)v161 >> v136 || *v160 == v151)
            {
              int *v162 = ~(-1 << v136);
              LODWORD(v161) = ~(-1 << v136);
            }
            uint32x4_t v175 = (uint32x4_t)vdupq_n_s32(v149);
            int8x16_t v176 = (int8x16_t)vshlq_u32((uint32x4_t)vandq_s8((int8x16_t)vshlq_u32(v175, (uint32x4_t)xmmword_262C13640), v141), (uint32x4_t)xmmword_262C13630);
            int8x16_t v177 = (int8x16_t)vshlq_u32((uint32x4_t)vandq_s8((int8x16_t)vshlq_u32(v175, (uint32x4_t)xmmword_262C13620), v141), (uint32x4_t)xmmword_262C13630);
            unsigned __int32 v178 = vorr_s8(*(int8x8_t *)v176.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v176, v176, 8uLL)).u32[0] | v176.i32[1];
            if ((vorr_s8(*(int8x8_t *)v177.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v177, v177, 8uLL)).u32[0] | v177.i32[1]) >= v45
              || v178 >= v42)
            {
              LODWORD(v161) = 0;
              int *v162 = 0;
            }
            if (!v49)
            {
              uint32x4_t v180 = (uint32x4_t)vdupq_n_s32(v149);
              int8x16_t v181 = (int8x16_t)vshlq_u32((uint32x4_t)vandq_s8((int8x16_t)vshlq_u32(v180, (uint32x4_t)xmmword_262C13640), v141), (uint32x4_t)xmmword_262C13630);
              int8x16_t v182 = (int8x16_t)vshlq_u32((uint32x4_t)vandq_s8((int8x16_t)vshlq_u32(v180, (uint32x4_t)xmmword_262C13620), v141), (uint32x4_t)xmmword_262C13630);
              unsigned __int32 v183 = vorr_s8(*(int8x8_t *)v181.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v181, v181, 8uLL)).u32[0] | v181.i32[1];
              if ((vorr_s8(*(int8x8_t *)v182.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v182, v182, 8uLL)).u32[0] | v182.i32[1]) < v45
                && v183 < v42)
              {
                unint64_t v185 = 0;
                if (v136)
                {
                  if (v161 | v138)
                  {
                    if (v156 < v157 || (unint64_t v185 = v158, v161 != ~(-1 << v136))) {
                      unint64_t v185 = v285 + v139 * v161;
                    }
                  }
                }
                unint64_t v186 = *v160;
                if (v185 + v138 >= v157) {
                  uint64_t v187 = v159;
                }
                else {
                  uint64_t v187 = v185 + v138;
                }
                LODWORD(v188) = v186 - v187;
                if ((int)v186 - (int)v187 >= 0) {
                  unint64_t v188 = v188;
                }
                else {
                  unint64_t v188 = (v187 - v186);
                }
                if (v188 >> interchange_compression::lossy_parameters[28 * v296 + 12 + 4 * v289 + v127]) {
                  interchange_compression::compressor::compress();
                }
                if (v158 <= v186 && v187 != v186) {
                  interchange_compression::compressor::compress();
                }
              }
            }
            ++v150;
LABEL_240:
            ++v149;
            v160 += 4;
          }
          while (v149 != 8);
          ++v127;
          v128 += 32;
          ++v129;
        }
        while (v127 != v293);
LABEL_258:
        unsigned int v192 = v296;
        unint64_t v193 = interchange_compression::lossy_parameters[28 * v296 + 8 + v289];
        v304 = &a5[v292 * v276];
        int v303 = v193 >> 2;
        int v288 = 2 * (v193 & 0x1FFFFFFF);
        uint64_t v305 = 0;
        char v306 = 0;
        bzero(v304, v193 >> 2);
        if (v49)
        {
          uint64_t v195 = 0;
          int v196 = 0;
          v290 = &interchange_compression::lossy_parameters[28 * v296 + 12 + 4 * v289];
          v197 = v322;
          uint32x4_t v26 = (uint32x4_t)xmmword_262C13630;
          uint32x4_t v24 = (uint32x4_t)xmmword_262C13640;
          v25.i64[0] = 0x100000001;
          v25.i64[1] = 0x100000001;
          uint32x4_t v27 = (uint32x4_t)xmmword_262C13620;
          do
          {
            v295 = v197;
            if (v296 != 27)
            {
              uint32x4_t v198 = (uint32x4_t)vdupq_n_s32(v195);
              int8x16_t v199 = (int8x16_t)vshlq_u32((uint32x4_t)vandq_s8((int8x16_t)vshlq_u32(v198, v24), v25), v26);
              int8x16_t v200 = (int8x16_t)vshlq_u32((uint32x4_t)vandq_s8((int8x16_t)vshlq_u32(v198, v27), v25), v26);
              unsigned __int32 v201 = vorr_s8(*(int8x8_t *)v199.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v199, v199, 8uLL)).u32[0] | v199.i32[1];
              BOOL v203 = (vorr_s8(*(int8x8_t *)v200.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v200, v200, 8uLL)).u32[0] | v200.i32[1]) >= v45
                  || v201 >= v42;
              v205 = v290;
              v204 = (int *)&interchange_compression::format_table[52 * v296 + 12];
              uint64_t v206 = v293;
              do
              {
                int v208 = *v205++;
                int v207 = v208;
                if (v203)
                {
                  int v209 = 0;
                  int v210 = *v204;
                }
                else
                {
                  int v209 = *v197 >> v207;
                  int v210 = *v204;
                  if (*v204 == 2)
                  {
                    if (v209 != *v197) {
                      interchange_compression::compressor::compress();
                    }
                    int v210 = 2;
                    int v209 = *v197;
                  }
                }
                int v211 = v210 - v207;
                bit_pack::pack((bit_pack *)v302, v209, v210 - v207);
                v196 += v211;
                ++v204;
                ++v197;
                --v206;
                uint32x4_t v26 = (uint32x4_t)xmmword_262C13630;
                uint32x4_t v24 = (uint32x4_t)xmmword_262C13640;
                v25.i64[0] = 0x100000001;
                v25.i64[1] = 0x100000001;
                uint32x4_t v27 = (uint32x4_t)xmmword_262C13620;
              }
              while (v206);
            }
            ++v195;
            v197 = v295 + 4;
          }
          while (v195 != 8);
          uint64_t v8 = v275;
          v212 = v278;
          if (v196 != v288) {
            interchange_compression::compressor::compress();
          }
        }
        else
        {
          uint64_t v8 = v275;
          int v213 = 0;
          if (v296 == 27)
          {
            v212 = v278;
          }
          else
          {
            v214 = (unsigned int *)&interchange_compression::format_table[52 * v296 + 12];
            v215 = v325;
            v216 = v327;
            v217 = v214;
            uint64_t v218 = v293;
            v212 = v278;
            do
            {
              *(void *)v299 = 0;
              unsigned int v220 = *v217++;
              uint64_t v219 = v220;
              unsigned int v222 = *v216++;
              unsigned int v221 = v222;
              int v223 = *v215++;
              interchange_compression::encode_mode(v219, v221, v223, (int *)&v299[1], &v298[1], v299, v298, v194);
              unsigned int v224 = v299[1];
              bit_pack::pack((bit_pack *)v302, v299[0], v299[1]);
              v213 += v224;
              --v218;
            }
            while (v218);
            v225 = v325;
            v226 = v327;
            v227 = (unsigned int *)&interchange_compression::format_table[52 * v296 + 12];
            uint64_t v228 = v293;
            do
            {
              unsigned int v230 = *v227++;
              uint64_t v229 = v230;
              unsigned int v232 = *v226++;
              unsigned int v231 = v232;
              BOOL v233 = (v229 & 0xFFFFFFFD) != 8 || v231 >= 3;
              if (!v233 || (v229 == 12 ? (BOOL v234 = v231 > 3) : (BOOL v234 = 1), !v234))
              {
                *(void *)v298 = 0;
                interchange_compression::encode_mode(v229, v231, *v225, (int *)&v299[1], &v298[1], v299, v298, v194);
                unsigned int v235 = v298[1];
                bit_pack::pack((bit_pack *)v302, v298[0], v298[1]);
                v213 += v235;
              }
              ++v225;
              --v228;
            }
            while (v228);
            v236 = v317;
            v237 = &v314;
            v238 = v327;
            uint64_t v239 = v293;
            do
            {
              int v241 = *v238++;
              int v240 = v241;
              unsigned int v243 = *v214++;
              unsigned int v242 = v243;
              if (v240) {
                BOOL v244 = 1;
              }
              else {
                BOOL v244 = v242 == 2;
              }
              if (v244 || v242 >= 0x10)
              {
                int v246 = *v236;
                bit_pack::pack((bit_pack *)v302, *(_DWORD *)v237 >> (v242 - *v236), *v236);
                v213 += v246;
              }
              ++v236;
              v237 = (uint64_t *)((char *)v237 + 4);
              --v239;
            }
            while (v239);
            v247 = (int *)v326;
            v248 = v316;
            uint64_t v249 = v293;
            unsigned int v192 = v296;
            do
            {
              if (*v248++)
              {
                bit_pack::pack((bit_pack *)v302, *v247, 3);
                v213 += 3;
              }
              ++v247;
              --v249;
            }
            while (v249);
          }
          unsigned int v251 = (v288 - v213) / 7u;
          bit_pack::pack((bit_pack *)v302, 0, (v288 - v213) % 7u);
          uint64_t v252 = 0;
          v253 = &v307;
          do
          {
            if (v192 == 27)
            {
              unsigned int v254 = 0;
            }
            else
            {
              unsigned int v254 = 0;
              v255 = v316;
              v256 = (int *)v253;
              uint64_t v257 = v293;
              do
              {
                int v259 = *v255++;
                int v258 = v259;
                if (v259)
                {
                  bit_pack::pack((bit_pack *)v302, *v256, v258);
                  v254 += v258;
                }
                v256 += 7;
                --v257;
              }
              while (v257);
              unsigned int v192 = v296;
              if (v254 > v251) {
                interchange_compression::compressor::compress();
              }
            }
            bit_pack::pack((bit_pack *)v302, 0, v251 - v254);
            uint32x4_t v27 = (uint32x4_t)xmmword_262C13620;
            uint32x4_t v26 = (uint32x4_t)xmmword_262C13630;
            v25.i64[0] = 0x100000001;
            v25.i64[1] = 0x100000001;
            uint32x4_t v24 = (uint32x4_t)xmmword_262C13640;
            ++v252;
            v253 = (long long *)((char *)v253 + 4);
          }
          while (v252 != 7);
        }
        if (v305 != v288) {
          interchange_compression::compressor::compress();
        }
        uint64_t v23 = v292 + 1;
        unsigned int v22 = v277 + 8;
        unsigned int v28 = a2;
        if (v292 == 3)
        {
          *a6 = (8 * HIBYTE(v297)) | (4 * BYTE2(v297)) | (2 * BYTE1(v297)) | v297 | 0xF0;
          unsigned int *v212 = interchange_compression::lossy_parameters[28 * *((unsigned int *)v8 + 1150)
                                                          + 8
                                                          + *((unsigned int *)v8 + 1151)];
          return;
        }
      }
      uint64_t v50 = 0;
      int8x8_t v51 = v322;
      int v52 = v300;
      do
      {
        uint64_t v53 = 0;
        int v54 = 1 << (*(_DWORD *)&interchange_compression::format_table[52 * v30 + 12 + 4 * v50] - 1);
        if (v294 != 2) {
          int v54 = 0;
        }
        do
        {
          int v55 = *(_DWORD *)&v52[v53 * 4] ^ v54;
          if (v55 == 1 && v46 == 3) {
            int v55 = 0;
          }
          v51[v53] = v55;
          v53 += 4;
        }
        while (v53 != 32);
        ++v50;
        ++v51;
        v52 += 4;
      }
      while (v50 != v293);
      uint64_t v57 = 0;
      unint64_t v58 = 0x7BFFF00uLL >> v30;
      int v59 = &v323;
      while (1)
      {
        unsigned int v60 = *(_DWORD *)&interchange_compression::format_table[52 * v30 + 12 + 4 * v57];
        unsigned int v61 = interchange_compression::get_id((interchange_compression *)v60);
        v62.i64[0] = 0x100000001;
        v62.i64[1] = 0x100000001;
        unsigned int v63 = v322[v57];
        uint64_t v64 = (unsigned int *)&v324[4 * v57 + 128];
        v325[v57] = v63;
        *uint64_t v64 = v63;
        v326[v57] = 0;
        uint64_t v65 = -7;
        int v66 = (unsigned int *)v59;
        unsigned int v67 = v63;
        do
        {
          uint32x4_t v68 = (uint32x4_t)vdupq_n_s32((int)v65 + 8);
          int8x16_t v69 = (int8x16_t)vshlq_u32((uint32x4_t)vandq_s8((int8x16_t)vshlq_u32(v68, (uint32x4_t)xmmword_262C13640), v62), (uint32x4_t)xmmword_262C13630);
          int8x16_t v70 = (int8x16_t)vshlq_u32((uint32x4_t)vandq_s8((int8x16_t)vshlq_u32(v68, (uint32x4_t)xmmword_262C13620), v62), (uint32x4_t)xmmword_262C13630);
          unsigned __int32 v71 = vorr_s8(*(int8x8_t *)v69.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v69, v69, 8uLL)).u32[0] | v69.i32[1];
          BOOL v72 = (vorr_s8(*(int8x8_t *)v70.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v70, v70, 8uLL)).u32[0] | v70.i32[1]) >= v45
             || v71 >= v42;
          if (!v72)
          {
            unsigned int v73 = *v66;
            if (*v66 < v67)
            {
              v326[v57] = v65 + 8;
              v325[v57] = v73;
              unsigned int v67 = v73;
            }
            if (v63 >= v73) {
              uint64x2_t v74 = (unsigned int *)&v324[4 * v57 + 128];
            }
            else {
              uint64x2_t v74 = v66;
            }
            unsigned int v63 = *v74;
            *uint64_t v64 = v63;
          }
          v66 += 4;
          BOOL v72 = __CFADD__(v65++, 1);
        }
        while (!v72);
        unsigned int v75 = 1 << (v60 - 1);
        unsigned int v76 = v63 - v67;
        for (int i = 31; i != -1; --i)
        {
          if ((v76 >> i)) {
            break;
          }
        }
        HIDWORD(v79) = v60;
        LODWORD(v79) = v60 - 2;
        unsigned int v78 = v79 >> 1;
        if (v78 < 8 && ((0xB9u >> v78) & 1) != 0)
        {
          int v80 = dword_262C16450[v78];
        }
        else
        {
          if (v60 != 32) {
            interchange_compression::compressor::compress();
          }
          int v80 = -1;
        }
        unsigned int v81 = i + 1;
        int v82 = (v81 & 1) + (v81 >> 1);
        if (v60 != 32) {
          int v82 = i + 1;
        }
        if (i) {
          BOOL v83 = 0;
        }
        else {
          BOOL v83 = v60 == 2;
        }
        if (v83) {
          int v82 = 2;
        }
        BOOL v84 = v60 == 10;
        BOOL v85 = v60 == 12;
        if (i == -1)
        {
          BOOL v84 = 0;
          BOOL v85 = 0;
        }
        if (v84 && v81 < 4) {
          int v82 = 3;
        }
        if (v85 && v81 < 5) {
          int v82 = 4;
        }
        if (v60 == 16 && !i) {
          break;
        }
        unsigned int v86 = (v80 + v82) & ~((v80 + v82) >> 31);
        uint64_t v87 = &v327[v57];
        *uint64_t v87 = v86;
        if (v60 < 8 || v86 >= 3 || v60 > 0xC || v81) {
          goto LABEL_94;
        }
        if (v67)
        {
          unsigned int v86 = v67 != ~(-1 << v60) || v60 > 0xB;
LABEL_93:
          *uint64_t v87 = v86;
          goto LABEL_94;
        }
        unsigned int v86 = 0;
        *uint64_t v87 = 0;
LABEL_94:
        BOOL v88 = 0;
        if (v294 == 2 && v67 < v75 && v63 >= v75) {
          BOOL v88 = interchange_compression::dq_consts[160 * v61 + 8 + 10 * v86] == 0;
        }
        if (v86 >= interchange_compression::dq_qp_transition[v61] || v88)
        {
          unsigned int v89 = interchange_compression::dq_consts[160 * v61 + 4 + 10 * v86]
              - (v88 & v58)
              + interchange_compression::dq_lossy_level[3 * v61 + v286];
          if (v88) {
            int v90 = 0;
          }
          else {
            int v90 = -2;
          }
          BOOL v72 = v60 >= v89;
          unsigned int v91 = v60 - v89;
          int v92 = v67 & ~(-1 << v91);
          if (v91 == 0 || !v72) {
            int v92 = 0;
          }
          int v93 = v92 + v90;
          if (v93 >= 1)
          {
            unsigned int v94 = v93 + v76;
            for (int j = 31; j != -1; --j)
            {
              if ((v94 >> j)) {
                break;
              }
            }
            if (v81 < j + 1) {
              *uint64_t v87 = ++v86;
            }
          }
        }
        unsigned int v96 = interchange_compression::dq_max_mode[v61];
        if (v60 == 32)
        {
          if (v96 >= v86) {
            unsigned int v96 = v86;
          }
          *uint64_t v87 = v96;
        }
        else if (v86 > v96)
        {
          interchange_compression::compressor::compress();
        }
        ++v57;
        int v59 = (uint64_t *)((char *)v59 + 4);
        unsigned int v30 = v296;
        if (v57 == v293) {
          goto LABEL_33;
        }
      }
      if (v63 == 0xFFFF) {
        unsigned int v86 = v80 + 2;
      }
      else {
        unsigned int v86 = (v80 + v82) & ~((v80 + v82) >> 31);
      }
      uint64_t v87 = &v327[v57];
      goto LABEL_93;
    }
  }
  if (v18 >= v15)
  {
    interchange_compression::compressor::pack_pixels(v8, a2, a3, a4, a5, a6, a7);
  }
  else if (v10)
  {
    unsigned int v260 = interchange_compression::memory_parameters[11 * v11 + 8];
    *a6 = v260;
    *a7 = v16 + v16 * (v260 & ~(-1 << v14));
    interchange_compression::format_info::pack_pixel((interchange_compression::format_info *)&interchange_compression::format_table[52 * *((unsigned int *)v8 + 1150)], a5, (unsigned int *)a2);
    size_t v261 = *a7;
    v304 = a5;
    int v303 = v261;
    uint64_t v305 = 0;
    char v306 = 0;
    bzero(a5, v261);
    uint64_t v262 = *((unsigned int *)v8 + 1150);
    if (v262 != 27)
    {
      unint64_t v263 = 0;
      do
      {
        bit_pack::pack((bit_pack *)v302, (*a2)[0][0][v263], *(_DWORD *)&interchange_compression::format_table[52 * v262 + 12 + 4 * v263]);
        ++v263;
        uint64_t v262 = *((unsigned int *)v8 + 1150);
      }
      while (v263 < *(unsigned int *)&interchange_compression::format_table[52 * v262 + 8]);
    }
  }
  else
  {
    v304 = a5;
    int v303 = v15;
    uint64_t v305 = 0;
    char v306 = 0;
    bzero(a5, v15);
    interchange_compression::compressor::pack_header(v8, (bit_pack *)v302, 0, a6);
    interchange_compression::compressor::pack_deltas(v8, (bit_pack *)v302, v301, a3, a4);
    if ((v16 - 1 + ((v305 + 7) >> 3)) / v16 != v17) {
      interchange_compression::compressor::compress();
    }
    *a6 |= v17 - 1;
    *a7 = v18;
  }
}

uint64_t interchange_decompress_plane(const unsigned __int8 *a1, const unsigned __int8 *a2, unsigned char *a3, unsigned int a4, unsigned int a5, int a6, int a7, unsigned int a8, interchange_compression *a9)
{
  uint64_t v100 = *MEMORY[0x263EF8340];
  if (a7) {
    uint64_t v9 = 16;
  }
  else {
    uint64_t v9 = 32;
  }
  uint64_t v91 = v9;
  if ((a6 | 2) != 0xA) {
    interchange_decompress_plane();
  }
  if (a7) {
    int v15 = 8;
  }
  else {
    int v15 = 1;
  }
  if (a7) {
    int v16 = 10;
  }
  else {
    int v16 = 3;
  }
  if (a7) {
    char v17 = 4;
  }
  else {
    char v17 = 5;
  }
  char v81 = v17;
  if (a6 == 8) {
    unsigned int v18 = v15;
  }
  else {
    unsigned int v18 = v16;
  }
  unsigned int v77 = interchange_compression::lossy_parameters[28 * v18 + 4 + a9];
  uint64_t result = (uint64_t)interchange_compression::decompressor::decompressor((interchange_compression::decompressor *)v98, v18, (interchange_compression *)a9, 0);
  memset(v99, 0, sizeof(v99));
  if (a5)
  {
    uint64_t v69 = 0;
    unsigned int v84 = 0;
    unsigned int v20 = (v91 - 1 + a4) >> v81;
    unsigned int v21 = (v91 - 1 + a5) >> v81;
    uint64_t v22 = (v20 * v21 * v77 + 127) & 0xFFFFFF80;
    unsigned int v23 = 32 - __clz(v21 - 1);
    if (v21 >= 2) {
      unsigned int v24 = v23;
    }
    else {
      unsigned int v24 = 0;
    }
    unsigned int v25 = 32 - __clz(v20 - 1);
    if (v20 < 2) {
      unsigned int v25 = 0;
    }
    unsigned int v76 = &a2[v22];
    if (v25 >= v24) {
      uint64_t v26 = v24;
    }
    else {
      uint64_t v26 = v25;
    }
    char v27 = 5;
    if (a7) {
      char v27 = 3;
    }
    char v73 = v27;
    char v74 = 2 * v26;
    uint64_t v65 = &interchange_compression::lossy_parameters[28 * v18 + 8 + a9];
    int v66 = &interchange_compression::memory_parameters[11 * v18 + 7];
    uint64x2_t v71 = (uint64x2_t)vdupq_n_s64(v26 - 1);
    uint64_t v70 = (v26 + 1) & 0x1FFFFFFFELL;
    uint64_t v67 = v91 * a4;
    int64x2_t v28 = vdupq_n_s64(2uLL);
    int v68 = 1;
    int64x2_t v72 = v28;
    int v75 = v26;
    do
    {
      if (!a4) {
        goto LABEL_63;
      }
      uint64_t v29 = 0;
      unint64_t v30 = v84 >> v81;
      int v80 = v30 * ((v91 - 1 + a4) >> v81);
      int v90 = ~(-1 << *v66);
      unsigned int v89 = *v65;
      uint64x2_t v31 = (uint64x2_t)vdupq_n_s64(v30);
      uint64_t v32 = v69;
      int v33 = v68;
      uint64x2_t v79 = v31;
      do
      {
        unint64_t v34 = v29 >> v81;
        if (v26)
        {
          uint64x2_t v35 = (uint64x2_t)vdupq_n_s64(v34);
          int8x16_t v36 = 0uLL;
          uint64_t v37 = v70;
          int64x2_t v38 = (int64x2_t)xmmword_262C13600;
          do
          {
            int8x16_t v39 = v36;
            int64x2_t v40 = v38;
            uint64x2_t v41 = (uint64x2_t)vnegq_s64(v38);
            int8x16_t v42 = (int8x16_t)vdupq_n_s64(1uLL);
            int8x16_t v43 = (int8x16_t)vaddq_s64(v40, v40);
            int8x16_t v36 = vorrq_s8(vorrq_s8((int8x16_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v35, v41), v42), (uint64x2_t)v43), (int8x16_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v31, v41), v42), (uint64x2_t)vorrq_s8(v43, v42))), v39);
            int64x2_t v38 = vaddq_s64(v40, v28);
            v37 -= 2;
          }
          while (v37);
          int8x16_t v44 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v40, v71), v39, v36);
          int8x8_t v45 = vorr_s8(*(int8x8_t *)v44.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v44, v44, 8uLL));
        }
        else
        {
          int8x8_t v45 = 0;
        }
        int v46 = 0;
        uint64x2_t v47 = &a2[(v34 + v80) * v77];
        int8x16_t v48 = &v76[(*(void *)&v45 | ((v34 | (v84 >> v81)) >> v26 << v74)) << v73];
        uint64_t v83 = v32;
        int v82 = v33;
        uint64_t v85 = v29;
        do
        {
          int v49 = 0;
          int v88 = v46;
          int v50 = v46 + v84;
          uint64_t v87 = v32;
          uint64_t v51 = v32;
          int v86 = v33;
          do
          {
            uint64_t v94 = v51;
            int v95 = v49;
            unsigned int v96 = v48;
            uint64_t v97 = v47;
            unsigned int v52 = *v48;
            int v93 = v52 & 0xF0;
            if (*v48) {
              int v53 = (v52 & v90) + 1;
            }
            else {
              int v53 = 0;
            }
            unsigned int v92 = v53;
            uint64_t result = interchange_compression::decompressor::decompress((interchange_compression::decompressor *)v98, v47, v52, (unsigned int (*)[4][8][4])v99);
            uint64_t v54 = 0;
            int v55 = v94;
            int v56 = v33;
            uint64_t v57 = &v99[0][0][1];
            do
            {
              uint64_t v58 = 0;
              unsigned int v59 = v56;
              unsigned int v60 = v57;
              do
              {
                if (v50 + (int)v54 < a5 && (int)v29 + (int)v58 < a4)
                {
                  unsigned int v61 = *(v60 - 1);
                  if (a7)
                  {
                    uint64_t result = v59 - 1;
                    uint64_t v62 = v59;
                    if (a6 == 8)
                    {
                      a3[result] = v61;
                      unsigned int v61 = *v60;
LABEL_49:
                      a3[v62] = v61;
                      goto LABEL_52;
                    }
                    *(_WORD *)&a3[2 * result] = v61;
                    unsigned int v61 = *v60;
                  }
                  else
                  {
                    uint64_t v62 = (v55 + v58);
                    if (a6 == 8) {
                      goto LABEL_49;
                    }
                  }
                  *(_WORD *)&a3[2 * v62] = v61;
                }
LABEL_52:
                ++v58;
                v60 += 4;
                v59 += 2;
              }
              while (v58 != 8);
              ++v54;
              v57 += 32;
              v56 += 2 * a4;
              v55 += a4;
            }
            while (v54 != 4);
            if (v93 != 240 || a9 == 0) {
              uint64_t v64 = v92;
            }
            else {
              uint64_t v64 = v89;
            }
            uint64x2_t v47 = &v97[v64];
            int8x16_t v48 = v96 + 1;
            int v49 = v95 + 8;
            LODWORD(v29) = v29 + 8;
            v33 += 16;
            uint64_t v51 = v94 + 8;
          }
          while (v95 + 8 < v91);
          int v46 = v88 + 4;
          int v33 = v86 + 8 * a4;
          uint64_t v32 = v87 + 4 * a4;
          LODWORD(v29) = v85;
        }
        while (v88 + 4 < v91);
        uint64_t v29 = v85 + v91;
        int v33 = v82 + 2 * v91;
        uint64_t v32 = v83 + v91;
        LODWORD(v26) = v75;
        int64x2_t v28 = v72;
        uint64x2_t v31 = v79;
      }
      while ((int)v85 + (int)v91 < a4);
LABEL_63:
      v68 += 2 * v67;
      v69 += v67;
      v84 += v91;
    }
    while (v84 < a5);
  }
  return result;
}

uint64_t interchange_compression::decompressor::decompress(interchange_compression::decompressor *this, const unsigned __int8 *a2, unsigned int a3, unsigned int (*a4)[4][8][4])
{
  uint64_t v7 = this;
  uint64_t v222 = *MEMORY[0x263EF8340];
  unsigned int v8 = interchange_compression::memory_parameters[11 * *((unsigned int *)this + 85) + 7];
  if ((*((_DWORD *)this + 87) - 1) <= 2)
  {
    unsigned int subblock_size = interchange_compression::decompressor::get_subblock_size(this, a3);
    int v10 = *((_DWORD *)v7 + 85);
    if (subblock_size > interchange_compression::lossy_parameters[28 * v10 + 8 + *((unsigned int *)v7 + 87)]
      || subblock_size < interchange_compression::decompressor::get_subblock_size(v7, LOBYTE(interchange_compression::memory_parameters[11 * v10 + 8])))
    {
      goto LABEL_233;
    }
    if ((~a3 & 0xF0) == 0)
    {
      uint64_t v11 = *((unsigned int *)v7 + 87);
      if ((v11 - 1) <= 2)
      {
        uint64_t v12 = 0;
        uint64_t v13 = *((unsigned int *)v7 + 85);
        unint64_t v179 = (unint64_t)interchange_compression::lossy_parameters[28 * v13 + 8 + v11] >> 2;
        int16x8_t v14 = (int16x8_t)vtstq_s32(vdupq_n_s32(a3), (int32x4_t)xmmword_262C13650);
        *(int8x8_t *)v14.i8 = vand_s8((int8x8_t)vmovn_s32((int32x4_t)v14), (int8x8_t)0x1000100010001);
        unsigned __int32 v198 = vmovn_s16(v14).u32[0];
        int8x16_t v177 = a4;
        unsigned __int32 v178 = a2;
        int8x16_t v176 = v7;
        while (1)
        {
          uint64_t v15 = *((unsigned int *)v7 + 87);
          uint64_t v180 = v12;
          int v16 = &a2[v12 * v179];
          int v17 = *((_DWORD *)v7 + 88);
          uint64_t v189 = v13;
          int v197 = v17;
          if (!v199[v12 - 4]) {
            break;
          }
          uint64_t v18 = 0;
          unsigned int v19 = interchange_compression::lossy_parameters[28 * v13 + 8 + v15] >> 2;
          v216 = v16;
          int v215 = v19;
          char v219 = 1;
          unsigned int v218 = 0;
          unsigned int v217 = 8 * v19;
          unsigned int v20 = &interchange_compression::format_table[52 * v13];
          LODWORD(v21) = *((_DWORD *)v20 + 2);
          unsigned int v22 = v17 & 0xFFFFFFFE;
          if (v21 <= 1) {
            uint64_t v21 = 1;
          }
          else {
            uint64_t v21 = v21;
          }
          unsigned __int32 v183 = (interchange_compression *)(v20 + 12);
          uint64_t v186 = v21;
          int8x16_t v181 = &interchange_compression::lossy_parameters[28 * v13 + 12 + 4 * v15];
          unsigned int v23 = (unsigned int *)v199;
          do
          {
            uint64_t v194 = v18;
            unsigned int v25 = v181;
            unsigned int v24 = v183;
            uint64_t v190 = v23;
            uint64_t v26 = v186;
            if (v13 != 27)
            {
              do
              {
                int v28 = *v25++;
                int v27 = v28;
                int v30 = *(_DWORD *)v24;
                unsigned int v24 = (interchange_compression *)((char *)v24 + 4);
                int v29 = v30;
                int v31 = -1 << v30;
                if (v30 == 32) {
                  unsigned int v32 = -1;
                }
                else {
                  unsigned int v32 = ~v31;
                }
                int v33 = 1 << (v29 - 1);
                unsigned int v34 = (bit_pack::unpack((bit_pack *)v214, v29 - v27) << v27) & v32;
                BOOL v36 = v22 != 2 || v34 != v33;
                if (v34 >> v27 == v32 >> v27) {
                  int v37 = v32;
                }
                else {
                  int v37 = ((1 << (v27 - 1)) - ((v34 >> v27) & 1)) | v34;
                }
                if (!v36 || v34 == 0) {
                  unsigned int v39 = v34;
                }
                else {
                  unsigned int v39 = v37;
                }
                if (!v27) {
                  unsigned int v39 = v34;
                }
                if (v197 != 1) {
                  unsigned int v34 = v39;
                }
                if (v22 == 2) {
                  int v40 = v33;
                }
                else {
                  int v40 = 0;
                }
                *v23++ = v34 ^ v40;
                --v26;
              }
              while (v26);
            }
            uint64_t v18 = v194 + 1;
            uint64_t v13 = v189;
            unsigned int v23 = v190 + 4;
          }
          while (v194 != 7);
          a4 = v177;
          a2 = v178;
          uint64_t v7 = v176;
LABEL_193:
          uint64_t v141 = 0;
          int v142 = v199;
          do
          {
            if (*((_DWORD *)v7 + 85) == 27)
            {
              uint64_t v13 = 27;
            }
            else
            {
              unint64_t v143 = 0;
              uint32x4_t v144 = (uint32x4_t)vdupq_n_s32((int)v141 + 8 * (int)v180);
              v145.i64[0] = 0x100000001;
              v145.i64[1] = 0x100000001;
              int8x16_t v146 = (int8x16_t)vshlq_u32((uint32x4_t)vandq_s8((int8x16_t)vshlq_u32(v144, (uint32x4_t)xmmword_262C13620), v145), (uint32x4_t)xmmword_262C13630);
              int8x16_t v147 = (int8x16_t)vshlq_u32((uint32x4_t)vandq_s8((int8x16_t)vshlq_u32(v144, (uint32x4_t)xmmword_262C13640), v145), (uint32x4_t)xmmword_262C13630);
              v148 = (*a4)[(unint64_t)(vorr_s8(*(int8x8_t *)v146.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v146, v146, 8uLL)).u32[0] | v146.i32[1])][vorr_s8(*(int8x8_t *)v147.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v147, v147, 8uLL)).u32[0] | v147.i32[1]];
              do
              {
                v148[v143] = *(_DWORD *)&v142[4 * v143];
                ++v143;
                uint64_t v13 = *((unsigned int *)v7 + 85);
              }
              while (v143 < *(unsigned int *)&interchange_compression::format_table[52 * v13 + 8]);
            }
            ++v141;
            v142 += 16;
          }
          while (v141 != 8);
          uint64_t v12 = v180 + 1;
          if (v180 == 3) {
            return 1;
          }
        }
        int v195 = 0;
        uint64_t v187 = &interchange_compression::format_table[52 * v13];
        unsigned int v184 = *((_DWORD *)v187 + 2);
        int v174 = *((_DWORD *)v7 + 87);
        unsigned int v41 = interchange_compression::lossy_parameters[28 * v13 + 8 + v15];
        v216 = &a2[v12 * v179];
        v41 *= 2;
        int v215 = (v41 >> 3) & 0x7FFFFFF;
        char v219 = 1;
        unsigned int v218 = 0;
        unsigned int v182 = v41;
        unsigned int v217 = v41 & 0x3FFFFFF8;
        if (v13 == 27)
        {
LABEL_42:
          *(void *)int v211 = 0;
          uint64_t v212 = 0;
          memset(v210, 0, sizeof(v210));
          v209[0] = interchange_compression::get_id((interchange_compression *)*((unsigned int *)v187 + 3));
          int8x16_t v42 = (unsigned int *)&interchange_compression::format_table[52 * v189];
          v209[1] = interchange_compression::get_id((interchange_compression *)v42[4]);
          v209[2] = interchange_compression::get_id((interchange_compression *)v42[5]);
          v209[3] = interchange_compression::get_id((interchange_compression *)v42[6]);
          unsigned int v43 = v184;
          interchange_compression::derive_sharing(v184, (uint64_t)v209, v221, v211, (int (*)[4])v210, v44);
          uint64_t v207 = 0;
          uint64_t v208 = 0;
          uint64_t v205 = 0;
          uint64_t v206 = 0;
          if (v189 == 27)
          {
            uint64_t v203 = 0;
            uint64_t v204 = 0;
            uint64_t v201 = 0;
            uint64_t v202 = 0;
            int v45 = v197;
            int v46 = v195;
          }
          else
          {
            unint64_t v74 = 0;
            uint64_t v193 = (v174 - 1);
            if (v184 <= 1) {
              uint64_t v75 = 1;
            }
            else {
              uint64_t v75 = v184;
            }
            uint64_t v175 = v75;
            uint64_t v188 = 4 * v75;
            do
            {
              unsigned int v76 = *(_DWORD *)&interchange_compression::format_table[52 * v189 + 12 + v74];
              uint64_t id = interchange_compression::get_id((interchange_compression *)v76);
              int v78 = v221[v74 / 4];
              uint64x2_t v79 = &interchange_compression::dq_consts[160 * id + 10 * v78];
              int v80 = interchange_compression::dq_lossy_level[3 * id + v193];
              int v81 = v79[5];
              *(_DWORD *)((char *)&v207 + v74) = v80 + v79[4];
              int v82 = (unsigned int *)((char *)&v205 + v74);
              *(_DWORD *)((char *)&v205 + v74) = v81 + v80;
              interchange_compression::adjust_level(id, v78, v211[v74 / 4], v210[v74 / 4], (uint64_t *)((char *)&v207 + v74), (unsigned int *)((char *)&v205 + v74), v83);
              unsigned int v84 = *(_DWORD *)((char *)&v207 + v74);
              if (v76 < v84) {
                unsigned int v84 = v76;
              }
              *(_DWORD *)((char *)&v207 + v74) = v84;
              if (v81) {
                unsigned int v85 = v76;
              }
              else {
                unsigned int v85 = 0;
              }
              if (v85 >= *v82) {
                unsigned int v85 = *v82;
              }
              *int v82 = v85;
              v74 += 4;
            }
            while (v188 != v74);
            if (v189 == 19 && v221[3] == 1 && v210[3] - HIDWORD(v212) <= 1)
            {
              uint64_t v207 = 0;
              uint64_t v208 = 0;
              uint64_t v205 = 0;
              uint64_t v206 = 0;
            }
            uint64_t v86 = v175;
            uint64_t v87 = &interchange_compression::format_table[52 * v189 + 12];
            int v88 = (unsigned int *)&v203;
            uint64_t v203 = 0;
            uint64_t v204 = 0;
            unsigned int v89 = v220;
            int v90 = (unsigned int *)&v207;
            uint64_t v91 = v221;
            do
            {
              int v92 = *v91++;
              if (v92 || (*v87 - 8) > 4)
              {
                unsigned int v93 = *v90;
                *int v88 = bit_pack::unpack((bit_pack *)v214, *v90) << (*v87 - v93);
                v195 += v93;
              }
              else
              {
                *int v88 = *v89;
              }
              ++v88;
              ++v89;
              ++v87;
              ++v90;
              --v86;
            }
            while (v86);
            uint64_t v201 = 0;
            uint64_t v202 = 0;
            uint64_t v94 = &v201;
            int v95 = &v205;
            int v45 = v197;
            int v46 = v195;
            unsigned int v43 = v184;
            uint64_t v96 = v175;
            do
            {
              int v97 = *(_DWORD *)v95;
              int v95 = (uint64_t *)((char *)v95 + 4);
              if (v97)
              {
                int v98 = bit_pack::get((bit_pack *)v214, v218, 3u);
                v218 += 3;
                *(_DWORD *)uint64_t v94 = v98;
                v46 += 3;
              }
              uint64_t v94 = (uint64_t *)((char *)v94 + 4);
              --v96;
            }
            while (v96);
          }
          unsigned int v99 = (v182 & 0x3FFFFFFE) - v46;
          unsigned int v100 = v99 / 7;
          unsigned int v101 = v218 + v99 - 7 * (v99 / 7);
          unsigned int v218 = v101;
          unsigned int v102 = v217;
          if (v101 > v217) {
            interchange_compression::decompressor::decompress();
          }
          LODWORD(v103) = v43;
          uint64_t v104 = 0;
          unsigned int v196 = v45 & 0xFFFFFFFE;
          memset(&v200[1], 0, 96);
          if (v103 <= 1) {
            uint64_t v103 = 1;
          }
          else {
            uint64_t v103 = v103;
          }
          unint64_t v185 = (interchange_compression *)v103;
          v105 = v200;
          v200[0] = 0uLL;
          uint64_t v106 = v189;
          do
          {
            if (v106 == 27)
            {
              unsigned int v107 = 0;
            }
            else
            {
              unsigned int v107 = 0;
              v108 = (unsigned int *)&v205;
              v109 = v105;
              int v110 = v185;
              do
              {
                unsigned int v112 = *v108++;
                unsigned int v111 = v112;
                if (v112)
                {
                  _DWORD *v109 = bit_pack::unpack((bit_pack *)v214, v111);
                  v107 += v111;
                }
                v109 += 7;
                int v110 = (interchange_compression *)((char *)v110 - 1);
              }
              while (v110);
              if (v107 > v100) {
                interchange_compression::decompressor::decompress();
              }
              unsigned int v101 = v218;
              unsigned int v102 = v217;
              uint64_t v106 = v189;
            }
            v101 += v100 - v107;
            unsigned int v218 = v101;
            if (v101 > v102) {
              interchange_compression::decompressor::decompress();
            }
            ++v104;
            v105 = (_OWORD *)((char *)v105 + 4);
          }
          while (v104 != 7);
          if (v106 != 27)
          {
            v113 = 0;
            v114 = v199;
            do
            {
              unsigned int v115 = *(_DWORD *)&interchange_compression::format_table[52 * v106 + 12 + 4 * (void)v113];
              int v116 = interchange_compression::get_id((interchange_compression *)v115);
              uint64_t v117 = 0;
              unsigned int v118 = 0;
              unint64_t v119 = *(void *)&interchange_compression::dq_consts[160 * v116 + 2 + 10 * v221[(void)v113]];
              int v120 = *((_DWORD *)&v205 + (void)v113);
              unint64_t v121 = v119 >> v120;
              if (v119 >> v120 <= 1) {
                unint64_t v121 = 1;
              }
              if (v121 >> 1 >= (unint64_t)(1 << (v115
                                                         - *((_DWORD *)&v207 + (void)v113))) >> 1)
                unint64_t v122 = (unint64_t)(1 << (v115
                                                - *((_DWORD *)&v207 + (void)v113))) >> 1;
              else {
                unint64_t v122 = v121 >> 1;
              }
              unint64_t v123 = (1 << (v115 - 1));
              uint64_t v124 = *((unsigned int *)&v203 + (void)v113);
              unint64_t v125 = ~(-1 << v120);
              unint64_t v126 = v119 + v124;
              unint64_t v127 = 1 << v115;
              if (!v124) {
                unint64_t v122 = 0;
              }
              if (v115 == 16) {
                unint64_t v128 = 31744;
              }
              else {
                unint64_t v128 = 2139095040;
              }
              if (v115 == 16) {
                unint64_t v129 = 64512;
              }
              else {
                unint64_t v129 = 4286578688;
              }
              if (v115 == 16) {
                unint64_t v130 = 32256;
              }
              else {
                unint64_t v130 = 2143289344;
              }
              unint64_t v131 = 4290772992;
              if (v115 == 16) {
                unint64_t v131 = 65024;
              }
              uint64_t v132 = v114;
              do
              {
                if (v120)
                {
                  if (v117 == *((_DWORD *)&v201 + (void)v113))
                  {
                    unint64_t v133 = v122;
                    BOOL v134 = v124 == v123;
                  }
                  else
                  {
                    unint64_t v135 = *((unsigned int *)v200 + 7 * (void)v113 + v118);
                    BOOL v134 = (v123 - v124) / v121 == v135;
                    if (v135 > v125) {
                      interchange_compression::decompressor::decompress();
                    }
                    if (v135 | v124)
                    {
                      if (v126 < v127 || (unint64_t v133 = v127 - 1, v135 != v125)) {
                        unint64_t v133 = (v121 >> 1) + v121 * v135;
                      }
                    }
                    else
                    {
                      unint64_t v133 = 0;
                    }
                    ++v118;
                  }
                }
                else
                {
                  unint64_t v133 = 0;
                  BOOL v134 = v121 > v123 - v124;
                }
                unint64_t v136 = v133 + v124;
                unint64_t v137 = v136;
                if (v197 == 1)
                {
                  if (v136 < v128 || (unint64_t v137 = (v128 - 1), v136 >= v130))
                  {
                    if (v136 < v130 || (unint64_t v137 = v123, v136 >= v123))
                    {
                      BOOL v138 = v136 < v131 && v136 >= v129;
                      unint64_t v137 = (v129 - 1);
                      if (!v138) {
                        unint64_t v137 = v136;
                      }
                    }
                  }
                }
                if (v137 >= v127) {
                  int v139 = v127 - 1;
                }
                else {
                  int v139 = v137;
                }
                if (v134) {
                  int v140 = 0;
                }
                else {
                  int v140 = v139 ^ v123;
                }
                if (v196 != 2) {
                  int v140 = v139;
                }
                *uint64_t v132 = v140;
                v132 += 4;
                ++v117;
              }
              while (v117 != 8);
              v113 = (interchange_compression *)((char *)v113 + 1);
              v114 += 4;
              uint64_t v106 = v189;
            }
            while (v113 != v185);
          }
          a2 = v178;
          goto LABEL_193;
        }
        int v47 = 0;
        if (v184 <= 1) {
          uint64_t v48 = 1;
        }
        else {
          uint64_t v48 = v184;
        }
        int v49 = (unsigned int *)&interchange_compression::format_table[52 * v13 + 12];
        int v50 = v213;
        uint64_t v51 = v49;
        uint64_t v191 = v48;
        do
        {
          int v53 = *v51++;
          int v52 = v53;
          if (v53 == 2)
          {
            unsigned int v54 = 1;
          }
          else if ((v52 - 8) >= 5)
          {
            unsigned int v54 = 4;
            if (v52 != 16 && v52 != 32) {
              interchange_compression::decompressor::decompress();
            }
          }
          else
          {
            unsigned int v54 = 3;
          }
          *v50++ = bit_pack::unpack((bit_pack *)v214, v54);
          v47 += v54;
          --v48;
        }
        while (v48);
        int v195 = v47;
        uint64_t v55 = 0;
        int v56 = v221;
        uint64_t v57 = v220;
        uint64_t v58 = (int *)v213;
        uint64_t v59 = v191;
        while (1)
        {
          unsigned int v61 = *v49++;
          unsigned int v60 = v61;
          if (v61 == 2)
          {
            char v62 = *v58;
            *uint64_t v57 = 0;
            int v63 = v62 & 1;
            uint64_t v64 = v56;
LABEL_95:
            *uint64_t v64 = v63;
            goto LABEL_96;
          }
          unsigned int v192 = v49;
          uint64_t v65 = v59;
          BOOL v66 = v60 - 8 < 5 || v60 == 16;
          if (!v66 && v60 != 32) {
            interchange_compression::decompressor::decompress();
          }
          int v67 = *v58;
          unsigned int v68 = v60 & 0xFFFFFFFD;
          if (((v60 & 0xFFFFFFFD) == 8 || v60 == 12) && v67 == 0)
          {
            char v71 = bit_pack::get((bit_pack *)v214, v218, 2u);
            v218 += 2;
            v195 += 2;
            uint64_t v64 = &v221[v55];
            *uint64_t v57 = 0;
            unsigned int *v56 = 0;
            int v63 = v71 & 3;
            if (v68 == 8)
            {
              uint64_t v59 = v65;
              if (v63 != 2)
              {
                int v49 = v192;
                if (v63 == 1)
                {
                  int v63 = 0;
                  *uint64_t v57 = ~(-1 << v60);
                  goto LABEL_95;
                }
                if ((v71 & 3) != 0)
                {
                  int v63 = 2;
                  goto LABEL_95;
                }
                uint64_t v64 = v56;
                int64x2_t v72 = v57;
                goto LABEL_94;
              }
              int v63 = 1;
LABEL_90:
              int v49 = v192;
              goto LABEL_95;
            }
            uint64_t v59 = v65;
            if (v60 == 12)
            {
              int v49 = v192;
              if (v63 == 2 || v63 == 1) {
                goto LABEL_95;
              }
              if ((v71 & 3) != 0)
              {
                int v63 = 3;
                goto LABEL_95;
              }
              int64x2_t v72 = v57;
              uint64_t v64 = v56;
              goto LABEL_94;
            }
          }
          else
          {
            uint64_t v64 = &v221[v55];
            *uint64_t v57 = 0;
            if (v60 > 0xF)
            {
              int v63 = v67 & 0xF;
              goto LABEL_90;
            }
            int64x2_t v72 = &v220[v55];
            int v73 = v67 & 7;
            unsigned int *v56 = v73;
            if (v68 == 8)
            {
              if (!v73)
              {
                int v49 = v192;
                goto LABEL_94;
              }
              int v63 = v73 + 2;
              goto LABEL_90;
            }
            if (v60 == 12)
            {
              int v49 = v192;
              if (v73)
              {
                int v63 = v73 + 3;
                goto LABEL_95;
              }
LABEL_94:
              int v63 = 0;
              *int64x2_t v72 = 0;
              goto LABEL_95;
            }
          }
          int v49 = v192;
LABEL_96:
          ++v55;
          ++v56;
          ++v57;
          ++v58;
          if (!--v59) {
            goto LABEL_42;
          }
        }
      }
    }
  }
  uint64_t v149 = *((unsigned int *)v7 + 85);
  if (interchange_compression::memory_parameters[11 * v149 + 8] == a3)
  {
    int v150 = (a3 & ~(-1 << interchange_compression::memory_parameters[11 * v149 + 7])) + 1;
    v216 = a2;
    int v215 = v150 << (v149 == 26);
    char v219 = 1;
    unsigned int v218 = 0;
    unsigned int v217 = 8 * v215;
    if (v149 == 27)
    {
      int v151 = 27;
    }
    else
    {
      unint64_t v160 = 0;
      do
      {
        (*a4)[0][0][v160] = bit_pack::unpack((bit_pack *)v214, *(_DWORD *)&interchange_compression::format_table[52 * v149 + 12 + 4 * v160]);
        ++v160;
        uint64_t v149 = *((unsigned int *)v7 + 85);
      }
      while (v160 < *(unsigned int *)&interchange_compression::format_table[52 * v149 + 8]);
      int v151 = *((_DWORD *)v7 + 85);
    }
    uint64_t v161 = 0;
    for (uint64_t i = 0; i != 4; ++i)
    {
      uint64_t v163 = 0;
      uint64_t v164 = v161;
      do
      {
        if (v151 == 27)
        {
          int v151 = 27;
        }
        else
        {
          unint64_t v165 = 0;
          do
          {
            *(unsigned int *)((char *)&(*a4)[0][0][v165] + v164) = (*a4)[0][0][v165];
            ++v165;
            int v151 = *((_DWORD *)v7 + 85);
          }
          while (v165 < *(unsigned int *)&interchange_compression::format_table[52 * v151 + 8]);
        }
        ++v163;
        v164 += 16;
      }
      while (v163 != 8);
      v161 += 128;
    }
    return 1;
  }
  if (interchange_compression::memory_parameters[11 * v149 + 9] == a3)
  {
    unsigned int v152 = 0;
    unsigned int v153 = interchange_compression::memory_parameters[11 * v149 + 5];
    v216 = a2;
    int v215 = v153;
    char v219 = 1;
    unsigned int v218 = 0;
    unsigned int v217 = 8 * v153;
    do
    {
      if (v149 != 27)
      {
        unint64_t v154 = 0;
        uint32x4_t v155 = (uint32x4_t)vdupq_n_s32(v152);
        v156.i64[0] = 0x100000001;
        v156.i64[1] = 0x100000001;
        int8x16_t v157 = (int8x16_t)vshlq_u32((uint32x4_t)vandq_s8((int8x16_t)vshlq_u32(v155, (uint32x4_t)xmmword_262C13640), v156), (uint32x4_t)xmmword_262C13630);
        int8x16_t v158 = (int8x16_t)vshlq_u32((uint32x4_t)vandq_s8((int8x16_t)vshlq_u32(v155, (uint32x4_t)xmmword_262C13620), v156), (uint32x4_t)xmmword_262C13630);
        uint64_t v159 = (*a4)[(unint64_t)(vorr_s8(*(int8x8_t *)v158.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v158, v158, 8uLL)).u32[0] | v158.i32[1])][vorr_s8(*(int8x8_t *)v157.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v157, v157, 8uLL)).u32[0] | v157.i32[1]];
        do
        {
          v159[v154] = bit_pack::unpack((bit_pack *)v214, *(_DWORD *)&interchange_compression::format_table[52 * v149 + 12 + 4 * v154]);
          ++v154;
          uint64_t v149 = *((unsigned int *)v7 + 85);
        }
        while (v154 < *(unsigned int *)&interchange_compression::format_table[52 * v149 + 8]);
      }
      ++v152;
    }
    while (v152 != 32);
    if (*((_DWORD *)v7 + 87)) {
      interchange_compression::decompressor::decompress();
    }
    return 1;
  }
  if (interchange_compression::memory_parameters[11 * v149 + 10] == a3)
  {
    for (unsigned int j = 0; j != 32; ++j)
    {
      uint32x4_t v168 = (uint32x4_t)vdupq_n_s32(j);
      v169.i64[0] = 0x100000001;
      v169.i64[1] = 0x100000001;
      int8x16_t v170 = (int8x16_t)vshlq_u32((uint32x4_t)vandq_s8((int8x16_t)vshlq_u32(v168, (uint32x4_t)xmmword_262C13640), v169), (uint32x4_t)xmmword_262C13630);
      int8x16_t v171 = (int8x16_t)vshlq_u32((uint32x4_t)vandq_s8((int8x16_t)vshlq_u32(v168, (uint32x4_t)xmmword_262C13620), v169), (uint32x4_t)xmmword_262C13630);
      interchange_compression::format_info::unpack_pixel((interchange_compression::format_info *)&interchange_compression::format_table[52 * v149], a2, (*a4)[(unint64_t)(vorr_s8(*(int8x8_t *)v171.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v171, v171, 8uLL)).u32[0] | v171.i32[1])][vorr_s8(*(int8x8_t *)v170.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v170, v170, 8uLL)).u32[0] | v170.i32[1]]);
      uint64_t v149 = *((unsigned int *)v7 + 85);
      a2 += *(unsigned int *)&interchange_compression::format_table[52 * v149 + 4];
    }
    if (*((_DWORD *)v7 + 87)) {
      interchange_compression::decompressor::decompress();
    }
    return 1;
  }
  unsigned int v172 = ((a3 & ~(-1 << v8)) + 1) << (v149 == 26);
  unsigned int v173 = interchange_compression::memory_parameters[11 * v149 + 5];
  v216 = a2;
  if (v173 >= v172) {
    unsigned int v173 = v172;
  }
  int v215 = v173;
  char v219 = 1;
  unsigned int v218 = 0;
  unsigned int v217 = 8 * v173;
  if (interchange_compression::decompressor::unpack_header(v7, a2, a3, (bit_pack *)v214))
  {
    interchange_compression::decompressor::decompress_pixels(v7, a2, a3, (bit_pack *)v214, a4);
    interchange_compression::decompressor::decorrelate(v7, a4);
    return 1;
  }
LABEL_233:
  interchange_compression::decompressor::fill_subblock_error_color((uint64_t)v7, a4);
  return 0;
}

interchange_compression::compressor *interchange_compression::compressor::compressor(interchange_compression::compressor *this, unsigned int a2, int a3, interchange_compression *a4, unsigned int a5)
{
  *((_DWORD *)this + 1065) = a2;
  if (interchange_compression::header::header_layout_table[15 * a2] != a2) {
    interchange_compression::compressor::compressor();
  }
  int v6 = (int)a4;
  *(_OWORD *)((char *)this + 4264) = 0u;
  *(_OWORD *)((char *)this + 4568) = 0u;
  *(_OWORD *)((char *)this + 4584) = 0u;
  *(_OWORD *)((char *)this + 4536) = 0u;
  *(_OWORD *)((char *)this + 4552) = 0u;
  *(_OWORD *)((char *)this + 4504) = 0u;
  *(_OWORD *)((char *)this + 4520) = 0u;
  *(_OWORD *)((char *)this + 4472) = 0u;
  *(_OWORD *)((char *)this + 4488) = 0u;
  *(_OWORD *)((char *)this + 4440) = 0u;
  *(_OWORD *)((char *)this + 4456) = 0u;
  *(_OWORD *)((char *)this + 4408) = 0u;
  *(_OWORD *)((char *)this + 4424) = 0u;
  *(_OWORD *)((char *)this + 4376) = 0u;
  *(_OWORD *)((char *)this + 4392) = 0u;
  *(_OWORD *)((char *)this + 4344) = 0u;
  *(_OWORD *)((char *)this + 4360) = 0u;
  *(_OWORD *)((char *)this + 4312) = 0u;
  *(_OWORD *)((char *)this + 4328) = 0u;
  *(_OWORD *)((char *)this + 4280) = 0u;
  *(_OWORD *)((char *)this + 4296) = 0u;
  *((_DWORD *)this + 1150) = a2;
  *((_DWORD *)this + 1151) = a4;
  *((_DWORD *)this + 1152) = a5;
  if (a2 != 21 && a3) {
    interchange_compression::compressor::compressor();
  }
  if (!interchange_compression::check_valid_lossy_level(a4, a2)) {
    interchange_compression::compressor::compressor();
  }
  if (v6 && a5 >= 4) {
    interchange_compression::compressor::compressor();
  }
  int v10 = &interchange_compression::format_table[52 * a2];
  uint64_t v11 = v10 + 49;
  uint64_t v12 = v10 + 48;
  if (a3) {
    uint64_t v12 = v11;
  }
  *((_DWORD *)this + 1154) = *v12;
  memset_pattern16((char *)this + 4240, &unk_262C13660, 0x14uLL);
  *((unsigned char *)this + 4612) = 0;
  *((_WORD *)this + 2326) = 0;
  return this;
}

uint64_t interchange_compression::compressor::check_valid_predictors(interchange_compression::compressor *this, unsigned int a2, unsigned int a3)
{
  if (*((_DWORD *)this + 1150) == 27) {
    return 1;
  }
  unsigned int v7 = 0;
  do
  {
    unsigned int v8 = 0;
    do
    {
      uint64_t result = interchange_compression::compressor::valid_predictor(this, v8, v7, a2, a3);
      if (v8 > 3) {
        break;
      }
      ++v8;
    }
    while (!result);
    if ((result & 1) == 0) {
      break;
    }
    ++v7;
  }
  while (v7 < *(_DWORD *)&interchange_compression::format_table[52 * *((unsigned int *)this + 1150) + 8]);
  return result;
}

_DWORD *interchange_compression::compressor::compute_deltas(interchange_compression::compressor *this, unsigned int a2, const unsigned int (*a3)[4][8][4], unsigned int a4, unsigned int a5)
{
  uint64_t v7 = 0;
  uint64_t v8 = a2;
  do
  {
    uint64_t v9 = (char *)this + 1060 * a2 + v7;
    int v10 = *(_DWORD *)&interchange_compression::format_table[52 * *((unsigned int *)this + 1150) + 12 + 4 * a2];
    *(_DWORD *)uint64_t v9 = v10;
    int v11 = 1 << (v10 - 1);
    unsigned int v12 = v11 - 1;
    unsigned int v13 = -v11;
    *(int32x4_t *)(v9 + 140) = vdupq_n_s32(v12);
    *(int32x4_t *)(v9 + 156) = vdupq_n_s32(v13);
    *((_DWORD *)v9 + 33) = v12;
    *((_DWORD *)v9 + 34) = v13;
    *(_OWORD *)(v9 + 4) = 0uLL;
    *(_OWORD *)(v9 + 20) = 0uLL;
    *(_OWORD *)(v9 + 36) = 0uLL;
    *(_OWORD *)(v9 + 52) = 0uLL;
    *(_OWORD *)(v9 + 68) = 0uLL;
    *(_OWORD *)(v9 + 84) = 0uLL;
    *(_OWORD *)(v9 + 100) = 0uLL;
    *(_OWORD *)(v9 + 116) = 0uLL;
    v7 += 212;
  }
  while (v7 != 1060);
  unint64_t v14 = *(unsigned int *)&interchange_compression::format_table[52 * *((unsigned int *)this + 1150) + 12 + 4 * a2];
  if (v14 >= 0x42) {
    interchange_compression::compressor::compute_deltas();
  }
  unint64_t v15 = 0;
  unint64_t v16 = v14 >> 1;
  int v17 = &(*a3)[0][0][a2];
  int v18 = -(int)v16;
  uint64_t v19 = -1 << v16;
  unsigned int v20 = (char *)this + 4 * a2;
  *((_DWORD *)v20 + 1155) = (int)(((v17[4] - *v17) & ~v19) << v18) >> v18;
  uint64_t v48 = v20 + 4636;
  int v49 = v20 + 4620;
  *((_DWORD *)v20 + 1159) = (int)(((v17[32] - *v17) & ~v19) << v18) >> v18;
  uint64_t v21 = (char *)this + 1060 * a2;
  int v52 = (interchange_compression::predictor_profile *)(v21 + 212);
  int v53 = (interchange_compression::predictor_profile *)(v21 + 424);
  unsigned int v54 = (interchange_compression::predictor_profile *)v21;
  int v46 = (interchange_compression::predictor_profile *)(v21 + 848);
  int v47 = (interchange_compression::predictor_profile *)(v21 + 636);
  unint64_t v50 = a4;
  unint64_t v51 = a5;
  unsigned int v22 = (unsigned int *)&unk_262C153CC;
  unsigned int v23 = a3;
  do
  {
    unint64_t v24 = 0;
    int8x16_t v44 = v23;
    int v45 = v22;
    do
    {
      if (v15 >= v51 || v24 >= v50)
      {
        interchange_compression::predictor_profile::set_delta(v53, v24, v15, 0);
        interchange_compression::predictor_profile::set_delta(v54, v24, v15, 0);
        uint64_t result = interchange_compression::predictor_profile::set_delta(v52, v24, v15, 0);
        if (*((_DWORD *)this + 1154) != a2
          && interchange_compression::format_table[52 * *((unsigned int *)this + 1150) + 44 + v8])
        {
          interchange_compression::predictor_profile::set_delta(v47, v24, v15, 0);
          unsigned int v41 = v46;
          int v42 = v24;
          int v43 = v15;
          int v40 = 0;
LABEL_15:
          uint64_t result = interchange_compression::predictor_profile::set_delta(v41, v42, v43, v40);
        }
      }
      else
      {
        interchange_compression::predictor_profile::set_delta(v53, v24, v15, (*v23)[0][0][v8] - (*a3)[0][0][v8] - (*v49 * v24 + *v48 * v15));
        interchange_compression::predictor_profile::set_delta(v54, v24, v15, (*v23)[0][0][v8] - (*a3)[0][0][v8]);
        uint64_t v26 = *(v22 - 1);
        uint64_t v25 = *v22;
        int v27 = &(*a3)[v25][v26][v8];
        uint64_t result = interchange_compression::predictor_profile::set_delta(v52, v24, v15, (*v23)[0][0][v8] - *v27);
        uint64_t v29 = *((unsigned int *)this + 1154);
        if (v29 != a2)
        {
          unsigned int v30 = *((_DWORD *)this + 1150);
          if (interchange_compression::format_table[52 * v30 + 44 + v8])
          {
            unsigned int v31 = *(_DWORD *)&interchange_compression::format_table[52 * v30 + 12 + 4 * v8];
            if (v31 >= 0x21) {
              interchange_compression::compressor::compute_deltas();
            }
            char v32 = *(_DWORD *)&interchange_compression::format_table[52 * v30 + 12 + 4 * v29] - v31;
            unsigned int v33 = (*a3)[0][0][v8] - ((*a3)[0][0][v29] >> v32);
            unsigned int v34 = (*a3)[v25][v26][v29] >> v32;
            unsigned int v35 = (*v23)[0][0][v29] >> v32;
            int v36 = -v31;
            uint64_t v37 = -1 << v31;
            int v38 = (int)(((*v27 - v34) & ~v37) << v36) >> v36;
            int v39 = (int)((((*v23)[0][0][v8] - v35) & ~v37) << v36) >> v36;
            interchange_compression::predictor_profile::set_delta(v47, v24, v15, v39 - ((int)((v33 & ~v37) << v36) >> v36));
            int v40 = v39 - v38;
            unsigned int v41 = v46;
            int v42 = v24;
            int v43 = v15;
            goto LABEL_15;
          }
        }
      }
      ++v24;
      unsigned int v23 = (const unsigned int (*)[4][8][4])((char *)v23 + 16);
      v22 += 2;
    }
    while (v24 != 8);
    ++v15;
    unsigned int v23 = (const unsigned int (*)[4][8][4])((char *)v44 + 128);
    unsigned int v22 = v45 + 16;
  }
  while (v15 != 4);
  return result;
}

uint64_t interchange_compression::compressor::compute_smallest_predictor(interchange_compression::compressor *this, unsigned int a2, unsigned int a3, unsigned int a4)
{
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  char v11 = 0;
  uint64_t v24 = *MEMORY[0x263EF8340];
  v22[0] = 0;
  v22[1] = 0;
  int v23 = 0;
  unsigned int v20 = (char *)this + 1060 * a2;
  uint64_t v21 = a2;
  do
  {
    if (interchange_compression::compressor::valid_predictor(this, v9, a2, a3, a4))
    {
      unsigned int v12 = &v20[v8];
      interchange_compression::predictor_profile::process(&v20[v8], v8 == 424);
      int v13 = vmaxv_u16((uint16x4_t)vmovn_s32(vtstq_s32(*(int32x4_t *)(v12 + 180), *(int32x4_t *)(v12 + 180)))) & 1;
      unsigned int v14 = *(_DWORD *)&interchange_compression::format_table[52 * *((unsigned int *)this + 1150) + 12 + 4 * v21];
      if (v14 == 32) {
        char v15 = 2;
      }
      else {
        char v15 = 1;
      }
      int v16 = v13 << v15;
      if (*((_DWORD *)v12 + 43)) {
        int v17 = *((_DWORD *)v12 + 44);
      }
      else {
        int v17 = 0;
      }
      unsigned int v18 = v17
          + 2 * (v8 == 424) * (v14 >> 1)
          + 4 * v16
          + vaddvq_s32(vmulq_s32(*(int32x4_t *)(v12 + 196), (int32x4_t)xmmword_262C13610));
      *((_DWORD *)v22 + v9) = v18;
      if ((v11 & 1) == 0 || *((_DWORD *)v22 + v10) > v18) {
        uint64_t v10 = v9;
      }
      char v11 = 1;
    }
    ++v9;
    v8 += 212;
  }
  while (v8 != 1060);
  if ((v11 & 1) == 0) {
    interchange_compression::compressor::compute_smallest_predictor();
  }
  return v10;
}

uint64_t interchange_compression::compressor::create_header(interchange_compression::compressor *this, unsigned int (*a2)[4], const unsigned int (*a3)[4][8][4])
{
  BOOL v3 = (interchange_compression::compressor *)((char *)this + 4260);
  *(_OWORD *)((char *)this + 4504) = 0u;
  *(_OWORD *)((char *)this + 4488) = 0u;
  *(_OWORD *)((char *)this + 4472) = 0u;
  *(_OWORD *)((char *)this + 4456) = 0u;
  *(_OWORD *)((char *)this + 4440) = 0u;
  *(_OWORD *)((char *)this + 4424) = 0u;
  *(_OWORD *)((char *)this + 4408) = 0u;
  *(_OWORD *)((char *)this + 4392) = 0u;
  *(_OWORD *)((char *)this + 4376) = 0u;
  *(_OWORD *)((char *)this + 4360) = 0u;
  *(_OWORD *)((char *)this + 4344) = 0u;
  *(_OWORD *)((char *)this + 4328) = 0u;
  *(_OWORD *)((char *)this + 4312) = 0u;
  *(_OWORD *)((char *)this + 4296) = 0u;
  *(_OWORD *)((char *)this + 4280) = 0u;
  *(_OWORD *)((char *)this + 4264) = 0u;
  *(_OWORD *)((char *)this + 4568) = 0u;
  *(_OWORD *)((char *)this + 4584) = 0u;
  *(_OWORD *)((char *)this + 4536) = 0u;
  *(_OWORD *)((char *)this + 4552) = 0u;
  *(_OWORD *)((char *)this + 4520) = 0u;
  if (*((_DWORD *)this + 1150) != 27)
  {
    unint64_t v4 = 0;
    BOOL v5 = (int *)((char *)this + 4636);
    int v36 = (char *)this + 4260;
    unsigned int v35 = (char *)this + 4264;
    int v6 = this;
    int v38 = (interchange_compression::compressor *)((char *)this + 4260);
    do
    {
      unsigned int v7 = (*a2)[v4];
      if (v7 == 3)
      {
        unsigned int v8 = 16;
      }
      else if (v7 == 4)
      {
        unsigned int v8 = 17;
      }
      else
      {
        unsigned int v8 = (*a2)[v4] & 3;
      }
      uint64_t v9 = (char *)v6 + 212 * v7;
      int v10 = *((_DWORD *)v9 + 43);
      char v11 = vaddvq_s32((int32x4_t)vbicq_s8((int8x16_t)xmmword_262C13650, (int8x16_t)vceqzq_s32(*(int32x4_t *)(v9 + 180))));
      if (*((_DWORD *)v9 + 44))
      {
        int v12 = v11 & 0xF;
        char v41 = v8;
        BOOL v3 = v38;
        char v42 = (8 * (v10 != 0)) | (4 * (v12 != 0)) | v8;
        interchange_compression::header::set(v38, 0, v4, (8 * (v10 != 0)) | (4 * (v12 != 0)) | v8);
        interchange_compression::header::set(v38, 1u, v4, *((_DWORD *)v9 + 44) - 1);
        int v13 = this;
        if (v12)
        {
          if (*(_DWORD *)&interchange_compression::format_table[52 * *((unsigned int *)this + 1150) + 12 + 4 * v4] == 32) {
            unsigned int v14 = 2;
          }
          else {
            unsigned int v14 = 1;
          }
          int8x16_t v15 = (int8x16_t)vshlq_u32(*(uint32x4_t *)((char *)v6 + 212 * v7 + 180), vshlq_u32((uint32x4_t)xmmword_262C13630, (uint32x4_t)vdupq_n_s32(v14)));
          *(int8x8_t *)v15.i8 = vorr_s8(*(int8x8_t *)v15.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v15, v15, 8uLL));
          interchange_compression::header::set(v38, 3u, v4, v15.i32[0] | v15.i32[1]);
        }
        if (v10)
        {
          int v16 = *((_DWORD *)v9 + 43);
          int size = interchange_compression::header::get_size(v38, 4u, v4);
          unsigned int v18 = (char *)this + 12 * (v4 + 16);
          *((_DWORD *)v18 + 1066) = size;
          interchange_compression::header::field_container::set_signed((_DWORD *)v18 + 1066, v16);
        }
        if ((v41 & 3) == 2)
        {
          int v19 = *(v5 - 4);
          *(_DWORD *)&v35[12 * (v4 + 20)] = interchange_compression::header::get_size(v38, 5u, v4);
          interchange_compression::header::field_container::set_signed(&v35[12 * (v4 + 20)], v19);
          int v20 = *v5;
          *(_DWORD *)&v35[12 * (v4 + 24)] = interchange_compression::header::get_size(v38, 6u, v4);
          interchange_compression::header::field_container::set_signed(&v35[12 * (v4 + 24)], v20);
        }
        char v21 = v42;
      }
      else
      {
        if ((v11 & 0xF) != 0) {
          interchange_compression::compressor::create_header();
        }
        if (v10) {
          int v22 = 11;
        }
        else {
          int v22 = 3;
        }
        char v21 = v22 | v8;
        BOOL v3 = v38;
        interchange_compression::header::set(v38, 0, v4, v22 | v8);
        int v13 = this;
        int v23 = &v36[12 * (v4 + 4)];
        *((_DWORD *)v23 + 1) = interchange_compression::header::header_layout_table[15 * *((unsigned int *)this + 1065)
                                                                                  + 1
                                                                                  + (v4 + 4)];
        *((void *)v23 + 1) = 0x100000000;
      }
      uint64_t v24 = &interchange_compression::format_table[52 * *((unsigned int *)v13 + 1150)];
      uint64_t v25 = *((unsigned int *)v13 + 1154);
      uint64_t v26 = (*a3)[qword_262C16490[v21 & 3]][qword_262C16470[v21 & 3]];
      unsigned int v27 = v26[v25];
      unsigned int v28 = v26[v4];
      unsigned int v29 = (v28 - (v27 >> (*(_DWORD *)&v24[4 * v25 + 12] - *(_DWORD *)&v24[4 * v4 + 12]))) & ~(-1 << *(_DWORD *)&v24[4 * v4 + 12]);
      if ((v21 & 0x10) != 0) {
        unsigned int v30 = v29;
      }
      else {
        unsigned int v30 = v28;
      }
      interchange_compression::header::set(v3, 2u, v4++, v30);
      int v31 = *((_DWORD *)v13 + 1150);
      int v6 = (interchange_compression::compressor *)((char *)v6 + 1060);
      ++v5;
    }
    while (v4 < *(unsigned int *)&interchange_compression::format_table[52 * v31 + 8]);
    if (v31 == 21 && *((_DWORD *)v13 + 1154) == 2)
    {
      if (!*((_DWORD *)v13 + 1071)) {
        interchange_compression::compressor::compress();
      }
      if (!*((_DWORD *)v13 + 1074)) {
        interchange_compression::compressor::compress();
      }
      unsigned int v32 = *((_DWORD *)v13 + 1070);
      int v33 = *((_DWORD *)v13 + 1073);
      interchange_compression::header::set(v3, 0, 1u, v32 | 0x10);
      interchange_compression::header::set(v3, 0, 2u, v33 & 0xFFFFFFEF | (16 * ((v32 >> 4) & 1)));
    }
  }

  return interchange_compression::header::get_size(v3);
}

void interchange_compression::compressor::pack_pixels(interchange_compression::compressor *this, const unsigned int (*a2)[4][8][4], unsigned __int32 a3, unsigned __int32 a4, unsigned __int8 *a5, unsigned int *a6, unsigned int *a7)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  int v33 = (char *)this + 4652;
  int v8 = *((_DWORD *)this + 1150);
  if (*((unsigned char *)this + 4652))
  {
    *a6 = interchange_compression::memory_parameters[11 * v8 + 10];
    uint64_t v9 = &interchange_compression::memory_parameters[11 * *((unsigned int *)this + 1150) + 6];
  }
  else
  {
    *a6 = interchange_compression::memory_parameters[11 * v8 + 9];
    uint64_t v9 = &interchange_compression::memory_parameters[11 * *((unsigned int *)this + 1150) + 5];
  }
  size_t v10 = *v9;
  *a7 = v10;
  char v11 = &interchange_compression::memory_parameters[11 * *((unsigned int *)this + 1150)];
  unsigned int v13 = v11[9];
  unsigned int v12 = v11[10];
  int v36 = a5;
  int v35 = v10;
  uint64_t v37 = 0;
  char v38 = 0;
  bzero(a5, v10);
  for (unsigned int i = 0; i != 32; ++i)
  {
    uint64_t v15 = *((unsigned int *)this + 1150);
    if (v15 != 27)
    {
      unint64_t v16 = 0;
      int v17 = 0;
      uint32x4_t v18 = (uint32x4_t)vdupq_n_s32(i);
      v19.i64[0] = 0x100000001;
      v19.i64[1] = 0x100000001;
      int8x16_t v20 = (int8x16_t)vshlq_u32((uint32x4_t)vandq_s8((int8x16_t)vshlq_u32(v18, (uint32x4_t)xmmword_262C13640), v19), (uint32x4_t)xmmword_262C13630);
      unsigned __int32 v21 = vorr_s8(*(int8x8_t *)v20.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v20, v20, 8uLL)).u32[0] | v20.i32[1];
      int8x16_t v22 = (int8x16_t)vshlq_u32((uint32x4_t)vandq_s8((int8x16_t)vshlq_u32(v18, (uint32x4_t)xmmword_262C13620), v19), (uint32x4_t)xmmword_262C13630);
      unsigned __int32 v23 = vorr_s8(*(int8x8_t *)v22.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v22, v22, 8uLL)).u32[0] | v22.i32[1];
      BOOL v24 = v21 >= a3 || v23 >= a4;
      unint64_t v25 = ((unint64_t)v23 << 7) + 16 * v21;
      int v26 = !v24;
      unsigned int v27 = (char *)*a2 + v25;
      do
      {
        if (v26) {
          int v28 = *(_DWORD *)&v27[4 * v16];
        }
        else {
          int v28 = 0;
        }
        if (v12 == v13 || !*v33)
        {
          bit_pack::pack((bit_pack *)v34, v28, *(_DWORD *)&interchange_compression::format_table[52 * v15 + 12 + 4 * v16]);
          uint64_t v15 = *((unsigned int *)this + 1150);
        }
        else
        {
          bit_pack::pack((bit_pack *)v34, v28 << (interchange_compression::format_table[52 * v15 + 28 + 4 * v16] - v17), *(_DWORD *)&interchange_compression::format_table[52 * v15 + 12 + 4 * v16]- v17+ *(_DWORD *)&interchange_compression::format_table[52 * v15 + 28 + 4 * v16]);
          uint64_t v15 = *((unsigned int *)this + 1150);
          unsigned int v29 = &interchange_compression::format_table[52 * v15 + 4 * v16];
          int v17 = *((_DWORD *)v29 + 7) + *((_DWORD *)v29 + 3);
        }
        ++v16;
      }
      while (v16 < *(unsigned int *)&interchange_compression::format_table[52 * v15 + 8]);
    }
  }
}

void *interchange_compression::format_info::pack_pixel(interchange_compression::format_info *this, unsigned __int8 *__dst, unsigned int *a3)
{
  __src[2] = *MEMORY[0x263EF8340];
  __src[0] = 0;
  __src[1] = 0;
  uint64_t v3 = *((unsigned int *)this + 2);
  if (v3)
  {
    unint64_t v4 = (unsigned int *)((char *)this + 28);
    do
    {
      uint64_t v5 = -1 << *(v4 - 4);
      unsigned int v7 = *a3++;
      uint64_t v6 = v7;
      unsigned int v8 = *v4++;
      *(void *)((char *)__src + (((unint64_t)v8 >> 3) & 0x1FFFFFF8)) |= (v6 & ~v5) << v8;
      --v3;
    }
    while (v3);
  }
  return memcpy(__dst, __src, *((unsigned int *)this + 1));
}

void *bit_pack::pack(bit_pack *this, int a2, int a3)
{
  if (*((unsigned char *)this + 544)) {
    bit_pack::pack();
  }
  unint64_t v5 = *((unsigned int *)this + 134);
  int v6 = *((_DWORD *)this + 128);
  if ((int)v5 + a3 > (8 * v6)) {
    bit_pack::pack();
  }
  uint64_t v7 = a2 & ~(-1 << a3);
  unsigned int v8 = v6 - (*((_DWORD *)this + 134) >> 3);
  if (v8 >= 8) {
    size_t v9 = 8;
  }
  else {
    size_t v9 = v8;
  }
  uint64_t __dst = 0;
  size_t v10 = (void *)(*((void *)this + 65) + (v5 >> 3));
  memcpy(&__dst, v10, v9);
  __dst |= v7 << (v5 & 7);
  uint64_t result = memcpy(v10, &__dst, v9);
  *((_DWORD *)this + 134) += a3;
  return result;
}

void *interchange_compression::compressor::pack_header(interchange_compression::compressor *this, bit_pack *a2, char a3, unsigned int *a4)
{
  int v6 = 0;
  unsigned int v7 = 0;
  uint64_t v8 = *((unsigned int *)this + 1150);
  unsigned int v9 = interchange_compression::memory_parameters[11 * v8 + 7];
  unsigned int v18 = v9 - 8;
  size_t v10 = (interchange_compression::compressor *)((char *)this + 4260);
  int v20 = ~(-1 << (8 - v9));
  unsigned int v21 = 8 - v9;
  uint64_t v11 = v8;
  do
  {
    if (v7 == 2 || (a3 & 1) == 0)
    {
      if (v7 == 2 && (a3 & 1) == 0)
      {
        bit_pack::pack(a2, 0, interchange_compression::header::header_layout_table[15 * v11 + 13] + v18 - *((_DWORD *)a2 + 134));
        uint64_t v8 = *((unsigned int *)this + 1150);
      }
      if (v8 == 27)
      {
        uint64_t v11 = 27;
      }
      else
      {
        unint64_t v12 = 0;
        do
        {
          int size = interchange_compression::header::get_size(v10, v7, v12);
          if (size)
          {
            if (!*((_DWORD *)this + 3 * (v6 + v12) + 1068)) {
              interchange_compression::compressor::compress();
            }
            int v14 = size;
            unsigned int v15 = *((_DWORD *)this + 3 * (v6 + v12) + 1067);
            if (!(v7 | v12))
            {
              *a4 = (v15 & v20) << interchange_compression::memory_parameters[11 * *((unsigned int *)this + 1150) + 7];
              v15 >>= v21;
              int v14 = size - v21;
            }
            if (v7 != 6)
            {
              bit_pack::pack(a2, v15, v14);
              if (v7 == 5)
              {
                if (!*((_DWORD *)this + 3 * (v12 + 24) + 1068)) {
                  interchange_compression::compressor::compress();
                }
                bit_pack::pack(a2, *((_DWORD *)this + 3 * (v12 + 24) + 1067), v14);
              }
            }
          }
          ++v12;
          uint64_t v8 = *((unsigned int *)this + 1150);
          uint64_t v11 = v8;
        }
        while (v12 < *(unsigned int *)&interchange_compression::format_table[52 * v8 + 8]);
      }
    }
    ++v7;
    v6 += 4;
  }
  while (v7 != 7);
  int v16 = interchange_compression::header::get_size(v10) + v18 - *((_DWORD *)a2 + 134);

  return bit_pack::pack(a2, 0, v16);
}

void *interchange_compression::compressor::pack_deltas(void *this, bit_pack *a2, unsigned int *a3, unsigned __int32 a4, unsigned __int32 a5)
{
  uint64_t v7 = (uint64_t)this;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  do
  {
    int v10 = 0;
    unsigned int v11 = interchange_compression::NUM_PIXELS_REGION[v9];
    if (v11 <= 1) {
      unsigned int v11 = 1;
    }
    unsigned int v32 = v11;
    int v12 = *(_DWORD *)(v7 + 4600);
    uint64_t v31 = v9;
    int v13 = 8 * v9;
    do
    {
      int v33 = v10 + 1;
      if (v12 == 27)
      {
        int v12 = 27;
      }
      else
      {
        unint64_t v14 = 0;
        if (v31) {
          int v15 = v10;
        }
        else {
          int v15 = v10 + 1;
        }
        BOOL v16 = v10 != 6 || v31 != 0;
        uint64_t v17 = v7;
        do
        {
          int v18 = v15;
          if (!v16)
          {
            unsigned int v19 = a3[v14];
            if (v19 == 4 || v19 == 1) {
              int v18 = 0;
            }
            else {
              int v18 = 7;
            }
          }
          unsigned int v21 = a3[v14];
          if (*(_DWORD *)(v17 + v8 + 212 * v21 + 180)) {
            int v22 = 0;
          }
          else {
            int v22 = *(_DWORD *)(v17 + 212 * v21 + 172);
          }
          uint32x4_t v23 = (uint32x4_t)vdupq_n_s32(v18 + v13);
          v24.i64[0] = 0x100000001;
          v24.i64[1] = 0x100000001;
          int8x16_t v25 = (int8x16_t)vshlq_u32((uint32x4_t)vandq_s8((int8x16_t)vshlq_u32(v23, (uint32x4_t)xmmword_262C13640), v24), (uint32x4_t)xmmword_262C13630);
          int8x16_t v26 = (int8x16_t)vshlq_u32((uint32x4_t)vandq_s8((int8x16_t)vshlq_u32(v23, (uint32x4_t)xmmword_262C13620), v24), (uint32x4_t)xmmword_262C13630);
          unsigned __int32 v27 = vorr_s8(*(int8x8_t *)v26.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v26, v26, 8uLL)).u32[0] | v26.i32[1];
          unsigned __int32 v28 = vorr_s8(*(int8x8_t *)v25.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v25, v25, 8uLL)).u32[0] | v25.i32[1];
          if (v28 >= a4 || v27 >= a5) {
            int v30 = 0;
          }
          else {
            int v30 = *(_DWORD *)(v17 + 32 * v27 + 212 * v21 + 4 * v28 + 4) + v22;
          }
          this = bit_pack::pack(a2, v30, *(_DWORD *)(v17 + v8 + 212 * v21 + 196));
          ++v14;
          int v12 = *(_DWORD *)(v7 + 4600);
          v17 += 1060;
        }
        while (v14 < *(unsigned int *)&interchange_compression::format_table[52 * v12 + 8]);
      }
      int v10 = v33;
    }
    while (v33 != v32);
    uint64_t v9 = v31 + 1;
    v8 += 4;
  }
  while (v31 != 3);
  return this;
}

uint64_t interchange_compression::compressor::valid_predictor(interchange_compression::compressor *this, unsigned int a2, int a3, unsigned int a4, unsigned int a5)
{
  BOOL v5 = *((_DWORD *)this + 1154) == a3
    || interchange_compression::format_table[52 * *((unsigned int *)this + 1150) + 44 + a3] == 0;
  if ((a4 < 4 || a5 <= 1) && a2 != 3 && a2) {
    return 0;
  }
  if (!*((_DWORD *)this + a2 + 1060)) {
    return 0;
  }
  if (a2 - 3 < 2 && v5) {
    return 0;
  }
  if (!a2) {
    goto LABEL_31;
  }
  if (a2 == 4 || v5 && *((unsigned char *)this + 4612)) {
    return 0;
  }
  if (a2 <= 2)
  {
LABEL_31:
    if (!*((unsigned char *)this + 4612)) {
      BOOL v5 = 1;
    }
    if (!v5) {
      return 0;
    }
  }
  if (a2 == 1) {
    return *((_DWORD *)this + 1150) != 26;
  }
  if (a2 != 2) {
    return 1;
  }
  unsigned int v7 = *((_DWORD *)this + 1150);
  BOOL v8 = v7 >= 0x17;
  unsigned int v9 = (0x4000C3u >> v7) & 1;
  if (v8) {
    return 0;
  }
  else {
    return v9;
  }
}

_DWORD *interchange_compression::predictor_profile::set_delta(_DWORD *this, int a2, int a3, int a4)
{
  if (*this >= 0x21u) {
    interchange_compression::compressor::compute_deltas();
  }
  int v4 = (int)((a4 & ~(-1 << *this)) << -(char)*this) >> -(char)*this;
  if (v4 > this[34]) {
    this[34] = v4;
  }
  if (v4 < this[33]) {
    this[33] = v4;
  }
  uint64_t v5 = (a2 & 0xFFFFFFFC | a3) >> 1;
  int v6 = &this[v5];
  int v8 = v6[39];
  unsigned int v7 = v6 + 39;
  if (v4 > v8) {
    *unsigned int v7 = v4;
  }
  unsigned int v9 = &this[v5];
  int v11 = v9[35];
  int v10 = v9 + 35;
  if (v4 < v11) {
    *int v10 = v4;
  }
  this[8 * a3 + 1 + a2] = v4;
  return this;
}

_DWORD *interchange_compression::predictor_profile::process(_DWORD *this, int a2)
{
  int v2 = this[34];
  if (v2)
  {
    if (v2 >= 0) {
      unsigned int v3 = this[34];
    }
    else {
      unsigned int v3 = -v2;
    }
    for (int i = 31; i != -1; --i)
    {
      if ((v3 >> i)) {
        break;
      }
    }
    if (v3 == 1 << i && v2 < 0) {
      int v6 = 1;
    }
    else {
      int v6 = 2;
    }
    unsigned int v7 = v6 + i;
  }
  else
  {
    unsigned int v7 = 0;
  }
  int v8 = this[33];
  if (v8)
  {
    if (v8 >= 0) {
      unsigned int v9 = this[33];
    }
    else {
      unsigned int v9 = -v8;
    }
    for (int j = 31; j != -1; --j)
    {
      if ((v9 >> j)) {
        break;
      }
    }
    if (v9 == 1 << j && v8 < 0) {
      int v12 = 1;
    }
    else {
      int v12 = 2;
    }
    unsigned int v13 = v12 + j;
  }
  else
  {
    unsigned int v13 = 0;
  }
  if (v7 <= v13) {
    unsigned int v7 = v13;
  }
  unsigned int v14 = v2 - v8;
  for (int k = 31; k != -1; --k)
  {
    if ((v14 >> k)) {
      break;
    }
  }
  unsigned int v16 = k + 1;
  int v17 = (-1 << k) - v8;
  if (v7 >= k + 1) {
    unsigned int v18 = k + 1;
  }
  else {
    unsigned int v18 = v7;
  }
  if (v7 <= v16) {
    int v17 = 0;
  }
  this[43] = v17;
  this[44] = v18;
  if (a2 && !v18)
  {
    unsigned int v18 = 1;
    this[44] = 1;
  }
  for (uint64_t m = 0; m != 4; ++m)
  {
    int v20 = &this[m];
    int v21 = v20[39];
    if (v21)
    {
      if (v21 >= 0) {
        unsigned int v22 = v20[39];
      }
      else {
        unsigned int v22 = -v21;
      }
      for (int n = 31; n != -1; --n)
      {
        if ((v22 >> n)) {
          break;
        }
      }
      if (v22 == 1 << n && v21 < 0) {
        int v25 = 1;
      }
      else {
        int v25 = 2;
      }
      int v21 = v25 + n;
    }
    int v26 = v20[35];
    if (v26)
    {
      if (v26 >= 0) {
        unsigned int v27 = v26;
      }
      else {
        unsigned int v27 = -v26;
      }
      for (iint i = 31; ii != -1; --ii)
      {
        if ((v27 >> ii)) {
          break;
        }
      }
      if (v27 == 1 << ii && v26 < 0) {
        int v30 = 1;
      }
      else {
        int v30 = 2;
      }
      int v26 = v30 + ii;
    }
    if (v21 <= v26) {
      int v21 = v26;
    }
    BOOL v31 = v18 >= v21;
    unsigned int v32 = v18 - v21;
    if (v32 != 0 && v31)
    {
      if (*this == 32) {
        unsigned int v33 = 15;
      }
      else {
        unsigned int v33 = 3;
      }
      if (v33 < v32) {
        unsigned int v32 = v33;
      }
      unsigned int v34 = v18 - v32;
    }
    else
    {
      unsigned int v32 = 0;
      unsigned int v34 = v18;
    }
    int v35 = &this[m];
    v35[45] = v32;
    v35[49] = v34;
  }
  return this;
}

uint64_t interchange_compression::header::set(interchange_compression::header *this, unsigned int a2, unsigned int a3, unsigned int a4)
{
  unsigned int v6 = a3 + 4 * a2;
  uint64_t result = interchange_compression::header::get_size(this, a2, a3);
  *((_DWORD *)this + 3 * v6 + 1) = result;
  if ((unint64_t)a4 >> result) {
    interchange_compression::header::set();
  }
  int v8 = (char *)this + 12 * v6;
  *((_DWORD *)v8 + 2) = a4;
  *((_DWORD *)v8 + 3) = 1;
  return result;
}

uint64_t interchange_compression::header::get_size(interchange_compression::header *this)
{
  int v2 = *(_DWORD *)this;
  uint64_t v3 = interchange_compression::header::header_layout_table[15 * *(unsigned int *)this + 14];
  for (unsigned int i = 3; i != 7; ++i)
  {
    if (v2 == 27)
    {
      int v2 = 27;
    }
    else
    {
      unsigned int v5 = 0;
      do
      {
        uint64_t v3 = interchange_compression::header::get_size(this, i, v5++) + v3;
        int v2 = *(_DWORD *)this;
      }
      while (v5 < *(_DWORD *)&interchange_compression::format_table[52 * *(unsigned int *)this + 8]);
    }
  }
  return v3;
}

uint64_t interchange_compression::header::get_size(interchange_compression::header *this, unsigned int a2, unsigned int a3)
{
  if (a2 <= 1) {
    return interchange_compression::header::header_layout_table[15 * *(unsigned int *)this + 1 + 4 * a2 + a3];
  }
  if (a2 == 4)
  {
    if (!*((_DWORD *)this + 3 * a3 + 3)) {
      interchange_compression::header::get_size();
    }
    if (!*((_DWORD *)this + 3 * a3 + 15)) {
      interchange_compression::header::get_size();
    }
    if ((*((unsigned char *)this + 12 * a3 + 8) & 8) != 0) {
      return (*((_DWORD *)this + 3 * a3 + 14) + 1);
    }
    return 0;
  }
  if (a2 != 3)
  {
    if (a2 == 2) {
      return *(unsigned int *)&interchange_compression::format_table[52 * *(unsigned int *)this + 12 + 4 * a3];
    }
    if (a2 - 5 > 1) {
      interchange_compression::header::get_size();
    }
    if (!*((_DWORD *)this + 3 * a3 + 3)) {
      interchange_compression::header::get_size();
    }
    if ((*((_DWORD *)this + 3 * a3 + 2) & 3) == 2) {
      return *(_DWORD *)&interchange_compression::format_table[52 * *(unsigned int *)this + 12 + 4 * a3] >> 1;
    }
    return 0;
  }
  if (!*((_DWORD *)this + 3 * a3 + 3)) {
    interchange_compression::header::get_size();
  }
  if ((*((unsigned char *)this + 12 * a3 + 8) & 4) == 0) {
    return 0;
  }
  if (*(_DWORD *)&interchange_compression::format_table[52 * *(unsigned int *)this + 12 + 4 * a3] == 32) {
    return 16;
  }
  else {
    return 8;
  }
}

_DWORD *interchange_compression::header::field_container::set_signed(_DWORD *this, int a2)
{
  uint64_t v2 = (1 << (*this - 1));
  if (a2 >= v2 && -(int)v2 <= a2)
  {
    printf("value = %d, miint n = %d, max = %d\n", a2, -(int)v2, v2);
    __assert_rtn("set_signed", "interchange_header.h", 90, "0");
  }
  this[1] = a2;
  this[2] = 1;
  return this;
}

uint64_t interchange_compression::get_id(interchange_compression *this)
{
  int v1 = (int)this;
  int v2 = this - 8;
  uint64_t result = 0;
  switch(v2)
  {
    case 0:
      return result;
    case 1:
    case 3:
    case 5:
    case 6:
    case 7:
      goto LABEL_5;
    case 2:
      uint64_t result = 1;
      break;
    case 4:
      uint64_t result = 2;
      break;
    case 8:
      uint64_t result = 3;
      break;
    default:
      if (v1 == 32)
      {
        uint64_t result = 4;
      }
      else
      {
LABEL_5:
        if (v1 == 2) {
          uint64_t result = 5;
        }
        else {
          uint64_t result = 6;
        }
        if ((v1 | 2) != 2) {
          interchange_compression::get_id(v1);
        }
      }
      break;
  }
  return result;
}

uint64_t interchange_compression::derive_sharing(uint64_t this, uint64_t a2, unsigned int *a3, unsigned int *a4, int (*a5)[4], int (*a6)[4])
{
  int v6 = *(_DWORD *)(a2 + 12);
  if (v6 == 5)
  {
    unsigned int v7 = a3[3];
    if (v7 >= 2) {
      interchange_compression::derive_sharing();
    }
    if (v7) {
      unsigned int v8 = 8;
    }
    else {
      unsigned int v8 = 5;
    }
    a3[3] = v8;
    *(_DWORD *)(a2 + 12) = 1;
  }
  if (!this)
  {
    unsigned int v10 = 0;
    unsigned int v11 = 0;
    goto LABEL_19;
  }
  uint64_t v9 = 0;
  unsigned int v10 = 0;
  unsigned int v11 = 0;
  unsigned int v12 = 0;
  unsigned int v13 = -1;
  do
  {
    unsigned int v14 = a3[v9];
    if (v14 > v12 || v9 == 1 && v14 == v12)
    {
      unsigned int v12 = a3[v9];
      unsigned int v11 = v9;
    }
    if (v14 < v13)
    {
      unsigned int v13 = a3[v9];
      unsigned int v10 = v9;
    }
    int v15 = interchange_compression::dq_consts[160 * *(unsigned int *)(a2 + 4 * v9) + 6 + 10 * v14];
    (*a5)[v9] = v15;
    a4[v9++] = v15;
  }
  while (this != v9);
  if (this != 1)
  {
LABEL_19:
    unsigned int v16 = (v11 + 1) % 3;
    if (v16 == v10) {
      unsigned int v16 = (v11 + 2) % 3;
    }
    unsigned int v17 = a3[v16];
    unsigned int v18 = a3[6 - (v11 + v10) - v16];
    BOOL v19 = v17 > v18;
    if (v17 <= v18) {
      signed int v20 = v16;
    }
    else {
      signed int v20 = 6 - (v11 + v10) - v16;
    }
    if (v19) {
      signed int v21 = v16;
    }
    else {
      signed int v21 = 6 - (v11 + v10) - v16;
    }
    uint64_t v22 = v11;
    unsigned int v23 = a3[v11];
    uint64_t v24 = v10;
    unsigned int v25 = a3[v10];
    if (this == 2)
    {
      if (v23 == v25 || (int)a4[v10] < 1)
      {
LABEL_52:
        if (v6 == 5)
        {
          *(_DWORD *)(a2 + 12) = 5;
          a3[3] = a3[3] != 5;
          if ((int)a4[3] >= 1) {
            interchange_compression::derive_sharing();
          }
        }
        return this;
      }
      (*a5)[v10] = 0;
      unsigned int v26 = a4[v10];
      int v27 = (*a5)[v22];
      goto LABEL_31;
    }
    uint64_t v29 = v20;
    unsigned int v30 = a3[v20];
    uint64_t v31 = v21;
    if (v23 - v30 <= 1 && v25 <= 1)
    {
      (*a5)[v24] = 0;
      unint64_t v36 = 1431655766 * (int)a4[v24];
      (*a5)[v29] += HIDWORD(v36) + (v36 >> 63);
      unint64_t v37 = 1431655766 * (int)(a4[v24] + 1);
      (*a5)[v21] += HIDWORD(v37) + (v37 >> 63);
      unint64_t v38 = 1431655766 * (int)(a4[v24] + 2);
      unsigned int v39 = HIDWORD(v38) + (v38 >> 63);
      unsigned int v40 = (*a5)[v22];
LABEL_46:
      int v28 = v39 + v40;
      goto LABEL_51;
    }
    unsigned int v33 = a3[v21];
    if (v23 - v33 <= 1 && v25 <= 1)
    {
      (*a5)[v24] = 0;
      unsigned int v41 = a4[v29] & ((int)a4[v29] >> 31);
      (*a5)[v29] = v41;
      (*a5)[v31] += (int)(a4[v24] - v41 + a4[v29]) / 2;
      unsigned int v42 = a4[v24] + a4[v29] - (*a5)[v29];
      if ((int)(v42 + 1) >= 0) {
        int v43 = v42 + 1;
      }
      else {
        int v43 = v42 + 2;
      }
      int v28 = (*a5)[v22] + (v43 >> 1);
      goto LABEL_51;
    }
    if (v33 - v25 > 1)
    {
      if (v33 - v25 != 2) {
        goto LABEL_62;
      }
      int v35 = a4[v22];
    }
    else
    {
      int v35 = a4[v22];
      if ((v35 & 0x80000000) == 0) {
        goto LABEL_62;
      }
      this = a4[v31];
      if ((int)this > 0)
      {
LABEL_59:
        int v44 = 0;
        (*a5)[v24] = 0;
        (*a5)[v29] = 0;
        if ((int)(a4[v29] + a4[v24]) >= 6) {
          int v44 = a4[v31];
        }
        (*a5)[v31] = v44;
        unsigned int v39 = a4[v24] - v44 + a4[v29];
        unsigned int v40 = a4[v31] + (*a5)[v22];
        goto LABEL_46;
      }
    }
    if (v35 <= -2 && (int)a4[v31] >= 1) {
      goto LABEL_59;
    }
LABEL_62:
    if (!v25 || (int)a4[v24] < 1 || (int)a4[v29] < 1 || (a4[v31] & 0x80000000) != 0 || (int)a4[v22] > -2)
    {
      if (v23 != v25 && (int)a4[v24] >= 1)
      {
        (*a5)[v24] = 0;
        (*a5)[v22] += a4[v24];
      }
      if (v33 != v30 && (int)a4[v29] >= 1)
      {
        (*a5)[v29] = 0;
        (*a5)[v31] += a4[v29];
      }
      goto LABEL_52;
    }
    (*a5)[v24] = 0;
    (*a5)[v29] = 0;
    (*a5)[v31] = a4[v31];
    int v27 = a4[v29];
    unsigned int v26 = a4[v24] + (*a5)[v22];
LABEL_31:
    int v28 = v27 + v26;
LABEL_51:
    (*a5)[v22] = v28;
    goto LABEL_52;
  }
  return this;
}

uint64_t interchange_compression::adjust_level(uint64_t this, int a2, int a3, int a4, _DWORD *a5, unsigned int *a6, unsigned int *a7)
{
  int v7 = a4 - a3;
  if (a4 - a3 < 0)
  {
    if (interchange_compression::dq_consts[160 * this + 7 + 10 * a2] < a3 - a4)
    {
      --*a6;
      if (!interchange_compression::dq_consts[160 * this + 8 + 10 * a2])
      {
        int v7 = -1;
        goto LABEL_4;
      }
    }
  }
  else if (a4 != a3)
  {
    *a6 += v7;
LABEL_4:
    *a5 += v7;
  }
  return this;
}

uint64_t interchange_compression::encode_mode(uint64_t this, unsigned int a2, int a3, int *a4, unsigned int *a5, unsigned int *a6, unsigned int *a7, unsigned int *a8)
{
  *a5 = 0;
  *a7 = 0;
  if (this < 0x10)
  {
    if (this != 2)
    {
      if ((this & 0xFFFFFFFD) == 8)
      {
        *a4 = 3;
        if (!(a3 | a2))
        {
          *a5 = 2;
          *a6 = 0;
          *a7 = 0;
          return this;
        }
        unsigned int v9 = a2 - 2;
        if (a2 <= 2)
        {
          *a5 = 2;
          *a6 = 0;
          *a7 = a2 + 1;
          return this;
        }
      }
      else
      {
        if (this != 12) {
          interchange_compression::encode_mode();
        }
        *a4 = 3;
        unsigned int v9 = a2 - 3;
        if (a2 <= 3)
        {
          *a5 = 2;
          *a6 = 0;
          *a7 = a2;
          return this;
        }
      }
      *a6 = v9;
      return this;
    }
    int v8 = 1;
  }
  else
  {
    int v8 = 4;
  }
  *a4 = v8;
  *a6 = a2;
  return this;
}

interchange_compression::decompressor *interchange_compression::decompressor::decompressor(interchange_compression::decompressor *this, unsigned int a2, interchange_compression *a3, unsigned int a4)
{
  *(_DWORD *)this = a2;
  if (interchange_compression::header::header_layout_table[15 * a2] != a2) {
    interchange_compression::compressor::compressor();
  }
  int v5 = (int)a3;
  *(_OWORD *)((char *)this + 4) = 0u;
  *(_OWORD *)((char *)this + 308) = 0u;
  *(_OWORD *)((char *)this + 324) = 0u;
  *(_OWORD *)((char *)this + 276) = 0u;
  *(_OWORD *)((char *)this + 292) = 0u;
  *(_OWORD *)((char *)this + 244) = 0u;
  *(_OWORD *)((char *)this + 260) = 0u;
  *(_OWORD *)((char *)this + 212) = 0u;
  *(_OWORD *)((char *)this + 228) = 0u;
  *(_OWORD *)((char *)this + 180) = 0u;
  *(_OWORD *)((char *)this + 196) = 0u;
  *(_OWORD *)((char *)this + 148) = 0u;
  *(_OWORD *)((char *)this + 164) = 0u;
  *(_OWORD *)((char *)this + 116) = 0u;
  *(_OWORD *)((char *)this + 132) = 0u;
  *(_OWORD *)((char *)this + 84) = 0u;
  *(_OWORD *)((char *)this + 100) = 0u;
  *(_OWORD *)((char *)this + 52) = 0u;
  *(_OWORD *)((char *)this + 68) = 0u;
  *(_OWORD *)((char *)this + 20) = 0u;
  *(_OWORD *)((char *)this + 36) = 0u;
  *((_DWORD *)this + 85) = a2;
  *((_DWORD *)this + 87) = a3;
  *((_DWORD *)this + 88) = a4;
  if (!interchange_compression::check_valid_lossy_level(a3, a2)) {
    interchange_compression::decompressor::decompressor();
  }
  if (v5 && a4 >= 4) {
    interchange_compression::decompressor::decompressor();
  }
  *((_DWORD *)this + 86) = interchange_compression::format_table[52 * a2 + 48];
  return this;
}

uint64_t interchange_compression::decompressor::get_subblock_size(interchange_compression::decompressor *this, unsigned int a2)
{
  if (a2 >= 0xF0)
  {
    uint64_t v2 = *((unsigned int *)this + 87);
    if ((v2 - 1) <= 2) {
      return interchange_compression::lossy_parameters[28 * *((unsigned int *)this + 85) + 8 + v2];
    }
  }
  int v4 = *((_DWORD *)this + 85);
  if (interchange_compression::memory_parameters[11 * v4 + 8] == a2) {
    return ((a2 & ~(-1 << interchange_compression::memory_parameters[11 * v4 + 7])) + 1) << (v4 == 26);
  }
  if (interchange_compression::memory_parameters[11 * v4 + 9] == a2) {
    return interchange_compression::memory_parameters[11 * v4 + 5];
  }
  if (!a2) {
    return 0;
  }
  int v5 = (char *)&interchange_compression::memory_parameters[11 * v4];
  unsigned int v6 = ((a2 & ~(-1 << *((_DWORD *)v5 + 7))) + 1) << (v4 == 26);
  unsigned int v7 = *((_DWORD *)v5 + 5);
  if (v7 >= v6) {
    return v6;
  }
  else {
    return v7;
  }
}

uint64_t interchange_compression::decompressor::fill_subblock_error_color(uint64_t this, unsigned int (*a2)[4][8][4])
{
  unsigned int v2 = 0;
  v3.i64[0] = 0x100000001;
  v3.i64[1] = 0x100000001;
  do
  {
    uint64_t v4 = *(unsigned int *)(this + 340);
    if (v4 != 27)
    {
      unint64_t v5 = 0;
      uint32x4_t v6 = (uint32x4_t)vdupq_n_s32(v2);
      int8x16_t v7 = (int8x16_t)vshlq_u32((uint32x4_t)vandq_s8((int8x16_t)vshlq_u32(v6, (uint32x4_t)xmmword_262C13640), v3), (uint32x4_t)xmmword_262C13630);
      int8x16_t v8 = (int8x16_t)vshlq_u32((uint32x4_t)vandq_s8((int8x16_t)vshlq_u32(v6, (uint32x4_t)xmmword_262C13620), v3), (uint32x4_t)xmmword_262C13630);
      unsigned int v9 = (*a2)[(unint64_t)(vorr_s8(*(int8x8_t *)v8.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL)).u32[0] | v8.i32[1])][vorr_s8(*(int8x8_t *)v7.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v7, v7, 8uLL)).u32[0] | v7.i32[1]];
      do
      {
        if (v5 == 1) {
          int v10 = 0;
        }
        else {
          int v10 = ~(-1 << *(_DWORD *)&interchange_compression::format_table[52 * v4 + 12 + 4 * v5]);
        }
        v9[v5++] = v10;
        uint64_t v4 = *(unsigned int *)(this + 340);
      }
      while (v5 < *(unsigned int *)&interchange_compression::format_table[52 * v4 + 8]);
    }
    ++v2;
  }
  while (v2 != 32);
  return this;
}

uint64_t bit_pack::unpack(bit_pack *this, unsigned int a2)
{
  if (a2 >= 0x21) {
    bit_pack::unpack();
  }
  uint64_t result = bit_pack::get(this, *((_DWORD *)this + 135), a2);
  *((_DWORD *)this + 135) += a2;
  return result;
}

void *interchange_compression::format_info::unpack_pixel(interchange_compression::format_info *this, const unsigned __int8 *a2, unsigned int *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  size_t v6 = *((unsigned int *)this + 1);
  if (v6 <= 0xF) {
    size_t v7 = 16 - v6;
  }
  else {
    size_t v7 = 0;
  }
  bzero(&__dst[v6], v7);
  uint64_t result = memcpy(__dst, a2, v6);
  if (*((_DWORD *)this + 2))
  {
    unint64_t v9 = 0;
    do
    {
      a3[v9] = (*(void *)&__dst[((unint64_t)*((unsigned int *)this + v9 + 7) >> 3) & 0x1FFFFFF8] >> *((_DWORD *)this + v9 + 7)) & ~(-1 << *((_DWORD *)this + v9 + 3));
      ++v9;
    }
    while (v9 < *((unsigned int *)this + 2));
  }
  return result;
}

BOOL interchange_compression::decompressor::unpack_header(interchange_compression::decompressor *this, const unsigned __int8 *a2, unsigned int a3, bit_pack *a4)
{
  int v4 = *((_DWORD *)this + 85);
  unsigned int v5 = interchange_compression::memory_parameters[11 * v4 + 7];
  unsigned int v6 = 8 - v5;
  unsigned int v7 = interchange_compression::header::header_layout_table[15 * v4 + 1];
  unsigned int v8 = v7 - (8 - v5);
  if (v7 <= 8 - v5) {
    interchange_compression::decompressor::unpack_header();
  }
  int v10 = *((_DWORD *)a4 + 128);
  unsigned int v11 = v6 + 8 * v10;
  if (v11 < interchange_compression::header::header_layout_table[15 * v4 + 14]) {
    return 0;
  }
  unsigned int v14 = v5 - 8;
  int v15 = (a3 >> v5) & ~(-1 << v6);
  int v16 = 8 * v10;
  int v17 = bit_pack::unpack(a4, v8);
  *(_OWORD *)((char *)this + 20) = 0u;
  *(_OWORD *)((char *)this + 36) = 0u;
  *(_OWORD *)((char *)this + 52) = 0u;
  *(_OWORD *)((char *)this + 68) = 0u;
  *(_OWORD *)((char *)this + 84) = 0u;
  *(_OWORD *)((char *)this + 100) = 0u;
  *(_OWORD *)((char *)this + 116) = 0u;
  *(_OWORD *)((char *)this + 132) = 0u;
  *(_OWORD *)((char *)this + 148) = 0u;
  *(_OWORD *)((char *)this + 164) = 0u;
  *(_OWORD *)((char *)this + 180) = 0u;
  *(_OWORD *)((char *)this + 196) = 0u;
  *(_OWORD *)((char *)this + 212) = 0u;
  *(_OWORD *)((char *)this + 228) = 0u;
  *(_OWORD *)((char *)this + 4) = 0u;
  *(_OWORD *)((char *)this + 244) = 0u;
  *(_OWORD *)((char *)this + 260) = 0u;
  *(_OWORD *)((char *)this + 276) = 0u;
  *(_OWORD *)((char *)this + 292) = 0u;
  *(_OWORD *)((char *)this + 308) = 0u;
  *(_OWORD *)((char *)this + 324) = 0u;
  interchange_compression::header::set(this, 0, 0, (v17 << v6) | v15);
  for (unsigned int i = 1; i != 28; ++i)
  {
    if (i == 12)
    {
      if (v11 < interchange_compression::header::get_size(this)) {
        return 0;
      }
    }
    else
    {
      if (i != 8)
      {
        unsigned int v19 = i >> 2;
        if (i >> 2 == 6) {
          continue;
        }
        goto LABEL_11;
      }
      bit_pack::unpack(a4, interchange_compression::header::header_layout_table[15 * *((unsigned int *)this + 85) + 13]+ v14- *((_DWORD *)a4 + 135));
    }
    unsigned int v19 = i >> 2;
LABEL_11:
    unsigned int size = interchange_compression::header::get_size(this, v19, i & 3);
    unsigned int v21 = bit_pack::unpack(a4, size);
    interchange_compression::header::set(this, v19, i & 3, v21);
    if (v19 == 5)
    {
      unsigned int v22 = interchange_compression::header::get_size(this, 6u, i & 3);
      unsigned int v23 = bit_pack::unpack(a4, v22);
      interchange_compression::header::set(this, 6u, i & 3, v23);
    }
  }
  int v24 = interchange_compression::header::get_size(this);
  bit_pack::unpack(a4, v24 + v14 - *((_DWORD *)a4 + 135));
  int v25 = *((_DWORD *)this + 85);
  if (v25 == 21)
  {
    if (!*((_DWORD *)this + 6)) {
      interchange_compression::compressor::compress();
    }
    if (!*((_DWORD *)this + 9)) {
      interchange_compression::compressor::compress();
    }
    int v26 = *((_DWORD *)this + 5);
    if ((v26 & 0x10) != 0)
    {
      unsigned int v27 = *((_DWORD *)this + 8);
      *((_DWORD *)this + 86) = 2;
      interchange_compression::header::set(this, 0, 1u, v26 & 0xFFFFFFEF | (16 * ((v27 >> 4) & 1)));
      interchange_compression::header::set(this, 0, 2u, v27 & 0xFFFFFFEF);
      int v25 = *((_DWORD *)this + 85);
    }
    else
    {
      int v25 = 21;
    }
  }
  uint64_t v28 = 0;
  int v29 = 0;
  unsigned int v30 = &interchange_compression::format_table[52 * v25];
  LODWORD(v31) = *((_DWORD *)v30 + 2);
  if (v31 <= 1) {
    uint64_t v31 = 1;
  }
  else {
    uint64_t v31 = v31;
  }
  unsigned int v32 = v30 + 12;
  do
  {
    if (v25 != 27)
    {
      uint64_t v33 = 0;
      unsigned int v34 = (char *)this + 12;
      int v35 = (char *)this + 12;
      do
      {
        int v36 = *(_DWORD *)v35;
        v35 += 12;
        if (!v36) {
          interchange_compression::compressor::compress();
        }
        int v37 = *(v34 - 4);
        if ((v37 & 4) != 0)
        {
          if (!*((_DWORD *)this + 3 * (v33 + 12) + 3)) {
            interchange_compression::compressor::compress();
          }
          unsigned int v38 = *((_DWORD *)this + 3 * (v33 + 12) + 2);
        }
        else
        {
          unsigned int v38 = 0;
        }
        if ((~v37 & 3) != 0)
        {
          if (!*((_DWORD *)this + 3 * (v33 + 4) + 3)) {
            interchange_compression::compressor::compress();
          }
          unsigned int v40 = *(_DWORD *)&v32[4 * v33];
          if (v40 == 32) {
            char v41 = 2;
          }
          else {
            char v41 = 1;
          }
          unsigned int v42 = v38 >> (v28 << v41);
          if (v40 == 32) {
            int v43 = 15;
          }
          else {
            int v43 = 3;
          }
          unsigned int v39 = *((_DWORD *)this + 3 * (v33 + 4) + 2) - (v42 & v43) + 1;
          if (v39 > v40) {
            return 0;
          }
        }
        else
        {
          unsigned int v39 = 0;
        }
        v29 += interchange_compression::NUM_PIXELS_REGION[v28] * v39;
        ++v33;
        unsigned int v34 = v35;
      }
      while (v31 != v33);
    }
    ++v28;
  }
  while (v28 != 4);
  if (v25 == 26) {
    int v44 = 15;
  }
  else {
    int v44 = 7;
  }
  if (((*((_DWORD *)a4 + 135) + v29 + v44) & ~v44) != v16) {
    return 0;
  }
  return interchange_compression::header::error_check(this) == 0;
}

_DWORD *interchange_compression::decompressor::decompress_pixels(_DWORD *this, const unsigned __int8 *a2, unsigned int a3, bit_pack *a4, unsigned int (*a5)[4][8][4])
{
  unsigned int v6 = this;
  unint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v91 = *MEMORY[0x263EF8340];
  uint64_t v75 = this + 3;
  unsigned int v85 = a5;
  do
  {
    unsigned int v9 = 0;
    unint64_t v74 = v7;
    unint64_t v10 = v7 >> 2;
    uint64_t v89 = v10 << 6;
    unsigned int v77 = (*a5)[2 * (unint64_t)(v8 & 1)][4 * v10];
    int v84 = 4 * v10;
    if (interchange_compression::NUM_PIXELS_REGION[v8] <= 1u) {
      int v11 = 1;
    }
    else {
      int v11 = interchange_compression::NUM_PIXELS_REGION[v8];
    }
    uint64_t v12 = v6[85];
    uint64_t v13 = v12;
    int v87 = v11;
    do
    {
      if (v13 == 27)
      {
        unsigned int v14 = v9 + 1;
      }
      else
      {
        uint64_t v15 = 0;
        unsigned int v14 = v9 + 1;
        int v16 = v75;
        int v17 = v75;
        do
        {
          int v18 = *v17;
          v17 += 3;
          if (!v18) {
            interchange_compression::compressor::compress();
          }
          char v19 = *((unsigned char *)v16 - 4);
          if ((v19 & 4) != 0)
          {
            if (!v6[3 * (v15 + 12) + 3]) {
              interchange_compression::compressor::compress();
            }
            unsigned int v20 = v6[3 * (v15 + 12) + 2];
          }
          else
          {
            unsigned int v20 = 0;
          }
          int v21 = v19 & 3;
          if (v21 == 3)
          {
            unsigned int v22 = 0;
          }
          else
          {
            if (!v6[3 * (v15 + 4) + 3]) {
              interchange_compression::compressor::compress();
            }
            BOOL v23 = *(_DWORD *)&interchange_compression::format_table[52 * v13 + 12 + 4 * v15] == 32;
            if (*(_DWORD *)&interchange_compression::format_table[52 * v13 + 12 + 4 * v15] == 32) {
              char v24 = 2;
            }
            else {
              char v24 = 1;
            }
            unsigned int v25 = v20 >> (v8 << v24);
            if (v23) {
              int v26 = 15;
            }
            else {
              int v26 = 3;
            }
            unsigned int v22 = v6[3 * (v15 + 4) + 2] - (v25 & v26) + 1;
          }
          this = (_DWORD *)bit_pack::unpack(a4, v22);
          if (v22 >= 0x21) {
            interchange_compression::decompressor::decompress_pixels();
          }
          if (v21 == 1) {
            unsigned int v27 = 0;
          }
          else {
            unsigned int v27 = 7;
          }
          if (v9 != 6) {
            unsigned int v27 = v9 + 1;
          }
          if (v8) {
            unsigned int v27 = v9;
          }
          uint32x4_t v28 = (uint32x4_t)vdupq_n_s32(v27);
          v29.i64[0] = 0x100000001;
          v29.i64[1] = 0x100000001;
          int8x16_t v30 = (int8x16_t)vshlq_u32((uint32x4_t)vandq_s8((int8x16_t)vshlq_u32(v28, (uint32x4_t)xmmword_262C13640), v29), (uint32x4_t)xmmword_262C13630);
          int8x16_t v31 = (int8x16_t)vshlq_u32((uint32x4_t)vandq_s8((int8x16_t)vshlq_u32(v28, (uint32x4_t)xmmword_262C13620), v29), (uint32x4_t)xmmword_262C13630);
          *(_DWORD *)&v90[64
                        * (unint64_t)(vorr_s8(*(int8x8_t *)v31.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v31, v31, 8uLL)).u32[0] | v31.i32[1])+ 16* (vorr_s8(*(int8x8_t *)v30.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v30, v30, 8uLL)).u32[0] | v30.i32[1])+ 4 * v15] = (int)(this << -(char)v22) >> -(char)v22;
          uint64_t v13 = v6[85];
          ++v15;
          int v16 = v17;
        }
        while (v15 < *(_DWORD *)&interchange_compression::format_table[52 * v13 + 8]);
        uint64_t v12 = v6[85];
        a5 = v85;
        int v11 = v87;
      }
      unsigned int v9 = v14;
    }
    while (v14 != v11);
    if (v12 != 27)
    {
      unsigned int v32 = 0;
      uint64_t v33 = (2 * v8) & 2;
      unsigned int v76 = v90;
      do
      {
        if (!v6[3 * v32 + 3]) {
          interchange_compression::compressor::compress();
        }
        uint64_t v34 = v32;
        int v35 = v6[3 * v32 + 2];
        if ((v35 & 4) != 0)
        {
          if (!v6[3 * v32 + 39]) {
            interchange_compression::compressor::compress();
          }
          unsigned int v36 = v6[3 * v32 + 38];
        }
        else
        {
          unsigned int v36 = 0;
        }
        unsigned int v37 = v6[3 * v32 + 2];
        BOOL v38 = *(_DWORD *)&interchange_compression::format_table[52 * v12 + 12 + 4 * v34] == 32;
        if (*(_DWORD *)&interchange_compression::format_table[52 * v12 + 12 + 4 * v34] == 32) {
          char v39 = 2;
        }
        else {
          char v39 = 1;
        }
        unsigned int v40 = v36 >> (v8 << v39);
        if (v38) {
          int v41 = 15;
        }
        else {
          int v41 = 3;
        }
        int v42 = v40 & v41;
        int v43 = v35 & 3;
        if (v43 == 3)
        {
          unsigned int v44 = 0;
          uint64_t v45 = 0;
          uint64_t v46 = 0;
        }
        else
        {
          if (!v6[3 * (v34 + 4) + 3]) {
            interchange_compression::compressor::compress();
          }
          unsigned int v44 = v6[3 * (v34 + 4) + 2] - v42 + 1;
          BOOL v23 = (v35 & 1 | 2) == 2;
          uint64_t v45 = 3;
          if (v23)
          {
            uint64_t v45 = 0;
            uint64_t v46 = 0;
          }
          else
          {
            uint64_t v46 = 1;
          }
        }
        int v47 = &v6[3 * (v34 + 8)];
        int v49 = v47[3];
        uint64_t v48 = v47 + 3;
        if (!v49) {
          interchange_compression::compressor::compress();
        }
        uint64_t v50 = 0;
        uint64_t v51 = (uint64_t)&v6[3 * (v34 + 8) + 1];
        unsigned int v53 = *(_DWORD *)(v51 + 4);
        int v52 = (_DWORD *)(v51 + 4);
        (*a5)[v46][v45][v34] = v53;
        int v54 = (v42 == 0) & (v37 >> 3);
        uint64_t v55 = (uint64_t)&v6[3 * (v34 + 16) + 1];
        this = (_DWORD *)(v55 + 8);
        int v56 = (int *)(v55 + 4);
        uint64_t v57 = (uint64_t)&v6[3 * (v34 + 20) + 1];
        uint64_t v83 = (_DWORD *)(v57 + 8);
        uint64_t v58 = (uint64_t)&v6[3 * (v34 + 24) + 1];
        int v81 = (_DWORD *)(v58 + 4);
        int v82 = (_DWORD *)(v58 + 8);
        int v80 = (_DWORD *)(v57 + 4);
        char v59 = 1;
        do
        {
          uint64_t v60 = 0;
          unsigned int v61 = 0;
          char v78 = v59;
          uint64_t v62 = -v50;
          uint64_t v88 = v8 & 1 ^ v50 ^ 1;
          int v86 = v50 | v33;
          uint64_t v64 = &v77[32 * v50];
          int v65 = 3;
          BOOL v66 = &v76[64 * v50];
          do
          {
            if (v62 != v33 || v89 + v60 * 4)
            {
              if (v54)
              {
                if (!*this) {
                  interchange_compression::compressor::compress();
                }
                int v67 = *v56;
              }
              else
              {
                int v67 = 0;
              }
              if (v44 >= 0x21) {
                interchange_compression::decompressor::decompress_pixels();
              }
              int v68 = v67 << (-(char)v44 & 0x1F) >> (-(char)v44 & 0x1F);
              if (v43 == 2)
              {
                if (!*v83) {
                  interchange_compression::compressor::compress();
                }
                unsigned int v72 = *(_DWORD *)&interchange_compression::format_table[52 * v6[85] + 12 + 4 * v34];
                if (v72 >= 0x42) {
                  interchange_compression::decompressor::decompress_pixels();
                }
                if (!*v82) {
                  interchange_compression::compressor::compress();
                }
                if (!*v48) {
                  interchange_compression::compressor::compress();
                }
                if (v72 >= 0x21) {
                  interchange_compression::compressor::compute_deltas();
                }
                a5 = v85;
                int v73 = (int)(((*v52
                            - v68
                            + *(_DWORD *)&v66[v60 * 4]
                            + ((int)(*v81 << -(v72 >> 1)) >> -(v72 >> 1)) * v86
                            + ((int)(*v80 << -(v72 >> 1)) >> -(v72 >> 1)) * (v84 + v61)) & ~(-1 << v72)) << -(char)v72) >> -(char)v72;
                goto LABEL_84;
              }
              if (v43 == 1)
              {
                unsigned int v70 = *(_DWORD *)&interchange_compression::format_table[52 * v6[85] + 12 + 4 * v34];
                if (v70 >= 0x21) {
                  interchange_compression::compressor::compute_deltas();
                }
                if ((v8 & 2) != 0) {
                  unsigned int v71 = v61;
                }
                else {
                  unsigned int v71 = v65;
                }
                uint64_t v63 = v88 | v33;
                int v79 = (2 * v8) & 0x3FFFFFFC;
                (*a5)[v63][v79][4 * v71 + v34] = (int)((((*a5)[(unint64_t)dword_262C153C8[16 * v63 + 1 + 2 * v71 + 2 * v79]][dword_262C153C8[16 * v63 + 2 * v71 + 2 * v79]][v34]
                                                       - v68
                                                       + *(_DWORD *)&v90[64 * v88 + 16 * v71 + 4 * v34]) & ~(-1 << v70)) << -(char)v70) >> -(char)v70;
              }
              else
              {
                if (v43)
                {
                  int v73 = (*a5)[0][0][v34];
LABEL_84:
                  v64[v60] = v73;
                  goto LABEL_85;
                }
                if (!*v48) {
                  interchange_compression::compressor::compress();
                }
                unsigned int v69 = *(_DWORD *)&interchange_compression::format_table[52 * v6[85] + 12 + 4 * v34];
                if (v69 >= 0x21) {
                  interchange_compression::compressor::compute_deltas();
                }
                v64[v60] = (int)(((*v52 - v68 + *(_DWORD *)&v66[v60 * 4]) & ~(-1 << v69)) << -(char)v69) >> -(char)v69;
              }
            }
LABEL_85:
            ++v61;
            --v65;
            v60 += 4;
          }
          while (v60 != 16);
          char v59 = 0;
          uint64_t v50 = 1;
        }
        while ((v78 & 1) != 0);
        unsigned int v32 = v34 + 1;
        uint64_t v12 = v6[85];
        v76 += 4;
        ++v77;
      }
      while ((v34 + 1) < *(_DWORD *)&interchange_compression::format_table[52 * v12 + 8]);
    }
    ++v8;
    unint64_t v7 = v74 + 2;
  }
  while (v8 != 4);
  return this;
}

_DWORD *interchange_compression::decompressor::decorrelate(_DWORD *this, unsigned int (*a2)[4][8][4])
{
  uint64_t v2 = 0;
  uint64_t v3 = this[85];
  int v4 = a2;
  do
  {
    uint64_t v5 = 0;
    unsigned int v6 = v4;
    uint64_t v7 = v3;
    do
    {
      if (v7 != 27)
      {
        uint64_t v8 = 0;
        unsigned int v9 = this + 3;
        do
        {
          if (!*v9) {
            interchange_compression::compressor::compress();
          }
          if ((*(unsigned char *)(v9 - 1) & 0x10) != 0)
          {
            uint64_t v10 = this[86];
            if (v8 != v10)
            {
              unsigned int v11 = *(_DWORD *)&interchange_compression::format_table[52 * v7 + 12 + 4 * v8];
              if (v11 >= 0x21) {
                interchange_compression::compressor::compute_deltas();
              }
              (*v6)[0][0][v8] = (int)(((((*a2)[v2][v5][v10] >> (*(_DWORD *)&interchange_compression::format_table[52 * v7 + 12 + 4 * v10]
                                                              - v11))
                                      + (*v6)[0][0][v8]) & ~(-1 << v11)) << -(char)v11) >> -(char)v11;
              uint64_t v3 = this[85];
            }
          }
          (*v6)[0][0][v8] &= ~(-1 << *(_DWORD *)&interchange_compression::format_table[52 * v3 + 12 + 4 * v8]);
          uint64_t v3 = this[85];
          ++v8;
          v9 += 3;
          uint64_t v7 = v3;
        }
        while (v8 < *(_DWORD *)&interchange_compression::format_table[52 * v3 + 8]);
      }
      ++v5;
      unsigned int v6 = (unsigned int (*)[4][8][4])((char *)v6 + 16);
    }
    while (v5 != 8);
    ++v2;
    int v4 = (unsigned int (*)[4][8][4])((char *)v4 + 128);
  }
  while (v2 != 4);
  return this;
}

uint64_t bit_pack::get(bit_pack *this, unsigned int a2, unsigned int a3)
{
  if (a3 >= 0x21) {
    bit_pack::get();
  }
  char v3 = a2;
  unsigned int v4 = *((_DWORD *)this + 134);
  if (a3 + a2 > v4)
  {
    printf("read overflow:  read bit=%d size=%d, total=%d\n", a2, a3, v4);
    __assert_rtn("get", "interchange_bit_pack.h", 84, "0");
  }
  int v5 = *((_DWORD *)this + 128);
  unint64_t __dst = 0;
  uint64_t v6 = 528;
  if (!*((unsigned char *)this + 544)) {
    uint64_t v6 = 520;
  }
  uint64_t v7 = *(void *)((char *)this + v6);
  LODWORD(v8) = v5 - (a2 >> 3);
  if (v8 >= 8) {
    size_t v8 = 8;
  }
  else {
    size_t v8 = v8;
  }
  uint64_t v9 = -1 << a3;
  memcpy(&__dst, (const void *)(v7 + (a2 >> 3)), v8);
  return (__dst >> (v3 & 7)) & ~v9;
}

uint64_t interchange_compression::header::error_check(interchange_compression::header *this)
{
  unsigned int v1 = *(_DWORD *)this;
  if (!*((_DWORD *)this
        + 3 * interchange_compression::format_table[52 * *(unsigned int *)this + 48]
        + 3))
    interchange_compression::compressor::compress();
  LODWORD(v2) = (*((unsigned __int8 *)this
                 + 12 * interchange_compression::format_table[52 * *(unsigned int *)this + 48]
                 + 8) >> 4) & 1;
  if (v1 == 21) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = v2;
  }
  if (v1 != 27)
  {
    uint64_t v4 = 0;
    int v5 = &interchange_compression::format_table[52 * v1];
    LODWORD(v6) = *((_DWORD *)v5 + 2);
    if (v6 <= 1) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = v6;
    }
    uint64_t v7 = (char *)this + 12;
    size_t v8 = v5 + 12;
    uint64_t v9 = (char *)this + 12;
    do
    {
      int v10 = *(_DWORD *)v9;
      v9 += 12;
      if (!v10) {
        interchange_compression::compressor::compress();
      }
      char v11 = *(v7 - 4);
      if ((v11 & 3u) - 1 >= 2) {
        int v12 = v2;
      }
      else {
        int v12 = v2 | 2;
      }
      if ((v11 & 0x10) != 0) {
        LODWORD(v2) = v12;
      }
      if ((v1 > 0x16 || ((1 << v1) & 0x4000C3) == 0) && (v11 & 3) == 2) {
        LODWORD(v2) = v2 | 4;
      }
      int v13 = v11 & 3;
      if (v13 == 3)
      {
        if (!*((_DWORD *)this + 3 * (v4 + 4) + 3)) {
          interchange_compression::compressor::compress();
        }
        if (v11 & 4 | *((_DWORD *)this + 3 * (v4 + 4) + 2)) {
          LODWORD(v2) = v2 | 0x10;
        }
      }
      else
      {
        int v14 = v2 | 8;
        if (v1 != 26) {
          int v14 = v2;
        }
        if (v13 == 1) {
          LODWORD(v2) = v14;
        }
      }
      if (!*((_DWORD *)this + 3 * (v4 + 4) + 3)) {
        interchange_compression::compressor::compress();
      }
      if ((*((_DWORD *)this + 3 * (v4 + 4) + 2) + 1) <= *(_DWORD *)&v8[4 * v4]) {
        uint64_t v2 = v2;
      }
      else {
        uint64_t v2 = v2 | 0x20;
      }
      ++v4;
      uint64_t v7 = v9;
    }
    while (v6 != v4);
  }
  return v2;
}

uint64_t BitstreamReader::initialize(uint64_t this, const unsigned __int8 *a2, unsigned int a3)
{
  if (a3 > 3)
  {
    int v9 = 0;
    unsigned int v10 = *(_DWORD *)a2;
    a2 += 4;
    unsigned int v3 = bswap32(v10);
    unsigned int v8 = a3 - 4;
  }
  else if (a3)
  {
    unsigned int v3 = 0;
    int v4 = 24;
    int v5 = a2;
    unsigned int v6 = a3;
    do
    {
      int v7 = *v5++;
      v3 |= v7 << v4;
      v4 -= 8;
      --v6;
    }
    while (v6);
    unsigned int v8 = 0;
    int v9 = 32 - 8 * a3;
    a2 += a3;
  }
  else
  {
    unsigned int v8 = 0;
    unsigned int v3 = 0;
    int v9 = 32;
  }
  *(_DWORD *)(this + 40) = v9;
  *(_DWORD *)(this + 4) = v3;
  *(_DWORD *)(this + 8) = 0;
  if ((a2 & 3) != 0
    && (int v11 = a2 & 3, v12 = (4 - v11), v12 <= v8))
  {
    int v13 = 0;
    int v14 = 8 * v11;
    if (a3 <= 4) {
      int v15 = 4;
    }
    else {
      int v15 = a3;
    }
    int v16 = v15 + v11;
    int v17 = 32;
    int v18 = a2;
    do
    {
      v17 -= 8;
      int v19 = *v18++;
      v13 |= v19 << v17;
    }
    while (v14 != v17);
    a2 += v12;
    unsigned int v8 = v16 - 8;
    *(_DWORD *)(this + 8) = 32 - v14;
  }
  else
  {
    int v13 = 0;
  }
  *(_DWORD *)this = v13;
  *(void *)(this + 16) = a2;
  *(void *)(this + 24) = &a2[v8 & 0xFFFFFFFC];
  *(void *)(this + 32) = &a2[v8];
  return this;
}

uint64_t BitstreamReader::flushBits(uint64_t this, int a2)
{
  uint64_t v2 = *(unsigned int **)(this + 16);
  unsigned int v3 = *(_DWORD *)(this + 40);
  uint64_t v4 = *(void *)this << a2;
  int v5 = *(_DWORD *)(this + 8) - a2;
  if (v5 < 0)
  {
    int v6 = a2 - *(_DWORD *)(this + 8);
    if ((unint64_t)v2 >= *(void *)(this + 24))
    {
      unint64_t v9 = *(void *)(this + 32);
      if ((unint64_t)v2 >= v9)
      {
        unsigned int v8 = 0;
        int v14 = 32;
      }
      else
      {
        unsigned int v8 = 0;
        int v10 = 8 * v2;
        unint64_t v11 = v9 - (void)v2;
        int v12 = 24;
        do
        {
          int v13 = *(unsigned __int8 *)v2;
          uint64_t v2 = (unsigned int *)((char *)v2 + 1);
          v8 |= v13 << v12;
          v12 -= 8;
          --v11;
        }
        while (v11);
        int v14 = v10 - 8 * v9 + 32;
        uint64_t v2 = *(unsigned int **)(this + 32);
      }
      v3 += v14;
      if (v3 >= 0x3F) {
        unsigned int v3 = 63;
      }
    }
    else
    {
      unsigned int v7 = *v2++;
      unsigned int v8 = bswap32(v7);
    }
    v4 |= (unint64_t)v8 << v6;
    v5 += 32;
  }
  *(void *)this = v4;
  *(_DWORD *)(this + 8) = v5;
  *(void *)(this + 16) = v2;
  *(_DWORD *)(this + 40) = v3;
  return this;
}

uint64_t BitstreamReader::getBits(BitstreamReader *this, int a2)
{
  uint64_t v2 = *(void *)this;
  unsigned int v3 = (unsigned int *)*((void *)this + 2);
  unsigned int v4 = *((_DWORD *)this + 10);
  uint64_t v5 = *(void *)this << a2;
  int v6 = *((_DWORD *)this + 2) - a2;
  if (v6 < 0)
  {
    if ((unint64_t)v3 >= *((void *)this + 3))
    {
      unint64_t v9 = *((void *)this + 4);
      if ((unint64_t)v3 >= v9)
      {
        unsigned int v8 = 0;
        int v14 = 32;
      }
      else
      {
        unsigned int v8 = 0;
        int v10 = 8 * v3;
        unint64_t v11 = v9 - (void)v3;
        int v12 = 24;
        do
        {
          int v13 = *(unsigned __int8 *)v3;
          unsigned int v3 = (unsigned int *)((char *)v3 + 1);
          v8 |= v13 << v12;
          v12 -= 8;
          --v11;
        }
        while (v11);
        int v14 = v10 - 8 * v9 + 32;
        unsigned int v3 = (unsigned int *)*((void *)this + 4);
      }
      v4 += v14;
      if (v4 >= 0x3F) {
        unsigned int v4 = 63;
      }
    }
    else
    {
      unsigned int v7 = *v3++;
      unsigned int v8 = bswap32(v7);
    }
    v5 |= (unint64_t)v8 << (a2 - *((unsigned char *)this + 8));
    v6 += 32;
  }
  *(void *)this = v5;
  *((_DWORD *)this + 2) = v6;
  *((void *)this + 2) = v3;
  *((_DWORD *)this + 10) = v4;
  return (HIDWORD(v2) >> -(char)a2);
}

uint64_t CreateFrameInfoQueue(uint64_t a1, int a2)
{
  uint64_t v3 = (760 * a2);
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  setIntValueForProperty(Mutable, (const __CFString *)*MEMORY[0x263F0ED58], 0);
  setULongLongValueForProperty(Mutable, (const __CFString *)*MEMORY[0x263F0EE48], 1886547826);
  setULongLongValueForProperty(Mutable, (const __CFString *)*MEMORY[0x263F0ED30], v3);
  uint64_t v5 = IOSurfaceCreate(Mutable);
  *(void *)a1 = v5;
  *(_DWORD *)(a1 + 8) = IOSurfaceGetID(v5);
  *(void *)(a1 + 16) = IOSurfaceGetBaseAddress(*(IOSurfaceRef *)a1);
  uint64_t v6 = *(unsigned int *)(a1 + 8);
  *(void *)(a1 + 32) = IOSurfaceGetPixelFormat(*(IOSurfaceRef *)a1) | (unint64_t)(v6 << 32);
  size_t v7 = IOSurfaceGetWidth(*(IOSurfaceRef *)a1) << 48;
  *(void *)(a1 + 40) = v7 & 0xFFFF0000FFFFFFFFLL | ((unint64_t)(unsigned __int16)IOSurfaceGetHeight(*(IOSurfaceRef *)a1) << 32);
  CFRelease(Mutable);
  return 0;
}

void setIntValueForProperty(__CFDictionary *a1, const __CFString *a2, int a3)
{
  int valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(a1, a2, v5);
  CFRelease(v5);
}

void setULongLongValueForProperty(__CFDictionary *a1, const __CFString *a2, uint64_t a3)
{
  uint64_t valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberLongLongType, &valuePtr);
  CFDictionarySetValue(a1, a2, v5);
  CFRelease(v5);
}

uint64_t DestroyFrameInfoQueue(uint64_t a1)
{
  uint64_t v2 = *(const void **)a1;
  if (v2)
  {
    CFRelease(v2);
    *(void *)a1 = 0;
    *(_DWORD *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
    *(void *)(a1 + 32) = 0;
    *(void *)(a1 + 40) = 0;
  }
  return 0;
}

uint64_t GetMaxCompressionSizeExcludingAlpha(int a1, unsigned int a2, float a3)
{
  if (a2 >= 0x556E0)
  {
    int v3 = 294912;
    if (a2 != 349920)
    {
      if (a2 >= 0x65401)
      {
        if (a2 >= 0xA8C01)
        {
          if (a2 > 0xE1000)
          {
            if (a2 >= 0x17BB01)
            {
              if (a2 >= 0x1FA401)
              {
                int v3 = a2 >> 1;
                if (a2 <= 0x240000) {
                  int v3 = 1179648;
                }
              }
              else
              {
                int v3 = 1032192;
              }
            }
            else
            {
              int v3 = 884736;
            }
          }
          else
          {
            int v3 = 516096;
          }
        }
        else
        {
          int v3 = 442368;
        }
      }
      else
      {
        int v3 = 344064;
      }
    }
  }
  else
  {
    int v3 = a2 >> 1;
    if (a2 < 0x2000) {
      int v3 = 4096;
    }
  }
  if (a1 <= 1634755431)
  {
    if (a1 > 1634743399)
    {
      if (a1 != 1634743400)
      {
        if (a1 != 1634743416) {
          goto LABEL_42;
        }
        int v6 = 9 * v3 / 4;
LABEL_49:
        if (v6 <= 4096) {
          int v6 = 4096;
        }
        return v6 & 0x7FFFF000;
      }
    }
    else if (a1 != 1634742376 && a1 != 1634742888)
    {
      goto LABEL_42;
    }
LABEL_34:
    if ((a1 & 0xFFFFFFEF) == 0x61703468)
    {
      int v6 = 3 * v3 / 2;
      goto LABEL_49;
    }
    switch(a1)
    {
      case 1634742376:
        int v3 = 4 * v3 / 9;
        break;
      case 1634759276:
        int v3 = 2 * a2;
        break;
      case 1634742888:
        float v7 = (float)(2 * v3 / 3u);
LABEL_48:
        int v6 = (int)(float)(v7 * a3);
        goto LABEL_49;
    }
    float v7 = (float)v3;
    goto LABEL_48;
  }
  if (a1 <= 1634755438)
  {
    if (a1 != 1634755432)
    {
      if (a1 != 1634755438) {
        goto LABEL_42;
      }
      int v6 = 2 * v3 / 3u;
      goto LABEL_49;
    }
    goto LABEL_34;
  }
  switch(a1)
  {
    case 1634759276:
      goto LABEL_34;
    case 1634755443:
      int v4 = (unint64_t)(31905471351 * v3) >> 32;
      int v5 = v4 >> 4;
      goto LABEL_41;
    case 1634755439:
      int v4 = (unint64_t)(28360418983 * v3) >> 32;
      int v5 = v4 >> 5;
LABEL_41:
      int v6 = v5 + (v4 >> 31);
      goto LABEL_49;
  }
LABEL_42:
  uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
  if (result)
  {
    GetMaxCompressionSizeExcludingAlpha();
    return 0;
  }
  return result;
}

uint64_t GetCompressedFrameSize(int a1, unsigned int a2, float a3, unsigned int *a4, unsigned int *a5)
{
  unsigned int MaxCompressionSizeExcludingAlpha = GetMaxCompressionSizeExcludingAlpha(a1, a2, a3);
  if (MaxCompressionSizeExcludingAlpha)
  {
    if (a4) {
      *a4 = MaxCompressionSizeExcludingAlpha;
    }
    uint64_t v8 = 0;
    if (a5) {
      *a5 = 8 * MaxCompressionSizeExcludingAlpha / 9;
    }
  }
  else
  {
    uint64_t v8 = 3758097084;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      GetCompressedFrameSize();
    }
  }
  return v8;
}

void setDataForProperty(__CFDictionary *a1, const __CFString *a2, UInt8 *bytes, CFIndex length)
{
  CFDataRef v6 = CFDataCreate(0, bytes, length);
  CFDictionarySetValue(a1, a2, v6);

  CFRelease(v6);
}

uint64_t AppleProRes_getCFPreferenceNumber(const __CFString *a1, const __CFString *a2, uint64_t a3)
{
  return a3;
}

uint64_t GetEmptySpotInFrameInfoArray(uint64_t a1)
{
  uint64_t v2 = *(unsigned char **)a1;
  unsigned int v3 = *(_DWORD *)(a1 + 8);
  uint64_t v4 = *(unsigned int *)(a1 + 12);
  pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 24));
  uint64_t v5 = v3 % v4;
  CFDataRef v6 = &v2[760 * v5];
  if (*v6)
  {
    float v7 = *(unsigned char **)(a1 + 16);
    *float v7 = 0;
    if (v4)
    {
      uint64_t v5 = 0;
      CFDataRef v6 = v2;
      while (*v6)
      {
        ++v5;
        v6 += 760;
        if (v4 == v5) {
          goto LABEL_6;
        }
      }
      *float v7 = 1;
    }
    else
    {
LABEL_6:
      gettimeofday(&v11, 0);
      v12.tv_sec = v11.tv_sec + 5;
      v12.tv_nsec = 1000 * v11.tv_usec;
      while (!**(unsigned char **)(a1 + 16))
      {
        if (pthread_cond_timedwait(*(pthread_cond_t **)(a1 + 32), *(pthread_mutex_t **)(a1 + 24), &v12) == 60)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            GetEmptySpotInFrameInfoArray();
          }
LABEL_21:
          uint64_t v5 = 0xFFFFFFFFLL;
          goto LABEL_28;
        }
      }
      if (v4)
      {
        uint64_t v8 = 0;
        CFDataRef v6 = v2;
        while (*v6)
        {
          ++v8;
          v6 += 760;
          if (v4 == v8) {
            goto LABEL_19;
          }
        }
      }
      else
      {
        LODWORD(v8) = 0;
        CFDataRef v6 = 0;
      }
      if (v8 == v4)
      {
LABEL_19:
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          GetEmptySpotInFrameInfoArray();
        }
        goto LABEL_21;
      }
      uint64_t v5 = -723362913 * ((unint64_t)(v6 - v2) >> 3);
    }
  }
  if (v5 != -1 && v6 != 0) {
    *CFDataRef v6 = 1;
  }
LABEL_28:
  pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 24));
  return v5;
}

vImage_Error swizzle64BGRAtoRGBA(unsigned __int16 *a1, unsigned int a2, unsigned int a3, unsigned int a4)
{
  v5.data = a1;
  v5.height = a3;
  v5.width = a2;
  v5.rowBytes = a4;
  return vImagePermuteChannels_ARGB16U(&v5, &v5, swizzle64BGRAtoRGBA(unsigned short *,unsigned int,unsigned int,unsigned int)::permuteMap, 0);
}

uint64_t convert32BGRAtoRGB(uint64_t result, int a2, int a3, unsigned int a4)
{
  if (a3)
  {
    for (int i = 0; i != a3; ++i)
    {
      if (a2)
      {
        uint64_t v5 = 0;
        do
        {
          *(_DWORD *)(result + 4 * v5) = *(_DWORD *)(result + 4 * v5) & 0xC00FFC00 | (*(_DWORD *)(result + 4 * v5) >> 20) & 0x3FF | ((*(_DWORD *)(result + 4 * v5) & 0x3FF) << 20);
          ++v5;
        }
        while (a2 != v5);
      }
      result += a4;
    }
  }
  return result;
}

uint64_t numSlicesPerRow(unsigned int a1, int a2)
{
  uint64_t v2 = 0;
  do
  {
    while (a2 >= a1)
    {
      a2 -= a1;
      uint64_t v2 = (v2 + 1);
    }
    a1 >>= 1;
  }
  while (a2 > 0);
  return v2;
}

uint64_t getNumSlices(int a1, int a2, unsigned int a3)
{
  int v3 = 0;
  signed int v4 = (a1 + 15) >> 4;
  do
  {
    while (v4 >= a3)
    {
      v4 -= a3;
      ++v3;
    }
    a3 >>= 1;
  }
  while (v4 > 0);
  return v3 * ((a2 + 15) >> 4);
}

uint64_t getFrameSize(unsigned __int8 *a1)
{
  return bswap32(*(_DWORD *)a1);
}

uint64_t getMetadataExtensionPtr(unsigned __int8 **a1, unsigned int *a2)
{
  int v2 = 0;
  unsigned int v3 = 1 << (((*a1)[71] >> 1) & 7);
  signed int v4 = (__rev16(*((unsigned __int16 *)*a1 + 4)) + 15) >> 4;
  do
  {
    while (v4 >= v3)
    {
      v4 -= v3;
      ++v2;
    }
    v3 >>= 1;
  }
  while (v4 > 0);
  if (((*a1)[71] & 0x20) == 0) {
    return 0;
  }
  unsigned int v5 = v2 * ((((*a1)[11] | ((*a1)[10] << 8)) + 15) >> 4);
  uint64_t v6 = (*a1)[1] | (**a1 << 8);
  float v7 = &(*a1)[v6];
  *a1 = v7;
  LODWORD(v6) = *a2 - v6;
  *a2 = v6;
  BOOL v8 = v6 >= 2 * v5;
  unsigned int v9 = v6 - 2 * v5;
  if (!v8) {
    return 0;
  }
  unsigned int v10 = 0;
  if (v5)
  {
    do
    {
      unsigned int v11 = *(unsigned __int16 *)v7;
      v7 += 2;
      v10 += bswap32(v11) >> 16;
      *a1 = v7;
      --v5;
    }
    while (v5);
    *a2 = v9;
    if (v9 < v10) {
      return 0;
    }
  }
  *a1 = &v7[v10];
  *a2 = v9 - v10;
  return 1;
}

uint64_t CFArray_AddSInt32(int a1, __CFArray *a2)
{
  int valuePtr = a1;
  CFNumberRef v3 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  if (!v3) {
    return 4294954392;
  }
  CFNumberRef v4 = v3;
  CFArrayAppendValue(a2, v3);
  CFRelease(v4);
  return 0;
}

void createPixelBufferAttributesDictionary(__CFDictionary **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, int a7, int a8, char a9, unsigned char *a10)
{
  uint64_t v52 = a3;
  uint64_t valuePtr = a2;
  uint64_t v50 = a5;
  uint64_t v51 = a4;
  int v48 = 128;
  int v49 = 64;
  CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  int v16 = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  if (a6 > 1278226535)
  {
    if (a6 <= 1651519797)
    {
      if (a6 <= 1278226737) {
        goto LABEL_27;
      }
      if (a6 == 1278226738)
      {
        int v21 = 1278226742;
        goto LABEL_45;
      }
      if (a6 == 1278226742)
      {
        int v18 = 1278226742;
        CFArray_AddSInt32(1278226742, v16);
        goto LABEL_46;
      }
      int v20 = 1634759276;
LABEL_24:
      if (a6 != v20) {
        goto LABEL_47;
      }
      int v18 = 1278226488;
      CFArray_AddSInt32(1278226488, v16);
      if (a6 > 1278226737)
      {
        if (a6 != 1634759276) {
          goto LABEL_47;
        }
        CFArray_AddSInt32(1278226742, v16);
        int v17 = 1651519798;
        CFArray_AddSInt32(1278226536, v16);
        CFArray_AddSInt32(1751411059, v16);
        CFArray_AddSInt32(1652056888, v16);
        goto LABEL_39;
      }
      if (a6 != 1278226488)
      {
LABEL_27:
        int v18 = a6;
        if (a6 != 1278226536)
        {
          if (a6 != 1278226736) {
            goto LABEL_47;
          }
          int v18 = 1278226736;
        }
      }
LABEL_46:
      CFArray_AddSInt32(v18, v16);
      goto LABEL_47;
    }
    if (a6 > 1937125935)
    {
      if (a6 == 1937125936) {
        goto LABEL_36;
      }
      int v18 = a6;
      if (a6 == 1953903152) {
        goto LABEL_46;
      }
      int v19 = 2016686640;
    }
    else
    {
      int v17 = a6;
      if (a6 == 1651519798) {
        goto LABEL_39;
      }
      int v18 = a6;
      if (a6 == 1652056888) {
        goto LABEL_46;
      }
      int v19 = 1751411059;
    }
  }
  else
  {
    if (a6 > 645166639)
    {
      if (a6 <= 875704351)
      {
        if (a6 != 645166640)
        {
          if (a6 != 645428784)
          {
            if (a6 != 875573280) {
              goto LABEL_47;
            }
            CFArray_AddSInt32(1278226742, v16);
            CFArray_AddSInt32(1278226738, v16);
            CFArray_AddSInt32(1278226736, v16);
            CFArray_AddSInt32(1278226488, v16);
            CFArray_AddSInt32(642527542, v16);
            CFArray_AddSInt32(642527538, v16);
            CFArray_AddSInt32(642527536, v16);
LABEL_35:
            int v18 = 642527288;
            goto LABEL_46;
          }
          goto LABEL_40;
        }
        goto LABEL_38;
      }
      if (a6 != 875704352)
      {
        if (a6 == 875704438)
        {
          int v18 = 875704438;
          goto LABEL_46;
        }
        int v20 = 1278226488;
        goto LABEL_24;
      }
LABEL_36:
      CFArray_AddSInt32(1937125936, v16);
      if (a6 != 875704352) {
        goto LABEL_47;
      }
      CFArray_AddSInt32(1953903152, v16);
      CFArray_AddSInt32(2016686640, v16);
      CFArray_AddSInt32(875704438, v16);
      CFArray_AddSInt32(645101104, v16);
LABEL_38:
      int v17 = 645166640;
LABEL_39:
      CFArray_AddSInt32(v17, v16);
      if (a6 != 875704352) {
        goto LABEL_47;
      }
LABEL_40:
      int v21 = 645428788;
LABEL_45:
      int v18 = v21 - 4;
      goto LABEL_46;
    }
    if ((a6 - 642527536) <= 6)
    {
      int v18 = a6;
      if (((1 << (a6 - 48)) & 0x45) != 0) {
        goto LABEL_46;
      }
    }
    if (a6 == 642527288) {
      goto LABEL_35;
    }
    int v19 = 645101104;
  }
  int v18 = a6;
  if (a6 == v19) {
    goto LABEL_46;
  }
LABEL_47:
  if (a10[4])
  {
    if (a6 <= 796423727)
    {
      if (a6 <= 645428785)
      {
        if (a6 > 645101105)
        {
LABEL_92:
          if (a6 == 645101106) {
            goto LABEL_112;
          }
          if (a6 == 645166642)
          {
LABEL_108:
            int v24 = 645166644;
LABEL_126:
            int v22 = v24 - 2;
            goto LABEL_127;
          }
          goto LABEL_141;
        }
        if (a6 != 641234480) {
          goto LABEL_139;
        }
        goto LABEL_75;
      }
      if (a6 <= 762869295)
      {
        if (a6 == 645428786) {
          goto LABEL_125;
        }
        int v22 = a6;
        if (a6 != 758674992) {
          goto LABEL_141;
        }
LABEL_127:
        CFArray_AddSInt32(v22, v16);
        goto LABEL_128;
      }
      if (a6 != 762869296) {
        goto LABEL_131;
      }
    }
    else
    {
      if (a6 > 875704949)
      {
        if (a6 > 1953903153)
        {
          if (a6 == 1953903154) {
            goto LABEL_122;
          }
          goto LABEL_88;
        }
        if (a6 != 875704950)
        {
          int v23 = 1937125938;
LABEL_68:
          if (a6 != v23) {
            goto LABEL_141;
          }
          goto LABEL_116;
        }
LABEL_118:
        int v22 = 875704950;
        goto LABEL_127;
      }
      if (a6 <= 875704351)
      {
        if (a6 != 796423728) {
          goto LABEL_136;
        }
LABEL_72:
        CFArray_AddSInt32(796423728, v16);
        goto LABEL_73;
      }
      if (a6 != 875704352)
      {
        int v23 = 875704864;
        goto LABEL_68;
      }
    }
    CFArray_AddSInt32(762869296, v16);
    if (a6 != 875704352) {
      goto LABEL_76;
    }
    goto LABEL_72;
  }
LABEL_73:
  if (a6 == 875704352 || a6 == 641234480) {
LABEL_75:
  }
    CFArray_AddSInt32(641234480, v16);
LABEL_76:
  if (!a10[4]) {
    goto LABEL_104;
  }
  if (a6 <= 875704351)
  {
    if (a6 > 645428785)
    {
      if (a6 > 762869297)
      {
        if (a6 != 762869298) {
          goto LABEL_136;
        }
LABEL_135:
        CFArray_AddSInt32(762869298, v16);
        if (a6 != 875704864)
        {
LABEL_136:
          if (a6 != 796423730) {
            goto LABEL_141;
          }
        }
LABEL_137:
        CFArray_AddSInt32(796423730, v16);
LABEL_138:
        if (a6 != 875704864)
        {
LABEL_139:
          if (a6 != 641234482) {
            goto LABEL_141;
          }
        }
LABEL_140:
        CFArray_AddSInt32(641234482, v16);
        goto LABEL_141;
      }
      if (a6 == 645428786) {
        goto LABEL_125;
      }
      if (a6 != 758674992) {
        goto LABEL_141;
      }
      goto LABEL_102;
    }
    if (a6 == 641234482) {
      goto LABEL_140;
    }
    goto LABEL_92;
  }
  if (a6 > 1937125937)
  {
    if (a6 > 2016686641)
    {
LABEL_88:
      if (a6 == 2016686642) {
        goto LABEL_121;
      }
      if (a6 != 2084075056) {
        goto LABEL_141;
      }
      goto LABEL_103;
    }
    if (a6 != 1937125938)
    {
      if (a6 != 1953903154) {
        goto LABEL_141;
      }
      goto LABEL_122;
    }
    goto LABEL_116;
  }
  switch(a6)
  {
    case 875704352:
LABEL_102:
      CFArray_AddSInt32(758674992, v16);
      if (a6 != 875704352) {
        goto LABEL_128;
      }
LABEL_103:
      CFArray_AddSInt32(2084075056, v16);
LABEL_104:
      if (a6 <= 875704949)
      {
        if (a6 <= 645428785)
        {
          if (a6 != 645101106)
          {
            if (a6 == 645166642) {
              goto LABEL_108;
            }
LABEL_128:
            if (!a10[4]) {
              goto LABEL_138;
            }
            if (a6 > 796423729)
            {
              if (a6 == 796423730) {
                goto LABEL_137;
              }
              int v27 = 875704864;
              goto LABEL_134;
            }
            if (a6 == 641234482) {
              goto LABEL_140;
            }
LABEL_131:
            int v27 = 762869298;
LABEL_134:
            if (a6 != v27) {
              break;
            }
            goto LABEL_135;
          }
LABEL_112:
          int v24 = 645101108;
          goto LABEL_126;
        }
        if (a6 != 645428786)
        {
          int v25 = 875704864;
LABEL_115:
          if (a6 != v25) {
            goto LABEL_128;
          }
          goto LABEL_116;
        }
LABEL_125:
        int v24 = 645428788;
        goto LABEL_126;
      }
      if (a6 <= 1953903153)
      {
        if (a6 != 875704950)
        {
          int v25 = 1937125938;
          goto LABEL_115;
        }
        goto LABEL_118;
      }
      if (a6 != 1953903154)
      {
        if (a6 != 2016686642) {
          goto LABEL_128;
        }
LABEL_121:
        int v26 = 2016687156;
LABEL_123:
        int v22 = v26 - 514;
        goto LABEL_127;
      }
LABEL_122:
      int v26 = 1953903668;
      goto LABEL_123;
    case 875704864:
LABEL_116:
      CFArray_AddSInt32(1937125938, v16);
      if (a6 != 875704864) {
        goto LABEL_128;
      }
      CFArray_AddSInt32(1953903154, v16);
      CFArray_AddSInt32(2016686642, v16);
      CFArray_AddSInt32(875704950, v16);
      CFArray_AddSInt32(645101106, v16);
      CFArray_AddSInt32(645166642, v16);
      goto LABEL_125;
    case 875704950:
      goto LABEL_118;
  }
LABEL_141:
  if (a7 == 2) {
    goto LABEL_172;
  }
  if (a6 <= 1949458802)
  {
    if (a6 != 875704864 && a6 != 1932681587) {
      goto LABEL_153;
    }
    CFArray_AddSInt32(1932681587, v16);
    if (a6 != 875704864) {
      goto LABEL_153;
    }
    CFArray_AddSInt32(1949458803, v16);
    CFArray_AddSInt32(2016567667, v16);
LABEL_151:
    int v28 = 1983013176;
    goto LABEL_152;
  }
  int v28 = a6;
  switch(a6)
  {
    case 1949458803:
LABEL_152:
      CFArray_AddSInt32(v28, v16);
      break;
    case 1983013176:
      goto LABEL_151;
    case 2016567667:
      int v28 = 2016567667;
      goto LABEL_152;
  }
LABEL_153:
  if (!a7 && !a10[9] && !a9) {
    goto LABEL_172;
  }
  if (a6 <= 645280311)
  {
    if (a6 != 645083763)
    {
      int v29 = a6;
      if (a6 == 645149299)
      {
LABEL_171:
        CFArray_AddSInt32(v29, v16);
        goto LABEL_172;
      }
      goto LABEL_172;
    }
  }
  else
  {
    if (a6 == 645280312)
    {
LABEL_168:
      int v31 = 645280824;
LABEL_170:
      int v29 = v31 - 512;
      goto LABEL_171;
    }
    if (a6 == 645411443)
    {
      int v31 = 645411955;
      goto LABEL_170;
    }
    if (a6 != 875704864) {
      goto LABEL_172;
    }
  }
  CFArray_AddSInt32(645083763, v16);
  if (a6 > 645411442)
  {
    CFArray_AddSInt32(645149299, v16);
    CFArray_AddSInt32(645411443, v16);
    int v30 = 875704864;
  }
  else
  {
    int v30 = 645280312;
  }
  if (a6 == v30) {
    goto LABEL_168;
  }
LABEL_172:
  if (!a8)
  {
    if (a6 <= 1932812658)
    {
      if (a6 <= 645428787)
      {
        int v33 = a6;
        if (a6 == 641234484) {
          goto LABEL_242;
        }
        int v33 = a6;
        if (a6 == 645101108) {
          goto LABEL_242;
        }
        int v34 = 645166644;
        goto LABEL_225;
      }
      int v33 = a6;
      if (a6 == 645428788) {
        goto LABEL_242;
      }
      if (a6 != 875836448)
      {
        if (a6 != 875836534) {
          goto LABEL_243;
        }
        int v33 = 875836534;
        goto LABEL_242;
      }
    }
    else
    {
      if (a6 > 1953903667)
      {
        if (a6 <= 2016687155)
        {
          int v33 = a6;
          if (a6 != 1953903668)
          {
            if (a6 != 1983144248) {
              goto LABEL_243;
            }
LABEL_232:
            int v33 = 1983144248;
          }
LABEL_242:
          CFArray_AddSInt32(v33, v16);
          goto LABEL_243;
        }
        int v33 = a6;
        if (a6 == 2016687156) {
          goto LABEL_242;
        }
        int v34 = 2016698739;
LABEL_225:
        int v33 = a6;
        if (a6 != v34) {
          goto LABEL_243;
        }
        goto LABEL_242;
      }
      if (a6 == 1932812659)
      {
        int v33 = 1932812659;
        goto LABEL_242;
      }
      if (a6 != 1937126452)
      {
        int v34 = 1949589875;
        goto LABEL_225;
      }
    }
    CFArray_AddSInt32(1937126452, v16);
    if (a6 != 875836448)
    {
LABEL_243:
      if (!a7 && !a10[9] && !a9)
      {
LABEL_277:
        if (a6 == 1647392369) {
          goto LABEL_280;
        }
LABEL_278:
        int v36 = 1380013856;
LABEL_279:
        if (a6 != v36) {
          goto LABEL_284;
        }
        goto LABEL_280;
      }
      if (a6 <= 645411954)
      {
        if (a6 != 645084275)
        {
          int v35 = a6;
          if (a6 == 645149811) {
            goto LABEL_283;
          }
LABEL_257:
          int v38 = a6;
          if (a6 != 645280824) {
            goto LABEL_284;
          }
          goto LABEL_276;
        }
      }
      else
      {
        if (a6 > 1380013855) {
          goto LABEL_251;
        }
        if (a6 == 645411955) {
          goto LABEL_273;
        }
        if (a6 != 875836448) {
          goto LABEL_284;
        }
      }
      CFArray_AddSInt32(645084275, v16);
      if (a6 > 645411954)
      {
        CFArray_AddSInt32(645149811, v16);
        CFArray_AddSInt32(645411955, v16);
        int v38 = 645280824;
        goto LABEL_276;
      }
      goto LABEL_257;
    }
    CFArray_AddSInt32(1953903668, v16);
    CFArray_AddSInt32(2016687156, v16);
    CFArray_AddSInt32(875836534, v16);
    CFArray_AddSInt32(645101108, v16);
    CFArray_AddSInt32(645166644, v16);
    CFArray_AddSInt32(645428788, v16);
    CFArray_AddSInt32(641234484, v16);
    CFArray_AddSInt32(1932812659, v16);
    CFArray_AddSInt32(1949589875, v16);
    CFArray_AddSInt32(2016698739, v16);
    goto LABEL_232;
  }
  if (a6 <= 1949589874)
  {
    if (a6 != 875836448 && a6 != 1932812659) {
      goto LABEL_194;
    }
    CFArray_AddSInt32(1932812659, v16);
    if (a6 != 875836448) {
      goto LABEL_194;
    }
    CFArray_AddSInt32(1949589875, v16);
    CFArray_AddSInt32(2016698739, v16);
LABEL_192:
    int v32 = 1983144248;
    goto LABEL_193;
  }
  int v32 = a6;
  switch(a6)
  {
    case 1949589875:
LABEL_193:
      CFArray_AddSInt32(v32, v16);
      break;
    case 1983144248:
      goto LABEL_192;
    case 2016698739:
      int v32 = 2016698739;
      goto LABEL_193;
  }
LABEL_194:
  if (a7 || a10[9] || a9)
  {
    if (a6 > 645428787)
    {
      if (a6 > 1647392368)
      {
        if (a6 <= 1953903667)
        {
          if (a6 != 1647392369)
          {
            if (a6 != 1937126452) {
              goto LABEL_284;
            }
            int v35 = 1937126452;
            goto LABEL_283;
          }
          goto LABEL_280;
        }
        goto LABEL_237;
      }
      if (a6 > 875836533)
      {
        if (a6 == 875836534)
        {
LABEL_267:
          int v35 = 875836534;
LABEL_283:
          CFArray_AddSInt32(v35, v16);
          goto LABEL_284;
        }
        goto LABEL_278;
      }
      if (a6 == 645428788) {
        goto LABEL_281;
      }
      if (a6 != 875836448) {
        goto LABEL_284;
      }
      goto LABEL_269;
    }
    if (a6 > 645149810)
    {
      if (a6 <= 645280823)
      {
        int v35 = a6;
        if (a6 == 645149811) {
          goto LABEL_283;
        }
        goto LABEL_274;
      }
      if (a6 == 645280824) {
        goto LABEL_324;
      }
      if (a6 != 645411955) {
        goto LABEL_284;
      }
LABEL_273:
      unsigned __int16 v37 = 13427;
LABEL_282:
      int v35 = v37 | 0x26780000;
      goto LABEL_283;
    }
    int v38 = a6;
    if (a6 != 641234484)
    {
      if (a6 != 645084275) {
        goto LABEL_263;
      }
LABEL_269:
      CFArray_AddSInt32(645084275, v16);
      if (a6 > 645280823)
      {
        CFArray_AddSInt32(645149811, v16);
        CFArray_AddSInt32(645411955, v16);
LABEL_324:
        CFArray_AddSInt32(645280824, v16);
        goto LABEL_197;
      }
LABEL_274:
      if (a6 != 645166644) {
        goto LABEL_284;
      }
      goto LABEL_275;
    }
LABEL_276:
    CFArray_AddSInt32(v38, v16);
    goto LABEL_277;
  }
LABEL_197:
  if (a6 > 875836533)
  {
    if (a6 <= 1937126451)
    {
      if (a6 == 875836534) {
        goto LABEL_267;
      }
LABEL_251:
      if (a6 != 1380013856)
      {
        int v36 = 1647392369;
        goto LABEL_279;
      }
LABEL_280:
      int v35 = 1647392369;
      goto LABEL_283;
    }
    if (a6 == 1937126452) {
      goto LABEL_228;
    }
LABEL_237:
    if (a6 == 1953903668)
    {
      int v35 = 1953903668;
    }
    else
    {
      if (a6 != 2016687156) {
        goto LABEL_284;
      }
      int v35 = 2016687156;
    }
    goto LABEL_283;
  }
  if (a6 <= 645166643)
  {
    int v38 = a6;
    if (a6 == 641234484) {
      goto LABEL_276;
    }
LABEL_263:
    if (a6 != 645101108) {
      goto LABEL_284;
    }
    int v35 = 645101108;
    goto LABEL_283;
  }
  switch(a6)
  {
    case 645166644:
LABEL_275:
      int v35 = 645166644;
      goto LABEL_283;
    case 645428788:
LABEL_281:
      unsigned __int16 v37 = 30260;
      goto LABEL_282;
    case 875836448:
LABEL_228:
      CFArray_AddSInt32(1937126452, v16);
      if (a6 > 1380013855) {
        goto LABEL_251;
      }
      int v38 = 641234484;
      CFArray_AddSInt32(1953903668, v16);
      CFArray_AddSInt32(2016687156, v16);
      CFArray_AddSInt32(875836534, v16);
      CFArray_AddSInt32(645101108, v16);
      CFArray_AddSInt32(645166644, v16);
      CFArray_AddSInt32(645428788, v16);
      goto LABEL_276;
  }
LABEL_284:
  if (!a10[1]) {
    goto LABEL_314;
  }
  if (a6 > 1651521075)
  {
    if (a6 <= 1735549751)
    {
      if (a6 > 1734501175)
      {
        if (a6 == 1734501176) {
          goto LABEL_320;
        }
        int v39 = 1734504496;
        goto LABEL_307;
      }
      if (a6 != 1651521076)
      {
        int v39 = 1652056888;
        goto LABEL_307;
      }
      goto LABEL_317;
    }
    if (a6 > 1919378231)
    {
      if (a6 == 1919378232) {
        goto LABEL_320;
      }
      int v39 = 1919381552;
    }
    else
    {
      if (a6 == 1735549752) {
        goto LABEL_320;
      }
      int v39 = 1735553072;
    }
    goto LABEL_307;
  }
  if (a6 <= 1650946095)
  {
    if (a6 != 1380013856)
    {
      if (a6 == 1380013906)
      {
LABEL_317:
        CFArray_AddSInt32(1651521076, v16);
        int v40 = 1380013906;
LABEL_318:
        if (a6 != v40) {
          goto LABEL_321;
        }
        goto LABEL_319;
      }
      int v39 = 1650942776;
LABEL_307:
      if (a6 != v39) {
        goto LABEL_321;
      }
LABEL_320:
      CFArray_AddSInt32(a6, v16);
      goto LABEL_321;
    }
  }
  else
  {
    if (a6 <= 1651519797)
    {
      if (a6 == 1650946096)
      {
        a6 = 1650946096;
        goto LABEL_320;
      }
      if (a6 != 1650946098) {
        goto LABEL_321;
      }
      goto LABEL_313;
    }
    if (a6 != 1651519798)
    {
      int v40 = 1651520304;
      goto LABEL_318;
    }
  }
  CFArray_AddSInt32(1651519798, v16);
  if (a6 <= 1650942775)
  {
    CFArray_AddSInt32(1650942776, v16);
    CFArray_AddSInt32(1735549752, v16);
    CFArray_AddSInt32(1919378232, v16);
    CFArray_AddSInt32(1734501176, v16);
    CFArray_AddSInt32(1652056888, v16);
    CFArray_AddSInt32(1650946096, v16);
    CFArray_AddSInt32(1735553072, v16);
    CFArray_AddSInt32(1919381552, v16);
    CFArray_AddSInt32(1734504496, v16);
LABEL_313:
    CFArray_AddSInt32(1650946098, v16);
LABEL_314:
    if (a6 != 1380013906)
    {
      if (a6 == 1651520304)
      {
LABEL_319:
        a6 = 1651520304;
        goto LABEL_320;
      }
      if (a6 != 1651521076) {
        goto LABEL_321;
      }
    }
    goto LABEL_317;
  }
LABEL_321:
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F04180], v16);
  CFRelease(v16);
  CFNumberRef v41 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F04240], v41);
  CFRelease(v41);
  CFNumberRef v42 = CFNumberCreate(0, kCFNumberSInt32Type, &v52);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F04118], v42);
  CFRelease(v42);
  CFNumberRef v43 = CFNumberCreate(0, kCFNumberSInt32Type, &v51);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F040F8], v43);
  CFRelease(v43);
  CFNumberRef v44 = CFNumberCreate(0, kCFNumberSInt32Type, &v50);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F040D8], v44);
  CFRelease(v44);
  CFNumberRef v45 = CFNumberCreate(v14, kCFNumberSInt32Type, &v48);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F04198], v45);
  CFRelease(v45);
  CFNumberRef v46 = CFNumberCreate(v14, kCFNumberSInt32Type, &v49);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F04078], v46);
  CFRelease(v46);
  CFMutableDictionaryRef v47 = CFDictionaryCreateMutable(v14, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F04130], v47);
  CFRelease(v47);
  if (!a7) {
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F041D8], (const void *)*MEMORY[0x263EFFB40]);
  }
  *a1 = Mutable;
}

uint64_t openUserClient(io_service_t a1, io_connect_t *connect, uint32_t a3, int a4)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v5 = IOServiceOpen(a1, *MEMORY[0x263EF8960], a3, connect);
  if (v5 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v7[0] = 67109634;
    v7[1] = a4;
    __int16 v8 = 2080;
    unsigned int v9 = "openUserClient";
    __int16 v10 = 1024;
    int v11 = v5;
    _os_log_impl(&dword_262BEC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AppleProResHW (0x%x): %s(): IOServiceOpen returned 0x%08x\n", (uint8_t *)v7, 0x18u);
  }
  return v5;
}

void closeUserClient(io_connect_t a1, int a2)
{
  kern_return_t v3;
  kern_return_t v4;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;
  __int16 v8;
  kern_return_t v9;
  uint64_t v10;

  __int16 v10 = *MEMORY[0x263EF8340];
  CFNumberRef v3 = IOServiceClose(a1);
  if (v3)
  {
    CFNumberRef v4 = v3;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      v5[0] = 67109634;
      v5[1] = a2;
      uint64_t v6 = 2080;
      float v7 = "closeUserClient";
      __int16 v8 = 1024;
      unsigned int v9 = v4;
      _os_log_impl(&dword_262BEC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AppleProResHW (0x%x): %s(): IOServiceClose returned 0x%08x\n\n", (uint8_t *)v5, 0x18u);
    }
  }
}

uint64_t createConnection(uint32_t a1, io_connect_t *a2, int a3)
{
  CFDictionaryRef v6 = IOServiceMatching("AppleProResHW");
  if (!v6)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      createConnection();
    }
    return 0;
  }
  io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x263F0EC88], v6);
  if (!MatchingService)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      createConnection();
    }
    return 0;
  }
  io_object_t v8 = MatchingService;
  uint64_t v9 = openUserClient(MatchingService, a2, a1, a3);
  if (v9 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    createConnection();
  }
  IOObjectRelease(v8);
  return v9;
}

char *APR_ImgFmt_4CC(int a1)
{
  uint64_t v1 = 0;
  while (1)
  {
    int v2 = (char *)&gs_ImgFmtConversion + v1;
    if (*(_DWORD *)((char *)&gs_ImgFmtConversion + v1 + 36) == a1) {
      break;
    }
    v1 += 44;
    if (v1 == 3256) {
      return 0;
    }
  }
  return v2;
}

uint64_t checkFrameHeader(unsigned __int16 *a1, int a2, int a3)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  if ((a2 & 0xFFFFFFFD) == 1)
  {
    if (*a1 < 0x99u)
    {
      if (*((unsigned __int8 *)a1 + 2) < 2u)
      {
        unsigned int v9 = a1[4];
        if (v9 & 1) != 0 || (unsigned int v10 = a1[5], (v10))
        {
          uint64_t v5 = 3758097084;
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            checkFrameHeader(v9, (uint64_t)a1, a3);
          }
        }
        else
        {
          int v11 = *((unsigned __int8 *)a1 + 12);
          int v12 = *((unsigned __int8 *)a1 + 13);
          if (v12 + v11 >= v9 || *((unsigned __int8 *)a1 + 15) + *((unsigned __int8 *)a1 + 14) >= v10)
          {
            uint64_t v5 = 3758097084;
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
            {
              int v23 = *((unsigned __int8 *)a1 + 14);
              int v24 = *((unsigned __int8 *)a1 + 15);
              v26[0] = 67111170;
              v26[1] = a3;
              __int16 v27 = 1024;
              int v28 = 2241;
              __int16 v29 = 2080;
              int v30 = "checkFrameHeader";
              __int16 v31 = 1024;
              int v32 = v11;
              __int16 v33 = 1024;
              int v34 = v12;
              __int16 v35 = 1024;
              int v36 = v23;
              __int16 v37 = 1024;
              int v38 = v24;
              __int16 v39 = 1024;
              unsigned int v40 = v9;
              __int16 v41 = 1024;
              unsigned int v42 = v10;
              _os_log_error_impl(&dword_262BEC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "ERROR AppleProResHW (0x%x): %d: %s(): Invalid default_crop_left %d, default_crop_right %d, default_crop_top %d, or default_crop_bottom %d, %d, %d\n", (uint8_t *)v26, 0x3Cu);
            }
          }
          else if (*((unsigned __int8 *)a1 + 16) < 4u)
          {
            if (a1[9])
            {
              if (*((unsigned __int8 *)a1 + 70) < 5u)
              {
                if (*((unsigned __int8 *)a1 + 71) - 64 > 0xFFFFFFC0)
                {
                  return 0;
                }
                else
                {
                  uint64_t v5 = 3758097084;
                  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                    checkFrameHeader();
                  }
                }
              }
              else
              {
                uint64_t v5 = 3758097084;
                if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                  checkFrameHeader();
                }
              }
            }
            else
            {
              uint64_t v5 = 3758097084;
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                checkFrameHeader();
              }
            }
          }
          else
          {
            uint64_t v5 = 3758097084;
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              checkFrameHeader();
            }
          }
        }
      }
      else
      {
        uint64_t v5 = 3758097084;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          checkFrameHeader();
        }
      }
    }
    else
    {
      uint64_t v5 = 3758097084;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        checkFrameHeader();
      }
    }
    return v5;
  }
  if ((a2 & 0xFFFFFFFD) != 0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      checkFrameHeader();
    }
    return 4294954394;
  }
  uint64_t v5 = 3758097084;
  if (*a1 >= 0x95u)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      checkFrameHeader();
    }
    return v5;
  }
  unsigned int v6 = *((unsigned __int8 *)a1 + 2);
  if (v6 == 1)
  {
    unsigned int v7 = *((unsigned __int8 *)a1 + 12);
    if (v7 - 4 >= 0xFFFFFFFE) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = 3758097105;
    }
  }
  else if (*((unsigned char *)a1 + 2))
  {
    if (v6 > 2)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        checkFrameHeader();
      }
      return v5;
    }
    uint64_t v8 = 0;
    unsigned int v7 = *((unsigned __int8 *)a1 + 12);
  }
  else
  {
    unsigned int v7 = *((unsigned __int8 *)a1 + 12);
    uint64_t v8 = 3758097105;
    if (v7 == 3)
    {
      if (*((unsigned char *)a1 + 19))
      {
        *((unsigned char *)a1 + 19) = 0;
        uint64_t v8 = 3758097105;
      }
      goto LABEL_43;
    }
    if (v7 == 2)
    {
      if (*((unsigned char *)a1 + 19)) {
        uint64_t v8 = 3758097105;
      }
      else {
        uint64_t v8 = 0;
      }
LABEL_43:
      unsigned int v7 = 3;
      goto LABEL_44;
    }
  }
  if (v7 <= 1 && *((unsigned char *)a1 + 13)) {
    goto LABEL_46;
  }
LABEL_44:
  if (a1[5] == 1)
  {
    if (*((unsigned char *)a1 + 13)) {
      goto LABEL_46;
    }
    goto LABEL_49;
  }
  if (*((unsigned __int8 *)a1 + 13) >= 3u)
  {
LABEL_46:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      checkFrameHeader();
    }
    return v5;
  }
LABEL_49:
  if (*((unsigned __int8 *)a1 + 14) >= 4u)
  {
    *((unsigned char *)a1 + 14) = 0;
    uint64_t v8 = 3758097105;
  }
  if (*((unsigned __int8 *)a1 + 15) >= 0xCu)
  {
    *((unsigned char *)a1 + 15) = 0;
    uint64_t v8 = 3758097105;
  }
  unsigned int v13 = *((unsigned __int8 *)a1 + 16);
  if (v13 <= 0xA && ((1 << v13) & 0x598) != 0 || v13 >= 0xD)
  {
    *((unsigned char *)a1 + 16) = 2;
    uint64_t v8 = 3758097105;
  }
  unsigned int v14 = *((unsigned __int8 *)a1 + 17);
  if (v14 - 3 < 4 || v14 > 0x12 || v14 - 8 <= 5)
  {
    *((unsigned char *)a1 + 17) = 2;
    uint64_t v8 = 3758097105;
  }
  unsigned int v15 = *((unsigned __int8 *)a1 + 18);
  if (v15 > 9 || ((1 << v15) & 0x247) == 0)
  {
    *((unsigned char *)a1 + 18) = 2;
    uint64_t v8 = 3758097105;
  }
  if (*((unsigned __int8 *)a1 + 19) < 3u)
  {
    if (!v7 && *((unsigned char *)a1 + 21))
    {
      *((unsigned char *)a1 + 21) = 0;
      uint64_t v8 = 3758097105;
    }
    if (*((unsigned char *)a1 + 20))
    {
      unsigned int v16 = 0;
      int v17 = a1 + 11;
LABEL_70:
      uint64_t v18 = 0;
      while (*((unsigned __int8 *)v17 + v18) - 64 > 0xFFFFFFC1)
      {
        if (++v18 == 8)
        {
          v17 += 4;
          BOOL v19 = v16++ >= 7;
          if (v19) {
            goto LABEL_75;
          }
          goto LABEL_70;
        }
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        checkFrameHeader();
      }
    }
    else
    {
LABEL_75:
      if (*((unsigned char *)a1 + 21))
      {
        unsigned int v20 = 0;
        int v21 = a1 + 43;
LABEL_77:
        uint64_t v22 = 0;
        while (*((unsigned __int8 *)v21 + v22) - 64 > 0xFFFFFFC1)
        {
          if (++v22 == 8)
          {
            v21 += 4;
            BOOL v19 = v20++ >= 7;
            if (v19) {
              return v8;
            }
            goto LABEL_77;
          }
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          checkFrameHeader();
        }
      }
      else
      {
        return v8;
      }
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    checkFrameHeader();
  }
  return v5;
}

uint64_t parseFrameHeader(uint64_t a1, unsigned __int16 *a2, int a3, int a4)
{
  *(_WORD *)a1 = bswap32(*a2) >> 16;
  *(unsigned char *)(a1 + 2) = *((unsigned char *)a2 + 3);
  *(_DWORD *)(a1 + 4) = bswap32(*((_DWORD *)a2 + 1));
  *(_WORD *)(a1 + 8) = bswap32(a2[4]) >> 16;
  *(_WORD *)(a1 + 10) = bswap32(a2[5]) >> 16;
  if ((a3 & 0xFFFFFFFD) == 1)
  {
    uint64_t v9 = 0;
    *(unsigned char *)(a1 + 12) = *((unsigned char *)a2 + 12);
    *(unsigned char *)(a1 + 13) = *((unsigned char *)a2 + 13);
    *(unsigned char *)(a1 + 14) = *((unsigned char *)a2 + 14);
    *(unsigned char *)(a1 + 15) = *((unsigned char *)a2 + 15);
    *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 17) & 3;
    *(_WORD *)(a1 + 18) = bswap32(a2[9]) >> 16;
    *(_DWORD *)(a1 + 20) = bswap32(*((_DWORD *)a2 + 5));
    *(_DWORD *)(a1 + 24) = bswap32(*((_DWORD *)a2 + 6));
    uint64_t v10 = a1 + 28;
    int v11 = 28;
    do
    {
      uint64_t v12 = 0;
      int v13 = v11;
      do
      {
        *(_DWORD *)(v10 + v12) = (*((unsigned __int8 *)a2 + (v11 + v12)) << 24) | (*((unsigned __int8 *)a2
                                                                                                 + (v11 + v12 + 1)) << 16) | (*((unsigned __int8 *)a2 + (v11 + v12 + 2)) << 8) | *((unsigned __int8 *)a2 + (v11 + v12 + 3));
        v12 += 4;
      }
      while (v12 != 12);
      ++v9;
      v10 += 12;
      v11 += 12;
    }
    while (v9 != 3);
    *(_DWORD *)(a1 + 64) = (*((unsigned __int8 *)a2 + (v13 + 12)) << 24) | (*((unsigned __int8 *)a2
                                                                                          + (v13 + 13)) << 16) | (*((unsigned __int8 *)a2 + (v13 + 14)) << 8) | *((unsigned __int8 *)a2 + (v13 + 15));
    *(_WORD *)(a1 + 68) = *((unsigned __int8 *)a2 + (v13 + 17)) | (*((unsigned __int8 *)a2
                                                                                 + (v13 + 16)) << 8);
    unsigned __int8 v14 = *((unsigned char *)a2 + (v13 + 19));
    *(unsigned char *)(a1 + 70) = (v14 >> 1) & 7;
    if (v14) {
      char v15 = *((unsigned char *)a2 + (v13 + 20));
    }
    else {
      char v15 = 1;
    }
    *(unsigned char *)(a1 + 71) = v15;
LABEL_28:
    return checkFrameHeader((unsigned __int16 *)a1, a3, a4);
  }
  if ((a3 & 0xFFFFFFFD) == 0)
  {
    *(unsigned char *)(a1 + 12) = *((unsigned char *)a2 + 12) >> 6;
    *(unsigned char *)(a1 + 13) = (*((unsigned char *)a2 + 12) >> 2) & 3;
    *(unsigned char *)(a1 + 14) = *((unsigned char *)a2 + 13) >> 4;
    *(unsigned char *)(a1 + 15) = *((unsigned char *)a2 + 13) & 0xF;
    *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 14);
    *(unsigned char *)(a1 + 17) = *((unsigned char *)a2 + 15);
    *(unsigned char *)(a1 + 18) = *((unsigned char *)a2 + 16);
    *(unsigned char *)(a1 + 19) = *((unsigned char *)a2 + 17) & 0xF;
    unsigned int v4 = *((unsigned __int8 *)a2 + 19);
    unsigned int v5 = v4 >> 1;
    *(unsigned char *)(a1 + 20) = (v4 & 2) != 0;
    int v6 = *((unsigned char *)a2 + 19) & 1;
    *(unsigned char *)(a1 + 21) = v6;
    unsigned int v7 = (_OWORD *)(a1 + 22);
    if (v5)
    {
      uint64_t v17 = 0;
      uint64_t v18 = a2 + 10;
      do
      {
        for (uint64_t i = 0; i != 8; ++i)
          *((unsigned char *)v7 + i) = *((unsigned char *)v18 + i);
        ++v17;
        v18 += 4;
        unsigned int v7 = (_OWORD *)((char *)v7 + 8);
      }
      while (v17 != 8);
    }
    else
    {
      *(void *)&long long v8 = 0x404040404040404;
      *((void *)&v8 + 1) = 0x404040404040404;
      *(_OWORD *)(a1 + 54) = v8;
      *(_OWORD *)(a1 + 70) = v8;
      *unsigned int v7 = v8;
      *(_OWORD *)(a1 + 38) = v8;
    }
    if (v6)
    {
      uint64_t v21 = 0;
      uint64_t v22 = a1 + 86;
      int v23 = a2 + 42;
      do
      {
        for (uint64_t j = 0; j != 8; ++j)
          *(unsigned char *)(v22 + j) = *((unsigned char *)v23 + j);
        ++v21;
        v23 += 4;
        v22 += 8;
      }
      while (v21 != 8);
    }
    else
    {
      for (uint64_t k = 0; k != 64; k += 8)
        *(void *)(a1 + k + 86) = *(void *)(a1 + k + 22);
    }
    goto LABEL_28;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    parseFrameHeader();
  }
  return 4294954394;
}

uint64_t createEncodeStatsBuffers(int a1, uint64_t a2, void *a3, int a4, int a5)
{
  if ((a4 - 1634755432) <= 0xB && ((1 << (a4 - 104)) & 0x8C1) != 0)
  {
    int v7 = 56;
    goto LABEL_6;
  }
  int v7 = 80;
  if (a4 == 1634743400 || a4 == 1634743416)
  {
LABEL_6:
    if (*(_DWORD *)(a2 + 20) == ((48 * a1 + 127) & 0xFFFFFF80)
                               + ((60 * a1 + 127) & 0xFFFFFF80)
                               + ((2 * a1 + 127) & 0xFFFFFF80)
                               + ((v7 * a1 + 127) & 0xFFFFFF80))
      return 0;
    if (*a3)
    {
      CVDataBufferPoolCreateDataBuffer();
      uint64_t v8 = 3758097085;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        createEncodeStatsBuffers();
      }
    }
    else
    {
      CVDataBufferPoolCreate();
      uint64_t v8 = 3758097085;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        createEncodeStatsBuffers();
      }
    }
    return v8;
  }
  uint64_t v8 = 3758097090;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    createEncodeStatsBuffers(a4, a5);
  }
  return v8;
}

void *getRtMpeStr@<X0>(int a1@<W0>, int a2@<W1>, int a3@<W2>, void *a4@<X8>)
{
  if (a1)
  {
    if (a2)
    {
      if (a2 == 1)
      {
        int v6 = "Enc_RT_T_MPE_F_VDyn_SingleCore";
        int v7 = "Enc_RT_T_MPE_T_VDyn_SingleCore";
      }
      else
      {
        int v6 = "Enc_RT_UI_MPE_F_VDyn_SingleCore";
        int v7 = "Enc_RT_UI_MPE_T_VMin_SingleCore";
      }
    }
    else
    {
      int v6 = "Enc_RT_F_MPE_F_VMax_MultiCore";
      int v7 = "Enc_RT_F_MPE_T_VMin_SingleCore";
    }
    if (a3) {
      uint64_t v10 = (char *)v7;
    }
    else {
      uint64_t v10 = (char *)v6;
    }
  }
  else
  {
    uint64_t v8 = "Dec_RT_F_MPE_F_VMax_MultiCore";
    if (a3) {
      uint64_t v8 = "Dec_RT_F_MPE_T_VMin_SingleCore";
    }
    uint64_t v9 = "Dec_RT_T_MPE_T_VMax_SingleCore";
    if (!a3) {
      uint64_t v9 = "Dec_RT_T_MPE_F_VMax_MultiCore";
    }
    if ((a2 - 1) <= 1) {
      uint64_t v10 = (char *)v9;
    }
    else {
      uint64_t v10 = (char *)v8;
    }
  }
  return std::string::basic_string[abi:ne180100]<0>(a4, v10);
}

unsigned int *getEncodeStatsPtrs(unsigned int *result, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  if (result[5])
  {
    int v11 = result;
    uint64_t v12 = IOSurfaceLookup(result[6]);
    uint64_t result = (unsigned int *)IOSurfaceGetBaseAddress(v12);
    uint64_t v13 = v11[1];
    *a2 = (char *)result + *v11;
    *a3 = (char *)result + v13;
    uint64_t v14 = v11[3];
    *a4 = (char *)result + v11[2];
    *a5 = (char *)result + v14;
    *a6 = (char *)result + v11[4];
    *((void *)v11 + 4) = v12;
  }
  return result;
}

void freeEncodeStatsBuffers(uint64_t a1, CFTypeRef cf)
{
  if (*(_DWORD *)(a1 + 20))
  {
    unsigned int v4 = *(const void **)(a1 + 40);
    if (v4) {
      CFRelease(v4);
    }
    unsigned int v5 = *(const void **)(a1 + 32);
    if (v5) {
      CFRelease(v5);
    }
    *(void *)(a1 + 48) = 0;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)a1 = 0u;
  }
  if (cf)
  {
    CFRelease(cf);
  }
}

void printCodecType(int a1, int a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v6 = 0;
  if (a1 <= 1634755438)
  {
    if (a1 > 1634755431)
    {
      if (a1 == 1634755432)
      {
        unsigned int v4 = "2";
        goto LABEL_22;
      }
      if (a1 == 1634755438)
      {
        unsigned int v4 = "3";
        goto LABEL_22;
      }
    }
    else
    {
      if (a1 == 1634743400)
      {
        unsigned int v4 = "1";
        goto LABEL_22;
      }
      if (a1 == 1634743416)
      {
        unsigned int v4 = "0";
        goto LABEL_22;
      }
    }
  }
  else if (a1 <= 1634759271)
  {
    if (a1 == 1634755439)
    {
      unsigned int v4 = "5";
      goto LABEL_22;
    }
    if (a1 == 1634755443)
    {
      unsigned int v4 = "4";
      goto LABEL_22;
    }
  }
  else
  {
    switch(a1)
    {
      case 1634759272:
        unsigned int v4 = "7";
        goto LABEL_22;
      case 1634759276:
        unsigned int v4 = "8";
        goto LABEL_22;
      case 1634759278:
        unsigned int v4 = "6";
LABEL_22:
        MEMORY[0x263E5F290](__p, v4);
        goto LABEL_23;
    }
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109634;
    int v8 = a2;
    __int16 v9 = 2080;
    uint64_t v10 = "printCodecType";
    __int16 v11 = 1024;
    int v12 = a1;
    _os_log_impl(&dword_262BEC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AppleProResHW (0x%x): %s(): Unsupported CodecType: 0x%x\n", buf, 0x18u);
  }
LABEL_23:
  if (SHIBYTE(v6) < 0) {
    operator delete(__p[0]);
  }
}

void sub_262BF86B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
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

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exceptioint n = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2655BB978, MEMORY[0x263F8C060]);
}

void sub_262BF87E8(_Unwind_Exception *a1)
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

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x18u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Eu);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

uint64_t getLastNZCoeffPos(__int16 *a1, unsigned __int8 a2)
{
  do
    --a2;
  while (a2 && !a1[a2]);
  return a2;
}

uint64_t decodeSlice(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = MEMORY[0x270FA5388](a1, a2, a3);
  uint64_t v9 = v5;
  uint64_t v103 = *MEMORY[0x263EF8340];
  unint64_t v10 = *(unsigned __int8 *)result;
  uint64_t v11 = v6;
  *(unsigned char *)(*(void *)(v5 + 32) + v6) = *(unsigned char *)(result + 1);
  unsigned int v12 = bswap32(*(unsigned __int16 *)(result + 2)) >> 16;
  if (v7 == 1)
  {
    *(_WORD *)(*(void *)(v5 + 328) + 2 * v6) = (GAMMA[*(unsigned __int8 *)(*(void *)(v5 + 32) + v6)] * v12) >> 10;
    return result;
  }
  unsigned int v13 = *(_DWORD *)(v5 + 24);
  unsigned int v14 = v6 % v13;
  if ((v7 & 0xFFFFFFFE) != 2 || ((v6 / v13 + v14) & 1) == 0)
  {
    if (v7 == 3 && *(unsigned __int8 *)(*(void *)(v5 + 32) + v6) <= v8)
    {
      *(unsigned char *)(*(void *)(v5 + 320) + v6) = 0;
      *(unsigned char *)(*(void *)(v5 + 312) + v6) = 0;
      *(unsigned char *)(*(void *)(v5 + 304) + v6) = 0;
      return result;
    }
    uint64_t v86 = v4;
    unsigned int v87 = v7 & 0xFFFFFFFE;
    unsigned int v84 = v6 / v13;
    char v85 = v6 % v13;
    char v15 = (const unsigned __int8 *)(result + (v10 >> 3));
    uint64_t v16 = *(unsigned __int8 *)(v5 + v14 + 48);
    int v88 = v6;
    char v89 = *(unsigned char *)(v5 + 8);
    bzero(v102, v16 << 9);
    uint64_t result = BitstreamReader::initialize((uint64_t)&v93, v15, v12);
    uint64_t v17 = v93;
    if (HIDWORD(v93))
    {
      uint64_t v18 = v95;
      unint64_t v92 = v96;
      *(_DWORD *)unsigned int v99 = 0;
      unsigned int v100 = 0;
      int v19 = v94;
      unsigned int v101 = 0;
      uint64_t result = (uint64_t)RiceExpComboCode<unsigned int>::decodeUnsigned(&v101, (int *)v99, HIDWORD(v93), EntropyCode::firstDcCodeBook);
      char v20 = v89 + 2;
      unsigned int v21 = -(v101 & 1) ^ (v101 >> 1);
      unint64_t v22 = v17 << SLOBYTE(v99[0]);
      int v23 = v19 - *(_DWORD *)v99;
      if (v19 - *(_DWORD *)v99 < 0)
      {
        if ((unint64_t)v18 >= v92)
        {
          if (v18 >= v97)
          {
            unsigned int v25 = 0;
          }
          else
          {
            unsigned int v25 = 0;
            int64_t v26 = (char *)v97 - (char *)v18;
            int v27 = 24;
            do
            {
              int v28 = *(unsigned __int8 *)v18;
              uint64_t v18 = (unsigned int *)((char *)v18 + 1);
              v25 |= v28 << v27;
              v27 -= 8;
              --v26;
            }
            while (v26);
            uint64_t v18 = v97;
          }
        }
        else
        {
          unsigned int v24 = *v18++;
          unsigned int v25 = bswap32(v24);
        }
        v22 |= (unint64_t)v25 << (LOBYTE(v99[0]) - v19);
        v23 += 32;
      }
      unsigned int v91 = 256 << v89;
      v102[0] = -(v101 & 1) ^ (v101 >> 1);
      unsigned __int16 v98 = 0;
      int v29 = 1;
      __int16 v30 = 3;
      __int16 v31 = v102;
      while (HIDWORD(v22))
      {
        uint64_t result = (uint64_t)EntropyCode::decodeLevelDifference((EntropyCode *)&v98, v99, (int *)HIDWORD(v22), v30);
        v22 <<= SLOBYTE(v99[0]);
        v23 -= *(_DWORD *)v99;
        if (v23 < 0)
        {
          if ((unint64_t)v18 >= v92)
          {
            if (v18 >= v97)
            {
              unsigned int v33 = 0;
            }
            else
            {
              unsigned int v33 = 0;
              int64_t v34 = (char *)v97 - (char *)v18;
              int v35 = 24;
              do
              {
                int v36 = *(unsigned __int8 *)v18;
                uint64_t v18 = (unsigned int *)((char *)v18 + 1);
                v33 |= v36 << v35;
                v35 -= 8;
                --v34;
              }
              while (v34);
              uint64_t v18 = v97;
            }
          }
          else
          {
            unsigned int v32 = *v18++;
            unsigned int v33 = bswap32(v32);
          }
          v22 |= (unint64_t)v33 << -(char)v23;
          v23 += 32;
        }
        __int16 v30 = v98;
        v21 += v98;
        v31[64] = v21;
        v31 += 64;
        if (++v29 >> v20)
        {
          unint64_t v37 = HIDWORD(v22);
          if (HIDWORD(v22))
          {
            int v90 = ~(-4 << v89);
            unsigned int v38 = 4u;
            signed int v39 = 2u;
            while (1)
            {
              int v40 = EntropyCode::runCodeBook[v38];
              uint64_t v41 = EntropyCode::levelCodeBook[v39];
              unsigned int v42 = (unsigned __int16 *)((char *)&RiceExpComboCodeVLDPairTables
                                       + 40960 * EntropyCode::runCodeBook[v38]
                                       + 4096 * v41
                                       + 4 * (v22 >> 54));
              uint64_t v43 = *v42;
              unsigned int v38 = *((unsigned __int8 *)v42 + 2);
              int v44 = *((unsigned __int8 *)v42 + 3);
              int v45 = v43 + 1;
              *(_DWORD *)unsigned int v99 = v43 + 1;
              unsigned int v100 = v38;
              if (v43)
              {
                int v46 = v37 << v43;
                signed int v39 = v44 + 1;
                int v47 = ((v44 + 1) ^ (v46 >> 31)) - (v46 >> 31);
              }
              else
              {
                uint64_t result = (uint64_t)RiceExpComboCode<unsigned int>::decodeUnsigned(&v100, (int *)v99, v37, v40);
                v22 <<= SLOBYTE(v99[0]);
                v23 -= *(_DWORD *)v99;
                if (v23 < 0)
                {
                  if ((unint64_t)v18 >= v92)
                  {
                    if (v18 >= v97)
                    {
                      unsigned int v49 = 0;
                    }
                    else
                    {
                      unsigned int v49 = 0;
                      int64_t v50 = (char *)v97 - (char *)v18;
                      int v51 = 24;
                      do
                      {
                        int v52 = *(unsigned __int8 *)v18;
                        uint64_t v18 = (unsigned int *)((char *)v18 + 1);
                        v49 |= v52 << v51;
                        v51 -= 8;
                        --v50;
                      }
                      while (v50);
                      uint64_t v18 = v97;
                    }
                  }
                  else
                  {
                    unsigned int v48 = *v18++;
                    unsigned int v49 = bswap32(v48);
                  }
                  v22 |= (unint64_t)v49 << -(char)v23;
                  v23 += 32;
                }
                if (!HIDWORD(v22)) {
                  goto LABEL_58;
                }
                unsigned int v101 = 0;
                uint64_t result = (uint64_t)RiceExpComboCode<unsigned int>::decodeUnsigned(&v101, (int *)v99, HIDWORD(v22), v41);
                char v53 = v99[0];
                unsigned int v38 = v100;
                int v45 = ++*(_DWORD *)v99;
                if (v100 > 0x7DF) {
                  goto LABEL_58;
                }
                signed int v39 = v101 + 1;
                if ((int)(v101 + 1) >= 0x4000) {
                  goto LABEL_58;
                }
                int v47 = (v39 ^ ((int)(HIDWORD(v22) << v53) >> 31)) - ((int)(HIDWORD(v22) << v53) >> 31);
              }
              v22 <<= v45;
              v23 -= v45;
              if (v23 < 0)
              {
                if ((unint64_t)v18 >= v92)
                {
                  if (v18 >= v97)
                  {
                    unsigned int v55 = 0;
                  }
                  else
                  {
                    unsigned int v55 = 0;
                    int64_t v56 = (char *)v97 - (char *)v18;
                    int v57 = 24;
                    do
                    {
                      int v58 = *(unsigned __int8 *)v18;
                      uint64_t v18 = (unsigned int *)((char *)v18 + 1);
                      v55 |= v58 << v57;
                      v57 -= 8;
                      --v56;
                    }
                    while (v56);
                    uint64_t v18 = v97;
                  }
                }
                else
                {
                  unsigned int v54 = *v18++;
                  unsigned int v55 = bswap32(v54);
                }
                v22 |= (unint64_t)v55 << -(char)v23;
                v23 += 32;
              }
              unint64_t v59 = v38 + v29;
              if (v59 < v91)
              {
                v102[64 * (v59 & v90) + ProgressiveScanTableFull[v59 >> v20]] = v47;
                int v29 = v59 + 1;
                unint64_t v37 = HIDWORD(v22);
                if (HIDWORD(v22)) {
                  continue;
                }
              }
              goto LABEL_58;
            }
          }
          break;
        }
      }
    }
LABEL_58:
    uint64_t v60 = *(void *)(v9 + 312);
    *(unsigned char *)(v60 + v11) = 0;
    uint64_t v61 = *(void *)(v9 + 304);
    *(unsigned char *)(v61 + v11) = -1;
    if (v16)
    {
      uint64_t v62 = 0;
      __int16 v63 = 0;
      unsigned int v64 = 255;
      int v65 = v102;
      do
      {
        uint64_t v66 = v62 << 8;
        uint64_t v67 = 63;
        while (v67)
        {
          if (v65[v67--])
          {
            unsigned __int8 v69 = v67 + 1;
            LODWORD(v67) = (v67 + 1);
            uint64_t result = *(unsigned __int8 *)(v60 + v11);
            if (result < v69)
            {
              *(unsigned char *)(v60 + v11) = v67;
              unsigned int v64 = *(unsigned __int8 *)(v61 + v11);
            }
            break;
          }
        }
        if (v67 < v64)
        {
          *(unsigned char *)(v61 + v11) = v67;
          __int16 v63 = v102[256 * v62];
          unsigned int v64 = v67;
        }
        uint64_t v70 = 127;
        do
        {
          if (v70 == 64)
          {
            unsigned int v71 = 0;
            goto LABEL_73;
          }
          uint64_t result = (unsigned __int16)v65[v70--];
        }
        while (!result);
        uint64_t result = (v70 - 63);
        unsigned int v71 = (v70 - 63);
        if (*(unsigned __int8 *)(v60 + v11) < result)
        {
          *(unsigned char *)(v60 + v11) = v71;
          unsigned int v64 = *(unsigned __int8 *)(v61 + v11);
        }
LABEL_73:
        if (v71 < v64)
        {
          *(unsigned char *)(v61 + v11) = v71;
          __int16 v63 = v102[v66 | 0x40];
          unsigned int v64 = v71;
        }
        uint64_t v72 = 191;
        do
        {
          if (v72 == 128)
          {
            unsigned int v73 = 0;
            goto LABEL_81;
          }
          uint64_t result = (unsigned __int16)v65[v72--];
        }
        while (!result);
        uint64_t result = (v72 - 127);
        unsigned int v73 = (v72 - 127);
        if (*(unsigned __int8 *)(v60 + v11) < result)
        {
          *(unsigned char *)(v60 + v11) = v73;
          unsigned int v64 = *(unsigned __int8 *)(v61 + v11);
        }
LABEL_81:
        if (v73 < v64)
        {
          *(unsigned char *)(v61 + v11) = v73;
          __int16 v63 = v102[v66 | 0x80];
          unsigned int v64 = v73;
        }
        uint64_t v74 = v66 | 0xC0;
        uint64_t v75 = 255;
        do
        {
          if (v75 == 192)
          {
            unsigned int v78 = 0;
            goto LABEL_89;
          }
        }
        while (!v65[v75--]);
        unsigned __int8 v77 = v75 + 65;
        unsigned int v78 = (v75 + 65);
        uint64_t result = *(unsigned __int8 *)(v60 + v11);
        if (result < v77)
        {
          *(unsigned char *)(v60 + v11) = v78;
          unsigned int v64 = *(unsigned __int8 *)(v61 + v11);
        }
LABEL_89:
        if (v78 < v64)
        {
          *(unsigned char *)(v61 + v11) = v78;
          __int16 v63 = v102[v74];
          unsigned int v64 = v78;
        }
        ++v62;
        v65 += 256;
      }
      while (v62 != v16);
    }
    else
    {
      __int16 v63 = 0;
    }
    int v79 = *(unsigned __int8 *)(v86 + 13) * v63 * qScale[*(unsigned __int8 *)(*(void *)(v9 + 32) + v11)];
    if (v79 >= -16384)
    {
      int v81 = v88;
      unsigned int v82 = v87;
      if (v79 < 0x4000) {
        unsigned int v80 = (v79 >> 7) ^ 0xFFFFFF80;
      }
      else {
        LOBYTE(v80) = -1;
      }
    }
    else
    {
      LOBYTE(v80) = 0;
      int v81 = v88;
      unsigned int v82 = v87;
    }
    *(unsigned char *)(*(void *)(v9 + 320) + v11) = v80;
    if (v82 == 2)
    {
      if (v85)
      {
        *(unsigned char *)(*(void *)(v9 + 320) + (v81 - *(_DWORD *)(v9 + 24))) = *(unsigned char *)(*(void *)(v9 + 320)
                                                                                                  + v11);
        *(unsigned char *)(*(void *)(v9 + 312) + (v81 - *(_DWORD *)(v9 + 24))) = *(unsigned char *)(*(void *)(v9 + 312)
                                                                                                  + v11);
        unsigned int v83 = v81 - *(_DWORD *)(v9 + 24);
      }
      else
      {
        if (v84 >= *(_DWORD *)(v9 + 20) - 1) {
          return result;
        }
        *(unsigned char *)(*(void *)(v9 + 320) + (*(_DWORD *)(v9 + 24) + v81)) = *(unsigned char *)(*(void *)(v9 + 320)
                                                                                                  + v11);
        *(unsigned char *)(*(void *)(v9 + 312) + (*(_DWORD *)(v9 + 24) + v81)) = *(unsigned char *)(*(void *)(v9 + 312)
                                                                                                  + v11);
        unsigned int v83 = *(_DWORD *)(v9 + 24) + v81;
      }
      *(unsigned char *)(*(void *)(v9 + 304) + v83) = *(unsigned char *)(*(void *)(v9 + 304) + v11);
    }
  }
  return result;
}

uint64_t decodeSliceTask(int *a1)
{
  if (a1[7] >= 1)
  {
    uint64_t v2 = a1[6];
    uint64_t v3 = *(void *)a1;
    uint64_t v4 = *((void *)a1 + 2);
    do
    {
      decodeSlice(v3, *((void *)a1 + 1), v4);
      uint64_t v4 = *((void *)a1 + 2);
      v3 += *(unsigned __int16 *)(*(void *)(v4 + 40) + 2 * v2++);
    }
    while (v2 < a1[7] + (uint64_t)a1[6]);
  }
  pthread_mutex_lock(*((pthread_mutex_t **)a1 + 7));
  uint64_t v5 = (int *)*((void *)a1 + 5);
  int v6 = *v5 + 1;
  *uint64_t v5 = v6;
  if (v6 == a1[8]) {
    pthread_cond_signal(*((pthread_cond_t **)a1 + 6));
  }
  pthread_mutex_unlock(*((pthread_mutex_t **)a1 + 7));
  MEMORY[0x263E5F2D0](a1, 0x1030C40C3C8D92FLL);
  return 0;
}

void ProResHWAnalyzer::ProResHWAnalyzer(ProResHWAnalyzer *this, int a2, int a3)
{
  *((void *)this + 1) = 0;
  *((_DWORD *)this + 6) = a3;
  *((_DWORD *)this + 7) = a2;
  operator new[]();
}

void ProResHWAnalyzer::ProResHWAnalyzer(ProResHWAnalyzer *this, int a2)
{
  *((_DWORD *)this + 7) = a2;
  operator new();
}

void sub_262BF9260(_Unwind_Exception *a1)
{
  MEMORY[0x263E5F2D0](v1, 0x10A0C407714E300);
  _Unwind_Resume(a1);
}

void ProResHWAnalyzer::~ProResHWAnalyzer(ProResHWAnalyzer *this)
{
  uint64_t v2 = *((void *)this + 1);
  if (v2)
  {
    ThreadPool::~ThreadPool(*((ThreadPool **)this + 1));
    MEMORY[0x263E5F2D0](v2, 0x10A0C407714E300);
  }
  uint64_t v3 = *((void *)this + 2);
  if (v3) {
    MEMORY[0x263E5F2B0](v3, 0x1000C8077774924);
  }
}

void sub_262BF92F0(_Unwind_Exception *a1)
{
  MEMORY[0x263E5F2D0](v1, 0x10A0C407714E300);
  _Unwind_Resume(a1);
}

BOOL ProResHWAnalyzer::verifySliceSetup(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 16) && *(_DWORD *)(a1 + 24) == *(_DWORD *)(a2 + 40) * *(_DWORD *)(a2 + 36);
}

uint64_t ProResHWAnalyzer::parseProResPicture(int *a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4, char a5)
{
  int v8 = 0;
  uint64_t v35 = *MEMORY[0x263EF8340];
  *a4 = *(unsigned char *)a2 >> 3;
  *((_DWORD *)a4 + 1) = bswap32(*(_DWORD *)(a2 + 1));
  int v9 = (*(unsigned __int8 *)(a2 + 7) >> 4) & 3;
  a4[8] = (*(unsigned char *)(a2 + 7) >> 4) & 3;
  int v10 = *(unsigned __int16 *)(a3 + 8) >> (*(unsigned char *)(a3 + 11) != 0);
  *((_DWORD *)a4 + 3) = v10;
  unsigned int v11 = (*(unsigned __int16 *)(a3 + 6) + 15) >> 4;
  *((_DWORD *)a4 + 4) = v11;
  *((_DWORD *)a4 + 5) = (v10 + 15) >> 4;
  unsigned int v12 = 1 << v9;
  do
  {
    if (v11 >= v12)
    {
      unsigned int v13 = &a4[v8 + 48];
      do
      {
        *v13++ = v12;
        v11 -= v12;
        ++v8;
      }
      while (v11 >= v12);
    }
    v12 >>= 1;
  }
  while (v11);
  *((_DWORD *)a4 + 6) = v8;
  uint64_t v14 = a2 + *a4;
  int v15 = a1[6];
  if (v15)
  {
    uint64_t v16 = (_WORD *)*((void *)a4 + 5);
    uint64_t v17 = a1[6];
    uint64_t v18 = (unsigned __int16 *)(a2 + *a4);
    do
    {
      unsigned int v19 = *v18++;
      *v16++ = bswap32(v19) >> 16;
      --v17;
    }
    while (v17);
  }
  if (a5)
  {
    uint64_t v20 = v14 + (2 * v15);
    if (*((void *)a1 + 1))
    {
      pthread_cond_init(&v34, 0);
      pthread_mutex_init(&v33, 0);
      if (a1[6]) {
        operator new();
      }
      pthread_mutex_lock(&v33);
      gettimeofday(&v27, 0);
      v28.tv_sec = v27.tv_sec + 3;
      v28.tv_nsec = 1000 * v27.tv_usec;
      if (*((_DWORD *)a4 + 5))
      {
        do
        {
          int v21 = pthread_cond_timedwait(&v34, &v33, &v28);
          if (*((_DWORD *)a4 + 5)) {
            BOOL v22 = v21 == 0;
          }
          else {
            BOOL v22 = 0;
          }
        }
        while (v22);
        int v23 = v21;
        pthread_mutex_unlock(&v33);
        if (v23 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          int v24 = *a1;
          *(_DWORD *)buf = 67109378;
          int v30 = v24;
          __int16 v31 = 2080;
          unsigned int v32 = "parseProResPicture";
          _os_log_impl(&dword_262BEC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AppleProResHW (0x%x): %s(): ERROR: threadpool couldn't complete task", buf, 0x12u);
        }
      }
      else
      {
        pthread_mutex_unlock(&v33);
      }
      pthread_cond_destroy(&v34);
      pthread_mutex_destroy(&v33);
    }
    else if (v15)
    {
      unint64_t v25 = 0;
      do
      {
        decodeSlice(v20, a3, (uint64_t)a4);
        v20 += *(unsigned __int16 *)(*((void *)a4 + 5) + 2 * v25++);
      }
      while (v25 < a1[6]);
    }
  }
  return 0;
}

uint64_t ProResHWAnalyzer::parseProResFrame(int *a1, uint64_t a2, uint64_t a3, char a4)
{
  *(_DWORD *)a3 = bswap32(*(_DWORD *)a2);
  unsigned int v4 = bswap32(*(unsigned __int16 *)(a2 + 8)) >> 16;
  *(_WORD *)(a3 + 4) = v4;
  *(_WORD *)(a3 + 6) = bswap32(*(unsigned __int16 *)(a2 + 16)) >> 16;
  *(_WORD *)(a3 + 8) = bswap32(*(unsigned __int16 *)(a2 + 18)) >> 16;
  *(unsigned char *)(a3 + 10) = *(unsigned char *)(a2 + 20) >> 6;
  *(unsigned char *)(a3 + 11) = (*(unsigned char *)(a2 + 20) >> 2) & 3;
  char v5 = *(unsigned char *)(a2 + 27);
  *(unsigned char *)(a3 + 12) = (v5 & 2) != 0;
  if ((v5 & 2) != 0) {
    char v6 = *(unsigned char *)(a2 + 28);
  }
  else {
    char v6 = 4;
  }
  *(unsigned char *)(a3 + 13) = v6;
  ProResHWAnalyzer::parseProResPicture(a1, a2 + 8 + v4, a3, (unsigned __int8 *)(a3 + 16), a4);
  return 0;
}

uint64_t findIndexPow3below(unsigned int a1, unsigned __int16 *a2)
{
  if (a2[1] >= a1) {
    return 0;
  }
  if (a2[2] >= a1) {
    return 1;
  }
  if (a2[3] >= a1) {
    return 2;
  }
  if (a2[4] >= a1) {
    return 3;
  }
  if (a2[5] >= a1) {
    return 4;
  }
  if (a2[6] >= a1) {
    return 5;
  }
  return 6;
}

uint64_t extractEstSizeFromIndex(_WORD *a1, int a2)
{
  switch(a2)
  {
    case 0:
      __int16 v2 = a1[8] + *a1;
      __int16 v3 = a1[16];
      goto LABEL_10;
    case 1:
      __int16 v2 = a1[9] + a1[1];
      __int16 v3 = a1[17];
      goto LABEL_10;
    case 2:
      __int16 v2 = a1[10] + a1[2];
      __int16 v3 = a1[18];
      goto LABEL_10;
    case 3:
      __int16 v2 = a1[11] + a1[3];
      __int16 v3 = a1[19];
      goto LABEL_10;
    case 4:
      __int16 v2 = a1[12] + a1[4];
      __int16 v3 = a1[20];
      goto LABEL_10;
    case 5:
      __int16 v2 = a1[13] + a1[5];
      __int16 v3 = a1[21];
      goto LABEL_10;
    case 6:
      __int16 v2 = a1[14] + a1[6];
      __int16 v3 = a1[22];
LABEL_10:
      unsigned __int16 v4 = v2 + v3;
      break;
    default:
      unsigned __int16 v4 = 0;
      break;
  }
  return v4;
}

uint64_t ProResHWAnalyzer::interpolateSize(uint64_t a1, _OWORD *a2, int a3, int a4, int a5)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v25[0] = a3;
  for (uint64_t i = 1; i != 7; ++i)
  {
    a3 *= 3;
    v25[i] = a3;
  }
  unsigned int v8 = qScale[a4];
  if (v25[1] >= v8)
  {
    int v9 = 0;
  }
  else if (v25[2] >= v8)
  {
    int v9 = 1;
  }
  else if (v25[3] >= v8)
  {
    int v9 = 2;
  }
  else if (v25[4] >= v8)
  {
    int v9 = 3;
  }
  else if (v25[5] >= v8)
  {
    int v9 = 4;
  }
  else if (v25[6] >= v8)
  {
    int v9 = 5;
  }
  else
  {
    int v9 = 6;
  }
  int v10 = v9 + 1;
  long long v11 = a2[1];
  v24[0] = *a2;
  v24[1] = v11;
  v24[2] = a2[2];
  unsigned int EstSizeFromIndex = extractEstSizeFromIndex(v24, v9);
  long long v13 = a2[1];
  v23[0] = *a2;
  v23[1] = v13;
  v23[2] = a2[2];
  int v14 = extractEstSizeFromIndex(v23, v9 + 1);
  switch(a5)
  {
    case 0:
      int v17 = (unsigned __int16)v25[v9];
      float v18 = (float)EstSizeFromIndex
          + (float)((float)((float)-(float)(int)(EstSizeFromIndex - v14) / (float)(v17 - (unsigned __int16)v25[v10]))
                  * (float)(int)(v17 - v8));
      return (int)v18;
    case 1:
      float v19 = (float)(int)(EstSizeFromIndex - v14);
      LOWORD(v15) = v25[v9];
      *(double *)&unint64_t v20 = log((double)v15);
      double v21 = *(double *)&v20;
      LOWORD(v20) = v25[v10];
      float v22 = v21 - log((double)v20);
      float v18 = (double)EstSizeFromIndex - (float)(v19 / v22) * (v21 - log((double)v8));
      return (int)v18;
    case 2:
      return EstSizeFromIndex;
    default:
      return 0;
  }
}

uint64_t ProResHWAnalyzer::getEstimatedSizeForSlice(ProResHWAnalyzer *this, unsigned __int8 *a2, int a3, int a4, int a5)
{
  char v5 = &a2[48 * a3];
  long long v6 = *((_OWORD *)v5 + 1);
  v8[0] = *(_OWORD *)v5;
  v8[1] = v6;
  v8[2] = *((_OWORD *)v5 + 2);
  return ProResHWAnalyzer::interpolateSize((uint64_t)this, v8, a4, a5, 1);
}

void ProResHWAnalyzer::findMinMaxlastNZPos(ProResHWAnalyzer *this, unsigned __int8 *a2, unsigned __int8 *a3, unsigned __int8 *a4, unsigned int a5)
{
  if ((a5 & 7) != 0) {
    ProResHWAnalyzer::findMinMaxlastNZPos();
  }
  *a3 = -1;
  *a4 = 0;
  if (a5 >= 8)
  {
    int v5 = a5 >> 3;
    if (a5 >> 3 <= 1) {
      int v5 = 1;
    }
    do
    {
      unint64_t v6 = *a3;
      unint64_t v7 = *(void *)a2;
      unint64_t v8 = (*(void *)a2 >> 6) & 0x3FLL;
      if ((*(_DWORD *)a2 & 0x3Fu) < v8) {
        unint64_t v8 = *(void *)a2 & 0x3FLL;
      }
      if (((v7 >> 12) & 0x3F) >= ((v7 >> 18) & 0x3F)) {
        unint64_t v9 = (v7 >> 18) & 0x3F;
      }
      else {
        unint64_t v9 = (v7 >> 12) & 0x3F;
      }
      if (v8 >= v9) {
        unint64_t v10 = v9;
      }
      else {
        unint64_t v10 = v8;
      }
      unint64_t v11 = (v7 >> 24) & 0x3F;
      if (v11 >= ((v7 >> 30) & 0x3F)) {
        unint64_t v11 = (v7 >> 30) & 0x3F;
      }
      uint64_t v12 = (v7 >> 36) & 0x3F;
      unint64_t v13 = (v7 >> 42) & 0x3F;
      if (v12 < v13) {
        unint64_t v13 = v12;
      }
      if (v11 >= v13)
      {
        unint64_t v14 = v13;
        if (v10 >= v13)
        {
LABEL_19:
          if (v14 > v6) {
            goto LABEL_33;
          }
          if (v8 < v9) {
            goto LABEL_28;
          }
          goto LABEL_27;
        }
      }
      else
      {
        unint64_t v14 = v11;
        if (v10 >= v11) {
          goto LABEL_19;
        }
      }
      if (v8 < v9)
      {
        if (v8 > v6) {
          goto LABEL_33;
        }
        goto LABEL_28;
      }
      if (v9 > v6) {
        goto LABEL_33;
      }
LABEL_27:
      unint64_t v8 = v9;
LABEL_28:
      if (v11 >= v13)
      {
        LOBYTE(v6) = v13;
        if (v8 >= v13) {
          goto LABEL_33;
        }
LABEL_32:
        LOBYTE(v6) = v10;
        goto LABEL_33;
      }
      LOBYTE(v6) = v11;
      if (v8 < v11) {
        goto LABEL_32;
      }
LABEL_33:
      *a3 = v6;
      unint64_t v15 = *a4;
      unint64_t v16 = *(void *)a2;
      unint64_t v17 = (*(void *)a2 >> 6) & 0x3FLL;
      if ((*(_DWORD *)a2 & 0x3Fu) > v17) {
        unint64_t v17 = *(void *)a2 & 0x3FLL;
      }
      if (((v16 >> 12) & 0x3F) <= ((v16 >> 18) & 0x3F)) {
        unint64_t v18 = (v16 >> 18) & 0x3F;
      }
      else {
        unint64_t v18 = (v16 >> 12) & 0x3F;
      }
      if (v17 <= v18) {
        unint64_t v19 = v18;
      }
      else {
        unint64_t v19 = v17;
      }
      unint64_t v20 = (v16 >> 24) & 0x3F;
      if (v20 <= ((v16 >> 30) & 0x3F)) {
        unint64_t v20 = (v16 >> 30) & 0x3F;
      }
      uint64_t v21 = (v16 >> 36) & 0x3F;
      unint64_t v22 = (v16 >> 42) & 0x3F;
      if (v21 > v22) {
        unint64_t v22 = v21;
      }
      if (v20 <= v22)
      {
        unint64_t v23 = v22;
        if (v19 > v22)
        {
LABEL_51:
          if (v17 > v18)
          {
            if (v17 < v15) {
              goto LABEL_61;
            }
            goto LABEL_56;
          }
          if (v18 < v15) {
            goto LABEL_61;
          }
LABEL_55:
          unint64_t v17 = v18;
          goto LABEL_56;
        }
      }
      else
      {
        unint64_t v23 = v20;
        if (v19 > v20) {
          goto LABEL_51;
        }
      }
      if (v23 < v15) {
        goto LABEL_61;
      }
      if (v17 <= v18) {
        goto LABEL_55;
      }
LABEL_56:
      if (v20 > v22)
      {
        LOBYTE(v15) = v20;
        if (v17 <= v20) {
          goto LABEL_61;
        }
LABEL_60:
        LOBYTE(v15) = v19;
        goto LABEL_61;
      }
      LOBYTE(v15) = v22;
      if (v17 > v22) {
        goto LABEL_60;
      }
LABEL_61:
      *a4 = v15;
      a2 += 6;
      --v5;
    }
    while (v5);
  }
}

void ProResHWAnalyzer::parseHWStats(ProResHWAnalyzer *a1, uint64_t a2, void *a3, unsigned __int16 *a4, uint64_t a5, int a6, int a7, int a8, char a9, char a10)
{
  int v15 = 0;
  *(_WORD *)(a2 + 4) = 148;
  *(_WORD *)(a2 + 6) = a7;
  *(_WORD *)(a2 + 8) = a8;
  *(unsigned char *)(a2 + 10) = a9;
  *(_WORD *)(a2 + 11) = 256;
  *(unsigned char *)(a2 + 13) = 4;
  *(unsigned char *)(a2 + 16) = 8;
  *(unsigned char *)(a2 + 24) = a10;
  unsigned int v16 = (a7 + 15) >> 4;
  *(_DWORD *)(a2 + 28) = a8;
  *(_DWORD *)(a2 + 32) = v16;
  unsigned int v17 = 1 << a10;
  *(_DWORD *)(a2 + 36) = (a8 + 15) >> 4;
  do
  {
    if (v16 >= v17)
    {
      unint64_t v18 = (unsigned char *)(a2 + 64 + v15);
      do
      {
        *v18++ = v17;
        v16 -= v17;
        ++v15;
      }
      while (v16 >= v17);
    }
    v17 >>= 1;
  }
  while (v16);
  *(_DWORD *)(a2 + 40) = v15;
  if (a6 < 1)
  {
    int v20 = 0;
  }
  else
  {
    uint64_t v19 = 0;
    int v20 = 0;
    do
    {
      int v21 = ((*a3 >> 34) & 0x1FFF) + ((*(void *)((char *)a3 + 20) >> 34) & 0x1FFF) + ((a3[5] >> 34) & 0x1FFF) + 6;
      uint64_t v22 = *(void *)(a2 + 48);
      *(_WORD *)(*(void *)(a2 + 56) + 2 * v19) = v21;
      v20 += v21;
      *(unsigned char *)(v22 + v19) = *(unsigned char *)(a5 + v19);
      unint64_t v23 = (unsigned __int8 *)(a4 + 1);
      unsigned int v24 = *a4;
      a4 += 28;
      *(unsigned char *)(*(void *)(a2 + 336) + v19) = ((unsigned __int16)(v24 + (v24 >> 15)) >> 8) ^ 0x80;
      ProResHWAnalyzer::findMinMaxlastNZPos(a1, v23, (unsigned __int8 *)(*(void *)(a2 + 320) + v19), (unsigned __int8 *)(*(void *)(a2 + 328) + v19), 0x20u);
      ++v19;
      a3 = (void *)((char *)a3 + 60);
    }
    while (a6 != v19);
  }
  int v25 = v20 + 2 * a6;
  *(_DWORD *)(a2 + 20) = v25 + 8;
  *(_DWORD *)a2 = v25 + 164;
}

uint64_t ProResHWAnalyzer::analyzeProResFrame(uint64_t a1, uint64_t a2, SliceList *this, unsigned __int8 *a4)
{
  uint64_t v8 = 0;
  uint64_t v9 = *(void *)(a1 + 16);
  char v10 = 1;
  do
  {
    uint64_t v11 = 0;
    char v12 = v10;
    unint64_t v13 = (char *)this + 72 * v8;
    do
    {
      *(void *)&v13[v11 + 8] = *(void *)&v13[v11];
      v11 += 24;
    }
    while (v11 != 72);
    char v10 = 0;
    uint64_t v8 = 1;
  }
  while ((v12 & 1) != 0);
  if (*(_DWORD *)(a2 + 28) == 16 * *(_DWORD *)(a2 + 36)) {
    unsigned int v14 = 0;
  }
  else {
    unsigned int v14 = *(_DWORD *)(a2 + 40);
  }
  if (*(_DWORD *)(a1 + 24) == v14)
  {
    int v15 = 0;
    LODWORD(v16) = 0;
    goto LABEL_42;
  }
  unint64_t v16 = 0;
  int v15 = 0;
  do
  {
    unsigned int v17 = *(_DWORD *)(a2 + 40);
    unsigned int v18 = v16 / v17;
    signed int v19 = v16 % v17;
    if ((int)(v16 / v17) <= 1) {
      unsigned int v20 = 1;
    }
    else {
      unsigned int v20 = v16 / v17;
    }
    if (*(_DWORD *)(a2 + 36) - 1 > v18) {
      int v21 = v18 + 1;
    }
    else {
      int v21 = *(_DWORD *)(a2 + 36) - 1;
    }
    if (v19 <= 1) {
      unsigned int v22 = 1;
    }
    else {
      unsigned int v22 = v16 % v17;
    }
    if (v17 - 1 > v19) {
      int v23 = v19 + 1;
    }
    else {
      int v23 = v17 - 1;
    }
    if (*(_DWORD *)(a1 + 28) == 1)
    {
      uint64_t v24 = *(void *)(a2 + 344);
      int v25 = *(unsigned __int16 *)(v24 + 2 * v16);
      if (v25 < 0x7D0) {
        goto LABEL_25;
      }
      if (v25 > 0xF9F) {
        goto LABEL_39;
      }
      if (*(unsigned __int16 *)(v24 + 2 * (int)(v19 + (v20 - 1) * v17)) < 0x190u
        || *(unsigned __int16 *)(v24 + 2 * (int)(v19 + v21 * v17)) < 0x190u
        || (int v29 = v18 * v17, *(unsigned __int16 *)(v24 + 2 * (int)(v22 + v29 - 1)) < 0x190u))
      {
LABEL_25:
        BOOL v26 = 1;
      }
      else
      {
        BOOL v26 = *(unsigned __int16 *)(v24 + 2 * (v29 + v23)) < 0x190u;
      }
      if (*(unsigned __int8 *)(*(void *)(a2 + 48) + v16) > *a4 && v26) {
        goto LABEL_33;
      }
    }
    else
    {
      unsigned int v27 = *(unsigned __int8 *)(*(void *)(a2 + 320) + v16);
      if (v27 <= 7)
      {
        int v25 = *(unsigned __int8 *)(*(void *)(a2 + 328) + v16) - v27;
        if (v25 >= 33
          && *(unsigned __int8 *)(*(void *)(a2 + 336) + v16) >= 0x81u
          && *(unsigned __int8 *)(*(void *)(a2 + 48) + v16) > *a4)
        {
LABEL_33:
          *(unsigned char *)(v9 + v16) = 1;
          SliceList::add(this, (unsigned __int16)v16, (unsigned __int16)v25, 0, 0);
          int v28 = (*(unsigned __int16 *)(*(void *)(a2 + 56) + 2 * v16) - 6)
              * GAMMA[*(unsigned __int8 *)(*(void *)(a2 + 48) + v16)]
              / GAMMA[*a4]
              + 6;
          goto LABEL_40;
        }
      }
    }
LABEL_39:
    *(unsigned char *)(v9 + v16) = 0;
    int v28 = *(unsigned __int16 *)(*(void *)(a2 + 56) + 2 * v16);
LABEL_40:
    v15 += v28;
    ++v16;
  }
  while (v16 < *(_DWORD *)(a1 + 24) - v14);
  unsigned int v14 = *(_DWORD *)(a1 + 24);
LABEL_42:
  if (v16 >= v14)
  {
    size_t v31 = v14;
  }
  else
  {
    size_t v30 = v16;
    do
    {
      *(unsigned char *)(v9 + v30) = 0;
      v15 += *(unsigned __int16 *)(*(void *)(a2 + 56) + 2 * v30++);
      size_t v31 = *(unsigned int *)(a1 + 24);
    }
    while (v30 < v31);
    unsigned int v14 = *(_DWORD *)(a1 + 24);
  }
  uint64_t v32 = v15 + 2 * v14 + 8;
  memcpy((void *)(*(void *)(a1 + 16) + v31), *(const void **)(a1 + 16), v31);
  pthread_mutex_t v33 = *(unsigned char **)(a1 + 16);
  size_t v34 = *(unsigned int *)(a1 + 24);
  if (v34)
  {
    uint64_t v35 = 0;
    while (1)
    {
      unsigned int v36 = *(_DWORD *)(a2 + 40);
      unsigned int v37 = v35 / v36;
      signed int v38 = v35 % v36;
      if ((int)(v35 / v36) <= 1) {
        unsigned int v39 = 1;
      }
      else {
        unsigned int v39 = v35 / v36;
      }
      unsigned int v40 = *(_DWORD *)(a2 + 36) - 1;
      if (v40 > v37) {
        unsigned int v40 = v37 + 1;
      }
      if (v38 <= 1) {
        unsigned int v41 = 1;
      }
      else {
        unsigned int v41 = v35 % v36;
      }
      int v42 = v36 - 1;
      if (v36 - 1 > v38) {
        int v42 = v38 + 1;
      }
      if (v33[v35]) {
        goto LABEL_60;
      }
      signed int v43 = v38 + (v39 - 1) * v36;
      signed int v44 = v38 + v40 * v36;
      int v45 = v37 * v36;
      int v46 = v41 + v45 - 1;
      int v47 = v45 + v42;
      if (*(_DWORD *)(a1 + 28) == 1)
      {
        if (v33[v44]
           + v33[v43]
           + v33[v46]
           + v33[v47])
        {
          int v48 = *(unsigned __int16 *)(*(void *)(a2 + 344) + 2 * v35);
          if (v48 >> 3 <= 0x270) {
            goto LABEL_69;
          }
        }
      }
      else
      {
        int v48 = *(unsigned __int8 *)(*(void *)(a2 + 328) + v35) - *(unsigned __int8 *)(*(void *)(a2 + 320) + v35);
        if (v48 >= 9
          && *(unsigned __int8 *)(*(void *)(a2 + 336) + v35) >= 0x21u
          && v33[v44]
           + v33[v43]
           + v33[v46]
           + v33[v47])
        {
LABEL_69:
          if (*(unsigned __int8 *)(*(void *)(a2 + 48) + v35) > *a4)
          {
            SliceList::add(this, (unsigned __int16)v35, (unsigned __int16)v48, 0, 1u);
            int v49 = *(unsigned __int16 *)(*(void *)(a2 + 56) + 2 * v35);
            uint64_t v32 = (v32
                               - v49
                               + (v49 - 6) * GAMMA[*(unsigned __int8 *)(*(void *)(a2 + 48) + v35)] / GAMMA[*a4]
                               + 6);
            v33[(v35 + *(_DWORD *)(a1 + 24))] = 1;
            size_t v34 = *(unsigned int *)(a1 + 24);
          }
        }
      }
LABEL_60:
      if (++v35 >= v34)
      {
        pthread_mutex_t v33 = *(unsigned char **)(a1 + 16);
        goto LABEL_72;
      }
    }
  }
  size_t v34 = 0;
LABEL_72:
  memcpy(v33, &v33[v34], v34);
  unint64_t v50 = *(unsigned int *)(a1 + 24);
  if (!v50) {
    return v32;
  }
  uint64_t v51 = 0;
  uint64_t v52 = *(void *)(a1 + 16);
  while (2)
  {
    if (!*(unsigned char *)(v52 + v51))
    {
      unsigned int v53 = *(_DWORD *)(a2 + 40);
      unsigned int v54 = *(_DWORD *)(a2 + 36) - 1;
      signed int v55 = v51 / v53;
      if (v54 > v51 / v53) {
        unsigned int v54 = v55 + 1;
      }
      if (v55 <= 1) {
        unsigned int v56 = 1;
      }
      else {
        unsigned int v56 = v51 / v53;
      }
      if (*(unsigned __int8 *)(v52 + (int)(v51 % v53 + (v56 - 1) * v53))
         + *(unsigned __int8 *)(v52 + (int)(v51 % v53 + v54 * v53)))
      {
        BOOL v57 = *(unsigned __int8 *)(*(void *)(a2 + 48) + v51) >= *a4;
      }
      else
      {
        BOOL v57 = 0;
      }
      if (*(_DWORD *)(a1 + 28) == 1)
      {
        unsigned __int16 v58 = *(_WORD *)(*(void *)(a2 + 344) + 2 * v51);
        if (!v57) {
          goto LABEL_88;
        }
      }
      else
      {
        unsigned __int16 v58 = *(unsigned __int8 *)(*(void *)(a2 + 328) + v51) - *(unsigned __int8 *)(*(void *)(a2 + 320) + v51);
        if (!v57) {
          goto LABEL_88;
        }
      }
      SliceList::add(this, (unsigned __int16)v51, v58, 0, 1u);
      int v59 = *(unsigned __int16 *)(*(void *)(a2 + 56) + 2 * v51);
      uint64_t v32 = (v32
                         - v59
                         + (v59 - 6) * GAMMA[*(unsigned __int8 *)(*(void *)(a2 + 48) + v51)] / GAMMA[*a4]
                         + 6);
      *(unsigned char *)(v52 + (v51 + *(_DWORD *)(a1 + 24))) = 1;
      unint64_t v50 = *(unsigned int *)(a1 + 24);
    }
LABEL_88:
    if (++v51 < v50) {
      continue;
    }
    break;
  }
  if (v50)
  {
    unint64_t v60 = 0;
    unint64_t v61 = *(void *)(a1 + 16) + v50;
    do
    {
      if (!*(unsigned char *)(v61 + v60))
      {
        if (*(_DWORD *)(a1 + 28) == 1) {
          unsigned __int16 v62 = *(_WORD *)(*(void *)(a2 + 344) + 2 * v60);
        }
        else {
          unsigned __int16 v62 = *(unsigned __int8 *)(*(void *)(a2 + 328) + v60) - *(unsigned __int8 *)(*(void *)(a2 + 320) + v60);
        }
        SliceList::add(this, (unsigned __int16)v60, v62, 0, 2u);
        unint64_t v50 = *(unsigned int *)(a1 + 24);
      }
      ++v60;
    }
    while (v60 < v50);
  }
  return v32;
}

void SliceList::add(SliceList *this, int a2, int a3, int a4, unsigned int a5)
{
  int v5 = (int **)((char *)this + 72 * a4 + 24 * a5);
  int v6 = a3 | (a2 << 16);
  unint64_t v7 = (void **)(v5 + 1);
  uint64_t v8 = v5[1];
  char v10 = (char **)(v5 + 2);
  unint64_t v9 = (unint64_t)v5[2];
  if ((unint64_t)v8 >= v9)
  {
    uint64_t v12 = v8 - *v5;
    if ((unint64_t)(v12 + 1) >> 62) {
      std::vector<std::pair<unsigned short,unsigned short>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v13 = v9 - (void)*v5;
    uint64_t v14 = v13 >> 1;
    if (v13 >> 1 <= (unint64_t)(v12 + 1)) {
      uint64_t v14 = v12 + 1;
    }
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v15 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v15 = v14;
    }
    if (v15) {
      unint64_t v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned short,unsigned short>>>((uint64_t)v10, v15);
    }
    else {
      unint64_t v16 = 0;
    }
    unsigned int v17 = (int *)&v16[4 * v12];
    unsigned int v18 = &v16[4 * v15];
    *unsigned int v17 = v6;
    uint64_t v11 = v17 + 1;
    signed int v19 = (char *)*v7;
    unsigned int v20 = *v5;
    if (*v7 != *v5)
    {
      do
      {
        int v21 = *((_DWORD *)v19 - 1);
        v19 -= 4;
        *--unsigned int v17 = v21;
      }
      while (v19 != (char *)v20);
      signed int v19 = (char *)*v5;
    }
    *int v5 = v17;
    *unint64_t v7 = v11;
    *char v10 = v18;
    if (v19) {
      operator delete(v19);
    }
  }
  else
  {
    *uint64_t v8 = v6;
    uint64_t v11 = v8 + 1;
  }
  *unint64_t v7 = v11;
}

uint64_t ProResHWAnalyzer::getSliceToFix(uint64_t a1, unsigned int a2, unsigned int *a3, uint64_t a4, uint64_t a5, _DWORD *a6)
{
  *a6 = 0;
  uint64_t v12 = *a3;
  bzero(*(void **)(a1 + 16), (2 * *(_DWORD *)(a1 + 24)));
  unint64_t v13 = *(unsigned int *)(a1 + 24);
  if (v13)
  {
    unint64_t v14 = 0;
    uint64_t v15 = *(void *)(a1 + 16);
    do
    {
      uint64_t v16 = *(unsigned __int16 *)(a5 + 2 * v14);
      int v17 = *(unsigned __int16 *)(*(void *)(a4 + 56) + 2 * v16) - *(unsigned __int16 *)(*((void *)a3 + 7) + 2 * v16);
      if (v17 >= 1)
      {
        uint64_t v18 = (v17 + v12);
        if (v18 > a2) {
          return v12;
        }
        *(unsigned char *)(v15 + v16) = 1;
        ++*a6;
        unint64_t v13 = *(unsigned int *)(a1 + 24);
        uint64_t v12 = v18;
      }
      ++v14;
    }
    while (v14 < v13);
  }
  return v12;
}

uint64_t dummyCallback(unsigned __int8 *a1, unsigned int a2, unsigned int a3, void *a4)
{
  return 0;
}

uint64_t ProResHWAnalyzer::stitchProResFrame(uint64_t a1, uint64_t a2, unsigned __int8 *a3, uint64_t a4, uint64_t a5, void *a6, uint64_t (*a7)(unsigned __int8 *a1, unsigned int a2, unsigned int a3, void *a4), void *a8)
{
  v54[2] = *MEMORY[0x263EF8340];
  if (a7) {
    uint64_t v12 = a7;
  }
  else {
    uint64_t v12 = dummyCallback;
  }
  v54[0] = a3;
  v54[1] = a5;
  unsigned int v51 = 0;
  int v48 = v12;
  uint64_t v46 = *(void *)(a1 + 16);
  uint64_t v13 = *(unsigned __int16 *)(a2 + 4);
  uint64_t v14 = v13 + 8;
  if (v12(a3, 0, v13 + 8, a8))
  {
    exceptioint n = __cxa_allocate_exception(8uLL);
    void *exception = "frame header";
    __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
  }
  if (*(unsigned __int8 *)(a2 + 11) != *(unsigned __int8 *)(a4 + 11)) {
    __assert_rtn("stitchProResFrame", "AppleProResHWAnalyzer.cpp", 1013, "frm[0]->interlace_mode == frm[1]->interlace_mode");
  }
  int v15 = *(unsigned __int16 *)(a4 + 4);
  uint64_t v16 = (unsigned __int8 *)(a2 + 16);
  int v17 = (unsigned __int8 *)(a4 + 16);
  v52[0] = a2 + 16;
  v52[1] = a4 + 16;
  int v18 = *(_DWORD *)(a2 + 40) * *(_DWORD *)(a2 + 36);
  if (v18 != *(_DWORD *)(a4 + 40) * *(_DWORD *)(a4 + 36))
  {
    size_t v31 = "numSlicesP0 == pic[1]->height_in_mb * pic[1]->number_of_slices_per_mb_row";
    int v32 = 1024;
    goto LABEL_23;
  }
  if (v18 != *(_DWORD *)(a1 + 24))
  {
    size_t v31 = "numSlicesP0 == m_numSlices";
    int v32 = 1025;
LABEL_23:
    __assert_rtn("stitchProResFrame", "AppleProResHWAnalyzer.cpp", v32, v31);
  }
  unsigned int v19 = *v16 + 2 * v18;
  if (v48(&a3[v14], v13 + 8, v19, a8))
  {
    uint64_t v35 = __cxa_allocate_exception(8uLL);
    void *v35 = "picture header and slice table";
    __cxa_throw(v35, MEMORY[0x263F8C1D8], 0);
  }
  unsigned int v40 = (unsigned __int8 *)(a2 + 16);
  int v41 = v13;
  int v43 = v13 + 8;
  unint64_t v20 = *v16 + (unint64_t)v14;
  int v21 = *(_DWORD *)(a1 + 24);
  int v22 = v15 + 8 + 2 * v21 + *v17;
  v53[0] = v20 + 2 * v21;
  v53[1] = v22;
  int v42 = a3;
  int v39 = v20;
  if (v21)
  {
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    uint64_t v25 = v19 + v13 + 8;
    signed int v44 = &a3[v20];
    do
    {
      uint64_t v26 = *(unsigned __int8 *)(v46 + v24);
      unsigned int v27 = *(unsigned __int16 *)(*(void *)(v52[v26] + 40) + v23);
      uint64_t v28 = v53[v26];
      if (v48((unsigned __int8 *)(v54[v26] + v28), v25, *(unsigned __int16 *)(*(void *)(v52[v26] + 40) + v23), a8))
      {
        pthread_mutex_t v33 = __cxa_allocate_exception(8uLL);
        *pthread_mutex_t v33 = "slice data";
        __cxa_throw(v33, MEMORY[0x263F8C1D8], 0);
      }
      v53[v26] = v28 + v27;
      if (a7 && v26) {
        *(_WORD *)&v44[(int)v23] = __rev16(v27);
      }
      uint64_t v25 = v25 + v27;
      v19 += v27;
      v53[(1 - v26)] += *(unsigned __int16 *)(*(void *)(v52[(1 - v26)] + 40) + v23);
      ++v24;
      v23 += 2;
    }
    while (*(_DWORD *)(a1 + 24) > v24);
  }
  unsigned int v50 = bswap32(v19);
  if (v48((unsigned __int8 *)&v50, v41 + 9, 4u, a8))
  {
    unsigned int v36 = __cxa_allocate_exception(8uLL);
    *unsigned int v36 = "picture size";
    __cxa_throw(v36, MEMORY[0x263F8C1D8], 0);
  }
  if (v48(&v42[v39], v43 + *v40, 2 * *(_DWORD *)(a1 + 24), a8))
  {
    unsigned int v37 = __cxa_allocate_exception(8uLL);
    void *v37 = "slice table";
    __cxa_throw(v37, MEMORY[0x263F8C1D8], 0);
  }
  uint64_t v29 = v43 + v19;
  *a6 = v29;
  unsigned int v51 = bswap32(v29);
  if (v48((unsigned __int8 *)&v51, 0, 4u, a8))
  {
    signed int v38 = __cxa_allocate_exception(8uLL);
    void *v38 = "frame size";
    __cxa_throw(v38, MEMORY[0x263F8C1D8], 0);
  }
  return 0;
}

void sub_262BFAA08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int *a19, uint64_t a20,uint64_t a21,uint64_t a22,int buf,int a24,long long a25)
{
  if (a2 == 1)
  {
    uint64_t v25 = __cxa_begin_catch(a1);
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      int v26 = *a19;
      buf = 67109634;
      a24 = v26;
      LOWORD(a25) = 2080;
      *(void *)((char *)&a25 + 2) = "stitchProResFrame";
      WORD5(a25) = 2080;
      *(void *)((char *)&a25 + 12) = v25;
      _os_log_impl(&dword_262BEC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AppleProResHW (0x%x): %s(): ERROR: write %s failed", (uint8_t *)&buf, 0x1Cu);
    }
    __cxa_end_catch();
    JUMPOUT(0x262BFA864);
  }
  _Unwind_Resume(a1);
}

void SliceList::sort(SliceList *this, unsigned __int16 *a2, int a3)
{
  uint64_t v6 = 0;
  int v7 = 0;
  char v8 = 1;
  do
  {
    uint64_t v9 = 0;
    char v20 = v8;
    do
    {
      char v10 = (uint64_t *)((char *)this + 72 * v6 + 24 * v9);
      if (a3)
      {
        uint64_t v11 = (unsigned __int16 *)*((void *)this + 9 * v6 + 3 * v9 + 1);
        unint64_t v12 = 126 - 2 * __clz(((uint64_t)v11 - *v10) >> 2);
        if (v11 == (unsigned __int16 *)*v10) {
          uint64_t v13 = 0;
        }
        else {
          uint64_t v13 = v12;
        }
        std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned short,unsigned short> *,false>(*v10, v11, (uint64_t)&v21, v13, 1);
      }
      else
      {
        uint64_t v14 = *((void *)this + 9 * v6 + 3 * v9 + 1);
        unint64_t v15 = 126 - 2 * __clz((v14 - *v10) >> 2);
        if (v14 == *v10) {
          uint64_t v16 = 0;
        }
        else {
          uint64_t v16 = v15;
        }
        std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::reverse_iterator<std::__wrap_iter<std::pair<unsigned short,unsigned short> *>>,false>(v14, *((unsigned __int16 **)this + 9 * v6 + 3 * v9 + 1), *v10, (unsigned __int16 *)*v10, (uint64_t)&v22, v16, 1);
      }
      uint64_t v17 = *v10;
      uint64_t v18 = *((void *)this + 9 * v6 + 3 * v9 + 1);
      if (*v10 != v18)
      {
        unsigned int v19 = &a2[v7];
        do
        {
          *v19++ = *(_WORD *)(v17 + 2);
          v17 += 4;
          ++v7;
        }
        while (v17 != v18);
      }
      ++v9;
    }
    while (v9 != 3);
    char v8 = 0;
    uint64_t v6 = 1;
  }
  while ((v20 & 1) != 0);
}

unsigned int *EntropyCode::decodeLevelDifference(EntropyCode *this, __int16 *a2, int *a3, int a4)
{
  if (a4 >= 0) {
    unsigned int v6 = a4;
  }
  else {
    unsigned int v6 = -a4;
  }
  if (v6 >= 3) {
    unsigned int v6 = 3;
  }
  int v7 = EntropyCode::levelDifferenceCodeBook[v6];
  unsigned int v11 = 0;
  uint64_t result = RiceExpComboCode<unsigned int>::decodeUnsigned(&v11, (int *)a2, a3, v7);
  int v9 = (a4 >> 15) & 1;
  if (v9) {
    unsigned int v10 = -v11;
  }
  else {
    unsigned int v10 = v11;
  }
  *(_WORD *)this = (-(v11 & 1) ^ (v10 >> 1)) + (v11 & v9);
  return result;
}

unsigned int *RiceExpComboCode<unsigned int>::decodeUnsigned(unsigned int *result, int *a2, unsigned int a3, int a4)
{
  unsigned int v4 = RiceExpComboCodeCatalog[a4];
  unsigned int v5 = v4 & 3;
  unsigned int v6 = v4 >> 5;
  unsigned int v7 = __clz(a3);
  if (v7 <= v5)
  {
    unsigned int v10 = v7 + 1;
    if (v4 > 0x1F)
    {
      *a2 = v10 + v6;
      *uint64_t result = (a3 << v10 >> -(char)v6) + (v7 << v6);
    }
    else
    {
      *a2 = v10;
      *uint64_t result = v7;
    }
  }
  else
  {
    int v8 = (v4 >> 2) & 7;
    int v9 = v8 + 2 * (v7 - (v5 + 1)) + 1;
    *a2 = v9;
    *uint64_t result = ((v5 + 1) << v6) + (-1 << v8) + (a3 >> ((v5 ^ 0x1F) - v9));
    *a2 += v5 + 1;
  }
  return result;
}

void std::vector<std::pair<unsigned short,unsigned short>>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned short,unsigned short>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(4 * a2);
}

unsigned __int16 *std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned short,unsigned short> *,std::pair<unsigned short,unsigned short> *>(unsigned __int16 *a1, unsigned __int16 *a2, unsigned __int16 *a3, uint64_t a4)
{
  if (a1 != a2)
  {
    uint64_t v8 = (char *)a2 - (char *)a1;
    uint64_t v9 = ((char *)a2 - (char *)a1) >> 2;
    if ((char *)a2 - (char *)a1 >= 5)
    {
      unint64_t v10 = (unint64_t)(v9 - 2) >> 1;
      unint64_t v11 = v10 + 1;
      unint64_t v12 = &a1[2 * v10];
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned short,unsigned short> *>((uint64_t)a1, a4, v9, v12);
        v12 -= 2;
        --v11;
      }
      while (v11);
    }
    uint64_t v13 = a2;
    if (a2 != a3)
    {
      uint64_t v14 = a2;
      do
      {
        unsigned int v15 = *v14;
        unsigned int v16 = *a1;
        if (v15 < v16 || v16 >= v15 && v14[1] < a1[1])
        {
          *uint64_t v14 = v16;
          *a1 = v15;
          unsigned __int16 v17 = v14[1];
          v14[1] = a1[1];
          a1[1] = v17;
          std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned short,unsigned short> *>((uint64_t)a1, a4, v9, a1);
        }
        v14 += 2;
      }
      while (v14 != a3);
      uint64_t v13 = a3;
    }
    if (v8 >= 5)
    {
      uint64_t v18 = (unint64_t)v8 >> 2;
      unsigned int v19 = a2 - 2;
      do
      {
        int v20 = *(_DWORD *)a1;
        char v21 = std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned short,unsigned short> *>(a1, a4, v18);
        if (v19 == v21)
        {
          *(_DWORD *)char v21 = v20;
        }
        else
        {
          *(_DWORD *)char v21 = *(_DWORD *)v19;
          *(_DWORD *)unsigned int v19 = v20;
          std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned short,unsigned short> *>((uint64_t)a1, (uint64_t)(v21 + 2), a4, ((char *)(v21 + 2) - (char *)a1) >> 2);
        }
        v19 -= 2;
      }
      while (v18-- > 2);
    }
    return v13;
  }
  return a3;
}

uint64_t std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned short,unsigned short> *>(uint64_t result, uint64_t a2, uint64_t a3, unsigned __int16 *a4)
{
  if (a3 >= 2)
  {
    uint64_t v4 = (uint64_t)a4 - result;
    int64_t v5 = (unint64_t)(a3 - 2) >> 1;
    if (v5 >= ((uint64_t)a4 - result) >> 2)
    {
      uint64_t v6 = v4 >> 1;
      uint64_t v7 = (v4 >> 1) + 1;
      uint64_t v8 = (unsigned __int16 *)(result + 4 * v7);
      uint64_t v9 = v6 + 2;
      if (v9 < a3)
      {
        unsigned int v10 = v8[2];
        unsigned int v11 = *v8;
        if (v11 < v10 || v10 >= v11 && *(unsigned __int16 *)(result + 4 * v7 + 2) < v8[3])
        {
          v8 += 2;
          uint64_t v7 = v9;
        }
      }
      unsigned int v12 = *v8;
      unsigned int v13 = *a4;
      if (v12 >= v13)
      {
        unsigned int v14 = v8[1];
        if (v13 < v12 || v14 >= a4[1])
        {
          unsigned int v15 = (unsigned __int16)*(_DWORD *)a4;
          unsigned int v16 = HIWORD(*(_DWORD *)a4);
          *a4 = v12;
          a4[1] = v14;
          if (v5 >= v7)
          {
            while (1)
            {
              uint64_t v18 = 2 * v7;
              uint64_t v7 = (2 * v7) | 1;
              unsigned __int16 v17 = (unsigned __int16 *)(result + 4 * v7);
              uint64_t v19 = v18 + 2;
              if (v19 < a3)
              {
                unsigned int v20 = v17[2];
                unsigned int v21 = *v17;
                if (v21 < v20 || v20 >= v21 && *(unsigned __int16 *)(result + 4 * v7 + 2) < v17[3])
                {
                  v17 += 2;
                  uint64_t v7 = v19;
                }
              }
              unsigned int v22 = *v17;
              if (v22 < v15) {
                break;
              }
              unsigned int v23 = v17[1];
              if (v22 <= v15 && v23 < v16) {
                break;
              }
              *uint64_t v8 = v22;
              v8[1] = v23;
              uint64_t v8 = v17;
              if (v5 < v7) {
                goto LABEL_13;
              }
            }
          }
          unsigned __int16 v17 = v8;
LABEL_13:
          *unsigned __int16 v17 = v15;
          v17[1] = v16;
        }
      }
    }
  }
  return result;
}

unsigned __int16 *std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned short,unsigned short> *>(unsigned __int16 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = 0;
  uint64_t v4 = a3 - 2;
  if (a3 < 2) {
    uint64_t v4 = a3 - 1;
  }
  uint64_t v5 = v4 >> 1;
  do
  {
    uint64_t v6 = result;
    uint64_t v7 = v3 + 1;
    result += 2 * v3 + 2;
    uint64_t v8 = 2 * v3;
    uint64_t v3 = (2 * v3) | 1;
    uint64_t v9 = v8 + 2;
    if (v9 < a3)
    {
      unsigned int v10 = result[2];
      unsigned int v11 = *result;
      if (v11 < v10 || v10 >= v11 && HIWORD(v6[v7]) < result[3])
      {
        result += 2;
        uint64_t v3 = v9;
      }
    }
    *uint64_t v6 = *(_DWORD *)result;
  }
  while (v3 <= v5);
  return result;
}

uint64_t std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned short,unsigned short> *>(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4 - 2;
  if (a4 >= 2)
  {
    unint64_t v5 = v4 >> 1;
    uint64_t v6 = (unsigned __int16 *)(result + 4 * (v4 >> 1));
    unsigned int v7 = *v6;
    unsigned int v8 = *(unsigned __int16 *)(a2 - 4);
    if (v7 >= v8)
    {
      if (v8 < v7) {
        return result;
      }
      unsigned int v9 = *(unsigned __int16 *)(result + 4 * v5 + 2);
      if (v9 >= *(unsigned __int16 *)(a2 - 2)) {
        return result;
      }
    }
    else
    {
      LOWORD(v9) = v6[1];
    }
    unsigned int v10 = (unsigned __int16)*(_DWORD *)(a2 - 4);
    unsigned int v11 = HIWORD(*(_DWORD *)(a2 - 4));
    *(_WORD *)(a2 - 4) = v7;
    *(_WORD *)(a2 - 2) = v9;
    if (v4 >= 2)
    {
      while (1)
      {
        unint64_t v13 = v5 - 1;
        unint64_t v5 = (v5 - 1) >> 1;
        unsigned int v12 = (unsigned __int16 *)(result + 4 * v5);
        unsigned int v14 = *v12;
        if (v14 >= v10)
        {
          if (v14 > v10) {
            break;
          }
          unsigned int v15 = *(unsigned __int16 *)(result + 4 * v5 + 2);
          if (v15 >= v11) {
            break;
          }
        }
        else
        {
          LOWORD(v15) = v12[1];
        }
        *uint64_t v6 = v14;
        v6[1] = v15;
        uint64_t v6 = (unsigned __int16 *)(result + 4 * v5);
        if (v13 <= 1) {
          goto LABEL_13;
        }
      }
    }
    unsigned int v12 = v6;
LABEL_13:
    *unsigned int v12 = v10;
    v12[1] = v11;
  }
  return result;
}

uint64_t std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned short,unsigned short> *,false>(uint64_t result, unsigned __int16 *a2, uint64_t a3, uint64_t a4, char a5)
{
  unsigned int v10 = (unsigned __int16 *)result;
LABEL_2:
  unsigned int v11 = v10;
LABEL_3:
  uint64_t v12 = 1 - a4;
  while (1)
  {
    unsigned int v10 = v11;
    uint64_t v13 = v12;
    uint64_t v14 = (char *)a2 - (char *)v11;
    unint64_t v15 = ((char *)a2 - (char *)v11) >> 2;
    if (!(!v6 & v5))
    {
      switch(v15)
      {
        case 0uLL:
        case 1uLL:
          return result;
        case 2uLL:
          unsigned int v25 = *(a2 - 2);
          unsigned int v26 = *v11;
          if (v25 < v26 || v26 >= v25 && *(a2 - 1) < v11[1])
          {
            *unsigned int v11 = v25;
            *(a2 - 2) = v26;
            unsigned __int16 v27 = v11[1];
            v11[1] = *(a2 - 1);
            *(a2 - 1) = v27;
          }
          break;
        case 3uLL:
          uint64_t result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned short,unsigned short> *>(v11, v11 + 2, a2 - 2);
          break;
        case 4uLL:
          uint64_t result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned short,unsigned short> *>(v11, v11 + 2, v11 + 4, a2 - 2);
          break;
        case 5uLL:
          uint64_t result = std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned short,unsigned short> *>(v11, v11 + 2, v11 + 4, v11 + 6, a2 - 2);
          break;
        default:
          JUMPOUT(0);
      }
      return result;
    }
    if (v14 <= 95) {
      break;
    }
    if (v13 == 1)
    {
      if (v11 != a2)
      {
        return (uint64_t)std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned short,unsigned short> *,std::pair<unsigned short,unsigned short> *>(v11, a2, a2, a3);
      }
      return result;
    }
    unint64_t v16 = v15 >> 1;
    unsigned __int16 v17 = &v11[2 * (v15 >> 1)];
    if ((unint64_t)v14 >= 0x201)
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned short,unsigned short> *>(v11, &v11[2 * (v15 >> 1)], a2 - 2);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned short,unsigned short> *>(v11 + 2, v17 - 2, a2 - 4);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned short,unsigned short> *>(v11 + 4, &v11[2 * v16 + 2], a2 - 6);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned short,unsigned short> *>(v17 - 2, v17, &v11[2 * v16 + 2]);
      unsigned __int16 v18 = *v11;
      *unsigned int v11 = *v17;
      *unsigned __int16 v17 = v18;
      unsigned __int16 v19 = v11[1];
      v11[1] = v17[1];
      v17[1] = v19;
      if (a5) {
        goto LABEL_16;
      }
    }
    else
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned short,unsigned short> *>(&v11[2 * (v15 >> 1)], v11, a2 - 2);
      if (a5) {
        goto LABEL_16;
      }
    }
    unsigned int v20 = *(v11 - 2);
    unsigned int v21 = *v11;
    if (v20 >= v21 && (v21 < v20 || *(v11 - 1) >= v11[1]))
    {
      uint64_t result = (uint64_t)std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,std::pair<unsigned short,unsigned short> *,std::__less<void,void> &>(v11, a2);
      unsigned int v11 = (unsigned __int16 *)result;
      goto LABEL_21;
    }
LABEL_16:
    unsigned int v22 = std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,std::pair<unsigned short,unsigned short> *,std::__less<void,void> &>(v11, a2);
    if ((v23 & 1) == 0) {
      goto LABEL_19;
    }
    BOOL v24 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned short,unsigned short> *>(v11, v22);
    unsigned int v11 = v22 + 2;
    uint64_t result = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned short,unsigned short> *>(v22 + 2, a2);
    if (result)
    {
      a4 = -v13;
      a2 = v22;
      if (v24) {
        return result;
      }
      goto LABEL_2;
    }
    uint64_t v12 = v13 + 1;
    if (!v24)
    {
LABEL_19:
      uint64_t result = std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned short,unsigned short> *,false>(v10, v22, a3, -v13, a5 & 1);
      unsigned int v11 = v22 + 2;
LABEL_21:
      a5 = 0;
      a4 = -v13;
      goto LABEL_3;
    }
  }
  if (a5)
  {
    return (uint64_t)std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned short,unsigned short> *>(v11, a2);
  }
  else
  {
    return (uint64_t)std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned short,unsigned short> *>(v11, a2);
  }
}

unsigned __int16 *std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned short,unsigned short> *>(unsigned __int16 *result, unsigned __int16 *a2)
{
  if (result != a2)
  {
    __int16 v2 = result + 2;
    if (result + 2 != a2)
    {
      uint64_t v3 = 0;
      unint64_t v4 = result;
      while (1)
      {
        char v5 = v4;
        unint64_t v4 = v2;
        unsigned int v6 = v5[2];
        unsigned int v7 = *v5;
        if (v6 < v7) {
          break;
        }
        if (v7 >= v6)
        {
          unsigned int v8 = v5[1];
          if (v5[3] < v8) {
            goto LABEL_6;
          }
        }
LABEL_19:
        __int16 v2 = v4 + 2;
        v3 += 4;
        if (v4 + 2 == a2) {
          return result;
        }
      }
      LOWORD(v8) = v5[1];
LABEL_6:
      unsigned int v9 = *((_DWORD *)v5 + 1);
      v5[2] = v7;
      v4[1] = v8;
      unsigned int v10 = result;
      if (v5 != result)
      {
        uint64_t v11 = v3;
        do
        {
          unsigned int v12 = *(unsigned __int16 *)((char *)result + v11 - 4);
          if (v12 <= (unsigned __int16)v9)
          {
            if (v12 < (unsigned __int16)v9)
            {
              unsigned int v10 = v5;
              goto LABEL_18;
            }
            unsigned int v10 = (unsigned __int16 *)((char *)result + v11);
            unsigned int v13 = *(unsigned __int16 *)((char *)result + v11 - 2);
            if (v13 <= HIWORD(v9)) {
              goto LABEL_18;
            }
          }
          else
          {
            LOWORD(v13) = *(unsigned __int16 *)((char *)result + v11 - 2);
          }
          v5 -= 2;
          uint64_t v14 = (unsigned __int16 *)((char *)result + v11);
          *uint64_t v14 = v12;
          v14[1] = v13;
          v11 -= 4;
        }
        while (v11);
        unsigned int v10 = result;
      }
LABEL_18:
      *(_DWORD *)unsigned int v10 = v9;
      goto LABEL_19;
    }
  }
  return result;
}

unsigned __int16 *std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned short,unsigned short> *>(unsigned __int16 *result, unsigned __int16 *a2)
{
  if (result != a2)
  {
    __int16 v2 = result + 2;
    if (result + 2 != a2)
    {
      uint64_t v3 = result + 1;
      do
      {
        unint64_t v4 = result;
        uint64_t result = v2;
        unsigned int v5 = v4[2];
        unsigned int v6 = *v4;
        if (v5 < v6 || v6 >= v5 && v4[3] < v4[1])
        {
          unsigned int v7 = *(_DWORD *)result;
          unsigned int v8 = (unsigned __int16)*(_DWORD *)result;
          for (uint64_t i = v3; ; i -= 2)
          {
            i[1] = v6;
            i[2] = *i;
            unsigned int v6 = (unsigned __int16)*(i - 3);
            if (v6 <= v8 && (v6 < v8 || (unsigned __int16)*(i - 2) <= HIWORD(v7))) {
              break;
            }
          }
          *(i - 1) = v8;
          *uint64_t i = HIWORD(v7);
        }
        __int16 v2 = result + 2;
        v3 += 2;
      }
      while (result + 2 != a2);
    }
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned short,unsigned short> *>(unsigned __int16 *a1, unsigned __int16 *a2, unsigned __int16 *a3)
{
  unsigned int v3 = *a2;
  unsigned int v4 = *a1;
  if (v3 >= v4 && (v4 < v3 || a2[1] >= a1[1]))
  {
    unsigned int v9 = *a3;
    if (v9 >= v3 && (v3 < v9 || a3[1] >= a2[1])) {
      return 0;
    }
    *a2 = v9;
    *a3 = v3;
    uint64_t v11 = a2 + 1;
    unsigned __int16 v10 = a2[1];
    a2[1] = a3[1];
    a3[1] = v10;
    unsigned int v12 = *a2;
    unsigned int v13 = *a1;
    if (v12 >= v13 && (v13 < v12 || *v11 >= a1[1])) {
      return 1;
    }
    *a1 = v12;
    unsigned int v6 = a1 + 1;
    *a2 = v13;
    uint64_t v8 = 2;
  }
  else
  {
    unsigned int v5 = *a3;
    if (v5 < v3 || v3 >= v5 && a3[1] < a2[1])
    {
      *a1 = v5;
      unsigned int v6 = a1 + 1;
      *a3 = v4;
      unsigned int v7 = a3 + 1;
      uint64_t v8 = 1;
    }
    else
    {
      *a1 = v3;
      *a2 = v4;
      unsigned int v14 = a1[1];
      a1[1] = a2[1];
      a2[1] = v14;
      unsigned int v15 = *a3;
      unsigned int v16 = *a2;
      if (v15 >= v16 && (v16 < v15 || a3[1] >= v14)) {
        return 1;
      }
      *a2 = v15;
      *a3 = v16;
      unsigned int v7 = a3 + 1;
      uint64_t v8 = 2;
      unsigned int v6 = a2 + 1;
    }
    uint64_t v11 = v7;
  }
  unsigned __int16 v17 = *v6;
  *unsigned int v6 = *v11;
  *uint64_t v11 = v17;
  return v8;
}

unsigned __int16 *std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,std::pair<unsigned short,unsigned short> *,std::__less<void,void> &>(unsigned __int16 *a1, unsigned __int16 *a2)
{
  unsigned int v2 = (unsigned __int16)*(_DWORD *)a1;
  unsigned int v3 = HIWORD(*(_DWORD *)a1);
  unsigned int v4 = *(a2 - 2);
  if (v4 <= v2 && (v4 < v2 || *(a2 - 1) <= v3))
  {
    for (uint64_t i = a1 + 2; i < a2; i += 2)
    {
      unsigned int v16 = *i;
      if (v16 > v2 || v16 >= v2 && i[1] > v3) {
        break;
      }
    }
  }
  else
  {
    uint64_t i = a1;
    do
    {
      unsigned int v7 = i[2];
      i += 2;
      unsigned int v6 = v7;
    }
    while (v7 <= v2 && (v6 < v2 || i[1] <= v3));
  }
  if (i < a2)
  {
    for (a2 -= 2; v4 > v2 || v4 >= v2 && a2[1] > v3; a2 -= 2)
    {
      unsigned int v8 = *(a2 - 2);
      unsigned int v4 = v8;
    }
  }
  if (i < a2)
  {
    LOWORD(v9) = *i;
    unsigned __int16 v10 = *a2;
    do
    {
      *uint64_t i = v10;
      *a2 = v9;
      unsigned __int16 v11 = i[1];
      i[1] = a2[1];
      a2[1] = v11;
      do
      {
        unsigned int v12 = i[2];
        i += 2;
        unsigned int v9 = v12;
      }
      while (v12 <= v2 && (v9 < v2 || i[1] <= v3));
      do
      {
        do
        {
          unsigned int v13 = *(a2 - 2);
          a2 -= 2;
          unsigned __int16 v10 = v13;
          BOOL v14 = v13 >= v2;
        }
        while (v13 > v2);
      }
      while (v14 && a2[1] > v3);
    }
    while (i < a2);
  }
  if (i - 2 != a1) {
    *(_DWORD *)a1 = *((_DWORD *)i - 1);
  }
  *(i - 2) = v2;
  *(i - 1) = v3;
  return i;
}

_WORD *std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,std::pair<unsigned short,unsigned short> *,std::__less<void,void> &>(_DWORD *a1, _WORD *a2)
{
  uint64_t v2 = 0;
  unsigned int v3 = (unsigned __int16)*a1;
  unsigned int v4 = HIWORD(*a1);
  while (1)
  {
    unsigned int v5 = LOWORD(a1[v2 + 1]);
    if (v5 >= v3 && (v5 > v3 || HIWORD(a1[v2 + 1]) >= v4)) {
      break;
    }
    ++v2;
  }
  unint64_t v6 = (unint64_t)&a1[v2 + 1];
  if (v2 * 4)
  {
    do
    {
      unsigned int v8 = (unsigned __int16)*(a2 - 2);
      a2 -= 2;
      unsigned int v7 = v8;
    }
    while (v8 >= v3 && (v7 > v3 || (unsigned __int16)a2[1] >= v4));
  }
  else
  {
LABEL_19:
    if (v6 < (unint64_t)a2)
    {
      do
      {
        unsigned int v10 = (unsigned __int16)*(a2 - 2);
        a2 -= 2;
        unsigned int v9 = v10;
        if (v10 < v3) {
          break;
        }
        if (v9 > v3) {
          goto LABEL_19;
        }
      }
      while ((unsigned __int16)a2[1] >= v4 && v6 < (unint64_t)a2);
    }
  }
  if (v6 >= (unint64_t)a2)
  {
    unsigned int v13 = (_WORD *)v6;
  }
  else
  {
    LOWORD(v12) = *a2;
    unsigned int v13 = (_WORD *)v6;
    BOOL v14 = a2;
    do
    {
      _WORD *v13 = v12;
      *BOOL v14 = v5;
      __int16 v15 = v13[1];
      v13[1] = v14[1];
      v14[1] = v15;
      do
      {
        do
        {
          unsigned int v16 = (unsigned __int16)v13[2];
          v13 += 2;
          LOWORD(v5) = v16;
          BOOL v17 = v16 > v3;
        }
        while (v16 < v3);
      }
      while (!v17 && (unsigned __int16)v13[1] < v4);
      do
      {
        unsigned int v18 = (unsigned __int16)*(v14 - 2);
        v14 -= 2;
        unsigned int v12 = v18;
      }
      while (v18 >= v3 && (v12 > v3 || (unsigned __int16)v14[1] >= v4));
    }
    while (v13 < v14);
  }
  if (v13 - 2 != (_WORD *)a1) {
    *a1 = *((_DWORD *)v13 - 1);
  }
  *(v13 - 2) = v3;
  *(v13 - 1) = v4;
  return v13 - 2;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned short,unsigned short> *>(unsigned __int16 *a1, unsigned __int16 *a2)
{
  uint64_t v4 = ((char *)a2 - (char *)a1) >> 2;
  BOOL result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      unsigned int v6 = *(a2 - 2);
      unsigned int v7 = *a1;
      if (v6 < v7 || v7 >= v6 && *(a2 - 1) < a1[1])
      {
        *a1 = v6;
        *(a2 - 2) = v7;
        unsigned __int16 v8 = a1[1];
        a1[1] = *(a2 - 1);
        *(a2 - 1) = v8;
      }
      return result;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned short,unsigned short> *>(a1, a1 + 2, a2 - 2);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned short,unsigned short> *>(a1, a1 + 2, a1 + 4, a2 - 2);
      return 1;
    case 5:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned short,unsigned short> *>(a1, a1 + 2, a1 + 4, a1 + 6, a2 - 2);
      return 1;
    default:
      unsigned int v9 = a1 + 4;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned short,unsigned short> *>(a1, a1 + 2, a1 + 4);
      unsigned int v10 = a1 + 6;
      if (a1 + 6 == a2) {
        return 1;
      }
      uint64_t v11 = 0;
      int v12 = 0;
      break;
  }
  do
  {
    unsigned int v13 = *v10;
    unsigned int v14 = *v9;
    if (v13 >= v14)
    {
      if (v14 < v13) {
        goto LABEL_23;
      }
      unsigned int v15 = v9[1];
      if (v10[1] >= v15) {
        goto LABEL_23;
      }
    }
    else
    {
      LOWORD(v15) = v9[1];
    }
    unsigned int v16 = *(_DWORD *)v10;
    unsigned int v17 = (unsigned __int16)*(_DWORD *)v10;
    *unsigned int v10 = v14;
    v10[1] = v15;
    unsigned int v18 = a1;
    if (v9 == a1) {
      goto LABEL_22;
    }
    uint64_t v19 = v11;
    while (1)
    {
      unsigned int v20 = (char *)a1 + v19;
      unsigned int v21 = *(unsigned __int16 *)((char *)a1 + v19 + 4);
      if (v21 <= v17) {
        break;
      }
      LOWORD(v22) = *((_WORD *)v20 + 3);
LABEL_19:
      v9 -= 2;
      *((_WORD *)v20 + 4) = v21;
      *(unsigned __int16 *)((char *)a1 + v19 + 10) = v22;
      v19 -= 4;
      if (v19 == -8)
      {
        unsigned int v18 = a1;
        goto LABEL_22;
      }
    }
    if (v21 < v17)
    {
      unsigned int v18 = v9;
      goto LABEL_22;
    }
    unsigned int v22 = *(unsigned __int16 *)((char *)a1 + v19 + 6);
    if (v22 > HIWORD(v16)) {
      goto LABEL_19;
    }
    unsigned int v18 = (unsigned __int16 *)((char *)a1 + v19 + 8);
LABEL_22:
    *unsigned int v18 = v17;
    v18[1] = HIWORD(v16);
    if (++v12 == 8) {
      return v10 + 2 == a2;
    }
LABEL_23:
    unsigned int v9 = v10;
    v11 += 4;
    v10 += 2;
  }
  while (v10 != a2);
  return 1;
}

uint64_t std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned short,unsigned short> *>(unsigned __int16 *a1, unsigned __int16 *a2, unsigned __int16 *a3, unsigned __int16 *a4)
{
  uint64_t result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned short,unsigned short> *>(a1, a2, a3);
  unsigned int v9 = *a4;
  unsigned int v10 = *a3;
  if (v9 < v10 || v10 >= v9 && a4[1] < a3[1])
  {
    *a3 = v9;
    *a4 = v10;
    unsigned __int16 v11 = a3[1];
    a3[1] = a4[1];
    a4[1] = v11;
    unsigned int v12 = *a3;
    unsigned int v13 = *a2;
    if (v12 < v13 || v13 >= v12 && a3[1] < a2[1])
    {
      *a2 = v12;
      *a3 = v13;
      unsigned __int16 v14 = a2[1];
      a2[1] = a3[1];
      a3[1] = v14;
      unsigned int v15 = *a2;
      unsigned int v16 = *a1;
      if (v15 < v16 || v16 >= v15 && a2[1] < a1[1])
      {
        *a1 = v15;
        *a2 = v16;
        unsigned __int16 v17 = a1[1];
        a1[1] = a2[1];
        a2[1] = v17;
      }
    }
  }
  return result;
}

uint64_t std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned short,unsigned short> *>(unsigned __int16 *a1, unsigned __int16 *a2, unsigned __int16 *a3, unsigned __int16 *a4, unsigned __int16 *a5)
{
  uint64_t result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned short,unsigned short> *>(a1, a2, a3, a4);
  unsigned int v11 = *a5;
  unsigned int v12 = *a4;
  if (v11 < v12 || v12 >= v11 && a5[1] < a4[1])
  {
    *a4 = v11;
    *a5 = v12;
    unsigned __int16 v13 = a4[1];
    a4[1] = a5[1];
    a5[1] = v13;
    unsigned int v14 = *a4;
    unsigned int v15 = *a3;
    if (v14 < v15 || v15 >= v14 && a4[1] < a3[1])
    {
      *a3 = v14;
      *a4 = v15;
      unsigned __int16 v16 = a3[1];
      a3[1] = a4[1];
      a4[1] = v16;
      unsigned int v17 = *a3;
      unsigned int v18 = *a2;
      if (v17 < v18 || v18 >= v17 && a3[1] < a2[1])
      {
        *a2 = v17;
        *a3 = v18;
        unsigned __int16 v19 = a2[1];
        a2[1] = a3[1];
        a3[1] = v19;
        unsigned int v20 = *a2;
        unsigned int v21 = *a1;
        if (v20 < v21 || v21 >= v20 && a2[1] < a1[1])
        {
          *a1 = v20;
          *a2 = v21;
          unsigned __int16 v22 = a1[1];
          a1[1] = a2[1];
          a2[1] = v22;
        }
      }
    }
  }
  return result;
}

uint64_t std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::reverse_iterator<std::__wrap_iter<std::pair<unsigned short,unsigned short> *>>,std::reverse_iterator<std::__wrap_iter<std::pair<unsigned short,unsigned short> *>>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8 = a2 - a4;
  if (a2 == a4) {
    return a5;
  }
  if (v8 >= 5)
  {
    unint64_t v14 = (unint64_t)((v8 >> 2) - 2) >> 1;
    unint64_t v15 = v14 + 1;
    uint64_t v16 = a2 - 4 * v14;
    do
    {
      std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::reverse_iterator<std::__wrap_iter<std::pair<unsigned short,unsigned short> *>>>(a1, a2, a7, v8 >> 2, v16, v16);
      v16 += 4;
      --v15;
    }
    while (v15);
  }
  if (a4 != a6)
  {
    uint64_t v17 = a4;
    uint64_t v18 = a4;
    do
    {
      unsigned int v20 = *(unsigned __int16 *)(v18 - 4);
      v18 -= 4;
      unsigned int v19 = v20;
      unsigned int v21 = *(unsigned __int16 *)(a2 - 4);
      if (v20 < v21 || v21 >= v19 && *(unsigned __int16 *)(v17 - 2) < *(unsigned __int16 *)(a2 - 2))
      {
        *(_WORD *)(v17 - 4) = v21;
        *(_WORD *)(a2 - 4) = v19;
        __int16 v22 = *(_WORD *)(v17 - 2);
        *(_WORD *)(v17 - 2) = *(_WORD *)(a2 - 2);
        *(_WORD *)(a2 - 2) = v22;
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::reverse_iterator<std::__wrap_iter<std::pair<unsigned short,unsigned short> *>>>(a1, a2, a7, v8 >> 2, a1, a2);
      }
      uint64_t v17 = v18;
    }
    while (v18 != a6);
  }
  if (v8 >= 5)
  {
    uint64_t v23 = (unint64_t)v8 >> 2;
    uint64_t v24 = a4 + 4;
    do
    {
      int v25 = *(_DWORD *)(a2 - 4);
      std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::reverse_iterator<std::__wrap_iter<std::pair<unsigned short,unsigned short> *>>>(a1, a2, a7, v23);
      if (v24 == v27)
      {
        *(_DWORD *)(v27 - 4) = v25;
      }
      else
      {
        *(_DWORD *)(v27 - 4) = *(_DWORD *)(v24 - 4);
        *(_DWORD *)(v24 - 4) = v25;
        std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::reverse_iterator<std::__wrap_iter<std::pair<unsigned short,unsigned short> *>>>(a1, a2, v26, (unsigned __int16 *)(v27 - 4), a7, (a2 - (v27 - 4)) >> 2);
      }
      v24 += 4;
    }
    while (v23-- > 2);
  }
  return a3;
}

void std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::reverse_iterator<std::__wrap_iter<std::pair<unsigned short,unsigned short> *>>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a4 >= 2)
  {
    uint64_t v6 = a2 - a6;
    int64_t v7 = (unint64_t)(a4 - 2) >> 1;
    if (v7 >= (a2 - a6) >> 2)
    {
      uint64_t v8 = v6 >> 1;
      uint64_t v9 = (v6 >> 1) | 1;
      uint64_t v10 = a2 - 4 * v9;
      uint64_t v11 = v8 + 2;
      if (v11 < a4)
      {
        unsigned int v12 = *(unsigned __int16 *)(v10 - 4);
        unsigned int v13 = *(unsigned __int16 *)(v10 - 8);
        if (v12 < v13 || v13 >= v12 && *(unsigned __int16 *)(v10 - 2) < *(unsigned __int16 *)(v10 - 6))
        {
          v10 -= 4;
          uint64_t v9 = v11;
        }
      }
      unsigned int v14 = *(unsigned __int16 *)(v10 - 4);
      unsigned int v15 = *(unsigned __int16 *)(a6 - 4);
      if (v14 >= v15)
      {
        unsigned int v16 = *(unsigned __int16 *)(v10 - 2);
        if (v15 < v14 || v16 >= *(unsigned __int16 *)(a6 - 2))
        {
          unsigned int v17 = (unsigned __int16)*(_DWORD *)(a6 - 4);
          unsigned int v18 = HIWORD(*(_DWORD *)(a6 - 4));
          *(_WORD *)(a6 - 4) = v14;
          *(_WORD *)(a6 - 2) = v16;
          if (v7 >= v9)
          {
            while (1)
            {
              uint64_t v20 = 2 * v9;
              uint64_t v9 = (2 * v9) | 1;
              uint64_t v19 = a2 - 4 * v9;
              uint64_t v21 = v20 + 2;
              if (v21 < a4)
              {
                unsigned int v22 = *(unsigned __int16 *)(v19 - 4);
                unsigned int v23 = *(unsigned __int16 *)(v19 - 8);
                if (v22 < v23
                  || v23 >= v22 && *(unsigned __int16 *)(v19 - 2) < *(unsigned __int16 *)(v19 - 6))
                {
                  v19 -= 4;
                  uint64_t v9 = v21;
                }
              }
              unsigned int v24 = *(unsigned __int16 *)(v19 - 4);
              if (v24 < v17) {
                break;
              }
              unsigned int v25 = *(unsigned __int16 *)(v19 - 2);
              if (v24 <= v17 && v25 < v18) {
                break;
              }
              *(_WORD *)(v10 - 4) = v24;
              *(_WORD *)(v10 - 2) = v25;
              uint64_t v10 = v19;
              if (v7 < v9) {
                goto LABEL_13;
              }
            }
          }
          uint64_t v19 = v10;
LABEL_13:
          *(_WORD *)(v19 - 4) = v17;
          *(_WORD *)(v19 - 2) = v18;
        }
      }
    }
  }
}

void std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::reverse_iterator<std::__wrap_iter<std::pair<unsigned short,unsigned short> *>>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = 0;
  uint64_t v5 = a4 - 2;
  if (a4 < 2) {
    uint64_t v5 = a4 - 1;
  }
  uint64_t v6 = v5 >> 1;
  do
  {
    uint64_t v7 = a2;
    a2 += 4 * ~v4;
    uint64_t v8 = 2 * v4;
    uint64_t v4 = (2 * v4) | 1;
    uint64_t v9 = v8 + 2;
    if (v9 < a4)
    {
      unsigned int v10 = *(unsigned __int16 *)(a2 - 4);
      unsigned int v11 = *(unsigned __int16 *)(a2 - 8);
      if (v10 < v11 || v11 >= v10 && *(unsigned __int16 *)(a2 - 2) < *(unsigned __int16 *)(a2 - 6))
      {
        a2 -= 4;
        uint64_t v4 = v9;
      }
    }
    *(_DWORD *)(v7 - 4) = *(_DWORD *)(a2 - 4);
  }
  while (v4 <= v6);
}

void std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::reverse_iterator<std::__wrap_iter<std::pair<unsigned short,unsigned short> *>>>(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int16 *a4, uint64_t a5, uint64_t a6)
{
  unint64_t v6 = a6 - 2;
  if (a6 >= 2)
  {
    unint64_t v7 = v6 >> 1;
    uint64_t v8 = a2 - 4 * (v6 >> 1);
    unsigned int v9 = *(unsigned __int16 *)(v8 - 4);
    unsigned int v10 = *a4;
    if (v9 >= v10)
    {
      if (v10 < v9) {
        return;
      }
      unsigned int v11 = *(unsigned __int16 *)(v8 - 2);
      if (v11 >= a4[1]) {
        return;
      }
    }
    else
    {
      LOWORD(v11) = *(_WORD *)(v8 - 2);
    }
    unsigned int v12 = (unsigned __int16)*(_DWORD *)a4;
    unsigned int v13 = HIWORD(*(_DWORD *)a4);
    *a4 = v9;
    a4[1] = v11;
    if (v6 >= 2)
    {
      while (1)
      {
        unint64_t v15 = v7 - 1;
        unint64_t v7 = (v7 - 1) >> 1;
        uint64_t v14 = a2 - 4 * v7;
        unsigned int v16 = *(unsigned __int16 *)(v14 - 4);
        if (v16 >= v12)
        {
          if (v16 > v12) {
            break;
          }
          unsigned int v17 = *(unsigned __int16 *)(v14 - 2);
          if (v17 >= v13) {
            break;
          }
        }
        else
        {
          LOWORD(v17) = *(_WORD *)(v14 - 2);
        }
        *(_WORD *)(v8 - 4) = v16;
        *(_WORD *)(v8 - 2) = v17;
        uint64_t v8 = a2 - 4 * v7;
        if (v15 <= 1) {
          goto LABEL_13;
        }
      }
    }
    uint64_t v14 = v8;
LABEL_13:
    *(_WORD *)(v14 - 4) = v12;
    *(_WORD *)(v14 - 2) = v13;
  }
}

void std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::reverse_iterator<std::__wrap_iter<std::pair<unsigned short,unsigned short> *>>,false>(uint64_t a1, unsigned __int16 *a2, uint64_t a3, unsigned __int16 *a4, uint64_t a5, uint64_t a6, char a7)
{
  while (2)
  {
    while (2)
    {
      uint64_t v16 = (uint64_t)(a4 + 2);
      uint64_t v37 = (uint64_t)(a4 + 6);
      uint64_t v38 = (uint64_t)(a4 + 4);
      uint64_t v17 = 1 - a6;
      unsigned int v40 = a4;
      while (1)
      {
        uint64_t v18 = (char *)a2 - (char *)a4;
        unint64_t v19 = ((char *)a2 - (char *)a4) >> 2;
        if (!(!v8 & v7))
        {
          switch(v19)
          {
            case 0uLL:
            case 1uLL:
              return;
            case 2uLL:
              unsigned int v34 = *a4;
              unsigned int v35 = *(a2 - 2);
              if (v34 < v35 || v35 >= v34 && a4[1] < *(a2 - 1))
              {
                *(a2 - 2) = v34;
                *a4 = v35;
                unsigned __int16 v36 = *(a2 - 1);
                *(a2 - 1) = a4[1];
                a4[1] = v36;
              }
              break;
            case 3uLL:
              std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::reverse_iterator<std::__wrap_iter<std::pair<unsigned short,unsigned short> *>>>(a1, (uint64_t)a2, (uint64_t)(a2 - 2), (uint64_t)(a2 - 2), a3, (uint64_t)(a4 + 2));
              break;
            case 4uLL:
              std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::reverse_iterator<std::__wrap_iter<std::pair<unsigned short,unsigned short> *>>>(a1, (uint64_t)a2, (uint64_t)(a2 - 2), (uint64_t)(a2 - 2), (uint64_t)(a2 - 4), (uint64_t)(a2 - 4), a3, (uint64_t)(a4 + 2));
              break;
            case 5uLL:
              std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::reverse_iterator<std::__wrap_iter<std::pair<unsigned short,unsigned short> *>>>(a1, (uint64_t)a2, (uint64_t)(a2 - 2), (uint64_t)(a2 - 2), (uint64_t)(a2 - 4), (uint64_t)(a2 - 4), (uint64_t)(a2 - 6), (uint64_t)(a2 - 6), a3, (uint64_t)(a4 + 2));
              break;
            default:
              JUMPOUT(0);
          }
          return;
        }
        if (v18 <= 95)
        {
          if (a7) {
            std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::reverse_iterator<std::__wrap_iter<std::pair<unsigned short,unsigned short> *>>>(a1, a2, a3, a4);
          }
          else {
            std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::reverse_iterator<std::__wrap_iter<std::pair<unsigned short,unsigned short> *>>>(a1, a2, a3, a4);
          }
          return;
        }
        if (v17 == 1)
        {
          if (a2 != a4) {
            std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::reverse_iterator<std::__wrap_iter<std::pair<unsigned short,unsigned short> *>>,std::reverse_iterator<std::__wrap_iter<std::pair<unsigned short,unsigned short> *>>>(a1, (uint64_t)a2, a3, (uint64_t)a4, a3, (uint64_t)a4, a5);
          }
          return;
        }
        unint64_t v20 = v19 >> 1;
        uint64_t v21 = (uint64_t)&a2[-2 * (v19 >> 1)];
        if ((unint64_t)v18 >= 0x201)
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::reverse_iterator<std::__wrap_iter<std::pair<unsigned short,unsigned short> *>>>(a1, (uint64_t)a2, (uint64_t)&a2[-2 * (v19 >> 1)], (uint64_t)&a2[-2 * (v19 >> 1)], v16, v16);
          uint64_t v22 = a3;
          uint64_t v23 = (uint64_t)&a2[2 * (1 - v20)];
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::reverse_iterator<std::__wrap_iter<std::pair<unsigned short,unsigned short> *>>>((uint64_t)(a2 - 2), (uint64_t)(a2 - 2), v23, v23, v38, v38);
          uint64_t v24 = (uint64_t)&a2[2 * ~v20];
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::reverse_iterator<std::__wrap_iter<std::pair<unsigned short,unsigned short> *>>>((uint64_t)(a2 - 4), (uint64_t)(a2 - 4), v24, v24, v37, v37);
          uint64_t v25 = v23;
          uint64_t v26 = v23;
          a3 = v22;
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::reverse_iterator<std::__wrap_iter<std::pair<unsigned short,unsigned short> *>>>(v25, v26, v21, v21, v24, v24);
          __int16 v27 = *(a2 - 2);
          *(a2 - 2) = *(_WORD *)(v21 - 4);
          *(_WORD *)(v21 - 4) = v27;
          __int16 v28 = *(a2 - 1);
          *(a2 - 1) = *(_WORD *)(v21 - 2);
          *(_WORD *)(v21 - 2) = v28;
        }
        else
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::reverse_iterator<std::__wrap_iter<std::pair<unsigned short,unsigned short> *>>>((uint64_t)&a2[-2 * (v19 >> 1)], (uint64_t)&a2[-2 * (v19 >> 1)], a1, (uint64_t)a2, v16, v16);
        }
        a4 = v40;
        if (a7) {
          break;
        }
        unsigned int v29 = *a2;
        unsigned int v30 = *(a2 - 2);
        if (v29 < v30 || v30 >= v29 && a2[1] < *(a2 - 1)) {
          break;
        }
        std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,std::reverse_iterator<std::__wrap_iter<std::pair<unsigned short,unsigned short> *>>,std::__less<void,void> &>(a1, a2, a3, v40);
        a1 = v31;
        a2 = v32;
        a7 = 0;
        ++v17;
      }
      std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,std::reverse_iterator<std::__wrap_iter<std::pair<unsigned short,unsigned short> *>>,std::__less<void,void> &>(a2, v40, (uint64_t)&v41);
      uint64_t v33 = v41;
      a4 = v42;
      a6 = -v17;
      if (!v43) {
        goto LABEL_20;
      }
      char v39 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::reverse_iterator<std::__wrap_iter<std::pair<unsigned short,unsigned short> *>>>(a1, (uint64_t)a2, v41, v42);
      if (!std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::reverse_iterator<std::__wrap_iter<std::pair<unsigned short,unsigned short> *>>>((uint64_t)(a4 - 2), (uint64_t)(a4 - 2), a3, v40))
      {
        if (v39)
        {
          a1 = v33;
          a2 = a4 - 2;
LABEL_21:
          a4 = v40;
          continue;
        }
LABEL_20:
        std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::reverse_iterator<std::__wrap_iter<std::pair<unsigned short,unsigned short> *>>,false>(a1, a2, v33, a4, a5, -v17, a7 & 1);
        a7 = 0;
        a2 = a4 - 2;
        a1 = v33;
        goto LABEL_21;
      }
      break;
    }
    a3 = v33;
    if ((v39 & 1) == 0) {
      continue;
    }
    break;
  }
}

void std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::reverse_iterator<std::__wrap_iter<std::pair<unsigned short,unsigned short> *>>>(uint64_t a1, unsigned __int16 *a2, uint64_t a3, unsigned __int16 *a4)
{
  if (a2 == a4) {
    return;
  }
  uint64_t v4 = a2 - 2;
  if (a2 - 2 == a4) {
    return;
  }
  uint64_t v5 = 0;
  unint64_t v6 = a2 - 2;
  do
  {
    char v7 = v4 + 2;
    unsigned int v8 = *v4;
    unsigned int v10 = *(v6 - 2);
    v6 -= 2;
    unsigned int v9 = v10;
    if (v10 >= v8)
    {
      if (v8 < v9) {
        goto LABEL_17;
      }
      unsigned int v11 = v4[1];
      if (*(v4 - 1) >= v11) {
        goto LABEL_17;
      }
    }
    else
    {
      LOWORD(v11) = v4[1];
    }
    unsigned int v12 = *((_DWORD *)v4 - 1);
    *(v4 - 2) = v8;
    *(v4 - 1) = v11;
    if (v7 == a2)
    {
LABEL_13:
      char v7 = a2;
      goto LABEL_14;
    }
    uint64_t v13 = v5;
    while (1)
    {
      unsigned int v14 = *(unsigned __int16 *)((char *)a2 + v13);
      if (v14 <= (unsigned __int16)v12) {
        break;
      }
      LOWORD(v15) = *(unsigned __int16 *)((char *)a2 + v13 + 2);
LABEL_12:
      v7 += 2;
      uint64_t v16 = (uint64_t)a2 + v13;
      *(_WORD *)(v16 - 4) = v14;
      *(_WORD *)(v16 - 2) = v15;
      v13 += 4;
      if (!v13) {
        goto LABEL_13;
      }
    }
    if (v14 < (unsigned __int16)v12) {
      goto LABEL_14;
    }
    unsigned int v15 = *(unsigned __int16 *)((char *)a2 + v13 + 2);
    if (v15 > HIWORD(v12)) {
      goto LABEL_12;
    }
    char v7 = (unsigned __int16 *)((char *)a2 + v13);
LABEL_14:
    *((_DWORD *)v7 - 1) = v12;
LABEL_17:
    v5 -= 4;
    uint64_t v4 = v6;
  }
  while (v6 != a4);
}

void std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::reverse_iterator<std::__wrap_iter<std::pair<unsigned short,unsigned short> *>>>(uint64_t a1, unsigned __int16 *a2, uint64_t a3, unsigned __int16 *a4)
{
  if (a2 != a4)
  {
    uint64_t v4 = a2 - 2;
    if (a2 - 2 != a4)
    {
      uint64_t v5 = a2 - 1;
      do
      {
        unint64_t v6 = v4;
        unsigned int v8 = *(v4 - 2);
        v4 -= 2;
        unsigned int v7 = v8;
        unsigned int v9 = *v6;
        if (v8 < v9 || v9 >= v7 && *(v6 - 1) < v6[1])
        {
          unsigned int v10 = *(_DWORD *)v4;
          unsigned int v11 = (unsigned __int16)*(_DWORD *)v4;
          for (uint64_t i = v5; ; i += 2)
          {
            *(i - 3) = v9;
            *(i - 2) = *i;
            unsigned int v9 = i[1];
            if (v9 <= v11 && (v9 < v11 || i[2] <= HIWORD(v10))) {
              break;
            }
          }
          *(i - 1) = v11;
          *uint64_t i = HIWORD(v10);
        }
        v5 -= 2;
      }
      while (v4 != a4);
    }
  }
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::reverse_iterator<std::__wrap_iter<std::pair<unsigned short,unsigned short> *>>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unsigned int v6 = *(unsigned __int16 *)(a4 - 4);
  unsigned int v7 = *(unsigned __int16 *)(a2 - 4);
  if (v6 < v7 || v7 >= v6 && *(unsigned __int16 *)(a4 - 2) < *(unsigned __int16 *)(a2 - 2))
  {
    unsigned int v8 = *(unsigned __int16 *)(a6 - 4);
    if (v8 < v6 || v6 >= v8 && *(unsigned __int16 *)(a6 - 2) < *(unsigned __int16 *)(a4 - 2))
    {
      *(_WORD *)(a2 - 4) = v8;
      *(_WORD *)(a6 - 4) = v7;
      unsigned int v9 = (__int16 *)(a2 - 2);
      unsigned int v10 = (__int16 *)(a6 - 2);
      uint64_t result = 1;
LABEL_14:
      __int16 v20 = *v9;
      *unsigned int v9 = *v10;
      *unsigned int v10 = v20;
      return result;
    }
    *(_WORD *)(a2 - 4) = v6;
    unsigned int v9 = (__int16 *)(a4 - 2);
    __int16 v16 = *(_WORD *)(a4 - 2);
    *(_WORD *)(a4 - 4) = v7;
    unsigned int v17 = *(unsigned __int16 *)(a2 - 2);
    *(_WORD *)(a2 - 2) = v16;
    *(_WORD *)(a4 - 2) = v17;
    unsigned int v18 = *(unsigned __int16 *)(a6 - 4);
    unsigned int v19 = *(unsigned __int16 *)(a4 - 4);
    if (v18 >= v19 && (v19 < v18 || *(unsigned __int16 *)(a6 - 2) >= v17)) {
      return 1;
    }
    *(_WORD *)(a4 - 4) = v18;
    *(_WORD *)(a6 - 4) = v19;
    unsigned int v10 = (__int16 *)(a6 - 2);
LABEL_13:
    uint64_t result = 2;
    goto LABEL_14;
  }
  unsigned int v12 = *(unsigned __int16 *)(a6 - 4);
  if (v12 >= v6 && (v6 < v12 || *(unsigned __int16 *)(a6 - 2) >= *(unsigned __int16 *)(a4 - 2))) {
    return 0;
  }
  *(_WORD *)(a4 - 4) = v12;
  *(_WORD *)(a6 - 4) = v6;
  unsigned int v10 = (__int16 *)(a4 - 2);
  __int16 v13 = *(_WORD *)(a4 - 2);
  *(_WORD *)(a4 - 2) = *(_WORD *)(a6 - 2);
  *(_WORD *)(a6 - 2) = v13;
  unsigned int v14 = *(unsigned __int16 *)(a4 - 4);
  unsigned int v15 = *(unsigned __int16 *)(a2 - 4);
  if (v14 < v15 || v15 >= v14 && (unsigned __int16)*v10 < *(unsigned __int16 *)(a2 - 2))
  {
    *(_WORD *)(a2 - 4) = v14;
    *(_WORD *)(a4 - 4) = v15;
    unsigned int v9 = (__int16 *)(a2 - 2);
    goto LABEL_13;
  }
  return 1;
}

void std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,std::reverse_iterator<std::__wrap_iter<std::pair<unsigned short,unsigned short> *>>,std::__less<void,void> &>(uint64_t a1, unsigned __int16 *a2, uint64_t a3, unsigned __int16 *a4)
{
  uint64_t v4 = a2 - 2;
  unsigned int v5 = *((_DWORD *)a2 - 1);
  unsigned int v6 = (unsigned __int16)v5;
  unsigned int v7 = HIWORD(v5);
  unsigned int v8 = *a4;
  if (v8 <= (unsigned __int16)v5 && (v8 < (unsigned __int16)v5 || a4[1] <= v7))
  {
    while (v4 > a4)
    {
      unsigned int v13 = *(v4 - 2);
      if (v13 > v6 || v13 >= v6 && *(v4 - 1) > v7) {
        break;
      }
      v4 -= 2;
    }
  }
  else
  {
    unsigned int v9 = *(a2 - 4);
    if (v9 <= v6)
    {
      unsigned int v10 = a2 - 6;
      do
      {
        if (v9 >= v6 && v10[3] > v7) {
          break;
        }
        unsigned int v11 = *v10;
        v10 -= 2;
        unsigned int v9 = v11;
      }
      while (v11 <= v6);
      uint64_t v4 = v10 + 4;
    }
  }
  if (v4 > a4)
  {
    for (a4 += 2; v8 > v6 || v8 >= v6 && *(a4 - 1) > v7; a4 += 2)
    {
      unsigned int v12 = *a4;
      unsigned int v8 = v12;
    }
  }
  if (a4 >= v4)
  {
    unsigned int v14 = v4;
  }
  else
  {
    unsigned int v14 = v4;
    do
    {
      unsigned __int16 v15 = *(v14 - 2);
      v14 -= 2;
      *unsigned int v14 = *(a4 - 2);
      *(a4 - 2) = v15;
      unsigned __int16 v16 = v14[1];
      v14[1] = *(a4 - 1);
      *(a4 - 1) = v16;
      unsigned int v17 = *(v14 - 2);
      if (v17 <= v6)
      {
        unsigned int v18 = v4 - 6;
        do
        {
          if (v17 >= v6 && v18[3] > v7) {
            break;
          }
          unsigned int v19 = *v18;
          v18 -= 2;
          unsigned int v17 = v19;
        }
        while (v19 <= v6);
        unsigned int v14 = v18 + 4;
      }
      do
      {
        do
        {
          a4 += 2;
          unsigned int v20 = *(a4 - 2);
        }
        while (v20 > v6);
      }
      while (v20 >= v6 && *(a4 - 1) > v7);
      uint64_t v4 = v14;
    }
    while (a4 < v14);
  }
  if (v14 + 2 != a2) {
    *((_DWORD *)a2 - 1) = *(_DWORD *)v14;
  }
  *unsigned int v14 = v6;
  v14[1] = v7;
}

void std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,std::reverse_iterator<std::__wrap_iter<std::pair<unsigned short,unsigned short> *>>,std::__less<void,void> &>(unsigned __int16 *a1@<X1>, unsigned __int16 *a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v3 = 0;
  unsigned int v4 = (unsigned __int16)*((_DWORD *)a1 - 1);
  unsigned int v5 = HIWORD(*((_DWORD *)a1 - 1));
  while (1)
  {
    unsigned int v6 = a1[v3 - 4];
    if (v6 >= v4 && (v6 > v4 || a1[v3 - 3] >= v5)) {
      break;
    }
    v3 -= 2;
  }
  unint64_t v7 = (unint64_t)&a1[v3 - 2];
  if (v3 * 2)
  {
    do
    {
      unsigned int v9 = *a2;
      a2 += 2;
      unsigned int v8 = v9;
    }
    while (v9 >= v4 && (v8 > v4 || *(a2 - 1) >= v5));
  }
  else if (v7 > (unint64_t)a2)
  {
    while (1)
    {
      unsigned int v11 = *a2;
      a2 += 2;
      unsigned int v10 = v11;
      if (v11 < v4) {
        break;
      }
      if (v10 <= v4)
      {
        if (*(a2 - 1) < v5 || (unint64_t)a2 >= v7) {
          break;
        }
      }
      else if ((unint64_t)a2 >= v7)
      {
        break;
      }
    }
  }
  unsigned int v13 = (unsigned __int16 *)v7;
  if ((unint64_t)a2 < v7)
  {
    unsigned int v14 = a2;
    do
    {
      unsigned __int16 v15 = *(v13 - 2);
      v13 -= 2;
      unsigned __int16 *v13 = *(v14 - 2);
      *(v14 - 2) = v15;
      unsigned __int16 v16 = v13[1];
      v13[1] = *(v14 - 1);
      *(v14 - 1) = v16;
      while (1)
      {
        unsigned int v17 = *(v13 - 2);
        if (v17 >= v4 && (v17 > v4 || *(v13 - 1) >= v5)) {
          break;
        }
        v13 -= 2;
      }
      do
      {
        unsigned int v19 = *v14;
        v14 += 2;
        unsigned int v18 = v19;
      }
      while (v19 >= v4 && (v18 > v4 || *(v14 - 1) >= v5));
    }
    while (v14 < v13);
  }
  unsigned int v20 = v13 + 2;
  if (v13 + 2 != a1) {
    *((_DWORD *)a1 - 1) = *(_DWORD *)v13;
  }
  unsigned __int16 *v13 = v4;
  v13[1] = v5;
  *(void *)a3 = v20;
  *(void *)(a3 + 8) = v20;
  *(unsigned char *)(a3 + 16) = (unint64_t)a2 >= v7;
}

uint64_t std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::reverse_iterator<std::__wrap_iter<std::pair<unsigned short,unsigned short> *>>>(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int16 *a4)
{
  char v6 = 1;
  switch((a2 - (uint64_t)a4) >> 2)
  {
    case 0:
    case 1:
      return v6 & 1;
    case 2:
      unsigned int v7 = *a4;
      unsigned int v8 = *(unsigned __int16 *)(a2 - 4);
      if (v7 < v8 || v8 >= v7 && a4[1] < *(unsigned __int16 *)(a2 - 2))
      {
        *(_WORD *)(a2 - 4) = v7;
        *a4 = v8;
        unsigned __int16 v9 = *(_WORD *)(a2 - 2);
        *(_WORD *)(a2 - 2) = a4[1];
        a4[1] = v9;
      }
      goto LABEL_27;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::reverse_iterator<std::__wrap_iter<std::pair<unsigned short,unsigned short> *>>>(a1, a2, a2 - 4, a2 - 4, a3, (uint64_t)(a4 + 2));
      goto LABEL_27;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::reverse_iterator<std::__wrap_iter<std::pair<unsigned short,unsigned short> *>>>(a1, a2, a2 - 4, a2 - 4, a2 - 8, a2 - 8, a3, (uint64_t)(a4 + 2));
      goto LABEL_27;
    case 5:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::reverse_iterator<std::__wrap_iter<std::pair<unsigned short,unsigned short> *>>>(a1, a2, a2 - 4, a2 - 4, a2 - 8, a2 - 8, a2 - 12, a2 - 12, a3, (uint64_t)(a4 + 2));
LABEL_27:
      char v6 = 1;
      return v6 & 1;
    default:
      uint64_t v10 = a2 - 8;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::reverse_iterator<std::__wrap_iter<std::pair<unsigned short,unsigned short> *>>>(a1, a2, a2 - 4, a2 - 4, a2 - 8, a2 - 8);
      uint64_t v12 = a2 - 12;
      if ((unsigned __int16 *)(a2 - 12) == a4) {
        goto LABEL_29;
      }
      uint64_t v11 = 0;
      int v13 = 0;
      unsigned int v14 = (unsigned __int16 *)(a2 - 12);
      break;
  }
  do
  {
    unsigned int v16 = *(v14 - 2);
    v14 -= 2;
    unsigned int v15 = v16;
    unsigned int v17 = *(unsigned __int16 *)(v10 - 4);
    if (v16 >= v17)
    {
      if (v17 < v15) {
        goto LABEL_21;
      }
      unsigned int v18 = *(unsigned __int16 *)(v10 - 2);
      if (*(unsigned __int16 *)(v12 - 2) >= v18) {
        goto LABEL_21;
      }
    }
    else
    {
      LOWORD(v18) = *(_WORD *)(v10 - 2);
    }
    unsigned int v19 = *(_DWORD *)(v12 - 4);
    *(_WORD *)(v12 - 4) = v17;
    *(_WORD *)(v12 - 2) = v18;
    if (v10 == a2)
    {
LABEL_19:
      uint64_t v10 = a2;
      goto LABEL_20;
    }
    uint64_t v20 = v11;
    while (1)
    {
      unsigned int v21 = *(unsigned __int16 *)(a2 + v20 - 8);
      if (v21 <= (unsigned __int16)v19) {
        break;
      }
      LOWORD(v22) = *(_WORD *)(a2 + v20 - 6);
LABEL_18:
      v10 += 4;
      uint64_t v23 = a2 + v20;
      *(_WORD *)(v23 - 12) = v21;
      *(_WORD *)(v23 - 10) = v22;
      v20 += 4;
      if (v20 == 8) {
        goto LABEL_19;
      }
    }
    if (v21 < (unsigned __int16)v19) {
      goto LABEL_20;
    }
    unsigned int v22 = *(unsigned __int16 *)(a2 + v20 - 6);
    if (v22 > HIWORD(v19)) {
      goto LABEL_18;
    }
    uint64_t v10 = a2 + v20 - 8;
LABEL_20:
    *(_DWORD *)(v10 - 4) = v19;
    if (++v13 == 8)
    {
      char v25 = 0;
      LOBYTE(v11) = v14 == a4;
      goto LABEL_31;
    }
LABEL_21:
    v11 -= 4;
    uint64_t v10 = v12;
    uint64_t v12 = (uint64_t)v14;
  }
  while (v14 != a4);
LABEL_29:
  char v25 = 1;
LABEL_31:
  char v6 = v25 | v11;
  return v6 & 1;
}

uint64_t std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::reverse_iterator<std::__wrap_iter<std::pair<unsigned short,unsigned short> *>>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::reverse_iterator<std::__wrap_iter<std::pair<unsigned short,unsigned short> *>>>(a1, a2, a3, a4, a5, a6);
  unsigned int v13 = *(unsigned __int16 *)(a8 - 4);
  unsigned int v14 = *(unsigned __int16 *)(a6 - 4);
  if (v13 < v14 || v14 >= v13 && *(unsigned __int16 *)(a8 - 2) < *(unsigned __int16 *)(a6 - 2))
  {
    *(_WORD *)(a6 - 4) = v13;
    *(_WORD *)(a8 - 4) = v14;
    __int16 v15 = *(_WORD *)(a6 - 2);
    *(_WORD *)(a6 - 2) = *(_WORD *)(a8 - 2);
    *(_WORD *)(a8 - 2) = v15;
    unsigned int v16 = *(unsigned __int16 *)(a6 - 4);
    unsigned int v17 = *(unsigned __int16 *)(a4 - 4);
    if (v16 < v17 || v17 >= v16 && *(unsigned __int16 *)(a6 - 2) < *(unsigned __int16 *)(a4 - 2))
    {
      *(_WORD *)(a4 - 4) = v16;
      *(_WORD *)(a6 - 4) = v17;
      __int16 v18 = *(_WORD *)(a4 - 2);
      *(_WORD *)(a4 - 2) = *(_WORD *)(a6 - 2);
      *(_WORD *)(a6 - 2) = v18;
      unsigned int v19 = *(unsigned __int16 *)(a4 - 4);
      unsigned int v20 = *(unsigned __int16 *)(a2 - 4);
      if (v19 < v20 || v20 >= v19 && *(unsigned __int16 *)(a4 - 2) < *(unsigned __int16 *)(a2 - 2))
      {
        *(_WORD *)(a2 - 4) = v19;
        *(_WORD *)(a4 - 4) = v20;
        __int16 v21 = *(_WORD *)(a2 - 2);
        *(_WORD *)(a2 - 2) = *(_WORD *)(a4 - 2);
        *(_WORD *)(a4 - 2) = v21;
      }
    }
  }
  return result;
}

uint64_t std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::reverse_iterator<std::__wrap_iter<std::pair<unsigned short,unsigned short> *>>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::reverse_iterator<std::__wrap_iter<std::pair<unsigned short,unsigned short> *>>>(a1, a2, a3, a4, a5, a6, a7, a8);
  unsigned int v15 = *(unsigned __int16 *)(a10 - 4);
  unsigned int v16 = *(unsigned __int16 *)(a8 - 4);
  if (v15 < v16 || v16 >= v15 && *(unsigned __int16 *)(a10 - 2) < *(unsigned __int16 *)(a8 - 2))
  {
    *(_WORD *)(a8 - 4) = v15;
    *(_WORD *)(a10 - 4) = v16;
    __int16 v17 = *(_WORD *)(a8 - 2);
    *(_WORD *)(a8 - 2) = *(_WORD *)(a10 - 2);
    *(_WORD *)(a10 - 2) = v17;
    unsigned int v18 = *(unsigned __int16 *)(a8 - 4);
    unsigned int v19 = *(unsigned __int16 *)(a6 - 4);
    if (v18 < v19 || v19 >= v18 && *(unsigned __int16 *)(a8 - 2) < *(unsigned __int16 *)(a6 - 2))
    {
      *(_WORD *)(a6 - 4) = v18;
      *(_WORD *)(a8 - 4) = v19;
      __int16 v20 = *(_WORD *)(a6 - 2);
      *(_WORD *)(a6 - 2) = *(_WORD *)(a8 - 2);
      *(_WORD *)(a8 - 2) = v20;
      unsigned int v21 = *(unsigned __int16 *)(a6 - 4);
      unsigned int v22 = *(unsigned __int16 *)(a4 - 4);
      if (v21 < v22 || v22 >= v21 && *(unsigned __int16 *)(a6 - 2) < *(unsigned __int16 *)(a4 - 2))
      {
        *(_WORD *)(a4 - 4) = v21;
        *(_WORD *)(a6 - 4) = v22;
        __int16 v23 = *(_WORD *)(a4 - 2);
        *(_WORD *)(a4 - 2) = *(_WORD *)(a6 - 2);
        *(_WORD *)(a6 - 2) = v23;
        unsigned int v24 = *(unsigned __int16 *)(a4 - 4);
        unsigned int v25 = *(unsigned __int16 *)(a2 - 4);
        if (v24 < v25 || v25 >= v24 && *(unsigned __int16 *)(a4 - 2) < *(unsigned __int16 *)(a2 - 2))
        {
          *(_WORD *)(a2 - 4) = v24;
          *(_WORD *)(a4 - 4) = v25;
          __int16 v26 = *(_WORD *)(a2 - 2);
          *(_WORD *)(a2 - 2) = *(_WORD *)(a4 - 2);
          *(_WORD *)(a4 - 2) = v26;
        }
      }
    }
  }
  return result;
}

uint64_t SetRAWAttachments(uint64_t a1, __CVBuffer *a2, int a3, int a4, double a5, uint8x8_t a6)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  unsigned int v20 = 256;
  unsigned int v10 = *(unsigned __int8 *)(a1 + 16);
  *(float *)&a5 = (float)(1 << a3);
  float v16 = *(float *)&a5;
  unsigned int v17 = *(unsigned __int16 *)(a1 + 68);
  unsigned int valuePtr = v10;
  a6.i32[0] = *(_DWORD *)(a1 + 12);
  *(float32x4_t *)bytes = vdivq_f32(vcvtq_f32_u32(vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(a6))), (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a5, 0));
  setCVBufferAttachmentData(a2, (const __CFString *)*MEMORY[0x263F04200], bytes, 16, a4);
  setCVBufferAttachmentNumber(a2, (const __CFString *)*MEMORY[0x263F04238], kCFNumberSInt32Type, &valuePtr, a4);
  setCVBufferAttachmentNumber(a2, (const __CFString *)*MEMORY[0x263F041E0], kCFNumberSInt32Type, &v20, a4);
  unsigned int v19 = v20 + *(unsigned __int16 *)(a1 + 18);
  setCVBufferAttachmentNumber(a2, (const __CFString *)*MEMORY[0x263F04228], kCFNumberSInt32Type, &v19, a4);
  setCVBufferAttachmentNumber(a2, (const __CFString *)*MEMORY[0x263F04220], kCFNumberFloat32Type, (const unsigned int *)(a1 + 20), a4);
  setCVBufferAttachmentNumber(a2, (const __CFString *)*MEMORY[0x263F04210], kCFNumberFloat32Type, (const unsigned int *)(a1 + 24), a4);
  setCVBufferAttachmentData(a2, (const __CFString *)*MEMORY[0x263F041E8], (UInt8 *)(a1 + 28), 36, a4);
  setCVBufferAttachmentNumber(a2, (const __CFString *)*MEMORY[0x263F041F0], kCFNumberFloat32Type, (const unsigned int *)(a1 + 64), a4);
  setCVBufferAttachmentNumber(a2, (const __CFString *)*MEMORY[0x263F04218], kCFNumberSInt32Type, &v17, a4);
  setCVBufferAttachmentNumber(a2, @"ProResRAW_LargestDCQSS", kCFNumberSInt32Type, (const unsigned int *)(a1 + 72), a4);
  v31[0] = -(float)(0.5 / v16);
  v31[1] = v31[0];
  v31[2] = v31[0];
  v31[3] = 0.5 / v16;
  v31[4] = 0.5 / v16;
  v31[5] = 0.5 / v16;
  uint64_t v32 = 0;
  v29[0] = 0.5 / v16;
  v29[1] = v31[0];
  v29[2] = 0.5 / v16;
  v29[3] = 0.5 / v16;
  v29[4] = v31[0];
  v29[5] = 0.5 / v16;
  uint64_t v30 = 0;
  v27[0] = v31[0];
  v27[1] = 0.5 / v16;
  v27[2] = v31[0];
  v27[3] = v31[0];
  v27[4] = 0.5 / v16;
  v27[5] = v31[0];
  uint64_t v28 = 0;
  v25[0] = 0.5 / v16;
  v25[1] = 0.5 / v16;
  v25[2] = 0.5 / v16;
  v25[3] = v31[0];
  v25[4] = v31[0];
  v25[5] = v31[0];
  uint64_t v26 = 0;
  memset(v24, 0, sizeof(v24));
  if (a3)
  {
    uint64_t v11 = v31;
    switch(valuePtr)
    {
      case 0u:
        break;
      case 1u:
        uint64_t v11 = v29;
        break;
      case 2u:
        uint64_t v11 = v27;
        break;
      case 3u:
        uint64_t v11 = v25;
        break;
      default:
        goto LABEL_4;
    }
  }
  else
  {
LABEL_4:
    uint64_t v11 = (float *)v24;
  }
  long long v12 = *((_OWORD *)v11 + 1);
  *(_OWORD *)unsigned int v21 = *(_OWORD *)v11;
  long long v22 = v12;
  setCVBufferAttachmentData(a2, (const __CFString *)*MEMORY[0x263F04208], v21, 32, a4);
  unsigned int v13 = *(UInt8 **)(a1 + 152);
  unsigned int v14 = *(UInt8 **)(a1 + 160);
  if (v14 != v13) {
    setCVBufferAttachmentData(a2, (const __CFString *)*MEMORY[0x263F041F8], v13, (v14 - v13), a4);
  }
  return 0;
}

void setCVBufferAttachmentData(__CVBuffer *a1, const __CFString *a2, UInt8 *bytes, CFIndex length, int a5)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  CFDataRef v8 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes, length);
  if (v8)
  {
    CFDataRef v9 = v8;
    CVBufferSetAttachment(a1, a2, v8, kCVAttachmentMode_ShouldPropagate);
    CFRelease(v9);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v10[0] = 67109378;
    v10[1] = a5;
    __int16 v11 = 2080;
    long long v12 = "setCVBufferAttachmentData";
    _os_log_impl(&dword_262BEC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AppleProResHW (0x%x): %s(): Cannot create CFData\n", (uint8_t *)v10, 0x12u);
  }
}

void setCVBufferAttachmentNumber(__CVBuffer *a1, const __CFString *a2, CFNumberType theType, const unsigned int *valuePtr, int a5)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  CFNumberRef v8 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], theType, valuePtr);
  if (v8)
  {
    CFNumberRef v9 = v8;
    CVBufferSetAttachment(a1, a2, v8, kCVAttachmentMode_ShouldPropagate);
    CFRelease(v9);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v10[0] = 67109378;
    v10[1] = a5;
    __int16 v11 = 2080;
    long long v12 = "setCVBufferAttachmentNumber";
    _os_log_impl(&dword_262BEC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AppleProResHW (0x%x): %s(): Cannot create CFNumber\n", (uint8_t *)v10, 0x12u);
  }
}

uint64_t ProResDecoder_CreateInstance(int a1, uint64_t a2, void *a3)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFUUIDRef v6 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x263EFFB08]);
  int v7 = *(_OWORD *)&CFUUIDGetUUIDBytes(v6);
  CFRelease(v6);
  int v8 = 0;
  if (a1 <= 1634755431)
  {
    if (a1 != 1634743400 && a1 != 1634743416) {
      goto LABEL_24;
    }
  }
  else if ((a1 - 1634755432) > 0xB || ((1 << (a1 - 104)) & 0x8C1) == 0)
  {
    if (a1 == 1634759272 || a1 == 1634759278)
    {
      int v8 = 1;
      goto LABEL_9;
    }
LABEL_24:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      LODWORD(keys) = 67109378;
      HIDWORD(keys) = v7;
      LOWORD(v35) = 2080;
      *(void *)((char *)&v35 + 2) = "ProResDecoder_CreateInstance";
      _os_log_impl(&dword_262BEC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AppleProResHW (0x%x): %s(): AppleProResHW decoder cannot decode unsupported codecType", (uint8_t *)&keys, 0x12u);
    }
    uint64_t v9 = 4294954396;
LABEL_12:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      keys = (void *)-4227857662;
      LOWORD(v35) = 2080;
      *(void *)((char *)&v35 + 2) = "ProResDecoder_CreateInstance";
      WORD5(v35) = 1024;
      HIDWORD(v35) = v9;
      unsigned int v10 = &_os_log_internal;
LABEL_35:
      _os_log_impl(&dword_262BEC000, v10, OS_LOG_TYPE_ERROR, "AppleProResHW (0x%x): %s(): returning err = %d\n", (uint8_t *)&keys, 0x18u);
      return v9;
    }
    return v9;
  }
LABEL_9:
  kdebug_trace();
  VTVideoDecoderGetClassID();
  if (CMDerivedObjectCreate())
  {
    uint64_t v9 = 3758097084;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ProResDecoder_CreateInstance_cold_4();
    }
    goto LABEL_12;
  }
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  bzero((void *)DerivedStorage, 0x2B8uLL);
  *(_DWORD *)(DerivedStorage + 684) = 1;
  *(_DWORD *)(DerivedStorage + 452) = 24;
  *(unsigned char *)(DerivedStorage + 691) = 0;
  *(_DWORD *)(DerivedStorage + 444) = v8;
  *(_DWORD *)(DerivedStorage + 432) = a1;
  long long v12 = (int *)(DerivedStorage + 692);
  *(_DWORD *)(DerivedStorage + 692) = v7;
  printCodecType(a1, v7);
  Connectioint n = createConnection(*(_DWORD *)(DerivedStorage + 444), (io_connect_t *)(DerivedStorage + 392), *(_DWORD *)(DerivedStorage + 692));
  if (Connection)
  {
    uint64_t v9 = Connection;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ProResDecoder_CreateInstance_cold_3();
    }
  }
  else
  {
    uint64_t v14 = *MEMORY[0x263F1E788];
    keys = (void *)*MEMORY[0x263F1E790];
    *(void *)&long long v35 = v14;
    uint64_t v15 = *MEMORY[0x263F1E748];
    *((void *)&v35 + 1) = *MEMORY[0x263F1E768];
    uint64_t v36 = v15;
    uint64_t v16 = *MEMORY[0x263F1E6F0];
    uint64_t v37 = *MEMORY[0x263F1E780];
    uint64_t v38 = v16;
    uint64_t v17 = *MEMORY[0x263F1E758];
    uint64_t v39 = *MEMORY[0x263F1E7B0];
    uint64_t v40 = v17;
    uint64_t v41 = *MEMORY[0x263F1E738];
    int v42 = @"ProResHW_CheckValue";
    uint64_t v47 = 0;
    uint64_t v48 = 0;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    *(_OWORD *)values = 0u;
    long long v27 = 0u;
    uint64_t v18 = *MEMORY[0x263F1E6F8];
    char v43 = @"ProResHW_TestSettings";
    uint64_t v44 = v18;
    uint64_t v45 = *MEMORY[0x263F1E730];
    uint64_t v46 = 0;
    CFDictionaryRef v19 = CFDictionaryCreate(v5, 0, 0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    if (v19)
    {
      CFDictionaryRef v20 = v19;
      for (uint64_t i = 0; i != 13; ++i)
        values[i] = v19;
      CFDictionaryRef v22 = CFDictionaryCreate(v5, (const void **)&keys, (const void **)values, 13, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      *(void *)(DerivedStorage + 416) = v22;
      if (!v22 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        ProResDecoder_CreateInstance_cold_2();
      }
      CFRelease(v20);
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      ProResDecoder_CreateInstance_cold_1();
    }
    uint64_t v9 = 0;
    *a3 = 0;
  }
  kdebug_trace();
  if (v9)
  {
    io_connect_t v23 = *(_DWORD *)(DerivedStorage + 392);
    if (v23) {
      closeUserClient(v23, *v12);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      int v24 = *v12;
      LODWORD(keys) = 67109634;
      HIDWORD(keys) = v24;
      LOWORD(v35) = 2080;
      *(void *)((char *)&v35 + 2) = "ProResDecoder_CreateInstance";
      WORD5(v35) = 1024;
      HIDWORD(v35) = v9;
      unsigned int v10 = &_os_log_internal;
      goto LABEL_35;
    }
  }
  return v9;
}

uint64_t ProResDecoder_SetTestCallback(uint64_t a1, long long *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (a2)
  {
    long long v4 = *a2;
    *(void *)(DerivedStorage + 584) = *((void *)a2 + 2);
    *(_OWORD *)(DerivedStorage + 568) = v4;
  }
  return 0;
}

void ProResDecoder_ParseMetadataExtension(int a1, unint64_t *a2, void *a3, int a4, int a5, int a6, int a7)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unsigned int __sz = a4 - 8;
  __src = a3;
  a2[1] = *a2;
  if (getMetadataExtensionPtr((unsigned __int8 **)&__src, &__sz))
  {
    std::vector<unsigned char>::reserve(a2, __sz);
    unsigned int v9 = __sz;
    while (v9 >= 8)
    {
      int64_t v10 = bswap32(*(_DWORD *)__src);
      if (v10 < 8 || v9 < v10)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          LODWORD(__sz_4) = 67109378;
          HIDWORD(__sz_4) = a7;
          __int16 v18 = 2080;
          CFDictionaryRef v19 = "ProResDecoder_ParseMetadataExtension";
          _os_log_impl(&dword_262BEC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AppleProResHW (0x%x): %s(): Corrupted metadata extension", (uint8_t *)&__sz_4, 0x12u);
        }
        break;
      }
      unsigned int v12 = *((_DWORD *)__src + 1);
      std::vector<unsigned char>::__insert_with_size[abi:ne180100]<unsigned char *,unsigned char *>((void **)a2, (unsigned char *)a2[1], __src, (unsigned char *)__src + v10, v10);
      __src = (char *)__src + v10;
      unsigned int v9 = __sz - v10;
      __sz -= v10;
      if (bswap32(v12) == 1701801316)
      {
        unint64_t v13 = *a2;
        if (a2[1] - *a2 == 8) {
          goto LABEL_15;
        }
        return;
      }
    }
  }
  unint64_t v13 = *a2;
LABEL_15:
  a2[1] = v13;
}

void std::vector<unsigned char>::reserve(unint64_t *a1, size_t __sz)
{
  unint64_t v2 = *a1;
  if (a1[2] - *a1 < __sz)
  {
    if ((__sz & 0x8000000000000000) != 0) {
      std::vector<std::pair<unsigned short,unsigned short>>::__throw_length_error[abi:ne180100]();
    }
    CFAllocatorRef v5 = (char *)a1[1];
    CFUUIDRef v6 = operator new(__sz);
    int v7 = &v5[(void)v6 - v2];
    int v8 = v7;
    if (v5 != (char *)v2)
    {
      unsigned int v9 = &v5[~v2];
      do
      {
        char v10 = *--v5;
        (v9--)[(void)v6] = v10;
      }
      while (v5 != (char *)v2);
      int v8 = v6;
    }
    *a1 = (unint64_t)v8;
    a1[1] = (unint64_t)v7;
    a1[2] = (unint64_t)&v6[__sz];
    if (v2)
    {
      operator delete((void *)v2);
    }
  }
}

CFNumberRef setBitstreamDepthFromFormatExtensions(const opaqueCMFormatDescription **a1, unsigned int *a2)
{
  CFNumberRef result = (const __CFNumber *)CMFormatDescriptionGetExtension(*a1, (CFStringRef)*MEMORY[0x263F00E58]);
  if (result)
  {
    return (const __CFNumber *)CFNumberGetValue(result, kCFNumberSInt32Type, a2);
  }
  else
  {
    *a2 = 24;
  }
  return result;
}

uint64_t ProResDecoder_Invalidate()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (DerivedStorage)
  {
    uint64_t v1 = DerivedStorage;
    unint64_t v2 = *(ProResFrameReceiver **)(DerivedStorage + 96);
    if (v2) {
      char HasHWError = ProResFrameReceiver::getHasHWError(v2);
    }
    else {
      char HasHWError = 0;
    }
    ProResDecoder_Finalize();
    if (!*(unsigned char *)(v1 + 592) && *(_DWORD *)(v1 + 496) && !*(unsigned char *)(v1 + 691))
    {
      CFAllocatorRef v5 = APR_ImgFmt_4CC(*(_DWORD *)(v1 + 436));
      getRtMpeStr(0, *(_DWORD *)(v1 + 684), *(unsigned __int8 *)(v1 + 688), &__p);
      int v6 = *(_DWORD *)(v1 + 472);
      int v7 = *(_DWORD *)(v1 + 476);
      int v8 = *(_DWORD *)(v1 + 432);
      int v9 = *(_DWORD *)(v1 + 436);
      int v10 = *((_DWORD *)v5 + 1);
      char v11 = *(unsigned char *)(v1 + 680);
      int v12 = *(_DWORD *)(v1 + 496);
      uint64_t v13 = *(unsigned int *)(v1 + 692);
      int v14 = *(unsigned __int8 *)(v1 + 690);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      {
        int v15 = *(_DWORD *)(v1 + 472);
        std::string::__init_copy_ctor_external(&v16, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
        int v6 = v15;
      }
      else
      {
        std::string v16 = __p;
      }
      reportDecodeSessionInfo(v6, v7, v8, v9, v10, v11, v12, v13, HasHWError, v14 != 0, (uint64_t)&v16);
      if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v16.__r_.__value_.__l.__data_);
      }
      *(unsigned char *)(v1 + 691) = 1;
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
    }
    return 0;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ProResDecoder_Invalidate();
    }
    return 4294954385;
  }
}

void sub_262BFE0F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ProResDecoder_Finalize()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  ProResDecoder_WaitForAsynchronousFrames();
  DestroyFrameInfoQueue(DerivedStorage + 104);
  if (*(void *)(DerivedStorage + 408))
  {
    CVDataBufferPoolFlush();
    CFRelease(*(CFTypeRef *)(DerivedStorage + 408));
    *(void *)(DerivedStorage + 408) = 0;
  }
  uint64_t v1 = *(const void **)(DerivedStorage + 416);
  if (v1)
  {
    CFRelease(v1);
    *(void *)(DerivedStorage + 416) = 0;
  }
  unint64_t v2 = *(const void **)(DerivedStorage + 424);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(DerivedStorage + 424) = 0;
  }
  if (*(void *)(DerivedStorage + 400))
  {
    FigFormatDescriptionRelease();
    *(void *)(DerivedStorage + 400) = 0;
  }
  uint64_t v3 = *(CFTypeRef **)(DerivedStorage + 96);
  if (v3)
  {
    DestroyProResFrameReceiver(v3, (pthread_attr_t *)(DerivedStorage + 16));
    *(void *)(DerivedStorage + 96) = 0;
  }
  io_connect_t v4 = *(_DWORD *)(DerivedStorage + 392);
  if (v4)
  {
    closeUserClient(v4, *(_DWORD *)(DerivedStorage + 692));
    *(_DWORD *)(DerivedStorage + 392) = 0;
  }
  pthread_cond_destroy((pthread_cond_t *)(DerivedStorage + 344));
  pthread_mutex_destroy((pthread_mutex_t *)(DerivedStorage + 280));
  pthread_cond_destroy((pthread_cond_t *)(DerivedStorage + 224));

  return pthread_mutex_destroy((pthread_mutex_t *)(DerivedStorage + 160));
}

__CFString *ProResDecoder_CopyDebugDescription(uint64_t a1)
{
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  CFStringAppendFormat(Mutable, 0, @"<AppleProResHWDecoder %p>", a1);
  return Mutable;
}

uint64_t ProResDecoder_CopyProperty(uint64_t a1, const void *a2, const __CFAllocator *a3, __CFArray **a4)
{
  uint64_t v173 = *MEMORY[0x263EF8340];
  if (!a1 || !a2 || !a4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ProResDecoder_CopyProperty();
    }
    return 4294954394;
  }
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!DerivedStorage)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ProResDecoder_CopyProperty();
    }
    return 4294954385;
  }
  uint64_t v8 = DerivedStorage;
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F1E790]))
  {
    int valuePtr = 0;
    CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
    if (Mutable)
    {
      int v10 = Mutable;
      int v11 = *(_DWORD *)(v8 + 432);
      if (v11 > 1634755431)
      {
        if ((v11 - 1634755432) <= 0xB && ((1 << (v11 - 104)) & 0x8C1) != 0)
        {
          int valuePtr = 1937125938;
          CFNumberRef v12 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v12);
          CFRelease(v12);
          int valuePtr = 645101106;
          CFNumberRef v13 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v13);
          CFRelease(v13);
          int valuePtr = 1953903154;
          CFNumberRef v14 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v14);
          CFRelease(v14);
          int valuePtr = 645166642;
          CFNumberRef v15 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v15);
          CFRelease(v15);
          int valuePtr = 2016686642;
          CFNumberRef v16 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v16);
          CFRelease(v16);
          int valuePtr = 645428786;
          CFNumberRef v17 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v17);
          CFRelease(v17);
          if (*(unsigned char *)(v8 + 556))
          {
            int valuePtr = 762869298;
            CFNumberRef v18 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
            CFArrayAppendValue(v10, v18);
            CFRelease(v18);
            int valuePtr = 796423730;
            CFNumberRef v19 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
            CFArrayAppendValue(v10, v19);
            CFRelease(v19);
          }
          int valuePtr = 875704950;
          CFNumberRef v20 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v20);
          CFRelease(v20);
          int v21 = 641234484;
LABEL_27:
          int v34 = v21 - 2;
LABEL_28:
          int valuePtr = v34;
LABEL_29:
          CFNumberRef v35 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v35);
LABEL_30:
          CFRelease(v35);
LABEL_31:
          uint64_t result = 0;
          *a4 = v10;
          return result;
        }
        if (v11 == 1634759272 || v11 == 1634759278)
        {
          if (!*(_DWORD *)(v8 + 520))
          {
            int valuePtr = 1647392369;
            CFNumberRef v120 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
            CFArrayAppendValue(v10, v120);
            CFRelease(v120);
            if (!*(unsigned char *)(v8 + 553)) {
              goto LABEL_31;
            }
            int valuePtr = 1651519798;
            CFNumberRef v121 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
            CFArrayAppendValue(v10, v121);
            CFRelease(v121);
            int v51 = 1650942776;
            int valuePtr = 1650946098;
            CFNumberRef v122 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
            CFArrayAppendValue(v10, v122);
            CFRelease(v122);
            int valuePtr = 1919381552;
            CFNumberRef v123 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
            CFArrayAppendValue(v10, v123);
            CFRelease(v123);
            int valuePtr = 1735553072;
            CFNumberRef v124 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
            CFArrayAppendValue(v10, v124);
            CFRelease(v124);
            int valuePtr = 1734504496;
            CFNumberRef v125 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
            CFArrayAppendValue(v10, v125);
            CFRelease(v125);
            int valuePtr = 1650946096;
            CFNumberRef v126 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
            CFArrayAppendValue(v10, v126);
            CFRelease(v126);
            int valuePtr = 1919378232;
            CFNumberRef v127 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
            CFArrayAppendValue(v10, v127);
            CFRelease(v127);
            int valuePtr = 1735549752;
            CFNumberRef v128 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
            CFArrayAppendValue(v10, v128);
            CFRelease(v128);
            int valuePtr = 1734501176;
            goto LABEL_108;
          }
LABEL_46:
          int v51 = 1651520304;
          int valuePtr = 1651521076;
LABEL_108:
          CFNumberRef v129 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v129);
          CFRelease(v129);
          int valuePtr = v51;
          goto LABEL_29;
        }
LABEL_79:
        CFRelease(Mutable);
        uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (result)
        {
          ProResDecoder_CopyProperty();
          return 0;
        }
        return result;
      }
      if (v11 <= 1634743399)
      {
        if (v11 == 1634742376)
        {
          int valuePtr = 1278226742;
          CFNumberRef v82 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v82);
          CFRelease(v82);
          int valuePtr = 642527542;
          CFNumberRef v83 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v83);
          CFRelease(v83);
          int valuePtr = 1278226738;
          CFNumberRef v84 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v84);
          CFRelease(v84);
          int valuePtr = 642527538;
          CFNumberRef v85 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v85);
          CFRelease(v85);
          int valuePtr = 1278226736;
          CFNumberRef v86 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v86);
          CFRelease(v86);
          int valuePtr = 642527536;
          CFNumberRef v87 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v87);
          CFRelease(v87);
          int valuePtr = 1278226488;
          CFNumberRef v88 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v88);
          CFRelease(v88);
          int valuePtr = 642527288;
          goto LABEL_29;
        }
        if (v11 == 1634742888)
        {
          int valuePtr = 1937125936;
          CFNumberRef v39 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v39);
          CFRelease(v39);
          int valuePtr = 645101104;
          CFNumberRef v40 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v40);
          CFRelease(v40);
          int valuePtr = 1953903152;
          CFNumberRef v41 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v41);
          CFRelease(v41);
          int valuePtr = 645166640;
          CFNumberRef v42 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v42);
          CFRelease(v42);
          int valuePtr = 2016686640;
          CFNumberRef v43 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v43);
          CFRelease(v43);
          int valuePtr = 645428784;
          CFNumberRef v44 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v44);
          CFRelease(v44);
          if (*(unsigned char *)(v8 + 556))
          {
            int valuePtr = 762869296;
            CFNumberRef v45 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
            CFArrayAppendValue(v10, v45);
            CFRelease(v45);
            int valuePtr = 796423728;
            CFNumberRef v46 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
            CFArrayAppendValue(v10, v46);
            CFRelease(v46);
          }
          int valuePtr = 875704438;
          CFNumberRef v47 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v47);
          CFRelease(v47);
          int valuePtr = 641234480;
          CFNumberRef v48 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v48);
          CFRelease(v48);
          if (!*(unsigned char *)(v8 + 556)) {
            goto LABEL_31;
          }
          int valuePtr = 758674992;
          CFNumberRef v49 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v49);
          CFRelease(v49);
          int v34 = 2084075056;
          goto LABEL_28;
        }
        goto LABEL_79;
      }
      if (v11 != 1634743400 && v11 != 1634743416) {
        goto LABEL_79;
      }
      if (*(_DWORD *)(v8 + 452) != 32)
      {
        int valuePtr = 1937126452;
        CFNumberRef v89 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
        CFArrayAppendValue(v10, v89);
        CFRelease(v89);
        int valuePtr = 645101108;
        CFNumberRef v90 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
        CFArrayAppendValue(v10, v90);
        CFRelease(v90);
        int valuePtr = 1953903668;
        CFNumberRef v91 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
        CFArrayAppendValue(v10, v91);
        CFRelease(v91);
        int valuePtr = 645166644;
        CFNumberRef v92 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
        CFArrayAppendValue(v10, v92);
        CFRelease(v92);
        int valuePtr = 2016687156;
        CFNumberRef v93 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
        CFArrayAppendValue(v10, v93);
        CFRelease(v93);
        int valuePtr = 645428788;
        CFNumberRef v94 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
        CFArrayAppendValue(v10, v94);
        CFRelease(v94);
        int valuePtr = 875836534;
        CFNumberRef v95 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
        CFArrayAppendValue(v10, v95);
        CFRelease(v95);
        int valuePtr = 641234484;
        CFNumberRef v96 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
        CFArrayAppendValue(v10, v96);
        CFRelease(v96);
        int valuePtr = 1932812659;
        CFNumberRef v97 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
        CFArrayAppendValue(v10, v97);
        CFRelease(v97);
        if (*(unsigned char *)(v8 + 592))
        {
          int valuePtr = 645084275;
          CFNumberRef v98 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v98);
          CFRelease(v98);
        }
        int valuePtr = 1949589875;
        CFNumberRef v99 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
        CFArrayAppendValue(v10, v99);
        CFRelease(v99);
        if (*(unsigned char *)(v8 + 592))
        {
          int valuePtr = 645149811;
          CFNumberRef v100 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v100);
          CFRelease(v100);
        }
        int valuePtr = 2016698739;
        CFNumberRef v101 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
        CFArrayAppendValue(v10, v101);
        CFRelease(v101);
        if (*(unsigned char *)(v8 + 592))
        {
          int valuePtr = 645411955;
          CFNumberRef v102 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v102);
          CFRelease(v102);
        }
        int valuePtr = 1983144248;
        CFNumberRef v103 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
        CFArrayAppendValue(v10, v103);
        CFRelease(v103);
        if (!*(unsigned char *)(v8 + 592)) {
          goto LABEL_31;
        }
        int v34 = 645280824;
        goto LABEL_28;
      }
      int valuePtr = 1932812659;
      CFNumberRef v53 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
      CFArrayAppendValue(v10, v53);
      CFRelease(v53);
      if (*(unsigned char *)(v8 + 592))
      {
        int valuePtr = 645084275;
        CFNumberRef v54 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
        CFArrayAppendValue(v10, v54);
        CFRelease(v54);
      }
      int valuePtr = 1949589875;
      CFNumberRef v55 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
      CFArrayAppendValue(v10, v55);
      CFRelease(v55);
      if (*(unsigned char *)(v8 + 592))
      {
        int valuePtr = 645149811;
        CFNumberRef v56 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
        CFArrayAppendValue(v10, v56);
        CFRelease(v56);
      }
      int valuePtr = 2016698739;
      CFNumberRef v57 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
      CFArrayAppendValue(v10, v57);
      CFRelease(v57);
      int v58 = 641234484;
      if (*(unsigned char *)(v8 + 592))
      {
        int valuePtr = 645411955;
        CFNumberRef v59 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
        CFArrayAppendValue(v10, v59);
        CFRelease(v59);
      }
      int valuePtr = 1983144248;
      CFNumberRef v60 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
      CFArrayAppendValue(v10, v60);
      CFRelease(v60);
      if (*(unsigned char *)(v8 + 592))
      {
        int valuePtr = 645280824;
        CFNumberRef v61 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
        CFArrayAppendValue(v10, v61);
        CFRelease(v61);
      }
      int valuePtr = 1937126452;
      CFNumberRef v62 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
      CFArrayAppendValue(v10, v62);
      CFRelease(v62);
      int valuePtr = 645101108;
      CFNumberRef v63 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
      CFArrayAppendValue(v10, v63);
      CFRelease(v63);
      int valuePtr = 1953903668;
      CFNumberRef v64 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
      CFArrayAppendValue(v10, v64);
      CFRelease(v64);
      int valuePtr = 645166644;
      CFNumberRef v65 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
      CFArrayAppendValue(v10, v65);
      CFRelease(v65);
      int valuePtr = 2016687156;
      CFNumberRef v66 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
      CFArrayAppendValue(v10, v66);
      CFRelease(v66);
      int valuePtr = 645428788;
      CFNumberRef v67 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
      CFArrayAppendValue(v10, v67);
      CFRelease(v67);
      int v68 = 875836534;
LABEL_105:
      int valuePtr = v68;
      CFNumberRef v119 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
      CFArrayAppendValue(v10, v119);
      CFRelease(v119);
      int valuePtr = v58;
      goto LABEL_29;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      int v36 = *(_DWORD *)(v8 + 692);
      *(_DWORD *)buf = 67109378;
      int v170 = v36;
      __int16 v171 = 2080;
      unsigned int v172 = "ProResDecoder_CopyProperty";
      uint64_t v37 = &_os_log_internal;
      uint64_t v38 = "AppleProResHW (0x%x): %s(): CFArrayCreateMutable failed!";
LABEL_49:
      _os_log_impl(&dword_262BEC000, v37, OS_LOG_TYPE_ERROR, v38, buf, 0x12u);
    }
    return 4294954392;
  }
  if (!CFEqual(a2, (CFTypeRef)*MEMORY[0x263F1E788]))
  {
    if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F1E768]))
    {
      int v10 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      CFNumberRef v50 = CFNumberCreate(0, kCFNumberSInt32Type, (const void *)(v8 + 528));
      CFDictionaryAddValue(v10, (const void *)*MEMORY[0x263F1E810], v50);
      CFRelease(v50);
      CFNumberRef v35 = CFNumberCreate(0, kCFNumberSInt32Type, (const void *)(v8 + 536));
      CFDictionaryAddValue(v10, (const void *)*MEMORY[0x263F1E808], v35);
      goto LABEL_30;
    }
    if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F1E748]))
    {
      int valuePtr = 0;
      CFMutableArrayRef v80 = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
      if (v80)
      {
        int v10 = v80;
        int v81 = *(_DWORD *)(v8 + 432);
        if (v81 <= 1634755431)
        {
          if (v81 > 1634743399)
          {
            if (v81 == 1634743400 || v81 == 1634743416)
            {
              int v34 = 875836534;
              goto LABEL_28;
            }
          }
          else
          {
            if (v81 == 1634742376)
            {
              int v34 = 1278226488;
              goto LABEL_28;
            }
            if (v81 == 1634742888)
            {
              int v34 = 875704438;
              goto LABEL_28;
            }
          }
        }
        else
        {
          if ((v81 - 1634755432) <= 0xB && ((1 << (v81 - 104)) & 0x8C1) != 0)
          {
            int v34 = 875704950;
            goto LABEL_28;
          }
          if (v81 == 1634759272 || v81 == 1634759278) {
            goto LABEL_46;
          }
        }
        CFRelease(v80);
        uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (result)
        {
          ProResDecoder_CopyProperty();
          return 0;
        }
        return result;
      }
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        return 4294954392;
      }
LABEL_48:
      int v52 = *(_DWORD *)(v8 + 692);
      *(_DWORD *)buf = 67109378;
      int v170 = v52;
      __int16 v171 = 2080;
      unsigned int v172 = "ProResDecoder_CopyProperty";
      uint64_t v37 = &_os_log_internal;
      uint64_t v38 = "AppleProResHW (0x%x): %s():  CFArrayCreateMutable failed!";
      goto LABEL_49;
    }
    if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F1E780]))
    {
      CFRetain(*(CFTypeRef *)(v8 + 424));
      uint64_t result = 0;
      CFNumberRef v130 = *(CFNumberRef *)(v8 + 424);
LABEL_155:
      *a4 = v130;
      return result;
    }
    if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F1E6F0]))
    {
      uint64_t result = 0;
      uint64_t v163 = (CFNumberRef *)MEMORY[0x263EFFB38];
LABEL_154:
      CFNumberRef v130 = *v163;
      goto LABEL_155;
    }
    if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F1E7B0]))
    {
LABEL_141:
      uint64_t result = 0;
      uint64_t v163 = (CFNumberRef *)MEMORY[0x263EFFB40];
      goto LABEL_154;
    }
    if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F1E758]))
    {
      uint64_t result = 0;
      if (*(_DWORD *)(v8 + 684)) {
        uint64_t v163 = (CFNumberRef *)MEMORY[0x263EFFB40];
      }
      else {
        uint64_t v163 = (CFNumberRef *)MEMORY[0x263EFFB38];
      }
      goto LABEL_154;
    }
    if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F1E738]))
    {
      uint64_t result = 0;
      int v164 = *(unsigned __int8 *)(v8 + 688);
LABEL_151:
      if (v164) {
        uint64_t v163 = (CFNumberRef *)MEMORY[0x263EFFB40];
      }
      else {
        uint64_t v163 = (CFNumberRef *)MEMORY[0x263EFFB38];
      }
      goto LABEL_154;
    }
    if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F1E6F8])) {
      goto LABEL_141;
    }
    if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F1E730]))
    {
      *(_DWORD *)buf = 53;
      unint64_t v165 = buf;
      CFAllocatorRef v166 = a3;
      CFNumberType v167 = kCFNumberSInt32Type;
    }
    else
    {
      if (!CFEqual(a2, @"ProResHW_CheckValue"))
      {
        if (!CFEqual(a2, @"ProResHW_TestSettings")) {
          return 4294954396;
        }
        uint64_t result = 0;
        int v164 = *(unsigned __int8 *)(v8 + 592);
        goto LABEL_151;
      }
      unint64_t v165 = (uint8_t *)(v8 + 512);
      CFAllocatorRef v166 = a3;
      CFNumberType v167 = kCFNumberSInt64Type;
    }
    CFNumberRef v130 = CFNumberCreate(v166, v167, v165);
    uint64_t result = 0;
    goto LABEL_155;
  }
  int valuePtr = 0;
  CFMutableArrayRef v23 = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
  if (!v23)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      return 4294954392;
    }
    goto LABEL_48;
  }
  int v10 = v23;
  int v24 = *(_DWORD *)(v8 + 432);
  if (v24 <= 1634755431)
  {
    if (v24 > 1634743399)
    {
      if (v24 == 1634743400 || v24 == 1634743416)
      {
        if (*(_DWORD *)(v8 + 452) != 32)
        {
          int valuePtr = 875836534;
          CFNumberRef v138 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v138);
          CFRelease(v138);
          int valuePtr = 641234484;
          CFNumberRef v139 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v139);
          CFRelease(v139);
          int valuePtr = 2016687156;
          CFNumberRef v140 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v140);
          CFRelease(v140);
          int valuePtr = 645428788;
          CFNumberRef v141 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v141);
          CFRelease(v141);
          int valuePtr = 1953903668;
          CFNumberRef v142 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v142);
          CFRelease(v142);
          int valuePtr = 645166644;
          CFNumberRef v143 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v143);
          CFRelease(v143);
          int valuePtr = 1937126452;
          CFNumberRef v144 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v144);
          CFRelease(v144);
          int valuePtr = 645101108;
          CFNumberRef v145 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v145);
          CFRelease(v145);
          int valuePtr = 1983144248;
          CFNumberRef v146 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v146);
          CFRelease(v146);
          if (*(unsigned char *)(v8 + 592))
          {
            int valuePtr = 645280824;
            CFNumberRef v147 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
            CFArrayAppendValue(v10, v147);
            CFRelease(v147);
          }
          int valuePtr = 2016698739;
          CFNumberRef v148 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v148);
          CFRelease(v148);
          if (*(unsigned char *)(v8 + 592))
          {
            int valuePtr = 645411955;
            CFNumberRef v149 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
            CFArrayAppendValue(v10, v149);
            CFRelease(v149);
          }
          int valuePtr = 1949589875;
          CFNumberRef v150 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v150);
          CFRelease(v150);
          if (*(unsigned char *)(v8 + 592))
          {
            int valuePtr = 645149811;
            CFNumberRef v151 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
            CFArrayAppendValue(v10, v151);
            CFRelease(v151);
          }
          int valuePtr = 1932812659;
          CFNumberRef v152 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v152);
          CFRelease(v152);
          if (!*(unsigned char *)(v8 + 592)) {
            goto LABEL_31;
          }
          int v34 = 645084275;
          goto LABEL_28;
        }
        int valuePtr = 1983144248;
        CFNumberRef v105 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
        CFArrayAppendValue(v10, v105);
        CFRelease(v105);
        if (*(unsigned char *)(v8 + 592))
        {
          int valuePtr = 645280824;
          CFNumberRef v106 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v106);
          CFRelease(v106);
        }
        int valuePtr = 2016698739;
        CFNumberRef v107 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
        CFArrayAppendValue(v10, v107);
        CFRelease(v107);
        if (*(unsigned char *)(v8 + 592))
        {
          int valuePtr = 645411955;
          CFNumberRef v108 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v108);
          CFRelease(v108);
        }
        int valuePtr = 1949589875;
        CFNumberRef v109 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
        CFArrayAppendValue(v10, v109);
        CFRelease(v109);
        int v58 = 645101108;
        if (*(unsigned char *)(v8 + 592))
        {
          int valuePtr = 645149811;
          CFNumberRef v110 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v110);
          CFRelease(v110);
        }
        int valuePtr = 1932812659;
        CFNumberRef v111 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
        CFArrayAppendValue(v10, v111);
        CFRelease(v111);
        if (*(unsigned char *)(v8 + 592))
        {
          int valuePtr = 645084275;
          CFNumberRef v112 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v112);
          CFRelease(v112);
        }
        int valuePtr = 875836534;
        CFNumberRef v113 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
        CFArrayAppendValue(v10, v113);
        CFRelease(v113);
        int valuePtr = 641234484;
        CFNumberRef v114 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
        CFArrayAppendValue(v10, v114);
        CFRelease(v114);
        int valuePtr = 2016687156;
        CFNumberRef v115 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
        CFArrayAppendValue(v10, v115);
        CFRelease(v115);
        int valuePtr = 645428788;
        CFNumberRef v116 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
        CFArrayAppendValue(v10, v116);
        CFRelease(v116);
        int valuePtr = 1953903668;
        CFNumberRef v117 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
        CFArrayAppendValue(v10, v117);
        CFRelease(v117);
        int valuePtr = 645166644;
        CFNumberRef v118 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
        CFArrayAppendValue(v10, v118);
        CFRelease(v118);
        int v68 = 1937126452;
        goto LABEL_105;
      }
    }
    else
    {
      if (v24 == 1634742376)
      {
        int valuePtr = 1278226488;
        CFNumberRef v131 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
        CFArrayAppendValue(v10, v131);
        CFRelease(v131);
        int valuePtr = 642527288;
        CFNumberRef v132 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
        CFArrayAppendValue(v10, v132);
        CFRelease(v132);
        int valuePtr = 1278226736;
        CFNumberRef v133 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
        CFArrayAppendValue(v10, v133);
        CFRelease(v133);
        int valuePtr = 642527536;
        CFNumberRef v134 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
        CFArrayAppendValue(v10, v134);
        CFRelease(v134);
        int valuePtr = 1278226738;
        CFNumberRef v135 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
        CFArrayAppendValue(v10, v135);
        CFRelease(v135);
        int valuePtr = 642527538;
        CFNumberRef v136 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
        CFArrayAppendValue(v10, v136);
        CFRelease(v136);
        int valuePtr = 1278226742;
        CFNumberRef v137 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
        CFArrayAppendValue(v10, v137);
        CFRelease(v137);
        int v34 = 642527542;
        goto LABEL_28;
      }
      if (v24 == 1634742888)
      {
        if (*(unsigned char *)(v8 + 556))
        {
          int valuePtr = 2084075056;
          CFNumberRef v69 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v69);
          CFRelease(v69);
          int valuePtr = 758674992;
          CFNumberRef v70 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v70);
          CFRelease(v70);
        }
        int valuePtr = 875704438;
        CFNumberRef v71 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
        CFArrayAppendValue(v10, v71);
        CFRelease(v71);
        int valuePtr = 641234480;
        CFNumberRef v72 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
        CFArrayAppendValue(v10, v72);
        CFRelease(v72);
        if (*(unsigned char *)(v8 + 556))
        {
          int valuePtr = 796423728;
          CFNumberRef v73 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v73);
          CFRelease(v73);
          int valuePtr = 762869296;
          CFNumberRef v74 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v74);
          CFRelease(v74);
        }
        int valuePtr = 2016686640;
        CFNumberRef v75 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
        CFArrayAppendValue(v10, v75);
        CFRelease(v75);
        int valuePtr = 645428784;
        CFNumberRef v76 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
        CFArrayAppendValue(v10, v76);
        CFRelease(v76);
        int valuePtr = 1953903152;
        CFNumberRef v77 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
        CFArrayAppendValue(v10, v77);
        CFRelease(v77);
        int valuePtr = 645166640;
        CFNumberRef v78 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
        CFArrayAppendValue(v10, v78);
        CFRelease(v78);
        int valuePtr = 1937125936;
        CFNumberRef v79 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
        CFArrayAppendValue(v10, v79);
        CFRelease(v79);
        int v34 = 645101104;
        goto LABEL_28;
      }
    }
  }
  else
  {
    if ((v24 - 1634755432) <= 0xB && ((1 << (v24 - 104)) & 0x8C1) != 0)
    {
      int valuePtr = 875704950;
      CFNumberRef v25 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
      CFArrayAppendValue(v10, v25);
      CFRelease(v25);
      int valuePtr = 641234482;
      CFNumberRef v26 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
      CFArrayAppendValue(v10, v26);
      CFRelease(v26);
      if (*(unsigned char *)(v8 + 556))
      {
        int valuePtr = 796423730;
        CFNumberRef v27 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
        CFArrayAppendValue(v10, v27);
        CFRelease(v27);
        int valuePtr = 762869298;
        CFNumberRef v28 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
        CFArrayAppendValue(v10, v28);
        CFRelease(v28);
      }
      int valuePtr = 2016686642;
      CFNumberRef v29 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
      CFArrayAppendValue(v10, v29);
      CFRelease(v29);
      int valuePtr = 645428786;
      CFNumberRef v30 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
      CFArrayAppendValue(v10, v30);
      CFRelease(v30);
      int valuePtr = 1953903154;
      CFNumberRef v31 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
      CFArrayAppendValue(v10, v31);
      CFRelease(v31);
      int valuePtr = 645166642;
      CFNumberRef v32 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
      CFArrayAppendValue(v10, v32);
      CFRelease(v32);
      int valuePtr = 1937125938;
      CFNumberRef v33 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
      CFArrayAppendValue(v10, v33);
      CFRelease(v33);
      int v21 = 645101108;
      goto LABEL_27;
    }
    if (v24 == 1634759272 || v24 == 1634759278)
    {
      if (*(_DWORD *)(v8 + 520))
      {
        int valuePtr = 1651520304;
        CFNumberRef v104 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
        CFArrayAppendValue(v10, v104);
        CFRelease(v104);
        int v34 = 1651521076;
      }
      else
      {
        if (*(unsigned char *)(v8 + 553))
        {
          int valuePtr = 1919378232;
          CFNumberRef v153 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v153);
          CFRelease(v153);
          int valuePtr = 1735549752;
          CFNumberRef v154 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v154);
          CFRelease(v154);
          int valuePtr = 1734501176;
          CFNumberRef v155 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v155);
          CFRelease(v155);
          int valuePtr = 1650942776;
          CFNumberRef v156 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v156);
          CFRelease(v156);
          int valuePtr = 1919381552;
          CFNumberRef v157 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v157);
          CFRelease(v157);
          int valuePtr = 1735553072;
          CFNumberRef v158 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v158);
          CFRelease(v158);
          int valuePtr = 1734504496;
          CFNumberRef v159 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v159);
          CFRelease(v159);
          int valuePtr = 1650946096;
          CFNumberRef v160 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v160);
          CFRelease(v160);
          int valuePtr = 1650946098;
          CFNumberRef v161 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v161);
          CFRelease(v161);
          int valuePtr = 1651519798;
          CFNumberRef v162 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          CFArrayAppendValue(v10, v162);
          CFRelease(v162);
        }
        int v34 = 1647392369;
      }
      goto LABEL_28;
    }
  }
  CFRelease(v23);
  uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
  if (result)
  {
    ProResDecoder_CopyProperty();
    return 0;
  }
  return result;
}

uint64_t ProResDecoder_SetProperty(uint64_t a1, const __CFString *a2, uint64_t a3)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  CFTypeRef cf = 0;
  if (a1 && a2)
  {
    uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
    if (DerivedStorage)
    {
      uint64_t v6 = DerivedStorage;
      CFStringGetCString(a2, buffer, 100, 0);
      if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F1E768]))
      {
        uint64_t valuePtr = 0;
        if (a3)
        {
          CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)a3, (const void *)*MEMORY[0x263F1E810]);
          CFNumberGetValue(Value, kCFNumberSInt32Type, (char *)&valuePtr + 4);
          CFNumberRef v8 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)a3, (const void *)*MEMORY[0x263F1E808]);
          CFNumberGetValue(v8, kCFNumberSInt32Type, &valuePtr);
          uint64_t v9 = HIDWORD(valuePtr);
          if (!HIDWORD(valuePtr) || (uint64_t v10 = valuePtr, !valuePtr))
          {
            a3 = 3758097090;
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              ProResDecoder_SetProperty();
            }
            goto LABEL_75;
          }
          unint64_t v11 = *(int *)(v6 + 472) / (unint64_t)HIDWORD(valuePtr);
          if (v11 != *(int *)(v6 + 476) / (unint64_t)valuePtr)
          {
            a3 = 3758097090;
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              ProResDecoder_SetProperty();
            }
            goto LABEL_75;
          }
          if (v11 == 2)
          {
            int v12 = 1;
          }
          else
          {
            if (v11 != 4 && v11 != 8)
            {
              a3 = 3758097090;
              if (g_LogLevel <= 0xFu && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
              {
                int v21 = *(_DWORD *)(v6 + 692);
                *(_DWORD *)buf = 67109890;
                *(_DWORD *)&uint8_t buf[4] = v21;
                __int16 v28 = 1024;
                int v29 = 3365;
                __int16 v30 = 2080;
                CFNumberRef v31 = "ProResDecoder_SetProperty";
                __int16 v32 = 2048;
                unint64_t v33 = v11;
                _os_log_impl(&dword_262BEC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "AppleProResHW (0x%x): %d: %s(): Warning: scaleFactor_x %zu is not 2/4/8!\n", buf, 0x22u);
              }
              goto LABEL_75;
            }
            if (v11 == 4) {
              int v12 = 2;
            }
            else {
              int v12 = 3;
            }
          }
          *(_DWORD *)(v6 + 520) = v12;
        }
        else
        {
          uint64_t v9 = *(unsigned int *)(v6 + 472);
          uint64_t v10 = *(unsigned int *)(v6 + 476);
          LODWORD(valuePtr) = *(_DWORD *)(v6 + 476);
          HIDWORD(valuePtr) = v9;
          *(_DWORD *)(v6 + 520) = 0;
        }
        *(void *)(v6 + 528) = v9;
        *(void *)(v6 + 536) = v10;
        if (*(void *)v6 == 1) {
          goto LABEL_74;
        }
        uint64_t v16 = ((v9 + 15) & 0xFFFFFFF0) - v9;
        uint64_t v17 = ((v10 + 15) & 0xFFFFFFF0) - v10;
        int v18 = *(_DWORD *)(v6 + 444);
        if (v18)
        {
          if (v18 != 1)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              ProResDecoder_SetProperty();
            }
            a3 = 4294954394;
            goto LABEL_75;
          }
          createPixelBufferAttributesDictionary((__CFDictionary **)&cf, v9, v10, v16, v17, 1380013906, 1, 0, *(unsigned char *)(v6 + 592), (unsigned char *)(v6 + 552));
          goto LABEL_73;
        }
        int v19 = *(_DWORD *)(v6 + 432);
        if (v19 <= 1634743415)
        {
          if (v19 == 1634742376)
          {
            createPixelBufferAttributesDictionary((__CFDictionary **)&cf, v9, v10, v16, v17, 875573280, 0, 0, *(unsigned char *)(v6 + 592), (unsigned char *)(v6 + 552));
            goto LABEL_73;
          }
          if (v19 == 1634742888)
          {
            createPixelBufferAttributesDictionary((__CFDictionary **)&cf, v9, v10, v16, v17, 875704352, 0, 0, *(unsigned char *)(v6 + 592), (unsigned char *)(v6 + 552));
            goto LABEL_73;
          }
          unsigned __int16 v20 = 13416;
        }
        else
        {
          if ((v19 - 1634755432) <= 0xB && ((1 << (v19 - 104)) & 0x8C1) != 0)
          {
            createPixelBufferAttributesDictionary((__CFDictionary **)&cf, v9, v10, v16, v17, 875704864, 0, 0, *(unsigned char *)(v6 + 592), (unsigned char *)(v6 + 552));
LABEL_73:
            VTDecoderSessionSetPixelBufferAttributes();
LABEL_74:
            a3 = 0;
LABEL_75:
            if (cf) {
              CFRelease(cf);
            }
            return a3;
          }
          if (v19 == 1634759276)
          {
            createPixelBufferAttributesDictionary((__CFDictionary **)&cf, v9, v10, v16, v17, 1634759276, 0, 0, *(unsigned char *)(v6 + 592), (unsigned char *)(v6 + 552));
            goto LABEL_73;
          }
          unsigned __int16 v20 = 13432;
        }
        if (v19 != (v20 | 0x61700000))
        {
          a3 = 3758097084;
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            ProResDecoder_SetProperty();
          }
          goto LABEL_75;
        }
        createPixelBufferAttributesDictionary((__CFDictionary **)&cf, v9, v10, v16, v17, 875836448, 0, 0, *(unsigned char *)(v6 + 592), (unsigned char *)(v6 + 552));
        goto LABEL_73;
      }
      if (CFEqual(a2, @"ProResHW_CheckValue"))
      {
        if (a3)
        {
          *(void *)buf = 0;
          CFNumberGetValue((CFNumberRef)a3, kCFNumberSInt64Type, buf);
          a3 = 0;
          *(void *)(v6 + 512) = *(void *)buf;
        }
        else
        {
          *(void *)(v6 + 512) = 0;
        }
      }
      else if (CFEqual(a2, @"ProResHW_TestSettings"))
      {
        if (a3)
        {
          int v13 = CFEqual((CFTypeRef)a3, (CFTypeRef)*MEMORY[0x263EFFB40]);
          a3 = 0;
          *(unsigned char *)(v6 + 592) = v13 != 0;
        }
        else
        {
          *(unsigned char *)(v6 + 592) = 0;
        }
      }
      else if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F1E758]))
      {
        if (a3)
        {
          int v14 = CFEqual((CFTypeRef)a3, (CFTypeRef)*MEMORY[0x263EFFB40]);
          a3 = 0;
          BOOL v15 = v14 != 0;
        }
        else
        {
          BOOL v15 = 1;
        }
        *(_DWORD *)(v6 + 684) = v15;
      }
      else if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F1E738]))
      {
        if (a3)
        {
          int v22 = CFEqual((CFTypeRef)a3, (CFTypeRef)*MEMORY[0x263EFFB40]);
          a3 = 0;
          *(unsigned char *)(v6 + 688) = v22 != 0;
        }
        else
        {
          *(unsigned char *)(v6 + 688) = 0;
        }
      }
      else
      {
        CFDictionaryRef v23 = *(const __CFDictionary **)(v6 + 416);
        if (v23 && CFDictionaryContainsKey(v23, a2)) {
          return 4294954395;
        }
        else {
          return 4294954396;
        }
      }
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        ProResDecoder_SetProperty();
      }
      return 4294954385;
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ProResDecoder_SetProperty();
    }
    return 4294954394;
  }
  return a3;
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  CFAllocatorRef v5 = this;
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
    CFNumberRef v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    CFAllocatorRef v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }

  memmove(v5, __s, __sz + 1);
}

void ProResDecoder_WaitForAsynchronousFrames()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (DerivedStorage)
  {
    uint64_t v1 = DerivedStorage;
    unint64_t v2 = (pthread_mutex_t *)(DerivedStorage + 160);
    pthread_mutex_lock((pthread_mutex_t *)(DerivedStorage + 160));
    gettimeofday(&v10, 0);
    uint64_t v3 = 1200;
    if (*(unsigned char *)(v1 + 592))
    {
      unsigned int v4 = atomic_load((unsigned int *)(v1 + 152));
      uint64_t v3 = 1200 * v4;
    }
    v11.tv_sec = v3 + v10.tv_sec;
    v11.tv_nsec = 1000 * v10.tv_usec;
    if (atomic_load((unsigned int *)(v1 + 152)))
    {
      do
      {
        int v6 = pthread_cond_timedwait((pthread_cond_t *)(v1 + 224), v2, &v11);
        if (atomic_load((unsigned int *)(v1 + 152))) {
          BOOL v8 = v6 == 0;
        }
        else {
          BOOL v8 = 0;
        }
      }
      while (v8);
      int v9 = v6;
      pthread_mutex_unlock(v2);
      if (v9)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          ProResDecoder_WaitForAsynchronousFrames();
        }
      }
    }
    else
    {
      pthread_mutex_unlock(v2);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    ProResDecoder_WaitForAsynchronousFrames();
  }
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): AppleProResHW Could not get private storage\n", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): AppleProResHW Could not wait on frame pending\n", v1, v2, v3, v4, 2u);
}

uint64_t ProResDecoder_StartSession(uint64_t a1, uint64_t a2, const opaqueCMFormatDescription *a3)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  size_t outputStructCnt = 13;
  CFTypeRef cf = 0;
  if (!a1 || !a2 || !a3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ProResDecoder_StartSession();
    }
    uint64_t v12 = 4294954394;
    goto LABEL_19;
  }
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  int v27 = *(_DWORD *)(DerivedStorage + 692);
  kdebug_trace();
  pthread_mutex_init((pthread_mutex_t *)(DerivedStorage + 280), 0);
  pthread_cond_init((pthread_cond_t *)(DerivedStorage + 344), 0);
  *(unsigned char *)(DerivedStorage + 272) = 1;
  pthread_mutex_init((pthread_mutex_t *)(DerivedStorage + 160), 0);
  pthread_cond_init((pthread_cond_t *)(DerivedStorage + 224), 0);
  atomic_store(0, (unsigned int *)(DerivedStorage + 152));
  *(void *)uint64_t DerivedStorage = a2;
  if (*(_DWORD *)(DerivedStorage + 432) != CMFormatDescriptionGetMediaSubType(a3))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ProResDecoder_StartSession();
    }
    uint64_t v12 = 4294954578;
    goto LABEL_19;
  }
  FigFormatDescriptionRelease();
  *(void *)(DerivedStorage + 400) = FigFormatDescriptionRetain();
  *(void *)(DerivedStorage + 500) = 0x400000000008;
  unint64_t Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(a3);
  int32_t v7 = Dimensions;
  unint64_t v8 = HIDWORD(Dimensions);
  if (*(_DWORD *)(DerivedStorage + 444) == 1) {
    unsigned int v9 = 16;
  }
  else {
    unsigned int v9 = 8;
  }
  unsigned int NumSlices = getNumSlices(Dimensions, SHIDWORD(Dimensions), v9);
  unsigned int v11 = NumSlices;
  if (NumSlices < 9 || NumSlices > *(_DWORD *)(DerivedStorage + 500) << 15)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      int v15 = *(_DWORD *)(DerivedStorage + 500) << 15;
      *(_DWORD *)buf = 67110914;
      int v33 = v27;
      uint64_t v34 = 0x820000004A10400;
      uint64_t v35 = "ProResDecoder_StartSession";
      __int16 v36 = 1024;
      int32_t v37 = v7;
      __int16 v38 = 1024;
      LODWORD(v39) = v8;
      WORD2(v39) = 1024;
      *(_DWORD *)((char *)&v39 + 6) = v11;
      WORD5(v39) = 1024;
      HIDWORD(v39) = 9;
      LOWORD(v40) = 1024;
      *(_DWORD *)((char *)&v40 + 2) = v15;
      _os_log_error_impl(&dword_262BEC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "ERROR AppleProResHW (0x%x): %d: %s(): %d x %d results in maxSlices %d Under %d or Over %d\n", buf, 0x36u);
    }
    uint64_t v12 = 4294954386;
    goto LABEL_19;
  }
  if ((v7 - 65537) <= 0xFFFF000E)
  {
    uint64_t v12 = 3758097084;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ProResDecoder_StartSession();
    }
    goto LABEL_19;
  }
  if ((v8 - 65537) <= 0xFFFF000E)
  {
    uint64_t v12 = 3758097084;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ProResDecoder_StartSession();
    }
    goto LABEL_19;
  }
  unsigned int v14 = v8 * v7;
  if ((int)v8 * v7 >= 268435457)
  {
    uint64_t v12 = 3758097084;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ProResDecoder_StartSession();
    }
    goto LABEL_19;
  }
  *(_DWORD *)(DerivedStorage + 472) = v7;
  *(_DWORD *)(DerivedStorage + 476) = v8;
  *(_DWORD *)(DerivedStorage + 488) = ((v7 + 15) & 0xFFFFFFF0) - v7;
  *(_DWORD *)(DerivedStorage + 492) = ((v8 + 15) & 0xFFFFFFF0) - v8;
  *(_DWORD *)(DerivedStorage + 520) = 0;
  setBitstreamDepthFromFormatExtensions((const opaqueCMFormatDescription **)(DerivedStorage + 400), (unsigned int *)(DerivedStorage + 452));
  if (*(unsigned char *)(DerivedStorage + 688)) {
    BOOL v16 = 0;
  }
  else {
    BOOL v16 = v14 >> 10 >= 0x7E9;
  }
  if (v16) {
    int v17 = 3;
  }
  else {
    int v17 = 1;
  }
  *(_DWORD *)(DerivedStorage + 468) = v17;
  inputStruct[0] = *(_DWORD *)(DerivedStorage + 444);
  inputStruct[1] = v17;
  inputStruct[3] = *(_DWORD *)(DerivedStorage + 692);
  if (IOConnectCallStructMethod(*(_DWORD *)(DerivedStorage + 392), 0, inputStruct, 0x10uLL, outputStruct, &outputStructCnt))
  {
    uint64_t v12 = 3758097084;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ProResDecoder_StartSession();
    }
    goto LABEL_19;
  }
  unsigned __int8 v18 = outputStruct[0];
  *(void *)(DerivedStorage + 552) = *(void *)outputStruct;
  CFNumberRef v26 = (unsigned char *)(DerivedStorage + 552);
  *(void *)(DerivedStorage + 557) = *(void *)&outputStruct[5];
  if (v14 <= 0x870000) {
    int v19 = 4;
  }
  else {
    int v19 = 2;
  }
  *(_DWORD *)(DerivedStorage + 460) = v19;
  if (v14 > 0x870000) {
    char v20 = 1;
  }
  else {
    char v20 = 2;
  }
  CreateFrameInfoQueue(DerivedStorage + 104, v18 << v20);
  *(_DWORD *)buf = *(_DWORD *)(DerivedStorage + 392);
  LOBYTE(v36) = 0;
  HIBYTE(v36) = *(unsigned char *)(DerivedStorage + 89);
  *(void *)&long long v39 = DerivedStorage + 104;
  *((void *)&v39 + 1) = DerivedStorage + 152;
  uint64_t v40 = DerivedStorage + 160;
  uint64_t v41 = DerivedStorage + 224;
  uint64_t v42 = DerivedStorage + 272;
  uint64_t v43 = DerivedStorage + 280;
  uint64_t v44 = DerivedStorage + 344;
  uint64_t v34 = *(void *)DerivedStorage;
  uint64_t v46 = 0;
  BOOL v45 = (*(_DWORD *)(DerivedStorage + 468) & 0xFFFFFFFE) == 2;
  int v47 = *(unsigned __int8 *)(DerivedStorage + 552);
  if (v34 == 1) {
    uint64_t v46 = DerivedStorage + 568;
  }
  uint64_t ProResFrameReceiver = CreateProResFrameReceiver((void *)(DerivedStorage + 96), (uint64_t)buf, (pthread_attr_t *)(DerivedStorage + 16), (pthread_t *)(DerivedStorage + 80), *(_DWORD *)(DerivedStorage + 444), *(_DWORD *)(DerivedStorage + 692));
  if (ProResFrameReceiver)
  {
    uint64_t v12 = ProResFrameReceiver;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ProResDecoder_StartSession();
    }
    goto LABEL_19;
  }
  int v22 = *(_DWORD *)(DerivedStorage + 444);
  if (!v22)
  {
    *(_DWORD *)(DerivedStorage + 448) = 3;
    int v23 = *(_DWORD *)(DerivedStorage + 432);
    if (v23 <= 1634743415)
    {
      if (v23 != 1634742376)
      {
        if (v23 == 1634742888)
        {
          createPixelBufferAttributesDictionary((__CFDictionary **)&cf, *(int *)(DerivedStorage + 472), *(int *)(DerivedStorage + 476), *(int *)(DerivedStorage + 488), *(int *)(DerivedStorage + 492), 875704352, 0, 0, *(unsigned char *)(DerivedStorage + 592), v26);
          int v24 = 1;
          goto LABEL_69;
        }
        unsigned __int16 v25 = 13416;
LABEL_65:
        if (v23 == (v25 | 0x61700000))
        {
          createPixelBufferAttributesDictionary((__CFDictionary **)&cf, *(int *)(DerivedStorage + 472), *(int *)(DerivedStorage + 476), *(int *)(DerivedStorage + 488), *(int *)(DerivedStorage + 492), 875836448, 0, *(_DWORD *)(DerivedStorage + 452) == 32, *(unsigned char *)(DerivedStorage + 592), v26);
          int v24 = 3;
          goto LABEL_69;
        }
LABEL_76:
        uint64_t v12 = 3758097084;
        *(_DWORD *)(DerivedStorage + 448) = 8;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          ProResDecoder_StartSession(v23, v27);
        }
        goto LABEL_19;
      }
      createPixelBufferAttributesDictionary((__CFDictionary **)&cf, *(int *)(DerivedStorage + 472), *(int *)(DerivedStorage + 476), *(int *)(DerivedStorage + 488), *(int *)(DerivedStorage + 492), 875573280, 0, 0, *(unsigned char *)(DerivedStorage + 592), v26);
    }
    else
    {
      if ((v23 - 1634755432) <= 0xB && ((1 << (v23 - 104)) & 0x8C1) != 0)
      {
        createPixelBufferAttributesDictionary((__CFDictionary **)&cf, *(int *)(DerivedStorage + 472), *(int *)(DerivedStorage + 476), *(int *)(DerivedStorage + 488), *(int *)(DerivedStorage + 492), 875704864, 0, 0, *(unsigned char *)(DerivedStorage + 592), v26);
        int v24 = 2;
LABEL_69:
        *(_DWORD *)(DerivedStorage + 440) = v24;
        goto LABEL_73;
      }
      if (v23 != 1634759276)
      {
        unsigned __int16 v25 = 13432;
        goto LABEL_65;
      }
      if (!*(unsigned char *)(DerivedStorage + 554)) {
        goto LABEL_76;
      }
      *(_DWORD *)(DerivedStorage + 448) = 1;
      createPixelBufferAttributesDictionary((__CFDictionary **)&cf, *(int *)(DerivedStorage + 472), *(int *)(DerivedStorage + 476), *(int *)(DerivedStorage + 488), *(int *)(DerivedStorage + 492), 1634759276, 0, 0, *(unsigned char *)(DerivedStorage + 592), v26);
    }
    *(_DWORD *)(DerivedStorage + 440) = 0;
    goto LABEL_73;
  }
  if (v22 == 1)
  {
    *(_DWORD *)(DerivedStorage + 448) = 0;
    createPixelBufferAttributesDictionary((__CFDictionary **)&cf, *(int *)(DerivedStorage + 472), *(int *)(DerivedStorage + 476), *(int *)(DerivedStorage + 488), *(int *)(DerivedStorage + 492), 1380013856, 1, 0, *(unsigned char *)(DerivedStorage + 592), v26);
LABEL_73:
    if (a2 != 1) {
      VTDecoderSessionSetPixelBufferAttributes();
    }
    createSuggestedQualityOfServiceTiers(*(_DWORD *)(DerivedStorage + 432), *(_DWORD *)(DerivedStorage + 472), *(_DWORD *)(DerivedStorage + 476), (const __CFArray **)(DerivedStorage + 424));
    uint64_t v12 = 0;
    goto LABEL_19;
  }
  uint64_t v12 = 3758097084;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    ProResDecoder_StartSession();
  }
LABEL_19:
  if (cf) {
    CFRelease(cf);
  }
  kdebug_trace();
  return v12;
}

uint64_t ProResDecoder_DecodeFrame(uint64_t a1, uint64_t a2, opaqueCMSampleBuffer *a3, char a4, _DWORD *a5)
{
  kern_return_t v82;
  unsigned int v83;
  int v84;
  int v85;
  char v86;
  int v87;
  BOOL v88;
  uint64_t v89;
  uint64_t v90;
  int *v93;
  size_t extraRowsOnTop;
  size_t extraColumnsOnLeft;
  CFTypeRef v97;
  unsigned int v98;
  CMTime v99;
  CMTime v100;
  CMTime rhs;
  CMTime lhs;
  CMTime v103;
  CMTime v104;
  CMTime v105;
  long long v106;
  long long v107;
  uint64_t v108;
  long long v109;
  long long v110;
  long long v111;
  long long v112;
  _OWORD v113[18];
  int v114;
  long long inputStruct;
  _OWORD v116[3];
  int v117[4];
  long long v118;
  long long v119;
  long long v120;
  _OWORD v121[2];
  char *dataPointerOut;
  CMBlockBufferRef blockBufferOut;
  CFTypeRef cf;
  CVPixelBufferRef texture;
  _OWORD v126[9];
  uint64_t v127;
  void *v128;
  void *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  unsigned char v135[184];
  uint64_t v136;

  CFNumberRef v136 = *MEMORY[0x263EF8340];
  texture = 0;
  CFTypeRef cf = 0;
  blockBufferOut = 0;
  dataPointerOut = 0;
  *(_WORD *)CFNumberRef v135 = 0;
  v135[2] = 0;
  memset(&v135[4], 0, 180);
  CFNumberRef v133 = 0;
  CFNumberRef v132 = 0;
  CFNumberRef v134 = 0;
  memset(v121, 0, sizeof(v121));
  CFNumberRef v119 = 0u;
  CFNumberRef v120 = 0u;
  *(_OWORD *)CFNumberRef v117 = 0u;
  CFNumberRef v118 = 0u;
  inputStruct = 0u;
  memset(v116, 0, sizeof(v116));
  CFNumberRef v114 = 0;
  memset(v113, 0, sizeof(v113));
  CFNumberRef v111 = 0u;
  CFNumberRef v112 = 0u;
  CFNumberRef v109 = 0u;
  CFNumberRef v110 = 0u;
  CFNumberRef v108 = 0;
  CFNumberRef v106 = 0u;
  CFNumberRef v107 = 0u;
  CFNumberRef v105 = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
  CFNumberRef v104 = v105;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  kdebug_trace();
  CMSampleBufferGetOutputDuration(&v103, a3);
  int32_t v7 = (uint64_t *)(DerivedStorage + 596);
  *(CMTime *)(DerivedStorage + 596) = v103;
  if ((*(_DWORD *)(DerivedStorage + 608) & 0x1D) == 1)
  {
    if ((*(_DWORD *)(DerivedStorage + 632) & 0x1D) == 1)
    {
      CMSampleBufferGetDecodeTimeStamp(&v103, a3);
      uint64_t v8 = DerivedStorage + 620;
      CFNumberRef v105 = v103;
      lhs = v103;
      rhs = *(CMTime *)(DerivedStorage + 620);
      CMTimeSubtract(&v103, &lhs, &rhs);
      *(_OWORD *)int32_t v7 = *(_OWORD *)&v103.value;
      *(void *)(DerivedStorage + 612) = v103.epoch;
      *(_OWORD *)(DerivedStorage + 620) = *(_OWORD *)&v105.value;
      CMTimeEpoch epoch = v105.epoch;
    }
    else
    {
      CMSampleBufferGetPresentationTimeStamp(&v103, a3);
      CFNumberRef v104 = v103;
      CFNumberRef v100 = v103;
      uint64_t v8 = DerivedStorage + 644;
      CFNumberRef v99 = *(CMTime *)(DerivedStorage + 644);
      CMTimeSubtract(&v103, &v100, &v99);
      *(_OWORD *)int32_t v7 = *(_OWORD *)&v103.value;
      *(void *)(DerivedStorage + 612) = v103.epoch;
      *(_OWORD *)(DerivedStorage + 644) = *(_OWORD *)&v104.value;
      CMTimeEpoch epoch = v104.epoch;
    }
    *(void *)(v8 + 16) = epoch;
    if (*v7 < 1) {
      double v10 = 0.0;
    }
    else {
      double v10 = (double)*(int *)(DerivedStorage + 604) / (double)*v7;
    }
    *(double *)(DerivedStorage + 672) = v10;
  }
  else
  {
    double v10 = *(double *)(DerivedStorage + 672);
  }
  unsigned int v11 = (v10 + 0.5);
  if (v11 - 1025 < 0xFFFFFC00) {
    unsigned int v11 = 1;
  }
  DWORD2(v121[0]) = v11;
  DataBuffer = CMSampleBufferGetDataBuffer(a3);
  size_t DataLength = CMBlockBufferGetDataLength(DataBuffer);
  *(void *)(DerivedStorage + 544) = DataLength;
  if (!DataBuffer)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ProResDecoder_DecodeFrame();
    }
    goto LABEL_30;
  }
  if (CMBlockBufferIsRangeContiguous(DataBuffer, 0, DataLength))
  {
    blockBufferOut = DataBuffer;
    CFRetain(DataBuffer);
  }
  else
  {
    CMBlockBufferCreateContiguous((CFAllocatorRef)*MEMORY[0x263EFFB08], DataBuffer, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0, 0, *(void *)(DerivedStorage + 544), 2u, &blockBufferOut);
  }
  CMBlockBufferGetDataPointer(blockBufferOut, 0, 0, 0, &dataPointerOut);
  unsigned int FrameSize = getFrameSize((unsigned __int8 *)dataPointerOut);
  if (FrameSize > *(void *)(DerivedStorage + 544))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ProResDecoder_DecodeFrame();
    }
LABEL_30:
    char v20 = 0;
    IOSurface = 0;
LABEL_31:
    if (*(void *)DerivedStorage != 1)
    {
      ProResDecoder_WaitForAsynchronousFrames();
      VTDecoderSessionEmitDecodedFrame();
    }
    if (texture) {
      CVPixelBufferRelease(texture);
    }
    if (cf) {
      CFRelease(cf);
    }
    if (v20) {
      bzero(v20, 0x2F8uLL);
    }
    VTDecoderSessionCleanUpAfterDecode();
    goto LABEL_40;
  }
  int v15 = dataPointerOut;
  BOOL v16 = dataPointerOut + 8;
  int v17 = parseFrameHeader((uint64_t)v135, (unsigned __int16 *)dataPointerOut + 4, *(_DWORD *)(DerivedStorage + 444), *(_DWORD *)(DerivedStorage + 692));
  if (v17)
  {
    if (v17 != -536870191)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        ProResDecoder_DecodeFrame();
      }
      goto LABEL_49;
    }
    *(unsigned char *)(DerivedStorage + 690) = 1;
  }
  if (*(unsigned __int16 *)&v135[8] <= 0xFu)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ProResDecoder_DecodeFrame();
    }
    goto LABEL_30;
  }
  if (*(unsigned __int16 *)&v135[10] <= 0xFu)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ProResDecoder_DecodeFrame();
    }
    goto LABEL_30;
  }
  v117[2] = *(unsigned __int16 *)&v135[8];
  v117[3] = *(unsigned __int16 *)&v135[10];
  if (!*(_DWORD *)(DerivedStorage + 444))
  {
    *(unsigned char *)(DerivedStorage + 680) = v135[15];
    uint64_t v23 = (uint64_t)&v16[*(unsigned __int16 *)v135];
    ProResDecoder_ParsePictureHeader((uint64_t)&v132, v23);
    if (ProResDecoder_GetYCbCrNumSlices((uint64_t)v135, (uint64_t)&v132, 0) > *(_DWORD *)(DerivedStorage + 500) << 15)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        ProResDecoder_DecodeFrame();
      }
LABEL_49:
      char v20 = 0;
      IOSurface = 0;
      goto LABEL_31;
    }
    BYTE5(v116[0]) = 0;
    int v25 = v135[13];
    if (v135[13])
    {
      ProResDecoder_ParsePictureHeader((uint64_t)&v133 + 4, v23 + HIDWORD(v132));
      if (ProResDecoder_GetYCbCrNumSlices((uint64_t)v135, (uint64_t)&v133 + 4, 1) > *(_DWORD *)(DerivedStorage + 504))
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          ProResDecoder_DecodeFrame();
        }
        goto LABEL_49;
      }
      BYTE5(v116[0]) = BYTE2(v133) != BYTE6(v134);
      if (BYTE2(v133) != BYTE6(v134))
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          ProResDecoder_DecodeFrame();
        }
        char v20 = 0;
        IOSurface = 0;
        goto LABEL_31;
      }
      int v25 = v135[13];
    }
    BYTE2(v116[0]) = v25;
    BYTE3(v116[0]) = v25 == 2;
    int v26 = v135[12];
    DWORD1(v116[1]) = v135[12];
    if (*(_DWORD *)(DerivedStorage + 496)
      || !*(unsigned char *)(DerivedStorage + 592)
      || !v135[19]
      || (int v31 = *(_DWORD *)(DerivedStorage + 440), (v31 & 0xFFFFFFFE) != 2))
    {
LABEL_69:
      if (*(_DWORD *)(DerivedStorage + 440) != v26)
      {
        if (*(_DWORD *)(DerivedStorage + 520))
        {
          unsigned int v27 = *(_DWORD *)(DerivedStorage + 528);
          unsigned int v28 = *(_DWORD *)(DerivedStorage + 536);
          uint64_t v29 = ((v27 + 15) & 0xFFFFFFF0) - v27;
          uint64_t v30 = ((v28 + 15) & 0xFFFFFFF0) - v28;
        }
        else
        {
          unsigned int v27 = *(_DWORD *)(DerivedStorage + 472);
          unsigned int v28 = *(_DWORD *)(DerivedStorage + 476);
          uint64_t v29 = *(int *)(DerivedStorage + 488);
          uint64_t v30 = *(int *)(DerivedStorage + 492);
        }
        v103.value = 0;
        if (v26 == 3)
        {
          createPixelBufferAttributesDictionary((__CFDictionary **)&v103, v27, v28, v29, v30, 875836448, *(_DWORD *)(DerivedStorage + 444), 0, *(unsigned char *)(DerivedStorage + 592), (unsigned char *)(DerivedStorage + 552));
          int v36 = 3;
        }
        else
        {
          if (v26 != 2)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              ProResDecoder_DecodeFrame();
            }
            char v20 = 0;
            IOSurface = 0;
            goto LABEL_31;
          }
          createPixelBufferAttributesDictionary((__CFDictionary **)&v103, v27, v28, v29, v30, 875704864, *(_DWORD *)(DerivedStorage + 444), 0, *(unsigned char *)(DerivedStorage + 592), (unsigned char *)(DerivedStorage + 552));
          int v36 = 2;
        }
        *(_DWORD *)(DerivedStorage + 440) = v36;
        VTDecoderSessionSetPixelBufferAttributes();
        CFRelease((CFTypeRef)v103.value);
      }
      if ((*(_DWORD *)(DerivedStorage + 432) | 0x10) == 0x61703478)
      {
        CFNumberRef v98 = 0;
        v103.value = (CMTimeValue)CMSampleBufferGetFormatDescription(a3);
        setBitstreamDepthFromFormatExtensions((const opaqueCMFormatDescription **)&v103, &v98);
        if (*(_DWORD *)(DerivedStorage + 452) != v98)
        {
          FigFormatDescriptionRelease();
          *(void *)(DerivedStorage + 400) = FigFormatDescriptionRetain();
          if (*(_DWORD *)(DerivedStorage + 520))
          {
            unsigned int v37 = *(_DWORD *)(DerivedStorage + 528);
            unsigned int v38 = *(_DWORD *)(DerivedStorage + 536);
            uint64_t v39 = ((v37 + 15) & 0xFFFFFFF0) - v37;
            uint64_t v40 = ((v38 + 15) & 0xFFFFFFF0) - v38;
          }
          else
          {
            unsigned int v37 = *(_DWORD *)(DerivedStorage + 472);
            unsigned int v38 = *(_DWORD *)(DerivedStorage + 476);
            uint64_t v39 = *(int *)(DerivedStorage + 488);
            uint64_t v40 = *(int *)(DerivedStorage + 492);
          }
          CFNumberRef v97 = 0;
          createPixelBufferAttributesDictionary((__CFDictionary **)&v97, v37, v38, v39, v40, 875836448, *(_DWORD *)(DerivedStorage + 444), v98 == 32, *(unsigned char *)(DerivedStorage + 592), (unsigned char *)(DerivedStorage + 552));
          *(_DWORD *)(DerivedStorage + 452) = v98;
          VTDecoderSessionSetPixelBufferAttributes();
          CFRelease(v97);
        }
      }
      ProResDecoder_GetSubFrameSliceInfo((uint64_t)v135, (uint64_t)v16, (uint64_t)&v132, (uint64_t)&v109);
      int v24 = (unsigned __int8 *)&v132;
      goto LABEL_93;
    }
    if (*(_DWORD *)(DerivedStorage + 520))
    {
      unsigned int v32 = *(_DWORD *)(DerivedStorage + 528);
      unsigned int v33 = *(_DWORD *)(DerivedStorage + 536);
      uint64_t v34 = ((v32 + 15) & 0xFFFFFFF0) - v32;
      uint64_t v35 = ((v33 + 15) & 0xFFFFFFF0) - v33;
    }
    else
    {
      unsigned int v32 = *(_DWORD *)(DerivedStorage + 472);
      unsigned int v33 = *(_DWORD *)(DerivedStorage + 476);
      uint64_t v34 = *(int *)(DerivedStorage + 488);
      uint64_t v35 = *(int *)(DerivedStorage + 492);
    }
    v103.value = 0;
    if (v31 == 2)
    {
      int v63 = 875704864;
    }
    else
    {
      if (v31 != 3)
      {
LABEL_197:
        VTDecoderSessionSetPixelBufferAttributes();
        CFRelease((CFTypeRef)v103.value);
        int v26 = v135[12];
        goto LABEL_69;
      }
      int v63 = 875836448;
    }
    createPixelBufferAttributesDictionary((__CFDictionary **)&v103, v32, v33, v34, v35, v63, *(_DWORD *)(DerivedStorage + 444), 0, 1, (unsigned char *)(DerivedStorage + 552));
    goto LABEL_197;
  }
  *(unsigned char *)(DerivedStorage + 680) = 0;
  ProResDecoder_ParseMetadataExtension(v17, (unint64_t *)&v135[152], v16, FrameSize, v18, v19, *(_DWORD *)(DerivedStorage + 692));
  if (ProResDecoder_GetLargestDCQSS((unsigned __int16 *)v135, (uint64_t)v16, (unint64_t)&dataPointerOut[FrameSize]))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ProResDecoder_DecodeFrame();
    }
    char v20 = 0;
    IOSurface = 0;
    goto LABEL_31;
  }
  DWORD2(v116[0]) = 0;
  BYTE12(v116[0]) = 0;
  DWORD1(v121[0]) = v135[16];
  BYTE6(v116[0]) = 0;
  BYTE14(v116[0]) = *(unsigned char *)(DerivedStorage + 592) ^ 1;
  ProResDecoder_GetSubFramePictureSliceInfo(*(unsigned __int16 *)&v135[8], *(unsigned __int16 *)&v135[10], 1 << ((v15[79] >> 1) & 7), 0x8000u, (uint64_t)&v109, 0);
  int v24 = 0;
LABEL_93:
  ProResDecoder_GetSubFrameInfo((unsigned __int16 *)v135, v24, (uint64_t)v16, FrameSize, (uint64_t)&v109);
  kdebug_trace();
  VTDecoderSessionCreatePixelBuffer();
  kdebug_trace();
  *(void *)(DerivedStorage + 528) = CVPixelBufferGetWidth(texture);
  *(void *)(DerivedStorage + 536) = CVPixelBufferGetHeight(texture);
  *(_DWORD *)(DerivedStorage + 436) = CVPixelBufferGetPixelFormatType(texture);
  size_t PlaneCount = CVPixelBufferGetPlaneCount(texture);
  IOSurface = CVPixelBufferGetIOSurface(texture);
  *((void *)&v120 + 1) = IOSurface;
  LODWORD(v120) = IOSurfaceGetID(IOSurface);
  IOSurfaceGetPixelFormat(IOSurface);
  uint64_t v42 = APR_ImgFmt_4CC(*(_DWORD *)(DerivedStorage + 436));
  if (!v42)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ProResDecoder_DecodeFrame();
    }
    goto LABEL_106;
  }
  if (*(_DWORD *)(DerivedStorage + 432) == 1634759276) {
    *(unsigned char *)(DerivedStorage + 689) = 1;
  }
  if (!*(_DWORD *)(DerivedStorage + 444))
  {
    int CompressionTypeOfPlane = IOSurfaceGetCompressionTypeOfPlane();
    BYTE13(v116[0]) = CompressionTypeOfPlane != 0;
    int v48 = v135[19];
    if (v135[19] && (int v49 = v42[33], v42[33]))
    {
      uint64_t v50 = (uint64_t)v42;
      *(_DWORD *)(DerivedStorage + 448) = 3;
      DWORD2(v116[0]) = 3;
      BYTE12(v116[0]) = v49 != 1;
      if (*(unsigned char *)(DerivedStorage + 561)) {
        BOOL v51 = 0;
      }
      else {
        BOOL v51 = v48 == 1 && v49 == 2 && CompressionTypeOfPlane == 0;
      }
    }
    else
    {
      if (v135[19] && *(unsigned char *)(DerivedStorage + 689) && !v135[12] && *(unsigned char *)(DerivedStorage + 554))
      {
        uint64_t v50 = (uint64_t)v42;
        BOOL v51 = 0;
        int v52 = 1;
      }
      else
      {
        uint64_t v50 = (uint64_t)v42;
        int v48 = v42[33];
        if (!v42[33] || !*(unsigned char *)(DerivedStorage + 561))
        {
          BOOL v51 = 0;
          *(_DWORD *)(DerivedStorage + 448) = 2;
          DWORD2(v116[0]) = 2;
          BYTE12(v116[0]) = 0;
          goto LABEL_149;
        }
        BOOL v51 = 0;
        int v52 = 3;
      }
      *(_DWORD *)(DerivedStorage + 448) = v52;
      DWORD2(v116[0]) = v52;
      BYTE12(v116[0]) = v48 != 1;
    }
LABEL_149:
    char v54 = 0;
    if (*(unsigned char *)(DerivedStorage + 556) && CompressionTypeOfPlane)
    {
      char v54 = 0;
      DWORD1(v116[2]) = *(_DWORD *)(v50 + 40);
      LODWORD(v116[2]) = *(_DWORD *)(v50 + 40);
      HIDWORD(v116[1]) = 0;
    }
    goto LABEL_152;
  }
  v126[6] = *(_OWORD *)&v135[96];
  v126[7] = *(_OWORD *)&v135[112];
  v126[8] = *(_OWORD *)&v135[128];
  v126[2] = *(_OWORD *)&v135[32];
  v126[3] = *(_OWORD *)&v135[48];
  v126[4] = *(_OWORD *)&v135[64];
  v126[5] = *(_OWORD *)&v135[80];
  v126[0] = *(_OWORD *)v135;
  v126[1] = *(_OWORD *)&v135[16];
  CFNumberRef v127 = *(void *)&v135[144];
  CFNumberRef v128 = 0;
  CFNumberRef v129 = 0;
  CFNumberRef v130 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>((char *)&v128, *(char **)&v135[152], *(char **)&v135[160], *(void *)&v135[160] - *(void *)&v135[152]);
  CFNumberRef v131 = *(void *)&v135[176];
  SetRAWAttachments((uint64_t)v126, texture, *(_DWORD *)(DerivedStorage + 520), *(_DWORD *)(DerivedStorage + 692), v43, v44);
  if (v128)
  {
    CFNumberRef v129 = v128;
    operator delete(v128);
  }
  int v45 = *(_DWORD *)(DerivedStorage + 436);
  if (v45 == 1651520304 || v45 == 1651521076)
  {
    int v46 = *(_DWORD *)(DerivedStorage + 520);
    if (!v46)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        ProResDecoder_DecodeFrame();
      }
LABEL_123:
      char v20 = 0;
      goto LABEL_31;
    }
  }
  else
  {
    int v46 = *(_DWORD *)(DerivedStorage + 520);
  }
  if (v46 && PlaneCount || v45 == 1647392369 && PlaneCount != 4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ProResDecoder_DecodeFrame();
    }
    goto LABEL_123;
  }
  size_t v53 = PlaneCount;
  if (v45 != 1651521076 && v45 != 1651520304) {
    goto LABEL_132;
  }
  char v54 = 1;
  if (*(unsigned char *)(DerivedStorage + 560))
  {
    BYTE4(v116[0]) = 1;
LABEL_132:
    char v54 = 0;
  }
  if (*(unsigned char *)(DerivedStorage + 553))
  {
    if (v45 <= 1734501175)
    {
      if (v45 > 1650946097)
      {
        if (v45 != 1650946098)
        {
          if (v45 == 1651519798)
          {
            if (v46 || v53)
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                ProResDecoder_DecodeFrame();
              }
              goto LABEL_123;
            }
            LODWORD(v116[2]) = 1;
            goto LABEL_278;
          }
          int v55 = 1652056888;
LABEL_182:
          if (v45 != v55) {
            goto LABEL_278;
          }
LABEL_209:
          if (v46 || v53)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              ProResDecoder_DecodeFrame();
            }
            goto LABEL_123;
          }
          if (v45 == 1919378232 && DWORD1(v121[0]))
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              ProResDecoder_DecodeFrame();
            }
            goto LABEL_123;
          }
          if (v45 == 1735549752 && DWORD1(v121[0]) != 1)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              ProResDecoder_DecodeFrame();
            }
            goto LABEL_123;
          }
          if (v45 == 1734501176 && DWORD1(v121[0]) != 2)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              ProResDecoder_DecodeFrame();
            }
            goto LABEL_123;
          }
          if (v45 == 1650942776 && DWORD1(v121[0]) != 3)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              ProResDecoder_DecodeFrame();
            }
            goto LABEL_123;
          }
          if (v45 == 1652056888 && DWORD1(v121[0]) >= 4)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              ProResDecoder_DecodeFrame();
            }
            goto LABEL_123;
          }
          *(void *)&v116[2] = 0x200000001;
          goto LABEL_278;
        }
LABEL_203:
        if (v46 || v53)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            ProResDecoder_DecodeFrame();
          }
          goto LABEL_123;
        }
        if (v45 == 1919381552 && DWORD1(v121[0]))
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            ProResDecoder_DecodeFrame();
          }
          goto LABEL_123;
        }
        if (v45 == 1735553072 && DWORD1(v121[0]) != 1)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            ProResDecoder_DecodeFrame();
          }
          goto LABEL_123;
        }
        if (v45 == 1734504496 && DWORD1(v121[0]) != 2)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            ProResDecoder_DecodeFrame();
          }
          goto LABEL_123;
        }
        if (v45 == 1650946096 && DWORD1(v121[0]) != 3)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            ProResDecoder_DecodeFrame();
          }
          goto LABEL_123;
        }
        if (v45 == 1650946098 && DWORD1(v121[0]) != 3)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            ProResDecoder_DecodeFrame();
          }
          goto LABEL_123;
        }
        *(void *)((char *)&v116[1] + 12) = 0x100000001;
        goto LABEL_278;
      }
      if (v45 == 1650942776) {
        goto LABEL_209;
      }
      int v62 = 1650946096;
    }
    else
    {
      if (v45 <= 1735553071)
      {
        if (v45 == 1734501176) {
          goto LABEL_209;
        }
        if (v45 != 1734504496)
        {
          int v55 = 1735549752;
          goto LABEL_182;
        }
        goto LABEL_203;
      }
      if (v45 == 1735553072) {
        goto LABEL_203;
      }
      if (v45 == 1919378232) {
        goto LABEL_209;
      }
      int v62 = 1919381552;
    }
    if (v45 != v62)
    {
LABEL_278:
      uint64_t v50 = (uint64_t)v42;
      BOOL v51 = 0;
      DWORD2(v116[2]) = DWORD1(v121[0]);
      goto LABEL_152;
    }
    goto LABEL_203;
  }
  uint64_t v50 = (uint64_t)v42;
  BOOL v51 = 0;
LABEL_152:
  int v58 = *(_DWORD *)(v50 + 4) - 8;
  if v58 < 9 && ((0x115u >> v58))
  {
    DWORD2(v116[1]) = dword_262C82E20[v58];
  }
  else if (!*(_DWORD *)(DerivedStorage + 448) && !*(_DWORD *)(DerivedStorage + 520) && DWORD2(v116[1]) != 3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ProResDecoder_DecodeFrame();
    }
LABEL_106:
    char v20 = 0;
    goto LABEL_31;
  }
  BYTE7(v116[0]) = 1;
  LODWORD(v116[1]) = *(_DWORD *)(DerivedStorage + 520);
  if (ProResDecoder_CheckDecodeCmd((uint64_t)v116, v135, *(unsigned int *)(DerivedStorage + 448), (unsigned char *)(DerivedStorage + 552), v50, *(unsigned int *)(DerivedStorage + 692)))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ProResDecoder_DecodeFrame();
    }
    char v20 = 0;
    goto LABEL_31;
  }
  CFNumberRef v88 = v51;
  extraRowsOnTop = 0;
  extraColumnsOnLeft = 0;
  CVPixelBufferGetExtendedPixels(texture, &extraColumnsOnLeft, 0, &extraRowsOnTop, 0);
  *(void *)&CFNumberRef v118 = extraColumnsOnLeft;
  if (*(_DWORD *)(DerivedStorage + 520))
  {
    *((void *)&v118 + 1) = extraRowsOnTop;
  }
  else
  {
    if (extraColumnsOnLeft + v117[2] > *(void *)(DerivedStorage + 528))
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        ProResDecoder_DecodeFrame();
      }
      goto LABEL_187;
    }
    *((void *)&v118 + 1) = extraRowsOnTop;
    if (extraRowsOnTop + v117[3] > *(void *)(DerivedStorage + 536))
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        ProResDecoder_DecodeFrame();
      }
      goto LABEL_187;
    }
  }
  CFNumberRef v59 = (CFTypeRef *)(DerivedStorage + 408);
  if (!*(void *)(DerivedStorage + 408))
  {
    ProResDecoder_GetInputMaxSize(v117[2], v117[3], *(_DWORD *)(DerivedStorage + 432), v135[19], (unsigned int *)(DerivedStorage + 456));
    LODWORD(v61) = *(_DWORD *)(DerivedStorage + 456);
    *(_DWORD *)(DerivedStorage + 456) = (((double)v61 * 1.5) / DWORD1(v109) + 127) & 0xFFFFFF80;
    if (CVDataBufferPoolCreate() || !*v59)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        ProResDecoder_DecodeFrame();
      }
LABEL_187:
      char v20 = 0;
      goto LABEL_31;
    }
  }
  unsigned int v60 = v110;
  if (*(_DWORD *)(DerivedStorage + 456) < v110)
  {
    ProResDecoder_WaitForAsynchronousFrames();
    CVDataBufferPoolFlush();
    CFRelease(*v59);
    *(void *)(DerivedStorage + 408) = 0;
    *(_DWORD *)(DerivedStorage + 456) = (((double)v60 * 1.5) + 127) & 0xFFFFFF80;
    if (CVDataBufferPoolCreate() || !*v59)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        ProResDecoder_DecodeFrame();
      }
      goto LABEL_187;
    }
  }
  if (*(_DWORD *)(DerivedStorage + 448) == 2 && CVPixelBufferGetPlaneCount(texture) == 3 && !BYTE13(v116[0]))
  {
    CVPixelBufferLockBaseAddress(texture, 0);
    BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(texture, 2uLL);
    size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(texture, 2uLL);
    size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(texture, 2uLL);
    memset(BaseAddressOfPlane, 255, BytesPerRowOfPlane * HeightOfPlane);
    CVPixelBufferUnlockBaseAddress(texture, 0);
  }
  LODWORD(v121[0]) = 3;
  *(void *)&CFNumberRef v106 = *(void *)(DerivedStorage + 120);
  HIDWORD(v106) = *(_DWORD *)(DerivedStorage + 460);
  *(void *)&CFNumberRef v107 = DerivedStorage + 272;
  *((void *)&v107 + 1) = DerivedStorage + 280;
  CFNumberRef v108 = DerivedStorage + 344;
  unsigned int v67 = DWORD1(v109);
  if (DWORD1(v109))
  {
    uint64_t v68 = 0;
    if ((a4 & 4) != 0) {
      int v69 = 0;
    }
    else {
      int v69 = 3;
    }
    CFNumberRef v85 = v69;
    CFNumberRef v86 = v54;
    CFNumberRef v87 = a4 & 1;
    CFNumberRef v93 = (int *)v113 + 1;
    while (1)
    {
      unsigned int v70 = DWORD2(v109);
      if (!(*(_DWORD *)(DerivedStorage + 496) | DWORD2(v109)))
      {
        BOOL v72 = v67 > 1
           || (*(_DWORD *)(DerivedStorage + 476) * *(_DWORD *)(DerivedStorage + 472)) >> 10 < 0x7E9;
        if (*(unsigned char *)(DerivedStorage + 688)) {
          int v73 = 1;
        }
        else {
          int v73 = 3;
        }
        if (*(unsigned char *)(DerivedStorage + 688)) {
          int v74 = 1;
        }
        else {
          int v74 = v72;
        }
        int v75 = v85;
        if (!*(_DWORD *)(DerivedStorage + 684)) {
          int v75 = v73;
        }
        *(_DWORD *)(DerivedStorage + 464) = v75;
        if (v74) {
          int v76 = 1;
        }
        else {
          int v76 = 3;
        }
        *(_DWORD *)(DerivedStorage + 468) = v76;
        uint64_t v77 = *(void *)(DerivedStorage + 96);
        if (v77) {
          ProResFrameReceiver::SetOutOfOrderFrameProcessing(v77, v74 ^ 1);
        }
        if ((v74 & 1) == 0)
        {
          int v78 = *(_DWORD *)(DerivedStorage + 460) * *(unsigned __int8 *)(DerivedStorage + 552);
          *(_DWORD *)(DerivedStorage + 460) = v78;
          HIDWORD(v106) = v78;
        }
      }
      CFNumberRef v89 = v68;
      *(void *)((char *)v121 + 12) = *(void *)(DerivedStorage + 464);
      DWORD2(v106) = *(_DWORD *)(DerivedStorage + 496) + v70;
      unsigned int EmptySpotInFrameInfoArray = GetEmptySpotInFrameInfoArray((uint64_t)&v106);
      if (EmptySpotInFrameInfoArray == -1) {
        break;
      }
      CFNumberRef v90 = *(void *)(DerivedStorage + 120);
      if (ProResDecoder_prepareInputFrame())
      {
        char v20 = (void *)(v90 + 760 * EmptySpotInFrameInfoArray);
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          ProResDecoder_DecodeFrame();
        }
        goto LABEL_31;
      }
      uint64_t v80 = v90 + 760 * EmptySpotInFrameInfoArray;
      *(_DWORD *)(v80 + 4) = *(_DWORD *)(DerivedStorage + 448);
      *(_DWORD *)(v80 + 24) = v87;
      *(void *)(v80 + 32) = *(void *)(DerivedStorage + 512);
      *(void *)(v80 + 16) = a2;
      CVPixelBufferRef v81 = texture;
      *(void *)(v80 + 40) = cf;
      *(void *)(v80 + 48) = v81;
      *(_DWORD *)(v80 + 28) = FrameSize;
      *(_DWORD *)(v80 + 56) = v70;
      *(_DWORD *)(v80 + 60) = v67;
      LODWORD(v81) = *(_DWORD *)(DerivedStorage + 496);
      *(_DWORD *)(v80 + 8) = v81;
      *(unsigned char *)(v80 + 64) = v88;
      *(unsigned char *)(v80 + 65) = v86;
      *(void *)&inputStruct = __PAIR64__(EmptySpotInFrameInfoArray, v81);
      LOWORD(v116[0]) = (_WORD)v81;
      v117[3] = *v93;
      *((void *)&inputStruct + 1) = __PAIR64__(v67, v70);
      DWORD2(v109) = v70 + 1;
      atomic_fetch_add((atomic_uint *volatile)(DerivedStorage + 152), 1u);
      kdebug_trace();
      CFNumberRef v82 = IOConnectCallStructMethod(*(_DWORD *)(DerivedStorage + 392), 2u, &inputStruct, 0xA0uLL, 0, 0);
      kdebug_trace();
      if (v82)
      {
        char v20 = (void *)(v90 + 760 * EmptySpotInFrameInfoArray);
        atomic_fetch_add((atomic_uint *volatile)(DerivedStorage + 152), 0xFFFFFFFF);
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          ProResDecoder_DecodeFrame();
        }
        goto LABEL_31;
      }
      CFNumberRef v83 = *v93;
      v93 += 10;
      *((void *)&v118 + 1) += v83 >> *(_DWORD *)(DerivedStorage + 520);
      CFTypeRef cf = 0;
      uint64_t v68 = v89 + 1;
      unsigned int v67 = DWORD1(v109);
      if (v89 + 1 >= (unint64_t)DWORD1(v109))
      {
        CFNumberRef v84 = v87;
        goto LABEL_257;
      }
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ProResDecoder_DecodeFrame();
    }
    char v20 = 0;
    goto LABEL_31;
  }
  CFNumberRef v84 = a4 & 1;
LABEL_257:
  ++*(_DWORD *)(DerivedStorage + 496);
  if (v84) {
    *a5 |= 1u;
  }
  else {
    ProResDecoder_WaitForAsynchronousFrames();
  }
LABEL_40:
  if (blockBufferOut) {
    CFRelease(blockBufferOut);
  }
  if (*(void *)&v135[160] != *(void *)&v135[152]) {
    *(void *)&v135[160] = *(void *)&v135[152];
  }
  IOSurfaceGetWidth(IOSurface);
  IOSurfaceGetHeight(IOSurface);
  kdebug_trace();
  if (*(void *)&v135[152])
  {
    *(void *)&v135[160] = *(void *)&v135[152];
    operator delete(*(void **)&v135[152]);
  }
  return 0;
}

void sub_262C0303C(_Unwind_Exception *a1)
{
  unint64_t v2 = (void *)STACK[0x518];
  if (STACK[0x518])
  {
    STACK[0x520] = (unint64_t)v2;
    operator delete(v2);
  }
  _Unwind_Resume(a1);
}

uint64_t ProResDecoder_CopySupportedPropertyDictionary(uint64_t a1, void *a2)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (DerivedStorage)
  {
    uint64_t v4 = DerivedStorage;
    CFAllocatorRef v5 = *(const void **)(DerivedStorage + 416);
    if (v5)
    {
      CFRetain(v5);
      uint64_t result = 0;
      *a2 = *(void *)(v4 + 416);
    }
    else
    {
      *a2 = 0;
      return 4294954392;
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ProResDecoder_CopySupportedPropertyDictionary();
    }
    return 4294954385;
  }
  return result;
}

BOOL ProResDecoder_CanAcceptFormatDescription(int a1, CMVideoFormatDescriptionRef videoDesc)
{
  BOOL v16 = videoDesc;
  CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(videoDesc);
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!DerivedStorage)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ProResDecoder_CanAcceptFormatDescription();
    }
    return 1;
  }
  uint64_t v5 = DerivedStorage;
  if (CMFormatDescriptionEqual(*(CMFormatDescriptionRef *)(DerivedStorage + 400), videoDesc)) {
    return 1;
  }
  if (*(_DWORD *)(v5 + 472) != Dimensions.width || *(_DWORD *)(v5 + 476) != Dimensions.height) {
    return 0;
  }
  FourCharCode MediaSubType = CMFormatDescriptionGetMediaSubType(*(CMFormatDescriptionRef *)(v5 + 400));
  FourCharCode v7 = CMFormatDescriptionGetMediaSubType(videoDesc);
  if ((MediaSubType & 0xFFFFFFEF) == 0x61703468 && (v7 & 0xFFFFFFEF) == 0x61703468)
  {
    unsigned int v15 = 0;
    setBitstreamDepthFromFormatExtensions(&v16, &v15);
    FigFormatDescriptionRelease();
    *(void *)(v5 + 400) = FigFormatDescriptionRetain();
    if (*(_DWORD *)(v5 + 452) != v15)
    {
      if (*(_DWORD *)(v5 + 520))
      {
        unsigned int v8 = *(_DWORD *)(v5 + 528);
        unsigned int v9 = *(_DWORD *)(v5 + 536);
        uint64_t v10 = ((v8 + 15) & 0xFFFFFFF0) - v8;
        uint64_t v11 = ((v9 + 15) & 0xFFFFFFF0) - v9;
      }
      else
      {
        unsigned int v8 = *(_DWORD *)(v5 + 472);
        unsigned int v9 = *(_DWORD *)(v5 + 476);
        uint64_t v10 = *(int *)(v5 + 488);
        uint64_t v11 = *(int *)(v5 + 492);
      }
      CFTypeRef cf = 0;
      createPixelBufferAttributesDictionary((__CFDictionary **)&cf, v8, v9, v10, v11, 875836448, *(_DWORD *)(v5 + 444), v15 == 32, *(unsigned char *)(v5 + 592), (unsigned char *)(v5 + 552));
      *(_DWORD *)(v5 + 452) = v15;
      VTDecoderSessionSetPixelBufferAttributes();
      CFRelease(cf);
    }
    return 1;
  }
  if (MediaSubType - 1634755432 <= 0xB && ((1 << (MediaSubType - 104)) & 0x8C1) != 0)
  {
    if (v7 - 1634755432 < 0xC) {
      return (0x8C1u >> (v7 - 104)) & 1;
    }
    return 0;
  }
  if (MediaSubType != 1634759272 && MediaSubType != 1634759278) {
    return 0;
  }
  return v7 == 1634759278 || v7 == 1634759272;
}

void createSuggestedQualityOfServiceTiers(int a1, unsigned int a2, unsigned int a3, const __CFArray **a4)
{
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
  unsigned int v29 = a3;
  unsigned int valuePtr = a2;
  uint64_t v10 = CFDictionaryCreateMutable(v8, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFNumberRef v11 = CFNumberCreate(v8, kCFNumberSInt32Type, &valuePtr);
  uint64_t v12 = (const void *)*MEMORY[0x263F1E810];
  CFDictionaryAddValue(v10, (const void *)*MEMORY[0x263F1E810], v11);
  CFRelease(v11);
  CFNumberRef v13 = CFNumberCreate(v8, kCFNumberSInt32Type, &v29);
  unsigned int v14 = (const void *)*MEMORY[0x263F1E808];
  CFDictionaryAddValue(v10, (const void *)*MEMORY[0x263F1E808], v13);
  CFRelease(v13);
  CFArrayAppendValue(Mutable, v10);
  CFRelease(v10);
  if (a1 <= 1634755431)
  {
    if (a1 > 1634743399)
    {
      if (a1 != 1634743400)
      {
        unsigned __int16 v15 = 13432;
        goto LABEL_11;
      }
    }
    else if (a1 != 1634742376)
    {
      unsigned __int16 v15 = 12904;
      goto LABEL_11;
    }
LABEL_12:
    unsigned int v29 = a3 >> 1;
    unsigned int valuePtr = a2 >> 1;
    BOOL v16 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFF88];
    int v17 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
    int v18 = CFDictionaryCreateMutable(v8, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    unsigned int v28 = a4;
    CFNumberRef v19 = CFNumberCreate(v8, kCFNumberSInt32Type, &valuePtr);
    CFDictionaryAddValue(v18, v12, v19);
    CFRelease(v19);
    CFNumberRef v20 = CFNumberCreate(v8, kCFNumberSInt32Type, &v29);
    CFDictionaryAddValue(v18, v14, v20);
    CFRelease(v20);
    CFArrayAppendValue(Mutable, v18);
    CFRelease(v18);
    unsigned int v29 = a3 >> 2;
    unsigned int valuePtr = a2 >> 2;
    int v21 = CFDictionaryCreateMutable(v8, 0, v16, v17);
    CFNumberRef v22 = CFNumberCreate(v8, kCFNumberSInt32Type, &valuePtr);
    CFDictionaryAddValue(v21, v12, v22);
    CFRelease(v22);
    CFNumberRef v23 = CFNumberCreate(v8, kCFNumberSInt32Type, &v29);
    CFDictionaryAddValue(v21, v14, v23);
    CFRelease(v23);
    CFArrayAppendValue(Mutable, v21);
    CFRelease(v21);
    unsigned int v29 = a3 >> 3;
    unsigned int valuePtr = a2 >> 3;
    int v24 = CFDictionaryCreateMutable(v8, 0, v16, v17);
    CFNumberRef v25 = CFNumberCreate(v8, kCFNumberSInt32Type, &valuePtr);
    CFDictionaryAddValue(v24, v12, v25);
    CFRelease(v25);
    CFNumberRef v26 = CFNumberCreate(v8, kCFNumberSInt32Type, &v29);
    CFDictionaryAddValue(v24, v14, v26);
    CFRelease(v26);
    CFArrayAppendValue(Mutable, v24);
    unsigned int v27 = v24;
    a4 = v28;
    CFRelease(v27);
    goto LABEL_13;
  }
  if ((a1 - 1634755432) <= 0xB && ((1 << (a1 - 104)) & 0x8C1) != 0 || a1 == 1634759278) {
    goto LABEL_12;
  }
  unsigned __int16 v15 = 29288;
LABEL_11:
  if (a1 == (v15 | 0x61700000)) {
    goto LABEL_12;
  }
LABEL_13:
  *a4 = Mutable;
}

uint64_t ProResDecoder_ParsePictureHeader(uint64_t result, uint64_t a2)
{
  *(unsigned char *)uint64_t result = *(unsigned char *)a2 >> 3;
  *(_DWORD *)(result + 4) = bswap32(*(_DWORD *)(a2 + 1));
  *(_WORD *)(result + 8) = bswap32(*(unsigned __int16 *)(a2 + 5)) >> 16;
  *(unsigned char *)(result + 10) = (*(unsigned char *)(a2 + 7) >> 4) & 3;
  return result;
}

uint64_t ProResDecoder_GetYCbCrNumSlices(uint64_t a1, uint64_t a2, int a3)
{
  int v4 = *(unsigned __int8 *)(a1 + 13);
  int v5 = *(unsigned __int16 *)(a1 + 10);
  if (*(unsigned char *)(a1 + 13))
  {
    if (a3 || v4 != 1)
    {
      if (v4 == 2 && a3 == 1) {
        unsigned int v7 = v5 + 1;
      }
      else {
        unsigned int v7 = *(unsigned __int16 *)(a1 + 10);
      }
      int v5 = v7 >> 1;
    }
    else
    {
      int v5 = (v5 + 1) >> 1;
    }
  }
  return getNumSlices(*(unsigned __int16 *)(a1 + 8), v5, (1 << *(unsigned char *)(a2 + 10)));
}

uint64_t ProResDecoder_GetSubFrameSliceInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v6 = *(unsigned __int16 *)(a1 + 8);
  unsigned int v7 = *(unsigned __int16 *)(a1 + 10);
  if (!a3)
  {
    int v8 = 1 << ((*(unsigned char *)(a2 + 71) >> 1) & 7);
    goto LABEL_6;
  }
  int v8 = 1 << *(unsigned char *)(a3 + 10);
  if (!*(unsigned char *)(a1 + 13))
  {
LABEL_6:
    int v11 = *(unsigned __int16 *)(a1 + 8);
    unsigned int v12 = v8;
    unsigned int v13 = 0x8000;
    uint64_t v14 = a4;
    unsigned int v15 = 0;
    goto LABEL_7;
  }
  unsigned int v9 = v7 >> 1;
  uint64_t result = ProResDecoder_GetSubFramePictureSliceInfo(*(unsigned __int16 *)(a1 + 8), v7 >> 1, 1 << *(unsigned char *)(a3 + 10), 0x4000u, a4, 0);
  if (*(_DWORD *)(a4 + 4) < 2u) {
    return result;
  }
  int v11 = v6;
  unsigned int v7 = v9;
  unsigned int v12 = v8;
  unsigned int v13 = 0x4000;
  uint64_t v14 = a4;
  unsigned int v15 = 1;
LABEL_7:

  return ProResDecoder_GetSubFramePictureSliceInfo(v11, v7, v12, v13, v14, v15);
}

unsigned __int16 *ProResDecoder_GetSubFrameInfo(unsigned __int16 *result, unsigned __int8 *a2, uint64_t a3, int a4, uint64_t a5)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(unsigned int *)(a5 + 4);
  if (v5 == 1)
  {
    *(unsigned char *)a5 = 1;
    *(_DWORD *)(a5 + 16) = a4;
    *(_DWORD *)(a5 + 72) = a4;
    *(_DWORD *)(a5 + 68) = result[5];
  }
  else
  {
    uint64_t v6 = *result;
    uint64_t v34 = a3 + v6;
    uint64_t v35 = 0;
    int v32 = v6;
    int v33 = 0;
    if (a2)
    {
      *(_DWORD *)(a5 + 20) = v6;
      uint64_t v7 = *a2;
      int v8 = v7 + v6;
      int v32 = v7 + v6;
      uint64_t v34 = a3 + v6 + v7;
      if (*((unsigned char *)result + 13))
      {
        int v9 = *((_DWORD *)a2 + 1) + v6;
        *(_DWORD *)(a5 + 24) = v9;
        int v10 = a2[12];
        uint64_t v11 = (v9 + v10);
        int v33 = v11;
        uint64_t v35 = a3 + v11;
        LODWORD(v6) = v8 + v10;
        uint64_t v12 = 2;
      }
      else
      {
        uint64_t v12 = 1;
        LODWORD(v6) = v7 + v6;
      }
    }
    else
    {
      uint64_t v12 = 1;
    }
    uint64_t v31 = 0;
    *(_DWORD *)(a5 + 16) = 0;
    if (v5)
    {
      uint64_t v13 = 0;
      unsigned int v14 = 0;
      unsigned int v15 = v6 + 8;
      do
      {
        uint64_t result = 0;
        uint64_t v16 = a5 + 40 * v13;
        *(_DWORD *)(v16 + 72) = v15;
        int v17 = (unsigned int *)(v16 + 72);
        int v18 = v17 - 9;
        unsigned int v19 = v15;
        do
        {
          unsigned int v20 = *((_DWORD *)&v31 + (void)result);
          unsigned int v21 = v18[4 * (void)result];
          *((_DWORD *)&v31 + (void)result) = v21 + v20;
          unsigned int v22 = 2 * v20;
          if (v20 >= v21 + v20)
          {
            unsigned int v23 = 0;
          }
          else
          {
            unsigned int v23 = 0;
            int v24 = (unsigned __int16 *)(*(&v34 + (void)result) + v22);
            unsigned int v25 = v21;
            do
            {
              unsigned int v26 = *v24++;
              v23 += bswap32(v26) >> 16;
              --v25;
            }
            while (v25);
          }
          unsigned int v27 = &v18[4 * (void)result];
          int v28 = *(&v32 + (void)result);
          v27[3] = v23;
          v27[1] = v28 + v22;
          v19 += v23 + 2 * v21;
          *int v17 = v19;
          if (v13)
          {
            int v29 = v17[4 * (void)result - 16] + v17[4 * (void)result - 17];
            uint64_t v30 = v17 - 9;
          }
          else
          {
            int v29 = v28 + 2 * *(_DWORD *)(a5 + 4 * (void)result + 28);
            uint64_t v30 = (unsigned int *)(a5 + 36);
          }
          v30[4 * (void)result + 2] = v29;
          uint64_t result = (unsigned __int16 *)((char *)result + 1);
        }
        while (result != (unsigned __int16 *)v12);
        if (v19 > v14)
        {
          *(_DWORD *)(a5 + 16) = v19;
          unsigned int v14 = v19;
        }
        ++v13;
      }
      while (v13 != v5);
    }
    *(unsigned char *)a5 = 1;
  }
  return result;
}

uint64_t ProResDecoder_GetLargestDCQSS(unsigned __int16 *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3 = *a1;
  if (a2 + v3 > a3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ProResDecoder_GetLargestDCQSS();
    }
    return 4294954387;
  }
  unsigned int v4 = (a1[4] + 15) >> 4;
  char v5 = *((unsigned char *)a1 + 70);
  unsigned int v6 = v4 & ~(-1 << v5);
  if (v6 >= 0x10)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ProResDecoder_GetLargestDCQSS();
    }
    return 4294954387;
  }
  unsigned int v7 = ((a1[5] + 15) >> 4) * (dword_262C82DE0[v6] + (v4 >> v5));
  unint64_t v8 = a2 + v3 + 2 * v7;
  if (v8 > a3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ProResDecoder_GetLargestDCQSS();
    }
    return 4294954387;
  }
  unsigned int v9 = 0;
  if (v7)
  {
    unint64_t v10 = v3 + a2 + 1;
    while (v10 <= a3 && v8 + 1 <= a3)
    {
      uint64_t v11 = __rev16(*(unsigned __int16 *)(v10 - 1));
      if (v9 <= *(unsigned __int8 *)(v8 + 1)) {
        unsigned int v9 = *(unsigned __int8 *)(v8 + 1);
      }
      v8 += v11;
      v10 += 2;
      if (!--v7) {
        goto LABEL_17;
      }
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ProResDecoder_GetLargestDCQSS();
    }
    return 4294954387;
  }
LABEL_17:
  uint64_t v12 = 0;
  *((_DWORD *)a1 + 18) = v9 * *((unsigned __int8 *)a1 + 71);
  return v12;
}

uint64_t ProResDecoder_CheckDecodeCmd(uint64_t a1, unsigned char *a2, uint64_t a3, unsigned char *a4, uint64_t a5, uint64_t a6)
{
  if ((a3 - 1) >= 3)
  {
    if (!a3) {
      return a3;
    }
    uint64_t v8 = 3758097090;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ProResDecoder_CheckDecodeCmd();
    }
    return v8;
  }
  int v7 = *(_DWORD *)(a1 + 8);
  if (v7 == 1)
  {
    if (a2[19]) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
  if (v7 != 3) {
    goto LABEL_11;
  }
  if (!a4[9] && !a2[19])
  {
LABEL_26:
    uint64_t v8 = 3758097084;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ProResDecoder_CheckDecodeCmd();
    }
    return v8;
  }
  if (!*(unsigned char *)(a5 + 33)) {
    goto LABEL_14;
  }
LABEL_11:
  if (*(unsigned char *)(a1 + 12) && v7 != 1 && *(unsigned char *)(a5 + 33) != 2)
  {
LABEL_14:
    uint64_t v8 = 3758097084;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ProResDecoder_CheckDecodeCmd();
    }
    return v8;
  }
  if (*(unsigned char *)(a1 + 5) && !a2[13])
  {
    uint64_t v8 = 3758097084;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ProResDecoder_CheckDecodeCmd();
    }
    return v8;
  }
  uint64_t v9 = *(unsigned __int8 *)(a1 + 3);
  uint64_t v10 = a2[13];
  if (!*(unsigned char *)(a1 + 3))
  {
    if (v10 != 2) {
      goto LABEL_20;
    }
LABEL_29:
    uint64_t v8 = 3758097084;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ProResDecoder_CheckDecodeCmd(v9, v10, a6, v11, v12, v13, v14, v15);
    }
    return v8;
  }
  if (v10 != 2) {
    goto LABEL_29;
  }
LABEL_20:
  if (*(unsigned char *)(a1 + 5) && *(_DWORD *)(a1 + 16))
  {
    uint64_t v8 = 3758097084;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ProResDecoder_CheckDecodeCmd();
    }
    return v8;
  }
  if (*(unsigned char *)(a1 + 13) && *(_DWORD *)(a1 + 16))
  {
    uint64_t v8 = 3758097084;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ProResDecoder_CheckDecodeCmd();
    }
    return v8;
  }
  if (*(_DWORD *)(a1 + 20) == a2[12])
  {
    if (a4[2])
    {
      if (v7 == 1)
      {
        if (*(_DWORD *)(a5 + 4) == 8)
        {
          if (*(unsigned char *)(a1 + 12)) {
            goto LABEL_42;
          }
        }
        else if (!*(unsigned char *)(a1 + 12))
        {
LABEL_42:
          uint64_t v8 = 3758097084;
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            ProResDecoder_CheckDecodeCmd();
          }
          return v8;
        }
        if (a2[12] || !a2[19])
        {
          uint64_t v8 = 3758097084;
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            ProResDecoder_CheckDecodeCmd();
          }
          return v8;
        }
      }
      else if (!a2[12] && a2[19])
      {
        uint64_t v8 = 3758097084;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          ProResDecoder_CheckDecodeCmd();
        }
        return v8;
      }
    }
    else if (v7 == 1)
    {
      uint64_t v8 = 3758097084;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        ProResDecoder_CheckDecodeCmd();
      }
      return v8;
    }
    if (!a4[4]) {
      return 0;
    }
    int v17 = *(_DWORD *)(a1 + 36);
    if (v17 == *(_DWORD *)(a1 + 32))
    {
      int v18 = *(_DWORD *)(a1 + 24);
      if (v17 == 2 && !v18)
      {
        uint64_t v8 = 3758097090;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          ProResDecoder_CheckDecodeCmd();
        }
        return v8;
      }
      if (v17 == 3 && v18 == 1)
      {
        uint64_t v8 = 3758097090;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          ProResDecoder_CheckDecodeCmd();
        }
        return v8;
      }
      if (*(_DWORD *)(a1 + 28))
      {
        uint64_t v8 = 3758097090;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          ProResDecoder_CheckDecodeCmd();
        }
        return v8;
      }
      return 0;
    }
    uint64_t v8 = 3758097090;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ProResDecoder_CheckDecodeCmd();
    }
  }
  else
  {
    uint64_t v8 = 3758097084;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ProResDecoder_CheckDecodeCmd();
    }
  }
  return v8;
}

void ProResDecoder_GetInputMaxSize(int a1, int a2, int a3, int a4, unsigned int *a5)
{
  if (a3 == 1634759278 || a3 == 1634759272)
  {
    unsigned int v7 = 16386 * ((a1 + 255) >> 8) * ((a2 + 15) >> 4) + 160;
LABEL_7:
    *a5 = v7;
    return;
  }
  *(void *)uint64_t v12 = 0;
  int v9 = a2 * a1;
  if (!GetCompressedFrameSize(a3, a2 * a1, 1.0, &v12[1], v12))
  {
    if (a4)
    {
      unsigned int v7 = v12[1] + (v9 << (a4 == 2));
    }
    else
    {
      LODWORD(v11) = v12[1];
      unsigned int v7 = ((double)v11 * 1.1);
    }
    goto LABEL_7;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    ProResDecoder_GetInputMaxSize();
  }
}

uint64_t ProResDecoder_prepareInputFrame()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    ProResDecoder_prepareInputFrame();
  }
  return 3758097085;
}

uint64_t ProResDecoder_GetSubFramePictureSliceInfo(int a1, int a2, unsigned int a3, unsigned int a4, uint64_t a5, unsigned int a6)
{
  unsigned int v9 = (a2 + 15) >> 4;
  uint64_t result = numSlicesPerRow(a3, (a1 + 15) >> 4);
  int v11 = result * v9;
  if (result * v9 <= a4)
  {
    *(_DWORD *)(a5 + 4) = 1;
  }
  else
  {
    unsigned int v12 = (a4 / result) & 0xFFFFFFFC;
    unsigned int v13 = v12 * result;
    LODWORD(v14) = (v11 - 1 + v13) / v13;
    *(_DWORD *)(a5 + 4) = v14;
    if (!__CFADD__(v11 - 1, v12 * result))
    {
      int v15 = 16 * v12;
      if (v14 <= 1) {
        uint64_t v14 = 1;
      }
      else {
        uint64_t v14 = v14;
      }
      uint64_t v16 = a5 + 36;
      unsigned int v17 = result * v9;
      do
      {
        unsigned int v18 = v17 - v13;
        if (v17 <= v13)
        {
          *(_DWORD *)(v16 + 16 * a6) = v17;
          unsigned int v19 = 16 * v17 / result;
        }
        else
        {
          *(_DWORD *)(v16 + 16 * a6) = v13;
          unsigned int v19 = v15;
        }
        *(_DWORD *)(v16 + 32) += v19;
        v16 += 40;
        unsigned int v17 = v18;
        --v14;
      }
      while (v14);
    }
  }
  *(_DWORD *)(a5 + 4 * a6 + 28) = v11;
  return result;
}

char *std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(char *result, char *a2, char *a3, size_t __sz)
{
  if (__sz)
  {
    unsigned int v6 = result;
    uint64_t result = std::vector<unsigned char>::__vallocate[abi:ne180100](result, __sz);
    unsigned int v7 = (unsigned char *)*((void *)v6 + 1);
    while (a2 != a3)
    {
      char v8 = *a2++;
      *v7++ = v8;
    }
    *((void *)v6 + 1) = v7;
  }
  return result;
}

void sub_262C0465C(_Unwind_Exception *exception_object)
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
    std::vector<std::pair<unsigned short,unsigned short>>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

char *std::vector<unsigned char>::__insert_with_size[abi:ne180100]<unsigned char *,unsigned char *>(void **a1, unsigned char *__dst, unsigned char *__src, unsigned char *a4, int64_t a5)
{
  char v5 = __dst;
  if (a5 < 1) {
    return v5;
  }
  uint64_t v10 = a1[1];
  unsigned int v9 = a1[2];
  if (v9 - v10 >= a5)
  {
    uint64_t v18 = v10 - __dst;
    if (v10 - __dst >= a5)
    {
      unsigned int v19 = &__src[a5];
      unsigned int v21 = a1[1];
    }
    else
    {
      unsigned int v19 = &__src[v18];
      if (&__src[v18] == a4)
      {
        unsigned int v21 = a1[1];
      }
      else
      {
        int64_t v20 = __src - __dst;
        unsigned int v21 = a1[1];
        unsigned int v22 = v21;
        do
          *v22++ = (v21++)[v20];
        while (&v21[v20] != a4);
      }
      a1[1] = v21;
      if (v18 < 1) {
        return v5;
      }
    }
    int v29 = &__dst[a5];
    uint64_t v30 = &v21[-a5];
    uint64_t v31 = v21;
    if (&v21[-a5] < v10)
    {
      uint64_t v32 = &v10[a5] - v21;
      uint64_t v31 = v21;
      do
      {
        char v33 = *v30++;
        *v31++ = v33;
        --v32;
      }
      while (v32);
    }
    a1[1] = v31;
    if (v21 != v29) {
      memmove(&__dst[a5], __dst, v21 - v29);
    }
    if (v19 != __src) {
      memmove(v5, __src, v19 - __src);
    }
  }
  else
  {
    int v11 = *a1;
    uint64_t v12 = v10 - (unsigned char *)*a1 + a5;
    if (v12 < 0) {
      std::vector<std::pair<unsigned short,unsigned short>>::__throw_length_error[abi:ne180100]();
    }
    unsigned int v13 = (char *)(__dst - v11);
    unint64_t v14 = v9 - v11;
    if (2 * v14 > v12) {
      uint64_t v12 = 2 * v14;
    }
    if (v14 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v15 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v15 = v12;
    }
    if (v15)
    {
      size_t v16 = v15;
      unsigned int v17 = (char *)operator new(v15);
    }
    else
    {
      size_t v16 = 0;
      unsigned int v17 = 0;
    }
    unsigned int v23 = &v13[(void)v17];
    memcpy(&v13[(void)v17], __src, a5);
    int v24 = &v13[(void)v17];
    size_t v25 = v16;
    if (v11 != v5)
    {
      do
      {
        v13[(void)v17 - 1] = v13[(void)(v11 - 1)];
        --v13;
      }
      while (v13);
      uint64_t v10 = a1[1];
      int v24 = v17;
    }
    unsigned int v26 = &v23[a5];
    unsigned int v27 = &v17[v25];
    if (v10 != v5) {
      memmove(v26, v5, v10 - v5);
    }
    int v28 = *a1;
    *a1 = v24;
    a1[1] = &v26[v10 - v5];
    a1[2] = v27;
    if (v28) {
      operator delete(v28);
    }
    return v23;
  }
  return v5;
}

void OUTLINED_FUNCTION_7_0(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_8_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x24u);
}

void OUTLINED_FUNCTION_16(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x22u);
}

void OUTLINED_FUNCTION_18(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

char *getResolutionTier(int a1, int a2, char *a3)
{
  unsigned int v3 = a2 * a1;
  if ((a2 * a1) <= 0xE1000)
  {
    *(_DWORD *)(a3 + 3) = 7352370;
    int v4 = 842480956;
LABEL_19:
    *(_DWORD *)a3 = v4;
    return a3;
  }
  if (v3 >> 10 <= 0x7E8)
  {
    *(_DWORD *)(a3 + 3) = 7352376;
    int v4 = 942682428;
    goto LABEL_19;
  }
  if (v3 <= 0x1FE000)
  {
    *((_WORD *)a3 + 2) = 112;
    int v4 = 808988721;
    goto LABEL_19;
  }
  if (v3 < 0x240001)
  {
    a3[4] = 0;
    int v4 = 1261583676;
    goto LABEL_19;
  }
  if (v3 < 0x7E9000)
  {
    int v4 = 4928572;
    goto LABEL_19;
  }
  if (v3 == 8294400)
  {
    a3[2] = 0;
    __int16 v5 = 19252;
  }
  else
  {
    if (v3 < 0x1FA4001)
    {
      int v4 = 4929596;
      goto LABEL_19;
    }
    if (v3 >= 0x21C0001)
    {
      int v4 = 4929598;
      goto LABEL_19;
    }
    a3[2] = 0;
    __int16 v5 = 19256;
  }
  *(_WORD *)a3 = v5;
  return a3;
}

void reportEncodeSessionInfo(int a1, int a2, int a3, int a4, int a5, char a6, char a7, int a8, char a9, int a10, int a11, char a12, char a13, uint64_t a14)
{
  int v16 = a3;
  int v17 = a5;
  int v18 = a1;
  int v19 = a2;
  char v23 = a7;
  int v20 = a4;
  int v21 = a10;
  char v24 = a6;
  char v25 = a12;
  char v26 = a13;
  if (*(char *)(a14 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a14, *(void *)(a14 + 8));
  }
  else
  {
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = *(_OWORD *)a14;
    __p.__r_.__value_.__r.__words[2] = *(void *)(a14 + 16);
  }
  char v27 = a9;
  int v22 = a8;
  analytics_send_event_lazy();
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_262C04BD4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

xpc_object_t ___Z23reportEncodeSessionInfojjjjjhbjbjjbbNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE_block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  int v3 = *(_DWORD *)(a1 + 56);
  int v4 = *(_DWORD *)(a1 + 60);
  string[0] = HIBYTE(v3);
  string[1] = BYTE2(v3);
  string[2] = BYTE1(v3);
  string[3] = v3;
  string[4] = 0;
  v7[0] = HIBYTE(v4);
  v7[1] = BYTE2(v4);
  _DWORD v7[2] = BYTE1(v4);
  v7[3] = v4;
  v7[4] = 0;
  xpc_dictionary_set_string(v2, "sessionType", "ProResEncoder");
  xpc_dictionary_set_string(v2, "codecType", string);
  getResolutionTier(*(_DWORD *)(a1 + 64), *(_DWORD *)(a1 + 68), v9);
  xpc_dictionary_set_string(v2, "resolution", v9);
  xpc_dictionary_set_uint64(v2, "bitDepth", *(unsigned int *)(a1 + 72));
  xpc_dictionary_set_BOOL(v2, "doubleEncode", *(unsigned char *)(a1 + 84));
  xpc_dictionary_set_string(v2, "pixelFormat", v7);
  xpc_dictionary_set_uint64(v2, "framesProcessed", *(unsigned int *)(a1 + 76));
  xpc_dictionary_set_uint64(v2, "frameRateCode", *(unsigned __int8 *)(a1 + 85));
  xpc_dictionary_set_BOOL(v2, "hardwareError", *(unsigned char *)(a1 + 86));
  xpc_dictionary_set_BOOL(v2, "nonCompliant", *(unsigned char *)(a1 + 87));
  __int16 v5 = (const char *)(a1 + 32);
  if (*(char *)(a1 + 55) < 0) {
    __int16 v5 = *(const char **)v5;
  }
  xpc_dictionary_set_string(v2, "realTime_maximizePowerEfficiency", v5);
  if (*(unsigned char *)(a1 + 84))
  {
    xpc_dictionary_set_BOOL(v2, "logCapture", *(unsigned char *)(a1 + 88));
    xpc_dictionary_set_uint64(v2, "DEFramePercentage", *(unsigned int *)(a1 + 80));
  }
  return v2;
}

void __copy_helper_block_e8_32c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(uint64_t a1, uint64_t a2)
{
  xpc_object_t v2 = (std::string *)(a1 + 32);
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

void reportDecodeSessionInfo(int a1, int a2, int a3, int a4, int a5, char a6, int a7, uint64_t a8, char a9, char a10, uint64_t a11)
{
  int v12 = a3;
  int v13 = a4;
  int v14 = a1;
  int v15 = a2;
  int v16 = a5;
  int v17 = a7;
  char v18 = a6;
  char v19 = a9;
  char v20 = a10;
  if (*(char *)(a11 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a11, *(void *)(a11 + 8));
  }
  else
  {
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = *(_OWORD *)a11;
    __p.__r_.__value_.__r.__words[2] = *(void *)(a11 + 16);
  }
  analytics_send_event_lazy();
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_262C04EDC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

xpc_object_t ___Z23reportDecodeSessionInfojjjjjhjjbbNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE_block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  int v3 = *(_DWORD *)(a1 + 56);
  int v4 = *(_DWORD *)(a1 + 60);
  string[0] = HIBYTE(v3);
  string[1] = BYTE2(v3);
  string[2] = BYTE1(v3);
  string[3] = v3;
  string[4] = 0;
  v7[0] = HIBYTE(v4);
  v7[1] = BYTE2(v4);
  _DWORD v7[2] = BYTE1(v4);
  v7[3] = v4;
  v7[4] = 0;
  xpc_dictionary_set_string(v2, "sessionType", "ProResDecoder");
  xpc_dictionary_set_string(v2, "codecType", string);
  getResolutionTier(*(_DWORD *)(a1 + 64), *(_DWORD *)(a1 + 68), v9);
  xpc_dictionary_set_string(v2, "resolution", v9);
  xpc_dictionary_set_uint64(v2, "bitDepth", *(unsigned int *)(a1 + 72));
  xpc_dictionary_set_string(v2, "pixelFormat", v7);
  xpc_dictionary_set_uint64(v2, "framesProcessed", *(unsigned int *)(a1 + 76));
  xpc_dictionary_set_uint64(v2, "frameRateCode", *(unsigned __int8 *)(a1 + 80));
  xpc_dictionary_set_BOOL(v2, "hardwareError", *(unsigned char *)(a1 + 81));
  xpc_dictionary_set_BOOL(v2, "nonCompliant", *(unsigned char *)(a1 + 82));
  __int16 v5 = (const char *)(a1 + 32);
  if (*(char *)(a1 + 55) < 0) {
    __int16 v5 = *(const char **)v5;
  }
  xpc_dictionary_set_string(v2, "realTime_maximizePowerEfficiency", v5);
  return v2;
}

uint64_t ProResFrameReceiver::MakeCurrentThreadTimeConstraintThread(ProResFrameReceiver *this)
{
  mach_timebase_info(&info);
  LODWORD(v2) = info.numer;
  LODWORD(v1) = info.denom;
  *(int32x2_t *)policy_mach_timebase_info info = vmovn_s64((int64x2_t)vcvtq_u64_f64(vdivq_f64((float64x2_t)vdupq_lane_s64(COERCE__INT64((double)v1 / (double)v2 * 1000000000.0), 0), (float64x2_t)xmmword_262C82E70)));
  integer_t v8 = policy_info[0];
  int v9 = 1;
  int v3 = pthread_self();
  thread_act_t v4 = pthread_mach_thread_np(v3);
  return thread_policy_set(v4, 2u, policy_info, 4u);
}

void ProResFrameReceiver::ProResFrameReceiver(uint64_t a1, uint64_t a2, int a3, int a4)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  *(_DWORD *)(a1 + 32) = *(_DWORD *)a2;
  *(void *)(a1 + 120) = *(void *)(a2 + 88);
  *(void *)(a1 + 56) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 112) = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 88) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 130) = 0;
  *(unsigned char *)(a1 + 66) = *(unsigned char *)(a2 + 25);
  *(void *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 16) = 0;
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 129) = 1;
  *(unsigned char *)(a1 + 128) = 0;
  *(void *)(a1 + 136) = 0;
  *(_OWORD *)(a1 + 240) = *(_OWORD *)(a2 + 128);
  *(void *)(a1 + 256) = *(void *)(a2 + 144);
  *(_DWORD *)(a1 + 264) = 0;
  *(void *)(a1 + 224) = 0;
  *(void *)(a1 + 232) = 0;
  *(void *)(a1 + 216) = 0;
  *(void *)(a1 + 272) = 0;
  *(void *)(a1 + 280) = 0;
  *(void *)(a1 + 286) = 0;
  *(_DWORD *)(a1 + 300) = a4;
  *(_DWORD *)(a1 + 304) = a3;
  *(_DWORD *)(a1 + 192) = 0;
  *(_DWORD *)(a1 + 132) = 4 * *(_DWORD *)(a2 + 120);
  *(unsigned char *)(a1 + 208) = *(unsigned char *)(a2 + 96);
  operator new[]();
}

void ProResFrameReceiver::~ProResFrameReceiver(ThreadPool **this)
{
  if (*this) {
    ProResFrameReceiver::RemoveIODispatcherFromRunLoop((ProResFrameReceiver *)this);
  }
  unint64_t v2 = this[29];
  if (v2)
  {
    ProResHWAnalyzer::~ProResHWAnalyzer(this[29]);
    MEMORY[0x263E5F2D0](v2, 0x1030C4081B690E0);
    this[29] = 0;
  }
  int v3 = this[27];
  if (v3)
  {
    freeProResFrame(v3);
    this[27] = 0;
  }
  uint64_t v4 = this[28];
  if (v4)
  {
    freeProResFrame(v4);
    this[28] = 0;
  }
  __int16 v5 = this[34];
  if (v5)
  {
    MEMORY[0x263E5F2B0](v5, 0x1000C80BDFB0063);
    this[34] = 0;
    *((_DWORD *)this + 70) = 0;
  }
  unsigned int v6 = this[25];
  if (v6)
  {
    MEMORY[0x263E5F2B0](v6, 0x1020C80BB280E9BLL);
    this[25] = 0;
  }
  unsigned int v7 = this[17];
  if (v7)
  {
    ThreadPool::~ThreadPool(this[17]);
    MEMORY[0x263E5F2D0](v7, 0x10A0C407714E300);
  }
}

void sub_262C05408(_Unwind_Exception *a1)
{
  MEMORY[0x263E5F2D0](v1, 0x10A0C407714E300);
  _Unwind_Resume(a1);
}

void ProResFrameReceiver::RemoveIODispatcherFromRunLoop(ProResFrameReceiver *this)
{
  unint64_t v2 = (__CFRunLoopSource *)*((void *)this + 1);
  if (v2)
  {
    CFRunLoopRemoveSource(*(CFRunLoopRef *)this, v2, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
    CFRelease(*((CFTypeRef *)this + 1));
    *((void *)this + 1) = 0;
  }
  int v3 = (__CFMachPort *)*((void *)this + 3);
  if (v3)
  {
    CFMachPortInvalidate(v3);
    CFRelease(*((CFTypeRef *)this + 3));
    *((void *)this + 3) = 0;
  }
  mach_port_name_t v4 = *((_DWORD *)this + 4);
  if (v4)
  {
    mach_port_mod_refs(*MEMORY[0x263EF8960], v4, 1u, -1);
    *((_DWORD *)this + 4) = 0;
  }
}

void freeProResFrame(void *a1)
{
  uint64_t v2 = a1[6];
  if (v2) {
    MEMORY[0x263E5F2B0](v2, 0x1000C8077774924);
  }
  uint64_t v3 = a1[7];
  if (v3) {
    MEMORY[0x263E5F2B0](v3, 0x1000C80BDFB0063);
  }
  uint64_t v4 = a1[40];
  if (v4) {
    MEMORY[0x263E5F2B0](v4, 0x1000C8077774924);
  }
  uint64_t v5 = a1[41];
  if (v5) {
    MEMORY[0x263E5F2B0](v5, 0x1000C8077774924);
  }
  uint64_t v6 = a1[42];
  if (v6) {
    MEMORY[0x263E5F2B0](v6, 0x1000C8077774924);
  }
  uint64_t v7 = a1[43];
  if (v7) {
    MEMORY[0x263E5F2B0](v7, 0x1000C80BDFB0063);
  }
  uint64_t v8 = a1[44];
  if (v8) {
    MEMORY[0x263E5F2B0](v8, 0x1000C80BDFB0063);
  }

  free(a1);
}

uint64_t ProResFrameReceiver::InitializeDoubleEncode(uint64_t a1, unsigned int a2)
{
  if (*(_DWORD *)(a1 + 284) >= a2) {
    return 1;
  }
  *(_DWORD *)(a1 + 264) = 0;
  uint64_t v4 = *(void *)(a1 + 232);
  if (v4)
  {
    ProResHWAnalyzer::~ProResHWAnalyzer(*(ProResHWAnalyzer **)(a1 + 232));
    MEMORY[0x263E5F2D0](v4, 0x1030C4081B690E0);
    *(void *)(a1 + 232) = 0;
  }
  uint64_t v5 = *(void **)(a1 + 216);
  if (v5)
  {
    freeProResFrame(v5);
    *(void *)(a1 + 216) = 0;
  }
  uint64_t v6 = *(void **)(a1 + 224);
  if (v6)
  {
    freeProResFrame(v6);
    *(void *)(a1 + 224) = 0;
  }
  uint64_t v7 = *(void *)(a1 + 272);
  if (v7)
  {
    MEMORY[0x263E5F2B0](v7, 0x1000C80BDFB0063);
    *(void *)(a1 + 272) = 0;
    *(_DWORD *)(a1 + 280) = 0;
  }
  if (a2 < 0x4651) {
    operator new[]();
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    ProResFrameReceiver::InitializeDoubleEncode();
  }
  uint64_t v8 = *(void *)(a1 + 232);
  if (v8)
  {
    ProResHWAnalyzer::~ProResHWAnalyzer(*(ProResHWAnalyzer **)(a1 + 232));
    MEMORY[0x263E5F2D0](v8, 0x1030C4081B690E0);
    *(void *)(a1 + 232) = 0;
  }
  int v9 = *(void **)(a1 + 216);
  if (v9)
  {
    freeProResFrame(v9);
    *(void *)(a1 + 216) = 0;
  }
  uint64_t v10 = *(void **)(a1 + 224);
  if (v10)
  {
    freeProResFrame(v10);
    *(void *)(a1 + 224) = 0;
  }
  uint64_t result = *(void *)(a1 + 272);
  if (result)
  {
    MEMORY[0x263E5F2B0](result, 0x1000C80BDFB0063);
    uint64_t result = 0;
    *(void *)(a1 + 272) = 0;
    *(_DWORD *)(a1 + 280) = 0;
  }
  return result;
}

void sub_262C0580C(_Unwind_Exception *a1)
{
  MEMORY[0x263E5F2D0](v1, 0x1030C4081B690E0);
  _Unwind_Resume(a1);
}

uint64_t allocateProResFrame()
{
  if (malloc_type_calloc(0x168uLL, 1uLL, 0xD02293D8uLL)) {
    operator new[]();
  }
  return 0;
}

uint64_t ProResFrameReceiver::SetOutOfOrderFrameProcessing(uint64_t this, char a2)
{
  *(unsigned char *)(this + 208) = a2;
  return this;
}

uint64_t ProResFrameReceiver::SetDynamicAlphaBitDepth(uint64_t this, char a2)
{
  *(unsigned char *)(this + 128) = a2;
  return this;
}

uint64_t ProResFrameReceiver::RegisterCallback(ProResFrameReceiver *this)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  inputStruct[0] = ProResFrameReceiver::FrameDone;
  inputStruct[1] = this;
  *(_OWORD *)reference = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v2 = IOConnectCallAsyncMethod(*((_DWORD *)this + 8), 1u, *((_DWORD *)this + 4), reference, 8u, 0, 0, inputStruct, 0x10uLL, 0, 0, 0, 0);
  if (v2)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      int v3 = *((_DWORD *)this + 75);
      *(_DWORD *)buf = 67109634;
      int v7 = v3;
      __int16 v8 = 2080;
      int v9 = "RegisterCallback";
      __int16 v10 = 1024;
      int v11 = v2;
      _os_log_impl(&dword_262BEC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AppleProResHW (0x%x): %s(): IOConnectCallAsyncMethod failed -> Dispatcher cannot be installed err 0x%x\n", buf, 0x18u);
    }
    ProResFrameReceiver::RemoveIODispatcherFromRunLoop(this);
  }
  return v2;
}

void ProResFrameReceiver::FrameDone(ProResFrameReceiver *this, void *a2, int32x4_t *a3, unint64_t *a4)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int32x4_t v12 = 0uLL;
  int v13 = 0;
  if (a3)
  {
    int v4 = (int)a4;
    unsigned int v6 = a3->i32[0];
    unsigned int v7 = a3->u32[2];
    unsigned int v8 = a3[1].u32[0];
    int v11 = a3[1].i64[1];
    int v9 = a3[2].i32[0];
    int v10 = a3[2].i32[2];
    if (v4 >= 8)
    {
      int32x4_t v12 = vuzp1q_s32(a3[3], a3[4]);
      int v13 = a3[5].i64[0];
    }
    ProResFrameReceiver::ProcessFrameDone(this, v7, v6, v8, v9, (UInt8 *)&v11, v10);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    ProResFrameReceiver::FrameDone();
  }
}

uint64_t ProResFrameReceiver::Setup(mach_port_t *this)
{
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  *(void *)this = Current;
  if (!Current)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ProResFrameReceiver::Setup();
    }
    return 3758097085;
  }
  int v3 = (ProResFrameReceiver *)ProResFrameReceiver::AddIODispatcherToRunLoop(this);
  if (v3)
  {
    uint64_t v4 = 3758097084;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ProResFrameReceiver::Setup();
    }
    return v4;
  }
  if (*((unsigned char *)this + 64)) {
    setpriority(3, 0, 4096);
  }
  else {
    ProResFrameReceiver::MakeCurrentThreadTimeConstraintThread(v3);
  }

  return ProResFrameReceiver::RegisterCallback((ProResFrameReceiver *)this);
}

uint64_t ProResFrameReceiver::AddIODispatcherToRunLoop(mach_port_t *this)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (!IOCreateReceivePort(0x39u, this + 4))
  {
    buf.versioint n = 1;
    buf.mach_timebase_info info = this;
    memset(&buf.retain, 0, 24);
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    uint64_t v5 = CFMachPortCreateWithPort((CFAllocatorRef)*MEMORY[0x263EFFB08], this[4], MEMORY[0x263F0EBE0], &buf, 0);
    *((void *)this + 3) = v5;
    if (v5)
    {
      RunLoopSource = CFMachPortCreateRunLoopSource(v4, v5, 0);
      *((void *)this + 1) = RunLoopSource;
      if (RunLoopSource)
      {
        CFRunLoopAddSource(*(CFRunLoopRef *)this, RunLoopSource, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
        return 0;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        mach_port_t v8 = this[75];
        int v10 = 67109378;
        mach_port_t v11 = v8;
        __int16 v12 = 2080;
        int v13 = "AddIODispatcherToRunLoop";
        _os_log_impl(&dword_262BEC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AppleProResHW (0x%x): %s(): ERROR: CFMachPortCreateRunLoopSource failed -> Dispatcher cannot be installed\n", (uint8_t *)&v10, 0x12u);
      }
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        mach_port_t v7 = this[75];
        int v10 = 67109634;
        mach_port_t v11 = v7;
        __int16 v12 = 2080;
        int v13 = "AddIODispatcherToRunLoop";
        __int16 v14 = 2048;
        uint64_t v15 = 0;
        _os_log_impl(&dword_262BEC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AppleProResHW (0x%x): %s(): ERROR: CFMachPortCreateWithPort failed m_CFAsyncPort %p\n", (uint8_t *)&v10, 0x1Cu);
      }
      *((void *)this + 3) = 0;
    }
    ProResFrameReceiver::RemoveIODispatcherFromRunLoop((ProResFrameReceiver *)this);
    return 3758097085;
  }
  uint64_t v2 = 3758097084;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    mach_port_t v3 = this[75];
    LODWORD(buf.version) = 67109378;
    HIDWORD(buf.version) = v3;
    LOWORD(buf.info) = 2080;
    *(void **)((char *)&buf.info + 2) = "AddIODispatcherToRunLoop";
    _os_log_impl(&dword_262BEC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AppleProResHW (0x%x): %s(): ERROR: IOCreateReceivePort failed -> Dispatcher cannot be installed\n", (uint8_t *)&buf, 0x12u);
  }
  return v2;
}

uint64_t ProResFrameReceiver::ChangeBackgroundPolicy(uint64_t this, int a2)
{
  if (*(unsigned __int8 *)(this + 64) != a2) {
    *(unsigned char *)(this + 64) = a2;
  }
  return this;
}

uint64_t stitchCallback(unsigned __int8 *a1, size_t offsetIntoDestination, size_t dataLength, CMBlockBufferRef *a4)
{
  uint64_t v4 = CMBlockBufferReplaceDataBytes(a1, *a4, offsetIntoDestination, dataLength);
  if (v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    stitchCallback();
  }
  return v4;
}

uint64_t ProResFrameReceiver::EmitPendingFrames(ProResFrameReceiver *this)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v1 = *((void *)this + 25);
  unsigned int v2 = *((_DWORD *)this + 48);
  uint64_t v3 = v2 % *((_DWORD *)this + 33);
  uint64_t v4 = v1 + 40 * v3;
  uint64_t v5 = 1;
  if (*(unsigned char *)v4)
  {
    int v22 = (int *)((char *)this + 300);
    while (1)
    {
      uint64_t v7 = v1 + 40 * v3;
      if (*(_DWORD *)(v7 + 4) != v2) {
        break;
      }
      int v8 = *(_DWORD *)(v7 + 16);
      uint64_t v9 = *(void *)(v7 + 8);
      if (v8 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        int v10 = *v22;
        int v11 = *(_DWORD *)(v9 + 56);
        *(_DWORD *)CFMachPortContext buf = 67109890;
        int v24 = v10;
        __int16 v25 = 2080;
        char v26 = "EmitPendingFrames";
        __int16 v27 = 1024;
        int v28 = v8;
        __int16 v29 = 1024;
        int v30 = v11;
        _os_log_impl(&dword_262BEC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AppleProResHW (0x%x): %s(): Emit to client status=0x%x for subFrameId=%d \n", buf, 0x1Eu);
      }
      int v12 = *(_DWORD *)(v9 + 4);
      kdebug_trace();
      if (v12 > 3)
      {
        if (*((void *)this + 6) == 2)
        {
          if (*((void *)this + 21))
          {
            char v20 = (void (*)(void))*((void *)this + 23);
            if (v20) {
              v20();
            }
          }
        }
        else
        {
          VTEncoderSessionEmitEncodedFrame();
        }
        kdebug_trace();
      }
      else
      {
        if (*((void *)this + 5) == 1)
        {
          if (*((void *)this + 18))
          {
            char v19 = (void (*)(void))*((void *)this + 20);
            if (v19) {
              v19();
            }
          }
        }
        else
        {
          VTDecoderSessionEmitDecodedFrame();
        }
        kdebug_trace();
        int v13 = *(__CVBuffer **)(v1 + 40 * v3 + 32);
        if (v13) {
          CVPixelBufferRelease(v13);
        }
        VTDecoderSessionCleanUpAfterDecode();
      }
      __int16 v14 = *(const void **)(v1 + 40 * v3 + 24);
      if (v14) {
        CFRelease(v14);
      }
      uint64_t v15 = *(const void **)(v9 + 40);
      if (v15) {
        CFRelease(v15);
      }
      uint64_t v16 = *(__CVBuffer **)(v9 + 72);
      if (v16) {
        CVPixelBufferRelease(v16);
      }
      uint64_t v17 = *(const void **)(v9 + 80);
      if (v17) {
        CFRelease(v17);
      }
      ++*((_DWORD *)this + 48);
      pthread_mutex_lock(*((pthread_mutex_t **)this + 13));
      bzero((void *)v9, 0x2F8uLL);
      **((unsigned char **)this + 12) = 1;
      pthread_cond_signal(*((pthread_cond_t **)this + 14));
      pthread_mutex_unlock(*((pthread_mutex_t **)this + 13));
      atomic_fetch_add(*((atomic_uint *volatile *)this + 9), 0xFFFFFFFF);
      pthread_mutex_lock(*((pthread_mutex_t **)this + 10));
      if (!atomic_load(*((unsigned int **)this + 9))) {
        pthread_cond_signal(*((pthread_cond_t **)this + 11));
      }
      pthread_mutex_unlock(*((pthread_mutex_t **)this + 10));
      *(_OWORD *)uint64_t v4 = 0u;
      *(_OWORD *)(v4 + 16) = 0u;
      *(void *)(v4 + 32) = 0;
      uint64_t v1 = *((void *)this + 25);
      unsigned int v2 = *((_DWORD *)this + 48);
      uint64_t v3 = v2 % *((_DWORD *)this + 33);
      uint64_t v4 = v1 + 40 * v3;
      if (!*(unsigned char *)v4) {
        return 1;
      }
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ProResFrameReceiver::EmitPendingFrames();
    }
    return 0;
  }
  return v5;
}

uint64_t alphaScalingTask(unsigned int *a1)
{
  int v2 = 0;
  uint64_t v3 = *(uint16x8_t **)a1;
  unint64_t v4 = a1[2];
  unsigned int v5 = a1[4];
  uint64_t v7 = (int *)*((void *)a1 + 3);
  unsigned int v6 = (pthread_cond_t *)*((void *)a1 + 4);
  unsigned int v8 = v4 & 0xFFFFFFF8;
  BOOL v9 = (v4 & 7) == 0 || v8 >= v4;
  int v10 = (pthread_mutex_t *)*((void *)a1 + 5);
  char v11 = v9;
  int v12 = v3 + 2;
  uint64_t v13 = a1[3] & 0xFFFFFFFE;
  do
  {
    if (v4 >= 0x21)
    {
      __int16 v14 = v12;
      for (unint64_t i = 32; i < v4; i += 32)
      {
        uint16x8_t v16 = vrsraq_n_u16(v14[-1], v14[-1], 8uLL);
        uint16x8_t v17 = vrsraq_n_u16(*v14, *v14, 8uLL);
        uint16x8_t v18 = vrsraq_n_u16(v14[1], v14[1], 8uLL);
        v14[-2] = vrsraq_n_u16(v14[-2], v14[-2], 8uLL);
        v14[-1] = v16;
        *__int16 v14 = v17;
        v14[1] = v18;
        v14 += 4;
      }
    }
    if ((v4 & 0x10) != 0)
    {
      char v19 = (uint16x8_t *)((char *)v3 + 2 * (int)(v4 & 0xFFFFFFE0));
      uint16x8_t v20 = vrsraq_n_u16(v19[1], v19[1], 8uLL);
      uint16x8_t *v19 = vrsraq_n_u16(*v19, *v19, 8uLL);
      v19[1] = v20;
      if ((v4 & 8) == 0)
      {
LABEL_13:
        if (v11) {
          goto LABEL_19;
        }
        goto LABEL_17;
      }
    }
    else if ((v4 & 8) == 0)
    {
      goto LABEL_13;
    }
    *(uint16x8_t *)((char *)v3 + 2 * (int)(v4 & 0xFFFFFFF0)) = vrsraq_n_u16(*(uint16x8_t *)((char *)v3 + 2 * (int)(v4 & 0xFFFFFFF0)), *(uint16x8_t *)((char *)v3 + 2 * (int)(v4 & 0xFFFFFFF0)), 8uLL);
    if (v11) {
      goto LABEL_19;
    }
LABEL_17:
    unsigned int v21 = v4 & 0xFFFFFFF8;
    uint64_t v22 = (int)v8;
    do
    {
      v3->i16[v22] += HIBYTE(v3->i16[v22]);
      ++v22;
      ++v21;
    }
    while (v4 > v21);
LABEL_19:
    uint64_t v3 = (uint16x8_t *)((char *)v3 + v13);
    ++v2;
    int v12 = (uint16x8_t *)((char *)v12 + v13);
  }
  while (v2 != 16);
  pthread_mutex_lock(v10);
  int v23 = *v7 + 1;
  *uint64_t v7 = v23;
  if (v23 == v5) {
    pthread_cond_signal(v6);
  }
  pthread_mutex_unlock(v10);
  MEMORY[0x263E5F2D0](a1, 0x1030C4096A05FA2);
  return 0;
}

uint64_t ProResFrameReceiver::getNumDoubleEncodeFrames(ProResFrameReceiver *this)
{
  return *((unsigned int *)this + 72);
}

uint64_t ProResFrameReceiver::getHasHWError(ProResFrameReceiver *this)
{
  return *((unsigned __int8 *)this + 292);
}

uint64_t ProResFrameReceiver::getIsNonCompliant(ProResFrameReceiver *this)
{
  return *((unsigned __int8 *)this + 293);
}

double getDoubleEncodeFrameRatio(unsigned int a1, unsigned int a2)
{
  if (!a2) {
    return 0.0;
  }
  *(float *)&double result = (float)a1 / (float)a2;
  return result;
}

uint64_t parseHWErrorCode(unsigned int a1, unsigned int a2, unsigned int a3, unsigned int a4, int a5)
{
  if (a5) {
    return 4294954385;
  }
  else {
    return 4294954384;
  }
}

uint64_t ProResFrameReceiver::ProcessFrameDone(ProResFrameReceiver *this, unsigned int a2, unsigned int a3, unsigned int a4, int a5, UInt8 *a6, int a7)
{
  kern_return_t v142;
  uint64_t i;
  void *v144;
  int v145;
  int v146;
  uint64_t v147;
  int v148;
  unsigned int v149;
  _DWORD *v150;
  __darwin_time_t tv_sec;
  char v152;
  size_t v153;
  void *sourceBytes;
  _DWORD *sourceBytesa;
  CFIndex length;
  _DWORD *v157;
  CFTypeRef cf;
  int *v159;
  __CVBuffer *texture;
  __IOSurface *v162;
  void *v163;
  int v164;
  timeval v165;
  timespec destinationBuffer;
  size_t extraRowsOnTop;
  size_t extraColumnsOnLeft;
  CMSampleBufferRef sampleBufferOut;
  unsigned char v170[64];
  long long v171;
  long long v172;
  long long v173;
  long long v174;
  long long v175;
  pthread_mutex_t buf[2];
  void *__p;
  void *v178;
  uint64_t v179;
  uint8_t v180[8];
  __int16 v181;
  const char *v182;
  uint64_t v183;

  unsigned __int32 v183 = *MEMORY[0x263EF8340];
  sampleBufferOut = 0;
  uint64_t v9 = *(void *)(*((void *)this + 7) + 16);
  int v10 = (_DWORD *)(v9 + 760 * a3);
  uint64_t v163 = v10;
  int v12 = v10[2];
  char v11 = v10 + 2;
  if (a2 >> (*((_DWORD *)this + 66) != 0) == v12)
  {
    uint64_t v17 = v9 + 760 * a3;
    int v19 = *(_DWORD *)(v17 + 4);
    uint16x8_t v18 = (int *)(v17 + 4);
    if (v19 <= 3 && *(_DWORD *)(v9 + 760 * a3 + 56) > *(_DWORD *)(v9 + 760 * a3 + 60))
    {
      uint64_t v20 = 3758097084;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        ProResFrameReceiver::ProcessFrameDone();
      }
      goto LABEL_265;
    }
    kdebug_trace();
    if (a4 <= 6 && ((1 << a4) & 0x46) != 0) {
      *((unsigned char *)this + 292) = 1;
    }
    CFNumberRef v157 = (_DWORD *)((char *)this + 300);
    CFNumberRef v159 = v18;
    if (*v18 <= 3)
    {
      uint64_t v21 = v9 + 760 * a3;
      int v23 = *(_DWORD *)(v21 + 56);
      int v22 = *(_DWORD *)(v21 + 60);
      int v24 = (int *)(v21 + 56);
      if (v23 + 1 != v22)
      {
        char v33 = *(const void **)(v9 + 760 * a3 + 40);
        int v34 = *(_DWORD *)a6;
        if (v23) {
          v34 += *((_DWORD *)this + 74);
        }
        int v35 = 0;
        CFNumberRef v162 = 0;
        *((_DWORD *)this + 74) = v34;
        CFTypeRef cf = v33;
        if (a4 && a4 != 6)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            int v37 = *v157;
            LODWORD(buf[0].__sig) = 67109634;
            HIDWORD(buf[0].__sig) = v37;
            *(_WORD *)buf[0].__opaque = 2080;
            *(void *)&buf[0].__opaque[2] = "ProcessFrameDone";
            *(_WORD *)&buf[0].__opaque[10] = 1024;
            *(_DWORD *)&buf[0].__opaque[12] = v23;
            _os_log_impl(&dword_262BEC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AppleProResHW (0x%x): %s(): DecoderHW error in subFrameId=%d\n", (uint8_t *)buf, 0x18u);
          }
          int v35 = 0;
          CFNumberRef v162 = 0;
          uint64_t v36 = 0;
          uint64_t v25 = 0;
          *((unsigned char *)this + 130) = 1;
        }
        else
        {
          uint64_t v36 = 0;
          uint64_t v25 = 0;
        }
        goto LABEL_249;
      }
      uint64_t v25 = 3758097084;
      texture = *(__CVBuffer **)(v9 + 760 * a3 + 48);
      CFTypeRef cf = *(CFTypeRef *)(v9 + 760 * a3 + 40);
      uint64_t v20 = 3758097110;
      switch(a4)
      {
        case 0u:
        case 6u:
          if (*((unsigned char *)this + 130))
          {
            if (a4 == 4) {
              unsigned int v26 = -536870173;
            }
            else {
              unsigned int v26 = -12911;
            }
            if (a4 == 3) {
              uint64_t v20 = 3758097110;
            }
            else {
              uint64_t v20 = v26;
            }
LABEL_53:
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
            {
              int v80 = *v157;
              LODWORD(buf[0].__sig) = 67110402;
              HIDWORD(buf[0].__sig) = v80;
              *(_WORD *)buf[0].__opaque = 1024;
              *(_DWORD *)&buf[0].__opaque[2] = 1135;
              *(_WORD *)&buf[0].__opaque[6] = 2080;
              *(void *)&buf[0].__opaque[8] = "ProcessFrameDone";
              *(_WORD *)&buf[0].__opaque[16] = 1024;
              *(_DWORD *)&buf[0].__opaque[18] = a4;
              *(_WORD *)&buf[0].__opaque[22] = 1024;
              *(_DWORD *)&buf[0].__opaque[24] = a5;
              *(_WORD *)&buf[0].__opaque[28] = 1024;
              *(_DWORD *)&buf[0].__opaque[30] = v20;
              _os_log_error_impl(&dword_262BEC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "ERROR: AppleProResHW (0x%x): %d: %s(): failed decoding proresStatus=%d HWErrorCode=0x%x convertedForEmit=0x%x\n", (uint8_t *)buf, 0x2Au);
            }
            if (texture) {
              CVPixelBufferRelease(texture);
            }
            texture = 0;
            *((unsigned char *)this + 130) = 0;
            goto LABEL_58;
          }
          if (texture)
          {
            int v61 = *(_DWORD *)a6;
            int v62 = (_DWORD *)((char *)this + 296);
            if (v23) {
              v61 += *v62;
            }
            *int v62 = v61;
            uint64_t v63 = *(void *)(v9 + 760 * a3 + 32);
            if ((v63 & 0x100000000) != 0)
            {
              if (v61 == v63) {
                *(_DWORD *)(v9 + 760 * a3 + 24) |= 0x10000u;
              }
            }
            else
            {
              CFNumberRef v64 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, v62);
              CVBufferSetAttachment(texture, @"ProResHW_CheckValue", v64, kCVAttachmentMode_ShouldPropagate);
              CFRelease(v64);
            }
            if (*(unsigned char *)(v9 + 760 * a3 + 65)
              && (CVPixelBufferGetPixelFormatType(texture) == 1651521076
               || CVPixelBufferGetPixelFormatType(texture) == 1651520304))
            {
              CVPixelBufferRef v81 = texture;
              CVPixelBufferLockBaseAddress(texture, 0);
              BaseAddress = (unsigned __int16 *)CVPixelBufferGetBaseAddress(texture);
              if (CVPixelBufferGetPixelFormatType(texture) == 1651521076)
              {
                unsigned int Width = CVPixelBufferGetWidth(texture);
                unsigned int Height = CVPixelBufferGetHeight(texture);
                unsigned int BytesPerRow = CVPixelBufferGetBytesPerRow(texture);
                swizzle64BGRAtoRGBA(BaseAddress, Width, Height, BytesPerRow);
              }
              else if (CVPixelBufferGetPixelFormatType(texture) == 1651520304)
              {
                int v95 = CVPixelBufferGetWidth(texture);
                int v96 = CVPixelBufferGetHeight(texture);
                unsigned int v97 = CVPixelBufferGetBytesPerRow(texture);
                CVPixelBufferRef v81 = texture;
                convert32BGRAtoRGB((uint64_t)BaseAddress, v95, v96, v97);
              }
              CVPixelBufferUnlockBaseAddress(v81, 0);
            }
            if (*(unsigned char *)(v9 + 760 * a3 + 64))
            {
              extraRowsOnTop = 0;
              extraColumnsOnLeft = 0;
              uint64_t v36 = texture;
              OSType PixelFormatType = CVPixelBufferGetPixelFormatType(texture);
              CFNumberRef v99 = APR_ImgFmt_4CC(PixelFormatType);
              if (v99[33] != 2)
              {
                if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
                {
                  ProResFrameReceiver::ProcessFrameDone();
                  goto LABEL_175;
                }
LABEL_176:
                int v35 = 0;
                CFNumberRef v162 = 0;
                goto LABEL_249;
              }
              if (*((_DWORD *)v99 + 6) == 2)
              {
                if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
                {
                  ProResFrameReceiver::ProcessFrameDone();
LABEL_175:
                  uint64_t v36 = texture;
                  goto LABEL_176;
                }
                goto LABEL_176;
              }
              CVPixelBufferLockBaseAddress(texture, 0);
              CVPixelBufferGetWidthOfPlane(texture, 2uLL);
              int HeightOfPlane = CVPixelBufferGetHeightOfPlane(texture, 2uLL);
              CVPixelBufferGetBytesPerRowOfPlane(texture, 2uLL);
              CVPixelBufferGetBaseAddressOfPlane(texture, 2uLL);
              CVPixelBufferGetExtendedPixels(texture, &extraColumnsOnLeft, 0, &extraRowsOnTop, 0);
              if (!*((void *)this + 17)) {
                operator new();
              }
              int v164 = 0;
              pthread_cond_init((pthread_cond_t *)v170, 0);
              pthread_mutex_init(buf, 0);
              unsigned int v106 = HeightOfPlane + 15;
              unsigned int v107 = (HeightOfPlane + 15) >> 4;
              if (v106 >= 0x10) {
                operator new();
              }
              pthread_mutex_lock(buf);
              gettimeofday(&v165, 0);
              destinationBuffer.tv_sec = v165.tv_sec + 3;
              destinationBuffer.tv_nsec = 1000 * v165.tv_usec;
              if (v164 == v107)
              {
                pthread_mutex_unlock(buf);
              }
              else
              {
                do
                  int v108 = pthread_cond_timedwait((pthread_cond_t *)v170, buf, &destinationBuffer);
                while (v164 != v107 && v108 == 0);
                BOOL v110 = v108 == 0;
                pthread_mutex_unlock(buf);
                if (!v110 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
                {
                  int v111 = *v157;
                  *(_DWORD *)uint64_t v180 = 67109378;
                  *(_DWORD *)&v180[4] = v111;
                  int8x16_t v181 = 2080;
                  unsigned int v182 = "ProcessFrameDone";
                  _os_log_impl(&dword_262BEC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AppleProResHW (0x%x): %s(): ERROR: threadpool couldn't complete AlphaScalingTask", v180, 0x12u);
                }
              }
              pthread_cond_destroy((pthread_cond_t *)v170);
              pthread_mutex_destroy(buf);
              CVPixelBufferUnlockBaseAddress(texture, 0);
            }
          }
          else
          {
            texture = 0;
          }
          uint64_t v20 = 0;
LABEL_58:
          if (*((_DWORD *)this + 48) != a2 && *((unsigned char *)this + 208))
          {
            unsigned int v42 = a2 % *((_DWORD *)this + 33);
            uint64_t v43 = *((void *)this + 25);
            uint8x8_t v44 = (unsigned char *)(v43 + 40 * v42);
            if (*v44)
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
              {
                int v45 = *v157;
                LODWORD(buf[0].__sig) = 67109634;
                HIDWORD(buf[0].__sig) = v45;
                *(_WORD *)buf[0].__opaque = 2080;
                *(void *)&buf[0].__opaque[2] = "ProcessFrameDone";
                *(_WORD *)&buf[0].__opaque[10] = 1024;
                *(_DWORD *)&buf[0].__opaque[12] = a2;
                _os_log_impl(&dword_262BEC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AppleProResHW (0x%x): %s(): Spot isn't empty for frame %d, do you need to increase size?", (uint8_t *)buf, 0x18u);
              }
            }
            else
            {
              uint64_t v65 = v43 + 40 * v42;
              *(void *)(v65 + 8) = v163;
              *(void *)(v65 + 32) = texture;
              *(_DWORD *)(v65 + 16) = v20;
              *(_DWORD *)(v65 + 4) = a2;
              unsigned char *v44 = 1;
            }
            goto LABEL_265;
          }
          if (v20 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            int v46 = *v157;
            int v47 = *v24;
            LODWORD(buf[0].__sig) = 67109890;
            HIDWORD(buf[0].__sig) = v46;
            *(_WORD *)buf[0].__opaque = 2080;
            *(void *)&buf[0].__opaque[2] = "ProcessFrameDone";
            *(_WORD *)&buf[0].__opaque[10] = 1024;
            *(_DWORD *)&buf[0].__opaque[12] = v20;
            *(_WORD *)&buf[0].__opaque[16] = 1024;
            *(_DWORD *)&buf[0].__opaque[18] = v47;
            _os_log_impl(&dword_262BEC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AppleProResHW (0x%x): %s(): Emit to client status=0x%x for subFrameId=%d \n", (uint8_t *)buf, 0x1Eu);
          }
          kdebug_trace();
          if (*((void *)this + 5) == 1)
          {
            if (*((void *)this + 18))
            {
              int v48 = (void (*)(void))*((void *)this + 20);
              if (v48) {
                v48();
              }
            }
          }
          else
          {
            VTDecoderSessionEmitDecodedFrame();
          }
          kdebug_trace();
          ++*((_DWORD *)this + 48);
          if (*((unsigned char *)this + 208) && (ProResFrameReceiver::EmitPendingFrames(this) & 1) == 0)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              ProResFrameReceiver::ProcessFrameDone();
            }
            CFNumberRef v162 = 0;
            int v35 = 1;
            goto LABEL_248;
          }
          CFNumberRef v162 = 0;
          int v35 = 1;
LABEL_247:
          uint64_t v25 = v20;
LABEL_248:
          uint64_t v36 = texture;
LABEL_249:
          if (sampleBufferOut) {
            CFRelease(sampleBufferOut);
          }
          if (cf) {
            CFRelease(cf);
          }
          if (v36) {
            CVPixelBufferRelease(v36);
          }
          if (v35) {
            VTDecoderSessionCleanUpAfterDecode();
          }
          if (*v159 >= 4) {
            freeEncodeStatsBuffers(v9 + 760 * a3 + 312, 0);
          }
          pthread_mutex_lock(*((pthread_mutex_t **)this + 13));
          bzero(v163, 0x2F8uLL);
          **((unsigned char **)this + 12) = 1;
          pthread_cond_signal(*((pthread_cond_t **)this + 14));
          pthread_mutex_unlock(*((pthread_mutex_t **)this + 13));
          uint64_t v20 = v25;
          goto LABEL_260;
        case 3u:
          goto LABEL_53;
        case 4u:
          uint64_t v20 = 3758097123;
          goto LABEL_53;
        default:
          uint64_t v20 = 4294954385;
          goto LABEL_53;
      }
    }
    unsigned __int32 v178 = 0;
    std::string __p = 0;
    unint64_t v179 = 0;
    uint64_t v27 = v9 + 760 * a3;
    texture = *(__CVBuffer **)(v27 + 72);
    CFTypeRef cf = *(CFTypeRef *)(v27 + 80);
    if (a7) {
      BOOL v28 = *((unsigned char *)this + 129) == 0;
    }
    else {
      BOOL v28 = 1;
    }
    char v29 = !v28;
    *((unsigned char *)this + 129) = v29;
    uint64_t v20 = 3758097110;
    switch(a4)
    {
      case 0u:
      case 5u:
        CFNumberRef v162 = IOSurfaceLookup(*(_DWORD *)(v9 + 760 * a3 + 104));
        int v30 = (unsigned __int16 *)IOSurfaceGetBaseAddress(v162);
        uint64_t v31 = (uint64_t)v30;
        *(void *)uint64_t v180 = 0;
        if (*(unsigned char *)(v9 + 760 * a3 + 168)) {
          unint64_t v32 = 148;
        }
        else {
          unint64_t v32 = (*(unsigned __int8 *)v30 << 24) | ((unint64_t)*((unsigned __int8 *)v30 + 1) << 16) | ((unint64_t)*((unsigned __int8 *)v30 + 2) << 8) | *((unsigned __int8 *)v30 + 3);
        }
        *(void *)uint64_t v180 = v32;
        int v38 = parseFrameHeader((uint64_t)buf, v30 + 4, *((_DWORD *)this + 76), *((_DWORD *)this + 75));
        if (v38)
        {
          if (v38 != -536870191)
          {
            ProResFrameReceiver::ProcessFrameDone((uint64_t)v157, (uint64_t)v11, v38);
            snprintf(v170, 0x50uLL, "ERROR: AppleProResHW (0x%x): %s(): F# %d: FrameParse error, the bitstream is corrupted, crashing system\n", *v157, "ProcessFrameDone", *v11);
            CFNumberRef v147 = _os_crash();
            ProResFrameReceiver::ProcessFrameDone(v147);
          }
          *((unsigned char *)this + 293) = 1;
        }
        uint64_t v39 = v9 + 760 * a3;
        if (*(_DWORD *)(v39 + 132))
        {
          int v40 = *((_DWORD *)this + 66);
          if (v40)
          {
            length = 4;
            goto LABEL_79;
          }
          freeEncodeStatsBuffers(v39 + 112, 0);
          uint64_t v41 = 20;
        }
        else
        {
          uint64_t v41 = 4;
        }
        int v40 = *((_DWORD *)this + 66);
        length = v41;
        if (!v40)
        {
          int v59 = 1;
          goto LABEL_135;
        }
LABEL_79:
        uint64_t v49 = v9 + 760 * a3;
        int v51 = *(_DWORD *)(v49 + 200);
        uint64_t v50 = (unsigned char *)(v49 + 200);
        v50[466] = 0;
        if (v51)
        {
          if (v40 != 3)
          {
            if (!*((_DWORD *)this + 70))
            {
              int v59 = 0;
              CFNumberRef v79 = (unsigned __int8 *)(v31 + ((unint64_t)*(unsigned int *)(v9 + 760 * a3 + 28) >> 2));
              *(void *)uint64_t v180 = (*v79 << 24) | ((unint64_t)v79[1] << 16) | ((unint64_t)v79[2] << 8) | v79[3];
              goto LABEL_135;
            }
            int v164 = 0;
            int v57 = *(_DWORD *)(v9 + 760 * a3 + 652);
            kdebug_trace();
            int v58 = *((_DWORD *)this + 66);
            if (v58 == 1)
            {
              ProResHWAnalyzer::parseProResFrame(*((int **)this + 29), v31 + ((unint64_t)*(unsigned int *)(v9 + 760 * a3 + 28) >> 2), *((void *)this + 28), 0);
            }
            else
            {
              if (v58 != 2)
              {
                if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                  ProResFrameReceiver::ProcessFrameDone();
                }
                goto LABEL_238;
              }
              *(void *)int v170 = 0;
              destinationBuffer.tv_sec = 0;
              v165.tv_sec = 0;
              extraRowsOnTop = 0;
              extraColumnsOnLeft = 0;
              getEncodeStatsPtrs((unsigned int *)(v9 + 760 * a3 + 312), &destinationBuffer, v170, &v165, &extraColumnsOnLeft, &extraRowsOnTop);
              ProResHWAnalyzer::parseHWStats(*((ProResHWAnalyzer **)this + 29), *((void *)this + 28), *(void **)v170, (unsigned __int16 *)v165.tv_sec, extraColumnsOnLeft, *((_DWORD *)this + 71), *(unsigned __int16 *)(v9 + 760 * a3 + 256), *(unsigned __int16 *)(v9 + 760 * a3 + 260), *(_DWORD *)(v9 + 760 * a3 + 220), *(_DWORD *)(v9 + 760 * a3 + 524));
            }
            *(void *)uint64_t v180 = ProResHWAnalyzer::getSliceToFix(*((void *)this + 29), v57 + 156, *((unsigned int **)this + 27), *((void *)this + 28), *((void *)this + 34), &v164);
            kdebug_trace();
          }
          int v59 = 0;
          goto LABEL_135;
        }
        uint64_t v52 = *((void *)this + 27);
        size_t v53 = *((unsigned int *)this + 71);
        bzero(*(void **)(v52 + 48), v53);
        bzero(*(void **)(v52 + 56), 2 * v53);
        bzero(*(void **)(v52 + 320), v53);
        bzero(*(void **)(v52 + 328), v53);
        bzero(*(void **)(v52 + 336), v53);
        bzero(*(void **)(v52 + 344), 2 * v53);
        *(_OWORD *)(v52 + 288) = 0u;
        *(_OWORD *)(v52 + 304) = 0u;
        *(_OWORD *)(v52 + 256) = 0u;
        *(_OWORD *)(v52 + 272) = 0u;
        *(_OWORD *)(v52 + 224) = 0u;
        *(_OWORD *)(v52 + 240) = 0u;
        *(_OWORD *)(v52 + 192) = 0u;
        *(_OWORD *)(v52 + 208) = 0u;
        *(_OWORD *)(v52 + 160) = 0u;
        *(_OWORD *)(v52 + 176) = 0u;
        *(_OWORD *)(v52 + 128) = 0u;
        *(_OWORD *)(v52 + 144) = 0u;
        *(_OWORD *)(v52 + 96) = 0u;
        *(_OWORD *)(v52 + 112) = 0u;
        *(_OWORD *)(v52 + 64) = 0u;
        *(_OWORD *)(v52 + 80) = 0u;
        bzero(*(void **)(v52 + 352), 2 * v53);
        uint64_t v54 = *((void *)this + 28);
        size_t v55 = *((unsigned int *)this + 71);
        bzero(*(void **)(v54 + 48), v55);
        bzero(*(void **)(v54 + 56), 2 * v55);
        bzero(*(void **)(v54 + 320), v55);
        bzero(*(void **)(v54 + 328), v55);
        bzero(*(void **)(v54 + 336), v55);
        bzero(*(void **)(v54 + 344), 2 * v55);
        *(_OWORD *)(v54 + 288) = 0u;
        *(_OWORD *)(v54 + 304) = 0u;
        *(_OWORD *)(v54 + 256) = 0u;
        *(_OWORD *)(v54 + 272) = 0u;
        *(_OWORD *)(v54 + 224) = 0u;
        *(_OWORD *)(v54 + 240) = 0u;
        *(_OWORD *)(v54 + 192) = 0u;
        *(_OWORD *)(v54 + 208) = 0u;
        *(_OWORD *)(v54 + 160) = 0u;
        *(_OWORD *)(v54 + 176) = 0u;
        *(_OWORD *)(v54 + 128) = 0u;
        *(_OWORD *)(v54 + 144) = 0u;
        *(_OWORD *)(v54 + 96) = 0u;
        *(_OWORD *)(v54 + 112) = 0u;
        *(_OWORD *)(v54 + 64) = 0u;
        *(_OWORD *)(v54 + 80) = 0u;
        bzero(*(void **)(v54 + 352), 2 * v55);
        destinationBuffer.tv_sec = 0;
        v165.tv_sec = 0;
        extraColumnsOnLeft = 0;
        kdebug_trace();
        int v56 = *((_DWORD *)this + 66);
        if ((v56 - 2) >= 2)
        {
          if (v56 != 1)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              ProResFrameReceiver::ProcessFrameDone();
            }
            goto LABEL_238;
          }
          ProResHWAnalyzer::parseProResFrame(*((int **)this + 29), v31, *((void *)this + 27), 1);
        }
        else
        {
          *(void *)int v170 = 0;
          extraRowsOnTop = 0;
          getEncodeStatsPtrs((unsigned int *)(v9 + 760 * a3 + 312), &extraColumnsOnLeft, v170, &extraRowsOnTop, &destinationBuffer, &v165);
          ProResHWAnalyzer::parseHWStats(*((ProResHWAnalyzer **)this + 29), *((void *)this + 27), *(void **)v170, (unsigned __int16 *)extraRowsOnTop, destinationBuffer.tv_sec, *((_DWORD *)this + 71), *(unsigned __int16 *)(v9 + 760 * a3 + 256), *(unsigned __int16 *)(v9 + 760 * a3 + 260), *(_DWORD *)(v9 + 760 * a3 + 220), *(_DWORD *)(v9 + 760 * a3 + 524));
        }
        kdebug_trace();
        uint64_t v60 = *((void *)this + 27);
        if (*(unsigned char *)(v60 + 11))
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            ProResFrameReceiver::ProcessFrameDone();
          }
          goto LABEL_238;
        }
        CFNumberRef v150 = (_DWORD *)((char *)this + 284);
        if (ProResHWAnalyzer::verifySliceSetup(*((void *)this + 29), v60))
        {
          kdebug_trace();
          sourceBytes = (void *)v31;
          *((_DWORD *)this + 70) = 0;
          bzero(*((void **)this + 34), 2 * *((unsigned int *)this + 71));
          unsigned int v66 = 0;
          CFNumberRef v152 = 0;
          int v174 = 0u;
          uint64_t v175 = 0u;
          unsigned int v172 = 0u;
          uint64_t v173 = 0u;
          __int16 v171 = 0u;
          memset(v170, 0, sizeof(v170));
          LOBYTE(extraRowsOnTop) = 6;
          unsigned int v67 = (unsigned int *)(v9 + 760 * a3 + 652);
          do
          {
            unsigned int v68 = ProResHWAnalyzer::analyzeProResFrame(*((void *)this + 29), *((void *)this + 27), (SliceList *)v170, (unsigned __int8 *)&extraRowsOnTop);
            if (extraRowsOnTop <= 8u)
            {
              unsigned int v69 = 127 - 127 * **((_DWORD **)this + 27) / v68;
              if (v69 >= 0x28) {
                LOBYTE(v69) = 40;
              }
              CFNumberRef v152 = v69;
            }
            unsigned int v70 = *v67;
            if (v68 == v66 || v68 < v70) {
              break;
            }
            LOBYTE(extraRowsOnTop) = extraRowsOnTop + 1;
            unsigned int v66 = v68;
          }
          while (extraRowsOnTop <= 0xFu);
          int v72 = (((void)v172 - *((void *)&v171 + 1)) >> 2)
              + ((*(void *)&v170[8] - *(void *)v170) >> 2)
              + ((*(void *)&v170[32] - *(void *)&v170[24]) >> 2)
              + ((*((void *)&v173 + 1) - (void)v173) >> 2);
          *((_DWORD *)this + 70) = v72;
          if (v72)
          {
            SliceList::sort((SliceList *)v170, *((unsigned __int16 **)this + 34), *(_DWORD *)(*((void *)this + 29) + 28) == 1);
            int v73 = *((_DWORD *)this + 66);
            if (v73 == 3)
            {
              unsigned int v123 = *v67;
              unsigned int v124 = **((_DWORD **)this + 27);
              memcpy((void *)v165.tv_sec, (const void *)destinationBuffer.tv_sec, *((unsigned int *)this + 71));
              if (*((_DWORD *)this + 71))
              {
                unint64_t v125 = 0;
                CFNumberRef v149 = v123 + 156;
                do
                {
                  uint64_t v126 = *((void *)this + 34);
                  uint64_t v127 = *(unsigned __int16 *)(v126 + 2 * v125);
                  int EstimatedSizeForSlice = ProResHWAnalyzer::getEstimatedSizeForSlice(*((ProResHWAnalyzer **)this + 29), (unsigned __int8 *)extraColumnsOnLeft, *(unsigned __int16 *)(v126 + 2 * v125), *(unsigned __int8 *)(v9 + 760 * a3 + 372), extraRowsOnTop);
                  uint64_t v129 = *((void *)this + 27);
                  *(_WORD *)(*(void *)(v129 + 352) + 2 * v127) = EstimatedSizeForSlice;
                  int v130 = EstimatedSizeForSlice - *(unsigned __int16 *)(*(void *)(v129 + 56) + 2 * v127);
                  if (v130 >= 1)
                  {
                    v124 += v130;
                    if (v124 > v149) {
                      break;
                    }
                    *(unsigned char *)(v165.tv_sec + v127) = extraRowsOnTop;
                  }
                  ++v125;
                }
                while (v125 < *v150);
              }
            }
            else
            {
              if (v73 == 2 && *v150)
              {
                unint64_t v74 = 0;
                do
                {
                  uint64_t v75 = *((void *)this + 34);
                  uint64_t v76 = *(unsigned __int16 *)(v75 + 2 * v74);
                  *(_WORD *)(*(void *)(*((void *)this + 27) + 352) + 2 * v76) = ProResHWAnalyzer::getEstimatedSizeForSlice(*((ProResHWAnalyzer **)this + 29), (unsigned __int8 *)extraColumnsOnLeft, *(unsigned __int16 *)(v75 + 2 * v74++), *(unsigned __int8 *)(v9 + 760 * a3 + 372), extraRowsOnTop);
                }
                while (v74 < *((unsigned int *)this + 71));
              }
              *(unsigned char *)(v9 + 760 * a3 + 372) = extraRowsOnTop;
            }
            uint64_t v77 = v9 + 760 * a3;
            *(unsigned char *)(v77 + 219) = 1;
            *(unsigned char *)(v77 + 210) = 0;
            uint64_t v31 = (uint64_t)sourceBytes;
          }
          else
          {
            if ((*((_DWORD *)this + 66) - 1) <= 2)
            {
              pthread_mutex_lock(*((pthread_mutex_t **)this + 31));
              **((unsigned char **)this + 30) = v152 | 0x80;
              pthread_cond_signal(*((pthread_cond_t **)this + 32));
              pthread_mutex_unlock(*((pthread_mutex_t **)this + 31));
              kdebug_trace();
              uint64_t v20 = 0;
              int v104 = 20;
              goto LABEL_298;
            }
            CFNumberRef v131 = (int32x2_t *)(v9 + 760 * a3);
            uint32x2_t v132 = vshr_n_u32((uint32x2_t)vadd_s32(v131[32], (int32x2_t)0xF0000000FLL), 4uLL);
            int v133 = 8 * *(_DWORD *)(*((void *)this + 27) + 40) * v132.i32[1] + 8;
            int v134 = v131[81].i32[0] - v133;
            if (v134 <= 1) {
              int v134 = 1;
            }
            signed int v135 = 8 * (v134 / (v132.i32[1] * v132.i32[0]));
            if (v135 >= 0x10000) {
              signed int v135 = 0x3FFF;
            }
            v131[48].i32[0] = v135;
            int v136 = v70 - v133;
            if (v136 <= 1) {
              int v136 = 1;
            }
            signed int v137 = 8 * (v136 / (v132.i32[1] * v132.i32[0]));
            if (v137 >= 0x10000) {
              signed int v137 = 0x3FFF;
            }
            v131[47].i32[1] = v137;
          }
          kdebug_trace();
          int v138 = *(_DWORD *)v50 + 1;
          *(_DWORD *)uint64_t v50 = v138;
          *(_WORD *)(v9 + 760 * a3 + 208) = v138;
          int v139 = *((_DWORD *)this + 66);
          if (v139 == 3)
          {
            uint64_t v140 = 1;
          }
          else
          {
            CFNumberRef v141 = (_DWORD *)(v9 + 760 * a3);
            v141[92] = v141[7] >> 2;
            v141[94] *= 3;
            if (v139 == 1)
            {
              uint64_t v140 = 0;
            }
            else
            {
              if (v139 != 2)
              {
                if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
                {
                  ProResFrameReceiver::ProcessFrameDone();
                  goto LABEL_296;
                }
LABEL_297:
                int v104 = 3;
                uint64_t v20 = 3758097084;
                goto LABEL_298;
              }
              uint64_t v140 = 0x100000000;
            }
          }
          *(void *)(v9 + 760 * a3 + 240) = v140;
          atomic_fetch_add(*((atomic_uint *volatile *)this + 9), 1u);
          kdebug_trace();
          CFNumberRef v142 = IOConnectCallStructMethod(*((_DWORD *)this + 8), 3u, v50, 0x1E8uLL, 0, 0);
          kdebug_trace();
          ++*((_DWORD *)this + 72);
          if (v142)
          {
            atomic_fetch_add(*((atomic_uint *volatile *)this + 9), 0xFFFFFFFF);
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
            {
              ProResFrameReceiver::ProcessFrameDone();
LABEL_296:
              int v104 = 3;
              uint64_t v20 = 3758097084;
              uint64_t v31 = (uint64_t)sourceBytes;
              goto LABEL_298;
            }
            goto LABEL_297;
          }
          pthread_mutex_lock(*((pthread_mutex_t **)this + 31));
          **((unsigned char **)this + 30) = v152 | 0x80;
          pthread_cond_signal(*((pthread_cond_t **)this + 32));
          pthread_mutex_unlock(*((pthread_mutex_t **)this + 31));
          uint64_t v20 = 0;
          int v104 = 22;
LABEL_298:
          for (unint64_t i = 0; i != -144; i -= 24)
          {
            CFNumberRef v144 = *(void **)((char *)&v174 + i + 8);
            if (v144)
            {
              *(void *)((char *)&v175 + i) = v144;
              operator delete(v144);
            }
          }
          int v59 = 1;
          if (v104 != 20)
          {
LABEL_241:
            if (__p)
            {
              unsigned __int32 v178 = __p;
              operator delete(__p);
            }
            int v35 = 0;
            if (v104 > 2)
            {
              if (v104 != 3)
              {
LABEL_260:
                if (v162) {
                  CFRelease(v162);
                }
                atomic_fetch_add(*((atomic_uint *volatile *)this + 9), 0xFFFFFFFF);
                pthread_mutex_lock(*((pthread_mutex_t **)this + 10));
                if (!atomic_load(*((unsigned int **)this + 9))) {
                  pthread_cond_signal(*((pthread_cond_t **)this + 11));
                }
                pthread_mutex_unlock(*((pthread_mutex_t **)this + 10));
                goto LABEL_265;
              }
            }
            else if (v104)
            {
              goto LABEL_265;
            }
            goto LABEL_247;
          }
LABEL_135:
          CFNumberRef v148 = v59;
          sourceBytesa = (_DWORD *)v31;
          kdebug_trace();
          destinationBuffer.tv_sec = 0;
          uint64_t v86 = v9 + 760 * a3;
          uint64_t v87 = *(void *)(v86 + 176);
          uint64_t v89 = *(void *)(v86 + 184);
          CFNumberRef v88 = (const void **)(v86 + 176);
          size_t v90 = v89 - v87;
          CFNumberRef v153 = v89 - v87 + *(void *)v180;
          v165.tv_sec = (v153 + 15) & 0xFFFFFFFFFFFFFFF0;
          tv_sec = v165.tv_sec;
          if (*((void *)this + 6) == 2) {
            uint64_t CMBlockBuffer = CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, (v153 + 15) & 0xFFFFFFFFFFFFFFF0, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0, 0, (v153 + 15) & 0xFFFFFFFFFFFFFFF0, 1u, (CMBlockBufferRef *)&destinationBuffer);
          }
          else {
            uint64_t CMBlockBuffer = VTEncoderSessionCreateCMBlockBuffer();
          }
          uint64_t v20 = CMBlockBuffer;
          if (CMBlockBuffer) {
            goto LABEL_218;
          }
          int v92 = *((_DWORD *)this + 66);
          if ((v92 - 1) >= 2)
          {
            if (v92 == 3)
            {
              uint64_t v20 = CMBlockBufferReplaceDataBytes(sourceBytesa, (CMBlockBufferRef)destinationBuffer.tv_sec, 0, *(size_t *)v180);
              if (v20 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                ProResFrameReceiver::ProcessFrameDone();
              }
              goto LABEL_180;
            }
            uint64_t v20 = CMBlockBufferReplaceDataBytes(sourceBytesa, (CMBlockBufferRef)destinationBuffer.tv_sec, 0, *(size_t *)v180);
            if (v20 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              ProResFrameReceiver::ProcessFrameDone();
            }
            BOOL v28 = v89 == v87;
            CFNumberRef v93 = sourceBytesa;
            if (!v28)
            {
              OSStatus v94 = CMBlockBufferReplaceDataBytes(*v88, (CMBlockBufferRef)destinationBuffer.tv_sec, *(size_t *)v180, v90);
              if (v94 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
              {
                CFNumberRef v146 = *v157;
                *(_DWORD *)int v170 = 67110402;
                *(_DWORD *)&v170[4] = v146;
                *(_WORD *)&v170[8] = 1024;
                *(_DWORD *)&v170[10] = 1921;
                *(_WORD *)&v170[14] = 2080;
                *(void *)&v170[16] = "ProcessFrameDone";
                *(_WORD *)&v170[24] = 1024;
                *(_DWORD *)&v170[26] = v94;
                *(_WORD *)&v170[30] = 2048;
                *(void *)&v170[32] = *(void *)v180;
                *(_WORD *)&v170[40] = 2048;
                *(void *)&v170[42] = v90;
                _os_log_error_impl(&dword_262BEC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "ERROR: AppleProResHW (0x%x): %d: %s(): failed Non DoubleEnc metadata extension CMBlockBufferReplaceDataBytes (0x%x) offset=%lu length=%zu\n", v170, 0x32u);
              }
              *sourceBytesa = bswap32(v153);
              uint64_t v20 = CMBlockBufferReplaceDataBytes(sourceBytesa, (CMBlockBufferRef)destinationBuffer.tv_sec, 0, 4uLL);
              if (v20 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                ProResFrameReceiver::ProcessFrameDone();
              }
              goto LABEL_180;
            }
          }
          else if (v148)
          {
            CFNumberRef v93 = sourceBytesa;
            uint64_t v20 = CMBlockBufferReplaceDataBytes(sourceBytesa, (CMBlockBufferRef)destinationBuffer.tv_sec, 0, *(size_t *)v180);
            if (v20 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
            {
              ProResFrameReceiver::ProcessFrameDone();
LABEL_180:
              CFNumberRef v93 = sourceBytesa;
            }
          }
          else
          {
            CFNumberRef v93 = sourceBytesa;
            if (*((_DWORD *)this + 70))
            {
              kdebug_trace();
              uint64_t v20 = ProResHWAnalyzer::stitchProResFrame(*((void *)this + 29), *((void *)this + 27), (unsigned __int8 *)sourceBytesa, *((void *)this + 28), (uint64_t)sourceBytesa + ((unint64_t)*(unsigned int *)(v9 + 760 * a3 + 28) >> 2), v180, (uint64_t (*)(unsigned __int8 *, unsigned int, unsigned int, void *))stitchCallback, &destinationBuffer);
              if (v20 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
              {
                ProResFrameReceiver::ProcessFrameDone();
                CFNumberRef v93 = sourceBytesa;
              }
              kdebug_trace();
            }
            else
            {
              uint64_t v20 = CMBlockBufferReplaceDataBytes((char *)sourceBytesa + ((unint64_t)*(unsigned int *)(v9 + 760 * a3 + 28) >> 2), (CMBlockBufferRef)destinationBuffer.tv_sec, 0, *(size_t *)v180);
              if (v20 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
              {
                ProResFrameReceiver::ProcessFrameDone();
                goto LABEL_180;
              }
            }
          }
          if (tv_sec == v153)
          {
            if (v20)
            {
LABEL_217:
              CFRelease((CFTypeRef)destinationBuffer.tv_sec);
LABEL_218:
              if (sampleBufferOut)
              {
                CFArrayRef SampleAttachmentsArray = CMSampleBufferGetSampleAttachmentsArray(sampleBufferOut, 1u);
                ValueAtIndex = (__CFDictionary *)CFArrayGetValueAtIndex(SampleAttachmentsArray, 0);
                setDataForProperty(ValueAtIndex, @"ProResHW_CheckValue", a6, length);
              }
              kdebug_trace();
              goto LABEL_221;
            }
          }
          else
          {
            OSStatus v100 = CMBlockBufferFillDataBytes(0, (CMBlockBufferRef)destinationBuffer.tv_sec, v153, tv_sec - v153);
            if (v100 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
            {
              CFNumberRef v145 = *v157;
              *(_DWORD *)int v170 = 67110402;
              *(_DWORD *)&v170[4] = v145;
              *(_WORD *)&v170[8] = 1024;
              *(_DWORD *)&v170[10] = 1940;
              *(_WORD *)&v170[14] = 2080;
              *(void *)&v170[16] = "ProcessFrameDone";
              *(_WORD *)&v170[24] = 1024;
              *(_DWORD *)&v170[26] = v100;
              *(_WORD *)&v170[30] = 2048;
              *(void *)&v170[32] = v153;
              *(_WORD *)&v170[40] = 2048;
              *(void *)&v170[42] = tv_sec - v153;
              _os_log_error_impl(&dword_262BEC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "ERROR: AppleProResHW (0x%x): %d: %s(): failed adding stuffing value(0x0) CMBlockBufferFillDataBytes (0x%x) offset=%zu length=%zu\n", v170, 0x32u);
            }
            *CFNumberRef v93 = BYTE3(v165.tv_sec);
            v93[1] = BYTE2(v165.tv_sec);
            v93[2] = BYTE1(v165.tv_sec);
            v93[3] = v165.tv_sec;
            uint64_t v20 = CMBlockBufferReplaceDataBytes(v93, (CMBlockBufferRef)destinationBuffer.tv_sec, 0, 4uLL);
            if (v20)
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                ProResFrameReceiver::ProcessFrameDone();
              }
              goto LABEL_217;
            }
          }
          if (*v159 == 4) {
            goto LABEL_193;
          }
          if (a7)
          {
            if (*((unsigned char *)this + 129))
            {
LABEL_193:
              CFAllocatorRef v101 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
              CFNumberRef v102 = (OpaqueCMBlockBuffer *)destinationBuffer.tv_sec;
LABEL_194:
              CFNumberRef v103 = (CMFormatDescriptionRef *)(v9 + 760 * a3 + 88);
LABEL_214:
              uint64_t v20 = CMSampleBufferCreateReady(v101, v102, *v103, 1, 1, (const CMSampleTimingInfo *)(v9 + 760 * a3 + 688), 1, (const size_t *)&v165, &sampleBufferOut);
              if (v20 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
              {
                int v112 = *v157;
                *(_DWORD *)int v170 = 67109634;
                *(_DWORD *)&v170[4] = v112;
                *(_WORD *)&v170[8] = 2080;
                *(void *)&v170[10] = "ProcessFrameDone";
                *(_WORD *)&v170[18] = 1024;
                *(_DWORD *)&v170[20] = v20;
                _os_log_impl(&dword_262BEC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AppleProResHW (0x%x): %s(): ERROR: CMSampleBufferCreateReady failed 0x%0x\n", v170, 0x18u);
              }
              goto LABEL_217;
            }
            CFAllocatorRef v101 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
            CFNumberRef v102 = (OpaqueCMBlockBuffer *)destinationBuffer.tv_sec;
            if (*((unsigned char *)this + 128)) {
              goto LABEL_194;
            }
          }
          else
          {
            CFAllocatorRef v101 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
            CFNumberRef v102 = (OpaqueCMBlockBuffer *)destinationBuffer.tv_sec;
          }
          CFNumberRef v103 = (CMFormatDescriptionRef *)(v9 + 760 * a3 + 96);
          goto LABEL_214;
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          ProResFrameReceiver::ProcessFrameDone();
        }
LABEL_238:
        int v104 = 3;
        uint64_t v20 = 3758097084;
        goto LABEL_241;
      case 3u:
        goto LABEL_37;
      case 4u:
        uint64_t v20 = 3758097123;
        goto LABEL_37;
      default:
        uint64_t v20 = 4294954384;
LABEL_37:
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          int v78 = *v157;
          *(_DWORD *)int v170 = 67110402;
          *(_DWORD *)&v170[4] = v78;
          *(_WORD *)&v170[8] = 1024;
          *(_DWORD *)&v170[10] = 1386;
          *(_WORD *)&v170[14] = 2080;
          *(void *)&v170[16] = "ProcessFrameDone";
          *(_WORD *)&v170[24] = 1024;
          *(_DWORD *)&v170[26] = a4;
          *(_WORD *)&v170[30] = 1024;
          *(_DWORD *)&v170[32] = a5;
          *(_WORD *)&v170[36] = 1024;
          *(_DWORD *)&v170[38] = v20;
          _os_log_error_impl(&dword_262BEC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "ERROR: AppleProResHW (0x%x): %d: %s(): failed encoding: proresStatus=%d HWErrorCode=0x%x convertedForEmit=0x%x\n", v170, 0x2Au);
        }
        CFNumberRef v162 = 0;
LABEL_221:
        if (*((_DWORD *)this + 48) != a2 && *((unsigned char *)this + 208) && !*((_DWORD *)this + 66))
        {
          unsigned int v116 = a2 % *((_DWORD *)this + 33);
          uint64_t v117 = *((void *)this + 25);
          CFNumberRef v118 = (unsigned char *)(v117 + 40 * v116);
          if (*v118)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
            {
              int v119 = *v157;
              *(_DWORD *)int v170 = 67109634;
              *(_DWORD *)&v170[4] = v119;
              *(_WORD *)&v170[8] = 2080;
              *(void *)&v170[10] = "ProcessFrameDone";
              *(_WORD *)&v170[18] = 1024;
              *(_DWORD *)&v170[20] = a2;
              _os_log_impl(&dword_262BEC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AppleProResHW (0x%x): %s(): Spot isn't empty for frame %d, do you need to increase size?", v170, 0x18u);
            }
          }
          else
          {
            uint64_t v120 = v117 + 40 * v116;
            *(void *)(v120 + 8) = v163;
            *(void *)(v120 + 24) = sampleBufferOut;
            *(_DWORD *)(v120 + 16) = v20;
            *(_DWORD *)(v120 + 4) = a2;
            *CFNumberRef v118 = 1;
          }
          int v104 = 2;
          goto LABEL_241;
        }
        kdebug_trace();
        if (*((void *)this + 6) == 2)
        {
          if (*((void *)this + 21))
          {
            CFNumberRef v115 = (void (*)(void))*((void *)this + 23);
            if (v115) {
              v115();
            }
          }
        }
        else
        {
          VTEncoderSessionEmitEncodedFrame();
        }
        kdebug_trace();
        ++*((_DWORD *)this + 48);
        if (!*((unsigned char *)this + 208)
          || *((_DWORD *)this + 66)
          || (ProResFrameReceiver::EmitPendingFrames(this) & 1) != 0)
        {
          int v104 = 0;
          goto LABEL_241;
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          ProResFrameReceiver::ProcessFrameDone();
        }
        goto LABEL_238;
    }
  }
  uint64_t v20 = 3758097084;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    ProResFrameReceiver::ProcessFrameDone();
  }
LABEL_265:
  kdebug_trace();
  return v20;
}

void sub_262C084BC(_Unwind_Exception *a1)
{
  MEMORY[0x263E5F2D0](v1, 0x10A0C407714E300);
  _Unwind_Resume(a1);
}

uint64_t DestroyProResFrameReceiver(CFTypeRef *a1, pthread_attr_t *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a1)
  {
    unint64_t v4 = (__CFRunLoop *)*a1;
    if (*a1)
    {
      CFRetain(*a1);
      ProResFrameReceiver::~ProResFrameReceiver((ThreadPool **)a1);
      MEMORY[0x263E5F2D0](a1, 0x10B0C404861445BLL);
      CFRunLoopStop(v4);
      CFRelease(v4);
      uint64_t v5 = 0;
    }
    else
    {
      uint64_t v5 = 3758097084;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        v7[0] = 67109378;
        v7[1] = -1;
        __int16 v8 = 2080;
        uint64_t v9 = "DestroyProResFrameReceiver";
        _os_log_impl(&dword_262BEC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AppleProResHW (0x%x): %s(): ERROR: runLoopRef NULL\n", (uint8_t *)v7, 0x12u);
      }
    }
    if (a2) {
      pthread_attr_destroy(a2);
    }
  }
  else
  {
    uint64_t v5 = 3758097084;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      DestroyProResFrameReceiver_cold_1();
    }
  }
  return v5;
}

void sub_262C08700(_Unwind_Exception *a1)
{
  MEMORY[0x263E5F2D0](v1, 0x10B0C404861445BLL);
  _Unwind_Resume(a1);
}

uint64_t CreateProResFrameReceiver(void *a1, uint64_t a2, pthread_attr_t *a3, pthread_t *a4, int a5, int a6)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v13[0] = 0;
  uint64_t v14 = 0;
  uint64_t v15 = a2;
  int v16 = a5;
  int v19 = a6;
  pthread_mutex_init(&v17, 0);
  pthread_cond_init(&v18, 0);
  pthread_attr_init(a3);
  pthread_attr_setdetachstate(a3, 2);
  if (pthread_attr_setschedpolicy(a3, 2))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      CreateProResFrameReceiver_cold_3();
    }
  }
  else if (pthread_attr_getschedparam(a3, &v12))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      CreateProResFrameReceiver_cold_2();
    }
  }
  else
  {
    v12.sched_priority = 53;
    if (pthread_attr_setschedparam(a3, &v12))
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        CreateProResFrameReceiver_cold_1();
      }
    }
    else
    {
      pthread_create(a4, a3, (void *(__cdecl *)(void *))ProResFrameReceiverEntry, v13);
      pthread_mutex_lock(&v17);
      while (!v13[0])
        pthread_cond_wait(&v18, &v17);
      pthread_mutex_unlock(&v17);
      uint64_t v11 = v14;
      *a1 = v14;
      if (v11)
      {
        uint64_t v9 = 0;
        goto LABEL_11;
      }
    }
  }
  pthread_attr_destroy(a3);
  uint64_t v9 = 3758097084;
LABEL_11:
  pthread_cond_destroy(&v18);
  pthread_mutex_destroy(&v17);
  return v9;
}

void ProResFrameReceiverEntry(void *a1)
{
  a1[1] = 0;
  operator new();
}

void sub_262C089F0(_Unwind_Exception *a1)
{
  MEMORY[0x263E5F2D0](v1, 0x10B0C404861445BLL);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_9_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Eu);
}

void OUTLINED_FUNCTION_10(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_11(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_14_0(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void interchange_compress_plane()
{
  __assert_rtn("interchange_compress_plane", "interchange.cpp", 29, "depth == 8 || depth == 10");
}

void interchange_compression::compressor::compress()
{
  __assert_rtn("compress", "interchange_compressor.h", 453, "width > 0 && width <= SB_WIDTH");
}

{
  __assert_rtn("compress", "interchange_compressor.h", 454, "height > 0 && height <= SB_HEIGHT");
}

{
  __assert_rtn("compress", "interchange_compressor.h", 549, "packed_size_padded == compressed_size_padded");
}

{
  __assert_rtn("lossy_compress_dquad", "interchange_lossy.h", 536, "lossy_level >= 0 && lossy_level <= 2");
}

{
  __assert_rtn("lossy_compress_dquad", "interchange_lossy.h", 863, "compressed_block.size_bits() == dquad_footprint_bits");
}

{
  __assert_rtn("lossy_compress_dquad", "interchange_lossy.h", 855, "pixel_packed <= legal_pixel_size");
}

{
  __assert_rtn("lossy_compress_dquad", "interchange_lossy.h", 802, "fallback_packed_bits == dquad_footprint_bits");
}

{
  __assert_rtn("lossy_compress_dquad", "interchange_lossy.h", 795, "(comp_width[c] != 2) || (comp_width[c] == 2 && dquad_pixel_oob) || (comp_width[c] == 2 && value == dquad[p][c])");
}

{
  __assert_rtn("lossy_compress_dquad", "interchange_lossy.h", 721, "bucket_width == 1");
}

{
  __assert_rtn("lossy_compress_dquad", "interchange_lossy.h", 753, "round_qdelta_down == round_qdelta_down_rtl");
}

{
  __assert_rtn("sanity_check_quantized_delta", "interchange_lossy.h", 248, "(pixel_value < (1ull<<comp_width)-1) || sanity_decoded_comp == pixel_value");
}

{
  __assert_rtn("sanity_check_quantized_delta", "interchange_lossy.h", 245, "error < (1ull << (lossy_parameters[format].max_qp[lossy_level+1][c]))");
}

{
  __assert_rtn("lossy_compress_dquad", "interchange_lossy.h", 618, "mode[c] <= dq_max_mode[fmt_id]");
}

{
  __assert_rtn("lossy_compress_dquad", "interchange_lossy.h", 577, "mode_offset != 0");
}

{
  __assert_rtn("get", "interchange_header.h", 100, "fields[field_id(s, comp)].init");
}

void interchange_decompress_plane()
{
  __assert_rtn("interchange_decompress_plane", "interchange.cpp", 91, "depth == 8 || depth == 10");
}

void interchange_compression::decompressor::decompress()
{
  __assert_rtn("skip", "interchange_bit_pack.h", 102, "read_ptr <= size_bits()");
}

{
  __assert_rtn("lossy_decompress_dquad", "interchange_lossy.h", 1062, "delta_quant <= ((1ull << delta_bits[c]) - 1)");
}

{
  __assert_rtn("lossy_decompress_dquad", "interchange_lossy.h", 1012, "pixel_unpacked <= legal_pixel_size");
}

{
  __assert_rtn("lossy_decompress_dquad", "interchange_lossy.h", 910, "mode_sz != 0");
}

{
  __assert_rtn("lossy_decompress_dquad", "interchange_lossy.h", 900, "mode_sz != 0");
}

{
  __assert_rtn("decompress", "interchange_decompressor.h", 201, "lossy_level == 0");
}

{
  __assert_rtn("decompress", "interchange_decompressor.h", 210, "lossy_level == 0");
}

void interchange_compression::compressor::compressor()
{
  __assert_rtn("compressor", "interchange_compressor.h", 152, "alternative_decorrelation == 0 || _format == FMT_8_8_8_8");
}

{
  __assert_rtn("compressor", "interchange_compressor.h", 154, "lossy_level == 0 || comp_type < COMP_TYPE_INVALID");
}

{
  __assert_rtn("compressor", "interchange_compressor.h", 153, "check_valid_lossy_level(lossy_level, format)");
}

{
  __assert_rtn("set_format", "interchange_header.h", 201, "header_layout_table[id].format == id");
}

void interchange_compression::compressor::compute_deltas()
{
  __assert_rtn("wrap_to_range", "interchange_constants.h", 82, "width <= 32");
}

void interchange_compression::compressor::compute_smallest_predictor()
{
}

void interchange_compression::compressor::create_header()
{
  __assert_rtn("create_header", "interchange_compressor.h", 299, "region_enable == 0");
}

void bit_pack::pack()
{
}

{
  __assert_rtn("pack", "interchange_bit_pack.h", 62, "!read_only");
}

void interchange_compression::header::set()
{
}

void interchange_compression::header::get_size()
{
}

{
  __assert_rtn("get_size", "interchange_header.h", 138, "0");
}

{
  __assert_rtn("get_size", "interchange_header.h", 123, "fields[field_id(MODE, comp)].init");
}

{
  __assert_rtn("get_size", "interchange_header.h", 128, "fields[field_id(MODE, comp)].init");
}

{
  __assert_rtn("get_size", "interchange_header.h", 129, "fields[field_id(BITS, comp)].init");
}

void interchange_compression::get_id(int a1)
{
  printf("comp_width = %d\n", a1);
  __assert_rtn("get_id", "interchange_lossy.h", 194, "fmt_id != 6");
}

void interchange_compression::derive_sharing()
{
  __assert_rtn("derive_sharing", "interchange_lossy.h", 356, "start_level[3] <= 0");
}

{
  __assert_rtn("derive_sharing", "interchange_lossy.h", 269, "mode[3] == 0 || mode[3] == 1");
}

void interchange_compression::encode_mode()
{
}

void interchange_compression::decompressor::decompressor()
{
  __assert_rtn("decompressor", "interchange_decompressor.h", 39, "lossy_level == 0 || comp_type < COMP_TYPE_INVALID");
}

{
  __assert_rtn("decompressor", "interchange_decompressor.h", 38, "check_valid_lossy_level(lossy_level, format)");
}

void bit_pack::unpack()
{
  __assert_rtn("unpack", "interchange_bit_pack.h", 95, "size <= 32");
}

void interchange_compression::decompressor::unpack_header()
{
}

void interchange_compression::decompressor::decompress_pixels()
{
  __assert_rtn("sign_extend", "interchange_constants.h", 87, "width <= 32");
}

void bit_pack::get()
{
  __assert_rtn("get", "interchange_bit_pack.h", 81, "size <= 32");
}

void AppleProResHW_CheckPlatform()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW: %d: %s(): IOServiceMatching failed\n", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW: %d: %s(): IOServiceGetMatchingService failed\n", v1, v2, v3, v4, 2u);
}

void GetMaxCompressionSizeExcludingAlpha()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW: %d: %s(): AppleProResHW: CodecType unsupported\n", v1, v2, v3, v4, 2u);
}

void GetCompressedFrameSize()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Error get max compression size excluding alpha\n", v1, v2, v3, v4, v5);
}

void GetEmptySpotInFrameInfoArray()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Timedout, could not find an empty spot\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Error, could not find an empty spot\n", v1, v2, v3, v4, v5);
}

void createConnection()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): IOServiceMatching failed\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): IOServiceGetMatchingService failed\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): createUserClient failed\n", v1, v2, v3, v4, v5);
}

void checkFrameHeader()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Invalid ProRes_OperatingMode!\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): FrameHeader max size exceeded; %d bytes\n",
    v1,
    v2,
    v3,
    v4,
    v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Unsupported bitstream_version value %d\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Invalid alpha_channel_type\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Invalid chroma_quantization_matrix entries\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Invalid luma_quantization_matrix entries\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Invalid interlace_mode\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): FrameHeader max size exceeded; %d bytes\n",
    v1,
    v2,
    v3,
    v4,
    v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Unsupported bitstream_version value %d\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Unsupported bayer_pattern %d\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Invalid sensel_value_range %d\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Invalid log2_desired_slice_size_in_mb %d\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Invalid quantization_matrix\n", v1, v2, v3, v4, v5);
}

void checkFrameHeader(unsigned __int16 a1, uint64_t a2, int a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v3 = *(unsigned __int16 *)(a2 + 10);
  v4[0] = 67110146;
  v4[1] = a3;
  int v6 = 2234;
  __int16 v7 = 2080;
  __int16 v5 = 1024;
  __int16 v8 = "checkFrameHeader";
  __int16 v9 = 1024;
  int v10 = a1;
  __int16 v11 = 1024;
  int v12 = v3;
  _os_log_error_impl(&dword_262BEC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "ERROR AppleProResHW (0x%x): %d: %s(): Invalid frame width %d or height %d\n", (uint8_t *)v4, 0x24u);
}

void parseFrameHeader()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Invalid ProRes_OperatingMode!\n", v1, v2, v3, v4, v5);
}

void createEncodeStatsBuffers(int a1, int a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2[0] = 67110914;
  v2[1] = a2;
  int v4 = 2427;
  __int16 v5 = 2080;
  __int16 v3 = 1024;
  int v6 = "createEncodeStatsBuffers";
  __int16 v7 = 1024;
  int v8 = a1 >> 24;
  __int16 v9 = 1024;
  int v10 = a1 << 8 >> 24;
  __int16 v11 = 1024;
  int v12 = (__int16)a1 >> 8;
  __int16 v13 = 1024;
  int v14 = (char)a1;
  __int16 v15 = 1024;
  int v16 = a1;
  _os_log_error_impl(&dword_262BEC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "ERROR: AppleProResHW (0x%x): %d: %s(): AppleProResHW: CodecType %c%c%c%c(0x%x) unsupported\n", (uint8_t *)v2, 0x36u);
}

void createEncodeStatsBuffers()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Error create statistics CVDataBufferPool\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Error create statistics dataBuffer\n", v1, v2, v3, v4, v5);
}

void ProResHWAnalyzer::findMinMaxlastNZPos()
{
  __assert_rtn("findMinMaxlastNZPos", "AppleProResHWAnalyzer.cpp", 588, "numVals % 8 == 0");
}

void ProResDecoder_CreateInstance_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW: %d: %s(): AppleProResHW Decoder cannot alloc property value dictionary\n", v1, v2, v3, v4, 2u);
}

void ProResDecoder_CreateInstance_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW: %d: %s(): AppleProResHW Decoder cannot alloc properties dictionary\n", v1, v2, v3, v4, 2u);
}

void ProResDecoder_CreateInstance_cold_3()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): AppleProResHW Decoder createConnection failed\n", v1, v2, v3, v4, v5);
}

void ProResDecoder_CreateInstance_cold_4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): AppleProResHW Decoder instance allocation failed\n", v1, v2, v3, v4, 2u);
}

void ProResDecoder_Invalidate()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW: %d: %s(): AppleProResHW Could not get private storage\n", v1, v2, v3, v4, 2u);
}

void ProResDecoder_CopyProperty()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW: %d: %s(): AppleProResHW Could not get private storage\n", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_18(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Unsupported codec type passed to CopySupportedPropertyDictionary\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_18(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Unsupported codec type passed to CopySupportedPropertyDictionary\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_18(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Unsupported codec type passed to CopySupportedPropertyDictionary\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW: %d: %s(): AppleProResHW ProResDecoder_CopyProperty: Invalid input parameters.\n", v1, v2, v3, v4, 2u);
}

void ProResDecoder_SetProperty()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW: %d: %s(): AppleProResHW Could not retrieve private storage from base class\n", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_18(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): bad eUserClientType value %d.\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_18(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): codecType 0x%x not supported\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_18(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): dstWidth or dstHeight is 0!\n", v1, v2, v3, v4, v5);
}

{
  __int16 v0;
  uint64_t v1;
  uint8_t v2[34];
  __int16 v3;
  uint64_t v4;

  OUTLINED_FUNCTION_18(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_13();
  uint64_t v3 = v0;
  uint64_t v4 = v1;
  _os_log_error_impl(&dword_262BEC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "ERROR AppleProResHW (0x%x): %d: %s(): scaleFactor_x %zu not equal to scaleFactor_y %zu!\n", v2, 0x2Cu);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW: %d: %s(): AppleProResHW ProResDecoder_SetProperty: Invalid input parameters.\n", v1, v2, v3, v4, 2u);
}

void ProResDecoder_StartSession()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Width (%d) not supported\n", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Height (%d) not supported\n", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): MaxPixelsPerFrame (%d) not supported\n", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): eUserClientType %d not supported in decoding case. \n", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): AppleProResHWDecoder - CreateProResFrameReceiver failed %x\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): IOConnect call for InitSession failed(0x%x)\n", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_8_0(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): codecType received (%d) does not match previously set codecType (%d)\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW: %d: %s(): AppleProResHW ProResDecoder_StartSession: Invalid input parameters.\n", v1, v2, v3, v4, 2u);
}

void ProResDecoder_StartSession(int a1, int a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2[0] = 67110658;
  v2[1] = a2;
  __int16 v3 = 1024;
  int v4 = 1363;
  __int16 v5 = 2080;
  int v6 = "ProResDecoder_StartSession";
  __int16 v7 = 1024;
  int v8 = a1 >> 24;
  __int16 v9 = 1024;
  int v10 = a1 << 8 >> 24;
  __int16 v11 = 1024;
  int v12 = (__int16)a1 >> 8;
  __int16 v13 = 1024;
  int v14 = (char)a1;
  _os_log_error_impl(&dword_262BEC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "ERROR AppleProResHW (0x%x): %d: %s(): codecType %c%c%c%c not supported\n", (uint8_t *)v2, 0x30u);
}

void ProResDecoder_DecodeFrame()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Received empty bitstream buffer\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint8_t v1[30];
  __int16 v2;
  uint64_t v3;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6_0();
  uint64_t v2 = 2048;
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_262BEC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "ERROR AppleProResHW (0x%x): %d: %s(): Error parsing frameSize: compressedFrameSize(%d) > blockbuffer_dataSize(%zu)\n", v1, 0x28u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Error parsing frame_header\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Frame Width (%d) not supported\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): FrameHeight (%d) not supported\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Number of slices for first field/picture exceeds the max number\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Unsupported pixel format=0x%x for decode output buffer\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): bitDepth %d is not 3 in the non-downsampling case.\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): ERROR Stream width+offsetH > BufferPool Plane Width\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): ERROR Stream height+offsetV > BufferPool Plane Height\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Error create CVDataBufferPool\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): AppleProResHW: Error create CVDataBufferPool\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Could not get space in FrameInfoArray for additional subframes, at %d\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): IOConnect call for DecodeFrame returned (0x%x)\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): failed to prepare for subframe[%d]\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Illegal fields conditions in decodeCmd\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_16(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): planeCount %lu is not 0 for RAW downsampling, or not 4 for b16q case.\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_16(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): planeCount %lu is not 0, or downsampling ratio is not 0 for bp16 case.\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_16(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): planeCount %lu is not 0, or downsampling ratio is not 0 for Companded case.\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): bayer_pattern in frame_header %d does not match with output format bayer_pattern 0.\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): bayer_pattern in frame_header %d does not match with output format bayer_pattern 1.\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): bayer_pattern in frame_header %d does not match with output format bayer_pattern 2.\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): bayer_pattern in frame_header %d does not match with output format bayer_pattern 3.\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): bayer_pattern in frame_header %d does not match with output format bayer_pattern [0,3].\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_16(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): planeCount %lu is not 0, or downsampling ratio is not 0 for RAW Packed case.\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): bayer_pattern in frame_header %d does not match with output format bayer_pattern 0.\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): bayer_pattern in frame_header %d does not match with output format bayer_pattern 1.\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): bayer_pattern in frame_header %d does not match with output format bayer_pattern 2.\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): bayer_pattern in frame_header %d does not match with output format bayer_pattern 3.\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): bayer_pattern in frame_header %d does not match with output format bayer_pattern 3.\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_8_0(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): pixelFormat %d does not agree with downScaleFactor %d.\n", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Invalid ChromaFormat (%d) for 444/422 container\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Number of slices for second field exceeds the max number\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Two Pic mode not supported\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Bad DCQSS\n", v1, v2, v3, v4, v5);
}

void ProResDecoder_CopySupportedPropertyDictionary()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW: %d: %s(): AppleProResHW Could not get private storage\n", v1, v2, v3, v4, 2u);
}

void ProResDecoder_CanAcceptFormatDescription()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW: %d: %s(): AppleProResHW Could not retrieve private storage from base class\n", v1, v2, v3, v4, 2u);
}

void ProResDecoder_GetLargestDCQSS()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): AppleProResHW RAW Decoder RAW frame header parsing failed!\n", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): AppleProResHW RAW Decoder frame header parsing failed!\n", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): AppleProResHW RAW Decoder RAW frame header parsing failed!\n", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): AppleProResHW RAW Decoder RAW frame header parsing failed!\n", v1, v2, v3, v4, 2u);
}

void ProResDecoder_CheckDecodeCmd()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW: %d: %s(): AppleProResHW: eOperatingMode %d Not DecRAW\n", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Alpha only decode not supported\n", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_8_0(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Unsupported Chroma Lossy level %d for bitDepth %d\n", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_8_0(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Unsupported Chroma Lossy level %d for bitDepth %d\n", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Unsupported Alpha Lossy level %d\n", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_8_0(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Luma Lossy Level %d doesn't match chroma lossy level %d\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8_0(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Incompatible bitstream for DecAlphaOnly mode, alphaChannel = %d, chromaFormat = %d\n", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8_0(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Alpha only decode not supported for %d to %d bitdepth conversion\n", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8_0(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Incompatible bitstream for Decode mode, alphaChannel = %d, chromaFormat = %d\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_8_0(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): eChromaFormat %d doesn't match chromaFormat %d\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8_0(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Unsupported bCompressedYCbCr %d with downScaleFactor %d\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8_0(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Unsupported bTwoPic %d with downScaleFactor %d\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8_0(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Unsupported bTwoPic %d with interlaceMode %d\n", v1, v2, v3, v4, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8_0(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Mismatching image buffer alpha type %d and decode mode %d\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_8_0(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Unsupported eDecMode %d with alphaChannelType %d\n", v1, v2, v3, v4, v5);
}

void ProResDecoder_CheckDecodeCmd(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ProResDecoder_GetInputMaxSize()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Error get compressed frame size\n", v1, v2, v3, v4, 2u);
}

void ProResDecoder_prepareInputFrame()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): AppleProResHW: Error create dataBuffer\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): AppleProResHW: Error decInputBaseAddr is NULL\n", v1, v2, v3, v4, v5);
}

void ProResFrameReceiver::InitializeDoubleEncode()
{
  OUTLINED_FUNCTION_14_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): numSlices=%d > MAX_DOUBLE_ENCODE_SLICES\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_14_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): ProResFrameReceiver ERROR: m_pProresFrameP1 alloc failed\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_14_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): ProResFrameReceiver ERROR: m_pProresFrameP2 alloc failed\n", v1, v2, v3, v4, v5);
}

void ProResFrameReceiver::FrameDone()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  int v0 = 67109378;
  OUTLINED_FUNCTION_8();
  uint64_t v1 = "FrameDone";
  _os_log_error_impl(&dword_262BEC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "ERROR AppleProResHW: %d: %s(): ProResFrameReceiver ERROR: Did not get arguments in callback\n", (uint8_t *)&v0, 0x12u);
}

void ProResFrameReceiver::Setup()
{
  OUTLINED_FUNCTION_14_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): ProResFrameReceiver ERROR: CFRunLoopGetCurrent failed.\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_14_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): ProResFrameReceiver ERROR: AddIODispatcherToRunLoop failed.\n", v1, v2, v3, v4, v5);
}

void stitchCallback()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v1 = 67110146;
  OUTLINED_FUNCTION_8();
  uint64_t v2 = "stitchCallback";
  __int16 v3 = 1024;
  int v4 = v0;
  OUTLINED_FUNCTION_17_0();
  _os_log_error_impl(&dword_262BEC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "ERROR: AppleProResHW: %d: %s(): failed CMBlockBufferReplaceDataBytes (0x%x) offset=%d length=%d\n", (uint8_t *)&v1, 0x24u);
}

void ProResFrameReceiver::EmitPendingFrames()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  v2[0] = 67110146;
  v2[1] = v0;
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = v1;
  int v4 = "EmitPendingFrames";
  OUTLINED_FUNCTION_17_0();
  _os_log_error_impl(&dword_262BEC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "ERROR AppleProResHW (0x%x): %d: %s(): Error: Bad state, Frame cannot be emitted, FrameNum=%d, m_FrameNumCnt=%d\n", (uint8_t *)v2, 0x24u);
}

void ProResFrameReceiver::ProcessFrameDone()
{
  OUTLINED_FUNCTION_14_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Invalid decode subFrameId: %d\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_10(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_4(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Error in frame emit: frame %d is not the frame to be emitted\n", v1, v2, v3, v4, v5);
}

{
  uint8_t v0[10];
  int v1;

  OUTLINED_FUNCTION_10(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = 1209;
  OUTLINED_FUNCTION_15_0();
  _os_log_error_impl(&dword_262BEC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "ERROR AppleProResHW (0x%x): %d: %s(): %s(): Compressed format does not support upScaling of alpha 8b->16b; eType=%d\n",
    v0,
    0x28u);
}

{
  uint8_t v0[10];
  int v1;

  OUTLINED_FUNCTION_10(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = 1208;
  OUTLINED_FUNCTION_15_0();
  _os_log_error_impl(&dword_262BEC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "ERROR AppleProResHW (0x%x): %d: %s(): %s(): Incorrect Pixel format for upScaling alpha 8b->16b eType=%d\n", v0, 0x28u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_10(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_4(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Error in frame emit: frame %d already emitted?\n", v1, v2, v3, v4, v5);
}

{
  uint8_t v0[56];

  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_12();
  _os_log_error_impl(&dword_262BEC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "ERROR: AppleProResHW (0x%x): %d: %s(): failed new frameSize with stuffing CMBlockBufferReplaceDataBytes (0x%x) offset=%d length=%d\n", v0, 0x2Au);
}

{
  uint8_t v0[56];

  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_12();
  _os_log_error_impl(&dword_262BEC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "ERROR: AppleProResHW (0x%x): %d: %s(): failed Non DoubleEnc new frame size CMBlockBufferReplaceDataBytes (0x%x) offset=%d length=%d\n", v0, 0x2Au);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_11(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_9_0(&dword_262BEC000, &_os_log_internal, v0, "ERROR: AppleProResHW (0x%x): %d: %s(): failed Non DoubleEnc CMBlockBufferReplaceDataBytes (0x%x) offset=%d length=%zu\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_11(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_9_0(&dword_262BEC000, &_os_log_internal, v0, "ERROR: AppleProResHW (0x%x): %d: %s(): failed bPass1 CMBlockBufferReplaceDataBytes (0x%x) offset=%d length=%zu\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_11(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_9_0(&dword_262BEC000, &_os_log_internal, v0, "ERROR: AppleProResHW (0x%x): %d: %s(): failed force2 CMBlockBufferReplaceDataBytes (0x%x) offset=%d length=%zu\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_11(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_9_0(&dword_262BEC000, &_os_log_internal, v0, "ERROR: AppleProResHW (0x%x): %d: %s(): failed pass12 stitch (0x%x) offset=%d length=%zu\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_11(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_9_0(&dword_262BEC000, &_os_log_internal, v0, "ERROR: AppleProResHW (0x%x): %d: %s(): failed QPLoad in DoubleEncode CMBlockBufferReplaceDataBytes (0x%x) offset=%d length=%zu\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Unsupported DoubleEncode option for generating statistics, %d\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): IOConnect call for EncodeFrame failed in double Encode(0x%x)\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Unsupported DoubleEncode option for setting up the second encode, %d\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_10(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_4(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Bad SliceSetup numSlices=%d\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Interlace Encode not supported\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): Unsupported DoubleEncode option, %d, stitching is not supported for this options\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_14_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): FrameNumber in plugin callback doesnt match, doubleEncode: %d\n", v1, v2, v3, v4, v5);
}

void ProResFrameReceiver::ProcessFrameDone(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    int v5 = 67109890;
    OUTLINED_FUNCTION_8();
    int v6 = "ProcessFrameDone";
    __int16 v7 = 1024;
    int v8 = v4;
    __int16 v9 = 1024;
    int v10 = a3;
    _os_log_impl(&dword_262BEC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AppleProResHW (0x%x): %s(): F# %d: FrameParse error, the bitstream is corrupted, %d", (uint8_t *)&v5, 0x1Eu);
  }
}

void DestroyProResFrameReceiver_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  int v0 = 67109378;
  OUTLINED_FUNCTION_8();
  uint64_t v1 = "DestroyProResFrameReceiver";
  _os_log_error_impl(&dword_262BEC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "ERROR AppleProResHW: %d: %s(): ProResFrameReceiver ERROR: DestroyProResFrameReceiver called with pFrameReceiver NULL.\n", (uint8_t *)&v0, 0x12u);
}

void CreateProResFrameReceiver_cold_1()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): pthread_attr_setschedparam failed\n", v1, v2, v3, v4, v5);
}

void CreateProResFrameReceiver_cold_2()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): pthread_attr_getschedparam failed\n", v1, v2, v3, v4, v5);
}

void CreateProResFrameReceiver_cold_3()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): pthread_attr_setschedpolicy failed\n", v1, v2, v3, v4, v5);
}

void ProResFrameReceiverEntry()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_262BEC000, &_os_log_internal, v0, "ERROR AppleProResHW (0x%x): %d: %s(): ProResFrameReceiver ERROR: receiver->Setup failed.\n", v1, v2, v3, v4, v5);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x270EE48F0](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE4AE8](allocator, port, order);
}

CFMachPortRef CFMachPortCreateWithPort(CFAllocatorRef allocator, mach_port_t portNum, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x270EE4AF0](allocator, *(void *)&portNum, callout, context, shouldFreeInfo);
}

void CFMachPortInvalidate(CFMachPortRef port)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E58]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopRun(void)
{
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B0](alloc, maxLength);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x270EE5470](alloc);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1 = MEMORY[0x270EE54A8](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

uint64_t CMBaseObjectGetDerivedStorage()
{
  return MEMORY[0x270EE79C0]();
}

OSStatus CMBlockBufferCreateContiguous(CFAllocatorRef structureAllocator, CMBlockBufferRef sourceBuffer, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x270EE79F8](structureAllocator, sourceBuffer, blockAllocator, customBlockSource, offsetToData, dataLength, *(void *)&flags, blockBufferOut);
}

OSStatus CMBlockBufferCreateWithMemoryBlock(CFAllocatorRef structureAllocator, void *memoryBlock, size_t blockLength, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x270EE7A08](structureAllocator, memoryBlock, blockLength, blockAllocator, customBlockSource, offsetToData, dataLength, *(void *)&flags);
}

OSStatus CMBlockBufferFillDataBytes(char fillByte, CMBlockBufferRef destinationBuffer, size_t offsetIntoDestination, size_t dataLength)
{
  return MEMORY[0x270EE7A18](fillByte, destinationBuffer, offsetIntoDestination, dataLength);
}

size_t CMBlockBufferGetDataLength(CMBlockBufferRef theBuffer)
{
  return MEMORY[0x270EE7A20](theBuffer);
}

OSStatus CMBlockBufferGetDataPointer(CMBlockBufferRef theBuffer, size_t offset, size_t *lengthAtOffsetOut, size_t *totalLengthOut, char **dataPointerOut)
{
  return MEMORY[0x270EE7A30](theBuffer, offset, lengthAtOffsetOut, totalLengthOut, dataPointerOut);
}

Boolean CMBlockBufferIsRangeContiguous(CMBlockBufferRef theBuffer, size_t offset, size_t length)
{
  return MEMORY[0x270EE7A38](theBuffer, offset, length);
}

OSStatus CMBlockBufferReplaceDataBytes(const void *sourceBytes, CMBlockBufferRef destinationBuffer, size_t offsetIntoDestination, size_t dataLength)
{
  return MEMORY[0x270EE7A40](sourceBytes, destinationBuffer, offsetIntoDestination, dataLength);
}

uint64_t CMDerivedObjectCreate()
{
  return MEMORY[0x270EE7AD0]();
}

Boolean CMFormatDescriptionEqual(CMFormatDescriptionRef formatDescription, CMFormatDescriptionRef otherFormatDescription)
{
  return MEMORY[0x270EE7AE0](formatDescription, otherFormatDescription);
}

CFPropertyListRef CMFormatDescriptionGetExtension(CMFormatDescriptionRef desc, CFStringRef extensionKey)
{
  return (CFPropertyListRef)MEMORY[0x270EE7AF0](desc, extensionKey);
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x270EE7B10](desc);
}

OSStatus CMSampleBufferCreateReady(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMItemCount numSampleSizeEntries, const size_t *sampleSizeArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x270EE7BF0](allocator, dataBuffer, formatDescription, numSamples, numSampleTimingEntries, sampleTimingArray, numSampleSizeEntries, sampleSizeArray);
}

CMBlockBufferRef CMSampleBufferGetDataBuffer(CMSampleBufferRef sbuf)
{
  return (CMBlockBufferRef)MEMORY[0x270EE7C18](sbuf);
}

CMTime *__cdecl CMSampleBufferGetDecodeTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x270EE7C20](retstr, sbuf);
}

CMFormatDescriptionRef CMSampleBufferGetFormatDescription(CMSampleBufferRef sbuf)
{
  return (CMFormatDescriptionRef)MEMORY[0x270EE7C30](sbuf);
}

CMTime *__cdecl CMSampleBufferGetOutputDuration(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x270EE7C60](retstr, sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x270EE7C78](retstr, sbuf);
}

CFArrayRef CMSampleBufferGetSampleAttachmentsArray(CMSampleBufferRef sbuf, Boolean createIfNecessary)
{
  return (CFArrayRef)MEMORY[0x270EE7C88](sbuf, createIfNecessary);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x270EE7F08](retstr, lhs, rhs);
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x270EE7FD0](videoDesc);
}

void CVBufferSetAttachment(CVBufferRef buffer, CFStringRef key, CFTypeRef value, CVAttachmentMode attachmentMode)
{
}

uint64_t CVDataBufferGetIOSurface()
{
  return MEMORY[0x270EEA050]();
}

uint64_t CVDataBufferPoolCreate()
{
  return MEMORY[0x270EEA060]();
}

uint64_t CVDataBufferPoolCreateDataBuffer()
{
  return MEMORY[0x270EEA068]();
}

uint64_t CVDataBufferPoolFlush()
{
  return MEMORY[0x270EEA078]();
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x270EEA190](pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x270EEA1A0](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1B0](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA1C8](pixelBuffer, planeIndex);
}

void CVPixelBufferGetExtendedPixels(CVPixelBufferRef pixelBuffer, size_t *extraColumnsOnLeft, size_t *extraColumnsOnRight, size_t *extraRowsOnTop, size_t *extraRowsOnBottom)
{
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1E8](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA1F8](pixelBuffer, planeIndex);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x270EEA200](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA218](pixelBuffer);
}

size_t CVPixelBufferGetPlaneCount(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA220](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA240](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA250](pixelBuffer, planeIndex);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x270EEA260](pixelBuffer, lockFlags);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x270EEA330](pixelBuffer, unlockFlags);
}

uint64_t FigFormatDescriptionRelease()
{
  return MEMORY[0x270EE8228]();
}

uint64_t FigFormatDescriptionRetain()
{
  return MEMORY[0x270EE8230]();
}

kern_return_t IOConnectCallAsyncMethod(mach_port_t connection, uint32_t selector, mach_port_t wake_port, uint64_t *reference, uint32_t referenceCnt, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F18](*(void *)&connection, *(void *)&selector, *(void *)&wake_port, reference, *(void *)&referenceCnt, input, *(void *)&inputCnt, inputStruct);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F40](*(void *)&connection, *(void *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOCreateReceivePort(uint32_t msgType, mach_port_t *recvPort)
{
  return MEMORY[0x270EF3FD0](*(void *)&msgType, recvPort);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x270EF4A98](*(void *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x270EF4C28](properties);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x270EF4C58](buffer);
}

uint64_t IOSurfaceGetCompressionTypeOfPlane()
{
  return MEMORY[0x270EF4CF8]();
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D48](buffer);
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D68](buffer);
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D80](buffer);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4DE0](buffer);
}

IOSurfaceRef IOSurfaceLookup(IOSurfaceID csid)
{
  return (IOSurfaceRef)MEMORY[0x270EF4E28](*(void *)&csid);
}

uint64_t VTDecoderSessionCleanUpAfterDecode()
{
  return MEMORY[0x270F06680]();
}

uint64_t VTDecoderSessionCreatePixelBuffer()
{
  return MEMORY[0x270F06688]();
}

uint64_t VTDecoderSessionEmitDecodedFrame()
{
  return MEMORY[0x270F06698]();
}

uint64_t VTDecoderSessionSetPixelBufferAttributes()
{
  return MEMORY[0x270F066C0]();
}

uint64_t VTEncoderSessionCreateCMBlockBuffer()
{
  return MEMORY[0x270F06710]();
}

uint64_t VTEncoderSessionEmitEncodedFrame()
{
  return MEMORY[0x270F06728]();
}

uint64_t VTRegisterVideoDecoderWithInfo()
{
  return MEMORY[0x270F06800]();
}

uint64_t VTVideoDecoderGetClassID()
{
  return MEMORY[0x270F06878]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984B8](this, __s);
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
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

void operator new[]()
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

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

uint64_t _os_crash()
{
  return MEMORY[0x270ED8060]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t analytics_send_event_lazy()
{
  return MEMORY[0x270F18A78]();
}

void bzero(void *a1, size_t a2)
{
}

void free(void *a1)
{
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x270ED9D98](a1, a2);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x270EDA210](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
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

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x270EDADF8](a1);
}

int pthread_attr_getschedparam(const pthread_attr_t *a1, sched_param *a2)
{
  return MEMORY[0x270EDAE00](a1, a2);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x270EDAE10](a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x270EDAE20](a1, *(void *)&a2);
}

int pthread_attr_setschedparam(pthread_attr_t *a1, const sched_param *a2)
{
  return MEMORY[0x270EDAE30](a1, a2);
}

int pthread_attr_setschedpolicy(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x270EDAE38](a1, *(void *)&a2);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE50](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE58](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x270EDAE60](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE68](a1);
}

int pthread_cond_timedwait(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x270EDAE78](a1, a2, a3);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x270EDAE88](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x270EDAEA0](a1, a2, a3, a4);
}

void pthread_exit(void *a1)
{
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x270EDAF10](a1, a2);
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x270EDAF38](a1);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF50](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x270EDAF58](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x270EDB010]();
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x270EDB038](a1);
}

int setpriority(int a1, id_t a2, int a3)
{
  return MEMORY[0x270EDB410](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

kern_return_t thread_policy_set(thread_act_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t policy_infoCnt)
{
  return MEMORY[0x270EDB908](*(void *)&thread, *(void *)&flavor, policy_info, *(void *)&policy_infoCnt);
}

vImage_Error vImagePermuteChannels_ARGB16U(const vImage_Buffer *src, const vImage_Buffer *dest, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x270EDF260](src, dest, permuteMap, *(void *)&flags);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}