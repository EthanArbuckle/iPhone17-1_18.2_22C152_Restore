void awd::metrics::protobuf_AddDesc_SimpleMetric_2eproto(awd::metrics *this, uint64_t a2, uint64_t a3, const char *a4)
{
  if ((byte_1EB220AC0 & 1) == 0)
  {
    byte_1EB220AC0 = 1;
    wireless_diagnostics::google::protobuf::internal::VerifyVersion((wireless_diagnostics::google::protobuf::internal *)0x1E9808, 2005000, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/WirelessDiagnostics/AWDMetrics/cpp/SimpleMetric.pb.cc", a4);
    operator new();
  }
}

void awd::profile::protobuf_AddDesc_AwdProfile_2eproto(awd::profile *this, uint64_t a2, uint64_t a3, const char *a4)
{
  if ((byte_1EA6C3A61 & 1) == 0)
  {
    byte_1EA6C3A61 = 1;
    wireless_diagnostics::google::protobuf::internal::VerifyVersion((wireless_diagnostics::google::protobuf::internal *)0x1E9808, 2005000, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/WirelessDiagnostics/AWDMetrics/cpp/AwdProfile.pb.cc", a4);
    operator new();
  }
}

void *awd::profile::Condition::InitAsDefaultInstance(void *this)
{
  v1 = this;
  uint64_t v2 = awd::profile::TypeVariant::default_instance_;
  if (awd::profile::TypeVariant::default_instance_)
  {
    this[2] = awd::profile::TypeVariant::default_instance_;
LABEL_4:
    v1[4] = v2;
LABEL_5:
    v1[5] = v2;
    goto LABEL_6;
  }
  this = (void *)awd::profile::protobuf_AddDesc_AwdProfile_2eproto((awd::profile *)this);
  uint64_t v2 = awd::profile::TypeVariant::default_instance_;
  v1[2] = awd::profile::TypeVariant::default_instance_;
  if (v2) {
    goto LABEL_4;
  }
  this = (void *)awd::profile::protobuf_AddDesc_AwdProfile_2eproto((awd::profile *)this);
  uint64_t v2 = awd::profile::TypeVariant::default_instance_;
  v1[4] = awd::profile::TypeVariant::default_instance_;
  if (v2) {
    goto LABEL_5;
  }
  this = (void *)awd::profile::protobuf_AddDesc_AwdProfile_2eproto((awd::profile *)this);
  uint64_t v2 = awd::profile::TypeVariant::default_instance_;
  v1[5] = awd::profile::TypeVariant::default_instance_;
  if (!v2)
  {
    this = (void *)awd::profile::protobuf_AddDesc_AwdProfile_2eproto((awd::profile *)this);
    uint64_t v2 = awd::profile::TypeVariant::default_instance_;
  }
LABEL_6:
  v1[6] = v2;
  return this;
}

double sub_1D3E19D64()
{
  qword_1EB220A30 = 850045863;
  double result = 0.0;
  unk_1EB220A38 = 0u;
  unk_1EB220A48 = 0u;
  unk_1EB220A58 = 0u;
  qword_1EB220A68 = 0;
  qword_1EB220A20 = 0;
  *(void *)algn_1EB220A28 = 0;
  return result;
}

void sub_1D3E19D9C()
{
  v0 = (void *)MEMORY[0x1D94415E0]();
}

double sub_1D3E19DC4()
{
  qword_1EB220A78 = 850045863;
  double result = 0.0;
  unk_1EB220A80 = 0u;
  unk_1EB220A90 = 0u;
  unk_1EB220AA0 = 0u;
  qword_1EB220AB0 = 0;
  xmmword_1EB220A10 = 0uLL;
  return result;
}

void awd::asString(unsigned int *a1@<X0>, std::string *a2@<X8>)
{
  ctu::hex((ctu *)*a1);
  v4 = std::string::insert(&v22, 0, "Trigger(cid=0x");
  long long v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
  v23.__r_.__value_.__r.__words[2] = v4->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v23.__r_.__value_.__l.__data_ = v5;
  v4->__r_.__value_.__l.__size_ = 0;
  v4->__r_.__value_.__r.__words[2] = 0;
  v4->__r_.__value_.__r.__words[0] = 0;
  v6 = std::string::append(&v23, ", trid=0x");
  long long v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
  v24.__r_.__value_.__r.__words[2] = v6->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v24.__r_.__value_.__l.__data_ = v7;
  v6->__r_.__value_.__l.__size_ = 0;
  v6->__r_.__value_.__r.__words[2] = 0;
  v6->__r_.__value_.__r.__words[0] = 0;
  ctu::hex((ctu *)a1[1]);
  if ((v21 & 0x80u) == 0) {
    v8 = __p;
  }
  else {
    v8 = (void **)__p[0];
  }
  if ((v21 & 0x80u) == 0) {
    std::string::size_type v9 = v21;
  }
  else {
    std::string::size_type v9 = (std::string::size_type)__p[1];
  }
  v10 = std::string::append(&v24, (const std::string::value_type *)v8, v9);
  long long v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
  v25.__r_.__value_.__r.__words[2] = v10->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v25.__r_.__value_.__l.__data_ = v11;
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = 0;
  v12 = std::string::append(&v25, ", sid=");
  long long v13 = *(_OWORD *)&v12->__r_.__value_.__l.__data_;
  v26.__r_.__value_.__r.__words[2] = v12->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v26.__r_.__value_.__l.__data_ = v13;
  v12->__r_.__value_.__l.__size_ = 0;
  v12->__r_.__value_.__r.__words[2] = 0;
  v12->__r_.__value_.__r.__words[0] = 0;
  std::to_string(&v19, a1[2]);
  if ((v19.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v14 = &v19;
  }
  else {
    v14 = (std::string *)v19.__r_.__value_.__r.__words[0];
  }
  if ((v19.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(v19.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = v19.__r_.__value_.__l.__size_;
  }
  v16 = std::string::append(&v26, (const std::string::value_type *)v14, size);
  long long v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
  v27.__r_.__value_.__r.__words[2] = v16->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v27.__r_.__value_.__l.__data_ = v17;
  v16->__r_.__value_.__l.__size_ = 0;
  v16->__r_.__value_.__r.__words[2] = 0;
  v16->__r_.__value_.__r.__words[0] = 0;
  v18 = std::string::append(&v27, ")");
  *a2 = *v18;
  v18->__r_.__value_.__l.__size_ = 0;
  v18->__r_.__value_.__r.__words[2] = 0;
  v18->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v27.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v19.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v26.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v25.__r_.__value_.__l.__data_);
  }
  if ((char)v21 < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v24.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v23.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v22.__r_.__value_.__l.__data_);
  }
}

void sub_1D3E19FF4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,uint64_t a34,void *a35,uint64_t a36,int a37,__int16 a38,char a39,char a40)
{
  if (*(char *)(v40 - 41) < 0) {
    operator delete(*(void **)(v40 - 64));
  }
  if (a15 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v40 - 73) < 0) {
    operator delete(*(void **)(v40 - 96));
  }
  if (*(char *)(v40 - 105) < 0) {
    operator delete(*(void **)(v40 - 128));
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a40 < 0) {
    operator delete(a35);
  }
  if (a33 < 0) {
    operator delete(a28);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  _Unwind_Resume(exception_object);
}

const char *awd::asString(unsigned int a1)
{
  if (a1 > 2) {
    return "???";
  }
  else {
    return off_1E69CA5E8[(char)a1];
  }
}

unint64_t awd::getAWDTimestamp(awd *this)
{
  gettimeofday(&v2, 0);
  return 1000 * v2.tv_sec + v2.tv_usec / 0x3E8uLL;
}

unint64_t awd::timevalToTimestamp(awd *this, timeval *a2)
{
  return 1000 * *(void *)this + *((int *)this + 2) / 0x3E8uLL;
}

void awd::createTagForProtobuf(awd *this@<X0>, unsigned int a2@<W1>, unint64_t *a3@<X8>)
{
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  sub_1D3E1A1C8(a3, (8 * this) | 2);
  sub_1D3E1A1C8(a3, a2);
}

void sub_1D3E1A1AC(_Unwind_Exception *exception_object)
{
  v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_1D3E1A1C8(unint64_t *a1, unsigned int a2)
{
  LOBYTE(v2) = a2;
  if (a2 <= 0x7F)
  {
    v8 = (unsigned char *)a1[1];
  }
  else
  {
    v4 = (unsigned char *)a1[1];
    unsigned int v5 = a2;
    do
    {
      char v6 = v5 | 0x80;
      unint64_t v7 = a1[2];
      if ((unint64_t)v4 >= v7)
      {
        unint64_t v9 = *a1;
        v10 = &v4[-*a1];
        unint64_t v11 = (unint64_t)(v10 + 1);
        if ((uint64_t)(v10 + 1) < 0) {
          goto LABEL_42;
        }
        unint64_t v12 = v7 - v9;
        if (2 * v12 > v11) {
          unint64_t v11 = 2 * v12;
        }
        if (v12 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v13 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v13 = v11;
        }
        if (v13) {
          v14 = (char *)operator new(v13);
        }
        else {
          v14 = 0;
        }
        v15 = &v10[(void)v14];
        v16 = &v10[(void)v14];
        unsigned char *v16 = v6;
        v8 = v16 + 1;
        if (v4 != (unsigned char *)v9)
        {
          long long v17 = &v4[~v9];
          do
          {
            char v18 = *--v4;
            (v17--)[(void)v14] = v18;
          }
          while (v4 != (unsigned char *)v9);
          v4 = (unsigned char *)*a1;
          v15 = v14;
        }
        *a1 = (unint64_t)v15;
        a1[1] = (unint64_t)v8;
        a1[2] = (unint64_t)&v14[v13];
        if (v4) {
          operator delete(v4);
        }
      }
      else
      {
        unsigned char *v4 = v6;
        v8 = v4 + 1;
      }
      a1[1] = (unint64_t)v8;
      unsigned int v2 = v5 >> 7;
      unsigned int v19 = v5 >> 14;
      v4 = v8;
      v5 >>= 7;
    }
    while (v19);
  }
  unint64_t v20 = a1[2];
  if ((unint64_t)v8 >= v20)
  {
    unint64_t v22 = *a1;
    std::string v23 = &v8[-*a1];
    unint64_t v24 = (unint64_t)(v23 + 1);
    if ((uint64_t)(v23 + 1) < 0) {
LABEL_42:
    }
      sub_1D3E1AE60();
    unint64_t v25 = v20 - v22;
    if (2 * v25 > v24) {
      unint64_t v24 = 2 * v25;
    }
    if (v25 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v26 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v26 = v24;
    }
    if (v26) {
      unint64_t v27 = (unint64_t)operator new(v26);
    }
    else {
      unint64_t v27 = 0;
    }
    v28 = (char *)(v27 + v26);
    v23[v27] = v2;
    uint64_t v21 = (uint64_t)&v23[v27 + 1];
    if (v8 == (unsigned char *)v22)
    {
      v27 += (unint64_t)v23;
    }
    else
    {
      v29 = &v8[~v22];
      do
      {
        char v30 = *--v8;
        (v29--)[v27] = v30;
      }
      while (v8 != (unsigned char *)v22);
      v8 = (unsigned char *)*a1;
    }
    *a1 = v27;
    a1[1] = v21;
    a1[2] = (unint64_t)v28;
    if (v8) {
      operator delete(v8);
    }
  }
  else
  {
    unsigned char *v8 = v2;
    uint64_t v21 = (uint64_t)(v8 + 1);
  }
  a1[1] = v21;
}

void *awd::tagSerializedProtobuf(int a1, uint64_t a2)
{
  int v3 = *(_DWORD *)(a2 + 8);
  v4 = *(char **)a2;
  unsigned int v5 = v3 - v4;
  unsigned int v6 = (8 * a1) | 2;
  if (v6 < 0x80)
  {
    LODWORD(v7) = 0;
  }
  else
  {
    uint64_t v7 = 0;
    do
    {
      __src[v7++] = v6 | 0x80;
      unsigned int v8 = v6 >> 14;
      v6 >>= 7;
    }
    while (v8);
  }
  size_t v9 = (v7 + 1);
  __src[v7] = v6;
  if (v5 < 0x80)
  {
    LODWORD(v10) = 0;
  }
  else
  {
    uint64_t v10 = 0;
    do
    {
      v15[v10++] = v5 | 0x80;
      unsigned int v11 = v5 >> 14;
      v5 >>= 7;
    }
    while (v11);
  }
  size_t v12 = (v10 + 1);
  v15[v10] = v5;
  char v14 = 0;
  double result = sub_1D3E1A4A4((char **)a2, v4, (v12 + v9), &v14);
  if (v9) {
    double result = memcpy(*(void **)a2, __src, v9);
  }
  if (v12) {
    return memcpy((void *)(*(void *)a2 + v9), v15, v12);
  }
  return result;
}

char *sub_1D3E1A4A4(char **a1, char *__src, unint64_t a3, char *a4)
{
  if (!a3) {
    return __src;
  }
  unsigned int v5 = a4;
  unint64_t v6 = a3;
  size_t v9 = a1[1];
  unsigned int v8 = a1[2];
  if (v8 - v9 >= a3)
  {
    unint64_t v16 = v9 - __src;
    unint64_t v17 = a3 - (v9 - __src);
    if (a3 <= v9 - __src)
    {
      char v18 = a1[1];
      unint64_t v20 = a3;
      goto LABEL_17;
    }
    char v18 = &__src[a3];
    unsigned int v19 = a1[1];
    do
    {
      *v19++ = *a4;
      --v17;
    }
    while (v17);
    a1[1] = v18;
    if (v16)
    {
      unint64_t v20 = v9 - __src;
LABEL_17:
      uint64_t v21 = &__src[a3];
      unint64_t v22 = v18;
      if (&v18[-a3] < v9)
      {
        if (a3 <= v16) {
          unint64_t v23 = v9 - __src;
        }
        else {
          unint64_t v23 = a3;
        }
        unint64_t v24 = &__src[-a3];
        unint64_t v25 = __src;
        size_t v26 = __src;
        do
        {
          v25[v23] = v24[v23];
          ++v26;
          ++v24;
          ++v25;
        }
        while (&v26[v23 - (void)v9 - a3]);
        if (a3 > v16) {
          unint64_t v16 = a3;
        }
        unint64_t v22 = &v25[v16];
      }
      a1[1] = v22;
      if (v18 != v21) {
        memmove(&__src[a3], __src, v18 - v21);
      }
      if (__src <= v5)
      {
        if (a1[1] <= v5) {
          unint64_t v27 = 0;
        }
        else {
          unint64_t v27 = v6;
        }
        v5 += v27;
      }
      v28 = __src;
      do
      {
        *v28++ = *v5;
        --v20;
      }
      while (v20);
    }
    return __src;
  }
  uint64_t v10 = *a1;
  uint64_t v11 = v9 - *a1 + a3;
  if (v11 < 0) {
    sub_1D3E1AE60();
  }
  size_t v12 = (char *)(__src - v10);
  unint64_t v13 = v8 - v10;
  if (2 * v13 > v11) {
    uint64_t v11 = 2 * v13;
  }
  if (v13 >= 0x3FFFFFFFFFFFFFFFLL) {
    size_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    size_t v14 = v11;
  }
  if (v14) {
    v15 = operator new(v14);
  }
  else {
    v15 = 0;
  }
  v29 = &v12[(void)v15];
  char v30 = &v29[v6];
  v31 = v29;
  do
  {
    *v31++ = *v5;
    --v6;
  }
  while (v6);
  v32 = *a1;
  if (*a1 == __src)
  {
    v34 = v29;
  }
  else
  {
    v33 = __src;
    v34 = v29;
    do
    {
      char v35 = *--v33;
      *--v34 = v35;
    }
    while (v33 != v32);
    size_t v9 = a1[1];
  }
  v36 = (char *)v15 + v14;
  if (v9 != __src) {
    memmove(v30, __src, v9 - __src);
  }
  v37 = *a1;
  *a1 = v34;
  a1[1] = &v30[v9 - __src];
  a1[2] = v36;
  if (v37) {
    operator delete(v37);
  }
  return v29;
}

uint64_t awd::serializeMetric@<X0>(awd *this@<X0>, const wireless_diagnostics::google::protobuf::MessageLite *a2@<X1>, unint64_t *a3@<X8>)
{
  signed int v6 = (*(uint64_t (**)(awd *))(*(void *)this + 72))(this);
  awd::createTagForProtobuf(a2, v6, a3);
  unint64_t v7 = *a3;
  unint64_t v8 = a3[1] - *a3;
  unint64_t v9 = v8 + v6;
  if (v8 >= v9)
  {
    if (v8 > v9) {
      a3[1] = v7 + v9;
    }
  }
  else
  {
    sub_1D3E1AF1C(a3, v6);
    unint64_t v7 = *a3;
  }
  return MEMORY[0x1D94410A0](this, v7 + v8, v6);
}

void sub_1D3E1A770(_Unwind_Exception *exception_object)
{
  int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void awd::serializeMetric(uint64_t a1@<X0>, awd *a2@<X1>, uint64_t a3@<X8>)
{
  PB::Writer::Writer((PB::Writer *)&v6);
  (*(void (**)(uint64_t, char **))(*(void *)a1 + 24))(a1, &v6);
  awd::createTagForProtobuf(a2, v6 - v7, (unint64_t *)a3);
  sub_1D3E1B058(a3, *(char **)(a3 + 8), v7, v6, v6 - v7);
  PB::Writer::~Writer((PB::Writer *)&v6);
}

void sub_1D3E1A828(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  v4 = *(void **)v2;
  if (*(void *)v2)
  {
    *(void *)(v2 + 8) = v4;
    operator delete(v4);
  }
  PB::Writer::~Writer((PB::Writer *)va);
  _Unwind_Resume(a1);
}

uint64_t awd::GetProtobufTag@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return awd::GetProtobufTag(*a1, (const unsigned __int8 *)(a1[1] - *a1), a2);
}

uint64_t awd::GetProtobufTag@<X0>(uint64_t this@<X0>, const unsigned __int8 *a2@<X1>, void *a3@<X8>)
{
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  if (this)
  {
    int v3 = this;
    unsigned int v5 = (unsigned __int8 *)&a2[this];
    uint64_t v8 = this;
    unsigned int v6 = sub_1D3E1A96C(&v8, &a2[this]);
    if ((v6 & 7) != 2)
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1D9441110](exception, &unk_1D3E5393F);
      __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    *((_DWORD *)a3 + 4) = v6 >> 3;
    this = sub_1D3E1A96C(&v8, v5);
    *a3 = (v8 - v3);
    a3[1] = this;
  }
  return this;
}

void sub_1D3E1A924(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  __cxa_free_exception(v17);
  __cxa_begin_catch(a1);
  v16[1] = 0;
  v16[2] = 0;
  void *v16 = 0;
  __cxa_end_catch();
}

uint64_t sub_1D3E1A96C(void *a1, unsigned char *a2)
{
  uint64_t v2 = (unsigned char *)*a1;
  if ((unsigned char *)*a1 == a2) {
    goto LABEL_11;
  }
  int v3 = (unsigned char *)*a1;
  while ((char)*v3 < 0)
  {
    if (++v3 == a2)
    {
      int v3 = a2;
      break;
    }
  }
  if (v3 == a2)
  {
LABEL_11:
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1D9441110](exception, &unk_1D3E5393F);
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  *a1 = v3 + 1;
  int v4 = *v3 & 0x7F;
  if (v3 == v2) {
    return *v3 & 0x7F;
  }
  do
  {
    char v5 = *--v3;
    uint64_t result = v5 & 0x7F | (v4 << 7);
    int v4 = v5 & 0x7F | (v4 << 7);
  }
  while (v3 != v2);
  return result;
}

void sub_1D3E1AA24(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t awd::getComponentForMetricId(awd *this)
{
  return this >> 16;
}

uint64_t awd::getCoreAnalyticsEventName(awd *this)
{
  sub_1D3E1ABC4((uint64_t)v3);
  uint64_t v1 = sub_1D3E1B244(v3, (uint64_t)"com.apple.awd.0x", 16);
  *(_DWORD *)((char *)v1 + *(void *)(*v1 - 24) + 8) = *(_DWORD *)((unsigned char *)v1 + *(void *)(*v1 - 24) + 8) & 0xFFFFFFB5 | 8;
  std::ostream::operator<<();
  std::stringbuf::str();
  v3[0] = *MEMORY[0x1E4FBA418];
  *(void *)((char *)v3 + *(void *)(v3[0] - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
  v3[1] = MEMORY[0x1E4FBA470] + 16;
  if (v4 < 0) {
    operator delete((void *)v3[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1D94412A0](&v5);
}

void sub_1D3E1ABB0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_1D3E1AD5C((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_1D3E1ABC4(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1E4FBA498] + 64;
  *(void *)(a1 + 112) = MEMORY[0x1E4FBA498] + 64;
  uint64_t v3 = *(void *)(MEMORY[0x1E4FBA418] + 16);
  uint64_t v4 = *(void *)(MEMORY[0x1E4FBA418] + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + *(void *)(v4 - 24)) = v3;
  uint64_t v5 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v5, (void *)(a1 + 8));
  uint64_t v6 = MEMORY[0x1E4FBA498] + 24;
  v5[1].__vftable = 0;
  v5[1].__fmtflags_ = -1;
  *(void *)a1 = v6;
  *(void *)(a1 + 112) = v2;
  std::streambuf::basic_streambuf();
  *(void *)(a1 + 8) = MEMORY[0x1E4FBA470] + 16;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 16;
  return a1;
}

void sub_1D3E1AD34(_Unwind_Exception *a1)
{
  std::ostream::~ostream();
  MEMORY[0x1D94412A0](v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1D3E1AD5C(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1E4FBA418];
  uint64_t v3 = *MEMORY[0x1E4FBA418];
  *(void *)a1 = *MEMORY[0x1E4FBA418];
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 8) = MEMORY[0x1E4FBA470] + 16;
  if (*(char *)(a1 + 95) < 0) {
    operator delete(*(void **)(a1 + 72));
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1D94412A0](a1 + 112);
  return a1;
}

void sub_1D3E1AE60()
{
}

void sub_1D3E1AE78(void *a1)
{
}

void sub_1D3E1AE8C(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_1D3E1AEE8(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E69CA338, MEMORY[0x1E4FBA1C8]);
}

void sub_1D3E1AED4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_1D3E1AEE8(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
  return result;
}

void sub_1D3E1AF1C(unint64_t *a1, size_t a2)
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
    unint64_t v7 = &v5[-*a1];
    unint64_t v8 = (unint64_t)&v7[a2];
    if ((uint64_t)&v7[a2] < 0) {
      sub_1D3E1AE60();
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
    size_t v12 = &v7[v11];
    unint64_t v13 = (char *)(v11 + v10);
    bzero(v12, a2);
    if (v5 == (char *)v6)
    {
      unint64_t v11 = (unint64_t)v12;
    }
    else
    {
      size_t v14 = &v5[~v6];
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

char *sub_1D3E1B058(uint64_t a1, char *__dst, char *__src, char *a4, int64_t a5)
{
  uint64_t v5 = __dst;
  if (a5 < 1) {
    return v5;
  }
  size_t v10 = *(char **)(a1 + 8);
  uint64_t v9 = *(void *)(a1 + 16);
  if (v9 - (uint64_t)v10 < a5)
  {
    unint64_t v11 = *(char **)a1;
    uint64_t v12 = (uint64_t)&v10[a5 - *(void *)a1];
    if (v12 < 0) {
      sub_1D3E1AE60();
    }
    unint64_t v13 = (char *)(__dst - v11);
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
    if (v15)
    {
      size_t v16 = v15;
      unint64_t v17 = (char *)operator new(v15);
    }
    else
    {
      size_t v16 = 0;
      unint64_t v17 = 0;
    }
    unint64_t v27 = &v13[(void)v17];
    memcpy(&v13[(void)v17], __src, a5);
    v28 = &v13[(void)v17];
    size_t v29 = v16;
    if (v11 != v5)
    {
      do
      {
        v13[(void)v17 - 1] = v13[(void)(v11 - 1)];
        --v13;
      }
      while (v13);
      size_t v10 = *(char **)(a1 + 8);
      v28 = v17;
    }
    char v30 = &v27[a5];
    v31 = &v17[v29];
    if (v10 != v5) {
      memmove(v30, v5, v10 - v5);
    }
    v32 = *(char **)a1;
    *(void *)a1 = v28;
    *(void *)(a1 + 8) = &v30[v10 - v5];
    *(void *)(a1 + 16) = v31;
    if (v32) {
      operator delete(v32);
    }
    return v27;
  }
  uint64_t v18 = v10 - __dst;
  if (v10 - __dst >= a5)
  {
    uint64_t v19 = &__src[a5];
    uint64_t v21 = *(char **)(a1 + 8);
LABEL_17:
    unint64_t v22 = &v5[a5];
    unint64_t v23 = &v21[-a5];
    unint64_t v24 = v21;
    if (&v21[-a5] < v10)
    {
      int64_t v25 = &v10[a5] - v21;
      unint64_t v24 = v21;
      do
      {
        char v26 = *v23++;
        *v24++ = v26;
        --v25;
      }
      while (v25);
    }
    *(void *)(a1 + 8) = v24;
    if (v21 != v22) {
      memmove(&v5[a5], v5, v21 - v22);
    }
    if (v19 != __src) {
      memmove(v5, __src, v19 - __src);
    }
    return v5;
  }
  uint64_t v19 = &__src[v18];
  int64_t v20 = a4 - &__src[v18];
  if (a4 != &__src[v18]) {
    memmove(*(void **)(a1 + 8), &__src[v18], a4 - &__src[v18]);
  }
  uint64_t v21 = &v10[v20];
  *(void *)(a1 + 8) = &v10[v20];
  if (v18 >= 1) {
    goto LABEL_17;
  }
  return v5;
}

void *sub_1D3E1B244(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x1D9441180](v13, a1);
  if (v13[0])
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      size_t v10 = std::locale::use_facet(&v14, MEMORY[0x1E4FBA258]);
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
    if (!sub_1D3E1B3E8(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x1D9441190](v13);
  return a1;
}

void sub_1D3E1B380(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x1D9441190](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x1D3E1B360);
}

void sub_1D3E1B3D4(_Unwind_Exception *a1)
{
}

uint64_t sub_1D3E1B3E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
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
      sub_1D3E1B570(__p, v12, __c);
      unint64_t v13 = v18 >= 0 ? __p : (void **)__p[0];
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

void sub_1D3E1B554(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_1D3E1B570(void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    sub_1D3E1B61C();
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

void sub_1D3E1B61C()
{
}

uint64_t awd::ServerConnectionInfo::ServerConnectionInfo(uint64_t a1, NSObject **a2, int a3, char a4)
{
  size_t v7 = sub_1D3E1B6C8((void *)a1, a2, "conn.info");
  *((_DWORD *)v7 + 10) = a3;
  *((unsigned char *)v7 + 44) = a4;
  awd::AWDLoggingMetric::AWDLoggingMetric((awd::AWDLoggingMetric *)(v7 + 6));
  *(void *)(a1 + 120) = 0;
  *(void *)(a1 + 112) = a1 + 120;
  *(void *)(a1 + 152) = 0;
  *(void *)(a1 + 144) = 0;
  *(void *)(a1 + 128) = 0;
  *(void *)(a1 + 136) = a1 + 144;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  return a1;
}

void *sub_1D3E1B6C8(void *a1, NSObject **a2, char *a3)
{
  *a1 = 0;
  a1[1] = 0;
  uint64_t v5 = *a2;
  a1[2] = *a2;
  if (v5) {
    dispatch_retain(v5);
  }
  a1[3] = 0;
  ctu::OsLogLogger::OsLogLogger((ctu::OsLogLogger *)(a1 + 4), "com.apple.awd.framework", a3);
  return a1;
}

void sub_1D3E1B720(_Unwind_Exception *a1)
{
  sub_1D3E1CFA4(v1);
  _Unwind_Resume(a1);
}

void awd::ServerConnectionInfo::setComponentConfig_sync(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = a1 + 48;
  uint64_t v4 = (std::__shared_weak_count *)a2[1];
  uint64_t v6 = *a2;
  size_t v7 = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  awd::AWDLoggingMetric::setConfiguration(v3, &v6);
  if (v7) {
    sub_1D3E1D148(v7);
  }
  uint64_t v5 = *(void *)(a1 + 176);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
  if (*(void *)(a1 + 168))
  {
    wireless_diagnostics::google::protobuf::MessageLite::SerializeToString();
    (*(void (**)(void))(*(void *)(a1 + 168) + 16))();
  }
}

void sub_1D3E1B800(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t awd::ServerConnectionInfo::trigger_sync@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, unsigned int **a4@<X3>, char **a5@<X8>)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  awd::AWDLoggingMetric::trigger(a1 + 48, a2, a3);
  *a5 = 0;
  a5[1] = 0;
  a5[2] = 0;
  int v9 = *a4;
  size_t v8 = a4[1];
  if (v9 != v8)
  {
    size_t v10 = (uint64_t *)(a1 + 120);
    uint64_t v11 = &dword_1D3E18000;
    do
    {
      unsigned int v12 = *v9;
      uint64_t v13 = *v10;
      if (!*v10) {
        goto LABEL_14;
      }
      uint64_t v14 = a1 + 120;
      do
      {
        unsigned int v15 = *(_DWORD *)(v13 + 32);
        BOOL v16 = v15 >= v12;
        if (v15 >= v12) {
          unint64_t v17 = (uint64_t *)v13;
        }
        else {
          unint64_t v17 = (uint64_t *)(v13 + 8);
        }
        if (v16) {
          uint64_t v14 = v13;
        }
        uint64_t v13 = *v17;
      }
      while (*v17);
      if ((uint64_t *)v14 != v10 && v12 >= *(_DWORD *)(v14 + 32))
      {
        uint64_t v19 = v11;
        uint64_t v21 = a5[1];
        unint64_t v20 = (unint64_t)a5[2];
        if ((unint64_t)v21 >= v20)
        {
          unint64_t v23 = *a5;
          uint64_t v24 = (v21 - *a5) >> 2;
          unint64_t v25 = v24 + 1;
          if ((unint64_t)(v24 + 1) >> 62) {
            sub_1D3E1AE60();
          }
          uint64_t v26 = v20 - (void)v23;
          if (v26 >> 1 > v25) {
            unint64_t v25 = v26 >> 1;
          }
          if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v27 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v27 = v25;
          }
          if (v27)
          {
            v28 = (char *)sub_1D3E1D1BC((uint64_t)(a5 + 2), v27);
            unint64_t v23 = *a5;
            uint64_t v21 = a5[1];
          }
          else
          {
            v28 = 0;
          }
          size_t v29 = &v28[4 * v24];
          *(_DWORD *)size_t v29 = v12;
          unint64_t v22 = v29 + 4;
          while (v21 != v23)
          {
            int v30 = *((_DWORD *)v21 - 1);
            v21 -= 4;
            *((_DWORD *)v29 - 1) = v30;
            v29 -= 4;
          }
          *a5 = v29;
          a5[1] = v22;
          a5[2] = &v28[4 * v27];
          if (v23) {
            operator delete(v23);
          }
        }
        else
        {
          *(_DWORD *)uint64_t v21 = v12;
          unint64_t v22 = v21 + 4;
        }
        a5[1] = v22;
        v31 = *(const void **)(v14 + 40);
        if (v31) {
          v32 = _Block_copy(v31);
        }
        else {
          v32 = 0;
        }
        global_queue = dispatch_get_global_queue(0, 0);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 1174405120;
        block[2] = sub_1D3E1BB60;
        block[3] = &unk_1F2B9BBC0;
        block[4] = a1;
        unsigned int v40 = v12;
        if (v32) {
          v34 = _Block_copy(v32);
        }
        else {
          v34 = 0;
        }
        aBlock = v34;
        dispatch_async(global_queue, block);
        if (aBlock) {
          _Block_release(aBlock);
        }
        uint64_t v11 = v19;
        if (v32) {
          _Block_release(v32);
        }
      }
      else
      {
LABEL_14:
        char v18 = *(NSObject **)(a1 + 32);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          unsigned int v42 = v12;
          _os_log_impl(v11, v18, OS_LOG_TYPE_INFO, "server.conn:#I No queriable callback for metric id 0x%x", buf, 8u);
        }
      }
      ++v9;
    }
    while (v9 != v8);
  }
  uint64_t result = *(void *)(a1 + 160);
  if (result) {
    return (*(uint64_t (**)(uint64_t, unint64_t, unint64_t, uint64_t))(result + 16))(result, HIDWORD(a2), a2, a3);
  }
  return result;
}

void sub_1D3E1BB1C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1D3E1BB60(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_1D3E4DE60(a1, v2);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void *sub_1D3E1BBBC(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void **)(a2 + 40);
  if (result) {
    uint64_t result = _Block_copy(result);
  }
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_1D3E1BBF0(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 40);
  if (v1) {
    _Block_release(v1);
  }
}

uint64_t awd::ServerConnectionInfo::triggerAnalyticsQuery_sync(awd::ServerConnectionInfo *this, uint64_t a2, uint64_t a3)
{
  int v3 = a2;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *((void *)this + 20);
  if (v4)
  {
    uint64_t v5 = 1;
    (*(void (**)(void, uint64_t, uint64_t, uint64_t))(v4 + 16))(*((void *)this + 20), a2, 1, a3);
  }
  else
  {
    uint64_t v6 = (char *)*((void *)this + 15);
    if (v6)
    {
      size_t v7 = (char *)this + 120;
      do
      {
        unsigned int v8 = *((_DWORD *)v6 + 8);
        BOOL v9 = v8 >= a2;
        if (v8 >= a2) {
          size_t v10 = (char **)v6;
        }
        else {
          size_t v10 = (char **)(v6 + 8);
        }
        if (v9) {
          size_t v7 = v6;
        }
        uint64_t v6 = *v10;
      }
      while (*v10);
      if (v7 != (char *)this + 120 && *((_DWORD *)v7 + 8) <= a2)
      {
        dispatch_get_global_queue(0, 0);
        uint64_t v13 = (const void *)*((void *)v7 + 5);
        if (v13) {
          _Block_copy(v13);
        }
        operator new();
      }
    }
    uint64_t v11 = *((void *)this + 4);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v3;
      _os_log_impl(&dword_1D3E18000, v11, OS_LOG_TYPE_INFO, "server.conn:#I No queriable callback for metric id 0x%x for analytics", buf, 8u);
    }
    return 0;
  }
  return v5;
}

void sub_1D3E1BDAC(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    sub_1D3E1AE78(a1);
  }
  _Unwind_Resume(a1);
}

void awd::ServerConnectionInfo::handleNotificationTimer24h_sync(awd::ServerConnectionInfo *this)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (long long *)*((void *)this + 17);
  unsigned int v12 = (char *)this + 144;
  if (v1 != (long long *)((char *)this + 144))
  {
    do
    {
      sub_1D3E1CFEC(__dst, v1 + 2);
      unint64_t v20 = 0;
      uint64_t v21 = 0;
      uint64_t v22 = 0;
      sub_1D3E1D2A8(&v20, v25, v26, (v26 - v25) >> 4);
      uint64_t v2 = *((void *)this + 4);
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v11 = __dst;
        if (v24 < 0) {
          uint64_t v11 = (void **)__dst[0];
        }
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = v11;
        _os_log_debug_impl(&dword_1D3E18000, v2, OS_LOG_TYPE_DEBUG, "server.conn:#D Calling callback on 24h-timer: %s", (uint8_t *)&buf, 0xCu);
      }
      uint64_t v4 = v20;
      int v3 = v21;
      while (v4 != v3)
      {
        if (*v4) {
          uint64_t v5 = _Block_copy(*v4);
        }
        else {
          uint64_t v5 = 0;
        }
        *(void *)&long long buf = v5;
        uint64_t v6 = v4[1];
        *((void *)&buf + 1) = v6;
        if (v6) {
          dispatch_retain(v6);
        }
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 1174405120;
        block[2] = sub_1D3E1C0D4;
        block[3] = &unk_1F2B9BE38;
        if (v5) {
          size_t v7 = _Block_copy(v5);
        }
        else {
          size_t v7 = 0;
        }
        aBlock = v7;
        dispatch_object_t object = v6;
        if (v6) {
          dispatch_retain(v6);
        }
        sub_1D3E1CFEC(&__p, (long long *)__dst);
        dispatch_async(v6, block);
        unint64_t v27 = (void **)&v19;
        sub_1D3E1D568(&v27);
        if (v18 < 0) {
          operator delete(__p);
        }
        if (object) {
          dispatch_release(object);
        }
        if (aBlock) {
          _Block_release(aBlock);
        }
        if (v6) {
          dispatch_release(v6);
        }
        if (v5) {
          _Block_release(v5);
        }
        v4 += 2;
      }
      *(void *)&long long buf = &v20;
      sub_1D3E1D568((void ***)&buf);
      unint64_t v20 = (void **)&v25;
      sub_1D3E1D568(&v20);
      if (v24 < 0) {
        operator delete(__dst[0]);
      }
      unsigned int v8 = (long long *)*((void *)v1 + 1);
      if (v8)
      {
        do
        {
          BOOL v9 = v8;
          unsigned int v8 = *(long long **)v8;
        }
        while (v8);
      }
      else
      {
        do
        {
          BOOL v9 = (long long *)*((void *)v1 + 2);
          BOOL v10 = *(void *)v9 == (void)v1;
          uint64_t v1 = v9;
        }
        while (!v10);
      }
      uint64_t v1 = v9;
    }
    while (v9 != (long long *)v12);
  }
}

void sub_1D3E1C078(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
}

void sub_1D3E1C0D4(uint64_t a1)
{
}

void sub_1D3E1C0E4(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  if (*(char *)(a2 + 23) < 0)
  {
    sub_1D3E1D074(__p, *(void **)a2, *(void *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)a2;
    uint64_t v4 = *(void *)(a2 + 16);
  }
  (*(void (**)(uint64_t, void **))(v2 + 16))(v2, __p);
  if (SHIBYTE(v4) < 0) {
    operator delete(__p[0]);
  }
}

void sub_1D3E1C15C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_1D3E1C178(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a2 + 32);
  if (v4) {
    uint64_t v4 = _Block_copy(v4);
  }
  uint64_t v5 = *(NSObject **)(a2 + 40);
  a1[4] = v4;
  a1[5] = v5;
  if (v5) {
    dispatch_retain(v5);
  }
  return sub_1D3E1CFEC(a1 + 6, (long long *)(a2 + 48));
}

void sub_1D3E1C1D8(_Unwind_Exception *a1)
{
  sub_1D3E1C1EC(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1D3E1C1EC(uint64_t a1)
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

void sub_1D3E1C22C(uint64_t a1)
{
  uint64_t v4 = (void **)(a1 + 72);
  sub_1D3E1D568(&v4);
  if (*(char *)(a1 + 71) < 0) {
    operator delete(*(void **)(a1 + 48));
  }
  uint64_t v2 = *(NSObject **)(a1 + 40);
  if (v2) {
    dispatch_release(v2);
  }
  int v3 = *(const void **)(a1 + 32);
  if (v3) {
    _Block_release(v3);
  }
}

uint64_t sub_1D3E1C290(uint64_t a1)
{
  int v3 = (void **)(a1 + 24);
  sub_1D3E1D568(&v3);
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  return a1;
}

awd::AWDServerConnection *awd::AWDServerConnection::AWDServerConnection(awd::AWDServerConnection *this)
{
  return awd::AWDServerConnection::AWDServerConnection(this);
}

{
  uint8_t v3[16];

  *(void *)this = 0;
  *((void *)this + 1) = 0;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v3 = 0;
    _os_log_impl(&dword_1D3E18000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "WirelessDiagnostics is deprecated and has been removed. Please migrate to Core Analytics.", v3, 2u);
  }
  return this;
}

{
  return awd::AWDServerConnection::AWDServerConnection(this);
}

{
  return awd::AWDServerConnection::AWDServerConnection(this);
}

void awd::AWDServerConnection::~AWDServerConnection(awd::AWDServerConnection *this)
{
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 1);
  if (v1) {
    sub_1D3E1D148(v1);
  }
}

{
  std::__shared_weak_count *v1;

  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 1);
  if (v1) {
    sub_1D3E1D148(v1);
  }
}

uint64_t awd::AWDServerConnection::getComponentId(awd::AWDServerConnection *this)
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_1D3E18000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "WirelessDiagnostics is deprecated and has been removed. Please migrate to Core Analytics.", v2, 2u);
  }
  return 0;
}

uint64_t awd::AWDServerConnection::getDeviceConfigurationId(awd::AWDServerConnection *this)
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_1D3E18000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "WirelessDiagnostics is deprecated and has been removed. Please migrate to Core Analytics.", v2, 2u);
  }
  return 0;
}

uint64_t awd::MetricFactory::getSharedMetricFactory(awd::MetricFactory *this)
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_1D3E18000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "WirelessDiagnostics is deprecated and has been removed. Please migrate to Core Analytics.", v2, 2u);
  }
  uint64_t result = awd::MetricFactory::fSharedMetricFactory;
  if (!awd::MetricFactory::fSharedMetricFactory)
  {
    pthread_mutex_lock(&stru_1EB220920);
    if (!awd::MetricFactory::fSharedMetricFactory) {
      operator new();
    }
    pthread_mutex_unlock(&stru_1EB220920);
    return awd::MetricFactory::fSharedMetricFactory;
  }
  return result;
}

uint64_t awd::MetricFactory::newMetricContainerWithIdentifier(awd::MetricFactory *this)
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v2) = 0;
    _os_log_impl(&dword_1D3E18000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "WirelessDiagnostics is deprecated and has been removed. Please migrate to Core Analytics.", (uint8_t *)&v2, 2u);
  }
  sub_1D3E37A98(&v2);
  if (v2 && sub_1D3E39438()) {
    operator new();
  }
  if (v3) {
    sub_1D3E1D148(v3);
  }
  return 0;
}

void sub_1D3E1C634(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_1D3E1D148(a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t awd::AWDServerConnection::SubmitMetric()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_1D3E18000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "WirelessDiagnostics is deprecated and has been removed. Please migrate to Core Analytics.", v1, 2u);
  }
  return 0;
}

{
  uint8_t v1[16];

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_1D3E18000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "WirelessDiagnostics is deprecated and has been removed. Please migrate to Core Analytics.", v1, 2u);
  }
  return 0;
}

void awd::AWDServerConnection::MaybeSubmitMetric()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_1D3E18000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "WirelessDiagnostics is deprecated and has been removed. Please migrate to Core Analytics.", v0, 2u);
  }
}

uint64_t awd::AWDServerConnection::SubmitMetrics()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_1D3E18000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "WirelessDiagnostics is deprecated and has been removed. Please migrate to Core Analytics.", v1, 2u);
  }
  return 0;
}

uint64_t awd::AWDServerConnection::RegisterQueriableMetricCallbackForIdentifier()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_1D3E18000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "WirelessDiagnostics is deprecated and has been removed. Please migrate to Core Analytics.", v1, 2u);
  }
  return 0;
}

{
  uint8_t v1[16];

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_1D3E18000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "WirelessDiagnostics is deprecated and has been removed. Please migrate to Core Analytics.", v1, 2u);
  }
  return 0;
}

uint64_t awd::AWDServerConnection::RegisterCallbackForTimer()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_1D3E18000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "WirelessDiagnostics is deprecated and has been removed. Please migrate to Core Analytics.", v1, 2u);
  }
  return 0;
}

uint64_t awd::AWDServerConnection::RegisterQueriableMetricCallbackForLogging()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_1D3E18000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "WirelessDiagnostics is deprecated and has been removed. Please migrate to Core Analytics.", v1, 2u);
  }
  return 0;
}

uint64_t awd::AWDServerConnection::forceMetricSubmission(awd::AWDServerConnection *this, unsigned int a2, unsigned int a3, unsigned int a4, unsigned int a5, const void *a6)
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)size_t v7 = 0;
    _os_log_impl(&dword_1D3E18000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "WirelessDiagnostics is deprecated and has been removed. Please migrate to Core Analytics.", v7, 2u);
  }
  return 0;
}

uint64_t awd::AWDServerConnection::forceFinishMetricSubmission(awd::AWDServerConnection *this)
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_1D3E18000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "WirelessDiagnostics is deprecated and has been removed. Please migrate to Core Analytics.", v2, 2u);
  }
  return 0;
}

uint64_t awd::AWDServerConnection::forceTriggerSend(awd::AWDServerConnection *this)
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_1D3E18000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "WirelessDiagnostics is deprecated and has been removed. Please migrate to Core Analytics.", v2, 2u);
  }
  return 0;
}

uint64_t awd::AWDServerConnection::registerCallBackForTrigger()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_1D3E18000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "WirelessDiagnostics is deprecated and has been removed. Please migrate to Core Analytics.", v1, 2u);
  }
  return 0;
}

uint64_t awd::AWDServerConnection::registerCallBackForComponentConfiguration()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_1D3E18000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "WirelessDiagnostics is deprecated and has been removed. Please migrate to Core Analytics.", v1, 2u);
  }
  return 0;
}

uint64_t awd::AWDServerConnection::registerCallBackForClearProfiles()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_1D3E18000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "WirelessDiagnostics is deprecated and has been removed. Please migrate to Core Analytics.", v1, 2u);
  }
  return 0;
}

uint64_t awd::AWDServerConnection::registerCallBackForConfigChange()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_1D3E18000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "WirelessDiagnostics is deprecated and has been removed. Please migrate to Core Analytics.", v1, 2u);
  }
  return 0;
}

uint64_t awd::AWDServerConnection::registerComponentParametersChangeCallback()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_1D3E18000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "WirelessDiagnostics is deprecated and has been removed. Please migrate to Core Analytics.", v1, 2u);
  }
  return 0;
}

uint64_t awd::AWDServerConnection::copyComponentParameters(awd::AWDServerConnection *this)
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_1D3E18000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "WirelessDiagnostics is deprecated and has been removed. Please migrate to Core Analytics.", v2, 2u);
  }
  return 0;
}

uint64_t awd::AWDServerConnection::loadHotship(awd::AWDServerConnection *this)
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_1D3E18000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "WirelessDiagnostics is deprecated and has been removed. Please migrate to Core Analytics.", v2, 2u);
  }
  return 0;
}

uint64_t awd::AWDServerConnection::clearConfiguration(awd::AWDServerConnection *this)
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_1D3E18000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "WirelessDiagnostics is deprecated and has been removed. Please migrate to Core Analytics.", v2, 2u);
  }
  return 0;
}

uint64_t awd::AWDServerConnection::logConfigurations(awd::AWDServerConnection *this)
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_1D3E18000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "WirelessDiagnostics is deprecated and has been removed. Please migrate to Core Analytics.", v2, 2u);
  }
  return 0;
}

uint64_t awd::AWDServerConnection::forceUpload(awd::AWDServerConnection *this)
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_1D3E18000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "WirelessDiagnostics is deprecated and has been removed. Please migrate to Core Analytics.", v2, 2u);
  }
  return 0;
}

uint64_t awd::AWDServerConnection::isMetricNecessary(awd::AWDServerConnection *this)
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_1D3E18000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "WirelessDiagnostics is deprecated and has been removed. Please migrate to Core Analytics.", v2, 2u);
  }
  return 0;
}

uint64_t awd::AWDServerConnection::registerCallBackForPIIOrLocationChange()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_1D3E18000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "WirelessDiagnostics is deprecated and has been removed. Please migrate to Core Analytics.", v1, 2u);
  }
  return 0;
}

void awd::AWDServerConnection::locationUsed(awd::AWDServerConnection *this)
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_1D3E18000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "WirelessDiagnostics is deprecated and has been removed. Please migrate to Core Analytics.", v1, 2u);
  }
}

void awd::AWDServerConnection::flush()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_1D3E18000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "WirelessDiagnostics is deprecated and has been removed. Please migrate to Core Analytics.", v0, 2u);
  }
}

void *sub_1D3E1CFA4(void *a1)
{
  uint64_t v2 = a1[3];
  if (v2) {
    dispatch_release(v2);
  }
  int v3 = a1[2];
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[1];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

void *sub_1D3E1CFEC(void *__dst, long long *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    sub_1D3E1D074(__dst, *(void **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    __dst[2] = *((void *)a2 + 2);
    *(_OWORD *)__dst = v4;
  }
  __dst[3] = 0;
  __dst[4] = 0;
  __dst[5] = 0;
  sub_1D3E1D2A8(__dst + 3, *((void *)a2 + 3), *((void *)a2 + 4), (uint64_t)(*((void *)a2 + 4) - *((void *)a2 + 3)) >> 4);
  return __dst;
}

void sub_1D3E1D058(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void *sub_1D3E1D074(unsigned char *__dst, void *__src, unint64_t a3)
{
  uint64_t v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8) {
      sub_1D3E1B61C();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    unsigned int v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000;
    *uint64_t v5 = v8;
    uint64_t v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }
  return memmove(v5, __src, a3 + 1);
}

void sub_1D3E1D114()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E4FBA350], MEMORY[0x1E4FBA1F8]);
}

void sub_1D3E1D148(std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void *sub_1D3E1D1BC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    sub_1D3E1D114();
  }
  return operator new(4 * a2);
}

uint64_t *sub_1D3E1D1F4(uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    int v3 = *(const void **)(v2 + 8);
    if (v3) {
      _Block_release(v3);
    }
    MEMORY[0x1D94412F0](v2, 0x1080C407411B482);
  }
  return a1;
}

uint64_t *sub_1D3E1D24C(unsigned int *a1)
{
  uint64_t v2 = a1;
  (*(void (**)(void, void))(*((void *)a1 + 1) + 16))(*((void *)a1 + 1), *a1);
  return sub_1D3E1D1F4((uint64_t *)&v2);
}

void sub_1D3E1D294(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_1D3E1D1F4((uint64_t *)va);
  _Unwind_Resume(a1);
}

void *sub_1D3E1D2A8(void *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    sub_1D3E1D330(result, a4);
    uint64_t result = sub_1D3E1D3AC((uint64_t)(v6 + 2), a2, a3, (void *)v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_1D3E1D310(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  sub_1D3E1D568(&a9);
  _Unwind_Resume(a1);
}

char *sub_1D3E1D330(void *a1, unint64_t a2)
{
  if (a2 >> 60) {
    sub_1D3E1AE60();
  }
  uint64_t result = (char *)sub_1D3E1D374((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

void *sub_1D3E1D374(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    sub_1D3E1D114();
  }
  return operator new(16 * a2);
}

void *sub_1D3E1D3AC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4 = a4;
  uint64_t v11 = a4;
  unsigned int v12 = a4;
  v9[0] = a1;
  v9[1] = &v11;
  v9[2] = &v12;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      sub_1D3E1D440(a1, v4, v6);
      v6 += 16;
      uint64_t v4 = v12 + 2;
      v12 += 2;
    }
    while (v6 != a3);
  }
  char v10 = 1;
  sub_1D3E1D4A0((uint64_t)v9);
  return v4;
}

void sub_1D3E1D440(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)a3;
  if (*(void *)a3) {
    uint64_t v5 = _Block_copy(v5);
  }
  uint64_t v6 = *(NSObject **)(a3 + 8);
  *a2 = v5;
  a2[1] = v6;
  if (v6)
  {
    dispatch_retain(v6);
  }
}

uint64_t sub_1D3E1D4A0(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_1D3E1D4D8((uint64_t *)a1);
  }
  return a1;
}

void sub_1D3E1D4D8(uint64_t *a1)
{
  uint64_t v2 = (uint64_t *)a1[1];
  uint64_t v1 = (uint64_t *)a1[2];
  uint64_t v3 = *v1;
  uint64_t v4 = *v2;
  if (*v1 != *v2)
  {
    uint64_t v5 = *a1;
    do
    {
      v3 -= 16;
      sub_1D3E1D52C(v5, v3);
    }
    while (v3 != v4);
  }
}

void sub_1D3E1D52C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(NSObject **)(a2 + 8);
  if (v3) {
    dispatch_release(v3);
  }
  if (*(void *)a2) {
    _Block_release(*(const void **)a2);
  }
}

void sub_1D3E1D568(void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    uint64_t v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 16;
        sub_1D3E1D52C((uint64_t)(v1 + 2), v4);
      }
      while ((void *)v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t awd::AWDRegistrationMessage::AWDRegistrationMessage(uint64_t this, int a2, int a3, int a4, char a5)
{
  *(void *)this = &unk_1F2B9ADC0;
  *(_DWORD *)(this + 8) = a2;
  *(_DWORD *)(this + 12) = a3;
  *(_DWORD *)(this + 16) = a4;
  *(unsigned char *)(this + 20) = a5;
  return this;
}

{
  *(void *)this = &unk_1F2B9ADC0;
  *(_DWORD *)(this + 8) = a2;
  *(_DWORD *)(this + 12) = a3;
  *(_DWORD *)(this + 16) = a4;
  *(unsigned char *)(this + 20) = a5;
  return this;
}

uint64_t awd::AWDRegistrationMessage::AWDRegistrationMessage(uint64_t a1, void *a2)
{
  *(void *)a1 = &unk_1F2B9ADC0;
  *(void *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 16) = 0;
  if (MEMORY[0x1D94419C0](*a2) == MEMORY[0x1E4F14590])
  {
    uint64_t v6 = a2;
    uint64_t v7 = "AWDMessageType";
    sub_1D3E1D854((uint64_t)&v6, &object);
    int v4 = xpc::dyn_cast_or_default();
    xpc_release(object);
    if (v4 == 1)
    {
      uint64_t v6 = a2;
      uint64_t v7 = "AWDMessageDeviceConfigurationId";
      sub_1D3E1D854((uint64_t)&v6, &object);
      *(_DWORD *)(a1 + 8) = xpc::dyn_cast_or_default();
      xpc_release(object);
      uint64_t v6 = a2;
      uint64_t v7 = "AWDMessageComponentId";
      sub_1D3E1D854((uint64_t)&v6, &object);
      *(_DWORD *)(a1 + 12) = xpc::dyn_cast_or_default();
      xpc_release(object);
      uint64_t v6 = a2;
      uint64_t v7 = "AWDMessagePid";
      sub_1D3E1D854((uint64_t)&v6, &object);
      *(_DWORD *)(a1 + 16) = xpc::dyn_cast_or_default();
      xpc_release(object);
      uint64_t v6 = a2;
      uint64_t v7 = "AWDMessageNeedsConfiguration";
      sub_1D3E1D854((uint64_t)&v6, &object);
      *(unsigned char *)(a1 + 20) = xpc::dyn_cast_or_default();
      xpc_release(object);
    }
  }
  return a1;
}

void sub_1D3E1D7C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object)
{
}

xpc_object_t sub_1D3E1D854@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
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

void awd::AWDRegistrationMessage::createXpcMessage(awd::AWDRegistrationMessage *this@<X0>, void *a2@<X8>)
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v5 = v4;
  if (v4)
  {
    *a2 = v4;
  }
  else
  {
    xpc_object_t v5 = xpc_null_create();
    *a2 = v5;
    if (!v5)
    {
      xpc_object_t v6 = xpc_null_create();
      xpc_object_t v5 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x1D94419C0](v5) == MEMORY[0x1E4F14590])
  {
    xpc_retain(v5);
    goto LABEL_9;
  }
  xpc_object_t v6 = xpc_null_create();
LABEL_8:
  *a2 = v6;
LABEL_9:
  xpc_release(v5);
  xpc_object_t v17 = xpc_int64_create(1);
  if (!v17) {
    xpc_object_t v17 = xpc_null_create();
  }
  uint64_t v15 = a2;
  BOOL v16 = "AWDMessageType";
  sub_1D3E1DB1C((uint64_t)&v15, &v17, &v18);
  xpc_release(v18);
  xpc_object_t v18 = 0;
  xpc_release(v17);
  xpc_object_t v17 = 0;
  xpc_object_t v13 = xpc_int64_create(*((unsigned int *)this + 2));
  if (!v13) {
    xpc_object_t v13 = xpc_null_create();
  }
  uint64_t v15 = a2;
  BOOL v16 = "AWDMessageDeviceConfigurationId";
  sub_1D3E1DB1C((uint64_t)&v15, &v13, &object);
  xpc_release(object);
  xpc_object_t object = 0;
  xpc_release(v13);
  xpc_object_t v13 = 0;
  xpc_object_t v11 = xpc_int64_create(*((unsigned int *)this + 3));
  if (!v11) {
    xpc_object_t v11 = xpc_null_create();
  }
  uint64_t v15 = a2;
  BOOL v16 = "AWDMessageComponentId";
  sub_1D3E1DB1C((uint64_t)&v15, &v11, &v12);
  xpc_release(v12);
  xpc_object_t v12 = 0;
  xpc_release(v11);
  xpc_object_t v11 = 0;
  xpc_object_t v9 = xpc_int64_create(*((int *)this + 4));
  if (!v9) {
    xpc_object_t v9 = xpc_null_create();
  }
  uint64_t v15 = a2;
  BOOL v16 = "AWDMessagePid";
  sub_1D3E1DB1C((uint64_t)&v15, &v9, &v10);
  xpc_release(v10);
  xpc_object_t v10 = 0;
  xpc_release(v9);
  xpc_object_t v9 = 0;
  xpc_object_t v7 = xpc_BOOL_create(*((unsigned char *)this + 20));
  if (!v7) {
    xpc_object_t v7 = xpc_null_create();
  }
  uint64_t v15 = a2;
  BOOL v16 = "AWDMessageNeedsConfiguration";
  sub_1D3E1DB1C((uint64_t)&v15, &v7, &v8);
  xpc_release(v8);
  xpc_object_t v8 = 0;
  xpc_release(v7);
}

xpc_object_t sub_1D3E1DB1C@<X0>(uint64_t a1@<X0>, xpc_object_t *a2@<X1>, xpc_object_t *a3@<X8>)
{
  xpc_dictionary_set_value(**(xpc_object_t **)a1, *(const char **)(a1 + 8), *a2);
  *a3 = *a2;
  xpc_object_t result = xpc_null_create();
  *a2 = result;
  return result;
}

uint64_t awd::AWDRegistrationMessage::getDeviceConfigurationId(awd::AWDRegistrationMessage *this)
{
  return *((unsigned int *)this + 2);
}

uint64_t awd::AWDRegistrationMessage::getComponentId(awd::AWDRegistrationMessage *this)
{
  return *((unsigned int *)this + 3);
}

uint64_t awd::AWDRegistrationMessage::getPid(awd::AWDRegistrationMessage *this)
{
  return *((unsigned int *)this + 4);
}

uint64_t awd::AWDRegistrationMessage::getNeedsConfiguration(awd::AWDRegistrationMessage *this)
{
  return *((unsigned __int8 *)this + 20);
}

void sub_1D3E1DB8C()
{
}

void AWDServerConsolidateDeviceDiagnostics(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v6 = v5;
  if (v5)
  {
    xpc_object_t v17 = v5;
  }
  else
  {
    xpc_object_t v6 = xpc_null_create();
    xpc_object_t v17 = v6;
    if (!v6)
    {
      xpc_object_t v7 = xpc_null_create();
      xpc_object_t v6 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x1D94419C0](v6) == MEMORY[0x1E4F14590])
  {
    xpc_retain(v6);
    goto LABEL_9;
  }
  xpc_object_t v7 = xpc_null_create();
LABEL_8:
  xpc_object_t v17 = v7;
LABEL_9:
  xpc_release(v6);
  switch(a1)
  {
    case 2:
      xpc_object_t v9 = xpc_string_create("feedback");
      if (!v9) {
        xpc_object_t v9 = xpc_null_create();
      }
      xpc_object_t v13 = &v17;
      uint64_t v14 = "diagType";
      sub_1D3E1DB1C((uint64_t)&v13, &v9, &object);
      xpc_release(object);
      xpc_object_t object = 0;
      xpc_release(v9);
      xpc_object_t v9 = 0;
      break;
    case 1:
      xpc_object_t v11 = xpc_string_create("cellular");
      if (!v11) {
        xpc_object_t v11 = xpc_null_create();
      }
      xpc_object_t v13 = &v17;
      uint64_t v14 = "diagType";
      sub_1D3E1DB1C((uint64_t)&v13, &v11, &v12);
      xpc_release(v12);
      xpc_object_t v12 = 0;
      xpc_release(v11);
      xpc_object_t v11 = 0;
      break;
    case 0:
      xpc_object_t v15 = xpc_string_create("wifi");
      if (!v15) {
        xpc_object_t v15 = xpc_null_create();
      }
      xpc_object_t v13 = &v17;
      uint64_t v14 = "diagType";
      sub_1D3E1DB1C((uint64_t)&v13, &v15, &v16);
      xpc_release(v16);
      xpc_object_t v16 = 0;
      xpc_release(v15);
      xpc_object_t v15 = 0;
      break;
  }
  AWDServerConnector::create(v8);
}

void sub_1D3E1DE84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, std::__shared_weak_count *a15, uint64_t a16, xpc_object_t object)
{
  if (a15) {
    sub_1D3E1D148(a15);
  }
  xpc_release(object);
  unint64_t v20 = *(std::__shared_weak_count **)(v18 - 64);
  if (v20) {
    sub_1D3E1D148(v20);
  }
  xpc_release(*(xpc_object_t *)(v18 - 40));

  _Unwind_Resume(a1);
}

void sub_1D3E1DEE8(uint64_t a1, void *a2)
{
  id v4 = (void *)MEMORY[0x1D94415E0]();
  xpc_object_t v35 = (xpc_object_t)*a2;
  if (v35 && MEMORY[0x1D94419C0](v35) == MEMORY[0x1E4F14590]) {
    xpc_retain(v35);
  }
  else {
    xpc_object_t v35 = xpc_null_create();
  }
  if (MEMORY[0x1D94419C0](*a2) != MEMORY[0x1E4F145D8])
  {
    v36 = &v35;
    v37 = "files";
    sub_1D3E1E3A0((uint64_t)&v36, &v34);
    uint64_t v5 = MEMORY[0x1D94419C0](v34);
    uint64_t v6 = MEMORY[0x1E4F14568];
    if (v5 == MEMORY[0x1E4F14568])
    {
      xpc_object_t v13 = (void *)MEMORY[0x1E4F1CA48];
      if (MEMORY[0x1D94419C0](v34) == v6) {
        size_t count = xpc_array_get_count(v34);
      }
      else {
        size_t count = 0;
      }
      xpc_object_t v9 = [v13 arrayWithCapacity:count];
      v36 = (xpc_object_t *)v34;
      if (v34) {
        xpc_retain(v34);
      }
      else {
        v36 = (xpc_object_t *)xpc_null_create();
      }
      sub_1D3E1EA40(&v32, (void **)&v36, 0);
      xpc_release(v36);
      v36 = (xpc_object_t *)v34;
      if (v34) {
        xpc_retain(v34);
      }
      else {
        v36 = (xpc_object_t *)xpc_null_create();
      }
      if (MEMORY[0x1D94419C0](v34) == v6) {
        xpc_object_t v15 = (void *)xpc_array_get_count(v34);
      }
      else {
        xpc_object_t v15 = 0;
      }
      sub_1D3E1EA40(v31, (void **)&v36, v15);
      xpc_release(v36);
      for (i = v33; i != v31[1] || v32 != v31[0]; i = ++v33)
      {
        v30[0] = &v32;
        v30[1] = i;
        xpc_object_t v17 = NSString;
        sub_1D3E1E43C((uint64_t)v30, &object);
        v36 = 0;
        v37 = 0;
        uint64_t v38 = 0;
        xpc::dyn_cast_or_default();
        if (SHIBYTE(v38) < 0) {
          operator delete(v36);
        }
        if (v29 >= 0) {
          p_p = &__p;
        }
        else {
          p_p = __p;
        }
        uint64_t v19 = [v17 stringWithUTF8String:p_p];
        [v9 addObject:v19];

        if (v29 < 0) {
          operator delete(__p);
        }
        xpc_release(object);
      }
      xpc_release(v32);
      xpc_release(v32);
      if (v9)
      {
        xpc_object_t v10 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v9, @"kAwdDiagnosticsFileArray", 0);
        xpc_object_t v8 = 0;
        goto LABEL_35;
      }
      xpc_object_t v8 = 0;
    }
    else
    {
      id v7 = objc_alloc(MEMORY[0x1E4F28C58]);
      xpc_object_t v8 = (void *)[v7 initWithDomain:*MEMORY[0x1E4F28798] code:2 userInfo:0];
      xpc_object_t v9 = 0;
    }
    xpc_object_t v10 = 0;
LABEL_35:
    unint64_t v20 = *(NSObject **)(a1 + 56);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1D3E1E484;
    block[3] = &unk_1E69CA610;
    id v26 = *(id *)(a1 + 32);
    id v21 = v8;
    id v24 = v21;
    id v25 = v10;
    id v22 = v10;
    dispatch_async(v20, block);

    xpc_release(v34);
    goto LABEL_36;
  }
  id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
  xpc_object_t v12 = (void *)[v11 initWithDomain:*MEMORY[0x1E4F28798] code:4 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

LABEL_36:
  xpc_release(v35);
}

void sub_1D3E1E2B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, xpc_object_t object, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,uint64_t a26,xpc_object_t a27)
{
  xpc_release(*(xpc_object_t *)(v28 - 104));

  xpc_release(*(xpc_object_t *)(v28 - 96));
  _Unwind_Resume(a1);
}

void sub_1D3E1E3A0(uint64_t a1@<X0>, void *a2@<X8>)
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
  if (MEMORY[0x1D94419C0](v4) != MEMORY[0x1E4F14568])
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

xpc_object_t sub_1D3E1E43C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
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

uint64_t sub_1D3E1E484(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t sub_1D3E1E49C(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_1D3E1E4B8(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    sub_1D3E1D148(v1);
  }
}

void AWDServerSetInvestigationId(unsigned int a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v6 = v5;
  if (v5)
  {
    xpc_object_t v15 = v5;
  }
  else
  {
    xpc_object_t v6 = xpc_null_create();
    xpc_object_t v15 = v6;
    if (!v6)
    {
      xpc_object_t v7 = xpc_null_create();
      xpc_object_t v6 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x1D94419C0](v6) == MEMORY[0x1E4F14590])
  {
    xpc_retain(v6);
    goto LABEL_9;
  }
  xpc_object_t v7 = xpc_null_create();
LABEL_8:
  xpc_object_t v15 = v7;
LABEL_9:
  xpc_release(v6);
  xpc_object_t v13 = xpc_string_create("set-iid-only");
  if (!v13) {
    xpc_object_t v13 = xpc_null_create();
  }
  id v11 = &v15;
  xpc_object_t v12 = "config";
  sub_1D3E1DB1C((uint64_t)&v11, &v13, &v14);
  xpc_release(v14);
  xpc_object_t v14 = 0;
  xpc_release(v13);
  xpc_object_t v13 = 0;
  xpc_object_t v9 = xpc_int64_create(a1);
  if (!v9) {
    xpc_object_t v9 = xpc_null_create();
  }
  id v11 = &v15;
  xpc_object_t v12 = "InvestigationId";
  sub_1D3E1DB1C((uint64_t)&v11, &v9, &object);
  xpc_release(object);
  xpc_object_t object = 0;
  xpc_release(v9);
  xpc_object_t v9 = 0;
  AWDServerConnector::create(v8);
}

void sub_1D3E1E740(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, std::__shared_weak_count *a15, dispatch_object_t object, xpc_object_t a17)
{
  if (object) {
    dispatch_release(object);
  }
  if (a15) {
    sub_1D3E1D148(a15);
  }
  xpc_release(a17);
  if (v17) {
    dispatch_release(v17);
  }
  id v21 = *(std::__shared_weak_count **)(v19 - 64);
  if (v21) {
    sub_1D3E1D148(v21);
  }
  xpc_release(*(xpc_object_t *)(v19 - 40));

  _Unwind_Resume(a1);
}

void sub_1D3E1E7D4(uint64_t a1, xpc_object_t *a2)
{
  if (*(void *)(a1 + 56) && *(void *)(a1 + 32))
  {
    xpc_object_t v15 = *a2;
    xpc_object_t v3 = v15;
    uint64_t v4 = MEMORY[0x1E4F14590];
    if (v15 && MEMORY[0x1D94419C0](v15) == v4)
    {
      xpc_retain(v15);
    }
    else
    {
      xpc_object_t v3 = xpc_null_create();
      xpc_object_t v15 = v3;
    }
    if (MEMORY[0x1D94419C0](v3) == v4)
    {
      xpc_object_t v12 = &v15;
      xpc_object_t v13 = "dcid";
      sub_1D3E1D854((uint64_t)&v12, &v14);
      int v5 = xpc::dyn_cast_or_default();
      xpc_release(v14);
      xpc_object_t v12 = &v15;
      xpc_object_t v13 = "InvestigationId";
      sub_1D3E1D854((uint64_t)&v12, &v14);
      int v6 = xpc::dyn_cast_or_default();
      xpc_release(v14);
    }
    else
    {
      int v5 = 0;
      int v6 = 0;
    }
    xpc_object_t v7 = *(NSObject **)(a1 + 56);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1D3E1E9A8;
    v8[3] = &unk_1E69CA638;
    id v9 = *(id *)(a1 + 32);
    int v10 = v5;
    int v11 = v6;
    dispatch_async(v7, v8);

    xpc_release(v15);
  }
}

void sub_1D3E1E954(_Unwind_Exception *a1)
{
  xpc_release(*(xpc_object_t *)(v1 - 48));
  xpc_release(*(xpc_object_t *)(v1 - 40));
  _Unwind_Resume(a1);
}

uint64_t sub_1D3E1E9A8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44));
}

void sub_1D3E1E9C0(void *a1, void *a2)
{
  uint64_t v2 = a2[6];
  a1[5] = a2[5];
  a1[6] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  xpc_object_t v3 = a2[7];
  a1[7] = v3;
  if (v3) {
    dispatch_retain(v3);
  }
}

void sub_1D3E1E9F0(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 56);
  if (v2) {
    dispatch_release(v2);
  }
  xpc_object_t v3 = *(std::__shared_weak_count **)(a1 + 48);
  if (v3)
  {
    sub_1D3E1D148(v3);
  }
}

void **sub_1D3E1EA40(void **a1, void **a2, void *a3)
{
  int v5 = *a2;
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

void sub_1D3E1EC50(_Unwind_Exception *a1)
{
  int v5 = v4;

  _Unwind_Resume(a1);
}

__n128 awd::AWDSubmissionMessage::AWDSubmissionMessage(uint64_t a1, int a2, uint64_t a3, uint64_t a4, int a5, __n128 *a6)
{
  *(void *)a1 = &unk_1F2B9AD48;
  *(_DWORD *)(a1 + 8) = a2;
  *(void *)(a1 + 12) = a3;
  *(void *)(a1 + 20) = a4;
  *(_DWORD *)(a1 + 28) = a5;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 32) = 0;
  __n128 result = *a6;
  *(__n128 *)(a1 + 32) = *a6;
  *(void *)(a1 + 48) = a6[1].n128_u64[0];
  a6->n128_u64[0] = 0;
  a6->n128_u64[1] = 0;
  a6[1].n128_u64[0] = 0;
  return result;
}

{
  __n128 result;

  *(void *)a1 = &unk_1F2B9AD48;
  *(_DWORD *)(a1 + 8) = a2;
  *(void *)(a1 + 12) = a3;
  *(void *)(a1 + 20) = a4;
  *(_DWORD *)(a1 + 28) = a5;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 32) = 0;
  __n128 result = *a6;
  *(__n128 *)(a1 + 32) = *a6;
  *(void *)(a1 + 48) = a6[1].n128_u64[0];
  a6->n128_u64[0] = 0;
  a6->n128_u64[1] = 0;
  a6[1].n128_u64[0] = 0;
  return result;
}

{
  __n128 result;

  *(void *)a1 = &unk_1F2B9AD48;
  *(_DWORD *)(a1 + 8) = a2;
  *(void *)(a1 + 12) = a3;
  *(void *)(a1 + 20) = a4;
  *(_DWORD *)(a1 + 28) = a5;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 32) = 0;
  __n128 result = *a6;
  *(__n128 *)(a1 + 32) = *a6;
  *(void *)(a1 + 48) = a6[1].n128_u64[0];
  a6->n128_u64[0] = 0;
  a6->n128_u64[1] = 0;
  a6[1].n128_u64[0] = 0;
  return result;
}

{
  __n128 result;

  *(void *)a1 = &unk_1F2B9AD48;
  *(_DWORD *)(a1 + 8) = a2;
  *(void *)(a1 + 12) = a3;
  *(void *)(a1 + 20) = a4;
  *(_DWORD *)(a1 + 28) = a5;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 32) = 0;
  __n128 result = *a6;
  *(__n128 *)(a1 + 32) = *a6;
  *(void *)(a1 + 48) = a6[1].n128_u64[0];
  a6->n128_u64[0] = 0;
  a6->n128_u64[1] = 0;
  a6[1].n128_u64[0] = 0;
  return result;
}

uint64_t awd::AWDSubmissionMessage::AWDSubmissionMessage(uint64_t a1, xpc_object_t *a2)
{
  *(void *)a1 = &unk_1F2B9AD48;
  *(_OWORD *)(a1 + 8) = 0u;
  uint64_t v4 = (_DWORD *)(a1 + 8);
  int v5 = (void *)(a1 + 32);
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  if (MEMORY[0x1D94419C0](*a2) == MEMORY[0x1E4F14590]
    && xpc_dictionary_get_int64(*a2, "AWDMessageType") == 2)
  {
    *(_DWORD *)(a1 + 12) = xpc_dictionary_get_int64(*a2, "AWDMessageMetricId");
    *(_DWORD *)(a1 + 16) = xpc_dictionary_get_int64(*a2, "AWDMessageProfileId");
    _DWORD *v4 = xpc_dictionary_get_int64(*a2, "AWDMessageSourceComponentId");
    *(_DWORD *)(a1 + 24) = xpc_dictionary_get_int64(*a2, "AWDMessageTriggerId");
    *(_DWORD *)(a1 + 20) = xpc_dictionary_get_int64(*a2, "AWDMessageTriggeringComponentId");
    *(_DWORD *)(a1 + 28) = xpc_dictionary_get_int64(*a2, "AWDMessageSubmissionId");
    size_t length = 0;
    data = (char *)xpc_dictionary_get_data(*a2, "AWDMessageSerializedMetrics", &length);
    sub_1D3E1F168(v5, data, &data[length], length);
  }
  return a1;
}

void sub_1D3E1EF08(_Unwind_Exception *exception_object)
{
  uint64_t v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 40) = v4;
    operator delete(v4);
  }
  _Unwind_Resume(exception_object);
}

void awd::AWDSubmissionMessage::createXpcMessage(const void **this@<X0>, void *a2@<X8>)
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_data(v4, "AWDMessageSerializedMetrics", this[4], (unsigned char *)this[5] - (unsigned char *)this[4]);
  xpc_dictionary_set_int64(v4, "AWDMessageType", 2);
  xpc_dictionary_set_int64(v4, "AWDMessageMetricId", *((unsigned int *)this + 3));
  xpc_dictionary_set_int64(v4, "AWDMessageProfileId", *((unsigned int *)this + 4));
  xpc_dictionary_set_int64(v4, "AWDMessageTriggerId", *((unsigned int *)this + 6));
  xpc_dictionary_set_int64(v4, "AWDMessageSourceComponentId", *((unsigned int *)this + 2));
  xpc_dictionary_set_int64(v4, "AWDMessageTriggeringComponentId", *((unsigned int *)this + 5));
  xpc_dictionary_set_int64(v4, "AWDMessageSubmissionId", *((unsigned int *)this + 7));
  if (v4)
  {
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
  if (MEMORY[0x1D94419C0](v4) != MEMORY[0x1E4F14590])
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

uint64_t awd::AWDSubmissionMessage::getMetricInfo(awd::AWDSubmissionMessage *this)
{
  return *(void *)((char *)this + 12);
}

uint64_t awd::AWDSubmissionMessage::getSrcComponentId(awd::AWDSubmissionMessage *this)
{
  return *((unsigned int *)this + 2);
}

uint64_t awd::AWDSubmissionMessage::getTrigger(awd::AWDSubmissionMessage *this)
{
  return *(void *)((char *)this + 20);
}

uint64_t awd::AWDSubmissionMessage::getSerializedMetrics(uint64_t a1)
{
  return a1 + 32;
}

{
  return a1 + 32;
}

void *sub_1D3E1F0A8(void *a1)
{
  *a1 = &unk_1F2B9AD48;
  uint64_t v2 = (void *)a1[4];
  if (v2)
  {
    a1[5] = v2;
    operator delete(v2);
  }
  return a1;
}

void sub_1D3E1F0F8(void *a1)
{
  *a1 = &unk_1F2B9AD48;
  uint64_t v2 = (void *)a1[4];
  if (v2)
  {
    a1[5] = v2;
    operator delete(v2);
  }
  JUMPOUT(0x1D94412F0);
}

void *sub_1D3E1F168(void *result, char *__src, char *a3, unint64_t a4)
{
  int v6 = __src;
  xpc_object_t v7 = result;
  unint64_t v8 = result[2];
  id v9 = (unsigned char *)*result;
  if (v8 - *result >= a4)
  {
    xpc_object_t v14 = (unsigned char *)result[1];
    size_t v15 = v14 - v9;
    if (v14 - v9 >= a4)
    {
      size_t v19 = a3 - __src;
      if (v19) {
        __n128 result = memmove((void *)*result, __src, v19);
      }
      xpc_object_t v12 = &v9[v19];
    }
    else
    {
      xpc_object_t v16 = &__src[v15];
      if (v14 != v9)
      {
        __n128 result = memmove((void *)*result, __src, v15);
        id v9 = (unsigned char *)v7[1];
      }
      xpc_object_t v12 = v9;
      if (v16 != a3)
      {
        xpc_object_t v12 = v9;
        xpc_object_t v17 = v9;
        do
        {
          char v18 = *v16++;
          *v17++ = v18;
          ++v12;
        }
        while (v16 != a3);
      }
    }
  }
  else
  {
    if (v9)
    {
      result[1] = v9;
      operator delete(v9);
      unint64_t v8 = 0;
      *xpc_object_t v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if ((a4 & 0x8000000000000000) != 0) {
      sub_1D3E1AE60();
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
    __n128 result = sub_1D3E1F29C(v7, v11);
    xpc_object_t v12 = (unsigned char *)v7[1];
    while (v6 != a3)
    {
      char v13 = *v6++;
      *v12++ = v13;
    }
  }
  v7[1] = v12;
  return result;
}

char *sub_1D3E1F29C(void *a1, size_t __sz)
{
  if ((__sz & 0x8000000000000000) != 0) {
    sub_1D3E1AE60();
  }
  __n128 result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

uint64_t awd::AWDMetricBuffer::AWDMetricBuffer(uint64_t a1, int a2, uint64_t a3)
{
  *(void *)a1 = dispatch_queue_create("com.apple.awd.AWDMetricBuffer", 0);
  ctu::OsLogLogger::OsLogLogger((ctu::OsLogLogger *)(a1 + 8), "com.apple.awd.framework", "metric.buffer");
  *(_DWORD *)(a1 + 16) = a2;
  int v6 = operator new(0x20uLL);
  v6[24] = 0;
  *((void *)v6 + 1) = 0;
  *((void *)v6 + 2) = 0;
  *(void *)(a1 + 24) = v6 + 24;
  *(void *)(a1 + 32) = v6;
  *(_OWORD *)(a1 + 40) = *(_OWORD *)a3;
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  *(void *)(a1 + 64) = 0;
  *(void *)int v6 = &unk_1F2B9B858;
  *(void *)(a1 + 56) = a1 + 64;
  *(void *)(a1 + 88) = 0;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = a1 + 88;
  *(void *)(a1 + 112) = 0;
  *(void *)(a1 + 120) = 0;
  return a1;
}

void awd::AWDMetricBuffer::~AWDMetricBuffer(awd::AWDMetricBuffer *this)
{
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 4);
  *((void *)this + 3) = 0;
  *((void *)this + 4) = 0;
  if (v2) {
    sub_1D3E1D148(v2);
  }
  xpc_object_t v3 = *(NSObject **)this;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = nullsub_3;
  block[3] = &unk_1E69CA558;
  void block[4] = &v7;
  dispatch_sync(v3, block);
  xpc_object_t v4 = (void *)*((void *)this + 13);
  if (v4)
  {
    *((void *)this + 14) = v4;
    operator delete(v4);
  }
  sub_1D3E20FB8((uint64_t)this + 80, *((void **)this + 11));
  sub_1D3E20F04((uint64_t)this + 56, *((void **)this + 8));
  xpc_object_t v5 = (std::__shared_weak_count *)*((void *)this + 6);
  if (v5) {
    std::__shared_weak_count::__release_weak(v5);
  }
  int v6 = (std::__shared_weak_count *)*((void *)this + 4);
  if (v6) {
    sub_1D3E1D148(v6);
  }
  MEMORY[0x1D9440F90]((char *)this + 8);
  if (*(void *)this) {
    dispatch_release(*(dispatch_object_t *)this);
  }
}

BOOL awd::AWDMetricBuffer::shouldBufferMetric(NSObject **this, int a2)
{
  int v5 = a2;
  uint64_t v2 = *this;
  v4[0] = this;
  v4[1] = &v5;
  uint64_t v7 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = sub_1D3E21018;
  block[3] = &unk_1E69CA598;
  void block[4] = &v7;
  void block[5] = v4;
  dispatch_sync(v2, block);
  return v7 != 0;
}

void awd::AWDMetricBuffer::buffer(NSObject **a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  v3[0] = a1;
  v3[1] = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = sub_1D3E21064;
  block[3] = &unk_1E69CA660;
  void block[4] = v3;
  dispatch_sync(v2, block);
}

void awd::AWDMetricBuffer::setConfiguration_sync(uint64_t a1, uint64_t a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a1 + 80;
  int v5 = (void *)(a1 + 88);
  sub_1D3E20FB8(a1 + 80, *(void **)(a1 + 88));
  *(void *)(a1 + 80) = v5;
  *int v5 = 0;
  int v6 = *(void **)(a1 + 64);
  *(void *)(a1 + 96) = 0;
  sub_1D3E20F04(a1 + 56, v6);
  *(void *)(a1 + 56) = a1 + 64;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 112) = *(void *)(a1 + 104);
  int v7 = *(_DWORD *)(a1 + 16);
  if (v7 == 60 || v7 == 12)
  {
    awd::AWDMetricBuffer::setBasebandConfiguration_sync((void *)a1, a2);
  }
  else
  {
    id v26 = (uint64_t **)(a1 + 56);
    uint64_t v9 = *(int *)(*(void *)a2 + 16);
    if (v9)
    {
      uint64_t v10 = *(uint64_t **)(*(void *)a2 + 8);
      id v25 = &v10[v9];
      while (1)
      {
        uint64_t v11 = *v10;
        *(void *)long long buf = *(unsigned int *)(*v10 + 32) | ((unint64_t)*(unsigned int *)(*v10 + 8) << 32);
        xpc_object_t v12 = sub_1D3E2117C(v26, (unsigned int *)buf);
        uint64_t v13 = *(int *)(v11 + 48);
        if (v13) {
          break;
        }
LABEL_31:
        if (++v10 == v25) {
          return;
        }
      }
      xpc_object_t v14 = *(uint64_t **)(v11 + 40);
      size_t v15 = (uint64_t **)(v12 + 12);
      uint64_t v16 = 8 * v13;
      while (1)
      {
        uint64_t v17 = *v14;
        unsigned int v27 = *(_DWORD *)(*v14 + 8);
        uint64_t v28 = &v27;
        char v18 = (unsigned int *)(sub_1D3E21410(v4, &v27, (uint64_t)&unk_1D3E52443, &v28) + 5);
        int v19 = *(_DWORD *)(v17 + 128);
        if ((v19 & 0x10) != 0) {
          break;
        }
        if ((v19 & 0x40) == 0)
        {
          unsigned int v20 = 1;
LABEL_17:
          awd::MetricBuffer::addCount(v18, v20);
          goto LABEL_19;
        }
        awd::MetricBuffer::addTimeInSeconds((uint64_t)v18, *(int *)(v17 + 32));
LABEL_19:
        int v21 = *(_DWORD *)(v17 + 128);
        if ((v21 & 0x80) != 0)
        {
          uint64_t v22 = *(_DWORD *)(v17 + 36) & ~(*(int *)(v17 + 36) >> 31);
          if ((v21 & 0x100) == 0) {
            goto LABEL_25;
          }
        }
        else
        {
          uint64_t v22 = 0;
          if ((v21 & 0x100) == 0) {
            goto LABEL_25;
          }
        }
        if (!*(unsigned char *)(v17 + 40))
        {
LABEL_25:
          if ((v21 & 0x10) != 0)
          {
            int v23 = *(_DWORD *)(v17 + 24);
            *(_DWORD *)long long buf = v27;
            unsigned int v30 = v27;
            LODWORD(v31) = 2;
            HIDWORD(v31) = v23;
            *(void *)&v32[4] = 0;
            *(void *)&v32[12] = v22;
            sub_1D3E215A8(v15, (unsigned int *)buf, (uint64_t)buf);
          }
          else if ((v21 & 0x40) != 0)
          {
            uint64_t v24 = *(int *)(v17 + 32);
            *(_DWORD *)long long buf = v27;
            unsigned int v30 = v27;
            uint64_t v31 = 3;
            *(void *)&v32[4] = v24;
            *(void *)&v32[12] = v22;
            sub_1D3E215A8(v15, (unsigned int *)buf, (uint64_t)buf);
          }
          else
          {
            *(_DWORD *)long long buf = v27;
            unsigned int v30 = v27;
            uint64_t v31 = 1;
            *(void *)&v32[4] = 0;
            *(void *)&v32[12] = v22;
            sub_1D3E215A8(v15, (unsigned int *)buf, (uint64_t)buf);
          }
          goto LABEL_30;
        }
        *(_OWORD *)&v33[4] = 0uLL;
        *(_DWORD *)long long buf = v27;
        unsigned int v30 = v27;
        uint64_t v31 = 4;
        *(_OWORD *)v32 = *(_OWORD *)v33;
        *(_DWORD *)&v32[16] = 0;
        sub_1D3E215A8(v15, (unsigned int *)buf, (uint64_t)buf);
LABEL_30:
        ++v14;
        v16 -= 8;
        if (!v16) {
          goto LABEL_31;
        }
      }
      unsigned int v20 = *(_DWORD *)(v17 + 24);
      goto LABEL_17;
    }
  }
}

uint64_t awd::AWDMetricBuffer::setBasebandConfiguration_sync(void *a1, uint64_t a2)
{
  uint64_t v3 = *(int *)(*(void *)a2 + 16);
  if (v3)
  {
    uint64_t v4 = *(uint64_t **)(*(void *)a2 + 8);
    int v5 = &v4[v3];
    int v6 = (char **)(a1 + 13);
    do
    {
      uint64_t v7 = *v4;
      if ((*(unsigned char *)(*v4 + 133) & 0x20) != 0 && !*(unsigned char *)(v7 + 116))
      {
        int v8 = *(_DWORD *)(v7 + 32);
        int v9 = *(_DWORD *)(v7 + 8);
        uint64_t v11 = (_DWORD *)a1[14];
        unint64_t v10 = a1[15];
        if ((unint64_t)v11 >= v10)
        {
          uint64_t v13 = ((char *)v11 - *v6) >> 3;
          unint64_t v14 = v13 + 1;
          if ((unint64_t)(v13 + 1) >> 61) {
            sub_1D3E1AE60();
          }
          uint64_t v15 = v10 - (void)*v6;
          if (v15 >> 2 > v14) {
            unint64_t v14 = v15 >> 2;
          }
          if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v16 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v16 = v14;
          }
          char v18 = (char *)sub_1D3E21674((uint64_t)(a1 + 15), v16);
          int v19 = &v18[8 * v13];
          *(_DWORD *)int v19 = v8;
          *((_DWORD *)v19 + 1) = v9;
          int v21 = (char *)a1[13];
          unsigned int v20 = (char *)a1[14];
          uint64_t v22 = v19;
          if (v20 != v21)
          {
            do
            {
              uint64_t v23 = *((void *)v20 - 1);
              v20 -= 8;
              *((void *)v22 - 1) = v23;
              v22 -= 8;
            }
            while (v20 != v21);
            unsigned int v20 = *v6;
          }
          xpc_object_t v12 = v19 + 8;
          a1[13] = v22;
          a1[14] = v19 + 8;
          a1[15] = &v18[8 * v17];
          if (v20) {
            operator delete(v20);
          }
        }
        else
        {
          *uint64_t v11 = v8;
          v11[1] = v9;
          xpc_object_t v12 = v11 + 2;
        }
        a1[14] = v12;
      }
      ++v4;
    }
    while (v4 != v5);
  }
  uint64_t v24 = a1[13];
  id v25 = (unsigned int *)a1[14];
  unint64_t v26 = 126 - 2 * __clz(((uint64_t)v25 - v24) >> 3);
  if (v25 == (unsigned int *)v24) {
    uint64_t v27 = 0;
  }
  else {
    uint64_t v27 = v26;
  }
  return sub_1D3E216AC(v24, v25, (uint64_t)&v29, v27, 1);
}

double awd::AWDMetricBuffer::BufferInfo::bufferInfoByCallback@<D0>(awd::AWDMetricBuffer::BufferInfo *this@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = this;
  *(void *)&double result = 4;
  *(void *)(a2 + 4) = 4;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  return result;
}

uint64_t awd::AWDMetricBuffer::BufferInfo::bufferInfoByCount@<X0>(uint64_t result@<X0>, int a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  *(_DWORD *)a4 = result;
  *(_DWORD *)(a4 + 4) = 2;
  *(void *)(a4 + 16) = 0;
  *(void *)(a4 + 24) = a3;
  *(_DWORD *)(a4 + 8) = a2;
  return result;
}

double awd::AWDMetricBuffer::BufferInfo::bufferInfoByTimeInSeconds@<D0>(int a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  *(_DWORD *)a4 = a1;
  *(void *)&double result = 3;
  *(void *)(a4 + 4) = 3;
  *(void *)(a4 + 16) = a2;
  *(void *)(a4 + 24) = a3;
  return result;
}

double awd::AWDMetricBuffer::BufferInfo::bufferInfoByMostRecent@<D0>(int a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_DWORD *)a3 = a1;
  *(void *)&double result = 1;
  *(void *)(a3 + 4) = 1;
  *(void *)(a3 + 16) = 0;
  *(void *)(a3 + 24) = a2;
  return result;
}

void awd::AWDMetricBuffer::setConfiguration(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  *a2 = 0;
  a2[1] = 0;
  operator new();
}

void awd::AWDMetricBuffer::_triggerOneMetric(uint64_t a1, uint64_t a2, unsigned int a3, int a4, unint64_t a5, uint64_t a6)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  uint64_t v48 = a2;
  unsigned int v49 = a3;
  uint64_t v7 = *(std::__shared_weak_count **)(a1 + 48);
  if (!v7)
  {
    uint64_t v11 = 0;
LABEL_14:
    char v18 = *(NSObject **)(a1 + 8);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    *(_WORD *)long long buf = 0;
    int v19 = "metric.buffer:#E fMetricSubmitter Null.";
    unsigned int v20 = v18;
    uint32_t v21 = 2;
    goto LABEL_16;
  }
  uint64_t v11 = std::__shared_weak_count::lock(v7);
  if (!v11) {
    goto LABEL_14;
  }
  xpc_object_t v12 = *(void **)(a1 + 40);
  if (!v12) {
    goto LABEL_14;
  }
  uint64_t v13 = sub_1D3E22934(a1 + 56, (unsigned int *)&v48 + 1);
  if (v13 != v14)
  {
    while (*((_DWORD *)v13 + 10) != a4)
    {
      uint64_t v15 = (uint64_t *)v13[1];
      if (v15)
      {
        do
        {
          unint64_t v16 = v15;
          uint64_t v15 = (uint64_t *)*v15;
        }
        while (v15);
      }
      else
      {
        do
        {
          unint64_t v16 = (uint64_t *)v13[2];
          BOOL v17 = *v16 == (void)v13;
          uint64_t v13 = v16;
        }
        while (!v17);
      }
      uint64_t v13 = v16;
      if (v16 == v14) {
        goto LABEL_37;
      }
    }
    if (v13 != v14)
    {
      uint64_t v25 = v13[7];
      uint64_t v23 = v13 + 7;
      uint64_t v24 = v25;
      if (!v25) {
        goto LABEL_34;
      }
      unint64_t v26 = v23;
      do
      {
        unsigned int v27 = *(_DWORD *)(v24 + 32);
        BOOL v28 = v27 >= a5;
        if (v27 >= a5) {
          char v29 = (uint64_t *)v24;
        }
        else {
          char v29 = (uint64_t *)(v24 + 8);
        }
        if (v28) {
          unint64_t v26 = (uint64_t *)v24;
        }
        uint64_t v24 = *v29;
      }
      while (*v29);
      if (v26 == v23 || *((_DWORD *)v26 + 8) > a5)
      {
LABEL_34:
        unsigned int v30 = *(NSObject **)(a1 + 8);
        if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_17;
        }
        *(_DWORD *)long long buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = a5;
        int v19 = "metric.buffer:#E Could not find buffering info for metric 0x%x in timer function";
        goto LABEL_36;
      }
      uint64_t v32 = *(void *)(a1 + 88);
      if (!v32) {
        goto LABEL_50;
      }
      int v33 = *((_DWORD *)v26 + 11);
      uint64_t v34 = a1 + 88;
      do
      {
        unsigned int v35 = *(_DWORD *)(v32 + 32);
        BOOL v36 = v35 >= a5;
        if (v35 >= a5) {
          v37 = (uint64_t *)v32;
        }
        else {
          v37 = (uint64_t *)(v32 + 8);
        }
        if (v36) {
          uint64_t v34 = v32;
        }
        uint64_t v32 = *v37;
      }
      while (*v37);
      if (v34 != a1 + 88 && *(_DWORD *)(v34 + 32) <= a5)
      {
        uint64_t v38 = (awd::MetricBuffer *)(v34 + 40);
        awd::MetricBuffer::end((awd::MetricBuffer *)(v34 + 40), (uint64_t)buf);
        switch(v33)
        {
          case 1:
            awd::MetricBuffer::lastCount(v38, 1, (uint64_t)v50);
            *(_OWORD *)long long buf = *(_OWORD *)v50;
            long long v54 = v51;
            uint64_t v55 = v52;
            v39 = *(NSObject **)(a1 + 8);
            if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v50 = 67109120;
              *(_DWORD *)&v50[4] = a5;
              unsigned int v40 = "metric.buffer:#I Found buffering info for metric 0x%x: most recent";
              goto LABEL_63;
            }
            break;
          case 2:
            awd::MetricBuffer::lastCount(v38, *((_DWORD *)v26 + 12), (uint64_t)v50);
            *(_OWORD *)long long buf = *(_OWORD *)v50;
            long long v54 = v51;
            uint64_t v55 = v52;
            v39 = *(NSObject **)(a1 + 8);
            if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v50 = 67109120;
              *(_DWORD *)&v50[4] = a5;
              unsigned int v40 = "metric.buffer:#I Found buffering info for metric 0x%x: num before trigger";
              goto LABEL_63;
            }
            break;
          case 3:
            awd::MetricBuffer::lastTimeInSeconds(v38, a6 - 1000 * v26[7], (uint64_t)v50);
            *(_OWORD *)long long buf = *(_OWORD *)v50;
            long long v54 = v51;
            uint64_t v55 = v52;
            v39 = *(NSObject **)(a1 + 8);
            if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v50 = 67109120;
              *(_DWORD *)&v50[4] = a5;
              unsigned int v40 = "metric.buffer:#I Found buffering info for metric 0x%x: time before trigger";
              goto LABEL_63;
            }
            break;
          case 4:
            v39 = *(NSObject **)(a1 + 8);
            if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v50 = 67109120;
              *(_DWORD *)&v50[4] = a5;
              unsigned int v40 = "metric.buffer:#I Found buffering info for metric 0x%x: callback";
LABEL_63:
              unsigned int v42 = v39;
              uint32_t v43 = 8;
              goto LABEL_64;
            }
            break;
          default:
            v41 = *(NSObject **)(a1 + 8);
            if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v50 = 67109888;
              *(_DWORD *)&v50[4] = a5;
              *(_WORD *)&v50[8] = 1024;
              *(_DWORD *)&v50[10] = v48;
              *(_WORD *)&v50[14] = 1024;
              LODWORD(v51) = HIDWORD(v48);
              WORD2(v51) = 1024;
              *(_DWORD *)((char *)&v51 + 6) = v49;
              unsigned int v40 = "metric.buffer:#I Got unknown buffering info for metric 0x%x, Trigger(cid=0x%x, trid=0x%x, sid=%u)";
              unsigned int v42 = v41;
              uint32_t v43 = 26;
LABEL_64:
              _os_log_impl(&dword_1D3E18000, v42, OS_LOG_TYPE_INFO, v40, v50, v43);
            }
            break;
        }
        while (1)
        {
          awd::MetricBuffer::end(v38, (uint64_t)v50);
          if (!awd::MetricBuffer::iterator::operator!=(buf, v50)) {
            break;
          }
          uint64_t v44 = v48;
          uint64_t v45 = v49;
          int v46 = *(_DWORD *)(a1 + 16);
          uint64_t v47 = awd::MetricBuffer::iterator::operator*((uint64_t)buf);
          a5 = a5 & 0xFFFFFFFF00000000 | v45;
          awd::AWDMetricSubmitter::addMetric(v12, v44, a5, a4, v46, v47);
          awd::MetricBuffer::iterator::operator++((uint64_t)buf, (uint64_t)v50);
        }
      }
      else
      {
LABEL_50:
        unsigned int v30 = *(NSObject **)(a1 + 8);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = a5;
          int v19 = "metric.buffer:#E Could not find buffer for metric 0x%x";
LABEL_36:
          unsigned int v20 = v30;
          uint32_t v21 = 8;
          goto LABEL_16;
        }
      }
LABEL_17:
      if (!v11) {
        return;
      }
      goto LABEL_18;
    }
LABEL_37:
    uint64_t v31 = *(NSObject **)(a1 + 8);
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    *(_DWORD *)long long buf = 67109632;
    *(_DWORD *)&uint8_t buf[4] = v48;
    *(_WORD *)&uint8_t buf[8] = 1024;
    *(_DWORD *)&buf[10] = HIDWORD(v48);
    *(_WORD *)&buf[14] = 1024;
    LODWORD(v54) = v49;
    int v19 = "metric.buffer:#E Could not find profile info for Trigger(cid=0x%x, trid=0x%x, sid=%u)in timer function.";
    unsigned int v20 = v31;
    uint32_t v21 = 20;
LABEL_16:
    _os_log_impl(&dword_1D3E18000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
    goto LABEL_17;
  }
  uint64_t v22 = *(NSObject **)(a1 + 8);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109632;
    *(_DWORD *)&uint8_t buf[4] = v48;
    *(_WORD *)&uint8_t buf[8] = 1024;
    *(_DWORD *)&buf[10] = HIDWORD(v48);
    *(_WORD *)&buf[14] = 1024;
    LODWORD(v54) = v49;
    _os_log_impl(&dword_1D3E18000, v22, OS_LOG_TYPE_DEFAULT, "metric.buffer:#E Could not find buffering info for Trigger(cid=0x%x, trid=0x%x, sid=%u)in timer function.", buf, 0x14u);
  }
LABEL_18:
  sub_1D3E1D148(v11);
}

void sub_1D3E201CC(_Unwind_Exception *a1)
{
  sub_1D3E1D148(v1);
  _Unwind_Resume(a1);
}

uint64_t awd::AWDMetricBuffer::BufferInfo::getBufferingType(awd::AWDMetricBuffer::BufferInfo *this)
{
  return *((unsigned int *)this + 1);
}

uint64_t awd::AWDMetricBuffer::BufferInfo::getCount(awd::AWDMetricBuffer::BufferInfo *this)
{
  return *((unsigned int *)this + 2);
}

uint64_t awd::AWDMetricBuffer::BufferInfo::getTimeBeforeInSeconds(awd::AWDMetricBuffer::BufferInfo *this)
{
  return *((void *)this + 2);
}

void awd::AWDMetricBuffer::pushMetricToDaemon(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = *(std::__shared_weak_count **)(a1 + 48);
  if (v7)
  {
    xpc_object_t v12 = std::__shared_weak_count::lock(v7);
    if (v12)
    {
      uint64_t v13 = *(void **)(a1 + 40);
      if (v13)
      {
        awd::AWDMetricSubmitter::addMetric(v13, a2, a3, a4, *(_DWORD *)(a1 + 16), a6);
LABEL_9:
        sub_1D3E1D148(v12);
        return;
      }
    }
  }
  else
  {
    xpc_object_t v12 = 0;
  }
  unint64_t v14 = *(NSObject **)(a1 + 8);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl(&dword_1D3E18000, v14, OS_LOG_TYPE_DEFAULT, "metric.buffer:#E pushMetricToDaemon: MetricSubmitter Null.", v15, 2u);
  }
  if (v12) {
    goto LABEL_9;
  }
}

void sub_1D3E202F0(_Unwind_Exception *a1)
{
  sub_1D3E1D148(v1);
  _Unwind_Resume(a1);
}

void awd::AWDMetricBuffer::pushTriggerToDaemon(void *a1, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = (std::__shared_weak_count *)a1[6];
  if (v5)
  {
    int v9 = std::__shared_weak_count::lock(v5);
    if (v9)
    {
      unint64_t v10 = (void *)a1[5];
      if (v10)
      {
        awd::AWDMetricSubmitter::generateTrigger(v10, a2, a3, a4);
LABEL_9:
        sub_1D3E1D148(v9);
        return;
      }
    }
  }
  else
  {
    int v9 = 0;
  }
  uint64_t v11 = a1[1];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)xpc_object_t v12 = 0;
    _os_log_impl(&dword_1D3E18000, v11, OS_LOG_TYPE_DEFAULT, "metric.buffer:#E pushTriggerToDaemon: fMetricSubmitter Null.", v12, 2u);
  }
  if (v9) {
    goto LABEL_9;
  }
}

void sub_1D3E203C4(_Unwind_Exception *a1)
{
  sub_1D3E1D148(v1);
  _Unwind_Resume(a1);
}

uint64_t awd::AWDMetricBuffer::finishSubmissionToDaemon(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  if (a4 != 12 && a4 != 60)
  {
    uint64_t v4 = *(void *)(result + 48);
    if (v4)
    {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 16), 1uLL, memory_order_relaxed);
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 16), 1uLL, memory_order_relaxed);
    }
    operator new();
  }
  return result;
}

void sub_1D3E204B0(_Unwind_Exception *exception_object)
{
  if (v1)
  {
    std::__shared_weak_count::__release_weak(v1);
    std::__shared_weak_count::__release_weak(v1);
  }
  _Unwind_Resume(exception_object);
}

void awd::AWDMetricBuffer::_trigger(uint64_t a1, uint64_t a2, int a3, dispatch_object_t *a4)
{
  int v4 = HIDWORD(a2);
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v41 = a2;
  int v42 = a3;
  int v6 = *(NSObject **)(a1 + 8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 67109120;
    int v44 = v4;
    _os_log_impl(&dword_1D3E18000, v6, OS_LOG_TYPE_INFO, "metric.buffer:#I In _trigger with trigger 0x%x", buf, 8u);
  }
  uint64_t v7 = sub_1D3E22934(a1 + 56, (unsigned int *)&v41 + 1);
  unint64_t v26 = v8;
  int v9 = v7;
  if (v7 == v8)
  {
    uint64_t v25 = *(NSObject **)(a1 + 8);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 67109120;
      int v44 = HIDWORD(v41);
      _os_log_impl(&dword_1D3E18000, v25, OS_LOG_TYPE_INFO, "metric.buffer:#I Could not find buffering info for trigger 0x%x", buf, 8u);
    }
  }
  else
  {
    unint64_t AWDTimestamp = awd::getAWDTimestamp((awd *)v7);
    do
    {
      unint64_t v10 = (uint64_t *)v9[6];
      unsigned int v27 = v9;
      unsigned int v30 = v9 + 7;
      if (v10 != v9 + 7)
      {
        int v31 = *((_DWORD *)v9 + 10);
        do
        {
          int v11 = *((_DWORD *)v10 + 8);
          uint64_t v12 = v10[8];
          uint64_t v13 = *a4;
          if (*a4)
          {
            dispatch_retain(*a4);
            dispatch_group_enter(v13);
          }
          uint64_t v14 = *(void *)(a1 + 24);
          uint64_t v15 = *(std::__shared_weak_count **)(a1 + 32);
          if (v15) {
            atomic_fetch_add_explicit(&v15->__shared_weak_owners_, 1uLL, memory_order_relaxed);
          }
          dispatch_time_t v16 = dispatch_time(0, 1000000000 * v12);
          BOOL v17 = *(NSObject **)(a1 + 8);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 67110144;
            int v44 = HIDWORD(v41);
            __int16 v45 = 1024;
            int v46 = v31;
            __int16 v47 = 1024;
            int v48 = v11;
            __int16 v49 = 2048;
            uint64_t v50 = v12;
            __int16 v51 = 2048;
            uint64_t v52 = 1000000000 * v12;
            _os_log_impl(&dword_1D3E18000, v17, OS_LOG_TYPE_INFO, "metric.buffer:#I Dispatching trigger 0x%x for profile 0x%x to metric 0x%x after %llu seconds (%llu ns).", buf, 0x28u);
          }
          char v18 = *(NSObject **)a1;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 1174405120;
          block[2] = sub_1D3E208A4;
          block[3] = &unk_1F2B9BBF0;
          void block[4] = a1;
          dispatch_group_t group = v13;
          if (v13)
          {
            dispatch_retain(v13);
            if (group) {
              dispatch_group_enter(group);
            }
          }
          uint64_t v34 = v14;
          unsigned int v35 = v15;
          if (v15) {
            atomic_fetch_add_explicit(&v15->__shared_weak_owners_, 1uLL, memory_order_relaxed);
          }
          uint64_t v37 = v41;
          int v38 = v42;
          int v39 = v31;
          int v40 = v11;
          unint64_t v36 = AWDTimestamp;
          dispatch_after(v16, v18, block);
          if (v35) {
            std::__shared_weak_count::__release_weak(v35);
          }
          if (group)
          {
            dispatch_group_leave(group);
            if (group) {
              dispatch_release(group);
            }
          }
          if (v15) {
            std::__shared_weak_count::__release_weak(v15);
          }
          if (v13)
          {
            dispatch_group_leave(v13);
            dispatch_release(v13);
          }
          int v19 = (uint64_t *)v10[1];
          if (v19)
          {
            do
            {
              unsigned int v20 = v19;
              int v19 = (uint64_t *)*v19;
            }
            while (v19);
          }
          else
          {
            do
            {
              unsigned int v20 = (uint64_t *)v10[2];
              BOOL v21 = *v20 == (void)v10;
              unint64_t v10 = v20;
            }
            while (!v21);
          }
          unint64_t v10 = v20;
        }
        while (v20 != v30);
      }
      uint64_t v22 = v27;
      uint64_t v23 = (uint64_t *)v27[1];
      if (v23)
      {
        do
        {
          uint64_t v24 = v23;
          uint64_t v23 = (uint64_t *)*v23;
        }
        while (v23);
      }
      else
      {
        do
        {
          uint64_t v24 = (uint64_t *)v22[2];
          BOOL v21 = *v24 == (void)v22;
          uint64_t v22 = v24;
        }
        while (!v21);
      }
      int v9 = v24;
    }
    while (v24 != v26);
  }
}

uint64_t awd::AWDMetricBuffer::BufferInfo::getTimeAfterInSeconds(awd::AWDMetricBuffer::BufferInfo *this)
{
  return *((void *)this + 3);
}

void sub_1D3E208A4(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 56);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = std::__shared_weak_count::lock(v2);
    if (v4)
    {
      int v5 = v4;
      if (*(void *)(a1 + 48)) {
        awd::AWDMetricBuffer::_triggerOneMetric(v3, *(void *)(a1 + 72), *(_DWORD *)(a1 + 80), *(_DWORD *)(a1 + 84), *(unsigned int *)(a1 + 88), *(void *)(a1 + 64));
      }
      sub_1D3E1D148(v5);
    }
  }
}

void sub_1D3E20924(_Unwind_Exception *a1)
{
  sub_1D3E1D148(v1);
  _Unwind_Resume(a1);
}

void sub_1D3E20938(void *a1, void *a2)
{
  int v4 = a2[5];
  a1[5] = v4;
  if (v4)
  {
    dispatch_retain(v4);
    int v5 = a1[5];
    if (v5) {
      dispatch_group_enter(v5);
    }
  }
  uint64_t v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 16), 1uLL, memory_order_relaxed);
  }
}

void sub_1D3E20990(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 56);
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  uint64_t v3 = *(NSObject **)(a1 + 40);
  if (v3)
  {
    dispatch_group_leave(v3);
    int v4 = *(NSObject **)(a1 + 40);
    if (v4)
    {
      dispatch_release(v4);
    }
  }
}

void awd::AWDMetricBuffer::trigger(NSObject **a1, uint64_t a2, int a3, uint64_t a4)
{
  v5[2] = a4;
  uint64_t v6 = a2;
  int v7 = a3;
  v5[0] = a1;
  v5[1] = &v6;
  int v4 = *a1;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = sub_1D3E22AA4;
  block[3] = &unk_1E69CA680;
  void block[4] = v5;
  dispatch_sync(v4, block);
}

uint64_t awd::AWDMetricBuffer::BufferInfo::BufferInfo(uint64_t result, int a2, int a3, uint64_t a4)
{
  *(_DWORD *)double result = a2;
  *(_DWORD *)(result + 4) = a3;
  *(_DWORD *)(result + 8) = 0;
  *(void *)(result + 16) = 0;
  *(void *)(result + 24) = a4;
  return result;
}

{
  *(_DWORD *)double result = a2;
  *(_DWORD *)(result + 4) = a3;
  *(_DWORD *)(result + 8) = 0;
  *(void *)(result + 16) = 0;
  *(void *)(result + 24) = a4;
  return result;
}

void awd::AWDMetricBuffer::BufferInfo::debugLog(awd::AWDMetricBuffer::BufferInfo *this, os_log_t *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int v3 = *((_DWORD *)this + 1);
  switch(v3)
  {
    case 3:
      os_log_t v9 = *a2;
      if (!os_log_type_enabled(*a2, OS_LOG_TYPE_INFO)) {
        return;
      }
      int v10 = *(_DWORD *)this;
      uint64_t v11 = *((void *)this + 2);
      uint64_t v12 = *((void *)this + 3);
      int v17 = 67109632;
      int v18 = v10;
      __int16 v19 = 2048;
      uint64_t v20 = v11;
      __int16 v21 = 2048;
      uint64_t v22 = v12;
      uint64_t v6 = "metric.buffer:#I \t\t- METRIC 0x%x: Buffer last %llu+%llu seconds";
      int v7 = v9;
      uint32_t v8 = 28;
      goto LABEL_13;
    case 2:
      os_log_t v13 = *a2;
      if (!os_log_type_enabled(*a2, OS_LOG_TYPE_INFO)) {
        return;
      }
      int v14 = *(_DWORD *)this;
      int v15 = *((_DWORD *)this + 2);
      int v17 = 67109376;
      int v18 = v14;
      __int16 v19 = 1024;
      LODWORD(v20) = v15;
      uint64_t v6 = "metric.buffer:#I \t\t- METRIC 0x%x: Buffer most recent %u metrics.";
      break;
    case 1:
      os_log_t v4 = *a2;
      if (!os_log_type_enabled(*a2, OS_LOG_TYPE_INFO)) {
        return;
      }
      int v5 = *(_DWORD *)this;
      int v17 = 67109120;
      int v18 = v5;
      uint64_t v6 = "metric.buffer:#I \t\t- METRIC 0x%x: Buffer most recent metric.";
      int v7 = v4;
      uint32_t v8 = 8;
      goto LABEL_13;
    default:
      os_log_t v13 = *a2;
      if (!os_log_type_enabled(*a2, OS_LOG_TYPE_INFO)) {
        return;
      }
      int v16 = *(_DWORD *)this;
      int v17 = 67109376;
      int v18 = v16;
      __int16 v19 = 1024;
      LODWORD(v20) = v3;
      uint64_t v6 = "metric.buffer:#I \t\t- METRIC 0x%x: UNKNOWN BUFFERING TYPE (%d)";
      break;
  }
  int v7 = v13;
  uint32_t v8 = 14;
LABEL_13:
  _os_log_impl(&dword_1D3E18000, v7, OS_LOG_TYPE_INFO, v6, (uint8_t *)&v17, v8);
}

void awd::AWDMetricBuffer::_debugLog(awd::AWDMetricBuffer *this)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (os_log_t *)((char *)this + 8);
  int v3 = *((void *)this + 1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1D3E18000, v3, OS_LOG_TYPE_INFO, "metric.buffer:#I The following are how much to buffer each metric for a given trigger:", buf, 2u);
  }
  os_log_t v4 = (awd::AWDMetricBuffer *)*((void *)this + 7);
  if (v4 != (awd::AWDMetricBuffer *)((char *)this + 64))
  {
    do
    {
      int v5 = *v2;
      if (os_log_type_enabled(*v2, OS_LOG_TYPE_INFO))
      {
        int v6 = *((_DWORD *)v4 + 8);
        int v7 = *((_DWORD *)v4 + 10);
        *(_DWORD *)long long buf = 67109376;
        int v15 = v6;
        __int16 v16 = 1024;
        int v17 = v7;
        _os_log_impl(&dword_1D3E18000, v5, OS_LOG_TYPE_INFO, "metric.buffer:#I \t- TRIGGER: 0x%x PROFILE: 0x%x", buf, 0xEu);
      }
      uint32_t v8 = (void *)*((void *)v4 + 6);
      if (v8 != (void *)((char *)v4 + 56))
      {
        do
        {
          awd::AWDMetricBuffer::BufferInfo::debugLog((awd::AWDMetricBuffer::BufferInfo *)(v8 + 5), v2);
          os_log_t v9 = (void *)v8[1];
          if (v9)
          {
            do
            {
              int v10 = v9;
              os_log_t v9 = (void *)*v9;
            }
            while (v9);
          }
          else
          {
            do
            {
              int v10 = (void *)v8[2];
              BOOL v11 = *v10 == (void)v8;
              uint32_t v8 = v10;
            }
            while (!v11);
          }
          uint32_t v8 = v10;
        }
        while (v10 != (void *)((char *)v4 + 56));
      }
      uint64_t v12 = (awd::AWDMetricBuffer *)*((void *)v4 + 1);
      if (v12)
      {
        do
        {
          os_log_t v13 = v12;
          uint64_t v12 = *(awd::AWDMetricBuffer **)v12;
        }
        while (v12);
      }
      else
      {
        do
        {
          os_log_t v13 = (awd::AWDMetricBuffer *)*((void *)v4 + 2);
          BOOL v11 = *(void *)v13 == (void)v4;
          os_log_t v4 = v13;
        }
        while (!v11);
      }
      os_log_t v4 = v13;
    }
    while (v13 != (awd::AWDMetricBuffer *)((char *)this + 64));
  }
}

void awd::AWDMetricBuffer::debugLog(NSObject **this)
{
  uint64_t v2 = this;
  uint64_t v1 = *this;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = sub_1D3E22ABC;
  block[3] = &unk_1E69CA6A0;
  void block[4] = &v2;
  dispatch_sync(v1, block);
}

void sub_1D3E20E88(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F2B9B858;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1D3E20EA8(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F2B9B858;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1D94412F0);
}

void sub_1D3E20F04(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_1D3E20F04(a1, *a2);
    sub_1D3E20F04(a1, a2[1]);
    sub_1D3E20F64((uint64_t)(a2 + 6), (void *)a2[7]);
    operator delete(a2);
  }
}

void sub_1D3E20F64(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_1D3E20F64(a1, *a2);
    sub_1D3E20F64(a1, a2[1]);
    operator delete(a2);
  }
}

void sub_1D3E20FB8(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_1D3E20FB8(a1, *a2);
    sub_1D3E20FB8(a1, a2[1]);
    awd::MetricBuffer::~MetricBuffer((awd::MetricBuffer *)(a2 + 5));
    operator delete(a2);
  }
}

uint64_t sub_1D3E21018(uint64_t result)
{
  uint64_t v1 = *(_DWORD ***)(result + 40);
  uint64_t v2 = (uint64_t *)*((void *)*v1 + 11);
  if (v2)
  {
    unsigned int v3 = *v1[1];
    uint64_t v4 = 1;
    do
    {
      unsigned int v5 = *((_DWORD *)v2 + 8);
      if (v3 >= v5)
      {
        if (v5 >= v3) {
          goto LABEL_8;
        }
        ++v2;
      }
      uint64_t v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  uint64_t v4 = 0;
LABEL_8:
  **(void **)(result + 32) = v4;
  return result;
}

void sub_1D3E21064(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = (void *)(*v1 + 88);
  uint64_t v3 = *v2;
  if (*v2)
  {
    uint64_t v4 = (unsigned int **)v1[1];
    unsigned int v5 = *v4;
    unsigned int v6 = **v4;
    int v7 = v2;
    do
    {
      unsigned int v8 = *(_DWORD *)(v3 + 32);
      BOOL v9 = v8 >= v6;
      if (v8 >= v6) {
        int v10 = (uint64_t *)v3;
      }
      else {
        int v10 = (uint64_t *)(v3 + 8);
      }
      if (v9) {
        int v7 = (void *)v3;
      }
      uint64_t v3 = *v10;
    }
    while (*v10);
    if (v7 != v2 && v6 >= *((_DWORD *)v7 + 8))
    {
      awd::AWDMetricBuffer *v4 = 0;
      uint64_t v12 = v5;
      awd::MetricBuffer::buffer((uint64_t)(v7 + 5), (uint64_t *)&v12);
      uint64_t v11 = (uint64_t)v12;
      uint64_t v12 = 0;
      if (v11) {
        sub_1D3E21120((uint64_t)&v12, v11);
      }
    }
  }
}

void sub_1D3E21100(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  uint64_t v11 = a10;
  a10 = 0;
  if (v11) {
    sub_1D3E21120((uint64_t)&a10, v11);
  }
  _Unwind_Resume(exception_object);
}

void sub_1D3E21120(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = *(void **)(a2 + 16);
    if (v2)
    {
      *(void *)(a2 + 24) = v2;
      operator delete(v2);
    }
    JUMPOUT(0x1D94412F0);
  }
}

_DWORD *sub_1D3E2117C(uint64_t **a1, unsigned int *a2)
{
  uint64_t v4 = operator new(0x48uLL);
  unsigned int v5 = a1 + 1;
  unsigned int v6 = a1[1];
  unsigned int v7 = *a2;
  unsigned int v8 = a2[1];
  v4[8] = *a2;
  v4[10] = v8;
  *((void *)v4 + 8) = 0;
  *((void *)v4 + 7) = 0;
  *((void *)v4 + 6) = v4 + 14;
  if (v6)
  {
    do
    {
      while (1)
      {
        unsigned int v5 = (uint64_t **)v6;
        if (v7 >= *((_DWORD *)v6 + 8)) {
          break;
        }
        unsigned int v6 = (uint64_t *)*v6;
        BOOL v9 = v5;
        if (!*v5) {
          goto LABEL_8;
        }
      }
      unsigned int v6 = (uint64_t *)v6[1];
    }
    while (v6);
    BOOL v9 = v5 + 1;
  }
  else
  {
    BOOL v9 = a1 + 1;
  }
LABEL_8:
  sub_1D3E21220(a1, (uint64_t)v5, v9, (uint64_t *)v4);
  return v4;
}

uint64_t *sub_1D3E21220(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  unsigned int v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  double result = sub_1D3E21278(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *sub_1D3E21278(uint64_t *result, uint64_t *a2)
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
      uint64_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), unsigned int v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            BOOL v9 = (uint64_t **)a2[2];
          }
          else
          {
            BOOL v9 = (uint64_t **)v2[1];
            int v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              uint64_t v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *BOOL v9 = v2;
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
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), unsigned int v5 = v4 + 3, v6))
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
        void v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      *unsigned int v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

uint64_t *sub_1D3E21410(uint64_t a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  int v6 = (uint64_t **)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 8);
  if (v5)
  {
    unsigned int v7 = *a2;
    while (1)
    {
      while (1)
      {
        int v8 = (uint64_t *)v5;
        unsigned int v9 = *(_DWORD *)(v5 + 32);
        if (v7 >= v9) {
          break;
        }
        uint64_t v5 = *v8;
        int v6 = (uint64_t **)v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (v9 >= v7) {
        break;
      }
      uint64_t v5 = v8[1];
      if (!v5)
      {
        int v6 = (uint64_t **)(v8 + 1);
        goto LABEL_10;
      }
    }
  }
  else
  {
    int v8 = (uint64_t *)(a1 + 8);
LABEL_10:
    sub_1D3E214DC(a1, a4, (uint64_t)v11);
    sub_1D3E21220((uint64_t **)a1, (uint64_t)v8, v6, v11[0]);
    int v8 = v11[0];
    v11[0] = 0;
    sub_1D3E21550((uint64_t *)v11, 0);
  }
  return v8;
}

uint64_t sub_1D3E214DC@<X0>(uint64_t a1@<X0>, _DWORD **a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  int v6 = operator new(0x58uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 16) = 0;
  v6[8] = **a2;
  uint64_t result = awd::MetricBuffer::MetricBuffer((uint64_t)(v6 + 10));
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

void sub_1D3E21538(_Unwind_Exception *a1)
{
  sub_1D3E21550(v1, 0);
  _Unwind_Resume(a1);
}

void sub_1D3E21550(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  *a1 = a2;
  if (v2)
  {
    if (*((unsigned char *)a1 + 16)) {
      awd::MetricBuffer::~MetricBuffer((awd::MetricBuffer *)(v2 + 40));
    }
    operator delete((void *)v2);
  }
}

uint64_t **sub_1D3E215A8(uint64_t **a1, unsigned int *a2, uint64_t a3)
{
  int v6 = a1 + 1;
  uint64_t v5 = a1[1];
  if (v5)
  {
    unsigned int v7 = *a2;
    while (1)
    {
      while (1)
      {
        int v8 = (uint64_t **)v5;
        unsigned int v9 = *((_DWORD *)v5 + 8);
        if (v7 >= v9) {
          break;
        }
        uint64_t v5 = *v8;
        int v6 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (v9 >= v7) {
        break;
      }
      uint64_t v5 = v8[1];
      if (!v5)
      {
        int v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    int v8 = a1 + 1;
LABEL_10:
    int v10 = (char *)operator new(0x48uLL);
    *((_DWORD *)v10 + 8) = *(_DWORD *)a3;
    *(_OWORD *)(v10 + 40) = *(_OWORD *)(a3 + 8);
    *(_OWORD *)(v10 + 56) = *(_OWORD *)(a3 + 24);
    sub_1D3E21220(a1, (uint64_t)v8, v6, (uint64_t *)v10);
    return (uint64_t **)v10;
  }
  return v8;
}

void *sub_1D3E21674(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_1D3E1D114();
  }
  return operator new(8 * a2);
}

uint64_t sub_1D3E216AC(uint64_t result, unsigned int *a2, uint64_t a3, uint64_t a4, char a5)
{
  int v10 = (unsigned int *)result;
LABEL_2:
  uint64_t v11 = v10;
LABEL_3:
  uint64_t v12 = 1 - a4;
  while (1)
  {
    int v10 = v11;
    uint64_t v13 = v12;
    uint64_t v14 = (char *)a2 - (char *)v11;
    unint64_t v15 = ((char *)a2 - (char *)v11) >> 3;
    if (!(!v6 & v5))
    {
      switch(v15)
      {
        case 0uLL:
        case 1uLL:
          return result;
        case 2uLL:
          unsigned int v23 = *(a2 - 2);
          unsigned int v24 = *v11;
          if (v23 < *v11 || v24 >= v23 && *(a2 - 1) < v11[1])
          {
            *uint64_t v11 = v23;
            *(a2 - 2) = v24;
            unsigned int v25 = v11[1];
            v11[1] = *(a2 - 1);
            *(a2 - 1) = v25;
          }
          break;
        case 3uLL:
          uint64_t result = sub_1D3E21C10(v11, v11 + 2, a2 - 2);
          break;
        case 4uLL:
          uint64_t result = sub_1D3E221F0(v11, v11 + 2, v11 + 4, a2 - 2);
          break;
        case 5uLL:
          uint64_t result = sub_1D3E222F4(v11, v11 + 2, v11 + 4, v11 + 6, a2 - 2);
          break;
        default:
          JUMPOUT(0);
      }
      return result;
    }
    if (v14 <= 191) {
      break;
    }
    if (v13 == 1)
    {
      if (v11 != a2)
      {
        return (uint64_t)sub_1D3E2244C(v11, a2, a2, a3);
      }
      return result;
    }
    unint64_t v16 = v15 >> 1;
    int v17 = &v11[2 * (v15 >> 1)];
    if ((unint64_t)v14 >= 0x401)
    {
      sub_1D3E21C10(v11, &v11[2 * (v15 >> 1)], a2 - 2);
      sub_1D3E21C10(v11 + 2, v17 - 2, a2 - 4);
      sub_1D3E21C10(v11 + 4, &v11[2 * v16 + 2], a2 - 6);
      sub_1D3E21C10(v17 - 2, v17, &v11[2 * v16 + 2]);
      uint64_t v18 = *(void *)v11;
      *(void *)uint64_t v11 = *(void *)v17;
      *(void *)int v17 = v18;
      if (a5) {
        goto LABEL_16;
      }
    }
    else
    {
      sub_1D3E21C10(&v11[2 * (v15 >> 1)], v11, a2 - 2);
      if (a5) {
        goto LABEL_16;
      }
    }
    unsigned int v19 = *(v11 - 2);
    if (v19 >= *v11 && (*v11 < v19 || *(v11 - 1) >= v11[1]))
    {
      uint64_t result = (uint64_t)sub_1D3E21D64(v11, a2);
      uint64_t v11 = (unsigned int *)result;
      goto LABEL_21;
    }
LABEL_16:
    uint64_t v20 = sub_1D3E21E98(v11, a2);
    if ((v21 & 1) == 0) {
      goto LABEL_19;
    }
    BOOL v22 = sub_1D3E21FD4(v11, v20);
    uint64_t v11 = v20 + 2;
    uint64_t result = sub_1D3E21FD4(v20 + 2, a2);
    if (result)
    {
      a4 = -v13;
      a2 = v20;
      if (v22) {
        return result;
      }
      goto LABEL_2;
    }
    uint64_t v12 = v13 + 1;
    if (!v22)
    {
LABEL_19:
      uint64_t result = sub_1D3E216AC(v10, v20, a3, -v13, a5 & 1);
      uint64_t v11 = v20 + 2;
LABEL_21:
      a5 = 0;
      a4 = -v13;
      goto LABEL_3;
    }
  }
  if (a5)
  {
    return (uint64_t)sub_1D3E21AA4(v11, a2);
  }
  else
  {
    return (uint64_t)sub_1D3E21B78(v11, a2);
  }
}

unsigned int *sub_1D3E21AA4(unsigned int *result, unsigned int *a2)
{
  if (result != a2)
  {
    uint64_t v2 = result + 2;
    if (result + 2 != a2)
    {
      uint64_t v3 = 0;
      uint64_t v4 = result;
      do
      {
        char v5 = v4;
        uint64_t v4 = v2;
        unsigned int v6 = v5[2];
        unsigned int v7 = *v5;
        if (v6 < *v5 || v7 >= v6 && v5[3] < v5[1])
        {
          unsigned int v9 = v5[2];
          unsigned int v8 = v5[3];
          unsigned int v10 = v5[1];
          v5[2] = v7;
          v4[1] = v10;
          uint64_t v11 = result;
          if (v5 != result)
          {
            uint64_t v12 = v3;
            do
            {
              unsigned int v13 = *(unsigned int *)((char *)result + v12 - 8);
              if (v13 <= v9)
              {
                if (v13 < v9)
                {
                  uint64_t v11 = v5;
                  goto LABEL_17;
                }
                uint64_t v11 = (unsigned int *)((char *)result + v12);
                unsigned int v14 = *(unsigned int *)((char *)result + v12 - 4);
                if (v14 <= v8) {
                  goto LABEL_17;
                }
              }
              else
              {
                unsigned int v14 = *(unsigned int *)((char *)result + v12 - 4);
              }
              v5 -= 2;
              unint64_t v15 = (unsigned int *)((char *)result + v12);
              unsigned int *v15 = v13;
              v15[1] = v14;
              v12 -= 8;
            }
            while (v12);
            uint64_t v11 = result;
          }
LABEL_17:
          *uint64_t v11 = v9;
          v11[1] = v8;
        }
        uint64_t v2 = v4 + 2;
        v3 += 8;
      }
      while (v4 + 2 != a2);
    }
  }
  return result;
}

unsigned int *sub_1D3E21B78(unsigned int *result, unsigned int *a2)
{
  if (result != a2)
  {
    uint64_t v2 = result + 2;
    if (result + 2 != a2)
    {
      uint64_t v3 = result + 1;
      do
      {
        uint64_t v4 = result;
        uint64_t result = v2;
        unsigned int v5 = v4[2];
        unsigned int v6 = *v4;
        if (v5 < *v4 || v6 >= v5 && v4[3] < v4[1])
        {
          unsigned int v7 = *result;
          unsigned int v8 = result[1];
          for (i = v3; ; i -= 2)
          {
            unsigned int v10 = *i;
            i[1] = v6;
            i[2] = v10;
            unsigned int v6 = *(i - 3);
            if (v6 <= v7 && (v6 < v7 || *(i - 2) <= v8)) {
              break;
            }
          }
          *(i - 1) = v7;
          unsigned int *i = v8;
        }
        uint64_t v2 = result + 2;
        v3 += 2;
      }
      while (result + 2 != a2);
    }
  }
  return result;
}

uint64_t sub_1D3E21C10(unsigned int *a1, unsigned int *a2, unsigned int *a3)
{
  unsigned int v3 = *a2;
  unsigned int v4 = *a1;
  if (*a2 >= *a1 && (v4 < v3 || a2[1] >= a1[1]))
  {
    unsigned int v9 = *a3;
    if (*a3 >= v3 && (v3 < v9 || a3[1] >= a2[1])) {
      return 0;
    }
    *a2 = v9;
    *a3 = v3;
    uint64_t v11 = (int *)(a2 + 1);
    unsigned int v10 = a2[1];
    a2[1] = a3[1];
    a3[1] = v10;
    unsigned int v12 = *a2;
    unsigned int v13 = *a1;
    if (*a2 >= *a1 && (v13 < v12 || *v11 >= a1[1])) {
      return 1;
    }
    *a1 = v12;
    unsigned int v6 = (int *)(a1 + 1);
    *a2 = v13;
    uint64_t v8 = 2;
  }
  else
  {
    unsigned int v5 = *a3;
    if (*a3 < v3 || v3 >= v5 && a3[1] < a2[1])
    {
      *a1 = v5;
      unsigned int v6 = (int *)(a1 + 1);
      *a3 = v4;
      unsigned int v7 = (int *)(a3 + 1);
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
      if (*a3 >= *a2 && (v16 < v15 || a3[1] >= v14)) {
        return 1;
      }
      *a2 = v15;
      *a3 = v16;
      unsigned int v7 = (int *)(a3 + 1);
      uint64_t v8 = 2;
      unsigned int v6 = (int *)(a2 + 1);
    }
    uint64_t v11 = v7;
  }
  int v17 = *v6;
  int *v6 = *v11;
  *uint64_t v11 = v17;
  return v8;
}

unsigned int *sub_1D3E21D64(unsigned int *a1, unsigned int *a2)
{
  unsigned int v3 = *a1;
  unsigned int v2 = a1[1];
  unsigned int v4 = *(a2 - 2);
  if (v4 <= *a1 && (v4 < v3 || *(a2 - 1) <= v2))
  {
    for (i = a1 + 2; i < a2 && *i <= v3 && (*i < v3 || i[1] <= v2); i += 2)
      ;
  }
  else
  {
    i = a1;
    do
    {
      unsigned int v7 = i[2];
      i += 2;
      unsigned int v6 = v7;
    }
    while (v7 <= v3 && (v6 < v3 || i[1] <= v2));
  }
  if (i < a2)
  {
    for (a2 -= 2; v4 > v3 || v4 >= v3 && a2[1] > v2; a2 -= 2)
    {
      unsigned int v8 = *(a2 - 2);
      unsigned int v4 = v8;
    }
  }
  if (i < a2)
  {
    unsigned int v9 = *i;
    unsigned int v10 = *a2;
    do
    {
      unsigned int *i = v10;
      *a2 = v9;
      unsigned int v11 = i[1];
      i[1] = a2[1];
      a2[1] = v11;
      do
      {
        unsigned int v12 = i[2];
        i += 2;
        unsigned int v9 = v12;
      }
      while (v12 <= v3 && (v9 < v3 || i[1] <= v2));
      do
      {
        do
        {
          unsigned int v13 = *(a2 - 2);
          a2 -= 2;
          unsigned int v10 = v13;
          BOOL v14 = v13 >= v3;
        }
        while (v13 > v3);
      }
      while (v14 && a2[1] > v2);
    }
    while (i < a2);
  }
  if (i - 2 != a1)
  {
    *a1 = *(i - 2);
    a1[1] = *(i - 1);
  }
  *(i - 2) = v3;
  *(i - 1) = v2;
  return i;
}

unsigned int *sub_1D3E21E98(unsigned int *a1, unsigned int *a2)
{
  uint64_t v2 = 0;
  unsigned int v3 = *a1;
  unsigned int v4 = a1[1];
  while (1)
  {
    unsigned int v5 = a1[v2 + 2];
    if (v5 >= v3 && (v5 > v3 || a1[v2 + 3] >= v4)) {
      break;
    }
    v2 += 2;
  }
  unint64_t v6 = (unint64_t)&a1[v2 + 2];
  if (v2 * 4)
  {
    do
    {
      unsigned int v8 = *(a2 - 2);
      a2 -= 2;
      unsigned int v7 = v8;
    }
    while (v8 >= v3 && (v7 > v3 || a2[1] >= v4));
  }
  else
  {
LABEL_19:
    if (v6 < (unint64_t)a2)
    {
      do
      {
        unsigned int v10 = *(a2 - 2);
        a2 -= 2;
        unsigned int v9 = v10;
        if (v10 < v3) {
          break;
        }
        if (v9 > v3) {
          goto LABEL_19;
        }
      }
      while (a2[1] >= v4 && v6 < (unint64_t)a2);
    }
  }
  if (v6 >= (unint64_t)a2)
  {
    unsigned int v13 = (unsigned int *)v6;
  }
  else
  {
    unsigned int v12 = *a2;
    unsigned int v13 = (unsigned int *)v6;
    BOOL v14 = a2;
    do
    {
      *unsigned int v13 = v12;
      unsigned int *v14 = v5;
      unsigned int v15 = v13[1];
      v13[1] = v14[1];
      v14[1] = v15;
      do
      {
        do
        {
          unsigned int v16 = v13[2];
          v13 += 2;
          unsigned int v5 = v16;
          BOOL v17 = v16 > v3;
        }
        while (v16 < v3);
      }
      while (!v17 && v13[1] < v4);
      do
      {
        unsigned int v18 = *(v14 - 2);
        v14 -= 2;
        unsigned int v12 = v18;
      }
      while (v18 >= v3 && (v12 > v3 || v14[1] >= v4));
    }
    while (v13 < v14);
  }
  if (v13 - 2 != a1)
  {
    *a1 = *(v13 - 2);
    a1[1] = *(v13 - 1);
  }
  *(v13 - 2) = v3;
  *(v13 - 1) = v4;
  return v13 - 2;
}

BOOL sub_1D3E21FD4(unsigned int *a1, unsigned int *a2)
{
  uint64_t v4 = ((char *)a2 - (char *)a1) >> 3;
  BOOL result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      unsigned int v6 = *(a2 - 2);
      unsigned int v7 = *a1;
      if (v6 < *a1 || v7 >= v6 && *(a2 - 1) < a1[1])
      {
        *a1 = v6;
        *(a2 - 2) = v7;
        unsigned int v8 = a1[1];
        a1[1] = *(a2 - 1);
        *(a2 - 1) = v8;
      }
      return result;
    case 3:
      sub_1D3E21C10(a1, a1 + 2, a2 - 2);
      return 1;
    case 4:
      sub_1D3E221F0(a1, a1 + 2, a1 + 4, a2 - 2);
      return 1;
    case 5:
      sub_1D3E222F4(a1, a1 + 2, a1 + 4, a1 + 6, a2 - 2);
      return 1;
    default:
      unsigned int v9 = a1 + 4;
      sub_1D3E21C10(a1, a1 + 2, a1 + 4);
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
    unsigned int v13 = *v9;
    if (*v10 >= *v9 && (v13 < *v10 || v10[1] >= v9[1])) {
      goto LABEL_22;
    }
    unsigned int v14 = *v10;
    unsigned int v15 = v10[1];
    unsigned int *v10 = v13;
    v10[1] = v9[1];
    unsigned int v16 = a1;
    if (v9 == a1) {
      goto LABEL_21;
    }
    uint64_t v17 = v11;
    while (1)
    {
      unsigned int v18 = (char *)a1 + v17;
      unsigned int v19 = *(unsigned int *)((char *)a1 + v17 + 8);
      if (v19 <= v14) {
        break;
      }
      unsigned int v20 = *((_DWORD *)v18 + 3);
LABEL_18:
      v9 -= 2;
      *((_DWORD *)v18 + 4) = v19;
      *(unsigned int *)((char *)a1 + v17 + 20) = v20;
      v17 -= 8;
      if (v17 == -16)
      {
        unsigned int v16 = a1;
        goto LABEL_21;
      }
    }
    if (v19 < v14)
    {
      unsigned int v16 = v9;
      goto LABEL_21;
    }
    unsigned int v20 = *(unsigned int *)((char *)a1 + v17 + 12);
    if (v20 > v15) {
      goto LABEL_18;
    }
    unsigned int v16 = (unsigned int *)((char *)a1 + v17 + 16);
LABEL_21:
    unsigned int *v16 = v14;
    v16[1] = v15;
    if (++v12 == 8) {
      return v10 + 2 == a2;
    }
LABEL_22:
    unsigned int v9 = v10;
    v11 += 8;
    v10 += 2;
  }
  while (v10 != a2);
  return 1;
}

uint64_t sub_1D3E221F0(unsigned int *a1, unsigned int *a2, unsigned int *a3, unsigned int *a4)
{
  uint64_t result = sub_1D3E21C10(a1, a2, a3);
  unsigned int v9 = *a4;
  unsigned int v10 = *a3;
  if (*a4 < *a3 || v10 >= v9 && a4[1] < a3[1])
  {
    *a3 = v9;
    *a4 = v10;
    unsigned int v11 = a3[1];
    a3[1] = a4[1];
    a4[1] = v11;
    unsigned int v12 = *a3;
    unsigned int v13 = *a2;
    if (*a3 < *a2 || v13 >= v12 && a3[1] < a2[1])
    {
      *a2 = v12;
      *a3 = v13;
      unsigned int v14 = a2[1];
      a2[1] = a3[1];
      a3[1] = v14;
      unsigned int v15 = *a2;
      unsigned int v16 = *a1;
      if (*a2 < *a1 || v16 >= v15 && a2[1] < a1[1])
      {
        *a1 = v15;
        *a2 = v16;
        unsigned int v17 = a1[1];
        a1[1] = a2[1];
        a2[1] = v17;
      }
    }
  }
  return result;
}

uint64_t sub_1D3E222F4(unsigned int *a1, unsigned int *a2, unsigned int *a3, unsigned int *a4, unsigned int *a5)
{
  uint64_t result = sub_1D3E221F0(a1, a2, a3, a4);
  unsigned int v11 = *a5;
  unsigned int v12 = *a4;
  if (*a5 < *a4 || v12 >= v11 && a5[1] < a4[1])
  {
    *a4 = v11;
    *a5 = v12;
    unsigned int v13 = a4[1];
    a4[1] = a5[1];
    a5[1] = v13;
    unsigned int v14 = *a4;
    unsigned int v15 = *a3;
    if (*a4 < *a3 || v15 >= v14 && a4[1] < a3[1])
    {
      *a3 = v14;
      *a4 = v15;
      unsigned int v16 = a3[1];
      a3[1] = a4[1];
      a4[1] = v16;
      unsigned int v17 = *a3;
      unsigned int v18 = *a2;
      if (*a3 < *a2 || v18 >= v17 && a3[1] < a2[1])
      {
        *a2 = v17;
        *a3 = v18;
        unsigned int v19 = a2[1];
        a2[1] = a3[1];
        a3[1] = v19;
        unsigned int v20 = *a2;
        unsigned int v21 = *a1;
        if (*a2 < *a1 || v21 >= v20 && a2[1] < a1[1])
        {
          *a1 = v20;
          *a2 = v21;
          unsigned int v22 = a1[1];
          a1[1] = a2[1];
          a2[1] = v22;
        }
      }
    }
  }
  return result;
}

unsigned int *sub_1D3E2244C(unsigned int *a1, unsigned int *a2, unsigned int *a3, uint64_t a4)
{
  if (a1 != a2)
  {
    uint64_t v8 = (char *)a2 - (char *)a1;
    uint64_t v9 = ((char *)a2 - (char *)a1) >> 3;
    if ((char *)a2 - (char *)a1 >= 9)
    {
      unint64_t v10 = (unint64_t)(v9 - 2) >> 1;
      unint64_t v11 = v10 + 1;
      unsigned int v12 = &a1[2 * v10];
      do
      {
        sub_1D3E225C8((uint64_t)a1, a4, v9, v12);
        v12 -= 2;
        --v11;
      }
      while (v11);
    }
    unsigned int v13 = a2;
    if (a2 != a3)
    {
      unsigned int v14 = a2;
      do
      {
        unsigned int v15 = *v14;
        unsigned int v16 = *a1;
        if (*v14 < *a1 || v16 >= v15 && v14[1] < a1[1])
        {
          unsigned int *v14 = v16;
          *a1 = v15;
          unsigned int v17 = v14[1];
          v14[1] = a1[1];
          a1[1] = v17;
          sub_1D3E225C8((uint64_t)a1, a4, v9, a1);
        }
        v14 += 2;
      }
      while (v14 != a3);
      unsigned int v13 = a3;
    }
    if (v8 >= 9)
    {
      uint64_t v18 = (unint64_t)v8 >> 3;
      unsigned int v19 = a2 - 2;
      do
      {
        unsigned int v21 = *a1;
        unsigned int v20 = a1[1];
        unsigned int v22 = sub_1D3E2270C(a1, a4, v18);
        if (v19 == v22)
        {
          *unsigned int v22 = v21;
          v22[1] = v20;
        }
        else
        {
          *unsigned int v22 = *v19;
          v22[1] = v19[1];
          *unsigned int v19 = v21;
          v19[1] = v20;
          sub_1D3E227A0((uint64_t)a1, (uint64_t)(v22 + 2), a4, ((char *)(v22 + 2) - (char *)a1) >> 3);
        }
        v19 -= 2;
      }
      while (v18-- > 2);
    }
    return v13;
  }
  return a3;
}

uint64_t sub_1D3E225C8(uint64_t result, uint64_t a2, uint64_t a3, unsigned int *a4)
{
  if (a3 >= 2)
  {
    uint64_t v4 = (uint64_t)a4 - result;
    int64_t v5 = (unint64_t)(a3 - 2) >> 1;
    if (v5 >= ((uint64_t)a4 - result) >> 3)
    {
      uint64_t v6 = v4 >> 2;
      uint64_t v7 = (v4 >> 2) + 1;
      uint64_t v8 = (unsigned int *)(result + 8 * v7);
      uint64_t v9 = v6 + 2;
      if (v9 < a3)
      {
        unsigned int v10 = v8[2];
        if (*v8 < v10 || v10 >= *v8 && *(_DWORD *)(result + 8 * v7 + 4) < v8[3])
        {
          v8 += 2;
          uint64_t v7 = v9;
        }
      }
      unsigned int v11 = *v8;
      if (*v8 >= *a4 && (*a4 < v11 || v8[1] >= a4[1]))
      {
        unsigned int v12 = *a4;
        unsigned int v13 = a4[1];
        *a4 = v11;
        a4[1] = v8[1];
        if (v5 >= v7)
        {
          while (1)
          {
            uint64_t v15 = 2 * v7;
            uint64_t v7 = (2 * v7) | 1;
            unsigned int v14 = (unsigned int *)(result + 8 * v7);
            uint64_t v16 = v15 + 2;
            if (v16 < a3)
            {
              unsigned int v17 = v14[2];
              if (*v14 < v17 || v17 >= *v14 && *(_DWORD *)(result + 8 * v7 + 4) < v14[3])
              {
                v14 += 2;
                uint64_t v7 = v16;
              }
            }
            unsigned int v18 = *v14;
            if (*v14 < v12 || v18 <= v12 && v14[1] < v13) {
              break;
            }
            unsigned int *v8 = v18;
            v8[1] = v14[1];
            uint64_t v8 = v14;
            if (v5 < v7) {
              goto LABEL_22;
            }
          }
        }
        unsigned int v14 = v8;
LABEL_22:
        unsigned int *v14 = v12;
        v14[1] = v13;
      }
    }
  }
  return result;
}

unsigned int *sub_1D3E2270C(unsigned int *result, uint64_t a2, uint64_t a3)
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
      if (*result < v10 || v10 >= *result && v6[2 * v7 + 1] < result[3])
      {
        result += 2;
        uint64_t v3 = v9;
      }
    }
    unsigned int *v6 = *result;
    v6[1] = result[1];
  }
  while (v3 <= v5);
  return result;
}

uint64_t sub_1D3E227A0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4 - 2;
  if (a4 >= 2)
  {
    unint64_t v5 = v4 >> 1;
    uint64_t v6 = (unsigned int *)(result + 8 * (v4 >> 1));
    unsigned int v7 = *v6;
    unsigned int v8 = *(_DWORD *)(a2 - 8);
    if (*v6 < v8 || v8 >= v7 && *(_DWORD *)(result + 8 * v5 + 4) < *(_DWORD *)(a2 - 4))
    {
      unsigned int v9 = *(_DWORD *)(a2 - 8);
      unsigned int v10 = *(_DWORD *)(a2 - 4);
      *(_DWORD *)(a2 - 8) = v7;
      *(_DWORD *)(a2 - 4) = v6[1];
      if (v4 >= 2)
      {
        while (1)
        {
          unint64_t v12 = v5 - 1;
          unint64_t v5 = (v5 - 1) >> 1;
          unsigned int v11 = (unsigned int *)(result + 8 * v5);
          unsigned int v13 = *v11;
          if (*v11 >= v9)
          {
            if (v13 > v9) {
              break;
            }
            unsigned int v14 = *(_DWORD *)(result + 8 * v5 + 4);
            if (v14 >= v10) {
              break;
            }
          }
          else
          {
            unsigned int v14 = v11[1];
          }
          unsigned int *v6 = v13;
          v6[1] = v14;
          uint64_t v6 = (unsigned int *)(result + 8 * v5);
          if (v12 <= 1) {
            goto LABEL_12;
          }
        }
      }
      unsigned int v11 = v6;
LABEL_12:
      *unsigned int v11 = v9;
      v11[1] = v10;
    }
  }
  return result;
}

uint64_t *sub_1D3E22848(uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    uint64_t v3 = *(std::__shared_weak_count **)(v2 + 32);
    if (v3) {
      sub_1D3E1D148(v3);
    }
    unint64_t v4 = *(std::__shared_weak_count **)(v2 + 16);
    if (v4) {
      std::__shared_weak_count::__release_weak(v4);
    }
    MEMORY[0x1D94412F0](v2, 0xA0C4079E112F9);
  }
  return a1;
}

uint64_t *sub_1D3E228A8(uint64_t *a1)
{
  unsigned int v7 = a1;
  uint64_t v2 = (std::__shared_weak_count *)a1[2];
  if (v2)
  {
    uint64_t v3 = *a1;
    unint64_t v4 = std::__shared_weak_count::lock(v2);
    if (v4)
    {
      unint64_t v5 = v4;
      if (a1[1]) {
        awd::AWDMetricBuffer::setConfiguration_sync(v3, (uint64_t)(a1 + 3));
      }
      sub_1D3E1D148(v5);
    }
  }
  return sub_1D3E22848((uint64_t *)&v7);
}

void sub_1D3E22918(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_1D3E1D148(v2);
  sub_1D3E22848((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t *sub_1D3E22934(uint64_t a1, unsigned int *a2)
{
  uint64_t v2 = (uint64_t *)(a1 + 8);
  uint64_t v3 = *(uint64_t **)(a1 + 8);
  if (!v3) {
    return v2;
  }
  unsigned int v4 = *a2;
  while (1)
  {
    unsigned int v5 = *((_DWORD *)v3 + 8);
    if (v4 >= v5) {
      break;
    }
    uint64_t v2 = v3;
LABEL_7:
    uint64_t v3 = (uint64_t *)*v3;
    if (!v3) {
      return v2;
    }
  }
  if (v5 < v4)
  {
    ++v3;
    goto LABEL_7;
  }
  unsigned int v7 = (uint64_t *)*v3;
  uint64_t result = v3;
  if (*v3)
  {
    uint64_t result = v3;
    do
    {
      unsigned int v8 = *((_DWORD *)v7 + 8);
      BOOL v9 = v8 >= v4;
      if (v8 >= v4) {
        unsigned int v10 = (uint64_t **)v7;
      }
      else {
        unsigned int v10 = (uint64_t **)(v7 + 1);
      }
      if (v9) {
        uint64_t result = v7;
      }
      unsigned int v7 = *v10;
    }
    while (*v10);
  }
  uint64_t v11 = v3[1];
  if (v11)
  {
    do
    {
      if (v4 >= *(_DWORD *)(v11 + 32)) {
        unint64_t v12 = (uint64_t *)(v11 + 8);
      }
      else {
        unint64_t v12 = (uint64_t *)v11;
      }
      uint64_t v11 = *v12;
    }
    while (*v12);
  }
  return result;
}

uint64_t *sub_1D3E229CC(uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    uint64_t v3 = *(std::__shared_weak_count **)(v2 + 8);
    if (v3) {
      std::__shared_weak_count::__release_weak(v3);
    }
    MEMORY[0x1D94412F0](v2, 0x1020C406C4767B9);
  }
  return a1;
}

uint64_t *sub_1D3E22A20(uint64_t a1)
{
  uint64_t v6 = a1;
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
  {
    uint64_t v3 = std::__shared_weak_count::lock(v2);
    if (v3)
    {
      unsigned int v4 = v3;
      if (*(void *)a1) {
        awd::AWDMetricSubmitter::doneWithMetrics(*(void **)a1, *(_DWORD *)(a1 + 16), *(void *)(a1 + 20), *(_DWORD *)(a1 + 28));
      }
      sub_1D3E1D148(v4);
    }
  }
  return sub_1D3E229CC(&v6);
}

void sub_1D3E22A88(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_1D3E1D148(v2);
  sub_1D3E229CC((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1D3E22AA4(uint64_t a1)
{
}

void sub_1D3E22ABC(uint64_t a1)
{
}

void awd::AWDServerFacade::create()
{
}

void sub_1D3E22C64(_Unwind_Exception *a1)
{
  MEMORY[0x1D94412F0](v1, 0xA0C405BD117BDLL);
  _Unwind_Resume(a1);
}

void sub_1D3E22C8C(uint64_t a1)
{
}

void awd::AWDServerFacade::initConnection_sync(awd::AWDServerFacade *this)
{
  xpc_object_t v2 = xpc_null_create();
  mach_service = xpc_connection_create_mach_service("com.apple.awdd", *((dispatch_queue_t *)this + 2), 2uLL);
  if (!mach_service) {
    mach_service = xpc_null_create();
  }
  xpc_object_t v4 = xpc_null_create();
  xpc_release(v2);
  xpc_release(v4);
  if (MEMORY[0x1D94419C0](mach_service) == MEMORY[0x1E4F14578])
  {
    xpc_object_t v11 = mach_service;
    if (mach_service) {
      xpc_retain(mach_service);
    }
    else {
      xpc_object_t v11 = xpc_null_create();
    }
    uint64_t v6 = *((void *)this + 2);
    dispatch_object_t object = v6;
    if (v6) {
      dispatch_retain(v6);
    }
    sub_1D3E248A0(buf, this);
    unsigned int v7 = v13;
    uint64_t v8 = *(void *)buf;
    BOOL v9 = v13;
    if (v13)
    {
      atomic_fetch_add_explicit(&v13->__shared_weak_owners_, 1uLL, memory_order_relaxed);
      sub_1D3E1D148(v7);
    }
    sub_1D3E23864((_xpc_connection_s **)this + 5, &v11, &object, &v8);
    if (v9) {
      std::__shared_weak_count::__release_weak(v9);
    }
    if (object) {
      dispatch_release(object);
    }
    xpc_release(v11);
    xpc_object_t v11 = 0;
  }
  else
  {
    unsigned int v5 = *((void *)this + 4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1D3E18000, v5, OS_LOG_TYPE_DEFAULT, "client:#E Failed to xpc create connection.", buf, 2u);
    }
  }
  xpc_release(mach_service);
}

void sub_1D3E22DF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10, dispatch_object_t object, xpc_object_t a12)
{
  if (a10) {
    std::__shared_weak_count::__release_weak(a10);
  }
  if (object) {
    dispatch_release(object);
  }
  xpc_release(a12);
  xpc_release(v12);
  _Unwind_Resume(a1);
}

uint64_t sub_1D3E22E70(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(result + 32) = *(void *)(a2 + 32);
  *(void *)(result + 40) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_1D3E22E8C(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 40);
  if (v1) {
    sub_1D3E1D148(v1);
  }
}

void *awd::AWDServerFacade::AWDServerFacade(void *a1, const void *a2, const void *a3, const void *a4, const void *a5, const void *a6, const void *a7)
{
  sub_1D3E22FBC(a1, "AWDServerFacade", QOS_CLASS_DEFAULT, "server");
  a1[5] = xpc_null_create();
  if (a2) {
    unsigned int v14 = _Block_copy(a2);
  }
  else {
    unsigned int v14 = 0;
  }
  a1[6] = v14;
  if (a3) {
    uint64_t v15 = _Block_copy(a3);
  }
  else {
    uint64_t v15 = 0;
  }
  a1[7] = v15;
  if (a4) {
    uint64_t v16 = _Block_copy(a4);
  }
  else {
    uint64_t v16 = 0;
  }
  a1[8] = v16;
  if (a5) {
    unsigned int v17 = _Block_copy(a5);
  }
  else {
    unsigned int v17 = 0;
  }
  a1[9] = v17;
  if (a6) {
    unsigned int v18 = _Block_copy(a6);
  }
  else {
    unsigned int v18 = 0;
  }
  a1[10] = v18;
  if (a7) {
    unsigned int v19 = _Block_copy(a7);
  }
  else {
    unsigned int v19 = 0;
  }
  a1[11] = v19;
  return a1;
}

void *sub_1D3E22FBC(void *a1, const char *a2, dispatch_qos_class_t a3, const char *a4)
{
  dispatch_object_t object = 0;
  sub_1D3E24930(a1, a2, a3, &object);
  if (object) {
    dispatch_release(object);
  }
  ctu::OsLogLogger::OsLogLogger((ctu::OsLogLogger *)(a1 + 4), "com.apple.awd.framework", a4);
  return a1;
}

void sub_1D3E2301C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, dispatch_object_t object)
{
  sub_1D3E1CFA4(v10);
  _Unwind_Resume(a1);
}

void awd::AWDServerFacade::~AWDServerFacade(awd::AWDServerFacade *this)
{
  uint64_t v2 = (const void *)*((void *)this + 11);
  if (v2) {
    _Block_release(v2);
  }
  uint64_t v3 = (const void *)*((void *)this + 10);
  if (v3) {
    _Block_release(v3);
  }
  xpc_object_t v4 = (const void *)*((void *)this + 9);
  if (v4) {
    _Block_release(v4);
  }
  unsigned int v5 = (const void *)*((void *)this + 8);
  if (v5) {
    _Block_release(v5);
  }
  uint64_t v6 = (const void *)*((void *)this + 7);
  if (v6) {
    _Block_release(v6);
  }
  unsigned int v7 = (const void *)*((void *)this + 6);
  if (v7) {
    _Block_release(v7);
  }
  MEMORY[0x1D9440FD0]((char *)this + 40);
  MEMORY[0x1D9440F90]((char *)this + 32);
  sub_1D3E1CFA4(this);
}

uint64_t awd::AWDServerFacade::handleServerError(uint64_t result, void *a2)
{
  if (*a2 == MEMORY[0x1E4F14528] && MEMORY[0x1E4F14520] != MEMORY[0x1E4F14528])
  {
    uint64_t v3 = *(NSObject **)(result + 32);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)xpc_object_t v4 = 0;
      _os_log_impl(&dword_1D3E18000, v3, OS_LOG_TYPE_DEFAULT, "client:#E XPC Connection invalidated; possibly a sandbox block?",
        v4,
        2u);
    }
    return ctu::XpcClientHelper::setServer();
  }
  return result;
}

void awd::AWDServerFacade::handleMessage(void *a1, uint64_t a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  xpc_object_t v4 = a1[4];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(void *)long long buf = a2;
    uint64_t v32 = "AWDMessageType";
    sub_1D3E1D854((uint64_t)buf, &v22);
    int v21 = xpc::dyn_cast_or_default();
    LODWORD(object) = 67109120;
    HIDWORD(object) = v21;
    _os_log_debug_impl(&dword_1D3E18000, v4, OS_LOG_TYPE_DEBUG, "client:#D libawd got message of type %d", (uint8_t *)&object, 8u);
    xpc_release(v22);
  }
  fflush((FILE *)*MEMORY[0x1E4F143D8]);
  *(void *)long long buf = a2;
  uint64_t v32 = "AWDMessageType";
  sub_1D3E1D854((uint64_t)buf, &object);
  int v5 = xpc::dyn_cast_or_default();
  xpc_release(object);
  sub_1D3E37A98(&v22);
  switch(v5)
  {
    case 0:
      uint64_t v6 = a1[4];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1D3E18000, v6, OS_LOG_TYPE_DEFAULT, "client:#E Got an unkown message from AWDD!", buf, 2u);
      }
      break;
    case 4:
      awd::AWDSetComponentConfigurationMessage::AWDSetComponentConfigurationMessage(buf, a2);
      awd::AWDSetComponentConfigurationMessage::getComponentId((awd::AWDSetComponentConfigurationMessage *)buf);
      awd::AWDSetComponentConfigurationMessage::getDeviceConfigurationId((awd::AWDSetComponentConfigurationMessage *)buf);
      awd::AWDSetComponentConfigurationMessage::getComponentConfiguration((uint64_t)buf, &object);
      operator new();
    case 6:
      awd::AWDTriggerMessage::AWDTriggerMessage(buf, a2);
      int ComponentId = awd::AWDTriggerMessage::getComponentId((awd::AWDTriggerMessage *)buf);
      uint64_t Trigger = awd::AWDTriggerMessage::getTrigger((awd::AWDTriggerMessage *)buf);
      int v10 = v9;
      xpc_object_t v11 = a1[4];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        xpc_object_t object = (xpc_object_t)__PAIR64__(Trigger, 67109888);
        __int16 v25 = 1024;
        int v26 = HIDWORD(Trigger);
        __int16 v27 = 1024;
        int v28 = v10;
        __int16 v29 = 1024;
        int v30 = ComponentId;
        _os_log_impl(&dword_1D3E18000, v11, OS_LOG_TYPE_INFO, "client:#I Sending Trigger(cid=0x%x, trid=0x%x, sid=%u) to component: 0x%x", (uint8_t *)&object, 0x1Au);
      }
      (*(void (**)(void))(a1[7] + 16))();
      break;
    case 7:
      awd::AWDControlMessage::AWDControlMessage(buf, a2);
      int ControlMessageType = awd::AWDControlMessage::getControlMessageType((awd::AWDControlMessage *)buf);
      unsigned int v13 = a1[4];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        LODWORD(object) = 67109120;
        HIDWORD(object) = ControlMessageType;
        _os_log_impl(&dword_1D3E18000, v13, OS_LOG_TYPE_INFO, "client:#I Got control message of type %d", (uint8_t *)&object, 8u);
      }
      if (ControlMessageType == 4) {
        (*(void (**)(void))(a1[8] + 16))();
      }
      break;
    case 8:
      awd::AWDPIILocationMessage::AWDPIILocationMessage(&object, a2);
      int v14 = awd::AWDPIILocationMessage::getComponentId((awd::AWDPIILocationMessage *)&object);
      int CollectPII = awd::AWDPIILocationMessage::getCollectPII((awd::AWDPIILocationMessage *)&object);
      int CollectLocation = awd::AWDPIILocationMessage::getCollectLocation((awd::AWDPIILocationMessage *)&object);
      int AnalyticsShimMode = awd::AWDPIILocationMessage::getAnalyticsShimMode((awd::AWDPIILocationMessage *)&object);
      unsigned int v18 = a1[4];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 67109888;
        *(_DWORD *)&uint8_t buf[4] = v14;
        LOWORD(v32) = 1024;
        *(_DWORD *)((char *)&v32 + 2) = CollectPII;
        HIWORD(v32) = 1024;
        int v33 = CollectLocation;
        __int16 v34 = 1024;
        int v35 = AnalyticsShimMode;
        _os_log_impl(&dword_1D3E18000, v18, OS_LOG_TYPE_INFO, "client:#I In switch branch for pii/location message msg. cid=0x%x collectPII is %d, collectLocation is %d, shim is %d", buf, 0x1Au);
      }
      (*(void (**)(void))(a1[9] + 16))();
      break;
    case 13:
      awd::AWDTimerMessage::AWDTimerMessage(buf, a2);
      unsigned int v19 = a1[4];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        int TimerId = awd::AWDTimerMessage::getTimerId((awd::AWDTimerMessage *)buf);
        LODWORD(object) = 67109120;
        HIDWORD(object) = TimerId;
        _os_log_impl(&dword_1D3E18000, v19, OS_LOG_TYPE_INFO, "client:#I Received Timer(tid=0x%x) notification message", (uint8_t *)&object, 8u);
      }
      awd::AWDTimerMessage::getTimerId((awd::AWDTimerMessage *)buf);
      (*(void (**)(void))(a1[11] + 16))();
      break;
    default:
      break;
  }
  if (v23) {
    sub_1D3E1D148(v23);
  }
}

void sub_1D3E236C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, xpc_object_t object, uint64_t a14, xpc_object_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  if (a2) {
    sub_1D3E1AE78(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_1D3E237E8(uint64_t *a1, unsigned int *a2, unsigned int *a3, uint64_t *a4)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *a2;
  uint64_t v6 = *a3;
  unsigned int v7 = (std::__shared_weak_count *)a4[1];
  uint64_t v8 = *a4;
  int v9 = v7;
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t *))(v4 + 16))(v4, v5, v6, &v8);
  if (v9) {
    sub_1D3E1D148(v9);
  }
}

void sub_1D3E2384C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_1D3E1D148(a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_1D3E23864(_xpc_connection_s **a1, xpc_object_t *a2, dispatch_queue_t *a3, uint64_t *a4)
{
  xpc_object_t v13 = *a2;
  if (v13) {
    xpc_retain(v13);
  }
  else {
    xpc_object_t v13 = xpc_null_create();
  }
  ctu::XpcClientHelper::setServer_internal();
  xpc_release(v13);
  xpc_object_t v13 = 0;
  if (MEMORY[0x1D94419C0](*a1) == MEMORY[0x1E4F14578])
  {
    unsigned int v7 = *a1;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 1174405120;
    handler[2] = sub_1D3E24B28;
    handler[3] = &unk_1F2B9BD48;
    uint64_t v9 = *a4;
    uint64_t v8 = (std::__shared_weak_count *)a4[1];
    handler[4] = a1;
    handler[5] = v9;
    xpc_object_t v11 = v8;
    if (v8) {
      atomic_fetch_add_explicit(&v8->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    }
    unint64_t v12 = v7;
    xpc_connection_set_event_handler(v7, handler);
    xpc_connection_set_target_queue(v7, *a3);
    xpc_connection_resume(v7);
    if (v11) {
      std::__shared_weak_count::__release_weak(v11);
    }
  }
}

void sub_1D3E2397C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    std::__shared_weak_count::__release_weak(a16);
  }
  _Unwind_Resume(exception_object);
}

BOOL awd::AWDServerFacade::register_sync(awd::AWDServerFacade *this, int a2, int a3, int a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (MEMORY[0x1D94419C0](*((void *)this + 5)) == MEMORY[0x1E4F14578])
  {
    pid_t v10 = getpid();
    awd::AWDRegistrationMessage::AWDRegistrationMessage((uint64_t)buf, a2, a3, v10, a4);
    awd::AWDRegistrationMessage::createXpcMessage((awd::AWDRegistrationMessage *)buf, &message);
    uint64_t v11 = MEMORY[0x1D94419C0](message);
    BOOL v9 = v11 == MEMORY[0x1E4F14590];
    if (v11 == MEMORY[0x1E4F14590])
    {
      unint64_t v12 = *((void *)this + 4);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)uint64_t v15 = 67109632;
        int v16 = a2;
        __int16 v17 = 1024;
        int v18 = a3;
        __int16 v19 = 1024;
        int v20 = a4;
        _os_log_impl(&dword_1D3E18000, v12, OS_LOG_TYPE_INFO, "client:#I Sending message to register with dcid %d, component 0x%x, needsconfig: %d", v15, 0x14u);
      }
      xpc_connection_send_message(*((xpc_connection_t *)this + 5), message);
    }
    xpc_release(message);
  }
  else
  {
    uint64_t v8 = *((void *)this + 4);
    BOOL v9 = 0;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109120;
      int v22 = a3;
      _os_log_impl(&dword_1D3E18000, v8, OS_LOG_TYPE_DEFAULT, "client:#E xpc conenction NULL while registering as component 0x%x", buf, 8u);
      return 0;
    }
  }
  return v9;
}

void sub_1D3E23B48(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  if (a2) {
    sub_1D3E1AE78(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t awd::AWDServerFacade::registerAs(awd::AWDServerFacade *this, int a2, int a3, char a4)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 0x40000000;
  v7[2] = sub_1D3E23C8C;
  v7[3] = &unk_1E69CA4F0;
  v7[4] = this;
  int v8 = a2;
  int v9 = a3;
  char v10 = a4;
  sub_1D3E248A0(&v13, this);
  uint64_t v5 = *((void *)this + 2);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 1174405120;
  block[2] = sub_1D3E24864;
  block[3] = &unk_1F2B9BCE8;
  void block[5] = v13;
  unint64_t v12 = v14;
  if (v14) {
    atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  void block[4] = v7;
  dispatch_async(v5, block);
  if (v12) {
    sub_1D3E1D148(v12);
  }
  if (v14) {
    sub_1D3E1D148(v14);
  }
  return 1;
}

BOOL sub_1D3E23C8C(uint64_t a1)
{
  return awd::AWDServerFacade::register_sync(*(awd::AWDServerFacade **)(a1 + 32), *(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 44), *(unsigned __int8 *)(a1 + 48));
}

void awd::AWDServerFacade::tryInitialize(awd::AWDServerFacade *this)
{
  sub_1D3E248A0(&v1, this);
  operator new();
}

void awd::AWDServerFacade::sendMessage(void *a1, xpc_object_t *a2)
{
  if (*a2) {
    xpc_retain(*a2);
  }
  else {
    xpc_null_create();
  }
  sub_1D3E248A0(&v3, a1);
  operator new();
}

void awd::AWDServerFacade::flush(void *a1, NSObject **a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 1174405120;
  v5[2] = sub_1D3E23FC8;
  void v5[3] = &unk_1F2B9C028;
  uint64_t v3 = *a2;
  v5[4] = a1;
  dispatch_group_t group = v3;
  if (v3)
  {
    dispatch_retain(v3);
    dispatch_group_enter(group);
  }
  sub_1D3E248A0(&v9, a1);
  uint64_t v4 = a1[2];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 1174405120;
  block[2] = sub_1D3E24864;
  block[3] = &unk_1F2B9BCE8;
  void block[5] = v9;
  int v8 = v10;
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  void block[4] = v5;
  dispatch_async(v4, block);
  if (v8) {
    sub_1D3E1D148(v8);
  }
  if (v10) {
    sub_1D3E1D148(v10);
  }
  if (group)
  {
    dispatch_group_leave(group);
    if (group) {
      dispatch_release(group);
    }
  }
}

void sub_1D3E23FC8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (MEMORY[0x1D94419C0](*(void *)(v2 + 40)) == MEMORY[0x1E4F14578])
  {
    uint64_t v3 = *(_xpc_connection_s **)(v2 + 40);
    barrier[0] = MEMORY[0x1E4F143A8];
    barrier[1] = 1174405120;
    barrier[2] = nullsub_4;
    barrier[3] = &unk_1F2B9BFC8;
    uint64_t v4 = *(NSObject **)(a1 + 40);
    dispatch_group_t group = v4;
    if (v4)
    {
      dispatch_retain(v4);
      dispatch_group_enter(group);
    }
    xpc_connection_send_barrier(v3, barrier);
    if (group)
    {
      dispatch_group_leave(group);
      if (group) {
        dispatch_release(group);
      }
    }
  }
}

void sub_1D3E24098(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, dispatch_group_t group)
{
  if (group)
  {
    dispatch_group_leave(group);
    dispatch_release(group);
  }
  _Unwind_Resume(exception_object);
}

void sub_1D3E240C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(NSObject **)(a2 + 32);
  *(void *)(a1 + 32) = v3;
  if (v3)
  {
    dispatch_retain(v3);
    uint64_t v4 = *(NSObject **)(a1 + 32);
    if (v4)
    {
      dispatch_group_enter(v4);
    }
  }
}

void sub_1D3E24114(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 32);
  if (v2)
  {
    dispatch_group_leave(v2);
    uint64_t v3 = *(NSObject **)(a1 + 32);
    if (v3)
    {
      dispatch_release(v3);
    }
  }
}

void sub_1D3E24164(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(NSObject **)(a2 + 40);
  *(void *)(a1 + 40) = v3;
  if (v3)
  {
    dispatch_retain(v3);
    uint64_t v4 = *(NSObject **)(a1 + 40);
    if (v4)
    {
      dispatch_group_enter(v4);
    }
  }
}

void sub_1D3E241B8(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 40);
  if (v2)
  {
    dispatch_group_leave(v2);
    uint64_t v3 = *(NSObject **)(a1 + 40);
    if (v3)
    {
      dispatch_release(v3);
    }
  }
}

void awd::AWDServerFacade::getMetadata(awd::AWDServerFacade *this, unsigned int a2, BOOL a3)
{
  if (MEMORY[0x1D94419C0](*((void *)this + 5)) != MEMORY[0x1E4F14578])
  {
    uint64_t v6 = *((void *)this + 4);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1D3E18000, v6, OS_LOG_TYPE_DEFAULT, "client:#E CoreAnalytics shim: Error! getMetadataBase: XpcConnection is NULL", buf, 2u);
    }
    return;
  }
  xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v8 = v7;
  if (v7)
  {
    xpc_object_t v22 = v7;
  }
  else
  {
    xpc_object_t v8 = xpc_null_create();
    xpc_object_t v22 = v8;
    if (!v8)
    {
      xpc_object_t v9 = xpc_null_create();
      xpc_object_t v8 = 0;
      goto LABEL_11;
    }
  }
  if (MEMORY[0x1D94419C0](v8) != MEMORY[0x1E4F14590])
  {
    xpc_object_t v9 = xpc_null_create();
LABEL_11:
    xpc_object_t v22 = v9;
    goto LABEL_12;
  }
  xpc_retain(v8);
LABEL_12:
  xpc_release(v8);
  xpc_object_t v20 = xpc_int64_create(12);
  if (!v20) {
    xpc_object_t v20 = xpc_null_create();
  }
  *(void *)long long buf = &v22;
  __int16 v19 = "AWDMessageType";
  sub_1D3E1DB1C((uint64_t)buf, &v20, &v21);
  xpc_release(v21);
  xpc_object_t v21 = 0;
  xpc_release(v20);
  xpc_object_t v20 = 0;
  xpc_object_t v16 = xpc_BOOL_create(a3);
  if (!v16) {
    xpc_object_t v16 = xpc_null_create();
  }
  *(void *)long long buf = &v22;
  __int16 v19 = "needs_base";
  sub_1D3E1DB1C((uint64_t)buf, &v16, &object);
  xpc_release(object);
  xpc_object_t object = 0;
  xpc_release(v16);
  xpc_object_t v16 = 0;
  xpc_object_t v14 = xpc_int64_create(a2);
  if (!v14) {
    xpc_object_t v14 = xpc_null_create();
  }
  *(void *)long long buf = &v22;
  __int16 v19 = "cid";
  sub_1D3E1DB1C((uint64_t)buf, &v14, &v15);
  xpc_release(v15);
  xpc_object_t v15 = 0;
  xpc_release(v14);
  xpc_object_t v14 = 0;
  char v10 = (_xpc_connection_s *)*((void *)this + 5);
  uint64_t v11 = *((void *)this + 2);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 0x40000000;
  v12[2] = sub_1D3E244C8;
  v12[3] = &unk_1E69CA5B8;
  v12[4] = this;
  unsigned int v13 = a2;
  xpc_connection_send_message_with_reply(v10, v22, v11, v12);
  xpc_release(v22);
}

void sub_1D3E24480(_Unwind_Exception *a1)
{
  xpc_release(*(xpc_object_t *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1D3E244C8(uint64_t a1, xpc_object_t object)
{
  uint64_t v3 = *(void *)(a1 + 32);
  xpc_object_t objecta = object;
  if (object) {
    xpc_retain(object);
  }
  else {
    xpc_object_t objecta = xpc_null_create();
  }
  sub_1D3E24548((uint64_t *)(v3 + 80), &objecta, (unsigned int *)(a1 + 40));
  xpc_release(objecta);
}

void sub_1D3E2452C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
}

void sub_1D3E24548(uint64_t *a1, void **a2, unsigned int *a3)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *a2;
  xpc_object_t object = v5;
  if (v5 && MEMORY[0x1D94419C0](v5) == MEMORY[0x1E4F14590]) {
    xpc_retain(v5);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  (*(void (**)(uint64_t, xpc_object_t *, void))(v4 + 16))(v4, &object, *a3);
  xpc_release(object);
}

void sub_1D3E245E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
}

void sub_1D3E245FC(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_1D3E24674(void *a1)
{
  __cxa_begin_catch(a1);
  dispatch_barrier_async_f(v1[2], v1, (dispatch_function_t)sub_1D3E24824);
  __cxa_rethrow();
}

void sub_1D3E2469C(_Unwind_Exception *a1)
{
}

void sub_1D3E246B0(uint64_t a1, void *a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t v4 = (std::__shared_weak_count *)a2[1];
    if (!v4 || v4->__shared_owners_ == -1)
    {
      uint64_t v5 = *(std::__shared_weak_count **)(a1 + 8);
      if (v5)
      {
        atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
        atomic_fetch_add_explicit(&v5->__shared_weak_owners_, 1uLL, memory_order_relaxed);
        uint64_t v4 = (std::__shared_weak_count *)a2[1];
      }
      *a2 = a3;
      a2[1] = v5;
      if (v4) {
        std::__shared_weak_count::__release_weak(v4);
      }
      if (v5)
      {
        sub_1D3E1D148(v5);
      }
    }
  }
}

void sub_1D3E2473C(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1D94412F0);
}

void sub_1D3E24774(uint64_t a1)
{
}

uint64_t sub_1D3E24790(uint64_t a1, uint64_t a2)
{
  if (sub_1D3E247D4(a2, (uint64_t)&unk_1F2B9AAB8)) {
    return a1 + 24;
  }
  else {
    return 0;
  }
}

BOOL sub_1D3E247D4(uint64_t a1, uint64_t a2)
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

awd::AWDServerFacade *sub_1D3E24824(awd::AWDServerFacade *result)
{
  if (result)
  {
    awd::AWDServerFacade::~AWDServerFacade(result);
    JUMPOUT(0x1D94412F0);
  }
  return result;
}

uint64_t sub_1D3E24864(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1D3E24874(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_1D3E24890(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    sub_1D3E1D148(v1);
  }
}

void *sub_1D3E248A0(void *a1, void *a2)
{
  uint64_t v3 = (std::__shared_weak_count *)a2[1];
  *a1 = *a2;
  if (!v3)
  {
    a1[1] = 0;
LABEL_5:
    sub_1D3E248E4();
  }
  uint64_t v4 = std::__shared_weak_count::lock(v3);
  a1[1] = v4;
  if (!v4) {
    goto LABEL_5;
  }
  return a1;
}

void sub_1D3E248E4()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = MEMORY[0x1E4FBA438] + 16;
  __cxa_throw(exception, MEMORY[0x1E4FBA2E0], MEMORY[0x1E4FBA208]);
}

void *sub_1D3E24930(void *a1, const char *a2, dispatch_qos_class_t qos_class, NSObject **a4)
{
  xpc_object_t v7 = dispatch_queue_attr_make_with_qos_class(0, qos_class, 0);
  xpc_object_t v8 = *a4;
  if (v8)
  {
    dispatch_retain(v8);
    dispatch_retain(v8);
    xpc_object_t v9 = dispatch_queue_create_with_target_V2(a2, v7, v8);
  }
  else
  {
    xpc_object_t v9 = dispatch_queue_create(a2, v7);
  }
  char v10 = v9;
  *a1 = 0;
  a1[1] = 0;
  a1[2] = v9;
  if (v9) {
    dispatch_retain(v9);
  }
  a1[3] = v8;
  if (v8) {
    dispatch_retain(v8);
  }
  if (v10) {
    dispatch_release(v10);
  }
  if (v8)
  {
    dispatch_release(v8);
    dispatch_release(v8);
  }
  return a1;
}

void sub_1D3E249F8(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_1D3E24A60(_Unwind_Exception *exception_object)
{
  if (v1) {
    sub_1D3E4DEDC(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_1D3E24A7C(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1D94412F0);
}

uint64_t sub_1D3E24AB4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t sub_1D3E24AE4(uint64_t a1, uint64_t a2)
{
  if (sub_1D3E247D4(a2, (uint64_t)&unk_1F2B9A910)) {
    return a1 + 24;
  }
  else {
    return 0;
  }
}

void sub_1D3E24B28(void *a1, xpc_object_t a2)
{
  uint64_t v3 = (std::__shared_weak_count *)a1[6];
  if (v3)
  {
    uint64_t v5 = (void *)a1[4];
    uint64_t v6 = std::__shared_weak_count::lock(v3);
    if (v6)
    {
      xpc_object_t v7 = v6;
      xpc_object_t v8 = (void *)a1[5];
      if (!v8)
      {
LABEL_18:
        sub_1D3E1D148(v7);
        return;
      }
      uint64_t v9 = MEMORY[0x1D94419C0](a2);
      uint64_t v10 = MEMORY[0x1E4F14590];
      if (v9 != MEMORY[0x1E4F14590])
      {
        if (v9 == MEMORY[0x1E4F145A8] && *v5 == a1[7])
        {
          xpc_object_t v12 = a2;
          if (a2)
          {
            xpc_retain(a2);
          }
          else
          {
            a2 = xpc_null_create();
            xpc_object_t v12 = a2;
          }
          awd::AWDServerFacade::handleServerError((uint64_t)v8, &v12);
          xpc_release(a2);
        }
        goto LABEL_18;
      }
      if (a2)
      {
        xpc_retain(a2);
        xpc_object_t object = a2;
      }
      else
      {
        a2 = xpc_null_create();
        xpc_object_t object = a2;
        if (!a2)
        {
          xpc_object_t v11 = xpc_null_create();
          a2 = 0;
          goto LABEL_16;
        }
      }
      if (MEMORY[0x1D94419C0](a2) == v10)
      {
        xpc_retain(a2);
LABEL_17:
        awd::AWDServerFacade::handleMessage(v8, (uint64_t)&object);
        xpc_release(object);
        xpc_object_t object = 0;
        xpc_release(a2);
        goto LABEL_18;
      }
      xpc_object_t v11 = xpc_null_create();
LABEL_16:
      xpc_object_t object = v11;
      goto LABEL_17;
    }
  }
}

void sub_1D3E24C74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(v11);
  sub_1D3E1D148(v10);
  _Unwind_Resume(a1);
}

uint64_t sub_1D3E24CD4(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_1D3E24CF0(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

uint64_t *sub_1D3E24D00(uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    uint64_t v3 = *(std::__shared_weak_count **)(v2 + 16);
    if (v3) {
      sub_1D3E1D148(v3);
    }
    MEMORY[0x1D94412F0](v2, 0x60C40A44E5E0CLL);
  }
  return a1;
}

uint64_t *sub_1D3E24D54(awd::AWDServerFacade ***a1)
{
  uint64_t v3 = a1;
  uint64_t v1 = *a1;
  awd::AWDServerFacade::initConnection_sync(**a1);
  MEMORY[0x1D94412F0](v1, 0x20C4093837F09);
  return sub_1D3E24D00((uint64_t *)&v3);
}

void sub_1D3E24DA8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  MEMORY[0x1D94412F0](v2, 0x20C4093837F09);
  sub_1D3E24D00((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t *sub_1D3E24DD4(xpc_object_t **a1)
{
  uint64_t v1 = *a1;
  uint64_t v5 = a1;
  uint64_t v6 = v1;
  xpc_object_t v2 = *v1;
  if (MEMORY[0x1D94419C0](*((void *)*v1 + 5)) == MEMORY[0x1E4F14578])
  {
    xpc_connection_send_message(*((xpc_connection_t *)v2 + 5), v1[1]);
  }
  else
  {
    uint64_t v3 = *((void *)v2 + 4);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1D3E18000, v3, OS_LOG_TYPE_DEFAULT, "client:#E Error! sendMessage: XpcConnection is NULL", buf, 2u);
    }
  }
  sub_1D3E24E94((uint64_t *)&v6);
  return sub_1D3E24D00((uint64_t *)&v5);
}

void sub_1D3E24E78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

uint64_t *sub_1D3E24E94(uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    xpc_release(*(xpc_object_t *)(v2 + 8));
    *(void *)(v2 + 8) = 0;
    MEMORY[0x1D94412F0](v2, 0xE0C402B90B96ALL);
  }
  return a1;
}

__n128 awd::AWDSetComponentConfigurationMessage::AWDSetComponentConfigurationMessage(__n128 *a1, unsigned __int32 a2, unsigned __int32 a3, __n128 *a4)
{
  a1->n128_u64[0] = (unint64_t)&unk_1F2B9AE60;
  a1->n128_u32[2] = a2;
  a1->n128_u32[3] = a3;
  __n128 result = *a4;
  a1[1] = *a4;
  a4->n128_u64[0] = 0;
  a4->n128_u64[1] = 0;
  return result;
}

{
  __n128 result;

  a1->n128_u64[0] = (unint64_t)&unk_1F2B9AE60;
  a1->n128_u32[2] = a2;
  a1->n128_u32[3] = a3;
  __n128 result = *a4;
  a1[1] = *a4;
  a4->n128_u64[0] = 0;
  a4->n128_u64[1] = 0;
  return result;
}

void awd::AWDSetComponentConfigurationMessage::AWDSetComponentConfigurationMessage(void *a1)
{
  *a1 = &unk_1F2B9AE60;
  a1[1] = 0;
  operator new();
}

void sub_1D3E25078(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object)
{
  xpc_release(object);
  xpc_object_t v14 = *(std::__shared_weak_count **)(v12 + 24);
  if (v14) {
    sub_1D3E1D148(v14);
  }
  _Unwind_Resume(a1);
}

void awd::AWDSetComponentConfigurationMessage::~AWDSetComponentConfigurationMessage(awd::AWDSetComponentConfigurationMessage *this)
{
  *(void *)this = &unk_1F2B9AE60;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 3);
  if (v1) {
    sub_1D3E1D148(v1);
  }
}

{
  std::__shared_weak_count *v1;

  *(void *)this = &unk_1F2B9AE60;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 3);
  if (v1) {
    sub_1D3E1D148(v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_1F2B9AE60;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 3);
  if (v1) {
    sub_1D3E1D148(v1);
  }
  JUMPOUT(0x1D94412F0);
}

uint64_t awd::AWDSetComponentConfigurationMessage::getComponentId(awd::AWDSetComponentConfigurationMessage *this)
{
  return *((unsigned int *)this + 3);
}

uint64_t awd::AWDSetComponentConfigurationMessage::getDeviceConfigurationId(awd::AWDSetComponentConfigurationMessage *this)
{
  return *((unsigned int *)this + 2);
}

uint64_t awd::AWDSetComponentConfigurationMessage::getComponentConfiguration@<X0>(uint64_t this@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *(void *)(this + 24);
  *a2 = *(void *)(this + 16);
  a2[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return this;
}

void awd::AWDSetComponentConfigurationMessage::createXpcMessage(awd::AWDSetComponentConfigurationMessage *this@<X0>, void *a2@<X8>)
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v5 = v4;
  if (v4)
  {
    *a2 = v4;
  }
  else
  {
    xpc_object_t v5 = xpc_null_create();
    *a2 = v5;
    if (!v5)
    {
      xpc_object_t v6 = xpc_null_create();
      xpc_object_t v5 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x1D94419C0](v5) == MEMORY[0x1E4F14590])
  {
    xpc_retain(v5);
    goto LABEL_9;
  }
  xpc_object_t v6 = xpc_null_create();
LABEL_8:
  *a2 = v6;
LABEL_9:
  xpc_release(v5);
  xpc_object_t v16 = xpc_int64_create(4);
  if (!v16) {
    xpc_object_t v16 = xpc_null_create();
  }
  xpc_object_t v14 = a2;
  xpc_object_t v15 = "AWDMessageType";
  sub_1D3E1DB1C((uint64_t)&v14, &v16, &v17);
  xpc_release(v17);
  xpc_object_t v17 = 0;
  xpc_release(v16);
  xpc_object_t v16 = 0;
  xpc_object_t v12 = xpc_int64_create(*((unsigned int *)this + 3));
  if (!v12) {
    xpc_object_t v12 = xpc_null_create();
  }
  xpc_object_t v14 = a2;
  xpc_object_t v15 = "AWDMessageComponentId";
  sub_1D3E1DB1C((uint64_t)&v14, &v12, &object);
  xpc_release(object);
  xpc_object_t object = 0;
  xpc_release(v12);
  xpc_object_t v12 = 0;
  xpc_object_t v10 = xpc_int64_create(*((unsigned int *)this + 2));
  if (!v10) {
    xpc_object_t v10 = xpc_null_create();
  }
  xpc_object_t v14 = a2;
  xpc_object_t v15 = "AWDMessageDeviceConfigurationId";
  sub_1D3E1DB1C((uint64_t)&v14, &v10, &v11);
  xpc_release(v11);
  xpc_object_t v11 = 0;
  xpc_release(v10);
  xpc_object_t v10 = 0;
  uint64_t v7 = *((void *)this + 2);
  if (v7)
  {
    xpc_object_t v8 = xpc_data_create(*(const void **)v7, *(void *)(v7 + 8) - *(void *)v7);
    if (!v8) {
      xpc_object_t v8 = xpc_null_create();
    }
    xpc_object_t v14 = a2;
    xpc_object_t v15 = "AWDMessageComponentConfigurationBuffer";
    sub_1D3E1DB1C((uint64_t)&v14, &v8, &v9);
    xpc_release(v9);
    xpc_object_t v9 = 0;
    xpc_release(v8);
  }
}

void sub_1D3E2540C(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_1D3E2547C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  a10 = 0;
  if (v10) {
    sub_1D3E25524((uint64_t)&a10, v10);
  }
  _Unwind_Resume(exception_object);
}

void sub_1D3E254A0(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1D94412F0);
}

void sub_1D3E254D8(uint64_t a1)
{
}

uint64_t sub_1D3E254E0(uint64_t a1, uint64_t a2)
{
  if (sub_1D3E247D4(a2, (uint64_t)&unk_1F2B9A928)) {
    return a1 + 24;
  }
  else {
    return 0;
  }
}

void sub_1D3E25524(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = *(void **)a2;
    if (*(void *)a2)
    {
      *(void *)(a2 + 8) = v2;
      operator delete(v2);
    }
    JUMPOUT(0x1D94412F0);
  }
}

void *sub_1D3E25580(void *result, char *__src, char *a3, unint64_t a4)
{
  uint64_t v7 = result;
  unint64_t v8 = result[2];
  xpc_object_t v9 = (char *)*result;
  if (v8 - *result < a4)
  {
    if (v9)
    {
      result[1] = v9;
      operator delete(v9);
      unint64_t v8 = 0;
      *uint64_t v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if ((a4 & 0x8000000000000000) != 0) {
      sub_1D3E1AE60();
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
    __n128 result = sub_1D3E1F29C(v7, v11);
    xpc_object_t v9 = (char *)v7[1];
    goto LABEL_17;
  }
  xpc_object_t v12 = (unsigned char *)result[1];
  size_t v13 = v12 - v9;
  if (v12 - v9 >= a4)
  {
LABEL_17:
    size_t v16 = a3 - __src;
    if (v16) {
      __n128 result = memmove(v9, __src, v16);
    }
    xpc_object_t v15 = &v9[v16];
    goto LABEL_20;
  }
  xpc_object_t v14 = &__src[v13];
  if (v12 != v9)
  {
    __n128 result = memmove((void *)*result, __src, v13);
    xpc_object_t v9 = (char *)v7[1];
  }
  if (a3 != v14) {
    __n128 result = memmove(v9, v14, a3 - v14);
  }
  xpc_object_t v15 = &v9[a3 - v14];
LABEL_20:
  v7[1] = v15;
  return result;
}

uint64_t awd::createAwdMetadataLoaderForXpcConversion(awd *this)
{
  return MEMORY[0x1F4178770](this);
}

uint64_t awd::convertMetricToXpc()
{
  return MEMORY[0x1F4178768]();
}

uint64_t awd::MetricBuffer::MetricBuffer(uint64_t this)
{
  *(_DWORD *)this = 0;
  *(void *)(this + 8) = 0;
  *(void *)(this + 32) = 0;
  *(void *)(this + 40) = 0;
  *(void *)(this + 24) = 0;
  return this;
}

{
  *(_DWORD *)this = 0;
  *(void *)(this + 8) = 0;
  *(void *)(this + 32) = 0;
  *(void *)(this + 40) = 0;
  *(void *)(this + 24) = 0;
  return this;
}

uint64_t awd::MetricBuffer::MetricBuffer(uint64_t result, int a2, uint64_t a3)
{
  *(_DWORD *)__n128 result = a2;
  *(void *)(result + 8) = a3;
  *(void *)(result + 32) = 0;
  *(void *)(result + 40) = 0;
  *(void *)(result + 24) = 0;
  return result;
}

{
  *(_DWORD *)__n128 result = a2;
  *(void *)(result + 8) = a3;
  *(void *)(result + 32) = 0;
  *(void *)(result + 40) = 0;
  *(void *)(result + 24) = 0;
  return result;
}

void awd::MetricBuffer::~MetricBuffer(awd::MetricBuffer *this)
{
  uint64_t v1 = (void **)((char *)this + 24);
  sub_1D3E25F08(&v1);
}

{
  void **v1;

  uint64_t v1 = (void **)((char *)this + 24);
  sub_1D3E25F08(&v1);
}

_DWORD *awd::MetricBuffer::setMaxCount(_DWORD *this, int a2)
{
  *this = a2;
  return this;
}

uint64_t awd::MetricBuffer::setMaxTimeInSeconds(uint64_t result, uint64_t a2)
{
  *(void *)(result + 8) = a2;
  return result;
}

unsigned int *awd::MetricBuffer::addCount(unsigned int *this, unsigned int a2)
{
  unsigned int v2 = *this;
  if (*this <= a2) {
    unsigned int v2 = a2;
  }
  *this = v2;
  return this;
}

uint64_t awd::MetricBuffer::addTimeInSeconds(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 8);
  if (a2 > v2) {
    uint64_t v2 = a2;
  }
  *(void *)(result + 8) = v2 & ~(v2 >> 63);
  return result;
}

uint64_t awd::MetricBuffer::getLastSubmitted(awd::MetricBuffer *this)
{
  uint64_t v1 = *((void *)this + 3);
  if (v1 == *((void *)this + 4)) {
    return 0;
  }
  else {
    return *(void *)v1;
  }
}

void awd::MetricBuffer::buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  sub_1D3E25A1C((uint64_t *)(a1 + 24), *(uint64_t **)(a1 + 24), a2);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    sub_1D3E4DF48();
  }
  uint64_t v3 = *(int ***)(a1 + 24);
  xpc_object_t v4 = *(int ***)(a1 + 32);
  if (v3 != v4)
  {
    xpc_object_t v5 = MEMORY[0x1E4F14500];
    do
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        int v6 = **v3;
        unint64_t v7 = *((void *)*v3 + 1);
        uint64_t v8 = *((void *)*v3 + 3) - *((void *)*v3 + 2);
        int v15 = 67109888;
        int v16 = v6;
        __int16 v17 = 2048;
        uint64_t v18 = v8;
        __int16 v19 = 2048;
        unint64_t v20 = v7 / 0x3E8;
        __int16 v21 = 1024;
        int v22 = v7 % 0x3E8;
        _os_log_debug_impl(&dword_1D3E18000, v5, OS_LOG_TYPE_DEBUG, "metric.buffer:#D   - Metric: 0x%x %zd bytes (%llu.%03u seconds since epoch)", (uint8_t *)&v15, 0x22u);
      }
      ++v3;
    }
    while (v3 != v4);
  }
  awd::MetricBuffer::_deleteOldMetrics((uint64_t **)a1);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    sub_1D3E4DF00();
  }
  xpc_object_t v9 = *(int ***)(a1 + 24);
  uint64_t v10 = *(int ***)(a1 + 32);
  if (v9 != v10)
  {
    size_t v11 = MEMORY[0x1E4F14500];
    do
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        int v12 = **v9;
        unint64_t v13 = *((void *)*v9 + 1);
        uint64_t v14 = *((void *)*v9 + 3) - *((void *)*v9 + 2);
        int v15 = 67109888;
        int v16 = v12;
        __int16 v17 = 2048;
        uint64_t v18 = v14;
        __int16 v19 = 2048;
        unint64_t v20 = v13 / 0x3E8;
        __int16 v21 = 1024;
        int v22 = v13 % 0x3E8;
        _os_log_debug_impl(&dword_1D3E18000, v11, OS_LOG_TYPE_DEBUG, "metric.buffer:#D   - Metric: 0x%x %zd bytes (%llu.%03u seconds since epoch)", (uint8_t *)&v15, 0x22u);
      }
      ++v9;
    }
    while (v9 != v10);
  }
}

uint64_t *sub_1D3E25A1C(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  xpc_object_t v4 = a2;
  int v6 = (uint64_t *)a1[1];
  unint64_t v9 = a1[2];
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = v9;
  if ((unint64_t)v6 >= v9)
  {
    uint64_t v12 = *a1;
    unint64_t v13 = (((uint64_t)v6 - *a1) >> 3) + 1;
    if (v13 >> 61) {
      sub_1D3E1AE60();
    }
    uint64_t v14 = ((uint64_t)a2 - v12) >> 3;
    uint64_t v15 = v8 - v12;
    if (v15 >> 2 > v13) {
      unint64_t v13 = v15 >> 2;
    }
    if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v16 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v16 = v13;
    }
    uint64_t v24 = v7;
    if (v16) {
      __int16 v17 = (char *)sub_1D3E21674(v7, v16);
    }
    else {
      __int16 v17 = 0;
    }
    uint64_t v20 = (uint64_t)v17;
    __int16 v21 = &v17[8 * v14];
    int v22 = v21;
    uint64_t v23 = &v17[8 * v16];
    sub_1D3E26024(&v20, a3);
    xpc_object_t v4 = (uint64_t *)sub_1D3E26150(a1, &v20, v4);
    sub_1D3E26504((uint64_t)&v20);
  }
  else if (a2 == v6)
  {
    uint64_t v18 = *a3;
    *a3 = 0;
    *a2 = v18;
    a1[1] = (uint64_t)(a2 + 1);
  }
  else
  {
    uint64_t v10 = *a3;
    *a3 = 0;
    uint64_t v20 = v10;
    __int16 v21 = (char *)v7;
    sub_1D3E25FC0((uint64_t)a1, a2, a1[1], (uint64_t)(a2 + 1));
    uint64_t v11 = *v4;
    uint64_t *v4 = v20;
    if (v11) {
      sub_1D3E21120((uint64_t)v4, v11);
    }
  }
  return v4;
}

void sub_1D3E25B58(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  uint64_t v11 = a10;
  a10 = 0;
  if (v11) {
    sub_1D3E21120((uint64_t)&a10, v11);
  }
  _Unwind_Resume(exception_object);
}

uint64_t awd::MetricBuffer::_deleteOldMetrics(uint64_t **this)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t AWDTimestamp = awd::getAWDTimestamp((awd *)this);
  uint64_t v3 = this[3];
  xpc_object_t v4 = this[4];
  if (v3 == v4) {
    return 0;
  }
  unint64_t v5 = v4 - v3;
  unint64_t v6 = *(unsigned int *)this;
  if (v5 <= v6) {
    return 0;
  }
  unint64_t v7 = AWDTimestamp;
  uint64_t v8 = 0;
  unint64_t v9 = AWDTimestamp - 1000 * (void)this[1];
  uint64_t v10 = this[4];
  do
  {
    uint64_t v11 = *--v10;
    unint64_t v12 = *(void *)(v11 + 8);
    if (v12 < v9 || v12 > v7)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 134218496;
        unint64_t v17 = v12;
        __int16 v18 = 2048;
        unint64_t v19 = v5;
        __int16 v20 = 1024;
        int v21 = v6;
        _os_log_debug_impl(&dword_1D3E18000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "metric.buffer:#D About to erase metric with time %llums. Size is %zd; fMaxCount is %u",
          buf,
          0x1Cu);
        xpc_object_t v4 = this[4];
      }
      sub_1D3E26274((uint64_t)buf, v10 + 1, v4, v10);
      uint64_t v8 = (v8 + 1);
      sub_1D3E25F5C((uint64_t)(this + 3), v14);
      uint64_t v3 = this[3];
      xpc_object_t v4 = this[4];
      unint64_t v6 = *(unsigned int *)this;
    }
    if (v10 == v3) {
      break;
    }
    unint64_t v5 = v4 - v3;
  }
  while (v5 > v6);
  return v8;
}

uint64_t awd::MetricBuffer::lastCount@<X0>(awd::MetricBuffer *this@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v4 = *((void *)this + 3);
  uint64_t result = (uint64_t)this + 24;
  *(void *)(a3 + 32) = 0;
  *(void *)a3 = v4;
  *(void *)(a3 + 8) = result;
  *(void *)(a3 + 16) = 0;
  *(_DWORD *)(a3 + 24) = a2;
  return result;
}

void *awd::MetricBuffer::iterator::metricBufferIteratorByCount@<X0>(void *result@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  *(void *)(a3 + 32) = 0;
  *(void *)a3 = *result;
  *(void *)(a3 + 8) = result;
  *(void *)(a3 + 16) = 0;
  *(_DWORD *)(a3 + 24) = a2;
  return result;
}

uint64_t awd::MetricBuffer::lastTimeInSeconds@<X0>(awd::MetricBuffer *this@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_DWORD *)(a3 + 24) = 0;
  uint64_t v5 = *((void *)this + 3);
  uint64_t result = (uint64_t)this + 24;
  uint64_t v4 = v5;
  *(void *)a3 = v5;
  *(void *)(a3 + 8) = result;
  *(void *)(a3 + 16) = 1;
  *(void *)(a3 + 32) = a2;
  uint64_t v6 = *(void *)(result + 8);
  while (v4 != v6 && *(void *)(*(void *)v4 + 8) < a2)
  {
    v4 += 8;
    *(void *)a3 = v4;
  }
  return result;
}

uint64_t *awd::MetricBuffer::iterator::metricBufferIteratorSinceTime@<X0>(uint64_t *result@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_DWORD *)(a3 + 24) = 0;
  uint64_t v3 = *result;
  uint64_t v4 = result[1];
  *(void *)a3 = *result;
  *(void *)(a3 + 8) = result;
  *(void *)(a3 + 16) = 1;
  *(void *)(a3 + 32) = a2;
  while (v3 != v4 && *(void *)(*(void *)v3 + 8) < a2)
  {
    v3 += 8;
    *(void *)a3 = v3;
  }
  return result;
}

double awd::MetricBuffer::end@<D0>(awd::MetricBuffer *this@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)(a2 + 24) = 0;
  *(void *)(a2 + 32) = 0;
  *(void *)&double result = 2;
  *(void *)(a2 + 16) = 2;
  *(void *)a2 = *((void *)this + 4);
  *(void *)(a2 + 8) = (char *)this + 24;
  return result;
}

double awd::MetricBuffer::iterator::metricBufferIteratorAtEnd@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)(a2 + 24) = 0;
  *(void *)(a2 + 32) = 0;
  *(void *)&double result = 2;
  *(void *)(a2 + 16) = 2;
  *(void *)a2 = *(void *)(a1 + 8);
  *(void *)(a2 + 8) = a1;
  return result;
}

uint64_t awd::MetricBuffer::iterator::iterator(uint64_t this)
{
  *(void *)this = 0;
  *(_DWORD *)(this + 20) = 0;
  *(_DWORD *)(this + 24) = 0;
  *(void *)(this + 32) = 0;
  return this;
}

{
  *(void *)this = 0;
  *(_DWORD *)(this + 20) = 0;
  *(_DWORD *)(this + 24) = 0;
  *(void *)(this + 32) = 0;
  return this;
}

uint64_t awd::MetricBuffer::iterator::operator->(uint64_t a1)
{
  return **(void **)a1;
}

uint64_t awd::MetricBuffer::iterator::operator*(uint64_t a1)
{
  return **(void **)a1;
}

__n128 awd::MetricBuffer::iterator::operator++@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  int v2 = *(_DWORD *)(a1 + 16);
  switch(v2)
  {
    case 2:
      uint64_t v5 = *(void *)(*(void *)(a1 + 8) + 8);
LABEL_7:
      *(void *)a1 = v5;
      break;
    case 1:
      uint64_t v6 = *(uint64_t **)(*(void *)(a1 + 8) + 8);
      if (*(uint64_t **)a1 != v6)
      {
        unint64_t v7 = (uint64_t *)(*(void *)a1 + 8);
        do
        {
          *(void *)a1 = v7;
          if (v7 == v6) {
            break;
          }
          uint64_t v8 = *v7++;
        }
        while (*(void *)(v8 + 8) < *(void *)(a1 + 32));
      }
      break;
    case 0:
      unsigned int v3 = *(_DWORD *)(a1 + 24);
      unsigned int v4 = *(_DWORD *)(a1 + 20) + 1;
      *(_DWORD *)(a1 + 20) = v4;
      if (v4 >= v3)
      {
        *(void *)a1 = *(void *)(*(void *)(a1 + 8) + 8);
        *(_DWORD *)(a1 + 20) = v3;
        break;
      }
      uint64_t v5 = *(void *)a1 + 8;
      goto LABEL_7;
  }
  __n128 result = *(__n128 *)a1;
  long long v10 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v10;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  return result;
}

BOOL awd::MetricBuffer::iterator::operator!=(void *a1, void *a2)
{
  return *a2 != *a1;
}

void sub_1D3E25F08(void ***a1)
{
  int v2 = (uint64_t **)*a1;
  if (*v2)
  {
    sub_1D3E25F5C((uint64_t)v2, *v2);
    unsigned int v3 = **a1;
    operator delete(v3);
  }
}

void sub_1D3E25F5C(uint64_t a1, uint64_t *a2)
{
  unsigned int v4 = *(uint64_t **)(a1 + 8);
  if (v4 != a2)
  {
    uint64_t v5 = v4 - 1;
    do
    {
      uint64_t v6 = *v5;
      *uint64_t v5 = 0;
      if (v6) {
        sub_1D3E21120((uint64_t)v5, v6);
      }
    }
    while (v5-- != a2);
  }
  *(void *)(a1 + 8) = a2;
}

void *sub_1D3E25FC0(uint64_t a1, void *a2, unint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 8);
  unint64_t v7 = (void *)((char *)a2 + v6 - a4);
  uint64_t v8 = (void *)v6;
  if ((unint64_t)v7 < a3)
  {
    unint64_t v9 = v7;
    uint64_t v8 = *(void **)(a1 + 8);
    do
    {
      uint64_t v10 = *v9;
      *v9++ = 0;
      *v8++ = v10;
    }
    while ((unint64_t)v9 < a3);
  }
  *(void *)(a1 + 8) = v8;
  return sub_1D3E26204((uint64_t)&v12, a2, v7, v6);
}

void *sub_1D3E26024(void *result, uint64_t *a2)
{
  unsigned int v3 = result;
  unsigned int v4 = (uint64_t *)result[2];
  if (v4 == (uint64_t *)result[3])
  {
    uint64_t v5 = (uint64_t *)result[1];
    uint64_t v6 = (uint64_t)v5 - *result;
    if ((unint64_t)v5 <= *result)
    {
      if (v4 == (uint64_t *)*result) {
        unint64_t v13 = 1;
      }
      else {
        unint64_t v13 = ((uint64_t)v4 - *result) >> 2;
      }
      uint64_t v14 = result[4];
      uint64_t v31 = v3[4];
      uint64_t v15 = (char *)sub_1D3E21674(v14, v13);
      unint64_t v17 = &v15[8 * (v13 >> 2)];
      __int16 v18 = (uint64_t *)v3[1];
      uint64_t v19 = v3[2] - (void)v18;
      if (v19)
      {
        uint64_t v20 = v19 >> 3;
        int v21 = &v17[v19 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v22 = 8 * v20;
        uint64_t v23 = &v15[8 * (v13 >> 2)];
        do
        {
          uint64_t v24 = *v18;
          *v18++ = 0;
          *(void *)uint64_t v23 = v24;
          v23 += 8;
          v22 -= 8;
        }
        while (v22);
        int64x2_t v25 = *(int64x2_t *)(v3 + 1);
      }
      else
      {
        int64x2_t v25 = vdupq_n_s64((unint64_t)v18);
        int v21 = &v15[8 * (v13 >> 2)];
      }
      uint64_t v28 = *v3;
      void *v3 = v15;
      v3[1] = v17;
      int64x2_t v29 = v25;
      uint64_t v26 = v3[3];
      void v3[2] = v21;
      v3[3] = &v15[8 * v16];
      uint64_t v30 = v26;
      __n128 result = (void *)sub_1D3E26504((uint64_t)&v28);
      unsigned int v4 = (uint64_t *)v3[2];
    }
    else
    {
      uint64_t v7 = v6 >> 3;
      BOOL v8 = v6 >> 3 < -1;
      uint64_t v9 = (v6 >> 3) + 2;
      if (v8) {
        unint64_t v10 = v9;
      }
      else {
        unint64_t v10 = v7 + 1;
      }
      unint64_t v11 = v10 >> 1;
      __n128 result = sub_1D3E26274((uint64_t)&v28, v5, v4, &v5[-(v10 >> 1)]);
      unsigned int v4 = v12;
      v3[1] -= 8 * v11;
      void v3[2] = v12;
    }
  }
  uint64_t v27 = *a2;
  *a2 = 0;
  uint64_t *v4 = v27;
  v3[2] += 8;
  return result;
}

uint64_t sub_1D3E26150(uint64_t *a1, void *a2, uint64_t *a3)
{
  uint64_t v6 = a2[1];
  uint64_t v7 = (uint64_t)(a1 + 2);
  sub_1D3E262E4((uint64_t)(a1 + 2), (uint64_t)a3, a3, *a1, (void *)*a1, v6, v6);
  a2[1] = v8;
  a2[2] = sub_1D3E2637C(v7, a3, (uint64_t *)a1[1], (void *)a2[2]);
  uint64_t v9 = *a1;
  *a1 = a2[1];
  a2[1] = v9;
  unint64_t v10 = (void *)a1[1];
  a1[1] = a2[2];
  a2[2] = v10;
  unint64_t v11 = (void *)a1[2];
  a1[2] = a2[3];
  a2[3] = v11;
  *a2 = a2[1];
  return v6;
}

void *sub_1D3E26204(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  if (a3 != a2)
  {
    uint64_t v6 = (uint64_t *)(a4 - 8);
    uint64_t v7 = a3;
    do
    {
      uint64_t v8 = *--v7;
      *uint64_t v7 = 0;
      uint64_t v9 = *v6;
      uint64_t *v6 = v8;
      if (v9) {
        sub_1D3E21120((uint64_t)v6, v9);
      }
      --v6;
    }
    while (v7 != a2);
  }
  return a3;
}

uint64_t *sub_1D3E26274(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t v5 = a2;
  if (a2 != a3)
  {
    do
    {
      uint64_t v7 = *v5;
      *uint64_t v5 = 0;
      uint64_t v8 = *a4;
      *a4 = v7;
      if (v8) {
        sub_1D3E21120((uint64_t)a4, v8);
      }
      ++v5;
      ++a4;
    }
    while (v5 != a3);
    return a3;
  }
  return v5;
}

uint64_t sub_1D3E262E4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v16 = a6;
  *((void *)&v16 + 1) = a7;
  long long v15 = v16;
  v13[0] = a1;
  v13[1] = &v15;
  v13[2] = &v16;
  if (a3 == a5)
  {
    uint64_t v11 = a6;
  }
  else
  {
    uint64_t v8 = (void *)(a7 - 8);
    uint64_t v9 = (void *)(a7 - 8);
    do
    {
      uint64_t v10 = *--a3;
      *a3 = 0;
      *v9-- = v10;
      *((void *)&v16 + 1) = v8;
      v7 -= 8;
      uint64_t v8 = v9;
    }
    while (a3 != a5);
    uint64_t v11 = v16;
  }
  char v14 = 1;
  sub_1D3E263F0((uint64_t)v13);
  return v11;
}

void *sub_1D3E2637C(uint64_t a1, uint64_t *a2, uint64_t *a3, void *a4)
{
  unsigned int v4 = a4;
  uint64_t v10 = a4;
  uint64_t v9 = a4;
  v7[0] = a1;
  v7[1] = &v9;
  v7[2] = &v10;
  if (a2 != a3)
  {
    do
    {
      uint64_t v5 = *a2;
      *a2++ = 0;
      *v4++ = v5;
    }
    while (a2 != a3);
    uint64_t v10 = v4;
  }
  char v8 = 1;
  sub_1D3E26474((uint64_t)v7);
  return v4;
}

uint64_t sub_1D3E263F0(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_1D3E26428(a1);
  }
  return a1;
}

void sub_1D3E26428(uint64_t a1)
{
  uint64_t v1 = *(uint64_t **)(*(void *)(a1 + 16) + 8);
  int v2 = *(uint64_t **)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    uint64_t v3 = *v1;
    uint64_t *v1 = 0;
    if (v3) {
      sub_1D3E21120((uint64_t)v1, v3);
    }
    ++v1;
  }
}

uint64_t sub_1D3E26474(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_1D3E264AC(a1);
  }
  return a1;
}

void sub_1D3E264AC(uint64_t a1)
{
  uint64_t v1 = **(uint64_t ***)(a1 + 16);
  int v2 = **(uint64_t ***)(a1 + 8);
  if (v1 != v2)
  {
    uint64_t v3 = v1 - 1;
    do
    {
      uint64_t v4 = *v3;
      uint64_t *v3 = 0;
      if (v4) {
        sub_1D3E21120((uint64_t)v3, v4);
      }
    }
    while (v3-- != v2);
  }
}

uint64_t sub_1D3E26504(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_1D3E2653C(uint64_t a1, uint64_t a2)
{
  for (uint64_t i = *(void *)(a1 + 16); i != a2; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 8;
    uint64_t v5 = *(void *)(i - 8);
    *(void *)(i - 8) = 0;
    if (v5) {
      sub_1D3E21120(i - 8, v5);
    }
  }
}

awd::MetricContainer *awd::MetricContainer::MetricContainer(awd::MetricContainer *this, int a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  *(_DWORD *)this = a2;
  *((void *)this + 1) = 0;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl(&dword_1D3E18000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "metric:#I Creating a metric container for metric id: 0x%x", (uint8_t *)v5, 8u);
  }
  return this;
}

void awd::MetricContainer::~MetricContainer(awd::MetricContainer *this)
{
  uint64_t v3 = *((void *)this + 1);
  uint64_t v1 = (void *)((char *)this + 8);
  uint64_t v2 = v3;
  void *v1 = 0;
  if (v3) {
    sub_1D3E21120((uint64_t)v1, v2);
  }
}

{
  void *v1;
  uint64_t v2;
  uint64_t v3;

  uint64_t v3 = *((void *)this + 1);
  uint64_t v1 = (void *)((char *)this + 8);
  uint64_t v2 = v3;
  void *v1 = 0;
  if (v3) {
    sub_1D3E21120((uint64_t)v1, v2);
  }
}

void awd::MetricContainer::storeMetric(awd::MetricContainer *this, unint64_t a2, unsigned int a3, const wireless_diagnostics::google::protobuf::MessageLite *a4)
{
}

void sub_1D3E26770(_Unwind_Exception *a1)
{
  MEMORY[0x1D94412F0](v1, 0x1010C40D8786FEELL);
  _Unwind_Resume(a1);
}

uint64_t awd::MetricContainer::takeMetric@<X0>(uint64_t this@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *(void *)(this + 8);
  *(void *)(this + 8) = 0;
  *a2 = v2;
  return this;
}

void *awd::MetricContainer::getMetricBytes@<X0>(awd::MetricContainer *this@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *((void *)this + 1);
  a2[1] = 0;
  a2[2] = 0;
  *a2 = 0;
  return sub_1D3E267C0(a2, *(const void **)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 24) - *(void *)(v2 + 16));
}

void *sub_1D3E267C0(void *result, const void *a2, uint64_t a3, size_t __sz)
{
  if (__sz)
  {
    uint64_t v6 = result;
    __n128 result = sub_1D3E1F29C(result, __sz);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      __n128 result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1D3E26820(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void platform::getCustomConfigsPaths(uint64_t a1@<X8>)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  sub_1D3E270D0(v6, "/var/wireless/awdd");
  ctu::path_join_impl();
  int v8 = 1;
  long long v9 = *(_OWORD *)v6;
  uint64_t v10 = v7;
  v6[0] = 0;
  v6[1] = 0;
  uint64_t v7 = 0;
  sub_1D3E270D0(__p, "/AppleInternal/Library/awdd");
  ctu::path_join_impl();
  int v11 = 0;
  long long v12 = *(_OWORD *)__p;
  v13[0] = v5;
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v5 = 0;
  sub_1D3E26CB4(a1, &v8, 2);
  for (uint64_t i = 0; i != -8; i -= 4)
  {
    if (SHIBYTE(v13[i]) < 0) {
      operator delete((void *)v13[i - 2]);
    }
  }
  if (SHIBYTE(v5) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v7) < 0) {
    operator delete(v6[0]);
  }
}

void sub_1D3E26970(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  uint64_t v30 = 0;
  while (1)
  {
    if (*(char *)(v28 + v30 + 63) < 0) {
      operator delete(*(void **)(v28 + v30 + 40));
    }
    v30 -= 32;
    if (v30 == -64)
    {
      if (a15 < 0) {
        operator delete(__p);
      }
      if (a21 < 0) {
        operator delete(a16);
      }
      _Unwind_Resume(exception_object);
    }
  }
}

const char *platform::getPlatformBaseDir(platform *this)
{
  return "/var/wireless/awdd";
}

void *platform::getLogSnapshotPath@<X0>(void *a1@<X8>)
{
  return sub_1D3E270D0(a1, "/var/wireless/Library/Logs/CrashReporter/awd");
}

uint64_t platform::getLogOutputPathInHomeDir@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (*(char *)(a1 + 23) < 0)
  {
    sub_1D3E1D074((unsigned char *)a2, *(void **)a1, *(void *)(a1 + 8));
  }
  else
  {
    *(_OWORD *)a2 = *(_OWORD *)a1;
    *(void *)(a2 + 16) = *(void *)(a1 + 16);
  }
  return ctu::path_join_impl();
}

void sub_1D3E26A94(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void platform::getExtraLogPaths(uint64_t *a1@<X8>)
{
  uint64_t v3 = 0;
  a1[2] = 0;
  uint64_t v4 = (uint64_t)(a1 + 2);
  *a1 = 0;
  a1[1] = 0;
  do
  {
    sub_1D3E270D0(v19, "/var");
    ctu::path_join_impl();
    platform::getLogOutputPathInHomeDir((uint64_t)v19, (uint64_t)__p);
    unint64_t v6 = a1[1];
    unint64_t v5 = a1[2];
    if (v6 >= v5)
    {
      unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v6 - *a1) >> 3);
      unint64_t v9 = v8 + 1;
      if (v8 + 1 > 0xAAAAAAAAAAAAAAALL) {
        sub_1D3E1AE60();
      }
      unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - *a1) >> 3);
      if (2 * v10 > v9) {
        unint64_t v9 = 2 * v10;
      }
      if (v10 >= 0x555555555555555) {
        unint64_t v11 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v11 = v9;
      }
      v21[4] = v4;
      if (v11) {
        long long v12 = (char *)sub_1D3E272A0(v4, v11);
      }
      else {
        long long v12 = 0;
      }
      unint64_t v13 = &v12[24 * v8];
      v21[0] = v12;
      v21[1] = v13;
      v21[3] = &v12[24 * v11];
      long long v14 = *(_OWORD *)__p;
      *((void *)v13 + 2) = v18;
      *(_OWORD *)unint64_t v13 = v14;
      __p[1] = 0;
      uint64_t v18 = 0;
      __p[0] = 0;
      v21[2] = v13 + 24;
      sub_1D3E27228(a1, v21);
      uint64_t v15 = a1[1];
      sub_1D3E27408((uint64_t)v21);
      int v16 = SHIBYTE(v18);
      a1[1] = v15;
      if (v16 < 0) {
        operator delete(__p[0]);
      }
    }
    else
    {
      long long v7 = *(_OWORD *)__p;
      *(void *)(v6 + 16) = v18;
      *(_OWORD *)unint64_t v6 = v7;
      a1[1] = v6 + 24;
    }
    if (v20 < 0) {
      operator delete(v19[0]);
    }
    v3 += 8;
  }
  while (v3 != 24);
}

void sub_1D3E26C54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,char a22)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  sub_1D3E27184((void ***)&a16);
  _Unwind_Resume(a1);
}

uint64_t sub_1D3E26CB4(uint64_t a1, int *a2, uint64_t a3)
{
  *(void *)(a1 + 8) = 0;
  uint64_t v4 = (uint64_t *)(a1 + 8);
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = a1 + 8;
  if (a3)
  {
    uint64_t v6 = 32 * a3;
    do
    {
      sub_1D3E26D34((uint64_t **)a1, v4, a2, (uint64_t)a2);
      a2 += 8;
      v6 -= 32;
    }
    while (v6);
  }
  return a1;
}

void sub_1D3E26D1C(_Unwind_Exception *a1)
{
  sub_1D3E2706C(v1, *(char **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *sub_1D3E26D34(uint64_t **a1, uint64_t *a2, int *a3, uint64_t a4)
{
  uint64_t v6 = (uint64_t **)sub_1D3E26DB8(a1, a2, &v10, &v9, a3);
  __n128 result = *v6;
  if (!*v6)
  {
    sub_1D3E26F60((uint64_t)a1, a4, (uint64_t)&v8);
    sub_1D3E21220(a1, (uint64_t)v10, v6, v8);
    return v8;
  }
  return result;
}

uint64_t *sub_1D3E26DB8(void *a1, uint64_t *a2, uint64_t **a3, uint64_t *a4, int *a5)
{
  unint64_t v5 = a1 + 1;
  if (a1 + 1 == a2 || (v6 = *a5, int v7 = *((_DWORD *)a2 + 8), *a5 < v7))
  {
    unint64_t v8 = (uint64_t *)*a2;
    if ((uint64_t *)*a1 == a2)
    {
      unint64_t v10 = a2;
LABEL_17:
      if (v8)
      {
        *a3 = v10;
        return v10 + 1;
      }
      else
      {
        *a3 = a2;
        return a2;
      }
    }
    if (v8)
    {
      uint64_t v9 = (uint64_t *)*a2;
      do
      {
        unint64_t v10 = v9;
        uint64_t v9 = (uint64_t *)v9[1];
      }
      while (v9);
    }
    else
    {
      unint64_t v13 = a2;
      do
      {
        unint64_t v10 = (uint64_t *)v13[2];
        BOOL v14 = *v10 == (void)v13;
        unint64_t v13 = v10;
      }
      while (v14);
    }
    int v15 = *a5;
    if (*((_DWORD *)v10 + 8) < *a5) {
      goto LABEL_17;
    }
    uint64_t v16 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          unint64_t v17 = (uint64_t *)v16;
          int v18 = *(_DWORD *)(v16 + 32);
          if (v15 >= v18) {
            break;
          }
          uint64_t v16 = *v17;
          unint64_t v5 = v17;
          if (!*v17) {
            goto LABEL_29;
          }
        }
        if (v18 >= v15) {
          break;
        }
        unint64_t v5 = v17 + 1;
        uint64_t v16 = v17[1];
      }
      while (v16);
    }
    else
    {
      unint64_t v17 = a1 + 1;
    }
LABEL_29:
    *a3 = v17;
    return v5;
  }
  if (v7 >= v6)
  {
    *a3 = a2;
    *a4 = (uint64_t)a2;
    return a4;
  }
  uint64_t v11 = a2[1];
  if (v11)
  {
    long long v12 = (uint64_t *)a2[1];
    do
    {
      a4 = v12;
      long long v12 = (uint64_t *)*v12;
    }
    while (v12);
  }
  else
  {
    uint64_t v19 = a2;
    do
    {
      a4 = (uint64_t *)v19[2];
      BOOL v14 = *a4 == (void)v19;
      uint64_t v19 = a4;
    }
    while (!v14);
  }
  if (a4 != v5 && v6 >= *((_DWORD *)a4 + 8))
  {
    uint64_t v20 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          int v21 = (uint64_t *)v20;
          int v22 = *(_DWORD *)(v20 + 32);
          if (v6 >= v22) {
            break;
          }
          uint64_t v20 = *v21;
          unint64_t v5 = v21;
          if (!*v21) {
            goto LABEL_48;
          }
        }
        if (v22 >= v6) {
          break;
        }
        unint64_t v5 = v21 + 1;
        uint64_t v20 = v21[1];
      }
      while (v20);
    }
    else
    {
      int v21 = a1 + 1;
    }
LABEL_48:
    *a3 = v21;
    return v5;
  }
  if (v11)
  {
    *a3 = a4;
  }
  else
  {
    *a3 = a2;
    return a2 + 1;
  }
  return a4;
}

void *sub_1D3E26F60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  int v6 = operator new(0x40uLL);
  *(void *)(a3 + 8) = v5;
  *(void *)a3 = v6;
  *(unsigned char *)(a3 + 16) = 0;
  v6[8] = *(_DWORD *)a2;
  __n128 result = v6 + 10;
  if (*(char *)(a2 + 31) < 0)
  {
    __n128 result = sub_1D3E1D074(result, *(void **)(a2 + 8), *(void *)(a2 + 16));
  }
  else
  {
    *(_OWORD *)__n128 result = *(_OWORD *)(a2 + 8);
    result[2] = *(void *)(a2 + 24);
  }
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

void sub_1D3E26FF0(_Unwind_Exception *a1)
{
  void *v1 = 0;
  sub_1D3E2700C(v3, v2);
  _Unwind_Resume(a1);
}

void sub_1D3E2700C(uint64_t a1, void **__p)
{
  if (*(unsigned char *)(a1 + 8))
  {
    if (*((char *)__p + 63) < 0) {
      operator delete(__p[5]);
    }
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

void sub_1D3E2706C(uint64_t a1, char *a2)
{
  if (a2)
  {
    sub_1D3E2706C(a1, *(void *)a2);
    sub_1D3E2706C(a1, *((void *)a2 + 1));
    if (a2[63] < 0) {
      operator delete(*((void **)a2 + 5));
    }
    operator delete(a2);
  }
}

void *sub_1D3E270D0(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_1D3E1B61C();
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

void sub_1D3E27184(void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    sub_1D3E271D8((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void sub_1D3E271D8(uint64_t *a1)
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

uint64_t sub_1D3E27228(uint64_t *a1, void *a2)
{
  uint64_t result = sub_1D3E272E8((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *sub_1D3E272A0(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    sub_1D3E1D114();
  }
  return operator new(24 * a2);
}

uint64_t sub_1D3E272E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 != a5)
  {
    uint64_t v9 = a7;
    do
    {
      long long v10 = *(_OWORD *)(a3 - 24);
      *(void *)(v9 - 8) = *(void *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v10;
      v9 -= 24;
      *(void *)(a3 - 16) = 0;
      *(void *)(a3 - 8) = 0;
      *(void *)(a3 - 24) = 0;
      v7 -= 24;
      a3 -= 24;
    }
    while (a3 != a5);
    *((void *)&v15 + 1) = v9;
  }
  char v13 = 1;
  sub_1D3E27388((uint64_t)v12);
  return a6;
}

uint64_t sub_1D3E27388(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_1D3E273C0(a1);
  }
  return a1;
}

void sub_1D3E273C0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
    v1 += 24;
  }
}

uint64_t sub_1D3E27408(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_1D3E27440(uint64_t a1, void **a2)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      uint64_t v5 = v2 - 3;
      *(void *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        uint64_t v5 = *(void ***)(a1 + 16);
      }
      uint64_t v2 = v5;
    }
    while (v5 != a2);
  }
}

double awd::SimpleMetricHelper::SimpleMetricHelper(awd::SimpleMetricHelper *this, int a2)
{
  *(_DWORD *)this = a2;
  *((_WORD *)this + 2) = 0;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  return result;
}

{
  double result;

  *(_DWORD *)this = a2;
  *((_WORD *)this + 2) = 0;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  return result;
}

uint64_t *awd::SimpleMetricHelper::setConfiguration(awd::SimpleMetricHelper *this, const awd::profile::ComponentConfiguration *a2)
{
  uint64_t v5 = (void **)((char *)this + 8);
  size_t v4 = (char *)*((void *)this + 1);
  *((_WORD *)this + 2) = 1;
  *((void *)this + 2) = v4;
  uint64_t v6 = *((int *)a2 + 4);
  if (v6)
  {
    uint64_t v7 = *((void *)a2 + 1);
    uint64_t v25 = v7 + 8 * v6;
    uint64_t v8 = (void *)((char *)this + 24);
    do
    {
      uint64_t v9 = *(int *)(*(void *)v7 + 48);
      if (v9)
      {
        uint64_t v10 = *(void *)(*(void *)v7 + 40);
        uint64_t v11 = v10 + 8 * v9;
        do
        {
          int v12 = *(_DWORD *)(*(void *)v10 + 8);
          if (v12 == 0x20000)
          {
            *((unsigned char *)this + 5) = 1;
          }
          else
          {
            if ((unint64_t)v4 >= *v8)
            {
              long long v14 = (char *)*v5;
              uint64_t v15 = (v4 - (unsigned char *)*v5) >> 2;
              unint64_t v16 = v15 + 1;
              if ((unint64_t)(v15 + 1) >> 62) {
                sub_1D3E1AE60();
              }
              uint64_t v17 = *v8 - (void)v14;
              if (v17 >> 1 > v16) {
                unint64_t v16 = v17 >> 1;
              }
              if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFFCLL) {
                unint64_t v18 = 0x3FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v18 = v16;
              }
              if (v18)
              {
                unint64_t v18 = (unint64_t)sub_1D3E1D1BC((uint64_t)this + 24, v18);
                uint64_t v20 = v19;
                long long v14 = (char *)*((void *)this + 1);
                size_t v4 = (char *)*((void *)this + 2);
              }
              else
              {
                uint64_t v20 = 0;
              }
              int v21 = (_DWORD *)(v18 + 4 * v15);
              *int v21 = v12;
              char v13 = (char *)(v21 + 1);
              while (v4 != v14)
              {
                int v22 = *((_DWORD *)v4 - 1);
                v4 -= 4;
                *--int v21 = v22;
              }
              *((void *)this + 1) = v21;
              *((void *)this + 2) = v13;
              *((void *)this + 3) = v18 + 4 * v20;
              if (v14) {
                operator delete(v14);
              }
            }
            else
            {
              *(_DWORD *)size_t v4 = v12;
              char v13 = v4 + 4;
            }
            *((void *)this + 2) = v13;
            size_t v4 = v13;
          }
          v10 += 8;
        }
        while (v10 != v11);
      }
      v7 += 8;
    }
    while (v7 != v25);
  }
  std::__sort<std::__less<unsigned int,unsigned int> &,unsigned int *>();
  uint64_t v23 = sub_1D3E27FEC(*((int **)this + 1), *((int **)this + 2));
  if (*((int **)this + 2) != v23) {
    *((void *)this + 2) = v23;
  }
  return awd::SimpleMetricHelper::filterBufferedMetrics(this);
}

uint64_t *awd::SimpleMetricHelper::filterBufferedMetrics(awd::SimpleMetricHelper *this)
{
  uint64_t v2 = (unsigned int **)*((void *)this + 4);
  uint64_t v3 = (unsigned int **)*((void *)this + 5);
  uint64_t v1 = (char *)this + 32;
  if (v2 != v3)
  {
    do
    {
      uint64_t v5 = *v2;
      if (!awd::SimpleMetricHelper::shouldCreateMetric(this, **v2))
      {
        *uint64_t v2 = 0;
        sub_1D3E21120((uint64_t)v2, (uint64_t)v5);
      }
      ++v2;
    }
    while (v2 != v3);
    uint64_t v6 = (uint64_t *)*((void *)this + 4);
    uint64_t v2 = (unsigned int **)*((void *)this + 5);
    while (v6 != (uint64_t *)v2)
    {
      if (!*v6)
      {
        if (v6 != (uint64_t *)v2)
        {
          uint64_t v8 = (unsigned int **)(v6 + 1);
          if (v6 + 1 != (uint64_t *)v2)
          {
            do
            {
              uint64_t v9 = (uint64_t)*v8;
              if (*v8)
              {
                void *v8 = 0;
                uint64_t v10 = *v6;
                uint64_t *v6 = v9;
                if (v10) {
                  sub_1D3E21120((uint64_t)v6, v10);
                }
                ++v6;
              }
              ++v8;
            }
            while (v8 != v2);
            uint64_t v2 = (unsigned int **)*((void *)this + 5);
          }
        }
        goto LABEL_10;
      }
      ++v6;
    }
  }
  uint64_t v6 = (uint64_t *)v2;
LABEL_10:
  return sub_1D3E2781C((uint64_t)v1, v6, (uint64_t *)v2);
}

BOOL awd::SimpleMetricHelper::shouldCreateMetric(awd::SimpleMetricHelper *this, unsigned int a2)
{
  if (!*((unsigned char *)this + 4)) {
    return 1;
  }
  if (a2 == 0x20000) {
    return *((unsigned char *)this + 5) != 0;
  }
  uint64_t v3 = (unsigned int *)*((void *)this + 1);
  size_t v4 = (unsigned int *)*((void *)this + 2);
  if (v4 == v3) {
    return 0;
  }
  unint64_t v5 = v4 - v3;
  do
  {
    unint64_t v6 = v5 >> 1;
    uint64_t v7 = &v3[v5 >> 1];
    unsigned int v9 = *v7;
    uint64_t v8 = v7 + 1;
    v5 += ~(v5 >> 1);
    if (v9 < a2) {
      uint64_t v3 = v8;
    }
    else {
      unint64_t v5 = v6;
    }
  }
  while (v5);
  return v3 != v4 && *v3 <= a2;
}

uint64_t *sub_1D3E2781C(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  if (a2 != a3)
  {
    sub_1D3E26274((uint64_t)&v7, a3, *(uint64_t **)(a1 + 8), a2);
    sub_1D3E25F5C(a1, v5);
  }
  return a2;
}

BOOL awd::SimpleMetricHelper::mustWaitForConfig(awd::SimpleMetricHelper *this)
{
  return *((unsigned char *)this + 4) == 0;
}

uint64_t awd::SimpleMetricHelper::shouldFixupMetricId(awd::SimpleMetricHelper *this)
{
  return 0;
}

double awd::SimpleMetricHelper::saveMetric(awd::SimpleMetricHelper *this, awd::Metric *a2, awd::metrics::SimpleMetric *a3, wireless_diagnostics::google::protobuf::MessageLite *a4)
{
  *(_DWORD *)a2 = a4;
  awd::serializeMetric(a3, a4, (unint64_t *)&v7);
  unint64_t v5 = (void *)*((void *)a2 + 2);
  if (v5)
  {
    *((void *)a2 + 3) = v5;
    operator delete(v5);
  }
  double result = *(double *)&v7;
  *((_OWORD *)a2 + 1) = v7;
  *((void *)a2 + 4) = v8;
  return result;
}

uint64_t awd::SimpleMetricHelper::maybeBufferMetric(uint64_t result, uint64_t *a2)
{
  if (!*(unsigned char *)(result + 4))
  {
    uint64_t v3 = result;
    unint64_t v5 = *(void *)(result + 48);
    result += 48;
    unint64_t v4 = v5;
    unint64_t v6 = *(void **)(result - 8);
    if ((unint64_t)v6 >= v5)
    {
      unsigned int v9 = (uint64_t *)(result - 16);
      uint64_t v10 = *(void *)(result - 16);
      uint64_t v11 = ((uint64_t)v6 - v10) >> 3;
      if ((unint64_t)(v11 + 1) >> 61) {
        sub_1D3E1AE60();
      }
      uint64_t v12 = v4 - v10;
      uint64_t v13 = v12 >> 2;
      if (v12 >> 2 <= (unint64_t)(v11 + 1)) {
        uint64_t v13 = v11 + 1;
      }
      if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v14 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v14 = v13;
      }
      v18[4] = result;
      if (v14) {
        uint64_t v15 = (char *)sub_1D3E21674(result, v14);
      }
      else {
        uint64_t v15 = 0;
      }
      unint64_t v16 = &v15[8 * v11];
      v18[0] = v15;
      v18[1] = v16;
      v18[3] = &v15[8 * v14];
      uint64_t v17 = *a2;
      *a2 = 0;
      *(void *)unint64_t v16 = v17;
      v18[2] = v16 + 8;
      sub_1D3E28050(v9, v18);
      uint64_t v8 = *(void **)(v3 + 40);
      double result = sub_1D3E26504((uint64_t)v18);
    }
    else
    {
      uint64_t v7 = *a2;
      *a2 = 0;
      void *v6 = v7;
      uint64_t v8 = v6 + 1;
      *(void *)(v3 + 40) = v8;
    }
    *(void *)(v3 + 40) = v8;
  }
  return result;
}

void sub_1D3E279DC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_1D3E26504((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t awd::SimpleMetricHelper::makeSimpleMetric@<X0>(awd::SimpleMetricHelper *this@<X0>, unsigned int a2@<W1>, uint64_t *a3@<X8>)
{
  *a3 = 0;
  BOOL Metric = awd::SimpleMetricHelper::shouldCreateMetric(this, a2);
  if (Metric)
  {
    awd::getAWDTimestamp((awd *)Metric);
    operator new();
  }
  return awd::SimpleMetricHelper::maybeBufferMetric((uint64_t)this, a3);
}

{
  BOOL Metric;

  *a3 = 0;
  BOOL Metric = awd::SimpleMetricHelper::shouldCreateMetric(this, a2);
  if (Metric)
  {
    awd::getAWDTimestamp((awd *)Metric);
    operator new();
  }
  return awd::SimpleMetricHelper::maybeBufferMetric((uint64_t)this, a3);
}

{
  BOOL Metric;

  *a3 = 0;
  BOOL Metric = awd::SimpleMetricHelper::shouldCreateMetric(this, a2);
  if (Metric)
  {
    awd::getAWDTimestamp((awd *)Metric);
    operator new();
  }
  return awd::SimpleMetricHelper::maybeBufferMetric((uint64_t)this, a3);
}

{
  BOOL Metric;

  *a3 = 0;
  BOOL Metric = awd::SimpleMetricHelper::shouldCreateMetric(this, a2);
  if (Metric)
  {
    awd::getAWDTimestamp((awd *)Metric);
    operator new();
  }
  return awd::SimpleMetricHelper::maybeBufferMetric((uint64_t)this, a3);
}

void sub_1D3E27AA8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  awd::metrics::SimpleMetric::~SimpleMetric((awd::metrics::SimpleMetric *)va);
  uint64_t v4 = *v2;
  *uint64_t v2 = 0;
  if (v4) {
    sub_1D3E21120((uint64_t)v2, v4);
  }
  _Unwind_Resume(a1);
}

void sub_1D3E27BC8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  awd::metrics::SimpleMetric::~SimpleMetric((awd::metrics::SimpleMetric *)va);
  uint64_t v4 = *v2;
  *uint64_t v2 = 0;
  if (v4) {
    sub_1D3E21120((uint64_t)v2, v4);
  }
  _Unwind_Resume(a1);
}

void sub_1D3E27CEC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  awd::metrics::SimpleMetric::~SimpleMetric((awd::metrics::SimpleMetric *)va);
  uint64_t v4 = *v2;
  *uint64_t v2 = 0;
  if (v4) {
    sub_1D3E21120((uint64_t)v2, v4);
  }
  _Unwind_Resume(a1);
}

void sub_1D3E27E10(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  awd::metrics::SimpleMetric::~SimpleMetric((awd::metrics::SimpleMetric *)va);
  uint64_t v4 = *v2;
  *uint64_t v2 = 0;
  if (v4) {
    sub_1D3E21120((uint64_t)v2, v4);
  }
  _Unwind_Resume(a1);
}

uint64_t awd::SimpleMetricHelper::makeSimpleMetric@<X0>(awd::SimpleMetricHelper *a1@<X0>, unsigned int a2@<W1>, uint64_t *a3@<X8>)
{
  *a3 = 0;
  BOOL Metric = awd::SimpleMetricHelper::shouldCreateMetric(a1, a2);
  if (Metric)
  {
    awd::getAWDTimestamp((awd *)Metric);
    operator new();
  }
  return awd::SimpleMetricHelper::maybeBufferMetric((uint64_t)a1, a3);
}

void sub_1D3E27F70(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  uint64_t v12 = *v10;
  uint64_t *v10 = 0;
  if (v12) {
    sub_1D3E21120((uint64_t)v10, v12);
  }
  _Unwind_Resume(exception_object);
}

__n128 awd::SimpleMetricHelper::takeBufferedMetrics@<Q0>(__n128 *this@<X0>, __n128 *a2@<X8>)
{
  __n128 result = this[2];
  *a2 = result;
  a2[1].n128_u64[0] = this[3].n128_u64[0];
  this[2].n128_u64[1] = 0;
  this[3].n128_u64[0] = 0;
  this[2].n128_u64[0] = 0;
  return result;
}

int *sub_1D3E27FEC(int *a1, int *a2)
{
  __n128 result = a2;
  if (a1 != a2)
  {
    uint64_t v4 = a1 + 1;
    do
    {
      if (v4 == a2) {
        return a2;
      }
      int v5 = *(v4 - 1);
      int v6 = *v4++;
    }
    while (v5 != v6);
    uint64_t v7 = v4 - 2;
    while (v4 != a2)
    {
      int v8 = v5;
      int v5 = *v4;
      if (v8 != *v4)
      {
        v7[1] = v5;
        ++v7;
      }
      ++v4;
    }
    return v7 + 1;
  }
  return result;
}

uint64_t sub_1D3E28050(uint64_t *a1, void *a2)
{
  uint64_t result = sub_1D3E280C8((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t sub_1D3E280C8(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v16 = a6;
  *((void *)&v16 + 1) = a7;
  long long v15 = v16;
  v13[0] = a1;
  v13[1] = &v15;
  void v13[2] = &v16;
  if (a3 == a5)
  {
    uint64_t v11 = a6;
  }
  else
  {
    uint64_t v8 = (void *)(a7 - 8);
    unsigned int v9 = (void *)(a7 - 8);
    do
    {
      uint64_t v10 = *--a3;
      *a3 = 0;
      *v9-- = v10;
      *((void *)&v16 + 1) = v8;
      v7 -= 8;
      uint64_t v8 = v9;
    }
    while (a3 != a5);
    uint64_t v11 = v16;
  }
  char v14 = 1;
  sub_1D3E28160((uint64_t)v13);
  return v11;
}

uint64_t sub_1D3E28160(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_1D3E26428(a1);
  }
  return a1;
}

uint64_t awd::AWDTriggerMessage::AWDTriggerMessage(uint64_t result, int a2, uint64_t a3, uint64_t a4, int a5)
{
  *(void *)uint64_t result = &unk_1F2B9ACE0;
  *(_DWORD *)(result + 8) = a2;
  *(void *)(result + 16) = a3;
  *(void *)(result + 24) = a4;
  *(_DWORD *)(result + 32) = a5;
  return result;
}

{
  *(void *)uint64_t result = &unk_1F2B9ACE0;
  *(_DWORD *)(result + 8) = a2;
  *(void *)(result + 16) = a3;
  *(void *)(result + 24) = a4;
  *(_DWORD *)(result + 32) = a5;
  return result;
}

uint64_t awd::AWDTriggerMessage::AWDTriggerMessage(uint64_t a1, xpc_object_t *a2)
{
  *(void *)a1 = &unk_1F2B9ACE0;
  *(_DWORD *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 32) = 0;
  if (MEMORY[0x1D94419C0](*a2) == MEMORY[0x1E4F14590])
  {
    *(_DWORD *)(a1 + 8) = xpc_dictionary_get_int64(*a2, "AWDMessageComponentId");
    *(void *)(a1 + 16) = xpc_dictionary_get_int64(*a2, "AWDMessageTriggerTimestampId");
    *(_DWORD *)(a1 + 28) = xpc_dictionary_get_int64(*a2, "AWDMessageTriggerId");
    *(_DWORD *)(a1 + 32) = xpc_dictionary_get_int64(*a2, "AWDMessageSubmisssionId");
    *(_DWORD *)(a1 + 24) = xpc_dictionary_get_int64(*a2, "AWDMessageTriggeringComponentId");
  }
  return a1;
}

void awd::AWDTriggerMessage::createXpcMessage(awd::AWDTriggerMessage *this@<X0>, xpc_object_t *a2@<X8>)
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  if (v4)
  {
    uint64_t v5 = v4;
    xpc_dictionary_set_int64(v4, "AWDMessageType", 6);
    xpc_dictionary_set_int64(v5, "AWDMessageComponentId", *((unsigned int *)this + 2));
    xpc_dictionary_set_int64(v5, "AWDMessageTriggerTimestampId", *((void *)this + 2));
    xpc_dictionary_set_int64(v5, "AWDMessageSubmisssionId", *((unsigned int *)this + 8));
    xpc_dictionary_set_int64(v5, "AWDMessageTriggerId", *((unsigned int *)this + 7));
    xpc_dictionary_set_int64(v5, "AWDMessageTriggeringComponentId", *((unsigned int *)this + 6));
    *a2 = v5;
    if (MEMORY[0x1D94419C0](v5) == MEMORY[0x1E4F14590]) {
      xpc_retain(v5);
    }
    else {
      *a2 = xpc_null_create();
    }
    xpc_release(v5);
  }
  else
  {
    *a2 = xpc_null_create();
  }
}

uint64_t awd::AWDTriggerMessage::getTrigger(awd::AWDTriggerMessage *this)
{
  return *((void *)this + 3);
}

uint64_t awd::AWDTriggerMessage::getTriggerTimestamp(awd::AWDTriggerMessage *this)
{
  return *((void *)this + 2);
}

uint64_t awd::AWDTriggerMessage::getComponentId(awd::AWDTriggerMessage *this)
{
  return *((unsigned int *)this + 2);
}

void sub_1D3E283EC()
{
}

void AWDPostSimpleMetric()
{
  sub_1D3E37A98(&v0);
  sub_1D3E39548(v0);
}

void sub_1D3E28448(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_1D3E1D148(a10);
  }
  _Unwind_Resume(exception_object);
}

void AWDPostSimpleMetricWithBool()
{
  sub_1D3E37A98(&v0);
  sub_1D3E39628(v0);
}

void sub_1D3E284B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_1D3E1D148(a10);
  }
  _Unwind_Resume(exception_object);
}

void AWDPostSimpleMetricWithInteger()
{
  sub_1D3E37A98(&v0);
  sub_1D3E39710(v0);
}

void sub_1D3E28518(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_1D3E1D148(a10);
  }
  _Unwind_Resume(exception_object);
}

void AWDPostSimpleMetricWithUnsignedInteger()
{
  sub_1D3E37A98(&v0);
  sub_1D3E397F8(v0);
}

void sub_1D3E28580(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_1D3E1D148(a10);
  }
  _Unwind_Resume(exception_object);
}

void AWDPostSimpleMetricWithString()
{
  sub_1D3E37A98(&v0);
  sub_1D3E39628(v0);
}

void sub_1D3E285EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_1D3E1D148(a10);
  }
  _Unwind_Resume(exception_object);
}

void AWDPostSimpleMetricWithString(uint64_t a1, uint64_t a2)
{
  sub_1D3E37A98(&v7);
  xpc_object_t v4 = v7;
  if (*(char *)(a2 + 23) < 0)
  {
    sub_1D3E1D074(__p, *(void **)a2, *(void *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)a2;
    uint64_t v6 = *(void *)(a2 + 16);
  }
  sub_1D3E398E0(v4, a1, __p);
}

void sub_1D3E28698(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, std::__shared_weak_count *a17)
{
  if (a17) {
    sub_1D3E1D148(a17);
  }
  _Unwind_Resume(exception_object);
}

void AWDPostMetric(uint64_t a1, void *a2)
{
  id v2 = a2;
  operator new();
}

void sub_1D3E288C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12, uint64_t a13, uint64_t a14)
{
  uint64_t v16 = a10;
  a10 = 0;
  if (v16) {
    sub_1D3E21120((uint64_t)&a10, v16);
  }
  if (a12) {
    sub_1D3E1D148(a12);
  }
  uint64_t v17 = a14;
  a14 = 0;
  if (v17) {
    sub_1D3E21120((uint64_t)&a14, v17);
  }

  _Unwind_Resume(a1);
}

void AWDPostMetric(unsigned int a1, const wireless_diagnostics::google::protobuf::MessageLite *a2)
{
}

void sub_1D3E28A5C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12, uint64_t a13, uint64_t a14)
{
  uint64_t v15 = a10;
  a10 = 0;
  if (v15) {
    sub_1D3E21120((uint64_t)&a10, v15);
  }
  if (a12) {
    sub_1D3E1D148(a12);
  }
  uint64_t v16 = a14;
  a14 = 0;
  if (v16) {
    sub_1D3E21120((uint64_t)&a14, v16);
  }
  _Unwind_Resume(exception_object);
}

void AWDPostMetric()
{
}

void sub_1D3E28BC0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12, uint64_t a13, uint64_t a14)
{
  uint64_t v15 = a10;
  a10 = 0;
  if (v15) {
    sub_1D3E21120((uint64_t)&a10, v15);
  }
  if (a12) {
    sub_1D3E1D148(a12);
  }
  uint64_t v16 = a14;
  a14 = 0;
  if (v16) {
    sub_1D3E21120((uint64_t)&a14, v16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t awd::AWDRegisterTriggerMessage::AWDRegisterTriggerMessage(uint64_t result, int a2, int a3, void *a4, uint64_t a5)
{
  *(void *)uint64_t result = &unk_1F2B9ADE8;
  *(_DWORD *)(result + 8) = a2;
  *(_DWORD *)(result + 12) = a3;
  *(void *)(result + 16) = *a4;
  uint64_t v5 = a4 + 1;
  uint64_t v6 = a4[1];
  *(void *)(result + 24) = v6;
  uint64_t v7 = result + 24;
  uint64_t v8 = a4[2];
  *(void *)(result + 32) = v8;
  if (v8)
  {
    *(void *)(v6 + 16) = v7;
    *a4 = v5;
    *uint64_t v5 = 0;
    a4[2] = 0;
  }
  else
  {
    *(void *)(result + 16) = v7;
  }
  *(void *)(result + 40) = a5;
  return result;
}

{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(void *)uint64_t result = &unk_1F2B9ADE8;
  *(_DWORD *)(result + 8) = a2;
  *(_DWORD *)(result + 12) = a3;
  *(void *)(result + 16) = *a4;
  uint64_t v5 = a4 + 1;
  uint64_t v6 = a4[1];
  *(void *)(result + 24) = v6;
  uint64_t v7 = result + 24;
  uint64_t v8 = a4[2];
  *(void *)(result + 32) = v8;
  if (v8)
  {
    *(void *)(v6 + 16) = v7;
    *a4 = v5;
    *uint64_t v5 = 0;
    a4[2] = 0;
  }
  else
  {
    *(void *)(result + 16) = v7;
  }
  *(void *)(result + 40) = a5;
  return result;
}

uint64_t awd::AWDRegisterTriggerMessage::_metricCountsApplier(uint64_t **this, unint64_t a2, void *a3)
{
  if (MEMORY[0x1D94419C0](a3) == MEMORY[0x1E4F14590])
  {
    unsigned int int64 = xpc_dictionary_get_int64(a3, "AWDMessageMetricCountsArrayMetricId");
    int v5 = xpc_dictionary_get_int64(a3, "AWDMessageMetricCountsArrayCount");
    p_unsigned int int64 = &int64;
    *((_DWORD *)sub_1D3E29298(this + 2, &int64, (uint64_t)&unk_1D3E52824, &p_int64) + 8) = v5;
  }
  return 1;
}

uint64_t awd::AWDRegisterTriggerMessage::AWDRegisterTriggerMessage(uint64_t a1, xpc_object_t *a2)
{
  *(void *)(a1 + 24) = 0;
  *(void *)a1 = &unk_1F2B9ADE8;
  *(void *)(a1 + 16) = a1 + 24;
  *(void *)(a1 + 32) = 0;
  if (MEMORY[0x1D94419C0](*a2) == MEMORY[0x1E4F14590])
  {
    *(_DWORD *)(a1 + 8) = xpc_dictionary_get_int64(*a2, "AWDMessageComponentId");
    *(_DWORD *)(a1 + 12) = xpc_dictionary_get_int64(*a2, "AWDMessageTriggerId");
    xpc_object_t value = xpc_dictionary_get_value(*a2, "AWDMessageMetricCountsArray");
    applier[0] = MEMORY[0x1E4F143A8];
    applier[1] = 0x40000000;
    applier[2] = sub_1D3E28EDC;
    applier[3] = &unk_1E69CA430;
    applier[4] = a1;
    xpc_array_apply(value, applier);
    *(void *)(a1 + 40) = xpc_dictionary_get_int64(*a2, "AWDMessageLongesttime");
  }
  return a1;
}

void sub_1D3E28EBC(_Unwind_Exception *a1)
{
  sub_1D3E20F64(v1, *v2);
  _Unwind_Resume(a1);
}

uint64_t sub_1D3E28EDC(uint64_t a1, unint64_t a2, void *a3)
{
  return 1;
}

void awd::AWDRegisterTriggerMessage::createXpcMessage(awd::AWDRegisterTriggerMessage *this@<X0>, xpc_object_t *a2@<X8>)
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  if (v4)
  {
    int v5 = v4;
    xpc_dictionary_set_int64(v4, "AWDMessageType", 5);
    xpc_dictionary_set_int64(v5, "AWDMessageComponentId", *((unsigned int *)this + 2));
    xpc_dictionary_set_int64(v5, "AWDMessageTriggerId", *((unsigned int *)this + 3));
    xpc_dictionary_set_int64(v5, "AWDMessageLongesttime", *((void *)this + 5));
    xpc_object_t v6 = xpc_array_create(0, 0);
    if (v6 || (xpc_object_t v6 = xpc_null_create()) != 0)
    {
      if (MEMORY[0x1D94419C0](v6) == MEMORY[0x1E4F14568])
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
    uint64_t v8 = (awd::AWDRegisterTriggerMessage *)*((void *)this + 2);
    if (v8 != (awd::AWDRegisterTriggerMessage *)((char *)this + 24))
    {
      uint64_t v9 = MEMORY[0x1E4F14590];
      do
      {
        xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
        if (v10 || (xpc_object_t v10 = xpc_null_create()) != 0)
        {
          if (MEMORY[0x1D94419C0](v10) == v9)
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
        xpc_dictionary_set_int64(v11, "AWDMessageMetricCountsArrayMetricId", *((unsigned int *)v8 + 7));
        xpc_dictionary_set_int64(v11, "AWDMessageMetricCountsArrayCount", *((int *)v8 + 8));
        xpc_array_append_value(v7, v11);
        xpc_release(v11);
        uint64_t v12 = (awd::AWDRegisterTriggerMessage *)*((void *)v8 + 1);
        if (v12)
        {
          do
          {
            uint64_t v13 = v12;
            uint64_t v12 = *(awd::AWDRegisterTriggerMessage **)v12;
          }
          while (v12);
        }
        else
        {
          do
          {
            uint64_t v13 = (awd::AWDRegisterTriggerMessage *)*((void *)v8 + 2);
            BOOL v14 = *(void *)v13 == (void)v8;
            uint64_t v8 = v13;
          }
          while (!v14);
        }
        uint64_t v8 = v13;
      }
      while (v13 != (awd::AWDRegisterTriggerMessage *)((char *)this + 24));
    }
    xpc_dictionary_set_value(v5, "AWDMessageMetricCountsArray", v7);
    *a2 = v5;
    if (MEMORY[0x1D94419C0](v5) == MEMORY[0x1E4F14590]) {
      xpc_retain(v5);
    }
    else {
      *a2 = xpc_null_create();
    }
    xpc_release(v5);
    xpc_release(v7);
  }
  else
  {
    *a2 = xpc_null_create();
  }
}

void sub_1D3E29178(_Unwind_Exception *a1)
{
  xpc_release(v1);
  _Unwind_Resume(a1);
}

uint64_t awd::AWDRegisterTriggerMessage::getComponentId(awd::AWDRegisterTriggerMessage *this)
{
  return *((unsigned int *)this + 2);
}

uint64_t awd::AWDRegisterTriggerMessage::getTriggerId(awd::AWDRegisterTriggerMessage *this)
{
  return *((unsigned int *)this + 3);
}

uint64_t awd::AWDRegisterTriggerMessage::getMetricCounts(awd::AWDRegisterTriggerMessage *this)
{
  return (uint64_t)this + 16;
}

uint64_t awd::AWDRegisterTriggerMessage::getLongestTime(awd::AWDRegisterTriggerMessage *this)
{
  return *((void *)this + 5);
}

uint64_t sub_1D3E291E8(uint64_t a1)
{
  *(void *)a1 = &unk_1F2B9ADE8;
  sub_1D3E20F64(a1 + 16, *(void **)(a1 + 24));
  return a1;
}

void sub_1D3E29230(uint64_t a1)
{
  *(void *)a1 = &unk_1F2B9ADE8;
  sub_1D3E20F64(a1 + 16, *(void **)(a1 + 24));
  JUMPOUT(0x1D94412F0);
}

uint64_t *sub_1D3E29298(uint64_t **a1, unsigned int *a2, uint64_t a3, unsigned int **a4)
{
  xpc_object_t v7 = a1 + 1;
  xpc_object_t v6 = a1[1];
  if (v6)
  {
    unsigned int v8 = *a2;
    while (1)
    {
      while (1)
      {
        uint64_t v9 = (uint64_t **)v6;
        unsigned int v10 = *((_DWORD *)v6 + 7);
        if (v8 >= v10) {
          break;
        }
        xpc_object_t v6 = *v9;
        xpc_object_t v7 = v9;
        if (!*v9) {
          goto LABEL_10;
        }
      }
      if (v10 >= v8) {
        break;
      }
      xpc_object_t v6 = v9[1];
      if (!v6)
      {
        xpc_object_t v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    uint64_t v9 = a1 + 1;
LABEL_10:
    xpc_object_t v11 = (uint64_t *)operator new(0x28uLL);
    *(uint64_t *)((char *)v11 + 28) = **a4;
    sub_1D3E21220(a1, (uint64_t)v9, v7, v11);
    return v11;
  }
  return (uint64_t *)v9;
}

uint64_t awd::AWDTriggerFilter::AWDTriggerFilter(ctu::OsLogLogger *a1, uint64_t a2, int a3, void *a4)
{
  uint64_t result = ctu::OsLogLogger::OsLogLogger(a1, "com.apple.awd.framework", "trigger");
  *(_DWORD *)(result + 8) = a3;
  uint64_t v7 = a4[1];
  *(void *)(result + 16) = *a4;
  *(void *)(result + 24) = v7;
  if (v7) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 16), 1uLL, memory_order_relaxed);
  }
  *(void *)(result + 48) = 0;
  *(void *)(result + 40) = 0;
  *(void *)(result + 32) = result + 40;
  return result;
}

uint64_t awd::AWDTriggerFilter::isMetricSetAsTrigger(awd::AWDTriggerFilter *this, unsigned int a2)
{
  id v2 = (uint64_t *)*((void *)this + 5);
  if (!v2) {
    return 0;
  }
  while (1)
  {
    unsigned int v3 = *((_DWORD *)v2 + 8);
    if (v3 <= a2) {
      break;
    }
LABEL_5:
    id v2 = (uint64_t *)*v2;
    if (!v2) {
      return 0;
    }
  }
  if (v3 < a2)
  {
    ++v2;
    goto LABEL_5;
  }
  return 1;
}

uint64_t awd::AWDTriggerFilter::shouldSubmitMetricAsTrigger(awd::AWDTriggerFilter *this, unsigned int a2)
{
  xpc_object_t v4 = (char *)*((void *)this + 5);
  id v2 = (char *)this + 40;
  unsigned int v3 = v4;
  if (!v4) {
    return 0;
  }
  int v5 = v2;
  do
  {
    unsigned int v6 = *((_DWORD *)v3 + 8);
    BOOL v7 = v6 >= a2;
    if (v6 >= a2) {
      unsigned int v8 = (char **)v3;
    }
    else {
      unsigned int v8 = (char **)(v3 + 8);
    }
    if (v7) {
      int v5 = v3;
    }
    unsigned int v3 = *v8;
  }
  while (*v8);
  if (v5 == v2 || *((_DWORD *)v5 + 8) > a2) {
    return 0;
  }
  if (*((_DWORD *)v5 + 22)) {
    return 2;
  }
  return 1;
}

BOOL awd::AWDTriggerFilter::evaluateRandomSamplingForTrigger(awd::AWDTriggerFilter *this, unsigned int a2)
{
  v16[2] = *(std::__shared_weak_count **)MEMORY[0x1E4F143B8];
  uint64_t v2 = *((void *)this + 5);
  if (!v2) {
    return 0;
  }
  int v5 = (_DWORD *)((char *)this + 40);
  do
  {
    unsigned int v6 = *(_DWORD *)(v2 + 32);
    BOOL v7 = v6 >= a2;
    if (v6 >= a2) {
      unsigned int v8 = (uint64_t *)v2;
    }
    else {
      unsigned int v8 = (uint64_t *)(v2 + 8);
    }
    if (v7) {
      int v5 = (_DWORD *)v2;
    }
    uint64_t v2 = *v8;
  }
  while (*v8);
  if (v5 == (_DWORD *)((char *)this + 40) || v5[8] > a2 || !v5[22]) {
    return 0;
  }
  PRNGenerator::get(&v15);
  unsigned int PRN10000 = PRNGenerator::generatePRN10000(v15);
  if (v16[0]) {
    sub_1D3E1D148(v16[0]);
  }
  unsigned int v10 = v5[22];
  BOOL v11 = PRN10000 <= v10;
  uint64_t v12 = *(NSObject **)this;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = "is skip";
    if (PRN10000 <= v10) {
      uint64_t v13 = "is keep";
    }
    LODWORD(v15) = 67109378;
    HIDWORD(v15) = a2;
    LOWORD(v16[0]) = 2080;
    *(std::__shared_weak_count **)((char *)v16 + 2) = (std::__shared_weak_count *)v13;
    _os_log_impl(&dword_1D3E18000, v12, OS_LOG_TYPE_INFO, "client.trigger:#I Random sample for 0x%x %s", (uint8_t *)&v15, 0x12u);
  }
  return v11;
}

void sub_1D3E295A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_1D3E1D148(a10);
  }
  _Unwind_Resume(exception_object);
}

void awd::AWDTriggerFilter::setConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  xpc_object_t v4 = (void *)(a1 + 40);
  v57 = (uint64_t **)(a1 + 32);
  sub_1D3E2A068(a1 + 32, *(void **)(a1 + 40));
  *(v4 - 1) = v4;
  void *v4 = 0;
  v4[1] = 0;
  int v5 = (std::__shared_weak_count *)*(v4 - 2);
  if (!v5)
  {
    BOOL v7 = 0;
    goto LABEL_64;
  }
  unsigned int v6 = std::__shared_weak_count::lock(v5);
  BOOL v7 = v6;
  if (!v6 || (uint64_t v56 = *(void **)(a1 + 16)) == 0)
  {
LABEL_64:
    long long v54 = *(NSObject **)a1;
    if (os_log_type_enabled(*(os_log_t *)a1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1D3E18000, v54, OS_LOG_TYPE_DEFAULT, "client.trigger:#E Unable to set configuration because AWDServerFacade is no longer valid.", buf, 2u);
    }
    goto LABEL_66;
  }
  uint64_t v55 = v6;
  v63[0] = 0;
  v63[1] = 0;
  v62 = (uint64_t *)v63;
  unsigned int v8 = *(NSObject **)a1;
  if (os_log_type_enabled(*(os_log_t *)a1, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = *(_DWORD *)(a1 + 8);
    int v10 = *(_DWORD *)(*(void *)a2 + 16);
    *(_DWORD *)long long buf = 67109376;
    *(_DWORD *)&uint8_t buf[4] = v9;
    __int16 v65 = 1024;
    int v66 = v10;
    _os_log_impl(&dword_1D3E18000, v8, OS_LOG_TYPE_DEFAULT, "client.trigger:#N CCFG for cid 0x%x has # of profiles: %d", buf, 0xEu);
  }
  uint64_t v11 = *(int *)(*(void *)a2 + 16);
  if (v11)
  {
    uint64_t v12 = 0;
    uint64_t v13 = *(uint64_t **)(*(void *)a2 + 8);
    BOOL v14 = &v13[v11];
    do
    {
      uint64_t v15 = *v13;
      int v16 = *(_DWORD *)(*v13 + 132);
      if (v16)
      {
        int v18 = *(_DWORD *)(v15 + 8);
        if ((v16 & 8) != 0) {
          goto LABEL_14;
        }
      }
      else
      {
        uint64_t v17 = *(NSObject **)a1;
        int v18 = 0;
        if (os_log_type_enabled(*(os_log_t *)a1, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1D3E18000, v17, OS_LOG_TYPE_DEFAULT, "client.trigger:#E Got profile with no id!", buf, 2u);
          int v18 = 0;
          int v16 = *(_DWORD *)(v15 + 132);
        }
        if ((v16 & 8) != 0)
        {
LABEL_14:
          int v61 = *(_DWORD *)(v15 + 32);
          *(void *)long long buf = &v61;
          uint64_t v19 = sub_1D3E2A11C(v57, (unsigned int *)&v61, (uint64_t)&unk_1D3E52830, (_DWORD **)buf);
          uint64_t v20 = v19;
          int v21 = (char *)v19[6];
          uint64_t v22 = (uint64_t)(v19 + 7);
          uint64_t v23 = v19[7];
          if (v21 >= (char *)v23)
          {
            uint64_t v25 = v19[5];
            uint64_t v26 = (v21 - (char *)v25) >> 2;
            if ((unint64_t)(v26 + 1) >> 62) {
              sub_1D3E1AE60();
            }
            unint64_t v27 = (char *)v23 - (char *)v25;
            unint64_t v28 = ((char *)v23 - (char *)v25) >> 1;
            if (v28 <= v26 + 1) {
              unint64_t v28 = v26 + 1;
            }
            if (v27 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v29 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v29 = v28;
            }
            if (v29)
            {
              uint64_t v30 = (char *)sub_1D3E1D1BC(v22, v29);
              uint64_t v25 = v20[5];
              int v21 = (char *)v20[6];
            }
            else
            {
              uint64_t v30 = 0;
            }
            uint64_t v31 = &v30[4 * v26];
            *(_DWORD *)uint64_t v31 = v18;
            uint64_t v24 = (uint64_t *)(v31 + 4);
            while (v21 != (char *)v25)
            {
              int v32 = *((_DWORD *)v21 - 1);
              v21 -= 4;
              *((_DWORD *)v31 - 1) = v32;
              v31 -= 4;
            }
            v20[5] = (uint64_t *)v31;
            v20[6] = v24;
            v20[7] = (uint64_t *)&v30[4 * v29];
            if (v25) {
              operator delete(v25);
            }
          }
          else
          {
            *(_DWORD *)int v21 = v18;
            uint64_t v24 = (uint64_t *)(v21 + 4);
          }
          v20[6] = v24;
          if ((*(unsigned char *)(v15 + 133) & 2) != 0) {
            *((_DWORD *)v20 + 22) = *(_DWORD *)(v15 + 80);
          }
          uint64_t v33 = *(int *)(v15 + 48);
          if (v33)
          {
            __int16 v34 = *(uint64_t **)(v15 + 40);
            int v35 = &v34[v33];
            uint64_t v36 = (void **)(v20 + 8);
            do
            {
              uint64_t v37 = *v34;
              int v38 = *(_DWORD *)(*v34 + 128);
              if (v38)
              {
                unsigned int v60 = *(_DWORD *)(v37 + 8);
                if ((v38 & 0x20) != 0)
                {
                  int v39 = *(_DWORD *)(v37 + 28);
                  *(void *)long long buf = &v60;
                  int v40 = sub_1D3E29298(&v62, &v60, (uint64_t)&unk_1D3E52830, (unsigned int **)buf);
                  *((_DWORD *)v40 + 8) += v39;
                  int v38 = *(_DWORD *)(v37 + 128);
                }
                if ((v38 & 0x80) != 0 && v12 <= *(int *)(v37 + 36)) {
                  uint64_t v12 = *(int *)(v37 + 36);
                }
                if ((v38 & 0x100) != 0 && *(unsigned char *)(v37 + 40))
                {
                  int v42 = (char *)v20[9];
                  unint64_t v41 = (unint64_t)v20[10];
                  if ((unint64_t)v42 >= v41)
                  {
                    int v44 = (char *)*v36;
                    uint64_t v45 = (v42 - (unsigned char *)*v36) >> 2;
                    unint64_t v46 = v45 + 1;
                    if ((unint64_t)(v45 + 1) >> 62) {
                      sub_1D3E1AE60();
                    }
                    uint64_t v47 = v41 - (void)v44;
                    if (v47 >> 1 > v46) {
                      unint64_t v46 = v47 >> 1;
                    }
                    if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFFCLL) {
                      unint64_t v48 = 0x3FFFFFFFFFFFFFFFLL;
                    }
                    else {
                      unint64_t v48 = v46;
                    }
                    if (v48)
                    {
                      __int16 v49 = (char *)sub_1D3E1D1BC((uint64_t)(v20 + 10), v48);
                      int v44 = (char *)v20[8];
                      int v42 = (char *)v20[9];
                    }
                    else
                    {
                      __int16 v49 = 0;
                    }
                    uint64_t v50 = &v49[4 * v45];
                    *(_DWORD *)uint64_t v50 = v60;
                    uint32_t v43 = (uint64_t *)(v50 + 4);
                    while (v42 != v44)
                    {
                      int v51 = *((_DWORD *)v42 - 1);
                      v42 -= 4;
                      *((_DWORD *)v50 - 1) = v51;
                      v50 -= 4;
                    }
                    v20[8] = (uint64_t *)v50;
                    v20[9] = v43;
                    v20[10] = (uint64_t *)&v49[4 * v48];
                    if (v44) {
                      operator delete(v44);
                    }
                  }
                  else
                  {
                    *(_DWORD *)int v42 = v60;
                    uint32_t v43 = (uint64_t *)(v42 + 4);
                  }
                  v20[9] = v43;
                }
              }
              ++v34;
            }
            while (v34 != v35);
          }
          int v52 = *(_DWORD *)(a1 + 8);
          int v53 = v61;
          sub_1D3E2A26C(v59, (uint64_t)&v62);
          awd::AWDRegisterTriggerMessage::AWDRegisterTriggerMessage((uint64_t)buf, v52, v53, v59, v12);
          sub_1D3E20F64((uint64_t)v59, (void *)v59[1]);
          awd::AWDRegisterTriggerMessage::createXpcMessage((awd::AWDRegisterTriggerMessage *)buf, &object);
          awd::AWDServerFacade::sendMessage(v56, &object);
        }
      }
      ++v13;
    }
    while (v13 != v14);
  }
  sub_1D3E20F64((uint64_t)&v62, v63[0]);
  BOOL v7 = v55;
LABEL_66:
  if (v7) {
    sub_1D3E1D148(v7);
  }
}

void sub_1D3E29AB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::__shared_weak_count *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, xpc_object_t object, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
}

char *awd::AWDTriggerFilter::profileIdForTriggerId@<X0>(awd::AWDTriggerFilter *this@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  uint64_t v5 = *((void *)this + 5);
  uint64_t result = (char *)this + 40;
  uint64_t v4 = v5;
  if (v5)
  {
    BOOL v7 = result;
    do
    {
      unsigned int v8 = *(_DWORD *)(v4 + 32);
      BOOL v9 = v8 >= a2;
      if (v8 >= a2) {
        int v10 = (uint64_t *)v4;
      }
      else {
        int v10 = (uint64_t *)(v4 + 8);
      }
      if (v9) {
        BOOL v7 = (char *)v4;
      }
      uint64_t v4 = *v10;
    }
    while (*v10);
    if (v7 != result && *((_DWORD *)v7 + 8) <= a2 && v7 + 40 != (char *)a3) {
      return sub_1D3E2A580((char *)a3, *((char **)v7 + 5), *((void *)v7 + 6), (uint64_t)(*((void *)v7 + 6) - *((void *)v7 + 5)) >> 2);
    }
  }
  return result;
}

void sub_1D3E29BD0(_Unwind_Exception *exception_object)
{
  unsigned int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void awd::AWDTriggerFilter::getAllTriggers(awd::AWDTriggerFilter *this@<X0>, char **a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  uint64_t v2 = (char *)*((void *)this + 4);
  unsigned int v3 = (char *)this + 40;
  if (v2 != (char *)this + 40)
  {
    uint64_t v5 = 0;
    unsigned int v6 = a2 + 2;
    do
    {
      if ((unint64_t)v5 >= *v6)
      {
        BOOL v7 = *a2;
        uint64_t v8 = (v5 - *a2) >> 2;
        unint64_t v9 = v8 + 1;
        if ((unint64_t)(v8 + 1) >> 62) {
          sub_1D3E1AE60();
        }
        uint64_t v10 = *v6 - (void)v7;
        if (v10 >> 1 > v9) {
          unint64_t v9 = v10 >> 1;
        }
        if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v11 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v11 = v9;
        }
        if (v11)
        {
          uint64_t v12 = (char *)sub_1D3E1D1BC((uint64_t)v6, v11);
          BOOL v7 = *a2;
          uint64_t v5 = a2[1];
        }
        else
        {
          uint64_t v12 = 0;
        }
        uint64_t v13 = &v12[4 * v8];
        *(_DWORD *)uint64_t v13 = *((_DWORD *)v2 + 8);
        BOOL v14 = v13 + 4;
        while (v5 != v7)
        {
          int v15 = *((_DWORD *)v5 - 1);
          v5 -= 4;
          *((_DWORD *)v13 - 1) = v15;
          v13 -= 4;
        }
        *a2 = v13;
        a2[1] = v14;
        a2[2] = &v12[4 * v11];
        if (v7) {
          operator delete(v7);
        }
        uint64_t v5 = v14;
      }
      else
      {
        *(_DWORD *)uint64_t v5 = *((_DWORD *)v2 + 8);
        v5 += 4;
      }
      a2[1] = v5;
      int v16 = (char *)*((void *)v2 + 1);
      if (v16)
      {
        do
        {
          uint64_t v17 = v16;
          int v16 = *(char **)v16;
        }
        while (v16);
      }
      else
      {
        do
        {
          uint64_t v17 = (char *)*((void *)v2 + 2);
          BOOL v18 = *(void *)v17 == (void)v2;
          uint64_t v2 = v17;
        }
        while (!v18);
      }
      uint64_t v2 = v17;
    }
    while (v17 != v3);
  }
}

void sub_1D3E29D34(_Unwind_Exception *exception_object)
{
  unsigned int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void awd::AWDTriggerFilter::getAllQueriableMetrics(awd::AWDTriggerFilter *this@<X0>, void *a2@<X8>)
{
  v12[0] = 0;
  v12[1] = 0;
  unint64_t v11 = (uint64_t *)v12;
  unsigned int v3 = (char *)*((void *)this + 4);
  uint64_t v4 = (char *)this + 40;
  if (v3 == (char *)this + 40)
  {
    uint64_t v10 = (uint64_t *)v12;
  }
  else
  {
    do
    {
      uint64_t v5 = (unsigned int *)*((void *)v3 + 8);
      unsigned int v6 = (unsigned int *)*((void *)v3 + 9);
      while (v5 != v6)
      {
        sub_1D3E2A6D0(&v11, (uint64_t *)v12, v5, v5);
        ++v5;
      }
      BOOL v7 = (char *)*((void *)v3 + 1);
      if (v7)
      {
        do
        {
          uint64_t v8 = v7;
          BOOL v7 = *(char **)v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          uint64_t v8 = (char *)*((void *)v3 + 2);
          BOOL v9 = *(void *)v8 == (void)v3;
          unsigned int v3 = v8;
        }
        while (!v9);
      }
      unsigned int v3 = v8;
    }
    while (v8 != v4);
    uint64_t v10 = v11;
  }
  sub_1D3E2A758(a2, v10, v12);
  sub_1D3E20F64((uint64_t)&v11, v12[0]);
}

void sub_1D3E29E30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, void *a11)
{
}

char *awd::AWDTriggerFilter::getQueriableMetricsForTrigger@<X0>(awd::AWDTriggerFilter *this@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  uint64_t v5 = *((void *)this + 5);
  uint64_t result = (char *)this + 40;
  uint64_t v4 = v5;
  if (v5)
  {
    BOOL v7 = result;
    do
    {
      unsigned int v8 = *(_DWORD *)(v4 + 32);
      BOOL v9 = v8 >= a2;
      if (v8 >= a2) {
        uint64_t v10 = (uint64_t *)v4;
      }
      else {
        uint64_t v10 = (uint64_t *)(v4 + 8);
      }
      if (v9) {
        BOOL v7 = (char *)v4;
      }
      uint64_t v4 = *v10;
    }
    while (*v10);
    if (v7 != result && *((_DWORD *)v7 + 8) <= a2) {
      return sub_1D3E2A8A8((char *)a3, *((char **)v7 + 8), *((void *)v7 + 9), (uint64_t)(*((void *)v7 + 9) - *((void *)v7 + 8)) >> 2);
    }
  }
  return result;
}

void sub_1D3E29EC4(_Unwind_Exception *exception_object)
{
  unsigned int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void awd::AWDTriggerFilter::debugLog(NSObject **this)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *this;
  if (os_log_type_enabled(*this, OS_LOG_TYPE_INFO))
  {
    int v3 = *((_DWORD *)this + 2);
    *(_DWORD *)long long buf = 67109120;
    int v14 = v3;
    _os_log_impl(&dword_1D3E18000, v2, OS_LOG_TYPE_INFO, "client.trigger:#I  The following are Trigger IDs that component 0x%x expects:", buf, 8u);
  }
  uint64_t v4 = (awd::AWDTriggerFilter *)this[4];
  if (v4 != (awd::AWDTriggerFilter *)(this + 5))
  {
    do
    {
      uint64_t v5 = (int *)*((void *)v4 + 5);
      unsigned int v6 = (int *)*((void *)v4 + 6);
      while (v5 != v6)
      {
        BOOL v7 = *this;
        if (os_log_type_enabled(*this, OS_LOG_TYPE_INFO))
        {
          int v8 = *v5;
          int v9 = *((_DWORD *)v4 + 8);
          *(_DWORD *)long long buf = 67109376;
          int v14 = v8;
          __int16 v15 = 1024;
          int v16 = v9;
          _os_log_impl(&dword_1D3E18000, v7, OS_LOG_TYPE_INFO, "client.trigger:#I \t- PROFILE 0x%x TRIGGER 0x%x", buf, 0xEu);
        }
        ++v5;
      }
      uint64_t v10 = (awd::AWDTriggerFilter *)*((void *)v4 + 1);
      if (v10)
      {
        do
        {
          unint64_t v11 = v10;
          uint64_t v10 = *(awd::AWDTriggerFilter **)v10;
        }
        while (v10);
      }
      else
      {
        do
        {
          unint64_t v11 = (awd::AWDTriggerFilter *)*((void *)v4 + 2);
          BOOL v12 = *(void *)v11 == (void)v4;
          uint64_t v4 = v11;
        }
        while (!v12);
      }
      uint64_t v4 = v11;
    }
    while (v11 != (awd::AWDTriggerFilter *)(this + 5));
  }
}

void sub_1D3E2A068(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_1D3E2A068(a1, *a2);
    sub_1D3E2A068(a1, a2[1]);
    sub_1D3E2A0C4(a2 + 4);
    operator delete(a2);
  }
}

void sub_1D3E2A0C4(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  if (v2)
  {
    a1[5] = v2;
    operator delete(v2);
  }
  int v3 = (void *)a1[1];
  if (v3)
  {
    a1[2] = v3;
    operator delete(v3);
  }
}

uint64_t **sub_1D3E2A11C(uint64_t **a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  BOOL v7 = a1 + 1;
  unsigned int v6 = a1[1];
  int v8 = a1 + 1;
  int v9 = a1 + 1;
  if (v6)
  {
    unsigned int v10 = *a2;
    while (1)
    {
      while (1)
      {
        int v9 = (uint64_t **)v6;
        unsigned int v11 = *((_DWORD *)v6 + 8);
        if (v10 >= v11) {
          break;
        }
        unsigned int v6 = *v9;
        int v8 = v9;
        if (!*v9) {
          goto LABEL_9;
        }
      }
      if (v11 >= v10) {
        break;
      }
      unsigned int v6 = v9[1];
      if (!v6)
      {
        int v8 = v9 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    BOOL v12 = (char *)operator new(0x60uLL);
    v14[1] = v7;
    *((_DWORD *)v12 + 8) = **a4;
    *((void *)v12 + 11) = 0;
    *(_OWORD *)(v12 + 72) = 0u;
    *(_OWORD *)(v12 + 56) = 0u;
    *(_OWORD *)(v12 + 40) = 0u;
    char v15 = 1;
    sub_1D3E21220(a1, (uint64_t)v9, v8, (uint64_t *)v12);
    v14[0] = 0;
    sub_1D3E2A214((uint64_t)v14, 0);
    return (uint64_t **)v12;
  }
  return v9;
}

void sub_1D3E2A214(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      sub_1D3E2A0C4(v2 + 4);
    }
    operator delete(v2);
  }
}

uint64_t *sub_1D3E2A26C(uint64_t *a1, uint64_t a2)
{
  a1[2] = 0;
  a1[1] = 0;
  *a1 = (uint64_t)(a1 + 1);
  sub_1D3E2A2C4(a1, *(unsigned int **)a2, (unsigned int *)(a2 + 8));
  return a1;
}

void sub_1D3E2A2AC(_Unwind_Exception *a1)
{
  sub_1D3E20F64(v1, *(void **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *sub_1D3E2A2C4(uint64_t *result, unsigned int *a2, unsigned int *a3)
{
  if (a2 != a3)
  {
    uint64_t v4 = a2;
    uint64_t v5 = (uint64_t **)result;
    unsigned int v6 = result + 1;
    do
    {
      uint64_t result = sub_1D3E2A350(v5, v6, v4 + 7, (uint64_t *)(v4 + 7));
      BOOL v7 = (unsigned int *)*((void *)v4 + 1);
      if (v7)
      {
        do
        {
          int v8 = v7;
          BOOL v7 = *(unsigned int **)v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          int v8 = (unsigned int *)*((void *)v4 + 2);
          BOOL v9 = *(void *)v8 == (void)v4;
          uint64_t v4 = v8;
        }
        while (!v9);
      }
      uint64_t v4 = v8;
    }
    while (v8 != a3);
  }
  return result;
}

uint64_t *sub_1D3E2A350(uint64_t **a1, uint64_t *a2, unsigned int *a3, uint64_t *a4)
{
  unsigned int v6 = sub_1D3E2A3D8(a1, a2, &v11, &v10, a3);
  BOOL v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    int v8 = (uint64_t **)v6;
    BOOL v7 = (uint64_t *)operator new(0x28uLL);
    *(uint64_t *)((char *)v7 + 28) = *a4;
    sub_1D3E21220(a1, (uint64_t)v11, v8, v7);
  }
  return v7;
}

uint64_t *sub_1D3E2A3D8(void *a1, uint64_t *a2, uint64_t **a3, uint64_t *a4, unsigned int *a5)
{
  uint64_t v5 = a1 + 1;
  if (a1 + 1 == a2 || (v6 = *a5, unsigned int v7 = *((_DWORD *)a2 + 7), *a5 < v7))
  {
    int v8 = (uint64_t *)*a2;
    if ((uint64_t *)*a1 == a2)
    {
      uint64_t v10 = a2;
LABEL_17:
      if (v8)
      {
        *a3 = v10;
        return v10 + 1;
      }
      else
      {
        *a3 = a2;
        return a2;
      }
    }
    if (v8)
    {
      BOOL v9 = (uint64_t *)*a2;
      do
      {
        uint64_t v10 = v9;
        BOOL v9 = (uint64_t *)v9[1];
      }
      while (v9);
    }
    else
    {
      uint64_t v13 = a2;
      do
      {
        uint64_t v10 = (uint64_t *)v13[2];
        BOOL v14 = *v10 == (void)v13;
        uint64_t v13 = v10;
      }
      while (v14);
    }
    unsigned int v15 = *a5;
    if (*((_DWORD *)v10 + 7) < *a5) {
      goto LABEL_17;
    }
    uint64_t v16 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          uint64_t v17 = (uint64_t *)v16;
          unsigned int v18 = *(_DWORD *)(v16 + 28);
          if (v15 >= v18) {
            break;
          }
          uint64_t v16 = *v17;
          uint64_t v5 = v17;
          if (!*v17) {
            goto LABEL_29;
          }
        }
        if (v18 >= v15) {
          break;
        }
        uint64_t v5 = v17 + 1;
        uint64_t v16 = v17[1];
      }
      while (v16);
    }
    else
    {
      uint64_t v17 = a1 + 1;
    }
LABEL_29:
    *a3 = v17;
    return v5;
  }
  if (v7 >= v6)
  {
    *a3 = a2;
    *a4 = (uint64_t)a2;
    return a4;
  }
  uint64_t v11 = a2[1];
  if (v11)
  {
    BOOL v12 = (uint64_t *)a2[1];
    do
    {
      a4 = v12;
      BOOL v12 = (uint64_t *)*v12;
    }
    while (v12);
  }
  else
  {
    uint64_t v19 = a2;
    do
    {
      a4 = (uint64_t *)v19[2];
      BOOL v14 = *a4 == (void)v19;
      uint64_t v19 = a4;
    }
    while (!v14);
  }
  if (a4 != v5 && v6 >= *((_DWORD *)a4 + 7))
  {
    uint64_t v20 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          int v21 = (uint64_t *)v20;
          unsigned int v22 = *(_DWORD *)(v20 + 28);
          if (v6 >= v22) {
            break;
          }
          uint64_t v20 = *v21;
          uint64_t v5 = v21;
          if (!*v21) {
            goto LABEL_48;
          }
        }
        if (v22 >= v6) {
          break;
        }
        uint64_t v5 = v21 + 1;
        uint64_t v20 = v21[1];
      }
      while (v20);
    }
    else
    {
      int v21 = a1 + 1;
    }
LABEL_48:
    *a3 = v21;
    return v5;
  }
  if (v11)
  {
    *a3 = a4;
  }
  else
  {
    *a3 = a2;
    return a2 + 1;
  }
  return a4;
}

char *sub_1D3E2A580(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  unsigned int v7 = result;
  uint64_t v8 = *((void *)result + 2);
  BOOL v9 = *(char **)result;
  if (a4 > (v8 - *(void *)result) >> 2)
  {
    if (v9)
    {
      *((void *)result + 1) = v9;
      operator delete(v9);
      uint64_t v8 = 0;
      *unsigned int v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 62) {
      sub_1D3E1AE60();
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
    uint64_t result = sub_1D3E2A68C(v7, v11);
    uint64_t v13 = (char *)v7[1];
    BOOL v12 = (void **)(v7 + 1);
    BOOL v9 = v13;
LABEL_16:
    size_t v17 = a3 - (void)__src;
    if (v17)
    {
      unsigned int v18 = v9;
      uint64_t v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  BOOL v12 = (void **)(result + 8);
  BOOL v14 = (unsigned char *)*((void *)result + 1);
  unint64_t v15 = (v14 - v9) >> 2;
  if (v15 >= a4) {
    goto LABEL_16;
  }
  uint64_t v16 = &__src[4 * v15];
  if (v14 != v9)
  {
    uint64_t result = (char *)memmove(*(void **)result, __src, v14 - v9);
    BOOL v9 = (char *)*v12;
  }
  size_t v17 = a3 - (void)v16;
  if (v17)
  {
    unsigned int v18 = v9;
    uint64_t v19 = v16;
LABEL_18:
    uint64_t result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  uint64_t *v12 = &v9[v17];
  return result;
}

char *sub_1D3E2A68C(void *a1, unint64_t a2)
{
  if (a2 >> 62) {
    sub_1D3E1AE60();
  }
  uint64_t result = (char *)sub_1D3E1D1BC((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

uint64_t *sub_1D3E2A6D0(uint64_t **a1, uint64_t *a2, unsigned int *a3, _DWORD *a4)
{
  unsigned int v6 = sub_1D3E2A3D8(a1, a2, &v11, &v10, a3);
  unsigned int v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    uint64_t v8 = (uint64_t **)v6;
    unsigned int v7 = (uint64_t *)operator new(0x20uLL);
    *((_DWORD *)v7 + 7) = *a4;
    sub_1D3E21220(a1, (uint64_t)v11, v8, v7);
  }
  return v7;
}

void *sub_1D3E2A758(void *a1, void *a2, void *a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2 == a3)
  {
    unint64_t v4 = 0;
  }
  else
  {
    unint64_t v4 = 0;
    uint64_t v5 = a2;
    do
    {
      unsigned int v6 = (void *)v5[1];
      if (v6)
      {
        do
        {
          unsigned int v7 = v6;
          unsigned int v6 = (void *)*v6;
        }
        while (v6);
      }
      else
      {
        do
        {
          unsigned int v7 = (void *)v5[2];
          BOOL v8 = *v7 == (void)v5;
          uint64_t v5 = v7;
        }
        while (!v8);
      }
      ++v4;
      uint64_t v5 = v7;
    }
    while (v7 != a3);
  }
  sub_1D3E2A7E0(a1, a2, a3, v4);
  return a1;
}

void *sub_1D3E2A7E0(void *result, void *a2, void *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = (uint64_t)result;
    sub_1D3E2A68C(result, a4);
    return (void *)sub_1D3E2A850(v6, a2, a3);
  }
  return result;
}

void sub_1D3E2A834(_Unwind_Exception *exception_object)
{
  int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1D3E2A850(uint64_t result, void *a2, void *a3)
{
  int v3 = *(_DWORD **)(result + 8);
  if (a2 != a3)
  {
    do
    {
      _DWORD *v3 = *((_DWORD *)a2 + 7);
      unint64_t v4 = (void *)a2[1];
      if (v4)
      {
        do
        {
          uint64_t v5 = v4;
          unint64_t v4 = (void *)*v4;
        }
        while (v4);
      }
      else
      {
        do
        {
          uint64_t v5 = (void *)a2[2];
          BOOL v6 = *v5 == (void)a2;
          a2 = v5;
        }
        while (!v6);
      }
      ++v3;
      a2 = v5;
    }
    while (v5 != a3);
  }
  *(void *)(result + 8) = v3;
  return result;
}

char *sub_1D3E2A8A8(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  unsigned int v7 = result;
  uint64_t v8 = *((void *)result + 2);
  BOOL v9 = *(char **)result;
  if (a4 > (v8 - *(void *)result) >> 2)
  {
    if (v9)
    {
      *((void *)result + 1) = v9;
      operator delete(v9);
      uint64_t v8 = 0;
      *unsigned int v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 62) {
      sub_1D3E1AE60();
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
    uint64_t result = sub_1D3E2A68C(v7, v11);
    uint64_t v13 = (char *)v7[1];
    BOOL v12 = (void **)(v7 + 1);
    BOOL v9 = v13;
LABEL_16:
    size_t v17 = a3 - (void)__src;
    if (v17)
    {
      unsigned int v18 = v9;
      uint64_t v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  BOOL v12 = (void **)(result + 8);
  BOOL v14 = (unsigned char *)*((void *)result + 1);
  unint64_t v15 = (v14 - v9) >> 2;
  if (v15 >= a4) {
    goto LABEL_16;
  }
  uint64_t v16 = &__src[4 * v15];
  if (v14 != v9)
  {
    uint64_t result = (char *)memmove(*(void **)result, __src, 4 * v15);
    BOOL v9 = (char *)*v12;
  }
  size_t v17 = a3 - (void)v16;
  if (v17)
  {
    unsigned int v18 = v9;
    uint64_t v19 = v16;
LABEL_18:
    uint64_t result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  uint64_t *v12 = &v9[v17];
  return result;
}

uint64_t sGetTimestampFieldForMetricId(int a1)
{
  switch(HIWORD(a1))
  {
    case 7u:
      if (a1 == 458758) {
        unsigned int v2 = 4;
      }
      else {
        unsigned int v2 = 1;
      }
      BOOL v3 = a1 == 458752;
      unsigned int v4 = 3;
      goto LABEL_22;
    case 8u:
      int v7 = a1 - 0x80000;
      uint64_t result = 2;
      switch(v7)
      {
        case 0:
        case 2:
        case 11:
        case 12:
        case 13:
        case 14:
        case 15:
        case 16:
        case 19:
        case 25:
        case 64:
        case 65:
          return 4;
        case 1:
        case 5:
        case 31:
        case 32:
        case 33:
        case 34:
        case 35:
        case 36:
        case 37:
        case 38:
        case 39:
        case 40:
        case 41:
          goto LABEL_15;
        case 3:
        case 7:
        case 26:
        case 27:
        case 30:
        case 43:
        case 44:
        case 45:
        case 46:
        case 47:
        case 48:
        case 49:
        case 50:
        case 51:
        case 52:
        case 53:
        case 54:
        case 55:
        case 56:
        case 57:
        case 58:
        case 59:
        case 60:
        case 61:
        case 62:
        case 63:
        case 66:
        case 67:
        case 68:
        case 69:
        case 70:
        case 71:
        case 72:
        case 73:
        case 74:
        case 75:
        case 76:
        case 77:
        case 78:
        case 79:
        case 80:
        case 81:
        case 82:
        case 83:
        case 84:
        case 85:
        case 86:
          return 1;
        case 4:
        case 24:
          return 6;
        case 6:
        case 20:
        case 28:
        case 29:
        case 87:
          return result;
        case 8:
        case 10:
        case 21:
        case 23:
        case 42:
          return 8;
        case 9:
          return 7;
        case 17:
        case 18:
        case 22:
          return 5;
        default:
          if (a1 != 524484) {
            return 1;
          }
LABEL_15:
          uint64_t result = 3;
          break;
      }
      return result;
    case 9u:
      int v8 = a1 - 589828;
      if ((a1 - 589828) >= 4) {
        return 1;
      }
      BOOL v9 = (unsigned int *)&unk_1D3E52840;
      return v9[v8];
    case 0xAu:
    case 0xBu:
    case 0xCu:
    case 0xEu:
    case 0xFu:
    case 0x12u:
    case 0x14u:
    case 0x15u:
    case 0x16u:
      return 1;
    case 0xDu:
      if (a1 == 851968) {
        unsigned int v2 = 8;
      }
      else {
        unsigned int v2 = 1;
      }
      BOOL v3 = a1 == 851969;
      unsigned int v4 = 6;
LABEL_22:
      if (v3) {
        return v4;
      }
      else {
        return v2;
      }
    case 0x10u:
      int v8 = a1 - 1048579;
      if ((a1 - 1048579) >= 0x28) {
        return 1;
      }
      BOOL v9 = (unsigned int *)&unk_1D3E52850;
      return v9[v8];
    case 0x11u:
      int v8 = a1 - 1114113;
      if ((a1 - 1114113) >= 0x30) {
        return 1;
      }
      BOOL v9 = (unsigned int *)&unk_1D3E528F0;
      return v9[v8];
    case 0x13u:
      if (((a1 - 1245185) & 0xFFFFFFE8) != 0) {
        return 1;
      }
      else {
        return 2;
      }
    case 0x17u:
      uint64_t result = 2;
      if (a1 > 1508098)
      {
        if ((a1 - 1508099) >= 2 && (a1 - 1508355) >= 2)
        {
          unsigned int v10 = a1 - 1508611;
          goto LABEL_46;
        }
      }
      else if ((a1 - 1507329) >= 2 && (a1 - 1507587) >= 2)
      {
        unsigned int v10 = a1 - 1507843;
        goto LABEL_46;
      }
      return result;
    case 0x18u:
      uint64_t result = 2;
      if (a1 <= 1573632)
      {
        if ((a1 - 1573121) < 2) {
          return result;
        }
        unsigned int v10 = a1 - 1573377;
      }
      else
      {
        if ((a1 - 1573633) < 2 || (a1 - 1573889) < 2) {
          return result;
        }
        unsigned int v10 = a1 - 1574145;
      }
LABEL_46:
      if (v10 >= 2) {
        return 1;
      }
      return result;
    default:
      if (HIWORD(a1) != 34) {
        return 1;
      }
      if ((a1 - 2228992) > 5)
      {
        if (a1 == 2229249) {
          return 4;
        }
        else {
          return 1;
        }
      }
      else
      {
        if (((1 << a1) & 0xC) != 0) {
          unsigned int v5 = 14;
        }
        else {
          unsigned int v5 = 22;
        }
        if (((1 << a1) & 3) != 0) {
          return 17;
        }
        else {
          return v5;
        }
      }
  }
}

uint64_t awd::metrics::protobuf_ShutdownFile_SimpleMetric_2eproto(awd::metrics *this)
{
  uint64_t result = awd::metrics::SimpleMetric::default_instance_;
  if (awd::metrics::SimpleMetric::default_instance_) {
    return (*(uint64_t (**)(void))(*(void *)awd::metrics::SimpleMetric::default_instance_ + 8))();
  }
  return result;
}

uint64_t awd::metrics::SimpleMetric::SimpleMetric(uint64_t this)
{
  *(void *)this = &unk_1F2B9AE88;
  *(void *)(this + 8) = 0;
  *(void *)(this + 16) = 0;
  *(void *)(this + 24) = 0;
  uint64_t v1 = MEMORY[0x1E4FBA920];
  *(_DWORD *)(this + 32) = 0;
  *(void *)(this + 40) = v1;
  *(void *)(this + 48) = 0;
  *(unsigned char *)(this + 36) = 0;
  return this;
}

{
  uint64_t v1;

  *(void *)this = &unk_1F2B9AE88;
  *(void *)(this + 8) = 0;
  *(void *)(this + 16) = 0;
  *(void *)(this + 24) = 0;
  uint64_t v1 = MEMORY[0x1E4FBA920];
  *(_DWORD *)(this + 32) = 0;
  *(void *)(this + 40) = v1;
  *(void *)(this + 48) = 0;
  *(unsigned char *)(this + 36) = 0;
  return this;
}

uint64_t awd::metrics::SimpleMetric::SharedCtor(uint64_t this)
{
  *(void *)(this + 8) = 0;
  *(void *)(this + 16) = 0;
  *(_DWORD *)(this + 32) = 0;
  *(void *)(this + 24) = 0;
  *(void *)(this + 40) = MEMORY[0x1E4FBA920];
  *(void *)(this + 48) = 0;
  *(unsigned char *)(this + 36) = 0;
  return this;
}

awd::metrics::SimpleMetric *awd::metrics::SimpleMetric::SimpleMetric(awd::metrics::SimpleMetric *this, const awd::metrics::SimpleMetric *a2)
{
  *(void *)this = &unk_1F2B9AE88;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  *((_DWORD *)this + 8) = 0;
  *((void *)this + 5) = MEMORY[0x1E4FBA920];
  *((void *)this + 6) = 0;
  *((unsigned char *)this + 36) = 0;
  awd::metrics::SimpleMetric::MergeFrom(this, a2);
  return this;
}

void sub_1D3E2AF08(_Unwind_Exception *a1)
{
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(v1);
  _Unwind_Resume(a1);
}

void awd::metrics::SimpleMetric::MergeFrom(awd::metrics::SimpleMetric *this, const awd::metrics::SimpleMetric *a2)
{
  if (a2 == this)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v12);
  }
  LOBYTE(v4) = *((unsigned char *)a2 + 52);
  if (!(_BYTE)v4) {
    return;
  }
  if (*((unsigned char *)a2 + 52))
  {
    uint64_t v6 = *((void *)a2 + 1);
    *((_DWORD *)this + 13) |= 1u;
    *((void *)this + 1) = v6;
    int v4 = *((_DWORD *)a2 + 13);
    if ((v4 & 2) == 0)
    {
LABEL_6:
      if ((v4 & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)a2 + 52) & 2) == 0)
  {
    goto LABEL_6;
  }
  int v7 = *((_DWORD *)a2 + 8);
  *((_DWORD *)this + 13) |= 2u;
  *((_DWORD *)this + 8) = v7;
  int v4 = *((_DWORD *)a2 + 13);
  if ((v4 & 4) == 0)
  {
LABEL_7:
    if ((v4 & 8) == 0) {
      goto LABEL_8;
    }
LABEL_15:
    uint64_t v9 = *((void *)a2 + 3);
    *((_DWORD *)this + 13) |= 8u;
    *((void *)this + 3) = v9;
    int v4 = *((_DWORD *)a2 + 13);
    if ((v4 & 0x10) == 0)
    {
LABEL_9:
      if ((v4 & 0x20) == 0) {
        return;
      }
      goto LABEL_10;
    }
    goto LABEL_16;
  }
LABEL_14:
  uint64_t v8 = *((void *)a2 + 2);
  *((_DWORD *)this + 13) |= 4u;
  *((void *)this + 2) = v8;
  int v4 = *((_DWORD *)a2 + 13);
  if ((v4 & 8) != 0) {
    goto LABEL_15;
  }
LABEL_8:
  if ((v4 & 0x10) == 0) {
    goto LABEL_9;
  }
LABEL_16:
  unsigned int v10 = (const std::string *)*((void *)a2 + 5);
  *((_DWORD *)this + 13) |= 0x10u;
  unint64_t v11 = (std::string *)*((void *)this + 5);
  if (v11 == (std::string *)MEMORY[0x1E4FBA920]) {
    operator new();
  }
  std::string::operator=(v11, v10);
  if ((*((_DWORD *)a2 + 13) & 0x20) != 0)
  {
LABEL_10:
    char v5 = *((unsigned char *)a2 + 36);
    *((_DWORD *)this + 13) |= 0x20u;
    *((unsigned char *)this + 36) = v5;
  }
}

void sub_1D3E2B094(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)va);
  _Unwind_Resume(a1);
}

void awd::metrics::SimpleMetric::~SimpleMetric(awd::metrics::SimpleMetric *this)
{
  *(void *)this = &unk_1F2B9AE88;
  awd::metrics::SimpleMetric::SharedDtor((uint64_t)this);
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(this);
}

{
  uint64_t vars8;

  *(void *)this = &unk_1F2B9AE88;
  awd::metrics::SimpleMetric::SharedDtor((uint64_t)this);
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(this);
}

{
  uint64_t vars8;

  *(void *)this = &unk_1F2B9AE88;
  awd::metrics::SimpleMetric::SharedDtor((uint64_t)this);
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(this);
  JUMPOUT(0x1D94412F0);
}

uint64_t awd::metrics::SimpleMetric::SharedDtor(uint64_t this)
{
  uint64_t v1 = *(void *)(this + 40);
  if (v1 != MEMORY[0x1E4FBA920] && v1 != 0)
  {
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
    JUMPOUT(0x1D94412F0);
  }
  return this;
}

uint64_t awd::metrics::SimpleMetric::SetCachedSize(uint64_t this, int a2)
{
  *(_DWORD *)(this + 48) = a2;
  return this;
}

uint64_t awd::metrics::SimpleMetric::default_instance(awd::metrics::SimpleMetric *this, uint64_t a2, uint64_t a3, const char *a4)
{
  uint64_t result = awd::metrics::SimpleMetric::default_instance_;
  if (!awd::metrics::SimpleMetric::default_instance_)
  {
    awd::metrics::protobuf_AddDesc_SimpleMetric_2eproto(0, a2, a3, a4);
    return awd::metrics::SimpleMetric::default_instance_;
  }
  return result;
}

void awd::metrics::SimpleMetric::New(awd::metrics::SimpleMetric *this)
{
}

uint64_t awd::metrics::SimpleMetric::Clear(uint64_t this)
{
  char v1 = *(unsigned char *)(this + 52);
  if (v1)
  {
    *(void *)(this + 8) = 0;
    *(void *)(this + 16) = 0;
    *(_DWORD *)(this + 32) = 0;
    *(void *)(this + 24) = 0;
    if ((v1 & 0x10) != 0)
    {
      uint64_t v2 = *(void *)(this + 40);
      if (v2 != MEMORY[0x1E4FBA920])
      {
        if (*(char *)(v2 + 23) < 0)
        {
          **(unsigned char **)uint64_t v2 = 0;
          *(void *)(v2 + 8) = 0;
        }
        else
        {
          *(unsigned char *)uint64_t v2 = 0;
          *(unsigned char *)(v2 + 23) = 0;
        }
      }
    }
    *(unsigned char *)(this + 36) = 0;
  }
  *(_DWORD *)(this + 52) = 0;
  return this;
}

uint64_t awd::metrics::SimpleMetric::MergePartialFromCodedStream(awd::metrics::SimpleMetric *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2)
{
  int v4 = (unint64_t *)((char *)this + 8);
  char v5 = (unint64_t *)((char *)this + 24);
  uint64_t v6 = (unsigned int *)((char *)this + 32);
  uint64_t v7 = MEMORY[0x1E4FBA920];
  while (2)
  {
    uint64_t v8 = (char *)*((void *)a2 + 1);
    if ((unint64_t)v8 >= *((void *)a2 + 2) || *v8 < 0)
    {
      unint64_t TagFallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(a2);
      *((_DWORD *)a2 + 8) = TagFallback;
      if (!TagFallback) {
        return 1;
      }
    }
    else
    {
      unint64_t TagFallback = *v8;
      *((_DWORD *)a2 + 8) = TagFallback;
      *((void *)a2 + 1) = v8 + 1;
      if (!TagFallback) {
        return 1;
      }
    }
    switch(TagFallback >> 3)
    {
      case 1u:
        int v10 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_24;
        }
        BOOL v12 = (char *)*((void *)a2 + 1);
        unint64_t v11 = *((void *)a2 + 2);
        if ((unint64_t)v12 >= v11 || *v12 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(a2, v4);
          if (!result) {
            return result;
          }
          uint64_t v13 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v11 = *((void *)a2 + 2);
        }
        else
        {
          unint64_t *v4 = *v12;
          uint64_t v13 = v12 + 1;
          *((void *)a2 + 1) = v13;
        }
        *((_DWORD *)this + 13) |= 1u;
        if ((unint64_t)v13 < v11 && *v13 == 16)
        {
          uint64_t v16 = v13 + 1;
          *((void *)a2 + 1) = v16;
          goto LABEL_32;
        }
        continue;
      case 2u:
        int v10 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_24;
        }
        uint64_t v16 = (char *)*((void *)a2 + 1);
        unint64_t v11 = *((void *)a2 + 2);
LABEL_32:
        unint64_t v28 = 0;
        if ((unint64_t)v16 >= v11 || *v16 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(a2, &v28);
          if (!result) {
            return result;
          }
          unint64_t v20 = v28;
          int v21 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v11 = *((void *)a2 + 2);
        }
        else
        {
          unint64_t v20 = *v16;
          int v21 = v16 + 1;
          *((void *)a2 + 1) = v21;
        }
        *((void *)this + 2) = v20;
        *((_DWORD *)this + 13) |= 4u;
        if ((unint64_t)v21 >= v11 || *v21 != 24) {
          continue;
        }
        size_t v17 = v21 + 1;
        *((void *)a2 + 1) = v17;
LABEL_40:
        if ((unint64_t)v17 >= v11 || *v17 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(a2, v5);
          if (!result) {
            return result;
          }
          unsigned int v22 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v11 = *((void *)a2 + 2);
        }
        else
        {
          *char v5 = *v17;
          unsigned int v22 = v17 + 1;
          *((void *)a2 + 1) = v22;
        }
        int v18 = *((_DWORD *)this + 13) | 8;
        *((_DWORD *)this + 13) = v18;
        if ((unint64_t)v22 >= v11 || *v22 != 34) {
          continue;
        }
        *((void *)a2 + 1) = v22 + 1;
LABEL_48:
        *((_DWORD *)this + 13) = v18 | 0x10;
        if (*((void *)this + 5) == v7) {
          operator new();
        }
        uint64_t result = wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadString();
        if (!result) {
          return result;
        }
        uint64_t v23 = (unsigned char *)*((void *)a2 + 1);
        unint64_t v14 = *((void *)a2 + 2);
        if ((unint64_t)v23 >= v14 || *v23 != 40) {
          continue;
        }
        uint64_t v19 = v23 + 1;
        *((void *)a2 + 1) = v19;
LABEL_54:
        unsigned int v29 = 0;
        if ((unint64_t)v19 >= v14 || (char)*v19 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v29);
          if (!result) {
            return result;
          }
          unsigned int v24 = v29;
          uint64_t v25 = (unsigned __int8 *)*((void *)a2 + 1);
          unint64_t v14 = *((void *)a2 + 2);
        }
        else
        {
          unsigned int v24 = *v19;
          uint64_t v25 = v19 + 1;
          *((void *)a2 + 1) = v25;
        }
        *((unsigned char *)this + 36) = v24 != 0;
        *((_DWORD *)this + 13) |= 0x20u;
        if ((int)v14 - (int)v25 < 2 || *v25 != 128 || v25[1] != 1) {
          continue;
        }
        unint64_t v15 = (char *)(v25 + 2);
        *((void *)a2 + 1) = v15;
        goto LABEL_63;
      case 3u:
        int v10 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_24;
        }
        size_t v17 = (char *)*((void *)a2 + 1);
        unint64_t v11 = *((void *)a2 + 2);
        goto LABEL_40;
      case 4u:
        int v10 = TagFallback & 7;
        if (v10 != 2) {
          goto LABEL_24;
        }
        int v18 = *((_DWORD *)this + 13);
        goto LABEL_48;
      case 5u:
        int v10 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_24;
        }
        uint64_t v19 = (unsigned __int8 *)*((void *)a2 + 1);
        unint64_t v14 = *((void *)a2 + 2);
        goto LABEL_54;
      default:
        if (TagFallback >> 3 == 16)
        {
          int v10 = TagFallback & 7;
          if ((TagFallback & 7) != 0) {
            goto LABEL_24;
          }
          unint64_t v15 = (char *)*((void *)a2 + 1);
          unint64_t v14 = *((void *)a2 + 2);
LABEL_63:
          if ((unint64_t)v15 >= v14 || *v15 < 0)
          {
            uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v6);
            if (!result) {
              return result;
            }
            uint64_t v26 = (unsigned __int8 *)*((void *)a2 + 1);
            unint64_t v14 = *((void *)a2 + 2);
          }
          else
          {
            unsigned int *v6 = *v15;
            uint64_t v26 = (unsigned __int8 *)(v15 + 1);
            *((void *)a2 + 1) = v26;
          }
          *((_DWORD *)this + 13) |= 2u;
          if (v26 == (unsigned __int8 *)v14 && (*((_DWORD *)a2 + 11) || *((_DWORD *)a2 + 6) == *((_DWORD *)a2 + 10)))
          {
            *((_DWORD *)a2 + 8) = 0;
            uint64_t result = 1;
            *((unsigned char *)a2 + 36) = 1;
            return result;
          }
          continue;
        }
        int v10 = TagFallback & 7;
LABEL_24:
        if (v10 != 4)
        {
          if ((wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipField(a2, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)TagFallback) & 1) == 0)return 0; {
          continue;
          }
        }
        return 1;
    }
  }
}

uint64_t awd::metrics::SimpleMetric::SerializeWithCachedSizes(uint64_t this, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  uint64_t v5 = this;
  int v6 = *(_DWORD *)(this + 52);
  if (v6)
  {
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt64((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)1, *(void *)(this + 8), (uint64_t)a2, a4);
    int v6 = *(_DWORD *)(v5 + 52);
    if ((v6 & 4) == 0)
    {
LABEL_3:
      if ((v6 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((v6 & 4) == 0)
  {
    goto LABEL_3;
  }
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt64((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)2, *(void *)(v5 + 16), (uint64_t)a2, a4);
  int v6 = *(_DWORD *)(v5 + 52);
  if ((v6 & 8) == 0)
  {
LABEL_4:
    if ((v6 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt64((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)3, *(void *)(v5 + 24), (uint64_t)a2, a4);
  int v6 = *(_DWORD *)(v5 + 52);
  if ((v6 & 0x10) == 0)
  {
LABEL_5:
    if ((v6 & 0x20) == 0) {
      goto LABEL_6;
    }
LABEL_12:
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBool((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)5, *(unsigned __int8 *)(v5 + 36), (uint64_t)a2, a4);
    if ((*(_DWORD *)(v5 + 52) & 2) == 0) {
      return this;
    }
    goto LABEL_13;
  }
LABEL_11:
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteString();
  int v6 = *(_DWORD *)(v5 + 52);
  if ((v6 & 0x20) != 0) {
    goto LABEL_12;
  }
LABEL_6:
  if ((v6 & 2) == 0) {
    return this;
  }
LABEL_13:
  uint64_t v7 = *(unsigned int *)(v5 + 32);
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)0x10, v7, (uint64_t)a2, a4);
}

uint64_t awd::metrics::SimpleMetric::ByteSize(awd::metrics::SimpleMetric *this)
{
  LOBYTE(v2) = *((unsigned char *)this + 52);
  if (!(_BYTE)v2)
  {
    uint64_t result = 0;
    goto LABEL_29;
  }
  if (*((unsigned char *)this + 52))
  {
    unsigned int v3 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64(*((wireless_diagnostics::google::protobuf::io::CodedOutputStream **)this
                                                                                     + 1))
       + 1;
    int v2 = *((_DWORD *)this + 13);
    if ((v2 & 2) == 0) {
      goto LABEL_11;
    }
  }
  else
  {
    unsigned int v3 = 0;
    if ((*((unsigned char *)this + 52) & 2) == 0) {
      goto LABEL_11;
    }
  }
  uint64_t v5 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 8);
  if (v5 >= 0x80)
  {
    int v6 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v5) + 2;
    int v2 = *((_DWORD *)this + 13);
  }
  else
  {
    int v6 = 3;
  }
  v3 += v6;
LABEL_11:
  if ((v2 & 4) == 0)
  {
    if ((v2 & 8) == 0) {
      goto LABEL_13;
    }
LABEL_16:
    v3 += wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64(*((wireless_diagnostics::google::protobuf::io::CodedOutputStream **)this
                                                                                      + 3))
        + 1;
    int v2 = *((_DWORD *)this + 13);
    if ((v2 & 0x10) == 0) {
      goto LABEL_26;
    }
LABEL_17:
    uint64_t v7 = *((void *)this + 5);
    int v8 = *(unsigned __int8 *)(v7 + 23);
    char v9 = v8;
    uint64_t v10 = *(void *)(v7 + 8);
    if ((v8 & 0x80u) == 0) {
      unint64_t v11 = *(unsigned __int8 *)(v7 + 23);
    }
    else {
      unint64_t v11 = v10;
    }
    if (v11 >= 0x80)
    {
      int v12 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v11);
      int v8 = *(unsigned __int8 *)(v7 + 23);
      uint64_t v10 = *(void *)(v7 + 8);
      int v2 = *((_DWORD *)this + 13);
      char v9 = *(unsigned char *)(v7 + 23);
    }
    else
    {
      int v12 = 1;
    }
    if (v9 < 0) {
      int v8 = v10;
    }
    v3 += v12 + v8 + 1;
    goto LABEL_26;
  }
  v3 += wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64(*((wireless_diagnostics::google::protobuf::io::CodedOutputStream **)this
                                                                                    + 2))
      + 1;
  int v2 = *((_DWORD *)this + 13);
  if ((v2 & 8) != 0) {
    goto LABEL_16;
  }
LABEL_13:
  if ((v2 & 0x10) != 0) {
    goto LABEL_17;
  }
LABEL_26:
  if ((v2 & 0x20) != 0) {
    uint64_t result = v3 + 2;
  }
  else {
    uint64_t result = v3;
  }
LABEL_29:
  *((_DWORD *)this + 12) = result;
  return result;
}

void awd::metrics::SimpleMetric::CopyFrom(awd::metrics::SimpleMetric *this, const awd::metrics::SimpleMetric *a2)
{
  if (a2 != this)
  {
    (*(void (**)(awd::metrics::SimpleMetric *))(*(void *)this + 32))(this);
    awd::metrics::SimpleMetric::MergeFrom(this, a2);
  }
}

uint64_t awd::metrics::SimpleMetric::IsInitialized(awd::metrics::SimpleMetric *this)
{
  return 1;
}

uint64_t awd::metrics::SimpleMetric::Swap(uint64_t this, awd::metrics::SimpleMetric *a2)
{
  if (a2 != (awd::metrics::SimpleMetric *)this)
  {
    uint64_t v2 = *(void *)(this + 8);
    *(void *)(this + 8) = *((void *)a2 + 1);
    *((void *)a2 + 1) = v2;
    LODWORD(v2) = *(_DWORD *)(this + 32);
    *(_DWORD *)(this + 32) = *((_DWORD *)a2 + 8);
    *((_DWORD *)a2 + 8) = v2;
    uint64_t v3 = *(void *)(this + 16);
    *(void *)(this + 16) = *((void *)a2 + 2);
    *((void *)a2 + 2) = v3;
    uint64_t v4 = *(void *)(this + 24);
    *(void *)(this + 24) = *((void *)a2 + 3);
    *((void *)a2 + 3) = v4;
    uint64_t v5 = *(void *)(this + 40);
    *(void *)(this + 40) = *((void *)a2 + 5);
    *((void *)a2 + 5) = v5;
    LOBYTE(v5) = *(unsigned char *)(this + 36);
    *(unsigned char *)(this + 36) = *((unsigned char *)a2 + 36);
    *((unsigned char *)a2 + 36) = v5;
    LODWORD(v5) = *(_DWORD *)(this + 52);
    *(_DWORD *)(this + 52) = *((_DWORD *)a2 + 13);
    *((_DWORD *)a2 + 13) = v5;
    LODWORD(v5) = *(_DWORD *)(this + 48);
    *(_DWORD *)(this + 48) = *((_DWORD *)a2 + 12);
    *((_DWORD *)a2 + 12) = v5;
  }
  return this;
}

void *awd::metrics::SimpleMetric::GetTypeName@<X0>(void *a1@<X8>)
{
  return sub_1D3E270D0(a1, "awd.metrics.SimpleMetric");
}

uint64_t sub_1D3E2BA24(uint64_t a1)
{
  return *(unsigned int *)(a1 + 48);
}

uint64_t awd::AWDBundledSubmissionMessage::AWDBundledSubmissionMessage(uint64_t a1, xpc_object_t *a2)
{
  *(_OWORD *)(a1 + 8) = 0u;
  uint64_t v4 = (_DWORD *)(a1 + 8);
  *(void *)a1 = &unk_1F2B9AE10;
  *(_OWORD *)(a1 + 24) = 0u;
  uint64_t v5 = (uint64_t *)(a1 + 24);
  *(void *)(a1 + 40) = 0;
  uint64_t v6 = MEMORY[0x1D94419C0](*a2);
  uint64_t v7 = MEMORY[0x1E4F14590];
  if (v6 == MEMORY[0x1E4F14590] && xpc_dictionary_get_int64(*a2, "AWDMessageType") == 10)
  {
    *(_DWORD *)(a1 + 12) = xpc_dictionary_get_int64(*a2, "AWDMessageTriggerId");
    _DWORD *v4 = xpc_dictionary_get_int64(*a2, "AWDMessageTriggeringComponentId");
    *(_DWORD *)(a1 + 16) = xpc_dictionary_get_int64(*a2, "AWDMessageSubmissionId");
    *(_DWORD *)(a1 + 20) = xpc_dictionary_get_int64(*a2, "AWDMessageSourceComponentId");
    xpc_object_t v22 = a2;
    uint64_t v23 = "profiles";
    sub_1D3E1E3A0((uint64_t)&v22, &v24);
    uint64_t v8 = MEMORY[0x1D94419C0](v24);
    uint64_t v9 = MEMORY[0x1E4F14568];
    if (v8 == MEMORY[0x1E4F14568])
    {
      object[0] = v24;
      if (v24) {
        xpc_retain(v24);
      }
      else {
        object[0] = xpc_null_create();
      }
      sub_1D3E1EA40(&v22, object, 0);
      xpc_release(object[0]);
      xpc_object_t p_xdict = v24;
      if (v24) {
        xpc_retain(v24);
      }
      else {
        xpc_object_t p_xdict = xpc_null_create();
      }
      if (MEMORY[0x1D94419C0](v24) == v9) {
        size_t count = (void *)xpc_array_get_count(v24);
      }
      else {
        size_t count = 0;
      }
      sub_1D3E1EA40(object, &p_xdict, count);
      xpc_release(p_xdict);
      for (uint64_t i = (std::__shared_weak_count *)v23; i != object[1] || v22 != object[0]; uint64_t i = (std::__shared_weak_count *)++v23)
      {
        xpc_object_t p_xdict = &v22;
        uint64_t v19 = i;
        sub_1D3E2BDC8((uint64_t)&p_xdict, &xdict);
        if (MEMORY[0x1D94419C0](xdict) == v7)
        {
          data = 0;
          size_t length = 0;
          data = (char *)xpc_dictionary_get_data(xdict, "data", &length);
          if (data)
          {
            int v15 = 0;
            xpc_object_t p_xdict = &xdict;
            uint64_t v19 = (std::__shared_weak_count *)"profile_id";
            sub_1D3E1D854((uint64_t)&p_xdict, &v14);
            int v12 = xpc::dyn_cast_or_default();
            xpc_release(v14);
            int v15 = v12;
            xpc_object_t v14 = &data[length];
            sub_1D3E2C550(&data, (char **)&v14, &p_xdict);
            sub_1D3E2BE64(v5, &v15, (uint64_t)&p_xdict);
            if (v19) {
              sub_1D3E1D148(v19);
            }
          }
        }
        xpc_release(xdict);
      }
      xpc_release(v22);
      xpc_release(v22);
    }
    xpc_release(v24);
  }
  return a1;
}

void sub_1D3E2BD08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t a10, uint64_t a11, uint64_t a12, uint64_t a13, xpc_object_t object, uint64_t a15, xpc_object_t a16, xpc_object_t a17, uint64_t a18, xpc_object_t a19)
{
  xpc_release(object);
  xpc_release(a19);
  xpc_release(*(xpc_object_t *)(v19 - 80));
  sub_1D3E2C4B0((void ***)&a19);
  _Unwind_Resume(a1);
}

void sub_1D3E2BDC8(uint64_t a1@<X0>, void *a2@<X8>)
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
  if (MEMORY[0x1D94419C0](v4) != MEMORY[0x1E4F14590])
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

void **sub_1D3E2BE64(uint64_t *a1, _DWORD *a2, uint64_t a3)
{
  unint64_t v8 = a1[2];
  uint64_t result = (void **)(a1 + 2);
  unint64_t v7 = v8;
  unint64_t v9 = (unint64_t)*(result - 1);
  if (v9 >= v8)
  {
    unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v9 - *a1) >> 3);
    unint64_t v12 = v11 + 1;
    if (v11 + 1 > 0xAAAAAAAAAAAAAAALL) {
      sub_1D3E1AE60();
    }
    unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v7 - *a1) >> 3);
    if (2 * v13 > v12) {
      unint64_t v12 = 2 * v13;
    }
    if (v13 >= 0x555555555555555) {
      unint64_t v14 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v14 = v12;
    }
    v18[4] = result;
    int v15 = (char *)sub_1D3E272A0((uint64_t)result, v14);
    uint64_t v16 = &v15[24 * v11];
    v18[0] = v15;
    v18[1] = v16;
    v18[3] = &v15[24 * v17];
    *(_DWORD *)uint64_t v16 = *a2;
    *(_OWORD *)(v16 + 8) = *(_OWORD *)a3;
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    v18[2] = v16 + 24;
    sub_1D3E2C72C(a1, v18);
    uint64_t v10 = a1[1];
    uint64_t result = sub_1D3E2C8BC(v18);
  }
  else
  {
    *(_DWORD *)unint64_t v9 = *a2;
    *(_OWORD *)(v9 + 8) = *(_OWORD *)a3;
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    uint64_t v10 = v9 + 24;
    a1[1] = v9 + 24;
  }
  a1[1] = v10;
  return result;
}

void sub_1D3E2BF7C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_1D3E2C8BC((void **)va);
  _Unwind_Resume(a1);
}

void awd::AWDBundledSubmissionMessage::createMessage(unsigned int a1@<W0>, unint64_t a2@<X1>, unsigned int a3@<W2>, void *a4@<X3>, void *a5@<X8>)
{
  unsigned int v7 = a2;
  int64_t v10 = HIDWORD(a2);
  xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v11, "AWDMessageType", 10);
  xpc_dictionary_set_int64(v11, "AWDMessageTriggerId", v10);
  xpc_dictionary_set_int64(v11, "AWDMessageTriggeringComponentId", v7);
  xpc_dictionary_set_int64(v11, "AWDMessageSubmissionId", a3);
  xpc_dictionary_set_int64(v11, "AWDMessageSourceComponentId", a1);
  xpc_object_t v12 = xpc_array_create(0, 0);
  if (v12 || (xpc_object_t v12 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x1D94419C0](v12) == MEMORY[0x1E4F14568])
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
  uint64_t v16 = (void *)*a4;
  unint64_t v14 = a4 + 1;
  int v15 = v16;
  if (v16 != v14)
  {
    uint64_t v17 = MEMORY[0x1E4F14590];
    do
    {
      xpc_object_t v18 = xpc_dictionary_create(0, 0, 0);
      xpc_object_t v19 = v18;
      if (v18)
      {
        xpc_object_t value = v18;
      }
      else
      {
        xpc_object_t v19 = xpc_null_create();
        xpc_object_t value = v19;
        if (!v19)
        {
          xpc_object_t v20 = xpc_null_create();
          xpc_object_t v19 = 0;
          goto LABEL_16;
        }
      }
      if (MEMORY[0x1D94419C0](v19) != v17)
      {
        xpc_object_t v20 = xpc_null_create();
LABEL_16:
        xpc_object_t value = v20;
        goto LABEL_17;
      }
      xpc_retain(v19);
LABEL_17:
      xpc_release(v19);
      xpc_object_t v29 = xpc_int64_create(*((unsigned int *)v15 + 8));
      if (!v29) {
        xpc_object_t v29 = xpc_null_create();
      }
      p_xpc_object_t value = &value;
      unint64_t v28 = "profile_id";
      sub_1D3E1DB1C((uint64_t)&p_value, &v29, &object);
      xpc_release(object);
      xpc_object_t object = 0;
      xpc_release(v29);
      xpc_object_t v29 = 0;
      xpc_object_t v25 = xpc_data_create((const void *)v15[5], v15[6] - v15[5]);
      if (!v25) {
        xpc_object_t v25 = xpc_null_create();
      }
      p_xpc_object_t value = &value;
      unint64_t v28 = "data";
      sub_1D3E1DB1C((uint64_t)&p_value, &v25, &v26);
      xpc_release(v26);
      xpc_object_t v26 = 0;
      xpc_release(v25);
      xpc_object_t v25 = 0;
      xpc_array_append_value(v13, value);
      xpc_release(value);
      int v21 = (void *)v15[1];
      if (v21)
      {
        do
        {
          xpc_object_t v22 = v21;
          int v21 = (void *)*v21;
        }
        while (v21);
      }
      else
      {
        do
        {
          xpc_object_t v22 = (void *)v15[2];
          BOOL v23 = *v22 == (void)v15;
          int v15 = v22;
        }
        while (!v23);
      }
      int v15 = v22;
    }
    while (v22 != v14);
  }
  xpc_dictionary_set_value(v11, "profiles", v13);
  if (v11)
  {
    *a5 = v11;
  }
  else
  {
    xpc_object_t v11 = xpc_null_create();
    *a5 = v11;
    if (!v11)
    {
      xpc_object_t v24 = xpc_null_create();
      xpc_object_t v11 = 0;
      goto LABEL_34;
    }
  }
  if (MEMORY[0x1D94419C0](v11) != MEMORY[0x1E4F14590])
  {
    xpc_object_t v24 = xpc_null_create();
LABEL_34:
    *a5 = v24;
    goto LABEL_35;
  }
  xpc_retain(v11);
LABEL_35:
  xpc_release(v11);
  xpc_release(v13);
}

void sub_1D3E2C2BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, xpc_object_t object)
{
  xpc_release(v16);
  _Unwind_Resume(a1);
}

void awd::AWDBundledSubmissionMessage::createXpcMessage(void *a1@<X8>)
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v4 = v3;
  if (v3)
  {
    *a1 = v3;
  }
  else
  {
    xpc_object_t v4 = xpc_null_create();
    *a1 = v4;
    if (!v4)
    {
      xpc_object_t v5 = xpc_null_create();
      xpc_object_t v4 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x1D94419C0](v4) != MEMORY[0x1E4F14590])
  {
    xpc_object_t v5 = xpc_null_create();
LABEL_8:
    *a1 = v5;
    goto LABEL_9;
  }
  xpc_retain(v4);
LABEL_9:
  xpc_release(v4);
}

uint64_t awd::AWDBundledSubmissionMessage::getSrcComponentId(awd::AWDBundledSubmissionMessage *this)
{
  return *((unsigned int *)this + 5);
}

uint64_t awd::AWDBundledSubmissionMessage::getTrigger(awd::AWDBundledSubmissionMessage *this)
{
  return *((void *)this + 1);
}

uint64_t awd::AWDBundledSubmissionMessage::getBundledSubmission(awd::AWDBundledSubmissionMessage *this)
{
  return (uint64_t)this + 24;
}

uint64_t sub_1D3E2C3EC(uint64_t a1)
{
  *(void *)a1 = &unk_1F2B9AE10;
  xpc_object_t v3 = (void **)(a1 + 24);
  sub_1D3E2C4B0(&v3);
  return a1;
}

uint64_t sub_1D3E2C444(uint64_t a1)
{
  *(void *)a1 = &unk_1F2B9AE10;
  xpc_object_t v3 = (void **)(a1 + 24);
  sub_1D3E2C4B0(&v3);
  return MEMORY[0x1D94412F0](a1, 0x10A1C406C85F68BLL);
}

void sub_1D3E2C4B0(void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    sub_1D3E2C504((uint64_t *)v2);
    xpc_object_t v3 = **a1;
    operator delete(v3);
  }
}

void sub_1D3E2C504(uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 24)
  {
    xpc_object_t v4 = *(std::__shared_weak_count **)(i - 8);
    if (v4) {
      sub_1D3E1D148(v4);
    }
  }
  a1[1] = v2;
}

uint64_t sub_1D3E2C550@<X0>(char **a1@<X1>, char **a2@<X2>, void *a3@<X8>)
{
  uint64_t v6 = (char *)operator new(0x30uLL);
  uint64_t result = sub_1D3E2C5B4((uint64_t)v6, a1, a2);
  *a3 = v6 + 24;
  a3[1] = v6;
  return result;
}

void sub_1D3E2C5A0(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1D3E2C5B4(uint64_t a1, char **a2, char **a3)
{
  *(_OWORD *)(a1 + 8) = 0u;
  *(void *)a1 = &unk_1F2B9B820;
  xpc_object_t v4 = *a2;
  xpc_object_t v5 = *a3;
  *(void *)(a1 + 40) = 0;
  *(_OWORD *)(a1 + 24) = 0u;
  sub_1D3E2C6B8((char *)(a1 + 24), v4, v5, v5 - v4);
  return a1;
}

void sub_1D3E2C614(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void sub_1D3E2C628(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F2B9B820;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1D3E2C648(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F2B9B820;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1D94412F0);
}

void sub_1D3E2C69C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 24);
  if (v2)
  {
    *(void *)(a1 + 32) = v2;
    operator delete(v2);
  }
}

char *sub_1D3E2C6B8(char *result, char *a2, char *a3, size_t __sz)
{
  if (__sz)
  {
    uint64_t v6 = result;
    uint64_t result = sub_1D3E1F29C(result, __sz);
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

void sub_1D3E2C710(_Unwind_Exception *exception_object)
{
  xpc_object_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1D3E2C72C(uint64_t *a1, void *a2)
{
  uint64_t result = sub_1D3E2C7A4((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t sub_1D3E2C7A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 == a5)
  {
    uint64_t v10 = a6;
  }
  else
  {
    uint64_t v8 = a7 - 24;
    do
    {
      int v9 = *(_DWORD *)(a3 - 24);
      a3 -= 24;
      *(_DWORD *)uint64_t v8 = v9;
      *(_OWORD *)(v8 + 8) = *(_OWORD *)(a3 + 8);
      *(void *)(a3 + 8) = 0;
      *(void *)(a3 + 16) = 0;
      *((void *)&v15 + 1) = v8;
      v8 -= 24;
      v7 -= 24;
    }
    while (a3 != a5);
    uint64_t v10 = v15;
  }
  char v13 = 1;
  sub_1D3E2C840((uint64_t)v12);
  return v10;
}

uint64_t sub_1D3E2C840(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_1D3E2C878(a1);
  }
  return a1;
}

void sub_1D3E2C878(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    xpc_object_t v3 = *(std::__shared_weak_count **)(v1 + 16);
    if (v3) {
      sub_1D3E1D148(v3);
    }
    v1 += 24;
  }
}

void **sub_1D3E2C8BC(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void sub_1D3E2C8F0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v1 = *(void *)(a1 + 16);
  while (v1 != v2)
  {
    *(void *)(a1 + 16) = v1 - 24;
    xpc_object_t v4 = *(std::__shared_weak_count **)(v1 - 8);
    if (v4)
    {
      sub_1D3E1D148(v4);
      uint64_t v1 = *(void *)(a1 + 16);
    }
    else
    {
      v1 -= 24;
    }
  }
}

uint64_t awd::maybeSetTimestamp(awd *this, awd::Metric *a2)
{
  uint64_t result = sGetTimestampFieldForMetricId(*(_DWORD *)this);
  if (!result) {
    return result;
  }
  int v4 = result;
  uint64_t v5 = (char *)*((void *)this + 2);
  uint64_t v6 = *((void *)this + 3) - (void)v5;
  uint64_t v34 = 0;
  int v35 = v5;
  unint64_t v36 = (unint64_t)&v5[(int)v6];
  int v37 = v6;
  uint64_t v38 = 0;
  __int16 v39 = 0;
  int v40 = v6;
  long long v41 = xmmword_1D3E52A60;
  int v42 = *MEMORY[0x1E4FBA918];
  uint64_t v43 = 0;
  uint64_t v44 = 0;
  while ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)&v34) >= 1)
  {
    if ((unint64_t)v35 >= v36 || *v35 < 0)
    {
      unint64_t TagFallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)&v34);
      HIDWORD(v38) = TagFallback;
      if (TagFallback) {
        goto LABEL_9;
      }
    }
    else
    {
      unint64_t TagFallback = *v35;
      HIDWORD(v38) = TagFallback;
      ++v35;
      if (TagFallback)
      {
LABEL_9:
        unint64_t v8 = awd::reflect::decodeTag((awd::reflect *)TagFallback);
        unint64_t v9 = HIDWORD(v8);
        switch((char)v8)
        {
          case 0:
            *(void *)uint64_t v31 = 0;
            if ((unint64_t)v35 >= v36 || *v35 < 0)
            {
              int Varint64Fallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)&v34, (unint64_t *)v31);
LABEL_19:
              if (!Varint64Fallback) {
                continue;
              }
            }
            else
            {
              ++v35;
            }
            if (v4 == v9) {
              return MEMORY[0x1D9440D70](&v34);
            }
            break;
          case 1:
            *(void *)uint64_t v31 = 0;
            int Varint64Fallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)&v34, (unint64_t *)v31);
            goto LABEL_19;
          case 2:
            v31[0] = 0;
            if ((unint64_t)v35 >= v36 || *v35 < 0)
            {
              if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)&v34, v31))continue; {
            }
              }
            else
            {
              v31[0] = *v35++;
            }
            wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)&v34);
            ++HIDWORD(v41);
            wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)&v34);
            wireless_diagnostics::google::protobuf::io::CodedInputStream::Skip((wireless_diagnostics::google::protobuf::io::CodedInputStream *)&v34);
            if (SHIDWORD(v41) >= 1) {
              --HIDWORD(v41);
            }
            wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)&v34);
            continue;
          case 5:
            v31[0] = 0;
            int Varint64Fallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback((wireless_diagnostics::google::protobuf::io::CodedInputStream *)&v34, v31);
            goto LABEL_19;
          default:
            continue;
        }
      }
    }
  }
  *(void *)uint64_t v31 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  awd::GetProtobufTag((uint64_t *)this + 2, v31);
  xpc_object_t v11 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((void *)this + 1);
  xpc_object_t v12 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)(8 * v4);
  if (v12 >= 0x80) {
    int v13 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v12);
  }
  else {
    int v13 = 1;
  }
  int v14 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64(v11);
  sub_1D3E2CDE8(&v29, v14 + v13);
  uint64_t v16 = v29;
  if (v12 > 0x7F)
  {
    if (v12 >> 14)
    {
      uint64_t v17 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32FallbackToArray(v12, (uint64_t)v29, v15);
    }
    else
    {
      *(unsigned char *)xpc_object_t v29 = v12 | 0x80;
      v16[1] = v12 >> 7;
      uint64_t v17 = (uint64_t)(v16 + 2);
    }
  }
  else
  {
    *(unsigned char *)xpc_object_t v29 = (_BYTE)v12;
    uint64_t v17 = (uint64_t)(v16 + 1);
  }
  wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64ToArray(v11, v17, v15);
  uint64_t v18 = v30 - (unsigned char *)v29 + v32;
  awd::createTagForProtobuf((awd *)v33, v30 - v29 + v32, (unint64_t *)&__p);
  xpc_object_t v20 = (char *)*((void *)this + 2);
  xpc_object_t v19 = (char *)*((void *)this + 3);
  int64_t v21 = &v28[v18] - (unsigned char *)__p + v20 - v19;
  if (v21 < 1)
  {
    if (v21 < 0)
    {
      xpc_object_t v22 = &v19[-(&v28[v18] - (unsigned char *)__p)];
      int64_t v23 = &v28[v18] - (unsigned char *)__p;
      if (v19 != &v20[-v21]) {
        memmove(*((void **)this + 2), v22, v19 - &v20[-v21]);
      }
      *((void *)this + 3) = &v20[v23];
    }
  }
  else
  {
    char v26 = 0;
    sub_1D3E1A4A4((char **)this + 2, v20, v21, &v26);
  }
  xpc_object_t v24 = (char *)*((void *)this + 2);
  int64_t v25 = v28 - (unsigned char *)__p;
  if (v28 != __p) {
    memmove(v24, __p, v28 - (unsigned char *)__p);
  }
  if (v30 != v29) {
    memmove(&v24[v25], v29, v30 - (unsigned char *)v29);
  }
  if (__p)
  {
    unint64_t v28 = __p;
    operator delete(__p);
  }
  if (v29)
  {
    uint64_t v30 = v29;
    operator delete(v29);
  }
  return MEMORY[0x1D9440D70](&v34);
}

void sub_1D3E2CCBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  if (__p) {
    operator delete(__p);
  }
  if (a13) {
    operator delete(a13);
  }
  MEMORY[0x1D9440D70](&a19);
  _Unwind_Resume(a1);
}

uint64_t awd::Metric::Metric(uint64_t this)
{
  *(void *)(this + 16) = 0;
  *(void *)(this + 24) = 0;
  *(void *)(this + 32) = 0;
  *(unsigned char *)(this + 40) = 1;
  return this;
}

{
  *(void *)(this + 16) = 0;
  *(void *)(this + 24) = 0;
  *(void *)(this + 32) = 0;
  *(unsigned char *)(this + 40) = 1;
  return this;
}

uint64_t awd::Metric::Metric(uint64_t a1, int a2, uint64_t a3, uint64_t a4, char a5)
{
  *(_DWORD *)a1 = a2;
  *(void *)(a1 + 8) = a3;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 16) = 0;
  sub_1D3E267C0((void *)(a1 + 16), *(const void **)a4, *(void *)(a4 + 8), *(void *)(a4 + 8) - *(void *)a4);
  *(unsigned char *)(a1 + 40) = a5;
  return a1;
}

{
  *(_DWORD *)a1 = a2;
  *(void *)(a1 + 8) = a3;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 16) = 0;
  sub_1D3E267C0((void *)(a1 + 16), *(const void **)a4, *(void *)(a4 + 8), *(void *)(a4 + 8) - *(void *)a4);
  *(unsigned char *)(a1 + 40) = a5;
  return a1;
}

void *sub_1D3E2CDE8(void *a1, size_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_1D3E1F29C(a1, a2);
    int v4 = (char *)a1[1];
    uint64_t v5 = &v4[a2];
    bzero(v4, a2);
    a1[1] = v5;
  }
  return a1;
}

void sub_1D3E2CE40(_Unwind_Exception *exception_object)
{
  xpc_object_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void PRNGenerator::get(void *a1@<X8>)
{
  sub_1D3E2CF90(&qword_1EB220A20, a1);
  if (!*a1)
  {
    std::mutex::lock((std::mutex *)&qword_1EB220A30);
    sub_1D3E2CF90(&qword_1EB220A20, &v5);
    long long v3 = v5;
    long long v5 = 0uLL;
    int v4 = (std::__shared_weak_count *)a1[1];
    *(_OWORD *)a1 = v3;
    if (v4)
    {
      sub_1D3E1D148(v4);
      int v4 = (std::__shared_weak_count *)*((void *)&v5 + 1);
      if (*((void *)&v5 + 1)) {
        sub_1D3E1D148(*((std::__shared_weak_count **)&v5 + 1));
      }
      if (!*a1) {
LABEL_8:
      }
        PRNGenerator::create_default_global((PRNGenerator *)v4);
    }
    else if (!(void)v3)
    {
      goto LABEL_8;
    }
    std::mutex::unlock((std::mutex *)&qword_1EB220A30);
  }
}

void sub_1D3E2CF4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_1D3E1D148(a10);
  }
  std::mutex::unlock((std::mutex *)&qword_1EB220A30);
  xpc_object_t v12 = *(std::__shared_weak_count **)(v10 + 8);
  if (v12) {
    sub_1D3E1D148(v12);
  }
  _Unwind_Resume(a1);
}

void sub_1D3E2CF90(void *a1@<X0>, void *a2@<X8>)
{
  sp_mut = std::__get_sp_mut(a1);
  std::__sp_mut::lock(sp_mut);
  uint64_t v5 = a1[1];
  *a2 = *a1;
  a2[1] = v5;
  if (v5) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
  }
  std::__sp_mut::unlock(sp_mut);
}

void PRNGenerator::create_default_global(PRNGenerator *this)
{
}

void sub_1D3E2D14C(void *a1)
{
  __cxa_begin_catch(a1);
  dispatch_barrier_async_f(v1[3], v1, (dispatch_function_t)sub_1D3E2D8D4);
  __cxa_rethrow();
}

void sub_1D3E2D174(_Unwind_Exception *a1)
{
}

void sub_1D3E2D1B0(uint64_t *a1, uint64_t *a2)
{
  sp_mut = std::__get_sp_mut(a1);
  std::__sp_mut::lock(sp_mut);
  uint64_t v5 = *a1;
  *a1 = *a2;
  *a2 = v5;
  uint64_t v6 = a1[1];
  a1[1] = a2[1];
  a2[1] = v6;
  std::__sp_mut::unlock(sp_mut);
}

void PRNGenerator::set(uint64_t *a1)
{
  std::mutex::lock((std::mutex *)&qword_1EB220A30);
  uint64_t v2 = (std::__shared_weak_count *)a1[1];
  uint64_t v3 = *a1;
  int v4 = v2;
  if (v2) {
    atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  sub_1D3E2D1B0(&qword_1EB220A20, &v3);
  if (v4) {
    sub_1D3E1D148(v4);
  }
  std::mutex::unlock((std::mutex *)&qword_1EB220A30);
}

void sub_1D3E2D290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_1D3E1D148(a10);
  }
  std::mutex::unlock((std::mutex *)&qword_1EB220A30);
  _Unwind_Resume(a1);
}

void PRNGenerator::destroy(PRNGenerator *this)
{
  v1[0] = 0;
  v1[1] = 0;
  PRNGenerator::set(v1);
}

void PRNGenerator::PRNGenerator(PRNGenerator *this)
{
  uint64_t v2 = dispatch_queue_create("PRNGenerator", 0);
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = v2;
  if (v2)
  {
    uint64_t v3 = v2;
    dispatch_retain(v2);
    *((void *)this + 4) = 0;
    dispatch_release(v3);
  }
  else
  {
    *((void *)this + 4) = 0;
  }
  *(void *)this = &unk_1F2B9AB28;
}

uint64_t PRNGenerator::generatePRN10000(PRNGenerator *this)
{
  int v4 = this;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 0x40000000;
  _DWORD v5[2] = sub_1D3E2D794;
  void v5[3] = &unk_1E69CA450;
  v5[4] = (char *)this + 8;
  void v5[5] = &v4;
  uint64_t v6 = v5;
  uint64_t v2 = (char *)this + 24;
  uint64_t v1 = *((void *)this + 3);
  if (*((void *)v2 + 1))
  {
    unsigned int v13 = 0;
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v8 = 0x40000000;
    unint64_t v9 = sub_1D3E2D7FC;
    uint64_t v10 = &unk_1E69CA510;
    xpc_object_t v11 = &v13;
    xpc_object_t v12 = &v6;
    dispatch_async_and_wait(v1, &block);
  }
  else
  {
    unsigned int v13 = 0;
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v8 = 0x40000000;
    unint64_t v9 = sub_1D3E2D7C0;
    uint64_t v10 = &unk_1E69CA4D0;
    xpc_object_t v11 = &v13;
    xpc_object_t v12 = &v6;
    dispatch_sync(v1, &block);
  }
  return v13;
}

uint64_t sub_1D3E2D47C(uint64_t a1)
{
  return sub_1D3E2D558(a1 + 40, 0, 9999);
}

uint64_t sub_1D3E2D48C(uint64_t a1)
{
  return a1;
}

void sub_1D3E2D4B8(uint64_t a1)
{
  sub_1D3E1CFA4((void *)(a1 + 8));
  JUMPOUT(0x1D94412F0);
}

unsigned int *sub_1D3E2D504(unsigned int *result)
{
  uint64_t v1 = 0;
  int v2 = result[623] ^ result[396];
  if (v2 >= 0) {
    int v3 = 2 * v2;
  }
  else {
    int v3 = (2 * v2) ^ 0x321161BF;
  }
  *uint64_t result = *result & 0x80000000 | v3 & 0x7FFFFFFF;
  while (!result[v1])
  {
    if (++v1 == 624)
    {
      *uint64_t result = 0x80000000;
      return result;
    }
  }
  return result;
}

uint64_t sub_1D3E2D558(uint64_t a1, int a2, uint64_t a3)
{
  unsigned int v3 = a3 - a2;
  if (a3 != a2)
  {
    if (v3 == -1)
    {
      uint64_t v12 = *(void *)(a1 + 2496);
      if (v12 == 624)
      {
        sub_1D3E2D664((int *)a1);
        uint64_t v12 = *(void *)(a1 + 2496);
      }
      unsigned int v13 = *(_DWORD *)(a1 + 4 * v12);
      *(void *)(a1 + 2496) = v12 + 1;
      unsigned int v14 = ((v13 ^ (v13 >> 11)) << 7) & 0x9D2C5680 ^ v13 ^ (v13 >> 11);
      return ((v14 << 15) & 0xEFC60000 ^ v14 ^ (((v14 << 15) & 0xEFC60000 ^ v14) >> 18)) + a2;
    }
    else
    {
      unsigned int v6 = 0xFFFFFFFF / (v3 + 1);
      if (~(v6 * (v3 + 1)) == v3) {
        unsigned int v7 = v6 + 1;
      }
      else {
        unsigned int v7 = 0xFFFFFFFF / (v3 + 1);
      }
      uint64_t v8 = *(void *)(a1 + 2496);
      do
      {
        if (v8 == 624)
        {
          sub_1D3E2D664((int *)a1);
          uint64_t v8 = *(void *)(a1 + 2496);
        }
        unsigned int v9 = *(_DWORD *)(a1 + 4 * v8++);
        *(void *)(a1 + 2496) = v8;
        unsigned int v10 = ((v9 ^ (v9 >> 11)) << 7) & 0x9D2C5680 ^ v9 ^ (v9 >> 11);
        unsigned int v11 = ((v10 << 15) & 0xEFC60000 ^ v10 ^ (((v10 << 15) & 0xEFC60000 ^ v10) >> 18)) / v7;
      }
      while (v11 > v3);
      return v11 + a2;
    }
  }
  return a3;
}

int *sub_1D3E2D664(int *result)
{
  uint64_t v1 = 0;
  int v2 = *result;
  do
  {
    unsigned int v3 = v2 & 0x80000000;
    int v2 = result[v1 + 1];
    result[v1] = result[v1 + 397] ^ ((v2 & 0x7FFFFFFE | v3) >> 1) ^ (v2 << 31 >> 31) & 0x9908B0DF;
    ++v1;
  }
  while (v1 != 222);
  uint64_t v4 = 0;
  int v5 = result[222];
  do
  {
    unsigned int v6 = v5 & 0x80000000;
    int v5 = result[v4 + 223];
    result[v4 + 222] = result[v4 + 619] ^ ((v5 & 0x7FFFFFFE | v6) >> 1) ^ (v5 << 31 >> 31) & 0x9908B0DF;
    ++v4;
  }
  while (v4 != 5);
  uint64_t v7 = 0;
  uint64_t v8 = (const float *)(result + 227);
  int8x16_t v9 = (int8x16_t)vld1q_dup_f32(v8);
  v10.i64[0] = 0x8000000080000000;
  v10.i64[1] = 0x8000000080000000;
  int8x16_t v11 = (int8x16_t)vdupq_n_s32(0x7FFFFFFEu);
  v12.i64[0] = 0x100000001;
  v12.i64[1] = 0x100000001;
  int8x16_t v13 = (int8x16_t)vdupq_n_s32(0x9908B0DF);
  do
  {
    int8x16_t v14 = *(int8x16_t *)&result[v7 + 228];
    *(int8x16_t *)&result[v7 + 227] = veorq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)vorrq_s8(vandq_s8(v14, v11), vandq_s8(vextq_s8(v9, v14, 0xCuLL), v10)), 1uLL), veorq_s8(*(int8x16_t *)&result[v7], vbicq_s8(v13, (int8x16_t)vceqzq_s32((int32x4_t)vandq_s8(v14, v12)))));
    v7 += 4;
    int8x16_t v9 = v14;
  }
  while (v7 != 396);
  result[623] = result[396] ^ ((*result & 0x7FFFFFFE | result[623] & 0x80000000) >> 1) ^ (*result << 31 >> 31) & 0x9908B0DF;
  *((void *)result + 312) = 0;
  return result;
}

uint64_t sub_1D3E2D794(uint64_t a1)
{
  return (****(uint64_t (*****)(void))(a1 + 40))(**(void **)(a1 + 40));
}

uint64_t sub_1D3E2D7C0(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)(a1 + 40) + 16))();
  **(_DWORD **)(a1 + 32) = result;
  return result;
}

uint64_t sub_1D3E2D7FC(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)(a1 + 40) + 16))();
  **(_DWORD **)(a1 + 32) = result;
  return result;
}

void sub_1D3E2D83C(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1D94412F0);
}

void sub_1D3E2D874(uint64_t a1)
{
}

uint64_t sub_1D3E2D890(uint64_t a1, uint64_t a2)
{
  if (sub_1D3E247D4(a2, (uint64_t)&unk_1F2B9AAA8)) {
    return a1 + 24;
  }
  else {
    return 0;
  }
}

uint64_t sub_1D3E2D8D4(uint64_t result)
{
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 16))();
  }
  return result;
}

void awd::AWDMetricSubmitter::create()
{
}

void sub_1D3E2D994(_Unwind_Exception *a1)
{
  MEMORY[0x1D94412F0](v1, 0x1020C40B3F491F8);
  _Unwind_Resume(a1);
}

__n128 awd::AWDMetricSubmitter::AWDMetricSubmitter(void *a1, __n128 *a2)
{
  unsigned int v3 = sub_1D3E2DA60(a1, "AWDMetricSubmitter", QOS_CLASS_DEFAULT, "submitter");
  __n128 result = *a2;
  *(__n128 *)(v3 + 5) = *a2;
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  v3[9] = 0;
  v3[8] = 0;
  v3[7] = v3 + 8;
  return result;
}

{
  void *v3;
  __n128 result;

  unsigned int v3 = sub_1D3E2DA60(a1, "AWDMetricSubmitter", QOS_CLASS_DEFAULT, "submitter");
  __n128 result = *a2;
  *(__n128 *)(v3 + 5) = *a2;
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  v3[9] = 0;
  v3[8] = 0;
  v3[7] = v3 + 8;
  return result;
}

void *sub_1D3E2DA60(void *a1, const char *a2, dispatch_qos_class_t a3, const char *a4)
{
  dispatch_object_t object = 0;
  sub_1D3E24930(a1, a2, a3, &object);
  if (object) {
    dispatch_release(object);
  }
  ctu::OsLogLogger::OsLogLogger((ctu::OsLogLogger *)(a1 + 4), "com.apple.awd.framework", a4);
  return a1;
}

void sub_1D3E2DAC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, dispatch_object_t object)
{
  sub_1D3E1CFA4(v10);
  _Unwind_Resume(a1);
}

void awd::AWDMetricSubmitter::addMetric(void *a1, uint64_t a2, int a3, int a4, int a5, uint64_t a6)
{
  uint64_t v17 = a2;
  int v18 = a3;
  int v15 = a5;
  int v16 = a4;
  uint64_t v13 = 0;
  int8x16_t v14 = 0;
  uint64_t v7 = (std::__shared_weak_count *)a1[6];
  if (v7)
  {
    int8x16_t v9 = std::__shared_weak_count::lock(v7);
    int8x16_t v14 = v9;
    if (v9)
    {
      uint64_t v13 = a1[5];
      if (v13)
      {
        v12[0] = a6;
        v12[1] = a1;
        v12[2] = &v16;
        void v12[3] = &v17;
        v12[4] = &v15;
        void v12[5] = &v13;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 0x40000000;
        block[2] = sub_1D3E2E0E0;
        block[3] = &unk_1E69CA470;
        void block[4] = a1;
        void block[5] = v12;
        int8x16_t v10 = a1[2];
        if (a1[3]) {
          dispatch_async_and_wait(v10, block);
        }
        else {
          dispatch_sync(v10, block);
        }
        int8x16_t v9 = v14;
        if (!v14) {
          return;
        }
LABEL_10:
        sub_1D3E1D148(v9);
        return;
      }
    }
  }
  else
  {
    int8x16_t v9 = 0;
  }
  int8x16_t v11 = a1[4];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(block[0]) = 0;
    _os_log_impl(&dword_1D3E18000, v11, OS_LOG_TYPE_DEFAULT, "client.submitter:#E Unable to send metric because AWDServerFacade is not valid.", (uint8_t *)block, 2u);
  }
  if (v9) {
    goto LABEL_10;
  }
}

void awd::AWDMetricSubmitter::doneWithMetrics(void *a1, int a2, uint64_t a3, int a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v5 = (std::__shared_weak_count *)a1[6];
  if (v5)
  {
    int8x16_t v9 = std::__shared_weak_count::lock(v5);
    if (v9)
    {
      int8x16_t v10 = (void *)a1[5];
      if (v10)
      {
        int8x16_t v11 = a1[4];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 67109632;
          int v15 = a3;
          __int16 v16 = 1024;
          int v17 = HIDWORD(a3);
          __int16 v18 = 1024;
          int v19 = a4;
          _os_log_impl(&dword_1D3E18000, v11, OS_LOG_TYPE_INFO, "client.submitter:#I Sending done with metrics message for Trigger(cid=0x%x, trid=0x%x, sid=%u)", buf, 0x14u);
        }
        awd::AWDFinishedSubmissionMessage::AWDFinishedSubmissionMessage((uint64_t)buf, a2, a3, a4);
        awd::AWDFinishedSubmissionMessage::createXpcMessage((awd::AWDFinishedSubmissionMessage *)buf, &object);
        awd::AWDServerFacade::sendMessage(v10, &object);
      }
    }
  }
  else
  {
    int8x16_t v9 = 0;
  }
  int8x16_t v12 = a1[4];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1D3E18000, v12, OS_LOG_TYPE_DEFAULT, "client.submitter:#E Unable to send finished submission message because AWDServerFacade is not valid.", buf, 2u);
  }
  if (v9) {
    sub_1D3E1D148(v9);
  }
}

void sub_1D3E2DD9C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  if (a2) {
    sub_1D3E1AE78(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void awd::AWDMetricSubmitter::generateTrigger(void *a1, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = (std::__shared_weak_count *)a1[6];
  if (v5)
  {
    int8x16_t v9 = std::__shared_weak_count::lock(v5);
    if (v9)
    {
      int8x16_t v10 = (void *)a1[5];
      if (v10)
      {
        awd::AWDTriggerMessage::AWDTriggerMessage((uint64_t)buf, a2, a4, a2, a3);
        awd::AWDTriggerMessage::createXpcMessage((awd::AWDTriggerMessage *)buf, &object);
        awd::AWDServerFacade::sendMessage(v10, &object);
      }
    }
  }
  else
  {
    int8x16_t v9 = 0;
  }
  int8x16_t v11 = a1[4];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1D3E18000, v11, OS_LOG_TYPE_DEFAULT, "client.submitter:#E Unable to send trigger message because AWDServerFacade is not valid.", buf, 2u);
  }
  if (v9) {
    sub_1D3E1D148(v9);
  }
}

void sub_1D3E2DECC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(object);
  sub_1D3E1D148(v10);
  _Unwind_Resume(a1);
}

void sub_1D3E2DEFC(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_1D3E2DF74(void *a1)
{
  __cxa_begin_catch(a1);
  dispatch_barrier_async_f(v1[2], v1, (dispatch_function_t)sub_1D3E2E04C);
  __cxa_rethrow();
}

void sub_1D3E2DF9C(_Unwind_Exception *a1)
{
}

void sub_1D3E2DFB4(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1D94412F0);
}

void sub_1D3E2DFEC(uint64_t a1)
{
}

uint64_t sub_1D3E2E008(uint64_t a1, uint64_t a2)
{
  if (sub_1D3E247D4(a2, (uint64_t)&unk_1F2B9AAC8)) {
    return a1 + 24;
  }
  else {
    return 0;
  }
}

uint64_t sub_1D3E2E04C(uint64_t result)
{
  if (result)
  {
    sub_1D3E2E08C(result);
    JUMPOUT(0x1D94412F0);
  }
  return result;
}

void *sub_1D3E2E08C(uint64_t a1)
{
  sub_1D3E20F64(a1 + 56, *(void **)(a1 + 64));
  int v2 = *(std::__shared_weak_count **)(a1 + 48);
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  MEMORY[0x1D9440F90](a1 + 32);
  return sub_1D3E1CFA4((void *)a1);
}

void sub_1D3E2E0E0(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(unsigned int ***)(a1 + 40);
  uint64_t v2 = (uint64_t)*v1;
  uint64_t v3 = **v1;
  uint64_t v4 = *((void *)v1[1] + 4);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = v1[3];
    int v6 = *v1[2];
    unsigned int v7 = *v5;
    unsigned int v8 = v5[1];
    LODWORD(v5) = v5[2];
    *(_DWORD *)long long buf = 67110144;
    *(_DWORD *)&uint8_t buf[4] = v3;
    __int16 v19 = 1024;
    int v20 = v6;
    __int16 v21 = 1024;
    unsigned int v22 = v7;
    __int16 v23 = 1024;
    unsigned int v24 = v8;
    __int16 v25 = 1024;
    int v26 = (int)v5;
    _os_log_impl(&dword_1D3E18000, v4, OS_LOG_TYPE_INFO, "client.submitter:#I Sending metric submission message for metric 0x%x, profid 0x%x, Trigger(cid=0x%x, trid=0x%x, sid=%u)", buf, 0x20u);
    uint64_t v2 = (uint64_t)*v1;
  }
  int8x16_t v9 = v1[3];
  int v10 = *v1[4];
  uint64_t v11 = *v1[2];
  uint64_t v12 = *(void *)v9;
  int v13 = v9[2];
  uint64_t v17 = 0;
  __n128 __p = 0uLL;
  sub_1D3E267C0(&__p, *(const void **)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 24) - *(void *)(v2 + 16));
  awd::AWDSubmissionMessage::AWDSubmissionMessage((uint64_t)buf, v10, v3 | (v11 << 32), v12, v13, &__p);
  if (__p.n128_u64[0])
  {
    __p.n128_u64[1] = __p.n128_u64[0];
    operator delete((void *)__p.n128_u64[0]);
  }
  int8x16_t v14 = *(void **)v1[5];
  awd::AWDSubmissionMessage::createXpcMessage((const void **)buf, &object);
  awd::AWDServerFacade::sendMessage(v14, &object);
}

void sub_1D3E2E28C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18)
{
  if (a2) {
    sub_1D3E1AE78(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t awd::reflect::getUnpackedType(uint64_t result)
{
  if ((result - 15) >= 0xC) {
    return result;
  }
  else {
    return (result - 14);
  }
}

uint64_t awd::reflect::getPackedType(int a1)
{
  if ((a1 - 1) > 0x19) {
    return 0;
  }
  else {
    return dword_1D3E52D50[a1 - 1];
  }
}

unint64_t awd::reflect::decodeTag(awd::reflect *this)
{
  return this & 7 | ((unint64_t)(this >> 3) << 32);
}

uint64_t awd::reflect::encodeTag(char a1, int a2)
{
  return a1 & 7 | (8 * a2);
}

uint64_t awd::reflect::getWireTypeForType(int a1)
{
  if ((a1 - 1) > 0x1A) {
    return 0;
  }
  else {
    return byte_1D3E52DB8[a1 - 1];
  }
}

uint64_t awd::reflect::getDecodingType(uint64_t a1, int a2)
{
  if (awd::reflect::getWireTypeForType(a1) == a2) {
    return a1;
  }
  uint64_t UnpackedType = awd::reflect::getUnpackedType(a1);
  if (awd::reflect::getWireTypeForType(UnpackedType) != a2)
  {
    if (a2 != 2) {
      return 0;
    }
    uint64_t UnpackedType = awd::reflect::getPackedType(a1);
    if (!UnpackedType) {
      return 0;
    }
  }
  return UnpackedType;
}

uint64_t awd::protobuf::skipField(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, int a2)
{
  uint64_t result = 0;
  switch(a2)
  {
    case 0:
      *(void *)int v6 = 0;
      uint64_t v4 = (char *)*((void *)this + 1);
      if ((unint64_t)v4 >= *((void *)this + 2) || *v4 < 0) {
        return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(this, (unint64_t *)v6);
      }
      *((void *)this + 1) = v4 + 1;
      return 1;
    case 1:
      *(void *)int v6 = 0;
      return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(this, (unint64_t *)v6);
    case 2:
      v6[0] = 0;
      int v5 = (char *)*((void *)this + 1);
      if ((unint64_t)v5 >= *((void *)this + 2) || *v5 < 0)
      {
        uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, v6);
        if (!result) {
          return result;
        }
      }
      else
      {
        v6[0] = *v5;
        *((void *)this + 1) = v5 + 1;
      }
      return wireless_diagnostics::google::protobuf::io::CodedInputStream::Skip(this);
    case 5:
      v6[0] = 0;
      return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(this, v6);
    default:
      return result;
  }
}

uint64_t awd::protobuf::NumberConverter<(awd::reflect::Type)8>::decode(unsigned int a1)
{
  return -(a1 & 1) ^ (a1 >> 1);
}

uint64_t awd::protobuf::NumberConverter<(awd::reflect::Type)8>::encode(int a1)
{
  return (2 * a1) ^ (a1 >> 31);
}

unint64_t awd::protobuf::NumberConverter<(awd::reflect::Type)5>::decode(unint64_t a1)
{
  return -(uint64_t)(a1 & 1) ^ (a1 >> 1);
}

uint64_t awd::protobuf::NumberConverter<(awd::reflect::Type)5>::encode(uint64_t a1)
{
  return (2 * a1) ^ (a1 >> 63);
}

double awd::protobuf::NumberConverter<(awd::reflect::Type)1>::decode(uint64_t a1)
{
  return *(double *)&a1;
}

float awd::protobuf::NumberConverter<(awd::reflect::Type)2>::decode(int a1)
{
  return *(float *)&a1;
}

uint64_t awd::AWDFinishedSubmissionMessage::AWDFinishedSubmissionMessage(uint64_t result, int a2, uint64_t a3, int a4)
{
  *(void *)uint64_t result = &unk_1F2B9AE38;
  *(_DWORD *)(result + 8) = a2;
  *(void *)(result + 12) = a3;
  *(_DWORD *)(result + 20) = a4;
  return result;
}

{
  *(void *)uint64_t result = &unk_1F2B9AE38;
  *(_DWORD *)(result + 8) = a2;
  *(void *)(result + 12) = a3;
  *(_DWORD *)(result + 20) = a4;
  return result;
}

uint64_t awd::AWDFinishedSubmissionMessage::AWDFinishedSubmissionMessage(uint64_t a1, xpc_object_t *a2)
{
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = &unk_1F2B9AE38;
  if (MEMORY[0x1D94419C0](*a2) == MEMORY[0x1E4F14590])
  {
    *(_DWORD *)(a1 + 8) = xpc_dictionary_get_int64(*a2, "AWDMessageComponentId");
    *(_DWORD *)(a1 + 16) = xpc_dictionary_get_int64(*a2, "AWDMessageTriggerId");
    *(_DWORD *)(a1 + 20) = xpc_dictionary_get_int64(*a2, "AWDMessageSubmisssionId");
    *(_DWORD *)(a1 + 12) = xpc_dictionary_get_int64(*a2, "AWDMessageTriggeringComponentId");
  }
  return a1;
}

void awd::AWDFinishedSubmissionMessage::createXpcMessage(awd::AWDFinishedSubmissionMessage *this@<X0>, xpc_object_t *a2@<X8>)
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  if (v4)
  {
    int v5 = v4;
    xpc_dictionary_set_int64(v4, "AWDMessageType", 3);
    xpc_dictionary_set_int64(v5, "AWDMessageComponentId", *((unsigned int *)this + 2));
    xpc_dictionary_set_int64(v5, "AWDMessageTriggerId", *((unsigned int *)this + 4));
    xpc_dictionary_set_int64(v5, "AWDMessageSubmisssionId", *((unsigned int *)this + 5));
    xpc_dictionary_set_int64(v5, "AWDMessageTriggeringComponentId", *((unsigned int *)this + 3));
    *a2 = v5;
    if (MEMORY[0x1D94419C0](v5) == MEMORY[0x1E4F14590]) {
      xpc_retain(v5);
    }
    else {
      *a2 = xpc_null_create();
    }
    xpc_release(v5);
  }
  else
  {
    *a2 = xpc_null_create();
  }
}

uint64_t awd::AWDFinishedSubmissionMessage::getComponentId(awd::AWDFinishedSubmissionMessage *this)
{
  return *((unsigned int *)this + 2);
}

uint64_t awd::AWDFinishedSubmissionMessage::getTrigger(awd::AWDFinishedSubmissionMessage *this)
{
  return *(void *)((char *)this + 12);
}

void sub_1D3E2E784()
{
}

uint64_t awd::AWDControlMessage::AWDControlMessage(uint64_t result, int a2)
{
  *(void *)uint64_t result = &unk_1F2B9ACB8;
  *(_DWORD *)(result + 8) = a2;
  return result;
}

{
  *(void *)uint64_t result = &unk_1F2B9ACB8;
  *(_DWORD *)(result + 8) = a2;
  return result;
}

uint64_t awd::AWDControlMessage::AWDControlMessage(uint64_t a1, xpc_object_t *a2)
{
  *(void *)a1 = &unk_1F2B9ACB8;
  if (MEMORY[0x1D94419C0](*a2) == MEMORY[0x1E4F14590]) {
    *(_DWORD *)(a1 + 8) = xpc_dictionary_get_int64(*a2, "AWDMessageControlMessageType");
  }
  return a1;
}

void awd::AWDControlMessage::createXpcMessage(awd::AWDControlMessage *this@<X0>, void *a2@<X8>)
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v5 = v4;
  if (v4)
  {
    *a2 = v4;
  }
  else
  {
    xpc_object_t v5 = xpc_null_create();
    *a2 = v5;
    if (!v5)
    {
      xpc_object_t v6 = xpc_null_create();
      xpc_object_t v5 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x1D94419C0](v5) == MEMORY[0x1E4F14590])
  {
    xpc_retain(v5);
    goto LABEL_9;
  }
  xpc_object_t v6 = xpc_null_create();
LABEL_8:
  *a2 = v6;
LABEL_9:
  xpc_release(v5);
  xpc_object_t v11 = xpc_int64_create(7);
  if (!v11) {
    xpc_object_t v11 = xpc_null_create();
  }
  int8x16_t v9 = a2;
  int v10 = "AWDMessageType";
  sub_1D3E1DB1C((uint64_t)&v9, &v11, &object);
  xpc_release(object);
  xpc_object_t object = 0;
  xpc_release(v11);
  xpc_object_t v11 = 0;
  xpc_object_t v7 = xpc_int64_create(*((int *)this + 2));
  if (!v7) {
    xpc_object_t v7 = xpc_null_create();
  }
  int8x16_t v9 = a2;
  int v10 = "AWDMessageControlMessageType";
  sub_1D3E1DB1C((uint64_t)&v9, &v7, &v8);
  xpc_release(v8);
  xpc_object_t v8 = 0;
  xpc_release(v7);
}

uint64_t awd::AWDControlMessage::getControlMessageType(awd::AWDControlMessage *this)
{
  return *((unsigned int *)this + 2);
}

void sub_1D3E2E9C8()
{
}

uint64_t awd::AWDPIILocationMessage::AWDPIILocationMessage(uint64_t a1, void *a2)
{
  *(void *)a1 = &unk_1F2B9AD70;
  if (MEMORY[0x1D94419C0](*a2) == MEMORY[0x1E4F14590])
  {
    xpc_object_t v5 = a2;
    xpc_object_t v6 = "AWDMessageComponentId";
    sub_1D3E1D854((uint64_t)&v5, &object);
    *(_DWORD *)(a1 + 8) = xpc::dyn_cast_or_default();
    xpc_release(object);
    xpc_object_t v5 = a2;
    xpc_object_t v6 = "AWDMessagePII";
    sub_1D3E1D854((uint64_t)&v5, &object);
    *(unsigned char *)(a1 + 12) = xpc::dyn_cast_or_default() != 0;
    xpc_release(object);
    xpc_object_t v5 = a2;
    xpc_object_t v6 = "AWDMessageLocKey";
    sub_1D3E1D854((uint64_t)&v5, &object);
    *(unsigned char *)(a1 + 13) = xpc::dyn_cast_or_default() != 0;
    xpc_release(object);
    xpc_object_t v5 = a2;
    xpc_object_t v6 = "AWDMessageShimKey";
    sub_1D3E1D854((uint64_t)&v5, &object);
    *(unsigned char *)(a1 + 14) = xpc::dyn_cast_or_default();
    xpc_release(object);
  }
  return a1;
}

void sub_1D3E2EB14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object)
{
}

uint64_t awd::AWDPIILocationMessage::AWDPIILocationMessage(uint64_t result, char a2, char a3, char a4)
{
  *(void *)uint64_t result = &unk_1F2B9AD70;
  *(_DWORD *)(result + 8) = 0;
  *(unsigned char *)(result + 12) = a2;
  *(unsigned char *)(result + 13) = a3;
  *(unsigned char *)(result + 14) = a4;
  return result;
}

{
  *(void *)uint64_t result = &unk_1F2B9AD70;
  *(_DWORD *)(result + 8) = 0;
  *(unsigned char *)(result + 12) = a2;
  *(unsigned char *)(result + 13) = a3;
  *(unsigned char *)(result + 14) = a4;
  return result;
}

uint64_t awd::AWDPIILocationMessage::AWDPIILocationMessage(uint64_t result, int a2, char a3, char a4, char a5)
{
  *(void *)uint64_t result = &unk_1F2B9AD70;
  *(_DWORD *)(result + 8) = a2;
  *(unsigned char *)(result + 12) = a3;
  *(unsigned char *)(result + 13) = a4;
  *(unsigned char *)(result + 14) = a5;
  return result;
}

{
  *(void *)uint64_t result = &unk_1F2B9AD70;
  *(_DWORD *)(result + 8) = a2;
  *(unsigned char *)(result + 12) = a3;
  *(unsigned char *)(result + 13) = a4;
  *(unsigned char *)(result + 14) = a5;
  return result;
}

void awd::AWDPIILocationMessage::createXpcMessage(awd::AWDPIILocationMessage *this@<X0>, void *a2@<X8>)
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v5 = v4;
  if (v4)
  {
    *a2 = v4;
  }
  else
  {
    xpc_object_t v5 = xpc_null_create();
    *a2 = v5;
    if (!v5)
    {
      xpc_object_t v6 = xpc_null_create();
      xpc_object_t v5 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x1D94419C0](v5) == MEMORY[0x1E4F14590])
  {
    xpc_retain(v5);
    goto LABEL_9;
  }
  xpc_object_t v6 = xpc_null_create();
LABEL_8:
  *a2 = v6;
LABEL_9:
  xpc_release(v5);
  xpc_object_t v17 = xpc_int64_create(8);
  if (!v17) {
    xpc_object_t v17 = xpc_null_create();
  }
  int v15 = a2;
  __int16 v16 = "AWDMessageType";
  sub_1D3E1DB1C((uint64_t)&v15, &v17, &v18);
  xpc_release(v18);
  xpc_object_t v18 = 0;
  xpc_release(v17);
  xpc_object_t v17 = 0;
  xpc_object_t v13 = xpc_int64_create(*((unsigned int *)this + 2));
  if (!v13) {
    xpc_object_t v13 = xpc_null_create();
  }
  int v15 = a2;
  __int16 v16 = "AWDMessageComponentId";
  sub_1D3E1DB1C((uint64_t)&v15, &v13, &object);
  xpc_release(object);
  xpc_object_t object = 0;
  xpc_release(v13);
  xpc_object_t v13 = 0;
  xpc_object_t v11 = xpc_int64_create(*((unsigned __int8 *)this + 12));
  if (!v11) {
    xpc_object_t v11 = xpc_null_create();
  }
  int v15 = a2;
  __int16 v16 = "AWDMessagePII";
  sub_1D3E1DB1C((uint64_t)&v15, &v11, &v12);
  xpc_release(v12);
  xpc_object_t v12 = 0;
  xpc_release(v11);
  xpc_object_t v11 = 0;
  xpc_object_t v9 = xpc_int64_create(*((unsigned __int8 *)this + 13));
  if (!v9) {
    xpc_object_t v9 = xpc_null_create();
  }
  int v15 = a2;
  __int16 v16 = "AWDMessageLocKey";
  sub_1D3E1DB1C((uint64_t)&v15, &v9, &v10);
  xpc_release(v10);
  xpc_object_t v10 = 0;
  xpc_release(v9);
  xpc_object_t v9 = 0;
  xpc_object_t v7 = xpc_int64_create(*((unsigned __int8 *)this + 14));
  if (!v7) {
    xpc_object_t v7 = xpc_null_create();
  }
  int v15 = a2;
  __int16 v16 = "AWDMessageShimKey";
  sub_1D3E1DB1C((uint64_t)&v15, &v7, &v8);
  xpc_release(v8);
  xpc_object_t v8 = 0;
  xpc_release(v7);
}

uint64_t awd::AWDPIILocationMessage::getComponentId(awd::AWDPIILocationMessage *this)
{
  return *((unsigned int *)this + 2);
}

uint64_t awd::AWDPIILocationMessage::getCollectPII(awd::AWDPIILocationMessage *this)
{
  return *((unsigned __int8 *)this + 12);
}

uint64_t awd::AWDPIILocationMessage::getCollectLocation(awd::AWDPIILocationMessage *this)
{
  return *((unsigned __int8 *)this + 13);
}

uint64_t awd::AWDPIILocationMessage::getAnalyticsShimMode(awd::AWDPIILocationMessage *this)
{
  return *((unsigned __int8 *)this + 14);
}

void sub_1D3E2EEEC()
{
}

void *awd::AWDLocationUsedMessage::AWDLocationUsedMessage(void *this)
{
  *this = &unk_1F2B9AD98;
  return this;
}

{
  *this = &unk_1F2B9AD98;
  return this;
}

void *awd::AWDLocationUsedMessage::AWDLocationUsedMessage(void *result)
{
  *uint64_t result = &unk_1F2B9AD98;
  return result;
}

{
  *uint64_t result = &unk_1F2B9AD98;
  return result;
}

void awd::AWDLocationUsedMessage::createXpcMessage(xpc_object_t *a1@<X8>)
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  if (v3)
  {
    xpc_object_t v4 = v3;
    xpc_dictionary_set_int64(v3, "AWDMessageType", 9);
    *a1 = v4;
    if (MEMORY[0x1D94419C0](v4) == MEMORY[0x1E4F14590]) {
      xpc_retain(v4);
    }
    else {
      *a1 = xpc_null_create();
    }
    xpc_release(v4);
  }
  else
  {
    *a1 = xpc_null_create();
  }
}

void sub_1D3E2F01C()
{
}

uint64_t platform::getSubmissionPath@<X0>(platform *a1@<X0>, void *a2@<X8>)
{
  switch((int)a1)
  {
    case 2:
    case 3:
    case 4:
      PlatformBaseDir = (char *)platform::getPlatformBaseDir(a1);
      sub_1D3E270D0(a2, PlatformBaseDir);
      ctu::path_join_impl();
      uint64_t result = ctu::path_join_impl();
      break;
    default:
      xpc_object_t v5 = (char *)platform::getPlatformBaseDir(a1);
      sub_1D3E270D0(a2, v5);
      uint64_t result = ctu::path_join_impl();
      break;
  }
  return result;
}

void sub_1D3E2F148(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t platform::getStagingPath@<X0>(platform *this@<X0>, void *a2@<X8>)
{
  PlatformBaseDir = (char *)platform::getPlatformBaseDir(this);
  sub_1D3E270D0(a2, PlatformBaseDir);
  return ctu::path_join_impl();
}

void sub_1D3E2F1C0(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void *platform::getPersistentPath@<X0>(platform *this@<X0>, void *a2@<X8>)
{
  PlatformBaseDir = (char *)platform::getPlatformBaseDir(this);
  return sub_1D3E270D0(a2, PlatformBaseDir);
}

uint64_t awd::AWDBasicConfigType::AWDBasicConfigType(uint64_t a1, int a2)
{
  *(void *)a1 = &unk_1F2B9AD08;
  *(_DWORD *)(a1 + 16) = a2;
  return a1;
}

void awd::AWDBasicConfigType::~AWDBasicConfigType(awd::AWDBasicConfigType *this)
{
}

const char *awd::asString(int a1)
{
  if (a1) {
    return "?";
  }
  else {
    return "LoggingMetric";
  }
}

uint64_t awd::AWDTimerMessage::AWDTimerMessage(uint64_t this, int a2)
{
  *(void *)this = &unk_1F2B9AC50;
  *(_DWORD *)(this + MEMORY[0x1D9440F90]((char *)this + 8) = a2;
  return this;
}

{
  *(void *)this = &unk_1F2B9AC50;
  *(_DWORD *)(this + MEMORY[0x1D9440F90]((char *)this + 8) = a2;
  return this;
}

uint64_t awd::AWDTimerMessage::AWDTimerMessage(uint64_t a1, xpc_object_t *a2)
{
  *(void *)a1 = &unk_1F2B9AC50;
  *(_DWORD *)(a1 + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  if (MEMORY[0x1D94419C0](*a2) == MEMORY[0x1E4F14590]) {
    *(_DWORD *)(a1 + MEMORY[0x1D9440F90]((char *)this + 8) = xpc_dictionary_get_int64(*a2, "AWDMessageTimerId");
  }
  return a1;
}

void awd::AWDTimerMessage::createXpcMessage(awd::AWDTimerMessage *this@<X0>, xpc_object_t *a2@<X8>)
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  if (v4)
  {
    xpc_object_t v5 = v4;
    xpc_dictionary_set_int64(v4, "AWDMessageType", 13);
    xpc_dictionary_set_int64(v5, "AWDMessageTimerId", *((unsigned int *)this + 2));
    *a2 = v5;
    if (MEMORY[0x1D94419C0](v5) == MEMORY[0x1E4F14590]) {
      xpc_retain(v5);
    }
    else {
      *a2 = xpc_null_create();
    }
    xpc_release(v5);
  }
  else
  {
    *a2 = xpc_null_create();
  }
}

uint64_t awd::AWDTimerMessage::getTimerId(awd::AWDTimerMessage *this)
{
  return *((unsigned int *)this + 2);
}

void sub_1D3E2F458()
{
}

void AWDServerConnector::create(AWDServerConnector *this)
{
}

void sub_1D3E2F5E8(_Unwind_Exception *a1)
{
  MEMORY[0x1D94412F0](v1, 0x10B3C40AFEB2338);
  _Unwind_Resume(a1);
}

uint64_t sub_1D3E2F610(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 32) + 32))();
}

uint64_t sub_1D3E2F638(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(result + 32) = *(void *)(a2 + 32);
  *(void *)(result + 40) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_1D3E2F654(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 40);
  if (v1) {
    sub_1D3E1D148(v1);
  }
}

void AWDSimpleServerFacade::create(AWDSimpleServerFacade *this)
{
}

void sub_1D3E2F804(_Unwind_Exception *a1)
{
  MEMORY[0x1D94412F0](v1, 0x10B3C408CFE0061);
  _Unwind_Resume(a1);
}

void AWDSimpleServerFacade::AWDSimpleServerFacade(AWDSimpleServerFacade *this)
{
  AWDServerConnector::AWDServerConnector(this);
  *(void *)uint64_t v1 = &unk_1F2B9ABE0;
  *(_DWORD *)(v1 + 72) = 0;
  *(void *)(v1 + 80) = 0;
}

{
  uint64_t v1;

  AWDServerConnector::AWDServerConnector(this);
  *(void *)uint64_t v1 = &unk_1F2B9ABE0;
  *(_DWORD *)(v1 + 72) = 0;
  *(void *)(v1 + 80) = 0;
}

uint64_t sub_1D3E2F864(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 32) + 32))();
}

uint64_t sub_1D3E2F88C(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(result + 32) = *(void *)(a2 + 32);
  *(void *)(result + 40) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_1D3E2F8A8(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 40);
  if (v1) {
    sub_1D3E1D148(v1);
  }
}

void AWDServerConnector::AWDServerConnector(AWDServerConnector *this)
{
  sub_1D3E270D0(&__p, "com.apple.awd.server_connector");
  ctu::XpcClient::XpcClient();
  if (v3 < 0) {
    operator delete(__p);
  }
  *(void *)this = &unk_1F2B9AB50;
}

void sub_1D3E2F92C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void AWDServerConnector::~AWDServerConnector(AWDServerConnector *this)
{
  *(void *)this = &unk_1F2B9AB50;
  xpc_object_t object = xpc_null_create();
  ctu::XpcClient::setServer_sync();
  xpc_release(object);
  ctu::XpcClient::~XpcClient(this);
}

{
  uint64_t vars8;

  AWDServerConnector::~AWDServerConnector(this);
  JUMPOUT(0x1D94412F0);
}

uint64_t AWDServerConnector::init_sync(AWDServerConnector *this)
{
  if (CFNotificationCenterGetDarwinNotifyCenter()) {
    operator new();
  }
  return (*(uint64_t (**)(AWDServerConnector *))(*(void *)this + 40))(this);
}

void sub_1D3E2FAF8(_Unwind_Exception *a1)
{
  MEMORY[0x1D94412F0](v1, 0x20C40A4A59CD2);
  _Unwind_Resume(a1);
}

void sub_1D3E2FB1C(uint64_t a1, uint64_t *a2)
{
  if (a2)
  {
    char v3 = (std::__shared_weak_count *)a2[1];
    if (v3)
    {
      xpc_object_t v4 = std::__shared_weak_count::lock(v3);
      xpc_object_t v5 = v4;
      if (v4)
      {
        uint64_t v6 = *a2;
        if (*a2)
        {
          atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
          sub_1D3E248A0(&v9, (void *)(v6 + 8));
          operator new();
        }
      }
    }
    else
    {
      xpc_object_t v5 = 0;
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, a2, @"AWDD Started", @"AWDD");
    xpc_object_t v8 = (std::__shared_weak_count *)a2[1];
    if (v8) {
      std::__shared_weak_count::__release_weak(v8);
    }
    MEMORY[0x1D94412F0](a2, 0x20C40A4A59CD2);
    if (v5) {
      sub_1D3E1D148(v5);
    }
  }
}

void sub_1D3E2FC84(_Unwind_Exception *exception_object)
{
  if (v1) {
    sub_1D3E1D148(v1);
  }
  _Unwind_Resume(exception_object);
}

void AWDServerConnector::handleServerError_sync(uint64_t a1, void *a2)
{
  if (*a2 == MEMORY[0x1E4F14528] && MEMORY[0x1E4F14520] != MEMORY[0x1E4F14528])
  {
    xpc_object_t object = xpc_null_create();
    ctu::XpcClient::setServer_sync();
    xpc_release(object);
  }
}

void sub_1D3E2FD04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
}

void AWDServerConnector::initConnection_sync(dispatch_queue_t *this)
{
  mach_service = xpc_connection_create_mach_service("com.apple.awdd", this[3], 2uLL);
  if (!mach_service) {
    mach_service = xpc_null_create();
  }
  if (MEMORY[0x1D94419C0](mach_service) == MEMORY[0x1E4F14578])
  {
    xpc_object_t object = mach_service;
    if (mach_service) {
      xpc_retain(mach_service);
    }
    else {
      xpc_object_t object = xpc_null_create();
    }
    ctu::XpcClient::setServer_sync();
    xpc_release(object);
  }
  xpc_release(mach_service);
}

void sub_1D3E2FDCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(object);
  xpc_release(v10);
  _Unwind_Resume(a1);
}

void AWDServerConnector::send(uint64_t a1, void *a2)
{
  uint64_t v4 = MEMORY[0x1D94419C0](*a2);
  uint64_t v5 = MEMORY[0x1E4F14590];
  if (v4 != MEMORY[0x1E4F14590])
  {
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    if (v6 || (xpc_object_t v6 = xpc_null_create()) != 0)
    {
      if (MEMORY[0x1D94419C0](v6) == v5)
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
    uint64_t v9 = (void *)*a2;
    *a2 = v7;
    xpc_release(v9);
    xpc_release(v8);
  }
  xpc_object_t v10 = (void *)*a2;
  if (v10) {
    xpc_retain(v10);
  }
  else {
    xpc_null_create();
  }
  sub_1D3E248A0(&v11, (void *)(a1 + 8));
  operator new();
}

void AWDServerConnector::send(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = MEMORY[0x1D94419C0](*a2);
  uint64_t v9 = MEMORY[0x1E4F14590];
  if (v8 != MEMORY[0x1E4F14590])
  {
    xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
    if (v10 || (xpc_object_t v10 = xpc_null_create()) != 0)
    {
      if (MEMORY[0x1D94419C0](v10) == v9)
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
    xpc_object_t v12 = xpc_null_create();
    xpc_object_t v13 = (void *)*a2;
    *a2 = v11;
    xpc_release(v13);
    xpc_release(v12);
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 1174405120;
  v16[2] = sub_1D3E301E8;
  v16[3] = &unk_1F2B9C060;
  int8x16_t v14 = (void *)*a2;
  v16[5] = a1;
  xpc_object_t object = v14;
  if (v14) {
    xpc_retain(v14);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  uint64_t v18 = a3;
  v16[4] = a4;
  sub_1D3E248A0(&v21, (void *)(a1 + 8));
  int v15 = *(NSObject **)(a1 + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 1174405120;
  block[2] = sub_1D3E31BB8;
  block[3] = &unk_1F2B9BEA0;
  void block[5] = v21;
  int v20 = v22;
  if (v22) {
    atomic_fetch_add_explicit(&v22->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  void block[4] = v16;
  dispatch_async(v15, block);
  if (v20) {
    sub_1D3E1D148(v20);
  }
  if (v22) {
    sub_1D3E1D148(v22);
  }
  xpc_release(object);
}

void sub_1D3E301E8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (MEMORY[0x1D94419C0](*(void *)(v2 + 40)) == MEMORY[0x1E4F14578])
  {
    xpc_object_t v11 = xpc_int64_create(11);
    if (!v11) {
      xpc_object_t v11 = xpc_null_create();
    }
    uint64_t v9 = a1 + 48;
    xpc_object_t v10 = "AWDMessageType";
    sub_1D3E1DB1C((uint64_t)&v9, &v11, &v12);
    xpc_release(v12);
    xpc_object_t v12 = 0;
    xpc_release(v11);
    xpc_object_t v11 = 0;
    xpc_object_t v7 = xpc_string_create(*(const char **)(a1 + 56));
    if (!v7) {
      xpc_object_t v7 = xpc_null_create();
    }
    uint64_t v9 = a1 + 48;
    xpc_object_t v10 = "ManageRequest";
    sub_1D3E1DB1C((uint64_t)&v9, &v7, &object);
    xpc_release(object);
    xpc_object_t object = 0;
    xpc_release(v7);
    char v3 = *(_xpc_connection_s **)(v2 + 40);
    uint64_t v4 = *(void **)(a1 + 48);
    uint64_t v5 = *(NSObject **)(v2 + 24);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 0x40000000;
    handler[2] = sub_1D3E30360;
    handler[3] = &unk_1E69CA740;
    handler[4] = *(void *)(a1 + 32);
    xpc_object_t v7 = 0;
    xpc_connection_send_message_with_reply(v3, v4, v5, handler);
  }
  else
  {
    syslog(3, "Error! send: getServer_sync is NULL");
  }
}

void sub_1D3E30360(uint64_t a1, xpc_object_t object)
{
  uint64_t v2 = *(void *)(a1 + 32);
  xpc_object_t objecta = object;
  if (object) {
    xpc_retain(object);
  }
  else {
    xpc_object_t objecta = xpc_null_create();
  }
  (*(void (**)(uint64_t, xpc_object_t *))(v2 + 16))(v2, &objecta);
  xpc_release(objecta);
}

void sub_1D3E303C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
}

xpc_object_t sub_1D3E303E0(uint64_t a1, uint64_t a2)
{
  char v3 = *(void **)(a2 + 48);
  *(void *)(a1 + 4MEMORY[0x1D9440F90]((char *)this + 8) = v3;
  if (v3) {
    return xpc_retain(v3);
  }
  xpc_object_t result = xpc_null_create();
  *(void *)(a1 + 4MEMORY[0x1D9440F90]((char *)this + 8) = result;
  return result;
}

void sub_1D3E30420(uint64_t a1)
{
  *(void *)(a1 + 4MEMORY[0x1D9440F90]((char *)this + 8) = 0;
}

void AWDSimpleServerFacade::~AWDSimpleServerFacade(AWDSimpleServerFacade *this)
{
  *(void *)this = &unk_1F2B9ABE0;
  uint64_t v2 = (const void *)*((void *)this + 10);
  if (v2) {
    _Block_release(v2);
  }
  AWDServerConnector::~AWDServerConnector(this);
}

{
  uint64_t vars8;

  AWDSimpleServerFacade::~AWDSimpleServerFacade(this);
  JUMPOUT(0x1D94412F0);
}

uint64_t AWDSimpleServerFacade::handleServerError_sync(uint64_t a1, xpc_object_t *a2)
{
  xpc_object_t v4 = *a2;
  xpc_object_t v9 = v4;
  if (v4)
  {
    xpc_retain(v4);
  }
  else
  {
    xpc_object_t v4 = xpc_null_create();
    xpc_object_t v9 = v4;
  }
  AWDServerConnector::handleServerError_sync(a1, &v9);
  xpc_release(v4);
  sub_1D3E3061C(a2, __p);
  if (v8 >= 0) {
    uint64_t v5 = __p;
  }
  else {
    uint64_t v5 = (void **)__p[0];
  }
  syslog(3, "GOT XPC ERROR: %s", (const char *)v5);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  return AWDSimpleServerFacade::setState_sync(a1, 2);
}

void sub_1D3E305E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1D3E3061C(void *a1@<X0>, void *a2@<X8>)
{
  char v3 = (char *)MEMORY[0x1D94418E0](*a1);
  sub_1D3E270D0(a2, v3);
  free(v3);
}

uint64_t AWDSimpleServerFacade::setState_sync(uint64_t result, int a2)
{
  if (*(_DWORD *)(result + 72) != a2)
  {
    uint64_t v3 = result;
    syslog(3, "AWDD STATE CHANGED FROM %d to %d", *(_DWORD *)(result + 72), a2);
    *(_DWORD *)(v3 + 72) = a2;
    xpc_object_t result = *(void *)(v3 + 80);
    if (result)
    {
      xpc_object_t v4 = *(uint64_t (**)(void))(result + 16);
      return v4();
    }
  }
  return result;
}

_DWORD *AWDSimpleServerFacade::handleAwddStarted_sync(_DWORD *this)
{
  int v1 = this[18];
  if (!v1) {
    return (_DWORD *)AWDSimpleServerFacade::setState_sync((uint64_t)this, 1);
  }
  if (v1 == 2) {
    return (_DWORD *)(*(uint64_t (**)(void))(*(void *)this + 40))();
  }
  return this;
}

void AWDSimpleServerFacade::getCurrentConfig(uint64_t a1, uint64_t a2)
{
  xpc_object_t v5 = xpc_null_create();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  void v4[2] = sub_1D3E307E8;
  v4[3] = &unk_1E69CA768;
  v4[4] = a2;
  v4[5] = a1;
  AWDServerConnector::send(a1, &v5, (uint64_t)"CopyConfig", (uint64_t)v4);
  xpc_release(v5);
}

void sub_1D3E307CC(_Unwind_Exception *a1)
{
  xpc_release(*(xpc_object_t *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1D3E307E8(uint64_t a1, xpc_object_t *a2)
{
  uint64_t v4 = *(void *)(a1 + 40);
  sub_1D3E3061C(a2, __p);
  if (v11 >= 0) {
    xpc_object_t v5 = __p;
  }
  else {
    xpc_object_t v5 = (void **)__p[0];
  }
  syslog(3, "GOT XPC REPLY: %s", (const char *)v5);
  if (v11 < 0) {
    operator delete(__p[0]);
  }
  xpc_object_t v6 = *a2;
  uint64_t v7 = MEMORY[0x1E4F14590];
  if (v6 && MEMORY[0x1D94419C0](v6) == v7) {
    xpc_retain(v6);
  }
  else {
    xpc_object_t v6 = xpc_null_create();
  }
  if (MEMORY[0x1D94419C0](v6) == v7) {
    AWDSimpleServerFacade::setState_sync(v4, 1);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  xpc_object_t object = v6;
  if (v6) {
    xpc_retain(v6);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  (*(void (**)(uint64_t, xpc_object_t *))(v8 + 16))(v8, &object);
  xpc_release(object);
  xpc_object_t object = 0;
  xpc_release(v6);
}

void sub_1D3E30904(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t object, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  xpc_release(object);
  xpc_release(v17);
  _Unwind_Resume(a1);
}

void AWDSimpleServerFacade::getConfigsAvailable(uint64_t a1, uint64_t a2)
{
  xpc_object_t v5 = xpc_null_create();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  void v4[2] = sub_1D3E30A10;
  v4[3] = &unk_1E69CA790;
  v4[4] = a2;
  v4[5] = a1;
  AWDServerConnector::send(a1, &v5, (uint64_t)"GetConfigsAvailable", (uint64_t)v4);
  xpc_release(v5);
}

void sub_1D3E309F4(_Unwind_Exception *a1)
{
  xpc_release(*(xpc_object_t *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1D3E30A10(uint64_t a1, xpc_object_t *a2)
{
  uint64_t v4 = *(void *)(a1 + 40);
  sub_1D3E3061C(a2, __p);
  if (v11 >= 0) {
    xpc_object_t v5 = __p;
  }
  else {
    xpc_object_t v5 = (void **)__p[0];
  }
  syslog(3, "GOT XPC REPLY: %s", (const char *)v5);
  if (v11 < 0) {
    operator delete(__p[0]);
  }
  xpc_object_t v6 = *a2;
  uint64_t v7 = MEMORY[0x1E4F14590];
  if (v6 && MEMORY[0x1D94419C0](v6) == v7) {
    xpc_retain(v6);
  }
  else {
    xpc_object_t v6 = xpc_null_create();
  }
  if (MEMORY[0x1D94419C0](v6) == v7) {
    AWDSimpleServerFacade::setState_sync(v4, 1);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  xpc_object_t object = v6;
  if (v6) {
    xpc_retain(v6);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  (*(void (**)(uint64_t, xpc_object_t *))(v8 + 16))(v8, &object);
  xpc_release(object);
  xpc_object_t object = 0;
  xpc_release(v6);
}

void sub_1D3E30B2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t object, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  xpc_release(object);
  xpc_release(v17);
  _Unwind_Resume(a1);
}

void AWDSimpleServerFacade::setConfig(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v9 = v8;
  if (v8)
  {
    xpc_object_t v20 = v8;
  }
  else
  {
    xpc_object_t v9 = xpc_null_create();
    xpc_object_t v20 = v9;
    if (!v9)
    {
      xpc_object_t v10 = xpc_null_create();
      xpc_object_t v9 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x1D94419C0](v9) == MEMORY[0x1E4F14590])
  {
    xpc_retain(v9);
    goto LABEL_9;
  }
  xpc_object_t v10 = xpc_null_create();
LABEL_8:
  xpc_object_t v20 = v10;
LABEL_9:
  xpc_release(v9);
  if (*(char *)(a2 + 23) >= 0) {
    char v11 = (const char *)a2;
  }
  else {
    char v11 = *(const char **)a2;
  }
  xpc_object_t v18 = xpc_string_create(v11);
  if (!v18) {
    xpc_object_t v18 = xpc_null_create();
  }
  __int16 v16 = &v20;
  xpc_object_t v17 = "config";
  sub_1D3E1DB1C((uint64_t)&v16, &v18, &v19);
  xpc_release(v19);
  xpc_object_t v19 = 0;
  xpc_release(v18);
  xpc_object_t v18 = 0;
  xpc_object_t v14 = xpc_int64_create(a3);
  if (!v14) {
    xpc_object_t v14 = xpc_null_create();
  }
  __int16 v16 = &v20;
  xpc_object_t v17 = "InvestigationId";
  sub_1D3E1DB1C((uint64_t)&v16, &v14, &object);
  xpc_release(object);
  xpc_object_t object = 0;
  xpc_release(v14);
  xpc_object_t v13 = v20;
  xpc_object_t v14 = 0;
  if (v20) {
    xpc_retain(v20);
  }
  else {
    xpc_object_t v13 = xpc_null_create();
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 0x40000000;
  v12[2] = sub_1D3E30DCC;
  void v12[3] = &unk_1E69CA7B8;
  v12[4] = a4;
  void v12[5] = a1;
  AWDServerConnector::send(a1, &v13, (uint64_t)"SetConfig", (uint64_t)v12);
  xpc_release(v13);
  xpc_object_t v13 = 0;
  xpc_release(v20);
}

void sub_1D3E30D7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, xpc_object_t object)
{
  xpc_release(object);
  xpc_release(*(xpc_object_t *)(v15 - 56));
  _Unwind_Resume(a1);
}

void sub_1D3E30DCC(uint64_t a1, xpc_object_t *a2)
{
  uint64_t v4 = *(void *)(a1 + 40);
  sub_1D3E3061C(a2, __p);
  if (v11 >= 0) {
    xpc_object_t v5 = __p;
  }
  else {
    xpc_object_t v5 = (void **)__p[0];
  }
  syslog(3, "GOT XPC REPLY: %s", (const char *)v5);
  if (v11 < 0) {
    operator delete(__p[0]);
  }
  xpc_object_t v6 = *a2;
  uint64_t v7 = MEMORY[0x1E4F14590];
  if (v6 && MEMORY[0x1D94419C0](v6) == v7) {
    xpc_retain(v6);
  }
  else {
    xpc_object_t v6 = xpc_null_create();
  }
  if (MEMORY[0x1D94419C0](v6) == v7) {
    AWDSimpleServerFacade::setState_sync(v4, 1);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  xpc_object_t object = v6;
  if (v6) {
    xpc_retain(v6);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  (*(void (**)(uint64_t, xpc_object_t *))(v8 + 16))(v8, &object);
  xpc_release(object);
  xpc_object_t object = 0;
  xpc_release(v6);
}

void sub_1D3E30EE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t object, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  xpc_release(object);
  xpc_release(v17);
  _Unwind_Resume(a1);
}

void AWDSimpleServerFacade::setProperty(uint64_t a1, uint64_t *a2, BOOL a3)
{
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v7 = v6;
  if (v6)
  {
    xpc_object_t v15 = v6;
  }
  else
  {
    xpc_object_t v7 = xpc_null_create();
    xpc_object_t v15 = v7;
    if (!v7)
    {
      xpc_object_t v8 = xpc_null_create();
      xpc_object_t v7 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x1D94419C0](v7) == MEMORY[0x1E4F14590])
  {
    xpc_retain(v7);
    goto LABEL_9;
  }
  xpc_object_t v8 = xpc_null_create();
LABEL_8:
  xpc_object_t v15 = v8;
LABEL_9:
  xpc_release(v7);
  xpc_object_t v13 = xpc_BOOL_create(a3);
  if (!v13) {
    xpc_object_t v13 = xpc_null_create();
  }
  if (*((char *)a2 + 23) >= 0) {
    xpc_object_t v9 = a2;
  }
  else {
    xpc_object_t v9 = (uint64_t *)*a2;
  }
  v12[0] = &v15;
  v12[1] = v9;
  sub_1D3E1DB1C((uint64_t)v12, &v13, &v14);
  xpc_release(v14);
  xpc_object_t v14 = 0;
  xpc_release(v13);
  xpc_object_t v13 = 0;
  xpc_object_t object = v15;
  if (v15) {
    xpc_retain(v15);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 0x40000000;
  v10[2] = sub_1D3E3111C;
  v10[3] = &unk_1E69CA4B0;
  v10[4] = a1;
  AWDServerConnector::send(a1, &object, (uint64_t)"SetProperty", (uint64_t)v10);
  xpc_release(object);
  xpc_object_t object = 0;
  xpc_release(v15);
}

void sub_1D3E310D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, xpc_object_t object)
{
  xpc_release(object);
  xpc_release(*(xpc_object_t *)(v15 - 40));
  _Unwind_Resume(a1);
}

void sub_1D3E3111C(uint64_t a1, xpc_object_t *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  sub_1D3E3061C(a2, __p);
  if (v8 >= 0) {
    uint64_t v4 = __p;
  }
  else {
    uint64_t v4 = (void **)__p[0];
  }
  syslog(3, "GOT XPC REPLY: %s", (const char *)v4);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  xpc_object_t v5 = *a2;
  uint64_t v6 = MEMORY[0x1E4F14590];
  if (v5 && MEMORY[0x1D94419C0](v5) == v6) {
    xpc_retain(v5);
  }
  else {
    xpc_object_t v5 = xpc_null_create();
  }
  if (MEMORY[0x1D94419C0](v5) == v6) {
    AWDSimpleServerFacade::setState_sync(v3, 1);
  }
  xpc_release(v5);
}

void sub_1D3E311F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void AWDSimpleServerFacade::submitMetricsNow(AWDSimpleServerFacade *this)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v3 = v2;
  if (v2)
  {
    xpc_object_t v9 = v2;
  }
  else
  {
    xpc_object_t v3 = xpc_null_create();
    xpc_object_t v9 = v3;
    if (!v3)
    {
      xpc_object_t v4 = xpc_null_create();
      xpc_object_t v3 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x1D94419C0](v3) == MEMORY[0x1E4F14590])
  {
    xpc_retain(v3);
    goto LABEL_9;
  }
  xpc_object_t v4 = xpc_null_create();
LABEL_8:
  xpc_object_t v9 = v4;
LABEL_9:
  xpc_release(v3);
  xpc_object_t v7 = xpc_int64_create(7);
  if (!v7) {
    xpc_object_t v7 = xpc_null_create();
  }
  xpc_object_t v10 = &v9;
  char v11 = "AWDMessageType";
  sub_1D3E1DB1C((uint64_t)&v10, &v7, &object);
  xpc_release(object);
  xpc_object_t object = 0;
  xpc_release(v7);
  xpc_object_t v7 = 0;
  xpc_object_t v5 = xpc_int64_create(3);
  if (!v5) {
    xpc_object_t v5 = xpc_null_create();
  }
  xpc_object_t v10 = &v9;
  char v11 = "AWDMessageControlMessageType";
  sub_1D3E1DB1C((uint64_t)&v10, &v5, &v6);
  xpc_release(v6);
  xpc_object_t v6 = 0;
  xpc_release(v5);
  xpc_object_t v5 = 0;
  if (v9) {
    xpc_retain(v9);
  }
  else {
    xpc_null_create();
  }
  sub_1D3E248A0(&v10, (void *)this + 1);
  operator new();
}

void AWDSimpleServerFacade::dumpLogs(AWDSimpleServerFacade *this)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v3 = v2;
  if (v2)
  {
    xpc_object_t v9 = v2;
  }
  else
  {
    xpc_object_t v3 = xpc_null_create();
    xpc_object_t v9 = v3;
    if (!v3)
    {
      xpc_object_t v4 = xpc_null_create();
      xpc_object_t v3 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x1D94419C0](v3) == MEMORY[0x1E4F14590])
  {
    xpc_retain(v3);
    goto LABEL_9;
  }
  xpc_object_t v4 = xpc_null_create();
LABEL_8:
  xpc_object_t v9 = v4;
LABEL_9:
  xpc_release(v3);
  xpc_object_t v7 = xpc_int64_create(7);
  if (!v7) {
    xpc_object_t v7 = xpc_null_create();
  }
  xpc_object_t v10 = &v9;
  char v11 = "AWDMessageType";
  sub_1D3E1DB1C((uint64_t)&v10, &v7, &object);
  xpc_release(object);
  xpc_object_t object = 0;
  xpc_release(v7);
  xpc_object_t v7 = 0;
  xpc_object_t v5 = xpc_int64_create(7);
  if (!v5) {
    xpc_object_t v5 = xpc_null_create();
  }
  xpc_object_t v10 = &v9;
  char v11 = "AWDMessageControlMessageType";
  sub_1D3E1DB1C((uint64_t)&v10, &v5, &v6);
  xpc_release(v6);
  xpc_object_t v6 = 0;
  xpc_release(v5);
  xpc_object_t v5 = 0;
  if (v9) {
    xpc_retain(v9);
  }
  else {
    xpc_null_create();
  }
  sub_1D3E248A0(&v10, (void *)this + 1);
  operator new();
}

void AWDSimpleServerFacade::setStateChangedCallback(uint64_t a1, void *aBlock)
{
  if (aBlock) {
    xpc_object_t v3 = _Block_copy(aBlock);
  }
  else {
    xpc_object_t v3 = 0;
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 1174405120;
  unsigned int v6[2] = sub_1D3E31854;
  v6[3] = &unk_1F2B9BDD8;
  v6[4] = a1;
  if (v3) {
    xpc_object_t v4 = _Block_copy(v3);
  }
  else {
    xpc_object_t v4 = 0;
  }
  aBlocka = v4;
  sub_1D3E248A0(&v10, (void *)(a1 + 8));
  xpc_object_t v5 = *(NSObject **)(a1 + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 1174405120;
  block[2] = sub_1D3E31BB8;
  block[3] = &unk_1F2B9BEA0;
  void block[5] = v10;
  xpc_object_t v9 = v11;
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  void block[4] = v6;
  dispatch_async(v5, block);
  if (v9) {
    sub_1D3E1D148(v9);
  }
  if (v11) {
    sub_1D3E1D148(v11);
  }
  if (aBlocka) {
    _Block_release(aBlocka);
  }
  if (v3) {
    _Block_release(v3);
  }
}

uint64_t sub_1D3E31854(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  xpc_object_t v2 = *(void **)(a1 + 40);
  if (v2) {
    xpc_object_t v2 = _Block_copy(v2);
  }
  xpc_object_t v4 = *(const void **)(v3 + 80);
  *(void *)(v3 + 80) = v2;
  if (v4) {
    _Block_release(v4);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    xpc_object_t v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

void *sub_1D3E318CC(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void **)(a2 + 40);
  if (result) {
    uint64_t result = _Block_copy(result);
  }
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_1D3E31900(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 40);
  if (v1) {
    _Block_release(v1);
  }
}

uint64_t AWDSimpleServerFacade::initConnection_sync(dispatch_queue_t *this)
{
  AWDServerConnector::initConnection_sync(this);
  return AWDSimpleServerFacade::setState_sync((uint64_t)this, 0);
}

uint64_t *sub_1D3E31960(void **a1, uint64_t a2)
{
  xpc_object_t v2 = *a1;
  xpc_object_t v4 = a1;
  xpc_object_t v5 = v2;
  (*(void (**)(void, uint64_t))(*(void *)*v2 + 48))(*v2, a2);
  sub_1D3E319E0((uint64_t *)&v5);
  return sub_1D3E24D00((uint64_t *)&v4);
}

void sub_1D3E319C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

uint64_t *sub_1D3E319E0(uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    uint64_t v3 = *(std::__shared_weak_count **)(v2 + 8);
    if (v3) {
      sub_1D3E1D148(v3);
    }
    MEMORY[0x1D94412F0](v2, 0x20C40A4A59CD2);
  }
  return a1;
}

void sub_1D3E31A34(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_1D3E31AB4(void *a1)
{
  __cxa_begin_catch(a1);
  dispatch_barrier_async_f(v1[3], v1, (dispatch_function_t)sub_1D3E31B8C);
  __cxa_rethrow();
}

void sub_1D3E31ADC(_Unwind_Exception *a1)
{
}

void sub_1D3E31AF4(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1D94412F0);
}

void sub_1D3E31B2C(uint64_t a1)
{
}

uint64_t sub_1D3E31B48(uint64_t a1, uint64_t a2)
{
  if (sub_1D3E247D4(a2, (uint64_t)&unk_1F2B9AAE8)) {
    return a1 + 24;
  }
  else {
    return 0;
  }
}

uint64_t sub_1D3E31B8C(uint64_t result)
{
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 24))();
  }
  return result;
}

uint64_t sub_1D3E31BB8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1D3E31BC8(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 4MEMORY[0x1D9440F90]((char *)this + 8) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_1D3E31BE4(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    sub_1D3E1D148(v1);
  }
}

void sub_1D3E31BF4(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_1D3E31C74(void *a1)
{
  __cxa_begin_catch(a1);
  dispatch_barrier_async_f(v1[3], v1, (dispatch_function_t)sub_1D3E31D4C);
  __cxa_rethrow();
}

void sub_1D3E31C9C(_Unwind_Exception *a1)
{
}

void sub_1D3E31CB4(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1D94412F0);
}

void sub_1D3E31CEC(uint64_t a1)
{
}

uint64_t sub_1D3E31D08(uint64_t a1, uint64_t a2)
{
  if (sub_1D3E247D4(a2, (uint64_t)&unk_1F2B9AB08)) {
    return a1 + 24;
  }
  else {
    return 0;
  }
}

uint64_t sub_1D3E31D4C(uint64_t result)
{
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 24))();
  }
  return result;
}

uint64_t *sub_1D3E31D78(uint64_t *a1)
{
  uint64_t v1 = *a1;
  xpc_object_t v4 = a1;
  uint64_t v5 = v1;
  uint64_t v2 = *(void *)v1;
  if (MEMORY[0x1D94419C0](*(void *)(*(void *)v1 + 40)) == MEMORY[0x1E4F14578])
  {
    xpc_object_t object = xpc_int64_create(11);
    if (!object) {
      xpc_object_t object = xpc_null_create();
    }
    uint64_t v8 = v1 + 8;
    xpc_object_t v9 = "AWDMessageType";
    sub_1D3E1DB1C((uint64_t)&v8, &object, &v11);
    xpc_release(v11);
    xpc_object_t v11 = 0;
    xpc_release(object);
    xpc_object_t object = 0;
    xpc_object_t v6 = xpc_string_create(*(const char **)(v1 + 16));
    if (!v6) {
      xpc_object_t v6 = xpc_null_create();
    }
    uint64_t v8 = v1 + 8;
    xpc_object_t v9 = "ManageRequest";
    sub_1D3E1DB1C((uint64_t)&v8, &v6, &v7);
    xpc_release(v7);
    xpc_object_t v7 = 0;
    xpc_release(v6);
    xpc_object_t v6 = 0;
    xpc_connection_send_message(*(xpc_connection_t *)(v2 + 40), *(xpc_object_t *)(v1 + 8));
  }
  else
  {
    syslog(3, "Error! send: getServer_sync is NULL");
  }
  sub_1D3E31ED0(&v5);
  return sub_1D3E24D00((uint64_t *)&v4);
}

void sub_1D3E31EB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

uint64_t *sub_1D3E31ED0(uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    xpc_release(*(xpc_object_t *)(v2 + 8));
    *(void *)(v2 + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
    MEMORY[0x1D94412F0](v2, 0xF0C4088EBFEECLL);
  }
  return a1;
}

uint64_t *sub_1D3E31F28(void **a1)
{
  uint64_t v1 = *a1;
  xpc_object_t v7 = a1;
  uint64_t v8 = v1;
  uint64_t v2 = *v1;
  if (MEMORY[0x1D94419C0](*(void *)(*v1 + 40)) == MEMORY[0x1E4F14578])
  {
    uint64_t v3 = *(_xpc_connection_s **)(v2 + 40);
    xpc_object_t v4 = (void *)v1[1];
    uint64_t v5 = *(NSObject **)(v2 + 24);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 0x40000000;
    handler[2] = sub_1D3E32064;
    handler[3] = &unk_1E69CA7D8;
    handler[4] = v2;
    xpc_connection_send_message_with_reply(v3, v4, v5, handler);
  }
  else
  {
    syslog(3, "Error! send: getServer_sync is NULL");
  }
  sub_1D3E3200C((uint64_t *)&v8);
  return sub_1D3E24D00((uint64_t *)&v7);
}

void sub_1D3E31FF0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v3 = va_arg(va1, void);
  sub_1D3E3200C((uint64_t *)va1);
  sub_1D3E24D00((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t *sub_1D3E3200C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    xpc_release(*(xpc_object_t *)(v2 + 8));
    *(void *)(v2 + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
    MEMORY[0x1D94412F0](v2, 0xA0C40AFF93C70);
  }
  return a1;
}

void sub_1D3E32064(uint64_t a1, xpc_object_t object)
{
  xpc_object_t v2 = object;
  uint64_t v3 = *(void *)(a1 + 32);
  if (object)
  {
    xpc_retain(object);
    xpc_object_t v4 = v2;
  }
  else
  {
    xpc_object_t v4 = xpc_null_create();
  }
  uint64_t v5 = (char *)MEMORY[0x1D94418E0](v4);
  sub_1D3E270D0(__p, v5);
  free(v5);
  if (v10 >= 0) {
    xpc_object_t v6 = __p;
  }
  else {
    xpc_object_t v6 = (void **)__p[0];
  }
  syslog(3, "GOT XPC REPLY: %s", (const char *)v6);
  if (v10 < 0) {
    operator delete(__p[0]);
  }
  xpc_release(v4);
  uint64_t v7 = MEMORY[0x1E4F14590];
  if (v2)
  {
    xpc_retain(v2);
  }
  else
  {
    xpc_object_t v2 = xpc_null_create();
    if (!v2)
    {
      xpc_object_t v8 = xpc_null_create();
      xpc_object_t v2 = 0;
      goto LABEL_16;
    }
  }
  if (MEMORY[0x1D94419C0](v2) == v7)
  {
    xpc_retain(v2);
    xpc_object_t v8 = v2;
  }
  else
  {
    xpc_object_t v8 = xpc_null_create();
  }
LABEL_16:
  xpc_release(v2);
  if (MEMORY[0x1D94419C0](v8) == v7) {
    AWDSimpleServerFacade::setState_sync(v3, 1);
  }
  xpc_release(v8);
}

void sub_1D3E321B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  xpc_release(v15);
  _Unwind_Resume(a1);
}

uint64_t *sub_1D3E32200(void **a1)
{
  uint64_t v1 = *a1;
  uint64_t v7 = a1;
  xpc_object_t v8 = v1;
  uint64_t v2 = *v1;
  if (MEMORY[0x1D94419C0](*(void *)(*v1 + 40)) == MEMORY[0x1E4F14578])
  {
    uint64_t v3 = *(_xpc_connection_s **)(v2 + 40);
    xpc_object_t v4 = (void *)v1[1];
    uint64_t v5 = *(NSObject **)(v2 + 24);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 0x40000000;
    handler[2] = sub_1D3E3233C;
    handler[3] = &unk_1E69CA7F8;
    handler[4] = v2;
    xpc_connection_send_message_with_reply(v3, v4, v5, handler);
  }
  else
  {
    syslog(3, "Error! send: getServer_sync is NULL");
  }
  sub_1D3E322E4((uint64_t *)&v8);
  return sub_1D3E24D00((uint64_t *)&v7);
}

void sub_1D3E322C8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v3 = va_arg(va1, void);
  sub_1D3E322E4((uint64_t *)va1);
  sub_1D3E24D00((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t *sub_1D3E322E4(uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    xpc_release(*(xpc_object_t *)(v2 + 8));
    *(void *)(v2 + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
    MEMORY[0x1D94412F0](v2, 0xA0C40AFF93C70);
  }
  return a1;
}

void sub_1D3E3233C(uint64_t a1, xpc_object_t object)
{
  xpc_object_t v2 = object;
  uint64_t v3 = *(void *)(a1 + 32);
  if (object)
  {
    xpc_retain(object);
    xpc_object_t v4 = v2;
  }
  else
  {
    xpc_object_t v4 = xpc_null_create();
  }
  uint64_t v5 = (char *)MEMORY[0x1D94418E0](v4);
  sub_1D3E270D0(__p, v5);
  free(v5);
  if (v10 >= 0) {
    xpc_object_t v6 = __p;
  }
  else {
    xpc_object_t v6 = (void **)__p[0];
  }
  syslog(3, "GOT XPC REPLY: %s", (const char *)v6);
  if (v10 < 0) {
    operator delete(__p[0]);
  }
  xpc_release(v4);
  uint64_t v7 = MEMORY[0x1E4F14590];
  if (v2)
  {
    xpc_retain(v2);
  }
  else
  {
    xpc_object_t v2 = xpc_null_create();
    if (!v2)
    {
      xpc_object_t v8 = xpc_null_create();
      xpc_object_t v2 = 0;
      goto LABEL_16;
    }
  }
  if (MEMORY[0x1D94419C0](v2) == v7)
  {
    xpc_retain(v2);
    xpc_object_t v8 = v2;
  }
  else
  {
    xpc_object_t v8 = xpc_null_create();
  }
LABEL_16:
  xpc_release(v2);
  if (MEMORY[0x1D94419C0](v8) == v7) {
    AWDSimpleServerFacade::setState_sync(v3, 1);
  }
  xpc_release(v8);
}

void sub_1D3E3248C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  xpc_release(v15);
  _Unwind_Resume(a1);
}

awd::AWDLoggingMetric *awd::AWDLoggingMetric::AWDLoggingMetric(awd::AWDLoggingMetric *this)
{
  *(void *)awd::AWDBasicConfigType::AWDBasicConfigType((uint64_t)this, 0) = &unk_1F2B9AC78;
  *((void *)this + 3) = dispatch_queue_create("com.apple.awd.AWDLoggingMetric", 0);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 0x40000000;
  aBlock[2] = sub_1D3E325A0;
  aBlock[3] = &unk_1E69CA490;
  aBlock[4] = this;
  xpc_object_t v2 = _Block_copy(aBlock);
  *((void *)this + 7) = 0;
  *((void *)this + 6) = 0;
  *((void *)this + 4) = v2;
  *((void *)this + 5) = (char *)this + 48;
  return this;
}

void sub_1D3E325A0(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)xpc_object_t v2 = 0;
    _os_log_impl(&dword_1D3E18000, v1, OS_LOG_TYPE_DEFAULT, "logging-metric:#E Did not find a QueriableMetricCallbackBlockWithParameters for Logging.", v2, 2u);
  }
}

void awd::AWDLoggingMetric::~AWDLoggingMetric(awd::AWDLoggingMetric *this)
{
  *(void *)this = &unk_1F2B9AC78;
  xpc_object_t v2 = (char *)this + 40;
  uint64_t v3 = (char *)*((void *)this + 5);
  xpc_object_t v4 = (char *)this + 48;
  if (v3 != (char *)this + 48)
  {
    do
    {
      uint64_t v5 = (const void *)*((void *)v3 + 5);
      if (v5) {
        CFRelease(v5);
      }
      xpc_object_t v6 = (char *)*((void *)v3 + 1);
      if (v6)
      {
        do
        {
          uint64_t v7 = v6;
          xpc_object_t v6 = *(char **)v6;
        }
        while (v6);
      }
      else
      {
        do
        {
          uint64_t v7 = (char *)*((void *)v3 + 2);
          BOOL v8 = *(void *)v7 == (void)v3;
          uint64_t v3 = v7;
        }
        while (!v8);
      }
      uint64_t v3 = v7;
    }
    while (v7 != v4);
  }
  sub_1D3E20F64((uint64_t)v2, *((void **)this + 6));
  xpc_object_t v9 = (const void *)*((void *)this + 4);
  if (v9) {
    _Block_release(v9);
  }
  char v10 = *((void *)this + 3);
  if (v10) {
    dispatch_release(v10);
  }
  awd::AWDBasicConfigType::~AWDBasicConfigType(this);
}

{
  uint64_t vars8;

  awd::AWDLoggingMetric::~AWDLoggingMetric(this);
  JUMPOUT(0x1D94412F0);
}

const char *awd::AWDLoggingMetric::getName(awd::AWDLoggingMetric *this)
{
  return "AWDLoggingMetric";
}

void awd::AWDLoggingMetric::setConfiguration(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *(NSObject **)(a1 + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 1174405120;
  block[2] = sub_1D3E327C8;
  block[3] = &unk_1F2B9BF00;
  uint64_t v5 = *a2;
  xpc_object_t v4 = (std::__shared_weak_count *)a2[1];
  void block[4] = a1;
  void block[5] = v5;
  uint64_t v7 = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  dispatch_async(v3, block);
  if (v7) {
    sub_1D3E1D148(v7);
  }
}

void sub_1D3E327C8(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = (std::__shared_weak_count *)a1[6];
  v4[0] = a1[5];
  v4[1] = (uint64_t)v3;
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  awd::AWDLoggingMetric::setConfiguration_sync(v2, v4);
  if (v3)
  {
    sub_1D3E1D148(v3);
  }
}

void sub_1D3E3283C(_Unwind_Exception *exception_object)
{
  if (v1) {
    sub_1D3E1D148(v1);
  }
  _Unwind_Resume(exception_object);
}

void awd::AWDLoggingMetric::setConfiguration_sync(uint64_t a1, uint64_t *a2)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  xpc_object_t v4 = (std::__shared_weak_count *)a2[1];
  uint64_t v43 = *a2;
  uint64_t v44 = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  awd::AWDBasicConfigType::setConfiguration(a1, &v43);
  if (v44) {
    sub_1D3E1D148(v44);
  }
  uint64_t v6 = *a2;
  if (*a2)
  {
    uint64_t v7 = *(int *)(v6 + 16);
    if (v7)
    {
      BOOL v8 = *(uint64_t **)(v6 + 8);
      xpc_object_t v9 = &v8[v7];
      unint64_t v36 = (uint64_t **)(a1 + 40);
      CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      *(void *)&long long v5 = 67109120;
      long long v37 = v5;
      *(void *)&long long v5 = 67109634;
      long long v39 = v5;
      int v35 = v9;
      do
      {
        uint64_t v11 = *v8;
        int v12 = *(_DWORD *)(*v8 + 132);
        if (v12)
        {
          if ((v12 & 8) != 0)
          {
            unsigned int v42 = *(_DWORD *)(v11 + 32);
            if ((v12 & 0x80) != 0)
            {
              xpc_object_t v19 = *(NSObject **)(a1 + 8);
              if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)long long buf = 0;
                _os_log_impl(&dword_1D3E18000, v19, OS_LOG_TYPE_INFO, "logging-metric:#I Found Log in configuration", buf, 2u);
              }
              uint64_t v20 = *(void *)(v11 + 72);
              if (!v20) {
                uint64_t v20 = *(void *)(awd::profile::Profile::default_instance_ + 72);
              }
              uint64_t v38 = (uint64_t *)&v35;
              uint64_t v21 = *(unsigned int *)(v20 + 16);
              MEMORY[0x1F4188790]();
              uint64_t v22 = (8 * v21 + 15) & 0xFFFFFFFF0;
              __int16 v23 = (const void **)((char *)&v35 - v22);
              if ((unint64_t)(8 * v21) >= 0x200) {
                size_t v24 = 512;
              }
              else {
                size_t v24 = 8 * v21;
              }
              bzero((char *)&v35 - v22, v24);
              MEMORY[0x1F4188790]();
              __int16 v25 = (CFTypeRef *)((char *)&v35 - v22);
              bzero(v25, v24);
              if ((int)v21 >= 1)
              {
                for (uint64_t i = 0; i != v21; ++i)
                {
                  uint64_t v27 = *(void *)(*(void *)(v20 + 8) + 8 * i);
                  sub_1D3E270D0(&v41, "No Key");
                  sub_1D3E270D0(&v40, (char *)&unk_1D3E5393F);
                  int v28 = *(_DWORD *)(v27 + 28);
                  if (v28)
                  {
                    std::string::operator=(&v41, *(const std::string **)(v27 + 8));
                    int v28 = *(_DWORD *)(v27 + 28);
                  }
                  if ((v28 & 2) != 0) {
                    std::string::operator=(&v40, *(const std::string **)(v27 + 16));
                  }
                  xpc_object_t v29 = *(NSObject **)(a1 + 8);
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
                  {
                    uint64_t v30 = &v41;
                    if ((v41.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
                      uint64_t v30 = (std::string *)v41.__r_.__value_.__r.__words[0];
                    }
                    if ((v40.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                      uint64_t v31 = &v40;
                    }
                    else {
                      uint64_t v31 = (std::string *)v40.__r_.__value_.__r.__words[0];
                    }
                    *(_DWORD *)long long buf = v39;
                    *(_DWORD *)&uint8_t buf[4] = i;
                    __int16 v46 = 2080;
                    uint64_t v47 = v30;
                    __int16 v48 = 2080;
                    __int16 v49 = v31;
                    _os_log_impl(&dword_1D3E18000, v29, OS_LOG_TYPE_INFO, "logging-metric:#I Log's param #%d %s:%s", buf, 0x1Cu);
                  }
                  if ((v41.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                    uint64_t v32 = &v41;
                  }
                  else {
                    uint64_t v32 = (std::string *)v41.__r_.__value_.__r.__words[0];
                  }
                  v23[i] = CFStringCreateWithCString(v10, (const char *)v32, 0x8000100u);
                  if ((v40.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                    uint64_t v33 = &v40;
                  }
                  else {
                    uint64_t v33 = (std::string *)v40.__r_.__value_.__r.__words[0];
                  }
                  v25[i] = CFStringCreateWithCString(v10, (const char *)v33, 0x8000100u);
                  if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0) {
                    operator delete(v40.__r_.__value_.__l.__data_);
                  }
                  if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0) {
                    operator delete(v41.__r_.__value_.__l.__data_);
                  }
                }
              }
              uint64_t v34 = (uint64_t *)CFDictionaryCreate(v10, v23, v25, (int)v21, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
              *(void *)long long buf = &v42;
              sub_1D3E33128(v36, &v42, (uint64_t)&unk_1D3E53161, (_DWORD **)buf)[5] = v34;
              if ((int)v21 > 0)
              {
                do
                {
                  CFRelease(*v23);
                  CFRelease(*v25++);
                  ++v23;
                  --v21;
                }
                while (v21);
              }
              xpc_object_t v9 = v35;
            }
            goto LABEL_50;
          }
          int v17 = *(_DWORD *)(v11 + 8);
          xpc_object_t v18 = *(NSObject **)(a1 + 8);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = v37;
            *(_DWORD *)&uint8_t buf[4] = v17;
            xpc_object_t v14 = v18;
            uint64_t v15 = "logging-metric:#E AWDLoggingMetric: Got profile 0x%x with no trigger id.";
            uint32_t v16 = 8;
            goto LABEL_14;
          }
        }
        else
        {
          xpc_object_t v13 = *(NSObject **)(a1 + 8);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            xpc_object_t v14 = v13;
            uint64_t v15 = "logging-metric:#E AWDLoggingMetric: Got profile with no profile id.";
            uint32_t v16 = 2;
LABEL_14:
            _os_log_impl(&dword_1D3E18000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, v16);
          }
        }
LABEL_50:
        ++v8;
      }
      while (v8 != v9);
    }
  }
}

void sub_1D3E32CBC(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(std::__shared_weak_count **)(v1 - 136);
  if (v3) {
    sub_1D3E1D148(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1D3E32D0C(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 4MEMORY[0x1D9440F90]((char *)this + 8) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_1D3E32D28(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    sub_1D3E1D148(v1);
  }
}

void awd::AWDLoggingMetric::registerQueriableMetricCallbackForLogging(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(NSObject **)(a1 + 24);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 0x40000000;
  void v3[2] = sub_1D3E32DAC;
  v3[3] = &unk_1E69CA538;
  v3[4] = a2;
  v3[5] = a1;
  dispatch_async(v2, v3);
}

void sub_1D3E32DAC(uint64_t a1)
{
  uint64_t v3 = a1 + 32;
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(v3 + 8);
  if (v1) {
    uint64_t v1 = _Block_copy(v1);
  }
  xpc_object_t v4 = *(const void **)(v2 + 32);
  *(void *)(v2 + 32) = v1;
  if (v4) {
    _Block_release(v4);
  }
}

void awd::AWDLoggingMetric::trigger(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = *(NSObject **)(a1 + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = sub_1D3E32E68;
  block[3] = &unk_1E69CA578;
  void block[4] = a1;
  void block[5] = a2;
  int v5 = a3;
  dispatch_async(v3, block);
}

void sub_1D3E32E68(uint64_t a1)
{
}

void awd::AWDLoggingMetric::trigger_sync(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3)
  {
    uint64_t v7 = a1 + 48;
    do
    {
      unsigned int v8 = *(_DWORD *)(v3 + 32);
      BOOL v9 = v8 >= HIDWORD(a2);
      if (v8 >= HIDWORD(a2)) {
        CFAllocatorRef v10 = (uint64_t *)v3;
      }
      else {
        CFAllocatorRef v10 = (uint64_t *)(v3 + 8);
      }
      if (v9) {
        uint64_t v7 = v3;
      }
      uint64_t v3 = *v10;
    }
    while (*v10);
    if (v7 != a1 + 48 && *(_DWORD *)(v7 + 32) <= HIDWORD(a2))
    {
      uint64_t v11 = *(const void **)(a1 + 32);
      if (v11) {
        int v12 = _Block_copy(v11);
      }
      else {
        int v12 = 0;
      }
      CFDictionaryRef Copy = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], *(CFDictionaryRef *)(v7 + 40));
      global_queue = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 1174405120;
      block[2] = sub_1D3E32FF4;
      block[3] = &unk_1F2B9C090;
      void block[4] = a1;
      uint64_t v19 = a2;
      int v20 = a3;
      if (v12) {
        uint64_t v15 = _Block_copy(v12);
      }
      else {
        uint64_t v15 = 0;
      }
      aBlock = v15;
      CFDictionaryRef v18 = Copy;
      dispatch_async(global_queue, block);
      if (aBlock) {
        _Block_release(aBlock);
      }
      if (v12) {
        _Block_release(v12);
      }
    }
  }
}

void sub_1D3E32FD8(_Unwind_Exception *exception_object)
{
  if (v1) {
    _Block_release(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_1D3E32FF4(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = *(_DWORD *)(a1 + 56);
    int v4 = *(_DWORD *)(a1 + 60);
    int v5 = *(_DWORD *)(a1 + 64);
    v7[0] = 67109632;
    v7[1] = v3;
    __int16 v8 = 1024;
    int v9 = v4;
    __int16 v10 = 1024;
    int v11 = v5;
    _os_log_impl(&dword_1D3E18000, v2, OS_LOG_TYPE_INFO, "logging-metric:#I Calling callback on Logging metric for Trigger(cid=0x%x, trid=0x%x, sid=%u)", (uint8_t *)v7, 0x14u);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, *(void *)(a1 + 48));
  }
  CFRelease(*(CFTypeRef *)(a1 + 48));
}

void *sub_1D3E330D0(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void **)(a2 + 40);
  if (result) {
    uint64_t result = _Block_copy(result);
  }
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_1D3E33104(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 40);
  if (v1) {
    _Block_release(v1);
  }
}

uint64_t **sub_1D3E33128(uint64_t **a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  uint64_t v7 = a1 + 1;
  uint64_t v6 = a1[1];
  if (v6)
  {
    unsigned int v8 = *a2;
    while (1)
    {
      while (1)
      {
        int v9 = (uint64_t **)v6;
        unsigned int v10 = *((_DWORD *)v6 + 8);
        if (v8 >= v10) {
          break;
        }
        uint64_t v6 = *v9;
        uint64_t v7 = v9;
        if (!*v9) {
          goto LABEL_10;
        }
      }
      if (v10 >= v8) {
        break;
      }
      uint64_t v6 = v9[1];
      if (!v6)
      {
        uint64_t v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    int v9 = a1 + 1;
LABEL_10:
    int v11 = operator new(0x30uLL);
    v11[8] = **a4;
    *((void *)v11 + 5) = 0;
    sub_1D3E21220(a1, (uint64_t)v9, v7, (uint64_t *)v11);
    return (uint64_t **)v11;
  }
  return v9;
}

void AWDObserverConnection::createConfigurationDict(AWDObserverConnection *this@<X0>, xpc_object_t *a2@<X8>)
{
  int v5 = this;
  if (v5 && [(AWDObserverConnection *)v5 count])
  {
    sub_1D3E332BC(v5, &v6);
    xpc_object_t v4 = v6;
    *a2 = v6;
    if (v4 && MEMORY[0x1D94419C0](v4) == MEMORY[0x1E4F14590]) {
      xpc_retain(v4);
    }
    else {
      *a2 = xpc_null_create();
    }
    xpc_release(v4);
  }
  else
  {
    *a2 = xpc_null_create();
  }
}

void sub_1D3E3329C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  _Unwind_Resume(a1);
}

void sub_1D3E332BC(void *a1@<X0>, xpc_object_t *a2@<X8>)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  if (!v3) {
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      xpc_object_t v5 = xpc_array_create(0, 0);
      if (v5 || (xpc_object_t v5 = xpc_null_create()) != 0)
      {
        if (MEMORY[0x1D94419C0](v5) == MEMORY[0x1E4F14568])
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
      xpc_release(v5);
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v10 = v3;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v31 != v12) {
              objc_enumerationMutation(v10);
            }
            sub_1D3E332BC(value);
            xpc_array_append_value(v6, value[0]);
            xpc_release(value[0]);
          }
          uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v35 count:16];
        }
        while (v11);
      }

      *a2 = v6;
      if (v6) {
        xpc_retain(v6);
      }
      else {
        *a2 = xpc_null_create();
      }
      xpc_release(v6);
      goto LABEL_44;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_4;
    }
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_object_t v8 = v7;
    if (v7)
    {
      xpc_object_t v29 = v7;
    }
    else
    {
      xpc_object_t v8 = xpc_null_create();
      xpc_object_t v29 = v8;
      if (!v8)
      {
        xpc_object_t v9 = xpc_null_create();
        xpc_object_t v8 = 0;
        goto LABEL_32;
      }
    }
    if (MEMORY[0x1D94419C0](v8) == MEMORY[0x1E4F14590])
    {
      xpc_retain(v8);
LABEL_33:
      xpc_release(v8);
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v14 = v3;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v34 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v26;
        do
        {
          for (uint64_t j = 0; j != v15; ++j)
          {
            if (*(void *)v26 != v16) {
              objc_enumerationMutation(v14);
            }
            CFDictionaryRef v18 = *(void **)(*((void *)&v25 + 1) + 8 * j);
            uint64_t v19 = [v14 objectForKey:v18];
            sub_1D3E332BC(&v23);
            int v20 = (void *)[v18 UTF8String];
            value[0] = &v29;
            value[1] = v20;
            sub_1D3E1DB1C((uint64_t)value, &v23, &object);
            xpc_release(object);
            xpc_object_t object = 0;
            xpc_release(v23);
            xpc_object_t v23 = 0;
          }
          uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v34 count:16];
        }
        while (v15);
      }

      xpc_object_t v21 = v29;
      *a2 = v29;
      if (v21) {
        xpc_retain(v21);
      }
      else {
        *a2 = xpc_null_create();
      }
      xpc_release(v29);
      goto LABEL_44;
    }
    xpc_object_t v9 = xpc_null_create();
LABEL_32:
    xpc_object_t v29 = v9;
    goto LABEL_33;
  }
  xpc_object_t v4 = xpc_string_create((const char *)[v3 UTF8String]);
  *a2 = v4;
  if (!v4) {
LABEL_4:
  }
    *a2 = xpc_null_create();
LABEL_44:
}

void sub_1D3E3366C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t a9, uint64_t a10, xpc_object_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,xpc_object_t object)
{
  if (a2) {
    sub_1D3E1AE78(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void AWDObserverConnection::create(AWDObserverConnection *this)
{
}

void sub_1D3E3386C(_Unwind_Exception *a1)
{
  MEMORY[0x1D94412F0](v1, 0x10B3C40FB9ED22CLL);
  _Unwind_Resume(a1);
}

void AWDObserverConnection::AWDObserverConnection(AWDObserverConnection *this)
{
  AWDServerConnector::AWDServerConnector(this);
  *uint64_t v2 = &unk_1F2B9AB98;
  v2[9] = 0;
  *((void *)this + 10) = xpc_null_create();
  ctu::OsLogLogger::OsLogLogger((AWDObserverConnection *)((char *)this + 88), "com.apple.awd.framework", "observer");
}

void sub_1D3E33908(_Unwind_Exception *a1)
{
  id v3 = v2;
  sub_1D3E3394C(v3);
  xpc_object_t v5 = (const void *)*((void *)v1 + 9);
  if (v5)
  {
    _Block_release(v5);
    xpc_object_t v6 = (void *)*((void *)v1 + 9);
  }
  else
  {
    xpc_object_t v6 = 0;
  }

  AWDServerConnector::~AWDServerConnector(v1);
  _Unwind_Resume(a1);
}

xpc_object_t *sub_1D3E3394C(xpc_object_t *a1)
{
  *a1 = 0;
  return a1;
}

void AWDObserverConnection::~AWDObserverConnection(xpc_object_t *this)
{
  *this = &unk_1F2B9AB98;
  MEMORY[0x1D9440F90](this + 11);
  xpc_release(this[10]);
  this[10] = 0;
  xpc_object_t v2 = this[9];
  if (v2)
  {
    _Block_release(v2);
    xpc_object_t v3 = this[9];
  }
  else
  {
    xpc_object_t v3 = 0;
  }

  AWDServerConnector::~AWDServerConnector((AWDServerConnector *)this);
}

{
  uint64_t vars8;

  AWDObserverConnection::~AWDObserverConnection(this);
  JUMPOUT(0x1D94412F0);
}

void AWDObserverConnection::handleAwddStarted_sync(AWDObserverConnection *this)
{
  AWDServerConnector::handleAwddStarted_sync(this);
  AWDObserverConnection::sendConfiguration_sync(this);
}

void AWDObserverConnection::sendConfiguration_sync(AWDObserverConnection *this)
{
  sub_1D3E248A0(&v8, (void *)this + 1);
  uint64_t v3 = v8;
  xpc_object_t v2 = v9;
  if (v9)
  {
    atomic_fetch_add_explicit(&v9->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    sub_1D3E1D148(v2);
  }
  xpc_object_t v4 = (void *)*((void *)this + 10);
  xpc_object_t object = v4;
  if (v4) {
    xpc_retain(v4);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3321888768;
  _DWORD v5[2] = sub_1D3E34408;
  void v5[3] = &unk_1F2B9BB20;
  v5[4] = this;
  void v5[5] = v3;
  xpc_object_t v6 = v2;
  if (v2) {
    atomic_fetch_add_explicit(&v2->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  AWDServerConnector::send((uint64_t)this, &object, (uint64_t)"Observe", (uint64_t)v5);
  xpc_release(object);
  xpc_object_t object = 0;
  if (v6) {
    std::__shared_weak_count::__release_weak(v6);
  }
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
}

void sub_1D3E33B88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, std::__shared_weak_count *a15, xpc_object_t object)
{
  if (a15) {
    std::__shared_weak_count::__release_weak(a15);
  }
  xpc_release(object);
  if (v16) {
    std::__shared_weak_count::__release_weak(v16);
  }
  _Unwind_Resume(a1);
}

void AWDObserverConnection::handleMessage_sync(uint64_t a1, void **a2)
{
  if (*(void *)(a1 + 72) && MEMORY[0x1D94419C0](*a2) == MEMORY[0x1E4F14590])
  {
    xpc_object_t v4 = (void *)MEMORY[0x1D94415E0]();
    xpc_object_t v5 = sub_1D3E33C70(*a2);
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

void sub_1D3E33C60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *sub_1D3E33C70(void *a1)
{
  if (!a1)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
LABEL_12:
    xpc_object_t v4 = (__CFString *)v5;
    goto LABEL_41;
  }
  uint64_t v2 = MEMORY[0x1D94419C0]();
  if (v2 == MEMORY[0x1E4F145F0])
  {
    uint64_t v6 = [NSString stringWithUTF8String:xpc_string_get_string_ptr(a1)];
    if (v6) {
      xpc_object_t v4 = (__CFString *)v6;
    }
    else {
      xpc_object_t v4 = @"<bad string>";
    }
  }
  else
  {
    uint64_t v3 = MEMORY[0x1E4F14568];
    if (v2 == MEMORY[0x1E4F14568])
    {
      xpc_retain(a1);
      if (MEMORY[0x1D94419C0](a1) == v3)
      {
        xpc_retain(a1);
        xpc_object_t v7 = a1;
      }
      else
      {
        xpc_object_t v7 = xpc_null_create();
      }
      xpc_release(a1);
      xpc_object_t v9 = (void *)MEMORY[0x1E4F1CA48];
      if (MEMORY[0x1D94419C0](v7) == v3) {
        size_t count = xpc_array_get_count(v7);
      }
      else {
        size_t count = 0;
      }
      xpc_object_t v4 = [v9 arrayWithCapacity:count];
      xpc_object_t object = v7;
      if (v7) {
        xpc_retain(v7);
      }
      else {
        xpc_object_t object = xpc_null_create();
      }
      sub_1D3E1EA40(&v24, &object, 0);
      xpc_release(object);
      xpc_object_t v26 = v7;
      if (v7) {
        xpc_retain(v7);
      }
      else {
        xpc_object_t v26 = xpc_null_create();
      }
      if (MEMORY[0x1D94419C0](v7) == v3) {
        uint64_t v11 = (void *)xpc_array_get_count(v7);
      }
      else {
        uint64_t v11 = 0;
      }
      sub_1D3E1EA40(&object, &v26, v11);
      xpc_release(v26);
      xpc_object_t v12 = v24;
      for (size_t i = index; i != v23 || v24 != object; index = i)
      {
        xpc_object_t value = xpc_array_get_value(v12, i);
        uint64_t v15 = sub_1D3E33C70(value);
        [(__CFString *)v4 addObject:v15];

        xpc_object_t v12 = v24;
        size_t i = index + 1;
      }
      xpc_release(v12);
      xpc_release(v24);
      xpc_release(v7);
    }
    else
    {
      if (v2 != MEMORY[0x1E4F14590])
      {
        if (v2 == MEMORY[0x1E4F14570])
        {
          uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithBool:xpc_BOOL_get_value(a1)];
        }
        else if (v2 == MEMORY[0x1E4F145C0])
        {
          uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithLongLong:xpc_int64_get_value(a1)];
        }
        else if (v2 == MEMORY[0x1E4F145F8])
        {
          uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:xpc_uint64_get_value(a1)];
        }
        else if (v2 == MEMORY[0x1E4F14580])
        {
          CFDictionaryRef v18 = (void *)MEMORY[0x1E4F1C9B8];
          bytes_ptr = xpc_data_get_bytes_ptr(a1);
          uint64_t v5 = [v18 dataWithBytes:bytes_ptr length:xpc_data_get_length(a1)];
        }
        else
        {
          if (v2 != MEMORY[0x1E4F14598])
          {
            xpc_object_t v4 = @"<unknown type>";
            goto LABEL_41;
          }
          uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithDouble:xpc_double_get_value(a1)];
        }
        goto LABEL_12;
      }
      uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:xpc_dictionary_get_count(a1)];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = sub_1D3E346F0;
      v20[3] = &unk_1E69CA820;
      xpc_object_t v4 = v8;
      xpc_object_t v21 = v4;
      xpc_dictionary_apply(a1, v20);
    }
  }
LABEL_41:
  return v4;
}

void sub_1D3E3404C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, xpc_object_t a14, uint64_t a15, xpc_object_t object)
{
  _Unwind_Resume(a1);
}

void AWDObserverConnection::setStateChangedCallback(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  unsigned int v6[2] = sub_1D3E34188;
  v6[3] = &unk_1E69CA638;
  xpc_object_t v4 = (void *)(a1 + 8);
  id v7 = v3;
  uint64_t v8 = a1;
  id v5 = v3;
  sub_1D3E34980(v4, v6);
}

uint64_t sub_1D3E34188(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = _Block_copy(*(const void **)(a1 + 32));
  id v3 = *(const void **)(v1 + 72);
  *(void *)(v1 + 72) = v2;
  if (v3) {
    _Block_release(v3);
  }
  return MEMORY[0x1F41817F8]();
}

void AWDObserverConnection::setObserverConfiguration(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D94415E0]();
  AWDObserverConnection::createConfigurationDict(v5, &object);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3321888768;
  v11[2] = sub_1D3E34314;
  v11[3] = &unk_1F2B9BAF0;
  xpc_object_t v8 = object;
  uint64_t v13 = a1;
  xpc_object_t v14 = object;
  if (object) {
    xpc_retain(object);
  }
  else {
    xpc_object_t v14 = xpc_null_create();
  }
  xpc_object_t v9 = (void *)(a1 + 8);
  id v10 = v6;
  id v12 = v10;
  sub_1D3E34980(v9, v11);

  xpc_release(v14);
  xpc_object_t v14 = 0;
  xpc_release(v8);
}

void sub_1D3E342F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1D3E34314(uint64_t a1)
{
  uint64_t v2 = *(AWDObserverConnection **)(a1 + 40);
  xpc_object_t v3 = *(xpc_object_t *)(a1 + 48);
  if (v3) {
    xpc_retain(*(xpc_object_t *)(a1 + 48));
  }
  else {
    xpc_object_t v3 = xpc_null_create();
  }
  xpc_object_t v4 = (void *)*((void *)v2 + 10);
  *((void *)v2 + 10) = v3;
  xpc_release(v4);
  AWDObserverConnection::sendConfiguration_sync(v2);
  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v5();
}

xpc_object_t sub_1D3E34398(uint64_t a1, uint64_t a2)
{
  xpc_object_t v3 = *(void **)(a2 + 48);
  *(void *)(a1 + 4MEMORY[0x1D9440F90]((char *)this + 8) = v3;
  if (v3) {
    return xpc_retain(v3);
  }
  xpc_object_t result = xpc_null_create();
  *(void *)(a1 + 4MEMORY[0x1D9440F90]((char *)this + 8) = result;
  return result;
}

void sub_1D3E343D8(uint64_t a1)
{
  *(void *)(a1 + 4MEMORY[0x1D9440F90]((char *)this + 8) = 0;
}

void sub_1D3E34408(void *a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  xpc_object_t v3 = (std::__shared_weak_count *)a1[6];
  if (v3)
  {
    uint64_t v5 = a1[4];
    id v6 = std::__shared_weak_count::lock(v3);
    if (v6)
    {
      id v7 = v6;
      if (!a1[5])
      {
LABEL_14:
        sub_1D3E1D148(v7);
        return;
      }
      xpc_object_t v8 = (void *)MEMORY[0x1D94415E0]();
      xpc_object_t v9 = (void *)*a2;
      xpc_object_t object = v9;
      uint64_t v10 = MEMORY[0x1E4F14590];
      if (v9 && MEMORY[0x1D94419C0](v9) == v10) {
        xpc_retain(v9);
      }
      else {
        xpc_object_t object = xpc_null_create();
      }
      if (MEMORY[0x1D94419C0](*a2) != MEMORY[0x1E4F145D8] && MEMORY[0x1D94419C0](object) == v10)
      {
        xpc_object_t value = xpc_dictionary_get_value(object, "error");
        uint64_t v16 = *(NSObject **)(v5 + 88);
        if (value)
        {
          if (os_log_type_enabled(*(os_log_t *)(v5 + 88), OS_LOG_TYPE_DEFAULT))
          {
            v18[0] = &object;
            v18[1] = "error";
            sub_1D3E1D854((uint64_t)v18, &v19);
            *(void *)long long buf = 0;
            uint64_t v24 = 0;
            uint64_t v25 = 0;
            xpc::dyn_cast_or_default();
            if (SHIBYTE(v25) < 0) {
              operator delete(*(void **)buf);
            }
            p_p = &__p;
            if (v21 < 0) {
              p_p = __p;
            }
            *(_DWORD *)xpc_object_t v26 = 136315138;
            long long v27 = p_p;
            _os_log_impl(&dword_1D3E18000, v16, OS_LOG_TYPE_DEFAULT, "#E SetObserverConfiguration failed: %s", v26, 0xCu);
            if (v21 < 0) {
              operator delete(__p);
            }
            xpc_release(v19);
          }
          goto LABEL_13;
        }
        if (os_log_type_enabled(*(os_log_t *)(v5 + 88), OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          id v12 = "#I SetObserverConfiguration configured successfully";
          uint64_t v13 = v16;
          os_log_type_t v14 = OS_LOG_TYPE_INFO;
          goto LABEL_12;
        }
      }
      else
      {
        uint64_t v11 = *(NSObject **)(v5 + 88);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          id v12 = "#E XPC connection failure";
          uint64_t v13 = v11;
          os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
LABEL_12:
          _os_log_impl(&dword_1D3E18000, v13, v14, v12, buf, 2u);
        }
      }
LABEL_13:
      xpc_release(object);
      goto LABEL_14;
    }
  }
}

void sub_1D3E34654(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object, uint64_t a13, uint64_t a14, uint64_t a15, xpc_object_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  sub_1D3E1AE78(exception_object);
}

uint64_t sub_1D3E346C4(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 4MEMORY[0x1D9440F90]((char *)this + 8) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_1D3E346E0(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

uint64_t sub_1D3E346F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  xpc_object_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = sub_1D3E33C70(a3);
  id v6 = [NSString stringWithUTF8String:a2];
  [v4 setObject:v5 forKey:v6];

  return 1;
}

void sub_1D3E34760(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D3E3477C(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_1D3E347FC(void *a1)
{
  __cxa_begin_catch(a1);
  dispatch_barrier_async_f(v1[3], v1, (dispatch_function_t)sub_1D3E348D4);
  __cxa_rethrow();
}

void sub_1D3E34824(_Unwind_Exception *a1)
{
}

void sub_1D3E3483C(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1D94412F0);
}

void sub_1D3E34874(uint64_t a1)
{
}

uint64_t sub_1D3E34890(uint64_t a1, uint64_t a2)
{
  if (sub_1D3E247D4(a2, (uint64_t)&unk_1F2B9AAF8)) {
    return a1 + 24;
  }
  else {
    return 0;
  }
}

uint64_t sub_1D3E348D4(uint64_t result)
{
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 24))();
  }
  return result;
}

uint64_t *sub_1D3E34900(void **a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  xpc_object_t v4 = a1;
  uint64_t v5 = v2;
  (*(void (**)(void, uint64_t))(*(void *)*v2 + 32))(*v2, a2);
  sub_1D3E319E0((uint64_t *)&v5);
  return sub_1D3E24D00((uint64_t *)&v4);
}

void sub_1D3E34964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

void sub_1D3E34980(void *a1, void *a2)
{
  id v3 = a2;
  sub_1D3E248A0(&v10, a1);
  xpc_object_t v4 = a1[2];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3321888768;
  block[2] = sub_1D3E34A5C;
  block[3] = &unk_1F2B9BAB8;
  uint64_t v8 = v10;
  xpc_object_t v9 = v11;
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v5 = v3;
  id v7 = v5;
  dispatch_async(v4, block);

  if (v9) {
    sub_1D3E1D148(v9);
  }
  if (v11) {
    sub_1D3E1D148(v11);
  }
}

uint64_t sub_1D3E34A5C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1D3E34A6C(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 4MEMORY[0x1D9440F90]((char *)this + 8) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_1D3E34A88(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    sub_1D3E1D148(v1);
  }
}

void sub_1D3E34FA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D3E3500C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D3E3516C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1D3E35194(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, uint64_t a7, void *a8)
{
  *(_DWORD *)a1 = a4;
  *(unsigned char *)(a1 + 4) = 1;
  *(void *)(a1 + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  *(void *)(a1 + 16) = a2;
  awd::AWDTriggerFilter::AWDTriggerFilter(a1 + 24, a3, a4, a6);
  awd::AWDMetricBuffer::AWDMetricBuffer(a1 + 80, a4, a7);
  awd::SimpleMetricHelper::SimpleMetricHelper((awd::SimpleMetricHelper *)(a1 + 208), a4);
  *(void *)(a1 + 264) = *a6;
  uint64_t v14 = a6[1];
  *(void *)(a1 + 272) = v14;
  if (v14) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v14 + 16), 1uLL, memory_order_relaxed);
  }
  *(void *)(a1 + 280) = *a5;
  uint64_t v15 = a5[1];
  *(void *)(a1 + 28MEMORY[0x1D9440F90]((char *)this + 8) = v15;
  if (v15) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v15 + 8), 1uLL, memory_order_relaxed);
  }
  *(void *)(a1 + 296) = 0;
  *(void *)(a1 + 304) = 0;
  *(void *)(a1 + 32MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  *(void *)(a1 + 336) = 0;
  *(void *)(a1 + 312) = 0;
  *(void *)(a1 + 320) = a1 + 328;
  *(_OWORD *)(a1 + 344) = 0u;
  *(_OWORD *)(a1 + 360) = 0u;
  *(_OWORD *)(a1 + 376) = 0u;
  *(_OWORD *)(a1 + 392) = 0u;
  *(void *)(a1 + 40MEMORY[0x1D9440F90]((char *)this + 8) = *a8;
  uint64_t v16 = a8[1];
  *(void *)(a1 + 416) = v16;
  if (v16) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v16 + 8), 1uLL, memory_order_relaxed);
  }
  sub_1D3E353B0(a1);
  return a1;
}

void sub_1D3E352E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9, void **a10)
{
  xpc_object_t v19 = *(std::__shared_weak_count **)(v10 + 416);
  if (v19) {
    sub_1D3E1D148(v19);
  }
  sub_1D3E39A34(v17);
  sub_1D3E39D48(&a10);
  sub_1D3E37A34(v16, 0);
  sub_1D3E39CF4(v15, 0);
  int v20 = *(std::__shared_weak_count **)(v10 + 352);
  if (v20) {
    std::__shared_weak_count::__release_weak(v20);
  }
  sub_1D3E39C48(v14, *(void **)(v10 + 328));
  a10 = a9;
  sub_1D3E39BA8(&a10);
  char v21 = *(std::__shared_weak_count **)(v10 + 288);
  if (v21) {
    sub_1D3E1D148(v21);
  }
  uint64_t v22 = *(std::__shared_weak_count **)(v10 + 272);
  if (v22) {
    std::__shared_weak_count::__release_weak(v22);
  }
  sub_1D3E35588(v13);
  awd::AWDMetricBuffer::~AWDMetricBuffer(v12);
  sub_1D3E355D4(v11);
  uint64_t v23 = *(NSObject **)(v10 + 8);
  if (v23)
  {
    dispatch_group_leave(v23);
    uint64_t v24 = *(NSObject **)(v10 + 8);
    if (v24) {
      dispatch_release(v24);
    }
  }
  _Unwind_Resume(a1);
}

void sub_1D3E353B0(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x38uLL);
  *((void *)v2 + 2) = 0;
  *(void *)uint64_t v2 = &unk_1F2B9B7E8;
  *((void *)v2 + 1) = 0;
  *(_OWORD *)(v2 + 24) = 0u;
  *(_OWORD *)(v2 + 40) = 0u;
  *((void *)v2 + 4) = v2 + 40;
  atomic_fetch_add_explicit((atomic_ullong *volatile)v2 + 2, 1uLL, memory_order_relaxed);
  id v3 = *(std::__shared_weak_count **)(a1 + 352);
  *(void *)(a1 + 344) = v2 + 24;
  *(void *)(a1 + 352) = v2;
  if (v3) {
    std::__shared_weak_count::__release_weak(v3);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  id v5 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, global_queue);
  id v6 = v5;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 1174405120;
  handler[2] = sub_1D3E35620;
  handler[3] = &unk_1F2B9BC80;
  dispatch_object_t object = v5;
  if (v5) {
    dispatch_retain(v5);
  }
  dispatch_source_set_event_handler(v6, handler);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 1174405120;
  v8[2] = nullsub_11;
  v8[3] = &unk_1F2B9BF30;
  void v8[4] = v2 + 24;
  xpc_object_t v9 = (std::__shared_weak_count *)v2;
  atomic_fetch_add_explicit((atomic_ullong *volatile)v2 + 1, 1uLL, memory_order_relaxed);
  dispatch_source_set_cancel_handler(v6, v8);
  dispatch_time_t v7 = dispatch_time(0, 5000000000);
  dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0xBEBC200uLL);
  dispatch_resume(v6);
  if (v9) {
    sub_1D3E1D148(v9);
  }
  if (object) {
    dispatch_release(object);
  }
  if (v6) {
    dispatch_release(v6);
  }
  sub_1D3E1D148((std::__shared_weak_count *)v2);
}

uint64_t sub_1D3E35588(uint64_t a1)
{
  xpc_object_t v4 = (void **)(a1 + 32);
  sub_1D3E25F08(&v4);
  uint64_t v2 = *(void **)(a1 + 8);
  if (v2)
  {
    *(void *)(a1 + 16) = v2;
    operator delete(v2);
  }
  return a1;
}

void sub_1D3E355D4(uint64_t a1)
{
  sub_1D3E2A068(a1 + 32, *(void **)(a1 + 40));
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 24);
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  JUMPOUT(0x1D9440F90);
}

void sub_1D3E35620(uint64_t a1)
{
}

void sub_1D3E35628(uint64_t a1, uint64_t a2)
{
  id v3 = *(NSObject **)(a2 + 32);
  *(void *)(a1 + 32) = v3;
  if (v3) {
    dispatch_retain(v3);
  }
}

void sub_1D3E35640(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(a1 + 32);
  if (v1) {
    dispatch_release(v1);
  }
}

uint64_t sub_1D3E35654(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(result + 32) = *(void *)(a2 + 32);
  *(void *)(result + 40) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_1D3E35670(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 40);
  if (v1) {
    sub_1D3E1D148(v1);
  }
}

void sub_1D3E35680(uint64_t a1, uint64_t a2)
{
  int64x2_t v91 = 0uLL;
  v92[0] = 0;
  v88 = 0;
  v89 = 0;
  v90 = 0;
  v85 = 0;
  v86 = 0;
  v87 = 0;
  uint64_t v3 = *(int *)(*(void *)a2 + 72);
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (v3)
  {
    id v5 = *(uint64_t **)(*(void *)a2 + 64);
    id v6 = &v5[v3];
    v81 = (const void *)*MEMORY[0x1E4F1CFD0];
    v80 = (const void *)*MEMORY[0x1E4F1CFC8];
    while (1)
    {
      uint64_t v7 = *v5;
      if ((~*(_DWORD *)(*v5 + 28) & 3) == 0) {
        break;
      }
LABEL_116:
      if (++v5 == v6)
      {
        v75 = (const void **)v85;
        v76 = (const void **)v88;
        v77 = v89;
        goto LABEL_144;
      }
    }
    uint64_t v8 = *(void *)(v7 + 16);
    if (!v8) {
      uint64_t v8 = *(void *)(awd::profile::ConfigurationParameter::default_instance_ + 16);
    }
    int v9 = *(_DWORD *)(v8 + 72);
    if ((v9 & 4) != 0)
    {
      uint64_t v10 = *(unsigned int *)(v8 + 20);
      *(void *)&long long __dst = 0;
      *(void *)valuePtr = v10;
      CFNumberRef v11 = CFNumberCreate(v4, kCFNumberLongLongType, valuePtr);
      if (v11)
      {
        uint64_t v12 = __dst;
        *(void *)&long long __dst = v11;
        *(void *)valuePtr = v12;
        sub_1D3E39AA0((const void **)valuePtr);
      }
      uint64_t v13 = (const void *)__dst;
      *(void *)valuePtr = __dst;
      *(void *)&long long __dst = 0;
      sub_1D3E39AA0((const void **)&__dst);
      v84 = v13;
      if (!v13) {
        goto LABEL_39;
      }
    }
    else if ((v9 & 8) != 0)
    {
      uint64_t v14 = *(void *)(v8 + 24);
      *(void *)&long long __dst = 0;
      *(void *)valuePtr = v14;
      CFNumberRef v15 = CFNumberCreate(v4, kCFNumberLongLongType, valuePtr);
      if (v15)
      {
        uint64_t v16 = __dst;
        *(void *)&long long __dst = v15;
        *(void *)valuePtr = v16;
        sub_1D3E39AA0((const void **)valuePtr);
      }
      uint64_t v13 = (const void *)__dst;
      *(void *)valuePtr = __dst;
      *(void *)&long long __dst = 0;
      sub_1D3E39AA0((const void **)&__dst);
      v84 = v13;
      if (!v13) {
        goto LABEL_39;
      }
    }
    else if (v9)
    {
      int v17 = *(_DWORD *)(v8 + 16);
      *(void *)&long long __dst = 0;
      *(_DWORD *)valuePtr = v17;
      CFNumberRef v18 = CFNumberCreate(v4, kCFNumberIntType, valuePtr);
      if (v18)
      {
        uint64_t v19 = __dst;
        *(void *)&long long __dst = v18;
        *(void *)valuePtr = v19;
        sub_1D3E39AA0((const void **)valuePtr);
      }
      uint64_t v13 = (const void *)__dst;
      *(void *)valuePtr = __dst;
      *(void *)&long long __dst = 0;
      sub_1D3E39AA0((const void **)&__dst);
      v84 = v13;
      if (!v13) {
        goto LABEL_39;
      }
    }
    else if ((v9 & 2) != 0)
    {
      uint64_t v20 = *(void *)(v8 + 8);
      *(void *)&long long __dst = 0;
      *(void *)valuePtr = v20;
      CFNumberRef v21 = CFNumberCreate(v4, kCFNumberLongLongType, valuePtr);
      if (v21)
      {
        uint64_t v22 = __dst;
        *(void *)&long long __dst = v21;
        *(void *)valuePtr = v22;
        sub_1D3E39AA0((const void **)valuePtr);
      }
      uint64_t v13 = (const void *)__dst;
      *(void *)valuePtr = __dst;
      *(void *)&long long __dst = 0;
      sub_1D3E39AA0((const void **)&__dst);
      v84 = v13;
      if (!v13) {
        goto LABEL_39;
      }
    }
    else if ((v9 & 0x10) != 0)
    {
      int v23 = *(_DWORD *)(v8 + 40);
      *(void *)&long long __dst = 0;
      *(_DWORD *)valuePtr = v23;
      CFNumberRef v24 = CFNumberCreate(v4, kCFNumberFloatType, valuePtr);
      if (v24)
      {
        uint64_t v25 = __dst;
        *(void *)&long long __dst = v24;
        *(void *)valuePtr = v25;
        sub_1D3E39AA0((const void **)valuePtr);
      }
      uint64_t v13 = (const void *)__dst;
      *(void *)valuePtr = __dst;
      *(void *)&long long __dst = 0;
      sub_1D3E39AA0((const void **)&__dst);
      v84 = v13;
      if (!v13) {
        goto LABEL_39;
      }
    }
    else
    {
      if ((v9 & 0x20) == 0)
      {
        if ((v9 & 0x80) != 0)
        {
          if (*(unsigned char *)(v8 + 44)) {
            v69 = v81;
          }
          else {
            v69 = v80;
          }
          *(void *)valuePtr = 0;
          v70 = sub_1D3E39AD4((const void **)valuePtr);
          *(void *)&long long __dst = v69;
          *(void *)valuePtr = 0;
          sub_1D3E39AD4(v70);
          v84 = v69;
          if (v69) {
            CFRetain(v69);
          }
          sub_1D3E39AD4((const void **)&__dst);
        }
        else if ((v9 & 0x40) != 0)
        {
          v71 = *(long long **)(v8 + 48);
          if (*((char *)v71 + 23) < 0)
          {
            sub_1D3E1D074(v93, *(void **)v71, *((void *)v71 + 1));
          }
          else
          {
            long long v72 = *v71;
            uint64_t v94 = *((void *)v71 + 2);
            *(_OWORD *)v93 = v72;
          }
          if (SHIBYTE(v94) < 0)
          {
            sub_1D3E1D074(&__dst, v93[0], (unint64_t)v93[1]);
          }
          else
          {
            long long __dst = *(_OWORD *)v93;
            uint64_t v98 = v94;
          }
          v96 = 0;
          if (SHIBYTE(v98) < 0)
          {
            sub_1D3E1D074(valuePtr, (void *)__dst, *((unint64_t *)&__dst + 1));
          }
          else
          {
            *(_OWORD *)valuePtr = __dst;
            *(void *)&valuePtr[16] = v98;
          }
          v99 = 0;
          if (ctu::cf::convert_copy())
          {
            v73 = v96;
            v96 = v99;
            v100 = v73;
            sub_1D3E39B08(&v100);
          }
          if ((valuePtr[23] & 0x80000000) != 0) {
            operator delete(*(void **)valuePtr);
          }
          v74 = v96;
          v95 = v96;
          v96 = 0;
          sub_1D3E39B08(&v96);
          if (SHIBYTE(v98) < 0) {
            operator delete((void *)__dst);
          }
          v84 = v74;
          if (v74) {
            CFRetain(v74);
          }
          sub_1D3E39B08(&v95);
          if (SHIBYTE(v94) < 0) {
            operator delete(v93[0]);
          }
        }
        else
        {
          v84 = 0;
        }
        goto LABEL_40;
      }
      uint64_t v26 = *(void *)(v8 + 32);
      *(void *)&long long __dst = 0;
      *(void *)valuePtr = v26;
      CFNumberRef v27 = CFNumberCreate(v4, kCFNumberDoubleType, valuePtr);
      if (v27)
      {
        uint64_t v28 = __dst;
        *(void *)&long long __dst = v27;
        *(void *)valuePtr = v28;
        sub_1D3E39AA0((const void **)valuePtr);
      }
      uint64_t v13 = (const void *)__dst;
      *(void *)valuePtr = __dst;
      *(void *)&long long __dst = 0;
      sub_1D3E39AA0((const void **)&__dst);
      v84 = v13;
      if (!v13)
      {
LABEL_39:
        sub_1D3E39AA0((const void **)valuePtr);
LABEL_40:
        if (v84) {
          xpc_object_t v29 = sub_1D3E360AC;
        }
        else {
          xpc_object_t v29 = 0;
        }
        if (v29)
        {
          long long v30 = *(long long **)(v7 + 8);
          if (*((char *)v30 + 23) < 0)
          {
            sub_1D3E1D074(__p, *(void **)v30, *((void *)v30 + 1));
          }
          else
          {
            long long v31 = *v30;
            uint64_t v83 = *((void *)v30 + 2);
            *(_OWORD *)__n128 __p = v31;
          }
          if (SHIBYTE(v83) < 0)
          {
            sub_1D3E1D074(&__dst, __p[0], (unint64_t)__p[1]);
          }
          else
          {
            long long __dst = *(_OWORD *)__p;
            uint64_t v98 = v83;
          }
          v99 = 0;
          if (SHIBYTE(v98) < 0)
          {
            sub_1D3E1D074(valuePtr, (void *)__dst, *((unint64_t *)&__dst + 1));
          }
          else
          {
            *(_OWORD *)valuePtr = __dst;
            *(void *)&valuePtr[16] = v98;
          }
          v100 = 0;
          if (ctu::cf::convert_copy())
          {
            long long v32 = (void *)v99;
            v99 = v100;
            v93[0] = v32;
            sub_1D3E39B08((const void **)v93);
          }
          if ((valuePtr[23] & 0x80000000) != 0) {
            operator delete(*(void **)valuePtr);
          }
          v96 = v99;
          v99 = 0;
          sub_1D3E39B08(&v99);
          if (SHIBYTE(v98) < 0) {
            operator delete((void *)__dst);
          }
          if (SHIBYTE(v83) < 0) {
            operator delete(__p[0]);
          }
          long long v33 = v96;
          if (v96) {
            uint64_t v34 = sub_1D3E360A4;
          }
          else {
            uint64_t v34 = 0;
          }
          if (v34)
          {
            int v35 = v89;
            if (v89 >= v90)
            {
              uint64_t v37 = (v89 - (unsigned char *)v88) >> 3;
              if ((unint64_t)(v37 + 1) >> 61) {
                sub_1D3E1AE60();
              }
              unint64_t v38 = (v90 - (unsigned char *)v88) >> 2;
              if (v38 <= v37 + 1) {
                unint64_t v38 = v37 + 1;
              }
              if ((unint64_t)(v90 - (unsigned char *)v88) >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v39 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v39 = v38;
              }
              if (v39) {
                std::string v40 = (char *)sub_1D3E21674((uint64_t)&v90, v39);
              }
              else {
                std::string v40 = 0;
              }
              std::string v41 = &v40[8 * v37];
              *(void *)std::string v41 = v33;
              uint64_t v36 = v41 + 8;
              uint64_t v43 = (char *)v88;
              unsigned int v42 = v89;
              if (v89 != v88)
              {
                do
                {
                  uint64_t v44 = *((void *)v42 - 1);
                  v42 -= 8;
                  *((void *)v41 - 1) = v44;
                  v41 -= 8;
                }
                while (v42 != v43);
                unsigned int v42 = (char *)v88;
              }
              v88 = v41;
              v89 = v36;
              v90 = &v40[8 * v39];
              if (v42) {
                operator delete(v42);
              }
            }
            else
            {
              *(void *)v89 = v96;
              uint64_t v36 = v35 + 8;
            }
            v89 = v36;
            uint64_t v45 = v84;
            __int16 v46 = v86;
            if (v86 >= v87)
            {
              uint64_t v48 = (v86 - (unsigned char *)v85) >> 3;
              if ((unint64_t)(v48 + 1) >> 61) {
                sub_1D3E1AE60();
              }
              unint64_t v49 = (v87 - (unsigned char *)v85) >> 2;
              if (v49 <= v48 + 1) {
                unint64_t v49 = v48 + 1;
              }
              if ((unint64_t)(v87 - (unsigned char *)v85) >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v50 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v50 = v49;
              }
              if (v50) {
                int v51 = (char *)sub_1D3E21674((uint64_t)&v87, v50);
              }
              else {
                int v51 = 0;
              }
              int v52 = &v51[8 * v48];
              *(void *)int v52 = v45;
              uint64_t v47 = v52 + 8;
              long long v54 = (char *)v85;
              int v53 = v86;
              if (v86 != v85)
              {
                do
                {
                  uint64_t v55 = *((void *)v53 - 1);
                  v53 -= 8;
                  *((void *)v52 - 1) = v55;
                  v52 -= 8;
                }
                while (v53 != v54);
                int v53 = (char *)v85;
              }
              v85 = v52;
              v86 = v47;
              v87 = &v51[8 * v50];
              if (v53) {
                operator delete(v53);
              }
            }
            else
            {
              *(void *)v86 = v84;
              uint64_t v47 = v46 + 8;
            }
            v86 = v47;
            sub_1D3E360B4(&v91, &v96);
            uint64_t v56 = (void *)v91.i64[1];
            if (v91.i64[1] >= v92[0])
            {
              uint64_t v58 = (v91.i64[1] - v91.i64[0]) >> 3;
              if ((unint64_t)(v58 + 1) >> 61) {
                sub_1D3E1AE60();
              }
              unint64_t v59 = (v92[0] - v91.i64[0]) >> 2;
              if (v59 <= v58 + 1) {
                unint64_t v59 = v58 + 1;
              }
              if (v92[0] - v91.i64[0] >= 0x7FFFFFFFFFFFFFF8uLL) {
                unint64_t v60 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v60 = v59;
              }
              v103 = v92;
              if (v60) {
                int v61 = (char *)sub_1D3E21674((uint64_t)v92, v60);
              }
              else {
                int v61 = 0;
              }
              v62 = &v61[8 * v58];
              v63 = &v61[8 * v60];
              v102 = v63;
              *(void *)v62 = 0;
              *(void *)v62 = v84;
              v57 = v62 + 8;
              v84 = 0;
              *(void *)&valuePtr[16] = v62 + 8;
              v64 = (void *)v91.i64[1];
              __int16 v65 = (void *)v91.i64[0];
              if (v91.i64[1] == v91.i64[0])
              {
                int64x2_t v67 = vdupq_n_s64(v91.u64[1]);
              }
              else
              {
                do
                {
                  *((void *)v62 - 1) = 0;
                  v62 -= 8;
                  uint64_t v66 = *--v64;
                  *(void *)v62 = v66;
                  void *v64 = 0;
                }
                while (v64 != v65);
                int64x2_t v67 = v91;
                v57 = *(void **)&valuePtr[16];
                v63 = v102;
              }
              v91.i64[0] = (uint64_t)v62;
              v91.i64[1] = (uint64_t)v57;
              *(int64x2_t *)&valuePtr[8] = v67;
              v68 = (char *)v92[0];
              v92[0] = v63;
              v102 = v68;
              *(void *)valuePtr = v67.i64[0];
              sub_1D3E39FAC((uint64_t)valuePtr);
            }
            else
            {
              *(void *)v91.i64[1] = 0;
              *uint64_t v56 = v84;
              v57 = v56 + 1;
              v84 = 0;
            }
            v91.i64[1] = (uint64_t)v57;
          }
          sub_1D3E39B08(&v96);
        }
        sub_1D3E39B3C(&v84);
        goto LABEL_116;
      }
    }
    CFRetain(v13);
    goto LABEL_39;
  }
  v77 = 0;
  v75 = 0;
  v76 = 0;
LABEL_144:
  CFDictionaryRef v78 = CFDictionaryCreate(v4, v76, v75, (v77 - (char *)v76) >> 3, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  uint64_t v79 = *(void *)(a1 + 400);
  *(void *)(a1 + 400) = v78;
  *(void *)valuePtr = v79;
  sub_1D3E39A34((const void **)valuePtr);
  if (v85)
  {
    v86 = (char *)v85;
    operator delete(v85);
  }
  if (v88)
  {
    v89 = (char *)v88;
    operator delete(v88);
  }
  *(void *)valuePtr = &v91;
  sub_1D3E39F28((void ***)valuePtr);
}

void sub_1D3E35F4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, char a19, void *a20,uint64_t a21,uint64_t a22,char *a23,char *a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,void *__p,uint64_t a31,int a32,__int16 a33,char a34,char a35,uint64_t a36,uint64_t a37,const void *a38)
{
  sub_1D3E39B08(&a38);
  if (*(char *)(v38 - 153) < 0) {
    operator delete(*(void **)(v38 - 176));
  }
  if (a35 < 0) {
    operator delete(__p);
  }
  if (a20) {
    operator delete(a20);
  }
  if (a23)
  {
    a24 = a23;
    operator delete(a23);
  }
  a23 = &a26;
  sub_1D3E39F28((void ***)&a23);
  _Unwind_Resume(a1);
}

uint64_t sub_1D3E360A4(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t sub_1D3E360AC(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t sub_1D3E360B4(void *a1, CFTypeRef *a2)
{
  unint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = *(void *)(v4 - 8);
  if (v7 >= v6)
  {
    uint64_t v10 = (uint64_t)(v7 - *a1) >> 3;
    if ((unint64_t)(v10 + 1) >> 61) {
      sub_1D3E1AE60();
    }
    uint64_t v11 = v5 - *a1;
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
    uint64_t v26 = v4;
    if (v13) {
      uint64_t v14 = (char *)sub_1D3E21674(v4, v13);
    }
    else {
      uint64_t v14 = 0;
    }
    CFNumberRef v15 = &v14[8 * v10];
    uint64_t v16 = &v14[8 * v13];
    uint64_t v25 = v16;
    int v17 = sub_1D3E39A68(v15, *a2);
    int v9 = v17 + 1;
    v24.i64[1] = (uint64_t)(v17 + 1);
    uint64_t v19 = (void *)*a1;
    CFNumberRef v18 = (void *)a1[1];
    if (v18 == (void *)*a1)
    {
      int64x2_t v21 = vdupq_n_s64((unint64_t)v18);
    }
    else
    {
      do
      {
        *--int v17 = 0;
        uint64_t v20 = *--v18;
        *int v17 = v20;
        void *v18 = 0;
      }
      while (v18 != v19);
      int64x2_t v21 = *(int64x2_t *)a1;
      int v9 = (void *)v24.i64[1];
      uint64_t v16 = v25;
    }
    *a1 = v17;
    a1[1] = v9;
    int64x2_t v24 = v21;
    uint64_t v22 = (char *)a1[2];
    a1[2] = v16;
    uint64_t v25 = v22;
    uint64_t v23 = v21.i64[0];
    uint64_t result = sub_1D3E39FAC((uint64_t)&v23);
  }
  else
  {
    uint64_t result = (uint64_t)sub_1D3E39A68(*(void **)(v4 - 8), *a2);
    int v9 = (void *)(v7 + 8);
  }
  a1[1] = v9;
  return result;
}

void sub_1D3E361D8(uint64_t a1, uint64_t a2, char a3)
{
  if (((a3 & 1) != 0 || !*(unsigned char *)(a1 + 4)) && *(void *)a2 && *(void *)(*(void *)a2 + 192))
  {
    uint64_t v4 = (awd::AWDTriggerFilter *)(a1 + 24);
    awd::AWDTriggerFilter::getAllQueriableMetrics((awd::AWDTriggerFilter *)(a1 + 24), &v19);
    awd::AWDTriggerFilter::getAllTriggers(v4, &v17);
    unint64_t v5 = *(const void **)(*(void *)a2 + 192);
    if (v5) {
      unint64_t v6 = _Block_copy(v5);
    }
    else {
      unint64_t v6 = 0;
    }
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 1174405120;
    block[2] = sub_1D3E36A98;
    block[3] = &unk_1F2B9BF98;
    if (v6) {
      uint64_t v8 = _Block_copy(v6);
    }
    else {
      uint64_t v8 = 0;
    }
    aBlock = v8;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    sub_1D3E39FFC(&v11, v19, (uint64_t)v20, (v20 - (unsigned char *)v19) >> 2);
    __n128 __p = 0;
    CFNumberRef v15 = 0;
    uint64_t v16 = 0;
    sub_1D3E39FFC(&__p, v17, (uint64_t)v18, (v18 - v17) >> 2);
    dispatch_async(global_queue, block);
    if (__p)
    {
      CFNumberRef v15 = __p;
      operator delete(__p);
    }
    if (v11)
    {
      uint64_t v12 = v11;
      operator delete(v11);
    }
    if (aBlock) {
      _Block_release(aBlock);
    }
    if (v6) {
      _Block_release(v6);
    }
    if (v17)
    {
      CFNumberRef v18 = v17;
      operator delete(v17);
    }
    if (v19)
    {
      uint64_t v20 = v19;
      operator delete(v19);
    }
  }
}

void sub_1D3E36378(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *aBlock, void *__p, uint64_t a16)
{
  if (__p) {
    operator delete(__p);
  }
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (v16) {
    _Block_release(v16);
  }
  uint64_t v19 = *(void **)(v17 - 80);
  if (v19)
  {
    *(void *)(v17 - 72) = v19;
    operator delete(v19);
  }
  uint64_t v20 = *(void **)(v17 - 56);
  if (v20)
  {
    *(void *)(v17 - 4MEMORY[0x1D9440F90]((char *)this + 8) = v20;
    operator delete(v20);
  }
  _Unwind_Resume(exception_object);
}

const void **sub_1D3E363E4(const void **result, uint64_t a2)
{
  if (!*((unsigned char *)result + 4) && *(void *)a2 && *(void *)(*(void *)a2 + 200))
  {
    sub_1D3E39B70(&v10, result + 50);
    uint64_t v3 = *(const void **)(*(void *)a2 + 200);
    if (v3) {
      uint64_t v4 = _Block_copy(v3);
    }
    else {
      uint64_t v4 = 0;
    }
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 1174405120;
    block[2] = sub_1D3E36C80;
    block[3] = &unk_1F2B9BFF8;
    if (v4) {
      unint64_t v6 = _Block_copy(v4);
    }
    else {
      unint64_t v6 = 0;
    }
    aBlock = v6;
    int v9 = v10;
    if (v10) {
      CFRetain(v10);
    }
    dispatch_async(global_queue, block);
    sub_1D3E39A34(&v9);
    if (aBlock) {
      _Block_release(aBlock);
    }
    if (v4) {
      _Block_release(v4);
    }
    return sub_1D3E39A34(&v10);
  }
  return result;
}

void sub_1D3E36520(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 296);
  for (size_t i = *(void **)(a1 + 304); v3 != i; v3 += 2)
  {
    unint64_t v7 = (std::__shared_weak_count *)v3[1];
    if (v7)
    {
      uint64_t v8 = std::__shared_weak_count::lock(v7);
      if (v8)
      {
        int v9 = v8;
        if (*v3)
        {
          uint64_t v10 = *(void *)(*v3 + 184);
          if (v10) {
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v10, a2, a3);
          }
        }
        sub_1D3E1D148(v9);
      }
    }
  }
}

void sub_1D3E365AC(_Unwind_Exception *a1)
{
  sub_1D3E1D148(v1);
  _Unwind_Resume(a1);
}

void sub_1D3E365C0(uint64_t a1, uint64_t *a2)
{
  *(unsigned char *)(a1 + 4) = 0;
  uint64_t v4 = *(NSObject **)(a1 + 8);
  *(void *)(a1 + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  if (v4)
  {
    dispatch_group_leave(v4);
    dispatch_release(v4);
  }
  unint64_t v5 = (std::__shared_weak_count *)a2[1];
  uint64_t v8 = *a2;
  int v9 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  awd::AWDTriggerFilter::setConfiguration(a1 + 24, (uint64_t)&v8);
  if (v9) {
    sub_1D3E1D148(v9);
  }
  uint64_t v6 = a2[1];
  v7[0] = *a2;
  v7[1] = v6;
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
  awd::AWDMetricBuffer::setConfiguration(a1 + 80, v7);
}

void sub_1D3E367EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  if (v16) {
    sub_1D3E1D148(v16);
  }
  _Unwind_Resume(exception_object);
}

void sub_1D3E3684C(unsigned int *a1, unsigned int **a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = **a2;
  unint64_t v5 = (awd::AWDTriggerFilter *)(a1 + 6);
  shouldSubmitMetricAsuint64_t Trigger = awd::AWDTriggerFilter::shouldSubmitMetricAsTrigger((awd::AWDTriggerFilter *)(a1 + 6), **a2);
  shouldBufferBOOL Metric = awd::AWDMetricBuffer::shouldBufferMetric((NSObject **)a1 + 10, v4);
  if (shouldBufferMetric || shouldSubmitMetricAsTrigger)
  {
    uint64_t v8 = **((void **)a1 + 2);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *((void *)*a2 + 2);
      uint64_t v10 = *((void *)*a2 + 3);
      ctu::hex();
      p_p = &__p;
      if (v27 < 0) {
        p_p = __p;
      }
      *(_DWORD *)long long buf = 67109634;
      int v29 = v4;
      __int16 v30 = 2048;
      uint64_t v31 = v10 - v9;
      __int16 v32 = 2080;
      long long v33 = p_p;
      _os_log_impl(&dword_1D3E18000, v8, OS_LOG_TYPE_INFO, "core:#I Got trigger metric 0x%x; Metric: %zd bytes [%s]",
        buf,
        0x1Cu);
      if (v27 < 0) {
        operator delete(__p);
      }
    }
    BOOL v12 = sub_1D3E37224(a1, *a2);
    BOOL v13 = v12;
    if (shouldBufferMetric) {
      awd::AWDMetricBuffer::buffer((NSObject **)a1 + 10, (uint64_t)a2);
    }
    if (v13)
    {
      if (shouldSubmitMetricAsTrigger == 1
        || shouldSubmitMetricAsTrigger == 2 && (BOOL v12 = awd::AWDTriggerFilter::evaluateRandomSamplingForTrigger(v5, v4)))
      {
        unint64_t AWDTimestamp = awd::getAWDTimestamp((awd *)v12);
        CFNumberRef v15 = **((void **)a1 + 2);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 67109120;
          int v29 = v4;
          _os_log_impl(&dword_1D3E18000, v15, OS_LOG_TYPE_INFO, "core:#I Sending a trigger for metric 0x%x", buf, 8u);
        }
        uint64_t v16 = (int *)*((void *)a1 + 35);
        int v17 = *v16 + 1;
        int *v16 = v17;
        unint64_t v18 = *a1 | (unint64_t)(v4 << 32);
        awd::AWDMetricBuffer::pushTriggerToDaemon((void *)a1 + 10, v18, v17, AWDTimestamp);
        sub_1D3E37370((uint64_t)a1, v18, v17);
      }
      else
      {
        uint64_t v19 = **((void **)a1 + 2);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          sub_1D3E4E044(v4, v19, v20, v21, v22, v23, v24, v25);
        }
      }
    }
  }
}

void sub_1D3E36A98(uint64_t a1)
{
}

void sub_1D3E36AAC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *a1;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v8 = 0;
  sub_1D3E39FFC(&v8, *(const void **)a2, *(void *)(a2 + 8), (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 2);
  __n128 __p = 0;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  sub_1D3E39FFC(&__p, *(const void **)a3, *(void *)(a3 + 8), (uint64_t)(*(void *)(a3 + 8) - *(void *)a3) >> 2);
  (*(void (**)(uint64_t, void **, void **))(v4 + 16))(v4, &v8, &__p);
  if (__p)
  {
    uint64_t v6 = __p;
    operator delete(__p);
  }
  if (v8)
  {
    uint64_t v9 = v8;
    operator delete(v8);
  }
}

void sub_1D3E36B4C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  if (a12) {
    operator delete(a12);
  }
  _Unwind_Resume(exception_object);
}

void *sub_1D3E36B80(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a2 + 32);
  if (v4) {
    uint64_t v4 = _Block_copy(v4);
  }
  a1[5] = 0;
  a1[4] = v4;
  a1[6] = 0;
  a1[7] = 0;
  sub_1D3E39FFC(a1 + 5, *(const void **)(a2 + 40), *(void *)(a2 + 48), (uint64_t)(*(void *)(a2 + 48) - *(void *)(a2 + 40)) >> 2);
  a1[8] = 0;
  a1[9] = 0;
  a1[10] = 0;
  return sub_1D3E39FFC(a1 + 8, *(const void **)(a2 + 64), *(void *)(a2 + 72), (uint64_t)(*(void *)(a2 + 72) - *(void *)(a2 + 64)) >> 2);
}

void sub_1D3E36BFC(_Unwind_Exception *exception_object)
{
  uint64_t v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 4MEMORY[0x1D9440F90]((char *)this + 8) = v4;
    operator delete(v4);
  }
  unint64_t v5 = *(const void **)(v1 + 32);
  if (v5) {
    _Block_release(v5);
  }
  _Unwind_Resume(exception_object);
}

void sub_1D3E36C30(void *a1)
{
  uint64_t v2 = (void *)a1[8];
  if (v2)
  {
    a1[9] = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)a1[5];
  if (v3)
  {
    a1[6] = v3;
    operator delete(v3);
  }
  uint64_t v4 = (const void *)a1[4];
  if (v4) {
    _Block_release(v4);
  }
}

uint64_t sub_1D3E36C80(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

const void **sub_1D3E36C90(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a2 + 32);
  if (v4) {
    uint64_t v4 = _Block_copy(v4);
  }
  *(void *)(a1 + 32) = v4;
  return sub_1D3E39B70((const void **)(a1 + 40), (const void **)(a2 + 40));
}

void sub_1D3E36CE0(uint64_t a1)
{
  sub_1D3E39A34((const void **)(a1 + 40));
  uint64_t v2 = *(const void **)(a1 + 32);
  if (v2) {
    _Block_release(v2);
  }
}

void sub_1D3E36D18(unsigned int *a1, unsigned int a2)
{
  awd::SimpleMetricHelper::makeSimpleMetric((awd::SimpleMetricHelper *)(a1 + 52), a2, (uint64_t *)&v4);
  if (v4)
  {
    sub_1D3E3684C(a1, &v4);
    uint64_t v3 = v4;
    uint64_t v4 = 0;
    if (v3) {
      sub_1D3E21120((uint64_t)&v4, (uint64_t)v3);
    }
  }
}

void sub_1D3E36D74(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  uint64_t v11 = a10;
  a10 = 0;
  if (v11) {
    sub_1D3E21120((uint64_t)&a10, v11);
  }
  _Unwind_Resume(exception_object);
}

void sub_1D3E36D94(unsigned int *a1, unsigned int a2)
{
  awd::SimpleMetricHelper::makeSimpleMetric((awd::SimpleMetricHelper *)(a1 + 52), a2, (uint64_t *)&v4);
  if (v4)
  {
    sub_1D3E3684C(a1, &v4);
    uint64_t v3 = v4;
    uint64_t v4 = 0;
    if (v3) {
      sub_1D3E21120((uint64_t)&v4, (uint64_t)v3);
    }
  }
}

void sub_1D3E36DF0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  uint64_t v11 = a10;
  a10 = 0;
  if (v11) {
    sub_1D3E21120((uint64_t)&a10, v11);
  }
  _Unwind_Resume(exception_object);
}

void sub_1D3E36E10(unsigned int *a1, unsigned int a2)
{
  awd::SimpleMetricHelper::makeSimpleMetric((awd::SimpleMetricHelper *)(a1 + 52), a2, (uint64_t *)&v4);
  if (v4)
  {
    sub_1D3E3684C(a1, &v4);
    uint64_t v3 = v4;
    uint64_t v4 = 0;
    if (v3) {
      sub_1D3E21120((uint64_t)&v4, (uint64_t)v3);
    }
  }
}

void sub_1D3E36E6C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  uint64_t v11 = a10;
  a10 = 0;
  if (v11) {
    sub_1D3E21120((uint64_t)&a10, v11);
  }
  _Unwind_Resume(exception_object);
}

void sub_1D3E36E8C(unsigned int *a1, unsigned int a2)
{
  awd::SimpleMetricHelper::makeSimpleMetric((awd::SimpleMetricHelper *)(a1 + 52), a2, (uint64_t *)&v4);
  if (v4)
  {
    sub_1D3E3684C(a1, &v4);
    uint64_t v3 = v4;
    uint64_t v4 = 0;
    if (v3) {
      sub_1D3E21120((uint64_t)&v4, (uint64_t)v3);
    }
  }
}

void sub_1D3E36EE8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  uint64_t v11 = a10;
  a10 = 0;
  if (v11) {
    sub_1D3E21120((uint64_t)&a10, v11);
  }
  _Unwind_Resume(exception_object);
}

void sub_1D3E36F08(unsigned int *a1, unsigned int a2, uint64_t a3)
{
  if (*(char *)(a3 + 23) < 0)
  {
    sub_1D3E1D074(__p, *(void **)a3, *(void *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)__n128 __p = *(_OWORD *)a3;
    uint64_t v8 = *(void *)(a3 + 16);
  }
  awd::SimpleMetricHelper::makeSimpleMetric((awd::SimpleMetricHelper *)(a1 + 52), a2, (uint64_t *)&v6);
  if (v6)
  {
    sub_1D3E3684C(a1, &v6);
    unint64_t v5 = v6;
    uint64_t v6 = 0;
    if (v5) {
      sub_1D3E21120((uint64_t)&v6, (uint64_t)v5);
    }
  }
  if (SHIBYTE(v8) < 0) {
    operator delete(__p[0]);
  }
}

void sub_1D3E36FB4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  uint64_t v17 = a10;
  a10 = 0;
  if (v17) {
    sub_1D3E21120((uint64_t)&a10, v17);
  }
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1D3E36FEC(uint64_t a1, unsigned int **a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 4))
  {
    uint64_t v4 = a1 + 360;
    unint64_t v5 = *(uint64_t **)(a1 + 360);
    if (!v5) {
      operator new();
    }
    unint64_t v6 = v5[2];
    uint64_t v7 = (unsigned int **)v5[1];
    if ((unint64_t)v7 >= v6)
    {
      uint64_t v10 = ((uint64_t)v7 - *v5) >> 3;
      if ((unint64_t)(v10 + 1) >> 61) {
        sub_1D3E1AE60();
      }
      uint64_t v11 = v6 - *v5;
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
      uint64_t v22 = v5 + 2;
      if (v13) {
        uint64_t v14 = (char *)sub_1D3E21674((uint64_t)(v5 + 2), v13);
      }
      else {
        uint64_t v14 = 0;
      }
      CFNumberRef v15 = (unsigned int **)&v14[8 * v10];
      *(void *)&long long v19 = v14;
      *((void *)&v19 + 1) = v15;
      uint64_t v21 = &v14[8 * v13];
      uint64_t v16 = *a2;
      *a2 = 0;
      NSObject *v15 = v16;
      uint64_t v20 = v15 + 1;
      sub_1D3E28050(v5, &v19);
      uint64_t v9 = (void *)v5[1];
      sub_1D3E26504((uint64_t)&v19);
    }
    else
    {
      uint64_t v8 = *a2;
      *a2 = 0;
      *uint64_t v7 = v8;
      uint64_t v9 = v7 + 1;
      v5[1] = (uint64_t)v9;
    }
    v5[1] = (uint64_t)v9;
    uint64_t v17 = **(NSObject ***)(a1 + 16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = (uint64_t)(*(void *)(*(void *)v4 + 8) - **(void **)v4) >> 3;
      LODWORD(v19) = 134217984;
      *(void *)((char *)&v19 + 4) = v18;
      _os_log_impl(&dword_1D3E18000, v17, OS_LOG_TYPE_INFO, "core:#I Configuration not ready yet; buffering a metric until we get it (%zd total buffered)",
        (uint8_t *)&v19,
        0xCu);
    }
  }
  else
  {
    sub_1D3E3684C((unsigned int *)a1, a2);
  }
}

void sub_1D3E37208(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

BOOL sub_1D3E37224(unsigned int *a1, unsigned int *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  sub_1D3E37580((uint64_t)a1, *a2, (uint64_t)v20);
  int v5 = v20[0];
  if (v20[0])
  {
    awd::AWDTriggerFilter::profileIdForTriggerId((awd::AWDTriggerFilter *)(a1 + 6), HIDWORD(v21), (uint64_t)&v18);
    unint64_t v6 = v18;
    uint64_t v7 = v19;
    if (v18 != v19)
    {
      uint64_t v8 = v21;
      uint64_t v9 = v22;
      do
      {
        unint64_t v2 = v2 & 0xFFFFFFFF00000000 | v9;
        awd::AWDMetricBuffer::pushMetricToDaemon((uint64_t)(a1 + 20), v8, v2, *v6++, *a1, (uint64_t)a2);
      }
      while (v6 != v7);
      unint64_t v6 = v18;
    }
    if (v6)
    {
      long long v19 = v6;
      operator delete(v6);
    }
  }
  else
  {
    uint64_t v10 = **((void **)a1 + 2);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_1D3E4E0B0((uint64_t)a2, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  return v5 == 0;
}

void sub_1D3E3734C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
}

void sub_1D3E37370(uint64_t a1, unint64_t a2, unsigned int a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  dispatch_object_t object = dispatch_group_create();
  awd::AWDMetricBuffer::trigger((NSObject **)(a1 + 80), a2, a3, (uint64_t)&object);
  unint64_t v6 = HIDWORD(a2);
  awd::AWDTriggerFilter::getQueriableMetricsForTrigger((awd::AWDTriggerFilter *)(a1 + 24), HIDWORD(a2), (uint64_t)&__p);
  uint64_t v7 = __p;
  uint64_t v8 = v16;
  uint64_t v9 = **(NSObject ***)(a1 + 16);
  if (__p == v16)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_1D3E4E120(SHIDWORD(a2), v9);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 134218240;
    uint64_t v19 = (v8 - v7) >> 2;
    __int16 v20 = 1024;
    int v21 = HIDWORD(a2);
    _os_log_impl(&dword_1D3E18000, v9, OS_LOG_TYPE_INFO, "core:#I setExpectedMetricsForTrigger found %zd queriable metrics for trigger 0x%x", buf, 0x12u);
  }
  uint64_t v10 = *(uint64_t **)(a1 + 296);
  for (size_t i = *(uint64_t **)(a1 + 304); v10 != i; v10 += 2)
  {
    uint64_t v12 = (std::__shared_weak_count *)v10[1];
    if (v12)
    {
      uint64_t v13 = std::__shared_weak_count::lock(v12);
      if (v13)
      {
        uint64_t v14 = v13;
        if (*v10)
        {
          unint64_t v6 = v6 & 0xFFFFFFFF00000000 | a3;
          sub_1D3E37660(a1, *v10, a2, v6, &object, (unsigned int **)&__p);
        }
        sub_1D3E1D148(v14);
      }
    }
  }
  awd::AWDMetricBuffer::finishSubmissionToDaemon(a1 + 80, a2, a3, *(_DWORD *)a1);
  if (__p)
  {
    uint64_t v16 = __p;
    operator delete(__p);
  }
  if (object) {
    dispatch_release(object);
  }
}

void sub_1D3E37534(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, dispatch_object_t object)
{
}

void sub_1D3E37580(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *(void *)(a1 + 328);
  if (!v5) {
    goto LABEL_12;
  }
  uint64_t v6 = a1 + 328;
  do
  {
    unsigned int v7 = *(_DWORD *)(v5 + 32);
    BOOL v8 = v7 >= a2;
    if (v7 >= a2) {
      uint64_t v9 = (uint64_t *)v5;
    }
    else {
      uint64_t v9 = (uint64_t *)(v5 + 8);
    }
    if (v8) {
      uint64_t v6 = v5;
    }
    uint64_t v5 = *v9;
  }
  while (*v9);
  if (v6 != a1 + 328 && *(_DWORD *)(v6 + 32) <= a2)
  {
    int v18 = *(_DWORD *)(v6 + 48);
    uint64_t v19 = *(void *)(v6 + 40);
    sub_1D3E3A1F4((uint64_t **)(a1 + 320), (uint64_t *)v6);
    sub_1D3E39CA4(v6 + 32);
    operator delete((void *)v6);
    *(void *)(a3 + 4) = v19;
    *(_DWORD *)(a3 + 12) = v18;
    char v17 = 1;
  }
  else
  {
LABEL_12:
    uint64_t v10 = **(NSObject ***)(a1 + 16);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_1D3E4E1A4(a2, v10, v11, v12, v13, v14, v15, v16);
    }
    char v17 = 0;
  }
  *(unsigned char *)a3 = v17;
}

void sub_1D3E37660(uint64_t a1, uint64_t a2, unint64_t a3, unsigned int a4, NSObject **a5, unsigned int **a6)
{
  awd::ServerConnectionInfo::trigger_sync(a2, a3, a4, a6, (char **)__p);
  uint64_t v10 = *a5;
  uint64_t v11 = v10;
  if (v10) {
    dispatch_retain(v10);
  }
  sub_1D3E37858(a1, a3, a4, &v11, (int **)__p);
  if (v10) {
    dispatch_release(v10);
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

void sub_1D3E376FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  if (v10) {
    dispatch_release(v10);
  }
  sub_1D3E4E210((uint64_t)&a10);
  _Unwind_Resume(a1);
}

void sub_1D3E3771C(uint64_t a1, unint64_t a2, unsigned int a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = HIDWORD(a2);
  isMetricSetAsuint64_t Trigger = awd::AWDTriggerFilter::isMetricSetAsTrigger((awd::AWDTriggerFilter *)(a1 + 24), HIDWORD(a2));
  BOOL v8 = *(os_log_t **)(a1 + 16);
  uint64_t v9 = *v8;
  if (isMetricSetAsTrigger)
  {
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
    {
      int v10 = 67109376;
      int v11 = v6;
      __int16 v12 = 1024;
      int v13 = a2;
      _os_log_impl(&dword_1D3E18000, v9, OS_LOG_TYPE_INFO, "core:#I Got expected trigger 0x%x from component 0x%x", (uint8_t *)&v10, 0xEu);
    }
    sub_1D3E37370(a1, a2, a3);
  }
  else if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 67109376;
    int v11 = v6;
    __int16 v12 = 1024;
    int v13 = a2;
    _os_log_impl(&dword_1D3E18000, v9, OS_LOG_TYPE_DEFAULT, "core:#E Got Unexpected trigger 0x%x from component 0x%x", (uint8_t *)&v10, 0xEu);
  }
}

void sub_1D3E37858(uint64_t a1, uint64_t a2, int a3, NSObject **a4, int **a5)
{
  int v10 = *a5;
  int v11 = a5[1];
  if (*a5 != v11)
  {
    do
    {
      int v24 = *v10;
      uint64_t v21 = a2;
      int v22 = a3;
      __int16 v12 = *a4;
      dispatch_object_t object = v12;
      if (v12) {
        dispatch_retain(v12);
      }
      sub_1D3E3A078((uint64_t **)(a1 + 320), &v24, (uint64_t)&v21);
      if (object) {
        dispatch_release(object);
      }
      ++v10;
    }
    while (v10 != v11);
  }
  int v13 = *(std::__shared_weak_count **)(a1 + 352);
  if (v13)
  {
    uint64_t v14 = std::__shared_weak_count::lock(v13);
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)(a1 + 344);
      if (v16)
      {
        char v17 = *a5;
        int v18 = a5[1];
        if (*a5 != v18)
        {
          uint64_t v19 = (uint64_t **)(v16 + 8);
          do
          {
            int v24 = *v17;
            uint64_t v21 = a2;
            int v22 = a3;
            __int16 v20 = *a4;
            dispatch_object_t object = v20;
            if (v20) {
              dispatch_retain(v20);
            }
            sub_1D3E3A078(v19, &v24, (uint64_t)&v21);
            if (object) {
              dispatch_release(object);
            }
            ++v17;
          }
          while (v17 != v18);
        }
      }
      sub_1D3E1D148(v15);
    }
  }
}

void sub_1D3E3797C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, dispatch_object_t object)
{
  if (object) {
    dispatch_release(object);
  }
  sub_1D3E1D148(v11);
  _Unwind_Resume(a1);
}

void sub_1D3E379B0(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 296);
  for (uint64_t i = *(void *)(a1 + 304); v2 != i; v2 += 16)
  {
    uint64_t v5 = *(std::__shared_weak_count **)(v2 + 8);
    if (v5)
    {
      unint64_t v6 = std::__shared_weak_count::lock(v5);
      if (v6)
      {
        unsigned int v7 = v6;
        if (a2 == 1)
        {
          if (*(void *)v2) {
            awd::ServerConnectionInfo::handleNotificationTimer24h_sync(*(awd::ServerConnectionInfo **)v2);
          }
        }
        sub_1D3E1D148(v7);
      }
    }
  }
}

void sub_1D3E37A20(_Unwind_Exception *a1)
{
  sub_1D3E1D148(v1);
  _Unwind_Resume(a1);
}

uint64_t *sub_1D3E37A34(uint64_t *result, uint64_t a2)
{
  uint64_t v2 = *result;
  *uint64_t result = a2;
  if (v2)
  {
    sub_1D3E3A5EC(v2 + 16, *(void **)(v2 + 24));
    JUMPOUT(0x1D94412F0);
  }
  return result;
}

void sub_1D3E37A98(void *a1@<X8>)
{
  std::mutex::lock((std::mutex *)&qword_1EB220A78);
  if (!(void)xmmword_1EB220A10) {
    sub_1D3E37B50();
  }
  uint64_t v2 = *((void *)&xmmword_1EB220A10 + 1);
  *a1 = xmmword_1EB220A10;
  a1[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  std::mutex::unlock((std::mutex *)&qword_1EB220A78);
}

void sub_1D3E37B38(_Unwind_Exception *a1)
{
}

void sub_1D3E37B50()
{
}

void sub_1D3E37CA4(_Unwind_Exception *a1)
{
  MEMORY[0x1D94412F0](v1, 0x1030C4088B9B922);
  _Unwind_Resume(a1);
}

void sub_1D3E37CC8(void *a1@<X8>)
{
  std::mutex::lock((std::mutex *)&qword_1EB220A78);
  uint64_t v2 = *((void *)&xmmword_1EB220A10 + 1);
  *a1 = xmmword_1EB220A10;
  a1[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  std::mutex::unlock((std::mutex *)&qword_1EB220A78);
}

void sub_1D3E37D2C(uint64_t a1)
{
}

void sub_1D3E37D34(void *a1)
{
}

void sub_1D3E37DE8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_weak(a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1D3E37E00(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(result + 32) = *(void *)(a2 + 32);
  *(void *)(result + 40) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_1D3E37E1C(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 40);
  if (v1) {
    sub_1D3E1D148(v1);
  }
}

_DWORD *sub_1D3E37E2C(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 104);
  uint64_t v3 = *(void *)(a1 + 112);
  if (v2 != v3)
  {
    while (**(_DWORD **)v2 != a2)
    {
      v2 += 8;
      if (v2 == v3) {
        goto LABEL_7;
      }
    }
  }
  if (v2 == v3) {
LABEL_7:
  }
    sub_1D3E38018();
  return *(_DWORD **)v2;
}

void sub_1D3E38000(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_1D3E3A81C((uint64_t *)va, 0);
  _Unwind_Resume(a1);
}

void sub_1D3E38018()
{
}

void sub_1D3E3813C(_Unwind_Exception *a1)
{
  if (v3) {
    sub_1D3E1D148(v3);
  }
  sub_1D3E4E238(v4, v2);
  MEMORY[0x1D94412F0](v1, 0x10F0C40B57F0170);
  _Unwind_Resume(a1);
}

void sub_1D3E38178(uint64_t a1, int a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v2 = *(_DWORD *)(a1 + 56);
  if (v2 != a2)
  {
    uint64_t v5 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v9[0] = 67109376;
      v9[1] = v2;
      __int16 v10 = 1024;
      int v11 = a2;
      _os_log_impl(&dword_1D3E18000, v5, OS_LOG_TYPE_INFO, "core:#I DeviceConfigurationId changing from %d to %d; marking clients as needing config",
        (uint8_t *)v9,
        0xEu);
    }
    *(_DWORD *)(a1 + 56) = a2;
    unint64_t v6 = *(uint64_t **)(a1 + 104);
    for (uint64_t i = *(uint64_t **)(a1 + 112); v6 != i; *(unsigned char *)(v8 + 4) = 1)
      uint64_t v8 = *v6++;
  }
}

void sub_1D3E3825C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(a4 + 8);
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  sub_1D3E248A0(&v5, a1);
  operator new();
}

void sub_1D3E38360(void *a1, int a2, unint64_t a3, unsigned int a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = (_DWORD **)a1[13];
  unsigned int v7 = (_DWORD **)a1[14];
  if (v6 != v7)
  {
    while (**v6 != a2)
    {
      if (++v6 == v7) {
        goto LABEL_10;
      }
    }
  }
  if (v6 == v7 || (uint64_t v8 = *v6) == 0)
  {
LABEL_10:
    uint64_t v9 = a1[4];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 67109632;
      v10[1] = a3;
      __int16 v11 = 1024;
      int v12 = HIDWORD(a3);
      __int16 v13 = 1024;
      unsigned int v14 = a4;
      _os_log_impl(&dword_1D3E18000, v9, OS_LOG_TYPE_DEFAULT, "core:#E Got Unexpected Trigger(cid=0x%x, trid=0x%x, sid=%u) (no component config!)", (uint8_t *)v10, 0x14u);
    }
  }
  else
  {
    sub_1D3E3771C((uint64_t)v8, a3, a4);
  }
}

void sub_1D3E384A4(void *a1)
{
  sub_1D3E248A0(&v1, a1);
  operator new();
}

void sub_1D3E3859C(void *a1)
{
  sub_1D3E248A0(&v1, a1);
  operator new();
}

void sub_1D3E38674(void *a1)
{
  sub_1D3E248A0(&v1, a1);
  operator new();
}

void sub_1D3E38774(void *a1, xpc_object_t *a2)
{
  if (*a2) {
    xpc_retain(*a2);
  }
  else {
    xpc_null_create();
  }
  sub_1D3E248A0(&v3, a1);
  operator new();
}

void sub_1D3E38894(void *a1)
{
  sub_1D3E248A0(&v1, a1);
  operator new();
}

uint64_t sub_1D3E38974(uint64_t a1)
{
  sub_1D3E38A34((void *)a1, "com.apple.awd.framework.core", QOS_CLASS_DEFAULT, "core");
  int v2 = operator new(0x20uLL);
  v2[1] = 0;
  v2[2] = 0;
  *int v2 = &unk_1F2B9B890;
  *((_DWORD *)v2 + 6) = 0;
  *(void *)(a1 + 40) = v2 + 3;
  *(void *)(a1 + 4MEMORY[0x1D9440F90]((char *)this + 8) = v2;
  *(_DWORD *)(a1 + 56) = 0;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 12MEMORY[0x1D9440F90]((char *)this + 8) = 0u;
  gettimeofday(&v4, 0);
  **(_DWORD **)(a1 + 40) = v4.tv_sec;
  return a1;
}

void *sub_1D3E38A34(void *a1, const char *a2, dispatch_qos_class_t a3, const char *a4)
{
  dispatch_object_t object = 0;
  sub_1D3E24930(a1, a2, a3, &object);
  if (object) {
    dispatch_release(object);
  }
  ctu::OsLogLogger::OsLogLogger((ctu::OsLogLogger *)(a1 + 4), "com.apple.awd.framework", a4);
  return a1;
}

void sub_1D3E38A90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, dispatch_object_t object)
{
  sub_1D3E1CFA4(v10);
  _Unwind_Resume(a1);
}

void *sub_1D3E38AB8(uint64_t a1)
{
  int v2 = *(std::__shared_weak_count **)(a1 + 136);
  if (v2) {
    sub_1D3E1D148(v2);
  }
  uint64_t v8 = (void **)(a1 + 104);
  sub_1D3E3B270(&v8);
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 96);
  if (v3) {
    sub_1D3E1D148(v3);
  }
  timeval v4 = *(std::__shared_weak_count **)(a1 + 80);
  if (v4) {
    sub_1D3E1D148(v4);
  }
  uint64_t v5 = *(NSObject **)(a1 + 64);
  if (v5) {
    dispatch_release(v5);
  }
  unint64_t v6 = *(std::__shared_weak_count **)(a1 + 48);
  if (v6) {
    sub_1D3E1D148(v6);
  }
  MEMORY[0x1D9440F90](a1 + 32);
  return sub_1D3E1CFA4((void *)a1);
}

void sub_1D3E38B3C(void *a1)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  if (DarwinNotifyCenter)
  {
    CFNotificationCenterAddObserver(DarwinNotifyCenter, a1, (CFNotificationCallback)sub_1D3E38F00, @"AWDD Started", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    uint64_t v3 = a1[4];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_1D3E4E270(v3);
    }
  }
}

void sub_1D3E38BB0(void *a1)
{
  sub_1D3E248A0(&v2, a1);
  uint64_t v1 = (std::__shared_weak_count *)*((void *)&v2 + 1);
  if (*((void *)&v2 + 1))
  {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v2 + 1) + 16), 1uLL, memory_order_relaxed);
    sub_1D3E1D148(v1);
  }
  if (v1)
  {
    atomic_fetch_add_explicit(&v1->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v1->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v1->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v1->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v1->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v1->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  awd::AWDServerFacade::create();
}

void sub_1D3E38EA0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, std::__shared_weak_count *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,std::__shared_weak_count *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,std::__shared_weak_count *a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,std::__shared_weak_count *a36)
{
  if (a15) {
    std::__shared_weak_count::__release_weak(a15);
  }
  if (a22) {
    std::__shared_weak_count::__release_weak(a22);
  }
  if (a29) {
    std::__shared_weak_count::__release_weak(a29);
  }
  if (a36) {
    std::__shared_weak_count::__release_weak(a36);
  }
  unint64_t v39 = *(std::__shared_weak_count **)(v37 - 112);
  if (v39) {
    std::__shared_weak_count::__release_weak(v39);
  }
  std::string v40 = *(std::__shared_weak_count **)(v37 - 56);
  if (v40) {
    std::__shared_weak_count::__release_weak(v40);
  }
  if (v36) {
    std::__shared_weak_count::__release_weak(v36);
  }
  _Unwind_Resume(exception_object);
}

void sub_1D3E38F00()
{
  sub_1D3E37CC8(&v1);
  if (v1) {
    sub_1D3E39360(v1);
  }
  v0 = v2;
  if (v2)
  {
    sub_1D3E1D148(v0);
  }
}

void sub_1D3E38F54(void *a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v5 = (std::__shared_weak_count *)a1[6];
  if (v5)
  {
    uint64_t v9 = (void *)a1[4];
    __int16 v10 = std::__shared_weak_count::lock(v5);
    if (v10)
    {
      if (a1[5])
      {
        uint64_t v11 = *a4;
        uint64_t v12 = a4[1];
        v13[0] = v11;
        v13[1] = v12;
        if (v12)
        {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(v12 + 8), 1uLL, memory_order_relaxed);
          sub_1D3E3825C(v9, a2, a3, (uint64_t)v13);
        }
        sub_1D3E3825C(v9, a2, a3, (uint64_t)v13);
      }
      sub_1D3E1D148(v10);
    }
  }
}

uint64_t sub_1D3E39030(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 4MEMORY[0x1D9440F90]((char *)this + 8) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_1D3E3904C(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

void sub_1D3E3905C(void *a1)
{
  uint64_t v2 = (std::__shared_weak_count *)a1[6];
  if (v2)
  {
    uint64_t v3 = (void *)a1[4];
    timeval v4 = std::__shared_weak_count::lock(v2);
    if (v4)
    {
      if (a1[5]) {
        sub_1D3E384A4(v3);
      }
      sub_1D3E1D148(v4);
    }
  }
}

void sub_1D3E390F4(void *a1)
{
  uint64_t v2 = (std::__shared_weak_count *)a1[6];
  if (v2)
  {
    uint64_t v3 = (void *)a1[4];
    timeval v4 = std::__shared_weak_count::lock(v2);
    if (v4)
    {
      if (a1[5]) {
        sub_1D3E3859C(v3);
      }
      sub_1D3E1D148(v4);
    }
  }
}

void sub_1D3E39168(void *a1)
{
  uint64_t v2 = (std::__shared_weak_count *)a1[6];
  if (v2)
  {
    uint64_t v3 = (void *)a1[4];
    timeval v4 = std::__shared_weak_count::lock(v2);
    if (v4)
    {
      if (a1[5]) {
        sub_1D3E38674(v3);
      }
      sub_1D3E1D148(v4);
    }
  }
}

void sub_1D3E39214(void *a1, void **a2)
{
  uint64_t v3 = (std::__shared_weak_count *)a1[6];
  if (v3)
  {
    uint64_t v5 = (void *)a1[4];
    unint64_t v6 = std::__shared_weak_count::lock(v3);
    if (v6)
    {
      if (a1[5])
      {
        unsigned int v7 = *a2;
        xpc_object_t v8 = v7;
        if (v7) {
          xpc_retain(v7);
        }
        else {
          xpc_object_t v8 = xpc_null_create();
        }
        sub_1D3E38774(v5, &v8);
      }
      sub_1D3E1D148(v6);
    }
  }
}

void sub_1D3E392E4(void *a1)
{
  uint64_t v2 = (std::__shared_weak_count *)a1[6];
  if (v2)
  {
    uint64_t v3 = (void *)a1[4];
    timeval v4 = std::__shared_weak_count::lock(v2);
    if (v4)
    {
      if (a1[5]) {
        sub_1D3E38894(v3);
      }
      sub_1D3E1D148(v4);
    }
  }
}

void sub_1D3E39360(void *a1)
{
  sub_1D3E248A0(&v1, a1);
  operator new();
}

uint64_t sub_1D3E39438()
{
  return 1;
}

awd *sub_1D3E39440(awd *result, awd **a2)
{
  if (*a2)
  {
    uint64_t v3 = result;
    if (!*((void *)*a2 + 1))
    {
      unint64_t AWDTimestamp = awd::getAWDTimestamp(result);
      uint64_t v5 = *a2;
      *((void *)v5 + 1) = AWDTimestamp;
      awd::maybeSetTimestamp(v5, v6);
    }
    *a2 = 0;
    sub_1D3E248A0(&v7, v3);
    operator new();
  }
  return result;
}

void sub_1D3E39548(void *a1)
{
  sub_1D3E248A0(&v1, a1);
  operator new();
}

void sub_1D3E39628(void *a1)
{
  sub_1D3E248A0(&v1, a1);
  operator new();
}

void sub_1D3E39710(void *a1)
{
  sub_1D3E248A0(&v1, a1);
  operator new();
}

void sub_1D3E397F8(void *a1)
{
  sub_1D3E248A0(&v1, a1);
  operator new();
}

void sub_1D3E398E0(void *a1, uint64_t a2, void *a3)
{
  uint64_t v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = a3[1];
  *(void *)((char *)v4 + 7) = *(void *)((char *)a3 + 15);
  a3[1] = 0;
  a3[2] = 0;
  *a3 = 0;
  sub_1D3E248A0(&v3, a1);
  operator new();
}

void sub_1D3E39A24(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    sub_1D3E1AE78(a1);
  }
  _Unwind_Resume(a1);
}

const void **sub_1D3E39A34(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void *sub_1D3E39A68(void *a1, CFTypeRef cf)
{
  *a1 = cf;
  if (cf) {
    CFRetain(cf);
  }
  return a1;
}

const void **sub_1D3E39AA0(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **sub_1D3E39AD4(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **sub_1D3E39B08(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **sub_1D3E39B3C(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **sub_1D3E39B70(const void **a1, const void **a2)
{
  uint64_t v3 = *a2;
  *a1 = *a2;
  if (v3) {
    CFRetain(v3);
  }
  return a1;
}

void sub_1D3E39BA8(void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    sub_1D3E39BFC((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void sub_1D3E39BFC(uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 16)
  {
    timeval v4 = *(std::__shared_weak_count **)(i - 8);
    if (v4) {
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  a1[1] = v2;
}

void sub_1D3E39C48(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_1D3E39C48(a1, *a2);
    sub_1D3E39C48(a1, a2[1]);
    sub_1D3E39CA4((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

void sub_1D3E39CA4(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 24);
  if (v2)
  {
    dispatch_group_leave(v2);
    uint64_t v3 = *(NSObject **)(a1 + 24);
    if (v3)
    {
      dispatch_release(v3);
    }
  }
}

void ***sub_1D3E39CF4(void ***result, void **a2)
{
  uint64_t v2 = *result;
  *uint64_t result = a2;
  if (v2)
  {
    uint64_t v3 = v2;
    sub_1D3E25F08(&v3);
    return (void ***)MEMORY[0x1D94412F0](v2, 0x20C40960023A9);
  }
  return result;
}

void sub_1D3E39D48(void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    uint64_t v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 40;
        sub_1D3E39DE0((uint64_t)(v1 + 2), v4);
      }
      while ((void *)v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_1D3E39DE0(uint64_t a1, uint64_t a2)
{
  xpc_release(*(xpc_object_t *)(a2 + 32));
  *(void *)(a2 + 32) = 0;
  if (*(char *)(a2 + 31) < 0)
  {
    uint64_t v3 = *(void **)(a2 + 8);
    operator delete(v3);
  }
}

void sub_1D3E39E38(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F2B9B7E8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1D3E39E58(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F2B9B7E8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1D94412F0);
}

void sub_1D3E39EAC(uint64_t a1)
{
  sub_1D3E39ED8((uint64_t)&v1, a1 + 24);
}

void sub_1D3E39ED8(uint64_t a1, uint64_t a2)
{
  sub_1D3E39C48(a2 + 8, *(void **)(a2 + 16));
  uint64_t v3 = *(NSObject **)a2;
  if (*(void *)a2)
  {
    dispatch_release(v3);
  }
}

void sub_1D3E39F28(void ***a1)
{
  char v1 = *a1;
  uint64_t v2 = (const void **)**a1;
  if (v2)
  {
    uint64_t v4 = (const void **)v1[1];
    uint64_t v5 = v2;
    if (v4 != v2)
    {
      do
        uint64_t v4 = sub_1D3E39B3C(v4 - 1);
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t sub_1D3E39FAC(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 8;
    sub_1D3E39B3C((const void **)(i - 8));
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void *sub_1D3E39FFC(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    unint64_t v6 = result;
    uint64_t result = sub_1D3E2A68C(result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1D3E3A05C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + MEMORY[0x1D9440F90]((char *)this + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *sub_1D3E3A078(uint64_t **a1, _DWORD *a2, uint64_t a3)
{
  unint64_t v6 = a1 + 1;
  uint64_t v7 = operator new(0x40uLL);
  v11[0] = v7;
  v11[1] = v6;
  *((_DWORD *)v7 + MEMORY[0x1D9440F90]((char *)this + 8) = *a2;
  *((void *)v7 + 5) = *(void *)a3;
  *((_DWORD *)v7 + 12) = *(_DWORD *)(a3 + 8);
  sub_1D3E3A15C((dispatch_group_t *)v7 + 7, (NSObject **)(a3 + 16));
  char v12 = 1;
  size_t v8 = a1[1];
  if (v8)
  {
    do
    {
      while (1)
      {
        unint64_t v6 = (uint64_t **)v8;
        if (*((_DWORD *)v7 + 8) >= *((_DWORD *)v8 + 8)) {
          break;
        }
        size_t v8 = (uint64_t *)*v8;
        uint64_t v9 = v6;
        if (!*v6) {
          goto LABEL_8;
        }
      }
      size_t v8 = (uint64_t *)v8[1];
    }
    while (v8);
    uint64_t v9 = v6 + 1;
  }
  else
  {
    uint64_t v9 = v6;
  }
LABEL_8:
  sub_1D3E21220(a1, (uint64_t)v6, v9, (uint64_t *)v7);
  v11[0] = 0;
  sub_1D3E3A19C((uint64_t)v11, 0);
  return v7;
}

dispatch_group_t *sub_1D3E3A15C(dispatch_group_t *a1, NSObject **a2)
{
  uint64_t v3 = *a2;
  *a1 = *a2;
  if (v3)
  {
    dispatch_retain(v3);
    if (*a1) {
      dispatch_group_enter(*a1);
    }
  }
  return a1;
}

void sub_1D3E3A19C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      sub_1D3E39CA4((uint64_t)v2 + 32);
    }
    operator delete(v2);
  }
}

uint64_t *sub_1D3E3A1F4(uint64_t **a1, uint64_t *a2)
{
  uint64_t v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      uint64_t v3 = v2;
      uint64_t v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    uint64_t v4 = a2;
    do
    {
      uint64_t v3 = (uint64_t *)v4[2];
      BOOL v5 = *v3 == (void)v4;
      uint64_t v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2) {
    *a1 = v3;
  }
  unint64_t v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  sub_1D3E3A268(v6, a2);
  return v3;
}

uint64_t *sub_1D3E3A268(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = a2;
  if (*a2)
  {
    uint64_t v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      uint64_t v3 = a2;
      goto LABEL_7;
    }
    do
    {
      uint64_t v3 = v4;
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
  unint64_t v6 = (uint64_t **)v3[2];
  uint64_t v7 = *v6;
  if (*v6 == v3)
  {
    uint64_t *v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      uint64_t v7 = 0;
      uint64_t result = (uint64_t *)v2;
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
    void v3[2] = v9;
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
      uint64_t result = v3;
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
      __int16 v13 = *(uint64_t **)(v12 + 8);
      uint64_t v14 = *v13;
      *(void *)(v12 + MEMORY[0x1D9440F90]((char *)this + 8) = *v13;
      if (v14) {
        *(void *)(v14 + 16) = v12;
      }
      void v13[2] = *(void *)(v12 + 16);
      *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v13;
      *__int16 v13 = v12;
      *(void *)(v12 + 16) = v13;
      if (result == (uint64_t *)*v7) {
        uint64_t result = v7;
      }
      uint64_t v7 = *(uint64_t **)(*v7 + 8);
    }
    uint64_t v15 = (void *)*v7;
    if (*v7 && !*((unsigned char *)v15 + 24))
    {
      uint64_t v16 = (uint64_t *)v7[1];
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
        void v7[2] = (uint64_t)v15;
        uint64_t v16 = v7;
      }
      else
      {
        uint64_t v15 = v7;
      }
      uint64_t v23 = v15[2];
      *((unsigned char *)v15 + 24) = *(unsigned char *)(v23 + 24);
      *(unsigned char *)(v23 + 24) = 1;
      *((unsigned char *)v16 + 24) = 1;
      int v24 = *(uint64_t **)(v23 + 8);
      uint64_t v25 = *v24;
      *(void *)(v23 + MEMORY[0x1D9440F90]((char *)this + 8) = *v24;
      if (v25) {
        *(void *)(v25 + 16) = v23;
      }
      v24[2] = *(void *)(v23 + 16);
      *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
      *int v24 = v23;
      goto LABEL_72;
    }
    uint64_t v16 = (uint64_t *)v7[1];
    if (v16 && !*((unsigned char *)v16 + 24)) {
      goto LABEL_55;
    }
    *((unsigned char *)v7 + 24) = 0;
    char v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      char v17 = result;
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
    void v7[2] = *(void *)(v12 + 16);
    *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(void *)(v12 + 16) = v7;
    if (result == (uint64_t *)v12) {
      uint64_t result = v7;
    }
    uint64_t v7 = *(uint64_t **)v12;
  }
  uint64_t v19 = (void *)*v7;
  if (*v7 && !*((unsigned char *)v19 + 24)) {
    goto LABEL_68;
  }
  __int16 v20 = (uint64_t *)v7[1];
  if (!v20 || *((unsigned char *)v20 + 24))
  {
    *((unsigned char *)v7 + 24) = 0;
    char v17 = (uint64_t *)v7[2];
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
    __int16 v20 = v7;
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
    *__int16 v20 = (uint64_t)v7;
    void v7[2] = (uint64_t)v20;
    uint64_t v19 = v7;
  }
  uint64_t v23 = v20[2];
  *((unsigned char *)v20 + 24) = *(unsigned char *)(v23 + 24);
  *(unsigned char *)(v23 + 24) = 1;
  *((unsigned char *)v19 + 24) = 1;
  int v24 = *(uint64_t **)v23;
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

void sub_1D3E3A5EC(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_1D3E3A5EC(a1, *a2);
    sub_1D3E3A5EC(a1, a2[1]);
    uint64_t v4 = (void *)a2[5];
    if (v4)
    {
      a2[6] = v4;
      operator delete(v4);
    }
    operator delete(a2);
  }
}

void sub_1D3E3A650(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_1D3E3A6C8(void *a1)
{
  __cxa_begin_catch(a1);
  dispatch_barrier_async_f(v1[2], v1, (dispatch_function_t)sub_1D3E3A7A0);
  __cxa_rethrow();
}

void sub_1D3E3A6F0(_Unwind_Exception *a1)
{
}

void sub_1D3E3A708(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1D94412F0);
}

void sub_1D3E3A740(uint64_t a1)
{
}

uint64_t sub_1D3E3A75C(uint64_t a1, uint64_t a2)
{
  if (sub_1D3E247D4(a2, (uint64_t)&unk_1F2B9AAD8)) {
    return a1 + 24;
  }
  else {
    return 0;
  }
}

uint64_t sub_1D3E3A7A0(uint64_t result)
{
  if (result)
  {
    sub_1D3E38AB8(result);
    JUMPOUT(0x1D94412F0);
  }
  return result;
}

uint64_t sub_1D3E3A7E0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1D3E3A7F0(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 4MEMORY[0x1D9440F90]((char *)this + 8) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_1D3E3A80C(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    sub_1D3E1D148(v1);
  }
}

uint64_t sub_1D3E3A81C(uint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    sub_1D3E3A86C(result);
    JUMPOUT(0x1D94412F0);
  }
  return result;
}

uint64_t sub_1D3E3A86C(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 416);
  if (v2) {
    sub_1D3E1D148(v2);
  }
  sub_1D3E39A34((const void **)(a1 + 400));
  uint64_t v11 = (void **)(a1 + 376);
  sub_1D3E39D48(&v11);
  sub_1D3E37A34((uint64_t *)(a1 + 368), 0);
  sub_1D3E39CF4((void ***)(a1 + 360), 0);
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 352);
  if (v3) {
    std::__shared_weak_count::__release_weak(v3);
  }
  sub_1D3E39C48(a1 + 320, *(void **)(a1 + 328));
  uint64_t v11 = (void **)(a1 + 296);
  sub_1D3E39BA8(&v11);
  uint64_t v4 = *(std::__shared_weak_count **)(a1 + 288);
  if (v4) {
    sub_1D3E1D148(v4);
  }
  int v5 = *(std::__shared_weak_count **)(a1 + 272);
  if (v5) {
    std::__shared_weak_count::__release_weak(v5);
  }
  uint64_t v11 = (void **)(a1 + 240);
  sub_1D3E25F08(&v11);
  unint64_t v6 = *(void **)(a1 + 216);
  if (v6)
  {
    *(void *)(a1 + 224) = v6;
    operator delete(v6);
  }
  awd::AWDMetricBuffer::~AWDMetricBuffer((awd::AWDMetricBuffer *)(a1 + 80));
  sub_1D3E2A068(a1 + 56, *(void **)(a1 + 64));
  uint64_t v7 = *(std::__shared_weak_count **)(a1 + 48);
  if (v7) {
    std::__shared_weak_count::__release_weak(v7);
  }
  MEMORY[0x1D9440F90](a1 + 24);
  int v8 = *(NSObject **)(a1 + 8);
  if (v8)
  {
    dispatch_group_leave(v8);
    uint64_t v9 = *(NSObject **)(a1 + 8);
    if (v9) {
      dispatch_release(v9);
    }
  }
  return a1;
}

uint64_t sub_1D3E3A978(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 8;
    sub_1D3E3A81C((uint64_t *)(i - 8), 0);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t *sub_1D3E3A9CC(uint64_t *a1)
{
  uint64_t v1 = *a1;
  unint64_t v6 = a1;
  uint64_t v7 = v1;
  uint64_t v2 = *(void *)v1;
  sub_1D3E38178(*(void *)v1, *(_DWORD *)(v1 + 8));
  uint64_t v3 = *(uint64_t **)(v2 + 104);
  uint64_t v4 = *(uint64_t **)(v2 + 112);
  if (v3 != v4)
  {
    while (*(_DWORD *)*v3 != *(_DWORD *)(v1 + 12))
    {
      if (++v3 == v4) {
        goto LABEL_8;
      }
    }
  }
  if (v3 != v4 && *v3) {
    sub_1D3E365C0(*v3, (uint64_t *)(v1 + 16));
  }
LABEL_8:
  sub_1D3E3AA7C(&v7);
  return sub_1D3E24D00((uint64_t *)&v6);
}

void sub_1D3E3AA60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

uint64_t *sub_1D3E3AA7C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    uint64_t v3 = *(std::__shared_weak_count **)(v2 + 24);
    if (v3) {
      sub_1D3E1D148(v3);
    }
    MEMORY[0x1D94412F0](v2, 0x1020C404161829ELL);
  }
  return a1;
}

uint64_t *sub_1D3E3AAD0(void ***a1)
{
  uint64_t v3 = a1;
  uint64_t v1 = *a1;
  sub_1D3E38360(**a1, *((_DWORD *)v1 + 2), *(unint64_t *)((char *)v1 + 12), *((_DWORD *)v1 + 5));
  MEMORY[0x1D94412F0](v1, 0x1020C4024DAA5DELL);
  return sub_1D3E24D00((uint64_t *)&v3);
}

void sub_1D3E3AB30(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  MEMORY[0x1D94412F0](v2, 0x1020C4024DAA5DELL);
  sub_1D3E24D00((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t *sub_1D3E3AB5C(void **a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = a1;
  uint64_t v1 = (void **)*a1;
  uint64_t v2 = (void *)**a1;
  uint64_t v3 = v2[4];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1D3E18000, v3, OS_LOG_TYPE_INFO, "core:#I ==== BEGIN CLIENT STATE LOG ====", buf, 2u);
  }
  uint64_t v4 = (int **)v2[13];
  for (uint64_t i = (int **)v2[14]; v4 != i; ++v4)
  {
    unint64_t v6 = v2[4];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = **v4;
      *(_DWORD *)long long buf = 67109120;
      int v17 = v7;
      _os_log_impl(&dword_1D3E18000, v6, OS_LOG_TYPE_INFO, "core:#I Component is 0x%x", buf, 8u);
    }
    awd::AWDTriggerFilter::debugLog((NSObject **)*v4 + 3);
    awd::AWDMetricBuffer::debugLog((NSObject **)*v4 + 10);
    int v8 = (void *)*((void *)*v4 + 37);
    uint64_t v9 = (void *)*((void *)*v4 + 38);
    while (v8 != v9)
    {
      uint64_t v10 = (std::__shared_weak_count *)v8[1];
      if (v10)
      {
        uint64_t v11 = std::__shared_weak_count::lock(v10);
        if (v11)
        {
          uint64_t v12 = v11;
          if (*v8) {
            awd::AWDLoggingMetric::debugLog((awd::AWDLoggingMetric *)(*v8 + 48));
          }
          sub_1D3E1D148(v12);
        }
      }
      v8 += 2;
    }
  }
  __int16 v13 = v2[4];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1D3E18000, v13, OS_LOG_TYPE_INFO, "core:#I ==== END CLIENT STATE LOG ====", buf, 2u);
  }
  MEMORY[0x1D94412F0](v1, 0x20C4093837F09);
  return sub_1D3E24D00((uint64_t *)&v15);
}

void sub_1D3E3AD44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  MEMORY[0x1D94412F0](v4, 0x20C4093837F09);
  sub_1D3E24D00((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t *sub_1D3E3AD80(void **a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = a1;
  uint64_t v1 = *a1;
  uint64_t v2 = (void *)**a1;
  int v3 = *((_DWORD *)*a1 + 2);
  uint64_t v4 = (uint64_t *)v2[13];
  int v5 = (uint64_t *)v2[14];
  BOOL v6 = v4 == v5;
  if (v3)
  {
    if (v4 != v5)
    {
      while (*(_DWORD *)*v4 != v3)
      {
        if (++v4 == v5) {
          goto LABEL_12;
        }
      }
    }
    if (v4 == v5 || !*v4)
    {
LABEL_12:
      int v7 = v2[4];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 67109120;
        int v11 = v3;
        _os_log_impl(&dword_1D3E18000, v7, OS_LOG_TYPE_DEFAULT, "core:#E Got Unexpected PII/Location callback for component 0x%x (no component config!)", buf, 8u);
      }
    }
    else
    {
      sub_1D3E36520(*v4, *((unsigned __int8 *)v1 + 12), *((unsigned __int8 *)v1 + 13));
    }
  }
  else
  {
    while (!v6)
    {
      sub_1D3E36520(*v4++, *((unsigned __int8 *)v1 + 12), *((unsigned __int8 *)v1 + 13));
      BOOL v6 = v4 == v5;
    }
  }
  MEMORY[0x1D94412F0](v1, 0x1020C4093AC423CLL);
  return sub_1D3E24D00((uint64_t *)&v9);
}

void sub_1D3E3AEC8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  MEMORY[0x1D94412F0](v2, 0x1020C4093AC423CLL);
  sub_1D3E24D00((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t *sub_1D3E3AEF8(uint64_t *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *a1;
  int v8 = a1;
  uint64_t v9 = v1;
  uint64_t v2 = *(void *)v1;
  xpc_object_t value = xpc_dictionary_get_value(*(xpc_object_t *)(v1 + 8), "base");
  xpc_object_t v4 = xpc_dictionary_get_value(*(xpc_object_t *)(v1 + 8), "component");
  if (value)
  {
    LazyMetadataLoader::setBaseMetadata(*(LazyMetadataLoader **)(v2 + 128), value);
  }
  else
  {
    int v5 = *(NSObject **)(v2 + 32);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = *(_DWORD *)(v1 + 16);
      *(_DWORD *)long long buf = 67109120;
      int v11 = v6;
      _os_log_impl(&dword_1D3E18000, v5, OS_LOG_TYPE_INFO, "core:#I CoreAnalytics shim: No baseline metadata returned (processing metric with cid 0x%x)", buf, 8u);
    }
  }
  LazyMetadataLoader::setMetadataForComponent(*(LazyMetadataLoader **)(v2 + 128), v4);
  sub_1D3E3B024(&v9);
  return sub_1D3E24D00((uint64_t *)&v8);
}

void sub_1D3E3B008(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

uint64_t *sub_1D3E3B024(uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    xpc_release(*(xpc_object_t *)(v2 + 8));
    *(void *)(v2 + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
    MEMORY[0x1D94412F0](v2, 0x10A0C4036B0EFECLL);
  }
  return a1;
}

uint64_t *sub_1D3E3B07C(void **a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = a1;
  uint64_t v1 = *a1;
  uint64_t v2 = (void *)**a1;
  int v3 = (int **)v2[13];
  for (uint64_t i = (int **)v2[14]; v3 != i; ++v3)
  {
    int v5 = *v3;
    int v6 = **v3;
    if (v6 == 8 || v6 == 72 || v6 == 34)
    {
      int v7 = v2[4];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v8 = *((_DWORD *)v1 + 2);
        *(_DWORD *)long long buf = 67109376;
        int v12 = v8;
        __int16 v13 = 1024;
        int v14 = v6;
        _os_log_impl(&dword_1D3E18000, v7, OS_LOG_TYPE_INFO, "core:#I Timer(tid=0x%x) notification to clients of cid 0x%x", buf, 0xEu);
        int v5 = *v3;
      }
      sub_1D3E379B0((uint64_t)v5, *((_DWORD *)v1 + 2));
    }
  }
  MEMORY[0x1D94412F0](v1, 0x1020C403A5D3213);
  return sub_1D3E24D00((uint64_t *)&v10);
}

void sub_1D3E3B1C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  MEMORY[0x1D94412F0](v4, 0x1020C403A5D3213);
  sub_1D3E24D00((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1D3E3B1F4(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F2B9B890;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1D3E3B214(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F2B9B890;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1D94412F0);
}

void sub_1D3E3B270(void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (uint64_t *)**a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t *)v1[1];
    int v5 = **a1;
    if (v4 != v2)
    {
      do
        sub_1D3E3A81C(--v4, 0);
      while (v4 != v2);
      int v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_1D3E3B2F8(uint64_t a1)
{
  uint64_t v1 = a1;
  awd::AWDServerFacade::tryInitialize(*(awd::AWDServerFacade **)(**(void **)a1 + 88));
}

void sub_1D3E3B384(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  MEMORY[0x1D94412F0](v2, 0x20C4093837F09);
  sub_1D3E24D00((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t *sub_1D3E3B3B4(uint64_t *a1)
{
  uint64_t v1 = *a1;
  int v6 = a1;
  uint64_t v7 = v1;
  uint64_t v2 = *(void *)v1;
  int ComponentForMetricId = awd::getComponentForMetricId((awd *)**(unsigned int **)(v1 + 8));
  uint64_t v4 = sub_1D3E37E2C(v2, ComponentForMetricId);
  sub_1D3E36FEC((uint64_t)v4, (unsigned int **)(v1 + 8));
  sub_1D3E3B430(&v7);
  return sub_1D3E24D00((uint64_t *)&v6);
}

void sub_1D3E3B414(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

uint64_t *sub_1D3E3B430(uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    uint64_t v3 = *(void *)(v2 + 8);
    *(void *)(v2 + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
    if (v3) {
      sub_1D3E21120(v2 + 8, v3);
    }
    MEMORY[0x1D94412F0](v2, 0x20C40A4A59CD2);
  }
  return a1;
}

uint64_t *sub_1D3E3B48C(uint64_t **a1)
{
  int v6 = a1;
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  int ComponentForMetricId = awd::getComponentForMetricId((awd *)*((unsigned int *)*a1 + 2));
  uint64_t v4 = sub_1D3E37E2C(v2, ComponentForMetricId);
  sub_1D3E36D18(v4, *((_DWORD *)v1 + 2));
  MEMORY[0x1D94412F0](v1, 0x1020C403A5D3213);
  return sub_1D3E24D00((uint64_t *)&v6);
}

void sub_1D3E3B4F8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  MEMORY[0x1D94412F0](v2, 0x1020C403A5D3213);
  sub_1D3E24D00((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t *sub_1D3E3B524(uint64_t **a1)
{
  int v6 = a1;
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  int ComponentForMetricId = awd::getComponentForMetricId((awd *)*((unsigned int *)*a1 + 2));
  uint64_t v4 = sub_1D3E37E2C(v2, ComponentForMetricId);
  sub_1D3E36D94(v4, *((_DWORD *)v1 + 2));
  MEMORY[0x1D94412F0](v1, 0x1020C4034E03FFCLL);
  return sub_1D3E24D00((uint64_t *)&v6);
}

void sub_1D3E3B594(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  MEMORY[0x1D94412F0](v2, 0x1020C4034E03FFCLL);
  sub_1D3E24D00((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t *sub_1D3E3B5C0(uint64_t **a1)
{
  int v6 = a1;
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  int ComponentForMetricId = awd::getComponentForMetricId((awd *)*((unsigned int *)*a1 + 2));
  uint64_t v4 = sub_1D3E37E2C(v2, ComponentForMetricId);
  sub_1D3E36E10(v4, *((_DWORD *)v1 + 2));
  MEMORY[0x1D94412F0](v1, 0x1020C40A122CEF7);
  return sub_1D3E24D00((uint64_t *)&v6);
}

void sub_1D3E3B630(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  MEMORY[0x1D94412F0](v2, 0x1020C40A122CEF7);
  sub_1D3E24D00((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t *sub_1D3E3B65C(uint64_t **a1)
{
  int v6 = a1;
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  int ComponentForMetricId = awd::getComponentForMetricId((awd *)*((unsigned int *)*a1 + 2));
  uint64_t v4 = sub_1D3E37E2C(v2, ComponentForMetricId);
  sub_1D3E36E8C(v4, *((_DWORD *)v1 + 2));
  MEMORY[0x1D94412F0](v1, 0x1020C40A122CEF7);
  return sub_1D3E24D00((uint64_t *)&v6);
}

void sub_1D3E3B6CC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  MEMORY[0x1D94412F0](v2, 0x1020C40A122CEF7);
  sub_1D3E24D00((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t *sub_1D3E3B6F8(uint64_t *a1)
{
  uint64_t v1 = *a1;
  int v6 = a1;
  uint64_t v7 = v1;
  uint64_t v2 = *(void *)v1;
  int ComponentForMetricId = awd::getComponentForMetricId((awd *)*(unsigned int *)(v1 + 8));
  uint64_t v4 = sub_1D3E37E2C(v2, ComponentForMetricId);
  sub_1D3E36F08(v4, *(_DWORD *)(v1 + 8), v1 + 16);
  sub_1D3E3B774(&v7);
  return sub_1D3E24D00((uint64_t *)&v6);
}

void sub_1D3E3B758(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

uint64_t *sub_1D3E3B774(uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    if (*(char *)(v2 + 39) < 0) {
      operator delete(*(void **)(v2 + 16));
    }
    MEMORY[0x1D94412F0](v2, 0x1032C40FADB2794);
  }
  return a1;
}

void sub_1D3E3B7CC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

uint64_t awd::profile::protobuf_ShutdownFile_AwdProfile_2eproto(awd::profile *this)
{
  if (awd::profile::ProcessingRule::default_instance_) {
    (*(void (**)(uint64_t))(*(void *)awd::profile::ProcessingRule::default_instance_ + 8))(awd::profile::ProcessingRule::default_instance_);
  }
  if (awd::profile::BedfTreeNode::default_instance_) {
    (*(void (**)(uint64_t))(*(void *)awd::profile::BedfTreeNode::default_instance_ + 8))(awd::profile::BedfTreeNode::default_instance_);
  }
  if (awd::profile::BedfConfig::default_instance_) {
    (*(void (**)(uint64_t))(*(void *)awd::profile::BedfConfig::default_instance_ + 8))(awd::profile::BedfConfig::default_instance_);
  }
  if (awd::profile::Metric::default_instance_) {
    (*(void (**)(uint64_t))(*(void *)awd::profile::Metric::default_instance_ + 8))(awd::profile::Metric::default_instance_);
  }
  if (awd::profile::Profile::default_instance_) {
    (*(void (**)(uint64_t))(*(void *)awd::profile::Profile::default_instance_ + 8))(awd::profile::Profile::default_instance_);
  }
  if (awd::profile::LogParameter::default_instance_) {
    (*(void (**)(uint64_t))(*(void *)awd::profile::LogParameter::default_instance_ + 8))(awd::profile::LogParameter::default_instance_);
  }
  if (awd::profile::Log::default_instance_) {
    (*(void (**)(uint64_t))(*(void *)awd::profile::Log::default_instance_ + 8))(awd::profile::Log::default_instance_);
  }
  if (awd::profile::ConfigurationParameter::default_instance_) {
    (*(void (**)(uint64_t))(*(void *)awd::profile::ConfigurationParameter::default_instance_ + 8))(awd::profile::ConfigurationParameter::default_instance_);
  }
  if (awd::profile::ComponentConfiguration::default_instance_) {
    (*(void (**)(uint64_t))(*(void *)awd::profile::ComponentConfiguration::default_instance_ + 8))(awd::profile::ComponentConfiguration::default_instance_);
  }
  if (awd::profile::TimerSpec::default_instance_) {
    (*(void (**)(uint64_t))(*(void *)awd::profile::TimerSpec::default_instance_ + 8))(awd::profile::TimerSpec::default_instance_);
  }
  if (awd::profile::TypeVariant::default_instance_) {
    (*(void (**)(uint64_t))(*(void *)awd::profile::TypeVariant::default_instance_ + 8))(awd::profile::TypeVariant::default_instance_);
  }
  if (awd::profile::Condition::default_instance_) {
    (*(void (**)(uint64_t))(*(void *)awd::profile::Condition::default_instance_ + 8))(awd::profile::Condition::default_instance_);
  }
  if (awd::profile::ConditionClause::default_instance_) {
    (*(void (**)(uint64_t))(*(void *)awd::profile::ConditionClause::default_instance_ + 8))(awd::profile::ConditionClause::default_instance_);
  }
  if (awd::profile::TriggerSource::default_instance_) {
    (*(void (**)(uint64_t))(*(void *)awd::profile::TriggerSource::default_instance_ + 8))(awd::profile::TriggerSource::default_instance_);
  }
  if (awd::profile::TriggerProcessingRule::default_instance_) {
    (*(void (**)(uint64_t))(*(void *)awd::profile::TriggerProcessingRule::default_instance_ + 8))(awd::profile::TriggerProcessingRule::default_instance_);
  }
  if (awd::profile::AggregationSpec::default_instance_) {
    (*(void (**)(uint64_t))(*(void *)awd::profile::AggregationSpec::default_instance_ + 8))(awd::profile::AggregationSpec::default_instance_);
  }
  if (awd::profile::MetricFileSpec::default_instance_) {
    (*(void (**)(uint64_t))(*(void *)awd::profile::MetricFileSpec::default_instance_ + 8))(awd::profile::MetricFileSpec::default_instance_);
  }
  if (awd::profile::TaskingCriteria::default_instance_) {
    (*(void (**)(uint64_t))(*(void *)awd::profile::TaskingCriteria::default_instance_ + 8))(awd::profile::TaskingCriteria::default_instance_);
  }
  uint64_t result = awd::profile::DeviceConfiguration::default_instance_;
  if (awd::profile::DeviceConfiguration::default_instance_)
  {
    uint64_t v2 = *(uint64_t (**)(void))(*(void *)awd::profile::DeviceConfiguration::default_instance_ + 8);
    return v2();
  }
  return result;
}

double awd::profile::ProcessingRule::ProcessingRule(awd::profile::ProcessingRule *this)
{
  *(void *)this = &unk_1F2B9B1D0;
  *((void *)this + 6) = 0;
  *((_DWORD *)this + 11) = 0;
  double result = 0.0;
  *(_OWORD *)((char *)this + MEMORY[0x1D9440F90]((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((unsigned char *)this + 40) = 0;
  return result;
}

{
  double result;

  *(void *)this = &unk_1F2B9B1D0;
  *((void *)this + 6) = 0;
  *((_DWORD *)this + 11) = 0;
  double result = 0.0;
  *(_OWORD *)((char *)this + MEMORY[0x1D9440F90]((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((unsigned char *)this + 40) = 0;
  return result;
}

double awd::profile::BedfTreeNode::BedfTreeNode(awd::profile::BedfTreeNode *this)
{
  *(void *)this = &unk_1F2B9AFF0;
  *((void *)this + 6) = 0;
  *((void *)this + 7) = 0;
  *(void *)&double result = 0x100000000;
  *((void *)this + 1) = 0x100000000;
  *((void *)this + 4) = 0;
  *((void *)this + 5) = 0;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  return result;
}

{
  double result;

  *(void *)this = &unk_1F2B9AFF0;
  *((void *)this + 6) = 0;
  *((void *)this + 7) = 0;
  *(void *)&double result = 0x100000000;
  *((void *)this + 1) = 0x100000000;
  *((void *)this + 4) = 0;
  *((void *)this + 5) = 0;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  return result;
}

double awd::profile::BedfConfig::BedfConfig(awd::profile::BedfConfig *this)
{
  *(void *)this = &unk_1F2B9AF00;
  double result = 0.0;
  *(_OWORD *)((char *)this + MEMORY[0x1D9440F90]((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((void *)this + 5) = 0;
  return result;
}

{
  double result;

  *(void *)this = &unk_1F2B9AF00;
  double result = 0.0;
  *(_OWORD *)((char *)this + MEMORY[0x1D9440F90]((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((void *)this + 5) = 0;
  return result;
}

double awd::profile::Metric::Metric(awd::profile::Metric *this)
{
  *(void *)this = &unk_1F2B9B608;
  *((void *)this + 9) = 0;
  *((void *)this + 10) = 0;
  *((_DWORD *)this + 22) = 0;
  *((void *)this + 12) = 0;
  *((void *)this + 13) = 0;
  *((_DWORD *)this + 2MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  *((void *)this + 15) = 0;
  *((_DWORD *)this + 32) = 0;
  double result = 0.0;
  *(_OWORD *)((char *)this + MEMORY[0x1D9440F90]((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((unsigned char *)this + 40) = 0;
  *(void *)((char *)this + 44) = 0;
  *(void *)((char *)this + 60) = 0;
  *(void *)((char *)this + 52) = 0;
  return result;
}

{
  double result;

  *(void *)this = &unk_1F2B9B608;
  *((void *)this + 9) = 0;
  *((void *)this + 10) = 0;
  *((_DWORD *)this + 22) = 0;
  *((void *)this + 12) = 0;
  *((void *)this + 13) = 0;
  *((_DWORD *)this + 2MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  *((void *)this + 15) = 0;
  *((_DWORD *)this + 32) = 0;
  double result = 0.0;
  *(_OWORD *)((char *)this + MEMORY[0x1D9440F90]((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((unsigned char *)this + 40) = 0;
  *(void *)((char *)this + 44) = 0;
  *(void *)((char *)this + 60) = 0;
  *(void *)((char *)this + 52) = 0;
  return result;
}

double awd::profile::Profile::Profile(awd::profile::Profile *this)
{
  *(void *)this = &unk_1F2B9B680;
  *((_DWORD *)this + 2MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  *((unsigned char *)this + 116) = 0;
  double result = 0.0;
  *(_OWORD *)((char *)this + MEMORY[0x1D9440F90]((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *((_DWORD *)this + 14) = 0;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *(_OWORD *)((char *)this + 92) = 0u;
  *((void *)this + 15) = MEMORY[0x1E4FBA920];
  *((void *)this + 16) = 0;
  return result;
}

{
  double result;

  *(void *)this = &unk_1F2B9B680;
  *((_DWORD *)this + 2MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  *((unsigned char *)this + 116) = 0;
  double result = 0.0;
  *(_OWORD *)((char *)this + MEMORY[0x1D9440F90]((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *((_DWORD *)this + 14) = 0;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *(_OWORD *)((char *)this + 92) = 0u;
  *((void *)this + 15) = MEMORY[0x1E4FBA920];
  *((void *)this + 16) = 0;
  return result;
}

void *awd::profile::LogParameter::LogParameter(void *this)
{
  uint64_t v1 = MEMORY[0x1E4FBA920];
  *this = &unk_1F2B9B068;
  this[1] = v1;
  this[2] = v1;
  this[3] = 0;
  return this;
}

{
  uint64_t v1;

  uint64_t v1 = MEMORY[0x1E4FBA920];
  *this = &unk_1F2B9B068;
  this[1] = v1;
  this[2] = v1;
  this[3] = 0;
  return this;
}

uint64_t awd::profile::Log::Log(uint64_t this)
{
  *(void *)(this + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  *(void *)(this + 16) = 0;
  *(void *)this = &unk_1F2B9B590;
  *(_DWORD *)(this + 24) = 0;
  *(void *)(this + 32) = 0;
  return this;
}

{
  *(void *)(this + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  *(void *)(this + 16) = 0;
  *(void *)this = &unk_1F2B9B590;
  *(_DWORD *)(this + 24) = 0;
  *(void *)(this + 32) = 0;
  return this;
}

void *awd::profile::ConfigurationParameter::ConfigurationParameter(void *this)
{
  uint64_t v1 = MEMORY[0x1E4FBA920];
  *this = &unk_1F2B9B518;
  this[1] = v1;
  this[2] = 0;
  this[3] = 0;
  return this;
}

{
  uint64_t v1;

  uint64_t v1 = MEMORY[0x1E4FBA920];
  *this = &unk_1F2B9B518;
  this[1] = v1;
  this[2] = 0;
  this[3] = 0;
  return this;
}

uint64_t awd::profile::ComponentConfiguration::ComponentConfiguration(uint64_t this)
{
  *(void *)(this + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  *(void *)(this + 16) = 0;
  *(void *)this = &unk_1F2B9B4A0;
  *(_DWORD *)(this + 24) = 0;
  *(void *)(this + 32) = 0;
  *(void *)(this + 40) = 0;
  *(_DWORD *)(this + 4MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  *(void *)(this + 8MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  *(void *)(this + 64) = 0;
  *(void *)(this + 72) = 0;
  *(void *)(this + 56) = 0;
  *(_DWORD *)(this + 80) = 0;
  return this;
}

{
  *(void *)(this + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  *(void *)(this + 16) = 0;
  *(void *)this = &unk_1F2B9B4A0;
  *(_DWORD *)(this + 24) = 0;
  *(void *)(this + 32) = 0;
  *(void *)(this + 40) = 0;
  *(_DWORD *)(this + 4MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  *(void *)(this + 8MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  *(void *)(this + 64) = 0;
  *(void *)(this + 72) = 0;
  *(void *)(this + 56) = 0;
  *(_DWORD *)(this + 80) = 0;
  return this;
}

uint64_t awd::profile::TimerSpec::TimerSpec(uint64_t this)
{
  *(void *)(this + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  *(void *)(this + 16) = 0;
  *(void *)this = &unk_1F2B9B770;
  *(_DWORD *)(this + 24) = 0;
  return this;
}

{
  *(void *)(this + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  *(void *)(this + 16) = 0;
  *(void *)this = &unk_1F2B9B770;
  *(_DWORD *)(this + 24) = 0;
  return this;
}

double awd::profile::TypeVariant::TypeVariant(awd::profile::TypeVariant *this)
{
  *(void *)this = &unk_1F2B9AF78;
  double result = 0.0;
  *(_OWORD *)((char *)this + MEMORY[0x1D9440F90]((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((_DWORD *)this + 10) = 0;
  uint64_t v2 = MEMORY[0x1E4FBA920];
  *((unsigned char *)this + 44) = 0;
  *((void *)this + 6) = v2;
  *((void *)this + 7) = v2;
  *((void *)this + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  *((_DWORD *)this + 1MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  return result;
}

{
  double result;
  uint64_t v2;

  *(void *)this = &unk_1F2B9AF78;
  double result = 0.0;
  *(_OWORD *)((char *)this + MEMORY[0x1D9440F90]((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((_DWORD *)this + 10) = 0;
  uint64_t v2 = MEMORY[0x1E4FBA920];
  *((unsigned char *)this + 44) = 0;
  *((void *)this + 6) = v2;
  *((void *)this + 7) = v2;
  *((void *)this + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  *((_DWORD *)this + 1MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  return result;
}

uint64_t awd::profile::Condition::Condition(uint64_t this)
{
  *(void *)(this + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  *(void *)(this + 16) = 0;
  *(void *)this = &unk_1F2B9B6F8;
  *(void *)(this + 21) = 0;
  *(void *)(this + 32) = 0;
  *(void *)(this + 40) = 0;
  uint64_t v1 = MEMORY[0x1E4FBA920];
  *(void *)(this + 4MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  *(void *)(this + 56) = v1;
  *(unsigned char *)(this + 29) = 0;
  *(void *)(this + 64) = 0;
  return this;
}

{
  uint64_t v1;

  *(void *)(this + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  *(void *)(this + 16) = 0;
  *(void *)this = &unk_1F2B9B6F8;
  *(void *)(this + 21) = 0;
  *(void *)(this + 32) = 0;
  *(void *)(this + 40) = 0;
  uint64_t v1 = MEMORY[0x1E4FBA920];
  *(void *)(this + 4MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  *(void *)(this + 56) = v1;
  *(unsigned char *)(this + 29) = 0;
  *(void *)(this + 64) = 0;
  return this;
}

uint64_t awd::profile::ConditionClause::ConditionClause(uint64_t this)
{
  *(void *)(this + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  *(void *)(this + 16) = 0;
  *(void *)this = &unk_1F2B9B2C0;
  *(_DWORD *)(this + 24) = 0;
  *(void *)(this + 32) = 0;
  return this;
}

{
  *(void *)(this + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  *(void *)(this + 16) = 0;
  *(void *)this = &unk_1F2B9B2C0;
  *(_DWORD *)(this + 24) = 0;
  *(void *)(this + 32) = 0;
  return this;
}

double awd::profile::TriggerSource::TriggerSource(awd::profile::TriggerSource *this)
{
  *(void *)this = &unk_1F2B9B0E0;
  double result = 0.0;
  *(_OWORD *)((char *)this + MEMORY[0x1D9440F90]((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((_DWORD *)this + 10) = 0;
  *((void *)this + 6) = MEMORY[0x1E4FBA920];
  *((void *)this + 7) = 0;
  return result;
}

{
  double result;

  *(void *)this = &unk_1F2B9B0E0;
  double result = 0.0;
  *(_OWORD *)((char *)this + MEMORY[0x1D9440F90]((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((_DWORD *)this + 10) = 0;
  *((void *)this + 6) = MEMORY[0x1E4FBA920];
  *((void *)this + 7) = 0;
  return result;
}

double awd::profile::TriggerProcessingRule::TriggerProcessingRule(awd::profile::TriggerProcessingRule *this)
{
  *(void *)this = &unk_1F2B9B428;
  *((void *)this + 6) = 0;
  *((void *)this + 7) = 0;
  *((_DWORD *)this + 16) = 0;
  *((void *)this + 9) = 0;
  *((_DWORD *)this + 20) = 0;
  double result = 0.0;
  *(_OWORD *)((char *)this + MEMORY[0x1D9440F90]((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((_DWORD *)this + 10) = 0;
  return result;
}

{
  double result;

  *(void *)this = &unk_1F2B9B428;
  *((void *)this + 6) = 0;
  *((void *)this + 7) = 0;
  *((_DWORD *)this + 16) = 0;
  *((void *)this + 9) = 0;
  *((_DWORD *)this + 20) = 0;
  double result = 0.0;
  *(_OWORD *)((char *)this + MEMORY[0x1D9440F90]((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((_DWORD *)this + 10) = 0;
  return result;
}

uint64_t awd::profile::AggregationSpec::AggregationSpec(uint64_t this)
{
  *(void *)(this + MEMORY[0x1D9440F90]((char *)this + 8) = MEMORY[0x1E4FBA920];
  *(void *)(this + 16) = 0;
  *(void *)this = &unk_1F2B9B248;
  *(_DWORD *)(this + 24) = 0;
  return this;
}

{
  *(void *)(this + MEMORY[0x1D9440F90]((char *)this + 8) = MEMORY[0x1E4FBA920];
  *(void *)(this + 16) = 0;
  *(void *)this = &unk_1F2B9B248;
  *(_DWORD *)(this + 24) = 0;
  return this;
}

double awd::profile::MetricFileSpec::MetricFileSpec(awd::profile::MetricFileSpec *this)
{
  *(void *)this = &unk_1F2B9B158;
  *(void *)&double result = 0x100000000;
  *((void *)this + 1) = 0x100000000;
  *((_DWORD *)this + 4) = 0;
  *((unsigned char *)this + 20) = 0;
  *((void *)this + 3) = 0;
  *((void *)this + 4) = 0;
  return result;
}

{
  double result;

  *(void *)this = &unk_1F2B9B158;
  *(void *)&double result = 0x100000000;
  *((void *)this + 1) = 0x100000000;
  *((_DWORD *)this + 4) = 0;
  *((unsigned char *)this + 20) = 0;
  *((void *)this + 3) = 0;
  *((void *)this + 4) = 0;
  return result;
}

void *awd::profile::TaskingCriteria::TaskingCriteria(void *this)
{
  *this = &unk_1F2B9B338;
  this[1] = 0;
  this[2] = 0;
  this[3] = 0;
  return this;
}

{
  *this = &unk_1F2B9B338;
  this[1] = 0;
  this[2] = 0;
  this[3] = 0;
  return this;
}

uint64_t awd::profile::DeviceConfiguration::DeviceConfiguration(uint64_t this)
{
  *(void *)(this + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  *(void *)(this + 16) = 0;
  *(void *)this = &unk_1F2B9B3B0;
  *(_DWORD *)(this + 24) = 0;
  *(void *)(this + 40) = 0;
  *(void *)(this + 4MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  *(_DWORD *)(this + 56) = 0;
  *(void *)(this + 80) = 0;
  *(_DWORD *)(this + 8MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  *(void *)(this + 96) = 0;
  *(void *)(this + 104) = 0;
  *(_DWORD *)(this + 112) = 0;
  *(void *)(this + 120) = 0;
  *(void *)(this + 12MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  *(_DWORD *)(this + 136) = 0;
  *(_DWORD *)(this + 16MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  *(void *)(this + 160) = 0;
  *(void *)(this + 176) = 0;
  *(void *)(this + 184) = 0;
  *(_DWORD *)(this + 192) = 0;
  *(_DWORD *)(this + 32) = 0;
  *(unsigned char *)(this + 36) = 0;
  *(void *)(this + 200) = 0;
  *(void *)(this + 64) = MEMORY[0x1E4FBA920];
  *(void *)(this + 72) = 0;
  *(void *)(this + 144) = 0;
  *(void *)(this + 152) = 0;
  *(_DWORD *)(this + 20MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  return this;
}

{
  *(void *)(this + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  *(void *)(this + 16) = 0;
  *(void *)this = &unk_1F2B9B3B0;
  *(_DWORD *)(this + 24) = 0;
  *(void *)(this + 40) = 0;
  *(void *)(this + 4MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  *(_DWORD *)(this + 56) = 0;
  *(void *)(this + 80) = 0;
  *(_DWORD *)(this + 8MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  *(void *)(this + 96) = 0;
  *(void *)(this + 104) = 0;
  *(_DWORD *)(this + 112) = 0;
  *(void *)(this + 120) = 0;
  *(void *)(this + 12MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  *(_DWORD *)(this + 136) = 0;
  *(_DWORD *)(this + 16MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  *(void *)(this + 160) = 0;
  *(void *)(this + 176) = 0;
  *(void *)(this + 184) = 0;
  *(_DWORD *)(this + 192) = 0;
  *(_DWORD *)(this + 32) = 0;
  *(unsigned char *)(this + 36) = 0;
  *(void *)(this + 200) = 0;
  *(void *)(this + 64) = MEMORY[0x1E4FBA920];
  *(void *)(this + 72) = 0;
  *(void *)(this + 144) = 0;
  *(void *)(this + 152) = 0;
  *(_DWORD *)(this + 20MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  return this;
}

void awd::profile::ProcessingRule::InitAsDefaultInstance(awd::profile::ProcessingRule *this, uint64_t a2, uint64_t a3, const char *a4)
{
  uint64_t v5 = awd::profile::ProcessingRule::default_instance_;
  if (!awd::profile::ProcessingRule::default_instance_)
  {
    awd::profile::protobuf_AddDesc_AwdProfile_2eproto(this, a2, a3, a4);
    uint64_t v5 = awd::profile::ProcessingRule::default_instance_;
  }
  *((void *)this + 4) = v5;
}

void awd::profile::BedfTreeNode::InitAsDefaultInstance(awd::profile::BedfTreeNode *this, uint64_t a2, uint64_t a3, const char *a4)
{
  uint64_t v5 = awd::profile::BedfTreeNode::default_instance_;
  if (awd::profile::BedfTreeNode::default_instance_)
  {
    *((void *)this + 2) = awd::profile::BedfTreeNode::default_instance_;
  }
  else
  {
    awd::profile::protobuf_AddDesc_AwdProfile_2eproto(this, a2, a3, a4);
    uint64_t v5 = awd::profile::BedfTreeNode::default_instance_;
    *((void *)this + 2) = awd::profile::BedfTreeNode::default_instance_;
    if (!v5)
    {
      awd::profile::protobuf_AddDesc_AwdProfile_2eproto(v6, v7, v8, v9);
      uint64_t v5 = awd::profile::BedfTreeNode::default_instance_;
    }
  }
  *((void *)this + 3) = v5;
}

void awd::profile::BedfConfig::InitAsDefaultInstance(awd::profile::BedfConfig *this, uint64_t a2, uint64_t a3, const char *a4)
{
  uint64_t v5 = awd::profile::BedfTreeNode::default_instance_;
  if (!awd::profile::BedfTreeNode::default_instance_)
  {
    awd::profile::protobuf_AddDesc_AwdProfile_2eproto(this, a2, a3, a4);
    uint64_t v5 = awd::profile::BedfTreeNode::default_instance_;
  }
  *((void *)this + 2) = v5;
}

void awd::profile::Profile::InitAsDefaultInstance(awd::profile::Profile *this, uint64_t a2, uint64_t a3, const char *a4)
{
  uint64_t v5 = awd::profile::Log::default_instance_;
  if (!awd::profile::Log::default_instance_)
  {
    awd::profile::protobuf_AddDesc_AwdProfile_2eproto(this, a2, a3, a4);
    uint64_t v5 = awd::profile::Log::default_instance_;
  }
  *((void *)this + 9) = v5;
}

void awd::profile::ConfigurationParameter::InitAsDefaultInstance(awd::profile::ConfigurationParameter *this, uint64_t a2, uint64_t a3, const char *a4)
{
  uint64_t v5 = awd::profile::TypeVariant::default_instance_;
  if (!awd::profile::TypeVariant::default_instance_)
  {
    awd::profile::protobuf_AddDesc_AwdProfile_2eproto(this, a2, a3, a4);
    uint64_t v5 = awd::profile::TypeVariant::default_instance_;
  }
  *((void *)this + 2) = v5;
}

void awd::profile::DeviceConfiguration::InitAsDefaultInstance(awd::profile::DeviceConfiguration *this, uint64_t a2, uint64_t a3, const char *a4)
{
  uint64_t v5 = awd::profile::TaskingCriteria::default_instance_;
  if (!awd::profile::TaskingCriteria::default_instance_)
  {
    awd::profile::protobuf_AddDesc_AwdProfile_2eproto(this, a2, a3, a4);
    uint64_t v5 = awd::profile::TaskingCriteria::default_instance_;
  }
  *((void *)this + 1MEMORY[0x1D9440F90]((char *)this + 8) = v5;
}

BOOL awd::profile::RandomSource_IsValid(awd::profile *this)
{
  return this == 0;
}

BOOL awd::profile::MetricFileType_IsValid(awd::profile *this)
{
  return (this - 1) < 3;
}

BOOL awd::profile::AppleCareCategory_IsValid(awd::profile *this)
{
  return (this - 1) < 2;
}

double awd::profile::ProcessingRule::SharedCtor(awd::profile::ProcessingRule *this)
{
  *((void *)this + 6) = 0;
  *((_DWORD *)this + 11) = 0;
  double result = 0.0;
  *(_OWORD *)((char *)this + MEMORY[0x1D9440F90]((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((unsigned char *)this + 40) = 0;
  return result;
}

uint64_t awd::profile::ProcessingRule::default_instance(awd::profile::ProcessingRule *this, uint64_t a2, uint64_t a3, const char *a4)
{
  uint64_t result = awd::profile::ProcessingRule::default_instance_;
  if (!awd::profile::ProcessingRule::default_instance_)
  {
    awd::profile::protobuf_AddDesc_AwdProfile_2eproto(0, a2, a3, a4);
    return awd::profile::ProcessingRule::default_instance_;
  }
  return result;
}

awd::profile::ProcessingRule *awd::profile::ProcessingRule::ProcessingRule(awd::profile::ProcessingRule *this, const awd::profile::ProcessingRule *a2)
{
  *(void *)this = &unk_1F2B9B1D0;
  *((void *)this + 6) = 0;
  *((_DWORD *)this + 11) = 0;
  *(_OWORD *)((char *)this + MEMORY[0x1D9440F90]((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((unsigned char *)this + 40) = 0;
  awd::profile::ProcessingRule::MergeFrom(this, a2);
  return this;
}

void sub_1D3E3C2A8(_Unwind_Exception *a1)
{
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(v1);
  _Unwind_Resume(a1);
}

void awd::profile::ProcessingRule::MergeFrom(awd::profile::ProcessingRule *this, const awd::profile::ProcessingRule *a2)
{
  if (a2 == this)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v13);
  }
  LOBYTE(v4) = *((unsigned char *)a2 + 52);
  if (!(_BYTE)v4) {
    return;
  }
  if (*((unsigned char *)a2 + 52))
  {
    int v6 = *((_DWORD *)a2 + 4);
    *((_DWORD *)this + 13) |= 1u;
    *((_DWORD *)this + 4) = v6;
    int v4 = *((_DWORD *)a2 + 13);
    if ((v4 & 2) == 0)
    {
LABEL_6:
      if ((v4 & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)a2 + 52) & 2) == 0)
  {
    goto LABEL_6;
  }
  uint64_t v7 = *((void *)a2 + 1);
  *((_DWORD *)this + 13) |= 2u;
  *((void *)this + 1) = v7;
  int v4 = *((_DWORD *)a2 + 13);
  if ((v4 & 4) == 0)
  {
LABEL_7:
    if ((v4 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v8 = *((void *)a2 + 3);
  *((_DWORD *)this + 13) |= 4u;
  *((void *)this + 3) = v8;
  int v4 = *((_DWORD *)a2 + 13);
  if ((v4 & 8) == 0)
  {
LABEL_8:
    if ((v4 & 0x10) == 0) {
      goto LABEL_9;
    }
LABEL_17:
    char v10 = *((unsigned char *)a2 + 40);
    *((_DWORD *)this + 13) |= 0x10u;
    *((unsigned char *)this + 40) = v10;
    int v4 = *((_DWORD *)a2 + 13);
    if ((v4 & 0x20) == 0)
    {
LABEL_10:
      if ((v4 & 0x40) == 0) {
        return;
      }
      goto LABEL_11;
    }
    goto LABEL_18;
  }
LABEL_16:
  int v9 = *((_DWORD *)a2 + 5);
  *((_DWORD *)this + 13) |= 8u;
  *((_DWORD *)this + 5) = v9;
  int v4 = *((_DWORD *)a2 + 13);
  if ((v4 & 0x10) != 0) {
    goto LABEL_17;
  }
LABEL_9:
  if ((v4 & 0x20) == 0) {
    goto LABEL_10;
  }
LABEL_18:
  *((_DWORD *)this + 13) |= 0x20u;
  int v11 = (awd::profile::ProcessingRule *)*((void *)this + 4);
  if (!v11) {
    operator new();
  }
  int v12 = (const awd::profile::ProcessingRule *)*((void *)a2 + 4);
  if (!v12) {
    int v12 = *(const awd::profile::ProcessingRule **)(awd::profile::ProcessingRule::default_instance_ + 32);
  }
  awd::profile::ProcessingRule::MergeFrom(v11, v12);
  if ((*((_DWORD *)a2 + 13) & 0x40) != 0)
  {
LABEL_11:
    int v5 = *((_DWORD *)a2 + 11);
    *((_DWORD *)this + 13) |= 0x40u;
    *((_DWORD *)this + 11) = v5;
  }
}

void sub_1D3E3C478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)va);
  _Unwind_Resume(a1);
}

void awd::profile::ProcessingRule::~ProcessingRule(awd::profile::ProcessingRule *this)
{
  *(void *)this = &unk_1F2B9B1D0;
  if ((awd::profile::ProcessingRule *)awd::profile::ProcessingRule::default_instance_ != this)
  {
    uint64_t v2 = *((void *)this + 4);
    if (v2) {
      (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
    }
  }
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(this);
}

{
  uint64_t vars8;

  awd::profile::ProcessingRule::~ProcessingRule(this);
  JUMPOUT(0x1D94412F0);
}

void *awd::profile::ProcessingRule::SharedDtor(void *this)
{
  if ((void *)awd::profile::ProcessingRule::default_instance_ != this)
  {
    this = (void *)this[4];
    if (this) {
      return (void *)(*(uint64_t (**)(void))(*this + 8))();
    }
  }
  return this;
}

uint64_t awd::profile::ProcessingRule::SetCachedSize(uint64_t this, int a2)
{
  *(_DWORD *)(this + 4MEMORY[0x1D9440F90]((char *)this + 8) = a2;
  return this;
}

void awd::profile::ProcessingRule::New(awd::profile::ProcessingRule *this)
{
}

uint64_t awd::profile::ProcessingRule::Clear(uint64_t this)
{
  uint64_t v1 = this;
  char v2 = *(unsigned char *)(this + 52);
  if (v2)
  {
    *(unsigned char *)(this + 40) = 0;
    *(void *)(this + 16) = 0;
    *(void *)(this + 24) = 0;
    *(void *)(this + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
    if ((v2 & 0x20) != 0)
    {
      this = *(void *)(this + 32);
      if (this) {
        this = awd::profile::ProcessingRule::Clear((awd::profile::ProcessingRule *)this);
      }
    }
    *(_DWORD *)(v1 + 44) = 0;
  }
  *(_DWORD *)(v1 + 52) = 0;
  return this;
}

uint64_t awd::profile::ProcessingRule::MergePartialFromCodedStream(awd::profile::ProcessingRule *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2)
{
  int v4 = (unsigned int *)((char *)this + 16);
  int v5 = (unint64_t *)((char *)this + 8);
  int v6 = (unsigned int *)((char *)this + 20);
  uint64_t v7 = (unsigned int *)((char *)this + 44);
  while (2)
  {
    uint64_t v8 = (char *)*((void *)a2 + 1);
    if ((unint64_t)v8 >= *((void *)a2 + 2) || *v8 < 0)
    {
      unint64_t TagFallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(a2);
      *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = TagFallback;
      if (!TagFallback) {
        return 1;
      }
    }
    else
    {
      unint64_t TagFallback = *v8;
      *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = TagFallback;
      *((void *)a2 + 1) = v8 + 1;
      if (!TagFallback) {
        return 1;
      }
    }
    switch(TagFallback >> 3)
    {
      case 0x10u:
        int v10 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_34;
        }
        int v12 = (unsigned __int8 *)*((void *)a2 + 1);
        unint64_t v11 = *((void *)a2 + 2);
        goto LABEL_10;
      case 0x11u:
        int v10 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_34;
        }
        uint64_t v16 = (unsigned __int8 *)*((void *)a2 + 1);
        unint64_t v11 = *((void *)a2 + 2);
        goto LABEL_76;
      case 0x12u:
        int v10 = TagFallback & 7;
        if (v10 != 2) {
          goto LABEL_34;
        }
        int v17 = *((_DWORD *)this + 13);
        goto LABEL_22;
      case 0x13u:
        int v10 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_34;
        }
        BOOL v21 = (unsigned __int8 *)*((void *)a2 + 1);
        unint64_t v20 = *((void *)a2 + 2);
        goto LABEL_47;
      case 0x14u:
        int v10 = TagFallback & 7;
        if (v10 == 1) {
          goto LABEL_56;
        }
        goto LABEL_34;
      case 0x15u:
        int v10 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_34;
        }
        uint64_t v23 = (char *)*((void *)a2 + 1);
        unint64_t v22 = *((void *)a2 + 2);
        goto LABEL_61;
      default:
        if (TagFallback >> 3 != 1)
        {
          int v10 = TagFallback & 7;
LABEL_34:
          if (v10 == 4) {
            return 1;
          }
          if ((wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipField(a2, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)TagFallback) & 1) == 0)return 0; {
          continue;
          }
        }
        int v10 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_34;
        }
        int v14 = (unsigned __int8 *)*((void *)a2 + 1);
        unint64_t v11 = *((void *)a2 + 2);
        if ((unint64_t)v14 >= v11 || (char)*v14 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v4);
          if (!result) {
            return result;
          }
          uint64_t v15 = (unsigned __int8 *)*((void *)a2 + 1);
          unint64_t v11 = *((void *)a2 + 2);
        }
        else
        {
          unsigned int *v4 = *v14;
          uint64_t v15 = v14 + 1;
          *((void *)a2 + 1) = v15;
        }
        *((_DWORD *)this + 13) |= 1u;
        if ((int)v11 - (int)v15 < 2 || *v15 != 128 || v15[1] != 1) {
          continue;
        }
        int v12 = v15 + 2;
        *((void *)a2 + 1) = v12;
LABEL_10:
        if ((unint64_t)v12 >= v11 || (char)*v12 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(a2, v5);
          if (!result) {
            return result;
          }
          __int16 v13 = (unsigned __int8 *)*((void *)a2 + 1);
          unint64_t v11 = *((void *)a2 + 2);
        }
        else
        {
          *int v5 = *v12;
          __int16 v13 = v12 + 1;
          *((void *)a2 + 1) = v13;
        }
        *((_DWORD *)this + 13) |= 2u;
        if ((int)v11 - (int)v13 < 2 || *v13 != 136 || v13[1] != 1) {
          continue;
        }
        uint64_t v16 = v13 + 2;
        *((void *)a2 + 1) = v16;
LABEL_76:
        v36[0] = 0;
        if ((unint64_t)v16 >= v11 || (char)*v16 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v36);
          if (!result) {
            return result;
          }
          unsigned int v34 = v36[0];
          int v35 = (unsigned __int8 *)*((void *)a2 + 1);
          unint64_t v11 = *((void *)a2 + 2);
        }
        else
        {
          unsigned int v34 = *v16;
          int v35 = v16 + 1;
          *((void *)a2 + 1) = v35;
        }
        *((unsigned char *)this + 40) = v34 != 0;
        int v17 = *((_DWORD *)this + 13) | 0x10;
        *((_DWORD *)this + 13) = v17;
        if ((int)v11 - (int)v35 < 2 || *v35 != 146 || v35[1] != 1) {
          continue;
        }
        *((void *)a2 + 1) = v35 + 2;
LABEL_22:
        *((_DWORD *)this + 13) = v17 | 0x20;
        uint64_t v18 = (awd::profile::ProcessingRule *)*((void *)this + 4);
        if (!v18) {
          operator new();
        }
        v36[0] = 0;
        uint64_t v19 = (char *)*((void *)a2 + 1);
        if ((unint64_t)v19 >= *((void *)a2 + 2) || *v19 < 0)
        {
          if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v36))return 0; {
        }
          }
        else
        {
          v36[0] = *v19;
          *((void *)a2 + 1) = v19 + 1;
        }
        int v24 = *((_DWORD *)a2 + 14);
        int v25 = *((_DWORD *)a2 + 15);
        *((_DWORD *)a2 + 14) = v24 + 1;
        if (v24 < v25)
        {
          wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(a2);
          if (awd::profile::ProcessingRule::MergePartialFromCodedStream(v18, a2))
          {
            if (*((unsigned char *)a2 + 36))
            {
              wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(a2);
              int v26 = *((_DWORD *)a2 + 14);
              BOOL v27 = __OFSUB__(v26, 1);
              int v28 = v26 - 1;
              if (v28 < 0 == v27) {
                *((_DWORD *)a2 + 14) = v28;
              }
              int v29 = (unsigned __int8 *)*((void *)a2 + 1);
              unint64_t v20 = *((void *)a2 + 2);
              if ((int)v20 - (int)v29 > 1 && *v29 == 152 && v29[1] == 1)
              {
                BOOL v21 = v29 + 2;
                *((void *)a2 + 1) = v21;
LABEL_47:
                if ((unint64_t)v21 >= v20 || (char)*v21 < 0)
                {
                  uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v6);
                  if (!result) {
                    return result;
                  }
                  __int16 v30 = (unsigned __int8 *)*((void *)a2 + 1);
                  unint64_t v20 = *((void *)a2 + 2);
                }
                else
                {
                  unsigned int *v6 = *v21;
                  __int16 v30 = v21 + 1;
                  *((void *)a2 + 1) = v30;
                }
                *((_DWORD *)this + 13) |= 8u;
                if ((int)v20 - (int)v30 >= 2 && *v30 == 161 && v30[1] == 1)
                {
                  *((void *)a2 + 1) = v30 + 2;
LABEL_56:
                  *(void *)uint64_t v36 = 0;
                  if ((wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(a2, (unint64_t *)v36) & 1) == 0)return 0; {
                  *((void *)this + 3) = *(void *)v36;
                  }
                  *((_DWORD *)this + 13) |= 4u;
                  __int16 v32 = (unsigned __int8 *)*((void *)a2 + 1);
                  unint64_t v22 = *((void *)a2 + 2);
                  if ((int)v22 - (int)v32 >= 2 && *v32 == 168 && v32[1] == 1)
                  {
                    uint64_t v23 = (char *)(v32 + 2);
                    *((void *)a2 + 1) = v23;
LABEL_61:
                    if ((unint64_t)v23 >= v22 || *v23 < 0)
                    {
                      uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v7);
                      if (!result) {
                        return result;
                      }
                      long long v33 = (unsigned __int8 *)*((void *)a2 + 1);
                      unint64_t v22 = *((void *)a2 + 2);
                    }
                    else
                    {
                      *uint64_t v7 = *v23;
                      long long v33 = (unsigned __int8 *)(v23 + 1);
                      *((void *)a2 + 1) = v33;
                    }
                    *((_DWORD *)this + 13) |= 0x40u;
                    if (v33 == (unsigned __int8 *)v22
                      && (*((_DWORD *)a2 + 11) || *((_DWORD *)a2 + 6) == *((_DWORD *)a2 + 10)))
                    {
                      *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
                      uint64_t result = 1;
                      *((unsigned char *)a2 + 36) = 1;
                      return result;
                    }
                  }
                }
              }
              continue;
            }
          }
        }
        return 0;
    }
  }
}

uint64_t awd::profile::ProcessingRule::SerializeWithCachedSizes(uint64_t this, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  uint64_t v5 = this;
  int v6 = *(_DWORD *)(this + 52);
  if (v6)
  {
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)1, *(unsigned int *)(this + 16), (uint64_t)a2, a4);
    int v6 = *(_DWORD *)(v5 + 52);
    if ((v6 & 2) == 0)
    {
LABEL_3:
      if ((v6 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_3;
  }
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt64((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)0x10, *(void *)(v5 + 8), (uint64_t)a2, a4);
  int v6 = *(_DWORD *)(v5 + 52);
  if ((v6 & 0x10) == 0)
  {
LABEL_4:
    if ((v6 & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBool((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)0x11, *(unsigned __int8 *)(v5 + 40), (uint64_t)a2, a4);
  int v6 = *(_DWORD *)(v5 + 52);
  if ((v6 & 0x20) == 0)
  {
LABEL_5:
    if ((v6 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_12:
  uint64_t v7 = *(void *)(v5 + 32);
  if (!v7) {
    uint64_t v7 = *(void *)(awd::profile::ProcessingRule::default_instance_ + 32);
  }
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)0x12, v7, a2, a4);
  int v6 = *(_DWORD *)(v5 + 52);
  if ((v6 & 8) == 0)
  {
LABEL_6:
    if ((v6 & 4) == 0) {
      goto LABEL_7;
    }
LABEL_16:
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteDouble((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)0x14, (uint64_t)a2, *(double *)(v5 + 24), a3);
    if ((*(_DWORD *)(v5 + 52) & 0x40) == 0) {
      return this;
    }
    goto LABEL_17;
  }
LABEL_15:
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)0x13, *(unsigned int *)(v5 + 20), (uint64_t)a2, a4);
  int v6 = *(_DWORD *)(v5 + 52);
  if ((v6 & 4) != 0) {
    goto LABEL_16;
  }
LABEL_7:
  if ((v6 & 0x40) == 0) {
    return this;
  }
LABEL_17:
  uint64_t v8 = *(unsigned int *)(v5 + 44);
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)0x15, v8, (uint64_t)a2, a4);
}

uint64_t awd::profile::ProcessingRule::ByteSize(awd::profile::ProcessingRule *this)
{
  LOBYTE(v2) = *((unsigned char *)this + 52);
  if (!(_BYTE)v2)
  {
    uint64_t v3 = 0;
    goto LABEL_33;
  }
  if ((*((unsigned char *)this + 52) & 1) == 0)
  {
    LODWORD(v3) = 0;
    if ((*((unsigned char *)this + 52) & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  int v4 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 4);
  if (v4 < 0x80)
  {
    LODWORD(v3) = 2;
    if ((v2 & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  LODWORD(v3) = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v4) + 1;
  int v2 = *((_DWORD *)this + 13);
  if ((v2 & 2) != 0)
  {
LABEL_10:
    LODWORD(v3) = v3
                + wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64(*((wireless_diagnostics::google::protobuf::io::CodedOutputStream **)this
                                                                                              + 1))
                + 2;
    int v2 = *((_DWORD *)this + 13);
  }
LABEL_11:
  if ((v2 & 4) != 0) {
    LODWORD(v3) = v3 + 10;
  }
  if ((v2 & 8) != 0)
  {
    uint64_t v5 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 5);
    if (v5 >= 0x80)
    {
      int v6 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v5) + 2;
      int v2 = *((_DWORD *)this + 13);
    }
    else
    {
      int v6 = 3;
    }
    LODWORD(v3) = v6 + v3;
  }
  if ((v2 & 0x10) != 0) {
    uint64_t v3 = (v3 + 3);
  }
  else {
    uint64_t v3 = v3;
  }
  if ((v2 & 0x20) != 0)
  {
    uint64_t v7 = (awd::profile::ProcessingRule *)*((void *)this + 4);
    if (!v7) {
      uint64_t v7 = *(awd::profile::ProcessingRule **)(awd::profile::ProcessingRule::default_instance_ + 32);
    }
    uint64_t v8 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)awd::profile::ProcessingRule::ByteSize(v7);
    int v9 = (int)v8;
    if (v8 >= 0x80) {
      int v10 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v8);
    }
    else {
      int v10 = 1;
    }
    uint64_t v3 = (v3 + v9 + v10 + 2);
    int v2 = *((_DWORD *)this + 13);
  }
  if ((v2 & 0x40) != 0)
  {
    unint64_t v11 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 11);
    if (v11 >= 0x80) {
      int v12 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v11) + 2;
    }
    else {
      int v12 = 3;
    }
    uint64_t v3 = (v12 + v3);
  }
LABEL_33:
  *((_DWORD *)this + 12) = v3;
  return v3;
}

void awd::profile::ProcessingRule::CopyFrom(awd::profile::ProcessingRule *this, const awd::profile::ProcessingRule *a2)
{
  if (a2 != this)
  {
    (*(void (**)(awd::profile::ProcessingRule *))(*(void *)this + 32))(this);
    awd::profile::ProcessingRule::MergeFrom(this, a2);
  }
}

uint64_t awd::profile::ProcessingRule::IsInitialized(awd::profile::ProcessingRule *this)
{
  return 1;
}

double awd::profile::ProcessingRule::Swap(awd::profile::ProcessingRule *this, awd::profile::ProcessingRule *a2)
{
  if (a2 != this)
  {
    int v2 = *((_DWORD *)this + 4);
    *((_DWORD *)this + 4) = *((_DWORD *)a2 + 4);
    *((_DWORD *)a2 + 4) = v2;
    uint64_t v3 = *((void *)this + 1);
    *((void *)this + 1) = *((void *)a2 + 1);
    *((void *)a2 + 1) = v3;
    double result = *((double *)this + 3);
    *((void *)this + 3) = *((void *)a2 + 3);
    *((double *)a2 + 3) = result;
    LODWORD(v3) = *((_DWORD *)this + 5);
    *((_DWORD *)this + 5) = *((_DWORD *)a2 + 5);
    *((_DWORD *)a2 + 5) = v3;
    LOBYTE(v3) = *((unsigned char *)this + 40);
    *((unsigned char *)this + 40) = *((unsigned char *)a2 + 40);
    *((unsigned char *)a2 + 40) = v3;
    uint64_t v5 = *((void *)this + 4);
    *((void *)this + 4) = *((void *)a2 + 4);
    *((void *)a2 + 4) = v5;
    LODWORD(v5) = *((_DWORD *)this + 11);
    *((_DWORD *)this + 11) = *((_DWORD *)a2 + 11);
    *((_DWORD *)a2 + 11) = v5;
    LODWORD(v5) = *((_DWORD *)this + 13);
    *((_DWORD *)this + 13) = *((_DWORD *)a2 + 13);
    *((_DWORD *)a2 + 13) = v5;
    LODWORD(v5) = *((_DWORD *)this + 12);
    *((_DWORD *)this + 12) = *((_DWORD *)a2 + 12);
    *((_DWORD *)a2 + 12) = v5;
  }
  return result;
}

void *awd::profile::ProcessingRule::GetTypeName@<X0>(void *a1@<X8>)
{
  return sub_1D3E270D0(a1, "awd.profile.ProcessingRule");
}

BOOL awd::profile::BedfTreeNode_BedfNodeType_IsValid(awd::profile *this)
{
  return this < 4;
}

BOOL awd::profile::BedfTreeNode_BedfOperatorType_IsValid(awd::profile *this)
{
  return (this - 1) < 0xC;
}

double awd::profile::BedfTreeNode::SharedCtor(awd::profile::BedfTreeNode *this)
{
  *(void *)&double result = 0x100000000;
  *((void *)this + 1) = 0x100000000;
  *((void *)this + 7) = 0;
  *((void *)this + 3) = 0;
  *((void *)this + 4) = 0;
  *((void *)this + 2) = 0;
  return result;
}

uint64_t awd::profile::BedfTreeNode::default_instance(awd::profile::BedfTreeNode *this, uint64_t a2, uint64_t a3, const char *a4)
{
  uint64_t result = awd::profile::BedfTreeNode::default_instance_;
  if (!awd::profile::BedfTreeNode::default_instance_)
  {
    awd::profile::protobuf_AddDesc_AwdProfile_2eproto(0, a2, a3, a4);
    return awd::profile::BedfTreeNode::default_instance_;
  }
  return result;
}

awd::profile::BedfTreeNode *awd::profile::BedfTreeNode::BedfTreeNode(awd::profile::BedfTreeNode *this, const awd::profile::BedfTreeNode *a2)
{
  *(void *)this = &unk_1F2B9AFF0;
  *((void *)this + 5) = 0;
  *((void *)this + 6) = 0;
  *((void *)this + 7) = 0;
  *((void *)this + 1) = 0x100000000;
  *((void *)this + 3) = 0;
  *((void *)this + 4) = 0;
  *((void *)this + 2) = 0;
  awd::profile::BedfTreeNode::MergeFrom(this, a2);
  return this;
}

void sub_1D3E3D000(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;
  if (*v3) {
    MEMORY[0x1D94412D0](*v3, 0x1000C8052888210);
  }
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(v1);
  _Unwind_Resume(a1);
}

void awd::profile::BedfTreeNode::MergeFrom(awd::profile::BedfTreeNode *this, const awd::profile::BedfTreeNode *a2)
{
  if (a2 == this)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v14);
  }
  int v4 = *((_DWORD *)a2 + 12);
  if (v4)
  {
    sub_1D3E4D664((uint64_t)this + 40, *((_DWORD *)this + 12) + v4);
    memcpy((void *)(*((void *)this + 5) + 4 * *((int *)this + 12)), *((const void **)a2 + 5), 4 * *((int *)a2 + 12));
    *((_DWORD *)this + 12) += *((_DWORD *)a2 + 12);
  }
  LOBYTE(v5) = *((unsigned char *)a2 + 60);
  if ((_BYTE)v5)
  {
    if (*((unsigned char *)a2 + 60))
    {
      int v7 = *((_DWORD *)a2 + 2);
      *((_DWORD *)this + 15) |= 1u;
      *((_DWORD *)this + 2) = v7;
      int v5 = *((_DWORD *)a2 + 15);
      if ((v5 & 2) == 0)
      {
LABEL_8:
        if ((v5 & 4) == 0) {
          goto LABEL_9;
        }
        goto LABEL_16;
      }
    }
    else if ((*((unsigned char *)a2 + 60) & 2) == 0)
    {
      goto LABEL_8;
    }
    int v8 = *((_DWORD *)a2 + 3);
    *((_DWORD *)this + 15) |= 2u;
    *((_DWORD *)this + 3) = v8;
    int v5 = *((_DWORD *)a2 + 15);
    if ((v5 & 4) == 0)
    {
LABEL_9:
      if ((v5 & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_21;
    }
LABEL_16:
    *((_DWORD *)this + 15) |= 4u;
    int v9 = (awd::profile::BedfTreeNode *)*((void *)this + 2);
    if (!v9) {
      operator new();
    }
    int v10 = (const awd::profile::BedfTreeNode *)*((void *)a2 + 2);
    if (!v10) {
      int v10 = *(const awd::profile::BedfTreeNode **)(awd::profile::BedfTreeNode::default_instance_ + 16);
    }
    awd::profile::BedfTreeNode::MergeFrom(v9, v10);
    int v5 = *((_DWORD *)a2 + 15);
    if ((v5 & 8) == 0)
    {
LABEL_10:
      if ((v5 & 0x10) == 0) {
        goto LABEL_11;
      }
      goto LABEL_26;
    }
LABEL_21:
    *((_DWORD *)this + 15) |= 8u;
    unint64_t v11 = (awd::profile::BedfTreeNode *)*((void *)this + 3);
    if (!v11) {
      operator new();
    }
    int v12 = (const awd::profile::BedfTreeNode *)*((void *)a2 + 3);
    if (!v12) {
      int v12 = *(const awd::profile::BedfTreeNode **)(awd::profile::BedfTreeNode::default_instance_ + 24);
    }
    awd::profile::BedfTreeNode::MergeFrom(v11, v12);
    int v5 = *((_DWORD *)a2 + 15);
    if ((v5 & 0x10) == 0)
    {
LABEL_11:
      if ((v5 & 0x20) == 0) {
        return;
      }
      goto LABEL_12;
    }
LABEL_26:
    int v13 = *((_DWORD *)a2 + 8);
    *((_DWORD *)this + 15) |= 0x10u;
    *((_DWORD *)this + MEMORY[0x1D9440F90]((char *)this + 8) = v13;
    if ((*((_DWORD *)a2 + 15) & 0x20) == 0) {
      return;
    }
LABEL_12:
    int v6 = *((_DWORD *)a2 + 9);
    *((_DWORD *)this + 15) |= 0x20u;
    *((_DWORD *)this + 9) = v6;
  }
}

void sub_1D3E3D27C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)va);
  _Unwind_Resume(a1);
}

void awd::profile::BedfTreeNode::~BedfTreeNode(awd::profile::BedfTreeNode *this)
{
  *(void *)this = &unk_1F2B9AFF0;
  awd::profile::BedfTreeNode::SharedDtor(this);
  uint64_t v2 = *((void *)this + 5);
  if (v2) {
    MEMORY[0x1D94412D0](v2, 0x1000C8052888210);
  }
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(this);
}

{
  uint64_t vars8;

  awd::profile::BedfTreeNode::~BedfTreeNode(this);
  JUMPOUT(0x1D94412F0);
}

void *awd::profile::BedfTreeNode::SharedDtor(void *this)
{
  if ((void *)awd::profile::BedfTreeNode::default_instance_ != this)
  {
    uint64_t v1 = this;
    uint64_t v2 = this[2];
    if (v2) {
      (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
    }
    this = (void *)v1[3];
    if (this)
    {
      uint64_t v3 = *(uint64_t (**)(void))(*this + 8);
      return (void *)v3();
    }
  }
  return this;
}

uint64_t awd::profile::BedfTreeNode::SetCachedSize(uint64_t this, int a2)
{
  *(_DWORD *)(this + 56) = a2;
  return this;
}

void awd::profile::BedfTreeNode::New(awd::profile::BedfTreeNode *this)
{
}

uint64_t awd::profile::BedfTreeNode::Clear(uint64_t this)
{
  uint64_t v1 = this;
  LOBYTE(v2) = *(unsigned char *)(this + 60);
  if ((_BYTE)v2)
  {
    *(void *)(this + MEMORY[0x1D9440F90]((char *)this + 8) = 0x100000000;
    if ((v2 & 4) != 0)
    {
      this = *(void *)(this + 16);
      if (this)
      {
        this = awd::profile::BedfTreeNode::Clear((awd::profile::BedfTreeNode *)this);
        int v2 = *(_DWORD *)(v1 + 60);
      }
    }
    if ((v2 & 8) != 0)
    {
      this = *(void *)(v1 + 24);
      if (this) {
        this = awd::profile::BedfTreeNode::Clear((awd::profile::BedfTreeNode *)this);
      }
    }
    *(void *)(v1 + 32) = 0;
  }
  *(_DWORD *)(v1 + 4MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  *(_DWORD *)(v1 + 60) = 0;
  return this;
}

uint64_t awd::profile::BedfTreeNode::MergePartialFromCodedStream(awd::profile::BedfTreeNode *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2)
{
  int v4 = (uint64_t *)((char *)this + 40);
  while (2)
  {
    int v5 = (char *)*((void *)a2 + 1);
    if ((unint64_t)v5 >= *((void *)a2 + 2) || *v5 < 0)
    {
      unint64_t TagFallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(a2);
      *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = TagFallback;
      if (!TagFallback) {
        return 1;
      }
    }
    else
    {
      unint64_t TagFallback = *v5;
      *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = TagFallback;
      *((void *)a2 + 1) = v5 + 1;
      if (!TagFallback) {
        return 1;
      }
    }
    switch(TagFallback >> 3)
    {
      case 1u:
        int v7 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_26;
        }
        unsigned int v48 = 0;
        int v8 = (char *)*((void *)a2 + 1);
        if ((unint64_t)v8 >= *((void *)a2 + 2) || *v8 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v48);
          if (!result) {
            return result;
          }
          unsigned int v9 = v48;
        }
        else
        {
          unsigned int v9 = *v8;
          *((void *)a2 + 1) = v8 + 1;
        }
        if (v9 <= 3)
        {
          *((_DWORD *)this + 15) |= 1u;
          *((_DWORD *)this + 2) = v9;
        }
        int v17 = (unsigned char *)*((void *)a2 + 1);
        unint64_t v10 = *((void *)a2 + 2);
        if ((unint64_t)v17 < v10 && *v17 == 16)
        {
          unint64_t v11 = v17 + 1;
          *((void *)a2 + 1) = v11;
          goto LABEL_38;
        }
        continue;
      case 2u:
        int v7 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_26;
        }
        unint64_t v11 = (char *)*((void *)a2 + 1);
        unint64_t v10 = *((void *)a2 + 2);
LABEL_38:
        unsigned int v48 = 0;
        if ((unint64_t)v11 >= v10 || *v11 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v48);
          if (!result) {
            return result;
          }
          unsigned int v18 = v48;
        }
        else
        {
          unsigned int v18 = *v11;
          *((void *)a2 + 1) = v11 + 1;
        }
        if (v18 - 1 <= 0xB)
        {
          *((_DWORD *)this + 15) |= 2u;
          *((_DWORD *)this + 3) = v18;
        }
        uint64_t v19 = (unsigned char *)*((void *)a2 + 1);
        if ((unint64_t)v19 >= *((void *)a2 + 2) || *v19 != 26) {
          continue;
        }
        *((void *)a2 + 1) = v19 + 1;
LABEL_48:
        *((_DWORD *)this + 15) |= 4u;
        unint64_t v20 = (awd::profile::BedfTreeNode *)*((void *)this + 2);
        if (!v20) {
          operator new();
        }
        unsigned int v48 = 0;
        BOOL v21 = (char *)*((void *)a2 + 1);
        if ((unint64_t)v21 >= *((void *)a2 + 2) || *v21 < 0)
        {
          if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v48))return 0; {
        }
          }
        else
        {
          unsigned int v48 = *v21;
          *((void *)a2 + 1) = v21 + 1;
        }
        int v22 = *((_DWORD *)a2 + 14);
        int v23 = *((_DWORD *)a2 + 15);
        *((_DWORD *)a2 + 14) = v22 + 1;
        if (v22 >= v23) {
          return 0;
        }
        wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(a2);
        if (!awd::profile::BedfTreeNode::MergePartialFromCodedStream(v20, a2) || !*((unsigned char *)a2 + 36)) {
          return 0;
        }
        wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(a2);
        int v24 = *((_DWORD *)a2 + 14);
        BOOL v25 = __OFSUB__(v24, 1);
        int v26 = v24 - 1;
        if (v26 < 0 == v25) {
          *((_DWORD *)a2 + 14) = v26;
        }
        BOOL v27 = (unsigned char *)*((void *)a2 + 1);
        if ((unint64_t)v27 >= *((void *)a2 + 2) || *v27 != 34) {
          continue;
        }
        *((void *)a2 + 1) = v27 + 1;
LABEL_62:
        *((_DWORD *)this + 15) |= 8u;
        int v28 = (awd::profile::BedfTreeNode *)*((void *)this + 3);
        if (!v28) {
          operator new();
        }
        unsigned int v48 = 0;
        int v29 = (char *)*((void *)a2 + 1);
        if ((unint64_t)v29 >= *((void *)a2 + 2) || *v29 < 0)
        {
          if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v48))return 0; {
        }
          }
        else
        {
          unsigned int v48 = *v29;
          *((void *)a2 + 1) = v29 + 1;
        }
        int v30 = *((_DWORD *)a2 + 14);
        int v31 = *((_DWORD *)a2 + 15);
        *((_DWORD *)a2 + 14) = v30 + 1;
        if (v30 < v31)
        {
          wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(a2);
          if (awd::profile::BedfTreeNode::MergePartialFromCodedStream(v28, a2))
          {
            if (*((unsigned char *)a2 + 36))
            {
              wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(a2);
              int v32 = *((_DWORD *)a2 + 14);
              BOOL v25 = __OFSUB__(v32, 1);
              int v33 = v32 - 1;
              if (v33 < 0 == v25) {
                *((_DWORD *)a2 + 14) = v33;
              }
              unsigned int v34 = (char *)*((void *)a2 + 1);
              int v12 = (char *)*((void *)a2 + 2);
              if (v34 < v12 && *v34 == 40)
              {
                int v13 = v34 + 1;
                *((void *)a2 + 1) = v13;
LABEL_76:
                unsigned int v48 = 0;
                if (v13 >= v12 || *v13 < 0)
                {
                  uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v48);
                  if (!result) {
                    return result;
                  }
                  unsigned int v35 = v48;
                  uint64_t v36 = (char *)*((void *)a2 + 1);
                  int v12 = (char *)*((void *)a2 + 2);
                }
                else
                {
                  unsigned int v35 = *v13;
                  uint64_t v36 = v13 + 1;
                  *((void *)a2 + 1) = v36;
                }
                *((_DWORD *)this + MEMORY[0x1D9440F90]((char *)this + 8) = v35;
                *((_DWORD *)this + 15) |= 0x10u;
                if (v36 < v12 && *v36 == 48)
                {
                  int v14 = v36 + 1;
                  *((void *)a2 + 1) = v14;
LABEL_84:
                  unsigned int v48 = 0;
                  if (v14 >= v12 || *v14 < 0)
                  {
                    uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v48);
                    if (!result) {
                      return result;
                    }
                    unsigned int v37 = v48;
                    uint64_t v38 = (char *)*((void *)a2 + 1);
                    int v12 = (char *)*((void *)a2 + 2);
                  }
                  else
                  {
                    unsigned int v37 = *v14;
                    uint64_t v38 = v14 + 1;
                    *((void *)a2 + 1) = v38;
                  }
                  *((_DWORD *)this + 9) = v37;
                  *((_DWORD *)this + 15) |= 0x20u;
                  if (v38 < v12 && *v38 == 56)
                  {
                    do
                    {
                      uint64_t v15 = v38 + 1;
                      *((void *)a2 + 1) = v15;
LABEL_92:
                      unsigned int v48 = 0;
                      if (v15 >= v12 || *v15 < 0)
                      {
                        uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v48);
                        if (!result) {
                          return result;
                        }
                        unsigned int v39 = v48;
                      }
                      else
                      {
                        unsigned int v39 = *v15;
                        *((void *)a2 + 1) = v15 + 1;
                      }
                      int v40 = *((_DWORD *)this + 12);
                      if (v40 == *((_DWORD *)this + 13))
                      {
                        sub_1D3E4D664((uint64_t)v4, v40 + 1);
                        int v40 = *((_DWORD *)this + 12);
                      }
                      uint64_t v41 = *((void *)this + 5);
                      *((_DWORD *)this + 12) = v40 + 1;
                      *(_DWORD *)(v41 + 4 * v40) = v39;
                      int v42 = *((_DWORD *)this + 13) - *((_DWORD *)this + 12);
                      if (v42 >= 1)
                      {
                        int v43 = v42 + 1;
                        do
                        {
                          uint64_t v44 = (unsigned char *)*((void *)a2 + 1);
                          unint64_t v45 = *((void *)a2 + 2);
                          if ((unint64_t)v44 >= v45 || *v44 != 56) {
                            break;
                          }
                          *((void *)a2 + 1) = v44 + 1;
                          unsigned int v48 = 0;
                          if ((unint64_t)(v44 + 1) >= v45 || (char)v44[1] < 0)
                          {
                            uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v48);
                            if (!result) {
                              return result;
                            }
                            unsigned int v46 = v48;
                            uint64_t v41 = *v4;
                          }
                          else
                          {
                            unsigned int v46 = v44[1];
                            *((void *)a2 + 1) = v44 + 2;
                          }
                          uint64_t v47 = *((int *)this + 12);
                          *((_DWORD *)this + 12) = v47 + 1;
                          *(_DWORD *)(v41 + 4 * v47) = v46;
                          --v43;
                        }
                        while (v43 > 1);
                      }
LABEL_109:
                      uint64_t v38 = (char *)*((void *)a2 + 1);
                      int v12 = (char *)*((void *)a2 + 2);
                    }
                    while (v38 < v12 && *v38 == 56);
                    if (v38 == v12 && (*((_DWORD *)a2 + 11) || *((_DWORD *)a2 + 6) == *((_DWORD *)a2 + 10)))
                    {
                      *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
                      uint64_t result = 1;
                      *((unsigned char *)a2 + 36) = 1;
                      return result;
                    }
                  }
                }
              }
              continue;
            }
          }
        }
        return 0;
      case 3u:
        int v7 = TagFallback & 7;
        if (v7 == 2) {
          goto LABEL_48;
        }
        goto LABEL_26;
      case 4u:
        int v7 = TagFallback & 7;
        if (v7 == 2) {
          goto LABEL_62;
        }
        goto LABEL_26;
      case 5u:
        int v7 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_26;
        }
        int v13 = (char *)*((void *)a2 + 1);
        int v12 = (char *)*((void *)a2 + 2);
        goto LABEL_76;
      case 6u:
        int v7 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_26;
        }
        int v14 = (char *)*((void *)a2 + 1);
        int v12 = (char *)*((void *)a2 + 2);
        goto LABEL_84;
      case 7u:
        int v7 = TagFallback & 7;
        if (v7 == 2)
        {
          uint64_t result = sub_1D3E3DB54(a2, (uint64_t)v4);
          if (!result) {
            return result;
          }
          goto LABEL_109;
        }
        if ((TagFallback & 7) == 0)
        {
          uint64_t v15 = (char *)*((void *)a2 + 1);
          int v12 = (char *)*((void *)a2 + 2);
          goto LABEL_92;
        }
LABEL_26:
        if (v7 == 4) {
          return 1;
        }
        if ((wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipField(a2, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)TagFallback) & 1) == 0)return 0; {
        continue;
        }
      default:
        int v7 = TagFallback & 7;
        goto LABEL_26;
    }
  }
}

uint64_t sub_1D3E3DB54(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, uint64_t a2)
{
  unsigned int v10 = 0;
  int v4 = (char *)*((void *)this + 1);
  if ((unint64_t)v4 >= *((void *)this + 2) || *v4 < 0)
  {
    uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, &v10);
    if (!result) {
      return result;
    }
  }
  else
  {
    unsigned int v10 = *v4;
    *((void *)this + 1) = v4 + 1;
  }
  wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(this);
  if ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(this) >= 1)
  {
    do
    {
      unsigned int v11 = 0;
      int v6 = (char *)*((void *)this + 1);
      if ((unint64_t)v6 >= *((void *)this + 2) || *v6 < 0)
      {
        uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, &v11);
        if (!result) {
          return result;
        }
        unsigned int v7 = v11;
      }
      else
      {
        unsigned int v7 = *v6;
        *((void *)this + 1) = v6 + 1;
      }
      int v8 = *(_DWORD *)(a2 + 8);
      if (v8 == *(_DWORD *)(a2 + 12))
      {
        sub_1D3E4D664(a2, v8 + 1);
        int v8 = *(_DWORD *)(a2 + 8);
      }
      uint64_t v9 = *(void *)a2;
      *(_DWORD *)(a2 + MEMORY[0x1D9440F90]((char *)this + 8) = v8 + 1;
      *(_DWORD *)(v9 + 4 * vMEMORY[0x1D9440F90]((char *)this + 8) = v7;
    }
    while ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(this) > 0);
  }
  wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(this);
  return 1;
}

uint64_t awd::profile::BedfTreeNode::SerializeWithCachedSizes(uint64_t this, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  uint64_t v5 = this;
  int v6 = *(_DWORD *)(this + 60);
  if (v6)
  {
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteEnum((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)1, *(unsigned int *)(this + 8), (uint64_t)a2, a4);
    int v6 = *(_DWORD *)(v5 + 60);
    if ((v6 & 2) == 0)
    {
LABEL_3:
      if ((v6 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_3;
  }
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteEnum((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)2, *(unsigned int *)(v5 + 12), (uint64_t)a2, a4);
  int v6 = *(_DWORD *)(v5 + 60);
  if ((v6 & 4) == 0)
  {
LABEL_4:
    if ((v6 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_14:
  uint64_t v8 = *(void *)(v5 + 16);
  if (!v8) {
    uint64_t v8 = *(void *)(awd::profile::BedfTreeNode::default_instance_ + 16);
  }
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)3, v8, a2, a4);
  int v6 = *(_DWORD *)(v5 + 60);
  if ((v6 & 8) == 0)
  {
LABEL_5:
    if ((v6 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_17:
  uint64_t v9 = *(void *)(v5 + 24);
  if (!v9) {
    uint64_t v9 = *(void *)(awd::profile::BedfTreeNode::default_instance_ + 24);
  }
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)4, v9, a2, a4);
  int v6 = *(_DWORD *)(v5 + 60);
  if ((v6 & 0x10) == 0)
  {
LABEL_6:
    if ((v6 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_20:
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)5, *(unsigned int *)(v5 + 32), (uint64_t)a2, a4);
  if ((*(_DWORD *)(v5 + 60) & 0x20) != 0) {
LABEL_7:
  }
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)6, *(unsigned int *)(v5 + 36), (uint64_t)a2, a4);
LABEL_8:
  if (*(int *)(v5 + 48) >= 1)
  {
    uint64_t v7 = 0;
    do
      this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)7, *(unsigned int *)(*(void *)(v5 + 40) + 4 * v7++), (uint64_t)a2, a4);
    while (v7 < *(int *)(v5 + 48));
  }
  return this;
}

uint64_t awd::profile::BedfTreeNode::ByteSize(awd::profile::BedfTreeNode *this)
{
  LOBYTE(v2) = *((unsigned char *)this + 60);
  if (!(_BYTE)v2)
  {
    int v3 = 0;
    goto LABEL_47;
  }
  if ((*((unsigned char *)this + 60) & 1) == 0)
  {
    int v3 = 0;
    if ((*((unsigned char *)this + 60) & 2) == 0) {
      goto LABEL_18;
    }
    goto LABEL_12;
  }
  int v4 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 2);
  if ((v4 & 0x80000000) != 0)
  {
    int v5 = 10;
  }
  else if (v4 >= 0x80)
  {
    int v5 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v4);
    int v2 = *((_DWORD *)this + 15);
  }
  else
  {
    int v5 = 1;
  }
  int v3 = v5 + 1;
  if ((v2 & 2) != 0)
  {
LABEL_12:
    int v6 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 3);
    if ((v6 & 0x80000000) != 0)
    {
      int v7 = 11;
    }
    else if (v6 >= 0x80)
    {
      int v7 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v6) + 1;
      int v2 = *((_DWORD *)this + 15);
    }
    else
    {
      int v7 = 2;
    }
    v3 += v7;
  }
LABEL_18:
  if ((v2 & 4) != 0)
  {
    uint64_t v8 = (awd::profile::BedfTreeNode *)*((void *)this + 2);
    if (!v8) {
      uint64_t v8 = *(awd::profile::BedfTreeNode **)(awd::profile::BedfTreeNode::default_instance_ + 16);
    }
    uint64_t v9 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)awd::profile::BedfTreeNode::ByteSize(v8);
    int v10 = (int)v9;
    if (v9 >= 0x80) {
      int v11 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v9);
    }
    else {
      int v11 = 1;
    }
    v3 += v10 + v11 + 1;
    int v2 = *((_DWORD *)this + 15);
    if ((v2 & 8) == 0)
    {
LABEL_20:
      if ((v2 & 0x10) == 0) {
        goto LABEL_21;
      }
      goto LABEL_35;
    }
  }
  else if ((v2 & 8) == 0)
  {
    goto LABEL_20;
  }
  int v12 = (awd::profile::BedfTreeNode *)*((void *)this + 3);
  if (!v12) {
    int v12 = *(awd::profile::BedfTreeNode **)(awd::profile::BedfTreeNode::default_instance_ + 24);
  }
  int v13 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)awd::profile::BedfTreeNode::ByteSize(v12);
  int v14 = (int)v13;
  if (v13 >= 0x80) {
    int v15 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v13);
  }
  else {
    int v15 = 1;
  }
  v3 += v14 + v15 + 1;
  int v2 = *((_DWORD *)this + 15);
  if ((v2 & 0x10) == 0)
  {
LABEL_21:
    if ((v2 & 0x20) == 0) {
      goto LABEL_47;
    }
    goto LABEL_41;
  }
LABEL_35:
  uint64_t v16 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 8);
  if ((v16 & 0x80000000) != 0)
  {
    int v17 = 11;
  }
  else if (v16 >= 0x80)
  {
    int v17 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v16) + 1;
    int v2 = *((_DWORD *)this + 15);
  }
  else
  {
    int v17 = 2;
  }
  v3 += v17;
  if ((v2 & 0x20) != 0)
  {
LABEL_41:
    unsigned int v18 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 9);
    if ((v18 & 0x80000000) != 0)
    {
      int v19 = 11;
    }
    else if (v18 >= 0x80)
    {
      int v19 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v18) + 1;
    }
    else
    {
      int v19 = 2;
    }
    v3 += v19;
  }
LABEL_47:
  int v20 = *((_DWORD *)this + 12);
  if (v20 < 1)
  {
    int v22 = 0;
  }
  else
  {
    uint64_t v21 = 0;
    int v22 = 0;
    do
    {
      int v23 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*(unsigned int *)(*((void *)this + 5)
                                                                                             + 4 * v21);
      if ((v23 & 0x80000000) != 0)
      {
        int v24 = 10;
      }
      else if (v23 >= 0x80)
      {
        int v24 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v23);
        int v20 = *((_DWORD *)this + 12);
      }
      else
      {
        int v24 = 1;
      }
      v22 += v24;
      ++v21;
    }
    while (v21 < v20);
  }
  uint64_t result = (v22 + v3 + v20);
  *((_DWORD *)this + 14) = result;
  return result;
}

void awd::profile::BedfTreeNode::CopyFrom(awd::profile::BedfTreeNode *this, const awd::profile::BedfTreeNode *a2)
{
  if (a2 != this)
  {
    (*(void (**)(awd::profile::BedfTreeNode *))(*(void *)this + 32))(this);
    awd::profile::BedfTreeNode::MergeFrom(this, a2);
  }
}

uint64_t awd::profile::BedfTreeNode::IsInitialized(awd::profile::BedfTreeNode *this)
{
  return 1;
}

double awd::profile::BedfTreeNode::Swap(awd::profile::BedfTreeNode *this, awd::profile::BedfTreeNode *a2)
{
  if (a2 != this)
  {
    int v2 = *((_DWORD *)this + 2);
    *((_DWORD *)this + 2) = *((_DWORD *)a2 + 2);
    *((_DWORD *)a2 + 2) = v2;
    int v3 = *((_DWORD *)this + 3);
    *((_DWORD *)this + 3) = *((_DWORD *)a2 + 3);
    *((_DWORD *)a2 + 3) = v3;
    uint64_t v4 = *((void *)this + 2);
    *((void *)this + 2) = *((void *)a2 + 2);
    *((void *)a2 + 2) = v4;
    uint64_t v5 = *((void *)this + 3);
    *((void *)this + 3) = *((void *)a2 + 3);
    *((void *)a2 + 3) = v5;
    LODWORD(v5) = *((_DWORD *)this + 8);
    *((_DWORD *)this + MEMORY[0x1D9440F90]((char *)this + 8) = *((_DWORD *)a2 + 8);
    *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = v5;
    LODWORD(v5) = *((_DWORD *)this + 9);
    *((_DWORD *)this + 9) = *((_DWORD *)a2 + 9);
    *((_DWORD *)a2 + 9) = v5;
    uint64_t v6 = *((void *)this + 5);
    *((void *)this + 5) = *((void *)a2 + 5);
    double result = *((double *)a2 + 6);
    *((void *)a2 + 5) = v6;
    uint64_t v8 = *((void *)this + 6);
    *((double *)this + 6) = result;
    *((void *)a2 + 6) = v8;
    LODWORD(v6) = *((_DWORD *)this + 15);
    *((_DWORD *)this + 15) = *((_DWORD *)a2 + 15);
    *((_DWORD *)a2 + 15) = v6;
    LODWORD(v6) = *((_DWORD *)this + 14);
    *((_DWORD *)this + 14) = *((_DWORD *)a2 + 14);
    *((_DWORD *)a2 + 14) = v6;
  }
  return result;
}

void *awd::profile::BedfTreeNode::GetTypeName@<X0>(void *a1@<X8>)
{
  return sub_1D3E270D0(a1, "awd.profile.BedfTreeNode");
}

void *awd::profile::BedfConfig::SharedCtor(void *this)
{
  this[5] = 0;
  this[1] = 0;
  this[2] = 0;
  return this;
}

awd::profile::BedfConfig *awd::profile::BedfConfig::BedfConfig(awd::profile::BedfConfig *this, const awd::profile::BedfConfig *a2)
{
  *(void *)this = &unk_1F2B9AF00;
  *(_OWORD *)((char *)this + MEMORY[0x1D9440F90]((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((void *)this + 5) = 0;
  awd::profile::BedfConfig::MergeFrom(this, a2);
  return this;
}

void sub_1D3E3E168(_Unwind_Exception *a1)
{
  uint64_t v3 = *((void *)v1 + 3);
  if (v3) {
    MEMORY[0x1D94412D0](v3, 0x1000C8052888210);
  }
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(v1);
  _Unwind_Resume(a1);
}

void awd::profile::BedfConfig::MergeFrom(awd::profile::BedfConfig *this, const awd::profile::BedfConfig *a2)
{
  if (a2 == this)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v10);
  }
  int v4 = *((_DWORD *)a2 + 8);
  if (v4)
  {
    sub_1D3E4D664((uint64_t)this + 24, *((_DWORD *)this + 8) + v4);
    memcpy((void *)(*((void *)this + 3) + 4 * *((int *)this + 8)), *((const void **)a2 + 3), 4 * *((int *)a2 + 8));
    *((_DWORD *)this + 8) += *((_DWORD *)a2 + 8);
  }
  LOBYTE(v5) = *((unsigned char *)a2 + 44);
  if ((_BYTE)v5)
  {
    if (*((unsigned char *)a2 + 44))
    {
      int v6 = *((_DWORD *)a2 + 2);
      *((_DWORD *)this + 11) |= 1u;
      *((_DWORD *)this + 2) = v6;
      int v5 = *((_DWORD *)a2 + 11);
      if ((v5 & 2) == 0)
      {
LABEL_8:
        if ((v5 & 4) == 0) {
          return;
        }
        goto LABEL_12;
      }
    }
    else if ((*((unsigned char *)a2 + 44) & 2) == 0)
    {
      goto LABEL_8;
    }
    int v7 = *((_DWORD *)a2 + 3);
    *((_DWORD *)this + 11) |= 2u;
    *((_DWORD *)this + 3) = v7;
    if ((*((_DWORD *)a2 + 11) & 4) == 0) {
      return;
    }
LABEL_12:
    *((_DWORD *)this + 11) |= 4u;
    uint64_t v8 = (awd::profile::BedfTreeNode *)*((void *)this + 2);
    if (!v8) {
      operator new();
    }
    uint64_t v9 = (const awd::profile::BedfTreeNode *)*((void *)a2 + 2);
    if (!v9) {
      uint64_t v9 = *(const awd::profile::BedfTreeNode **)(awd::profile::BedfConfig::default_instance_ + 16);
    }
    awd::profile::BedfTreeNode::MergeFrom(v8, v9);
  }
}

void sub_1D3E3E318(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)va);
  _Unwind_Resume(a1);
}

void awd::profile::BedfConfig::~BedfConfig(awd::profile::BedfConfig *this)
{
  *(void *)this = &unk_1F2B9AF00;
  if ((awd::profile::BedfConfig *)awd::profile::BedfConfig::default_instance_ != this)
  {
    uint64_t v2 = *((void *)this + 2);
    if (v2) {
      (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
    }
  }
  uint64_t v3 = *((void *)this + 3);
  if (v3) {
    MEMORY[0x1D94412D0](v3, 0x1000C8052888210);
  }
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(this);
}

{
  uint64_t vars8;

  awd::profile::BedfConfig::~BedfConfig(this);
  JUMPOUT(0x1D94412F0);
}

void *awd::profile::BedfConfig::SharedDtor(void *this)
{
  if ((void *)awd::profile::BedfConfig::default_instance_ != this)
  {
    this = (void *)this[2];
    if (this) {
      return (void *)(*(uint64_t (**)(void))(*this + 8))();
    }
  }
  return this;
}

uint64_t awd::profile::BedfConfig::SetCachedSize(uint64_t this, int a2)
{
  *(_DWORD *)(this + 40) = a2;
  return this;
}

uint64_t awd::profile::BedfConfig::default_instance(awd::profile::BedfConfig *this, uint64_t a2, uint64_t a3, const char *a4)
{
  uint64_t result = awd::profile::BedfConfig::default_instance_;
  if (!awd::profile::BedfConfig::default_instance_)
  {
    awd::profile::protobuf_AddDesc_AwdProfile_2eproto(0, a2, a3, a4);
    return awd::profile::BedfConfig::default_instance_;
  }
  return result;
}

void awd::profile::BedfConfig::New(awd::profile::BedfConfig *this)
{
}

uint64_t awd::profile::BedfConfig::Clear(uint64_t this)
{
  uint64_t v1 = this;
  char v2 = *(unsigned char *)(this + 44);
  if (v2)
  {
    *(void *)(this + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
    if ((v2 & 4) != 0)
    {
      this = *(void *)(this + 16);
      if (this) {
        this = awd::profile::BedfTreeNode::Clear(this);
      }
    }
  }
  *(_DWORD *)(v1 + 32) = 0;
  *(_DWORD *)(v1 + 44) = 0;
  return this;
}

uint64_t awd::profile::BedfConfig::MergePartialFromCodedStream(awd::profile::BedfConfig *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2)
{
  int v4 = (uint64_t *)((char *)this + 24);
  int v5 = (unsigned int *)((char *)this + 8);
  int v6 = (unsigned int *)((char *)this + 12);
  while (2)
  {
    int v7 = (char *)*((void *)a2 + 1);
    if ((unint64_t)v7 >= *((void *)a2 + 2) || *v7 < 0)
    {
      unint64_t TagFallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(a2);
      *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = TagFallback;
      if (!TagFallback) {
        return 1;
      }
    }
    else
    {
      unint64_t TagFallback = *v7;
      *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = TagFallback;
      *((void *)a2 + 1) = v7 + 1;
      if (!TagFallback) {
        return 1;
      }
    }
    switch(TagFallback >> 3)
    {
      case 1u:
        int v9 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_20;
        }
        int v11 = (char *)*((void *)a2 + 1);
        unint64_t v10 = *((void *)a2 + 2);
        if ((unint64_t)v11 >= v10 || *v11 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v5);
          if (!result) {
            return result;
          }
          int v12 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v10 = *((void *)a2 + 2);
        }
        else
        {
          *int v5 = *v11;
          int v12 = v11 + 1;
          *((void *)a2 + 1) = v12;
        }
        *((_DWORD *)this + 11) |= 1u;
        if ((unint64_t)v12 < v10 && *v12 == 16)
        {
          int v13 = v12 + 1;
          *((void *)a2 + 1) = v13;
          goto LABEL_30;
        }
        continue;
      case 2u:
        int v9 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_20;
        }
        int v13 = (char *)*((void *)a2 + 1);
        unint64_t v10 = *((void *)a2 + 2);
LABEL_30:
        if ((unint64_t)v13 >= v10 || *v13 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v6);
          if (!result) {
            return result;
          }
          unsigned int v18 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v10 = *((void *)a2 + 2);
        }
        else
        {
          unsigned int *v6 = *v13;
          unsigned int v18 = v13 + 1;
          *((void *)a2 + 1) = v18;
        }
        int v14 = *((_DWORD *)this + 11) | 2;
        *((_DWORD *)this + 11) = v14;
        if ((unint64_t)v18 >= v10 || *v18 != 26) {
          continue;
        }
        *((void *)a2 + 1) = v18 + 1;
LABEL_38:
        *((_DWORD *)this + 11) = v14 | 4;
        int v19 = (awd::profile::BedfTreeNode *)*((void *)this + 2);
        if (!v19) {
          operator new();
        }
        unsigned int v38 = 0;
        int v20 = (char *)*((void *)a2 + 1);
        if ((unint64_t)v20 >= *((void *)a2 + 2) || *v20 < 0)
        {
          if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v38))return 0; {
        }
          }
        else
        {
          unsigned int v38 = *v20;
          *((void *)a2 + 1) = v20 + 1;
        }
        int v21 = *((_DWORD *)a2 + 14);
        int v22 = *((_DWORD *)a2 + 15);
        *((_DWORD *)a2 + 14) = v21 + 1;
        if (v21 < v22)
        {
          wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(a2);
          if (awd::profile::BedfTreeNode::MergePartialFromCodedStream(v19, a2))
          {
            if (*((unsigned char *)a2 + 36))
            {
              wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(a2);
              int v23 = *((_DWORD *)a2 + 14);
              BOOL v24 = __OFSUB__(v23, 1);
              int v25 = v23 - 1;
              if (v25 < 0 == v24) {
                *((_DWORD *)a2 + 14) = v25;
              }
              int v26 = (char *)*((void *)a2 + 1);
              int v15 = (char *)*((void *)a2 + 2);
              if (v26 < v15 && *v26 == 32)
              {
                do
                {
                  uint64_t v16 = v26 + 1;
                  *((void *)a2 + 1) = v16;
LABEL_52:
                  unsigned int v37 = 0;
                  if (v16 >= v15 || *v16 < 0)
                  {
                    uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v37);
                    if (!result) {
                      return result;
                    }
                    unsigned int v27 = v37;
                  }
                  else
                  {
                    unsigned int v27 = *v16;
                    *((void *)a2 + 1) = v16 + 1;
                  }
                  int v28 = *((_DWORD *)this + 8);
                  if (v28 == *((_DWORD *)this + 9))
                  {
                    sub_1D3E4D664((uint64_t)v4, v28 + 1);
                    int v28 = *((_DWORD *)this + 8);
                  }
                  uint64_t v29 = *((void *)this + 3);
                  *((_DWORD *)this + MEMORY[0x1D9440F90]((char *)this + 8) = v28 + 1;
                  *(_DWORD *)(v29 + 4 * v2MEMORY[0x1D9440F90]((char *)this + 8) = v27;
                  int v30 = *((_DWORD *)this + 9) - *((_DWORD *)this + 8);
                  if (v30 >= 1)
                  {
                    int v31 = v30 + 1;
                    do
                    {
                      int v32 = (unsigned char *)*((void *)a2 + 1);
                      unint64_t v33 = *((void *)a2 + 2);
                      if ((unint64_t)v32 >= v33 || *v32 != 32) {
                        break;
                      }
                      *((void *)a2 + 1) = v32 + 1;
                      unsigned int v36 = 0;
                      if ((unint64_t)(v32 + 1) >= v33 || (char)v32[1] < 0)
                      {
                        uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v36);
                        if (!result) {
                          return result;
                        }
                        unsigned int v34 = v36;
                        uint64_t v29 = *v4;
                      }
                      else
                      {
                        unsigned int v34 = v32[1];
                        *((void *)a2 + 1) = v32 + 2;
                      }
                      uint64_t v35 = *((int *)this + 8);
                      *((_DWORD *)this + MEMORY[0x1D9440F90]((char *)this + 8) = v35 + 1;
                      *(_DWORD *)(v29 + 4 * v35) = v34;
                      --v31;
                    }
                    while (v31 > 1);
                  }
LABEL_69:
                  int v26 = (char *)*((void *)a2 + 1);
                  int v15 = (char *)*((void *)a2 + 2);
                }
                while (v26 < v15 && *v26 == 32);
                if (v26 == v15 && (*((_DWORD *)a2 + 11) || *((_DWORD *)a2 + 6) == *((_DWORD *)a2 + 10)))
                {
                  *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
                  uint64_t result = 1;
                  *((unsigned char *)a2 + 36) = 1;
                  return result;
                }
              }
              continue;
            }
          }
        }
        return 0;
      case 3u:
        int v9 = TagFallback & 7;
        if (v9 != 2) {
          goto LABEL_20;
        }
        int v14 = *((_DWORD *)this + 11);
        goto LABEL_38;
      case 4u:
        int v9 = TagFallback & 7;
        if (v9 == 2)
        {
          uint64_t result = sub_1D3E3DB54(a2, (uint64_t)v4);
          if (!result) {
            return result;
          }
          goto LABEL_69;
        }
        if ((TagFallback & 7) == 0)
        {
          uint64_t v16 = (char *)*((void *)a2 + 1);
          int v15 = (char *)*((void *)a2 + 2);
          goto LABEL_52;
        }
LABEL_20:
        if (v9 == 4) {
          return 1;
        }
        if ((wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipField(a2, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)TagFallback) & 1) == 0)return 0; {
        continue;
        }
      default:
        int v9 = TagFallback & 7;
        goto LABEL_20;
    }
  }
}

uint64_t awd::profile::BedfConfig::SerializeWithCachedSizes(uint64_t this, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  uint64_t v5 = this;
  int v6 = *(_DWORD *)(this + 44);
  if (v6)
  {
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)1, *(unsigned int *)(this + 8), (uint64_t)a2, a4);
    int v6 = *(_DWORD *)(v5 + 44);
    if ((v6 & 2) == 0)
    {
LABEL_3:
      if ((v6 & 4) == 0) {
        goto LABEL_10;
      }
      goto LABEL_7;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_3;
  }
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)2, *(unsigned int *)(v5 + 12), (uint64_t)a2, a4);
  if ((*(_DWORD *)(v5 + 44) & 4) == 0) {
    goto LABEL_10;
  }
LABEL_7:
  uint64_t v7 = *(void *)(v5 + 16);
  if (!v7) {
    uint64_t v7 = *(void *)(awd::profile::BedfConfig::default_instance_ + 16);
  }
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)3, v7, a2, a4);
LABEL_10:
  if (*(int *)(v5 + 32) >= 1)
  {
    uint64_t v8 = 0;
    do
      this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)4, *(unsigned int *)(*(void *)(v5 + 24) + 4 * v8++), (uint64_t)a2, a4);
    while (v8 < *(int *)(v5 + 32));
  }
  return this;
}

uint64_t awd::profile::BedfConfig::ByteSize(awd::profile::BedfConfig *this)
{
  LOBYTE(v2) = *((unsigned char *)this + 44);
  if (!(_BYTE)v2)
  {
    int v3 = 0;
    goto LABEL_21;
  }
  if (*((unsigned char *)this + 44))
  {
    int v4 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 2);
    if (v4 >= 0x80)
    {
      int v3 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v4) + 1;
      int v2 = *((_DWORD *)this + 11);
      if ((v2 & 2) == 0) {
        goto LABEL_14;
      }
    }
    else
    {
      int v3 = 2;
      if ((v2 & 2) == 0) {
        goto LABEL_14;
      }
    }
  }
  else
  {
    int v3 = 0;
    if ((*((unsigned char *)this + 44) & 2) == 0) {
      goto LABEL_14;
    }
  }
  uint64_t v5 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 3);
  if (v5 >= 0x80)
  {
    int v6 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v5) + 1;
    int v2 = *((_DWORD *)this + 11);
  }
  else
  {
    int v6 = 2;
  }
  v3 += v6;
LABEL_14:
  if ((v2 & 4) != 0)
  {
    uint64_t v7 = (awd::profile::BedfTreeNode *)*((void *)this + 2);
    if (!v7) {
      uint64_t v7 = *(awd::profile::BedfTreeNode **)(awd::profile::BedfConfig::default_instance_ + 16);
    }
    uint64_t v8 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)awd::profile::BedfTreeNode::ByteSize(v7);
    int v9 = (int)v8;
    if (v8 >= 0x80) {
      int v10 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v8);
    }
    else {
      int v10 = 1;
    }
    v3 += v9 + v10 + 1;
  }
LABEL_21:
  int v11 = *((_DWORD *)this + 8);
  if (v11 < 1)
  {
    int v13 = 0;
  }
  else
  {
    uint64_t v12 = 0;
    int v13 = 0;
    do
    {
      int v14 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*(unsigned int *)(*((void *)this + 3)
                                                                                             + 4 * v12);
      if ((v14 & 0x80000000) != 0)
      {
        int v15 = 10;
      }
      else if (v14 >= 0x80)
      {
        int v15 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v14);
        int v11 = *((_DWORD *)this + 8);
      }
      else
      {
        int v15 = 1;
      }
      v13 += v15;
      ++v12;
    }
    while (v12 < v11);
  }
  uint64_t result = (v13 + v3 + v11);
  *((_DWORD *)this + 10) = result;
  return result;
}

void awd::profile::BedfConfig::CopyFrom(awd::profile::BedfConfig *this, const awd::profile::BedfConfig *a2)
{
  if (a2 != this)
  {
    (*(void (**)(awd::profile::BedfConfig *))(*(void *)this + 32))(this);
    awd::profile::BedfConfig::MergeFrom(this, a2);
  }
}

uint64_t awd::profile::BedfConfig::IsInitialized(awd::profile::BedfConfig *this)
{
  return 1;
}

double awd::profile::BedfConfig::Swap(awd::profile::BedfConfig *this, awd::profile::BedfConfig *a2)
{
  if (a2 != this)
  {
    int v2 = *((_DWORD *)this + 2);
    *((_DWORD *)this + 2) = *((_DWORD *)a2 + 2);
    *((_DWORD *)a2 + 2) = v2;
    int v3 = *((_DWORD *)this + 3);
    *((_DWORD *)this + 3) = *((_DWORD *)a2 + 3);
    *((_DWORD *)a2 + 3) = v3;
    uint64_t v4 = *((void *)this + 2);
    *((void *)this + 2) = *((void *)a2 + 2);
    *((void *)a2 + 2) = v4;
    uint64_t v5 = *((void *)this + 3);
    *((void *)this + 3) = *((void *)a2 + 3);
    double result = *((double *)a2 + 4);
    *((void *)a2 + 3) = v5;
    uint64_t v7 = *((void *)this + 4);
    *((double *)this + 4) = result;
    *((void *)a2 + 4) = v7;
    LODWORD(v5) = *((_DWORD *)this + 11);
    *((_DWORD *)this + 11) = *((_DWORD *)a2 + 11);
    *((_DWORD *)a2 + 11) = v5;
    LODWORD(v5) = *((_DWORD *)this + 10);
    *((_DWORD *)this + 10) = *((_DWORD *)a2 + 10);
    *((_DWORD *)a2 + 10) = v5;
  }
  return result;
}

void *awd::profile::BedfConfig::GetTypeName@<X0>(void *a1@<X8>)
{
  return sub_1D3E270D0(a1, "awd.profile.BedfConfig");
}

double awd::profile::Metric::SharedCtor(awd::profile::Metric *this)
{
  *((_DWORD *)this + 11) = 0;
  *((void *)this + 15) = 0;
  *((_DWORD *)this + 32) = 0;
  double result = 0.0;
  *(_OWORD *)((char *)this + MEMORY[0x1D9440F90]((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((unsigned char *)this + 40) = 0;
  return result;
}

awd::profile::Metric *awd::profile::Metric::Metric(awd::profile::Metric *this, const awd::profile::Metric *a2)
{
  *(void *)this = &unk_1F2B9B608;
  *((void *)this + 9) = 0;
  *((void *)this + 10) = 0;
  *((_DWORD *)this + 22) = 0;
  *((void *)this + 12) = 0;
  *((void *)this + 13) = 0;
  *((_DWORD *)this + 2MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  *((void *)this + 15) = 0;
  *((_DWORD *)this + 32) = 0;
  *(_OWORD *)((char *)this + MEMORY[0x1D9440F90]((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((unsigned char *)this + 40) = 0;
  *(void *)((char *)this + 44) = 0;
  *(void *)((char *)this + 60) = 0;
  *(void *)((char *)this + 52) = 0;
  awd::profile::Metric::MergeFrom(this, a2);
  return this;
}

void sub_1D3E3EDA8(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;
  sub_1D3E4D870(v5);
  sub_1D3E4D870(v3);
  sub_1D3E4D870(v2);
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(v1);
  _Unwind_Resume(a1);
}

void awd::profile::Metric::MergeFrom(awd::profile::Metric *this, const awd::profile::Metric *a2)
{
  if (a2 == this)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v31);
  }
  wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((awd::profile::Metric *)((char *)this + 48));
  if (*((int *)a2 + 14) >= 1)
  {
    uint64_t v4 = 0;
    do
    {
      uint64_t v5 = *(const awd::profile::ProcessingRule **)(*((void *)a2 + 6) + 8 * v4);
      int v6 = *((_DWORD *)this + 15);
      uint64_t v7 = *((int *)this + 14);
      if ((int)v7 >= v6)
      {
        if (v6 == *((_DWORD *)this + 16))
        {
          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((awd::profile::Metric *)((char *)this + 48));
          int v6 = *((_DWORD *)this + 15);
        }
        *((_DWORD *)this + 15) = v6 + 1;
        operator new();
      }
      uint64_t v8 = *((void *)this + 6);
      *((_DWORD *)this + 14) = v7 + 1;
      awd::profile::ProcessingRule::MergeFrom(*(awd::profile::ProcessingRule **)(v8 + 8 * v7), v5);
      ++v4;
    }
    while (v4 < *((int *)a2 + 14));
  }
  wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((awd::profile::Metric *)((char *)this + 72));
  if (*((int *)a2 + 20) >= 1)
  {
    uint64_t v9 = 0;
    do
    {
      int v10 = *(const awd::profile::BedfConfig **)(*((void *)a2 + 9) + 8 * v9);
      int v11 = *((_DWORD *)this + 21);
      uint64_t v12 = *((int *)this + 20);
      if ((int)v12 >= v11)
      {
        if (v11 == *((_DWORD *)this + 22))
        {
          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((awd::profile::Metric *)((char *)this + 72));
          int v11 = *((_DWORD *)this + 21);
        }
        *((_DWORD *)this + 21) = v11 + 1;
        operator new();
      }
      uint64_t v13 = *((void *)this + 9);
      *((_DWORD *)this + 20) = v12 + 1;
      awd::profile::BedfConfig::MergeFrom(*(awd::profile::BedfConfig **)(v13 + 8 * v12), v10);
      ++v9;
    }
    while (v9 < *((int *)a2 + 20));
  }
  wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((awd::profile::Metric *)((char *)this + 96));
  if (*((int *)a2 + 26) >= 1)
  {
    uint64_t v14 = 0;
    do
    {
      int v15 = *(const awd::profile::ConfigurationParameter **)(*((void *)a2 + 12) + 8 * v14);
      int v16 = *((_DWORD *)this + 27);
      uint64_t v17 = *((int *)this + 26);
      if ((int)v17 >= v16)
      {
        if (v16 == *((_DWORD *)this + 28))
        {
          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((awd::profile::Metric *)((char *)this + 96));
          int v16 = *((_DWORD *)this + 27);
        }
        *((_DWORD *)this + 27) = v16 + 1;
        operator new();
      }
      uint64_t v18 = *((void *)this + 12);
      *((_DWORD *)this + 26) = v17 + 1;
      awd::profile::ConfigurationParameter::MergeFrom(*(awd::profile::ConfigurationParameter **)(v18 + 8 * v17), v15);
      ++v14;
    }
    while (v14 < *((int *)a2 + 26));
  }
  int v19 = *((_DWORD *)a2 + 32);
  if (!(_BYTE)v19) {
    goto LABEL_37;
  }
  if (v19)
  {
    int v22 = *((_DWORD *)a2 + 2);
    *((_DWORD *)this + 32) |= 1u;
    *((_DWORD *)this + 2) = v22;
    int v19 = *((_DWORD *)a2 + 32);
    if ((v19 & 2) == 0)
    {
LABEL_30:
      if ((v19 & 4) == 0) {
        goto LABEL_31;
      }
      goto LABEL_45;
    }
  }
  else if ((v19 & 2) == 0)
  {
    goto LABEL_30;
  }
  int v23 = *((_DWORD *)a2 + 3);
  *((_DWORD *)this + 32) |= 2u;
  *((_DWORD *)this + 3) = v23;
  int v19 = *((_DWORD *)a2 + 32);
  if ((v19 & 4) == 0)
  {
LABEL_31:
    if ((v19 & 8) == 0) {
      goto LABEL_32;
    }
    goto LABEL_46;
  }
LABEL_45:
  int v24 = *((_DWORD *)a2 + 4);
  *((_DWORD *)this + 32) |= 4u;
  *((_DWORD *)this + 4) = v24;
  int v19 = *((_DWORD *)a2 + 32);
  if ((v19 & 8) == 0)
  {
LABEL_32:
    if ((v19 & 0x10) == 0) {
      goto LABEL_33;
    }
    goto LABEL_47;
  }
LABEL_46:
  int v25 = *((_DWORD *)a2 + 5);
  *((_DWORD *)this + 32) |= 8u;
  *((_DWORD *)this + 5) = v25;
  int v19 = *((_DWORD *)a2 + 32);
  if ((v19 & 0x10) == 0)
  {
LABEL_33:
    if ((v19 & 0x20) == 0) {
      goto LABEL_34;
    }
LABEL_48:
    int v27 = *((_DWORD *)a2 + 7);
    *((_DWORD *)this + 32) |= 0x20u;
    *((_DWORD *)this + 7) = v27;
    int v19 = *((_DWORD *)a2 + 32);
    if ((v19 & 0x40) == 0)
    {
LABEL_35:
      if ((v19 & 0x80) == 0) {
        goto LABEL_37;
      }
      goto LABEL_36;
    }
    goto LABEL_49;
  }
LABEL_47:
  int v26 = *((_DWORD *)a2 + 6);
  *((_DWORD *)this + 32) |= 0x10u;
  *((_DWORD *)this + 6) = v26;
  int v19 = *((_DWORD *)a2 + 32);
  if ((v19 & 0x20) != 0) {
    goto LABEL_48;
  }
LABEL_34:
  if ((v19 & 0x40) == 0) {
    goto LABEL_35;
  }
LABEL_49:
  int v28 = *((_DWORD *)a2 + 8);
  *((_DWORD *)this + 32) |= 0x40u;
  *((_DWORD *)this + MEMORY[0x1D9440F90]((char *)this + 8) = v28;
  int v19 = *((_DWORD *)a2 + 32);
  if ((v19 & 0x80) != 0)
  {
LABEL_36:
    int v20 = *((_DWORD *)a2 + 9);
    *((_DWORD *)this + 32) |= 0x80u;
    *((_DWORD *)this + 9) = v20;
    int v19 = *((_DWORD *)a2 + 32);
  }
LABEL_37:
  if ((v19 & 0xFF00) == 0) {
    return;
  }
  if ((v19 & 0x100) != 0)
  {
    char v29 = *((unsigned char *)a2 + 40);
    *((_DWORD *)this + 32) |= 0x100u;
    *((unsigned char *)this + 40) = v29;
    int v19 = *((_DWORD *)a2 + 32);
    if ((v19 & 0x200) == 0)
    {
LABEL_40:
      if ((v19 & 0x1000) == 0) {
        return;
      }
      goto LABEL_41;
    }
  }
  else if ((v19 & 0x200) == 0)
  {
    goto LABEL_40;
  }
  int v30 = *((_DWORD *)a2 + 11);
  *((_DWORD *)this + 32) |= 0x200u;
  *((_DWORD *)this + 11) = v30;
  if ((*((_DWORD *)a2 + 32) & 0x1000) == 0) {
    return;
  }
LABEL_41:
  int v21 = *((_DWORD *)a2 + 30);
  *((_DWORD *)this + 32) |= 0x1000u;
  *((_DWORD *)this + 30) = v21;
}

void sub_1D3E3F290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)va);
  _Unwind_Resume(a1);
}

void awd::profile::Metric::~Metric(awd::profile::Metric *this)
{
  *(void *)this = &unk_1F2B9B608;
  sub_1D3E4D870((uint64_t *)this + 12);
  sub_1D3E4D870((uint64_t *)this + 9);
  sub_1D3E4D870((uint64_t *)this + 6);
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(this);
}

{
  uint64_t vars8;

  awd::profile::Metric::~Metric(this);
  JUMPOUT(0x1D94412F0);
}

uint64_t awd::profile::Metric::SetCachedSize(uint64_t this, int a2)
{
  *(_DWORD *)(this + 124) = a2;
  return this;
}

uint64_t awd::profile::Metric::default_instance(awd::profile::Metric *this, uint64_t a2, uint64_t a3, const char *a4)
{
  uint64_t result = awd::profile::Metric::default_instance_;
  if (!awd::profile::Metric::default_instance_)
  {
    awd::profile::protobuf_AddDesc_AwdProfile_2eproto(0, a2, a3, a4);
    return awd::profile::Metric::default_instance_;
  }
  return result;
}

void awd::profile::Metric::New(awd::profile::Metric *this)
{
}

uint64_t awd::profile::Metric::Clear(awd::profile::Metric *this)
{
  int v2 = *((_DWORD *)this + 32);
  if ((_BYTE)v2)
  {
    *(_OWORD *)((char *)this + 24) = 0u;
    *(_OWORD *)((char *)this + MEMORY[0x1D9440F90]((char *)this + 8) = 0u;
  }
  if ((v2 & 0xFF00) != 0)
  {
    *((unsigned char *)this + 40) = 0;
    *((_DWORD *)this + 11) = 0;
    *((_DWORD *)this + 30) = 0;
  }
  sub_1D3E4D7B0((uint64_t)this + 48);
  sub_1D3E4D7B0((uint64_t)this + 72);
  uint64_t result = sub_1D3E4D7B0((uint64_t)this + 96);
  *((_DWORD *)this + 32) = 0;
  return result;
}

uint64_t awd::profile::Metric::MergePartialFromCodedStream(awd::profile::Metric *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2)
{
  uint64_t v4 = (unsigned int *)((char *)this + 12);
  uint64_t v5 = (unsigned int *)((char *)this + 24);
  int v6 = (unsigned int *)((char *)this + 28);
  uint64_t v7 = (unsigned int *)((char *)this + 44);
  v74 = (awd::profile::Metric *)((char *)this + 48);
  v75 = (awd::profile::Metric *)((char *)this + 72);
  v76 = (unsigned int *)((char *)this + 8);
  uint64_t v8 = (unsigned int *)((char *)this + 120);
  uint64_t v9 = (awd::profile::Metric *)((char *)this + 96);
LABEL_2:
  while (1)
  {
    int v10 = (unsigned __int8 *)*((void *)a2 + 1);
    if ((unint64_t)v10 >= *((void *)a2 + 2) || (char)*v10 < 0) {
      break;
    }
    unint64_t TagFallback = *v10;
    *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = TagFallback;
    *((void *)a2 + 1) = v10 + 1;
    if (!TagFallback) {
      return 1;
    }
LABEL_7:
    switch(TagFallback >> 3)
    {
      case 1u:
        int v12 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_38;
        }
        uint64_t v14 = (char *)*((void *)a2 + 1);
        unint64_t v13 = *((void *)a2 + 2);
        if ((unint64_t)v14 >= v13 || *v14 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v76);
          if (!result) {
            return result;
          }
          int v15 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v13 = *((void *)a2 + 2);
        }
        else
        {
          unsigned int *v76 = *v14;
          int v15 = v14 + 1;
          *((void *)a2 + 1) = v15;
        }
        *((_DWORD *)this + 32) |= 1u;
        if ((unint64_t)v15 < v13 && *v15 == 16)
        {
          int v16 = v15 + 1;
          *((void *)a2 + 1) = v16;
          goto LABEL_46;
        }
        continue;
      case 2u:
        int v12 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_38;
        }
        int v16 = (char *)*((void *)a2 + 1);
        unint64_t v13 = *((void *)a2 + 2);
LABEL_46:
        if ((unint64_t)v16 >= v13 || *v16 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v4);
          if (!result) {
            return result;
          }
          int v28 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v13 = *((void *)a2 + 2);
        }
        else
        {
          unsigned int *v4 = *v16;
          int v28 = v16 + 1;
          *((void *)a2 + 1) = v28;
        }
        *((_DWORD *)this + 32) |= 2u;
        if ((unint64_t)v28 >= v13 || *v28 != 24) {
          continue;
        }
        uint64_t v17 = v28 + 1;
        *((void *)a2 + 1) = v17;
LABEL_54:
        unsigned int v77 = 0;
        if ((unint64_t)v17 >= v13 || *v17 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v77);
          if (!result) {
            return result;
          }
          unsigned int v29 = v77;
          int v30 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v13 = *((void *)a2 + 2);
        }
        else
        {
          unsigned int v29 = *v17;
          int v30 = v17 + 1;
          *((void *)a2 + 1) = v30;
        }
        *((_DWORD *)this + 4) = -(v29 & 1) ^ (v29 >> 1);
        *((_DWORD *)this + 32) |= 4u;
        if ((unint64_t)v30 >= v13 || *v30 != 32) {
          continue;
        }
        uint64_t v18 = v30 + 1;
        *((void *)a2 + 1) = v18;
LABEL_62:
        unsigned int v77 = 0;
        if ((unint64_t)v18 >= v13 || *v18 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v77);
          if (!result) {
            return result;
          }
          unsigned int v31 = v77;
          int v32 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v13 = *((void *)a2 + 2);
        }
        else
        {
          unsigned int v31 = *v18;
          int v32 = v18 + 1;
          *((void *)a2 + 1) = v32;
        }
        *((_DWORD *)this + 5) = -(v31 & 1) ^ (v31 >> 1);
        *((_DWORD *)this + 32) |= 8u;
        if ((unint64_t)v32 >= v13 || *v32 != 40) {
          continue;
        }
        int v19 = v32 + 1;
        *((void *)a2 + 1) = v19;
LABEL_70:
        if ((unint64_t)v19 >= v13 || *v19 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v5);
          if (!result) {
            return result;
          }
          unint64_t v33 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v13 = *((void *)a2 + 2);
        }
        else
        {
          *uint64_t v5 = *v19;
          unint64_t v33 = v19 + 1;
          *((void *)a2 + 1) = v33;
        }
        *((_DWORD *)this + 32) |= 0x10u;
        if ((unint64_t)v33 >= v13 || *v33 != 48) {
          continue;
        }
        int v20 = v33 + 1;
        *((void *)a2 + 1) = v20;
LABEL_78:
        if ((unint64_t)v20 >= v13 || *v20 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v6);
          if (!result) {
            return result;
          }
          unsigned int v34 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v13 = *((void *)a2 + 2);
        }
        else
        {
          unsigned int *v6 = *v20;
          unsigned int v34 = v20 + 1;
          *((void *)a2 + 1) = v34;
        }
        *((_DWORD *)this + 32) |= 0x20u;
        if ((unint64_t)v34 >= v13 || *v34 != 56) {
          continue;
        }
        int v21 = v34 + 1;
        *((void *)a2 + 1) = v21;
LABEL_86:
        unsigned int v77 = 0;
        if ((unint64_t)v21 >= v13 || *v21 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v77);
          if (!result) {
            return result;
          }
          unsigned int v35 = v77;
          unsigned int v36 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v13 = *((void *)a2 + 2);
        }
        else
        {
          unsigned int v35 = *v21;
          unsigned int v36 = v21 + 1;
          *((void *)a2 + 1) = v36;
        }
        *((_DWORD *)this + MEMORY[0x1D9440F90]((char *)this + 8) = v35;
        *((_DWORD *)this + 32) |= 0x40u;
        if ((unint64_t)v36 >= v13 || *v36 != 64) {
          continue;
        }
        int v22 = v36 + 1;
        *((void *)a2 + 1) = v22;
LABEL_94:
        unsigned int v77 = 0;
        if ((unint64_t)v22 >= v13 || *v22 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v77);
          if (!result) {
            return result;
          }
          unsigned int v37 = v77;
          unsigned int v38 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v13 = *((void *)a2 + 2);
        }
        else
        {
          unsigned int v37 = *v22;
          unsigned int v38 = v22 + 1;
          *((void *)a2 + 1) = v38;
        }
        *((_DWORD *)this + 9) = v37;
        *((_DWORD *)this + 32) |= 0x80u;
        if ((unint64_t)v38 >= v13 || *v38 != 72) {
          continue;
        }
        int v23 = v38 + 1;
        *((void *)a2 + 1) = v23;
LABEL_102:
        unsigned int v77 = 0;
        if ((unint64_t)v23 >= v13 || *v23 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v77);
          if (!result) {
            return result;
          }
          unsigned int v39 = v77;
          int v40 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v13 = *((void *)a2 + 2);
        }
        else
        {
          unsigned int v39 = *v23;
          int v40 = v23 + 1;
          *((void *)a2 + 1) = v40;
        }
        *((unsigned char *)this + 40) = v39 != 0;
        *((_DWORD *)this + 32) |= 0x100u;
        if ((unint64_t)v40 >= v13 || *v40 != 80) {
          continue;
        }
        int v24 = v40 + 1;
        *((void *)a2 + 1) = v24;
LABEL_110:
        if ((unint64_t)v24 >= v13 || *v24 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v7);
          if (!result) {
            return result;
          }
          uint64_t v41 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v13 = *((void *)a2 + 2);
        }
        else
        {
          *uint64_t v7 = *v24;
          uint64_t v41 = v24 + 1;
          *((void *)a2 + 1) = v41;
        }
        *((_DWORD *)this + 32) |= 0x200u;
        if ((unint64_t)v41 >= v13 || *v41 != 90) {
          continue;
        }
        break;
      case 3u:
        int v12 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_38;
        }
        uint64_t v17 = (char *)*((void *)a2 + 1);
        unint64_t v13 = *((void *)a2 + 2);
        goto LABEL_54;
      case 4u:
        int v12 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_38;
        }
        uint64_t v18 = (char *)*((void *)a2 + 1);
        unint64_t v13 = *((void *)a2 + 2);
        goto LABEL_62;
      case 5u:
        int v12 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_38;
        }
        int v19 = (char *)*((void *)a2 + 1);
        unint64_t v13 = *((void *)a2 + 2);
        goto LABEL_70;
      case 6u:
        int v12 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_38;
        }
        int v20 = (char *)*((void *)a2 + 1);
        unint64_t v13 = *((void *)a2 + 2);
        goto LABEL_78;
      case 7u:
        int v12 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_38;
        }
        int v21 = (char *)*((void *)a2 + 1);
        unint64_t v13 = *((void *)a2 + 2);
        goto LABEL_86;
      case 8u:
        int v12 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_38;
        }
        int v22 = (char *)*((void *)a2 + 1);
        unint64_t v13 = *((void *)a2 + 2);
        goto LABEL_94;
      case 9u:
        int v12 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_38;
        }
        int v23 = (char *)*((void *)a2 + 1);
        unint64_t v13 = *((void *)a2 + 2);
        goto LABEL_102;
      case 0xAu:
        int v12 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_38;
        }
        int v24 = (char *)*((void *)a2 + 1);
        unint64_t v13 = *((void *)a2 + 2);
        goto LABEL_110;
      case 0xBu:
        int v12 = TagFallback & 7;
        if (v12 == 2) {
          goto LABEL_118;
        }
        goto LABEL_38;
      case 0xCu:
        int v12 = TagFallback & 7;
        if (v12 == 2) {
          goto LABEL_136;
        }
        goto LABEL_38;
      case 0xDu:
        int v12 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_38;
        }
        int v26 = (char *)*((void *)a2 + 1);
        unint64_t v25 = *((void *)a2 + 2);
        goto LABEL_154;
      case 0xEu:
        int v12 = TagFallback & 7;
        if (v12 != 2) {
          goto LABEL_38;
        }
        goto LABEL_162;
      default:
        int v12 = TagFallback & 7;
LABEL_38:
        if (v12 == 4) {
          return 1;
        }
        if ((wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipField(a2, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)TagFallback) & 1) == 0)return 0; {
        continue;
        }
    }
    do
    {
      *((void *)a2 + 1) = v41 + 1;
LABEL_118:
      int v42 = *((_DWORD *)this + 15);
      uint64_t v43 = *((int *)this + 14);
      if ((int)v43 >= v42)
      {
        if (v42 == *((_DWORD *)this + 16))
        {
          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v74);
          int v42 = *((_DWORD *)this + 15);
        }
        *((_DWORD *)this + 15) = v42 + 1;
        operator new();
      }
      uint64_t v44 = *((void *)this + 6);
      *((_DWORD *)this + 14) = v43 + 1;
      unint64_t v45 = *(awd::profile::ProcessingRule **)(v44 + 8 * v43);
      unsigned int v77 = 0;
      unsigned int v46 = (char *)*((void *)a2 + 1);
      if ((unint64_t)v46 >= *((void *)a2 + 2) || *v46 < 0)
      {
        if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v77)) {
          return 0;
        }
      }
      else
      {
        unsigned int v77 = *v46;
        *((void *)a2 + 1) = v46 + 1;
      }
      int v47 = *((_DWORD *)a2 + 14);
      int v48 = *((_DWORD *)a2 + 15);
      *((_DWORD *)a2 + 14) = v47 + 1;
      if (v47 >= v48) {
        return 0;
      }
      wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(a2);
      if (!awd::profile::ProcessingRule::MergePartialFromCodedStream(v45, a2) || !*((unsigned char *)a2 + 36)) {
        return 0;
      }
      wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(a2);
      int v49 = *((_DWORD *)a2 + 14);
      BOOL v50 = __OFSUB__(v49, 1);
      int v51 = v49 - 1;
      if (v51 < 0 == v50) {
        *((_DWORD *)a2 + 14) = v51;
      }
      uint64_t v41 = (unsigned char *)*((void *)a2 + 1);
      if ((unint64_t)v41 >= *((void *)a2 + 2)) {
        goto LABEL_2;
      }
      int v52 = *v41;
    }
    while (v52 == 90);
    if (v52 == 98)
    {
      do
      {
        *((void *)a2 + 1) = v41 + 1;
LABEL_136:
        int v53 = *((_DWORD *)this + 21);
        uint64_t v54 = *((int *)this + 20);
        if ((int)v54 >= v53)
        {
          if (v53 == *((_DWORD *)this + 22))
          {
            wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v75);
            int v53 = *((_DWORD *)this + 21);
          }
          *((_DWORD *)this + 21) = v53 + 1;
          operator new();
        }
        uint64_t v55 = *((void *)this + 9);
        *((_DWORD *)this + 20) = v54 + 1;
        uint64_t v56 = *(awd::profile::BedfConfig **)(v55 + 8 * v54);
        unsigned int v77 = 0;
        v57 = (char *)*((void *)a2 + 1);
        if ((unint64_t)v57 >= *((void *)a2 + 2) || *v57 < 0)
        {
          if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v77))return 0; {
        }
          }
        else
        {
          unsigned int v77 = *v57;
          *((void *)a2 + 1) = v57 + 1;
        }
        int v58 = *((_DWORD *)a2 + 14);
        int v59 = *((_DWORD *)a2 + 15);
        *((_DWORD *)a2 + 14) = v58 + 1;
        if (v58 >= v59) {
          return 0;
        }
        wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(a2);
        if (!awd::profile::BedfConfig::MergePartialFromCodedStream(v56, a2) || !*((unsigned char *)a2 + 36)) {
          return 0;
        }
        wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(a2);
        int v60 = *((_DWORD *)a2 + 14);
        BOOL v50 = __OFSUB__(v60, 1);
        int v61 = v60 - 1;
        if (v61 < 0 == v50) {
          *((_DWORD *)a2 + 14) = v61;
        }
        uint64_t v41 = (unsigned char *)*((void *)a2 + 1);
        unint64_t v25 = *((void *)a2 + 2);
        if ((unint64_t)v41 >= v25) {
          goto LABEL_2;
        }
        int v62 = *v41;
      }
      while (v62 == 98);
      if (v62 == 104)
      {
        int v26 = v41 + 1;
        *((void *)a2 + 1) = v26;
LABEL_154:
        if ((unint64_t)v26 < v25 && (*v26 & 0x80000000) == 0)
        {
          unsigned int *v8 = *v26;
          v63 = v26 + 1;
          *((void *)a2 + 1) = v63;
          goto LABEL_159;
        }
        uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v8);
        if (!result) {
          return result;
        }
        v63 = (unsigned char *)*((void *)a2 + 1);
        unint64_t v25 = *((void *)a2 + 2);
LABEL_159:
        *((_DWORD *)this + 32) |= 0x1000u;
        if ((unint64_t)v63 < v25 && *v63 == 114)
        {
          do
          {
            *((void *)a2 + 1) = v63 + 1;
LABEL_162:
            int v64 = *((_DWORD *)this + 27);
            uint64_t v65 = *((int *)this + 26);
            if ((int)v65 >= v64)
            {
              if (v64 == *((_DWORD *)this + 28))
              {
                wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v9);
                int v64 = *((_DWORD *)this + 27);
              }
              *((_DWORD *)this + 27) = v64 + 1;
              operator new();
            }
            uint64_t v66 = *((void *)this + 12);
            *((_DWORD *)this + 26) = v65 + 1;
            int64x2_t v67 = *(awd::profile::ConfigurationParameter **)(v66 + 8 * v65);
            unsigned int v77 = 0;
            v68 = (char *)*((void *)a2 + 1);
            if ((unint64_t)v68 >= *((void *)a2 + 2) || *v68 < 0)
            {
              if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v77))return 0; {
            }
              }
            else
            {
              unsigned int v77 = *v68;
              *((void *)a2 + 1) = v68 + 1;
            }
            int v69 = *((_DWORD *)a2 + 14);
            int v70 = *((_DWORD *)a2 + 15);
            *((_DWORD *)a2 + 14) = v69 + 1;
            if (v69 >= v70) {
              return 0;
            }
            wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(a2);
            if (!awd::profile::ConfigurationParameter::MergePartialFromCodedStream(v67, a2)
              || !*((unsigned char *)a2 + 36))
            {
              return 0;
            }
            wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(a2);
            int v71 = *((_DWORD *)a2 + 14);
            BOOL v50 = __OFSUB__(v71, 1);
            int v72 = v71 - 1;
            if (v72 < 0 == v50) {
              *((_DWORD *)a2 + 14) = v72;
            }
            v63 = (unsigned char *)*((void *)a2 + 1);
            v73 = (unsigned char *)*((void *)a2 + 2);
          }
          while (v63 < v73 && *v63 == 114);
          if (v63 == v73 && (*((_DWORD *)a2 + 11) || *((_DWORD *)a2 + 6) == *((_DWORD *)a2 + 10)))
          {
            *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
            uint64_t result = 1;
            *((unsigned char *)a2 + 36) = 1;
            return result;
          }
        }
      }
    }
  }
  unint64_t TagFallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(a2);
  *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = TagFallback;
  if (TagFallback) {
    goto LABEL_7;
  }
  return 1;
}

uint64_t awd::profile::Metric::SerializeWithCachedSizes(uint64_t this, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  uint64_t v5 = this;
  int v6 = *(_DWORD *)(this + 128);
  if (v6)
  {
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)1, *(unsigned int *)(this + 8), (uint64_t)a2, a4);
    int v6 = *(_DWORD *)(v5 + 128);
    if ((v6 & 2) == 0)
    {
LABEL_3:
      if ((v6 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_26;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_3;
  }
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)2, *(unsigned int *)(v5 + 12), (uint64_t)a2, a4);
  int v6 = *(_DWORD *)(v5 + 128);
  if ((v6 & 4) == 0)
  {
LABEL_4:
    if ((v6 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_27;
  }
LABEL_26:
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteSInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)3, *(unsigned int *)(v5 + 16), (uint64_t)a2, a4);
  int v6 = *(_DWORD *)(v5 + 128);
  if ((v6 & 8) == 0)
  {
LABEL_5:
    if ((v6 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_28;
  }
LABEL_27:
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteSInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)4, *(unsigned int *)(v5 + 20), (uint64_t)a2, a4);
  int v6 = *(_DWORD *)(v5 + 128);
  if ((v6 & 0x10) == 0)
  {
LABEL_6:
    if ((v6 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_29;
  }
LABEL_28:
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)5, *(unsigned int *)(v5 + 24), (uint64_t)a2, a4);
  int v6 = *(_DWORD *)(v5 + 128);
  if ((v6 & 0x20) == 0)
  {
LABEL_7:
    if ((v6 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_30;
  }
LABEL_29:
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)6, *(unsigned int *)(v5 + 28), (uint64_t)a2, a4);
  int v6 = *(_DWORD *)(v5 + 128);
  if ((v6 & 0x40) == 0)
  {
LABEL_8:
    if ((v6 & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_31;
  }
LABEL_30:
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)7, *(unsigned int *)(v5 + 32), (uint64_t)a2, a4);
  int v6 = *(_DWORD *)(v5 + 128);
  if ((v6 & 0x80) == 0)
  {
LABEL_9:
    if ((v6 & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_32;
  }
LABEL_31:
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)8, *(unsigned int *)(v5 + 36), (uint64_t)a2, a4);
  int v6 = *(_DWORD *)(v5 + 128);
  if ((v6 & 0x100) == 0)
  {
LABEL_10:
    if ((v6 & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_32:
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBool((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)9, *(unsigned __int8 *)(v5 + 40), (uint64_t)a2, a4);
  if ((*(_DWORD *)(v5 + 128) & 0x200) != 0) {
LABEL_11:
  }
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)0xA, *(unsigned int *)(v5 + 44), (uint64_t)a2, a4);
LABEL_12:
  if (*(int *)(v5 + 56) >= 1)
  {
    uint64_t v7 = 0;
    do
      this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)0xB, *(void *)(*(void *)(v5 + 48) + 8 * v7++), a2, a4);
    while (v7 < *(int *)(v5 + 56));
  }
  if (*(int *)(v5 + 80) >= 1)
  {
    uint64_t v8 = 0;
    do
      this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)0xC, *(void *)(*(void *)(v5 + 72) + 8 * v8++), a2, a4);
    while (v8 < *(int *)(v5 + 80));
  }
  if ((*(unsigned char *)(v5 + 129) & 0x10) != 0) {
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)0xD, *(unsigned int *)(v5 + 120), (uint64_t)a2, a4);
  }
  if (*(int *)(v5 + 104) >= 1)
  {
    uint64_t v9 = 0;
    do
      this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)0xE, *(void *)(*(void *)(v5 + 96) + 8 * v9++), a2, a4);
    while (v9 < *(int *)(v5 + 104));
  }
  return this;
}

uint64_t awd::profile::Metric::ByteSize(awd::profile::Metric *this)
{
  int v2 = *((_DWORD *)this + 32);
  if (!(_BYTE)v2)
  {
    int v3 = 0;
    goto LABEL_49;
  }
  if ((v2 & 1) == 0)
  {
    int v3 = 0;
    if ((v2 & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_10;
  }
  uint64_t v4 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 2);
  if (v4 >= 0x80)
  {
    int v5 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v4);
    int v2 = *((_DWORD *)this + 32);
  }
  else
  {
    int v5 = 1;
  }
  int v3 = v5 + 1;
  if ((v2 & 2) != 0)
  {
LABEL_10:
    int v6 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 3);
    if (v6 >= 0x80)
    {
      int v7 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v6);
      int v2 = *((_DWORD *)this + 32);
    }
    else
    {
      int v7 = 1;
    }
    v3 += v7 + 1;
  }
LABEL_14:
  if ((v2 & 4) != 0)
  {
    uint64_t v8 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)((2 * *((_DWORD *)this + 4)) ^ (*((int *)this + 4) >> 31));
    if (v8 >= 0x80)
    {
      int v9 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v8);
      int v2 = *((_DWORD *)this + 32);
    }
    else
    {
      int v9 = 1;
    }
    v3 += v9 + 1;
    if ((v2 & 8) == 0)
    {
LABEL_16:
      if ((v2 & 0x10) == 0) {
        goto LABEL_17;
      }
      goto LABEL_29;
    }
  }
  else if ((v2 & 8) == 0)
  {
    goto LABEL_16;
  }
  int v10 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)((2 * *((_DWORD *)this + 5)) ^ (*((int *)this + 5) >> 31));
  if (v10 >= 0x80)
  {
    int v11 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v10);
    int v2 = *((_DWORD *)this + 32);
  }
  else
  {
    int v11 = 1;
  }
  v3 += v11 + 1;
  if ((v2 & 0x10) == 0)
  {
LABEL_17:
    if ((v2 & 0x20) == 0) {
      goto LABEL_18;
    }
    goto LABEL_33;
  }
LABEL_29:
  int v12 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 6);
  if (v12 >= 0x80)
  {
    int v13 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v12);
    int v2 = *((_DWORD *)this + 32);
  }
  else
  {
    int v13 = 1;
  }
  v3 += v13 + 1;
  if ((v2 & 0x20) == 0)
  {
LABEL_18:
    if ((v2 & 0x40) == 0) {
      goto LABEL_19;
    }
    goto LABEL_37;
  }
LABEL_33:
  uint64_t v14 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 7);
  if (v14 >= 0x80)
  {
    int v15 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v14);
    int v2 = *((_DWORD *)this + 32);
  }
  else
  {
    int v15 = 1;
  }
  v3 += v15 + 1;
  if ((v2 & 0x40) == 0)
  {
LABEL_19:
    if ((v2 & 0x80) == 0) {
      goto LABEL_49;
    }
    goto LABEL_43;
  }
LABEL_37:
  int v16 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 8);
  if ((v16 & 0x80000000) != 0)
  {
    int v17 = 11;
  }
  else if (v16 >= 0x80)
  {
    int v17 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v16) + 1;
    int v2 = *((_DWORD *)this + 32);
  }
  else
  {
    int v17 = 2;
  }
  v3 += v17;
  if ((v2 & 0x80) != 0)
  {
LABEL_43:
    uint64_t v18 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 9);
    if ((v18 & 0x80000000) != 0)
    {
      int v19 = 11;
    }
    else if (v18 >= 0x80)
    {
      int v19 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v18) + 1;
      int v2 = *((_DWORD *)this + 32);
    }
    else
    {
      int v19 = 2;
    }
    v3 += v19;
  }
LABEL_49:
  if ((v2 & 0xFF00) != 0)
  {
    if ((v2 & 0x100) != 0) {
      v3 += 2;
    }
    if ((v2 & 0x200) != 0)
    {
      int v20 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 11);
      if (v20 >= 0x80)
      {
        int v21 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v20) + 1;
        int v2 = *((_DWORD *)this + 32);
      }
      else
      {
        int v21 = 2;
      }
      v3 += v21;
    }
    if ((v2 & 0x1000) != 0)
    {
      int v22 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 30);
      if (v22 >= 0x80) {
        int v23 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v22) + 1;
      }
      else {
        int v23 = 2;
      }
      v3 += v23;
    }
  }
  int v24 = *((_DWORD *)this + 14);
  int v25 = v24 + v3;
  if (v24 >= 1)
  {
    uint64_t v26 = 0;
    do
    {
      int v27 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)awd::profile::ProcessingRule::ByteSize(*(awd::profile::ProcessingRule **)(*((void *)this + 6) + 8 * v26));
      int v28 = (int)v27;
      if (v27 >= 0x80) {
        int v29 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v27);
      }
      else {
        int v29 = 1;
      }
      v25 += v28 + v29;
      ++v26;
    }
    while (v26 < *((int *)this + 14));
  }
  int v30 = *((_DWORD *)this + 20);
  int v31 = v30 + v25;
  if (v30 >= 1)
  {
    uint64_t v32 = 0;
    do
    {
      unint64_t v33 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)awd::profile::BedfConfig::ByteSize(*(awd::profile::BedfConfig **)(*((void *)this + 9) + 8 * v32));
      int v34 = (int)v33;
      if (v33 >= 0x80) {
        int v35 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v33);
      }
      else {
        int v35 = 1;
      }
      v31 += v34 + v35;
      ++v32;
    }
    while (v32 < *((int *)this + 20));
  }
  int v36 = *((_DWORD *)this + 26);
  uint64_t v37 = (v36 + v31);
  if (v36 >= 1)
  {
    uint64_t v38 = 0;
    do
    {
      unsigned int v39 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)awd::profile::ConfigurationParameter::ByteSize(*(awd::profile::ConfigurationParameter **)(*((void *)this + 12) + 8 * v38));
      int v40 = (int)v39;
      if (v39 >= 0x80) {
        int v41 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v39);
      }
      else {
        int v41 = 1;
      }
      uint64_t v37 = (v40 + v37 + v41);
      ++v38;
    }
    while (v38 < *((int *)this + 26));
  }
  *((_DWORD *)this + 31) = v37;
  return v37;
}

void awd::profile::Metric::CopyFrom(awd::profile::Metric *this, const awd::profile::Metric *a2)
{
  if (a2 != this)
  {
    (*(void (**)(awd::profile::Metric *))(*(void *)this + 32))(this);
    awd::profile::Metric::MergeFrom(this, a2);
  }
}

uint64_t awd::profile::Metric::IsInitialized(awd::profile::Metric *this)
{
  return 1;
}

uint64_t awd::profile::Metric::Swap(uint64_t this, awd::profile::Metric *a2)
{
  if (a2 != (awd::profile::Metric *)this)
  {
    int v3 = (_DWORD *)this;
    int v4 = *(_DWORD *)(this + 8);
    *(_DWORD *)(this + MEMORY[0x1D9440F90]((char *)this + 8) = *((_DWORD *)a2 + 2);
    *((_DWORD *)a2 + 2) = v4;
    int v5 = *(_DWORD *)(this + 12);
    *(_DWORD *)(this + 12) = *((_DWORD *)a2 + 3);
    *((_DWORD *)a2 + 3) = v5;
    int v6 = *(_DWORD *)(this + 16);
    *(_DWORD *)(this + 16) = *((_DWORD *)a2 + 4);
    *((_DWORD *)a2 + 4) = v6;
    int v7 = *(_DWORD *)(this + 20);
    *(_DWORD *)(this + 20) = *((_DWORD *)a2 + 5);
    *((_DWORD *)a2 + 5) = v7;
    int v8 = *(_DWORD *)(this + 24);
    *(_DWORD *)(this + 24) = *((_DWORD *)a2 + 6);
    *((_DWORD *)a2 + 6) = v8;
    int v9 = *(_DWORD *)(this + 28);
    *(_DWORD *)(this + 2MEMORY[0x1D9440F90]((char *)this + 8) = *((_DWORD *)a2 + 7);
    *((_DWORD *)a2 + 7) = v9;
    int v10 = *(_DWORD *)(this + 32);
    *(_DWORD *)(this + 32) = *((_DWORD *)a2 + 8);
    *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = v10;
    int v11 = *(_DWORD *)(this + 36);
    *(_DWORD *)(this + 36) = *((_DWORD *)a2 + 9);
    *((_DWORD *)a2 + 9) = v11;
    LOBYTE(v11) = *(unsigned char *)(this + 40);
    *(unsigned char *)(this + 40) = *((unsigned char *)a2 + 40);
    *((unsigned char *)a2 + 40) = v11;
    int v12 = *(_DWORD *)(this + 44);
    *(_DWORD *)(this + 44) = *((_DWORD *)a2 + 11);
    *((_DWORD *)a2 + 11) = v12;
    wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Swap();
    wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Swap();
    int v13 = v3[30];
    v3[30] = *((_DWORD *)a2 + 30);
    *((_DWORD *)a2 + 30) = v13;
    this = wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Swap();
    int v14 = v3[32];
    v3[32] = *((_DWORD *)a2 + 32);
    *((_DWORD *)a2 + 32) = v14;
    int v15 = v3[31];
    v3[31] = *((_DWORD *)a2 + 31);
    *((_DWORD *)a2 + 31) = v15;
  }
  return this;
}

void *awd::profile::Metric::GetTypeName@<X0>(void *a1@<X8>)
{
  return sub_1D3E270D0(a1, "awd.profile.Metric");
}

double awd::profile::Profile::SharedCtor(awd::profile::Profile *this)
{
  double result = 0.0;
  *((void *)this + 1) = 0;
  *((void *)this + 4) = 0;
  *((_DWORD *)this + 2MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  *((unsigned char *)this + 116) = 0;
  *((void *)this + 9) = 0;
  *((void *)this + 10) = 0;
  *((void *)this + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  *((void *)this + 15) = MEMORY[0x1E4FBA920];
  *((void *)this + 16) = 0;
  return result;
}

uint64_t awd::profile::Log::default_instance(awd::profile::Log *this, uint64_t a2, uint64_t a3, const char *a4)
{
  uint64_t result = awd::profile::Log::default_instance_;
  if (!awd::profile::Log::default_instance_)
  {
    awd::profile::protobuf_AddDesc_AwdProfile_2eproto(0, a2, a3, a4);
    return awd::profile::Log::default_instance_;
  }
  return result;
}

awd::profile::Profile *awd::profile::Profile::Profile(awd::profile::Profile *this, const awd::profile::Profile *a2)
{
  *(void *)this = &unk_1F2B9B680;
  *(_OWORD *)((char *)this + 40) = 0u;
  *((_DWORD *)this + 2MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  *((unsigned char *)this + 116) = 0;
  *(_OWORD *)((char *)this + MEMORY[0x1D9440F90]((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((_DWORD *)this + 14) = 0;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *(_OWORD *)((char *)this + 92) = 0u;
  *((void *)this + 15) = MEMORY[0x1E4FBA920];
  *((void *)this + 16) = 0;
  awd::profile::Profile::MergeFrom(this, a2);
  return this;
}

void sub_1D3E40750(_Unwind_Exception *a1)
{
  sub_1D3E4D914(v1 + 22);
  sub_1D3E4D870(v3);
  sub_1D3E4DE4C(v2);
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite((wireless_diagnostics::google::protobuf::MessageLite *)v1);
  _Unwind_Resume(a1);
}

void awd::profile::Profile::MergeFrom(awd::profile::Profile *this, const awd::profile::Profile *a2)
{
  if (a2 == this)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v29);
  }
  int v4 = *((_DWORD *)a2 + 6);
  if (v4)
  {
    sub_1D3E4D664((uint64_t)this + 16, *((_DWORD *)this + 6) + v4);
    memcpy((void *)(*((void *)this + 2) + 4 * *((int *)this + 6)), *((const void **)a2 + 2), 4 * *((int *)a2 + 6));
    *((_DWORD *)this + 6) += *((_DWORD *)a2 + 6);
  }
  sub_1D3E4D994((int *)this + 10, (uint64_t)a2 + 40);
  int v5 = (wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase *)wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((awd::profile::Profile *)((char *)this + 88));
  if (*((int *)a2 + 24) >= 1)
  {
    uint64_t v6 = 0;
    do
    {
      int v7 = *(const std::string **)(*((void *)a2 + 11) + 8 * v6);
      int v8 = *((_DWORD *)this + 25);
      uint64_t v9 = *((int *)this + 24);
      if ((int)v9 >= v8)
      {
        if (v8 == *((_DWORD *)this + 26))
        {
          int v5 = (wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase *)wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((awd::profile::Profile *)((char *)this + 88));
          int v8 = *((_DWORD *)this + 25);
        }
        *((_DWORD *)this + 25) = v8 + 1;
        int v11 = (std::string *)wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase::New(v5);
        uint64_t v12 = *((void *)this + 11);
        uint64_t v13 = *((int *)this + 24);
        *((_DWORD *)this + 24) = v13 + 1;
        *(void *)(v12 + 8 * v13) = v11;
      }
      else
      {
        uint64_t v10 = *((void *)this + 11);
        *((_DWORD *)this + 24) = v9 + 1;
        int v11 = *(std::string **)(v10 + 8 * v9);
      }
      int v5 = (wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase *)std::string::operator=(v11, v7);
      ++v6;
    }
    while (v6 < *((int *)a2 + 24));
  }
  int v14 = *((_DWORD *)a2 + 33);
  if ((_BYTE)v14)
  {
    if (v14)
    {
      int v15 = *((_DWORD *)a2 + 2);
      *((_DWORD *)this + 33) |= 1u;
      *((_DWORD *)this + 2) = v15;
      int v14 = *((_DWORD *)a2 + 33);
      if ((v14 & 2) == 0)
      {
LABEL_16:
        if ((v14 & 8) == 0) {
          goto LABEL_17;
        }
        goto LABEL_23;
      }
    }
    else if ((v14 & 2) == 0)
    {
      goto LABEL_16;
    }
    int v16 = *((_DWORD *)a2 + 3);
    *((_DWORD *)this + 33) |= 2u;
    *((_DWORD *)this + 3) = v16;
    int v14 = *((_DWORD *)a2 + 33);
    if ((v14 & 8) == 0)
    {
LABEL_17:
      if ((v14 & 0x10) == 0) {
        goto LABEL_18;
      }
      goto LABEL_24;
    }
LABEL_23:
    int v17 = *((_DWORD *)a2 + 8);
    *((_DWORD *)this + 33) |= 8u;
    *((_DWORD *)this + MEMORY[0x1D9440F90]((char *)this + 8) = v17;
    int v14 = *((_DWORD *)a2 + 33);
    if ((v14 & 0x10) == 0)
    {
LABEL_18:
      if ((v14 & 0x20) == 0) {
        goto LABEL_19;
      }
      goto LABEL_25;
    }
LABEL_24:
    int v18 = *((_DWORD *)a2 + 9);
    *((_DWORD *)this + 33) |= 0x10u;
    *((_DWORD *)this + 9) = v18;
    int v14 = *((_DWORD *)a2 + 33);
    if ((v14 & 0x20) == 0)
    {
LABEL_19:
      if ((v14 & 0x80) == 0) {
        goto LABEL_31;
      }
      goto LABEL_26;
    }
LABEL_25:
    int v19 = *((_DWORD *)a2 + 16);
    *((_DWORD *)this + 33) |= 0x20u;
    *((_DWORD *)this + 16) = v19;
    int v14 = *((_DWORD *)a2 + 33);
    if ((v14 & 0x80) == 0) {
      goto LABEL_31;
    }
LABEL_26:
    *((_DWORD *)this + 33) |= 0x80u;
    int v20 = (awd::profile::Log *)*((void *)this + 9);
    if (!v20) {
      operator new();
    }
    int v21 = (const awd::profile::Log *)*((void *)a2 + 9);
    if (!v21) {
      int v21 = *(const awd::profile::Log **)(awd::profile::Profile::default_instance_ + 72);
    }
    awd::profile::Log::MergeFrom(v20, v21);
    int v14 = *((_DWORD *)a2 + 33);
  }
LABEL_31:
  if ((v14 & 0xFF00) == 0) {
    return;
  }
  if ((v14 & 0x100) != 0)
  {
    int v22 = *((_DWORD *)a2 + 17);
    *((_DWORD *)this + 33) |= 0x100u;
    *((_DWORD *)this + 17) = v22;
    int v14 = *((_DWORD *)a2 + 33);
    if ((v14 & 0x200) == 0)
    {
LABEL_34:
      if ((v14 & 0x400) == 0) {
        goto LABEL_35;
      }
      goto LABEL_41;
    }
  }
  else if ((v14 & 0x200) == 0)
  {
    goto LABEL_34;
  }
  int v23 = *((_DWORD *)a2 + 20);
  *((_DWORD *)this + 33) |= 0x200u;
  *((_DWORD *)this + 20) = v23;
  int v14 = *((_DWORD *)a2 + 33);
  if ((v14 & 0x400) == 0)
  {
LABEL_35:
    if ((v14 & 0x800) == 0) {
      goto LABEL_36;
    }
    goto LABEL_42;
  }
LABEL_41:
  int v24 = *((_DWORD *)a2 + 21);
  *((_DWORD *)this + 33) |= 0x400u;
  *((_DWORD *)this + 21) = v24;
  int v14 = *((_DWORD *)a2 + 33);
  if ((v14 & 0x800) == 0)
  {
LABEL_36:
    if ((v14 & 0x2000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_43;
  }
LABEL_42:
  int v25 = *((_DWORD *)a2 + 28);
  *((_DWORD *)this + 33) |= 0x800u;
  *((_DWORD *)this + 2MEMORY[0x1D9440F90]((char *)this + 8) = v25;
  int v14 = *((_DWORD *)a2 + 33);
  if ((v14 & 0x2000) == 0)
  {
LABEL_37:
    if ((v14 & 0x4000) == 0) {
      return;
    }
    goto LABEL_44;
  }
LABEL_43:
  char v26 = *((unsigned char *)a2 + 116);
  *((_DWORD *)this + 33) |= 0x2000u;
  *((unsigned char *)this + 116) = v26;
  if ((*((_DWORD *)a2 + 33) & 0x4000) == 0) {
    return;
  }
LABEL_44:
  int v27 = (const std::string *)*((void *)a2 + 15);
  *((_DWORD *)this + 33) |= 0x4000u;
  int v28 = (std::string *)*((void *)this + 15);
  if (v28 == (std::string *)MEMORY[0x1E4FBA920]) {
    operator new();
  }
  std::string::operator=(v28, v27);
}

void sub_1D3E40B24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)va);
  _Unwind_Resume(a1);
}

void awd::profile::Profile::~Profile(awd::profile::Profile *this)
{
  *(void *)this = &unk_1F2B9B680;
  uint64_t v2 = (int *)((char *)this + 88);
  awd::profile::Profile::SharedDtor(this);
  sub_1D3E4D914(v2);
  sub_1D3E4D870((uint64_t *)this + 5);
  uint64_t v3 = *((void *)this + 2);
  if (v3) {
    MEMORY[0x1D94412D0](v3, 0x1000C8052888210);
  }
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(this);
}

{
  uint64_t vars8;

  awd::profile::Profile::~Profile(this);
  JUMPOUT(0x1D94412F0);
}

void *awd::profile::Profile::SharedDtor(void *this)
{
  uint64_t v1 = this;
  uint64_t v2 = this[15];
  if (v2 != MEMORY[0x1E4FBA920] && v2 != 0)
  {
    if (*(char *)(v2 + 23) < 0) {
      operator delete(*(void **)v2);
    }
    this = (void *)MEMORY[0x1D94412F0](v2, 0x1012C40EC159624);
  }
  if ((void *)awd::profile::Profile::default_instance_ != v1)
  {
    this = (void *)v1[9];
    if (this)
    {
      int v4 = *(uint64_t (**)(void))(*this + 8);
      return (void *)v4();
    }
  }
  return this;
}

uint64_t awd::profile::Profile::SetCachedSize(uint64_t this, int a2)
{
  *(_DWORD *)(this + 12MEMORY[0x1D9440F90]((char *)this + 8) = a2;
  return this;
}

uint64_t awd::profile::Profile::default_instance(awd::profile::Profile *this, uint64_t a2, uint64_t a3, const char *a4)
{
  uint64_t result = awd::profile::Profile::default_instance_;
  if (!awd::profile::Profile::default_instance_)
  {
    awd::profile::protobuf_AddDesc_AwdProfile_2eproto(0, a2, a3, a4);
    return awd::profile::Profile::default_instance_;
  }
  return result;
}

void awd::profile::Profile::New(awd::profile::Profile *this)
{
}

uint64_t awd::profile::Profile::Clear(awd::profile::Profile *this)
{
  int v2 = *((_DWORD *)this + 33);
  if ((_BYTE)v2)
  {
    *((void *)this + 1) = 0;
    *((void *)this + 4) = 0;
    *((_DWORD *)this + 16) = 0;
    if ((v2 & 0x80) != 0)
    {
      uint64_t v3 = *((void *)this + 9);
      if (v3)
      {
        sub_1D3E4D7B0(v3 + 8);
        *(_DWORD *)(v3 + 36) = 0;
        int v2 = *((_DWORD *)this + 33);
      }
    }
  }
  if ((v2 & 0xFF00) != 0)
  {
    *((_DWORD *)this + 17) = 0;
    *((void *)this + 10) = 0;
    *((_DWORD *)this + 2MEMORY[0x1D9440F90]((char *)this + 8) = 0;
    *((unsigned char *)this + 116) = 0;
    if ((v2 & 0x4000) != 0)
    {
      uint64_t v4 = *((void *)this + 15);
      if (v4 != MEMORY[0x1E4FBA920])
      {
        if (*(char *)(v4 + 23) < 0)
        {
          **(unsigned char **)uint64_t v4 = 0;
          *(void *)(v4 + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
        }
        else
        {
          *(unsigned char *)uint64_t v4 = 0;
          *(unsigned char *)(v4 + 23) = 0;
        }
      }
    }
  }
  *((_DWORD *)this + 6) = 0;
  sub_1D3E4D7B0((uint64_t)this + 40);
  uint64_t result = sub_1D3E4D820((uint64_t)this + 88);
  *((_DWORD *)this + 33) = 0;
  return result;
}

uint64_t awd::profile::Log::Clear(awd::profile::Log *this)
{
  uint64_t result = sub_1D3E4D7B0((uint64_t)this + 8);
  *((_DWORD *)this + 9) = 0;
  return result;
}

uint64_t awd::profile::Profile::MergePartialFromCodedStream(uint64_t this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2)
{
  uint64_t v3 = this;
  uint64_t v4 = (uint64_t *)(this + 16);
  unsigned int v77 = (unsigned int *)(this + 8);
  CFDictionaryRef v78 = (unsigned int *)(this + 12);
  int v5 = (unsigned int *)(this + 32);
  uint64_t v6 = (unsigned int *)(this + 68);
  int v7 = (unsigned int *)(this + 80);
  int v8 = (unsigned int *)(this + 84);
  uint64_t v9 = (unsigned int *)(this + 112);
  v75 = (wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *)(this + 88);
  v76 = (wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *)(this + 40);
LABEL_2:
  while (2)
  {
    uint64_t v10 = (char *)*((void *)a2 + 1);
    if ((unint64_t)v10 >= *((void *)a2 + 2) || *v10 < 0)
    {
      this = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(a2);
      int v11 = (wireless_diagnostics::google::protobuf::io::CodedInputStream *)this;
      *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = this;
      if (!this) {
        return 1;
      }
    }
    else
    {
      int v11 = (wireless_diagnostics::google::protobuf::io::CodedInputStream *)*v10;
      *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = v11;
      *((void *)a2 + 1) = v10 + 1;
      if (!v11) {
        return 1;
      }
    }
    switch(v11 >> 3)
    {
      case 1u:
        int v12 = v11 & 7;
        if ((v11 & 7) != 0) {
          goto LABEL_42;
        }
        int v14 = (char *)*((void *)a2 + 1);
        unint64_t v13 = *((void *)a2 + 2);
        if ((unint64_t)v14 >= v13 || *v14 < 0)
        {
          this = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v77);
          if (!this) {
            return this;
          }
          int v15 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v13 = *((void *)a2 + 2);
        }
        else
        {
          unsigned int *v77 = *v14;
          int v15 = v14 + 1;
          *((void *)a2 + 1) = v15;
        }
        *(_DWORD *)(v3 + 132) |= 1u;
        if ((unint64_t)v15 < v13 && *v15 == 24)
        {
          int v16 = v15 + 1;
          *((void *)a2 + 1) = v16;
          goto LABEL_52;
        }
        continue;
      case 3u:
        int v12 = v11 & 7;
        if ((v11 & 7) != 0) {
          goto LABEL_42;
        }
        int v16 = (unsigned __int8 *)*((void *)a2 + 1);
        unint64_t v13 = *((void *)a2 + 2);
LABEL_52:
        if ((unint64_t)v16 >= v13 || (char)*v16 < 0)
        {
          this = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v78);
          if (!this) {
            return this;
          }
          int v29 = (unsigned __int8 *)*((void *)a2 + 1);
          unint64_t v13 = *((void *)a2 + 2);
        }
        else
        {
          *CFDictionaryRef v78 = *v16;
          int v29 = v16 + 1;
          *((void *)a2 + 1) = v29;
        }
        *(_DWORD *)(v3 + 132) |= 2u;
        if ((unint64_t)v29 < v13)
        {
          int v30 = *v29;
          goto LABEL_77;
        }
        continue;
      case 4u:
        int v12 = v11 & 7;
        if (v12 != 2)
        {
          if ((v11 & 7) == 0)
          {
            int v17 = (char *)*((void *)a2 + 1);
            unint64_t v13 = *((void *)a2 + 2);
            goto LABEL_59;
          }
LABEL_42:
          if (v12 == 4) {
            return 1;
          }
          this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipField(a2, v11);
          if ((this & 1) == 0) {
            return 0;
          }
          continue;
        }
        this = sub_1D3E41A0C(a2, (uint64_t)v4);
        if (!this) {
          return this;
        }
        while (1)
        {
          int v29 = (unsigned __int8 *)*((void *)a2 + 1);
          unint64_t v13 = *((void *)a2 + 2);
          if ((unint64_t)v29 >= v13) {
            goto LABEL_2;
          }
          int v30 = *v29;
          if (v30 == 40) {
            break;
          }
LABEL_77:
          if (v30 != 32) {
            goto LABEL_2;
          }
          int v17 = (char *)(v29 + 1);
          *((void *)a2 + 1) = v17;
LABEL_59:
          unsigned int v79 = 0;
          if ((unint64_t)v17 >= v13 || *v17 < 0)
          {
            this = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v79);
            if (!this) {
              return 0;
            }
          }
          else
          {
            unsigned int v79 = *v17;
            *((void *)a2 + 1) = v17 + 1;
          }
          int v31 = *(_DWORD *)(v3 + 24);
          if (v31 == *(_DWORD *)(v3 + 28))
          {
            this = sub_1D3E4D664((uint64_t)v4, v31 + 1);
            int v31 = *(_DWORD *)(v3 + 24);
          }
          unsigned int v32 = v79;
          uint64_t v33 = *(void *)(v3 + 16);
          *(_DWORD *)(v3 + 24) = v31 + 1;
          *(_DWORD *)(v33 + 4 * v31) = v32;
          int v34 = *(_DWORD *)(v3 + 28) - *(_DWORD *)(v3 + 24);
          if (v34 >= 1)
          {
            int v35 = v34 + 1;
            do
            {
              int v36 = (unsigned char *)*((void *)a2 + 1);
              unint64_t v37 = *((void *)a2 + 2);
              if ((unint64_t)v36 >= v37 || *v36 != 32) {
                break;
              }
              *((void *)a2 + 1) = v36 + 1;
              if ((unint64_t)(v36 + 1) >= v37 || (char)v36[1] < 0)
              {
                this = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v79);
                if (!this) {
                  return 0;
                }
                unsigned int v38 = v79;
                uint64_t v33 = *v4;
              }
              else
              {
                unsigned int v38 = v36[1];
                unsigned int v79 = v38;
                *((void *)a2 + 1) = v36 + 2;
              }
              uint64_t v39 = *(int *)(v3 + 24);
              *(_DWORD *)(v3 + 24) = v39 + 1;
              *(_DWORD *)(v33 + 4 * v39) = v38;
              --v35;
            }
            while (v35 > 1);
          }
        }
        int v18 = (char *)(v29 + 1);
        *((void *)a2 + 1) = v18;
LABEL_80:
        if ((unint64_t)v18 >= v13 || *v18 < 0)
        {
          this = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v5);
          if (!this) {
            return this;
          }
          int v40 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v13 = *((void *)a2 + 2);
        }
        else
        {
          *int v5 = *v18;
          int v40 = v18 + 1;
          *((void *)a2 + 1) = v40;
        }
        *(_DWORD *)(v3 + 132) |= 8u;
        if ((unint64_t)v40 >= v13 || *v40 != 48) {
          continue;
        }
        int v19 = v40 + 1;
        *((void *)a2 + 1) = v19;
LABEL_88:
        unsigned int v79 = 0;
        if ((unint64_t)v19 >= v13 || *v19 < 0)
        {
          this = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v79);
          if (!this) {
            return this;
          }
          unsigned int v41 = v79;
          int v42 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v13 = *((void *)a2 + 2);
        }
        else
        {
          unsigned int v41 = *v19;
          int v42 = v19 + 1;
          *((void *)a2 + 1) = v42;
        }
        *(_DWORD *)(v3 + 36) = v41;
        *(_DWORD *)(v3 + 132) |= 0x10u;
        if ((unint64_t)v42 >= v13 || *v42 != 56) {
          continue;
        }
        int v20 = v42 + 1;
        *((void *)a2 + 1) = v20;
LABEL_96:
        unsigned int v79 = 0;
        if ((unint64_t)v20 >= v13 || *v20 < 0)
        {
          this = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v79);
          if (!this) {
            return this;
          }
          unsigned int v43 = v79;
          uint64_t v44 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v13 = *((void *)a2 + 2);
        }
        else
        {
          unsigned int v43 = *v20;
          uint64_t v44 = v20 + 1;
          *((void *)a2 + 1) = v44;
        }
        *(_DWORD *)(v3 + 64) = v43;
        *(_DWORD *)(v3 + 132) |= 0x20u;
        if ((unint64_t)v44 >= v13 || *v44 != 66) {
          continue;
        }
        do
        {
          *((void *)a2 + 1) = v44 + 1;
LABEL_104:
          int v45 = *(_DWORD *)(v3 + 52);
          uint64_t v46 = *(int *)(v3 + 48);
          if ((int)v46 >= v45)
          {
            if (v45 == *(_DWORD *)(v3 + 56))
            {
              wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v76);
              int v45 = *(_DWORD *)(v3 + 52);
            }
            *(_DWORD *)(v3 + 52) = v45 + 1;
            operator new();
          }
          uint64_t v47 = *(void *)(v3 + 40);
          *(_DWORD *)(v3 + 4MEMORY[0x1D9440F90]((char *)this + 8) = v46 + 1;
          int v48 = *(awd::profile::Metric **)(v47 + 8 * v46);
          unsigned int v79 = 0;
          int v49 = (char *)*((void *)a2 + 1);
          if ((unint64_t)v49 >= *((void *)a2 + 2) || *v49 < 0)
          {
            if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v79))return 0; {
          }
            }
          else
          {
            unsigned int v79 = *v49;
            *((void *)a2 + 1) = v49 + 1;
          }
          int v50 = *((_DWORD *)a2 + 14);
          int v51 = *((_DWORD *)a2 + 15);
          *((_DWORD *)a2 + 14) = v50 + 1;
          if (v50 >= v51) {
            return 0;
          }
          wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(a2);
          if (!awd::profile::Metric::MergePartialFromCodedStream(v48, a2) || !*((unsigned char *)a2 + 36)) {
            return 0;
          }
          this = wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(a2);
          int v52 = *((_DWORD *)a2 + 14);
          BOOL v53 = __OFSUB__(v52, 1);
          int v54 = v52 - 1;
          if (v54 < 0 == v53) {
            *((_DWORD *)a2 + 14) = v54;
          }
          uint64_t v44 = (unsigned char *)*((void *)a2 + 1);
          if ((unint64_t)v44 >= *((void *)a2 + 2)) {
            goto LABEL_2;
          }
          int v55 = *v44;
        }
        while (v55 == 66);
        if (v55 != 74) {
          continue;
        }
        *((void *)a2 + 1) = v44 + 1;
LABEL_122:
        *(_DWORD *)(v3 + 132) |= 0x80u;
        uint64_t v56 = *(awd::profile::Log **)(v3 + 72);
        if (!v56) {
          operator new();
        }
        unsigned int v79 = 0;
        v57 = (char *)*((void *)a2 + 1);
        if ((unint64_t)v57 >= *((void *)a2 + 2) || *v57 < 0)
        {
          if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v79))return 0; {
        }
          }
        else
        {
          unsigned int v79 = *v57;
          *((void *)a2 + 1) = v57 + 1;
        }
        int v58 = *((_DWORD *)a2 + 14);
        int v59 = *((_DWORD *)a2 + 15);
        *((_DWORD *)a2 + 14) = v58 + 1;
        if (v58 < v59)
        {
          wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(a2);
          if (awd::profile::Log::MergePartialFromCodedStream(v56, a2))
          {
            if (*((unsigned char *)a2 + 36))
            {
              this = wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(a2);
              int v60 = *((_DWORD *)a2 + 14);
              BOOL v53 = __OFSUB__(v60, 1);
              int v61 = v60 - 1;
              if (v61 < 0 == v53) {
                *((_DWORD *)a2 + 14) = v61;
              }
              int v62 = (unsigned char *)*((void *)a2 + 1);
              unint64_t v21 = *((void *)a2 + 2);
              if ((unint64_t)v62 < v21 && *v62 == 80)
              {
                int v22 = v62 + 1;
                *((void *)a2 + 1) = v22;
LABEL_136:
                if ((unint64_t)v22 >= v21 || *v22 < 0)
                {
                  this = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v6);
                  if (!this) {
                    return this;
                  }
                  v63 = (unsigned char *)*((void *)a2 + 1);
                  unint64_t v21 = *((void *)a2 + 2);
                }
                else
                {
                  unsigned int *v6 = *v22;
                  v63 = v22 + 1;
                  *((void *)a2 + 1) = v63;
                }
                *(_DWORD *)(v3 + 132) |= 0x100u;
                if ((unint64_t)v63 < v21 && *v63 == 88)
                {
                  int v23 = v63 + 1;
                  *((void *)a2 + 1) = v23;
LABEL_144:
                  if ((unint64_t)v23 >= v21 || *v23 < 0)
                  {
                    this = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v7);
                    if (!this) {
                      return this;
                    }
                    int v64 = (unsigned char *)*((void *)a2 + 1);
                    unint64_t v21 = *((void *)a2 + 2);
                  }
                  else
                  {
                    *int v7 = *v23;
                    int v64 = v23 + 1;
                    *((void *)a2 + 1) = v64;
                  }
                  *(_DWORD *)(v3 + 132) |= 0x200u;
                  if ((unint64_t)v64 < v21 && *v64 == 104)
                  {
                    int v24 = v64 + 1;
                    *((void *)a2 + 1) = v24;
LABEL_152:
                    if ((unint64_t)v24 >= v21 || (char)*v24 < 0)
                    {
                      this = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v8);
                      if (!this) {
                        return this;
                      }
                      uint64_t v65 = (unsigned __int8 *)*((void *)a2 + 1);
                      unint64_t v21 = *((void *)a2 + 2);
                    }
                    else
                    {
                      unsigned int *v8 = *v24;
                      uint64_t v65 = v24 + 1;
                      *((void *)a2 + 1) = v65;
                    }
                    *(_DWORD *)(v3 + 132) |= 0x400u;
                    if ((int)v21 - (int)v65 >= 2 && *v65 == 160 && v65[1] == 1)
                    {
                      int v25 = v65 + 2;
                      *((void *)a2 + 1) = v25;
LABEL_161:
                      if ((unint64_t)v25 >= v21 || (char)*v25 < 0)
                      {
                        this = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v9);
                        if (!this) {
                          return this;
                        }
                        uint64_t v66 = (unsigned __int8 *)*((void *)a2 + 1);
                        unint64_t v21 = *((void *)a2 + 2);
                      }
                      else
                      {
                        *uint64_t v9 = *v25;
                        uint64_t v66 = v25 + 1;
                        *((void *)a2 + 1) = v66;
                      }
                      *(_DWORD *)(v3 + 132) |= 0x800u;
                      if ((int)v21 - (int)v66 >= 2 && *v66 == 130 && v66[1] == 2)
                      {
                        while (1)
                        {
                          *((void *)a2 + 1) = v66 + 2;
LABEL_170:
                          int v67 = *(_DWORD *)(v3 + 100);
                          int v68 = *(_DWORD *)(v3 + 96);
                          if (v68 >= v67)
                          {
                            if (v67 == *(_DWORD *)(v3 + 104))
                            {
                              this = wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v75);
                              int v67 = *(_DWORD *)(v3 + 100);
                            }
                            *(_DWORD *)(v3 + 100) = v67 + 1;
                            uint64_t v69 = wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase::New((wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase *)this);
                            uint64_t v70 = *(void *)(v3 + 88);
                            uint64_t v71 = *(int *)(v3 + 96);
                            *(_DWORD *)(v3 + 96) = v71 + 1;
                            *(void *)(v70 + 8 * v71) = v69;
                          }
                          else
                          {
                            *(_DWORD *)(v3 + 96) = v68 + 1;
                          }
                          this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadString();
                          if (!this) {
                            return this;
                          }
                          uint64_t v66 = (unsigned __int8 *)*((void *)a2 + 1);
                          unint64_t v26 = *((void *)a2 + 2);
                          if ((int)v26 - (int)v66 < 2) {
                            goto LABEL_2;
                          }
                          int v72 = *v66;
                          if (v72 == 136) {
                            break;
                          }
                          if (v72 != 130 || v66[1] != 2) {
                            goto LABEL_2;
                          }
                        }
                        if (v66[1] == 2)
                        {
                          int v27 = v66 + 2;
                          *((void *)a2 + 1) = v27;
LABEL_183:
                          unsigned int v79 = 0;
                          if ((unint64_t)v27 >= v26 || (char)*v27 < 0)
                          {
                            this = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v79);
                            if (!this) {
                              return this;
                            }
                            unsigned int v73 = v79;
                            v74 = (unsigned __int8 *)*((void *)a2 + 1);
                            unint64_t v26 = *((void *)a2 + 2);
                          }
                          else
                          {
                            unsigned int v73 = *v27;
                            v74 = v27 + 1;
                            *((void *)a2 + 1) = v74;
                          }
                          *(unsigned char *)(v3 + 116) = v73 != 0;
                          int v28 = *(_DWORD *)(v3 + 132) | 0x2000;
                          *(_DWORD *)(v3 + 132) = v28;
                          if ((int)v26 - (int)v74 >= 2 && *v74 == 146 && v74[1] == 2)
                          {
                            *((void *)a2 + 1) = v74 + 2;
LABEL_192:
                            *(_DWORD *)(v3 + 132) = v28 | 0x4000;
                            if (*(void *)(v3 + 120) == MEMORY[0x1E4FBA920]) {
                              operator new();
                            }
                            this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadString();
                            if (!this) {
                              return this;
                            }
                            if (*((void *)a2 + 1) == *((void *)a2 + 2)
                              && (*((_DWORD *)a2 + 11) || *((_DWORD *)a2 + 6) == *((_DWORD *)a2 + 10)))
                            {
                              *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
                              this = 1;
                              *((unsigned char *)a2 + 36) = 1;
                              return this;
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
              continue;
            }
          }
        }
        return 0;
      case 5u:
        int v12 = v11 & 7;
        if ((v11 & 7) != 0) {
          goto LABEL_42;
        }
        int v18 = (char *)*((void *)a2 + 1);
        unint64_t v13 = *((void *)a2 + 2);
        goto LABEL_80;
      case 6u:
        int v12 = v11 & 7;
        if ((v11 & 7) != 0) {
          goto LABEL_42;
        }
        int v19 = (char *)*((void *)a2 + 1);
        unint64_t v13 = *((void *)a2 + 2);
        goto LABEL_88;
      case 7u:
        int v12 = v11 & 7;
        if ((v11 & 7) != 0) {
          goto LABEL_42;
        }
        int v20 = (char *)*((void *)a2 + 1);
        unint64_t v13 = *((void *)a2 + 2);
        goto LABEL_96;
      case 8u:
        int v12 = v11 & 7;
        if (v12 == 2) {
          goto LABEL_104;
        }
        goto LABEL_42;
      case 9u:
        int v12 = v11 & 7;
        if (v12 == 2) {
          goto LABEL_122;
        }
        goto LABEL_42;
      case 0xAu:
        int v12 = v11 & 7;
        if ((v11 & 7) != 0) {
          goto LABEL_42;
        }
        int v22 = (char *)*((void *)a2 + 1);
        unint64_t v21 = *((void *)a2 + 2);
        goto LABEL_136;
      case 0xBu:
        int v12 = v11 & 7;
        if ((v11 & 7) != 0) {
          goto LABEL_42;
        }
        int v23 = (char *)*((void *)a2 + 1);
        unint64_t v21 = *((void *)a2 + 2);
        goto LABEL_144;
      case 0xDu:
        int v12 = v11 & 7;
        if ((v11 & 7) != 0) {
          goto LABEL_42;
        }
        int v24 = (unsigned __int8 *)*((void *)a2 + 1);
        unint64_t v21 = *((void *)a2 + 2);
        goto LABEL_152;
      case 0x14u:
        int v12 = v11 & 7;
        if ((v11 & 7) != 0) {
          goto LABEL_42;
        }
        int v25 = (unsigned __int8 *)*((void *)a2 + 1);
        unint64_t v21 = *((void *)a2 + 2);
        goto LABEL_161;
      case 0x20u:
        int v12 = v11 & 7;
        if (v12 == 2) {
          goto LABEL_170;
        }
        goto LABEL_42;
      case 0x21u:
        int v12 = v11 & 7;
        if ((v11 & 7) != 0) {
          goto LABEL_42;
        }
        int v27 = (unsigned __int8 *)*((void *)a2 + 1);
        unint64_t v26 = *((void *)a2 + 2);
        goto LABEL_183;
      case 0x22u:
        int v12 = v11 & 7;
        if (v12 != 2) {
          goto LABEL_42;
        }
        int v28 = *(_DWORD *)(v3 + 132);
        goto LABEL_192;
      default:
        int v12 = v11 & 7;
        goto LABEL_42;
    }
  }
}

uint64_t sub_1D3E41A0C(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, uint64_t a2)
{
  unsigned int v11 = 0;
  uint64_t v4 = (char *)*((void *)this + 1);
  if ((unint64_t)v4 >= *((void *)this + 2) || *v4 < 0)
  {
    uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, &v11);
    if (!result) {
      return result;
    }
  }
  else
  {
    unsigned int v11 = *v4;
    *((void *)this + 1) = v4 + 1;
  }
  wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(this);
  if ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(this) >= 1)
  {
    do
    {
      unsigned int v10 = 0;
      uint64_t v6 = (char *)*((void *)this + 1);
      if ((unint64_t)v6 >= *((void *)this + 2) || *v6 < 0)
      {
        uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, &v10);
        if (!result) {
          return result;
        }
      }
      else
      {
        unsigned int v10 = *v6;
        *((void *)this + 1) = v6 + 1;
      }
      int v7 = *(_DWORD *)(a2 + 8);
      if (v7 == *(_DWORD *)(a2 + 12))
      {
        sub_1D3E4D664(a2, v7 + 1);
        int v7 = *(_DWORD *)(a2 + 8);
      }
      unsigned int v8 = v10;
      uint64_t v9 = *(void *)a2;
      *(_DWORD *)(a2 + MEMORY[0x1D9440F90]((char *)this + 8) = v7 + 1;
      *(_DWORD *)(v9 + 4 * v7) = v8;
    }
    while ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(this) > 0);
  }
  wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(this);
  return 1;
}

uint64_t awd::profile::Profile::SerializeWithCachedSizes(uint64_t this, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  uint64_t v5 = this;
  int v6 = *(_DWORD *)(this + 132);
  if (v6)
  {
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)1, *(unsigned int *)(this + 8), (uint64_t)a2, a4);
    int v6 = *(_DWORD *)(v5 + 132);
  }
  if ((v6 & 2) != 0) {
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)3, *(unsigned int *)(v5 + 12), (uint64_t)a2, a4);
  }
  if (*(int *)(v5 + 24) >= 1)
  {
    uint64_t v7 = 0;
    do
      this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)4, *(unsigned int *)(*(void *)(v5 + 16) + 4 * v7++), (uint64_t)a2, a4);
    while (v7 < *(int *)(v5 + 24));
  }
  int v8 = *(_DWORD *)(v5 + 132);
  if ((v8 & 8) != 0)
  {
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)5, *(unsigned int *)(v5 + 32), (uint64_t)a2, a4);
    int v8 = *(_DWORD *)(v5 + 132);
    if ((v8 & 0x10) == 0)
    {
LABEL_10:
      if ((v8 & 0x20) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else if ((v8 & 0x10) == 0)
  {
    goto LABEL_10;
  }
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)6, *(unsigned int *)(v5 + 36), (uint64_t)a2, a4);
  if ((*(_DWORD *)(v5 + 132) & 0x20) != 0) {
LABEL_11:
  }
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)7, *(unsigned int *)(v5 + 64), (uint64_t)a2, a4);
LABEL_12:
  if (*(int *)(v5 + 48) >= 1)
  {
    uint64_t v9 = 0;
    do
      this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)8, *(void *)(*(void *)(v5 + 40) + 8 * v9++), a2, a4);
    while (v9 < *(int *)(v5 + 48));
  }
  int v10 = *(_DWORD *)(v5 + 132);
  if ((v10 & 0x80) != 0)
  {
    uint64_t v13 = *(void *)(v5 + 72);
    if (!v13) {
      uint64_t v13 = *(void *)(awd::profile::Profile::default_instance_ + 72);
    }
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)9, v13, a2, a4);
    int v10 = *(_DWORD *)(v5 + 132);
    if ((v10 & 0x100) == 0)
    {
LABEL_17:
      if ((v10 & 0x200) == 0) {
        goto LABEL_18;
      }
      goto LABEL_34;
    }
  }
  else if ((v10 & 0x100) == 0)
  {
    goto LABEL_17;
  }
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)0xA, *(unsigned int *)(v5 + 68), (uint64_t)a2, a4);
  int v10 = *(_DWORD *)(v5 + 132);
  if ((v10 & 0x200) == 0)
  {
LABEL_18:
    if ((v10 & 0x400) == 0) {
      goto LABEL_19;
    }
    goto LABEL_35;
  }
LABEL_34:
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)0xB, *(unsigned int *)(v5 + 80), (uint64_t)a2, a4);
  int v10 = *(_DWORD *)(v5 + 132);
  if ((v10 & 0x400) == 0)
  {
LABEL_19:
    if ((v10 & 0x800) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_35:
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)0xD, *(unsigned int *)(v5 + 84), (uint64_t)a2, a4);
  if ((*(_DWORD *)(v5 + 132) & 0x800) != 0) {
LABEL_20:
  }
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)0x14, *(unsigned int *)(v5 + 112), (uint64_t)a2, a4);
LABEL_21:
  if (*(int *)(v5 + 96) >= 1)
  {
    uint64_t v11 = 0;
    do
    {
      this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteString();
      ++v11;
    }
    while (v11 < *(int *)(v5 + 96));
  }
  int v12 = *(_DWORD *)(v5 + 132);
  if ((v12 & 0x2000) != 0)
  {
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBool((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)0x21, *(unsigned __int8 *)(v5 + 116), (uint64_t)a2, a4);
    if ((*(_DWORD *)(v5 + 132) & 0x4000) == 0) {
      return this;
    }
  }
  else if ((v12 & 0x4000) == 0)
  {
    return this;
  }
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteString();
}

uint64_t awd::profile::Profile::ByteSize(awd::profile::Profile *this)
{
  int v2 = *((_DWORD *)this + 33);
  if (!(_BYTE)v2)
  {
    int v3 = 0;
    goto LABEL_41;
  }
  if ((v2 & 1) == 0)
  {
    int v3 = 0;
    if ((v2 & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_10;
  }
  uint64_t v4 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 2);
  if (v4 >= 0x80)
  {
    int v5 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v4);
    int v2 = *((_DWORD *)this + 33);
  }
  else
  {
    int v5 = 1;
  }
  int v3 = v5 + 1;
  if ((v2 & 2) != 0)
  {
LABEL_10:
    int v6 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 3);
    if (v6 >= 0x80)
    {
      int v7 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v6);
      int v2 = *((_DWORD *)this + 33);
    }
    else
    {
      int v7 = 1;
    }
    v3 += v7 + 1;
  }
LABEL_14:
  if ((v2 & 8) != 0)
  {
    int v8 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 8);
    if (v8 >= 0x80)
    {
      int v9 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v8);
      int v2 = *((_DWORD *)this + 33);
    }
    else
    {
      int v9 = 1;
    }
    v3 += v9 + 1;
    if ((v2 & 0x10) == 0)
    {
LABEL_16:
      if ((v2 & 0x20) == 0) {
        goto LABEL_17;
      }
LABEL_29:
      int v12 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 16);
      if ((v12 & 0x80000000) != 0)
      {
        int v13 = 10;
      }
      else if (v12 >= 0x80)
      {
        int v13 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v12);
        int v2 = *((_DWORD *)this + 33);
      }
      else
      {
        int v13 = 1;
      }
      v3 += v13 + 1;
      if ((v2 & 0x80) == 0) {
        goto LABEL_41;
      }
      goto LABEL_35;
    }
  }
  else if ((v2 & 0x10) == 0)
  {
    goto LABEL_16;
  }
  int v10 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 9);
  if ((v10 & 0x80000000) != 0)
  {
    int v11 = 10;
  }
  else if (v10 >= 0x80)
  {
    int v11 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v10);
    int v2 = *((_DWORD *)this + 33);
  }
  else
  {
    int v11 = 1;
  }
  v3 += v11 + 1;
  if ((v2 & 0x20) != 0) {
    goto LABEL_29;
  }
LABEL_17:
  if ((v2 & 0x80) == 0) {
    goto LABEL_41;
  }
LABEL_35:
  int v14 = (awd::profile::Log *)*((void *)this + 9);
  if (!v14) {
    int v14 = *(awd::profile::Log **)(awd::profile::Profile::default_instance_ + 72);
  }
  int v15 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)awd::profile::Log::ByteSize(v14);
  int v16 = (int)v15;
  if (v15 >= 0x80) {
    int v17 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v15);
  }
  else {
    int v17 = 1;
  }
  v3 += v16 + v17 + 1;
  int v2 = *((_DWORD *)this + 33);
LABEL_41:
  if ((v2 & 0xFF00) == 0) {
    goto LABEL_75;
  }
  if ((v2 & 0x100) != 0)
  {
    int v18 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 17);
    if (v18 >= 0x80)
    {
      int v19 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v18);
      int v2 = *((_DWORD *)this + 33);
    }
    else
    {
      int v19 = 1;
    }
    v3 += v19 + 1;
    if ((v2 & 0x200) == 0)
    {
LABEL_44:
      if ((v2 & 0x400) == 0) {
        goto LABEL_45;
      }
LABEL_55:
      int v22 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 21);
      if (v22 >= 0x80)
      {
        int v23 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v22) + 1;
        int v2 = *((_DWORD *)this + 33);
      }
      else
      {
        int v23 = 2;
      }
      v3 += v23;
      if ((v2 & 0x800) == 0) {
        goto LABEL_63;
      }
      goto LABEL_59;
    }
  }
  else if ((v2 & 0x200) == 0)
  {
    goto LABEL_44;
  }
  int v20 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 20);
  if (v20 >= 0x80)
  {
    int v21 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v20) + 1;
    int v2 = *((_DWORD *)this + 33);
  }
  else
  {
    int v21 = 2;
  }
  v3 += v21;
  if ((v2 & 0x400) != 0) {
    goto LABEL_55;
  }
LABEL_45:
  if ((v2 & 0x800) != 0)
  {
LABEL_59:
    int v24 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 28);
    if (v24 >= 0x80)
    {
      int v25 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v24) + 2;
      int v2 = *((_DWORD *)this + 33);
    }
    else
    {
      int v25 = 3;
    }
    v3 += v25;
  }
LABEL_63:
  if ((v2 & 0x2000) != 0) {
    v3 += 3;
  }
  if ((v2 & 0x4000) != 0)
  {
    uint64_t v26 = *((void *)this + 15);
    int v27 = *(unsigned __int8 *)(v26 + 23);
    char v28 = v27;
    uint64_t v29 = *(void *)(v26 + 8);
    if ((v27 & 0x80u) == 0) {
      unint64_t v30 = *(unsigned __int8 *)(v26 + 23);
    }
    else {
      unint64_t v30 = v29;
    }
    if (v30 >= 0x80)
    {
      int v31 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v30);
      int v27 = *(unsigned __int8 *)(v26 + 23);
      uint64_t v29 = *(void *)(v26 + 8);
      char v28 = *(unsigned char *)(v26 + 23);
    }
    else
    {
      int v31 = 1;
    }
    if (v28 < 0) {
      int v27 = v29;
    }
    v3 += v31 + v27 + 2;
  }
LABEL_75:
  int v32 = *((_DWORD *)this + 6);
  if (v32 < 1)
  {
    int v34 = 0;
  }
  else
  {
    uint64_t v33 = 0;
    int v34 = 0;
    do
    {
      int v35 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*(unsigned int *)(*((void *)this + 2)
                                                                                             + 4 * v33);
      if (v35 >= 0x80)
      {
        int v36 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v35);
        int v32 = *((_DWORD *)this + 6);
      }
      else
      {
        int v36 = 1;
      }
      v34 += v36;
      ++v33;
    }
    while (v33 < v32);
  }
  int v37 = *((_DWORD *)this + 12);
  int v38 = v34 + v3 + v32 + v37;
  if (v37 >= 1)
  {
    uint64_t v39 = 0;
    do
    {
      int v40 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)awd::profile::Metric::ByteSize(*(awd::profile::Metric **)(*((void *)this + 5) + 8 * v39));
      int v41 = (int)v40;
      if (v40 >= 0x80) {
        int v42 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v40);
      }
      else {
        int v42 = 1;
      }
      v38 += v41 + v42;
      ++v39;
    }
    while (v39 < *((int *)this + 12));
  }
  int v43 = *((_DWORD *)this + 24);
  uint64_t v44 = (v38 + 2 * v43);
  if (v43 >= 1)
  {
    for (uint64_t i = 0; i < v43; ++i)
    {
      uint64_t v46 = *(void *)(*((void *)this + 11) + 8 * i);
      int v47 = *(unsigned __int8 *)(v46 + 23);
      char v48 = v47;
      uint64_t v49 = *(void *)(v46 + 8);
      if ((v47 & 0x80u) == 0) {
        unint64_t v50 = *(unsigned __int8 *)(v46 + 23);
      }
      else {
        unint64_t v50 = v49;
      }
      if (v50 >= 0x80)
      {
        int v51 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v50);
        int v47 = *(unsigned __int8 *)(v46 + 23);
        uint64_t v49 = *(void *)(v46 + 8);
        int v43 = *((_DWORD *)this + 24);
        char v48 = *(unsigned char *)(v46 + 23);
      }
      else
      {
        int v51 = 1;
      }
      if (v48 < 0) {
        int v47 = v49;
      }
      uint64_t v44 = (v51 + v44 + v47);
    }
  }
  *((_DWORD *)this + 32) = v44;
  return v44;
}

void awd::profile::Log::MergeFrom(awd::profile::Log *this, const awd::profile::Log *a2)
{
  if (a2 == this)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v9);
  }
  wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((awd::profile::Log *)((char *)this + 8));
  if (*((int *)a2 + 4) >= 1)
  {
    uint64_t v4 = 0;
    do
    {
      int v5 = *(const awd::profile::LogParameter **)(*((void *)a2 + 1) + 8 * v4);
      int v6 = *((_DWORD *)this + 5);
      uint64_t v7 = *((int *)this + 4);
      if ((int)v7 >= v6)
      {
        if (v6 == *((_DWORD *)this + 6))
        {
          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((awd::profile::Log *)((char *)this + 8));
          int v6 = *((_DWORD *)this + 5);
        }
        *((_DWORD *)this + 5) = v6 + 1;
        operator new();
      }
      uint64_t v8 = *((void *)this + 1);
      *((_DWORD *)this + 4) = v7 + 1;
      awd::profile::LogParameter::MergeFrom(*(awd::profile::LogParameter **)(v8 + 8 * v7), v5);
      ++v4;
    }
    while (v4 < *((int *)a2 + 4));
  }
}

void sub_1D3E42280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)va);
  _Unwind_Resume(a1);
}

void awd::profile::Profile::CopyFrom(awd::profile::Profile *this, const awd::profile::Profile *a2)
{
  if (a2 != this)
  {
    (*(void (**)(awd::profile::Profile *))(*(void *)this + 32))(this);
    awd::profile::Profile::MergeFrom(this, a2);
  }
}

uint64_t awd::profile::Profile::IsInitialized(awd::profile::Profile *this)
{
  return 1;
}

uint64_t awd::profile::Profile::Swap(uint64_t this, awd::profile::Profile *a2)
{
  if (a2 != (awd::profile::Profile *)this)
  {
    uint64_t v3 = this;
    int v4 = *(_DWORD *)(this + 8);
    *(_DWORD *)(this + MEMORY[0x1D9440F90]((char *)this + 8) = *((_DWORD *)a2 + 2);
    *((_DWORD *)a2 + 2) = v4;
    int v5 = *(_DWORD *)(this + 12);
    *(_DWORD *)(this + 12) = *((_DWORD *)a2 + 3);
    *((_DWORD *)a2 + 3) = v5;
    uint64_t v6 = *(void *)(this + 16);
    *(void *)(this + 16) = *((void *)a2 + 2);
    uint64_t v7 = *((void *)a2 + 3);
    *((void *)a2 + 2) = v6;
    uint64_t v8 = *(void *)(this + 24);
    *(void *)(this + 24) = v7;
    *((void *)a2 + 3) = v8;
    LODWORD(v6) = *(_DWORD *)(this + 32);
    *(_DWORD *)(this + 32) = *((_DWORD *)a2 + 8);
    *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = v6;
    LODWORD(v6) = *(_DWORD *)(this + 36);
    *(_DWORD *)(this + 36) = *((_DWORD *)a2 + 9);
    *((_DWORD *)a2 + 9) = v6;
    LODWORD(v6) = *(_DWORD *)(this + 64);
    *(_DWORD *)(this + 64) = *((_DWORD *)a2 + 16);
    *((_DWORD *)a2 + 16) = v6;
    wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Swap();
    uint64_t v9 = *(void *)(v3 + 72);
    *(void *)(v3 + 72) = *((void *)a2 + 9);
    *((void *)a2 + 9) = v9;
    LODWORD(v9) = *(_DWORD *)(v3 + 68);
    *(_DWORD *)(v3 + 6MEMORY[0x1D9440F90]((char *)this + 8) = *((_DWORD *)a2 + 17);
    *((_DWORD *)a2 + 17) = v9;
    LODWORD(v9) = *(_DWORD *)(v3 + 80);
    *(_DWORD *)(v3 + 80) = *((_DWORD *)a2 + 20);
    *((_DWORD *)a2 + 20) = v9;
    LODWORD(v9) = *(_DWORD *)(v3 + 84);
    *(_DWORD *)(v3 + 84) = *((_DWORD *)a2 + 21);
    *((_DWORD *)a2 + 21) = v9;
    LODWORD(v9) = *(_DWORD *)(v3 + 112);
    *(_DWORD *)(v3 + 112) = *((_DWORD *)a2 + 28);
    *((_DWORD *)a2 + 2MEMORY[0x1D9440F90]((char *)this + 8) = v9;
    this = wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Swap();
    char v10 = *(unsigned char *)(v3 + 116);
    *(unsigned char *)(v3 + 116) = *((unsigned char *)a2 + 116);
    *((unsigned char *)a2 + 116) = v10;
    uint64_t v11 = *(void *)(v3 + 120);
    *(void *)(v3 + 120) = *((void *)a2 + 15);
    *((void *)a2 + 15) = v11;
    LODWORD(v11) = *(_DWORD *)(v3 + 132);
    *(_DWORD *)(v3 + 132) = *((_DWORD *)a2 + 33);
    *((_DWORD *)a2 + 33) = v11;
    LODWORD(v11) = *(_DWORD *)(v3 + 128);
    *(_DWORD *)(v3 + 12MEMORY[0x1D9440F90]((char *)this + 8) = *((_DWORD *)a2 + 32);
    *((_DWORD *)a2 + 32) = v11;
  }
  return this;
}

void *awd::profile::Profile::GetTypeName@<X0>(void *a1@<X8>)
{
  return sub_1D3E270D0(a1, "awd.profile.Profile");
}

void *awd::profile::LogParameter::SharedCtor(void *this)
{
  uint64_t v1 = MEMORY[0x1E4FBA920];
  this[1] = MEMORY[0x1E4FBA920];
  this[2] = v1;
  this[3] = 0;
  return this;
}

awd::profile::LogParameter *awd::profile::LogParameter::LogParameter(awd::profile::LogParameter *this, const awd::profile::LogParameter *a2)
{
  uint64_t v3 = MEMORY[0x1E4FBA920];
  *(void *)this = &unk_1F2B9B068;
  *((void *)this + 1) = v3;
  *((void *)this + 2) = v3;
  *((void *)this + 3) = 0;
  awd::profile::LogParameter::MergeFrom(this, a2);
  return this;
}

void sub_1D3E424F4(_Unwind_Exception *a1)
{
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(v1);
  _Unwind_Resume(a1);
}

void awd::profile::LogParameter::MergeFrom(awd::profile::LogParameter *this, const awd::profile::LogParameter *a2)
{
  if (a2 == this)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v10);
  }
  LOBYTE(v4) = *((unsigned char *)a2 + 28);
  if ((_BYTE)v4)
  {
    int v5 = (std::string *)MEMORY[0x1E4FBA920];
    if (*((unsigned char *)a2 + 28))
    {
      uint64_t v6 = (const std::string *)*((void *)a2 + 1);
      *((_DWORD *)this + 7) |= 1u;
      uint64_t v7 = (std::string *)*((void *)this + 1);
      if (v7 == v5) {
        operator new();
      }
      std::string::operator=(v7, v6);
      int v4 = *((_DWORD *)a2 + 7);
    }
    if ((v4 & 2) != 0)
    {
      uint64_t v8 = (const std::string *)*((void *)a2 + 2);
      *((_DWORD *)this + 7) |= 2u;
      uint64_t v9 = (std::string *)*((void *)this + 2);
      if (v9 == v5) {
        operator new();
      }
      std::string::operator=(v9, v8);
    }
  }
}

void sub_1D3E4262C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)va);
  _Unwind_Resume(a1);
}

void awd::profile::LogParameter::~LogParameter(awd::profile::LogParameter *this)
{
  *(void *)this = &unk_1F2B9B068;
  awd::profile::LogParameter::SharedDtor((uint64_t)this);
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(this);
}

{
  uint64_t vars8;

  *(void *)this = &unk_1F2B9B068;
  awd::profile::LogParameter::SharedDtor((uint64_t)this);
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(this);
}

{
  uint64_t vars8;

  *(void *)this = &unk_1F2B9B068;
  awd::profile::LogParameter::SharedDtor((uint64_t)this);
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(this);
  JUMPOUT(0x1D94412F0);
}

uint64_t awd::profile::LogParameter::SharedDtor(uint64_t this)
{
  uint64_t v1 = this;
  uint64_t v2 = *(void *)(this + 8);
  uint64_t v3 = MEMORY[0x1E4FBA920];
  if (v2 != MEMORY[0x1E4FBA920] && v2 != 0)
  {
    if (*(char *)(v2 + 23) < 0) {
      operator delete(*(void **)v2);
    }
    this = MEMORY[0x1D94412F0](v2, 0x1012C40EC159624);
  }
  uint64_t v5 = *(void *)(v1 + 16);
  if (v5 != v3 && v5 != 0)
  {
    if (*(char *)(v5 + 23) < 0) {
      operator delete(*(void **)v5);
    }
    JUMPOUT(0x1D94412F0);
  }
  return this;
}

uint64_t awd::profile::LogParameter::SetCachedSize(uint64_t this, int a2)
{
  *(_DWORD *)(this + 24) = a2;
  return this;
}

uint64_t awd::profile::LogParameter::default_instance(awd::profile::LogParameter *this, uint64_t a2, uint64_t a3, const char *a4)
{
  uint64_t result = awd::profile::LogParameter::default_instance_;
  if (!awd::profile::LogParameter::default_instance_)
  {
    awd::profile::protobuf_AddDesc_AwdProfile_2eproto(0, a2, a3, a4);
    return awd::profile::LogParameter::default_instance_;
  }
  return result;
}

void awd::profile::LogParameter::New(awd::profile::LogParameter *this)
{
}

uint64_t awd::profile::LogParameter::Clear(uint64_t this)
{
  if (*(unsigned char *)(this + 28))
  {
    uint64_t v1 = MEMORY[0x1E4FBA920];
    if (*(unsigned char *)(this + 28))
    {
      uint64_t v2 = *(void *)(this + 8);
      if (v2 != MEMORY[0x1E4FBA920])
      {
        if (*(char *)(v2 + 23) < 0)
        {
          **(unsigned char **)uint64_t v2 = 0;
          *(void *)(v2 + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
        }
        else
        {
          *(unsigned char *)uint64_t v2 = 0;
          *(unsigned char *)(v2 + 23) = 0;
        }
      }
    }
    if ((*(unsigned char *)(this + 28) & 2) != 0)
    {
      uint64_t v3 = *(void *)(this + 16);
      if (v3 != v1)
      {
        if (*(char *)(v3 + 23) < 0)
        {
          **(unsigned char **)uint64_t v3 = 0;
          *(void *)(v3 + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
        }
        else
        {
          *(unsigned char *)uint64_t v3 = 0;
          *(unsigned char *)(v3 + 23) = 0;
        }
      }
    }
  }
  *(_DWORD *)(this + 2MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  return this;
}

uint64_t awd::profile::LogParameter::MergePartialFromCodedStream(awd::profile::LogParameter *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2)
{
  uint64_t v4 = MEMORY[0x1E4FBA920];
  do
  {
    while (1)
    {
      while (1)
      {
        uint64_t v5 = (char *)*((void *)a2 + 1);
        if ((unint64_t)v5 >= *((void *)a2 + 2) || *v5 < 0)
        {
          unint64_t TagFallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(a2);
          *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = TagFallback;
          if (!TagFallback) {
            return 1;
          }
        }
        else
        {
          unint64_t TagFallback = *v5;
          *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = TagFallback;
          *((void *)a2 + 1) = v5 + 1;
          if (!TagFallback) {
            return 1;
          }
        }
        if (TagFallback >> 3 != 1) {
          break;
        }
        int v7 = TagFallback & 7;
        if (v7 != 2) {
          goto LABEL_26;
        }
        *((_DWORD *)this + 7) |= 1u;
        if (*((void *)this + 1) == v4) {
          operator new();
        }
        uint64_t result = wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadString();
        if (!result) {
          return result;
        }
        uint64_t v9 = (unsigned char *)*((void *)a2 + 1);
        if ((unint64_t)v9 < *((void *)a2 + 2) && *v9 == 18)
        {
          *((void *)a2 + 1) = v9 + 1;
          goto LABEL_18;
        }
      }
      if (TagFallback >> 3 != 2)
      {
        int v7 = TagFallback & 7;
        goto LABEL_26;
      }
      int v7 = TagFallback & 7;
      if (v7 == 2) {
        break;
      }
LABEL_26:
      if (v7 == 4) {
        return 1;
      }
      if ((wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipField(a2, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)TagFallback) & 1) == 0)return 0; {
    }
      }
LABEL_18:
    *((_DWORD *)this + 7) |= 2u;
    if (*((void *)this + 2) == v4) {
      operator new();
    }
    uint64_t result = wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadString();
    if (!result) {
      return result;
    }
  }
  while (*((void *)a2 + 1) != *((void *)a2 + 2)
       || !*((_DWORD *)a2 + 11) && *((_DWORD *)a2 + 6) != *((_DWORD *)a2 + 10));
  *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  uint64_t result = 1;
  *((unsigned char *)a2 + 36) = 1;
  return result;
}

uint64_t awd::profile::LogParameter::SerializeWithCachedSizes(uint64_t this, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a2)
{
  uint64_t v2 = this;
  int v3 = *(_DWORD *)(this + 28);
  if (v3)
  {
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteString();
    int v3 = *(_DWORD *)(v2 + 28);
  }
  if ((v3 & 2) != 0)
  {
    return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteString();
  }
  return this;
}

uint64_t awd::profile::LogParameter::ByteSize(awd::profile::LogParameter *this)
{
  LOBYTE(v2) = *((unsigned char *)this + 28);
  if (!(_BYTE)v2)
  {
    uint64_t v3 = 0;
    goto LABEL_24;
  }
  if ((*((unsigned char *)this + 28) & 1) == 0)
  {
    uint64_t v3 = 0;
    if ((*((unsigned char *)this + 28) & 2) == 0) {
      goto LABEL_24;
    }
    goto LABEL_15;
  }
  uint64_t v4 = *((void *)this + 1);
  int v5 = *(unsigned __int8 *)(v4 + 23);
  char v6 = v5;
  uint64_t v7 = *(void *)(v4 + 8);
  if ((v5 & 0x80u) == 0) {
    unint64_t v8 = *(unsigned __int8 *)(v4 + 23);
  }
  else {
    unint64_t v8 = v7;
  }
  if (v8 >= 0x80)
  {
    int v10 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v8);
    int v5 = *(unsigned __int8 *)(v4 + 23);
    uint64_t v7 = *(void *)(v4 + 8);
    int v9 = v10 + 1;
    int v2 = *((_DWORD *)this + 7);
    char v6 = *(unsigned char *)(v4 + 23);
  }
  else
  {
    int v9 = 2;
  }
  if (v6 < 0) {
    int v5 = v7;
  }
  uint64_t v3 = (v9 + v5);
  if ((v2 & 2) != 0)
  {
LABEL_15:
    uint64_t v11 = *((void *)this + 2);
    int v12 = *(unsigned __int8 *)(v11 + 23);
    char v13 = v12;
    uint64_t v14 = *(void *)(v11 + 8);
    if ((v12 & 0x80u) == 0) {
      unint64_t v15 = *(unsigned __int8 *)(v11 + 23);
    }
    else {
      unint64_t v15 = v14;
    }
    if (v15 >= 0x80)
    {
      int v16 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v15);
      int v12 = *(unsigned __int8 *)(v11 + 23);
      uint64_t v14 = *(void *)(v11 + 8);
      char v13 = *(unsigned char *)(v11 + 23);
    }
    else
    {
      int v16 = 1;
    }
    if (v13 < 0) {
      int v12 = v14;
    }
    uint64_t v3 = (v3 + v16 + v12 + 1);
  }
LABEL_24:
  *((_DWORD *)this + 6) = v3;
  return v3;
}

void awd::profile::LogParameter::CopyFrom(awd::profile::LogParameter *this, const awd::profile::LogParameter *a2)
{
  if (a2 != this)
  {
    (*(void (**)(awd::profile::LogParameter *))(*(void *)this + 32))(this);
    awd::profile::LogParameter::MergeFrom(this, a2);
  }
}

uint64_t awd::profile::LogParameter::IsInitialized(awd::profile::LogParameter *this)
{
  return 1;
}

uint64_t awd::profile::LogParameter::Swap(uint64_t this, awd::profile::LogParameter *a2)
{
  if (a2 != (awd::profile::LogParameter *)this)
  {
    uint64_t v2 = *(void *)(this + 8);
    *(void *)(this + MEMORY[0x1D9440F90]((char *)this + 8) = *((void *)a2 + 1);
    *((void *)a2 + 1) = v2;
    uint64_t v3 = *(void *)(this + 16);
    *(void *)(this + 16) = *((void *)a2 + 2);
    *((void *)a2 + 2) = v3;
    LODWORD(v3) = *(_DWORD *)(this + 28);
    *(_DWORD *)(this + 2MEMORY[0x1D9440F90]((char *)this + 8) = *((_DWORD *)a2 + 7);
    *((_DWORD *)a2 + 7) = v3;
    LODWORD(v3) = *(_DWORD *)(this + 24);
    *(_DWORD *)(this + 24) = *((_DWORD *)a2 + 6);
    *((_DWORD *)a2 + 6) = v3;
  }
  return this;
}

void *awd::profile::LogParameter::GetTypeName@<X0>(void *a1@<X8>)
{
  return sub_1D3E270D0(a1, "awd.profile.LogParameter");
}

uint64_t awd::profile::Log::SharedCtor(uint64_t this)
{
  *(void *)(this + 32) = 0;
  return this;
}

awd::profile::Log *awd::profile::Log::Log(awd::profile::Log *this, const awd::profile::Log *a2)
{
  *(void *)this = &unk_1F2B9B590;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *((_DWORD *)this + 6) = 0;
  *((void *)this + 4) = 0;
  awd::profile::Log::MergeFrom(this, a2);
  return this;
}

void sub_1D3E42D9C(_Unwind_Exception *a1)
{
  sub_1D3E4D870(v2);
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(v1);
  _Unwind_Resume(a1);
}

void awd::profile::Log::~Log(awd::profile::Log *this)
{
  *(void *)this = &unk_1F2B9B590;
  sub_1D3E4D870((uint64_t *)this + 1);
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(this);
}

{
  uint64_t vars8;

  awd::profile::Log::~Log(this);
  JUMPOUT(0x1D94412F0);
}

uint64_t awd::profile::Log::SetCachedSize(uint64_t this, int a2)
{
  *(_DWORD *)(this + 32) = a2;
  return this;
}

void awd::profile::Log::New(awd::profile::Log *this)
{
}

uint64_t awd::profile::Log::MergePartialFromCodedStream(awd::profile::Log *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2)
{
  uint64_t v4 = (awd::profile::Log *)((char *)this + 8);
  while (1)
  {
LABEL_2:
    int v5 = (char *)*((void *)a2 + 1);
    if ((unint64_t)v5 >= *((void *)a2 + 2) || *v5 < 0)
    {
      unint64_t TagFallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(a2);
      *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = TagFallback;
    }
    else
    {
      unint64_t TagFallback = *v5;
      *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = TagFallback;
      *((void *)a2 + 1) = v5 + 1;
    }
    if (TagFallback == 10)
    {
      while (1)
      {
        int v7 = *((_DWORD *)this + 5);
        uint64_t v8 = *((int *)this + 4);
        if ((int)v8 >= v7)
        {
          if (v7 == *((_DWORD *)this + 6))
          {
            wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v4);
            int v7 = *((_DWORD *)this + 5);
          }
          *((_DWORD *)this + 5) = v7 + 1;
          operator new();
        }
        uint64_t v9 = *((void *)this + 1);
        *((_DWORD *)this + 4) = v8 + 1;
        int v10 = *(awd::profile::LogParameter **)(v9 + 8 * v8);
        unsigned int v20 = 0;
        uint64_t v11 = (char *)*((void *)a2 + 1);
        if ((unint64_t)v11 >= *((void *)a2 + 2) || *v11 < 0)
        {
          if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v20))return 0; {
        }
          }
        else
        {
          unsigned int v20 = *v11;
          *((void *)a2 + 1) = v11 + 1;
        }
        int v12 = *((_DWORD *)a2 + 14);
        int v13 = *((_DWORD *)a2 + 15);
        *((_DWORD *)a2 + 14) = v12 + 1;
        if (v12 >= v13) {
          return 0;
        }
        wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(a2);
        if (!awd::profile::LogParameter::MergePartialFromCodedStream(v10, a2) || !*((unsigned char *)a2 + 36)) {
          return 0;
        }
        wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(a2);
        int v14 = *((_DWORD *)a2 + 14);
        BOOL v15 = __OFSUB__(v14, 1);
        int v16 = v14 - 1;
        if (v16 < 0 == v15) {
          *((_DWORD *)a2 + 14) = v16;
        }
        int v17 = (unsigned char *)*((void *)a2 + 1);
        int v18 = (unsigned char *)*((void *)a2 + 2);
        if (v17 >= v18 || *v17 != 10)
        {
          if (v17 == v18 && (*((_DWORD *)a2 + 11) || *((_DWORD *)a2 + 6) == *((_DWORD *)a2 + 10)))
          {
            *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
            uint64_t result = 1;
            *((unsigned char *)a2 + 36) = 1;
            return result;
          }
          goto LABEL_2;
        }
        *((void *)a2 + 1) = v17 + 1;
      }
    }
    if (!TagFallback || (TagFallback & 7) == 4) {
      return 1;
    }
    if ((wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipField(a2, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)TagFallback) & 1) == 0)return 0; {
  }
    }
}

uint64_t awd::profile::Log::SerializeWithCachedSizes(uint64_t this, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  if (*(int *)(this + 16) >= 1)
  {
    uint64_t v5 = this;
    uint64_t v6 = 0;
    do
      this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)1, *(void *)(*(void *)(v5 + 8) + 8 * v6++), a2, a4);
    while (v6 < *(int *)(v5 + 16));
  }
  return this;
}

uint64_t awd::profile::Log::ByteSize(awd::profile::Log *this)
{
  uint64_t v2 = *((unsigned int *)this + 4);
  if ((int)v2 >= 1)
  {
    uint64_t v3 = 0;
    do
    {
      uint64_t v4 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)awd::profile::LogParameter::ByteSize(*(awd::profile::LogParameter **)(*((void *)this + 1) + 8 * v3));
      int v5 = (int)v4;
      if (v4 >= 0x80) {
        int v6 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v4);
      }
      else {
        int v6 = 1;
      }
      uint64_t v2 = (v5 + v2 + v6);
      ++v3;
    }
    while (v3 < *((int *)this + 4));
  }
  *((_DWORD *)this + MEMORY[0x1D9440F90]((char *)this + 8) = v2;
  return v2;
}

void awd::profile::Log::CopyFrom(awd::profile::Log *this, const awd::profile::Log *a2)
{
  if (a2 != this)
  {
    (*(void (**)(awd::profile::Log *))(*(void *)this + 32))(this);
    awd::profile::Log::MergeFrom(this, a2);
  }
}

uint64_t awd::profile::Log::IsInitialized(awd::profile::Log *this)
{
  return 1;
}

awd::profile::Log *awd::profile::Log::Swap(awd::profile::Log *this, awd::profile::Log *a2)
{
  if (a2 != this)
  {
    uint64_t v3 = this;
    this = (awd::profile::Log *)wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Swap();
    int v4 = *((_DWORD *)v3 + 9);
    *((_DWORD *)v3 + 9) = *((_DWORD *)a2 + 9);
    *((_DWORD *)a2 + 9) = v4;
    int v5 = *((_DWORD *)v3 + 8);
    *((_DWORD *)v3 + MEMORY[0x1D9440F90]((char *)this + 8) = *((_DWORD *)a2 + 8);
    *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = v5;
  }
  return this;
}

void *awd::profile::Log::GetTypeName@<X0>(void *a1@<X8>)
{
  return sub_1D3E270D0(a1, "awd.profile.Log");
}

void *awd::profile::ConfigurationParameter::SharedCtor(void *this)
{
  this[1] = MEMORY[0x1E4FBA920];
  this[2] = 0;
  this[3] = 0;
  return this;
}

uint64_t awd::profile::TypeVariant::default_instance(awd::profile::TypeVariant *this, uint64_t a2, uint64_t a3, const char *a4)
{
  uint64_t result = awd::profile::TypeVariant::default_instance_;
  if (!awd::profile::TypeVariant::default_instance_)
  {
    awd::profile::protobuf_AddDesc_AwdProfile_2eproto(0, a2, a3, a4);
    return awd::profile::TypeVariant::default_instance_;
  }
  return result;
}

awd::profile::ConfigurationParameter *awd::profile::ConfigurationParameter::ConfigurationParameter(awd::profile::ConfigurationParameter *this, const awd::profile::ConfigurationParameter *a2)
{
  uint64_t v3 = MEMORY[0x1E4FBA920];
  *(void *)this = &unk_1F2B9B518;
  *((void *)this + 1) = v3;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  awd::profile::ConfigurationParameter::MergeFrom(this, a2);
  return this;
}

void sub_1D3E43368(_Unwind_Exception *a1)
{
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(v1);
  _Unwind_Resume(a1);
}

void awd::profile::ConfigurationParameter::MergeFrom(awd::profile::ConfigurationParameter *this, const awd::profile::ConfigurationParameter *a2)
{
  if (a2 == this)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v9);
  }
  LOBYTE(v4) = *((unsigned char *)a2 + 28);
  if ((_BYTE)v4)
  {
    if (*((unsigned char *)a2 + 28))
    {
      int v5 = (const std::string *)*((void *)a2 + 1);
      *((_DWORD *)this + 7) |= 1u;
      int v6 = (std::string *)*((void *)this + 1);
      if (v6 == (std::string *)MEMORY[0x1E4FBA920]) {
        operator new();
      }
      std::string::operator=(v6, v5);
      int v4 = *((_DWORD *)a2 + 7);
    }
    if ((v4 & 2) != 0)
    {
      *((_DWORD *)this + 7) |= 2u;
      int v7 = (awd::profile::TypeVariant *)*((void *)this + 2);
      if (!v7) {
        operator new();
      }
      uint64_t v8 = (const awd::profile::TypeVariant *)*((void *)a2 + 2);
      if (!v8) {
        uint64_t v8 = *(const awd::profile::TypeVariant **)(awd::profile::ConfigurationParameter::default_instance_ + 16);
      }
      awd::profile::TypeVariant::MergeFrom(v7, v8);
    }
  }
}

void sub_1D3E434E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)va);
  _Unwind_Resume(a1);
}

void awd::profile::ConfigurationParameter::~ConfigurationParameter(awd::profile::ConfigurationParameter *this)
{
  *(void *)this = &unk_1F2B9B518;
  awd::profile::ConfigurationParameter::SharedDtor(this);
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(this);
}

{
  uint64_t vars8;

  *(void *)this = &unk_1F2B9B518;
  awd::profile::ConfigurationParameter::SharedDtor(this);
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(this);
}

{
  uint64_t vars8;

  *(void *)this = &unk_1F2B9B518;
  awd::profile::ConfigurationParameter::SharedDtor(this);
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(this);
  JUMPOUT(0x1D94412F0);
}

void *awd::profile::ConfigurationParameter::SharedDtor(void *this)
{
  uint64_t v1 = this;
  uint64_t v2 = this[1];
  if (v2 != MEMORY[0x1E4FBA920] && v2 != 0)
  {
    if (*(char *)(v2 + 23) < 0) {
      operator delete(*(void **)v2);
    }
    this = (void *)MEMORY[0x1D94412F0](v2, 0x1012C40EC159624);
  }
  if ((void *)awd::profile::ConfigurationParameter::default_instance_ != v1)
  {
    this = (void *)v1[2];
    if (this)
    {
      int v4 = *(uint64_t (**)(void))(*this + 8);
      return (void *)v4();
    }
  }
  return this;
}

uint64_t awd::profile::ConfigurationParameter::SetCachedSize(uint64_t this, int a2)
{
  *(_DWORD *)(this + 24) = a2;
  return this;
}

uint64_t awd::profile::ConfigurationParameter::default_instance(awd::profile::ConfigurationParameter *this, uint64_t a2, uint64_t a3, const char *a4)
{
  uint64_t result = awd::profile::ConfigurationParameter::default_instance_;
  if (!awd::profile::ConfigurationParameter::default_instance_)
  {
    awd::profile::protobuf_AddDesc_AwdProfile_2eproto(0, a2, a3, a4);
    return awd::profile::ConfigurationParameter::default_instance_;
  }
  return result;
}

void awd::profile::ConfigurationParameter::New(awd::profile::ConfigurationParameter *this)
{
}

uint64_t awd::profile::ConfigurationParameter::Clear(uint64_t this)
{
  uint64_t v1 = this;
  if (*(unsigned char *)(this + 28))
  {
    if (*(unsigned char *)(this + 28))
    {
      uint64_t v2 = *(void *)(this + 8);
      if (v2 != MEMORY[0x1E4FBA920])
      {
        if (*(char *)(v2 + 23) < 0)
        {
          **(unsigned char **)uint64_t v2 = 0;
          *(void *)(v2 + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
        }
        else
        {
          *(unsigned char *)uint64_t v2 = 0;
          *(unsigned char *)(v2 + 23) = 0;
        }
      }
    }
    if ((*(unsigned char *)(this + 28) & 2) != 0)
    {
      this = *(void *)(this + 16);
      if (this) {
        this = awd::profile::TypeVariant::Clear(this);
      }
    }
  }
  *(_DWORD *)(v1 + 2MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  return this;
}

uint64_t awd::profile::TypeVariant::Clear(uint64_t this)
{
  int v1 = *(_DWORD *)(this + 72);
  if ((_BYTE)v1)
  {
    *(_DWORD *)(this + 40) = 0;
    *(_OWORD *)(this + 24) = 0u;
    *(_OWORD *)(this + MEMORY[0x1D9440F90]((char *)this + 8) = 0u;
    if ((v1 & 0x40) != 0)
    {
      uint64_t v2 = *(void *)(this + 48);
      if (v2 != MEMORY[0x1E4FBA920])
      {
        if (*(char *)(v2 + 23) < 0)
        {
          **(unsigned char **)uint64_t v2 = 0;
          *(void *)(v2 + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
        }
        else
        {
          *(unsigned char *)uint64_t v2 = 0;
          *(unsigned char *)(v2 + 23) = 0;
        }
      }
    }
    *(unsigned char *)(this + 44) = 0;
    int v1 = *(_DWORD *)(this + 72);
  }
  if ((v1 & 0xFF00) != 0)
  {
    if ((v1 & 0x100) != 0)
    {
      uint64_t v3 = *(void *)(this + 56);
      if (v3 != MEMORY[0x1E4FBA920])
      {
        if (*(char *)(v3 + 23) < 0)
        {
          **(unsigned char **)uint64_t v3 = 0;
          *(void *)(v3 + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
        }
        else
        {
          *(unsigned char *)uint64_t v3 = 0;
          *(unsigned char *)(v3 + 23) = 0;
        }
      }
    }
    *(_DWORD *)(this + 64) = 0;
  }
  *(_DWORD *)(this + 72) = 0;
  return this;
}

uint64_t awd::profile::ConfigurationParameter::MergePartialFromCodedStream(awd::profile::ConfigurationParameter *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2)
{
  uint64_t v4 = MEMORY[0x1E4FBA920];
  while (1)
  {
    while (1)
    {
      int v5 = (char *)*((void *)a2 + 1);
      if ((unint64_t)v5 >= *((void *)a2 + 2) || *v5 < 0)
      {
        unint64_t TagFallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(a2);
        *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = TagFallback;
        if (!TagFallback) {
          return 1;
        }
      }
      else
      {
        unint64_t TagFallback = *v5;
        *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = TagFallback;
        *((void *)a2 + 1) = v5 + 1;
        if (!TagFallback) {
          return 1;
        }
      }
      if (TagFallback >> 3 != 1) {
        break;
      }
      int v7 = TagFallback & 7;
      if (v7 == 2)
      {
        *((_DWORD *)this + 7) |= 1u;
        if (*((void *)this + 1) == v4) {
          operator new();
        }
        uint64_t result = wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadString();
        if (!result) {
          return result;
        }
        uint64_t v9 = (unsigned char *)*((void *)a2 + 1);
        if ((unint64_t)v9 < *((void *)a2 + 2) && *v9 == 18)
        {
          *((void *)a2 + 1) = v9 + 1;
          goto LABEL_18;
        }
      }
      else
      {
LABEL_24:
        if (v7 == 4) {
          return 1;
        }
        if ((wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipField(a2, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)TagFallback) & 1) == 0)return 0; {
      }
        }
    }
    if (TagFallback >> 3 != 2)
    {
      int v7 = TagFallback & 7;
      goto LABEL_24;
    }
    int v7 = TagFallback & 7;
    if (v7 != 2) {
      goto LABEL_24;
    }
LABEL_18:
    *((_DWORD *)this + 7) |= 2u;
    int v10 = (awd::profile::TypeVariant *)*((void *)this + 2);
    if (!v10) {
      operator new();
    }
    unsigned int v17 = 0;
    uint64_t v11 = (char *)*((void *)a2 + 1);
    if ((unint64_t)v11 >= *((void *)a2 + 2) || *v11 < 0)
    {
      if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v17)) {
        return 0;
      }
    }
    else
    {
      unsigned int v17 = *v11;
      *((void *)a2 + 1) = v11 + 1;
    }
    int v12 = *((_DWORD *)a2 + 14);
    int v13 = *((_DWORD *)a2 + 15);
    *((_DWORD *)a2 + 14) = v12 + 1;
    if (v12 >= v13) {
      return 0;
    }
    wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(a2);
    if (!awd::profile::TypeVariant::MergePartialFromCodedStream(v10, a2) || !*((unsigned char *)a2 + 36)) {
      return 0;
    }
    wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(a2);
    int v14 = *((_DWORD *)a2 + 14);
    BOOL v15 = __OFSUB__(v14, 1);
    int v16 = v14 - 1;
    if (v16 < 0 == v15) {
      *((_DWORD *)a2 + 14) = v16;
    }
    if (*((void *)a2 + 1) == *((void *)a2 + 2)
      && (*((_DWORD *)a2 + 11) || *((_DWORD *)a2 + 6) == *((_DWORD *)a2 + 10)))
    {
      *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
      uint64_t result = 1;
      *((unsigned char *)a2 + 36) = 1;
      return result;
    }
  }
}

uint64_t awd::profile::ConfigurationParameter::SerializeWithCachedSizes(uint64_t this, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  uint64_t v5 = this;
  int v6 = *(_DWORD *)(this + 28);
  if (v6)
  {
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteString();
    if ((*(_DWORD *)(v5 + 28) & 2) == 0) {
      return this;
    }
  }
  else if ((v6 & 2) == 0)
  {
    return this;
  }
  uint64_t v7 = *(void *)(v5 + 16);
  if (!v7) {
    uint64_t v7 = *(void *)(awd::profile::ConfigurationParameter::default_instance_ + 16);
  }
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)2, v7, a2, a4);
}

uint64_t awd::profile::ConfigurationParameter::ByteSize(awd::profile::ConfigurationParameter *this)
{
  LOBYTE(v2) = *((unsigned char *)this + 28);
  if (!(_BYTE)v2)
  {
    uint64_t v3 = 0;
    goto LABEL_21;
  }
  if ((*((unsigned char *)this + 28) & 1) == 0)
  {
    uint64_t v3 = 0;
    if ((*((unsigned char *)this + 28) & 2) == 0) {
      goto LABEL_21;
    }
    goto LABEL_15;
  }
  uint64_t v4 = *((void *)this + 1);
  int v5 = *(unsigned __int8 *)(v4 + 23);
  char v6 = v5;
  uint64_t v7 = *(void *)(v4 + 8);
  if ((v5 & 0x80u) == 0) {
    unint64_t v8 = *(unsigned __int8 *)(v4 + 23);
  }
  else {
    unint64_t v8 = v7;
  }
  if (v8 >= 0x80)
  {
    int v10 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v8);
    int v5 = *(unsigned __int8 *)(v4 + 23);
    uint64_t v7 = *(void *)(v4 + 8);
    int v9 = v10 + 1;
    int v2 = *((_DWORD *)this + 7);
    char v6 = *(unsigned char *)(v4 + 23);
  }
  else
  {
    int v9 = 2;
  }
  if (v6 < 0) {
    int v5 = v7;
  }
  uint64_t v3 = (v9 + v5);
  if ((v2 & 2) != 0)
  {
LABEL_15:
    uint64_t v11 = (awd::profile::TypeVariant *)*((void *)this + 2);
    if (!v11) {
      uint64_t v11 = *(awd::profile::TypeVariant **)(awd::profile::ConfigurationParameter::default_instance_ + 16);
    }
    int v12 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)awd::profile::TypeVariant::ByteSize(v11);
    int v13 = (int)v12;
    if (v12 >= 0x80) {
      int v14 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v12);
    }
    else {
      int v14 = 1;
    }
    uint64_t v3 = (v3 + v13 + v14 + 1);
  }
LABEL_21:
  *((_DWORD *)this + 6) = v3;
  return v3;
}

void awd::profile::TypeVariant::MergeFrom(awd::profile::TypeVariant *this, const awd::profile::TypeVariant *a2)
{
  if (a2 == this)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v17);
  }
  int v4 = *((_DWORD *)a2 + 18);
  if (!(_BYTE)v4) {
    goto LABEL_13;
  }
  if (v4)
  {
    int v9 = *((_DWORD *)a2 + 4);
    *((_DWORD *)this + 18) |= 1u;
    *((_DWORD *)this + 4) = v9;
    int v4 = *((_DWORD *)a2 + 18);
    if ((v4 & 2) == 0)
    {
LABEL_6:
      if ((v4 & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_23;
    }
  }
  else if ((v4 & 2) == 0)
  {
    goto LABEL_6;
  }
  uint64_t v10 = *((void *)a2 + 1);
  *((_DWORD *)this + 18) |= 2u;
  *((void *)this + 1) = v10;
  int v4 = *((_DWORD *)a2 + 18);
  if ((v4 & 4) == 0)
  {
LABEL_7:
    if ((v4 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  int v11 = *((_DWORD *)a2 + 5);
  *((_DWORD *)this + 18) |= 4u;
  *((_DWORD *)this + 5) = v11;
  int v4 = *((_DWORD *)a2 + 18);
  if ((v4 & 8) == 0)
  {
LABEL_8:
    if ((v4 & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v12 = *((void *)a2 + 3);
  *((_DWORD *)this + 18) |= 8u;
  *((void *)this + 3) = v12;
  int v4 = *((_DWORD *)a2 + 18);
  if ((v4 & 0x10) == 0)
  {
LABEL_9:
    if ((v4 & 0x20) == 0) {
      goto LABEL_10;
    }
LABEL_26:
    uint64_t v14 = *((void *)a2 + 4);
    *((_DWORD *)this + 18) |= 0x20u;
    *((void *)this + 4) = v14;
    int v4 = *((_DWORD *)a2 + 18);
    if ((v4 & 0x40) == 0)
    {
LABEL_11:
      if ((v4 & 0x80) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_25:
  int v13 = *((_DWORD *)a2 + 10);
  *((_DWORD *)this + 18) |= 0x10u;
  *((_DWORD *)this + 10) = v13;
  int v4 = *((_DWORD *)a2 + 18);
  if ((v4 & 0x20) != 0) {
    goto LABEL_26;
  }
LABEL_10:
  if ((v4 & 0x40) == 0) {
    goto LABEL_11;
  }
LABEL_27:
  BOOL v15 = (const std::string *)*((void *)a2 + 6);
  *((_DWORD *)this + 18) |= 0x40u;
  int v16 = (std::string *)*((void *)this + 6);
  if (v16 == (std::string *)MEMORY[0x1E4FBA920]) {
    operator new();
  }
  std::string::operator=(v16, v15);
  int v4 = *((_DWORD *)a2 + 18);
  if ((v4 & 0x80) != 0)
  {
LABEL_12:
    char v5 = *((unsigned char *)a2 + 44);
    *((_DWORD *)this + 18) |= 0x80u;
    *((unsigned char *)this + 44) = v5;
    int v4 = *((_DWORD *)a2 + 18);
  }
LABEL_13:
  if ((v4 & 0xFF00) != 0)
  {
    if ((v4 & 0x100) != 0)
    {
      char v6 = (const std::string *)*((void *)a2 + 7);
      *((_DWORD *)this + 18) |= 0x100u;
      uint64_t v7 = (std::string *)*((void *)this + 7);
      if (v7 == (std::string *)MEMORY[0x1E4FBA920]) {
        operator new();
      }
      std::string::operator=(v7, v6);
      int v4 = *((_DWORD *)a2 + 18);
    }
    if ((v4 & 0x200) != 0)
    {
      int v8 = *((_DWORD *)a2 + 16);
      *((_DWORD *)this + 18) |= 0x200u;
      *((_DWORD *)this + 16) = v8;
    }
  }
}

void sub_1D3E43E90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)va);
  _Unwind_Resume(a1);
}

void awd::profile::ConfigurationParameter::CopyFrom(awd::profile::ConfigurationParameter *this, const awd::profile::ConfigurationParameter *a2)
{
  if (a2 != this)
  {
    (*(void (**)(awd::profile::ConfigurationParameter *))(*(void *)this + 32))(this);
    awd::profile::ConfigurationParameter::MergeFrom(this, a2);
  }
}

uint64_t awd::profile::ConfigurationParameter::IsInitialized(awd::profile::ConfigurationParameter *this)
{
  return 1;
}

uint64_t awd::profile::ConfigurationParameter::Swap(uint64_t this, awd::profile::ConfigurationParameter *a2)
{
  if (a2 != (awd::profile::ConfigurationParameter *)this)
  {
    uint64_t v2 = *(void *)(this + 8);
    *(void *)(this + MEMORY[0x1D9440F90]((char *)this + 8) = *((void *)a2 + 1);
    *((void *)a2 + 1) = v2;
    uint64_t v3 = *(void *)(this + 16);
    *(void *)(this + 16) = *((void *)a2 + 2);
    *((void *)a2 + 2) = v3;
    LODWORD(v3) = *(_DWORD *)(this + 28);
    *(_DWORD *)(this + 2MEMORY[0x1D9440F90]((char *)this + 8) = *((_DWORD *)a2 + 7);
    *((_DWORD *)a2 + 7) = v3;
    LODWORD(v3) = *(_DWORD *)(this + 24);
    *(_DWORD *)(this + 24) = *((_DWORD *)a2 + 6);
    *((_DWORD *)a2 + 6) = v3;
  }
  return this;
}

void *awd::profile::ConfigurationParameter::GetTypeName@<X0>(void *a1@<X8>)
{
  return sub_1D3E270D0(a1, "awd.profile.ConfigurationParameter");
}

double awd::profile::ComponentConfiguration::SharedCtor(awd::profile::ComponentConfiguration *this)
{
  double result = 0.0;
  *((void *)this + 7) = 0;
  *((void *)this + 11) = 0;
  return result;
}

awd::profile::ComponentConfiguration *awd::profile::ComponentConfiguration::ComponentConfiguration(awd::profile::ComponentConfiguration *this, const awd::profile::ComponentConfiguration *a2)
{
  *(void *)this = &unk_1F2B9B4A0;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *((_DWORD *)this + 6) = 0;
  *((void *)this + 4) = 0;
  *((void *)this + 5) = 0;
  *((_DWORD *)this + 12) = 0;
  *((void *)this + 11) = 0;
  *((void *)this + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  *((void *)this + 9) = 0;
  *((void *)this + 7) = 0;
  *((_DWORD *)this + 20) = 0;
  awd::profile::ComponentConfiguration::MergeFrom(this, a2);
  return this;
}

void sub_1D3E44044(_Unwind_Exception *a1)
{
  sub_1D3E4D870(v1 + 8);
  sub_1D3E4D870(v3);
  sub_1D3E4D870(v2);
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite((wireless_diagnostics::google::protobuf::MessageLite *)v1);
  _Unwind_Resume(a1);
}

void awd::profile::ComponentConfiguration::MergeFrom(awd::profile::ComponentConfiguration *this, const awd::profile::ComponentConfiguration *a2)
{
  if (a2 == this)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v17);
  }
  sub_1D3E4DAC4((int *)this + 2, (uint64_t)a2 + 8);
  wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((awd::profile::ComponentConfiguration *)((char *)this + 32));
  if (*((int *)a2 + 10) >= 1)
  {
    uint64_t v4 = 0;
    do
    {
      char v5 = *(const awd::profile::TriggerSource **)(*((void *)a2 + 4) + 8 * v4);
      int v6 = *((_DWORD *)this + 11);
      uint64_t v7 = *((int *)this + 10);
      if ((int)v7 >= v6)
      {
        if (v6 == *((_DWORD *)this + 12))
        {
          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((awd::profile::ComponentConfiguration *)((char *)this + 32));
          int v6 = *((_DWORD *)this + 11);
        }
        *((_DWORD *)this + 11) = v6 + 1;
        operator new();
      }
      uint64_t v8 = *((void *)this + 4);
      *((_DWORD *)this + 10) = v7 + 1;
      awd::profile::TriggerSource::MergeFrom(*(awd::profile::TriggerSource **)(v8 + 8 * v7), v5);
      ++v4;
    }
    while (v4 < *((int *)a2 + 10));
  }
  wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((awd::profile::ComponentConfiguration *)((char *)this + 64));
  if (*((int *)a2 + 18) >= 1)
  {
    uint64_t v9 = 0;
    do
    {
      uint64_t v10 = *(const awd::profile::ConfigurationParameter **)(*((void *)a2 + 8) + 8 * v9);
      int v11 = *((_DWORD *)this + 19);
      uint64_t v12 = *((int *)this + 18);
      if ((int)v12 >= v11)
      {
        if (v11 == *((_DWORD *)this + 20))
        {
          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((awd::profile::ComponentConfiguration *)((char *)this + 64));
          int v11 = *((_DWORD *)this + 19);
        }
        *((_DWORD *)this + 19) = v11 + 1;
        operator new();
      }
      uint64_t v13 = *((void *)this + 8);
      *((_DWORD *)this + 1MEMORY[0x1D9440F90]((char *)this + 8) = v12 + 1;
      awd::profile::ConfigurationParameter::MergeFrom(*(awd::profile::ConfigurationParameter **)(v13 + 8 * v12), v10);
      ++v9;
    }
    while (v9 < *((int *)a2 + 18));
  }
  LOBYTE(v14) = *((unsigned char *)a2 + 92);
  if ((_BYTE)v14)
  {
    if (*((unsigned char *)a2 + 92))
    {
      int v15 = *((_DWORD *)a2 + 14);
      *((_DWORD *)this + 23) |= 1u;
      *((_DWORD *)this + 14) = v15;
      int v14 = *((_DWORD *)a2 + 23);
    }
    if ((v14 & 0x10) != 0)
    {
      int v16 = *((_DWORD *)a2 + 15);
      *((_DWORD *)this + 23) |= 0x10u;
      *((_DWORD *)this + 15) = v16;
    }
  }
}

void sub_1D3E44314(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)va);
  _Unwind_Resume(a1);
}

void awd::profile::ComponentConfiguration::~ComponentConfiguration(awd::profile::ComponentConfiguration *this)
{
  *(void *)this = &unk_1F2B9B4A0;
  sub_1D3E4D870((uint64_t *)this + 8);
  sub_1D3E4D870((uint64_t *)this + 4);
  sub_1D3E4D870((uint64_t *)this + 1);
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(this);
}

{
  uint64_t vars8;

  awd::profile::ComponentConfiguration::~ComponentConfiguration(this);
  JUMPOUT(0x1D94412F0);
}

uint64_t awd::profile::ComponentConfiguration::SetCachedSize(uint64_t this, int a2)
{
  *(_DWORD *)(this + 8MEMORY[0x1D9440F90]((char *)this + 8) = a2;
  return this;
}

uint64_t awd::profile::ComponentConfiguration::default_instance(awd::profile::ComponentConfiguration *this, uint64_t a2, uint64_t a3, const char *a4)
{
  uint64_t result = awd::profile::ComponentConfiguration::default_instance_;
  if (!awd::profile::ComponentConfiguration::default_instance_)
  {
    awd::profile::protobuf_AddDesc_AwdProfile_2eproto(0, a2, a3, a4);
    return awd::profile::ComponentConfiguration::default_instance_;
  }
  return result;
}

void awd::profile::ComponentConfiguration::New(awd::profile::ComponentConfiguration *this)
{
}

uint64_t awd::profile::ComponentConfiguration::Clear(awd::profile::ComponentConfiguration *this)
{
  if (*((unsigned char *)this + 92)) {
    *((void *)this + 7) = 0;
  }
  sub_1D3E4D7B0((uint64_t)this + 8);
  sub_1D3E4D7B0((uint64_t)this + 32);
  uint64_t result = sub_1D3E4D7B0((uint64_t)this + 64);
  *((_DWORD *)this + 23) = 0;
  return result;
}

uint64_t awd::profile::ComponentConfiguration::MergePartialFromCodedStream(awd::profile::ComponentConfiguration *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2)
{
  uint64_t v4 = (awd::profile::ComponentConfiguration *)((char *)this + 8);
  char v5 = (awd::profile::ComponentConfiguration *)((char *)this + 32);
  int v6 = (awd::profile::ComponentConfiguration *)((char *)this + 64);
  uint64_t v7 = (unsigned int *)((char *)this + 60);
LABEL_2:
  while (2)
  {
    uint64_t v8 = (char *)*((void *)a2 + 1);
    if ((unint64_t)v8 >= *((void *)a2 + 2) || *v8 < 0)
    {
      unint64_t TagFallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(a2);
      *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = TagFallback;
      if (!TagFallback) {
        return 1;
      }
    }
    else
    {
      unint64_t TagFallback = *v8;
      *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = TagFallback;
      *((void *)a2 + 1) = v8 + 1;
      if (!TagFallback) {
        return 1;
      }
    }
    switch(TagFallback >> 3)
    {
      case 1u:
        int v10 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_22;
        }
        unsigned int v49 = 0;
        int v11 = (unsigned __int8 *)*((void *)a2 + 1);
        unint64_t v12 = *((void *)a2 + 2);
        if ((unint64_t)v11 >= v12 || (char)*v11 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v49);
          if (!result) {
            return result;
          }
          unsigned int v13 = v49;
          int v14 = (unsigned __int8 *)*((void *)a2 + 1);
          unint64_t v12 = *((void *)a2 + 2);
        }
        else
        {
          unsigned int v13 = *v11;
          int v14 = v11 + 1;
          *((void *)a2 + 1) = v14;
        }
        *((_DWORD *)this + 14) = v13;
        *((_DWORD *)this + 23) |= 1u;
        if ((unint64_t)v14 >= v12 || *v14 != 18) {
          continue;
        }
        goto LABEL_29;
      case 2u:
        int v10 = TagFallback & 7;
        if (v10 != 2) {
          goto LABEL_22;
        }
LABEL_30:
        int v18 = *((_DWORD *)this + 5);
        uint64_t v19 = *((int *)this + 4);
        if ((int)v19 >= v18)
        {
          if (v18 == *((_DWORD *)this + 6))
          {
            wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v4);
            int v18 = *((_DWORD *)this + 5);
          }
          *((_DWORD *)this + 5) = v18 + 1;
          operator new();
        }
        uint64_t v20 = *((void *)this + 1);
        *((_DWORD *)this + 4) = v19 + 1;
        uint64_t v21 = *(void *)(v20 + 8 * v19);
        unsigned int v49 = 0;
        int v22 = (char *)*((void *)a2 + 1);
        if ((unint64_t)v22 >= *((void *)a2 + 2) || *v22 < 0)
        {
          if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v49))return 0; {
        }
          }
        else
        {
          unsigned int v49 = *v22;
          *((void *)a2 + 1) = v22 + 1;
        }
        int v23 = *((_DWORD *)a2 + 14);
        int v24 = *((_DWORD *)a2 + 15);
        *((_DWORD *)a2 + 14) = v23 + 1;
        if (v23 >= v24) {
          return 0;
        }
        wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(a2);
        if (!awd::profile::Profile::MergePartialFromCodedStream(v21, a2) || !*((unsigned char *)a2 + 36)) {
          return 0;
        }
        wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(a2);
        int v25 = *((_DWORD *)a2 + 14);
        BOOL v26 = __OFSUB__(v25, 1);
        int v27 = v25 - 1;
        if (v27 < 0 == v26) {
          *((_DWORD *)a2 + 14) = v27;
        }
        int v14 = (unsigned __int8 *)*((void *)a2 + 1);
        if ((unint64_t)v14 >= *((void *)a2 + 2)) {
          continue;
        }
        int v28 = *v14;
        if (v28 == 18)
        {
LABEL_29:
          *((void *)a2 + 1) = v14 + 1;
          goto LABEL_30;
        }
        if (v28 != 26) {
          continue;
        }
        do
        {
          *((void *)a2 + 1) = v14 + 1;
LABEL_48:
          int v29 = *((_DWORD *)this + 11);
          uint64_t v30 = *((int *)this + 10);
          if ((int)v30 >= v29)
          {
            if (v29 == *((_DWORD *)this + 12))
            {
              wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v5);
              int v29 = *((_DWORD *)this + 11);
            }
            *((_DWORD *)this + 11) = v29 + 1;
            operator new();
          }
          uint64_t v31 = *((void *)this + 4);
          *((_DWORD *)this + 10) = v30 + 1;
          int v32 = *(awd::profile::TriggerSource **)(v31 + 8 * v30);
          unsigned int v49 = 0;
          uint64_t v33 = (char *)*((void *)a2 + 1);
          if ((unint64_t)v33 >= *((void *)a2 + 2) || *v33 < 0)
          {
            if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v49))return 0; {
          }
            }
          else
          {
            unsigned int v49 = *v33;
            *((void *)a2 + 1) = v33 + 1;
          }
          int v34 = *((_DWORD *)a2 + 14);
          int v35 = *((_DWORD *)a2 + 15);
          *((_DWORD *)a2 + 14) = v34 + 1;
          if (v34 >= v35) {
            return 0;
          }
          wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(a2);
          if (!awd::profile::TriggerSource::MergePartialFromCodedStream(v32, a2) || !*((unsigned char *)a2 + 36)) {
            return 0;
          }
          wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(a2);
          int v36 = *((_DWORD *)a2 + 14);
          BOOL v26 = __OFSUB__(v36, 1);
          int v37 = v36 - 1;
          if (v37 < 0 == v26) {
            *((_DWORD *)a2 + 14) = v37;
          }
          int v14 = (unsigned __int8 *)*((void *)a2 + 1);
          if ((unint64_t)v14 >= *((void *)a2 + 2)) {
            goto LABEL_2;
          }
          int v38 = *v14;
        }
        while (v38 == 26);
        if (v38 != 34) {
          continue;
        }
        do
        {
          *((void *)a2 + 1) = v14 + 1;
LABEL_66:
          int v39 = *((_DWORD *)this + 19);
          uint64_t v40 = *((int *)this + 18);
          if ((int)v40 >= v39)
          {
            if (v39 == *((_DWORD *)this + 20))
            {
              wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v6);
              int v39 = *((_DWORD *)this + 19);
            }
            *((_DWORD *)this + 19) = v39 + 1;
            operator new();
          }
          uint64_t v41 = *((void *)this + 8);
          *((_DWORD *)this + 1MEMORY[0x1D9440F90]((char *)this + 8) = v40 + 1;
          int v42 = *(awd::profile::ConfigurationParameter **)(v41 + 8 * v40);
          unsigned int v49 = 0;
          int v43 = (char *)*((void *)a2 + 1);
          if ((unint64_t)v43 >= *((void *)a2 + 2) || *v43 < 0)
          {
            if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v49))return 0; {
          }
            }
          else
          {
            unsigned int v49 = *v43;
            *((void *)a2 + 1) = v43 + 1;
          }
          int v44 = *((_DWORD *)a2 + 14);
          int v45 = *((_DWORD *)a2 + 15);
          *((_DWORD *)a2 + 14) = v44 + 1;
          if (v44 >= v45) {
            return 0;
          }
          wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(a2);
          if (!awd::profile::ConfigurationParameter::MergePartialFromCodedStream(v42, a2)
            || !*((unsigned char *)a2 + 36))
          {
            return 0;
          }
          wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(a2);
          int v46 = *((_DWORD *)a2 + 14);
          BOOL v26 = __OFSUB__(v46, 1);
          int v47 = v46 - 1;
          if (v47 < 0 == v26) {
            *((_DWORD *)a2 + 14) = v47;
          }
          int v14 = (unsigned __int8 *)*((void *)a2 + 1);
          unint64_t v16 = *((void *)a2 + 2);
        }
        while ((unint64_t)v14 < v16 && *v14 == 34);
        if ((int)v16 - (int)v14 < 2 || *v14 != 160 || v14[1] != 1) {
          continue;
        }
        int v15 = (char *)(v14 + 2);
        *((void *)a2 + 1) = v15;
        goto LABEL_86;
      case 3u:
        int v10 = TagFallback & 7;
        if (v10 == 2) {
          goto LABEL_48;
        }
        goto LABEL_22;
      case 4u:
        int v10 = TagFallback & 7;
        if (v10 == 2) {
          goto LABEL_66;
        }
        goto LABEL_22;
      default:
        if (TagFallback >> 3 == 20)
        {
          int v10 = TagFallback & 7;
          if ((TagFallback & 7) != 0) {
            goto LABEL_22;
          }
          int v15 = (char *)*((void *)a2 + 1);
          unint64_t v16 = *((void *)a2 + 2);
LABEL_86:
          if ((unint64_t)v15 >= v16 || *v15 < 0)
          {
            uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v7);
            if (!result) {
              return result;
            }
            char v48 = (unsigned __int8 *)*((void *)a2 + 1);
            unint64_t v16 = *((void *)a2 + 2);
          }
          else
          {
            *uint64_t v7 = *v15;
            char v48 = (unsigned __int8 *)(v15 + 1);
            *((void *)a2 + 1) = v48;
          }
          *((_DWORD *)this + 23) |= 0x10u;
          if (v48 == (unsigned __int8 *)v16 && (*((_DWORD *)a2 + 11) || *((_DWORD *)a2 + 6) == *((_DWORD *)a2 + 10)))
          {
            *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
            uint64_t result = 1;
            *((unsigned char *)a2 + 36) = 1;
            return result;
          }
          continue;
        }
        int v10 = TagFallback & 7;
LABEL_22:
        if (v10 != 4)
        {
          if ((wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipField(a2, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)TagFallback) & 1) == 0)return 0; {
          continue;
          }
        }
        return 1;
    }
  }
}

uint64_t awd::profile::ComponentConfiguration::SerializeWithCachedSizes(uint64_t this, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  uint64_t v5 = this;
  if (*(unsigned char *)(this + 92)) {
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)1, *(unsigned int *)(this + 56), (uint64_t)a2, a4);
  }
  if (*(int *)(v5 + 16) >= 1)
  {
    uint64_t v6 = 0;
    do
      this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)2, *(void *)(*(void *)(v5 + 8) + 8 * v6++), a2, a4);
    while (v6 < *(int *)(v5 + 16));
  }
  if (*(int *)(v5 + 40) >= 1)
  {
    uint64_t v7 = 0;
    do
      this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)3, *(void *)(*(void *)(v5 + 32) + 8 * v7++), a2, a4);
    while (v7 < *(int *)(v5 + 40));
  }
  if (*(int *)(v5 + 72) >= 1)
  {
    uint64_t v8 = 0;
    do
      this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)4, *(void *)(*(void *)(v5 + 64) + 8 * v8++), a2, a4);
    while (v8 < *(int *)(v5 + 72));
  }
  if ((*(unsigned char *)(v5 + 92) & 0x10) != 0)
  {
    uint64_t v9 = *(unsigned int *)(v5 + 60);
    return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)0x14, v9, (uint64_t)a2, a4);
  }
  return this;
}

uint64_t awd::profile::ComponentConfiguration::ByteSize(awd::profile::ComponentConfiguration *this)
{
  char v2 = *((unsigned char *)this + 92);
  if (!v2)
  {
    int v3 = 0;
    goto LABEL_17;
  }
  if (*((unsigned char *)this + 92))
  {
    uint64_t v4 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 14);
    if ((v4 & 0x80000000) != 0)
    {
      int v3 = 11;
      if ((v2 & 0x10) == 0) {
        goto LABEL_17;
      }
    }
    else if (v4 >= 0x80)
    {
      int v3 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v4) + 1;
      if ((*((_DWORD *)this + 23) & 0x10) == 0) {
        goto LABEL_17;
      }
    }
    else
    {
      int v3 = 2;
      if ((v2 & 0x10) == 0) {
        goto LABEL_17;
      }
    }
  }
  else
  {
    int v3 = 0;
    if ((*((unsigned char *)this + 92) & 0x10) == 0) {
      goto LABEL_17;
    }
  }
  uint64_t v5 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 15);
  if (v5 >= 0x80) {
    int v6 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v5) + 2;
  }
  else {
    int v6 = 3;
  }
  v3 += v6;
LABEL_17:
  int v7 = *((_DWORD *)this + 4);
  int v8 = v7 + v3;
  if (v7 >= 1)
  {
    uint64_t v9 = 0;
    do
    {
      int v10 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)awd::profile::Profile::ByteSize(*(awd::profile::Profile **)(*((void *)this + 1) + 8 * v9));
      int v11 = (int)v10;
      if (v10 >= 0x80) {
        int v12 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v10);
      }
      else {
        int v12 = 1;
      }
      v8 += v11 + v12;
      ++v9;
    }
    while (v9 < *((int *)this + 4));
  }
  int v13 = *((_DWORD *)this + 10);
  int v14 = v13 + v8;
  if (v13 >= 1)
  {
    uint64_t v15 = 0;
    do
    {
      unint64_t v16 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)awd::profile::TriggerSource::ByteSize(*(awd::profile::TriggerSource **)(*((void *)this + 4) + 8 * v15));
      int v17 = (int)v16;
      if (v16 >= 0x80) {
        int v18 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v16);
      }
      else {
        int v18 = 1;
      }
      v14 += v17 + v18;
      ++v15;
    }
    while (v15 < *((int *)this + 10));
  }
  int v19 = *((_DWORD *)this + 18);
  uint64_t v20 = (v19 + v14);
  if (v19 >= 1)
  {
    uint64_t v21 = 0;
    do
    {
      int v22 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)awd::profile::ConfigurationParameter::ByteSize(*(awd::profile::ConfigurationParameter **)(*((void *)this + 8) + 8 * v21));
      int v23 = (int)v22;
      if (v22 >= 0x80) {
        int v24 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v22);
      }
      else {
        int v24 = 1;
      }
      uint64_t v20 = (v23 + v20 + v24);
      ++v21;
    }
    while (v21 < *((int *)this + 18));
  }
  *((_DWORD *)this + 22) = v20;
  return v20;
}

void awd::profile::ComponentConfiguration::CopyFrom(awd::profile::ComponentConfiguration *this, const awd::profile::ComponentConfiguration *a2)
{
  if (a2 != this)
  {
    (*(void (**)(awd::profile::ComponentConfiguration *))(*(void *)this + 32))(this);
    awd::profile::ComponentConfiguration::MergeFrom(this, a2);
  }
}

uint64_t awd::profile::ComponentConfiguration::IsInitialized(awd::profile::ComponentConfiguration *this)
{
  return 1;
}

awd::profile::ComponentConfiguration *awd::profile::ComponentConfiguration::Swap(awd::profile::ComponentConfiguration *this, awd::profile::ComponentConfiguration *a2)
{
  if (a2 != this)
  {
    int v3 = this;
    int v4 = *((_DWORD *)this + 14);
    *((_DWORD *)this + 14) = *((_DWORD *)a2 + 14);
    *((_DWORD *)a2 + 14) = v4;
    wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Swap();
    wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Swap();
    this = (awd::profile::ComponentConfiguration *)wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Swap();
    int v5 = *((_DWORD *)v3 + 15);
    *((_DWORD *)v3 + 15) = *((_DWORD *)a2 + 15);
    *((_DWORD *)a2 + 15) = v5;
    int v6 = *((_DWORD *)v3 + 23);
    *((_DWORD *)v3 + 23) = *((_DWORD *)a2 + 23);
    *((_DWORD *)a2 + 23) = v6;
    int v7 = *((_DWORD *)v3 + 22);
    *((_DWORD *)v3 + 22) = *((_DWORD *)a2 + 22);
    *((_DWORD *)a2 + 22) = v7;
  }
  return this;
}

void *awd::profile::ComponentConfiguration::GetTypeName@<X0>(void *a1@<X8>)
{
  return sub_1D3E270D0(a1, "awd.profile.ComponentConfiguration");
}

uint64_t awd::profile::TimerSpec::SharedCtor(uint64_t this)
{
  *(void *)(this + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  *(void *)(this + 16) = 0;
  *(_DWORD *)(this + 24) = 0;
  return this;
}

awd::profile::TimerSpec *awd::profile::TimerSpec::TimerSpec(awd::profile::TimerSpec *this, const awd::profile::TimerSpec *a2)
{
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *(void *)this = &unk_1F2B9B770;
  *((_DWORD *)this + 6) = 0;
  awd::profile::TimerSpec::MergeFrom(this, a2);
  return this;
}

void sub_1D3E44FA4(_Unwind_Exception *a1)
{
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(v1);
  _Unwind_Resume(a1);
}

void awd::profile::TimerSpec::MergeFrom(awd::profile::TimerSpec *this, const awd::profile::TimerSpec *a2)
{
  if (a2 == this)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v7);
  }
  LOBYTE(v4) = *((unsigned char *)a2 + 24);
  if ((_BYTE)v4)
  {
    if (*((unsigned char *)a2 + 24))
    {
      uint64_t v5 = *((void *)a2 + 1);
      *((_DWORD *)this + 6) |= 1u;
      *((void *)this + 1) = v5;
      int v4 = *((_DWORD *)a2 + 6);
    }
    if ((v4 & 2) != 0)
    {
      int v6 = *((_DWORD *)a2 + 4);
      *((_DWORD *)this + 6) |= 2u;
      *((_DWORD *)this + 4) = v6;
    }
  }
}

void sub_1D3E45064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)va);
  _Unwind_Resume(a1);
}

void awd::profile::TimerSpec::~TimerSpec(awd::profile::TimerSpec *this)
{
  *(void *)this = &unk_1F2B9B770;
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(this);
}

{
  *(void *)this = &unk_1F2B9B770;
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(this);
}

{
  uint64_t vars8;

  *(void *)this = &unk_1F2B9B770;
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(this);
  JUMPOUT(0x1D94412F0);
}

uint64_t awd::profile::TimerSpec::SetCachedSize(uint64_t this, int a2)
{
  *(_DWORD *)(this + 20) = a2;
  return this;
}

uint64_t awd::profile::TimerSpec::default_instance(awd::profile::TimerSpec *this, uint64_t a2, uint64_t a3, const char *a4)
{
  uint64_t result = awd::profile::TimerSpec::default_instance_;
  if (!awd::profile::TimerSpec::default_instance_)
  {
    awd::profile::protobuf_AddDesc_AwdProfile_2eproto(0, a2, a3, a4);
    return awd::profile::TimerSpec::default_instance_;
  }
  return result;
}

void awd::profile::TimerSpec::New(awd::profile::TimerSpec *this)
{
}

uint64_t awd::profile::TimerSpec::Clear(uint64_t this)
{
  if (*(unsigned char *)(this + 24))
  {
    *(void *)(this + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
    *(_DWORD *)(this + 16) = 0;
  }
  *(_DWORD *)(this + 24) = 0;
  return this;
}

uint64_t awd::profile::TimerSpec::MergePartialFromCodedStream(awd::profile::TimerSpec *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2)
{
  int v4 = (unint64_t *)((char *)this + 8);
  uint64_t v5 = (unsigned int *)((char *)this + 16);
  while (1)
  {
    while (1)
    {
      int v6 = (char *)*((void *)a2 + 1);
      if ((unint64_t)v6 >= *((void *)a2 + 2) || *v6 < 0)
      {
        unint64_t TagFallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(a2);
        *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = TagFallback;
        if (!TagFallback) {
          return 1;
        }
      }
      else
      {
        unint64_t TagFallback = *v6;
        *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = TagFallback;
        *((void *)a2 + 1) = v6 + 1;
        if (!TagFallback) {
          return 1;
        }
      }
      if (TagFallback >> 3 != 1) {
        break;
      }
      int v8 = TagFallback & 7;
      if ((TagFallback & 7) != 0) {
        goto LABEL_16;
      }
      int v11 = (char *)*((void *)a2 + 1);
      unint64_t v9 = *((void *)a2 + 2);
      if ((unint64_t)v11 >= v9 || *v11 < 0)
      {
        uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(a2, v4);
        if (!result) {
          return result;
        }
        int v12 = (unsigned char *)*((void *)a2 + 1);
        unint64_t v9 = *((void *)a2 + 2);
      }
      else
      {
        unint64_t *v4 = *v11;
        int v12 = v11 + 1;
        *((void *)a2 + 1) = v12;
      }
      *((_DWORD *)this + 6) |= 1u;
      if ((unint64_t)v12 < v9 && *v12 == 16)
      {
        int v10 = v12 + 1;
        *((void *)a2 + 1) = v10;
LABEL_24:
        if ((unint64_t)v10 >= v9 || *v10 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v5);
          if (!result) {
            return result;
          }
          int v13 = (unsigned __int8 *)*((void *)a2 + 1);
          unint64_t v9 = *((void *)a2 + 2);
        }
        else
        {
          *uint64_t v5 = *v10;
          int v13 = (unsigned __int8 *)(v10 + 1);
          *((void *)a2 + 1) = v13;
        }
        *((_DWORD *)this + 6) |= 2u;
        if (v13 == (unsigned __int8 *)v9 && (*((_DWORD *)a2 + 11) || *((_DWORD *)a2 + 6) == *((_DWORD *)a2 + 10)))
        {
          *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
          uint64_t result = 1;
          *((unsigned char *)a2 + 36) = 1;
          return result;
        }
      }
    }
    if (TagFallback >> 3 == 2)
    {
      int v8 = TagFallback & 7;
      if ((TagFallback & 7) == 0)
      {
        int v10 = (char *)*((void *)a2 + 1);
        unint64_t v9 = *((void *)a2 + 2);
        goto LABEL_24;
      }
    }
    else
    {
      int v8 = TagFallback & 7;
    }
LABEL_16:
    if (v8 == 4) {
      return 1;
    }
    if ((wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipField(a2, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)TagFallback) & 1) == 0)return 0; {
  }
    }
}

uint64_t awd::profile::TimerSpec::SerializeWithCachedSizes(uint64_t this, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  uint64_t v5 = this;
  int v6 = *(_DWORD *)(this + 24);
  if (v6)
  {
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt64((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)1, *(void *)(this + 8), (uint64_t)a2, a4);
    int v6 = *(_DWORD *)(v5 + 24);
  }
  if ((v6 & 2) != 0)
  {
    uint64_t v7 = *(unsigned int *)(v5 + 16);
    return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)2, v7, (uint64_t)a2, a4);
  }
  return this;
}

uint64_t awd::profile::TimerSpec::ByteSize(wireless_diagnostics::google::protobuf::io::CodedOutputStream **this)
{
  if (*((unsigned char *)this + 24))
  {
    if ((_BYTE)this[3])
    {
      uint64_t v2 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64(this[1]) + 1;
      if ((this[3] & 2) == 0) {
        goto LABEL_11;
      }
    }
    else
    {
      uint64_t v2 = 0;
      if (((_BYTE)this[3] & 2) == 0) {
        goto LABEL_11;
      }
    }
    int v3 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 4);
    if (v3 >= 0x80) {
      int v4 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v3) + 1;
    }
    else {
      int v4 = 2;
    }
    uint64_t v2 = (v4 + v2);
  }
  else
  {
    uint64_t v2 = 0;
  }
LABEL_11:
  *((_DWORD *)this + 5) = v2;
  return v2;
}

void awd::profile::TimerSpec::CopyFrom(awd::profile::TimerSpec *this, const awd::profile::TimerSpec *a2)
{
  if (a2 != this)
  {
    (*(void (**)(awd::profile::TimerSpec *))(*(void *)this + 32))(this);
    awd::profile::TimerSpec::MergeFrom(this, a2);
  }
}

uint64_t awd::profile::TimerSpec::IsInitialized(awd::profile::TimerSpec *this)
{
  return 1;
}

uint64_t awd::profile::TimerSpec::Swap(uint64_t this, awd::profile::TimerSpec *a2)
{
  if (a2 != (awd::profile::TimerSpec *)this)
  {
    uint64_t v2 = *(void *)(this + 8);
    *(void *)(this + MEMORY[0x1D9440F90]((char *)this + 8) = *((void *)a2 + 1);
    *((void *)a2 + 1) = v2;
    LODWORD(v2) = *(_DWORD *)(this + 16);
    *(_DWORD *)(this + 16) = *((_DWORD *)a2 + 4);
    *((_DWORD *)a2 + 4) = v2;
    LODWORD(v2) = *(_DWORD *)(this + 24);
    *(_DWORD *)(this + 24) = *((_DWORD *)a2 + 6);
    *((_DWORD *)a2 + 6) = v2;
    LODWORD(v2) = *(_DWORD *)(this + 20);
    *(_DWORD *)(this + 20) = *((_DWORD *)a2 + 5);
    *((_DWORD *)a2 + 5) = v2;
  }
  return this;
}

void *awd::profile::TimerSpec::GetTypeName@<X0>(void *a1@<X8>)
{
  return sub_1D3E270D0(a1, "awd.profile.TimerSpec");
}

double awd::profile::TypeVariant::SharedCtor(awd::profile::TypeVariant *this)
{
  *((_DWORD *)this + 10) = 0;
  double result = 0.0;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + MEMORY[0x1D9440F90]((char *)this + 8) = 0u;
  uint64_t v2 = MEMORY[0x1E4FBA920];
  *((unsigned char *)this + 44) = 0;
  *((void *)this + 6) = v2;
  *((void *)this + 7) = v2;
  *((void *)this + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  *((_DWORD *)this + 1MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  return result;
}

awd::profile::TypeVariant *awd::profile::TypeVariant::TypeVariant(awd::profile::TypeVariant *this, const awd::profile::TypeVariant *a2)
{
  *(void *)this = &unk_1F2B9AF78;
  *(_OWORD *)((char *)this + MEMORY[0x1D9440F90]((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((_DWORD *)this + 10) = 0;
  uint64_t v3 = MEMORY[0x1E4FBA920];
  *((unsigned char *)this + 44) = 0;
  *((void *)this + 6) = v3;
  *((void *)this + 7) = v3;
  *((void *)this + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  *((_DWORD *)this + 1MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  awd::profile::TypeVariant::MergeFrom(this, a2);
  return this;
}

void sub_1D3E455F4(_Unwind_Exception *a1)
{
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(v1);
  _Unwind_Resume(a1);
}

void awd::profile::TypeVariant::~TypeVariant(awd::profile::TypeVariant *this)
{
  *(void *)this = &unk_1F2B9AF78;
  awd::profile::TypeVariant::SharedDtor((uint64_t)this);
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(this);
}

{
  uint64_t vars8;

  *(void *)this = &unk_1F2B9AF78;
  awd::profile::TypeVariant::SharedDtor((uint64_t)this);
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(this);
}

{
  uint64_t vars8;

  *(void *)this = &unk_1F2B9AF78;
  awd::profile::TypeVariant::SharedDtor((uint64_t)this);
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(this);
  JUMPOUT(0x1D94412F0);
}

uint64_t awd::profile::TypeVariant::SharedDtor(uint64_t this)
{
  uint64_t v1 = this;
  uint64_t v2 = *(void *)(this + 48);
  uint64_t v3 = MEMORY[0x1E4FBA920];
  if (v2 != MEMORY[0x1E4FBA920] && v2 != 0)
  {
    if (*(char *)(v2 + 23) < 0) {
      operator delete(*(void **)v2);
    }
    this = MEMORY[0x1D94412F0](v2, 0x1012C40EC159624);
  }
  uint64_t v5 = *(void *)(v1 + 56);
  if (v5 != v3 && v5 != 0)
  {
    if (*(char *)(v5 + 23) < 0) {
      operator delete(*(void **)v5);
    }
    JUMPOUT(0x1D94412F0);
  }
  return this;
}

uint64_t awd::profile::TypeVariant::SetCachedSize(uint64_t this, int a2)
{
  *(_DWORD *)(this + 6MEMORY[0x1D9440F90]((char *)this + 8) = a2;
  return this;
}

void awd::profile::TypeVariant::New(awd::profile::TypeVariant *this)
{
}

uint64_t awd::profile::TypeVariant::MergePartialFromCodedStream(awd::profile::TypeVariant *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2)
{
  int v4 = (unsigned int *)((char *)this + 20);
  uint64_t v5 = (unint64_t *)((char *)this + 24);
  uint64_t v6 = MEMORY[0x1E4FBA920];
  while (2)
  {
    uint64_t v7 = (char *)*((void *)a2 + 1);
    if ((unint64_t)v7 >= *((void *)a2 + 2) || *v7 < 0)
    {
      unint64_t TagFallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(a2);
      *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = TagFallback;
      if (!TagFallback) {
        return 1;
      }
    }
    else
    {
      unint64_t TagFallback = *v7;
      *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = TagFallback;
      *((void *)a2 + 1) = v7 + 1;
      if (!TagFallback) {
        return 1;
      }
    }
    switch(TagFallback >> 3)
    {
      case 1u:
        int v9 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_30;
        }
        v35[0] = 0;
        int v11 = (char *)*((void *)a2 + 1);
        unint64_t v10 = *((void *)a2 + 2);
        if ((unint64_t)v11 >= v10 || *v11 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v35);
          if (!result) {
            return result;
          }
          unsigned int v12 = v35[0];
          int v13 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v10 = *((void *)a2 + 2);
        }
        else
        {
          unsigned int v12 = *v11;
          int v13 = v11 + 1;
          *((void *)a2 + 1) = v13;
        }
        *((_DWORD *)this + 4) = v12;
        *((_DWORD *)this + 18) |= 1u;
        if ((unint64_t)v13 < v10 && *v13 == 16)
        {
          int v14 = v13 + 1;
          *((void *)a2 + 1) = v14;
          goto LABEL_39;
        }
        continue;
      case 2u:
        int v9 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_30;
        }
        int v14 = (char *)*((void *)a2 + 1);
        unint64_t v10 = *((void *)a2 + 2);
LABEL_39:
        *(void *)int v35 = 0;
        if ((unint64_t)v14 >= v10 || *v14 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(a2, (unint64_t *)v35);
          if (!result) {
            return result;
          }
          uint64_t v24 = *(void *)v35;
          int v25 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v10 = *((void *)a2 + 2);
        }
        else
        {
          uint64_t v24 = *v14;
          int v25 = v14 + 1;
          *((void *)a2 + 1) = v25;
        }
        *((void *)this + 1) = v24;
        *((_DWORD *)this + 18) |= 2u;
        if ((unint64_t)v25 >= v10 || *v25 != 24) {
          continue;
        }
        uint64_t v15 = v25 + 1;
        *((void *)a2 + 1) = v15;
LABEL_47:
        if ((unint64_t)v15 >= v10 || *v15 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v4);
          if (!result) {
            return result;
          }
          BOOL v26 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v10 = *((void *)a2 + 2);
        }
        else
        {
          unsigned int *v4 = *v15;
          BOOL v26 = v15 + 1;
          *((void *)a2 + 1) = v26;
        }
        *((_DWORD *)this + 18) |= 4u;
        if ((unint64_t)v26 >= v10 || *v26 != 32) {
          continue;
        }
        unint64_t v16 = v26 + 1;
        *((void *)a2 + 1) = v16;
LABEL_55:
        if ((unint64_t)v16 >= v10 || *v16 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(a2, v5);
          if (!result) {
            return result;
          }
          int v27 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v10 = *((void *)a2 + 2);
        }
        else
        {
          *uint64_t v5 = *v16;
          int v27 = v16 + 1;
          *((void *)a2 + 1) = v27;
        }
        *((_DWORD *)this + 18) |= 8u;
        if ((unint64_t)v27 >= v10 || *v27 != 45) {
          continue;
        }
        *((void *)a2 + 1) = v27 + 1;
LABEL_63:
        v35[0] = 0;
        if ((wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(a2, v35) & 1) == 0) {
          return 0;
        }
        *((_DWORD *)this + 10) = v35[0];
        *((_DWORD *)this + 18) |= 0x10u;
        int v28 = (unsigned char *)*((void *)a2 + 1);
        if ((unint64_t)v28 >= *((void *)a2 + 2) || *v28 != 49) {
          continue;
        }
        *((void *)a2 + 1) = v28 + 1;
LABEL_67:
        *(void *)int v35 = 0;
        if (wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(a2, (unint64_t *)v35))
        {
          *((void *)this + 4) = *(void *)v35;
          int v17 = *((_DWORD *)this + 18) | 0x20;
          *((_DWORD *)this + 1MEMORY[0x1D9440F90]((char *)this + 8) = v17;
          int v29 = (unsigned char *)*((void *)a2 + 1);
          if ((unint64_t)v29 < *((void *)a2 + 2) && *v29 == 58)
          {
            *((void *)a2 + 1) = v29 + 1;
LABEL_71:
            *((_DWORD *)this + 1MEMORY[0x1D9440F90]((char *)this + 8) = v17 | 0x40;
            if (*((void *)this + 6) == v6) {
              operator new();
            }
            uint64_t result = wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadString();
            if (!result) {
              return result;
            }
            uint64_t v30 = (unsigned char *)*((void *)a2 + 1);
            unint64_t v18 = *((void *)a2 + 2);
            if ((unint64_t)v30 < v18 && *v30 == 64)
            {
              int v19 = v30 + 1;
              *((void *)a2 + 1) = v19;
LABEL_77:
              v35[0] = 0;
              if ((unint64_t)v19 >= v18 || *v19 < 0)
              {
                uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v35);
                if (!result) {
                  return result;
                }
                unsigned int v31 = v35[0];
                int v32 = (unsigned char *)*((void *)a2 + 1);
                unint64_t v18 = *((void *)a2 + 2);
              }
              else
              {
                unsigned int v31 = *v19;
                int v32 = v19 + 1;
                *((void *)a2 + 1) = v32;
              }
              *((unsigned char *)this + 44) = v31 != 0;
              int v20 = *((_DWORD *)this + 18) | 0x80;
              *((_DWORD *)this + 1MEMORY[0x1D9440F90]((char *)this + 8) = v20;
              if ((unint64_t)v32 < v18 && *v32 == 74)
              {
                *((void *)a2 + 1) = v32 + 1;
LABEL_85:
                *((_DWORD *)this + 1MEMORY[0x1D9440F90]((char *)this + 8) = v20 | 0x100;
                if (*((void *)this + 7) == v6) {
                  operator new();
                }
                uint64_t result = wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadBytes();
                if (!result) {
                  return result;
                }
                uint64_t v33 = (unsigned char *)*((void *)a2 + 1);
                unint64_t v21 = *((void *)a2 + 2);
                if ((unint64_t)v33 < v21 && *v33 == 80)
                {
                  int v22 = v33 + 1;
                  *((void *)a2 + 1) = v22;
LABEL_91:
                  v35[0] = 0;
                  if ((unint64_t)v22 >= v21 || (int v34 = *v22, v34 < 0))
                  {
                    uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v35);
                    if (!result) {
                      return result;
                    }
                    if (v35[0]) {
                      goto LABEL_95;
                    }
                  }
                  else
                  {
                    *((void *)a2 + 1) = v22 + 1;
                    if ((_BYTE)v34) {
                      goto LABEL_95;
                    }
                  }
                  *((_DWORD *)this + 18) |= 0x200u;
                  *((_DWORD *)this + 16) = 0;
LABEL_95:
                  if (*((void *)a2 + 1) == *((void *)a2 + 2)
                    && (*((_DWORD *)a2 + 11) || *((_DWORD *)a2 + 6) == *((_DWORD *)a2 + 10)))
                  {
                    *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
                    uint64_t result = 1;
                    *((unsigned char *)a2 + 36) = 1;
                    return result;
                  }
                }
              }
            }
          }
          continue;
        }
        return 0;
      case 3u:
        int v9 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_30;
        }
        uint64_t v15 = (char *)*((void *)a2 + 1);
        unint64_t v10 = *((void *)a2 + 2);
        goto LABEL_47;
      case 4u:
        int v9 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_30;
        }
        unint64_t v16 = (char *)*((void *)a2 + 1);
        unint64_t v10 = *((void *)a2 + 2);
        goto LABEL_55;
      case 5u:
        int v9 = TagFallback & 7;
        if (v9 == 5) {
          goto LABEL_63;
        }
        goto LABEL_30;
      case 6u:
        int v9 = TagFallback & 7;
        if (v9 == 1) {
          goto LABEL_67;
        }
        goto LABEL_30;
      case 7u:
        int v9 = TagFallback & 7;
        if (v9 != 2) {
          goto LABEL_30;
        }
        int v17 = *((_DWORD *)this + 18);
        goto LABEL_71;
      case 8u:
        int v9 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_30;
        }
        int v19 = (char *)*((void *)a2 + 1);
        unint64_t v18 = *((void *)a2 + 2);
        goto LABEL_77;
      case 9u:
        int v9 = TagFallback & 7;
        if (v9 != 2) {
          goto LABEL_30;
        }
        int v20 = *((_DWORD *)this + 18);
        goto LABEL_85;
      case 0xAu:
        int v9 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_30;
        }
        int v22 = (char *)*((void *)a2 + 1);
        unint64_t v21 = *((void *)a2 + 2);
        goto LABEL_91;
      default:
        int v9 = TagFallback & 7;
LABEL_30:
        if (v9 == 4) {
          return 1;
        }
        if ((wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipField(a2, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)TagFallback) & 1) == 0)return 0; {
        continue;
        }
    }
  }
}

uint64_t awd::profile::TypeVariant::SerializeWithCachedSizes(uint64_t this, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  uint64_t v5 = this;
  int v6 = *(_DWORD *)(this + 72);
  if (v6)
  {
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)1, *(unsigned int *)(this + 16), (uint64_t)a2, a4);
    int v6 = *(_DWORD *)(v5 + 72);
    if ((v6 & 2) == 0)
    {
LABEL_3:
      if ((v6 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_3;
  }
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt64((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)2, *(void *)(v5 + 8), (uint64_t)a2, a4);
  int v6 = *(_DWORD *)(v5 + 72);
  if ((v6 & 4) == 0)
  {
LABEL_4:
    if ((v6 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)3, *(unsigned int *)(v5 + 20), (uint64_t)a2, a4);
  int v6 = *(_DWORD *)(v5 + 72);
  if ((v6 & 8) == 0)
  {
LABEL_5:
    if ((v6 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt64((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)4, *(void *)(v5 + 24), (uint64_t)a2, a4);
  int v6 = *(_DWORD *)(v5 + 72);
  if ((v6 & 0x10) == 0)
  {
LABEL_6:
    if ((v6 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteFloat((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)5, (uint64_t)a2, *(float *)(v5 + 40), a3);
  int v6 = *(_DWORD *)(v5 + 72);
  if ((v6 & 0x20) == 0)
  {
LABEL_7:
    if ((v6 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteDouble((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)6, (uint64_t)a2, *(double *)(v5 + 32), a3);
  int v6 = *(_DWORD *)(v5 + 72);
  if ((v6 & 0x40) == 0)
  {
LABEL_8:
    if ((v6 & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteString();
  int v6 = *(_DWORD *)(v5 + 72);
  if ((v6 & 0x80) == 0)
  {
LABEL_9:
    if ((v6 & 0x100) == 0) {
      goto LABEL_10;
    }
LABEL_20:
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBytes();
    if ((*(_DWORD *)(v5 + 72) & 0x200) == 0) {
      return this;
    }
    goto LABEL_21;
  }
LABEL_19:
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBool((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)8, *(unsigned __int8 *)(v5 + 44), (uint64_t)a2, a4);
  int v6 = *(_DWORD *)(v5 + 72);
  if ((v6 & 0x100) != 0) {
    goto LABEL_20;
  }
LABEL_10:
  if ((v6 & 0x200) == 0) {
    return this;
  }
LABEL_21:
  uint64_t v7 = *(unsigned int *)(v5 + 64);
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteEnum((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)0xA, v7, (uint64_t)a2, a4);
}

uint64_t awd::profile::TypeVariant::ByteSize(awd::profile::TypeVariant *this)
{
  int v2 = *((_DWORD *)this + 18);
  if (!(_BYTE)v2)
  {
    uint64_t v4 = 0;
    goto LABEL_37;
  }
  if ((v2 & 1) == 0)
  {
    int v3 = 0;
    if ((v2 & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  uint64_t v5 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 4);
  if ((v5 & 0x80000000) != 0)
  {
    int v3 = 11;
    if ((v2 & 2) != 0) {
      goto LABEL_13;
    }
  }
  else
  {
    if (v5 >= 0x80)
    {
      int v3 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v5) + 1;
      int v2 = *((_DWORD *)this + 18);
      if ((v2 & 2) == 0) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
    int v3 = 2;
    if ((v2 & 2) != 0)
    {
LABEL_13:
      v3 += wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64(*((wireless_diagnostics::google::protobuf::io::CodedOutputStream **)this
                                                                                        + 1))
          + 1;
      int v2 = *((_DWORD *)this + 18);
    }
  }
LABEL_14:
  if ((v2 & 4) != 0)
  {
    int v13 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 5);
    if (v13 >= 0x80)
    {
      int v14 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v13) + 1;
      int v2 = *((_DWORD *)this + 18);
    }
    else
    {
      int v14 = 2;
    }
    v3 += v14;
    if ((v2 & 8) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if ((v2 & 8) != 0)
  {
LABEL_16:
    v3 += wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64(*((wireless_diagnostics::google::protobuf::io::CodedOutputStream **)this
                                                                                      + 3))
        + 1;
    int v2 = *((_DWORD *)this + 18);
  }
LABEL_17:
  int v6 = v3 + 5;
  if ((v2 & 0x10) == 0) {
    int v6 = v3;
  }
  if ((v2 & 0x20) != 0) {
    LODWORD(v4) = v6 + 9;
  }
  else {
    LODWORD(v4) = v6;
  }
  if ((v2 & 0x40) != 0)
  {
    uint64_t v7 = *((void *)this + 6);
    int v8 = *(unsigned __int8 *)(v7 + 23);
    char v9 = v8;
    uint64_t v10 = *(void *)(v7 + 8);
    if ((v8 & 0x80u) == 0) {
      unint64_t v11 = *(unsigned __int8 *)(v7 + 23);
    }
    else {
      unint64_t v11 = v10;
    }
    if (v11 >= 0x80)
    {
      int v12 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v11);
      int v8 = *(unsigned __int8 *)(v7 + 23);
      uint64_t v10 = *(void *)(v7 + 8);
      int v2 = *((_DWORD *)this + 18);
      char v9 = *(unsigned char *)(v7 + 23);
    }
    else
    {
      int v12 = 1;
    }
    if (v9 < 0) {
      int v8 = v10;
    }
    LODWORD(v4) = v4 + v12 + v8 + 1;
  }
  if ((v2 & 0x80) != 0) {
    uint64_t v4 = (v4 + 2);
  }
  else {
    uint64_t v4 = v4;
  }
LABEL_37:
  if ((v2 & 0xFF00) != 0)
  {
    if ((v2 & 0x100) != 0)
    {
      uint64_t v15 = *((void *)this + 7);
      int v16 = *(unsigned __int8 *)(v15 + 23);
      char v17 = v16;
      uint64_t v18 = *(void *)(v15 + 8);
      if ((v16 & 0x80u) == 0) {
        unint64_t v19 = *(unsigned __int8 *)(v15 + 23);
      }
      else {
        unint64_t v19 = v18;
      }
      if (v19 >= 0x80)
      {
        int v20 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v19);
        int v16 = *(unsigned __int8 *)(v15 + 23);
        uint64_t v18 = *(void *)(v15 + 8);
        int v2 = *((_DWORD *)this + 18);
        char v17 = *(unsigned char *)(v15 + 23);
      }
      else
      {
        int v20 = 1;
      }
      if (v17 < 0) {
        int v16 = v18;
      }
      uint64_t v4 = (v4 + v20 + v16 + 1);
    }
    if ((v2 & 0x200) != 0)
    {
      unint64_t v21 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 16);
      if ((v21 & 0x80000000) != 0)
      {
        int v22 = 11;
      }
      else if (v21 >= 0x80)
      {
        int v22 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v21) + 1;
      }
      else
      {
        int v22 = 2;
      }
      uint64_t v4 = (v22 + v4);
    }
  }
  *((_DWORD *)this + 17) = v4;
  return v4;
}

void awd::profile::TypeVariant::CopyFrom(awd::profile::TypeVariant *this, const awd::profile::TypeVariant *a2)
{
  if (a2 != this)
  {
    (*(void (**)(awd::profile::TypeVariant *))(*(void *)this + 32))(this);
    awd::profile::TypeVariant::MergeFrom(this, a2);
  }
}

uint64_t awd::profile::TypeVariant::IsInitialized(awd::profile::TypeVariant *this)
{
  return 1;
}

double awd::profile::TypeVariant::Swap(awd::profile::TypeVariant *this, awd::profile::TypeVariant *a2)
{
  if (a2 != this)
  {
    int v2 = *((_DWORD *)this + 4);
    *((_DWORD *)this + 4) = *((_DWORD *)a2 + 4);
    *((_DWORD *)a2 + 4) = v2;
    uint64_t v3 = *((void *)this + 1);
    *((void *)this + 1) = *((void *)a2 + 1);
    *((void *)a2 + 1) = v3;
    LODWORD(v3) = *((_DWORD *)this + 5);
    *((_DWORD *)this + 5) = *((_DWORD *)a2 + 5);
    *((_DWORD *)a2 + 5) = v3;
    uint64_t v4 = *((void *)this + 3);
    *((void *)this + 3) = *((void *)a2 + 3);
    *((void *)a2 + 3) = v4;
    int v5 = *((_DWORD *)this + 10);
    *((_DWORD *)this + 10) = *((_DWORD *)a2 + 10);
    *((_DWORD *)a2 + 10) = v5;
    double result = *((double *)this + 4);
    *((void *)this + 4) = *((void *)a2 + 4);
    *((double *)a2 + 4) = result;
    uint64_t v7 = *((void *)this + 6);
    *((void *)this + 6) = *((void *)a2 + 6);
    *((void *)a2 + 6) = v7;
    LOBYTE(v7) = *((unsigned char *)this + 44);
    *((unsigned char *)this + 44) = *((unsigned char *)a2 + 44);
    *((unsigned char *)a2 + 44) = v7;
    uint64_t v8 = *((void *)this + 7);
    *((void *)this + 7) = *((void *)a2 + 7);
    *((void *)a2 + 7) = v8;
    LODWORD(vMEMORY[0x1D9440F90]((char *)this + 8) = *((_DWORD *)this + 16);
    *((_DWORD *)this + 16) = *((_DWORD *)a2 + 16);
    *((_DWORD *)a2 + 16) = v8;
    LODWORD(vMEMORY[0x1D9440F90]((char *)this + 8) = *((_DWORD *)this + 18);
    *((_DWORD *)this + 1MEMORY[0x1D9440F90]((char *)this + 8) = *((_DWORD *)a2 + 18);
    *((_DWORD *)a2 + 1MEMORY[0x1D9440F90]((char *)this + 8) = v8;
    LODWORD(vMEMORY[0x1D9440F90]((char *)this + 8) = *((_DWORD *)this + 17);
    *((_DWORD *)this + 17) = *((_DWORD *)a2 + 17);
    *((_DWORD *)a2 + 17) = v8;
  }
  return result;
}

void *awd::profile::TypeVariant::GetTypeName@<X0>(void *a1@<X8>)
{
  return sub_1D3E270D0(a1, "awd.profile.TypeVariant");
}

uint64_t awd::profile::Condition::SharedCtor(uint64_t this)
{
  *(void *)(this + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  *(void *)(this + 16) = 0;
  *(void *)(this + 21) = 0;
  uint64_t v1 = MEMORY[0x1E4FBA920];
  *(void *)(this + 32) = 0;
  *(void *)(this + 40) = 0;
  *(void *)(this + 4MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  *(void *)(this + 56) = v1;
  *(unsigned char *)(this + 29) = 0;
  *(void *)(this + 64) = 0;
  return this;
}

awd::profile::Condition *awd::profile::Condition::Condition(awd::profile::Condition *this, const awd::profile::Condition *a2)
{
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *(void *)this = &unk_1F2B9B6F8;
  *(void *)((char *)this + 21) = 0;
  uint64_t v3 = MEMORY[0x1E4FBA920];
  *((void *)this + 4) = 0;
  *((void *)this + 5) = 0;
  *((void *)this + 6) = 0;
  *((void *)this + 7) = v3;
  *((unsigned char *)this + 29) = 0;
  *((void *)this + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  awd::profile::Condition::MergeFrom(this, a2);
  return this;
}

void sub_1D3E4634C(_Unwind_Exception *a1)
{
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(v1);
  _Unwind_Resume(a1);
}

void awd::profile::Condition::MergeFrom(awd::profile::Condition *this, const awd::profile::Condition *a2)
{
  if (a2 == this)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v20);
  }
  int v4 = *((_DWORD *)a2 + 17);
  if (!(_BYTE)v4) {
    goto LABEL_37;
  }
  if (v4)
  {
    int v5 = *((_DWORD *)a2 + 2);
    *((_DWORD *)this + 17) |= 1u;
    *((_DWORD *)this + 2) = v5;
    int v4 = *((_DWORD *)a2 + 17);
    if ((v4 & 2) == 0)
    {
LABEL_6:
      if ((v4 & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_15;
    }
  }
  else if ((v4 & 2) == 0)
  {
    goto LABEL_6;
  }
  int v6 = *((_DWORD *)a2 + 3);
  *((_DWORD *)this + 17) |= 2u;
  *((_DWORD *)this + 3) = v6;
  int v4 = *((_DWORD *)a2 + 17);
  if ((v4 & 4) == 0)
  {
LABEL_7:
    if ((v4 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_15:
  int v7 = *((_DWORD *)a2 + 6);
  *((_DWORD *)this + 17) |= 4u;
  *((_DWORD *)this + 6) = v7;
  int v4 = *((_DWORD *)a2 + 17);
  if ((v4 & 8) == 0)
  {
LABEL_8:
    if ((v4 & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_17;
  }
LABEL_16:
  char v8 = *((unsigned char *)a2 + 28);
  *((_DWORD *)this + 17) |= 8u;
  *((unsigned char *)this + 2MEMORY[0x1D9440F90]((char *)this + 8) = v8;
  int v4 = *((_DWORD *)a2 + 17);
  if ((v4 & 0x10) == 0)
  {
LABEL_9:
    if ((v4 & 0x20) == 0) {
      goto LABEL_10;
    }
LABEL_22:
    *((_DWORD *)this + 17) |= 0x20u;
    unint64_t v11 = (awd::profile::TypeVariant *)*((void *)this + 4);
    if (!v11) {
      operator new();
    }
    int v12 = (const awd::profile::TypeVariant *)*((void *)a2 + 4);
    if (!v12) {
      int v12 = *(const awd::profile::TypeVariant **)(awd::profile::Condition::default_instance_ + 32);
    }
    awd::profile::TypeVariant::MergeFrom(v11, v12);
    int v4 = *((_DWORD *)a2 + 17);
    if ((v4 & 0x40) == 0)
    {
LABEL_11:
      if ((v4 & 0x80) == 0) {
        goto LABEL_37;
      }
      goto LABEL_32;
    }
    goto LABEL_27;
  }
LABEL_17:
  *((_DWORD *)this + 17) |= 0x10u;
  char v9 = (awd::profile::TypeVariant *)*((void *)this + 2);
  if (!v9) {
    operator new();
  }
  uint64_t v10 = (const awd::profile::TypeVariant *)*((void *)a2 + 2);
  if (!v10) {
    uint64_t v10 = *(const awd::profile::TypeVariant **)(awd::profile::Condition::default_instance_ + 16);
  }
  awd::profile::TypeVariant::MergeFrom(v9, v10);
  int v4 = *((_DWORD *)a2 + 17);
  if ((v4 & 0x20) != 0) {
    goto LABEL_22;
  }
LABEL_10:
  if ((v4 & 0x40) == 0) {
    goto LABEL_11;
  }
LABEL_27:
  *((_DWORD *)this + 17) |= 0x40u;
  int v13 = (awd::profile::TypeVariant *)*((void *)this + 5);
  if (!v13) {
    operator new();
  }
  int v14 = (const awd::profile::TypeVariant *)*((void *)a2 + 5);
  if (!v14) {
    int v14 = *(const awd::profile::TypeVariant **)(awd::profile::Condition::default_instance_ + 40);
  }
  awd::profile::TypeVariant::MergeFrom(v13, v14);
  int v4 = *((_DWORD *)a2 + 17);
  if ((v4 & 0x80) != 0)
  {
LABEL_32:
    *((_DWORD *)this + 17) |= 0x80u;
    uint64_t v15 = (awd::profile::TypeVariant *)*((void *)this + 6);
    if (!v15) {
      operator new();
    }
    int v16 = (const awd::profile::TypeVariant *)*((void *)a2 + 6);
    if (!v16) {
      int v16 = *(const awd::profile::TypeVariant **)(awd::profile::Condition::default_instance_ + 48);
    }
    awd::profile::TypeVariant::MergeFrom(v15, v16);
    int v4 = *((_DWORD *)a2 + 17);
  }
LABEL_37:
  if ((v4 & 0xFF00) != 0)
  {
    if ((v4 & 0x100) != 0)
    {
      char v17 = (const std::string *)*((void *)a2 + 7);
      *((_DWORD *)this + 17) |= 0x100u;
      uint64_t v18 = (std::string *)*((void *)this + 7);
      if (v18 == (std::string *)MEMORY[0x1E4FBA920]) {
        operator new();
      }
      std::string::operator=(v18, v17);
      int v4 = *((_DWORD *)a2 + 17);
    }
    if ((v4 & 0x200) != 0)
    {
      char v19 = *((unsigned char *)a2 + 29);
      *((_DWORD *)this + 17) |= 0x200u;
      *((unsigned char *)this + 29) = v19;
    }
  }
}

void sub_1D3E4673C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)va);
  _Unwind_Resume(a1);
}

void awd::profile::Condition::~Condition(awd::profile::Condition *this)
{
  *(void *)this = &unk_1F2B9B6F8;
  awd::profile::Condition::SharedDtor(this);
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(this);
}

{
  uint64_t vars8;

  *(void *)this = &unk_1F2B9B6F8;
  awd::profile::Condition::SharedDtor(this);
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(this);
}

{
  uint64_t vars8;

  *(void *)this = &unk_1F2B9B6F8;
  awd::profile::Condition::SharedDtor(this);
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(this);
  JUMPOUT(0x1D94412F0);
}

void *awd::profile::Condition::SharedDtor(void *this)
{
  uint64_t v1 = this;
  uint64_t v2 = this[7];
  if (v2 != MEMORY[0x1E4FBA920] && v2 != 0)
  {
    if (*(char *)(v2 + 23) < 0) {
      operator delete(*(void **)v2);
    }
    this = (void *)MEMORY[0x1D94412F0](v2, 0x1012C40EC159624);
  }
  if ((void *)awd::profile::Condition::default_instance_ != v1)
  {
    uint64_t v4 = v1[2];
    if (v4) {
      (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
    }
    uint64_t v5 = v1[4];
    if (v5) {
      (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
    }
    uint64_t v6 = v1[5];
    if (v6) {
      (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
    }
    this = (void *)v1[6];
    if (this)
    {
      int v7 = *(uint64_t (**)(void))(*this + 8);
      return (void *)v7();
    }
  }
  return this;
}

uint64_t awd::profile::Condition::SetCachedSize(uint64_t this, int a2)
{
  *(_DWORD *)(this + 64) = a2;
  return this;
}

uint64_t awd::profile::Condition::default_instance(awd::profile::Condition *this, uint64_t a2, uint64_t a3, const char *a4)
{
  uint64_t result = awd::profile::Condition::default_instance_;
  if (!awd::profile::Condition::default_instance_)
  {
    awd::profile::protobuf_AddDesc_AwdProfile_2eproto(0, a2, a3, a4);
    return awd::profile::Condition::default_instance_;
  }
  return result;
}

void awd::profile::Condition::New(awd::profile::Condition *this)
{
}

uint64_t awd::profile::Condition::Clear(uint64_t this)
{
  uint64_t v1 = this;
  int v2 = *(_DWORD *)(this + 68);
  if ((_BYTE)v2)
  {
    *(void *)(this + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
    *(_DWORD *)(this + 24) = 0;
    *(unsigned char *)(this + 2MEMORY[0x1D9440F90]((char *)this + 8) = 0;
    if ((v2 & 0x10) != 0)
    {
      this = *(void *)(this + 16);
      if (this)
      {
        this = awd::profile::TypeVariant::Clear(this);
        int v2 = *(_DWORD *)(v1 + 68);
      }
    }
    if ((v2 & 0x20) != 0)
    {
      this = *(void *)(v1 + 32);
      if (this)
      {
        this = awd::profile::TypeVariant::Clear(this);
        int v2 = *(_DWORD *)(v1 + 68);
      }
    }
    if ((v2 & 0x40) != 0)
    {
      this = *(void *)(v1 + 40);
      if (this)
      {
        this = awd::profile::TypeVariant::Clear(this);
        int v2 = *(_DWORD *)(v1 + 68);
      }
    }
    if ((v2 & 0x80) != 0)
    {
      this = *(void *)(v1 + 48);
      if (this)
      {
        this = awd::profile::TypeVariant::Clear(this);
        int v2 = *(_DWORD *)(v1 + 68);
      }
    }
  }
  if ((v2 & 0xFF00) != 0)
  {
    if ((v2 & 0x100) != 0)
    {
      uint64_t v3 = *(void *)(v1 + 56);
      if (v3 != MEMORY[0x1E4FBA920])
      {
        if (*(char *)(v3 + 23) < 0)
        {
          **(unsigned char **)uint64_t v3 = 0;
          *(void *)(v3 + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
        }
        else
        {
          *(unsigned char *)uint64_t v3 = 0;
          *(unsigned char *)(v3 + 23) = 0;
        }
      }
    }
    *(unsigned char *)(v1 + 29) = 0;
  }
  *(_DWORD *)(v1 + 6MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  return this;
}

uint64_t awd::profile::Condition::MergePartialFromCodedStream(awd::profile::Condition *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2)
{
  uint64_t v4 = (unsigned int *)((char *)this + 8);
  uint64_t v5 = (unsigned int *)((char *)this + 12);
  uint64_t v6 = MEMORY[0x1E4FBA920];
  while (2)
  {
    int v7 = (char *)*((void *)a2 + 1);
    if ((unint64_t)v7 >= *((void *)a2 + 2) || *v7 < 0)
    {
      unint64_t TagFallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(a2);
      *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = TagFallback;
      if (!TagFallback) {
        return 1;
      }
    }
    else
    {
      unint64_t TagFallback = *v7;
      *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = TagFallback;
      *((void *)a2 + 1) = v7 + 1;
      if (!TagFallback) {
        return 1;
      }
    }
    unsigned int v9 = TagFallback >> 3;
    switch(TagFallback >> 3)
    {
      case 1u:
        int v10 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_32;
        }
        int v12 = (char *)*((void *)a2 + 1);
        unint64_t v11 = *((void *)a2 + 2);
        if ((unint64_t)v12 >= v11 || *v12 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v4);
          if (!result) {
            return result;
          }
          int v13 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v11 = *((void *)a2 + 2);
        }
        else
        {
          unsigned int *v4 = *v12;
          int v13 = v12 + 1;
          *((void *)a2 + 1) = v13;
        }
        *((_DWORD *)this + 17) |= 1u;
        if ((unint64_t)v13 < v11 && *v13 == 16)
        {
          int v16 = v13 + 1;
          *((void *)a2 + 1) = v16;
          goto LABEL_40;
        }
        continue;
      case 2u:
        int v10 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_32;
        }
        int v16 = (char *)*((void *)a2 + 1);
        unint64_t v11 = *((void *)a2 + 2);
LABEL_40:
        if ((unint64_t)v16 >= v11 || *v16 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v5);
          if (!result) {
            return result;
          }
          int v22 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v11 = *((void *)a2 + 2);
        }
        else
        {
          *uint64_t v5 = *v16;
          int v22 = v16 + 1;
          *((void *)a2 + 1) = v22;
        }
        *((_DWORD *)this + 17) |= 2u;
        if ((unint64_t)v22 >= v11 || *v22 != 24) {
          continue;
        }
        char v17 = v22 + 1;
        *((void *)a2 + 1) = v17;
LABEL_48:
        unsigned int v59 = 0;
        if ((unint64_t)v17 < v11)
        {
          int v23 = *v17;
          if ((v23 & 0x80000000) == 0)
          {
            *((void *)a2 + 1) = v17 + 1;
            if ((_BYTE)v23) {
              goto LABEL_52;
            }
LABEL_51:
            *((_DWORD *)this + 17) |= 4u;
            *((_DWORD *)this + 6) = 0;
            goto LABEL_52;
          }
        }
        uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v59);
        if (!result) {
          return result;
        }
        if (!v59) {
          goto LABEL_51;
        }
LABEL_52:
        uint64_t v24 = (unsigned __int8 *)*((void *)a2 + 1);
        if (*((_DWORD *)a2 + 4) - (int)v24 < 2 || *v24 != 130 || v24[1] != 1) {
          continue;
        }
        *((void *)a2 + 1) = v24 + 2;
LABEL_56:
        *((_DWORD *)this + 17) |= 0x20u;
        int v25 = (awd::profile::TypeVariant *)*((void *)this + 4);
        if (!v25) {
          operator new();
        }
        unsigned int v59 = 0;
        BOOL v26 = (char *)*((void *)a2 + 1);
        if ((unint64_t)v26 >= *((void *)a2 + 2) || *v26 < 0)
        {
          if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v59))return 0; {
        }
          }
        else
        {
          unsigned int v59 = *v26;
          *((void *)a2 + 1) = v26 + 1;
        }
        int v27 = *((_DWORD *)a2 + 14);
        int v28 = *((_DWORD *)a2 + 15);
        *((_DWORD *)a2 + 14) = v27 + 1;
        if (v27 >= v28) {
          return 0;
        }
        wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(a2);
        if (!awd::profile::TypeVariant::MergePartialFromCodedStream(v25, a2) || !*((unsigned char *)a2 + 36)) {
          return 0;
        }
        wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(a2);
        int v29 = *((_DWORD *)a2 + 14);
        BOOL v30 = __OFSUB__(v29, 1);
        int v31 = v29 - 1;
        if (v31 < 0 == v30) {
          *((_DWORD *)a2 + 14) = v31;
        }
        int v32 = (unsigned __int8 *)*((void *)a2 + 1);
        if (*((_DWORD *)a2 + 4) - (int)v32 <= 1 || *v32 != 138 || v32[1] != 1) {
          continue;
        }
        *((void *)a2 + 1) = v32 + 2;
LABEL_71:
        *((_DWORD *)this + 17) |= 0x40u;
        uint64_t v33 = (awd::profile::TypeVariant *)*((void *)this + 5);
        if (!v33) {
          operator new();
        }
        unsigned int v59 = 0;
        int v34 = (char *)*((void *)a2 + 1);
        if ((unint64_t)v34 >= *((void *)a2 + 2) || *v34 < 0)
        {
          if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v59))return 0; {
        }
          }
        else
        {
          unsigned int v59 = *v34;
          *((void *)a2 + 1) = v34 + 1;
        }
        int v35 = *((_DWORD *)a2 + 14);
        int v36 = *((_DWORD *)a2 + 15);
        *((_DWORD *)a2 + 14) = v35 + 1;
        if (v35 >= v36) {
          return 0;
        }
        wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(a2);
        if (!awd::profile::TypeVariant::MergePartialFromCodedStream(v33, a2) || !*((unsigned char *)a2 + 36)) {
          return 0;
        }
        wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(a2);
        int v37 = *((_DWORD *)a2 + 14);
        BOOL v30 = __OFSUB__(v37, 1);
        int v38 = v37 - 1;
        if (v38 < 0 == v30) {
          *((_DWORD *)a2 + 14) = v38;
        }
        int v39 = (unsigned __int8 *)*((void *)a2 + 1);
        if (*((_DWORD *)a2 + 4) - (int)v39 <= 1 || *v39 != 146 || v39[1] != 1) {
          continue;
        }
        *((void *)a2 + 1) = v39 + 2;
LABEL_89:
        *((_DWORD *)this + 17) |= 0x100u;
        if (*((void *)this + 7) == v6) {
          operator new();
        }
        uint64_t result = wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadString();
        if (!result) {
          return result;
        }
        uint64_t v40 = (unsigned __int8 *)*((void *)a2 + 1);
        unint64_t v18 = *((void *)a2 + 2);
        if ((int)v18 - (int)v40 < 2 || *v40 != 152 || v40[1] != 1) {
          continue;
        }
        char v19 = v40 + 2;
        *((void *)a2 + 1) = v19;
LABEL_96:
        unsigned int v59 = 0;
        if ((unint64_t)v19 >= v18 || (char)*v19 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v59);
          if (!result) {
            return result;
          }
          unsigned int v41 = v59;
          int v42 = (unsigned __int8 *)*((void *)a2 + 1);
          unint64_t v18 = *((void *)a2 + 2);
        }
        else
        {
          unsigned int v41 = *v19;
          int v42 = v19 + 1;
          *((void *)a2 + 1) = v42;
        }
        *((unsigned char *)this + 2MEMORY[0x1D9440F90]((char *)this + 8) = v41 != 0;
        int v20 = *((_DWORD *)this + 17) | 8;
        *((_DWORD *)this + 17) = v20;
        if ((int)v18 - (int)v42 < 2 || *v42 != 162 || v42[1] != 1) {
          continue;
        }
        *((void *)a2 + 1) = v42 + 2;
LABEL_105:
        *((_DWORD *)this + 17) = v20 | 0x10;
        int v43 = (awd::profile::TypeVariant *)*((void *)this + 2);
        if (!v43) {
          operator new();
        }
        unsigned int v59 = 0;
        int v44 = (char *)*((void *)a2 + 1);
        if ((unint64_t)v44 >= *((void *)a2 + 2) || *v44 < 0)
        {
          if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v59))return 0; {
        }
          }
        else
        {
          unsigned int v59 = *v44;
          *((void *)a2 + 1) = v44 + 1;
        }
        int v45 = *((_DWORD *)a2 + 14);
        int v46 = *((_DWORD *)a2 + 15);
        *((_DWORD *)a2 + 14) = v45 + 1;
        if (v45 >= v46) {
          return 0;
        }
        wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(a2);
        if (!awd::profile::TypeVariant::MergePartialFromCodedStream(v43, a2) || !*((unsigned char *)a2 + 36)) {
          return 0;
        }
        wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(a2);
        int v47 = *((_DWORD *)a2 + 14);
        BOOL v30 = __OFSUB__(v47, 1);
        int v48 = v47 - 1;
        if (v48 < 0 == v30) {
          *((_DWORD *)a2 + 14) = v48;
        }
        unsigned int v49 = (unsigned __int8 *)*((void *)a2 + 1);
        if (*((_DWORD *)a2 + 4) - (int)v49 <= 1 || *v49 != 130 || v49[1] != 2) {
          continue;
        }
        *((void *)a2 + 1) = v49 + 2;
        goto LABEL_120;
      case 3u:
        int v10 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_32;
        }
        char v17 = (char *)*((void *)a2 + 1);
        unint64_t v11 = *((void *)a2 + 2);
        goto LABEL_48;
      case 4u:
      case 5u:
      case 6u:
      case 7u:
      case 8u:
      case 9u:
      case 0xAu:
      case 0xBu:
      case 0xCu:
      case 0xDu:
      case 0xEu:
      case 0xFu:
        goto LABEL_16;
      case 0x10u:
        int v10 = TagFallback & 7;
        if (v10 == 2) {
          goto LABEL_56;
        }
        goto LABEL_32;
      case 0x11u:
        int v10 = TagFallback & 7;
        if (v10 == 2) {
          goto LABEL_71;
        }
        goto LABEL_32;
      case 0x12u:
        int v10 = TagFallback & 7;
        if (v10 == 2) {
          goto LABEL_89;
        }
        goto LABEL_32;
      case 0x13u:
        int v10 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_32;
        }
        char v19 = (unsigned __int8 *)*((void *)a2 + 1);
        unint64_t v18 = *((void *)a2 + 2);
        goto LABEL_96;
      case 0x14u:
        int v10 = TagFallback & 7;
        if (v10 != 2) {
          goto LABEL_32;
        }
        int v20 = *((_DWORD *)this + 17);
        goto LABEL_105;
      default:
        if (v9 != 32)
        {
          if (v9 == 33)
          {
            int v10 = TagFallback & 7;
            if ((TagFallback & 7) == 0)
            {
              uint64_t v15 = (char *)*((void *)a2 + 1);
              unint64_t v14 = *((void *)a2 + 2);
              goto LABEL_135;
            }
          }
          else
          {
LABEL_16:
            int v10 = TagFallback & 7;
          }
LABEL_32:
          if (v10 == 4) {
            return 1;
          }
          if ((wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipField(a2, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)TagFallback) & 1) == 0)return 0; {
          continue;
          }
        }
        int v10 = TagFallback & 7;
        if (v10 != 2) {
          goto LABEL_32;
        }
LABEL_120:
        *((_DWORD *)this + 17) |= 0x80u;
        unint64_t v50 = (awd::profile::TypeVariant *)*((void *)this + 6);
        if (!v50) {
          operator new();
        }
        unsigned int v59 = 0;
        int v51 = (char *)*((void *)a2 + 1);
        if ((unint64_t)v51 >= *((void *)a2 + 2) || *v51 < 0)
        {
          if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v59))return 0; {
        }
          }
        else
        {
          unsigned int v59 = *v51;
          *((void *)a2 + 1) = v51 + 1;
        }
        int v52 = *((_DWORD *)a2 + 14);
        int v53 = *((_DWORD *)a2 + 15);
        *((_DWORD *)a2 + 14) = v52 + 1;
        if (v52 < v53)
        {
          wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(a2);
          if (awd::profile::TypeVariant::MergePartialFromCodedStream(v50, a2))
          {
            if (*((unsigned char *)a2 + 36))
            {
              wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(a2);
              int v54 = *((_DWORD *)a2 + 14);
              BOOL v30 = __OFSUB__(v54, 1);
              int v55 = v54 - 1;
              if (v55 < 0 == v30) {
                *((_DWORD *)a2 + 14) = v55;
              }
              uint64_t v56 = (unsigned __int8 *)*((void *)a2 + 1);
              unint64_t v14 = *((void *)a2 + 2);
              if ((int)v14 - (int)v56 > 1 && *v56 == 136 && v56[1] == 2)
              {
                uint64_t v15 = (char *)(v56 + 2);
                *((void *)a2 + 1) = v15;
LABEL_135:
                unsigned int v59 = 0;
                if ((unint64_t)v15 >= v14 || *v15 < 0)
                {
                  uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v59);
                  if (!result) {
                    return result;
                  }
                  unsigned int v57 = v59;
                  int v58 = (unsigned __int8 *)*((void *)a2 + 1);
                  unint64_t v14 = *((void *)a2 + 2);
                }
                else
                {
                  unsigned int v57 = *v15;
                  int v58 = (unsigned __int8 *)(v15 + 1);
                  *((void *)a2 + 1) = v58;
                }
                *((unsigned char *)this + 29) = v57 != 0;
                *((_DWORD *)this + 17) |= 0x200u;
                if (v58 == (unsigned __int8 *)v14
                  && (*((_DWORD *)a2 + 11) || *((_DWORD *)a2 + 6) == *((_DWORD *)a2 + 10)))
                {
                  *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
                  uint64_t result = 1;
                  *((unsigned char *)a2 + 36) = 1;
                  return result;
                }
              }
              continue;
            }
          }
        }
        return 0;
    }
  }
}

uint64_t awd::profile::Condition::SerializeWithCachedSizes(uint64_t this, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  uint64_t v5 = this;
  int v6 = *(_DWORD *)(this + 68);
  if (v6)
  {
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)1, *(unsigned int *)(this + 8), (uint64_t)a2, a4);
    int v6 = *(_DWORD *)(v5 + 68);
    if ((v6 & 2) == 0)
    {
LABEL_3:
      if ((v6 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_3;
  }
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)2, *(unsigned int *)(v5 + 12), (uint64_t)a2, a4);
  int v6 = *(_DWORD *)(v5 + 68);
  if ((v6 & 4) == 0)
  {
LABEL_4:
    if ((v6 & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteEnum((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)3, *(unsigned int *)(v5 + 24), (uint64_t)a2, a4);
  int v6 = *(_DWORD *)(v5 + 68);
  if ((v6 & 0x20) == 0)
  {
LABEL_5:
    if ((v6 & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_15:
  uint64_t v7 = *(void *)(v5 + 32);
  if (!v7) {
    uint64_t v7 = *(void *)(awd::profile::Condition::default_instance_ + 32);
  }
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)0x10, v7, a2, a4);
  int v6 = *(_DWORD *)(v5 + 68);
  if ((v6 & 0x40) == 0)
  {
LABEL_6:
    if ((v6 & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_18:
  uint64_t v8 = *(void *)(v5 + 40);
  if (!v8) {
    uint64_t v8 = *(void *)(awd::profile::Condition::default_instance_ + 40);
  }
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)0x11, v8, a2, a4);
  int v6 = *(_DWORD *)(v5 + 68);
  if ((v6 & 0x100) == 0)
  {
LABEL_7:
    if ((v6 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteString();
  int v6 = *(_DWORD *)(v5 + 68);
  if ((v6 & 8) == 0)
  {
LABEL_8:
    if ((v6 & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBool((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)0x13, *(unsigned __int8 *)(v5 + 28), (uint64_t)a2, a4);
  int v6 = *(_DWORD *)(v5 + 68);
  if ((v6 & 0x10) == 0)
  {
LABEL_9:
    if ((v6 & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_23:
  uint64_t v9 = *(void *)(v5 + 16);
  if (!v9) {
    uint64_t v9 = *(void *)(awd::profile::Condition::default_instance_ + 16);
  }
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)0x14, v9, a2, a4);
  int v6 = *(_DWORD *)(v5 + 68);
  if ((v6 & 0x80) == 0)
  {
LABEL_10:
    if ((v6 & 0x200) == 0) {
      return this;
    }
    goto LABEL_29;
  }
LABEL_26:
  uint64_t v10 = *(void *)(v5 + 48);
  if (!v10) {
    uint64_t v10 = *(void *)(awd::profile::Condition::default_instance_ + 48);
  }
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)0x20, v10, a2, a4);
  if ((*(_DWORD *)(v5 + 68) & 0x200) != 0)
  {
LABEL_29:
    uint64_t v11 = *(unsigned __int8 *)(v5 + 29);
    return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBool((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)0x21, v11, (uint64_t)a2, a4);
  }
  return this;
}

uint64_t awd::profile::Condition::ByteSize(awd::profile::Condition *this)
{
  int v2 = *((_DWORD *)this + 17);
  if (!(_BYTE)v2)
  {
    uint64_t v3 = 0;
    goto LABEL_53;
  }
  if ((v2 & 1) == 0)
  {
    LODWORD(v3) = 0;
    if ((v2 & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_10;
  }
  uint64_t v4 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 2);
  if (v4 >= 0x80)
  {
    int v5 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v4);
    int v2 = *((_DWORD *)this + 17);
  }
  else
  {
    int v5 = 1;
  }
  LODWORD(v3) = v5 + 1;
  if ((v2 & 2) != 0)
  {
LABEL_10:
    int v6 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 3);
    if (v6 >= 0x80)
    {
      int v7 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v6);
      int v2 = *((_DWORD *)this + 17);
    }
    else
    {
      int v7 = 1;
    }
    LODWORD(v3) = v3 + v7 + 1;
  }
LABEL_14:
  if ((v2 & 4) != 0)
  {
    uint64_t v8 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 6);
    if ((v8 & 0x80000000) != 0)
    {
      int v9 = 10;
    }
    else if (v8 >= 0x80)
    {
      int v9 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v8);
      int v2 = *((_DWORD *)this + 17);
    }
    else
    {
      int v9 = 1;
    }
    LODWORD(v3) = v3 + v9 + 1;
  }
  if ((v2 & 8) != 0) {
    uint64_t v3 = (v3 + 3);
  }
  else {
    uint64_t v3 = v3;
  }
  if ((v2 & 0x10) != 0)
  {
    uint64_t v10 = (awd::profile::TypeVariant *)*((void *)this + 2);
    if (!v10) {
      uint64_t v10 = *(awd::profile::TypeVariant **)(awd::profile::Condition::default_instance_ + 16);
    }
    uint64_t v11 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)awd::profile::TypeVariant::ByteSize(v10);
    int v12 = (int)v11;
    if (v11 >= 0x80) {
      int v13 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v11);
    }
    else {
      int v13 = 1;
    }
    uint64_t v3 = (v3 + v12 + v13 + 2);
    int v2 = *((_DWORD *)this + 17);
    if ((v2 & 0x20) == 0)
    {
LABEL_26:
      if ((v2 & 0x40) == 0) {
        goto LABEL_27;
      }
      goto LABEL_41;
    }
  }
  else if ((v2 & 0x20) == 0)
  {
    goto LABEL_26;
  }
  unint64_t v14 = (awd::profile::TypeVariant *)*((void *)this + 4);
  if (!v14) {
    unint64_t v14 = *(awd::profile::TypeVariant **)(awd::profile::Condition::default_instance_ + 32);
  }
  uint64_t v15 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)awd::profile::TypeVariant::ByteSize(v14);
  int v16 = (int)v15;
  if (v15 >= 0x80) {
    int v17 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v15);
  }
  else {
    int v17 = 1;
  }
  uint64_t v3 = (v3 + v16 + v17 + 2);
  int v2 = *((_DWORD *)this + 17);
  if ((v2 & 0x40) == 0)
  {
LABEL_27:
    if ((v2 & 0x80) == 0) {
      goto LABEL_53;
    }
    goto LABEL_47;
  }
LABEL_41:
  unint64_t v18 = (awd::profile::TypeVariant *)*((void *)this + 5);
  if (!v18) {
    unint64_t v18 = *(awd::profile::TypeVariant **)(awd::profile::Condition::default_instance_ + 40);
  }
  char v19 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)awd::profile::TypeVariant::ByteSize(v18);
  int v20 = (int)v19;
  if (v19 >= 0x80) {
    int v21 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v19);
  }
  else {
    int v21 = 1;
  }
  uint64_t v3 = (v3 + v20 + v21 + 2);
  int v2 = *((_DWORD *)this + 17);
  if ((v2 & 0x80) != 0)
  {
LABEL_47:
    int v22 = (awd::profile::TypeVariant *)*((void *)this + 6);
    if (!v22) {
      int v22 = *(awd::profile::TypeVariant **)(awd::profile::Condition::default_instance_ + 48);
    }
    int v23 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)awd::profile::TypeVariant::ByteSize(v22);
    int v24 = (int)v23;
    if (v23 >= 0x80) {
      int v25 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v23);
    }
    else {
      int v25 = 1;
    }
    uint64_t v3 = (v3 + v24 + v25 + 2);
    int v2 = *((_DWORD *)this + 17);
  }
LABEL_53:
  if ((v2 & 0xFF00) != 0)
  {
    if ((v2 & 0x100) != 0)
    {
      uint64_t v26 = *((void *)this + 7);
      int v27 = *(unsigned __int8 *)(v26 + 23);
      char v28 = v27;
      uint64_t v29 = *(void *)(v26 + 8);
      if ((v27 & 0x80u) == 0) {
        unint64_t v30 = *(unsigned __int8 *)(v26 + 23);
      }
      else {
        unint64_t v30 = v29;
      }
      if (v30 >= 0x80)
      {
        int v31 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v30);
        int v27 = *(unsigned __int8 *)(v26 + 23);
        uint64_t v29 = *(void *)(v26 + 8);
        int v2 = *((_DWORD *)this + 17);
        char v28 = *(unsigned char *)(v26 + 23);
      }
      else
      {
        int v31 = 1;
      }
      if (v28 < 0) {
        int v27 = v29;
      }
      LODWORD(v3) = v3 + v31 + v27 + 2;
    }
    if ((v2 & 0x200) != 0) {
      uint64_t v3 = (v3 + 3);
    }
    else {
      uint64_t v3 = v3;
    }
  }
  *((_DWORD *)this + 16) = v3;
  return v3;
}

void awd::profile::Condition::CopyFrom(awd::profile::Condition *this, const awd::profile::Condition *a2)
{
  if (a2 != this)
  {
    (*(void (**)(awd::profile::Condition *))(*(void *)this + 32))(this);
    awd::profile::Condition::MergeFrom(this, a2);
  }
}

uint64_t awd::profile::Condition::IsInitialized(awd::profile::Condition *this)
{
  return 1;
}

uint64_t awd::profile::Condition::Swap(uint64_t this, awd::profile::Condition *a2)
{
  if (a2 != (awd::profile::Condition *)this)
  {
    int v2 = *(_DWORD *)(this + 8);
    *(_DWORD *)(this + MEMORY[0x1D9440F90]((char *)this + 8) = *((_DWORD *)a2 + 2);
    *((_DWORD *)a2 + 2) = v2;
    int v3 = *(_DWORD *)(this + 12);
    *(_DWORD *)(this + 12) = *((_DWORD *)a2 + 3);
    *((_DWORD *)a2 + 3) = v3;
    int v4 = *(_DWORD *)(this + 24);
    *(_DWORD *)(this + 24) = *((_DWORD *)a2 + 6);
    *((_DWORD *)a2 + 6) = v4;
    LOBYTE(v4) = *(unsigned char *)(this + 28);
    *(unsigned char *)(this + 2MEMORY[0x1D9440F90]((char *)this + 8) = *((unsigned char *)a2 + 28);
    *((unsigned char *)a2 + 2MEMORY[0x1D9440F90]((char *)this + 8) = v4;
    uint64_t v5 = *(void *)(this + 16);
    *(void *)(this + 16) = *((void *)a2 + 2);
    *((void *)a2 + 2) = v5;
    uint64_t v6 = *(void *)(this + 32);
    *(void *)(this + 32) = *((void *)a2 + 4);
    *((void *)a2 + 4) = v6;
    uint64_t v7 = *(void *)(this + 40);
    *(void *)(this + 40) = *((void *)a2 + 5);
    *((void *)a2 + 5) = v7;
    uint64_t v8 = *(void *)(this + 48);
    *(void *)(this + 4MEMORY[0x1D9440F90]((char *)this + 8) = *((void *)a2 + 6);
    *((void *)a2 + 6) = v8;
    uint64_t v9 = *(void *)(this + 56);
    *(void *)(this + 56) = *((void *)a2 + 7);
    *((void *)a2 + 7) = v9;
    LOBYTE(v9) = *(unsigned char *)(this + 29);
    *(unsigned char *)(this + 29) = *((unsigned char *)a2 + 29);
    *((unsigned char *)a2 + 29) = v9;
    LODWORD(v9) = *(_DWORD *)(this + 68);
    *(_DWORD *)(this + 6MEMORY[0x1D9440F90]((char *)this + 8) = *((_DWORD *)a2 + 17);
    *((_DWORD *)a2 + 17) = v9;
    LODWORD(v9) = *(_DWORD *)(this + 64);
    *(_DWORD *)(this + 64) = *((_DWORD *)a2 + 16);
    *((_DWORD *)a2 + 16) = v9;
  }
  return this;
}

void *awd::profile::Condition::GetTypeName@<X0>(void *a1@<X8>)
{
  return sub_1D3E270D0(a1, "awd.profile.Condition");
}

uint64_t awd::profile::ConditionClause::SharedCtor(uint64_t this)
{
  *(void *)(this + 32) = 0;
  return this;
}

awd::profile::ConditionClause *awd::profile::ConditionClause::ConditionClause(awd::profile::ConditionClause *this, const awd::profile::ConditionClause *a2)
{
  *(void *)this = &unk_1F2B9B2C0;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *((_DWORD *)this + 6) = 0;
  *((void *)this + 4) = 0;
  awd::profile::ConditionClause::MergeFrom(this, a2);
  return this;
}

void sub_1D3E47A88(_Unwind_Exception *a1)
{
  sub_1D3E4D870(v2);
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(v1);
  _Unwind_Resume(a1);
}

void awd::profile::ConditionClause::MergeFrom(awd::profile::ConditionClause *this, const awd::profile::ConditionClause *a2)
{
  if (a2 == this)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v4);
  }
  sub_1D3E4DBF8((int *)this + 2, (uint64_t)a2 + 8);
}

void sub_1D3E47B24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)va);
  _Unwind_Resume(a1);
}

void awd::profile::ConditionClause::~ConditionClause(awd::profile::ConditionClause *this)
{
  *(void *)this = &unk_1F2B9B2C0;
  sub_1D3E4D870((uint64_t *)this + 1);
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(this);
}

{
  uint64_t vars8;

  awd::profile::ConditionClause::~ConditionClause(this);
  JUMPOUT(0x1D94412F0);
}

uint64_t awd::profile::ConditionClause::SetCachedSize(uint64_t this, int a2)
{
  *(_DWORD *)(this + 32) = a2;
  return this;
}

uint64_t awd::profile::ConditionClause::default_instance(awd::profile::ConditionClause *this, uint64_t a2, uint64_t a3, const char *a4)
{
  uint64_t result = awd::profile::ConditionClause::default_instance_;
  if (!awd::profile::ConditionClause::default_instance_)
  {
    awd::profile::protobuf_AddDesc_AwdProfile_2eproto(0, a2, a3, a4);
    return awd::profile::ConditionClause::default_instance_;
  }
  return result;
}

void awd::profile::ConditionClause::New(awd::profile::ConditionClause *this)
{
}

uint64_t awd::profile::ConditionClause::Clear(awd::profile::ConditionClause *this)
{
  uint64_t result = sub_1D3E4D7B0((uint64_t)this + 8);
  *((_DWORD *)this + 9) = 0;
  return result;
}

uint64_t awd::profile::ConditionClause::MergePartialFromCodedStream(awd::profile::ConditionClause *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2)
{
  int v4 = (awd::profile::ConditionClause *)((char *)this + 8);
  while (1)
  {
LABEL_2:
    uint64_t v5 = (char *)*((void *)a2 + 1);
    if ((unint64_t)v5 >= *((void *)a2 + 2) || *v5 < 0)
    {
      unint64_t TagFallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(a2);
      *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = TagFallback;
    }
    else
    {
      unint64_t TagFallback = *v5;
      *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = TagFallback;
      *((void *)a2 + 1) = v5 + 1;
    }
    if (TagFallback == 10)
    {
      while (1)
      {
        int v7 = *((_DWORD *)this + 5);
        uint64_t v8 = *((int *)this + 4);
        if ((int)v8 >= v7)
        {
          if (v7 == *((_DWORD *)this + 6))
          {
            wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v4);
            int v7 = *((_DWORD *)this + 5);
          }
          *((_DWORD *)this + 5) = v7 + 1;
          operator new();
        }
        uint64_t v9 = *((void *)this + 1);
        *((_DWORD *)this + 4) = v8 + 1;
        uint64_t v10 = *(awd::profile::Condition **)(v9 + 8 * v8);
        unsigned int v20 = 0;
        uint64_t v11 = (char *)*((void *)a2 + 1);
        if ((unint64_t)v11 >= *((void *)a2 + 2) || *v11 < 0)
        {
          if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v20))return 0; {
        }
          }
        else
        {
          unsigned int v20 = *v11;
          *((void *)a2 + 1) = v11 + 1;
        }
        int v12 = *((_DWORD *)a2 + 14);
        int v13 = *((_DWORD *)a2 + 15);
        *((_DWORD *)a2 + 14) = v12 + 1;
        if (v12 >= v13) {
          return 0;
        }
        wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(a2);
        if (!awd::profile::Condition::MergePartialFromCodedStream(v10, a2) || !*((unsigned char *)a2 + 36)) {
          return 0;
        }
        wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(a2);
        int v14 = *((_DWORD *)a2 + 14);
        BOOL v15 = __OFSUB__(v14, 1);
        int v16 = v14 - 1;
        if (v16 < 0 == v15) {
          *((_DWORD *)a2 + 14) = v16;
        }
        int v17 = (unsigned char *)*((void *)a2 + 1);
        unint64_t v18 = (unsigned char *)*((void *)a2 + 2);
        if (v17 >= v18 || *v17 != 10)
        {
          if (v17 == v18 && (*((_DWORD *)a2 + 11) || *((_DWORD *)a2 + 6) == *((_DWORD *)a2 + 10)))
          {
            *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
            uint64_t result = 1;
            *((unsigned char *)a2 + 36) = 1;
            return result;
          }
          goto LABEL_2;
        }
        *((void *)a2 + 1) = v17 + 1;
      }
    }
    if (!TagFallback || (TagFallback & 7) == 4) {
      return 1;
    }
    if ((wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipField(a2, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)TagFallback) & 1) == 0)return 0; {
  }
    }
}

uint64_t awd::profile::ConditionClause::SerializeWithCachedSizes(uint64_t this, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  if (*(int *)(this + 16) >= 1)
  {
    uint64_t v5 = this;
    uint64_t v6 = 0;
    do
      this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)1, *(void *)(*(void *)(v5 + 8) + 8 * v6++), a2, a4);
    while (v6 < *(int *)(v5 + 16));
  }
  return this;
}

uint64_t awd::profile::ConditionClause::ByteSize(awd::profile::ConditionClause *this)
{
  uint64_t v2 = *((unsigned int *)this + 4);
  if ((int)v2 >= 1)
  {
    uint64_t v3 = 0;
    do
    {
      int v4 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)awd::profile::Condition::ByteSize(*(awd::profile::Condition **)(*((void *)this + 1) + 8 * v3));
      int v5 = (int)v4;
      if (v4 >= 0x80) {
        int v6 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v4);
      }
      else {
        int v6 = 1;
      }
      uint64_t v2 = (v5 + v2 + v6);
      ++v3;
    }
    while (v3 < *((int *)this + 4));
  }
  *((_DWORD *)this + MEMORY[0x1D9440F90]((char *)this + 8) = v2;
  return v2;
}

void awd::profile::ConditionClause::CopyFrom(awd::profile::ConditionClause *this, const awd::profile::ConditionClause *a2)
{
  if (a2 != this)
  {
    (*(void (**)(awd::profile::ConditionClause *))(*(void *)this + 32))(this);
    awd::profile::ConditionClause::MergeFrom(this, a2);
  }
}

uint64_t awd::profile::ConditionClause::IsInitialized(awd::profile::ConditionClause *this)
{
  return 1;
}

awd::profile::ConditionClause *awd::profile::ConditionClause::Swap(awd::profile::ConditionClause *this, awd::profile::ConditionClause *a2)
{
  if (a2 != this)
  {
    uint64_t v3 = this;
    this = (awd::profile::ConditionClause *)wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Swap();
    int v4 = *((_DWORD *)v3 + 9);
    *((_DWORD *)v3 + 9) = *((_DWORD *)a2 + 9);
    *((_DWORD *)a2 + 9) = v4;
    int v5 = *((_DWORD *)v3 + 8);
    *((_DWORD *)v3 + MEMORY[0x1D9440F90]((char *)this + 8) = *((_DWORD *)a2 + 8);
    *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = v5;
  }
  return this;
}

void *awd::profile::ConditionClause::GetTypeName@<X0>(void *a1@<X8>)
{
  return sub_1D3E270D0(a1, "awd.profile.ConditionClause");
}

void *awd::profile::TriggerSource::SharedCtor(void *this)
{
  this[1] = 0;
  this[2] = 0;
  this[6] = MEMORY[0x1E4FBA920];
  this[7] = 0;
  return this;
}

awd::profile::TriggerSource *awd::profile::TriggerSource::TriggerSource(awd::profile::TriggerSource *this, const awd::profile::TriggerSource *a2)
{
  *(void *)this = &unk_1F2B9B0E0;
  *(_OWORD *)((char *)this + MEMORY[0x1D9440F90]((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((_DWORD *)this + 10) = 0;
  *((void *)this + 6) = MEMORY[0x1E4FBA920];
  *((void *)this + 7) = 0;
  awd::profile::TriggerSource::MergeFrom(this, a2);
  return this;
}

void sub_1D3E48148(_Unwind_Exception *a1)
{
  sub_1D3E4D870(v1 + 3);
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite((wireless_diagnostics::google::protobuf::MessageLite *)v1);
  _Unwind_Resume(a1);
}

void awd::profile::TriggerSource::MergeFrom(awd::profile::TriggerSource *this, const awd::profile::TriggerSource *a2)
{
  if (a2 == this)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v15);
  }
  wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((awd::profile::TriggerSource *)((char *)this + 24));
  if (*((int *)a2 + 8) >= 1)
  {
    uint64_t v4 = 0;
    do
    {
      int v5 = *(const awd::profile::ConditionClause **)(*((void *)a2 + 3) + 8 * v4);
      int v6 = *((_DWORD *)this + 9);
      uint64_t v7 = *((int *)this + 8);
      if ((int)v7 >= v6)
      {
        if (v6 == *((_DWORD *)this + 10))
        {
          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((awd::profile::TriggerSource *)((char *)this + 24));
          int v6 = *((_DWORD *)this + 9);
        }
        *((_DWORD *)this + 9) = v6 + 1;
        operator new();
      }
      uint64_t v8 = *((void *)this + 3);
      *((_DWORD *)this + MEMORY[0x1D9440F90]((char *)this + 8) = v7 + 1;
      awd::profile::ConditionClause::MergeFrom(*(awd::profile::ConditionClause **)(v8 + 8 * v7), v5);
      ++v4;
    }
    while (v4 < *((int *)a2 + 8));
  }
  LOBYTE(v9) = *((unsigned char *)a2 + 60);
  if ((_BYTE)v9)
  {
    if (*((unsigned char *)a2 + 60))
    {
      int v10 = *((_DWORD *)a2 + 4);
      *((_DWORD *)this + 15) |= 1u;
      *((_DWORD *)this + 4) = v10;
      int v9 = *((_DWORD *)a2 + 15);
      if ((v9 & 2) == 0)
      {
LABEL_14:
        if ((v9 & 4) == 0) {
          goto LABEL_15;
        }
        goto LABEL_19;
      }
    }
    else if ((*((unsigned char *)a2 + 60) & 2) == 0)
    {
      goto LABEL_14;
    }
    uint64_t v11 = *((void *)a2 + 1);
    *((_DWORD *)this + 15) |= 2u;
    *((void *)this + 1) = v11;
    int v9 = *((_DWORD *)a2 + 15);
    if ((v9 & 4) == 0)
    {
LABEL_15:
      if ((v9 & 0x10) == 0) {
        return;
      }
      goto LABEL_20;
    }
LABEL_19:
    int v12 = *((_DWORD *)a2 + 5);
    *((_DWORD *)this + 15) |= 4u;
    *((_DWORD *)this + 5) = v12;
    if ((*((_DWORD *)a2 + 15) & 0x10) == 0) {
      return;
    }
LABEL_20:
    int v13 = (const std::string *)*((void *)a2 + 6);
    *((_DWORD *)this + 15) |= 0x10u;
    int v14 = (std::string *)*((void *)this + 6);
    if (v14 == (std::string *)MEMORY[0x1E4FBA920]) {
      operator new();
    }
    std::string::operator=(v14, v13);
  }
}

void sub_1D3E4838C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)va);
  _Unwind_Resume(a1);
}

void awd::profile::TriggerSource::~TriggerSource(awd::profile::TriggerSource *this)
{
  *(void *)this = &unk_1F2B9B0E0;
  uint64_t v2 = (uint64_t *)((char *)this + 24);
  awd::profile::TriggerSource::SharedDtor((uint64_t)this);
  sub_1D3E4D870(v2);
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(this);
}

{
  uint64_t vars8;

  awd::profile::TriggerSource::~TriggerSource(this);
  JUMPOUT(0x1D94412F0);
}

uint64_t awd::profile::TriggerSource::SharedDtor(uint64_t this)
{
  uint64_t v1 = *(void *)(this + 48);
  if (v1 != MEMORY[0x1E4FBA920] && v1 != 0)
  {
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
    JUMPOUT(0x1D94412F0);
  }
  return this;
}

uint64_t awd::profile::TriggerSource::SetCachedSize(uint64_t this, int a2)
{
  *(_DWORD *)(this + 56) = a2;
  return this;
}

uint64_t awd::profile::TriggerSource::default_instance(awd::profile::TriggerSource *this, uint64_t a2, uint64_t a3, const char *a4)
{
  uint64_t result = awd::profile::TriggerSource::default_instance_;
  if (!awd::profile::TriggerSource::default_instance_)
  {
    awd::profile::protobuf_AddDesc_AwdProfile_2eproto(0, a2, a3, a4);
    return awd::profile::TriggerSource::default_instance_;
  }
  return result;
}

void awd::profile::TriggerSource::New(awd::profile::TriggerSource *this)
{
}

uint64_t awd::profile::TriggerSource::Clear(awd::profile::TriggerSource *this)
{
  char v2 = *((unsigned char *)this + 60);
  if (v2)
  {
    *((void *)this + 1) = 0;
    *((void *)this + 2) = 0;
    if ((v2 & 0x10) != 0)
    {
      uint64_t v3 = *((void *)this + 6);
      if (v3 != MEMORY[0x1E4FBA920])
      {
        if (*(char *)(v3 + 23) < 0)
        {
          **(unsigned char **)uint64_t v3 = 0;
          *(void *)(v3 + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
        }
        else
        {
          *(unsigned char *)uint64_t v3 = 0;
          *(unsigned char *)(v3 + 23) = 0;
        }
      }
    }
  }
  uint64_t result = sub_1D3E4D7B0((uint64_t)this + 24);
  *((_DWORD *)this + 15) = 0;
  return result;
}

uint64_t awd::profile::TriggerSource::MergePartialFromCodedStream(awd::profile::TriggerSource *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2)
{
  uint64_t v4 = (unint64_t *)((char *)this + 8);
  int v5 = (unsigned int *)((char *)this + 16);
  int v6 = (unsigned int *)((char *)this + 20);
  uint64_t v7 = (awd::profile::TriggerSource *)((char *)this + 24);
  uint64_t v8 = MEMORY[0x1E4FBA920];
  while (1)
  {
    while (1)
    {
LABEL_2:
      int v9 = (char *)*((void *)a2 + 1);
      if ((unint64_t)v9 >= *((void *)a2 + 2) || *v9 < 0)
      {
        unint64_t TagFallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(a2);
        *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = TagFallback;
        if (!TagFallback) {
          return 1;
        }
      }
      else
      {
        unint64_t TagFallback = *v9;
        *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = TagFallback;
        *((void *)a2 + 1) = v9 + 1;
        if (!TagFallback) {
          return 1;
        }
      }
      unsigned int v11 = TagFallback >> 3;
      if (TagFallback >> 3 <= 2) {
        break;
      }
      if (v11 == 3)
      {
        int v12 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_32;
        }
        int v16 = (unsigned __int8 *)*((void *)a2 + 1);
        unint64_t v14 = *((void *)a2 + 2);
        goto LABEL_48;
      }
      if (v11 == 16)
      {
        int v12 = TagFallback & 7;
        if (v12 != 2) {
          goto LABEL_32;
        }
        goto LABEL_57;
      }
      if (v11 != 32)
      {
LABEL_31:
        int v12 = TagFallback & 7;
        goto LABEL_32;
      }
      int v12 = TagFallback & 7;
      if (v12 == 2) {
        goto LABEL_12;
      }
LABEL_32:
      if (v12 == 4) {
        return 1;
      }
      if ((wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipField(a2, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)TagFallback) & 1) == 0)return 0; {
    }
      }
    if (v11 != 1)
    {
      if (v11 != 2) {
        goto LABEL_31;
      }
      int v12 = TagFallback & 7;
      if ((TagFallback & 7) != 0) {
        goto LABEL_32;
      }
      BOOL v15 = (char *)*((void *)a2 + 1);
      unint64_t v14 = *((void *)a2 + 2);
      goto LABEL_40;
    }
    int v12 = TagFallback & 7;
    if ((TagFallback & 7) != 0) {
      goto LABEL_32;
    }
    int v17 = (char *)*((void *)a2 + 1);
    unint64_t v14 = *((void *)a2 + 2);
    if ((unint64_t)v17 >= v14 || *v17 < 0)
    {
      uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(a2, v4);
      if (!result) {
        return result;
      }
      unint64_t v18 = (unsigned char *)*((void *)a2 + 1);
      unint64_t v14 = *((void *)a2 + 2);
    }
    else
    {
      unint64_t *v4 = *v17;
      unint64_t v18 = v17 + 1;
      *((void *)a2 + 1) = v18;
    }
    *((_DWORD *)this + 15) |= 2u;
    if ((unint64_t)v18 < v14 && *v18 == 16)
    {
      BOOL v15 = v18 + 1;
      *((void *)a2 + 1) = v15;
LABEL_40:
      if ((unint64_t)v15 >= v14 || *v15 < 0)
      {
        uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v5);
        if (!result) {
          return result;
        }
        char v19 = (unsigned char *)*((void *)a2 + 1);
        unint64_t v14 = *((void *)a2 + 2);
      }
      else
      {
        *int v5 = *v15;
        char v19 = v15 + 1;
        *((void *)a2 + 1) = v19;
      }
      *((_DWORD *)this + 15) |= 1u;
      if ((unint64_t)v19 < v14 && *v19 == 24)
      {
        int v16 = v19 + 1;
        *((void *)a2 + 1) = v16;
LABEL_48:
        if ((unint64_t)v16 >= v14 || (char)*v16 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v6);
          if (!result) {
            return result;
          }
          unsigned int v20 = (unsigned __int8 *)*((void *)a2 + 1);
          unint64_t v14 = *((void *)a2 + 2);
        }
        else
        {
          unsigned int *v6 = *v16;
          unsigned int v20 = v16 + 1;
          *((void *)a2 + 1) = v20;
        }
        *((_DWORD *)this + 15) |= 4u;
        if ((int)v14 - (int)v20 >= 2 && *v20 == 130 && v20[1] == 1)
        {
          do
          {
            *((void *)a2 + 1) = v20 + 2;
LABEL_57:
            int v21 = *((_DWORD *)this + 9);
            uint64_t v22 = *((int *)this + 8);
            if ((int)v22 >= v21)
            {
              if (v21 == *((_DWORD *)this + 10))
              {
                wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v7);
                int v21 = *((_DWORD *)this + 9);
              }
              *((_DWORD *)this + 9) = v21 + 1;
              operator new();
            }
            uint64_t v23 = *((void *)this + 3);
            *((_DWORD *)this + MEMORY[0x1D9440F90]((char *)this + 8) = v22 + 1;
            int v24 = *(awd::profile::ConditionClause **)(v23 + 8 * v22);
            unsigned int v32 = 0;
            int v25 = (char *)*((void *)a2 + 1);
            if ((unint64_t)v25 >= *((void *)a2 + 2) || *v25 < 0)
            {
              if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v32))return 0; {
            }
              }
            else
            {
              unsigned int v32 = *v25;
              *((void *)a2 + 1) = v25 + 1;
            }
            int v26 = *((_DWORD *)a2 + 14);
            int v27 = *((_DWORD *)a2 + 15);
            *((_DWORD *)a2 + 14) = v26 + 1;
            if (v26 >= v27) {
              return 0;
            }
            wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(a2);
            if (!awd::profile::ConditionClause::MergePartialFromCodedStream(v24, a2)
              || !*((unsigned char *)a2 + 36))
            {
              return 0;
            }
            wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(a2);
            int v28 = *((_DWORD *)a2 + 14);
            BOOL v29 = __OFSUB__(v28, 1);
            int v30 = v28 - 1;
            if (v30 < 0 == v29) {
              *((_DWORD *)a2 + 14) = v30;
            }
            unsigned int v20 = (unsigned __int8 *)*((void *)a2 + 1);
            if (*((_DWORD *)a2 + 4) - (int)v20 <= 1 || *v20 != 130) {
              goto LABEL_2;
            }
            int v31 = v20[1];
          }
          while (v31 == 1);
          if (v31 == 2)
          {
            *((void *)a2 + 1) = v20 + 2;
LABEL_12:
            *((_DWORD *)this + 15) |= 0x10u;
            if (*((void *)this + 6) == v8) {
              operator new();
            }
            uint64_t result = wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadString();
            if (!result) {
              return result;
            }
            if (*((void *)a2 + 1) == *((void *)a2 + 2)
              && (*((_DWORD *)a2 + 11) || *((_DWORD *)a2 + 6) == *((_DWORD *)a2 + 10)))
            {
              break;
            }
          }
        }
      }
    }
  }
  *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  uint64_t result = 1;
  *((unsigned char *)a2 + 36) = 1;
  return result;
}

uint64_t awd::profile::TriggerSource::SerializeWithCachedSizes(uint64_t this, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  uint64_t v5 = this;
  int v6 = *(_DWORD *)(this + 60);
  if ((v6 & 2) != 0)
  {
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt64((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)1, *(void *)(this + 8), (uint64_t)a2, a4);
    int v6 = *(_DWORD *)(v5 + 60);
    if ((v6 & 1) == 0)
    {
LABEL_3:
      if ((v6 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v6 & 1) == 0)
  {
    goto LABEL_3;
  }
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)2, *(unsigned int *)(v5 + 16), (uint64_t)a2, a4);
  if ((*(_DWORD *)(v5 + 60) & 4) != 0) {
LABEL_4:
  }
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)3, *(unsigned int *)(v5 + 20), (uint64_t)a2, a4);
LABEL_5:
  if (*(int *)(v5 + 32) >= 1)
  {
    uint64_t v7 = 0;
    do
      this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)0x10, *(void *)(*(void *)(v5 + 24) + 8 * v7++), a2, a4);
    while (v7 < *(int *)(v5 + 32));
  }
  if ((*(unsigned char *)(v5 + 60) & 0x10) != 0)
  {
    return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteString();
  }
  return this;
}

uint64_t awd::profile::TriggerSource::ByteSize(awd::profile::TriggerSource *this)
{
  LOBYTE(v2) = *((unsigned char *)this + 60);
  if (!(_BYTE)v2)
  {
    int v3 = 0;
    goto LABEL_27;
  }
  if ((*((unsigned char *)this + 60) & 1) == 0)
  {
    int v3 = 0;
    if ((*((unsigned char *)this + 60) & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  uint64_t v4 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 4);
  if (v4 >= 0x80)
  {
    int v3 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v4) + 1;
    int v2 = *((_DWORD *)this + 15);
    if ((v2 & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  int v3 = 2;
  if ((v2 & 2) != 0)
  {
LABEL_10:
    v3 += wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64(*((wireless_diagnostics::google::protobuf::io::CodedOutputStream **)this
                                                                                      + 1))
        + 1;
    int v2 = *((_DWORD *)this + 15);
  }
LABEL_11:
  if ((v2 & 4) != 0)
  {
    uint64_t v5 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 5);
    if (v5 >= 0x80)
    {
      int v6 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v5) + 1;
      int v2 = *((_DWORD *)this + 15);
    }
    else
    {
      int v6 = 2;
    }
    v3 += v6;
    if ((v2 & 0x10) == 0) {
      goto LABEL_27;
    }
  }
  else if ((v2 & 0x10) == 0)
  {
    goto LABEL_27;
  }
  uint64_t v7 = *((void *)this + 6);
  int v8 = *(unsigned __int8 *)(v7 + 23);
  char v9 = v8;
  uint64_t v10 = *(void *)(v7 + 8);
  if ((v8 & 0x80u) == 0) {
    unint64_t v11 = *(unsigned __int8 *)(v7 + 23);
  }
  else {
    unint64_t v11 = v10;
  }
  if (v11 >= 0x80)
  {
    int v12 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v11);
    int v8 = *(unsigned __int8 *)(v7 + 23);
    uint64_t v10 = *(void *)(v7 + 8);
    char v9 = *(unsigned char *)(v7 + 23);
  }
  else
  {
    int v12 = 1;
  }
  if (v9 < 0) {
    int v8 = v10;
  }
  v3 += v12 + v8 + 2;
LABEL_27:
  int v13 = *((_DWORD *)this + 8);
  uint64_t v14 = (v3 + 2 * v13);
  if (v13 >= 1)
  {
    uint64_t v15 = 0;
    do
    {
      int v16 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)awd::profile::ConditionClause::ByteSize(*(awd::profile::ConditionClause **)(*((void *)this + 3) + 8 * v15));
      int v17 = (int)v16;
      if (v16 >= 0x80) {
        int v18 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v16);
      }
      else {
        int v18 = 1;
      }
      uint64_t v14 = (v17 + v14 + v18);
      ++v15;
    }
    while (v15 < *((int *)this + 8));
  }
  *((_DWORD *)this + 14) = v14;
  return v14;
}

void awd::profile::TriggerSource::CopyFrom(awd::profile::TriggerSource *this, const awd::profile::TriggerSource *a2)
{
  if (a2 != this)
  {
    (*(void (**)(awd::profile::TriggerSource *))(*(void *)this + 32))(this);
    awd::profile::TriggerSource::MergeFrom(this, a2);
  }
}

uint64_t awd::profile::TriggerSource::IsInitialized(awd::profile::TriggerSource *this)
{
  return 1;
}

uint64_t awd::profile::TriggerSource::Swap(uint64_t this, awd::profile::TriggerSource *a2)
{
  if (a2 != (awd::profile::TriggerSource *)this)
  {
    uint64_t v3 = this;
    int v4 = *(_DWORD *)(this + 16);
    *(_DWORD *)(this + 16) = *((_DWORD *)a2 + 4);
    *((_DWORD *)a2 + 4) = v4;
    uint64_t v5 = *(void *)(this + 8);
    *(void *)(this + MEMORY[0x1D9440F90]((char *)this + 8) = *((void *)a2 + 1);
    *((void *)a2 + 1) = v5;
    LODWORD(v5) = *(_DWORD *)(this + 20);
    *(_DWORD *)(this + 20) = *((_DWORD *)a2 + 5);
    *((_DWORD *)a2 + 5) = v5;
    this = wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Swap();
    uint64_t v6 = *(void *)(v3 + 48);
    *(void *)(v3 + 4MEMORY[0x1D9440F90]((char *)this + 8) = *((void *)a2 + 6);
    *((void *)a2 + 6) = v6;
    LODWORD(v6) = *(_DWORD *)(v3 + 60);
    *(_DWORD *)(v3 + 60) = *((_DWORD *)a2 + 15);
    *((_DWORD *)a2 + 15) = v6;
    LODWORD(v6) = *(_DWORD *)(v3 + 56);
    *(_DWORD *)(v3 + 56) = *((_DWORD *)a2 + 14);
    *((_DWORD *)a2 + 14) = v6;
  }
  return this;
}

void *awd::profile::TriggerSource::GetTypeName@<X0>(void *a1@<X8>)
{
  return sub_1D3E270D0(a1, "awd.profile.TriggerSource");
}

uint64_t awd::profile::TriggerProcessingRule::SharedCtor(uint64_t this)
{
  *(void *)(this + 72) = 0;
  *(_DWORD *)(this + 80) = 0;
  return this;
}

awd::profile::TriggerProcessingRule *awd::profile::TriggerProcessingRule::TriggerProcessingRule(awd::profile::TriggerProcessingRule *this, const awd::profile::TriggerProcessingRule *a2)
{
  *(void *)this = &unk_1F2B9B428;
  *(_OWORD *)((char *)this + MEMORY[0x1D9440F90]((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((void *)this + 6) = 0;
  *((void *)this + 7) = 0;
  *((_DWORD *)this + 16) = 0;
  *((void *)this + 9) = 0;
  *((_DWORD *)this + 20) = 0;
  *((_DWORD *)this + 10) = 0;
  awd::profile::TriggerProcessingRule::MergeFrom(this, a2);
  return this;
}

void sub_1D3E48E70(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;
  sub_1D3E4D870(v5);
  sub_1D3E4D870(v3);
  sub_1D3E4DE4C(v2);
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(v1);
  _Unwind_Resume(a1);
}

void awd::profile::TriggerProcessingRule::MergeFrom(awd::profile::TriggerProcessingRule *this, const awd::profile::TriggerProcessingRule *a2)
{
  if (a2 == this)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v16);
  }
  int v4 = *((_DWORD *)a2 + 4);
  if (v4)
  {
    sub_1D3E4D664((uint64_t)this + 8, *((_DWORD *)this + 4) + v4);
    memcpy((void *)(*((void *)this + 1) + 4 * *((int *)this + 4)), *((const void **)a2 + 1), 4 * *((int *)a2 + 4));
    *((_DWORD *)this + 4) += *((_DWORD *)a2 + 4);
  }
  wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((awd::profile::TriggerProcessingRule *)((char *)this + 24));
  if (*((int *)a2 + 8) >= 1)
  {
    uint64_t v5 = 0;
    do
    {
      uint64_t v6 = *(const awd::profile::ConditionClause **)(*((void *)a2 + 3) + 8 * v5);
      int v7 = *((_DWORD *)this + 9);
      uint64_t v8 = *((int *)this + 8);
      if ((int)v8 >= v7)
      {
        if (v7 == *((_DWORD *)this + 10))
        {
          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((awd::profile::TriggerProcessingRule *)((char *)this + 24));
          int v7 = *((_DWORD *)this + 9);
        }
        *((_DWORD *)this + 9) = v7 + 1;
        operator new();
      }
      uint64_t v9 = *((void *)this + 3);
      *((_DWORD *)this + MEMORY[0x1D9440F90]((char *)this + 8) = v8 + 1;
      awd::profile::ConditionClause::MergeFrom(*(awd::profile::ConditionClause **)(v9 + 8 * v8), v6);
      ++v5;
    }
    while (v5 < *((int *)a2 + 8));
  }
  wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((awd::profile::TriggerProcessingRule *)((char *)this + 48));
  if (*((int *)a2 + 14) >= 1)
  {
    uint64_t v10 = 0;
    do
    {
      unint64_t v11 = *(const awd::profile::ConditionClause **)(*((void *)a2 + 6) + 8 * v10);
      int v12 = *((_DWORD *)this + 15);
      uint64_t v13 = *((int *)this + 14);
      if ((int)v13 >= v12)
      {
        if (v12 == *((_DWORD *)this + 16))
        {
          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((awd::profile::TriggerProcessingRule *)((char *)this + 48));
          int v12 = *((_DWORD *)this + 15);
        }
        *((_DWORD *)this + 15) = v12 + 1;
        operator new();
      }
      uint64_t v14 = *((void *)this + 6);
      *((_DWORD *)this + 14) = v13 + 1;
      awd::profile::ConditionClause::MergeFrom(*(awd::profile::ConditionClause **)(v14 + 8 * v13), v11);
      ++v10;
    }
    while (v10 < *((int *)a2 + 14));
  }
  if (*((unsigned char *)a2 + 80))
  {
    int v15 = *((_DWORD *)a2 + 18);
    *((_DWORD *)this + 20) |= 1u;
    *((_DWORD *)this + 1MEMORY[0x1D9440F90]((char *)this + 8) = v15;
  }
}

void sub_1D3E49150(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)va);
  _Unwind_Resume(a1);
}

void awd::profile::TriggerProcessingRule::~TriggerProcessingRule(awd::profile::TriggerProcessingRule *this)
{
  *(void *)this = &unk_1F2B9B428;
  sub_1D3E4D870((uint64_t *)this + 6);
  sub_1D3E4D870((uint64_t *)this + 3);
  uint64_t v2 = *((void *)this + 1);
  if (v2) {
    MEMORY[0x1D94412D0](v2, 0x1000C8052888210);
  }
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(this);
}

{
  uint64_t vars8;

  awd::profile::TriggerProcessingRule::~TriggerProcessingRule(this);
  JUMPOUT(0x1D94412F0);
}

uint64_t awd::profile::TriggerProcessingRule::SetCachedSize(uint64_t this, int a2)
{
  *(_DWORD *)(this + 76) = a2;
  return this;
}

uint64_t awd::profile::TriggerProcessingRule::default_instance(awd::profile::TriggerProcessingRule *this, uint64_t a2, uint64_t a3, const char *a4)
{
  uint64_t result = awd::profile::TriggerProcessingRule::default_instance_;
  if (!awd::profile::TriggerProcessingRule::default_instance_)
  {
    awd::profile::protobuf_AddDesc_AwdProfile_2eproto(0, a2, a3, a4);
    return awd::profile::TriggerProcessingRule::default_instance_;
  }
  return result;
}

void awd::profile::TriggerProcessingRule::New(awd::profile::TriggerProcessingRule *this)
{
}

uint64_t awd::profile::TriggerProcessingRule::Clear(awd::profile::TriggerProcessingRule *this)
{
  if (*((unsigned char *)this + 80)) {
    *((_DWORD *)this + 1MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  }
  *((_DWORD *)this + 4) = 0;
  sub_1D3E4D7B0((uint64_t)this + 24);
  uint64_t result = sub_1D3E4D7B0((uint64_t)this + 48);
  *((_DWORD *)this + 20) = 0;
  return result;
}

uint64_t awd::profile::TriggerProcessingRule::MergePartialFromCodedStream(awd::profile::TriggerProcessingRule *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2)
{
  int v4 = (uint64_t *)((char *)this + 8);
  uint64_t v5 = (unsigned int *)((char *)this + 72);
  uint64_t v6 = (awd::profile::TriggerProcessingRule *)((char *)this + 48);
  int v7 = (awd::profile::TriggerProcessingRule *)((char *)this + 24);
LABEL_2:
  while (2)
  {
    uint64_t v8 = (char *)*((void *)a2 + 1);
    if ((unint64_t)v8 >= *((void *)a2 + 2) || *v8 < 0)
    {
      unint64_t TagFallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(a2);
      *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = TagFallback;
      if (!TagFallback) {
        return 1;
      }
    }
    else
    {
      unint64_t TagFallback = *v8;
      *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = TagFallback;
      *((void *)a2 + 1) = v8 + 1;
      if (!TagFallback) {
        return 1;
      }
    }
    switch(TagFallback >> 3)
    {
      case 1u:
        int v10 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_19;
        }
        int v12 = (char *)*((void *)a2 + 1);
        unint64_t v11 = *((void *)a2 + 2);
        if ((unint64_t)v12 >= v11 || *v12 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v5);
          if (!result) {
            return result;
          }
          uint64_t v13 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v11 = *((void *)a2 + 2);
        }
        else
        {
          *uint64_t v5 = *v12;
          uint64_t v13 = v12 + 1;
          *((void *)a2 + 1) = v13;
        }
        *((_DWORD *)this + 20) |= 1u;
        if ((unint64_t)v13 >= v11 || *v13 != 18) {
          continue;
        }
        goto LABEL_28;
      case 2u:
        int v10 = TagFallback & 7;
        if (v10 != 2) {
          goto LABEL_19;
        }
        while (2)
        {
          int v17 = *((_DWORD *)this + 15);
          uint64_t v18 = *((int *)this + 14);
          if ((int)v18 >= v17)
          {
            if (v17 == *((_DWORD *)this + 16))
            {
              wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v6);
              int v17 = *((_DWORD *)this + 15);
            }
            *((_DWORD *)this + 15) = v17 + 1;
            operator new();
          }
          uint64_t v19 = *((void *)this + 6);
          *((_DWORD *)this + 14) = v18 + 1;
          unsigned int v20 = *(awd::profile::ConditionClause **)(v19 + 8 * v18);
          unsigned int v48 = 0;
          int v21 = (char *)*((void *)a2 + 1);
          if ((unint64_t)v21 >= *((void *)a2 + 2) || *v21 < 0)
          {
            if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v48))return 0; {
          }
            }
          else
          {
            unsigned int v48 = *v21;
            *((void *)a2 + 1) = v21 + 1;
          }
          int v22 = *((_DWORD *)a2 + 14);
          int v23 = *((_DWORD *)a2 + 15);
          *((_DWORD *)a2 + 14) = v22 + 1;
          if (v22 >= v23) {
            return 0;
          }
          wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(a2);
          if (!awd::profile::ConditionClause::MergePartialFromCodedStream(v20, a2)
            || !*((unsigned char *)a2 + 36))
          {
            return 0;
          }
          wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(a2);
          int v24 = *((_DWORD *)a2 + 14);
          BOOL v25 = __OFSUB__(v24, 1);
          int v26 = v24 - 1;
          if (v26 < 0 == v25) {
            *((_DWORD *)a2 + 14) = v26;
          }
          uint64_t v13 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v14 = *((void *)a2 + 2);
          if ((unint64_t)v13 < v14)
          {
            int v27 = *v13;
            if (v27 == 18)
            {
LABEL_28:
              *((void *)a2 + 1) = v13 + 1;
              continue;
            }
            goto LABEL_45;
          }
          goto LABEL_2;
        }
      case 3u:
        int v10 = TagFallback & 7;
        if (v10 == 2)
        {
          uint64_t result = sub_1D3E41A0C(a2, (uint64_t)v4);
          if (!result) {
            return result;
          }
          while (1)
          {
            uint64_t v13 = (unsigned char *)*((void *)a2 + 1);
            unint64_t v14 = *((void *)a2 + 2);
            if ((unint64_t)v13 >= v14) {
              goto LABEL_2;
            }
            int v27 = *v13;
            if (v27 == 34) {
              break;
            }
LABEL_45:
            if (v27 != 24) {
              goto LABEL_2;
            }
            int v15 = v13 + 1;
            *((void *)a2 + 1) = v15;
LABEL_47:
            unsigned int v47 = 0;
            if ((unint64_t)v15 >= v14 || *v15 < 0)
            {
              if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v47))return 0; {
            }
              }
            else
            {
              unsigned int v47 = *v15;
              *((void *)a2 + 1) = v15 + 1;
            }
            int v28 = *((_DWORD *)this + 4);
            if (v28 == *((_DWORD *)this + 5))
            {
              sub_1D3E4D664((uint64_t)v4, v28 + 1);
              int v28 = *((_DWORD *)this + 4);
            }
            unsigned int v29 = v47;
            uint64_t v30 = *((void *)this + 1);
            *((_DWORD *)this + 4) = v28 + 1;
            *(_DWORD *)(v30 + 4 * v2MEMORY[0x1D9440F90]((char *)this + 8) = v29;
            int v31 = *((_DWORD *)this + 5) - *((_DWORD *)this + 4);
            if (v31 >= 1)
            {
              int v32 = v31 + 1;
              do
              {
                uint64_t v33 = (unsigned char *)*((void *)a2 + 1);
                unint64_t v34 = *((void *)a2 + 2);
                if ((unint64_t)v33 >= v34 || *v33 != 24) {
                  break;
                }
                *((void *)a2 + 1) = v33 + 1;
                if ((unint64_t)(v33 + 1) >= v34 || (char)v33[1] < 0)
                {
                  if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v47))return 0; {
                  unsigned int v35 = v47;
                  }
                  uint64_t v30 = *v4;
                }
                else
                {
                  unsigned int v35 = v33[1];
                  unsigned int v47 = v35;
                  *((void *)a2 + 1) = v33 + 2;
                }
                uint64_t v36 = *((int *)this + 4);
                *((_DWORD *)this + 4) = v36 + 1;
                *(_DWORD *)(v30 + 4 * v36) = v35;
                --v32;
              }
              while (v32 > 1);
            }
          }
          do
          {
            *((void *)a2 + 1) = v13 + 1;
LABEL_66:
            int v37 = *((_DWORD *)this + 9);
            uint64_t v38 = *((int *)this + 8);
            if ((int)v38 >= v37)
            {
              if (v37 == *((_DWORD *)this + 10))
              {
                wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v7);
                int v37 = *((_DWORD *)this + 9);
              }
              *((_DWORD *)this + 9) = v37 + 1;
              operator new();
            }
            uint64_t v39 = *((void *)this + 3);
            *((_DWORD *)this + MEMORY[0x1D9440F90]((char *)this + 8) = v38 + 1;
            uint64_t v40 = *(awd::profile::ConditionClause **)(v39 + 8 * v38);
            unsigned int v49 = 0;
            unsigned int v41 = (char *)*((void *)a2 + 1);
            if ((unint64_t)v41 >= *((void *)a2 + 2) || *v41 < 0)
            {
              if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v49))return 0; {
            }
              }
            else
            {
              unsigned int v49 = *v41;
              *((void *)a2 + 1) = v41 + 1;
            }
            int v42 = *((_DWORD *)a2 + 14);
            int v43 = *((_DWORD *)a2 + 15);
            *((_DWORD *)a2 + 14) = v42 + 1;
            if (v42 >= v43) {
              return 0;
            }
            wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(a2);
            if (!awd::profile::ConditionClause::MergePartialFromCodedStream(v40, a2)
              || !*((unsigned char *)a2 + 36))
            {
              return 0;
            }
            wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(a2);
            int v44 = *((_DWORD *)a2 + 14);
            BOOL v25 = __OFSUB__(v44, 1);
            int v45 = v44 - 1;
            if (v45 < 0 == v25) {
              *((_DWORD *)a2 + 14) = v45;
            }
            uint64_t v13 = (unsigned char *)*((void *)a2 + 1);
            int v46 = (unsigned char *)*((void *)a2 + 2);
          }
          while (v13 < v46 && *v13 == 34);
          if (v13 == v46 && (*((_DWORD *)a2 + 11) || *((_DWORD *)a2 + 6) == *((_DWORD *)a2 + 10)))
          {
            *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
            uint64_t result = 1;
            *((unsigned char *)a2 + 36) = 1;
            return result;
          }
          continue;
        }
        if ((TagFallback & 7) == 0)
        {
          int v15 = (char *)*((void *)a2 + 1);
          unint64_t v14 = *((void *)a2 + 2);
          goto LABEL_47;
        }
LABEL_19:
        if (v10 != 4)
        {
          if ((wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipField(a2, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)TagFallback) & 1) == 0)return 0; {
          continue;
          }
        }
        return 1;
      case 4u:
        int v10 = TagFallback & 7;
        if (v10 != 2) {
          goto LABEL_19;
        }
        goto LABEL_66;
      default:
        int v10 = TagFallback & 7;
        goto LABEL_19;
    }
  }
}

uint64_t awd::profile::TriggerProcessingRule::SerializeWithCachedSizes(uint64_t this, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  uint64_t v5 = this;
  if (*(unsigned char *)(this + 80)) {
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)1, *(unsigned int *)(this + 72), (uint64_t)a2, a4);
  }
  if (*(int *)(v5 + 56) >= 1)
  {
    uint64_t v6 = 0;
    do
      this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)2, *(void *)(*(void *)(v5 + 48) + 8 * v6++), a2, a4);
    while (v6 < *(int *)(v5 + 56));
  }
  if (*(int *)(v5 + 16) >= 1)
  {
    uint64_t v7 = 0;
    do
      this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)3, *(unsigned int *)(*(void *)(v5 + 8) + 4 * v7++), (uint64_t)a2, a4);
    while (v7 < *(int *)(v5 + 16));
  }
  if (*(int *)(v5 + 32) >= 1)
  {
    uint64_t v8 = 0;
    do
      this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)4, *(void *)(*(void *)(v5 + 24) + 8 * v8++), a2, a4);
    while (v8 < *(int *)(v5 + 32));
  }
  return this;
}

uint64_t awd::profile::TriggerProcessingRule::ByteSize(awd::profile::TriggerProcessingRule *this)
{
  if (*((unsigned char *)this + 80))
  {
    uint64_t v3 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 18);
    if (v3 >= 0x80) {
      int v2 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v3) + 1;
    }
    else {
      int v2 = 2;
    }
  }
  else
  {
    int v2 = 0;
  }
  int v4 = *((_DWORD *)this + 4);
  if (v4 < 1)
  {
    int v6 = 0;
  }
  else
  {
    uint64_t v5 = 0;
    int v6 = 0;
    do
    {
      uint64_t v7 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*(unsigned int *)(*((void *)this + 1)
                                                                                            + 4 * v5);
      if (v7 >= 0x80)
      {
        int v8 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v7);
        int v4 = *((_DWORD *)this + 4);
      }
      else
      {
        int v8 = 1;
      }
      v6 += v8;
      ++v5;
    }
    while (v5 < v4);
  }
  int v9 = *((_DWORD *)this + 8);
  int v10 = v6 + v9 + v2 + v4;
  if (v9 >= 1)
  {
    uint64_t v11 = 0;
    do
    {
      int v12 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)awd::profile::ConditionClause::ByteSize(*(awd::profile::ConditionClause **)(*((void *)this + 3) + 8 * v11));
      int v13 = (int)v12;
      if (v12 >= 0x80) {
        int v14 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v12);
      }
      else {
        int v14 = 1;
      }
      v10 += v13 + v14;
      ++v11;
    }
    while (v11 < *((int *)this + 8));
  }
  int v15 = *((_DWORD *)this + 14);
  uint64_t v16 = (v15 + v10);
  if (v15 >= 1)
  {
    uint64_t v17 = 0;
    do
    {
      uint64_t v18 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)awd::profile::ConditionClause::ByteSize(*(awd::profile::ConditionClause **)(*((void *)this + 6) + 8 * v17));
      int v19 = (int)v18;
      if (v18 >= 0x80) {
        int v20 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v18);
      }
      else {
        int v20 = 1;
      }
      uint64_t v16 = (v19 + v16 + v20);
      ++v17;
    }
    while (v17 < *((int *)this + 14));
  }
  *((_DWORD *)this + 19) = v16;
  return v16;
}

void awd::profile::TriggerProcessingRule::CopyFrom(awd::profile::TriggerProcessingRule *this, const awd::profile::TriggerProcessingRule *a2)
{
  if (a2 != this)
  {
    (*(void (**)(awd::profile::TriggerProcessingRule *))(*(void *)this + 32))(this);
    awd::profile::TriggerProcessingRule::MergeFrom(this, a2);
  }
}

uint64_t awd::profile::TriggerProcessingRule::IsInitialized(awd::profile::TriggerProcessingRule *this)
{
  return 1;
}

uint64_t awd::profile::TriggerProcessingRule::Swap(uint64_t this, awd::profile::TriggerProcessingRule *a2)
{
  if (a2 != (awd::profile::TriggerProcessingRule *)this)
  {
    uint64_t v3 = this;
    int v4 = *(_DWORD *)(this + 72);
    *(_DWORD *)(this + 72) = *((_DWORD *)a2 + 18);
    *((_DWORD *)a2 + 1MEMORY[0x1D9440F90]((char *)this + 8) = v4;
    uint64_t v5 = *(void *)(this + 8);
    *(void *)(this + MEMORY[0x1D9440F90]((char *)this + 8) = *((void *)a2 + 1);
    uint64_t v6 = *((void *)a2 + 2);
    *((void *)a2 + 1) = v5;
    uint64_t v7 = *(void *)(this + 16);
    *(void *)(this + 16) = v6;
    *((void *)a2 + 2) = v7;
    wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Swap();
    this = wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Swap();
    int v8 = *(_DWORD *)(v3 + 80);
    *(_DWORD *)(v3 + 80) = *((_DWORD *)a2 + 20);
    *((_DWORD *)a2 + 20) = v8;
    int v9 = *(_DWORD *)(v3 + 76);
    *(_DWORD *)(v3 + 76) = *((_DWORD *)a2 + 19);
    *((_DWORD *)a2 + 19) = v9;
  }
  return this;
}

void *awd::profile::TriggerProcessingRule::GetTypeName@<X0>(void *a1@<X8>)
{
  return sub_1D3E270D0(a1, "awd.profile.TriggerProcessingRule");
}

uint64_t awd::profile::AggregationSpec::SharedCtor(uint64_t this)
{
  *(void *)(this + 16) = 0;
  *(void *)(this + MEMORY[0x1D9440F90]((char *)this + 8) = MEMORY[0x1E4FBA920];
  *(_DWORD *)(this + 24) = 0;
  return this;
}

awd::profile::AggregationSpec *awd::profile::AggregationSpec::AggregationSpec(awd::profile::AggregationSpec *this, const awd::profile::AggregationSpec *a2)
{
  *((void *)this + 2) = 0;
  uint64_t v3 = MEMORY[0x1E4FBA920];
  *(void *)this = &unk_1F2B9B248;
  *((void *)this + 1) = v3;
  *((_DWORD *)this + 6) = 0;
  awd::profile::AggregationSpec::MergeFrom(this, a2);
  return this;
}

void sub_1D3E49CA4(_Unwind_Exception *a1)
{
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(v1);
  _Unwind_Resume(a1);
}

void awd::profile::AggregationSpec::MergeFrom(awd::profile::AggregationSpec *this, const awd::profile::AggregationSpec *a2)
{
  if (a2 == this)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v8);
  }
  LOBYTE(v4) = *((unsigned char *)a2 + 24);
  if ((_BYTE)v4)
  {
    if (*((unsigned char *)a2 + 24))
    {
      int v5 = *((_DWORD *)a2 + 4);
      *((_DWORD *)this + 6) |= 1u;
      *((_DWORD *)this + 4) = v5;
      int v4 = *((_DWORD *)a2 + 6);
    }
    if ((v4 & 2) != 0)
    {
      uint64_t v6 = (const std::string *)*((void *)a2 + 1);
      *((_DWORD *)this + 6) |= 2u;
      uint64_t v7 = (std::string *)*((void *)this + 1);
      if (v7 == (std::string *)MEMORY[0x1E4FBA920]) {
        operator new();
      }
      std::string::operator=(v7, v6);
    }
  }
}

void sub_1D3E49DA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)va);
  _Unwind_Resume(a1);
}

void awd::profile::AggregationSpec::~AggregationSpec(awd::profile::AggregationSpec *this)
{
  *(void *)this = &unk_1F2B9B248;
  awd::profile::AggregationSpec::SharedDtor((uint64_t)this);
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(this);
}

{
  uint64_t vars8;

  *(void *)this = &unk_1F2B9B248;
  awd::profile::AggregationSpec::SharedDtor((uint64_t)this);
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(this);
}

{
  uint64_t vars8;

  *(void *)this = &unk_1F2B9B248;
  awd::profile::AggregationSpec::SharedDtor((uint64_t)this);
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(this);
  JUMPOUT(0x1D94412F0);
}

uint64_t awd::profile::AggregationSpec::SharedDtor(uint64_t this)
{
  uint64_t v1 = *(void *)(this + 8);
  if (v1 != MEMORY[0x1E4FBA920] && v1 != 0)
  {
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
    JUMPOUT(0x1D94412F0);
  }
  return this;
}

uint64_t awd::profile::AggregationSpec::SetCachedSize(uint64_t this, int a2)
{
  *(_DWORD *)(this + 20) = a2;
  return this;
}

uint64_t awd::profile::AggregationSpec::default_instance(awd::profile::AggregationSpec *this, uint64_t a2, uint64_t a3, const char *a4)
{
  uint64_t result = awd::profile::AggregationSpec::default_instance_;
  if (!awd::profile::AggregationSpec::default_instance_)
  {
    awd::profile::protobuf_AddDesc_AwdProfile_2eproto(0, a2, a3, a4);
    return awd::profile::AggregationSpec::default_instance_;
  }
  return result;
}

void awd::profile::AggregationSpec::New(awd::profile::AggregationSpec *this)
{
}

uint64_t awd::profile::AggregationSpec::Clear(uint64_t this)
{
  char v1 = *(unsigned char *)(this + 24);
  if (v1)
  {
    *(_DWORD *)(this + 16) = 0;
    if ((v1 & 2) != 0)
    {
      uint64_t v2 = *(void *)(this + 8);
      if (v2 != MEMORY[0x1E4FBA920])
      {
        if (*(char *)(v2 + 23) < 0)
        {
          **(unsigned char **)uint64_t v2 = 0;
          *(void *)(v2 + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
        }
        else
        {
          *(unsigned char *)uint64_t v2 = 0;
          *(unsigned char *)(v2 + 23) = 0;
        }
      }
    }
  }
  *(_DWORD *)(this + 24) = 0;
  return this;
}

uint64_t awd::profile::AggregationSpec::MergePartialFromCodedStream(awd::profile::AggregationSpec *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2)
{
  int v4 = (unsigned int *)((char *)this + 16);
  uint64_t v5 = MEMORY[0x1E4FBA920];
  while (1)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v6 = (char *)*((void *)a2 + 1);
        if ((unint64_t)v6 >= *((void *)a2 + 2) || *v6 < 0)
        {
          unint64_t TagFallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(a2);
          *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = TagFallback;
          if (!TagFallback) {
            return 1;
          }
        }
        else
        {
          unint64_t TagFallback = *v6;
          *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = TagFallback;
          *((void *)a2 + 1) = v6 + 1;
          if (!TagFallback) {
            return 1;
          }
        }
        if (TagFallback >> 3 != 1) {
          break;
        }
        int v8 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_16;
        }
        uint64_t v11 = (char *)*((void *)a2 + 1);
        unint64_t v10 = *((void *)a2 + 2);
        if ((unint64_t)v11 >= v10 || *v11 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v4);
          if (!result) {
            return result;
          }
          int v12 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v10 = *((void *)a2 + 2);
        }
        else
        {
          unsigned int *v4 = *v11;
          int v12 = v11 + 1;
          *((void *)a2 + 1) = v12;
        }
        int v9 = *((_DWORD *)this + 6) | 1;
        *((_DWORD *)this + 6) = v9;
        if ((unint64_t)v12 < v10 && *v12 == 18)
        {
          *((void *)a2 + 1) = v12 + 1;
          goto LABEL_24;
        }
      }
      if (TagFallback >> 3 != 2) {
        break;
      }
      int v8 = TagFallback & 7;
      if (v8 != 2) {
        goto LABEL_16;
      }
      int v9 = *((_DWORD *)this + 6);
LABEL_24:
      *((_DWORD *)this + 6) = v9 | 2;
      if (*((void *)this + 1) == v5) {
        operator new();
      }
      uint64_t result = wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadString();
      if (!result) {
        return result;
      }
      if (*((void *)a2 + 1) == *((void *)a2 + 2)
        && (*((_DWORD *)a2 + 11) || *((_DWORD *)a2 + 6) == *((_DWORD *)a2 + 10)))
      {
        *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
        uint64_t result = 1;
        *((unsigned char *)a2 + 36) = 1;
        return result;
      }
    }
    int v8 = TagFallback & 7;
LABEL_16:
    if (v8 == 4) {
      return 1;
    }
    if ((wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipField(a2, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)TagFallback) & 1) == 0)return 0; {
  }
    }
}

uint64_t awd::profile::AggregationSpec::SerializeWithCachedSizes(uint64_t this, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  uint64_t v4 = this;
  int v5 = *(_DWORD *)(this + 24);
  if (v5)
  {
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)1, *(unsigned int *)(this + 16), (uint64_t)a2, a4);
    int v5 = *(_DWORD *)(v4 + 24);
  }
  if ((v5 & 2) != 0)
  {
    return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteString();
  }
  return this;
}

uint64_t awd::profile::AggregationSpec::ByteSize(awd::profile::AggregationSpec *this)
{
  char v2 = *((unsigned char *)this + 24);
  if (v2)
  {
    if (*((unsigned char *)this + 24))
    {
      uint64_t v4 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 4);
      if (v4 >= 0x80)
      {
        uint64_t v3 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v4) + 1;
        if ((*((_DWORD *)this + 6) & 2) == 0) {
          goto LABEL_19;
        }
      }
      else
      {
        uint64_t v3 = 2;
        if ((v2 & 2) == 0) {
          goto LABEL_19;
        }
      }
    }
    else
    {
      uint64_t v3 = 0;
      if ((*((unsigned char *)this + 24) & 2) == 0) {
        goto LABEL_19;
      }
    }
    uint64_t v5 = *((void *)this + 1);
    int v6 = *(unsigned __int8 *)(v5 + 23);
    char v7 = v6;
    uint64_t v8 = *(void *)(v5 + 8);
    if ((v6 & 0x80u) == 0) {
      unint64_t v9 = *(unsigned __int8 *)(v5 + 23);
    }
    else {
      unint64_t v9 = v8;
    }
    if (v9 >= 0x80)
    {
      int v10 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v9);
      int v6 = *(unsigned __int8 *)(v5 + 23);
      uint64_t v8 = *(void *)(v5 + 8);
      char v7 = *(unsigned char *)(v5 + 23);
    }
    else
    {
      int v10 = 1;
    }
    if (v7 < 0) {
      int v6 = v8;
    }
    uint64_t v3 = (v3 + v10 + v6 + 1);
  }
  else
  {
    uint64_t v3 = 0;
  }
LABEL_19:
  *((_DWORD *)this + 5) = v3;
  return v3;
}

void awd::profile::AggregationSpec::CopyFrom(awd::profile::AggregationSpec *this, const awd::profile::AggregationSpec *a2)
{
  if (a2 != this)
  {
    (*(void (**)(awd::profile::AggregationSpec *))(*(void *)this + 32))(this);
    awd::profile::AggregationSpec::MergeFrom(this, a2);
  }
}

uint64_t awd::profile::AggregationSpec::IsInitialized(awd::profile::AggregationSpec *this)
{
  return 1;
}

uint64_t awd::profile::AggregationSpec::Swap(uint64_t this, awd::profile::AggregationSpec *a2)
{
  if (a2 != (awd::profile::AggregationSpec *)this)
  {
    int v2 = *(_DWORD *)(this + 16);
    *(_DWORD *)(this + 16) = *((_DWORD *)a2 + 4);
    *((_DWORD *)a2 + 4) = v2;
    uint64_t v3 = *(void *)(this + 8);
    *(void *)(this + MEMORY[0x1D9440F90]((char *)this + 8) = *((void *)a2 + 1);
    *((void *)a2 + 1) = v3;
    LODWORD(v3) = *(_DWORD *)(this + 24);
    *(_DWORD *)(this + 24) = *((_DWORD *)a2 + 6);
    *((_DWORD *)a2 + 6) = v3;
    LODWORD(v3) = *(_DWORD *)(this + 20);
    *(_DWORD *)(this + 20) = *((_DWORD *)a2 + 5);
    *((_DWORD *)a2 + 5) = v3;
  }
  return this;
}

void *awd::profile::AggregationSpec::GetTypeName@<X0>(void *a1@<X8>)
{
  return sub_1D3E270D0(a1, "awd.profile.AggregationSpec");
}

double awd::profile::MetricFileSpec::SharedCtor(awd::profile::MetricFileSpec *this)
{
  *(void *)&double result = 0x100000000;
  *((void *)this + 1) = 0x100000000;
  *((_DWORD *)this + 4) = 0;
  *((unsigned char *)this + 20) = 0;
  *((void *)this + 3) = 0;
  *((void *)this + 4) = 0;
  return result;
}

awd::profile::MetricFileSpec *awd::profile::MetricFileSpec::MetricFileSpec(awd::profile::MetricFileSpec *this, const awd::profile::MetricFileSpec *a2)
{
  *(void *)this = &unk_1F2B9B158;
  *((void *)this + 1) = 0x100000000;
  *((_DWORD *)this + 4) = 0;
  *((unsigned char *)this + 20) = 0;
  *((void *)this + 3) = 0;
  *((void *)this + 4) = 0;
  awd::profile::MetricFileSpec::MergeFrom(this, a2);
  return this;
}

void sub_1D3E4A484(_Unwind_Exception *a1)
{
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(v1);
  _Unwind_Resume(a1);
}

void awd::profile::MetricFileSpec::MergeFrom(awd::profile::MetricFileSpec *this, const awd::profile::MetricFileSpec *a2)
{
  if (a2 == this)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v10);
  }
  LOBYTE(v4) = *((unsigned char *)a2 + 36);
  if ((_BYTE)v4)
  {
    if (*((unsigned char *)a2 + 36))
    {
      int v6 = *((_DWORD *)a2 + 2);
      *((_DWORD *)this + 9) |= 1u;
      *((_DWORD *)this + 2) = v6;
      int v4 = *((_DWORD *)a2 + 9);
      if ((v4 & 2) == 0)
      {
LABEL_6:
        if ((v4 & 4) == 0) {
          goto LABEL_7;
        }
        goto LABEL_13;
      }
    }
    else if ((*((unsigned char *)a2 + 36) & 2) == 0)
    {
      goto LABEL_6;
    }
    int v7 = *((_DWORD *)a2 + 3);
    *((_DWORD *)this + 9) |= 2u;
    *((_DWORD *)this + 3) = v7;
    int v4 = *((_DWORD *)a2 + 9);
    if ((v4 & 4) == 0)
    {
LABEL_7:
      if ((v4 & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_14;
    }
LABEL_13:
    int v8 = *((_DWORD *)a2 + 4);
    *((_DWORD *)this + 9) |= 4u;
    *((_DWORD *)this + 4) = v8;
    int v4 = *((_DWORD *)a2 + 9);
    if ((v4 & 8) == 0)
    {
LABEL_8:
      if ((v4 & 0x10) == 0) {
        return;
      }
      goto LABEL_9;
    }
LABEL_14:
    char v9 = *((unsigned char *)a2 + 20);
    *((_DWORD *)this + 9) |= 8u;
    *((unsigned char *)this + 20) = v9;
    if ((*((_DWORD *)a2 + 9) & 0x10) == 0) {
      return;
    }
LABEL_9:
    uint64_t v5 = *((void *)a2 + 3);
    *((_DWORD *)this + 9) |= 0x10u;
    *((void *)this + 3) = v5;
  }
}

void sub_1D3E4A5AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)va);
  _Unwind_Resume(a1);
}

void awd::profile::MetricFileSpec::~MetricFileSpec(awd::profile::MetricFileSpec *this)
{
  *(void *)this = &unk_1F2B9B158;
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(this);
}

{
  *(void *)this = &unk_1F2B9B158;
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(this);
}

{
  uint64_t vars8;

  *(void *)this = &unk_1F2B9B158;
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(this);
  JUMPOUT(0x1D94412F0);
}

uint64_t awd::profile::MetricFileSpec::SetCachedSize(uint64_t this, int a2)
{
  *(_DWORD *)(this + 32) = a2;
  return this;
}

uint64_t awd::profile::MetricFileSpec::default_instance(awd::profile::MetricFileSpec *this, uint64_t a2, uint64_t a3, const char *a4)
{
  uint64_t result = awd::profile::MetricFileSpec::default_instance_;
  if (!awd::profile::MetricFileSpec::default_instance_)
  {
    awd::profile::protobuf_AddDesc_AwdProfile_2eproto(0, a2, a3, a4);
    return awd::profile::MetricFileSpec::default_instance_;
  }
  return result;
}

void awd::profile::MetricFileSpec::New(awd::profile::MetricFileSpec *this)
{
}

uint64_t awd::profile::MetricFileSpec::Clear(uint64_t this)
{
  if (*(unsigned char *)(this + 36))
  {
    *(void *)(this + MEMORY[0x1D9440F90]((char *)this + 8) = 0x100000000;
    *(_DWORD *)(this + 16) = 0;
    *(unsigned char *)(this + 20) = 0;
    *(void *)(this + 24) = 0;
  }
  *(_DWORD *)(this + 36) = 0;
  return this;
}

uint64_t awd::profile::MetricFileSpec::MergePartialFromCodedStream(awd::profile::MetricFileSpec *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2)
{
  int v4 = (unsigned int *)((char *)this + 8);
  uint64_t v5 = (unsigned int *)((char *)this + 16);
  int v6 = (unint64_t *)((char *)this + 24);
  while (2)
  {
    int v7 = (char *)*((void *)a2 + 1);
    if ((unint64_t)v7 >= *((void *)a2 + 2) || *v7 < 0)
    {
      unint64_t TagFallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(a2);
      *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = TagFallback;
      if (!TagFallback) {
        return 1;
      }
    }
    else
    {
      unint64_t TagFallback = *v7;
      *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = TagFallback;
      *((void *)a2 + 1) = v7 + 1;
      if (!TagFallback) {
        return 1;
      }
    }
    switch(TagFallback >> 3)
    {
      case 1u:
        int v9 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_22;
        }
        uint64_t v11 = (char *)*((void *)a2 + 1);
        unint64_t v10 = *((void *)a2 + 2);
        if ((unint64_t)v11 >= v10 || *v11 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v4);
          if (!result) {
            return result;
          }
          int v12 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v10 = *((void *)a2 + 2);
        }
        else
        {
          unsigned int *v4 = *v11;
          int v12 = v11 + 1;
          *((void *)a2 + 1) = v12;
        }
        *((_DWORD *)this + 9) |= 1u;
        if ((unint64_t)v12 < v10 && *v12 == 16)
        {
          int v15 = v12 + 1;
          *((void *)a2 + 1) = v15;
          goto LABEL_30;
        }
        continue;
      case 2u:
        int v9 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_22;
        }
        int v15 = (char *)*((void *)a2 + 1);
        unint64_t v10 = *((void *)a2 + 2);
LABEL_30:
        unsigned int v26 = 0;
        if ((unint64_t)v15 >= v10 || *v15 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v26);
          if (!result) {
            return result;
          }
          unsigned int v18 = v26;
        }
        else
        {
          unsigned int v18 = *v15;
          *((void *)a2 + 1) = v15 + 1;
        }
        if (v18 - 1 <= 2)
        {
          *((_DWORD *)this + 9) |= 2u;
          *((_DWORD *)this + 3) = v18;
        }
        int v19 = (unsigned char *)*((void *)a2 + 1);
        unint64_t v13 = *((void *)a2 + 2);
        if ((unint64_t)v19 >= v13 || *v19 != 24) {
          continue;
        }
        uint64_t v16 = v19 + 1;
        *((void *)a2 + 1) = v16;
LABEL_40:
        if ((unint64_t)v16 >= v13 || *v16 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, v5);
          if (!result) {
            return result;
          }
          int v20 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v13 = *((void *)a2 + 2);
        }
        else
        {
          *uint64_t v5 = *v16;
          int v20 = v16 + 1;
          *((void *)a2 + 1) = v20;
        }
        *((_DWORD *)this + 9) |= 4u;
        if ((unint64_t)v20 >= v13 || *v20 != 32) {
          continue;
        }
        uint64_t v17 = v20 + 1;
        *((void *)a2 + 1) = v17;
LABEL_48:
        unsigned int v25 = 0;
        if ((unint64_t)v17 >= v13 || (char)*v17 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v25);
          if (!result) {
            return result;
          }
          unsigned int v21 = v25;
          int v22 = (unsigned __int8 *)*((void *)a2 + 1);
          unint64_t v13 = *((void *)a2 + 2);
        }
        else
        {
          unsigned int v21 = *v17;
          int v22 = v17 + 1;
          *((void *)a2 + 1) = v22;
        }
        *((unsigned char *)this + 20) = v21 != 0;
        *((_DWORD *)this + 9) |= 8u;
        if ((int)v13 - (int)v22 < 2 || *v22 != 128 || v22[1] != 1) {
          continue;
        }
        int v14 = (char *)(v22 + 2);
        *((void *)a2 + 1) = v14;
        goto LABEL_57;
      case 3u:
        int v9 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_22;
        }
        uint64_t v16 = (char *)*((void *)a2 + 1);
        unint64_t v13 = *((void *)a2 + 2);
        goto LABEL_40;
      case 4u:
        int v9 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_22;
        }
        uint64_t v17 = (unsigned __int8 *)*((void *)a2 + 1);
        unint64_t v13 = *((void *)a2 + 2);
        goto LABEL_48;
      default:
        if (TagFallback >> 3 == 16)
        {
          int v9 = TagFallback & 7;
          if ((TagFallback & 7) != 0) {
            goto LABEL_22;
          }
          int v14 = (char *)*((void *)a2 + 1);
          unint64_t v13 = *((void *)a2 + 2);
LABEL_57:
          if ((unint64_t)v14 >= v13 || *v14 < 0)
          {
            uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(a2, v6);
            if (!result) {
              return result;
            }
            int v23 = (unsigned __int8 *)*((void *)a2 + 1);
            unint64_t v13 = *((void *)a2 + 2);
          }
          else
          {
            unint64_t *v6 = *v14;
            int v23 = (unsigned __int8 *)(v14 + 1);
            *((void *)a2 + 1) = v23;
          }
          *((_DWORD *)this + 9) |= 0x10u;
          if (v23 == (unsigned __int8 *)v13 && (*((_DWORD *)a2 + 11) || *((_DWORD *)a2 + 6) == *((_DWORD *)a2 + 10)))
          {
            *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
            uint64_t result = 1;
            *((unsigned char *)a2 + 36) = 1;
            return result;
          }
          continue;
        }
        int v9 = TagFallback & 7;
LABEL_22:
        if (v9 != 4)
        {
          if ((wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipField(a2, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)TagFallback) & 1) == 0)return 0; {
          continue;
          }
        }
        return 1;
    }
  }
}

uint64_t awd::profile::MetricFileSpec::SerializeWithCachedSizes(uint64_t this, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  uint64_t v5 = this;
  int v6 = *(_DWORD *)(this + 36);
  if (v6)
  {
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)1, *(unsigned int *)(this + 8), (uint64_t)a2, a4);
    int v6 = *(_DWORD *)(v5 + 36);
    if ((v6 & 2) == 0)
    {
LABEL_3:
      if ((v6 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_3;
  }
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteEnum((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)2, *(unsigned int *)(v5 + 12), (uint64_t)a2, a4);
  int v6 = *(_DWORD *)(v5 + 36);
  if ((v6 & 4) == 0)
  {
LABEL_4:
    if ((v6 & 8) == 0) {
      goto LABEL_5;
    }
LABEL_10:
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBool((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)4, *(unsigned __int8 *)(v5 + 20), (uint64_t)a2, a4);
    if ((*(_DWORD *)(v5 + 36) & 0x10) == 0) {
      return this;
    }
    goto LABEL_11;
  }
LABEL_9:
  this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)3, *(unsigned int *)(v5 + 16), (uint64_t)a2, a4);
  int v6 = *(_DWORD *)(v5 + 36);
  if ((v6 & 8) != 0) {
    goto LABEL_10;
  }
LABEL_5:
  if ((v6 & 0x10) == 0) {
    return this;
  }
LABEL_11:
  uint64_t v7 = *(void *)(v5 + 24);
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt64((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)0x10, v7, (uint64_t)a2, a4);
}

uint64_t awd::profile::MetricFileSpec::ByteSize(awd::profile::MetricFileSpec *this)
{
  LOBYTE(v2) = *((unsigned char *)this + 36);
  if (!(_BYTE)v2)
  {
    uint64_t v3 = 0;
    goto LABEL_26;
  }
  if ((*((unsigned char *)this + 36) & 1) == 0)
  {
    LODWORD(v3) = 0;
    if ((*((unsigned char *)this + 36) & 2) == 0) {
      goto LABEL_16;
    }
LABEL_10:
    uint64_t v5 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 3);
    if ((v5 & 0x80000000) != 0)
    {
      int v6 = 11;
    }
    else if (v5 >= 0x80)
    {
      int v6 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v5) + 1;
      int v2 = *((_DWORD *)this + 9);
    }
    else
    {
      int v6 = 2;
    }
    LODWORD(v3) = v6 + v3;
    goto LABEL_16;
  }
  int v4 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 2);
  if (v4 < 0x80)
  {
    LODWORD(v3) = 2;
    if ((v2 & 2) == 0) {
      goto LABEL_16;
    }
    goto LABEL_10;
  }
  LODWORD(v3) = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v4) + 1;
  int v2 = *((_DWORD *)this + 9);
  if ((v2 & 2) != 0) {
    goto LABEL_10;
  }
LABEL_16:
  if ((v2 & 4) != 0)
  {
    uint64_t v7 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 4);
    if (v7 >= 0x80)
    {
      int v8 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v7) + 1;
      int v2 = *((_DWORD *)this + 9);
    }
    else
    {
      int v8 = 2;
    }
    LODWORD(v3) = v8 + v3;
  }
  if ((v2 & 8) != 0) {
    uint64_t v3 = (v3 + 2);
  }
  else {
    uint64_t v3 = v3;
  }
  if ((v2 & 0x10) != 0) {
    uint64_t v3 = v3
  }
       + wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64(*((wireless_diagnostics::google::protobuf::io::CodedOutputStream **)this + 3))
       + 2;
LABEL_26:
  *((_DWORD *)this + MEMORY[0x1D9440F90]((char *)this + 8) = v3;
  return v3;
}

void awd::profile::MetricFileSpec::CopyFrom(awd::profile::MetricFileSpec *this, const awd::profile::MetricFileSpec *a2)
{
  if (a2 != this)
  {
    (*(void (**)(awd::profile::MetricFileSpec *))(*(void *)this + 32))(this);
    awd::profile::MetricFileSpec::MergeFrom(this, a2);
  }
}

uint64_t awd::profile::MetricFileSpec::IsInitialized(awd::profile::MetricFileSpec *this)
{
  return 1;
}

uint64_t awd::profile::MetricFileSpec::Swap(uint64_t this, awd::profile::MetricFileSpec *a2)
{
  if (a2 != (awd::profile::MetricFileSpec *)this)
  {
    int v2 = *(_DWORD *)(this + 8);
    *(_DWORD *)(this + MEMORY[0x1D9440F90]((char *)this + 8) = *((_DWORD *)a2 + 2);
    *((_DWORD *)a2 + 2) = v2;
    int v3 = *(_DWORD *)(this + 12);
    *(_DWORD *)(this + 12) = *((_DWORD *)a2 + 3);
    *((_DWORD *)a2 + 3) = v3;
    int v4 = *(_DWORD *)(this + 16);
    *(_DWORD *)(this + 16) = *((_DWORD *)a2 + 4);
    *((_DWORD *)a2 + 4) = v4;
    LOBYTE(v4) = *(unsigned char *)(this + 20);
    *(unsigned char *)(this + 20) = *((unsigned char *)a2 + 20);
    *((unsigned char *)a2 + 20) = v4;
    uint64_t v5 = *(void *)(this + 24);
    *(void *)(this + 24) = *((void *)a2 + 3);
    *((void *)a2 + 3) = v5;
    LODWORD(v5) = *(_DWORD *)(this + 36);
    *(_DWORD *)(this + 36) = *((_DWORD *)a2 + 9);
    *((_DWORD *)a2 + 9) = v5;
    LODWORD(v5) = *(_DWORD *)(this + 32);
    *(_DWORD *)(this + 32) = *((_DWORD *)a2 + 8);
    *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = v5;
  }
  return this;
}

void *awd::profile::MetricFileSpec::GetTypeName@<X0>(void *a1@<X8>)
{
  return sub_1D3E270D0(a1, "awd.profile.MetricFileSpec");
}

BOOL awd::profile::TaskingCriteria_BuildType_IsValid(awd::profile *this)
{
  return (this - 1) < 4;
}

uint64_t awd::profile::TaskingCriteria::SharedCtor(uint64_t this)
{
  *(void *)(this + 24) = 0;
  return this;
}

awd::profile::TaskingCriteria *awd::profile::TaskingCriteria::TaskingCriteria(awd::profile::TaskingCriteria *this, const awd::profile::TaskingCriteria *a2)
{
  *(void *)this = &unk_1F2B9B338;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  awd::profile::TaskingCriteria::MergeFrom(this, a2);
  return this;
}

void sub_1D3E4ADC8(_Unwind_Exception *a1)
{
  int v3 = v2;
  if (*v3) {
    MEMORY[0x1D94412D0](*v3, 0x1000C8052888210);
  }
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(v1);
  _Unwind_Resume(a1);
}

void awd::profile::TaskingCriteria::MergeFrom(awd::profile::TaskingCriteria *this, const awd::profile::TaskingCriteria *a2)
{
  if (a2 == this)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v5);
  }
  int v4 = *((_DWORD *)a2 + 4);
  if (v4)
  {
    sub_1D3E4D664((uint64_t)this + 8, *((_DWORD *)this + 4) + v4);
    memcpy((void *)(*((void *)this + 1) + 4 * *((int *)this + 4)), *((const void **)a2 + 1), 4 * *((int *)a2 + 4));
    *((_DWORD *)this + 4) += *((_DWORD *)a2 + 4);
  }
}

void sub_1D3E4AEB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)va);
  _Unwind_Resume(a1);
}

void awd::profile::TaskingCriteria::~TaskingCriteria(awd::profile::TaskingCriteria *this)
{
  *(void *)this = &unk_1F2B9B338;
  uint64_t v2 = *((void *)this + 1);
  if (v2) {
    MEMORY[0x1D94412D0](v2, 0x1000C8052888210);
  }
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(this);
}

{
  uint64_t vars8;

  awd::profile::TaskingCriteria::~TaskingCriteria(this);
  JUMPOUT(0x1D94412F0);
}

uint64_t awd::profile::TaskingCriteria::SetCachedSize(uint64_t this, int a2)
{
  *(_DWORD *)(this + 24) = a2;
  return this;
}

uint64_t awd::profile::TaskingCriteria::default_instance(awd::profile::TaskingCriteria *this, uint64_t a2, uint64_t a3, const char *a4)
{
  uint64_t result = awd::profile::TaskingCriteria::default_instance_;
  if (!awd::profile::TaskingCriteria::default_instance_)
  {
    awd::profile::protobuf_AddDesc_AwdProfile_2eproto(0, a2, a3, a4);
    return awd::profile::TaskingCriteria::default_instance_;
  }
  return result;
}

void awd::profile::TaskingCriteria::New(awd::profile::TaskingCriteria *this)
{
}

uint64_t awd::profile::TaskingCriteria::Clear(uint64_t this)
{
  *(_DWORD *)(this + 16) = 0;
  *(_DWORD *)(this + 2MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  return this;
}

uint64_t awd::profile::TaskingCriteria::MergePartialFromCodedStream(awd::profile::TaskingCriteria *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2)
{
  int v4 = (char *)this + 8;
  while (1)
  {
    while (1)
    {
      uint64_t v5 = (char *)*((void *)a2 + 1);
      if ((unint64_t)v5 >= *((void *)a2 + 2) || *v5 < 0)
      {
        unint64_t TagFallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(a2);
        *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = TagFallback;
        if (!TagFallback) {
          return 1;
        }
      }
      else
      {
        unint64_t TagFallback = *v5;
        *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = TagFallback;
        *((void *)a2 + 1) = v5 + 1;
        if (!TagFallback) {
          return 1;
        }
      }
      int v7 = TagFallback & 7;
      if ((TagFallback & 0xFFFFFFF8) == 8) {
        break;
      }
LABEL_10:
      if (v7 == 4) {
        return 1;
      }
      if ((wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipField(a2, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)TagFallback) & 1) == 0)return 0; {
    }
      }
    if ((TagFallback & 7) != 0) {
      break;
    }
    int v9 = (char *)*((void *)a2 + 1);
    int v8 = (char *)*((void *)a2 + 2);
    while (1)
    {
      unsigned int v15 = 0;
      if (v9 >= v8 || *v9 < 0)
      {
        uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v15);
        if (!result) {
          return result;
        }
        unsigned int v10 = v15;
      }
      else
      {
        unsigned int v10 = *v9;
        *((void *)a2 + 1) = v9 + 1;
      }
      if (v10 - 1 <= 3)
      {
        int v11 = *((_DWORD *)this + 4);
        if (v11 == *((_DWORD *)this + 5))
        {
          sub_1D3E4D664((uint64_t)v4, v11 + 1);
          int v11 = *((_DWORD *)this + 4);
        }
        uint64_t v12 = *((void *)this + 1);
        *((_DWORD *)this + 4) = v11 + 1;
        *(_DWORD *)(v12 + 4 * v11) = v10;
      }
LABEL_25:
      unint64_t v13 = (char *)*((void *)a2 + 1);
      int v8 = (char *)*((void *)a2 + 2);
      if (v13 >= v8 || *v13 != 8) {
        break;
      }
      int v9 = v13 + 1;
      *((void *)a2 + 1) = v9;
    }
    if (v13 == v8 && (*((_DWORD *)a2 + 11) || *((_DWORD *)a2 + 6) == *((_DWORD *)a2 + 10)))
    {
      *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
      uint64_t result = 1;
      *((unsigned char *)a2 + 36) = 1;
      return result;
    }
  }
  if (v7 != 2) {
    goto LABEL_10;
  }
  uint64_t result = wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadPackedEnumNoInline();
  if (result) {
    goto LABEL_25;
  }
  return result;
}

uint64_t awd::profile::TaskingCriteria::SerializeWithCachedSizes(uint64_t this, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  if (*(int *)(this + 16) >= 1)
  {
    uint64_t v5 = this;
    uint64_t v6 = 0;
    do
      this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteEnum((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)1, *(unsigned int *)(*(void *)(v5 + 8) + 4 * v6++), (uint64_t)a2, a4);
    while (v6 < *(int *)(v5 + 16));
  }
  return this;
}

uint64_t awd::profile::TaskingCriteria::ByteSize(awd::profile::TaskingCriteria *this)
{
  int v2 = *((_DWORD *)this + 4);
  if (v2 < 1)
  {
    int v4 = 0;
  }
  else
  {
    uint64_t v3 = 0;
    int v4 = 0;
    do
    {
      uint64_t v5 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*(unsigned int *)(*((void *)this + 1)
                                                                                            + 4 * v3);
      if ((v5 & 0x80000000) != 0)
      {
        int v6 = 10;
      }
      else if (v5 >= 0x80)
      {
        int v6 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v5);
        int v2 = *((_DWORD *)this + 4);
      }
      else
      {
        int v6 = 1;
      }
      v4 += v6;
      ++v3;
    }
    while (v3 < v2);
  }
  uint64_t result = (v2 + v4);
  *((_DWORD *)this + 6) = result;
  return result;
}

void awd::profile::TaskingCriteria::CopyFrom(awd::profile::TaskingCriteria *this, const awd::profile::TaskingCriteria *a2)
{
  if (a2 != this)
  {
    (*(void (**)(awd::profile::TaskingCriteria *))(*(void *)this + 32))(this);
    awd::profile::TaskingCriteria::MergeFrom(this, a2);
  }
}

uint64_t awd::profile::TaskingCriteria::IsInitialized(awd::profile::TaskingCriteria *this)
{
  return 1;
}

double awd::profile::TaskingCriteria::Swap(awd::profile::TaskingCriteria *this, awd::profile::TaskingCriteria *a2)
{
  if (a2 != this)
  {
    uint64_t v2 = *((void *)this + 1);
    *((void *)this + 1) = *((void *)a2 + 1);
    double result = *((double *)a2 + 2);
    *((void *)a2 + 1) = v2;
    uint64_t v4 = *((void *)this + 2);
    *((double *)this + 2) = result;
    *((void *)a2 + 2) = v4;
    LODWORD(v2) = *((_DWORD *)this + 7);
    *((_DWORD *)this + 7) = *((_DWORD *)a2 + 7);
    *((_DWORD *)a2 + 7) = v2;
    LODWORD(v2) = *((_DWORD *)this + 6);
    *((_DWORD *)this + 6) = *((_DWORD *)a2 + 6);
    *((_DWORD *)a2 + 6) = v2;
  }
  return result;
}

void *awd::profile::TaskingCriteria::GetTypeName@<X0>(void *a1@<X8>)
{
  return sub_1D3E270D0(a1, "awd.profile.TaskingCriteria");
}

BOOL awd::profile::DeviceConfiguration_ConfigType_IsValid(awd::profile *this)
{
  return this < 4;
}

uint64_t awd::profile::DeviceConfiguration::SharedCtor(uint64_t this)
{
  *(_DWORD *)(this + 32) = 0;
  *(unsigned char *)(this + 36) = 0;
  *(void *)(this + 200) = 0;
  *(void *)(this + 64) = MEMORY[0x1E4FBA920];
  *(void *)(this + 144) = 0;
  *(_DWORD *)(this + 20MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  return this;
}

awd::profile::DeviceConfiguration *awd::profile::DeviceConfiguration::DeviceConfiguration(awd::profile::DeviceConfiguration *this, const awd::profile::DeviceConfiguration *a2)
{
  *((void *)this + 1) = 0;
  *(void *)this = &unk_1F2B9B3B0;
  *((void *)this + 2) = 0;
  *((_DWORD *)this + 6) = 0;
  *((void *)this + 5) = 0;
  *((void *)this + 6) = 0;
  *((_DWORD *)this + 14) = 0;
  *((void *)this + 9) = 0;
  *((void *)this + 10) = 0;
  *((_DWORD *)this + 22) = 0;
  *((void *)this + 12) = 0;
  *((void *)this + 13) = 0;
  *((_DWORD *)this + 2MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  *((void *)this + 15) = 0;
  *((void *)this + 16) = 0;
  *((_DWORD *)this + 34) = 0;
  *((void *)this + 19) = 0;
  *((_DWORD *)this + 42) = 0;
  *((void *)this + 22) = 0;
  *((void *)this + 20) = 0;
  *((void *)this + 23) = 0;
  *((_DWORD *)this + 4MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  *((_DWORD *)this + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  *((unsigned char *)this + 36) = 0;
  *((void *)this + 25) = 0;
  *((void *)this + MEMORY[0x1D9440F90]((char *)this + 8) = MEMORY[0x1E4FBA920];
  *((void *)this + 1MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  *((_DWORD *)this + 52) = 0;
  awd::profile::DeviceConfiguration::MergeFrom(this, a2);
  return this;
}

void sub_1D3E4B500(_Unwind_Exception *a1)
{
  int v9 = v6;
  sub_1D3E4D870(v9);
  sub_1D3E4D870(v8);
  sub_1D3E4D870(v7);
  sub_1D3E4D870(v5);
  sub_1D3E4D870(v4);
  sub_1D3E4D870(v3);
  sub_1D3E4D870(v2);
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(v1);
  _Unwind_Resume(a1);
}

void awd::profile::DeviceConfiguration::MergeFrom(awd::profile::DeviceConfiguration *this, const awd::profile::DeviceConfiguration *a2)
{
  if (a2 == this)
  {
    wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
    wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
    wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
    wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)v42);
  }
  wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((awd::profile::DeviceConfiguration *)((char *)this + 8));
  if (*((int *)a2 + 4) >= 1)
  {
    uint64_t v4 = 0;
    do
    {
      uint64_t v5 = *(const awd::profile::ComponentConfiguration **)(*((void *)a2 + 1) + 8 * v4);
      int v6 = *((_DWORD *)this + 5);
      uint64_t v7 = *((int *)this + 4);
      if ((int)v7 >= v6)
      {
        if (v6 == *((_DWORD *)this + 6))
        {
          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((awd::profile::DeviceConfiguration *)((char *)this + 8));
          int v6 = *((_DWORD *)this + 5);
        }
        *((_DWORD *)this + 5) = v6 + 1;
        operator new();
      }
      uint64_t v8 = *((void *)this + 1);
      *((_DWORD *)this + 4) = v7 + 1;
      awd::profile::ComponentConfiguration::MergeFrom(*(awd::profile::ComponentConfiguration **)(v8 + 8 * v7), v5);
      ++v4;
    }
    while (v4 < *((int *)a2 + 4));
  }
  wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((awd::profile::DeviceConfiguration *)((char *)this + 40));
  if (*((int *)a2 + 12) >= 1)
  {
    uint64_t v9 = 0;
    do
    {
      unsigned int v10 = *(const awd::profile::TimerSpec **)(*((void *)a2 + 5) + 8 * v9);
      int v11 = *((_DWORD *)this + 13);
      uint64_t v12 = *((int *)this + 12);
      if ((int)v12 >= v11)
      {
        if (v11 == *((_DWORD *)this + 14))
        {
          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((awd::profile::DeviceConfiguration *)((char *)this + 40));
          int v11 = *((_DWORD *)this + 13);
        }
        *((_DWORD *)this + 13) = v11 + 1;
        operator new();
      }
      uint64_t v13 = *((void *)this + 5);
      *((_DWORD *)this + 12) = v12 + 1;
      awd::profile::TimerSpec::MergeFrom(*(awd::profile::TimerSpec **)(v13 + 8 * v12), v10);
      ++v9;
    }
    while (v9 < *((int *)a2 + 12));
  }
  sub_1D3E4DD1C((int *)this + 18, (uint64_t)a2 + 72);
  wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((awd::profile::DeviceConfiguration *)((char *)this + 96));
  if (*((int *)a2 + 26) >= 1)
  {
    uint64_t v14 = 0;
    do
    {
      unsigned int v15 = *(const awd::profile::TriggerSource **)(*((void *)a2 + 12) + 8 * v14);
      int v16 = *((_DWORD *)this + 27);
      uint64_t v17 = *((int *)this + 26);
      if ((int)v17 >= v16)
      {
        if (v16 == *((_DWORD *)this + 28))
        {
          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((awd::profile::DeviceConfiguration *)((char *)this + 96));
          int v16 = *((_DWORD *)this + 27);
        }
        *((_DWORD *)this + 27) = v16 + 1;
        operator new();
      }
      uint64_t v18 = *((void *)this + 12);
      *((_DWORD *)this + 26) = v17 + 1;
      awd::profile::TriggerSource::MergeFrom(*(awd::profile::TriggerSource **)(v18 + 8 * v17), v15);
      ++v14;
    }
    while (v14 < *((int *)a2 + 26));
  }
  wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((awd::profile::DeviceConfiguration *)((char *)this + 120));
  if (*((int *)a2 + 32) >= 1)
  {
    uint64_t v19 = 0;
    do
    {
      int v20 = *(const awd::profile::TriggerProcessingRule **)(*((void *)a2 + 15) + 8 * v19);
      int v21 = *((_DWORD *)this + 33);
      uint64_t v22 = *((int *)this + 32);
      if ((int)v22 >= v21)
      {
        if (v21 == *((_DWORD *)this + 34))
        {
          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((awd::profile::DeviceConfiguration *)((char *)this + 120));
          int v21 = *((_DWORD *)this + 33);
        }
        *((_DWORD *)this + 33) = v21 + 1;
        operator new();
      }
      uint64_t v23 = *((void *)this + 15);
      *((_DWORD *)this + 32) = v22 + 1;
      awd::profile::TriggerProcessingRule::MergeFrom(*(awd::profile::TriggerProcessingRule **)(v23 + 8 * v22), v20);
      ++v19;
    }
    while (v19 < *((int *)a2 + 32));
  }
  wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((awd::profile::DeviceConfiguration *)((char *)this + 152));
  if (*((int *)a2 + 40) >= 1)
  {
    uint64_t v24 = 0;
    do
    {
      unsigned int v25 = *(const awd::profile::AggregationSpec **)(*((void *)a2 + 19) + 8 * v24);
      int v26 = *((_DWORD *)this + 41);
      uint64_t v27 = *((int *)this + 40);
      if ((int)v27 >= v26)
      {
        if (v26 == *((_DWORD *)this + 42))
        {
          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((awd::profile::DeviceConfiguration *)((char *)this + 152));
          int v26 = *((_DWORD *)this + 41);
        }
        *((_DWORD *)this + 41) = v26 + 1;
        operator new();
      }
      uint64_t v28 = *((void *)this + 19);
      *((_DWORD *)this + 40) = v27 + 1;
      awd::profile::AggregationSpec::MergeFrom(*(awd::profile::AggregationSpec **)(v28 + 8 * v27), v25);
      ++v24;
    }
    while (v24 < *((int *)a2 + 40));
  }
  wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((awd::profile::DeviceConfiguration *)((char *)this + 176));
  if (*((int *)a2 + 46) >= 1)
  {
    uint64_t v29 = 0;
    do
    {
      uint64_t v30 = *(const awd::profile::DeviceConfiguration **)(*((void *)a2 + 22) + 8 * v29);
      int v31 = *((_DWORD *)this + 47);
      uint64_t v32 = *((int *)this + 46);
      if ((int)v32 >= v31)
      {
        if (v31 == *((_DWORD *)this + 48))
        {
          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((awd::profile::DeviceConfiguration *)((char *)this + 176));
          int v31 = *((_DWORD *)this + 47);
        }
        *((_DWORD *)this + 47) = v31 + 1;
        sub_1D3E4D710();
      }
      uint64_t v33 = *((void *)this + 22);
      *((_DWORD *)this + 46) = v32 + 1;
      awd::profile::DeviceConfiguration::MergeFrom(*(awd::profile::DeviceConfiguration **)(v33 + 8 * v32), v30);
      ++v29;
    }
    while (v29 < *((int *)a2 + 46));
  }
  int v34 = *((_DWORD *)a2 + 52);
  if (!(_BYTE)v34) {
    goto LABEL_56;
  }
  if (v34)
  {
    int v35 = *((_DWORD *)a2 + 8);
    *((_DWORD *)this + 52) |= 1u;
    *((_DWORD *)this + MEMORY[0x1D9440F90]((char *)this + 8) = v35;
    int v34 = *((_DWORD *)a2 + 52);
    if ((v34 & 8) == 0)
    {
LABEL_54:
      if ((v34 & 0x10) == 0) {
        goto LABEL_55;
      }
      goto LABEL_60;
    }
  }
  else if ((v34 & 8) == 0)
  {
    goto LABEL_54;
  }
  char v36 = *((unsigned char *)a2 + 36);
  *((_DWORD *)this + 52) |= 8u;
  *((unsigned char *)this + 36) = v36;
  int v34 = *((_DWORD *)a2 + 52);
  if ((v34 & 0x10) != 0)
  {
LABEL_60:
    int v37 = *((_DWORD *)a2 + 50);
    *((_DWORD *)this + 52) |= 0x10u;
    *((_DWORD *)this + 50) = v37;
    int v34 = *((_DWORD *)a2 + 52);
    if ((v34 & 0x20) != 0) {
      goto LABEL_61;
    }
LABEL_56:
    if ((v34 & 0x200) == 0) {
      return;
    }
    goto LABEL_64;
  }
LABEL_55:
  if ((v34 & 0x20) == 0) {
    goto LABEL_56;
  }
LABEL_61:
  uint64_t v38 = (const std::string *)*((void *)a2 + 8);
  *((_DWORD *)this + 52) |= 0x20u;
  uint64_t v39 = (std::string *)*((void *)this + 8);
  if (v39 == (std::string *)MEMORY[0x1E4FBA920]) {
    operator new();
  }
  std::string::operator=(v39, v38);
  if ((*((_DWORD *)a2 + 52) & 0x200) != 0)
  {
LABEL_64:
    *((_DWORD *)this + 52) |= 0x200u;
    uint64_t v40 = (awd::profile::TaskingCriteria *)*((void *)this + 18);
    if (!v40) {
      operator new();
    }
    unsigned int v41 = (const awd::profile::TaskingCriteria *)*((void *)a2 + 18);
    if (!v41) {
      unsigned int v41 = *(const awd::profile::TaskingCriteria **)(awd::profile::DeviceConfiguration::default_instance_ + 144);
    }
    awd::profile::TaskingCriteria::MergeFrom(v40, v41);
  }
}

void sub_1D3E4BC84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage((wireless_diagnostics::google::protobuf::internal::LogMessage *)va);
  _Unwind_Resume(a1);
}

void awd::profile::DeviceConfiguration::~DeviceConfiguration(awd::profile::DeviceConfiguration *this)
{
  *(void *)this = &unk_1F2B9B3B0;
  uint64_t v2 = (uint64_t *)((char *)this + 176);
  awd::profile::DeviceConfiguration::SharedDtor(this);
  sub_1D3E4D870(v2);
  sub_1D3E4D870((uint64_t *)this + 19);
  sub_1D3E4D870((uint64_t *)this + 15);
  sub_1D3E4D870((uint64_t *)this + 12);
  sub_1D3E4D870((uint64_t *)this + 9);
  sub_1D3E4D870((uint64_t *)this + 5);
  sub_1D3E4D870((uint64_t *)this + 1);
  wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(this);
}

{
  uint64_t vars8;

  awd::profile::DeviceConfiguration::~DeviceConfiguration(this);
  JUMPOUT(0x1D94412F0);
}

void *awd::profile::DeviceConfiguration::SharedDtor(void *this)
{
  char v1 = this;
  uint64_t v2 = this[8];
  if (v2 != MEMORY[0x1E4FBA920] && v2 != 0)
  {
    if (*(char *)(v2 + 23) < 0) {
      operator delete(*(void **)v2);
    }
    this = (void *)MEMORY[0x1D94412F0](v2, 0x1012C40EC159624);
  }
  if ((void *)awd::profile::DeviceConfiguration::default_instance_ != v1)
  {
    this = (void *)v1[18];
    if (this)
    {
      uint64_t v4 = *(uint64_t (**)(void))(*this + 8);
      return (void *)v4();
    }
  }
  return this;
}

uint64_t awd::profile::DeviceConfiguration::SetCachedSize(uint64_t this, int a2)
{
  *(_DWORD *)(this + 204) = a2;
  return this;
}

uint64_t awd::profile::DeviceConfiguration::default_instance(awd::profile::DeviceConfiguration *this, uint64_t a2, uint64_t a3, const char *a4)
{
  uint64_t result = awd::profile::DeviceConfiguration::default_instance_;
  if (!awd::profile::DeviceConfiguration::default_instance_)
  {
    awd::profile::protobuf_AddDesc_AwdProfile_2eproto(0, a2, a3, a4);
    return awd::profile::DeviceConfiguration::default_instance_;
  }
  return result;
}

void awd::profile::DeviceConfiguration::New(awd::profile::DeviceConfiguration *this)
{
}

uint64_t awd::profile::DeviceConfiguration::Clear(awd::profile::DeviceConfiguration *this)
{
  char v2 = *((unsigned char *)this + 208);
  if (v2)
  {
    *((_DWORD *)this + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
    *((unsigned char *)this + 36) = 0;
    *((_DWORD *)this + 50) = 0;
    if ((v2 & 0x20) != 0)
    {
      uint64_t v3 = *((void *)this + 8);
      if (v3 != MEMORY[0x1E4FBA920])
      {
        if (*(char *)(v3 + 23) < 0)
        {
          **(unsigned char **)uint64_t v3 = 0;
          *(void *)(v3 + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
        }
        else
        {
          *(unsigned char *)uint64_t v3 = 0;
          *(unsigned char *)(v3 + 23) = 0;
        }
      }
    }
  }
  if ((*((unsigned char *)this + 209) & 2) != 0)
  {
    uint64_t v4 = *((void *)this + 18);
    if (v4)
    {
      *(_DWORD *)(v4 + 16) = 0;
      *(_DWORD *)(v4 + 2MEMORY[0x1D9440F90]((char *)this + 8) = 0;
    }
  }
  sub_1D3E4D7B0((uint64_t)this + 8);
  sub_1D3E4D7B0((uint64_t)this + 40);
  sub_1D3E4D7B0((uint64_t)this + 72);
  sub_1D3E4D7B0((uint64_t)this + 96);
  sub_1D3E4D7B0((uint64_t)this + 120);
  sub_1D3E4D7B0((uint64_t)this + 152);
  uint64_t result = sub_1D3E4D7B0((uint64_t)this + 176);
  *((_DWORD *)this + 52) = 0;
  return result;
}

uint64_t awd::profile::DeviceConfiguration::MergePartialFromCodedStream(awd::profile::DeviceConfiguration *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2)
{
  v106 = (awd::profile::DeviceConfiguration *)((char *)this + 8);
  uint64_t v4 = (awd::profile::DeviceConfiguration *)((char *)this + 40);
  uint64_t v5 = (awd::profile::DeviceConfiguration *)((char *)this + 72);
  int v6 = (awd::profile::DeviceConfiguration *)((char *)this + 96);
  uint64_t v7 = (awd::profile::DeviceConfiguration *)((char *)this + 120);
  uint64_t v8 = (awd::profile::DeviceConfiguration *)((char *)this + 152);
  uint64_t v9 = (awd::profile::DeviceConfiguration *)((char *)this + 176);
  while (1)
  {
LABEL_2:
    unsigned int v10 = (char *)*((void *)a2 + 1);
    if ((unint64_t)v10 < *((void *)a2 + 2) && (*v10 & 0x80000000) == 0)
    {
      unint64_t TagFallback = *v10;
      *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = TagFallback;
      *((void *)a2 + 1) = v10 + 1;
      if (!TagFallback) {
        return 1;
      }
      goto LABEL_7;
    }
    unint64_t TagFallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(a2);
    *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = TagFallback;
    if (!TagFallback) {
      return 1;
    }
LABEL_7:
    switch(TagFallback >> 3)
    {
      case 1u:
        int v12 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_34;
        }
        unsigned int v107 = 0;
        uint64_t v13 = (char *)*((void *)a2 + 1);
        unint64_t v14 = *((void *)a2 + 2);
        if ((unint64_t)v13 >= v14 || *v13 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v107);
          if (!result) {
            return result;
          }
          unsigned int v15 = v107;
          int v16 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v14 = *((void *)a2 + 2);
        }
        else
        {
          unsigned int v15 = *v13;
          int v16 = v13 + 1;
          *((void *)a2 + 1) = v16;
        }
        *((_DWORD *)this + MEMORY[0x1D9440F90]((char *)this + 8) = v15;
        *((_DWORD *)this + 52) |= 1u;
        if ((unint64_t)v16 >= v14 || *v16 != 18) {
          continue;
        }
        goto LABEL_41;
      case 2u:
        int v12 = TagFallback & 7;
        if (v12 != 2) {
          goto LABEL_34;
        }
LABEL_42:
        int v23 = *((_DWORD *)this + 5);
        uint64_t v24 = *((int *)this + 4);
        if ((int)v24 >= v23)
        {
          if (v23 == *((_DWORD *)this + 6))
          {
            wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v106);
            int v23 = *((_DWORD *)this + 5);
          }
          *((_DWORD *)this + 5) = v23 + 1;
          operator new();
        }
        uint64_t v25 = *((void *)this + 1);
        *((_DWORD *)this + 4) = v24 + 1;
        int v26 = *(awd::profile::ComponentConfiguration **)(v25 + 8 * v24);
        unsigned int v107 = 0;
        uint64_t v27 = (char *)*((void *)a2 + 1);
        if ((unint64_t)v27 >= *((void *)a2 + 2) || *v27 < 0)
        {
          if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v107))return 0; {
        }
          }
        else
        {
          unsigned int v107 = *v27;
          *((void *)a2 + 1) = v27 + 1;
        }
        int v28 = *((_DWORD *)a2 + 14);
        int v29 = *((_DWORD *)a2 + 15);
        *((_DWORD *)a2 + 14) = v28 + 1;
        if (v28 >= v29) {
          return 0;
        }
        wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(a2);
        if (!awd::profile::ComponentConfiguration::MergePartialFromCodedStream(v26, a2)
          || !*((unsigned char *)a2 + 36))
        {
          return 0;
        }
        wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(a2);
        int v30 = *((_DWORD *)a2 + 14);
        BOOL v31 = __OFSUB__(v30, 1);
        int v32 = v30 - 1;
        if (v32 < 0 == v31) {
          *((_DWORD *)a2 + 14) = v32;
        }
        int v16 = (unsigned char *)*((void *)a2 + 1);
        if ((unint64_t)v16 >= *((void *)a2 + 2)) {
          continue;
        }
        int v33 = *v16;
        if (v33 == 18)
        {
LABEL_41:
          *((void *)a2 + 1) = v16 + 1;
          goto LABEL_42;
        }
        if (v33 != 26) {
          continue;
        }
        do
        {
          *((void *)a2 + 1) = v16 + 1;
LABEL_60:
          int v34 = *((_DWORD *)this + 13);
          uint64_t v35 = *((int *)this + 12);
          if ((int)v35 >= v34)
          {
            if (v34 == *((_DWORD *)this + 14))
            {
              wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v4);
              int v34 = *((_DWORD *)this + 13);
            }
            *((_DWORD *)this + 13) = v34 + 1;
            operator new();
          }
          uint64_t v36 = *((void *)this + 5);
          *((_DWORD *)this + 12) = v35 + 1;
          int v37 = *(awd::profile::TimerSpec **)(v36 + 8 * v35);
          unsigned int v107 = 0;
          uint64_t v38 = (char *)*((void *)a2 + 1);
          if ((unint64_t)v38 >= *((void *)a2 + 2) || *v38 < 0)
          {
            if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v107))return 0; {
          }
            }
          else
          {
            unsigned int v107 = *v38;
            *((void *)a2 + 1) = v38 + 1;
          }
          int v39 = *((_DWORD *)a2 + 14);
          int v40 = *((_DWORD *)a2 + 15);
          *((_DWORD *)a2 + 14) = v39 + 1;
          if (v39 >= v40) {
            return 0;
          }
          wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(a2);
          if (!awd::profile::TimerSpec::MergePartialFromCodedStream(v37, a2) || !*((unsigned char *)a2 + 36)) {
            return 0;
          }
          wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(a2);
          int v41 = *((_DWORD *)a2 + 14);
          BOOL v31 = __OFSUB__(v41, 1);
          int v42 = v41 - 1;
          if (v42 < 0 == v31) {
            *((_DWORD *)a2 + 14) = v42;
          }
          int v16 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v18 = *((void *)a2 + 2);
          if ((unint64_t)v16 >= v18) {
            goto LABEL_2;
          }
          int v43 = *v16;
        }
        while (v43 == 26);
        if (v43 != 32) {
          continue;
        }
        uint64_t v17 = v16 + 1;
        *((void *)a2 + 1) = v17;
LABEL_78:
        unsigned int v107 = 0;
        if ((unint64_t)v17 >= v18 || *v17 < 0)
        {
          uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v107);
          if (!result) {
            return result;
          }
          unsigned int v44 = v107;
          int v45 = (unsigned char *)*((void *)a2 + 1);
          unint64_t v18 = *((void *)a2 + 2);
        }
        else
        {
          unsigned int v44 = *v17;
          int v45 = v17 + 1;
          *((void *)a2 + 1) = v45;
        }
        *((unsigned char *)this + 36) = v44 != 0;
        int v19 = *((_DWORD *)this + 52) | 8;
        *((_DWORD *)this + 52) = v19;
        if ((unint64_t)v45 >= v18 || *v45 != 42) {
          continue;
        }
        *((void *)a2 + 1) = v45 + 1;
LABEL_86:
        *((_DWORD *)this + 52) = v19 | 0x20;
        if (*((void *)this + 8) == MEMORY[0x1E4FBA920]) {
          operator new();
        }
        uint64_t result = wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadString();
        if (!result) {
          return result;
        }
        int v46 = (unsigned char *)*((void *)a2 + 1);
        if ((unint64_t)v46 >= *((void *)a2 + 2) || *v46 != 50) {
          continue;
        }
        do
        {
          *((void *)a2 + 1) = v46 + 1;
LABEL_92:
          int v47 = *((_DWORD *)this + 21);
          uint64_t v48 = *((int *)this + 20);
          if ((int)v48 >= v47)
          {
            if (v47 == *((_DWORD *)this + 22))
            {
              wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v5);
              int v47 = *((_DWORD *)this + 21);
            }
            *((_DWORD *)this + 21) = v47 + 1;
            operator new();
          }
          uint64_t v49 = *((void *)this + 9);
          *((_DWORD *)this + 20) = v48 + 1;
          unint64_t v50 = *(awd::profile::MetricFileSpec **)(v49 + 8 * v48);
          unsigned int v107 = 0;
          int v51 = (char *)*((void *)a2 + 1);
          if ((unint64_t)v51 >= *((void *)a2 + 2) || *v51 < 0)
          {
            if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v107))return 0; {
          }
            }
          else
          {
            unsigned int v107 = *v51;
            *((void *)a2 + 1) = v51 + 1;
          }
          int v52 = *((_DWORD *)a2 + 14);
          int v53 = *((_DWORD *)a2 + 15);
          *((_DWORD *)a2 + 14) = v52 + 1;
          if (v52 >= v53) {
            return 0;
          }
          wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(a2);
          if (!awd::profile::MetricFileSpec::MergePartialFromCodedStream(v50, a2) || !*((unsigned char *)a2 + 36)) {
            return 0;
          }
          wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(a2);
          int v54 = *((_DWORD *)a2 + 14);
          BOOL v31 = __OFSUB__(v54, 1);
          int v55 = v54 - 1;
          if (v55 < 0 == v31) {
            *((_DWORD *)a2 + 14) = v55;
          }
          int v46 = (unsigned char *)*((void *)a2 + 1);
          if ((unint64_t)v46 >= *((void *)a2 + 2)) {
            goto LABEL_2;
          }
          int v56 = *v46;
        }
        while (v56 == 50);
        if (v56 != 58) {
          continue;
        }
        do
        {
          *((void *)a2 + 1) = v46 + 1;
LABEL_110:
          int v57 = *((_DWORD *)this + 27);
          uint64_t v58 = *((int *)this + 26);
          if ((int)v58 >= v57)
          {
            if (v57 == *((_DWORD *)this + 28))
            {
              wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v6);
              int v57 = *((_DWORD *)this + 27);
            }
            *((_DWORD *)this + 27) = v57 + 1;
            operator new();
          }
          uint64_t v59 = *((void *)this + 12);
          *((_DWORD *)this + 26) = v58 + 1;
          int v60 = *(awd::profile::TriggerSource **)(v59 + 8 * v58);
          unsigned int v107 = 0;
          int v61 = (char *)*((void *)a2 + 1);
          if ((unint64_t)v61 >= *((void *)a2 + 2) || *v61 < 0)
          {
            if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v107))return 0; {
          }
            }
          else
          {
            unsigned int v107 = *v61;
            *((void *)a2 + 1) = v61 + 1;
          }
          int v62 = *((_DWORD *)a2 + 14);
          int v63 = *((_DWORD *)a2 + 15);
          *((_DWORD *)a2 + 14) = v62 + 1;
          if (v62 >= v63) {
            return 0;
          }
          wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(a2);
          if (!awd::profile::TriggerSource::MergePartialFromCodedStream(v60, a2) || !*((unsigned char *)a2 + 36)) {
            return 0;
          }
          wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(a2);
          int v64 = *((_DWORD *)a2 + 14);
          BOOL v31 = __OFSUB__(v64, 1);
          int v65 = v64 - 1;
          if (v65 < 0 == v31) {
            *((_DWORD *)a2 + 14) = v65;
          }
          int v46 = (unsigned char *)*((void *)a2 + 1);
          if ((unint64_t)v46 >= *((void *)a2 + 2)) {
            goto LABEL_2;
          }
          int v66 = *v46;
        }
        while (v66 == 58);
        if (v66 != 66) {
          continue;
        }
        do
        {
          *((void *)a2 + 1) = v46 + 1;
LABEL_128:
          int v67 = *((_DWORD *)this + 33);
          uint64_t v68 = *((int *)this + 32);
          if ((int)v68 >= v67)
          {
            if (v67 == *((_DWORD *)this + 34))
            {
              wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v7);
              int v67 = *((_DWORD *)this + 33);
            }
            *((_DWORD *)this + 33) = v67 + 1;
            operator new();
          }
          uint64_t v69 = *((void *)this + 15);
          *((_DWORD *)this + 32) = v68 + 1;
          uint64_t v70 = *(awd::profile::TriggerProcessingRule **)(v69 + 8 * v68);
          unsigned int v107 = 0;
          uint64_t v71 = (char *)*((void *)a2 + 1);
          if ((unint64_t)v71 >= *((void *)a2 + 2) || *v71 < 0)
          {
            if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v107))return 0; {
          }
            }
          else
          {
            unsigned int v107 = *v71;
            *((void *)a2 + 1) = v71 + 1;
          }
          int v72 = *((_DWORD *)a2 + 14);
          int v73 = *((_DWORD *)a2 + 15);
          *((_DWORD *)a2 + 14) = v72 + 1;
          if (v72 >= v73) {
            return 0;
          }
          wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(a2);
          if (!awd::profile::TriggerProcessingRule::MergePartialFromCodedStream(v70, a2)
            || !*((unsigned char *)a2 + 36))
          {
            return 0;
          }
          wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(a2);
          int v74 = *((_DWORD *)a2 + 14);
          BOOL v31 = __OFSUB__(v74, 1);
          int v75 = v74 - 1;
          if (v75 < 0 == v31) {
            *((_DWORD *)a2 + 14) = v75;
          }
          int v46 = (unsigned char *)*((void *)a2 + 1);
          if ((unint64_t)v46 >= *((void *)a2 + 2)) {
            goto LABEL_2;
          }
          int v76 = *v46;
        }
        while (v76 == 66);
        if (v76 != 74) {
          continue;
        }
        *((void *)a2 + 1) = v46 + 1;
LABEL_146:
        *((_DWORD *)this + 52) |= 0x200u;
        unsigned int v77 = (awd::profile::TaskingCriteria *)*((void *)this + 18);
        if (!v77) {
          operator new();
        }
        unsigned int v107 = 0;
        CFDictionaryRef v78 = (char *)*((void *)a2 + 1);
        if ((unint64_t)v78 >= *((void *)a2 + 2) || *v78 < 0)
        {
          if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v107))return 0; {
        }
          }
        else
        {
          unsigned int v107 = *v78;
          *((void *)a2 + 1) = v78 + 1;
        }
        int v79 = *((_DWORD *)a2 + 14);
        int v80 = *((_DWORD *)a2 + 15);
        *((_DWORD *)a2 + 14) = v79 + 1;
        if (v79 >= v80) {
          return 0;
        }
        wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(a2);
        if (!awd::profile::TaskingCriteria::MergePartialFromCodedStream(v77, a2) || !*((unsigned char *)a2 + 36)) {
          return 0;
        }
        wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(a2);
        int v81 = *((_DWORD *)a2 + 14);
        BOOL v31 = __OFSUB__(v81, 1);
        int v82 = v81 - 1;
        if (v82 < 0 == v31) {
          *((_DWORD *)a2 + 14) = v82;
        }
        uint64_t v83 = (unsigned char *)*((void *)a2 + 1);
        unint64_t v20 = *((void *)a2 + 2);
        if ((unint64_t)v83 < v20 && *v83 == 80)
        {
          int v21 = v83 + 1;
          *((void *)a2 + 1) = v21;
LABEL_160:
          unsigned int v107 = 0;
          if ((unint64_t)v21 >= v20 || *v21 < 0)
          {
            uint64_t result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v107);
            if (!result) {
              return result;
            }
            unsigned int v84 = v107;
          }
          else
          {
            unsigned int v84 = *v21;
            *((void *)a2 + 1) = v21 + 1;
          }
          if (v84 <= 3)
          {
            *((_DWORD *)this + 52) |= 0x10u;
            *((_DWORD *)this + 50) = v84;
          }
          v85 = (unsigned __int8 *)*((void *)a2 + 1);
          if ((unint64_t)v85 < *((void *)a2 + 2) && *v85 == 90)
          {
            do
            {
              *((void *)a2 + 1) = v85 + 1;
LABEL_170:
              int v86 = *((_DWORD *)this + 41);
              uint64_t v87 = *((int *)this + 40);
              if ((int)v87 >= v86)
              {
                if (v86 == *((_DWORD *)this + 42))
                {
                  wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v8);
                  int v86 = *((_DWORD *)this + 41);
                }
                *((_DWORD *)this + 41) = v86 + 1;
                operator new();
              }
              uint64_t v88 = *((void *)this + 19);
              *((_DWORD *)this + 40) = v87 + 1;
              v89 = *(awd::profile::AggregationSpec **)(v88 + 8 * v87);
              unsigned int v107 = 0;
              v90 = (char *)*((void *)a2 + 1);
              if ((unint64_t)v90 >= *((void *)a2 + 2) || *v90 < 0)
              {
                if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v107))return 0; {
              }
                }
              else
              {
                unsigned int v107 = *v90;
                *((void *)a2 + 1) = v90 + 1;
              }
              int v91 = *((_DWORD *)a2 + 14);
              int v92 = *((_DWORD *)a2 + 15);
              *((_DWORD *)a2 + 14) = v91 + 1;
              if (v91 >= v92) {
                return 0;
              }
              wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(a2);
              if (!awd::profile::AggregationSpec::MergePartialFromCodedStream(v89, a2)
                || !*((unsigned char *)a2 + 36))
              {
                return 0;
              }
              wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(a2);
              int v93 = *((_DWORD *)a2 + 14);
              BOOL v31 = __OFSUB__(v93, 1);
              int v94 = v93 - 1;
              if (v94 < 0 == v31) {
                *((_DWORD *)a2 + 14) = v94;
              }
              v85 = (unsigned __int8 *)*((void *)a2 + 1);
              unint64_t v95 = *((void *)a2 + 2);
            }
            while ((unint64_t)v85 < v95 && *v85 == 90);
            if ((int)v95 - (int)v85 >= 2 && *v85 == 130 && v85[1] == 1)
            {
              do
              {
                *((void *)a2 + 1) = v85 + 2;
LABEL_190:
                int v96 = *((_DWORD *)this + 47);
                uint64_t v97 = *((int *)this + 46);
                if ((int)v97 >= v96)
                {
                  if (v96 == *((_DWORD *)this + 48))
                  {
                    wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v9);
                    int v96 = *((_DWORD *)this + 47);
                  }
                  *((_DWORD *)this + 47) = v96 + 1;
                  sub_1D3E4D710();
                }
                uint64_t v98 = *((void *)this + 22);
                *((_DWORD *)this + 46) = v97 + 1;
                v99 = *(awd::profile::DeviceConfiguration **)(v98 + 8 * v97);
                unsigned int v107 = 0;
                v100 = (char *)*((void *)a2 + 1);
                if ((unint64_t)v100 >= *((void *)a2 + 2) || *v100 < 0)
                {
                  if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a2, &v107))return 0; {
                }
                  }
                else
                {
                  unsigned int v107 = *v100;
                  *((void *)a2 + 1) = v100 + 1;
                }
                int v101 = *((_DWORD *)a2 + 14);
                int v102 = *((_DWORD *)a2 + 15);
                *((_DWORD *)a2 + 14) = v101 + 1;
                if (v101 >= v102) {
                  return 0;
                }
                wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(a2);
                if (!awd::profile::DeviceConfiguration::MergePartialFromCodedStream(v99, a2)
                  || !*((unsigned char *)a2 + 36))
                {
                  return 0;
                }
                wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(a2);
                int v103 = *((_DWORD *)a2 + 14);
                BOOL v31 = __OFSUB__(v103, 1);
                int v104 = v103 - 1;
                if (v104 < 0 == v31) {
                  *((_DWORD *)a2 + 14) = v104;
                }
                v85 = (unsigned __int8 *)*((void *)a2 + 1);
                v105 = (unsigned __int8 *)*((void *)a2 + 2);
              }
              while ((int)v105 - (int)v85 > 1 && *v85 == 130 && v85[1] == 1);
              if (v85 == v105 && (*((_DWORD *)a2 + 11) || *((_DWORD *)a2 + 6) == *((_DWORD *)a2 + 10)))
              {
                *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
                uint64_t result = 1;
                *((unsigned char *)a2 + 36) = 1;
                return result;
              }
            }
          }
        }
        break;
      case 3u:
        int v12 = TagFallback & 7;
        if (v12 == 2) {
          goto LABEL_60;
        }
        goto LABEL_34;
      case 4u:
        int v12 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_34;
        }
        uint64_t v17 = (char *)*((void *)a2 + 1);
        unint64_t v18 = *((void *)a2 + 2);
        goto LABEL_78;
      case 5u:
        int v12 = TagFallback & 7;
        if (v12 != 2) {
          goto LABEL_34;
        }
        int v19 = *((_DWORD *)this + 52);
        goto LABEL_86;
      case 6u:
        int v12 = TagFallback & 7;
        if (v12 == 2) {
          goto LABEL_92;
        }
        goto LABEL_34;
      case 7u:
        int v12 = TagFallback & 7;
        if (v12 == 2) {
          goto LABEL_110;
        }
        goto LABEL_34;
      case 8u:
        int v12 = TagFallback & 7;
        if (v12 == 2) {
          goto LABEL_128;
        }
        goto LABEL_34;
      case 9u:
        int v12 = TagFallback & 7;
        if (v12 == 2) {
          goto LABEL_146;
        }
        goto LABEL_34;
      case 0xAu:
        int v12 = TagFallback & 7;
        if ((TagFallback & 7) != 0) {
          goto LABEL_34;
        }
        int v21 = (char *)*((void *)a2 + 1);
        unint64_t v20 = *((void *)a2 + 2);
        goto LABEL_160;
      case 0xBu:
        int v12 = TagFallback & 7;
        if (v12 == 2) {
          goto LABEL_170;
        }
        goto LABEL_34;
      case 0x10u:
        int v12 = TagFallback & 7;
        if (v12 != 2) {
          goto LABEL_34;
        }
        goto LABEL_190;
      default:
        int v12 = TagFallback & 7;
LABEL_34:
        if (v12 == 4) {
          return 1;
        }
        if ((wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipField(a2, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)TagFallback) & 1) == 0)return 0; {
        continue;
        }
    }
  }
}

uint64_t awd::profile::DeviceConfiguration::SerializeWithCachedSizes(uint64_t this, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  uint64_t v5 = this;
  if (*(unsigned char *)(this + 208)) {
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt32((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)1, *(unsigned int *)(this + 32), (uint64_t)a2, a4);
  }
  if (*(int *)(v5 + 16) >= 1)
  {
    uint64_t v6 = 0;
    do
      this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)2, *(void *)(*(void *)(v5 + 8) + 8 * v6++), a2, a4);
    while (v6 < *(int *)(v5 + 16));
  }
  if (*(int *)(v5 + 48) >= 1)
  {
    uint64_t v7 = 0;
    do
      this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)3, *(void *)(*(void *)(v5 + 40) + 8 * v7++), a2, a4);
    while (v7 < *(int *)(v5 + 48));
  }
  int v8 = *(_DWORD *)(v5 + 208);
  if ((v8 & 8) != 0)
  {
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBool((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)4, *(unsigned __int8 *)(v5 + 36), (uint64_t)a2, a4);
    int v8 = *(_DWORD *)(v5 + 208);
  }
  if ((v8 & 0x20) != 0) {
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteString();
  }
  if (*(int *)(v5 + 80) >= 1)
  {
    uint64_t v9 = 0;
    do
      this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)6, *(void *)(*(void *)(v5 + 72) + 8 * v9++), a2, a4);
    while (v9 < *(int *)(v5 + 80));
  }
  if (*(int *)(v5 + 104) >= 1)
  {
    uint64_t v10 = 0;
    do
      this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)7, *(void *)(*(void *)(v5 + 96) + 8 * v10++), a2, a4);
    while (v10 < *(int *)(v5 + 104));
  }
  if (*(int *)(v5 + 128) >= 1)
  {
    uint64_t v11 = 0;
    do
      this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)8, *(void *)(*(void *)(v5 + 120) + 8 * v11++), a2, a4);
    while (v11 < *(int *)(v5 + 128));
  }
  int v12 = *(_DWORD *)(v5 + 208);
  if ((v12 & 0x200) != 0)
  {
    uint64_t v13 = *(void *)(v5 + 144);
    if (!v13) {
      uint64_t v13 = *(void *)(awd::profile::DeviceConfiguration::default_instance_ + 144);
    }
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)9, v13, a2, a4);
    int v12 = *(_DWORD *)(v5 + 208);
  }
  if ((v12 & 0x10) != 0) {
    this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteEnum((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)0xA, *(unsigned int *)(v5 + 200), (uint64_t)a2, a4);
  }
  if (*(int *)(v5 + 160) >= 1)
  {
    uint64_t v14 = 0;
    do
      this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)0xB, *(void *)(*(void *)(v5 + 152) + 8 * v14++), a2, a4);
    while (v14 < *(int *)(v5 + 160));
  }
  if (*(int *)(v5 + 184) >= 1)
  {
    uint64_t v15 = 0;
    do
      this = wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage((wireless_diagnostics::google::protobuf::internal::WireFormatLite *)0x10, *(void *)(*(void *)(v5 + 176) + 8 * v15++), a2, a4);
    while (v15 < *(int *)(v5 + 184));
  }
  return this;
}

uint64_t awd::profile::DeviceConfiguration::ByteSize(awd::profile::DeviceConfiguration *this)
{
  int v2 = *((_DWORD *)this + 52);
  if (!(_BYTE)v2)
  {
    int v4 = 0;
    if ((v2 & 0x200) == 0) {
      goto LABEL_40;
    }
    goto LABEL_34;
  }
  if (v2)
  {
    uint64_t v5 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 8);
    if ((v5 & 0x80000000) != 0)
    {
      int v6 = 10;
    }
    else if (v5 >= 0x80)
    {
      int v6 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v5);
      int v2 = *((_DWORD *)this + 52);
    }
    else
    {
      int v6 = 1;
    }
    int v3 = v6 + 1;
  }
  else
  {
    int v3 = 0;
  }
  if ((v2 & 8) != 0) {
    int v4 = v3 + 2;
  }
  else {
    int v4 = v3;
  }
  if ((v2 & 0x10) != 0)
  {
    uint64_t v7 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)*((unsigned int *)this + 50);
    if ((v7 & 0x80000000) != 0)
    {
      int v8 = 10;
    }
    else if (v7 >= 0x80)
    {
      int v8 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v7);
      int v2 = *((_DWORD *)this + 52);
    }
    else
    {
      int v8 = 1;
    }
    v4 += v8 + 1;
    if ((v2 & 0x20) == 0)
    {
LABEL_17:
      if ((v2 & 0x200) == 0) {
        goto LABEL_40;
      }
      goto LABEL_34;
    }
  }
  else if ((v2 & 0x20) == 0)
  {
    goto LABEL_17;
  }
  uint64_t v9 = *((void *)this + 8);
  int v10 = *(unsigned __int8 *)(v9 + 23);
  char v11 = v10;
  uint64_t v12 = *(void *)(v9 + 8);
  if ((v10 & 0x80u) == 0) {
    unint64_t v13 = *(unsigned __int8 *)(v9 + 23);
  }
  else {
    unint64_t v13 = v12;
  }
  if (v13 >= 0x80)
  {
    int v14 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback((wireless_diagnostics::google::protobuf::io::CodedOutputStream *)v13);
    int v10 = *(unsigned __int8 *)(v9 + 23);
    uint64_t v12 = *(void *)(v9 + 8);
    int v2 = *((_DWORD *)this + 52);
    char v11 = *(unsigned char *)(v9 + 23);
  }
  else
  {
    int v14 = 1;
  }
  if (v11 < 0) {
    int v10 = v12;
  }
  v4 += v14 + v10 + 1;
  if ((v2 & 0x200) != 0)
  {
LABEL_34:
    uint64_t v15 = (awd::profile::TaskingCriteria *)*((void *)this + 18);
    if (!v15) {
      uint64_t v15 = *(awd::profile::TaskingCriteria **)(awd::profile::DeviceConfiguration::default_instance_ + 144);
    }
    int v16 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)awd::profile::TaskingCriteria::ByteSize(v15);
    int v17 = (int)v16;
    if (v16 >= 0x80) {
      int v18 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v16);
    }
    else {
      int v18 = 1;
    }
    v4 += v17 + v18 + 1;
  }
LABEL_40:
  int v19 = *((_DWORD *)this + 4);
  int v20 = v19 + v4;
  if (v19 >= 1)
  {
    uint64_t v21 = 0;
    do
    {
      uint64_t v22 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)awd::profile::ComponentConfiguration::ByteSize(*(awd::profile::ComponentConfiguration **)(*((void *)this + 1) + 8 * v21));
      int v23 = (int)v22;
      if (v22 >= 0x80) {
        int v24 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v22);
      }
      else {
        int v24 = 1;
      }
      v20 += v23 + v24;
      ++v21;
    }
    while (v21 < *((int *)this + 4));
  }
  int v25 = *((_DWORD *)this + 12);
  int v26 = v25 + v20;
  if (v25 >= 1)
  {
    uint64_t v27 = 0;
    do
    {
      int v28 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)awd::profile::TimerSpec::ByteSize(*(wireless_diagnostics::google::protobuf::io::CodedOutputStream ***)(*((void *)this + 5) + 8 * v27));
      int v29 = (int)v28;
      if (v28 >= 0x80) {
        int v30 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v28);
      }
      else {
        int v30 = 1;
      }
      v26 += v29 + v30;
      ++v27;
    }
    while (v27 < *((int *)this + 12));
  }
  int v31 = *((_DWORD *)this + 20);
  int v32 = v31 + v26;
  if (v31 >= 1)
  {
    uint64_t v33 = 0;
    do
    {
      int v34 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)awd::profile::MetricFileSpec::ByteSize(*(awd::profile::MetricFileSpec **)(*((void *)this + 9) + 8 * v33));
      int v35 = (int)v34;
      if (v34 >= 0x80) {
        int v36 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v34);
      }
      else {
        int v36 = 1;
      }
      v32 += v35 + v36;
      ++v33;
    }
    while (v33 < *((int *)this + 20));
  }
  int v37 = *((_DWORD *)this + 26);
  int v38 = v37 + v32;
  if (v37 >= 1)
  {
    uint64_t v39 = 0;
    do
    {
      int v40 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)awd::profile::TriggerSource::ByteSize(*(awd::profile::TriggerSource **)(*((void *)this + 12) + 8 * v39));
      int v41 = (int)v40;
      if (v40 >= 0x80) {
        int v42 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v40);
      }
      else {
        int v42 = 1;
      }
      v38 += v41 + v42;
      ++v39;
    }
    while (v39 < *((int *)this + 26));
  }
  int v43 = *((_DWORD *)this + 32);
  int v44 = v43 + v38;
  if (v43 >= 1)
  {
    uint64_t v45 = 0;
    do
    {
      int v46 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)awd::profile::TriggerProcessingRule::ByteSize(*(awd::profile::TriggerProcessingRule **)(*((void *)this + 15) + 8 * v45));
      int v47 = (int)v46;
      if (v46 >= 0x80) {
        int v48 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v46);
      }
      else {
        int v48 = 1;
      }
      v44 += v47 + v48;
      ++v45;
    }
    while (v45 < *((int *)this + 32));
  }
  int v49 = *((_DWORD *)this + 40);
  int v50 = v49 + v44;
  if (v49 >= 1)
  {
    uint64_t v51 = 0;
    do
    {
      int v52 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)awd::profile::AggregationSpec::ByteSize(*(awd::profile::AggregationSpec **)(*((void *)this + 19) + 8 * v51));
      int v53 = (int)v52;
      if (v52 >= 0x80) {
        int v54 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v52);
      }
      else {
        int v54 = 1;
      }
      v50 += v53 + v54;
      ++v51;
    }
    while (v51 < *((int *)this + 40));
  }
  int v55 = *((_DWORD *)this + 46);
  uint64_t v56 = (v50 + 2 * v55);
  if (v55 >= 1)
  {
    uint64_t v57 = 0;
    do
    {
      uint64_t v58 = (wireless_diagnostics::google::protobuf::io::CodedOutputStream *)awd::profile::DeviceConfiguration::ByteSize(*(awd::profile::DeviceConfiguration **)(*((void *)this + 22) + 8 * v57));
      int v59 = (int)v58;
      if (v58 >= 0x80) {
        int v60 = wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(v58);
      }
      else {
        int v60 = 1;
      }
      uint64_t v56 = (v59 + v56 + v60);
      ++v57;
    }
    while (v57 < *((int *)this + 46));
  }
  *((_DWORD *)this + 51) = v56;
  return v56;
}

void awd::profile::DeviceConfiguration::CopyFrom(awd::profile::DeviceConfiguration *this, const awd::profile::DeviceConfiguration *a2)
{
  if (a2 != this)
  {
    (*(void (**)(awd::profile::DeviceConfiguration *))(*(void *)this + 32))(this);
    awd::profile::DeviceConfiguration::MergeFrom(this, a2);
  }
}

uint64_t awd::profile::DeviceConfiguration::IsInitialized(awd::profile::DeviceConfiguration *this)
{
  return 1;
}

awd::profile::DeviceConfiguration *awd::profile::DeviceConfiguration::Swap(awd::profile::DeviceConfiguration *this, awd::profile::DeviceConfiguration *a2)
{
  if (a2 != this)
  {
    int v3 = this;
    int v4 = *((_DWORD *)this + 8);
    *((_DWORD *)this + MEMORY[0x1D9440F90]((char *)this + 8) = *((_DWORD *)a2 + 8);
    *((_DWORD *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = v4;
    wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Swap();
    wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Swap();
    char v5 = *((unsigned char *)v3 + 36);
    *((unsigned char *)v3 + 36) = *((unsigned char *)a2 + 36);
    *((unsigned char *)a2 + 36) = v5;
    int v6 = *((_DWORD *)v3 + 50);
    *((_DWORD *)v3 + 50) = *((_DWORD *)a2 + 50);
    *((_DWORD *)a2 + 50) = v6;
    uint64_t v7 = *((void *)v3 + 8);
    *((void *)v3 + MEMORY[0x1D9440F90]((char *)this + 8) = *((void *)a2 + 8);
    *((void *)a2 + MEMORY[0x1D9440F90]((char *)this + 8) = v7;
    wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Swap();
    wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Swap();
    wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Swap();
    uint64_t v8 = *((void *)v3 + 18);
    *((void *)v3 + 1MEMORY[0x1D9440F90]((char *)this + 8) = *((void *)a2 + 18);
    *((void *)a2 + 1MEMORY[0x1D9440F90]((char *)this + 8) = v8;
    wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Swap();
    this = (awd::profile::DeviceConfiguration *)wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Swap();
    int v9 = *((_DWORD *)v3 + 52);
    *((_DWORD *)v3 + 52) = *((_DWORD *)a2 + 52);
    *((_DWORD *)a2 + 52) = v9;
    int v10 = *((_DWORD *)v3 + 51);
    *((_DWORD *)v3 + 51) = *((_DWORD *)a2 + 51);
    *((_DWORD *)a2 + 51) = v10;
  }
  return this;
}

void *awd::profile::DeviceConfiguration::GetTypeName@<X0>(void *a1@<X8>)
{
  return sub_1D3E270D0(a1, "awd.profile.DeviceConfiguration");
}

uint64_t sub_1D3E4D5CC(uint64_t a1)
{
  return *(unsigned int *)(a1 + 48);
}

uint64_t sub_1D3E4D5D4(uint64_t a1)
{
  return *(unsigned int *)(a1 + 56);
}

uint64_t sub_1D3E4D5DC(uint64_t a1)
{
  return *(unsigned int *)(a1 + 40);
}

uint64_t sub_1D3E4D5E4(uint64_t a1)
{
  return *(unsigned int *)(a1 + 124);
}

uint64_t sub_1D3E4D5EC(uint64_t a1)
{
  return *(unsigned int *)(a1 + 128);
}

uint64_t sub_1D3E4D5F4(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

uint64_t sub_1D3E4D5FC(uint64_t a1)
{
  return *(unsigned int *)(a1 + 32);
}

uint64_t sub_1D3E4D604(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

uint64_t sub_1D3E4D60C(uint64_t a1)
{
  return *(unsigned int *)(a1 + 88);
}

uint64_t sub_1D3E4D614(uint64_t a1)
{
  return *(unsigned int *)(a1 + 20);
}

uint64_t sub_1D3E4D61C(uint64_t a1)
{
  return *(unsigned int *)(a1 + 68);
}

uint64_t sub_1D3E4D624(uint64_t a1)
{
  return *(unsigned int *)(a1 + 64);
}

uint64_t sub_1D3E4D62C(uint64_t a1)
{
  return *(unsigned int *)(a1 + 32);
}

uint64_t sub_1D3E4D634(uint64_t a1)
{
  return *(unsigned int *)(a1 + 56);
}

uint64_t sub_1D3E4D63C(uint64_t a1)
{
  return *(unsigned int *)(a1 + 76);
}

uint64_t sub_1D3E4D644(uint64_t a1)
{
  return *(unsigned int *)(a1 + 20);
}

uint64_t sub_1D3E4D64C(uint64_t a1)
{
  return *(unsigned int *)(a1 + 32);
}

uint64_t sub_1D3E4D654(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

uint64_t sub_1D3E4D65C(uint64_t a1)
{
  return *(unsigned int *)(a1 + 204);
}

uint64_t sub_1D3E4D664(uint64_t result, int a2)
{
  int v2 = *(_DWORD *)(result + 12);
  if (v2 < a2)
  {
    int v3 = 2 * v2;
    if (v3 <= a2) {
      int v3 = a2;
    }
    if (v3 <= 4) {
      int v3 = 4;
    }
    *(_DWORD *)(result + 12) = v3;
    operator new[]();
  }
  return result;
}

void sub_1D3E4D710()
{
}

uint64_t sub_1D3E4D7B0(uint64_t result)
{
  uint64_t v1 = result;
  if (*(int *)(result + 8) >= 1)
  {
    uint64_t v2 = 0;
    do
    {
      uint64_t result = (*(uint64_t (**)(void))(**(void **)(*(void *)v1 + 8 * v2) + 32))(*(void *)(*(void *)v1 + 8 * v2));
      ++v2;
    }
    while (v2 < *(int *)(v1 + 8));
  }
  *(_DWORD *)(v1 + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  return result;
}

uint64_t sub_1D3E4D820(uint64_t result)
{
  if (*(int *)(result + 8) >= 1)
  {
    uint64_t v1 = 0;
    do
    {
      uint64_t v2 = *(void *)(*(void *)result + 8 * v1);
      if (*(char *)(v2 + 23) < 0)
      {
        **(unsigned char **)uint64_t v2 = 0;
        *(void *)(v2 + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
      }
      else
      {
        *(unsigned char *)uint64_t v2 = 0;
        *(unsigned char *)(v2 + 23) = 0;
      }
      ++v1;
    }
    while (v1 < *(int *)(result + 8));
  }
  *(_DWORD *)(result + MEMORY[0x1D9440F90]((char *)this + 8) = 0;
  return result;
}

uint64_t sub_1D3E4D870(uint64_t *a1)
{
  int v2 = *((_DWORD *)a1 + 3);
  if (v2 >= 1)
  {
    for (uint64_t i = 0; i < v2; ++i)
    {
      uint64_t v4 = *(void *)(*a1 + 8 * i);
      if (v4)
      {
        (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
        int v2 = *((_DWORD *)a1 + 3);
      }
    }
  }
  uint64_t result = *a1;
  if (*a1)
  {
    JUMPOUT(0x1D94412D0);
  }
  return result;
}

uint64_t sub_1D3E4D914(int *a1)
{
  if (a1[3] >= 1)
  {
    uint64_t v2 = 0;
    do
    {
      wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase::Delete();
      ++v2;
    }
    while (v2 < a1[3]);
  }
  uint64_t result = *(void *)a1;
  if (*(void *)a1)
  {
    JUMPOUT(0x1D94412D0);
  }
  return result;
}

void sub_1D3E4D994(int *a1, uint64_t a2)
{
  wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *)a1);
  if (*(int *)(a2 + 8) >= 1)
  {
    uint64_t v4 = 0;
    do
    {
      char v5 = *(const awd::profile::Metric **)(*(void *)a2 + 8 * v4);
      int v6 = a1[3];
      uint64_t v7 = a1[2];
      if ((int)v7 >= v6)
      {
        if (v6 == a1[4])
        {
          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *)a1);
          int v6 = a1[3];
        }
        a1[3] = v6 + 1;
        operator new();
      }
      uint64_t v8 = *(void *)a1;
      a1[2] = v7 + 1;
      awd::profile::Metric::MergeFrom(*(awd::profile::Metric **)(v8 + 8 * v7), v5);
      ++v4;
    }
    while (v4 < *(int *)(a2 + 8));
  }
}

void sub_1D3E4DAC4(int *a1, uint64_t a2)
{
  wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *)a1);
  if (*(int *)(a2 + 8) >= 1)
  {
    uint64_t v4 = 0;
    do
    {
      char v5 = *(const awd::profile::Profile **)(*(void *)a2 + 8 * v4);
      int v6 = a1[3];
      uint64_t v7 = a1[2];
      if ((int)v7 >= v6)
      {
        if (v6 == a1[4])
        {
          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *)a1);
          int v6 = a1[3];
        }
        a1[3] = v6 + 1;
        operator new();
      }
      uint64_t v8 = *(void *)a1;
      a1[2] = v7 + 1;
      awd::profile::Profile::MergeFrom(*(awd::profile::Profile **)(v8 + 8 * v7), v5);
      ++v4;
    }
    while (v4 < *(int *)(a2 + 8));
  }
}

void sub_1D3E4DBF8(int *a1, uint64_t a2)
{
  wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *)a1);
  if (*(int *)(a2 + 8) >= 1)
  {
    uint64_t v4 = 0;
    do
    {
      char v5 = *(const awd::profile::Condition **)(*(void *)a2 + 8 * v4);
      int v6 = a1[3];
      uint64_t v7 = a1[2];
      if ((int)v7 >= v6)
      {
        if (v6 == a1[4])
        {
          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *)a1);
          int v6 = a1[3];
        }
        a1[3] = v6 + 1;
        operator new();
      }
      uint64_t v8 = *(void *)a1;
      a1[2] = v7 + 1;
      awd::profile::Condition::MergeFrom(*(awd::profile::Condition **)(v8 + 8 * v7), v5);
      ++v4;
    }
    while (v4 < *(int *)(a2 + 8));
  }
}

void sub_1D3E4DD1C(int *a1, uint64_t a2)
{
  wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *)a1);
  if (*(int *)(a2 + 8) >= 1)
  {
    uint64_t v4 = 0;
    do
    {
      char v5 = *(const awd::profile::MetricFileSpec **)(*(void *)a2 + 8 * v4);
      int v6 = a1[3];
      uint64_t v7 = a1[2];
      if ((int)v7 >= v6)
      {
        if (v6 == a1[4])
        {
          wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve((wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *)a1);
          int v6 = a1[3];
        }
        a1[3] = v6 + 1;
        operator new();
      }
      uint64_t v8 = *(void *)a1;
      a1[2] = v7 + 1;
      awd::profile::MetricFileSpec::MergeFrom(*(awd::profile::MetricFileSpec **)(v8 + 8 * v7), v5);
      ++v4;
    }
    while (v4 < *(int *)(a2 + 8));
  }
}

void sub_1D3E4DE38()
{
}

uint64_t sub_1D3E4DE4C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result) {
    sub_1D3E4DE38();
  }
  return result;
}

void sub_1D3E4DE60(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *(_DWORD *)(a1 + 48);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_1D3E18000, a2, OS_LOG_TYPE_DEBUG, "server.conn:#D Calling callback on metric: 0x%x", (uint8_t *)v3, 8u);
}

uint64_t sub_1D3E4DEDC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

void sub_1D3E4DF00()
{
  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_1D3E18000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "metric.buffer:#D Deleted old metrics. State of the buffer after the delete (should be correct): ", v0, 2u);
}

void sub_1D3E4DF48()
{
  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_1D3E18000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "metric.buffer:#D Added a new metricContainer into buffer. State of the buffer after the add (may have too many metrics): ", v0, 2u);
}

void sub_1D3E4DF90(void *a1, uint64_t a2, int a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  __cxa_begin_catch(a1);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = a3;
    _os_log_impl(&dword_1D3E18000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "metric.buffer:#E Not able to buffer metric 0x%x", (uint8_t *)v4, 8u);
  }
  __cxa_end_catch();
}

void sub_1D3E4E044(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1D3E4E0B0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1D3E4E120(int a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 134218240;
  uint64_t v3 = 0;
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_debug_impl(&dword_1D3E18000, a2, OS_LOG_TYPE_DEBUG, "core:#D setExpectedMetricsForTrigger found %zd queriable metrics for trigger 0x%x", (uint8_t *)&v2, 0x12u);
}

void sub_1D3E4E1A4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1D3E4E210(uint64_t a1)
{
  int v2 = *(void **)a1;
  if (v2)
  {
    *(void *)(a1 + MEMORY[0x1D9440F90]((char *)this + 8) = v2;
    operator delete(v2);
  }
}

void sub_1D3E4E238(std::__shared_weak_count **a1, std::__shared_weak_count **a2)
{
  uint64_t v3 = *a1;
  if (v3) {
    std::__shared_weak_count::__release_weak(v3);
  }
  if (*a2) {
    std::__shared_weak_count::__release_weak(*a2);
  }
}

void sub_1D3E4E270(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1D3E18000, log, OS_LOG_TYPE_DEBUG, "core:#D Added an observer of AWDD startup notification", v1, 2u);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7978](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7990](allocator, theDict);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t sCreateLazyAwdMetadataLoaderForXpcConversion(void)
{
  return MEMORY[0x1F4178778]();
}

uint64_t LazyMetadataLoader::setBaseMetadata(LazyMetadataLoader *this, void *a2)
{
  return MEMORY[0x1F4178780](this, a2);
}

uint64_t LazyMetadataLoader::setMetadataForComponent(LazyMetadataLoader *this, void *a2)
{
  return MEMORY[0x1F4178788](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::ParseFromArray(wireless_diagnostics::google::protobuf::MessageLite *this, const void *a2)
{
  return MEMORY[0x1F4181C38](this, a2);
}

void wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(wireless_diagnostics::google::protobuf::MessageLite *this)
{
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  return MEMORY[0x1F4181C68](this);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unsigned int *a2)
{
  return MEMORY[0x1F4181C70](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unint64_t *a2)
{
  return MEMORY[0x1F4181C78](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unsigned int *a2)
{
  return MEMORY[0x1F4181C80](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unint64_t *a2)
{
  return MEMORY[0x1F4181C88](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::Skip(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  return MEMORY[0x1F4181C90](this);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  return MEMORY[0x1F4181CA0](this);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  return MEMORY[0x1F4181CA8](this);
}

void wireless_diagnostics::google::protobuf::io::CodedInputStream::~CodedInputStream(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this)
{
  return MEMORY[0x1F4181CC8](this);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this)
{
  return MEMORY[0x1F4181CE8](this);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64ToArray(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this, uint64_t a2, unsigned __int8 *a3)
{
  return MEMORY[0x1F4181CF0](this, a2, a3);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32FallbackToArray(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this, uint64_t a2, unsigned __int8 *a3)
{
  return MEMORY[0x1F4181CF8](this, a2, a3);
}

uint64_t wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage()
{
  return MEMORY[0x1F4181D10]();
}

void wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage(wireless_diagnostics::google::protobuf::internal::LogMessage *this)
{
}

uint64_t wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<()
{
  return MEMORY[0x1F4181D20]();
}

uint64_t wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=()
{
  return MEMORY[0x1F4181D30]();
}

uint64_t wireless_diagnostics::google::protobuf::internal::VerifyVersion(wireless_diagnostics::google::protobuf::internal *this, uint64_t a2, uint64_t a3, const char *a4)
{
  return MEMORY[0x1F4181D68](this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadString()
{
  return MEMORY[0x1F4181D70]();
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBytes()
{
  return MEMORY[0x1F4181D78]();
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteFloat(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, float a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return MEMORY[0x1F4181D80](this, a2, a4, a3);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt32(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return MEMORY[0x1F4181D88](this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt64(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return MEMORY[0x1F4181D90](this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteDouble(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, double a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return MEMORY[0x1F4181D98](this, a2, a4, a3);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteSInt32(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return MEMORY[0x1F4181DA0](this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteString()
{
  return MEMORY[0x1F4181DA8]();
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return MEMORY[0x1F4181DB0](this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt64(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return MEMORY[0x1F4181DB8](this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, const wireless_diagnostics::google::protobuf::MessageLite *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return MEMORY[0x1F4181DD0](this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadPackedEnumNoInline()
{
  return MEMORY[0x1F4181DD8]();
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadBytes()
{
  return MEMORY[0x1F4181DE0]();
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipField(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2)
{
  return MEMORY[0x1F4181DE8](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBool(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return MEMORY[0x1F4181DF0](this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteEnum(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return MEMORY[0x1F4181DF8](this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Swap()
{
  return MEMORY[0x1F4181E08]();
}

uint64_t wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *this)
{
  return MEMORY[0x1F4181E10](this);
}

uint64_t wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase::New(wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase *this)
{
  return MEMORY[0x1F4181E18](this);
}

uint64_t wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase::Delete()
{
  return MEMORY[0x1F4181E20]();
}

uint64_t PB::Writer::Writer(PB::Writer *this)
{
  return MEMORY[0x1F4147578](this);
}

void PB::Writer::~Writer(PB::Writer *this)
{
}

uint64_t ctu::OsLogLogger::OsLogLogger(ctu::OsLogLogger *this, const char *a2, const char *a3)
{
  return MEMORY[0x1F417D968](this, a2, a3);
}

void ctu::OsLogLogger::~OsLogLogger(ctu::OsLogLogger *this)
{
}

uint64_t ctu::path_join_impl()
{
  return MEMORY[0x1F417D9D0]();
}

uint64_t ctu::XpcClientHelper::setServer_internal()
{
  return MEMORY[0x1F417D9E0]();
}

uint64_t ctu::XpcClientHelper::setServer()
{
  return MEMORY[0x1F417D9E8]();
}

void ctu::XpcClientHelper::~XpcClientHelper(ctu::XpcClientHelper *this)
{
}

uint64_t ctu::cf::convert_copy()
{
  return MEMORY[0x1F417DAA8]();
}

uint64_t ctu::hex()
{
  return MEMORY[0x1F417DBC0]();
}

uint64_t ctu::hex(ctu *this)
{
  return MEMORY[0x1F417DBC8](this);
}

uint64_t ctu::Clock::now_in_nanoseconds(ctu::Clock *this)
{
  return MEMORY[0x1F417DBD8](this);
}

uint64_t ctu::XpcClient::setServer_sync()
{
  return MEMORY[0x1F417DC30]();
}

uint64_t ctu::XpcClient::XpcClient()
{
  return MEMORY[0x1F417DC38]();
}

void ctu::XpcClient::~XpcClient(ctu::XpcClient *this)
{
}

uint64_t xpc::dyn_cast_or_default()
{
  return MEMORY[0x1F417DCB0]();
}

{
  return MEMORY[0x1F417DCC0]();
}

{
  return MEMORY[0x1F417DCD0]();
}

{
  return MEMORY[0x1F417DCD8]();
}

{
  return MEMORY[0x1F417DCE8]();
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::SerializeToArray(wireless_diagnostics::google::protobuf::MessageLite *this, void *a2)
{
  return MEMORY[0x1F4181E28](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::SerializeToString()
{
  return MEMORY[0x1F4181E30]();
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  return MEMORY[0x1F4181E40](this);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x1F417E3A8]();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1F417E408](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1F417E418](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x1F417E4B8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

std::__sp_mut *__cdecl std::__get_sp_mut(const void *a1)
{
  return (std::__sp_mut *)MEMORY[0x1F417E580](a1);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1F417E5B8](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E5C0](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1F417E600](this, __pos, __s);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1F417E670](this, __str);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1F417E848]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1F417E850]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1F417E860]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1F417E8A0]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1F417E978]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1F417E980]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x1F417EA90](this);
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

uint64_t std::__sort<std::__less<unsigned int,unsigned int> &,unsigned int *>()
{
  return MEMORY[0x1F417EC58]();
}

void std::locale::~locale(std::locale *this)
{
}

void std::__sp_mut::lock(std::__sp_mut *this)
{
}

void std::__sp_mut::unlock(std::__sp_mut *this)
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
  return MEMORY[0x1F417EE40]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x1F417EE78](retstr, *(void *)&__val);
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
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
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

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

void dispatch_barrier_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify_f(dispatch_group_t group, dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
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
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1F40CC0C8](a1);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1F40CC568](a1, a2);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

void syslog(int a1, const char *a2, ...)
{
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1F40CEA18](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEA30](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1F40CEA58](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1F40CEAA8](xarray, index);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x1F40CEB10](value);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1F40CEB18](xBOOL);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBD0](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1F40CED28](object);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1F40CED90](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1F40CEDB0](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1F40CEDC0](xdata);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1F40CEE08](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x1F40CEE88](xdict);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1F40CEE98](xdict, key, length);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEC8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  MEMORY[0x1F40CEFF8](xdouble);
  return result;
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x1F40CF188](value);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1F40CF190](xint);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x1F40CF208]();
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1F40CF248](object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1F40CF290](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1F40CF2C8](xstring);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1F40CF330](xuint);
}