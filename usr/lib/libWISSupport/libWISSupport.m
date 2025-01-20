wireless_diagnostics::google::protobuf::io::CodedInputStream **sub_26389B53C(wireless_diagnostics::google::protobuf::io::CodedInputStream **a1)
{
  wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(*a1);
  wireless_diagnostics::google::protobuf::io::CodedInputStream::Skip(*a1);
  return a1;
}

xpc_object_t sub_26389B578@<X0>(char *string@<X1>, void *a2@<X8>)
{
  if (!string || (xpc_object_t result = xpc_string_create(string), (*a2 = result) == 0))
  {
    xpc_object_t result = xpc_null_create();
    *a2 = result;
  }
  return result;
}

xpc_object_t sub_26389B5C8@<X0>(uint64_t a1@<X0>, xpc_object_t *a2@<X1>, xpc_object_t *a3@<X8>)
{
  xpc_dictionary_set_value(**(xpc_object_t **)a1, *(const char **)(a1 + 8), *a2);
  *a3 = *a2;
  xpc_object_t result = xpc_null_create();
  *a2 = result;
  return result;
}

uint64_t sub_26389B614(uint64_t a1)
{
  sub_26389F2B0(a1, *(void **)(a1 + 16));
  v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void sub_26389B650(void *a1, char *a2, long long *a3, unsigned int a4)
{
  long long v15 = *a3;
  uint64_t v16 = *((void *)a3 + 2);
  v8 = sub_2638A1CF8((uint64_t)a1, (MetadataHandle *)&v15, a4);
  if (a2[23] >= 0) {
    v9 = a2;
  }
  else {
    v9 = *(char **)a2;
  }
  sub_26389B578(v9, &object);
  xpc_object_t v13 = object;
  if (object) {
    xpc_retain(object);
  }
  else {
    xpc_object_t v13 = xpc_null_create();
  }
  long long v11 = *a3;
  uint64_t v12 = *((void *)a3 + 2);
  int v10 = sub_2638A1D7C((uint64_t)a1, (MetadataHandle *)&v11, a4);
  sub_2638A195C(a1, (uint64_t)v8, &v13, v10);
  xpc_release(v13);
  xpc_object_t v13 = 0;
  xpc_release(object);
}

void sub_26389B740(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, xpc_object_t object, xpc_object_t a14)
{
}

void sub_26389B768(uint64_t a1@<X0>, void *a2@<X8>)
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
  if (MEMORY[0x263E6D6E0](v4) != MEMORY[0x263EF86D8])
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

void sub_26389B804(void *a1, uint64_t *a2, long long *a3, unsigned int a4, int a5)
{
  long long v27 = *a3;
  uint64_t v28 = *((void *)a3 + 2);
  int v10 = sub_2638A1CF8((uint64_t)a1, (MetadataHandle *)&v27, a4);
  xpc_object_t v11 = xpc_null_create();
  if (a5 == 11)
  {
    long long v22 = *a3;
    uint64_t v23 = *((void *)a3 + 2);
    sub_2638A2174((uint64_t)a1, (MetadataHandle *)&v22, a4, *a2, __p);
    if (v25 < 0)
    {
      if (!__p[1])
      {
LABEL_10:
        operator delete(__p[0]);
        goto LABEL_11;
      }
      xpc_object_t v13 = (char *)__p[0];
    }
    else
    {
      if (!v25) {
        goto LABEL_11;
      }
      xpc_object_t v13 = (char *)__p;
    }
    sub_26389B578(v13, &v21);
    v14 = v21;
    xpc_object_t v21 = v11;
    xpc_release(v11);
    xpc_object_t v21 = 0;
    xpc_object_t v11 = v14;
    if ((v25 & 0x80000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (a5 == 12)
  {
    sub_2638BB00C(*a2 != 0, &v26);
    uint64_t v12 = v26;
    xpc_object_t v26 = v11;
    xpc_release(v11);
    xpc_object_t v26 = 0;
    xpc_object_t v11 = v12;
  }
LABEL_11:
  if (MEMORY[0x263E6D6E0](v11) == MEMORY[0x263EF8758])
  {
    sub_2638BB04C(*a2, &v20);
    long long v15 = v20;
    xpc_object_t v20 = v11;
    xpc_release(v11);
    xpc_object_t v20 = 0;
    xpc_object_t v11 = v15;
  }
  xpc_object_t object = v11;
  if (v11) {
    xpc_retain(v11);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  long long v17 = *a3;
  uint64_t v18 = *((void *)a3 + 2);
  int v16 = sub_2638A1D7C((uint64_t)a1, (MetadataHandle *)&v17, a4);
  sub_2638A195C(a1, (uint64_t)v10, &object, v16);
  xpc_release(object);
  xpc_object_t object = 0;
  xpc_release(v11);
}

void sub_26389B9E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0) {
    operator delete(__p);
  }
  xpc_release(v24);
  _Unwind_Resume(a1);
}

void sub_26389BA48(void *a1, uint64_t *a2, long long *a3, unsigned int a4, int a5)
{
  long long v27 = *a3;
  uint64_t v28 = *((void *)a3 + 2);
  int v10 = sub_2638A1CF8((uint64_t)a1, (MetadataHandle *)&v27, a4);
  xpc_object_t v11 = xpc_null_create();
  if (a5 == 11)
  {
    long long v22 = *a3;
    uint64_t v23 = *((void *)a3 + 2);
    sub_2638A2174((uint64_t)a1, (MetadataHandle *)&v22, a4, *a2, __p);
    if (v25 < 0)
    {
      if (!__p[1])
      {
LABEL_10:
        operator delete(__p[0]);
        goto LABEL_11;
      }
      xpc_object_t v13 = (char *)__p[0];
    }
    else
    {
      if (!v25) {
        goto LABEL_11;
      }
      xpc_object_t v13 = (char *)__p;
    }
    sub_26389B578(v13, &v21);
    v14 = v21;
    xpc_object_t v21 = v11;
    xpc_release(v11);
    xpc_object_t v21 = 0;
    xpc_object_t v11 = v14;
    if ((v25 & 0x80000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (a5 == 12)
  {
    sub_2638BB00C(*a2 != 0, &v26);
    uint64_t v12 = v26;
    xpc_object_t v26 = v11;
    xpc_release(v11);
    xpc_object_t v26 = 0;
    xpc_object_t v11 = v12;
  }
LABEL_11:
  if (MEMORY[0x263E6D6E0](v11) == MEMORY[0x263EF8758])
  {
    sub_2638A2100(*a2, &v20);
    long long v15 = v20;
    xpc_object_t v20 = v11;
    xpc_release(v11);
    xpc_object_t v20 = 0;
    xpc_object_t v11 = v15;
  }
  xpc_object_t object = v11;
  if (v11) {
    xpc_retain(v11);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  long long v17 = *a3;
  uint64_t v18 = *((void *)a3 + 2);
  int v16 = sub_2638A1D7C((uint64_t)a1, (MetadataHandle *)&v17, a4);
  sub_2638A195C(a1, (uint64_t)v10, &object, v16);
  xpc_release(object);
  xpc_object_t object = 0;
  xpc_release(v11);
}

void sub_26389BC28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0) {
    operator delete(__p);
  }
  xpc_release(v24);
  _Unwind_Resume(a1);
}

void wis::asString(unsigned int *a1@<X0>, std::string *a2@<X8>)
{
  ctu::hex((ctu *)*a1);
  xpc_object_t v4 = std::string::insert(&v22, 0, "Trigger(cid=0x");
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
  int v10 = std::string::append(&v24, (const std::string::value_type *)v8, v9);
  long long v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
  v25.__r_.__value_.__r.__words[2] = v10->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v25.__r_.__value_.__l.__data_ = v11;
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = 0;
  uint64_t v12 = std::string::append(&v25, ", sid=");
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
  int v16 = std::string::append(&v26, (const std::string::value_type *)v14, size);
  long long v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
  v27.__r_.__value_.__r.__words[2] = v16->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v27.__r_.__value_.__l.__data_ = v17;
  v16->__r_.__value_.__l.__size_ = 0;
  v16->__r_.__value_.__r.__words[2] = 0;
  v16->__r_.__value_.__r.__words[0] = 0;
  uint64_t v18 = std::string::append(&v27, ")");
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

void sub_26389BE84(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,uint64_t a34,void *a35,uint64_t a36,int a37,__int16 a38,char a39,char a40)
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

void wis::createTagForProtobuf(wis *this@<X0>, unsigned int a2@<W1>, unint64_t *a3@<X8>)
{
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  sub_26389BFAC(a3, (8 * this) | 2);
  sub_26389BFAC(a3, a2);
}

void sub_26389BF90(_Unwind_Exception *exception_object)
{
  v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_26389BFAC(unint64_t *a1, unsigned int a2)
{
  LOBYTE(v2) = a2;
  if (a2 <= 0x7F)
  {
    v8 = (unsigned char *)a1[1];
  }
  else
  {
    xpc_object_t v4 = (unsigned char *)a1[1];
    unsigned int v5 = a2;
    do
    {
      char v6 = v5 | 0x80;
      unint64_t v7 = a1[2];
      if ((unint64_t)v4 >= v7)
      {
        unint64_t v9 = *a1;
        int v10 = &v4[-*a1];
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
        long long v15 = &v10[(void)v14];
        int v16 = &v10[(void)v14];
        *int v16 = v6;
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
          xpc_object_t v4 = (unsigned char *)*a1;
          long long v15 = v14;
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
        *xpc_object_t v4 = v6;
        v8 = v4 + 1;
      }
      a1[1] = (unint64_t)v8;
      unsigned int v2 = v5 >> 7;
      unsigned int v19 = v5 >> 14;
      xpc_object_t v4 = v8;
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
      sub_2638A2514();
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
    uint64_t v28 = (char *)(v27 + v26);
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

void sub_26389C18C(void **a1)
{
  *a1 = &unk_270EB76E8;
  unsigned int v2 = a1 + 1;
  v3 = a1 + 4;
  sub_26389C308(&v3);
  v3 = v2;
  sub_26389C308(&v3);
  PB::Base::~Base((PB::Base *)a1);
}

void sub_26389C1F8(uint64_t a1)
{
  sub_26389C230(a1);

  JUMPOUT(0x263E6D460);
}

void sub_26389C230(uint64_t a1)
{
  *(void *)a1 = &unk_270EB62B8;
  uint64_t v4 = *(void *)(a1 + 32);
  unsigned int v2 = (void *)(a1 + 32);
  uint64_t v3 = v4;
  void *v2 = 0;
  if (v4) {
    sub_26389C460((uint64_t)v2, v3);
  }
  unsigned int v5 = (void **)(a1 + 8);
  sub_26389C308(&v5);
  PB::Base::~Base((PB::Base *)a1);
}

void sub_26389C29C(uint64_t a1)
{
  *(void *)a1 = &unk_270EB77E8;
  uint64_t v4 = *(void *)(a1 + 32);
  unsigned int v2 = (void *)(a1 + 32);
  uint64_t v3 = v4;
  void *v2 = 0;
  if (v4) {
    sub_26389C460((uint64_t)v2, v3);
  }
  unsigned int v5 = (void **)(a1 + 8);
  sub_26389C308(&v5);
  PB::Base::~Base((PB::Base *)a1);
}

void sub_26389C308(void ***a1)
{
  unsigned int v2 = *a1;
  if (*v2)
  {
    sub_26389C35C(v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void *sub_26389C35C(void *result)
{
  uint64_t v1 = result;
  unsigned int v2 = (void *)*result;
  uint64_t v3 = (void *)result[1];
  while (v3 != v2)
  {
    uint64_t v4 = (void *)*--v3;
    xpc_object_t result = v4;
    void *v3 = 0;
    if (v4) {
      xpc_object_t result = (void *)(*(uint64_t (**)(void *))(*result + 8))(result);
    }
  }
  v1[1] = v2;
  return result;
}

void sub_26389C3C8(PB::Base *a1)
{
  sub_26389C400(a1);

  JUMPOUT(0x263E6D460);
}

void sub_26389C400(PB::Base *this)
{
  *(void *)this = &unk_270EB7698;
  uint64_t v4 = *((void *)this + 1);
  unsigned int v2 = (void *)((char *)this + 8);
  uint64_t v3 = v4;
  void *v2 = 0;
  if (v4) {
    sub_26389C460((uint64_t)v2, v3);
  }

  PB::Base::~Base(this);
}

void sub_26389C460(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (*(char *)(a2 + 23) < 0) {
      operator delete(*(void **)a2);
    }
    JUMPOUT(0x263E6D460);
  }
}

void sub_26389C4BC(PB::Base *a1)
{
  sub_26389C4F4(a1);

  JUMPOUT(0x263E6D460);
}

void sub_26389C4F4(PB::Base *this)
{
  *(void *)this = &unk_270EB7230;
  uint64_t v4 = *((void *)this + 1);
  unsigned int v2 = (void *)((char *)this + 8);
  uint64_t v3 = v4;
  void *v2 = 0;
  if (v4) {
    sub_26389C460((uint64_t)v2, v3);
  }

  PB::Base::~Base(this);
}

void sub_26389C554(uint64_t a1)
{
  sub_26389C29C(a1);

  JUMPOUT(0x263E6D460);
}

uint64_t sub_26389C58C(int a1, PB::Reader *this)
{
  unint64_t v2 = *((void *)this + 1);
  unint64_t v3 = *((void *)this + 2);
  int v4 = *((unsigned __int8 *)this + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      uint64_t v7 = *(void *)this;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        unint64_t v11 = v2 + 1;
        *((void *)this + 1) = v2 + 1;
        char v12 = *(unsigned char *)(v7 + v2);
        v10 |= (unint64_t)(v12 & 0x7F) << v8;
        if ((v12 & 0x80) == 0) {
          break;
        }
        v8 += 7;
        unint64_t v2 = v11;
        if (v9++ > 8) {
          goto LABEL_19;
        }
      }
LABEL_20:
      if ((v10 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      if ((v10 >> 3) == 2) {
        sub_26389C8D8();
      }
      if ((v10 >> 3) == 1) {
        sub_26389C76C();
      }
      uint64_t result = PB::Reader::skip(this);
      if (!result) {
        return result;
      }
      unint64_t v2 = *((void *)this + 1);
      unint64_t v3 = *((void *)this + 2);
      int v4 = *((unsigned __int8 *)this + 24);
      if (v2 >= v3 || *((unsigned char *)this + 24)) {
        return v4 == 0;
      }
    }
    char v14 = 0;
    unsigned int v15 = 0;
    unint64_t v10 = 0;
    if (v2 > v3) {
      unint64_t v3 = v2;
    }
    while (v3 != v2)
    {
      unint64_t v16 = v2 + 1;
      char v17 = *(unsigned char *)(v7 + v2);
      *((void *)this + 1) = v16;
      v10 |= (unint64_t)(v17 & 0x7F) << v14;
      if ((v17 & 0x80) == 0) {
        goto LABEL_20;
      }
      v14 += 7;
      unint64_t v2 = v16;
      if (v15++ >= 9)
      {
LABEL_19:
        unint64_t v10 = 0;
        goto LABEL_20;
      }
    }
    int v4 = 1;
    *((unsigned char *)this + 24) = 1;
  }
  return v4 == 0;
}

void sub_26389C76C()
{
}

void sub_26389C868(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_26389E044((void **)va);
  _Unwind_Resume(a1);
}

double sub_26389C8AC(uint64_t a1)
{
  *(void *)a1 = &unk_270EB77E8;
  double result = 0.0;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  return result;
}

void sub_26389C8D8()
{
}

void sub_26389C9D4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_26389E044((void **)va);
  _Unwind_Resume(a1);
}

double sub_26389CA18(uint64_t a1)
{
  *(void *)a1 = &unk_270EB62B8;
  double result = 0.0;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  return result;
}

uint64_t sub_26389CA44(int a1, PB::Reader *this)
{
  unint64_t v2 = *((void *)this + 1);
  unint64_t v3 = *((void *)this + 2);
  int v4 = *((unsigned __int8 *)this + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      uint64_t v7 = *(void *)this;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        unint64_t v11 = v2 + 1;
        *((void *)this + 1) = v2 + 1;
        char v12 = *(unsigned char *)(v7 + v2);
        v10 |= (unint64_t)(v12 & 0x7F) << v8;
        if ((v12 & 0x80) == 0) {
          break;
        }
        v8 += 7;
        unint64_t v2 = v11;
        if (v9++ > 8) {
          goto LABEL_19;
        }
      }
LABEL_20:
      if ((v10 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      if ((v10 >> 3) == 2) {
        sub_26389CC70();
      }
      if ((v10 >> 3) == 1) {
        operator new();
      }
      uint64_t result = PB::Reader::skip(this);
      if (!result) {
        return result;
      }
      unint64_t v2 = *((void *)this + 1);
      unint64_t v3 = *((void *)this + 2);
      int v4 = *((unsigned __int8 *)this + 24);
      if (v2 >= v3 || *((unsigned char *)this + 24)) {
        return v4 == 0;
      }
    }
    char v14 = 0;
    unsigned int v15 = 0;
    unint64_t v10 = 0;
    if (v2 > v3) {
      unint64_t v3 = v2;
    }
    while (v3 != v2)
    {
      unint64_t v16 = v2 + 1;
      char v17 = *(unsigned char *)(v7 + v2);
      *((void *)this + 1) = v16;
      v10 |= (unint64_t)(v17 & 0x7F) << v14;
      if ((v17 & 0x80) == 0) {
        goto LABEL_20;
      }
      v14 += 7;
      unint64_t v2 = v16;
      if (v15++ >= 9)
      {
LABEL_19:
        unint64_t v10 = 0;
        goto LABEL_20;
      }
    }
    int v4 = 1;
    *((unsigned char *)this + 24) = 1;
  }
  return v4 == 0;
}

void sub_26389CC70()
{
}

void sub_26389CD6C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_26389E044((void **)va);
  _Unwind_Resume(a1);
}

uint64_t sub_26389CDB0(uint64_t result)
{
  *(void *)uint64_t result = &unk_270EB7230;
  *(void *)(result + 8) = 0;
  *(_DWORD *)(result + 32) = 0;
  return result;
}

uint64_t sub_26389CDD4(uint64_t a1, PB::Reader *this)
{
  unint64_t v2 = *((void *)this + 1);
  unint64_t v3 = *((void *)this + 2);
  int v4 = *((unsigned __int8 *)this + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      uint64_t v8 = *(void *)this;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
        break;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        unint64_t v12 = v2 + 1;
        *((void *)this + 1) = v2 + 1;
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
LABEL_20:
      if ((v11 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      unint64_t v20 = v11 >> 3;
      if ((v11 >> 3) == 3)
      {
        *(unsigned char *)(a1 + 32) |= 1u;
        unint64_t v21 = *((void *)this + 1);
        unint64_t v22 = *((void *)this + 2);
        uint64_t v23 = *(void *)this;
        if (v21 > 0xFFFFFFFFFFFFFFF5 || v21 + 10 > v22)
        {
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v26 = 0;
          if (v22 <= v21) {
            unint64_t v22 = *((void *)this + 1);
          }
          while (1)
          {
            if (v22 == v21)
            {
              uint64_t v26 = 0;
              *((unsigned char *)this + 24) = 1;
              goto LABEL_58;
            }
            unint64_t v40 = v21 + 1;
            char v41 = *(unsigned char *)(v23 + v21);
            *((void *)this + 1) = v40;
            v26 |= (unint64_t)(v41 & 0x7F) << v38;
            if ((v41 & 0x80) == 0) {
              break;
            }
            v38 += 7;
            unint64_t v21 = v40;
            BOOL v14 = v39++ > 8;
            if (v14)
            {
LABEL_47:
              uint64_t v26 = 0;
              goto LABEL_58;
            }
          }
          if (*((unsigned char *)this + 24)) {
            uint64_t v26 = 0;
          }
        }
        else
        {
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v26 = 0;
          while (1)
          {
            unint64_t v27 = v21 + 1;
            *((void *)this + 1) = v21 + 1;
            char v28 = *(unsigned char *)(v23 + v21);
            v26 |= (unint64_t)(v28 & 0x7F) << v24;
            if ((v28 & 0x80) == 0) {
              break;
            }
            v24 += 7;
            unint64_t v21 = v27;
            BOOL v14 = v25++ > 8;
            if (v14) {
              goto LABEL_47;
            }
          }
        }
LABEL_58:
        *(void *)(a1 + 16) = v26;
      }
      else if (v20 == 2)
      {
        *(unsigned char *)(a1 + 32) |= 2u;
        unint64_t v29 = *((void *)this + 1);
        unint64_t v30 = *((void *)this + 2);
        uint64_t v31 = *(void *)this;
        if (v29 > 0xFFFFFFFFFFFFFFF5 || v29 + 10 > v30)
        {
          char v42 = 0;
          unsigned int v43 = 0;
          uint64_t v34 = 0;
          if (v30 <= v29) {
            unint64_t v30 = *((void *)this + 1);
          }
          while (1)
          {
            if (v30 == v29)
            {
              uint64_t v34 = 0;
              *((unsigned char *)this + 24) = 1;
              goto LABEL_62;
            }
            unint64_t v44 = v29 + 1;
            char v45 = *(unsigned char *)(v31 + v29);
            *((void *)this + 1) = v44;
            v34 |= (unint64_t)(v45 & 0x7F) << v42;
            if ((v45 & 0x80) == 0) {
              break;
            }
            v42 += 7;
            unint64_t v29 = v44;
            BOOL v14 = v43++ > 8;
            if (v14)
            {
LABEL_54:
              uint64_t v34 = 0;
              goto LABEL_62;
            }
          }
          if (*((unsigned char *)this + 24)) {
            uint64_t v34 = 0;
          }
        }
        else
        {
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v34 = 0;
          while (1)
          {
            unint64_t v35 = v29 + 1;
            *((void *)this + 1) = v29 + 1;
            char v36 = *(unsigned char *)(v31 + v29);
            v34 |= (unint64_t)(v36 & 0x7F) << v32;
            if ((v36 & 0x80) == 0) {
              break;
            }
            v32 += 7;
            unint64_t v29 = v35;
            BOOL v14 = v33++ > 8;
            if (v14) {
              goto LABEL_54;
            }
          }
        }
LABEL_62:
        *(void *)(a1 + 24) = v34;
      }
      else
      {
        if (v20 == 1) {
          operator new();
        }
        uint64_t result = PB::Reader::skip(this);
        if (!result) {
          return result;
        }
      }
      unint64_t v2 = *((void *)this + 1);
      unint64_t v3 = *((void *)this + 2);
      int v4 = *((unsigned __int8 *)this + 24);
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
      *((void *)this + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0) {
        goto LABEL_20;
      }
      v15 += 7;
      unint64_t v2 = v17;
      if (v16++ >= 9)
      {
LABEL_19:
        unint64_t v11 = 0;
        goto LABEL_20;
      }
    }
    int v4 = 1;
    *((unsigned char *)this + 24) = 1;
  }
  return v4 == 0;
}

uint64_t sub_26389D160(uint64_t *a1, void *a2)
{
  uint64_t result = sub_26389D1D8((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
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

uint64_t sub_26389D1D8(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
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
    char v9 = (void *)(a7 - 8);
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
  sub_26389D270((uint64_t)v13);
  return v11;
}

uint64_t sub_26389D270(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_2638A252C((void *)a1);
  }
  return a1;
}

uint64_t sub_26389D2A8(int a1, PB::Reader *this)
{
  unint64_t v2 = *((void *)this + 1);
  unint64_t v3 = *((void *)this + 2);
  int v4 = *((unsigned __int8 *)this + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      uint64_t v7 = *(void *)this;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        unint64_t v11 = v2 + 1;
        *((void *)this + 1) = v2 + 1;
        char v12 = *(unsigned char *)(v7 + v2);
        v10 |= (unint64_t)(v12 & 0x7F) << v8;
        if ((v12 & 0x80) == 0) {
          break;
        }
        v8 += 7;
        unint64_t v2 = v11;
        if (v9++ > 8) {
          goto LABEL_19;
        }
      }
LABEL_20:
      if ((v10 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      if ((v10 >> 3) == 2) {
        sub_26389D4D4();
      }
      if ((v10 >> 3) == 1) {
        operator new();
      }
      uint64_t result = PB::Reader::skip(this);
      if (!result) {
        return result;
      }
      unint64_t v2 = *((void *)this + 1);
      unint64_t v3 = *((void *)this + 2);
      int v4 = *((unsigned __int8 *)this + 24);
      if (v2 >= v3 || *((unsigned char *)this + 24)) {
        return v4 == 0;
      }
    }
    char v14 = 0;
    unsigned int v15 = 0;
    unint64_t v10 = 0;
    if (v2 > v3) {
      unint64_t v3 = v2;
    }
    while (v3 != v2)
    {
      unint64_t v16 = v2 + 1;
      char v17 = *(unsigned char *)(v7 + v2);
      *((void *)this + 1) = v16;
      v10 |= (unint64_t)(v17 & 0x7F) << v14;
      if ((v17 & 0x80) == 0) {
        goto LABEL_20;
      }
      v14 += 7;
      unint64_t v2 = v16;
      if (v15++ >= 9)
      {
LABEL_19:
        unint64_t v10 = 0;
        goto LABEL_20;
      }
    }
    int v4 = 1;
    *((unsigned char *)this + 24) = 1;
  }
  return v4 == 0;
}

void sub_26389D4D4()
{
}

void sub_26389D5D0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_26389E044((void **)va);
  _Unwind_Resume(a1);
}

double sub_26389D614(uint64_t a1)
{
  *(void *)a1 = &unk_270EB7698;
  *(void *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 24) = 0;
  *(void *)&double result = 0x100000001;
  *(void *)(a1 + 32) = 0x100000001;
  *(_DWORD *)(a1 + 44) = 0;
  *(_DWORD *)(a1 + 52) = 0;
  return result;
}

uint64_t sub_26389D648(uint64_t a1, PB::Reader *this)
{
  unint64_t v2 = *((void *)this + 1);
  unint64_t v3 = *((void *)this + 2);
  int v4 = *((unsigned __int8 *)this + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      uint64_t v8 = *(void *)this;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
        break;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        unint64_t v12 = v2 + 1;
        *((void *)this + 1) = v2 + 1;
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
LABEL_20:
      if ((v11 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      switch((v11 >> 3))
      {
        case 1u:
          *(_WORD *)(a1 + 52) |= 0x40u;
          unint64_t v20 = *((void *)this + 1);
          unint64_t v21 = *((void *)this + 2);
          uint64_t v22 = *(void *)this;
          if (v20 <= 0xFFFFFFFFFFFFFFF5 && v20 + 10 <= v21)
          {
            char v23 = 0;
            unsigned int v24 = 0;
            uint64_t v25 = 0;
            do
            {
              unint64_t v26 = v20 + 1;
              *((void *)this + 1) = v20 + 1;
              char v27 = *(unsigned char *)(v22 + v20);
              v25 |= (unint64_t)(v27 & 0x7F) << v23;
              if ((v27 & 0x80) == 0) {
                goto LABEL_152;
              }
              v23 += 7;
              unint64_t v20 = v26;
              BOOL v14 = v24++ > 8;
            }
            while (!v14);
LABEL_93:
            LODWORD(v25) = 0;
            goto LABEL_152;
          }
          char v97 = 0;
          unsigned int v98 = 0;
          uint64_t v25 = 0;
          if (v21 <= v20) {
            unint64_t v21 = *((void *)this + 1);
          }
          while (2)
          {
            if (v21 == v20)
            {
              LODWORD(v25) = 0;
              *((unsigned char *)this + 24) = 1;
            }
            else
            {
              unint64_t v99 = v20 + 1;
              char v100 = *(unsigned char *)(v22 + v20);
              *((void *)this + 1) = v99;
              v25 |= (unint64_t)(v100 & 0x7F) << v97;
              if (v100 < 0)
              {
                v97 += 7;
                unint64_t v20 = v99;
                BOOL v14 = v98++ > 8;
                if (v14) {
                  goto LABEL_93;
                }
                continue;
              }
              if (*((unsigned char *)this + 24)) {
                LODWORD(v25) = 0;
              }
            }
            break;
          }
LABEL_152:
          *(_DWORD *)(a1 + 40) = v25;
          goto LABEL_181;
        case 2u:
          *(_WORD *)(a1 + 52) |= 0x80u;
          unint64_t v29 = *((void *)this + 1);
          unint64_t v30 = *((void *)this + 2);
          uint64_t v31 = *(void *)this;
          if (v29 <= 0xFFFFFFFFFFFFFFF5 && v29 + 10 <= v30)
          {
            char v32 = 0;
            unsigned int v33 = 0;
            uint64_t v34 = 0;
            do
            {
              unint64_t v35 = v29 + 1;
              *((void *)this + 1) = v29 + 1;
              char v36 = *(unsigned char *)(v31 + v29);
              v34 |= (unint64_t)(v36 & 0x7F) << v32;
              if ((v36 & 0x80) == 0) {
                goto LABEL_156;
              }
              v32 += 7;
              unint64_t v29 = v35;
              BOOL v14 = v33++ > 8;
            }
            while (!v14);
LABEL_100:
            LODWORD(v34) = 0;
            goto LABEL_156;
          }
          char v101 = 0;
          unsigned int v102 = 0;
          uint64_t v34 = 0;
          if (v30 <= v29) {
            unint64_t v30 = *((void *)this + 1);
          }
          while (2)
          {
            if (v30 == v29)
            {
              LODWORD(v34) = 0;
              *((unsigned char *)this + 24) = 1;
            }
            else
            {
              unint64_t v103 = v29 + 1;
              char v104 = *(unsigned char *)(v31 + v29);
              *((void *)this + 1) = v103;
              v34 |= (unint64_t)(v104 & 0x7F) << v101;
              if (v104 < 0)
              {
                v101 += 7;
                unint64_t v29 = v103;
                BOOL v14 = v102++ > 8;
                if (v14) {
                  goto LABEL_100;
                }
                continue;
              }
              if (*((unsigned char *)this + 24)) {
                LODWORD(v34) = 0;
              }
            }
            break;
          }
LABEL_156:
          *(_DWORD *)(a1 + 44) = v34;
          goto LABEL_181;
        case 3u:
          *(_WORD *)(a1 + 52) |= 0x400u;
          unint64_t v37 = *((void *)this + 1);
          if (v37 >= *((void *)this + 2))
          {
            BOOL v40 = 0;
            *((unsigned char *)this + 24) = 1;
          }
          else
          {
            unint64_t v38 = v37 + 1;
            int v39 = *(unsigned __int8 *)(*(void *)this + v37);
            *((void *)this + 1) = v38;
            BOOL v40 = v39 != 0;
          }
          *(unsigned char *)(a1 + 50) = v40;
          goto LABEL_181;
        case 4u:
          operator new();
        case 5u:
          *(_WORD *)(a1 + 52) |= 0x200u;
          unint64_t v41 = *((void *)this + 1);
          if (v41 >= *((void *)this + 2))
          {
            BOOL v44 = 0;
            *((unsigned char *)this + 24) = 1;
          }
          else
          {
            unint64_t v42 = v41 + 1;
            int v43 = *(unsigned __int8 *)(*(void *)this + v41);
            *((void *)this + 1) = v42;
            BOOL v44 = v43 != 0;
          }
          *(unsigned char *)(a1 + 49) = v44;
          goto LABEL_181;
        case 6u:
          *(_WORD *)(a1 + 52) |= 0x100u;
          unint64_t v45 = *((void *)this + 1);
          if (v45 >= *((void *)this + 2))
          {
            BOOL v48 = 0;
            *((unsigned char *)this + 24) = 1;
          }
          else
          {
            unint64_t v46 = v45 + 1;
            int v47 = *(unsigned __int8 *)(*(void *)this + v45);
            *((void *)this + 1) = v46;
            BOOL v48 = v47 != 0;
          }
          *(unsigned char *)(a1 + 48) = v48;
          goto LABEL_181;
        case 7u:
          *(_WORD *)(a1 + 52) |= 2u;
          unint64_t v49 = *((void *)this + 1);
          unint64_t v50 = *((void *)this + 2);
          uint64_t v51 = *(void *)this;
          if (v49 <= 0xFFFFFFFFFFFFFFF5 && v49 + 10 <= v50)
          {
            char v52 = 0;
            unsigned int v53 = 0;
            uint64_t v54 = 0;
            do
            {
              unint64_t v55 = v49 + 1;
              *((void *)this + 1) = v49 + 1;
              char v56 = *(unsigned char *)(v51 + v49);
              v54 |= (unint64_t)(v56 & 0x7F) << v52;
              if ((v56 & 0x80) == 0) {
                goto LABEL_160;
              }
              v52 += 7;
              unint64_t v49 = v55;
              BOOL v14 = v53++ > 8;
            }
            while (!v14);
LABEL_113:
            LODWORD(v54) = 0;
            goto LABEL_160;
          }
          char v105 = 0;
          unsigned int v106 = 0;
          uint64_t v54 = 0;
          if (v50 <= v49) {
            unint64_t v50 = *((void *)this + 1);
          }
          while (2)
          {
            if (v50 == v49)
            {
              LODWORD(v54) = 0;
              *((unsigned char *)this + 24) = 1;
            }
            else
            {
              unint64_t v107 = v49 + 1;
              char v108 = *(unsigned char *)(v51 + v49);
              *((void *)this + 1) = v107;
              v54 |= (unint64_t)(v108 & 0x7F) << v105;
              if (v108 < 0)
              {
                v105 += 7;
                unint64_t v49 = v107;
                BOOL v14 = v106++ > 8;
                if (v14) {
                  goto LABEL_113;
                }
                continue;
              }
              if (*((unsigned char *)this + 24)) {
                LODWORD(v54) = 0;
              }
            }
            break;
          }
LABEL_160:
          *(_DWORD *)(a1 + 20) = v54;
          goto LABEL_181;
        case 8u:
          *(_WORD *)(a1 + 52) |= 1u;
          unint64_t v57 = *((void *)this + 1);
          unint64_t v58 = *((void *)this + 2);
          uint64_t v59 = *(void *)this;
          if (v57 <= 0xFFFFFFFFFFFFFFF5 && v57 + 10 <= v58)
          {
            char v60 = 0;
            unsigned int v61 = 0;
            uint64_t v62 = 0;
            do
            {
              unint64_t v63 = v57 + 1;
              *((void *)this + 1) = v57 + 1;
              char v64 = *(unsigned char *)(v59 + v57);
              v62 |= (unint64_t)(v64 & 0x7F) << v60;
              if ((v64 & 0x80) == 0) {
                goto LABEL_164;
              }
              v60 += 7;
              unint64_t v57 = v63;
              BOOL v14 = v61++ > 8;
            }
            while (!v14);
LABEL_120:
            LODWORD(v62) = 0;
            goto LABEL_164;
          }
          char v109 = 0;
          unsigned int v110 = 0;
          uint64_t v62 = 0;
          if (v58 <= v57) {
            unint64_t v58 = *((void *)this + 1);
          }
          while (2)
          {
            if (v58 == v57)
            {
              LODWORD(v62) = 0;
              *((unsigned char *)this + 24) = 1;
            }
            else
            {
              unint64_t v111 = v57 + 1;
              char v112 = *(unsigned char *)(v59 + v57);
              *((void *)this + 1) = v111;
              v62 |= (unint64_t)(v112 & 0x7F) << v109;
              if (v112 < 0)
              {
                v109 += 7;
                unint64_t v57 = v111;
                BOOL v14 = v110++ > 8;
                if (v14) {
                  goto LABEL_120;
                }
                continue;
              }
              if (*((unsigned char *)this + 24)) {
                LODWORD(v62) = 0;
              }
            }
            break;
          }
LABEL_164:
          *(_DWORD *)(a1 + 16) = v62;
          goto LABEL_181;
        case 9u:
          *(_WORD *)(a1 + 52) |= 0x20u;
          unint64_t v65 = *((void *)this + 1);
          unint64_t v66 = *((void *)this + 2);
          uint64_t v67 = *(void *)this;
          if (v65 <= 0xFFFFFFFFFFFFFFF5 && v65 + 10 <= v66)
          {
            char v68 = 0;
            unsigned int v69 = 0;
            uint64_t v70 = 0;
            do
            {
              unint64_t v71 = v65 + 1;
              *((void *)this + 1) = v65 + 1;
              char v72 = *(unsigned char *)(v67 + v65);
              v70 |= (unint64_t)(v72 & 0x7F) << v68;
              if ((v72 & 0x80) == 0) {
                goto LABEL_168;
              }
              v68 += 7;
              unint64_t v65 = v71;
              BOOL v14 = v69++ > 8;
            }
            while (!v14);
LABEL_127:
            LODWORD(v70) = 0;
            goto LABEL_168;
          }
          char v113 = 0;
          unsigned int v114 = 0;
          uint64_t v70 = 0;
          if (v66 <= v65) {
            unint64_t v66 = *((void *)this + 1);
          }
          while (2)
          {
            if (v66 == v65)
            {
              LODWORD(v70) = 0;
              *((unsigned char *)this + 24) = 1;
            }
            else
            {
              unint64_t v115 = v65 + 1;
              char v116 = *(unsigned char *)(v67 + v65);
              *((void *)this + 1) = v115;
              v70 |= (unint64_t)(v116 & 0x7F) << v113;
              if (v116 < 0)
              {
                v113 += 7;
                unint64_t v65 = v115;
                BOOL v14 = v114++ > 8;
                if (v14) {
                  goto LABEL_127;
                }
                continue;
              }
              if (*((unsigned char *)this + 24)) {
                LODWORD(v70) = 0;
              }
            }
            break;
          }
LABEL_168:
          *(_DWORD *)(a1 + 36) = v70;
          goto LABEL_181;
        case 0xAu:
          *(_WORD *)(a1 + 52) |= 0x10u;
          unint64_t v73 = *((void *)this + 1);
          unint64_t v74 = *((void *)this + 2);
          uint64_t v75 = *(void *)this;
          if (v73 <= 0xFFFFFFFFFFFFFFF5 && v73 + 10 <= v74)
          {
            char v76 = 0;
            unsigned int v77 = 0;
            uint64_t v78 = 0;
            do
            {
              unint64_t v79 = v73 + 1;
              *((void *)this + 1) = v73 + 1;
              char v80 = *(unsigned char *)(v75 + v73);
              v78 |= (unint64_t)(v80 & 0x7F) << v76;
              if ((v80 & 0x80) == 0) {
                goto LABEL_172;
              }
              v76 += 7;
              unint64_t v73 = v79;
              BOOL v14 = v77++ > 8;
            }
            while (!v14);
LABEL_134:
            LODWORD(v78) = 0;
            goto LABEL_172;
          }
          char v117 = 0;
          unsigned int v118 = 0;
          uint64_t v78 = 0;
          if (v74 <= v73) {
            unint64_t v74 = *((void *)this + 1);
          }
          while (2)
          {
            if (v74 == v73)
            {
              LODWORD(v78) = 0;
              *((unsigned char *)this + 24) = 1;
            }
            else
            {
              unint64_t v119 = v73 + 1;
              char v120 = *(unsigned char *)(v75 + v73);
              *((void *)this + 1) = v119;
              v78 |= (unint64_t)(v120 & 0x7F) << v117;
              if (v120 < 0)
              {
                v117 += 7;
                unint64_t v73 = v119;
                BOOL v14 = v118++ > 8;
                if (v14) {
                  goto LABEL_134;
                }
                continue;
              }
              if (*((unsigned char *)this + 24)) {
                LODWORD(v78) = 0;
              }
            }
            break;
          }
LABEL_172:
          *(_DWORD *)(a1 + 32) = v78;
          goto LABEL_181;
        case 0xBu:
          *(_WORD *)(a1 + 52) |= 8u;
          unint64_t v81 = *((void *)this + 1);
          unint64_t v82 = *((void *)this + 2);
          uint64_t v83 = *(void *)this;
          if (v81 <= 0xFFFFFFFFFFFFFFF5 && v81 + 10 <= v82)
          {
            char v84 = 0;
            unsigned int v85 = 0;
            uint64_t v86 = 0;
            do
            {
              unint64_t v87 = v81 + 1;
              *((void *)this + 1) = v81 + 1;
              char v88 = *(unsigned char *)(v83 + v81);
              v86 |= (unint64_t)(v88 & 0x7F) << v84;
              if ((v88 & 0x80) == 0) {
                goto LABEL_176;
              }
              v84 += 7;
              unint64_t v81 = v87;
              BOOL v14 = v85++ > 8;
            }
            while (!v14);
LABEL_141:
            LODWORD(v86) = 0;
            goto LABEL_176;
          }
          char v121 = 0;
          unsigned int v122 = 0;
          uint64_t v86 = 0;
          if (v82 <= v81) {
            unint64_t v82 = *((void *)this + 1);
          }
          while (2)
          {
            if (v82 == v81)
            {
              LODWORD(v86) = 0;
              *((unsigned char *)this + 24) = 1;
            }
            else
            {
              unint64_t v123 = v81 + 1;
              char v124 = *(unsigned char *)(v83 + v81);
              *((void *)this + 1) = v123;
              v86 |= (unint64_t)(v124 & 0x7F) << v121;
              if (v124 < 0)
              {
                v121 += 7;
                unint64_t v81 = v123;
                BOOL v14 = v122++ > 8;
                if (v14) {
                  goto LABEL_141;
                }
                continue;
              }
              if (*((unsigned char *)this + 24)) {
                LODWORD(v86) = 0;
              }
            }
            break;
          }
LABEL_176:
          *(_DWORD *)(a1 + 28) = v86;
          goto LABEL_181;
        case 0xCu:
          *(_WORD *)(a1 + 52) |= 4u;
          unint64_t v89 = *((void *)this + 1);
          unint64_t v90 = *((void *)this + 2);
          uint64_t v91 = *(void *)this;
          if (v89 <= 0xFFFFFFFFFFFFFFF5 && v89 + 10 <= v90)
          {
            char v92 = 0;
            unsigned int v93 = 0;
            uint64_t v94 = 0;
            do
            {
              unint64_t v95 = v89 + 1;
              *((void *)this + 1) = v89 + 1;
              char v96 = *(unsigned char *)(v91 + v89);
              v94 |= (unint64_t)(v96 & 0x7F) << v92;
              if ((v96 & 0x80) == 0) {
                goto LABEL_180;
              }
              v92 += 7;
              unint64_t v89 = v95;
              BOOL v14 = v93++ > 8;
            }
            while (!v14);
LABEL_148:
            LODWORD(v94) = 0;
            goto LABEL_180;
          }
          char v125 = 0;
          unsigned int v126 = 0;
          uint64_t v94 = 0;
          if (v90 <= v89) {
            unint64_t v90 = *((void *)this + 1);
          }
          break;
        default:
          uint64_t result = PB::Reader::skip(this);
          if (!result) {
            return result;
          }
          goto LABEL_181;
      }
      while (1)
      {
        if (v90 == v89)
        {
          LODWORD(v94) = 0;
          *((unsigned char *)this + 24) = 1;
          goto LABEL_180;
        }
        unint64_t v127 = v89 + 1;
        char v128 = *(unsigned char *)(v91 + v89);
        *((void *)this + 1) = v127;
        v94 |= (unint64_t)(v128 & 0x7F) << v125;
        if ((v128 & 0x80) == 0) {
          break;
        }
        v125 += 7;
        unint64_t v89 = v127;
        BOOL v14 = v126++ > 8;
        if (v14) {
          goto LABEL_148;
        }
      }
      if (*((unsigned char *)this + 24)) {
        LODWORD(v94) = 0;
      }
LABEL_180:
      *(_DWORD *)(a1 + 24) = v94;
LABEL_181:
      unint64_t v2 = *((void *)this + 1);
      unint64_t v3 = *((void *)this + 2);
      int v4 = *((unsigned __int8 *)this + 24);
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
      *((void *)this + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0) {
        goto LABEL_20;
      }
      v15 += 7;
      unint64_t v2 = v17;
      if (v16++ >= 9)
      {
LABEL_19:
        unint64_t v11 = 0;
        goto LABEL_20;
      }
    }
    int v4 = 1;
    *((unsigned char *)this + 24) = 1;
  }
  return v4 == 0;
}

void *sub_26389E00C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_2638A24E0();
  }
  return operator new(8 * a2);
}

void **sub_26389E044(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void *sub_26389E07C(void *result, uint64_t a2)
{
  uint64_t v2 = result[2];
  if (v2 != a2)
  {
    int v4 = result;
    do
    {
      v4[2] = v2 - 8;
      uint64_t result = *(void **)(v2 - 8);
      *(void *)(v2 - 8) = 0;
      if (result) {
        uint64_t result = (void *)(*(uint64_t (**)(void *))(*result + 8))(result);
      }
      uint64_t v2 = v4[2];
    }
    while (v2 != a2);
  }
  return result;
}

uint64_t sub_26389E0F0(uint64_t *a1, void *a2)
{
  uint64_t result = sub_26389E168((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
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

uint64_t sub_26389E168(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
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
    char v9 = (void *)(a7 - 8);
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
  sub_26389E200((uint64_t)v13);
  return v11;
}

uint64_t sub_26389E200(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_2638A252C((void *)a1);
  }
  return a1;
}

uint64_t MetricFileMetadataHelper::getMetadataForComponent(MetricFileMetadataHelper *this, unsigned int a2)
{
  unsigned int v13 = a2;
  unint64_t v3 = (char *)this + 40;
  int v4 = sub_26389EA34((void *)this + 5, &v13);
  if (v4) {
    return v4[3];
  }
  MetricFileMetadataHelper::createMetadataForComponent((WISMetadataLoader **)this, v13, &v12);
  if (!(void)v12)
  {
    uint64_t v6 = operator new(0x50uLL);
    v6[1] = 0;
    v6[2] = 0;
    void *v6 = &unk_270EB74E8;
    sub_26389F280((uint64_t)(v6 + 3));
    uint64_t v7 = (std::__shared_weak_count *)*((void *)&v12 + 1);
    *(void *)&long long v12 = v6 + 3;
    *((void *)&v12 + 1) = v6;
    if (v7) {
      sub_26389F6D4(v7);
    }
  }
  char v14 = &v13;
  uint64_t v8 = sub_26389ED18((uint64_t)v3, &v13, (uint64_t)&unk_2638C9AC4, &v14);
  uint64_t v9 = *((void *)&v12 + 1);
  uint64_t v5 = v12;
  if (*((void *)&v12 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v12 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v10 = (std::__shared_weak_count *)v8[4];
  v8[3] = v5;
  v8[4] = v9;
  if (v10)
  {
    sub_26389F6D4(v10);
    uint64_t v5 = v12;
  }
  if (*((void *)&v12 + 1)) {
    sub_26389F6D4(*((std::__shared_weak_count **)&v12 + 1));
  }
  return v5;
}

void sub_26389E348(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_26389F6D4(a10);
  }
  _Unwind_Resume(exception_object);
}

double MetricFileMetadataHelper::getSubfieldType@<D0>(MetricFileMetadataHelper *a1@<X0>, __n128 *a2@<X1>, unsigned int a3@<W2>, uint64_t a4@<X8>)
{
  __n128 v6 = *a2;
  unint64_t v7 = a2[1].n128_u64[0];
  MetricFileMetadataHelper::resolveSubfieldInMetricHandle(a1, &v6, a3, (uint64_t)&v8);
  double result = *(double *)&v8;
  *(_OWORD *)a4 = v8;
  *(void *)(a4 + 16) = v9;
  return result;
}

double MetricFileMetadataHelper::resolveSubfieldInMetricHandle@<D0>(MetricFileMetadataHelper *a1@<X0>, __n128 *a2@<X1>, unsigned int a3@<W2>, uint64_t a4@<X8>)
{
  __n128 v11 = *a2;
  unint64_t v12 = a2[1].n128_u64[0];
  MetadataHelper::resolveSubfieldInHandle((uint64_t)a1, &v11, a3, (__n128 *)v13);
  if (*(void *)&v13[24] || *(_OWORD *)v13 != *((_OWORD *)a1 + 5))
  {
    double result = *(double *)v13;
    long long v8 = *(_OWORD *)&v13[16];
    *(_OWORD *)a4 = *(_OWORD *)v13;
    *(_OWORD *)(a4 + 16) = v8;
  }
  else
  {
    *(void *)unsigned int v13 = MetricFileMetadataHelper::getMetadataForComponent(a1, HIWORD(a3));
    *(_OWORD *)&v13[8] = xmmword_2638C9B70;
    __n128 v9 = *(__n128 *)v13;
    uint64_t v10 = 0xFFFFFFFFLL;
    *(void *)&double result = MetadataHelper::resolveSubfieldInHandle((uint64_t)a1, &v9, a3, (__n128 *)a4).n128_u64[0];
  }
  return result;
}

__n128 MetadataHelper::resolveSubfieldInHandle@<Q0>(uint64_t a1@<X0>, __n128 *a2@<X1>, unsigned int a3@<W2>, __n128 *a4@<X8>)
{
  __n128 v26 = *a2;
  unint64_t v27 = a2[1].n128_u64[0];
  MetadataHelper::descendIntoMessage(a1, (MetadataHandle *)&v26, (uint64_t)&v28);
  *a2 = v28;
  a2[1].n128_u64[0] = 0xFFFFFFFFLL;
  unint64_t v7 = a2->n128_u64[0];
  if (!a2->n128_u64[0]) {
    goto LABEL_18;
  }
  unint64_t v8 = a2->n128_u64[1];
  unint64_t v10 = v7 + 32;
  uint64_t v9 = *(void *)(v7 + 32);
  if (v8 >= (*(void *)(v10 + 8) - v9) >> 3) {
    goto LABEL_18;
  }
  uint64_t v11 = *(void *)(v9 + 8 * v8);
  if (!v11) {
    goto LABEL_18;
  }
  unint64_t v12 = *(void **)(v11 + 8);
  uint64_t v13 = *(void *)(v11 + 16) - (void)v12;
  if (!v13) {
    goto LABEL_18;
  }
  unint64_t v14 = v13 >> 3;
  long long v15 = v12;
  do
  {
    unint64_t v16 = v14 >> 1;
    unint64_t v17 = &v15[v14 >> 1];
    uint64_t v19 = *v17;
    char v18 = v17 + 1;
    v14 += ~(v14 >> 1);
    if (*(_DWORD *)(v19 + 40) <= a3) {
      long long v15 = v18;
    }
    else {
      unint64_t v14 = v16;
    }
  }
  while (v14);
  if (v15 != v12
    && ((v22 = *(v15 - 1), unint64_t v20 = v15 - 1, v21 = v22, v23 = *(_DWORD *)(v22 + 40), v23 == a3)
     || (v23 < a3 ? (BOOL v24 = (*(_WORD *)(v21 + 52) & 8) == 0) : (BOOL v24 = 1), !v24 && *(_DWORD *)(v21 + 28) > a3)))
  {
    a2[1].n128_u64[0] = v20 - v12;
  }
  else
  {
LABEL_18:
    unint64_t v21 = 0;
  }
  __n128 result = *a2;
  *a4 = *a2;
  a4[1].n128_u64[0] = a2[1].n128_u64[0];
  a4[1].n128_u64[1] = v21;
  return result;
}

__n128 MetadataHelper::descendIntoMessage@<Q0>(uint64_t a1@<X0>, MetadataHandle *a2@<X1>, uint64_t a3@<X8>)
{
  if (!*(void *)a2)
  {
    long long v5 = *(_OWORD *)(a1 + 16);
    *((void *)a2 + 2) = *(void *)(a1 + 32);
    *(_OWORD *)a2 = v5;
  }
  if (*((void *)a2 + 2) != 0xFFFFFFFFLL)
  {
    uint64_t Field = MetadataHandle::getField(a2);
    if (Field) {
      *((void *)a2 + 1) = *(unsigned int *)(Field + 20);
    }
    *((void *)a2 + 2) = 0xFFFFFFFFLL;
  }
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)a3 = *(_OWORD *)a2;
  *(void *)(a3 + 16) = *((void *)a2 + 2);
  return result;
}

uint64_t MetadataHandle::getField(MetadataHandle *this)
{
  unint64_t v1 = *((void *)this + 2);
  if (v1 != 0xFFFFFFFF
    && (uint64_t v2 = *(void *)this) != 0
    && (v3 = *((void *)this + 1), v5 = v2 + 32, uint64_t v4 = *(void *)(v2 + 32), v3 < (*(void *)(v5 + 8) - v4) >> 3)
    && (uint64_t v6 = *(void *)(v4 + 8 * v3)) != 0
    && (v8 = v6 + 8, uint64_t v7 = *(void *)(v6 + 8), v1 < (*(void *)(v8 + 8) - v7) >> 3))
  {
    return *(void *)(v7 + 8 * v1);
  }
  else
  {
    return 0;
  }
}

unint64_t wis::reflect::decodeTag(wis::reflect *this)
{
  return this & 7 | ((unint64_t)(this >> 3) << 32);
}

uint64_t MetadataHelper::getBuiltinType(uint64_t a1, MetadataHandle *a2)
{
  uint64_t result = MetadataHandle::getField(a2);
  if (result) {
    return *(unsigned int *)(result + 44);
  }
  return result;
}

uint64_t wis::reflect::getDecodingType(uint64_t a1, int a2)
{
  if (wis::reflect::getWireTypeForType(a1) == a2) {
    return a1;
  }
  uint64_t UnpackedType = wis::reflect::getUnpackedType(a1);
  if (wis::reflect::getWireTypeForType(UnpackedType) != a2)
  {
    if (a2 != 2) {
      return 0;
    }
    uint64_t UnpackedType = wis::reflect::getPackedType(a1);
    if (!UnpackedType) {
      return 0;
    }
  }
  return UnpackedType;
}

uint64_t wis::reflect::getWireTypeForType(int a1)
{
  if ((a1 - 1) > 0x1A) {
    return 0;
  }
  else {
    return byte_2638C9A28[a1 - 1];
  }
}

uint64_t MetadataHandle::getEnum(MetadataHandle *this)
{
  uint64_t result = MetadataHandle::getField(this);
  if (result)
  {
    if ((*(_WORD *)(result + 52) & 1) != 0
      && (unint64_t v3 = *(unsigned int *)(result + 16),
          uint64_t v4 = *(void *)(*(void *)this + 8),
          v3 < (*(void *)(*(void *)this + 16) - v4) >> 3))
    {
      return *(void *)(v4 + 8 * v3);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void MetricFileMetadataHelper::createMetadataForComponent(WISMetadataLoader **this@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  unint64_t v3 = *this;
  if (a2) {
    WISMetadataLoader::loadComponentMetadata(v3, a2, a3);
  }
  else {
    WISMetadataLoader::loadMetricFileMetadata(v3, a3);
  }
}

uint64_t sub_26389E7A4(uint64_t *a1, void *a2)
{
  uint64_t result = sub_26389E81C((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
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

uint64_t sub_26389E81C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
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
  sub_26389E8B4((uint64_t)v13);
  return v11;
}

uint64_t sub_26389E8B4(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_2638A252C((void *)a1);
  }
  return a1;
}

uint64_t sub_26389E8EC(uint64_t *a1, void *a2)
{
  uint64_t result = sub_26389E964((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
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

uint64_t sub_26389E964(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
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
  sub_26389E9FC((uint64_t)v13);
  return v11;
}

uint64_t sub_26389E9FC(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_2638A252C((void *)a1);
  }
  return a1;
}

uint64_t *sub_26389EA34(void *a1, unsigned int *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = *a2;
    if (*(void *)&v2 <= v3) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v5 = (v2.i32[0] - 1) & v3;
  }
  uint64_t v6 = *(uint64_t ***)(*a1 + 8 * v5);
  if (!v6) {
    return 0;
  }
  for (uint64_t result = *v6; result; uint64_t result = (uint64_t *)*result)
  {
    unint64_t v8 = result[1];
    if (v8 == v3)
    {
      if (*((_DWORD *)result + 4) == v3) {
        return result;
      }
    }
    else
    {
      if (v4.u32[0] > 1uLL)
      {
        if (v8 >= *(void *)&v2) {
          v8 %= *(void *)&v2;
        }
      }
      else
      {
        v8 &= *(void *)&v2 - 1;
      }
      if (v8 != v5) {
        return 0;
      }
    }
  }
  return result;
}

void WISMetadataLoader::loadMetricFileMetadata(WISMetadataLoader *this@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *((void *)this + 2);
  if (!v4)
  {
    (*(void (**)(long long *__return_ptr))(**(void **)this + 16))(&v8);
    long long v5 = v8;
    long long v8 = 0uLL;
    uint64_t v6 = (std::__shared_weak_count *)*((void *)this + 3);
    *((_OWORD *)this + 1) = v5;
    if (v6)
    {
      sub_26389F6D4(v6);
      if (*((void *)&v8 + 1)) {
        sub_26389F6D4(*((std::__shared_weak_count **)&v8 + 1));
      }
    }
    uint64_t v4 = *((void *)this + 2);
  }
  uint64_t v7 = *((void *)this + 3);
  *a2 = v4;
  a2[1] = v7;
  if (v7) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
  }
}

double WISMetadataLoader::loadComponentMetadata@<D0>(WISMetadataLoader *this@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  (*(void (**)(long long *__return_ptr, void, void, uint64_t))(**(void **)this + 32))(&v5, *(void *)this, *((unsigned int *)this + 2), a2);
  double result = *(double *)&v5;
  *a3 = v5;
  return result;
}

void BestChoiceMetadataLoaderDelegate::readComponentData(void *a1@<X0>, int a2@<W1>, unsigned int a3@<W2>, void *a4@<X8>)
{
  unsigned int v10 = a3;
  uint64_t v7 = a1 + 10;
  (*(void (**)(void *))(*a1 + 88))(a1);
  if (a2 == 1) {
    long long v8 = v7;
  }
  else {
    long long v8 = a1 + 5;
  }
  uint64_t v9 = sub_26389EA34(v8, &v10);
  if (v9)
  {
    sub_26389F1B8((unsigned __int8 *)v9[3], v9[4], a4);
  }
  else
  {
    *a4 = 0;
    a4[1] = 0;
  }
}

void *BestChoiceMetadataLoaderDelegate::ensureCacheReady(void *this)
{
  if (!this[8])
  {
    unint64_t v1 = this;
    uint64_t v2 = (*(uint64_t (**)(void *))(*this + 96))(this);
    unint64_t v3 = *(uint64_t (**)(void *, uint64_t))(*v1 + 104);
    return (void *)v3(v1, v2);
  }
  return this;
}

void *sub_26389ED18(uint64_t a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
    unsigned int v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      uint64_t v11 = *v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (*((_DWORD *)v11 + 4) == v7) {
              return v11;
            }
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8) {
                v12 %= v8;
              }
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4) {
              break;
            }
          }
          uint64_t v11 = (void *)*v11;
        }
        while (v11);
      }
    }
  }
  uint64_t v13 = (void *)(a1 + 16);
  uint64_t v11 = operator new(0x28uLL);
  *uint64_t v11 = 0;
  v11[1] = v7;
  *((_DWORD *)v11 + 4) = **a4;
  v11[3] = 0;
  v11[4] = 0;
  float v14 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v15 = *(float *)(a1 + 32);
  if (!v8 || (float)(v15 * (float)v8) < v14)
  {
    BOOL v16 = 1;
    if (v8 >= 3) {
      BOOL v16 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v17 = v16 | (2 * v8);
    unint64_t v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18) {
      size_t v19 = v18;
    }
    else {
      size_t v19 = v17;
    }
    sub_26389EF6C(a1, v19);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }
  uint64_t v20 = *(void *)a1;
  unint64_t v21 = *(void **)(*(void *)a1 + 8 * v4);
  if (v21)
  {
    *uint64_t v11 = *v21;
LABEL_38:
    *unint64_t v21 = v11;
    goto LABEL_39;
  }
  *uint64_t v11 = *v13;
  *uint64_t v13 = v11;
  *(void *)(v20 + 8 * v4) = v13;
  if (*v11)
  {
    unint64_t v22 = *(void *)(*v11 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v22 >= v8) {
        v22 %= v8;
      }
    }
    else
    {
      v22 &= v8 - 1;
    }
    unint64_t v21 = (void *)(*(void *)a1 + 8 * v22);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v11;
}

void sub_26389EF50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  sub_2638BEE54(v11, v10);
  _Unwind_Resume(a1);
}

void sub_26389EF6C(uint64_t a1, size_t __n)
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
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      sub_26389F05C(a1, prime);
    }
  }
}

void sub_26389F05C(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      sub_2638A24E0();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      uint64_t v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            *uint64_t v7 = *v11;
            *uint64_t v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            uint64_t v11 = v7;
          }
          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          uint64_t v11 = (void *)*v11;
          unint64_t v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    unsigned int v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

void sub_26389F1B8(unsigned __int8 *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  if (a1 && a2)
  {
    PB::Reader::Reader((PB::Reader *)&v7, a1);
    int8x8_t v4 = (std::__shared_weak_count *)operator new(0x50uLL);
    v4->__shared_owners_ = 0;
    v4->__shared_weak_owners_ = 0;
    v4->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EB74E8;
    double v5 = sub_26389F280((uint64_t)&v4[1]);
    *a3 = v6;
    a3[1] = v4;
    if ((((uint64_t (*)(double))v4[1].__on_zero_shared)(v5) & 1) == 0)
    {
      *a3 = 0;
      a3[1] = 0;
      sub_26389F6D4(v4);
    }
  }
  else
  {
    *a3 = 0;
    a3[1] = 0;
  }
}

void sub_26389F26C(_Unwind_Exception *a1)
{
  sub_26389F6D4(v1);
  _Unwind_Resume(a1);
}

double sub_26389F280(uint64_t a1)
{
  *(void *)a1 = &unk_270EB76E8;
  double result = 0.0;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  return result;
}

void sub_26389F2B0(int a1, void *__p)
{
  if (__p)
  {
    uint64_t v2 = __p;
    do
    {
      unint64_t v3 = (void *)*v2;
      int8x8_t v4 = (std::__shared_weak_count *)v2[4];
      if (v4) {
        sub_26389F6D4(v4);
      }
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

xpc_object_t sMetricToXpcTransform(uint64_t *a1, uint64_t a2, const unsigned __int8 *a3)
{
  xpc_object_t v6 = xpc_null_create();
  if (a2 && a3)
  {
    v24[0] = 0;
    v24[1] = 0;
    uint64_t v25 = 0;
    wis::GetProtobufTag(a2, a3, v24);
    v15[0] = 0;
    v15[1] = a2 + v24[0];
    v15[2] = a2 + v24[0] + (int)a3 - LODWORD(v24[0]);
    int v16 = a3 - LODWORD(v24[0]);
    uint64_t v17 = 0;
    __int16 v18 = 0;
    int v19 = a3 - LODWORD(v24[0]);
    long long v20 = xmmword_2638C8F60;
    int v21 = *MEMORY[0x263F8C738];
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    if (v7 || (xpc_object_t v7 = xpc_null_create()) != 0)
    {
      if (MEMORY[0x263E6D6E0](v7) == MEMORY[0x263EF8708])
      {
        xpc_retain(v7);
        xpc_object_t v8 = v7;
      }
      else
      {
        xpc_object_t v8 = xpc_null_create();
      }
    }
    else
    {
      xpc_object_t v8 = xpc_null_create();
      xpc_object_t v7 = 0;
    }
    xpc_release(v7);
    if (v8)
    {
      xpc_retain(v8);
      xpc_object_t v10 = v8;
    }
    else
    {
      xpc_object_t v10 = xpc_null_create();
    }
    uint64_t v11 = (std::__shared_weak_count *)a1[1];
    uint64_t v28 = *a1;
    unint64_t v29 = v11;
    if (v11) {
      atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    unsigned int v12 = v25;
    object.n128_u64[0] = (unint64_t)v10;
    if (v10) {
      xpc_retain(v10);
    }
    else {
      object.n128_u64[0] = (unint64_t)xpc_null_create();
    }
    sub_26389F9DC(&v30, (void **)&object);
    xpc_release((xpc_object_t)object.n128_u64[0]);
    object.n128_u64[0] = 0;
    MetricFileMetadataHelper::MetricFileMetadataHelper((uint64_t)&v31, &v28, v12);
    if (v29) {
      sub_26389F6D4(v29);
    }
    xpc_release(v10);
    while (!(_BYTE)v18)
    {
      __n128 object = 0uLL;
      uint64_t v27 = 0xFFFFFFFFLL;
      sub_26389FC68((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v15, &object, (uint64_t)&v30);
    }
    sub_26389B614((uint64_t)&v33);
    if (v32) {
      sub_26389F6D4(v32);
    }
    xpc_release(v30);
    xpc_object_t v13 = xpc_null_create();
    xpc_release(v13);
    MEMORY[0x263E6CFB0](v15);
    xpc_object_t v9 = v6;
    xpc_object_t v6 = v8;
  }
  else
  {
    xpc_object_t v9 = xpc_null_create();
  }
  xpc_release(v9);
  return v6;
}

void sub_26389F520(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,xpc_object_t object)
{
  xpc_release(v28);
  MEMORY[0x263E6CFB0](&a9);
  xpc_release(v27);
  _Unwind_Resume(a1);
}

uint64_t wis::GetProtobufTag@<X0>(uint64_t this@<X0>, const unsigned __int8 *a2@<X1>, void *a3@<X8>)
{
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  if (this)
  {
    int v3 = this;
    double v5 = (unsigned __int8 *)&a2[this];
    uint64_t v8 = this;
    unsigned int v6 = sub_26389F910(&v8, &a2[this]);
    if ((v6 & 7) != 2)
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x263E6D1C0](exception, &unk_2638C8ADA);
      __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
    *((_DWORD *)a3 + 4) = v6 >> 3;
    this = sub_26389F910(&v8, v5);
    *a3 = (v8 - v3);
    a3[1] = this;
  }
  return this;
}

void sub_26389F68C(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  __cxa_free_exception(v17);
  __cxa_begin_catch(a1);
  v16[1] = 0;
  v16[2] = 0;
  *int v16 = 0;
  __cxa_end_catch();
}

void sub_26389F6D4(std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

uint64_t MetricFileMetadataHelper::MetricFileMetadataHelper(uint64_t a1, void *a2, unsigned int a3)
{
  MetricFileMetadataHelper::MetricFileMetadataHelper((MetricFileMetadataHelper *)a1, a2);
  *(_OWORD *)(v5 + 16) = *(_OWORD *)(v5 + 80);
  *(void *)(v5 + 32) = *(void *)(v5 + 96);
  __n128 v8 = *(__n128 *)(v5 + 80);
  uint64_t v9 = *(void *)(v5 + 96);
  MetricFileMetadataHelper::resolveSubfieldInMetricHandle((MetricFileMetadataHelper *)v5, &v8, a3, (uint64_t)&v10);
  uint64_t v6 = v11;
  *(_OWORD *)(a1 + 16) = v10;
  *(void *)(a1 + 32) = v6;
  return a1;
}

{
  uint64_t v5;
  uint64_t v6;
  __n128 v8;
  uint64_t v9;
  long long v10;
  uint64_t v11;

  MetricFileMetadataHelper::MetricFileMetadataHelper((MetricFileMetadataHelper *)a1, a2);
  *(_OWORD *)(v5 + 16) = *(_OWORD *)(v5 + 80);
  *(void *)(v5 + 32) = *(void *)(v5 + 96);
  __n128 v8 = *(__n128 *)(v5 + 80);
  uint64_t v9 = *(void *)(v5 + 96);
  MetricFileMetadataHelper::resolveSubfieldInMetricHandle((MetricFileMetadataHelper *)v5, &v8, a3, (uint64_t)&v10);
  uint64_t v6 = v11;
  *(_OWORD *)(a1 + 16) = v10;
  *(void *)(a1 + 32) = v6;
  return a1;
}

void sub_26389F7C8(_Unwind_Exception *a1)
{
  sub_2638BEA30(v1);
  _Unwind_Resume(a1);
}

void MetricFileMetadataHelper::MetricFileMetadataHelper(MetricFileMetadataHelper *this, void *a2)
{
  uint64_t v3 = a2[1];
  *(void *)this = *a2;
  *((void *)this + 1) = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  *((void *)this + 4) = 0xFFFFFFFFLL;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *((_DWORD *)this + 18) = 1065353216;
  *((void *)this + 10) = 0;
  *((void *)this + 11) = 0;
  *((void *)this + 12) = 0xFFFFFFFFLL;
  *((void *)this + 2) = MetricFileMetadataHelper::getMetadataForComponent(this, 0);
  MetricFileMetadataHelper::setupMetricFileSentinel((__n128 *)this);
}

void sub_26389F864(_Unwind_Exception *a1)
{
  sub_26389B614(v2);
  int8x8_t v4 = *(std::__shared_weak_count **)(v1 + 8);
  if (v4) {
    sub_26389F6D4(v4);
  }
  _Unwind_Resume(a1);
}

double MetricFileMetadataHelper::setupMetricFileSentinel(__n128 *this)
{
  __n128 v8 = this[5];
  unint64_t v9 = this[6].n128_u64[0];
  MetricFileMetadataHelper::resolveSubfieldInMetricHandle((MetricFileMetadataHelper *)this, &v8, 0xFu, (uint64_t)&v10);
  __n128 v6 = v10;
  unint64_t v7 = v11;
  unint64_t v2 = v11;
  this[5] = v10;
  this[6].n128_u64[0] = v2;
  __n128 v4 = this[5];
  unint64_t v5 = v2;
  MetadataHelper::descendIntoMessage((uint64_t)this, (MetadataHandle *)&v4, (uint64_t)&v10);
  double result = v10.n128_f64[0];
  this[5] = v10;
  this[6].n128_u64[0] = v11;
  return result;
}

uint64_t sub_26389F910(void *a1, unsigned char *a2)
{
  unint64_t v2 = (unsigned char *)*a1;
  if ((unsigned char *)*a1 == a2) {
    goto LABEL_11;
  }
  uint64_t v3 = (unsigned char *)*a1;
  while ((char)*v3 < 0)
  {
    if (++v3 == a2)
    {
      uint64_t v3 = a2;
      break;
    }
  }
  if (v3 == a2)
  {
LABEL_11:
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x263E6D1C0](exception, &unk_2638C8ADA);
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
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

void sub_26389F9C8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void **sub_26389F9DC(void **a1, void **a2)
{
  uint64_t v3 = *a2;
  *a1 = *a2;
  if (v3) {
    xpc_retain(v3);
  }
  else {
    *a1 = xpc_null_create();
  }
  return a1;
}

void sub_26389FA20(xpc_object_t *a1, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2, long long *a3, unsigned int a4, long long *a5)
{
  long long v25 = *a3;
  uint64_t v26 = *((void *)a3 + 2);
  __n128 v10 = sub_2638A1CF8((uint64_t)a1, (MetadataHandle *)&v25, a4);
  xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
  if (v11 || (xpc_object_t v11 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x263E6D6E0](v11) == MEMORY[0x263EF8708])
    {
      xpc_retain(v11);
      xpc_object_t v12 = v11;
    }
    else
    {
      xpc_object_t v12 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v12 = xpc_null_create();
    xpc_object_t v11 = 0;
  }
  xpc_release(v11);
  xpc_object_t v13 = *a1;
  *a1 = xpc_null_create();
  xpc_object_t v14 = xpc_null_create();
  xpc_object_t v15 = *a1;
  *a1 = v12;
  xpc_release(v15);
  xpc_release(v14);
  while ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(a2) >= 1)
  {
    long long v23 = *a5;
    uint64_t v24 = *((void *)a5 + 2);
    sub_26389FC68(a2);
  }
  xpc_object_t v16 = *a1;
  *a1 = xpc_null_create();
  xpc_object_t v17 = xpc_null_create();
  xpc_object_t v18 = *a1;
  *a1 = v13;
  xpc_release(v18);
  xpc_object_t object = v16;
  if (v16) {
    xpc_retain(v16);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  long long v20 = *a3;
  uint64_t v21 = *((void *)a3 + 2);
  int v19 = sub_2638A1D7C((uint64_t)a1, (MetadataHandle *)&v20, a4);
  sub_2638A195C(a1, (uint64_t)v10, &object, v19);
  xpc_release(object);
  xpc_object_t object = 0;
  xpc_release(v16);
  xpc_release(v17);
}

void sub_26389FC28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object)
{
  xpc_release(object);
  xpc_release(v12);
  xpc_release(v13);
  _Unwind_Resume(a1);
}

void sub_26389FC68(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, __n128 *a2, uint64_t a3)
{
  __n128 v6 = (unsigned __int8 *)*((void *)this + 1);
  if ((unint64_t)v6 >= *((void *)this + 2) || (char)*v6 < 0)
  {
    unint64_t TagFallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(this);
    *((_DWORD *)this + 8) = TagFallback;
    if (TagFallback) {
      goto LABEL_4;
    }
LABEL_10:
    if (*((unsigned char *)this + 36)) {
      return;
    }
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x263E6D1C0](exception, "Parsing failed in metric");
    goto LABEL_243;
  }
  unint64_t TagFallback = *v6;
  *((_DWORD *)this + 8) = TagFallback;
  *((void *)this + 1) = v6 + 1;
  if (!TagFallback) {
    goto LABEL_10;
  }
LABEL_4:
  unint64_t v8 = wis::reflect::decodeTag((wis::reflect *)TagFallback);
  unsigned __int8 v9 = v8;
  __n128 v122 = *a2;
  unint64_t v123 = a2[1].n128_u64[0];
  *(void *)__val = HIDWORD(v8);
  MetricFileMetadataHelper::getSubfieldType((MetricFileMetadataHelper *)(a3 + 8), &v122, HIDWORD(v8), (uint64_t)&v124);
  long long v120 = v124;
  uint64_t v121 = v125;
  uint64_t BuiltinType = MetadataHelper::getBuiltinType(a3 + 8, (MetadataHandle *)&v120);
  int v11 = BuiltinType;
  uint64_t DecodingType = wis::reflect::getDecodingType(BuiltinType, v9);
  switch((int)DecodingType)
  {
    case 0:
      switch(v9)
      {
        case 0u:
          *(void *)v138 = 0;
          if (sub_2638A7CF4(this, (unint64_t *)v138)) {
            goto LABEL_145;
          }
          goto LABEL_118;
        case 1u:
          *(void *)v138 = 0;
          if (wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(this, (unint64_t *)v138))goto LABEL_118; {
LABEL_145:
          }
          uint64_t v63 = *(void *)v138;
          goto LABEL_148;
        case 2u:
          v135[0] = 0;
          if ((sub_2638A7D24(this, v135) & 1) == 0) {
            goto LABEL_118;
          }
          sub_2638AA7BC(v138, v135[0]);
          char Raw = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadRaw(this, *(void **)v138);
          if (Raw) {
            sub_2638B9D80((void *)a3, *(void **)v138, *(void *)&v138[2] - *(void *)v138, __val[0]);
          }
          goto LABEL_134;
        case 5u:
          v138[0] = 0;
          if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(this, v138))goto LABEL_118; {
          uint64_t v63 = v138[0];
          }
LABEL_148:
          sub_2638B9C80((void *)a3, v63, __val[0]);
          break;
        default:
          goto LABEL_118;
      }
      return;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
      unint64_t v137 = 0;
      switch(v9)
      {
        case 0u:
          xpc_object_t v13 = (char *)*((void *)this + 1);
          if ((unint64_t)v13 < *((void *)this + 2) && (*v13 & 0x80000000) == 0)
          {
            unint64_t v137 = *v13;
            *((void *)this + 1) = v13 + 1;
LABEL_74:
            unint64_t v40 = v137;
            switch(v11)
            {
              case 1:
              case 15:
                double v46 = wis::protobuf::NumberConverter<(wis::reflect::Type)1>::decode(v137);
                __n128 v128 = *a2;
                unint64_t v129 = a2[1].n128_u64[0];
                *(__n128 *)v138 = *a2;
                unint64_t v139 = a2[1].n128_u64[0];
                unint64_t v42 = (void *)a3;
                int v43 = sub_2638A1CF8(a3, (MetadataHandle *)v138, __val[0]);
                xpc_object_t v44 = xpc_null_create();
                if (v11 != 11)
                {
                  if (v11 == 12)
                  {
                    sub_2638BB00C(v46 != 0.0, v133);
                    int v47 = *(void **)v133;
                    *(void *)v133 = v44;
                    xpc_release(v44);
                    *(void *)v133 = 0;
                    xpc_object_t v44 = v47;
                  }
LABEL_172:
                  if (MEMORY[0x263E6D6E0](v44) == MEMORY[0x263EF8758])
                  {
                    sub_2638BB08C(&__p, v46);
                    uint64_t v70 = __p;
                    __p = v44;
                    xpc_release(v44);
                    __p = 0;
                    xpc_object_t v44 = v70;
                  }
                  xpc_object_t object = v44;
                  if (!v44)
                  {
LABEL_166:
                    xpc_object_t object = xpc_null_create();
                    goto LABEL_167;
                  }
LABEL_165:
                  xpc_retain(v44);
LABEL_167:
                  *(__n128 *)v135 = v128;
                  unint64_t v136 = v129;
                  int v68 = sub_2638A1D7C((uint64_t)v42, (MetadataHandle *)v135, __val[0]);
                  sub_2638A195C(v42, (uint64_t)v43, &object, v68);
                  xpc_release(object);
                  xpc_object_t object = 0;
                  xpc_release(v44);
                  return;
                }
                *(__n128 *)v133 = v128;
                unint64_t v134 = v129;
                sub_2638A2174((uint64_t)v42, (MetadataHandle *)v133, __val[0], (unint64_t)v46, v135);
                if (SHIBYTE(v136) < 0)
                {
                  if (!*(void *)&v135[2])
                  {
LABEL_171:
                    operator delete(*(void **)v135);
                    goto LABEL_172;
                  }
                  unint64_t v65 = *(unsigned int **)v135;
                }
                else
                {
                  if (!HIBYTE(v136)) {
                    goto LABEL_172;
                  }
                  unint64_t v65 = v135;
                }
                sub_26389B578((char *)v65, &v126);
                unsigned int v69 = (void *)v126.n128_u64[0];
                v126.n128_u64[0] = (unint64_t)v44;
                xpc_release(v44);
                v126.n128_u64[0] = 0;
                xpc_object_t v44 = v69;
                if ((SHIBYTE(v136) & 0x80000000) == 0) {
                  goto LABEL_172;
                }
                goto LABEL_171;
              case 2:
              case 16:
                float v41 = wis::protobuf::NumberConverter<(wis::reflect::Type)2>::decode(v137);
                __n128 v128 = *a2;
                unint64_t v129 = a2[1].n128_u64[0];
                *(__n128 *)v138 = *a2;
                unint64_t v139 = a2[1].n128_u64[0];
                unint64_t v42 = (void *)a3;
                int v43 = sub_2638A1CF8(a3, (MetadataHandle *)v138, __val[0]);
                xpc_object_t v44 = xpc_null_create();
                if (v11 != 11)
                {
                  if (v11 == 12)
                  {
                    sub_2638BB00C(v41 != 0.0, v133);
                    unint64_t v45 = *(void **)v133;
                    *(void *)v133 = v44;
                    xpc_release(v44);
                    *(void *)v133 = 0;
                    xpc_object_t v44 = v45;
                  }
LABEL_162:
                  if (MEMORY[0x263E6D6E0](v44) == MEMORY[0x263EF8758])
                  {
                    sub_2638BB0C8(&__p, v41);
                    uint64_t v67 = __p;
                    __p = v44;
                    xpc_release(v44);
                    __p = 0;
                    xpc_object_t v44 = v67;
                  }
                  xpc_object_t object = v44;
                  if (!v44) {
                    goto LABEL_166;
                  }
                  goto LABEL_165;
                }
                *(__n128 *)v133 = v128;
                unint64_t v134 = v129;
                sub_2638A2174((uint64_t)v42, (MetadataHandle *)v133, __val[0], (unint64_t)v41, v135);
                if (SHIBYTE(v136) < 0)
                {
                  if (!*(void *)&v135[2])
                  {
LABEL_161:
                    operator delete(*(void **)v135);
                    goto LABEL_162;
                  }
                  char v64 = *(unsigned int **)v135;
                }
                else
                {
                  if (!HIBYTE(v136)) {
                    goto LABEL_162;
                  }
                  char v64 = v135;
                }
                sub_26389B578((char *)v64, &v126);
                unint64_t v66 = (void *)v126.n128_u64[0];
                v126.n128_u64[0] = (unint64_t)v44;
                xpc_release(v44);
                v126.n128_u64[0] = 0;
                xpc_object_t v44 = v66;
                if ((SHIBYTE(v136) & 0x80000000) == 0) {
                  goto LABEL_162;
                }
                goto LABEL_161;
              case 3:
              case 11:
              case 17:
              case 25:
                *(void *)v135 = v137;
                goto LABEL_86;
              case 4:
              case 10:
              case 18:
              case 24:
                *(void *)v135 = v137;
                *(__n128 *)v138 = *a2;
                unint64_t v139 = a2[1].n128_u64[0];
                sub_26389BA48((void *)a3, (uint64_t *)v135, (long long *)v138, __val[0], v11);
                return;
              case 5:
              case 19:
                *(void *)v135 = wis::protobuf::NumberConverter<(wis::reflect::Type)5>::decode(v137);
LABEL_86:
                *(__n128 *)v138 = *a2;
                unint64_t v139 = a2[1].n128_u64[0];
                sub_26389B804((void *)a3, (uint64_t *)v135, (long long *)v138, __val[0], v11);
                return;
              case 6:
              case 20:
                v135[0] = v137;
                goto LABEL_88;
              case 7:
              case 9:
              case 21:
              case 23:
                v135[0] = v137;
                *(__n128 *)v138 = *a2;
                unint64_t v139 = a2[1].n128_u64[0];
                sub_2638A1718((void *)a3, v135, (long long *)v138, __val[0], v11);
                return;
              case 8:
              case 22:
                v135[0] = wis::protobuf::NumberConverter<(wis::reflect::Type)8>::decode(v137);
LABEL_88:
                *(__n128 *)v138 = *a2;
                unint64_t v139 = a2[1].n128_u64[0];
                sub_2638A1E3C((void *)a3, (int *)v135, (long long *)v138, __val[0], v11);
                return;
              case 12:
              case 26:
                *(__n128 *)v133 = *a2;
                unint64_t v134 = a2[1].n128_u64[0];
                *(__n128 *)v138 = *a2;
                unint64_t v139 = a2[1].n128_u64[0];
                BOOL v48 = (void *)a3;
                unint64_t v49 = sub_2638A1CF8(a3, (MetadataHandle *)v138, __val[0]);
                xpc_object_t v50 = xpc_null_create();
                if (v11 == 12)
                {
                  sub_2638BB00C(v40 != 0, &v128);
                  uint64_t v51 = (void *)v128.n128_u64[0];
                  v128.n128_u64[0] = (unint64_t)v50;
                  xpc_release(v50);
                  v128.n128_u64[0] = 0;
                  xpc_object_t v50 = v51;
                }
                if (MEMORY[0x263E6D6E0](v50) == MEMORY[0x263EF8758])
                {
                  sub_2638A2080(v40 != 0, &v126);
                  char v52 = (void *)v126.n128_u64[0];
                  v126.n128_u64[0] = (unint64_t)v50;
                  xpc_release(v50);
                  v126.n128_u64[0] = 0;
                  xpc_object_t v50 = v52;
                }
                __p = v50;
                if (v50) {
                  xpc_retain(v50);
                }
                else {
                  __p = xpc_null_create();
                }
                *(_OWORD *)v135 = *(_OWORD *)v133;
                unint64_t v136 = v134;
                int v62 = sub_2638A1D7C((uint64_t)v48, (MetadataHandle *)v135, __val[0]);
                sub_2638A195C(v48, (uint64_t)v49, &__p, v62);
                xpc_release(__p);
                __p = 0;
                xpc_release(v50);
                return;
              default:
                exception = __cxa_allocate_exception(0x10uLL);
                MEMORY[0x263E6D1C0](exception, "This should never happen, no matter what the input!");
                goto LABEL_243;
            }
          }
          if (wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(this, &v137)) {
            goto LABEL_74;
          }
          if (!__val[0] && *((unsigned char *)this + 36)) {
            return;
          }
          break;
        case 1u:
          if (wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(this, &v137)) {
            goto LABEL_74;
          }
          if (__val[0] || !*((unsigned char *)this + 36)) {
            break;
          }
          return;
        case 2u:
          if (__val[0] || !*((unsigned char *)this + 36)) {
            break;
          }
          return;
        case 5u:
          v138[0] = 0;
          if (wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(this, v138))
          {
            unint64_t v137 = v138[0];
            goto LABEL_74;
          }
          if (!__val[0] && *((unsigned char *)this + 36)) {
            return;
          }
          break;
        default:
          goto LABEL_74;
      }
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x263E6D1C0](exception, "Parsing failed in metric");
      goto LABEL_243;
    case 13:
      v135[0] = 0;
      char v36 = (char *)*((void *)this + 1);
      if ((unint64_t)v36 >= *((void *)this + 2) || *v36 < 0)
      {
        if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, v135))goto LABEL_118; {
      }
        }
      else
      {
        v135[0] = *v36;
        *((void *)this + 1) = v36 + 1;
      }
      memset(v138, 0, sizeof(v138));
      unint64_t v139 = 0;
      char Raw = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadString();
      if (Raw)
      {
        __n128 v112 = *a2;
        unint64_t v113 = a2[1].n128_u64[0];
        sub_26389B650((void *)a3, (char *)v138, (long long *)&v112, __val[0]);
      }
      if (SHIBYTE(v139) < 0)
      {
        unint64_t v58 = *(void **)v138;
LABEL_136:
        operator delete(v58);
      }
LABEL_137:
      if ((Raw & 1) == 0) {
        goto LABEL_118;
      }
      return;
    case 14:
      v135[0] = 0;
      unint64_t v38 = (char *)*((void *)this + 1);
      if ((unint64_t)v38 >= *((void *)this + 2) || *v38 < 0)
      {
        if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, v135))goto LABEL_118; {
        unsigned int v39 = v135[0];
        }
      }
      else
      {
        unsigned int v39 = *v38;
        v135[0] = v39;
        *((void *)this + 1) = v38 + 1;
      }
      sub_2638AA7BC(v138, v39);
      char Raw = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadRaw(this, *(void **)v138);
      if (Raw)
      {
        __n128 v110 = *a2;
        unint64_t v111 = a2[1].n128_u64[0];
        sub_2638B9BB0((void *)a3, (uint64_t)v138, (long long *)&v110, __val[0]);
      }
LABEL_134:
      unint64_t v58 = *(void **)v138;
      if (!*(void *)v138) {
        goto LABEL_137;
      }
      *(void *)&v138[2] = *(void *)v138;
      goto LABEL_136;
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
      unsigned int v119 = 0;
      xpc_object_t v15 = (char *)*((void *)this + 1);
      if ((unint64_t)v15 >= *((void *)this + 2) || *v15 < 0)
      {
        if ((wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, &v119) & 1) == 0) {
          goto LABEL_118;
        }
      }
      else
      {
        unsigned int v119 = *v15;
        *((void *)this + 1) = v15 + 1;
      }
      unint64_t v103 = (void *)a3;
      int UnpackedType = wis::reflect::getUnpackedType(DecodingType);
      int WireTypeForType = wis::reflect::getWireTypeForType(UnpackedType);
      xpc_object_t object = this;
      int v118 = wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(this);
      __p = 0;
      unint64_t v115 = 0;
      char v116 = 0;
      while (1)
      {
        int v17 = wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(this);
        if (v17 < 1) {
          break;
        }
        xpc_object_t v18 = v115;
        if (v115 >= v116)
        {
          long long v20 = (char *)__p;
          uint64_t v21 = (v115 - (unsigned char *)__p) >> 3;
          unint64_t v22 = v21 + 1;
          if ((unint64_t)(v21 + 1) >> 61) {
            sub_2638A2514();
          }
          uint64_t v23 = v116 - (unsigned char *)__p;
          if ((v116 - (unsigned char *)__p) >> 2 > v22) {
            unint64_t v22 = v23 >> 2;
          }
          if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v24 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v24 = v22;
          }
          if (v24)
          {
            long long v25 = (char *)sub_26389E00C((uint64_t)&v116, v24);
            long long v20 = (char *)__p;
            xpc_object_t v18 = v115;
          }
          else
          {
            long long v25 = 0;
          }
          uint64_t v26 = &v25[8 * v21];
          *(void *)uint64_t v26 = 0;
          int v19 = v26 + 8;
          while (v18 != v20)
          {
            uint64_t v27 = *((void *)v18 - 1);
            v18 -= 8;
            *((void *)v26 - 1) = v27;
            v26 -= 8;
          }
          __p = v26;
          unint64_t v115 = v19;
          char v116 = &v25[8 * v24];
          if (v20) {
            operator delete(v20);
          }
        }
        else
        {
          *(void *)unint64_t v115 = 0;
          int v19 = v18 + 8;
        }
        unint64_t v115 = v19;
        switch(WireTypeForType)
        {
          case 0:
            uint64_t v28 = (unint64_t *)(v19 - 8);
            unint64_t v29 = (char *)*((void *)this + 1);
            if ((unint64_t)v29 >= *((void *)this + 2) || *v29 < 0)
            {
              char Varint64Fallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(this, v28);
LABEL_42:
              if ((Varint64Fallback & 1) == 0) {
                goto LABEL_115;
              }
            }
            else
            {
              *uint64_t v28 = *v29;
              *((void *)this + 1) = v29 + 1;
            }
            break;
          case 1:
            char Varint64Fallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(this, (unint64_t *)v19 - 1);
            goto LABEL_42;
          case 2:
            goto LABEL_115;
          case 5:
            v138[0] = 0;
            char LittleEndian32Fallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(this, v138);
            *((void *)v115 - 1) = v138[0];
            if ((LittleEndian32Fallback & 1) == 0) {
              goto LABEL_115;
            }
            continue;
          default:
            continue;
        }
      }
      break;
    case 27:
      v133[0] = 0;
      unint64_t v37 = (char *)*((void *)this + 1);
      if ((unint64_t)v37 >= *((void *)this + 2) || *v37 < 0)
      {
        if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, v133))goto LABEL_118; {
      }
        }
      else
      {
        v133[0] = *v37;
        *((void *)this + 1) = v37 + 1;
      }
      *(void *)v138 = this;
      v138[2] = wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(this);
      ++*((_DWORD *)this + 14);
      *(void *)v135 = this;
      __n128 v108 = *a2;
      unint64_t v109 = a2[1].n128_u64[0];
      long long v106 = v124;
      uint64_t v107 = v125;
      sub_26389FA20((xpc_object_t *)a3, this, (long long *)&v108, __val[0], &v106);
      sub_26389B53C((wireless_diagnostics::google::protobuf::io::CodedInputStream **)v135);
      int v59 = *((_DWORD *)this + 14);
      BOOL v60 = __OFSUB__(v59, 1);
      int v61 = v59 - 1;
      if (v61 < 0 == v60) {
        *((_DWORD *)this + 14) = v61;
      }
      sub_2638A2140((wireless_diagnostics::google::protobuf::io::CodedInputStream **)v138);
      return;
    default:
      goto LABEL_118;
  }
  char v32 = (void *)a3;
  switch((int)DecodingType)
  {
    case 15:
      sub_2638A9784((uint64_t *)&__p, &v128);
      __n128 v126 = *a2;
      unint64_t v127 = a2[1].n128_u64[0];
      *(__n128 *)v138 = *a2;
      unint64_t v139 = a2[1].n128_u64[0];
      uint64_t v33 = sub_2638A1CF8(a3, (MetadataHandle *)v138, __val[0]);
      xpc_object_t v34 = xpc_array_create(0, 0);
      if (v34 || (xpc_object_t v34 = xpc_null_create()) != 0)
      {
        if (MEMORY[0x263E6D6E0](v34) == MEMORY[0x263EF86D8])
        {
          xpc_retain(v34);
          xpc_object_t v35 = v34;
        }
        else
        {
          xpc_object_t v35 = xpc_null_create();
        }
      }
      else
      {
        xpc_object_t v35 = xpc_null_create();
        xpc_object_t v34 = 0;
      }
      xpc_release(v34);
      uint64_t v83 = (double *)v128.n128_u64[1];
      unint64_t v82 = (double *)v128.n128_u64[0];
      if (v128.n128_u64[0] == v128.n128_u64[1]) {
        goto LABEL_218;
      }
      uint64_t v84 = MEMORY[0x263EF8758];
      while (1)
      {
        double v85 = *v82;
        xpc_object_t v86 = xpc_null_create();
        if (UnpackedType != 11)
        {
          if (UnpackedType == 12)
          {
            sub_2638BB00C(v85 != 0.0, &v137);
            unint64_t v87 = v137;
            unint64_t v137 = (unint64_t)v86;
            xpc_release(v86);
            unint64_t v137 = 0;
            xpc_object_t v86 = (xpc_object_t)v87;
          }
          goto LABEL_215;
        }
        *(__n128 *)v133 = v126;
        unint64_t v134 = v127;
        sub_2638A2174((uint64_t)v103, (MetadataHandle *)v133, __val[0], (unint64_t)v85, v135);
        if (SHIBYTE(v136) < 0)
        {
          if (!*(void *)&v135[2]) {
            goto LABEL_214;
          }
          char v88 = *(unsigned int **)v135;
        }
        else
        {
          if (!HIBYTE(v136)) {
            goto LABEL_215;
          }
          char v88 = v135;
        }
        sub_26389B578((char *)v88, &v132);
        unint64_t v89 = v132;
        xpc_object_t v132 = v86;
        xpc_release(v86);
        xpc_object_t v132 = 0;
        xpc_object_t v86 = v89;
        if (SHIBYTE(v136) < 0) {
LABEL_214:
        }
          operator delete(*(void **)v135);
LABEL_215:
        if (MEMORY[0x263E6D6E0](v86) == v84)
        {
          sub_2638BB08C(&v131, v85);
          unint64_t v90 = v131;
          xpc_object_t v131 = v86;
          xpc_release(v86);
          xpc_object_t v131 = 0;
          xpc_object_t v86 = v90;
        }
        xpc_array_append_value(v35, v86);
        xpc_release(v86);
        if (++v82 == v83)
        {
LABEL_218:
          xpc_object_t v130 = v35;
          if (!v35)
          {
LABEL_238:
            xpc_object_t v130 = xpc_null_create();
LABEL_239:
            *(__n128 *)v135 = v126;
            unint64_t v136 = v127;
            int v100 = sub_2638A1D7C((uint64_t)v103, (MetadataHandle *)v135, __val[0]);
            sub_2638A195C(v103, (uint64_t)v33, &v130, v100);
            xpc_release(v130);
            xpc_object_t v130 = 0;
            xpc_release(v35);
            char v56 = (void *)v128.n128_u64[0];
            if (v128.n128_u64[0])
            {
              v128.n128_u64[1] = v128.n128_u64[0];
              goto LABEL_114;
            }
            goto LABEL_115;
          }
LABEL_237:
          xpc_retain(v35);
          goto LABEL_239;
        }
      }
    case 16:
      sub_2638A9A5C((uint64_t *)&__p, &v128);
      __n128 v126 = *a2;
      unint64_t v127 = a2[1].n128_u64[0];
      *(__n128 *)v138 = *a2;
      unint64_t v139 = a2[1].n128_u64[0];
      uint64_t v33 = sub_2638A1CF8(a3, (MetadataHandle *)v138, __val[0]);
      xpc_object_t v55 = xpc_array_create(0, 0);
      if (v55 || (xpc_object_t v55 = xpc_null_create()) != 0)
      {
        if (MEMORY[0x263E6D6E0](v55) == MEMORY[0x263EF86D8])
        {
          xpc_retain(v55);
          xpc_object_t v35 = v55;
        }
        else
        {
          xpc_object_t v35 = xpc_null_create();
        }
      }
      else
      {
        xpc_object_t v35 = xpc_null_create();
        xpc_object_t v55 = 0;
      }
      xpc_release(v55);
      char v92 = (float *)v128.n128_u64[1];
      uint64_t v91 = (float *)v128.n128_u64[0];
      if (v128.n128_u64[0] == v128.n128_u64[1]) {
        goto LABEL_236;
      }
      uint64_t v93 = MEMORY[0x263EF8758];
      while (1)
      {
        float v94 = *v91;
        xpc_object_t v95 = xpc_null_create();
        if (UnpackedType != 11)
        {
          if (UnpackedType == 12)
          {
            sub_2638BB00C(v94 != 0.0, &v137);
            unint64_t v96 = v137;
            unint64_t v137 = (unint64_t)v95;
            xpc_release(v95);
            unint64_t v137 = 0;
            xpc_object_t v95 = (xpc_object_t)v96;
          }
          goto LABEL_233;
        }
        *(__n128 *)v133 = v126;
        unint64_t v134 = v127;
        sub_2638A2174((uint64_t)v103, (MetadataHandle *)v133, __val[0], (unint64_t)v94, v135);
        if (SHIBYTE(v136) < 0)
        {
          if (!*(void *)&v135[2]) {
            goto LABEL_232;
          }
          char v97 = *(unsigned int **)v135;
        }
        else
        {
          if (!HIBYTE(v136)) {
            goto LABEL_233;
          }
          char v97 = v135;
        }
        sub_26389B578((char *)v97, &v132);
        unsigned int v98 = v132;
        xpc_object_t v132 = v95;
        xpc_release(v95);
        xpc_object_t v132 = 0;
        xpc_object_t v95 = v98;
        if (SHIBYTE(v136) < 0) {
LABEL_232:
        }
          operator delete(*(void **)v135);
LABEL_233:
        if (MEMORY[0x263E6D6E0](v95) == v93)
        {
          sub_2638BB0C8(&v131, v94);
          unint64_t v99 = v131;
          xpc_object_t v131 = v95;
          xpc_release(v95);
          xpc_object_t v131 = 0;
          xpc_object_t v95 = v99;
        }
        xpc_array_append_value(v35, v95);
        xpc_release(v95);
        if (++v91 == v92)
        {
LABEL_236:
          xpc_object_t v130 = v35;
          if (!v35) {
            goto LABEL_238;
          }
          goto LABEL_237;
        }
      }
    case 17:
    case 25:
      sub_2638A9700((uint64_t *)&__p, v138);
      *(__n128 *)v135 = *a2;
      unint64_t v136 = a2[1].n128_u64[0];
      sub_2638BA470((void *)a3, (uint64_t **)v138, (long long *)v135, __val[0], UnpackedType);
      goto LABEL_112;
    case 18:
    case 24:
      sub_2638A9700((uint64_t *)&__p, v138);
      *(__n128 *)v135 = *a2;
      unint64_t v136 = a2[1].n128_u64[0];
      sub_2638B9E58((void *)a3, (uint64_t **)v138, (long long *)v135, __val[0], UnpackedType);
      goto LABEL_112;
    case 19:
      sub_2638A9D34((uint64_t *)&__p, v138);
      *(__n128 *)v135 = *a2;
      unint64_t v136 = a2[1].n128_u64[0];
      sub_2638BA470((void *)a3, (uint64_t **)v138, (long long *)v135, __val[0], UnpackedType);
      goto LABEL_112;
    case 20:
      sub_2638A99D8((uint64_t *)&__p, v138);
      *(__n128 *)v135 = *a2;
      unint64_t v136 = a2[1].n128_u64[0];
      sub_2638BA77C((void *)a3, (int **)v138, (long long *)v135, __val[0], UnpackedType);
      goto LABEL_112;
    case 21:
    case 23:
      sub_2638A99D8((uint64_t *)&__p, v138);
      *(__n128 *)v135 = *a2;
      unint64_t v136 = a2[1].n128_u64[0];
      sub_2638BA164((void *)a3, (unsigned int **)v138, (long long *)v135, __val[0], UnpackedType);
      goto LABEL_112;
    case 22:
      sub_2638A9F88((uint64_t *)&__p, v138);
      *(__n128 *)v135 = *a2;
      unint64_t v136 = a2[1].n128_u64[0];
      sub_2638BA77C((void *)a3, (int **)v138, (long long *)v135, __val[0], UnpackedType);
LABEL_112:
      char v56 = *(void **)v138;
      if (!*(void *)v138) {
        goto LABEL_115;
      }
      *(void *)&v138[2] = *(void *)v138;
      goto LABEL_114;
    case 26:
      sub_2638A9AE4((uint64_t)&__p, &v128);
      __n128 v126 = *a2;
      unint64_t v127 = a2[1].n128_u64[0];
      *(__n128 *)v138 = *a2;
      unint64_t v139 = a2[1].n128_u64[0];
      unsigned int v102 = sub_2638A1CF8(a3, (MetadataHandle *)v138, __val[0]);
      xpc_object_t v53 = xpc_array_create(0, 0);
      if (v53 || (xpc_object_t v53 = xpc_null_create()) != 0)
      {
        if (MEMORY[0x263E6D6E0](v53) == MEMORY[0x263EF86D8])
        {
          xpc_retain(v53);
          xpc_object_t v54 = v53;
        }
        else
        {
          xpc_object_t v54 = xpc_null_create();
        }
      }
      else
      {
        xpc_object_t v54 = xpc_null_create();
        xpc_object_t v53 = 0;
      }
      xpc_release(v53);
      unint64_t v71 = (void *)v128.n128_u64[0];
      int v72 = v128.n128_u8[8] & 0x3F;
      if (v128.n128_u64[1] <= 0x3F && (v128.n128_u8[8] & 0x3F) == 0) {
        goto LABEL_197;
      }
      int v73 = 0;
      unint64_t v74 = (void *)(v128.n128_u64[0] + 8 * (v128.n128_u64[1] >> 6));
      break;
    default:
      char v101 = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x263E6D1C0](v101, "This should never happen, no matter what the input!");
      __cxa_throw(v101, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  do
  {
    xpc_object_t v75 = xpc_null_create();
    uint64_t v76 = 1 << v73;
    if (UnpackedType == 11)
    {
      *(__n128 *)v133 = v126;
      unint64_t v134 = v127;
      sub_2638A2174((uint64_t)v103, (MetadataHandle *)v133, __val[0], (*v71 >> v73) & 1, v135);
      if (SHIBYTE(v136) < 0)
      {
        if (!*(void *)&v135[2])
        {
LABEL_189:
          operator delete(*(void **)v135);
          goto LABEL_190;
        }
        uint64_t v78 = *(unsigned int **)v135;
      }
      else
      {
        if (!HIBYTE(v136)) {
          goto LABEL_190;
        }
        uint64_t v78 = v135;
      }
      sub_26389B578((char *)v78, &v132);
      unint64_t v79 = v132;
      xpc_object_t v132 = v75;
      xpc_release(v75);
      xpc_object_t v132 = 0;
      xpc_object_t v75 = v79;
      if ((SHIBYTE(v136) & 0x80000000) == 0) {
        goto LABEL_190;
      }
      goto LABEL_189;
    }
    if (UnpackedType == 12)
    {
      sub_2638BB00C((*v71 & v76) != 0, &v137);
      unint64_t v77 = v137;
      unint64_t v137 = (unint64_t)v75;
      xpc_release(v75);
      unint64_t v137 = 0;
      xpc_object_t v75 = (xpc_object_t)v77;
    }
LABEL_190:
    if (MEMORY[0x263E6D6E0](v75) == MEMORY[0x263EF8758])
    {
      sub_2638A2080((*v71 & v76) != 0, &v131);
      char v80 = v131;
      xpc_object_t v131 = v75;
      xpc_release(v75);
      xpc_object_t v131 = 0;
      xpc_object_t v75 = v80;
    }
    xpc_array_append_value(v54, v75);
    xpc_release(v75);
    v71 += v73 == 63;
    if (v73 == 63) {
      int v73 = 0;
    }
    else {
      ++v73;
    }
    char v32 = v103;
  }
  while (v71 != v74 || v73 != v72);
LABEL_197:
  xpc_object_t v130 = v54;
  if (v54) {
    xpc_retain(v54);
  }
  else {
    xpc_object_t v130 = xpc_null_create();
  }
  *(__n128 *)v135 = v126;
  unint64_t v136 = v127;
  int v81 = sub_2638A1D7C((uint64_t)v32, (MetadataHandle *)v135, __val[0]);
  sub_2638A195C(v32, (uint64_t)v102, &v130, v81);
  xpc_release(v130);
  xpc_object_t v130 = 0;
  xpc_release(v54);
  char v56 = (void *)v128.n128_u64[0];
  if (v128.n128_u64[0]) {
LABEL_114:
  }
    operator delete(v56);
LABEL_115:
  if (__p)
  {
    unint64_t v115 = (char *)__p;
    operator delete(__p);
  }
  wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)object);
  if (v17 > 0)
  {
LABEL_118:
    if (!__val[0] && *((unsigned char *)this + 36)) {
      return;
    }
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x263E6D1C0](exception, "Parsing failed in metric");
LABEL_243:
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
}

void sub_2638A1364(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30,uint64_t a31,xpc_object_t object)
{
  if (*(char *)(v33 - 153) < 0) {
    operator delete(*(void **)(v33 - 176));
  }
  xpc_release(v32);
  _Unwind_Resume(a1);
}

void sub_2638A1718(void *a1, _DWORD *a2, long long *a3, unsigned int a4, int a5)
{
  long long v27 = *a3;
  uint64_t v28 = *((void *)a3 + 2);
  __n128 v10 = sub_2638A1CF8((uint64_t)a1, (MetadataHandle *)&v27, a4);
  xpc_object_t v11 = xpc_null_create();
  if (a5 == 11)
  {
    long long v22 = *a3;
    uint64_t v23 = *((void *)a3 + 2);
    sub_2638A2174((uint64_t)a1, (MetadataHandle *)&v22, a4, *a2, __p);
    if (v25 < 0)
    {
      if (!__p[1])
      {
LABEL_10:
        operator delete(__p[0]);
        goto LABEL_11;
      }
      xpc_object_t v13 = (char *)__p[0];
    }
    else
    {
      if (!v25) {
        goto LABEL_11;
      }
      xpc_object_t v13 = (char *)__p;
    }
    sub_26389B578(v13, &v21);
    xpc_object_t v14 = v21;
    xpc_object_t v21 = v11;
    xpc_release(v11);
    xpc_object_t v21 = 0;
    xpc_object_t v11 = v14;
    if ((v25 & 0x80000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (a5 == 12)
  {
    sub_2638BB00C(*a2 != 0, &v26);
    xpc_object_t v12 = v26;
    xpc_object_t v26 = v11;
    xpc_release(v11);
    xpc_object_t v26 = 0;
    xpc_object_t v11 = v12;
  }
LABEL_11:
  if (MEMORY[0x263E6D6E0](v11) == MEMORY[0x263EF8758])
  {
    sub_2638A1DFC(*a2, &v20);
    xpc_object_t v15 = v20;
    xpc_object_t v20 = v11;
    xpc_release(v11);
    xpc_object_t v20 = 0;
    xpc_object_t v11 = v15;
  }
  xpc_object_t object = v11;
  if (v11) {
    xpc_retain(v11);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  long long v17 = *a3;
  uint64_t v18 = *((void *)a3 + 2);
  int v16 = sub_2638A1D7C((uint64_t)a1, (MetadataHandle *)&v17, a4);
  sub_2638A195C(a1, (uint64_t)v10, &object, v16);
  xpc_release(object);
  xpc_object_t object = 0;
  xpc_release(v11);
}

void sub_2638A18F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0) {
    operator delete(__p);
  }
  xpc_release(v24);
  _Unwind_Resume(a1);
}

void sub_2638A195C(void *a1, uint64_t a2, xpc_object_t *a3, int a4)
{
  if (a4)
  {
    xpc_object_t v22 = a1;
    uint64_t v23 = a2;
    sub_26389B768((uint64_t)&v22, &v24);
    uint64_t v7 = MEMORY[0x263E6D6E0](v24);
    uint64_t v8 = MEMORY[0x263EF86D8];
    if (v7 != MEMORY[0x263EF86D8])
    {
      xpc_object_t v9 = xpc_array_create(0, 0);
      if (v9 || (xpc_object_t v9 = xpc_null_create()) != 0)
      {
        if (MEMORY[0x263E6D6E0](v9) == v8)
        {
          xpc_retain(v9);
          xpc_object_t v10 = v9;
        }
        else
        {
          xpc_object_t v10 = xpc_null_create();
        }
      }
      else
      {
        xpc_object_t v10 = xpc_null_create();
        xpc_object_t v9 = 0;
      }
      xpc_release(v9);
      xpc_object_t v12 = xpc_null_create();
      xpc_object_t v13 = v24;
      xpc_object_t v24 = v10;
      xpc_release(v13);
      xpc_release(v12);
      xpc_object_t v20 = v24;
      if (v24) {
        xpc_retain(v24);
      }
      else {
        xpc_object_t v20 = xpc_null_create();
      }
      xpc_object_t v22 = a1;
      uint64_t v23 = a2;
      sub_26389B5C8((uint64_t)&v22, &v20, &v21);
      xpc_release(v21);
      xpc_object_t v21 = 0;
      xpc_release(v20);
      xpc_object_t v20 = 0;
    }
    xpc_object_t v14 = *a3;
    if (*a3 && MEMORY[0x263E6D6E0](*a3) == v8) {
      xpc_retain(v14);
    }
    else {
      xpc_object_t v14 = xpc_null_create();
    }
    if (MEMORY[0x263E6D6E0](v14) == v8)
    {
      xpc_object_t v22 = v14;
      if (v14) {
        xpc_retain(v14);
      }
      else {
        xpc_object_t v22 = xpc_null_create();
      }
      sub_2638BB14C(v19, &v22, 0);
      xpc_release(v22);
      xpc_object_t v22 = v14;
      if (v14) {
        xpc_retain(v14);
      }
      else {
        xpc_object_t v22 = xpc_null_create();
      }
      if (MEMORY[0x263E6D6E0](v14) == v8) {
        count = (void *)xpc_array_get_count(v14);
      }
      else {
        count = 0;
      }
      sub_2638BB14C(v18, &v22, count);
      xpc_release(v22);
      sub_2638BAF14(v19, v18, &v24);
      xpc_release(v18[0]);
      v18[0] = 0;
      xpc_release(v19[0]);
      v19[0] = 0;
    }
    else
    {
      xpc_array_append_value(v24, *a3);
    }
    xpc_release(v14);
    xpc_release(v24);
  }
  else
  {
    xpc_object_t v11 = *a3;
    xpc_object_t v16 = v11;
    if (v11) {
      xpc_retain(v11);
    }
    else {
      xpc_object_t v16 = xpc_null_create();
    }
    xpc_object_t v22 = a1;
    uint64_t v23 = a2;
    sub_2638A1CAC((uint64_t)&v22, &v16, &object);
    xpc_release(object);
    xpc_object_t object = 0;
    xpc_release(v16);
  }
}

void sub_2638A1BF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object, uint64_t a13, xpc_object_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  xpc_release(object);
  xpc_release(a14);
  xpc_release(v18);
  xpc_release(*(xpc_object_t *)(v19 - 56));
  _Unwind_Resume(a1);
}

xpc_object_t sub_2638A1CAC@<X0>(uint64_t a1@<X0>, xpc_object_t *a2@<X1>, xpc_object_t *a3@<X8>)
{
  xpc_dictionary_set_value(**(xpc_object_t **)a1, *(const char **)(a1 + 8), *a2);
  *a3 = *a2;
  xpc_object_t result = xpc_null_create();
  *a2 = result;
  return result;
}

char *sub_2638A1CF8(uint64_t a1, MetadataHandle *a2, unsigned int a3)
{
  __n128 v6 = *(__n128 *)a2;
  uint64_t v7 = *((void *)a2 + 2);
  MetricFileMetadataHelper::getSubfieldType((MetricFileMetadataHelper *)(a1 + 8), &v6, a3, (uint64_t)&v8);
  *(_OWORD *)a2 = v8;
  *((void *)a2 + 2) = v9;
  uint64_t Field = MetadataHandle::getField(a2);
  if (!Field) {
    return (char *)&unk_2638C8ADA;
  }
  xpc_object_t result = *(char **)(Field + 8);
  if (!result) {
    return (char *)&unk_2638C8ADA;
  }
  if (result[23] < 0) {
    return *(char **)result;
  }
  return result;
}

uint64_t sub_2638A1D7C(uint64_t a1, MetadataHandle *a2, unsigned int a3)
{
  __n128 v5 = *(__n128 *)a2;
  uint64_t v6 = *((void *)a2 + 2);
  MetricFileMetadataHelper::getSubfieldType((MetricFileMetadataHelper *)(a1 + 8), &v5, a3, (uint64_t)&v7);
  *(_OWORD *)a2 = v7;
  *((void *)a2 + 2) = v8;
  uint64_t result = MetadataHandle::getField(a2);
  if (result) {
    return (*(_WORD *)(result + 52) & 0x400) != 0 && *(unsigned char *)(result + 50) != 0;
  }
  return result;
}

xpc_object_t sub_2638A1DFC@<X0>(int64_t value@<X1>, void *a2@<X8>)
{
  xpc_object_t result = xpc_int64_create(value);
  *a2 = result;
  if (!result)
  {
    xpc_object_t result = xpc_null_create();
    *a2 = result;
  }
  return result;
}

void sub_2638A1E3C(void *a1, int *a2, long long *a3, unsigned int a4, int a5)
{
  long long v27 = *a3;
  uint64_t v28 = *((void *)a3 + 2);
  xpc_object_t v10 = sub_2638A1CF8((uint64_t)a1, (MetadataHandle *)&v27, a4);
  xpc_object_t v11 = xpc_null_create();
  if (a5 == 11)
  {
    long long v22 = *a3;
    uint64_t v23 = *((void *)a3 + 2);
    sub_2638A2174((uint64_t)a1, (MetadataHandle *)&v22, a4, *a2, __p);
    if (v25 < 0)
    {
      if (!__p[1])
      {
LABEL_10:
        operator delete(__p[0]);
        goto LABEL_11;
      }
      xpc_object_t v13 = (char *)__p[0];
    }
    else
    {
      if (!v25) {
        goto LABEL_11;
      }
      xpc_object_t v13 = (char *)__p;
    }
    sub_26389B578(v13, &v21);
    xpc_object_t v14 = v21;
    xpc_object_t v21 = v11;
    xpc_release(v11);
    xpc_object_t v21 = 0;
    xpc_object_t v11 = v14;
    if ((v25 & 0x80000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (a5 == 12)
  {
    sub_2638BB00C(*a2 != 0, &v26);
    xpc_object_t v12 = v26;
    xpc_object_t v26 = v11;
    xpc_release(v11);
    xpc_object_t v26 = 0;
    xpc_object_t v11 = v12;
  }
LABEL_11:
  if (MEMORY[0x263E6D6E0](v11) == MEMORY[0x263EF8758])
  {
    sub_2638A2080(*a2, &v20);
    xpc_object_t v15 = v20;
    xpc_object_t v20 = v11;
    xpc_release(v11);
    xpc_object_t v20 = 0;
    xpc_object_t v11 = v15;
  }
  xpc_object_t object = v11;
  if (v11) {
    xpc_retain(v11);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  long long v17 = *a3;
  uint64_t v18 = *((void *)a3 + 2);
  int v16 = sub_2638A1D7C((uint64_t)a1, (MetadataHandle *)&v17, a4);
  sub_2638A195C(a1, (uint64_t)v10, &object, v16);
  xpc_release(object);
  xpc_object_t object = 0;
  xpc_release(v11);
}

void sub_2638A201C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0) {
    operator delete(__p);
  }
  xpc_release(v24);
  _Unwind_Resume(a1);
}

xpc_object_t sub_2638A2080@<X0>(int a1@<W1>, void *a2@<X8>)
{
  xpc_object_t result = xpc_int64_create(a1);
  *a2 = result;
  if (!result)
  {
    xpc_object_t result = xpc_null_create();
    *a2 = result;
  }
  return result;
}

uint64_t wis::reflect::encodeTag(char a1, int a2)
{
  return a1 & 7 | (8 * a2);
}

uint64_t wis::GetProtobufTag@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return wis::GetProtobufTag(*a1, (const unsigned __int8 *)(a1[1] - *a1), a2);
}

uint64_t sub_2638A20DC(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

xpc_object_t sub_2638A2100@<X0>(uint64_t value@<X1>, void *a2@<X8>)
{
  xpc_object_t result = xpc_uint64_create(value);
  *a2 = result;
  if (!result)
  {
    xpc_object_t result = xpc_null_create();
    *a2 = result;
  }
  return result;
}

wireless_diagnostics::google::protobuf::io::CodedInputStream **sub_2638A2140(wireless_diagnostics::google::protobuf::io::CodedInputStream **a1)
{
  return a1;
}

void *sub_2638A2174@<X0>(uint64_t a1@<X0>, MetadataHandle *a2@<X1>, unsigned int a3@<W2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  __n128 v15 = *(__n128 *)a2;
  uint64_t v16 = *((void *)a2 + 2);
  MetricFileMetadataHelper::getSubfieldType((MetricFileMetadataHelper *)(a1 + 8), &v15, a3, (uint64_t)&v17);
  *(_OWORD *)a2 = v17;
  *((void *)a2 + 2) = v18;
  xpc_object_t result = (void *)MetadataHandle::getEnum(a2);
  if (!result) {
    return sub_2638A5294(a5, (char *)&unk_2638C8ADA);
  }
  uint64_t v9 = (uint64_t *)result[1];
  xpc_object_t v10 = (uint64_t *)result[2];
  if (v9 == v10) {
    return sub_2638A5294(a5, (char *)&unk_2638C8ADA);
  }
  while (1)
  {
    uint64_t v11 = *v9;
    uint64_t v12 = (*(unsigned char *)(*v9 + 32) & 2) != 0 ? 24 : 16;
    if (*(void *)(v11 + v12) == a4) {
      break;
    }
    if (++v9 == v10) {
      return sub_2638A5294(a5, (char *)&unk_2638C8ADA);
    }
  }
  xpc_object_t v13 = *(long long **)(v11 + 8);
  if (*((char *)v13 + 23) < 0) {
    return sub_2638A2398(a5, *(void **)v13, *((void *)v13 + 1));
  }
  long long v14 = *v13;
  a5[2] = *((void *)v13 + 2);
  *(_OWORD *)a5 = v14;
  return result;
}

void sub_2638A2268(void *a1)
{
}

uint64_t sub_2638A2280(void *a1, PB::TextFormatter *this, char *a3)
{
  PB::TextFormatter::beginObject(this, a3);
  __n128 v5 = (uint64_t *)a1[1];
  uint64_t v6 = (uint64_t *)a1[2];
  while (v5 != v6)
  {
    uint64_t v7 = *v5++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v7 + 32))(v7, this, "enum_names");
  }
  if (a1[4]) {
    PB::TextFormatter::format();
  }

  return MEMORY[0x270F587F0](this);
}

uint64_t sub_2638A2338(uint64_t result, PB::Writer *this)
{
  uint64_t v3 = result;
  if (*(void *)(result + 32)) {
    xpc_object_t result = PB::Writer::write();
  }
  __n128 v5 = *(const PB::Base ***)(v3 + 8);
  int v4 = *(const PB::Base ***)(v3 + 16);
  while (v5 != v4)
  {
    uint64_t v6 = *v5++;
    xpc_object_t result = PB::Writer::writeSubmessage(this, v6);
  }
  return result;
}

void *sub_2638A2398(unsigned char *__dst, void *__src, unint64_t a3)
{
  __n128 v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8) {
      sub_2638A2438();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    uint64_t v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000;
    *__n128 v5 = v8;
    __n128 v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }

  return memmove(v5, __src, a3 + 1);
}

void sub_2638A2438()
{
}

void sub_2638A2450(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_2638A24AC(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2655D7EC0, MEMORY[0x263F8C060]);
}

void sub_2638A2498(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_2638A24AC(std::logic_error *a1, const char *a2)
{
  xpc_object_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void sub_2638A24E0()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void sub_2638A2514()
{
}

void *sub_2638A252C(void *result)
{
  uint64_t v1 = *(void ***)(result[2] + 8);
  unint64_t v2 = *(void ***)(result[1] + 8);
  while (v1 != v2)
  {
    xpc_object_t result = *v1;
    *uint64_t v1 = 0;
    if (result) {
      xpc_object_t result = (void *)(*(uint64_t (**)(void *))(*result + 8))(result);
    }
    ++v1;
  }
  return result;
}

uint64_t sDumpMetricFile@<X0>(long long *a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, int a4@<W3>, void *a5@<X8>)
{
  v18[0] = 0;
  v18[1] = a2;
  xpc_object_t v18[2] = a2 + a3;
  int v19 = a3;
  uint64_t v20 = 0;
  __int16 v21 = 0;
  long long v23 = xmmword_2638C8F60;
  int v6 = *MEMORY[0x263F8C738];
  int v22 = a3;
  int v24 = v6;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  switch(a4)
  {
    case 1:
      __n128 v14 = 0uLL;
      uint64_t v15 = 0xFFFFFFFFLL;
      v12[0] = 1;
      sub_2638A2760(&v14, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)v18, v12, a1, a5);
      break;
    case 2:
      __n128 v10 = 0uLL;
      uint64_t v11 = 0xFFFFFFFFLL;
      sub_2638A2850(&v10, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)v18, a1, (uint64_t)v12);
      sub_2638A2948((uint64_t)v12, 2, 0x20u, 0, 0, a5);
      goto LABEL_5;
    case 3:
      __n128 v8 = 0uLL;
      uint64_t v9 = 0xFFFFFFFFLL;
      sub_2638A2850(&v8, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)v18, a1, (uint64_t)v12);
      sub_2638A2948((uint64_t)v12, -1, 0x20u, 0, 0, a5);
LABEL_5:
      sub_2638A5C4C(&v13, v12[0]);
      break;
    default:
      __n128 v16 = 0uLL;
      uint64_t v17 = 0xFFFFFFFFLL;
      v12[0] = 0;
      sub_2638A2760(&v16, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)v18, v12, a1, a5);
      break;
  }
  return MEMORY[0x263E6CFB0](v18);
}

void sub_2638A2718(_Unwind_Exception *a1)
{
  MEMORY[0x263E6CFB0](v1 - 96);
  _Unwind_Resume(a1);
}

void sub_2638A2760(__n128 *a1@<X0>, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2@<X1>, char *a3@<X2>, long long *a4@<X3>, void *a5@<X8>)
{
  *a5 = 0;
  a5[1] = 0;
  a5[2] = 0;
  char v7 = *a3;
  long long v10 = *a4;
  *(void *)a4 = 0;
  *((void *)a4 + 1) = 0;
  v11[0] = a5;
  v11[1] = 0;
  MetricFileMetadataHelper::MetricFileMetadataHelper((MetricFileMetadataHelper *)&v12, &v10);
  v14[64] = v7;
  if (*((void *)&v10 + 1)) {
    sub_26389F6D4(*((std::__shared_weak_count **)&v10 + 1));
  }
  while (!*((unsigned char *)a2 + 36))
  {
    __n128 v8 = *a1;
    unint64_t v9 = a1[1].n128_u64[0];
    sub_2638A6638(a2, &v8, (uint64_t)v11);
  }
  sub_26389B614((uint64_t)v14);
  if (v13) {
    sub_26389F6D4(v13);
  }
}

void sub_2638A2818(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::__shared_weak_count *a14, char a15)
{
  if (a14) {
    sub_26389F6D4(a14);
  }
  if (*(char *)(v15 + 23) < 0) {
    operator delete(*(void **)v15);
  }
  _Unwind_Resume(exception_object);
}

void sub_2638A2850(__n128 *a1@<X0>, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2@<X1>, long long *a3@<X2>, uint64_t a4@<X8>)
{
  sub_2638ABF5C(a4, 0, 0, 0, 1);
  long long v10 = *a3;
  *(void *)a3 = 0;
  *((void *)a3 + 1) = 0;
  uint64_t v11 = a4;
  MetricFileMetadataHelper::MetricFileMetadataHelper((MetricFileMetadataHelper *)&v12, &v10);
  if (*((void *)&v10 + 1)) {
    sub_26389F6D4(*((std::__shared_weak_count **)&v10 + 1));
  }
  while (!*((unsigned char *)a2 + 36))
  {
    __n128 v8 = *a1;
    unint64_t v9 = a1[1].n128_u64[0];
    sub_2638AA874(a2, &v8, &v11);
  }
  sub_26389B614((uint64_t)&v14);
  if (v13) {
    sub_26389F6D4(v13);
  }
}

void sub_2638A2914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::__shared_weak_count *a14)
{
  if (a14) {
    sub_26389F6D4(a14);
  }
  sub_2638A5C4C(v14 + 1, *(unsigned __int8 *)v14);
  _Unwind_Resume(a1);
}

uint64_t sub_2638A2948@<X0>(uint64_t a1@<X0>, int a2@<W1>, unsigned int a3@<W2>, uint64_t a4@<X3>, int a5@<W4>, void *a6@<X8>)
{
  v16[80] = *(uint64_t **)MEMORY[0x263EF8340];
  *a6 = 0;
  a6[1] = 0;
  a6[2] = 0;
  uint64_t v12 = (std::__shared_weak_count *)operator new(0x28uLL);
  v12->__shared_owners_ = 0;
  v12->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EB6308;
  v12->__shared_weak_owners_ = 0;
  v12[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_270EB6358;
  v12[1].__shared_owners_ = (uint64_t)a6;
  uint64_t v14 = v12 + 1;
  uint64_t v15 = v12;
  atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
  sub_2638A42E4((uint64_t)v16, (uint64_t)&v14, a3, a5);
  if (v15) {
    sub_26389F6D4(v15);
  }
  sub_26389F6D4(v12);
  sub_2638A327C(v16, a1, a2 >= 0, a4, a2 & ~(a2 >> 31), 0);
  return sub_2638A5C0C((uint64_t)v16);
}

void sub_2638A2A80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  sub_2638A5C0C((uint64_t)va);
  if (*(char *)(v4 + 23) < 0) {
    operator delete(*(void **)v4);
  }
  _Unwind_Resume(a1);
}

uint64_t sDumpMetricLog@<X0>(long long *a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, int a4@<W3>, void *a5@<X8>)
{
  v18[0] = 0;
  v18[1] = a2;
  xpc_object_t v18[2] = a2 + a3;
  int v19 = a3;
  uint64_t v20 = 0;
  __int16 v21 = 0;
  long long v23 = xmmword_2638C8F60;
  int v6 = *MEMORY[0x263F8C738];
  int v22 = a3;
  int v24 = v6;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  switch(a4)
  {
    case 1:
      __n128 v14 = 0uLL;
      uint64_t v15 = 0xFFFFFFFFLL;
      v12[0] = 1;
      sub_2638A2C94(&v14, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)v18, v12, a1, a5);
      break;
    case 2:
      __n128 v10 = 0uLL;
      uint64_t v11 = 0xFFFFFFFFLL;
      sub_2638A2D84(&v10, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)v18, a1, (uint64_t)v12);
      sub_2638A2948((uint64_t)v12, 2, 0x20u, 0, 0, a5);
      goto LABEL_5;
    case 3:
      __n128 v8 = 0uLL;
      uint64_t v9 = 0xFFFFFFFFLL;
      sub_2638A2D84(&v8, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)v18, a1, (uint64_t)v12);
      sub_2638A2948((uint64_t)v12, -1, 0x20u, 0, 0, a5);
LABEL_5:
      sub_2638A5C4C(&v13, v12[0]);
      break;
    default:
      __n128 v16 = 0uLL;
      uint64_t v17 = 0xFFFFFFFFLL;
      v12[0] = 0;
      sub_2638A2C94(&v16, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)v18, v12, a1, a5);
      break;
  }
  return MEMORY[0x263E6CFB0](v18);
}

void sub_2638A2C4C(_Unwind_Exception *a1)
{
  MEMORY[0x263E6CFB0](v1 - 96);
  _Unwind_Resume(a1);
}

void sub_2638A2C94(__n128 *a1@<X0>, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2@<X1>, char *a3@<X2>, long long *a4@<X3>, void *a5@<X8>)
{
  *a5 = 0;
  a5[1] = 0;
  a5[2] = 0;
  char v7 = *a3;
  long long v10 = *a4;
  *(void *)a4 = 0;
  *((void *)a4 + 1) = 0;
  v11[0] = a5;
  v11[1] = 0;
  MetricFileMetadataHelper::MetricFileMetadataHelper((MetricFileMetadataHelper *)&v12, &v10);
  v14[64] = v7;
  if (*((void *)&v10 + 1)) {
    sub_26389F6D4(*((std::__shared_weak_count **)&v10 + 1));
  }
  while (!*((unsigned char *)a2 + 36))
  {
    __n128 v8 = *a1;
    unint64_t v9 = a1[1].n128_u64[0];
    sub_2638A6638(a2, &v8, (uint64_t)v11);
  }
  sub_26389B614((uint64_t)v14);
  if (v13) {
    sub_26389F6D4(v13);
  }
}

void sub_2638A2D4C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::__shared_weak_count *a14, char a15)
{
  if (a14) {
    sub_26389F6D4(a14);
  }
  if (*(char *)(v15 + 23) < 0) {
    operator delete(*(void **)v15);
  }
  _Unwind_Resume(exception_object);
}

void sub_2638A2D84(__n128 *a1@<X0>, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2@<X1>, long long *a3@<X2>, uint64_t a4@<X8>)
{
  sub_2638ABF5C(a4, 0, 0, 0, 1);
  long long v10 = *a3;
  *(void *)a3 = 0;
  *((void *)a3 + 1) = 0;
  uint64_t v11 = a4;
  MetricFileMetadataHelper::MetricFileMetadataHelper((MetricFileMetadataHelper *)&v12, &v10);
  if (*((void *)&v10 + 1)) {
    sub_26389F6D4(*((std::__shared_weak_count **)&v10 + 1));
  }
  while (!*((unsigned char *)a2 + 36))
  {
    __n128 v8 = *a1;
    unint64_t v9 = a1[1].n128_u64[0];
    sub_2638AA874(a2, &v8, &v11);
  }
  sub_26389B614((uint64_t)&v14);
  if (v13) {
    sub_26389F6D4(v13);
  }
}

void sub_2638A2E48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::__shared_weak_count *a14)
{
  if (a14) {
    sub_26389F6D4(a14);
  }
  sub_2638A5C4C(v14 + 1, *(unsigned __int8 *)v14);
  _Unwind_Resume(a1);
}

uint64_t sDumpDeviceConfiguration@<X0>(long long *a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, int a4@<W3>, void *a5@<X8>)
{
  v18[0] = 0;
  v18[1] = a2;
  xpc_object_t v18[2] = a2 + a3;
  int v19 = a3;
  uint64_t v20 = 0;
  __int16 v21 = 0;
  long long v23 = xmmword_2638C8F60;
  int v6 = *MEMORY[0x263F8C738];
  int v22 = a3;
  int v24 = v6;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  switch(a4)
  {
    case 1:
      __n128 v14 = 0uLL;
      uint64_t v15 = 0xFFFFFFFFLL;
      v12[0] = 1;
      sub_2638A3048(&v14, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)v18, v12, a1, a5);
      break;
    case 2:
      __n128 v10 = 0uLL;
      uint64_t v11 = 0xFFFFFFFFLL;
      sub_2638A3184(&v10, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)v18, a1, (uint64_t)v12);
      sub_2638A2948((uint64_t)v12, 2, 0x20u, 0, 0, a5);
      goto LABEL_5;
    case 3:
      __n128 v8 = 0uLL;
      uint64_t v9 = 0xFFFFFFFFLL;
      sub_2638A3184(&v8, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)v18, a1, (uint64_t)v12);
      sub_2638A2948((uint64_t)v12, -1, 0x20u, 0, 0, a5);
LABEL_5:
      sub_2638A5C4C(&v13, v12[0]);
      break;
    default:
      __n128 v16 = 0uLL;
      uint64_t v17 = 0xFFFFFFFFLL;
      v12[0] = 0;
      sub_2638A3048(&v16, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)v18, v12, a1, a5);
      break;
  }
  return MEMORY[0x263E6CFB0](v18);
}

void sub_2638A3000(_Unwind_Exception *a1)
{
  MEMORY[0x263E6CFB0](v1 - 96);
  _Unwind_Resume(a1);
}

void sub_2638A3048(__n128 *a1@<X0>, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2@<X1>, char *a3@<X2>, long long *a4@<X3>, void *a5@<X8>)
{
  *a5 = 0;
  a5[1] = 0;
  a5[2] = 0;
  char v7 = *a3;
  long long v10 = *a4;
  *(void *)a4 = 0;
  *((void *)a4 + 1) = 0;
  v11[0] = a5;
  v11[1] = 0;
  DeviceConfigMetadataHelper::DeviceConfigMetadataHelper((uint64_t)&v12, (uint64_t)&v10);
  char v15 = v7;
  MetricFileMetadataHelper::MetricFileMetadataHelper((MetricFileMetadataHelper *)&v16, &v10);
  if (*((void *)&v10 + 1)) {
    sub_26389F6D4(*((std::__shared_weak_count **)&v10 + 1));
  }
  while (!*((unsigned char *)a2 + 36))
  {
    __n128 v8 = *a1;
    unint64_t v9 = a1[1].n128_u64[0];
    sub_2638AFC70(a2, &v8, (uint64_t)v11);
  }
  sub_26389B614((uint64_t)&v18);
  if (v17) {
    sub_26389F6D4(v17);
  }
  if (v14) {
    sub_26389F6D4(v14);
  }
  if (v13) {
    sub_26389F6D4(v13);
  }
}

void sub_2638A312C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::__shared_weak_count *a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, std::__shared_weak_count *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,std::__shared_weak_count *a24)
{
  if (a24) {
    sub_26389F6D4(a24);
  }
  if (a19) {
    sub_26389F6D4(a19);
  }
  if (a14) {
    sub_26389F6D4(a14);
  }
  if (*(char *)(v24 + 23) < 0) {
    operator delete(*(void **)v24);
  }
  _Unwind_Resume(exception_object);
}

void sub_2638A3184(__n128 *a1@<X0>, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2@<X1>, long long *a3@<X2>, uint64_t a4@<X8>)
{
  sub_2638ABF5C(a4, 0, 0, 0, 1);
  long long v10 = *a3;
  *(void *)a3 = 0;
  *((void *)a3 + 1) = 0;
  uint64_t v11 = a4;
  DeviceConfigMetadataHelper::DeviceConfigMetadataHelper((uint64_t)&v12, (uint64_t)&v10);
  if (*((void *)&v10 + 1)) {
    sub_26389F6D4(*((std::__shared_weak_count **)&v10 + 1));
  }
  while (!*((unsigned char *)a2 + 36))
  {
    __n128 v8 = *a1;
    unint64_t v9 = a1[1].n128_u64[0];
    sub_2638B3254(a2, &v8, &v11);
  }
  if (v14) {
    sub_26389F6D4(v14);
  }
  if (v13) {
    sub_26389F6D4(v13);
  }
}

void sub_2638A3248(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::__shared_weak_count *a14)
{
  if (a14) {
    sub_26389F6D4(a14);
  }
  sub_2638A5C4C(v14 + 1, *(unsigned __int8 *)v14);
  _Unwind_Resume(a1);
}

uint64_t **sub_2638A327C(uint64_t **result, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  long long v10 = result;
  switch(*(unsigned char *)a2)
  {
    case 0:
      uint64_t v11 = *(uint64_t (**)(void))(**result + 8);
      goto LABEL_71;
    case 1:
      uint64_t v12 = **result;
      if (!*(void *)(*(void *)(a2 + 8) + 16))
      {
        unint64_t v40 = *(uint64_t (**)(void))(v12 + 8);
        goto LABEL_44;
      }
      if (!a3)
      {
        (*(void (**)(void))v12)();
        float v41 = *(void **)(a2 + 8);
        unint64_t v42 = (void *)*v41;
        if (v41[2] == 1)
        {
          int v43 = (void *)*v41;
        }
        else
        {
          unint64_t v60 = 0;
          do
          {
            (*(void (**)(uint64_t *, uint64_t))**v10)(*v10, 34);
            sub_2638A442C((uint64_t)v10, v42 + 4, a4);
            (*(void (**)(uint64_t *, const char *, uint64_t))(**v10 + 8))(*v10, "\":", 2);
            sub_2638A327C(v10, v42 + 7, 0, a4, a5, a6);
            (*(void (**)(void))**v10)();
            int v61 = (void *)v42[1];
            if (v61)
            {
              do
              {
                int v43 = v61;
                int v61 = (void *)*v61;
              }
              while (v61);
            }
            else
            {
              do
              {
                int v43 = (void *)v42[2];
                BOOL v58 = *v43 == (void)v42;
                unint64_t v42 = v43;
              }
              while (!v58);
            }
            ++v60;
            unint64_t v42 = v43;
          }
          while (v60 < *(void *)(*(void *)(a2 + 8) + 16) - 1);
        }
        (*(void (**)(uint64_t *, uint64_t))**v10)(*v10, 34);
        sub_2638A442C((uint64_t)v10, v43 + 4, a4);
        (*(void (**)(uint64_t *, const char *, uint64_t))(**v10 + 8))(*v10, "\":", 2);
        sub_2638A327C(v10, v43 + 7, 0, a4, a5, a6);
        goto LABEL_97;
      }
      (*(void (**)(void))(v12 + 8))();
      unsigned int v13 = a6 + a5;
      __n128 v14 = v10 + 76;
      if (*((char *)v10 + 631) < 0)
      {
        unint64_t v15 = (unint64_t)v10[77];
        if (v15 >= v13) {
          goto LABEL_7;
        }
      }
      else
      {
        unint64_t v15 = *((unsigned __int8 *)v10 + 631);
        if (v13 <= v15) {
          goto LABEL_7;
        }
      }
      std::string::resize((std::string *)(v10 + 76), 2 * v15, 32);
LABEL_7:
      uint64_t v16 = *(void **)(a2 + 8);
      uint64_t v17 = (void *)*v16;
      if (v16[2] == 1)
      {
        uint64_t v18 = (void *)*v16;
      }
      else
      {
        unint64_t v55 = 0;
        do
        {
          char v56 = (void ***)(v10 + 76);
          if (*((char *)v10 + 631) < 0) {
            char v56 = (void ***)*v14;
          }
          (*(void (**)(uint64_t *, void ***, void))(**v10 + 8))(*v10, v56, (a6 + a5));
          (*(void (**)(void))**v10)();
          sub_2638A442C((uint64_t)v10, v17 + 4, a4);
          (*(void (**)(uint64_t *, const char *, uint64_t))(**v10 + 8))(*v10, "\": ", 3);
          sub_2638A327C(v10, v17 + 7, 1, a4, a5, (a6 + a5));
          (*(void (**)(uint64_t *, const char *, uint64_t))(**v10 + 8))(*v10, ",\n", 2);
          unint64_t v57 = (void *)v17[1];
          if (v57)
          {
            do
            {
              uint64_t v18 = v57;
              unint64_t v57 = (void *)*v57;
            }
            while (v57);
          }
          else
          {
            do
            {
              uint64_t v18 = (void *)v17[2];
              BOOL v58 = *v18 == (void)v17;
              uint64_t v17 = v18;
            }
            while (!v58);
          }
          ++v55;
          uint64_t v17 = v18;
        }
        while (v55 < *(void *)(*(void *)(a2 + 8) + 16) - 1);
      }
      int v59 = (void ***)(v10 + 76);
      if (*((char *)v10 + 631) < 0) {
        int v59 = (void ***)*v14;
      }
      (*(void (**)(uint64_t *, void ***, void))(**v10 + 8))(*v10, v59, (a6 + a5));
      (*(void (**)(void))**v10)();
      sub_2638A442C((uint64_t)v10, v18 + 4, a4);
      (*(void (**)(uint64_t *, const char *, uint64_t))(**v10 + 8))(*v10, "\": ", 3);
      sub_2638A327C(v10, v18 + 7, 1, a4, a5, (a6 + a5));
      (*(void (**)(void))**v10)();
      xpc_object_t v54 = *(void (**)(void))(**v10 + 8);
      goto LABEL_88;
    case 2:
      int v19 = (void (**)(void))**result;
      if (**(void **)(a2 + 8) != *(void *)(*(void *)(a2 + 8) + 8))
      {
        if (!a3)
        {
          (*v19)();
          xpc_object_t v44 = *(uint64_t **)(a2 + 8);
          for (uint64_t i = *v44; i != v44[1] - 16; i += 16)
          {
            sub_2638A327C(v10, i, 0, a4, a5, a6);
            (*(void (**)(void))**v10)();
            xpc_object_t v44 = *(uint64_t **)(a2 + 8);
          }
          sub_2638A327C(v10, i, 0, a4, a5, a6);
LABEL_58:
          uint64_t v11 = *(uint64_t (**)(void))**v10;
          goto LABEL_98;
        }
        v19[1]();
        unsigned int v20 = a6 + a5;
        __int16 v21 = v10 + 76;
        if (*((char *)v10 + 631) < 0)
        {
          unint64_t v22 = (unint64_t)v10[77];
          if (v22 >= v20) {
            goto LABEL_13;
          }
        }
        else
        {
          unint64_t v22 = *((unsigned __int8 *)v10 + 631);
          if (v20 <= v22)
          {
LABEL_13:
            long long v23 = *(uint64_t **)(a2 + 8);
            uint64_t v24 = *v23;
            if (*v23 != v23[1] - 16)
            {
              do
              {
                uint64_t v25 = (void ***)(v10 + 76);
                if (*((char *)v10 + 631) < 0) {
                  uint64_t v25 = (void ***)*v21;
                }
                (*(void (**)(uint64_t *, void ***, void))(**v10 + 8))(*v10, v25, (a6 + a5));
                sub_2638A327C(v10, v24, 1, a4, a5, (a6 + a5));
                (*(void (**)(uint64_t *, const char *, uint64_t))(**v10 + 8))(*v10, ",\n", 2);
                v24 += 16;
              }
              while (v24 != *(void *)(*(void *)(a2 + 8) + 8) - 16);
            }
            uint64_t v26 = (void ***)(v10 + 76);
            if (*((char *)v10 + 631) < 0) {
              uint64_t v26 = (void ***)*v21;
            }
            (*(void (**)(uint64_t *, void ***, void))(**v10 + 8))(*v10, v26, (a6 + a5));
            sub_2638A327C(v10, *(void *)(*(void *)(a2 + 8) + 8) - 16, 1, a4, a5, (a6 + a5));
            (*(void (**)(void))**v10)();
            if (*((char *)v10 + 631) < 0) {
              __int16 v21 = (void *)*v21;
            }
            (*(void (**)(uint64_t *, void *, void))(**v10 + 8))(*v10, v21, a6);
            goto LABEL_58;
          }
        }
        std::string::resize((std::string *)(v10 + 76), 2 * v22, 32);
        goto LABEL_13;
      }
      unint64_t v40 = (uint64_t (*)(void))v19[1];
LABEL_44:
      return (uint64_t **)v40();
    case 3:
      (*(void (**)(void))**result)();
      sub_2638A442C((uint64_t)v10, *(uint64_t **)(a2 + 8), a4);
      uint64_t v11 = *(uint64_t (**)(void))**v10;
      goto LABEL_98;
    case 4:
      uint64_t v11 = *(uint64_t (**)(void))(**result + 8);
      goto LABEL_71;
    case 5:
      unint64_t v27 = *(void *)(a2 + 8);
      return (uint64_t **)sub_2638A4B80(result, v27);
    case 6:
      unint64_t v28 = *(void *)(a2 + 8);
      return (uint64_t **)sub_2638A4D70(result, v28);
    case 7:
      double v29 = *(double *)(a2 + 8);
      return (uint64_t **)sub_2638A4EC8((const char *)result, v29);
    case 8:
      xpc_object_t v30 = *(void (**)(void))(**result + 8);
      if (a3)
      {
        v30();
        uint64_t v31 = (a6 + a5);
        char v32 = v10 + 76;
        if (*((char *)v10 + 631) < 0)
        {
          unint64_t v33 = (unint64_t)v10[77];
          if (v33 >= v31)
          {
            xpc_object_t v34 = (uint64_t (***)(void))*v10;
LABEL_61:
            xpc_object_t v35 = (void ***)*v32;
            goto LABEL_62;
          }
        }
        else
        {
          unint64_t v33 = *((unsigned __int8 *)v10 + 631);
          if (v31 <= v33)
          {
            xpc_object_t v34 = (uint64_t (***)(void))*v10;
            xpc_object_t v35 = (void ***)(v10 + 76);
LABEL_62:
            ((void (*)(uint64_t (***)(void), void ***, uint64_t))(*v34)[1])(v34, v35, v31);
            (*(void (**)(uint64_t *, const char *, uint64_t))(**v10 + 8))(*v10, "\"bytes\": [", 10);
            BOOL v48 = *(unsigned __int8 ***)(a2 + 8);
            xpc_object_t v50 = *v48;
            unint64_t v49 = v48[1];
            if (v50 != v49)
            {
              if (v50 != v49 - 1)
              {
                do
                {
                  unsigned int v51 = *v50++;
                  sub_2638A4AA4((uint64_t)v10, v51);
                  (*(void (**)(uint64_t *, const char *, uint64_t))(**v10 + 8))(*v10, ", ", 2);
                }
                while (v50 != (unsigned __int8 *)(*(void *)(*(void *)(a2 + 8) + 8) - 1));
              }
              sub_2638A4AA4((uint64_t)v10, *v50);
            }
            (*(void (**)(uint64_t *, const char *, uint64_t))(**v10 + 8))(*v10, "],\n", 3);
            char v52 = (void ***)(v10 + 76);
            if (*((char *)v10 + 631) < 0) {
              char v52 = (void ***)*v32;
            }
            (*(void (**)(uint64_t *, void ***, uint64_t))(**v10 + 8))(*v10, v52, v31);
            (*(void (**)(uint64_t *, const char *, uint64_t))(**v10 + 8))(*v10, "\"subtype\": ", 11);
            uint64_t v53 = *(void *)(a2 + 8);
            if (*(unsigned char *)(v53 + 25)) {
              sub_2638A4AA4((uint64_t)v10, *(unsigned __int8 *)(v53 + 24));
            }
            else {
              (*(void (**)(uint64_t *, const char *, uint64_t))(**v10 + 8))(*v10, "null", 4);
            }
            (*(void (**)(uint64_t *, uint64_t))**v10)(*v10, 10);
            xpc_object_t v54 = *(void (**)(void))(**v10 + 8);
LABEL_88:
            v54();
LABEL_97:
            uint64_t v11 = *(uint64_t (**)(void))**v10;
LABEL_98:
            return (uint64_t **)v11();
          }
        }
        std::string::resize((std::string *)(v10 + 76), 2 * v33, 32);
        xpc_object_t v34 = (uint64_t (***)(void))*v10;
        xpc_object_t v35 = (void ***)(v10 + 76);
        if ((*((char *)v10 + 631) & 0x80000000) == 0) {
          goto LABEL_62;
        }
        goto LABEL_61;
      }
      v30();
      char v36 = *(unsigned __int8 ***)(a2 + 8);
      unint64_t v38 = *v36;
      unint64_t v37 = v36[1];
      if (v38 != v37)
      {
        while (v38 != v37 - 1)
        {
          unsigned int v39 = *v38++;
          sub_2638A4AA4((uint64_t)v10, v39);
          (*(void (**)(uint64_t *, uint64_t))**v10)(*v10, 44);
          unint64_t v37 = *(unsigned __int8 **)(*(void *)(a2 + 8) + 8);
        }
        sub_2638A4AA4((uint64_t)v10, *v38);
      }
      (*(void (**)(uint64_t *, const char *, uint64_t))(**v10 + 8))(*v10, "],\"subtype\":", 12);
      uint64_t v46 = *(void *)(a2 + 8);
      if (!*(unsigned char *)(v46 + 25))
      {
        uint64_t v11 = *(uint64_t (**)(void))(**v10 + 8);
LABEL_71:
        return (uint64_t **)v11();
      }
      sub_2638A4AA4((uint64_t)v10, *(unsigned __int8 *)(v46 + 24));
      int v47 = *(uint64_t (**)(void))**v10;
      return (uint64_t **)v47();
    case 9:
      uint64_t v11 = *(uint64_t (**)(void))(**result + 8);
      goto LABEL_71;
    default:
      return result;
  }
}

void sub_2638A4220(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EB6308;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_2638A4240(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EB6308;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x263E6D460);
}

uint64_t sub_2638A4294(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 24) + 16))();
}

void sub_2638A42BC(uint64_t a1, std::string::value_type a2)
{
}

std::string *sub_2638A42C4(uint64_t a1, const std::string::value_type *a2, std::string::size_type a3)
{
  return std::string::append(*(std::string **)(a1 + 8), a2, a3);
}

void sub_2638A42D0()
{
}

uint64_t sub_2638A42E4(uint64_t a1, uint64_t a2, unsigned int a3, int a4)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  char v7 = localeconv();
  *(void *)(a1 + 80) = v7;
  thousands_sep = v7->thousands_sep;
  if (thousands_sep) {
    LOBYTE(thousands_sep) = *thousands_sep;
  }
  *(unsigned char *)(a1 + 88) = (_BYTE)thousands_sep;
  decimal_point = v7->decimal_point;
  if (v7->decimal_point) {
    LOBYTE(decimal_point) = *decimal_point;
  }
  *(_OWORD *)(a1 + 90) = 0u;
  *(unsigned char *)(a1 + 89) = (_BYTE)decimal_point;
  *(_OWORD *)(a1 + 106) = 0u;
  *(_OWORD *)(a1 + 122) = 0u;
  *(_OWORD *)(a1 + 138) = 0u;
  *(_OWORD *)(a1 + 154) = 0u;
  *(_OWORD *)(a1 + 170) = 0u;
  *(_OWORD *)(a1 + 186) = 0u;
  *(_OWORD *)(a1 + 202) = 0u;
  *(_OWORD *)(a1 + 218) = 0u;
  *(_OWORD *)(a1 + 234) = 0u;
  *(_OWORD *)(a1 + 250) = 0u;
  *(_OWORD *)(a1 + 266) = 0u;
  *(_OWORD *)(a1 + 282) = 0u;
  *(_OWORD *)(a1 + 298) = 0u;
  *(_OWORD *)(a1 + 314) = 0u;
  *(_OWORD *)(a1 + 330) = 0u;
  *(_OWORD *)(a1 + 346) = 0u;
  *(_OWORD *)(a1 + 362) = 0u;
  *(_OWORD *)(a1 + 378) = 0u;
  *(_OWORD *)(a1 + 394) = 0u;
  *(_OWORD *)(a1 + 410) = 0u;
  *(_OWORD *)(a1 + 426) = 0u;
  *(_OWORD *)(a1 + 442) = 0u;
  *(_OWORD *)(a1 + 458) = 0u;
  *(_OWORD *)(a1 + 474) = 0u;
  *(_OWORD *)(a1 + 490) = 0u;
  *(_OWORD *)(a1 + 506) = 0u;
  *(_OWORD *)(a1 + 522) = 0u;
  *(_OWORD *)(a1 + 538) = 0u;
  *(_OWORD *)(a1 + 554) = 0u;
  *(_OWORD *)(a1 + 570) = 0u;
  *(_OWORD *)(a1 + 586) = 0u;
  *(unsigned char *)(a1 + 602) = a3;
  long long v10 = (int8x16_t *)operator new(0x208uLL);
  *(void *)(a1 + 608) = v10;
  *(void *)(a1 + 624) = 0x8000000000000208;
  int8x16_t v11 = vdupq_n_s8(a3);
  *(void *)(a1 + 616) = 512;
  *long long v10 = v11;
  v10[1] = v11;
  v10[2] = v11;
  v10[3] = v11;
  v10[4] = v11;
  v10[5] = v11;
  v10[6] = v11;
  v10[7] = v11;
  v10[8] = v11;
  v10[9] = v11;
  v10[10] = v11;
  v10[11] = v11;
  v10[12] = v11;
  v10[13] = v11;
  v10[14] = v11;
  v10[15] = v11;
  v10[16] = v11;
  v10[17] = v11;
  v10[18] = v11;
  v10[19] = v11;
  v10[20] = v11;
  v10[21] = v11;
  v10[22] = v11;
  v10[23] = v11;
  v10[24] = v11;
  v10[25] = v11;
  v10[26] = v11;
  v10[27] = v11;
  v10[28] = v11;
  v10[29] = v11;
  v10[30] = v11;
  v10[31] = v11;
  v10[32].i8[0] = 0;
  *(_DWORD *)(a1 + 632) = a4;
  return a1;
}

void sub_2638A4414(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(std::__shared_weak_count **)(v1 + 8);
  if (v3) {
    sub_26389F6D4(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_2638A442C(uint64_t result, uint64_t *a2, int a3)
{
  LOBYTE(v3) = *((char *)a2 + 23) < 0;
  uint64_t v4 = *((unsigned __int8 *)a2 + 23);
  if ((v4 & 0x80u) != 0) {
    uint64_t v4 = a2[1];
  }
  if (!v4) {
    return result;
  }
  char v7 = (void *)result;
  unint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  unsigned int v12 = 0;
  unsigned int v13 = 0;
  uint64_t v14 = result + 90;
  do
  {
    if (v3) {
      unint64_t v15 = (uint64_t *)*a2;
    }
    else {
      unint64_t v15 = a2;
    }
    uint64_t v16 = *((unsigned __int8 *)v15 + v8);
    if (v12) {
      unsigned int v13 = *((unsigned char *)v15 + v8) & 0x3F | (v13 << 6);
    }
    else {
      unsigned int v13 = (0xFFu >> byte_2638C90E1[v16]) & v16;
    }
    unsigned int v12 = byte_2638C90E1[16 * v12 + 256 + byte_2638C90E1[v16]];
    if (v12 == 1)
    {
      int v18 = *((_DWORD *)v7 + 158);
      if ((v18 - 1) < 2)
      {
        v8 -= v9 != 0;
        if (v18 != 1)
        {
          unsigned int v12 = 0;
          uint64_t v9 = 0;
          uint64_t v11 = v10;
          goto LABEL_47;
        }
        if (a3)
        {
          uint64_t v19 = v14 + v10;
          *(_DWORD *)uint64_t v19 = 1717990748;
          *(_WORD *)(v19 + 4) = 25702;
          uint64_t v11 = v10 + 6;
        }
        else
        {
          uint64_t v11 = v10 + 3;
          uint64_t v20 = v14 + v10;
          *(_WORD *)uint64_t v20 = -16401;
          *(unsigned char *)(v20 + 2) = -67;
        }
        goto LABEL_44;
      }
      if (!v18)
      {
        char v46 = 3;
        *(_DWORD *)__str = 0;
        snprintf(__str, 3uLL, "%.2X", v16);
        exception = __cxa_allocate_exception(0x20uLL);
        std::to_string(&v39, v8);
        double v29 = std::string::insert(&v39, 0, "invalid UTF-8 byte at index ");
        long long v30 = *(_OWORD *)&v29->__r_.__value_.__l.__data_;
        v40.__r_.__value_.__r.__words[2] = v29->__r_.__value_.__r.__words[2];
        *(_OWORD *)&v40.__r_.__value_.__l.__data_ = v30;
        v29->__r_.__value_.__l.__size_ = 0;
        v29->__r_.__value_.__r.__words[2] = 0;
        v29->__r_.__value_.__r.__words[0] = 0;
        uint64_t v31 = std::string::append(&v40, ": 0x");
        long long v32 = *(_OWORD *)&v31->__r_.__value_.__l.__data_;
        v41.__r_.__value_.__r.__words[2] = v31->__r_.__value_.__r.__words[2];
        *(_OWORD *)&v41.__r_.__value_.__l.__data_ = v32;
        v31->__r_.__value_.__l.__size_ = 0;
        v31->__r_.__value_.__r.__words[2] = 0;
        v31->__r_.__value_.__r.__words[0] = 0;
        if (v46 >= 0) {
          unint64_t v33 = __str;
        }
        else {
          unint64_t v33 = *(char **)__str;
        }
        if (v46 >= 0) {
          std::string::size_type v34 = v46;
        }
        else {
          std::string::size_type v34 = v45;
        }
        xpc_object_t v35 = std::string::append(&v41, v33, v34);
        long long v36 = *(_OWORD *)&v35->__r_.__value_.__l.__data_;
        std::string::size_type v43 = v35->__r_.__value_.__r.__words[2];
        long long v42 = v36;
        v35->__r_.__value_.__l.__size_ = 0;
        v35->__r_.__value_.__r.__words[2] = 0;
        v35->__r_.__value_.__r.__words[0] = 0;
        sub_2638A4F78(316, (uint64_t)&v42, exception);
        __cxa_throw(exception, (struct type_info *)&unk_270EB63B8, (void (*)(void *))sub_2638A50BC);
      }
      unsigned int v12 = 1;
    }
    else
    {
      if (!v12)
      {
        switch(v13)
        {
          case 8u:
            __int16 v17 = 25180;
            goto LABEL_43;
          case 9u:
            __int16 v17 = 29788;
            goto LABEL_43;
          case 0xAu:
            __int16 v17 = 28252;
            goto LABEL_43;
          case 0xBu:
            goto LABEL_29;
          case 0xCu:
            __int16 v17 = 26204;
            goto LABEL_43;
          case 0xDu:
            __int16 v17 = 29276;
            goto LABEL_43;
          default:
            if (v13 == 34)
            {
              __int16 v17 = 8796;
              goto LABEL_43;
            }
            if (v13 == 92)
            {
              __int16 v17 = 23644;
LABEL_43:
              *(_WORD *)(v14 + v11) = v17;
              v11 += 2;
              break;
            }
LABEL_29:
            if (v13 > 0x7E) {
              int v21 = a3;
            }
            else {
              int v21 = 0;
            }
            if (v13 >= 0x20 && v21 == 0)
            {
              *(unsigned char *)(v14 + v11++) = *((unsigned char *)v15 + v8);
            }
            else
            {
              long long v23 = (char *)(v14 + v11);
              if (HIWORD(v13))
              {
                xpc_object_t result = snprintf(v23, 0xDuLL, "\\u%04x\\u%04x", (unsigned __int16)((v13 >> 10) - 10304), v13 & 0x3FF | 0xDC00);
                v11 += 12;
              }
              else
              {
                xpc_object_t result = snprintf(v23, 7uLL, "\\u%04x", v13);
                v11 += 6;
              }
            }
            break;
        }
LABEL_44:
        if ((unint64_t)(v11 - 500) > 0xC)
        {
          unsigned int v12 = 0;
          uint64_t v9 = 0;
          uint64_t v10 = v11;
        }
        else
        {
          xpc_object_t result = (*(uint64_t (**)(void, uint64_t, uint64_t))(*(void *)*v7 + 8))(*v7, v14, v11);
          unsigned int v12 = 0;
          uint64_t v11 = 0;
          uint64_t v10 = 0;
          uint64_t v9 = 0;
        }
        goto LABEL_47;
      }
      if ((a3 & 1) == 0) {
        *(unsigned char *)(v14 + v11++) = *((unsigned char *)v15 + v8);
      }
      ++v9;
    }
LABEL_47:
    ++v8;
    int v24 = *((char *)a2 + 23);
    unsigned int v3 = v24 >> 31;
    unint64_t v25 = a2[1];
    if (v24 >= 0) {
      unint64_t v25 = *((unsigned __int8 *)a2 + 23);
    }
  }
  while (v8 < v25);
  if (v12)
  {
    int v27 = *((_DWORD *)v7 + 158);
    switch(v27)
    {
      case 1:
        (*(void (**)(void, uint64_t, uint64_t))(*(void *)*v7 + 8))(*v7, v14, v10);
        uint64_t v26 = *(uint64_t (**)(void))(*(void *)*v7 + 8);
        break;
      case 2:
        uint64_t v26 = *(uint64_t (**)(void))(*(void *)*v7 + 8);
        break;
      case 0:
        char v46 = 3;
        *(_DWORD *)__str = 0;
        unint64_t v37 = (uint64_t *)*a2;
        if (v24 >= 0) {
          unint64_t v37 = a2;
        }
        snprintf(__str, 3uLL, "%.2X", *((unsigned __int8 *)v37 + v25 - 1));
        unint64_t v38 = __cxa_allocate_exception(0x20uLL);
        std::operator+<char>();
        sub_2638A4F78(316, (uint64_t)&v42, v38);
        __cxa_throw(v38, (struct type_info *)&unk_270EB63B8, (void (*)(void *))sub_2638A50BC);
      default:
        return result;
    }
LABEL_56:
    return v26();
  }
  if (v11)
  {
    uint64_t v26 = *(uint64_t (**)(void))(*(void *)*v7 + 8);
    goto LABEL_56;
  }
  return result;
}

void sub_2638A49CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,uint64_t a33,void *__p,uint64_t a35,int a36,__int16 a37,char a38,char a39)
{
  if (a39 < 0)
  {
    operator delete(__p);
    if ((v40 & 1) == 0)
    {
LABEL_6:
      if (*(char *)(v41 - 89) < 0) {
        operator delete(*(void **)(v41 - 112));
      }
      _Unwind_Resume(a1);
    }
  }
  else if (!v40)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v39);
  goto LABEL_6;
}

uint64_t sub_2638A4AA4(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return (***(uint64_t (****)(void, uint64_t))a1)(*(void *)a1, 48);
  }
  LOBYTE(v2) = a2;
  if (a2 >= 0xA)
  {
    if (a2 >= 0x64)
    {
      *(_WORD *)(a1 + 17) = *(_WORD *)&a00010203040506[2 * (a2 - 100 * ((41 * a2) >> 12))];
      uint64_t v5 = a1 + 17;
      unsigned int v2 = (41 * a2) >> 12;
      goto LABEL_10;
    }
    uint64_t v3 = 2;
  }
  else
  {
    uint64_t v3 = 1;
  }
  uint64_t v5 = a1 + 16 + v3;
  if (a2 < 0xA)
  {
LABEL_10:
    *(unsigned char *)(v5 - 1) = v2 | 0x30;
    return (*(uint64_t (**)(void))(**(void **)a1 + 8))();
  }
  *(_WORD *)(v5 - 2) = *(_WORD *)&a00010203040506[2 * a2];
  return (*(uint64_t (**)(void))(**(void **)a1 + 8))();
}

uint64_t sub_2638A4B80(void *a1, unint64_t a2)
{
  if (!a2) {
    return (**(uint64_t (***)(void, uint64_t))*a1)(*a1, 48);
  }
  unint64_t v2 = a2;
  uint64_t v3 = a1 + 2;
  if ((v2 & 0x8000000000000000) != 0)
  {
    unsigned char *v3 = 45;
    unint64_t v2 = -(uint64_t)v2;
    if (v2 >= 0xA)
    {
      int v6 = 4;
      unint64_t v10 = v2;
      while (1)
      {
        if (v10 <= 0x63)
        {
          v6 -= 2;
          goto LABEL_24;
        }
        if (v10 <= 0x3E7) {
          break;
        }
        if (v10 >> 4 < 0x271) {
          goto LABEL_24;
        }
        v6 += 4;
        BOOL v9 = v10 >= 0x186A0;
        v10 /= 0x2710uLL;
        if (!v9)
        {
          v6 -= 3;
          goto LABEL_24;
        }
      }
      --v6;
    }
    else
    {
      int v6 = 1;
    }
LABEL_24:
    unsigned int v7 = v6 + 1;
  }
  else
  {
    if (v2 < 0xA)
    {
      uint64_t v4 = (char *)a1 + 17;
LABEL_32:
      *(v4 - 1) = v2 + 48;
      return (*(uint64_t (**)(void))(*(void *)*a1 + 8))();
    }
    unsigned int v7 = 4;
    unint64_t v8 = v2;
    while (1)
    {
      if (v8 <= 0x63)
      {
        v7 -= 2;
        goto LABEL_25;
      }
      if (v8 <= 0x3E7) {
        break;
      }
      if (v8 >> 4 < 0x271) {
        goto LABEL_25;
      }
      v7 += 4;
      BOOL v9 = v8 >= 0x186A0;
      v8 /= 0x2710uLL;
      if (!v9)
      {
        v7 -= 3;
        goto LABEL_25;
      }
    }
    --v7;
  }
LABEL_25:
  uint64_t v4 = &v3[v7];
  if (v2 < 0x64)
  {
    unint64_t v11 = v2;
  }
  else
  {
    do
    {
      unint64_t v11 = v2 / 0x64;
      *((_WORD *)v4 - 1) = *(_WORD *)&a00010203040506[2 * (v2 % 0x64) + 200];
      v4 -= 2;
      unint64_t v12 = v2 >> 4;
      v2 /= 0x64uLL;
    }
    while (v12 > 0x270);
  }
  if (v11 < 0xA)
  {
    LOBYTE(v2) = v11;
    goto LABEL_32;
  }
  *((_WORD *)v4 - 1) = *(_WORD *)&a00010203040506[2 * v11 + 200];
  return (*(uint64_t (**)(void))(*(void *)*a1 + 8))();
}

uint64_t sub_2638A4D70(void *a1, unint64_t a2)
{
  if (!a2) {
    return (**(uint64_t (***)(void, uint64_t))*a1)(*a1, 48);
  }
  unint64_t v2 = a2;
  if (a2 < 0xA)
  {
    uint64_t v3 = (uint64_t)a1 + 17;
LABEL_20:
    *(unsigned char *)(v3 - 1) = v2 + 48;
    return (*(uint64_t (**)(void))(*(void *)*a1 + 8))();
  }
  unsigned int v5 = 4;
  unint64_t v6 = a2;
  while (1)
  {
    if (v6 <= 0x63)
    {
      v5 -= 2;
      goto LABEL_13;
    }
    if (v6 <= 0x3E7) {
      break;
    }
    if (v6 >> 4 < 0x271) {
      goto LABEL_13;
    }
    unint64_t v7 = v6 >> 5;
    v6 /= 0x2710uLL;
    v5 += 4;
    if (v7 <= 0xC34)
    {
      v5 -= 3;
      goto LABEL_13;
    }
  }
  --v5;
LABEL_13:
  uint64_t v3 = (uint64_t)a1 + v5 + 16;
  if (a2 < 0x64)
  {
    unint64_t v8 = a2;
  }
  else
  {
    do
    {
      unint64_t v8 = v2 / 0x64;
      *(_WORD *)(v3 - 2) = *(_WORD *)&a00010203040506[2 * (v2 % 0x64) + 400];
      v3 -= 2;
      unint64_t v9 = v2 >> 4;
      v2 /= 0x64uLL;
    }
    while (v9 > 0x270);
  }
  if (v8 < 0xA)
  {
    LOBYTE(v2) = v8;
    goto LABEL_20;
  }
  *(_WORD *)(v3 - 2) = *(_WORD *)&a00010203040506[2 * v8 + 400];
  return (*(uint64_t (**)(void))(*(void *)*a1 + 8))();
}

uint64_t sub_2638A4EC8(const char *a1, double a2)
{
  if ((*(void *)&a2 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
  {
    uint64_t v5 = *(void *)a1;
    uint64_t v4 = *(uint64_t (**)(uint64_t, const char *, uint64_t))(**(void **)a1 + 8);
    unint64_t v6 = "null";
    uint64_t v3 = 4;
  }
  else
  {
    uint64_t v3 = sub_2638A54D8((unsigned char *)a1 + 16, a2) - (void)(a1 + 16);
    uint64_t v4 = *(uint64_t (**)(uint64_t, const char *, uint64_t))(**(void **)a1 + 8);
    uint64_t v5 = *(void *)a1;
    unint64_t v6 = a1 + 16;
  }

  return v4(v5, v6, v3);
}

void sub_2638A4F78(int a1@<W0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  sub_2638A5294(&__p, "type_error");
  sub_2638A5110(a1, &v14);
  int v6 = *(char *)(a2 + 23);
  if (v6 >= 0) {
    unint64_t v7 = (const std::string::value_type *)a2;
  }
  else {
    unint64_t v7 = *(const std::string::value_type **)a2;
  }
  if (v6 >= 0) {
    std::string::size_type v8 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    std::string::size_type v8 = *(void *)(a2 + 8);
  }
  unint64_t v9 = std::string::append(&v14, v7, v8);
  long long v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
  int64_t v16 = v9->__r_.__value_.__r.__words[2];
  *(_OWORD *)unint64_t v15 = v10;
  v9->__r_.__value_.__l.__size_ = 0;
  v9->__r_.__value_.__r.__words[2] = 0;
  v9->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v14.__r_.__value_.__l.__data_);
  }
  if (v13 < 0) {
    operator delete(__p);
  }
  if (v16 >= 0) {
    unint64_t v11 = v15;
  }
  else {
    unint64_t v11 = (void **)v15[0];
  }
  sub_2638A5348((uint64_t)a3, a1, (uint64_t)v11);
  *a3 = &unk_270EB63E0;
  if (SHIBYTE(v16) < 0) {
    operator delete(v15[0]);
  }
}

void sub_2638A5074(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a26 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_2638A50BC(std::exception *a1)
{
  a1->__vftable = (std::exception_vtbl *)&unk_270EB6408;
  MEMORY[0x263E6D1D0](&a1[2]);

  std::exception::~exception(a1);
}

void sub_2638A5110(int a1@<W1>, std::string *a2@<X8>)
{
  std::operator+<char>();
  uint64_t v4 = std::string::append(&v12, ".");
  long long v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
  v13.__r_.__value_.__r.__words[2] = v4->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v13.__r_.__value_.__l.__data_ = v5;
  v4->__r_.__value_.__l.__size_ = 0;
  v4->__r_.__value_.__r.__words[2] = 0;
  v4->__r_.__value_.__r.__words[0] = 0;
  std::to_string(&__p, a1);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = __p.__r_.__value_.__l.__size_;
  }
  std::string::size_type v8 = std::string::append(&v13, (const std::string::value_type *)p_p, size);
  long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
  v14.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v14.__r_.__value_.__l.__data_ = v9;
  v8->__r_.__value_.__l.__size_ = 0;
  v8->__r_.__value_.__r.__words[2] = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  long long v10 = std::string::append(&v14, "] ");
  *a2 = *v10;
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v14.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v13.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v12.__r_.__value_.__l.__data_);
  }
}

void sub_2638A5230(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (*(char *)(v26 - 41) < 0) {
    operator delete(*(void **)(v26 - 64));
  }
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a26 < 0) {
    operator delete(a21);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  _Unwind_Resume(exception_object);
}

void *sub_2638A5294(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_2638A2438();
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

uint64_t sub_2638A5348(uint64_t a1, int a2, uint64_t a3)
{
  *(void *)a1 = &unk_270EB6408;
  *(_DWORD *)(a1 + 8) = a2;
  MEMORY[0x263E6D1C0](a1 + 16, a3);
  return a1;
}

void sub_2638A5398(_Unwind_Exception *a1)
{
  std::exception::~exception(v1);
  _Unwind_Resume(a1);
}

void sub_2638A53AC(std::exception *a1)
{
  a1->__vftable = (std::exception_vtbl *)&unk_270EB6408;
  MEMORY[0x263E6D1D0](&a1[2]);
  std::exception::~exception(a1);

  JUMPOUT(0x263E6D460);
}

const char *sub_2638A5414(const std::runtime_error *a1)
{
  return std::runtime_error::what(a1 + 1);
}

void sub_2638A541C(std::exception *a1)
{
  a1->__vftable = (std::exception_vtbl *)&unk_270EB6408;
  MEMORY[0x263E6D1D0](&a1[2]);

  std::exception::~exception(a1);
}

void sub_2638A5470(std::exception *a1)
{
  a1->__vftable = (std::exception_vtbl *)&unk_270EB6408;
  MEMORY[0x263E6D1D0](&a1[2]);
  std::exception::~exception(a1);

  JUMPOUT(0x263E6D460);
}

uint64_t sub_2638A54D8(unsigned char *a1, double a2)
{
  uint64_t v2 = (uint64_t)a1;
  if ((*(void *)&a2 & 0x8000000000000000) != 0)
  {
    a2 = -a2;
    *a1 = 45;
    uint64_t v2 = (uint64_t)(a1 + 1);
  }
  if (a2 == 0.0)
  {
    *(_WORD *)uint64_t v2 = 11824;
    uint64_t result = v2 + 3;
    *(unsigned char *)(v2 + 2) = 48;
    return result;
  }
  uint64_t v15 = 0;
  sub_2638A56FC(v2, (int *)&v15 + 1, &v15, a2);
  uint64_t v4 = SHIDWORD(v15);
  uint64_t v5 = (int)v15 + (uint64_t)SHIDWORD(v15);
  if ((v15 & 0x80000000) == 0 && (int)v5 <= 15)
  {
    memset((void *)(v2 + SHIDWORD(v15)), 48, (int)v15);
    *(_WORD *)(v2 + v5) = 12334;
    return v2 + v5 + 2;
  }
  if ((v5 - 16) >= 0xFFFFFFF1)
  {
    uint64_t v7 = (unsigned char *)(v2 + v5);
    memmove(v7 + 1, v7, SHIDWORD(v15) - (unint64_t)v5);
    *uint64_t v7 = 46;
    return v4 + v2 + 1;
  }
  if (v5 == 0 || v5 >= 0xFFFFFFFD)
  {
    size_t v6 = -(int)v5;
    memmove((void *)(v2 + v6 + 2), (const void *)v2, SHIDWORD(v15));
    *(_WORD *)uint64_t v2 = 11824;
    memset((void *)(v2 + 2), 48, v6);
    return v2 + v4 + v6 + 2;
  }
  if (HIDWORD(v15) == 1)
  {
    uint64_t v8 = 1;
  }
  else
  {
    memmove((void *)(v2 + 2), (const void *)(v2 + 1), SHIDWORD(v15) - 1);
    *(unsigned char *)(v2 + 1) = 46;
    uint64_t v8 = v4 + 1;
  }
  long long v9 = (unsigned char *)(v2 + v8);
  unsigned char *v9 = 101;
  unsigned int v10 = v5 - 1;
  if ((int)v5 >= 1) {
    char v11 = 43;
  }
  else {
    char v11 = 45;
  }
  if ((int)v5 - 1 < 0) {
    unsigned int v10 = 1 - v5;
  }
  v9[1] = v11;
  if (v10 > 9)
  {
    if (v10 > 0x63)
    {
      v9[2] = v10 / 0x64 + 48;
      unsigned __int8 v14 = v10 % 0x64;
      v9[3] = (v14 / 0xAu) | 0x30;
      v9[4] = (v14 % 0xAu) | 0x30;
      uint64_t v13 = 2;
      return (uint64_t)&v9[v13 + 3];
    }
    v9[2] = v10 / 0xAu + 48;
    char v12 = (v10 % 0xAu) | 0x30;
  }
  else
  {
    v9[2] = 48;
    char v12 = v10 + 48;
  }
  v9[3] = v12;
  uint64_t v13 = 1;
  return (uint64_t)&v9[v13 + 3];
}

uint64_t sub_2638A56FC(uint64_t a1, int *a2, _DWORD *a3, double a4)
{
  sub_2638A5824((uint64_t)v20, a4);
  long long v27 = v20[1];
  long long v26 = v20[0];
  v25[0] = v21;
  v25[1] = v22;
  if (-61 - (int)v22 <= 0) {
    int v7 = 78913 * (-61 - (int)v22) / 0x40000;
  }
  else {
    int v7 = 78913 * (-61 - (int)v22) / 0x40000 + 1;
  }
  uint64_t v8 = (uint64_t *)((char *)&unk_2638C94D0 + 16
                                          * ((int)((v7 + 307 + (((v7 + 307) >> 28) & 7)) << 16) >> 19));
  uint64_t v9 = v8[1];
  uint64_t v23 = *v8;
  int v24 = v9;
  unint64_t v10 = sub_2638A58CC(&v26, &v23);
  uint64_t v12 = v11;
  unint64_t v13 = sub_2638A58CC(&v27, &v23);
  unsigned int v15 = v14;
  unint64_t v16 = sub_2638A58CC(v25, &v23);
  *a3 = -HIDWORD(v9);
  return sub_2638A592C(a1, a2, a3, v13 + 1, v15, v10, v12, v18, v16 - 1, v17);
}

void sub_2638A5824(uint64_t a1@<X8>, double a2@<D0>)
{
  uint64_t v2 = *(void *)&a2 & 0xFFFFFFFFFFFFFLL;
  if (*(void *)&a2 >> 52)
  {
    LODWORD(v5) = (*(void *)&a2 >> 52) - 1075;
    uint64_t v3 = 2 * (v2 | 0x10000000000000);
    uint64_t v4 = (2 * (*(void *)&a2 & 0xFFFFFFFFFFFFFLL | 0x10000000000000)) | 1;
    int v6 = (*(void *)&a2 >> 52) - 1076;
    if (*(void *)&a2 >> 53 && !v2)
    {
      char v7 = (*(void *)&a2 >> 52) - 53;
      uint64_t v8 = 0x3FFFFFFFFFFFFFLL;
      uint64_t v2 = 0x10000000000000;
      goto LABEL_8;
    }
    v2 |= 0x10000000000000uLL;
  }
  else
  {
    uint64_t v3 = 2 * v2;
    uint64_t v4 = (2 * (*(void *)&a2 & 0xFFFFFFFFFFFFFLL)) | 1;
    LODWORD(v5) = -1074;
    int v6 = -1075;
  }
  uint64_t v8 = v3 - 1;
  char v7 = v6;
  do
  {
LABEL_8:
    v4 *= 2;
    --v6;
  }
  while ((v4 & 0x8000000000000000) == 0);
  do
  {
    v2 *= 2;
    uint64_t v5 = (v5 - 1);
  }
  while ((v2 & 0x8000000000000000) == 0);
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v8 << (v7 - v6);
  *(_DWORD *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v4;
  *(_DWORD *)(a1 + 40) = v6;
}

unint64_t sub_2638A58CC(void *a1, void *a2)
{
  uint64_t v2 = HIDWORD(*a1);
  uint64_t v3 = HIDWORD(*a2);
  unint64_t v4 = v3 * (unint64_t)*a1;
  unint64_t v5 = *a2 * (unint64_t)v2;
  return HIDWORD(v5)
       + v3 * (unint64_t)v2
       + HIDWORD(v4)
       + ((((*a2 * (unint64_t)*a1) >> 32)
         + v4
         + v5
         + 0x80000000) >> 32);
}

uint64_t sub_2638A592C(uint64_t result, int *a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9, int a10)
{
  unint64_t v10 = a9 - a4;
  unint64_t v11 = a9 - a6;
  int v12 = -a10;
  unint64_t v13 = 1 << -(char)a10;
  unint64_t v14 = a9 >> -(char)a10;
  unint64_t v15 = (v13 - 1) & a9;
  if (v14 <= 0x3B9AC9FF)
  {
    if (v14 <= 0x5F5E0FF)
    {
      if (v14 <= 0x98967F)
      {
        if (v14 <= 0xF423F)
        {
          unsigned int v18 = v14 >> 5;
          unsigned int v19 = v14 >> 4;
          if (v14 <= 9) {
            int v20 = 1;
          }
          else {
            int v20 = 10;
          }
          if (v14 <= 9) {
            int v21 = 1;
          }
          else {
            int v21 = 2;
          }
          if (v14 <= 0x63) {
            int v22 = v20;
          }
          else {
            int v22 = 100;
          }
          if (v14 <= 0x63) {
            int v23 = v21;
          }
          else {
            int v23 = 3;
          }
          if (v14 <= 0x3E7) {
            int v24 = v22;
          }
          else {
            int v24 = 1000;
          }
          if (v14 <= 0x3E7) {
            int v25 = v23;
          }
          else {
            int v25 = 4;
          }
          if (v19 <= 0x270) {
            int v26 = v24;
          }
          else {
            int v26 = 10000;
          }
          if (v19 <= 0x270) {
            int v27 = v25;
          }
          else {
            int v27 = 5;
          }
          if (v18 > 0xC34) {
            unsigned int v16 = 100000;
          }
          else {
            unsigned int v16 = v26;
          }
          if (v18 <= 0xC34) {
            int v17 = v27;
          }
          else {
            int v17 = 6;
          }
        }
        else
        {
          unsigned int v16 = 1000000;
          int v17 = 7;
        }
      }
      else
      {
        unsigned int v16 = 10000000;
        int v17 = 8;
      }
    }
    else
    {
      unsigned int v16 = 100000000;
      int v17 = 9;
    }
  }
  else
  {
    unsigned int v16 = 1000000000;
    int v17 = 10;
  }
  uint64_t v28 = -a6;
  uint64_t v29 = -a4;
  uint64_t v30 = a6 - a9;
  while (v17 > 0)
  {
    unsigned int v31 = v14 / v16;
    unint64_t v14 = v14 % v16;
    uint64_t v32 = *a2;
    *a2 = v32 + 1;
    *(unsigned char *)(result + v32) = v31 + 48;
    --v17;
    unint64_t v33 = (v14 << v12) + v15;
    if (v10 >= v33)
    {
      *a3 += v17;
      unint64_t v34 = (unint64_t)v16 << v12;
      if (v33 >= v11 || v10 - v33 < v34) {
        return result;
      }
      uint64_t v36 = *a2 - 1;
      unint64_t v37 = v15 + (v14 << v12) + v34;
      unint64_t v38 = v29 - v37;
      unint64_t v39 = a9;
      do
      {
        if (v37 >= v11 && v28 - v33 + v39 <= v30 + v37) {
          break;
        }
        --*(unsigned char *)(result + v36);
        if (v37 >= v11) {
          break;
        }
        unint64_t v40 = v38 + v39;
        v39 -= v34;
        v37 += v34;
      }
      while (v40 >= v34);
    }
    else
    {
      v16 /= 0xAu;
    }
    if (v10 >= v33) {
      return result;
    }
  }
  int v41 = 0;
  do
  {
    unint64_t v42 = v10;
    unint64_t v43 = v11;
    uint64_t v44 = 5 * v15;
    uint64_t v45 = *a2;
    *a2 = v45 + 1;
    *(unsigned char *)(result + v45) = ((unint64_t)(2 * v44) >> v12) + 48;
    unint64_t v10 = 10 * v42;
    v11 *= 10;
    --v41;
    unint64_t v15 = (v13 - 1) & (2 * v44);
  }
  while (10 * v42 < v15);
  *a3 += v41;
  if (v15 < v11 && 10 * v42 - v15 >= v13)
  {
    uint64_t v46 = *a2 - 1;
    uint64_t v47 = 10 * v43;
    uint64_t v48 = -(uint64_t)v15;
    unint64_t v49 = 10 * v42 - v13;
    unint64_t v50 = v13 + v15;
    uint64_t v51 = -10 * v43;
    do
    {
      if (v50 >= v11 && v47 + v48 <= v51 + v50) {
        break;
      }
      --*(unsigned char *)(result + v46);
      if (v50 >= v11) {
        break;
      }
      unint64_t v52 = v49 + v48;
      v48 -= v13;
      v50 += v13;
    }
    while (v52 >= v13);
  }
  return result;
}

uint64_t sub_2638A5C0C(uint64_t a1)
{
  if (*(char *)(a1 + 631) < 0) {
    operator delete(*(void **)(a1 + 608));
  }
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2) {
    sub_26389F6D4(v2);
  }
  return a1;
}

void sub_2638A5C4C(char ***a1, int a2)
{
  uint64_t v39 = 0;
  uint64_t v40 = 0;
  unint64_t v41 = 0;
  int v3 = a2 - 1;
  if (a2 == 1)
  {
    sub_2638A60E4(&v39, (unint64_t)(*a1)[2]);
    uint64_t v4 = (uint64_t)(*a1 + 1);
    unint64_t v5 = **a1;
    if (v5 != (char *)v4)
    {
      unint64_t v6 = v40;
      do
      {
        if (v6 >= v41)
        {
          uint64_t v7 = (uint64_t)(v6 - v39) >> 4;
          if ((unint64_t)(v7 + 1) >> 60) {
            sub_2638A2514();
          }
          unint64_t v8 = (uint64_t)(v41 - v39) >> 3;
          if (v8 <= v7 + 1) {
            unint64_t v8 = v7 + 1;
          }
          if (v41 - v39 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v9 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v9 = v8;
          }
          uint64_t v46 = &v41;
          unint64_t v10 = (void **)sub_2638A61F0((uint64_t)&v41, v9);
          unint64_t v11 = &v10[2 * v7];
          unint64_t v42 = (char **)v10;
          unint64_t v43 = v11;
          uint64_t v45 = &v10[2 * v12];
          *(unsigned char *)unint64_t v11 = v5[56];
          v11[1] = (void *)*((void *)v5 + 8);
          v5[56] = 0;
          *((void *)v5 + 8) = 0;
          uint64_t v44 = v11 + 2;
          sub_2638A6178(&v39, &v42);
          unint64_t v6 = v40;
          sub_2638A633C((uint64_t)&v42);
        }
        else
        {
          *(unsigned char *)unint64_t v6 = v5[56];
          *(void *)(v6 + 8) = *((void *)v5 + 8);
          v5[56] = 0;
          *((void *)v5 + 8) = 0;
          v6 += 16;
        }
        uint64_t v40 = v6;
        unint64_t v13 = (char *)*((void *)v5 + 1);
        if (v13)
        {
          do
          {
            unint64_t v14 = v13;
            unint64_t v13 = *(char **)v13;
          }
          while (v13);
        }
        else
        {
          do
          {
            unint64_t v14 = (char *)*((void *)v5 + 2);
            BOOL v15 = *(void *)v14 == (void)v5;
            unint64_t v5 = v14;
          }
          while (!v15);
        }
        unint64_t v5 = v14;
      }
      while (v14 != (char *)v4);
    }
  }
  else if (a2 == 2)
  {
    sub_2638A60E4(&v39, ((*a1)[1] - **a1) >> 4);
    sub_2638A6390((uint64_t)&v42, **a1, (*a1)[1], &v39);
  }
  for (uint64_t i = v40; v39 != v40; uint64_t i = v40)
  {
    unsigned __int8 v37 = *(unsigned char *)(i - 16);
    unint64_t v38 = *(char ***)(i - 8);
    *(unsigned char *)(i - 16) = 0;
    *(void *)(i - 8) = 0;
    unint64_t v17 = v40 - 16;
    sub_2638A5C4C(v40 - 8, *(unsigned __int8 *)(v40 - 16));
    uint64_t v40 = v17;
    if (v37 == 1)
    {
      uint64_t v23 = (uint64_t)v38;
      int v24 = v38 + 1;
      int v25 = *v38;
      if (*v38 != (char *)(v38 + 1))
      {
        do
        {
          if (v17 >= v41)
          {
            uint64_t v26 = (uint64_t)(v17 - v39) >> 4;
            if ((unint64_t)(v26 + 1) >> 60) {
              sub_2638A2514();
            }
            unint64_t v27 = (uint64_t)(v41 - v39) >> 3;
            if (v27 <= v26 + 1) {
              unint64_t v27 = v26 + 1;
            }
            if (v41 - v39 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v28 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v28 = v27;
            }
            uint64_t v46 = &v41;
            uint64_t v29 = (void **)sub_2638A61F0((uint64_t)&v41, v28);
            uint64_t v30 = &v29[2 * v26];
            unint64_t v42 = (char **)v29;
            unint64_t v43 = v30;
            uint64_t v45 = &v29[2 * v31];
            *(unsigned char *)uint64_t v30 = v25[56];
            v30[1] = (void *)*((void *)v25 + 8);
            v25[56] = 0;
            *((void *)v25 + 8) = 0;
            uint64_t v44 = v30 + 2;
            sub_2638A6178(&v39, &v42);
            unint64_t v17 = v40;
            sub_2638A633C((uint64_t)&v42);
          }
          else
          {
            *(unsigned char *)unint64_t v17 = v25[56];
            *(void *)(v17 + 8) = *((void *)v25 + 8);
            v25[56] = 0;
            *((void *)v25 + 8) = 0;
            v17 += 16;
          }
          uint64_t v40 = v17;
          uint64_t v32 = (char *)*((void *)v25 + 1);
          if (v32)
          {
            do
            {
              unint64_t v33 = v32;
              uint64_t v32 = *(char **)v32;
            }
            while (v32);
          }
          else
          {
            do
            {
              unint64_t v33 = (char *)*((void *)v25 + 2);
              BOOL v15 = *(void *)v33 == (void)v25;
              int v25 = v33;
            }
            while (!v15);
          }
          int v25 = v33;
        }
        while (v33 != (char *)v24);
        uint64_t v23 = (uint64_t)v38;
      }
      sub_2638A64D8(v23, *(char **)(v23 + 8));
      *(void *)uint64_t v23 = v23 + 8;
      *(void *)(v23 + 16) = 0;
      *(void *)(v23 + 8) = 0;
    }
    else if (v37 == 2)
    {
      sub_2638A6390((uint64_t)&v42, *v38, v38[1], &v39);
      unsigned int v18 = v38;
      int v20 = *v38;
      unsigned int v19 = v38[1];
      if (v19 != *v38)
      {
        int v21 = v19 - 8;
        do
        {
          int v22 = v21 - 8;
          sub_2638A5C4C(v21, *(v21 - 8));
          v21 -= 16;
        }
        while (v22 != v20);
      }
      v18[1] = v20;
    }
    sub_2638A5C4C(&v38, v37);
  }
  switch(v3)
  {
    case 0:
      sub_2638A64D8((uint64_t)*a1, (*a1)[1]);
      goto LABEL_55;
    case 1:
      unint64_t v42 = *a1;
      sub_2638A659C((void ***)&v42);
      goto LABEL_55;
    case 2:
      unint64_t v34 = *a1;
      if ((*((char *)*a1 + 23) & 0x80000000) == 0) {
        goto LABEL_56;
      }
      xpc_object_t v35 = *v34;
      break;
    case 7:
      unint64_t v34 = *a1;
      uint64_t v36 = **a1;
      if (!v36) {
        goto LABEL_56;
      }
      v34[1] = v36;
      xpc_object_t v35 = v36;
      break;
    default:
      goto LABEL_57;
  }
  operator delete(v35);
LABEL_55:
  unint64_t v34 = *a1;
LABEL_56:
  operator delete(v34);
LABEL_57:
  unint64_t v42 = (char **)&v39;
  sub_2638A659C((void ***)&v42);
}

void sub_2638A6090(void *a1)
{
}

uint64_t sub_2638A60E4(uint64_t *a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  if (a2 > (v4 - *a1) >> 4)
  {
    if (a2 >> 60) {
      sub_2638A2514();
    }
    uint64_t v5 = a1[1] - *a1;
    v7[4] = result;
    v7[0] = sub_2638A61F0(result, a2);
    v7[1] = v7[0] + v5;
    v7[2] = v7[0] + v5;
    v7[3] = v7[0] + 16 * v6;
    sub_2638A6178(a1, v7);
    return sub_2638A633C((uint64_t)v7);
  }
  return result;
}

void sub_2638A6164(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_2638A633C((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_2638A6178(uint64_t *a1, void *a2)
{
  uint64_t result = sub_2638A6228((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

void *sub_2638A61F0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    sub_2638A24E0();
  }
  return operator new(16 * a2);
}

uint64_t sub_2638A6228(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v14 = a6;
  *((void *)&v14 + 1) = a7;
  long long v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  void v11[2] = &v14;
  if (a3 == a5)
  {
    uint64_t v9 = a6;
  }
  else
  {
    do
    {
      char v8 = *(unsigned char *)(a3 - 16);
      a3 -= 16;
      *(unsigned char *)(v7 - 16) = v8;
      *(void *)(v7 - 8) = *(void *)(a3 + 8);
      *(unsigned char *)a3 = 0;
      *(void *)(a3 + 8) = 0;
      uint64_t v7 = *((void *)&v14 + 1) - 16;
      *((void *)&v14 + 1) -= 16;
    }
    while (a3 != a5);
    uint64_t v9 = v14;
  }
  char v12 = 1;
  sub_2638A62C4((uint64_t)v11);
  return v9;
}

uint64_t sub_2638A62C4(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_2638A62FC(a1);
  }
  return a1;
}

uint64_t sub_2638A62FC(uint64_t result)
{
  uint64_t v1 = *(unsigned __int8 **)(*(void *)(result + 16) + 8);
  uint64_t v2 = *(unsigned __int8 **)(*(void *)(result + 8) + 8);
  while (v1 != v2)
  {
    int v3 = v1 + 8;
    unsigned int v4 = *v1;
    v1 += 16;
    uint64_t result = sub_2638A5C4C(v3, v4);
  }
  return result;
}

uint64_t sub_2638A633C(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    unsigned int v5 = *(unsigned __int8 *)(i - 16);
    uint64_t v4 = i - 16;
    *(void *)(a1 + 16) = v4;
    sub_2638A5C4C(v4 + 8, v5);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

char *sub_2638A6390(uint64_t a1, char *a2, char *a3, uint64_t *a4)
{
  unsigned int v5 = a2;
  if (a2 != a3)
  {
    uint64_t v7 = (unint64_t *)(a4 + 2);
    unint64_t v8 = a4[1];
    do
    {
      if (v8 >= *v7)
      {
        uint64_t v9 = (uint64_t)(v8 - *a4) >> 4;
        if ((unint64_t)(v9 + 1) >> 60) {
          sub_2638A2514();
        }
        uint64_t v10 = *v7 - *a4;
        uint64_t v11 = v10 >> 3;
        if (v10 >> 3 <= (unint64_t)(v9 + 1)) {
          uint64_t v11 = v9 + 1;
        }
        if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v12 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v12 = v11;
        }
        v17[4] = a4 + 2;
        long long v13 = (char *)sub_2638A61F0((uint64_t)(a4 + 2), v12);
        long long v14 = &v13[16 * v9];
        v17[0] = v13;
        v17[1] = v14;
        v17[3] = &v13[16 * v15];
        char *v14 = *v5;
        *((void *)v14 + 1) = *((void *)v5 + 1);
        *unsigned int v5 = 0;
        *((void *)v5 + 1) = 0;
        v17[2] = v14 + 16;
        sub_2638A6178(a4, v17);
        unint64_t v8 = a4[1];
        sub_2638A633C((uint64_t)v17);
      }
      else
      {
        *(unsigned char *)unint64_t v8 = *v5;
        *(void *)(v8 + 8) = *((void *)v5 + 1);
        *unsigned int v5 = 0;
        *((void *)v5 + 1) = 0;
        v8 += 16;
      }
      a4[1] = v8;
      v5 += 16;
    }
    while (v5 != a3);
    return a3;
  }
  return v5;
}

void sub_2638A64C4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_2638A633C((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_2638A64D8(uint64_t a1, char *a2)
{
  if (a2)
  {
    sub_2638A64D8(a1, *(void *)a2);
    sub_2638A64D8(a1, *((void *)a2 + 1));
    sub_2638A5C4C(a2 + 64, a2[56]);
    if (a2[55] < 0) {
      operator delete(*((void **)a2 + 4));
    }
    operator delete(a2);
  }
}

void sub_2638A6548(uint64_t a1, uint64_t a2)
{
  sub_2638A5C4C((char ***)(a2 + 32), *(unsigned __int8 *)(a2 + 24));
  if (*(char *)(a2 + 23) < 0)
  {
    uint64_t v3 = *(void **)a2;
    operator delete(v3);
  }
}

void sub_2638A659C(void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = v1[1];
    unsigned int v5 = **a1;
    if (v4 != v2)
    {
      uint64_t v6 = (uint64_t)v4 - 8;
      do
      {
        uint64_t v7 = (void *)(v6 - 8);
        sub_2638A5C4C(v6, *(unsigned __int8 *)(v6 - 8));
        v6 -= 16;
      }
      while (v7 != v2);
      unsigned int v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_2638A6638(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, __n128 *a2, uint64_t a3)
{
  uint64_t v6 = (unsigned __int8 *)*((void *)this + 1);
  if ((unint64_t)v6 >= *((void *)this + 2) || (char)*v6 < 0)
  {
    unint64_t TagFallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(this);
    *((_DWORD *)this + 8) = TagFallback;
    if (TagFallback) {
      goto LABEL_4;
    }
LABEL_10:
    if (*((unsigned char *)this + 36)) {
      return;
    }
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x263E6D1C0](exception, "Parsing failed in metric");
    goto LABEL_233;
  }
  unint64_t TagFallback = *v6;
  *((_DWORD *)this + 8) = TagFallback;
  *((void *)this + 1) = v6 + 1;
  if (!TagFallback) {
    goto LABEL_10;
  }
LABEL_4:
  unint64_t v8 = wis::reflect::decodeTag((wis::reflect *)TagFallback);
  unint64_t v9 = HIDWORD(v8);
  unsigned __int8 v10 = v8;
  __n128 v102 = *a2;
  unint64_t v103 = a2[1].n128_u64[0];
  MetricFileMetadataHelper::getSubfieldType((MetricFileMetadataHelper *)(a3 + 16), &v102, HIDWORD(v8), (uint64_t)&v104);
  long long v100 = v104;
  uint64_t v101 = v105;
  uint64_t BuiltinType = MetadataHelper::getBuiltinType(a3 + 16, (MetadataHandle *)&v100);
  int v12 = BuiltinType;
  uint64_t DecodingType = wis::reflect::getDecodingType(BuiltinType, v10);
  switch((int)DecodingType)
  {
    case 0:
      switch(v10)
      {
        case 0u:
          *(void *)int v118 = 0;
          if (sub_2638A7CF4(this, (unint64_t *)v118)) {
            goto LABEL_205;
          }
          goto LABEL_180;
        case 1u:
          *(void *)int v118 = 0;
          if (wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(this, (unint64_t *)v118))goto LABEL_180; {
LABEL_205:
          }
          unint64_t v79 = *(void *)v118;
          goto LABEL_208;
        case 2u:
          v116[0] = 0;
          if ((sub_2638A7D24(this, v116) & 1) == 0) {
            goto LABEL_180;
          }
          sub_2638AA7BC(v118, v116[0]);
          char Raw = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadRaw(this, *(void **)v118);
          if (Raw) {
            sub_2638A8078(a3, *(unsigned char **)v118, *(void *)&v118[2] - *(void *)v118, v9);
          }
          goto LABEL_196;
        case 5u:
          v118[0] = 0;
          if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(this, v118))goto LABEL_180; {
          unint64_t v79 = v118[0];
          }
LABEL_208:
          sub_2638A7FB4(a3, v79, v9);
          break;
        default:
          goto LABEL_180;
      }
      return;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
      v106[0] = 0;
      switch(v10)
      {
        case 0u:
          long long v14 = (char *)*((void *)this + 1);
          if ((unint64_t)v14 < *((void *)this + 2) && (*v14 & 0x80000000) == 0)
          {
            v106[0] = *v14;
            *((void *)this + 1) = v14 + 1;
LABEL_91:
            unint64_t v45 = v106[0];
            switch(v12)
            {
              case 1:
              case 15:
                double v49 = wis::protobuf::NumberConverter<(wis::reflect::Type)1>::decode(v106[0]);
                __n128 v108 = *a2;
                unint64_t v109 = a2[1].n128_u64[0];
                *(__n128 *)int v118 = *a2;
                unint64_t v119 = a2[1].n128_u64[0];
                uint64_t v47 = sub_2638A87C4(a3, (MetadataHandle *)v118, v9);
                memset(v116, 0, sizeof(v116));
                int64_t v117 = 0;
                if (v12 == 11)
                {
                  __n128 v112 = v108;
                  unint64_t v113 = v109;
                  sub_2638A8848(a3, (MetadataHandle *)&v112, v9, (unint64_t)v49, v114);
                  if (SHIBYTE(v117) < 0) {
                    operator delete(*(void **)v116);
                  }
                  *(_OWORD *)char v116 = *(_OWORD *)v114;
                  int64_t v117 = v115;
                }
                else if (v12 == 12)
                {
                  unint64_t v50 = sub_2638B9488(a3, v49 != 0.0);
                  MEMORY[0x263E6D240](v116, v50);
                }
                uint64_t v82 = HIBYTE(v117);
                if (v117 < 0) {
                  uint64_t v82 = *(void *)&v116[2];
                }
                if (!v82)
                {
                  *(__n128 *)unsigned int v114 = v108;
                  unint64_t v115 = v109;
                  uint64_t v83 = sub_2638A8AEC(a3, (MetadataHandle *)v114, v9);
                  ((void (*)(__n128 *__return_ptr, uint64_t, double))v83)(&v110, a3, v49);
                  if (SHIBYTE(v117) < 0) {
                    operator delete(*(void **)v116);
                  }
                  *(__n128 *)char v116 = v110;
                  int64_t v117 = v111;
                }
                goto LABEL_228;
              case 2:
              case 16:
                float v46 = wis::protobuf::NumberConverter<(wis::reflect::Type)2>::decode(v106[0]);
                __n128 v108 = *a2;
                unint64_t v109 = a2[1].n128_u64[0];
                *(__n128 *)int v118 = *a2;
                unint64_t v119 = a2[1].n128_u64[0];
                uint64_t v47 = sub_2638A87C4(a3, (MetadataHandle *)v118, v9);
                memset(v116, 0, sizeof(v116));
                int64_t v117 = 0;
                if (v12 == 11)
                {
                  __n128 v112 = v108;
                  unint64_t v113 = v109;
                  sub_2638A8848(a3, (MetadataHandle *)&v112, v9, (unint64_t)v46, v114);
                  if (SHIBYTE(v117) < 0) {
                    operator delete(*(void **)v116);
                  }
                  *(_OWORD *)char v116 = *(_OWORD *)v114;
                  int64_t v117 = v115;
                }
                else if (v12 == 12)
                {
                  uint64_t v48 = sub_2638B9488(a3, v46 != 0.0);
                  MEMORY[0x263E6D240](v116, v48);
                }
                uint64_t v80 = HIBYTE(v117);
                if (v117 < 0) {
                  uint64_t v80 = *(void *)&v116[2];
                }
                if (!v80)
                {
                  *(__n128 *)unsigned int v114 = v108;
                  unint64_t v115 = v109;
                  int v81 = sub_2638A8E5C(a3, (MetadataHandle *)v114, v9);
                  ((void (*)(__n128 *__return_ptr, uint64_t, float))v81)(&v110, a3, v46);
                  if (SHIBYTE(v117) < 0) {
                    operator delete(*(void **)v116);
                  }
                  *(__n128 *)char v116 = v110;
                  int64_t v117 = v111;
                }
LABEL_228:
                sub_2638B93F0(a3, v47, (uint64_t)v116);
                goto LABEL_229;
              case 3:
              case 11:
              case 17:
              case 25:
                *(void *)char v116 = v106[0];
                goto LABEL_103;
              case 4:
              case 10:
              case 18:
              case 24:
                *(void *)char v116 = v106[0];
                *(__n128 *)int v118 = *a2;
                unint64_t v119 = a2[1].n128_u64[0];
                sub_2638A8144(a3, (uint64_t *)v116, (long long *)v118, v9, v12);
                return;
              case 5:
              case 19:
                *(void *)char v116 = wis::protobuf::NumberConverter<(wis::reflect::Type)5>::decode(v106[0]);
LABEL_103:
                *(__n128 *)int v118 = *a2;
                unint64_t v119 = a2[1].n128_u64[0];
                sub_2638A8484(a3, (uint64_t *)v116, (long long *)v118, v9, v12);
                return;
              case 6:
              case 20:
                v116[0] = v106[0];
                goto LABEL_105;
              case 7:
              case 9:
              case 21:
              case 23:
                v116[0] = v106[0];
                *(__n128 *)int v118 = *a2;
                unint64_t v119 = a2[1].n128_u64[0];
                sub_2638A82E4(a3, v116, (long long *)v118, v9, v12);
                return;
              case 8:
              case 22:
                v116[0] = wis::protobuf::NumberConverter<(wis::reflect::Type)8>::decode(v106[0]);
LABEL_105:
                *(__n128 *)int v118 = *a2;
                unint64_t v119 = a2[1].n128_u64[0];
                sub_2638A8624(a3, v116, (long long *)v118, v9, v12);
                return;
              case 12:
              case 26:
                __n128 v110 = *a2;
                unint64_t v111 = a2[1].n128_u64[0];
                *(__n128 *)int v118 = *a2;
                unint64_t v119 = a2[1].n128_u64[0];
                uint64_t v51 = a3;
                unint64_t v52 = sub_2638A87C4(a3, (MetadataHandle *)v118, v9);
                memset(v116, 0, sizeof(v116));
                int64_t v117 = 0;
                if (v12 != 12) {
                  goto LABEL_110;
                }
                uint64_t v53 = sub_2638B9488(v51, v45 != 0);
                MEMORY[0x263E6D240](v116, v53);
                uint64_t v54 = HIBYTE(v117);
                if (v117 < 0) {
                  uint64_t v54 = *(void *)&v116[2];
                }
                if (!v54)
                {
LABEL_110:
                  *(__n128 *)unsigned int v114 = v110;
                  unint64_t v115 = v111;
                  unint64_t v55 = sub_2638A9018(v51, (MetadataHandle *)v114, v9);
                  ((void (*)(__n128 *__return_ptr, uint64_t, BOOL))v55)(&v112, v51, v45 != 0);
                  if (SHIBYTE(v117) < 0) {
                    operator delete(*(void **)v116);
                  }
                  *(__n128 *)char v116 = v112;
                  int64_t v117 = v113;
                }
                sub_2638B93F0(v51, v52, (uint64_t)v116);
LABEL_229:
                if (SHIBYTE(v117) < 0) {
                  operator delete(*(void **)v116);
                }
                return;
              default:
                exception = __cxa_allocate_exception(0x10uLL);
                MEMORY[0x263E6D1C0](exception, "This should never happen, no matter what the input!");
                goto LABEL_233;
            }
          }
          if (wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(this, v106)) {
            goto LABEL_91;
          }
          if (v9 || !*((unsigned char *)this + 36)) {
            goto LABEL_116;
          }
          return;
        case 1u:
          if (wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(this, v106)) {
            goto LABEL_91;
          }
          if (v9 || !*((unsigned char *)this + 36)) {
            goto LABEL_116;
          }
          return;
        case 2u:
          if (v9 || !*((unsigned char *)this + 36)) {
            goto LABEL_116;
          }
          return;
        case 5u:
          v118[0] = 0;
          if (wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(this, v118))
          {
            v106[0] = v118[0];
            goto LABEL_91;
          }
          if (!v9 && *((unsigned char *)this + 36)) {
            return;
          }
LABEL_116:
          exception = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x263E6D1C0](exception, "Parsing failed in metric");
          break;
        default:
          goto LABEL_91;
      }
      goto LABEL_233;
    case 13:
      v116[0] = 0;
      unint64_t v41 = (char *)*((void *)this + 1);
      if ((unint64_t)v41 >= *((void *)this + 2) || *v41 < 0)
      {
        if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, v116))goto LABEL_180; {
      }
        }
      else
      {
        v116[0] = *v41;
        *((void *)this + 1) = v41 + 1;
      }
      memset(v118, 0, sizeof(v118));
      unint64_t v119 = 0;
      char Raw = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadString();
      if (Raw)
      {
        __n128 v92 = *a2;
        unint64_t v93 = a2[1].n128_u64[0];
        sub_2638A7D54(a3, (uint64_t)v118, (long long *)&v92, v9);
      }
      if ((SHIBYTE(v119) & 0x80000000) == 0) {
        goto LABEL_199;
      }
      xpc_object_t v75 = *(void **)v118;
      goto LABEL_198;
    case 14:
      v116[0] = 0;
      unint64_t v43 = (char *)*((void *)this + 1);
      if ((unint64_t)v43 >= *((void *)this + 2) || *v43 < 0)
      {
        if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, v116))goto LABEL_180; {
        unsigned int v44 = v116[0];
        }
      }
      else
      {
        unsigned int v44 = *v43;
        v116[0] = v44;
        *((void *)this + 1) = v43 + 1;
      }
      sub_2638AA7BC(v118, v44);
      char Raw = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadRaw(this, *(void **)v118);
      if (Raw)
      {
        __n128 v90 = *a2;
        unint64_t v91 = a2[1].n128_u64[0];
        sub_2638A7DE8(a3, (uint64_t)v118, (long long *)&v90, v9);
      }
LABEL_196:
      xpc_object_t v75 = *(void **)v118;
      if (*(void *)v118)
      {
        *(void *)&v118[2] = *(void *)v118;
LABEL_198:
        operator delete(v75);
      }
LABEL_199:
      if (Raw) {
        return;
      }
      goto LABEL_180;
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
      unsigned int v87 = v9;
      unsigned int v99 = 0;
      unsigned int v16 = (unsigned __int8 *)*((void *)this + 1);
      if ((unint64_t)v16 >= *((void *)this + 2) || (char)*v16 < 0)
      {
        if (wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, &v99)) {
          goto LABEL_16;
        }
LABEL_180:
        if (!v9 && *((unsigned char *)this + 36)) {
          return;
        }
        exception = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x263E6D1C0](exception, "Parsing failed in metric");
LABEL_233:
        __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
      }
      unsigned int v99 = *v16;
      *((void *)this + 1) = v16 + 1;
LABEL_16:
      uint64_t v86 = a3;
      int UnpackedType = wis::reflect::getUnpackedType(DecodingType);
      int WireTypeForType = wis::reflect::getWireTypeForType(UnpackedType);
      char v97 = this;
      int v98 = wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(this);
      std::string __p = 0;
      xpc_object_t v95 = 0;
      unint64_t v96 = 0;
      while (1)
      {
        int v18 = wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(this);
        if (v18 < 1) {
          break;
        }
        unsigned int v19 = v95;
        if (v95 >= v96)
        {
          int v21 = (char *)__p;
          uint64_t v22 = (v95 - (unsigned char *)__p) >> 3;
          unint64_t v23 = v22 + 1;
          if ((unint64_t)(v22 + 1) >> 61) {
            sub_2638A2514();
          }
          uint64_t v24 = v96 - (unsigned char *)__p;
          if ((v96 - (unsigned char *)__p) >> 2 > v23) {
            unint64_t v23 = v24 >> 2;
          }
          if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v25 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v25 = v23;
          }
          if (v25)
          {
            uint64_t v26 = (char *)sub_26389E00C((uint64_t)&v96, v25);
            int v21 = (char *)__p;
            unsigned int v19 = v95;
          }
          else
          {
            uint64_t v26 = 0;
          }
          unint64_t v27 = &v26[8 * v22];
          *(void *)unint64_t v27 = 0;
          int v20 = v27 + 8;
          while (v19 != v21)
          {
            uint64_t v28 = *((void *)v19 - 1);
            v19 -= 8;
            *((void *)v27 - 1) = v28;
            v27 -= 8;
          }
          std::string __p = v27;
          xpc_object_t v95 = v20;
          unint64_t v96 = &v26[8 * v25];
          if (v21) {
            operator delete(v21);
          }
        }
        else
        {
          *(void *)xpc_object_t v95 = 0;
          int v20 = v19 + 8;
        }
        xpc_object_t v95 = v20;
        switch(WireTypeForType)
        {
          case 0:
            uint64_t v29 = (unint64_t *)(v20 - 8);
            uint64_t v30 = (char *)*((void *)this + 1);
            if ((unint64_t)v30 >= *((void *)this + 2) || *v30 < 0)
            {
              char Varint64Fallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(this, v29);
LABEL_42:
              if ((Varint64Fallback & 1) == 0) {
                goto LABEL_177;
              }
            }
            else
            {
              unint64_t *v29 = *v30;
              *((void *)this + 1) = v30 + 1;
            }
            break;
          case 1:
            char Varint64Fallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(this, (unint64_t *)v20 - 1);
            goto LABEL_42;
          case 2:
            goto LABEL_177;
          case 5:
            v118[0] = 0;
            char LittleEndian32Fallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(this, v118);
            *((void *)v95 - 1) = v118[0];
            if ((LittleEndian32Fallback & 1) == 0) {
              goto LABEL_177;
            }
            continue;
          default:
            continue;
        }
      }
      switch((int)DecodingType)
      {
        case 15:
          sub_2638A9784((uint64_t *)&__p, &v108);
          *(__n128 *)long long v106 = *a2;
          unint64_t v107 = a2[1].n128_u64[0];
          *(__n128 *)int v118 = *a2;
          unint64_t v119 = a2[1].n128_u64[0];
          unint64_t v33 = sub_2638A87C4(a3, (MetadataHandle *)v118, v87);
          unint64_t v34 = (double *)v108.n128_u64[1];
          xpc_object_t v35 = (double *)v108.n128_u64[0];
          if (v108.n128_u64[0] == v108.n128_u64[1]) {
            goto LABEL_169;
          }
          uint64_t v36 = v33;
          unsigned __int8 v37 = 0;
          do
          {
            double v38 = *v35;
            memset(v116, 0, sizeof(v116));
            int64_t v117 = 0;
            if (UnpackedType == 11)
            {
              __n128 v112 = *(__n128 *)v106;
              unint64_t v113 = v107;
              sub_2638A8848(a3, (MetadataHandle *)&v112, v87, (unint64_t)v38, v114);
              if (SHIBYTE(v117) < 0) {
                operator delete(*(void **)v116);
              }
              *(_OWORD *)char v116 = *(_OWORD *)v114;
              int64_t v117 = v115;
            }
            else if (UnpackedType == 12)
            {
              uint64_t v39 = sub_2638B9488(a3, v38 != 0.0);
              MEMORY[0x263E6D240](v116, v39);
            }
            uint64_t v40 = HIBYTE(v117);
            if (v117 < 0) {
              uint64_t v40 = *(void *)&v116[2];
            }
            if (!v40)
            {
              if (!v37)
              {
                __n128 v110 = *(__n128 *)v106;
                unint64_t v111 = v107;
                unsigned __int8 v37 = sub_2638A8AEC(a3, (MetadataHandle *)&v110, v87);
              }
              ((void (*)(unsigned int *__return_ptr, uint64_t, double))v37)(v114, a3, v38);
              if (SHIBYTE(v117) < 0) {
                operator delete(*(void **)v116);
              }
              *(_OWORD *)char v116 = *(_OWORD *)v114;
              int64_t v117 = v115;
            }
            sub_2638B93F0(a3, v36, (uint64_t)v116);
            if (SHIBYTE(v117) < 0) {
              operator delete(*(void **)v116);
            }
            ++v35;
          }
          while (v35 != v34);
          goto LABEL_168;
        case 16:
          sub_2638A9A5C((uint64_t *)&__p, &v108);
          *(__n128 *)long long v106 = *a2;
          unint64_t v107 = a2[1].n128_u64[0];
          *(__n128 *)int v118 = *a2;
          unint64_t v119 = a2[1].n128_u64[0];
          unint64_t v66 = sub_2638A87C4(a3, (MetadataHandle *)v118, v87);
          uint64_t v67 = (double *)v108.n128_u64[1];
          xpc_object_t v35 = (double *)v108.n128_u64[0];
          if (v108.n128_u64[0] == v108.n128_u64[1]) {
            goto LABEL_169;
          }
          int v68 = v66;
          unsigned int v69 = 0;
          do
          {
            float v70 = *(float *)v35;
            memset(v116, 0, sizeof(v116));
            int64_t v117 = 0;
            if (UnpackedType == 11)
            {
              __n128 v112 = *(__n128 *)v106;
              unint64_t v113 = v107;
              sub_2638A8848(a3, (MetadataHandle *)&v112, v87, (unint64_t)v70, v114);
              if (SHIBYTE(v117) < 0) {
                operator delete(*(void **)v116);
              }
              *(_OWORD *)char v116 = *(_OWORD *)v114;
              int64_t v117 = v115;
            }
            else if (UnpackedType == 12)
            {
              unint64_t v71 = sub_2638B9488(a3, v70 != 0.0);
              MEMORY[0x263E6D240](v116, v71);
            }
            uint64_t v72 = HIBYTE(v117);
            if (v117 < 0) {
              uint64_t v72 = *(void *)&v116[2];
            }
            if (!v72)
            {
              if (!v69)
              {
                __n128 v110 = *(__n128 *)v106;
                unint64_t v111 = v107;
                unsigned int v69 = sub_2638A8E5C(a3, (MetadataHandle *)&v110, v87);
              }
              ((void (*)(unsigned int *__return_ptr, uint64_t, float))v69)(v114, a3, v70);
              if (SHIBYTE(v117) < 0) {
                operator delete(*(void **)v116);
              }
              *(_OWORD *)char v116 = *(_OWORD *)v114;
              int64_t v117 = v115;
            }
            sub_2638B93F0(a3, v68, (uint64_t)v116);
            if (SHIBYTE(v117) < 0) {
              operator delete(*(void **)v116);
            }
            xpc_object_t v35 = (double *)((char *)v35 + 4);
          }
          while (v35 != v67);
LABEL_168:
          xpc_object_t v35 = (double *)v108.n128_u64[0];
LABEL_169:
          if (!v35) {
            goto LABEL_177;
          }
          v108.n128_u64[1] = (unint64_t)v35;
LABEL_171:
          int v73 = v35;
          break;
        case 17:
        case 25:
          sub_2638A9700((uint64_t *)&__p, v118);
          *(__n128 *)char v116 = *a2;
          int64_t v117 = a2[1].n128_i64[0];
          sub_2638A9B68(a3, (uint64_t **)v118, (long long *)v116, v87, UnpackedType);
          goto LABEL_174;
        case 18:
        case 24:
          sub_2638A9700((uint64_t *)&__p, v118);
          *(__n128 *)char v116 = *a2;
          int64_t v117 = a2[1].n128_i64[0];
          sub_2638A9534(a3, (uint64_t **)v118, (long long *)v116, v87, UnpackedType);
          goto LABEL_174;
        case 19:
          sub_2638A9D34((uint64_t *)&__p, v118);
          *(__n128 *)char v116 = *a2;
          int64_t v117 = a2[1].n128_i64[0];
          sub_2638A9B68(a3, (uint64_t **)v118, (long long *)v116, v87, UnpackedType);
          goto LABEL_174;
        case 20:
          sub_2638A99D8((uint64_t *)&__p, v118);
          *(__n128 *)char v116 = *a2;
          int64_t v117 = a2[1].n128_i64[0];
          sub_2638A9DBC(a3, (int **)v118, (long long *)v116, v87, UnpackedType);
          goto LABEL_174;
        case 21:
        case 23:
          sub_2638A99D8((uint64_t *)&__p, v118);
          *(__n128 *)char v116 = *a2;
          int64_t v117 = a2[1].n128_i64[0];
          sub_2638A980C(a3, (unsigned int **)v118, (long long *)v116, v87, UnpackedType);
          goto LABEL_174;
        case 22:
          sub_2638A9F88((uint64_t *)&__p, v118);
          *(__n128 *)char v116 = *a2;
          int64_t v117 = a2[1].n128_i64[0];
          sub_2638A9DBC(a3, (int **)v118, (long long *)v116, v87, UnpackedType);
LABEL_174:
          int v73 = *(double **)v118;
          if (!*(void *)v118) {
            goto LABEL_177;
          }
          *(void *)&v118[2] = *(void *)v118;
          break;
        case 26:
          sub_2638A9AE4((uint64_t)&__p, &v108);
          *(__n128 *)long long v106 = *a2;
          unint64_t v107 = a2[1].n128_u64[0];
          *(__n128 *)int v118 = *a2;
          unint64_t v119 = a2[1].n128_u64[0];
          char v56 = sub_2638A87C4(a3, (MetadataHandle *)v118, v87);
          xpc_object_t v35 = (double *)v108.n128_u64[0];
          int v57 = v108.n128_u8[8] & 0x3F;
          if (v108.n128_u64[1] > 0x3F || (v108.n128_u8[8] & 0x3F) != 0)
          {
            BOOL v58 = 0;
            int v59 = 0;
            unint64_t v60 = (double *)(v108.n128_u64[0] + 8 * (v108.n128_u64[1] >> 6));
            do
            {
              uint64_t v61 = 1 << v59;
              memset(v116, 0, sizeof(v116));
              int64_t v117 = 0;
              int v62 = v59;
              if (UnpackedType == 11)
              {
                __n128 v112 = *(__n128 *)v106;
                unint64_t v113 = v107;
                sub_2638A8848(v86, (MetadataHandle *)&v112, v87, (*(void *)v35 >> v59) & 1, v114);
                if (SHIBYTE(v117) < 0) {
                  operator delete(*(void **)v116);
                }
                *(_OWORD *)char v116 = *(_OWORD *)v114;
                int64_t v117 = v115;
              }
              else if (UnpackedType == 12)
              {
                uint64_t v63 = sub_2638B9488(v86, (*(void *)v35 & v61) != 0);
                MEMORY[0x263E6D240](v116, v63);
              }
              uint64_t v64 = HIBYTE(v117);
              if (v117 < 0) {
                uint64_t v64 = *(void *)&v116[2];
              }
              if (v64)
              {
                uint64_t v65 = v86;
              }
              else
              {
                if (!v58)
                {
                  __n128 v110 = *(__n128 *)v106;
                  unint64_t v111 = v107;
                  BOOL v58 = sub_2638A9018(v86, (MetadataHandle *)&v110, v87);
                }
                uint64_t v65 = v86;
                ((void (*)(unsigned int *__return_ptr, uint64_t, BOOL))v58)(v114, v86, (*(void *)v35 & v61) != 0);
                if (SHIBYTE(v117) < 0) {
                  operator delete(*(void **)v116);
                }
                *(_OWORD *)char v116 = *(_OWORD *)v114;
                int64_t v117 = v115;
              }
              sub_2638B93F0(v65, v56, (uint64_t)v116);
              if (SHIBYTE(v117) < 0) {
                operator delete(*(void **)v116);
              }
              v35 += v62 == 63;
              if (v62 == 63) {
                int v59 = 0;
              }
              else {
                int v59 = v62 + 1;
              }
            }
            while (v35 != v60 || v59 != v57);
            xpc_object_t v35 = (double *)v108.n128_u64[0];
          }
          if (!v35) {
            goto LABEL_177;
          }
          goto LABEL_171;
        default:
          uint64_t v84 = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x263E6D1C0](v84, "This should never happen, no matter what the input!");
          __cxa_throw(v84, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
      }
      operator delete(v73);
LABEL_177:
      if (__p)
      {
        xpc_object_t v95 = (char *)__p;
        operator delete(__p);
      }
      wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(v97);
      LODWORD(v9) = v87;
      if (v18 > 0) {
        goto LABEL_180;
      }
      return;
    case 27:
      v114[0] = 0;
      unint64_t v42 = (char *)*((void *)this + 1);
      if ((unint64_t)v42 >= *((void *)this + 2) || *v42 < 0)
      {
        if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, v114))goto LABEL_180; {
      }
        }
      else
      {
        v114[0] = *v42;
        *((void *)this + 1) = v42 + 1;
      }
      *(void *)int v118 = this;
      v118[2] = wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(this);
      ++*((_DWORD *)this + 14);
      *(void *)char v116 = this;
      __n128 v88 = *a2;
      unint64_t v89 = a2[1].n128_u64[0];
      sub_2638A7E8C(a3, this, (long long *)&v88, v9);
      sub_2638A7F78((wireless_diagnostics::google::protobuf::io::CodedInputStream **)v116);
      int v76 = *((_DWORD *)this + 14);
      BOOL v77 = __OFSUB__(v76, 1);
      int v78 = v76 - 1;
      if (v78 < 0 == v77) {
        *((_DWORD *)this + 14) = v78;
      }
      sub_2638A2140((wireless_diagnostics::google::protobuf::io::CodedInputStream **)v118);
      return;
    default:
      goto LABEL_180;
  }
}

void sub_2638A79C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,void *a49,uint64_t a50)
{
  __cxa_free_exception(v50);
  _Unwind_Resume(a1);
}

uint64_t sub_2638A7CBC(uint64_t a1)
{
  sub_26389B614(a1 + 56);
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 24);
  if (v2) {
    sub_26389F6D4(v2);
  }
  return a1;
}

uint64_t sub_2638A7CF4(wireless_diagnostics::google::protobuf::io::CodedInputStream *a1, unint64_t *a2)
{
  uint64_t v2 = (unsigned __int8 *)*((void *)a1 + 1);
  if ((unint64_t)v2 >= *((void *)a1 + 2) || (char)*v2 < 0) {
    return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(a1, a2);
  }
  *a2 = *v2;
  *((void *)a1 + 1) = v2 + 1;
  return 1;
}

uint64_t sub_2638A7D24(wireless_diagnostics::google::protobuf::io::CodedInputStream *a1, unsigned int *a2)
{
  uint64_t v2 = (unsigned __int8 *)*((void *)a1 + 1);
  if ((unint64_t)v2 >= *((void *)a1 + 2) || (char)*v2 < 0) {
    return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a1, a2);
  }
  *a2 = *v2;
  *((void *)a1 + 1) = v2 + 1;
  return 1;
}

void sub_2638A7D54(uint64_t a1, uint64_t a2, long long *a3, unsigned int a4)
{
  long long v8 = *a3;
  uint64_t v9 = *((void *)a3 + 2);
  uint64_t v6 = sub_2638A87C4(a1, (MetadataHandle *)&v8, a4);
  sub_2638B94CC((unsigned __int8 *)a2, &v7);
  if (*(char *)(a2 + 23) < 0) {
    operator delete(*(void **)a2);
  }
  *(std::string *)a2 = v7;
  sub_2638B93F0(a1, v6, a2);
}

void sub_2638A7DE8(uint64_t a1, uint64_t a2, long long *a3, unsigned int a4)
{
  long long v8 = *a3;
  uint64_t v9 = *((void *)a3 + 2);
  uint64_t v6 = sub_2638A87C4(a1, (MetadataHandle *)&v8, a4);
  sub_2638B9730(*(void *)(a2 + 8) - *(void *)a2, *(unsigned char **)a2, &__p);
  sub_2638B93F0(a1, v6, (uint64_t)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_2638A7E70(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

std::string *sub_2638A7E8C(uint64_t a1, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2, long long *a3, unsigned int a4)
{
  long long v8 = *a3;
  uint64_t v9 = *((void *)a3 + 2);
  uint64_t v6 = sub_2638A87C4(a1, (MetadataHandle *)&v8, a4);
  sub_2638B93DC(a1);
  std::string::append(*(std::string **)a1, v6);
  std::string::append(*(std::string **)a1, " {\n");
  ++*(void *)(a1 + 8);
  if ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(a2) >= 1)
  {
    do
      sub_2638A6638(a2);
    while ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(a2) > 0);
  }
  --*(void *)(a1 + 8);
  sub_2638B93DC(a1);
  return std::string::append(*(std::string **)a1, "}\n");
}

wireless_diagnostics::google::protobuf::io::CodedInputStream **sub_2638A7F78(wireless_diagnostics::google::protobuf::io::CodedInputStream **a1)
{
  return a1;
}

void sub_2638A7FB4(uint64_t a1, unint64_t a2, unsigned int __val)
{
  sub_2638B94BC(__val, &v7);
  sub_2638B94AC(a2, &__p);
  if ((v7.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    unsigned int v5 = &v7;
  }
  else {
    unsigned int v5 = (std::string *)v7.__r_.__value_.__r.__words[0];
  }
  sub_2638B93F0(a1, (const std::string::value_type *)v5, (uint64_t)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v7.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v7.__r_.__value_.__l.__data_);
  }
}

void sub_2638A8044(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  _Unwind_Resume(exception_object);
}

void sub_2638A8078(uint64_t a1, unsigned char *a2, unint64_t a3, unsigned int __val)
{
  sub_2638B94BC(__val, &v9);
  sub_2638B9730(a3, a2, &__p);
  if ((v9.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string v7 = &v9;
  }
  else {
    std::string v7 = (std::string *)v9.__r_.__value_.__r.__words[0];
  }
  sub_2638B93F0(a1, (const std::string::value_type *)v7, (uint64_t)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v9.__r_.__value_.__l.__data_);
  }
}

void sub_2638A8110(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  _Unwind_Resume(exception_object);
}

void sub_2638A8144(uint64_t a1, uint64_t *a2, long long *a3, unsigned int a4, int a5)
{
  long long v22 = *a3;
  uint64_t v23 = *((void *)a3 + 2);
  unsigned __int8 v10 = sub_2638A87C4(a1, (MetadataHandle *)&v22, a4);
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v21 = 0;
  if (a5 == 11)
  {
    long long v16 = *a3;
    uint64_t v17 = *((void *)a3 + 2);
    sub_2638A8848(a1, (MetadataHandle *)&v16, a4, *a2, &v18);
    if (SHIBYTE(v21) < 0) {
      operator delete(__p[0]);
    }
    *(_OWORD *)std::string __p = v18;
    uint64_t v21 = v19;
  }
  else if (a5 == 12)
  {
    uint64_t v11 = sub_2638B9488(a1, *a2 != 0);
    MEMORY[0x263E6D240](__p, v11);
  }
  int v12 = (void *)HIBYTE(v21);
  if (v21 < 0) {
    int v12 = __p[1];
  }
  if (!v12)
  {
    long long v14 = *a3;
    uint64_t v15 = *((void *)a3 + 2);
    long long v13 = sub_2638A8938(a1, (MetadataHandle *)&v14, a4);
    ((void (*)(long long *__return_ptr, uint64_t, uint64_t))v13)(&v18, a1, *a2);
    if (SHIBYTE(v21) < 0) {
      operator delete(__p[0]);
    }
    *(_OWORD *)std::string __p = v18;
    uint64_t v21 = v19;
  }
  sub_2638B93F0(a1, v10, (uint64_t)__p);
  if (SHIBYTE(v21) < 0) {
    operator delete(__p[0]);
  }
}

void sub_2638A82BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_2638A82E4(uint64_t a1, _DWORD *a2, long long *a3, unsigned int a4, int a5)
{
  long long v22 = *a3;
  uint64_t v23 = *((void *)a3 + 2);
  unsigned __int8 v10 = sub_2638A87C4(a1, (MetadataHandle *)&v22, a4);
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v21 = 0;
  if (a5 == 11)
  {
    long long v16 = *a3;
    uint64_t v17 = *((void *)a3 + 2);
    sub_2638A8848(a1, (MetadataHandle *)&v16, a4, *a2, &v18);
    if (SHIBYTE(v21) < 0) {
      operator delete(__p[0]);
    }
    *(_OWORD *)std::string __p = v18;
    uint64_t v21 = v19;
  }
  else if (a5 == 12)
  {
    uint64_t v11 = sub_2638B9488(a1, *a2 != 0);
    MEMORY[0x263E6D240](__p, v11);
  }
  int v12 = (void *)HIBYTE(v21);
  if (v21 < 0) {
    int v12 = __p[1];
  }
  if (!v12)
  {
    long long v14 = *a3;
    uint64_t v15 = *((void *)a3 + 2);
    long long v13 = sub_2638A8CA8(a1, (MetadataHandle *)&v14, a4);
    ((void (*)(long long *__return_ptr, uint64_t, void))v13)(&v18, a1, *a2);
    if (SHIBYTE(v21) < 0) {
      operator delete(__p[0]);
    }
    *(_OWORD *)std::string __p = v18;
    uint64_t v21 = v19;
  }
  sub_2638B93F0(a1, v10, (uint64_t)__p);
  if (SHIBYTE(v21) < 0) {
    operator delete(__p[0]);
  }
}

void sub_2638A845C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_2638A8484(uint64_t a1, uint64_t *a2, long long *a3, unsigned int a4, int a5)
{
  long long v22 = *a3;
  uint64_t v23 = *((void *)a3 + 2);
  unsigned __int8 v10 = sub_2638A87C4(a1, (MetadataHandle *)&v22, a4);
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v21 = 0;
  if (a5 == 11)
  {
    long long v16 = *a3;
    uint64_t v17 = *((void *)a3 + 2);
    sub_2638A8848(a1, (MetadataHandle *)&v16, a4, *a2, &v18);
    if (SHIBYTE(v21) < 0) {
      operator delete(__p[0]);
    }
    *(_OWORD *)std::string __p = v18;
    uint64_t v21 = v19;
  }
  else if (a5 == 12)
  {
    uint64_t v11 = sub_2638B9488(a1, *a2 != 0);
    MEMORY[0x263E6D240](__p, v11);
  }
  int v12 = (void *)HIBYTE(v21);
  if (v21 < 0) {
    int v12 = __p[1];
  }
  if (!v12)
  {
    long long v14 = *a3;
    uint64_t v15 = *((void *)a3 + 2);
    long long v13 = sub_2638A91CC(a1, (MetadataHandle *)&v14, a4);
    ((void (*)(long long *__return_ptr, uint64_t, uint64_t))v13)(&v18, a1, *a2);
    if (SHIBYTE(v21) < 0) {
      operator delete(__p[0]);
    }
    *(_OWORD *)std::string __p = v18;
    uint64_t v21 = v19;
  }
  sub_2638B93F0(a1, v10, (uint64_t)__p);
  if (SHIBYTE(v21) < 0) {
    operator delete(__p[0]);
  }
}

void sub_2638A85FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_2638A8624(uint64_t a1, unsigned int *a2, long long *a3, unsigned int a4, int a5)
{
  long long v22 = *a3;
  uint64_t v23 = *((void *)a3 + 2);
  unsigned __int8 v10 = sub_2638A87C4(a1, (MetadataHandle *)&v22, a4);
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v21 = 0;
  if (a5 == 11)
  {
    long long v16 = *a3;
    uint64_t v17 = *((void *)a3 + 2);
    sub_2638A8848(a1, (MetadataHandle *)&v16, a4, (int)*a2, &v18);
    if (SHIBYTE(v21) < 0) {
      operator delete(__p[0]);
    }
    *(_OWORD *)std::string __p = v18;
    uint64_t v21 = v19;
  }
  else if (a5 == 12)
  {
    uint64_t v11 = sub_2638B9488(a1, *a2 != 0);
    MEMORY[0x263E6D240](__p, v11);
  }
  int v12 = (void *)HIBYTE(v21);
  if (v21 < 0) {
    int v12 = __p[1];
  }
  if (!v12)
  {
    long long v14 = *a3;
    uint64_t v15 = *((void *)a3 + 2);
    long long v13 = sub_2638A9380(a1, (MetadataHandle *)&v14, a4);
    ((void (*)(long long *__return_ptr, uint64_t, void))v13)(&v18, a1, *a2);
    if (SHIBYTE(v21) < 0) {
      operator delete(__p[0]);
    }
    *(_OWORD *)std::string __p = v18;
    uint64_t v21 = v19;
  }
  sub_2638B93F0(a1, v10, (uint64_t)__p);
  if (SHIBYTE(v21) < 0) {
    operator delete(__p[0]);
  }
}

void sub_2638A879C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

char *sub_2638A87C4(uint64_t a1, MetadataHandle *a2, unsigned int a3)
{
  __n128 v6 = *(__n128 *)a2;
  uint64_t v7 = *((void *)a2 + 2);
  MetricFileMetadataHelper::getSubfieldType((MetricFileMetadataHelper *)(a1 + 16), &v6, a3, (uint64_t)&v8);
  *(_OWORD *)a2 = v8;
  *((void *)a2 + 2) = v9;
  uint64_t Field = MetadataHandle::getField(a2);
  if (!Field) {
    return (char *)&unk_2638C8ADA;
  }
  uint64_t result = *(char **)(Field + 8);
  if (!result) {
    return (char *)&unk_2638C8ADA;
  }
  if (result[23] < 0) {
    return *(char **)result;
  }
  return result;
}

void *sub_2638A8848@<X0>(uint64_t a1@<X0>, MetadataHandle *a2@<X1>, unsigned int a3@<W2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  __n128 v15 = *(__n128 *)a2;
  uint64_t v16 = *((void *)a2 + 2);
  MetricFileMetadataHelper::getSubfieldType((MetricFileMetadataHelper *)(a1 + 16), &v15, a3, (uint64_t)&v17);
  *(_OWORD *)a2 = v17;
  *((void *)a2 + 2) = v18;
  uint64_t result = (void *)MetadataHandle::getEnum(a2);
  if (!result) {
    return sub_2638A5294(a5, (char *)&unk_2638C8ADA);
  }
  uint64_t v9 = (uint64_t *)result[1];
  unsigned __int8 v10 = (uint64_t *)result[2];
  if (v9 == v10) {
    return sub_2638A5294(a5, (char *)&unk_2638C8ADA);
  }
  while (1)
  {
    uint64_t v11 = *v9;
    uint64_t v12 = (*(unsigned char *)(*v9 + 32) & 2) != 0 ? 24 : 16;
    if (*(void *)(v11 + v12) == a4) {
      break;
    }
    if (++v9 == v10) {
      return sub_2638A5294(a5, (char *)&unk_2638C8ADA);
    }
  }
  long long v13 = *(long long **)(v11 + 8);
  if (*((char *)v13 + 23) < 0) {
    return sub_2638A2398(a5, *(void **)v13, *((void *)v13 + 1));
  }
  long long v14 = *v13;
  a5[2] = *((void *)v13 + 2);
  *(_OWORD *)a5 = v14;
  return result;
}

uint64_t (*sub_2638A8938(uint64_t a1, MetadataHandle *a2, unsigned int a3))()
{
  uint64_t v3 = sub_2638A89FC;
  if (*(unsigned char *)(a1 + 120))
  {
    __n128 v8 = *(__n128 *)a2;
    uint64_t v9 = *((void *)a2 + 2);
    MetricFileMetadataHelper::getSubfieldType((MetricFileMetadataHelper *)(a1 + 16), &v8, a3, (uint64_t)&v10);
    *(_OWORD *)a2 = v10;
    *((void *)a2 + 2) = v11;
    uint64_t Field = MetadataHandle::getField(a2);
    uint64_t v3 = sub_2638A89FC;
    if (Field)
    {
      uint64_t v3 = sub_2638A89FC;
      if ((*(_WORD *)(Field + 52) & 0x20) != 0)
      {
        unsigned int v6 = *(_DWORD *)(Field + 36) - 1;
        uint64_t v3 = sub_2638A89FC;
        if (v6 <= 0x1F) {
          return off_270EB6420[v6];
        }
      }
    }
  }
  return (uint64_t (*)())v3;
}

void sub_2638A8A00(unint64_t a1@<X1>, uint64_t a2@<X8>)
{
}

void sub_2638A8A08(__n128 *a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
}

void sub_2638A8A10(__n128 *a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
}

void sub_2638A8A18(unint64_t a1@<X1>, std::string *a2@<X8>)
{
  sub_2638C39EC(a1, &v4);
  uint64_t v3 = std::string::insert(&v4, 0, "0x");
  *a2 = *v3;
  v3->__r_.__value_.__l.__size_ = 0;
  v3->__r_.__value_.__r.__words[2] = 0;
  v3->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v4.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v4.__r_.__value_.__l.__data_);
  }
}

void sub_2638A8A88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_2638A8AA4(unint64_t a1@<X1>, uint64_t a2@<X8>)
{
}

void sub_2638A8AAC(unint64_t a1@<X1>, uint64_t a2@<X8>)
{
}

void sub_2638A8AB4(unint64_t a1@<X1>, uint64_t a2@<X8>)
{
}

void sub_2638A8ABC(unint64_t a1@<X1>, uint64_t a2@<X8>)
{
}

void sub_2638A8AC4(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
}

void sub_2638A8ACC(char a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638A8AD4(time_t a1@<X1>, uint64_t a2@<X8>)
{
}

void sub_2638A8ADC(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
}

void sub_2638A8AE4(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
}

uint64_t (*sub_2638A8AEC(uint64_t a1, MetadataHandle *a2, unsigned int a3))()
{
  std::string *(__cdecl *v3)(std::string *__return_ptr __struct_ptr, double);
  uint64_t Field;
  unsigned int v6;
  __n128 v8;
  uint64_t v9;
  long long v10;
  uint64_t v11;

  uint64_t v3 = j_std::to_string;
  if (*(unsigned char *)(a1 + 120))
  {
    __n128 v8 = *(__n128 *)a2;
    uint64_t v9 = *((void *)a2 + 2);
    MetricFileMetadataHelper::getSubfieldType((MetricFileMetadataHelper *)(a1 + 16), &v8, a3, (uint64_t)&v10);
    *(_OWORD *)a2 = v10;
    *((void *)a2 + 2) = v11;
    uint64_t Field = MetadataHandle::getField(a2);
    uint64_t v3 = j_std::to_string;
    if (Field)
    {
      uint64_t v3 = j_std::to_string;
      if ((*(_WORD *)(Field + 52) & 0x20) != 0)
      {
        unsigned int v6 = *(_DWORD *)(Field + 36) - 1;
        uint64_t v3 = j_std::to_string;
        if (v6 <= 0x1F) {
          return off_270EB6520[v6];
        }
      }
    }
  }
  return (uint64_t (*)())v3;
}

void sub_2638A8BB4(uint64_t a1@<X8>, double a2@<D0>)
{
}

void sub_2638A8BBC(__n128 *a1@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
}

void sub_2638A8BC8(__n128 *a1@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
}

void sub_2638A8BD4(std::string *a1@<X8>, double a2@<D0>)
{
  sub_2638C39EC((unint64_t)a2, &v4);
  uint64_t v3 = std::string::insert(&v4, 0, "0x");
  *a1 = *v3;
  v3->__r_.__value_.__l.__size_ = 0;
  v3->__r_.__value_.__r.__words[2] = 0;
  v3->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v4.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v4.__r_.__value_.__l.__data_);
  }
}

void sub_2638A8C44(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_2638A8C60(uint64_t a1@<X8>, double a2@<D0>)
{
}

void sub_2638A8C68(uint64_t a1@<X8>, double a2@<D0>)
{
}

void sub_2638A8C70(uint64_t a1@<X8>, double a2@<D0>)
{
}

void sub_2638A8C78(uint64_t a1@<X8>, double a2@<D0>)
{
}

void sub_2638A8C80(uint64_t a1@<X8>, double a2@<D0>)
{
}

void sub_2638A8C88(uint64_t a1@<X8>, double a2@<D0>)
{
}

void sub_2638A8C90(uint64_t a1@<X8>, double a2@<D0>)
{
}

void sub_2638A8C98(uint64_t a1@<X8>, double a2@<D0>)
{
}

void sub_2638A8CA0(uint64_t a1@<X8>, double a2@<D0>)
{
}

uint64_t (*sub_2638A8CA8(uint64_t a1, MetadataHandle *a2, unsigned int a3))()
{
  uint64_t v3 = sub_2638A8D6C;
  if (*(unsigned char *)(a1 + 120))
  {
    __n128 v8 = *(__n128 *)a2;
    uint64_t v9 = *((void *)a2 + 2);
    MetricFileMetadataHelper::getSubfieldType((MetricFileMetadataHelper *)(a1 + 16), &v8, a3, (uint64_t)&v10);
    *(_OWORD *)a2 = v10;
    *((void *)a2 + 2) = v11;
    uint64_t Field = MetadataHandle::getField(a2);
    uint64_t v3 = sub_2638A8D6C;
    if (Field)
    {
      uint64_t v3 = sub_2638A8D6C;
      if ((*(_WORD *)(Field + 52) & 0x20) != 0)
      {
        unsigned int v6 = *(_DWORD *)(Field + 36) - 1;
        uint64_t v3 = sub_2638A8D6C;
        if (v6 <= 0x1F) {
          return off_270EB6620[v6];
        }
      }
    }
  }
  return (uint64_t (*)())v3;
}

void sub_2638A8D70(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638A8D78(__n128 *a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
}

void sub_2638A8D80(__n128 *a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
}

void sub_2638A8D88(unsigned int a1@<W1>, std::string *a2@<X8>)
{
  sub_2638C39EC(a1, &v4);
  uint64_t v3 = std::string::insert(&v4, 0, "0x");
  *a2 = *v3;
  v3->__r_.__value_.__l.__size_ = 0;
  v3->__r_.__value_.__r.__words[2] = 0;
  v3->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v4.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v4.__r_.__value_.__l.__data_);
  }
}

void sub_2638A8DF8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_2638A8E14(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638A8E1C(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638A8E24(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638A8E2C(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638A8E34(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638A8E3C(char a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638A8E44(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638A8E4C(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638A8E54(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
}

uint64_t (*sub_2638A8E5C(uint64_t a1, MetadataHandle *a2, unsigned int a3))()
{
  std::string *(__cdecl *v3)(std::string *__return_ptr __struct_ptr, float);
  uint64_t Field;
  unsigned int v6;
  __n128 v8;
  uint64_t v9;
  long long v10;
  uint64_t v11;

  uint64_t v3 = j_std::to_string;
  if (*(unsigned char *)(a1 + 120))
  {
    __n128 v8 = *(__n128 *)a2;
    uint64_t v9 = *((void *)a2 + 2);
    MetricFileMetadataHelper::getSubfieldType((MetricFileMetadataHelper *)(a1 + 16), &v8, a3, (uint64_t)&v10);
    *(_OWORD *)a2 = v10;
    *((void *)a2 + 2) = v11;
    uint64_t Field = MetadataHandle::getField(a2);
    uint64_t v3 = j_std::to_string;
    if (Field)
    {
      uint64_t v3 = j_std::to_string;
      if ((*(_WORD *)(Field + 52) & 0x20) != 0)
      {
        unsigned int v6 = *(_DWORD *)(Field + 36) - 1;
        uint64_t v3 = j_std::to_string;
        if (v6 <= 0x1F) {
          return off_270EB6720[v6];
        }
      }
    }
  }
  return (uint64_t (*)())v3;
}

void sub_2638A8F24(uint64_t a1@<X8>, float a2@<S0>)
{
}

void sub_2638A8F2C(__n128 *a1@<X0>, uint64_t a2@<X8>, float a3@<S0>)
{
}

void sub_2638A8F38(__n128 *a1@<X0>, uint64_t a2@<X8>, float a3@<S0>)
{
}

void sub_2638A8F44(std::string *a1@<X8>, float a2@<S0>)
{
  sub_2638C39EC((unint64_t)a2, &v4);
  uint64_t v3 = std::string::insert(&v4, 0, "0x");
  *a1 = *v3;
  v3->__r_.__value_.__l.__size_ = 0;
  v3->__r_.__value_.__r.__words[2] = 0;
  v3->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v4.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v4.__r_.__value_.__l.__data_);
  }
}

void sub_2638A8FB4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_2638A8FD0(uint64_t a1@<X8>, float a2@<S0>)
{
}

void sub_2638A8FD8(uint64_t a1@<X8>, float a2@<S0>)
{
}

void sub_2638A8FE0(uint64_t a1@<X8>, float a2@<S0>)
{
}

void sub_2638A8FE8(uint64_t a1@<X8>, float a2@<S0>)
{
}

void sub_2638A8FF0(uint64_t a1@<X8>, float a2@<S0>)
{
}

void sub_2638A8FF8(uint64_t a1@<X8>, float a2@<S0>)
{
}

void sub_2638A9000(uint64_t a1@<X8>, float a2@<S0>)
{
}

void sub_2638A9008(uint64_t a1@<X8>, float a2@<S0>)
{
}

void sub_2638A9010(uint64_t a1@<X8>, float a2@<S0>)
{
}

uint64_t (*sub_2638A9018(uint64_t a1, MetadataHandle *a2, unsigned int a3))()
{
  uint64_t v3 = sub_2638A90DC;
  if (*(unsigned char *)(a1 + 120))
  {
    __n128 v8 = *(__n128 *)a2;
    uint64_t v9 = *((void *)a2 + 2);
    MetricFileMetadataHelper::getSubfieldType((MetricFileMetadataHelper *)(a1 + 16), &v8, a3, (uint64_t)&v10);
    *(_OWORD *)a2 = v10;
    *((void *)a2 + 2) = v11;
    uint64_t Field = MetadataHandle::getField(a2);
    uint64_t v3 = sub_2638A90DC;
    if (Field)
    {
      uint64_t v3 = sub_2638A90DC;
      if ((*(_WORD *)(Field + 52) & 0x20) != 0)
      {
        unsigned int v6 = *(_DWORD *)(Field + 36) - 1;
        uint64_t v3 = sub_2638A90DC;
        if (v6 <= 0x1F) {
          return off_270EB6820[v6];
        }
      }
    }
  }
  return (uint64_t (*)())v3;
}

void sub_2638A90E0(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638A90E8(__n128 *a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
}

void sub_2638A90F0(__n128 *a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
}

void sub_2638A90F8(unsigned int a1@<W1>, std::string *a2@<X8>)
{
  sub_2638C39EC(a1, &v4);
  uint64_t v3 = std::string::insert(&v4, 0, "0x");
  *a2 = *v3;
  v3->__r_.__value_.__l.__size_ = 0;
  v3->__r_.__value_.__r.__words[2] = 0;
  v3->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v4.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v4.__r_.__value_.__l.__data_);
  }
}

void sub_2638A9168(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_2638A9184(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638A918C(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638A9194(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638A919C(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638A91A4(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638A91AC(char a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638A91B4(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638A91BC(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638A91C4(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
}

uint64_t (*sub_2638A91CC(uint64_t a1, MetadataHandle *a2, unsigned int a3))()
{
  uint64_t v3 = sub_2638A9290;
  if (*(unsigned char *)(a1 + 120))
  {
    __n128 v8 = *(__n128 *)a2;
    uint64_t v9 = *((void *)a2 + 2);
    MetricFileMetadataHelper::getSubfieldType((MetricFileMetadataHelper *)(a1 + 16), &v8, a3, (uint64_t)&v10);
    *(_OWORD *)a2 = v10;
    *((void *)a2 + 2) = v11;
    uint64_t Field = MetadataHandle::getField(a2);
    uint64_t v3 = sub_2638A9290;
    if (Field)
    {
      uint64_t v3 = sub_2638A9290;
      if ((*(_WORD *)(Field + 52) & 0x20) != 0)
      {
        unsigned int v6 = *(_DWORD *)(Field + 36) - 1;
        uint64_t v3 = sub_2638A9290;
        if (v6 <= 0x1F) {
          return off_270EB6920[v6];
        }
      }
    }
  }
  return (uint64_t (*)())v3;
}

void sub_2638A9294(unint64_t a1@<X1>, uint64_t a2@<X8>)
{
}

void sub_2638A929C(__n128 *a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
}

void sub_2638A92A4(__n128 *a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
}

void sub_2638A92AC(unint64_t a1@<X1>, std::string *a2@<X8>)
{
  sub_2638C39EC(a1, &v4);
  uint64_t v3 = std::string::insert(&v4, 0, "0x");
  *a2 = *v3;
  v3->__r_.__value_.__l.__size_ = 0;
  v3->__r_.__value_.__r.__words[2] = 0;
  v3->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v4.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v4.__r_.__value_.__l.__data_);
  }
}

void sub_2638A931C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_2638A9338(unint64_t a1@<X1>, uint64_t a2@<X8>)
{
}

void sub_2638A9340(unint64_t a1@<X1>, uint64_t a2@<X8>)
{
}

void sub_2638A9348(unint64_t a1@<X1>, uint64_t a2@<X8>)
{
}

void sub_2638A9350(unint64_t a1@<X1>, uint64_t a2@<X8>)
{
}

void sub_2638A9358(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
}

void sub_2638A9360(char a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638A9368(time_t a1@<X1>, uint64_t a2@<X8>)
{
}

void sub_2638A9370(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
}

void sub_2638A9378(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
}

uint64_t (*sub_2638A9380(uint64_t a1, MetadataHandle *a2, unsigned int a3))()
{
  uint64_t v3 = sub_2638A9444;
  if (*(unsigned char *)(a1 + 120))
  {
    __n128 v8 = *(__n128 *)a2;
    uint64_t v9 = *((void *)a2 + 2);
    MetricFileMetadataHelper::getSubfieldType((MetricFileMetadataHelper *)(a1 + 16), &v8, a3, (uint64_t)&v10);
    *(_OWORD *)a2 = v10;
    *((void *)a2 + 2) = v11;
    uint64_t Field = MetadataHandle::getField(a2);
    uint64_t v3 = sub_2638A9444;
    if (Field)
    {
      uint64_t v3 = sub_2638A9444;
      if ((*(_WORD *)(Field + 52) & 0x20) != 0)
      {
        unsigned int v6 = *(_DWORD *)(Field + 36) - 1;
        uint64_t v3 = sub_2638A9444;
        if (v6 <= 0x1F) {
          return off_270EB6A20[v6];
        }
      }
    }
  }
  return (uint64_t (*)())v3;
}

void sub_2638A9448(int a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638A9450(__n128 *a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
}

void sub_2638A9458(__n128 *a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
}

void sub_2638A9460(int a1@<W1>, std::string *a2@<X8>)
{
  sub_2638C39EC(a1, &v4);
  uint64_t v3 = std::string::insert(&v4, 0, "0x");
  *a2 = *v3;
  v3->__r_.__value_.__l.__size_ = 0;
  v3->__r_.__value_.__r.__words[2] = 0;
  v3->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v4.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v4.__r_.__value_.__l.__data_);
  }
}

void sub_2638A94D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_2638A94EC(int a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638A94F4(int a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638A94FC(int a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638A9504(int a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638A950C(int a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638A9514(char a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638A951C(int a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638A9524(int a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638A952C(int a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638A9534(uint64_t a1, uint64_t **a2, long long *a3, unsigned int a4, int a5)
{
  long long v26 = *a3;
  uint64_t v27 = *((void *)a3 + 2);
  long long v10 = sub_2638A87C4(a1, (MetadataHandle *)&v26, a4);
  uint64_t v11 = *a2;
  uint64_t v12 = a2[1];
  if (*a2 != v12)
  {
    long long v13 = v10;
    long long v14 = 0;
    do
    {
      uint64_t v15 = *v11;
      __p[0] = 0;
      __p[1] = 0;
      uint64_t v25 = 0;
      if (a5 == 11)
      {
        long long v20 = *a3;
        uint64_t v21 = *((void *)a3 + 2);
        sub_2638A8848(a1, (MetadataHandle *)&v20, a4, v15, &v22);
        if (SHIBYTE(v25) < 0) {
          operator delete(__p[0]);
        }
        *(_OWORD *)std::string __p = v22;
        uint64_t v25 = v23;
      }
      else if (a5 == 12)
      {
        uint64_t v16 = sub_2638B9488(a1, v15 != 0);
        MEMORY[0x263E6D240](__p, v16);
      }
      long long v17 = (void *)HIBYTE(v25);
      if (v25 < 0) {
        long long v17 = __p[1];
      }
      if (!v17)
      {
        if (!v14)
        {
          long long v18 = *a3;
          uint64_t v19 = *((void *)a3 + 2);
          long long v14 = sub_2638A8938(a1, (MetadataHandle *)&v18, a4);
        }
        ((void (*)(long long *__return_ptr, uint64_t, uint64_t))v14)(&v22, a1, v15);
        if (SHIBYTE(v25) < 0) {
          operator delete(__p[0]);
        }
        *(_OWORD *)std::string __p = v22;
        uint64_t v25 = v23;
      }
      sub_2638B93F0(a1, v13, (uint64_t)__p);
      if (SHIBYTE(v25) < 0) {
        operator delete(__p[0]);
      }
      ++v11;
    }
    while (v11 != v12);
  }
}

void sub_2638A96DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *sub_2638A9700@<X0>(uint64_t *result@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  uint64_t v2 = (uint64_t *)*result;
  uint64_t v3 = (uint64_t *)result[1];
  for (uint64_t i = a2; v2 != v3; ++v2)
  {
    uint64_t v4 = *v2;
    uint64_t result = sub_2638AA010((uint64_t *)&i, &v4);
  }
  return result;
}

void sub_2638A9768(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *sub_2638A9784@<X0>(uint64_t *result@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  uint64_t v2 = (uint64_t *)*result;
  uint64_t v3 = (uint64_t *)result[1];
  for (uint64_t i = a2; v2 != v3; ++v2)
  {
    double v4 = wis::protobuf::NumberConverter<(wis::reflect::Type)1>::decode(*v2);
    uint64_t result = sub_2638AA100((uint64_t *)&i, &v4);
  }
  return result;
}

void sub_2638A97F0(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_2638A980C(uint64_t a1, unsigned int **a2, long long *a3, unsigned int a4, int a5)
{
  long long v26 = *a3;
  uint64_t v27 = *((void *)a3 + 2);
  long long v10 = sub_2638A87C4(a1, (MetadataHandle *)&v26, a4);
  uint64_t v11 = *a2;
  uint64_t v12 = a2[1];
  if (*a2 != v12)
  {
    long long v13 = v10;
    long long v14 = 0;
    do
    {
      uint64_t v15 = *v11;
      __p[0] = 0;
      __p[1] = 0;
      uint64_t v25 = 0;
      if (a5 == 11)
      {
        long long v20 = *a3;
        uint64_t v21 = *((void *)a3 + 2);
        sub_2638A8848(a1, (MetadataHandle *)&v20, a4, v15, &v22);
        if (SHIBYTE(v25) < 0) {
          operator delete(__p[0]);
        }
        *(_OWORD *)std::string __p = v22;
        uint64_t v25 = v23;
      }
      else if (a5 == 12)
      {
        uint64_t v16 = sub_2638B9488(a1, v15 != 0);
        MEMORY[0x263E6D240](__p, v16);
      }
      long long v17 = (void *)HIBYTE(v25);
      if (v25 < 0) {
        long long v17 = __p[1];
      }
      if (!v17)
      {
        if (!v14)
        {
          long long v18 = *a3;
          uint64_t v19 = *((void *)a3 + 2);
          long long v14 = sub_2638A8CA8(a1, (MetadataHandle *)&v18, a4);
        }
        ((void (*)(long long *__return_ptr, uint64_t, uint64_t))v14)(&v22, a1, v15);
        if (SHIBYTE(v25) < 0) {
          operator delete(__p[0]);
        }
        *(_OWORD *)std::string __p = v22;
        uint64_t v25 = v23;
      }
      sub_2638B93F0(a1, v13, (uint64_t)__p);
      if (SHIBYTE(v25) < 0) {
        operator delete(__p[0]);
      }
      ++v11;
    }
    while (v11 != v12);
  }
}

void sub_2638A99B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *sub_2638A99D8@<X0>(uint64_t *result@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  uint64_t v2 = (void *)*result;
  uint64_t v3 = (void *)result[1];
  for (uint64_t i = a2; v2 != v3; ++v2)
  {
    int v4 = *v2;
    uint64_t result = sub_2638AA1F0((uint64_t *)&i, &v4);
  }
  return result;
}

void sub_2638A9A40(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *sub_2638A9A5C@<X0>(uint64_t *result@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  uint64_t v2 = (void *)*result;
  uint64_t v3 = (void *)result[1];
  for (uint64_t i = a2; v2 != v3; ++v2)
  {
    float v4 = wis::protobuf::NumberConverter<(wis::reflect::Type)2>::decode(*v2);
    uint64_t result = sub_2638AA318((uint64_t *)&i, &v4);
  }
  return result;
}

void sub_2638A9AC8(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_2638A9AE4(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void **)(a1 + 8);
  if (*(void **)a1 != v3)
  {
    do
    {
      BOOL v5 = *v2 != 0;
      sub_2638AA408((uint64_t)a2, &v5);
      ++v2;
    }
    while (v2 != v3);
  }
}

void sub_2638A9B50(_Unwind_Exception *exception_object)
{
  if (*v1) {
    operator delete(*v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_2638A9B68(uint64_t a1, uint64_t **a2, long long *a3, unsigned int a4, int a5)
{
  long long v26 = *a3;
  uint64_t v27 = *((void *)a3 + 2);
  long long v10 = sub_2638A87C4(a1, (MetadataHandle *)&v26, a4);
  uint64_t v11 = *a2;
  uint64_t v12 = a2[1];
  if (*a2 != v12)
  {
    long long v13 = v10;
    long long v14 = 0;
    do
    {
      uint64_t v15 = *v11;
      __p[0] = 0;
      __p[1] = 0;
      uint64_t v25 = 0;
      if (a5 == 11)
      {
        long long v20 = *a3;
        uint64_t v21 = *((void *)a3 + 2);
        sub_2638A8848(a1, (MetadataHandle *)&v20, a4, v15, &v22);
        if (SHIBYTE(v25) < 0) {
          operator delete(__p[0]);
        }
        *(_OWORD *)std::string __p = v22;
        uint64_t v25 = v23;
      }
      else if (a5 == 12)
      {
        uint64_t v16 = sub_2638B9488(a1, v15 != 0);
        MEMORY[0x263E6D240](__p, v16);
      }
      long long v17 = (void *)HIBYTE(v25);
      if (v25 < 0) {
        long long v17 = __p[1];
      }
      if (!v17)
      {
        if (!v14)
        {
          long long v18 = *a3;
          uint64_t v19 = *((void *)a3 + 2);
          long long v14 = sub_2638A91CC(a1, (MetadataHandle *)&v18, a4);
        }
        ((void (*)(long long *__return_ptr, uint64_t, uint64_t))v14)(&v22, a1, v15);
        if (SHIBYTE(v25) < 0) {
          operator delete(__p[0]);
        }
        *(_OWORD *)std::string __p = v22;
        uint64_t v25 = v23;
      }
      sub_2638B93F0(a1, v13, (uint64_t)__p);
      if (SHIBYTE(v25) < 0) {
        operator delete(__p[0]);
      }
      ++v11;
    }
    while (v11 != v12);
  }
}

void sub_2638A9D10(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *sub_2638A9D34@<X0>(uint64_t *result@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  uint64_t v2 = (unint64_t *)*result;
  uint64_t v3 = (unint64_t *)result[1];
  for (uint64_t i = a2; v2 != v3; ++v2)
  {
    unint64_t v4 = wis::protobuf::NumberConverter<(wis::reflect::Type)5>::decode(*v2);
    uint64_t result = sub_2638AA010((uint64_t *)&i, &v4);
  }
  return result;
}

void sub_2638A9DA0(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_2638A9DBC(uint64_t a1, int **a2, long long *a3, unsigned int a4, int a5)
{
  long long v26 = *a3;
  uint64_t v27 = *((void *)a3 + 2);
  long long v10 = sub_2638A87C4(a1, (MetadataHandle *)&v26, a4);
  uint64_t v11 = *a2;
  uint64_t v12 = a2[1];
  if (*a2 != v12)
  {
    long long v13 = v10;
    long long v14 = 0;
    do
    {
      uint64_t v15 = *v11;
      __p[0] = 0;
      __p[1] = 0;
      uint64_t v25 = 0;
      if (a5 == 11)
      {
        long long v20 = *a3;
        uint64_t v21 = *((void *)a3 + 2);
        sub_2638A8848(a1, (MetadataHandle *)&v20, a4, v15, &v22);
        if (SHIBYTE(v25) < 0) {
          operator delete(__p[0]);
        }
        *(_OWORD *)std::string __p = v22;
        uint64_t v25 = v23;
      }
      else if (a5 == 12)
      {
        uint64_t v16 = sub_2638B9488(a1, v15 != 0);
        MEMORY[0x263E6D240](__p, v16);
      }
      long long v17 = (void *)HIBYTE(v25);
      if (v25 < 0) {
        long long v17 = __p[1];
      }
      if (!v17)
      {
        if (!v14)
        {
          long long v18 = *a3;
          uint64_t v19 = *((void *)a3 + 2);
          long long v14 = sub_2638A9380(a1, (MetadataHandle *)&v18, a4);
        }
        ((void (*)(long long *__return_ptr, uint64_t, uint64_t))v14)(&v22, a1, v15);
        if (SHIBYTE(v25) < 0) {
          operator delete(__p[0]);
        }
        *(_OWORD *)std::string __p = v22;
        uint64_t v25 = v23;
      }
      sub_2638B93F0(a1, v13, (uint64_t)__p);
      if (SHIBYTE(v25) < 0) {
        operator delete(__p[0]);
      }
      ++v11;
    }
    while (v11 != v12);
  }
}

void sub_2638A9F64(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *sub_2638A9F88@<X0>(uint64_t *result@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  uint64_t v2 = (void *)*result;
  uint64_t v3 = (void *)result[1];
  for (uint64_t i = a2; v2 != v3; ++v2)
  {
    int v4 = wis::protobuf::NumberConverter<(wis::reflect::Type)8>::decode(*v2);
    uint64_t result = sub_2638AA1F0((uint64_t *)&i, &v4);
  }
  return result;
}

void sub_2638A9FF4(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *sub_2638AA010(uint64_t *a1, void *a2)
{
  uint64_t v4 = *a1;
  BOOL v5 = *(void **)(*a1 + 8);
  unsigned int v6 = (void *)(*a1 + 16);
  if ((unint64_t)v5 >= *v6)
  {
    __n128 v8 = *(void **)v4;
    uint64_t v9 = ((uint64_t)v5 - *(void *)v4) >> 3;
    unint64_t v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 61) {
      sub_2638A2514();
    }
    uint64_t v11 = *v6 - (void)v8;
    if (v11 >> 2 > v10) {
      unint64_t v10 = v11 >> 2;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v12)
    {
      long long v13 = (char *)sub_26389E00C((uint64_t)v6, v12);
      __n128 v8 = *(void **)v4;
      BOOL v5 = *(void **)(v4 + 8);
    }
    else
    {
      long long v13 = 0;
    }
    long long v14 = &v13[8 * v9];
    uint64_t v15 = &v13[8 * v12];
    *(void *)long long v14 = *a2;
    uint64_t v7 = v14 + 8;
    while (v5 != v8)
    {
      uint64_t v16 = *--v5;
      *((void *)v14 - 1) = v16;
      v14 -= 8;
    }
    *(void *)uint64_t v4 = v14;
    *(void *)(v4 + 8) = v7;
    *(void *)(v4 + 16) = v15;
    if (v8) {
      operator delete(v8);
    }
  }
  else
  {
    *BOOL v5 = *a2;
    uint64_t v7 = v5 + 1;
  }
  *(void *)(v4 + 8) = v7;
  return a1;
}

uint64_t *sub_2638AA100(uint64_t *a1, void *a2)
{
  uint64_t v4 = *a1;
  BOOL v5 = *(void **)(*a1 + 8);
  unsigned int v6 = (void *)(*a1 + 16);
  if ((unint64_t)v5 >= *v6)
  {
    __n128 v8 = *(void **)v4;
    uint64_t v9 = ((uint64_t)v5 - *(void *)v4) >> 3;
    unint64_t v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 61) {
      sub_2638A2514();
    }
    uint64_t v11 = *v6 - (void)v8;
    if (v11 >> 2 > v10) {
      unint64_t v10 = v11 >> 2;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v12)
    {
      long long v13 = (char *)sub_26389E00C((uint64_t)v6, v12);
      __n128 v8 = *(void **)v4;
      BOOL v5 = *(void **)(v4 + 8);
    }
    else
    {
      long long v13 = 0;
    }
    long long v14 = &v13[8 * v9];
    uint64_t v15 = &v13[8 * v12];
    *(void *)long long v14 = *a2;
    uint64_t v7 = v14 + 8;
    while (v5 != v8)
    {
      uint64_t v16 = *--v5;
      *((void *)v14 - 1) = v16;
      v14 -= 8;
    }
    *(void *)uint64_t v4 = v14;
    *(void *)(v4 + 8) = v7;
    *(void *)(v4 + 16) = v15;
    if (v8) {
      operator delete(v8);
    }
  }
  else
  {
    *BOOL v5 = *a2;
    uint64_t v7 = v5 + 1;
  }
  *(void *)(v4 + 8) = v7;
  return a1;
}

uint64_t *sub_2638AA1F0(uint64_t *a1, _DWORD *a2)
{
  uint64_t v4 = *a1;
  BOOL v5 = *(_DWORD **)(*a1 + 8);
  unsigned int v6 = (void *)(*a1 + 16);
  if ((unint64_t)v5 >= *v6)
  {
    __n128 v8 = *(_DWORD **)v4;
    uint64_t v9 = ((uint64_t)v5 - *(void *)v4) >> 2;
    unint64_t v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 62) {
      sub_2638A2514();
    }
    uint64_t v11 = *v6 - (void)v8;
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
      long long v13 = (char *)sub_2638AA2E0((uint64_t)v6, v12);
      __n128 v8 = *(_DWORD **)v4;
      BOOL v5 = *(_DWORD **)(v4 + 8);
    }
    else
    {
      long long v13 = 0;
    }
    long long v14 = &v13[4 * v9];
    uint64_t v15 = &v13[4 * v12];
    *(_DWORD *)long long v14 = *a2;
    uint64_t v7 = v14 + 4;
    while (v5 != v8)
    {
      int v16 = *--v5;
      *((_DWORD *)v14 - 1) = v16;
      v14 -= 4;
    }
    *(void *)uint64_t v4 = v14;
    *(void *)(v4 + 8) = v7;
    *(void *)(v4 + 16) = v15;
    if (v8) {
      operator delete(v8);
    }
  }
  else
  {
    *BOOL v5 = *a2;
    uint64_t v7 = v5 + 1;
  }
  *(void *)(v4 + 8) = v7;
  return a1;
}

void *sub_2638AA2E0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    sub_2638A24E0();
  }
  return operator new(4 * a2);
}

uint64_t *sub_2638AA318(uint64_t *a1, _DWORD *a2)
{
  uint64_t v4 = *a1;
  BOOL v5 = *(_DWORD **)(*a1 + 8);
  unsigned int v6 = (void *)(*a1 + 16);
  if ((unint64_t)v5 >= *v6)
  {
    __n128 v8 = *(_DWORD **)v4;
    uint64_t v9 = ((uint64_t)v5 - *(void *)v4) >> 2;
    unint64_t v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 62) {
      sub_2638A2514();
    }
    uint64_t v11 = *v6 - (void)v8;
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
      long long v13 = (char *)sub_2638AA2E0((uint64_t)v6, v12);
      __n128 v8 = *(_DWORD **)v4;
      BOOL v5 = *(_DWORD **)(v4 + 8);
    }
    else
    {
      long long v13 = 0;
    }
    long long v14 = &v13[4 * v9];
    uint64_t v15 = &v13[4 * v12];
    *(_DWORD *)long long v14 = *a2;
    uint64_t v7 = v14 + 4;
    while (v5 != v8)
    {
      int v16 = *--v5;
      *((_DWORD *)v14 - 1) = v16;
      v14 -= 4;
    }
    *(void *)uint64_t v4 = v14;
    *(void *)(v4 + 8) = v7;
    *(void *)(v4 + 16) = v15;
    if (v8) {
      operator delete(v8);
    }
  }
  else
  {
    *BOOL v5 = *a2;
    uint64_t v7 = v5 + 1;
  }
  *(void *)(v4 + 8) = v7;
  return a1;
}

void sub_2638AA408(uint64_t a1, unsigned char *a2)
{
  unint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  if (v4 == v5 << 6)
  {
    if ((uint64_t)(v4 + 1) < 0) {
      sub_2638A2514();
    }
    unint64_t v6 = v5 << 7;
    if (v6 <= (v4 & 0xFFFFFFFFFFFFFFC0) + 64) {
      unint64_t v6 = (v4 & 0xFFFFFFFFFFFFFFC0) + 64;
    }
    if (v4 <= 0x3FFFFFFFFFFFFFFELL) {
      unint64_t v7 = v6;
    }
    else {
      unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    }
    sub_2638AA4B0((char **)a1, v7);
    unint64_t v4 = *(void *)(a1 + 8);
  }
  *(void *)(a1 + 8) = v4 + 1;
  __n128 v8 = *(char **)a1;
  unint64_t v9 = v4 >> 6;
  uint64_t v10 = 1 << v4;
  if (*a2) {
    uint64_t v11 = *(void *)&v8[8 * v9] | v10;
  }
  else {
    uint64_t v11 = *(void *)&v8[8 * v9] & ~v10;
  }
  *(void *)&v8[8 * v9] = v11;
}

void sub_2638AA4B0(char **a1, unint64_t a2)
{
  if (a2 > (void)a1[2] << 6)
  {
    if ((a2 & 0x8000000000000000) != 0) {
      sub_2638A2514();
    }
    uint64_t v10 = 0;
    long long v11 = 0uLL;
    sub_2638AA570(&v10, a2);
    unint64_t v3 = (unint64_t)a1[1];
    __n128 v8 = *a1;
    int v9 = 0;
    unint64_t v6 = &v8[8 * (v3 >> 6)];
    int v7 = v3 & 0x3F;
    sub_2638AA5B8(&v10, (uint64_t)&v8, (uint64_t)&v6, v3);
    unint64_t v4 = *a1;
    *a1 = v10;
    uint64_t v10 = v4;
    long long v5 = *(_OWORD *)(a1 + 1);
    *(_OWORD *)(a1 + 1) = v11;
    long long v11 = v5;
    if (v4) {
      operator delete(v4);
    }
  }
}

void sub_2638AA558(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_2638AA570(void *a1, uint64_t a2)
{
  if (a2 < 0) {
    sub_2638A2514();
  }
  uint64_t result = sub_26389E00C((uint64_t)(a1 + 2), ((unint64_t)(a2 - 1) >> 6) + 1);
  *a1 = result;
  a1[1] = 0;
  a1[2] = v4;
  return result;
}

void sub_2638AA5B8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = a1[1];
  unint64_t v5 = v4 + a4;
  a1[1] = v4 + a4;
  if (!v4 || ((v5 - 1) ^ (v4 - 1)) >= 0x40)
  {
    if (v5 >= 0x41) {
      unint64_t v6 = (v5 - 1) >> 6;
    }
    else {
      unint64_t v6 = 0;
    }
    *(void *)(*a1 + 8 * v6) = 0;
  }
  int v7 = *(_DWORD *)(a2 + 8);
  uint64_t v8 = *(void *)a3;
  int v9 = *(_DWORD *)(a3 + 8);
  uint64_t v10 = *a1 + 8 * (v4 >> 6);
  uint64_t v16 = *(void *)a2;
  int v17 = v7;
  uint64_t v14 = v8;
  int v15 = v9;
  uint64_t v12 = v10;
  int v13 = v4 & 0x3F;
  sub_2638AA65C(&v16, &v14, &v12, (uint64_t)&v11);
}

void sub_2638AA65C(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  int v5 = *((_DWORD *)a1 + 2);
  uint64_t v6 = *a2;
  int v7 = *((_DWORD *)a2 + 2);
  uint64_t v16 = *a1;
  int v17 = v5;
  uint64_t v14 = v6;
  int v15 = v7;
  int v8 = *((_DWORD *)a3 + 2);
  uint64_t v12 = *a3;
  int v13 = v8;
  sub_2638AA6EC((uint64_t)&v16, (uint64_t)&v14, (uint64_t)&v12, (uint64_t)&v18);
  int v9 = v19;
  uint64_t v10 = v20;
  int v11 = v21;
  *(void *)a4 = v18;
  *(_DWORD *)(a4 + 8) = v9;
  *(void *)(a4 + 16) = v10;
  *(_DWORD *)(a4 + 24) = v11;
}

void sub_2638AA6EC(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  unint64_t v4 = *(void **)a1;
  int v5 = *(_DWORD *)(a1 + 8);
  for (i = *(_DWORD *)(a3 + 8); *(void *)a1 != *(void *)a2 || v5 != *(_DWORD *)(a2 + 8); int v5 = *(_DWORD *)(a1 + 8))
  {
    int v8 = *(uint64_t **)a3;
    uint64_t v9 = 1 << i;
    if ((*v4 >> v5)) {
      uint64_t v10 = *v8 | v9;
    }
    else {
      uint64_t v10 = *v8 & ~v9;
    }
    uint64_t *v8 = v10;
    if (v5 == 63)
    {
      int v11 = 0;
      *(void *)a1 = v4 + 1;
    }
    else
    {
      int v11 = v5 + 1;
    }
    *(_DWORD *)(a1 + 8) = v11;
    int v12 = *(_DWORD *)(a3 + 8);
    if (v12 == 63)
    {
      int i = 0;
      *(void *)a3 += 8;
    }
    else
    {
      int i = v12 + 1;
    }
    *(_DWORD *)(a3 + 8) = i;
    unint64_t v4 = *(void **)a1;
  }
  *(void *)a4 = v4;
  *(_DWORD *)(a4 + 8) = v5;
  *(void *)(a4 + 16) = *(void *)a3;
  *(_DWORD *)(a4 + 24) = i;
}

void *sub_2638AA7BC(void *a1, size_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_2638AA830(a1, a2);
    unint64_t v4 = (char *)a1[1];
    int v5 = &v4[a2];
    bzero(v4, a2);
    a1[1] = v5;
  }
  return a1;
}

void sub_2638AA814(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_2638AA830(void *a1, size_t __sz)
{
  if ((__sz & 0x8000000000000000) != 0) {
    sub_2638A2514();
  }
  uint64_t result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

void sub_2638AA874(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, __n128 *a2, uint64_t *a3)
{
  uint64_t v6 = (unsigned __int8 *)*((void *)this + 1);
  if ((unint64_t)v6 >= *((void *)this + 2) || (char)*v6 < 0)
  {
    unint64_t TagFallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(this);
    *((_DWORD *)this + 8) = TagFallback;
    if (TagFallback) {
      goto LABEL_4;
    }
LABEL_10:
    if (*((unsigned char *)this + 36)) {
      return;
    }
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x263E6D1C0](exception, "Parsing failed in metric");
    goto LABEL_199;
  }
  unint64_t TagFallback = *v6;
  *((_DWORD *)this + 8) = TagFallback;
  *((void *)this + 1) = v6 + 1;
  if (!TagFallback) {
    goto LABEL_10;
  }
LABEL_4:
  unint64_t v8 = wis::reflect::decodeTag((wis::reflect *)TagFallback);
  unint64_t v9 = HIDWORD(v8);
  unsigned __int8 v10 = v8;
  __n128 v104 = *a2;
  unint64_t v105 = a2[1].n128_u64[0];
  MetricFileMetadataHelper::getSubfieldType((MetricFileMetadataHelper *)(a3 + 1), &v104, HIDWORD(v8), (uint64_t)&v106);
  long long v102 = v106;
  uint64_t v103 = v107;
  uint64_t BuiltinType = MetadataHelper::getBuiltinType((uint64_t)(a3 + 1), (MetadataHandle *)&v102);
  int v12 = BuiltinType;
  uint64_t DecodingType = wis::reflect::getDecodingType(BuiltinType, v10);
  switch((int)DecodingType)
  {
    case 0:
      switch(v10)
      {
        case 0u:
          *(void *)unint64_t v119 = 0;
          if (sub_2638A7CF4(this, (unint64_t *)v119)) {
            goto LABEL_178;
          }
          goto LABEL_151;
        case 1u:
          *(void *)unint64_t v119 = 0;
          if (wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(this, (unint64_t *)v119))goto LABEL_151; {
LABEL_178:
          }
          uint64_t v72 = *(char ***)v119;
          goto LABEL_181;
        case 2u:
          v115[0] = 0;
          if ((sub_2638A7D24(this, v115) & 1) == 0) {
            goto LABEL_151;
          }
          sub_2638AA7BC(v119, v115[0]);
          char Raw = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadRaw(this, *(void **)v119);
          if (Raw) {
            sub_2638AD654(a3, *(unsigned char **)v119, *(void *)&v119[2] - *(void *)v119, v9);
          }
          goto LABEL_169;
        case 5u:
          v119[0] = 0;
          if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(this, v119))goto LABEL_151; {
          uint64_t v72 = (char **)v119[0];
          }
LABEL_181:
          sub_2638AD598(a3, v72, v9);
          break;
        default:
          goto LABEL_151;
      }
      return;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
      unint64_t v117 = 0;
      switch(v10)
      {
        case 0u:
          uint64_t v14 = (char *)*((void *)this + 1);
          if ((unint64_t)v14 < *((void *)this + 2) && (*v14 & 0x80000000) == 0)
          {
            unint64_t v117 = *v14;
            *((void *)this + 1) = v14 + 1;
LABEL_84:
            unint64_t v42 = v117;
            switch(v12)
            {
              case 1:
              case 15:
                double v47 = wis::protobuf::NumberConverter<(wis::reflect::Type)1>::decode(v117);
                __n128 v110 = *a2;
                unint64_t v111 = a2[1].n128_u64[0];
                *(__n128 *)unint64_t v119 = *a2;
                unint64_t v120 = a2[1].n128_u64[0];
                unsigned int v44 = v9;
                unint64_t v45 = sub_2638A1CF8((uint64_t)a3, (MetadataHandle *)v119, v9);
                float v46 = (char ***)&v108.n128_u64[1];
                v108.n128_u8[0] = 7;
                v108.n128_f64[1] = v47;
                if (v12 == 11)
                {
                  *(__n128 *)unint64_t v113 = v110;
                  unint64_t v114 = v111;
                  sub_2638A2174((uint64_t)a3, (MetadataHandle *)v113, v44, (unint64_t)v47, v115);
                  uint64_t v78 = HIBYTE(v116);
                  char v79 = HIBYTE(v116);
                  if (v116 < 0) {
                    uint64_t v78 = *(void *)&v115[2];
                  }
                  if (v78)
                  {
                    uint64_t v80 = operator new(0x18uLL);
                    *(_OWORD *)uint64_t v80 = *(_OWORD *)v115;
                    v80[2] = v116;
                    int64_t v116 = 0;
                    memset(v115, 0, sizeof(v115));
                    int v81 = v108.n128_u8[0];
                    v108.n128_u8[0] = 3;
                    LOBYTE(__p) = v81;
                    uint64_t v82 = (char **)v108.n128_u64[1];
                    v108.n128_u64[1] = (unint64_t)v80;
                    char v97 = v82;
                    sub_2638A5C4C(&v97, v81);
                    char v79 = HIBYTE(v116);
                  }
                  if (v79 < 0) {
                    operator delete(*(void **)v115);
                  }
                }
                else if (v12 == 12)
                {
                  v108.n128_u8[0] = 4;
                  LOBYTE(v113[0]) = 7;
                  v108.n128_u64[1] = v47 != 0.0;
                  *(double *)&v113[2] = v47;
                  sub_2638A5C4C((char ***)&v113[2], 7);
                }
                goto LABEL_195;
              case 2:
              case 16:
                float v43 = wis::protobuf::NumberConverter<(wis::reflect::Type)2>::decode(v117);
                __n128 v110 = *a2;
                unint64_t v111 = a2[1].n128_u64[0];
                *(__n128 *)unint64_t v119 = *a2;
                unint64_t v120 = a2[1].n128_u64[0];
                unsigned int v44 = v9;
                unint64_t v45 = sub_2638A1CF8((uint64_t)a3, (MetadataHandle *)v119, v9);
                float v46 = (char ***)&v108.n128_u64[1];
                v108.n128_u8[0] = 7;
                v108.n128_f64[1] = v43;
                if (v12 == 11)
                {
                  *(__n128 *)unint64_t v113 = v110;
                  unint64_t v114 = v111;
                  sub_2638A2174((uint64_t)a3, (MetadataHandle *)v113, v44, (unint64_t)v43, v115);
                  uint64_t v73 = HIBYTE(v116);
                  char v74 = HIBYTE(v116);
                  if (v116 < 0) {
                    uint64_t v73 = *(void *)&v115[2];
                  }
                  if (v73)
                  {
                    xpc_object_t v75 = operator new(0x18uLL);
                    *(_OWORD *)xpc_object_t v75 = *(_OWORD *)v115;
                    v75[2] = v116;
                    int64_t v116 = 0;
                    memset(v115, 0, sizeof(v115));
                    int v76 = v108.n128_u8[0];
                    v108.n128_u8[0] = 3;
                    LOBYTE(__p) = v76;
                    BOOL v77 = (char **)v108.n128_u64[1];
                    v108.n128_u64[1] = (unint64_t)v75;
                    char v97 = v77;
                    sub_2638A5C4C(&v97, v76);
                    char v74 = HIBYTE(v116);
                  }
                  if (v74 < 0) {
                    operator delete(*(void **)v115);
                  }
                }
                else if (v12 == 12)
                {
                  v108.n128_u8[0] = 4;
                  LOBYTE(v113[0]) = 7;
                  v108.n128_u64[1] = v43 != 0.0;
                  *(double *)&v113[2] = v43;
                  sub_2638A5C4C((char ***)&v113[2], 7);
                }
LABEL_195:
                *(__n128 *)unint64_t v115 = v110;
                int64_t v116 = v111;
                int v83 = sub_2638A1D7C((uint64_t)a3, (MetadataHandle *)v115, v44);
                sub_2638BEEB0(a3, v45, (uint64_t)&v108, v83);
                int v52 = v108.n128_u8[0];
                goto LABEL_196;
              case 3:
              case 11:
              case 17:
              case 25:
                goto LABEL_95;
              case 4:
              case 10:
              case 18:
              case 24:
                *(void *)unint64_t v115 = v117;
                *(__n128 *)unint64_t v119 = *a2;
                unint64_t v120 = a2[1].n128_u64[0];
                sub_2638AD780(a3, (char ***)v115, (long long *)v119, v9, v12);
                return;
              case 5:
              case 19:
                unint64_t v42 = wis::protobuf::NumberConverter<(wis::reflect::Type)5>::decode(v117);
LABEL_95:
                *(void *)unint64_t v115 = v42;
                *(__n128 *)unint64_t v119 = *a2;
                unint64_t v120 = a2[1].n128_u64[0];
                sub_2638ADB38(a3, (char ***)v115, (long long *)v119, v9, v12);
                return;
              case 6:
              case 20:
                v115[0] = v117;
                goto LABEL_97;
              case 7:
              case 9:
              case 21:
              case 23:
                v115[0] = v117;
                *(__n128 *)unint64_t v119 = *a2;
                unint64_t v120 = a2[1].n128_u64[0];
                sub_2638AD95C(a3, v115, (long long *)v119, v9, v12);
                return;
              case 8:
              case 22:
                v115[0] = wis::protobuf::NumberConverter<(wis::reflect::Type)8>::decode(v117);
LABEL_97:
                *(__n128 *)unint64_t v119 = *a2;
                unint64_t v120 = a2[1].n128_u64[0];
                sub_2638ADD14(a3, (int *)v115, (long long *)v119, v9, v12);
                return;
              case 12:
              case 26:
                BOOL v48 = v117 != 0;
                *(__n128 *)unint64_t v113 = *a2;
                unint64_t v114 = a2[1].n128_u64[0];
                *(__n128 *)unint64_t v119 = *a2;
                unint64_t v120 = a2[1].n128_u64[0];
                unsigned int v49 = v9;
                unint64_t v50 = sub_2638A1CF8((uint64_t)a3, (MetadataHandle *)v119, v9);
                float v46 = (char ***)&v110.n128_u64[1];
                v110.n128_u8[0] = 4;
                v110.n128_u64[1] = v48;
                if (v12 == 12)
                {
                  v108.n128_u8[0] = 4;
                  v108.n128_u64[1] = v48;
                  sub_2638A5C4C((char ***)&v108.n128_u64[1], 4);
                }
                *(_OWORD *)unint64_t v115 = *(_OWORD *)v113;
                int64_t v116 = v114;
                int v51 = sub_2638A1D7C((uint64_t)a3, (MetadataHandle *)v115, v49);
                sub_2638BEEB0(a3, v50, (uint64_t)&v110, v51);
                int v52 = v110.n128_u8[0];
LABEL_196:
                sub_2638A5C4C(v46, v52);
                return;
              default:
                exception = __cxa_allocate_exception(0x10uLL);
                MEMORY[0x263E6D1C0](exception, "This should never happen, no matter what the input!");
                goto LABEL_199;
            }
          }
          if (wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(this, &v117)) {
            goto LABEL_84;
          }
          if (v9 || !*((unsigned char *)this + 36)) {
            goto LABEL_103;
          }
          return;
        case 1u:
          if (wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(this, &v117)) {
            goto LABEL_84;
          }
          if (v9 || !*((unsigned char *)this + 36)) {
            goto LABEL_103;
          }
          return;
        case 2u:
          if (v9 || !*((unsigned char *)this + 36)) {
            goto LABEL_103;
          }
          return;
        case 5u:
          v119[0] = 0;
          if (wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(this, v119))
          {
            unint64_t v117 = v119[0];
            goto LABEL_84;
          }
          if (!v9 && *((unsigned char *)this + 36)) {
            return;
          }
LABEL_103:
          exception = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x263E6D1C0](exception, "Parsing failed in metric");
          break;
        default:
          goto LABEL_84;
      }
      goto LABEL_199;
    case 13:
      v115[0] = 0;
      double v38 = (char *)*((void *)this + 1);
      if ((unint64_t)v38 >= *((void *)this + 2) || *v38 < 0)
      {
        if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, v115))goto LABEL_151; {
      }
        }
      else
      {
        v115[0] = *v38;
        *((void *)this + 1) = v38 + 1;
      }
      memset(v119, 0, sizeof(v119));
      unint64_t v120 = 0;
      char Raw = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadString();
      if (Raw)
      {
        __n128 v94 = *a2;
        unint64_t v95 = a2[1].n128_u64[0];
        sub_2638AD210(a3, (uint64_t)v119, (long long *)&v94, v9);
      }
      if ((SHIBYTE(v120) & 0x80000000) == 0) {
        goto LABEL_172;
      }
      int v68 = *(void **)v119;
      goto LABEL_171;
    case 14:
      v115[0] = 0;
      uint64_t v40 = (char *)*((void *)this + 1);
      if ((unint64_t)v40 >= *((void *)this + 2) || *v40 < 0)
      {
        if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, v115))goto LABEL_151; {
        unsigned int v41 = v115[0];
        }
      }
      else
      {
        unsigned int v41 = *v40;
        v115[0] = v41;
        *((void *)this + 1) = v40 + 1;
      }
      sub_2638AA7BC(v119, v41);
      char Raw = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadRaw(this, *(void **)v119);
      if (Raw)
      {
        __n128 v92 = *a2;
        unint64_t v93 = a2[1].n128_u64[0];
        sub_2638AD300(a3, (uint64_t)v119, (long long *)&v92, v9);
      }
LABEL_169:
      int v68 = *(void **)v119;
      if (*(void *)v119)
      {
        *(void *)&v119[2] = *(void *)v119;
LABEL_171:
        operator delete(v68);
      }
LABEL_172:
      if (Raw) {
        return;
      }
      goto LABEL_151;
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
      unsigned int v101 = 0;
      uint64_t v16 = (unsigned __int8 *)*((void *)this + 1);
      if ((unint64_t)v16 >= *((void *)this + 2) || (char)*v16 < 0)
      {
        if (wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, &v101)) {
          goto LABEL_16;
        }
LABEL_151:
        if (!v9 && *((unsigned char *)this + 36)) {
          return;
        }
        exception = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x263E6D1C0](exception, "Parsing failed in metric");
LABEL_199:
        __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
      }
      unsigned int v101 = *v16;
      *((void *)this + 1) = v16 + 1;
LABEL_16:
      double v85 = a3;
      unsigned int v87 = v9;
      int UnpackedType = wis::reflect::getUnpackedType(DecodingType);
      int WireTypeForType = wis::reflect::getWireTypeForType(UnpackedType);
      unsigned int v99 = this;
      int v100 = wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(this);
      std::string __p = 0;
      char v97 = 0;
      unint64_t v98 = 0;
      while (1)
      {
        int v18 = wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(this);
        if (v18 < 1) {
          break;
        }
        int v19 = v97;
        if ((unint64_t)v97 >= v98)
        {
          int v21 = (char **)__p;
          int64_t v22 = ((char *)v97 - (unsigned char *)__p) >> 3;
          unint64_t v23 = v22 + 1;
          if ((unint64_t)(v22 + 1) >> 61) {
            sub_2638A2514();
          }
          uint64_t v24 = v98 - (void)__p;
          if ((uint64_t)(v98 - (void)__p) >> 2 > v23) {
            unint64_t v23 = v24 >> 2;
          }
          if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v25 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v25 = v23;
          }
          if (v25)
          {
            long long v26 = (char *)sub_26389E00C((uint64_t)&v98, v25);
            int v21 = (char **)__p;
            int v19 = v97;
          }
          else
          {
            long long v26 = 0;
          }
          uint64_t v27 = (char **)&v26[8 * v22];
          *uint64_t v27 = 0;
          uint64_t v20 = v27 + 1;
          while (v19 != v21)
          {
            uint64_t v28 = *--v19;
            *--uint64_t v27 = v28;
          }
          std::string __p = v27;
          char v97 = v20;
          unint64_t v98 = (unint64_t)&v26[8 * v25];
          if (v21) {
            operator delete(v21);
          }
        }
        else
        {
          *char v97 = 0;
          uint64_t v20 = v19 + 1;
        }
        char v97 = v20;
        switch(WireTypeForType)
        {
          case 0:
            uint64_t v29 = (unint64_t *)(v20 - 1);
            uint64_t v30 = (char *)*((void *)this + 1);
            if ((unint64_t)v30 >= *((void *)this + 2) || *v30 < 0)
            {
              char Varint64Fallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(this, v29);
LABEL_42:
              if ((Varint64Fallback & 1) == 0) {
                goto LABEL_148;
              }
            }
            else
            {
              unint64_t *v29 = *v30;
              *((void *)this + 1) = v30 + 1;
            }
            break;
          case 1:
            char Varint64Fallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(this, (unint64_t *)v20 - 1);
            goto LABEL_42;
          case 2:
            goto LABEL_148;
          case 5:
            v119[0] = 0;
            char LittleEndian32Fallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(this, v119);
            *(v97 - 1) = (char *)v119[0];
            if ((LittleEndian32Fallback & 1) == 0) {
              goto LABEL_148;
            }
            continue;
          default:
            continue;
        }
      }
      switch((int)DecodingType)
      {
        case 15:
          sub_2638A9784((uint64_t *)&__p, &v110);
          __n128 v108 = *a2;
          unint64_t v109 = a2[1].n128_u64[0];
          *(__n128 *)unint64_t v119 = *a2;
          unint64_t v120 = a2[1].n128_u64[0];
          unint64_t v33 = sub_2638A1CF8((uint64_t)v85, (MetadataHandle *)v119, v87);
          int v118 = 0;
          LOBYTE(v117) = 2;
          *(void *)unint64_t v115 = 0;
          *(void *)unint64_t v113 = 0;
          int v118 = (char **)sub_2638AC1C4((uint64_t *)v115, (uint64_t *)v113);
          xpc_object_t v35 = (double *)v110.n128_u64[1];
          for (int i = (double *)v110.n128_u64[0]; i != v35; ++i)
          {
            double v36 = *i;
            double v112 = *i;
            if (UnpackedType == 11)
            {
              *(__n128 *)unint64_t v113 = v108;
              unint64_t v114 = v109;
              sub_2638A2174((uint64_t)v85, (MetadataHandle *)v113, v87, (unint64_t)v36, v115);
              uint64_t v37 = HIBYTE(v116);
              if (v116 < 0) {
                uint64_t v37 = *(void *)&v115[2];
              }
              if (v37) {
                sub_2638AE784((uint64_t)&v117, (uint64_t)v115);
              }
              else {
                sub_2638AEDC8((uint64_t)&v117, (uint64_t *)&v112);
              }
              if (SHIBYTE(v116) < 0) {
                operator delete(*(void **)v115);
              }
            }
            else if (UnpackedType == 12)
            {
              LOBYTE(v115[0]) = v36 != 0.0;
              sub_2638AE620((uint64_t)&v117, (unsigned __int8 *)v115);
            }
            else
            {
              sub_2638AEDC8((uint64_t)&v117, (uint64_t *)&v112);
            }
          }
          goto LABEL_154;
        case 16:
          sub_2638A9A5C((uint64_t *)&__p, &v110);
          __n128 v108 = *a2;
          unint64_t v109 = a2[1].n128_u64[0];
          *(__n128 *)unint64_t v119 = *a2;
          unint64_t v120 = a2[1].n128_u64[0];
          unint64_t v33 = sub_2638A1CF8((uint64_t)v85, (MetadataHandle *)v119, v87);
          int v118 = 0;
          LOBYTE(v117) = 2;
          *(void *)unint64_t v115 = 0;
          *(void *)unint64_t v113 = 0;
          int v118 = (char **)sub_2638AC1C4((uint64_t *)v115, (uint64_t *)v113);
          uint64_t v63 = (float *)v110.n128_u64[1];
          for (j = (float *)v110.n128_u64[0]; j != v63; ++j)
          {
            float v64 = *j;
            *(float *)&double v112 = *j;
            if (UnpackedType == 11)
            {
              *(__n128 *)unint64_t v113 = v108;
              unint64_t v114 = v109;
              sub_2638A2174((uint64_t)v85, (MetadataHandle *)v113, v87, (unint64_t)v64, v115);
              uint64_t v65 = HIBYTE(v116);
              if (v116 < 0) {
                uint64_t v65 = *(void *)&v115[2];
              }
              if (v65) {
                sub_2638AE784((uint64_t)&v117, (uint64_t)v115);
              }
              else {
                sub_2638AF2A8((uint64_t)&v117, (float *)&v112);
              }
              if (SHIBYTE(v116) < 0) {
                operator delete(*(void **)v115);
              }
            }
            else if (UnpackedType == 12)
            {
              LOBYTE(v115[0]) = v64 != 0.0;
              sub_2638AE620((uint64_t)&v117, (unsigned __int8 *)v115);
            }
            else
            {
              sub_2638AF2A8((uint64_t)&v117, (float *)&v112);
            }
          }
LABEL_154:
          *(__n128 *)unint64_t v115 = v108;
          int64_t v116 = v109;
          int v66 = sub_2638A1D7C((uint64_t)v85, (MetadataHandle *)v115, v87);
          sub_2638BEEB0(v85, v33, (uint64_t)&v117, v66);
          sub_2638A5C4C(&v118, v117);
          uint64_t v61 = (void *)v110.n128_u64[0];
          if (!v110.n128_u64[0]) {
            break;
          }
          v110.n128_u64[1] = v110.n128_u64[0];
          goto LABEL_147;
        case 17:
        case 25:
          sub_2638A9700((uint64_t *)&__p, v119);
          *(__n128 *)unint64_t v115 = *a2;
          int64_t v116 = a2[1].n128_i64[0];
          sub_2638AE288(v85, (uint64_t **)v119, (long long *)v115, v87, UnpackedType);
          goto LABEL_145;
        case 18:
        case 24:
          sub_2638A9700((uint64_t *)&__p, v119);
          *(__n128 *)unint64_t v115 = *a2;
          int64_t v116 = a2[1].n128_i64[0];
          sub_2638ADEF0(v85, (uint64_t **)v119, (long long *)v115, v87, UnpackedType);
          goto LABEL_145;
        case 19:
          sub_2638A9D34((uint64_t *)&__p, v119);
          *(__n128 *)unint64_t v115 = *a2;
          int64_t v116 = a2[1].n128_i64[0];
          sub_2638AE288(v85, (uint64_t **)v119, (long long *)v115, v87, UnpackedType);
          goto LABEL_145;
        case 20:
          sub_2638A99D8((uint64_t *)&__p, v119);
          *(__n128 *)unint64_t v115 = *a2;
          int64_t v116 = a2[1].n128_i64[0];
          sub_2638AE454(v85, (int **)v119, (long long *)v115, v87, UnpackedType);
          goto LABEL_145;
        case 21:
        case 23:
          sub_2638A99D8((uint64_t *)&__p, v119);
          *(__n128 *)unint64_t v115 = *a2;
          int64_t v116 = a2[1].n128_i64[0];
          sub_2638AE0BC(v85, (unsigned int **)v119, (long long *)v115, v87, UnpackedType);
          goto LABEL_145;
        case 22:
          sub_2638A9F88((uint64_t *)&__p, v119);
          *(__n128 *)unint64_t v115 = *a2;
          int64_t v116 = a2[1].n128_i64[0];
          sub_2638AE454(v85, (int **)v119, (long long *)v115, v87, UnpackedType);
LABEL_145:
          uint64_t v61 = *(void **)v119;
          if (!*(void *)v119) {
            break;
          }
          *(void *)&v119[2] = *(void *)v119;
LABEL_147:
          operator delete(v61);
          break;
        case 26:
          sub_2638A9AE4((uint64_t)&__p, &v110);
          __n128 v108 = *a2;
          unint64_t v109 = a2[1].n128_u64[0];
          *(__n128 *)unint64_t v119 = *a2;
          unint64_t v120 = a2[1].n128_u64[0];
          uint64_t v53 = sub_2638A1CF8((uint64_t)v85, (MetadataHandle *)v119, v87);
          int v118 = 0;
          LOBYTE(v117) = 2;
          *(void *)unint64_t v115 = 0;
          *(void *)unint64_t v113 = 0;
          int v118 = (char **)sub_2638AC1C4((uint64_t *)v115, (uint64_t *)v113);
          uint64_t v54 = (void *)v110.n128_u64[0];
          int v55 = v110.n128_u8[8] & 0x3F;
          if (v110.n128_u64[1] > 0x3F || (v110.n128_u8[8] & 0x3F) != 0)
          {
            int v56 = 0;
            int v57 = (void *)(v110.n128_u64[0] + 8 * (v110.n128_u64[1] >> 6));
            do
            {
              uint64_t v58 = *v54 & (1 << v56);
              LOBYTE(v112) = v58 != 0;
              if (UnpackedType == 11)
              {
                *(__n128 *)unint64_t v113 = v108;
                unint64_t v114 = v109;
                sub_2638A2174((uint64_t)v85, (MetadataHandle *)v113, v87, v58 != 0, v115);
                uint64_t v59 = HIBYTE(v116);
                if (v116 < 0) {
                  uint64_t v59 = *(void *)&v115[2];
                }
                if (v59) {
                  sub_2638AE784((uint64_t)&v117, (uint64_t)v115);
                }
                else {
                  sub_2638AF520((uint64_t)&v117, (unsigned __int8 *)&v112);
                }
                if (SHIBYTE(v116) < 0) {
                  operator delete(*(void **)v115);
                }
              }
              else if (UnpackedType == 12)
              {
                LOBYTE(v115[0]) = v58 != 0;
                sub_2638AE620((uint64_t)&v117, (unsigned __int8 *)v115);
              }
              else
              {
                sub_2638AF520((uint64_t)&v117, (unsigned __int8 *)&v112);
              }
              v54 += v56 == 63;
              if (v56 == 63) {
                int v56 = 0;
              }
              else {
                ++v56;
              }
            }
            while (v54 != v57 || v56 != v55);
          }
          *(__n128 *)unint64_t v115 = v108;
          int64_t v116 = v109;
          int v60 = sub_2638A1D7C((uint64_t)v85, (MetadataHandle *)v115, v87);
          sub_2638BEEB0(v85, v53, (uint64_t)&v117, v60);
          sub_2638A5C4C(&v118, v117);
          uint64_t v61 = (void *)v110.n128_u64[0];
          if (!v110.n128_u64[0]) {
            break;
          }
          goto LABEL_147;
        default:
          uint64_t v84 = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x263E6D1C0](v84, "This should never happen, no matter what the input!");
          __cxa_throw(v84, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
      }
LABEL_148:
      if (__p)
      {
        char v97 = (char **)__p;
        operator delete(__p);
      }
      wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(v99);
      LODWORD(v9) = v87;
      if (v18 > 0) {
        goto LABEL_151;
      }
      return;
    case 27:
      v113[0] = 0;
      uint64_t v39 = (char *)*((void *)this + 1);
      if ((unint64_t)v39 >= *((void *)this + 2) || *v39 < 0)
      {
        if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, v113))goto LABEL_151; {
      }
        }
      else
      {
        v113[0] = *v39;
        *((void *)this + 1) = v39 + 1;
      }
      *(void *)unint64_t v119 = this;
      v119[2] = wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(this);
      ++*((_DWORD *)this + 14);
      *(void *)unint64_t v115 = this;
      __n128 v90 = *a2;
      unint64_t v91 = a2[1].n128_u64[0];
      long long v88 = v106;
      uint64_t v89 = v107;
      sub_2638AD42C(a3, this, (long long *)&v90, v9, &v88);
      sub_2638AD55C((wireless_diagnostics::google::protobuf::io::CodedInputStream **)v115);
      int v69 = *((_DWORD *)this + 14);
      BOOL v70 = __OFSUB__(v69, 1);
      int v71 = v69 - 1;
      if (v71 < 0 == v70) {
        *((_DWORD *)this + 14) = v71;
      }
      sub_2638A2140((wireless_diagnostics::google::protobuf::io::CodedInputStream **)v119);
      return;
    default:
      goto LABEL_151;
  }
}

void sub_2638ABBE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,unsigned __int8 a45)
{
  if (v45 < 0) {
    operator delete(*(void **)(v47 - 192));
  }
  sub_2638A5C4C(v46, a45);
  _Unwind_Resume(a1);
}

uint64_t sub_2638ABF24(uint64_t a1)
{
  sub_26389B614(a1 + 48);
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 16);
  if (v2) {
    sub_26389F6D4(v2);
  }
  return a1;
}

uint64_t sub_2638ABF5C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, int a5)
{
  *(unsigned char *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  if (!a3)
  {
LABEL_7:
    int v13 = 1;
    if (a4) {
      goto LABEL_17;
    }
    goto LABEL_10;
  }
  uint64_t v10 = 32 * a3;
  int v11 = (unsigned char **)(a2 + 16);
  while (1)
  {
    int v12 = *v11;
    if (**v11 != 2
      || *(void *)(*((void *)v12 + 1) + 8) - **((void **)v12 + 1) != 32
      || *(unsigned char *)sub_2638AC230((uint64_t)v12, 0) != 3)
    {
      break;
    }
    v11 += 4;
    v10 -= 32;
    if (!v10) {
      goto LABEL_7;
    }
  }
  int v13 = 0;
  if ((a4 & 1) == 0)
  {
LABEL_10:
    if (a5 == 2) {
      int v14 = 0;
    }
    else {
      int v14 = v13;
    }
    if (a5 != 1) {
      LOBYTE(v13) = 1;
    }
    if ((v13 & 1) == 0)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      sub_2638A5294(v20, "cannot create object from initializer list");
      sub_2638A4F78(301, (uint64_t)v20, exception);
      __cxa_throw(exception, (struct type_info *)&unk_270EB63B8, (void (*)(void *))sub_2638A50BC);
    }
    int v13 = v14;
  }
LABEL_17:
  uint64_t v15 = a2 + 32 * a3;
  if (v13)
  {
    *(unsigned char *)a1 = 1;
    uint64_t v16 = operator new(0x18uLL);
    v16[2] = 0;
    v16[1] = 0;
    *uint64_t v16 = v16 + 1;
    *(void *)(a1 + 8) = v16;
    sub_2638AC120(a2, v15, a1);
  }
  else
  {
    *(unsigned char *)a1 = 2;
    uint64_t v19 = v15;
    v20[0] = a2;
    *(void *)(a1 + 8) = sub_2638AC1C4(v20, &v19);
  }
  return a1;
}

void sub_2638AC0E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
  {
    operator delete(__p);
    if ((v16 & 1) == 0) {
LABEL_6:
    }
      _Unwind_Resume(a1);
  }
  else if (!v16)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v15);
  goto LABEL_6;
}

uint64_t sub_2638AC120(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = a1;
    do
    {
      sub_2638AC388(v5, (uint64_t)v7);
      sub_2638ACFCC(*(uint64_t ***)(a3 + 8), *((const void ***)*v8 + 1), *((void *)*v8 + 1), (uint64_t)(*v8 + 16));
      sub_2638A5C4C(&v8, v7[0]);
      v5 += 32;
    }
    while (v5 != a2);
  }
  return a3;
}

void sub_2638AC1AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9)
{
  sub_2638A5C4C(v9, a9);
  _Unwind_Resume(a1);
}

void *sub_2638AC1C4(uint64_t *a1, uint64_t *a2)
{
  unint64_t v4 = operator new(0x18uLL);
  uint64_t v5 = *a1;
  uint64_t v6 = *a2;
  unint64_t v7 = (*a2 - *a1) >> 5;
  v4[1] = 0;
  v4[2] = 0;
  *unint64_t v4 = 0;
  sub_2638AD084(v4, v5, v6, v7);
  return v4;
}

void sub_2638AC21C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_2638AC230(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)a1 != 2)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    uint64_t v5 = (char *)sub_2638AC360((char *)a1);
    sub_2638A5294(&v8, v5);
    uint64_t v6 = std::string::insert(&v8, 0, "cannot use operator[] with a numeric argument with ");
    long long v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
    std::string::size_type v10 = v6->__r_.__value_.__r.__words[2];
    long long v9 = v7;
    v6->__r_.__value_.__l.__size_ = 0;
    v6->__r_.__value_.__r.__words[2] = 0;
    v6->__r_.__value_.__r.__words[0] = 0;
    sub_2638A4F78(305, (uint64_t)&v9, exception);
    __cxa_throw(exception, (struct type_info *)&unk_270EB63B8, (void (*)(void *))sub_2638A50BC);
  }
  return **(void **)(a1 + 8) + 16 * a2;
}

void sub_2638AC300(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

const char *sub_2638AC360(char *a1)
{
  unint64_t v1 = *a1;
  if (v1 > 9) {
    return "number";
  }
  else {
    return off_2655D7F30[v1];
  }
}

uint64_t sub_2638AC388@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *(void *)(result + 16);
  if (!*(unsigned char *)(result + 24)) {
    return sub_2638AC3B8(a2, (const void ****)v2);
  }
  *(unsigned char *)a2 = *(unsigned char *)v2;
  *(void *)(a2 + 8) = *(void *)(v2 + 8);
  *(unsigned char *)uint64_t v2 = 0;
  *(void *)(v2 + 8) = 0;
  return result;
}

uint64_t sub_2638AC3B8(uint64_t a1, const void ****a2)
{
  int v3 = *(unsigned __int8 *)a2;
  *(unsigned char *)a1 = v3;
  *(void *)(a1 + 8) = 0;
  switch(v3)
  {
    case 1:
      unint64_t v4 = sub_2638AC474(a2[1]);
      goto LABEL_8;
    case 2:
      unint64_t v4 = sub_2638ACC28((uint64_t *)a2[1]);
      goto LABEL_8;
    case 3:
      unint64_t v4 = sub_2638ACE84((uint64_t)a2[1]);
      goto LABEL_8;
    case 4:
      unint64_t v4 = (uint64_t *)*((unsigned __int8 *)a2 + 8);
      goto LABEL_8;
    case 5:
    case 6:
    case 7:
      unint64_t v4 = (uint64_t *)a2[1];
      goto LABEL_8;
    case 8:
      unint64_t v4 = sub_2638ACEF0((uint64_t)a2[1]);
LABEL_8:
      *(void *)(a1 + 8) = v4;
      break;
    default:
      return a1;
  }
  return a1;
}

uint64_t *sub_2638AC474(const void ***a1)
{
  uint64_t v2 = (uint64_t *)operator new(0x18uLL);
  sub_2638AC4C0(v2, a1);
  return v2;
}

void sub_2638AC4AC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t *sub_2638AC4C0(uint64_t *a1, const void ***a2)
{
  a1[2] = 0;
  a1[1] = 0;
  *a1 = (uint64_t)(a1 + 1);
  sub_2638AC518(a1, *a2, a2 + 1);
  return a1;
}

void sub_2638AC500(_Unwind_Exception *a1)
{
  sub_2638A64D8(v1, *(char **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *sub_2638AC518(uint64_t *result, const void **a2, const void ***a3)
{
  if (a2 != (const void **)a3)
  {
    unint64_t v4 = a2;
    uint64_t v5 = (uint64_t **)result;
    uint64_t v6 = result + 1;
    do
    {
      uint64_t result = sub_2638AC5A4(v5, v6, v4 + 4, (long long *)v4 + 2);
      long long v7 = (const void **)v4[1];
      if (v7)
      {
        do
        {
          std::string v8 = (const void ***)v7;
          long long v7 = (const void **)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          std::string v8 = (const void ***)v4[2];
          BOOL v9 = *v8 == v4;
          unint64_t v4 = (const void **)v8;
        }
        while (!v9);
      }
      unint64_t v4 = (const void **)v8;
    }
    while (v8 != a3);
  }
  return result;
}

uint64_t *sub_2638AC5A4(uint64_t **a1, uint64_t *a2, const void **a3, long long *a4)
{
  uint64_t v6 = (uint64_t **)sub_2638AC628(a1, a2, &v10, &v9, a3);
  uint64_t result = *v6;
  if (!*v6)
  {
    sub_2638AC7D4((uint64_t)a1, a4, (uint64_t)&v8);
    sub_2638AC858(a1, (uint64_t)v10, v6, v8);
    return v8;
  }
  return result;
}

const void **sub_2638AC628(void *a1, uint64_t *a2, const void ***a3, uint64_t *a4, const void **a5)
{
  uint64_t v9 = (const void **)(a1 + 1);
  if (a1 + 1 != a2 && !sub_2638AC950((uint64_t)(a1 + 2), a5, (const void **)a2 + 4))
  {
    if (!sub_2638AC950((uint64_t)(a1 + 2), (const void **)a2 + 4, a5))
    {
      *a3 = (const void **)a2;
      *a4 = (uint64_t)a2;
      return (const void **)a4;
    }
    a4 = a2 + 1;
    uint64_t v13 = a2[1];
    if (v13)
    {
      int v14 = (const void **)a2[1];
      do
      {
        uint64_t v15 = v14;
        int v14 = (const void **)*v14;
      }
      while (v14);
    }
    else
    {
      int v18 = (const void **)a2;
      do
      {
        uint64_t v15 = (const void **)v18[2];
        BOOL v17 = *v15 == v18;
        int v18 = v15;
      }
      while (!v17);
    }
    if (v15 != v9)
    {
      if (!sub_2638AC950((uint64_t)(a1 + 2), a5, v15 + 4)) {
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
      *a3 = (const void **)a2;
    }
    return (const void **)a4;
  }
  if ((uint64_t *)*a1 == a2)
  {
    int v12 = (const void **)a2;
LABEL_16:
    if (*a2)
    {
      *a3 = v12;
      return v12 + 1;
    }
    else
    {
      *a3 = (const void **)a2;
      return (const void **)a2;
    }
  }
  int v11 = (const void **)*a2;
  if (*a2)
  {
    do
    {
      int v12 = v11;
      int v11 = (const void **)v11[1];
    }
    while (v11);
  }
  else
  {
    int v16 = a2;
    do
    {
      int v12 = (const void **)v16[2];
      BOOL v17 = *v12 == v16;
      int v16 = (uint64_t *)v12;
    }
    while (v17);
  }
  if (sub_2638AC950((uint64_t)(a1 + 2), v12 + 4, a5)) {
    goto LABEL_16;
  }
LABEL_28:

  return (const void **)sub_2638AC8B0((uint64_t)a1, a3, a5);
}

char *sub_2638AC7D4@<X0>(uint64_t a1@<X0>, long long *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  uint64_t v6 = (char *)operator new(0x48uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 16) = 0;
  uint64_t result = sub_2638AC9BC(v6 + 32, a2);
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

void sub_2638AC83C(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0;
  sub_2638ACBCC(v3, v2);
  _Unwind_Resume(a1);
}

uint64_t *sub_2638AC858(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  uint64_t v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  uint64_t result = sub_2638ACA34(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

void *sub_2638AC8B0(uint64_t a1, void *a2, const void **a3)
{
  uint64_t v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4)
  {
    uint64_t v7 = a1 + 16;
    do
    {
      while (1)
      {
        std::string v8 = (void *)v4;
        uint64_t v9 = (const void **)(v4 + 32);
        if (!sub_2638AC950(v7, a3, (const void **)(v4 + 32))) {
          break;
        }
        uint64_t v4 = *v8;
        uint64_t v5 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (!sub_2638AC950(v7, v9, a3)) {
        break;
      }
      uint64_t v5 = v8 + 1;
      uint64_t v4 = v8[1];
    }
    while (v4);
  }
  else
  {
    std::string v8 = (void *)(a1 + 8);
  }
LABEL_10:
  *a2 = v8;
  return v5;
}

BOOL sub_2638AC950(uint64_t a1, const void **a2, const void **a3)
{
  int v3 = *((char *)a3 + 23);
  int v4 = *((char *)a2 + 23);
  if (v4 >= 0) {
    size_t v5 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v5 = (size_t)a2[1];
  }
  if (v4 >= 0) {
    uint64_t v6 = a2;
  }
  else {
    uint64_t v6 = *a2;
  }
  if (v3 >= 0) {
    size_t v7 = *((unsigned __int8 *)a3 + 23);
  }
  else {
    size_t v7 = (size_t)a3[1];
  }
  if (v3 >= 0) {
    std::string v8 = a3;
  }
  else {
    std::string v8 = *a3;
  }
  if (v7 >= v5) {
    size_t v9 = v5;
  }
  else {
    size_t v9 = v7;
  }
  int v10 = memcmp(v6, v8, v9);
  if (v10) {
    return v10 < 0;
  }
  else {
    return v5 < v7;
  }
}

char *sub_2638AC9BC(char *__dst, long long *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    sub_2638A2398(__dst, *(void **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    *((void *)__dst + 2) = *((void *)a2 + 2);
    *(_OWORD *)__dst = v4;
  }
  sub_2638AC3B8(__dst + 24, (char *)a2 + 24);
  return __dst;
}

void sub_2638ACA18(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *sub_2638ACA34(uint64_t *result, uint64_t *a2)
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
      int v3 = (uint64_t *)v2[2];
      long long v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), size_t v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            size_t v9 = (uint64_t **)a2[2];
          }
          else
          {
            size_t v9 = (uint64_t **)v2[1];
            int v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              int v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            uint64_t *v9 = v2;
            v2[2] = (uint64_t)v9;
            int v3 = v9[2];
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
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), size_t v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          uint64_t *v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            int v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          int v3 = (uint64_t *)a2[2];
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
      *size_t v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void sub_2638ACBCC(uint64_t a1, void *__p)
{
  if (*(unsigned char *)(a1 + 8)) {
    sub_2638A6548(*(void *)a1, (uint64_t)__p + 32);
  }
  if (__p)
  {
    operator delete(__p);
  }
}

void *sub_2638ACC28(uint64_t *a1)
{
  uint64_t v2 = operator new(0x18uLL);
  v2[1] = 0;
  v2[2] = 0;
  void *v2 = 0;
  sub_2638ACC84(v2, *a1, a1[1], (a1[1] - *a1) >> 4);
  return v2;
}

void sub_2638ACC70(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_2638ACC84(void *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    int v6 = result;
    sub_2638ACD0C(result, a4);
    uint64_t result = (void *)sub_2638ACD50((uint64_t)(v6 + 2), a2, a3, v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_2638ACCEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  sub_2638A659C(&a9);
  _Unwind_Resume(a1);
}

char *sub_2638ACD0C(void *a1, unint64_t a2)
{
  if (a2 >> 60) {
    sub_2638A2514();
  }
  uint64_t result = (char *)sub_2638A61F0((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

uint64_t sub_2638ACD50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v10 = a4;
  uint64_t v11 = a4;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  char v9 = 0;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      sub_2638AC3B8(v4, v6);
      v6 += 16;
      uint64_t v4 = v11 + 16;
      v11 += 16;
    }
    while (v6 != a3);
  }
  char v9 = 1;
  sub_2638ACDF4((uint64_t)v8);
  return v4;
}

void sub_2638ACDE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_2638ACDF4(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_2638ACE2C(a1);
  }
  return a1;
}

void sub_2638ACE2C(uint64_t a1)
{
  uint64_t v1 = **(char *****)(a1 + 16);
  uint64_t v2 = **(char *****)(a1 + 8);
  if (v1 != v2)
  {
    int v3 = v1 - 1;
    do
    {
      uint64_t v4 = v3 - 1;
      sub_2638A5C4C(v3, *((unsigned __int8 *)v3 - 8));
      v3 -= 2;
    }
    while (v4 != v2);
  }
}

void *sub_2638ACE84(uint64_t a1)
{
  uint64_t v2 = operator new(0x18uLL);
  int v3 = v2;
  if (*(char *)(a1 + 23) < 0)
  {
    sub_2638A2398(v2, *(void **)a1, *(void *)(a1 + 8));
  }
  else
  {
    *(_OWORD *)uint64_t v2 = *(_OWORD *)a1;
    v2[2] = *(void *)(a1 + 16);
  }
  return v3;
}

void sub_2638ACEDC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_2638ACEF0(uint64_t a1)
{
  uint64_t v2 = operator new(0x20uLL);
  v2[1] = 0;
  v2[2] = 0;
  void *v2 = 0;
  sub_2638ACF50(v2, *(const void **)a1, *(void *)(a1 + 8), *(void *)(a1 + 8) - *(void *)a1);
  *((_WORD *)v2 + 12) = *(_WORD *)(a1 + 24);
  return v2;
}

void sub_2638ACF3C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_2638ACF50(void *result, const void *a2, uint64_t a3, size_t __sz)
{
  if (__sz)
  {
    uint64_t v6 = result;
    uint64_t result = sub_2638AA830(result, __sz);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_2638ACFB0(_Unwind_Exception *exception_object)
{
  int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

_OWORD *sub_2638ACFCC(uint64_t **a1, const void **a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = (void **)sub_2638AC8B0((uint64_t)a1, &v11, a2);
  size_t v8 = *v7;
  if (!*v7)
  {
    char v9 = (uint64_t **)v7;
    size_t v8 = operator new(0x48uLL);
    v8[2] = *(_OWORD *)a3;
    *((void *)v8 + 6) = *(void *)(a3 + 16);
    *(void *)(a3 + 8) = 0;
    *(void *)(a3 + 16) = 0;
    *(void *)a3 = 0;
    *((unsigned char *)v8 + 56) = *(unsigned char *)a4;
    *((void *)v8 + 8) = *(void *)(a4 + 8);
    *(unsigned char *)a4 = 0;
    *(void *)(a4 + 8) = 0;
    sub_2638AC858(a1, v11, v9, (uint64_t *)v8);
  }
  return v8;
}

void *sub_2638AD084(void *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    sub_2638ACD0C(result, a4);
    uint64_t result = (void *)sub_2638AD10C((uint64_t)(v6 + 2), a2, a3, v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_2638AD0EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  sub_2638A659C(&a9);
  _Unwind_Resume(a1);
}

uint64_t sub_2638AD10C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v10 = a4;
  uint64_t v11 = a4;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  char v9 = 0;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      sub_2638AD1B0(v4, v6);
      v6 += 32;
      uint64_t v4 = v11 + 16;
      v11 += 16;
    }
    while (v6 != a3);
  }
  char v9 = 1;
  sub_2638ACDF4((uint64_t)v8);
  return v4;
}

void sub_2638AD19C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_2638AD1B0(uint64_t a1, uint64_t a2)
{
  sub_2638AC388(a2, (uint64_t)v4);
  *(unsigned char *)a1 = v4[0];
  *(void *)(a1 + 8) = v5;
  v4[0] = 0;
  size_t v5 = 0;
  sub_2638A5C4C(&v5, 0);
  return a1;
}

void sub_2638AD210(uint64_t *a1, uint64_t a2, long long *a3, unsigned int a4)
{
  long long v15 = *a3;
  uint64_t v16 = *((void *)a3 + 2);
  size_t v8 = sub_2638A1CF8((uint64_t)a1, (MetadataHandle *)&v15, a4);
  v13[0] = 3;
  char v9 = (char **)operator new(0x18uLL);
  *(_OWORD *)char v9 = *(_OWORD *)a2;
  v9[2] = *(char **)(a2 + 16);
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  int v14 = v9;
  long long v11 = *a3;
  uint64_t v12 = *((void *)a3 + 2);
  int v10 = sub_2638A1D7C((uint64_t)a1, (MetadataHandle *)&v11, a4);
  sub_2638BEEB0(a1, v8, (uint64_t)v13, v10);
  sub_2638A5C4C(&v14, v13[0]);
}

void sub_2638AD2E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, unsigned __int8 a13)
{
  sub_2638A5C4C(v13, a13);
  _Unwind_Resume(a1);
}

void sub_2638AD300(uint64_t *a1, uint64_t a2, long long *a3, unsigned int a4)
{
  long long v16 = *a3;
  uint64_t v17 = *((void *)a3 + 2);
  size_t v8 = sub_2638A1CF8((uint64_t)a1, (MetadataHandle *)&v16, a4);
  sub_2638B9730(*(void *)(a2 + 8) - *(void *)a2, *(unsigned char **)a2, &__p);
  long long v15 = 0;
  v14[0] = 3;
  char v9 = (char **)operator new(0x18uLL);
  *(std::string *)char v9 = __p;
  long long v15 = v9;
  long long v11 = *a3;
  uint64_t v12 = *((void *)a3 + 2);
  memset(&__p, 0, sizeof(__p));
  int v10 = sub_2638A1D7C((uint64_t)a1, (MetadataHandle *)&v11, a4);
  sub_2638BEEB0(a1, v8, (uint64_t)v14, v10);
  sub_2638A5C4C(&v15, v14[0]);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_2638AD3FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, char a18)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_2638AD42C(uint64_t *a1, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2, long long *a3, unsigned int a4, long long *a5)
{
  long long v19 = *a3;
  uint64_t v20 = *((void *)a3 + 2);
  int v10 = sub_2638A1CF8((uint64_t)a1, (MetadataHandle *)&v19, a4);
  uint64_t v11 = *a1;
  sub_2638ABF5C((uint64_t)v17, 0, 0, 0, 1);
  *a1 = (uint64_t)v17;
  while ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(a2) >= 1)
  {
    long long v15 = *a5;
    uint64_t v16 = *((void *)a5 + 2);
    sub_2638AA874(a2);
  }
  *a1 = v11;
  long long v13 = *a3;
  uint64_t v14 = *((void *)a3 + 2);
  int v12 = sub_2638A1D7C((uint64_t)a1, (MetadataHandle *)&v13, a4);
  sub_2638BEEB0(a1, v10, (uint64_t)v17, v12);
  sub_2638A5C4C(&v18, v17[0]);
}

void sub_2638AD53C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unsigned __int8 a10, ...)
{
  va_start(va, a10);
  sub_2638A5C4C((char ***)va, a10);
  _Unwind_Resume(a1);
}

wireless_diagnostics::google::protobuf::io::CodedInputStream **sub_2638AD55C(wireless_diagnostics::google::protobuf::io::CodedInputStream **a1)
{
  return a1;
}

void sub_2638AD598(uint64_t *a1, char **a2, unsigned int __val)
{
  std::to_string(&v8, __val);
  if ((v8.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    size_t v5 = &v8;
  }
  else {
    size_t v5 = (std::string *)v8.__r_.__value_.__r.__words[0];
  }
  v6[0] = 6;
  uint64_t v7 = a2;
  sub_2638BEEB0(a1, (char *)v5, (uint64_t)v6, 1);
  sub_2638A5C4C(&v7, v6[0]);
  if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v8.__r_.__value_.__l.__data_);
  }
}

void sub_2638AD62C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, unsigned __int8 a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  sub_2638A5C4C(v17, a10);
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_2638AD654(uint64_t *a1, unsigned char *a2, unint64_t a3, unsigned int __val)
{
  uint64_t v7 = &v12;
  std::to_string(&v12, __val);
  if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    uint64_t v7 = (std::string *)v12.__r_.__value_.__r.__words[0];
  }
  sub_2638B9730(a3, a2, &__p);
  uint64_t v11 = 0;
  v10[0] = 3;
  std::string v8 = (char **)operator new(0x18uLL);
  *(std::string *)std::string v8 = __p;
  memset(&__p, 0, sizeof(__p));
  uint64_t v11 = v8;
  sub_2638BEEB0(a1, (char *)v7, (uint64_t)v10, 1);
  sub_2638A5C4C(&v11, v10[0]);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v12.__r_.__value_.__l.__data_);
  }
}

void sub_2638AD738(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, unsigned __int8 a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  sub_2638A5C4C(v22, a15);
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a22 < 0) {
    operator delete(a17);
  }
  _Unwind_Resume(a1);
}

void sub_2638AD780(uint64_t *a1, char ***a2, long long *a3, unsigned int a4, int a5)
{
  long long v30 = *a3;
  uint64_t v31 = *((void *)a3 + 2);
  int v10 = sub_2638A1CF8((uint64_t)a1, (MetadataHandle *)&v30, a4);
  uint64_t v11 = *a2;
  v28[0] = 6;
  unint64_t v29 = (unint64_t)v11;
  if (a5 == 11)
  {
    long long v22 = *a3;
    uint64_t v23 = *((void *)a3 + 2);
    sub_2638A2174((uint64_t)a1, (MetadataHandle *)&v22, a4, (uint64_t)v11, __p);
    std::string v12 = (void *)HIBYTE(v25);
    char v13 = HIBYTE(v25);
    if (v25 < 0) {
      std::string v12 = __p[1];
    }
    if (v12)
    {
      uint64_t v14 = operator new(0x18uLL);
      *(_OWORD *)uint64_t v14 = *(_OWORD *)__p;
      v14[2] = v25;
      __p[1] = 0;
      uint64_t v25 = 0;
      __p[0] = 0;
      int v15 = v28[0];
      v28[0] = 3;
      char v20 = v15;
      uint64_t v16 = (char **)v29;
      unint64_t v29 = (unint64_t)v14;
      int v21 = v16;
      sub_2638A5C4C(&v21, v15);
      char v13 = HIBYTE(v25);
    }
    if (v13 < 0) {
      operator delete(__p[0]);
    }
  }
  else if (a5 == 12)
  {
    v28[0] = 4;
    char v26 = 6;
    unint64_t v29 = v11 != 0;
    uint64_t v27 = v11;
    sub_2638A5C4C(&v27, 6);
  }
  long long v18 = *a3;
  uint64_t v19 = *((void *)a3 + 2);
  int v17 = sub_2638A1D7C((uint64_t)a1, (MetadataHandle *)&v18, a4);
  sub_2638BEEB0(a1, v10, (uint64_t)v28, v17);
  sub_2638A5C4C((char ***)&v29, v28[0]);
}

void sub_2638AD92C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,unsigned __int8 a23)
{
  if (v24 < 0) {
    operator delete(__p);
  }
  sub_2638A5C4C(v23, a23);
  _Unwind_Resume(a1);
}

void sub_2638AD95C(uint64_t *a1, unsigned int *a2, long long *a3, unsigned int a4, int a5)
{
  long long v30 = *a3;
  uint64_t v31 = *((void *)a3 + 2);
  int v10 = sub_2638A1CF8((uint64_t)a1, (MetadataHandle *)&v30, a4);
  uint64_t v11 = *a2;
  v28[0] = 6;
  unint64_t v29 = v11;
  if (a5 == 11)
  {
    long long v22 = *a3;
    uint64_t v23 = *((void *)a3 + 2);
    sub_2638A2174((uint64_t)a1, (MetadataHandle *)&v22, a4, v11, __p);
    std::string v12 = (void *)HIBYTE(v25);
    char v13 = HIBYTE(v25);
    if (v25 < 0) {
      std::string v12 = __p[1];
    }
    if (v12)
    {
      uint64_t v14 = operator new(0x18uLL);
      *(_OWORD *)uint64_t v14 = *(_OWORD *)__p;
      v14[2] = v25;
      __p[1] = 0;
      uint64_t v25 = 0;
      __p[0] = 0;
      int v15 = v28[0];
      v28[0] = 3;
      char v20 = v15;
      uint64_t v16 = (char **)v29;
      unint64_t v29 = (unint64_t)v14;
      int v21 = v16;
      sub_2638A5C4C(&v21, v15);
      char v13 = HIBYTE(v25);
    }
    if (v13 < 0) {
      operator delete(__p[0]);
    }
  }
  else if (a5 == 12)
  {
    v28[0] = 4;
    char v26 = 6;
    unint64_t v29 = v11 != 0;
    uint64_t v27 = (char **)v11;
    sub_2638A5C4C(&v27, 6);
  }
  long long v18 = *a3;
  uint64_t v19 = *((void *)a3 + 2);
  int v17 = sub_2638A1D7C((uint64_t)a1, (MetadataHandle *)&v18, a4);
  sub_2638BEEB0(a1, v10, (uint64_t)v28, v17);
  sub_2638A5C4C((char ***)&v29, v28[0]);
}

void sub_2638ADB08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,unsigned __int8 a23)
{
  if (v24 < 0) {
    operator delete(__p);
  }
  sub_2638A5C4C(v23, a23);
  _Unwind_Resume(a1);
}

void sub_2638ADB38(uint64_t *a1, char ***a2, long long *a3, unsigned int a4, int a5)
{
  long long v30 = *a3;
  uint64_t v31 = *((void *)a3 + 2);
  int v10 = sub_2638A1CF8((uint64_t)a1, (MetadataHandle *)&v30, a4);
  uint64_t v11 = *a2;
  v28[0] = 5;
  unint64_t v29 = (unint64_t)v11;
  if (a5 == 11)
  {
    long long v22 = *a3;
    uint64_t v23 = *((void *)a3 + 2);
    sub_2638A2174((uint64_t)a1, (MetadataHandle *)&v22, a4, (uint64_t)v11, __p);
    std::string v12 = (void *)HIBYTE(v25);
    char v13 = HIBYTE(v25);
    if (v25 < 0) {
      std::string v12 = __p[1];
    }
    if (v12)
    {
      uint64_t v14 = operator new(0x18uLL);
      *(_OWORD *)uint64_t v14 = *(_OWORD *)__p;
      v14[2] = v25;
      __p[1] = 0;
      uint64_t v25 = 0;
      __p[0] = 0;
      int v15 = v28[0];
      v28[0] = 3;
      char v20 = v15;
      uint64_t v16 = (char **)v29;
      unint64_t v29 = (unint64_t)v14;
      int v21 = v16;
      sub_2638A5C4C(&v21, v15);
      char v13 = HIBYTE(v25);
    }
    if (v13 < 0) {
      operator delete(__p[0]);
    }
  }
  else if (a5 == 12)
  {
    v28[0] = 4;
    char v26 = 5;
    unint64_t v29 = v11 != 0;
    uint64_t v27 = v11;
    sub_2638A5C4C(&v27, 5);
  }
  long long v18 = *a3;
  uint64_t v19 = *((void *)a3 + 2);
  int v17 = sub_2638A1D7C((uint64_t)a1, (MetadataHandle *)&v18, a4);
  sub_2638BEEB0(a1, v10, (uint64_t)v28, v17);
  sub_2638A5C4C((char ***)&v29, v28[0]);
}

void sub_2638ADCE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,unsigned __int8 a23)
{
  if (v24 < 0) {
    operator delete(__p);
  }
  sub_2638A5C4C(v23, a23);
  _Unwind_Resume(a1);
}

void sub_2638ADD14(uint64_t *a1, int *a2, long long *a3, unsigned int a4, int a5)
{
  long long v30 = *a3;
  uint64_t v31 = *((void *)a3 + 2);
  int v10 = sub_2638A1CF8((uint64_t)a1, (MetadataHandle *)&v30, a4);
  uint64_t v11 = *a2;
  v28[0] = 5;
  unint64_t v29 = v11;
  if (a5 == 11)
  {
    long long v22 = *a3;
    uint64_t v23 = *((void *)a3 + 2);
    sub_2638A2174((uint64_t)a1, (MetadataHandle *)&v22, a4, v11, __p);
    std::string v12 = (void *)HIBYTE(v25);
    char v13 = HIBYTE(v25);
    if (v25 < 0) {
      std::string v12 = __p[1];
    }
    if (v12)
    {
      uint64_t v14 = operator new(0x18uLL);
      *(_OWORD *)uint64_t v14 = *(_OWORD *)__p;
      v14[2] = v25;
      __p[1] = 0;
      uint64_t v25 = 0;
      __p[0] = 0;
      int v15 = v28[0];
      v28[0] = 3;
      char v20 = v15;
      uint64_t v16 = (char **)v29;
      unint64_t v29 = (unint64_t)v14;
      int v21 = v16;
      sub_2638A5C4C(&v21, v15);
      char v13 = HIBYTE(v25);
    }
    if (v13 < 0) {
      operator delete(__p[0]);
    }
  }
  else if (a5 == 12)
  {
    v28[0] = 4;
    char v26 = 5;
    unint64_t v29 = v11 != 0;
    uint64_t v27 = (char **)v11;
    sub_2638A5C4C(&v27, 5);
  }
  long long v18 = *a3;
  uint64_t v19 = *((void *)a3 + 2);
  int v17 = sub_2638A1D7C((uint64_t)a1, (MetadataHandle *)&v18, a4);
  sub_2638BEEB0(a1, v10, (uint64_t)v28, v17);
  sub_2638A5C4C((char ***)&v29, v28[0]);
}

void sub_2638ADEC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,unsigned __int8 a23)
{
  if (v24 < 0) {
    operator delete(__p);
  }
  sub_2638A5C4C(v23, a23);
  _Unwind_Resume(a1);
}

void sub_2638ADEF0(uint64_t *a1, uint64_t **a2, long long *a3, unsigned int a4, int a5)
{
  long long v25 = *a3;
  uint64_t v26 = *((void *)a3 + 2);
  int v10 = sub_2638A1CF8((uint64_t)a1, (MetadataHandle *)&v25, a4);
  sub_2638ABF5C((uint64_t)v23, 0, 0, 0, 2);
  std::string v12 = *a2;
  uint64_t v11 = a2[1];
  while (v12 != v11)
  {
    uint64_t v13 = *v12;
    uint64_t v22 = *v12;
    if (a5 == 11)
    {
      long long v18 = *a3;
      uint64_t v19 = *((void *)a3 + 2);
      sub_2638A2174((uint64_t)a1, (MetadataHandle *)&v18, a4, v13, __p);
      unint64_t v14 = v21;
      if ((v21 & 0x80u) != 0) {
        unint64_t v14 = (unint64_t)__p[1];
      }
      if (v14) {
        sub_2638AE784((uint64_t)v23, (uint64_t)__p);
      }
      else {
        sub_2638AE940((uint64_t)v23, &v22);
      }
      if ((char)v21 < 0) {
        operator delete(__p[0]);
      }
    }
    else if (a5 == 12)
    {
      LOBYTE(__p[0]) = v13 != 0;
      sub_2638AE620((uint64_t)v23, (unsigned __int8 *)__p);
    }
    else
    {
      sub_2638AE940((uint64_t)v23, &v22);
    }
    ++v12;
  }
  long long v16 = *a3;
  uint64_t v17 = *((void *)a3 + 2);
  int v15 = sub_2638A1D7C((uint64_t)a1, (MetadataHandle *)&v16, a4);
  sub_2638BEEB0(a1, v10, (uint64_t)v23, v15);
  sub_2638A5C4C(&v24, v23[0]);
}

void sub_2638AE07C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,unsigned __int8 a24,char **a25)
{
}

void sub_2638AE0BC(uint64_t *a1, unsigned int **a2, long long *a3, unsigned int a4, int a5)
{
  long long v25 = *a3;
  uint64_t v26 = *((void *)a3 + 2);
  int v10 = sub_2638A1CF8((uint64_t)a1, (MetadataHandle *)&v25, a4);
  sub_2638ABF5C((uint64_t)v23, 0, 0, 0, 2);
  std::string v12 = *a2;
  uint64_t v11 = a2[1];
  while (v12 != v11)
  {
    uint64_t v13 = *v12;
    unsigned int v22 = *v12;
    if (a5 == 11)
    {
      long long v18 = *a3;
      uint64_t v19 = *((void *)a3 + 2);
      sub_2638A2174((uint64_t)a1, (MetadataHandle *)&v18, a4, v13, __p);
      unint64_t v14 = v21;
      if ((v21 & 0x80u) != 0) {
        unint64_t v14 = (unint64_t)__p[1];
      }
      if (v14) {
        sub_2638AE784((uint64_t)v23, (uint64_t)__p);
      }
      else {
        sub_2638AF038((uint64_t)v23, &v22);
      }
      if ((char)v21 < 0) {
        operator delete(__p[0]);
      }
    }
    else if (a5 == 12)
    {
      LOBYTE(__p[0]) = v13 != 0;
      sub_2638AE620((uint64_t)v23, (unsigned __int8 *)__p);
    }
    else
    {
      sub_2638AF038((uint64_t)v23, &v22);
    }
    ++v12;
  }
  long long v16 = *a3;
  uint64_t v17 = *((void *)a3 + 2);
  int v15 = sub_2638A1D7C((uint64_t)a1, (MetadataHandle *)&v16, a4);
  sub_2638BEEB0(a1, v10, (uint64_t)v23, v15);
  sub_2638A5C4C(&v24, v23[0]);
}

void sub_2638AE248(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,unsigned __int8 a24,char **a25)
{
}

void sub_2638AE288(uint64_t *a1, uint64_t **a2, long long *a3, unsigned int a4, int a5)
{
  long long v25 = *a3;
  uint64_t v26 = *((void *)a3 + 2);
  int v10 = sub_2638A1CF8((uint64_t)a1, (MetadataHandle *)&v25, a4);
  sub_2638ABF5C((uint64_t)v23, 0, 0, 0, 2);
  std::string v12 = *a2;
  uint64_t v11 = a2[1];
  while (v12 != v11)
  {
    uint64_t v13 = *v12;
    uint64_t v22 = *v12;
    if (a5 == 11)
    {
      long long v18 = *a3;
      uint64_t v19 = *((void *)a3 + 2);
      sub_2638A2174((uint64_t)a1, (MetadataHandle *)&v18, a4, v13, __p);
      unint64_t v14 = v21;
      if ((v21 & 0x80u) != 0) {
        unint64_t v14 = (unint64_t)__p[1];
      }
      if (v14) {
        sub_2638AE784((uint64_t)v23, (uint64_t)__p);
      }
      else {
        sub_2638AF790((uint64_t)v23, &v22);
      }
      if ((char)v21 < 0) {
        operator delete(__p[0]);
      }
    }
    else if (a5 == 12)
    {
      LOBYTE(__p[0]) = v13 != 0;
      sub_2638AE620((uint64_t)v23, (unsigned __int8 *)__p);
    }
    else
    {
      sub_2638AF790((uint64_t)v23, &v22);
    }
    ++v12;
  }
  long long v16 = *a3;
  uint64_t v17 = *((void *)a3 + 2);
  int v15 = sub_2638A1D7C((uint64_t)a1, (MetadataHandle *)&v16, a4);
  sub_2638BEEB0(a1, v10, (uint64_t)v23, v15);
  sub_2638A5C4C(&v24, v23[0]);
}

void sub_2638AE414(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,unsigned __int8 a24,char **a25)
{
}

void sub_2638AE454(uint64_t *a1, int **a2, long long *a3, unsigned int a4, int a5)
{
  long long v25 = *a3;
  uint64_t v26 = *((void *)a3 + 2);
  int v10 = sub_2638A1CF8((uint64_t)a1, (MetadataHandle *)&v25, a4);
  sub_2638ABF5C((uint64_t)v23, 0, 0, 0, 2);
  std::string v12 = *a2;
  uint64_t v11 = a2[1];
  while (v12 != v11)
  {
    uint64_t v13 = *v12;
    int v22 = *v12;
    if (a5 == 11)
    {
      long long v18 = *a3;
      uint64_t v19 = *((void *)a3 + 2);
      sub_2638A2174((uint64_t)a1, (MetadataHandle *)&v18, a4, v13, __p);
      unint64_t v14 = v21;
      if ((v21 & 0x80u) != 0) {
        unint64_t v14 = (unint64_t)__p[1];
      }
      if (v14) {
        sub_2638AE784((uint64_t)v23, (uint64_t)__p);
      }
      else {
        sub_2638AFA00((uint64_t)v23, &v22);
      }
      if ((char)v21 < 0) {
        operator delete(__p[0]);
      }
    }
    else if (a5 == 12)
    {
      LOBYTE(__p[0]) = v13 != 0;
      sub_2638AE620((uint64_t)v23, (unsigned __int8 *)__p);
    }
    else
    {
      sub_2638AFA00((uint64_t)v23, &v22);
    }
    ++v12;
  }
  long long v16 = *a3;
  uint64_t v17 = *((void *)a3 + 2);
  int v15 = sub_2638A1D7C((uint64_t)a1, (MetadataHandle *)&v16, a4);
  sub_2638BEEB0(a1, v10, (uint64_t)v23, v15);
  sub_2638A5C4C(&v24, v23[0]);
}

void sub_2638AE5E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,unsigned __int8 a24,char **a25)
{
}

uint64_t sub_2638AE620(uint64_t a1, unsigned __int8 *a2)
{
  if (*(unsigned char *)a1)
  {
    if (*(unsigned char *)a1 != 2)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      uint64_t v7 = (char *)sub_2638AC360((char *)a1);
      sub_2638A5294(&v10, v7);
      std::string v8 = std::string::insert(&v10, 0, "cannot use emplace_back() with ");
      long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
      std::string::size_type v12 = v8->__r_.__value_.__r.__words[2];
      long long v11 = v9;
      v8->__r_.__value_.__l.__size_ = 0;
      v8->__r_.__value_.__r.__words[2] = 0;
      v8->__r_.__value_.__r.__words[0] = 0;
      sub_2638A4F78(311, (uint64_t)&v11, exception);
      __cxa_throw(exception, (struct type_info *)&unk_270EB63B8, (void (*)(void *))sub_2638A50BC);
    }
    uint64_t v4 = *(uint64_t **)(a1 + 8);
  }
  else
  {
    *(unsigned char *)a1 = 2;
    uint64_t v4 = (uint64_t *)operator new(0x18uLL);
    v4[1] = 0;
    v4[2] = 0;
    *uint64_t v4 = 0;
    *(void *)(a1 + 8) = v4;
  }

  return sub_2638AEAA4(v4, a2);
}

void sub_2638AE724(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

uint64_t sub_2638AE784(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)a1)
  {
    if (*(unsigned char *)a1 != 2)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      std::string v10 = (char *)sub_2638AC360((char *)a1);
      sub_2638A5294(&v13, v10);
      long long v11 = std::string::insert(&v13, 0, "cannot use emplace_back() with ");
      long long v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
      std::string::size_type v15 = v11->__r_.__value_.__r.__words[2];
      long long v14 = v12;
      v11->__r_.__value_.__l.__size_ = 0;
      v11->__r_.__value_.__r.__words[2] = 0;
      v11->__r_.__value_.__r.__words[0] = 0;
      sub_2638A4F78(311, (uint64_t)&v14, exception);
      __cxa_throw(exception, (struct type_info *)&unk_270EB63B8, (void (*)(void *))sub_2638A50BC);
    }
    uint64_t v4 = *(uint64_t **)(a1 + 8);
  }
  else
  {
    *(unsigned char *)a1 = 2;
    uint64_t v4 = (uint64_t *)operator new(0x18uLL);
    v4[1] = 0;
    v4[2] = 0;
    *uint64_t v4 = 0;
    *(void *)(a1 + 8) = v4;
  }
  unint64_t v5 = v4[1];
  if (v5 >= v4[2])
  {
    uint64_t v7 = sub_2638AEBB0(v4, a2);
  }
  else
  {
    *(void *)(v5 + 8) = 0;
    *(unsigned char *)unint64_t v5 = 3;
    uint64_t v6 = operator new(0x18uLL);
    *(_OWORD *)uint64_t v6 = *(_OWORD *)a2;
    v6[2] = *(void *)(a2 + 16);
    *(void *)(a2 + 8) = 0;
    *(void *)(a2 + 16) = 0;
    *(void *)a2 = 0;
    *(void *)(v5 + 8) = v6;
    uint64_t v7 = v5 + 16;
    v4[1] = v5 + 16;
  }
  v4[1] = v7;
  return v7 - 16;
}

void sub_2638AE8D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  *(void *)(v21 + 8) = v22;
  _Unwind_Resume(exception_object);
}

uint64_t sub_2638AE940(uint64_t a1, uint64_t *a2)
{
  if (*(unsigned char *)a1)
  {
    if (*(unsigned char *)a1 != 2)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      uint64_t v7 = (char *)sub_2638AC360((char *)a1);
      sub_2638A5294(&v10, v7);
      std::string v8 = std::string::insert(&v10, 0, "cannot use emplace_back() with ");
      long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
      std::string::size_type v12 = v8->__r_.__value_.__r.__words[2];
      long long v11 = v9;
      v8->__r_.__value_.__l.__size_ = 0;
      v8->__r_.__value_.__r.__words[2] = 0;
      v8->__r_.__value_.__r.__words[0] = 0;
      sub_2638A4F78(311, (uint64_t)&v11, exception);
      __cxa_throw(exception, (struct type_info *)&unk_270EB63B8, (void (*)(void *))sub_2638A50BC);
    }
    uint64_t v4 = *(uint64_t **)(a1 + 8);
  }
  else
  {
    *(unsigned char *)a1 = 2;
    uint64_t v4 = (uint64_t *)operator new(0x18uLL);
    v4[1] = 0;
    v4[2] = 0;
    *uint64_t v4 = 0;
    *(void *)(a1 + 8) = v4;
  }

  return sub_2638AECBC(v4, a2);
}

void sub_2638AEA44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

uint64_t sub_2638AEAA4(uint64_t *a1, unsigned __int8 *a2)
{
  unint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = *(void *)(v4 - 8);
  if (v7 >= v6)
  {
    uint64_t v10 = (uint64_t)(v7 - *a1) >> 4;
    unint64_t v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 60) {
      sub_2638A2514();
    }
    uint64_t v12 = v5 - *a1;
    if (v12 >> 3 > v11) {
      unint64_t v11 = v12 >> 3;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v13 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v11;
    }
    v19[4] = v4;
    long long v14 = (char *)sub_2638A61F0(v4, v13);
    std::string::size_type v15 = &v14[16 * v10];
    v19[0] = v14;
    v19[1] = v15;
    v19[3] = &v14[16 * v16];
    *((void *)v15 + 1) = 0;
    uint64_t v17 = *a2;
    *std::string::size_type v15 = 4;
    *((void *)v15 + 1) = v17;
    xpc_object_t v19[2] = v15 + 16;
    sub_2638A6178(a1, v19);
    uint64_t v9 = a1[1];
    sub_2638A633C((uint64_t)v19);
  }
  else
  {
    *(void *)(v7 + 8) = 0;
    uint64_t v8 = *a2;
    *(unsigned char *)unint64_t v7 = 4;
    *(void *)(v7 + 8) = v8;
    uint64_t v9 = v7 + 16;
    a1[1] = v7 + 16;
  }
  a1[1] = v9;
  return v9 - 16;
}

void sub_2638AEB9C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_2638A633C((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_2638AEBB0(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = (a1[1] - *a1) >> 4;
  unint64_t v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) >> 60) {
    sub_2638A2514();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  uint64_t v8 = a1[2] - v3;
  if (v8 >> 3 > v5) {
    unint64_t v5 = v8 >> 3;
  }
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0) {
    unint64_t v9 = 0xFFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v9 = v5;
  }
  long long v18 = a1 + 2;
  if (v9) {
    uint64_t v10 = (char *)sub_2638A61F0(v7, v9);
  }
  else {
    uint64_t v10 = 0;
  }
  unint64_t v11 = &v10[16 * v4];
  v15[0] = v10;
  v15[1] = v11;
  uint64_t v16 = v11;
  uint64_t v17 = &v10[16 * v9];
  *((void *)v11 + 1) = 0;
  *unint64_t v11 = 3;
  uint64_t v12 = operator new(0x18uLL);
  *(_OWORD *)uint64_t v12 = *(_OWORD *)a2;
  v12[2] = *(void *)(a2 + 16);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = 0;
  *((void *)v11 + 1) = v12;
  uint64_t v16 = v11 + 16;
  sub_2638A6178(a1, v15);
  uint64_t v13 = a1[1];
  sub_2638A633C((uint64_t)v15);
  return v13;
}

void sub_2638AECA8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_2638A633C((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_2638AECBC(uint64_t *a1, uint64_t *a2)
{
  unint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = *(void *)(v4 - 8);
  if (v7 >= v6)
  {
    uint64_t v10 = (uint64_t)(v7 - *a1) >> 4;
    unint64_t v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 60) {
      sub_2638A2514();
    }
    uint64_t v12 = v5 - *a1;
    if (v12 >> 3 > v11) {
      unint64_t v11 = v12 >> 3;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v13 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v11;
    }
    v19[4] = v4;
    long long v14 = (char *)sub_2638A61F0(v4, v13);
    std::string::size_type v15 = &v14[16 * v10];
    v19[0] = v14;
    v19[1] = v15;
    v19[3] = &v14[16 * v16];
    *((void *)v15 + 1) = 0;
    uint64_t v17 = *a2;
    *std::string::size_type v15 = 6;
    *((void *)v15 + 1) = v17;
    xpc_object_t v19[2] = v15 + 16;
    sub_2638A6178(a1, v19);
    uint64_t v9 = a1[1];
    sub_2638A633C((uint64_t)v19);
  }
  else
  {
    *(void *)(v7 + 8) = 0;
    uint64_t v8 = *a2;
    *(unsigned char *)unint64_t v7 = 6;
    *(void *)(v7 + 8) = v8;
    uint64_t v9 = v7 + 16;
    a1[1] = v7 + 16;
  }
  a1[1] = v9;
  return v9 - 16;
}

void sub_2638AEDB4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_2638A633C((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_2638AEDC8(uint64_t a1, uint64_t *a2)
{
  if (*(unsigned char *)a1)
  {
    if (*(unsigned char *)a1 != 2)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      unint64_t v7 = (char *)sub_2638AC360((char *)a1);
      sub_2638A5294(&v10, v7);
      uint64_t v8 = std::string::insert(&v10, 0, "cannot use emplace_back() with ");
      long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
      std::string::size_type v12 = v8->__r_.__value_.__r.__words[2];
      long long v11 = v9;
      v8->__r_.__value_.__l.__size_ = 0;
      v8->__r_.__value_.__r.__words[2] = 0;
      v8->__r_.__value_.__r.__words[0] = 0;
      sub_2638A4F78(311, (uint64_t)&v11, exception);
      __cxa_throw(exception, (struct type_info *)&unk_270EB63B8, (void (*)(void *))sub_2638A50BC);
    }
    uint64_t v4 = *(uint64_t **)(a1 + 8);
  }
  else
  {
    *(unsigned char *)a1 = 2;
    uint64_t v4 = (uint64_t *)operator new(0x18uLL);
    v4[1] = 0;
    v4[2] = 0;
    *uint64_t v4 = 0;
    *(void *)(a1 + 8) = v4;
  }

  return sub_2638AEF2C(v4, a2);
}

void sub_2638AEECC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

uint64_t sub_2638AEF2C(uint64_t *a1, uint64_t *a2)
{
  unint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = *(void *)(v4 - 8);
  if (v7 >= v6)
  {
    uint64_t v10 = (uint64_t)(v7 - *a1) >> 4;
    unint64_t v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 60) {
      sub_2638A2514();
    }
    uint64_t v12 = v5 - *a1;
    if (v12 >> 3 > v11) {
      unint64_t v11 = v12 >> 3;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v13 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v11;
    }
    v19[4] = v4;
    long long v14 = (char *)sub_2638A61F0(v4, v13);
    std::string::size_type v15 = &v14[16 * v10];
    v19[0] = v14;
    v19[1] = v15;
    v19[3] = &v14[16 * v16];
    *((void *)v15 + 1) = 0;
    uint64_t v17 = *a2;
    *std::string::size_type v15 = 7;
    *((void *)v15 + 1) = v17;
    xpc_object_t v19[2] = v15 + 16;
    sub_2638A6178(a1, v19);
    uint64_t v9 = a1[1];
    sub_2638A633C((uint64_t)v19);
  }
  else
  {
    *(void *)(v7 + 8) = 0;
    uint64_t v8 = *a2;
    *(unsigned char *)unint64_t v7 = 7;
    *(void *)(v7 + 8) = v8;
    uint64_t v9 = v7 + 16;
    a1[1] = v7 + 16;
  }
  a1[1] = v9;
  return v9 - 16;
}

void sub_2638AF024(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_2638A633C((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_2638AF038(uint64_t a1, unsigned int *a2)
{
  if (*(unsigned char *)a1)
  {
    if (*(unsigned char *)a1 != 2)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      unint64_t v7 = (char *)sub_2638AC360((char *)a1);
      sub_2638A5294(&v10, v7);
      uint64_t v8 = std::string::insert(&v10, 0, "cannot use emplace_back() with ");
      long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
      std::string::size_type v12 = v8->__r_.__value_.__r.__words[2];
      long long v11 = v9;
      v8->__r_.__value_.__l.__size_ = 0;
      v8->__r_.__value_.__r.__words[2] = 0;
      v8->__r_.__value_.__r.__words[0] = 0;
      sub_2638A4F78(311, (uint64_t)&v11, exception);
      __cxa_throw(exception, (struct type_info *)&unk_270EB63B8, (void (*)(void *))sub_2638A50BC);
    }
    uint64_t v4 = *(uint64_t **)(a1 + 8);
  }
  else
  {
    *(unsigned char *)a1 = 2;
    uint64_t v4 = (uint64_t *)operator new(0x18uLL);
    v4[1] = 0;
    v4[2] = 0;
    *uint64_t v4 = 0;
    *(void *)(a1 + 8) = v4;
  }

  return sub_2638AF19C(v4, a2);
}

void sub_2638AF13C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

uint64_t sub_2638AF19C(uint64_t *a1, unsigned int *a2)
{
  unint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = *(void *)(v4 - 8);
  if (v7 >= v6)
  {
    uint64_t v10 = (uint64_t)(v7 - *a1) >> 4;
    unint64_t v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 60) {
      sub_2638A2514();
    }
    uint64_t v12 = v5 - *a1;
    if (v12 >> 3 > v11) {
      unint64_t v11 = v12 >> 3;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v13 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v11;
    }
    v19[4] = v4;
    long long v14 = (char *)sub_2638A61F0(v4, v13);
    std::string::size_type v15 = &v14[16 * v10];
    v19[0] = v14;
    v19[1] = v15;
    v19[3] = &v14[16 * v16];
    *((void *)v15 + 1) = 0;
    uint64_t v17 = *a2;
    *std::string::size_type v15 = 6;
    *((void *)v15 + 1) = v17;
    xpc_object_t v19[2] = v15 + 16;
    sub_2638A6178(a1, v19);
    uint64_t v9 = a1[1];
    sub_2638A633C((uint64_t)v19);
  }
  else
  {
    *(void *)(v7 + 8) = 0;
    uint64_t v8 = *a2;
    *(unsigned char *)unint64_t v7 = 6;
    *(void *)(v7 + 8) = v8;
    uint64_t v9 = v7 + 16;
    a1[1] = v7 + 16;
  }
  a1[1] = v9;
  return v9 - 16;
}

void sub_2638AF294(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_2638A633C((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_2638AF2A8(uint64_t a1, float *a2)
{
  if (*(unsigned char *)a1)
  {
    if (*(unsigned char *)a1 != 2)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      unint64_t v7 = (char *)sub_2638AC360((char *)a1);
      sub_2638A5294(&v10, v7);
      uint64_t v8 = std::string::insert(&v10, 0, "cannot use emplace_back() with ");
      long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
      std::string::size_type v12 = v8->__r_.__value_.__r.__words[2];
      long long v11 = v9;
      v8->__r_.__value_.__l.__size_ = 0;
      v8->__r_.__value_.__r.__words[2] = 0;
      v8->__r_.__value_.__r.__words[0] = 0;
      sub_2638A4F78(311, (uint64_t)&v11, exception);
      __cxa_throw(exception, (struct type_info *)&unk_270EB63B8, (void (*)(void *))sub_2638A50BC);
    }
    uint64_t v4 = *(uint64_t **)(a1 + 8);
  }
  else
  {
    *(unsigned char *)a1 = 2;
    uint64_t v4 = (uint64_t *)operator new(0x18uLL);
    v4[1] = 0;
    v4[2] = 0;
    *uint64_t v4 = 0;
    *(void *)(a1 + 8) = v4;
  }

  return sub_2638AF40C(v4, a2);
}

void sub_2638AF3AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

uint64_t sub_2638AF40C(uint64_t *a1, float *a2)
{
  unint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = *(void *)(v4 - 8);
  if (v7 >= v6)
  {
    uint64_t v10 = (uint64_t)(v7 - *a1) >> 4;
    unint64_t v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 60) {
      sub_2638A2514();
    }
    uint64_t v12 = v5 - *a1;
    if (v12 >> 3 > v11) {
      unint64_t v11 = v12 >> 3;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v13 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v11;
    }
    v19[4] = v4;
    long long v14 = (char *)sub_2638A61F0(v4, v13);
    std::string::size_type v15 = &v14[16 * v10];
    v19[0] = v14;
    v19[1] = v15;
    v19[3] = &v14[16 * v16];
    *((void *)v15 + 1) = 0;
    double v17 = *a2;
    *std::string::size_type v15 = 7;
    *((double *)v15 + 1) = v17;
    xpc_object_t v19[2] = v15 + 16;
    sub_2638A6178(a1, v19);
    uint64_t v9 = a1[1];
    sub_2638A633C((uint64_t)v19);
  }
  else
  {
    *(void *)(v7 + 8) = 0;
    double v8 = *a2;
    *(unsigned char *)unint64_t v7 = 7;
    *(double *)(v7 + 8) = v8;
    uint64_t v9 = v7 + 16;
    a1[1] = v7 + 16;
  }
  a1[1] = v9;
  return v9 - 16;
}

void sub_2638AF50C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_2638A633C((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_2638AF520(uint64_t a1, unsigned __int8 *a2)
{
  if (*(unsigned char *)a1)
  {
    if (*(unsigned char *)a1 != 2)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      unint64_t v7 = (char *)sub_2638AC360((char *)a1);
      sub_2638A5294(&v10, v7);
      double v8 = std::string::insert(&v10, 0, "cannot use emplace_back() with ");
      long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
      std::string::size_type v12 = v8->__r_.__value_.__r.__words[2];
      long long v11 = v9;
      v8->__r_.__value_.__l.__size_ = 0;
      v8->__r_.__value_.__r.__words[2] = 0;
      v8->__r_.__value_.__r.__words[0] = 0;
      sub_2638A4F78(311, (uint64_t)&v11, exception);
      __cxa_throw(exception, (struct type_info *)&unk_270EB63B8, (void (*)(void *))sub_2638A50BC);
    }
    uint64_t v4 = *(uint64_t **)(a1 + 8);
  }
  else
  {
    *(unsigned char *)a1 = 2;
    uint64_t v4 = (uint64_t *)operator new(0x18uLL);
    v4[1] = 0;
    v4[2] = 0;
    *uint64_t v4 = 0;
    *(void *)(a1 + 8) = v4;
  }

  return sub_2638AF684(v4, a2);
}

void sub_2638AF624(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

uint64_t sub_2638AF684(uint64_t *a1, unsigned __int8 *a2)
{
  unint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = *(void *)(v4 - 8);
  if (v7 >= v6)
  {
    uint64_t v10 = (uint64_t)(v7 - *a1) >> 4;
    unint64_t v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 60) {
      sub_2638A2514();
    }
    uint64_t v12 = v5 - *a1;
    if (v12 >> 3 > v11) {
      unint64_t v11 = v12 >> 3;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v13 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v11;
    }
    v19[4] = v4;
    long long v14 = (char *)sub_2638A61F0(v4, v13);
    std::string::size_type v15 = &v14[16 * v10];
    v19[0] = v14;
    v19[1] = v15;
    v19[3] = &v14[16 * v16];
    *((void *)v15 + 1) = 0;
    uint64_t v17 = *a2;
    *std::string::size_type v15 = 4;
    *((void *)v15 + 1) = v17;
    xpc_object_t v19[2] = v15 + 16;
    sub_2638A6178(a1, v19);
    uint64_t v9 = a1[1];
    sub_2638A633C((uint64_t)v19);
  }
  else
  {
    *(void *)(v7 + 8) = 0;
    uint64_t v8 = *a2;
    *(unsigned char *)unint64_t v7 = 4;
    *(void *)(v7 + 8) = v8;
    uint64_t v9 = v7 + 16;
    a1[1] = v7 + 16;
  }
  a1[1] = v9;
  return v9 - 16;
}

void sub_2638AF77C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_2638A633C((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_2638AF790(uint64_t a1, uint64_t *a2)
{
  if (*(unsigned char *)a1)
  {
    if (*(unsigned char *)a1 != 2)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      unint64_t v7 = (char *)sub_2638AC360((char *)a1);
      sub_2638A5294(&v10, v7);
      uint64_t v8 = std::string::insert(&v10, 0, "cannot use emplace_back() with ");
      long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
      std::string::size_type v12 = v8->__r_.__value_.__r.__words[2];
      long long v11 = v9;
      v8->__r_.__value_.__l.__size_ = 0;
      v8->__r_.__value_.__r.__words[2] = 0;
      v8->__r_.__value_.__r.__words[0] = 0;
      sub_2638A4F78(311, (uint64_t)&v11, exception);
      __cxa_throw(exception, (struct type_info *)&unk_270EB63B8, (void (*)(void *))sub_2638A50BC);
    }
    uint64_t v4 = *(uint64_t **)(a1 + 8);
  }
  else
  {
    *(unsigned char *)a1 = 2;
    uint64_t v4 = (uint64_t *)operator new(0x18uLL);
    v4[1] = 0;
    v4[2] = 0;
    *uint64_t v4 = 0;
    *(void *)(a1 + 8) = v4;
  }

  return sub_2638AF8F4(v4, a2);
}

void sub_2638AF894(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

uint64_t sub_2638AF8F4(uint64_t *a1, uint64_t *a2)
{
  unint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = *(void *)(v4 - 8);
  if (v7 >= v6)
  {
    uint64_t v10 = (uint64_t)(v7 - *a1) >> 4;
    unint64_t v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 60) {
      sub_2638A2514();
    }
    uint64_t v12 = v5 - *a1;
    if (v12 >> 3 > v11) {
      unint64_t v11 = v12 >> 3;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v13 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v11;
    }
    v19[4] = v4;
    long long v14 = (char *)sub_2638A61F0(v4, v13);
    std::string::size_type v15 = &v14[16 * v10];
    v19[0] = v14;
    v19[1] = v15;
    v19[3] = &v14[16 * v16];
    *((void *)v15 + 1) = 0;
    uint64_t v17 = *a2;
    *std::string::size_type v15 = 5;
    *((void *)v15 + 1) = v17;
    xpc_object_t v19[2] = v15 + 16;
    sub_2638A6178(a1, v19);
    uint64_t v9 = a1[1];
    sub_2638A633C((uint64_t)v19);
  }
  else
  {
    *(void *)(v7 + 8) = 0;
    uint64_t v8 = *a2;
    *(unsigned char *)unint64_t v7 = 5;
    *(void *)(v7 + 8) = v8;
    uint64_t v9 = v7 + 16;
    a1[1] = v7 + 16;
  }
  a1[1] = v9;
  return v9 - 16;
}

void sub_2638AF9EC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_2638A633C((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_2638AFA00(uint64_t a1, int *a2)
{
  if (*(unsigned char *)a1)
  {
    if (*(unsigned char *)a1 != 2)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      unint64_t v7 = (char *)sub_2638AC360((char *)a1);
      sub_2638A5294(&v10, v7);
      uint64_t v8 = std::string::insert(&v10, 0, "cannot use emplace_back() with ");
      long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
      std::string::size_type v12 = v8->__r_.__value_.__r.__words[2];
      long long v11 = v9;
      v8->__r_.__value_.__l.__size_ = 0;
      v8->__r_.__value_.__r.__words[2] = 0;
      v8->__r_.__value_.__r.__words[0] = 0;
      sub_2638A4F78(311, (uint64_t)&v11, exception);
      __cxa_throw(exception, (struct type_info *)&unk_270EB63B8, (void (*)(void *))sub_2638A50BC);
    }
    uint64_t v4 = *(uint64_t **)(a1 + 8);
  }
  else
  {
    *(unsigned char *)a1 = 2;
    uint64_t v4 = (uint64_t *)operator new(0x18uLL);
    v4[1] = 0;
    v4[2] = 0;
    *uint64_t v4 = 0;
    *(void *)(a1 + 8) = v4;
  }

  return sub_2638AFB64(v4, a2);
}

void sub_2638AFB04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

uint64_t sub_2638AFB64(uint64_t *a1, int *a2)
{
  unint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = *(void *)(v4 - 8);
  if (v7 >= v6)
  {
    uint64_t v10 = (uint64_t)(v7 - *a1) >> 4;
    unint64_t v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 60) {
      sub_2638A2514();
    }
    uint64_t v12 = v5 - *a1;
    if (v12 >> 3 > v11) {
      unint64_t v11 = v12 >> 3;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v13 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v11;
    }
    v19[4] = v4;
    long long v14 = (char *)sub_2638A61F0(v4, v13);
    std::string::size_type v15 = &v14[16 * v10];
    v19[0] = v14;
    v19[1] = v15;
    v19[3] = &v14[16 * v16];
    *((void *)v15 + 1) = 0;
    uint64_t v17 = *a2;
    *std::string::size_type v15 = 5;
    *((void *)v15 + 1) = v17;
    xpc_object_t v19[2] = v15 + 16;
    sub_2638A6178(a1, v19);
    uint64_t v9 = a1[1];
    sub_2638A633C((uint64_t)v19);
  }
  else
  {
    *(void *)(v7 + 8) = 0;
    uint64_t v8 = *a2;
    *(unsigned char *)unint64_t v7 = 5;
    *(void *)(v7 + 8) = v8;
    uint64_t v9 = v7 + 16;
    a1[1] = v7 + 16;
  }
  a1[1] = v9;
  return v9 - 16;
}

void sub_2638AFC5C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_2638A633C((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_2638AFC70(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, __n128 *a2, uint64_t a3)
{
  unint64_t v6 = (unsigned __int8 *)*((void *)this + 1);
  if ((unint64_t)v6 >= *((void *)this + 2) || (char)*v6 < 0)
  {
    unint64_t TagFallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(this);
    *((_DWORD *)this + 8) = TagFallback;
    if (TagFallback) {
      goto LABEL_4;
    }
LABEL_10:
    if (*((unsigned char *)this + 36)) {
      return;
    }
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x263E6D1C0](exception, "Parsing failed in metric");
    goto LABEL_233;
  }
  unint64_t TagFallback = *v6;
  *((_DWORD *)this + 8) = TagFallback;
  *((void *)this + 1) = v6 + 1;
  if (!TagFallback) {
    goto LABEL_10;
  }
LABEL_4:
  unint64_t v8 = wis::reflect::decodeTag((wis::reflect *)TagFallback);
  unint64_t v9 = HIDWORD(v8);
  unsigned __int8 v10 = v8;
  __n128 v102 = *a2;
  unint64_t v103 = a2[1].n128_u64[0];
  DeviceConfigMetadataHelper::getSubfieldType(a3 + 16, &v102, HIDWORD(v8), &v104);
  __n128 v100 = v104;
  uint64_t v101 = v105;
  uint64_t BuiltinType = MetadataHelper::getBuiltinType(a3 + 16, (MetadataHandle *)&v100);
  int v12 = BuiltinType;
  uint64_t DecodingType = wis::reflect::getDecodingType(BuiltinType, v10);
  switch((int)DecodingType)
  {
    case 0:
      switch(v10)
      {
        case 0u:
          *(void *)int v118 = 0;
          if (sub_2638A7CF4(this, (unint64_t *)v118)) {
            goto LABEL_205;
          }
          goto LABEL_180;
        case 1u:
          *(void *)int v118 = 0;
          if (wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(this, (unint64_t *)v118))goto LABEL_180; {
LABEL_205:
          }
          unint64_t v79 = *(void *)v118;
          goto LABEL_208;
        case 2u:
          v116[0] = 0;
          if ((sub_2638A7D24(this, v116) & 1) == 0) {
            goto LABEL_180;
          }
          sub_2638AA7BC(v118, v116[0]);
          char Raw = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadRaw(this, *(void **)v118);
          if (Raw) {
            sub_2638B1668(a3, *(unsigned char **)v118, *(void *)&v118[2] - *(void *)v118, v9);
          }
          goto LABEL_196;
        case 5u:
          v118[0] = 0;
          if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(this, v118))goto LABEL_180; {
          unint64_t v79 = v118[0];
          }
LABEL_208:
          sub_2638B15A4(a3, v79, v9);
          break;
        default:
          goto LABEL_180;
      }
      return;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
      v106[0] = 0;
      switch(v10)
      {
        case 0u:
          long long v14 = (char *)*((void *)this + 1);
          if ((unint64_t)v14 < *((void *)this + 2) && (*v14 & 0x80000000) == 0)
          {
            v106[0] = *v14;
            *((void *)this + 1) = v14 + 1;
LABEL_91:
            unint64_t v45 = v106[0];
            switch(v12)
            {
              case 1:
              case 15:
                double v49 = wis::protobuf::NumberConverter<(wis::reflect::Type)1>::decode(v106[0]);
                __n128 v108 = *a2;
                unint64_t v109 = a2[1].n128_u64[0];
                *(__n128 *)int v118 = *a2;
                unint64_t v119 = a2[1].n128_u64[0];
                uint64_t v47 = sub_2638B1DB4(a3, (MetadataHandle *)v118, v9);
                memset(v116, 0, sizeof(v116));
                int64_t v117 = 0;
                if (v12 == 11)
                {
                  __n128 v112 = v108;
                  unint64_t v113 = v109;
                  sub_2638B1E38(a3, (MetadataHandle *)&v112, v9, (unint64_t)v49, v114);
                  if (SHIBYTE(v117) < 0) {
                    operator delete(*(void **)v116);
                  }
                  *(_OWORD *)int64_t v116 = *(_OWORD *)v114;
                  int64_t v117 = v115;
                }
                else if (v12 == 12)
                {
                  unint64_t v50 = sub_2638B9488(a3, v49 != 0.0);
                  MEMORY[0x263E6D240](v116, v50);
                }
                uint64_t v82 = HIBYTE(v117);
                if (v117 < 0) {
                  uint64_t v82 = *(void *)&v116[2];
                }
                if (!v82)
                {
                  *(__n128 *)unint64_t v114 = v108;
                  unint64_t v115 = v109;
                  int v83 = sub_2638B20DC(a3, (MetadataHandle *)v114, v9);
                  ((void (*)(__n128 *__return_ptr, uint64_t, double))v83)(&v110, a3, v49);
                  if (SHIBYTE(v117) < 0) {
                    operator delete(*(void **)v116);
                  }
                  *(__n128 *)int64_t v116 = v110;
                  int64_t v117 = v111;
                }
                goto LABEL_228;
              case 2:
              case 16:
                float v46 = wis::protobuf::NumberConverter<(wis::reflect::Type)2>::decode(v106[0]);
                __n128 v108 = *a2;
                unint64_t v109 = a2[1].n128_u64[0];
                *(__n128 *)int v118 = *a2;
                unint64_t v119 = a2[1].n128_u64[0];
                uint64_t v47 = sub_2638B1DB4(a3, (MetadataHandle *)v118, v9);
                memset(v116, 0, sizeof(v116));
                int64_t v117 = 0;
                if (v12 == 11)
                {
                  __n128 v112 = v108;
                  unint64_t v113 = v109;
                  sub_2638B1E38(a3, (MetadataHandle *)&v112, v9, (unint64_t)v46, v114);
                  if (SHIBYTE(v117) < 0) {
                    operator delete(*(void **)v116);
                  }
                  *(_OWORD *)int64_t v116 = *(_OWORD *)v114;
                  int64_t v117 = v115;
                }
                else if (v12 == 12)
                {
                  BOOL v48 = sub_2638B9488(a3, v46 != 0.0);
                  MEMORY[0x263E6D240](v116, v48);
                }
                uint64_t v80 = HIBYTE(v117);
                if (v117 < 0) {
                  uint64_t v80 = *(void *)&v116[2];
                }
                if (!v80)
                {
                  *(__n128 *)unint64_t v114 = v108;
                  unint64_t v115 = v109;
                  int v81 = sub_2638B244C(a3, (MetadataHandle *)v114, v9);
                  ((void (*)(__n128 *__return_ptr, uint64_t, float))v81)(&v110, a3, v46);
                  if (SHIBYTE(v117) < 0) {
                    operator delete(*(void **)v116);
                  }
                  *(__n128 *)int64_t v116 = v110;
                  int64_t v117 = v111;
                }
LABEL_228:
                sub_2638B93F0(a3, v47, (uint64_t)v116);
                goto LABEL_229;
              case 3:
              case 11:
              case 17:
              case 25:
                *(void *)int64_t v116 = v106[0];
                goto LABEL_103;
              case 4:
              case 10:
              case 18:
              case 24:
                *(void *)int64_t v116 = v106[0];
                *(__n128 *)int v118 = *a2;
                unint64_t v119 = a2[1].n128_u64[0];
                sub_2638B1734(a3, (uint64_t *)v116, (long long *)v118, v9, v12);
                return;
              case 5:
              case 19:
                *(void *)int64_t v116 = wis::protobuf::NumberConverter<(wis::reflect::Type)5>::decode(v106[0]);
LABEL_103:
                *(__n128 *)int v118 = *a2;
                unint64_t v119 = a2[1].n128_u64[0];
                sub_2638B1A74(a3, (uint64_t *)v116, (long long *)v118, v9, v12);
                return;
              case 6:
              case 20:
                v116[0] = v106[0];
                goto LABEL_105;
              case 7:
              case 9:
              case 21:
              case 23:
                v116[0] = v106[0];
                *(__n128 *)int v118 = *a2;
                unint64_t v119 = a2[1].n128_u64[0];
                sub_2638B18D4(a3, v116, (long long *)v118, v9, v12);
                return;
              case 8:
              case 22:
                v116[0] = wis::protobuf::NumberConverter<(wis::reflect::Type)8>::decode(v106[0]);
LABEL_105:
                *(__n128 *)int v118 = *a2;
                unint64_t v119 = a2[1].n128_u64[0];
                sub_2638B1C14(a3, v116, (long long *)v118, v9, v12);
                return;
              case 12:
              case 26:
                __n128 v110 = *a2;
                unint64_t v111 = a2[1].n128_u64[0];
                *(__n128 *)int v118 = *a2;
                unint64_t v119 = a2[1].n128_u64[0];
                uint64_t v51 = a3;
                int v52 = sub_2638B1DB4(a3, (MetadataHandle *)v118, v9);
                memset(v116, 0, sizeof(v116));
                int64_t v117 = 0;
                if (v12 != 12) {
                  goto LABEL_110;
                }
                uint64_t v53 = sub_2638B9488(v51, v45 != 0);
                MEMORY[0x263E6D240](v116, v53);
                uint64_t v54 = HIBYTE(v117);
                if (v117 < 0) {
                  uint64_t v54 = *(void *)&v116[2];
                }
                if (!v54)
                {
LABEL_110:
                  *(__n128 *)unint64_t v114 = v110;
                  unint64_t v115 = v111;
                  int v55 = sub_2638B2608(v51, (MetadataHandle *)v114, v9);
                  ((void (*)(__n128 *__return_ptr, uint64_t, BOOL))v55)(&v112, v51, v45 != 0);
                  if (SHIBYTE(v117) < 0) {
                    operator delete(*(void **)v116);
                  }
                  *(__n128 *)int64_t v116 = v112;
                  int64_t v117 = v113;
                }
                sub_2638B93F0(v51, v52, (uint64_t)v116);
LABEL_229:
                if (SHIBYTE(v117) < 0) {
                  operator delete(*(void **)v116);
                }
                return;
              default:
                exception = __cxa_allocate_exception(0x10uLL);
                MEMORY[0x263E6D1C0](exception, "This should never happen, no matter what the input!");
                goto LABEL_233;
            }
          }
          if (wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(this, v106)) {
            goto LABEL_91;
          }
          if (v9 || !*((unsigned char *)this + 36)) {
            goto LABEL_116;
          }
          return;
        case 1u:
          if (wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(this, v106)) {
            goto LABEL_91;
          }
          if (v9 || !*((unsigned char *)this + 36)) {
            goto LABEL_116;
          }
          return;
        case 2u:
          if (v9 || !*((unsigned char *)this + 36)) {
            goto LABEL_116;
          }
          return;
        case 5u:
          v118[0] = 0;
          if (wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(this, v118))
          {
            v106[0] = v118[0];
            goto LABEL_91;
          }
          if (!v9 && *((unsigned char *)this + 36)) {
            return;
          }
LABEL_116:
          exception = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x263E6D1C0](exception, "Parsing failed in metric");
          break;
        default:
          goto LABEL_91;
      }
      goto LABEL_233;
    case 13:
      v116[0] = 0;
      unsigned int v41 = (char *)*((void *)this + 1);
      if ((unint64_t)v41 >= *((void *)this + 2) || *v41 < 0)
      {
        if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, v116))goto LABEL_180; {
      }
        }
      else
      {
        v116[0] = *v41;
        *((void *)this + 1) = v41 + 1;
      }
      memset(v118, 0, sizeof(v118));
      unint64_t v119 = 0;
      char Raw = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadString();
      if (Raw)
      {
        __n128 v92 = *a2;
        unint64_t v93 = a2[1].n128_u64[0];
        sub_2638B1344(a3, (uint64_t)v118, (long long *)&v92, v9);
      }
      if ((SHIBYTE(v119) & 0x80000000) == 0) {
        goto LABEL_199;
      }
      xpc_object_t v75 = *(void **)v118;
      goto LABEL_198;
    case 14:
      v116[0] = 0;
      float v43 = (char *)*((void *)this + 1);
      if ((unint64_t)v43 >= *((void *)this + 2) || *v43 < 0)
      {
        if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, v116))goto LABEL_180; {
        unsigned int v44 = v116[0];
        }
      }
      else
      {
        unsigned int v44 = *v43;
        v116[0] = v44;
        *((void *)this + 1) = v43 + 1;
      }
      sub_2638AA7BC(v118, v44);
      char Raw = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadRaw(this, *(void **)v118);
      if (Raw)
      {
        __n128 v90 = *a2;
        unint64_t v91 = a2[1].n128_u64[0];
        sub_2638B13D8(a3, (uint64_t)v118, (long long *)&v90, v9);
      }
LABEL_196:
      xpc_object_t v75 = *(void **)v118;
      if (*(void *)v118)
      {
        *(void *)&v118[2] = *(void *)v118;
LABEL_198:
        operator delete(v75);
      }
LABEL_199:
      if (Raw) {
        return;
      }
      goto LABEL_180;
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
      unsigned int v87 = v9;
      unsigned int v99 = 0;
      uint64_t v16 = (unsigned __int8 *)*((void *)this + 1);
      if ((unint64_t)v16 >= *((void *)this + 2) || (char)*v16 < 0)
      {
        if (wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, &v99)) {
          goto LABEL_16;
        }
LABEL_180:
        if (!v9 && *((unsigned char *)this + 36)) {
          return;
        }
        exception = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x263E6D1C0](exception, "Parsing failed in metric");
LABEL_233:
        __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
      }
      unsigned int v99 = *v16;
      *((void *)this + 1) = v16 + 1;
LABEL_16:
      uint64_t v86 = a3;
      int UnpackedType = wis::reflect::getUnpackedType(DecodingType);
      int WireTypeForType = wis::reflect::getWireTypeForType(UnpackedType);
      char v97 = this;
      int v98 = wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(this);
      std::string __p = 0;
      unint64_t v95 = 0;
      unint64_t v96 = 0;
      while (1)
      {
        int v18 = wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(this);
        if (v18 < 1) {
          break;
        }
        uint64_t v19 = v95;
        if (v95 >= v96)
        {
          uint64_t v21 = (char *)__p;
          uint64_t v22 = (v95 - (unsigned char *)__p) >> 3;
          unint64_t v23 = v22 + 1;
          if ((unint64_t)(v22 + 1) >> 61) {
            sub_2638A2514();
          }
          uint64_t v24 = v96 - (unsigned char *)__p;
          if ((v96 - (unsigned char *)__p) >> 2 > v23) {
            unint64_t v23 = v24 >> 2;
          }
          if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v25 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v25 = v23;
          }
          if (v25)
          {
            uint64_t v26 = (char *)sub_26389E00C((uint64_t)&v96, v25);
            uint64_t v21 = (char *)__p;
            uint64_t v19 = v95;
          }
          else
          {
            uint64_t v26 = 0;
          }
          uint64_t v27 = &v26[8 * v22];
          *(void *)uint64_t v27 = 0;
          char v20 = v27 + 8;
          while (v19 != v21)
          {
            uint64_t v28 = *((void *)v19 - 1);
            v19 -= 8;
            *((void *)v27 - 1) = v28;
            v27 -= 8;
          }
          std::string __p = v27;
          unint64_t v95 = v20;
          unint64_t v96 = &v26[8 * v25];
          if (v21) {
            operator delete(v21);
          }
        }
        else
        {
          *(void *)unint64_t v95 = 0;
          char v20 = v19 + 8;
        }
        unint64_t v95 = v20;
        switch(WireTypeForType)
        {
          case 0:
            unint64_t v29 = (unint64_t *)(v20 - 8);
            long long v30 = (char *)*((void *)this + 1);
            if ((unint64_t)v30 >= *((void *)this + 2) || *v30 < 0)
            {
              char Varint64Fallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(this, v29);
LABEL_42:
              if ((Varint64Fallback & 1) == 0) {
                goto LABEL_177;
              }
            }
            else
            {
              unint64_t *v29 = *v30;
              *((void *)this + 1) = v30 + 1;
            }
            break;
          case 1:
            char Varint64Fallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(this, (unint64_t *)v20 - 1);
            goto LABEL_42;
          case 2:
            goto LABEL_177;
          case 5:
            v118[0] = 0;
            char LittleEndian32Fallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(this, v118);
            *((void *)v95 - 1) = v118[0];
            if ((LittleEndian32Fallback & 1) == 0) {
              goto LABEL_177;
            }
            continue;
          default:
            continue;
        }
      }
      switch((int)DecodingType)
      {
        case 15:
          sub_2638A9784((uint64_t *)&__p, &v108);
          *(__n128 *)long long v106 = *a2;
          unint64_t v107 = a2[1].n128_u64[0];
          *(__n128 *)int v118 = *a2;
          unint64_t v119 = a2[1].n128_u64[0];
          unint64_t v33 = sub_2638B1DB4(a3, (MetadataHandle *)v118, v87);
          unint64_t v34 = (double *)v108.n128_u64[1];
          xpc_object_t v35 = (double *)v108.n128_u64[0];
          if (v108.n128_u64[0] == v108.n128_u64[1]) {
            goto LABEL_169;
          }
          double v36 = v33;
          uint64_t v37 = 0;
          do
          {
            double v38 = *v35;
            memset(v116, 0, sizeof(v116));
            int64_t v117 = 0;
            if (UnpackedType == 11)
            {
              __n128 v112 = *(__n128 *)v106;
              unint64_t v113 = v107;
              sub_2638B1E38(a3, (MetadataHandle *)&v112, v87, (unint64_t)v38, v114);
              if (SHIBYTE(v117) < 0) {
                operator delete(*(void **)v116);
              }
              *(_OWORD *)int64_t v116 = *(_OWORD *)v114;
              int64_t v117 = v115;
            }
            else if (UnpackedType == 12)
            {
              uint64_t v39 = sub_2638B9488(a3, v38 != 0.0);
              MEMORY[0x263E6D240](v116, v39);
            }
            uint64_t v40 = HIBYTE(v117);
            if (v117 < 0) {
              uint64_t v40 = *(void *)&v116[2];
            }
            if (!v40)
            {
              if (!v37)
              {
                __n128 v110 = *(__n128 *)v106;
                unint64_t v111 = v107;
                uint64_t v37 = sub_2638B20DC(a3, (MetadataHandle *)&v110, v87);
              }
              ((void (*)(unsigned int *__return_ptr, uint64_t, double))v37)(v114, a3, v38);
              if (SHIBYTE(v117) < 0) {
                operator delete(*(void **)v116);
              }
              *(_OWORD *)int64_t v116 = *(_OWORD *)v114;
              int64_t v117 = v115;
            }
            sub_2638B93F0(a3, v36, (uint64_t)v116);
            if (SHIBYTE(v117) < 0) {
              operator delete(*(void **)v116);
            }
            ++v35;
          }
          while (v35 != v34);
          goto LABEL_168;
        case 16:
          sub_2638A9A5C((uint64_t *)&__p, &v108);
          *(__n128 *)long long v106 = *a2;
          unint64_t v107 = a2[1].n128_u64[0];
          *(__n128 *)int v118 = *a2;
          unint64_t v119 = a2[1].n128_u64[0];
          int v66 = sub_2638B1DB4(a3, (MetadataHandle *)v118, v87);
          uint64_t v67 = (double *)v108.n128_u64[1];
          xpc_object_t v35 = (double *)v108.n128_u64[0];
          if (v108.n128_u64[0] == v108.n128_u64[1]) {
            goto LABEL_169;
          }
          int v68 = v66;
          int v69 = 0;
          do
          {
            float v70 = *(float *)v35;
            memset(v116, 0, sizeof(v116));
            int64_t v117 = 0;
            if (UnpackedType == 11)
            {
              __n128 v112 = *(__n128 *)v106;
              unint64_t v113 = v107;
              sub_2638B1E38(a3, (MetadataHandle *)&v112, v87, (unint64_t)v70, v114);
              if (SHIBYTE(v117) < 0) {
                operator delete(*(void **)v116);
              }
              *(_OWORD *)int64_t v116 = *(_OWORD *)v114;
              int64_t v117 = v115;
            }
            else if (UnpackedType == 12)
            {
              int v71 = sub_2638B9488(a3, v70 != 0.0);
              MEMORY[0x263E6D240](v116, v71);
            }
            uint64_t v72 = HIBYTE(v117);
            if (v117 < 0) {
              uint64_t v72 = *(void *)&v116[2];
            }
            if (!v72)
            {
              if (!v69)
              {
                __n128 v110 = *(__n128 *)v106;
                unint64_t v111 = v107;
                int v69 = sub_2638B244C(a3, (MetadataHandle *)&v110, v87);
              }
              ((void (*)(unsigned int *__return_ptr, uint64_t, float))v69)(v114, a3, v70);
              if (SHIBYTE(v117) < 0) {
                operator delete(*(void **)v116);
              }
              *(_OWORD *)int64_t v116 = *(_OWORD *)v114;
              int64_t v117 = v115;
            }
            sub_2638B93F0(a3, v68, (uint64_t)v116);
            if (SHIBYTE(v117) < 0) {
              operator delete(*(void **)v116);
            }
            xpc_object_t v35 = (double *)((char *)v35 + 4);
          }
          while (v35 != v67);
LABEL_168:
          xpc_object_t v35 = (double *)v108.n128_u64[0];
LABEL_169:
          if (!v35) {
            goto LABEL_177;
          }
          v108.n128_u64[1] = (unint64_t)v35;
LABEL_171:
          uint64_t v73 = v35;
          break;
        case 17:
        case 25:
          sub_2638A9700((uint64_t *)&__p, v118);
          *(__n128 *)int64_t v116 = *a2;
          int64_t v117 = a2[1].n128_i64[0];
          sub_2638B2EBC(a3, (uint64_t **)v118, (long long *)v116, v87, UnpackedType);
          goto LABEL_174;
        case 18:
        case 24:
          sub_2638A9700((uint64_t *)&__p, v118);
          *(__n128 *)int64_t v116 = *a2;
          int64_t v117 = a2[1].n128_i64[0];
          sub_2638B2B24(a3, (uint64_t **)v118, (long long *)v116, v87, UnpackedType);
          goto LABEL_174;
        case 19:
          sub_2638A9D34((uint64_t *)&__p, v118);
          *(__n128 *)int64_t v116 = *a2;
          int64_t v117 = a2[1].n128_i64[0];
          sub_2638B2EBC(a3, (uint64_t **)v118, (long long *)v116, v87, UnpackedType);
          goto LABEL_174;
        case 20:
          sub_2638A99D8((uint64_t *)&__p, v118);
          *(__n128 *)int64_t v116 = *a2;
          int64_t v117 = a2[1].n128_i64[0];
          sub_2638B3088(a3, (int **)v118, (long long *)v116, v87, UnpackedType);
          goto LABEL_174;
        case 21:
        case 23:
          sub_2638A99D8((uint64_t *)&__p, v118);
          *(__n128 *)int64_t v116 = *a2;
          int64_t v117 = a2[1].n128_i64[0];
          sub_2638B2CF0(a3, (unsigned int **)v118, (long long *)v116, v87, UnpackedType);
          goto LABEL_174;
        case 22:
          sub_2638A9F88((uint64_t *)&__p, v118);
          *(__n128 *)int64_t v116 = *a2;
          int64_t v117 = a2[1].n128_i64[0];
          sub_2638B3088(a3, (int **)v118, (long long *)v116, v87, UnpackedType);
LABEL_174:
          uint64_t v73 = *(double **)v118;
          if (!*(void *)v118) {
            goto LABEL_177;
          }
          *(void *)&v118[2] = *(void *)v118;
          break;
        case 26:
          sub_2638A9AE4((uint64_t)&__p, &v108);
          *(__n128 *)long long v106 = *a2;
          unint64_t v107 = a2[1].n128_u64[0];
          *(__n128 *)int v118 = *a2;
          unint64_t v119 = a2[1].n128_u64[0];
          int v56 = sub_2638B1DB4(a3, (MetadataHandle *)v118, v87);
          xpc_object_t v35 = (double *)v108.n128_u64[0];
          int v57 = v108.n128_u8[8] & 0x3F;
          if (v108.n128_u64[1] > 0x3F || (v108.n128_u8[8] & 0x3F) != 0)
          {
            uint64_t v58 = 0;
            int v59 = 0;
            int v60 = (double *)(v108.n128_u64[0] + 8 * (v108.n128_u64[1] >> 6));
            do
            {
              uint64_t v61 = 1 << v59;
              memset(v116, 0, sizeof(v116));
              int64_t v117 = 0;
              int v62 = v59;
              if (UnpackedType == 11)
              {
                __n128 v112 = *(__n128 *)v106;
                unint64_t v113 = v107;
                sub_2638B1E38(v86, (MetadataHandle *)&v112, v87, (*(void *)v35 >> v59) & 1, v114);
                if (SHIBYTE(v117) < 0) {
                  operator delete(*(void **)v116);
                }
                *(_OWORD *)int64_t v116 = *(_OWORD *)v114;
                int64_t v117 = v115;
              }
              else if (UnpackedType == 12)
              {
                uint64_t v63 = sub_2638B9488(v86, (*(void *)v35 & v61) != 0);
                MEMORY[0x263E6D240](v116, v63);
              }
              uint64_t v64 = HIBYTE(v117);
              if (v117 < 0) {
                uint64_t v64 = *(void *)&v116[2];
              }
              if (v64)
              {
                uint64_t v65 = v86;
              }
              else
              {
                if (!v58)
                {
                  __n128 v110 = *(__n128 *)v106;
                  unint64_t v111 = v107;
                  uint64_t v58 = sub_2638B2608(v86, (MetadataHandle *)&v110, v87);
                }
                uint64_t v65 = v86;
                ((void (*)(unsigned int *__return_ptr, uint64_t, BOOL))v58)(v114, v86, (*(void *)v35 & v61) != 0);
                if (SHIBYTE(v117) < 0) {
                  operator delete(*(void **)v116);
                }
                *(_OWORD *)int64_t v116 = *(_OWORD *)v114;
                int64_t v117 = v115;
              }
              sub_2638B93F0(v65, v56, (uint64_t)v116);
              if (SHIBYTE(v117) < 0) {
                operator delete(*(void **)v116);
              }
              v35 += v62 == 63;
              if (v62 == 63) {
                int v59 = 0;
              }
              else {
                int v59 = v62 + 1;
              }
            }
            while (v35 != v60 || v59 != v57);
            xpc_object_t v35 = (double *)v108.n128_u64[0];
          }
          if (!v35) {
            goto LABEL_177;
          }
          goto LABEL_171;
        default:
          uint64_t v84 = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x263E6D1C0](v84, "This should never happen, no matter what the input!");
          __cxa_throw(v84, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
      }
      operator delete(v73);
LABEL_177:
      if (__p)
      {
        unint64_t v95 = (char *)__p;
        operator delete(__p);
      }
      wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(v97);
      LODWORD(v9) = v87;
      if (v18 > 0) {
        goto LABEL_180;
      }
      return;
    case 27:
      v114[0] = 0;
      unint64_t v42 = (char *)*((void *)this + 1);
      if ((unint64_t)v42 >= *((void *)this + 2) || *v42 < 0)
      {
        if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, v114))goto LABEL_180; {
      }
        }
      else
      {
        v114[0] = *v42;
        *((void *)this + 1) = v42 + 1;
      }
      *(void *)int v118 = this;
      v118[2] = wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(this);
      ++*((_DWORD *)this + 14);
      *(void *)int64_t v116 = this;
      __n128 v88 = *a2;
      unint64_t v89 = a2[1].n128_u64[0];
      sub_2638B147C(a3, this, (long long *)&v88, v9);
      sub_2638B1568((wireless_diagnostics::google::protobuf::io::CodedInputStream **)v116);
      int v76 = *((_DWORD *)this + 14);
      BOOL v77 = __OFSUB__(v76, 1);
      int v78 = v76 - 1;
      if (v78 < 0 == v77) {
        *((_DWORD *)this + 14) = v78;
      }
      sub_2638A2140((wireless_diagnostics::google::protobuf::io::CodedInputStream **)v118);
      return;
    default:
      goto LABEL_180;
  }
}

void sub_2638B0FF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,void *a49,uint64_t a50)
{
  __cxa_free_exception(v50);
  _Unwind_Resume(a1);
}

void *sub_2638B12F4(void *a1)
{
  sub_26389B614((uint64_t)(a1 + 15));
  uint64_t v2 = (std::__shared_weak_count *)a1[11];
  if (v2) {
    sub_26389F6D4(v2);
  }
  uint64_t v3 = (std::__shared_weak_count *)a1[8];
  if (v3) {
    sub_26389F6D4(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[3];
  if (v4) {
    sub_26389F6D4(v4);
  }
  return a1;
}

void sub_2638B1344(uint64_t a1, uint64_t a2, long long *a3, unsigned int a4)
{
  long long v8 = *a3;
  uint64_t v9 = *((void *)a3 + 2);
  unint64_t v6 = sub_2638B1DB4(a1, (MetadataHandle *)&v8, a4);
  sub_2638B94CC((unsigned __int8 *)a2, &v7);
  if (*(char *)(a2 + 23) < 0) {
    operator delete(*(void **)a2);
  }
  *(std::string *)a2 = v7;
  sub_2638B93F0(a1, v6, a2);
}

void sub_2638B13D8(uint64_t a1, uint64_t a2, long long *a3, unsigned int a4)
{
  long long v8 = *a3;
  uint64_t v9 = *((void *)a3 + 2);
  unint64_t v6 = sub_2638B1DB4(a1, (MetadataHandle *)&v8, a4);
  sub_2638B9730(*(void *)(a2 + 8) - *(void *)a2, *(unsigned char **)a2, &__p);
  sub_2638B93F0(a1, v6, (uint64_t)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_2638B1460(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

std::string *sub_2638B147C(uint64_t a1, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2, long long *a3, unsigned int a4)
{
  long long v8 = *a3;
  uint64_t v9 = *((void *)a3 + 2);
  unint64_t v6 = sub_2638B1DB4(a1, (MetadataHandle *)&v8, a4);
  sub_2638B93DC(a1);
  std::string::append(*(std::string **)a1, v6);
  std::string::append(*(std::string **)a1, " {\n");
  ++*(void *)(a1 + 8);
  if ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(a2) >= 1)
  {
    do
      sub_2638AFC70(a2);
    while ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(a2) > 0);
  }
  --*(void *)(a1 + 8);
  sub_2638B93DC(a1);
  return std::string::append(*(std::string **)a1, "}\n");
}

wireless_diagnostics::google::protobuf::io::CodedInputStream **sub_2638B1568(wireless_diagnostics::google::protobuf::io::CodedInputStream **a1)
{
  return a1;
}

void sub_2638B15A4(uint64_t a1, unint64_t a2, unsigned int __val)
{
  sub_2638B94BC(__val, &v7);
  sub_2638B94AC(a2, &__p);
  if ((v7.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    unint64_t v5 = &v7;
  }
  else {
    unint64_t v5 = (std::string *)v7.__r_.__value_.__r.__words[0];
  }
  sub_2638B93F0(a1, (const std::string::value_type *)v5, (uint64_t)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v7.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v7.__r_.__value_.__l.__data_);
  }
}

void sub_2638B1634(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  _Unwind_Resume(exception_object);
}

void sub_2638B1668(uint64_t a1, unsigned char *a2, unint64_t a3, unsigned int __val)
{
  sub_2638B94BC(__val, &v9);
  sub_2638B9730(a3, a2, &__p);
  if ((v9.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string v7 = &v9;
  }
  else {
    std::string v7 = (std::string *)v9.__r_.__value_.__r.__words[0];
  }
  sub_2638B93F0(a1, (const std::string::value_type *)v7, (uint64_t)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v9.__r_.__value_.__l.__data_);
  }
}

void sub_2638B1700(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  _Unwind_Resume(exception_object);
}

void sub_2638B1734(uint64_t a1, uint64_t *a2, long long *a3, unsigned int a4, int a5)
{
  long long v22 = *a3;
  uint64_t v23 = *((void *)a3 + 2);
  unsigned __int8 v10 = sub_2638B1DB4(a1, (MetadataHandle *)&v22, a4);
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v21 = 0;
  if (a5 == 11)
  {
    long long v16 = *a3;
    uint64_t v17 = *((void *)a3 + 2);
    sub_2638B1E38(a1, (MetadataHandle *)&v16, a4, *a2, &v18);
    if (SHIBYTE(v21) < 0) {
      operator delete(__p[0]);
    }
    *(_OWORD *)std::string __p = v18;
    uint64_t v21 = v19;
  }
  else if (a5 == 12)
  {
    unint64_t v11 = sub_2638B9488(a1, *a2 != 0);
    MEMORY[0x263E6D240](__p, v11);
  }
  int v12 = (void *)HIBYTE(v21);
  if (v21 < 0) {
    int v12 = __p[1];
  }
  if (!v12)
  {
    long long v14 = *a3;
    uint64_t v15 = *((void *)a3 + 2);
    unint64_t v13 = sub_2638B1F28(a1, (MetadataHandle *)&v14, a4);
    ((void (*)(long long *__return_ptr, uint64_t, uint64_t))v13)(&v18, a1, *a2);
    if (SHIBYTE(v21) < 0) {
      operator delete(__p[0]);
    }
    *(_OWORD *)std::string __p = v18;
    uint64_t v21 = v19;
  }
  sub_2638B93F0(a1, v10, (uint64_t)__p);
  if (SHIBYTE(v21) < 0) {
    operator delete(__p[0]);
  }
}

void sub_2638B18AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_2638B18D4(uint64_t a1, _DWORD *a2, long long *a3, unsigned int a4, int a5)
{
  long long v22 = *a3;
  uint64_t v23 = *((void *)a3 + 2);
  unsigned __int8 v10 = sub_2638B1DB4(a1, (MetadataHandle *)&v22, a4);
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v21 = 0;
  if (a5 == 11)
  {
    long long v16 = *a3;
    uint64_t v17 = *((void *)a3 + 2);
    sub_2638B1E38(a1, (MetadataHandle *)&v16, a4, *a2, &v18);
    if (SHIBYTE(v21) < 0) {
      operator delete(__p[0]);
    }
    *(_OWORD *)std::string __p = v18;
    uint64_t v21 = v19;
  }
  else if (a5 == 12)
  {
    unint64_t v11 = sub_2638B9488(a1, *a2 != 0);
    MEMORY[0x263E6D240](__p, v11);
  }
  int v12 = (void *)HIBYTE(v21);
  if (v21 < 0) {
    int v12 = __p[1];
  }
  if (!v12)
  {
    long long v14 = *a3;
    uint64_t v15 = *((void *)a3 + 2);
    unint64_t v13 = sub_2638B2298(a1, (MetadataHandle *)&v14, a4);
    ((void (*)(long long *__return_ptr, uint64_t, void))v13)(&v18, a1, *a2);
    if (SHIBYTE(v21) < 0) {
      operator delete(__p[0]);
    }
    *(_OWORD *)std::string __p = v18;
    uint64_t v21 = v19;
  }
  sub_2638B93F0(a1, v10, (uint64_t)__p);
  if (SHIBYTE(v21) < 0) {
    operator delete(__p[0]);
  }
}

void sub_2638B1A4C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_2638B1A74(uint64_t a1, uint64_t *a2, long long *a3, unsigned int a4, int a5)
{
  long long v22 = *a3;
  uint64_t v23 = *((void *)a3 + 2);
  unsigned __int8 v10 = sub_2638B1DB4(a1, (MetadataHandle *)&v22, a4);
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v21 = 0;
  if (a5 == 11)
  {
    long long v16 = *a3;
    uint64_t v17 = *((void *)a3 + 2);
    sub_2638B1E38(a1, (MetadataHandle *)&v16, a4, *a2, &v18);
    if (SHIBYTE(v21) < 0) {
      operator delete(__p[0]);
    }
    *(_OWORD *)std::string __p = v18;
    uint64_t v21 = v19;
  }
  else if (a5 == 12)
  {
    unint64_t v11 = sub_2638B9488(a1, *a2 != 0);
    MEMORY[0x263E6D240](__p, v11);
  }
  int v12 = (void *)HIBYTE(v21);
  if (v21 < 0) {
    int v12 = __p[1];
  }
  if (!v12)
  {
    long long v14 = *a3;
    uint64_t v15 = *((void *)a3 + 2);
    unint64_t v13 = sub_2638B27BC(a1, (MetadataHandle *)&v14, a4);
    ((void (*)(long long *__return_ptr, uint64_t, uint64_t))v13)(&v18, a1, *a2);
    if (SHIBYTE(v21) < 0) {
      operator delete(__p[0]);
    }
    *(_OWORD *)std::string __p = v18;
    uint64_t v21 = v19;
  }
  sub_2638B93F0(a1, v10, (uint64_t)__p);
  if (SHIBYTE(v21) < 0) {
    operator delete(__p[0]);
  }
}

void sub_2638B1BEC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_2638B1C14(uint64_t a1, unsigned int *a2, long long *a3, unsigned int a4, int a5)
{
  long long v22 = *a3;
  uint64_t v23 = *((void *)a3 + 2);
  unsigned __int8 v10 = sub_2638B1DB4(a1, (MetadataHandle *)&v22, a4);
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v21 = 0;
  if (a5 == 11)
  {
    long long v16 = *a3;
    uint64_t v17 = *((void *)a3 + 2);
    sub_2638B1E38(a1, (MetadataHandle *)&v16, a4, (int)*a2, &v18);
    if (SHIBYTE(v21) < 0) {
      operator delete(__p[0]);
    }
    *(_OWORD *)std::string __p = v18;
    uint64_t v21 = v19;
  }
  else if (a5 == 12)
  {
    unint64_t v11 = sub_2638B9488(a1, *a2 != 0);
    MEMORY[0x263E6D240](__p, v11);
  }
  int v12 = (void *)HIBYTE(v21);
  if (v21 < 0) {
    int v12 = __p[1];
  }
  if (!v12)
  {
    long long v14 = *a3;
    uint64_t v15 = *((void *)a3 + 2);
    unint64_t v13 = sub_2638B2970(a1, (MetadataHandle *)&v14, a4);
    ((void (*)(long long *__return_ptr, uint64_t, void))v13)(&v18, a1, *a2);
    if (SHIBYTE(v21) < 0) {
      operator delete(__p[0]);
    }
    *(_OWORD *)std::string __p = v18;
    uint64_t v21 = v19;
  }
  sub_2638B93F0(a1, v10, (uint64_t)__p);
  if (SHIBYTE(v21) < 0) {
    operator delete(__p[0]);
  }
}

void sub_2638B1D8C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

char *sub_2638B1DB4(uint64_t a1, MetadataHandle *a2, unsigned int a3)
{
  __n128 v6 = *(__n128 *)a2;
  uint64_t v7 = *((void *)a2 + 2);
  DeviceConfigMetadataHelper::getSubfieldType(a1 + 16, &v6, a3, &v8);
  *(__n128 *)a2 = v8;
  *((void *)a2 + 2) = v9;
  uint64_t Field = MetadataHandle::getField(a2);
  if (!Field) {
    return (char *)&unk_2638C8ADA;
  }
  uint64_t result = *(char **)(Field + 8);
  if (!result) {
    return (char *)&unk_2638C8ADA;
  }
  if (result[23] < 0) {
    return *(char **)result;
  }
  return result;
}

void *sub_2638B1E38@<X0>(uint64_t a1@<X0>, MetadataHandle *a2@<X1>, unsigned int a3@<W2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  __n128 v15 = *(__n128 *)a2;
  uint64_t v16 = *((void *)a2 + 2);
  DeviceConfigMetadataHelper::getSubfieldType(a1 + 16, &v15, a3, &v17);
  *(__n128 *)a2 = v17;
  *((void *)a2 + 2) = v18;
  uint64_t result = (void *)MetadataHandle::getEnum(a2);
  if (!result) {
    return sub_2638A5294(a5, (char *)&unk_2638C8ADA);
  }
  uint64_t v9 = (uint64_t *)result[1];
  unsigned __int8 v10 = (uint64_t *)result[2];
  if (v9 == v10) {
    return sub_2638A5294(a5, (char *)&unk_2638C8ADA);
  }
  while (1)
  {
    uint64_t v11 = *v9;
    uint64_t v12 = (*(unsigned char *)(*v9 + 32) & 2) != 0 ? 24 : 16;
    if (*(void *)(v11 + v12) == a4) {
      break;
    }
    if (++v9 == v10) {
      return sub_2638A5294(a5, (char *)&unk_2638C8ADA);
    }
  }
  unint64_t v13 = *(long long **)(v11 + 8);
  if (*((char *)v13 + 23) < 0) {
    return sub_2638A2398(a5, *(void **)v13, *((void *)v13 + 1));
  }
  long long v14 = *v13;
  a5[2] = *((void *)v13 + 2);
  *(_OWORD *)a5 = v14;
  return result;
}

uint64_t (*sub_2638B1F28(uint64_t a1, MetadataHandle *a2, unsigned int a3))()
{
  uint64_t v3 = sub_2638B1FEC;
  if (*(unsigned char *)(a1 + 72))
  {
    __n128 v8 = *(__n128 *)a2;
    uint64_t v9 = *((void *)a2 + 2);
    DeviceConfigMetadataHelper::getSubfieldType(a1 + 16, &v8, a3, &v10);
    *(__n128 *)a2 = v10;
    *((void *)a2 + 2) = v11;
    uint64_t Field = MetadataHandle::getField(a2);
    uint64_t v3 = sub_2638B1FEC;
    if (Field)
    {
      uint64_t v3 = sub_2638B1FEC;
      if ((*(_WORD *)(Field + 52) & 0x20) != 0)
      {
        unsigned int v6 = *(_DWORD *)(Field + 36) - 1;
        uint64_t v3 = sub_2638B1FEC;
        if (v6 <= 0x1F) {
          return off_270EB6B20[v6];
        }
      }
    }
  }
  return (uint64_t (*)())v3;
}

void sub_2638B1FF0(unint64_t a1@<X1>, uint64_t a2@<X8>)
{
}

void sub_2638B1FF8(__n128 *a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
}

void sub_2638B2000(__n128 *a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
}

void sub_2638B2008(unint64_t a1@<X1>, std::string *a2@<X8>)
{
  sub_2638C39EC(a1, &v4);
  uint64_t v3 = std::string::insert(&v4, 0, "0x");
  *a2 = *v3;
  v3->__r_.__value_.__l.__size_ = 0;
  v3->__r_.__value_.__r.__words[2] = 0;
  v3->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v4.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v4.__r_.__value_.__l.__data_);
  }
}

void sub_2638B2078(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_2638B2094(unint64_t a1@<X1>, uint64_t a2@<X8>)
{
}

void sub_2638B209C(unint64_t a1@<X1>, uint64_t a2@<X8>)
{
}

void sub_2638B20A4(unint64_t a1@<X1>, uint64_t a2@<X8>)
{
}

void sub_2638B20AC(unint64_t a1@<X1>, uint64_t a2@<X8>)
{
}

void sub_2638B20B4(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
}

void sub_2638B20BC(char a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638B20C4(time_t a1@<X1>, uint64_t a2@<X8>)
{
}

void sub_2638B20CC(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
}

void sub_2638B20D4(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
}

uint64_t (*sub_2638B20DC(uint64_t a1, MetadataHandle *a2, unsigned int a3))()
{
  std::string *(__cdecl *v3)(std::string *__return_ptr __struct_ptr, double);
  uint64_t Field;
  unsigned int v6;
  __n128 v8;
  uint64_t v9;
  __n128 v10;
  uint64_t v11;

  uint64_t v3 = j_std::to_string;
  if (*(unsigned char *)(a1 + 72))
  {
    __n128 v8 = *(__n128 *)a2;
    uint64_t v9 = *((void *)a2 + 2);
    DeviceConfigMetadataHelper::getSubfieldType(a1 + 16, &v8, a3, &v10);
    *(__n128 *)a2 = v10;
    *((void *)a2 + 2) = v11;
    uint64_t Field = MetadataHandle::getField(a2);
    uint64_t v3 = j_std::to_string;
    if (Field)
    {
      uint64_t v3 = j_std::to_string;
      if ((*(_WORD *)(Field + 52) & 0x20) != 0)
      {
        unsigned int v6 = *(_DWORD *)(Field + 36) - 1;
        uint64_t v3 = j_std::to_string;
        if (v6 <= 0x1F) {
          return off_270EB6C20[v6];
        }
      }
    }
  }
  return (uint64_t (*)())v3;
}

void sub_2638B21A4(uint64_t a1@<X8>, double a2@<D0>)
{
}

void sub_2638B21AC(__n128 *a1@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
}

void sub_2638B21B8(__n128 *a1@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
}

void sub_2638B21C4(std::string *a1@<X8>, double a2@<D0>)
{
  sub_2638C39EC((unint64_t)a2, &v4);
  uint64_t v3 = std::string::insert(&v4, 0, "0x");
  *a1 = *v3;
  v3->__r_.__value_.__l.__size_ = 0;
  v3->__r_.__value_.__r.__words[2] = 0;
  v3->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v4.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v4.__r_.__value_.__l.__data_);
  }
}

void sub_2638B2234(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_2638B2250(uint64_t a1@<X8>, double a2@<D0>)
{
}

void sub_2638B2258(uint64_t a1@<X8>, double a2@<D0>)
{
}

void sub_2638B2260(uint64_t a1@<X8>, double a2@<D0>)
{
}

void sub_2638B2268(uint64_t a1@<X8>, double a2@<D0>)
{
}

void sub_2638B2270(uint64_t a1@<X8>, double a2@<D0>)
{
}

void sub_2638B2278(uint64_t a1@<X8>, double a2@<D0>)
{
}

void sub_2638B2280(uint64_t a1@<X8>, double a2@<D0>)
{
}

void sub_2638B2288(uint64_t a1@<X8>, double a2@<D0>)
{
}

void sub_2638B2290(uint64_t a1@<X8>, double a2@<D0>)
{
}

uint64_t (*sub_2638B2298(uint64_t a1, MetadataHandle *a2, unsigned int a3))()
{
  uint64_t v3 = sub_2638B235C;
  if (*(unsigned char *)(a1 + 72))
  {
    __n128 v8 = *(__n128 *)a2;
    uint64_t v9 = *((void *)a2 + 2);
    DeviceConfigMetadataHelper::getSubfieldType(a1 + 16, &v8, a3, &v10);
    *(__n128 *)a2 = v10;
    *((void *)a2 + 2) = v11;
    uint64_t Field = MetadataHandle::getField(a2);
    uint64_t v3 = sub_2638B235C;
    if (Field)
    {
      uint64_t v3 = sub_2638B235C;
      if ((*(_WORD *)(Field + 52) & 0x20) != 0)
      {
        unsigned int v6 = *(_DWORD *)(Field + 36) - 1;
        uint64_t v3 = sub_2638B235C;
        if (v6 <= 0x1F) {
          return off_270EB6D20[v6];
        }
      }
    }
  }
  return (uint64_t (*)())v3;
}

void sub_2638B2360(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638B2368(__n128 *a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
}

void sub_2638B2370(__n128 *a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
}

void sub_2638B2378(unsigned int a1@<W1>, std::string *a2@<X8>)
{
  sub_2638C39EC(a1, &v4);
  uint64_t v3 = std::string::insert(&v4, 0, "0x");
  *a2 = *v3;
  v3->__r_.__value_.__l.__size_ = 0;
  v3->__r_.__value_.__r.__words[2] = 0;
  v3->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v4.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v4.__r_.__value_.__l.__data_);
  }
}

void sub_2638B23E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_2638B2404(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638B240C(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638B2414(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638B241C(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638B2424(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638B242C(char a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638B2434(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638B243C(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638B2444(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
}

uint64_t (*sub_2638B244C(uint64_t a1, MetadataHandle *a2, unsigned int a3))()
{
  std::string *(__cdecl *v3)(std::string *__return_ptr __struct_ptr, float);
  uint64_t Field;
  unsigned int v6;
  __n128 v8;
  uint64_t v9;
  __n128 v10;
  uint64_t v11;

  uint64_t v3 = j_std::to_string;
  if (*(unsigned char *)(a1 + 72))
  {
    __n128 v8 = *(__n128 *)a2;
    uint64_t v9 = *((void *)a2 + 2);
    DeviceConfigMetadataHelper::getSubfieldType(a1 + 16, &v8, a3, &v10);
    *(__n128 *)a2 = v10;
    *((void *)a2 + 2) = v11;
    uint64_t Field = MetadataHandle::getField(a2);
    uint64_t v3 = j_std::to_string;
    if (Field)
    {
      uint64_t v3 = j_std::to_string;
      if ((*(_WORD *)(Field + 52) & 0x20) != 0)
      {
        unsigned int v6 = *(_DWORD *)(Field + 36) - 1;
        uint64_t v3 = j_std::to_string;
        if (v6 <= 0x1F) {
          return off_270EB6E20[v6];
        }
      }
    }
  }
  return (uint64_t (*)())v3;
}

void sub_2638B2514(uint64_t a1@<X8>, float a2@<S0>)
{
}

void sub_2638B251C(__n128 *a1@<X0>, uint64_t a2@<X8>, float a3@<S0>)
{
}

void sub_2638B2528(__n128 *a1@<X0>, uint64_t a2@<X8>, float a3@<S0>)
{
}

void sub_2638B2534(std::string *a1@<X8>, float a2@<S0>)
{
  sub_2638C39EC((unint64_t)a2, &v4);
  uint64_t v3 = std::string::insert(&v4, 0, "0x");
  *a1 = *v3;
  v3->__r_.__value_.__l.__size_ = 0;
  v3->__r_.__value_.__r.__words[2] = 0;
  v3->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v4.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v4.__r_.__value_.__l.__data_);
  }
}

void sub_2638B25A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_2638B25C0(uint64_t a1@<X8>, float a2@<S0>)
{
}

void sub_2638B25C8(uint64_t a1@<X8>, float a2@<S0>)
{
}

void sub_2638B25D0(uint64_t a1@<X8>, float a2@<S0>)
{
}

void sub_2638B25D8(uint64_t a1@<X8>, float a2@<S0>)
{
}

void sub_2638B25E0(uint64_t a1@<X8>, float a2@<S0>)
{
}

void sub_2638B25E8(uint64_t a1@<X8>, float a2@<S0>)
{
}

void sub_2638B25F0(uint64_t a1@<X8>, float a2@<S0>)
{
}

void sub_2638B25F8(uint64_t a1@<X8>, float a2@<S0>)
{
}

void sub_2638B2600(uint64_t a1@<X8>, float a2@<S0>)
{
}

uint64_t (*sub_2638B2608(uint64_t a1, MetadataHandle *a2, unsigned int a3))()
{
  uint64_t v3 = sub_2638B26CC;
  if (*(unsigned char *)(a1 + 72))
  {
    __n128 v8 = *(__n128 *)a2;
    uint64_t v9 = *((void *)a2 + 2);
    DeviceConfigMetadataHelper::getSubfieldType(a1 + 16, &v8, a3, &v10);
    *(__n128 *)a2 = v10;
    *((void *)a2 + 2) = v11;
    uint64_t Field = MetadataHandle::getField(a2);
    uint64_t v3 = sub_2638B26CC;
    if (Field)
    {
      uint64_t v3 = sub_2638B26CC;
      if ((*(_WORD *)(Field + 52) & 0x20) != 0)
      {
        unsigned int v6 = *(_DWORD *)(Field + 36) - 1;
        uint64_t v3 = sub_2638B26CC;
        if (v6 <= 0x1F) {
          return off_270EB6F20[v6];
        }
      }
    }
  }
  return (uint64_t (*)())v3;
}

void sub_2638B26D0(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638B26D8(__n128 *a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
}

void sub_2638B26E0(__n128 *a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
}

void sub_2638B26E8(unsigned int a1@<W1>, std::string *a2@<X8>)
{
  sub_2638C39EC(a1, &v4);
  uint64_t v3 = std::string::insert(&v4, 0, "0x");
  *a2 = *v3;
  v3->__r_.__value_.__l.__size_ = 0;
  v3->__r_.__value_.__r.__words[2] = 0;
  v3->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v4.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v4.__r_.__value_.__l.__data_);
  }
}

void sub_2638B2758(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_2638B2774(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638B277C(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638B2784(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638B278C(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638B2794(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638B279C(char a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638B27A4(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638B27AC(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638B27B4(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
}

uint64_t (*sub_2638B27BC(uint64_t a1, MetadataHandle *a2, unsigned int a3))()
{
  uint64_t v3 = sub_2638B2880;
  if (*(unsigned char *)(a1 + 72))
  {
    __n128 v8 = *(__n128 *)a2;
    uint64_t v9 = *((void *)a2 + 2);
    DeviceConfigMetadataHelper::getSubfieldType(a1 + 16, &v8, a3, &v10);
    *(__n128 *)a2 = v10;
    *((void *)a2 + 2) = v11;
    uint64_t Field = MetadataHandle::getField(a2);
    uint64_t v3 = sub_2638B2880;
    if (Field)
    {
      uint64_t v3 = sub_2638B2880;
      if ((*(_WORD *)(Field + 52) & 0x20) != 0)
      {
        unsigned int v6 = *(_DWORD *)(Field + 36) - 1;
        uint64_t v3 = sub_2638B2880;
        if (v6 <= 0x1F) {
          return off_270EB7020[v6];
        }
      }
    }
  }
  return (uint64_t (*)())v3;
}

void sub_2638B2884(unint64_t a1@<X1>, uint64_t a2@<X8>)
{
}

void sub_2638B288C(__n128 *a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
}

void sub_2638B2894(__n128 *a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
}

void sub_2638B289C(unint64_t a1@<X1>, std::string *a2@<X8>)
{
  sub_2638C39EC(a1, &v4);
  uint64_t v3 = std::string::insert(&v4, 0, "0x");
  *a2 = *v3;
  v3->__r_.__value_.__l.__size_ = 0;
  v3->__r_.__value_.__r.__words[2] = 0;
  v3->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v4.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v4.__r_.__value_.__l.__data_);
  }
}

void sub_2638B290C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_2638B2928(unint64_t a1@<X1>, uint64_t a2@<X8>)
{
}

void sub_2638B2930(unint64_t a1@<X1>, uint64_t a2@<X8>)
{
}

void sub_2638B2938(unint64_t a1@<X1>, uint64_t a2@<X8>)
{
}

void sub_2638B2940(unint64_t a1@<X1>, uint64_t a2@<X8>)
{
}

void sub_2638B2948(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
}

void sub_2638B2950(char a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638B2958(time_t a1@<X1>, uint64_t a2@<X8>)
{
}

void sub_2638B2960(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
}

void sub_2638B2968(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
}

uint64_t (*sub_2638B2970(uint64_t a1, MetadataHandle *a2, unsigned int a3))()
{
  uint64_t v3 = sub_2638B2A34;
  if (*(unsigned char *)(a1 + 72))
  {
    __n128 v8 = *(__n128 *)a2;
    uint64_t v9 = *((void *)a2 + 2);
    DeviceConfigMetadataHelper::getSubfieldType(a1 + 16, &v8, a3, &v10);
    *(__n128 *)a2 = v10;
    *((void *)a2 + 2) = v11;
    uint64_t Field = MetadataHandle::getField(a2);
    uint64_t v3 = sub_2638B2A34;
    if (Field)
    {
      uint64_t v3 = sub_2638B2A34;
      if ((*(_WORD *)(Field + 52) & 0x20) != 0)
      {
        unsigned int v6 = *(_DWORD *)(Field + 36) - 1;
        uint64_t v3 = sub_2638B2A34;
        if (v6 <= 0x1F) {
          return off_270EB7120[v6];
        }
      }
    }
  }
  return (uint64_t (*)())v3;
}

void sub_2638B2A38(int a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638B2A40(__n128 *a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
}

void sub_2638B2A48(__n128 *a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
}

void sub_2638B2A50(int a1@<W1>, std::string *a2@<X8>)
{
  sub_2638C39EC(a1, &v4);
  uint64_t v3 = std::string::insert(&v4, 0, "0x");
  *a2 = *v3;
  v3->__r_.__value_.__l.__size_ = 0;
  v3->__r_.__value_.__r.__words[2] = 0;
  v3->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v4.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v4.__r_.__value_.__l.__data_);
  }
}

void sub_2638B2AC0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_2638B2ADC(int a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638B2AE4(int a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638B2AEC(int a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638B2AF4(int a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638B2AFC(int a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638B2B04(char a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638B2B0C(int a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638B2B14(int a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638B2B1C(int a1@<W1>, uint64_t a2@<X8>)
{
}

void sub_2638B2B24(uint64_t a1, uint64_t **a2, long long *a3, unsigned int a4, int a5)
{
  long long v26 = *a3;
  uint64_t v27 = *((void *)a3 + 2);
  __n128 v10 = sub_2638B1DB4(a1, (MetadataHandle *)&v26, a4);
  uint64_t v11 = *a2;
  uint64_t v12 = a2[1];
  if (*a2 != v12)
  {
    unint64_t v13 = v10;
    long long v14 = 0;
    do
    {
      uint64_t v15 = *v11;
      __p[0] = 0;
      __p[1] = 0;
      uint64_t v25 = 0;
      if (a5 == 11)
      {
        long long v20 = *a3;
        uint64_t v21 = *((void *)a3 + 2);
        sub_2638B1E38(a1, (MetadataHandle *)&v20, a4, v15, &v22);
        if (SHIBYTE(v25) < 0) {
          operator delete(__p[0]);
        }
        *(_OWORD *)std::string __p = v22;
        uint64_t v25 = v23;
      }
      else if (a5 == 12)
      {
        uint64_t v16 = sub_2638B9488(a1, v15 != 0);
        MEMORY[0x263E6D240](__p, v16);
      }
      __n128 v17 = (void *)HIBYTE(v25);
      if (v25 < 0) {
        __n128 v17 = __p[1];
      }
      if (!v17)
      {
        if (!v14)
        {
          long long v18 = *a3;
          uint64_t v19 = *((void *)a3 + 2);
          long long v14 = sub_2638B1F28(a1, (MetadataHandle *)&v18, a4);
        }
        ((void (*)(long long *__return_ptr, uint64_t, uint64_t))v14)(&v22, a1, v15);
        if (SHIBYTE(v25) < 0) {
          operator delete(__p[0]);
        }
        *(_OWORD *)std::string __p = v22;
        uint64_t v25 = v23;
      }
      sub_2638B93F0(a1, v13, (uint64_t)__p);
      if (SHIBYTE(v25) < 0) {
        operator delete(__p[0]);
      }
      ++v11;
    }
    while (v11 != v12);
  }
}

void sub_2638B2CCC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_2638B2CF0(uint64_t a1, unsigned int **a2, long long *a3, unsigned int a4, int a5)
{
  long long v26 = *a3;
  uint64_t v27 = *((void *)a3 + 2);
  __n128 v10 = sub_2638B1DB4(a1, (MetadataHandle *)&v26, a4);
  uint64_t v11 = *a2;
  uint64_t v12 = a2[1];
  if (*a2 != v12)
  {
    unint64_t v13 = v10;
    long long v14 = 0;
    do
    {
      uint64_t v15 = *v11;
      __p[0] = 0;
      __p[1] = 0;
      uint64_t v25 = 0;
      if (a5 == 11)
      {
        long long v20 = *a3;
        uint64_t v21 = *((void *)a3 + 2);
        sub_2638B1E38(a1, (MetadataHandle *)&v20, a4, v15, &v22);
        if (SHIBYTE(v25) < 0) {
          operator delete(__p[0]);
        }
        *(_OWORD *)std::string __p = v22;
        uint64_t v25 = v23;
      }
      else if (a5 == 12)
      {
        uint64_t v16 = sub_2638B9488(a1, v15 != 0);
        MEMORY[0x263E6D240](__p, v16);
      }
      __n128 v17 = (void *)HIBYTE(v25);
      if (v25 < 0) {
        __n128 v17 = __p[1];
      }
      if (!v17)
      {
        if (!v14)
        {
          long long v18 = *a3;
          uint64_t v19 = *((void *)a3 + 2);
          long long v14 = sub_2638B2298(a1, (MetadataHandle *)&v18, a4);
        }
        ((void (*)(long long *__return_ptr, uint64_t, uint64_t))v14)(&v22, a1, v15);
        if (SHIBYTE(v25) < 0) {
          operator delete(__p[0]);
        }
        *(_OWORD *)std::string __p = v22;
        uint64_t v25 = v23;
      }
      sub_2638B93F0(a1, v13, (uint64_t)__p);
      if (SHIBYTE(v25) < 0) {
        operator delete(__p[0]);
      }
      ++v11;
    }
    while (v11 != v12);
  }
}

void sub_2638B2E98(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_2638B2EBC(uint64_t a1, uint64_t **a2, long long *a3, unsigned int a4, int a5)
{
  long long v26 = *a3;
  uint64_t v27 = *((void *)a3 + 2);
  __n128 v10 = sub_2638B1DB4(a1, (MetadataHandle *)&v26, a4);
  uint64_t v11 = *a2;
  uint64_t v12 = a2[1];
  if (*a2 != v12)
  {
    unint64_t v13 = v10;
    long long v14 = 0;
    do
    {
      uint64_t v15 = *v11;
      __p[0] = 0;
      __p[1] = 0;
      uint64_t v25 = 0;
      if (a5 == 11)
      {
        long long v20 = *a3;
        uint64_t v21 = *((void *)a3 + 2);
        sub_2638B1E38(a1, (MetadataHandle *)&v20, a4, v15, &v22);
        if (SHIBYTE(v25) < 0) {
          operator delete(__p[0]);
        }
        *(_OWORD *)std::string __p = v22;
        uint64_t v25 = v23;
      }
      else if (a5 == 12)
      {
        uint64_t v16 = sub_2638B9488(a1, v15 != 0);
        MEMORY[0x263E6D240](__p, v16);
      }
      __n128 v17 = (void *)HIBYTE(v25);
      if (v25 < 0) {
        __n128 v17 = __p[1];
      }
      if (!v17)
      {
        if (!v14)
        {
          long long v18 = *a3;
          uint64_t v19 = *((void *)a3 + 2);
          long long v14 = sub_2638B27BC(a1, (MetadataHandle *)&v18, a4);
        }
        ((void (*)(long long *__return_ptr, uint64_t, uint64_t))v14)(&v22, a1, v15);
        if (SHIBYTE(v25) < 0) {
          operator delete(__p[0]);
        }
        *(_OWORD *)std::string __p = v22;
        uint64_t v25 = v23;
      }
      sub_2638B93F0(a1, v13, (uint64_t)__p);
      if (SHIBYTE(v25) < 0) {
        operator delete(__p[0]);
      }
      ++v11;
    }
    while (v11 != v12);
  }
}

void sub_2638B3064(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_2638B3088(uint64_t a1, int **a2, long long *a3, unsigned int a4, int a5)
{
  long long v26 = *a3;
  uint64_t v27 = *((void *)a3 + 2);
  __n128 v10 = sub_2638B1DB4(a1, (MetadataHandle *)&v26, a4);
  uint64_t v11 = *a2;
  uint64_t v12 = a2[1];
  if (*a2 != v12)
  {
    unint64_t v13 = v10;
    long long v14 = 0;
    do
    {
      uint64_t v15 = *v11;
      __p[0] = 0;
      __p[1] = 0;
      uint64_t v25 = 0;
      if (a5 == 11)
      {
        long long v20 = *a3;
        uint64_t v21 = *((void *)a3 + 2);
        sub_2638B1E38(a1, (MetadataHandle *)&v20, a4, v15, &v22);
        if (SHIBYTE(v25) < 0) {
          operator delete(__p[0]);
        }
        *(_OWORD *)std::string __p = v22;
        uint64_t v25 = v23;
      }
      else if (a5 == 12)
      {
        uint64_t v16 = sub_2638B9488(a1, v15 != 0);
        MEMORY[0x263E6D240](__p, v16);
      }
      __n128 v17 = (void *)HIBYTE(v25);
      if (v25 < 0) {
        __n128 v17 = __p[1];
      }
      if (!v17)
      {
        if (!v14)
        {
          long long v18 = *a3;
          uint64_t v19 = *((void *)a3 + 2);
          long long v14 = sub_2638B2970(a1, (MetadataHandle *)&v18, a4);
        }
        ((void (*)(long long *__return_ptr, uint64_t, uint64_t))v14)(&v22, a1, v15);
        if (SHIBYTE(v25) < 0) {
          operator delete(__p[0]);
        }
        *(_OWORD *)std::string __p = v22;
        uint64_t v25 = v23;
      }
      sub_2638B93F0(a1, v13, (uint64_t)__p);
      if (SHIBYTE(v25) < 0) {
        operator delete(__p[0]);
      }
      ++v11;
    }
    while (v11 != v12);
  }
}

void sub_2638B3230(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_2638B3254(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, __n128 *a2, uint64_t *a3)
{
  unsigned int v6 = (unsigned __int8 *)*((void *)this + 1);
  if ((unint64_t)v6 >= *((void *)this + 2) || (char)*v6 < 0)
  {
    unint64_t TagFallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(this);
    *((_DWORD *)this + 8) = TagFallback;
    if (TagFallback) {
      goto LABEL_4;
    }
LABEL_10:
    if (*((unsigned char *)this + 36)) {
      return;
    }
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x263E6D1C0](exception, "Parsing failed in metric");
    goto LABEL_199;
  }
  unint64_t TagFallback = *v6;
  *((_DWORD *)this + 8) = TagFallback;
  *((void *)this + 1) = v6 + 1;
  if (!TagFallback) {
    goto LABEL_10;
  }
LABEL_4:
  unint64_t v8 = wis::reflect::decodeTag((wis::reflect *)TagFallback);
  unint64_t v9 = HIDWORD(v8);
  unsigned __int8 v10 = v8;
  __n128 v104 = *a2;
  unint64_t v105 = a2[1].n128_u64[0];
  DeviceConfigMetadataHelper::getSubfieldType((uint64_t)(a3 + 1), &v104, HIDWORD(v8), (__n128 *)&v106);
  long long v102 = v106;
  uint64_t v103 = v107;
  uint64_t BuiltinType = MetadataHelper::getBuiltinType((uint64_t)(a3 + 1), (MetadataHandle *)&v102);
  int v12 = BuiltinType;
  uint64_t DecodingType = wis::reflect::getDecodingType(BuiltinType, v10);
  switch((int)DecodingType)
  {
    case 0:
      switch(v10)
      {
        case 0u:
          *(void *)unint64_t v119 = 0;
          if (sub_2638A7CF4(this, (unint64_t *)v119)) {
            goto LABEL_178;
          }
          goto LABEL_151;
        case 1u:
          *(void *)unint64_t v119 = 0;
          if (wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(this, (unint64_t *)v119))goto LABEL_151; {
LABEL_178:
          }
          uint64_t v72 = *(char ***)v119;
          goto LABEL_181;
        case 2u:
          v115[0] = 0;
          if ((sub_2638A7D24(this, v115) & 1) == 0) {
            goto LABEL_151;
          }
          sub_2638AA7BC(v119, v115[0]);
          char Raw = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadRaw(this, *(void **)v119);
          if (Raw) {
            sub_2638B4D84(a3, *(unsigned char **)v119, *(void *)&v119[2] - *(void *)v119, v9);
          }
          goto LABEL_169;
        case 5u:
          v119[0] = 0;
          if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(this, v119))goto LABEL_151; {
          uint64_t v72 = (char **)v119[0];
          }
LABEL_181:
          sub_2638B4CC8(a3, v72, v9);
          break;
        default:
          goto LABEL_151;
      }
      return;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
      unint64_t v117 = 0;
      switch(v10)
      {
        case 0u:
          long long v14 = (char *)*((void *)this + 1);
          if ((unint64_t)v14 < *((void *)this + 2) && (*v14 & 0x80000000) == 0)
          {
            unint64_t v117 = *v14;
            *((void *)this + 1) = v14 + 1;
LABEL_84:
            unint64_t v42 = v117;
            switch(v12)
            {
              case 1:
              case 15:
                double v47 = wis::protobuf::NumberConverter<(wis::reflect::Type)1>::decode(v117);
                __n128 v110 = *a2;
                unint64_t v111 = a2[1].n128_u64[0];
                *(__n128 *)unint64_t v119 = *a2;
                unint64_t v120 = a2[1].n128_u64[0];
                unsigned int v44 = v9;
                unint64_t v45 = sub_2638B5620((uint64_t)a3, (MetadataHandle *)v119, v9);
                float v46 = (char ***)&v108.n128_u64[1];
                v108.n128_u8[0] = 7;
                v108.n128_f64[1] = v47;
                if (v12 == 11)
                {
                  *(__n128 *)unint64_t v113 = v110;
                  unint64_t v114 = v111;
                  sub_2638B56A4((uint64_t)a3, (MetadataHandle *)v113, v44, (unint64_t)v47, v115);
                  uint64_t v78 = HIBYTE(v116);
                  char v79 = HIBYTE(v116);
                  if (v116 < 0) {
                    uint64_t v78 = *(void *)&v115[2];
                  }
                  if (v78)
                  {
                    uint64_t v80 = operator new(0x18uLL);
                    *(_OWORD *)uint64_t v80 = *(_OWORD *)v115;
                    v80[2] = v116;
                    int64_t v116 = 0;
                    memset(v115, 0, sizeof(v115));
                    int v81 = v108.n128_u8[0];
                    v108.n128_u8[0] = 3;
                    LOBYTE(__p) = v81;
                    uint64_t v82 = (char **)v108.n128_u64[1];
                    v108.n128_u64[1] = (unint64_t)v80;
                    char v97 = v82;
                    sub_2638A5C4C(&v97, v81);
                    char v79 = HIBYTE(v116);
                  }
                  if (v79 < 0) {
                    operator delete(*(void **)v115);
                  }
                }
                else if (v12 == 12)
                {
                  v108.n128_u8[0] = 4;
                  LOBYTE(v113[0]) = 7;
                  v108.n128_u64[1] = v47 != 0.0;
                  *(double *)&v113[2] = v47;
                  sub_2638A5C4C((char ***)&v113[2], 7);
                }
                goto LABEL_195;
              case 2:
              case 16:
                float v43 = wis::protobuf::NumberConverter<(wis::reflect::Type)2>::decode(v117);
                __n128 v110 = *a2;
                unint64_t v111 = a2[1].n128_u64[0];
                *(__n128 *)unint64_t v119 = *a2;
                unint64_t v120 = a2[1].n128_u64[0];
                unsigned int v44 = v9;
                unint64_t v45 = sub_2638B5620((uint64_t)a3, (MetadataHandle *)v119, v9);
                float v46 = (char ***)&v108.n128_u64[1];
                v108.n128_u8[0] = 7;
                v108.n128_f64[1] = v43;
                if (v12 == 11)
                {
                  *(__n128 *)unint64_t v113 = v110;
                  unint64_t v114 = v111;
                  sub_2638B56A4((uint64_t)a3, (MetadataHandle *)v113, v44, (unint64_t)v43, v115);
                  uint64_t v73 = HIBYTE(v116);
                  char v74 = HIBYTE(v116);
                  if (v116 < 0) {
                    uint64_t v73 = *(void *)&v115[2];
                  }
                  if (v73)
                  {
                    xpc_object_t v75 = operator new(0x18uLL);
                    *(_OWORD *)xpc_object_t v75 = *(_OWORD *)v115;
                    v75[2] = v116;
                    int64_t v116 = 0;
                    memset(v115, 0, sizeof(v115));
                    int v76 = v108.n128_u8[0];
                    v108.n128_u8[0] = 3;
                    LOBYTE(__p) = v76;
                    BOOL v77 = (char **)v108.n128_u64[1];
                    v108.n128_u64[1] = (unint64_t)v75;
                    char v97 = v77;
                    sub_2638A5C4C(&v97, v76);
                    char v74 = HIBYTE(v116);
                  }
                  if (v74 < 0) {
                    operator delete(*(void **)v115);
                  }
                }
                else if (v12 == 12)
                {
                  v108.n128_u8[0] = 4;
                  LOBYTE(v113[0]) = 7;
                  v108.n128_u64[1] = v43 != 0.0;
                  *(double *)&v113[2] = v43;
                  sub_2638A5C4C((char ***)&v113[2], 7);
                }
LABEL_195:
                *(__n128 *)unint64_t v115 = v110;
                int64_t v116 = v111;
                int v83 = sub_2638B5794((uint64_t)a3, (MetadataHandle *)v115, v44);
                sub_2638BEEB0(a3, v45, (uint64_t)&v108, v83);
                int v52 = v108.n128_u8[0];
                goto LABEL_196;
              case 3:
              case 11:
              case 17:
              case 25:
                goto LABEL_95;
              case 4:
              case 10:
              case 18:
              case 24:
                *(void *)unint64_t v115 = v117;
                *(__n128 *)unint64_t v119 = *a2;
                unint64_t v120 = a2[1].n128_u64[0];
                sub_2638B4EB0(a3, (char ***)v115, (long long *)v119, v9, v12);
                return;
              case 5:
              case 19:
                unint64_t v42 = wis::protobuf::NumberConverter<(wis::reflect::Type)5>::decode(v117);
LABEL_95:
                *(void *)unint64_t v115 = v42;
                *(__n128 *)unint64_t v119 = *a2;
                unint64_t v120 = a2[1].n128_u64[0];
                sub_2638B5268(a3, (char ***)v115, (long long *)v119, v9, v12);
                return;
              case 6:
              case 20:
                v115[0] = v117;
                goto LABEL_97;
              case 7:
              case 9:
              case 21:
              case 23:
                v115[0] = v117;
                *(__n128 *)unint64_t v119 = *a2;
                unint64_t v120 = a2[1].n128_u64[0];
                sub_2638B508C(a3, v115, (long long *)v119, v9, v12);
                return;
              case 8:
              case 22:
                v115[0] = wis::protobuf::NumberConverter<(wis::reflect::Type)8>::decode(v117);
LABEL_97:
                *(__n128 *)unint64_t v119 = *a2;
                unint64_t v120 = a2[1].n128_u64[0];
                sub_2638B5444(a3, (int *)v115, (long long *)v119, v9, v12);
                return;
              case 12:
              case 26:
                BOOL v48 = v117 != 0;
                *(__n128 *)unint64_t v113 = *a2;
                unint64_t v114 = a2[1].n128_u64[0];
                *(__n128 *)unint64_t v119 = *a2;
                unint64_t v120 = a2[1].n128_u64[0];
                unsigned int v49 = v9;
                unint64_t v50 = sub_2638B5620((uint64_t)a3, (MetadataHandle *)v119, v9);
                float v46 = (char ***)&v110.n128_u64[1];
                v110.n128_u8[0] = 4;
                v110.n128_u64[1] = v48;
                if (v12 == 12)
                {
                  v108.n128_u8[0] = 4;
                  v108.n128_u64[1] = v48;
                  sub_2638A5C4C((char ***)&v108.n128_u64[1], 4);
                }
                *(_OWORD *)unint64_t v115 = *(_OWORD *)v113;
                int64_t v116 = v114;
                int v51 = sub_2638B5794((uint64_t)a3, (MetadataHandle *)v115, v49);
                sub_2638BEEB0(a3, v50, (uint64_t)&v110, v51);
                int v52 = v110.n128_u8[0];
LABEL_196:
                sub_2638A5C4C(v46, v52);
                return;
              default:
                exception = __cxa_allocate_exception(0x10uLL);
                MEMORY[0x263E6D1C0](exception, "This should never happen, no matter what the input!");
                goto LABEL_199;
            }
          }
          if (wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(this, &v117)) {
            goto LABEL_84;
          }
          if (v9 || !*((unsigned char *)this + 36)) {
            goto LABEL_103;
          }
          return;
        case 1u:
          if (wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(this, &v117)) {
            goto LABEL_84;
          }
          if (v9 || !*((unsigned char *)this + 36)) {
            goto LABEL_103;
          }
          return;
        case 2u:
          if (v9 || !*((unsigned char *)this + 36)) {
            goto LABEL_103;
          }
          return;
        case 5u:
          v119[0] = 0;
          if (wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(this, v119))
          {
            unint64_t v117 = v119[0];
            goto LABEL_84;
          }
          if (!v9 && *((unsigned char *)this + 36)) {
            return;
          }
LABEL_103:
          exception = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x263E6D1C0](exception, "Parsing failed in metric");
          break;
        default:
          goto LABEL_84;
      }
      goto LABEL_199;
    case 13:
      v115[0] = 0;
      double v38 = (char *)*((void *)this + 1);
      if ((unint64_t)v38 >= *((void *)this + 2) || *v38 < 0)
      {
        if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, v115))goto LABEL_151; {
      }
        }
      else
      {
        v115[0] = *v38;
        *((void *)this + 1) = v38 + 1;
      }
      memset(v119, 0, sizeof(v119));
      unint64_t v120 = 0;
      char Raw = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadString();
      if (Raw)
      {
        __n128 v94 = *a2;
        unint64_t v95 = a2[1].n128_u64[0];
        sub_2638B4940(a3, (uint64_t)v119, (long long *)&v94, v9);
      }
      if ((SHIBYTE(v120) & 0x80000000) == 0) {
        goto LABEL_172;
      }
      int v68 = *(void **)v119;
      goto LABEL_171;
    case 14:
      v115[0] = 0;
      uint64_t v40 = (char *)*((void *)this + 1);
      if ((unint64_t)v40 >= *((void *)this + 2) || *v40 < 0)
      {
        if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, v115))goto LABEL_151; {
        unsigned int v41 = v115[0];
        }
      }
      else
      {
        unsigned int v41 = *v40;
        v115[0] = v41;
        *((void *)this + 1) = v40 + 1;
      }
      sub_2638AA7BC(v119, v41);
      char Raw = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadRaw(this, *(void **)v119);
      if (Raw)
      {
        __n128 v92 = *a2;
        unint64_t v93 = a2[1].n128_u64[0];
        sub_2638B4A30(a3, (uint64_t)v119, (long long *)&v92, v9);
      }
LABEL_169:
      int v68 = *(void **)v119;
      if (*(void *)v119)
      {
        *(void *)&v119[2] = *(void *)v119;
LABEL_171:
        operator delete(v68);
      }
LABEL_172:
      if (Raw) {
        return;
      }
      goto LABEL_151;
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
      unsigned int v101 = 0;
      uint64_t v16 = (unsigned __int8 *)*((void *)this + 1);
      if ((unint64_t)v16 >= *((void *)this + 2) || (char)*v16 < 0)
      {
        if (wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, &v101)) {
          goto LABEL_16;
        }
LABEL_151:
        if (!v9 && *((unsigned char *)this + 36)) {
          return;
        }
        exception = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x263E6D1C0](exception, "Parsing failed in metric");
LABEL_199:
        __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
      }
      unsigned int v101 = *v16;
      *((void *)this + 1) = v16 + 1;
LABEL_16:
      double v85 = a3;
      unsigned int v87 = v9;
      int UnpackedType = wis::reflect::getUnpackedType(DecodingType);
      int WireTypeForType = wis::reflect::getWireTypeForType(UnpackedType);
      unsigned int v99 = this;
      int v100 = wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(this);
      std::string __p = 0;
      char v97 = 0;
      unint64_t v98 = 0;
      while (1)
      {
        int v18 = wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(this);
        if (v18 < 1) {
          break;
        }
        uint64_t v19 = v97;
        if ((unint64_t)v97 >= v98)
        {
          uint64_t v21 = (char **)__p;
          int64_t v22 = ((char *)v97 - (unsigned char *)__p) >> 3;
          unint64_t v23 = v22 + 1;
          if ((unint64_t)(v22 + 1) >> 61) {
            sub_2638A2514();
          }
          uint64_t v24 = v98 - (void)__p;
          if ((uint64_t)(v98 - (void)__p) >> 2 > v23) {
            unint64_t v23 = v24 >> 2;
          }
          if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v25 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v25 = v23;
          }
          if (v25)
          {
            long long v26 = (char *)sub_26389E00C((uint64_t)&v98, v25);
            uint64_t v21 = (char **)__p;
            uint64_t v19 = v97;
          }
          else
          {
            long long v26 = 0;
          }
          uint64_t v27 = (char **)&v26[8 * v22];
          *uint64_t v27 = 0;
          long long v20 = v27 + 1;
          while (v19 != v21)
          {
            uint64_t v28 = *--v19;
            *--uint64_t v27 = v28;
          }
          std::string __p = v27;
          char v97 = v20;
          unint64_t v98 = (unint64_t)&v26[8 * v25];
          if (v21) {
            operator delete(v21);
          }
        }
        else
        {
          *char v97 = 0;
          long long v20 = v19 + 1;
        }
        char v97 = v20;
        switch(WireTypeForType)
        {
          case 0:
            unint64_t v29 = (unint64_t *)(v20 - 1);
            long long v30 = (char *)*((void *)this + 1);
            if ((unint64_t)v30 >= *((void *)this + 2) || *v30 < 0)
            {
              char Varint64Fallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(this, v29);
LABEL_42:
              if ((Varint64Fallback & 1) == 0) {
                goto LABEL_148;
              }
            }
            else
            {
              unint64_t *v29 = *v30;
              *((void *)this + 1) = v30 + 1;
            }
            break;
          case 1:
            char Varint64Fallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(this, (unint64_t *)v20 - 1);
            goto LABEL_42;
          case 2:
            goto LABEL_148;
          case 5:
            v119[0] = 0;
            char LittleEndian32Fallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(this, v119);
            *(v97 - 1) = (char *)v119[0];
            if ((LittleEndian32Fallback & 1) == 0) {
              goto LABEL_148;
            }
            continue;
          default:
            continue;
        }
      }
      switch((int)DecodingType)
      {
        case 15:
          sub_2638A9784((uint64_t *)&__p, &v110);
          __n128 v108 = *a2;
          unint64_t v109 = a2[1].n128_u64[0];
          *(__n128 *)unint64_t v119 = *a2;
          unint64_t v120 = a2[1].n128_u64[0];
          unint64_t v33 = sub_2638B5620((uint64_t)v85, (MetadataHandle *)v119, v87);
          int v118 = 0;
          LOBYTE(v117) = 2;
          *(void *)unint64_t v115 = 0;
          *(void *)unint64_t v113 = 0;
          int v118 = (char **)sub_2638AC1C4((uint64_t *)v115, (uint64_t *)v113);
          xpc_object_t v35 = (double *)v110.n128_u64[1];
          for (int i = (double *)v110.n128_u64[0]; i != v35; ++i)
          {
            double v36 = *i;
            double v112 = *i;
            if (UnpackedType == 11)
            {
              *(__n128 *)unint64_t v113 = v108;
              unint64_t v114 = v109;
              sub_2638B56A4((uint64_t)v85, (MetadataHandle *)v113, v87, (unint64_t)v36, v115);
              uint64_t v37 = HIBYTE(v116);
              if (v116 < 0) {
                uint64_t v37 = *(void *)&v115[2];
              }
              if (v37) {
                sub_2638AE784((uint64_t)&v117, (uint64_t)v115);
              }
              else {
                sub_2638AEDC8((uint64_t)&v117, (uint64_t *)&v112);
              }
              if (SHIBYTE(v116) < 0) {
                operator delete(*(void **)v115);
              }
            }
            else if (UnpackedType == 12)
            {
              LOBYTE(v115[0]) = v36 != 0.0;
              sub_2638AE620((uint64_t)&v117, (unsigned __int8 *)v115);
            }
            else
            {
              sub_2638AEDC8((uint64_t)&v117, (uint64_t *)&v112);
            }
          }
          goto LABEL_154;
        case 16:
          sub_2638A9A5C((uint64_t *)&__p, &v110);
          __n128 v108 = *a2;
          unint64_t v109 = a2[1].n128_u64[0];
          *(__n128 *)unint64_t v119 = *a2;
          unint64_t v120 = a2[1].n128_u64[0];
          unint64_t v33 = sub_2638B5620((uint64_t)v85, (MetadataHandle *)v119, v87);
          int v118 = 0;
          LOBYTE(v117) = 2;
          *(void *)unint64_t v115 = 0;
          *(void *)unint64_t v113 = 0;
          int v118 = (char **)sub_2638AC1C4((uint64_t *)v115, (uint64_t *)v113);
          uint64_t v63 = (float *)v110.n128_u64[1];
          for (j = (float *)v110.n128_u64[0]; j != v63; ++j)
          {
            float v64 = *j;
            *(float *)&double v112 = *j;
            if (UnpackedType == 11)
            {
              *(__n128 *)unint64_t v113 = v108;
              unint64_t v114 = v109;
              sub_2638B56A4((uint64_t)v85, (MetadataHandle *)v113, v87, (unint64_t)v64, v115);
              uint64_t v65 = HIBYTE(v116);
              if (v116 < 0) {
                uint64_t v65 = *(void *)&v115[2];
              }
              if (v65) {
                sub_2638AE784((uint64_t)&v117, (uint64_t)v115);
              }
              else {
                sub_2638AF2A8((uint64_t)&v117, (float *)&v112);
              }
              if (SHIBYTE(v116) < 0) {
                operator delete(*(void **)v115);
              }
            }
            else if (UnpackedType == 12)
            {
              LOBYTE(v115[0]) = v64 != 0.0;
              sub_2638AE620((uint64_t)&v117, (unsigned __int8 *)v115);
            }
            else
            {
              sub_2638AF2A8((uint64_t)&v117, (float *)&v112);
            }
          }
LABEL_154:
          *(__n128 *)unint64_t v115 = v108;
          int64_t v116 = v109;
          int v66 = sub_2638B5794((uint64_t)v85, (MetadataHandle *)v115, v87);
          sub_2638BEEB0(v85, v33, (uint64_t)&v117, v66);
          sub_2638A5C4C(&v118, v117);
          uint64_t v61 = (void *)v110.n128_u64[0];
          if (!v110.n128_u64[0]) {
            break;
          }
          v110.n128_u64[1] = v110.n128_u64[0];
          goto LABEL_147;
        case 17:
        case 25:
          sub_2638A9700((uint64_t *)&__p, v119);
          *(__n128 *)unint64_t v115 = *a2;
          int64_t v116 = a2[1].n128_i64[0];
          sub_2638B5BAC(v85, (uint64_t **)v119, (long long *)v115, v87, UnpackedType);
          goto LABEL_145;
        case 18:
        case 24:
          sub_2638A9700((uint64_t *)&__p, v119);
          *(__n128 *)unint64_t v115 = *a2;
          int64_t v116 = a2[1].n128_i64[0];
          sub_2638B5814(v85, (uint64_t **)v119, (long long *)v115, v87, UnpackedType);
          goto LABEL_145;
        case 19:
          sub_2638A9D34((uint64_t *)&__p, v119);
          *(__n128 *)unint64_t v115 = *a2;
          int64_t v116 = a2[1].n128_i64[0];
          sub_2638B5BAC(v85, (uint64_t **)v119, (long long *)v115, v87, UnpackedType);
          goto LABEL_145;
        case 20:
          sub_2638A99D8((uint64_t *)&__p, v119);
          *(__n128 *)unint64_t v115 = *a2;
          int64_t v116 = a2[1].n128_i64[0];
          sub_2638B5D78(v85, (int **)v119, (long long *)v115, v87, UnpackedType);
          goto LABEL_145;
        case 21:
        case 23:
          sub_2638A99D8((uint64_t *)&__p, v119);
          *(__n128 *)unint64_t v115 = *a2;
          int64_t v116 = a2[1].n128_i64[0];
          sub_2638B59E0(v85, (unsigned int **)v119, (long long *)v115, v87, UnpackedType);
          goto LABEL_145;
        case 22:
          sub_2638A9F88((uint64_t *)&__p, v119);
          *(__n128 *)unint64_t v115 = *a2;
          int64_t v116 = a2[1].n128_i64[0];
          sub_2638B5D78(v85, (int **)v119, (long long *)v115, v87, UnpackedType);
LABEL_145:
          uint64_t v61 = *(void **)v119;
          if (!*(void *)v119) {
            break;
          }
          *(void *)&v119[2] = *(void *)v119;
LABEL_147:
          operator delete(v61);
          break;
        case 26:
          sub_2638A9AE4((uint64_t)&__p, &v110);
          __n128 v108 = *a2;
          unint64_t v109 = a2[1].n128_u64[0];
          *(__n128 *)unint64_t v119 = *a2;
          unint64_t v120 = a2[1].n128_u64[0];
          uint64_t v53 = sub_2638B5620((uint64_t)v85, (MetadataHandle *)v119, v87);
          int v118 = 0;
          LOBYTE(v117) = 2;
          *(void *)unint64_t v115 = 0;
          *(void *)unint64_t v113 = 0;
          int v118 = (char **)sub_2638AC1C4((uint64_t *)v115, (uint64_t *)v113);
          uint64_t v54 = (void *)v110.n128_u64[0];
          int v55 = v110.n128_u8[8] & 0x3F;
          if (v110.n128_u64[1] > 0x3F || (v110.n128_u8[8] & 0x3F) != 0)
          {
            int v56 = 0;
            int v57 = (void *)(v110.n128_u64[0] + 8 * (v110.n128_u64[1] >> 6));
            do
            {
              uint64_t v58 = *v54 & (1 << v56);
              LOBYTE(v112) = v58 != 0;
              if (UnpackedType == 11)
              {
                *(__n128 *)unint64_t v113 = v108;
                unint64_t v114 = v109;
                sub_2638B56A4((uint64_t)v85, (MetadataHandle *)v113, v87, v58 != 0, v115);
                uint64_t v59 = HIBYTE(v116);
                if (v116 < 0) {
                  uint64_t v59 = *(void *)&v115[2];
                }
                if (v59) {
                  sub_2638AE784((uint64_t)&v117, (uint64_t)v115);
                }
                else {
                  sub_2638AF520((uint64_t)&v117, (unsigned __int8 *)&v112);
                }
                if (SHIBYTE(v116) < 0) {
                  operator delete(*(void **)v115);
                }
              }
              else if (UnpackedType == 12)
              {
                LOBYTE(v115[0]) = v58 != 0;
                sub_2638AE620((uint64_t)&v117, (unsigned __int8 *)v115);
              }
              else
              {
                sub_2638AF520((uint64_t)&v117, (unsigned __int8 *)&v112);
              }
              v54 += v56 == 63;
              if (v56 == 63) {
                int v56 = 0;
              }
              else {
                ++v56;
              }
            }
            while (v54 != v57 || v56 != v55);
          }
          *(__n128 *)unint64_t v115 = v108;
          int64_t v116 = v109;
          int v60 = sub_2638B5794((uint64_t)v85, (MetadataHandle *)v115, v87);
          sub_2638BEEB0(v85, v53, (uint64_t)&v117, v60);
          sub_2638A5C4C(&v118, v117);
          uint64_t v61 = (void *)v110.n128_u64[0];
          if (!v110.n128_u64[0]) {
            break;
          }
          goto LABEL_147;
        default:
          uint64_t v84 = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x263E6D1C0](v84, "This should never happen, no matter what the input!");
          __cxa_throw(v84, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
      }
LABEL_148:
      if (__p)
      {
        char v97 = (char **)__p;
        operator delete(__p);
      }
      wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(v99);
      LODWORD(v9) = v87;
      if (v18 > 0) {
        goto LABEL_151;
      }
      return;
    case 27:
      v113[0] = 0;
      uint64_t v39 = (char *)*((void *)this + 1);
      if ((unint64_t)v39 >= *((void *)this + 2) || *v39 < 0)
      {
        if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, v113))goto LABEL_151; {
      }
        }
      else
      {
        v113[0] = *v39;
        *((void *)this + 1) = v39 + 1;
      }
      *(void *)unint64_t v119 = this;
      v119[2] = wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(this);
      ++*((_DWORD *)this + 14);
      *(void *)unint64_t v115 = this;
      __n128 v90 = *a2;
      unint64_t v91 = a2[1].n128_u64[0];
      long long v88 = v106;
      uint64_t v89 = v107;
      sub_2638B4B5C(a3, this, (long long *)&v90, v9, &v88);
      sub_2638B4C8C((wireless_diagnostics::google::protobuf::io::CodedInputStream **)v115);
      int v69 = *((_DWORD *)this + 14);
      BOOL v70 = __OFSUB__(v69, 1);
      int v71 = v69 - 1;
      if (v71 < 0 == v70) {
        *((_DWORD *)this + 14) = v71;
      }
      sub_2638A2140((wireless_diagnostics::google::protobuf::io::CodedInputStream **)v119);
      return;
    default:
      goto LABEL_151;
  }
}

void sub_2638B45C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,unsigned __int8 a45)
{
  if (v45 < 0) {
    operator delete(*(void **)(v47 - 192));
  }
  sub_2638A5C4C(v46, a45);
  _Unwind_Resume(a1);
}

uint64_t sub_2638B4904(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 56);
  if (v2) {
    sub_26389F6D4(v2);
  }
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 16);
  if (v3) {
    sub_26389F6D4(v3);
  }
  return a1;
}

void sub_2638B4940(uint64_t *a1, uint64_t a2, long long *a3, unsigned int a4)
{
  long long v15 = *a3;
  uint64_t v16 = *((void *)a3 + 2);
  unint64_t v8 = sub_2638B5620((uint64_t)a1, (MetadataHandle *)&v15, a4);
  v13[0] = 3;
  unint64_t v9 = (char **)operator new(0x18uLL);
  *(_OWORD *)unint64_t v9 = *(_OWORD *)a2;
  v9[2] = *(char **)(a2 + 16);
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  long long v14 = v9;
  long long v11 = *a3;
  uint64_t v12 = *((void *)a3 + 2);
  int v10 = sub_2638B5794((uint64_t)a1, (MetadataHandle *)&v11, a4);
  sub_2638BEEB0(a1, v8, (uint64_t)v13, v10);
  sub_2638A5C4C(&v14, v13[0]);
}

void sub_2638B4A18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, unsigned __int8 a13)
{
  sub_2638A5C4C(v13, a13);
  _Unwind_Resume(a1);
}

void sub_2638B4A30(uint64_t *a1, uint64_t a2, long long *a3, unsigned int a4)
{
  long long v16 = *a3;
  uint64_t v17 = *((void *)a3 + 2);
  unint64_t v8 = sub_2638B5620((uint64_t)a1, (MetadataHandle *)&v16, a4);
  sub_2638B9730(*(void *)(a2 + 8) - *(void *)a2, *(unsigned char **)a2, &__p);
  long long v15 = 0;
  v14[0] = 3;
  unint64_t v9 = (char **)operator new(0x18uLL);
  *(std::string *)unint64_t v9 = __p;
  long long v15 = v9;
  long long v11 = *a3;
  uint64_t v12 = *((void *)a3 + 2);
  memset(&__p, 0, sizeof(__p));
  int v10 = sub_2638B5794((uint64_t)a1, (MetadataHandle *)&v11, a4);
  sub_2638BEEB0(a1, v8, (uint64_t)v14, v10);
  sub_2638A5C4C(&v15, v14[0]);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_2638B4B2C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, char a18)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_2638B4B5C(uint64_t *a1, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2, long long *a3, unsigned int a4, long long *a5)
{
  long long v19 = *a3;
  uint64_t v20 = *((void *)a3 + 2);
  int v10 = sub_2638B5620((uint64_t)a1, (MetadataHandle *)&v19, a4);
  uint64_t v11 = *a1;
  sub_2638ABF5C((uint64_t)v17, 0, 0, 0, 1);
  *a1 = (uint64_t)v17;
  while ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(a2) >= 1)
  {
    long long v15 = *a5;
    uint64_t v16 = *((void *)a5 + 2);
    sub_2638B3254(a2);
  }
  *a1 = v11;
  long long v13 = *a3;
  uint64_t v14 = *((void *)a3 + 2);
  int v12 = sub_2638B5794((uint64_t)a1, (MetadataHandle *)&v13, a4);
  sub_2638BEEB0(a1, v10, (uint64_t)v17, v12);
  sub_2638A5C4C(&v18, v17[0]);
}

void sub_2638B4C6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unsigned __int8 a10, ...)
{
  va_start(va, a10);
  sub_2638A5C4C((char ***)va, a10);
  _Unwind_Resume(a1);
}

wireless_diagnostics::google::protobuf::io::CodedInputStream **sub_2638B4C8C(wireless_diagnostics::google::protobuf::io::CodedInputStream **a1)
{
  return a1;
}

void sub_2638B4CC8(uint64_t *a1, char **a2, unsigned int __val)
{
  std::to_string(&v8, __val);
  if ((v8.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    unint64_t v5 = &v8;
  }
  else {
    unint64_t v5 = (std::string *)v8.__r_.__value_.__r.__words[0];
  }
  v6[0] = 6;
  uint64_t v7 = a2;
  sub_2638BEEB0(a1, (char *)v5, (uint64_t)v6, 1);
  sub_2638A5C4C(&v7, v6[0]);
  if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v8.__r_.__value_.__l.__data_);
  }
}

void sub_2638B4D5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, unsigned __int8 a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  sub_2638A5C4C(v17, a10);
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_2638B4D84(uint64_t *a1, unsigned char *a2, unint64_t a3, unsigned int __val)
{
  uint64_t v7 = &v12;
  std::to_string(&v12, __val);
  if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    uint64_t v7 = (std::string *)v12.__r_.__value_.__r.__words[0];
  }
  sub_2638B9730(a3, a2, &__p);
  uint64_t v11 = 0;
  v10[0] = 3;
  std::string v8 = (char **)operator new(0x18uLL);
  *(std::string *)std::string v8 = __p;
  memset(&__p, 0, sizeof(__p));
  uint64_t v11 = v8;
  sub_2638BEEB0(a1, (char *)v7, (uint64_t)v10, 1);
  sub_2638A5C4C(&v11, v10[0]);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v12.__r_.__value_.__l.__data_);
  }
}

void sub_2638B4E68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, unsigned __int8 a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  sub_2638A5C4C(v22, a15);
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a22 < 0) {
    operator delete(a17);
  }
  _Unwind_Resume(a1);
}

void sub_2638B4EB0(uint64_t *a1, char ***a2, long long *a3, unsigned int a4, int a5)
{
  long long v30 = *a3;
  uint64_t v31 = *((void *)a3 + 2);
  int v10 = sub_2638B5620((uint64_t)a1, (MetadataHandle *)&v30, a4);
  uint64_t v11 = *a2;
  v28[0] = 6;
  unint64_t v29 = (unint64_t)v11;
  if (a5 == 11)
  {
    long long v22 = *a3;
    uint64_t v23 = *((void *)a3 + 2);
    sub_2638B56A4((uint64_t)a1, (MetadataHandle *)&v22, a4, (uint64_t)v11, __p);
    std::string v12 = (void *)HIBYTE(v25);
    char v13 = HIBYTE(v25);
    if (v25 < 0) {
      std::string v12 = __p[1];
    }
    if (v12)
    {
      uint64_t v14 = operator new(0x18uLL);
      *(_OWORD *)uint64_t v14 = *(_OWORD *)__p;
      v14[2] = v25;
      __p[1] = 0;
      uint64_t v25 = 0;
      __p[0] = 0;
      int v15 = v28[0];
      v28[0] = 3;
      char v20 = v15;
      uint64_t v16 = (char **)v29;
      unint64_t v29 = (unint64_t)v14;
      uint64_t v21 = v16;
      sub_2638A5C4C(&v21, v15);
      char v13 = HIBYTE(v25);
    }
    if (v13 < 0) {
      operator delete(__p[0]);
    }
  }
  else if (a5 == 12)
  {
    v28[0] = 4;
    char v26 = 6;
    unint64_t v29 = v11 != 0;
    uint64_t v27 = v11;
    sub_2638A5C4C(&v27, 6);
  }
  long long v18 = *a3;
  uint64_t v19 = *((void *)a3 + 2);
  int v17 = sub_2638B5794((uint64_t)a1, (MetadataHandle *)&v18, a4);
  sub_2638BEEB0(a1, v10, (uint64_t)v28, v17);
  sub_2638A5C4C((char ***)&v29, v28[0]);
}

void sub_2638B505C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,unsigned __int8 a23)
{
  if (v24 < 0) {
    operator delete(__p);
  }
  sub_2638A5C4C(v23, a23);
  _Unwind_Resume(a1);
}

void sub_2638B508C(uint64_t *a1, unsigned int *a2, long long *a3, unsigned int a4, int a5)
{
  long long v30 = *a3;
  uint64_t v31 = *((void *)a3 + 2);
  int v10 = sub_2638B5620((uint64_t)a1, (MetadataHandle *)&v30, a4);
  uint64_t v11 = *a2;
  v28[0] = 6;
  unint64_t v29 = v11;
  if (a5 == 11)
  {
    long long v22 = *a3;
    uint64_t v23 = *((void *)a3 + 2);
    sub_2638B56A4((uint64_t)a1, (MetadataHandle *)&v22, a4, v11, __p);
    std::string v12 = (void *)HIBYTE(v25);
    char v13 = HIBYTE(v25);
    if (v25 < 0) {
      std::string v12 = __p[1];
    }
    if (v12)
    {
      uint64_t v14 = operator new(0x18uLL);
      *(_OWORD *)uint64_t v14 = *(_OWORD *)__p;
      v14[2] = v25;
      __p[1] = 0;
      uint64_t v25 = 0;
      __p[0] = 0;
      int v15 = v28[0];
      v28[0] = 3;
      char v20 = v15;
      uint64_t v16 = (char **)v29;
      unint64_t v29 = (unint64_t)v14;
      uint64_t v21 = v16;
      sub_2638A5C4C(&v21, v15);
      char v13 = HIBYTE(v25);
    }
    if (v13 < 0) {
      operator delete(__p[0]);
    }
  }
  else if (a5 == 12)
  {
    v28[0] = 4;
    char v26 = 6;
    unint64_t v29 = v11 != 0;
    uint64_t v27 = (char **)v11;
    sub_2638A5C4C(&v27, 6);
  }
  long long v18 = *a3;
  uint64_t v19 = *((void *)a3 + 2);
  int v17 = sub_2638B5794((uint64_t)a1, (MetadataHandle *)&v18, a4);
  sub_2638BEEB0(a1, v10, (uint64_t)v28, v17);
  sub_2638A5C4C((char ***)&v29, v28[0]);
}

void sub_2638B5238(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,unsigned __int8 a23)
{
  if (v24 < 0) {
    operator delete(__p);
  }
  sub_2638A5C4C(v23, a23);
  _Unwind_Resume(a1);
}

void sub_2638B5268(uint64_t *a1, char ***a2, long long *a3, unsigned int a4, int a5)
{
  long long v30 = *a3;
  uint64_t v31 = *((void *)a3 + 2);
  int v10 = sub_2638B5620((uint64_t)a1, (MetadataHandle *)&v30, a4);
  uint64_t v11 = *a2;
  v28[0] = 5;
  unint64_t v29 = (unint64_t)v11;
  if (a5 == 11)
  {
    long long v22 = *a3;
    uint64_t v23 = *((void *)a3 + 2);
    sub_2638B56A4((uint64_t)a1, (MetadataHandle *)&v22, a4, (uint64_t)v11, __p);
    std::string v12 = (void *)HIBYTE(v25);
    char v13 = HIBYTE(v25);
    if (v25 < 0) {
      std::string v12 = __p[1];
    }
    if (v12)
    {
      uint64_t v14 = operator new(0x18uLL);
      *(_OWORD *)uint64_t v14 = *(_OWORD *)__p;
      v14[2] = v25;
      __p[1] = 0;
      uint64_t v25 = 0;
      __p[0] = 0;
      int v15 = v28[0];
      v28[0] = 3;
      char v20 = v15;
      uint64_t v16 = (char **)v29;
      unint64_t v29 = (unint64_t)v14;
      uint64_t v21 = v16;
      sub_2638A5C4C(&v21, v15);
      char v13 = HIBYTE(v25);
    }
    if (v13 < 0) {
      operator delete(__p[0]);
    }
  }
  else if (a5 == 12)
  {
    v28[0] = 4;
    char v26 = 5;
    unint64_t v29 = v11 != 0;
    uint64_t v27 = v11;
    sub_2638A5C4C(&v27, 5);
  }
  long long v18 = *a3;
  uint64_t v19 = *((void *)a3 + 2);
  int v17 = sub_2638B5794((uint64_t)a1, (MetadataHandle *)&v18, a4);
  sub_2638BEEB0(a1, v10, (uint64_t)v28, v17);
  sub_2638A5C4C((char ***)&v29, v28[0]);
}

void sub_2638B5414(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,unsigned __int8 a23)
{
  if (v24 < 0) {
    operator delete(__p);
  }
  sub_2638A5C4C(v23, a23);
  _Unwind_Resume(a1);
}

void sub_2638B5444(uint64_t *a1, int *a2, long long *a3, unsigned int a4, int a5)
{
  long long v30 = *a3;
  uint64_t v31 = *((void *)a3 + 2);
  int v10 = sub_2638B5620((uint64_t)a1, (MetadataHandle *)&v30, a4);
  uint64_t v11 = *a2;
  v28[0] = 5;
  unint64_t v29 = v11;
  if (a5 == 11)
  {
    long long v22 = *a3;
    uint64_t v23 = *((void *)a3 + 2);
    sub_2638B56A4((uint64_t)a1, (MetadataHandle *)&v22, a4, v11, __p);
    std::string v12 = (void *)HIBYTE(v25);
    char v13 = HIBYTE(v25);
    if (v25 < 0) {
      std::string v12 = __p[1];
    }
    if (v12)
    {
      uint64_t v14 = operator new(0x18uLL);
      *(_OWORD *)uint64_t v14 = *(_OWORD *)__p;
      v14[2] = v25;
      __p[1] = 0;
      uint64_t v25 = 0;
      __p[0] = 0;
      int v15 = v28[0];
      v28[0] = 3;
      char v20 = v15;
      uint64_t v16 = (char **)v29;
      unint64_t v29 = (unint64_t)v14;
      uint64_t v21 = v16;
      sub_2638A5C4C(&v21, v15);
      char v13 = HIBYTE(v25);
    }
    if (v13 < 0) {
      operator delete(__p[0]);
    }
  }
  else if (a5 == 12)
  {
    v28[0] = 4;
    char v26 = 5;
    unint64_t v29 = v11 != 0;
    uint64_t v27 = (char **)v11;
    sub_2638A5C4C(&v27, 5);
  }
  long long v18 = *a3;
  uint64_t v19 = *((void *)a3 + 2);
  int v17 = sub_2638B5794((uint64_t)a1, (MetadataHandle *)&v18, a4);
  sub_2638BEEB0(a1, v10, (uint64_t)v28, v17);
  sub_2638A5C4C((char ***)&v29, v28[0]);
}

void sub_2638B55F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,unsigned __int8 a23)
{
  if (v24 < 0) {
    operator delete(__p);
  }
  sub_2638A5C4C(v23, a23);
  _Unwind_Resume(a1);
}

char *sub_2638B5620(uint64_t a1, MetadataHandle *a2, unsigned int a3)
{
  __n128 v6 = *(__n128 *)a2;
  uint64_t v7 = *((void *)a2 + 2);
  DeviceConfigMetadataHelper::getSubfieldType(a1 + 8, &v6, a3, &v8);
  *(__n128 *)a2 = v8;
  *((void *)a2 + 2) = v9;
  uint64_t Field = MetadataHandle::getField(a2);
  if (!Field) {
    return (char *)&unk_2638C8ADA;
  }
  uint64_t result = *(char **)(Field + 8);
  if (!result) {
    return (char *)&unk_2638C8ADA;
  }
  if (result[23] < 0) {
    return *(char **)result;
  }
  return result;
}

void *sub_2638B56A4@<X0>(uint64_t a1@<X0>, MetadataHandle *a2@<X1>, unsigned int a3@<W2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  __n128 v15 = *(__n128 *)a2;
  uint64_t v16 = *((void *)a2 + 2);
  DeviceConfigMetadataHelper::getSubfieldType(a1 + 8, &v15, a3, &v17);
  *(__n128 *)a2 = v17;
  *((void *)a2 + 2) = v18;
  uint64_t result = (void *)MetadataHandle::getEnum(a2);
  if (!result) {
    return sub_2638A5294(a5, (char *)&unk_2638C8ADA);
  }
  uint64_t v9 = (uint64_t *)result[1];
  int v10 = (uint64_t *)result[2];
  if (v9 == v10) {
    return sub_2638A5294(a5, (char *)&unk_2638C8ADA);
  }
  while (1)
  {
    uint64_t v11 = *v9;
    uint64_t v12 = (*(unsigned char *)(*v9 + 32) & 2) != 0 ? 24 : 16;
    if (*(void *)(v11 + v12) == a4) {
      break;
    }
    if (++v9 == v10) {
      return sub_2638A5294(a5, (char *)&unk_2638C8ADA);
    }
  }
  char v13 = *(long long **)(v11 + 8);
  if (*((char *)v13 + 23) < 0) {
    return sub_2638A2398(a5, *(void **)v13, *((void *)v13 + 1));
  }
  long long v14 = *v13;
  a5[2] = *((void *)v13 + 2);
  *(_OWORD *)a5 = v14;
  return result;
}

uint64_t sub_2638B5794(uint64_t a1, MetadataHandle *a2, unsigned int a3)
{
  __n128 v5 = *(__n128 *)a2;
  uint64_t v6 = *((void *)a2 + 2);
  DeviceConfigMetadataHelper::getSubfieldType(a1 + 8, &v5, a3, &v7);
  *(__n128 *)a2 = v7;
  *((void *)a2 + 2) = v8;
  uint64_t result = MetadataHandle::getField(a2);
  if (result) {
    return (*(_WORD *)(result + 52) & 0x400) != 0 && *(unsigned char *)(result + 50) != 0;
  }
  return result;
}

void sub_2638B5814(uint64_t *a1, uint64_t **a2, long long *a3, unsigned int a4, int a5)
{
  long long v25 = *a3;
  uint64_t v26 = *((void *)a3 + 2);
  int v10 = sub_2638B5620((uint64_t)a1, (MetadataHandle *)&v25, a4);
  sub_2638ABF5C((uint64_t)v23, 0, 0, 0, 2);
  uint64_t v12 = *a2;
  uint64_t v11 = a2[1];
  while (v12 != v11)
  {
    uint64_t v13 = *v12;
    uint64_t v22 = *v12;
    if (a5 == 11)
    {
      long long v18 = *a3;
      uint64_t v19 = *((void *)a3 + 2);
      sub_2638B56A4((uint64_t)a1, (MetadataHandle *)&v18, a4, v13, __p);
      unint64_t v14 = v21;
      if ((v21 & 0x80u) != 0) {
        unint64_t v14 = (unint64_t)__p[1];
      }
      if (v14) {
        sub_2638AE784((uint64_t)v23, (uint64_t)__p);
      }
      else {
        sub_2638AE940((uint64_t)v23, &v22);
      }
      if ((char)v21 < 0) {
        operator delete(__p[0]);
      }
    }
    else if (a5 == 12)
    {
      LOBYTE(__p[0]) = v13 != 0;
      sub_2638AE620((uint64_t)v23, (unsigned __int8 *)__p);
    }
    else
    {
      sub_2638AE940((uint64_t)v23, &v22);
    }
    ++v12;
  }
  long long v16 = *a3;
  uint64_t v17 = *((void *)a3 + 2);
  int v15 = sub_2638B5794((uint64_t)a1, (MetadataHandle *)&v16, a4);
  sub_2638BEEB0(a1, v10, (uint64_t)v23, v15);
  sub_2638A5C4C(&v24, v23[0]);
}

void sub_2638B59A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,unsigned __int8 a24,char **a25)
{
}

void sub_2638B59E0(uint64_t *a1, unsigned int **a2, long long *a3, unsigned int a4, int a5)
{
  long long v25 = *a3;
  uint64_t v26 = *((void *)a3 + 2);
  int v10 = sub_2638B5620((uint64_t)a1, (MetadataHandle *)&v25, a4);
  sub_2638ABF5C((uint64_t)v23, 0, 0, 0, 2);
  uint64_t v12 = *a2;
  uint64_t v11 = a2[1];
  while (v12 != v11)
  {
    uint64_t v13 = *v12;
    unsigned int v22 = *v12;
    if (a5 == 11)
    {
      long long v18 = *a3;
      uint64_t v19 = *((void *)a3 + 2);
      sub_2638B56A4((uint64_t)a1, (MetadataHandle *)&v18, a4, v13, __p);
      unint64_t v14 = v21;
      if ((v21 & 0x80u) != 0) {
        unint64_t v14 = (unint64_t)__p[1];
      }
      if (v14) {
        sub_2638AE784((uint64_t)v23, (uint64_t)__p);
      }
      else {
        sub_2638AF038((uint64_t)v23, &v22);
      }
      if ((char)v21 < 0) {
        operator delete(__p[0]);
      }
    }
    else if (a5 == 12)
    {
      LOBYTE(__p[0]) = v13 != 0;
      sub_2638AE620((uint64_t)v23, (unsigned __int8 *)__p);
    }
    else
    {
      sub_2638AF038((uint64_t)v23, &v22);
    }
    ++v12;
  }
  long long v16 = *a3;
  uint64_t v17 = *((void *)a3 + 2);
  int v15 = sub_2638B5794((uint64_t)a1, (MetadataHandle *)&v16, a4);
  sub_2638BEEB0(a1, v10, (uint64_t)v23, v15);
  sub_2638A5C4C(&v24, v23[0]);
}

void sub_2638B5B6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,unsigned __int8 a24,char **a25)
{
}

void sub_2638B5BAC(uint64_t *a1, uint64_t **a2, long long *a3, unsigned int a4, int a5)
{
  long long v25 = *a3;
  uint64_t v26 = *((void *)a3 + 2);
  int v10 = sub_2638B5620((uint64_t)a1, (MetadataHandle *)&v25, a4);
  sub_2638ABF5C((uint64_t)v23, 0, 0, 0, 2);
  uint64_t v12 = *a2;
  uint64_t v11 = a2[1];
  while (v12 != v11)
  {
    uint64_t v13 = *v12;
    uint64_t v22 = *v12;
    if (a5 == 11)
    {
      long long v18 = *a3;
      uint64_t v19 = *((void *)a3 + 2);
      sub_2638B56A4((uint64_t)a1, (MetadataHandle *)&v18, a4, v13, __p);
      unint64_t v14 = v21;
      if ((v21 & 0x80u) != 0) {
        unint64_t v14 = (unint64_t)__p[1];
      }
      if (v14) {
        sub_2638AE784((uint64_t)v23, (uint64_t)__p);
      }
      else {
        sub_2638AF790((uint64_t)v23, &v22);
      }
      if ((char)v21 < 0) {
        operator delete(__p[0]);
      }
    }
    else if (a5 == 12)
    {
      LOBYTE(__p[0]) = v13 != 0;
      sub_2638AE620((uint64_t)v23, (unsigned __int8 *)__p);
    }
    else
    {
      sub_2638AF790((uint64_t)v23, &v22);
    }
    ++v12;
  }
  long long v16 = *a3;
  uint64_t v17 = *((void *)a3 + 2);
  int v15 = sub_2638B5794((uint64_t)a1, (MetadataHandle *)&v16, a4);
  sub_2638BEEB0(a1, v10, (uint64_t)v23, v15);
  sub_2638A5C4C(&v24, v23[0]);
}

void sub_2638B5D38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,unsigned __int8 a24,char **a25)
{
}

void sub_2638B5D78(uint64_t *a1, int **a2, long long *a3, unsigned int a4, int a5)
{
  long long v25 = *a3;
  uint64_t v26 = *((void *)a3 + 2);
  int v10 = sub_2638B5620((uint64_t)a1, (MetadataHandle *)&v25, a4);
  sub_2638ABF5C((uint64_t)v23, 0, 0, 0, 2);
  uint64_t v12 = *a2;
  uint64_t v11 = a2[1];
  while (v12 != v11)
  {
    uint64_t v13 = *v12;
    int v22 = *v12;
    if (a5 == 11)
    {
      long long v18 = *a3;
      uint64_t v19 = *((void *)a3 + 2);
      sub_2638B56A4((uint64_t)a1, (MetadataHandle *)&v18, a4, v13, __p);
      unint64_t v14 = v21;
      if ((v21 & 0x80u) != 0) {
        unint64_t v14 = (unint64_t)__p[1];
      }
      if (v14) {
        sub_2638AE784((uint64_t)v23, (uint64_t)__p);
      }
      else {
        sub_2638AFA00((uint64_t)v23, &v22);
      }
      if ((char)v21 < 0) {
        operator delete(__p[0]);
      }
    }
    else if (a5 == 12)
    {
      LOBYTE(__p[0]) = v13 != 0;
      sub_2638AE620((uint64_t)v23, (unsigned __int8 *)__p);
    }
    else
    {
      sub_2638AFA00((uint64_t)v23, &v22);
    }
    ++v12;
  }
  long long v16 = *a3;
  uint64_t v17 = *((void *)a3 + 2);
  int v15 = sub_2638B5794((uint64_t)a1, (MetadataHandle *)&v16, a4);
  sub_2638BEEB0(a1, v10, (uint64_t)v23, v15);
  sub_2638A5C4C(&v24, v23[0]);
}

void sub_2638B5F04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,unsigned __int8 a24,char **a25)
{
}

uint64_t wis::reflect::getUnpackedType(uint64_t result)
{
  if ((result - 15) >= 0xC) {
    return result;
  }
  else {
    return (result - 14);
  }
}

uint64_t wis::reflect::getPackedType(int a1)
{
  if ((a1 - 1) > 0x19) {
    return 0;
  }
  else {
    return dword_2638C99C0[a1 - 1];
  }
}

uint64_t wis::protobuf::skipField(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, int a2)
{
  uint64_t result = 0;
  switch(a2)
  {
    case 0:
      *(void *)uint64_t v6 = 0;
      std::string v4 = (char *)*((void *)this + 1);
      if ((unint64_t)v4 >= *((void *)this + 2) || *v4 < 0) {
        return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(this, (unint64_t *)v6);
      }
      *((void *)this + 1) = v4 + 1;
      return 1;
    case 1:
      *(void *)uint64_t v6 = 0;
      return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(this, (unint64_t *)v6);
    case 2:
      v6[0] = 0;
      __n128 v5 = (char *)*((void *)this + 1);
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

uint64_t wis::protobuf::NumberConverter<(wis::reflect::Type)8>::decode(unsigned int a1)
{
  return -(a1 & 1) ^ (a1 >> 1);
}

uint64_t wis::protobuf::NumberConverter<(wis::reflect::Type)8>::encode(int a1)
{
  return (2 * a1) ^ (a1 >> 31);
}

unint64_t wis::protobuf::NumberConverter<(wis::reflect::Type)5>::decode(unint64_t a1)
{
  return -(uint64_t)(a1 & 1) ^ (a1 >> 1);
}

uint64_t wis::protobuf::NumberConverter<(wis::reflect::Type)5>::encode(uint64_t a1)
{
  return (2 * a1) ^ (a1 >> 63);
}

double wis::protobuf::NumberConverter<(wis::reflect::Type)1>::decode(uint64_t a1)
{
  return *(double *)&a1;
}

float wis::protobuf::NumberConverter<(wis::reflect::Type)2>::decode(int a1)
{
  return *(float *)&a1;
}

uint64_t sub_2638B60F0(uint64_t a1, PB::TextFormatter *this, char *a3)
{
  PB::TextFormatter::beginObject(this, a3);
  if (*(void *)(a1 + 8)) {
    PB::TextFormatter::format();
  }
  char v5 = *(unsigned char *)(a1 + 32);
  if (v5)
  {
    PB::TextFormatter::format(this, "s_value");
    char v5 = *(unsigned char *)(a1 + 32);
  }
  if ((v5 & 2) != 0) {
    PB::TextFormatter::format(this, "u_value");
  }

  return MEMORY[0x270F587F0](this);
}

uint64_t sub_2638B6184(uint64_t result, PB::Writer *this)
{
  uint64_t v3 = result;
  if (*(void *)(result + 8)) {
    uint64_t result = PB::Writer::write();
  }
  char v4 = *(unsigned char *)(v3 + 32);
  if ((v4 & 2) != 0)
  {
    uint64_t result = PB::Writer::writeVarInt(this);
    char v4 = *(unsigned char *)(v3 + 32);
  }
  if (v4)
  {
    uint64_t v5 = *(void *)(v3 + 16);
    return MEMORY[0x270F58850](this, v5, 3);
  }
  return result;
}

void *sub_2638B6204(void *result)
{
  *uint64_t result = &unk_270EB7280;
  result[1] = 0;
  result[2] = 0;
  result[3] = 0;
  return result;
}

void sub_2638B6228(void **a1)
{
  *a1 = &unk_270EB7280;
  uint64_t v2 = a1 + 1;
  sub_26389C308(&v2);
  PB::Base::~Base((PB::Base *)a1);
}

uint64_t sub_2638B6284(void **a1)
{
  *a1 = &unk_270EB7280;
  uint64_t v3 = a1 + 1;
  sub_26389C308(&v3);
  PB::Base::~Base((PB::Base *)a1);
  return MEMORY[0x263E6D460]();
}

uint64_t sub_2638B62F4(uint64_t a1, PB::TextFormatter *this, char *a3)
{
  PB::TextFormatter::beginObject(this, a3);
  uint64_t v5 = *(uint64_t **)(a1 + 8);
  uint64_t v6 = *(uint64_t **)(a1 + 16);
  while (v5 != v6)
  {
    uint64_t v7 = *v5++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v7 + 32))(v7, this, "metrics");
  }

  return MEMORY[0x270F587F0](this);
}

uint64_t sub_2638B638C(int a1, PB::Reader *this)
{
  unint64_t v2 = *((void *)this + 1);
  unint64_t v3 = *((void *)this + 2);
  int v4 = *((unsigned __int8 *)this + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      uint64_t v7 = *(void *)this;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        unint64_t v11 = v2 + 1;
        *((void *)this + 1) = v2 + 1;
        char v12 = *(unsigned char *)(v7 + v2);
        v10 |= (unint64_t)(v12 & 0x7F) << v8;
        if ((v12 & 0x80) == 0) {
          break;
        }
        v8 += 7;
        unint64_t v2 = v11;
        if (v9++ > 8) {
          goto LABEL_19;
        }
      }
LABEL_20:
      if ((v10 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      if ((v10 >> 3) == 1) {
        sub_2638B6548();
      }
      uint64_t result = PB::Reader::skip(this);
      if (!result) {
        return result;
      }
      unint64_t v2 = *((void *)this + 1);
      unint64_t v3 = *((void *)this + 2);
      int v4 = *((unsigned __int8 *)this + 24);
      if (v2 >= v3 || *((unsigned char *)this + 24)) {
        return v4 == 0;
      }
    }
    char v14 = 0;
    unsigned int v15 = 0;
    unint64_t v10 = 0;
    if (v2 > v3) {
      unint64_t v3 = v2;
    }
    while (v3 != v2)
    {
      unint64_t v16 = v2 + 1;
      char v17 = *(unsigned char *)(v7 + v2);
      *((void *)this + 1) = v16;
      v10 |= (unint64_t)(v17 & 0x7F) << v14;
      if ((v17 & 0x80) == 0) {
        goto LABEL_20;
      }
      v14 += 7;
      unint64_t v2 = v16;
      if (v15++ >= 9)
      {
LABEL_19:
        unint64_t v10 = 0;
        goto LABEL_20;
      }
    }
    int v4 = 1;
    *((unsigned char *)this + 24) = 1;
  }
  return v4 == 0;
}

void sub_2638B6548()
{
}

void sub_2638B6644(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_26389E044((void **)va);
  _Unwind_Resume(a1);
}

uint64_t sub_2638B6688(uint64_t result, PB::Writer *this)
{
  unint64_t v2 = *(const PB::Base ***)(result + 8);
  for (i = *(const PB::Base ***)(result + 16); v2 != i; uint64_t result = PB::Writer::writeSubmessage(this, v5))
    uint64_t v5 = *v2++;
  return result;
}

uint64_t sub_2638B66D4(uint64_t *a1, void *a2)
{
  uint64_t result = sub_2638B674C((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
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

uint64_t sub_2638B674C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
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
  sub_2638B67E4((uint64_t)v13);
  return v11;
}

uint64_t sub_2638B67E4(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_2638A252C((void *)a1);
  }
  return a1;
}

uint64_t LazyMetadataLoader::LazyMetadataLoader(uint64_t a1, int a2, uint64_t *a3)
{
  uint64_t v4 = *a3;
  *a3 = 0;
  uint64_t v8 = v4;
  double v5 = WISMetadataLoader::WISMetadataLoader(a1 + 8, a2, &v8);
  uint64_t v6 = v8;
  uint64_t v8 = 0;
  if (v6) {
    (*(void (**)(uint64_t, double))(*(void *)v6 + 8))(v6, v5);
  }
  *(void *)a1 = &unk_270EB72D0;
  *(_DWORD *)(a1 + 88) = 30000;
  *(void *)(a1 + 112) = 0;
  *(void *)(a1 + 104) = 0;
  *(void *)(a1 + 96) = a1 + 104;
  *(void *)(a1 + 80) = 0;
  return a1;
}

void sub_2638B68C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    sub_2638C4EE0(a10);
  }
  _Unwind_Resume(exception_object);
}

void LazyMetadataLoader::~LazyMetadataLoader(LazyMetadataLoader *this)
{
  *(void *)this = &unk_270EB72D0;
  sub_2638B71C4((uint64_t)this + 96, *((void **)this + 13));
  sub_26389B614((uint64_t)this + 40);
  unint64_t v2 = (std::__shared_weak_count *)*((void *)this + 4);
  if (v2) {
    sub_26389F6D4(v2);
  }
  uint64_t v3 = *((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
}

{
  uint64_t vars8;

  LazyMetadataLoader::~LazyMetadataLoader(this);

  JUMPOUT(0x263E6D460);
}

uint64_t LazyMetadataLoader::hasMetadataForComponent(LazyMetadataLoader *this, unsigned int a2)
{
  uint64_t v2 = *((void *)this + 13);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = (_DWORD *)((char *)this + 104);
  do
  {
    unsigned int v4 = *(_DWORD *)(v2 + 32);
    BOOL v5 = v4 >= a2;
    if (v4 >= a2) {
      uint64_t v6 = (uint64_t *)v2;
    }
    else {
      uint64_t v6 = (uint64_t *)(v2 + 8);
    }
    if (v5) {
      uint64_t v3 = (_DWORD *)v2;
    }
    uint64_t v2 = *v6;
  }
  while (*v6);
  if (v3 != (_DWORD *)((char *)this + 104) && v3[8] <= a2) {
    return (*(uint64_t (**)(void))(**((void **)this + 1) + 72))();
  }
  else {
    return 0;
  }
}

uint64_t LazyMetadataLoader::baseMetadataIsValid(LazyMetadataLoader *this)
{
  return (*(uint64_t (**)(void))(**((void **)this + 1) + 72))();
}

uint64_t LazyMetadataLoader::setBaseMetadata(LazyMetadataLoader *this, void *a2)
{
  uint64_t result = (*(uint64_t (**)(void))(**((void **)this + 1) + 72))(*((void *)this + 1));
  if ((result & 1) == 0) {
    operator new();
  }
  return result;
}

void sub_2638B6B4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

uint64_t LazyMetadataLoader::shouldRequestMetadata(LazyMetadataLoader *this, unint64_t a2)
{
  unint64_t v2 = *((void *)this + 10);
  if (v2)
  {
    BOOL v3 = a2 >= v2;
    unint64_t v4 = a2 - v2;
    if (v4 == 0 || !v3 || v4 <= *((unsigned int *)this + 22)) {
      return 0;
    }
  }
  *((void *)this + 1sub_2638B7290(&a9, 0) = a2;
  return 1;
}

uint64_t LazyMetadataLoader::setMetadataForComponent(LazyMetadataLoader *this, void *a2, unsigned int a3)
{
  unsigned int v4 = a3;
  uint64_t result = LazyMetadataLoader::hasMetadataForComponent(this, a3);
  if ((result & 1) == 0) {
    operator new();
  }
  return result;
}

void sub_2638B6D40(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_2638B7290((uint64_t *)va, 0);
  _Unwind_Resume(a1);
}

void sCreateLazyMetadataLoaderDelegate(void)
{
}

void sub_2638B6DE8(_Unwind_Exception *a1)
{
  MEMORY[0x263E6D460](v1, 0x10A1C405745F166);
  _Unwind_Resume(a1);
}

void LazyRemoteMetadataLoaderDelegate::LazyRemoteMetadataLoaderDelegate(LazyRemoteMetadataLoaderDelegate *this)
{
  BestChoiceMetadataLoaderDelegate::BestChoiceMetadataLoaderDelegate(this);
  *uint64_t v1 = &unk_270EB72F0;
  v1[16] = 0;
  sub_2638B7290(v1 + 16, 0);
}

{
  void *v1;

  BestChoiceMetadataLoaderDelegate::BestChoiceMetadataLoaderDelegate(this);
  *uint64_t v1 = &unk_270EB72F0;
  v1[16] = 0;
  sub_2638B7290(v1 + 16, 0);
}

void LazyRemoteMetadataLoaderDelegate::~LazyRemoteMetadataLoaderDelegate(LazyRemoteMetadataLoaderDelegate *this)
{
  *(void *)this = &unk_270EB72F0;
  sub_2638B7290((uint64_t *)this + 16, 0);

  BestChoiceMetadataLoaderDelegate::~BestChoiceMetadataLoaderDelegate(this);
}

{
  uint64_t vars8;

  *(void *)this = &unk_270EB72F0;
  sub_2638B7290((uint64_t *)this + 16, 0);

  BestChoiceMetadataLoaderDelegate::~BestChoiceMetadataLoaderDelegate(this);
}

{
  uint64_t vars8;

  *(void *)this = &unk_270EB72F0;
  sub_2638B7290((uint64_t *)this + 16, 0);
  BestChoiceMetadataLoaderDelegate::~BestChoiceMetadataLoaderDelegate(this);

  JUMPOUT(0x263E6D460);
}

uint64_t LazyRemoteMetadataLoaderDelegate::setBaseMetadata(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  *a2 = 0;
  sub_2638B7290(a1 + 16, v3);
  unsigned int v4 = *(uint64_t (**)(uint64_t *))(*a1 + 96);

  return v4(a1);
}

uint64_t LazyRemoteMetadataLoaderDelegate::getMetadataBinary(LazyRemoteMetadataLoaderDelegate *this)
{
  uint64_t v1 = *((void *)this + 16);
  if (v1) {
    return *(void *)(v1 + 8);
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    sub_2638C4F60();
  }
  return 0;
}

void *LazyRemoteMetadataLoaderDelegate::ensureCacheReady(void *this)
{
  if (!this[8]) {
    return (void *)(*(uint64_t (**)(void))(*this + 96))();
  }
  return this;
}

uint64_t LazyRemoteMetadataLoaderDelegate::setMetadataForComponent(LazyRemoteMetadataLoaderDelegate *this, unsigned __int8 *a2, uint64_t a3)
{
  sub_2638C0504(a2, a3, (uint64_t)&v7);
  uint64_t v4 = *(void *)this;
  if (v7 <= *((_DWORD *)this + 30)) {
    BOOL v5 = (void (**)(LazyRemoteMetadataLoaderDelegate *))(v4 + 128);
  }
  else {
    BOOL v5 = (void (**)(LazyRemoteMetadataLoaderDelegate *))(v4 + 120);
  }
  (*v5)(this);
  sub_2638B7178((uint64_t)&v9);
  return sub_2638B7178((uint64_t)&v8);
}

void sub_2638B714C(_Unwind_Exception *a1)
{
  sub_2638B7178(v1 + 48);
  sub_2638B7178(v1 + 8);
  _Unwind_Resume(a1);
}

BOOL LazyRemoteMetadataLoaderDelegate::baseMetadataIsValidInDelegate(LazyRemoteMetadataLoaderDelegate *this)
{
  return *((void *)this + 16) != 0;
}

uint64_t sub_2638B7178(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      uint64_t v3 = (void *)*v2;
      operator delete(v2);
      unint64_t v2 = v3;
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

void sub_2638B71C4(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_2638B71C4(a1, *a2);
    sub_2638B71C4(a1, a2[1]);
    sub_2638B7290(a2 + 5, 0);
    operator delete(a2);
  }
}

void *sub_2638B7224(void *a1, void *a2)
{
  *a1 = 0;
  a1[1] = 0;
  uint64_t v3 = (void **)(a1 + 1);
  a1[2] = 0;
  if (a2 && MEMORY[0x263E6D6E0](a2) == MEMORY[0x263EF8790]) {
    a1[2] = xpc_shmem_map(a2, v3);
  }
  return a1;
}

uint64_t sub_2638B7290(uint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    sub_2638B72E0(result);
    JUMPOUT(0x263E6D460);
  }
  return result;
}

uint64_t sub_2638B72E0(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 8);
  if (v2 != (void *)-1)
  {
    munmap(v2, *(void *)(a1 + 16));
    *(void *)(a1 + 8) = -1;
  }
  if (*(void *)a1)
  {
    fclose(*(FILE **)a1);
    *(void *)a1 = 0;
  }
  return a1;
}

uint64_t **sub_2638B7334(uint64_t **a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  unsigned int v7 = a1 + 1;
  uint64_t v6 = a1[1];
  if (v6)
  {
    unsigned int v8 = *a2;
    while (1)
    {
      while (1)
      {
        uint64_t v9 = (uint64_t **)v6;
        unsigned int v10 = *((_DWORD *)v6 + 8);
        if (v8 >= v10) {
          break;
        }
        uint64_t v6 = *v9;
        unsigned int v7 = v9;
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
        unsigned int v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    uint64_t v9 = a1 + 1;
LABEL_10:
    uint64_t v11 = operator new(0x30uLL);
    v11[8] = **a4;
    *((void *)v11 + 5) = 0;
    sub_2638AC858(a1, (uint64_t)v9, v7, (uint64_t *)v11);
    return (uint64_t **)v11;
  }
  return v9;
}

void *sub_2638B73F8(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = (void *)(a2 + 8);
  sub_2638B7820((uint64_t *)(a1 + 8), ((uint64_t)(*(void *)(a2 + 16) - *(void *)(a2 + 8)) >> 3)+ ((uint64_t)(*(void *)(a1 + 16) - *(void *)(a1 + 8)) >> 3));
  if (*v2 != v2[1]) {
    sub_2638B7474();
  }

  return sub_26389C35C(v2);
}

void sub_2638B7474()
{
}

void sub_2638B7578(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_26389E044((void **)va);
  _Unwind_Resume(a1);
}

uint64_t sub_2638B75BC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(uint64_t **)(a1 + 16);
  unint64_t v4 = 126 - 2 * __clz(((uint64_t)v3 - v2) >> 3);
  if (v3 == (uint64_t *)v2) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = v4;
  }
  uint64_t result = sub_2638B78B4(v2, v3, v5, 1);
  unsigned int v8 = *(uint64_t **)(a1 + 8);
  uint64_t v9 = *(uint64_t **)(a1 + 16);
  if (v8 == v9)
  {
    uint64_t v9 = *(uint64_t **)(a1 + 8);
    goto LABEL_57;
  }
  unsigned int v10 = v8 + 1;
  if (v8 + 1 == v9) {
    goto LABEL_55;
  }
  unint64_t v11 = *(void *)(*v8 + 8);
  while (1)
  {
    char v12 = v8;
    unsigned int v8 = v10;
    unint64_t v13 = v11;
    unint64_t v11 = *(void *)(v12[1] + 8);
    if (!v13 || !v11)
    {
      if (!(v13 | v11)) {
        break;
      }
      goto LABEL_24;
    }
    uint64_t v14 = *(unsigned __int8 *)(v13 + 23);
    if ((v14 & 0x80u) == 0) {
      uint64_t v15 = *(unsigned __int8 *)(v13 + 23);
    }
    else {
      uint64_t v15 = *(void *)(v13 + 8);
    }
    uint64_t v16 = *(unsigned __int8 *)(v11 + 23);
    int v17 = (char)v16;
    if ((v16 & 0x80u) != 0) {
      uint64_t v16 = *(void *)(v11 + 8);
    }
    if (v15 == v16)
    {
      if (v17 >= 0) {
        unsigned int v7 = *(unsigned __int8 **)(v12[1] + 8);
      }
      else {
        unsigned int v7 = *(unsigned __int8 **)v11;
      }
      if ((v14 & 0x80) == 0)
      {
        if (!*(unsigned char *)(v13 + 23)) {
          break;
        }
        while (*(unsigned __int8 *)v13 == *v7)
        {
          ++v13;
          ++v7;
          if (!--v14) {
            goto LABEL_27;
          }
        }
        goto LABEL_24;
      }
      uint64_t result = memcmp(*(const void **)v13, v7, *(void *)(v13 + 8));
      if (!result) {
        break;
      }
    }
LABEL_24:
    unsigned int v10 = v8 + 1;
    if (v8 + 1 == v9) {
      goto LABEL_55;
    }
  }
LABEL_27:
  if (v12 == v9)
  {
LABEL_55:
    unsigned int v8 = v9;
    goto LABEL_57;
  }
  long long v18 = v12 + 2;
  if (v12 + 2 == v9) {
    goto LABEL_54;
  }
  while (2)
  {
    uint64_t v19 = *v18;
    unint64_t v20 = *(void *)(*v12 + 8);
    unsigned __int8 v21 = *(unsigned __int8 ***)(*v18 + 8);
    if (v20) {
      BOOL v22 = v21 == 0;
    }
    else {
      BOOL v22 = 1;
    }
    if (v22)
    {
      if (v20 | (unint64_t)v21) {
        goto LABEL_51;
      }
    }
    else
    {
      uint64_t v23 = *(unsigned __int8 *)(v20 + 23);
      if ((v23 & 0x80u) == 0) {
        int v24 = (unsigned __int8 *)*(unsigned __int8 *)(v20 + 23);
      }
      else {
        int v24 = *(unsigned __int8 **)(v20 + 8);
      }
      long long v25 = (unsigned __int8 *)*((unsigned __int8 *)v21 + 23);
      int v26 = (char)v25;
      if ((char)v25 < 0) {
        long long v25 = v21[1];
      }
      if (v24 != v25) {
        goto LABEL_51;
      }
      if (v26 >= 0) {
        unsigned int v7 = *(unsigned __int8 **)(*v18 + 8);
      }
      else {
        unsigned int v7 = *v21;
      }
      if ((v23 & 0x80) != 0)
      {
        uint64_t result = memcmp(*(const void **)v20, v7, *(void *)(v20 + 8));
        if (result) {
          goto LABEL_51;
        }
      }
      else if (*(unsigned char *)(v20 + 23))
      {
        while (*(unsigned __int8 *)v20 == *v7)
        {
          ++v20;
          ++v7;
          if (!--v23) {
            goto LABEL_52;
          }
        }
LABEL_51:
        uint64_t v27 = v12[1];
        ++v12;
        uint64_t result = sub_2638C1EA4(v27, v19);
      }
    }
LABEL_52:
    if (++v18 != v9) {
      continue;
    }
    break;
  }
  uint64_t v9 = *(uint64_t **)(a1 + 16);
LABEL_54:
  unsigned int v8 = v9;
  uint64_t v9 = v12 + 1;
LABEL_57:
  if ((char *)v8 - (char *)v9 >= 1)
  {
    unint64_t v28 = (unint64_t)((char *)v8 - (char *)v9) >> 3;
    unint64_t v29 = v8 - 1;
    uint64_t v30 = v28 + 1;
    do
    {
      uint64_t result = *v29;
      uint64_t *v29 = 0;
      if (result) {
        uint64_t result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(*(void *)result + 8))(result, v7);
      }
      *(void *)(a1 + 16) = v29--;
      --v30;
    }
    while (v30 > 1);
  }
  return result;
}

void **sub_2638B7820(uint64_t *a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t result = (void **)(a1 + 2);
  if (a2 > (v4 - *a1) >> 3)
  {
    if (a2 >> 61) {
      sub_2638A2514();
    }
    uint64_t v5 = a1[1] - *a1;
    v7[4] = result;
    v7[0] = sub_26389E00C((uint64_t)result, a2);
    v7[1] = (char *)v7[0] + v5;
    v7[2] = (char *)v7[0] + v5;
    v7[3] = (char *)v7[0] + 8 * v6;
    sub_2638B66D4(a1, v7);
    return sub_26389E044(v7);
  }
  return result;
}

void sub_2638B78A0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_26389E044((void **)va);
  _Unwind_Resume(a1);
}

uint64_t sub_2638B78B4(uint64_t result, uint64_t *a2, uint64_t a3, char a4)
{
  unsigned int v8 = (uint64_t *)result;
  while (2)
  {
    v334 = a2;
    v335 = a2 - 1;
    v331 = a2 - 3;
    v332 = a2 - 2;
    int i = v8;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          unsigned int v10 = i;
          uint64_t v11 = (char *)a2 - (char *)i;
          uint64_t v12 = a2 - i;
          if (v5 || !v4)
          {
            switch(v12)
            {
              case 0:
              case 1:
                return result;
              case 2:
                uint64_t v160 = *(a2 - 1);
                uint64_t v161 = *(void *)(v160 + 8);
                if (v161)
                {
                  uint64_t v162 = *v10;
                  uint64_t v163 = *(void *)(*v10 + 8);
                  if (!v163) {
                    goto LABEL_312;
                  }
                  int v164 = *(char *)(v163 + 23);
                  int v165 = *(char *)(v161 + 23);
                  unint64_t v166 = v165 >= 0 ? *(unsigned __int8 *)(v161 + 23) : *(void *)(v161 + 8);
                  v167 = v165 >= 0 ? *(const void **)(v160 + 8) : *(const void **)v161;
                  unint64_t v168 = v164 >= 0 ? *(unsigned __int8 *)(v163 + 23) : *(void *)(v163 + 8);
                  v169 = v164 >= 0 ? *(const void **)(*v10 + 8) : *(const void **)v163;
                  size_t v170 = v168 >= v166 ? v166 : v168;
                  uint64_t result = memcmp(v167, v169, v170);
                  BOOL v171 = v166 < v168;
                  if (result) {
                    BOOL v171 = (int)result < 0;
                  }
                  if (v171) {
LABEL_312:
                  }
                    uint64_t result = sub_2638C1DF8(v162, v160);
                }
                break;
              case 3:
                uint64_t result = sub_2638B8C18((uint64_t)v10, v10 + 1, v335);
                break;
              case 4:
                uint64_t result = sub_2638B91FC(v10, v10 + 1, v10 + 2, v335);
                break;
              case 5:
                uint64_t result = sub_2638B89B8(v10, v10 + 1, v10 + 2, v10 + 3, v335);
                break;
              default:
                JUMPOUT(0);
            }
            return result;
          }
          v337 = v10;
          if (v11 <= 191)
          {
            if (a4)
            {
              if (v10 != a2)
              {
                v172 = v10 + 1;
                if (v10 + 1 != a2)
                {
                  uint64_t v173 = 0;
                  v174 = v10;
                  do
                  {
                    v175 = v174;
                    v174 = v172;
                    uint64_t v176 = v175[1];
                    uint64_t v177 = *(void *)(v176 + 8);
                    if (v177)
                    {
                      uint64_t v178 = *(void *)(*v175 + 8);
                      if (!v178) {
                        goto LABEL_343;
                      }
                      int v179 = *(char *)(v178 + 23);
                      int v180 = *(char *)(v177 + 23);
                      if (v180 >= 0) {
                        size_t v181 = *(unsigned __int8 *)(v177 + 23);
                      }
                      else {
                        size_t v181 = *(void *)(v177 + 8);
                      }
                      if (v180 >= 0) {
                        v182 = *(const void **)(v176 + 8);
                      }
                      else {
                        v182 = *(const void **)v177;
                      }
                      if (v179 >= 0) {
                        size_t v183 = *(unsigned __int8 *)(v178 + 23);
                      }
                      else {
                        size_t v183 = *(void *)(v178 + 8);
                      }
                      if (v179 >= 0) {
                        v184 = *(const void **)(*v175 + 8);
                      }
                      else {
                        v184 = *(const void **)v178;
                      }
                      if (v183 >= v181) {
                        size_t v185 = v181;
                      }
                      else {
                        size_t v185 = v183;
                      }
                      uint64_t result = memcmp(v182, v184, v185);
                      BOOL v4 = v181 >= v183;
                      unsigned int v10 = v337;
                      a2 = v334;
                      BOOL v186 = !v4;
                      if (result) {
                        BOOL v186 = (int)result < 0;
                      }
                      if (v186)
                      {
LABEL_343:
                        sub_2638C1EA0(v339, v176);
                        sub_2638C1EA4(v175[1], *v175);
                        v187 = v10;
                        if (v175 != v10)
                        {
                          uint64_t v188 = v173;
                          while (1)
                          {
                            v187 = (uint64_t *)((char *)v337 + v188);
                            if (!v340) {
                              break;
                            }
                            uint64_t v189 = *(v187 - 1);
                            uint64_t v190 = *(void *)(v189 + 8);
                            if (v190)
                            {
                              int v191 = *(char *)(v190 + 23);
                              int v192 = *((char *)v340 + 23);
                              if (v192 >= 0) {
                                size_t v193 = *((unsigned __int8 *)v340 + 23);
                              }
                              else {
                                size_t v193 = (size_t)v340[1];
                              }
                              if (v192 >= 0) {
                                v194 = v340;
                              }
                              else {
                                v194 = *v340;
                              }
                              if (v191 >= 0) {
                                size_t v195 = *(unsigned __int8 *)(v190 + 23);
                              }
                              else {
                                size_t v195 = *(void *)(v190 + 8);
                              }
                              if (v191 >= 0) {
                                v196 = *(const void **)(v189 + 8);
                              }
                              else {
                                v196 = *(const void **)v190;
                              }
                              if (v195 >= v193) {
                                size_t v197 = v193;
                              }
                              else {
                                size_t v197 = v195;
                              }
                              int v198 = memcmp(v194, v196, v197);
                              BOOL v199 = v193 < v195;
                              if (v198) {
                                BOOL v199 = v198 < 0;
                              }
                              if (!v199)
                              {
                                v187 = v175;
                                break;
                              }
                            }
                            --v175;
                            sub_2638C1EA4(*v187, v189);
                            v188 -= 8;
                            if (!v188)
                            {
                              unsigned int v10 = v337;
                              v187 = v337;
                              a2 = v334;
                              goto LABEL_369;
                            }
                          }
                          a2 = v334;
                          unsigned int v10 = v337;
                        }
LABEL_369:
                        sub_2638C1EA4(*v187, (uint64_t)v339);
                        uint64_t result = sub_2638C1DBC((PB::Base *)v339);
                      }
                    }
                    v172 = v174 + 1;
                    v173 += 8;
                  }
                  while (v174 + 1 != a2);
                }
              }
            }
            else if (v10 != a2)
            {
              while (v10 + 1 != a2)
              {
                v305 = v10++;
                uint64_t v306 = v305[1];
                uint64_t v307 = *(void *)(v306 + 8);
                if (v307)
                {
                  uint64_t v308 = *(void *)(*v305 + 8);
                  if (!v308) {
                    goto LABEL_562;
                  }
                  int v309 = *(char *)(v308 + 23);
                  int v310 = *(char *)(v307 + 23);
                  if (v310 >= 0) {
                    size_t v311 = *(unsigned __int8 *)(v307 + 23);
                  }
                  else {
                    size_t v311 = *(void *)(v307 + 8);
                  }
                  if (v310 >= 0) {
                    v312 = *(const void **)(v306 + 8);
                  }
                  else {
                    v312 = *(const void **)v307;
                  }
                  if (v309 >= 0) {
                    size_t v313 = *(unsigned __int8 *)(v308 + 23);
                  }
                  else {
                    size_t v313 = *(void *)(v308 + 8);
                  }
                  if (v309 >= 0) {
                    v314 = *(const void **)(*v305 + 8);
                  }
                  else {
                    v314 = *(const void **)v308;
                  }
                  if (v313 >= v311) {
                    size_t v315 = v311;
                  }
                  else {
                    size_t v315 = v313;
                  }
                  uint64_t result = memcmp(v312, v314, v315);
                  BOOL v316 = v311 < v313;
                  if (result) {
                    BOOL v316 = (int)result < 0;
                  }
                  if (v316)
                  {
LABEL_562:
                    sub_2638C1EA0(v339, v306);
                    sub_2638C1EA4(*v10, *v305);
                    v317 = v340;
                    if (v340)
                    {
                      v318 = v305;
                      while (1)
                      {
                        uint64_t v320 = *--v318;
                        uint64_t v319 = v320;
                        v321 = *(const void ***)(v320 + 8);
                        if (v321)
                        {
                          int v322 = *((char *)v321 + 23);
                          int v323 = *((char *)v317 + 23);
                          if (v323 >= 0) {
                            size_t v324 = *((unsigned __int8 *)v317 + 23);
                          }
                          else {
                            size_t v324 = (size_t)v317[1];
                          }
                          if (v323 >= 0) {
                            v325 = v317;
                          }
                          else {
                            v325 = *v317;
                          }
                          if (v322 >= 0) {
                            size_t v326 = *((unsigned __int8 *)v321 + 23);
                          }
                          else {
                            size_t v326 = (size_t)v321[1];
                          }
                          if (v322 >= 0) {
                            v327 = v321;
                          }
                          else {
                            v327 = *v321;
                          }
                          if (v326 >= v324) {
                            size_t v328 = v324;
                          }
                          else {
                            size_t v328 = v326;
                          }
                          int v329 = memcmp(v325, v327, v328);
                          BOOL v330 = v324 < v326;
                          if (v329) {
                            BOOL v330 = v329 < 0;
                          }
                          if (!v330) {
                            break;
                          }
                        }
                        sub_2638C1EA4(*v305, v319);
                        v317 = v340;
                        v305 = v318;
                        if (!v340) {
                          goto LABEL_586;
                        }
                      }
                    }
                    v318 = v305;
LABEL_586:
                    sub_2638C1EA4(*v318, (uint64_t)v339);
                    uint64_t result = sub_2638C1DBC((PB::Base *)v339);
                  }
                }
              }
            }
            return result;
          }
          if (!a3)
          {
            if (v10 != a2)
            {
              int64_t v200 = (unint64_t)(v12 - 2) >> 1;
              int64_t v336 = v200;
              do
              {
                int64_t v201 = v200;
                if (v336 >= v200)
                {
                  uint64_t v202 = (2 * v200) | 1;
                  v203 = &v337[v202];
                  if (2 * v200 + 2 < v12)
                  {
                    v204 = v203 + 1;
                    uint64_t v205 = *(void *)(*v203 + 8);
                    if (v205)
                    {
                      uint64_t v206 = *(void *)(*v204 + 8);
                      if (!v206) {
                        goto LABEL_396;
                      }
                      int v207 = *(char *)(v206 + 23);
                      int v208 = *(char *)(v205 + 23);
                      if (v208 >= 0) {
                        size_t v209 = *(unsigned __int8 *)(v205 + 23);
                      }
                      else {
                        size_t v209 = *(void *)(v205 + 8);
                      }
                      if (v208 >= 0) {
                        v210 = *(const void **)(*v203 + 8);
                      }
                      else {
                        v210 = *(const void **)v205;
                      }
                      if (v207 >= 0) {
                        size_t v211 = *(unsigned __int8 *)(v206 + 23);
                      }
                      else {
                        size_t v211 = *(void *)(v206 + 8);
                      }
                      if (v207 >= 0) {
                        v212 = *(const void **)(*v204 + 8);
                      }
                      else {
                        v212 = *(const void **)v206;
                      }
                      if (v211 >= v209) {
                        size_t v213 = v209;
                      }
                      else {
                        size_t v213 = v211;
                      }
                      int v214 = memcmp(v210, v212, v213);
                      BOOL v215 = v209 < v211;
                      if (v214) {
                        BOOL v215 = v214 < 0;
                      }
                      if (v215)
                      {
LABEL_396:
                        ++v203;
                        uint64_t v202 = 2 * v201 + 2;
                      }
                    }
                  }
                  uint64_t v216 = *(void *)(*v203 + 8);
                  uint64_t v217 = v337[v201];
                  if (!v216) {
                    goto LABEL_417;
                  }
                  uint64_t v218 = *(void *)(v217 + 8);
                  if (v218)
                  {
                    int v219 = *(char *)(v218 + 23);
                    int v220 = *(char *)(v216 + 23);
                    if (v220 >= 0) {
                      size_t v221 = *(unsigned __int8 *)(v216 + 23);
                    }
                    else {
                      size_t v221 = *(void *)(v216 + 8);
                    }
                    if (v220 >= 0) {
                      v222 = *(const void **)(*v203 + 8);
                    }
                    else {
                      v222 = *(const void **)v216;
                    }
                    if (v219 >= 0) {
                      size_t v223 = *(unsigned __int8 *)(v218 + 23);
                    }
                    else {
                      size_t v223 = *(void *)(v218 + 8);
                    }
                    if (v219 >= 0) {
                      v224 = *(const void **)(v217 + 8);
                    }
                    else {
                      v224 = *(const void **)v218;
                    }
                    if (v223 >= v221) {
                      size_t v225 = v221;
                    }
                    else {
                      size_t v225 = v223;
                    }
                    int v226 = memcmp(v222, v224, v225);
                    BOOL v227 = v221 < v223;
                    if (v226) {
                      BOOL v227 = v226 < 0;
                    }
                    if (!v227)
                    {
LABEL_417:
                      sub_2638C1EA0(v339, v217);
                      sub_2638C1EA4(v337[v201], *v203);
                      if (v336 >= v202)
                      {
                        while (1)
                        {
                          uint64_t v229 = 2 * v202;
                          uint64_t v202 = (2 * v202) | 1;
                          v228 = &v337[v202];
                          uint64_t v230 = v229 + 2;
                          if (v229 + 2 < v12)
                          {
                            v231 = v228 + 1;
                            uint64_t v232 = *(void *)(*v228 + 8);
                            if (v232)
                            {
                              uint64_t v233 = *(void *)(*v231 + 8);
                              if (!v233) {
                                goto LABEL_440;
                              }
                              int v234 = *(char *)(v233 + 23);
                              int v235 = *(char *)(v232 + 23);
                              if (v235 >= 0) {
                                size_t v236 = *(unsigned __int8 *)(v232 + 23);
                              }
                              else {
                                size_t v236 = *(void *)(v232 + 8);
                              }
                              if (v235 >= 0) {
                                v237 = *(const void **)(*v228 + 8);
                              }
                              else {
                                v237 = *(const void **)v232;
                              }
                              if (v234 >= 0) {
                                size_t v238 = *(unsigned __int8 *)(v233 + 23);
                              }
                              else {
                                size_t v238 = *(void *)(v233 + 8);
                              }
                              if (v234 >= 0) {
                                v239 = *(const void **)(*v231 + 8);
                              }
                              else {
                                v239 = *(const void **)v233;
                              }
                              if (v238 >= v236) {
                                size_t v240 = v236;
                              }
                              else {
                                size_t v240 = v238;
                              }
                              int v241 = memcmp(v237, v239, v240);
                              BOOL v242 = v236 < v238;
                              if (v241) {
                                BOOL v242 = v241 < 0;
                              }
                              if (v242)
                              {
LABEL_440:
                                ++v228;
                                uint64_t v202 = v230;
                              }
                            }
                          }
                          uint64_t v243 = *v228;
                          uint64_t v244 = *(void *)(*v228 + 8);
                          if (v244)
                          {
                            if (!v340) {
                              break;
                            }
                            int v245 = *((char *)v340 + 23);
                            int v246 = *(char *)(v244 + 23);
                            if (v246 >= 0) {
                              size_t v247 = *(unsigned __int8 *)(v244 + 23);
                            }
                            else {
                              size_t v247 = *(void *)(v244 + 8);
                            }
                            if (v246 >= 0) {
                              v248 = *(const void **)(*v228 + 8);
                            }
                            else {
                              v248 = *(const void **)v244;
                            }
                            if (v245 >= 0) {
                              size_t v249 = *((unsigned __int8 *)v340 + 23);
                            }
                            else {
                              size_t v249 = (size_t)v340[1];
                            }
                            if (v245 >= 0) {
                              v250 = v340;
                            }
                            else {
                              v250 = *v340;
                            }
                            if (v249 >= v247) {
                              size_t v251 = v247;
                            }
                            else {
                              size_t v251 = v249;
                            }
                            int v252 = memcmp(v248, v250, v251);
                            BOOL v253 = v247 < v249;
                            if (v252) {
                              BOOL v253 = v252 < 0;
                            }
                            if (v253) {
                              break;
                            }
                          }
                          sub_2638C1EA4(*v203, v243);
                          v203 = v228;
                          if (v336 < v202) {
                            goto LABEL_462;
                          }
                        }
                      }
                      v228 = v203;
LABEL_462:
                      sub_2638C1EA4(*v228, (uint64_t)v339);
                      sub_2638C1DBC((PB::Base *)v339);
                    }
                  }
                }
                int64_t v200 = v201 - 1;
              }
              while (v201);
              uint64_t v254 = (unint64_t)v11 >> 3;
              v255 = v334;
              v256 = v337;
              do
              {
                v257 = v255;
                sub_2638C1EA0(v338, *v256);
                uint64_t v258 = 0;
                do
                {
                  v259 = v256;
                  v256 += v258 + 1;
                  uint64_t v260 = 2 * v258;
                  uint64_t v258 = (2 * v258) | 1;
                  uint64_t v261 = v260 + 2;
                  if (v260 + 2 < v254)
                  {
                    v262 = v256 + 1;
                    uint64_t v263 = *(void *)(*v256 + 8);
                    if (v263)
                    {
                      uint64_t v264 = *(void *)(*v262 + 8);
                      if (!v264) {
                        goto LABEL_487;
                      }
                      int v265 = *(char *)(v264 + 23);
                      int v266 = *(char *)(v263 + 23);
                      if (v266 >= 0) {
                        size_t v267 = *(unsigned __int8 *)(v263 + 23);
                      }
                      else {
                        size_t v267 = *(void *)(v263 + 8);
                      }
                      if (v266 >= 0) {
                        v268 = *(const void **)(*v256 + 8);
                      }
                      else {
                        v268 = *(const void **)v263;
                      }
                      if (v265 >= 0) {
                        size_t v269 = *(unsigned __int8 *)(v264 + 23);
                      }
                      else {
                        size_t v269 = *(void *)(v264 + 8);
                      }
                      if (v265 >= 0) {
                        v270 = *(const void **)(*v262 + 8);
                      }
                      else {
                        v270 = *(const void **)v264;
                      }
                      if (v269 >= v267) {
                        size_t v271 = v267;
                      }
                      else {
                        size_t v271 = v269;
                      }
                      int v272 = memcmp(v268, v270, v271);
                      BOOL v273 = v267 < v269;
                      if (v272) {
                        BOOL v273 = v272 < 0;
                      }
                      if (v273)
                      {
LABEL_487:
                        ++v256;
                        uint64_t v258 = v261;
                      }
                    }
                  }
                  sub_2638C1EA4(*v259, *v256);
                }
                while (v258 <= (uint64_t)((unint64_t)(v254 - 2) >> 1));
                v274 = v257 - 1;
                if (v256 == v274)
                {
                  v255 = v274;
                  sub_2638C1EA4(*v256, (uint64_t)v338);
                }
                else
                {
                  sub_2638C1EA4(*v256, *v274);
                  v255 = v274;
                  sub_2638C1EA4(*v274, (uint64_t)v338);
                  uint64_t v275 = (char *)v256 - (char *)v337 + 8;
                  if (v275 >= 9)
                  {
                    unint64_t v276 = ((unint64_t)v275 >> 3) - 2;
                    unint64_t v277 = v276 >> 1;
                    v278 = &v337[v276 >> 1];
                    uint64_t v279 = *(void *)(*v278 + 8);
                    if (v279)
                    {
                      uint64_t v280 = *v256;
                      uint64_t v281 = *(void *)(*v256 + 8);
                      if (!v281) {
                        goto LABEL_511;
                      }
                      int v282 = *(char *)(v281 + 23);
                      int v283 = *(char *)(v279 + 23);
                      if (v283 >= 0) {
                        size_t v284 = *(unsigned __int8 *)(v279 + 23);
                      }
                      else {
                        size_t v284 = *(void *)(v279 + 8);
                      }
                      if (v283 >= 0) {
                        v285 = *(const void **)(*v278 + 8);
                      }
                      else {
                        v285 = *(const void **)v279;
                      }
                      if (v282 >= 0) {
                        size_t v286 = *(unsigned __int8 *)(v281 + 23);
                      }
                      else {
                        size_t v286 = *(void *)(v281 + 8);
                      }
                      if (v282 >= 0) {
                        v287 = *(const void **)(*v256 + 8);
                      }
                      else {
                        v287 = *(const void **)v281;
                      }
                      if (v286 >= v284) {
                        size_t v288 = v284;
                      }
                      else {
                        size_t v288 = v286;
                      }
                      int v289 = memcmp(v285, v287, v288);
                      BOOL v290 = v284 < v286;
                      if (v289) {
                        BOOL v290 = v289 < 0;
                      }
                      if (v290)
                      {
LABEL_511:
                        sub_2638C1EA0(v339, v280);
                        sub_2638C1EA4(*v256, *v278);
                        if (v276 >= 2)
                        {
                          while (1)
                          {
                            unint64_t v292 = v277 - 1;
                            unint64_t v277 = (v277 - 1) >> 1;
                            v291 = &v337[v277];
                            uint64_t v293 = *v291;
                            uint64_t v294 = *(void *)(*v291 + 8);
                            if (!v294) {
                              break;
                            }
                            if (v340)
                            {
                              int v295 = *((char *)v340 + 23);
                              int v296 = *(char *)(v294 + 23);
                              if (v296 >= 0) {
                                size_t v297 = *(unsigned __int8 *)(v294 + 23);
                              }
                              else {
                                size_t v297 = *(void *)(v294 + 8);
                              }
                              if (v296 >= 0) {
                                v298 = *(const void **)(*v291 + 8);
                              }
                              else {
                                v298 = *(const void **)v294;
                              }
                              if (v295 >= 0) {
                                size_t v299 = *((unsigned __int8 *)v340 + 23);
                              }
                              else {
                                size_t v299 = (size_t)v340[1];
                              }
                              if (v295 >= 0) {
                                v300 = v340;
                              }
                              else {
                                v300 = *v340;
                              }
                              if (v299 >= v297) {
                                size_t v301 = v297;
                              }
                              else {
                                size_t v301 = v299;
                              }
                              int v302 = memcmp(v298, v300, v301);
                              BOOL v303 = v297 < v299;
                              if (v302) {
                                BOOL v303 = v302 < 0;
                              }
                              if (!v303) {
                                break;
                              }
                            }
                            sub_2638C1EA4(*v278, v293);
                            v278 = &v337[v277];
                            if (v292 <= 1) {
                              goto LABEL_513;
                            }
                          }
                        }
                        v291 = v278;
LABEL_513:
                        sub_2638C1EA4(*v291, (uint64_t)v339);
                        sub_2638C1DBC((PB::Base *)v339);
                      }
                    }
                  }
                }
                uint64_t result = sub_2638C1DBC((PB::Base *)v338);
                BOOL v304 = v254-- <= 2;
                v256 = v337;
              }
              while (!v304);
            }
            return result;
          }
          unint64_t v13 = (unint64_t)v12 >> 1;
          uint64_t v14 = &v10[(unint64_t)v12 >> 1];
          if ((unint64_t)v11 < 0x401)
          {
            sub_2638B8C18((uint64_t)v14, v10, v335);
          }
          else
          {
            sub_2638B8C18((uint64_t)v10, v14, v335);
            sub_2638B8C18((uint64_t)(v10 + 1), v14 - 1, v332);
            sub_2638B8C18((uint64_t)(v10 + 2), &v10[v13 + 1], v331);
            sub_2638B8C18((uint64_t)(v14 - 1), v14, &v10[v13 + 1]);
            sub_2638C1DF8(*v10, *v14);
          }
          --a3;
          uint64_t v15 = *v10;
          if (a4) {
            break;
          }
          uint64_t v16 = *(void *)(*(v10 - 1) + 8);
          if (v16)
          {
            uint64_t v17 = *(void *)(v15 + 8);
            if (!v17) {
              break;
            }
            int v18 = *(char *)(v17 + 23);
            int v19 = *(char *)(v16 + 23);
            if (v19 >= 0) {
              size_t v20 = *(unsigned __int8 *)(v16 + 23);
            }
            else {
              size_t v20 = *(void *)(v16 + 8);
            }
            if (v19 >= 0) {
              unsigned __int8 v21 = *(const void **)(*(v10 - 1) + 8);
            }
            else {
              unsigned __int8 v21 = *(const void **)v16;
            }
            if (v18 >= 0) {
              size_t v22 = *(unsigned __int8 *)(v17 + 23);
            }
            else {
              size_t v22 = *(void *)(v17 + 8);
            }
            if (v18 >= 0) {
              uint64_t v23 = *(const void **)(v15 + 8);
            }
            else {
              uint64_t v23 = *(const void **)v17;
            }
            if (v22 >= v20) {
              size_t v24 = v20;
            }
            else {
              size_t v24 = v22;
            }
            int v25 = memcmp(v21, v23, v24);
            BOOL v26 = v20 < v22;
            if (v25) {
              BOOL v26 = v25 < 0;
            }
            if (v26) {
              break;
            }
          }
          sub_2638C1EA0(v339, v15);
          __n128 v92 = v340;
          if (!v340) {
            goto LABEL_266;
          }
          uint64_t v93 = *(void *)(*v335 + 8);
          if (!v93) {
            goto LABEL_174;
          }
          int v94 = *(char *)(v93 + 23);
          int v95 = *((char *)v340 + 23);
          if (v95 >= 0) {
            size_t v96 = *((unsigned __int8 *)v340 + 23);
          }
          else {
            size_t v96 = (size_t)v340[1];
          }
          if (v95 >= 0) {
            char v97 = v340;
          }
          else {
            char v97 = *v340;
          }
          if (v94 >= 0) {
            size_t v98 = *(unsigned __int8 *)(v93 + 23);
          }
          else {
            size_t v98 = *(void *)(v93 + 8);
          }
          if (v94 >= 0) {
            unsigned int v99 = *(const void **)(*v335 + 8);
          }
          else {
            unsigned int v99 = *(const void **)v93;
          }
          if (v98 >= v96) {
            size_t v100 = v96;
          }
          else {
            size_t v100 = v98;
          }
          int v101 = memcmp(v97, v99, v100);
          BOOL v102 = v96 < v98;
          if (v101) {
            BOOL v102 = v101 < 0;
          }
          if (v102)
          {
LABEL_174:
            uint64_t v103 = v10 + 1;
            do
            {
              int i = v103;
              __n128 v104 = *(const void ***)(*v103 + 8);
              if (!v104) {
                break;
              }
              int v105 = *((char *)v104 + 23);
              int v106 = *((char *)v92 + 23);
              if (v106 >= 0) {
                size_t v107 = *((unsigned __int8 *)v92 + 23);
              }
              else {
                size_t v107 = (size_t)v92[1];
              }
              if (v106 >= 0) {
                __n128 v108 = v92;
              }
              else {
                __n128 v108 = *v92;
              }
              if (v105 >= 0) {
                size_t v109 = *((unsigned __int8 *)v104 + 23);
              }
              else {
                size_t v109 = (size_t)v104[1];
              }
              if (v105 >= 0) {
                __n128 v110 = v104;
              }
              else {
                __n128 v110 = *v104;
              }
              if (v109 >= v107) {
                size_t v111 = v107;
              }
              else {
                size_t v111 = v109;
              }
              int v112 = memcmp(v108, v110, v111);
              BOOL v113 = v112 < 0;
              if (!v112) {
                BOOL v113 = v107 < v109;
              }
              uint64_t v103 = i + 1;
            }
            while (!v113);
          }
          else
          {
LABEL_266:
            for (int i = v10 + 1; i < a2; ++i)
            {
              if (v92)
              {
                uint64_t v150 = *(void *)(*i + 8);
                if (!v150) {
                  break;
                }
                int v151 = *(char *)(v150 + 23);
                int v152 = *((char *)v92 + 23);
                if (v152 >= 0) {
                  size_t v153 = *((unsigned __int8 *)v92 + 23);
                }
                else {
                  size_t v153 = (size_t)v92[1];
                }
                if (v152 >= 0) {
                  v154 = v92;
                }
                else {
                  v154 = *v92;
                }
                if (v151 >= 0) {
                  size_t v155 = *(unsigned __int8 *)(v150 + 23);
                }
                else {
                  size_t v155 = *(void *)(v150 + 8);
                }
                if (v151 >= 0) {
                  v156 = *(const void **)(*i + 8);
                }
                else {
                  v156 = *(const void **)v150;
                }
                if (v155 >= v153) {
                  size_t v157 = v153;
                }
                else {
                  size_t v157 = v155;
                }
                int v158 = memcmp(v154, v156, v157);
                BOOL v159 = v153 < v155;
                if (v158) {
                  BOOL v159 = v158 < 0;
                }
                if (v159) {
                  break;
                }
              }
            }
          }
          if (i < a2) {
            j = v335;
          }
          else {
            j = a2;
          }
          if (i < a2 && v92)
          {
            for (j = v335; ; --j)
            {
              uint64_t v115 = *(void *)(*j + 8);
              if (v115)
              {
                int v116 = *(char *)(v115 + 23);
                int v117 = *((char *)v92 + 23);
                if (v117 >= 0) {
                  size_t v118 = *((unsigned __int8 *)v92 + 23);
                }
                else {
                  size_t v118 = (size_t)v92[1];
                }
                if (v117 >= 0) {
                  unint64_t v119 = v92;
                }
                else {
                  unint64_t v119 = *v92;
                }
                if (v116 >= 0) {
                  size_t v120 = *(unsigned __int8 *)(v115 + 23);
                }
                else {
                  size_t v120 = *(void *)(v115 + 8);
                }
                if (v116 >= 0) {
                  uint64_t v121 = *(const void **)(*j + 8);
                }
                else {
                  uint64_t v121 = *(const void **)v115;
                }
                if (v120 >= v118) {
                  size_t v122 = v118;
                }
                else {
                  size_t v122 = v120;
                }
                int v123 = memcmp(v119, v121, v122);
                BOOL v124 = v118 < v120;
                if (v123) {
                  BOOL v124 = v123 < 0;
                }
                if (!v124) {
                  break;
                }
              }
            }
          }
          if (i < j)
          {
            uint64_t v125 = *i;
            uint64_t v126 = *j;
            do
            {
              sub_2638C1DF8(v125, v126);
              unint64_t v127 = v340;
              do
              {
                do
                  ++i;
                while (!v127);
                uint64_t v125 = *i;
                uint64_t v128 = *(void *)(*i + 8);
                if (!v128) {
                  break;
                }
                int v129 = *(char *)(v128 + 23);
                int v130 = *((char *)v127 + 23);
                if (v130 >= 0) {
                  size_t v131 = *((unsigned __int8 *)v127 + 23);
                }
                else {
                  size_t v131 = (size_t)v127[1];
                }
                if (v130 >= 0) {
                  xpc_object_t v132 = v127;
                }
                else {
                  xpc_object_t v132 = *v127;
                }
                if (v129 >= 0) {
                  size_t v133 = *(unsigned __int8 *)(v128 + 23);
                }
                else {
                  size_t v133 = *(void *)(v128 + 8);
                }
                if (v129 >= 0) {
                  unint64_t v134 = *(const void **)(*i + 8);
                }
                else {
                  unint64_t v134 = *(const void **)v128;
                }
                if (v133 >= v131) {
                  size_t v135 = v131;
                }
                else {
                  size_t v135 = v133;
                }
                int v136 = memcmp(v132, v134, v135);
                BOOL v137 = v131 < v133;
                if (v136) {
                  BOOL v137 = v136 < 0;
                }
              }
              while (!v137);
              do
              {
                do
                {
                  uint64_t v138 = *--j;
                  uint64_t v126 = v138;
                  unint64_t v139 = *(const void ***)(v138 + 8);
                }
                while (!v139);
                int v140 = *((char *)v139 + 23);
                int v141 = *((char *)v127 + 23);
                if (v141 >= 0) {
                  size_t v142 = *((unsigned __int8 *)v127 + 23);
                }
                else {
                  size_t v142 = (size_t)v127[1];
                }
                if (v141 >= 0) {
                  v143 = v127;
                }
                else {
                  v143 = *v127;
                }
                if (v140 >= 0) {
                  size_t v144 = *((unsigned __int8 *)v139 + 23);
                }
                else {
                  size_t v144 = (size_t)v139[1];
                }
                if (v140 >= 0) {
                  v145 = v139;
                }
                else {
                  v145 = *v139;
                }
                if (v144 >= v142) {
                  size_t v146 = v142;
                }
                else {
                  size_t v146 = v144;
                }
                int v147 = memcmp(v143, v145, v146);
                BOOL v148 = v142 < v144;
                if (v147) {
                  BOOL v148 = v147 < 0;
                }
              }
              while (v148);
            }
            while (i < j);
          }
          v149 = i - 1;
          if (i - 1 != v337) {
            sub_2638C1EA4(*v337, *v149);
          }
          sub_2638C1EA4(*v149, (uint64_t)v339);
          uint64_t result = sub_2638C1DBC((PB::Base *)v339);
          a4 = 0;
          a2 = v334;
        }
        sub_2638C1EA0(v339, v15);
        uint64_t v27 = v10 + 1;
        uint64_t v28 = v10[1];
        unint64_t v29 = *(const void ***)(v28 + 8);
        if (!v29) {
          goto LABEL_591;
        }
        uint64_t v30 = v340;
        while (1)
        {
          uint64_t v31 = v27;
          if (v30)
          {
            int v32 = *((char *)v30 + 23);
            int v33 = *((char *)v29 + 23);
            if (v33 >= 0) {
              size_t v34 = *((unsigned __int8 *)v29 + 23);
            }
            else {
              size_t v34 = (size_t)v29[1];
            }
            if (v33 >= 0) {
              xpc_object_t v35 = v29;
            }
            else {
              xpc_object_t v35 = *v29;
            }
            if (v32 >= 0) {
              size_t v36 = *((unsigned __int8 *)v30 + 23);
            }
            else {
              size_t v36 = (size_t)v30[1];
            }
            if (v32 >= 0) {
              uint64_t v37 = v30;
            }
            else {
              uint64_t v37 = *v30;
            }
            if (v36 >= v34) {
              size_t v38 = v34;
            }
            else {
              size_t v38 = v36;
            }
            int v39 = memcmp(v35, v37, v38);
            BOOL v40 = v34 < v36;
            if (v39) {
              BOOL v40 = v39 < 0;
            }
            if (!v40) {
              break;
            }
          }
          uint64_t v27 = v31 + 1;
          uint64_t v28 = v31[1];
          unint64_t v29 = *(const void ***)(v28 + 8);
          unsigned int v41 = v31;
          if (!v29) {
            goto LABEL_55;
          }
        }
        unsigned int v41 = v31 - 1;
        uint64_t v27 = v31;
LABEL_55:
        k = v335;
        if (v41 == v10)
        {
LABEL_591:
          if (v27 < a2)
          {
            uint64_t v53 = v340;
            for (k = v335; ; --k)
            {
              uint64_t v54 = *(void *)(*k + 8);
              if (v54)
              {
                if (!v53) {
                  goto LABEL_104;
                }
                int v55 = *((char *)v53 + 23);
                int v56 = *(char *)(v54 + 23);
                if (v56 >= 0) {
                  size_t v57 = *(unsigned __int8 *)(v54 + 23);
                }
                else {
                  size_t v57 = *(void *)(v54 + 8);
                }
                if (v56 >= 0) {
                  uint64_t v58 = *(const void **)(*k + 8);
                }
                else {
                  uint64_t v58 = *(const void **)v54;
                }
                if (v55 >= 0) {
                  size_t v59 = *((unsigned __int8 *)v53 + 23);
                }
                else {
                  size_t v59 = (size_t)v53[1];
                }
                if (v55 >= 0) {
                  int v60 = v53;
                }
                else {
                  int v60 = *v53;
                }
                if (v59 >= v57) {
                  size_t v61 = v57;
                }
                else {
                  size_t v61 = v59;
                }
                int v62 = memcmp(v58, v60, v61);
                BOOL v63 = v57 >= v59;
                if (v62) {
                  BOOL v63 = v62 >= 0;
                }
                if (v27 >= k || !v63) {
                  goto LABEL_104;
                }
              }
              else if (v27 >= k)
              {
                goto LABEL_104;
              }
            }
          }
          k = a2;
        }
        else
        {
          while (1)
          {
            uint64_t v43 = *(void *)(*k + 8);
            if (v43)
            {
              if (!v30) {
                break;
              }
              int v44 = *((char *)v30 + 23);
              int v45 = *(char *)(v43 + 23);
              if (v45 >= 0) {
                size_t v46 = *(unsigned __int8 *)(v43 + 23);
              }
              else {
                size_t v46 = *(void *)(v43 + 8);
              }
              if (v45 >= 0) {
                uint64_t v47 = *(const void **)(*k + 8);
              }
              else {
                uint64_t v47 = *(const void **)v43;
              }
              if (v44 >= 0) {
                size_t v48 = *((unsigned __int8 *)v30 + 23);
              }
              else {
                size_t v48 = (size_t)v30[1];
              }
              if (v44 >= 0) {
                unsigned int v49 = v30;
              }
              else {
                unsigned int v49 = *v30;
              }
              if (v48 >= v46) {
                size_t v50 = v46;
              }
              else {
                size_t v50 = v48;
              }
              int v51 = memcmp(v47, v49, v50);
              BOOL v52 = v46 < v48;
              if (v51) {
                BOOL v52 = v51 < 0;
              }
              if (v52) {
                break;
              }
            }
            --k;
          }
        }
LABEL_104:
        int i = v27;
        if (v27 < k)
        {
          uint64_t v64 = *k;
          int i = v27;
          unint64_t v65 = (unint64_t)k;
          do
          {
            sub_2638C1DF8(v28, v64);
            uint64_t v66 = i[1];
            ++i;
            uint64_t v28 = v66;
            uint64_t v67 = *(const void ***)(v66 + 8);
            for (m = v340; v67; uint64_t v67 = *(const void ***)(v78 + 8))
            {
              if (m)
              {
                int v69 = *((char *)m + 23);
                int v70 = *((char *)v67 + 23);
                if (v70 >= 0) {
                  size_t v71 = *((unsigned __int8 *)v67 + 23);
                }
                else {
                  size_t v71 = (size_t)v67[1];
                }
                if (v70 >= 0) {
                  uint64_t v72 = v67;
                }
                else {
                  uint64_t v72 = *v67;
                }
                if (v69 >= 0) {
                  size_t v73 = *((unsigned __int8 *)m + 23);
                }
                else {
                  size_t v73 = (size_t)m[1];
                }
                if (v69 >= 0) {
                  char v74 = m;
                }
                else {
                  char v74 = *m;
                }
                if (v73 >= v71) {
                  size_t v75 = v71;
                }
                else {
                  size_t v75 = v73;
                }
                int v76 = memcmp(v72, v74, v75);
                BOOL v77 = v71 < v73;
                if (v76) {
                  BOOL v77 = v76 < 0;
                }
                if (!v77) {
                  break;
                }
              }
              uint64_t v78 = i[1];
              ++i;
              uint64_t v28 = v78;
            }
            do
            {
              do
              {
                uint64_t v79 = *(void *)(v65 - 8);
                v65 -= 8;
                uint64_t v64 = v79;
                uint64_t v80 = *(const void ***)(v79 + 8);
              }
              while (!v80);
              if (!m) {
                break;
              }
              int v81 = *((char *)m + 23);
              int v82 = *((char *)v80 + 23);
              if (v82 >= 0) {
                size_t v83 = *((unsigned __int8 *)v80 + 23);
              }
              else {
                size_t v83 = (size_t)v80[1];
              }
              if (v82 >= 0) {
                uint64_t v84 = v80;
              }
              else {
                uint64_t v84 = *v80;
              }
              if (v81 >= 0) {
                size_t v85 = *((unsigned __int8 *)m + 23);
              }
              else {
                size_t v85 = (size_t)m[1];
              }
              if (v81 >= 0) {
                uint64_t v86 = m;
              }
              else {
                uint64_t v86 = *m;
              }
              if (v85 >= v83) {
                size_t v87 = v83;
              }
              else {
                size_t v87 = v85;
              }
              int v88 = memcmp(v84, v86, v87);
              BOOL v89 = v83 < v85;
              if (v88) {
                BOOL v89 = v88 < 0;
              }
            }
            while (!v89);
          }
          while ((unint64_t)i < v65);
        }
        __n128 v90 = i - 1;
        unsigned int v8 = v337;
        if (i - 1 != v337) {
          sub_2638C1EA4(*v337, *v90);
        }
        sub_2638C1EA4(*v90, (uint64_t)v339);
        sub_2638C1DBC((PB::Base *)v339);
        a2 = v334;
        if (v27 >= k) {
          break;
        }
LABEL_153:
        uint64_t result = sub_2638B78B4(v337, i - 1, a3, a4 & 1);
        a4 = 0;
      }
      char v91 = sub_2638B8ED8(v337, i - 1);
      uint64_t result = sub_2638B8ED8(i, v334);
      if (result) {
        break;
      }
      if ((v91 & 1) == 0) {
        goto LABEL_153;
      }
    }
    a2 = i - 1;
    if ((v91 & 1) == 0) {
      continue;
    }
    return result;
  }
}

uint64_t sub_2638B89B8(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t result = sub_2638B91FC(a1, a2, a3, a4);
  uint64_t v11 = *a5;
  uint64_t v12 = *(void *)(v11 + 8);
  if (v12)
  {
    uint64_t v13 = *a4;
    uint64_t v14 = *(void *)(*a4 + 8);
    if (!v14) {
      goto LABEL_21;
    }
    int v15 = *(char *)(v14 + 23);
    int v16 = *(char *)(v12 + 23);
    if (v16 >= 0) {
      size_t v17 = *(unsigned __int8 *)(v12 + 23);
    }
    else {
      size_t v17 = *(void *)(v12 + 8);
    }
    if (v16 >= 0) {
      int v18 = *(const void **)(v11 + 8);
    }
    else {
      int v18 = *(const void **)v12;
    }
    if (v15 >= 0) {
      size_t v19 = *(unsigned __int8 *)(v14 + 23);
    }
    else {
      size_t v19 = *(void *)(v14 + 8);
    }
    if (v15 >= 0) {
      size_t v20 = *(const void **)(*a4 + 8);
    }
    else {
      size_t v20 = *(const void **)v14;
    }
    if (v19 >= v17) {
      size_t v21 = v17;
    }
    else {
      size_t v21 = v19;
    }
    uint64_t result = memcmp(v18, v20, v21);
    BOOL v22 = v17 < v19;
    if (result) {
      BOOL v22 = (int)result < 0;
    }
    if (v22)
    {
LABEL_21:
      uint64_t result = sub_2638C1DF8(v13, v11);
      uint64_t v23 = *a4;
      uint64_t v24 = *(void *)(v23 + 8);
      if (v24)
      {
        uint64_t v25 = *a3;
        uint64_t v26 = *(void *)(*a3 + 8);
        if (!v26) {
          goto LABEL_41;
        }
        int v27 = *(char *)(v26 + 23);
        int v28 = *(char *)(v24 + 23);
        if (v28 >= 0) {
          size_t v29 = *(unsigned __int8 *)(v24 + 23);
        }
        else {
          size_t v29 = *(void *)(v24 + 8);
        }
        if (v28 >= 0) {
          uint64_t v30 = *(const void **)(v23 + 8);
        }
        else {
          uint64_t v30 = *(const void **)v24;
        }
        if (v27 >= 0) {
          size_t v31 = *(unsigned __int8 *)(v26 + 23);
        }
        else {
          size_t v31 = *(void *)(v26 + 8);
        }
        if (v27 >= 0) {
          int v32 = *(const void **)(*a3 + 8);
        }
        else {
          int v32 = *(const void **)v26;
        }
        if (v31 >= v29) {
          size_t v33 = v29;
        }
        else {
          size_t v33 = v31;
        }
        uint64_t result = memcmp(v30, v32, v33);
        BOOL v34 = v29 < v31;
        if (result) {
          BOOL v34 = (int)result < 0;
        }
        if (v34)
        {
LABEL_41:
          uint64_t result = sub_2638C1DF8(v25, v23);
          uint64_t v35 = *a3;
          uint64_t v36 = *(void *)(v35 + 8);
          if (v36)
          {
            uint64_t v37 = *a2;
            uint64_t v38 = *(void *)(*a2 + 8);
            if (!v38) {
              goto LABEL_61;
            }
            int v39 = *(char *)(v38 + 23);
            int v40 = *(char *)(v36 + 23);
            if (v40 >= 0) {
              size_t v41 = *(unsigned __int8 *)(v36 + 23);
            }
            else {
              size_t v41 = *(void *)(v36 + 8);
            }
            if (v40 >= 0) {
              unint64_t v42 = *(const void **)(v35 + 8);
            }
            else {
              unint64_t v42 = *(const void **)v36;
            }
            if (v39 >= 0) {
              size_t v43 = *(unsigned __int8 *)(v38 + 23);
            }
            else {
              size_t v43 = *(void *)(v38 + 8);
            }
            if (v39 >= 0) {
              int v44 = *(const void **)(*a2 + 8);
            }
            else {
              int v44 = *(const void **)v38;
            }
            if (v43 >= v41) {
              size_t v45 = v41;
            }
            else {
              size_t v45 = v43;
            }
            uint64_t result = memcmp(v42, v44, v45);
            BOOL v46 = v41 < v43;
            if (result) {
              BOOL v46 = (int)result < 0;
            }
            if (v46)
            {
LABEL_61:
              uint64_t result = sub_2638C1DF8(v37, v35);
              uint64_t v47 = *a2;
              uint64_t v48 = *(void *)(v47 + 8);
              if (v48)
              {
                uint64_t v49 = *a1;
                uint64_t v50 = *(void *)(v49 + 8);
                if (!v50) {
                  goto LABEL_81;
                }
                int v51 = *(char *)(v50 + 23);
                int v52 = *(char *)(v48 + 23);
                if (v52 >= 0) {
                  size_t v53 = *(unsigned __int8 *)(v48 + 23);
                }
                else {
                  size_t v53 = *(void *)(v48 + 8);
                }
                if (v52 >= 0) {
                  uint64_t v54 = *(const void **)(v47 + 8);
                }
                else {
                  uint64_t v54 = *(const void **)v48;
                }
                if (v51 >= 0) {
                  size_t v55 = *(unsigned __int8 *)(v50 + 23);
                }
                else {
                  size_t v55 = *(void *)(v50 + 8);
                }
                if (v51 >= 0) {
                  int v56 = *(const void **)(v49 + 8);
                }
                else {
                  int v56 = *(const void **)v50;
                }
                if (v55 >= v53) {
                  size_t v57 = v53;
                }
                else {
                  size_t v57 = v55;
                }
                uint64_t result = memcmp(v54, v56, v57);
                BOOL v58 = v53 < v55;
                if (result) {
                  BOOL v58 = (int)result < 0;
                }
                if (v58)
                {
LABEL_81:
                  return sub_2638C1DF8(v49, v47);
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_2638B8C18(uint64_t result, uint64_t *a2, uint64_t *a3)
{
  uint64_t v5 = result;
  uint64_t v6 = *a2;
  unsigned int v7 = *(const void ***)(*a2 + 8);
  if (!v7)
  {
    uint64_t v31 = *a3;
    if (!*(void *)(*a3 + 8)) {
      return result;
    }
LABEL_77:
    uint64_t result = sub_2638C1DF8(v6, v31);
    uint64_t v50 = *a2;
    uint64_t v51 = *(void *)(v50 + 8);
    if (v51)
    {
      uint64_t v52 = *(void *)v5;
      size_t v53 = *(const void ***)(*(void *)v5 + 8);
      if (!v53) {
        goto LABEL_97;
      }
      int v54 = *((char *)v53 + 23);
      int v55 = *(char *)(v51 + 23);
      if (v55 >= 0) {
        size_t v56 = *(unsigned __int8 *)(v51 + 23);
      }
      else {
        size_t v56 = *(void *)(v51 + 8);
      }
      if (v55 >= 0) {
        size_t v57 = *(const void **)(v50 + 8);
      }
      else {
        size_t v57 = *(const void **)v51;
      }
      if (v54 >= 0) {
        size_t v58 = *((unsigned __int8 *)v53 + 23);
      }
      else {
        size_t v58 = (size_t)v53[1];
      }
      if (v54 >= 0) {
        size_t v59 = v53;
      }
      else {
        size_t v59 = *v53;
      }
      if (v58 >= v56) {
        size_t v60 = v56;
      }
      else {
        size_t v60 = v58;
      }
      uint64_t result = memcmp(v57, v59, v60);
      BOOL v61 = v56 < v58;
      if (result) {
        BOOL v61 = (int)result < 0;
      }
      if (v61)
      {
LABEL_97:
        uint64_t v29 = v52;
        uint64_t v30 = v50;
        goto LABEL_98;
      }
    }
    return result;
  }
  uint64_t v8 = *(void *)result;
  uint64_t v9 = *(void *)(*(void *)result + 8);
  if (v9)
  {
    int v10 = *(char *)(v9 + 23);
    int v11 = *((char *)v7 + 23);
    if (v11 >= 0) {
      size_t v12 = *((unsigned __int8 *)v7 + 23);
    }
    else {
      size_t v12 = (size_t)v7[1];
    }
    if (v11 >= 0) {
      uint64_t v13 = *(const void **)(*a2 + 8);
    }
    else {
      uint64_t v13 = *v7;
    }
    if (v10 >= 0) {
      size_t v14 = *(unsigned __int8 *)(v9 + 23);
    }
    else {
      size_t v14 = *(void *)(v9 + 8);
    }
    if (v10 >= 0) {
      int v15 = *(const void **)(*(void *)result + 8);
    }
    else {
      int v15 = *(const void **)v9;
    }
    if (v14 >= v12) {
      size_t v16 = v12;
    }
    else {
      size_t v16 = v14;
    }
    uint64_t result = memcmp(v13, v15, v16);
    BOOL v17 = v12 < v14;
    if (result) {
      BOOL v17 = (int)result < 0;
    }
    if (!v17)
    {
      uint64_t v31 = *a3;
      uint64_t v44 = *(void *)(v31 + 8);
      if (!v44) {
        return result;
      }
      int v45 = *(char *)(v44 + 23);
      if (v45 >= 0) {
        size_t v46 = *(unsigned __int8 *)(v44 + 23);
      }
      else {
        size_t v46 = *(void *)(v44 + 8);
      }
      if (v45 >= 0) {
        uint64_t v47 = *(const void **)(v31 + 8);
      }
      else {
        uint64_t v47 = *(const void **)v44;
      }
      if (v12 >= v46) {
        size_t v48 = v46;
      }
      else {
        size_t v48 = v12;
      }
      uint64_t result = memcmp(v47, v13, v48);
      BOOL v49 = v46 < v12;
      if (result) {
        BOOL v49 = (int)result < 0;
      }
      if (!v49) {
        return result;
      }
      goto LABEL_77;
    }
  }
  uint64_t v18 = *a3;
  uint64_t v19 = *(void *)(*a3 + 8);
  if (v19)
  {
    int v20 = *((char *)v7 + 23);
    int v21 = *(char *)(v19 + 23);
    if (v21 >= 0) {
      size_t v22 = *(unsigned __int8 *)(v19 + 23);
    }
    else {
      size_t v22 = *(void *)(v19 + 8);
    }
    if (v21 >= 0) {
      uint64_t v23 = *(const void **)(*a3 + 8);
    }
    else {
      uint64_t v23 = *(const void **)v19;
    }
    if (v20 >= 0) {
      size_t v24 = *((unsigned __int8 *)v7 + 23);
    }
    else {
      size_t v24 = (size_t)v7[1];
    }
    if (v20 >= 0) {
      uint64_t v25 = v7;
    }
    else {
      uint64_t v25 = *v7;
    }
    if (v24 >= v22) {
      size_t v26 = v22;
    }
    else {
      size_t v26 = v24;
    }
    int v27 = memcmp(v23, v25, v26);
    BOOL v28 = v22 < v24;
    if (v27) {
      BOOL v28 = v27 < 0;
    }
    if (v28)
    {
      uint64_t v29 = v8;
      uint64_t v30 = v18;
LABEL_98:
      return sub_2638C1DF8(v29, v30);
    }
  }
  uint64_t result = sub_2638C1DF8(v8, v6);
  uint64_t v32 = *a3;
  uint64_t v33 = *(void *)(*a3 + 8);
  if (v33)
  {
    uint64_t v34 = *a2;
    uint64_t v35 = *(void *)(v34 + 8);
    if (!v35) {
      goto LABEL_63;
    }
    int v36 = *(char *)(v35 + 23);
    int v37 = *(char *)(v33 + 23);
    if (v37 >= 0) {
      size_t v38 = *(unsigned __int8 *)(v33 + 23);
    }
    else {
      size_t v38 = *(void *)(v33 + 8);
    }
    if (v37 >= 0) {
      int v39 = *(const void **)(*a3 + 8);
    }
    else {
      int v39 = *(const void **)v33;
    }
    if (v36 >= 0) {
      size_t v40 = *(unsigned __int8 *)(v35 + 23);
    }
    else {
      size_t v40 = *(void *)(v35 + 8);
    }
    if (v36 >= 0) {
      size_t v41 = *(const void **)(v34 + 8);
    }
    else {
      size_t v41 = *(const void **)v35;
    }
    if (v40 >= v38) {
      size_t v42 = v38;
    }
    else {
      size_t v42 = v40;
    }
    uint64_t result = memcmp(v39, v41, v42);
    BOOL v43 = v38 < v40;
    if (result) {
      BOOL v43 = (int)result < 0;
    }
    if (v43)
    {
LABEL_63:
      uint64_t v29 = v34;
      uint64_t v30 = v32;
      goto LABEL_98;
    }
  }
  return result;
}

uint64_t sub_2638B8ED8(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = a2;
  BOOL v4 = 1;
  switch(a2 - a1)
  {
    case 0:
    case 1:
      return v4;
    case 2:
      uint64_t v5 = *(a2 - 1);
      uint64_t v6 = *(void *)(v5 + 8);
      if (v6)
      {
        uint64_t v7 = *a1;
        uint64_t v8 = *(void *)(*a1 + 8);
        if (!v8) {
          goto LABEL_22;
        }
        int v9 = *(char *)(v8 + 23);
        int v10 = *(char *)(v6 + 23);
        unint64_t v11 = v10 >= 0 ? *(unsigned __int8 *)(v6 + 23) : *(void *)(v6 + 8);
        size_t v12 = v10 >= 0 ? *(const void **)(v5 + 8) : *(const void **)v6;
        unint64_t v13 = v9 >= 0 ? *(unsigned __int8 *)(v8 + 23) : *(void *)(v8 + 8);
        size_t v14 = v9 >= 0 ? *(const void **)(v7 + 8) : *(const void **)v8;
        size_t v15 = v13 >= v11 ? v11 : v13;
        int v16 = memcmp(v12, v14, v15);
        BOOL v17 = v11 < v13;
        if (v16) {
          BOOL v17 = v16 < 0;
        }
        if (v17) {
LABEL_22:
        }
          sub_2638C1DF8(v7, v5);
        return 1;
      }
      return v4;
    case 3:
      sub_2638B8C18((uint64_t)a1, a1 + 1, a2 - 1);
      return v4;
    case 4:
      sub_2638B91FC(a1, a1 + 1, a1 + 2, a2 - 1);
      return v4;
    case 5:
      sub_2638B89B8(a1, a1 + 1, a1 + 2, a1 + 3, a2 - 1);
      return v4;
    default:
      uint64_t v18 = a1 + 2;
      sub_2638B8C18((uint64_t)a1, a1 + 1, a1 + 2);
      uint64_t v19 = a1 + 3;
      if (a1 + 3 == v2) {
        return 1;
      }
      uint64_t v20 = 0;
      int v21 = 0;
      size_t v48 = v2;
      break;
  }
  while (1)
  {
    size_t v22 = v18;
    uint64_t v18 = v19;
    uint64_t v23 = *v19;
    size_t v24 = *(const void ***)(*v19 + 8);
    if (!v24) {
      goto LABEL_74;
    }
    uint64_t v25 = *(void *)(*v22 + 8);
    if (v25)
    {
      int v26 = *(char *)(v25 + 23);
      int v27 = *((char *)v24 + 23);
      if (v27 >= 0) {
        size_t v28 = *((unsigned __int8 *)v24 + 23);
      }
      else {
        size_t v28 = (size_t)v24[1];
      }
      if (v27 >= 0) {
        uint64_t v29 = v24;
      }
      else {
        uint64_t v29 = *v24;
      }
      if (v26 >= 0) {
        size_t v30 = *(unsigned __int8 *)(v25 + 23);
      }
      else {
        size_t v30 = *(void *)(v25 + 8);
      }
      if (v26 >= 0) {
        uint64_t v31 = *(const void **)(*v22 + 8);
      }
      else {
        uint64_t v31 = *(const void **)v25;
      }
      if (v30 >= v28) {
        size_t v32 = v28;
      }
      else {
        size_t v32 = v30;
      }
      int v33 = memcmp(v29, v31, v32);
      uint64_t v2 = v48;
      BOOL v34 = v28 < v30;
      if (v33) {
        BOOL v34 = v33 < 0;
      }
      if (!v34) {
        goto LABEL_74;
      }
    }
    sub_2638C1EA0(v49, v23);
    sub_2638C1EA4(*v18, *v22);
    if (v22 == a1)
    {
      size_t v22 = a1;
    }
    else
    {
      uint64_t v35 = v20;
      while (v50)
      {
        uint64_t v36 = *(uint64_t *)((char *)a1 + v35 + 8);
        uint64_t v37 = *(void *)(v36 + 8);
        if (v37)
        {
          int v38 = *(char *)(v37 + 23);
          int v39 = *((char *)v50 + 23);
          if (v39 >= 0) {
            size_t v40 = *((unsigned __int8 *)v50 + 23);
          }
          else {
            size_t v40 = (size_t)v50[1];
          }
          if (v39 >= 0) {
            size_t v41 = v50;
          }
          else {
            size_t v41 = *v50;
          }
          if (v38 >= 0) {
            size_t v42 = *(unsigned __int8 *)(v37 + 23);
          }
          else {
            size_t v42 = *(void *)(v37 + 8);
          }
          if (v38 >= 0) {
            BOOL v43 = *(const void **)(v36 + 8);
          }
          else {
            BOOL v43 = *(const void **)v37;
          }
          if (v42 >= v40) {
            size_t v44 = v40;
          }
          else {
            size_t v44 = v42;
          }
          int v45 = memcmp(v41, v43, v44);
          BOOL v46 = v40 < v42;
          if (v45) {
            BOOL v46 = v45 < 0;
          }
          if (!v46)
          {
            size_t v22 = (uint64_t *)((char *)a1 + v35 + 16);
            break;
          }
        }
        --v22;
        sub_2638C1EA4(*(uint64_t *)((char *)a1 + v35 + 16), v36);
        v35 -= 8;
        if (v35 == -16)
        {
          size_t v22 = a1;
          break;
        }
      }
      uint64_t v2 = v48;
    }
    sub_2638C1EA4(*v22, (uint64_t)v49);
    if (++v21 == 8) {
      break;
    }
    sub_2638C1DBC((PB::Base *)v49);
LABEL_74:
    uint64_t v19 = v18 + 1;
    v20 += 8;
    if (v18 + 1 == v2) {
      return 1;
    }
  }
  BOOL v4 = v18 + 1 == v2;
  sub_2638C1DBC((PB::Base *)v49);
  return v4;
}

uint64_t sub_2638B91FC(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t result = sub_2638B8C18((uint64_t)a1, a2, a3);
  uint64_t v9 = *a4;
  uint64_t v10 = *(void *)(v9 + 8);
  if (v10)
  {
    uint64_t v11 = *a3;
    uint64_t v12 = *(void *)(*a3 + 8);
    if (!v12) {
      goto LABEL_21;
    }
    int v13 = *(char *)(v12 + 23);
    int v14 = *(char *)(v10 + 23);
    if (v14 >= 0) {
      size_t v15 = *(unsigned __int8 *)(v10 + 23);
    }
    else {
      size_t v15 = *(void *)(v10 + 8);
    }
    if (v14 >= 0) {
      int v16 = *(const void **)(v9 + 8);
    }
    else {
      int v16 = *(const void **)v10;
    }
    if (v13 >= 0) {
      size_t v17 = *(unsigned __int8 *)(v12 + 23);
    }
    else {
      size_t v17 = *(void *)(v12 + 8);
    }
    if (v13 >= 0) {
      uint64_t v18 = *(const void **)(*a3 + 8);
    }
    else {
      uint64_t v18 = *(const void **)v12;
    }
    if (v17 >= v15) {
      size_t v19 = v15;
    }
    else {
      size_t v19 = v17;
    }
    uint64_t result = memcmp(v16, v18, v19);
    BOOL v20 = v15 < v17;
    if (result) {
      BOOL v20 = (int)result < 0;
    }
    if (v20)
    {
LABEL_21:
      uint64_t result = sub_2638C1DF8(v11, v9);
      uint64_t v21 = *a3;
      uint64_t v22 = *(void *)(v21 + 8);
      if (v22)
      {
        uint64_t v23 = *a2;
        uint64_t v24 = *(void *)(*a2 + 8);
        if (!v24) {
          goto LABEL_41;
        }
        int v25 = *(char *)(v24 + 23);
        int v26 = *(char *)(v22 + 23);
        if (v26 >= 0) {
          size_t v27 = *(unsigned __int8 *)(v22 + 23);
        }
        else {
          size_t v27 = *(void *)(v22 + 8);
        }
        if (v26 >= 0) {
          size_t v28 = *(const void **)(v21 + 8);
        }
        else {
          size_t v28 = *(const void **)v22;
        }
        if (v25 >= 0) {
          size_t v29 = *(unsigned __int8 *)(v24 + 23);
        }
        else {
          size_t v29 = *(void *)(v24 + 8);
        }
        if (v25 >= 0) {
          size_t v30 = *(const void **)(*a2 + 8);
        }
        else {
          size_t v30 = *(const void **)v24;
        }
        if (v29 >= v27) {
          size_t v31 = v27;
        }
        else {
          size_t v31 = v29;
        }
        uint64_t result = memcmp(v28, v30, v31);
        BOOL v32 = v27 < v29;
        if (result) {
          BOOL v32 = (int)result < 0;
        }
        if (v32)
        {
LABEL_41:
          uint64_t result = sub_2638C1DF8(v23, v21);
          uint64_t v33 = *a2;
          uint64_t v34 = *(void *)(v33 + 8);
          if (v34)
          {
            uint64_t v35 = *a1;
            uint64_t v36 = *(void *)(v35 + 8);
            if (!v36) {
              goto LABEL_61;
            }
            int v37 = *(char *)(v36 + 23);
            int v38 = *(char *)(v34 + 23);
            if (v38 >= 0) {
              size_t v39 = *(unsigned __int8 *)(v34 + 23);
            }
            else {
              size_t v39 = *(void *)(v34 + 8);
            }
            if (v38 >= 0) {
              size_t v40 = *(const void **)(v33 + 8);
            }
            else {
              size_t v40 = *(const void **)v34;
            }
            if (v37 >= 0) {
              size_t v41 = *(unsigned __int8 *)(v36 + 23);
            }
            else {
              size_t v41 = *(void *)(v36 + 8);
            }
            if (v37 >= 0) {
              size_t v42 = *(const void **)(v35 + 8);
            }
            else {
              size_t v42 = *(const void **)v36;
            }
            if (v41 >= v39) {
              size_t v43 = v39;
            }
            else {
              size_t v43 = v41;
            }
            uint64_t result = memcmp(v40, v42, v43);
            BOOL v44 = v39 < v41;
            if (result) {
              BOOL v44 = (int)result < 0;
            }
            if (v44)
            {
LABEL_61:
              return sub_2638C1DF8(v35, v33);
            }
          }
        }
      }
    }
  }
  return result;
}

std::string *sub_2638B93DC(uint64_t a1)
{
  return std::string::append(*(std::string **)a1, 2 * *(void *)(a1 + 8), 32);
}

void sub_2638B93F0(uint64_t a1, const std::string::value_type *a2, uint64_t a3)
{
  std::string::append(*(std::string **)a1, 2 * *(void *)(a1 + 8), 32);
  std::string::append(*(std::string **)a1, a2);
  std::string::append(*(std::string **)a1, ": ");
  int v6 = *(char *)(a3 + 23);
  if (v6 >= 0) {
    uint64_t v7 = (const std::string::value_type *)a3;
  }
  else {
    uint64_t v7 = *(const std::string::value_type **)a3;
  }
  if (v6 >= 0) {
    std::string::size_type v8 = *(unsigned __int8 *)(a3 + 23);
  }
  else {
    std::string::size_type v8 = *(void *)(a3 + 8);
  }
  std::string::append(*(std::string **)a1, v7, v8);
  uint64_t v9 = *(std::string **)a1;

  std::string::push_back(v9, 10);
}

const char *sub_2638B9488(uint64_t a1, int a2)
{
  if (a2) {
    return "true";
  }
  else {
    return "false";
  }
}

std::string *sub_2638B94A4@<X0>(uint64_t __val@<X1>, std::string *a2@<X8>)
{
  return std::to_string(a2, __val);
}

std::string *sub_2638B94AC@<X0>(unint64_t __val@<X1>, std::string *a2@<X8>)
{
  return std::to_string(a2, __val);
}

std::string *sub_2638B94B4@<X0>(int __val@<W1>, std::string *a2@<X8>)
{
  return std::to_string(a2, __val);
}

std::string *sub_2638B94BC@<X0>(unsigned int __val@<W1>, std::string *a2@<X8>)
{
  return std::to_string(a2, __val);
}

void sub_2638B94CC(unsigned __int8 *a1@<X1>, std::string *a2@<X8>)
{
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  uint64_t v4 = a1[23];
  if ((v4 & 0x80u) != 0) {
    uint64_t v4 = *((void *)a1 + 1);
  }
  std::string::reserve(a2, v4 + 2);
  std::string::push_back(a2, 34);
  int v5 = (char)a1[23];
  if (v5 >= 0) {
    int v6 = a1;
  }
  else {
    int v6 = *(unsigned __int8 **)a1;
  }
  if (v5 >= 0) {
    uint64_t v7 = a1[23];
  }
  else {
    uint64_t v7 = *((void *)a1 + 1);
  }
  if (v7)
  {
    char v8 = 0;
    uint64_t v9 = MEMORY[0x263EF8318];
    do
    {
      unint64_t v10 = *v6;
      std::string::value_type v11 = v10;
      if ((char)v10 > 33)
      {
        switch((char)v10)
        {
          case '""':
            std::string::push_back(a2, 92);
            std::string::value_type v11 = 34;
            goto LABEL_30;
          case '\'':
            std::string::push_back(a2, 92);
            std::string::value_type v11 = 39;
            goto LABEL_30;
          case '\\':
            std::string::push_back(a2, 92);
            goto LABEL_30;
        }
      }
      else
      {
        switch((char)v10)
        {
          case 9:
            std::string::push_back(a2, 92);
            std::string::value_type v11 = 116;
            goto LABEL_30;
          case 10:
            std::string::push_back(a2, 92);
            std::string::value_type v11 = 110;
            goto LABEL_30;
          case 13:
            std::string::push_back(a2, 92);
            std::string::value_type v11 = 114;
            goto LABEL_30;
        }
      }
      if ((char)v10 < 0) {
        int v12 = __maskrune((char)v10, 0x40000uLL);
      }
      else {
        int v12 = *(_DWORD *)(v9 + 4 * (char)v10 + 60) & 0x40000;
      }
      if (!v12
        || (v10 & 0x80u) == 0
        && (v8 & 1) != 0
        && (*(_DWORD *)(v9 + 4 * (char)v10 + 60) & 0x10000) != 0)
      {
        std::string::push_back(a2, 92);
        std::string::push_back(a2, 120);
        sub_2638C3AD0(v10, 2uLL, &__p);
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          p_p = &__p;
        }
        else {
          p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
        }
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type size = __p.__r_.__value_.__l.__size_;
        }
        std::string::append(a2, (const std::string::value_type *)p_p, size);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        char v8 = 1;
        goto LABEL_31;
      }
LABEL_30:
      std::string::push_back(a2, v11);
      char v8 = 0;
LABEL_31:
      ++v6;
      --v7;
    }
    while (v7);
  }
  std::string::push_back(a2, 34);
}

void sub_2638B96F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (*(char *)(v15 + 23) < 0) {
    operator delete(*(void **)v15);
  }
  _Unwind_Resume(exception_object);
}

std::string *sub_2638B9730@<X0>(unint64_t __val@<X2>, unsigned char *a2@<X1>, std::string *a3@<X8>)
{
  return sub_2638B973C(__val, a2, a3);
}

std::string *sub_2638B973C@<X0>(unint64_t __val@<X1>, unsigned char *a2@<X0>, std::string *a3@<X8>)
{
  unint64_t v3 = __val;
  std::to_string(&v16, __val);
  int v6 = std::string::insert(&v16, 0, "[");
  long long v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
  v17.__r_.__value_.__r.__words[2] = v6->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v17.__r_.__value_.__l.__data_ = v7;
  v6->__r_.__value_.__l.__size_ = 0;
  v6->__r_.__value_.__r.__words[2] = 0;
  v6->__r_.__value_.__r.__words[0] = 0;
  char v8 = std::string::append(&v17, " bytes] ");
  long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
  a3->__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
  *(_OWORD *)&a3->__r_.__value_.__l.__data_ = v9;
  v8->__r_.__value_.__l.__size_ = 0;
  v8->__r_.__value_.__r.__words[2] = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v17.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v16.__r_.__value_.__l.__data_);
  }
  std::string::size_type size = HIBYTE(a3->__r_.__value_.__r.__words[2]);
  if ((size & 0x80u) != 0) {
    std::string::size_type size = a3->__r_.__value_.__l.__size_;
  }
  std::string::reserve(a3, size + 3 * v3);
  for (; v3; --v3)
  {
    std::string::push_back(a3, a0123456789abcd[(unint64_t)*a2 >> 4]);
    std::string::push_back(a3, a0123456789abcd[*a2 & 0xF]);
    std::string::push_back(a3, 32);
    ++a2;
  }
  uint64_t v11 = HIBYTE(a3->__r_.__value_.__r.__words[2]);
  int v12 = (char)v11;
  std::string::size_type v13 = (std::string::size_type)a3 + v11;
  if (v12 >= 0)
  {
    std::string::size_type v14 = (std::string::size_type)a3;
  }
  else
  {
    std::string::size_type v13 = a3->__r_.__value_.__r.__words[0] + a3->__r_.__value_.__l.__size_;
    std::string::size_type v14 = a3->__r_.__value_.__r.__words[0];
  }
  return std::string::erase(a3, ~v14 + v13, 1uLL);
}

void sub_2638B9898(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (*(char *)(v21 + 23) < 0) {
    operator delete(*(void **)v21);
  }
  _Unwind_Resume(exception_object);
}

void sCreateWISMetadataLoaderForXpcConversion(void)
{
  int v0 = 1;
  sCreateBestChoiceMetadataLoaderDelegate();
}

void sub_2638B9964(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9) {
    sub_2638C4FA8();
  }
  _Unwind_Resume(exception_object);
}

void sCreateLazyWISMetadataLoaderForXpcConversion(void)
{
  int v0 = 1;
  sCreateLazyMetadataLoaderDelegate();
}

void sub_2638B99FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9) {
    sub_2638C4FA8();
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_2638B9B68(uint64_t a1)
{
  sub_26389B614(a1 + 48);
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 16);
  if (v2) {
    sub_26389F6D4(v2);
  }
  xpc_release(*(xpc_object_t *)a1);
  *(void *)a1 = 0;
  return a1;
}

void sub_2638B9BB0(void *a1, uint64_t a2, long long *a3, unsigned int a4)
{
  long long v13 = *a3;
  uint64_t v14 = *((void *)a3 + 2);
  char v8 = sub_2638A1CF8((uint64_t)a1, (MetadataHandle *)&v13, a4);
  sub_2638BB108(*(void **)a2, *(void *)(a2 + 8) - *(void *)a2, &object);
  long long v10 = *a3;
  uint64_t v11 = *((void *)a3 + 2);
  int v9 = sub_2638A1D7C((uint64_t)a1, (MetadataHandle *)&v10, a4);
  sub_2638A195C(a1, (uint64_t)v8, &object, v9);
  xpc_release(object);
}

void sub_2638B9C68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object)
{
}

void sub_2638B9C80(void *a1, uint64_t a2, unsigned int __val)
{
  std::to_string(&v8, __val);
  sub_2638A2100(a2, &v7);
  if ((v8.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    int v5 = &v8;
  }
  else {
    int v5 = (std::string *)v8.__r_.__value_.__r.__words[0];
  }
  xpc_object_t object = v7;
  if (v7) {
    xpc_retain(v7);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  sub_2638A195C(a1, (uint64_t)v5, &object, 1);
  xpc_release(object);
  xpc_object_t object = 0;
  xpc_release(v7);
  if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v8.__r_.__value_.__l.__data_);
  }
}

void sub_2638B9D3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, xpc_object_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_2638B9D80(void *a1, void *a2, size_t a3, unsigned int __val)
{
  std::to_string(&v11, __val);
  int v7 = SHIBYTE(v11.__r_.__value_.__r.__words[2]);
  std::string::size_type v8 = v11.__r_.__value_.__r.__words[0];
  sub_2638BB108(a2, a3, &object);
  if (v7 >= 0) {
    int v9 = &v11;
  }
  else {
    int v9 = (std::string *)v8;
  }
  sub_2638A195C(a1, (uint64_t)v9, &object, 1);
  xpc_release(object);
  xpc_object_t object = 0;
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v11.__r_.__value_.__l.__data_);
  }
}

void sub_2638B9E24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_2638B9E58(void *a1, uint64_t **a2, long long *a3, unsigned int a4, int a5)
{
  long long v35 = *a3;
  uint64_t v36 = *((void *)a3 + 2);
  int v9 = sub_2638A1CF8((uint64_t)a1, (MetadataHandle *)&v35, a4);
  xpc_object_t v10 = xpc_array_create(0, 0);
  if (v10 || (xpc_object_t v10 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x263E6D6E0](v10) == MEMORY[0x263EF86D8])
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
  uint64_t v23 = v9;
  xpc_release(v10);
  int v12 = *a2;
  long long v13 = a2[1];
  if (*a2 != v13)
  {
    uint64_t v14 = MEMORY[0x263EF8758];
    do
    {
      uint64_t v15 = *v12;
      xpc_object_t v16 = xpc_null_create();
      if (a5 != 11)
      {
        if (a5 == 12)
        {
          sub_2638BB00C(v15 != 0, &v34);
          std::string v17 = v34;
          xpc_object_t v34 = v16;
          xpc_release(v16);
          xpc_object_t v34 = 0;
          xpc_object_t v16 = v17;
        }
        goto LABEL_19;
      }
      long long v30 = *a3;
      uint64_t v31 = *((void *)a3 + 2);
      sub_2638A2174((uint64_t)a1, (MetadataHandle *)&v30, a4, v15, __p);
      if (v33 < 0)
      {
        if (!__p[1]) {
          goto LABEL_18;
        }
        uint64_t v18 = (char *)__p[0];
      }
      else
      {
        if (!v33) {
          goto LABEL_19;
        }
        uint64_t v18 = (char *)__p;
      }
      sub_26389B578(v18, &v29);
      size_t v19 = v29;
      xpc_object_t v29 = v16;
      xpc_release(v16);
      xpc_object_t v29 = 0;
      xpc_object_t v16 = v19;
      if (v33 < 0) {
LABEL_18:
      }
        operator delete(__p[0]);
LABEL_19:
      if (MEMORY[0x263E6D6E0](v16) == v14)
      {
        sub_2638A2100(v15, &v28);
        BOOL v20 = v28;
        xpc_object_t v28 = v16;
        xpc_release(v16);
        xpc_object_t v28 = 0;
        xpc_object_t v16 = v20;
      }
      xpc_array_append_value(v11, v16);
      xpc_release(v16);
      ++v12;
    }
    while (v12 != v13);
  }
  xpc_object_t object = v11;
  if (v11)
  {
    xpc_retain(v11);
    uint64_t v21 = (uint64_t)v23;
  }
  else
  {
    uint64_t v21 = (uint64_t)v23;
    xpc_object_t object = xpc_null_create();
  }
  long long v25 = *a3;
  uint64_t v26 = *((void *)a3 + 2);
  int v22 = sub_2638A1D7C((uint64_t)a1, (MetadataHandle *)&v25, a4);
  sub_2638A195C(a1, v21, &object, v22);
  xpc_release(object);
  xpc_object_t object = 0;
  xpc_release(v11);
}

void sub_2638BA0F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, xpc_object_t object, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  xpc_release(object);
  xpc_release(v26);
  _Unwind_Resume(a1);
}

void sub_2638BA164(void *a1, unsigned int **a2, long long *a3, unsigned int a4, int a5)
{
  long long v35 = *a3;
  uint64_t v36 = *((void *)a3 + 2);
  int v9 = sub_2638A1CF8((uint64_t)a1, (MetadataHandle *)&v35, a4);
  xpc_object_t v10 = xpc_array_create(0, 0);
  if (v10 || (xpc_object_t v10 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x263E6D6E0](v10) == MEMORY[0x263EF86D8])
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
  uint64_t v23 = v9;
  xpc_release(v10);
  int v12 = *a2;
  long long v13 = a2[1];
  if (*a2 != v13)
  {
    uint64_t v14 = MEMORY[0x263EF8758];
    do
    {
      uint64_t v15 = *v12;
      xpc_object_t v16 = xpc_null_create();
      if (a5 != 11)
      {
        if (a5 == 12)
        {
          sub_2638BB00C(v15 != 0, &v34);
          std::string v17 = v34;
          xpc_object_t v34 = v16;
          xpc_release(v16);
          xpc_object_t v34 = 0;
          xpc_object_t v16 = v17;
        }
        goto LABEL_19;
      }
      long long v30 = *a3;
      uint64_t v31 = *((void *)a3 + 2);
      sub_2638A2174((uint64_t)a1, (MetadataHandle *)&v30, a4, v15, __p);
      if (v33 < 0)
      {
        if (!__p[1]) {
          goto LABEL_18;
        }
        uint64_t v18 = (char *)__p[0];
      }
      else
      {
        if (!v33) {
          goto LABEL_19;
        }
        uint64_t v18 = (char *)__p;
      }
      sub_26389B578(v18, &v29);
      size_t v19 = v29;
      xpc_object_t v29 = v16;
      xpc_release(v16);
      xpc_object_t v29 = 0;
      xpc_object_t v16 = v19;
      if (v33 < 0) {
LABEL_18:
      }
        operator delete(__p[0]);
LABEL_19:
      if (MEMORY[0x263E6D6E0](v16) == v14)
      {
        sub_2638A1DFC(v15, &v28);
        BOOL v20 = v28;
        xpc_object_t v28 = v16;
        xpc_release(v16);
        xpc_object_t v28 = 0;
        xpc_object_t v16 = v20;
      }
      xpc_array_append_value(v11, v16);
      xpc_release(v16);
      ++v12;
    }
    while (v12 != v13);
  }
  xpc_object_t object = v11;
  if (v11)
  {
    xpc_retain(v11);
    uint64_t v21 = (uint64_t)v23;
  }
  else
  {
    uint64_t v21 = (uint64_t)v23;
    xpc_object_t object = xpc_null_create();
  }
  long long v25 = *a3;
  uint64_t v26 = *((void *)a3 + 2);
  int v22 = sub_2638A1D7C((uint64_t)a1, (MetadataHandle *)&v25, a4);
  sub_2638A195C(a1, v21, &object, v22);
  xpc_release(object);
  xpc_object_t object = 0;
  xpc_release(v11);
}

void sub_2638BA404(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, xpc_object_t object, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  xpc_release(object);
  xpc_release(v26);
  _Unwind_Resume(a1);
}

void sub_2638BA470(void *a1, uint64_t **a2, long long *a3, unsigned int a4, int a5)
{
  long long v35 = *a3;
  uint64_t v36 = *((void *)a3 + 2);
  int v9 = sub_2638A1CF8((uint64_t)a1, (MetadataHandle *)&v35, a4);
  xpc_object_t v10 = xpc_array_create(0, 0);
  if (v10 || (xpc_object_t v10 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x263E6D6E0](v10) == MEMORY[0x263EF86D8])
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
  uint64_t v23 = v9;
  xpc_release(v10);
  int v12 = *a2;
  long long v13 = a2[1];
  if (*a2 != v13)
  {
    uint64_t v14 = MEMORY[0x263EF8758];
    do
    {
      uint64_t v15 = *v12;
      xpc_object_t v16 = xpc_null_create();
      if (a5 != 11)
      {
        if (a5 == 12)
        {
          sub_2638BB00C(v15 != 0, &v34);
          std::string v17 = v34;
          xpc_object_t v34 = v16;
          xpc_release(v16);
          xpc_object_t v34 = 0;
          xpc_object_t v16 = v17;
        }
        goto LABEL_19;
      }
      long long v30 = *a3;
      uint64_t v31 = *((void *)a3 + 2);
      sub_2638A2174((uint64_t)a1, (MetadataHandle *)&v30, a4, v15, __p);
      if (v33 < 0)
      {
        if (!__p[1]) {
          goto LABEL_18;
        }
        uint64_t v18 = (char *)__p[0];
      }
      else
      {
        if (!v33) {
          goto LABEL_19;
        }
        uint64_t v18 = (char *)__p;
      }
      sub_26389B578(v18, &v29);
      size_t v19 = v29;
      xpc_object_t v29 = v16;
      xpc_release(v16);
      xpc_object_t v29 = 0;
      xpc_object_t v16 = v19;
      if (v33 < 0) {
LABEL_18:
      }
        operator delete(__p[0]);
LABEL_19:
      if (MEMORY[0x263E6D6E0](v16) == v14)
      {
        sub_2638BB04C(v15, &v28);
        BOOL v20 = v28;
        xpc_object_t v28 = v16;
        xpc_release(v16);
        xpc_object_t v28 = 0;
        xpc_object_t v16 = v20;
      }
      xpc_array_append_value(v11, v16);
      xpc_release(v16);
      ++v12;
    }
    while (v12 != v13);
  }
  xpc_object_t object = v11;
  if (v11)
  {
    xpc_retain(v11);
    uint64_t v21 = (uint64_t)v23;
  }
  else
  {
    uint64_t v21 = (uint64_t)v23;
    xpc_object_t object = xpc_null_create();
  }
  long long v25 = *a3;
  uint64_t v26 = *((void *)a3 + 2);
  int v22 = sub_2638A1D7C((uint64_t)a1, (MetadataHandle *)&v25, a4);
  sub_2638A195C(a1, v21, &object, v22);
  xpc_release(object);
  xpc_object_t object = 0;
  xpc_release(v11);
}

void sub_2638BA710(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, xpc_object_t object, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  xpc_release(object);
  xpc_release(v26);
  _Unwind_Resume(a1);
}

void sub_2638BA77C(void *a1, int **a2, long long *a3, unsigned int a4, int a5)
{
  long long v35 = *a3;
  uint64_t v36 = *((void *)a3 + 2);
  int v9 = sub_2638A1CF8((uint64_t)a1, (MetadataHandle *)&v35, a4);
  xpc_object_t v10 = xpc_array_create(0, 0);
  if (v10 || (xpc_object_t v10 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x263E6D6E0](v10) == MEMORY[0x263EF86D8])
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
  uint64_t v23 = v9;
  xpc_release(v10);
  int v12 = *a2;
  long long v13 = a2[1];
  if (*a2 != v13)
  {
    uint64_t v14 = MEMORY[0x263EF8758];
    do
    {
      uint64_t v15 = *v12;
      xpc_object_t v16 = xpc_null_create();
      if (a5 != 11)
      {
        if (a5 == 12)
        {
          sub_2638BB00C(v15 != 0, &v34);
          std::string v17 = v34;
          xpc_object_t v34 = v16;
          xpc_release(v16);
          xpc_object_t v34 = 0;
          xpc_object_t v16 = v17;
        }
        goto LABEL_19;
      }
      long long v30 = *a3;
      uint64_t v31 = *((void *)a3 + 2);
      sub_2638A2174((uint64_t)a1, (MetadataHandle *)&v30, a4, v15, __p);
      if (v33 < 0)
      {
        if (!__p[1]) {
          goto LABEL_18;
        }
        uint64_t v18 = (char *)__p[0];
      }
      else
      {
        if (!v33) {
          goto LABEL_19;
        }
        uint64_t v18 = (char *)__p;
      }
      sub_26389B578(v18, &v29);
      size_t v19 = v29;
      xpc_object_t v29 = v16;
      xpc_release(v16);
      xpc_object_t v29 = 0;
      xpc_object_t v16 = v19;
      if (v33 < 0) {
LABEL_18:
      }
        operator delete(__p[0]);
LABEL_19:
      if (MEMORY[0x263E6D6E0](v16) == v14)
      {
        sub_2638A2080(v15, &v28);
        BOOL v20 = v28;
        xpc_object_t v28 = v16;
        xpc_release(v16);
        xpc_object_t v28 = 0;
        xpc_object_t v16 = v20;
      }
      xpc_array_append_value(v11, v16);
      xpc_release(v16);
      ++v12;
    }
    while (v12 != v13);
  }
  xpc_object_t object = v11;
  if (v11)
  {
    xpc_retain(v11);
    uint64_t v21 = (uint64_t)v23;
  }
  else
  {
    uint64_t v21 = (uint64_t)v23;
    xpc_object_t object = xpc_null_create();
  }
  long long v25 = *a3;
  uint64_t v26 = *((void *)a3 + 2);
  int v22 = sub_2638A1D7C((uint64_t)a1, (MetadataHandle *)&v25, a4);
  sub_2638A195C(a1, v21, &object, v22);
  xpc_release(object);
  xpc_object_t object = 0;
  xpc_release(v11);
}

void sub_2638BAA1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, xpc_object_t object, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  xpc_release(object);
  xpc_release(v26);
  _Unwind_Resume(a1);
}

void *sub_2638BAA88@<X0>(int *a1@<X1>, uint64_t *a2@<X2>, void *a3@<X8>)
{
  int v6 = operator new(0x60uLL);
  uint64_t result = sub_2638BAAEC(v6, a1, a2);
  *a3 = v6 + 3;
  a3[1] = v6;
  return result;
}

void sub_2638BAAD8(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_2638BAAEC(void *a1, int *a2, uint64_t *a3)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_270EB73D8;
  sub_2638BAC00((uint64_t)&v5, (uint64_t)(a1 + 3), a2, a3);
  return a1;
}

void sub_2638BAB4C(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void sub_2638BAB60(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EB73D8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_2638BAB80(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EB73D8;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x263E6D460);
}

uint64_t sub_2638BABD4(uint64_t a1)
{
  return sub_2638BAC8C((uint64_t)&v2, (uint64_t *)(a1 + 24));
}

uint64_t sub_2638BAC00(uint64_t a1, uint64_t a2, int *a3, uint64_t *a4)
{
  int v5 = *a3;
  uint64_t v6 = *a4;
  *a4 = 0;
  uint64_t v9 = v6;
  double v7 = WISMetadataLoader::WISMetadataLoader(a2, v5, &v9);
  uint64_t result = v9;
  uint64_t v9 = 0;
  if (result) {
    return (*(uint64_t (**)(uint64_t, double))(*(void *)result + 8))(result, v7);
  }
  return result;
}

void sub_2638BAC70(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    sub_2638C4FA8();
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_2638BAC8C(uint64_t a1, uint64_t *a2)
{
  sub_26389B614((uint64_t)(a2 + 4));
  unint64_t v3 = (std::__shared_weak_count *)a2[3];
  if (v3) {
    sub_26389F6D4(v3);
  }
  uint64_t result = *a2;
  *a2 = 0;
  if (result)
  {
    int v5 = *(uint64_t (**)(void))(*(void *)result + 8);
    return v5();
  }
  return result;
}

void *sub_2638BAD08@<X0>(unsigned int *a1@<X1>, uint64_t *a2@<X2>, void *a3@<X8>)
{
  uint64_t v6 = operator new(0x90uLL);
  uint64_t result = sub_2638BAD6C(v6, a1, a2);
  *a3 = v6 + 3;
  a3[1] = v6;
  return result;
}

void sub_2638BAD58(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_2638BAD6C(void *a1, unsigned int *a2, uint64_t *a3)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_270EB7428;
  sub_2638BAE7C((uint64_t)&v5, (uint64_t)(a1 + 3), a2, a3);
  return a1;
}

void sub_2638BADCC(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void sub_2638BADE0(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EB7428;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_2638BAE00(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EB7428;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x263E6D460);
}

uint64_t sub_2638BAE54(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

uint64_t sub_2638BAE7C(uint64_t a1, uint64_t a2, unsigned int *a3, uint64_t *a4)
{
  uint64_t v5 = *a3;
  uint64_t v6 = *a4;
  *a4 = 0;
  uint64_t v8 = v6;
  LazyMetadataLoader::LazyMetadataLoader(a2, v5, &v8);
  uint64_t result = v8;
  uint64_t v8 = 0;
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 8))(result);
  }
  return result;
}

void sub_2638BAEEC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    sub_2638C4FA8();
  }
  _Unwind_Resume(exception_object);
}

xpc_object_t sub_2638BAF14(void **a1, void **a2, xpc_object_t *a3)
{
  uint64_t v6 = *a1;
  v11[0] = v6;
  if (v6) {
    xpc_retain(v6);
  }
  else {
    v11[0] = xpc_null_create();
  }
  v11[1] = a1[1];
  double v7 = *a2;
  v10[0] = v7;
  if (v7) {
    xpc_retain(v7);
  }
  else {
    v10[0] = xpc_null_create();
  }
  v10[1] = a2[1];
  sub_2638BB198(v11, v10, a3, object);
  xpc_object_t v8 = object[2];
  xpc_release(object[0]);
  object[0] = 0;
  xpc_release(v10[0]);
  v10[0] = 0;
  xpc_release(v11[0]);
  return v8;
}

void sub_2638BAFDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, uint64_t a11, xpc_object_t a12)
{
}

xpc_object_t sub_2638BB00C@<X0>(BOOL value@<W1>, void *a2@<X8>)
{
  xpc_object_t result = xpc_BOOL_create(value);
  *a2 = result;
  if (!result)
  {
    xpc_object_t result = xpc_null_create();
    *a2 = result;
  }
  return result;
}

xpc_object_t sub_2638BB04C@<X0>(int64_t value@<X1>, void *a2@<X8>)
{
  xpc_object_t result = xpc_int64_create(value);
  *a2 = result;
  if (!result)
  {
    xpc_object_t result = xpc_null_create();
    *a2 = result;
  }
  return result;
}

xpc_object_t sub_2638BB08C@<X0>(void *a1@<X8>, double a2@<D0>)
{
  xpc_object_t result = xpc_double_create(a2);
  *a1 = result;
  if (!result)
  {
    xpc_object_t result = xpc_null_create();
    *a1 = result;
  }
  return result;
}

xpc_object_t sub_2638BB0C8@<X0>(void *a1@<X8>, float a2@<S0>)
{
  xpc_object_t result = xpc_double_create(a2);
  *a1 = result;
  if (!result)
  {
    xpc_object_t result = xpc_null_create();
    *a1 = result;
  }
  return result;
}

xpc_object_t sub_2638BB108@<X0>(void *bytes@<X1>, size_t length@<X2>, void *a3@<X8>)
{
  xpc_object_t result = xpc_data_create(bytes, length);
  *a3 = result;
  if (!result)
  {
    xpc_object_t result = xpc_null_create();
    *a3 = result;
  }
  return result;
}

void **sub_2638BB14C(void **a1, void **a2, void *a3)
{
  uint64_t v5 = *a2;
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

void sub_2638BB198(xpc_object_t *a1@<X0>, xpc_object_t *a2@<X1>, xpc_object_t *a3@<X2>, void *a4@<X8>)
{
  v9[0] = *a1;
  *a1 = xpc_null_create();
  v9[1] = a1[1];
  object[0] = *a2;
  *a2 = xpc_null_create();
  object[1] = a2[1];
  sub_2638BB264(v9, object, a3, a4);
  xpc_release(object[0]);
  object[0] = 0;
  xpc_release(v9[0]);
}

void sub_2638BB234(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object, uint64_t a10, xpc_object_t a11)
{
}

void sub_2638BB264(xpc_object_t *a1@<X0>, xpc_object_t *a2@<X1>, xpc_object_t *a3@<X2>, void *a4@<X8>)
{
  v9[0] = *a1;
  *a1 = xpc_null_create();
  v9[1] = a1[1];
  object[0] = *a2;
  *a2 = xpc_null_create();
  object[1] = a2[1];
  sub_2638BB330(v9, object, a3, a4);
  xpc_release(object[0]);
  object[0] = 0;
  xpc_release(v9[0]);
}

void sub_2638BB300(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object, uint64_t a10, xpc_object_t a11)
{
}

void sub_2638BB330(xpc_object_t *a1@<X0>, xpc_object_t *a2@<X1>, xpc_object_t *a3@<X2>, void *a4@<X8>)
{
  xpc_object_t v8 = *a1;
  v18[0] = v8;
  if (v8) {
    xpc_retain(v8);
  }
  else {
    v18[0] = xpc_null_create();
  }
  v18[1] = a1[1];
  v17[0] = *a2;
  *a2 = xpc_null_create();
  v17[1] = a2[1];
  sub_2638BB560((uint64_t)v18, (uint64_t)v17, v19);
  xpc_release(v17[0]);
  v17[0] = 0;
  xpc_release(v18[0]);
  v18[0] = 0;
  v15[0] = v19[0];
  v19[0] = xpc_null_create();
  v15[1] = v19[1];
  object[0] = v20;
  xpc_object_t v20 = xpc_null_create();
  object[1] = v21;
  sub_2638BB670((uint64_t)v15, object, a3, v16);
  xpc_release(object[0]);
  object[0] = 0;
  xpc_release(v15[0]);
  v15[0] = 0;
  v12[0] = *a1;
  *a1 = xpc_null_create();
  v12[1] = a1[1];
  v11[0] = v16[0];
  v16[0] = xpc_null_create();
  v11[1] = v16[1];
  sub_2638BB730(v12, v11, v13);
  xpc_object_t v9 = v16[2];
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
  xpc_release(v16[0]);
  xpc_release(v20);
  xpc_object_t v20 = 0;
  xpc_release(v19[0]);
}

void sub_2638BB4F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, xpc_object_t object, uint64_t a17, xpc_object_t a18)
{
  xpc_release(object);
  xpc_release(a18);
  sub_2638BB7CC((xpc_object_t *)(v18 - 64));
  _Unwind_Resume(a1);
}

void sub_2638BB560(uint64_t a1@<X0>, uint64_t a2@<X1>, xpc_object_t *a3@<X8>)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = xpc_null_create();
  double v7 = *(void **)(a1 + 8);
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
  xpc_object_t v11 = *(void **)(a2 + 8);
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
  sub_2638BB810(a3, v15, object);
  xpc_release(object[0]);
  object[0] = 0;
  xpc_release(v10);
  xpc_release(v15[0]);
  v15[0] = 0;
  xpc_release(v6);
}

xpc_object_t *sub_2638BB670@<X0>(uint64_t a1@<X1>, void *a2@<X2>, xpc_object_t *a3@<X3>, xpc_object_t *a4@<X8>)
{
  xpc_object_t v12 = a3;
  for (uint64_t i = *(void *)(a1 + 8); i != a2[1] || *(void *)a1 != *a2; *(void *)(a1 + 8) = i)
  {
    v10[0] = a1;
    v10[1] = i;
    sub_2638BB878((uint64_t)v10, &value);
    xpc_array_append_value(*a3, value);
    xpc_release(value);
    uint64_t i = *(void *)(a1 + 8) + 1;
  }
  return sub_2638BB8C0(a4, (xpc_object_t *)a1, (xpc_object_t *)&v12);
}

void sub_2638BB718(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t object)
{
}

void sub_2638BB730(xpc_object_t *a1@<X0>, xpc_object_t *a2@<X1>, void *a3@<X8>)
{
  v7[0] = *a1;
  *a1 = xpc_null_create();
  v7[1] = a1[1];
  object[0] = *a2;
  *a2 = xpc_null_create();
  object[1] = a2[1];
  sub_2638BB918(v7, object, a3);
  xpc_release(object[0]);
  object[0] = 0;
  xpc_release(v7[0]);
}

xpc_object_t *sub_2638BB7CC(xpc_object_t *a1)
{
  a1[2] = 0;
  xpc_release(*a1);
  *a1 = 0;
  return a1;
}

xpc_object_t *sub_2638BB810(xpc_object_t *a1, xpc_object_t *a2, xpc_object_t *a3)
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

xpc_object_t sub_2638BB878@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
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

xpc_object_t *sub_2638BB8C0(xpc_object_t *a1, xpc_object_t *a2, xpc_object_t *a3)
{
  *a1 = *a2;
  *a2 = xpc_null_create();
  a1[1] = a2[1];
  a1[2] = *a3;
  return a1;
}

void sub_2638BB918(void **a1@<X0>, xpc_object_t *a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = *a1;
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

double WISMetadataLoader::WISMetadataLoader(uint64_t a1, int a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  *a3 = 0;
  *(void *)a1 = v3;
  *(_DWORD *)(a1 + 8) = a2;
  double result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_DWORD *)(a1 + 64) = 1065353216;
  return result;
}

{
  uint64_t v3;
  double result;

  uint64_t v3 = *a3;
  *a3 = 0;
  *(void *)a1 = v3;
  *(_DWORD *)(a1 + 8) = a2;
  double result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_DWORD *)(a1 + 64) = 1065353216;
  return result;
}

double WISMetadataLoader::loadDeviceConfigMetadata@<D0>(WISMetadataLoader *this@<X0>, _OWORD *a2@<X8>)
{
  (*(void (**)(long long *__return_ptr))(**(void **)this + 24))(&v4);
  double result = *(double *)&v4;
  *a2 = v4;
  return result;
}

uint64_t WISMetadataLoader::getComponentsAvailable(WISMetadataLoader *this)
{
  return (*(uint64_t (**)(void, void))(**(void **)this + 40))(*(void *)this, *((unsigned int *)this + 2));
}

uint64_t WISMetadataLoader::getMetricIndex(WISMetadataLoader *this)
{
  return (*(uint64_t (**)(void))(**(void **)this + 48))();
}

uint64_t sub_2638BBAA8()
{
  return 0;
}

uint64_t *sMetricToJsonTransform@<X0>(wis *this@<X1>, unsigned __int8 *a2@<X2>, uint64_t *result@<X0>, uint64_t a4@<X8>)
{
  if (this && (int v5 = (int)a2, a2))
  {
    xpc_object_t v7 = result;
    v18[0] = 0;
    v18[1] = 0;
    uint64_t v19 = 0;
    wis::GetProtobufTag((uint64_t)this, a2, v18);
    v9[0] = 0;
    v9[1] = (char *)this + v18[0];
    xpc_object_t v9[2] = (char *)this + v18[0] + v5 - LODWORD(v18[0]);
    int v10 = v5 - LODWORD(v18[0]);
    uint64_t v11 = 0;
    __int16 v12 = 0;
    int v13 = v5 - LODWORD(v18[0]);
    long long v14 = xmmword_2638C8F60;
    int v15 = *MEMORY[0x263F8C738];
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    sub_2638ABF5C(a4, 0, 0, 0, 1);
    xpc_object_t v8 = (std::__shared_weak_count *)v7[1];
    uint64_t v22 = *v7;
    uint64_t v23 = v8;
    if (v8) {
      atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v24 = a4;
    MetricFileMetadataHelper::MetricFileMetadataHelper((uint64_t)&v25, &v22, v19);
    if (v23) {
      sub_26389F6D4(v23);
    }
    while (!(_BYTE)v12)
    {
      __n128 v20 = 0uLL;
      uint64_t v21 = 0xFFFFFFFFLL;
      sub_2638BBE40((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v9, &v20, &v24);
    }
    sub_26389B614((uint64_t)&v27);
    if (v26) {
      sub_26389F6D4(v26);
    }
    return (uint64_t *)MEMORY[0x263E6CFB0](v9);
  }
  else
  {
    *(unsigned char *)a4 = 0;
    *(void *)(a4 + 8) = 0;
  }
  return result;
}

void sub_2638BBC04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,std::__shared_weak_count *a26)
{
  if (a26) {
    sub_26389F6D4(a26);
  }
  sub_2638A5C4C(v26 + 1, *(unsigned __int8 *)v26);
  MEMORY[0x263E6CFB0](&a9);
  _Unwind_Resume(a1);
}

uint64_t sConvertTriggerToJson@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  if (a2 && a3)
  {
    int v5 = (uint64_t *)result;
    v7[0] = 0;
    v7[1] = a2;
    xpc_object_t v7[2] = a2 + (int)a3;
    int v8 = a3;
    uint64_t v9 = 0;
    __int16 v10 = 0;
    int v11 = a3;
    long long v12 = xmmword_2638C8F60;
    int v13 = *MEMORY[0x263F8C738];
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    sub_2638ABF5C(a4, 0, 0, 0, 1);
    xpc_object_t v6 = (std::__shared_weak_count *)v5[1];
    uint64_t v18 = *v5;
    uint64_t v19 = v6;
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v20 = a4;
    MetricFileMetadataHelper::MetricFileMetadataHelper((MetricFileMetadataHelper *)&v21, &v18);
    if (v19) {
      sub_26389F6D4(v19);
    }
    while (!(_BYTE)v10)
    {
      __n128 v16 = 0uLL;
      uint64_t v17 = 0xFFFFFFFFLL;
      sub_2638BBE40((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v7, &v16, &v20);
    }
    sub_26389B614((uint64_t)&v23);
    if (v22) {
      sub_26389F6D4(v22);
    }
    return MEMORY[0x263E6CFB0](v7);
  }
  else
  {
    *(unsigned char *)a4 = 0;
    *(void *)(a4 + 8) = 0;
  }
  return result;
}

void sub_2638BBD64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,std::__shared_weak_count *a24)
{
  if (a24) {
    sub_26389F6D4(a24);
  }
  sub_2638A5C4C(v24 + 1, *(unsigned __int8 *)v24);
  MEMORY[0x263E6CFB0](&a10);
  _Unwind_Resume(a1);
}

void sCreateWISMetadataLoaderForJsonConversion(void)
{
  int v0 = 1;
  sCreateBestChoiceMetadataLoaderDelegate();
}

void sub_2638BBE24(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9) {
    sub_2638C4EE0(a9);
  }
  _Unwind_Resume(exception_object);
}

void sub_2638BBE40(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, __n128 *a2, uint64_t *a3)
{
  xpc_object_t v6 = (unsigned __int8 *)*((void *)this + 1);
  if ((unint64_t)v6 >= *((void *)this + 2) || (char)*v6 < 0)
  {
    unint64_t TagFallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(this);
    *((_DWORD *)this + 8) = TagFallback;
    if (TagFallback) {
      goto LABEL_4;
    }
LABEL_10:
    if (*((unsigned char *)this + 36)) {
      return;
    }
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x263E6D1C0](exception, "Parsing failed in metric");
    goto LABEL_199;
  }
  unint64_t TagFallback = *v6;
  *((_DWORD *)this + 8) = TagFallback;
  *((void *)this + 1) = v6 + 1;
  if (!TagFallback) {
    goto LABEL_10;
  }
LABEL_4:
  unint64_t v8 = wis::reflect::decodeTag((wis::reflect *)TagFallback);
  unint64_t v9 = HIDWORD(v8);
  unsigned __int8 v10 = v8;
  __n128 v104 = *a2;
  unint64_t v105 = a2[1].n128_u64[0];
  MetricFileMetadataHelper::getSubfieldType((MetricFileMetadataHelper *)(a3 + 1), &v104, HIDWORD(v8), (uint64_t)&v106);
  long long v102 = v106;
  uint64_t v103 = v107;
  uint64_t BuiltinType = MetadataHelper::getBuiltinType((uint64_t)(a3 + 1), (MetadataHandle *)&v102);
  int v12 = BuiltinType;
  uint64_t DecodingType = wis::reflect::getDecodingType(BuiltinType, v10);
  switch((int)DecodingType)
  {
    case 0:
      switch(v10)
      {
        case 0u:
          *(void *)unint64_t v119 = 0;
          if (sub_2638A7CF4(this, (unint64_t *)v119)) {
            goto LABEL_178;
          }
          goto LABEL_151;
        case 1u:
          *(void *)unint64_t v119 = 0;
          if (wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(this, (unint64_t *)v119))goto LABEL_151; {
LABEL_178:
          }
          uint64_t v72 = *(char ***)v119;
          goto LABEL_181;
        case 2u:
          v115[0] = 0;
          if ((sub_2638A7D24(this, v115) & 1) == 0) {
            goto LABEL_151;
          }
          sub_2638AA7BC(v119, v115[0]);
          char Raw = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadRaw(this, *(void **)v119);
          if (Raw) {
            sub_2638BD934(a3, *(unsigned char **)v119, *(void *)&v119[2] - *(void *)v119, v9);
          }
          goto LABEL_169;
        case 5u:
          v119[0] = 0;
          if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(this, v119))goto LABEL_151; {
          uint64_t v72 = (char **)v119[0];
          }
LABEL_181:
          sub_2638BD878(a3, v72, v9);
          break;
        default:
          goto LABEL_151;
      }
      return;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
      unint64_t v117 = 0;
      switch(v10)
      {
        case 0u:
          uint64_t v14 = (char *)*((void *)this + 1);
          if ((unint64_t)v14 < *((void *)this + 2) && (*v14 & 0x80000000) == 0)
          {
            unint64_t v117 = *v14;
            *((void *)this + 1) = v14 + 1;
LABEL_84:
            unint64_t v42 = v117;
            switch(v12)
            {
              case 1:
              case 15:
                double v47 = wis::protobuf::NumberConverter<(wis::reflect::Type)1>::decode(v117);
                __n128 v110 = *a2;
                unint64_t v111 = a2[1].n128_u64[0];
                *(__n128 *)unint64_t v119 = *a2;
                unint64_t v120 = a2[1].n128_u64[0];
                unsigned int v44 = v9;
                int v45 = sub_2638A1CF8((uint64_t)a3, (MetadataHandle *)v119, v9);
                BOOL v46 = (char ***)&v108.n128_u64[1];
                v108.n128_u8[0] = 7;
                v108.n128_f64[1] = v47;
                if (v12 == 11)
                {
                  *(__n128 *)BOOL v113 = v110;
                  unint64_t v114 = v111;
                  sub_2638A2174((uint64_t)a3, (MetadataHandle *)v113, v44, (unint64_t)v47, v115);
                  uint64_t v78 = HIBYTE(v116);
                  char v79 = HIBYTE(v116);
                  if (v116 < 0) {
                    uint64_t v78 = *(void *)&v115[2];
                  }
                  if (v78)
                  {
                    uint64_t v80 = operator new(0x18uLL);
                    *(_OWORD *)uint64_t v80 = *(_OWORD *)v115;
                    v80[2] = v116;
                    int64_t v116 = 0;
                    memset(v115, 0, sizeof(v115));
                    int v81 = v108.n128_u8[0];
                    v108.n128_u8[0] = 3;
                    LOBYTE(__p) = v81;
                    int v82 = (char **)v108.n128_u64[1];
                    v108.n128_u64[1] = (unint64_t)v80;
                    char v97 = v82;
                    sub_2638A5C4C(&v97, v81);
                    char v79 = HIBYTE(v116);
                  }
                  if (v79 < 0) {
                    operator delete(*(void **)v115);
                  }
                }
                else if (v12 == 12)
                {
                  v108.n128_u8[0] = 4;
                  LOBYTE(v113[0]) = 7;
                  v108.n128_u64[1] = v47 != 0.0;
                  *(double *)&v113[2] = v47;
                  sub_2638A5C4C((char ***)&v113[2], 7);
                }
                goto LABEL_195;
              case 2:
              case 16:
                float v43 = wis::protobuf::NumberConverter<(wis::reflect::Type)2>::decode(v117);
                __n128 v110 = *a2;
                unint64_t v111 = a2[1].n128_u64[0];
                *(__n128 *)unint64_t v119 = *a2;
                unint64_t v120 = a2[1].n128_u64[0];
                unsigned int v44 = v9;
                int v45 = sub_2638A1CF8((uint64_t)a3, (MetadataHandle *)v119, v9);
                BOOL v46 = (char ***)&v108.n128_u64[1];
                v108.n128_u8[0] = 7;
                v108.n128_f64[1] = v43;
                if (v12 == 11)
                {
                  *(__n128 *)BOOL v113 = v110;
                  unint64_t v114 = v111;
                  sub_2638A2174((uint64_t)a3, (MetadataHandle *)v113, v44, (unint64_t)v43, v115);
                  uint64_t v73 = HIBYTE(v116);
                  char v74 = HIBYTE(v116);
                  if (v116 < 0) {
                    uint64_t v73 = *(void *)&v115[2];
                  }
                  if (v73)
                  {
                    size_t v75 = operator new(0x18uLL);
                    *(_OWORD *)size_t v75 = *(_OWORD *)v115;
                    v75[2] = v116;
                    int64_t v116 = 0;
                    memset(v115, 0, sizeof(v115));
                    int v76 = v108.n128_u8[0];
                    v108.n128_u8[0] = 3;
                    LOBYTE(__p) = v76;
                    BOOL v77 = (char **)v108.n128_u64[1];
                    v108.n128_u64[1] = (unint64_t)v75;
                    char v97 = v77;
                    sub_2638A5C4C(&v97, v76);
                    char v74 = HIBYTE(v116);
                  }
                  if (v74 < 0) {
                    operator delete(*(void **)v115);
                  }
                }
                else if (v12 == 12)
                {
                  v108.n128_u8[0] = 4;
                  LOBYTE(v113[0]) = 7;
                  v108.n128_u64[1] = v43 != 0.0;
                  *(double *)&v113[2] = v43;
                  sub_2638A5C4C((char ***)&v113[2], 7);
                }
LABEL_195:
                *(__n128 *)uint64_t v115 = v110;
                int64_t v116 = v111;
                int v83 = sub_2638A1D7C((uint64_t)a3, (MetadataHandle *)v115, v44);
                sub_2638BEEB0(a3, v45, (uint64_t)&v108, v83);
                int v52 = v108.n128_u8[0];
                goto LABEL_196;
              case 3:
              case 11:
              case 17:
              case 25:
                goto LABEL_95;
              case 4:
              case 10:
              case 18:
              case 24:
                *(void *)uint64_t v115 = v117;
                *(__n128 *)unint64_t v119 = *a2;
                unint64_t v120 = a2[1].n128_u64[0];
                sub_2638BDA60(a3, (char ***)v115, (long long *)v119, v9, v12);
                return;
              case 5:
              case 19:
                unint64_t v42 = wis::protobuf::NumberConverter<(wis::reflect::Type)5>::decode(v117);
LABEL_95:
                *(void *)uint64_t v115 = v42;
                *(__n128 *)unint64_t v119 = *a2;
                unint64_t v120 = a2[1].n128_u64[0];
                sub_2638BDE18(a3, (char ***)v115, (long long *)v119, v9, v12);
                return;
              case 6:
              case 20:
                v115[0] = v117;
                goto LABEL_97;
              case 7:
              case 9:
              case 21:
              case 23:
                v115[0] = v117;
                *(__n128 *)unint64_t v119 = *a2;
                unint64_t v120 = a2[1].n128_u64[0];
                sub_2638BDC3C(a3, v115, (long long *)v119, v9, v12);
                return;
              case 8:
              case 22:
                v115[0] = wis::protobuf::NumberConverter<(wis::reflect::Type)8>::decode(v117);
LABEL_97:
                *(__n128 *)unint64_t v119 = *a2;
                unint64_t v120 = a2[1].n128_u64[0];
                sub_2638BDFF4(a3, (int *)v115, (long long *)v119, v9, v12);
                return;
              case 12:
              case 26:
                BOOL v48 = v117 != 0;
                *(__n128 *)BOOL v113 = *a2;
                unint64_t v114 = a2[1].n128_u64[0];
                *(__n128 *)unint64_t v119 = *a2;
                unint64_t v120 = a2[1].n128_u64[0];
                unsigned int v49 = v9;
                uint64_t v50 = sub_2638A1CF8((uint64_t)a3, (MetadataHandle *)v119, v9);
                BOOL v46 = (char ***)&v110.n128_u64[1];
                v110.n128_u8[0] = 4;
                v110.n128_u64[1] = v48;
                if (v12 == 12)
                {
                  v108.n128_u8[0] = 4;
                  v108.n128_u64[1] = v48;
                  sub_2638A5C4C((char ***)&v108.n128_u64[1], 4);
                }
                *(_OWORD *)uint64_t v115 = *(_OWORD *)v113;
                int64_t v116 = v114;
                int v51 = sub_2638A1D7C((uint64_t)a3, (MetadataHandle *)v115, v49);
                sub_2638BEEB0(a3, v50, (uint64_t)&v110, v51);
                int v52 = v110.n128_u8[0];
LABEL_196:
                sub_2638A5C4C(v46, v52);
                return;
              default:
                exception = __cxa_allocate_exception(0x10uLL);
                MEMORY[0x263E6D1C0](exception, "This should never happen, no matter what the input!");
                goto LABEL_199;
            }
          }
          if (wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(this, &v117)) {
            goto LABEL_84;
          }
          if (v9 || !*((unsigned char *)this + 36)) {
            goto LABEL_103;
          }
          return;
        case 1u:
          if (wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(this, &v117)) {
            goto LABEL_84;
          }
          if (v9 || !*((unsigned char *)this + 36)) {
            goto LABEL_103;
          }
          return;
        case 2u:
          if (v9 || !*((unsigned char *)this + 36)) {
            goto LABEL_103;
          }
          return;
        case 5u:
          v119[0] = 0;
          if (wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(this, v119))
          {
            unint64_t v117 = v119[0];
            goto LABEL_84;
          }
          if (!v9 && *((unsigned char *)this + 36)) {
            return;
          }
LABEL_103:
          exception = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x263E6D1C0](exception, "Parsing failed in metric");
          break;
        default:
          goto LABEL_84;
      }
      goto LABEL_199;
    case 13:
      v115[0] = 0;
      int v38 = (char *)*((void *)this + 1);
      if ((unint64_t)v38 >= *((void *)this + 2) || *v38 < 0)
      {
        if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, v115))goto LABEL_151; {
      }
        }
      else
      {
        v115[0] = *v38;
        *((void *)this + 1) = v38 + 1;
      }
      memset(v119, 0, sizeof(v119));
      unint64_t v120 = 0;
      char Raw = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadString();
      if (Raw)
      {
        __n128 v94 = *a2;
        unint64_t v95 = a2[1].n128_u64[0];
        sub_2638BD4F0(a3, (uint64_t)v119, (long long *)&v94, v9);
      }
      if ((SHIBYTE(v120) & 0x80000000) == 0) {
        goto LABEL_172;
      }
      int v68 = *(void **)v119;
      goto LABEL_171;
    case 14:
      v115[0] = 0;
      size_t v40 = (char *)*((void *)this + 1);
      if ((unint64_t)v40 >= *((void *)this + 2) || *v40 < 0)
      {
        if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, v115))goto LABEL_151; {
        unsigned int v41 = v115[0];
        }
      }
      else
      {
        unsigned int v41 = *v40;
        v115[0] = v41;
        *((void *)this + 1) = v40 + 1;
      }
      sub_2638AA7BC(v119, v41);
      char Raw = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadRaw(this, *(void **)v119);
      if (Raw)
      {
        __n128 v92 = *a2;
        unint64_t v93 = a2[1].n128_u64[0];
        sub_2638BD5E0(a3, (uint64_t)v119, (long long *)&v92, v9);
      }
LABEL_169:
      int v68 = *(void **)v119;
      if (*(void *)v119)
      {
        *(void *)&v119[2] = *(void *)v119;
LABEL_171:
        operator delete(v68);
      }
LABEL_172:
      if (Raw) {
        return;
      }
      goto LABEL_151;
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
      unsigned int v101 = 0;
      __n128 v16 = (unsigned __int8 *)*((void *)this + 1);
      if ((unint64_t)v16 >= *((void *)this + 2) || (char)*v16 < 0)
      {
        if (wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, &v101)) {
          goto LABEL_16;
        }
LABEL_151:
        if (!v9 && *((unsigned char *)this + 36)) {
          return;
        }
        exception = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x263E6D1C0](exception, "Parsing failed in metric");
LABEL_199:
        __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
      }
      unsigned int v101 = *v16;
      *((void *)this + 1) = v16 + 1;
LABEL_16:
      size_t v85 = a3;
      unsigned int v87 = v9;
      int UnpackedType = wis::reflect::getUnpackedType(DecodingType);
      int WireTypeForType = wis::reflect::getWireTypeForType(UnpackedType);
      unsigned int v99 = this;
      int v100 = wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(this);
      std::string __p = 0;
      char v97 = 0;
      unint64_t v98 = 0;
      while (1)
      {
        int v18 = wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(this);
        if (v18 < 1) {
          break;
        }
        uint64_t v19 = v97;
        if ((unint64_t)v97 >= v98)
        {
          uint64_t v21 = (char **)__p;
          int64_t v22 = ((char *)v97 - (unsigned char *)__p) >> 3;
          unint64_t v23 = v22 + 1;
          if ((unint64_t)(v22 + 1) >> 61) {
            sub_2638A2514();
          }
          uint64_t v24 = v98 - (void)__p;
          if ((uint64_t)(v98 - (void)__p) >> 2 > v23) {
            unint64_t v23 = v24 >> 2;
          }
          if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v25 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v25 = v23;
          }
          if (v25)
          {
            uint64_t v26 = (char *)sub_26389E00C((uint64_t)&v98, v25);
            uint64_t v21 = (char **)__p;
            uint64_t v19 = v97;
          }
          else
          {
            uint64_t v26 = 0;
          }
          uint64_t v27 = (char **)&v26[8 * v22];
          *uint64_t v27 = 0;
          uint64_t v20 = v27 + 1;
          while (v19 != v21)
          {
            xpc_object_t v28 = *--v19;
            *--uint64_t v27 = v28;
          }
          std::string __p = v27;
          char v97 = v20;
          unint64_t v98 = (unint64_t)&v26[8 * v25];
          if (v21) {
            operator delete(v21);
          }
        }
        else
        {
          *char v97 = 0;
          uint64_t v20 = v19 + 1;
        }
        char v97 = v20;
        switch(WireTypeForType)
        {
          case 0:
            xpc_object_t v29 = (unint64_t *)(v20 - 1);
            long long v30 = (char *)*((void *)this + 1);
            if ((unint64_t)v30 >= *((void *)this + 2) || *v30 < 0)
            {
              char Varint64Fallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(this, v29);
LABEL_42:
              if ((Varint64Fallback & 1) == 0) {
                goto LABEL_148;
              }
            }
            else
            {
              unint64_t *v29 = *v30;
              *((void *)this + 1) = v30 + 1;
            }
            break;
          case 1:
            char Varint64Fallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(this, (unint64_t *)v20 - 1);
            goto LABEL_42;
          case 2:
            goto LABEL_148;
          case 5:
            v119[0] = 0;
            char LittleEndian32Fallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(this, v119);
            *(v97 - 1) = (char *)v119[0];
            if ((LittleEndian32Fallback & 1) == 0) {
              goto LABEL_148;
            }
            continue;
          default:
            continue;
        }
      }
      switch((int)DecodingType)
      {
        case 15:
          sub_2638A9784((uint64_t *)&__p, &v110);
          __n128 v108 = *a2;
          unint64_t v109 = a2[1].n128_u64[0];
          *(__n128 *)unint64_t v119 = *a2;
          unint64_t v120 = a2[1].n128_u64[0];
          char v33 = sub_2638A1CF8((uint64_t)v85, (MetadataHandle *)v119, v87);
          size_t v118 = 0;
          LOBYTE(v117) = 2;
          *(void *)uint64_t v115 = 0;
          *(void *)BOOL v113 = 0;
          size_t v118 = (char **)sub_2638AC1C4((uint64_t *)v115, (uint64_t *)v113);
          long long v35 = (double *)v110.n128_u64[1];
          for (uint64_t i = (double *)v110.n128_u64[0]; i != v35; ++i)
          {
            double v36 = *i;
            double v112 = *i;
            if (UnpackedType == 11)
            {
              *(__n128 *)BOOL v113 = v108;
              unint64_t v114 = v109;
              sub_2638A2174((uint64_t)v85, (MetadataHandle *)v113, v87, (unint64_t)v36, v115);
              uint64_t v37 = HIBYTE(v116);
              if (v116 < 0) {
                uint64_t v37 = *(void *)&v115[2];
              }
              if (v37) {
                sub_2638AE784((uint64_t)&v117, (uint64_t)v115);
              }
              else {
                sub_2638AEDC8((uint64_t)&v117, (uint64_t *)&v112);
              }
              if (SHIBYTE(v116) < 0) {
                operator delete(*(void **)v115);
              }
            }
            else if (UnpackedType == 12)
            {
              LOBYTE(v115[0]) = v36 != 0.0;
              sub_2638AE620((uint64_t)&v117, (unsigned __int8 *)v115);
            }
            else
            {
              sub_2638AEDC8((uint64_t)&v117, (uint64_t *)&v112);
            }
          }
          goto LABEL_154;
        case 16:
          sub_2638A9A5C((uint64_t *)&__p, &v110);
          __n128 v108 = *a2;
          unint64_t v109 = a2[1].n128_u64[0];
          *(__n128 *)unint64_t v119 = *a2;
          unint64_t v120 = a2[1].n128_u64[0];
          char v33 = sub_2638A1CF8((uint64_t)v85, (MetadataHandle *)v119, v87);
          size_t v118 = 0;
          LOBYTE(v117) = 2;
          *(void *)uint64_t v115 = 0;
          *(void *)BOOL v113 = 0;
          size_t v118 = (char **)sub_2638AC1C4((uint64_t *)v115, (uint64_t *)v113);
          BOOL v63 = (float *)v110.n128_u64[1];
          for (j = (float *)v110.n128_u64[0]; j != v63; ++j)
          {
            float v64 = *j;
            *(float *)&double v112 = *j;
            if (UnpackedType == 11)
            {
              *(__n128 *)BOOL v113 = v108;
              unint64_t v114 = v109;
              sub_2638A2174((uint64_t)v85, (MetadataHandle *)v113, v87, (unint64_t)v64, v115);
              uint64_t v65 = HIBYTE(v116);
              if (v116 < 0) {
                uint64_t v65 = *(void *)&v115[2];
              }
              if (v65) {
                sub_2638AE784((uint64_t)&v117, (uint64_t)v115);
              }
              else {
                sub_2638AF2A8((uint64_t)&v117, (float *)&v112);
              }
              if (SHIBYTE(v116) < 0) {
                operator delete(*(void **)v115);
              }
            }
            else if (UnpackedType == 12)
            {
              LOBYTE(v115[0]) = v64 != 0.0;
              sub_2638AE620((uint64_t)&v117, (unsigned __int8 *)v115);
            }
            else
            {
              sub_2638AF2A8((uint64_t)&v117, (float *)&v112);
            }
          }
LABEL_154:
          *(__n128 *)uint64_t v115 = v108;
          int64_t v116 = v109;
          int v66 = sub_2638A1D7C((uint64_t)v85, (MetadataHandle *)v115, v87);
          sub_2638BEEB0(v85, v33, (uint64_t)&v117, v66);
          sub_2638A5C4C(&v118, v117);
          BOOL v61 = (void *)v110.n128_u64[0];
          if (!v110.n128_u64[0]) {
            break;
          }
          v110.n128_u64[1] = v110.n128_u64[0];
          goto LABEL_147;
        case 17:
        case 25:
          sub_2638A9700((uint64_t *)&__p, v119);
          *(__n128 *)uint64_t v115 = *a2;
          int64_t v116 = a2[1].n128_i64[0];
          sub_2638BE568(v85, (uint64_t **)v119, (long long *)v115, v87, UnpackedType);
          goto LABEL_145;
        case 18:
        case 24:
          sub_2638A9700((uint64_t *)&__p, v119);
          *(__n128 *)uint64_t v115 = *a2;
          int64_t v116 = a2[1].n128_i64[0];
          sub_2638BE1D0(v85, (uint64_t **)v119, (long long *)v115, v87, UnpackedType);
          goto LABEL_145;
        case 19:
          sub_2638A9D34((uint64_t *)&__p, v119);
          *(__n128 *)uint64_t v115 = *a2;
          int64_t v116 = a2[1].n128_i64[0];
          sub_2638BE568(v85, (uint64_t **)v119, (long long *)v115, v87, UnpackedType);
          goto LABEL_145;
        case 20:
          sub_2638A99D8((uint64_t *)&__p, v119);
          *(__n128 *)uint64_t v115 = *a2;
          int64_t v116 = a2[1].n128_i64[0];
          sub_2638BE734(v85, (int **)v119, (long long *)v115, v87, UnpackedType);
          goto LABEL_145;
        case 21:
        case 23:
          sub_2638A99D8((uint64_t *)&__p, v119);
          *(__n128 *)uint64_t v115 = *a2;
          int64_t v116 = a2[1].n128_i64[0];
          sub_2638BE39C(v85, (unsigned int **)v119, (long long *)v115, v87, UnpackedType);
          goto LABEL_145;
        case 22:
          sub_2638A9F88((uint64_t *)&__p, v119);
          *(__n128 *)uint64_t v115 = *a2;
          int64_t v116 = a2[1].n128_i64[0];
          sub_2638BE734(v85, (int **)v119, (long long *)v115, v87, UnpackedType);
LABEL_145:
          BOOL v61 = *(void **)v119;
          if (!*(void *)v119) {
            break;
          }
          *(void *)&v119[2] = *(void *)v119;
LABEL_147:
          operator delete(v61);
          break;
        case 26:
          sub_2638A9AE4((uint64_t)&__p, &v110);
          __n128 v108 = *a2;
          unint64_t v109 = a2[1].n128_u64[0];
          *(__n128 *)unint64_t v119 = *a2;
          unint64_t v120 = a2[1].n128_u64[0];
          size_t v53 = sub_2638A1CF8((uint64_t)v85, (MetadataHandle *)v119, v87);
          size_t v118 = 0;
          LOBYTE(v117) = 2;
          *(void *)uint64_t v115 = 0;
          *(void *)BOOL v113 = 0;
          size_t v118 = (char **)sub_2638AC1C4((uint64_t *)v115, (uint64_t *)v113);
          int v54 = (void *)v110.n128_u64[0];
          int v55 = v110.n128_u8[8] & 0x3F;
          if (v110.n128_u64[1] > 0x3F || (v110.n128_u8[8] & 0x3F) != 0)
          {
            int v56 = 0;
            size_t v57 = (void *)(v110.n128_u64[0] + 8 * (v110.n128_u64[1] >> 6));
            do
            {
              uint64_t v58 = *v54 & (1 << v56);
              LOBYTE(v112) = v58 != 0;
              if (UnpackedType == 11)
              {
                *(__n128 *)BOOL v113 = v108;
                unint64_t v114 = v109;
                sub_2638A2174((uint64_t)v85, (MetadataHandle *)v113, v87, v58 != 0, v115);
                uint64_t v59 = HIBYTE(v116);
                if (v116 < 0) {
                  uint64_t v59 = *(void *)&v115[2];
                }
                if (v59) {
                  sub_2638AE784((uint64_t)&v117, (uint64_t)v115);
                }
                else {
                  sub_2638AF520((uint64_t)&v117, (unsigned __int8 *)&v112);
                }
                if (SHIBYTE(v116) < 0) {
                  operator delete(*(void **)v115);
                }
              }
              else if (UnpackedType == 12)
              {
                LOBYTE(v115[0]) = v58 != 0;
                sub_2638AE620((uint64_t)&v117, (unsigned __int8 *)v115);
              }
              else
              {
                sub_2638AF520((uint64_t)&v117, (unsigned __int8 *)&v112);
              }
              v54 += v56 == 63;
              if (v56 == 63) {
                int v56 = 0;
              }
              else {
                ++v56;
              }
            }
            while (v54 != v57 || v56 != v55);
          }
          *(__n128 *)uint64_t v115 = v108;
          int64_t v116 = v109;
          int v60 = sub_2638A1D7C((uint64_t)v85, (MetadataHandle *)v115, v87);
          sub_2638BEEB0(v85, v53, (uint64_t)&v117, v60);
          sub_2638A5C4C(&v118, v117);
          BOOL v61 = (void *)v110.n128_u64[0];
          if (!v110.n128_u64[0]) {
            break;
          }
          goto LABEL_147;
        default:
          uint64_t v84 = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x263E6D1C0](v84, "This should never happen, no matter what the input!");
          __cxa_throw(v84, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
      }
LABEL_148:
      if (__p)
      {
        char v97 = (char **)__p;
        operator delete(__p);
      }
      wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(v99);
      LODWORD(v9) = v87;
      if (v18 > 0) {
        goto LABEL_151;
      }
      return;
    case 27:
      v113[0] = 0;
      size_t v39 = (char *)*((void *)this + 1);
      if ((unint64_t)v39 >= *((void *)this + 2) || *v39 < 0)
      {
        if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, v113))goto LABEL_151; {
      }
        }
      else
      {
        v113[0] = *v39;
        *((void *)this + 1) = v39 + 1;
      }
      *(void *)unint64_t v119 = this;
      v119[2] = wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(this);
      ++*((_DWORD *)this + 14);
      *(void *)uint64_t v115 = this;
      __n128 v90 = *a2;
      unint64_t v91 = a2[1].n128_u64[0];
      long long v88 = v106;
      uint64_t v89 = v107;
      sub_2638BD70C(a3, this, (long long *)&v90, v9, &v88);
      sub_2638BD83C((wireless_diagnostics::google::protobuf::io::CodedInputStream **)v115);
      int v69 = *((_DWORD *)this + 14);
      BOOL v70 = __OFSUB__(v69, 1);
      int v71 = v69 - 1;
      if (v71 < 0 == v70) {
        *((_DWORD *)this + 14) = v71;
      }
      sub_2638A2140((wireless_diagnostics::google::protobuf::io::CodedInputStream **)v119);
      return;
    default:
      goto LABEL_151;
  }
}

void sub_2638BD1B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,unsigned __int8 a45)
{
  if (v45 < 0) {
    operator delete(*(void **)(v47 - 192));
  }
  sub_2638A5C4C(v46, a45);
  _Unwind_Resume(a1);
}

void sub_2638BD4F0(uint64_t *a1, uint64_t a2, long long *a3, unsigned int a4)
{
  long long v15 = *a3;
  uint64_t v16 = *((void *)a3 + 2);
  unint64_t v8 = sub_2638A1CF8((uint64_t)a1, (MetadataHandle *)&v15, a4);
  v13[0] = 3;
  unint64_t v9 = (char **)operator new(0x18uLL);
  *(_OWORD *)unint64_t v9 = *(_OWORD *)a2;
  xpc_object_t v9[2] = *(char **)(a2 + 16);
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  uint64_t v14 = v9;
  long long v11 = *a3;
  uint64_t v12 = *((void *)a3 + 2);
  int v10 = sub_2638A1D7C((uint64_t)a1, (MetadataHandle *)&v11, a4);
  sub_2638BEEB0(a1, v8, (uint64_t)v13, v10);
  sub_2638A5C4C(&v14, v13[0]);
}

void sub_2638BD5C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, unsigned __int8 a13)
{
  sub_2638A5C4C(v13, a13);
  _Unwind_Resume(a1);
}

void sub_2638BD5E0(uint64_t *a1, uint64_t a2, long long *a3, unsigned int a4)
{
  long long v16 = *a3;
  uint64_t v17 = *((void *)a3 + 2);
  unint64_t v8 = sub_2638A1CF8((uint64_t)a1, (MetadataHandle *)&v16, a4);
  sub_2638B9730(*(void *)(a2 + 8) - *(void *)a2, *(unsigned char **)a2, &__p);
  long long v15 = 0;
  v14[0] = 3;
  unint64_t v9 = (char **)operator new(0x18uLL);
  *(std::string *)unint64_t v9 = __p;
  long long v15 = v9;
  long long v11 = *a3;
  uint64_t v12 = *((void *)a3 + 2);
  memset(&__p, 0, sizeof(__p));
  int v10 = sub_2638A1D7C((uint64_t)a1, (MetadataHandle *)&v11, a4);
  sub_2638BEEB0(a1, v8, (uint64_t)v14, v10);
  sub_2638A5C4C(&v15, v14[0]);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_2638BD6DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, char a18)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_2638BD70C(uint64_t *a1, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2, long long *a3, unsigned int a4, long long *a5)
{
  long long v19 = *a3;
  uint64_t v20 = *((void *)a3 + 2);
  int v10 = sub_2638A1CF8((uint64_t)a1, (MetadataHandle *)&v19, a4);
  uint64_t v11 = *a1;
  sub_2638ABF5C((uint64_t)v17, 0, 0, 0, 1);
  *a1 = (uint64_t)v17;
  while ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(a2) >= 1)
  {
    long long v15 = *a5;
    uint64_t v16 = *((void *)a5 + 2);
    sub_2638BBE40(a2);
  }
  *a1 = v11;
  long long v13 = *a3;
  uint64_t v14 = *((void *)a3 + 2);
  int v12 = sub_2638A1D7C((uint64_t)a1, (MetadataHandle *)&v13, a4);
  sub_2638BEEB0(a1, v10, (uint64_t)v17, v12);
  sub_2638A5C4C(&v18, v17[0]);
}

void sub_2638BD81C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unsigned __int8 a10, ...)
{
  va_start(va, a10);
  sub_2638A5C4C((char ***)va, a10);
  _Unwind_Resume(a1);
}

wireless_diagnostics::google::protobuf::io::CodedInputStream **sub_2638BD83C(wireless_diagnostics::google::protobuf::io::CodedInputStream **a1)
{
  return a1;
}

void sub_2638BD878(uint64_t *a1, char **a2, unsigned int __val)
{
  std::to_string(&v8, __val);
  if ((v8.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    int v5 = &v8;
  }
  else {
    int v5 = (std::string *)v8.__r_.__value_.__r.__words[0];
  }
  v6[0] = 6;
  xpc_object_t v7 = a2;
  sub_2638BEEB0(a1, (char *)v5, (uint64_t)v6, 1);
  sub_2638A5C4C(&v7, v6[0]);
  if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v8.__r_.__value_.__l.__data_);
  }
}

void sub_2638BD90C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, unsigned __int8 a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  sub_2638A5C4C(v17, a10);
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_2638BD934(uint64_t *a1, unsigned char *a2, unint64_t a3, unsigned int __val)
{
  xpc_object_t v7 = &v12;
  std::to_string(&v12, __val);
  if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    xpc_object_t v7 = (std::string *)v12.__r_.__value_.__r.__words[0];
  }
  sub_2638B9730(a3, a2, &__p);
  uint64_t v11 = 0;
  v10[0] = 3;
  std::string v8 = (char **)operator new(0x18uLL);
  *(std::string *)std::string v8 = __p;
  memset(&__p, 0, sizeof(__p));
  uint64_t v11 = v8;
  sub_2638BEEB0(a1, (char *)v7, (uint64_t)v10, 1);
  sub_2638A5C4C(&v11, v10[0]);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v12.__r_.__value_.__l.__data_);
  }
}

void sub_2638BDA18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, unsigned __int8 a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  sub_2638A5C4C(v22, a15);
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a22 < 0) {
    operator delete(a17);
  }
  _Unwind_Resume(a1);
}

void sub_2638BDA60(uint64_t *a1, char ***a2, long long *a3, unsigned int a4, int a5)
{
  long long v30 = *a3;
  uint64_t v31 = *((void *)a3 + 2);
  int v10 = sub_2638A1CF8((uint64_t)a1, (MetadataHandle *)&v30, a4);
  uint64_t v11 = *a2;
  v28[0] = 6;
  unint64_t v29 = (unint64_t)v11;
  if (a5 == 11)
  {
    long long v22 = *a3;
    uint64_t v23 = *((void *)a3 + 2);
    sub_2638A2174((uint64_t)a1, (MetadataHandle *)&v22, a4, (uint64_t)v11, __p);
    std::string v12 = (void *)HIBYTE(v25);
    char v13 = HIBYTE(v25);
    if (v25 < 0) {
      std::string v12 = __p[1];
    }
    if (v12)
    {
      uint64_t v14 = operator new(0x18uLL);
      *(_OWORD *)uint64_t v14 = *(_OWORD *)__p;
      v14[2] = v25;
      __p[1] = 0;
      uint64_t v25 = 0;
      __p[0] = 0;
      int v15 = v28[0];
      v28[0] = 3;
      char v20 = v15;
      uint64_t v16 = (char **)v29;
      unint64_t v29 = (unint64_t)v14;
      uint64_t v21 = v16;
      sub_2638A5C4C(&v21, v15);
      char v13 = HIBYTE(v25);
    }
    if (v13 < 0) {
      operator delete(__p[0]);
    }
  }
  else if (a5 == 12)
  {
    v28[0] = 4;
    char v26 = 6;
    unint64_t v29 = v11 != 0;
    uint64_t v27 = v11;
    sub_2638A5C4C(&v27, 6);
  }
  long long v18 = *a3;
  uint64_t v19 = *((void *)a3 + 2);
  int v17 = sub_2638A1D7C((uint64_t)a1, (MetadataHandle *)&v18, a4);
  sub_2638BEEB0(a1, v10, (uint64_t)v28, v17);
  sub_2638A5C4C((char ***)&v29, v28[0]);
}

void sub_2638BDC0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,unsigned __int8 a23)
{
  if (v24 < 0) {
    operator delete(__p);
  }
  sub_2638A5C4C(v23, a23);
  _Unwind_Resume(a1);
}

void sub_2638BDC3C(uint64_t *a1, unsigned int *a2, long long *a3, unsigned int a4, int a5)
{
  long long v30 = *a3;
  uint64_t v31 = *((void *)a3 + 2);
  int v10 = sub_2638A1CF8((uint64_t)a1, (MetadataHandle *)&v30, a4);
  uint64_t v11 = *a2;
  v28[0] = 6;
  unint64_t v29 = v11;
  if (a5 == 11)
  {
    long long v22 = *a3;
    uint64_t v23 = *((void *)a3 + 2);
    sub_2638A2174((uint64_t)a1, (MetadataHandle *)&v22, a4, v11, __p);
    std::string v12 = (void *)HIBYTE(v25);
    char v13 = HIBYTE(v25);
    if (v25 < 0) {
      std::string v12 = __p[1];
    }
    if (v12)
    {
      uint64_t v14 = operator new(0x18uLL);
      *(_OWORD *)uint64_t v14 = *(_OWORD *)__p;
      v14[2] = v25;
      __p[1] = 0;
      uint64_t v25 = 0;
      __p[0] = 0;
      int v15 = v28[0];
      v28[0] = 3;
      char v20 = v15;
      uint64_t v16 = (char **)v29;
      unint64_t v29 = (unint64_t)v14;
      uint64_t v21 = v16;
      sub_2638A5C4C(&v21, v15);
      char v13 = HIBYTE(v25);
    }
    if (v13 < 0) {
      operator delete(__p[0]);
    }
  }
  else if (a5 == 12)
  {
    v28[0] = 4;
    char v26 = 6;
    unint64_t v29 = v11 != 0;
    uint64_t v27 = (char **)v11;
    sub_2638A5C4C(&v27, 6);
  }
  long long v18 = *a3;
  uint64_t v19 = *((void *)a3 + 2);
  int v17 = sub_2638A1D7C((uint64_t)a1, (MetadataHandle *)&v18, a4);
  sub_2638BEEB0(a1, v10, (uint64_t)v28, v17);
  sub_2638A5C4C((char ***)&v29, v28[0]);
}

void sub_2638BDDE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,unsigned __int8 a23)
{
  if (v24 < 0) {
    operator delete(__p);
  }
  sub_2638A5C4C(v23, a23);
  _Unwind_Resume(a1);
}

void sub_2638BDE18(uint64_t *a1, char ***a2, long long *a3, unsigned int a4, int a5)
{
  long long v30 = *a3;
  uint64_t v31 = *((void *)a3 + 2);
  int v10 = sub_2638A1CF8((uint64_t)a1, (MetadataHandle *)&v30, a4);
  uint64_t v11 = *a2;
  v28[0] = 5;
  unint64_t v29 = (unint64_t)v11;
  if (a5 == 11)
  {
    long long v22 = *a3;
    uint64_t v23 = *((void *)a3 + 2);
    sub_2638A2174((uint64_t)a1, (MetadataHandle *)&v22, a4, (uint64_t)v11, __p);
    std::string v12 = (void *)HIBYTE(v25);
    char v13 = HIBYTE(v25);
    if (v25 < 0) {
      std::string v12 = __p[1];
    }
    if (v12)
    {
      uint64_t v14 = operator new(0x18uLL);
      *(_OWORD *)uint64_t v14 = *(_OWORD *)__p;
      v14[2] = v25;
      __p[1] = 0;
      uint64_t v25 = 0;
      __p[0] = 0;
      int v15 = v28[0];
      v28[0] = 3;
      char v20 = v15;
      uint64_t v16 = (char **)v29;
      unint64_t v29 = (unint64_t)v14;
      uint64_t v21 = v16;
      sub_2638A5C4C(&v21, v15);
      char v13 = HIBYTE(v25);
    }
    if (v13 < 0) {
      operator delete(__p[0]);
    }
  }
  else if (a5 == 12)
  {
    v28[0] = 4;
    char v26 = 5;
    unint64_t v29 = v11 != 0;
    uint64_t v27 = v11;
    sub_2638A5C4C(&v27, 5);
  }
  long long v18 = *a3;
  uint64_t v19 = *((void *)a3 + 2);
  int v17 = sub_2638A1D7C((uint64_t)a1, (MetadataHandle *)&v18, a4);
  sub_2638BEEB0(a1, v10, (uint64_t)v28, v17);
  sub_2638A5C4C((char ***)&v29, v28[0]);
}

void sub_2638BDFC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,unsigned __int8 a23)
{
  if (v24 < 0) {
    operator delete(__p);
  }
  sub_2638A5C4C(v23, a23);
  _Unwind_Resume(a1);
}

void sub_2638BDFF4(uint64_t *a1, int *a2, long long *a3, unsigned int a4, int a5)
{
  long long v30 = *a3;
  uint64_t v31 = *((void *)a3 + 2);
  int v10 = sub_2638A1CF8((uint64_t)a1, (MetadataHandle *)&v30, a4);
  uint64_t v11 = *a2;
  v28[0] = 5;
  unint64_t v29 = v11;
  if (a5 == 11)
  {
    long long v22 = *a3;
    uint64_t v23 = *((void *)a3 + 2);
    sub_2638A2174((uint64_t)a1, (MetadataHandle *)&v22, a4, v11, __p);
    std::string v12 = (void *)HIBYTE(v25);
    char v13 = HIBYTE(v25);
    if (v25 < 0) {
      std::string v12 = __p[1];
    }
    if (v12)
    {
      uint64_t v14 = operator new(0x18uLL);
      *(_OWORD *)uint64_t v14 = *(_OWORD *)__p;
      v14[2] = v25;
      __p[1] = 0;
      uint64_t v25 = 0;
      __p[0] = 0;
      int v15 = v28[0];
      v28[0] = 3;
      char v20 = v15;
      uint64_t v16 = (char **)v29;
      unint64_t v29 = (unint64_t)v14;
      uint64_t v21 = v16;
      sub_2638A5C4C(&v21, v15);
      char v13 = HIBYTE(v25);
    }
    if (v13 < 0) {
      operator delete(__p[0]);
    }
  }
  else if (a5 == 12)
  {
    v28[0] = 4;
    char v26 = 5;
    unint64_t v29 = v11 != 0;
    uint64_t v27 = (char **)v11;
    sub_2638A5C4C(&v27, 5);
  }
  long long v18 = *a3;
  uint64_t v19 = *((void *)a3 + 2);
  int v17 = sub_2638A1D7C((uint64_t)a1, (MetadataHandle *)&v18, a4);
  sub_2638BEEB0(a1, v10, (uint64_t)v28, v17);
  sub_2638A5C4C((char ***)&v29, v28[0]);
}

void sub_2638BE1A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,unsigned __int8 a23)
{
  if (v24 < 0) {
    operator delete(__p);
  }
  sub_2638A5C4C(v23, a23);
  _Unwind_Resume(a1);
}

void sub_2638BE1D0(uint64_t *a1, uint64_t **a2, long long *a3, unsigned int a4, int a5)
{
  long long v25 = *a3;
  uint64_t v26 = *((void *)a3 + 2);
  int v10 = sub_2638A1CF8((uint64_t)a1, (MetadataHandle *)&v25, a4);
  sub_2638ABF5C((uint64_t)v23, 0, 0, 0, 2);
  std::string v12 = *a2;
  uint64_t v11 = a2[1];
  while (v12 != v11)
  {
    uint64_t v13 = *v12;
    uint64_t v22 = *v12;
    if (a5 == 11)
    {
      long long v18 = *a3;
      uint64_t v19 = *((void *)a3 + 2);
      sub_2638A2174((uint64_t)a1, (MetadataHandle *)&v18, a4, v13, __p);
      unint64_t v14 = v21;
      if ((v21 & 0x80u) != 0) {
        unint64_t v14 = (unint64_t)__p[1];
      }
      if (v14) {
        sub_2638AE784((uint64_t)v23, (uint64_t)__p);
      }
      else {
        sub_2638AE940((uint64_t)v23, &v22);
      }
      if ((char)v21 < 0) {
        operator delete(__p[0]);
      }
    }
    else if (a5 == 12)
    {
      LOBYTE(__p[0]) = v13 != 0;
      sub_2638AE620((uint64_t)v23, (unsigned __int8 *)__p);
    }
    else
    {
      sub_2638AE940((uint64_t)v23, &v22);
    }
    ++v12;
  }
  long long v16 = *a3;
  uint64_t v17 = *((void *)a3 + 2);
  int v15 = sub_2638A1D7C((uint64_t)a1, (MetadataHandle *)&v16, a4);
  sub_2638BEEB0(a1, v10, (uint64_t)v23, v15);
  sub_2638A5C4C(&v24, v23[0]);
}

void sub_2638BE35C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,unsigned __int8 a24,char **a25)
{
}

void sub_2638BE39C(uint64_t *a1, unsigned int **a2, long long *a3, unsigned int a4, int a5)
{
  long long v25 = *a3;
  uint64_t v26 = *((void *)a3 + 2);
  int v10 = sub_2638A1CF8((uint64_t)a1, (MetadataHandle *)&v25, a4);
  sub_2638ABF5C((uint64_t)v23, 0, 0, 0, 2);
  std::string v12 = *a2;
  uint64_t v11 = a2[1];
  while (v12 != v11)
  {
    uint64_t v13 = *v12;
    unsigned int v22 = *v12;
    if (a5 == 11)
    {
      long long v18 = *a3;
      uint64_t v19 = *((void *)a3 + 2);
      sub_2638A2174((uint64_t)a1, (MetadataHandle *)&v18, a4, v13, __p);
      unint64_t v14 = v21;
      if ((v21 & 0x80u) != 0) {
        unint64_t v14 = (unint64_t)__p[1];
      }
      if (v14) {
        sub_2638AE784((uint64_t)v23, (uint64_t)__p);
      }
      else {
        sub_2638AF038((uint64_t)v23, &v22);
      }
      if ((char)v21 < 0) {
        operator delete(__p[0]);
      }
    }
    else if (a5 == 12)
    {
      LOBYTE(__p[0]) = v13 != 0;
      sub_2638AE620((uint64_t)v23, (unsigned __int8 *)__p);
    }
    else
    {
      sub_2638AF038((uint64_t)v23, &v22);
    }
    ++v12;
  }
  long long v16 = *a3;
  uint64_t v17 = *((void *)a3 + 2);
  int v15 = sub_2638A1D7C((uint64_t)a1, (MetadataHandle *)&v16, a4);
  sub_2638BEEB0(a1, v10, (uint64_t)v23, v15);
  sub_2638A5C4C(&v24, v23[0]);
}

void sub_2638BE528(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,unsigned __int8 a24,char **a25)
{
}

void sub_2638BE568(uint64_t *a1, uint64_t **a2, long long *a3, unsigned int a4, int a5)
{
  long long v25 = *a3;
  uint64_t v26 = *((void *)a3 + 2);
  int v10 = sub_2638A1CF8((uint64_t)a1, (MetadataHandle *)&v25, a4);
  sub_2638ABF5C((uint64_t)v23, 0, 0, 0, 2);
  std::string v12 = *a2;
  uint64_t v11 = a2[1];
  while (v12 != v11)
  {
    uint64_t v13 = *v12;
    uint64_t v22 = *v12;
    if (a5 == 11)
    {
      long long v18 = *a3;
      uint64_t v19 = *((void *)a3 + 2);
      sub_2638A2174((uint64_t)a1, (MetadataHandle *)&v18, a4, v13, __p);
      unint64_t v14 = v21;
      if ((v21 & 0x80u) != 0) {
        unint64_t v14 = (unint64_t)__p[1];
      }
      if (v14) {
        sub_2638AE784((uint64_t)v23, (uint64_t)__p);
      }
      else {
        sub_2638AF790((uint64_t)v23, &v22);
      }
      if ((char)v21 < 0) {
        operator delete(__p[0]);
      }
    }
    else if (a5 == 12)
    {
      LOBYTE(__p[0]) = v13 != 0;
      sub_2638AE620((uint64_t)v23, (unsigned __int8 *)__p);
    }
    else
    {
      sub_2638AF790((uint64_t)v23, &v22);
    }
    ++v12;
  }
  long long v16 = *a3;
  uint64_t v17 = *((void *)a3 + 2);
  int v15 = sub_2638A1D7C((uint64_t)a1, (MetadataHandle *)&v16, a4);
  sub_2638BEEB0(a1, v10, (uint64_t)v23, v15);
  sub_2638A5C4C(&v24, v23[0]);
}

void sub_2638BE6F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,unsigned __int8 a24,char **a25)
{
}

void sub_2638BE734(uint64_t *a1, int **a2, long long *a3, unsigned int a4, int a5)
{
  long long v25 = *a3;
  uint64_t v26 = *((void *)a3 + 2);
  int v10 = sub_2638A1CF8((uint64_t)a1, (MetadataHandle *)&v25, a4);
  sub_2638ABF5C((uint64_t)v23, 0, 0, 0, 2);
  std::string v12 = *a2;
  uint64_t v11 = a2[1];
  while (v12 != v11)
  {
    uint64_t v13 = *v12;
    int v22 = *v12;
    if (a5 == 11)
    {
      long long v18 = *a3;
      uint64_t v19 = *((void *)a3 + 2);
      sub_2638A2174((uint64_t)a1, (MetadataHandle *)&v18, a4, v13, __p);
      unint64_t v14 = v21;
      if ((v21 & 0x80u) != 0) {
        unint64_t v14 = (unint64_t)__p[1];
      }
      if (v14) {
        sub_2638AE784((uint64_t)v23, (uint64_t)__p);
      }
      else {
        sub_2638AFA00((uint64_t)v23, &v22);
      }
      if ((char)v21 < 0) {
        operator delete(__p[0]);
      }
    }
    else if (a5 == 12)
    {
      LOBYTE(__p[0]) = v13 != 0;
      sub_2638AE620((uint64_t)v23, (unsigned __int8 *)__p);
    }
    else
    {
      sub_2638AFA00((uint64_t)v23, &v22);
    }
    ++v12;
  }
  long long v16 = *a3;
  uint64_t v17 = *((void *)a3 + 2);
  int v15 = sub_2638A1D7C((uint64_t)a1, (MetadataHandle *)&v16, a4);
  sub_2638BEEB0(a1, v10, (uint64_t)v23, v15);
  sub_2638A5C4C(&v24, v23[0]);
}

void sub_2638BE8C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,unsigned __int8 a24,char **a25)
{
}

uint64_t MetadataHandle::getMessage(MetadataHandle *this)
{
  uint64_t v1 = *(void *)this;
  if (*(void *)this
    && (v2 = *((void *)this + 1), uint64_t v4 = v1 + 32, v3 = *(void *)(v1 + 32), v2 < (*(void *)(v4 + 8) - v3) >> 3))
  {
    return *(void *)(v3 + 8 * v2);
  }
  else
  {
    return 0;
  }
}

void *MetadataHelper::MetadataHelper(void *result, void *a2)
{
  uint64_t v2 = a2[1];
  *double result = *a2;
  result[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  result[2] = 0;
  result[3] = 0;
  result[4] = 0xFFFFFFFFLL;
  return result;
}

{
  uint64_t v2;

  uint64_t v2 = a2[1];
  *double result = *a2;
  result[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  result[2] = 0;
  result[3] = 0;
  result[4] = 0xFFFFFFFFLL;
  return result;
}

uint64_t MetadataHelper::getField(uint64_t a1, MetadataHandle *a2)
{
  return MetadataHandle::getField(a2);
}

__n128 MetricFileMetadataHelper::MetricFileMetadataHelper(MetricFileMetadataHelper *a1, void *a2)
{
  MetricFileMetadataHelper::MetricFileMetadataHelper(a1, a2);
  __n128 result = v2[5];
  v2[1] = result;
  v2[2].n128_u64[0] = v2[6].n128_u64[0];
  return result;
}

{
  __n128 *v2;
  __n128 result;

  MetricFileMetadataHelper::MetricFileMetadataHelper(a1, a2);
  __n128 result = v2[5];
  v2[1] = result;
  v2[2].n128_u64[0] = v2[6].n128_u64[0];
  return result;
}

double MetricFileMetadataHelper::getHandleForMetric@<D0>(__n128 *this@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
  __n128 v5 = this[5];
  unint64_t v6 = this[6].n128_u64[0];
  MetricFileMetadataHelper::resolveSubfieldInMetricHandle((MetricFileMetadataHelper *)this, &v5, a2, (uint64_t)&v7);
  double result = *(double *)&v7;
  *(_OWORD *)a3 = v7;
  *(void *)(a3 + 16) = v8;
  return result;
}

uint64_t sub_2638BEA30(uint64_t a1)
{
  sub_26389B614(a1 + 40);
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2) {
    sub_26389F6D4(v2);
  }
  return a1;
}

void sub_2638BEAE8(_Unwind_Exception *a1)
{
  sub_2638BEA30(v1);
  _Unwind_Resume(a1);
}

uint64_t MetricFileMetadataHelper::getSubfield(MetricFileMetadataHelper *a1, __n128 *a2, unsigned int a3)
{
  __n128 v4 = *a2;
  unint64_t v5 = a2[1].n128_u64[0];
  MetricFileMetadataHelper::resolveSubfieldInMetricHandle(a1, &v4, a3, (uint64_t)v6);
  return v7;
}

BOOL MetricFileMetadataHelper::isTopLevelField(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  if (!*a2)
  {
    long long v6 = *(_OWORD *)a2;
    uint64_t v7 = a2[2];
    MetadataHelper::descendIntoMessage(a1, (MetadataHandle *)&v6, (uint64_t)&v8);
    *(_OWORD *)a2 = v8;
    a2[2] = v9;
    uint64_t v3 = *a2;
  }
  return v3 == *(void *)(a1 + 80);
}

uint64_t MetricFileMetadataHelper::getComponentIds(WISMetadataLoader **this)
{
  return WISMetadataLoader::getComponentsAvailable(*this);
}

void MetricFileMetadataHelper::getMetricsInComponent(MetricFileMetadataHelper *this@<X0>, unsigned int a2@<W1>, char **a3@<X8>)
{
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  uint64_t MetadataForComponent = MetricFileMetadataHelper::getMetadataForComponent(this, a2);
  if (MetadataForComponent)
  {
    unint64_t v5 = *(uint64_t **)(MetadataForComponent + 32);
    if (v5 != *(uint64_t **)(MetadataForComponent + 40))
    {
      uint64_t v6 = *v5;
      uint64_t v7 = *(void *)(v6 + 8);
      uint64_t v8 = *(void *)(v6 + 16);
      if (v7 != v8)
      {
        uint64_t v9 = 0;
        int v10 = a3 + 2;
        do
        {
          if ((*(_WORD *)(*(void *)v7 + 52) & 0x40) != 0)
          {
            int v11 = *(_DWORD *)(*(void *)v7 + 40);
            if ((unint64_t)v9 >= *v10)
            {
              uint64_t v13 = *a3;
              uint64_t v14 = (v9 - *a3) >> 2;
              unint64_t v15 = v14 + 1;
              if ((unint64_t)(v14 + 1) >> 62) {
                sub_2638A2514();
              }
              uint64_t v16 = *v10 - (void)v13;
              if (v16 >> 1 > v15) {
                unint64_t v15 = v16 >> 1;
              }
              if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFFCLL) {
                unint64_t v17 = 0x3FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v17 = v15;
              }
              if (v17)
              {
                long long v18 = (char *)sub_2638AA2E0((uint64_t)(a3 + 2), v17);
                uint64_t v13 = *a3;
                uint64_t v9 = a3[1];
              }
              else
              {
                long long v18 = 0;
              }
              uint64_t v19 = &v18[4 * v14];
              *(_DWORD *)uint64_t v19 = v11;
              std::string v12 = v19 + 4;
              while (v9 != v13)
              {
                int v20 = *((_DWORD *)v9 - 1);
                v9 -= 4;
                *((_DWORD *)v19 - 1) = v20;
                v19 -= 4;
              }
              *a3 = v19;
              a3[1] = v12;
              a3[2] = &v18[4 * v17];
              if (v13) {
                operator delete(v13);
              }
            }
            else
            {
              *(_DWORD *)uint64_t v9 = v11;
              std::string v12 = v9 + 4;
            }
            a3[1] = v12;
            uint64_t v9 = v12;
          }
          v7 += 8;
        }
        while (v7 != v8);
      }
    }
  }
}

void sub_2638BECF0(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t DeviceConfigMetadataHelper::DeviceConfigMetadataHelper(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0xFFFFFFFFLL;
  WISMetadataLoader::loadDeviceConfigMetadata(*(WISMetadataLoader **)a2, (_OWORD *)(a1 + 40));
  *(void *)(a1 + 16) = *(void *)(a1 + 40);
  return a1;
}

void sub_2638BED70(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(std::__shared_weak_count **)(v1 + 8);
  if (v3) {
    sub_26389F6D4(v3);
  }
  _Unwind_Resume(exception_object);
}

double DeviceConfigMetadataHelper::getSubfieldType@<D0>(uint64_t a1@<X0>, __n128 *a2@<X1>, unsigned int a3@<W2>, __n128 *a4@<X8>)
{
  __n128 v6 = *a2;
  unint64_t v7 = a2[1].n128_u64[0];
  MetadataHelper::resolveSubfieldInHandle(a1, &v6, a3, &v8);
  double result = v8.n128_f64[0];
  *a4 = v8;
  a4[1].n128_u64[0] = v9;
  return result;
}

void sub_2638BEDE0(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EB74E8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_2638BEE00(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EB74E8;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x263E6D460);
}

void sub_2638BEE54(uint64_t a1, void *__p)
{
  if (*(unsigned char *)(a1 + 8))
  {
    uint64_t v3 = (std::__shared_weak_count *)__p[4];
    if (v3) {
      sub_26389F6D4(v3);
    }
  }
  else if (!__p)
  {
    return;
  }

  operator delete(__p);
}

void sub_2638BEEB0(uint64_t *a1, char *a2, uint64_t a3, int a4)
{
  if (a4)
  {
    unint64_t v5 = sub_2638BF000(*a1, a2);
    if (!*v5)
    {
      sub_2638ABF5C((uint64_t)v16, 0, 0, 0, 2);
      int v6 = *v5;
      *unint64_t v5 = v16[0];
      v16[0] = v6;
      unint64_t v7 = (char **)*((void *)v5 + 1);
      *((void *)v5 + 1) = v17;
      unint64_t v17 = v7;
      sub_2638A5C4C(&v17, v6);
    }
    if (*(unsigned char *)a3 == 2)
    {
      __n128 v8 = *(uint64_t **)(a3 + 8);
      uint64_t v10 = *v8;
      unint64_t v9 = (unsigned __int8 *)v8[1];
      xpc_object_t v19[2] = v10;
      v19[3] = 0;
      v19[4] = 0x8000000000000000;
      void v18[2] = v9;
      void v18[3] = 0;
      v18[4] = (unsigned __int8 *)0x8000000000000000;
      v19[0] = a3;
      v19[1] = 0;
      v18[0] = (unsigned __int8 *)a3;
      v18[1] = 0;
      sub_2638BF4CC((uint64_t)v19, v18, (uint64_t)v5, (uint64_t)v20);
    }
    else
    {
      sub_2638BF1B8((uint64_t)v5, (char *)a3);
    }
  }
  else
  {
    unsigned __int8 v14 = *(unsigned char *)a3;
    unint64_t v15 = *(char ***)(a3 + 8);
    *(unsigned char *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    int v11 = sub_2638BF000(*a1, a2);
    int v12 = *v11;
    *int v11 = v14;
    uint64_t v13 = (char **)*((void *)v11 + 1);
    *((void *)v11 + 1) = v15;
    unint64_t v15 = v13;
    sub_2638A5C4C(&v15, v12);
  }
}

void sub_2638BEFE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unsigned __int8 a10)
{
  sub_2638A5C4C(v10, a10);
  _Unwind_Resume(a1);
}

char *sub_2638BF000(uint64_t a1, char *a2)
{
  if (*(unsigned char *)a1)
  {
    if (*(unsigned char *)a1 != 1)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      unint64_t v9 = (char *)sub_2638AC360((char *)a1);
      sub_2638A5294(&v12, v9);
      uint64_t v10 = std::string::insert(&v12, 0, "cannot use operator[] with a string argument with ");
      long long v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
      std::string::size_type v14 = v10->__r_.__value_.__r.__words[2];
      *(_OWORD *)std::string __p = v11;
      v10->__r_.__value_.__l.__size_ = 0;
      v10->__r_.__value_.__r.__words[2] = 0;
      v10->__r_.__value_.__r.__words[0] = 0;
      sub_2638A4F78(305, (uint64_t)__p, exception);
      __cxa_throw(exception, (struct type_info *)&unk_270EB63B8, (void (*)(void *))sub_2638A50BC);
    }
  }
  else
  {
    *(unsigned char *)a1 = 1;
    __n128 v4 = operator new(0x18uLL);
    v4[2] = 0;
    v4[1] = 0;
    *__n128 v4 = v4 + 1;
    *(void *)(a1 + 8) = v4;
  }
  unint64_t v5 = *(uint64_t ***)(a1 + 8);
  sub_2638A5294(__p, a2);
  v12.__r_.__value_.__r.__words[0] = (std::string::size_type)__p;
  int v6 = sub_2638BF42C(v5, (const void **)__p, (uint64_t)&unk_2638C9AC4, &v12);
  if (SHIBYTE(v14) < 0) {
    operator delete(__p[0]);
  }
  return (char *)v6 + 56;
}

void sub_2638BF140(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_2638BF1B8(uint64_t a1, char *a2)
{
  if (*(unsigned char *)a1)
  {
    if (*(unsigned char *)a1 != 2)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      unint64_t v7 = (char *)sub_2638AC360((char *)a1);
      sub_2638A5294(&v10, v7);
      __n128 v8 = std::string::insert(&v10, 0, "cannot use emplace_back() with ");
      long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
      std::string::size_type v12 = v8->__r_.__value_.__r.__words[2];
      long long v11 = v9;
      v8->__r_.__value_.__l.__size_ = 0;
      v8->__r_.__value_.__r.__words[2] = 0;
      v8->__r_.__value_.__r.__words[0] = 0;
      sub_2638A4F78(311, (uint64_t)&v11, exception);
      __cxa_throw(exception, (struct type_info *)&unk_270EB63B8, (void (*)(void *))sub_2638A50BC);
    }
    __n128 v4 = *(uint64_t **)(a1 + 8);
  }
  else
  {
    *(unsigned char *)a1 = 2;
    __n128 v4 = (uint64_t *)operator new(0x18uLL);
    v4[1] = 0;
    v4[2] = 0;
    *__n128 v4 = 0;
    *(void *)(a1 + 8) = v4;
  }

  return sub_2638BFB80(v4, a2);
}

void sub_2638BF2BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

uint64_t sub_2638BF31C(uint64_t *a1, char *a2)
{
  unint64_t v6 = a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = *(void *)(result - 8);
  if (v7 >= v6)
  {
    uint64_t v9 = (uint64_t)(v7 - *a1) >> 4;
    unint64_t v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 60) {
      sub_2638A2514();
    }
    uint64_t v11 = v5 - *a1;
    if (v11 >> 3 > v10) {
      unint64_t v10 = v11 >> 3;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v12 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v10;
    }
    v16[4] = result;
    uint64_t v13 = (char *)sub_2638A61F0(result, v12);
    std::string::size_type v14 = &v13[16 * v9];
    v16[0] = v13;
    v16[1] = v14;
    xpc_object_t v16[3] = &v13[16 * v15];
    char *v14 = *a2;
    *((void *)v14 + 1) = *((void *)a2 + 1);
    *a2 = 0;
    *((void *)a2 + 1) = 0;
    v16[2] = v14 + 16;
    sub_2638A6178(a1, v16);
    uint64_t v8 = a1[1];
    uint64_t result = sub_2638A633C((uint64_t)v16);
  }
  else
  {
    *(unsigned char *)unint64_t v7 = *a2;
    *(void *)(v7 + 8) = *((void *)a2 + 1);
    *a2 = 0;
    *((void *)a2 + 1) = 0;
    uint64_t v8 = v7 + 16;
    a1[1] = v7 + 16;
  }
  a1[1] = v8;
  return result;
}

void sub_2638BF418(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_2638A633C((uint64_t)va);
  _Unwind_Resume(a1);
}

_OWORD *sub_2638BF42C(uint64_t **a1, const void **a2, uint64_t a3, _OWORD **a4)
{
  unint64_t v6 = (void **)sub_2638AC8B0((uint64_t)a1, &v12, a2);
  unint64_t v7 = *v6;
  if (!*v6)
  {
    uint64_t v8 = (uint64_t **)v6;
    unint64_t v7 = operator new(0x48uLL);
    uint64_t v9 = *a4;
    uint64_t v10 = *((void *)*a4 + 2);
    xpc_object_t v7[2] = **a4;
    *((void *)v7 + 6) = v10;
    v9[1] = 0;
    xpc_object_t v9[2] = 0;
    void *v9 = 0;
    *((unsigned char *)v7 + 56) = 0;
    *((void *)v7 + 8) = 0;
    sub_2638AC858(a1, v12, v8, (uint64_t *)v7);
  }
  return v7;
}

__n128 sub_2638BF4CC@<Q0>(uint64_t a1@<X1>, unsigned __int8 **a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  while (!sub_2638BF5C8((unsigned __int8 **)a1, a2))
  {
    uint64_t v8 = sub_2638BF8D0(a1);
    sub_2638BFA1C(a3, v8);
    sub_2638BF558((unsigned __int8 **)a1);
  }
  *(void *)a4 = *(void *)a1;
  *(_OWORD *)(a4 + 8) = *(_OWORD *)(a1 + 8);
  __n128 result = *(__n128 *)(a1 + 24);
  *(__n128 *)(a4 + 24) = result;
  *(void *)(a4 + 4sub_2638B7290(&a9, 0) = a3;
  return result;
}

unsigned __int8 **sub_2638BF558(unsigned __int8 **result)
{
  int v1 = **result;
  if (v1 == 2)
  {
    result[2] += 16;
  }
  else if (v1 == 1)
  {
    uint64_t v2 = result[1];
    uint64_t v3 = (unsigned __int8 *)*((void *)v2 + 1);
    if (v3)
    {
      do
      {
        __n128 v4 = v3;
        uint64_t v3 = *(unsigned __int8 **)v3;
      }
      while (v3);
    }
    else
    {
      do
      {
        __n128 v4 = (unsigned __int8 *)*((void *)v2 + 2);
        BOOL v5 = *(void *)v4 == (void)v2;
        uint64_t v2 = v4;
      }
      while (!v5);
    }
    result[1] = v4;
  }
  else
  {
    ++result[4];
  }
  return result;
}

BOOL sub_2638BF5C8(unsigned __int8 **a1, unsigned __int8 **a2)
{
  if (*a1 != *a2)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    sub_2638A5294(v7, "cannot compare iterators of different containers");
    sub_2638BF6D0(212, (uint64_t)v7, exception);
    __cxa_throw(exception, (struct type_info *)&unk_270EB7528, (void (*)(void *))sub_2638BF814);
  }
  int v2 = **a1;
  if (v2 == 2)
  {
    uint64_t v3 = a1[2];
    __n128 v4 = a2[2];
  }
  else if (v2 == 1)
  {
    uint64_t v3 = a1[1];
    __n128 v4 = a2[1];
  }
  else
  {
    uint64_t v3 = a1[4];
    __n128 v4 = a2[4];
  }
  return v3 == v4;
}

void sub_2638BF698(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
  {
    operator delete(__p);
    if ((v16 & 1) == 0) {
LABEL_6:
    }
      _Unwind_Resume(a1);
  }
  else if (!v16)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v15);
  goto LABEL_6;
}

void sub_2638BF6D0(int a1@<W0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  sub_2638A5294(&__p, "invalid_iterator");
  sub_2638A5110(a1, &v14);
  int v6 = *(char *)(a2 + 23);
  if (v6 >= 0) {
    unint64_t v7 = (const std::string::value_type *)a2;
  }
  else {
    unint64_t v7 = *(const std::string::value_type **)a2;
  }
  if (v6 >= 0) {
    std::string::size_type v8 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    std::string::size_type v8 = *(void *)(a2 + 8);
  }
  uint64_t v9 = std::string::append(&v14, v7, v8);
  long long v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
  int64_t v16 = v9->__r_.__value_.__r.__words[2];
  *(_OWORD *)uint64_t v15 = v10;
  v9->__r_.__value_.__l.__size_ = 0;
  v9->__r_.__value_.__r.__words[2] = 0;
  v9->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v14.__r_.__value_.__l.__data_);
  }
  if (v13 < 0) {
    operator delete(__p);
  }
  if (v16 >= 0) {
    uint64_t v11 = v15;
  }
  else {
    uint64_t v11 = (void **)v15[0];
  }
  sub_2638A5348((uint64_t)a3, a1, (uint64_t)v11);
  *a3 = &unk_270EB7550;
  if (SHIBYTE(v16) < 0) {
    operator delete(v15[0]);
  }
}

void sub_2638BF7CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a26 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_2638BF814(std::exception *a1)
{
  a1->__vftable = (std::exception_vtbl *)&unk_270EB6408;
  MEMORY[0x263E6D1D0](&a1[2]);

  std::exception::~exception(a1);
}

void sub_2638BF868(std::exception *a1)
{
  a1->__vftable = (std::exception_vtbl *)&unk_270EB6408;
  MEMORY[0x263E6D1D0](&a1[2]);
  std::exception::~exception(a1);

  JUMPOUT(0x263E6D460);
}

unsigned char *sub_2638BF8D0(uint64_t a1)
{
  __n128 result = *(unsigned char **)a1;
  int v3 = *result;
  if (v3 == 1) {
    return (unsigned char *)(*(void *)(a1 + 8) + 56);
  }
  if (v3 == 2) {
    return *(unsigned char **)(a1 + 16);
  }
  if (!*result)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    sub_2638A5294(v6, "cannot get value");
    sub_2638BF6D0(214, (uint64_t)v6, exception);
    __cxa_throw(exception, (struct type_info *)&unk_270EB7528, (void (*)(void *))sub_2638BF814);
  }
  if (*(void *)(a1 + 32))
  {
    __n128 v4 = __cxa_allocate_exception(0x20uLL);
    sub_2638A5294(v6, "cannot get value");
    sub_2638BF6D0(214, (uint64_t)v6, v4);
    __cxa_throw(v4, (struct type_info *)&unk_270EB7528, (void (*)(void *))sub_2638BF814);
  }
  return result;
}

void sub_2638BF9E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (v16) {
    __cxa_free_exception(v15);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_2638BFA1C(uint64_t a1, char *a2)
{
  if (*(unsigned char *)a1)
  {
    if (*(unsigned char *)a1 != 2)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      unint64_t v7 = (char *)sub_2638AC360((char *)a1);
      sub_2638A5294(&v10, v7);
      std::string::size_type v8 = std::string::insert(&v10, 0, "cannot use push_back() with ");
      long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
      std::string::size_type v12 = v8->__r_.__value_.__r.__words[2];
      long long v11 = v9;
      v8->__r_.__value_.__l.__size_ = 0;
      v8->__r_.__value_.__r.__words[2] = 0;
      v8->__r_.__value_.__r.__words[0] = 0;
      sub_2638A4F78(308, (uint64_t)&v11, exception);
      __cxa_throw(exception, (struct type_info *)&unk_270EB63B8, (void (*)(void *))sub_2638A50BC);
    }
    __n128 v4 = *(uint64_t **)(a1 + 8);
  }
  else
  {
    *(unsigned char *)a1 = 2;
    __n128 v4 = (uint64_t *)operator new(0x18uLL);
    v4[1] = 0;
    v4[2] = 0;
    *__n128 v4 = 0;
    *(void *)(a1 + 8) = v4;
  }

  return sub_2638BF31C(v4, a2);
}

void sub_2638BFB20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

uint64_t sub_2638BFB80(uint64_t *a1, char *a2)
{
  unint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = *(void *)(v4 - 8);
  if (v7 >= v6)
  {
    uint64_t v9 = (uint64_t)(v7 - *a1) >> 4;
    unint64_t v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 60) {
      sub_2638A2514();
    }
    uint64_t v11 = v5 - *a1;
    if (v11 >> 3 > v10) {
      unint64_t v10 = v11 >> 3;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v12 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v10;
    }
    v17[4] = v4;
    char v13 = (char *)sub_2638A61F0(v4, v12);
    std::string v14 = &v13[16 * v9];
    v17[0] = v13;
    v17[1] = v14;
    v17[3] = &v13[16 * v15];
    char *v14 = *a2;
    *((void *)v14 + 1) = *((void *)a2 + 1);
    *a2 = 0;
    *((void *)a2 + 1) = 0;
    xpc_object_t v17[2] = v14 + 16;
    sub_2638A6178(a1, v17);
    uint64_t v8 = a1[1];
    sub_2638A633C((uint64_t)v17);
  }
  else
  {
    *(unsigned char *)unint64_t v7 = *a2;
    *(void *)(v7 + 8) = *((void *)a2 + 1);
    *a2 = 0;
    *((void *)a2 + 1) = 0;
    uint64_t v8 = v7 + 16;
    a1[1] = v7 + 16;
  }
  a1[1] = v8;
  return v8 - 16;
}

void sub_2638BFC80(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_2638A633C((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_2638BFC94(uint64_t *a1)
{
  *a1 = (uint64_t)&unk_270EB7578;
  sub_2638B7290(a1 + 1, 0);

  WISMetadataLoaderDelegate::~WISMetadataLoaderDelegate((WISMetadataLoaderDelegate *)a1);
}

void sub_2638BFCEC(uint64_t *a1)
{
  *a1 = (uint64_t)&unk_270EB7578;
  sub_2638B7290(a1 + 1, 0);

  WISMetadataLoaderDelegate::~WISMetadataLoaderDelegate((WISMetadataLoaderDelegate *)a1);
}

void sub_2638BFD44(uint64_t *a1)
{
  *a1 = (uint64_t)&unk_270EB7578;
  sub_2638B7290(a1 + 1, 0);
  WISMetadataLoaderDelegate::~WISMetadataLoaderDelegate((WISMetadataLoaderDelegate *)a1);

  JUMPOUT(0x263E6D460);
}

void sub_2638BFDB0(uint64_t a1@<X0>, int a2@<W1>, int a3@<W2>, void *a4@<X8>)
{
  unint64_t v7 = (_DWORD *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 80))(a1);
  uint64_t v9 = (unsigned __int8 *)sub_2638BFE24(v7, v8, a2, a3);

  sub_26389F1B8(v9, v10, a4);
}

char *sub_2638BFE24(_DWORD *a1, uint64_t a2, int a3, int a4)
{
  if (!a1 || a2 < 4) {
    return 0;
  }
  uint64_t v4 = 0;
  if (a2 != 4 && *a1 == 1296324417)
  {
    unint64_t v6 = (unint64_t)a1 + a2;
    unint64_t v7 = (unsigned __int16 *)(a1 + 1);
    while (1)
    {
      uint64_t v8 = v7[1];
      uint64_t v9 = v7 + 2;
      unint64_t v10 = (unint64_t)&v7[2 * v8 + 2] <= v6 ? *v7 | (unint64_t)(v8 << 32) : 0;
      if (!(_WORD)v10) {
        break;
      }
      unint64_t v11 = HIDWORD(v10);
      int v12 = (unsigned __int16)v10;
      int v13 = v10 & 0xFFFE;
      if (a3) {
        BOOL v14 = 1;
      }
      else {
        BOOL v14 = (unsigned __int16)v10 == 2;
      }
      char v15 = !v14;
      if (v13 == 2 && (v15 & 1) == 0)
      {
        BOOL v16 = a3 != 1 || v12 == 3;
        BOOL v17 = !v16;
        if (v11 >= 3 && !v17)
        {
          uint64_t v18 = *((unsigned int *)v7 + 3);
          uint64_t v4 = (char *)a1 + *((unsigned int *)v7 + 2);
          if ((unint64_t)&v4[v18] <= v6 && *v9 == a4) {
            return v4;
          }
        }
      }
      unint64_t v7 = (unsigned __int16 *)&v9[v11];
      if ((unint64_t)v7 >= v6) {
        return 0;
      }
    }
    return 0;
  }
  return v4;
}

void sub_2638BFF04(uint64_t a1@<X0>, int a2@<W1>, void *a3@<X8>)
{
  unint64_t v5 = (_DWORD *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 80))(a1);
  unint64_t v7 = (unsigned __int8 *)sub_2638BFE24(v5, v6, a2, 0);

  sub_26389F1B8(v7, v8, a3);
}

void sub_2638BFF6C(uint64_t a1@<X0>, void *a2@<X8>)
{
  int v3 = (_DWORD *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 80))(a1);
  unint64_t v5 = (unsigned __int8 *)sub_2638BFFC8(v3, v4);

  sub_26389F1B8(v5, v6, a2);
}

char *sub_2638BFFC8(_DWORD *a1, uint64_t a2)
{
  if (!a1 || a2 < 4) {
    return 0;
  }
  int v2 = 0;
  if (a2 != 4 && *a1 == 1296324417)
  {
    unint64_t v4 = (unint64_t)a1 + a2;
    unint64_t v5 = (unsigned __int16 *)(a1 + 1);
    while (1)
    {
      uint64_t v6 = v5[1];
      unint64_t v7 = v5 + 2;
      unint64_t v8 = *v5 | (unint64_t)(v6 << 32);
      if ((unint64_t)&v5[2 * v6 + 2] > v4) {
        unint64_t v8 = 0;
      }
      if (!(_WORD)v8) {
        break;
      }
      if (v8 >> 33) {
        BOOL v9 = (unsigned __int16)v8 == 5;
      }
      else {
        BOOL v9 = 0;
      }
      if (v9)
      {
        uint64_t v10 = *((unsigned int *)v5 + 2);
        int v2 = (char *)a1 + *((unsigned int *)v5 + 1);
        if ((unint64_t)&v2[v10] <= v4) {
          return v2;
        }
      }
      unint64_t v5 = (unsigned __int16 *)((char *)v7 + (v8 >> 30));
      if ((unint64_t)v5 >= v4) {
        return 0;
      }
    }
    return 0;
  }
  return v2;
}

void sub_2638C0074(uint64_t a1@<X0>, void *a2@<X8>)
{
  int v3 = (_DWORD *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 80))(a1);
  unint64_t v5 = (unsigned __int8 *)sub_2638C0198(v3, v4);

  sub_2638C00D0(v5, v6, a2);
}

void sub_2638C00D0(unsigned __int8 *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  if (a1 && a2)
  {
    PB::Reader::Reader((PB::Reader *)&v5, a1);
    uint64_t v4 = (std::__shared_weak_count *)operator new(0x38uLL);
    v4->__shared_owners_ = 0;
    v4->__shared_weak_owners_ = 0;
    v4->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EB75F8;
    *a3 = sub_2638B6204(&v4[1].__vftable);
    a3[1] = v4;
    if ((((uint64_t (*)(void))v4[1].__on_zero_shared)() & 1) == 0)
    {
      *a3 = 0;
      a3[1] = 0;
      sub_26389F6D4(v4);
    }
  }
  else
  {
    *a3 = 0;
    a3[1] = 0;
  }
}

void sub_2638C0184(_Unwind_Exception *a1)
{
  sub_26389F6D4(v1);
  _Unwind_Resume(a1);
}

char *sub_2638C0198(_DWORD *a1, uint64_t a2)
{
  if (!a1 || a2 < 4) {
    return 0;
  }
  int v2 = 0;
  if (a2 != 4 && *a1 == 1296324417)
  {
    unint64_t v4 = (unint64_t)a1 + a2;
    uint64_t v5 = (unsigned __int16 *)(a1 + 1);
    while (1)
    {
      uint64_t v6 = v5[1];
      unint64_t v7 = v5 + 2;
      unint64_t v8 = *v5 | (unint64_t)(v6 << 32);
      if ((unint64_t)&v5[2 * v6 + 2] > v4) {
        unint64_t v8 = 0;
      }
      if (!(_WORD)v8) {
        break;
      }
      if (v8 >> 33) {
        BOOL v9 = (unsigned __int16)v8 == 6;
      }
      else {
        BOOL v9 = 0;
      }
      if (v9)
      {
        uint64_t v10 = *((unsigned int *)v5 + 2);
        int v2 = (char *)a1 + *((unsigned int *)v5 + 1);
        if ((unint64_t)&v2[v10] <= v4) {
          return v2;
        }
      }
      uint64_t v5 = (unsigned __int16 *)((char *)v7 + (v8 >> 30));
      if ((unint64_t)v5 >= v4) {
        return 0;
      }
    }
    return 0;
  }
  return v2;
}

void sub_2638C0244(uint64_t a1@<X0>, int a2@<W1>, char **a3@<X8>)
{
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  uint64_t v5 = (_DWORD *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 80))(a1);
  unint64_t v7 = v5;
  if (v5) {
    BOOL v8 = v6 < 4;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8 && v6 != 4 && *v5 == 1296324417)
  {
    uint64_t v10 = 0;
    unint64_t v11 = (unint64_t)v5 + v6;
    int v12 = (unsigned __int16 *)(v5 + 1);
    int v13 = a3 + 2;
    do
    {
      uint64_t v14 = v12[1];
      char v15 = (int *)(v12 + 2);
      if ((unint64_t)&v12[2 * v14 + 2] <= v11) {
        unint64_t v16 = *v12 | (unint64_t)(v14 << 32);
      }
      else {
        unint64_t v16 = 0;
      }
      if (!(_WORD)v16) {
        break;
      }
      unint64_t v17 = HIDWORD(v16);
      int v18 = (unsigned __int16)v16;
      int v19 = v16 & 0xFFFE;
      if (a2) {
        BOOL v20 = 1;
      }
      else {
        BOOL v20 = (unsigned __int16)v16 == 2;
      }
      char v21 = !v20;
      if (v19 == 2 && (v21 & 1) == 0)
      {
        BOOL v22 = a2 != 1 || v18 == 3;
        BOOL v23 = !v22;
        if (v17 >= 3 && !v23)
        {
          if ((unint64_t)v7 + *((unsigned int *)v12 + 2) + *((unsigned int *)v12 + 3) <= v11) {
            int v24 = *v15;
          }
          else {
            int v24 = 0;
          }
          if ((unint64_t)v10 >= *v13)
          {
            uint64_t v26 = *a3;
            uint64_t v27 = (v10 - *a3) >> 2;
            unint64_t v28 = v27 + 1;
            if ((unint64_t)(v27 + 1) >> 62) {
              sub_2638A2514();
            }
            uint64_t v29 = *v13 - (void)v26;
            if (v29 >> 1 > v28) {
              unint64_t v28 = v29 >> 1;
            }
            if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v30 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v30 = v28;
            }
            if (v30)
            {
              uint64_t v31 = (char *)sub_2638AA2E0((uint64_t)(a3 + 2), v30);
              uint64_t v26 = *a3;
              uint64_t v10 = a3[1];
            }
            else
            {
              uint64_t v31 = 0;
            }
            BOOL v32 = &v31[4 * v27];
            *(_DWORD *)BOOL v32 = v24;
            long long v25 = v32 + 4;
            while (v10 != v26)
            {
              int v33 = *((_DWORD *)v10 - 1);
              v10 -= 4;
              *((_DWORD *)v32 - 1) = v33;
              v32 -= 4;
            }
            *a3 = v32;
            a3[1] = v25;
            a3[2] = &v31[4 * v30];
            if (v26) {
              operator delete(v26);
            }
          }
          else
          {
            *(_DWORD *)uint64_t v10 = v24;
            long long v25 = v10 + 4;
          }
          a3[1] = v25;
          uint64_t v10 = v25;
        }
      }
      int v12 = (unsigned __int16 *)&v15[v17];
    }
    while ((unint64_t)v12 < v11);
  }
}

void sub_2638C0438(_Unwind_Exception *exception_object)
{
  int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_2638C045C(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 8);
  if (!v1) {
    operator new();
  }
  if (!*v1) {
    return 0;
  }
  uint64_t result = v1[1];
  if (result == -1) {
    return 0;
  }
  return result;
}

void sub_2638C04E0(_Unwind_Exception *a1)
{
  MEMORY[0x263E6D460](v1, 0x10A0C404E934A1DLL);
  _Unwind_Resume(a1);
}

void *sub_2638C0504@<X0>(void *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_DWORD *)a3 = 0;
  *(_OWORD *)(a3 + 8) = 0u;
  uint64_t v4 = a3 + 8;
  *(_OWORD *)(a3 + 24) = 0u;
  *(_DWORD *)(a3 + 4sub_2638B7290(&a9, 0) = 1065353216;
  *(_OWORD *)(a3 + 48) = 0u;
  *(_OWORD *)(a3 + 64) = 0u;
  *(_DWORD *)(a3 + 8sub_2638B7290(&a9, 0) = 1065353216;
  *(void *)(a3 + 88) = 0;
  *(void *)(a3 + 96) = 0;
  if (result)
  {
    if (a2 >= 4)
    {
      uint64_t v5 = result;
      if (a2 != 4 && *(_DWORD *)result == 1296324417)
      {
        unint64_t v6 = (unint64_t)result + a2;
        unint64_t v7 = (unsigned int *)result + 1;
        do
        {
          uint64_t v8 = *((unsigned __int16 *)v7 + 1);
          BOOL v9 = v7 + 1;
          unint64_t v10 = *(unsigned __int16 *)v7 | (unint64_t)(v8 << 32);
          if ((unint64_t)&v7[v8 + 1] > v6) {
            unint64_t v10 = 0;
          }
          if (!(_WORD)v10) {
            break;
          }
          unint64_t v11 = HIDWORD(v10);
          if ((unsigned __int16)v10 - 2 < 2)
          {
            if (HIDWORD(v10) >= 3)
            {
              uint64_t v13 = v7[3];
              uint64_t v14 = (char *)v5 + v7[2];
              if ((unint64_t)&v14[v13] <= v6)
              {
                unsigned int v15 = *v9;
                BOOL v20 = v14;
                uint64_t v21 = v13;
                unsigned int v19 = v15;
                BOOL v22 = &v19;
                if ((unsigned __int16)v10 == 2) {
                  uint64_t result = sub_2638C0804(v4, &v19, (uint64_t)&unk_2638C9AC4, &v22);
                }
                else {
                  uint64_t result = sub_2638C0804(a3 + 48, &v19, (uint64_t)&unk_2638C9AC4, &v22);
                }
                result[3] = v14;
                result[4] = v13;
              }
            }
          }
          else if ((unsigned __int16)v10 == 6)
          {
            if (HIDWORD(v10) >= 2)
            {
              uint64_t v17 = v7[1];
              uint64_t v16 = v7[2];
              int v18 = (char *)v5 + v17;
              if ((unint64_t)&v18[v16] <= v6)
              {
                *(void *)(a3 + 88) = v18;
                *(void *)(a3 + 96) = v16;
                return result;
              }
            }
          }
          else if ((unsigned __int16)v10 == 1 && HIDWORD(v10) != 0)
          {
            *(_DWORD *)a3 = *v9;
          }
          unint64_t v7 = &v9[v11];
        }
        while ((unint64_t)v7 < v6);
      }
    }
  }
  return result;
}

void sub_2638C06BC(_Unwind_Exception *a1)
{
  sub_2638B7178(v2);
  sub_2638B7178(v1);
  _Unwind_Resume(a1);
}

FILE **sub_2638C06D8(FILE **a1, char *__filename)
{
  *a1 = 0;
  a1[1] = (FILE *)-1;
  a1[2] = 0;
  int v3 = fopen(__filename, "rb");
  *a1 = v3;
  if (v3)
  {
    int v4 = fileno(v3);
    if ((v4 & 0x80000000) == 0)
    {
      int v5 = v4;
      if (!fstat(v4, &v8))
      {
        st_std::string::size_type size = v8.st_size;
        a1[2] = (FILE *)v8.st_size;
        a1[1] = (FILE *)mmap(0, st_size, 1, 1025, v5, 0);
      }
    }
  }
  return a1;
}

void sub_2638C0768(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EB75F8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_2638C0788(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EB75F8;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x263E6D460);
}

uint64_t sub_2638C07DC(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void *sub_2638C0804(uint64_t a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
    unint64_t v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      unint64_t v11 = *v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (*((_DWORD *)v11 + 4) == v7) {
              return v11;
            }
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8) {
                v12 %= v8;
              }
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4) {
              break;
            }
          }
          unint64_t v11 = (void *)*v11;
        }
        while (v11);
      }
    }
  }
  unint64_t v11 = operator new(0x28uLL);
  *unint64_t v11 = 0;
  v11[1] = v7;
  *((_DWORD *)v11 + 4) = **a4;
  void v11[3] = 0;
  v11[4] = 0;
  float v13 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v14 = *(float *)(a1 + 32);
  if (!v8 || (float)(v14 * (float)v8) < v13)
  {
    BOOL v15 = 1;
    if (v8 >= 3) {
      BOOL v15 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v16 = v15 | (2 * v8);
    unint64_t v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17) {
      size_t v18 = v17;
    }
    else {
      size_t v18 = v16;
    }
    sub_26389EF6C(a1, v18);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }
  uint64_t v19 = *(void *)a1;
  BOOL v20 = *(void **)(*(void *)a1 + 8 * v4);
  if (v20)
  {
    *unint64_t v11 = *v20;
LABEL_38:
    *BOOL v20 = v11;
    goto LABEL_39;
  }
  *unint64_t v11 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v11;
  *(void *)(v19 + 8 * v4) = a1 + 16;
  if (*v11)
  {
    unint64_t v21 = *(void *)(*v11 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v21 >= v8) {
        v21 %= v8;
      }
    }
    else
    {
      v21 &= v8 - 1;
    }
    BOOL v20 = (void *)(*(void *)a1 + 8 * v21);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v11;
}

void sub_2638C0A18(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

const char *wis::asString(unsigned int a1)
{
  if (a1 > 2) {
    return "???";
  }
  else {
    return (&off_2655D7F90)[(char)a1];
  }
}

const char *wis::asString(wis *this)
{
  uint64_t v1 = "???";
  if (this == 1) {
    uint64_t v1 = "24h";
  }
  if (this == 2) {
    return "1h";
  }
  else {
    return v1;
  }
}

unint64_t wis::getWISTimestamp(wis *this)
{
  gettimeofday(&v2, 0);
  return 1000 * v2.tv_sec + v2.tv_usec / 0x3E8uLL;
}

unint64_t wis::timevalToTimestamp(wis *this, timeval *a2)
{
  return 1000 * *(void *)this + *((int *)this + 2) / 0x3E8uLL;
}

void *wis::tagSerializedProtobuf(int a1, uint64_t a2)
{
  int v3 = *(_DWORD *)(a2 + 8);
  unint64_t v4 = *(char **)a2;
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
    LODWORD(v1sub_2638B7290(&a9, 0) = 0;
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
  uint64_t result = sub_2638C0C00((char **)a2, v4, (v12 + v9), &v14);
  if (v9) {
    uint64_t result = memcpy(*(void **)a2, __src, v9);
  }
  if (v12) {
    return memcpy((void *)(*(void *)a2 + v9), v15, v12);
  }
  return result;
}

char *sub_2638C0C00(char **a1, char *__src, unint64_t a3, char *a4)
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
      size_t v18 = a1[1];
      unint64_t v20 = a3;
      goto LABEL_17;
    }
    size_t v18 = &__src[a3];
    uint64_t v19 = a1[1];
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
      unint64_t v21 = &__src[a3];
      BOOL v22 = v18;
      if (&v18[-a3] < v9)
      {
        if (a3 <= v16) {
          unint64_t v23 = v9 - __src;
        }
        else {
          unint64_t v23 = a3;
        }
        int v24 = &__src[-a3];
        long long v25 = __src;
        uint64_t v26 = __src;
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
        BOOL v22 = &v25[v16];
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
      unint64_t v28 = __src;
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
    sub_2638A2514();
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
    BOOL v15 = operator new(v14);
  }
  else {
    BOOL v15 = 0;
  }
  uint64_t v29 = &v12[(void)v15];
  unint64_t v30 = &v29[v6];
  uint64_t v31 = v29;
  do
  {
    *v31++ = *v5;
    --v6;
  }
  while (v6);
  BOOL v32 = *a1;
  if (*a1 == __src)
  {
    xpc_object_t v34 = v29;
  }
  else
  {
    int v33 = __src;
    xpc_object_t v34 = v29;
    do
    {
      char v35 = *--v33;
      *--xpc_object_t v34 = v35;
    }
    while (v33 != v32);
    size_t v9 = a1[1];
  }
  double v36 = (char *)v15 + v14;
  if (v9 != __src) {
    memmove(v30, __src, v9 - __src);
  }
  uint64_t v37 = *a1;
  *a1 = v34;
  a1[1] = &v30[v9 - __src];
  a1[2] = v36;
  if (v37) {
    operator delete(v37);
  }
  return v29;
}

uint64_t wis::serializeMetric@<X0>(wis *this@<X0>, const wireless_diagnostics::google::protobuf::MessageLite *a2@<X1>, unint64_t *a3@<X8>)
{
  signed int v6 = (*(uint64_t (**)(wis *))(*(void *)this + 72))(this);
  wis::createTagForProtobuf(a2, v6, a3);
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
    sub_2638C13E8(a3, v6);
    unint64_t v7 = *a3;
  }
  return MEMORY[0x263E6D140](this, v7 + v8, v6);
}

void sub_2638C0ECC(_Unwind_Exception *exception_object)
{
  int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void wis::serializeMetric(wis *this@<X0>, const PB::Base *a2@<X1>, uint64_t a3@<X8>)
{
  PB::Writer::Writer((PB::Writer *)&v6);
  (*(void (**)(wis *, char **))(*(void *)this + 24))(this, &v6);
  wis::createTagForProtobuf(a2, v6 - v7, (unint64_t *)a3);
  sub_2638C1524(a3, *(char **)(a3 + 8), v7, v6, v6 - v7);
  PB::Writer::~Writer((PB::Writer *)&v6);
}

void sub_2638C0F84(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  unint64_t v4 = *(void **)v2;
  if (*(void *)v2)
  {
    *(void *)(v2 + 8) = v4;
    operator delete(v4);
  }
  PB::Writer::~Writer((PB::Writer *)va);
  _Unwind_Resume(a1);
}

uint64_t wis::getComponentForMetricId(wis *this)
{
  return this >> 16;
}

uint64_t wis::getCoreAnalyticsEventName(wis *this)
{
  sub_2638C113C((uint64_t)v3);
  uint64_t v1 = sub_2638C1710(v3, (uint64_t)"com.apple.wis.0x", 16);
  *(_DWORD *)((char *)v1 + *(void *)(*v1 - 24) + 8) = *(_DWORD *)((unsigned char *)v1 + *(void *)(*v1 - 24) + 8) & 0xFFFFFFB5 | 8;
  std::ostream::operator<<();
  std::stringbuf::str();
  v3[0] = *MEMORY[0x263F8C2C8];
  *(void *)((char *)v3 + *(void *)(v3[0] - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
  v3[1] = MEMORY[0x263F8C318] + 16;
  if (v4 < 0) {
    operator delete((void *)v3[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x263E6D3A0](&v5);
}

void sub_2638C1128(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_2638C12D4((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_2638C113C(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C340] + 64;
  *(void *)(a1 + 112) = MEMORY[0x263F8C340] + 64;
  uint64_t v3 = *(void *)(MEMORY[0x263F8C2C8] + 16);
  uint64_t v4 = *(void *)(MEMORY[0x263F8C2C8] + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + *(void *)(v4 - 24)) = v3;
  uint64_t v5 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
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

void sub_2638C12AC(_Unwind_Exception *a1)
{
  std::ostream::~ostream();
  MEMORY[0x263E6D3A0](v1);
  _Unwind_Resume(a1);
}

uint64_t sub_2638C12D4(uint64_t a1)
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
  MEMORY[0x263E6D3A0](a1 + 112);
  return a1;
}

BOOL wis::isTimerIdSupported(wis *this)
{
  return (this - 1) < 2;
}

void sub_2638C13E8(unint64_t *a1, size_t a2)
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
      sub_2638A2514();
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

char *sub_2638C1524(uint64_t a1, char *__dst, char *__src, char *a4, int64_t a5)
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
      sub_2638A2514();
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
    unint64_t v28 = &v13[(void)v17];
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
      unint64_t v28 = v17;
    }
    unint64_t v30 = &v27[a5];
    uint64_t v31 = &v17[v29];
    if (v10 != v5) {
      memmove(v30, v5, v10 - v5);
    }
    BOOL v32 = *(char **)a1;
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
    unint64_t v21 = *(char **)(a1 + 8);
LABEL_17:
    BOOL v22 = &v5[a5];
    unint64_t v23 = &v21[-a5];
    int v24 = v21;
    if (&v21[-a5] < v10)
    {
      int64_t v25 = &v10[a5] - v21;
      int v24 = v21;
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
  unint64_t v21 = &v10[v20];
  *(void *)(a1 + 8) = &v10[v20];
  if (v18 >= 1) {
    goto LABEL_17;
  }
  return v5;
}

void *sub_2638C1710(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x263E6D2B0](v13, a1);
  if (v13[0])
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      size_t v10 = std::locale::use_facet(&v14, MEMORY[0x263F8C108]);
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
    if (!sub_2638C18B4(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x263E6D2C0](v13);
  return a1;
}

void sub_2638C184C(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x263E6D2C0](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x2638C182CLL);
}

void sub_2638C18A0(_Unwind_Exception *a1)
{
}

uint64_t sub_2638C18B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
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
      sub_2638C1A3C(__p, v12, __c);
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

void sub_2638C1A20(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_2638C1A3C(void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    sub_2638A2438();
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

CFStringRef createDescriptionForMetriclogFile(CFStringRef theString)
{
  CFStringRef v1 = theString;
  if (theString)
  {
    CFIndex Length = CFStringGetLength(theString);
    CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x600u);
    memset(&v11, 0, sizeof(v11));
    std::string::resize(&v11, MaximumSizeForEncoding + 1, 0);
    if ((v11.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v4 = &v11;
    }
    else {
      uint64_t v4 = (std::string *)v11.__r_.__value_.__r.__words[0];
    }
    if ((v11.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(v11.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = v11.__r_.__value_.__l.__size_;
    }
    if (CFStringGetCString(v1, (char *)v4, size, 0x8000100u))
    {
      if ((v11.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        uint64_t v6 = &v11;
      }
      else {
        uint64_t v6 = (std::string *)v11.__r_.__value_.__r.__words[0];
      }
      sub_2638C06D8(v12, (char *)v6);
      if (v12[0] && v12[1] != (FILE *)-1) {
        sCreateBestChoiceMetadataLoaderDelegate();
      }
      sub_2638A5294(__p, (char *)&unk_2638C8ADA);
      sub_2638B72E0((uint64_t)v12);
      if (v10 >= 0) {
        size_t v7 = __p;
      }
      else {
        size_t v7 = (void **)__p[0];
      }
      CFStringRef v1 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], (const char *)v7, 0x600u);
      if (v10 < 0) {
        operator delete(__p[0]);
      }
    }
    else
    {
      CFStringRef v1 = 0;
    }
    if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v11.__r_.__value_.__l.__data_);
    }
  }
  return v1;
}

void sub_2638C1C8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, std::__shared_weak_count *a19, char a20)
{
  if (a19) {
    sub_26389F6D4(a19);
  }
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    __cxa_end_catch();
    JUMPOUT(0x2638C1C24);
  }
  sub_2638B72E0((uint64_t)&a20);
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_2638C1D38(uint64_t result)
{
  *(void *)uint64_t result = &unk_270EB7648;
  *(void *)(result + 8) = 0;
  *(_DWORD *)(result + 2sub_2638B7290(&a9, 0) = 0;
  return result;
}

void sub_2638C1D5C(PB::Base *this)
{
  *(void *)this = &unk_270EB7648;
  uint64_t v4 = *((void *)this + 1);
  uint64_t v2 = (void *)((char *)this + 8);
  uint64_t v3 = v4;
  void *v2 = 0;
  if (v4) {
    sub_26389C460((uint64_t)v2, v3);
  }

  PB::Base::~Base(this);
}

void sub_2638C1DC0(PB::Base *a1)
{
  sub_2638C1D5C(a1);

  JUMPOUT(0x263E6D460);
}

uint64_t sub_2638C1DF8(uint64_t result, uint64_t a2)
{
  int v2 = *(_DWORD *)(result + 20);
  *(_DWORD *)(result + 2sub_2638B7290(&a9, 0) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a2 + 2sub_2638B7290(&a9, 0) = v2;
  uint64_t v3 = *(void *)(result + 8);
  *(void *)(result + 8) = *(void *)(a2 + 8);
  *(void *)(a2 + 8) = v3;
  LODWORD(v3) = *(_DWORD *)(result + 16);
  *(_DWORD *)(result + 16) = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a2 + 16) = v3;
  return result;
}

uint64_t sub_2638C1E2C(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_270EB7648;
  *(void *)(a1 + 8) = 0;
  uint64_t v4 = (uint64_t *)(a1 + 8);
  *(_DWORD *)(a1 + 2sub_2638B7290(&a9, 0) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a2 + 2sub_2638B7290(&a9, 0) = 0;
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  uint64_t v6 = *v4;
  *uint64_t v4 = v5;
  if (v6) {
    sub_26389C460((uint64_t)v4, v6);
  }
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  return a1;
}

uint64_t sub_2638C1EA4(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_2638C1E2C((uint64_t)v6, a2);
    uint64_t v3 = *(void *)(a1 + 8);
    *(void *)(a1 + 8) = v7;
    uint64_t v7 = v3;
    uint64_t v4 = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v8;
    uint64_t v8 = v4;
    sub_2638C1D5C((PB::Base *)v6);
  }
  return a1;
}

uint64_t sub_2638C1F08(uint64_t a1, PB::TextFormatter *this, char *a3)
{
  PB::TextFormatter::beginObject(this, a3);
  if (*(unsigned char *)(a1 + 20)) {
    PB::TextFormatter::format(this, "metric_id");
  }
  if (*(void *)(a1 + 8)) {
    PB::TextFormatter::format();
  }

  return MEMORY[0x270F587F0](this);
}

uint64_t sub_2638C1F80(uint64_t a1, PB::Reader *this)
{
  unint64_t v2 = *((void *)this + 1);
  unint64_t v3 = *((void *)this + 2);
  int v4 = *((unsigned __int8 *)this + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      uint64_t v8 = *(void *)this;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
        break;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        unint64_t v12 = v2 + 1;
        *((void *)this + 1) = v2 + 1;
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
LABEL_20:
      if ((v11 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 2)
      {
        *(unsigned char *)(a1 + 20) |= 1u;
        unint64_t v20 = *((void *)this + 1);
        unint64_t v21 = *((void *)this + 2);
        uint64_t v22 = *(void *)this;
        if (v20 > 0xFFFFFFFFFFFFFFF5 || v20 + 10 > v21)
        {
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v25 = 0;
          if (v21 <= v20) {
            unint64_t v21 = *((void *)this + 1);
          }
          while (1)
          {
            if (v21 == v20)
            {
              LODWORD(v25) = 0;
              *((unsigned char *)this + 24) = 1;
              goto LABEL_43;
            }
            unint64_t v31 = v20 + 1;
            char v32 = *(unsigned char *)(v22 + v20);
            *((void *)this + 1) = v31;
            v25 |= (unint64_t)(v32 & 0x7F) << v29;
            if ((v32 & 0x80) == 0) {
              break;
            }
            v29 += 7;
            unint64_t v20 = v31;
            BOOL v14 = v30++ > 8;
            if (v14)
            {
LABEL_39:
              LODWORD(v25) = 0;
              goto LABEL_43;
            }
          }
          if (*((unsigned char *)this + 24)) {
            LODWORD(v25) = 0;
          }
        }
        else
        {
          char v23 = 0;
          unsigned int v24 = 0;
          uint64_t v25 = 0;
          while (1)
          {
            unint64_t v26 = v20 + 1;
            *((void *)this + 1) = v20 + 1;
            char v27 = *(unsigned char *)(v22 + v20);
            v25 |= (unint64_t)(v27 & 0x7F) << v23;
            if ((v27 & 0x80) == 0) {
              break;
            }
            v23 += 7;
            unint64_t v20 = v26;
            BOOL v14 = v24++ > 8;
            if (v14) {
              goto LABEL_39;
            }
          }
        }
LABEL_43:
        *(_DWORD *)(a1 + 16) = v25;
      }
      else
      {
        if ((v11 >> 3) == 1) {
          operator new();
        }
        uint64_t result = PB::Reader::skip(this);
        if (!result) {
          return result;
        }
      }
      unint64_t v2 = *((void *)this + 1);
      unint64_t v3 = *((void *)this + 2);
      int v4 = *((unsigned __int8 *)this + 24);
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
      *((void *)this + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0) {
        goto LABEL_20;
      }
      v15 += 7;
      unint64_t v2 = v17;
      if (v16++ >= 9)
      {
LABEL_19:
        unint64_t v11 = 0;
        goto LABEL_20;
      }
    }
    int v4 = 1;
    *((unsigned char *)this + 24) = 1;
  }
  return v4 == 0;
}

uint64_t sub_2638C2220(uint64_t result, PB::Writer *this)
{
  uint64_t v3 = result;
  if (*(void *)(result + 8)) {
    uint64_t result = PB::Writer::write();
  }
  if (*(unsigned char *)(v3 + 20))
  {
    return PB::Writer::writeVarInt(this);
  }
  return result;
}

uint64_t sub_2638C228C(uint64_t a1, PB::TextFormatter *this, char *a3)
{
  PB::TextFormatter::beginObject(this, a3);
  __int16 v5 = *(_WORD *)(a1 + 52);
  if (v5)
  {
    PB::TextFormatter::format(this, "enum_type_index");
    __int16 v5 = *(_WORD *)(a1 + 52);
    if ((v5 & 0x100) == 0)
    {
LABEL_3:
      if ((v5 & 0x200) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((*(_WORD *)(a1 + 52) & 0x100) == 0)
  {
    goto LABEL_3;
  }
  PB::TextFormatter::format(this, "has_loc");
  __int16 v5 = *(_WORD *)(a1 + 52);
  if ((v5 & 0x200) == 0)
  {
LABEL_4:
    if ((v5 & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  PB::TextFormatter::format(this, "has_pii");
  __int16 v5 = *(_WORD *)(a1 + 52);
  if ((v5 & 0x400) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  PB::TextFormatter::format(this, "is_repeated");
  __int16 v5 = *(_WORD *)(a1 + 52);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  PB::TextFormatter::format(this, "message_type_index");
  __int16 v5 = *(_WORD *)(a1 + 52);
  if ((v5 & 4) == 0)
  {
LABEL_7:
    if ((v5 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  PB::TextFormatter::format(this, "metric_query_type");
  __int16 v5 = *(_WORD *)(a1 + 52);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_25:
  PB::TextFormatter::format(this, "metric_range_to");
  if ((*(_WORD *)(a1 + 52) & 0x10) != 0) {
LABEL_9:
  }
    PB::TextFormatter::format(this, "metric_type");
LABEL_10:
  if (*(void *)(a1 + 8)) {
    PB::TextFormatter::format();
  }
  __int16 v6 = *(_WORD *)(a1 + 52);
  if ((v6 & 0x20) != 0)
  {
    PB::TextFormatter::format(this, "number_pretty_format");
    __int16 v6 = *(_WORD *)(a1 + 52);
    if ((v6 & 0x40) == 0)
    {
LABEL_14:
      if ((v6 & 0x80) == 0) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
  }
  else if ((v6 & 0x40) == 0)
  {
    goto LABEL_14;
  }
  PB::TextFormatter::format(this, "tag");
  if ((*(_WORD *)(a1 + 52) & 0x80) != 0) {
LABEL_15:
  }
    PB::TextFormatter::format(this, "type");
LABEL_16:

  return MEMORY[0x270F587F0](this);
}

uint64_t sub_2638C2478(uint64_t result, PB::Writer *this)
{
  uint64_t v3 = result;
  __int16 v4 = *(_WORD *)(result + 52);
  if ((v4 & 0x40) != 0)
  {
    uint64_t result = PB::Writer::writeVarInt(this);
    __int16 v4 = *(_WORD *)(v3 + 52);
    if ((v4 & 0x80) == 0)
    {
LABEL_3:
      if ((v4 & 0x400) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v4 & 0x80) == 0)
  {
    goto LABEL_3;
  }
  uint64_t result = PB::Writer::writeVarInt(this);
  if ((*(_WORD *)(v3 + 52) & 0x400) != 0) {
LABEL_4:
  }
    uint64_t result = PB::Writer::write(this);
LABEL_5:
  if (*(void *)(v3 + 8)) {
    uint64_t result = PB::Writer::write();
  }
  __int16 v5 = *(_WORD *)(v3 + 52);
  if ((v5 & 0x200) != 0)
  {
    uint64_t result = PB::Writer::write(this);
    __int16 v5 = *(_WORD *)(v3 + 52);
    if ((v5 & 0x100) == 0)
    {
LABEL_9:
      if ((v5 & 2) == 0) {
        goto LABEL_10;
      }
      goto LABEL_21;
    }
  }
  else if ((*(_WORD *)(v3 + 52) & 0x100) == 0)
  {
    goto LABEL_9;
  }
  uint64_t result = PB::Writer::write(this);
  __int16 v5 = *(_WORD *)(v3 + 52);
  if ((v5 & 2) == 0)
  {
LABEL_10:
    if ((v5 & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t result = PB::Writer::writeVarInt(this);
  __int16 v5 = *(_WORD *)(v3 + 52);
  if ((v5 & 1) == 0)
  {
LABEL_11:
    if ((v5 & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t result = PB::Writer::writeVarInt(this);
  __int16 v5 = *(_WORD *)(v3 + 52);
  if ((v5 & 0x20) == 0)
  {
LABEL_12:
    if ((v5 & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t result = PB::Writer::writeVarInt(this);
  __int16 v5 = *(_WORD *)(v3 + 52);
  if ((v5 & 0x10) == 0)
  {
LABEL_13:
    if ((v5 & 8) == 0) {
      goto LABEL_14;
    }
LABEL_25:
    uint64_t result = PB::Writer::writeVarInt(this);
    if ((*(_WORD *)(v3 + 52) & 4) == 0) {
      return result;
    }
    goto LABEL_26;
  }
LABEL_24:
  uint64_t result = PB::Writer::writeVarInt(this);
  __int16 v5 = *(_WORD *)(v3 + 52);
  if ((v5 & 8) != 0) {
    goto LABEL_25;
  }
LABEL_14:
  if ((v5 & 4) == 0) {
    return result;
  }
LABEL_26:

  return PB::Writer::writeVarInt(this);
}

void sub_2638C25F8(void **a1)
{
  sub_26389C18C(a1);

  JUMPOUT(0x263E6D460);
}

uint64_t sub_2638C2630(void *a1, PB::TextFormatter *this, char *a3)
{
  PB::TextFormatter::beginObject(this, a3);
  __int16 v5 = (uint64_t *)a1[1];
  __int16 v6 = (uint64_t *)a1[2];
  while (v5 != v6)
  {
    uint64_t v7 = *v5++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v7 + 32))(v7, this, "enums");
  }
  uint64_t v8 = (uint64_t *)a1[4];
  char v9 = (uint64_t *)a1[5];
  while (v8 != v9)
  {
    uint64_t v10 = *v8++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v10 + 32))(v10, this, "messages");
  }

  return MEMORY[0x270F587F0](this);
}

uint64_t sub_2638C271C(uint64_t result, PB::Writer *this)
{
  uint64_t v3 = result;
  __int16 v4 = *(const PB::Base ***)(result + 32);
  __int16 v5 = *(const PB::Base ***)(result + 40);
  while (v4 != v5)
  {
    __int16 v6 = *v4++;
    uint64_t result = PB::Writer::writeSubmessage(this, v6);
  }
  uint64_t v8 = *(const PB::Base ***)(v3 + 8);
  uint64_t v7 = *(const PB::Base ***)(v3 + 16);
  while (v8 != v7)
  {
    char v9 = *v8++;
    uint64_t result = PB::Writer::writeSubmessage(this, v9);
  }
  return result;
}

void sCreateBestChoiceMetadataLoaderDelegate(void)
{
}

void BestChoiceMetadataLoaderDelegate::BestChoiceMetadataLoaderDelegate(BestChoiceMetadataLoaderDelegate *this)
{
  *(void *)this = &unk_270EB7738;
  *((void *)this + 1) = 0;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((void *)this + 8) = 0;
  *((_DWORD *)this + 18) = 1065353216;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_DWORD *)this + 28) = 1065353216;
  *((_DWORD *)this + 3sub_2638B7290(&a9, 0) = 0;
}

{
  *(void *)this = &unk_270EB7738;
  *((void *)this + 1) = 0;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((void *)this + 8) = 0;
  *((_DWORD *)this + 18) = 1065353216;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_DWORD *)this + 28) = 1065353216;
  *((_DWORD *)this + 3sub_2638B7290(&a9, 0) = 0;
}

void BestChoiceMetadataLoaderDelegate::~BestChoiceMetadataLoaderDelegate(BestChoiceMetadataLoaderDelegate *this)
{
  *(void *)this = &unk_270EB7738;
  unint64_t v2 = (void **)((char *)this + 16);
  sub_2638B7178((uint64_t)this + 80);
  sub_2638B7178((uint64_t)this + 40);
  uint64_t v3 = v2;
  sub_2638C3178(&v3);
  sub_2638BFC94((uint64_t *)this);
}

{
  uint64_t vars8;

  BestChoiceMetadataLoaderDelegate::~BestChoiceMetadataLoaderDelegate(this);

  JUMPOUT(0x263E6D460);
}

uint64_t BestChoiceMetadataLoaderDelegate::loadBaseMetadata(BestChoiceMetadataLoaderDelegate *this)
{
  unint64_t v2 = (void *)(*(uint64_t (**)(BestChoiceMetadataLoaderDelegate *))(*(void *)this + 80))(this);
  sub_2638C0504(v2, v3, (uint64_t)&v6);
  sub_2638C31FC((uint64_t)this + 40, v7);
  sub_2638C31FC((uint64_t)this + 80, v8);
  uint64_t v4 = v6;
  *((_DWORD *)this + 3sub_2638B7290(&a9, 0) = v6;
  sub_2638B7178((uint64_t)v8);
  sub_2638B7178((uint64_t)v7);
  return v4;
}

void BestChoiceMetadataLoaderDelegate::loadOverrideMetadata(BestChoiceMetadataLoaderDelegate *this, uint64_t a2)
{
  v9.__imp_.__ptr_ = 0;
  v9.__imp_.__cntrl_ = 0;
  sub_2638C3308(&__p.__pn_, &off_2655D7FA8);
  MEMORY[0x263E6D340](&v8, &__p, 0, 0);
  std::__fs::filesystem::directory_iterator v4 = v8;
  std::__fs::filesystem::directory_iterator v8 = (std::__fs::filesystem::directory_iterator)0;
  std::__fs::filesystem::directory_iterator v9 = v4;
  if (SHIBYTE(__p.__pn_.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__pn_.__r_.__value_.__l.__data_);
  }
  while (v9.__imp_.__ptr_)
  {
    __int16 v5 = std::__fs::filesystem::directory_iterator::__dereference(&v9);
    std::__fs::filesystem::__status(&v5->__p_, 0);
    if (__p.__pn_.__r_.__value_.__s.__data_[0] == 1)
    {
      unsigned int v6 = std::__fs::filesystem::directory_iterator::__dereference(&v9);
      if (SHIBYTE(v6->__p_.__pn_.__r_.__value_.__r.__words[2]) < 0) {
        sub_2638A2398(&__p, v6->__p_.__pn_.__r_.__value_.__l.__data_, v6->__p_.__pn_.__r_.__value_.__l.__size_);
      }
      else {
        __p.__pn_ = (std::__fs::filesystem::path::string_type)v6->__p_;
      }
      (*(void (**)(BestChoiceMetadataLoaderDelegate *, uint64_t, std::__fs::filesystem::directory_entry::_Path *))(*(void *)this + 112))(this, a2, &__p);
      if (SHIBYTE(__p.__pn_.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__pn_.__r_.__value_.__l.__data_);
      }
    }
    std::__fs::filesystem::directory_iterator::__increment(&v9, 0);
  }
  if (v9.__imp_.__cntrl_) {
    sub_26389F6D4(v9.__imp_.__cntrl_);
  }
}

void sub_2638C2B30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  unsigned int v16 = *(std::__shared_weak_count **)(v14 - 24);
  if (v16) {
    sub_26389F6D4(v16);
  }
  _Unwind_Resume(a1);
}

uint64_t BestChoiceMetadataLoaderDelegate::readOverrideFile(uint64_t *a1, uint64_t a2, char *a3)
{
  if (a3[23] >= 0) {
    __int16 v5 = a3;
  }
  else {
    __int16 v5 = *(char **)a3;
  }
  sub_2638C06D8((FILE **)&v23, v5);
  if ((void)v23) {
    BOOL v6 = *((void *)&v23 + 1) == -1;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    sub_2638C0504(*((void **)&v23 + 1), v24, (uint64_t)&v20);
    if (v20 <= a2)
    {
      uint64_t v10 = (void (**)(uint64_t *, uint64_t, unsigned int *))(*a1 + 128);
    }
    else
    {
      unint64_t v7 = a1[4];
      unint64_t v8 = a1[3];
      if (v8 >= v7)
      {
        uint64_t v11 = a1[2];
        unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v8 - v11) >> 3);
        unint64_t v13 = v12 + 1;
        if (v12 + 1 > 0xAAAAAAAAAAAAAAALL) {
          sub_2638A2514();
        }
        unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v7 - v11) >> 3);
        if (2 * v14 > v13) {
          unint64_t v13 = 2 * v14;
        }
        if (v14 >= 0x555555555555555) {
          unint64_t v15 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v15 = v13;
        }
        v25[4] = a1 + 4;
        unsigned int v16 = (char *)sub_2638C3610((uint64_t)(a1 + 4), v15);
        unint64_t v17 = &v16[24 * v12];
        v25[0] = v16;
        v25[1] = v17;
        v25[3] = &v16[24 * v18];
        *(_OWORD *)unint64_t v17 = v23;
        *((void *)v17 + 2) = v24;
        *(void *)&long long v23 = 0;
        *((void *)&v23 + 1) = -1;
        uint64_t v24 = 0;
        void v25[2] = v17 + 24;
        sub_2638C3588(a1 + 2, v25);
        uint64_t v9 = a1[3];
        sub_2638C3658((uint64_t)v25);
      }
      else
      {
        *(_OWORD *)unint64_t v8 = v23;
        *(void *)(v8 + 16) = v24;
        *(void *)&long long v23 = 0;
        *((void *)&v23 + 1) = -1;
        uint64_t v24 = 0;
        uint64_t v9 = v8 + 24;
      }
      a1[3] = v9;
      uint64_t v10 = (void (**)(uint64_t *, uint64_t, unsigned int *))(*a1 + 120);
    }
    (*v10)(a1, a2, &v20);
    sub_2638B7178((uint64_t)&v22);
    sub_2638B7178((uint64_t)&v21);
  }
  return sub_2638B72E0((uint64_t)&v23);
}

void sub_2638C2D68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va1, a3);
  va_start(va, a3);
  uint64_t v5 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  sub_2638C3658(v3 - 72);
  sub_2638B7178((uint64_t)va1);
  sub_2638B7178((uint64_t)va);
  sub_2638B72E0(v3 - 96);
  _Unwind_Resume(a1);
}

void *BestChoiceMetadataLoaderDelegate::markOverrideFileUsed(void *result, uint64_t a2, uint64_t a3)
{
  std::__fs::filesystem::directory_iterator v4 = result;
  for (uint64_t i = *(unsigned int **)(a3 + 24); i; uint64_t i = *(unsigned int **)i)
  {
    uint64_t result = sub_2638C36A8((uint64_t)(v4 + 5), i + 4, (uint64_t)(i + 4));
    if (!v6)
    {
      uint64_t v7 = *((void *)i + 4);
      result[3] = *((void *)i + 3);
      result[4] = v7;
    }
  }
  uint64_t v8 = *(unsigned int **)(a3 + 64);
  if (v8)
  {
    uint64_t v9 = (uint64_t)(v4 + 10);
    do
    {
      uint64_t result = sub_2638C36A8(v9, v8 + 4, (uint64_t)(v8 + 4));
      if (!v10)
      {
        uint64_t v11 = *((void *)v8 + 4);
        result[3] = *((void *)v8 + 3);
        result[4] = v11;
      }
      uint64_t v8 = *(unsigned int **)v8;
    }
    while (v8);
  }
  return result;
}

uint64_t BestChoiceMetadataLoaderDelegate::pickMap(uint64_t a1, int a2)
{
  (*(void (**)(uint64_t))(*(void *)a1 + 88))(a1);
  uint64_t v4 = a1 + 80;
  if (a2 != 1) {
    uint64_t v4 = a1 + 40;
  }
  if (a2) {
    return v4;
  }
  else {
    return a1 + 40;
  }
}

uint64_t BestChoiceMetadataLoaderDelegate::readMetricFileMetadata(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)a1 + 32))(a1, a2, 0);
}

void BestChoiceMetadataLoaderDelegate::getComponentsAvailable(uint64_t a1@<X0>, int a2@<W1>, char **a3@<X8>)
{
  uint64_t v6 = a1 + 80;
  (*(void (**)(uint64_t))(*(void *)a1 + 88))(a1);
  uint64_t v7 = a1 + 40;
  if (a2 == 1) {
    uint64_t v7 = v6;
  }
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  uint64_t v8 = *(uint64_t **)(v7 + 16);
  if (v8)
  {
    uint64_t v9 = 0;
    char v10 = a3 + 2;
    do
    {
      if ((unint64_t)v9 >= *v10)
      {
        unint64_t v12 = *a3;
        uint64_t v13 = (v9 - *a3) >> 2;
        unint64_t v14 = v13 + 1;
        if ((unint64_t)(v13 + 1) >> 62) {
          sub_2638A2514();
        }
        uint64_t v15 = *v10 - (void)v12;
        if (v15 >> 1 > v14) {
          unint64_t v14 = v15 >> 1;
        }
        if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v16 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v16 = v14;
        }
        if (v16)
        {
          unint64_t v17 = (char *)sub_2638AA2E0((uint64_t)(a3 + 2), v16);
          unint64_t v12 = *a3;
          uint64_t v9 = a3[1];
        }
        else
        {
          unint64_t v17 = 0;
        }
        uint64_t v18 = &v17[4 * v13];
        *(_DWORD *)uint64_t v18 = *((_DWORD *)v8 + 4);
        uint64_t v11 = v18 + 4;
        while (v9 != v12)
        {
          int v19 = *((_DWORD *)v9 - 1);
          v9 -= 4;
          *((_DWORD *)v18 - 1) = v19;
          v18 -= 4;
        }
        *a3 = v18;
        a3[1] = v11;
        a3[2] = &v17[4 * v16];
        if (v12) {
          operator delete(v12);
        }
      }
      else
      {
        *(_DWORD *)uint64_t v9 = *((_DWORD *)v8 + 4);
        uint64_t v11 = v9 + 4;
      }
      a3[1] = v11;
      uint64_t v8 = (uint64_t *)*v8;
      uint64_t v9 = v11;
    }
    while (v8);
  }
}

void sub_2638C3010(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void BestChoiceMetadataLoaderDelegate::getMetricIndex(BestChoiceMetadataLoaderDelegate *this@<X0>, void *a2@<X8>)
{
  sub_2638C0074((uint64_t)this, &v16);
  if (!v16)
  {
    uint64_t v4 = (std::__shared_weak_count *)operator new(0x38uLL);
    v4->__shared_owners_ = 0;
    v4->__shared_weak_owners_ = 0;
    v4->__vftable = (std::__shared_weak_count_vtbl *)&unk_270EB75F8;
    sub_2638B6204(&v4[1].__vftable);
    uint64_t v5 = v17;
    unint64_t v16 = v4 + 1;
    unint64_t v17 = v4;
    if (v5) {
      sub_26389F6D4(v5);
    }
  }
  uint64_t v6 = *((void *)this + 2);
  uint64_t v7 = *((void *)this + 3);
  while (v6 != v7)
  {
    uint64_t v8 = (unsigned __int8 *)sub_2638C0198(*(_DWORD **)(v6 + 8), *(void *)(v6 + 16));
    sub_2638C00D0(v8, v9, &v14);
    if (v14) {
      sub_2638B73F8((uint64_t)v16, v14);
    }
    if (v15) {
      sub_26389F6D4(v15);
    }
    v6 += 24;
  }
  sub_2638B75BC((uint64_t)v16);
  char v10 = (_DWORD *)(*(uint64_t (**)(BestChoiceMetadataLoaderDelegate *))(*(void *)this + 80))(this);
  unint64_t v12 = (unsigned __int8 *)sub_2638C0198(v10, v11);
  sub_2638C00D0(v12, v13, a2);
  if (v17) {
    sub_26389F6D4(v17);
  }
}

void sub_2638C3144(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12)
{
  if (a12) {
    sub_26389F6D4(a12);
  }
  _Unwind_Resume(exception_object);
}

void sub_2638C3178(void ***a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    uint64_t v5 = v2;
    if ((void *)v4 != v2)
    {
      do
        uint64_t v4 = sub_2638B72E0(v4 - 24);
      while ((void *)v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_2638C31FC(uint64_t a1, uint64_t *a2)
{
  sub_2638C32A0((void *)a1);
  uint64_t v4 = *a2;
  *a2 = 0;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = v4;
  if (v5) {
    operator delete(v5);
  }
  uint64_t v8 = a2[2];
  uint64_t v7 = a2 + 2;
  uint64_t v6 = v8;
  uint64_t v9 = *(v7 - 1);
  *(void *)(a1 + 16) = v8;
  *(void *)(a1 + 8) = v9;
  *(v7 - 1) = 0;
  uint64_t v10 = v7[1];
  *(void *)(a1 + 24) = v10;
  *(_DWORD *)(a1 + 32) = *((_DWORD *)v7 + 4);
  if (v10)
  {
    unint64_t v11 = *(void *)(v6 + 8);
    unint64_t v12 = *(void *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12) {
        v11 %= v12;
      }
    }
    else
    {
      v11 &= v12 - 1;
    }
    *(void *)(*(void *)a1 + 8 * v11) = a1 + 16;
    *uint64_t v7 = 0;
    v7[1] = 0;
  }
}

void *sub_2638C32A0(void *result)
{
  if (result[3])
  {
    uint64_t v1 = result;
    uint64_t result = (void *)result[2];
    if (result)
    {
      do
      {
        unint64_t v2 = (void *)*result;
        operator delete(result);
        uint64_t result = v2;
      }
      while (v2);
    }
    v1[2] = 0;
    uint64_t v3 = v1[1];
    if (v3)
    {
      for (uint64_t i = 0; i != v3; ++i)
        *(void *)(*v1 + 8 * i) = 0;
    }
    v1[3] = 0;
  }
  return result;
}

std::string *sub_2638C3308(std::string *this, char **a2)
{
  *(_OWORD *)&this->__r_.__value_.__l.__data_ = 0uLL;
  this->__r_.__value_.__r.__words[2] = 0;
  uint64_t v3 = *a2;
  uint64_t v4 = v3 - 1;
  while (*++v4)
    ;
  sub_2638C3368(this, v3, v4);
  return this;
}

void sub_2638C334C(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

std::string *sub_2638C3368(std::string *this, char *a2, char *a3)
{
  uint64_t v4 = a2;
  LODWORD(v6) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  unint64_t v7 = a3 - a2;
  if ((v6 & 0x80000000) != 0)
  {
    if (a3 == a2) {
      return this;
    }
    std::string::size_type size = this->__r_.__value_.__l.__size_;
    unint64_t v11 = this->__r_.__value_.__r.__words[2];
    std::string::size_type v9 = (v11 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    uint64_t v10 = (std::string *)this->__r_.__value_.__r.__words[0];
    unint64_t v6 = HIBYTE(v11);
  }
  else
  {
    if (a3 == a2) {
      return this;
    }
    std::string::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    std::string::size_type v9 = 22;
    uint64_t v10 = this;
  }
  if (v10 > (std::string *)v4 || (char *)&v10->__r_.__value_.__l.__data_ + size + 1 <= v4)
  {
    if (v9 - size < v7)
    {
      std::string::__grow_by(this, v9, size - v9 + v7, size, size, 0, 0);
      this->__r_.__value_.__l.__size_ = size;
      LOBYTE(v6) = *((unsigned char *)&this->__r_.__value_.__s + 23);
    }
    uint64_t v14 = this;
    if ((v6 & 0x80) != 0) {
      uint64_t v14 = (std::string *)this->__r_.__value_.__r.__words[0];
    }
    for (uint64_t i = (char *)v14 + size; v4 != a3; ++i)
    {
      char v16 = *v4++;
      *uint64_t i = v16;
    }
    *uint64_t i = 0;
    std::string::size_type v17 = v7 + size;
    if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
      this->__r_.__value_.__l.__size_ = v17;
    }
    else {
      *((unsigned char *)&this->__r_.__value_.__s + 23) = v17 & 0x7F;
    }
  }
  else
  {
    sub_2638C34E0(__p, v4, a3, v7);
    if ((v20 & 0x80u) == 0) {
      unint64_t v12 = __p;
    }
    else {
      unint64_t v12 = (void **)__p[0];
    }
    if ((v20 & 0x80u) == 0) {
      std::string::size_type v13 = v20;
    }
    else {
      std::string::size_type v13 = (std::string::size_type)__p[1];
    }
    std::string::append(this, (const std::string::value_type *)v12, v13);
    if ((char)v20 < 0) {
      operator delete(__p[0]);
    }
  }
  return this;
}

void sub_2638C34C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_2638C34E0(void *result, char *a2, char *a3, unint64_t a4)
{
  uint64_t v4 = result;
  if (a4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_2638A2438();
  }
  if (a4 > 0x16)
  {
    uint64_t v8 = (a4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a4 | 7) != 0x17) {
      uint64_t v8 = a4 | 7;
    }
    uint64_t v9 = v8 + 1;
    uint64_t result = operator new(v8 + 1);
    v4[1] = a4;
    v4[2] = v9 | 0x8000000000000000;
    *uint64_t v4 = result;
    uint64_t v4 = result;
  }
  else
  {
    *((unsigned char *)result + 23) = a4;
  }
  while (a2 != a3)
  {
    char v10 = *a2++;
    *(unsigned char *)uint64_t v4 = v10;
    uint64_t v4 = (void *)((char *)v4 + 1);
  }
  *(unsigned char *)uint64_t v4 = 0;
  return result;
}

uint64_t *sub_2638C3588(uint64_t *result, void *a2)
{
  uint64_t v3 = *result;
  uint64_t v2 = result[1];
  uint64_t v4 = a2[1];
  if (v2 != *result)
  {
    uint64_t v5 = 0;
    do
    {
      uint64_t v6 = v4 + v5;
      uint64_t v7 = v2 + v5;
      *(_OWORD *)(v6 - 24) = *(_OWORD *)(v2 + v5 - 24);
      *(void *)(v6 - 8) = *(void *)(v2 + v5 - 8);
      *(void *)(v7 - 24) = 0;
      *(void *)(v7 - 16) = -1;
      *(void *)(v7 - 8) = 0;
      v5 -= 24;
    }
    while (v2 + v5 != v3);
    v4 += v5;
  }
  a2[1] = v4;
  uint64_t v8 = *result;
  *uint64_t result = v4;
  a2[1] = v8;
  uint64_t v9 = result[1];
  result[1] = a2[2];
  a2[2] = v9;
  uint64_t v10 = result[2];
  result[2] = a2[3];
  a2[3] = v10;
  *a2 = a2[1];
  return result;
}

void *sub_2638C3610(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    sub_2638A24E0();
  }
  return operator new(24 * a2);
}

uint64_t sub_2638C3658(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 24;
    sub_2638B72E0(i - 24);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void *sub_2638C36A8(uint64_t a1, unsigned int *a2, uint64_t a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
    uint64_t v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      uint64_t v10 = *v9;
      if (*v9)
      {
        do
        {
          unint64_t v11 = v10[1];
          if (v11 == v6)
          {
            if (*((_DWORD *)v10 + 4) == v6) {
              return v10;
            }
          }
          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7) {
                v11 %= v7;
              }
            }
            else
            {
              v11 &= v7 - 1;
            }
            if (v11 != v3) {
              break;
            }
          }
          uint64_t v10 = (void *)*v10;
        }
        while (v10);
      }
    }
  }
  uint64_t v10 = operator new(0x28uLL);
  *uint64_t v10 = 0;
  v10[1] = v6;
  *((_OWORD *)v10 + 1) = *(_OWORD *)a3;
  v10[4] = *(void *)(a3 + 16);
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    sub_26389EF6C(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
  }
  uint64_t v18 = *(void *)a1;
  int v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    *uint64_t v10 = *v19;
LABEL_38:
    *int v19 = v10;
    goto LABEL_39;
  }
  *uint64_t v10 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v10;
  *(void *)(v18 + 8 * v3) = a1 + 16;
  if (*v10)
  {
    unint64_t v20 = *(void *)(*v10 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7) {
        v20 %= v7;
      }
    }
    else
    {
      v20 &= v7 - 1;
    }
    int v19 = (void *)(*(void *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v10;
}

void sub_2638C38BC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_2638C38D4(void *a1, PB::TextFormatter *this, char *a3)
{
  PB::TextFormatter::beginObject(this, a3);
  uint64_t v5 = (uint64_t *)a1[1];
  unint64_t v6 = (uint64_t *)a1[2];
  while (v5 != v6)
  {
    uint64_t v7 = *v5++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v7 + 32))(v7, this, "fields");
  }
  if (a1[4]) {
    PB::TextFormatter::format();
  }

  return MEMORY[0x270F587F0](this);
}

uint64_t sub_2638C398C(uint64_t result, PB::Writer *this)
{
  uint64_t v3 = result;
  if (*(void *)(result + 32)) {
    uint64_t result = PB::Writer::write();
  }
  uint64_t v5 = *(const PB::Base ***)(v3 + 8);
  uint64_t v4 = *(const PB::Base ***)(v3 + 16);
  while (v5 != v4)
  {
    unint64_t v6 = *v5++;
    uint64_t result = PB::Writer::writeSubmessage(this, v6);
  }
  return result;
}

void sub_2638C39EC(unint64_t a1@<X0>, std::string *a2@<X8>)
{
  uint64_t v2 = a2;
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  if (!a1) {
    goto LABEL_14;
  }
  unint64_t v3 = a1;
  do
  {
    std::string::push_back(v2, a0123456789abcd_0[v3 & 0xF]);
    BOOL v4 = v3 >= 0x10;
    v3 >>= 4;
  }
  while (v4);
  if (SHIBYTE(v2->__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::size_type size = v2->__r_.__value_.__l.__size_;
    if (!size)
    {
LABEL_14:
      std::string::push_back(v2, 48);
      return;
    }
    uint64_t v2 = (std::string *)v2->__r_.__value_.__r.__words[0];
  }
  else
  {
    std::string::size_type size = HIBYTE(v2->__r_.__value_.__r.__words[2]);
    if (!*((unsigned char *)&v2->__r_.__value_.__s + 23)) {
      goto LABEL_14;
    }
  }
  unint64_t v6 = (std::string *)((char *)v2 + size - 1);
  if (v6 > v2)
  {
    unint64_t v7 = (unint64_t)v2->__r_.__value_.__r.__words + 1;
    do
    {
      std::string::value_type v8 = *(unsigned char *)(v7 - 1);
      *(unsigned char *)(v7 - 1) = v6->__r_.__value_.__s.__data_[0];
      v6->__r_.__value_.__s.__data_[0] = v8;
      unint64_t v6 = (std::string *)((char *)v6 - 1);
      BOOL v4 = v7++ >= (unint64_t)v6;
    }
    while (!v4);
  }
}

void sub_2638C3AB0(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_2638C3AD0(unint64_t a1@<X0>, std::string::size_type a2@<X1>, std::string *a3@<X8>)
{
  a3->__r_.__value_.__r.__words[0] = 0;
  a3->__r_.__value_.__l.__size_ = 0;
  a3->__r_.__value_.__r.__words[2] = 0;
  std::string::resize(a3, a2, 0);
  uint64_t v5 = HIBYTE(a3->__r_.__value_.__r.__words[2]);
  int v6 = (char)v5;
  unint64_t v7 = (uint64_t *)((char *)a3 + v5);
  if (v6 >= 0)
  {
    std::string::value_type v8 = (uint64_t *)a3;
  }
  else
  {
    unint64_t v7 = (uint64_t *)(a3->__r_.__value_.__r.__words[0] + a3->__r_.__value_.__l.__size_);
    std::string::value_type v8 = (uint64_t *)a3->__r_.__value_.__r.__words[0];
  }
  for (; v7 != v8; a1 >>= 4)
  {
    *((unsigned char *)v7 - 1) = a0123456789abcd_0[a1 & 0xF];
    unint64_t v7 = (uint64_t *)((char *)v7 - 1);
  }
}

void sub_2638C3B50(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_2638C3B6C(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char v2 = a1;
  uint64_t v7 = *MEMORY[0x263EF8340];
  time_t v5 = a1 / 0x3E8;
  BOOL v4 = localtime(&v5);
  if (!strftime(v6, 0x50uLL, "%a %F %T", v4)) {
    v6[0] = 0;
  }
  sub_2638C3C38("%llu (%s.%03d)", a2, v2);
}

void sub_2638C3C38(const char *a1@<X0>, uint64_t a2@<X8>, char a3)
{
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  std::string::resize((std::string *)a2, 0x17uLL, 0);
  int v5 = *(char *)(a2 + 23);
  if (v5 >= 0) {
    int v6 = (char *)a2;
  }
  else {
    int v6 = *(char **)a2;
  }
  if (v5 >= 0) {
    size_t v7 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    size_t v7 = *(void *)(a2 + 8);
  }
  int v8 = vsnprintf(v6, v7, a1, &a3);
  std::string::size_type v9 = v8;
  uint64_t v10 = *(unsigned __int8 *)(a2 + 23);
  if ((v10 & 0x80u) != 0) {
    uint64_t v10 = *(void *)(a2 + 8);
  }
  if (v10 <= v8)
  {
    std::string::resize((std::string *)a2, v8 + 1, 0);
    int v11 = *(char *)(a2 + 23);
    if (v11 >= 0) {
      float v12 = (char *)a2;
    }
    else {
      float v12 = *(char **)a2;
    }
    if (v11 >= 0) {
      size_t v13 = *(unsigned __int8 *)(a2 + 23);
    }
    else {
      size_t v13 = *(void *)(a2 + 8);
    }
    std::string::size_type v9 = vsnprintf(v12, v13, a1, &a3);
  }
  std::string::resize((std::string *)a2, v9, 0);
}

void sub_2638C3D0C(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_2638C3D2C(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char v2 = a1;
  uint64_t v7 = *MEMORY[0x263EF8340];
  time_t v5 = a1 + 978307200;
  BOOL v4 = localtime(&v5);
  if (!strftime(v6, 0x50uLL, "%a %F %T", v4)) {
    v6[0] = 0;
  }
  sub_2638C3C38("%llu (%s)", a2, v2);
}

void sub_2638C3DDC(time_t a1@<X0>, uint64_t a2@<X8>)
{
  char v2 = a1;
  uint64_t v7 = *MEMORY[0x263EF8340];
  time_t v5 = a1;
  BOOL v4 = localtime(&v5);
  if (!strftime(v6, 0x50uLL, "%a %F %T", v4)) {
    v6[0] = 0;
  }
  sub_2638C3C38("%llu (%s)", a2, v2);
}

void sub_2638C3E80(__n128 *a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
  char v3 = a2;
  sub_2638C3ED4(a1, a2);
  sub_2638C3C38("0x%x (%s)", a3, v3);
}

uint64_t sub_2638C3ED4(__n128 *a1, unsigned int a2)
{
  MetricFileMetadataHelper::getHandleForMetric(a1, a2, (uint64_t)v3);
  if (v4 == 0xFFFFFFFFLL) {
    return 0;
  }
  uint64_t result = MetadataHandle::getField((MetadataHandle *)v3);
  if (result)
  {
    uint64_t result = *(void *)(result + 8);
    if (result)
    {
      if (*(char *)(result + 23) < 0) {
        return *(void *)result;
      }
    }
  }
  return result;
}

void sub_2638C3F30(__n128 *a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
  char v3 = a2;
  if (sub_2638C3ED4(a1, a2)) {
    sub_2638C3C38("0x%x (%s metric)", a3, v3);
  }
  else {
    sub_2638C3C38("0x%x (%s)", a3, v3);
  }
}

void sub_2638C3FC4(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char v2 = a1;
  if ((uint64_t)a1 < 1000)
  {
    sub_2638C3C38("%lldns", a2, a1);
  }
  else
  {
    sub_2638C40E4(((a1 / 0x3B9ACA00) - 60 * (a1 / 0xDF8475800)) | ((a1 % 0x3B9ACA00) << 32), (a1 / 0x34630B8A000) | ((a1 / 0xDF8475800 - 60 * (a1 / 0x34630B8A000)) << 32), (uint64_t)&__p);
    sub_2638C3C38("%lldns (%s)", a2, v2);
    if (v5 < 0) {
      operator delete(__p);
    }
  }
}

void sub_2638C40C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_2638C40E4(unint64_t __val@<X1>, unint64_t a2@<X0>, uint64_t a3@<X8>)
{
  unsigned int v3 = __val;
  uint64_t v27 = *MEMORY[0x263EF8340];
  unint64_t v5 = HIDWORD(a2);
  unint64_t v6 = HIDWORD(__val);
  int v7 = HIDWORD(a2) | a2;
  if (!(HIDWORD(a2) | a2 | __val))
  {
    int64_t v12 = v6 - 1000000 * (HIDWORD(__val) / 0xF4240);
    uint64_t v13 = v12 / 1000;
    uint64_t v14 = v12 % 1000;
    unint64_t v15 = v12 + 999;
    if (__val >= 0xF424000000000)
    {
      if (v15 <= 0x7CE && v14 == 0) {
        sub_2638C3C38("%lldms", a3, HIDWORD(__val) / 0xF4240);
      }
      else {
        sub_2638C3C38("%lld.%03lldms", a3, HIDWORD(__val) / 0xF4240);
      }
    }
    else if (v15 >= 0x7CF)
    {
      if (v14) {
        sub_2638C3C38("%lld.%03lldus", a3, v13);
      }
      else {
        sub_2638C3C38("%lldus", a3, v13);
      }
    }
    else
    {
      sub_2638C3C38("%lldns", a3, v14);
    }
    return;
  }
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  if (!a2)
  {
    if (!HIDWORD(a2)) {
      goto LABEL_29;
    }
    goto LABEL_20;
  }
  std::to_string(&v25, a2);
  int v8 = std::string::append(&v25, "h");
  std::string::size_type v9 = v8->__r_.__value_.__r.__words[0];
  v26.__r_.__value_.__r.__words[0] = v8->__r_.__value_.__l.__size_;
  *(std::string::size_type *)((char *)v26.__r_.__value_.__r.__words + 7) = *(std::string::size_type *)((char *)&v8->__r_.__value_.__r.__words[1] + 7);
  char v10 = HIBYTE(v8->__r_.__value_.__r.__words[2]);
  v8->__r_.__value_.__l.__size_ = 0;
  v8->__r_.__value_.__r.__words[2] = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  if (*(char *)(a3 + 23) < 0) {
    operator delete(*(void **)a3);
  }
  std::string::size_type v11 = v26.__r_.__value_.__r.__words[0];
  *(void *)a3 = v9;
  *(void *)(a3 + 8) = v11;
  *(void *)(a3 + 15) = *(std::string::size_type *)((char *)v26.__r_.__value_.__r.__words + 7);
  *(unsigned char *)(a3 + 23) = v10;
  if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v25.__r_.__value_.__l.__data_);
  }
  if (v5 || v3 || v6)
  {
LABEL_20:
    std::to_string(&v26, v5);
    size_t v17 = std::string::append(&v26, "m");
    long long v18 = *(_OWORD *)&v17->__r_.__value_.__l.__data_;
    v25.__r_.__value_.__r.__words[2] = v17->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v25.__r_.__value_.__l.__data_ = v18;
    v17->__r_.__value_.__l.__size_ = 0;
    v17->__r_.__value_.__r.__words[2] = 0;
    v17->__r_.__value_.__r.__words[0] = 0;
    if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      int v19 = &v25;
    }
    else {
      int v19 = (std::string *)v25.__r_.__value_.__r.__words[0];
    }
    if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(v25.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = v25.__r_.__value_.__l.__size_;
    }
    std::string::append((std::string *)a3, (const std::string::value_type *)v19, size);
    if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v25.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v26.__r_.__value_.__l.__data_);
      if (v3)
      {
LABEL_30:
        if (!v6)
        {
          std::to_string(&v25, v3);
          if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            uint64_t v21 = &v25;
          }
          else {
            uint64_t v21 = (std::string *)v25.__r_.__value_.__r.__words[0];
          }
          if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            std::string::size_type v22 = HIBYTE(v25.__r_.__value_.__r.__words[2]);
          }
          else {
            std::string::size_type v22 = v25.__r_.__value_.__l.__size_;
          }
          std::string::append((std::string *)a3, (const std::string::value_type *)v21, v22);
          if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v25.__r_.__value_.__l.__data_);
          }
          std::string::append((std::string *)a3, "s");
          return;
        }
        goto LABEL_46;
      }
LABEL_44:
      if (!v7 || !v6) {
        return;
      }
LABEL_46:
      sub_2638C3C38("%u.%01us", (uint64_t)&v25, v3);
      if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        long long v23 = &v25;
      }
      else {
        long long v23 = (std::string *)v25.__r_.__value_.__r.__words[0];
      }
      if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v24 = HIBYTE(v25.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v24 = v25.__r_.__value_.__l.__size_;
      }
      std::string::append((std::string *)a3, (const std::string::value_type *)v23, v24);
      if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v25.__r_.__value_.__l.__data_);
      }
      return;
    }
LABEL_29:
    if (v3) {
      goto LABEL_30;
    }
    goto LABEL_44;
  }
}

void sub_2638C43EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (*(char *)(v23 + 23) < 0) {
    operator delete(*(void **)v23);
  }
  _Unwind_Resume(exception_object);
}

void sub_2638C4464(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char v2 = a1;
  if ((uint64_t)a1 < 1000)
  {
    sub_2638C3C38("%lldus", a2, a1);
  }
  else
  {
    sub_2638C40E4((0x3E800000000 * (a1 + 4293967296u * (a1 / 0xF4240))) | ((a1 / 0xF4240)- 60 * (a1 / 0x3938700)), ((unint64_t)((a1 / 0x3938700) - 60 * (a1 / 0xD693A400)) << 32) | (a1 / 0xD693A400), (uint64_t)&__p);
    sub_2638C3C38("%lldus (%s)", a2, v2);
    if (v5 < 0) {
      operator delete(__p);
    }
  }
}

void sub_2638C4570(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_2638C458C(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char v2 = a1;
  if ((uint64_t)a1 < 1000)
  {
    sub_2638C3C38("%lldms", a2, a1);
  }
  else
  {
    sub_2638C40E4((0xF424000000000 * (a1 + 4294966296u * (a1 / 0x3E8))) | ((a1 / 0x3E8)- 60 * (a1 / 0xEA60)), (a1 / 0x36EE80) | ((unint64_t)((a1 / 0xEA60)- 60 * (a1 / 0x36EE80)) << 32), (uint64_t)&__p);
    sub_2638C3C38("%lldms (%s)", a2, v2);
    if (v5 < 0) {
      operator delete(__p);
    }
  }
}

void sub_2638C4698(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_2638C46B4(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char v2 = a1;
  if ((uint64_t)a1 < 60)
  {
    sub_2638C3C38("%llds", a2, a1);
  }
  else
  {
    sub_2638C40E4(a1 % 0x3C, (a1 / 0xE10) | ((unint64_t)((a1 / 0x3C) - 60 * (a1 / 0xE10)) << 32), (uint64_t)&__p);
    sub_2638C3C38("%llds (%s)", a2, v2);
    if (v5 < 0) {
      operator delete(__p);
    }
  }
}

void sub_2638C4784(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_2638C47A0(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char v2 = a1;
  if (a1 < 60)
  {
    sub_2638C3C38("%ldm", a2, a1);
  }
  else
  {
    sub_2638C40E4(0, (a1 / 0x3CuLL) | ((a1 % 0x3CuLL) << 32), (uint64_t)&__p);
    sub_2638C3C38("%ldm (%s)", a2, v2);
    if (v5 < 0) {
      operator delete(__p);
    }
  }
}

void sub_2638C4854(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_2638C4870(char a1@<W0>, uint64_t a2@<X8>)
{
}

void sGetMetricName(void *a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
  MetricFileMetadataHelper::MetricFileMetadataHelper((MetricFileMetadataHelper *)v11, a1);
  __n128 v8 = 0uLL;
  uint64_t v9 = 0xFFFFFFFFLL;
  MetricFileMetadataHelper::getSubfieldType((MetricFileMetadataHelper *)v11, &v8, a2, (uint64_t)v10);
  uint64_t Field = MetadataHandle::getField((MetadataHandle *)v10);
  if (Field && (unint64_t v6 = *(long long **)(Field + 8)) != 0)
  {
    if (*((char *)v6 + 23) < 0)
    {
      sub_2638A2398((unsigned char *)a3, *(void **)v6, *((void *)v6 + 1));
    }
    else
    {
      long long v7 = *v6;
      *(void *)(a3 + 16) = *((void *)v6 + 2);
      *(_OWORD *)a3 = v7;
    }
  }
  else
  {
    sub_2638A5294((void *)a3, "unknown");
  }
  sub_26389B614((uint64_t)&v13);
  if (v12) {
    sub_26389F6D4(v12);
  }
}

void sub_2638C495C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  sub_2638BEA30((uint64_t)va);
  _Unwind_Resume(a1);
}

void sMetricNamesResolver(WISMetadataLoader **a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_DWORD *)(a3 + 32) = 1065353216;
  if (*(void *)(a2 + 24))
  {
    WISMetadataLoader::getMetricIndex(&v33, *a1);
    if (v33)
    {
      uint64_t v4 = *(uint64_t **)(a2 + 16);
      if (v4)
      {
        char v5 = *(uint64_t **)(v33 + 16);
        uint64_t v30 = ((uint64_t)v5 - *(void *)(v33 + 8)) >> 3;
        unint64_t v31 = *(uint64_t **)(v33 + 8);
        while (1)
        {
          unint64_t v6 = v31;
          long long v7 = v5;
          if (v5 != v31)
          {
            char v8 = *((unsigned char *)v4 + 39);
            if (v8 >= 0) {
              size_t v9 = *((unsigned __int8 *)v4 + 39);
            }
            else {
              size_t v9 = v4[3];
            }
            if (v8 >= 0) {
              char v10 = v4 + 2;
            }
            else {
              char v10 = (const void *)v4[2];
            }
            unint64_t v11 = v30;
            unint64_t v6 = v31;
            do
            {
              unint64_t v12 = v11 >> 1;
              uint64_t v13 = &v6[v11 >> 1];
              uint64_t v14 = *(void *)(*v13 + 8);
              if (v14)
              {
                int v15 = *(char *)(v14 + 23);
                if (v15 >= 0) {
                  size_t v16 = *(unsigned __int8 *)(v14 + 23);
                }
                else {
                  size_t v16 = *(void *)(v14 + 8);
                }
                if (v15 >= 0) {
                  size_t v17 = *(const void **)(*v13 + 8);
                }
                else {
                  size_t v17 = *(const void **)v14;
                }
                if (v9 >= v16) {
                  size_t v18 = v16;
                }
                else {
                  size_t v18 = v9;
                }
                int v19 = memcmp(v17, v10, v18);
                BOOL v20 = v16 < v9;
                if (v19) {
                  BOOL v20 = v19 < 0;
                }
                if (v20)
                {
                  unint64_t v6 = v13 + 1;
                  unint64_t v12 = v11 + ~v12;
                }
              }
              unint64_t v11 = v12;
            }
            while (v12);
          }
          char v5 = v7;
          if (v6 == v7) {
            goto LABEL_45;
          }
          uint64_t v21 = *v6;
          std::string::size_type v22 = *(unsigned __int8 **)(*v6 + 8);
          uint64_t v23 = v22[23];
          if ((v23 & 0x80u) == 0) {
            uint64_t v24 = v22[23];
          }
          else {
            uint64_t v24 = *((void *)v22 + 1);
          }
          uint64_t v25 = *((unsigned __int8 *)v4 + 39);
          int v26 = (char)v25;
          if ((v25 & 0x80u) != 0) {
            uint64_t v25 = v4[3];
          }
          if (v24 != v25) {
            goto LABEL_45;
          }
          uint64_t v27 = v26 >= 0 ? (unsigned __int8 *)(v4 + 2) : (unsigned __int8 *)v4[2];
          if ((v23 & 0x80) == 0) {
            break;
          }
          if (!memcmp(*(const void **)v22, v27, *((void *)v22 + 1))) {
            goto LABEL_44;
          }
LABEL_45:
          uint64_t v4 = (uint64_t *)*v4;
          if (!v4) {
            goto LABEL_46;
          }
        }
        if (v22[23])
        {
          while (*v22 == *v27)
          {
            ++v22;
            ++v27;
            if (!--v23) {
              goto LABEL_44;
            }
          }
          goto LABEL_45;
        }
LABEL_44:
        unsigned int v32 = *(_DWORD *)(v21 + 16);
        char v35 = &v32;
        unint64_t v28 = (std::string *)sub_2638C4C28(a3, &v32, (uint64_t)&unk_2638C9AC4, &v35);
        std::string::operator=(v28 + 1, (const std::string *)(v4 + 2));
        goto LABEL_45;
      }
    }
LABEL_46:
    if (v34) {
      sub_26389F6D4(v34);
    }
  }
}

void sub_2638C4B78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_2638C4BA0(uint64_t a1)
{
  sub_2638C4BDC(a1, *(void ***)(a1 + 16));
  char v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void sub_2638C4BDC(int a1, void **__p)
{
  if (__p)
  {
    char v2 = __p;
    do
    {
      unsigned int v3 = (void **)*v2;
      if (*((char *)v2 + 47) < 0) {
        operator delete(v2[3]);
      }
      operator delete(v2);
      char v2 = v3;
    }
    while (v3);
  }
}

void *sub_2638C4C28(uint64_t a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
    char v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      unint64_t v11 = *v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (*((_DWORD *)v11 + 4) == v7) {
              return v11;
            }
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8) {
                v12 %= v8;
              }
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4) {
              break;
            }
          }
          unint64_t v11 = (void *)*v11;
        }
        while (v11);
      }
    }
  }
  uint64_t v13 = (void *)(a1 + 16);
  unint64_t v11 = operator new(0x30uLL);
  *unint64_t v11 = 0;
  v11[1] = v7;
  *((_DWORD *)v11 + 4) = **a4;
  v11[4] = 0;
  v11[5] = 0;
  void v11[3] = 0;
  float v14 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v15 = *(float *)(a1 + 32);
  if (!v8 || (float)(v15 * (float)v8) < v14)
  {
    BOOL v16 = 1;
    if (v8 >= 3) {
      BOOL v16 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v17 = v16 | (2 * v8);
    unint64_t v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18) {
      size_t v19 = v18;
    }
    else {
      size_t v19 = v17;
    }
    sub_26389EF6C(a1, v19);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }
  uint64_t v20 = *(void *)a1;
  uint64_t v21 = *(void **)(*(void *)a1 + 8 * v4);
  if (v21)
  {
    *unint64_t v11 = *v21;
LABEL_38:
    *uint64_t v21 = v11;
    goto LABEL_39;
  }
  *unint64_t v11 = *v13;
  *uint64_t v13 = v11;
  *(void *)(v20 + 8 * v4) = v13;
  if (*v11)
  {
    unint64_t v22 = *(void *)(*v11 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v22 >= v8) {
        v22 %= v8;
      }
    }
    else
    {
      v22 &= v8 - 1;
    }
    uint64_t v21 = (void *)(*(void *)a1 + 8 * v22);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v11;
}

void sub_2638C4E64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  sub_2638C4E80(v11, v10);
  _Unwind_Resume(a1);
}

void sub_2638C4E80(uint64_t a1, void **__p)
{
  if (*(unsigned char *)(a1 + 8))
  {
    if (*((char *)__p + 47) < 0) {
      operator delete(__p[3]);
    }
  }
  else if (!__p)
  {
    return;
  }

  operator delete(__p);
}

uint64_t sub_2638C4EE0(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 8))(a1);
}

void sub_2638C4F18()
{
  *(_WORD *)int v0 = 0;
  _os_log_error_impl(&dword_26389A000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "CoreAnalytics shim: Failed to get base metadata shmem from xpc object!", v0, 2u);
}

void sub_2638C4F60()
{
  *(_WORD *)int v0 = 0;
  _os_log_error_impl(&dword_26389A000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "CoreAnalytics shim: Failed to get metadata binary!", v0, 2u);
}

uint64_t sub_2638C4FA8()
{
  sub_2638BAF08();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x270EE51E0](length, *(void *)&encoding);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadString()
{
  return MEMORY[0x270F9AC70]();
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  return MEMORY[0x270F9AC78](this);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unsigned int *a2)
{
  return MEMORY[0x270F9AC80](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unint64_t *a2)
{
  return MEMORY[0x270F9AC88](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unsigned int *a2)
{
  return MEMORY[0x270F9AC90](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unint64_t *a2)
{
  return MEMORY[0x270F9AC98](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::Skip(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  return MEMORY[0x270F9ACA0](this);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadRaw(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, void *a2)
{
  return MEMORY[0x270F9ACA8](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  return MEMORY[0x270F9ACB8](this);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  return MEMORY[0x270F9ACC0](this);
}

void wireless_diagnostics::google::protobuf::io::CodedInputStream::~CodedInputStream(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
}

uint64_t PB::TextFormatter::beginObject(PB::TextFormatter *this, const char *a2)
{
  return MEMORY[0x270F587A0](this, a2);
}

uint64_t PB::TextFormatter::format()
{
  return MEMORY[0x270F587B0]();
}

uint64_t PB::TextFormatter::format(PB::TextFormatter *this, const char *a2)
{
  return MEMORY[0x270F587B8](this, a2);
}

{
  return MEMORY[0x270F587D0](this, a2);
}

{
  return MEMORY[0x270F587D8](this, a2);
}

{
  return MEMORY[0x270F587E0](this, a2);
}

{
  return MEMORY[0x270F587E8](this, a2);
}

void PB::Base::~Base(PB::Base *this)
{
}

uint64_t PB::Reader::recallMark()
{
  return MEMORY[0x270F58810]();
}

uint64_t PB::Reader::read()
{
  return MEMORY[0x270F58820]();
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

uint64_t PB::Writer::write()
{
  return MEMORY[0x270F58870]();
}

uint64_t PB::Writer::write(PB::Writer *this)
{
  return MEMORY[0x270F58878](this);
}

uint64_t PB::Writer::Writer(PB::Writer *this)
{
  return MEMORY[0x270F588A0](this);
}

void PB::Writer::~Writer(PB::Writer *this)
{
}

uint64_t ctu::hex(ctu *this)
{
  return MEMORY[0x270F97640](this);
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::SerializeToArray(wireless_diagnostics::google::protobuf::MessageLite *this, void *a2)
{
  return MEMORY[0x270F9B010](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  return MEMORY[0x270F9B038](this);
}

const char *__cdecl std::runtime_error::what(const std::runtime_error *this)
{
  return (const char *)MEMORY[0x270F98200](this);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x270F98268]();
}

const std::__fs::filesystem::directory_entry *__cdecl std::__fs::filesystem::directory_iterator::__dereference(const std::__fs::filesystem::directory_iterator *this)
{
  return (const std::__fs::filesystem::directory_entry *)MEMORY[0x270F98278](this);
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

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983B0](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
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

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F98498](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::append(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x270F984B0](this, __n, __c);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984B8](this, __s);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984E0](this, __pos, __s);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
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
  return MEMORY[0x270F987B0]();
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

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

std::__fs::filesystem::directory_iterator *__cdecl std::__fs::filesystem::directory_iterator::__increment(std::__fs::filesystem::directory_iterator *this, std::error_code *__ec)
{
  return (std::__fs::filesystem::directory_iterator *)MEMORY[0x270F98AF8](this, __ec);
}

std::__fs::filesystem::directory_iterator *__cdecl std::__fs::filesystem::directory_iterator::directory_iterator(std::__fs::filesystem::directory_iterator *this, const std::__fs::filesystem::path *a2, std::error_code *a3, std::__fs::filesystem::directory_options a4)
{
  return (std::__fs::filesystem::directory_iterator *)MEMORY[0x270F98B00](this, a2, a3, a4);
}

std::__fs::filesystem::file_status std::__fs::filesystem::__status(const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  return (std::__fs::filesystem::file_status)MEMORY[0x270F98B60](a1, __ec);
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

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, double __val)
{
  return (std::string *)MEMORY[0x270F98DF8](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, float __val)
{
  return (std::string *)MEMORY[0x270F98E00](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x270F98E08](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x270F98E10](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x270F98E20](retstr, __val);
}

{
  return (std::string *)MEMORY[0x270F98E30](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, uint64_t __val)
{
  return (std::string *)MEMORY[0x270F98E28](retstr, __val);
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

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x270ED9978](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x270ED9D98](a1, a2);
}

lconv *localeconv(void)
{
  return (lconv *)MEMORY[0x270EDA090]();
}

tm *__cdecl localtime(const time_t *a1)
{
  return (tm *)MEMORY[0x270EDA098](a1);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
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

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA598](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDA5F8](a1, a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x270EDB5F0](a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x270EDBB18](__str, __size, __format, a4);
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

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x270EDBF90](bytes, length);
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

xpc_object_t xpc_double_create(double value)
{
  return (xpc_object_t)MEMORY[0x270EDC168](value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x270EDC210](value);
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

size_t xpc_shmem_map(xpc_object_t xshmem, void **region)
{
  return MEMORY[0x270EDC3C0](xshmem, region);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x270EDC3D0](string);
}