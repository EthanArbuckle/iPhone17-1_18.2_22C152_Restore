void sub_10038C9F4(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5)
{
  void *v10;
  char v11;
  long long v12;
  uint64_t v13;
  void *v14;
  char v15;
  long long v16;
  uint64_t v17;
  void *v18;
  char v19;
  long long v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  long long v24;
  uint64_t v25;
  long long v26;
  long long v27;
  long long v28;
  long long v29;
  unsigned char v30[15];
  unsigned char v31[15];
  unsigned char v32[15];
  unsigned char v33[15];

  sub_10038C7BC(a1, a2, a3, a4);
  if ((sub_10004008C(a4, a5) & 0x80000000) != 0)
  {
    v10 = *(void **)a4;
    *(void *)v30 = *(void *)(a4 + 8);
    *(void *)&v30[7] = *(void *)(a4 + 15);
    v11 = *(unsigned char *)(a4 + 23);
    *(void *)(a4 + 16) = 0;
    *(void *)(a4 + 8) = 0;
    *(void *)a4 = 0;
    v12 = *(_OWORD *)(a4 + 24);
    v13 = *(void *)(a5 + 16);
    *(_OWORD *)a4 = *(_OWORD *)a5;
    *(void *)(a4 + 16) = v13;
    *(unsigned char *)(a5 + 23) = 0;
    *(unsigned char *)a5 = 0;
    *(void *)(a4 + 24) = *(void *)(a5 + 24);
    *(void *)(a4 + 32) = *(void *)(a5 + 32);
    if (*(char *)(a5 + 23) < 0)
    {
      v26 = v12;
      operator delete(*(void **)a5);
      v12 = v26;
    }
    *(void *)a5 = v10;
    *(void *)(a5 + 8) = *(void *)v30;
    *(void *)(a5 + 15) = *(void *)&v30[7];
    *(unsigned char *)(a5 + 23) = v11;
    *(_OWORD *)(a5 + 24) = v12;
    if ((sub_10004008C(a3, a4) & 0x80000000) != 0)
    {
      v14 = *(void **)a3;
      *(void *)v31 = *(void *)(a3 + 8);
      *(void *)&v31[7] = *(void *)(a3 + 15);
      v15 = *(unsigned char *)(a3 + 23);
      *(void *)(a3 + 16) = 0;
      *(void *)(a3 + 8) = 0;
      *(void *)a3 = 0;
      v16 = *(_OWORD *)(a3 + 24);
      v17 = *(void *)(a4 + 16);
      *(_OWORD *)a3 = *(_OWORD *)a4;
      *(void *)(a3 + 16) = v17;
      *(unsigned char *)(a4 + 23) = 0;
      *(unsigned char *)a4 = 0;
      *(void *)(a3 + 24) = *(void *)(a4 + 24);
      *(void *)(a3 + 32) = *(void *)(a4 + 32);
      if (*(char *)(a4 + 23) < 0)
      {
        v27 = v16;
        operator delete(*(void **)a4);
        v16 = v27;
      }
      *(void *)a4 = v14;
      *(void *)(a4 + 8) = *(void *)v31;
      *(void *)(a4 + 15) = *(void *)&v31[7];
      *(unsigned char *)(a4 + 23) = v15;
      *(_OWORD *)(a4 + 24) = v16;
      if ((sub_10004008C(a2, a3) & 0x80000000) != 0)
      {
        v18 = *(void **)a2;
        *(void *)v32 = *(void *)(a2 + 8);
        *(void *)&v32[7] = *(void *)(a2 + 15);
        v19 = *(unsigned char *)(a2 + 23);
        *(void *)(a2 + 16) = 0;
        *(void *)(a2 + 8) = 0;
        *(void *)a2 = 0;
        v20 = *(_OWORD *)(a2 + 24);
        v21 = *(void *)(a3 + 16);
        *(_OWORD *)a2 = *(_OWORD *)a3;
        *(void *)(a2 + 16) = v21;
        *(unsigned char *)(a3 + 23) = 0;
        *(unsigned char *)a3 = 0;
        *(void *)(a2 + 24) = *(void *)(a3 + 24);
        *(void *)(a2 + 32) = *(void *)(a3 + 32);
        if (*(char *)(a3 + 23) < 0)
        {
          v28 = v20;
          operator delete(*(void **)a3);
          v20 = v28;
        }
        *(void *)a3 = v18;
        *(void *)(a3 + 8) = *(void *)v32;
        *(void *)(a3 + 15) = *(void *)&v32[7];
        *(unsigned char *)(a3 + 23) = v19;
        *(_OWORD *)(a3 + 24) = v20;
        if ((sub_10004008C(a1, a2) & 0x80000000) != 0)
        {
          v22 = *(void *)a1;
          *(void *)v33 = *(void *)(a1 + 8);
          *(void *)&v33[7] = *(void *)(a1 + 15);
          v23 = *(unsigned char *)(a1 + 23);
          *(void *)(a1 + 8) = 0;
          *(void *)(a1 + 16) = 0;
          *(void *)a1 = 0;
          v24 = *(_OWORD *)(a1 + 24);
          v25 = *(void *)(a2 + 16);
          *(_OWORD *)a1 = *(_OWORD *)a2;
          *(void *)(a1 + 16) = v25;
          *(unsigned char *)(a2 + 23) = 0;
          *(unsigned char *)a2 = 0;
          *(void *)(a1 + 24) = *(void *)(a2 + 24);
          *(void *)(a1 + 32) = *(void *)(a2 + 32);
          if (*(char *)(a2 + 23) < 0)
          {
            v29 = v24;
            operator delete(*(void **)a2);
            v24 = v29;
          }
          *(void *)a2 = v22;
          *(void *)(a2 + 8) = *(void *)v33;
          *(void *)(a2 + 15) = *(void *)&v33[7];
          *(unsigned char *)(a2 + 23) = v23;
          *(_OWORD *)(a2 + 24) = v24;
        }
      }
    }
  }
}

double sub_10038CCC8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v6 = a3 - 2;
  if (a3 >= 2)
  {
    uint64_t v23 = v4;
    uint64_t v24 = v5;
    unint64_t v7 = a4;
    int64_t v9 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) >= (uint64_t)(0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(a4 - a1) >> 3)))
    {
      int64_t v11 = (0x999999999999999ALL * ((uint64_t)(a4 - a1) >> 3)) | 1;
      unint64_t v12 = a1 + 40 * v11;
      int64_t v13 = 0x999999999999999ALL * ((uint64_t)(a4 - a1) >> 3) + 2;
      if (v13 < a3 && (int)sub_10004008C(v12 + 40, a1 + 40 * v11) < 0)
      {
        v12 += 40;
        int64_t v11 = v13;
      }
      if ((sub_10004008C(v7, v12) & 0x80000000) == 0)
      {
        long long v20 = *(_OWORD *)v7;
        uint64_t v21 = *(void *)(v7 + 16);
        *(void *)(v7 + 8) = 0;
        *(void *)(v7 + 16) = 0;
        *(void *)unint64_t v7 = 0;
        long long v22 = *(_OWORD *)(v7 + 24);
        do
        {
          unint64_t v15 = v12;
          if (*(char *)(v7 + 23) < 0) {
            operator delete(*(void **)v7);
          }
          long long v16 = *(_OWORD *)v12;
          *(void *)(v7 + 16) = *(void *)(v12 + 16);
          *(_OWORD *)unint64_t v7 = v16;
          *(unsigned char *)(v12 + 23) = 0;
          *(unsigned char *)unint64_t v12 = 0;
          *(void *)(v7 + 24) = *(void *)(v12 + 24);
          *(void *)(v7 + 32) = *(void *)(v12 + 32);
          if (v9 < v11) {
            break;
          }
          uint64_t v17 = (2 * v11) | 1;
          unint64_t v12 = a1 + 40 * v17;
          uint64_t v18 = 2 * v11 + 2;
          if (v18 < a3 && (int)sub_10004008C(v12 + 40, a1 + 40 * v17) < 0)
          {
            v12 += 40;
            uint64_t v17 = v18;
          }
          unint64_t v7 = v15;
          int64_t v11 = v17;
        }
        while ((sub_10004008C((unint64_t)&v20, v12) & 0x80000000) == 0);
        if (*(char *)(v15 + 23) < 0) {
          operator delete(*(void **)v15);
        }
        long long v19 = v20;
        *(void *)(v15 + 16) = v21;
        *(_OWORD *)unint64_t v15 = v19;
        *(void *)(v15 + 24) = v22;
        double result = *((double *)&v22 + 1);
        *(void *)(v15 + 32) = *((void *)&v22 + 1);
      }
    }
  }
  return result;
}

void sub_10038CE80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4 >= 2)
  {
    uint64_t v7 = 0;
    uint64_t v22 = *(void *)a1;
    *(void *)uint64_t v24 = *(void *)(a1 + 8);
    *(void *)&v24[7] = *(void *)(a1 + 15);
    char v23 = *(unsigned char *)(a1 + 23);
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
    *(void *)a1 = 0;
    int v20 = *(_DWORD *)(a1 + 28);
    int v21 = *(_DWORD *)(a1 + 24);
    int64_t v8 = (unint64_t)(a4 - 2) >> 1;
    unint64_t v9 = a1;
    int v18 = *(_DWORD *)(a1 + 32);
    int v19 = *(_DWORD *)(a1 + 36);
    do
    {
      unint64_t v11 = v9 + 40 * v7 + 40;
      uint64_t v12 = 2 * v7;
      uint64_t v7 = (2 * v7) | 1;
      uint64_t v13 = v12 + 2;
      if (v12 + 2 < a4 && (int)sub_10004008C(v11 + 40, v11) < 0)
      {
        v11 += 40;
        uint64_t v7 = v13;
      }
      if (*(char *)(v9 + 23) < 0) {
        operator delete(*(void **)v9);
      }
      long long v10 = *(_OWORD *)v11;
      *(void *)(v9 + 16) = *(void *)(v11 + 16);
      *(_OWORD *)unint64_t v9 = v10;
      *(unsigned char *)(v11 + 23) = 0;
      *(unsigned char *)unint64_t v11 = 0;
      *(void *)(v9 + 24) = *(void *)(v11 + 24);
      *(void *)(v9 + 32) = *(void *)(v11 + 32);
      unint64_t v9 = v11;
    }
    while (v7 <= v8);
    v14 = (void **)(a2 - 40);
    int v15 = *(char *)(v11 + 23);
    if (v11 == a2 - 40)
    {
      if (v15 < 0) {
        operator delete(*(void **)v11);
      }
      *(void *)unint64_t v11 = v22;
      *(void *)(v11 + 8) = *(void *)v24;
      *(void *)(v11 + 15) = *(void *)&v24[7];
      *(unsigned char *)(v11 + 23) = v23;
      *(_DWORD *)(v11 + 24) = v21;
      *(_DWORD *)(v11 + 28) = v20;
      *(_DWORD *)(v11 + 32) = v18;
      *(_DWORD *)(v11 + 36) = v19;
    }
    else
    {
      if (v15 < 0) {
        operator delete(*(void **)v11);
      }
      long long v16 = *(_OWORD *)v14;
      *(void *)(v11 + 16) = *(void *)(a2 - 24);
      *(_OWORD *)unint64_t v11 = v16;
      *(unsigned char *)(a2 - 17) = 0;
      *(unsigned char *)(a2 - 40) = 0;
      *(void *)(v11 + 24) = *(void *)(a2 - 16);
      *(void *)(v11 + 32) = *(void *)(a2 - 8);
      if (*(char *)(a2 - 17) < 0) {
        operator delete(*v14);
      }
      *(void *)(a2 - 40) = v22;
      *(void *)(a2 - 32) = *(void *)v24;
      *(void *)(a2 - 25) = *(void *)&v24[7];
      *(unsigned char *)(a2 - 17) = v23;
      *(_DWORD *)(a2 - 16) = v21;
      *(_DWORD *)(a2 - 12) = v20;
      *(_DWORD *)(a2 - 8) = v18;
      *(_DWORD *)(a2 - 4) = v19;
      sub_10038D0D8(a1, v11 + 40, a3, 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v11 + 40 - a1) >> 3));
    }
  }
}

double sub_10038D0D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4 >= 2)
  {
    uint64_t v17 = v4;
    uint64_t v18 = v5;
    unint64_t v8 = (unint64_t)(a4 - 2) >> 1;
    unint64_t v9 = a1 + 40 * v8;
    unint64_t v10 = a2 - 40;
    if ((sub_10004008C(a2 - 40, v9) & 0x80000000) != 0)
    {
      long long v14 = *(_OWORD *)v10;
      uint64_t v15 = *(void *)(v10 + 16);
      *(void *)(v10 + 8) = 0;
      *(void *)(v10 + 16) = 0;
      *(void *)unint64_t v10 = 0;
      long long v16 = *(_OWORD *)(a2 - 16);
      do
      {
        unint64_t v12 = v9;
        if (*(char *)(v10 + 23) < 0) {
          operator delete(*(void **)v10);
        }
        long long v13 = *(_OWORD *)v9;
        *(void *)(v10 + 16) = *(void *)(v9 + 16);
        *(_OWORD *)unint64_t v10 = v13;
        *(unsigned char *)(v9 + 23) = 0;
        *(unsigned char *)unint64_t v9 = 0;
        *(void *)(v10 + 24) = *(void *)(v9 + 24);
        *(void *)(v10 + 32) = *(void *)(v9 + 32);
        if (!v8) {
          break;
        }
        unint64_t v8 = (v8 - 1) >> 1;
        unint64_t v9 = a1 + 40 * v8;
        unint64_t v10 = v12;
      }
      while ((sub_10004008C((unint64_t)&v14, v9) & 0x80000000) != 0);
      if (*(char *)(v12 + 23) < 0) {
        operator delete(*(void **)v12);
      }
      *(_OWORD *)unint64_t v12 = v14;
      *(void *)(v12 + 16) = v15;
      double result = *(double *)&v16;
      *(_OWORD *)(v12 + 24) = v16;
    }
  }
  return result;
}

std::string *sub_10038D1EC@<X0>(std::string::value_type *__s@<X0>, std::string *a2@<X8>)
{
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  return std::string::assign(a2, __s);
}

void sub_10038D220(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_10038D23C(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_10046B408;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_10038D25C(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_10046B408;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

uint64_t sub_10038D2B0(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void sub_10038D2D8(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);

  objc_destroyWeak(v1);
}

uint64_t sub_10038D314(uint64_t a1)
{
  return a1;
}

void sub_10038D340(uint64_t a1)
{
  operator delete();
}

void sub_10038D38C(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  uint64_t v4 = a1;
  memset(&v5, 0, sizeof(v5));
  if ((sub_10015E6D8((uint64_t)&v4, &v5) & 1) == 0)
  {
    std::bad_cast::bad_cast(&v6);
    v6.__vftable = (std::bad_cast_vtbl *)&off_100454020;
    sub_1000DB0D4((uint64_t)&v6);
  }
  v3 = std::string::insert(&v5, 0, "DispatchSensorObserver ");
  *a2 = *v3;
  v3->__r_.__value_.__l.__size_ = 0;
  v3->__r_.__value_.__r.__words[2] = 0;
  v3->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v5.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v5.__r_.__value_.__l.__data_);
  }
}

void sub_10038D460(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, std::bad_cast a17)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10038D490(_DWORD *a1, uint64_t a2)
{
  v2 = (uint64_t *)(a1 + 2);
  switch(*a1 ^ ((int)*a1 >> 31))
  {
    case 1:
      int v3 = *(_DWORD *)v2;
      sub_10038D778(*(unsigned int *)v2);
      uint64_t result = (unsigned __int16)v3;
      break;
    case 2:
      uint64_t v5 = *v2;
      sub_10038D808(*v2);
      uint64_t result = (unsigned __int16)v5;
      break;
    case 3:
      uint64_t result = sub_10038D898(a2, (unsigned __int8 *)v2);
      break;
    case 4:
      double v6 = *(double *)v2;
      sub_10038DEC4(*(double *)v2);
      double v7 = ceil(v6);
      double v8 = floor(v6);
      if (v6 >= 0.0) {
        double v7 = v8;
      }
      uint64_t result = (unsigned __int16)(int)v7;
      break;
    case 5:
      sub_10038DF60();
    case 6:
      sub_10038E0D4();
    default:
      sub_10038D604();
  }
  return result;
}

void sub_10038D604()
{
  __cxa_allocate_exception(0x40uLL);
  v1.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x30uLL);
  *(_OWORD *)&v1.__r_.__value_.__r.__words[1] = xmmword_1003EE0F0;
  strcpy(v1.__r_.__value_.__l.__data_, "Attempt to convert empty value to a type");
  std::runtime_error::runtime_error(&v2, &v1);
  v2.__vftable = (std::runtime_error_vtbl *)&off_100453860;
  sub_10018E868((uint64_t)v0);
  sub_1000D1698(&v2, (uint64_t)"T override::detail::SettingValueImpl::lexical_cast_visitor<unsigned short>::operator()(boost::none_t) const [T = unsigned short]", (uint64_t)"../common/util/overridable_setting.h", 111, (uint64_t)v0);
}

void sub_10038D6D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, std::runtime_error a18)
{
  if (__p) {
    operator delete(__p);
  }
  std::runtime_error::~runtime_error(&a18);
  if (a17 < 0) {
    operator delete(a12);
  }
  _Unwind_Resume(a1);
}

void sub_10038D740(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0)
  {
    operator delete(__p);
    __cxa_free_exception(v17);
    _Unwind_Resume(a1);
  }
  JUMPOUT(0x10038D730);
}

void sub_10038D764(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10038D778(uint64_t result)
{
  int v1 = 2 * ((int)result >= 0x10000);
  if ((int)result < 0) {
    int v1 = 1;
  }
  if (v1 == 2)
  {
    exception = (std::bad_cast *)__cxa_allocate_exception(8uLL);
    exception->__vftable = 0;
    int v3 = sub_10015F6A0(exception);
  }
  if (v1 == 1)
  {
    uint64_t v4 = (std::bad_cast *)__cxa_allocate_exception(8uLL);
    v4->__vftable = 0;
    uint64_t v5 = sub_10015F668(v4);
  }
  return result;
}

uint64_t sub_10038D808(uint64_t result)
{
  int v1 = 2 * (result >= 0x10000);
  if (result < 0) {
    int v1 = 1;
  }
  if (v1 == 2)
  {
    exception = (std::bad_cast *)__cxa_allocate_exception(8uLL);
    exception->__vftable = 0;
    int v3 = sub_10015F6A0(exception);
  }
  if (v1 == 1)
  {
    uint64_t v4 = (std::bad_cast *)__cxa_allocate_exception(8uLL);
    v4->__vftable = 0;
    uint64_t v5 = sub_10015F668(v4);
  }
  return result;
}

uint64_t sub_10038D898(uint64_t a1, unsigned __int8 *a2)
{
  unsigned __int16 v9 = 0;
  uint64_t v2 = a2[23];
  int v3 = *(unsigned __int8 **)a2;
  if ((v2 & 0x80u) != 0) {
    uint64_t v2 = *((void *)a2 + 1);
  }
  else {
    int v3 = a2;
  }
  if (!v2) {
    goto LABEL_13;
  }
  uint64_t v4 = &v3[v2];
  int v5 = *v3;
  if (v5 == 45 || v5 == 43) {
    ++v3;
  }
  LOBYTE(v10.__vftable) = 0;
  WORD1(v10.__vftable) = 1;
  unint64_t v11 = &v9;
  unint64_t v12 = v3;
  long long v13 = v4;
  int v6 = sub_10038D9AC((uint64_t)&v10);
  if (v5 == 45)
  {
    int v7 = -v9;
    unsigned __int16 v9 = -v9;
    if (v6) {
      return (unsigned __int16)v7;
    }
LABEL_13:
    std::bad_cast::bad_cast(&v10);
    v10.__vftable = (std::bad_cast_vtbl *)&off_100454020;
    sub_1000DB0D4((uint64_t)&v10);
  }
  if (!v6) {
    goto LABEL_13;
  }
  return v9;
}

void sub_10038D998(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::bad_cast a11)
{
}

uint64_t sub_10038D9AC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = v1 - 1;
  uint64_t v2 = *(_WORD **)(a1 + 8);
  _WORD *v2 = 0;
  if (*(void *)(a1 + 16) > (unint64_t)(v1 - 1)) {
    return 0;
  }
  int v3 = *(unsigned __int8 *)(v1 - 1);
  if ((v3 - 58) < 0xFFFFFFF6) {
    return 0;
  }
  _WORD *v2 = v3 - 48;
  *(void *)(a1 + 24) = v1 - 2;
  std::locale::locale(&v49);
  int v6 = std::locale::classic();
  if (std::locale::operator==(&v49, v6))
  {
    unint64_t v7 = *(void *)(a1 + 16);
    double v8 = *(unsigned char **)(a1 + 24);
    if ((unint64_t)v8 >= v7)
    {
      char v12 = *(unsigned char *)a1 != 0;
      while (1)
      {
        unsigned int v15 = *(unsigned __int16 *)(a1 + 2);
        v12 |= v15 >> 1 > 0xCCC;
        *(unsigned char *)a1 = v12 & 1;
        unsigned __int16 v16 = 10 * v15;
        *(_WORD *)(a1 + 2) = 10 * v15;
        int v17 = (char)*v8;
        if ((*v8 - 58) < 0xF6u) {
          break;
        }
        int v18 = v17 - 48;
        unsigned __int16 v19 = (v17 - 48) * v16;
        if (v18)
        {
          if (v12) {
            break;
          }
          if ((((unsigned __int16)v18 * v16) & 0xFFFF0000) != 0) {
            break;
          }
          long long v13 = *(_WORD **)(a1 + 8);
          int v14 = (unsigned __int16)*v13;
          if (((v14 + v19) & 0x10000) != 0) {
            break;
          }
        }
        else
        {
          long long v13 = *(_WORD **)(a1 + 8);
          LOWORD(v14) = *v13;
        }
        *long long v13 = v14 + v19;
        *(void *)(a1 + 24) = --v8;
        if ((unint64_t)v8 < v7) {
          goto LABEL_6;
        }
      }
      uint64_t v9 = 0;
    }
    else
    {
LABEL_6:
      uint64_t v9 = 1;
    }
    goto LABEL_63;
  }
  std::bad_cast v10 = std::locale::use_facet(&v49, &std::numpunct<char>::id);
  ((void (*)(void **__return_ptr))v10->__vftable[1].__on_zero_shared)(&__p);
  if ((char)v48 < 0)
  {
    uint64_t v11 = v47;
    if (!v47 || *(char *)__p <= 0)
    {
LABEL_26:
      unint64_t v26 = *(void *)(a1 + 16);
      v27 = *(unsigned char **)(a1 + 24);
      if ((unint64_t)v27 >= v26)
      {
        char v38 = *(unsigned char *)a1 != 0;
        while (1)
        {
          unsigned int v41 = *(unsigned __int16 *)(a1 + 2);
          v38 |= v41 >> 1 > 0xCCC;
          *(unsigned char *)a1 = v38 & 1;
          unsigned __int16 v42 = 10 * v41;
          *(_WORD *)(a1 + 2) = 10 * v41;
          int v43 = (char)*v27;
          if ((*v27 - 58) < 0xF6u) {
            break;
          }
          int v44 = v43 - 48;
          unsigned __int16 v45 = (v43 - 48) * v42;
          if (v44)
          {
            if (v38) {
              break;
            }
            if ((((unsigned __int16)v44 * v42) & 0xFFFF0000) != 0) {
              break;
            }
            v39 = *(_WORD **)(a1 + 8);
            int v40 = (unsigned __int16)*v39;
            if (((v40 + v45) & 0x10000) != 0) {
              break;
            }
          }
          else
          {
            v39 = *(_WORD **)(a1 + 8);
            LOWORD(v40) = *v39;
          }
          _WORD *v39 = v40 + v45;
          *(void *)(a1 + 24) = --v27;
          if ((unint64_t)v27 < v26) {
            goto LABEL_27;
          }
        }
LABEL_61:
        uint64_t v9 = 0;
        if (((char)v48 & 0x80000000) == 0) {
          goto LABEL_63;
        }
        goto LABEL_62;
      }
      goto LABEL_27;
    }
  }
  else
  {
    uint64_t v11 = v48;
    if (!v48 || (char)__p <= 0) {
      goto LABEL_26;
    }
  }
  char v20 = ((uint64_t (*)(const std::locale::facet *))v10->__vftable[1].~facet_0)(v10);
  int v21 = *(unsigned char **)(a1 + 16);
  uint64_t v22 = *(unsigned char **)(a1 + 24);
  if (v22 >= v21)
  {
    unsigned __int8 v23 = 0;
    p_p = __p;
    if ((v48 & 0x80u) == 0) {
      p_p = &__p;
    }
    char v25 = *p_p - 1;
    while (1)
    {
      while (v25)
      {
        unsigned int v30 = *(unsigned __int16 *)(a1 + 2);
        if (*(unsigned char *)a1) {
          BOOL v31 = 1;
        }
        else {
          BOOL v31 = v30 >> 1 > 0xCCC;
        }
        char v32 = v31;
        *(unsigned char *)a1 = v32;
        unsigned __int16 v33 = 10 * v30;
        *(_WORD *)(a1 + 2) = 10 * v30;
        int v34 = (char)*v22;
        if ((*v22 - 58) < 0xF6u) {
          goto LABEL_61;
        }
        int v35 = v34 - 48;
        unsigned __int16 v36 = (v34 - 48) * v33;
        if (v35)
        {
          if (v32) {
            goto LABEL_61;
          }
          if ((((unsigned __int16)v35 * v33) & 0xFFFF0000) != 0) {
            goto LABEL_61;
          }
          v28 = *(_WORD **)(a1 + 8);
          int v29 = (unsigned __int16)*v28;
          if (((v29 + v36) & 0x10000) != 0) {
            goto LABEL_61;
          }
        }
        else
        {
          v28 = *(_WORD **)(a1 + 8);
          LOWORD(v29) = *v28;
        }
        _WORD *v28 = v29 + v36;
        --v25;
        *(void *)(a1 + 24) = --v22;
        if (v22 < v21) {
          goto LABEL_27;
        }
      }
      if (*v22 != v20) {
        break;
      }
      if (v22 == v21) {
        goto LABEL_61;
      }
      if (v11 - 1 > (unint64_t)v23) {
        ++v23;
      }
      if ((v48 & 0x80u) == 0) {
        v37 = &__p;
      }
      else {
        v37 = __p;
      }
      char v25 = v37[v23];
      *(void *)(a1 + 24) = --v22;
      if (v22 < v21) {
        goto LABEL_27;
      }
    }
    uint64_t v9 = sub_10038DE08(a1);
    if (((char)v48 & 0x80000000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_62;
  }
LABEL_27:
  uint64_t v9 = 1;
  if ((char)v48 < 0) {
LABEL_62:
  }
    operator delete(__p);
LABEL_63:
  std::locale::~locale(&v49);
  return v9;
}

void sub_10038DDC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, std::locale a15)
{
  if (a14 < 0)
  {
    operator delete(__p);
    std::locale::~locale(&a15);
    _Unwind_Resume(a1);
  }
  std::locale::~locale(&a15);
  _Unwind_Resume(a1);
}

uint64_t sub_10038DE08(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = *(unsigned char **)(a1 + 24);
  if ((unint64_t)v2 < v1) {
    return 1;
  }
  char v4 = *(unsigned char *)a1 != 0;
  while (1)
  {
    unsigned int v7 = *(unsigned __int16 *)(a1 + 2);
    v4 |= v7 >> 1 > 0xCCC;
    *(unsigned char *)a1 = v4 & 1;
    unsigned __int16 v8 = 10 * v7;
    *(_WORD *)(a1 + 2) = 10 * v7;
    int v9 = (char)*v2;
    if ((*v2 - 58) < 0xF6u) {
      break;
    }
    int v10 = v9 - 48;
    unsigned __int16 v11 = (v9 - 48) * v8;
    if (v10)
    {
      if (v4) {
        return 0;
      }
      if ((((unsigned __int16)v10 * v8) & 0xFFFF0000) != 0) {
        return 0;
      }
      int v5 = *(_WORD **)(a1 + 8);
      int v6 = (unsigned __int16)*v5;
      if (((v6 + v11) & 0x10000) != 0) {
        return 0;
      }
    }
    else
    {
      int v5 = *(_WORD **)(a1 + 8);
      LOWORD(v6) = *v5;
    }
    *int v5 = v6 + v11;
    *(void *)(a1 + 24) = --v2;
    if ((unint64_t)v2 < v1) {
      return 1;
    }
  }
  return 0;
}

void sub_10038DEC4(double a1)
{
  int v1 = 2 * (a1 >= 65536.0);
  if (a1 <= -1.0) {
    int v1 = 1;
  }
  if (v1 == 2)
  {
    exception = (std::bad_cast *)__cxa_allocate_exception(8uLL);
    exception->__vftable = 0;
    int v3 = sub_10015F6A0(exception);
  }
  if (v1 == 1)
  {
    char v4 = (std::bad_cast *)__cxa_allocate_exception(8uLL);
    v4->__vftable = 0;
    int v5 = sub_10015F668(v4);
  }
}

void sub_10038DF60()
{
  __cxa_allocate_exception(0x40uLL);
  v1.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x30uLL);
  *(_OWORD *)&v1.__r_.__value_.__r.__words[1] = xmmword_1003EE100;
  strcpy(v1.__r_.__value_.__l.__data_, "Attempt to convert between incompatible types");
  std::runtime_error::runtime_error(&v2, &v1);
  v2.__vftable = (std::runtime_error_vtbl *)&off_100453860;
  sub_10018E868((uint64_t)v0);
  sub_1000D1698(&v2, (uint64_t)"T override::detail::SettingValueImpl::lexical_cast_visitor<unsigned short>::operator()(const F &) const [T = unsigned short, F = std::vector<boost::variant<boost::detail::variant::recursive_flag<boost::none_t>, int, long long, std::string, double, std::vector<boost::recursive_variant_>, std::unordered_map<std::string, boost::recursive_variant_>>>]", (uint64_t)"../common/util/overridable_setting.h", 106, (uint64_t)v0);
}

void sub_10038E034(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, std::runtime_error a18)
{
  if (__p) {
    operator delete(__p);
  }
  std::runtime_error::~runtime_error(&a18);
  if (a17 < 0) {
    operator delete(a12);
  }
  _Unwind_Resume(a1);
}

void sub_10038E09C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0)
  {
    operator delete(__p);
    __cxa_free_exception(v17);
    _Unwind_Resume(a1);
  }
  JUMPOUT(0x10038E08CLL);
}

void sub_10038E0C0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_10038E0D4()
{
  __cxa_allocate_exception(0x40uLL);
  v1.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x30uLL);
  *(_OWORD *)&v1.__r_.__value_.__r.__words[1] = xmmword_1003EE100;
  strcpy(v1.__r_.__value_.__l.__data_, "Attempt to convert between incompatible types");
  std::runtime_error::runtime_error(&v2, &v1);
  v2.__vftable = (std::runtime_error_vtbl *)&off_100453860;
  sub_10018E868((uint64_t)v0);
  sub_1000D1698(&v2, (uint64_t)"T override::detail::SettingValueImpl::lexical_cast_visitor<unsigned short>::operator()(const F &) const [T = unsigned short, F = std::unordered_map<std::string, boost::variant<boost::detail::variant::recursive_flag<boost::none_t>, int, long long, std::string, double, std::vector<boost::recursive_variant_>, std::unordered_map<std::string, boost::recursive_variant_>>>]", (uint64_t)"../common/util/overridable_setting.h", 106, (uint64_t)v0);
}

void sub_10038E1A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, std::runtime_error a18)
{
  if (__p) {
    operator delete(__p);
  }
  std::runtime_error::~runtime_error(&a18);
  if (a17 < 0) {
    operator delete(a12);
  }
  _Unwind_Resume(a1);
}

void sub_10038E210(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0)
  {
    operator delete(__p);
    __cxa_free_exception(v17);
    _Unwind_Resume(a1);
  }
  JUMPOUT(0x10038E200);
}

void sub_10038E234(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10038E248@<X0>(char *a1@<X0>, std::string *a2@<X8>)
{
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  uint64_t result = sub_10038E2F8(a1, a2);
  if ((result & 1) == 0)
  {
    std::bad_cast::bad_cast(&v3);
    v3.__vftable = (std::bad_cast_vtbl *)&off_100454020;
    sub_1000DB0D4((uint64_t)&v3);
  }
  return result;
}

void sub_10038E2CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::bad_cast a10)
{
  std::bad_cast::~bad_cast(&a10);
  if (*(char *)(v10 + 23) < 0) {
    operator delete(*(void **)v10);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_10038E2F8(char *a1, std::string *a2)
{
  long long v23 = 0u;
  long long v24 = 0u;
  memset(v22, 0, sizeof(v22));
  std::streambuf::basic_streambuf();
  *(_OWORD *)__p = 0u;
  long long v26 = 0u;
  uint64_t v27 = 24;
  *(void *)&long long v23 = 0;
  v22[0].n128_u64[0] = (unint64_t)off_100453E60;
  std::ios_base::init(&v29, v22);
  uint64_t v30 = 0;
  int v31 = -1;
  unsigned __int16 v33 = (char *)&v32;
  int v34 = (char *)&v32 + 2;
  sub_10038E59C(v22, a1);
  uint64_t v5 = v4;
  if (v4)
  {
    unsigned int v7 = v33;
    int v6 = v34;
    unint64_t v8 = v34 - v33;
    if (SHIBYTE(a2->__r_.__value_.__r.__words[2]) < 0)
    {
      unint64_t v12 = a2->__r_.__value_.__r.__words[2];
      std::string::size_type v11 = (v12 & 0x7FFFFFFFFFFFFFFFLL) - 1;
      if (v11 >= v8)
      {
        unint64_t v13 = HIBYTE(v12);
LABEL_9:
        if ((v13 & 0x80u) == 0) {
          int v9 = a2;
        }
        else {
          int v9 = (std::string *)a2->__r_.__value_.__r.__words[0];
        }
LABEL_12:
        if (v7 == v6)
        {
          int v14 = v9;
        }
        else
        {
          if (v8 < 0x20 || (unint64_t)((char *)v9 - v7) < 0x20)
          {
            int v14 = v9;
            unsigned int v15 = v7;
          }
          else
          {
            int v14 = (std::string *)((char *)v9 + (v8 & 0xFFFFFFFFFFFFFFE0));
            unsigned int v15 = &v7[v8 & 0xFFFFFFFFFFFFFFE0];
            unsigned __int16 v16 = (long long *)(v7 + 16);
            int v17 = &v9->__r_.__value_.__r.__words[2];
            unint64_t v18 = v8 & 0xFFFFFFFFFFFFFFE0;
            do
            {
              long long v19 = *v16;
              *((_OWORD *)v17 - 1) = *(v16 - 1);
              *(_OWORD *)int v17 = v19;
              v16 += 2;
              v17 += 4;
              v18 -= 32;
            }
            while (v18);
            if (v8 == (v8 & 0xFFFFFFFFFFFFFFE0)) {
              goto LABEL_22;
            }
          }
          do
          {
            std::string::value_type v20 = *v15++;
            v14->__r_.__value_.__s.__data_[0] = v20;
            int v14 = (std::string *)((char *)v14 + 1);
          }
          while (v15 != v6);
        }
LABEL_22:
        v14->__r_.__value_.__s.__data_[0] = 0;
        if (SHIBYTE(a2->__r_.__value_.__r.__words[2]) < 0) {
          a2->__r_.__value_.__l.__size_ = v8;
        }
        else {
          *((unsigned char *)&a2->__r_.__value_.__s + 23) = v8 & 0x7F;
        }
        goto LABEL_25;
      }
      std::string::size_type size = a2->__r_.__value_.__l.__size_;
    }
    else
    {
      int v9 = a2;
      if (v8 <= 0x16) {
        goto LABEL_12;
      }
      std::string::size_type size = HIBYTE(a2->__r_.__value_.__r.__words[2]);
      std::string::size_type v11 = 22;
    }
    std::string::__grow_by(a2, v11, v8 - v11, size, 0, size, 0);
    a2->__r_.__value_.__l.__size_ = 0;
    LOBYTE(v13) = *((unsigned char *)&a2->__r_.__value_.__s + 23);
    goto LABEL_9;
  }
LABEL_25:
  std::ostream::~ostream();
  if (SBYTE7(v26) < 0) {
    operator delete(__p[0]);
  }
  std::streambuf::~streambuf();
  return v5;
}

void sub_10038E55C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_10038E570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_10038E584(void *a1)
{
}

__n128 sub_10038E59C(__n128 *a1, char *a2)
{
  uint64_t v4 = &a1[6].n128_u64[1];
  uint64_t v5 = (std::ios_base *)&a1[6].n128_i8[*(void *)(a1[6].n128_u64[1] - 24) + 8];
  v5->__exceptions_ = 1;
  std::ios_base::clear(v5, v5->__rdstate_);
  char v7 = *a2;
  sub_10002986C(v4, (uint64_t)&v7, 1);
  __n128 result = *(__n128 *)(*(unint64_t *)((char *)v4 + *(void *)(a1[6].n128_u64[1] - 24) + 40) + 40);
  a1[17] = result;
  return result;
}

uint64_t sub_10038E68C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v2; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 56;
    if (*(char *)(i - 9) < 0)
    {
      operator delete(*(void **)(i - 32));
      if ((*(char *)(i - 33) & 0x80000000) == 0) {
        continue;
      }
    }
    else if ((*(char *)(i - 33) & 0x80000000) == 0)
    {
      continue;
    }
    operator delete(*(void **)(i - 56));
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

char *sub_10038E710(void **a1, uint64_t a2)
{
  uint64_t v3 = 0x6DB6DB6DB6DB6DB7 * (((unsigned char *)a1[1] - (unsigned char *)*a1) >> 3);
  unint64_t v4 = v3 + 1;
  if ((unint64_t)(v3 + 1) > 0x492492492492492) {
    sub_1000A9108();
  }
  if (0xDB6DB6DB6DB6DB6ELL * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3) > v4) {
    unint64_t v4 = 0xDB6DB6DB6DB6DB6ELL * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3);
  }
  if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3)) >= 0x249249249249249) {
    unint64_t v6 = 0x492492492492492;
  }
  else {
    unint64_t v6 = v4;
  }
  if (v6)
  {
    if (v6 > 0x492492492492492) {
      sub_1000A6A10();
    }
    char v7 = operator new(56 * v6);
  }
  else
  {
    char v7 = 0;
  }
  unint64_t v8 = &v7[56 * v3];
  long long v19 = &v7[56 * v6];
  if (*(char *)(a2 + 23) < 0)
  {
    sub_1000559FC(&v7[56 * v3], *(void **)a2, *(void *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)unint64_t v8 = *(_OWORD *)a2;
    *((void *)v8 + 2) = *(void *)(a2 + 16);
  }
  int v9 = &v7[56 * v3 + 24];
  if (*(char *)(a2 + 47) < 0)
  {
    sub_1000559FC(v9, *(void **)(a2 + 24), *(void *)(a2 + 32));
  }
  else
  {
    *(_OWORD *)int v9 = *(_OWORD *)(a2 + 24);
    *(void *)&v7[56 * v3 + 40] = *(void *)(a2 + 40);
  }
  *(_DWORD *)&v7[56 * v3 + 48] = *(_DWORD *)(a2 + 48);
  uint64_t v10 = &v7[56 * v3];
  unint64_t v18 = v10;
  std::string::size_type v11 = v10 + 56;
  unint64_t v12 = (char *)*a1;
  unint64_t v13 = (char *)a1[1];
  if (v13 == *a1)
  {
    *a1 = v8;
    a1[1] = v11;
    a1[2] = v19;
    goto LABEL_29;
  }
  do
  {
    long long v14 = *(_OWORD *)(v13 - 56);
    *((void *)v10 - 5) = *((void *)v13 - 5);
    *(_OWORD *)(v10 - 56) = v14;
    *((void *)v13 - 6) = 0;
    *((void *)v13 - 5) = 0;
    *((void *)v13 - 7) = 0;
    long long v15 = *((_OWORD *)v13 - 2);
    *((void *)v10 - 2) = *((void *)v13 - 2);
    *((_OWORD *)v10 - 2) = v15;
    *((void *)v13 - 3) = 0;
    *((void *)v13 - 2) = 0;
    *((void *)v13 - 4) = 0;
    *((_DWORD *)v10 - 2) = *((_DWORD *)v13 - 2);
    v10 -= 56;
    v13 -= 56;
  }
  while (v13 != v12);
  unsigned __int16 v16 = (char *)*a1;
  unint64_t v13 = (char *)a1[1];
  *a1 = v10;
  a1[1] = v11;
  a1[2] = v19;
  if (v13 == v16) {
    goto LABEL_29;
  }
  do
  {
    if (*(v13 - 9) < 0)
    {
      operator delete(*((void **)v13 - 4));
      if ((*(v13 - 33) & 0x80000000) == 0) {
        goto LABEL_22;
      }
    }
    else if ((*(v13 - 33) & 0x80000000) == 0)
    {
      goto LABEL_22;
    }
    operator delete(*((void **)v13 - 7));
LABEL_22:
    v13 -= 56;
  }
  while (v13 != v16);
  unint64_t v13 = v16;
LABEL_29:
  if (v13) {
    operator delete(v13);
  }
  return v18 + 56;
}

void sub_10038E95C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  if (*(char *)(v2 + 23) < 0)
  {
    operator delete(*(void **)v2);
    sub_10038E68C((uint64_t)va);
    _Unwind_Resume(a1);
  }
  sub_10038E68C((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_10038E994(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_10046B510;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_10038E9B4(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_10046B510;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

void sub_10038EA08(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_10046B560;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_10038EA28(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_10046B560;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

void sub_10038EA7C(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_10046B5B0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_10038EA9C(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_10046B5B0;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

void sub_10038EAF0(uint64_t a1)
{
  sub_10038ECF4((uint64_t)&v1, (void *)(a1 + 24));
}

void sub_10038EB1C(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_10046B600;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_10038EB3C(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_10046B600;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

void sub_10038EB90(uint64_t a1)
{
  char v1 = (void *)(a1 + 24);
  std::mutex::~mutex((std::mutex *)(a1 + 72));
  sub_10038EBC8(v1);
}

void sub_10038EBC8(void *a1)
{
  uint64_t v2 = (void *)a1[5];
  if (v2)
  {
    uint64_t v3 = (void *)v2[a1[1]];
    if (!v3)
    {
LABEL_18:
      operator delete(v2);
      a1[2] = 0;
      a1[4] = 0;
      a1[5] = 0;
      return;
    }
    while (1)
    {
      uint64_t v5 = (void *)*v3;
      uint64_t v6 = v3[3];
      if (!v6) {
        goto LABEL_6;
      }
      uint64_t v7 = v3[4];
      unint64_t v4 = (void *)v3[3];
      if (v7 != v6) {
        break;
      }
LABEL_5:
      v3[4] = v6;
      operator delete(v4);
LABEL_6:
      operator delete(v3);
      uint64_t v3 = v5;
      if (!v5)
      {
        uint64_t v2 = (void *)a1[5];
        goto LABEL_18;
      }
    }
    while (1)
    {
      unint64_t v8 = *(std::__shared_weak_count **)(v7 - 8);
      if (v8)
      {
        if (!atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
          break;
        }
      }
      uint64_t v9 = *(void *)(v7 - 40);
      if (v9) {
        goto LABEL_14;
      }
LABEL_10:
      v7 -= 48;
      if (v7 == v6)
      {
        unint64_t v4 = (void *)v3[3];
        goto LABEL_5;
      }
    }
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
    uint64_t v9 = *(void *)(v7 - 40);
    if (!v9) {
      goto LABEL_10;
    }
LABEL_14:
    (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
    goto LABEL_10;
  }
}

void sub_10038ECF4(uint64_t a1, void *a2)
{
  uint64_t v3 = (std::__shared_weak_count *)a2[5];
  if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
    unint64_t v4 = (std::__shared_weak_count *)a2[3];
    if (!v4) {
      goto LABEL_7;
    }
  }
  else
  {
    unint64_t v4 = (std::__shared_weak_count *)a2[3];
    if (!v4) {
      goto LABEL_7;
    }
  }
  if (!atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
LABEL_7:
  uint64_t v5 = (std::__shared_weak_count *)a2[1];
  if (v5 && !atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }
}

void sub_10038EE10(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_10046B650;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_10038EE30(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_10046B650;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

uint64_t sub_10038EE84(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

std::string *sub_10038EEAC@<X0>(std::string::value_type *__s@<X0>, std::string *a2@<X8>)
{
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  return std::string::assign(a2, __s);
}

void sub_10038EEE0(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

atomic_uint *sub_10038EEFC(atomic_uint *result)
{
  return result;
}

void sub_10038EF18()
{
  operator delete();
}

DIR *sub_10038EF4C(uint64_t a1, uint64_t a2, ...)
{
  va_start(va, a2);
  unint64_t v4 = (DIR **)(a1 + 48);
  return sub_10005623C(v4, (void **)(a1 + 56), (uint64_t *)va);
}

void sub_10038EF6C()
{
  if ((byte_10047BF40 & 1) == 0)
  {
    byte_10047BF40 = 1;
    sub_1000A6120(qword_10047BF30);
    __cxa_atexit((void (*)(void *))sub_1000A6488, qword_10047BF30, (void *)&_mh_execute_header);
  }
}

void sub_10038EFE4()
{
  if ((byte_10047BF58 & 1) == 0)
  {
    byte_10047BF58 = 1;
    sub_1000A6530(qword_10047BF48);
    __cxa_atexit((void (*)(void *))sub_1000A6488, qword_10047BF48, (void *)&_mh_execute_header);
  }
}

void sub_10038F05C()
{
}

void sub_10038F59C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if (a17 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_10038F7EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10038F82C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10038F9C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10038FB40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10038FCFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_10038FE68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10038FE80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10038FFA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10038FFB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10038FFF8()
{
  if ((byte_10047BF40 & 1) == 0)
  {
    byte_10047BF40 = 1;
    sub_1000A6120(qword_10047BF30);
    __cxa_atexit((void (*)(void *))sub_1000A6488, qword_10047BF30, (void *)&_mh_execute_header);
  }
}

void sub_100390070()
{
  if ((byte_10047BF58 & 1) == 0)
  {
    byte_10047BF58 = 1;
    sub_1000A6530(qword_10047BF48);
    __cxa_atexit((void (*)(void *))sub_1000A6488, qword_10047BF48, (void *)&_mh_execute_header);
  }
}

void sub_1003900E8()
{
  if ((byte_10047BF40 & 1) == 0)
  {
    byte_10047BF40 = 1;
    sub_1000A6120(qword_10047BF30);
    __cxa_atexit((void (*)(void *))sub_1000A6488, qword_10047BF30, (void *)&_mh_execute_header);
  }
}

void sub_100390160()
{
  if ((byte_10047BF58 & 1) == 0)
  {
    byte_10047BF58 = 1;
    sub_1000A6530(qword_10047BF48);
    __cxa_atexit((void (*)(void *))sub_1000A6488, qword_10047BF48, (void *)&_mh_execute_header);
  }
}

void sub_1003901D8()
{
}

void sub_10039025C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100390270(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1003902B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1003902C0()
{
  if (qword_10047BEF8 == -1)
  {
    uint64_t v0 = (void *)qword_10047BF00;
  }
  else
  {
    dispatch_once(&qword_10047BEF8, &stru_10046B930);
    uint64_t v0 = (void *)qword_10047BF00;
  }
  return v0;
}

void sub_1003907D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100390D00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_100390D34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100390D44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100390D54(uint64_t a1)
{
  if (qword_10047BEF8 != -1)
  {
    dispatch_once(&qword_10047BEF8, &stru_10046B930);
    uint64_t v2 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v2 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "unavailable foreground session reset complete", v3, 2u);
  }
LABEL_4:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100390E04(uint64_t a1)
{
  if (qword_10047BEF8 != -1)
  {
    dispatch_once(&qword_10047BEF8, &stru_10046B930);
    uint64_t v2 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v2 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "available foreground session reset complete", v3, 2u);
  }
LABEL_4:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100390EB4(uint64_t a1)
{
  if (qword_10047BEF8 != -1)
  {
    dispatch_once(&qword_10047BEF8, &stru_10046B930);
    uint64_t v2 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v2 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "background session reset complete", v3, 2u);
  }
LABEL_4:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_1003911D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1003911EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1003911FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1003912C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1003913CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1003913E0(void *a1)
{
}

void sub_1003913F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100391400(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100391498(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10039159C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1003915B0(void *a1)
{
}

void sub_1003915C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1003915D0(void *a1)
{
}

void sub_1003915E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1003916E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1003916FC(void *a1)
{
}

void sub_10039170C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10039171C(void *a1)
{
}

void sub_100391730(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10039185C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_100391888(void *a1)
{
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), *(id *)(a1[4] + 8));
  uint64_t v2 = a1[5];

  return dispatch_semaphore_signal(v2);
}

void sub_1003919AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::future<void> a10)
{
  std::future<void>::~future(&a10);
  std::promise<void>::~promise((std::promise<void> *)(v10 - 56));

  _Unwind_Resume(a1);
}

void sub_1003919D0(_Unwind_Exception *a1)
{
  std::promise<void>::~promise((std::promise<void> *)(v1 - 56));

  _Unwind_Resume(a1);
}

void sub_1003919F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100391A00(uint64_t a1)
{
  objc_storeStrong((id *)(**(void **)(a1 + 32) + 8), **(id **)(a1 + 40));
  uint64_t v2 = *(std::promise<void> **)(a1 + 48);

  std::promise<void>::set_value(v2);
}

__n128 sub_100391A48(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[2];
  a1[3].n128_u64[0] = a2[3].n128_u64[0];
  a1[2] = result;
  return result;
}

void sub_100391BFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100391C1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100391C34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100391C4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100391C60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100391C74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100391C88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100391D2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100391D40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100392304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1003923D0(id a1, NSArray *a2, NSArray *a3, NSArray *a4)
{
  uint64_t v6 = a2;
  uint64_t v7 = a3;
  unint64_t v8 = a4;
  if (qword_10047BEF8 != -1) {
    dispatch_once(&qword_10047BEF8, &stru_10046B930);
  }
  uint64_t v9 = (id)qword_10047BF00;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    NSUInteger v20 = [(NSArray *)v8 count];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Building list of in-flight background downloads to cancel: downloadTasks: %lu.", buf, 0xCu);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v10 = v8;
  id v11 = [(NSArray *)v10 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * i) cancel:v14];
      }
      id v11 = [(NSArray *)v10 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

void sub_100392570(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10039263C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100392654(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v20 = a2;
  id v21 = a3;
  id v22 = a4;
  if (qword_10047BEF8 != -1) {
    dispatch_once(&qword_10047BEF8, &stru_10046B930);
  }
  uint64_t v7 = (id)qword_10047BF00;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    id v32 = [v22 count];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Found %{public}lu download tasks to cancel", buf, 0xCu);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v22;
  id v8 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v27;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v26 + 1) + 8 * (void)v10);
        uint64_t v12 = +[IndoorRequestInfo indoorRequestInfoFromTask:v11];
        unint64_t v13 = *(void **)(a1 + 32);
        long long v14 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, (char *)[v13 count] - 1);
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_100392AC8;
        v24[3] = &unk_10046B788;
        id v15 = v12;
        id v25 = v15;
        id v16 = [v13 indexOfObjectAtIndexes:v14 options:0 passingTest:v24];

        if (*(void *)(a1 + 32) && v16 == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          if (qword_10047BEF8 != -1) {
            dispatch_once(&qword_10047BEF8, &stru_10046B930);
          }
          long long v17 = (id)qword_10047BF00;
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            unint64_t v18 = [v15 description];
            *(_DWORD *)buf = 138477827;
            id v32 = v18;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Leaving %{private}@ as background", buf, 0xCu);
          }
        }
        else
        {
          [v11 cancel];
          if (qword_10047BEF8 != -1) {
            dispatch_once(&qword_10047BEF8, &stru_10046B930);
          }
          long long v17 = (id)qword_10047BF00;
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            long long v19 = [v11 description];
            *(_DWORD *)buf = 138477827;
            id v32 = v19;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Cancelling %{private}@", buf, 0xCu);
          }
        }

        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v8);
  }
}

void sub_100392A28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

id sub_100392AC8(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 floorUuid];
  uint64_t v7 = [*(id *)(a1 + 32) floorUuid];
  id v8 = [v6 isEqualToString:v7];

  if (v8) {
    *a4 = 1;
  }
  return v8;
}

void sub_100392B3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100392B50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100392B68(uint64_t a1)
{
  v7[0] = @"canstart";
  uint64_t v2 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v8[0] = v2;
  v7[1] = @"idsInUniverse";
  uint64_t v3 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  v8[1] = v3;
  v7[2] = @"pctOnDisk";
  unint64_t v4 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 36)];
  v8[2] = v4;
  uint64_t v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

void sub_100392C74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100393088(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_100393598(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  _Unwind_Resume(a1);
}

void sub_10039384C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  id v16 = v14;

  _Block_object_dispose((const void *)(v15 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1003938B4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

void sub_100393914(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

void sub_100393B0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Unwind_Resume(a1);
}

void sub_100393B2C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained onQueueNotifyDelegateForegroundFetchComplete];

  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  unint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

void sub_100393B80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100393BD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100393D18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21)
{
  objc_destroyWeak(v21);
  _Block_object_dispose(&a16, 8);

  objc_destroyWeak((id *)(v22 - 40));
  _Unwind_Resume(a1);
}

void sub_100393D48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100393D58(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_100393D6C(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unint64_t v4 = [WeakRetained backgroundSessionQueue];
  uint64_t v5 = [v4 session];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100393E80;
  v6[3] = &unk_10046B888;
  objc_copyWeak(&v7, v2);
  v6[4] = *(void *)(a1 + 32);
  [v5 getTasksWithCompletionHandler:v6];

  objc_destroyWeak(&v7);
}

void sub_100393E48(_Unwind_Exception *a1)
{
  objc_destroyWeak(v4);

  _Unwind_Resume(a1);
}

void sub_100393E70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100393E80(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  uint64_t v6 = [v5 indexesOfObjectsPassingTest:&stru_10046B860];
  if (qword_10047BEF8 != -1) {
    dispatch_once(&qword_10047BEF8, &stru_10046B930);
  }
  id v7 = (id)qword_10047BF00;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = [v5 count];
    int v12 = 134349312;
    int64_t v13 = v8 - (unsigned char *)[v6 count];
    __int16 v14 = 2050;
    id v15 = [v5 count];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Found %{public}lu out of %{public}lu download tasks complete", (uint8_t *)&v12, 0x16u);
  }

  if (![v6 count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained notifyDelegatePrefetchComplete];
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = 0;
}

void sub_100393FE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_100394024(id a1, NSURLSessionDownloadTask *a2, unint64_t a3, BOOL *a4)
{
  unint64_t v4 = a2;
  if ([(NSURLSessionDownloadTask *)v4 state] == (id)2)
  {

    return 0;
  }
  else
  {
    BOOL v6 = [(NSURLSessionDownloadTask *)v4 state] != (id)3;

    return v6;
  }
}

void sub_100394084(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100394144(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_100091F70((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_10039416C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100394180(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100394198(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1003943D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  _Block_object_dispose(&a21, 8);

  _Unwind_Resume(a1);
}

void sub_100394404(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10039441C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  [WeakRetained onQueueSessionWillSendRequestForEstablishedConnection:*(void *)(a1 + 32) task:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];

  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  unint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

void sub_100394478(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100394D78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *__p,uint64_t a36,int a37,__int16 a38,char a39,char a40,void *a41,uint64_t a42,int a43,__int16 a44,char a45,char a46)
{
  sub_1000D8BF8(v51 - 160);
  if (a40 < 0) {
    operator delete(__p);
  }
  if (a46 < 0) {
    operator delete(a41);
  }

  _Unwind_Resume(a1);
}

uint64_t sub_100394F28(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_1003951C4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v4 - 96), 8);

  _Unwind_Resume(a1);
}

void sub_1003951F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100395208(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v3 = WeakRetained;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = *(std::__shared_weak_count **)(a1 + 80);
  uint64_t v11 = *(void *)(a1 + 72);
  int v12 = v7;
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  [WeakRetained onQueueSession:v4 didFinishDownloadTask:v5 toPath:v6 inTempPath:&v11];
  id v8 = v12;
  if (v12 && !atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
  }

  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = 0;
}

void sub_1003952D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_1000BA884((uint64_t)&a9);

  _Unwind_Resume(a1);
}

uint64_t sub_1003952E8(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 80);
  *(void *)(result + 72) = *(void *)(a2 + 72);
  *(void *)(result + 80) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_100395304(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 80);
  if (v1 && !atomic_fetch_add(&v1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
    std::__shared_weak_count::__release_weak(v1);
  }
}

void sub_1003956D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *__p,uint64_t a27,int a28,__int16 a29,char a30,char a31)
{
  if (a31 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_100395A18(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained URLSession:*(void *)(a1 + 32) task:*(void *)(a1 + 40) didCompleteWithError:*(void *)(a1 + 48)];
}

void sub_100395A6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1003960FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, char a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,char a25,uint64_t a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,char a33)
{
  sub_1000BA884((uint64_t)&a25);
  _Unwind_Resume(a1);
}

uint64_t sub_10039629C(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (!v4)
  {
    id v4 = +[NSDate date];
  }
  uint64_t v5 = [v3 lastRelevant];
  [v4 timeIntervalSinceDate:v5];
  double v7 = v6;

  if (v7 < 0.0 && [v3 context] != (id)1)
  {
    if (qword_10047BEF8 != -1) {
      dispatch_once(&qword_10047BEF8, &stru_10046B930);
    }
    id v8 = (id)qword_10047BF00;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v11 = [v3 venueUuid];
      int v13 = 136380931;
      id v14 = [v11 UTF8String];
      __int16 v15 = 2050;
      double v16 = v7 / 3600.0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "TileRelevant, %{private}s, future, %{public}f, ignoring, #Warning", (uint8_t *)&v13, 0x16u);
    }
    goto LABEL_15;
  }
  if (v7 >= 540000.0)
  {
    if (qword_10047BEF8 != -1) {
      dispatch_once(&qword_10047BEF8, &stru_10046B930);
    }
    id v8 = (id)qword_10047BF00;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = [v3 venueUuid];
      int v13 = 136380931;
      id v14 = [v9 UTF8String];
      __int16 v15 = 2050;
      double v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "TileRelevant, %{private}s, tooOld, %{public}f, ignoring, #Warning", (uint8_t *)&v13, 0x16u);
    }
LABEL_15:

    uint64_t v10 = 0;
    goto LABEL_16;
  }
  uint64_t v10 = 1;
LABEL_16:

  return v10;
}

void sub_1003964E8(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_100396524(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10039653C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10039654C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100396560(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100396578(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10039677C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  _Block_object_dispose(&a19, 8);

  _Unwind_Resume(a1);
}

void sub_1003967A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1003967B8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained onQueueSessionDidCompleteTask:*(void *)(a1 + 32) withError:*(void *)(a1 + 40)];

  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

void sub_100396810(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100396E88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28,void *a29,uint64_t a30,int a31,__int16 a32,char a33,char a34,char a35)
{
  if (a28 < 0) {
    operator delete(__p);
  }
  if (a34 < 0) {
    operator delete(a29);
  }

  sub_100091F70((uint64_t)&a35);
  _Unwind_Resume(a1);
}

void sub_100397178(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100397400(id a1)
{
  os_log_t v1 = os_log_create("com.apple.locationd.Pipeline", "Daemon");
  uint64_t v2 = (void *)qword_10047BF00;
  qword_10047BF00 = (uint64_t)v1;
}

void sub_100397444(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_10046B960;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_100397464(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_10046B960;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

uint64_t sub_1003974B8(uint64_t a1)
{
  return sub_100373950(a1 + 24);
}

void sub_10039753C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, const char *a5, const char *a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_signpost_emit_with_name_impl(a1, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, a5, a6, &a9, 0x26u);
}

void sub_100397568(void *a1, NSObject *a2, uint64_t a3, uint64_t a4, const char *a5, const char *a6, uint8_t *a7)
{
  _os_signpost_emit_with_name_impl(a1, a2, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, a5, a6, a7, 0x30u);
}

BOOL sub_10039758C(NSObject *a1)
{
  *os_log_t v1 = a1;
  return os_log_type_enabled(a1, OS_LOG_TYPE_INFO);
}

void sub_1003975A8()
{
  if ((byte_10047BF40 & 1) == 0)
  {
    byte_10047BF40 = 1;
    sub_1000A6120(qword_10047BF30);
    __cxa_atexit((void (*)(void *))sub_1000A6488, qword_10047BF30, (void *)&_mh_execute_header);
  }
}

void sub_100397620()
{
  if ((byte_10047BF58 & 1) == 0)
  {
    byte_10047BF58 = 1;
    sub_1000A6530(qword_10047BF48);
    __cxa_atexit((void (*)(void *))sub_1000A6488, qword_10047BF48, (void *)&_mh_execute_header);
  }
}

void sub_100397698()
{
}

id sub_1003976C0()
{
  if (qword_10047BEF8 == -1)
  {
    uint64_t v0 = (void *)qword_10047BF00;
  }
  else
  {
    dispatch_once(&qword_10047BEF8, &stru_10046BB50);
    uint64_t v0 = (void *)qword_10047BF00;
  }
  return v0;
}

void sub_100397860(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10039787C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100397D78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1003981A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  objc_destroyWeak(v19);
  objc_destroyWeak((id *)(v21 - 136));

  _Unwind_Resume(a1);
}

void sub_1003982F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10039830C(uint64_t a1)
{
  id WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained) {
    goto LABEL_38;
  }
  sub_100398DC8((uint64_t)v13);
  if (WeakRetained[8]) {
    BOOL v2 = v13[0] == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    int v3 = (WeakRetained[8] != 0) ^ (v13[0] != 0);
    if (!v13[0])
    {
      if (!v3) {
        goto LABEL_38;
      }
      goto LABEL_34;
    }
    if ((v15 & 0x80) != 0) {
      goto LABEL_33;
    }
  }
  else
  {
    uint64_t v4 = WeakRetained[39];
    if ((v4 & 0x80u) == 0) {
      uint64_t v5 = (void *)WeakRetained[39];
    }
    else {
      uint64_t v5 = (void *)*((void *)WeakRetained + 3);
    }
    unint64_t v6 = v15;
    unsigned __int8 v7 = v15;
    if ((v15 & 0x80u) != 0) {
      unint64_t v6 = (unint64_t)__p[1];
    }
    if (v5 == (void *)v6)
    {
      id v8 = (const void **)(WeakRetained + 16);
      if ((v15 & 0x80u) == 0) {
        id v9 = __p;
      }
      else {
        id v9 = (void **)__p[0];
      }
      if ((v4 & 0x80) != 0)
      {
        LOBYTE(v3) = memcmp(*v8, v9, *((void *)WeakRetained + 3)) != 0;
        if ((v7 & 0x80) != 0) {
          goto LABEL_33;
        }
      }
      else if (WeakRetained[39])
      {
        while (*(unsigned __int8 *)v8 == *(unsigned __int8 *)v9)
        {
          id v8 = (const void **)((char *)v8 + 1);
          id v9 = (void **)((char *)v9 + 1);
          if (!--v4) {
            goto LABEL_24;
          }
        }
        LOBYTE(v3) = 1;
        if ((v15 & 0x80) != 0)
        {
LABEL_33:
          operator delete(__p[0]);
          if ((v3 & 1) == 0) {
            goto LABEL_38;
          }
          goto LABEL_34;
        }
      }
      else
      {
LABEL_24:
        LOBYTE(v3) = 0;
        if ((v15 & 0x80) != 0) {
          goto LABEL_33;
        }
      }
    }
    else
    {
      LOBYTE(v3) = 1;
      if ((v15 & 0x80) != 0) {
        goto LABEL_33;
      }
    }
  }
  if ((v3 & 1) == 0) {
    goto LABEL_38;
  }
LABEL_34:
  uint64_t v10 = (void *)*((void *)WeakRetained + 15);
  *((void *)WeakRetained + 15) = 0;

  id v11 = (std::__shared_weak_count *)*((void *)WeakRetained + 6);
  *((void *)WeakRetained + 5) = 0;
  *((void *)WeakRetained + 6) = 0;
  if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
    std::__shared_weak_count::__release_weak(v11);
  }
  [WeakRetained _setWorkingdir:*(void *)(a1 + 40) WeakRetained];
LABEL_38:
}

void sub_100398500(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  _Unwind_Resume(a1);
}

void sub_100398514(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  _Unwind_Resume(a1);
}

id sub_100398528(uint64_t a1, uint64_t a2)
{
  objc_copyWeak((id *)(a1 + 32), (id *)(a2 + 32));
  id result = *(id *)(a2 + 40);
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_100398564(uint64_t a1)
{
  os_log_t v1 = (id *)(a1 + 32);

  objc_destroyWeak(v1);
}

void sub_100398784(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  int v3 = [WeakRetained transactionManager];
  [v3 openTransactionWithDescription:@"prefetch importing on keybag unlock"];

  id v5 = objc_loadWeakRetained(WeakRetained + 16);
  unint64_t v6 = v5;
  if (!v5) {
    goto LABEL_15;
  }
  [v5 fsDb];
  if (v18 && !atomic_fetch_add(&v18->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
    std::__shared_weak_count::__release_weak(v18);
    if (*(void *)buf) {
      goto LABEL_15;
    }
  }
  else if (*(void *)buf)
  {
    goto LABEL_15;
  }
  if (qword_10047BEF8 == -1)
  {
    unsigned __int8 v7 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  dispatch_once(&qword_10047BEF8, &stru_10046BB50);
  unsigned __int8 v7 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
  {
LABEL_7:
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "There's an active provider that needs the DB that became available", buf, 2u);
  }
LABEL_8:
  if ([WeakRetained initializeDb])
  {
    id v8 = (std::__shared_weak_count *)WeakRetained[6];
    id v15 = WeakRetained[5];
    double v16 = v8;
    if (v8) {
      atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    [v6 setFsDb:&v15];
    id v9 = v16;
    if (v16 && !atomic_fetch_add(&v16->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
LABEL_15:

  uint64_t v10 = [WeakRetained transactionManager];
  unsigned int v11 = [v10 isLastOpenTransactionWithDescription:@"prefetch importing on keybag unlock"];

  if (v11)
  {
    [*(id *)(a1 + 32) releaseObjectsNotNeededForLocalization];
    goto LABEL_20;
  }
  if (qword_10047BEF8 == -1)
  {
    int v12 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  dispatch_once(&qword_10047BEF8, &stru_10046BB50);
  int v12 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
  {
LABEL_19:
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Deferring destruction of FilesystemDB objects and prefetcher since we're still active", buf, 2u);
  }
LABEL_20:
  if (qword_10047BEF8 != -1)
  {
    dispatch_once(&qword_10047BEF8, &stru_10046BB50);
    int v13 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  int v13 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
  {
LABEL_22:
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Releasing the Keybag Unlocked transaction", buf, 2u);
  }
LABEL_23:
  id v14 = [WeakRetained transactionManager];
  [v14 closeTransactionWithDescription:@"prefetch importing on keybag unlock"];
}

void sub_100398AA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_1000BA884((uint64_t)&a9);

  _Unwind_Resume(a1);
}

void sub_100398AD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100398D54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a16)
  {
    if (a22 < 0) {
      operator delete(__p);
    }
  }

  _Unwind_Resume(a1);
}

void sub_100398DC8(uint64_t a1)
{
  BOOL v2 = sub_100163910();
  sub_1000776C8((uint64_t)v2);
  int data = (int)v8.__r_.__value_.__l.__data_;
  sub_100077BC8((uint64_t)&v8);
  if (data == data >> 31)
  {
    *(unsigned char *)a1 = 0;
  }
  else
  {
    v7[0] = sub_100163910();
    v7[1] = v4;
    char v6 = 0;
    LOBYTE(__p) = 0;
    sub_10001D078((uint64_t)v7, (uint64_t)&__p, &v8);
    *(std::string *)(a1 + 8) = v8;
    memset(&v8, 0, sizeof(v8));
    *(unsigned char *)a1 = 1;
    if (v6 < 0) {
      operator delete(__p);
    }
  }
}

void sub_100398E94(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, long long __p, uint64_t a11, uint64_t a12, uint64_t a13, long long __dst, uint64_t a15)
{
  if (a2)
  {
    __cxa_begin_catch(exception_object);
    if (SHIBYTE(a11) < 0)
    {
      sub_1000559FC(&__dst, (void *)__p, *((unint64_t *)&__p + 1));
    }
    else
    {
      __dst = __p;
      a15 = a11;
    }
    __cxa_end_catch();
    JUMPOUT(0x100398E38);
  }
  _Unwind_Resume(exception_object);
}

void sub_100399174(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100399338(uint64_t a1)
{
  id WeakRetained = (void **)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = [WeakRetained transactionManager];
  [v4 openTransactionWithDescription:@"vacuumDBs"];

  if (qword_10047BEF8 == -1)
  {
    id v5 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&qword_10047BEF8, &stru_10046BB50);
  id v5 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    LOWORD(v17) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Processing request to vacuum databases", (uint8_t *)&v17, 2u);
  }
LABEL_4:
  if ([WeakRetained initializeDb])
  {
    if (qword_10047BEF8 == -1)
    {
      int v13 = (id)qword_10047BF00;
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
LABEL_12:

        (*(void (**)(void *))(*WeakRetained[5] + 104))(WeakRetained[5]);
        goto LABEL_17;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046BB50);
      int v13 = (id)qword_10047BF00;
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
        goto LABEL_12;
      }
    }
    uint64_t v6 = (*(uint64_t (**)(void *))(*WeakRetained[5] + 232))(WeakRetained[5]);
    if (*(char *)(v6 + 23) >= 0) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = *(void *)v6;
    }
    int v17 = 136380675;
    uint64_t v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Vacuuming database at %{private}s", (uint8_t *)&v17, 0xCu);
    goto LABEL_12;
  }
  if (qword_10047BEF8 == -1)
  {
    id v15 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  dispatch_once(&qword_10047BEF8, &stru_10046BB50);
  id v15 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR))
  {
LABEL_16:
    LOWORD(v17) = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "No DB handles could be obtained to process db vacuuming request.", (uint8_t *)&v17, 2u);
  }
LABEL_17:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  std::string v8 = [WeakRetained transactionManager];
  unsigned int v9 = [v8 isLastOpenTransactionWithDescription:@"vacuumDBs"];

  if (v9)
  {
    [WeakRetained releaseObjectsNotNeededForLocalization];
    goto LABEL_22;
  }
  if (qword_10047BEF8 == -1)
  {
    uint64_t v10 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  dispatch_once(&qword_10047BEF8, &stru_10046BB50);
  uint64_t v10 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
  {
LABEL_21:
    LOWORD(v17) = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Deferring destruction of FilesystemDB objects and prefetcher since we're still active", (uint8_t *)&v17, 2u);
  }
LABEL_22:
  if (qword_10047BEF8 != -1)
  {
    dispatch_once(&qword_10047BEF8, &stru_10046BB50);
    unsigned int v11 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  unsigned int v11 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
  {
LABEL_24:
    LOWORD(v17) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Releasing the VacuumDBs transaction", (uint8_t *)&v17, 2u);
  }
LABEL_25:
  int v12 = [WeakRetained transactionManager];
  [v12 closeTransactionWithDescription:@"vacuumDBs"];
}

void sub_10039971C(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *__p)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }

  __cxa_begin_catch(a1);
  if (*(void *)(v11 + 3832) == -1)
  {
    id v14 = *(id *)(v12 + 3840);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_4;
    }
  }
  else
  {
    dispatch_once(&qword_10047BEF8, &stru_10046BB50);
    id v14 = *(id *)(v12 + 3840);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
LABEL_4:
      (*(void (**)(void))(**(void **)(v9 + 40) + 232))(*(void *)(v9 + 40));
      sub_10018E4B4((int)&__p);
    }
  }

  __cxa_end_catch();
  JUMPOUT(0x1003994FCLL);
}

void sub_1003999F8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  int v3 = [WeakRetained transactionManager];
  [v3 openTransactionWithDescription:@"clearTiles"];

  if (qword_10047BEF8 == -1)
  {
    id v5 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&qword_10047BEF8, &stru_10046BB50);
  id v5 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Processing request to clear tiles", buf, 2u);
  }
LABEL_4:
  [WeakRetained onQueueClearTiles:*(void *)(a1 + 32)];
  uint64_t v6 = [WeakRetained transactionManager];
  unsigned int v7 = [v6 isLastOpenTransactionWithDescription:@"clearTiles"];

  if (v7)
  {
    [*(id *)(a1 + 40) releaseObjectsNotNeededForLocalization];
    goto LABEL_9;
  }
  if (qword_10047BEF8 == -1)
  {
    std::string v8 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  dispatch_once(&qword_10047BEF8, &stru_10046BB50);
  std::string v8 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
  {
LABEL_8:
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Deferring destruction of FilesystemDB objects and prefetcher since we're still active", v12, 2u);
  }
LABEL_9:
  if (qword_10047BEF8 != -1)
  {
    dispatch_once(&qword_10047BEF8, &stru_10046BB50);
    uint64_t v9 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  uint64_t v9 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
  {
LABEL_11:
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Releasing the ClearTiles transaction", v11, 2u);
  }
LABEL_12:
  uint64_t v10 = [WeakRetained transactionManager];
  [v10 closeTransactionWithDescription:@"clearTiles"];
}

void sub_100399C34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100399C50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100399D88(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v2 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_9;
  }
  if (*((void *)WeakRetained + 18))
  {
    if (qword_10047BEF8 == -1)
    {
      int v3 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
      {
LABEL_6:
        uint64_t v4 = [v2 prefetcher];
        [v4 invalidate];

        [v2 setPrefetcher:0];
        goto LABEL_7;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046BB50);
      int v3 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
        goto LABEL_6;
      }
    }
    *(_WORD *)std::string v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Invalidating the prefetcher", v8, 2u);
    goto LABEL_6;
  }
LABEL_7:
  id v5 = [v2 transactionManager];
  unsigned int v6 = [v5 hasOpenTransactionWithDescription:@"Prefetching"];

  if (v6)
  {
    unsigned int v7 = [v2 transactionManager];
    [v7 closeTransactionWithDescription:@"Prefetching"];
  }
LABEL_9:
}

void sub_100399EBC(_Unwind_Exception *a1)
{
  int v3 = v2;

  _Unwind_Resume(a1);
}

void sub_100399EDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100399EEC(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_10039A050(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v3 - 56));

  _Unwind_Resume(a1);
}

void sub_10039A06C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained onQueuePrefetch:*(void *)(a1 + 32) callback:*(void *)(a1 + 40) when:*(unsigned __int8 *)(a1 + 56)];
}

void sub_10039A0C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10039A7CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,void *a41)
{
  _Unwind_Resume(a1);
}

id sub_10039A850(unsigned int *a1)
{
  v15[0] = @"numIncoming";
  id v14 = +[NSNumber numberWithInt:a1[8]];
  v16[0] = v14;
  v15[1] = @"numQueued";
  int v13 = +[NSNumber numberWithInt:a1[9]];
  v16[1] = v13;
  v15[2] = @"numAlreadyOnDisk";
  BOOL v2 = +[NSNumber numberWithInt:a1[10]];
  v16[2] = v2;
  v15[3] = @"numLowPriority";
  uint64_t v3 = +[NSNumber numberWithInt:a1[11]];
  v16[3] = v3;
  v15[4] = @"numEvictLow";
  uint64_t v4 = +[NSNumber numberWithInt:a1[12]];
  v16[4] = v4;
  v15[5] = @"numEvictOff";
  id v5 = +[NSNumber numberWithInt:a1[13]];
  v16[5] = v5;
  v15[6] = @"numTilesInDb";
  unsigned int v6 = +[NSNumber numberWithInt:a1[14]];
  v16[6] = v6;
  v15[7] = @"pctRequested";
  unsigned int v7 = +[NSNumber numberWithInt:a1[17]];
  v16[7] = v7;
  v15[8] = @"pctEvicted";
  std::string v8 = +[NSNumber numberWithInt:a1[18]];
  v16[8] = v8;
  v15[9] = @"pctOnDisk";
  uint64_t v9 = +[NSNumber numberWithInt:a1[19]];
  v16[9] = v9;
  v15[10] = @"pctQueued";
  uint64_t v10 = +[NSNumber numberWithInt:a1[20]];
  v16[10] = v10;
  uint64_t v11 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:11];

  return v11;
}

void sub_10039AAC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

id sub_10039AB58(unsigned int *a1)
{
  v7[0] = @"numEvicted";
  BOOL v2 = +[NSNumber numberWithInt:a1[8]];
  v8[0] = v2;
  v7[1] = @"numUntouched";
  uint64_t v3 = +[NSNumber numberWithInt:a1[17]];
  v8[1] = v3;
  void v7[2] = @"pctUntouched";
  uint64_t v4 = +[NSNumber numberWithInt:a1[18]];
  void v7[3] = @"trigger";
  v8[2] = v4;
  void v8[3] = @"prefetch";
  id v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:4];

  return v5;
}

void sub_10039AC78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void **sub_10039ACA8(void **a1)
{
  BOOL v2 = (void **)*a1;
  if (*a1)
  {
    uint64_t v3 = (void **)a1[1];
    uint64_t v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        if (*((char *)v3 - 9) < 0) {
          operator delete(*(v3 - 4));
        }
        v3 -= 4;
      }
      while (v3 != v2);
      uint64_t v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

void sub_10039B36C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19)
{
  _Unwind_Resume(a1);
}

void sub_10039B98C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28,void *a29,uint64_t a30,int a31,__int16 a32,char a33,char a34)
{
  if (a21 < 0)
  {
    operator delete(a16);
    if ((a28 & 0x80000000) == 0)
    {
LABEL_4:
      if (a34 < 0) {
        operator delete(a29);
      }

      _Unwind_Resume(a1);
    }
  }
  else if ((a28 & 0x80000000) == 0)
  {
    goto LABEL_4;
  }
  operator delete(__p);
  goto LABEL_4;
}

void sub_10039BD68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10039BD78(void *a1)
{
  os_log_t v1 = (std::__shared_weak_count *)a1[1];
  *a1 = 0;
  a1[1] = 0;
  if (v1 && !atomic_fetch_add(&v1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
    std::__shared_weak_count::__release_weak(v1);
  }
}

void sub_10039BF6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = v11;

  _Unwind_Resume(a1);
}

void sub_10039BF8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10039BFA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void *sub_10039BFC0(void *a1)
{
  BOOL v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
    return a1;
  }
  else
  {
    if (v2) {
      (*(void (**)(void *))(*v2 + 40))(v2);
    }
    return a1;
  }
}

void sub_10039C1C0(_Unwind_Exception *a1)
{
  sub_1000D8DD8(v1);
  _Unwind_Resume(a1);
}

void sub_10039C1D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10039C570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  unsigned int v7 = v6;

  sub_1000D8DD8((void **)va);
  _Unwind_Resume(a1);
}

void sub_10039CF70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,void *__p,uint64_t a39,int a40,__int16 a41,char a42,char a43)
{
  if (a43 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void *sub_10039D048(void *a1)
{
  BOOL v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
    return a1;
  }
  else
  {
    if (v2) {
      (*(void (**)(void *))(*v2 + 40))(v2);
    }
    return a1;
  }
}

id sub_10039D0D8(uint64_t a1)
{
  v9[0] = @"numEvicted";
  BOOL v2 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  v10[0] = v2;
  v9[1] = @"numUntouched";
  uint64_t v3 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
  v10[1] = v3;
  v9[2] = @"pctUntouched";
  uint64_t v4 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  v10[2] = v4;
  v9[3] = @"trigger";
  id v5 = (void *)(a1 + 32);
  if (*(char *)(a1 + 55) < 0) {
    id v5 = (void *)*v5;
  }
  unsigned int v6 = +[NSString stringWithUTF8String:v5];
  v10[3] = v6;
  unsigned int v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:4];

  return v7;
}

void sub_10039D224(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *sub_10039D260(uint64_t a1, uint64_t a2)
{
  id result = (void *)(a1 + 32);
  if (*(char *)(a2 + 55) < 0) {
    return sub_1000559FC(result, *(void **)(a2 + 32), *(void *)(a2 + 40));
  }
  long long v3 = *(_OWORD *)(a2 + 32);
  result[2] = *(void *)(a2 + 48);
  *(_OWORD *)id result = v3;
  return result;
}

void sub_10039D290(uint64_t a1)
{
  if (*(char *)(a1 + 55) < 0) {
    operator delete(*(void **)(a1 + 32));
  }
}

void sub_10039D62C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  sub_1000D8DD8(&a9);

  _Unwind_Resume(a1);
}

id sub_10039D6E8(uint64_t a1)
{
  return [*(id *)(a1 + 32) onQueueShutdown];
}

void sub_10039D740(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10039D8B0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v3 = [WeakRetained transactionManager];
  [v3 openTransactionWithDescription:@"getNumFloors"];

  if (qword_10047BEF8 == -1)
  {
    uint64_t v4 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&qword_10047BEF8, &stru_10046BB50);
  uint64_t v4 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Processing request to get number of floors", buf, 2u);
  }
LABEL_4:
  **(void **)(a1 + 40) = [WeakRetained onQueueNumFloors];
  id v5 = [WeakRetained transactionManager];
  unsigned int v6 = [v5 isLastOpenTransactionWithDescription:@"getNumFloors"];

  if (v6)
  {
    [WeakRetained releaseObjectsNotNeededForLocalization];
    goto LABEL_9;
  }
  if (qword_10047BEF8 == -1)
  {
    unsigned int v7 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  dispatch_once(&qword_10047BEF8, &stru_10046BB50);
  unsigned int v7 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
  {
LABEL_8:
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Deferring destruction of FilesystemDB objects and prefetcher since we're still active", v11, 2u);
  }
LABEL_9:
  if (qword_10047BEF8 != -1)
  {
    dispatch_once(&qword_10047BEF8, &stru_10046BB50);
    std::string v8 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  std::string v8 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
  {
LABEL_11:
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Releasing getNumFloors transaction", v10, 2u);
  }
LABEL_12:
  uint64_t v9 = [WeakRetained transactionManager];
  [v9 closeTransactionWithDescription:@"getNumFloors"];
}

void sub_10039DAE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10039DB10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10039DB20(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
}

void sub_10039DB58(uint64_t a1)
{
}

void sub_10039DC04(id *a1)
{
  if (qword_10047BEF8 == -1)
  {
    long long v3 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&qword_10047BEF8, &stru_10046BB50);
  long long v3 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Connection invalidated", buf, 2u);
  }
LABEL_4:
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  if (!WeakRetained)
  {
    if (qword_10047BEF8 == -1)
    {
      uint64_t v11 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
      {
LABEL_16:
        return;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046BB50);
      uint64_t v11 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
        goto LABEL_16;
      }
    }
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "No connection so nothing to do", buf, 2u);
    goto LABEL_16;
  }
  id v5 = WeakRetained;
  unsigned int v6 = [WeakRetained exportedObject];
  unsigned int v7 = v6;
  if (!v6)
  {
    if (qword_10047BEF8 == -1)
    {
      uint64_t v12 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
      {
LABEL_15:

        goto LABEL_16;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046BB50);
      uint64_t v12 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
        goto LABEL_15;
      }
    }
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "No provider so nothing to invalidate", buf, 2u);
    goto LABEL_15;
  }
  [v6 onConnectionQueueShutdown];

  [v5 setExportedObject:0];
  id v8 = objc_loadWeakRetained(a1 + 6);
  uint64_t v10 = [v8 delayedClearTilesPolicy];

  if (v10)
  {
    if (v8)
    {
      [v8 onQueueDbsToClear];
    }
    else
    {
      *(void *)buf = 0;
      uint64_t v30 = 0;
      uint64_t v31 = 0;
    }
    int v13 = [v8 delayedClearTilesPolicy];
    sub_10039EA44(&__p, (uint64_t *)buf);
    [v8 onQueueClearTiles:v13 fromDbs:&__p];
    id v14 = (char *)__p;
    if (__p)
    {
      id v15 = v28;
      double v16 = __p;
      if (v28 != __p)
      {
        do
        {
          int v17 = (std::__shared_weak_count *)*((void *)v15 - 1);
          if (v17 && !atomic_fetch_add(&v17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
            std::__shared_weak_count::__release_weak(v17);
          }
          v15 -= 16;
        }
        while (v15 != v14);
        double v16 = __p;
      }
      long long v28 = v14;
      operator delete(v16);
    }

    uint64_t v18 = *(char **)buf;
    if (*(void *)buf)
    {
      long long v19 = v30;
      id v20 = *(char **)buf;
      if (v30 != *(char **)buf)
      {
        do
        {
          uint64_t v21 = (std::__shared_weak_count *)*((void *)v19 - 1);
          if (v21)
          {
            if (!atomic_fetch_add(&v21->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
              std::__shared_weak_count::__release_weak(v21);
            }
          }
          v19 -= 16;
        }
        while (v19 != v18);
        id v20 = *(char **)buf;
      }
      uint64_t v30 = v18;
      operator delete(v20);
    }
  }
  uint64_t v22 = [v8 transactionManager];
  unsigned int v23 = [v22 isLastOpenTransactionWithDescription:@"start indoor provider"];

  if (v23)
  {
    [a1[4] releaseObjectsNotNeededForLocalization];
    goto LABEL_41;
  }
  if (qword_10047BEF8 == -1)
  {
    long long v24 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_41;
    }
    goto LABEL_40;
  }
  dispatch_once(&qword_10047BEF8, &stru_10046BB50);
  long long v24 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
  {
LABEL_40:
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Deferring destruction of FilesystemDB objects and prefetcher since we're still active", buf, 2u);
  }
LABEL_41:
  if (qword_10047BEF8 != -1)
  {
    dispatch_once(&qword_10047BEF8, &stru_10046BB50);
    id v25 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_44;
    }
    goto LABEL_43;
  }
  id v25 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
  {
LABEL_43:
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Releasing the indoor provider transaction", buf, 2u);
  }
LABEL_44:
  long long v26 = [v8 transactionManager];
  [v26 closeTransactionWithDescription:@"start indoor provider"];
}

void sub_10039E0D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10039E0E8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  id v5 = va_arg(va1, void *);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  sub_1000D8DD8((void **)va);

  sub_1000D8DD8((void **)va1);
  _Unwind_Resume(a1);
}

void sub_10039E11C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10039E134(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10039E144(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10039E158(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10039E334(id a1)
{
  os_log_t v1 = os_log_create("com.apple.locationd.Pipeline", "Daemon");
  BOOL v2 = (void *)qword_10047BF00;
  qword_10047BF00 = (uint64_t)v1;
}

void sub_10039E378(id a1)
{
  os_log_t v1 = os_log_create("com.apple.locationd.Pipeline", "Database");
  BOOL v2 = (void *)qword_10047BF10;
  qword_10047BF10 = (uint64_t)v1;
}

char *sub_10039E3BC(void **a1, const char **a2, _DWORD *a3)
{
  uint64_t v4 = ((unsigned char *)a1[1] - (unsigned char *)*a1) >> 5;
  unint64_t v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) >> 59) {
    sub_1000A9108();
  }
  uint64_t v8 = (unsigned char *)a1[2] - (unsigned char *)*a1;
  if (v8 >> 4 > v5) {
    unint64_t v5 = v8 >> 4;
  }
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFE0) {
    unint64_t v9 = 0x7FFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v9 = v5;
  }
  if (v9)
  {
    if (v9 >> 59) {
      sub_1000A6A10();
    }
    uint64_t v10 = operator new(32 * v9);
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v11 = &v10[8 * v4];
  id v25 = v11;
  long long v27 = (char *)&v10[8 * v9];
  uint64_t v12 = *a2;
  size_t v13 = strlen(*a2);
  if (v13 >= 0x7FFFFFFFFFFFFFF8) {
    sub_1000A6968();
  }
  size_t v14 = v13;
  if (v13 >= 0x17)
  {
    uint64_t v15 = (v13 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v13 | 7) != 0x17) {
      uint64_t v15 = v13 | 7;
    }
    uint64_t v16 = v15 + 1;
    int v17 = operator new(v15 + 1);
    v11[1] = v14;
    v11[2] = v16 | 0x8000000000000000;
    *uint64_t v11 = v17;
    uint64_t v11 = v17;
    goto LABEL_18;
  }
  *((unsigned char *)v11 + 23) = v13;
  if (v13) {
LABEL_18:
  }
    memmove(v11, v12, v14);
  *((unsigned char *)v11 + v14) = 0;
  v10[8 * v4 + 6] = *a3;
  uint64_t v18 = (char *)&v10[8 * v4];
  long long v26 = v18;
  long long v19 = v18 + 32;
  id v20 = (char *)*a1;
  uint64_t v21 = (char *)a1[1];
  if (v21 == *a1)
  {
    *a1 = v25;
    a1[1] = v19;
    a1[2] = v27;
  }
  else
  {
    do
    {
      long long v22 = *((_OWORD *)v21 - 2);
      *((void *)v18 - 2) = *((void *)v21 - 2);
      *((_OWORD *)v18 - 2) = v22;
      *((void *)v21 - 3) = 0;
      *((void *)v21 - 2) = 0;
      *((void *)v21 - 4) = 0;
      *((_DWORD *)v18 - 2) = *((_DWORD *)v21 - 2);
      v18 -= 32;
      v21 -= 32;
    }
    while (v21 != v20);
    unsigned int v23 = (char *)*a1;
    uint64_t v21 = (char *)a1[1];
    *a1 = v18;
    a1[1] = v19;
    a1[2] = v27;
    if (v21 != v23)
    {
      do
      {
        if (*(v21 - 9) < 0) {
          operator delete(*((void **)v21 - 4));
        }
        v21 -= 32;
      }
      while (v21 != v23);
      uint64_t v21 = v23;
    }
  }
  if (v21) {
    operator delete(v21);
  }
  return v26 + 32;
}

void sub_10039E5C4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_10039E5D8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_10039E5D8(uint64_t a1)
{
  long long v3 = *(void ***)(a1 + 8);
  BOOL v2 = *(void ***)(a1 + 16);
  if (v2 != v3)
  {
    do
    {
      unint64_t v5 = v2 - 4;
      *(void *)(a1 + 16) = v2 - 4;
      if (*((char *)v2 - 9) < 0)
      {
        operator delete(*v5);
        unint64_t v5 = *(void ***)(a1 + 16);
      }
      BOOL v2 = v5;
    }
    while (v5 != v3);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_10039E644()
{
}

__n128 sub_10039E658(uint64_t a1)
{
  BOOL v2 = (char *)operator new(0x28uLL);
  *(void *)BOOL v2 = off_10046BBA0;
  *(_OWORD *)(v2 + 8) = *(_OWORD *)(a1 + 8);
  __n128 result = *(__n128 *)(a1 + 24);
  *(__n128 *)(v2 + 24) = result;
  return result;
}

__n128 sub_10039E6AC(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = off_10046BBA0;
  __n128 result = *(__n128 *)(a1 + 8);
  *(_OWORD *)(a2 + 24) = *(_OWORD *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_10039E6E0(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "Z40-[CLIndoorServiceDelegate initializeDb:]E3$_1") {
    return a1 + 8;
  }
  if (((v3 & (unint64_t)"Z40-[CLIndoorServiceDelegate initializeDb:]E3$_1" & 0x8000000000000000) != 0) == __OFSUB__(v3, "Z40-[CLIndoorServiceDelegate initializeDb:]E3$_1")) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"Z40-[CLIndoorServiceDelegate initializeDb:]E3$_1" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8; {
  return 0;
  }
}

_UNKNOWN **sub_10039E750()
{
  return &off_10046BC10;
}

void sub_10039E75C(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_10046BC30;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_10039E77C(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_10046BC30;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

uint64_t sub_10039E7D0(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void sub_10039E7FC()
{
}

__n128 sub_10039E810(uint64_t a1)
{
  BOOL v2 = (char *)operator new(0x28uLL);
  *(void *)BOOL v2 = off_10046BC80;
  *(_OWORD *)(v2 + 8) = *(_OWORD *)(a1 + 8);
  __n128 result = *(__n128 *)(a1 + 24);
  *(__n128 *)(v2 + 24) = result;
  return result;
}

__n128 sub_10039E864(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = off_10046BC80;
  __n128 result = *(__n128 *)(a1 + 8);
  *(_OWORD *)(a2 + 24) = *(_OWORD *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

BOOL sub_10039E89C(uint64_t a1, uint64_t *a2, unsigned __int8 *a3, unsigned __int8 *a4)
{
  int v5 = *a3;
  int v6 = *a4;
  if (![**(id **)(a1 + 8) tileLastModified:(double)*a2 - kCFAbsoluteTimeIntervalSince1970 needsEvictionAt:**(double **)(a1 + 16)])return 1; {
  if (v6 == 82)
  }
  {
    ++**(_DWORD **)(a1 + 24);
    if (v5) {
      ++**(_DWORD **)(a1 + 32);
    }
  }
  if (qword_10047BEF8 == -1)
  {
    uint64_t v7 = qword_10047BF00;
    BOOL result = os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO);
    if (!result) {
      return result;
    }
  }
  else
  {
    dispatch_once(&qword_10047BEF8, &stru_10046BB50);
    uint64_t v7 = qword_10047BF00;
    BOOL result = os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO);
    if (!result) {
      return result;
    }
  }
  *(_WORD *)unint64_t v9 = 0;
  _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Requesting tile eviction of a venue", v9, 2u);
  return 0;
}

uint64_t sub_10039E9C8(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "Z53-[CLIndoorServiceDelegate onQueueClearTiles:fromDbs:]E3$_2") {
    return a1 + 8;
  }
  if (((v3 & (unint64_t)"Z53-[CLIndoorServiceDelegate onQueueClearTiles:fromDbs:]E3$_2" & 0x8000000000000000) != 0) == __OFSUB__(v3, "Z53-[CLIndoorServiceDelegate onQueueClearTiles:fromDbs:]E3$_2")) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"Z53-[CLIndoorServiceDelegate onQueueClearTiles:fromDbs:]E3$_2" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8; {
  return 0;
  }
}

_UNKNOWN **sub_10039EA38()
{
  return &off_10046BCF0;
}

void *sub_10039EA44(void *a1, uint64_t *a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = v4 - *a2;
  if (v4 != *a2)
  {
    if (v5 < 0) {
      sub_1000A9108();
    }
    int v6 = (char *)operator new(v4 - *a2);
    uint64_t v7 = 0;
    *a1 = v6;
    a1[1] = v6;
    a1[2] = &v6[16 * (v5 >> 4)];
    do
    {
      uint64_t v8 = v3 + v7;
      unint64_t v9 = &v6[v7];
      uint64_t v10 = *(void *)(v3 + v7 + 8);
      *(void *)unint64_t v9 = *(void *)(v3 + v7);
      *((void *)v9 + 1) = v10;
      if (v10) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v10 + 8), 1uLL, memory_order_relaxed);
      }
      v7 += 16;
    }
    while (v8 + 16 != v4);
    a1[1] = &v6[v7];
  }
  return a1;
}

void sub_10039EAF0(_Unwind_Exception *exception_object)
{
  if (*(void *)v1) {
    sub_1003A48D4((void **)(v1 + 8), *(char **)v1, (void **)v1);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_10039EB10(NSObject *a1)
{
  return os_log_type_enabled(a1, OS_LOG_TYPE_FAULT);
}

void sub_10039EB50()
{
  if ((byte_10047BF40 & 1) == 0)
  {
    byte_10047BF40 = 1;
    sub_1000A6120(qword_10047BF30);
    __cxa_atexit((void (*)(void *))sub_1000A6488, qword_10047BF30, (void *)&_mh_execute_header);
  }
}

void sub_10039EBC8()
{
  if ((byte_10047BF58 & 1) == 0)
  {
    byte_10047BF58 = 1;
    sub_1000A6530(qword_10047BF48);
    __cxa_atexit((void (*)(void *))sub_1000A6488, qword_10047BF48, (void *)&_mh_execute_header);
  }
}

void sub_10039EC40()
{
}

void sub_10039ED30(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, unint64_t a13, int a14, __int16 a15, char a16, char a17, long long __dst, uint64_t a19)
{
  __cxa_begin_catch(a1);
  if (a17 < 0)
  {
    sub_1000559FC(&__dst, a12, a13);
  }
  else
  {
    __dst = *(_OWORD *)v19;
    a19 = *(void *)(v19 + 16);
  }
  __cxa_end_catch();
  JUMPOUT(0x10039EC9CLL);
}

void sub_10039ED64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_10039EE08(id a1)
{
  uint64_t v1 = (void *)MKBUserTypeDeviceMode();
  BOOL v2 = [v1 objectForKey:kMKBDeviceModeKey];
  if ([v2 isEqualToString:kMKBDeviceModeSharedIPad]) {
    byte_10047E8D2 = 1;
  }
}

void sub_10039EF60(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_10039EFD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10039F2C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak((id *)&a9);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_10039F360(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  uint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)Keybag;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_10039F3FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10039F488(id a1)
{
  os_log_t v1 = os_log_create("com.apple.locationd.Pipeline", "Generic");
  BOOL v2 = (void *)qword_10047BEE0;
  qword_10047BEE0 = (uint64_t)v1;
}

void sub_10039F4CC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained onQueueUpdateDelegate];
}

void sub_10039F514(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10039F528(uint64_t a1, uint64_t a2)
{
}

void sub_10039F534(uint64_t a1)
{
}

void sub_10039F53C()
{
  if ((byte_10047BF40 & 1) == 0)
  {
    byte_10047BF40 = 1;
    sub_1000A6120(qword_10047BF30);
    __cxa_atexit((void (*)(void *))sub_1000A6488, qword_10047BF30, (void *)&_mh_execute_header);
  }
}

void sub_10039F5B4()
{
  if ((byte_10047BF58 & 1) == 0)
  {
    byte_10047BF58 = 1;
    sub_1000A6530(qword_10047BF48);
    __cxa_atexit((void (*)(void *))sub_1000A6488, qword_10047BF48, (void *)&_mh_execute_header);
  }
}

void sub_10039F62C()
{
}

uint64_t sub_10039F654(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 104))
  {
    if (*(char *)(a1 + 135) < 0) {
      operator delete(*(void **)(a1 + 112));
    }
    *(unsigned char *)(a1 + 104) = 0;
  }
  if (*(char *)(a1 + 103) < 0)
  {
    operator delete(*(void **)(a1 + 80));
    if ((*(char *)(a1 + 71) & 0x80000000) == 0)
    {
LABEL_7:
      if ((*(char *)(a1 + 47) & 0x80000000) == 0) {
        goto LABEL_8;
      }
LABEL_12:
      operator delete(*(void **)(a1 + 24));
      if ((*(char *)(a1 + 23) & 0x80000000) == 0) {
        return a1;
      }
      goto LABEL_13;
    }
  }
  else if ((*(char *)(a1 + 71) & 0x80000000) == 0)
  {
    goto LABEL_7;
  }
  operator delete(*(void **)(a1 + 48));
  if (*(char *)(a1 + 47) < 0) {
    goto LABEL_12;
  }
LABEL_8:
  if ((*(char *)(a1 + 23) & 0x80000000) == 0) {
    return a1;
  }
LABEL_13:
  operator delete(*(void **)a1);
  return a1;
}

void sub_10039F704(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_10046BD80;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_10039F724(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_10046BD80;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

void sub_10039F778(uint64_t a1)
{
  *(void *)a1 = off_10046BDD0;
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*(void **)(a1 + 8));
  }

  operator delete();
}

char *sub_10039F7F0@<X0>(char *result@<X0>, uint64_t a2@<X8>)
{
  if (result[31] < 0) {
    return (char *)sub_1000559FC((unsigned char *)a2, *((void **)result + 1), *((void *)result + 2));
  }
  *(_OWORD *)a2 = *(_OWORD *)(result + 8);
  *(void *)(a2 + 16) = *((void *)result + 3);
  return result;
}

void sub_10039F81C()
{
  if ((byte_10047BF40 & 1) == 0)
  {
    byte_10047BF40 = 1;
    sub_1000A6120(qword_10047BF30);
    __cxa_atexit((void (*)(void *))sub_1000A6488, qword_10047BF30, (void *)&_mh_execute_header);
  }
}

void sub_10039F894()
{
  if ((byte_10047BF58 & 1) == 0)
  {
    byte_10047BF58 = 1;
    sub_1000A6530(qword_10047BF48);
    __cxa_atexit((void (*)(void *))sub_1000A6488, qword_10047BF48, (void *)&_mh_execute_header);
  }
}

void sub_10039F90C()
{
}

uint64_t sub_10039F934(uint64_t a1, uint64_t a2, double *a3, int8x16_t a4)
{
  *(void *)a1 = a2;
  *(void *)(a1 + 8) = a4.i64[0];
  *(double *)v6.i64 = sub_10039FC28(a3);
  v7.f64[0] = NAN;
  v7.f64[1] = NAN;
  *(void *)&double v8 = vbslq_s8((int8x16_t)vnegq_f64(v7), v6, a4).u64[0];
  if (*(double *)a4.i64 == 0.0) {
    double v8 = 0.0;
  }
  *(double *)(a1 + 16) = v8;
  if (a2 < 0)
  {
    sub_1000AE4B0(__p, "");
    sub_100295088("Invalid timestamp", &v14);
    sub_10016A2C4((uint64_t)__p, (uint64_t)&v14, 1);
    if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v14.__r_.__value_.__l.__data_);
    }
    if (v13 < 0) {
      operator delete(__p[0]);
    }
    sub_10014B3FC((uint64_t)&v11);
  }
  return a1;
}

void sub_10039FA38(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a16 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_10039FA80()
{
  if ((byte_10047BF40 & 1) == 0)
  {
    byte_10047BF40 = 1;
    sub_1000A6120(qword_10047BF30);
    __cxa_atexit((void (*)(void *))sub_1000A6488, qword_10047BF30, (void *)&_mh_execute_header);
  }
}

void sub_10039FAF8()
{
  if ((byte_10047BF58 & 1) == 0)
  {
    byte_10047BF58 = 1;
    sub_1000A6530(qword_10047BF48);
    __cxa_atexit((void (*)(void *))sub_1000A6488, qword_10047BF48, (void *)&_mh_execute_header);
  }
}

double sub_10039FB70(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)(a2 + 8);
  double result = *(double *)(a2 + 24);
  *(double *)(a1 + 16) = result;
  return result;
}

float64_t sub_10039FB84(float64x2_t *a1, float64x2_t *a2)
{
  *a1 = vaddq_f64(*a2, *a1);
  float64_t result = a2[1].f64[0] + a1[1].f64[0];
  a1[1].f64[0] = result;
  return result;
}

float64_t sub_10039FBA8(float64x2_t *a1, float64x2_t *a2)
{
  *a1 = vsubq_f64(*a1, *a2);
  float64_t result = a1[1].f64[0] - a2[1].f64[0];
  a1[1].f64[0] = result;
  return result;
}

double sub_10039FBCC(double *a1, double *a2)
{
  return a1[1] * a2[1] + *a1 * *a2 + a1[2] * a2[2];
}

float64_t sub_10039FBEC(float64x2_t *a1, double a2)
{
  *a1 = vmulq_n_f64(*a1, a2);
  float64_t result = a1[1].f64[0] * a2;
  a1[1].f64[0] = result;
  return result;
}

float64_t sub_10039FC08(float64x2_t *a1, double a2)
{
  *a1 = vdivq_f64(*a1, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a2, 0));
  float64_t result = a1[1].f64[0] / a2;
  a1[1].f64[0] = result;
  return result;
}

double sub_10039FC28(double *a1)
{
  return sqrt(a1[1] * a1[1] + *a1 * *a1 + a1[2] * a1[2]);
}

double sub_10039FC44(uint64_t a1)
{
  return *(double *)(a1 + 16);
}

void sub_10039FE94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,void *a31,uint64_t a32,int a33,__int16 a34,char a35,char a36,void *a37,uint64_t a38,int a39,__int16 a40,char a41,char a42,uint64_t a43,void *a44,uint64_t a45,int a46,__int16 a47,char a48,char a49,uint64_t a50,void *a51,uint64_t a52,int a53,__int16 a54,char a55,char a56)
{
  if (__p) {
    operator delete(__p);
  }
  std::runtime_error::~runtime_error((std::runtime_error *)(v56 - 64));
  if (*(char *)(v56 - 73) < 0)
  {
    operator delete(*(void **)(v56 - 96));
    if ((*(char *)(v56 - 105) & 0x80000000) == 0)
    {
LABEL_5:
      if ((a18 & 0x80000000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_16;
    }
  }
  else if ((*(char *)(v56 - 105) & 0x80000000) == 0)
  {
    goto LABEL_5;
  }
  operator delete(*(void **)(v56 - 128));
  if ((a18 & 0x80000000) == 0)
  {
LABEL_6:
    if ((*(char *)(v56 - 137) & 0x80000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  operator delete(a13);
  if ((*(char *)(v56 - 137) & 0x80000000) == 0)
  {
LABEL_7:
    if ((a56 & 0x80000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  operator delete(*(void **)(v56 - 160));
  if ((a56 & 0x80000000) == 0)
  {
LABEL_8:
    if ((a24 & 0x80000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  operator delete(a51);
  if ((a24 & 0x80000000) == 0)
  {
LABEL_9:
    if ((a49 & 0x80000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_19:
  operator delete(a19);
  if ((a49 & 0x80000000) == 0)
  {
LABEL_10:
    if ((a42 & 0x80000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_21;
  }
LABEL_20:
  operator delete(a44);
  if ((a42 & 0x80000000) == 0)
  {
LABEL_11:
    if ((a30 & 0x80000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_22;
  }
LABEL_21:
  operator delete(a37);
  if ((a30 & 0x80000000) == 0)
  {
LABEL_12:
    if ((a36 & 0x80000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_13;
  }
LABEL_22:
  operator delete(a25);
  if ((a36 & 0x80000000) == 0) {
LABEL_23:
  }
    _Unwind_Resume(a1);
LABEL_13:
  operator delete(a31);
  goto LABEL_23;
}

void *sub_1003A0090@<X0>(char *__s@<X1>, const void **a2@<X0>, void *a3@<X8>)
{
  int v6 = *((char *)a2 + 23);
  if (v6 >= 0) {
    size_t v7 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v7 = (size_t)a2[1];
  }
  float64_t result = (void *)strlen(__s);
  unint64_t v9 = (unint64_t)result + v7;
  if ((unint64_t)result + v7 >= 0x7FFFFFFFFFFFFFF8) {
    sub_1000A6968();
  }
  size_t v10 = (size_t)result;
  if (v9 <= 0x16)
  {
    a3[1] = 0;
    a3[2] = 0;
    *a3 = 0;
    *((unsigned char *)a3 + 23) = v9;
    if (!v7) {
      goto LABEL_15;
    }
LABEL_11:
    if (v6 >= 0) {
      char v13 = a2;
    }
    else {
      char v13 = *a2;
    }
    float64_t result = memmove(a3, v13, v7);
    goto LABEL_15;
  }
  uint64_t v11 = (v9 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v9 | 7) != 0x17) {
    uint64_t v11 = v9 | 7;
  }
  uint64_t v12 = v11 + 1;
  float64_t result = operator new(v11 + 1);
  a3[1] = v9;
  a3[2] = v12 | 0x8000000000000000;
  *a3 = result;
  a3 = result;
  if (v7) {
    goto LABEL_11;
  }
LABEL_15:
  std::string v14 = (char *)a3 + v7;
  if (v10) {
    float64_t result = memmove(v14, __s, v10);
  }
  v14[v10] = 0;
  return result;
}

void sub_1003A018C()
{
  if ((byte_10047BF40 & 1) == 0)
  {
    byte_10047BF40 = 1;
    sub_1000A6120(qword_10047BF30);
    __cxa_atexit((void (*)(void *))sub_1000A6488, qword_10047BF30, (void *)&_mh_execute_header);
  }
}

void sub_1003A0204()
{
  if ((byte_10047BF58 & 1) == 0)
  {
    byte_10047BF58 = 1;
    sub_1000A6530(qword_10047BF48);
    __cxa_atexit((void (*)(void *))sub_1000A6488, qword_10047BF48, (void *)&_mh_execute_header);
  }
}

double sub_1003A027C(uint64_t a1, uint64_t a2)
{
  sub_10039FB70((uint64_t)&v4, a2);
  float64x2_t v6 = v4;
  double v7 = v5;
  sub_10039FB84(&v6, (float64x2_t *)(a1 + 24));
  double result = v7;
  *(float64x2_t *)(a1 + 48) = v6;
  *(double *)(a1 + 64) = result;
  return result;
}

void sub_1003A02D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1 + 24;
  sub_10039FB70(a1 + 24, a2);
  *(void *)__p = operator new(0x20uLL);
  *(_OWORD *)&__p[8] = xmmword_1003E74B0;
  strcpy(*(char **)__p, "Gravity cannot contain NaN");
  sub_10039FC44(v3);
  operator delete(*(void **)__p);
  double v4 = sub_10039FC28((double *)v3);
  *(_OWORD *)__p = *(_OWORD *)v3;
  *(void *)&__p[16] = *(void *)(v3 + 16);
  sub_10039FC08((float64x2_t *)__p, v4);
  uint64_t v5 = *(void *)&__p[16];
  *(_OWORD *)a1 = *(_OWORD *)__p;
  *(void *)(a1 + 16) = v5;
  *(void *)__p = operator new(0x28uLL);
  *(_OWORD *)&__p[8] = xmmword_1003E7200;
  strcpy(*(char **)__p, "Gravity cannot be zero (freefall?)");
  sub_10039FC44(a1);
  if ((__p[23] & 0x80000000) != 0) {
    operator delete(*(void **)__p);
  }
}

void sub_1003A03F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

double sub_1003A0414(double *a1)
{
  BOOL v2 = a1 + 6;
  *(double *)v3.i64 = sub_10039FC28(a1 + 6);
  int8x16_t v9 = v3;
  *(double *)v4.i64 = sub_10039FBCC(v2, a1);
  v5.f64[0] = NAN;
  v5.f64[1] = NAN;
  *(void *)&double v6 = vbslq_s8((int8x16_t)vnegq_f64(v5), v9, v4).u64[0];
  BOOL v7 = *(double *)v4.i64 == 0.0;
  double result = 0.0;
  if (!v7) {
    return v6;
  }
  return result;
}

void sub_1003A0474(uint64_t *a1, uint64_t a2, double a3)
{
  uint64_t v6 = (uint64_t)(a1 + 18);
  sub_1001A75D8((uint64_t)(a1 + 5), (uint64_t)(a1 + 18));
  a1[17] = a1[30];
  sub_1000458C4((uint64_t)v9, a2);
  double v10 = a3;
  sub_1001A75D8(v6, (uint64_t)v9);
  *((double *)a1 + 30) = v10;
  nullsub_9(v9);
  unint64_t v7 = a1[2];
  if (v7 >= a1[3])
  {
    uint64_t v8 = sub_1003A09D8(a1 + 1, v6);
  }
  else
  {
    sub_1000458C4(a1[2], v6);
    *(void *)(v7 + 96) = a1[30];
    uint64_t v8 = v7 + 104;
    a1[2] = v7 + 104;
  }
  a1[2] = v8;
  sub_1003A08AC((uint64_t)a1, 0x4EC4EC4EC4EC4EC5 * ((v8 - a1[1]) >> 3) - 1);
}

void sub_1003A0560(_Unwind_Exception *a1)
{
  *(void *)(v1 + 16) = v2;
  _Unwind_Resume(a1);
}

void sub_1003A0568(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  nullsub_9(va);
  _Unwind_Resume(a1);
}

BOOL sub_1003A057C(uint64_t a1)
{
  return *(void *)(a1 + 8) != *(void *)(a1 + 16) && *(_DWORD *)(a1 + 32) == 2;
}

float64_t sub_1003A05A0(uint64_t a1)
{
  v8.f64[0] = sub_10009D208();
  v8.f64[1] = v2;
  uint64_t v9 = v3;
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  if (v4 == v5)
  {
    uint64_t v6 = *(void *)(a1 + 8);
  }
  else
  {
    do
    {
      sub_10039FB70((uint64_t)&v10, v4);
      sub_10039FB84(&v8, &v10);
      v4 += 104;
    }
    while (v4 != v5);
    uint64_t v4 = *(void *)(a1 + 8);
    uint64_t v6 = *(void *)(a1 + 16);
  }
  sub_10039FBEC(&v8, 1.0 / (double)(unint64_t)(0x4EC4EC4EC4EC4EC5 * ((v6 - v4) >> 3)));
  return v8.f64[0];
}

double sub_1003A0660(uint64_t a1)
{
  if (*(void *)(a1 + 8) == *(void *)(a1 + 16) || *(_DWORD *)(a1 + 32) != 2) {
    return NAN;
  }
  v12[0] = sub_1003A05A0(a1);
  v12[1] = v2;
  v12[2] = v3;
  sub_10039FB70((uint64_t)&v13, *(void *)(a1 + 16) - 104);
  double v4 = sub_1003A0764(&v13, (uint64_t)v12);
  sub_10039FB70((uint64_t)&v13, *(void *)(a1 + 8));
  double v5 = sub_1003A0764(&v13, (uint64_t)v12);
  uint64_t v6 = *(void *)(*(void *)(a1 + 16) - 72);
  uint64_t v7 = *(void *)(*(void *)(a1 + 8) + 32);
  BOOL v8 = v6 < v7;
  uint64_t v9 = v6 - v7;
  if (v8) {
    ++v9;
  }
  uint64_t v10 = v9 >> 1;
  if (v4 >= v5) {
    double v5 = v4;
  }
  return v5 / ((double)v10 / 1000000000.0);
}

long double sub_1003A0764(float64x2_t *a1, uint64_t a2)
{
  float64x2_t v8 = *(float64x2_t *)a2;
  uint64_t v9 = *(void *)(a2 + 16);
  sub_10039FBA8(&v8, a1);
  double v4 = sub_10039FC28(v8.f64);
  float64x2_t v8 = *(float64x2_t *)a2;
  uint64_t v9 = *(void *)(a2 + 16);
  sub_10039FB84(&v8, a1);
  sub_10039FBEC(&v8, 0.5);
  double v5 = sub_10039FC28(v8.f64);
  if (v5 < v4) {
    return 3.14159265;
  }
  long double v7 = asin(v4 / v5);
  return v7 + v7;
}

void **sub_1003A0850(void **a1)
{
  uint64_t v2 = *a1;
  if (*a1)
  {
    uint64_t v3 = (uint64_t)a1[1];
    double v4 = v2;
    if ((void *)v3 != v2)
    {
      do
        uint64_t v3 = nullsub_9(v3 - 104);
      while ((void *)v3 != v2);
      double v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

void sub_1003A08AC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16) - v2;
  if (v3 == 104)
  {
    *(_DWORD *)(a1 + 32) = 1;
  }
  else
  {
    uint64_t v4 = v3 / 104;
    if (v3 / 104 <= a2)
    {
      unint64_t v5 = 0;
    }
    else
    {
      unint64_t v5 = 0;
      do
      {
        if (v5 != a2)
        {
          uint64_t v6 = *(void *)(v2 + 104 * a2 + 32);
          uint64_t v7 = *(void *)a1;
          float64x2_t v8 = (uint64_t *)(v2 + 32 + 104 * v5);
          while (1)
          {
            uint64_t v9 = *v8;
            v8 += 13;
            if (v7 >= v6 - v9) {
              break;
            }
            ++v5;
            *(_DWORD *)(a1 + 32) = 2;
            if (a2 == v5) {
              goto LABEL_6;
            }
          }
        }
        if (v5 == a2)
        {
LABEL_6:
          *(_DWORD *)(a1 + 32) = 1;
          unint64_t v5 = a2;
        }
        ++a2;
      }
      while (a2 != v4);
    }
    sub_1003A0C28(a1, v5, &__p);
    uint64_t v10 = __p;
    if (__p)
    {
      uint64_t v11 = (uint64_t)v14;
      uint64_t v12 = __p;
      if (v14 != __p)
      {
        do
          uint64_t v11 = nullsub_9(v11 - 104);
        while ((void *)v11 != v10);
        uint64_t v12 = __p;
      }
      std::string v14 = v10;
      operator delete(v12);
    }
  }
}

uint64_t sub_1003A09D8(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = 0x4EC4EC4EC4EC4EC5 * ((a1[1] - *a1) >> 3);
  unint64_t v4 = v3 + 1;
  if ((unint64_t)(v3 + 1) > 0x276276276276276) {
    sub_1000A9108();
  }
  if (0x9D89D89D89D89D8ALL * ((a1[2] - *a1) >> 3) > v4) {
    unint64_t v4 = 0x9D89D89D89D89D8ALL * ((a1[2] - *a1) >> 3);
  }
  if ((unint64_t)(0x4EC4EC4EC4EC4EC5 * ((a1[2] - *a1) >> 3)) >= 0x13B13B13B13B13BLL) {
    unint64_t v6 = 0x276276276276276;
  }
  else {
    unint64_t v6 = v4;
  }
  if (v6)
  {
    if (v6 > 0x276276276276276) {
      sub_1000A6A10();
    }
    uint64_t v7 = (char *)operator new(104 * v6);
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v15 = (uint64_t)&v7[104 * v3];
  uint64_t v16 = &v7[104 * v6];
  sub_1000458C4(v15, a2);
  *(void *)(v15 + 96) = *(void *)(a2 + 96);
  uint64_t v8 = v15 + 104;
  uint64_t v10 = (char *)*a1;
  uint64_t v9 = (char *)a1[1];
  if (v9 == (char *)*a1)
  {
    *a1 = v15;
    a1[1] = v8;
    a1[2] = (uint64_t)v16;
  }
  else
  {
    uint64_t v11 = 0;
    do
    {
      sub_1000458C4(v15 + v11 - 104, (uint64_t)&v9[v11 - 104]);
      *(void *)(v15 + v11 - 8) = *(void *)&v9[v11 - 8];
      v11 -= 104;
    }
    while (&v9[v11] != v10);
    uint64_t v12 = (char *)*a1;
    uint64_t v9 = (char *)a1[1];
    uint64_t v13 = v15 + v11;
    uint64_t v8 = v15 + 104;
    *a1 = v13;
    a1[1] = v15 + 104;
    a1[2] = (uint64_t)v16;
    if (v9 != v12)
    {
      do
      {
        v9 -= 104;
        nullsub_9(v9);
      }
      while (v9 != v12);
      uint64_t v9 = v12;
    }
  }
  if (v9) {
    operator delete(v9);
  }
  return v8;
}

void sub_1003A0B98(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_1003A0BD4((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1003A0BAC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  for (; v2; v2 += 104)
    nullsub_9(v3 + v2);
  sub_1003A0BD4((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_1003A0BD4(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 104;
    nullsub_9(i - 104);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_1003A0C28(uint64_t a1@<X0>, unint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = *(void *)(a1 + 8);
  a3[1] = 0;
  a3[2] = 0;
  *a3 = 0;
  sub_1003A0CFC(a3, v5, v5 + 104 * a2, a2);
  if (a2)
  {
    uint64_t v6 = v5 + 104 * a2;
    uint64_t v7 = *(void *)(a1 + 16);
    if (v6 != v7)
    {
      uint64_t v8 = 104 * a2;
      do
      {
        sub_1001A75D8(v5, v5 + v8);
        *(void *)(v5 + 96) = *(void *)(v5 + v8 + 96);
        v5 += 104;
      }
      while (v5 + v8 != v7);
      uint64_t v6 = *(void *)(a1 + 16);
    }
    while (v6 != v5)
      uint64_t v6 = nullsub_9(v6 - 104);
    *(void *)(a1 + 16) = v5;
  }
}

void sub_1003A0CE8(_Unwind_Exception *a1)
{
  sub_1003A0850(v1);
  _Unwind_Resume(a1);
}

void sub_1003A0CFC(void *a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    if (a4 >= 0x276276276276277) {
      sub_1000A9108();
    }
    uint64_t v8 = (char *)operator new(104 * a4);
    *a1 = v8;
    a1[1] = v8;
    a1[2] = &v8[104 * a4];
    if (a2 != a3)
    {
      uint64_t v9 = 0;
      do
      {
        sub_1000458C4((uint64_t)&v8[v9], a2 + v9);
        *(void *)(v10 + 96) = *(void *)(a2 + v9 + 96);
        v9 += 104;
      }
      while (a2 + v9 != a3);
      v8 += v9;
    }
    a1[1] = v8;
  }
}

void sub_1003A0DCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
}

void sub_1003A0DE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  for (; v11; v11 -= 104)
    nullsub_9(v10 - 104 + v11);
  *(void *)(v9 + 8) = v10;
  sub_1003A0E10(&a9);
  _Unwind_Resume(a1);
}

void ***sub_1003A0E10(void ***result)
{
  uint64_t v1 = result;
  if (!*((unsigned char *)result + 8))
  {
    uint64_t v2 = *result;
    uint64_t v3 = **result;
    if (v3)
    {
      uint64_t v4 = (uint64_t)v2[1];
      uint64_t v5 = **v1;
      if ((void *)v4 != v3)
      {
        do
          uint64_t v4 = nullsub_9(v4 - 104);
        while ((void *)v4 != v3);
        uint64_t v5 = **v1;
      }
      v2[1] = v3;
      operator delete(v5);
      return v1;
    }
  }
  return result;
}

double sub_1003A0E98(uint64_t a1)
{
  if (*(unsigned char *)a1) {
    return 1.0 / ((double)*(uint64_t *)(a1 + 8) / 1000000000.0);
  }
  else {
    return NAN;
  }
}

unsigned __int8 *sub_1003A0ED0(unsigned __int8 *result, uint64_t a2)
{
  uint64_t v2 = *((void *)result + 3);
  if (v2 == 0x8000000000000000)
  {
    if (*result)
    {
      *double result = 0;
      *((void *)result + 2) = 0x8000000000000000;
      *((void *)result + 3) = a2;
      return result;
    }
    goto LABEL_8;
  }
  uint64_t v3 = *((void *)result + 2);
  if (v3 == 0x8000000000000000) {
    uint64_t v4 = 2 * (a2 - v2);
  }
  else {
    uint64_t v4 = a2 - v3;
  }
  int v5 = *result;
  *((void *)result + 1) = v4;
  if (v5)
  {
LABEL_8:
    *((void *)result + 2) = v2;
    *((void *)result + 3) = a2;
    return result;
  }
  *double result = 1;
  *((void *)result + 2) = v2;
  *((void *)result + 3) = a2;
  return result;
}

int64x2_t sub_1003A0F34(int64x2_t *a1)
{
  if (a1->i8[0]) {
    a1->i8[0] = 0;
  }
  int64x2_t result = vdupq_n_s64(0x8000000000000000);
  a1[1] = result;
  return result;
}

BOOL sub_1003A0F50(uint64_t a1)
{
  return *(void *)(a1 + 16) != 0x8000000000000000;
}

BOOL sub_1003A0F64(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  return v2 != 0x8000000000000000 && a2 - v2 < 166666667;
}

BOOL sub_1003A0F88(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  return v2 != 0x8000000000000000 && a2 - v2 > 425000000;
}

void sub_1003A0FAC()
{
  if ((byte_10047BF40 & 1) == 0)
  {
    byte_10047BF40 = 1;
    sub_1000A6120(qword_10047BF30);
    __cxa_atexit((void (*)(void *))sub_1000A6488, qword_10047BF30, (void *)&_mh_execute_header);
  }
}

void sub_1003A1024()
{
  if ((byte_10047BF58 & 1) == 0)
  {
    byte_10047BF58 = 1;
    sub_1000A6530(qword_10047BF48);
    __cxa_atexit((void (*)(void *))sub_1000A6488, qword_10047BF48, (void *)&_mh_execute_header);
  }
}

uint64_t sub_1003A109C(uint64_t a1)
{
  uint64_t v2 = *(void (****)(void))(a1 + 8);
  if (v2)
  {
    uint64_t v3 = *(void (****)(void))(a1 + 16);
    uint64_t v4 = *(void **)(a1 + 8);
    if (v3 != v2)
    {
      int v5 = v3 - 12;
      uint64_t v6 = v3 - 12;
      uint64_t v7 = v3 - 12;
      do
      {
        uint64_t v8 = *v7;
        v7 -= 12;
        (*v8)(v6);
        v5 -= 12;
        BOOL v9 = v6 == v2;
        uint64_t v6 = v7;
      }
      while (!v9);
      uint64_t v4 = *(void **)(a1 + 8);
    }
    *(void *)(a1 + 16) = v2;
    operator delete(v4);
  }
  return a1;
}

void sub_1003A1138(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)&long long v46 = v5;
  *((double *)&v46 + 1) = a3;
  sub_1002BF9F8((void *)(a1 + 16), &v46);
  unint64_t v6 = *(void *)(a1 + 72);
  if (v6 >= *(void *)(a1 + 80))
  {
    uint64_t v7 = sub_1000E1C3C((void *)(a1 + 64), a2);
  }
  else
  {
    sub_1000458C4(*(void *)(a1 + 72), a2);
    uint64_t v7 = v6 + 96;
    *(void *)(a1 + 72) = v6 + 96;
  }
  *(void *)(a1 + 72) = v7;
  sub_1003A19C4((uint64_t *)(a1 + 56), 0xAAAAAAAAAAAAAAABLL * ((v7 - *(void *)(a1 + 64)) >> 5) - 1);
  uint64_t v8 = *(void *)(a1 + 24);
  uint64_t v9 = *(void *)(a1 + 32);
  if (v8 == v9)
  {
    double v11 = 0.0;
    goto LABEL_12;
  }
  unint64_t v10 = v9 - v8 - 16;
  if (v10 < 0x10)
  {
    double v11 = 0.0;
    uint64_t v12 = *(void *)(a1 + 24);
    do
    {
LABEL_11:
      double v11 = v11 + *(double *)(v12 + 8);
      v12 += 16;
    }
    while (v12 != v9);
    goto LABEL_12;
  }
  uint64_t v13 = (v10 >> 4) + 1;
  uint64_t v12 = v8 + 16 * (v13 & 0x1FFFFFFFFFFFFFFELL);
  std::string v14 = (double *)(v8 + 24);
  double v11 = 0.0;
  uint64_t v15 = v13 & 0x1FFFFFFFFFFFFFFELL;
  do
  {
    double v16 = *(v14 - 2);
    double v17 = *v14;
    v14 += 4;
    double v11 = v11 + v16 + v17;
    v15 -= 2;
  }
  while (v15);
  if (v13 != (v13 & 0x1FFFFFFFFFFFFFFELL)) {
    goto LABEL_11;
  }
LABEL_12:
  double v18 = v11 / (double)(unint64_t)((v9 - v8) >> 4);
  *(double *)(a1 + 8) = v18;
  id v20 = *(double **)(a1 + 64);
  uint64_t v19 = *(double **)(a1 + 72);
  uint64_t v21 = (char *)v19 - (char *)v20;
  if (v19 == v20)
  {
    *(void *)a1 = 0;
LABEL_26:
    *(_DWORD *)(a1 + 152) = 2;
    sub_1003A0F34((int64x2_t *)(a1 + 120));
    *(void *)(a1 + 160) = 0;
    *(_DWORD *)(a1 + 180) = 2;
    return;
  }
  unint64_t v22 = 0xAAAAAAAAAAAAAAABLL * (v21 >> 5);
  unint64_t v23 = v21 - 96;
  unint64_t v24 = (v21 - 96) / 0x60uLL + 1;
  if (v23 < 0x60)
  {
    float64x2_t v25 = 0uLL;
    double v26 = 0.0;
    long long v27 = *(double **)(a1 + 64);
    do
    {
LABEL_19:
      float64x2_t v25 = vaddq_f64(v25, *(float64x2_t *)(v27 + 1));
      double v26 = v26 + v27[3];
      v27 += 12;
    }
    while (v27 != v19);
    goto LABEL_20;
  }
  long long v27 = &v20[12 * (v24 & 0x7FFFFFFFFFFFFFELL)];
  long long v28 = v20 + 15;
  float64x2_t v25 = 0uLL;
  double v26 = 0.0;
  uint64_t v29 = v24 & 0x7FFFFFFFFFFFFFELL;
  do
  {
    float64x2_t v25 = vaddq_f64(vaddq_f64(v25, *(float64x2_t *)(v28 - 14)), *(float64x2_t *)(v28 - 2));
    double v26 = v26 + *(v28 - 12) + *v28;
    v28 += 24;
    v29 -= 2;
  }
  while (v29);
  if (v24 != (v24 & 0x7FFFFFFFFFFFFFELL)) {
    goto LABEL_19;
  }
LABEL_20:
  double v30 = (double)v22;
  double v31 = v25.f64[0] / (double)v22;
  double v32 = v25.f64[1] / (double)v22;
  double v33 = 0.0;
  double v34 = v26 / (double)v22;
  if (v23 < 0x60) {
    goto LABEL_42;
  }
  int v35 = &v20[12 * (v24 & 0x7FFFFFFFFFFFFFELL)];
  unsigned __int16 v36 = v20 + 15;
  uint64_t v37 = v24 & 0x7FFFFFFFFFFFFFELL;
  do
  {
    double v38 = *(v36 - 14) - v31;
    double v39 = *(v36 - 2) - v31;
    double v40 = *(v36 - 13) - v32;
    double v41 = *(v36 - 1) - v32;
    double v42 = *(v36 - 12);
    double v43 = *v36;
    v36 += 24;
    double v33 = v33
        + (v40 * v40 + v38 * v38 + (v42 - v34) * (v42 - v34)) / v30
        + (v41 * v41 + v39 * v39 + (v43 - v34) * (v43 - v34)) / v30;
    v37 -= 2;
  }
  while (v37);
  id v20 = v35;
  if (v24 != (v24 & 0x7FFFFFFFFFFFFFELL))
  {
LABEL_42:
    do
    {
      double v33 = v33
          + ((v20[2] - v32) * (v20[2] - v32) + (v20[1] - v31) * (v20[1] - v31) + (v20[3] - v34) * (v20[3] - v34)) / v30;
      v20 += 12;
    }
    while (v20 != v19);
  }
  *(double *)a1 = v33;
  if (v33 < 0.290521) {
    goto LABEL_26;
  }
  int v44 = *(_DWORD *)(a1 + 152);
  if (v44 && v18 > 0.75)
  {
    if (!sub_1003A14C8(a1, v5)) {
      goto LABEL_37;
    }
    int v45 = 0;
    goto LABEL_36;
  }
  if (v44 != 1 && v18 < -0.75 && sub_1003A14C8(a1, v5))
  {
    int v45 = 1;
LABEL_36:
    *(_DWORD *)(a1 + 152) = v45;
  }
LABEL_37:
  if (*(_DWORD *)(a1 + 180) != 2 && sub_1003A0F88(a1 + 120, v5))
  {
    sub_1003A0F34((int64x2_t *)(a1 + 120));
    *(_DWORD *)(a1 + 180) = 3;
  }
}

void sub_1003A14C0(_Unwind_Exception *a1)
{
  *(void *)(v1 + 72) = v2;
  _Unwind_Resume(a1);
}

BOOL sub_1003A14C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (unsigned __int8 *)(a1 + 120);
  BOOL v5 = sub_1003A0F64(a1 + 120, a2);
  if (v5)
  {
    if (qword_10047BED8 != -1)
    {
      dispatch_once(&qword_10047BED8, &stru_10046BE38);
      unint64_t v6 = qword_10047BEE0;
      if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_DEBUG)) {
        return !v5;
      }
      goto LABEL_4;
    }
    unint64_t v6 = qword_10047BEE0;
    if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_DEBUG))
    {
LABEL_4:
      int v9 = 134217984;
      uint64_t v10 = a2;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Spurious accelerometer data at time tNanos=%llu We will not trigger a step for this!!", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    sub_1003A0ED0(v4, a2);
    ++*(_DWORD *)(a1 + 156);
    *(double *)(a1 + 160) = sub_1003A0E98((uint64_t)v4);
    if (sub_1003A0F50((uint64_t)v4)) {
      int v7 = 1;
    }
    else {
      int v7 = 3;
    }
    *(_DWORD *)(a1 + 180) = v7;
  }
  return !v5;
}

void sub_1003A1610(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_1003A1618(uint64_t result, double a2)
{
  *(double *)(result + 168) = a2;
  return result;
}

uint64_t sub_1003A1620(uint64_t result, int a2)
{
  *(_DWORD *)(result + 112) = a2;
  return result;
}

uint64_t sub_1003A1628(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 112) && sub_1002A5AAC(*(double **)(a1 + 96)) && *(_DWORD *)(a1 + 180) == 3) {
    return 1;
  }
  else {
    return *(unsigned int *)(a1 + 180);
  }
}

double sub_1003A167C(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 112) && sub_1002A5AAC(*(double **)(a1 + 96)) && *(_DWORD *)(a1 + 180) == 3)
  {
    uint64_t v2 = *(void *)(a1 + 96);
    return sub_1002A5B80(v2);
  }
  else
  {
    int v4 = *(_DWORD *)(a1 + 180);
    switch(v4)
    {
      case 3:
        return 1.4;
      case 2:
        return 0.0;
      case 1:
        if (*(unsigned char *)(a1 + 176))
        {
          return *(double *)(a1 + 168) * *(double *)(a1 + 160);
        }
        else
        {
          double v5 = *(double *)(a1 + 192);
          return v5 * pow(*(long double *)(a1 + 160), *(long double *)(a1 + 184));
        }
      default:
        __cxa_allocate_exception(0x40uLL);
        int v9 = *(_DWORD *)(a1 + 180);
        sub_10025F4C8((uint64_t)&v9, &v7);
        std::runtime_error::runtime_error(&v8, &v7);
        v8.__vftable = (std::runtime_error_vtbl *)&off_100453630;
        sub_10018E868((uint64_t)v6);
        sub_1000CC8F4(&v8, (uint64_t)"double StepDetector::getSpeed() const", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/purpleslam/common/localize/step_detector.cpp", 188, (uint64_t)v6);
    }
  }
}

void sub_1003A184C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, std::runtime_error a19)
{
  if (__p) {
    operator delete(__p);
  }
  std::runtime_error::~runtime_error(&a19);
  if (a18 < 0) {
    operator delete(a13);
  }
  _Unwind_Resume(a1);
}

void sub_1003A18D4(id a1)
{
  qword_10047BEE0 = (uint64_t)os_log_create("com.apple.locationd.Pipeline", "Generic");
}

void sub_1003A1904(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_10046BE68;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1003A1924(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_10046BE68;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

uint64_t sub_1003A1978(uint64_t result)
{
  uint64_t v1 = result;
  if (*(unsigned char *)(result + 120))
  {
    int64x2_t result = nullsub_95(result + 128);
    *(unsigned char *)(v1 + 120) = 0;
  }
  if (*(unsigned char *)(v1 + 24))
  {
    int64x2_t result = nullsub_95(v1 + 32);
    *(unsigned char *)(v1 + 24) = 0;
  }
  return result;
}

void sub_1003A19C4(uint64_t *a1, unint64_t a2)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = a1[2] - v3;
  if (v4 == 96)
  {
    *((_DWORD *)a1 + 8) = 1;
  }
  else
  {
    unint64_t v5 = v4 / 96;
    if (v5 <= a2)
    {
      unint64_t v6 = 0;
    }
    else
    {
      unint64_t v6 = 0;
      do
      {
        if (v6 != a2)
        {
          uint64_t v7 = *(void *)(v3 + 96 * a2 + 32);
          uint64_t v8 = *a1;
          int v9 = (uint64_t *)(v3 + 32 + 96 * v6);
          while (1)
          {
            uint64_t v10 = *v9;
            v9 += 12;
            if (v8 >= v7 - v10) {
              break;
            }
            ++v6;
            *((_DWORD *)a1 + 8) = 2;
            if (a2 == v6) {
              goto LABEL_6;
            }
          }
        }
        if (v6 == a2)
        {
LABEL_6:
          *((_DWORD *)a1 + 8) = 1;
          unint64_t v6 = a2;
        }
        ++a2;
      }
      while (a2 != v5);
    }
    __p = 0;
    long long v27 = 0;
    uint64_t v28 = 0;
    sub_1003A1BF8(&__p, v3, v3 + 96 * v6, v6);
    if (v6)
    {
      unint64_t v12 = v3 + 96 * v6;
      uint64_t v13 = a1[2];
      if (v12 != v13)
      {
        uint64_t v14 = 96 * v6;
        do
        {
          v11.n128_f64[0] = sub_1001A75D8(v3, v3 + v14);
          v3 += 96;
        }
        while (v3 + v14 != v13);
        unint64_t v12 = a1[2];
      }
      if (v12 != v3)
      {
        unint64_t v15 = v12 - 96;
        double v16 = (void (***)(void, __n128))(v12 - 96);
        double v17 = (void (***)(void, __n128))(v12 - 96);
        do
        {
          double v18 = *v17;
          v17 -= 12;
          (*v18)(v16, v11);
          v15 -= 96;
          BOOL v19 = v16 == (void (***)(void, __n128))v3;
          double v16 = v17;
        }
        while (!v19);
      }
      a1[2] = v3;
    }
    id v20 = (char *)__p;
    if (__p)
    {
      uint64_t v21 = __p;
      if (v27 != __p)
      {
        unint64_t v22 = v27 - 96;
        unint64_t v23 = v27 - 96;
        unint64_t v24 = (void (***)(char *))(v27 - 96);
        do
        {
          float64x2_t v25 = *v24;
          v24 -= 12;
          (*v25)(v23);
          v22 -= 96;
          BOOL v19 = v23 == v20;
          unint64_t v23 = (char *)v24;
        }
        while (!v19);
        uint64_t v21 = __p;
      }
      long long v27 = v20;
      operator delete(v21);
    }
  }
}

void sub_1003A1BDC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char *a10)
{
  if (a10) {
    sub_1003A8B40((uint64_t)&a10, a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_1003A1BF8(void *a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    if (a4 >= 0x2AAAAAAAAAAAAABLL) {
      sub_1000A9108();
    }
    uint64_t v8 = (char *)operator new(96 * a4);
    *a1 = v8;
    a1[1] = v8;
    a1[2] = &v8[96 * a4];
    if (a2 != a3)
    {
      uint64_t v9 = 0;
      do
      {
        sub_1000458C4((uint64_t)&v8[v9], a2 + v9);
        v9 += 96;
      }
      while (a2 + v9 != a3);
      v8 += v9;
    }
    a1[1] = v8;
  }
}

void sub_1003A1CB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
}

void sub_1003A1CCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  if (v11) {
    sub_1003A8BD4((uint64_t)v10 + v11, v10);
  }
  *(void *)(v9 + 8) = v10;
  sub_1003A1CF4(&a9);
  _Unwind_Resume(a1);
}

void ***sub_1003A1CF4(void ***result)
{
  uint64_t v1 = result;
  if (!*((unsigned char *)result + 8))
  {
    uint64_t v2 = *result;
    uint64_t v3 = (char *)**result;
    if (v3)
    {
      uint64_t v4 = (char *)v2[1];
      unint64_t v5 = **result;
      if (v4 != v3)
      {
        unint64_t v6 = v4 - 96;
        uint64_t v7 = v4 - 96;
        uint64_t v8 = v4 - 96;
        do
        {
          uint64_t v9 = *(void (***)(char *))v8;
          v8 -= 96;
          (*v9)(v7);
          v6 -= 96;
          BOOL v10 = v7 == v3;
          uint64_t v7 = v8;
        }
        while (!v10);
        unint64_t v5 = **v1;
      }
      v2[1] = v3;
      operator delete(v5);
      return v1;
    }
  }
  return result;
}

void sub_1003A1DB8()
{
  if ((byte_10047BF40 & 1) == 0)
  {
    byte_10047BF40 = 1;
    sub_1000A6120(qword_10047BF30);
    __cxa_atexit((void (*)(void *))sub_1000A6488, qword_10047BF30, (void *)&_mh_execute_header);
  }
}

void sub_1003A1E30()
{
  if ((byte_10047BF58 & 1) == 0)
  {
    byte_10047BF58 = 1;
    sub_1000A6530(qword_10047BF48);
    __cxa_atexit((void (*)(void *))sub_1000A6488, qword_10047BF48, (void *)&_mh_execute_header);
  }
}

uint64_t sub_1003A1EA8(uint64_t a1)
{
  nullsub_9(a1 + 144);
  nullsub_9(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 8);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 16);
    uint64_t v4 = *(void **)(a1 + 8);
    if (v3 != v2)
    {
      do
        uint64_t v3 = nullsub_9(v3 - 104);
      while (v3 != v2);
      uint64_t v4 = *(void **)(a1 + 8);
    }
    *(void *)(a1 + 16) = v2;
    operator delete(v4);
  }
  return a1;
}

uint64_t sub_1003A1F14(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  sub_10039FB70((uint64_t)v38, a2);
  __p[23] = 19;
  strcpy(__p, "accel cannot be NaN");
  sub_10039FC44((uint64_t)v38);
  float v5 = *(double *)(a2 + 8);
  float v6 = -v5;
  float v7 = *(double *)(a2 + 16);
  float v8 = -v7;
  float v9 = *(double *)(a2 + 24);
  float v10 = sub_1000D7990((uint64_t *)(a1 + 8), (double)v4 / 1000000000.0, v6, v8, -v9);
  float v12 = v11;
  LODWORD(v4) = v13;
  uint64_t v14 = *(void *)(a2 + 32);
  *(void *)__p = off_10045D918;
  uint64_t v36 = 0;
  *(_OWORD *)&__p[8] = 0u;
  long long v30 = 0u;
  int v31 = 0;
  uint64_t v33 = 0;
  uint64_t v34 = 0;
  uint64_t v32 = 0;
  int v35 = 0;
  __int16 v37 = 0;
  sub_1001A7008((uint64_t)__p, v14);
  sub_100076484((uint64_t)__p, v10);
  sub_10007647C((uint64_t)__p, v12);
  sub_100076F14((uint64_t)__p, *(float *)&v4);
  sub_10039FB70((uint64_t)v28, (uint64_t)__p);
  if (sub_1000D7F08(a1 + 8) && sub_10039FC28(v28) != 0.0)
  {
    *(void *)double v39 = operator new(0x20uLL);
    *(_OWORD *)&v39[8] = xmmword_1003E7220;
    strcpy(*(char **)v39, "Gravity became NaN after accel");
    sub_10039FC44((uint64_t)v28);
    if ((v39[23] & 0x80000000) != 0) {
      operator delete(*(void **)v39);
    }
    sub_1003A02D8(a1 + 16, (uint64_t)__p);
    if (*(unsigned char *)(a1 + 376))
    {
      uint64_t v15 = *(void *)(a2 + 32);
      double v16 = (double *)nullsub_22(a1 + 16);
      *(double *)v17.i64 = -sub_10039FBCC((double *)(a1 + 384), v16);
      sub_10039FA7C((uint64_t)v39, v15, (double *)(a1 + 384), v17);
      *(void *)(a1 + 424) = *(void *)&v39[16];
      *(_OWORD *)(a1 + 408) = *(_OWORD *)v39;
    }
  }
  sub_1003A027C(a1 + 16, a2);
  sub_10039FB70((uint64_t)v39, a2);
  uint64_t v18 = nullsub_22(a1 + 16);
  double v19 = sub_10039FBCC((double *)v39, (double *)v18);
  uint64_t v20 = *(void *)(v18 + 16);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)v18;
  *(void *)(a1 + 120) = v20;
  sub_10039FBEC((float64x2_t *)(a1 + 104), -v19);
  sub_10039FB84((float64x2_t *)(a1 + 104), (float64x2_t *)v39);
  double v21 = *(double *)(v18 + 8);
  double v22 = -(v21 * *(double *)v18);
  double v23 = *(double *)(v18 + 16);
  double v24 = ((1.0 - v21 * v21) * *(double *)&v39[8] + *(double *)v39 * v22 + *(double *)&v39[16] * -(v21 * v23))
      / sqrt((1.0 - v21 * v21) * (1.0 - v21 * v21) + v22 * v22 + v22 * v22);
  double v25 = -(v23 * *(double *)v18);
  double v26 = (-(v23 * v21) * *(double *)&v39[8] + *(double *)v39 * v25 + *(double *)&v39[16] * (1.0 - v23 * v23))
      / sqrt(-(v23 * v21) * -(v23 * v21) + v25 * v25 + v25 * v25);
  *(double *)(a1 + 88) = v24;
  *(double *)(a1 + 96) = v26;
  return nullsub_9(__p);
}

void sub_1003A2228(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (*(char *)(v18 - 81) < 0)
  {
    operator delete(*(void **)(v18 - 104));
    nullsub_9(&__p);
    _Unwind_Resume(a1);
  }
  nullsub_9(&__p);
  _Unwind_Resume(a1);
}

uint64_t sub_1003A2288(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  sub_10039FB70((uint64_t)&v32, a2);
  __p = operator new(0x20uLL);
  long long v23 = xmmword_1003E74F0;
  strcpy((char *)__p, "rotation rate cannot be NaN");
  sub_10039FC44((uint64_t)&v32);
  operator delete(__p);
  float v5 = *(double *)(a2 + 8);
  float v6 = *(double *)(a2 + 16);
  float v7 = *(double *)(a2 + 24);
  sub_1000D7AF4((uint64_t *)(a1 + 8), (double)v4 / 1000000000.0, v5, v6, v7);
  float v9 = v8;
  float v11 = v10;
  float v13 = v12;
  uint64_t v14 = *(void *)(a2 + 32);
  __p = off_10045D918;
  uint64_t v30 = 0;
  long long v23 = 0u;
  long long v24 = 0u;
  int v25 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  uint64_t v26 = 0;
  int v29 = 0;
  __int16 v31 = 0;
  sub_1001A7008((uint64_t)&__p, v14);
  sub_100076484((uint64_t)&__p, v9);
  sub_10007647C((uint64_t)&__p, v11);
  sub_100076F14((uint64_t)&__p, v13);
  sub_10039FB70((uint64_t)v21, (uint64_t)&__p);
  if (sub_1000D7F08(a1 + 8) && sub_10039FC28(v21) != 0.0)
  {
    *(void *)uint64_t v20 = operator new(0x28uLL);
    *(_OWORD *)&v20[8] = xmmword_1003E7230;
    strcpy(*(char **)v20, "Gravity became NaN after rotationRate");
    sub_10039FC44((uint64_t)v21);
    operator delete(*(void **)v20);
    sub_1003A02D8(a1 + 16, (uint64_t)&__p);
    int v15 = *(unsigned __int8 *)(a1 + 376);
    *(_OWORD *)(a1 + 384) = v32;
    *(void *)(a1 + 400) = v33;
    if (!v15) {
      *(unsigned char *)(a1 + 376) = 1;
    }
    uint64_t v16 = *(void *)(a2 + 32);
    int8x16_t v17 = (double *)nullsub_22(a1 + 16);
    *(double *)v18.i64 = -sub_10039FBCC((double *)(a1 + 384), v17);
    sub_10039FA7C((uint64_t)v20, v16, (double *)(a1 + 384), v18);
    *(void *)(a1 + 424) = *(void *)&v20[16];
    *(_OWORD *)(a1 + 408) = *(_OWORD *)v20;
  }
  return nullsub_9(&__p);
}

void sub_1003A24D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a15 < 0)
  {
    operator delete(__p);
    nullsub_9(&a19);
    _Unwind_Resume(a1);
  }
  nullsub_9(&a19);
  _Unwind_Resume(a1);
}

void sub_1003A2538(uint64_t a1, uint64_t a2)
{
  sub_10039FB70((uint64_t)v10, a2);
  sub_1003A25FC(a1, v10, &v8);
  uint64_t v4 = v9;
  long double v5 = *(double *)(v8 + 8);
  long double v6 = *(double *)(v8 + 16);
  if (v9 && !atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
  long double v7 = atan2(v6, v5);
  sub_1003A0474((uint64_t *)(a1 + 432), a2, 3.14159265 - v7);
}

void sub_1003A25FC(uint64_t a1@<X0>, double *a2@<X1>, void *a3@<X8>)
{
  double v6 = sub_10039FC28(a2);
  uint64_t v7 = nullsub_22(a1 + 16);
  long double v8 = *(double *)(v7 + 8);
  long double v9 = *(double *)(v7 + 16);
  double v10 = hypot(v9, v8);
  if (fabs(v10) >= nextafter(1.0, INFINITY) + -1.0)
  {
    long double v11 = *a2;
    double v12 = (*a2 * 0.0 - v9 * a2[1] + v8 * a2[2]) / v10;
    if (*a2 == 0.0 && v12 == 0.0)
    {
      float v13 = operator new(0x38uLL);
      v13[1] = 0;
      v13[2] = 0;
      *float v13 = off_10046BFD8;
      v13[4] = 0;
      v13[5] = 0;
      v13[3] = off_10045D938;
      *((unsigned char *)v13 + 48) = 0;
      *a3 = v13 + 3;
      a3[1] = v13;
    }
    else
    {
      uint64_t v14 = operator new(0x38uLL);
      v14[1] = 0;
      v14[2] = 0;
      *uint64_t v14 = off_10046BFD8;
      v14[3] = off_10045D938;
      *((unsigned char *)v14 + 48) = 0;
      *a3 = v14 + 3;
      a3[1] = v14;
      long double v15 = v6 / hypot(v11, v12);
      *((long double *)v14 + 4) = v11 * v15;
      *((long double *)v14 + 5) = v12 * v15;
    }
  }
  else
  {
    *a3 = 0;
    a3[1] = 0;
  }
}

void sub_1003A278C(uint64_t *a1, uint64_t a2)
{
  sub_10039FB70((uint64_t)v11, a2);
  sub_1003A25FC((uint64_t)a1, v11, &v9);
  uint64_t v4 = v9;
  long double v5 = atan2(*(long double *)(v9 + 16), *(long double *)(v9 + 8));
  sub_1003A0474(a1 + 85, a2, 3.14159265 - v5);
  uint64_t v6 = (uint64_t)v10;
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  a1[116] = v4;
  uint64_t v7 = (std::__shared_weak_count *)a1[117];
  a1[117] = v6;
  if (v7 && !atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
  long double v8 = v10;
  if (v10)
  {
    if (!atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
}

void sub_1003A28BC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_1000BA884((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1003A28E0(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  BOOL v4 = sub_1000D7F08(a1 + 8);
  uint64_t v5 = a1 + 16;
  uint64_t v6 = (double *)sub_10008807C(v5);
  if (!v4 || sub_10039FC28(v6) == 0.0)
  {
    *(unsigned char *)a2 = 0;
  }
  else
  {
    uint64_t v7 = nullsub_22(v5);
    *(_OWORD *)(a2 + 8) = *(_OWORD *)v7;
    *(void *)(a2 + 24) = *(void *)(v7 + 16);
    *(unsigned char *)a2 = 1;
  }
}

uint64_t sub_1003A296C(uint64_t a1)
{
  return (a1 + 408) & ~(*(uint64_t *)(a1 + 408) >> 63);
}

double sub_1003A297C(uint64_t a1)
{
  return sub_1003A0414((double *)(a1 + 16));
}

uint64_t sub_1003A2984(uint64_t a1)
{
  return a1 + 432;
}

void sub_1003A298C(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 928);
  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 936);
    *a2 = v4;
    a2[1] = v5;
    if (v5) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
    }
  }
  else
  {
    v8[0] = sub_10009D208();
    v8[1] = v6;
    v8[2] = v7;
    sub_1003A25FC(a1, v8, a2);
  }
}

void sub_1003A2A04(uint64_t a1@<X0>, void *a2@<X8>)
{
  v6[0] = sub_1003A05A0(a1 + 680);
  v6[1] = v4;
  v6[2] = v5;
  sub_1003A25FC(a1, v6, a2);
}

void sub_1003A2A54(uint64_t a1)
{
  sub_1003A2A8C(a1);

  operator delete();
}

uint64_t sub_1003A2A8C(uint64_t a1)
{
  *(void *)a1 = off_10046BEB8;
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 936);
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    nullsub_9(a1 + 824);
    nullsub_9(a1 + 720);
    uint64_t v3 = *(void **)(a1 + 688);
    if (!v3) {
      goto LABEL_8;
    }
  }
  else
  {
    nullsub_9(a1 + 824);
    nullsub_9(a1 + 720);
    uint64_t v3 = *(void **)(a1 + 688);
    if (!v3) {
      goto LABEL_8;
    }
  }
  uint64_t v4 = *(void *)(a1 + 696);
  double v5 = v3;
  if ((void *)v4 != v3)
  {
    do
      uint64_t v4 = nullsub_9(v4 - 104);
    while ((void *)v4 != v3);
    double v5 = *(void **)(a1 + 688);
  }
  *(void *)(a1 + 696) = v3;
  operator delete(v5);
LABEL_8:
  nullsub_9(a1 + 576);
  nullsub_9(a1 + 472);
  uint64_t v6 = *(void *)(a1 + 440);
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 448);
    long double v8 = *(void **)(a1 + 440);
    if (v7 != v6)
    {
      do
        uint64_t v7 = nullsub_9(v7 - 104);
      while (v7 != v6);
      long double v8 = *(void **)(a1 + 440);
    }
    *(void *)(a1 + 448) = v6;
    operator delete(v8);
  }
  if (*(unsigned char *)(a1 + 376)) {
    *(unsigned char *)(a1 + 376) = 0;
  }
  nullsub_9(a1 + 272);
  nullsub_9(a1 + 168);
  uint64_t v9 = *(void *)(a1 + 136);
  if (v9)
  {
    uint64_t v10 = *(void *)(a1 + 144);
    long double v11 = *(void **)(a1 + 136);
    if (v10 != v9)
    {
      do
        uint64_t v10 = nullsub_9(v10 - 104);
      while (v10 != v9);
      long double v11 = *(void **)(a1 + 136);
    }
    *(void *)(a1 + 144) = v9;
    operator delete(v11);
  }
  sub_1000D794C((uint64_t *)(a1 + 8));
  return a1;
}

void sub_1003A2C1C(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_10046BFD8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1003A2C3C(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_10046BFD8;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

uint64_t sub_1003A2C90(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void sub_1003A2CB8()
{
  if ((byte_10047BF40 & 1) == 0)
  {
    byte_10047BF40 = 1;
    sub_1000A6120(qword_10047BF30);
    __cxa_atexit((void (*)(void *))sub_1000A6488, qword_10047BF30, (void *)&_mh_execute_header);
  }
}

void sub_1003A2D30()
{
  if ((byte_10047BF58 & 1) == 0)
  {
    byte_10047BF58 = 1;
    sub_1000A6530(qword_10047BF48);
    __cxa_atexit((void (*)(void *))sub_1000A6488, qword_10047BF48, (void *)&_mh_execute_header);
  }
}

uint64_t sub_1003A2DB8()
{
  uint64_t v0 = sub_1000A5ED4();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
  {
    sub_1000A9F78();
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Bluetooth scanning should not be on by default\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
  }

  uint64_t v1 = sub_1000A5ED4();
  if (os_signpost_enabled(v1))
  {
    sub_1000A9F78();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v1, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Bluetooth scanning should not be on by default", "{\"msg%{public}.0s\":\"Bluetooth scanning should not be on by default\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
  }

  uint64_t v2 = sub_1000A5ED4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    sub_1000A9F78();
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Bluetooth scanning should not be on by default\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
  }

  uint64_t result = abort_report_np();
  __break(1u);
  return result;
}

uint64_t sub_1003A2F30(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

uint64_t sub_1003A2F54(void *a1, char a2, uint64_t *a3)
{
  __cxa_begin_catch(a1);
  if (a2) {
    return 1;
  }
  sub_1000AFDCC();
  if (v7 || ((*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v6 + 48))(v6, 12) & 1) != 0) {
    uint64_t v8 = 3;
  }
  else {
    uint64_t v8 = 2;
  }
  uint64_t result = 0;
  *a3 = v8;
  return result;
}

void sub_1003A2FD8(void *a1, uint64_t *a2)
{
  __cxa_begin_catch(a1);
  sub_1000AFDCC();
  if (v4 || ((*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v3 + 48))(v3, 12) & 1) != 0) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 2;
  }
  *a2 = v5;
}

void sub_1003A3048(NSObject **a1)
{
  uint64_t v2 = sub_1000BA10C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    sub_1000BA678();
    sub_1000BA744((void *)&_mh_execute_header, v3, v4, "{\"msg%{public}.0s\":\"@IndoorAvl, load, failed to compute available venues\", \"attempts\":%{public}d, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v5, v6, v7, v8, v22);
  }

  uint64_t v9 = sub_1000BA10C();
  if (os_signpost_enabled(v9))
  {
    sub_1000BA678();
    sub_1000BA6F8((void *)&_mh_execute_header, v10, v11, v12, "@IndoorAvl, load, failed to compute available venues", "{\"msg%{public}.0s\":\"@IndoorAvl, load, failed to compute available venues\", \"attempts\":%{public}d, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v13, v14, v22);
  }

  long double v15 = sub_1000BA10C();
  *a1 = v15;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    sub_1000BA678();
    sub_1000BA724((void *)&_mh_execute_header, v16, v17, "{\"msg%{public}.0s\":\"@IndoorAvl, load, failed to compute available venues\", \"attempts\":%{public}d, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v18, v19, v20, v21, v22);
  }
}

void sub_1003A3178(NSObject **a1)
{
  uint64_t v2 = sub_1000BA10C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    sub_1000BA6CC();
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"# of points in exterior doesn't match size of tile vertices\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v5, 0x26u);
  }

  uint64_t v3 = sub_1000BA10C();
  if (os_signpost_enabled(v3))
  {
    sub_1000BA6CC();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "# of points in exterior doesn't match size of tile vertices", "{\"msg%{public}.0s\":\"# of points in exterior doesn't match size of tile vertices\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v5, 0x26u);
  }

  uint64_t v4 = sub_1000BA10C();
  *a1 = v4;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    sub_1000BA6CC();
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"# of points in exterior doesn't match size of tile vertices\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v5, 0x26u);
  }
}

void sub_1003A32E4()
{
  if (qword_10047BEE8 != -1) {
    dispatch_once(&qword_10047BEE8, &stru_1004529F0);
  }
  if (os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_FAULT))
  {
    sub_1000BA6B4();
    sub_1000BA744((void *)&_mh_execute_header, v0, v1, "{\"msg%{public}.0s\":\"@IndoorAvl, load, Invalid idx for venue.ids list!\", \"idx\":%{public}d, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v2, v3, v4, v5, 3u);
  }
  if (qword_10047BEE8 != -1) {
    dispatch_once(&qword_10047BEE8, &stru_1004529F0);
  }
  if (os_signpost_enabled((os_log_t)qword_10047BEF0))
  {
    sub_1000BA6B4();
    sub_1000BA6F8((void *)&_mh_execute_header, v6, v7, v8, "@IndoorAvl, load, Invalid idx for venue.ids list!", "{\"msg%{public}.0s\":\"@IndoorAvl, load, Invalid idx for venue.ids list!\", \"idx\":%{public}d, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v9, v10, 3u);
  }
  if (qword_10047BEE8 != -1) {
    dispatch_once(&qword_10047BEE8, &stru_1004529F0);
  }
  if (os_log_type_enabled((os_log_t)qword_10047BEF0, OS_LOG_TYPE_INFO))
  {
    sub_1000BA6B4();
    sub_1000BA724((void *)&_mh_execute_header, v11, v12, "{\"msg%{public}.0s\":\"@IndoorAvl, load, Invalid idx for venue.ids list!\", \"idx\":%{public}d, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v13, v14, v15, v16, 3u);
  }
}

void sub_1003A34D4(char *a1, uint8_t *buf, os_log_t log)
{
  if (a1[23] >= 0) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(char **)a1;
  }
  *(void *)buf = 68289795;
  *((_WORD *)buf + 4) = 2082;
  *(void *)(buf + 10) = "";
  *((_WORD *)buf + 9) = 2081;
  *(void *)(buf + 20) = v4;
  *((_WORD *)buf + 14) = 2082;
  *(void *)(buf + 30) = "assert";
  *((_WORD *)buf + 19) = 2081;
  *((void *)buf + 5) = "serialized";
  _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Failed to serialize-append properly\", \"typename\":%{private, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
  if (a1[23] < 0) {
    operator delete(*(void **)a1);
  }
}

uint64_t sub_1003A3598(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 24))();
}

void sub_1003A35BC(void **a1, char *a2, void **a3)
{
  uint64_t v5 = (char *)*a1;
  uint64_t v6 = a2;
  if (v5 != a2)
  {
    do
    {
      uint64_t v8 = v5 - 1200;
      sub_1000C99C4((cnframework::TimestampedEvent *)(v5 - 1192));
      uint64_t v5 = v8;
    }
    while (v8 != a2);
    uint64_t v6 = *a3;
  }
  *a1 = a2;

  operator delete(v6);
}

void *sub_1003A362C(void *result)
{
  result[375] = off_100452B48;
  result[361] = off_100452B48;
  result[347] = off_100452B48;
  result[339] = off_100452B48;
  return result;
}

void *sub_1003A36B0(void *result)
{
  result[320] = off_100452B48;
  result[306] = off_100452B48;
  result[292] = off_100452B48;
  result[284] = off_100452B48;
  return result;
}

void (***sub_1003A3744(void (***a1)(void), void (***a2)(void)))(void)
{
  uint64_t v3 = a1;
  uint64_t v4 = a1;
  do
  {
    uint64_t v5 = *v4;
    v4 += 12;
    (*v5)();
    v3 += 12;
    uint64_t result = v4;
  }
  while (v4 != a2);
  return result;
}

void sub_1003A37A8(std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void sub_1003A381C(uint64_t a1)
{
  sub_100162E78(a1);
  if (!v2)
  {
    sub_100162E88();
    (*(void (**)(void))(v3 + 16))();
    std::__shared_weak_count::__release_weak(v1);
  }
}

void sub_1003A3868(uint64_t a1)
{
  sub_100162E78(a1);
  if (!v2)
  {
    sub_100162E88();
    (*(void (**)(void))(v3 + 16))();
    std::__shared_weak_count::__release_weak(v1);
  }
}

void sub_1003A38CC()
{
  sub_100162EC4();
  uint64_t v3 = *(std::__shared_weak_count **)(v2 + 56);
  if (v3)
  {
    sub_100162EA8();
    if (!v4)
    {
      sub_100162EB8();
      uint64_t v5 = sub_100162E98();
      v6(v5);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  uint64_t v7 = *(std::__shared_weak_count **)(v1 + 40);
  if (v7)
  {
    sub_100162EA8();
    if (!v8)
    {
      sub_100162EB8();
      uint64_t v9 = sub_100162E98();
      v10(v9);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  if (*(char *)(v1 + 31) < 0)
  {
    uint64_t v11 = *v0;
    operator delete(v11);
  }
}

void sub_1003A3988()
{
  sub_100162EC4();
  uint64_t v3 = *(std::__shared_weak_count **)(v2 + 40);
  if (v3)
  {
    sub_100162EA8();
    if (!v4)
    {
      sub_100162EB8();
      uint64_t v5 = sub_100162E98();
      v6(v5);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  if (*(char *)(v1 + 31) < 0)
  {
    uint64_t v7 = *v0;
    operator delete(v7);
  }
}

char *sub_1003A3A10(uint64_t a1)
{
  uint64_t result = (char *)operator new(0x28uLL);
  *(void *)a1 = result;
  *(_OWORD *)(a1 + 8) = xmmword_1003EE110;
  strcpy(result, "No diagnostic information available.");
  return result;
}

void sub_1003A3A68()
{
  sub_100162EC4();
  uint64_t v4 = (char *)*v3;
  uint64_t v6 = v5;
  if (v4 != v5)
  {
    uint64_t v7 = v2;
    do
    {
      uint64_t v8 = (std::__shared_weak_count *)*((void *)v4 - 1);
      if (v8 && !atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
      uint64_t v9 = *((void *)v4 - 5);
      if (v9) {
        (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
      }
      v4 -= 48;
    }
    while (v4 != v0);
    uint64_t v6 = *v7;
  }
  *uint64_t v1 = v0;

  operator delete(v6);
}

uint64_t sub_1003A3B44()
{
  sub_100162EC4();
  do
  {
    uint64_t v2 = *(std::__shared_weak_count **)(v1 + 40);
    if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      sub_100162EB8();
      uint64_t v3 = sub_100162E98();
      v4(v3);
      std::__shared_weak_count::__release_weak(v2);
    }
    uint64_t result = *(void *)(v1 + 8);
    if (result) {
      uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 8))(result);
    }
    v1 += 48;
  }
  while (v1 != v0);
  return result;
}

void sub_1003A3BE0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v7 = sub_100162E78(a1);
  if (!v8)
  {
    uint64_t v9 = (std::__shared_weak_count *)v7;
    (*(void (**)(uint64_t))(*(void *)v7 + 16))(v7);
    std::__shared_weak_count::__release_weak(v9);
  }
  *(void *)a4 = a2;
  *(_DWORD *)(a4 + 8) = a3;
}

void sub_1003A3C50(char *a1, uint8_t *buf, os_log_t log)
{
  if (a1[23] >= 0) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(char **)a1;
  }
  *(void *)buf = 68289795;
  *((_WORD *)buf + 4) = 2082;
  *(void *)(buf + 10) = "";
  *((_WORD *)buf + 9) = 2081;
  *(void *)(buf + 20) = v4;
  *((_WORD *)buf + 14) = 2082;
  *(void *)(buf + 30) = "assert";
  *((_WORD *)buf + 19) = 2081;
  *((void *)buf + 5) = "serialized";
  _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Failed to serialize-append-delimited properly\", \"typename\":%{private, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
  if (a1[23] < 0) {
    operator delete(*(void **)a1);
  }
}

BOOL sub_1003A3D0C(void *a1, void *a2)
{
  __cxa_begin_catch(a1);
  if (qword_10047BED8 != -1) {
    dispatch_once(&qword_10047BED8, &stru_10045A580);
  }
  uint64_t v3 = qword_10047BEE0;
  *a2 = qword_10047BEE0;
  return os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
}

uint64_t sub_1003A3D6C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 24))();
}

void sub_1003A3D90(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)sub_1001980B4(a1, a2);
  if (!v6)
  {
    do
    {
      if (*(char *)(v4 - 1) < 0) {
        operator delete(*(void **)(v4 - 24));
      }
      v4 -= 24;
    }
    while (v4 != v2);
    uint64_t v5 = *(void **)v3;
  }
  *(void *)(v3 + 8) = v2;
  operator delete(v5);
}

void sub_1003A3DE4(uint64_t a1, void **a2, void **a3)
{
  if (*(char *)(a1 + 55) < 0) {
    operator delete(*a2);
  }
  if (*(char *)(a1 + 31) < 0)
  {
    uint64_t v5 = *a3;
    operator delete(v5);
  }
}

uint64_t sub_1003A3E40(uint64_t a1, uint64_t (***a2)(void))
{
  uint64_t v5 = a1 - 72;
  sub_10019EC54();
  do
  {
    char v6 = *v3;
    v3 -= 9;
    uint64_t result = (*v6)(v2);
    v5 -= 72;
    BOOL v8 = v2 == a2;
    uint64_t v2 = v3;
  }
  while (!v8);
  return result;
}

uint64_t sub_1003A3EA8(uint64_t a1, uint64_t (***a2)(void))
{
  uint64_t v5 = a1 - 112;
  sub_10019EC54();
  do
  {
    char v6 = *v3;
    v3 -= 14;
    uint64_t result = (*v6)(v2);
    v5 -= 112;
    BOOL v8 = v2 == a2;
    uint64_t v2 = v3;
  }
  while (!v8);
  return result;
}

uint64_t sub_1003A3F10(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1 - 824;
  uint64_t v4 = a1 - 824;
  do
  {
    sub_10019EC60();
    uint64_t result = (*v5)(v4);
    v3 -= 824;
    BOOL v7 = v4 == a2;
    v4 -= 824;
  }
  while (!v7);
  return result;
}

void sub_1003A3F78(void **a1, uint64_t a2, void **a3)
{
  uint64_t v5 = *a1;
  if (v5)
  {
    *(void *)(a2 + 40) = v5;
    operator delete(v5);
  }
  if (*(char *)(a2 + 31) < 0)
  {
    char v6 = *a3;
    operator delete(v6);
  }
}

uint64_t sub_1003A3FD4(uint64_t result, uint64_t (***a2)(void), void *a3)
{
  if ((uint64_t (***)(void))result != a2)
  {
    uint64_t v5 = result - 40;
    char v6 = (uint64_t (***)(void))(result - 40);
    BOOL v7 = (uint64_t (***)(void))(result - 40);
    do
    {
      BOOL v8 = *v7;
      v7 -= 5;
      uint64_t result = (*v8)(v6);
      v5 -= 40;
      BOOL v9 = v6 == a2;
      char v6 = v7;
    }
    while (!v9);
  }
  *a3 = a2;
  return result;
}

uint64_t sub_1003A4058()
{
  uint64_t v0 = sub_1001E0DBC();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
  {
    sub_1000A9F78();
    sub_1001E0FFC((void *)&_mh_execute_header, v1, v2, "{\"msg%{public}.0s\":\"@IndoorAvl, _readVenueBoundProtobufObjectFromZCIS, expecting that we have a valid destination for the venue bounds object we're about to read\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v3, v4, v5, v6, v18, v19, v20, v21, v22[0]);
  }

  BOOL v7 = sub_1001E0DBC();
  if (os_signpost_enabled(v7))
  {
    sub_1000A9F78();
    sub_1001E0FB8((void *)&_mh_execute_header, v7, v8, v9, "@IndoorAvl, _readVenueBoundProtobufObjectFromZCIS, expecting that we have a valid destination for the venue bounds object we're about to read", "{\"msg%{public}.0s\":\"@IndoorAvl, _readVenueBoundProtobufObjectFromZCIS, expecting that we have a valid destination for the venue bounds object we're about to read\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v22);
  }

  uint64_t v10 = sub_1001E0DBC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    sub_1000A9F78();
    sub_1001E0FDC((void *)&_mh_execute_header, v11, v12, "{\"msg%{public}.0s\":\"@IndoorAvl, _readVenueBoundProtobufObjectFromZCIS, expecting that we have a valid destination for the venue bounds object we're about to read\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v13, v14, v15, v16, v18, v19, v20, v21, v22[0]);
  }

  uint64_t result = abort_report_np();
  __break(1u);
  return result;
}

void sub_1003A419C(NSObject **a1)
{
  int v2 = sub_1001E0DBC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    sub_1000BA6CC();
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"@IndoorAvl, _readMetadataProtobufObjectsFromFile, expecting that we have a valid destination for the localizer parameters object we're about to read\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v7, 0x26u);
  }

  int v3 = sub_1001E0DBC();
  if (os_signpost_enabled(v3))
  {
    sub_1000BA6CC();
    sub_1001E0FB8((void *)&_mh_execute_header, v3, v4, v5, "@IndoorAvl, _readMetadataProtobufObjectsFromFile, expecting that we have a valid destination for the localizer parameters object we're about to read", "{\"msg%{public}.0s\":\"@IndoorAvl, _readMetadataProtobufObjectsFromFile, expecting that we have a valid destination for the localizer parameters object we're about to read\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v7);
  }

  int v6 = sub_1001E0DBC();
  *a1 = v6;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    sub_1000BA6CC();
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"@IndoorAvl, _readMetadataProtobufObjectsFromFile, expecting that we have a valid destination for the localizer parameters object we're about to read\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v7, 0x26u);
  }
}

void sub_1003A42F4()
{
  if (qword_10047BEE8 != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    if (sub_1001E11B8())
    {
      sub_1000A9F78();
      sub_1001E0FFC((void *)&_mh_execute_header, v0, v1, "{\"msg%{public}.0s\":\"@IndoorAvl, Trying to close file-handle that isn't opened\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v2, v3, v4, v5, (uint64_t)v17, v18, (uint64_t)v19, v20, v21);
      if (qword_10047BEE8 != -1) {
        dispatch_once(&qword_10047BEE8, &stru_10045FF00);
      }
    }
    if (sub_1001E124C())
    {
      sub_1000A9F78();
      sub_1001E1220((void *)&_mh_execute_header, v6, v7, v8, "@IndoorAvl, Trying to close file-handle that isn't opened", "{\"msg%{public}.0s\":\"@IndoorAvl, Trying to close file-handle that isn't opened\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v9, v10, (uint64_t)v17, v18, (uint64_t)v19, v20, v21);
      if (qword_10047BEE8 != -1) {
        dispatch_once(&qword_10047BEE8, &stru_10045FF00);
      }
    }
    if (sub_1001E11D8())
    {
      sub_1000A9F78();
      sub_1001E0FDC((void *)&_mh_execute_header, v11, v12, "{\"msg%{public}.0s\":\"@IndoorAvl, Trying to close file-handle that isn't opened\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v13, v14, v15, v16, (uint64_t)v17, v18, (uint64_t)v19, v20, v21);
    }
    uint64_t v18 = 86;
    uint64_t v19 = "close";
    uint64_t v17 = "/Library/Caches/com.apple.xbs/Sources/purpleslam/daemon/Framework/utils/avl_tile_utils.cpp";
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_10047BEE8, &stru_10045FF00);
  }
}

#error "1003A44E8: call analysis failed (funcsize=78)"

uint64_t sub_1003A45E4()
{
  sub_1001E4BB8();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_1003A4618(uint64_t *a1)
{
  if (sub_1001E4BC4(a1))
  {
    sub_1001E4BB8();
    (*(void (**)(void))(v1 + 8))();
  }
  sub_1001E4BE0();
}

uint64_t sub_1003A4674(uint64_t *a1)
{
  if (sub_1001E4BC4(a1))
  {
    sub_1001E4BB8();
    (*(void (**)(void))(v1 + 8))();
  }
  uint64_t result = sub_1001E4BD4();
  if (result)
  {
    sub_1001E4BB8();
    return (*(uint64_t (**)(void))(v3 + 8))();
  }
  return result;
}

uint64_t sub_1003A46E4(uint64_t *a1, uint64_t *a2)
{
  if (sub_1001E4BC4(a1))
  {
    sub_1001E4BB8();
    (*(void (**)(void))(v3 + 8))();
  }
  uint64_t v4 = *a2;
  *a2 = 0;
  if (v4)
  {
    sub_1001E4BB8();
    (*(void (**)(void))(v5 + 8))();
  }
  uint64_t result = sub_1001E4BD4();
  if (result)
  {
    sub_1001E4BB8();
    return (*(uint64_t (**)(void))(v7 + 8))();
  }
  return result;
}

void sub_1003A4784(uint64_t *a1, uint64_t *a2)
{
  if (sub_1001E4BC4(a1))
  {
    sub_1001E4BB8();
    (*(void (**)(void))(v3 + 8))();
  }
  uint64_t v4 = *a2;
  *a2 = 0;
  if (v4)
  {
    sub_1001E4BB8();
    (*(void (**)(void))(v5 + 8))();
  }
  sub_1001E4BE0();
}

void sub_1003A4810(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  if (sub_1001E4BC4(a1))
  {
    sub_1001E4BB8();
    (*(void (**)(void))(v5 + 8))();
  }
  uint64_t v6 = *a2;
  *a2 = 0;
  if (v6)
  {
    sub_1001E4BB8();
    (*(void (**)(void))(v7 + 8))();
  }
  uint64_t v8 = *a3;
  *a3 = 0;
  if (v8)
  {
    sub_1001E4BB8();
    (*(void (**)(void))(v9 + 8))();
  }
  sub_1001E4BE0();
}

void sub_1003A48D4(void **a1, char *a2, void **a3)
{
  uint64_t v5 = (char *)*a1;
  uint64_t v6 = a2;
  if (v5 != a2)
  {
    do
    {
      uint64_t v8 = (std::__shared_weak_count *)*((void *)v5 - 1);
      if (v8 && !atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
      v5 -= 16;
    }
    while (v5 != a2);
    uint64_t v6 = *a3;
  }
  *a1 = a2;

  operator delete(v6);
}

uint64_t sub_1003A4988(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 8))(a1);
}

void sub_1003A49C0(uint64_t a1, uint64_t a2)
{
  do
  {
    uint64_t v4 = *(std::__shared_weak_count **)(a1 - 16);
    if (v4)
    {
      if (!atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
    a1 -= 80;
  }
  while (a1 != a2);
}

void sub_1003A4A40(std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

#error "1003A4B24: call analysis failed (funcsize=71)"

void sub_1003A4C10(char *a1, uint64_t a2, NSObject *a3)
{
  if (a1[23] >= 0) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(char **)a1;
  }
  *(void *)a2 = 68289795;
  *(_WORD *)(a2 + 8) = 2082;
  *(void *)(a2 + 10) = "";
  *(_WORD *)(a2 + 18) = 2082;
  *(void *)(a2 + 20) = v4;
  *(_WORD *)(a2 + 28) = 2082;
  *(void *)(a2 + 30) = "assert";
  *(_WORD *)(a2 + 38) = 2081;
  *(void *)(a2 + 40) = "currentVersion.dbOkForVersion(gDbVersion)";
  sub_10021E890((void *)&_mh_execute_header, a2, a3, "{\"msg%{public}.0s\":\"Migration is not supported\", \"version\":%{public, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", (uint8_t *)a2);
  if (a1[23] < 0) {
    operator delete(*(void **)a1);
  }
}

void sub_1003A4CB8(uint64_t a1, uint64_t a2)
{
  sub_10021E8E0(1.7165e-36, a1, a2);
  sub_10021E914(v2, v3);
  *(_WORD *)(v4 + 28) = v5;
  *(void *)(v4 + 30) = "assert";
  *(_WORD *)(v4 + 38) = v6;
  *(void *)(v4 + 40) = "!result";
  sub_10021E890((void *)&_mh_execute_header, v4, v7, "{\"msg%{public}.0s\":\"Multiple matches for resource\", \"resource\":%{private, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v8);
}

void sub_1003A4D1C(uint64_t a1, uint64_t a2)
{
  sub_10021E8E0(1.7165e-36, a1, a2);
  sub_10021E914(v2, v3);
  *(_WORD *)(v4 + 28) = v5;
  *(void *)(v4 + 30) = "assert";
  *(_WORD *)(v4 + 38) = v6;
  *(void *)(v4 + 40) = "current.is_initialized()";
  sub_10021E890((void *)&_mh_execute_header, v4, v7, "{\"msg%{public}.0s\":\"couldn't find resource in db\", \"locationId\":%{private, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v8);
}

uint64_t sub_1003A4D80(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = *a2;
  if (*a2 == a3) {
    return (*(uint64_t (**)(uint64_t))(*(void *)a3 + 32))(a3);
  }
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 40))(result);
  }
  return result;
}

uint64_t sub_1003A4DEC(uint64_t result)
{
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 40))(result);
  }
  return result;
}

#error "1003A4E9C: call analysis failed (funcsize=71)"

#error "1003A50BC: call analysis failed (funcsize=92)"

void sub_1003A513C(int a1)
{
  if (a1)
  {
    if (qword_10047BF08 != -1) {
      dispatch_once(&qword_10047BF08, &stru_100460658);
    }
    if (os_log_type_enabled((os_log_t)qword_10047BF10, OS_LOG_TYPE_ERROR)) {
      sub_10021E8F4((void *)&_mh_execute_header, v1, v2, "Failed to close blob (error %{public}d)", v3, v4, v5, v6, 0);
    }
  }
}

void sub_1003A51F8(void **a1, char *a2, void **a3)
{
  uint64_t v5 = (char *)*a1;
  uint64_t v6 = a2;
  if (v5 != a2)
  {
    do
    {
      uint64_t v8 = (std::__shared_weak_count *)*((void *)v5 - 1);
      if (v8 && !atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
      v5 -= 16;
    }
    while (v5 != a2);
    uint64_t v6 = *a3;
  }
  *a1 = a2;
  operator delete(v6);
}

uint64_t sub_1003A52A0(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 32))(a1);
}

uint64_t sub_1003A52D8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

uint64_t sub_1003A52FC(uint64_t (***a1)(void), uint64_t (***a2)(void))
{
  uint64_t v3 = a1;
  uint64_t v4 = a1;
  do
  {
    uint64_t result = (**v4)(v4);
    v4 += 240;
    v3 += 240;
  }
  while (v4 != a2);
  return result;
}

void sub_1003A5364(void **a1)
{
  uint64_t v1 = (char *)*a1;
  if (*a1)
  {
    uint64_t v3 = (char *)a1[1];
    uint64_t v4 = *a1;
    if (v3 != v1)
    {
      uint64_t v5 = v3 - 168;
      do
      {
        int v6 = *((_DWORD *)v3 - 44);
        if (v6 == v6 >> 31)
        {
          if (*(v3 - 128)) {
            *(v3 - 128) = 0;
          }
        }
        else
        {
          uint64_t v7 = *((void *)v3 - 21);
          if (v6 < 0)
          {
            if (v7) {
              (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
            }
          }
          else
          {
            (*(void (**)(char *))v7)(v3 - 168);
          }
        }
        v3 -= 208;
        v5 -= 208;
      }
      while (v3 != v1);
      uint64_t v4 = *a1;
    }
    a1[1] = v1;
    operator delete(v4);
  }
}

void sub_1003A545C(void **a1, char *a2, void **a3)
{
  uint64_t v5 = (char *)*a1;
  int v6 = a2;
  if (v5 != a2)
  {
    uint64_t v8 = v5 - 168;
    do
    {
      int v9 = *((_DWORD *)v5 - 44);
      if (v9 == v9 >> 31)
      {
        if (*(v5 - 128)) {
          *(v5 - 128) = 0;
        }
      }
      else
      {
        uint64_t v10 = *((void *)v5 - 21);
        if (v9 < 0)
        {
          if (v10) {
            (*(void (**)(uint64_t))(*(void *)v10 + 8))(v10);
          }
        }
        else
        {
          (*(void (**)(char *))v10)(v5 - 168);
        }
      }
      v5 -= 208;
      v8 -= 208;
    }
    while (v5 != a2);
    int v6 = *a3;
  }
  *a1 = a2;

  operator delete(v6);
}

uint64_t sub_1003A554C(void **a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  if (v3)
  {
    *(void *)(a2 + 376) = v3;
    operator delete(v3);
  }
  return nullsub_94(a2 + 336);
}

void sub_1003A5584(uint64_t a1, unsigned char *a2)
{
  uint64_t v3 = *(void *)(a1 + 400);
  if (v3)
  {
    uint64_t v5 = *(void *)(a1 + 408);
    int v6 = *(void **)(a1 + 400);
    if (v5 != v3)
    {
      do
      {
        uint64_t v7 = v5 - 40;
        nullsub_94(v5 - 32);
        uint64_t v5 = v7;
      }
      while (v7 != v3);
      int v6 = *(void **)(a1 + 400);
    }
    *(void *)(a1 + 408) = v3;
    operator delete(v6);
  }
  *a2 = 0;
}

void sub_1003A55F0(std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    sub_1001E4BB8();
    (*(void (**)(void))(v2 + 16))();
    std::__shared_weak_count::__release_weak(a1);
  }
}

void sub_1003A5648(_DWORD *a1)
{
  sub_100245B90();
  if (!v4) {
    dispatch_once(&qword_10047BED8, &stru_100462220);
  }
  if (sub_100245BC4())
  {
    sub_1000BA6CC();
    sub_100245BE4((void *)&_mh_execute_header, v1, v5, "{\"msg%{public}.0s\":\"Pretty sure we can't have 0 dBm + 0.5 dB readings saved into goodScansOnly...?\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v11);
    sub_100245B90();
    if (!v4) {
      dispatch_once(&qword_10047BED8, &stru_100462220);
    }
  }
  int v6 = *(NSObject **)(v2 + 3808);
  if (os_signpost_enabled(v6))
  {
    sub_1000BA6CC();
    sub_1001E0FB8((void *)&_mh_execute_header, v6, v7, v8, "Pretty sure we can't have 0 dBm + 0.5 dB readings saved into goodScansOnly...?", "{\"msg%{public}.0s\":\"Pretty sure we can't have 0 dBm + 0.5 dB readings saved into goodScansOnly...?\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v11);
    sub_100245B90();
    if (!v4) {
      dispatch_once(&qword_10047BED8, &stru_100462220);
    }
  }
  int v9 = *(NSObject **)(v2 + 3808);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    sub_1000BA6CC();
    sub_100245C08((void *)&_mh_execute_header, v9, v10, "{\"msg%{public}.0s\":\"Pretty sure we can't have 0 dBm + 0.5 dB readings saved into goodScansOnly...?\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v11);
  }
  *a1 = 762;
}

void sub_1003A57DC(_DWORD *a1)
{
  sub_100245B90();
  if (!v4) {
    dispatch_once(&qword_10047BED8, &stru_100462220);
  }
  if (sub_100245BC4())
  {
    sub_1000BA6CC();
    sub_100245BE4((void *)&_mh_execute_header, v1, v5, "{\"msg%{public}.0s\":\"Pretty sure we can't have 0 dBm readings saved into goodScansOnly...?\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v11);
    sub_100245B90();
    if (!v4) {
      dispatch_once(&qword_10047BED8, &stru_100462220);
    }
  }
  int v6 = *(NSObject **)(v2 + 3808);
  if (os_signpost_enabled(v6))
  {
    sub_1000BA6CC();
    sub_1001E0FB8((void *)&_mh_execute_header, v6, v7, v8, "Pretty sure we can't have 0 dBm readings saved into goodScansOnly...?", "{\"msg%{public}.0s\":\"Pretty sure we can't have 0 dBm readings saved into goodScansOnly...?\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v11);
    sub_100245B90();
    if (!v4) {
      dispatch_once(&qword_10047BED8, &stru_100462220);
    }
  }
  int v9 = *(NSObject **)(v2 + 3808);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    sub_1000BA6CC();
    sub_100245C08((void *)&_mh_execute_header, v9, v10, "{\"msg%{public}.0s\":\"Pretty sure we can't have 0 dBm readings saved into goodScansOnly...?\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v11);
  }
  *a1 = 761;
}

void sub_1003A5970(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)sub_100245B9C(a1, a2);
  if (!v7)
  {
    uint64_t v8 = v6;
    uint64_t v9 = v4 - 168;
    do
    {
      int v10 = *(_DWORD *)(v4 - 176);
      if (v10 == v10 >> 31)
      {
        if (*(unsigned char *)(v4 - 128)) {
          *(unsigned char *)(v4 - 128) = 0;
        }
      }
      else if (v10 < 0)
      {
        if (*(void *)(v4 - 168))
        {
          sub_1001E4BB8();
          (*(void (**)(void))(v13 + 8))();
        }
      }
      else
      {
        uint64_t v11 = sub_100245BB4(v4 - 168);
        v12(v11);
      }
      v4 -= 208;
      v9 -= 208;
    }
    while (v4 != v2);
    uint64_t v5 = *v8;
  }
  void *v3 = v2;

  operator delete(v5);
}

void sub_1003A5A44(void **a1)
{
  uint64_t v1 = (char *)*a1;
  if (*a1)
  {
    uint64_t v3 = (char *)a1[1];
    uint64_t v4 = *a1;
    if (v3 != v1)
    {
      uint64_t v5 = v3 - 168;
      do
      {
        int v6 = *((_DWORD *)v3 - 44);
        if (v6 == v6 >> 31)
        {
          if (*(v3 - 128)) {
            *(v3 - 128) = 0;
          }
        }
        else if (v6 < 0)
        {
          if (*((void *)v3 - 21))
          {
            sub_1001E4BB8();
            (*(void (**)(void))(v9 + 8))();
          }
        }
        else
        {
          uint64_t v7 = sub_100245BB4((uint64_t)(v3 - 168));
          v8(v7);
        }
        v3 -= 208;
        v5 -= 208;
      }
      while (v3 != v1);
      uint64_t v4 = *a1;
    }
    a1[1] = v1;
    operator delete(v4);
  }
}

void sub_1003A5B30()
{
  if (qword_10047BED8 != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    uint64_t v0 = qword_10047BEE0;
    if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_FAULT))
    {
      sub_1000A9F78();
      sub_100245BE4((void *)&_mh_execute_header, v0, v1, "{\"msg%{public}.0s\":\"The outdoorLocation is none. This shouldn't happen.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v7);
      if (qword_10047BED8 != -1) {
        dispatch_once(&qword_10047BED8, &stru_100462220);
      }
    }
    uint64_t v2 = qword_10047BEE0;
    if (os_signpost_enabled((os_log_t)qword_10047BEE0))
    {
      sub_1000A9F78();
      sub_1001E0FB8((void *)&_mh_execute_header, v2, v3, v4, "The outdoorLocation is none. This shouldn't happen.", "{\"msg%{public}.0s\":\"The outdoorLocation is none. This shouldn't happen.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v7);
      if (qword_10047BED8 != -1) {
        dispatch_once(&qword_10047BED8, &stru_100462220);
      }
    }
    uint64_t v5 = qword_10047BEE0;
    if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO))
    {
      sub_1000A9F78();
      sub_100245C08((void *)&_mh_execute_header, v5, v6, "{\"msg%{public}.0s\":\"The outdoorLocation is none. This shouldn't happen.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v7);
    }
    abort_report_np();
    __break(1u);
LABEL_11:
    dispatch_once(&qword_10047BED8, &stru_100462220);
  }
}

void sub_1003A5CE4(char a1)
{
  if ((a1 & 1) == 0) {
    dispatch_once(&qword_10047BED8, &stru_100462220);
  }
  uint64_t v1 = qword_10047BEE0;
  if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_FAULT))
  {
    sub_10021E7E0();
    sub_100245BE4((void *)&_mh_execute_header, v1, v2, "{\"msg%{public}.0s\":\"All pose estimates must have a timestamp!\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v9);
    sub_100245B90();
    if (!v3) {
      dispatch_once(&qword_10047BED8, &stru_100462220);
    }
  }
  uint64_t v4 = qword_10047BEE0;
  if (os_signpost_enabled((os_log_t)qword_10047BEE0))
  {
    sub_10021E7E0();
    sub_1001E0FB8((void *)&_mh_execute_header, v4, v5, v6, "All pose estimates must have a timestamp!", "{\"msg%{public}.0s\":\"All pose estimates must have a timestamp!\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v9);
    sub_100245B90();
    if (!v3) {
      dispatch_once(&qword_10047BED8, &stru_100462220);
    }
  }
  uint64_t v7 = qword_10047BEE0;
  if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO))
  {
    sub_10021E7E0();
    sub_100245C08((void *)&_mh_execute_header, v7, v8, "{\"msg%{public}.0s\":\"All pose estimates must have a timestamp!\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v9);
  }
}

uint64_t sub_1003A5E78(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1 - 760;
  uint64_t v4 = a1 - 760;
  do
  {
    sub_100245BFC();
    uint64_t result = v5();
    v3 -= 760;
    BOOL v7 = v4 == a2;
    v4 -= 760;
  }
  while (!v7);
  return result;
}

void sub_1003A5EE0(uint64_t a1, char *a2)
{
  uint64_t v4 = *(char **)(a1 + 8);
  uint64_t v5 = a2;
  if (v4 != a2)
  {
    uint64_t v6 = v4 - 760;
    BOOL v7 = v4 - 760;
    do
    {
      sub_100245BFC();
      v8();
      v6 -= 760;
      BOOL v9 = v7 == a2;
      v7 -= 760;
    }
    while (!v9);
    uint64_t v5 = *(char **)a1;
  }
  *(void *)(a1 + 8) = a2;
  operator delete(v5);
}

uint64_t sub_1003A5F68(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = a1;
  do
  {
    sub_100245BFC();
    uint64_t result = v5();
    v4 += 760;
    v3 += 760;
  }
  while (v4 != a2);
  return result;
}

void sub_1003A5FCC(uint64_t a1)
{
  uint64_t v4 = sub_100249244(a1);
  if (!v5)
  {
    uint64_t v6 = (std::__shared_weak_count *)v4;
    (*(void (**)(uint64_t))(*(void *)v4 + 16))(v4);
    std::__shared_weak_count::__release_weak(v6);
  }
  *(void *)uint64_t v1 = v3;
  *(_DWORD *)(v1 + 8) = v2;
}

void sub_1003A6030(uint64_t a1, uint64_t a2)
{
  do
  {
    uint64_t v4 = *(std::__shared_weak_count **)(a1 + 64);
    if (v4)
    {
      if (!atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
    a1 += 80;
  }
  while (a1 != a2);
}

void sub_1003A60B0(uint64_t a1)
{
  uint64_t v1 = sub_100162E78(a1);
  if (!v2)
  {
    uint64_t v3 = (std::__shared_weak_count *)v1;
    (*(void (**)(uint64_t))(*(void *)v1 + 16))(v1);
    std::__shared_weak_count::__release_weak(v3);
  }
}

uint64_t sub_1003A6104(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result) {
    sub_100253B98();
  }
  return result;
}

uint64_t sub_1003A6124()
{
  sub_1001E4BB8();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_1003A6158(void **__p)
{
  do
  {
    uint64_t v2 = __p;
    __p = (void **)*__p;
    uint64_t v3 = (std::__shared_weak_count *)v2[3];
    if (v3)
    {
      if (!atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        sub_10025CA74();
        v4();
        std::__shared_weak_count::__release_weak(v3);
      }
    }
    operator delete(v2);
  }
  while (__p);
}

void sub_1003A61D8(void **__p)
{
  do
  {
    uint64_t v2 = (void **)*__p;
    uint64_t v3 = __p[5];
    if (v3)
    {
      do
      {
        uint64_t v4 = (void *)*v3;
        operator delete(v3);
        uint64_t v3 = v4;
      }
      while (v4);
    }
    uint64_t v5 = __p[3];
    __p[3] = 0;
    if (v5) {
      operator delete(v5);
    }
    operator delete(__p);
    __p = v2;
  }
  while (v2);
}

void sub_1003A623C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)sub_10025CA5C(a1, a2);
  if (!v7)
  {
    uint64_t v8 = v6;
    do
    {
      BOOL v9 = *(std::__shared_weak_count **)(v4 - 8);
      if (v9 && !atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        sub_10025CA74();
        v10();
        std::__shared_weak_count::__release_weak(v9);
      }
      v4 -= 16;
    }
    while (v4 != v2);
    uint64_t v5 = *v8;
  }
  void *v3 = v2;

  operator delete(v5);
}

void sub_1003A62DC()
{
  sub_10025EAC8();
  do
  {
    uint64_t v3 = *(std::__shared_weak_count **)(v1 + 64);
    if (v3)
    {
      if (!atomic_fetch_add(&v3->__shared_owners_, v2))
      {
        uint64_t v4 = sub_100162E98();
        v5(v4);
        std::__shared_weak_count::__release_weak(v3);
      }
    }
    v1 += 80;
  }
  while (v1 != v0);
}

void sub_1003A6354(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 8);
  if (v2)
  {
    *(void *)(a1 + 16) = v2;
    operator delete(v2);
  }
}

uint64_t sub_1003A637C(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 8))(a1);
}

uint64_t sub_1003A63B4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

void sub_1003A63D8(uint64_t a1, char *a2)
{
  uint64_t v4 = *(char **)(a1 + 8);
  uint64_t v5 = a2;
  if (v4 != a2)
  {
    uint64_t v6 = v4 - 168;
    do
    {
      int v7 = *((_DWORD *)v4 - 44);
      if (v7 == v7 >> 31)
      {
        if (*(v4 - 128)) {
          *(v4 - 128) = 0;
        }
      }
      else
      {
        uint64_t v8 = *((void *)v4 - 21);
        if (v7 < 0)
        {
          if (v8) {
            (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
          }
        }
        else
        {
          (*(void (**)(char *))v8)(v4 - 168);
        }
      }
      v4 -= 208;
      v6 -= 208;
    }
    while (v4 != a2);
    uint64_t v5 = *(char **)a1;
  }
  *(void *)(a1 + 8) = a2;
  operator delete(v5);
}

void sub_1003A64B0(std::__shared_weak_count **a1, std::__shared_weak_count **a2)
{
  uint64_t v3 = *a1;
  if (*a1 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
  uint64_t v4 = *a2;
  if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
}

void sub_1003A6578(void **a1, char *a2, void **a3)
{
  uint64_t v5 = (char *)*a1;
  uint64_t v6 = a2;
  if (v5 != a2)
  {
    uint64_t v8 = v5;
    do
    {
      int v9 = *(v8 - 24);
      v8 -= 24;
      if (v9)
      {
        int v10 = (std::__shared_weak_count *)*((void *)v5 - 1);
        if (v10 && !atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
          std::__shared_weak_count::__release_weak(v10);
        }
        *(v5 - 24) = 0;
      }
      uint64_t v5 = v8;
    }
    while (v8 != a2);
    uint64_t v6 = *a3;
  }
  *a1 = a2;

  operator delete(v6);
}

uint64_t sub_1003A6644(uint64_t *a1)
{
  uint64_t result = *a1;
  *a1 = 0;
  if (result)
  {
    sub_10028F4E0(result);
    operator delete();
  }
  return result;
}

void sub_1003A6694(uint64_t a1, unsigned char *a2)
{
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 24);
  if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
  *a2 = 0;
}

void sub_1003A6700()
{
  sub_10025EAC8();
  do
  {
    unint64_t v2 = *(std::__shared_weak_count **)(v1 + 64);
    if (v2)
    {
      sub_10028FA18();
      if (!v3)
      {
        sub_100162EB8();
        uint64_t v4 = sub_100162E98();
        v5(v4);
        std::__shared_weak_count::__release_weak(v2);
      }
    }
    v1 += 80;
  }
  while (v1 != v0);
}

void sub_1003A6768(std::__shared_weak_count *a1, uint64_t a2, int a3, uint64_t a4)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
  *(void *)a4 = a2;
  *(_DWORD *)(a4 + 8) = a3;
}

void sub_1003A67E0(std::__shared_weak_count **a1)
{
  uint64_t v1 = *a1;
  if (*a1)
  {
    if (!atomic_fetch_add(&v1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
  }
}

void sub_1003A6844(uint64_t a1)
{
  uint64_t v1 = sub_100162E78(a1);
  if (!v2)
  {
    uint64_t v3 = (std::__shared_weak_count *)v1;
    sub_1001E4BB8();
    (*(void (**)(void))(v4 + 16))();
    std::__shared_weak_count::__release_weak(v3);
  }
}

void sub_1003A6894(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v7 = sub_100162E78(a1);
  if (!v8)
  {
    int v9 = (std::__shared_weak_count *)v7;
    sub_1001E4BB8();
    (*(void (**)(void))(v10 + 16))();
    std::__shared_weak_count::__release_weak(v9);
  }
  *(void *)a4 = a2;
  *(_DWORD *)(a4 + 8) = a3;
}

void sub_1003A6900()
{
  if (qword_10047BF08 != -1) {
    dispatch_once(&qword_10047BF08, &stru_100463950);
  }
  uint64_t v0 = qword_10047BF10;
  if (os_log_type_enabled((os_log_t)qword_10047BF10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Unexpected exception type - rolling back", v1, 2u);
  }
}

void sub_1003A698C()
{
}

void sub_1003A69B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)sub_10029B8BC(a1, a2);
  if (!v6)
  {
    uint64_t v7 = v5 - 56;
    uint64_t v8 = (void (***)(void))(v5 - 56);
    int v9 = (void (***)(void))(v5 - 56);
    do
    {
      uint64_t v10 = *v9;
      v9 -= 7;
      (*v10)(v8);
      v7 -= 56;
      BOOL v6 = v8 == v2;
      uint64_t v8 = v9;
    }
    while (!v6);
    uint64_t v4 = *(void **)v3;
  }
  *(void *)(v3 + 8) = v2;

  operator delete(v4);
}

void sub_1003A6A44(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)sub_10029B8BC(a1, a2);
  if (!v6)
  {
    uint64_t v7 = v5 - 56;
    uint64_t v8 = (void (***)(void))(v5 - 56);
    int v9 = (void (***)(void))(v5 - 56);
    do
    {
      uint64_t v10 = *v9;
      v9 -= 7;
      (*v10)(v8);
      v7 -= 56;
      BOOL v6 = v8 == v2;
      uint64_t v8 = v9;
    }
    while (!v6);
    uint64_t v4 = *(void **)v3;
  }
  *(void *)(v3 + 8) = v2;
  operator delete(v4);
}

void (***sub_1003A6AC8(void (***a1)(void), void (***a2)(void)))(void)
{
  uint64_t v3 = a1;
  uint64_t v4 = a1;
  do
  {
    uint64_t v5 = *v4;
    v4 += 7;
    (*v5)();
    v3 += 7;
    uint64_t result = v4;
  }
  while (v4 != a2);
  return result;
}

uint64_t sub_1003A6B2C(uint64_t a1, uint64_t (***a2)(void))
{
  uint64_t v3 = a1 - 56;
  uint64_t v4 = (uint64_t (***)(void))(a1 - 56);
  uint64_t v5 = (uint64_t (***)(void))(a1 - 56);
  do
  {
    BOOL v6 = *v5;
    v5 -= 7;
    uint64_t result = (*v6)(v4);
    v3 -= 56;
    BOOL v8 = v4 == a2;
    uint64_t v4 = v5;
  }
  while (!v8);
  return result;
}

void sub_1003A6B98(uint64_t a1)
{
  uint64_t v1 = sub_100162E78(a1);
  if (!v2)
  {
    uint64_t v3 = (std::__shared_weak_count *)v1;
    (*(void (**)(uint64_t))(*(void *)v1 + 16))(v1);
    std::__shared_weak_count::__release_weak(v3);
  }
}

void sub_1003A6C04(uint64_t a1, void *__p)
{
  if (*(unsigned char *)(a1 + 16))
  {
    sub_100074A24(__p + 4);
    uint64_t v3 = (std::__shared_weak_count *)__p[3];
    if (v3)
    {
      if (!atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
        std::__shared_weak_count::__release_weak(v3);
      }
    }
  }
  operator delete(__p);
}

void sub_1003A6C84(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 8);
  if (v2)
  {
    *(void *)(a1 + 16) = v2;
    operator delete(v2);
  }
  *(unsigned char *)a1 = 0;
}

void (***sub_1003A6CB8(void (***a1)(void), void (***a2)(void)))(void)
{
  uint64_t v3 = a1;
  uint64_t v4 = a1;
  do
  {
    uint64_t v5 = *v4;
    v4 += 20;
    (*v5)();
    v3 += 20;
    uint64_t result = v4;
  }
  while (v4 != a2);
  return result;
}

uint64_t sub_1003A6D1C()
{
  sub_1002B6600();
  do
  {
    uint64_t v4 = *v3;
    v3 -= 20;
    uint64_t result = (*v4)(v1);
    v2 -= 160;
    BOOL v6 = v1 == v0;
    uint64_t v1 = v3;
  }
  while (!v6);
  return result;
}

uint64_t sub_1003A6D7C()
{
  sub_1001E4BB8();
  return (*(uint64_t (**)(void))(v0 + 32))();
}

uint64_t sub_1003A6DB0(uint64_t result)
{
  if (result)
  {
    sub_1001E4BB8();
    return (*(uint64_t (**)(void))(v1 + 40))();
  }
  return result;
}

uint64_t sub_1003A6DEC(uint64_t result)
{
  if (result)
  {
    sub_1001E4BB8();
    return (*(uint64_t (**)(void))(v1 + 40))();
  }
  return result;
}

int *sub_1003A6E28(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = 0;
  if (v2)
  {
    sub_1001E4BB8();
    (*(void (**)(void))(v3 + 8))();
  }
  return sub_100052AEC((int *)a1);
}

void sub_1003A6E84(void **a1, char *a2, void **a3)
{
  uint64_t v5 = (char *)*a1;
  BOOL v6 = a2;
  if (v5 != a2)
  {
    BOOL v8 = v5;
    do
    {
      uint64_t v10 = (void *)*((void *)v8 - 3);
      v8 -= 24;
      int v9 = v10;
      if (v10)
      {
        *((void *)v5 - 2) = v9;
        operator delete(v9);
      }
      uint64_t v5 = v8;
    }
    while (v8 != a2);
    BOOL v6 = *a3;
  }
  *a1 = a2;

  operator delete(v6);
}

uint64_t sub_1003A6EFC(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 8))(a1);
}

uint64_t sub_1003A6F34()
{
  sub_100316FEC();
  do
  {
    uint64_t v2 = *v1;
    v1 += 9;
    (*v2)();
    v0 += 72;
    uint64_t result = sub_100316FFC();
  }
  while (!v4);
  return result;
}

uint64_t sub_1003A6F8C()
{
  sub_100316FEC();
  do
  {
    uint64_t v2 = *v1;
    v1 += 14;
    (*v2)();
    v0 += 112;
    uint64_t result = sub_100316FFC();
  }
  while (!v4);
  return result;
}

void (***sub_1003A6FE4(void (***a1)(void), void (***a2)(void)))(void)
{
  uint64_t v3 = a1;
  char v4 = a1;
  do
  {
    uint64_t v5 = *v4;
    v4 += 5;
    (*v5)();
    v3 += 5;
    uint64_t result = v4;
  }
  while (v4 != a2);
  return result;
}

void sub_1003A7048(NSObject **a1)
{
  uint64_t v2 = sub_100335D68();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    sub_1000BA6CC();
    sub_1003399E0((void *)&_mh_execute_header, v3, v4, "{\"msg%{public}.0s\":\"Wifi scanner thread is being deallocated without stopping properly\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v5, v6, v7, v8, v19[0]);
  }

  int v9 = sub_100335D68();
  if (os_signpost_enabled(v9))
  {
    sub_1000BA6CC();
    sub_1001E0FB8((void *)&_mh_execute_header, v9, v10, v11, "Wifi scanner thread is being deallocated without stopping properly", "{\"msg%{public}.0s\":\"Wifi scanner thread is being deallocated without stopping properly\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v19);
  }

  int v12 = sub_100335D68();
  *a1 = v12;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    sub_1000BA6CC();
    sub_100339A00((void *)&_mh_execute_header, v13, v14, "{\"msg%{public}.0s\":\"Wifi scanner thread is being deallocated without stopping properly\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v15, v16, v17, v18, v19[0]);
  }
}

void sub_1003A7180(NSObject **a1)
{
  uint64_t v2 = sub_100335D68();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    sub_1000BA6CC();
    sub_1003399E0((void *)&_mh_execute_header, v3, v4, "{\"msg%{public}.0s\":\"Wifi scanner thread is exiting early without proper cleanup\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v5, v6, v7, v8, v19[0]);
  }

  int v9 = sub_100335D68();
  if (os_signpost_enabled(v9))
  {
    sub_1000BA6CC();
    sub_1001E0FB8((void *)&_mh_execute_header, v9, v10, v11, "Wifi scanner thread is exiting early without proper cleanup", "{\"msg%{public}.0s\":\"Wifi scanner thread is exiting early without proper cleanup\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v19);
  }

  int v12 = sub_100335D68();
  *a1 = v12;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    sub_1000BA6CC();
    sub_100339A00((void *)&_mh_execute_header, v13, v14, "{\"msg%{public}.0s\":\"Wifi scanner thread is exiting early without proper cleanup\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v15, v16, v17, v18, v19[0]);
  }
}

uint64_t sub_1003A72B8()
{
  uint64_t v0 = sub_100335D68();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
  {
    sub_1000A9F78();
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Wi-Fi thread runLoop allocated but scanner backend not initialized\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
  }

  uint64_t v1 = sub_100335D68();
  if (os_signpost_enabled(v1))
  {
    sub_1000A9F78();
    sub_1001E0FB8((void *)&_mh_execute_header, v1, v2, v3, "Wi-Fi thread runLoop allocated but scanner backend not initialized", "{\"msg%{public}.0s\":\"Wi-Fi thread runLoop allocated but scanner backend not initialized\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf);
  }

  uint64_t v4 = sub_100335D68();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    sub_1000A9F78();
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Wi-Fi thread runLoop allocated but scanner backend not initialized\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
  }

  uint64_t result = abort_report_np();
  __break(1u);
  return result;
}

void sub_1003A741C(id *a1)
{
}

void sub_1003A7438(uint64_t a1, uint8_t *buf, os_log_t log)
{
  *(void *)buf = 68289795;
  *((_WORD *)buf + 4) = 2082;
  *(void *)(buf + 10) = "";
  *((_WORD *)buf + 9) = 2082;
  *(void *)(buf + 20) = a1;
  *((_WORD *)buf + 14) = 2082;
  *(void *)(buf + 30) = "assert";
  *((_WORD *)buf + 19) = 2081;
  *((void *)buf + 5) = "networkScan == __null || CFGetTypeID(networkScan) == CFArrayGetTypeID()";
  _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"We expect that networkScan is of type CFArray, but it's not. Memory smasher?\", \"networkScanType\":%{public, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
}

void sub_1003A74C0(void **__p)
{
  do
  {
    uint64_t v2 = (void **)*__p;
    uint64_t v3 = (id *)__p[2];
    __p[2] = 0;
    if (v3)
    {
      sub_100338BB4(v3);
      sub_1003399C0();
    }
    operator delete(__p);
    __p = v2;
  }
  while (v2);
}

uint64_t sub_1003A7508(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 8))(a1);
}

void (***sub_1003A7540(void (***a1)(void), void (***a2)(void)))(void)
{
  uint64_t v3 = a1;
  uint64_t v4 = a1;
  do
  {
    uint64_t v5 = *v4;
    v4 += 11;
    (*v5)();
    v3 += 11;
    uint64_t result = v4;
  }
  while (v4 != a2);
  return result;
}

uint64_t sub_1003A75A4(uint64_t a1, uint64_t (***a2)(void))
{
  uint64_t v3 = a1 - 88;
  uint64_t v4 = (uint64_t (***)(void))(a1 - 88);
  uint64_t v5 = (uint64_t (***)(void))(a1 - 88);
  do
  {
    uint64_t v6 = *v5;
    v5 -= 11;
    uint64_t result = (*v6)(v4);
    v3 -= 88;
    BOOL v8 = v4 == a2;
    uint64_t v4 = v5;
  }
  while (!v8);
  return result;
}

void sub_1003A7610(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
}

void sub_1003A7624()
{
  if (qword_10047BED8 != -1) {
    dispatch_once(&qword_10047BED8, &stru_100469CD0);
  }
  uint64_t v0 = qword_10047BEE0;
  if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_FAULT))
  {
    sub_10035FA90();
    sub_10035FA5C();
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Unsupported sensor type\", \"sensorType\":%{public, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v3, 0x30u);
    if (qword_10047BED8 != -1) {
      dispatch_once(&qword_10047BED8, &stru_100469CD0);
    }
  }
  uint64_t v1 = qword_10047BEE0;
  if (os_signpost_enabled((os_log_t)qword_10047BEE0))
  {
    sub_10035FA90();
    sub_10035FA5C();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v1, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Unsupported sensor type", "{\"msg%{public}.0s\":\"Unsupported sensor type\", \"sensorType\":%{public, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v3, 0x30u);
    if (qword_10047BED8 != -1) {
      dispatch_once(&qword_10047BED8, &stru_100469CD0);
    }
  }
  uint64_t v2 = qword_10047BEE0;
  if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO))
  {
    sub_10035FA90();
    sub_10035FA5C();
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Unsupported sensor type\", \"sensorType\":%{public, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v3, 0x30u);
  }
}

void sub_1003A7804(std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void sub_1003A7878(uint64_t a1, void **a2, void **a3, void **a4)
{
  if (*(char *)(a1 + 103) < 0) {
    operator delete(*a2);
  }
  if (*(char *)(a1 + 71) < 0) {
    operator delete(*a3);
  }
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*a4);
  }
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v7 = *(void **)a1;
    operator delete(v7);
  }
}

uint64_t sub_1003A7904()
{
  sub_1001E4BB8();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1003A7938()
{
  sub_1001E4BB8();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_1003A7974(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  if (v2)
  {
    *(void *)(a1 + 8) = v2;
    operator delete(v2);
  }
}

void sub_1003A799C(uint64_t a1, char *a2, void **a3)
{
  uint64_t v5 = *(char **)(a1 + 32);
  uint64_t v6 = a2;
  if (v5 != a2)
  {
    BOOL v8 = v5;
    do
    {
      uint64_t v10 = (void *)*((void *)v8 - 3);
      v8 -= 24;
      int v9 = v10;
      if (v10)
      {
        *((void *)v5 - 2) = v9;
        operator delete(v9);
      }
      uint64_t v5 = v8;
    }
    while (v8 != a2);
    uint64_t v6 = *a3;
  }
  *(void *)(a1 + 32) = a2;
  operator delete(v6);
}

void sub_1003A7A08(uint64_t a1, uint64_t a2)
{
  sub_10021E8E0(1.7165e-36, a1, a2);
  sub_10021E914(v2, v3);
  *(_WORD *)(v4 + 28) = v5;
  *(void *)(v4 + 30) = "assert";
  *(_WORD *)(v4 + 38) = v6;
  *(void *)(v4 + 40) = "[transactionsOfType count] > 0";
  _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"IndoorServiceTransactionManager: expected to have at least one transaction\", \"type\":%{private, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v8, 0x30u);
}

void sub_1003A7A78(uint64_t a1, uint64_t a2)
{
  sub_10021E8E0(1.7165e-36, a1, a2);
  sub_10021E914(v2, v3);
  *(_WORD *)(v4 + 28) = v5;
  *(void *)(v4 + 30) = "assert";
  *(_WORD *)(v4 + 38) = v6;
  *(void *)(v4 + 40) = "transactionsOfType";
  _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"IndoorServiceTransactionManager: list of transactions for this type should exist!\", \"type\":%{private, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v8, 0x30u);
}

void sub_1003A7AE8(uint64_t a1)
{
  sub_100162E78(a1);
  if (!v2)
  {
    sub_10038EF3C();
    (*(void (**)(void))(v3 + 16))();
    std::__shared_weak_count::__release_weak(v1);
  }
  sub_1001E4BE0();
}

void sub_1003A7B4C(atomic_uint *a1)
{
  uint64_t v2 = sub_10038EEFC(a1);
  if (v4)
  {
    sub_10038EF4C((uint64_t)v2, v3);
    if (*(char *)(v1 + 31) < 0) {
      operator delete(*(void **)(v1 + 8));
    }
    sub_10038EF18();
  }
  sub_1001E4BE0();
}

uint64_t sub_1003A7B9C()
{
  uint64_t v0 = sub_1003902C0();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
  {
    sub_100397500();
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Prefetcher invalidation timed out waiting for session invalidation. Waited for this many seconds: \", \"seconds\":%{public}lld, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
  }

  uint64_t v1 = sub_1003902C0();
  if (os_signpost_enabled(v1))
  {
    sub_100397500();
    sub_100397568((void *)&_mh_execute_header, v1, v2, v3, "Prefetcher invalidation timed out waiting for session invalidation. Waited for this many seconds: ", "{\"msg%{public}.0s\":\"Prefetcher invalidation timed out waiting for session invalidation. Waited for this many seconds: \", \"seconds\":%{public}lld, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf);
  }

  char v4 = sub_1003902C0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    sub_100397500();
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Prefetcher invalidation timed out waiting for session invalidation. Waited for this many seconds: \", \"seconds\":%{public}lld, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
  }

  uint64_t result = abort_report_np();
  __break(1u);
  return result;
}

void sub_1003A7D00()
{
  uint64_t v0 = sub_1003902C0();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
  {
    sub_1003974C4();
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Prefetcher invalidation timed out waiting for session reset. Waited for this many seconds: \", \"seconds\":%{public}lld, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v5, 0x30u);
  }

  uint64_t v1 = sub_1003902C0();
  if (os_signpost_enabled(v1))
  {
    sub_1003974C4();
    sub_100397568((void *)&_mh_execute_header, v1, v2, v3, "Prefetcher invalidation timed out waiting for session reset. Waited for this many seconds: ", "{\"msg%{public}.0s\":\"Prefetcher invalidation timed out waiting for session reset. Waited for this many seconds: \", \"seconds\":%{public}lld, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v5);
  }

  char v4 = sub_1003902C0();
  if (sub_10039758C(v4))
  {
    sub_1003974C4();
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Prefetcher invalidation timed out waiting for session reset. Waited for this many seconds: \", \"seconds\":%{public}lld, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v5, 0x30u);
  }
}

void sub_1003A7E4C()
{
  uint64_t v0 = sub_1003902C0();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
  {
    sub_1000BA6CC();
    sub_1003399E0((void *)&_mh_execute_header, v1, v2, "{\"msg%{public}.0s\":\"Expecting that we are not already waiting for session to be invalidated\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v3, v4, v5, v6, v20);
  }

  os_log_t v7 = sub_1003902C0();
  if (os_signpost_enabled(v7))
  {
    sub_1000BA6CC();
    sub_10039753C((void *)&_mh_execute_header, v8, v9, v10, "Expecting that we are not already waiting for session to be invalidated", "{\"msg%{public}.0s\":\"Expecting that we are not already waiting for session to be invalidated\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v11, v12, v20);
  }

  uint64_t v13 = sub_1003902C0();
  if (sub_10039758C(v13))
  {
    sub_1000BA6CC();
    sub_100339A00((void *)&_mh_execute_header, v14, v15, "{\"msg%{public}.0s\":\"Expecting that we are not already waiting for session to be invalidated\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v16, v17, v18, v19, v20);
  }
}

void sub_1003A7F70()
{
  uint64_t v0 = sub_1003902C0();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
  {
    sub_1000BA6CC();
    sub_1003399E0((void *)&_mh_execute_header, v1, v2, "{\"msg%{public}.0s\":\"Session is not valid so we can't attempt a new download task\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v3, v4, v5, v6, v20);
  }

  os_log_t v7 = sub_1003902C0();
  if (os_signpost_enabled(v7))
  {
    sub_1000BA6CC();
    sub_10039753C((void *)&_mh_execute_header, v8, v9, v10, "Session is not valid so we can't attempt a new download task", "{\"msg%{public}.0s\":\"Session is not valid so we can't attempt a new download task\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v11, v12, v20);
  }

  uint64_t v13 = sub_1003902C0();
  if (sub_10039758C(v13))
  {
    sub_1000BA6CC();
    sub_100339A00((void *)&_mh_execute_header, v14, v15, "{\"msg%{public}.0s\":\"Session is not valid so we can't attempt a new download task\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v16, v17, v18, v19, v20);
  }
}

#error "1003A8104: call analysis failed (funcsize=58)"

#error "1003A8218: call analysis failed (funcsize=58)"

#error "1003A832C: call analysis failed (funcsize=58)"

void sub_1003A83D0(uint64_t a1, uint8_t *buf, os_log_t log, void *a4)
{
  *(void *)buf = 68289795;
  *((_WORD *)buf + 4) = 2082;
  *(void *)(buf + 10) = "";
  *((_WORD *)buf + 9) = 2081;
  *(void *)(buf + 20) = a1;
  *((_WORD *)buf + 14) = 2082;
  *(void *)(buf + 30) = "assert";
  *((_WORD *)buf + 19) = 2081;
  *((void *)buf + 5) = "error == nullptr";
  _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Failed to create directory:\", \"error\":%{private, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
}

#error "1003A84D8: call analysis failed (funcsize=58)"

#error "1003A85EC: call analysis failed (funcsize=58)"

#error "1003A8700: call analysis failed (funcsize=58)"

#error "1003A8814: call analysis failed (funcsize=58)"

#error "1003A8928: call analysis failed (funcsize=58)"

#error "1003A8A3C: call analysis failed (funcsize=58)"

void sub_1003A8AE0(uint64_t a1)
{
  uint64_t v4 = sub_100249244(a1);
  if (!v5)
  {
    uint64_t v6 = (std::__shared_weak_count *)v4;
    sub_1001E4BB8();
    (*(void (**)(void))(v7 + 16))();
    std::__shared_weak_count::__release_weak(v6);
  }
  *(void *)uint64_t v1 = v3;
  *(_DWORD *)(v1 + 8) = v2;
}

void sub_1003A8B40(uint64_t a1, char *a2)
{
  uint64_t v4 = *(char **)(a1 + 8);
  uint64_t v5 = a2;
  if (v4 != a2)
  {
    uint64_t v6 = v4 - 96;
    uint64_t v7 = v4 - 96;
    uint64_t v8 = v4 - 96;
    do
    {
      uint64_t v9 = *(void (***)(char *))v8;
      v8 -= 96;
      (*v9)(v7);
      v6 -= 96;
      BOOL v10 = v7 == a2;
      uint64_t v7 = v8;
    }
    while (!v10);
    uint64_t v5 = *(char **)a1;
  }
  *(void *)(a1 + 8) = a2;
  operator delete(v5);
}

uint64_t sub_1003A8BD4(uint64_t a1, uint64_t (***a2)(void))
{
  uint64_t v3 = a1 - 96;
  uint64_t v4 = (uint64_t (***)(void))(a1 - 96);
  uint64_t v5 = (uint64_t (***)(void))(a1 - 96);
  do
  {
    uint64_t v6 = *v5;
    v5 -= 12;
    uint64_t result = (*v6)(v4);
    v3 -= 96;
    BOOL v8 = v4 == a2;
    uint64_t v4 = v5;
  }
  while (!v8);
  return result;
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return _CFCopyTypeIDDescription(type_id);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return _CFRunLoopGetMain();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

void CFRunLoopRun(void)
{
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return _CFRunLoopSourceCreate(allocator, order, context);
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

CFStringRef CFURLCreateStringByAddingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveUnescaped, CFStringRef legalURLCharactersToBeEscaped, CFStringEncoding encoding)
{
  return _CFURLCreateStringByAddingPercentEscapes(allocator, originalString, charactersToLeaveUnescaped, legalURLCharactersToBeEscaped, encoding);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return _CFUserNotificationCreateRunLoopSource(allocator, userNotification, callout, order);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MGIsDeviceOfType()
{
  return _MGIsDeviceOfType();
}

uint64_t MKBDeviceFormattedForContentProtection()
{
  return _MKBDeviceFormattedForContentProtection();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

uint64_t MKBUserTypeDeviceMode()
{
  return _MKBUserTypeDeviceMode();
}

uint64_t MobileWiFiContainsRadio()
{
  return _MobileWiFiContainsRadio();
}

void NSLog(NSString *format, ...)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return _NSSearchPathForDirectoriesInDomains(directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

CFArrayRef SCNetworkInterfaceCopyAll(void)
{
  return _SCNetworkInterfaceCopyAll();
}

CFStringRef SCNetworkInterfaceGetHardwareAddressString(SCNetworkInterfaceRef interface)
{
  return _SCNetworkInterfaceGetHardwareAddressString(interface);
}

CFStringRef SCNetworkInterfaceGetInterfaceType(SCNetworkInterfaceRef interface)
{
  return _SCNetworkInterfaceGetInterfaceType(interface);
}

CFStringRef UTTypeCopyPreferredTagWithClass(CFStringRef inUTI, CFStringRef inTagClass)
{
  return _UTTypeCopyPreferredTagWithClass(inUTI, inTagClass);
}

CFStringRef UTTypeCreatePreferredIdentifierForTag(CFStringRef inTagClass, CFStringRef inTag, CFStringRef inConformingToUTI)
{
  return _UTTypeCreatePreferredIdentifierForTag(inTagClass, inTag, inConformingToUTI);
}

uint64_t WiFiDeviceClientGetInterfaceName()
{
  return _WiFiDeviceClientGetInterfaceName();
}

uint64_t WiFiDeviceClientGetPower()
{
  return _WiFiDeviceClientGetPower();
}

uint64_t WiFiDeviceClientRegisterPowerCallback()
{
  return _WiFiDeviceClientRegisterPowerCallback();
}

uint64_t WiFiDeviceClientRegisterScanUpdateCallback()
{
  return _WiFiDeviceClientRegisterScanUpdateCallback();
}

uint64_t WiFiDeviceClientScanAsync()
{
  return _WiFiDeviceClientScanAsync();
}

uint64_t WiFiDeviceClientScanCancel()
{
  return _WiFiDeviceClientScanCancel();
}

uint64_t WiFiManagerClientCopyDevices()
{
  return _WiFiManagerClientCopyDevices();
}

uint64_t WiFiManagerClientCreate()
{
  return _WiFiManagerClientCreate();
}

uint64_t WiFiManagerClientGetPower()
{
  return _WiFiManagerClientGetPower();
}

uint64_t WiFiManagerClientRegisterDeviceAttachmentCallback()
{
  return _WiFiManagerClientRegisterDeviceAttachmentCallback();
}

uint64_t WiFiManagerClientRegisterServerRestartCallback()
{
  return _WiFiManagerClientRegisterServerRestartCallback();
}

uint64_t WiFiManagerClientScheduleWithRunLoop()
{
  return _WiFiManagerClientScheduleWithRunLoop();
}

uint64_t WiFiManagerClientSetType()
{
  return _WiFiManagerClientSetType();
}

uint64_t WiFiManagerClientUnscheduleFromRunLoop()
{
  return _WiFiManagerClientUnscheduleFromRunLoop();
}

uint64_t WiFiNetworkGetProperty()
{
  return _WiFiNetworkGetProperty();
}

uint64_t WiFiNetworkIsAdHoc()
{
  return _WiFiNetworkIsAdHoc();
}

uint64_t WiFiNetworkIsApplePersonalHotspot()
{
  return _WiFiNetworkIsApplePersonalHotspot();
}

uint64_t WiFiNetworkIsCaptive()
{
  return _WiFiNetworkIsCaptive();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFCopySystemVersionDictionary()
{
  return __CFCopySystemVersionDictionary();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t CNTimeSpan::SetTimeSpan(CNTimeSpan *this, uint64_t a2, double a3)
{
  return CNTimeSpan::SetTimeSpan(this, a2, a3);
}

uint64_t cnrotation::CNRotation::Normalize(cnrotation::CNRotation *a1, const cnquaternion::CNQuaternion *a2)
{
  return cnrotation::CNRotation::Normalize(a1, a2);
}

uint64_t cnrotation::CNRotation::CNRotation(cnrotation::CNRotation *a1, const cnrotation::CNRotation *a2)
{
  return cnrotation::CNRotation::CNRotation(a1, a2);
}

uint64_t cnrotation::CNRotation::CNRotation(cnrotation::CNRotation *this)
{
  return cnrotation::CNRotation::CNRotation(this);
}

uint64_t cnrotation::CNRotation::operator=()
{
  return cnrotation::CNRotation::operator=();
}

uint64_t cnrotation::Cat(cnrotation *this, const cnrotation::CNRotation *a2, const cnrotation::CNRotation *a3)
{
  return cnrotation::Cat(this, a2, a3);
}

uint64_t cnrotation::Inv(cnrotation *this, const cnrotation::CNRotation *a2)
{
  return cnrotation::Inv(this, a2);
}

uint64_t cnrotation::Slerp(cnrotation *this, const cnrotation::CNRotation *a2, const cnrotation::CNRotation *a3, double a4, cnrotation::CNRotation *a5, unsigned int a6)
{
  return cnrotation::Slerp(this, a2, a3, a4, a5, a6);
}

void cnframework::TimestampedEvent::~TimestampedEvent(cnframework::TimestampedEvent *this)
{
}

void cnnavigation::ECEFToENUJacobian::~ECEFToENUJacobian(cnnavigation::ECEFToENUJacobian *this)
{
}

void cnnavigation::ENUToECEFJacobian::~ENUToECEFJacobian(cnnavigation::ENUToECEFJacobian *this)
{
}

void cnnavigation::details::JacobianBase::~JacobianBase(cnnavigation::details::JacobianBase *this)
{
}

uint64_t cnnavigation::ECEFToLLA()
{
  return cnnavigation::ECEFToLLA();
}

uint64_t cnnavigation::LLAToECEF()
{
  return cnnavigation::LLAToECEF();
}

uint64_t cnquaternion::CNQuaternion::CNQuaternion(cnquaternion::CNQuaternion *this, double a2, double a3, double a4, double a5)
{
  return cnquaternion::CNQuaternion::CNQuaternion(this, a2, a3, a4, a5);
}

uint64_t cnquaternion::CNQuaternion::operator=()
{
  return cnquaternion::CNQuaternion::operator=();
}

uint64_t cntransformation::CNRigidTransformation::SetCovarianceMatrix()
{
  return cntransformation::CNRigidTransformation::SetCovarianceMatrix();
}

uint64_t cntransformation::CNRigidTransformation::SetTransformationMatrix()
{
  return cntransformation::CNRigidTransformation::SetTransformationMatrix();
}

uint64_t cntransformation::CNRigidTransformation::SetPpp()
{
  return cntransformation::CNRigidTransformation::SetPpp();
}

uint64_t cntransformation::CNRigidTransformation::SetPrp()
{
  return cntransformation::CNRigidTransformation::SetPrp();
}

uint64_t cntransformation::CNRigidTransformation::SetPrr()
{
  return cntransformation::CNRigidTransformation::SetPrr();
}

uint64_t cntransformation::CNRigidTransformation::CNRigidTransformation(cntransformation::CNRigidTransformation *this)
{
  return cntransformation::CNRigidTransformation::CNRigidTransformation(this);
}

uint64_t cntransformation::Cat(cntransformation *this, const cntransformation::CNRigidTransformation *a2, const cntransformation::CNRigidTransformation *a3)
{
  return cntransformation::Cat(this, a2, a3);
}

uint64_t cntransformation::Inv(cntransformation *this, const cntransformation::CNRigidTransformation *a2)
{
  return cntransformation::Inv(this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::ParseFromString()
{
  return wireless_diagnostics::google::protobuf::MessageLite::ParseFromString();
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::MergeFromCodedStream(wireless_diagnostics::google::protobuf::MessageLite *a1, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2)
{
  return wireless_diagnostics::google::protobuf::MessageLite::MergeFromCodedStream(a1, a2);
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::ParseFromCodedStream(wireless_diagnostics::google::protobuf::MessageLite *a1, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2)
{
  return wireless_diagnostics::google::protobuf::MessageLite::ParseFromCodedStream(a1, a2);
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::ParseFromZeroCopyStream()
{
  return wireless_diagnostics::google::protobuf::MessageLite::ParseFromZeroCopyStream();
}

uint64_t wireless_diagnostics::google::protobuf::DescriptorPool::generated_pool(wireless_diagnostics::google::protobuf::DescriptorPool *this)
{
  return wireless_diagnostics::google::protobuf::DescriptorPool::generated_pool(this);
}

uint64_t wireless_diagnostics::google::protobuf::DescriptorPool::InternalAddGeneratedFile(wireless_diagnostics::google::protobuf::DescriptorPool *this, const void *a2, int a3)
{
  return wireless_diagnostics::google::protobuf::DescriptorPool::InternalAddGeneratedFile(this, a2, a3);
}

uint64_t wireless_diagnostics::google::protobuf::MessageFactory::generated_factory(wireless_diagnostics::google::protobuf::MessageFactory *this)
{
  return wireless_diagnostics::google::protobuf::MessageFactory::generated_factory(this);
}

uint64_t wireless_diagnostics::google::protobuf::MessageFactory::InternalRegisterGeneratedFile()
{
  return wireless_diagnostics::google::protobuf::MessageFactory::InternalRegisterGeneratedFile();
}

uint64_t wireless_diagnostics::google::protobuf::MessageFactory::InternalRegisterGeneratedMessage()
{
  return wireless_diagnostics::google::protobuf::MessageFactory::InternalRegisterGeneratedMessage();
}

uint64_t wireless_diagnostics::google::protobuf::UnknownFieldSet::ClearFallback(wireless_diagnostics::google::protobuf::UnknownFieldSet *this)
{
  return wireless_diagnostics::google::protobuf::UnknownFieldSet::ClearFallback(this);
}

uint64_t wireless_diagnostics::google::protobuf::UnknownFieldSet::AddVarint(wireless_diagnostics::google::protobuf::UnknownFieldSet *this, int a2, unint64_t a3)
{
  return wireless_diagnostics::google::protobuf::UnknownFieldSet::AddVarint(this, a2, a3);
}

uint64_t wireless_diagnostics::google::protobuf::UnknownFieldSet::MergeFrom(wireless_diagnostics::google::protobuf::UnknownFieldSet *this, const wireless_diagnostics::google::protobuf::UnknownFieldSet *a2)
{
  return wireless_diagnostics::google::protobuf::UnknownFieldSet::MergeFrom(this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::UnknownFieldSet::UnknownFieldSet(wireless_diagnostics::google::protobuf::UnknownFieldSet *this)
{
  return wireless_diagnostics::google::protobuf::UnknownFieldSet::UnknownFieldSet(this);
}

void wireless_diagnostics::google::protobuf::UnknownFieldSet::~UnknownFieldSet(wireless_diagnostics::google::protobuf::UnknownFieldSet *this)
{
}

uint64_t wireless_diagnostics::google::protobuf::GoogleOnceInitImpl()
{
  return wireless_diagnostics::google::protobuf::GoogleOnceInitImpl();
}

uint64_t wireless_diagnostics::google::protobuf::io::FileInputStream::FileInputStream(wireless_diagnostics::google::protobuf::io::FileInputStream *this, int a2, int a3)
{
  return wireless_diagnostics::google::protobuf::io::FileInputStream::FileInputStream(this, a2, a3);
}

void wireless_diagnostics::google::protobuf::io::FileInputStream::~FileInputStream(wireless_diagnostics::google::protobuf::io::FileInputStream *this)
{
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(this);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unsigned int *a2)
{
  return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unint64_t *a2)
{
  return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::GetDirectBufferPointer(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, const void **a2, int *a3)
{
  return wireless_diagnostics::google::protobuf::io::CodedInputStream::GetDirectBufferPointer(this, a2, a3);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unsigned int *a2)
{
  return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unint64_t *a2)
{
  return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::Skip(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, int a2)
{
  return wireless_diagnostics::google::protobuf::io::CodedInputStream::Skip(this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::Refresh(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  return wireless_diagnostics::google::protobuf::io::CodedInputStream::Refresh(this);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, int a2)
{
  return wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, int a2)
{
  return wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(this, a2);
}

void wireless_diagnostics::google::protobuf::io::CodedInputStream::~CodedInputStream(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
}

uint64_t wireless_diagnostics::google::protobuf::io::FileOutputStream::Next(wireless_diagnostics::google::protobuf::io::FileOutputStream *this, void **a2, int *a3)
{
  return wireless_diagnostics::google::protobuf::io::FileOutputStream::Next(this, a2, a3);
}

uint64_t wireless_diagnostics::google::protobuf::io::FileOutputStream::Flush(wireless_diagnostics::google::protobuf::io::FileOutputStream *this)
{
  return wireless_diagnostics::google::protobuf::io::FileOutputStream::Flush(this);
}

uint64_t wireless_diagnostics::google::protobuf::io::FileOutputStream::BackUp(wireless_diagnostics::google::protobuf::io::FileOutputStream *this, int a2)
{
  return wireless_diagnostics::google::protobuf::io::FileOutputStream::BackUp(this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::FileOutputStream::FileOutputStream(wireless_diagnostics::google::protobuf::io::FileOutputStream *this, int a2, int a3)
{
  return wireless_diagnostics::google::protobuf::io::FileOutputStream::FileOutputStream(this, a2, a3);
}

void wireless_diagnostics::google::protobuf::io::FileOutputStream::~FileOutputStream(wireless_diagnostics::google::protobuf::io::FileOutputStream *this)
{
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this, unint64_t a2)
{
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64(this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this, unsigned int a2)
{
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32(this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this, unint64_t a2)
{
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64(this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteRawToArray(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this, const void *a2, int a3, unsigned __int8 *a4)
{
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteRawToArray(this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian32(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this, unsigned int a2)
{
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian32(this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian64(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this, unint64_t a2)
{
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian64(this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this, unsigned int a2)
{
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64ToArray(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this, unint64_t a2, unsigned __int8 *a3)
{
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64ToArray(this, a2, a3);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32FallbackToArray(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this, unsigned int a2, unsigned __int8 *a3)
{
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32FallbackToArray(this, a2, a3);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::CodedOutputStream()
{
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::CodedOutputStream();
}

void wireless_diagnostics::google::protobuf::io::CodedOutputStream::~CodedOutputStream(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this)
{
}

void wireless_diagnostics::google::protobuf::io::CopyingInputStream::~CopyingInputStream(wireless_diagnostics::google::protobuf::io::CopyingInputStream *this)
{
}

void wireless_diagnostics::google::protobuf::io::CopyingOutputStream::~CopyingOutputStream(wireless_diagnostics::google::protobuf::io::CopyingOutputStream *this)
{
}

uint64_t wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::CopyingInputStreamAdaptor(wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor *this, wireless_diagnostics::google::protobuf::io::CopyingInputStream *a2, int a3)
{
  return wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::CopyingInputStreamAdaptor(this, a2, a3);
}

void wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::~CopyingInputStreamAdaptor(wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor *this)
{
}

uint64_t wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::Flush(wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor *this)
{
  return wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::Flush(this);
}

uint64_t wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::CopyingOutputStreamAdaptor(wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor *this, wireless_diagnostics::google::protobuf::io::CopyingOutputStream *a2, int a3)
{
  return wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::CopyingOutputStreamAdaptor(this, a2, a3);
}

void wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor::~CopyingOutputStreamAdaptor(wireless_diagnostics::google::protobuf::io::CopyingOutputStreamAdaptor *this)
{
}

void wireless_diagnostics::google::protobuf::Message::~Message(wireless_diagnostics::google::protobuf::Message *this)
{
}

uint64_t wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage()
{
  return wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
}

void wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage(wireless_diagnostics::google::protobuf::internal::LogMessage *this)
{
}

uint64_t wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<()
{
  return wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormat::ComputeUnknownFieldsSize(wireless_diagnostics::google::protobuf::internal::WireFormat *this, const wireless_diagnostics::google::protobuf::UnknownFieldSet *a2)
{
  return wireless_diagnostics::google::protobuf::internal::WireFormat::ComputeUnknownFieldsSize(this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormat::SerializeUnknownFieldsToArray(wireless_diagnostics::google::protobuf::internal::WireFormat *this, const wireless_diagnostics::google::protobuf::UnknownFieldSet *a2, unsigned __int8 *a3)
{
  return wireless_diagnostics::google::protobuf::internal::WireFormat::SerializeUnknownFieldsToArray(this, a2, a3);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormat::SkipField(wireless_diagnostics::google::protobuf::internal::WireFormat *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2, unsigned int a3, wireless_diagnostics::google::protobuf::UnknownFieldSet *a4)
{
  return wireless_diagnostics::google::protobuf::internal::WireFormat::SkipField(this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=()
{
  return wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::ParseField(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, unsigned int a2, wireless_diagnostics::google::protobuf::io::CodedInputStream *a3, const wireless_diagnostics::google::protobuf::Message *a4, wireless_diagnostics::google::protobuf::UnknownFieldSet *a5)
{
  return wireless_diagnostics::google::protobuf::internal::ExtensionSet::ParseField(this, a2, a3, a4, a5);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::Clear(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this)
{
  return wireless_diagnostics::google::protobuf::internal::ExtensionSet::Clear(this);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::MergeFrom(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, const wireless_diagnostics::google::protobuf::internal::ExtensionSet *a2)
{
  return wireless_diagnostics::google::protobuf::internal::ExtensionSet::MergeFrom(this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::ExtensionSet(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this)
{
  return wireless_diagnostics::google::protobuf::internal::ExtensionSet::ExtensionSet(this);
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::~ExtensionSet(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this)
{
}

uint64_t wireless_diagnostics::google::protobuf::internal::ReflectionOps::Merge(wireless_diagnostics::google::protobuf::internal::ReflectionOps *this, const wireless_diagnostics::google::protobuf::Message *a2, wireless_diagnostics::google::protobuf::Message *a3)
{
  return wireless_diagnostics::google::protobuf::internal::ReflectionOps::Merge(this, a2, a3);
}

uint64_t wireless_diagnostics::google::protobuf::internal::VerifyVersion(wireless_diagnostics::google::protobuf::internal *this, int a2, int a3, const char *a4)
{
  return wireless_diagnostics::google::protobuf::internal::VerifyVersion(this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadString()
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadString();
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBytes()
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBytes();
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteFloat(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, int a2, float a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteFloat(this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt32(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, int a2, int a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt32(this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt64(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, int a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt64(this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteDouble(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, int a2, double a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteDouble(this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteSInt32(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, int a2, int a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteSInt32(this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteSInt64(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, int a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteSInt64(this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteString()
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteString();
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, int a2, unsigned int a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32(this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt64(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, int a2, unint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt64(this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteFixed64(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, int a2, unint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteFixed64(this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadPackedEnumNoInline()
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadPackedEnumNoInline();
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessageMaybeToArray(wireless_diagnostics::google::protobuf::internal::WireFormatLite *a1, int a2, const wireless_diagnostics::google::protobuf::MessageLite *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessageMaybeToArray(a1, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadBytes()
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadBytes();
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBool(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, int a2, BOOL a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBool(this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteEnum(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, int a2, int a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteEnum(this, a2, a3, a4);
}

void wireless_diagnostics::google::protobuf::internal::FunctionClosure0::~FunctionClosure0(wireless_diagnostics::google::protobuf::internal::FunctionClosure0 *this)
{
}

uint64_t wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *this, int a2)
{
  return wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase::New(wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase *this)
{
  return wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase::New(this);
}

uint64_t wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase::Delete()
{
  return wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase::Delete();
}

uint64_t wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::GeneratedMessageReflection()
{
  return wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::GeneratedMessageReflection();
}

uint64_t cnprint::CNPrinter::GetLogLevel(cnprint::CNPrinter *this)
{
  return cnprint::CNPrinter::GetLogLevel(this);
}

uint64_t cnprint::CNPrinter::Print()
{
  return cnprint::CNPrinter::Print();
}

uint64_t CNTimeSpan::operator-()
{
  return CNTimeSpan::operator-();
}

uint64_t CNTimeSpan::operator+()
{
  return CNTimeSpan::operator+();
}

uint64_t cnrotation::CNRotation::RotationMatrix(cnrotation::CNRotation *this)
{
  return cnrotation::CNRotation::RotationMatrix(this);
}

uint64_t cnrotation::CNRotation::dqdr(cnrotation::CNRotation *this)
{
  return cnrotation::CNRotation::dqdr(this);
}

uint64_t cnrotation::CNRotation::drdq(cnrotation::CNRotation *this)
{
  return cnrotation::CNRotation::drdq(this);
}

uint64_t cnrotation::CNRotation::dqaqdqa(cnrotation::CNRotation *this)
{
  return cnrotation::CNRotation::dqaqdqa(this);
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::SerializeToCodedStream(wireless_diagnostics::google::protobuf::MessageLite *this, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a2)
{
  return wireless_diagnostics::google::protobuf::MessageLite::SerializeToCodedStream(this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::SerializeToZeroCopyStream()
{
  return wireless_diagnostics::google::protobuf::MessageLite::SerializeToZeroCopyStream();
}

uint64_t wireless_diagnostics::google::protobuf::DescriptorPool::FindFileByName()
{
  return wireless_diagnostics::google::protobuf::DescriptorPool::FindFileByName();
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  return wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(this);
}

uint64_t wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::ByteCount(wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor *this)
{
  return wireless_diagnostics::google::protobuf::io::CopyingInputStreamAdaptor::ByteCount(this);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::SerializeWithCachedSizes(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, uint64_t a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return wireless_diagnostics::google::protobuf::internal::ExtensionSet::SerializeWithCachedSizes(this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::SerializeWithCachedSizesToArray(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, uint64_t a2, uint64_t a3, unsigned __int8 *a4)
{
  return wireless_diagnostics::google::protobuf::internal::ExtensionSet::SerializeWithCachedSizesToArray(this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::ByteSize(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this)
{
  return wireless_diagnostics::google::protobuf::internal::ExtensionSet::ByteSize(this);
}

const char *__cdecl std::logic_error::what(const std::logic_error *this)
{
  return std::logic_error::what(this);
}

const char *__cdecl std::runtime_error::what(const std::runtime_error *this)
{
  return std::runtime_error::what(this);
}

void std::nested_exception::rethrow_nested(const std::nested_exception *this)
{
}

std::string *__cdecl std::error_code::message(std::string *__return_ptr retstr, const std::error_code *this)
{
  return std::error_code::message(retstr, this);
}

std::string::size_type std::string::find(const std::string *this, const std::string::value_type *__s, std::string::size_type __pos, std::string::size_type __n)
{
  return std::string::find(this, __s, __pos, __n);
}

std::string::size_type std::string::find(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return std::string::find(this, __c, __pos);
}

uint64_t std::stringbuf::str()
{
  return std::stringbuf::str();
}

std::string *__cdecl std::locale::name(std::string *__return_ptr retstr, const std::locale *this)
{
  return std::locale::name(retstr, this);
}

BOOL std::locale::has_facet(const std::locale *this, std::locale::id *a2)
{
  return std::locale::has_facet(this, a2);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return std::locale::use_facet(this, a2);
}

BOOL std::locale::operator==(const std::locale *this, const std::locale *a2)
{
  return std::locale::operator==(this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return std::ios_base::getloc(this);
}

uint64_t std::time_put<char,std::ostreambuf_iterator<char>>::put()
{
  return std::time_put<char,std::ostreambuf_iterator<char>>::put();
}

void std::bad_typeid::~bad_typeid(std::bad_typeid *this)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::string *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::logic_error *a2)
{
  return std::logic_error::logic_error(this, a2);
}

void std::logic_error::~logic_error(std::logic_error *this)
{
}

void std::range_error::~range_error(std::range_error *this)
{
}

void std::domain_error::~domain_error(std::domain_error *this)
{
}

void std::length_error::~length_error(std::length_error *this)
{
}

void std::out_of_range::~out_of_range(std::out_of_range *this)
{
}

{
  std::out_of_range::~out_of_range(this);
}

void std::bad_exception::~bad_exception(std::bad_exception *this)
{
}

std::exception_ptr *__cdecl std::exception_ptr::exception_ptr(std::exception_ptr *this, const std::exception_ptr *a2)
{
  return std::exception_ptr::exception_ptr(this, a2);
}

void std::exception_ptr::~exception_ptr(std::exception_ptr *this)
{
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return std::runtime_error::runtime_error(this, a2);
}

{
  return std::runtime_error::runtime_error(this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return std::runtime_error::runtime_error(this, a2);
}

{
  return std::runtime_error::runtime_error(this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::runtime_error *a2)
{
  return std::runtime_error::runtime_error(this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
}

{
  std::runtime_error::~runtime_error(this);
}

void std::overflow_error::~overflow_error(std::overflow_error *this)
{
}

void std::underflow_error::~underflow_error(std::underflow_error *this)
{
}

{
  std::underflow_error::~underflow_error(this);
}

void std::invalid_argument::~invalid_argument(std::invalid_argument *this)
{
}

{
  std::invalid_argument::~invalid_argument(this);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

std::regex_error *__cdecl std::regex_error::regex_error(std::regex_error *this, std::regex_constants::error_type __ecode)
{
  return std::regex_error::regex_error(this, __ecode);
}

void std::this_thread::sleep_for (const std::chrono::nanoseconds *__ns)
{
}

size_t std::__next_prime(size_t __n)
{
  return std::__next_prime(__n);
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return std::string::erase(this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return std::string::append(this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return std::string::append(this, __s, __n);
}

std::string *__cdecl std::string::append(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return std::string::append(this, __n, __c);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return std::string::assign(this, __s);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return std::string::assign(this, __s, __n);
}

std::string::iterator std::string::insert(std::string *this, std::string::const_iterator __pos, std::string::value_type __c)
{
  return std::string::insert(this, __pos, __c);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return std::string::insert(this, __pos, __s);
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

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return std::string::basic_string(this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return std::string::operator=(this, __str);
}

std::string *__cdecl std::string::operator=(std::string *this, std::string::value_type __c)
{
  return std::string::operator=(this, __c);
}

std::future_error *__cdecl std::future_error::future_error(std::future_error *this, std::error_code __ec)
{
  return std::future_error::future_error(this, __ec);
}

void std::future_error::~future_error(std::future_error *this)
{
}

std::system_error *__cdecl std::system_error::system_error(std::system_error *this, int __ev, const std::error_category *__ecat)
{
  return std::system_error::system_error(this, __ev, __ecat);
}

{
  return std::system_error::system_error(this, __ev, __ecat);
}

void std::system_error::~system_error(std::system_error *this)
{
}

{
  std::system_error::~system_error(this);
}

uint64_t std::filebuf::open()
{
  return std::filebuf::open();
}

uint64_t std::filebuf::close()
{
  return std::filebuf::close();
}

uint64_t std::filebuf::basic_filebuf()
{
  return std::filebuf::basic_filebuf();
}

uint64_t std::filebuf::~filebuf()
{
  return std::filebuf::~filebuf();
}

uint64_t std::istream::get()
{
  return std::istream::get();
}

uint64_t std::istream::read()
{
  return std::istream::read();
}

uint64_t std::istream::seekg()
{
  return std::istream::seekg();
}

uint64_t std::istream::tellg()
{
  return std::istream::tellg();
}

uint64_t std::istream::~istream()
{
  return std::istream::~istream();
}

{
  return std::istream::~istream();
}

uint64_t std::istream::operator>>()
{
  return std::istream::operator>>();
}

{
  return std::istream::operator>>();
}

uint64_t std::ostream::put()
{
  return std::ostream::put();
}

uint64_t std::ostream::flush()
{
  return std::ostream::flush();
}

uint64_t std::ostream::write()
{
  return std::ostream::write();
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

{
  return std::ostream::~ostream();
}

uint64_t std::ostream::operator<<()
{
  return std::ostream::operator<<();
}

{
  return std::ostream::operator<<();
}

{
  return std::ostream::operator<<();
}

{
  return std::ostream::operator<<();
}

{
  return std::ostream::operator<<();
}

{
  return std::ostream::operator<<();
}

{
  return std::ostream::operator<<();
}

{
  return std::ostream::operator<<();
}

{
  return std::ostream::operator<<();
}

void std::__shared_count::~__shared_count(std::__shared_count *this)
{
}

uint64_t std::iostream::~basic_iostream()
{
  return std::iostream::~basic_iostream();
}

void std::error_category::~error_category(std::error_category *this)
{
}

std::regex_traits<char>::char_class_type std::__get_classname(const char *__s, BOOL __icase)
{
  return std::__get_classname(__s, __icase);
}

std::__thread_struct *__cdecl std::__thread_struct::__thread_struct(std::__thread_struct *this)
{
  return std::__thread_struct::__thread_struct(this);
}

void std::__thread_struct::~__thread_struct(std::__thread_struct *this)
{
}

uint64_t std::streambuf::basic_streambuf()
{
  return std::streambuf::basic_streambuf();
}

uint64_t std::streambuf::~streambuf()
{
  return std::streambuf::~streambuf();
}

const std::error_category *std::future_category(void)
{
  return std::future_category();
}

const std::error_category *std::system_category(void)
{
  return std::system_category();
}

const std::error_category *std::generic_category(void)
{
  return std::generic_category();
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

void std::condition_variable::wait(std::condition_variable *this, std::unique_lock<std::mutex> *__lk)
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
  return std::__shared_weak_count::lock(this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

std::__thread_specific_ptr<std::__thread_struct> *std::__thread_local_data(void)
{
  return std::__thread_local_data();
}

std::string *__cdecl std::__get_collation_name(std::string *__return_ptr retstr, const char *__s)
{
  return std::__get_collation_name(retstr, __s);
}

void std::__throw_system_error(int __ev, const char *__what_arg)
{
}

int std::stoi(const std::string *__str, size_t *__idx, int __base)
{
  return std::stoi(__str, __idx, __base);
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

uint64_t std::__sort<std::__less<char,char> &,char *>()
{
  return std::__sort<std::__less<char,char> &,char *>();
}

uint64_t std::__sort<std::__less<int,int> &,int *>()
{
  return std::__sort<std::__less<int,int> &,int *>();
}

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return std::chrono::steady_clock::now();
}

std::chrono::system_clock::time_point std::chrono::system_clock::from_time_t(time_t __t)
{
  return std::chrono::system_clock::from_time_t(__t);
}

std::chrono::system_clock::time_point std::chrono::system_clock::now(void)
{
  return std::chrono::system_clock::now();
}

time_t std::chrono::system_clock::to_time_t(const std::chrono::system_clock::time_point *__t)
{
  return std::chrono::system_clock::to_time_t(__t);
}

void std::future<void>::get(std::future<void> *this)
{
}

void std::future<void>::~future(std::future<void> *this)
{
}

void std::locale::__install_ctor(std::locale *this, const std::locale *a2, std::locale::facet *a3, uint64_t a4)
{
}

uint64_t std::locale::id::__get(std::locale::id *this)
{
  return std::locale::id::__get(this);
}

void std::locale::facet::~facet(std::locale::facet *this)
{
}

const std::locale *std::locale::classic(void)
{
  return std::locale::classic();
}

std::locale *__cdecl std::locale::locale(std::locale *this, const std::locale *a2)
{
  return std::locale::locale(this, a2);
}

std::locale *__cdecl std::locale::locale(std::locale *this)
{
  return std::locale::locale(this);
}

void std::locale::~locale(std::locale *this)
{
}

const std::locale *__cdecl std::locale::operator=(std::locale *this, const std::locale *a2)
{
  return std::locale::operator=(this, a2);
}

void std::thread::join(std::thread *this)
{
}

void std::thread::~thread(std::thread *this)
{
}

std::future<void> std::promise<void>::get_future(std::promise<void> *this)
{
  return std::promise<void>::get_future(this);
}

void std::promise<void>::set_exception(std::promise<void> *this, std::exception_ptr __p)
{
}

void std::promise<void>::set_value(std::promise<void> *this)
{
}

std::promise<void> *__cdecl std::promise<void>::promise(std::promise<void> *this)
{
  return std::promise<void>::promise(this);
}

void std::promise<void>::~promise(std::promise<void> *this)
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

std::locale std::ios_base::imbue(std::ios_base *this, const std::locale *__loc)
{
  return std::ios_base::imbue(this, __loc);
}

void std::ios_base::failure::~failure(std::ios_base::failure *this)
{
}

uint64_t std::ios::~ios()
{
  return std::ios::~ios();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, double __val)
{
  return std::to_string(retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return std::to_string(retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return std::to_string(retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, uint64_t __val)
{
  return std::to_string(retstr, __val);
}

{
  return std::to_string(retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return std::to_string(retstr, __val);
}

{
  return std::to_string(retstr, __val);
}

uint64_t std::operator+<char>()
{
  return std::operator+<char>();
}

std::bad_cast *__cdecl std::bad_cast::bad_cast(std::bad_cast *this)
{
  return std::bad_cast::bad_cast(this);
}

void std::bad_cast::~bad_cast(std::bad_cast *this)
{
}

std::bad_alloc *__cdecl std::bad_alloc::bad_alloc(std::bad_alloc *this)
{
  return std::bad_alloc::bad_alloc(this);
}

void std::bad_alloc::~bad_alloc(std::bad_alloc *this)
{
}

void std::exception::~exception(std::exception *this)
{
}

std::terminate_handler std::set_terminate(std::terminate_handler a1)
{
  return std::set_terminate(a1);
}

std::exception_ptr std::current_exception(void)
{
  return std::current_exception();
}

void std::rethrow_exception(std::exception_ptr a1)
{
}

void std::terminate(void)
{
}

void operator delete[](void *__p)
{
  while (1)
    ;
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

void *__cdecl operator new[](size_t __sz)
{
  while (1)
    ;
}

void *__cdecl operator new[](size_t __sz, const std::nothrow_t *a2)
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

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
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
  return ___cxa_allocate_exception(thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return ___cxa_atexit(lpfunc, obj, lpdso_handle);
}

void __cxa_bad_typeid(void)
{
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

char *__cxa_demangle(const char *lpmangled, char *lpout, size_t *lpoutlen, int *lpstatus)
{
  return ___cxa_demangle(lpmangled, lpout, lpoutlen, lpstatus);
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
  return ___cxa_guard_acquire((uint64_t *)a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)___dynamic_cast(lpsrc, lpstype, lpdtype, s2d);
}

int *__error(void)
{
  return ___error();
}

double __exp10(double a1)
{
  return ___exp10(a1);
}

__double2 __sincos_stret(double a1)
{
  __double2 v3 = ___sincos_stret(a1);
  double cosval = v3.__cosval;
  double sinval = v3.__sinval;
  result.__double cosval = cosval;
  result.__double sinval = sinval;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  __float2 v3 = ___sincosf_stret(a1);
  float cosval = v3.__cosval;
  float sinval = v3.__sinval;
  result.__float cosval = cosval;
  result.__float sinval = sinval;
  return result;
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return ___tolower(a1);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return __os_activity_create(dso, description, activity, flags);
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

uint64_t archive_entry_free()
{
  return _archive_entry_free();
}

uint64_t archive_entry_new()
{
  return _archive_entry_new();
}

uint64_t archive_entry_pathname()
{
  return _archive_entry_pathname();
}

uint64_t archive_entry_set_pathname()
{
  return _archive_entry_set_pathname();
}

uint64_t archive_entry_set_perm()
{
  return _archive_entry_set_perm();
}

uint64_t archive_entry_stat()
{
  return _archive_entry_stat();
}

uint64_t archive_errno()
{
  return _archive_errno();
}

uint64_t archive_error_string()
{
  return _archive_error_string();
}

uint64_t archive_filter_code()
{
  return _archive_filter_code();
}

uint64_t archive_read_close()
{
  return _archive_read_close();
}

uint64_t archive_read_disk_new()
{
  return _archive_read_disk_new();
}

uint64_t archive_read_disk_set_symlink_physical()
{
  return _archive_read_disk_set_symlink_physical();
}

uint64_t archive_read_extract2()
{
  return _archive_read_extract2();
}

uint64_t archive_read_free()
{
  return _archive_read_free();
}

uint64_t archive_read_new()
{
  return _archive_read_new();
}

uint64_t archive_read_next_header2()
{
  return _archive_read_next_header2();
}

uint64_t archive_read_open_filename()
{
  return _archive_read_open_filename();
}

uint64_t archive_read_support_filter_gzip()
{
  return _archive_read_support_filter_gzip();
}

uint64_t archive_read_support_filter_xz()
{
  return _archive_read_support_filter_xz();
}

uint64_t archive_read_support_format_raw()
{
  return _archive_read_support_format_raw();
}

uint64_t archive_read_support_format_zip()
{
  return _archive_read_support_format_zip();
}

uint64_t archive_write_add_filter_gzip()
{
  return _archive_write_add_filter_gzip();
}

uint64_t archive_write_add_filter_xz()
{
  return _archive_write_add_filter_xz();
}

uint64_t archive_write_close()
{
  return _archive_write_close();
}

uint64_t archive_write_disk_new()
{
  return _archive_write_disk_new();
}

uint64_t archive_write_disk_set_options()
{
  return _archive_write_disk_set_options();
}

uint64_t archive_write_new()
{
  return _archive_write_new();
}

uint64_t archive_write_open_filename()
{
  return _archive_write_open_filename();
}

uint64_t archive_write_set_format_zip()
{
  return _archive_write_set_format_zip();
}

long double asin(long double __x)
{
  return _asin(__x);
}

long double atan(long double __x)
{
  return _atan(__x);
}

long double atan2(long double __y, long double __x)
{
  return _atan2(__y, __x);
}

int backtrace(void **a1, int a2)
{
  return _backtrace(a1, a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return _backtrace_symbols(a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

void cblas_dgemm(const CBLAS_ORDER __Order, const CBLAS_TRANSPOSE __TransA, const CBLAS_TRANSPOSE __TransB, const int __M, const int __N, const int __K, const double __alpha, const double *__A, const int __lda, const double *__B, const int __ldb, const double __beta, double *__C, const int __ldc)
{
}

void cblas_dspr(const CBLAS_ORDER __Order, const CBLAS_UPLO __Uplo, const int __N, const double __alpha, const double *__X, const int __incX, double *__Ap)
{
}

int close(int a1)
{
  return _close(a1);
}

int closedir(DIR *a1)
{
  return _closedir(a1);
}

long double cos(long double __x)
{
  return _cos(__x);
}

int dgesvd_(char *__jobu, char *__jobvt, __CLPK_integer *__m, __CLPK_integer *__n, __CLPK_doublereal *__a, __CLPK_integer *__lda, __CLPK_doublereal *__s, __CLPK_doublereal *__u, __CLPK_integer *__ldu, __CLPK_doublereal *__vt, __CLPK_integer *__ldvt, __CLPK_doublereal *__work, __CLPK_integer *__lwork, __CLPK_integer *__info)
{
  return _dgesvd_(__jobu, __jobvt, __m, __n, __a, __lda, __s, __u, __ldu, __vt, __ldvt, __work, __lwork, __info);
}

int dgetrf_(__CLPK_integer *__m, __CLPK_integer *__n, __CLPK_doublereal *__a, __CLPK_integer *__lda, __CLPK_integer *__ipiv, __CLPK_integer *__info)
{
  return _dgetrf_(__m, __n, __a, __lda, __ipiv, __info);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
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

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return _dispatch_block_create_with_qos_class(flags, qos_class, relative_priority, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return _dispatch_get_specific(key);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
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

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

lldiv_t div(uint64_t __x, uint64_t __y)
{
  lldiv_t v4 = _div(__x, __y);
  uint64_t rem = v4.rem;
  uint64_t quot = v4.quot;
  result.uint64_t rem = rem;
  result.uint64_t quot = quot;
  return result;
}

int dladdr(const void *a1, Dl_info *a2)
{
  return _dladdr(a1, a2);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

int dpptrf_(char *__uplo, __CLPK_integer *__n, __CLPK_doublereal *__ap, __CLPK_integer *__info)
{
  return _dpptrf_(__uplo, __n, __ap, __info);
}

int dpptrs_(char *__uplo, __CLPK_integer *__n, __CLPK_integer *__nrhs, __CLPK_doublereal *__ap, __CLPK_doublereal *__b, __CLPK_integer *__ldb, __CLPK_integer *__info)
{
  return _dpptrs_(__uplo, __n, __nrhs, __ap, __b, __ldb, __info);
}

int dtptrs_(char *__uplo, char *__trans, char *__diag, __CLPK_integer *__n, __CLPK_integer *__nrhs, __CLPK_doublereal *__ap, __CLPK_doublereal *__b, __CLPK_integer *__ldb, __CLPK_integer *__info)
{
  return _dtptrs_(__uplo, __trans, __diag, __n, __nrhs, __ap, __b, __ldb, __info);
}

long double exp(long double __x)
{
  return _exp(__x);
}

int fchmod(int a1, mode_t a2)
{
  return _fchmod(a1, a2);
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

long double fmod(long double __x, long double __y)
{
  return _fmod(__x, __y);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

int fsync(int a1)
{
  return _fsync(a1);
}

int ftruncate(int a1, off_t a2)
{
  return _ftruncate(a1, a2);
}

char *__cdecl getcwd(char *a1, size_t a2)
{
  return _getcwd(a1, a2);
}

char *__cdecl getenv(const char *a1)
{
  return _getenv(a1);
}

pid_t getpid(void)
{
  return _getpid();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return _getpwnam(a1);
}

long double hypot(long double __x, long double __y)
{
  return _hypot(__x, __y);
}

int link(const char *a1, const char *a2)
{
  return _link(a1, a2);
}

long double log(long double __x)
{
  return _log(__x);
}

long double log10(long double __x)
{
  return _log10(__x);
}

void longjmp(jmp_buf a1, int a2)
{
}

off_t lseek(int a1, off_t a2, int a3)
{
  return _lseek(a1, a2, a3);
}

int lstat(const char *a1, stat *a2)
{
  return _lstat(a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

uint64_t mach_continuous_time(void)
{
  return _mach_continuous_time();
}

uint64_t mach_get_times()
{
  return _mach_get_times();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return _memchr(__s, __c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

long double nextafter(long double __x, long double __y)
{
  return _nextafter(__x, __y);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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

void objc_copyCppObjectAtomic(void *dest, const void *src, void (__cdecl *copyHelper)(void *, const void *))
{
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return _opendir(a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t pathconf(const char *a1, int a2)
{
  return _pathconf(a1, a2);
}

long double pow(long double __x, long double __y)
{
  return _pow(__x, __y);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create(a1, a2, a3, a4);
}

int pthread_setname_np(const char *a1)
{
  return _pthread_setname_np(a1);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return _pthread_setspecific(a1, a2);
}

int rand(void)
{
  return _rand();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return _readdir(a1);
}

int readdir_r(DIR *a1, dirent *a2, dirent **a3)
{
  return _readdir_r(a1, a2, a3);
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return _readlink(a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return _remove(__p, __ec);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int rmdir(const char *a1)
{
  return _rmdir(a1);
}

const char *__cdecl sel_getName(SEL sel)
{
  return _sel_getName(sel);
}

int setjmp(jmp_buf a1)
{
  return _setjmp(a1);
}

long double sin(long double __x)
{
  return _sin(__x);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return _sprintf(a1, a2);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return _sqlite3_bind_int(a1, a2, a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return _sqlite3_bind_int64(a1, a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return _sqlite3_bind_null(a1, a2);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_text(a1, a2, a3, a4, a5);
}

int sqlite3_bind_zeroblob(sqlite3_stmt *a1, int a2, int n)
{
  return _sqlite3_bind_zeroblob(a1, a2, n);
}

int sqlite3_blob_bytes(sqlite3_blob *a1)
{
  return _sqlite3_blob_bytes(a1);
}

int sqlite3_blob_close(sqlite3_blob *a1)
{
  return _sqlite3_blob_close(a1);
}

int sqlite3_blob_open(sqlite3 *a1, const char *zDb, const char *zTable, const char *zColumn, sqlite3_int64 iRow, int flags, sqlite3_blob **ppBlob)
{
  return _sqlite3_blob_open(a1, zDb, zTable, zColumn, iRow, flags, ppBlob);
}

int sqlite3_blob_read(sqlite3_blob *a1, void *Z, int N, int iOffset)
{
  return _sqlite3_blob_read(a1, Z, N, iOffset);
}

int sqlite3_blob_write(sqlite3_blob *a1, const void *z, int n, int iOffset)
{
  return _sqlite3_blob_write(a1, z, n, iOffset);
}

int sqlite3_close(sqlite3 *a1)
{
  return _sqlite3_close(a1);
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_int(a1, iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_int64(a1, iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_text(a1, iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_type(a1, iCol);
}

const char *__cdecl sqlite3_db_filename(sqlite3 *db, const char *zDbName)
{
  return _sqlite3_db_filename(db, zDbName);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return _sqlite3_errmsg(a1);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return _sqlite3_errstr(a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return _sqlite3_exec(a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_result_codes(sqlite3 *a1, int onoff)
{
  return _sqlite3_extended_result_codes(a1, onoff);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return _sqlite3_finalize(pStmt);
}

void sqlite3_free(void *a1)
{
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return _sqlite3_open_v2(filename, ppDb, flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return _sqlite3_prepare_v2(db, zSql, nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return _sqlite3_reset(pStmt);
}

const char *__cdecl sqlite3_sql(sqlite3_stmt *pStmt)
{
  return _sqlite3_sql(pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return _sqlite3_step(a1);
}

int sqlite3_wal_checkpoint_v2(sqlite3 *db, const char *zDb, int eMode, int *pnLog, int *pnCkpt)
{
  return _sqlite3_wal_checkpoint_v2(db, zDb, eMode, pnLog, pnCkpt);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return _statfs(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return _strncpy(__dst, __src, __n);
}

int symlink(const char *a1, const char *a2)
{
  return _symlink(a1, a2);
}

uint64_t sysconf(int a1)
{
  return _sysconf(a1);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

int utime(const char *a1, const utimbuf *a2)
{
  return _utime(a1, a2);
}

void vDSP_svesqD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Length __N)
{
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return _vsnprintf(__str, __size, __format, a4);
}

__int32 *__cdecl wmemchr(__int32 *__s, __int32 __c, size_t __n)
{
  return _wmemchr(__s, __c, __n);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return _xpc_activity_copy_criteria(activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return _xpc_activity_set_state(activity, state);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  return _xpc_double_get_value(xdouble);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__openTileFileForIncrementalIO(void *a1, const char *a2, ...)
{
  return [a1 _openTileFileForIncrementalIO];
}

id objc_msgSend__queue(void *a1, const char *a2, ...)
{
  return [a1 _queue];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return [a1 action];
}

id objc_msgSend_activeTime(void *a1, const char *a2, ...)
{
  return [a1 activeTime];
}

id objc_msgSend_activity(void *a1, const char *a2, ...)
{
  return [a1 activity];
}

id objc_msgSend_adHoc(void *a1, const char *a2, ...)
{
  return [a1 adHoc];
}

id objc_msgSend_afterFirstUserUnlock(void *a1, const char *a2, ...)
{
  return [a1 afterFirstUserUnlock];
}

id objc_msgSend_age(void *a1, const char *a2, ...)
{
  return [a1 age];
}

id objc_msgSend_allDownloadItemsCompleted(void *a1, const char *a2, ...)
{
  return [a1 allDownloadItemsCompleted];
}

id objc_msgSend_allFloorsDownloaded(void *a1, const char *a2, ...)
{
  return [a1 allFloorsDownloaded];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allowCellularDownload(void *a1, const char *a2, ...)
{
  return [a1 allowCellularDownload];
}

id objc_msgSend_allowCellularDownloadTile(void *a1, const char *a2, ...)
{
  return [a1 allowCellularDownloadTile];
}

id objc_msgSend_altitude(void *a1, const char *a2, ...)
{
  return [a1 altitude];
}

id objc_msgSend_arSessionState(void *a1, const char *a2, ...)
{
  return [a1 arSessionState];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_attitude(void *a1, const char *a2, ...)
{
  return [a1 attitude];
}

id objc_msgSend_authorizationStatus(void *a1, const char *a2, ...)
{
  return [a1 authorizationStatus];
}

id objc_msgSend_automotive(void *a1, const char *a2, ...)
{
  return [a1 automotive];
}

id objc_msgSend_availableFloorForegroundSessionQueue(void *a1, const char *a2, ...)
{
  return [a1 availableFloorForegroundSessionQueue];
}

id objc_msgSend_backgroundSessionQueue(void *a1, const char *a2, ...)
{
  return [a1 backgroundSessionQueue];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_boundary(void *a1, const char *a2, ...)
{
  return [a1 boundary];
}

id objc_msgSend_bssid(void *a1, const char *a2, ...)
{
  return [a1 bssid];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cachedScan(void *a1, const char *a2, ...)
{
  return [a1 cachedScan];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_cancelAllOperations(void *a1, const char *a2, ...)
{
  return [a1 cancelAllOperations];
}

id objc_msgSend_cancelPrefetch(void *a1, const char *a2, ...)
{
  return [a1 cancelPrefetch];
}

id objc_msgSend_cancelReading(void *a1, const char *a2, ...)
{
  return [a1 cancelReading];
}

id objc_msgSend_cb(void *a1, const char *a2, ...)
{
  return [a1 cb];
}

id objc_msgSend_centerECEF(void *a1, const char *a2, ...)
{
  return [a1 centerECEF];
}

id objc_msgSend_centerLatLon(void *a1, const char *a2, ...)
{
  return [a1 centerLatLon];
}

id objc_msgSend_channel(void *a1, const char *a2, ...)
{
  return [a1 channel];
}

id objc_msgSend_channelFlags(void *a1, const char *a2, ...)
{
  return [a1 channelFlags];
}

id objc_msgSend_channels(void *a1, const char *a2, ...)
{
  return [a1 channels];
}

id objc_msgSend_charValue(void *a1, const char *a2, ...)
{
  return [a1 charValue];
}

id objc_msgSend_checkIn(void *a1, const char *a2, ...)
{
  return [a1 checkIn];
}

id objc_msgSend_clearLastFix(void *a1, const char *a2, ...)
{
  return [a1 clearLastFix];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return [a1 close];
}

id objc_msgSend_closeFile(void *a1, const char *a2, ...)
{
  return [a1 closeFile];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_confidence(void *a1, const char *a2, ...)
{
  return [a1 confidence];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return [a1 context];
}

id objc_msgSend_coordinate(void *a1, const char *a2, ...)
{
  return [a1 coordinate];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_countOfBytesClientExpectsToReceive(void *a1, const char *a2, ...)
{
  return [a1 countOfBytesClientExpectsToReceive];
}

id objc_msgSend_countOfBytesExpectedToSend(void *a1, const char *a2, ...)
{
  return [a1 countOfBytesExpectedToSend];
}

id objc_msgSend_countOfBytesSent(void *a1, const char *a2, ...)
{
  return [a1 countOfBytesSent];
}

id objc_msgSend_course(void *a1, const char *a2, ...)
{
  return [a1 course];
}

id objc_msgSend_createIndoorProvderTransaction(void *a1, const char *a2, ...)
{
  return [a1 createIndoorProvderTransaction];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentForegroundFetchRequest(void *a1, const char *a2, ...)
{
  return [a1 currentForegroundFetchRequest];
}

id objc_msgSend_currentPace(void *a1, const char *a2, ...)
{
  return [a1 currentPace];
}

id objc_msgSend_currentProvider(void *a1, const char *a2, ...)
{
  return [a1 currentProvider];
}

id objc_msgSend_currentQueue(void *a1, const char *a2, ...)
{
  return [a1 currentQueue];
}

id objc_msgSend_currentRequest(void *a1, const char *a2, ...)
{
  return [a1 currentRequest];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_currentThread(void *a1, const char *a2, ...)
{
  return [a1 currentThread];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultCLClientLocationPrivate(void *a1, const char *a2, ...)
{
  return [a1 defaultCLClientLocationPrivate];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultWorkdir(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkdir];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_delay(void *a1, const char *a2, ...)
{
  return [a1 delay];
}

id objc_msgSend_delayedClearTilesPolicy(void *a1, const char *a2, ...)
{
  return [a1 delayedClearTilesPolicy];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_delegateProxy(void *a1, const char *a2, ...)
{
  return [a1 delegateProxy];
}

id objc_msgSend_delegateQ(void *a1, const char *a2, ...)
{
  return [a1 delegateQ];
}

id objc_msgSend_deleteLegacyPrefetchDatabase(void *a1, const char *a2, ...)
{
  return [a1 deleteLegacyPrefetchDatabase];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_deviceIdentifierForVendor(void *a1, const char *a2, ...)
{
  return [a1 deviceIdentifierForVendor];
}

id objc_msgSend_deviceMotionUpdateInterval(void *a1, const char *a2, ...)
{
  return [a1 deviceMotionUpdateInterval];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_direction(void *a1, const char *a2, ...)
{
  return [a1 direction];
}

id objc_msgSend_discoveryToken(void *a1, const char *a2, ...)
{
  return [a1 discoveryToken];
}

id objc_msgSend_discretionaryBackground(void *a1, const char *a2, ...)
{
  return [a1 discretionaryBackground];
}

id objc_msgSend_distance(void *a1, const char *a2, ...)
{
  return [a1 distance];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return [a1 distantFuture];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_downloadQ(void *a1, const char *a2, ...)
{
  return [a1 downloadQ];
}

id objc_msgSend_dutyCycle(void *a1, const char *a2, ...)
{
  return [a1 dutyCycle];
}

id objc_msgSend_dwell(void *a1, const char *a2, ...)
{
  return [a1 dwell];
}

id objc_msgSend_east(void *a1, const char *a2, ...)
{
  return [a1 east];
}

id objc_msgSend_effectiveUserIdentifier(void *a1, const char *a2, ...)
{
  return [a1 effectiveUserIdentifier];
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return [a1 endDate];
}

id objc_msgSend_endpointName(void *a1, const char *a2, ...)
{
  return [a1 endpointName];
}

id objc_msgSend_ephemeralSessionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 ephemeralSessionConfiguration];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_estimatedScanTime(void *a1, const char *a2, ...)
{
  return [a1 estimatedScanTime];
}

id objc_msgSend_expectedContentLength(void *a1, const char *a2, ...)
{
  return [a1 expectedContentLength];
}

id objc_msgSend_exportedObject(void *a1, const char *a2, ...)
{
  return [a1 exportedObject];
}

id objc_msgSend_fActiveRequest(void *a1, const char *a2, ...)
{
  return [a1 fActiveRequest];
}

id objc_msgSend_fBody(void *a1, const char *a2, ...)
{
  return [a1 fBody];
}

id objc_msgSend_fFinished(void *a1, const char *a2, ...)
{
  return [a1 fFinished];
}

id objc_msgSend_fHttpResponse(void *a1, const char *a2, ...)
{
  return [a1 fHttpResponse];
}

id objc_msgSend_fOriginalThreadName(void *a1, const char *a2, ...)
{
  return [a1 fOriginalThreadName];
}

id objc_msgSend_fReceivedData(void *a1, const char *a2, ...)
{
  return [a1 fReceivedData];
}

id objc_msgSend_fUrl(void *a1, const char *a2, ...)
{
  return [a1 fUrl];
}

id objc_msgSend_family(void *a1, const char *a2, ...)
{
  return [a1 family];
}

id objc_msgSend_fileHandleForReading(void *a1, const char *a2, ...)
{
  return [a1 fileHandleForReading];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_firstStepTime(void *a1, const char *a2, ...)
{
  return [a1 firstStepTime];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_floorRequests(void *a1, const char *a2, ...)
{
  return [a1 floorRequests];
}

id objc_msgSend_floorUuid(void *a1, const char *a2, ...)
{
  return [a1 floorUuid];
}

id objc_msgSend_floorsAscended(void *a1, const char *a2, ...)
{
  return [a1 floorsAscended];
}

id objc_msgSend_floorsDescended(void *a1, const char *a2, ...)
{
  return [a1 floorsDescended];
}

id objc_msgSend_forceClean(void *a1, const char *a2, ...)
{
  return [a1 forceClean];
}

id objc_msgSend_foregroundTileDownloadComplete(void *a1, const char *a2, ...)
{
  return [a1 foregroundTileDownloadComplete];
}

id objc_msgSend_fsDb(void *a1, const char *a2, ...)
{
  return [a1 fsDb];
}

id objc_msgSend_fullyVacuumAllDBs(void *a1, const char *a2, ...)
{
  return [a1 fullyVacuumAllDBs];
}

id objc_msgSend_getAvailabilityData(void *a1, const char *a2, ...)
{
  return [a1 getAvailabilityData];
}

id objc_msgSend_getAvlTile(void *a1, const char *a2, ...)
{
  return [a1 getAvlTile];
}

id objc_msgSend_getGroupId(void *a1, const char *a2, ...)
{
  return [a1 getGroupId];
}

id objc_msgSend_getLocationIds(void *a1, const char *a2, ...)
{
  return [a1 getLocationIds];
}

id objc_msgSend_getSensor(void *a1, const char *a2, ...)
{
  return [a1 getSensor];
}

id objc_msgSend_getVertices(void *a1, const char *a2, ...)
{
  return [a1 getVertices];
}

id objc_msgSend_globallyUniqueString(void *a1, const char *a2, ...)
{
  return [a1 globallyUniqueString];
}

id objc_msgSend_gpsLocation(void *a1, const char *a2, ...)
{
  return [a1 gpsLocation];
}

id objc_msgSend_gpsLocationPrivate(void *a1, const char *a2, ...)
{
  return [a1 gpsLocationPrivate];
}

id objc_msgSend_gravity(void *a1, const char *a2, ...)
{
  return [a1 gravity];
}

id objc_msgSend_groupId(void *a1, const char *a2, ...)
{
  return [a1 groupId];
}

id objc_msgSend_handleCompleted(void *a1, const char *a2, ...)
{
  return [a1 handleCompleted];
}

id objc_msgSend_hasAnyOpenTransaction(void *a1, const char *a2, ...)
{
  return [a1 hasAnyOpenTransaction];
}

id objc_msgSend_hasCompleteFloor(void *a1, const char *a2, ...)
{
  return [a1 hasCompleteFloor];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_horizontalAccuracy(void *a1, const char *a2, ...)
{
  return [a1 horizontalAccuracy];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return [a1 host];
}

id objc_msgSend_hwModel(void *a1, const char *a2, ...)
{
  return [a1 hwModel];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_impl(void *a1, const char *a2, ...)
{
  return [a1 impl];
}

id objc_msgSend_includeOffChannelResults(void *a1, const char *a2, ...)
{
  return [a1 includeOffChannelResults];
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return [a1 infoDictionary];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_initializeDb(void *a1, const char *a2, ...)
{
  return [a1 initializeDb];
}

id objc_msgSend_initializeServiceApi(void *a1, const char *a2, ...)
{
  return [a1 initializeServiceApi];
}

id objc_msgSend_initiatedTimestamp(void *a1, const char *a2, ...)
{
  return [a1 initiatedTimestamp];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_interval(void *a1, const char *a2, ...)
{
  return [a1 interval];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invalidateAndCancel(void *a1, const char *a2, ...)
{
  return [a1 invalidateAndCancel];
}

id objc_msgSend_invalidateSessions(void *a1, const char *a2, ...)
{
  return [a1 invalidateSessions];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return [a1 isCancelled];
}

id objc_msgSend_isDaemon(void *a1, const char *a2, ...)
{
  return [a1 isDaemon];
}

id objc_msgSend_isDeviceMotionAvailable(void *a1, const char *a2, ...)
{
  return [a1 isDeviceMotionAvailable];
}

id objc_msgSend_isDisabled(void *a1, const char *a2, ...)
{
  return [a1 isDisabled];
}

id objc_msgSend_isDistanceAvailable(void *a1, const char *a2, ...)
{
  return [a1 isDistanceAvailable];
}

id objc_msgSend_isLocked(void *a1, const char *a2, ...)
{
  return [a1 isLocked];
}

id objc_msgSend_isMagnetometerAvailable(void *a1, const char *a2, ...)
{
  return [a1 isMagnetometerAvailable];
}

id objc_msgSend_isRegionalEnabled(void *a1, const char *a2, ...)
{
  return [a1 isRegionalEnabled];
}

id objc_msgSend_isStepCountingAvailable(void *a1, const char *a2, ...)
{
  return [a1 isStepCountingAvailable];
}

id objc_msgSend_keybagDidLock(void *a1, const char *a2, ...)
{
  return [a1 keybagDidLock];
}

id objc_msgSend_keybagDidUnlock(void *a1, const char *a2, ...)
{
  return [a1 keybagDidUnlock];
}

id objc_msgSend_kind(void *a1, const char *a2, ...)
{
  return [a1 kind];
}

id objc_msgSend_lastLocation(void *a1, const char *a2, ...)
{
  return [a1 lastLocation];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_lastRelevant(void *a1, const char *a2, ...)
{
  return [a1 lastRelevant];
}

id objc_msgSend_latitude(void *a1, const char *a2, ...)
{
  return [a1 latitude];
}

id objc_msgSend_launch(void *a1, const char *a2, ...)
{
  return [a1 launch];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizationActive(void *a1, const char *a2, ...)
{
  return [a1 localizationActive];
}

id objc_msgSend_localizationStarted(void *a1, const char *a2, ...)
{
  return [a1 localizationStarted];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_localizedFailureReason(void *a1, const char *a2, ...)
{
  return [a1 localizedFailureReason];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return [a1 location];
}

id objc_msgSend_locationContext(void *a1, const char *a2, ...)
{
  return [a1 locationContext];
}

id objc_msgSend_locationDescription(void *a1, const char *a2, ...)
{
  return [a1 locationDescription];
}

id objc_msgSend_locationId(void *a1, const char *a2, ...)
{
  return [a1 locationId];
}

id objc_msgSend_locationManager(void *a1, const char *a2, ...)
{
  return [a1 locationManager];
}

id objc_msgSend_locationPrivate(void *a1, const char *a2, ...)
{
  return [a1 locationPrivate];
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return [a1 log];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_longitude(void *a1, const char *a2, ...)
{
  return [a1 longitude];
}

id objc_msgSend_lowPriorityScan(void *a1, const char *a2, ...)
{
  return [a1 lowPriorityScan];
}

id objc_msgSend_machine(void *a1, const char *a2, ...)
{
  return [a1 machine];
}

id objc_msgSend_magneticField(void *a1, const char *a2, ...)
{
  return [a1 magneticField];
}

id objc_msgSend_main(void *a1, const char *a2, ...)
{
  return [a1 main];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_manufacturer(void *a1, const char *a2, ...)
{
  return [a1 manufacturer];
}

id objc_msgSend_maxConcurrentOperationCount(void *a1, const char *a2, ...)
{
  return [a1 maxConcurrentOperationCount];
}

id objc_msgSend_maxModifiedAge(void *a1, const char *a2, ...)
{
  return [a1 maxModifiedAge];
}

id objc_msgSend_merged(void *a1, const char *a2, ...)
{
  return [a1 merged];
}

id objc_msgSend_mode(void *a1, const char *a2, ...)
{
  return [a1 mode];
}

id objc_msgSend_mutableAvailabilityData(void *a1, const char *a2, ...)
{
  return [a1 mutableAvailabilityData];
}

id objc_msgSend_mutableDeferredState(void *a1, const char *a2, ...)
{
  return [a1 mutableDeferredState];
}

id objc_msgSend_mutableUniverseState(void *a1, const char *a2, ...)
{
  return [a1 mutableUniverseState];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_north(void *a1, const char *a2, ...)
{
  return [a1 north];
}

id objc_msgSend_notificationType(void *a1, const char *a2, ...)
{
  return [a1 notificationType];
}

id objc_msgSend_notify(void *a1, const char *a2, ...)
{
  return [a1 notify];
}

id objc_msgSend_notifyDelegateIfPrefetchComplete(void *a1, const char *a2, ...)
{
  return [a1 notifyDelegateIfPrefetchComplete];
}

id objc_msgSend_notifyDelegatePrefetchComplete(void *a1, const char *a2, ...)
{
  return [a1 notifyDelegatePrefetchComplete];
}

id objc_msgSend_notifyProxyOfDownloadError(void *a1, const char *a2, ...)
{
  return [a1 notifyProxyOfDownloadError];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_numExpectedFloors(void *a1, const char *a2, ...)
{
  return [a1 numExpectedFloors];
}

id objc_msgSend_numFloors(void *a1, const char *a2, ...)
{
  return [a1 numFloors];
}

id objc_msgSend_numFloorsSuccessfullyDownloaded(void *a1, const char *a2, ...)
{
  return [a1 numFloorsSuccessfullyDownloaded];
}

id objc_msgSend_numOpenTransactions(void *a1, const char *a2, ...)
{
  return [a1 numOpenTransactions];
}

id objc_msgSend_numTotalExpectedExteriorsInVenues(void *a1, const char *a2, ...)
{
  return [a1 numTotalExpectedExteriorsInVenues];
}

id objc_msgSend_numVenuesExpected(void *a1, const char *a2, ...)
{
  return [a1 numVenuesExpected];
}

id objc_msgSend_numberOfSteps(void *a1, const char *a2, ...)
{
  return [a1 numberOfSteps];
}

id objc_msgSend_objCType(void *a1, const char *a2, ...)
{
  return [a1 objCType];
}

id objc_msgSend_onConnectionQueueShutdown(void *a1, const char *a2, ...)
{
  return [a1 onConnectionQueueShutdown];
}

id objc_msgSend_onError(void *a1, const char *a2, ...)
{
  return [a1 onError];
}

id objc_msgSend_onHeaders(void *a1, const char *a2, ...)
{
  return [a1 onHeaders];
}

id objc_msgSend_onProgress(void *a1, const char *a2, ...)
{
  return [a1 onProgress];
}

id objc_msgSend_onQueueDbsToClear(void *a1, const char *a2, ...)
{
  return [a1 onQueueDbsToClear];
}

id objc_msgSend_onQueueDeregisterDevices(void *a1, const char *a2, ...)
{
  return [a1 onQueueDeregisterDevices];
}

id objc_msgSend_onQueueDeregisterManager(void *a1, const char *a2, ...)
{
  return [a1 onQueueDeregisterManager];
}

id objc_msgSend_onQueueHandleScanTimer(void *a1, const char *a2, ...)
{
  return [a1 onQueueHandleScanTimer];
}

id objc_msgSend_onQueueHandlerServerRestart(void *a1, const char *a2, ...)
{
  return [a1 onQueueHandlerServerRestart];
}

id objc_msgSend_onQueueInvalidate(void *a1, const char *a2, ...)
{
  return [a1 onQueueInvalidate];
}

id objc_msgSend_onQueueNotifyDelegateForegroundFetchComplete(void *a1, const char *a2, ...)
{
  return [a1 onQueueNotifyDelegateForegroundFetchComplete];
}

id objc_msgSend_onQueueNotifyDelegatePrefetchComplete(void *a1, const char *a2, ...)
{
  return [a1 onQueueNotifyDelegatePrefetchComplete];
}

id objc_msgSend_onQueueNumFloors(void *a1, const char *a2, ...)
{
  return [a1 onQueueNumFloors];
}

id objc_msgSend_onQueueReEnumerateDevices(void *a1, const char *a2, ...)
{
  return [a1 onQueueReEnumerateDevices];
}

id objc_msgSend_onQueueRegisterCallbacks(void *a1, const char *a2, ...)
{
  return [a1 onQueueRegisterCallbacks];
}

id objc_msgSend_onQueueRegisterDevices(void *a1, const char *a2, ...)
{
  return [a1 onQueueRegisterDevices];
}

id objc_msgSend_onQueueStartScanning(void *a1, const char *a2, ...)
{
  return [a1 onQueueStartScanning];
}

id objc_msgSend_onQueueStopScanning(void *a1, const char *a2, ...)
{
  return [a1 onQueueStopScanning];
}

id objc_msgSend_onQueueTeardown(void *a1, const char *a2, ...)
{
  return [a1 onQueueTeardown];
}

id objc_msgSend_onQueueTick(void *a1, const char *a2, ...)
{
  return [a1 onQueueTick];
}

id objc_msgSend_onQueueUpdateDelegate(void *a1, const char *a2, ...)
{
  return [a1 onQueueUpdateDelegate];
}

id objc_msgSend_onResponse(void *a1, const char *a2, ...)
{
  return [a1 onResponse];
}

id objc_msgSend_onUploadProgress(void *a1, const char *a2, ...)
{
  return [a1 onUploadProgress];
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return [a1 open];
}

id objc_msgSend_originalRequest(void *a1, const char *a2, ...)
{
  return [a1 originalRequest];
}

id objc_msgSend_osVersion(void *a1, const char *a2, ...)
{
  return [a1 osVersion];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_pause(void *a1, const char *a2, ...)
{
  return [a1 pause];
}

id objc_msgSend_pausedLocalization(void *a1, const char *a2, ...)
{
  return [a1 pausedLocalization];
}

id objc_msgSend_personalHotspot(void *a1, const char *a2, ...)
{
  return [a1 personalHotspot];
}

id objc_msgSend_port(void *a1, const char *a2, ...)
{
  return [a1 port];
}

id objc_msgSend_prefetchCompletion(void *a1, const char *a2, ...)
{
  return [a1 prefetchCompletion];
}

id objc_msgSend_prefetcher(void *a1, const char *a2, ...)
{
  return [a1 prefetcher];
}

id objc_msgSend_pressure(void *a1, const char *a2, ...)
{
  return [a1 pressure];
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return [a1 priority];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_q(void *a1, const char *a2, ...)
{
  return [a1 q];
}

id objc_msgSend_rawToken(void *a1, const char *a2, ...)
{
  return [a1 rawToken];
}

id objc_msgSend_readDataToEndOfFile(void *a1, const char *a2, ...)
{
  return [a1 readDataToEndOfFile];
}

id objc_msgSend_readNextSampleBuffer(void *a1, const char *a2, ...)
{
  return [a1 readNextSampleBuffer];
}

id objc_msgSend_relationship(void *a1, const char *a2, ...)
{
  return [a1 relationship];
}

id objc_msgSend_relativeAltitude(void *a1, const char *a2, ...)
{
  return [a1 relativeAltitude];
}

id objc_msgSend_releaseObjectsNotNeededForLocalization(void *a1, const char *a2, ...)
{
  return [a1 releaseObjectsNotNeededForLocalization];
}

id objc_msgSend_relevancy(void *a1, const char *a2, ...)
{
  return [a1 relevancy];
}

id objc_msgSend_reloadAvailabilityTilePrefetchParameters(void *a1, const char *a2, ...)
{
  return [a1 reloadAvailabilityTilePrefetchParameters];
}

id objc_msgSend_remoteObjectProtocol(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProtocol];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeAllTasks(void *a1, const char *a2, ...)
{
  return [a1 removeAllTasks];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return [a1 removeLastObject];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_requestForegroundTileDownload(void *a1, const char *a2, ...)
{
  return [a1 requestForegroundTileDownload];
}

id objc_msgSend_requestUUID(void *a1, const char *a2, ...)
{
  return [a1 requestUUID];
}

id objc_msgSend_requestWhenInUseAuthorization(void *a1, const char *a2, ...)
{
  return [a1 requestWhenInUseAuthorization];
}

id objc_msgSend_requestsAnonymity(void *a1, const char *a2, ...)
{
  return [a1 requestsAnonymity];
}

id objc_msgSend_requestsGpsAssistance(void *a1, const char *a2, ...)
{
  return [a1 requestsGpsAssistance];
}

id objc_msgSend_resetSessions(void *a1, const char *a2, ...)
{
  return [a1 resetSessions];
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return [a1 response];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_resumeData(void *a1, const char *a2, ...)
{
  return [a1 resumeData];
}

id objc_msgSend_rotationMatrix(void *a1, const char *a2, ...)
{
  return [a1 rotationMatrix];
}

id objc_msgSend_rotationRate(void *a1, const char *a2, ...)
{
  return [a1 rotationRate];
}

id objc_msgSend_rssi(void *a1, const char *a2, ...)
{
  return [a1 rssi];
}

id objc_msgSend_running(void *a1, const char *a2, ...)
{
  return [a1 running];
}

id objc_msgSend_scanRssiThreshold(void *a1, const char *a2, ...)
{
  return [a1 scanRssiThreshold];
}

id objc_msgSend_scanTimer(void *a1, const char *a2, ...)
{
  return [a1 scanTimer];
}

id objc_msgSend_scanType(void *a1, const char *a2, ...)
{
  return [a1 scanType];
}

id objc_msgSend_scanning(void *a1, const char *a2, ...)
{
  return [a1 scanning];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_selectedLocation(void *a1, const char *a2, ...)
{
  return [a1 selectedLocation];
}

id objc_msgSend_sensorPresent(void *a1, const char *a2, ...)
{
  return [a1 sensorPresent];
}

id objc_msgSend_serializedOutdoorEstimatorLogEntry(void *a1, const char *a2, ...)
{
  return [a1 serializedOutdoorEstimatorLogEntry];
}

id objc_msgSend_serializedVIOEstimation(void *a1, const char *a2, ...)
{
  return [a1 serializedVIOEstimation];
}

id objc_msgSend_serializedVLLocalizationResult(void *a1, const char *a2, ...)
{
  return [a1 serializedVLLocalizationResult];
}

id objc_msgSend_serviceDelegate(void *a1, const char *a2, ...)
{
  return [a1 serviceDelegate];
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return [a1 serviceName];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return [a1 session];
}

id objc_msgSend_sessionInvalidationGroup(void *a1, const char *a2, ...)
{
  return [a1 sessionInvalidationGroup];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setMultiPart(void *a1, const char *a2, ...)
{
  return [a1 setMultiPart];
}

id objc_msgSend_setStopExpected(void *a1, const char *a2, ...)
{
  return [a1 setStopExpected];
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return [a1 settings];
}

id objc_msgSend_sharedConfiguration(void *a1, const char *a2, ...)
{
  return [a1 sharedConfiguration];
}

id objc_msgSend_sharedHTTPCookieStorage(void *a1, const char *a2, ...)
{
  return [a1 sharedHTTPCookieStorage];
}

id objc_msgSend_shutdown(void *a1, const char *a2, ...)
{
  return [a1 shutdown];
}

id objc_msgSend_shutdownReason(void *a1, const char *a2, ...)
{
  return [a1 shutdownReason];
}

id objc_msgSend_speed(void *a1, const char *a2, ...)
{
  return [a1 speed];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return [a1 startDate];
}

id objc_msgSend_startExecuting(void *a1, const char *a2, ...)
{
  return [a1 startExecuting];
}

id objc_msgSend_startListeningCachedScans(void *a1, const char *a2, ...)
{
  return [a1 startListeningCachedScans];
}

id objc_msgSend_startLocalizer(void *a1, const char *a2, ...)
{
  return [a1 startLocalizer];
}

id objc_msgSend_startReading(void *a1, const char *a2, ...)
{
  return [a1 startReading];
}

id objc_msgSend_startScanning(void *a1, const char *a2, ...)
{
  return [a1 startScanning];
}

id objc_msgSend_startUpdatingLocation(void *a1, const char *a2, ...)
{
  return [a1 startUpdatingLocation];
}

id objc_msgSend_startWriting(void *a1, const char *a2, ...)
{
  return [a1 startWriting];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stationary(void *a1, const char *a2, ...)
{
  return [a1 stationary];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_stopDeviceMotionUpdates(void *a1, const char *a2, ...)
{
  return [a1 stopDeviceMotionUpdates];
}

id objc_msgSend_stopExecuting(void *a1, const char *a2, ...)
{
  return [a1 stopExecuting];
}

id objc_msgSend_stopListeningCachedScans(void *a1, const char *a2, ...)
{
  return [a1 stopListeningCachedScans];
}

id objc_msgSend_stopLocalizer(void *a1, const char *a2, ...)
{
  return [a1 stopLocalizer];
}

id objc_msgSend_stopMagnetometerUpdates(void *a1, const char *a2, ...)
{
  return [a1 stopMagnetometerUpdates];
}

id objc_msgSend_stopScanning(void *a1, const char *a2, ...)
{
  return [a1 stopScanning];
}

id objc_msgSend_stopUpdatingLocation(void *a1, const char *a2, ...)
{
  return [a1 stopUpdatingLocation];
}

id objc_msgSend_streamError(void *a1, const char *a2, ...)
{
  return [a1 streamError];
}

id objc_msgSend_streamStatus(void *a1, const char *a2, ...)
{
  return [a1 streamStatus];
}

id objc_msgSend_supportsMultiUser(void *a1, const char *a2, ...)
{
  return [a1 supportsMultiUser];
}

id objc_msgSend_systemName(void *a1, const char *a2, ...)
{
  return [a1 systemName];
}

id objc_msgSend_systemVersion(void *a1, const char *a2, ...)
{
  return [a1 systemVersion];
}

id objc_msgSend_targettedSsid(void *a1, const char *a2, ...)
{
  return [a1 targettedSsid];
}

id objc_msgSend_tileForegroundFetchFinishedAllDownloads(void *a1, const char *a2, ...)
{
  return [a1 tileForegroundFetchFinishedAllDownloads];
}

id objc_msgSend_tileIsOpenForIncrementalIO(void *a1, const char *a2, ...)
{
  return [a1 tileIsOpenForIncrementalIO];
}

id objc_msgSend_tilePrefetchFinishedAllDownloads(void *a1, const char *a2, ...)
{
  return [a1 tilePrefetchFinishedAllDownloads];
}

id objc_msgSend_tileServer(void *a1, const char *a2, ...)
{
  return [a1 tileServer];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_tolerance(void *a1, const char *a2, ...)
{
  return [a1 tolerance];
}

id objc_msgSend_transactionManager(void *a1, const char *a2, ...)
{
  return [a1 transactionManager];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unavailableFloorForegroundSessionQueue(void *a1, const char *a2, ...)
{
  return [a1 unavailableFloorForegroundSessionQueue];
}

id objc_msgSend_underlyingQueue(void *a1, const char *a2, ...)
{
  return [a1 underlyingQueue];
}

id objc_msgSend_unknown(void *a1, const char *a2, ...)
{
  return [a1 unknown];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_updateLocation(void *a1, const char *a2, ...)
{
  return [a1 updateLocation];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}

id objc_msgSend_userAcceleration(void *a1, const char *a2, ...)
{
  return [a1 userAcceleration];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_venueUuid(void *a1, const char *a2, ...)
{
  return [a1 venueUuid];
}

id objc_msgSend_venuesCount(void *a1, const char *a2, ...)
{
  return [a1 venuesCount];
}

id objc_msgSend_versionString(void *a1, const char *a2, ...)
{
  return [a1 versionString];
}

id objc_msgSend_waitUntilAllOperationsAreFinished(void *a1, const char *a2, ...)
{
  return [a1 waitUntilAllOperationsAreFinished];
}

id objc_msgSend_waitUntilExit(void *a1, const char *a2, ...)
{
  return [a1 waitUntilExit];
}

id objc_msgSend_walking(void *a1, const char *a2, ...)
{
  return [a1 walking];
}

id objc_msgSend_wifiError(void *a1, const char *a2, ...)
{
  return [a1 wifiError];
}

id objc_msgSend_wifiScanInitiating(void *a1, const char *a2, ...)
{
  return [a1 wifiScanInitiating];
}

id objc_msgSend_wifiThreadRunLoop(void *a1, const char *a2, ...)
{
  return [a1 wifiThreadRunLoop];
}

id objc_msgSend_wifiThreadShutdown(void *a1, const char *a2, ...)
{
  return [a1 wifiThreadShutdown];
}

id objc_msgSend_withinQueueCanReinitializeRemoteState(void *a1, const char *a2, ...)
{
  return [a1 withinQueueCanReinitializeRemoteState];
}

id objc_msgSend_withinQueueInitializeConnection(void *a1, const char *a2, ...)
{
  return [a1 withinQueueInitializeConnection];
}

id objc_msgSend_withinQueueInvalidate(void *a1, const char *a2, ...)
{
  return [a1 withinQueueInvalidate];
}

id objc_msgSend_withinQueueInvalidateState(void *a1, const char *a2, ...)
{
  return [a1 withinQueueInvalidateState];
}

id objc_msgSend_withinQueuePermanentShutdownReason(void *a1, const char *a2, ...)
{
  return [a1 withinQueuePermanentShutdownReason];
}

id objc_msgSend_withinQueueReinitializeRemoteState(void *a1, const char *a2, ...)
{
  return [a1 withinQueueReinitializeRemoteState];
}

id objc_msgSend_workdir(void *a1, const char *a2, ...)
{
  return [a1 workdir];
}

id objc_msgSend_x(void *a1, const char *a2, ...)
{
  return [a1 x];
}

id objc_msgSend_xpcConnection(void *a1, const char *a2, ...)
{
  return [a1 xpcConnection];
}

id objc_msgSend_y(void *a1, const char *a2, ...)
{
  return [a1 y];
}

id objc_msgSend_z(void *a1, const char *a2, ...)
{
  return [a1 z];
}