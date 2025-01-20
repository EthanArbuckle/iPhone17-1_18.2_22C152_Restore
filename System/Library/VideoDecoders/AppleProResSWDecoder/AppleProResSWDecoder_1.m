void std::vector<PRRDecoderJob>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  BOOL v3;
  unint64_t v4;

  v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 4;
  v3 = a2 >= v2;
  v4 = a2 - v2;
  if (v4 != 0 && v3)
  {
    std::vector<PRRDecoderJob>::__append((char **)a1, v4);
  }
  else if (!v3)
  {
    *(void *)(a1 + 8) = *(void *)a1 + 16 * a2;
  }
}

void std::vector<PRRSliceDecodeParams>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3);
  BOOL v3 = a2 >= v2;
  unint64_t v4 = a2 - v2;
  if (v4 != 0 && v3)
  {
    std::vector<PRRSliceDecodeParams>::__append((char **)a1, v4);
  }
  else if (!v3)
  {
    *(void *)(a1 + 8) = *(void *)a1 + 88 * a2;
  }
}

unsigned __int8 *Bytestream::getBytes(Bytestream *this, size_t a2, unsigned __int8 *a3)
{
  if (*(unsigned char *)this) {
    return 0;
  }
  unint64_t v4 = *((void *)this + 2);
  size_t v5 = v4 - a2;
  if (v4 >= a2)
  {
    uint64_t v8 = *((void *)this + 1);
    *((void *)this + 1) = v8 + a2;
    *((void *)this + 2) = v5;
    return (unsigned __int8 *)v8;
  }
  else if (Bytestream::getCopiedBytes(this, a2, a3))
  {
    return a3;
  }
  else
  {
    return 0;
  }
}

intptr_t ThreadPool<PRRDecoderWorker,PRRDecoderJob,void>::runJobs(void *context, uint64_t a2, int a3)
{
  atomic_store(0, (unsigned int *)context + 6);
  *((_DWORD *)context + 7) = a3;
  *((void *)context + 4) = a2;
  if (*(int *)context >= 1)
  {
    int v4 = 0;
    do
    {
      dispatch_group_async_f(*((dispatch_group_t *)context + 2), *((dispatch_queue_t *)context + 1), context, (dispatch_function_t)ThreadPool<PRRDecoderWorker,PRRDecoderJob,void>::dispatch_routine);
      ++v4;
    }
    while (v4 < *(_DWORD *)context);
  }
  size_t v5 = *((void *)context + 2);

  return dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
}

void std::vector<PRRDecoderJob>::__append(char **a1, unint64_t a2)
{
  size_t v5 = a1[1];
  int v4 = a1[2];
  if (a2 <= (v4 - v5) >> 4)
  {
    if (a2)
    {
      uint64_t v12 = 16 * a2;
      bzero(a1[1], 16 * a2);
      v5 += v12;
    }
    a1[1] = v5;
  }
  else
  {
    v6 = *a1;
    uint64_t v7 = (v5 - *a1) >> 4;
    unint64_t v8 = v7 + a2;
    if ((v7 + a2) >> 60) {
      std::vector<__CVBuffer *>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v9 = v4 - v6;
    if (v9 >> 3 > v8) {
      unint64_t v8 = v9 >> 3;
    }
    if ((unint64_t)v9 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v10 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v10 = v8;
    }
    if (v10)
    {
      if (v10 >> 60) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      v11 = (char *)operator new(16 * v10);
    }
    else
    {
      v11 = 0;
    }
    v13 = &v11[16 * v7];
    size_t v14 = 16 * a2;
    v15 = &v11[16 * v10];
    bzero(v13, v14);
    v16 = &v13[v14];
    if (v5 != v6)
    {
      do
      {
        *((_OWORD *)v13 - 1) = *((_OWORD *)v5 - 1);
        v13 -= 16;
        v5 -= 16;
      }
      while (v5 != v6);
      size_t v5 = *a1;
    }
    *a1 = v13;
    a1[1] = v16;
    a1[2] = v15;
    if (v5)
    {
      operator delete(v5);
    }
  }
}

void std::vector<PRRSliceDecodeParams>::__append(char **a1, unint64_t a2)
{
  size_t v5 = a1[1];
  int v4 = a1[2];
  if (0x2E8BA2E8BA2E8BA3 * ((v4 - v5) >> 3) >= a2)
  {
    if (a2)
    {
      size_t v12 = 88 * ((88 * a2 - 88) / 0x58) + 88;
      bzero(a1[1], v12);
      v5 += v12;
    }
    a1[1] = v5;
  }
  else
  {
    v6 = *a1;
    uint64_t v7 = 0x2E8BA2E8BA2E8BA3 * ((v5 - *a1) >> 3);
    unint64_t v8 = v7 + a2;
    if (v7 + a2 > 0x2E8BA2E8BA2E8BALL) {
      std::vector<__CVBuffer *>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v9 = 0x2E8BA2E8BA2E8BA3 * ((v4 - v6) >> 3);
    if (2 * v9 > v8) {
      unint64_t v8 = 2 * v9;
    }
    if (v9 >= 0x1745D1745D1745DLL) {
      unint64_t v10 = 0x2E8BA2E8BA2E8BALL;
    }
    else {
      unint64_t v10 = v8;
    }
    if (v10)
    {
      if (v10 > 0x2E8BA2E8BA2E8BALL) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      v11 = (char *)operator new(88 * v10);
    }
    else
    {
      v11 = 0;
    }
    v13 = &v11[88 * v7];
    size_t v14 = &v11[88 * v10];
    size_t v15 = 88 * ((88 * a2 - 88) / 0x58) + 88;
    bzero(v13, v15);
    v16 = &v13[v15];
    if (v5 != v6)
    {
      do
      {
        long long v17 = *(_OWORD *)(v5 - 88);
        *(_OWORD *)(v13 - 72) = *(_OWORD *)(v5 - 72);
        *(_OWORD *)(v13 - 88) = v17;
        long long v18 = *(_OWORD *)(v5 - 56);
        long long v19 = *(_OWORD *)(v5 - 40);
        long long v20 = *(_OWORD *)(v5 - 24);
        *((void *)v13 - 1) = *((void *)v5 - 1);
        *(_OWORD *)(v13 - 24) = v20;
        *(_OWORD *)(v13 - 40) = v19;
        *(_OWORD *)(v13 - 56) = v18;
        v13 -= 88;
        v5 -= 88;
      }
      while (v5 != v6);
      size_t v5 = *a1;
    }
    *a1 = v13;
    a1[1] = v16;
    a1[2] = v14;
    if (v5)
    {
      operator delete(v5);
    }
  }
}

void ThreadPool<PRRDecoderWorker,PRRDecoderJob,void>::dispatch_routine(uint64_t a1)
{
  {
    uint64_t v12 = 64;
    size_t v11 = 8;
    int v7 = sysctlbyname("hw.cachelinesize", &v12, &v11, 0, 0);
    BOOL v8 = v11 == 8 && v7 == 0;
    uint64_t v9 = v12;
    if (!v8) {
      uint64_t v9 = 0;
    }
    ThreadPool<PRRDecoderWorker,PRRDecoderJob,void>::getBlockSize(void)::cacheLineSize = v9;
  }
  {
    uint64_t v10 = ThreadPool<PRRDecoderWorker,PRRDecoderJob,void>::getBlockSize(void)::cacheLineSize;
    if (!ThreadPool<PRRDecoderWorker,PRRDecoderJob,void>::getBlockSize(void)::cacheLineSize) {
      uint64_t v10 = 256;
    }
    ThreadPool<PRRDecoderWorker,PRRDecoderJob,void>::getBlockSize(void)::blockSize = v10;
  }
  uint64_t v2 = ThreadPool<PRRDecoderWorker,PRRDecoderJob,void>::getBlockSize(void)::blockSize;
  BOOL v3 = malloc_type_malloc(((v2 + 143) & -v2) + v2, 0x1E83A129uLL);
  if (v3)
  {
    int v4 = (PRRSliceDecoder *)(((unint64_t)v3 + v2) & -v2);
    *((void *)v4 - 1) = v3;
    if (v4)
    {
      PRRSliceDecoder::PRRSliceDecoder(v4);
      for (signed int i = atomic_fetch_add_explicit((atomic_uint *volatile)(a1 + 24), 1u, memory_order_relaxed);
            i < *(_DWORD *)(a1 + 28);
            signed int i = atomic_fetch_add_explicit((atomic_uint *volatile)(a1 + 24), 1u, memory_order_relaxed))
      {
        uint64_t v6 = *(void *)(a1 + 32);
        if ((enabledSignpostCategories() & 0x1000000) != 0)
        {
          kdebug_trace();
          PRRDecoderWorker::runJob((uint64_t)v4, (int *)(v6 + 16 * i));
          if ((enabledSignpostCategories() & 0x1000000) != 0) {
LABEL_12:
          }
            kdebug_trace();
        }
        else
        {
          PRRDecoderWorker::runJob((uint64_t)v4, (int *)(v6 + 16 * i));
          if ((enabledSignpostCategories() & 0x1000000) != 0) {
            goto LABEL_12;
          }
        }
      }
      free(*((void **)v4 - 1));
    }
  }
}

void sub_262CDCC54(_Unwind_Exception *a1)
{
}

uint64_t PRRSenselWriter::PRRSenselWriter(uint64_t result, int a2, unsigned int a3, uint64_t a4, uint64_t a5, _WORD *a6, int a7)
{
  int v7 = 0;
  *(_DWORD *)result = 0;
  *(void *)(result + 16) = a5;
  if (a2 == 1647392369) {
    unsigned int v8 = 8;
  }
  else {
    unsigned int v8 = 16;
  }
  unsigned int v9 = v8 >> a7;
  if (a2 > 1647392368)
  {
    if (a2 == 1647392369 || a2 == 1651519798)
    {
      int v7 = 2;
      goto LABEL_13;
    }
    if (a2 != 1651521076) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (a2 == 1380410945)
  {
    uint64_t v10 = 0;
    *(void *)(result + 8) = 16 * v9;
    goto LABEL_27;
  }
  if (a2 == 1380411457) {
LABEL_11:
  }
    int v7 = 8;
LABEL_13:
  *(void *)(result + 8) = v7 * v9;
  uint64_t v10 = from_GbGrBR_to_b16q__scalar;
  switch(a2)
  {
    case 1647392369:
      int v12 = 4;
LABEL_24:
      *(_DWORD *)result = v12;
      goto LABEL_27;
    case 1651521076:
      if ((a7 - 1) < 3)
      {
        size_t v11 = (uint64_t *(**)(uint64_t *, const unsigned __int16 *, const unsigned __int16 *, const unsigned __int16 *, const unsigned __int16 *, uint64_t, unsigned int, const unsigned __int16 *, const unsigned __int16 *))(&off_270E10A28 + a7 - 1);
        goto LABEL_21;
      }
LABEL_22:
      uint64_t v10 = 0;
      goto LABEL_23;
    case 1651519798:
      if (a3 < 4)
      {
        size_t v11 = (uint64_t *(**)(uint64_t *, const unsigned __int16 *, const unsigned __int16 *, const unsigned __int16 *, const unsigned __int16 *, uint64_t, unsigned int, const unsigned __int16 *, const unsigned __int16 *))&off_270E10A08[a3];
LABEL_21:
        uint64_t v10 = *v11;
LABEL_23:
        int v12 = 1;
        goto LABEL_24;
      }
      goto LABEL_22;
  }
  uint64_t v10 = 0;
LABEL_27:
  *(void *)(result + 24) = v10;
  v13 = &PRRSenselWriter::defaultTransferFunction_x;
  if (a6) {
    v13 = a6;
  }
  *(_WORD *)(result + 32) = *v13;
  *(_WORD *)(result + 48) = v13[1] - *v13;
  *(_WORD *)(result + 34) = v13[1];
  *(_WORD *)(result + 50) = v13[2] - v13[1];
  *(_WORD *)(result + 36) = v13[2];
  *(_WORD *)(result + 52) = v13[3] - v13[2];
  *(_WORD *)(result + 38) = v13[3];
  *(_WORD *)(result + 54) = v13[4] - v13[3];
  *(_WORD *)(result + 40) = v13[4];
  *(_WORD *)(result + 56) = v13[5] - v13[4];
  *(_WORD *)(result + 42) = v13[5];
  *(_WORD *)(result + 58) = v13[6] - v13[5];
  *(_WORD *)(result + 44) = v13[6];
  *(_WORD *)(result + 60) = v13[7] - v13[6];
  *(_WORD *)(result + 46) = v13[7];
  *(_WORD *)(result + 62) = -v13[7];
  return result;
}

uint64_t *from_GbGrBR_to_b16q__scalar(uint64_t *result, const unsigned __int16 *a2, const unsigned __int16 *a3, const unsigned __int16 *a4, const unsigned __int16 *a5, uint64_t a6, unsigned int a7, const unsigned __int16 *a8, const unsigned __int16 *a9)
{
  if (a7 >= 2)
  {
    int v9 = 0;
    uint64_t v11 = result[2];
    uint64_t v10 = result[3];
    uint64_t v12 = *result;
    uint64_t v13 = result[1];
    do
    {
      uint64_t v14 = 0;
      result = (uint64_t *)(v13 + a6);
      do
      {
        unsigned int v15 = ((a2[v14] & 0x1FFF) * *(const unsigned __int16 *)((char *)a9 + ((a2[v14] >> 12) & 0xELL))
                           + (*(const unsigned __int16 *)((char *)a8 + ((a2[v14] >> 12) & 0xELL)) << 13)
                           + 4096) >> 13;
        if (v15 >= 0xFFFF) {
          LOWORD(v15) = -1;
        }
        *(_WORD *)(v12 + v14 * 2) = v15;
        unsigned int v16 = ((a3[v14] & 0x1FFF) * *(const unsigned __int16 *)((char *)a9 + ((a3[v14] >> 12) & 0xELL))
                           + (*(const unsigned __int16 *)((char *)a8 + ((a3[v14] >> 12) & 0xELL)) << 13)
                           + 4096) >> 13;
        if (v16 >= 0xFFFF) {
          LOWORD(v16) = -1;
        }
        *(_WORD *)(v13 + v14 * 2) = v16;
        unsigned int v17 = ((a4[v14] & 0x1FFF) * *(const unsigned __int16 *)((char *)a9 + ((a4[v14] >> 12) & 0xELL))
                           + (*(const unsigned __int16 *)((char *)a8 + ((a4[v14] >> 12) & 0xELL)) << 13)
                           + 4096) >> 13;
        if (v17 >= 0xFFFF) {
          LOWORD(v17) = -1;
        }
        *(_WORD *)(v11 + v14 * 2) = v17;
        unsigned int v18 = ((a5[v14] & 0x1FFF) * *(const unsigned __int16 *)((char *)a9 + ((a5[v14] >> 12) & 0xELL))
                           + (*(const unsigned __int16 *)((char *)a8 + ((a5[v14] >> 12) & 0xELL)) << 13)
                           + 4096) >> 13;
        if (v18 >= 0xFFFF) {
          LOWORD(v18) = -1;
        }
        *(_WORD *)(v10 + v14 * 2) = v18;
        ++v14;
      }
      while ((v14 * 2) != 16);
      ++v9;
      a2 = (const unsigned __int16 *)((char *)a2 + v14 * 2);
      a3 = (const unsigned __int16 *)((char *)a3 + v14 * 2);
      a4 = (const unsigned __int16 *)((char *)a4 + v14 * 2);
      a5 = (const unsigned __int16 *)((char *)a5 + v14 * 2);
      v12 += a6;
      v13 += a6;
      v11 += a6;
      v10 += a6;
    }
    while (v9 != a7 >> 1);
  }
  return result;
}

uint64_t *from_GBR_to_bp64_8x8__scalar(uint64_t *result, const unsigned __int16 *a2, const unsigned __int16 *a3, const unsigned __int16 *a4, const unsigned __int16 *a5, uint64_t a6, int a7, const unsigned __int16 *a8, const unsigned __int16 *a9)
{
  if (a7)
  {
    int v9 = 0;
    uint64_t v10 = *result;
    do
    {
      uint64_t v11 = 0;
      do
      {
        uint64_t v12 = (_WORD *)(v10 + v11);
        unsigned int v13 = ((*a5 & 0x1FFF) * *(const unsigned __int16 *)((char *)a9 + ((*a5 >> 12) & 0xELL))
                           + (*(const unsigned __int16 *)((char *)a8 + ((*a5 >> 12) & 0xELL)) << 13)
                           + 4096) >> 13;
        if (v13 >= 0xFFFF) {
          LOWORD(v13) = -1;
        }
        *uint64_t v12 = v13;
        unsigned int v14 = ((*a2 & 0x1FFF) * *(const unsigned __int16 *)((char *)a9 + ((*a2 >> 12) & 0xELL))
                           + (*(const unsigned __int16 *)((char *)a8 + ((*a2 >> 12) & 0xELL)) << 13)
                           + 4096) >> 13;
        if (v14 >= 0xFFFF) {
          LOWORD(v14) = -1;
        }
        v12[1] = v14;
        unsigned int v15 = ((*a4 & 0x1FFF) * *(const unsigned __int16 *)((char *)a9 + ((*a4 >> 12) & 0xELL))
                           + (*(const unsigned __int16 *)((char *)a8 + ((*a4 >> 12) & 0xELL)) << 13)
                           + 4096) >> 13;
        if (v15 >= 0xFFFF) {
          LOWORD(v15) = -1;
        }
        v12[3] = -1;
        v12[2] = v15;
        unsigned int v16 = ((a5[1] & 0x1FFF) * *(const unsigned __int16 *)((char *)a9 + ((a5[1] >> 12) & 0xELL))
                           + (*(const unsigned __int16 *)((char *)a8 + ((a5[1] >> 12) & 0xELL)) << 13)
                           + 4096) >> 13;
        if (v16 >= 0xFFFF) {
          LOWORD(v16) = -1;
        }
        v12[4] = v16;
        unsigned int v17 = a2[1];
        int v18 = v17 & 0x1FFF;
        uint64_t v19 = (v17 >> 12) & 0xELL;
        int v20 = *(const unsigned __int16 *)((char *)a8 + v19);
        int v21 = *(const unsigned __int16 *)((char *)a9 + v19);
        v22 = a5 + 2;
        unsigned int v23 = (v18 * v21 + (v20 << 13) + 4096) >> 13;
        v24 = a2 + 2;
        if (v23 >= 0xFFFF) {
          LOWORD(v23) = -1;
        }
        v12[5] = v23;
        unsigned int v25 = a4[1];
        uint64_t v26 = (v25 >> 12) & 0xELL;
        result = (uint64_t *)*(const unsigned __int16 *)((char *)a8 + v26);
        LODWORD(v26) = (v25 & 0x1FFF) * *(const unsigned __int16 *)((char *)a9 + v26);
        v27 = a4 + 2;
        unsigned int v28 = (v26 + (result << 13) + 4096) >> 13;
        if (v28 >= 0xFFFF) {
          LOWORD(v28) = -1;
        }
        v12[6] = v28;
        v12[7] = -1;
        v11 += 16;
        a2 += 2;
        a4 += 2;
        a5 += 2;
      }
      while (v11 != 64);
      v10 += a6;
      ++v9;
      a2 = v24;
      a4 = v27;
      a5 = v22;
    }
    while (v9 != a7);
  }
  return result;
}

void *from_GBR_to_bp64_4x4__scalar(void *result, const unsigned __int16 *a2, const unsigned __int16 *a3, const unsigned __int16 *a4, const unsigned __int16 *a5, uint64_t a6, int a7, const unsigned __int16 *a8, const unsigned __int16 *a9)
{
  if (a7)
  {
    int v9 = (_WORD *)(*result + 16);
    do
    {
      unsigned int v10 = ((*a5 & 0x1FFF) * *(const unsigned __int16 *)((char *)a9 + ((*a5 >> 12) & 0xELL))
                         + (*(const unsigned __int16 *)((char *)a8 + ((*a5 >> 12) & 0xELL)) << 13)
                         + 4096) >> 13;
      if (v10 >= 0xFFFF) {
        LOWORD(v10) = -1;
      }
      *(v9 - 8) = v10;
      unsigned int v11 = ((*a2 & 0x1FFF) * *(const unsigned __int16 *)((char *)a9 + ((*a2 >> 12) & 0xELL))
                         + (*(const unsigned __int16 *)((char *)a8 + ((*a2 >> 12) & 0xELL)) << 13)
                         + 4096) >> 13;
      if (v11 >= 0xFFFF) {
        LOWORD(v11) = -1;
      }
      *(v9 - 7) = v11;
      unsigned int v12 = ((*a4 & 0x1FFF) * *(const unsigned __int16 *)((char *)a9 + ((*a4 >> 12) & 0xELL))
                         + (*(const unsigned __int16 *)((char *)a8 + ((*a4 >> 12) & 0xELL)) << 13)
                         + 4096) >> 13;
      if (v12 >= 0xFFFF) {
        LOWORD(v12) = -1;
      }
      *(v9 - 6) = v12;
      *(v9 - 5) = -1;
      unsigned int v13 = ((a5[1] & 0x1FFF) * *(const unsigned __int16 *)((char *)a9 + ((a5[1] >> 12) & 0xELL))
                         + (*(const unsigned __int16 *)((char *)a8 + ((a5[1] >> 12) & 0xELL)) << 13)
                         + 4096) >> 13;
      if (v13 >= 0xFFFF) {
        LOWORD(v13) = -1;
      }
      *(v9 - 4) = v13;
      unsigned int v14 = ((a2[1] & 0x1FFF) * *(const unsigned __int16 *)((char *)a9 + ((a2[1] >> 12) & 0xELL))
                         + (*(const unsigned __int16 *)((char *)a8 + ((a2[1] >> 12) & 0xELL)) << 13)
                         + 4096) >> 13;
      if (v14 >= 0xFFFF) {
        LOWORD(v14) = -1;
      }
      *(v9 - 3) = v14;
      unsigned int v15 = ((a4[1] & 0x1FFF) * *(const unsigned __int16 *)((char *)a9 + ((a4[1] >> 12) & 0xELL))
                         + (*(const unsigned __int16 *)((char *)a8 + ((a4[1] >> 12) & 0xELL)) << 13)
                         + 4096) >> 13;
      if (v15 >= 0xFFFF) {
        LOWORD(v15) = -1;
      }
      *(v9 - 2) = v15;
      *(v9 - 1) = -1;
      unsigned int v16 = ((a5[2] & 0x1FFF) * *(const unsigned __int16 *)((char *)a9 + ((a5[2] >> 12) & 0xELL))
                         + (*(const unsigned __int16 *)((char *)a8 + ((a5[2] >> 12) & 0xELL)) << 13)
                         + 4096) >> 13;
      if (v16 >= 0xFFFF) {
        LOWORD(v16) = -1;
      }
      *int v9 = v16;
      unsigned int v17 = ((a2[2] & 0x1FFF) * *(const unsigned __int16 *)((char *)a9 + ((a2[2] >> 12) & 0xELL))
                         + (*(const unsigned __int16 *)((char *)a8 + ((a2[2] >> 12) & 0xELL)) << 13)
                         + 4096) >> 13;
      if (v17 >= 0xFFFF) {
        LOWORD(v17) = -1;
      }
      v9[1] = v17;
      unsigned int v18 = ((a4[2] & 0x1FFF) * *(const unsigned __int16 *)((char *)a9 + ((a4[2] >> 12) & 0xELL))
                         + (*(const unsigned __int16 *)((char *)a8 + ((a4[2] >> 12) & 0xELL)) << 13)
                         + 4096) >> 13;
      if (v18 >= 0xFFFF) {
        LOWORD(v18) = -1;
      }
      v9[2] = v18;
      v9[3] = -1;
      unsigned int v19 = ((a5[3] & 0x1FFF) * *(const unsigned __int16 *)((char *)a9 + ((a5[3] >> 12) & 0xELL))
                         + (*(const unsigned __int16 *)((char *)a8 + ((a5[3] >> 12) & 0xELL)) << 13)
                         + 4096) >> 13;
      if (v19 >= 0xFFFF) {
        LOWORD(v19) = -1;
      }
      v9[4] = v19;
      unsigned int v20 = ((a2[3] & 0x1FFF) * *(const unsigned __int16 *)((char *)a9 + ((a2[3] >> 12) & 0xELL))
                         + (*(const unsigned __int16 *)((char *)a8 + ((a2[3] >> 12) & 0xELL)) << 13)
                         + 4096) >> 13;
      if (v20 >= 0xFFFF) {
        LOWORD(v20) = -1;
      }
      v9[5] = v20;
      unsigned int v21 = ((a4[3] & 0x1FFF) * *(const unsigned __int16 *)((char *)a9 + ((a4[3] >> 12) & 0xELL))
                         + (*(const unsigned __int16 *)((char *)a8 + ((a4[3] >> 12) & 0xELL)) << 13)
                         + 4096) >> 13;
      if (v21 >= 0xFFFF) {
        LOWORD(v21) = -1;
      }
      v9[6] = v21;
      v9[7] = -1;
      int v9 = (_WORD *)((char *)v9 + a6);
      a5 += 4;
      a2 += 4;
      a4 += 4;
      --a7;
    }
    while (a7);
  }
  return result;
}

void *from_GBR_to_bp64_2x2__scalar(void *result, const unsigned __int16 *a2, const unsigned __int16 *a3, const unsigned __int16 *a4, const unsigned __int16 *a5, uint64_t a6, int a7, const unsigned __int16 *a8, const unsigned __int16 *a9)
{
  if (a7)
  {
    int v9 = (_WORD *)(*result + 8);
    do
    {
      unsigned int v10 = ((*a5 & 0x1FFF) * *(const unsigned __int16 *)((char *)a9 + ((*a5 >> 12) & 0xELL))
                         + (*(const unsigned __int16 *)((char *)a8 + ((*a5 >> 12) & 0xELL)) << 13)
                         + 4096) >> 13;
      if (v10 >= 0xFFFF) {
        LOWORD(v10) = -1;
      }
      *(v9 - 4) = v10;
      unsigned int v11 = ((*a2 & 0x1FFF) * *(const unsigned __int16 *)((char *)a9 + ((*a2 >> 12) & 0xELL))
                         + (*(const unsigned __int16 *)((char *)a8 + ((*a2 >> 12) & 0xELL)) << 13)
                         + 4096) >> 13;
      if (v11 >= 0xFFFF) {
        LOWORD(v11) = -1;
      }
      *(v9 - 3) = v11;
      unsigned int v12 = ((*a4 & 0x1FFF) * *(const unsigned __int16 *)((char *)a9 + ((*a4 >> 12) & 0xELL))
                         + (*(const unsigned __int16 *)((char *)a8 + ((*a4 >> 12) & 0xELL)) << 13)
                         + 4096) >> 13;
      if (v12 >= 0xFFFF) {
        LOWORD(v12) = -1;
      }
      *(v9 - 2) = v12;
      *(v9 - 1) = -1;
      unsigned int v13 = ((a5[1] & 0x1FFF) * *(const unsigned __int16 *)((char *)a9 + ((a5[1] >> 12) & 0xELL))
                         + (*(const unsigned __int16 *)((char *)a8 + ((a5[1] >> 12) & 0xELL)) << 13)
                         + 4096) >> 13;
      if (v13 >= 0xFFFF) {
        LOWORD(v13) = -1;
      }
      *int v9 = v13;
      unsigned int v14 = ((a2[1] & 0x1FFF) * *(const unsigned __int16 *)((char *)a9 + ((a2[1] >> 12) & 0xELL))
                         + (*(const unsigned __int16 *)((char *)a8 + ((a2[1] >> 12) & 0xELL)) << 13)
                         + 4096) >> 13;
      if (v14 >= 0xFFFF) {
        LOWORD(v14) = -1;
      }
      v9[1] = v14;
      unsigned int v15 = ((a4[1] & 0x1FFF) * *(const unsigned __int16 *)((char *)a9 + ((a4[1] >> 12) & 0xELL))
                         + (*(const unsigned __int16 *)((char *)a8 + ((a4[1] >> 12) & 0xELL)) << 13)
                         + 4096) >> 13;
      if (v15 >= 0xFFFF) {
        LOWORD(v15) = -1;
      }
      v9[2] = v15;
      v9[3] = -1;
      int v9 = (_WORD *)((char *)v9 + a6);
      a5 += 2;
      a2 += 2;
      a4 += 2;
      --a7;
    }
    while (a7);
  }
  return result;
}

char **from_GbGrBR_to_bp16__scalar<(CFAPattern)0>(char **result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned int a7, uint64_t a8, uint64_t a9)
{
  if (a7 >= 2)
  {
    int v9 = 0;
    unsigned int v10 = *result;
    do
    {
      uint64_t v11 = 0;
      unsigned int v12 = &v10[a6];
      do
      {
        unsigned int v13 = &v10[a6];
        unsigned int v14 = ((*(_WORD *)(a5 + v11) & 0x1FFF)
                           * *(unsigned __int16 *)(a9 + ((*(unsigned __int16 *)(a5 + v11) >> 12) & 0xELL))
                           + (*(unsigned __int16 *)(a8 + ((*(unsigned __int16 *)(a5 + v11) >> 12) & 0xELL)) << 13)
                           + 4096) >> 13;
        if (v14 >= 0xFFFF) {
          LOWORD(v14) = -1;
        }
        *(_WORD *)unsigned int v10 = v14;
        unsigned int v15 = ((*(_WORD *)(a3 + v11) & 0x1FFF)
                           * *(unsigned __int16 *)(a9 + ((*(unsigned __int16 *)(a3 + v11) >> 12) & 0xELL))
                           + (*(unsigned __int16 *)(a8 + ((*(unsigned __int16 *)(a3 + v11) >> 12) & 0xELL)) << 13)
                           + 4096) >> 13;
        if (v15 >= 0xFFFF) {
          LOWORD(v15) = -1;
        }
        *((_WORD *)v10 + 1) = v15;
        unsigned int v16 = ((*(_WORD *)(a2 + v11) & 0x1FFF)
                           * *(unsigned __int16 *)(a9 + ((*(unsigned __int16 *)(a2 + v11) >> 12) & 0xELL))
                           + (*(unsigned __int16 *)(a8 + ((*(unsigned __int16 *)(a2 + v11) >> 12) & 0xELL)) << 13)
                           + 4096) >> 13;
        if (v16 >= 0xFFFF) {
          LOWORD(v16) = -1;
        }
        *(_WORD *)unsigned int v13 = v16;
        unsigned int v17 = *(unsigned __int16 *)(a4 + v11);
        uint64_t v18 = (v17 >> 12) & 0xELL;
        result = (char **)*(unsigned __int16 *)(a8 + v18);
        unsigned int v19 = ((v17 & 0x1FFF) * *(unsigned __int16 *)(a9 + v18) + (result << 13) + 4096) >> 13;
        if (v19 >= 0xFFFF) {
          LOWORD(v19) = -1;
        }
        *((_WORD *)v13 + 1) = v19;
        v10 += 4;
        v11 += 2;
      }
      while (v11 != 16);
      unsigned int v10 = &v12[a6];
      ++v9;
      a5 += v11;
      a2 += v11;
      a3 += v11;
      a4 += v11;
    }
    while (v9 != a7 >> 1);
  }
  return result;
}

char **from_GbGrBR_to_bp16__scalar<(CFAPattern)1>(char **result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned int a7, uint64_t a8, uint64_t a9)
{
  if (a7 >= 2)
  {
    int v9 = 0;
    unsigned int v10 = *result;
    do
    {
      uint64_t v11 = 0;
      unsigned int v12 = &v10[a6];
      do
      {
        unsigned int v13 = &v10[a6];
        unsigned int v14 = ((*(_WORD *)(a3 + v11) & 0x1FFF)
                           * *(unsigned __int16 *)(a9 + ((*(unsigned __int16 *)(a3 + v11) >> 12) & 0xELL))
                           + (*(unsigned __int16 *)(a8 + ((*(unsigned __int16 *)(a3 + v11) >> 12) & 0xELL)) << 13)
                           + 4096) >> 13;
        if (v14 >= 0xFFFF) {
          LOWORD(v14) = -1;
        }
        *(_WORD *)unsigned int v10 = v14;
        unsigned int v15 = ((*(_WORD *)(a5 + v11) & 0x1FFF)
                           * *(unsigned __int16 *)(a9 + ((*(unsigned __int16 *)(a5 + v11) >> 12) & 0xELL))
                           + (*(unsigned __int16 *)(a8 + ((*(unsigned __int16 *)(a5 + v11) >> 12) & 0xELL)) << 13)
                           + 4096) >> 13;
        if (v15 >= 0xFFFF) {
          LOWORD(v15) = -1;
        }
        *((_WORD *)v10 + 1) = v15;
        unsigned int v16 = ((*(_WORD *)(a4 + v11) & 0x1FFF)
                           * *(unsigned __int16 *)(a9 + ((*(unsigned __int16 *)(a4 + v11) >> 12) & 0xELL))
                           + (*(unsigned __int16 *)(a8 + ((*(unsigned __int16 *)(a4 + v11) >> 12) & 0xELL)) << 13)
                           + 4096) >> 13;
        if (v16 >= 0xFFFF) {
          LOWORD(v16) = -1;
        }
        *(_WORD *)unsigned int v13 = v16;
        unsigned int v17 = *(unsigned __int16 *)(a2 + v11);
        uint64_t v18 = (v17 >> 12) & 0xELL;
        result = (char **)*(unsigned __int16 *)(a8 + v18);
        unsigned int v19 = ((v17 & 0x1FFF) * *(unsigned __int16 *)(a9 + v18) + (result << 13) + 4096) >> 13;
        if (v19 >= 0xFFFF) {
          LOWORD(v19) = -1;
        }
        *((_WORD *)v13 + 1) = v19;
        v10 += 4;
        v11 += 2;
      }
      while (v11 != 16);
      unsigned int v10 = &v12[a6];
      ++v9;
      a5 += v11;
      a2 += v11;
      a3 += v11;
      a4 += v11;
    }
    while (v9 != a7 >> 1);
  }
  return result;
}

char **from_GbGrBR_to_bp16__scalar<(CFAPattern)2>(char **result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned int a7, uint64_t a8, uint64_t a9)
{
  if (a7 >= 2)
  {
    int v9 = 0;
    unsigned int v10 = *result;
    do
    {
      uint64_t v11 = 0;
      unsigned int v12 = &v10[a6];
      do
      {
        unsigned int v13 = &v10[a6];
        unsigned int v14 = ((*(_WORD *)(a2 + v11) & 0x1FFF)
                           * *(unsigned __int16 *)(a9 + ((*(unsigned __int16 *)(a2 + v11) >> 12) & 0xELL))
                           + (*(unsigned __int16 *)(a8 + ((*(unsigned __int16 *)(a2 + v11) >> 12) & 0xELL)) << 13)
                           + 4096) >> 13;
        if (v14 >= 0xFFFF) {
          LOWORD(v14) = -1;
        }
        *(_WORD *)unsigned int v10 = v14;
        unsigned int v15 = ((*(_WORD *)(a4 + v11) & 0x1FFF)
                           * *(unsigned __int16 *)(a9 + ((*(unsigned __int16 *)(a4 + v11) >> 12) & 0xELL))
                           + (*(unsigned __int16 *)(a8 + ((*(unsigned __int16 *)(a4 + v11) >> 12) & 0xELL)) << 13)
                           + 4096) >> 13;
        if (v15 >= 0xFFFF) {
          LOWORD(v15) = -1;
        }
        *((_WORD *)v10 + 1) = v15;
        unsigned int v16 = ((*(_WORD *)(a5 + v11) & 0x1FFF)
                           * *(unsigned __int16 *)(a9 + ((*(unsigned __int16 *)(a5 + v11) >> 12) & 0xELL))
                           + (*(unsigned __int16 *)(a8 + ((*(unsigned __int16 *)(a5 + v11) >> 12) & 0xELL)) << 13)
                           + 4096) >> 13;
        if (v16 >= 0xFFFF) {
          LOWORD(v16) = -1;
        }
        *(_WORD *)unsigned int v13 = v16;
        unsigned int v17 = *(unsigned __int16 *)(a3 + v11);
        uint64_t v18 = (v17 >> 12) & 0xELL;
        result = (char **)*(unsigned __int16 *)(a8 + v18);
        unsigned int v19 = ((v17 & 0x1FFF) * *(unsigned __int16 *)(a9 + v18) + (result << 13) + 4096) >> 13;
        if (v19 >= 0xFFFF) {
          LOWORD(v19) = -1;
        }
        *((_WORD *)v13 + 1) = v19;
        v10 += 4;
        v11 += 2;
      }
      while (v11 != 16);
      unsigned int v10 = &v12[a6];
      ++v9;
      a5 += v11;
      a2 += v11;
      a3 += v11;
      a4 += v11;
    }
    while (v9 != a7 >> 1);
  }
  return result;
}

char **from_GbGrBR_to_bp16__scalar<(CFAPattern)3>(char **result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned int a7, uint64_t a8, uint64_t a9)
{
  if (a7 >= 2)
  {
    int v9 = 0;
    unsigned int v10 = *result;
    do
    {
      uint64_t v11 = 0;
      unsigned int v12 = &v10[a6];
      do
      {
        unsigned int v13 = &v10[a6];
        unsigned int v14 = ((*(_WORD *)(a4 + v11) & 0x1FFF)
                           * *(unsigned __int16 *)(a9 + ((*(unsigned __int16 *)(a4 + v11) >> 12) & 0xELL))
                           + (*(unsigned __int16 *)(a8 + ((*(unsigned __int16 *)(a4 + v11) >> 12) & 0xELL)) << 13)
                           + 4096) >> 13;
        if (v14 >= 0xFFFF) {
          LOWORD(v14) = -1;
        }
        *(_WORD *)unsigned int v10 = v14;
        unsigned int v15 = ((*(_WORD *)(a2 + v11) & 0x1FFF)
                           * *(unsigned __int16 *)(a9 + ((*(unsigned __int16 *)(a2 + v11) >> 12) & 0xELL))
                           + (*(unsigned __int16 *)(a8 + ((*(unsigned __int16 *)(a2 + v11) >> 12) & 0xELL)) << 13)
                           + 4096) >> 13;
        if (v15 >= 0xFFFF) {
          LOWORD(v15) = -1;
        }
        *((_WORD *)v10 + 1) = v15;
        unsigned int v16 = ((*(_WORD *)(a3 + v11) & 0x1FFF)
                           * *(unsigned __int16 *)(a9 + ((*(unsigned __int16 *)(a3 + v11) >> 12) & 0xELL))
                           + (*(unsigned __int16 *)(a8 + ((*(unsigned __int16 *)(a3 + v11) >> 12) & 0xELL)) << 13)
                           + 4096) >> 13;
        if (v16 >= 0xFFFF) {
          LOWORD(v16) = -1;
        }
        *(_WORD *)unsigned int v13 = v16;
        unsigned int v17 = *(unsigned __int16 *)(a5 + v11);
        uint64_t v18 = (v17 >> 12) & 0xELL;
        result = (char **)*(unsigned __int16 *)(a8 + v18);
        unsigned int v19 = ((v17 & 0x1FFF) * *(unsigned __int16 *)(a9 + v18) + (result << 13) + 4096) >> 13;
        if (v19 >= 0xFFFF) {
          LOWORD(v19) = -1;
        }
        *((_WORD *)v13 + 1) = v19;
        v10 += 4;
        v11 += 2;
      }
      while (v11 != 16);
      unsigned int v10 = &v12[a6];
      ++v9;
      a5 += v11;
      a2 += v11;
      a3 += v11;
      a4 += v11;
    }
    while (v9 != a7 >> 1);
  }
  return result;
}

__n128 getSenselSitingOffsets(int a1, int a2, float *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v13[0] = -(float)(0.5 / (float)(1 << a2));
  v13[1] = v13[0];
  v13[2] = v13[0];
  float v14 = 0.5 / (float)(1 << a2);
  float v15 = v14;
  float v16 = v14;
  uint64_t v17 = 0;
  v11[0] = v14;
  v11[1] = v13[0];
  v11[2] = v14;
  v11[3] = v14;
  v11[4] = v13[0];
  v11[5] = v14;
  uint64_t v12 = 0;
  v9[0] = v13[0];
  v9[1] = v14;
  v9[2] = v13[0];
  v9[3] = v13[0];
  v9[4] = v14;
  v9[5] = v13[0];
  uint64_t v10 = 0;
  v7[0] = v14;
  v7[1] = v14;
  v7[2] = v14;
  v7[3] = v13[0];
  v7[4] = v13[0];
  v7[5] = v13[0];
  uint64_t v8 = 0;
  memset(v6, 0, sizeof(v6));
  if (a2)
  {
    BOOL v3 = v13;
    switch(a1)
    {
      case 0:
        break;
      case 1:
        BOOL v3 = v11;
        break;
      case 2:
        BOOL v3 = v9;
        break;
      case 3:
        BOOL v3 = v7;
        break;
      default:
        goto LABEL_4;
    }
  }
  else
  {
LABEL_4:
    BOOL v3 = (float *)v6;
  }
  __n128 result = *(__n128 *)v3;
  long long v5 = *((_OWORD *)v3 + 1);
  *(_OWORD *)a3 = *(_OWORD *)v3;
  *((_OWORD *)a3 + 1) = v5;
  return result;
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x270EE4290](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x270EE42E8](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x270EE42F8](allocator, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x270EE47F0](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
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

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x270EE4968](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CE0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

uint64_t CMBaseObjectGetDerivedStorage()
{
  return MEMORY[0x270EE79C0]();
}

size_t CMBlockBufferGetDataLength(CMBlockBufferRef theBuffer)
{
  return MEMORY[0x270EE7A20](theBuffer);
}

OSStatus CMBlockBufferGetDataPointer(CMBlockBufferRef theBuffer, size_t offset, size_t *lengthAtOffsetOut, size_t *totalLengthOut, char **dataPointerOut)
{
  return MEMORY[0x270EE7A30](theBuffer, offset, lengthAtOffsetOut, totalLengthOut, dataPointerOut);
}

uint64_t CMDerivedObjectCreate()
{
  return MEMORY[0x270EE7AD0]();
}

CMBlockBufferRef CMSampleBufferGetDataBuffer(CMSampleBufferRef sbuf)
{
  return (CMBlockBufferRef)MEMORY[0x270EE7C18](sbuf);
}

CMItemCount CMSampleBufferGetNumSamples(CMSampleBufferRef sbuf)
{
  return MEMORY[0x270EE7C58](sbuf);
}

size_t CMSampleBufferGetSampleSize(CMSampleBufferRef sbuf, CMItemIndex sampleIndex)
{
  return MEMORY[0x270EE7C90](sbuf, sampleIndex);
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x270EE7FD0](videoDesc);
}

void CVBufferSetAttachment(CVBufferRef buffer, CFStringRef key, CFTypeRef value, CVAttachmentMode attachmentMode)
{
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

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1E8](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA1F8](pixelBuffer, planeIndex);
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

Boolean CVPixelBufferIsPlanar(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA258](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x270EEA260](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA288](allocator, pixelBufferPool, pixelBufferOut);
}

void CVPixelBufferPoolRelease(CVPixelBufferPoolRef pixelBufferPool)
{
}

CVPixelBufferPoolRef CVPixelBufferPoolRetain(CVPixelBufferPoolRef pixelBufferPool)
{
  return (CVPixelBufferPoolRef)MEMORY[0x270EEA2E8](pixelBufferPool);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x270EEA330](pixelBuffer, unlockFlags);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

uint64_t MGGetProductType()
{
  return MEMORY[0x270F95FD8]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

uint64_t VTDecoderSessionEmitDecodedFrame()
{
  return MEMORY[0x270F06698]();
}

uint64_t VTDecoderSessionGetDestinationPixelBufferAttributes()
{
  return MEMORY[0x270F066B0]();
}

uint64_t VTDecoderSessionGetPixelBufferPool()
{
  return MEMORY[0x270F066B8]();
}

uint64_t VTDecoderSessionSetPixelBufferAttributes()
{
  return MEMORY[0x270F066C0]();
}

uint64_t VTRegisterVideoDecoderWithInfo()
{
  return MEMORY[0x270F06800]();
}

uint64_t VTVideoDecoderGetCMBaseObject()
{
  return MEMORY[0x270F06870]();
}

uint64_t VTVideoDecoderGetClassID()
{
  return MEMORY[0x270F06878]();
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

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983B0](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

std::bad_alloc *__cdecl std::bad_alloc::bad_alloc(std::bad_alloc *this)
{
  return (std::bad_alloc *)MEMORY[0x270F98E58](this);
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_group_async_f(dispatch_group_t group, dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

kern_return_t host_info(host_t host, host_flavor_t flavor, host_info_t host_info_out, mach_msg_type_number_t *host_info_outCnt)
{
  return MEMORY[0x270ED9E18](*(void *)&host, *(void *)&flavor, host_info_out, host_info_outCnt);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x270EDA178]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x270EDAE88](a1, a2);
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