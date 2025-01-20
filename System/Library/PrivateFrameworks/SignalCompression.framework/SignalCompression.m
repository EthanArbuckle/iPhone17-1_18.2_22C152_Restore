uint64_t gcl::ArithmeticEncoder::start(uint64_t this)
{
  uint64_t v1;
  long long v2;
  uint64_t v3;

  v1 = 0;
  *(void *)&v2 = 0xFFFF00000000;
  *((void *)&v2 + 1) = 0xFFFF00000000;
  *(_OWORD *)(this + 24) = v2;
  *(void *)(this + 16) = 0;
  *(void *)(this + 40) = 0;
  v3 = 0x217u;
  do
  {
    *(_WORD *)(this + v1 * 2 + 48) = gcl::ArithmeticEncoder::probUpdateLut[v1];
    *(_WORD *)(this + v3 * 2) = gcl::ArithmeticEncoder::probUpdateLut[v3 - 280];
    --v3;
    ++v1;
  }
  while (v1 != 256);
  return this;
}

void *gcl::ArithmeticDecoder::start(gcl::ArithmeticDecoder *this)
{
  *(void *)&long long v1 = 0xFFFF000000000000;
  *((void *)&v1 + 1) = 0xFFFF000000000000;
  *(_OWORD *)((char *)this + 24) = v1;
  *((void *)this + 5) = 16;
  unsigned int v2 = *(_DWORD *)this;
  if (!*(_DWORD *)this)
  {
    int v4 = -16777216;
    goto LABEL_7;
  }
  v3 = (unsigned __int8 *)*((void *)this + 1);
  int v4 = *v3 << 24;
  *((_DWORD *)this + 8) = v4;
  if (v2 == 1)
  {
LABEL_7:
    int v5 = v4 | 0xFF0000;
    goto LABEL_8;
  }
  int v5 = v4 | (v3[1] << 16);
  *((_DWORD *)this + 8) = v5;
  if (v2 <= 2)
  {
LABEL_8:
    int v6 = v5 | 0xFF00;
    goto LABEL_9;
  }
  int v6 = v5 | (v3[2] << 8);
  *((_DWORD *)this + 8) = v6;
  if (v2 == 3)
  {
LABEL_9:
    int v7 = 255;
    goto LABEL_10;
  }
  int v7 = v3[3];
LABEL_10:
  *((_DWORD *)this + 8) = v7 | v6;
  *((void *)this + 2) = 3;
  return memcpy((char *)this + 48, &gcl::ArithmeticDecoder::probUpdateLutInterleaved, 0x400uLL);
}

unsigned int *gcl::motion::EncoderImpl::encodeResidual(unsigned int *result, uint64_t a2, uint64_t a3, uint64_t a4, int a5, unsigned char *a6, void *a7)
{
  if (!*a6)
  {
    if (a5 < 1) {
      return result;
    }
    uint64_t v21 = 0;
    v22 = result + 4;
    uint64_t v23 = a5;
    while (1)
    {
      int v24 = *(_DWORD *)(a3 + 4 * v21);
      int v25 = *(_DWORD *)(a4 + 4 * v21);
      v26 = (_WORD *)(*a7 + 2 * v21);
      v27 = v22;
      unsigned int v28 = v24 - v25;
      if (v24 == v25) {
        break;
      }
      gcl::ArithmeticEncoder::encode(v22, 1, v26);
      v29 = (_WORD *)(a7[3] + 2 * v21);
      if ((v28 & 0x80000000) != 0)
      {
        gcl::ArithmeticEncoder::encode(v22, 0, v29);
        unsigned int v28 = -v28;
      }
      else
      {
        gcl::ArithmeticEncoder::encode(v22, 1, v29);
      }
      unsigned int v31 = v28 - 1;
      uint64_t v32 = a7[6];
      v33 = (_WORD *)(v32 + 2 * (int)(v21 << 6));
      if (v28 <= 0x3F)
      {
        gcl::ArithmeticEncoder::encode(v22, (v31 >> 5) & 1, (_WORD *)(v32 + 2 * (int)(v21 << 6)));
        gcl::ArithmeticEncoder::encode(v22, (v31 >> 4) & 1, &v33[(v31 >> 5) + 1]);
        gcl::ArithmeticEncoder::encode(v22, (v31 >> 3) & 1, &v33[(v31 >> 4) + 3]);
        gcl::ArithmeticEncoder::encode(v22, (v31 >> 2) & 1, &v33[(v31 >> 3) + 7]);
        gcl::ArithmeticEncoder::encode(v22, (v31 >> 1) & 1, &v33[(v31 >> 2) + 15]);
        int v30 = v31 & 1;
        v26 = &v33[(v31 >> 1) + 31];
        v27 = v22;
        goto LABEL_29;
      }
      gcl::ArithmeticEncoder::encode(v22, 1, (_WORD *)(v32 + 2 * (int)(v21 << 6)));
      gcl::ArithmeticEncoder::encode(v22, 1, v33 + 2);
      gcl::ArithmeticEncoder::encode(v22, 1, v33 + 6);
      gcl::ArithmeticEncoder::encode(v22, 1, v33 + 14);
      gcl::ArithmeticEncoder::encode(v22, 1, v33 + 30);
      gcl::ArithmeticEncoder::encode(v22, 1, v33 + 62);
      uint64_t v34 = a7[12];
      result = gcl::ArithmeticEncoder::encodeExpGolomb(v22, v28 - 64, *(_DWORD *)(v34 + 4 * v21), (_WORD *)(a7[9] + 2 * v21));
      int v35 = *(_DWORD *)(v34 + 4 * v21);
      unsigned int v36 = v31 >> v35;
      if (v35 && !v36)
      {
        int v37 = v35 - 1;
LABEL_35:
        *(_DWORD *)(v34 + 4 * v21) = v37;
        goto LABEL_36;
      }
      if (v36 >= 2)
      {
        int v37 = v35 + 1;
        goto LABEL_35;
      }
LABEL_36:
      if (++v21 == v23) {
        return result;
      }
    }
    int v30 = 0;
LABEL_29:
    result = gcl::ArithmeticEncoder::encode(v27, v30, v26);
    goto LABEL_36;
  }
  if (*a6 == 1 && a5 >= 1)
  {
    uint64_t v11 = 0;
    v12 = result + 4;
    uint64_t v13 = a5;
    while (1)
    {
      int v14 = *(_DWORD *)(a3 + 4 * v11) - *(_DWORD *)(a4 + 4 * v11);
      uint64_t v15 = a7[12];
      result = gcl::ArithmeticEncoder::encodeSignedExpGolomb(v12, v14, *(_DWORD *)(v15 + 4 * v11), (_WORD *)(a7[3] + 2 * v11), (_WORD *)(a7[9] + 2 * v11));
      unsigned int v16 = v14 >= 0 ? v14 : -v14;
      int v17 = *(_DWORD *)(v15 + 4 * v11);
      unsigned int v18 = v16 >> v17;
      if (v17 && v18 == 0) {
        break;
      }
      if (v18 >= 2)
      {
        int v20 = 1;
LABEL_17:
        *(_DWORD *)(v15 + 4 * v11) = v17 + v20;
      }
      if (++v11 == v13) {
        return result;
      }
    }
    int v20 = -1;
    goto LABEL_17;
  }
  return result;
}

unsigned int *gcl::ArithmeticEncoder::encode(unsigned int *result, int a2, _WORD *a3)
{
  unint64_t v3 = (unsigned __int16)*a3;
  unsigned int v4 = result[7];
  unsigned int v5 = (v4 * v3) >> 16;
  if (a2)
  {
    result[6] += v5;
    unsigned int v5 = v4 - v5;
    __int16 v6 = v3 - *(_WORD *)((char *)result + ((v3 >> 7) & 0x1FE) + 48);
  }
  else
  {
    __int16 v6 = *(_WORD *)((char *)result + (~(*a3 >> 7) & 0x1FE) + 48) + *a3;
  }
  result[7] = v5;
  *a3 = v6;
  if (v5 <= 0x4000)
  {
    unsigned int v7 = result[6];
    unsigned int v8 = result[10];
    while (1)
    {
      v7 *= 2;
      v5 *= 2;
      result[6] = v7;
      result[7] = v5;
      result[10] = ++v8;
      if (v8 == 8) {
        break;
      }
LABEL_18:
      if (v5 > 0x4000) {
        return result;
      }
    }
    uint64_t v9 = *((void *)result + 2);
    uint64_t v10 = (int)result[11];
    if (v9 + v10 + 1 > (unint64_t)*result) {
      return result;
    }
    if (HIBYTE(v7))
    {
      ++*(unsigned char *)(v9 + *((void *)result + 1) - 1);
      uint64_t v9 = *((void *)result + 2);
      if (result[11])
      {
        do
        {
          *(unsigned char *)(*((void *)result + 1) + v9) = 0;
          unsigned int v11 = result[11];
          uint64_t v9 = *((void *)result + 2) + 1;
          *((void *)result + 2) = v9;
          result[11] = --v11;
        }
        while (v11);
      }
    }
    else
    {
      if ((v7 + v5) >> 24)
      {
        result[11] = v10 + 1;
LABEL_17:
        unsigned int v8 = 0;
        unsigned int v7 = (unsigned __int16)v7;
        result[6] = (unsigned __int16)v7;
        result[10] = 0;
        goto LABEL_18;
      }
      if (v10)
      {
        do
        {
          *(unsigned char *)(*((void *)result + 1) + v9) = -1;
          unsigned int v12 = result[11];
          uint64_t v9 = *((void *)result + 2) + 1;
          *((void *)result + 2) = v9;
          result[11] = --v12;
        }
        while (v12);
      }
    }
    *(unsigned char *)(*((void *)result + 1) + v9) = *((_WORD *)result + 13);
    ++*((void *)result + 2);
    LOWORD(v7) = *((_WORD *)result + 12);
    unsigned int v5 = result[7];
    goto LABEL_17;
  }
  return result;
}

unsigned int *gcl::ArithmeticEncoder::encodeExpGolomb(unsigned int *a1, int a2, int a3, _WORD *a4)
{
  if ((a3 | a2) < 0) {
    gcl::ArithmeticEncoder::encodeExpGolomb();
  }
  int v5 = a3;
  int v6 = a2;
  for (int i = 1 << a3; v6 >= 1 << v5; int i = 1 << v5)
  {
    gcl::ArithmeticEncoder::encode(a1, 1, a4);
    ++v5;
    v6 -= i;
  }
  result = gcl::ArithmeticEncoder::encode(a1, 0, a4);
  if (v5)
  {
    int v10 = v5 - 1;
    do
    {
      __int16 v11 = 0x8000;
      result = gcl::ArithmeticEncoder::encode(a1, (v6 >> v10--) & 1, &v11);
    }
    while (v10 != -1);
  }
  return result;
}

unsigned int *gcl::ArithmeticEncoder::encodeSignedExpGolomb(unsigned int *a1, int a2, int a3, _WORD *a4, _WORD *a5)
{
  if (a3 < 0) {
    gcl::ArithmeticEncoder::encodeSignedExpGolomb();
  }
  int v6 = a2;
  if (a2 < 0) {
    a2 = -a2;
  }
  result = gcl::ArithmeticEncoder::encodeExpGolomb(a1, a2, a3, a5);
  if (v6)
  {
    return gcl::ArithmeticEncoder::encode(a1, v6 >= 0, a4);
  }
  return result;
}

uint64_t gcl::motion::EncoderImpl::encodeSequenceParameterSet(gcl::motion::EncoderImpl *this, int a2, unint64_t a3, unsigned __int8 *a4, unint64_t a5, unint64_t *a6)
{
  uint64_t result = 5;
  if (a3 <= 0xFF && a4 && a5 >= 8)
  {
    *(_DWORD *)a4 = 196611;
    a4[4] = 0;
    *(_WORD *)(a4 + 5) = a2;
    a4[7] = a3;
    *a6 = 8;
    *((_DWORD *)this + 1) = a3;
    *((_DWORD *)this + 2) = 0;
    *(_DWORD *)this = a2;
    std::vector<int>::size_type v8 = a2 * (int)a3;
    std::vector<int>::resize((std::vector<int> *)((char *)this + 1112), v8);
    std::vector<int>::resize((std::vector<int> *)((char *)this + 1088), v8);
    uint64_t v9 = (void *)*((void *)this + 136);
    uint64_t v10 = *((void *)this + 137) - (void)v9;
    if (v10 >= 1) {
      bzero(v9, 4 * (((unint64_t)v10 >> 2) - ((unint64_t)v10 > 3)) + 4);
    }
    return 0;
  }
  return result;
}

void std::vector<int>::resize(std::vector<int> *this, std::vector<int>::size_type __sz)
{
  std::vector<int>::size_type v2 = this->__end_ - this->__begin_;
  if (__sz <= v2)
  {
    if (__sz < v2) {
      this->__end_ = &this->__begin_[__sz];
    }
  }
  else
  {
    std::vector<int>::__append(this, __sz - v2);
  }
}

uint64_t gcl::motion::EncoderImpl::encodeFrame(uint64_t a1, int *a2, int a3, unint64_t *a4, unint64_t a5, unint64_t *a6, unsigned char *a7)
{
  if (!a2) {
    return 5;
  }
  int v8 = *(_DWORD *)a1;
  if (!*(_DWORD *)a1) {
    return 5;
  }
  uint64_t result = 5;
  if (a5 < 6) {
    return result;
  }
  if (!a4) {
    return result;
  }
  int v12 = *(_DWORD *)(a1 + 4);
  if (!v12) {
    return result;
  }
  uint64_t v15 = a2;
  if (v8 >= 2)
  {
    int v16 = 1;
    int v17 = *(_DWORD *)(a1 + 4);
    while (v12 < 1)
    {
LABEL_12:
      ++v16;
      v17 += v12 & ~(v12 >> 31);
      if (v16 == v8) {
        goto LABEL_13;
      }
    }
    unsigned int v18 = &a2[v17];
    int v19 = *(_DWORD *)(a1 + 4);
    while (1)
    {
      int v20 = *v18++;
      if ((v20 - 0x10000000) < 0xE0000001) {
        return 5;
      }
      if (!--v19) {
        goto LABEL_12;
      }
    }
  }
LABEL_13:
  if (a3)
  {
    if (a3 == 1)
    {
      uint64_t v21 = 1;
      goto LABEL_17;
    }
    return 5;
  }
  uint64_t v21 = 0;
LABEL_17:
  v22 = a7 + 4;
  char v50 = a7[5];
  char v51 = a7[4];
  int v23 = *(_DWORD *)(a1 + 8);
  uint64_t v52 = a7[6];
  uint64_t v24 = (v12 * v8);
  if (a3)
  {
    if ((int)v24 >= 1)
    {
      int v25 = *(int **)(a1 + 1088);
      v26 = *(_DWORD **)(a1 + 1112);
      uint64_t v27 = v24;
      unsigned int v28 = a2;
      do
      {
        int v30 = *v28++;
        int v29 = v30;
        int v31 = *v25++;
        *v26++ = v29 - v31;
        --v27;
      }
      while (v27);
    }
  }
  else if ((int)v24 >= 1)
  {
    uint64_t v32 = *(_DWORD **)(a1 + 1112);
    uint64_t v33 = v24;
    uint64_t v34 = a2;
    do
    {
      int v35 = *v34++;
      *v32++ = v35;
      --v33;
    }
    while (v33);
  }
  *(_DWORD *)(a1 + 16) = a5 - 8;
  *(void *)(a1 + 24) = a4 + 1;
  gcl::ArithmeticEncoder::start(a1 + 16);
  if (a7[5] > 1u) {
    return 5;
  }
  uint64_t v62 = 0;
  long long v60 = 0u;
  *(_OWORD *)__p = 0u;
  *(_OWORD *)v58 = 0u;
  *(_OWORD *)v59 = 0u;
  *(_OWORD *)v56 = 0u;
  long long v57 = 0u;
  *(_OWORD *)v55 = 0u;
  gcl::motion::ACContext::init((std::vector<int> *)v55, *(_DWORD *)(a1 + 4));
  int v48 = v23;
  uint64_t v49 = v21;
  std::vector<int>::size_type v36 = *(int *)(a1 + 4);
  std::vector<int>::value_type __x = 0;
  std::vector<int>::vector(&v54, v36, &__x);
  if (*(int *)a1 >= 1)
  {
    int v38 = 0;
    int v39 = a7[5];
    uint64_t v40 = *(void *)(a1 + 1112);
    LODWORD(v41) = *(_DWORD *)(a1 + 4);
    do
    {
      gcl::motion::EncoderImpl::encodeResidual((unsigned int *)a1, v37, v40, (uint64_t)v54.__begin_, v41, v22, v55);
      if (v39 && *(int *)(a1 + 4) >= 1)
      {
        uint64_t v42 = 0;
        std::vector<int>::pointer begin = v54.__begin_;
        do
        {
          begin[v42] = *(_DWORD *)(v40 + 4 * v42);
          ++v42;
        }
        while (v42 < *(int *)(a1 + 4));
      }
      ++v38;
      uint64_t v41 = *(int *)(a1 + 4);
      v40 += 4 * v41;
    }
    while (v38 < *(_DWORD *)a1);
  }
  if (v54.__begin_)
  {
    v54.__end_ = v54.__begin_;
    operator delete(v54.__begin_);
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v59[1])
  {
    *(void **)&long long v60 = v59[1];
    operator delete(v59[1]);
  }
  if (v58[0])
  {
    v58[1] = v58[0];
    operator delete(v58[0]);
  }
  if (v56[1])
  {
    *(void **)&long long v57 = v56[1];
    operator delete(v56[1]);
  }
  if (v55[0])
  {
    v55[1] = v55[0];
    operator delete(v55[0]);
  }
  unsigned int v44 = gcl::ArithmeticEncoder::stop((gcl::ArithmeticEncoder *)(a1 + 16));
  if (v44 >= 0xFFFFFF) {
    return 10;
  }
  unint64_t v45 = v44 + 8;
  *a4 = (v49 | (v48 << 16)) & 0xFFFFFFFFFFFF00FFLL | ((unint64_t)(v51 | (16 * v50)) << 8) | bswap64(v44) | (v52 << 32);
  if ((int)v24 >= 1)
  {
    v46 = *(_DWORD **)(a1 + 1088);
    do
    {
      int v47 = *v15++;
      *v46++ = v47;
      --v24;
    }
    while (v24);
  }
  *a6 = v45;
  if (v45 > a5) {
    return 1;
  }
  uint64_t result = 0;
  ++*(_DWORD *)(a1 + 8);
  return result;
}

void sub_25C51F944(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, uint64_t a18, char a19)
{
}

void gcl::motion::ACContext::init(std::vector<int> *this, int a2)
{
  unint64_t v4 = a2;
  std::vector<gcl::ArithmeticContext>::resize((uint64_t)this, a2);
  std::vector<gcl::ArithmeticContext>::resize((uint64_t)&this[1], v4);
  std::vector<gcl::ArithmeticContext>::resize((uint64_t)&this[2], a2 << 6);
  std::vector<gcl::ArithmeticContext>::resize((uint64_t)&this[3], v4);
  std::vector<int>::resize(this + 4, v4);
  std::vector<int>::pointer begin = (char *)this[4].__begin_;
  uint64_t v6 = (char *)this[4].__end_ - begin;
  if (v6 >= 1) {
    memset_pattern16(begin, &unk_25C528D70, 4 * (((unint64_t)v6 >> 2) - ((unint64_t)v6 > 3)) + 4);
  }
  end = this->__end_;
  if (this->__begin_ != end) {
    memset_pattern16(this->__begin_, &unk_25C528D80, (((char *)end - (char *)this->__begin_ - 2) & 0xFFFFFFFFFFFFFFFELL) + 2);
  }
  std::vector<int>::pointer v8 = this[1].__begin_;
  std::vector<int>::pointer v9 = this[1].__end_;
  if (v8 != v9) {
    memset_pattern16(v8, &unk_25C528D80, (((char *)v9 - (char *)v8 - 2) & 0xFFFFFFFFFFFFFFFELL) + 2);
  }
  std::vector<int>::pointer v10 = this[2].__begin_;
  std::vector<int>::pointer v11 = this[2].__end_;
  if (v10 != v11) {
    memset_pattern16(v10, &unk_25C528D80, (((char *)v11 - (char *)v10 - 2) & 0xFFFFFFFFFFFFFFFELL) + 2);
  }
  std::vector<int>::pointer v12 = this[3].__begin_;
  std::vector<int>::pointer v13 = this[3].__end_;
  if (v12 != v13)
  {
    memset_pattern16(v12, &unk_25C528D80, (((char *)v13 - (char *)v12 - 2) & 0xFFFFFFFFFFFFFFFELL) + 2);
  }
}

void gcl::motion::ACContext::~ACContext(gcl::motion::ACContext *this)
{
  std::vector<int>::size_type v2 = (void *)*((void *)this + 12);
  if (v2)
  {
    *((void *)this + 13) = v2;
    operator delete(v2);
  }
  unint64_t v3 = (void *)*((void *)this + 9);
  if (v3)
  {
    *((void *)this + 10) = v3;
    operator delete(v3);
  }
  unint64_t v4 = (void *)*((void *)this + 6);
  if (v4)
  {
    *((void *)this + 7) = v4;
    operator delete(v4);
  }
  int v5 = (void *)*((void *)this + 3);
  if (v5)
  {
    *((void *)this + 4) = v5;
    operator delete(v5);
  }
  uint64_t v6 = *(void **)this;
  if (*(void *)this)
  {
    *((void *)this + 1) = v6;
    operator delete(v6);
  }
}

unint64_t gcl::ArithmeticEncoder::stop(gcl::ArithmeticEncoder *this)
{
  uint64_t v1 = *((void *)this + 2);
  uint64_t v2 = *((int *)this + 11);
  if (v1 + v2 + 3 > (unint64_t)*(unsigned int *)this) {
    return 0;
  }
  int v4 = 0;
  int v5 = *((_DWORD *)this + 10);
  int v6 = *((_DWORD *)this + 6);
  do
  {
    if ((v6 | ((2 << v4) - 1)) > *((_DWORD *)this + 7) - 1) {
      break;
    }
    ++v4;
  }
  while (v4 != 16);
  unsigned int v7 = v6 | ~(-1 << v4);
  *((_DWORD *)this + 6) = v7;
  if (v5 <= 7)
  {
    int v8 = v5 - 8;
    do
      unsigned int v7 = (2 * v7) | 1;
    while (!__CFADD__(v8++, 1));
    *((_DWORD *)this + 6) = v7;
    *((_DWORD *)this + 10) = 8;
  }
  if (HIBYTE(v7))
  {
    ++*(unsigned char *)(v1 + *((void *)this + 1) - 1);
    uint64_t v1 = *((void *)this + 2);
    if (*((_DWORD *)this + 11))
    {
      do
      {
        *(unsigned char *)(*((void *)this + 1) + v1) = 0;
        int v10 = *((_DWORD *)this + 11);
        uint64_t v1 = *((void *)this + 2) + 1;
        *((void *)this + 2) = v1;
        *((_DWORD *)this + 11) = --v10;
      }
      while (v10);
    }
  }
  else if (v2)
  {
    do
    {
      *(unsigned char *)(*((void *)this + 1) + v1) = -1;
      int v11 = *((_DWORD *)this + 11);
      uint64_t v1 = *((void *)this + 2) + 1;
      *((void *)this + 2) = v1;
      *((_DWORD *)this + 11) = --v11;
    }
    while (v11);
  }
  *(unsigned char *)(*((void *)this + 1) + v1) = *((_WORD *)this + 13);
  uint64_t v12 = *((void *)this + 1);
  uint64_t v13 = *((void *)this + 2) + 1;
  *((void *)this + 2) = v13;
  *(unsigned char *)(v12 + v13) = BYTE1(*((_DWORD *)this + 6));
  unint64_t v3 = *((void *)this + 2) + 1;
  *((void *)this + 2) = v3;
  if (v5 >= 1)
  {
    *(unsigned char *)(*((void *)this + 1) + v3) = *((_DWORD *)this + 6);
    unint64_t v3 = *((void *)this + 2) + 1;
    *((void *)this + 2) = v3;
  }
  if (v3 >= 2)
  {
    uint64_t v14 = *((void *)this + 1) - 1;
    while (*(unsigned __int8 *)(v14 + v3) == 255)
    {
      *((void *)this + 2) = --v3;
      if (v3 <= 1) {
        return 1;
      }
    }
  }
  return v3;
}

gcl::motion::Encoder *gcl::motion::Encoder::Encoder(gcl::motion::Encoder *this)
{
  uint64_t v2 = operator new(0x470uLL);
  *(void *)uint64_t v2 = 0;
  v2[2] = 0;
  *((void *)v2 + 3) = 0;
  *((_OWORD *)v2 + 68) = 0u;
  *((_OWORD *)v2 + 69) = 0u;
  *((_OWORD *)v2 + 70) = 0u;
  *(void *)this = v2;
  return this;
}

{
  _DWORD *v2;

  uint64_t v2 = operator new(0x470uLL);
  *(void *)uint64_t v2 = 0;
  v2[2] = 0;
  *((void *)v2 + 3) = 0;
  *((_OWORD *)v2 + 68) = 0u;
  *((_OWORD *)v2 + 69) = 0u;
  *((_OWORD *)v2 + 70) = 0u;
  *(void *)this = v2;
  return this;
}

void gcl::motion::Encoder::~Encoder(gcl::motion::EncoderImpl **this)
{
}

{
  std::unique_ptr<gcl::motion::EncoderImpl>::reset[abi:ne180100](this, 0);
}

uint64_t gcl::motion::Encoder::estimateMaxEncodedFrameSize(gcl::motion::Encoder *this, uint64_t a2)
{
  return 4 * (void)this * a2 + 1024;
}

uint64_t gcl::motion::Encoder::estimateEncodingParameters()
{
  return 0x10000000000;
}

uint64_t gcl::motion::Encoder::encodeSequenceParameterSet(gcl::motion::EncoderImpl **this, int a2, unint64_t a3, unsigned __int8 *a4, unint64_t a5, unint64_t *a6)
{
  return gcl::motion::EncoderImpl::encodeSequenceParameterSet(*this, a2, a3, a4, a5, a6);
}

uint64_t gcl::motion::Encoder::encodeFrame(uint64_t *a1, int *a2, int a3, unint64_t *a4, unint64_t a5, unint64_t *a6, unsigned char *a7)
{
  return gcl::motion::EncoderImpl::encodeFrame(*a1, a2, a3, a4, a5, a6, a7);
}

void std::vector<gcl::ArithmeticContext>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 1;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + 8) = *(void *)a1 + 2 * a2;
    }
  }
  else
  {
    std::vector<gcl::ArithmeticContext>::__append((char **)a1, a2 - v2);
  }
}

void std::vector<gcl::ArithmeticContext>::__append(char **a1, unint64_t a2)
{
  int v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  int v5 = v6;
  unsigned int v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 1)
  {
    if (a2)
    {
      memset_pattern16(*(void **)(v4 - 8), &unk_25C528D80, 2 * a2);
      v7 += 2 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    int v8 = *a1;
    uint64_t v9 = v7 - *a1;
    uint64_t v10 = a2 + (v9 >> 1);
    if (v10 < 0) {
      std::vector<gcl::ArithmeticContext>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = v9 >> 1;
    unint64_t v12 = v5 - v8;
    if (v12 > v10) {
      uint64_t v10 = v12;
    }
    if (v12 >= 0x7FFFFFFFFFFFFFFELL) {
      uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v13 = v10;
    }
    if (v13)
    {
      uint64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<gcl::ArithmeticContext>>(v4, v13);
      int v8 = *a1;
      unsigned int v7 = a1[1];
    }
    else
    {
      uint64_t v14 = 0;
    }
    uint64_t v15 = &v14[2 * v11];
    int v16 = &v14[2 * v13];
    memset_pattern16(v15, &unk_25C528D80, 2 * a2);
    int v17 = &v15[2 * a2];
    while (v7 != v8)
    {
      __int16 v18 = *((_WORD *)v7 - 1);
      v7 -= 2;
      *((_WORD *)v15 - 1) = v18;
      v15 -= 2;
    }
    *a1 = v15;
    a1[1] = v17;
    a1[2] = v16;
    if (v8)
    {
      operator delete(v8);
    }
  }
}

void std::vector<gcl::ArithmeticContext>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2654B3900, MEMORY[0x263F8C060]);
}

void sub_25C51FFA0(_Unwind_Exception *a1)
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<gcl::ArithmeticContext>>(uint64_t a1, uint64_t a2)
{
  if (a2 < 0) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(2 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void std::vector<int>::__append(std::vector<int> *this, std::vector<int>::size_type __n)
{
  value = this->__end_cap_.__value_;
  p_end_cap = &this->__end_cap_;
  int v5 = value;
  end = p_end_cap[-1].__value_;
  if (__n <= value - end)
  {
    if (__n)
    {
      bzero(p_end_cap[-1].__value_, 4 * __n);
      end += __n;
    }
    this->__end_ = end;
  }
  else
  {
    std::vector<int>::pointer begin = this->__begin_;
    uint64_t v9 = (char *)end - (char *)this->__begin_;
    unint64_t v10 = __n + (v9 >> 2);
    if (v10 >> 62) {
      std::vector<gcl::ArithmeticContext>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = v9 >> 2;
    uint64_t v12 = (char *)v5 - (char *)begin;
    if (v12 >> 1 > v10) {
      unint64_t v10 = v12 >> 1;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v13 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v10;
    }
    if (v13)
    {
      uint64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)p_end_cap, v13);
      std::vector<int>::pointer begin = this->__begin_;
      end = this->__end_;
    }
    else
    {
      uint64_t v14 = 0;
    }
    uint64_t v15 = &v14[4 * v11];
    int v16 = (int *)&v14[4 * v13];
    bzero(v15, 4 * __n);
    int v17 = (int *)&v15[4 * __n];
    while (end != begin)
    {
      int v18 = *--end;
      *((_DWORD *)v15 - 1) = v18;
      v15 -= 4;
    }
    this->__begin_ = (std::vector<int>::pointer)v15;
    this->__end_ = v17;
    this->__end_cap_.__value_ = v16;
    if (begin)
    {
      operator delete(begin);
    }
  }
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(4 * a2);
}

std::vector<int> *__cdecl std::vector<int>::vector(std::vector<int> *this, std::vector<int>::size_type __n, const std::vector<int>::value_type *__x)
{
  this->__begin_ = 0;
  this->__end_ = 0;
  this->__end_cap_.__value_ = 0;
  if (__n)
  {
    std::vector<int>::__vallocate[abi:ne180100](this, __n);
    std::vector<int>::pointer end = this->__end_;
    unsigned int v7 = &end[__n];
    std::vector<int>::size_type v8 = 4 * __n;
    do
    {
      *end++ = *__x;
      v8 -= 4;
    }
    while (v8);
    this->__end_ = v7;
  }
  return this;
}

void sub_25C52020C(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<int>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::vector<gcl::ArithmeticContext>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void std::unique_ptr<gcl::motion::EncoderImpl>::reset[abi:ne180100](gcl::motion::EncoderImpl **a1, gcl::motion::EncoderImpl *a2)
{
  unint64_t v3 = *a1;
  *a1 = a2;
  if (v3)
  {
    gcl::motion::EncoderImpl::~EncoderImpl(v3);
    operator delete(v4);
  }
}

void gcl::motion::EncoderImpl::~EncoderImpl(gcl::motion::EncoderImpl *this)
{
  unint64_t v2 = (void *)*((void *)this + 139);
  if (v2)
  {
    *((void *)this + 14std::unique_ptr<gcl::motion::EncoderImpl>::reset[abi:ne180100](this, 0) = v2;
    operator delete(v2);
  }
  unint64_t v3 = (void *)*((void *)this + 136);
  if (v3)
  {
    *((void *)this + 137) = v3;
    operator delete(v3);
  }
}

void sub_25C5206A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_25C520904(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
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
    int v5 = &v4[a2];
    bzero(v4, a2);
    a1[1] = v5;
  }
  return a1;
}

void sub_25C5209D4(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(void **)v1;
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
    std::vector<gcl::ArithmeticContext>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

void std::vector<unsigned char>::__append(unint64_t *a1, size_t a2)
{
  int v5 = (char *)a1[1];
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
    unsigned int v7 = &v5[-*a1];
    unint64_t v8 = (unint64_t)&v7[a2];
    if ((uint64_t)&v7[a2] < 0) {
      std::vector<gcl::ArithmeticContext>::__throw_length_error[abi:ne180100]();
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
    unint64_t v13 = (char *)(v11 + v10);
    bzero(v12, a2);
    if (v5 == (char *)v6)
    {
      unint64_t v11 = (unint64_t)v12;
    }
    else
    {
      uint64_t v14 = &v5[~v6];
      do
      {
        char v15 = *--v5;
        (v14--)[v11] = v15;
      }
      while (v5 != (char *)v6);
      int v5 = (char *)*a1;
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

void *std::vector<int>::__init_with_size[abi:ne180100]<int const*,int const*>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    unint64_t v6 = result;
    uint64_t result = std::vector<int>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_25C520BD0(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_25C520E7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_25C5211B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, void *a13, uint64_t a14)
{
  if (__p) {
    operator delete(__p);
  }
  if (a13) {
    operator delete(a13);
  }

  _Unwind_Resume(a1);
}

void *std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(void *result, const void *a2, uint64_t a3, size_t __sz)
{
  if (__sz)
  {
    unint64_t v6 = result;
    uint64_t result = std::vector<unsigned char>::__vallocate[abi:ne180100](result, __sz);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_25C521288(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

std::vector<int> *__cdecl std::vector<int>::vector(std::vector<int> *this, std::vector<int>::size_type __n)
{
  this->__begin_ = 0;
  this->__end_ = 0;
  this->__end_cap_.__value_ = 0;
  if (__n)
  {
    std::vector<int>::__vallocate[abi:ne180100](this, __n);
    std::vector<int>::pointer end = this->__end_;
    bzero(end, 4 * __n);
    this->__end_ = &end[__n];
  }
  return this;
}

void sub_25C521300(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t gcl::computeCRC32(uint64_t this, const unsigned __int8 *a2)
{
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v2 = (unsigned __int8 *)this;
  LODWORD(this) = -1;
  do
  {
    int v3 = *v2++;
    this = (dword_25C5299B0[v3 ^ BYTE3(this)] ^ (this << 8));
    --a2;
  }
  while (a2);
  return this;
}

uint64_t gcl::motion::DecoderImpl::setSequenceParameterSet(gcl::motion::DecoderImpl *this, const AttributeInfo *a2)
{
  *(_DWORD *)this = 0;
  uint64_t result = 1;
  *((unsigned char *)this + 24) = 1;
  unsigned __int8 quatizationBits = a2->quatizationBits;
  *(_OWORD *)((char *)this + 28) = *(_OWORD *)&a2->apiVersion;
  *((unsigned char *)this + 44) = quatizationBits;
  uint64_t v5 = *((int *)this + 9) * (uint64_t)*((int *)this + 10);
  if (v5 == (int)v5)
  {
    std::vector<int>::size_type v6 = (int)v5;
    std::vector<int>::resize((std::vector<int> *)((char *)this + 1144), (int)v5);
    std::vector<int>::resize((std::vector<int> *)((char *)this + 1120), v6);
    uint64_t v7 = (void *)*((void *)this + 140);
    uint64_t v8 = *((void *)this + 141) - (void)v7;
    if (v8 >= 1) {
      bzero(v7, 4 * (((unint64_t)v8 >> 2) - ((unint64_t)v8 > 3)) + 4);
    }
    return 0;
  }
  return result;
}

uint64_t gcl::motion::DecoderImpl::decodeSequenceParameterSet(gcl::motion::DecoderImpl *this, const unsigned __int8 *a2, unint64_t a3, unint64_t *a4, AttributeInfo *a5)
{
  if (!a2 || a3 < 8 || *a2 != 3) {
    return 3;
  }
  a5->version = *(Version *)(a2 + 1);
  a5->attributeCount = *(unsigned __int16 *)(a2 + 5);
  a5->componentsPerAttribute = a2[7];
  *a4 = 8;
  return gcl::motion::DecoderImpl::setSequenceParameterSet(this, a5);
}

uint64_t gcl::motion::DecoderImpl::decodeResidual(uint64_t result, uint64_t a2, int *a3, int a4, unsigned char *a5, void *a6, _DWORD *a7)
{
  if (!*a5)
  {
    if (a4 < 1) {
      return result;
    }
    uint64_t v19 = 0;
    int v20 = (unsigned int *)(result + 48);
    unsigned int v41 = a4;
    uint64_t v21 = a4;
    while (1)
    {
      uint64_t result = gcl::ArithmeticDecoder::decode(v20, (_WORD *)(*a6 + 2 * v19));
      if (result) {
        break;
      }
      int v38 = 0;
LABEL_47:
      a7[v19++] = v38;
      if (v19 == v21)
      {
LABEL_48:
        uint64_t v39 = v41;
        do
        {
          int v40 = *a3++;
          *a7++ += v40;
          --v39;
        }
        while (v39);
        return result;
      }
    }
    BOOL v22 = gcl::ArithmeticDecoder::decode(v20, (_WORD *)(a6[3] + 2 * v19));
    int v23 = (_WORD *)(a6[6] + 2 * (int)(v19 << 6));
    if (gcl::ArithmeticDecoder::decode(v20, v23)) {
      unsigned int v24 = 32;
    }
    else {
      unsigned int v24 = 0;
    }
    if (gcl::ArithmeticDecoder::decode(v20, &v23[(v24 >> 5) + 1])) {
      int v25 = 16;
    }
    else {
      int v25 = 0;
    }
    unsigned int v26 = v25 | v24;
    if (gcl::ArithmeticDecoder::decode(v20, &v23[(v26 >> 4) + 3])) {
      int v27 = 8;
    }
    else {
      int v27 = 0;
    }
    unsigned int v28 = v26 | v27;
    if (gcl::ArithmeticDecoder::decode(v20, &v23[(v28 >> 3) + 7])) {
      int v29 = 4;
    }
    else {
      int v29 = 0;
    }
    unsigned int v30 = v28 | v29;
    if (gcl::ArithmeticDecoder::decode(v20, &v23[(v30 >> 2) + 15])) {
      int v31 = 2;
    }
    else {
      int v31 = 0;
    }
    unsigned int v32 = v30 | v31;
    uint64_t result = gcl::ArithmeticDecoder::decode(v20, &v23[(v32 >> 1) + 31]);
    int v33 = v32 | result;
    if ((v32 | result) == 0x3F)
    {
      uint64_t v34 = a6[12];
      uint64_t result = gcl::ArithmeticDecoder::decodeExpGolomb(v20, *(_DWORD *)(v34 + 4 * v19), (_WORD *)(a6[9] + 2 * v19));
      int v33 = result + 63;
      int v35 = *(_DWORD *)(v34 + 4 * v19);
      int v36 = ((int)result + 63) >> v35;
      if (!v35 || v36)
      {
        if (v36 < 2) {
          goto LABEL_44;
        }
        int v37 = 1;
      }
      else
      {
        int v37 = -1;
      }
      *(_DWORD *)(v34 + 4 * v19) = v35 + v37;
    }
LABEL_44:
    if (v22) {
      int v38 = v33 + 1;
    }
    else {
      int v38 = ~v33;
    }
    goto LABEL_47;
  }
  if (*a5 != 1) {
    gcl::motion::DecoderImpl::decodeResidual();
  }
  if (a4 >= 1)
  {
    uint64_t v10 = 0;
    unint64_t v11 = (unsigned int *)(result + 48);
    unsigned int v41 = a4;
    uint64_t v12 = a4;
    while (1)
    {
      uint64_t v13 = a6[12];
      uint64_t result = gcl::ArithmeticDecoder::decodeSignedExpGolomb(v11, *(_DWORD *)(v13 + 4 * v10), (_WORD *)(a6[3] + 2 * v10), (_WORD *)(a6[9] + 2 * v10));
      unsigned int v14 = (int)result >= 0 ? result : -(int)result;
      int v15 = *(_DWORD *)(v13 + 4 * v10);
      unsigned int v16 = v14 >> v15;
      if (v15 && v16 == 0) {
        break;
      }
      if (v16 >= 2)
      {
        int v18 = 1;
LABEL_15:
        *(_DWORD *)(v13 + 4 * v1std::unique_ptr<gcl::motion::EncoderImpl>::reset[abi:ne180100](this, 0) = v15 + v18;
      }
      a7[v10++] = result;
      if (v10 == v12) {
        goto LABEL_48;
      }
    }
    int v18 = -1;
    goto LABEL_15;
  }
  return result;
}

BOOL gcl::ArithmeticDecoder::decode(unsigned int *a1, _WORD *a2)
{
  unsigned int v2 = (unsigned __int16)*a2;
  unsigned int v3 = a1[7];
  unsigned int v4 = a1[8];
  if (v3 > 0x40000000)
  {
    unsigned int v11 = a1[7];
  }
  else
  {
    int v5 = a1[10];
    do
    {
      v4 *= 2;
      a1[10] = --v5;
      if (!v5)
      {
        uint64_t v6 = *((void *)a1 + 2);
        *((void *)a1 + 2) = v6 + 1;
        unint64_t v7 = *a1;
        if (v6 + 1 >= v7) {
          int v8 = 65280;
        }
        else {
          int v8 = *(unsigned __int8 *)(*((void *)a1 + 1) + v6 + 1) << 8;
        }
        unint64_t v9 = v6 + 2;
        *((void *)a1 + 2) = v9;
        if (v9 >= v7) {
          int v10 = 255;
        }
        else {
          int v10 = *(unsigned __int8 *)(*((void *)a1 + 1) + v9);
        }
        v4 |= v8 | v10;
        int v5 = 16;
        a1[10] = 16;
      }
      unsigned int v11 = 2 * v3;
      BOOL v12 = v3 >= 0x20000001;
      v3 *= 2;
    }
    while (!v12);
  }
  unsigned int v13 = (HIWORD(v11) * v2) & 0xFFFF0000;
  unsigned int v14 = v11 - v13;
  BOOL v15 = v4 >= v13;
  *a2 = *((_WORD *)a1 + ((v2 >> 7) & 0x1FE | v15) + 24) + v2;
  if (v4 < v13) {
    unsigned int v16 = v13;
  }
  else {
    unsigned int v16 = v14;
  }
  if (v4 < v13) {
    unsigned int v13 = 0;
  }
  a1[7] = v16;
  a1[8] = v4 - v13;
  return v15;
}

uint64_t gcl::ArithmeticDecoder::decodeExpGolomb(unsigned int *a1, int a2, _WORD *a3)
{
  if (a2 < 0) {
    gcl::ArithmeticDecoder::decodeExpGolomb();
  }
  int v4 = a2;
  int v6 = 0;
  if (gcl::ArithmeticDecoder::decode(a1, a3) && v4 <= 0x1E)
  {
    int v6 = 0;
    do
    {
      int v7 = v4 + 1;
      v6 |= 1 << v4;
      if (!gcl::ArithmeticDecoder::decode(a1, a3)) {
        break;
      }
    }
    while (v4++ < 30);
  }
  else
  {
    int v7 = v4;
  }
  int v9 = 0;
  if (v7)
  {
    int v10 = v7 - 1;
    do
    {
      __int16 v12 = 0x8000;
      v9 |= gcl::ArithmeticDecoder::decode(a1, &v12) << v10--;
    }
    while (v10 != -1);
  }
  return (v9 + v6);
}

uint64_t gcl::ArithmeticDecoder::decodeSignedExpGolomb(unsigned int *a1, int a2, _WORD *a3, _WORD *a4)
{
  if (a2 < 0) {
    gcl::ArithmeticDecoder::decodeSignedExpGolomb();
  }
  uint64_t result = gcl::ArithmeticDecoder::decodeExpGolomb(a1, a2, a4);
  if (result)
  {
    unsigned int v7 = result;
    if (gcl::ArithmeticDecoder::decode(a1, a3)) {
      return v7;
    }
    else {
      return -v7;
    }
  }
  return result;
}

uint64_t gcl::motion::DecoderImpl::decodeFrame(gcl::motion::DecoderImpl *this, const unsigned __int8 *a2, unint64_t a3, unint64_t *a4, int *a5)
{
  uint64_t result = 5;
  if (a3 >= 6)
  {
    if (a2)
    {
      unsigned int v7 = a5;
      if (a5)
      {
        if (*((unsigned char *)this + 32)) {
          return 11;
        }
        unsigned int v9 = *((unsigned __int8 *)this + 33);
        if (v9 >= 3)
        {
          if (a3 < 8) {
            return 3;
          }
          unint64_t v10 = *(void *)a2;
          *((void *)this + 1) = *(void *)a2;
          __int16 v11 = WORD1(v10);
          *((_WORD *)this + 3) = WORD1(v10);
          if (*((unsigned char *)this + 24) || v10 != 1)
          {
            if (!(_BYTE)v10)
            {
              *((unsigned char *)this + 4) = 0;
              char v15 = 1;
LABEL_44:
              char v32 = BYTE1(v10);
              v76[0] = BYTE1(v10) & 1;
              if ((v10 & 0x800) == 0)
              {
                uint64_t v33 = 8;
LABEL_46:
                char v65 = v15;
                unint64_t v34 = (v10 >> 40) & 0xFF00 | (v10 >> 24) & 0xFF0000 | HIBYTE(v10);
                *((_DWORD *)this + 12) = v34;
                *((void *)this + 7) = &a2[v33];
                gcl::ArithmeticDecoder::start((gcl::motion::DecoderImpl *)((char *)this + 48));
                uint64_t v75 = 0;
                long long v73 = 0u;
                *(_OWORD *)__p = 0u;
                *(_OWORD *)v71 = 0u;
                *(_OWORD *)v72 = 0u;
                *(_OWORD *)v69 = 0u;
                long long v70 = 0u;
                *(_OWORD *)v68 = 0u;
                gcl::motion::ACContext::init((std::vector<int> *)v68, *((_DWORD *)this + 10));
                std::vector<int>::size_type v35 = *((int *)this + 10);
                std::vector<int>::value_type __x = 0;
                std::vector<int>::vector(&v67, v35, &__x);
                if (*((int *)this + 9) >= 1)
                {
                  int v37 = 0;
                  int v38 = (_DWORD *)*((void *)this + 143);
                  LODWORD(v39) = *((_DWORD *)this + 10);
                  do
                  {
                    gcl::motion::DecoderImpl::decodeResidual((uint64_t)this, v36, v67.__begin_, v39, v76, v68, v38);
                    if ((v32 & 0x10) != 0 && *((int *)this + 10) >= 1)
                    {
                      uint64_t v40 = 0;
                      std::vector<int>::pointer begin = v67.__begin_;
                      do
                      {
                        begin[v40] = v38[v40];
                        ++v40;
                      }
                      while (v40 < *((int *)this + 10));
                    }
                    ++v37;
                    uint64_t v39 = *((int *)this + 10);
                    v38 += v39;
                  }
                  while (v37 < *((_DWORD *)this + 9));
                }
                if (v67.__begin_)
                {
                  v67.__end_ = v67.__begin_;
                  operator delete(v67.__begin_);
                }
                if (__p[0])
                {
                  __p[1] = __p[0];
                  operator delete(__p[0]);
                }
                if (v72[1])
                {
                  *(void **)&long long v73 = v72[1];
                  operator delete(v72[1]);
                }
                if (v71[0])
                {
                  v71[1] = v71[0];
                  operator delete(v71[0]);
                }
                if (v69[1])
                {
                  *(void **)&long long v70 = v69[1];
                  operator delete(v69[1]);
                }
                if (v68[0])
                {
                  v68[1] = v68[0];
                  operator delete(v68[0]);
                }
                uint64_t v42 = *((int *)this + 9) * (uint64_t)*((int *)this + 10);
                if (v42 != (int)v42) {
                  return 1;
                }
                if (v65)
                {
                  if ((int)v42 >= 1)
                  {
                    v46 = (int *)*((void *)this + 143);
                    uint64_t v47 = v42;
                    int v48 = v7;
                    do
                    {
                      int v49 = *v46++;
                      *v48++ = v49;
                      --v47;
                    }
                    while (v47);
LABEL_82:
                    long long v57 = (_DWORD *)*((void *)this + 140);
                    uint64_t v42 = v42;
                    do
                    {
                      int v58 = *v7++;
                      *v57++ = v58;
                      --v42;
                    }
                    while (v42);
                  }
                }
                else if ((int)v42 >= 1)
                {
                  char v50 = (int *)*((void *)this + 143);
                  char v51 = (int *)*((void *)this + 140);
                  uint64_t v52 = v42;
                  v53 = v7;
                  do
                  {
                    int v55 = *v50++;
                    int v54 = v55;
                    int v56 = *v51++;
                    *v53++ = v56 + v54;
                    --v52;
                  }
                  while (v52);
                  goto LABEL_82;
                }
                *a4 = v33 + v34;
                *((_WORD *)this + 8) = v11;
                goto LABEL_91;
              }
              unsigned int v43 = 0;
              uint64_t v44 = 8;
              while (1)
              {
                uint64_t v33 = v44 + 4;
                if (v44 + 4 > a3) {
                  return 3;
                }
                if ((a2[v44] & 0x80) != 0)
                {
                  v44 += 4;
                  if (v43++ < 0xF) {
                    continue;
                  }
                }
                goto LABEL_46;
              }
            }
            if (v10 != 1) {
              return result;
            }
          }
          else
          {
            unsigned int v12 = *((unsigned __int16 *)this + 8);
            if (v12 > WORD1(v10) && (int)(v12 - WORD1(v10)) < 0x8000
              || v12 < WORD1(v10) && (int)(WORD1(v10) - v12) > 0x8000)
            {
              return 8;
            }
          }
          *((unsigned char *)this + 4) = 1;
          if (!WORD1(v10) || *((unsigned __int16 *)this + 8) + 1 == WORD1(v10))
          {
            if (*((_DWORD *)this + 5)) {
              return 10;
            }
            char v15 = 0;
            goto LABEL_44;
          }
          return 7;
        }
        if (v9 != 1) {
          return 11;
        }
        int v13 = *a2;
        unsigned __int8 v14 = a2[1];
        if (*a2)
        {
          if (v13 != 1) {
            return result;
          }
          if (*((unsigned char *)this + 4)) {
            return 7;
          }
          *((unsigned char *)this + 4) = 1;
        }
        else
        {
          *((unsigned char *)this + 4) = 0;
        }
        v76[0] = v14 & 1;
        uint64_t v16 = *(unsigned int *)(a2 + 2);
        *((_DWORD *)this + 12) = v16;
        *((void *)this + 7) = a2 + 6;
        gcl::ArithmeticDecoder::start((gcl::motion::DecoderImpl *)((char *)this + 48));
        uint64_t v75 = 0;
        long long v73 = 0u;
        *(_OWORD *)__p = 0u;
        *(_OWORD *)v71 = 0u;
        *(_OWORD *)v72 = 0u;
        *(_OWORD *)v69 = 0u;
        long long v70 = 0u;
        *(_OWORD *)v68 = 0u;
        gcl::motion::ACContext::init((std::vector<int> *)v68, *((_DWORD *)this + 10));
        std::vector<int>::size_type v17 = *((int *)this + 10);
        std::vector<int>::value_type __x = 0;
        std::vector<int>::vector(&v67, v17, &__x);
        if (*((int *)this + 9) >= 1)
        {
          int v19 = 0;
          int v20 = (_DWORD *)*((void *)this + 143);
          LODWORD(v21) = *((_DWORD *)this + 10);
          do
          {
            gcl::motion::DecoderImpl::decodeResidual((uint64_t)this, v18, v67.__begin_, v21, v76, v68, v20);
            if ((v14 & 0x10) != 0 && *((int *)this + 10) >= 1)
            {
              uint64_t v22 = 0;
              std::vector<int>::pointer v23 = v67.__begin_;
              do
              {
                v23[v22] = v20[v22];
                ++v22;
              }
              while (v22 < *((int *)this + 10));
            }
            ++v19;
            uint64_t v21 = *((int *)this + 10);
            v20 += v21;
          }
          while (v19 < *((_DWORD *)this + 9));
        }
        if (v67.__begin_)
        {
          v67.__end_ = v67.__begin_;
          operator delete(v67.__begin_);
        }
        gcl::motion::ACContext::~ACContext((gcl::motion::ACContext *)v68);
        uint64_t v24 = *((int *)this + 9) * (uint64_t)*((int *)this + 10);
        if (v24 != (int)v24) {
          return 1;
        }
        if (v13)
        {
          if ((int)v24 >= 1)
          {
            int v25 = (int *)*((void *)this + 143);
            unsigned int v26 = (int *)*((void *)this + 140);
            uint64_t v27 = v24;
            unsigned int v28 = v7;
            do
            {
              int v30 = *v25++;
              int v29 = v30;
              int v31 = *v26++;
              *v28++ = v31 + v29;
              --v27;
            }
            while (v27);
LABEL_88:
            v63 = (_DWORD *)*((void *)this + 140);
            uint64_t v24 = v24;
            do
            {
              int v64 = *v7++;
              *v63++ = v64;
              --v24;
            }
            while (v24);
          }
        }
        else if ((int)v24 >= 1)
        {
          v59 = (int *)*((void *)this + 143);
          uint64_t v60 = v24;
          v61 = v7;
          do
          {
            int v62 = *v59++;
            *v61++ = v62;
            --v60;
          }
          while (v60);
          goto LABEL_88;
        }
        *a4 = v16 + 6;
LABEL_91:
        ++*(_DWORD *)this;
        uint64_t result = 0;
        if (*((unsigned char *)this + 24)) {
          *((unsigned char *)this + 24) = 0;
        }
      }
    }
  }
  return result;
}

void sub_25C521E40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, char a13)
{
}

gcl::motion::Decoder *gcl::motion::Decoder::Decoder(gcl::motion::Decoder *this)
{
  unsigned int v2 = (char *)operator new(0x490uLL);
  *(_DWORD *)unsigned int v2 = 0;
  v2[4] = -1;
  *((_WORD *)v2 + 3) = 0;
  *((_WORD *)v2 + 8) = 0;
  *((_DWORD *)v2 + 5) = 9;
  v2[24] = 1;
  *(void *)(v2 + 36) = 0;
  *(void *)(v2 + 28) = 0;
  v2[44] = 0;
  *((void *)v2 + 7) = 0;
  *((_OWORD *)v2 + 7std::unique_ptr<gcl::motion::EncoderImpl>::reset[abi:ne180100](this, 0) = 0u;
  *((_OWORD *)v2 + 71) = 0u;
  *((_OWORD *)v2 + 72) = 0u;
  *(void *)this = v2;
  return this;
}

{
  char *v2;

  unsigned int v2 = (char *)operator new(0x490uLL);
  *(_DWORD *)unsigned int v2 = 0;
  v2[4] = -1;
  *((_WORD *)v2 + 3) = 0;
  *((_WORD *)v2 + 8) = 0;
  *((_DWORD *)v2 + 5) = 9;
  v2[24] = 1;
  *(void *)(v2 + 36) = 0;
  *(void *)(v2 + 28) = 0;
  v2[44] = 0;
  *((void *)v2 + 7) = 0;
  *((_OWORD *)v2 + 7std::unique_ptr<gcl::motion::EncoderImpl>::reset[abi:ne180100](this, 0) = 0u;
  *((_OWORD *)v2 + 71) = 0u;
  *((_OWORD *)v2 + 72) = 0u;
  *(void *)this = v2;
  return this;
}

void gcl::motion::Decoder::~Decoder(gcl::motion::DecoderImpl **this)
{
}

{
  std::unique_ptr<gcl::motion::DecoderImpl>::reset[abi:ne180100](this, 0);
}

uint64_t gcl::motion::Decoder::setSequenceParameterSet(gcl::motion::DecoderImpl **this, const AttributeInfo *a2)
{
  return gcl::motion::DecoderImpl::setSequenceParameterSet(*this, a2);
}

uint64_t gcl::motion::Decoder::decodeSequenceParameterSet(gcl::motion::DecoderImpl **this, const unsigned __int8 *a2, unint64_t a3, unint64_t *a4, AttributeInfo *a5)
{
  return gcl::motion::DecoderImpl::decodeSequenceParameterSet(*this, a2, a3, a4, a5);
}

uint64_t gcl::motion::Decoder::decodeFrame(gcl::motion::DecoderImpl **this, const unsigned __int8 *a2, unint64_t a3, unint64_t *a4, int *a5)
{
  uint64_t result = gcl::motion::DecoderImpl::decodeFrame(*this, a2, a3, a4, a5);
  *((_DWORD *)*this + 5) = result;
  return result;
}

uint64_t gcl::motion::Decoder::getCurrentFrameNumber(gcl::motion::Decoder *this)
{
  return *(unsigned __int16 *)(*(void *)this + 10);
}

uint64_t gcl::motion::Decoder::getCurrentFrameQP(gcl::motion::Decoder *this)
{
  return *(unsigned __int8 *)(*(void *)this + 12);
}

uint64_t gcl::motion::Decoder::getCurrentFrameFlags(gcl::motion::Decoder *this)
{
  return *(unsigned __int8 *)(*(void *)this + 9);
}

uint64_t gcl::motion::Decoder::getCurrentFramePayloadLength(gcl::motion::Decoder *this)
{
  return (*(unsigned __int8 *)(*(void *)this + 13) << 16) | (*(unsigned __int8 *)(*(void *)this + 14) << 8) | *(unsigned __int8 *)(*(void *)this + 15);
}

uint64_t gcl::motion::Decoder::getlastDecodedFrameNumber(gcl::motion::Decoder *this)
{
  return *(unsigned __int16 *)(*(void *)this + 16);
}

void std::unique_ptr<gcl::motion::DecoderImpl>::reset[abi:ne180100](gcl::motion::DecoderImpl **a1, gcl::motion::DecoderImpl *a2)
{
  unsigned int v3 = *a1;
  *a1 = a2;
  if (v3)
  {
    gcl::motion::DecoderImpl::~DecoderImpl(v3);
    operator delete(v4);
  }
}

void gcl::motion::DecoderImpl::~DecoderImpl(gcl::motion::DecoderImpl *this)
{
  unsigned int v2 = (void *)*((void *)this + 143);
  if (v2)
  {
    *((void *)this + 144) = v2;
    operator delete(v2);
  }
  unsigned int v3 = (void *)*((void *)this + 140);
  if (v3)
  {
    *((void *)this + 141) = v3;
    operator delete(v3);
  }
}

void type metadata accessor for SCEncodedFrameType(uint64_t a1)
{
}

void type metadata accessor for SCError(uint64_t a1)
{
}

void sub_25C5220F8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_25C522144(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }
  return swift_retain();
}

uint64_t destroy for SignalSessionParameters(uint64_t a1)
{
  return sub_25C5221A8(*(void *)a1, *(void *)(a1 + 8));
}

uint64_t sub_25C5221A8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }
  return swift_release();
}

uint64_t _s17SignalCompression23SignalSessionParametersVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  unint64_t v5 = *(void *)(a2 + 8);
  sub_25C522144(*(void *)a2, v5);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  return a1;
}

uint64_t assignWithCopy for SignalSessionParameters(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  unint64_t v5 = *(void *)(a2 + 8);
  sub_25C522144(*(void *)a2, v5);
  uint64_t v6 = *(void *)a1;
  unint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  sub_25C5221A8(v6, v7);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  return a1;
}

__n128 __swift_memcpy20_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u32[0] = a2[1].n128_u32[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for SignalSessionParameters(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a1;
  unint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_25C5221A8(v4, v5);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for SignalSessionParameters(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xD && *(unsigned char *)(a1 + 20)) {
    return (*(_DWORD *)a1 + 13);
  }
  unsigned int v3 = (((*(void *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)(a1 + 8) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for SignalSessionParameters(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(_DWORD *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 13;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 2std::unique_ptr<gcl::motion::DecoderImpl>::reset[abi:ne180100](this, 0) = 1;
    }
  }
  else
  {
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 2std::unique_ptr<gcl::motion::DecoderImpl>::reset[abi:ne180100](this, 0) = 0;
    }
    if (a2)
    {
      *(void *)__n128 result = 0;
      *(void *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SignalSessionParameters()
{
  return &type metadata for SignalSessionParameters;
}

BOOL sub_25C5223AC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_25C5223C4()
{
  return sub_25C5287F8();
}

uint64_t sub_25C52240C()
{
  return sub_25C5287E8();
}

uint64_t sub_25C522438()
{
  return sub_25C5287F8();
}

uint64_t sub_25C52247C()
{
  if (*v0) {
    return 28785;
  }
  else {
    return 0x6172615065726F63;
  }
}

uint64_t sub_25C5224B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25C5228CC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25C5224D8()
{
  return 0;
}

void sub_25C5224E4(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_25C5224F0(uint64_t a1)
{
  unint64_t v2 = sub_25C522C34();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25C52252C(uint64_t a1)
{
  unint64_t v2 = sub_25C522C34();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25C522568(void *a1, uint64_t a2, uint64_t a3, int a4)
{
  int v14 = a4;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AECE8);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  __int16 v11 = (char *)v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25C522C34();
  sub_25C528818();
  v13[0] = a2;
  v13[1] = a3;
  char v15 = 0;
  sub_25C522D2C();
  sub_25C528778();
  if (!v4)
  {
    LOBYTE(v13[0]) = 1;
    sub_25C528788();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_25C5226EC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_25C5229B4(a1);
  if (!v2)
  {
    *(void *)a2 = result;
    *(void *)(a2 + 8) = v5;
    *(_DWORD *)(a2 + 16) = v6;
  }
  return result;
}

uint64_t sub_25C52271C(void *a1)
{
  return sub_25C522568(a1, *(void *)v1, *(void *)(v1 + 8), *(_DWORD *)(v1 + 16));
}

void *sub_25C52273C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_25C52274C(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_25C522758()
{
  return sub_25C5287F8();
}

uint64_t sub_25C5227BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25C522D80(&qword_26A5AECF8);
  return MEMORY[0x270EEEA70](a1, a2, v4);
}

uint64_t sub_25C522824()
{
  return sub_25C5287F8();
}

BOOL sub_25C522884(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_25C522898()
{
  return sub_25C522D80(&qword_26A5AECC8);
}

uint64_t sub_25C5228CC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6172615065726F63 && a2 == 0xEA0000000000736DLL;
  if (v2 || (sub_25C5287A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 28785 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_25C5287A8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_25C5229B4(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AECD0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  char v6 = &v10[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  sub_25C522C34();
  sub_25C528808();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    v10[15] = 0;
    sub_25C522CD8();
    sub_25C528758();
    uint64_t v7 = v11;
    unint64_t v9 = v12;
    LOBYTE(v11) = 1;
    sub_25C522144(v7, v12);
    sub_25C528768();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    sub_25C5221A8(v7, v9);
  }
  return v7;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_25C522C34()
{
  unint64_t result = qword_26A5AECD8;
  if (!qword_26A5AECD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5AECD8);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_25C522CD8()
{
  unint64_t result = qword_26A5AECE0;
  if (!qword_26A5AECE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5AECE0);
  }
  return result;
}

unint64_t sub_25C522D2C()
{
  unint64_t result = qword_26A5AECF0;
  if (!qword_26A5AECF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5AECF0);
  }
  return result;
}

uint64_t sub_25C522D80(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for SCError(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  char *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SignalSessionParameters.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SignalSessionParameters.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    char *result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x25C522F30);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          char *result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_25C522F58(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25C522F64(unsigned char *result, char a2)
{
  char *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SignalSessionParameters.CodingKeys()
{
  return &type metadata for SignalSessionParameters.CodingKeys;
}

unint64_t sub_25C522F84()
{
  unint64_t result = qword_26A5AED00;
  if (!qword_26A5AED00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5AED00);
  }
  return result;
}

unint64_t sub_25C522FDC()
{
  unint64_t result = qword_26A5AED08;
  if (!qword_26A5AED08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5AED08);
  }
  return result;
}

unint64_t sub_25C523034()
{
  unint64_t result = qword_26A5AED10;
  if (!qword_26A5AED10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5AED10);
  }
  return result;
}

uint64_t sub_25C523088(unint64_t a1, unint64_t a2)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  unint64_t v2 = a2 >> 62;
  uint64_t v3 = MEMORY[0x263F8EE78];
  unint64_t v4 = a1;
  switch(a2 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(a1), a1)) {
        goto LABEL_43;
      }
      uint64_t v5 = HIDWORD(a1) - (int)a1;
LABEL_6:
      if (!v5) {
        return v3;
      }
      uint64_t v38 = MEMORY[0x263F8EE78];
      int64_t v8 = v5 & ~(v5 >> 63);
      sub_25C527A18(0, v8, 0);
      uint64_t v3 = v38;
      uint64_t v31 = (int)v4;
      if (v2)
      {
        if (v2 == 1) {
          uint64_t v9 = (int)v4;
        }
        else {
          uint64_t v9 = *(void *)(v4 + 16);
        }
        if (v5 < 0)
        {
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
LABEL_44:
          __break(1u);
LABEL_45:
          __break(1u);
LABEL_46:
          __break(1u);
LABEL_47:
          __break(1u);
        }
      }
      else
      {
        if (v5 < 0) {
          goto LABEL_45;
        }
        uint64_t v9 = 0;
      }
      uint64_t v30 = (uint64_t)v4 >> 32;
      unint64_t v28 = v4 >> 16;
      unint64_t v29 = v4 >> 8;
      unint64_t v26 = HIDWORD(v4);
      unint64_t v27 = v4 >> 24;
      unint64_t v24 = HIWORD(v4);
      unint64_t v25 = v4 >> 40;
      unint64_t v23 = HIBYTE(v4);
      int v33 = v2;
      unint64_t v34 = v4;
      do
      {
        if (!v8)
        {
          __break(1u);
LABEL_36:
          __break(1u);
LABEL_37:
          __break(1u);
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          goto LABEL_42;
        }
        if (v2)
        {
          if (v2 == 1)
          {
            if (v9 < v31 || v9 >= v30) {
              goto LABEL_36;
            }
            uint64_t v10 = sub_25C528538();
            if (!v10) {
              goto LABEL_46;
            }
            uint64_t v11 = v10;
            uint64_t v12 = sub_25C528558();
            uint64_t v13 = v9 - v12;
            if (__OFSUB__(v9, v12)) {
              goto LABEL_39;
            }
          }
          else
          {
            if (v9 < *(void *)(v4 + 16)) {
              goto LABEL_38;
            }
            if (v9 >= *(void *)(v4 + 24)) {
              goto LABEL_40;
            }
            uint64_t v15 = sub_25C528538();
            if (!v15) {
              goto LABEL_47;
            }
            uint64_t v11 = v15;
            uint64_t v16 = sub_25C528558();
            uint64_t v13 = v9 - v16;
            if (__OFSUB__(v9, v16)) {
              goto LABEL_41;
            }
          }
          char v14 = *(unsigned char *)(v11 + v13);
        }
        else
        {
          if (v9 >= BYTE6(a2)) {
            goto LABEL_37;
          }
          v35[0] = v4;
          v35[1] = v29;
          v35[2] = v28;
          v35[3] = v27;
          v35[4] = v26;
          v35[5] = v25;
          v35[6] = v24;
          v35[7] = v23;
          int v36 = a2;
          __int16 v37 = WORD2(a2);
          char v14 = v35[v9];
        }
        v35[0] = v14;
        uint64_t v17 = sub_25C528798();
        uint64_t v19 = v18;
        uint64_t v38 = v3;
        unint64_t v2 = *(void *)(v3 + 16);
        unint64_t v20 = *(void *)(v3 + 24);
        if (v2 >= v20 >> 1)
        {
          sub_25C527A18(v20 > 1, v2 + 1, 1);
          uint64_t v3 = v38;
        }
        *(void *)(v3 + 16) = v2 + 1;
        uint64_t v21 = v3 + 16 * v2;
        *(void *)(v21 + 32) = v17;
        *(void *)(v21 + 4std::unique_ptr<gcl::motion::DecoderImpl>::reset[abi:ne180100](this, 0) = v19;
        ++v9;
        --v8;
        --v5;
        LODWORD(v2) = v33;
        unint64_t v4 = v34;
      }
      while (v5);
      return v3;
    case 2uLL:
      uint64_t v7 = *(void *)(a1 + 16);
      uint64_t v6 = *(void *)(a1 + 24);
      uint64_t v5 = v6 - v7;
      if (!__OFSUB__(v6, v7)) {
        goto LABEL_6;
      }
      goto LABEL_44;
    case 3uLL:
      return v3;
    default:
      uint64_t v5 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_25C5233EC(uint64_t a1, unint64_t a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  unint64_t v2 = a2 >> 62;
  uint64_t v3 = MEMORY[0x263F8EE78];
  switch(a2 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(a1), a1)) {
        goto LABEL_43;
      }
      uint64_t v4 = HIDWORD(a1) - (int)a1;
LABEL_6:
      if (!v4) {
        return v3;
      }
      uint64_t v29 = MEMORY[0x263F8EE78];
      int64_t v7 = v4 & ~(v4 >> 63);
      sub_25C527A18(0, v7, 0);
      uint64_t v3 = v29;
      if (v2)
      {
        if (v2 == 1) {
          uint64_t v8 = (int)a1;
        }
        else {
          uint64_t v8 = *(void *)(a1 + 16);
        }
        if (v4 < 0)
        {
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
LABEL_44:
          __break(1u);
LABEL_45:
          __break(1u);
LABEL_46:
          __break(1u);
LABEL_47:
          __break(1u);
        }
      }
      else
      {
        if (v4 < 0) {
          goto LABEL_45;
        }
        uint64_t v8 = 0;
      }
      int v25 = v2;
      do
      {
        if (!v7)
        {
          __break(1u);
LABEL_36:
          __break(1u);
LABEL_37:
          __break(1u);
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          goto LABEL_42;
        }
        if (v2)
        {
          if (v2 == 1)
          {
            if (v8 < (int)a1 || v8 >= a1 >> 32) {
              goto LABEL_36;
            }
            uint64_t v9 = sub_25C528538();
            if (!v9) {
              goto LABEL_46;
            }
            uint64_t v10 = v9;
            uint64_t v11 = sub_25C528558();
            uint64_t v12 = v8 - v11;
            if (__OFSUB__(v8, v11)) {
              goto LABEL_39;
            }
          }
          else
          {
            if (v8 < *(void *)(a1 + 16)) {
              goto LABEL_38;
            }
            if (v8 >= *(void *)(a1 + 24)) {
              goto LABEL_40;
            }
            uint64_t v14 = sub_25C528538();
            if (!v14) {
              goto LABEL_47;
            }
            uint64_t v10 = v14;
            uint64_t v15 = sub_25C528558();
            uint64_t v12 = v8 - v15;
            if (__OFSUB__(v8, v15)) {
              goto LABEL_41;
            }
          }
          char v13 = *(unsigned char *)(v10 + v12);
        }
        else
        {
          if (v8 >= BYTE6(a2)) {
            goto LABEL_37;
          }
          uint64_t v26 = a1;
          int v27 = a2;
          __int16 v28 = WORD2(a2);
          char v13 = *((unsigned char *)&v26 + v8);
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AED60);
        uint64_t v16 = swift_allocObject();
        *(_OWORD *)(v16 + 16) = xmmword_25C52A030;
        *(void *)(v16 + 56) = MEMORY[0x263F8E778];
        *(void *)(v16 + 64) = MEMORY[0x263F8E7C0];
        *(unsigned char *)(v16 + 32) = v13;
        unint64_t v2 = sub_25C528668();
        uint64_t v18 = v17;
        uint64_t v29 = v3;
        unint64_t v20 = *(void *)(v3 + 16);
        unint64_t v19 = *(void *)(v3 + 24);
        if (v20 >= v19 >> 1)
        {
          sub_25C527A18(v19 > 1, v20 + 1, 1);
          uint64_t v3 = v29;
        }
        *(void *)(v3 + 16) = v20 + 1;
        uint64_t v21 = v3 + 16 * v20;
        *(void *)(v21 + 32) = v2;
        *(void *)(v21 + 4std::unique_ptr<gcl::motion::DecoderImpl>::reset[abi:ne180100](this, 0) = v18;
        ++v8;
        --v7;
        --v4;
        LODWORD(v2) = v25;
      }
      while (v4);
      return v3;
    case 2uLL:
      uint64_t v6 = *(void *)(a1 + 16);
      uint64_t v5 = *(void *)(a1 + 24);
      uint64_t v4 = v5 - v6;
      if (!__OFSUB__(v5, v6)) {
        goto LABEL_6;
      }
      goto LABEL_44;
    case 3uLL:
      return v3;
    default:
      uint64_t v4 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t SignalDecoder.__allocating_init(encoderParams:)(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  SignalDecoder.init(encoderParams:)(a1, a2);
  return v4;
}

uint64_t SignalDecoder.init(encoderParams:)(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  sub_25C5284E8();
  swift_allocObject();
  *(void *)(v2 + 48) = sub_25C5284D8();
  sub_25C528628();
  sub_25C523F04();
  swift_retain();
  sub_25C5284C8();
  swift_release();
  uint64_t v6 = v31[0];
  unint64_t v7 = v31[1];
  unsigned int v8 = v32;
  sub_25C522144(v31[0], v31[1]);
  sub_25C522144(v31[0], v31[1]);
  uint64_t v9 = sub_25C528618();
  os_log_type_t v10 = sub_25C5286B8();
  uint64_t v28 = a1;
  unint64_t v29 = a2;
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315138;
    uint64_t v30 = v27;
    sub_25C528708();
    swift_bridgeObjectRelease();
    strcpy((char *)v31, "(coreParams: ");
    HIWORD(v31[1]) = -4864;
    sub_25C522144(v6, v7);
    sub_25C523088(v6, v7);
    sub_25C5221A8(v6, v7);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AED20);
    sub_25C525EE4((unint64_t *)&qword_26A5AED28, &qword_26A5AED20);
    sub_25C528658();
    swift_bridgeObjectRelease();
    sub_25C528688();
    swift_bridgeObjectRelease();
    sub_25C528688();
    sub_25C528798();
    sub_25C528688();
    swift_bridgeObjectRelease();
    sub_25C528688();
    v31[0] = sub_25C524BEC(v31[0], v31[1], &v30);
    sub_25C5286E8();
    swift_bridgeObjectRelease();
    sub_25C5221A8(v6, v7);
    sub_25C5221A8(v6, v7);
    _os_log_impl(&dword_25C51D000, v9, v10, "Decoder Params: %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261188A80](v27, -1, -1);
    MEMORY[0x261188A80](v11, -1, -1);
  }
  else
  {
    sub_25C5221A8(v31[0], v31[1]);
    sub_25C5221A8(v31[0], v31[1]);
  }

  float v12 = (float)(1 << v8);
  if (v8 >= 0x40) {
    float v12 = 0.0;
  }
  *(float *)(v3 + 4std::unique_ptr<gcl::motion::DecoderImpl>::reset[abi:ne180100](this, 0) = v12;
  v31[0] = v6;
  v31[1] = v7;
  sub_25C522144(v6, v7);
  sub_25C523F58();
  uint64_t v13 = v31[0];
  unint64_t v14 = v31[1];
  id v15 = objc_allocWithZone((Class)MotionDecoderWrapper);
  sub_25C522144(v13, v14);
  uint64_t v16 = (void *)sub_25C5285F8();
  id v17 = objc_msgSend(v15, sel_initWithEncoderSeqParams_, v16);
  sub_25C5221A8(v13, v14);

  *(void *)(v3 + 16) = v17;
  uint64_t v18 = sub_25C528618();
  os_log_type_t v19 = sub_25C5286B8();
  if (os_log_type_enabled(v18, v19))
  {
    unint64_t v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v20 = 0;
    _os_log_impl(&dword_25C51D000, v18, v19, "SC Decoder Session Init", v20, 2u);
    MEMORY[0x261188A80](v20, -1, -1);
  }

  uint64_t v21 = *(void **)(v3 + 16);
  signed int v22 = objc_msgSend(v21, sel_getAttributeCount);
  uint64_t v23 = (int)objc_msgSend(v21, sel_getComponentPerAttributeCount);
  unint64_t v24 = v23 * v22;
  uint64_t result = sub_25C524048(0, v24);
  *(void *)(v3 + 56) = result;
  *(void *)(v3 + 24) = v22;
  *(void *)(v3 + 32) = v23;
  if ((v24 - 0x2000000000000000) >> 62 == 3)
  {
    uint64_t v26 = sub_25C524134(0, 4 * v24);
    sub_25C5221A8(v28, v29);
    sub_25C5221A8(v6, v7);
    sub_25C5221A8(v13, v14);
    *(void *)(v3 + 64) = v26;
    return v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_25C523F04()
{
  unint64_t result = qword_26A5AED18;
  if (!qword_26A5AED18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5AED18);
  }
  return result;
}

uint64_t sub_25C523F58()
{
  uint64_t v1 = *v0;
  unint64_t v2 = v0[1];
  switch(v2 >> 62)
  {
    case 1uLL:
      uint64_t v3 = (int)v1;
      uint64_t v4 = v1 >> 32;
      goto LABEL_5;
    case 2uLL:
      uint64_t v3 = *(void *)(v1 + 16);
      uint64_t v4 = *(void *)(v1 + 24);
      goto LABEL_5;
    case 3uLL:
      goto LABEL_16;
    default:
      uint64_t v3 = 0;
      uint64_t v4 = BYTE6(v2);
LABEL_5:
      if (v3 == v4) {
        goto LABEL_16;
      }
      uint64_t result = sub_25C525614();
      if ((result & 0x100) != 0)
      {
        uint64_t v6 = *v0;
        unint64_t v7 = v0[1];
        uint64_t v8 = 0;
        switch(v7 >> 62)
        {
          case 1uLL:
            uint64_t v8 = v6 >> 32;
            break;
          case 2uLL:
            uint64_t v8 = *(void *)(v6 + 24);
            break;
          case 3uLL:
            break;
          default:
            uint64_t v8 = BYTE6(v7);
            break;
        }
        if (__OFSUB__(v8, 1))
        {
          __break(1u);
LABEL_16:
          __break(1u);
          JUMPOUT(0x25C524028);
        }
        return sub_25C525438(v8 - 1);
      }
      return result;
  }
}

uint64_t sub_25C524048(unsigned int a1, unint64_t a2)
{
  if ((a2 & 0x8000000000000000) != 0)
  {
    uint64_t result = sub_25C528738();
    __break(1u);
    return result;
  }
  if (!a2) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t result = sub_25C5286A8();
  *(void *)(result + 16) = a2;
  uint64_t v5 = (unsigned int *)(result + 32);
  if (a2 < 8)
  {
    unint64_t v6 = 0;
LABEL_9:
    unint64_t v10 = a2 - v6;
    do
    {
      *v5++ = a1;
      --v10;
    }
    while (v10);
    return result;
  }
  unint64_t v6 = a2 & 0xFFFFFFFFFFFFFFF8;
  v5 += a2 & 0xFFFFFFFFFFFFFFF8;
  int32x4_t v7 = vdupq_n_s32(a1);
  uint64_t v8 = (int32x4_t *)(result + 48);
  unint64_t v9 = a2 & 0xFFFFFFFFFFFFFFF8;
  do
  {
    v8[-1] = v7;
    *uint64_t v8 = v7;
    v8 += 2;
    v9 -= 8;
  }
  while (v9);
  if (v6 != a2) {
    goto LABEL_9;
  }
  return result;
}

uint64_t sub_25C524134(int a1, size_t a2)
{
  if ((a2 & 0x8000000000000000) != 0)
  {
    uint64_t result = sub_25C528738();
    __break(1u);
  }
  else
  {
    if (!a2) {
      return MEMORY[0x263F8EE78];
    }
    uint64_t v4 = sub_25C5286A8();
    *(void *)(v4 + 16) = a2;
    memset((void *)(v4 + 32), a1, a2);
    return v4;
  }
  return result;
}

uint64_t sub_25C5241F0(uint64_t a1, unint64_t a2)
{
  v43[3] = *MEMORY[0x263EF8340];
  uint64_t v41 = 0;
  uint64_t v5 = *(void **)(v2 + 16);
  unint64_t v6 = (void *)sub_25C5285F8();
  swift_beginAccess();
  int32x4_t v7 = *(char **)(v2 + 56);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v2 + 56) = v7;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    int32x4_t v7 = sub_25C524A3C(0, *((void *)v7 + 2), 0, v7);
  }
  *(void *)(v2 + 56) = v7;
  swift_bridgeObjectRetain();
  int v9 = objc_msgSend(v5, sel_decodeFrameInternal_decodedFrame_decodeError_, v6, v7 + 32, &v41);
  swift_endAccess();
  swift_bridgeObjectRelease();

  if (v9 >= 1 && v41 == 0)
  {
    uint64_t v17 = *(void *)(v2 + 24);
    uint64_t v18 = *(void *)(v2 + 32);
    os_log_type_t v19 = (char **)(v2 + 64);
    swift_beginAccess();
    unint64_t v20 = *(char **)(v2 + 64);
    char v21 = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v2 + 64) = v20;
    if ((v21 & 1) == 0) {
      goto LABEL_33;
    }
    if (v17 < 0)
    {
LABEL_34:
      __break(1u);
LABEL_35:
      __break(1u);
    }
    while (v17)
    {
      if (v18 < 0) {
        goto LABEL_35;
      }
      uint64_t v22 = 0;
      uint64_t v23 = 0;
      unint64_t v24 = v20 + 32;
      uint64_t v25 = 4 * v18;
      uint64_t v26 = 32;
      while (v23 != v17)
      {
        if ((unsigned __int128)(v23 * (__int128)v18) >> 64 != (v23 * v18) >> 63) {
          goto LABEL_32;
        }
        if (v18)
        {
          uint64_t v27 = 0;
          float v28 = *(float *)(v2 + 40);
          uint64_t v29 = *(void *)(v2 + 56);
          while ((v22 & 0x8000000000000000) == 0)
          {
            if ((unint64_t)(v22 + v27) >= *(void *)(v29 + 16)) {
              goto LABEL_30;
            }
            *(float *)&v24[4 * v27] = (float)*(int *)(v29 + v26 + 4 * v27) / v28;
            if (v18 == ++v27) {
              goto LABEL_14;
            }
          }
          __break(1u);
LABEL_30:
          __break(1u);
          break;
        }
LABEL_14:
        ++v23;
        v22 += v18;
        v24 += v25;
        v26 += v25;
        if (v23 == v17) {
          goto LABEL_23;
        }
      }
      __break(1u);
LABEL_32:
      __break(1u);
LABEL_33:
      unint64_t v20 = sub_25C525410((uint64_t)v20);
      *os_log_type_t v19 = v20;
      if (v17 < 0) {
        goto LABEL_34;
      }
    }
LABEL_23:
    *os_log_type_t v19 = v20;
    swift_endAccess();
    uint64_t v30 = swift_bridgeObjectRetain();
    uint64_t v31 = sub_25C525C90(v30);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_25C522144(a1, a2);
    sub_25C522144(a1, a2);
    uint64_t v11 = sub_25C528618();
    os_log_type_t v12 = sub_25C5286C8();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v40 = swift_slowAlloc();
      v43[0] = v40;
      *(_DWORD *)uint64_t v13 = 136315138;
      uint64_t v42 = sub_25C5233EC(a1, a2);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AED20);
      sub_25C525EE4((unint64_t *)&qword_26A5AED28, &qword_26A5AED20);
      uint64_t v14 = sub_25C528658();
      unint64_t v16 = v15;
      swift_bridgeObjectRelease();
      uint64_t v42 = sub_25C524BEC(v14, v16, v43);
      sub_25C5286E8();
      swift_bridgeObjectRelease();
      sub_25C5221A8(a1, a2);
      sub_25C5221A8(a1, a2);
      _os_log_impl(&dword_25C51D000, v11, v12, "Cannot decode input frame %s", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261188A80](v40, -1, -1);
      MEMORY[0x261188A80](v13, -1, -1);
    }
    else
    {

      sub_25C5221A8(a1, a2);
      sub_25C5221A8(a1, a2);
    }
    unsigned int v32 = sub_25C528618();
    os_log_type_t v33 = sub_25C5286D8();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = swift_slowAlloc();
      uint64_t v35 = swift_slowAlloc();
      v43[0] = v35;
      *(_DWORD *)uint64_t v34 = 136315394;
      swift_beginAccess();
      type metadata accessor for SCError(0);
      uint64_t v36 = sub_25C528678();
      sub_25C524BEC(v36, v37, v43);
      sub_25C5286E8();
      swift_bridgeObjectRelease();
      *(_WORD *)(v34 + 12) = 1024;
      sub_25C5286E8();
      _os_log_impl(&dword_25C51D000, v32, v33, "Cannot decode inputs: %s len %d", (uint8_t *)v34, 0x12u);
      swift_arrayDestroy();
      MEMORY[0x261188A80](v35, -1, -1);
      MEMORY[0x261188A80](v34, -1, -1);
    }

    swift_beginAccess();
    uint64_t v31 = v41;
    type metadata accessor for SCError(0);
    sub_25C52529C();
    swift_allocError();
    *uint64_t v38 = v31;
    swift_willThrow();
  }
  return v31;
}

uint64_t SignalDecoder.deinit()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC17SignalCompression13SignalDecoder_logger;
  uint64_t v2 = sub_25C528638();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t SignalDecoder.__deallocating_deinit()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC17SignalCompression13SignalDecoder_logger;
  uint64_t v2 = sub_25C528638();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *((unsigned int *)*v0 + 12);
  uint64_t v4 = *((unsigned __int16 *)*v0 + 26);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_25C5248F4(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_25C524904(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

char *sub_25C524940(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  int64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      int64_t v7 = a2;
    }
LABEL_8:
    int64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      int64_t v9 = *((void *)a4 + 2);
    }
    else {
      int64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AED58);
      unint64_t v10 = (char *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * v11 - 64;
      os_log_type_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[v8 + 32]) {
          memmove(v12, a4 + 32, v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      unint64_t v10 = (char *)MEMORY[0x263F8EE78];
      os_log_type_t v12 = (char *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_25C5259E4(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_25C524A3C(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AED68);
      unint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 29;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 2);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v10 = (char *)MEMORY[0x263F8EE78];
      uint64_t v13 = (char *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 32]) {
          memmove(v13, a4 + 32, 4 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_25C5258F8(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_25C524B4C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_25C524B74(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_25C524BEC(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_25C5286E8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_25C524BEC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25C524CC0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25C525F2C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_25C525F2C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_25C524CC0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_25C5286F8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_25C524E7C(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_25C528728();
  if (!v8)
  {
    sub_25C528738();
    __break(1u);
LABEL_17:
    uint64_t result = sub_25C528748();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_25C524E7C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25C524F14(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_25C5250F4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_25C5250F4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25C524F14(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_25C52508C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_25C528718();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_25C528738();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_25C528698();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_25C528748();
    __break(1u);
LABEL_14:
    uint64_t result = sub_25C528738();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_25C52508C(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AED58);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_25C5250F4(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AED58);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_25C528748();
  __break(1u);
  return result;
}

unsigned char **sub_25C525244(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  char *result = v4 + 1;
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_25C52529C()
{
  unint64_t result = qword_26A5AED30;
  if (!qword_26A5AED30)
  {
    type metadata accessor for SCError(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5AED30);
  }
  return result;
}

void *sub_25C5252F4(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  if (__src) {
    uint64_t v5 = a2 - (void)__src;
  }
  else {
    uint64_t v5 = 0;
  }
  if (!__dst)
  {
    if (v5 <= 0) {
      return __src;
    }
LABEL_12:
    __src = (void *)sub_25C528748();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v5) {
    goto LABEL_12;
  }
  if (__src)
  {
    return memmove(__dst, __src, a2 - (void)__src);
  }
  return __src;
}

unsigned char *sub_25C525398@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X1>, void *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    unint64_t result = 0;
LABEL_4:
    unint64_t v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    unint64_t result = (unsigned char *)sub_25C525ACC(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    unint64_t result = (unsigned char *)sub_25C525B90((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    unint64_t result = (unsigned char *)sub_25C525C0C((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

char *sub_25C525410(uint64_t a1)
{
  return sub_25C524940(0, *(void *)(a1 + 16), 0, (char *)a1);
}

char *sub_25C525424(uint64_t a1)
{
  return sub_25C524A3C(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_25C525438(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v3 = *v1;
  unint64_t v2 = v1[1];
  switch(v2 >> 62)
  {
    case 1uLL:
      uint64_t v6 = (int)v3;
      uint64_t v7 = v3 >> 32;
      if (v6 == v7) {
        goto LABEL_22;
      }
      if (v6 > a1) {
        goto LABEL_25;
      }
      if (v7 <= a1) {
        goto LABEL_27;
      }
      uint64_t v8 = sub_25C528538();
      if (!v8)
      {
LABEL_30:
        __break(1u);
        goto LABEL_31;
      }
      uint64_t v9 = v8;
      uint64_t v10 = sub_25C528558();
      uint64_t v11 = a1 - v10;
      if (!__OFSUB__(a1, v10)) {
        goto LABEL_19;
      }
      __break(1u);
LABEL_12:
      uint64_t v13 = *(void *)(v3 + 16);
      uint64_t v12 = *(void *)(v3 + 24);
      if (v13 == v12) {
        goto LABEL_23;
      }
      if (v13 <= a1 && v12 > a1)
      {
        uint64_t v15 = sub_25C528538();
        if (v15)
        {
          uint64_t v9 = v15;
          uint64_t v16 = sub_25C528558();
          uint64_t v11 = a1 - v16;
          if (!__OFSUB__(a1, v16))
          {
LABEL_19:
            uint64_t v5 = *(unsigned __int8 *)(v9 + v11);
            goto LABEL_20;
          }
LABEL_28:
          __break(1u);
        }
LABEL_31:
        __break(1u);
        JUMPOUT(0x25C525604);
      }
      goto LABEL_26;
    case 2uLL:
      goto LABEL_12;
    case 3uLL:
      __break(1u);
      goto LABEL_30;
    default:
      if (!BYTE6(v2))
      {
        __break(1u);
LABEL_22:
        __break(1u);
LABEL_23:
        __break(1u);
        goto LABEL_24;
      }
      if (BYTE6(v2) <= a1)
      {
LABEL_24:
        __break(1u);
LABEL_25:
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
        goto LABEL_28;
      }
      __int16 v18 = *v1;
      char v19 = BYTE2(v3);
      char v20 = BYTE3(v3);
      char v21 = BYTE4(v3);
      char v22 = BYTE5(v3);
      char v23 = BYTE6(v3);
      char v24 = HIBYTE(v3);
      __int16 v25 = v2;
      char v26 = BYTE2(v2);
      char v27 = BYTE3(v2);
      char v28 = BYTE4(v2);
      char v29 = BYTE5(v2);
      uint64_t v5 = *((unsigned __int8 *)&v18 + a1);
LABEL_20:
      sub_25C5285D8();
      return v5;
  }
}

uint64_t sub_25C525614()
{
  uint64_t v2 = *v0;
  unint64_t v1 = v0[1];
  __int16 v3 = sub_25C525718(*v0, v1);
  if ((v3 & 0x100) != 0)
  {
LABEL_12:
    __break(1u);
    JUMPOUT(0x25C525708);
  }
  unsigned __int8 v4 = v3;
  switch(v1 >> 62)
  {
    case 1uLL:
      uint64_t v5 = (int)v2;
      uint64_t v6 = v2 >> 32;
      break;
    case 2uLL:
      uint64_t v5 = *(void *)(v2 + 16);
      uint64_t v6 = *(void *)(v2 + 24);
      break;
    case 3uLL:
      sub_25C5221A8(v2, v1);
      uint64_t v6 = 0;
      uint64_t v5 = 0;
      break;
    default:
      sub_25C5221A8(v2, v1);
      uint64_t v5 = 0;
      uint64_t v6 = BYTE6(v1);
      break;
  }
  if (__OFSUB__(v6, 1))
  {
    __break(1u);
    goto LABEL_11;
  }
  if (v6 - 1 < v5)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v7 = sub_25C5285E8();
  uint64_t v9 = v8;
  sub_25C5221A8(v2, v1);
  uint64_t *v0 = v7;
  v0[1] = v9;
  return v4;
}

uint64_t sub_25C525718(uint64_t a1, unint64_t a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  int v2 = 1;
  int v3 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      if (!((a1 ^ (unint64_t)(a1 << 32)) >> 32)) {
        goto LABEL_5;
      }
      goto LABEL_16;
    case 2uLL:
      uint64_t v5 = *(void *)(a1 + 16);
      uint64_t v4 = *(void *)(a1 + 24);
      if (v5 != v4)
      {
        if (a2 >> 62 == 2)
        {
          uint64_t v6 = v4 - 1;
          if (__OFSUB__(v4, 1))
          {
LABEL_23:
            __break(1u);
            goto LABEL_24;
          }
          if (v6 < v5)
          {
LABEL_24:
            __break(1u);
LABEL_25:
            __break(1u);
          }
          if (v6 >= v4) {
            goto LABEL_25;
          }
          uint64_t v7 = sub_25C528538();
          if (!v7) {
            goto LABEL_27;
          }
          uint64_t v8 = v7;
          a1 = sub_25C528558();
          uint64_t v9 = v6 - a1;
          if (!__OFSUB__(v6, a1)) {
            goto LABEL_19;
          }
          __break(1u);
        }
LABEL_16:
        uint64_t v10 = a1 >> 32;
        if (a1 >> 32 <= (int)a1)
        {
          __break(1u);
LABEL_22:
          __break(1u);
          goto LABEL_23;
        }
        uint64_t v11 = sub_25C528538();
        if (v11)
        {
          uint64_t v8 = v11;
          uint64_t v12 = v10 - 1;
          uint64_t v13 = sub_25C528558();
          uint64_t v9 = v12 - v13;
          if (!__OFSUB__(v12, v13))
          {
LABEL_19:
            int v2 = 0;
            int v3 = *(unsigned __int8 *)(v8 + v9);
            return v3 | (v2 << 8);
          }
          goto LABEL_22;
        }
        __break(1u);
LABEL_27:
        __break(1u);
        JUMPOUT(0x25C5258E8);
      }
      int v3 = 0;
      int v2 = 1;
      return v3 | (v2 << 8);
    case 3uLL:
      return v3 | (v2 << 8);
    default:
      if ((a2 & 0xFF000000000000) != 0)
      {
        int v2 = 0;
        uint64_t v15 = a1;
        __int16 v16 = a2;
        char v17 = BYTE2(a2);
        char v18 = BYTE3(a2);
        char v19 = BYTE4(a2);
        char v20 = BYTE5(a2);
        int v3 = *((unsigned __int8 *)&v15 + BYTE6(a2) - 1);
      }
      else
      {
LABEL_5:
        int v3 = 0;
      }
      return v3 | (v2 << 8);
  }
}

char *sub_25C5258F8(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + 4 * a1 + 32);
    size_t v6 = 4 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  unint64_t result = (char *)sub_25C528748();
  __break(1u);
  return result;
}

char *sub_25C5259E4(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + a1 + 32);
    size_t v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  unint64_t result = (char *)sub_25C528748();
  __break(1u);
  return result;
}

uint64_t sub_25C525ACC(unsigned char *__src, unsigned char *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t sub_25C525B90(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_25C528568();
  swift_allocObject();
  uint64_t result = sub_25C528528();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_25C5285C8();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_25C525C0C(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_25C528568();
  swift_allocObject();
  uint64_t result = sub_25C528528();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0) {
    return v2 << 32;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_25C525C90(uint64_t a1)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AED48);
  uint64_t v10 = sub_25C525EE4(&qword_26A5AED50, &qword_26A5AED48);
  v8[0] = a1;
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v8, v9);
  int v3 = (unsigned char *)(*v2 + 32);
  size_t v4 = &v3[*(void *)(*v2 + 16)];
  swift_bridgeObjectRetain();
  sub_25C525398(v3, v4, &v7);
  uint64_t v5 = v7;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  return v5;
}

uint64_t sub_25C525D50()
{
  return type metadata accessor for SignalDecoder();
}

uint64_t type metadata accessor for SignalDecoder()
{
  uint64_t result = qword_26A5AED38;
  if (!qword_26A5AED38) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C525DA4()
{
  uint64_t result = sub_25C528638();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for SignalDecoder(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SignalDecoder);
}

uint64_t dispatch thunk of SignalDecoder.__allocating_init(encoderParams:)()
{
  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t dispatch thunk of SignalDecoder.decode(frame:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t sub_25C525EE4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25C525F2C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_25C525F88(unint64_t a1, unint64_t a2)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  unint64_t v2 = a2 >> 62;
  uint64_t v3 = MEMORY[0x263F8EE78];
  unint64_t v4 = a1;
  switch(a2 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(a1), a1)) {
        goto LABEL_43;
      }
      uint64_t v5 = HIDWORD(a1) - (int)a1;
LABEL_6:
      if (!v5) {
        return v3;
      }
      uint64_t v38 = MEMORY[0x263F8EE78];
      int64_t v8 = v5 & ~(v5 >> 63);
      sub_25C527A18(0, v8, 0);
      uint64_t v3 = v38;
      uint64_t v31 = (int)v4;
      if (v2)
      {
        if (v2 == 1) {
          uint64_t v9 = (int)v4;
        }
        else {
          uint64_t v9 = *(void *)(v4 + 16);
        }
        if (v5 < 0)
        {
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
LABEL_44:
          __break(1u);
LABEL_45:
          __break(1u);
LABEL_46:
          __break(1u);
LABEL_47:
          __break(1u);
        }
      }
      else
      {
        if (v5 < 0) {
          goto LABEL_45;
        }
        uint64_t v9 = 0;
      }
      uint64_t v30 = (uint64_t)v4 >> 32;
      unint64_t v28 = v4 >> 16;
      unint64_t v29 = v4 >> 8;
      unint64_t v26 = HIDWORD(v4);
      unint64_t v27 = v4 >> 24;
      unint64_t v24 = HIWORD(v4);
      unint64_t v25 = v4 >> 40;
      unint64_t v23 = HIBYTE(v4);
      int v33 = v2;
      unint64_t v34 = v4;
      do
      {
        if (!v8)
        {
          __break(1u);
LABEL_36:
          __break(1u);
LABEL_37:
          __break(1u);
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          goto LABEL_42;
        }
        if (v2)
        {
          if (v2 == 1)
          {
            if (v9 < v31 || v9 >= v30) {
              goto LABEL_36;
            }
            uint64_t v10 = sub_25C528538();
            if (!v10) {
              goto LABEL_46;
            }
            uint64_t v11 = v10;
            uint64_t v12 = sub_25C528558();
            uint64_t v13 = v9 - v12;
            if (__OFSUB__(v9, v12)) {
              goto LABEL_39;
            }
          }
          else
          {
            if (v9 < *(void *)(v4 + 16)) {
              goto LABEL_38;
            }
            if (v9 >= *(void *)(v4 + 24)) {
              goto LABEL_40;
            }
            uint64_t v15 = sub_25C528538();
            if (!v15) {
              goto LABEL_47;
            }
            uint64_t v11 = v15;
            uint64_t v16 = sub_25C528558();
            uint64_t v13 = v9 - v16;
            if (__OFSUB__(v9, v16)) {
              goto LABEL_41;
            }
          }
          char v14 = *(unsigned char *)(v11 + v13);
        }
        else
        {
          if (v9 >= BYTE6(a2)) {
            goto LABEL_37;
          }
          v35[0] = v4;
          v35[1] = v29;
          v35[2] = v28;
          v35[3] = v27;
          v35[4] = v26;
          v35[5] = v25;
          v35[6] = v24;
          v35[7] = v23;
          int v36 = a2;
          __int16 v37 = WORD2(a2);
          char v14 = v35[v9];
        }
        v35[0] = v14;
        uint64_t v17 = sub_25C528798();
        uint64_t v19 = v18;
        uint64_t v38 = v3;
        unint64_t v2 = *(void *)(v3 + 16);
        unint64_t v20 = *(void *)(v3 + 24);
        if (v2 >= v20 >> 1)
        {
          sub_25C527A18(v20 > 1, v2 + 1, 1);
          uint64_t v3 = v38;
        }
        *(void *)(v3 + 16) = v2 + 1;
        uint64_t v21 = v3 + 16 * v2;
        *(void *)(v21 + 32) = v17;
        *(void *)(v21 + 4std::unique_ptr<gcl::motion::DecoderImpl>::reset[abi:ne180100](this, 0) = v19;
        ++v9;
        --v8;
        --v5;
        LODWORD(v2) = v33;
        unint64_t v4 = v34;
      }
      while (v5);
      return v3;
    case 2uLL:
      uint64_t v7 = *(void *)(a1 + 16);
      uint64_t v6 = *(void *)(a1 + 24);
      uint64_t v5 = v6 - v7;
      if (!__OFSUB__(v6, v7)) {
        goto LABEL_6;
      }
      goto LABEL_44;
    case 3uLL:
      return v3;
    default:
      uint64_t v5 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t SignalEncoder.encoderParams.getter()
{
  uint64_t v1 = *(void *)(v0 + 64);
  sub_25C522144(v1, *(void *)(v0 + 72));
  return v1;
}

BOOL static SignalEncoder.FormatDescriptor.Semantic.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t SignalEncoder.FormatDescriptor.Semantic.hash(into:)()
{
  return sub_25C5287E8();
}

uint64_t SignalEncoder.FormatDescriptor.Semantic.hashValue.getter()
{
  return sub_25C5287F8();
}

SignalCompression::SignalEncoder::FormatDescriptor __swiftcall SignalEncoder.FormatDescriptor.init(attributeCount:componentsPerAttribute:semantic:)(Swift::Int attributeCount, Swift::Int componentsPerAttribute, SignalCompression::SignalEncoder::FormatDescriptor::Semantic semantic)
{
  char v4 = *(unsigned char *)semantic;
  *(void *)uint64_t v3 = attributeCount;
  *(void *)(v3 + 8) = componentsPerAttribute;
  *(unsigned char *)(v3 + 16) = v4;
  result.componentsPerAttribute = componentsPerAttribute;
  result.attributeCount = attributeCount;
  result.semantic = semantic;
  return result;
}

SignalCompression::SignalEncoder::Options __swiftcall SignalEncoder.Options.init(quantizationBits:)(SignalCompression::SignalEncoder::Options quantizationBits)
{
  v1->quantizationBits = quantizationBits.quantizationBits;
  return quantizationBits;
}

uint64_t SignalEncoder.FrameOptions.init(requestedType:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t SignalEncoder.EncodedFrame.data.getter()
{
  uint64_t v1 = *(void *)v0;
  sub_25C522144(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

uint64_t SignalEncoder.EncodedFrame.type.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t SignalEncoder.__allocating_init(formatDescriptor:options:)(unint64_t *a1, unint64_t *a2)
{
  uint64_t v4 = swift_allocObject();
  SignalEncoder.init(formatDescriptor:options:)(a1, a2);
  return v4;
}

void *SignalEncoder.init(formatDescriptor:options:)(unint64_t *a1, unint64_t *a2)
{
  uint64_t v3 = (void *)v2;
  unint64_t v5 = *a1;
  unint64_t v4 = a1[1];
  char v6 = *((unsigned char *)a1 + 16);
  unint64_t v7 = *a2;
  *(void *)(v2 + 24) = 0;
  sub_25C528628();
  if ((v5 & 0x8000000000000000) != 0
    || HIDWORD(v5)
    || (v4 & 0x8000000000000000) != 0
    || HIDWORD(v4)
    || (v7 & 0x8000000000000000) != 0
    || HIDWORD(v7))
  {
    goto LABEL_27;
  }
  *(void *)(v2 + 16) = objc_msgSend(objc_allocWithZone((Class)MotionEncoderWrapper), sel_initWithAttributeCount_componentCount_quantization_, v5, v4, v7);
  int64_t v8 = sub_25C528618();
  os_log_type_t v9 = sub_25C5286B8();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_25C51D000, v8, v9, "SC Encoder Session Init", v10, 2u);
    MEMORY[0x261188A80](v10, -1, -1);
  }

  *(void *)(v2 + 32) = v5;
  *(void *)(v2 + 4std::unique_ptr<gcl::motion::DecoderImpl>::reset[abi:ne180100](this, 0) = v4;
  unint64_t v36 = v4;
  *(unsigned char *)(v2 + 48) = v6;
  uint64_t v11 = 1 << v7;
  if (v7 >= 0x40) {
    uint64_t v11 = 0;
  }
  *(float *)(v2 + 52) = (float)v11;
  id v12 = objc_msgSend(*(id *)(v2 + 16), sel_getEncoderParams);
  uint64_t v13 = sub_25C528608();
  unint64_t v15 = v14;

  sub_25C522144(v13, v15);
  uint64_t v16 = sub_25C528618();
  os_log_type_t v17 = sub_25C5286B8();
  unint64_t v37 = v5;
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v18 = 134217984;
    uint64_t v19 = v18;
    uint64_t v20 = 0;
    switch(v15 >> 62)
    {
      case 1uLL:
        LODWORD(v2std::unique_ptr<gcl::motion::DecoderImpl>::reset[abi:ne180100](this, 0) = HIDWORD(v13) - v13;
        if (__OFSUB__(HIDWORD(v13), v13)) {
          goto LABEL_25;
        }
        uint64_t v20 = (int)v20;
LABEL_18:
        v38[0] = v20;
        sub_25C5286E8();
        sub_25C5221A8(v13, v15);
        _os_log_impl(&dword_25C51D000, v16, v17, "Encoder Params Length is %ld", v19, 0xCu);
        MEMORY[0x261188A80](v19, -1, -1);
        break;
      case 2uLL:
        uint64_t v22 = *(void *)(v13 + 16);
        uint64_t v21 = *(void *)(v13 + 24);
        BOOL v23 = __OFSUB__(v21, v22);
        uint64_t v20 = v21 - v22;
        if (!v23) {
          goto LABEL_18;
        }
        goto LABEL_26;
      case 3uLL:
        goto LABEL_18;
      default:
        uint64_t v20 = BYTE6(v15);
        goto LABEL_18;
    }
  }
  else
  {
    sub_25C5221A8(v13, v15);
  }

  sub_25C528518();
  swift_allocObject();
  sub_25C528508();
  v38[0] = v13;
  v38[1] = v15;
  int v39 = v7;
  sub_25C522144(v13, v15);
  sub_25C527954();
  v3[8] = sub_25C5284F8();
  v3[9] = v24;
  swift_retain_n();
  unint64_t v25 = sub_25C528618();
  os_log_type_t v26 = sub_25C5286C8();
  if (os_log_type_enabled(v25, v26))
  {
    unint64_t v27 = (uint8_t *)swift_slowAlloc();
    uint64_t v35 = swift_slowAlloc();
    v38[0] = v35;
    *(_DWORD *)unint64_t v27 = 136315138;
    unint64_t v28 = v3[8];
    unint64_t v29 = v3[9];
    sub_25C522144(v28, v29);
    sub_25C525F88(v28, v29);
    sub_25C5221A8(v28, v29);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5AED20);
    sub_25C5279A8();
    uint64_t v30 = sub_25C528658();
    unint64_t v32 = v31;
    swift_bridgeObjectRelease();
    sub_25C524BEC(v30, v32, v38);
    sub_25C5286E8();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C51D000, v25, v26, "Encoder Params encoded: %s", v27, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261188A80](v35, -1, -1);
    MEMORY[0x261188A80](v27, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  if ((unsigned __int128)((uint64_t)v37 * (__int128)(uint64_t)v36) >> 64 != (uint64_t)(v37 * v36) >> 63)
  {
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    sub_25C528738();
    __break(1u);
    JUMPOUT(0x25C526B4CLL);
  }
  uint64_t v33 = sub_25C524048(0, v37 * v36);
  sub_25C5221A8(v13, v15);
  sub_25C5221A8(v13, v15);
  swift_release();
  v3[7] = v33;
  return v3;
}

void sub_25C526B5C(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v98 = *MEMORY[0x263EF8340];
  uint64_t v4 = *a3;
  unint64_t v5 = a2;
  uint64_t v6 = a1;
  uint64_t v7 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v7) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1)) {
        goto LABEL_150;
      }
      uint64_t v7 = (int)v7;
LABEL_6:
      uint64_t v11 = *(void *)(v92 + 32);
      uint64_t v12 = *(void *)(v92 + 40);
      uint64_t v13 = v11 * v12;
      uint64_t v91 = v11;
      if ((unsigned __int128)(v11 * (__int128)v12) >> 64 != (v11 * v12) >> 63) {
        goto LABEL_144;
      }
      if ((unint64_t)(v13 - 0x2000000000000000) >> 62 != 3) {
        goto LABEL_145;
      }
      if (v7 != 4 * v13)
      {
        type metadata accessor for SCError(0);
        sub_25C522D80((unint64_t *)&qword_26A5AED30);
        swift_allocError();
        *unint64_t v25 = 1;
        swift_willThrow();
        return;
      }
      break;
    case 2uLL:
      uint64_t v9 = *(void *)(a1 + 16);
      uint64_t v8 = *(void *)(a1 + 24);
      BOOL v10 = __OFSUB__(v8, v9);
      uint64_t v7 = v8 - v9;
      if (!v10) {
        goto LABEL_6;
      }
      goto LABEL_151;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v7 = BYTE6(a2);
      goto LABEL_6;
  }
  uint64_t v93 = *(void *)(v92 + 40);
  switch(a2 >> 62)
  {
    case 1uLL:
      if ((int)a1 > a1 >> 32) {
        goto LABEL_152;
      }
      sub_25C522144(a1, a2);
      uint64_t v26 = sub_25C528538();
      if (!v26)
      {
        sub_25C528548();
        sub_25C5221A8(v6, v5);
        if (v91 < 0)
        {
LABEL_162:
          __break(1u);
LABEL_163:
          __break(1u);
        }
        if (!v91 || (v12 & 0x8000000000000000) == 0) {
          goto LABEL_113;
        }
        __break(1u);
LABEL_105:
        swift_release();
        swift_release();
        if (v91 < 0) {
          goto LABEL_163;
        }
        if (!v91 || (v12 & 0x8000000000000000) == 0) {
          goto LABEL_113;
        }
        __break(1u);
LABEL_109:
        swift_endAccess();
        uint64_t v4 = v88;
LABEL_110:
        swift_release();
        swift_release();
        goto LABEL_113;
      }
      uint64_t v27 = v26;
      uint64_t v28 = sub_25C528558();
      uint64_t v29 = (int)v6 - v28;
      if (__OFSUB__((int)v6, v28))
      {
LABEL_156:
        __break(1u);
LABEL_157:
        __break(1u);
LABEL_158:
        __break(1u);
        goto LABEL_159;
      }
      sub_25C528548();
      if (v91 < 0) {
        goto LABEL_157;
      }
      if (!v91) {
        goto LABEL_112;
      }
      uint64_t v86 = v6;
      unint64_t v87 = v5;
      if (v12 < 0) {
        goto LABEL_160;
      }
      uint64_t v30 = v27 + v29;
      unint64_t v31 = (char **)(v92 + 56);
      swift_beginAccess();
      unint64_t v32 = 0;
      uint64_t v33 = 0;
      uint64_t v34 = v91;
      do
      {
        if (v33 == v34) {
          goto LABEL_147;
        }
        if ((unsigned __int128)(v33 * (__int128)v12) >> 64 != (v33 * v12) >> 63) {
          goto LABEL_148;
        }
        if (v12)
        {
          float v35 = *(float *)(v92 + 52);
          unint64_t v36 = *(char **)(v92 + 56);
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          *(void *)(v92 + 56) = v36;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
            unint64_t v36 = sub_25C525424((uint64_t)v36);
          }
          uint64_t v38 = v93;
          *unint64_t v31 = v36;
          unint64_t v39 = v32;
          while (1)
          {
            float v40 = roundf(v35 * *(float *)(v30 + 4 * v39));
            if ((~LODWORD(v40) & 0x7F800000) == 0) {
              break;
            }
            if (v40 <= -2147500000.0) {
              goto LABEL_133;
            }
            if (v40 >= 2147500000.0) {
              goto LABEL_135;
            }
            char v41 = swift_isUniquelyReferenced_nonNull_native();
            *unint64_t v31 = v36;
            if (v41)
            {
              if ((v32 & 0x8000000000000000) != 0) {
                goto LABEL_137;
              }
            }
            else
            {
              unint64_t v36 = sub_25C525424((uint64_t)v36);
              *unint64_t v31 = v36;
              if ((v32 & 0x8000000000000000) != 0) {
                goto LABEL_137;
              }
            }
            if (v39 >= *((void *)v36 + 2)) {
              goto LABEL_139;
            }
            *(_DWORD *)&v36[4 * v39 + 32] = (int)v40;
            unint64_t v36 = *v31;
            ++v39;
            if (!--v38) {
              goto LABEL_37;
            }
          }
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
          __break(1u);
LABEL_152:
          __break(1u);
          __break(1u);
LABEL_153:
          __break(1u);
LABEL_154:
          __break(1u);
LABEL_155:
          __break(1u);
          goto LABEL_156;
        }
LABEL_37:
        ++v33;
        uint64_t v12 = v93;
        v32 += v93;
        uint64_t v34 = v91;
      }
      while (v33 != v91);
      swift_endAccess();
      uint64_t v6 = v86;
      unint64_t v5 = v87;
LABEL_112:
      sub_25C5221A8(v6, v5);
LABEL_113:
      uint64_t v95 = v4;
      uint64_t v96 = 0;
      long long v70 = *(void **)(v92 + 16);
      swift_beginAccess();
      id v71 = objc_msgSend(v70, sel_encodeFrameInternal_type_encodeError_, *(void *)(v92 + 56) + 32, &v95, &v96);
      if (v71)
      {
        v72 = v71;
        uint64_t v73 = sub_25C528608();
        unint64_t v75 = v74;

        if (!v96)
        {
          uint64_t v76 = v95;
          *a4 = v73;
          a4[1] = v75;
          a4[2] = v76;
          return;
        }
      }
      else
      {
        uint64_t v73 = 0;
        unint64_t v75 = 0xF000000000000000;
      }
      v77 = sub_25C528618();
      os_log_type_t v78 = sub_25C5286D8();
      if (os_log_type_enabled(v77, v78))
      {
        v79 = (uint8_t *)swift_slowAlloc();
        unint64_t v94 = v75;
        uint64_t v80 = swift_slowAlloc();
        *(void *)v97 = v80;
        *(_DWORD *)v79 = 136315138;
        swift_beginAccess();
        type metadata accessor for SCError(0);
        uint64_t v81 = sub_25C528678();
        sub_25C524BEC(v81, v82, (uint64_t *)v97);
        sub_25C5286E8();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25C51D000, v77, v78, "Cannot encode inputs: %s", v79, 0xCu);
        swift_arrayDestroy();
        uint64_t v83 = v80;
        unint64_t v75 = v94;
        MEMORY[0x261188A80](v83, -1, -1);
        MEMORY[0x261188A80](v79, -1, -1);
      }

      swift_beginAccess();
      uint64_t v84 = v96;
      type metadata accessor for SCError(0);
      sub_25C522D80((unint64_t *)&qword_26A5AED30);
      swift_allocError();
      void *v85 = v84;
      swift_willThrow();
      sub_25C527A04(v73, v75);
      return;
    case 2uLL:
      uint64_t v88 = *a3;
      uint64_t v42 = *(void *)(a1 + 16);
      uint64_t v43 = *(void *)(a1 + 24);
      swift_retain();
      swift_retain();
      uint64_t v44 = sub_25C528538();
      if (v44)
      {
        uint64_t v45 = v44;
        uint64_t v46 = sub_25C528558();
        if (__OFSUB__(v42, v46)) {
          goto LABEL_154;
        }
        uint64_t v47 = v45 + v42 - v46;
      }
      else
      {
        uint64_t v47 = 0;
      }
      if (__OFSUB__(v43, v42)) {
        goto LABEL_153;
      }
      sub_25C528548();
      if (!v47) {
        goto LABEL_105;
      }
      if (v91 < 0)
      {
LABEL_159:
        __break(1u);
LABEL_160:
        __break(1u);
        goto LABEL_161;
      }
      if (!v91) {
        goto LABEL_110;
      }
      if (v12 < 0)
      {
LABEL_161:
        __break(1u);
        goto LABEL_162;
      }
      v59 = (char **)(v92 + 56);
      swift_beginAccess();
      unint64_t v60 = 0;
      uint64_t v61 = 0;
      uint64_t v62 = v91;
      while (1)
      {
        if (v61 == v62) {
          goto LABEL_146;
        }
        if ((unsigned __int128)(v61 * (__int128)v12) >> 64 != (v61 * v12) >> 63) {
          goto LABEL_149;
        }
        if (v12) {
          break;
        }
LABEL_84:
        ++v61;
        uint64_t v12 = v93;
        v60 += v93;
        uint64_t v62 = v91;
        if (v61 == v91) {
          goto LABEL_109;
        }
      }
      float v63 = *(float *)(v92 + 52);
      int v64 = *(char **)(v92 + 56);
      char v65 = swift_isUniquelyReferenced_nonNull_native();
      *(void *)(v92 + 56) = v64;
      if ((v65 & 1) == 0) {
        int v64 = sub_25C525424((uint64_t)v64);
      }
      uint64_t v66 = v93;
      int *v59 = v64;
      unint64_t v67 = v60;
      while (1)
      {
        float v68 = roundf(v63 * *(float *)(v47 + 4 * v67));
        if ((~LODWORD(v68) & 0x7F800000) == 0) {
          break;
        }
        if (v68 <= -2147500000.0) {
          goto LABEL_132;
        }
        if (v68 >= 2147500000.0) {
          goto LABEL_134;
        }
        char v69 = swift_isUniquelyReferenced_nonNull_native();
        int *v59 = v64;
        if (v69)
        {
          if ((v60 & 0x8000000000000000) != 0) {
            goto LABEL_136;
          }
        }
        else
        {
          int v64 = sub_25C525424((uint64_t)v64);
          int *v59 = v64;
          if ((v60 & 0x8000000000000000) != 0) {
            goto LABEL_136;
          }
        }
        if (v67 >= *((void *)v64 + 2)) {
          goto LABEL_138;
        }
        *(_DWORD *)&v64[4 * v67 + 32] = (int)v68;
        int v64 = *v59;
        ++v67;
        if (!--v66) {
          goto LABEL_84;
        }
      }
LABEL_130:
      __break(1u);
      goto LABEL_131;
    case 3uLL:
      *(void *)((char *)&v97[1] + 2) = 0;
      *(void *)v97 = 0;
      uint64_t v89 = v4;
      if (v12 < 0) {
        goto LABEL_158;
      }
      int v48 = (char **)(v92 + 56);
      swift_beginAccess();
      unint64_t v49 = 0;
      uint64_t v50 = 0;
      uint64_t v51 = v91;
      while (1)
      {
        if (v50 == v51) {
          goto LABEL_141;
        }
        if ((unsigned __int128)(v50 * (__int128)v12) >> 64 != (v50 * v12) >> 63) {
          goto LABEL_143;
        }
        if (v12) {
          break;
        }
LABEL_59:
        ++v50;
        uint64_t v12 = v93;
        v49 += v93;
        uint64_t v51 = v91;
        if (v50 == v91) {
          goto LABEL_76;
        }
      }
      float v52 = *(float *)(v92 + 52);
      v53 = *(char **)(v92 + 56);
      char v54 = swift_isUniquelyReferenced_nonNull_native();
      *(void *)(v92 + 56) = v53;
      if ((v54 & 1) == 0) {
        v53 = sub_25C525424((uint64_t)v53);
      }
      uint64_t v55 = v93;
      *int v48 = v53;
      unint64_t v56 = v49;
      while (1)
      {
        float v57 = roundf(v52 * *(float *)&v97[v56]);
        if ((~LODWORD(v57) & 0x7F800000) == 0) {
          goto LABEL_121;
        }
        if (v57 <= -2147500000.0) {
          goto LABEL_123;
        }
        if (v57 >= 2147500000.0) {
          goto LABEL_125;
        }
        char v58 = swift_isUniquelyReferenced_nonNull_native();
        *int v48 = v53;
        if (v58)
        {
          if ((v49 & 0x8000000000000000) != 0) {
            goto LABEL_127;
          }
        }
        else
        {
          v53 = sub_25C525424((uint64_t)v53);
          *int v48 = v53;
          if ((v49 & 0x8000000000000000) != 0) {
            goto LABEL_127;
          }
        }
        if (v56 >= *((void *)v53 + 2)) {
          goto LABEL_129;
        }
        *(_DWORD *)&v53[4 * v56 + 32] = (int)v57;
        v53 = *v48;
        ++v56;
        if (!--v55) {
          goto LABEL_59;
        }
      }
    default:
      LOWORD(v97[0]) = a1;
      BYTE2(v97[0]) = BYTE2(a1);
      HIBYTE(v97[0]) = BYTE3(a1);
      LOBYTE(v97[1]) = BYTE4(a1);
      BYTE1(v97[1]) = BYTE5(a1);
      BYTE2(v97[1]) = BYTE6(a1);
      HIBYTE(v97[1]) = HIBYTE(a1);
      LOWORD(v97[2]) = a2;
      BYTE2(v97[2]) = BYTE2(a2);
      HIBYTE(v97[2]) = BYTE3(a2);
      LOBYTE(v97[3]) = BYTE4(a2);
      BYTE1(v97[3]) = BYTE5(a2);
      uint64_t v89 = v4;
      if (v12 < 0) {
        goto LABEL_155;
      }
      unint64_t v14 = (char **)(v92 + 56);
      swift_beginAccess();
      unint64_t v15 = 0;
      uint64_t v16 = 0;
      uint64_t v17 = v91;
      while (1)
      {
        if (v16 == v17) {
          goto LABEL_140;
        }
        if ((unsigned __int128)(v16 * (__int128)v12) >> 64 != (v16 * v12) >> 63) {
          goto LABEL_142;
        }
        if (v12) {
          break;
        }
LABEL_12:
        ++v16;
        uint64_t v12 = v93;
        v15 += v93;
        uint64_t v17 = v91;
        if (v16 == v91)
        {
LABEL_76:
          swift_endAccess();
          uint64_t v4 = v89;
          goto LABEL_113;
        }
      }
      float v18 = *(float *)(v92 + 52);
      uint64_t v19 = *(char **)(v92 + 56);
      char v20 = swift_isUniquelyReferenced_nonNull_native();
      *(void *)(v92 + 56) = v19;
      if ((v20 & 1) == 0) {
        uint64_t v19 = sub_25C525424((uint64_t)v19);
      }
      uint64_t v21 = v93;
      *unint64_t v14 = v19;
      unint64_t v22 = v15;
      while (1)
      {
        float v23 = roundf(v18 * *(float *)&v97[v22]);
        if ((~LODWORD(v23) & 0x7F800000) == 0) {
          break;
        }
        if (v23 <= -2147500000.0) {
          goto LABEL_122;
        }
        if (v23 >= 2147500000.0) {
          goto LABEL_124;
        }
        char v24 = swift_isUniquelyReferenced_nonNull_native();
        *unint64_t v14 = v19;
        if (v24)
        {
          if ((v15 & 0x8000000000000000) != 0) {
            goto LABEL_126;
          }
        }
        else
        {
          uint64_t v19 = sub_25C525424((uint64_t)v19);
          *unint64_t v14 = v19;
          if ((v15 & 0x8000000000000000) != 0) {
            goto LABEL_126;
          }
        }
        if (v22 >= *((void *)v19 + 2)) {
          goto LABEL_128;
        }
        *(_DWORD *)&v19[4 * v22 + 32] = (int)v23;
        uint64_t v19 = *v14;
        ++v22;
        if (!--v21) {
          goto LABEL_12;
        }
      }
      __break(1u);
LABEL_121:
      __break(1u);
LABEL_122:
      __break(1u);
LABEL_123:
      __break(1u);
LABEL_124:
      __break(1u);
LABEL_125:
      __break(1u);
LABEL_126:
      __break(1u);
LABEL_127:
      __break(1u);
LABEL_128:
      __break(1u);
LABEL_129:
      __break(1u);
      goto LABEL_130;
  }
}

uint64_t SignalEncoder.deinit()
{
  swift_bridgeObjectRelease();
  sub_25C5221A8(*(void *)(v0 + 64), *(void *)(v0 + 72));
  uint64_t v1 = v0 + OBJC_IVAR____TtC17SignalCompression13SignalEncoder_logger;
  uint64_t v2 = sub_25C528638();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t SignalEncoder.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  sub_25C5221A8(*(void *)(v0 + 64), *(void *)(v0 + 72));
  uint64_t v1 = v0 + OBJC_IVAR____TtC17SignalCompression13SignalEncoder_logger;
  uint64_t v2 = sub_25C528638();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

unint64_t static SCError._nsErrorDomain.getter()
{
  return 0xD000000000000019;
}

uint64_t sub_25C527810(uint64_t a1)
{
  uint64_t v2 = sub_25C522D80(&qword_26A5AECF8);
  return MEMORY[0x270EEEA80](a1, v2);
}

uint64_t sub_25C527868(uint64_t a1)
{
  uint64_t v2 = sub_25C522D80(&qword_26A5AECF8);
  return MEMORY[0x270EEEA78](a1, v2);
}

unint64_t sub_25C5278C8()
{
  return 0xD000000000000019;
}

uint64_t sub_25C5278E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25C522D80(&qword_26A5AECF8);
  return MEMORY[0x270EEEA68](a1, a2, v4);
}

unint64_t sub_25C527954()
{
  unint64_t result = qword_26A5AED70;
  if (!qword_26A5AED70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5AED70);
  }
  return result;
}

unint64_t sub_25C5279A8()
{
  unint64_t result = qword_26A5AED28;
  if (!qword_26A5AED28)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5AED20);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5AED28);
  }
  return result;
}

uint64_t sub_25C527A04(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_25C5221A8(a1, a2);
  }
  return a1;
}

uint64_t sub_25C527A18(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25C527A38(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_25C527A38(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5AEDB0);
    BOOL v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    BOOL v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_25C528748();
  __break(1u);
  return result;
}

unint64_t sub_25C527BA8()
{
  unint64_t result = qword_26A5AED78;
  if (!qword_26A5AED78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5AED78);
  }
  return result;
}

uint64_t sub_25C527BFC()
{
  return sub_25C522D80(&qword_26A5AED80);
}

uint64_t sub_25C527C30()
{
  return sub_25C522D80(&qword_26A5AED88);
}

uint64_t sub_25C527C64()
{
  return sub_25C522D80(&qword_26A5AED90);
}

unint64_t sub_25C527C9C()
{
  unint64_t result = qword_26A5AED98;
  if (!qword_26A5AED98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5AED98);
  }
  return result;
}

uint64_t sub_25C527CF0()
{
  return sub_25C522D80((unint64_t *)&qword_26A5AED30);
}

uint64_t sub_25C527D24()
{
  return type metadata accessor for SignalEncoder();
}

uint64_t type metadata accessor for SignalEncoder()
{
  uint64_t result = qword_26A5AEDA0;
  if (!qword_26A5AEDA0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25C527D78()
{
  uint64_t result = sub_25C528638();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for SignalEncoder(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SignalEncoder);
}

uint64_t dispatch thunk of SignalEncoder.__allocating_init(formatDescriptor:options:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of SignalEncoder.encode(frame:options:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for SignalEncoder.FormatDescriptor(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  BOOL v4 = v3 >= 2;
  int v5 = v3 - 2;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SignalEncoder.FormatDescriptor(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SignalEncoder.FormatDescriptor()
{
  return &type metadata for SignalEncoder.FormatDescriptor;
}

unsigned char *storeEnumTagSinglePayload for SignalEncoder.FormatDescriptor.Semantic(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    char *result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x25C528030);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          char *result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SignalEncoder.FormatDescriptor.Semantic()
{
  return &type metadata for SignalEncoder.FormatDescriptor.Semantic;
}

ValueMetadata *type metadata accessor for SignalEncoder.Options()
{
  return &type metadata for SignalEncoder.Options;
}

ValueMetadata *type metadata accessor for SignalEncoder.FrameOptions()
{
  return &type metadata for SignalEncoder.FrameOptions;
}

uint64_t *sub_25C52808C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  sub_25C522144(*a2, v5);
  *a1 = v4;
  a1[1] = v5;
  a1[2] = a2[2];
  return a1;
}

uint64_t *assignWithCopy for SignalEncoder.EncodedFrame(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  sub_25C522144(*a2, v5);
  uint64_t v6 = *a1;
  unint64_t v7 = a1[1];
  *a1 = v4;
  a1[1] = v5;
  sub_25C5221A8(v6, v7);
  a1[2] = a2[2];
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t *assignWithTake for SignalEncoder.EncodedFrame(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  unint64_t v5 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_25C5221A8(v4, v5);
  a1[2] = *(void *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for SignalEncoder.EncodedFrame(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xD && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 13);
  }
  unsigned int v3 = (((*(void *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)(a1 + 8) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for SignalEncoder.EncodedFrame(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 13;
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2)
    {
      *(void *)__n128 result = 0;
      *(void *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SignalEncoder.EncodedFrame()
{
  return &type metadata for SignalEncoder.EncodedFrame;
}

void gcl::ArithmeticEncoder::encodeExpGolomb()
{
  __assert_rtn("encodeExpGolomb", "ArithmeticCodec.hpp", 190, "symbol >= 0 && k >= 0");
}

void gcl::ArithmeticEncoder::encodeSignedExpGolomb()
{
  __assert_rtn("encodeSignedExpGolomb", "ArithmeticCodec.hpp", 202, "k >= 0");
}

void gcl::motion::DecoderImpl::decodeResidual()
{
}

void gcl::ArithmeticDecoder::decodeExpGolomb()
{
  __assert_rtn("decodeExpGolomb", "ArithmeticCodec.hpp", 329, "k >= 0");
}

void gcl::ArithmeticDecoder::decodeSignedExpGolomb()
{
  __assert_rtn("decodeSignedExpGolomb", "ArithmeticCodec.hpp", 344, "k >= 0");
}

uint64_t sub_25C5284C8()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_25C5284D8()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_25C5284E8()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_25C5284F8()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_25C528508()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_25C528518()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_25C528528()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_25C528538()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_25C528548()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_25C528558()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_25C528568()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_25C5285B8()
{
  return MEMORY[0x270EF0020]();
}

uint64_t sub_25C5285C8()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_25C5285D8()
{
  return MEMORY[0x270EF0090]();
}

uint64_t sub_25C5285E8()
{
  return MEMORY[0x270EF00D0]();
}

uint64_t sub_25C5285F8()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_25C528608()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_25C528618()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25C528628()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_25C528638()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25C528648()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_25C528658()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_25C528668()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_25C528678()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25C528688()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25C528698()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25C5286A8()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_25C5286B8()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_25C5286C8()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25C5286D8()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25C5286E8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25C5286F8()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25C528708()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25C528718()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25C528728()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25C528738()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25C528748()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25C528758()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_25C528768()
{
  return MEMORY[0x270F9F350]();
}

uint64_t sub_25C528778()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_25C528788()
{
  return MEMORY[0x270F9F490]();
}

uint64_t sub_25C528798()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25C5287A8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25C5287B8()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25C5287C8()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25C5287D8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25C5287E8()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25C5287F8()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25C528808()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_25C528818()
{
  return MEMORY[0x270F9FD98]();
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

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
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

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}