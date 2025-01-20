uint64_t sub_10000340C(uint64_t result)
{
  uint64_t v1;
  std::__shared_weak_count *v2;

  v1 = result;
  v2 = *(std::__shared_weak_count **)(result + 8);
  if (v2)
  {
    if (!atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
      return v1;
    }
  }
  return result;
}

void *sub_100003488(void *a1)
{
  std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
  v2 = std::locale::use_facet(&v4, &std::ctype<char>::id);
  ((void (*)(const std::locale::facet *, uint64_t))v2->__vftable[2].~facet_0)(v2, 10);
  std::locale::~locale(&v4);
  std::ostream::put();
  std::ostream::flush();
  return a1;
}

void sub_10000352C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
}

void sub_100003540()
{
}

void sub_100003558(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_1000035B4(exception, a1);
}

void sub_1000035A0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_1000035B4(std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_1000035E8(void *a1)
{
}

void *sub_1000035FC(unsigned char *__dst, void *__src, unint64_t a3)
{
  v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8) {
      sub_100003540();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000;
    void *v5 = v8;
    v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }

  return memmove(v5, __src, a3 + 1);
}

void *sub_10000369C(void *a1, uint64_t a2, uint64_t a3)
{
  std::ostream::sentry::sentry();
  uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
  uint64_t v7 = *(void *)(v6 + 40);
  int v8 = *(_DWORD *)(v6 + 8);
  int v9 = *(_DWORD *)(v6 + 144);
  if (v9 == -1)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
    v10 = std::locale::use_facet(&v13, &std::ctype<char>::id);
    int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
    std::locale::~locale(&v13);
    *(_DWORD *)(v6 + 144) = v9;
  }
  if ((v8 & 0xB0) == 0x20) {
    uint64_t v11 = a2 + a3;
  }
  else {
    uint64_t v11 = a2;
  }
  if (!sub_100003848(v7, a2, v11, a2 + a3, v6, (char)v9)) {
    std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
  }
  std::ostream::sentry::~sentry();
  return a1;
}

void sub_1000037E0(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  std::ostream::sentry::~sentry();
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x1000037C0);
}

void sub_100003834(_Unwind_Exception *a1)
{
}

uint64_t sub_100003848(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6 = a1;
  if (a1)
  {
    uint64_t v11 = *(void *)(a5 + 24);
    if (v11 <= a4 - a2) {
      size_t v12 = 0;
    }
    else {
      size_t v12 = v11 - (a4 - a2);
    }
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1) != a3 - a2) {
      return 0;
    }
    if ((uint64_t)v12 >= 1)
    {
      memset(__b, 170, sizeof(__b));
      if (v12 >= 0x7FFFFFFFFFFFFFF8) {
        sub_100003540();
      }
      if (v12 >= 0x17)
      {
        uint64_t v14 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v12 | 7) != 0x17) {
          uint64_t v14 = v12 | 7;
        }
        uint64_t v15 = v14 + 1;
        std::locale v13 = (void **)operator new(v14 + 1);
        __b[1] = (void *)v12;
        __b[2] = (void *)(v15 | 0x8000000000000000);
        __b[0] = v13;
      }
      else
      {
        HIBYTE(__b[2]) = v12;
        std::locale v13 = __b;
      }
      memset(v13, __c, v12);
      *((unsigned char *)v13 + v12) = 0;
      if (SHIBYTE(__b[2]) >= 0) {
        v16 = __b;
      }
      else {
        v16 = (void **)__b[0];
      }
      uint64_t v17 = (*(uint64_t (**)(uint64_t, void **, size_t))(*(void *)v6 + 96))(v6, v16, v12);
      uint64_t v18 = v17;
      if (SHIBYTE(__b[2]) < 0)
      {
        operator delete(__b[0]);
        if (v18 != v12) {
          return 0;
        }
      }
      else if (v17 != v12)
      {
        return 0;
      }
    }
    uint64_t v19 = a4 - a3;
    if (v19 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v6 + 96))(v6, a3, v19) == v19)
    {
      *(void *)(a5 + 24) = 0;
      return v6;
    }
    return 0;
  }
  return v6;
}

void sub_100003A28(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100003A44()
{
  exception = __cxa_allocate_exception(8uLL);
}

void TraceCommand::GetTraceProperty(uint64_t *a1@<X0>, const char *a2@<X1>, const char *a3@<X2>, uint64_t a4@<X3>, int64_t a5@<X4>, uint64_t a6@<X8>)
{
  if (!*a1) {
    goto LABEL_13;
  }
  int v9 = a3;
  v10 = a2;
  if (a2[23] < 0)
  {
    if (!*((void *)a2 + 1)) {
      goto LABEL_13;
    }
  }
  else if (!a2[23])
  {
    goto LABEL_13;
  }
  if (a3[23] < 0)
  {
    if (*((void *)a3 + 1)) {
      goto LABEL_8;
    }
LABEL_13:
    *(_DWORD *)a6 = -534716414;
    *(void *)(a6 + 16) = 0;
    *(void *)(a6 + 24) = 0;
    *(void *)(a6 + 8) = 0;
    return;
  }
  if (!a3[23]) {
    goto LABEL_13;
  }
LABEL_8:
  xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
  if (v12 || (xpc_object_t v12 = xpc_null_create()) != 0)
  {
    if (xpc_get_type(v12) == (xpc_type_t)&_xpc_type_dictionary)
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
  if (v10[23] < 0) {
    v10 = *(const char **)v10;
  }
  xpc_object_t v14 = xpc_string_create(v10);
  if (!v14) {
    xpc_object_t v14 = xpc_null_create();
  }
  xpc_dictionary_set_value(v13, abm::kKeyTraceName, v14);
  xpc_object_t v15 = xpc_null_create();
  xpc_release(v14);
  xpc_release(v15);
  if (v9[23] < 0) {
    int v9 = *(const char **)v9;
  }
  xpc_object_t v16 = xpc_string_create(v9);
  if (!v16) {
    xpc_object_t v16 = xpc_null_create();
  }
  xpc_dictionary_set_value(v13, abm::kKeyTracePropertyName, v16);
  xpc_object_t v17 = xpc_null_create();
  xpc_release(v16);
  xpc_release(v17);
  if (a5)
  {
    xpc_object_t v18 = xpc_int64_create(a5);
    if (!v18) {
      xpc_object_t v18 = xpc_null_create();
    }
    xpc_dictionary_set_value(v13, abm::kKeyTimeout, v18);
    xpc_object_t v19 = xpc_null_create();
    xpc_release(v18);
    xpc_release(v19);
  }
  xpc_object_t object = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v20 = xpc_null_create();
  *(void *)&long long v21 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)a6 = v21;
  *(_OWORD *)(a6 + 16) = v21;
  v22 = (std::__shared_weak_count *)a1[1];
  uint64_t v37 = *a1;
  v38 = v22;
  xpc_object_t object = v20;
  if (v22) {
    atomic_fetch_add_explicit(&v22->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v23 = (const void *)abm::kCommandGetTraceProperty;
  size_t v24 = strlen(abm::kCommandGetTraceProperty);
  if (v24 >= 0x7FFFFFFFFFFFFFF8) {
    sub_100003540();
  }
  size_t v25 = v24;
  if (v24 >= 0x17)
  {
    uint64_t v27 = (v24 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v24 | 7) != 0x17) {
      uint64_t v27 = v24 | 7;
    }
    uint64_t v28 = v27 + 1;
    p_dst = (long long *)operator new(v27 + 1);
    *((void *)&__dst + 1) = v25;
    unint64_t v36 = v28 | 0x8000000000000000;
    *(void *)&long long __dst = p_dst;
    goto LABEL_37;
  }
  HIBYTE(v36) = v24;
  p_dst = &__dst;
  if (v24) {
LABEL_37:
  }
    memmove(p_dst, v23, v25);
  *((unsigned char *)p_dst + v25) = 0;
  abm::client::PerformCommand();
  if (SHIBYTE(v36) < 0) {
    operator delete((void *)__dst);
  }
  v29 = v38;
  if (v38 && !atomic_fetch_add(&v38->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
    std::__shared_weak_count::__release_weak(v29);
    xpc_object_t v30 = object;
    if (object)
    {
LABEL_46:
      if (xpc_get_type(v30) == (xpc_type_t)&_xpc_type_dictionary)
      {
        xpc_retain(v30);
        xpc_object_t v31 = v30;
      }
      else
      {
        xpc_object_t v31 = xpc_null_create();
      }
      goto LABEL_49;
    }
  }
  else
  {
    xpc_object_t v30 = object;
    if (object) {
      goto LABEL_46;
    }
  }
  xpc_object_t v30 = xpc_null_create();
  if (v30) {
    goto LABEL_46;
  }
  xpc_object_t v31 = xpc_null_create();
  xpc_object_t v30 = 0;
LABEL_49:
  xpc_release(v30);
  if (!*(_DWORD *)a6 && xpc_get_type(v31) == (xpc_type_t)&_xpc_type_dictionary)
  {
    xpc_object_t value = xpc_dictionary_get_value(v31, abm::kKeyTracePropertyValue);
    xpc_object_t v34 = value;
    if (value) {
      xpc_retain(value);
    }
    else {
      xpc_object_t v34 = xpc_null_create();
    }
    xpc::dyn_cast_or_default((uint64_t *)&__dst, (xpc *)&v34, abm::kUnknown, v33);
    if (*(char *)(a4 + 23) < 0) {
      operator delete(*(void **)a4);
    }
    *(_OWORD *)a4 = __dst;
    *(void *)(a4 + 16) = v36;
    HIBYTE(v36) = 0;
    LOBYTE(__dst) = 0;
    xpc_release(v34);
  }
  xpc_release(v31);
  xpc_release(v13);
}

void sub_100003EC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17)
{
  xpc_release(object);
  xpc_release(v19);
  if (*(char *)(v17 + 31) < 0) {
    operator delete(*(void **)(v17 + 8));
  }
  xpc_release(v18);
  _Unwind_Resume(a1);
}

void **sub_100003FB4(void **a1)
{
  v2 = (void **)*a1;
  if (*a1)
  {
    v3 = (void **)a1[1];
    std::locale v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        if (*((char *)v3 - 1) < 0) {
          operator delete(*(v3 - 3));
        }
        v3 -= 3;
      }
      while (v3 != v2);
      std::locale v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

void sub_100004028()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

char *sub_10000405C(char **a1, uint64_t a2)
{
  v3 = *a1;
  std::locale v4 = a1[1];
  unint64_t v5 = 0xAAAAAAAAAAAAAAABLL * ((v4 - *a1) >> 3);
  unint64_t v6 = v5 + 1;
  if (v5 + 1 > 0xAAAAAAAAAAAAAAALL) {
    sub_10000429C();
  }
  if (0x5555555555555556 * ((a1[2] - v3) >> 3) > v6) {
    unint64_t v6 = 0x5555555555555556 * ((a1[2] - v3) >> 3);
  }
  if (0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3) >= 0x555555555555555) {
    unint64_t v8 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v8 = v6;
  }
  if (v8)
  {
    if (v8 > 0xAAAAAAAAAAAAAAALL) {
      sub_100004028();
    }
    int v9 = (char *)operator new(24 * v8);
  }
  else
  {
    int v9 = 0;
  }
  v10 = &v9[24 * v5];
  xpc_object_t v16 = v10;
  uint64_t v17 = v10;
  xpc_object_t v18 = &v9[24 * v8];
  if (*(char *)(a2 + 23) < 0)
  {
    sub_1000035FC(v10, *(void **)a2, *(void *)(a2 + 8));
    v3 = *a1;
    std::locale v4 = a1[1];
    v10 = v16;
    uint64_t v11 = v17 + 24;
    if (v4 == *a1)
    {
LABEL_17:
      xpc_object_t v13 = v3;
      goto LABEL_18;
    }
  }
  else
  {
    *(_OWORD *)v10 = *(_OWORD *)a2;
    *((void *)v10 + 2) = *(void *)(a2 + 16);
    uint64_t v11 = v10 + 24;
    if (v4 == v3) {
      goto LABEL_17;
    }
  }
  do
  {
    long long v12 = *(_OWORD *)(v4 - 24);
    *((void *)v10 - 1) = *((void *)v4 - 1);
    *(_OWORD *)(v10 - 24) = v12;
    v10 -= 24;
    *((void *)v4 - 2) = 0;
    *((void *)v4 - 1) = 0;
    *((void *)v4 - 3) = 0;
    v4 -= 24;
  }
  while (v4 != v3);
  xpc_object_t v13 = *a1;
  v3 = a1[1];
LABEL_18:
  *a1 = v10;
  a1[1] = v11;
  a1[2] = v18;
  if (v3 != v13)
  {
    xpc_object_t v14 = (void **)(v3 - 24);
    do
    {
      if (*((char *)v14 + 23) < 0) {
        operator delete(*v14);
      }
      v14 -= 3;
    }
    while (v14 + 3 != (void **)v13);
    v3 = v13;
  }
  if (v3) {
    operator delete(v3);
  }
  return v11;
}

void sub_100004220(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_100004234((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_100004234(uint64_t a1)
{
  v3 = *(void ***)(a1 + 8);
  v2 = *(void ***)(a1 + 16);
  if (v2 != v3)
  {
    do
    {
      unint64_t v5 = v2 - 3;
      *(void *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        unint64_t v5 = *(void ***)(a1 + 16);
      }
      v2 = v5;
    }
    while (v5 != v3);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_10000429C()
{
}

void sub_1000042B4()
{
}

void sub_1000042CC(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_100004328(exception, a1);
}

void sub_100004314(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_100004328(std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  return result;
}

void *sub_10000435C(void *__dst, void *__src, size_t __len)
{
  if (__len > 0x16)
  {
    if (__len - 0x7FFFFFFFFFFFFFF7 <= 0x800000000000001ELL) {
      sub_100003540();
    }
    size_t v7 = 44;
    if (__len > 0x2C) {
      size_t v7 = __len;
    }
    size_t v8 = (v7 | 7) + 1;
    unint64_t v6 = operator new(v8);
    memcpy(v6, __src, __len);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *long long __dst = v6;
  }
  else
  {
    *((unsigned char *)__dst + 23) = __len;
    unint64_t v6 = __dst;
    if (__len)
    {
      memmove(__dst, __src, __len);
      unint64_t v6 = __dst;
    }
  }
  *((unsigned char *)v6 + __len) = 0;
  return __dst;
}

void **sub_100004424(void **a1, void *__src, size_t __len)
{
  unint64_t v6 = (unint64_t)a1[2];
  uint64_t v7 = v6 & 0x7FFFFFFFFFFFFFFFLL;
  if ((v6 & 0x7FFFFFFFFFFFFFFFLL) > __len)
  {
    size_t v8 = *a1;
    a1[1] = (void *)__len;
    if (__len) {
      memmove(v8, __src, __len);
    }
    goto LABEL_12;
  }
  size_t v9 = 0x7FFFFFFFFFFFFFF7;
  if (0x7FFFFFFFFFFFFFF7 - v7 < __len - v7 + 1) {
    sub_100003540();
  }
  unint64_t v10 = v7 - 1;
  uint64_t v11 = a1;
  if ((v6 & 0x8000000000000000) == 0)
  {
    if (v10 > 0x3FFFFFFFFFFFFFF2) {
      goto LABEL_7;
    }
LABEL_14:
    unint64_t v13 = 2 * v10;
    if (__len > 2 * v10) {
      unint64_t v13 = __len;
    }
    uint64_t v14 = (v13 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v13 | 7) != 0x17) {
      uint64_t v14 = v13 | 7;
    }
    if (v13 >= 0x17) {
      size_t v9 = v14 + 1;
    }
    else {
      size_t v9 = 23;
    }
    size_t v8 = operator new(v9);
    if (!__len) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  uint64_t v11 = *a1;
  if (v10 <= 0x3FFFFFFFFFFFFFF2) {
    goto LABEL_14;
  }
LABEL_7:
  size_t v8 = operator new(0x7FFFFFFFFFFFFFF7uLL);
  if (__len) {
LABEL_8:
  }
    memcpy(v8, __src, __len);
LABEL_9:
  if (v10 != 22) {
    operator delete(v11);
  }
  a1[1] = (void *)__len;
  a1[2] = (void *)(v9 | 0x8000000000000000);
  *a1 = v8;
LABEL_12:
  *((unsigned char *)v8 + __len) = 0;
  return a1;
}

void *sub_10000456C(void *a1, uint64_t a2, unsigned __int8 a3)
{
  std::istream::sentry::sentry();
  if (*(char *)(a2 + 23) < 0)
  {
    **(unsigned char **)a2 = 0;
    *(void *)(a2 + 8) = 0;
  }
  else
  {
    *(unsigned char *)a2 = 0;
    *(unsigned char *)(a2 + 23) = 0;
  }
  uint64_t v6 = 0;
  while (1)
  {
    uint64_t v7 = *(void **)((char *)a1 + *(void *)(*a1 - 24) + 40);
    size_t v8 = (unsigned char *)v7[3];
    if (v8 != (unsigned char *)v7[4])
    {
      v7[3] = v8 + 1;
      LOBYTE(v7) = *v8;
      goto LABEL_9;
    }
    LODWORD(v7) = (*(uint64_t (**)(void *))(*v7 + 80))(v7);
    if (v7 == -1) {
      break;
    }
LABEL_9:
    if (v7 == a3)
    {
      int v9 = 0;
      goto LABEL_17;
    }
    std::string::push_back((std::string *)a2, (std::string::value_type)v7);
    --v6;
    if (*(char *)(a2 + 23) < 0 && *(void *)(a2 + 8) == 0x7FFFFFFFFFFFFFF7)
    {
      int v9 = 4;
      goto LABEL_17;
    }
  }
  if (v6) {
    int v9 = 2;
  }
  else {
    int v9 = 6;
  }
LABEL_17:
  std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | v9);
  return a1;
}

void sub_1000046D4(void *a1)
{
  __cxa_begin_catch(a1);
  uint64_t v2 = *v1;
  *(_DWORD *)((char *)v1 + *(void *)(*v1 - 24) + 32) |= 1u;
  if ((*((unsigned char *)v1 + *(void *)(v2 - 24) + 36) & 1) == 0)
  {
    __cxa_end_catch();
    JUMPOUT(0x100004694);
  }
  __cxa_rethrow();
}

void sub_100004750(_Unwind_Exception *a1)
{
}

uint64_t config::hw::watch(config::hw *this)
{
  v1 = (ctu::Gestalt *)pthread_mutex_lock(&stru_100024238);
  uint64_t v2 = off_100024278;
  if (!off_100024278)
  {
    ctu::Gestalt::create_default_global((uint64_t *)&v9, v1);
    long long v3 = v9;
    long long v9 = 0uLL;
    std::locale v4 = (std::__shared_weak_count *)*(&off_100024278 + 1);
    off_100024278 = v3;
    if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
    unint64_t v5 = (std::__shared_weak_count *)*((void *)&v9 + 1);
    if (*((void *)&v9 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v9 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
    uint64_t v2 = off_100024278;
  }
  uint64_t v6 = (std::__shared_weak_count *)*(&off_100024278 + 1);
  if (*(&off_100024278 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_100024278 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&stru_100024238);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 144))(v2);
  uint64_t v8 = result;
  if (v6)
  {
    if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
      return v8;
    }
  }
  return result;
}

void sub_100004904(_Unwind_Exception *a1)
{
}

void sub_100004920(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_100004938(uint64_t a1)
{
  pthread_mutex_lock((pthread_mutex_t *)a1);
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 72);
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  pthread_mutex_unlock((pthread_mutex_t *)a1);
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
  }
  long long v3 = *(std::__shared_weak_count **)(a1 + 72);
  if (!v3 || atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    return a1;
  }
  ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
  std::__shared_weak_count::__release_weak(v3);
  return a1;
}

void sub_100004A14(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_100004A14(a1, *(void *)a2);
    sub_100004A14(a1, *(void *)(a2 + 8));
    if (*(char *)(a2 + 79) < 0)
    {
      operator delete(*(void **)(a2 + 56));
      if ((*(char *)(a2 + 55) & 0x80000000) == 0)
      {
LABEL_4:
        std::locale v4 = (void *)a2;
LABEL_6:
        operator delete(v4);
        return;
      }
    }
    else if ((*(char *)(a2 + 55) & 0x80000000) == 0)
    {
      goto LABEL_4;
    }
    operator delete(*(void **)(a2 + 32));
    std::locale v4 = (void *)a2;
    goto LABEL_6;
  }
}

uint64_t *sub_100004AB0(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 == result) {
    return result;
  }
  while (1)
  {
    uint64_t v2 = a2[2];
    if (*(unsigned char *)(v2 + 24)) {
      return result;
    }
    long long v3 = *(uint64_t **)(v2 + 16);
    uint64_t v4 = *v3;
    if (*v3 != v2) {
      break;
    }
    uint64_t v7 = v3[1];
    if (!v7 || (int v8 = *(unsigned __int8 *)(v7 + 24), v5 = (unsigned char *)(v7 + 24), v8))
    {
      if (*(uint64_t **)v2 == a2)
      {
        *(unsigned char *)(v2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v11 = *(void *)(v2 + 8);
        uint64_t *v3 = v11;
        if (v11) {
          goto LABEL_15;
        }
      }
      else
      {
        long long v9 = *(uint64_t **)(v2 + 8);
        uint64_t v10 = *v9;
        *(void *)(v2 + 8) = *v9;
        if (v10)
        {
          *(void *)(v10 + 16) = v2;
          long long v3 = *(uint64_t **)(v2 + 16);
        }
        v9[2] = (uint64_t)v3;
        *(void *)(*(void *)(v2 + 16) + 8 * (**(void **)(v2 + 16) != v2)) = v9;
        *long long v9 = v2;
        *(void *)(v2 + 16) = v9;
        long long v3 = (uint64_t *)v9[2];
        uint64_t v2 = *v3;
        *((unsigned char *)v9 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v11 = *(void *)(v2 + 8);
        uint64_t *v3 = v11;
        if (v11) {
LABEL_15:
        }
          *(void *)(v11 + 16) = v3;
      }
      *(void *)(v2 + 16) = v3[2];
      *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
      *(void *)(v2 + 8) = v3;
      v3[2] = v2;
      return result;
    }
LABEL_3:
    *(unsigned char *)(v2 + 24) = 1;
    a2 = v3;
    *((unsigned char *)v3 + 24) = v3 == result;
    unsigned char *v5 = 1;
    if (v3 == result) {
      return result;
    }
  }
  if (v4)
  {
    int v6 = *(unsigned __int8 *)(v4 + 24);
    unint64_t v5 = (unsigned char *)(v4 + 24);
    if (!v6) {
      goto LABEL_3;
    }
  }
  if (*(uint64_t **)v2 == a2)
  {
    uint64_t v12 = a2[1];
    *(void *)uint64_t v2 = v12;
    if (v12)
    {
      *(void *)(v12 + 16) = v2;
      long long v3 = *(uint64_t **)(v2 + 16);
    }
    a2[2] = (uint64_t)v3;
    *(void *)(*(void *)(v2 + 16) + 8 * (**(void **)(v2 + 16) != v2)) = a2;
    a2[1] = v2;
    *(void *)(v2 + 16) = a2;
    long long v3 = (uint64_t *)a2[2];
  }
  else
  {
    a2 = (uint64_t *)a2[2];
  }
  *((unsigned char *)a2 + 24) = 1;
  *((unsigned char *)v3 + 24) = 0;
  unint64_t v13 = (uint64_t *)v3[1];
  uint64_t v14 = *v13;
  v3[1] = *v13;
  if (v14) {
    *(void *)(v14 + 16) = v3;
  }
  v13[2] = v3[2];
  *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v13;
  *unint64_t v13 = (uint64_t)v3;
  v3[2] = (uint64_t)v13;
  return result;
}

uint64_t sub_100004C64()
{
  if ((byte_1000242A8 & 1) == 0)
  {
    byte_1000242A8 = 1;
    return __cxa_atexit((void (*)(void *))sub_100004938, &stru_100024238, (void *)&_mh_execute_header);
  }
  return result;
}

void sub_1000052A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

void sub_1000052C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

void sub_1000052D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

void sub_1000052F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

void sub_100005308(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

void sub_100005324(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

void sub_10000533C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

void sub_100005354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

void sub_10000536C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

void sub_100005384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

void sub_10000539C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

void sub_1000053B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

void sub_1000053CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

void sub_1000053E4(uint64_t a1, uint64_t a2)
{
}

void sub_1000053F4(uint64_t a1)
{
}

void sub_100005400(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315138;
      id v5 = [[[a3 localizedDescription] UTF8String];
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not open: %s", (uint8_t *)&v4, 0xCu);
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [objc_alloc((Class)OSLogEventStream) initWithSource:a2];
  }
}

void sub_1000054E4(uint64_t a1, void *a2)
{
  if ([a2 type] == (id)1024)
  {
    id v5 = [NSString stringWithFormat:@"%@ 0x%05llx 0x%llx %d %@(%@):%@ [%@] %@\n", [NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", [a2 date], (double)(uint64_t)objc_msgSend(objc_msgSend(a2, "timeZone"), "secondsFromGMTForDate:", objc_msgSend(a2, "date"))), objc_msgSend(a2, "threadIdentifier"), objc_msgSend(a2, "activityIdentifier"), objc_msgSend(a2, "processIdentifier"), objc_msgSend(a2, "process"), objc_msgSend(a2, "sender"), objc_msgSend(a2, "subsystem"), objc_msgSend(a2, "category"), objc_msgSend(a2, "composedMessage")];
    if (v5)
    {
      int v6 = v5;
      [*(id *)(a1 + 32) seekToEndOfFile];
      [*(id *)(a1 + 32) writeData:-[NSString dataUsingEncoding:](v6, "dataUsingEncoding:", 4)];
    }
  }
}

void sub_100005668(uint64_t a1, uint64_t a2)
{
  if (a2 != 5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    int v4 = 134217984;
    uint64_t v5 = a2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Invalid oslog stream: reason = %lu", (uint8_t *)&v4, 0xCu);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_100005720(uint64_t a1, long long *a2)
{
  uint64_t v4 = a1 + 16;
  *(void *)a1 = v6;
  *(void *)(a1 + *(void *)(v6 - 24)) = v5;
  *(void *)(a1 + 8) = 0;
  uint64_t v7 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v7, (void *)(a1 + 16));
  v7[1].__vftable = 0;
  v7[1].__fmtflags_ = -1;
  std::streambuf::basic_streambuf();
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_DWORD *)(a1 + 112) = 8;
  if ((long long *)(a1 + 80) != a2)
  {
    if (*((char *)a2 + 23) < 0)
    {
      sub_10000435C((void *)(a1 + 80), *(void **)a2, *((void *)a2 + 1));
    }
    else
    {
      long long v8 = *a2;
      *(void *)(a1 + 96) = *((void *)a2 + 2);
      *(_OWORD *)(a1 + 80) = v8;
    }
  }
  sub_10000E944(v4);
  return a1;
}

void sub_1000058DC(_Unwind_Exception *a1)
{
}

char *sub_100005930(char *a1)
{
  if (*((void *)a1 + 2))
  {
    uint64_t v2 = *(void *)a1;
    long long v3 = (char *)*((void *)a1 + 1);
    uint64_t v4 = *(void *)v3;
    *(void *)(v4 + 8) = *(void *)(*(void *)a1 + 8);
    **(void **)(v2 + 8) = v4;
    *((void *)a1 + 2) = 0;
    if (v3 != a1)
    {
      do
      {
        uint64_t v6 = (char *)*((void *)v3 + 1);
        if (v3[39] < 0) {
          operator delete(*((void **)v3 + 2));
        }
        operator delete(v3);
        long long v3 = v6;
      }
      while (v6 != a1);
    }
  }
  return a1;
}

uint64_t sub_1000059B4(uint64_t a1)
{
  if (*(char *)(a1 + 103) < 0) {
    operator delete(*(void **)(a1 + 80));
  }
  std::streambuf::~streambuf();
  std::istream::~istream();
  std::ios::~ios();
  return a1;
}

uint64_t sub_100005AB8(uint64_t a1)
{
  *(void *)(a1 + 16) = v3;
  if (*(char *)(a1 + 111) < 0) {
    operator delete(*(void **)(a1 + 88));
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  std::ios::~ios();
  return a1;
}

double CommandShell::convertCmdArgsToList@<D0>(CommandShell *this@<X0>, const char **a2@<X1>, void *a3@<X8>)
{
  *a3 = a3;
  a3[1] = a3;
  a3[2] = 0;
  if ((int)this >= 1)
  {
    for (uint64_t i = this; i; --i)
    {
      uint64_t v7 = *a2;
      size_t v8 = strlen(*a2);
      if (v8 >= 0x7FFFFFFFFFFFFFF8) {
        sub_100003540();
      }
      size_t v9 = v8;
      if (v8 >= 0x17)
      {
        uint64_t v11 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v8 | 7) != 0x17) {
          uint64_t v11 = v8 | 7;
        }
        uint64_t v12 = v11 + 1;
        p_dst = (long long *)operator new(v11 + 1);
        *((void *)&__dst + 1) = v9;
        unint64_t v18 = v12 | 0x8000000000000000;
        *(void *)&long long __dst = p_dst;
      }
      else
      {
        HIBYTE(v18) = v8;
        p_dst = &__dst;
        if (!v8) {
          goto LABEL_11;
        }
      }
      memmove(p_dst, v7, v9);
LABEL_11:
      *((unsigned char *)p_dst + v9) = 0;
      unint64_t v13 = operator new(0x28uLL);
      double result = *(double *)&__dst;
      v13[1] = __dst;
      *((void *)v13 + 4) = v18;
      xpc_object_t v15 = (void *)a3[1];
      *(void *)unint64_t v13 = a3;
      *((void *)v13 + 1) = v15;
      *xpc_object_t v15 = v13;
      uint64_t v16 = a3[2] + 1;
      a3[1] = v13;
      a3[2] = v16;
      ++a2;
    }
  }
  return result;
}

void sub_100005D08(_Unwind_Exception *a1)
{
  sub_100005930(v1);
  _Unwind_Resume(a1);
}

void sub_100005D1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
  {
    operator delete(__p);
    sub_100005930(v15);
    _Unwind_Resume(a1);
  }
  sub_100005930(v15);
  _Unwind_Resume(a1);
}

uint64_t *sub_100005D54(uint64_t *a1, uint64_t a2)
{
  char v31 = -86;
  std::istream::sentry::sentry();
  if (*(char *)(a2 + 23) < 0)
  {
    **(unsigned char **)a2 = 0;
    *(void *)(a2 + 8) = 0;
  }
  else
  {
    *(unsigned char *)a2 = 0;
    *(unsigned char *)(a2 + 23) = 0;
  }
  uint64_t v4 = *(void *)(*a1 - 24);
  uint64_t v5 = *(uint64_t *)((char *)a1 + v4 + 24);
  if (v5 <= 1) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = *(uint64_t *)((char *)a1 + v4 + 24);
  }
  std::ios_base::getloc((const std::ios_base *)((char *)a1 + v4));
  v29 = std::locale::use_facet(&v30, &std::ctype<char>::id);
  std::locale::~locale(&v30);
  uint64_t v7 = 0;
  size_t v8 = a1 + 5;
  if (v5 >= 1) {
    uint64_t v9 = v6;
  }
  else {
    uint64_t v9 = 0x7FFFFFFFFFFFFFF7;
  }
  while (1)
  {
    uint64_t v10 = *(void **)((char *)v8 + *(void *)(*a1 - 24));
    uint64_t v11 = (unsigned __int8 *)v10[3];
    if (v11 == (unsigned __int8 *)v10[4]) {
      break;
    }
    unsigned __int8 v12 = *v11;
LABEL_16:
    if ((v12 & 0x80) == 0 && (*((_DWORD *)&v29[1].~facet + v12) & 0x4000) != 0)
    {
      int v26 = 0;
      goto LABEL_44;
    }
    int v14 = *(char *)(a2 + 23);
    if (v14 < 0)
    {
      uint64_t v17 = *(void *)(a2 + 16) & 0x7FFFFFFFFFFFFFFFLL;
      size_t v16 = v17 - 1;
      if (*(void *)(a2 + 8) == v17 - 1)
      {
        if (v17 == 0x7FFFFFFFFFFFFFF8) {
          sub_100003540();
        }
        xpc_object_t v15 = *(unsigned char **)a2;
        size_t v18 = 0x7FFFFFFFFFFFFFF7;
        if (v16 <= 0x3FFFFFFFFFFFFFF2)
        {
LABEL_24:
          if (v16 + 1 > 2 * v16) {
            unint64_t v19 = v16 + 1;
          }
          else {
            unint64_t v19 = 2 * v16;
          }
          uint64_t v20 = (v19 & 0x7FFFFFFFFFFFFFF8) + 8;
          if ((v19 | 7) != 0x17) {
            uint64_t v20 = v19 | 7;
          }
          if (v19 >= 0x17) {
            size_t v18 = v20 + 1;
          }
          else {
            size_t v18 = 23;
          }
        }
        long long v21 = operator new(v18);
        v22 = v21;
        if (!v16 || (memmove(v21, v15, v16), v16 != 22)) {
          operator delete(v15);
        }
        *(void *)a2 = v22;
        *(void *)(a2 + 16) = v18 | 0x8000000000000000;
      }
      else
      {
        v22 = *(unsigned char **)a2;
        size_t v16 = *(void *)(a2 + 8);
      }
      *(void *)(a2 + 8) = v16 + 1;
      goto LABEL_39;
    }
    if (*(unsigned char *)(a2 + 23) == 22)
    {
      xpc_object_t v15 = (unsigned char *)a2;
      size_t v16 = 22;
      goto LABEL_24;
    }
    size_t v16 = *(unsigned __int8 *)(a2 + 23);
    *(unsigned char *)(a2 + 23) = (v14 + 1) & 0x7F;
    v22 = (unsigned char *)a2;
LABEL_39:
    v23 = &v22[v16];
    unsigned __int8 *v23 = v12;
    v23[1] = 0;
    size_t v24 = *(void **)((char *)v8 + *(void *)(*a1 - 24));
    uint64_t v25 = v24[3];
    if (v25 == v24[4]) {
      (*(void (**)(void *))(*v24 + 80))(v24);
    }
    else {
      v24[3] = v25 + 1;
    }
    if (v9 == ++v7)
    {
      int v26 = 0;
      uint64_t v7 = 1;
      goto LABEL_44;
    }
  }
  int v13 = (*(uint64_t (**)(void *))(*v10 + 72))(v10);
  unsigned __int8 v12 = v13;
  if (v13 != -1) {
    goto LABEL_16;
  }
  int v26 = 2;
LABEL_44:
  uint64_t v27 = *a1;
  *(uint64_t *)((char *)a1 + *(void *)(*a1 - 24) + 24) = 0;
  if (!v7) {
    v26 |= 4u;
  }
  std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(v27 - 24)), *(_DWORD *)((char *)a1 + *(void *)(v27 - 24) + 32) | v26);
  return a1;
}

void sub_10000608C(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::locale a11)
{
}

void sub_100006130(_Unwind_Exception *a1)
{
}

void sub_100006144(uint64_t a1, void *a2)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  uint64_t v27 = (uint64_t)&v27;
  uint64_t v28 = &v27;
  uint64_t v29 = 0;
  uint64_t v2 = a2[2];
  if (v2)
  {
    do
    {
      memset(__p, 170, sizeof(__p));
      uint64_t v5 = (char *)*a2;
      if (*(char *)(*a2 + 39) < 0)
      {
        sub_1000035FC(__p, *((void **)v5 + 2), *((void *)v5 + 3));
        uint64_t v5 = (char *)*a2;
        uint64_t v2 = a2[2];
      }
      else
      {
        *(_OWORD *)__p = *((_OWORD *)v5 + 1);
        __p[2] = *((void **)v5 + 4);
      }
      uint64_t v6 = *(void **)v5;
      v6[1] = *((void *)v5 + 1);
      **((void **)v5 + 1) = v6;
      a2[2] = v2 - 1;
      if (v5[39] < 0) {
        operator delete(*((void **)v5 + 2));
      }
      operator delete(v5);
      uint64_t v7 = (void *)HIBYTE(__p[2]);
      int v8 = SHIBYTE(__p[2]);
      uint64_t v9 = __p[1];
      if (SHIBYTE(__p[2]) < 0) {
        uint64_t v7 = __p[1];
      }
      if (v7 != (void *)2) {
        goto LABEL_15;
      }
      uint64_t v10 = (void **)__p[0];
      if (SHIBYTE(__p[2]) >= 0) {
        uint64_t v10 = __p;
      }
      if (*(_WORD *)v10 == 9766)
      {
        if (v29)
        {
          unint64_t v14 = *(void *)(a1 + 8);
          if (v14 >= *(void *)(a1 + 16))
          {
            xpc_object_t v15 = sub_10000A7B4((void **)a1, (uint64_t)&v27);
          }
          else
          {
            sub_10000A680(*(void **)(a1 + 8), (uint64_t)&v27);
            xpc_object_t v15 = (char *)(v14 + 24);
            *(void *)(a1 + 8) = v14 + 24;
          }
          *(void *)(a1 + 8) = v15;
          if (v29)
          {
            uint64_t v16 = v27;
            uint64_t v17 = v28;
            uint64_t v18 = *v28;
            *(void *)(v18 + 8) = *(void *)(v27 + 8);
            **(void **)(v16 + 8) = v18;
            uint64_t v29 = 0;
            if (v17 != &v27)
            {
              do
              {
                unint64_t v19 = (uint64_t *)v17[1];
                if (*((char *)v17 + 39) < 0) {
                  operator delete((void *)v17[2]);
                }
                operator delete(v17);
                uint64_t v17 = v19;
              }
              while (v19 != &v27);
            }
          }
        }
      }
      else
      {
LABEL_15:
        uint64_t v11 = (char *)operator new(0x28uLL);
        unsigned __int8 v12 = v11 + 16;
        *(void *)uint64_t v11 = 0;
        *((void *)v11 + 1) = 0;
        if (v8 < 0)
        {
          sub_1000035FC(v12, __p[0], (unint64_t)v9);
        }
        else
        {
          *(_OWORD *)unsigned __int8 v12 = *(_OWORD *)__p;
          *((void **)v11 + 4) = __p[2];
        }
        int v13 = v28;
        *(void *)uint64_t v11 = &v27;
        *((void *)v11 + 1) = v13;
        *int v13 = (uint64_t)v11;
        uint64_t v28 = (uint64_t *)v11;
        ++v29;
      }
      if (SHIBYTE(__p[2]) < 0) {
        operator delete(__p[0]);
      }
      uint64_t v2 = a2[2];
    }
    while (v2);
    if (v29)
    {
      unint64_t v20 = *(void *)(a1 + 8);
      if (v20 >= *(void *)(a1 + 16))
      {
        long long v21 = sub_10000A7B4((void **)a1, (uint64_t)&v27);
      }
      else
      {
        sub_10000A680(*(void **)(a1 + 8), (uint64_t)&v27);
        long long v21 = (char *)(v20 + 24);
        *(void *)(a1 + 8) = v20 + 24;
      }
      *(void *)(a1 + 8) = v21;
      if (v29)
      {
        uint64_t v22 = v27;
        v23 = v28;
        uint64_t v24 = *v28;
        *(void *)(v24 + 8) = *(void *)(v27 + 8);
        **(void **)(v22 + 8) = v24;
        uint64_t v29 = 0;
        if (v23 != &v27)
        {
          do
          {
            uint64_t v25 = (uint64_t *)v23[1];
            if (*((char *)v23 + 39) < 0) {
              operator delete((void *)v23[2]);
            }
            operator delete(v23);
            v23 = v25;
          }
          while (v25 != &v27);
        }
      }
    }
  }
}

void sub_1000063FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  sub_100005930(&a15);
  sub_100006484(v15);
  _Unwind_Resume(a1);
}

void **sub_100006484(void **a1)
{
  uint64_t v2 = (char *)*a1;
  if (*a1)
  {
    uint64_t v3 = (char *)a1[1];
    uint64_t v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        uint64_t v5 = v3 - 24;
        if (*((void *)v3 - 1))
        {
          uint64_t v6 = *((void *)v3 - 3);
          uint64_t v7 = (char *)*((void *)v3 - 2);
          uint64_t v8 = *(void *)v7;
          *(void *)(v8 + 8) = *(void *)(v6 + 8);
          **(void **)(v6 + 8) = v8;
          *((void *)v3 - 1) = 0;
          if (v7 != v5)
          {
            do
            {
              uint64_t v9 = (char *)*((void *)v7 + 1);
              if (v7[39] < 0) {
                operator delete(*((void **)v7 + 2));
              }
              operator delete(v7);
              uint64_t v7 = v9;
            }
            while (v9 != v5);
          }
        }
        uint64_t v3 = v5;
      }
      while (v5 != v2);
      uint64_t v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

void CommandShell::~CommandShell(CommandShell *this)
{
  *(void *)this = off_1000206F0;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 8);
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    uint64_t v3 = (std::__shared_weak_count *)*((void *)this + 6);
    if (!v3) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v3 = (std::__shared_weak_count *)*((void *)this + 6);
    if (!v3) {
      goto LABEL_7;
    }
  }
  if (!atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
LABEL_7:
  uint64_t v4 = (std::__shared_weak_count *)*((void *)this + 4);
  if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
    uint64_t v5 = (std::__shared_weak_count *)*((void *)this + 2);
    if (!v5) {
      return;
    }
  }
  else
  {
    uint64_t v5 = (std::__shared_weak_count *)*((void *)this + 2);
    if (!v5) {
      return;
    }
  }
  if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }
}

uint64_t CommandShell::run(void *a1, uint64_t a2)
{
  uint64_t v3 = a1;
  (*(void (**)(unsigned char *__return_ptr))(*a1 + 16))(__dst);
  uint64_t v4 = (std::__shared_weak_count *)v3[2];
  *(_OWORD *)(v3 + 1) = *(_OWORD *)__dst;
  v384 = v3 + 1;
  *(void *)&__dst[8] = 0;
  *(void *)long long __dst = 0;
  if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
  uint64_t v5 = *(std::__shared_weak_count **)&__dst[8];
  if (*(void *)&__dst[8]
    && !atomic_fetch_add((atomic_ullong *volatile)(*(void *)&__dst[8] + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }
  uint64_t v7 = v3[1];
  uint64_t v6 = v3[2];
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 16), 1uLL, memory_order_relaxed);
  }
  uint64_t v8 = (std::__shared_weak_count *)qword_1000242B8;
  qword_1000242B0 = v7;
  qword_1000242B8 = v6;
  if (v8) {
    std::__shared_weak_count::__release_weak(v8);
  }
  uint64_t v9 = *v384;
  if (!*v384) {
    return v9 & 1;
  }
  uint64_t v10 = v3[2];
  if (v10) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v10 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v11 = (std::__shared_weak_count *)v3[6];
  v3[5] = v9;
  v3[6] = v10;
  if (v11)
  {
    if (!atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
    uint64_t v9 = v3[5];
    uint64_t v10 = v3[6];
  }
  if (v10) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v10 + 8), 1uLL, memory_order_relaxed);
  }
  unsigned __int8 v12 = (std::__shared_weak_count *)v3[8];
  v3[7] = v9;
  v3[8] = v10;
  if (v12 && !atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
  }
  int v13 = *(uint64_t **)a2;
  uint64_t v14 = **(void **)a2;
  *(void *)(v14 + 8) = *(void *)(*(void *)a2 + 8);
  *(void *)v13[1] = v14;
  --*(void *)(a2 + 16);
  if (*((char *)v13 + 39) < 0)
  {
    operator delete((void *)v13[2]);
    operator delete(v13);
    uint64_t v389 = *(void *)(a2 + 16);
    if (!v389)
    {
LABEL_27:
      rl_bind_key(9, (rl_command_func_t *)&rl_complete);
      rl_completion_append_character = 0;
      rl_attempted_completion_function = (CPPFunction *)sub_10000AA88;
      uint64_t v16 = v3[1];
      uint64_t v15 = v3[2];
      if (v15) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v15 + 8), 1uLL, memory_order_relaxed);
      }
      uint64_t v17 = (std::__shared_weak_count *)v3[4];
      v3[3] = v16;
      v3[4] = v15;
      if (v17 && !atomic_fetch_add(&v17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
  }
  else
  {
    operator delete(v13);
    uint64_t v389 = *(void *)(a2 + 16);
    if (!v389) {
      goto LABEL_27;
    }
  }
  memset(v424, 170, 24);
  sub_10000A680(&v421, a2);
  sub_100006144((uint64_t)v424, &v421);
  if (v423)
  {
    uint64_t v18 = (char *)__p;
    uint64_t v19 = v421;
    uint64_t v20 = *(void *)__p;
    *(void *)(v20 + 8) = *(void *)(v421 + 8);
    **(void **)(v19 + 8) = v20;
    uint64_t v423 = 0;
    if (v18 != (char *)&v421)
    {
      do
      {
        long long v21 = (char *)*((void *)v18 + 1);
        if (v18[39] < 0) {
          operator delete(*((void **)v18 + 2));
        }
        operator delete(v18);
        uint64_t v18 = v21;
      }
      while (v21 != (char *)&v421);
    }
  }
  v386 = v3 + 3;
  long long v419 = 0uLL;
  uint64_t v420 = 0;
  int v387 = 1;
  v393 = v3;
  while (2)
  {
    v23 = v424[0];
    v385 = v424[1];
    if (v424[0] != v424[1])
    {
      int v391 = 1;
      do
      {
        v416 = &v416;
        v417 = &v416;
        unint64_t v418 = 0;
        uint64_t v24 = v23[1];
        if ((void *)v24 == v23) {
          goto LABEL_607;
        }
        unint64_t v25 = 0;
        int v26 = &v416;
        do
        {
          uint64_t v29 = operator new(0x28uLL);
          std::locale v30 = v29 + 2;
          void *v29 = 0;
          v29[1] = 0;
          if (*(char *)(v24 + 39) < 0)
          {
            sub_1000035FC(v30, *(void **)(v24 + 16), *(void *)(v24 + 24));
            int v26 = v416;
            unint64_t v28 = v418;
          }
          else
          {
            long long v27 = *(_OWORD *)(v24 + 16);
            v29[4] = *(void *)(v24 + 32);
            *(_OWORD *)std::locale v30 = v27;
            unint64_t v28 = v25;
          }
          void *v29 = v26;
          v29[1] = &v416;
          v26[1] = v29;
          unint64_t v25 = v28 + 1;
          v416 = v29;
          unint64_t v418 = v28 + 1;
          uint64_t v24 = *(void *)(v24 + 8);
          int v26 = v29;
        }
        while ((void *)v24 != v23);
        unint64_t v388 = v28;
        if (v28 == -1) {
          goto LABEL_607;
        }
        while (2)
        {
          memset(v415, 170, sizeof(v415));
          char v31 = (char *)v416;
          if (*((char *)v416 + 39) < 0)
          {
            sub_1000035FC(v415, *((void **)v416 + 2), *((void *)v416 + 3));
            char v31 = (char *)v416;
            unint64_t v25 = v418;
          }
          else
          {
            *(_OWORD *)v415 = *((_OWORD *)v416 + 1);
            v415[2] = *((void **)v416 + 4);
          }
          uint64_t v32 = *(void *)v31;
          *(void *)(v32 + 8) = *((void *)v31 + 1);
          **((void **)v31 + 1) = v32;
          unint64_t v418 = v25 - 1;
          if (v31[39] < 0) {
            operator delete(*((void **)v31 + 2));
          }
          operator delete(v31);
          unint64_t v33 = v418;
          xpc_object_t v34 = (void *)HIBYTE(v415[2]);
          if (SHIBYTE(v415[2]) < 0) {
            xpc_object_t v34 = v415[1];
          }
          if (v34 == (void *)2)
          {
            v35 = (void **)v415[0];
            if (SHIBYTE(v415[2]) >= 0) {
              v35 = v415;
            }
            if (*(_WORD *)v35 == 25699)
            {
              v412 = &v412;
              v413 = &v412;
              unint64_t v414 = 0;
              v59 = (void **)v417;
              if (v417 == &v416)
              {
                unint64_t v60 = 0;
                v63 = &v412;
              }
              else
              {
                unint64_t v60 = 0;
                v61 = &v412;
                do
                {
                  v63 = operator new(0x28uLL);
                  v64 = v63 + 2;
                  void *v63 = 0;
                  v63[1] = 0;
                  if (*((char *)v59 + 39) < 0)
                  {
                    sub_1000035FC(v64, v59[2], (unint64_t)v59[3]);
                    v61 = v412;
                    unint64_t v60 = v414;
                  }
                  else
                  {
                    long long v62 = *((_OWORD *)v59 + 1);
                    v63[4] = v59[4];
                    *(_OWORD *)v64 = v62;
                  }
                  void *v63 = v61;
                  v63[1] = &v412;
                  v61[1] = v63;
                  ++v60;
                  v412 = v63;
                  unint64_t v414 = v60;
                  v59 = (void **)v59[1];
                  v61 = v63;
                }
                while (v59 != &v416);
                if (v60 >= 2)
                {
                  char v65 = 0;
                  goto LABEL_545;
                }
              }
              v110 = (std::__shared_weak_count *)v3[6];
              uint64_t v426 = v3[5];
              v427 = v110;
              if (v110)
              {
                atomic_fetch_add_explicit(&v110->__shared_owners_, 1uLL, memory_order_relaxed);
                unint64_t v60 = v414;
              }
              if (!v60)
              {
                uint64_t v114 = v3[1];
                uint64_t v113 = v3[2];
                if (v113) {
                  atomic_fetch_add_explicit((atomic_ullong *volatile)(v113 + 8), 1uLL, memory_order_relaxed);
                }
                v115 = (std::__shared_weak_count *)v3[6];
                v3[5] = v114;
                v3[6] = v113;
                if (v115 && !atomic_fetch_add(&v115->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                {
                  ((void (*)(std::__shared_weak_count *))v115->__on_zero_shared)(v115);
                  std::__shared_weak_count::__release_weak(v115);
                }
                goto LABEL_509;
              }
              memset(v449, 170, 24);
              if (*((char *)v63 + 39) < 0)
              {
                sub_1000035FC(v449, (void *)v63[2], v63[3]);
                v63 = v412;
                unint64_t v60 = v414;
              }
              else
              {
                *(_OWORD *)v449 = *((_OWORD *)v63 + 1);
                v449[2] = *((void **)v63 + 4);
              }
              uint64_t v123 = *v63;
              *(void *)(v123 + 8) = v63[1];
              *(void *)v63[1] = v123;
              unint64_t v414 = v60 - 1;
              if (*((char *)v63 + 39) < 0) {
                operator delete((void *)v63[2]);
              }
              operator delete(v63);
              memset(v448, 170, 24);
              if (SHIBYTE(v449[2]) < 0)
              {
                sub_1000035FC(v448, v449[0], (unint64_t)v449[1]);
                if (SHIBYTE(v449[2]) < 0)
                {
                  int v124 = 1;
                  if (!v449[1]) {
                    goto LABEL_835;
                  }
                }
                else
                {
                  int v124 = 0;
                  if (!HIBYTE(v449[2])) {
LABEL_835:
                  }
                    sub_1000042B4();
                }
              }
              else
              {
                int v124 = 0;
                *(_OWORD *)&v448[0].__locale_ = *(_OWORD *)v449;
                v448[2] = (std::locale)v449[2];
                if (!HIBYTE(v449[2])) {
                  goto LABEL_835;
                }
              }
              BOOL v88 = v124 == 0;
              v128 = v449;
              if (!v88) {
                v128 = (void **)v449[0];
              }
              if (*(unsigned char *)v128 != 47) {
                goto LABEL_325;
              }
              uint64_t v129 = v3[5];
              v130 = *(std::__shared_weak_count **)(v129 + 32);
              if (!v130)
              {
                *(_OWORD *)v432 = 0uLL;
                goto LABEL_312;
              }
              uint64_t v131 = *(void *)(v129 + 24);
              atomic_fetch_add_explicit(&v130->__shared_weak_owners_, 1uLL, memory_order_relaxed);
              *(void *)v432 = 0;
              *(void *)&v432[8] = std::__shared_weak_count::lock(v130);
              if (!*(void *)&v432[8])
              {
                std::__shared_weak_count::__release_weak(v130);
                unsigned __int8 v147 = HIBYTE(v449[2]);
                if (SHIBYTE(v449[2]) < 0) {
                  goto LABEL_317;
                }
LABEL_313:
                v148 = (char *)v449 + 1;
                if (v147)
                {
                  size_t v149 = v147 - 1;
                  if (v149 <= 0x7FFFFFFFFFFFFFF7) {
                    goto LABEL_319;
                  }
                  goto LABEL_836;
                }
LABEL_837:
                sub_1000042B4();
              }
              *(void *)v432 = v131;
              std::__shared_weak_count::__release_weak(v130);
              if (!v131)
              {
LABEL_312:
                unsigned __int8 v147 = HIBYTE(v449[2]);
                if ((SHIBYTE(v449[2]) & 0x80000000) == 0) {
                  goto LABEL_313;
                }
LABEL_317:
                if (v449[1])
                {
                  v148 = (char *)v449[0] + 1;
                  size_t v149 = (size_t)v449[1] - 1;
                  if ((unint64_t)v449[1] - 1 <= 0x7FFFFFFFFFFFFFF7)
                  {
LABEL_319:
                    if (v149 >= 0x17)
                    {
                      uint64_t v227 = (v149 & 0xFFFFFFFFFFFFFFF8) + 8;
                      if ((v149 | 7) != 0x17) {
                        uint64_t v227 = v149 | 7;
                      }
                      uint64_t v228 = v227 + 1;
                      v150 = operator new(v227 + 1);
                      *(void *)&__dst[16] = v228 | 0x8000000000000000;
                      *(void *)long long __dst = v150;
                      *(void *)&__dst[8] = v149;
                    }
                    else
                    {
                      __dst[23] = v149;
                      v150 = __dst;
                      if (!v149)
                      {
                        __dst[0] = 0;
                        if ((SHIBYTE(v448[2].__locale_) & 0x80000000) == 0) {
                          goto LABEL_322;
                        }
LABEL_539:
                        operator delete(v448[0].__locale_);
LABEL_322:
                        *(_OWORD *)&v448[0].__locale_ = *(_OWORD *)__dst;
                        v448[2] = *(std::locale *)&__dst[16];
                        v151 = *(std::__shared_weak_count **)&v432[8];
                        uint64_t v3 = v393;
                        if (*(void *)&v432[8]
                          && !atomic_fetch_add((atomic_ullong *volatile)(*(void *)&v432[8] + 8), 0xFFFFFFFFFFFFFFFFLL))
                        {
                          ((void (*)(std::__shared_weak_count *))v151->__on_zero_shared)(v151);
                          std::__shared_weak_count::__release_weak(v151);
                        }
LABEL_325:
                        long long v430 = 0uLL;
                        unint64_t v431 = 0;
                        locale = (char *)v448;
                        if (SHIBYTE(v448[2].__locale_) >= 0)
                        {
                          locale_high = (std::locale::__imp *)HIBYTE(v448[2].__locale_);
                        }
                        else
                        {
                          locale = (char *)v448[0].__locale_;
                          locale_high = v448[1].__locale_;
                        }
                        if (!locale_high) {
                          goto LABEL_350;
                        }
                        v154 = locale;
                        if ((unint64_t)locale_high < 8) {
                          goto LABEL_523;
                        }
                        v154 = &locale[(unint64_t)locale_high & 0xFFFFFFFFFFFFFFF8];
                        v155 = locale + 3;
                        unint64_t v156 = (unint64_t)locale_high & 0xFFFFFFFFFFFFFFF8;
                        while (2)
                        {
                          int8x8_t v157 = vceq_s8(*(int8x8_t *)(v155 - 3), (int8x8_t)0x2F2F2F2F2F2F2F2FLL);
                          if (v157.i8[0])
                          {
                            *(v155 - 3) = 32;
                            if ((v157.i8[1] & 1) == 0) {
                              goto LABEL_334;
                            }
LABEL_342:
                            *(v155 - 2) = 32;
                            if ((v157.i8[2] & 1) == 0) {
                              goto LABEL_343;
                            }
LABEL_335:
                            *(v155 - 1) = 32;
                            if ((v157.i8[3] & 1) == 0) {
                              goto LABEL_336;
                            }
LABEL_344:
                            unsigned char *v155 = 32;
                            if ((v157.i8[4] & 1) == 0) {
                              goto LABEL_345;
                            }
LABEL_337:
                            v155[1] = 32;
                            if ((v157.i8[5] & 1) == 0) {
                              goto LABEL_338;
                            }
LABEL_346:
                            v155[2] = 32;
                            if ((v157.i8[6] & 1) == 0) {
                              goto LABEL_347;
                            }
LABEL_339:
                            v155[3] = 32;
                            if (v157.i8[7]) {
                              goto LABEL_348;
                            }
                          }
                          else
                          {
                            if (v157.i8[1]) {
                              goto LABEL_342;
                            }
LABEL_334:
                            if (v157.i8[2]) {
                              goto LABEL_335;
                            }
LABEL_343:
                            if (v157.i8[3]) {
                              goto LABEL_344;
                            }
LABEL_336:
                            if (v157.i8[4]) {
                              goto LABEL_337;
                            }
LABEL_345:
                            if (v157.i8[5]) {
                              goto LABEL_346;
                            }
LABEL_338:
                            if (v157.i8[6]) {
                              goto LABEL_339;
                            }
LABEL_347:
                            if (v157.i8[7]) {
LABEL_348:
                            }
                              v155[4] = 32;
                          }
                          v155 += 8;
                          v156 -= 8;
                          if (!v156)
                          {
                            if (locale_high == (std::locale::__imp *)((unint64_t)locale_high & 0xFFFFFFFFFFFFFFF8)) {
                              goto LABEL_350;
                            }
LABEL_523:
                            v226 = (char *)locale_high + (void)locale;
                            do
                            {
                              if (*v154 == 47) {
                                char *v154 = 32;
                              }
                              ++v154;
                            }
                            while (v154 != v226);
LABEL_350:
                            *(void *)&long long v158 = 0xAAAAAAAAAAAAAAAALL;
                            *((void *)&v158 + 1) = 0xAAAAAAAAAAAAAAAALL;
                            v451[7] = v158;
                            v451[8] = v158;
                            v451[5] = v158;
                            v451[6] = v158;
                            v451[3] = v158;
                            v451[4] = v158;
                            v451[1] = v158;
                            v451[2] = v158;
                            *(_OWORD *)&__dst[112] = v158;
                            v451[0] = v158;
                            *(_OWORD *)&__dst[80] = v158;
                            *(_OWORD *)&__dst[96] = v158;
                            *(_OWORD *)&__dst[48] = v158;
                            *(_OWORD *)&__dst[64] = v158;
                            *(_OWORD *)&__dst[16] = v158;
                            *(_OWORD *)&__dst[32] = v158;
                            *(_OWORD *)long long __dst = v158;
                            sub_100005720((uint64_t)__dst, (long long *)v448);
                            while (2)
                            {
                              memset(v432, 0, 24);
                              sub_100005D54((uint64_t *)__dst, (uint64_t)v432);
                              int v159 = *(_DWORD *)&__dst[*(void *)(*(void *)__dst - 24) + 32] & 5;
                              if (v159)
                              {
                                if ((v432[23] & 0x80000000) != 0) {
                                  goto LABEL_360;
                                }
                              }
                              else
                              {
                                v160 = (_OWORD *)*((void *)&v430 + 1);
                                if (*((void *)&v430 + 1) < v431)
                                {
                                  if ((v432[23] & 0x80000000) != 0)
                                  {
                                    sub_1000035FC(*((unsigned char **)&v430 + 1), *(void **)v432, *(unint64_t *)&v432[8]);
                                    *((void *)&v430 + 1) = (char *)v160 + 24;
                                    if ((v432[23] & 0x80000000) == 0) {
                                      goto LABEL_351;
                                    }
                                  }
                                  else
                                  {
                                    long long v161 = *(_OWORD *)v432;
                                    *(void *)(*((void *)&v430 + 1) + 16) = *(void *)&v432[16];
                                    _OWORD *v160 = v161;
                                    *((void *)&v430 + 1) = (char *)v160 + 24;
                                    if ((v432[23] & 0x80000000) == 0) {
                                      goto LABEL_351;
                                    }
                                  }
LABEL_360:
                                  operator delete(*(void **)v432);
                                  goto LABEL_351;
                                }
                                *((void *)&v430 + 1) = sub_10000405C((char **)&v430, (uint64_t)v432);
                                if ((v432[23] & 0x80000000) != 0) {
                                  goto LABEL_360;
                                }
                              }
LABEL_351:
                              if (v159)
                              {
                                *(void *)long long __dst = v383;
                                *(void *)&__dst[*(void *)(v383 - 24)] = v382;
                                if ((__dst[103] & 0x80000000) != 0) {
                                  operator delete(*(void **)&__dst[80]);
                                }
                                std::streambuf::~streambuf();
                                std::istream::~istream();
                                std::ios::~ios();
                                v392 = (void **)*((void *)&v430 + 1);
                                v162 = (void **)v430;
                                if ((void)v430 == *((void *)&v430 + 1))
                                {
                                  char v390 = 1;
                                  if (!(void)v430) {
                                    goto LABEL_530;
                                  }
LABEL_505:
                                  v218 = (void **)*((void *)&v430 + 1);
                                  if (*((void ***)&v430 + 1) == v162)
                                  {
                                    *((void *)&v430 + 1) = v162;
                                    operator delete(v162);
                                    if ((SHIBYTE(v448[2].__locale_) & 0x80000000) == 0) {
                                      goto LABEL_531;
                                    }
                                  }
                                  else
                                  {
                                    do
                                    {
                                      if (*((char *)v218 - 1) < 0) {
                                        operator delete(*(v218 - 3));
                                      }
                                      v218 -= 3;
                                    }
                                    while (v218 != v162);
                                    *((void *)&v430 + 1) = v162;
                                    operator delete((void *)v430);
                                    if ((SHIBYTE(v448[2].__locale_) & 0x80000000) == 0) {
                                      goto LABEL_531;
                                    }
                                  }
                                  goto LABEL_507;
                                }
                                char v390 = 1;
LABEL_372:
                                memset(__dst, 170, 24);
                                if (*((char *)v162 + 23) < 0)
                                {
                                  sub_1000035FC(__dst, *v162, (unint64_t)v162[1]);
                                }
                                else
                                {
                                  long long v164 = *(_OWORD *)v162;
                                  *(void *)&__dst[16] = v162[2];
                                  *(_OWORD *)long long __dst = v164;
                                }
                                uint64_t v165 = v3[5];
                                if ((__dst[23] & 0x80000000) != 0)
                                {
                                  sub_1000035FC(&v428, *(void **)__dst, *(unint64_t *)&__dst[8]);
                                }
                                else
                                {
                                  long long v428 = *(_OWORD *)__dst;
                                  uint64_t v429 = *(void *)&__dst[16];
                                }
                                v166 = *(uint64_t **)(v165 + 168);
                                size_t v167 = HIBYTE(v429);
                                if (!v166) {
                                  goto LABEL_446;
                                }
                                v168 = v23;
                                if (v429 >= 0) {
                                  v169 = &v428;
                                }
                                else {
                                  v169 = (long long *)v428;
                                }
                                if (v429 >= 0) {
                                  size_t v170 = HIBYTE(v429);
                                }
                                else {
                                  size_t v170 = *((void *)&v428 + 1);
                                }
                                v171 = (uint64_t *)(v165 + 168);
                                while (1)
                                {
                                  int v172 = *((char *)v166 + 55);
                                  if (v172 >= 0) {
                                    v173 = v166 + 4;
                                  }
                                  else {
                                    v173 = (const void *)v166[4];
                                  }
                                  if (v172 >= 0) {
                                    size_t v174 = *((unsigned __int8 *)v166 + 55);
                                  }
                                  else {
                                    size_t v174 = v166[5];
                                  }
                                  if (v170 >= v174) {
                                    size_t v175 = v174;
                                  }
                                  else {
                                    size_t v175 = v170;
                                  }
                                  int v176 = memcmp(v173, v169, v175);
                                  if (v176)
                                  {
                                    if (v176 < 0) {
                                      goto LABEL_386;
                                    }
                                  }
                                  else if (v174 < v170)
                                  {
LABEL_386:
                                    v166 = (uint64_t *)v166[1];
                                    if (!v166) {
                                      goto LABEL_401;
                                    }
                                    continue;
                                  }
                                  v171 = v166;
                                  v166 = (uint64_t *)*v166;
                                  if (!v166)
                                  {
LABEL_401:
                                    v23 = v168;
                                    if (v171 != (uint64_t *)(v165 + 168))
                                    {
                                      v179 = (uint64_t *)v171[4];
                                      v178 = v171 + 4;
                                      v177 = v179;
                                      int v180 = *((char *)v178 + 23);
                                      if (v180 >= 0) {
                                        v181 = v178;
                                      }
                                      else {
                                        v181 = v177;
                                      }
                                      if (v180 >= 0) {
                                        size_t v182 = *((unsigned __int8 *)v178 + 23);
                                      }
                                      else {
                                        size_t v182 = v178[1];
                                      }
                                      if (v182 >= v170) {
                                        size_t v183 = v170;
                                      }
                                      else {
                                        size_t v183 = v182;
                                      }
                                      int v184 = memcmp(v169, v181, v183);
                                      if (v184)
                                      {
                                        if ((v184 & 0x80000000) == 0)
                                        {
LABEL_413:
                                          BOOL v185 = 1;
                                          if ((v167 & 0x80) == 0) {
                                            goto LABEL_485;
                                          }
                                          goto LABEL_414;
                                        }
                                      }
                                      else if (v170 >= v182)
                                      {
                                        goto LABEL_413;
                                      }
                                    }
LABEL_446:
                                    v200 = *(uint64_t **)(v165 + 192);
                                    v199 = (uint64_t *)(v165 + 192);
                                    v198 = v200;
                                    if (!v200) {
                                      goto LABEL_483;
                                    }
                                    if ((v167 & 0x80u) == 0) {
                                      v201 = &v428;
                                    }
                                    else {
                                      v201 = (long long *)v428;
                                    }
                                    if ((v167 & 0x80u) == 0) {
                                      size_t v202 = v167;
                                    }
                                    else {
                                      size_t v202 = *((void *)&v428 + 1);
                                    }
                                    v203 = v199;
                                    while (2)
                                    {
                                      while (2)
                                      {
                                        int v204 = *((char *)v198 + 55);
                                        if (v204 >= 0) {
                                          v205 = v198 + 4;
                                        }
                                        else {
                                          v205 = (const void *)v198[4];
                                        }
                                        if (v204 >= 0) {
                                          size_t v206 = *((unsigned __int8 *)v198 + 55);
                                        }
                                        else {
                                          size_t v206 = v198[5];
                                        }
                                        if (v202 >= v206) {
                                          size_t v207 = v206;
                                        }
                                        else {
                                          size_t v207 = v202;
                                        }
                                        int v208 = memcmp(v205, v201, v207);
                                        if (v208)
                                        {
                                          if (v208 < 0) {
                                            break;
                                          }
                                          goto LABEL_454;
                                        }
                                        if (v206 >= v202)
                                        {
LABEL_454:
                                          v203 = v198;
                                          v198 = (uint64_t *)*v198;
                                          if (!v198) {
                                            goto LABEL_471;
                                          }
                                          continue;
                                        }
                                        break;
                                      }
                                      v198 = (uint64_t *)v198[1];
                                      if (v198) {
                                        continue;
                                      }
                                      break;
                                    }
LABEL_471:
                                    if (v203 == v199) {
                                      goto LABEL_483;
                                    }
                                    int v209 = *((char *)v203 + 55);
                                    if (v209 >= 0) {
                                      v210 = v203 + 4;
                                    }
                                    else {
                                      v210 = (const void *)v203[4];
                                    }
                                    if (v209 >= 0) {
                                      size_t v211 = *((unsigned __int8 *)v203 + 55);
                                    }
                                    else {
                                      size_t v211 = v203[5];
                                    }
                                    if (v211 >= v202) {
                                      size_t v212 = v202;
                                    }
                                    else {
                                      size_t v212 = v211;
                                    }
                                    int v213 = memcmp(v201, v210, v212);
                                    if (v213)
                                    {
                                      if (v213 < 0) {
                                        goto LABEL_483;
                                      }
                                    }
                                    else if (v202 < v211)
                                    {
LABEL_483:
                                      v203 = v199;
                                    }
                                    BOOL v185 = v199 != v203;
                                    if ((v167 & 0x80) == 0)
                                    {
LABEL_485:
                                      if (!v185) {
                                        goto LABEL_415;
                                      }
LABEL_486:
                                      uint64_t v3 = v393;
                                      uint64_t v214 = v393[5];
                                      if ((__dst[23] & 0x80000000) != 0)
                                      {
                                        sub_1000035FC(v425, *(void **)__dst, *(unint64_t *)&__dst[8]);
                                      }
                                      else
                                      {
                                        *(_OWORD *)v425 = *(_OWORD *)__dst;
                                        v425[2] = *(void **)&__dst[16];
                                      }
                                      CommandBase::getSubCommandObj(v214, (uint64_t)v425, (uint64_t **)v432);
                                      long long v215 = *(_OWORD *)v432;
                                      *(_OWORD *)v432 = 0uLL;
                                      v216 = (std::__shared_weak_count *)v393[6];
                                      *(_OWORD *)(v393 + 5) = v215;
                                      if (v216 && !atomic_fetch_add(&v216->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                                      {
                                        ((void (*)(std::__shared_weak_count *))v216->__on_zero_shared)(v216);
                                        std::__shared_weak_count::__release_weak(v216);
                                        v217 = *(std::__shared_weak_count **)&v432[8];
                                        if (*(void *)&v432[8]) {
                                          goto LABEL_492;
                                        }
                                      }
                                      else
                                      {
                                        v217 = *(std::__shared_weak_count **)&v432[8];
                                        if (*(void *)&v432[8])
                                        {
LABEL_492:
                                          if (!atomic_fetch_add(&v217->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                                          {
                                            ((void (*)(std::__shared_weak_count *))v217->__on_zero_shared)(v217);
                                            std::__shared_weak_count::__release_weak(v217);
                                          }
                                        }
                                      }
                                      if (SHIBYTE(v425[2]) < 0)
                                      {
                                        operator delete(v425[0]);
                                        char v197 = 1;
                                        if ((__dst[23] & 0x80) != 0) {
LABEL_367:
                                        }
                                          operator delete(*(void **)__dst);
                                      }
                                      else
                                      {
LABEL_496:
                                        char v197 = 1;
                                        if ((__dst[23] & 0x80) != 0) {
                                          goto LABEL_367;
                                        }
                                      }
LABEL_368:
                                      v162 += 3;
                                      if (v162 == v392) {
                                        char v163 = 0;
                                      }
                                      else {
                                        char v163 = v197;
                                      }
                                      if ((v163 & 1) == 0)
                                      {
                                        v162 = (void **)v430;
                                        if ((void)v430) {
                                          goto LABEL_505;
                                        }
LABEL_530:
                                        if ((SHIBYTE(v448[2].__locale_) & 0x80000000) == 0)
                                        {
LABEL_531:
                                          if ((SHIBYTE(v449[2]) & 0x80000000) == 0)
                                          {
LABEL_532:
                                            if ((v390 & 1) == 0)
                                            {
LABEL_533:
                                              char v65 = 0;
                                              v225 = v427;
                                              if (!v427)
                                              {
LABEL_544:
                                                if (v414) {
                                                  goto LABEL_545;
                                                }
LABEL_546:
                                                if (v65) {
                                                  goto LABEL_586;
                                                }
                                                if (v418 >= 2)
                                                {
                                                  v232 = sub_10000369C(&std::cout, (uint64_t)"error:", 6);
                                                  v233 = sub_10000369C(v232, (uint64_t)" switch command takes only one argument", 39);
                                                  std::ios_base::getloc((const std::ios_base *)((char *)v233
                                                                                              + *(void *)(*v233 - 24)));
                                                  v234 = std::locale::use_facet((const std::locale *)__dst, &std::ctype<char>::id);
                                                  ((void (*)(const std::locale::facet *, uint64_t))v234->__vftable[2].~facet_0)(v234, 10);
                                                  std::locale::~locale((std::locale *)__dst);
                                                  std::ostream::put();
                                                  std::ostream::flush();
                                                  goto LABEL_586;
                                                }
                                                if (v418)
                                                {
                                                  v236 = sub_10000369C(&std::cout, (uint64_t)"Invalid sub-command '", 21);
                                                  int v237 = *((char *)v416 + 39);
                                                  if (v237 >= 0) {
                                                    v238 = (void **)((char *)v416 + 16);
                                                  }
                                                  else {
                                                    v238 = (void **)*((void *)v416 + 2);
                                                  }
                                                  if (v237 >= 0) {
                                                    uint64_t v239 = *((unsigned __int8 *)v416 + 39);
                                                  }
                                                  else {
                                                    uint64_t v239 = *((void *)v416 + 3);
                                                  }
LABEL_583:
                                                  v245 = sub_10000369C(v236, (uint64_t)v238, v239);
                                                  sub_10000369C(v245, (uint64_t)"'.", 2);
                                                }
                                                v246 = sub_10000369C(&std::cout, (uint64_t)" See '", 6);
                                                v247 = sub_10000369C(v246, (uint64_t)"help", 4);
                                                v248 = sub_10000369C(v247, (uint64_t)"' for usage.", 12);
                                                std::ios_base::getloc((const std::ios_base *)((char *)v248
                                                                                            + *(void *)(*v248 - 24)));
                                                v249 = std::locale::use_facet((const std::locale *)__dst, &std::ctype<char>::id);
                                                ((void (*)(const std::locale::facet *, uint64_t))v249->__vftable[2].~facet_0)(v249, 10);
                                                std::locale::~locale((std::locale *)__dst);
                                                std::ostream::put();
                                                std::ostream::flush();
                                                goto LABEL_585;
                                              }
LABEL_543:
                                              if (atomic_fetch_add(&v225->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
                                                goto LABEL_544;
                                              }
                                              ((void (*)(std::__shared_weak_count *))v225->__on_zero_shared)(v225);
                                              std::__shared_weak_count::__release_weak(v225);
                                              if (!v414) {
                                                goto LABEL_546;
                                              }
LABEL_545:
                                              v229 = v412;
                                              v230 = v413;
                                              uint64_t v231 = *v413;
                                              *(void *)(v231 + 8) = v412[1];
                                              *(void *)v229[1] = v231;
                                              unint64_t v414 = 0;
                                              if (v230 != &v412)
                                              {
                                                do
                                                {
                                                  v235 = (void *)v230[1];
                                                  if (*((char *)v230 + 39) < 0) {
                                                    operator delete((void *)v230[2]);
                                                  }
                                                  operator delete(v230);
                                                  v230 = v235;
                                                }
                                                while (v235 != &v412);
                                              }
                                              goto LABEL_546;
                                            }
LABEL_509:
                                            if (*v386)
                                            {
                                              uint64_t v219 = v426;
                                              v220 = v427;
                                              if (v427) {
                                                atomic_fetch_add_explicit(&v427->__shared_owners_, 1uLL, memory_order_relaxed);
                                              }
                                              v221 = (std::__shared_weak_count *)v3[8];
                                              v3[7] = v219;
                                              v3[8] = v220;
                                              if (v221
                                                && !atomic_fetch_add(&v221->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                                              {
                                                ((void (*)(std::__shared_weak_count *))v221->__on_zero_shared)(v221);
                                                std::__shared_weak_count::__release_weak(v221);
                                                uint64_t v223 = v3[5];
                                                uint64_t v222 = v3[6];
                                                if (v222) {
LABEL_515:
                                                }
                                                  atomic_fetch_add_explicit((atomic_ullong *volatile)(v222 + 8), 1uLL, memory_order_relaxed);
                                              }
                                              else
                                              {
                                                uint64_t v223 = v3[5];
                                                uint64_t v222 = v3[6];
                                                if (v222) {
                                                  goto LABEL_515;
                                                }
                                              }
                                              v224 = (std::__shared_weak_count *)v3[4];
                                              v3[3] = v223;
                                              v3[4] = v222;
                                              if (v224
                                                && !atomic_fetch_add(&v224->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                                              {
                                                ((void (*)(std::__shared_weak_count *))v224->__on_zero_shared)(v224);
                                                std::__shared_weak_count::__release_weak(v224);
                                                char v65 = 1;
                                                v225 = v427;
                                                if (!v427) {
                                                  goto LABEL_544;
                                                }
                                                goto LABEL_543;
                                              }
                                            }
                                            char v65 = 1;
                                            v225 = v427;
                                            if (!v427) {
                                              goto LABEL_544;
                                            }
                                            goto LABEL_543;
                                          }
LABEL_508:
                                          operator delete(v449[0]);
                                          if ((v390 & 1) == 0) {
                                            goto LABEL_533;
                                          }
                                          goto LABEL_509;
                                        }
LABEL_507:
                                        operator delete(v448[0].__locale_);
                                        if ((SHIBYTE(v449[2]) & 0x80000000) == 0) {
                                          goto LABEL_532;
                                        }
                                        goto LABEL_508;
                                      }
                                      goto LABEL_372;
                                    }
LABEL_414:
                                    operator delete((void *)v428);
                                    if (v185) {
                                      goto LABEL_486;
                                    }
LABEL_415:
                                    uint64_t v186 = __dst[23];
                                    if (__dst[23] < 0) {
                                      uint64_t v186 = *(void *)&__dst[8];
                                    }
                                    uint64_t v3 = v393;
                                    if (v186 == 1)
                                    {
                                      if (__dst[23] >= 0) {
                                        v194 = __dst;
                                      }
                                      else {
                                        v194 = *(unsigned char **)__dst;
                                      }
                                      if (*v194 == 45)
                                      {
                                        uint64_t v196 = v393[7];
                                        uint64_t v195 = v393[8];
                                        if (v195) {
                                          atomic_fetch_add_explicit((atomic_ullong *volatile)(v195 + 8), 1uLL, memory_order_relaxed);
                                        }
                                        v189 = (std::__shared_weak_count *)v393[6];
                                        v393[5] = v196;
                                        v393[6] = v195;
                                        if (!v189 || atomic_fetch_add(&v189->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
                                          goto LABEL_496;
                                        }
                                        ((void (*)(std::__shared_weak_count *))v189->__on_zero_shared)(v189);
                                        goto LABEL_439;
                                      }
                                    }
                                    else
                                    {
                                      if (v186 != 2)
                                      {
                                        char v390 = 0;
                                        char v197 = 0;
                                        if ((__dst[23] & 0x80) != 0) {
                                          goto LABEL_367;
                                        }
                                        goto LABEL_368;
                                      }
                                      if (__dst[23] >= 0) {
                                        v187 = __dst;
                                      }
                                      else {
                                        v187 = *(_WORD **)__dst;
                                      }
                                      if (*v187 == 11822)
                                      {
                                        uint64_t v188 = v393[5];
                                        v189 = *(std::__shared_weak_count **)(v188 + 32);
                                        if (!v189) {
                                          goto LABEL_496;
                                        }
                                        uint64_t v190 = *(void *)(v188 + 24);
                                        atomic_fetch_add_explicit(&v189->__shared_weak_owners_, 1uLL, memory_order_relaxed);
                                        v191 = std::__shared_weak_count::lock(v189);
                                        if (v191)
                                        {
                                          v192 = v191;
                                          if (v190
                                            && (atomic_fetch_add_explicit(&v191->__shared_owners_, 1uLL, memory_order_relaxed), v193 = (std::__shared_weak_count *)v393[6], v393[5] = v190, v393[6] = v191, v193)&& !atomic_fetch_add(&v193->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                                          {
                                            ((void (*)(std::__shared_weak_count *))v193->__on_zero_shared)(v193);
                                            std::__shared_weak_count::__release_weak(v193);
                                            uint64_t v3 = v393;
                                            if (!atomic_fetch_add(&v192->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                                            {
LABEL_429:
                                              ((void (*)(std::__shared_weak_count *))v192->__on_zero_shared)(v192);
                                              std::__shared_weak_count::__release_weak(v192);
                                            }
                                          }
                                          else
                                          {
                                            uint64_t v3 = v393;
                                            if (!atomic_fetch_add(&v191->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
                                              goto LABEL_429;
                                            }
                                          }
                                        }
LABEL_439:
                                        std::__shared_weak_count::__release_weak(v189);
                                        char v197 = 1;
                                        if ((__dst[23] & 0x80) != 0) {
                                          goto LABEL_367;
                                        }
                                        goto LABEL_368;
                                      }
                                    }
                                    char v390 = 0;
                                    char v197 = 0;
                                    if ((__dst[23] & 0x80) != 0) {
                                      goto LABEL_367;
                                    }
                                    goto LABEL_368;
                                  }
                                }
                              }
                              continue;
                            }
                          }
                          continue;
                        }
                      }
                    }
                    memmove(v150, v148, v149);
                    v150[v149] = 0;
                    if (SHIBYTE(v448[2].__locale_) < 0) {
                      goto LABEL_539;
                    }
                    goto LABEL_322;
                  }
LABEL_836:
                  sub_100003540();
                }
                goto LABEL_837;
              }
              while (2)
              {
                uint64_t v132 = v3[5];
                if (*(char *)(v132 + 63) < 0)
                {
                  sub_1000035FC(__dst, *(void **)(v132 + 40), *(void *)(v132 + 48));
                }
                else
                {
                  *(_OWORD *)long long __dst = *(_OWORD *)(v132 + 40);
                  *(void *)&__dst[16] = *(void *)(v132 + 56);
                }
                v133 = getprogname();
                v134 = v133;
                int v135 = __dst[23];
                if (__dst[23] >= 0) {
                  size_t v136 = __dst[23];
                }
                else {
                  size_t v136 = *(void *)&__dst[8];
                }
                if (v136 == strlen(v133))
                {
                  if (__dst[23] >= 0) {
                    v137 = __dst;
                  }
                  else {
                    v137 = *(unsigned char **)__dst;
                  }
                  BOOL v138 = memcmp(v137, v134, v136) == 0;
                  if (v135 < 0) {
LABEL_294:
                  }
                    operator delete(*(void **)__dst);
                }
                else
                {
                  BOOL v138 = 0;
                  if ((__dst[23] & 0x80000000) != 0) {
                    goto LABEL_294;
                  }
                }
                if (v138) {
                  goto LABEL_312;
                }
                uint64_t v139 = *(void *)&v432[8];
                if (*(void *)&v432[8]) {
                  atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&v432[8] + 8), 1uLL, memory_order_relaxed);
                }
                v140 = (std::__shared_weak_count *)v3[6];
                v3[5] = v131;
                v3[6] = v139;
                if (v140 && !atomic_fetch_add(&v140->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                {
                  ((void (*)(std::__shared_weak_count *))v140->__on_zero_shared)(v140);
                  std::__shared_weak_count::__release_weak(v140);
                  uint64_t v141 = v3[5];
                  v142 = *(std::__shared_weak_count **)(v141 + 32);
                  if (!v142) {
                    goto LABEL_307;
                  }
LABEL_301:
                  uint64_t v143 = *(void *)(v141 + 24);
                  atomic_fetch_add_explicit(&v142->__shared_weak_owners_, 1uLL, memory_order_relaxed);
                  v144 = std::__shared_weak_count::lock(v142);
                  if (v144) {
                    uint64_t v145 = v143;
                  }
                  else {
                    uint64_t v145 = 0;
                  }
                  v146 = *(std::__shared_weak_count **)&v432[8];
                  *(void *)v432 = v145;
                  *(void *)&v432[8] = v144;
                  if (!v146) {
                    goto LABEL_278;
                  }
LABEL_308:
                  if (atomic_fetch_add(&v146->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
                    goto LABEL_278;
                  }
                  ((void (*)(std::__shared_weak_count *))v146->__on_zero_shared)(v146);
                  std::__shared_weak_count::__release_weak(v146);
                  if (v142) {
LABEL_279:
                  }
                    std::__shared_weak_count::__release_weak(v142);
                }
                else
                {
                  uint64_t v141 = v3[5];
                  v142 = *(std::__shared_weak_count **)(v141 + 32);
                  if (v142) {
                    goto LABEL_301;
                  }
LABEL_307:
                  v146 = *(std::__shared_weak_count **)&v432[8];
                  *(_OWORD *)v432 = 0uLL;
                  if (v146) {
                    goto LABEL_308;
                  }
LABEL_278:
                  if (v142) {
                    goto LABEL_279;
                  }
                }
                uint64_t v131 = *(void *)v432;
                if (!*(void *)v432) {
                  goto LABEL_312;
                }
                continue;
              }
            }
          }
          uint64_t v36 = v3[5];
          if (SHIBYTE(v415[2]) < 0)
          {
            sub_1000035FC(&v410, v415[0], (unint64_t)v415[1]);
          }
          else
          {
            long long v410 = *(_OWORD *)v415;
            v411 = v415[2];
          }
          v39 = *(uint64_t **)(v36 + 96);
          v38 = (uint64_t *)(v36 + 96);
          uint64_t v37 = v39;
          char v40 = HIBYTE(v411);
          if (!v39) {
            goto LABEL_118;
          }
          if (SHIBYTE(v411) >= 0) {
            v41 = &v410;
          }
          else {
            v41 = (long long *)v410;
          }
          if (SHIBYTE(v411) >= 0) {
            size_t v42 = HIBYTE(v411);
          }
          else {
            size_t v42 = *((void *)&v410 + 1);
          }
          v43 = v38;
          do
          {
            while (1)
            {
              int v44 = *((char *)v37 + 55);
              v45 = v44 >= 0 ? v37 + 4 : (uint64_t *)v37[4];
              size_t v46 = v44 >= 0 ? *((unsigned __int8 *)v37 + 55) : v37[5];
              size_t v47 = v42 >= v46 ? v46 : v42;
              int v48 = memcmp(v45, v41, v47);
              if (v48) {
                break;
              }
              if (v46 >= v42) {
                goto LABEL_85;
              }
LABEL_71:
              uint64_t v37 = (uint64_t *)v37[1];
              if (!v37) {
                goto LABEL_86;
              }
            }
            if (v48 < 0) {
              goto LABEL_71;
            }
LABEL_85:
            v43 = v37;
            uint64_t v37 = (uint64_t *)*v37;
          }
          while (v37);
LABEL_86:
          if (v43 == v38) {
            goto LABEL_118;
          }
          int v49 = *((char *)v43 + 55);
          if (v49 >= 0) {
            v50 = v43 + 4;
          }
          else {
            v50 = (const void *)v43[4];
          }
          if (v49 >= 0) {
            size_t v51 = *((unsigned __int8 *)v43 + 55);
          }
          else {
            size_t v51 = v43[5];
          }
          if (v51 >= v42) {
            size_t v52 = v42;
          }
          else {
            size_t v52 = v51;
          }
          int v53 = memcmp(v41, v50, v52);
          if (!v53)
          {
            if (v42 < v51) {
              goto LABEL_118;
            }
LABEL_98:
            if (v40 < 0) {
              goto LABEL_119;
            }
LABEL_99:
            uint64_t v3 = v393;
            v54 = (void *)v393[5];
            int v55 = SHIBYTE(v415[2]);
            if (v38 == v43) {
              goto LABEL_120;
            }
LABEL_100:
            if (v55 < 0)
            {
              sub_1000035FC(&v408, v415[0], (unint64_t)v415[1]);
            }
            else
            {
              long long v408 = *(_OWORD *)v415;
              v409 = v415[2];
            }
            int v56 = (*(uint64_t (**)(void *, long long *))(*v54 + 32))(v54, &v408);
            int v57 = v56;
            if (SHIBYTE(v409) < 0)
            {
              operator delete((void *)v408);
              if (!v57) {
                goto LABEL_585;
              }
            }
            else if (!v56)
            {
              goto LABEL_585;
            }
            if (!v389) {
              rl_bind_key(9, 0);
            }
            uint64_t v58 = v3[5];
            if (SHIBYTE(v415[2]) < 0)
            {
              sub_1000035FC(&v406, v415[0], (unint64_t)v415[1]);
            }
            else
            {
              long long v406 = *(_OWORD *)v415;
              v407 = v415[2];
            }
            v403 = &v403;
            v404 = &v403;
            uint64_t v405 = 0;
            v100 = (void **)v417;
            if (v417 != &v416)
            {
              uint64_t v101 = 0;
              v102 = &v403;
              do
              {
                v104 = operator new(0x28uLL);
                v105 = v104 + 2;
                void *v104 = 0;
                v104[1] = 0;
                if (*((char *)v100 + 39) < 0)
                {
                  sub_1000035FC(v105, v100[2], (unint64_t)v100[3]);
                  v102 = v403;
                  uint64_t v101 = v405;
                }
                else
                {
                  long long v103 = *((_OWORD *)v100 + 1);
                  v104[4] = v100[4];
                  *(_OWORD *)v105 = v103;
                }
                void *v104 = v102;
                v104[1] = &v403;
                v102[1] = v104;
                ++v101;
                v403 = v104;
                uint64_t v405 = v101;
                v100 = (void **)v100[1];
                v102 = v104;
              }
              while (v100 != &v416);
            }
            int v391 = (*(uint64_t (**)(uint64_t, long long *, void **))(*(void *)v58 + 40))(v58, &v406, &v403);
            if (v405)
            {
              v106 = v403;
              v107 = v404;
              uint64_t v108 = *v404;
              *(void *)(v108 + 8) = v403[1];
              *(void *)v106[1] = v108;
              uint64_t v405 = 0;
              if (v107 != &v403)
              {
                do
                {
                  v109 = (void *)v107[1];
                  if (*((char *)v107 + 39) < 0) {
                    operator delete((void *)v107[2]);
                  }
                  operator delete(v107);
                  v107 = v109;
                }
                while (v109 != &v403);
              }
            }
            if (SHIBYTE(v407) < 0)
            {
              operator delete((void *)v406);
              if (v389) {
                goto LABEL_586;
              }
            }
            else if (v389)
            {
              goto LABEL_586;
            }
            rl_bind_key(9, (rl_command_func_t *)&rl_complete);
            rl_completion_append_character = 0;
            rl_attempted_completion_function = (CPPFunction *)sub_10000AA88;
LABEL_586:
            int v22 = 7;
            goto LABEL_587;
          }
          if ((v53 & 0x80000000) == 0) {
            goto LABEL_98;
          }
LABEL_118:
          v43 = v38;
          if ((v40 & 0x80) == 0) {
            goto LABEL_99;
          }
LABEL_119:
          operator delete((void *)v410);
          uint64_t v3 = v393;
          v54 = (void *)v393[5];
          int v55 = SHIBYTE(v415[2]);
          if (v38 != v43) {
            goto LABEL_100;
          }
LABEL_120:
          if (v55 < 0)
          {
            sub_1000035FC(v401, v415[0], (unint64_t)v415[1]);
          }
          else
          {
            *(_OWORD *)v401 = *(_OWORD *)v415;
            v402 = v415[2];
          }
          v66 = (uint64_t *)v54[21];
          if (!v66) {
            goto LABEL_228;
          }
          char v67 = HIBYTE(v402);
          if (SHIBYTE(v402) >= 0) {
            v68 = v401;
          }
          else {
            v68 = (void **)v401[0];
          }
          if (SHIBYTE(v402) >= 0) {
            v69 = (void *)HIBYTE(v402);
          }
          else {
            v69 = v401[1];
          }
          v70 = v54 + 21;
          while (2)
          {
            while (2)
            {
              int v71 = *((char *)v66 + 55);
              if (v71 >= 0) {
                v72 = v66 + 4;
              }
              else {
                v72 = (const void *)v66[4];
              }
              if (v71 >= 0) {
                size_t v73 = *((unsigned __int8 *)v66 + 55);
              }
              else {
                size_t v73 = v66[5];
              }
              if ((unint64_t)v69 >= v73) {
                size_t v74 = v73;
              }
              else {
                size_t v74 = (size_t)v69;
              }
              int v75 = memcmp(v72, v68, v74);
              if (v75)
              {
                if ((v75 & 0x80000000) == 0) {
                  break;
                }
                goto LABEL_133;
              }
              if (v73 < (unint64_t)v69)
              {
LABEL_133:
                v66 = (uint64_t *)v66[1];
                if (!v66) {
                  goto LABEL_148;
                }
                continue;
              }
              break;
            }
            v70 = v66;
            v66 = (uint64_t *)*v66;
            if (v66) {
              continue;
            }
            break;
          }
LABEL_148:
          if (v70 == v54 + 21) {
            goto LABEL_228;
          }
          v78 = (const void *)v70[4];
          v77 = v70 + 4;
          v76 = v78;
          int v79 = *((char *)v77 + 23);
          if (v79 >= 0) {
            v80 = v77;
          }
          else {
            v80 = v76;
          }
          if (v79 >= 0) {
            size_t v81 = *((unsigned __int8 *)v77 + 23);
          }
          else {
            size_t v81 = v77[1];
          }
          if (v81 >= (unint64_t)v69) {
            size_t v82 = (size_t)v69;
          }
          else {
            size_t v82 = v81;
          }
          int v83 = memcmp(v68, v80, v82);
          if (!v83)
          {
            if ((unint64_t)v69 < v81) {
              goto LABEL_228;
            }
LABEL_160:
            BOOL v84 = 1;
            unint64_t v85 = v388;
            uint64_t v3 = v393;
            if ((v67 & 0x80) == 0) {
              goto LABEL_229;
            }
LABEL_161:
            operator delete(v401[0]);
            if (v84) {
              goto LABEL_230;
            }
LABEL_162:
            if (SHIBYTE(v415[2]) >= 0) {
              size_t v86 = HIBYTE(v415[2]);
            }
            else {
              size_t v86 = (size_t)v415[1];
            }
            if (v86 != 6)
            {
              if (v86 != 4) {
                goto LABEL_173;
              }
              v87 = (void **)v415[0];
              if (SHIBYTE(v415[2]) >= 0) {
                v87 = v415;
              }
              BOOL v88 = *(_DWORD *)v87 == 1886152040 && v33 == 0;
              if (!v88) {
                goto LABEL_173;
              }
LABEL_221:
              (*(void (**)(void, BOOL))(*(void *)v3[5] + 24))(v3[5], v389 == 0);
              goto LABEL_586;
            }
            v111 = (void **)v415[0];
            if (SHIBYTE(v415[2]) >= 0) {
              v111 = v415;
            }
            if (*(_DWORD *)v111 ^ 0x65682D2D | *((unsigned __int16 *)v111 + 2) ^ 0x706C) {
              BOOL v112 = 0;
            }
            else {
              BOOL v112 = v33 == 0;
            }
            if (v112) {
              goto LABEL_221;
            }
LABEL_173:
            if (!v85)
            {
              switch(v86)
              {
                case 1uLL:
                  goto LABEL_240;
                case 2uLL:
                  if (SHIBYTE(v415[2]) >= 0) {
                    v89 = v415;
                  }
                  else {
                    v89 = (void **)v415[0];
                  }
                  if (*(_WORD *)v89 != 29548) {
                    goto LABEL_179;
                  }
                  CommandBase::list((CommandBase *)v3[5]);
                  goto LABEL_603;
                case 4uLL:
                  v240 = v415;
                  if (SHIBYTE(v415[2]) < 0) {
                    v240 = (void **)v415[0];
                  }
                  if (*(_DWORD *)v240 != 1953068401 && *(_DWORD *)v240 != 1953069157) {
                    goto LABEL_577;
                  }
                  int v22 = 8;
                  int v387 = 1;
                  int v391 = 1;
                  goto LABEL_587;
                case 7uLL:
                  v241 = v415;
                  if (SHIBYTE(v415[2]) < 0) {
                    v241 = (void **)v415[0];
                  }
                  int v242 = *(_DWORD *)v241;
                  int v243 = *(_DWORD *)((char *)v241 + 3);
                  if (v242 != 1953720680 || v243 != 2037542772) {
                    goto LABEL_577;
                  }
                  int v22 = 0;
                  if (v389 || history_length < 1) {
                    goto LABEL_587;
                  }
                  int v250 = 0;
                  do
                  {
                    v251 = history_get(v250 + history_base);
                    if (v251)
                    {
                      __dst[0] = 9;
                      v252 = sub_10000369C(&std::cout, (uint64_t)__dst, 1);
                      uint64_t v253 = *v252;
                      *(uint64_t *)((char *)v252 + *(void *)(*v252 - 24) + 24) = 4;
                      *(_DWORD *)((char *)v252 + *(void *)(v253 - 24) + 8) = *(_DWORD *)((unsigned char *)v252
                                                                                         + *(void *)(v253 - 24)
                                                                                         + 8) & 0xFFFFFF4F | 0x80;
                      line = v251->line;
                      size_t v255 = strlen(line);
                      v256 = sub_10000369C(v252, (uint64_t)line, v255);
                      std::ios_base::getloc((const std::ios_base *)((char *)v256 + *(void *)(*v256 - 24)));
                      v257 = std::locale::use_facet((const std::locale *)__dst, &std::ctype<char>::id);
                      ((void (*)(const std::locale::facet *, uint64_t))v257->__vftable[2].~facet_0)(v257, 10);
                      std::locale::~locale((std::locale *)__dst);
                      std::ostream::put();
                      std::ostream::flush();
                    }
                    ++v250;
                  }
                  while (v250 < history_length);
                  break;
                default:
                  goto LABEL_577;
              }
              goto LABEL_603;
            }
            if (v86 == 1)
            {
LABEL_240:
              if (SHIBYTE(v415[2]) >= 0) {
                v120 = v415;
              }
              else {
                v120 = (void **)v415[0];
              }
              if (!memcmp(v120, "/", v86))
              {
                uint64_t v122 = v3[1];
                uint64_t v121 = v3[2];
                if (v121) {
                  atomic_fetch_add_explicit((atomic_ullong *volatile)(v121 + 8), 1uLL, memory_order_relaxed);
                }
                v91 = (std::__shared_weak_count *)v3[6];
                v3[5] = v122;
                v3[6] = v121;
                if (v91 && !atomic_fetch_add(&v91->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                {
                  ((void (*)(std::__shared_weak_count *))v91->__on_zero_shared)(v91);
                  goto LABEL_602;
                }
LABEL_603:
                int v22 = 0;
                goto LABEL_587;
              }
            }
            else if (v86 == 2)
            {
              v89 = SHIBYTE(v415[2]) >= 0 ? v415 : (void **)v415[0];
LABEL_179:
              if (!memcmp(v89, "..", v86))
              {
                uint64_t v90 = v3[5];
                v91 = *(std::__shared_weak_count **)(v90 + 32);
                if (v91)
                {
                  uint64_t v92 = *(void *)(v90 + 24);
                  atomic_fetch_add_explicit(&v91->__shared_weak_owners_, 1uLL, memory_order_relaxed);
                  v93 = std::__shared_weak_count::lock(v91);
                  if (!v93) {
                    goto LABEL_602;
                  }
                  v94 = v93;
                  if (!atomic_fetch_add(&v93->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                  {
                    ((void (*)(std::__shared_weak_count *))v93->__on_zero_shared)(v93);
                    std::__shared_weak_count::__release_weak(v94);
                  }
                  std::__shared_weak_count::__release_weak(v91);
                  if (v92)
                  {
                    uint64_t v95 = v3[5];
                    v91 = *(std::__shared_weak_count **)(v95 + 32);
                    if (v91)
                    {
                      uint64_t v96 = *(void *)(v95 + 24);
                      atomic_fetch_add_explicit(&v91->__shared_weak_owners_, 1uLL, memory_order_relaxed);
                      v97 = std::__shared_weak_count::lock(v91);
                      if (v97) {
                        uint64_t v98 = v96;
                      }
                      else {
                        uint64_t v98 = 0;
                      }
                      v99 = (std::__shared_weak_count *)v3[6];
                      v3[5] = v98;
                      v3[6] = v97;
                      if (!v99) {
                        goto LABEL_601;
                      }
                    }
                    else
                    {
                      v99 = (std::__shared_weak_count *)v3[6];
                      v3[5] = 0;
                      v3[6] = 0;
                      if (!v99) {
                        goto LABEL_601;
                      }
                    }
                    if (!atomic_fetch_add(&v99->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                    {
                      ((void (*)(std::__shared_weak_count *))v99->__on_zero_shared)(v99);
                      std::__shared_weak_count::__release_weak(v99);
                    }
LABEL_601:
                    if (v91) {
LABEL_602:
                    }
                      std::__shared_weak_count::__release_weak(v91);
                  }
                }
                goto LABEL_603;
              }
            }
LABEL_577:
            v236 = sub_10000369C(&std::cout, (uint64_t)"Invalid command '", 17);
            if (SHIBYTE(v415[2]) >= 0) {
              v238 = v415;
            }
            else {
              v238 = (void **)v415[0];
            }
            if (SHIBYTE(v415[2]) >= 0) {
              uint64_t v239 = HIBYTE(v415[2]);
            }
            else {
              uint64_t v239 = (uint64_t)v415[1];
            }
            goto LABEL_583;
          }
          if ((v83 & 0x80000000) == 0) {
            goto LABEL_160;
          }
LABEL_228:
          BOOL v84 = v54 + 24 != sub_1000139E4((uint64_t)(v54 + 23), (const void **)v401);
          unint64_t v85 = v388;
          uint64_t v3 = v393;
          if ((HIBYTE(v402) & 0x80) != 0) {
            goto LABEL_161;
          }
LABEL_229:
          if (!v84) {
            goto LABEL_162;
          }
LABEL_230:
          uint64_t v116 = v3[5];
          if (SHIBYTE(v415[2]) < 0)
          {
            sub_1000035FC(v399, v415[0], (unint64_t)v415[1]);
          }
          else
          {
            *(_OWORD *)v399 = *(_OWORD *)v415;
            v400 = v415[2];
          }
          int v117 = (*(uint64_t (**)(uint64_t, void **))(*(void *)v116 + 32))(v116, v399);
          int v118 = v117;
          if (SHIBYTE(v400) < 0)
          {
            operator delete(v399[0]);
            if (!v118) {
              goto LABEL_585;
            }
          }
          else if (!v117)
          {
LABEL_585:
            int v391 = 0;
            goto LABEL_586;
          }
          uint64_t v119 = v3[5];
          if (SHIBYTE(v415[2]) < 0)
          {
            sub_1000035FC(v397, v415[0], (unint64_t)v415[1]);
          }
          else
          {
            *(_OWORD *)v397 = *(_OWORD *)v415;
            v398 = v415[2];
          }
          CommandBase::getSubCommandObj(v119, (uint64_t)v397, (uint64_t **)__dst);
          long long v125 = *(_OWORD *)__dst;
          *(void *)&__dst[8] = 0;
          *(void *)long long __dst = 0;
          v126 = (std::__shared_weak_count *)v3[6];
          *(_OWORD *)(v3 + 5) = v125;
          if (v126 && !atomic_fetch_add(&v126->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v126->__on_zero_shared)(v126);
            std::__shared_weak_count::__release_weak(v126);
            v127 = *(std::__shared_weak_count **)&__dst[8];
            if (*(void *)&__dst[8]) {
              goto LABEL_262;
            }
          }
          else
          {
            v127 = *(std::__shared_weak_count **)&__dst[8];
            if (*(void *)&__dst[8])
            {
LABEL_262:
              if (!atomic_fetch_add(&v127->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
              {
                ((void (*)(std::__shared_weak_count *))v127->__on_zero_shared)(v127);
                std::__shared_weak_count::__release_weak(v127);
              }
            }
          }
          if ((SHIBYTE(v398) & 0x80000000) == 0)
          {
            if (v33) {
              goto LABEL_267;
            }
LABEL_269:
            (*(void (**)(void, BOOL))(*(void *)v3[5] + 24))(v3[5], v389 == 0);
            goto LABEL_585;
          }
          operator delete(v397[0]);
          if (!v33) {
            goto LABEL_269;
          }
LABEL_267:
          int v22 = 0;
          int v391 = 1;
LABEL_587:
          if (SHIBYTE(v415[2]) < 0) {
            operator delete(v415[0]);
          }
          if (!v22)
          {
            unint64_t v25 = v418;
            if (!v418) {
              goto LABEL_607;
            }
            continue;
          }
          break;
        }
        if (v22 == 7)
        {
          if (v418)
          {
            v258 = (void **)v417;
            v259 = (void **)v416;
            uint64_t v260 = *(void *)v417;
            *(void *)(v260 + 8) = *((void *)v416 + 1);
            *v259[1] = v260;
            unint64_t v418 = 0;
            if (v258 != &v416)
            {
              do
              {
                v270 = (void **)v258[1];
                if (*((char *)v258 + 39) < 0) {
                  operator delete(v258[2]);
                }
                operator delete(v258);
                v258 = v270;
              }
              while (v270 != &v416);
            }
          }
LABEL_607:
          v261 = v384;
          if (*v386) {
            v261 = v386;
          }
          uint64_t v263 = *v261;
          uint64_t v262 = v261[1];
          if (v262) {
            atomic_fetch_add_explicit((atomic_ullong *volatile)(v262 + 8), 1uLL, memory_order_relaxed);
          }
          v264 = (std::__shared_weak_count *)v3[6];
          v3[5] = v263;
          v3[6] = v262;
          int v265 = v387;
          if (v264 && !atomic_fetch_add(&v264->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v264->__on_zero_shared)(v264);
            std::__shared_weak_count::__release_weak(v264);
          }
          v387 &= v391;
          if (v265 & v391) {
            int v22 = 0;
          }
          else {
            int v22 = 4;
          }
        }
        if (v418)
        {
          v266 = (void **)v417;
          v267 = (void **)v416;
          uint64_t v268 = *(void *)v417;
          *(void *)(v268 + 8) = *((void *)v416 + 1);
          *v267[1] = v268;
          unint64_t v418 = 0;
          if (v266 != &v416)
          {
            do
            {
              v269 = (void **)v266[1];
              if (*((char *)v266 + 39) < 0) {
                operator delete(v266[2]);
              }
              operator delete(v266);
              v266 = v269;
            }
            while (v269 != &v416);
          }
        }
        if (v22)
        {
          if (v22 != 4) {
            goto LABEL_39;
          }
          break;
        }
        v23 += 3;
      }
      while (v23 != v385);
    }
    uint64_t v271 = *v386;
    if (!*v386) {
      break;
    }
    uint64_t v272 = v3[4];
    if (v272) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v272 + 8), 1uLL, memory_order_relaxed);
    }
    v273 = (std::__shared_weak_count *)v3[6];
    v3[5] = v271;
    v3[6] = v272;
    if (v273 && !atomic_fetch_add(&v273->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v273->__on_zero_shared)(v273);
      std::__shared_weak_count::__release_weak(v273);
    }
    memset(v425, 170, 24);
    uint64_t v274 = v3[5];
    if (*(char *)(v274 + 87) < 0)
    {
      sub_1000035FC(v432, *(void **)(v274 + 64), *(void *)(v274 + 72));
    }
    else
    {
      *(_OWORD *)v432 = *(_OWORD *)(v274 + 64);
      *(void *)&v432[16] = *(void *)(v274 + 80);
    }
    v275 = std::string::insert((std::string *)v432, 0, "(", 1uLL);
    long long v276 = *(_OWORD *)&v275->__r_.__value_.__l.__data_;
    *(void *)&__dst[16] = *((void *)&v275->__r_.__value_.__l + 2);
    *(_OWORD *)long long __dst = v276;
    v275->__r_.__value_.__l.__size_ = 0;
    v275->__r_.__value_.__r.__words[2] = 0;
    v275->__r_.__value_.__r.__words[0] = 0;
    v277 = std::string::append((std::string *)__dst, ")>> ", 4uLL);
    long long v278 = *(_OWORD *)&v277->__r_.__value_.__l.__data_;
    v425[2] = (void *)v277->__r_.__value_.__r.__words[2];
    *(_OWORD *)v425 = v278;
    v277->__r_.__value_.__l.__size_ = 0;
    v277->__r_.__value_.__r.__words[2] = 0;
    v277->__r_.__value_.__r.__words[0] = 0;
    if ((__dst[23] & 0x80000000) != 0)
    {
      operator delete(*(void **)__dst);
      if ((v432[23] & 0x80000000) == 0)
      {
LABEL_640:
        if ((SHIBYTE(v420) & 0x80000000) == 0) {
          goto LABEL_641;
        }
        goto LABEL_657;
      }
    }
    else if ((v432[23] & 0x80000000) == 0)
    {
      goto LABEL_640;
    }
    operator delete(*(void **)v432);
    if ((SHIBYTE(v420) & 0x80000000) == 0)
    {
LABEL_641:
      LOBYTE(v419) = 0;
      HIBYTE(v420) = 0;
      uint64_t v280 = v3[5];
      uint64_t v279 = v3[6];
      if (!v279) {
        goto LABEL_643;
      }
      goto LABEL_642;
    }
LABEL_657:
    *(unsigned char *)long long v419 = 0;
    *((void *)&v419 + 1) = 0;
    uint64_t v280 = v3[5];
    uint64_t v279 = v3[6];
    if (v279) {
LABEL_642:
    }
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v279 + 16), 1uLL, memory_order_relaxed);
LABEL_643:
    v281 = (std::__shared_weak_count *)qword_1000242C8;
    qword_1000242C0 = v280;
    qword_1000242C8 = v279;
    if (v281) {
      std::__shared_weak_count::__release_weak(v281);
    }
    if (!v389)
    {
      if (SHIBYTE(v425[2]) >= 0) {
        v282 = v425;
      }
      else {
        v282 = (void **)v425[0];
      }
      v283 = readline((const char *)v282);
      v284 = v283;
      if (!v283)
      {
        int v22 = 3;
        if ((SHIBYTE(v425[2]) & 0x80000000) == 0) {
          goto LABEL_39;
        }
        goto LABEL_752;
      }
      if (*v283) {
        add_history(v283);
      }
      sub_10000E8FC((void **)&v419, v284);
      free(v284);
    }
    v416 = &v416;
    v417 = &v416;
    unint64_t v418 = 0;
    *(void *)&long long v285 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v285 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)((char *)&v451[7] + 8) = v285;
    *(_OWORD *)((char *)&v451[8] + 8) = v285;
    *(_OWORD *)((char *)&v451[5] + 8) = v285;
    *(_OWORD *)((char *)&v451[6] + 8) = v285;
    *(_OWORD *)((char *)&v451[3] + 8) = v285;
    *(_OWORD *)((char *)&v451[4] + 8) = v285;
    *(_OWORD *)((char *)&v451[1] + 8) = v285;
    *(_OWORD *)((char *)&v451[2] + 8) = v285;
    *(void *)&__dst[120] = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)((char *)v451 + 8) = v285;
    *(_OWORD *)&__dst[88] = v285;
    *(_OWORD *)&__dst[104] = v285;
    *(_OWORD *)&__dst[56] = v285;
    *(_OWORD *)&__dst[72] = v285;
    *(_OWORD *)&__dst[24] = v285;
    *(_OWORD *)&__dst[40] = v285;
    *(void *)&__dst[8] = 0xAAAAAAAAAAAAAAAALL;
    *(void *)long long __dst = v381;
    *(void *)&__dst[*(void *)(v381 - 24)] = v380;
    *(void *)&__dst[8] = 0;
    v286 = (std::ios_base *)&__dst[*(void *)(*(void *)__dst - 24)];
    std::ios_base::init(v286, &__dst[24]);
    v286[1].__vftable = 0;
    v286[1].__fmtflags_ = -1;
    *(void *)&__dst[16] = v379;
    *(void *)&__dst[*(void *)(v379 - 24) + 16] = v378;
    *(void *)long long __dst = v376;
    *(void *)&__dst[*(void *)(v376 - 24)] = v377;
    std::streambuf::basic_streambuf();
    memset(&__dst[88], 0, 32);
    *(_DWORD *)&__dst[120] = 24;
    if (SHIBYTE(v420) < 0)
    {
      sub_10000435C(&__dst[88], (void *)v419, *((size_t *)&v419 + 1));
    }
    else
    {
      *(_OWORD *)&__dst[88] = v419;
      *(void *)&__dst[104] = v420;
    }
    sub_10000E944((uint64_t)&__dst[24]);
    char v287 = 0;
    memset(v449, 0, 24);
    while (2)
    {
      if (v287 < 0)
      {
        *(unsigned char *)v449[0] = 0;
        v449[1] = 0;
      }
      else
      {
        LOBYTE(v449[0]) = 0;
        HIBYTE(v449[2]) = 0;
      }
      v432[0] = -86;
      std::istream::sentry::sentry();
      if (v432[0])
      {
        v289 = *(void **)&__dst[*(void *)(*(void *)__dst - 24) + 40];
        v290 = (unsigned char *)v289[3];
        if (v290 == (unsigned char *)v289[4])
        {
          LODWORD(v289) = (*(uint64_t (**)(void *))(*v289 + 80))(v289);
          if (v289 == -1)
          {
            int v292 = 6;
            int v291 = 170;
            goto LABEL_672;
          }
        }
        else
        {
          v289[3] = v290 + 1;
          LOBYTE(v289) = *v290;
        }
        int v292 = 0;
        int v291 = v289;
LABEL_672:
        std::ios_base::clear((std::ios_base *)&__dst[*(void *)(*(void *)__dst - 24)], *(_DWORD *)&__dst[*(void *)(*(void *)__dst - 24) + 32] | v292);
        goto LABEL_673;
      }
      int v291 = 170;
LABEL_673:
      uint64_t v293 = *(void *)__dst;
      v294 = &__dst[*(void *)(*(void *)__dst - 24)];
      if ((v294[32] & 5) != 0) {
        goto LABEL_724;
      }
      if (v291 != 34)
      {
        std::istream::unget();
        sub_100005D54((uint64_t *)__dst, (uint64_t)v449);
        goto LABEL_724;
      }
      *(void *)&v432[8] = 0xAAAAAAAAAAAAAAAALL;
      *(void *)v432 = v294;
      int v295 = *((_DWORD *)v294 + 2);
      *(_DWORD *)&v432[8] = v295;
      int v296 = *((_DWORD *)v294 + 36);
      if (v296 == -1)
      {
        std::ios_base::getloc((const std::ios_base *)v294);
        v297 = std::locale::use_facet(v448, &std::ctype<char>::id);
        int v296 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v297->__vftable[2].~facet_0)(v297, 32);
        std::locale::~locale(v448);
        *((_DWORD *)v294 + 36) = v296;
        uint64_t v293 = *(void *)__dst;
      }
      v432[12] = v296;
      *(_DWORD *)&__dst[*(void *)(v293 - 24) + 8] &= ~0x1000u;
      char v298 = 34;
      while (1)
      {
        LOBYTE(v448[0].__locale_) = -86;
        std::istream::sentry::sentry();
        if (!LOBYTE(v448[0].__locale_)) {
          goto LABEL_686;
        }
        v302 = *(void **)&__dst[*(void *)(*(void *)__dst - 24) + 40];
        v303 = (unsigned char *)v302[3];
        if (v303 == (unsigned char *)v302[4])
        {
          LODWORD(v302) = (*(uint64_t (**)(void *))(*v302 + 80))(v302);
          if (v302 == -1)
          {
            int v304 = 6;
            goto LABEL_685;
          }
        }
        else
        {
          v302[3] = v303 + 1;
          LOBYTE(v302) = *v303;
        }
        int v304 = 0;
        char v298 = (char)v302;
LABEL_685:
        std::ios_base::clear((std::ios_base *)&__dst[*(void *)(*(void *)__dst - 24)], *(_DWORD *)&__dst[*(void *)(*(void *)__dst - 24) + 32] | v304);
LABEL_686:
        if ((__dst[*(void *)(*(void *)__dst - 24) + 32] & 5) != 0) {
          goto LABEL_721;
        }
        if (v298 == 92) {
          break;
        }
        if (v298 == 34) {
          goto LABEL_721;
        }
LABEL_698:
        if ((SHIBYTE(v449[2]) & 0x80000000) == 0)
        {
          if (HIBYTE(v449[2]) != 22)
          {
            size_t v299 = HIBYTE(v449[2]);
            HIBYTE(v449[2]) = (HIBYTE(v449[2]) + 1) & 0x7F;
            v300 = v449;
            goto LABEL_679;
          }
          v309 = v449;
          size_t v299 = 22;
LABEL_704:
          if (v299 + 1 > 2 * v299) {
            unint64_t v311 = v299 + 1;
          }
          else {
            unint64_t v311 = 2 * v299;
          }
          if (v311 >= 0x17)
          {
            uint64_t v312 = (v311 & 0x7FFFFFFFFFFFFFF8) + 8;
            uint64_t v313 = v311 | 7;
            if (v313 == 23) {
              uint64_t v313 = v312;
            }
            size_t v310 = v313 + 1;
          }
          else
          {
            size_t v310 = 23;
          }
LABEL_712:
          v314 = (void **)operator new(v310);
          v300 = v314;
          if (!v299 || (memmove(v314, v309, v299), v299 != 22)) {
            operator delete(v309);
          }
          v449[0] = v300;
          v449[2] = (void *)(v310 | 0x8000000000000000);
          goto LABEL_717;
        }
        size_t v299 = ((unint64_t)v449[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
        if (v449[1] == (void *)v299)
        {
          if (((unint64_t)v449[2] & 0x7FFFFFFFFFFFFFFFLL) == 0x7FFFFFFFFFFFFFF8) {
            sub_100003540();
          }
          v309 = (void **)v449[0];
          size_t v310 = 0x7FFFFFFFFFFFFFF7;
          if (v299 <= 0x3FFFFFFFFFFFFFF2) {
            goto LABEL_704;
          }
          goto LABEL_712;
        }
        v300 = (void **)v449[0];
        size_t v299 = (size_t)v449[1];
LABEL_717:
        v449[1] = (void *)(v299 + 1);
LABEL_679:
        v301 = (char *)v300 + v299;
        char *v301 = v298;
        v301[1] = 0;
      }
      LOBYTE(v448[0].__locale_) = -86;
      std::istream::sentry::sentry();
      if (LOBYTE(v448[0].__locale_))
      {
        v305 = *(void **)&__dst[*(void *)(*(void *)__dst - 24) + 40];
        v306 = (char *)v305[3];
        if (v306 != (char *)v305[4])
        {
          v305[3] = v306 + 1;
          char v298 = *v306;
          goto LABEL_695;
        }
        int v307 = (*(uint64_t (**)(void *))(*v305 + 80))(v305);
        char v298 = v307;
        if (v307 == -1)
        {
          int v308 = 6;
          char v298 = 92;
        }
        else
        {
LABEL_695:
          int v308 = 0;
        }
        std::ios_base::clear((std::ios_base *)&__dst[*(void *)(*(void *)__dst - 24)], *(_DWORD *)&__dst[*(void *)(*(void *)__dst - 24) + 32] | v308);
      }
      else
      {
        char v298 = 92;
      }
      if ((__dst[*(void *)(*(void *)__dst - 24) + 32] & 5) == 0) {
        goto LABEL_698;
      }
LABEL_721:
      *((_DWORD *)v294 + 2) = v295;
      uint64_t v3 = v393;
      if (*((_DWORD *)v294 + 36) == -1)
      {
        std::ios_base::getloc((const std::ios_base *)v294);
        v315 = std::locale::use_facet(v448, &std::ctype<char>::id);
        ((void (*)(const std::locale::facet *, uint64_t))v315->__vftable[2].~facet_0)(v315, 32);
        std::locale::~locale(v448);
      }
      *((_DWORD *)v294 + 36) = (char)v296;
LABEL_724:
      if ((__dst[*(void *)(*(void *)__dst - 24) + 32] & 5) == 0)
      {
        v316 = (char *)operator new(0x28uLL);
        v317 = v316 + 16;
        *(void *)v316 = 0;
        *((void *)v316 + 1) = 0;
        if (SHIBYTE(v449[2]) < 0)
        {
          sub_1000035FC(v317, v449[0], (unint64_t)v449[1]);
        }
        else
        {
          *(_OWORD *)v317 = *(_OWORD *)v449;
          *((void **)v316 + 4) = v449[2];
        }
        v288 = v417;
        *(void *)v316 = &v416;
        *((void *)v316 + 1) = v288;
        void *v288 = v316;
        v417 = v316;
        ++v418;
        char v287 = HIBYTE(v449[2]);
        continue;
      }
      break;
    }
    memset(v448, 170, 24);
    if (*((char *)v416 + 39) < 0)
    {
      sub_1000035FC(v448, *((void **)v416 + 2), *((void *)v416 + 3));
    }
    else
    {
      *(_OWORD *)&v448[0].__locale_ = *((_OWORD *)v416 + 1);
      v448[2] = *(std::locale *)((char *)v416 + 32);
    }
    char v318 = HIBYTE(v448[2].__locale_);
    if (SHIBYTE(v448[2].__locale_) >= 0) {
      int64_t v319 = HIBYTE(v448[2].__locale_);
    }
    else {
      int64_t v319 = (int64_t)v448[1].__locale_;
    }
    if (SHIBYTE(v448[2].__locale_) >= 0) {
      v320 = (char *)v448;
    }
    else {
      v320 = (char *)v448[0].__locale_;
    }
    if (v319 < 1) {
      goto LABEL_782;
    }
    v321 = &v320[v319];
    v322 = v320;
    while (1)
    {
      v323 = (char *)memchr(v322, 47, v319);
      if (!v323) {
        goto LABEL_782;
      }
      if (*v323 == 47) {
        break;
      }
      v322 = v323 + 1;
      int64_t v319 = v321 - (unsigned char *)v322;
      if (v321 - (unsigned char *)v322 < 1) {
        goto LABEL_782;
      }
    }
    if (v323 == v321 || v323 - v320 == -1) {
      goto LABEL_782;
    }
    v324 = (char *)v416;
    uint64_t v325 = *(void *)v416;
    *(void *)(v325 + 8) = *((void *)v416 + 1);
    **((void **)v324 + 1) = v325;
    --v418;
    if (v324[39] < 0)
    {
      operator delete(*((void **)v324 + 2));
      operator delete(v324);
      unsigned __int8 v326 = HIBYTE(v448[2].__locale_);
      if (SHIBYTE(v448[2].__locale_) < 0) {
        goto LABEL_754;
      }
LABEL_747:
      if (v326)
      {
        if (LOBYTE(v448[0].__locale_) == 47)
        {
          v327 = (char *)&v448[0].__locale_ + 1;
          size_t v328 = v326 - 1;
          if (v328 <= 0x7FFFFFFFFFFFFFF7) {
            goto LABEL_757;
          }
LABEL_839:
          sub_100003540();
        }
LABEL_761:
        int v330 = 0;
        goto LABEL_762;
      }
LABEL_838:
      sub_1000042B4();
    }
    operator delete(v324);
    unsigned __int8 v326 = HIBYTE(v448[2].__locale_);
    if ((SHIBYTE(v448[2].__locale_) & 0x80000000) == 0) {
      goto LABEL_747;
    }
LABEL_754:
    if (!v448[1].__locale_) {
      goto LABEL_838;
    }
    if (*(unsigned char *)v448[0].__locale_ != 47) {
      goto LABEL_761;
    }
    v327 = (char *)v448[0].__locale_ + 1;
    size_t v328 = (size_t)v448[1].__locale_ - 1;
    if ((unint64_t)v448[1].__locale_ - 1 > 0x7FFFFFFFFFFFFFF7) {
      goto LABEL_839;
    }
LABEL_757:
    if (v328 >= 0x17)
    {
      uint64_t v362 = (v328 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v328 | 7) != 0x17) {
        uint64_t v362 = v328 | 7;
      }
      uint64_t v363 = v362 + 1;
      v329 = operator new(v362 + 1);
      *(void *)&v432[16] = v363 | 0x8000000000000000;
      *(void *)v432 = v329;
      *(void *)&v432[8] = v328;
LABEL_814:
      memmove(v329, v327, v328);
      v329[v328] = 0;
      if (SHIBYTE(v448[2].__locale_) < 0) {
        goto LABEL_815;
      }
      goto LABEL_760;
    }
    v432[23] = v328;
    v329 = v432;
    if (v328) {
      goto LABEL_814;
    }
    v432[0] = 0;
    if ((SHIBYTE(v448[2].__locale_) & 0x80000000) == 0) {
      goto LABEL_760;
    }
LABEL_815:
    operator delete(v448[0].__locale_);
LABEL_760:
    *(_OWORD *)&v448[0].__locale_ = *(_OWORD *)v432;
    v448[2] = *(std::locale *)&v432[16];
    int v330 = 1;
    uint64_t v3 = v393;
LABEL_762:
    *(void *)&long long v331 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v331 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v446 = v331;
    long long v447 = v331;
    long long v444 = v331;
    long long v445 = v331;
    long long v442 = v331;
    long long v443 = v331;
    long long v440 = v331;
    long long v441 = v331;
    long long v438 = v331;
    long long v439 = v331;
    long long v436 = v331;
    long long v437 = v331;
    long long v434 = v331;
    long long v435 = v331;
    *(_OWORD *)&v432[16] = v331;
    long long v433 = v331;
    *(_OWORD *)v432 = v331;
    sub_100005720((uint64_t)v432, (long long *)v448);
    uint64_t v332 = 0;
    long long v430 = 0uLL;
    unint64_t v431 = 0;
    *(void *)&long long v428 = &v428;
    *((void *)&v428 + 1) = &v428;
    while (1)
    {
      uint64_t v429 = v332;
      v334 = sub_10000456C(v432, (uint64_t)&v430, 0x2Fu);
      if ((*((unsigned char *)v334 + *(void *)(*v334 - 24) + 32) & 5) != 0) {
        break;
      }
      v335 = operator new(0x28uLL);
      v336 = v335 + 2;
      void *v335 = 0;
      v335[1] = 0;
      if (SHIBYTE(v431) < 0)
      {
        sub_1000035FC(v336, (void *)v430, *((unint64_t *)&v430 + 1));
      }
      else
      {
        *(_OWORD *)v336 = v430;
        v335[4] = v431;
      }
      uint64_t v333 = v428;
      void *v335 = v428;
      v335[1] = &v428;
      *(void *)(v333 + 8) = v335;
      *(void *)&long long v428 = v335;
      uint64_t v332 = v429 + 1;
    }
    while (1)
    {
      uint64_t v337 = v429;
      if (!v429) {
        break;
      }
      v338 = (char *)v428;
      v339 = operator new(0x28uLL);
      v340 = v339 + 2;
      void *v339 = 0;
      v339[1] = 0;
      if (v338[39] < 0)
      {
        sub_1000035FC(v340, *((void **)v338 + 2), *((void *)v338 + 3));
        v338 = (char *)v428;
        uint64_t v337 = v429;
      }
      else
      {
        long long v341 = *((_OWORD *)v338 + 1);
        v339[4] = *((void *)v338 + 4);
        *(_OWORD *)v340 = v341;
      }
      v342 = v416;
      void *v339 = v416;
      v339[1] = &v416;
      v342[1] = v339;
      v416 = v339;
      ++v418;
      v343 = *(void **)v338;
      v343[1] = *((void *)v338 + 1);
      **((void **)v338 + 1) = v343;
      uint64_t v429 = v337 - 1;
      if (v338[39] < 0) {
        operator delete(*((void **)v338 + 2));
      }
      operator delete(v338);
    }
    if (v330)
    {
      v344 = operator new(0x28uLL);
      v344[2] = 47;
      *((unsigned char *)v344 + 39) = 1;
      v345 = v416;
      void *v344 = v416;
      v344[1] = &v416;
      v345[1] = v344;
      v416 = v344;
      ++v418;
    }
    if (SHIBYTE(v431) < 0) {
      operator delete((void *)v430);
    }
    *(void *)v432 = v383;
    *(void *)&v432[*(void *)(v383 - 24)] = v382;
    if (SBYTE7(v437) < 0) {
      operator delete((void *)v436);
    }
    std::streambuf::~streambuf();
    std::istream::~istream();
    std::ios::~ios();
    char v318 = HIBYTE(v448[2].__locale_);
LABEL_782:
    if (v318 < 0)
    {
      operator delete(v448[0].__locale_);
      if (SHIBYTE(v449[2]) < 0) {
        goto LABEL_810;
      }
    }
    else
    {
      if ((SHIBYTE(v449[2]) & 0x80000000) == 0) {
        goto LABEL_784;
      }
LABEL_810:
      operator delete(v449[0]);
    }
LABEL_784:
    *(void *)long long __dst = v375;
    *(void *)&__dst[*(void *)(v375 - 24)] = v374;
    *(void *)&__dst[16] = v373;
    if ((__dst[111] & 0x80000000) != 0) {
      operator delete(*(void **)&__dst[88]);
    }
    std::streambuf::~streambuf();
    std::iostream::~basic_iostream();
    std::ios::~ios();
    sub_10000A680(&v394, (uint64_t)&v416);
    sub_100006144((uint64_t)__dst, &v394);
    v346 = (char *)v424[0];
    if (v424[0])
    {
      v347 = v424[1];
      v348 = v424[0];
      if (v424[1] != v424[0])
      {
        do
        {
          v349 = (char *)(v347 - 3);
          if (*(v347 - 1))
          {
            uint64_t v350 = *(v347 - 3);
            v351 = (char *)*(v347 - 2);
            uint64_t v352 = *(void *)v351;
            *(void *)(v352 + 8) = *(void *)(v350 + 8);
            **(void **)(v350 + 8) = v352;
            *(v347 - 1) = 0;
            if (v351 != v349)
            {
              do
              {
                v353 = (char *)*((void *)v351 + 1);
                if (v351[39] < 0) {
                  operator delete(*((void **)v351 + 2));
                }
                operator delete(v351);
                v351 = v353;
              }
              while (v353 != v349);
            }
          }
          v347 = v349;
        }
        while (v349 != v346);
        v348 = v424[0];
      }
      v424[1] = v346;
      operator delete(v348);
    }
    *(_OWORD *)v424 = *(_OWORD *)__dst;
    v424[2] = *(void **)&__dst[16];
    memset(__dst, 0, 24);
    if (v396)
    {
      uint64_t v354 = v394;
      v355 = v395;
      uint64_t v356 = *v395;
      *(void *)(v356 + 8) = *(void *)(v394 + 8);
      **(void **)(v354 + 8) = v356;
      uint64_t v396 = 0;
      if (v355 != &v394)
      {
        do
        {
          v360 = (uint64_t *)v355[1];
          if (*((char *)v355 + 39) < 0) {
            operator delete((void *)v355[2]);
          }
          operator delete(v355);
          v355 = v360;
        }
        while (v360 != &v394);
      }
    }
    if (v418)
    {
      v357 = (void **)v417;
      v358 = (void **)v416;
      uint64_t v359 = *(void *)v417;
      *(void *)(v359 + 8) = *((void *)v416 + 1);
      *v358[1] = v359;
      unint64_t v418 = 0;
      if (v357 != &v416)
      {
        do
        {
          v361 = (void **)v357[1];
          if (*((char *)v357 + 39) < 0) {
            operator delete(v357[2]);
          }
          operator delete(v357);
          v357 = v361;
        }
        while (v361 != &v416);
      }
    }
    int v22 = 0;
    if (SHIBYTE(v425[2]) < 0) {
LABEL_752:
    }
      operator delete(v425[0]);
LABEL_39:
    if (!v22) {
      continue;
    }
    break;
  }
  if (!v389) {
    rl_bind_key(9, 0);
  }
  if (SHIBYTE(v420) < 0) {
    operator delete((void *)v419);
  }
  v364 = (char *)v424[0];
  if (v424[0])
  {
    v365 = v424[1];
    v366 = v424[0];
    if (v424[1] != v424[0])
    {
      do
      {
        v367 = (char *)(v365 - 3);
        if (*(v365 - 1))
        {
          uint64_t v368 = *(v365 - 3);
          v369 = (char *)*(v365 - 2);
          uint64_t v370 = *(void *)v369;
          *(void *)(v370 + 8) = *(void *)(v368 + 8);
          **(void **)(v368 + 8) = v370;
          *(v365 - 1) = 0;
          if (v369 != v367)
          {
            do
            {
              v371 = (char *)*((void *)v369 + 1);
              if (v369[39] < 0) {
                operator delete(*((void **)v369 + 2));
              }
              operator delete(v369);
              v369 = v371;
            }
            while (v371 != v367);
          }
        }
        v365 = v367;
      }
      while (v367 != v364);
      v366 = v424[0];
    }
    v424[1] = v364;
    operator delete(v366);
  }
  LOBYTE(v9) = v387;
  return v9 & 1;
}

void sub_10000A154(_Unwind_Exception *a1)
{
  if (SLOBYTE(STACK[0x437]) < 0) {
    operator delete((void *)STACK[0x420]);
  }
  sub_100005AB8((uint64_t)&STACK[0x440]);
  sub_100005930((char *)&STACK[0x228]);
  if (SLOBYTE(STACK[0x2A7]) < 0) {
    operator delete((void *)STACK[0x290]);
  }
  if (SLOBYTE(STACK[0x257]) < 0) {
    operator delete((void *)STACK[0x240]);
  }
  sub_100006484((void **)&STACK[0x270]);
  _Unwind_Resume(a1);
}

void *sub_10000A680(void *a1, uint64_t a2)
{
  *a1 = a1;
  a1[1] = a1;
  a1[2] = 0;
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 != a2)
  {
    uint64_t v5 = 0;
    uint64_t v6 = a1;
    do
    {
      uint64_t v8 = operator new(0x28uLL);
      uint64_t v9 = v8 + 2;
      void *v8 = 0;
      v8[1] = 0;
      if (*(char *)(v3 + 39) < 0)
      {
        sub_1000035FC(v9, *(void **)(v3 + 16), *(void *)(v3 + 24));
        uint64_t v6 = (void *)*a1;
        uint64_t v5 = a1[2];
      }
      else
      {
        long long v7 = *(_OWORD *)(v3 + 16);
        v8[4] = *(void *)(v3 + 32);
        *(_OWORD *)uint64_t v9 = v7;
      }
      void *v8 = v6;
      v8[1] = a1;
      v6[1] = v8;
      *a1 = v8;
      a1[2] = ++v5;
      uint64_t v3 = *(void *)(v3 + 8);
      uint64_t v6 = v8;
    }
    while (v3 != a2);
  }
  return a1;
}

void sub_10000A740(_Unwind_Exception *a1)
{
  operator delete(v2);
  if (*((void *)v1 + 2))
  {
    uint64_t v4 = *(void *)v1;
    uint64_t v5 = (char *)*((void *)v1 + 1);
    uint64_t v6 = *(void *)v5;
    *(void *)(v6 + 8) = *(void *)(*(void *)v1 + 8);
    **(void **)(v4 + 8) = v6;
    *((void *)v1 + 2) = 0;
    if (v5 != v1)
    {
      do
      {
        long long v7 = (char *)*((void *)v5 + 1);
        if (v5[39] < 0) {
          operator delete(*((void **)v5 + 2));
        }
        operator delete(v5);
        uint64_t v5 = v7;
      }
      while (v7 != v1);
    }
  }
  _Unwind_Resume(a1);
}

char *sub_10000A7B4(void **a1, uint64_t a2)
{
  unint64_t v2 = 0xAAAAAAAAAAAAAAABLL * (((unsigned char *)a1[1] - (unsigned char *)*a1) >> 3);
  unint64_t v3 = v2 + 1;
  if (v2 + 1 > 0xAAAAAAAAAAAAAAALL) {
    sub_10000429C();
  }
  if (0x5555555555555556 * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3) > v3) {
    unint64_t v3 = 0x5555555555555556 * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3);
  }
  if (0xAAAAAAAAAAAAAAABLL * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3) >= 0x555555555555555) {
    unint64_t v6 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v6 = v3;
  }
  if (v6)
  {
    if (v6 > 0xAAAAAAAAAAAAAAALL) {
      sub_100004028();
    }
    long long v7 = (char *)operator new(24 * v6);
  }
  else
  {
    long long v7 = 0;
  }
  uint64_t v24 = &v7[24 * v2];
  unint64_t v25 = &v7[24 * v6];
  sub_10000A680(v24, a2);
  uint64_t v8 = v24 + 24;
  uint64_t v9 = (char *)*a1;
  uint64_t v10 = (char *)a1[1];
  if (v10 == *a1)
  {
    *a1 = v24;
    a1[1] = v8;
    a1[2] = v25;
  }
  else
  {
    uint64_t v11 = v24 - 24;
    do
    {
      *(void *)uint64_t v11 = v11;
      *((void *)v11 + 1) = v11;
      *((void *)v11 + 2) = 0;
      uint64_t v12 = *((void *)v10 - 1);
      if (v12)
      {
        uint64_t v14 = *((void *)v10 - 3);
        int v13 = (uint64_t *)*((void *)v10 - 2);
        uint64_t v15 = *v13;
        *(void *)(v15 + 8) = *(void *)(v14 + 8);
        **(void **)(v14 + 8) = v15;
        uint64_t v16 = *(void *)v11;
        *(void *)(v16 + 8) = v13;
        *int v13 = v16;
        *(void *)uint64_t v11 = v14;
        *(void *)(v14 + 8) = v11;
        *((void *)v11 + 2) = v12;
        *((void *)v10 - 1) = 0;
      }
      v10 -= 24;
      v11 -= 24;
    }
    while (v10 != v9);
    uint64_t v10 = (char *)*a1;
    uint64_t v17 = (char *)a1[1];
    *a1 = v11 + 24;
    a1[1] = v8;
    a1[2] = v25;
    if (v17 != v10)
    {
      do
      {
        uint64_t v18 = v17 - 24;
        if (*((void *)v17 - 1))
        {
          uint64_t v19 = *((void *)v17 - 3);
          uint64_t v20 = (char *)*((void *)v17 - 2);
          uint64_t v21 = *(void *)v20;
          *(void *)(v21 + 8) = *(void *)(v19 + 8);
          **(void **)(v19 + 8) = v21;
          *((void *)v17 - 1) = 0;
          if (v20 != v18)
          {
            do
            {
              int v22 = (char *)*((void *)v20 + 1);
              if (v20[39] < 0) {
                operator delete(*((void **)v20 + 2));
              }
              operator delete(v20);
              uint64_t v20 = v22;
            }
            while (v22 != v18);
          }
        }
        uint64_t v17 = v18;
      }
      while (v18 != v10);
    }
  }
  if (v10) {
    operator delete(v10);
  }
  return v24 + 24;
}

void sub_10000A9B4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_10000A9C8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_10000A9C8(uint64_t a1)
{
  unint64_t v3 = *(char **)(a1 + 8);
  unint64_t v2 = *(char **)(a1 + 16);
  if (v2 != v3)
  {
    do
    {
      uint64_t v5 = v2 - 24;
      *(void *)(a1 + 16) = v2 - 24;
      if (*((void *)v2 - 1))
      {
        uint64_t v6 = *((void *)v2 - 3);
        long long v7 = (char *)*((void *)v2 - 2);
        uint64_t v8 = *(void *)v7;
        *(void *)(v8 + 8) = *(void *)(v6 + 8);
        **(void **)(v6 + 8) = v8;
        *((void *)v2 - 1) = 0;
        if (v7 != v5)
        {
          do
          {
            uint64_t v9 = (char *)*((void *)v7 + 1);
            if (v7[39] < 0) {
              operator delete(*((void **)v7 + 2));
            }
            operator delete(v7);
            long long v7 = v9;
          }
          while (v9 != v5);
          uint64_t v5 = *(char **)(a1 + 16);
        }
      }
      unint64_t v2 = v5;
    }
    while (v5 != v3);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

char **sub_10000AA88(const char *a1)
{
  rl_attempted_completion_over = 0;
  double result = rl_completion_matches(a1, (rl_compentry_func_t *)sub_10000AAD4);
  if (!result) {
    rl_completion_append_character = 0;
  }
  return result;
}

char *sub_10000AAD4(char *a1, int a2)
{
  v522 = (void **)&v522;
  v523 = &v522;
  v524 = 0;
  if (!qword_1000242C8) {
    return 0;
  }
  uint64_t v4 = std::__shared_weak_count::lock((std::__shared_weak_count *)qword_1000242C8);
  if (v4)
  {
    uint64_t v5 = v4;
    __s = a1;
    uint64_t v6 = (char *)qword_1000242C0;
    if (atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      if (!v6) {
        goto LABEL_776;
      }
LABEL_9:
      uint64_t v520 = 0;
      v521 = 0;
      if (qword_1000242C8
        && (v521 = std::__shared_weak_count::lock((std::__shared_weak_count *)qword_1000242C8)) != 0)
      {
        uint64_t v7 = qword_1000242C0;
        uint64_t v520 = qword_1000242C0;
      }
      else
      {
        uint64_t v7 = 0;
      }
      *((unsigned char *)&v532.__r_.__value_.__s + 23) = 2;
      strcpy((char *)&v532, "cd");
      HIBYTE(v534) = 2;
      strcpy((char *)&v533, "ls");
      HIBYTE(v536) = 7;
      strcpy((char *)&v535, "history");
      HIBYTE(v538) = 4;
      strcpy((char *)&v537, "help");
      HIBYTE(v540) = 4;
      strcpy((char *)&__p, "quit");
      uint64_t v8 = &v532;
      uint64_t v9 = v523;
      if (v523 == &v522)
      {
        uint64_t v12 = 0;
      }
      else
      {
        uint64_t v10 = (void **)(v523 + 2);
        if (v523 + 2 != (void ***)&v532)
        {
          if (*((char *)v523 + 39) < 0)
          {
            if ((v532.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              int v13 = &v532;
            }
            else {
              int v13 = (std::string *)v532.__r_.__value_.__r.__words[0];
            }
            if ((v532.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              size_t size = HIBYTE(v532.__r_.__value_.__r.__words[2]);
            }
            else {
              size_t size = v532.__r_.__value_.__l.__size_;
            }
            sub_100004424(v10, v13, size);
          }
          else
          {
            std::string::size_type v11 = v532.__r_.__value_.__r.__words[2];
            *(_OWORD *)uint64_t v10 = *(_OWORD *)&v532.__r_.__value_.__l.__data_;
            v9[4] = (void **)v11;
          }
        }
        uint64_t v15 = v9[1];
        if (v15 == (void **)&v522)
        {
          char v18 = 0;
          uint64_t v12 = 1;
        }
        else
        {
          uint64_t v16 = v15 + 2;
          if (v15 + 2 != (void **)&v533)
          {
            if (*((char *)v15 + 39) < 0)
            {
              if (SHIBYTE(v534) >= 0) {
                uint64_t v19 = &v533;
              }
              else {
                uint64_t v19 = (long long *)v533;
              }
              if (SHIBYTE(v534) >= 0) {
                size_t v20 = HIBYTE(v534);
              }
              else {
                size_t v20 = *((void *)&v533 + 1);
              }
              sub_100004424(v16, v19, v20);
            }
            else if ((HIBYTE(v534) & 0x80) != 0)
            {
              sub_10000435C(v16, (void *)v533, *((size_t *)&v533 + 1));
            }
            else
            {
              long long v17 = v533;
              v15[4] = v534;
              *(_OWORD *)uint64_t v16 = v17;
            }
          }
          uint64_t v15 = (void **)v15[1];
          if (v15 == (void **)&v522)
          {
            char v18 = 0;
            uint64_t v12 = 2;
          }
          else
          {
            uint64_t v21 = v15 + 2;
            if (v15 + 2 != (void **)&v535)
            {
              if (*((char *)v15 + 39) < 0)
              {
                if (SHIBYTE(v536) >= 0) {
                  v23 = &v535;
                }
                else {
                  v23 = (long long *)v535;
                }
                if (SHIBYTE(v536) >= 0) {
                  size_t v24 = HIBYTE(v536);
                }
                else {
                  size_t v24 = *((void *)&v535 + 1);
                }
                sub_100004424(v21, v23, v24);
              }
              else if ((HIBYTE(v536) & 0x80) != 0)
              {
                sub_10000435C(v21, (void *)v535, *((size_t *)&v535 + 1));
              }
              else
              {
                long long v22 = v535;
                v15[4] = v536;
                *(_OWORD *)uint64_t v21 = v22;
              }
            }
            uint64_t v15 = (void **)v15[1];
            if (v15 == (void **)&v522)
            {
              char v18 = 0;
              uint64_t v12 = 3;
            }
            else
            {
              unint64_t v25 = v15 + 2;
              if (v15 + 2 != (void **)&v537)
              {
                if (*((char *)v15 + 39) < 0)
                {
                  if (SHIBYTE(v538) >= 0) {
                    long long v27 = &v537;
                  }
                  else {
                    long long v27 = (long long *)v537;
                  }
                  if (SHIBYTE(v538) >= 0) {
                    size_t v28 = HIBYTE(v538);
                  }
                  else {
                    size_t v28 = *((void *)&v537 + 1);
                  }
                  sub_100004424(v25, v27, v28);
                }
                else if ((HIBYTE(v538) & 0x80) != 0)
                {
                  sub_10000435C(v25, (void *)v537, *((size_t *)&v537 + 1));
                }
                else
                {
                  long long v26 = v537;
                  v15[4] = v538;
                  *(_OWORD *)unint64_t v25 = v26;
                }
              }
              uint64_t v15 = (void **)v15[1];
              if (v15 == (void **)&v522)
              {
                char v18 = 0;
                uint64_t v12 = 4;
              }
              else
              {
                uint64_t v29 = v15 + 2;
                if (v15 + 2 != (void **)&__p)
                {
                  if (*((char *)v15 + 39) < 0)
                  {
                    if (SHIBYTE(v540) >= 0) {
                      p_p = &__p;
                    }
                    else {
                      p_p = (long long *)__p;
                    }
                    if (SHIBYTE(v540) >= 0) {
                      size_t v32 = HIBYTE(v540);
                    }
                    else {
                      size_t v32 = *((void *)&__p + 1);
                    }
                    sub_100004424(v29, p_p, v32);
                  }
                  else if ((HIBYTE(v540) & 0x80) != 0)
                  {
                    sub_10000435C(v29, (void *)__p, *((size_t *)&__p + 1));
                  }
                  else
                  {
                    long long v30 = __p;
                    v15[4] = v540;
                    *(_OWORD *)uint64_t v29 = v30;
                  }
                }
                uint64_t v15 = (void **)v15[1];
                char v18 = 1;
                uint64_t v12 = 5;
              }
            }
          }
        }
        if (v15 != (void **)&v522)
        {
          unint64_t v33 = v522;
          xpc_object_t v34 = *v15;
          v34[1] = v522[1];
          *(void *)v33[1] = v34;
          do
          {
            v35 = (void ***)v15[1];
            v524 = (CommandBase *)((char *)v524 - 1);
            if (*((char *)v15 + 39) < 0) {
              operator delete(v15[2]);
            }
            operator delete(v15);
            uint64_t v15 = (void **)v35;
          }
          while (v35 != &v522);
LABEL_95:
          if (SHIBYTE(v540) < 0)
          {
            operator delete((void *)__p);
            if ((SHIBYTE(v538) & 0x80000000) == 0)
            {
LABEL_97:
              if ((SHIBYTE(v536) & 0x80000000) == 0) {
                goto LABEL_98;
              }
              goto LABEL_150;
            }
          }
          else if ((SHIBYTE(v538) & 0x80000000) == 0)
          {
            goto LABEL_97;
          }
          operator delete((void *)v537);
          if ((SHIBYTE(v536) & 0x80000000) == 0)
          {
LABEL_98:
            if ((SHIBYTE(v534) & 0x80000000) == 0) {
              goto LABEL_99;
            }
            goto LABEL_151;
          }
LABEL_150:
          operator delete((void *)v535);
          if ((SHIBYTE(v534) & 0x80000000) == 0)
          {
LABEL_99:
            if ((SHIBYTE(v532.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
            {
LABEL_100:
              v519[0] = 0;
              v519[1] = 0;
              v518 = v519;
              size_t v42 = *(const void ***)(v7 + 88);
              if (v42 != (const void **)(v7 + 96))
              {
                do
                {
                  sub_100013B00((uint64_t **)&v518, (uint64_t *)v519, v42 + 4, (uint64_t)(v42 + 4));
                  v43 = (const void **)v42[1];
                  if (v43)
                  {
                    do
                    {
                      int v44 = (const void ***)v43;
                      v43 = (const void **)*v43;
                    }
                    while (v43);
                  }
                  else
                  {
                    do
                    {
                      int v44 = (const void ***)v42[2];
                      BOOL v372 = *v44 == v42;
                      size_t v42 = (const void **)v44;
                    }
                    while (!v372);
                  }
                  size_t v42 = (const void **)v44;
                }
                while (v44 != (const void ***)(v7 + 96));
                v45 = (uint64_t *)v518;
                if (v518 != v519)
                {
                  do
                  {
                    size_t v46 = operator new(0x28uLL);
                    size_t v47 = v46 + 2;
                    *size_t v46 = 0;
                    v46[1] = 0;
                    if (*((char *)v45 + 55) < 0)
                    {
                      sub_1000035FC(v47, (void *)v45[4], v45[5]);
                    }
                    else
                    {
                      long long v48 = *((_OWORD *)v45 + 2);
                      v46[4] = v45[6];
                      *(_OWORD *)size_t v47 = v48;
                    }
                    int v49 = v522;
                    *size_t v46 = v522;
                    v46[1] = &v522;
                    v49[1] = v46;
                    v522 = (void **)v46;
                    v524 = (CommandBase *)((char *)v524 + 1);
                    v50 = (char *)v45[1];
                    if (v50)
                    {
                      do
                      {
                        size_t v51 = (char **)v50;
                        v50 = *(char **)v50;
                      }
                      while (v50);
                    }
                    else
                    {
                      do
                      {
                        size_t v51 = (char **)v45[2];
                        BOOL v372 = *v51 == (char *)v45;
                        v45 = (uint64_t *)v51;
                      }
                      while (!v372);
                    }
                    v45 = (uint64_t *)v51;
                  }
                  while (v51 != v519);
                }
              }
              v517[0] = 0;
              v517[1] = 0;
              v516 = v517;
              size_t v52 = *(const void ***)(v7 + 160);
              if (v52 != (const void **)(v7 + 168))
              {
                do
                {
                  sub_100013FAC(&v516, v517, v52 + 4, (uint64_t)(v52 + 4));
                  int v53 = (const void **)v52[1];
                  if (v53)
                  {
                    do
                    {
                      v54 = (const void ***)v53;
                      int v53 = (const void **)*v53;
                    }
                    while (v53);
                  }
                  else
                  {
                    do
                    {
                      v54 = (const void ***)v52[2];
                      BOOL v372 = *v54 == v52;
                      size_t v52 = (const void **)v54;
                    }
                    while (!v372);
                  }
                  size_t v52 = (const void **)v54;
                }
                while (v54 != (const void ***)(v7 + 168));
                int v55 = v516;
                if (v516 != v517)
                {
                  do
                  {
                    int v56 = operator new(0x28uLL);
                    int v57 = v56 + 2;
                    *int v56 = 0;
                    v56[1] = 0;
                    if (*((char *)v55 + 55) < 0)
                    {
                      sub_1000035FC(v57, (void *)v55[4], v55[5]);
                    }
                    else
                    {
                      long long v58 = *((_OWORD *)v55 + 2);
                      v56[4] = v55[6];
                      *(_OWORD *)int v57 = v58;
                    }
                    v59 = v522;
                    *int v56 = v522;
                    v56[1] = &v522;
                    v59[1] = v56;
                    v522 = (void **)v56;
                    v524 = (CommandBase *)((char *)v524 + 1);
                    unint64_t v60 = (uint64_t *)v55[1];
                    if (v60)
                    {
                      do
                      {
                        v61 = v60;
                        unint64_t v60 = (uint64_t *)*v60;
                      }
                      while (v60);
                    }
                    else
                    {
                      do
                      {
                        v61 = (uint64_t *)v55[2];
                        BOOL v372 = *v61 == (void)v55;
                        int v55 = v61;
                      }
                      while (!v372);
                    }
                    int v55 = v61;
                  }
                  while (v61 != v517);
                }
              }
              long long v62 = &OsLogStream__metaData;
              uint64_t ivar_lyt = qword_1000242E0;
              if (a2) {
                goto LABEL_765;
              }
              rl_completion_append_character = 32;
              uint64_t v64 = qword_1000242D8;
              while (ivar_lyt != v64)
              {
                if (*(char *)(ivar_lyt - 1) < 0) {
                  operator delete(*(void **)(ivar_lyt - 24));
                }
                ivar_lyt -= 24;
              }
              qword_1000242E0 = v64;
              qword_1000242D0 = 0;
              v513 = (char *)&v513;
              v514 = &v513;
              unint64_t v515 = 0;
              char v65 = rl_line_buffer;
              size_t v66 = rl_end;
              v511 = 0;
              v512 = 0;
              __str = 0;
              if (rl_end)
              {
                if (rl_end < 0) {
                  sub_10000429C();
                }
                char v67 = (char *)operator new(rl_end);
                __str = v67;
                v68 = &v67[v66];
                v512 = &v67[v66];
                memcpy(v67, v65, v66);
                v511 = &v67[v66];
                unint64_t v69 = v66 + 1;
                if ((uint64_t)(v66 + 1) < 0) {
                  sub_10000429C();
                }
              }
              else
              {
                char v67 = 0;
                v68 = 0;
                size_t v66 = 0;
                unint64_t v69 = 1;
              }
              if (2 * v66 > v69) {
                unint64_t v69 = 2 * v66;
              }
              if (v66 >= 0x3FFFFFFFFFFFFFFFLL) {
                size_t v70 = 0x7FFFFFFFFFFFFFFFLL;
              }
              else {
                size_t v70 = v69;
              }
              if (v70)
              {
                int v71 = operator new(v70);
                v72 = &v71[v66];
                size_t v73 = &v71[v70];
                v71[v66] = 0;
                uint64_t v74 = (uint64_t)&v71[v66 + 1];
                if (v68 != v67) {
                  goto LABEL_163;
                }
              }
              else
              {
                int v71 = 0;
                v72 = (char *)v66;
                size_t v73 = 0;
                *(unsigned char *)size_t v66 = 0;
                uint64_t v74 = v66 + 1;
                if (v68 != v67)
                {
LABEL_163:
                  memcpy(v71, v67, v66);
                  __str = v71;
                  v511 = (char *)v74;
                  v512 = v73;
                  if (!v67) {
                    goto LABEL_165;
                  }
                  goto LABEL_164;
                }
              }
              int v71 = v72;
              __str = v72;
              v511 = (char *)v74;
              v512 = v73;
              if (!v67)
              {
LABEL_165:
                v511 = (char *)v74;
                memset(__dst, 170, sizeof(__dst));
                size_t v75 = strlen(v71);
                if (v75 > 0x7FFFFFFFFFFFFFF7) {
                  sub_100003540();
                }
                v76 = (void *)v75;
                if (v75 >= 0x17)
                {
                  uint64_t v83 = (v75 & 0xFFFFFFFFFFFFFFF8) + 8;
                  if ((v75 | 7) != 0x17) {
                    uint64_t v83 = v75 | 7;
                  }
                  uint64_t v84 = v83 + 1;
                  v77 = (void **)operator new(v83 + 1);
                  __dst[1] = v76;
                  __dst[2] = (void *)(v84 | 0x8000000000000000);
                  __dst[0] = v77;
                }
                else
                {
                  HIBYTE(__dst[2]) = v75;
                  v77 = __dst;
                  if (!v75)
                  {
LABEL_178:
                    *((unsigned char *)v76 + (void)v77) = 0;
                    unint64_t v85 = strtok(__str, " ");
                    if (v85)
                    {
                      size_t v86 = v85;
                      do
                      {
                        size_t v87 = strlen(v86);
                        if (v87 > 0x7FFFFFFFFFFFFFF7) {
                          sub_100003540();
                        }
                        std::string::size_type v88 = v87;
                        if (v87 >= 0x17)
                        {
                          uint64_t v90 = (v87 & 0xFFFFFFFFFFFFFFF8) + 8;
                          if ((v87 | 7) != 0x17) {
                            uint64_t v90 = v87 | 7;
                          }
                          uint64_t v91 = v90 + 1;
                          v89 = operator new(v90 + 1);
                          v532.__r_.__value_.__l.__size_ = v88;
                          v532.__r_.__value_.__r.__words[2] = v91 | 0x8000000000000000;
                          v532.__r_.__value_.__r.__words[0] = (std::string::size_type)v89;
                        }
                        else
                        {
                          *((unsigned char *)&v532.__r_.__value_.__s + 23) = v87;
                          v89 = &v532;
                          if (!v87) {
                            goto LABEL_188;
                          }
                        }
                        memmove(v89, v86, v88);
LABEL_188:
                        *((unsigned char *)v89 + v88) = 0;
                        uint64_t v92 = (char *)operator new(0x28uLL);
                        *(std::string *)(v92 + 16) = v532;
                        v93 = v513;
                        *(void *)uint64_t v92 = v513;
                        *((void *)v92 + 1) = &v513;
                        *((void *)v93 + 1) = v92;
                        v513 = v92;
                        ++v515;
                        size_t v86 = strtok(0, " ");
                      }
                      while (v86);
                    }
                    if (SHIBYTE(__dst[2]) < 0)
                    {
                      v94 = __dst[1];
                      if (__dst[1])
                      {
LABEL_198:
                        uint64_t v95 = __dst;
                        if (SHIBYTE(__dst[2]) < 0) {
                          uint64_t v95 = (void **)__dst[0];
                        }
                        int v507 = *((unsigned __int8 *)v95 + (void)v94 - 1) == 32;
                        unint64_t v96 = v515;
                        if (!v515) {
                          goto LABEL_716;
                        }
LABEL_203:
                        v97 = (char *)v514;
                        LODWORD(v98) = *((char *)v514 + 39);
                        if ((v98 & 0x80000000) != 0)
                        {
                          v99 = (char *)*((void *)v514 + 2);
                          int64_t v100 = *((void *)v514 + 3);
                          if (v100 < 1) {
                            goto LABEL_537;
                          }
                        }
                        else
                        {
                          v99 = (char *)v514 + 16;
                          int64_t v100 = *((unsigned __int8 *)v514 + 39);
                          if (!*((unsigned char *)v514 + 39)) {
                            goto LABEL_537;
                          }
                        }
                        uint64_t v101 = &v99[v100];
                        v102 = v99;
                        while (1)
                        {
                          long long v103 = (char *)memchr(v102, 47, v100);
                          if (!v103) {
                            goto LABEL_535;
                          }
                          if (*v103 == 47) {
                            break;
                          }
                          v102 = v103 + 1;
                          int64_t v100 = v101 - (unsigned char *)v102;
                          if (v101 - (unsigned char *)v102 < 1) {
                            goto LABEL_535;
                          }
                        }
                        if (v103 != v101 && v103 - v99 != -1)
                        {
                          if (v524)
                          {
                            v104 = v522;
                            v105 = v523;
                            v106 = *v523;
                            v106[1] = v522[1];
                            *(void *)v104[1] = v106;
                            v524 = 0;
                            if (v105 != &v522)
                            {
                              do
                              {
                                uint64_t v108 = (void ***)v105[1];
                                if (*((char *)v105 + 39) < 0) {
                                  operator delete(v105[2]);
                                }
                                operator delete(v105);
                                v105 = v108;
                              }
                              while (v108 != &v522);
                            }
                          }
                          rl_completion_append_character = 0;
                          rl_attempted_completion_over = 1;
                          v526 = 0;
                          v527 = 0;
                          if (qword_1000242C8)
                          {
                            v107 = std::__shared_weak_count::lock((std::__shared_weak_count *)qword_1000242C8);
                            v527 = v107;
                            if (v107) {
                              v526 = (CommandBase *)qword_1000242C0;
                            }
                          }
                          else
                          {
                            v107 = 0;
                          }
                          v109 = (char *)v514 + 16;
                          if (*((char *)v514 + 39) < 0)
                          {
                            if (!*((void *)v514 + 3)) {
                              goto LABEL_233;
                            }
                            v109 = (void *)*v109;
                          }
                          else if (!*((unsigned char *)v514 + 39))
                          {
                            goto LABEL_233;
                          }
                          if (*(unsigned char *)v109 == 47)
                          {
                            v110 = (std::__shared_weak_count *)qword_1000242B8;
                            if (qword_1000242B8)
                            {
                              v110 = std::__shared_weak_count::lock((std::__shared_weak_count *)qword_1000242B8);
                              v111 = (CommandBase *)qword_1000242B0;
                              if (!v110) {
                                v111 = 0;
                              }
                            }
                            else
                            {
                              v111 = 0;
                            }
                            v526 = v111;
                            v527 = v110;
                            if (v107 && !atomic_fetch_add(&v107->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                            {
                              ((void (*)(std::__shared_weak_count *))v107->__on_zero_shared)(v107);
                              std::__shared_weak_count::__release_weak(v107);
                            }
                            BOOL v112 = "/";
LABEL_239:
                            memset(&v532, 0, sizeof(v532));
                            memset(&v531, 170, sizeof(v531));
                            size_t v113 = strlen(v112);
                            if (v113 > 0x7FFFFFFFFFFFFFF7) {
                              sub_100003540();
                            }
                            std::string::size_type v114 = v113;
                            if (v113 >= 0x17)
                            {
                              uint64_t v116 = (v113 & 0xFFFFFFFFFFFFFFF8) + 8;
                              if ((v113 | 7) != 0x17) {
                                uint64_t v116 = v113 | 7;
                              }
                              uint64_t v117 = v116 + 1;
                              v115 = operator new(v116 + 1);
                              v531.__r_.__value_.__l.__size_ = v114;
                              v531.__r_.__value_.__r.__words[2] = v117 | 0x8000000000000000;
                              v531.__r_.__value_.__r.__words[0] = (std::string::size_type)v115;
                            }
                            else
                            {
                              *((unsigned char *)&v531.__r_.__value_.__s + 23) = v113;
                              v115 = &v531;
                              if (!v113)
                              {
LABEL_247:
                                v115[v114] = 0;
                                unint64_t v118 = v515;
                                if (!v515) {
                                  goto LABEL_401;
                                }
                                memset(v530, 170, 24);
                                uint64_t v119 = (char *)v514;
                                if (*((char *)v514 + 39) < 0)
                                {
                                  sub_1000035FC(v530, *((void **)v514 + 2), *((void *)v514 + 3));
                                  uint64_t v119 = (char *)v514;
                                  unint64_t v118 = v515;
                                }
                                else
                                {
                                  *(_OWORD *)v530 = *((_OWORD *)v514 + 1);
                                  v530[2] = *((void **)v514 + 4);
                                }
                                uint64_t v120 = *(void *)v119;
                                *(void *)(v120 + 8) = *((void *)v119 + 1);
                                **((void **)v119 + 1) = v120;
                                unint64_t v515 = v118 - 1;
                                if (v119[39] < 0) {
                                  operator delete(*((void **)v119 + 2));
                                }
                                operator delete(v119);
                                if (SHIBYTE(v530[2]) < 0)
                                {
                                  uint64_t v122 = (void **)v530[0];
                                  uint64_t v121 = v530[1];
                                }
                                else
                                {
                                  uint64_t v121 = (void *)HIBYTE(v530[2]);
                                  uint64_t v122 = v530;
                                }
                                memset(&v529, 0, sizeof(v529));
                                size_t v123 = (size_t)v121 + 1;
                                if ((uint64_t)v121 + 1 < 0) {
                                  sub_10000429C();
                                }
                                int v124 = operator new((size_t)v121 + 1);
                                v529.__r_.__value_.__r.__words[0] = (std::string::size_type)v124;
                                v529.__r_.__value_.__r.__words[2] = (std::string::size_type)v124 + v123;
                                memcpy(v124, v122, v123);
                                v529.__r_.__value_.__l.__size_ = (std::string::size_type)v124 + v123;
                                memset(&v542, 170, sizeof(v542));
                                size_t v125 = strlen((const char *)v124);
                                if (v125 > 0x7FFFFFFFFFFFFFF7) {
                                  sub_100003540();
                                }
                                std::string::size_type v126 = v125;
                                if (v125 >= 0x17)
                                {
                                  uint64_t v128 = (v125 & 0xFFFFFFFFFFFFFFF8) + 8;
                                  if ((v125 | 7) != 0x17) {
                                    uint64_t v128 = v125 | 7;
                                  }
                                  uint64_t v129 = v128 + 1;
                                  v127 = operator new(v128 + 1);
                                  v542.__r_.__value_.__l.__size_ = v126;
                                  v542.__r_.__value_.__r.__words[2] = v129 | 0x8000000000000000;
                                  v542.__r_.__value_.__r.__words[0] = (std::string::size_type)v127;
                                }
                                else
                                {
                                  *((unsigned char *)&v542.__r_.__value_.__s + 23) = v125;
                                  v127 = &v542;
                                  if (!v125) {
                                    goto LABEL_265;
                                  }
                                }
                                memcpy(v127, v124, v126);
LABEL_265:
                                *((unsigned char *)v127 + v126) = 0;
                                *(void *)v541 = v541;
                                *(void *)&v541[8] = v541;
                                *(void *)&v541[16] = 0;
                                if ((v542.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                                  v130 = &v542;
                                }
                                else {
                                  v130 = (std::string *)v542.__r_.__value_.__r.__words[0];
                                }
                                uint64_t v131 = strtok((char *)v130, "/");
                                if (v131)
                                {
                                  uint64_t v132 = v131;
                                  do
                                  {
                                    size_t v133 = strlen(v132);
                                    if (v133 > 0x7FFFFFFFFFFFFFF7) {
                                      sub_100003540();
                                    }
                                    v134 = (void *)v133;
                                    if (v133 >= 0x17)
                                    {
                                      uint64_t v136 = (v133 & 0xFFFFFFFFFFFFFFF8) + 8;
                                      if ((v133 | 7) != 0x17) {
                                        uint64_t v136 = v133 | 7;
                                      }
                                      uint64_t v137 = v136 + 1;
                                      int v135 = operator new(v136 + 1);
                                      v528[1] = v134;
                                      v528[2] = (void *)(v137 | 0x8000000000000000);
                                      v528[0] = v135;
                                    }
                                    else
                                    {
                                      HIBYTE(v528[2]) = v133;
                                      int v135 = v528;
                                      if (!v133) {
                                        goto LABEL_278;
                                      }
                                    }
                                    memmove(v135, v132, (size_t)v134);
LABEL_278:
                                    *((unsigned char *)v134 + (void)v135) = 0;
                                    BOOL v138 = (void **)operator new(0x28uLL);
                                    *((_OWORD *)v138 + 1) = *(_OWORD *)v528;
                                    v138[4] = v528[2];
                                    uint64_t v139 = *(void *)v541;
                                    *BOOL v138 = *(void **)v541;
                                    v138[1] = v541;
                                    *(void *)(v139 + 8) = v138;
                                    *(void *)v541 = v138;
                                    ++*(void *)&v541[16];
                                    uint64_t v132 = strtok(0, "/");
                                  }
                                  while (v132);
                                }
                                if (!*(void *)&v541[16]) {
                                  goto LABEL_395;
                                }
                                while (1)
                                {
                                  if (&v532 != (std::string *)(*(void *)&v541[8] + 16))
                                  {
                                    char v140 = *(unsigned char *)(*(void *)&v541[8] + 39);
                                    if (SHIBYTE(v532.__r_.__value_.__r.__words[2]) < 0)
                                    {
                                      if (v140 >= 0) {
                                        uint64_t v141 = (void *)(*(void *)&v541[8] + 16);
                                      }
                                      else {
                                        uint64_t v141 = *(void **)(*(void *)&v541[8] + 16);
                                      }
                                      if (v140 >= 0) {
                                        size_t v142 = *(unsigned __int8 *)(*(void *)&v541[8] + 39);
                                      }
                                      else {
                                        size_t v142 = *(void *)(*(void *)&v541[8] + 24);
                                      }
                                      sub_100004424((void **)&v532.__r_.__value_.__l.__data_, v141, v142);
                                    }
                                    else if ((*(unsigned char *)(*(void *)&v541[8] + 39) & 0x80) != 0)
                                    {
                                      sub_10000435C(&v532, *(void **)(*(void *)&v541[8] + 16), *(void *)(*(void *)&v541[8] + 24));
                                    }
                                    else
                                    {
                                      std::string v532 = *(std::string *)(*(void *)&v541[8] + 16);
                                    }
                                  }
                                  uint64_t v143 = v526;
                                  v528[1] = 0;
                                  v528[2] = 0;
                                  v528[0] = &v528[1];
                                  v144 = (const void **)*((void *)v526 + 20);
                                  uint64_t v145 = (const void ***)((char *)v526 + 168);
                                  if (v144 == (const void **)((char *)v526 + 168))
                                  {
                                    v146 = 0;
                                    std::string::size_type v147 = HIBYTE(v532.__r_.__value_.__r.__words[2]);
                                    std::string::size_type v148 = v532.__r_.__value_.__l.__size_;
                                    goto LABEL_341;
                                  }
                                  do
                                  {
                                    sub_100013FAC((uint64_t **)v528, (uint64_t *)&v528[1], v144 + 4, (uint64_t)(v144 + 4));
                                    size_t v149 = (const void **)v144[1];
                                    if (v149)
                                    {
                                      do
                                      {
                                        v150 = (const void ***)v149;
                                        size_t v149 = (const void **)*v149;
                                      }
                                      while (v149);
                                    }
                                    else
                                    {
                                      do
                                      {
                                        v150 = (const void ***)v144[2];
                                        BOOL v372 = *v150 == v144;
                                        v144 = (const void **)v150;
                                      }
                                      while (!v372);
                                    }
                                    v144 = (const void **)v150;
                                  }
                                  while (v150 != v145);
                                  v146 = v528[1];
                                  std::string::size_type v147 = HIBYTE(v532.__r_.__value_.__r.__words[2]);
                                  std::string::size_type v148 = v532.__r_.__value_.__l.__size_;
                                  if (v528[1])
                                  {
                                    if ((v532.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                                      v151 = &v532;
                                    }
                                    else {
                                      v151 = (std::string *)v532.__r_.__value_.__r.__words[0];
                                    }
                                    if ((v532.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                                      std::string::size_type v152 = HIBYTE(v532.__r_.__value_.__r.__words[2]);
                                    }
                                    else {
                                      std::string::size_type v152 = v532.__r_.__value_.__l.__size_;
                                    }
                                    v153 = &v528[1];
                                    v154 = (void **)v528[1];
                                    while (1)
                                    {
                                      int v155 = *((char *)v154 + 55);
                                      if (v155 >= 0) {
                                        unint64_t v156 = v154 + 4;
                                      }
                                      else {
                                        unint64_t v156 = v154[4];
                                      }
                                      if (v155 >= 0) {
                                        size_t v157 = *((unsigned __int8 *)v154 + 55);
                                      }
                                      else {
                                        size_t v157 = (size_t)v154[5];
                                      }
                                      if (v152 >= v157) {
                                        size_t v158 = v157;
                                      }
                                      else {
                                        size_t v158 = v152;
                                      }
                                      int v159 = memcmp(v156, v151, v158);
                                      if (v159)
                                      {
                                        if (v159 < 0) {
                                          goto LABEL_311;
                                        }
LABEL_325:
                                        v153 = v154;
                                        v154 = (void **)*v154;
                                        if (!v154)
                                        {
LABEL_326:
                                          if (v153 == &v528[1])
                                          {
                                            long long v62 = &OsLogStream__metaData;
                                            break;
                                          }
                                          v162 = (void **)v153[4];
                                          long long v161 = v153 + 4;
                                          v160 = v162;
                                          int v163 = *((char *)v161 + 23);
                                          if (v163 >= 0) {
                                            long long v164 = v161;
                                          }
                                          else {
                                            long long v164 = v160;
                                          }
                                          if (v163 >= 0) {
                                            size_t v165 = *((unsigned __int8 *)v161 + 23);
                                          }
                                          else {
                                            size_t v165 = (size_t)v161[1];
                                          }
                                          if (v165 >= v152) {
                                            size_t v166 = v152;
                                          }
                                          else {
                                            size_t v166 = v165;
                                          }
                                          int v167 = memcmp(v151, v164, v166);
                                          long long v62 = &OsLogStream__metaData;
                                          if (v167)
                                          {
                                            if (v167 < 0) {
                                              break;
                                            }
                                          }
                                          else if (v152 < v165)
                                          {
                                            break;
                                          }
                                          v525[0] = (CommandBase *)&v532;
                                          v177 = sub_10000E4B4((uint64_t **)v528, (const void **)&v532.__r_.__value_.__l.__data_, (uint64_t)&std::piecewise_construct, (long long **)v525);
                                          v179 = (CommandBase *)v177[7];
                                          v178 = v177[8];
                                          if (v178) {
                                            atomic_fetch_add_explicit(v178 + 1, 1uLL, memory_order_relaxed);
                                          }
                                          size_t v170 = v527;
                                          v526 = v179;
                                          v527 = (std::__shared_weak_count *)v178;
                                          if (v170 && !atomic_fetch_add(&v170->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                                          {
                                            ((void (*)(std::__shared_weak_count *))v170->__on_zero_shared)(v170);
                                            goto LABEL_368;
                                          }
                                          goto LABEL_369;
                                        }
                                      }
                                      else
                                      {
                                        if (v157 >= v152) {
                                          goto LABEL_325;
                                        }
LABEL_311:
                                        v154 = (void **)v154[1];
                                        if (!v154) {
                                          goto LABEL_326;
                                        }
                                      }
                                    }
                                  }
LABEL_341:
                                  if ((v147 & 0x80u) == 0) {
                                    std::string::size_type v168 = v147;
                                  }
                                  else {
                                    std::string::size_type v168 = v148;
                                  }
                                  if (v168 != 2
                                    || ((v147 & 0x80u) == 0
                                      ? (v169 = &v532)
                                      : (v169 = (std::string *)v532.__r_.__value_.__r.__words[0]),
                                        LOWORD(v169->__r_.__value_.__l.__data_) != 11822))
                                  {
                                    sub_10000E6C8((uint64_t)v528, (uint64_t)v146);
                                    if (*(void *)&v541[16])
                                    {
                                      uint64_t v192 = *(void *)v541;
                                      v193 = *(unsigned char **)&v541[8];
                                      uint64_t v194 = **(void **)&v541[8];
                                      *(void *)(v194 + 8) = *(void *)(*(void *)v541 + 8);
                                      **(void **)(v192 + 8) = v194;
                                      *(void *)&v541[16] = 0;
                                      if (v193 != v541)
                                      {
                                        do
                                        {
                                          int v213 = (unsigned char *)*((void *)v193 + 1);
                                          if ((char)v193[39] < 0) {
                                            operator delete(*((void **)v193 + 2));
                                          }
                                          operator delete(v193);
                                          v193 = v213;
                                        }
                                        while (v213 != v541);
                                      }
                                    }
LABEL_395:
                                    if (SHIBYTE(v542.__r_.__value_.__r.__words[2]) < 0) {
                                      operator delete(v542.__r_.__value_.__l.__data_);
                                    }
                                    if (v529.__r_.__value_.__r.__words[0])
                                    {
                                      v529.__r_.__value_.__l.__size_ = v529.__r_.__value_.__r.__words[0];
                                      operator delete(v529.__r_.__value_.__l.__data_);
                                    }
                                    if (SHIBYTE(v530[2]) < 0) {
                                      operator delete(v530[0]);
                                    }
LABEL_401:
                                    memset(v530, 170, 24);
                                    v504 = v526;
                                    CommandBase::getCommandSet(v526, (uint64_t)v530);
                                    if (((v515 == 0) & ~v507) != 0) {
                                      goto LABEL_453;
                                    }
                                    uint64_t v195 = (void **)v530[1];
                                    if (!v530[1]) {
                                      goto LABEL_453;
                                    }
                                    if ((v532.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                                      uint64_t v196 = &v532;
                                    }
                                    else {
                                      uint64_t v196 = (std::string *)v532.__r_.__value_.__r.__words[0];
                                    }
                                    if ((v532.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                                      std::string::size_type v197 = HIBYTE(v532.__r_.__value_.__r.__words[2]);
                                    }
                                    else {
                                      std::string::size_type v197 = v532.__r_.__value_.__l.__size_;
                                    }
                                    v198 = &v530[1];
                                    while (1)
                                    {
                                      int v199 = *((char *)v195 + 55);
                                      if (v199 >= 0) {
                                        v200 = v195 + 4;
                                      }
                                      else {
                                        v200 = v195[4];
                                      }
                                      if (v199 >= 0) {
                                        size_t v201 = *((unsigned __int8 *)v195 + 55);
                                      }
                                      else {
                                        size_t v201 = (size_t)v195[5];
                                      }
                                      if (v197 >= v201) {
                                        size_t v202 = v201;
                                      }
                                      else {
                                        size_t v202 = v197;
                                      }
                                      int v203 = memcmp(v200, v196, v202);
                                      if (v203)
                                      {
                                        if (v203 < 0) {
                                          goto LABEL_410;
                                        }
                                      }
                                      else if (v201 < v197)
                                      {
LABEL_410:
                                        uint64_t v195 = (void **)v195[1];
                                        if (!v195) {
                                          goto LABEL_425;
                                        }
                                        continue;
                                      }
                                      v198 = v195;
                                      uint64_t v195 = (void **)*v195;
                                      if (!v195)
                                      {
LABEL_425:
                                        if (v198 == &v530[1]) {
                                          goto LABEL_453;
                                        }
                                        size_t v206 = (void **)v198[4];
                                        v205 = v198 + 4;
                                        int v204 = v206;
                                        int v207 = *((char *)v205 + 23);
                                        if (v207 >= 0) {
                                          int v208 = v205;
                                        }
                                        else {
                                          int v208 = v204;
                                        }
                                        if (v207 >= 0) {
                                          size_t v209 = *((unsigned __int8 *)v205 + 23);
                                        }
                                        else {
                                          size_t v209 = (size_t)v205[1];
                                        }
                                        if (v209 >= v197) {
                                          size_t v210 = v197;
                                        }
                                        else {
                                          size_t v210 = v209;
                                        }
                                        int v211 = memcmp(v196, v208, v210);
                                        if (v211)
                                        {
                                          if ((v211 & 0x80000000) == 0) {
                                            goto LABEL_437;
                                          }
LABEL_453:
                                          uint64_t v222 = (void **)v530[0];
                                          if (v530[0] != &v530[1])
                                          {
                                            do
                                            {
                                              int v223 = SHIBYTE(v531.__r_.__value_.__r.__words[2]);
                                              if ((v531.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                                                size_t v224 = HIBYTE(v531.__r_.__value_.__r.__words[2]);
                                              }
                                              else {
                                                size_t v224 = v531.__r_.__value_.__l.__size_;
                                              }
                                              int v225 = *((char *)v222 + 55);
                                              if (v225 >= 0) {
                                                size_t v226 = *((unsigned __int8 *)v222 + 55);
                                              }
                                              else {
                                                size_t v226 = (size_t)v222[5];
                                              }
                                              unint64_t v227 = v226 + v224;
                                              memset(&v529, 170, sizeof(v529));
                                              if (v226 + v224 > 0x7FFFFFFFFFFFFFF7) {
                                                sub_100003540();
                                              }
                                              if (v227 > 0x16)
                                              {
                                                uint64_t v229 = (v227 & 0xFFFFFFFFFFFFFFF8) + 8;
                                                if ((v227 | 7) != 0x17) {
                                                  uint64_t v229 = v227 | 7;
                                                }
                                                uint64_t v230 = v229 + 1;
                                                uint64_t v228 = (char *)operator new(v229 + 1);
                                                v529.__r_.__value_.__l.__size_ = v226 + v224;
                                                v529.__r_.__value_.__r.__words[2] = v230 | 0x8000000000000000;
                                                v529.__r_.__value_.__r.__words[0] = (std::string::size_type)v228;
                                              }
                                              else
                                              {
                                                memset(&v529, 0, sizeof(v529));
                                                uint64_t v228 = (char *)&v529;
                                                *((unsigned char *)&v529.__r_.__value_.__s + 23) = v226 + v224;
                                              }
                                              long long v62 = &OsLogStream__metaData;
                                              if (v224)
                                              {
                                                if (v223 >= 0) {
                                                  uint64_t v231 = &v531;
                                                }
                                                else {
                                                  uint64_t v231 = (std::string *)v531.__r_.__value_.__r.__words[0];
                                                }
                                                memmove(v228, v231, v224);
                                              }
                                              v232 = &v228[v224];
                                              if (v226)
                                              {
                                                if (v225 >= 0) {
                                                  v233 = v222 + 4;
                                                }
                                                else {
                                                  v233 = v222[4];
                                                }
                                                memmove(v232, v233, v226);
                                              }
                                              v232[v226] = 0;
                                              v234 = std::string::append(&v529, " ", 1uLL);
                                              std::string::size_type v235 = v234->__r_.__value_.__r.__words[0];
                                              v542.__r_.__value_.__r.__words[0] = v234->__r_.__value_.__l.__size_;
                                              *(std::string::size_type *)((char *)v542.__r_.__value_.__r.__words + 7) = *(std::string::size_type *)((char *)&v234->__r_.__value_.__r.__words[1] + 7);
                                              char v236 = HIBYTE(v234->__r_.__value_.__r.__words[2]);
                                              v234->__r_.__value_.__l.__size_ = 0;
                                              v234->__r_.__value_.__r.__words[2] = 0;
                                              v234->__r_.__value_.__r.__words[0] = 0;
                                              int v237 = operator new(0x28uLL);
                                              std::string::size_type v238 = v542.__r_.__value_.__r.__words[0];
                                              v237[2] = v235;
                                              v237[3] = v238;
                                              *(void *)((char *)v237 + 31) = *(std::string::size_type *)((char *)v542.__r_.__value_.__r.__words + 7);
                                              *((unsigned char *)v237 + 39) = v236;
                                              uint64_t v239 = v522;
                                              *int v237 = v522;
                                              v237[1] = &v522;
                                              v239[1] = v237;
                                              v522 = (void **)v237;
                                              v524 = (CommandBase *)((char *)v524 + 1);
                                              if (SHIBYTE(v529.__r_.__value_.__r.__words[2]) < 0) {
                                                operator delete(v529.__r_.__value_.__l.__data_);
                                              }
                                              v240 = (void **)v222[1];
                                              if (v240)
                                              {
                                                do
                                                {
                                                  v241 = v240;
                                                  v240 = (void **)*v240;
                                                }
                                                while (v240);
                                              }
                                              else
                                              {
                                                do
                                                {
                                                  v241 = (void **)v222[2];
                                                  BOOL v372 = *v241 == v222;
                                                  uint64_t v222 = v241;
                                                }
                                                while (!v372);
                                              }
                                              uint64_t v222 = v241;
                                            }
                                            while (v241 != &v530[1]);
                                          }
                                          CommandBase::getSubCommandMap(v504, (uint64_t)&v529);
                                          std::string::size_type v242 = v529.__r_.__value_.__r.__words[0];
                                          if ((std::string::size_type *)v529.__r_.__value_.__l.__data_ != &v529.__r_.__value_.__r.__words[1])
                                          {
                                            do
                                            {
                                              int v243 = SHIBYTE(v531.__r_.__value_.__r.__words[2]);
                                              if ((v531.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                                                size_t v244 = HIBYTE(v531.__r_.__value_.__r.__words[2]);
                                              }
                                              else {
                                                size_t v244 = v531.__r_.__value_.__l.__size_;
                                              }
                                              int v245 = *(char *)(v242 + 55);
                                              if (v245 >= 0) {
                                                size_t v246 = *(unsigned __int8 *)(v242 + 55);
                                              }
                                              else {
                                                size_t v246 = *(void *)(v242 + 40);
                                              }
                                              unint64_t v247 = v246 + v244;
                                              memset(&v542, 170, sizeof(v542));
                                              if (v246 + v244 > 0x7FFFFFFFFFFFFFF7) {
                                                sub_100003540();
                                              }
                                              if (v247 > 0x16)
                                              {
                                                uint64_t v249 = (v247 & 0xFFFFFFFFFFFFFFF8) + 8;
                                                if ((v247 | 7) != 0x17) {
                                                  uint64_t v249 = v247 | 7;
                                                }
                                                uint64_t v250 = v249 + 1;
                                                v248 = (char *)operator new(v249 + 1);
                                                v542.__r_.__value_.__l.__size_ = v246 + v244;
                                                v542.__r_.__value_.__r.__words[2] = v250 | 0x8000000000000000;
                                                v542.__r_.__value_.__r.__words[0] = (std::string::size_type)v248;
                                              }
                                              else
                                              {
                                                memset(&v542, 0, sizeof(v542));
                                                v248 = (char *)&v542;
                                                *((unsigned char *)&v542.__r_.__value_.__s + 23) = v246 + v244;
                                              }
                                              long long v62 = &OsLogStream__metaData;
                                              if (v244)
                                              {
                                                if (v243 >= 0) {
                                                  v251 = &v531;
                                                }
                                                else {
                                                  v251 = (std::string *)v531.__r_.__value_.__r.__words[0];
                                                }
                                                memmove(v248, v251, v244);
                                              }
                                              v252 = &v248[v244];
                                              if (v246)
                                              {
                                                if (v245 >= 0) {
                                                  uint64_t v253 = (const void *)(v242 + 32);
                                                }
                                                else {
                                                  uint64_t v253 = *(const void **)(v242 + 32);
                                                }
                                                memmove(v252, v253, v246);
                                              }
                                              v252[v246] = 0;
                                              v254 = std::string::append(&v542, "/", 1uLL);
                                              std::string::size_type v255 = v254->__r_.__value_.__r.__words[0];
                                              *(void *)v541 = v254->__r_.__value_.__l.__size_;
                                              *(void *)&v541[7] = *(std::string::size_type *)((char *)&v254->__r_.__value_.__r.__words[1]
                                                                                              + 7);
                                              char v256 = HIBYTE(v254->__r_.__value_.__r.__words[2]);
                                              v254->__r_.__value_.__l.__size_ = 0;
                                              v254->__r_.__value_.__r.__words[2] = 0;
                                              v254->__r_.__value_.__r.__words[0] = 0;
                                              v257 = operator new(0x28uLL);
                                              uint64_t v258 = *(void *)v541;
                                              v257[2] = v255;
                                              v257[3] = v258;
                                              *(void *)((char *)v257 + 31) = *(void *)&v541[7];
                                              *((unsigned char *)v257 + 39) = v256;
                                              v259 = v522;
                                              void *v257 = v522;
                                              v257[1] = &v522;
                                              v259[1] = v257;
                                              v522 = (void **)v257;
                                              v524 = (CommandBase *)((char *)v524 + 1);
                                              if (SHIBYTE(v542.__r_.__value_.__r.__words[2]) < 0) {
                                                operator delete(v542.__r_.__value_.__l.__data_);
                                              }
                                              uint64_t v260 = *(std::string **)(v242 + 8);
                                              if (v260)
                                              {
                                                do
                                                {
                                                  v261 = v260;
                                                  uint64_t v260 = (std::string *)v260->__r_.__value_.__r.__words[0];
                                                }
                                                while (v260);
                                              }
                                              else
                                              {
                                                do
                                                {
                                                  v261 = *(std::string **)(v242 + 16);
                                                  BOOL v372 = v261->__r_.__value_.__r.__words[0] == v242;
                                                  std::string::size_type v242 = (std::string::size_type)v261;
                                                }
                                                while (!v372);
                                              }
                                              std::string::size_type v242 = (std::string::size_type)v261;
                                            }
                                            while (v261 != (std::string *)&v529.__r_.__value_.__r.__words[1]);
                                          }
                                          sub_10000E6C8((uint64_t)&v529, v529.__r_.__value_.__l.__size_);
                                        }
                                        else
                                        {
                                          if (v197 < v209) {
                                            goto LABEL_453;
                                          }
LABEL_437:
                                          rl_completion_append_character = 32;
                                          (*(void (**)(std::string *__return_ptr))(*(void *)v504 + 48))(&v529);
                                          for (std::string::size_type i = v529.__r_.__value_.__l.__size_;
                                                (std::string *)i != &v529;
                                                std::string::size_type i = *(void *)(i + 8))
                                          {
                                            v216 = operator new(0x28uLL);
                                            v217 = v216 + 2;
                                            void *v216 = 0;
                                            v216[1] = 0;
                                            if (*(char *)(i + 39) < 0)
                                            {
                                              sub_1000035FC(v217, *(void **)(i + 16), *(void *)(i + 24));
                                            }
                                            else
                                            {
                                              long long v214 = *(_OWORD *)(i + 16);
                                              v216[4] = *(void *)(i + 32);
                                              *(_OWORD *)v217 = v214;
                                            }
                                            long long v215 = v522;
                                            void *v216 = v522;
                                            v216[1] = &v522;
                                            v215[1] = v216;
                                            v522 = (void **)v216;
                                            v524 = (CommandBase *)((char *)v524 + 1);
                                          }
                                          if (v529.__r_.__value_.__r.__words[2])
                                          {
                                            std::string::size_type v219 = v529.__r_.__value_.__l.__size_;
                                            std::string::size_type v218 = v529.__r_.__value_.__r.__words[0];
                                            uint64_t v220 = *(void *)v529.__r_.__value_.__l.__size_;
                                            *(void *)(v220 + 8) = *(void *)(v529.__r_.__value_.__r.__words[0] + 8);
                                            **(void **)(v218 + 8) = v220;
                                            v529.__r_.__value_.__r.__words[2] = 0;
                                            if ((std::string *)v219 != &v529)
                                            {
                                              do
                                              {
                                                v221 = *(std::string **)(v219 + 8);
                                                if (*(char *)(v219 + 39) < 0) {
                                                  operator delete(*(void **)(v219 + 16));
                                                }
                                                operator delete((void *)v219);
                                                std::string::size_type v219 = (std::string::size_type)v221;
                                              }
                                              while (v221 != &v529);
                                            }
                                          }
                                        }
                                        sub_10000E644((uint64_t)v530, (char *)v530[1]);
                                        if (SHIBYTE(v531.__r_.__value_.__r.__words[2]) < 0)
                                        {
                                          operator delete(v531.__r_.__value_.__l.__data_);
                                          if (SHIBYTE(v532.__r_.__value_.__r.__words[2]) < 0) {
                                            goto LABEL_525;
                                          }
LABEL_522:
                                          uint64_t v262 = v527;
                                          if (v527)
                                          {
LABEL_526:
                                            if (!atomic_fetch_add(&v262->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                                            {
                                              ((void (*)(std::__shared_weak_count *))v262->__on_zero_shared)(v262);
                                              std::__shared_weak_count::__release_weak(v262);
                                            }
                                          }
                                        }
                                        else
                                        {
                                          if ((SHIBYTE(v532.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
                                            goto LABEL_522;
                                          }
LABEL_525:
                                          operator delete(v532.__r_.__value_.__l.__data_);
                                          uint64_t v262 = v527;
                                          if (v527) {
                                            goto LABEL_526;
                                          }
                                        }
                                        if (!v515) {
                                          goto LABEL_716;
                                        }
                                        uint64_t v263 = v513;
                                        v264 = (char **)v514;
                                        uint64_t v265 = *(void *)v514;
                                        *(void *)(v265 + 8) = *((void *)v513 + 1);
                                        **((void **)v263 + 1) = v265;
                                        unint64_t v515 = 0;
                                        if (v264 == &v513) {
                                          goto LABEL_716;
                                        }
                                        do
                                        {
                                          v266 = v264[1];
                                          if (*((char *)v264 + 39) < 0) {
                                            operator delete(v264[2]);
                                          }
                                          operator delete(v264);
                                          v264 = (char **)v266;
                                        }
                                        while (v266 != (char *)&v513);
                                        unint64_t v96 = v515;
                                        goto LABEL_535;
                                      }
                                    }
                                  }
                                  size_t v170 = (std::__shared_weak_count *)*((void *)v143 + 4);
                                  if (v170)
                                  {
                                    uint64_t v171 = *((void *)v143 + 3);
                                    atomic_fetch_add_explicit(&v170->__shared_weak_owners_, 1uLL, memory_order_relaxed);
                                    int v172 = std::__shared_weak_count::lock(v170);
                                    if (!v172) {
                                      goto LABEL_368;
                                    }
                                    v173 = v172;
                                    if (!atomic_fetch_add(&v172->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                                    {
                                      ((void (*)(std::__shared_weak_count *))v172->__on_zero_shared)(v172);
                                      std::__shared_weak_count::__release_weak(v173);
                                    }
                                    std::__shared_weak_count::__release_weak(v170);
                                    if (v171)
                                    {
                                      size_t v170 = (std::__shared_weak_count *)*((void *)v526 + 4);
                                      if (v170)
                                      {
                                        size_t v174 = (CommandBase *)*((void *)v526 + 3);
                                        atomic_fetch_add_explicit(&v170->__shared_weak_owners_, 1uLL, memory_order_relaxed);
                                        size_t v175 = std::__shared_weak_count::lock(v170);
                                        if (v175) {
                                          int v176 = v174;
                                        }
                                        else {
                                          int v176 = 0;
                                        }
                                      }
                                      else
                                      {
                                        size_t v175 = 0;
                                        int v176 = 0;
                                      }
                                      int v180 = v527;
                                      v526 = v176;
                                      v527 = v175;
                                      if (v180 && !atomic_fetch_add(&v180->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                                      {
                                        ((void (*)(std::__shared_weak_count *))v180->__on_zero_shared)(v180);
                                        std::__shared_weak_count::__release_weak(v180);
                                      }
                                      if (v170) {
LABEL_368:
                                      }
                                        std::__shared_weak_count::__release_weak(v170);
                                    }
                                  }
LABEL_369:
                                  int v181 = SHIBYTE(v532.__r_.__value_.__r.__words[2]);
                                  if ((v532.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                                    size_t v182 = HIBYTE(v532.__r_.__value_.__r.__words[2]);
                                  }
                                  else {
                                    size_t v182 = v532.__r_.__value_.__l.__size_;
                                  }
                                  unint64_t v183 = v182 + 1;
                                  memset(v525, 170, sizeof(v525));
                                  if (v182 + 1 > 0x7FFFFFFFFFFFFFF7) {
                                    sub_100003540();
                                  }
                                  if (v183 >= 0x17) {
                                    break;
                                  }
                                  memset(v525, 0, sizeof(v525));
                                  int v184 = (CommandBase *)v525;
                                  HIBYTE(v525[2]) = v182 + 1;
                                  if (v182) {
                                    goto LABEL_379;
                                  }
LABEL_383:
                                  *(_WORD *)((char *)v184 + v182) = 47;
                                  if (SHIBYTE(v525[2]) >= 0) {
                                    uint64_t v188 = v525;
                                  }
                                  else {
                                    uint64_t v188 = (CommandBase **)v525[0];
                                  }
                                  if (SHIBYTE(v525[2]) >= 0) {
                                    std::string::size_type v189 = HIBYTE(v525[2]);
                                  }
                                  else {
                                    std::string::size_type v189 = (std::string::size_type)v525[1];
                                  }
                                  std::string::append(&v531, (const std::string::value_type *)v188, v189);
                                  if (SHIBYTE(v525[2]) < 0) {
                                    operator delete(v525[0]);
                                  }
                                  uint64_t v190 = *(void *)&v541[8];
                                  uint64_t v191 = **(void **)&v541[8];
                                  *(void *)(v191 + 8) = *(void *)(*(void *)&v541[8] + 8);
                                  **(void **)(v190 + 8) = v191;
                                  --*(void *)&v541[16];
                                  if (*(char *)(v190 + 39) < 0) {
                                    operator delete(*(void **)(v190 + 16));
                                  }
                                  operator delete((void *)v190);
                                  sub_10000E6C8((uint64_t)v528, (uint64_t)v528[1]);
                                  if (!*(void *)&v541[16]) {
                                    goto LABEL_395;
                                  }
                                }
                                uint64_t v185 = (v183 & 0xFFFFFFFFFFFFFFF8) + 8;
                                if ((v183 | 7) != 0x17) {
                                  uint64_t v185 = v183 | 7;
                                }
                                uint64_t v186 = v185 + 1;
                                int v184 = (CommandBase *)operator new(v185 + 1);
                                v525[1] = (CommandBase *)(v182 + 1);
                                v525[2] = (CommandBase *)(v186 | 0x8000000000000000);
                                v525[0] = v184;
LABEL_379:
                                if (v181 >= 0) {
                                  v187 = &v532;
                                }
                                else {
                                  v187 = (std::string *)v532.__r_.__value_.__r.__words[0];
                                }
                                memmove(v184, v187, v182);
                                goto LABEL_383;
                              }
                            }
                            memcpy(v115, v112, v114);
                            goto LABEL_247;
                          }
LABEL_233:
                          BOOL v112 = (const char *)&unk_10001EBA7;
                          goto LABEL_239;
                        }
LABEL_535:
                        if (!v96) {
                          goto LABEL_716;
                        }
                        v97 = (char *)v514;
                        LOBYTE(v98) = *((unsigned char *)v514 + 39);
LABEL_537:
                        int v267 = (char)v98;
                        uint64_t v98 = v98;
                        if ((v98 & 0x80u) != 0) {
                          uint64_t v98 = *((void *)v97 + 3);
                        }
                        if (v98 != 2) {
                          goto LABEL_544;
                        }
                        uint64_t v268 = v267 >= 0 ? v97 + 16 : (char *)*((void *)v97 + 2);
                        if (*(_WORD *)v268 != 25699) {
                          goto LABEL_544;
                        }
                        rl_attempted_completion_over = 1;
                        if (v96 < 2)
                        {
                          if (!v507)
                          {
                            unint64_t v96 = 1;
                            goto LABEL_544;
                          }
                        }
                        else if (v507)
                        {
                          goto LABEL_544;
                        }
                        uint64_t v350 = *(void *)v97;
                        *(void *)(v350 + 8) = *((void *)v97 + 1);
                        **((void **)v97 + 1) = v350;
                        unint64_t v515 = v96 - 1;
                        if (v97[39] < 0) {
                          operator delete(*((void **)v97 + 2));
                        }
                        operator delete(v97);
                        if (v524)
                        {
                          v351 = v522;
                          uint64_t v352 = v523;
                          v353 = *v523;
                          v353[1] = v522[1];
                          *(void *)v351[1] = v353;
                          v524 = 0;
                          if (v352 != &v522)
                          {
                            do
                            {
                              v355 = (void ***)v352[1];
                              if (*((char *)v352 + 39) < 0) {
                                operator delete(v352[2]);
                              }
                              operator delete(v352);
                              uint64_t v352 = v355;
                            }
                            while (v355 != &v522);
                          }
                        }
                        rl_completion_append_character = 47;
                        rl_attempted_completion_over = 1;
                        if (v515 > 1) {
                          goto LABEL_997;
                        }
                        v525[0] = 0;
                        v525[1] = 0;
                        if (qword_1000242C8)
                        {
                          uint64_t v354 = std::__shared_weak_count::lock((std::__shared_weak_count *)qword_1000242C8);
                          v525[1] = (CommandBase *)v354;
                          if (v354) {
                            v525[0] = (CommandBase *)qword_1000242C0;
                          }
                        }
                        else
                        {
                          uint64_t v354 = 0;
                        }
                        v397 = (char *)v514 + 16;
                        if (*((char *)v514 + 39) < 0)
                        {
                          if (!*((void *)v514 + 3)) {
                            goto LABEL_809;
                          }
                          v397 = (void *)*v397;
                        }
                        else if (!*((unsigned char *)v514 + 39))
                        {
                          goto LABEL_809;
                        }
                        if (*(unsigned char *)v397 == 47)
                        {
                          v398 = (CommandBase *)qword_1000242B8;
                          if (qword_1000242B8)
                          {
                            v398 = (CommandBase *)std::__shared_weak_count::lock((std::__shared_weak_count *)qword_1000242B8);
                            v399 = (CommandBase *)qword_1000242B0;
                            if (!v398) {
                              v399 = 0;
                            }
                          }
                          else
                          {
                            v399 = 0;
                          }
                          v525[0] = v399;
                          v525[1] = v398;
                          if (v354 && !atomic_fetch_add(&v354->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                          {
                            ((void (*)(std::__shared_weak_count *))v354->__on_zero_shared)(v354);
                            std::__shared_weak_count::__release_weak(v354);
                          }
                          v400 = "/";
LABEL_815:
                          memset(&v532, 170, sizeof(v532));
                          size_t v401 = strlen(v400);
                          if (v401 > 0x7FFFFFFFFFFFFFF7) {
                            sub_100003540();
                          }
                          std::string::size_type v402 = v401;
                          if (v401 >= 0x17)
                          {
                            uint64_t v404 = (v401 & 0xFFFFFFFFFFFFFFF8) + 8;
                            if ((v401 | 7) != 0x17) {
                              uint64_t v404 = v401 | 7;
                            }
                            uint64_t v405 = v404 + 1;
                            v403 = operator new(v404 + 1);
                            v532.__r_.__value_.__l.__size_ = v402;
                            v532.__r_.__value_.__r.__words[2] = v405 | 0x8000000000000000;
                            v532.__r_.__value_.__r.__words[0] = (std::string::size_type)v403;
                          }
                          else
                          {
                            *((unsigned char *)&v532.__r_.__value_.__s + 23) = v401;
                            v403 = &v532;
                            if (!v401)
                            {
LABEL_823:
                              v403[v402] = 0;
                              unint64_t v406 = v515;
                              if (!v515) {
                                goto LABEL_957;
                              }
                              memset(&v531, 170, sizeof(v531));
                              v407 = (char *)v514;
                              if (*((char *)v514 + 39) < 0)
                              {
                                sub_1000035FC(&v531, *((void **)v514 + 2), *((void *)v514 + 3));
                                v407 = (char *)v514;
                                unint64_t v406 = v515;
                              }
                              else
                              {
                                std::string v531 = *(std::string *)((char *)v514 + 16);
                              }
                              uint64_t v408 = *(void *)v407;
                              *(void *)(v408 + 8) = *((void *)v407 + 1);
                              **((void **)v407 + 1) = v408;
                              unint64_t v515 = v406 - 1;
                              if (v407[39] < 0) {
                                operator delete(*((void **)v407 + 2));
                              }
                              operator delete(v407);
                              if (SHIBYTE(v531.__r_.__value_.__r.__words[2]) < 0)
                              {
                                std::string::size_type v409 = v531.__r_.__value_.__l.__size_;
                                long long v410 = (std::string *)v531.__r_.__value_.__r.__words[0];
                              }
                              else
                              {
                                std::string::size_type v409 = HIBYTE(v531.__r_.__value_.__r.__words[2]);
                                long long v410 = &v531;
                              }
                              memset(v530, 0, 24);
                              size_t v411 = v409 + 1;
                              if ((uint64_t)(v409 + 1) < 0) {
                                sub_10000429C();
                              }
                              v412 = (char *)operator new(v409 + 1);
                              v530[0] = v412;
                              v530[2] = &v412[v411];
                              memcpy(v412, v410, v411);
                              v530[1] = &v412[v411];
                              memset(&v529, 170, sizeof(v529));
                              size_t v413 = strlen(v412);
                              if (v413 > 0x7FFFFFFFFFFFFFF7) {
                                sub_100003540();
                              }
                              std::string::size_type v414 = v413;
                              if (v413 >= 0x17)
                              {
                                uint64_t v416 = (v413 & 0xFFFFFFFFFFFFFFF8) + 8;
                                if ((v413 | 7) != 0x17) {
                                  uint64_t v416 = v413 | 7;
                                }
                                uint64_t v417 = v416 + 1;
                                v415 = operator new(v416 + 1);
                                v529.__r_.__value_.__l.__size_ = v414;
                                v529.__r_.__value_.__r.__words[2] = v417 | 0x8000000000000000;
                                v529.__r_.__value_.__r.__words[0] = (std::string::size_type)v415;
                              }
                              else
                              {
                                *((unsigned char *)&v529.__r_.__value_.__s + 23) = v413;
                                v415 = &v529;
                                if (!v413) {
                                  goto LABEL_841;
                                }
                              }
                              memcpy(v415, v412, v414);
LABEL_841:
                              *((unsigned char *)v415 + v414) = 0;
                              v542.__r_.__value_.__r.__words[0] = (std::string::size_type)&v542;
                              v542.__r_.__value_.__l.__size_ = (std::string::size_type)&v542;
                              v542.__r_.__value_.__r.__words[2] = 0;
                              if ((v529.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                                unint64_t v418 = &v529;
                              }
                              else {
                                unint64_t v418 = (std::string *)v529.__r_.__value_.__r.__words[0];
                              }
                              long long v419 = strtok((char *)v418, "/");
                              if (v419)
                              {
                                uint64_t v420 = v419;
                                do
                                {
                                  size_t v421 = strlen(v420);
                                  if (v421 > 0x7FFFFFFFFFFFFFF7) {
                                    sub_100003540();
                                  }
                                  size_t v422 = v421;
                                  if (v421 >= 0x17)
                                  {
                                    uint64_t v424 = (v421 & 0xFFFFFFFFFFFFFFF8) + 8;
                                    if ((v421 | 7) != 0x17) {
                                      uint64_t v424 = v421 | 7;
                                    }
                                    uint64_t v425 = v424 + 1;
                                    uint64_t v423 = operator new(v424 + 1);
                                    *(void *)&v541[8] = v422;
                                    *(void *)&v541[16] = v425 | 0x8000000000000000;
                                    *(void *)v541 = v423;
                                  }
                                  else
                                  {
                                    v541[23] = v421;
                                    uint64_t v423 = v541;
                                    if (!v421) {
                                      goto LABEL_854;
                                    }
                                  }
                                  memmove(v423, v420, v422);
LABEL_854:
                                  v423[v422] = 0;
                                  uint64_t v426 = operator new(0x28uLL);
                                  v426[1] = *(_OWORD *)v541;
                                  *((void *)v426 + 4) = *(void *)&v541[16];
                                  std::string::size_type v427 = v542.__r_.__value_.__r.__words[0];
                                  *(void *)uint64_t v426 = v542.__r_.__value_.__r.__words[0];
                                  *((void *)v426 + 1) = &v542;
                                  *(void *)(v427 + 8) = v426;
                                  v542.__r_.__value_.__r.__words[0] = (std::string::size_type)v426;
                                  ++v542.__r_.__value_.__r.__words[2];
                                  uint64_t v420 = strtok(0, "/");
                                }
                                while (v420);
                              }
                              if (!v542.__r_.__value_.__r.__words[2]) {
                                goto LABEL_951;
                              }
LABEL_858:
                              memset(v541, 170, sizeof(v541));
                              long long v428 = v525[0];
                              CommandBase::getSubCommandMap((void *)v525[0], (uint64_t)v541);
                              uint64_t v429 = (void *)(v542.__r_.__value_.__l.__size_ + 16);
                              uint64_t v430 = *(void *)&v541[8];
                              uint64_t v431 = *(unsigned __int8 *)(v542.__r_.__value_.__l.__size_ + 39);
                              if (!*(void *)&v541[8])
                              {
                                uint64_t v432 = *(void *)(v542.__r_.__value_.__l.__size_ + 24);
                                goto LABEL_897;
                              }
                              uint64_t v432 = *(void *)(v542.__r_.__value_.__l.__size_ + 24);
                              if ((v431 & 0x80u) == 0) {
                                long long v433 = (const void *)(v542.__r_.__value_.__l.__size_ + 16);
                              }
                              else {
                                long long v433 = *(const void **)(v542.__r_.__value_.__l.__size_ + 16);
                              }
                              if ((v431 & 0x80u) == 0) {
                                size_t v434 = *(unsigned __int8 *)(v542.__r_.__value_.__l.__size_ + 39);
                              }
                              else {
                                size_t v434 = *(void *)(v542.__r_.__value_.__l.__size_ + 24);
                              }
                              long long v435 = &v541[8];
                              long long v436 = *(uint64_t **)&v541[8];
                              while (1)
                              {
                                int v437 = *((char *)v436 + 55);
                                long long v438 = v437 >= 0 ? v436 + 4 : (uint64_t *)v436[4];
                                size_t v439 = v437 >= 0 ? *((unsigned __int8 *)v436 + 55) : v436[5];
                                size_t v440 = v434 >= v439 ? v439 : v434;
                                int v441 = memcmp(v438, v433, v440);
                                if (v441) {
                                  break;
                                }
                                if (v439 < v434)
                                {
LABEL_866:
                                  long long v436 = (uint64_t *)v436[1];
                                  if (!v436) {
                                    goto LABEL_881;
                                  }
                                }
                                else
                                {
LABEL_880:
                                  long long v435 = v436;
                                  long long v436 = (uint64_t *)*v436;
                                  if (!v436)
                                  {
LABEL_881:
                                    if (v435 != &v541[8])
                                    {
                                      long long v444 = (size_t *)*((void *)v435 + 4);
                                      long long v443 = (size_t *)(v435 + 32);
                                      long long v442 = v444;
                                      int v445 = *((char *)v443 + 23);
                                      if (v445 >= 0) {
                                        long long v446 = v443;
                                      }
                                      else {
                                        long long v446 = v442;
                                      }
                                      if (v445 >= 0) {
                                        size_t v447 = *((unsigned __int8 *)v443 + 23);
                                      }
                                      else {
                                        size_t v447 = v443[1];
                                      }
                                      if (v447 >= v434) {
                                        size_t v448 = v434;
                                      }
                                      else {
                                        size_t v448 = v447;
                                      }
                                      int v449 = memcmp(v433, v446, v448);
                                      if (v449)
                                      {
                                        if (v449 < 0) {
                                          goto LABEL_897;
                                        }
                                      }
                                      else if (v434 < v447)
                                      {
                                        goto LABEL_897;
                                      }
                                      v528[0] = v429;
                                      v459 = sub_10000E4B4((uint64_t **)v541, (const void **)v429, (uint64_t)&std::piecewise_construct, (long long **)v528);
                                      v461 = (CommandBase *)v459[7];
                                      v460 = v459[8];
                                      if (v460) {
                                        atomic_fetch_add_explicit(v460 + 1, 1uLL, memory_order_relaxed);
                                      }
                                      v452 = (std::__shared_weak_count *)v525[1];
                                      v525[0] = v461;
                                      v525[1] = (CommandBase *)v460;
                                      if (v452 && !atomic_fetch_add(&v452->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                                      {
                                        ((void (*)(std::__shared_weak_count *))v452->__on_zero_shared)(v452);
                                        goto LABEL_924;
                                      }
                                      goto LABEL_925;
                                    }
LABEL_897:
                                    if ((v431 & 0x80u) == 0) {
                                      uint64_t v450 = v431;
                                    }
                                    else {
                                      uint64_t v450 = v432;
                                    }
                                    if (v450 == 2)
                                    {
                                      v451 = (v431 & 0x80u) == 0 ? v429 : (_WORD *)*v429;
                                      if (*v451 == 11822)
                                      {
                                        v452 = (std::__shared_weak_count *)*((void *)v428 + 4);
                                        if (v452)
                                        {
                                          uint64_t v453 = *((void *)v428 + 3);
                                          atomic_fetch_add_explicit(&v452->__shared_weak_owners_, 1uLL, memory_order_relaxed);
                                          v454 = std::__shared_weak_count::lock(v452);
                                          if (!v454) {
                                            goto LABEL_924;
                                          }
                                          v455 = v454;
                                          if (!atomic_fetch_add(&v454->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                                          {
                                            ((void (*)(std::__shared_weak_count *))v454->__on_zero_shared)(v454);
                                            std::__shared_weak_count::__release_weak(v455);
                                          }
                                          std::__shared_weak_count::__release_weak(v452);
                                          if (v453)
                                          {
                                            v452 = (std::__shared_weak_count *)*((void *)v525[0] + 4);
                                            if (v452)
                                            {
                                              v456 = (CommandBase *)*((void *)v525[0] + 3);
                                              atomic_fetch_add_explicit(&v452->__shared_weak_owners_, 1uLL, memory_order_relaxed);
                                              v457 = (CommandBase *)std::__shared_weak_count::lock(v452);
                                              if (v457) {
                                                v458 = v456;
                                              }
                                              else {
                                                v458 = 0;
                                              }
                                            }
                                            else
                                            {
                                              v458 = 0;
                                              v457 = 0;
                                            }
                                            v462 = (std::__shared_weak_count *)v525[1];
                                            v525[0] = v458;
                                            v525[1] = v457;
                                            if (v462
                                              && !atomic_fetch_add(&v462->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                                            {
                                              ((void (*)(std::__shared_weak_count *))v462->__on_zero_shared)(v462);
                                              std::__shared_weak_count::__release_weak(v462);
                                            }
                                            if (v452) {
LABEL_924:
                                            }
                                              std::__shared_weak_count::__release_weak(v452);
                                          }
                                        }
LABEL_925:
                                        std::string::size_type v463 = v542.__r_.__value_.__l.__size_;
                                        int v464 = *(char *)(v542.__r_.__value_.__l.__size_ + 39);
                                        if (v464 >= 0) {
                                          size_t v465 = *(unsigned __int8 *)(v542.__r_.__value_.__l.__size_ + 39);
                                        }
                                        else {
                                          size_t v465 = *(void *)(v542.__r_.__value_.__l.__size_ + 24);
                                        }
                                        unint64_t v466 = v465 + 1;
                                        memset(v528, 170, sizeof(v528));
                                        if (v465 + 1 > 0x7FFFFFFFFFFFFFF7) {
                                          sub_100003540();
                                        }
                                        if (v466 >= 0x17)
                                        {
                                          uint64_t v468 = (v466 & 0xFFFFFFFFFFFFFFF8) + 8;
                                          if ((v466 | 7) != 0x17) {
                                            uint64_t v468 = v466 | 7;
                                          }
                                          uint64_t v469 = v468 + 1;
                                          v467 = (char *)operator new(v468 + 1);
                                          v528[1] = (void *)(v465 + 1);
                                          v528[2] = (void *)(v469 | 0x8000000000000000);
                                          v528[0] = v467;
                                        }
                                        else
                                        {
                                          memset(v528, 0, sizeof(v528));
                                          v467 = (char *)v528;
                                          HIBYTE(v528[2]) = v465 + 1;
                                          if (!v465) {
                                            goto LABEL_939;
                                          }
                                        }
                                        if (v464 >= 0) {
                                          v470 = (const void *)(v463 + 16);
                                        }
                                        else {
                                          v470 = *(const void **)(v463 + 16);
                                        }
                                        memmove(v467, v470, v465);
LABEL_939:
                                        *(_WORD *)&v467[v465] = 47;
                                        if (SHIBYTE(v528[2]) >= 0) {
                                          v471 = v528;
                                        }
                                        else {
                                          v471 = (void **)v528[0];
                                        }
                                        if (SHIBYTE(v528[2]) >= 0) {
                                          std::string::size_type v472 = HIBYTE(v528[2]);
                                        }
                                        else {
                                          std::string::size_type v472 = (std::string::size_type)v528[1];
                                        }
                                        std::string::append(&v532, (const std::string::value_type *)v471, v472);
                                        if (SHIBYTE(v528[2]) < 0) {
                                          operator delete(v528[0]);
                                        }
                                        std::string::size_type v473 = v542.__r_.__value_.__l.__size_;
                                        uint64_t v474 = *(void *)v542.__r_.__value_.__l.__size_;
                                        *(void *)(v474 + 8) = *(void *)(v542.__r_.__value_.__l.__size_ + 8);
                                        **(void **)(v473 + 8) = v474;
                                        --v542.__r_.__value_.__r.__words[2];
                                        if (*(char *)(v473 + 39) < 0) {
                                          operator delete(*(void **)(v473 + 16));
                                        }
                                        operator delete((void *)v473);
                                        sub_10000E6C8((uint64_t)v541, *(uint64_t *)&v541[8]);
                                        if (!v542.__r_.__value_.__r.__words[2]) {
                                          goto LABEL_951;
                                        }
                                        goto LABEL_858;
                                      }
                                    }
                                    sub_10000E6C8((uint64_t)v541, v430);
                                    if (v542.__r_.__value_.__r.__words[2])
                                    {
                                      std::string::size_type v476 = v542.__r_.__value_.__l.__size_;
                                      std::string::size_type v475 = v542.__r_.__value_.__r.__words[0];
                                      uint64_t v477 = *(void *)v542.__r_.__value_.__l.__size_;
                                      *(void *)(v477 + 8) = *(void *)(v542.__r_.__value_.__r.__words[0] + 8);
                                      **(void **)(v475 + 8) = v477;
                                      v542.__r_.__value_.__r.__words[2] = 0;
                                      if ((std::string *)v476 != &v542)
                                      {
                                        do
                                        {
                                          v497 = *(std::string **)(v476 + 8);
                                          if (*(char *)(v476 + 39) < 0) {
                                            operator delete(*(void **)(v476 + 16));
                                          }
                                          operator delete((void *)v476);
                                          std::string::size_type v476 = (std::string::size_type)v497;
                                        }
                                        while (v497 != &v542);
                                      }
                                    }
LABEL_951:
                                    if (SHIBYTE(v529.__r_.__value_.__r.__words[2]) < 0) {
                                      operator delete(v529.__r_.__value_.__l.__data_);
                                    }
                                    if (v530[0])
                                    {
                                      v530[1] = v530[0];
                                      operator delete(v530[0]);
                                    }
                                    if (SHIBYTE(v531.__r_.__value_.__r.__words[2]) < 0) {
                                      operator delete(v531.__r_.__value_.__l.__data_);
                                    }
LABEL_957:
                                    CommandBase::getSubCommandMap((void *)v525[0], (uint64_t)&v531);
                                    std::string::size_type v478 = v531.__r_.__value_.__r.__words[0];
                                    p_size_t size = &v531.__r_.__value_.__l.__size_;
                                    if ((std::string::size_type *)v531.__r_.__value_.__l.__data_ != &v531.__r_.__value_.__r.__words[1])
                                    {
                                      std::string::size_type v503 = v532.__r_.__value_.__r.__words[0];
                                      v480 = v522;
                                      v481 = v524;
                                      do
                                      {
                                        int v482 = SHIBYTE(v532.__r_.__value_.__r.__words[2]);
                                        if ((v532.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                                          size_t v483 = HIBYTE(v532.__r_.__value_.__r.__words[2]);
                                        }
                                        else {
                                          size_t v483 = v532.__r_.__value_.__l.__size_;
                                        }
                                        int v484 = *(char *)(v478 + 55);
                                        if (v484 >= 0) {
                                          size_t v485 = *(unsigned __int8 *)(v478 + 55);
                                        }
                                        else {
                                          size_t v485 = *(void *)(v478 + 40);
                                        }
                                        unint64_t v486 = v485 + v483;
                                        memset(v530, 170, 24);
                                        if (v485 + v483 > 0x7FFFFFFFFFFFFFF7) {
                                          sub_100003540();
                                        }
                                        v506 = v481;
                                        if (v486 > 0x16)
                                        {
                                          v488 = p_size;
                                          uint64_t v489 = (v486 & 0xFFFFFFFFFFFFFFF8) + 8;
                                          if ((v486 | 7) != 0x17) {
                                            uint64_t v489 = v486 | 7;
                                          }
                                          uint64_t v490 = v489 + 1;
                                          v487 = (char *)operator new(v489 + 1);
                                          v530[1] = (void *)(v485 + v483);
                                          v530[2] = (void *)(v490 | 0x8000000000000000);
                                          v530[0] = v487;
                                          p_size_t size = v488;
                                        }
                                        else
                                        {
                                          memset(v530, 0, 24);
                                          v487 = (char *)v530;
                                          HIBYTE(v530[2]) = v485 + v483;
                                        }
                                        if (v483)
                                        {
                                          if (v482 >= 0) {
                                            v491 = &v532;
                                          }
                                          else {
                                            v491 = (std::string *)v503;
                                          }
                                          memmove(v487, v491, v483);
                                        }
                                        v492 = &v487[v483];
                                        if (v485)
                                        {
                                          if (v484 >= 0) {
                                            v493 = (const void *)(v478 + 32);
                                          }
                                          else {
                                            v493 = *(const void **)(v478 + 32);
                                          }
                                          memmove(v492, v493, v485);
                                        }
                                        v492[v485] = 0;
                                        v494 = (void **)operator new(0x28uLL);
                                        *((_OWORD *)v494 + 1) = *(_OWORD *)v530;
                                        v494[4] = v530[2];
                                        *v494 = v480;
                                        v494[1] = &v522;
                                        v480[1] = v494;
                                        v481 = (CommandBase *)((char *)v506 + 1);
                                        v522 = v494;
                                        v524 = (CommandBase *)((char *)v506 + 1);
                                        v495 = *(std::string::size_type **)(v478 + 8);
                                        if (v495)
                                        {
                                          do
                                          {
                                            v496 = v495;
                                            v495 = (std::string::size_type *)*v495;
                                          }
                                          while (v495);
                                        }
                                        else
                                        {
                                          do
                                          {
                                            v496 = *(std::string::size_type **)(v478 + 16);
                                            BOOL v372 = *v496 == v478;
                                            std::string::size_type v478 = (std::string::size_type)v496;
                                          }
                                          while (!v372);
                                        }
                                        v480 = v494;
                                        std::string::size_type v478 = (std::string::size_type)v496;
                                      }
                                      while (v496 != p_size);
                                    }
                                    sub_10000E6C8((uint64_t)&v531, v531.__r_.__value_.__l.__size_);
                                    if (SHIBYTE(v532.__r_.__value_.__r.__words[2]) < 0) {
                                      operator delete(v532.__r_.__value_.__l.__data_);
                                    }
                                    v498 = (std::__shared_weak_count *)v525[1];
                                    long long v62 = &OsLogStream__metaData;
                                    if (v525[1]
                                      && !atomic_fetch_add((atomic_ullong *volatile)v525[1] + 1, 0xFFFFFFFFFFFFFFFFLL))
                                    {
                                      ((void (*)(std::__shared_weak_count *))v498->__on_zero_shared)(v498);
                                      std::__shared_weak_count::__release_weak(v498);
                                    }
                                    if (!v515) {
                                      goto LABEL_716;
                                    }
LABEL_997:
                                    v499 = v513;
                                    v500 = (char **)v514;
                                    uint64_t v501 = *(void *)v514;
                                    *(void *)(v501 + 8) = *((void *)v513 + 1);
                                    **((void **)v499 + 1) = v501;
                                    unint64_t v515 = 0;
                                    if (v500 == &v513) {
                                      goto LABEL_716;
                                    }
                                    do
                                    {
                                      v502 = v500[1];
                                      if (*((char *)v500 + 39) < 0) {
                                        operator delete(v500[2]);
                                      }
                                      operator delete(v500);
                                      v500 = (char **)v502;
                                    }
                                    while (v502 != (char *)&v513);
                                    unint64_t v96 = v515;
LABEL_544:
                                    int v269 = v507;
                                    if (v96 != 1) {
                                      int v269 = 1;
                                    }
                                    if (!v96 || !v269) {
                                      goto LABEL_716;
                                    }
                                    while (2)
                                    {
                                      if (v524)
                                      {
                                        v270 = v522;
                                        uint64_t v271 = v523;
                                        uint64_t v272 = *v523;
                                        v272[1] = v522[1];
                                        *(void *)v270[1] = v272;
                                        v524 = 0;
                                        if (v271 != &v522)
                                        {
                                          do
                                          {
                                            long long v278 = (void ***)v271[1];
                                            if (*((char *)v271 + 39) < 0) {
                                              operator delete(v271[2]);
                                            }
                                            operator delete(v271);
                                            uint64_t v271 = v278;
                                          }
                                          while (v278 != &v522);
                                        }
                                      }
                                      v273 = (void *)v520;
                                      *(_OWORD *)&v532.__r_.__value_.__r.__words[1] = 0uLL;
                                      v532.__r_.__value_.__r.__words[0] = (std::string::size_type)&v532.__r_.__value_.__l.__size_;
                                      uint64_t v274 = *(const void ***)(v520 + 88);
                                      v275 = (const void ***)(v520 + 96);
                                      if (v274 == (const void **)(v520 + 96)) {
                                        goto LABEL_599;
                                      }
                                      do
                                      {
                                        sub_100013B00((uint64_t **)&v532, (uint64_t *)&v532.__r_.__value_.__l.__size_, v274 + 4, (uint64_t)(v274 + 4));
                                        long long v276 = (const void **)v274[1];
                                        if (v276)
                                        {
                                          do
                                          {
                                            v277 = (const void ***)v276;
                                            long long v276 = (const void **)*v276;
                                          }
                                          while (v276);
                                        }
                                        else
                                        {
                                          do
                                          {
                                            v277 = (const void ***)v274[2];
                                            BOOL v372 = *v277 == v274;
                                            uint64_t v274 = (const void **)v277;
                                          }
                                          while (!v372);
                                        }
                                        uint64_t v274 = (const void **)v277;
                                      }
                                      while (v277 != v275);
                                      std::string::size_type v279 = v532.__r_.__value_.__l.__size_;
                                      if (!v532.__r_.__value_.__l.__size_) {
                                        goto LABEL_599;
                                      }
                                      char v280 = *((unsigned char *)v514 + 39);
                                      v505 = (CommandBase *)((char *)v514 + 16);
                                      if (v280 >= 0) {
                                        v281 = (char *)v514 + 16;
                                      }
                                      else {
                                        v281 = (char *)*((void *)v514 + 2);
                                      }
                                      if (v280 >= 0) {
                                        size_t v282 = *((unsigned __int8 *)v514 + 39);
                                      }
                                      else {
                                        size_t v282 = *((void *)v514 + 3);
                                      }
                                      v283 = (std::string *)&v532.__r_.__value_.__r.__words[1];
                                      while (2)
                                      {
                                        while (2)
                                        {
                                          int v284 = *(char *)(v279 + 55);
                                          if (v284 >= 0) {
                                            long long v285 = (const void *)(v279 + 32);
                                          }
                                          else {
                                            long long v285 = *(const void **)(v279 + 32);
                                          }
                                          if (v284 >= 0) {
                                            size_t v286 = *(unsigned __int8 *)(v279 + 55);
                                          }
                                          else {
                                            size_t v286 = *(void *)(v279 + 40);
                                          }
                                          if (v282 >= v286) {
                                            size_t v287 = v286;
                                          }
                                          else {
                                            size_t v287 = v282;
                                          }
                                          int v288 = memcmp(v285, v281, v287);
                                          if (v288)
                                          {
                                            if ((v288 & 0x80000000) == 0) {
                                              break;
                                            }
                                            goto LABEL_570;
                                          }
                                          if (v286 < v282)
                                          {
LABEL_570:
                                            std::string::size_type v279 = *(void *)(v279 + 8);
                                            if (!v279) {
                                              goto LABEL_585;
                                            }
                                            continue;
                                          }
                                          break;
                                        }
                                        v283 = (std::string *)v279;
                                        std::string::size_type v279 = *(void *)v279;
                                        if (v279) {
                                          continue;
                                        }
                                        break;
                                      }
LABEL_585:
                                      if (v283 != (std::string *)&v532.__r_.__value_.__r.__words[1])
                                      {
                                        std::string::size_type v291 = v283[1].__r_.__value_.__l.__size_;
                                        v290 = &v283[1].__r_.__value_.__l.__size_;
                                        v289 = (size_t *)v291;
                                        int v292 = *((char *)v290 + 23);
                                        if (v292 >= 0) {
                                          uint64_t v293 = v290;
                                        }
                                        else {
                                          uint64_t v293 = v289;
                                        }
                                        if (v292 >= 0) {
                                          size_t v294 = *((unsigned __int8 *)v290 + 23);
                                        }
                                        else {
                                          size_t v294 = v290[1];
                                        }
                                        if (v294 >= v282) {
                                          size_t v295 = v282;
                                        }
                                        else {
                                          size_t v295 = v294;
                                        }
                                        int v296 = memcmp(v281, v293, v295);
                                        if (v296)
                                        {
                                          if ((v296 & 0x80000000) == 0)
                                          {
LABEL_786:
                                            (*(void (**)(std::string *__return_ptr, void *, CommandBase *))(*v273 + 48))(&v531, v273, v505);
                                            for (std::string::size_type j = v531.__r_.__value_.__l.__size_;
                                                  (std::string *)j != &v531;
                                                  std::string::size_type j = *(void *)(j + 8))
                                            {
                                              int v391 = operator new(0x28uLL);
                                              v392 = v391 + 2;
                                              *int v391 = 0;
                                              v391[1] = 0;
                                              if (*(char *)(j + 39) < 0)
                                              {
                                                sub_1000035FC(v392, *(void **)(j + 16), *(void *)(j + 24));
                                              }
                                              else
                                              {
                                                long long v389 = *(_OWORD *)(j + 16);
                                                v391[4] = *(void *)(j + 32);
                                                *(_OWORD *)v392 = v389;
                                              }
                                              char v390 = v522;
                                              *int v391 = v522;
                                              v391[1] = &v522;
                                              v390[1] = v391;
                                              v522 = (void **)v391;
                                              v524 = (CommandBase *)((char *)v524 + 1);
                                            }
                                            if (v531.__r_.__value_.__r.__words[2])
                                            {
                                              std::string::size_type v394 = v531.__r_.__value_.__l.__size_;
                                              std::string::size_type v393 = v531.__r_.__value_.__r.__words[0];
                                              uint64_t v395 = *(void *)v531.__r_.__value_.__l.__size_;
                                              *(void *)(v395 + 8) = *(void *)(v531.__r_.__value_.__r.__words[0] + 8);
                                              **(void **)(v393 + 8) = v395;
                                              v531.__r_.__value_.__r.__words[2] = 0;
                                              if ((std::string *)v394 != &v531)
                                              {
                                                do
                                                {
                                                  uint64_t v396 = *(std::string **)(v394 + 8);
                                                  if (*(char *)(v394 + 39) < 0) {
                                                    operator delete(*(void **)(v394 + 16));
                                                  }
                                                  operator delete((void *)v394);
                                                  std::string::size_type v394 = (std::string::size_type)v396;
                                                }
                                                while (v396 != &v531);
                                              }
                                            }
                                            goto LABEL_715;
                                          }
                                        }
                                        else if (v282 >= v294)
                                        {
                                          goto LABEL_786;
                                        }
                                      }
LABEL_599:
                                      *(_OWORD *)&v531.__r_.__value_.__r.__words[1] = 0uLL;
                                      v531.__r_.__value_.__r.__words[0] = (std::string::size_type)&v531.__r_.__value_.__l.__size_;
                                      v297 = (const void **)v273[20];
                                      if (v297 == v273 + 21)
                                      {
                                        std::string::size_type v349 = 0;
                                        goto LABEL_714;
                                      }
                                      do
                                      {
                                        sub_100013FAC((uint64_t **)&v531, (uint64_t *)&v531.__r_.__value_.__l.__size_, v297 + 4, (uint64_t)(v297 + 4));
                                        char v298 = (const void **)v297[1];
                                        if (v298)
                                        {
                                          do
                                          {
                                            size_t v299 = (const void ***)v298;
                                            char v298 = (const void **)*v298;
                                          }
                                          while (v298);
                                        }
                                        else
                                        {
                                          do
                                          {
                                            size_t v299 = (const void ***)v297[2];
                                            BOOL v372 = *v299 == v297;
                                            v297 = (const void **)v299;
                                          }
                                          while (!v372);
                                        }
                                        v297 = (const void **)v299;
                                      }
                                      while (v299 != v273 + 21);
                                      std::string::size_type v349 = v531.__r_.__value_.__l.__size_;
                                      if (!v531.__r_.__value_.__l.__size_)
                                      {
LABEL_714:
                                        sub_10000E6C8((uint64_t)&v531, v349);
LABEL_715:
                                        sub_10000E644((uint64_t)&v532, (char *)v532.__r_.__value_.__l.__size_);
                                        break;
                                      }
                                      v300 = (char *)v514 + 16;
                                      char v301 = *((unsigned char *)v514 + 39);
                                      if (v301 >= 0) {
                                        v302 = (char *)v514 + 16;
                                      }
                                      else {
                                        v302 = (char *)*((void *)v514 + 2);
                                      }
                                      if (v301 >= 0) {
                                        size_t v303 = *((unsigned __int8 *)v514 + 39);
                                      }
                                      else {
                                        size_t v303 = *((void *)v514 + 3);
                                      }
                                      int v304 = (std::string *)&v531.__r_.__value_.__r.__words[1];
                                      std::string::size_type v305 = v531.__r_.__value_.__l.__size_;
                                      while (2)
                                      {
                                        while (2)
                                        {
                                          int v306 = *(char *)(v305 + 55);
                                          if (v306 >= 0) {
                                            int v307 = (const void *)(v305 + 32);
                                          }
                                          else {
                                            int v307 = *(const void **)(v305 + 32);
                                          }
                                          if (v306 >= 0) {
                                            size_t v308 = *(unsigned __int8 *)(v305 + 55);
                                          }
                                          else {
                                            size_t v308 = *(void *)(v305 + 40);
                                          }
                                          if (v303 >= v308) {
                                            size_t v309 = v308;
                                          }
                                          else {
                                            size_t v309 = v303;
                                          }
                                          int v310 = memcmp(v307, v302, v309);
                                          if (v310)
                                          {
                                            if ((v310 & 0x80000000) == 0) {
                                              break;
                                            }
                                            goto LABEL_616;
                                          }
                                          if (v308 < v303)
                                          {
LABEL_616:
                                            std::string::size_type v305 = *(void *)(v305 + 8);
                                            if (!v305) {
                                              goto LABEL_631;
                                            }
                                            continue;
                                          }
                                          break;
                                        }
                                        int v304 = (std::string *)v305;
                                        std::string::size_type v305 = *(void *)v305;
                                        if (v305) {
                                          continue;
                                        }
                                        break;
                                      }
LABEL_631:
                                      if (v304 == (std::string *)&v531.__r_.__value_.__r.__words[1])
                                      {
                                        long long v62 = &OsLogStream__metaData;
                                        goto LABEL_714;
                                      }
                                      std::string::size_type v313 = v304[1].__r_.__value_.__l.__size_;
                                      uint64_t v312 = &v304[1].__r_.__value_.__l.__size_;
                                      unint64_t v311 = (size_t *)v313;
                                      int v314 = *((char *)v312 + 23);
                                      if (v314 >= 0) {
                                        v315 = v312;
                                      }
                                      else {
                                        v315 = v311;
                                      }
                                      if (v314 >= 0) {
                                        size_t v316 = *((unsigned __int8 *)v312 + 23);
                                      }
                                      else {
                                        size_t v316 = v312[1];
                                      }
                                      if (v316 >= v303) {
                                        size_t v317 = v303;
                                      }
                                      else {
                                        size_t v317 = v316;
                                      }
                                      int v318 = memcmp(v302, v315, v317);
                                      long long v62 = &OsLogStream__metaData;
                                      if (v318)
                                      {
                                        if (v318 < 0) {
                                          goto LABEL_714;
                                        }
                                      }
                                      else if (v303 < v316)
                                      {
                                        goto LABEL_714;
                                      }
                                      v530[0] = v300;
                                      int64_t v319 = sub_10000E4B4((uint64_t **)&v531, (const void **)v300, (uint64_t)&std::piecewise_construct, (long long **)v530);
                                      v321 = v319[7];
                                      v320 = (std::__shared_weak_count *)v319[8];
                                      if (v320) {
                                        atomic_fetch_add_explicit(&v320->__shared_owners_, 1uLL, memory_order_relaxed);
                                      }
                                      v322 = v521;
                                      uint64_t v520 = (uint64_t)v321;
                                      v521 = v320;
                                      if (v322 && !atomic_fetch_add(&v322->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                                      {
                                        ((void (*)(std::__shared_weak_count *))v322->__on_zero_shared)(v322);
                                        std::__shared_weak_count::__release_weak(v322);
                                      }
                                      uint64_t v323 = v520;
                                      v530[1] = 0;
                                      v530[2] = 0;
                                      v530[0] = &v530[1];
                                      v324 = *(const void ***)(v520 + 88);
                                      uint64_t v325 = (const void ***)(v520 + 96);
                                      if (v324 != (const void **)(v520 + 96))
                                      {
                                        do
                                        {
                                          sub_100013B00((uint64_t **)v530, (uint64_t *)&v530[1], v324 + 4, (uint64_t)(v324 + 4));
                                          unsigned __int8 v326 = (const void **)v324[1];
                                          if (v326)
                                          {
                                            do
                                            {
                                              v327 = (const void ***)v326;
                                              unsigned __int8 v326 = (const void **)*v326;
                                            }
                                            while (v326);
                                          }
                                          else
                                          {
                                            do
                                            {
                                              v327 = (const void ***)v324[2];
                                              BOOL v372 = *v327 == v324;
                                              v324 = (const void **)v327;
                                            }
                                            while (!v372);
                                          }
                                          v324 = (const void **)v327;
                                        }
                                        while (v327 != v325);
                                        size_t v328 = (void **)v530[0];
                                        if (v530[0] != &v530[1])
                                        {
                                          do
                                          {
                                            uint64_t v333 = operator new(0x28uLL);
                                            v334 = v333 + 2;
                                            *uint64_t v333 = 0;
                                            v333[1] = 0;
                                            if (*((char *)v328 + 55) < 0)
                                            {
                                              sub_1000035FC(v334, v328[4], (unint64_t)v328[5]);
                                            }
                                            else
                                            {
                                              long long v335 = *((_OWORD *)v328 + 2);
                                              v333[4] = v328[6];
                                              *(_OWORD *)v334 = v335;
                                            }
                                            v336 = v522;
                                            *uint64_t v333 = v522;
                                            v333[1] = &v522;
                                            v336[1] = v333;
                                            v522 = (void **)v333;
                                            v524 = (CommandBase *)((char *)v524 + 1);
                                            uint64_t v337 = (void **)v328[1];
                                            if (v337)
                                            {
                                              do
                                              {
                                                v338 = v337;
                                                uint64_t v337 = (void **)*v337;
                                              }
                                              while (v337);
                                            }
                                            else
                                            {
                                              do
                                              {
                                                v338 = (void **)v328[2];
                                                BOOL v372 = *v338 == v328;
                                                size_t v328 = v338;
                                              }
                                              while (!v372);
                                            }
                                            size_t v328 = v338;
                                          }
                                          while (v338 != &v530[1]);
                                        }
                                      }
                                      sub_10000E644((uint64_t)v530, (char *)v530[1]);
                                      v530[1] = 0;
                                      v530[2] = 0;
                                      v530[0] = &v530[1];
                                      v329 = *(const void ***)(v323 + 160);
                                      int v330 = (const void **)(v323 + 168);
                                      if (v329 != v330)
                                      {
                                        do
                                        {
                                          sub_100013FAC((uint64_t **)v530, (uint64_t *)&v530[1], v329 + 4, (uint64_t)(v329 + 4));
                                          long long v331 = (const void **)v329[1];
                                          if (v331)
                                          {
                                            do
                                            {
                                              uint64_t v332 = v331;
                                              long long v331 = (const void **)*v331;
                                            }
                                            while (v331);
                                          }
                                          else
                                          {
                                            do
                                            {
                                              uint64_t v332 = (const void **)v329[2];
                                              BOOL v372 = *v332 == v329;
                                              v329 = v332;
                                            }
                                            while (!v372);
                                          }
                                          v329 = v332;
                                        }
                                        while (v332 != v330);
                                        v339 = (void **)v530[0];
                                        if (v530[0] != &v530[1])
                                        {
                                          do
                                          {
                                            v343 = operator new(0x28uLL);
                                            v344 = v343 + 2;
                                            void *v343 = 0;
                                            v343[1] = 0;
                                            if (*((char *)v339 + 55) < 0)
                                            {
                                              sub_1000035FC(v344, v339[4], (unint64_t)v339[5]);
                                            }
                                            else
                                            {
                                              long long v345 = *((_OWORD *)v339 + 2);
                                              v343[4] = v339[6];
                                              *(_OWORD *)v344 = v345;
                                            }
                                            v346 = v522;
                                            void *v343 = v522;
                                            v343[1] = &v522;
                                            v346[1] = v343;
                                            v522 = (void **)v343;
                                            v524 = (CommandBase *)((char *)v524 + 1);
                                            v347 = (void **)v339[1];
                                            if (v347)
                                            {
                                              do
                                              {
                                                v348 = v347;
                                                v347 = (void **)*v347;
                                              }
                                              while (v347);
                                            }
                                            else
                                            {
                                              do
                                              {
                                                v348 = (void **)v339[2];
                                                BOOL v372 = *v348 == v339;
                                                v339 = v348;
                                              }
                                              while (!v372);
                                            }
                                            v339 = v348;
                                          }
                                          while (v348 != &v530[1]);
                                        }
                                      }
                                      sub_10000E6C8((uint64_t)v530, (uint64_t)v530[1]);
                                      v340 = (char *)v514;
                                      uint64_t v341 = *(void *)v514;
                                      *(void *)(v341 + 8) = *((void *)v514 + 1);
                                      **((void **)v340 + 1) = v341;
                                      --v515;
                                      if (v340[39] < 0) {
                                        operator delete(*((void **)v340 + 2));
                                      }
                                      operator delete(v340);
                                      sub_10000E6C8((uint64_t)&v531, v531.__r_.__value_.__l.__size_);
                                      sub_10000E644((uint64_t)&v532, (char *)v532.__r_.__value_.__l.__size_);
                                      char v342 = v507;
                                      if (v515 != 1) {
                                        char v342 = 1;
                                      }
                                      if (v515 && (v342 & 1) != 0) {
                                        continue;
                                      }
                                      break;
                                    }
LABEL_716:
                                    memset(&v532, 170, sizeof(v532));
                                    uint64_t v356 = __s;
                                    size_t v357 = strlen(__s);
                                    if (v357 > 0x7FFFFFFFFFFFFFF7) {
                                      sub_100003540();
                                    }
                                    std::string::size_type v358 = v357;
                                    if (v357 >= 0x17)
                                    {
                                      uint64_t v360 = (v357 & 0xFFFFFFFFFFFFFFF8) + 8;
                                      if ((v357 | 7) != 0x17) {
                                        uint64_t v360 = v357 | 7;
                                      }
                                      uint64_t v361 = v360 + 1;
                                      uint64_t v359 = operator new(v360 + 1);
                                      v532.__r_.__value_.__l.__size_ = v358;
                                      v532.__r_.__value_.__r.__words[2] = v361 | 0x8000000000000000;
                                      v532.__r_.__value_.__r.__words[0] = (std::string::size_type)v359;
                                    }
                                    else
                                    {
                                      *((unsigned char *)&v532.__r_.__value_.__s + 23) = v357;
                                      uint64_t v359 = &v532;
                                      if (!v357)
                                      {
LABEL_724:
                                        v359[v358] = 0;
                                        for (k = v523; k != &v522; k = (void ***)k[1])
                                        {
                                          std::string::size_type v364 = *((unsigned __int8 *)k + 39);
                                          if (*((char *)k + 39) < 0)
                                          {
                                            std::string::size_type v365 = (std::string::size_type)k[3];
                                            std::string::size_type v366 = HIBYTE(v532.__r_.__value_.__r.__words[2]);
                                            if ((SHIBYTE(v532.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                                            {
LABEL_731:
                                              std::string::size_type v367 = v366;
                                              if (v365 < v366) {
                                                continue;
                                              }
                                              goto LABEL_735;
                                            }
                                          }
                                          else
                                          {
                                            std::string::size_type v365 = *((unsigned __int8 *)k + 39);
                                            std::string::size_type v366 = HIBYTE(v532.__r_.__value_.__r.__words[2]);
                                            if ((SHIBYTE(v532.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
                                              goto LABEL_731;
                                            }
                                          }
                                          std::string::size_type v367 = v532.__r_.__value_.__l.__size_;
                                          if (v365 < v532.__r_.__value_.__l.__size_) {
                                            continue;
                                          }
LABEL_735:
                                          if ((v364 & 0x80) != 0)
                                          {
                                            if (v367 == -1) {
LABEL_1004:
                                            }
                                              sub_1000042B4();
                                            v369 = k[2];
                                            if ((unint64_t)k[3] >= v367) {
                                              size_t v368 = v367;
                                            }
                                            else {
                                              size_t v368 = (size_t)k[3];
                                            }
                                          }
                                          else
                                          {
                                            if (v367 == -1) {
                                              goto LABEL_1004;
                                            }
                                            if (v364 >= v367) {
                                              size_t v368 = v367;
                                            }
                                            else {
                                              size_t v368 = *((unsigned __int8 *)k + 39);
                                            }
                                            v369 = (void **)(k + 2);
                                          }
                                          if ((v366 & 0x80u) == 0) {
                                            uint64_t v370 = &v532;
                                          }
                                          else {
                                            uint64_t v370 = (std::string *)v532.__r_.__value_.__r.__words[0];
                                          }
                                          int v371 = memcmp(v369, v370, v368);
                                          BOOL v372 = v368 == v367 && v371 == 0;
                                          if (v372)
                                          {
                                            uint64_t v373 = (_OWORD *)qword_1000242E0;
                                            if ((unint64_t)qword_1000242E0 >= *(void *)algn_1000242E8)
                                            {
                                              uint64_t v363 = sub_10000405C((char **)&qword_1000242D8, (uint64_t)(k + 2));
                                            }
                                            else
                                            {
                                              if ((v364 & 0x80) != 0)
                                              {
                                                sub_1000035FC((unsigned char *)qword_1000242E0, k[2], (unint64_t)k[3]);
                                              }
                                              else
                                              {
                                                long long v374 = *((_OWORD *)k + 1);
                                                *(void *)(qword_1000242E0 + 16) = k[4];
                                                *uint64_t v373 = v374;
                                              }
                                              uint64_t v363 = (char *)v373 + 24;
                                              v62[10].uint64_t ivar_lyt = (char *)v373 + 24;
                                            }
                                            v62[10].uint64_t ivar_lyt = v363;
                                          }
                                        }
                                        if ((SHIBYTE(v532.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                                        {
                                          if ((SHIBYTE(__dst[2]) & 0x80000000) == 0) {
                                            goto LABEL_760;
                                          }
LABEL_783:
                                          operator delete(__dst[0]);
                                          uint64_t v375 = __str;
                                          if (!__str) {
                                            goto LABEL_762;
                                          }
LABEL_761:
                                          v511 = v375;
                                          operator delete(v375);
                                          goto LABEL_762;
                                        }
                                        operator delete(v532.__r_.__value_.__l.__data_);
                                        if (SHIBYTE(__dst[2]) < 0) {
                                          goto LABEL_783;
                                        }
LABEL_760:
                                        uint64_t v375 = __str;
                                        if (__str) {
                                          goto LABEL_761;
                                        }
LABEL_762:
                                        if (v515)
                                        {
                                          uint64_t v376 = v513;
                                          uint64_t v377 = (char **)v514;
                                          uint64_t v378 = *(void *)v514;
                                          *(void *)(v378 + 8) = *((void *)v513 + 1);
                                          **((void **)v376 + 1) = v378;
                                          unint64_t v515 = 0;
                                          if (v377 != &v513)
                                          {
                                            do
                                            {
                                              uint64_t v381 = v377[1];
                                              if (*((char *)v377 + 39) < 0) {
                                                operator delete(v377[2]);
                                              }
                                              operator delete(v377);
                                              uint64_t v377 = (char **)v381;
                                            }
                                            while (v381 != (char *)&v513);
                                          }
                                        }
                                        uint64_t ivar_lyt = (uint64_t)v62[10].ivar_lyt;
LABEL_765:
                                        uint64_t v379 = qword_1000242D0;
                                        if (qword_1000242D0 >= 0xAAAAAAAAAAAAAAABLL
                                                              * ((ivar_lyt - qword_1000242D8) >> 3))
                                        {
                                          uint64_t v6 = 0;
                                        }
                                        else
                                        {
                                          ++qword_1000242D0;
                                          uint64_t v380 = qword_1000242D8 + 24 * v379;
                                          if (*(char *)(v380 + 23) < 0) {
                                            uint64_t v380 = *(void *)v380;
                                          }
                                          uint64_t v6 = strdup((const char *)v380);
                                        }
                                        sub_10000E6C8((uint64_t)&v516, v517[0]);
                                        sub_10000E644((uint64_t)&v518, v519[0]);
                                        uint64_t v382 = v521;
                                        if (v521 && !atomic_fetch_add(&v521->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                                        {
                                          ((void (*)(std::__shared_weak_count *))v382->__on_zero_shared)(v382);
                                          std::__shared_weak_count::__release_weak(v382);
                                        }
                                        goto LABEL_776;
                                      }
                                    }
                                    memcpy(v359, v356, v358);
                                    goto LABEL_724;
                                  }
                                }
                              }
                              if (v441 < 0) {
                                goto LABEL_866;
                              }
                              goto LABEL_880;
                            }
                          }
                          memcpy(v403, v400, v402);
                          goto LABEL_823;
                        }
LABEL_809:
                        v400 = (const char *)&unk_10001EBA7;
                        goto LABEL_815;
                      }
                    }
                    else if (HIBYTE(__dst[2]))
                    {
                      v94 = (void *)HIBYTE(__dst[2]);
                      goto LABEL_198;
                    }
                    int v507 = 0;
                    unint64_t v96 = v515;
                    if (!v515) {
                      goto LABEL_716;
                    }
                    goto LABEL_203;
                  }
                }
                memmove(v77, v71, (size_t)v76);
                goto LABEL_178;
              }
LABEL_164:
              operator delete(v67);
              int v71 = __str;
              goto LABEL_165;
            }
LABEL_152:
            operator delete(v532.__r_.__value_.__l.__data_);
            goto LABEL_100;
          }
LABEL_151:
          operator delete((void *)v533);
          if ((SHIBYTE(v532.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
            goto LABEL_100;
          }
          goto LABEL_152;
        }
        if (v18) {
          goto LABEL_95;
        }
        uint64_t v8 = &v532 + v12;
      }
      uint64_t v36 = operator new(0x28uLL);
      uint64_t v37 = v36 + 2;
      *uint64_t v36 = 0;
      v36[1] = 0;
      if (SHIBYTE(v8->__r_.__value_.__r.__words[2]) < 0)
      {
        sub_1000035FC(v37, v8->__r_.__value_.__l.__data_, v8->__r_.__value_.__l.__size_);
      }
      else
      {
        *(_OWORD *)uint64_t v37 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
        v36[4] = *((void *)&v8->__r_.__value_.__l + 2);
      }
      uint64_t v38 = v12 - 4;
      if (v12 == 4)
      {
        uint64_t v39 = 1;
        char v40 = v36;
      }
      else
      {
        uint64_t v39 = 5 - v12;
        v78 = &v532 + v12 + 1;
        int v79 = v36;
        do
        {
          size_t v81 = v78;
          char v40 = operator new(0x28uLL);
          *char v40 = v79;
          v40[1] = 0;
          size_t v82 = v40 + 2;
          if (SHIBYTE(v8[1].__r_.__value_.__r.__words[2]) < 0)
          {
            sub_1000035FC(v82, v81->__r_.__value_.__l.__data_, v8[1].__r_.__value_.__l.__size_);
          }
          else
          {
            *(_OWORD *)size_t v82 = *(_OWORD *)&v81->__r_.__value_.__l.__data_;
            v40[4] = *((void *)&v81->__r_.__value_.__l + 2);
          }
          v79[1] = v40;
          v78 = v81 + 1;
          uint64_t v8 = v81;
          int v79 = v40;
        }
        while (!__CFADD__(v38++, 1));
      }
      v41 = v522;
      v522[1] = v36;
      *uint64_t v36 = v41;
      v40[1] = &v522;
      v522 = (void **)v40;
      v524 = (CommandBase *)((char *)v524 + v39);
      goto LABEL_95;
    }
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v5);
    if (v6) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
LABEL_776:
  if (v524)
  {
    uint64_t v383 = v522;
    v384 = v523;
    v385 = *v523;
    v385[1] = v522[1];
    *(void *)v383[1] = v385;
    v524 = 0;
    if (v384 != &v522)
    {
      do
      {
        int v387 = (void ***)v384[1];
        if (*((char *)v384 + 39) < 0) {
          operator delete(v384[2]);
        }
        operator delete(v384);
        v384 = v387;
      }
      while (v387 != &v522);
    }
  }
  return v6;
}

void sub_10000DE3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,void *a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,void *a42,uint64_t a43,uint64_t a44,void *a45,uint64_t a46,uint64_t a47,void *a48,uint64_t a49,uint64_t a50,uint64_t a51,void *a52,uint64_t a53,uint64_t a54,uint64_t a55,void *__p,uint64_t a57,int a58,__int16 a59,char a60,char a61)
{
  if (a61 < 0) {
    operator delete(__p);
  }
  sub_10000340C((uint64_t)&a36);
  if (a18 < 0)
  {
    operator delete(a13);
    long long v62 = a19;
    if (!a19)
    {
LABEL_8:
      sub_100005930(&a22);
      sub_10000E6C8((uint64_t)&a25, a26);
      sub_10000E644((uint64_t)&a28, (char *)a29);
      sub_10000340C((uint64_t)&a31);
      sub_100005930(&a33);
      _Unwind_Resume(a1);
    }
  }
  else
  {
    long long v62 = a19;
    if (!a19) {
      goto LABEL_8;
    }
  }
  operator delete(v62);
  goto LABEL_8;
}

void sub_10000E328(uint64_t a1, int a2)
{
  if (a2) {
    JUMPOUT(0x10000E330);
  }
  JUMPOUT(0x10000E4A4);
}

void sub_10000E36C()
{
}

void sub_10000E3EC(void *a1, int a2)
{
  if (a2) {
    sub_1000035E8(a1);
  }
  JUMPOUT(0x10000E4A4);
}

void sub_10000E424()
{
}

void sub_10000E430()
{
}

void sub_10000E4AC()
{
}

uint64_t **sub_10000E4B4(uint64_t **a1, const void **a2, uint64_t a3, long long **a4)
{
  uint64_t v7 = a1 + 1;
  uint64_t v6 = a1[1];
  if (v6)
  {
    int v8 = *((char *)a2 + 23);
    if (v8 >= 0) {
      uint64_t v9 = a2;
    }
    else {
      uint64_t v9 = *a2;
    }
    if (v8 >= 0) {
      size_t v10 = *((unsigned __int8 *)a2 + 23);
    }
    else {
      size_t v10 = (size_t)a2[1];
    }
    while (1)
    {
      std::string::size_type v11 = (uint64_t **)v6;
      uint64_t v14 = (const void *)v6[4];
      uint64_t v12 = v6 + 4;
      int v13 = v14;
      int v15 = *((char *)v12 + 23);
      if (v15 >= 0) {
        uint64_t v16 = v12;
      }
      else {
        uint64_t v16 = v13;
      }
      if (v15 >= 0) {
        size_t v17 = *((unsigned __int8 *)v12 + 23);
      }
      else {
        size_t v17 = v12[1];
      }
      if (v17 >= v10) {
        size_t v18 = v10;
      }
      else {
        size_t v18 = v17;
      }
      int v19 = memcmp(v9, v16, v18);
      if (v19)
      {
        if (v19 < 0) {
          goto LABEL_8;
        }
LABEL_22:
        int v20 = memcmp(v16, v9, v18);
        if (v20)
        {
          if ((v20 & 0x80000000) == 0) {
            return v11;
          }
        }
        else if (v17 >= v10)
        {
          return v11;
        }
        uint64_t v6 = v11[1];
        if (!v6)
        {
          uint64_t v7 = v11 + 1;
          goto LABEL_29;
        }
      }
      else
      {
        if (v10 >= v17) {
          goto LABEL_22;
        }
LABEL_8:
        uint64_t v6 = *v11;
        uint64_t v7 = v11;
        if (!*v11) {
          goto LABEL_29;
        }
      }
    }
  }
  std::string::size_type v11 = a1 + 1;
LABEL_29:
  uint64_t v21 = operator new(0x48uLL);
  long long v22 = v21 + 4;
  v23 = *a4;
  if (*((char *)*a4 + 23) < 0)
  {
    sub_1000035FC(v22, *(void **)v23, *((void *)v23 + 1));
  }
  else
  {
    long long v24 = *v23;
    v21[6] = *((void *)v23 + 2);
    *(_OWORD *)long long v22 = v24;
  }
  v21[7] = 0;
  v21[8] = 0;
  *uint64_t v21 = 0;
  v21[1] = 0;
  v21[2] = v11;
  *uint64_t v7 = v21;
  unint64_t v25 = (uint64_t *)**a1;
  long long v26 = v21;
  if (v25)
  {
    *a1 = v25;
    long long v26 = *v7;
  }
  sub_100004AB0(a1[1], v26);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return (uint64_t **)v21;
}

void sub_10000E630(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_10000E644(uint64_t a1, char *a2)
{
  if (a2)
  {
    sub_10000E644(a1, *(void *)a2);
    sub_10000E644(a1, *((void *)a2 + 1));
    if (a2[55] < 0)
    {
      operator delete(*((void **)a2 + 4));
      uint64_t v4 = a2;
    }
    else
    {
      uint64_t v4 = a2;
    }
    operator delete(v4);
  }
}

void sub_10000E6C8(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_10000E6C8(a1, *(void *)a2);
    sub_10000E6C8(a1, *(void *)(a2 + 8));
    uint64_t v4 = *(std::__shared_weak_count **)(a2 + 64);
    if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
      if ((*(char *)(a2 + 55) & 0x80000000) == 0)
      {
LABEL_5:
        uint64_t v5 = (void *)a2;
LABEL_7:
        operator delete(v5);
        return;
      }
    }
    else if ((*(char *)(a2 + 55) & 0x80000000) == 0)
    {
      goto LABEL_5;
    }
    operator delete(*(void **)(a2 + 32));
    uint64_t v5 = (void *)a2;
    goto LABEL_7;
  }
}

void **sub_10000E79C(void **__dst, void *__src, size_t __len)
{
  LODWORD(v6) = *((char *)__dst + 23);
  if ((v6 & 0x80000000) != 0)
  {
    unint64_t v10 = (unint64_t)__dst[2];
    unint64_t v8 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (__len > v8)
    {
      size_t v11 = 0x7FFFFFFFFFFFFFF7;
      if (0x7FFFFFFFFFFFFFF7 - (v10 & 0x7FFFFFFFFFFFFFFFLL) >= __len - v8)
      {
        uint64_t v9 = *__dst;
        if (v8 > 0x3FFFFFFFFFFFFFF2)
        {
LABEL_15:
          uint64_t v7 = operator new(v11);
          memcpy(v7, __src, __len);
          if (v8 != 22) {
            operator delete(v9);
          }
          __dst[2] = (void *)(v11 | 0x8000000000000000);
          *long long __dst = v7;
LABEL_23:
          __dst[1] = (void *)__len;
          goto LABEL_24;
        }
LABEL_8:
        unint64_t v12 = 2 * v8;
        if (__len > 2 * v8) {
          unint64_t v12 = __len;
        }
        uint64_t v13 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v12 | 7) != 0x17) {
          uint64_t v13 = v12 | 7;
        }
        if (v12 >= 0x17) {
          size_t v11 = v13 + 1;
        }
        else {
          size_t v11 = 23;
        }
        goto LABEL_15;
      }
LABEL_25:
      sub_100003540();
    }
    unint64_t v6 = HIBYTE(v10);
    uint64_t v7 = *__dst;
  }
  else
  {
    uint64_t v7 = __dst;
    if (__len > 0x16)
    {
      if (__len - 0x7FFFFFFFFFFFFFF7 >= 0x800000000000001FLL)
      {
        unint64_t v8 = 22;
        uint64_t v9 = __dst;
        goto LABEL_8;
      }
      goto LABEL_25;
    }
  }
  if (__len)
  {
    memmove(v7, __src, __len);
    LOBYTE(v6) = *((unsigned char *)__dst + 23);
  }
  if ((v6 & 0x80) != 0) {
    goto LABEL_23;
  }
  *((unsigned char *)__dst + 23) = __len & 0x7F;
LABEL_24:
  *((unsigned char *)v7 + __len) = 0;
  return __dst;
}

void **sub_10000E8FC(void **a1, char *__s)
{
  size_t v4 = strlen(__s);

  return sub_10000E79C(a1, __s, v4);
}

std::string *sub_10000E944(uint64_t a1)
{
  *(void *)(a1 + 88) = 0;
  double result = (std::string *)(a1 + 64);
  unint64_t v3 = *(unsigned __int8 *)(a1 + 87);
  if ((*(char *)(a1 + 87) & 0x80000000) == 0)
  {
    size_t v4 = result;
    unint64_t v5 = *(unsigned __int8 *)(a1 + 87);
    int v6 = *(_DWORD *)(a1 + 96);
    if ((v6 & 8) == 0) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  size_t v4 = *(std::string **)(a1 + 64);
  unint64_t v5 = *(void *)(a1 + 72);
  int v6 = *(_DWORD *)(a1 + 96);
  if ((v6 & 8) != 0)
  {
LABEL_3:
    *(void *)(a1 + 88) = (char *)v4 + v5;
    *(void *)(a1 + 16) = v4;
    *(void *)(a1 + 24) = v4;
    *(void *)(a1 + 32) = (char *)v4 + v5;
  }
LABEL_4:
  if ((v6 & 0x10) == 0) {
    return result;
  }
  *(void *)(a1 + 88) = (char *)v4 + v5;
  if ((v3 & 0x80) == 0)
  {
    unint64_t v7 = 22;
    if (v3 > 0x15)
    {
      *(unsigned char *)(a1 + 87) = 22;
      goto LABEL_15;
    }
LABEL_11:
    double result = std::string::append(result, v7 - v3, 0);
    int v8 = *(char *)(a1 + 87);
    if (v8 < 0) {
      goto LABEL_16;
    }
    goto LABEL_12;
  }
  unint64_t v3 = *(void *)(a1 + 72);
  unint64_t v7 = (*(void *)(a1 + 80) & 0x7FFFFFFFFFFFFFFFLL) - 1;
  if (v3 < v7) {
    goto LABEL_11;
  }
  double result = *(std::string **)(a1 + 64);
  *(void *)(a1 + 72) = v7;
LABEL_15:
  result->__r_.__value_.__s.__data_[v7] = 0;
  int v8 = *(char *)(a1 + 87);
  if (v8 < 0)
  {
LABEL_16:
    uint64_t v9 = (char *)v4 + *(void *)(a1 + 72);
    *(void *)(a1 + 40) = v4;
    *(void *)(a1 + 48) = v4;
    *(void *)(a1 + 56) = v9;
    if ((*(unsigned char *)(a1 + 96) & 3) == 0) {
      return result;
    }
    goto LABEL_17;
  }
LABEL_12:
  *(void *)(a1 + 40) = v4;
  *(void *)(a1 + 48) = v4;
  *(void *)(a1 + 56) = (char *)v4 + v8;
  if ((*(unsigned char *)(a1 + 96) & 3) == 0) {
    return result;
  }
LABEL_17:
  if (v5 >> 31)
  {
    uint64_t v10 = ((v5 - 0x80000000) * (unsigned __int128)0x200000005uLL) >> 64;
    unint64_t v11 = 0x7FFFFFFF * ((v10 + ((v5 - 0x80000000 - v10) >> 1)) >> 30);
    size_t v4 = (std::string *)((char *)v4 + v11 + 0x7FFFFFFF);
    unint64_t v5 = v5 - v11 - 0x7FFFFFFF;
    *(void *)(a1 + 48) = v4;
  }
  if (v5) {
    *(void *)(a1 + 48) = (char *)v4 + v5;
  }
  return result;
}

uint64_t sub_10000EAB0(uint64_t a1)
{
  unint64_t v2 = *(const std::ios_base **)a1;
  v2->__fmtflags_ = *(_DWORD *)(a1 + 8);
  std::ios_base::fmtflags v3 = *(char *)(a1 + 12);
  if (v2[1].__fmtflags_ == -1)
  {
    std::ios_base::getloc(v2);
    size_t v4 = std::locale::use_facet(&v6, &std::ctype<char>::id);
    ((void (*)(const std::locale::facet *, uint64_t))v4->__vftable[2].~facet_0)(v4, 32);
    std::locale::~locale(&v6);
  }
  v2[1].__fmtflags_ = v3;
  return a1;
}

void sub_10000EB54(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
}

uint64_t sub_10000EB68(uint64_t a1)
{
  *(void *)a1 = off_100020790;
  sub_10000E6C8(a1 + 184, *(void *)(a1 + 192));
  sub_10000E6C8(a1 + 160, *(void *)(a1 + 168));
  sub_100004A14(a1 + 136, *(void *)(a1 + 144));
  sub_10000EC34(a1 + 112, *(char **)(a1 + 120));
  sub_10000E644(a1 + 88, *(char **)(a1 + 96));
  if (*(char *)(a1 + 87) < 0)
  {
    operator delete(*(void **)(a1 + 64));
    if ((*(char *)(a1 + 63) & 0x80000000) == 0)
    {
LABEL_3:
      unint64_t v2 = *(std::__shared_weak_count **)(a1 + 32);
      if (!v2) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(char *)(a1 + 63) & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(*(void **)(a1 + 40));
  unint64_t v2 = *(std::__shared_weak_count **)(a1 + 32);
  if (v2) {
LABEL_4:
  }
    std::__shared_weak_count::__release_weak(v2);
LABEL_5:
  std::ios_base::fmtflags v3 = *(std::__shared_weak_count **)(a1 + 16);
  if (v3) {
    std::__shared_weak_count::__release_weak(v3);
  }
  return a1;
}

void sub_10000EC34(uint64_t a1, char *a2)
{
  if (a2)
  {
    sub_10000EC34(a1, *(void *)a2);
    sub_10000EC34(a1, *((void *)a2 + 1));
    size_t v4 = (const void *)*((void *)a2 + 7);
    if (v4) {
      _Block_release(v4);
    }
    if (a2[55] < 0)
    {
      operator delete(*((void **)a2 + 4));
      unint64_t v5 = a2;
    }
    else
    {
      unint64_t v5 = a2;
    }
    operator delete(v5);
  }
}

uint64_t CommandBase::CommandBase(uint64_t a1, char *__s, void *a3)
{
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = off_100020790;
  uint64_t v5 = a3[1];
  *(void *)(a1 + 24) = *a3;
  *(void *)(a1 + 32) = v5;
  if (v5) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 16), 1uLL, memory_order_relaxed);
  }
  std::locale v6 = (void *)(a1 + 40);
  size_t v7 = strlen(__s);
  if (v7 >= 0x7FFFFFFFFFFFFFF8) {
    sub_100003540();
  }
  size_t v8 = v7;
  if (v7 >= 0x17)
  {
    uint64_t v9 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v7 | 7) != 0x17) {
      uint64_t v9 = v7 | 7;
    }
    uint64_t v10 = v9 + 1;
    std::locale v6 = operator new(v9 + 1);
    *(void *)(a1 + 48) = v8;
    *(void *)(a1 + 56) = v10 | 0x8000000000000000;
    *(void *)(a1 + 40) = v6;
  }
  else
  {
    *(unsigned char *)(a1 + 63) = v7;
    if (!v7) {
      goto LABEL_11;
    }
  }
  memmove(v6, __s, v8);
LABEL_11:
  *((unsigned char *)v6 + v8) = 0;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = a1 + 96;
  *(void *)(a1 + 120) = 0;
  *(void *)(a1 + 104) = 0;
  *(void *)(a1 + 112) = a1 + 120;
  *(void *)(a1 + 144) = 0;
  *(void *)(a1 + 128) = 0;
  *(void *)(a1 + 136) = a1 + 144;
  *(void *)(a1 + 168) = 0;
  *(void *)(a1 + 152) = 0;
  *(void *)(a1 + 160) = a1 + 168;
  *(void *)(a1 + 200) = 0;
  *(void *)(a1 + 192) = 0;
  *(void *)(a1 + 176) = 0;
  *(void *)(a1 + 184) = a1 + 192;
  return a1;
}

void sub_10000EE04(_Unwind_Exception *exception_object)
{
  std::ios_base::fmtflags v3 = *(std::__shared_weak_count **)(v1 + 32);
  if (v3)
  {
    std::__shared_weak_count::__release_weak(v3);
    size_t v4 = *(std::__shared_weak_count **)(v1 + 16);
    if (!v4) {
LABEL_3:
    }
      _Unwind_Resume(exception_object);
  }
  else
  {
    size_t v4 = *(std::__shared_weak_count **)(v1 + 16);
    if (!v4) {
      goto LABEL_3;
    }
  }
  std::__shared_weak_count::__release_weak(v4);
  _Unwind_Resume(exception_object);
}

void CommandBase::init(CommandBase *this)
{
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  unint64_t v2 = (std::__shared_weak_count *)*((void *)this + 4);
  if (v2)
  {
    uint64_t v29 = std::__shared_weak_count::lock(v2);
    if (v29)
    {
      uint64_t v3 = *((void *)this + 3);
      uint64_t v28 = v3;
      if (v3)
      {
        if ((CommandBase *)v3 != this)
        {
          size_t v4 = (long long *)(v3 + 64);
          uint64_t v5 = (void **)((char *)this + 64);
          size_t v6 = *(unsigned __int8 *)(v3 + 87);
          if (*((char *)this + 87) < 0)
          {
            uint64_t v9 = *(long long **)(v3 + 64);
            size_t v8 = *(void *)(v3 + 72);
            if ((v6 & 0x80u) == 0) {
              uint64_t v10 = v4;
            }
            else {
              uint64_t v10 = v9;
            }
            if ((v6 & 0x80u) == 0) {
              size_t v11 = v6;
            }
            else {
              size_t v11 = v8;
            }
            sub_100004424(v5, v10, v11);
          }
          else if ((v6 & 0x80) != 0)
          {
            sub_10000435C(v5, *(void **)(v3 + 64), *(void *)(v3 + 72));
          }
          else
          {
            long long v7 = *v4;
            *((void *)this + 10) = *(void *)(v3 + 80);
            *(_OWORD *)uint64_t v5 = v7;
          }
        }
      }
    }
  }
  int v12 = *((char *)this + 87);
  if (v12 >= 0) {
    size_t v13 = *((unsigned __int8 *)this + 87);
  }
  else {
    size_t v13 = *((void *)this + 9);
  }
  unint64_t v14 = v13 + 1;
  memset(&__p, 170, sizeof(__p));
  if (v13 + 1 >= 0x7FFFFFFFFFFFFFF8) {
    sub_100003540();
  }
  int v15 = (void **)((char *)this + 64);
  if (v14 >= 0x17)
  {
    uint64_t v17 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v14 | 7) != 0x17) {
      uint64_t v17 = v14 | 7;
    }
    uint64_t v18 = v17 + 1;
    p_p = (std::string *)operator new(v17 + 1);
    __p.__r_.__value_.__l.__size_ = v13 + 1;
    __p.__r_.__value_.__r.__words[2] = v18 | 0x8000000000000000;
    __p.__r_.__value_.__r.__words[0] = (std::string::size_type)p_p;
  }
  else
  {
    memset(&__p, 0, sizeof(__p));
    p_p = &__p;
    *((unsigned char *)&__p.__r_.__value_.__s + 23) = v13 + 1;
    if (!v13) {
      goto LABEL_30;
    }
  }
  if (v12 >= 0) {
    int v19 = (char *)this + 64;
  }
  else {
    int v19 = (char *)*v15;
  }
  memmove(p_p, v19, v13);
LABEL_30:
  *(_WORD *)((char *)&p_p->__r_.__value_.__l.__data_ + v13) = 47;
  int v20 = *((char *)this + 63);
  if (v20 >= 0) {
    uint64_t v21 = (char *)this + 40;
  }
  else {
    uint64_t v21 = (const std::string::value_type *)*((void *)this + 5);
  }
  if (v20 >= 0) {
    std::string::size_type v22 = *((unsigned __int8 *)this + 63);
  }
  else {
    std::string::size_type v22 = *((void *)this + 6);
  }
  v23 = std::string::append(&__p, v21, v22);
  std::string::size_type v24 = v23->__r_.__value_.__r.__words[0];
  v30[0] = v23->__r_.__value_.__l.__size_;
  *(void *)((char *)v30 + 7) = *(std::string::size_type *)((char *)&v23->__r_.__value_.__r.__words[1] + 7);
  char v25 = HIBYTE(v23->__r_.__value_.__r.__words[2]);
  v23->__r_.__value_.__l.__size_ = 0;
  v23->__r_.__value_.__r.__words[2] = 0;
  v23->__r_.__value_.__r.__words[0] = 0;
  if (*((char *)this + 87) < 0) {
    operator delete(*v15);
  }
  *((void *)this + 8) = v24;
  *((void *)this + 9) = v30[0];
  *(void *)((char *)this + 79) = *(void *)((char *)v30 + 7);
  *((unsigned char *)this + 87) = v25;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  (*(void (**)(CommandBase *))(*(void *)this + 56))(this);
  long long v26 = v29;
  if (v29)
  {
    if (!atomic_fetch_add(&v29->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }
}

void sub_10000F0C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  if (a14 < 0)
  {
    operator delete(__p);
    sub_10000340C((uint64_t)&a15);
    _Unwind_Resume(a1);
  }
  sub_10000340C((uint64_t)&a15);
  _Unwind_Resume(a1);
}

void CommandBase::list(CommandBase *this)
{
  uint64_t v1 = (void *)*((void *)this + 11);
  unint64_t v2 = (char *)this + 96;
  if (v1 != (void *)((char *)this + 96))
  {
    do
    {
      memset(__p, 170, 24);
      if (*((char *)v1 + 55) < 0)
      {
        sub_1000035FC(__p, (void *)v1[4], v1[5]);
      }
      else
      {
        *(_OWORD *)std::string __p = *((_OWORD *)v1 + 2);
        *(void *)&__p[16] = v1[6];
      }
      uint64_t v3 = sub_10000369C(&std::cout, (uint64_t)"\t", 1);
      uint64_t v4 = *v3;
      *(uint64_t *)((char *)v3 + *(void *)(*v3 - 24) + 24) = 4;
      *(_DWORD *)((char *)v3 + *(void *)(v4 - 24) + 8) = *(_DWORD *)((unsigned char *)v3 + *(void *)(v4 - 24) + 8) & 0xFFFFFF4F | 0x80;
      if (__p[23] >= 0) {
        uint64_t v5 = __p;
      }
      else {
        uint64_t v5 = *(unsigned char **)__p;
      }
      if (__p[23] >= 0) {
        uint64_t v6 = __p[23];
      }
      else {
        uint64_t v6 = *(void *)&__p[8];
      }
      long long v7 = sub_10000369C(v3, (uint64_t)v5, v6);
      std::ios_base::getloc((const std::ios_base *)((char *)v7 + *(void *)(*v7 - 24)));
      size_t v8 = std::locale::use_facet(&v27, &std::ctype<char>::id);
      ((void (*)(const std::locale::facet *, uint64_t))v8->__vftable[2].~facet_0)(v8, 10);
      std::locale::~locale(&v27);
      std::ostream::put();
      std::ostream::flush();
      if ((__p[23] & 0x80000000) != 0)
      {
        operator delete(*(void **)__p);
        uint64_t v9 = (char *)v1[1];
        if (v9)
        {
          do
          {
LABEL_17:
            uint64_t v10 = v9;
            uint64_t v9 = *(char **)v9;
          }
          while (v9);
          goto LABEL_3;
        }
      }
      else
      {
        uint64_t v9 = (char *)v1[1];
        if (v9) {
          goto LABEL_17;
        }
      }
      do
      {
        uint64_t v10 = (char *)v1[2];
        BOOL v11 = *(void *)v10 == (void)v1;
        uint64_t v1 = v10;
      }
      while (!v11);
LABEL_3:
      uint64_t v1 = v10;
    }
    while (v10 != v2);
  }
  int v12 = (CommandBase *)*((void *)this + 20);
  if (v12 != (CommandBase *)((char *)this + 168))
  {
    while (1)
    {
      unint64_t v26 = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&long long v13 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)std::string __p = v13;
      *(_OWORD *)&__p[16] = v13;
      if ((*((char *)v12 + 55) & 0x80000000) == 0) {
        break;
      }
      sub_1000035FC(__p, *((void **)v12 + 4), *((void *)v12 + 5));
      unint64_t v14 = *((void *)v12 + 8);
      *(void *)&__p[24] = *((void *)v12 + 7);
      unint64_t v26 = v14;
      if (v14) {
        goto LABEL_27;
      }
LABEL_28:
      int v15 = sub_10000369C(&std::cout, (uint64_t)"\t", 1);
      uint64_t v16 = *v15;
      *(uint64_t *)((char *)v15 + *(void *)(*v15 - 24) + 24) = 4;
      *(_DWORD *)((char *)v15 + *(void *)(v16 - 24) + 8) = *(_DWORD *)((unsigned char *)v15 + *(void *)(v16 - 24) + 8) & 0xFFFFFF4F | 0x80;
      if (__p[23] >= 0) {
        uint64_t v17 = __p;
      }
      else {
        uint64_t v17 = *(unsigned char **)__p;
      }
      if (__p[23] >= 0) {
        uint64_t v18 = __p[23];
      }
      else {
        uint64_t v18 = *(void *)&__p[8];
      }
      int v19 = sub_10000369C(v15, (uint64_t)v17, v18);
      std::ios_base::getloc((const std::ios_base *)((char *)v19 + *(void *)(*v19 - 24)));
      int v20 = std::locale::use_facet(&v27, &std::ctype<char>::id);
      ((void (*)(const std::locale::facet *, uint64_t))v20->__vftable[2].~facet_0)(v20, 10);
      std::locale::~locale(&v27);
      std::ostream::put();
      std::ostream::flush();
      uint64_t v21 = (std::__shared_weak_count *)v26;
      if (v26 && !atomic_fetch_add((atomic_ullong *volatile)(v26 + 8), 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
        std::__shared_weak_count::__release_weak(v21);
        if ((__p[23] & 0x80000000) == 0)
        {
LABEL_37:
          std::string::size_type v22 = (CommandBase *)*((void *)v12 + 1);
          if (v22) {
            goto LABEL_43;
          }
          goto LABEL_45;
        }
      }
      else if ((__p[23] & 0x80000000) == 0)
      {
        goto LABEL_37;
      }
      operator delete(*(void **)__p);
      std::string::size_type v22 = (CommandBase *)*((void *)v12 + 1);
      if (v22)
      {
        do
        {
LABEL_43:
          v23 = v22;
          std::string::size_type v22 = *(CommandBase **)v22;
        }
        while (v22);
        goto LABEL_24;
      }
      do
      {
LABEL_45:
        v23 = (CommandBase *)*((void *)v12 + 2);
        BOOL v11 = *(void *)v23 == (void)v12;
        int v12 = v23;
      }
      while (!v11);
LABEL_24:
      int v12 = v23;
      if (v23 == (CommandBase *)((char *)this + 168)) {
        return;
      }
    }
    *(_OWORD *)std::string __p = *((_OWORD *)v12 + 2);
    *(void *)&__p[16] = *((void *)v12 + 6);
    unint64_t v14 = *((void *)v12 + 8);
    *(void *)&__p[24] = *((void *)v12 + 7);
    unint64_t v26 = v14;
    if (!v14) {
      goto LABEL_28;
    }
LABEL_27:
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v14 + 8), 1uLL, memory_order_relaxed);
    goto LABEL_28;
  }
}

void sub_10000F560(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, std::locale a19)
{
}

uint64_t sub_10000F5B8(uint64_t a1)
{
  unint64_t v2 = *(std::__shared_weak_count **)(a1 + 32);
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    if ((*(char *)(a1 + 23) & 0x80000000) == 0) {
      return a1;
    }
  }
  else if ((*(char *)(a1 + 23) & 0x80000000) == 0)
  {
    return a1;
  }
  operator delete(*(void **)a1);
  return a1;
}

uint64_t CommandBase::displayHelp(CommandBase *this, char a2)
{
  if (*((void *)this + 13))
  {
    unint64_t v2 = sub_10000369C(&std::cout, (uint64_t)"\t", 1);
    uint64_t v3 = *v2;
    *(uint64_t *)((char *)v2 + *(void *)(*v2 - 24) + 24) = 4;
    *(_DWORD *)((char *)v2 + *(void *)(v3 - 24) + 8) = *(_DWORD *)((unsigned char *)v2 + *(void *)(v3 - 24) + 8) & 0xFFFFFF4F | 0x80;
    uint64_t v4 = sub_10000369C(v2, (uint64_t)"Commands:", 9);
    std::ios_base::getloc((const std::ios_base *)((char *)v4 + *(void *)(*v4 - 24)));
    uint64_t v5 = std::locale::use_facet(v349, &std::ctype<char>::id);
    ((void (*)(const std::locale::facet *, uint64_t))v5->__vftable[2].~facet_0)(v5, 10);
    std::locale::~locale(v349);
    std::ostream::put();
    std::ostream::flush();
    uint64_t v6 = (std::locale *)*((void *)this + 11);
    v329 = (std::locale *)((char *)this + 96);
    if (v6 != (std::locale *)((char *)this + 96))
    {
      long long v7 = (char **)((char *)this + 144);
      size_t v8 = &std::cout;
      uint64_t v9 = "\t";
      do
      {
        memset(v349, 170, 24);
        if (SHIBYTE(v6[6].__locale_) < 0)
        {
          sub_1000035FC(v349, v6[4].__locale_, (unint64_t)v6[5].__locale_);
        }
        else
        {
          *(_OWORD *)&v349[0].__locale_ = *(_OWORD *)&v6[4].__locale_;
          v349[2] = v6[6];
        }
        __p[1] = (void *)0xAAAAAAAAAAAAAAAALL;
        __p[2] = (void *)0x3AAAAAAAAAAAAAALL;
        __p[0] = (void *)0xAAAAAAAA002E2E2ELL;
        uint64_t v10 = *v7;
        if (!*v7) {
          goto LABEL_59;
        }
        BOOL v11 = v9;
        int v12 = v8;
        if (SHIBYTE(v349[2].__locale_) >= 0) {
          locale = v349;
        }
        else {
          locale = v349[0].__locale_;
        }
        if (SHIBYTE(v349[2].__locale_) >= 0) {
          locale_high = (std::locale::__imp *)HIBYTE(v349[2].__locale_);
        }
        else {
          locale_high = v349[1].__locale_;
        }
        int v15 = (char **)((char *)this + 144);
        do
        {
          while (1)
          {
            int v16 = v10[55];
            uint64_t v17 = v16 >= 0 ? v10 + 32 : (char *)*((void *)v10 + 4);
            uint64_t v18 = v16 >= 0 ? (std::locale::__imp *)v10[55] : (std::locale::__imp *)*((void *)v10 + 5);
            size_t v19 = (size_t)(locale_high >= v18 ? v18 : locale_high);
            int v20 = memcmp(v17, locale, v19);
            if (v20) {
              break;
            }
            if (v18 < locale_high) {
              goto LABEL_18;
            }
LABEL_16:
            int v15 = (char **)v10;
            uint64_t v10 = *(char **)v10;
            if (!v10) {
              goto LABEL_33;
            }
          }
          if ((v20 & 0x80000000) == 0) {
            goto LABEL_16;
          }
LABEL_18:
          uint64_t v10 = (char *)*((void *)v10 + 1);
        }
        while (v10);
LABEL_33:
        size_t v8 = v12;
        uint64_t v9 = v11;
        if (v15 == v7) {
          goto LABEL_59;
        }
        v23 = v15[4];
        std::string::size_type v22 = (char *)(v15 + 4);
        uint64_t v21 = v23;
        int v24 = v22[23];
        if (v24 >= 0) {
          char v25 = v22;
        }
        else {
          char v25 = v21;
        }
        if (v24 >= 0) {
          size_t v26 = v22[23];
        }
        else {
          size_t v26 = *((void *)v22 + 1);
        }
        if (v26 >= (unint64_t)locale_high) {
          size_t v27 = (size_t)locale_high;
        }
        else {
          size_t v27 = v26;
        }
        int v28 = memcmp(locale, v25, v27);
        if (v28)
        {
          if (v28 < 0) {
            goto LABEL_59;
          }
        }
        else if ((unint64_t)locale_high < v26)
        {
          goto LABEL_59;
        }
        uint64_t v29 = sub_1000134AC((uint64_t **)this + 17, (const void **)&v349[0].__locale_, (uint64_t)v349);
        if (__p != (void **)(v29 + 7))
        {
          char v30 = *((unsigned char *)v29 + 79);
          if (SHIBYTE(__p[2]) < 0)
          {
            if (v30 >= 0) {
              char v31 = v29 + 7;
            }
            else {
              char v31 = (void *)v29[7];
            }
            if (v30 >= 0) {
              size_t v32 = *((unsigned __int8 *)v29 + 79);
            }
            else {
              size_t v32 = v29[8];
            }
            sub_100004424(__p, v31, v32);
          }
          else if ((*((unsigned char *)v29 + 79) & 0x80) != 0)
          {
            sub_10000435C(__p, (void *)v29[7], v29[8]);
          }
          else
          {
            *(_OWORD *)std::string __p = *(_OWORD *)(v29 + 7);
            __p[2] = (void *)v29[9];
          }
        }
LABEL_59:
        unint64_t v33 = sub_10000369C(v8, (uint64_t)v9, 1);
        uint64_t v34 = *v33;
        *(uint64_t *)((char *)v33 + *(void *)(*v33 - 24) + 24) = 16;
        *(_DWORD *)((char *)v33 + *(void *)(v34 - 24) + 8) = *(_DWORD *)((unsigned char *)v33 + *(void *)(v34 - 24) + 8) & 0xFFFFFF4F | 0x80;
        if (SHIBYTE(v349[2].__locale_) >= 0) {
          v35 = v349;
        }
        else {
          v35 = v349[0].__locale_;
        }
        if (SHIBYTE(v349[2].__locale_) >= 0) {
          uint64_t v36 = HIBYTE(v349[2].__locale_);
        }
        else {
          uint64_t v36 = (uint64_t)v349[1].__locale_;
        }
        uint64_t v37 = sub_10000369C(v33, (uint64_t)v35, v36);
        sub_10000369C(v37, (uint64_t)":", 1);
        uint64_t v38 = sub_10000369C(v8, (uint64_t)v9, 1);
        uint64_t v39 = *v38;
        *(uint64_t *)((char *)v38 + *(void *)(*v38 - 24) + 24) = 20;
        *(_DWORD *)((char *)v38 + *(void *)(v39 - 24) + 8) = *(_DWORD *)((unsigned char *)v38 + *(void *)(v39 - 24) + 8) & 0xFFFFFF4F | 0x20;
        if (SHIBYTE(__p[2]) >= 0) {
          char v40 = __p;
        }
        else {
          char v40 = (void **)__p[0];
        }
        if (SHIBYTE(__p[2]) >= 0) {
          uint64_t v41 = HIBYTE(__p[2]);
        }
        else {
          uint64_t v41 = (uint64_t)__p[1];
        }
        size_t v42 = sub_10000369C(v38, (uint64_t)v40, v41);
        std::ios_base::getloc((const std::ios_base *)((char *)v42 + *(void *)(*v42 - 24)));
        v43 = std::locale::use_facet(v377, &std::ctype<char>::id);
        ((void (*)(const std::locale::facet *, uint64_t))v43->__vftable[2].~facet_0)(v43, 10);
        std::locale::~locale(v377);
        std::ostream::put();
        std::ostream::flush();
        if (SHIBYTE(__p[2]) < 0)
        {
          operator delete(__p[0]);
          if (SHIBYTE(v349[2].__locale_) < 0) {
            goto LABEL_76;
          }
LABEL_73:
          int v44 = (std::locale *)v6[1].__locale_;
          if (!v44) {
            goto LABEL_79;
          }
          do
          {
LABEL_77:
            v45 = v44;
            int v44 = (std::locale *)v44->__locale_;
          }
          while (v44);
        }
        else
        {
          if ((SHIBYTE(v349[2].__locale_) & 0x80000000) == 0) {
            goto LABEL_73;
          }
LABEL_76:
          operator delete(v349[0].__locale_);
          int v44 = (std::locale *)v6[1].__locale_;
          if (v44) {
            goto LABEL_77;
          }
          do
          {
LABEL_79:
            v45 = (std::locale *)v6[2].__locale_;
            BOOL v46 = v45->__locale_ == (std::locale::__imp *)v6;
            uint64_t v6 = v45;
          }
          while (!v46);
        }
        uint64_t v6 = v45;
      }
      while (v45 != v329);
    }
  }
  if (*((void *)this + 22))
  {
    std::ios_base::getloc((const std::ios_base *)((char *)&std::cout
                                                + (unint64_t)std::cout.__vftable[-2].~basic_ostream_0));
    size_t v47 = std::locale::use_facet(v349, &std::ctype<char>::id);
    ((void (*)(const std::locale::facet *, uint64_t))v47->__vftable[2].~facet_0)(v47, 10);
    std::locale::~locale(v349);
    std::ostream::put();
    std::ostream::flush();
    long long v48 = sub_10000369C(&std::cout, (uint64_t)"\t", 1);
    uint64_t v49 = *v48;
    *(uint64_t *)((char *)v48 + *(void *)(*v48 - 24) + 24) = 4;
    *(_DWORD *)((char *)v48 + *(void *)(v49 - 24) + 8) = *(_DWORD *)((unsigned char *)v48 + *(void *)(v49 - 24) + 8) & 0xFFFFFF4F | 0x80;
    v50 = sub_10000369C(v48, (uint64_t)"Sub-commands:", 13);
    std::ios_base::getloc((const std::ios_base *)((char *)v50 + *(void *)(*v50 - 24)));
    size_t v51 = std::locale::use_facet(v349, &std::ctype<char>::id);
    ((void (*)(const std::locale::facet *, uint64_t))v51->__vftable[2].~facet_0)(v51, 10);
    std::locale::~locale(v349);
    std::ostream::put();
    std::ostream::flush();
    size_t v52 = (char *)*((void *)this + 20);
    v322 = (char *)this + 168;
    if (v52 != (char *)this + 168)
    {
      v329 = &v349[2];
      while (1)
      {
        unint64_t v379 = 0xAAAAAAAAAAAAAAAALL;
        *(void *)&long long v53 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v53 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&v377[0].__locale_ = v53;
        long long v378 = v53;
        unsigned __int8 v326 = v52;
        if (v52[55] < 0)
        {
          sub_1000035FC(v377, *((void **)v52 + 4), *((void *)v52 + 5));
          v54 = (void *)*((void *)v326 + 7);
          unint64_t v55 = *((void *)v326 + 8);
          *((void *)&v378 + 1) = v54;
          unint64_t v379 = v55;
          if (!v55)
          {
LABEL_93:
            uint64_t v375 = v54;
            uint64_t v376 = 0;
            uint64_t v373 = 0;
            uint64_t v374 = 0;
            BOOL v372 = (uint64_t **)&v373;
            int v56 = (const void **)v54[11];
            int v57 = (const void ***)(v54 + 12);
            if (v56 != v54 + 12) {
              break;
            }
            goto LABEL_94;
          }
        }
        else
        {
          *(_OWORD *)&v377[0].__locale_ = *((_OWORD *)v52 + 2);
          *(void *)&long long v378 = *((void *)v52 + 6);
          v54 = (void *)*((void *)v52 + 7);
          unint64_t v55 = *((void *)v52 + 8);
          *((void *)&v378 + 1) = v54;
          unint64_t v379 = v55;
          if (!v55) {
            goto LABEL_93;
          }
        }
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v55 + 8), 1uLL, memory_order_relaxed);
        v54 = (void *)*((void *)&v378 + 1);
        uint64_t v375 = (void *)*((void *)&v378 + 1);
        uint64_t v376 = (std::__shared_weak_count *)v379;
        if (v379) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(v379 + 8), 1uLL, memory_order_relaxed);
        }
        uint64_t v373 = 0;
        uint64_t v374 = 0;
        BOOL v372 = (uint64_t **)&v373;
        int v56 = (const void **)v54[11];
        int v57 = (const void ***)(v54 + 12);
        if (v56 != v54 + 12) {
          break;
        }
LABEL_94:
        uint64_t v370 = 0;
        uint64_t v371 = 0;
        v369 = (uint64_t **)&v370;
        long long v58 = (const void **)v54[20];
        v59 = (const void ***)(v54 + 21);
        if (v58 != v54 + 21) {
          goto LABEL_140;
        }
LABEL_183:
        std::string::size_type v367 = 0;
        uint64_t v368 = 0;
        std::string::size_type v366 = (uint64_t *)&v367;
        long long v103 = (void *)v54[17];
        size_t v328 = v54 + 18;
        if (v103 == v54 + 18) {
          goto LABEL_184;
        }
        while (2)
        {
          uint64_t v116 = (uint64_t)v367;
          uint64_t v117 = (uint64_t *)&v367;
          if (v366 == (uint64_t *)&v367)
          {
LABEL_236:
            if (v116) {
              uint64_t v129 = v117;
            }
            else {
              uint64_t v129 = (uint64_t *)&v367;
            }
            uint64_t v136 = &v366;
            if (v116)
            {
              uint64_t v136 = (uint64_t **)v117;
              uint64_t v128 = v117 + 1;
            }
            else
            {
              uint64_t v128 = (uint64_t *)&v367;
            }
            if (v136[1])
            {
LABEL_243:
              uint64_t v137 = (void *)v103[1];
              if (!v137) {
                goto LABEL_276;
              }
              goto LABEL_270;
            }
            goto LABEL_245;
          }
          uint64_t v118 = (uint64_t)v367;
          uint64_t v119 = (uint64_t *)&v367;
          if (v367)
          {
            do
            {
              uint64_t v117 = (uint64_t *)v118;
              uint64_t v118 = *(void *)(v118 + 8);
            }
            while (v118);
          }
          else
          {
            do
            {
              uint64_t v117 = (uint64_t *)v119[2];
              BOOL v46 = *v117 == (void)v119;
              uint64_t v119 = v117;
            }
            while (v46);
          }
          int v120 = *((char *)v117 + 55);
          if (v120 >= 0) {
            uint64_t v121 = v117 + 4;
          }
          else {
            uint64_t v121 = (const void *)v117[4];
          }
          if (v120 >= 0) {
            size_t v122 = *((unsigned __int8 *)v117 + 55);
          }
          else {
            size_t v122 = v117[5];
          }
          int v123 = *((char *)v103 + 55);
          if (v123 >= 0) {
            int v124 = v103 + 4;
          }
          else {
            int v124 = (const void *)v103[4];
          }
          if (v123 >= 0) {
            size_t v125 = *((unsigned __int8 *)v103 + 55);
          }
          else {
            size_t v125 = v103[5];
          }
          if (v125 >= v122) {
            size_t v126 = v122;
          }
          else {
            size_t v126 = v125;
          }
          int v127 = memcmp(v121, v124, v126);
          if (v127)
          {
            if (v127 < 0) {
              goto LABEL_236;
            }
          }
          else if (v122 < v125)
          {
            goto LABEL_236;
          }
          uint64_t v128 = (uint64_t *)&v367;
          uint64_t v129 = (uint64_t *)&v367;
          if (v116)
          {
            while (1)
            {
              uint64_t v129 = (uint64_t *)v116;
              int v130 = *(char *)(v116 + 55);
              if (v130 >= 0) {
                uint64_t v131 = (const void *)(v116 + 32);
              }
              else {
                uint64_t v131 = *(const void **)(v116 + 32);
              }
              if (v130 >= 0) {
                size_t v132 = *(unsigned __int8 *)(v116 + 55);
              }
              else {
                size_t v132 = *(void *)(v116 + 40);
              }
              if (v132 >= v125) {
                size_t v133 = v125;
              }
              else {
                size_t v133 = v132;
              }
              int v134 = memcmp(v124, v131, v133);
              if (v134)
              {
                if (v134 < 0) {
                  goto LABEL_215;
                }
LABEL_229:
                int v135 = memcmp(v131, v124, v133);
                if (v135)
                {
                  if ((v135 & 0x80000000) == 0) {
                    goto LABEL_243;
                  }
                }
                else if (v132 >= v125)
                {
                  goto LABEL_243;
                }
                uint64_t v116 = v129[1];
                if (!v116)
                {
                  uint64_t v128 = v129 + 1;
                  break;
                }
              }
              else
              {
                if (v125 >= v132) {
                  goto LABEL_229;
                }
LABEL_215:
                uint64_t v116 = *v129;
                uint64_t v128 = v129;
                if (!*v129) {
                  break;
                }
              }
            }
          }
LABEL_245:
          BOOL v138 = (char *)operator new(0x50uLL);
          uint64_t v139 = v138;
          if (*((char *)v103 + 55) < 0)
          {
            sub_1000035FC(v138 + 32, (void *)v103[4], v103[5]);
          }
          else
          {
            long long v140 = *((_OWORD *)v103 + 2);
            *((void *)v138 + 6) = v103[6];
            *((_OWORD *)v138 + 2) = v140;
          }
          uint64_t v141 = v139 + 56;
          if (*((char *)v103 + 79) < 0)
          {
            sub_1000035FC(v141, (void *)v103[7], v103[8]);
          }
          else
          {
            long long v142 = *(_OWORD *)(v103 + 7);
            *((void *)v139 + 9) = v103[9];
            *(_OWORD *)uint64_t v141 = v142;
          }
          *(void *)uint64_t v139 = 0;
          *((void *)v139 + 1) = 0;
          *((void *)v139 + 2) = v129;
          *uint64_t v128 = (uint64_t)v139;
          if (*v366)
          {
            std::string::size_type v366 = (uint64_t *)*v366;
            uint64_t v139 = (char *)*v128;
          }
          uint64_t v143 = (uint64_t)v367;
          v139[24] = v139 == v367;
          if (v139 == (char *)v143)
          {
LABEL_269:
            ++v368;
            uint64_t v137 = (void *)v103[1];
            if (!v137) {
              goto LABEL_276;
            }
            goto LABEL_270;
          }
          while (1)
          {
            uint64_t v144 = *((void *)v139 + 2);
            if (*(unsigned char *)(v144 + 24)) {
              goto LABEL_269;
            }
            uint64_t v145 = *(char **)(v144 + 16);
            uint64_t v146 = *(void *)v145;
            if (*(void *)v145 != v144) {
              break;
            }
            uint64_t v149 = *((void *)v145 + 1);
            if (!v149 || (v150 = *(unsigned __int8 *)(v149 + 24), std::string::size_type v147 = (unsigned char *)(v149 + 24), v150))
            {
              if (*(char **)v144 == v139)
              {
                *(unsigned char *)(v144 + 24) = 1;
                v145[24] = 0;
                uint64_t v153 = *(void *)(v144 + 8);
                *(void *)uint64_t v145 = v153;
                if (v153) {
                  goto LABEL_267;
                }
              }
              else
              {
                v151 = *(uint64_t **)(v144 + 8);
                uint64_t v152 = *v151;
                *(void *)(v144 + 8) = *v151;
                if (v152)
                {
                  *(void *)(v152 + 16) = v144;
                  uint64_t v145 = *(char **)(v144 + 16);
                }
                v151[2] = (uint64_t)v145;
                *(void *)(*(void *)(v144 + 16) + 8 * (**(void **)(v144 + 16) != v144)) = v151;
                uint64_t *v151 = v144;
                *(void *)(v144 + 16) = v151;
                uint64_t v145 = (char *)v151[2];
                uint64_t v144 = *(void *)v145;
                *((unsigned char *)v151 + 24) = 1;
                v145[24] = 0;
                uint64_t v153 = *(void *)(v144 + 8);
                *(void *)uint64_t v145 = v153;
                if (v153) {
LABEL_267:
                }
                  *(void *)(v153 + 16) = v145;
              }
              *(void *)(v144 + 16) = *((void *)v145 + 2);
              *(void *)(*((void *)v145 + 2) + 8 * (**((void **)v145 + 2) != (void)v145)) = v144;
              *(void *)(v144 + 8) = v145;
              *((void *)v145 + 2) = v144;
              goto LABEL_269;
            }
LABEL_255:
            *(unsigned char *)(v144 + 24) = 1;
            uint64_t v139 = v145;
            v145[24] = v145 == (char *)v143;
            *std::string::size_type v147 = 1;
            if (v145 == (char *)v143) {
              goto LABEL_269;
            }
          }
          if (v146)
          {
            int v148 = *(unsigned __int8 *)(v146 + 24);
            std::string::size_type v147 = (unsigned char *)(v146 + 24);
            if (!v148) {
              goto LABEL_255;
            }
          }
          if (*(char **)v144 == v139)
          {
            uint64_t v157 = *((void *)v139 + 1);
            *(void *)uint64_t v144 = v157;
            if (v157)
            {
              *(void *)(v157 + 16) = v144;
              uint64_t v145 = *(char **)(v144 + 16);
            }
            *((void *)v139 + 2) = v145;
            *(void *)(*(void *)(v144 + 16) + 8 * (**(void **)(v144 + 16) != v144)) = v139;
            *((void *)v139 + 1) = v144;
            *(void *)(v144 + 16) = v139;
            uint64_t v145 = (char *)*((void *)v139 + 2);
            v139[24] = 1;
            v145[24] = 0;
            int v155 = (uint64_t *)*((void *)v145 + 1);
            uint64_t v156 = *v155;
            *((void *)v145 + 1) = *v155;
            if (v156) {
LABEL_274:
            }
              *(void *)(v156 + 16) = v145;
          }
          else
          {
            *(unsigned char *)(v144 + 24) = 1;
            v145[24] = 0;
            int v155 = (uint64_t *)*((void *)v145 + 1);
            uint64_t v156 = *v155;
            *((void *)v145 + 1) = *v155;
            if (v156) {
              goto LABEL_274;
            }
          }
          v155[2] = *((void *)v145 + 2);
          *(void *)(*((void *)v145 + 2) + 8 * (**((void **)v145 + 2) != (void)v145)) = v155;
          uint64_t *v155 = (uint64_t)v145;
          *((void *)v145 + 2) = v155;
          ++v368;
          uint64_t v137 = (void *)v103[1];
          if (v137)
          {
            do
            {
LABEL_270:
              v154 = v137;
              uint64_t v137 = (void *)*v137;
            }
            while (v137);
            goto LABEL_190;
          }
          do
          {
LABEL_276:
            v154 = (void *)v103[2];
            BOOL v46 = *v154 == (void)v103;
            long long v103 = v154;
          }
          while (!v46);
LABEL_190:
          long long v103 = v154;
          if (v154 != v328) {
            continue;
          }
          break;
        }
LABEL_184:
        unint64_t v365 = 0xAAAAAAAAAAAAAAAALL;
        *(void *)&long long v104 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v104 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v363 = v104;
        long long v364 = v104;
        long long v361 = v104;
        long long v362 = v104;
        long long v359 = v104;
        long long v360 = v104;
        long long v357 = v104;
        long long v358 = v104;
        long long v355 = v104;
        long long v356 = v104;
        *(_OWORD *)v353 = v104;
        long long v354 = v104;
        long long v351 = v104;
        long long v352 = v104;
        *(_OWORD *)&v349[2].__locale_ = v104;
        long long v350 = v104;
        *(_OWORD *)&v349[0].__locale_ = v104;
        sub_1000129F4((uint64_t)v349);
        v105 = v329;
        std::ios_base::getloc((const std::ios_base *)((char *)v329 + *((void *)v349[2].__locale_ - 3)));
        v106 = std::locale::use_facet((const std::locale *)__p, &std::ctype<char>::id);
        ((void (*)(const std::locale::facet *, uint64_t))v106->__vftable[2].~facet_0)(v106, 10);
        std::locale::~locale((std::locale *)__p);
        std::ostream::put();
        std::ostream::flush();
        v107 = (uint64_t *)v372;
        if (v372 != (uint64_t **)&v373)
        {
LABEL_286:
          memset(__p, 170, 24);
          if (*((char *)v107 + 55) < 0)
          {
            sub_1000035FC(__p, (void *)v107[4], v107[5]);
          }
          else
          {
            *(_OWORD *)std::string __p = *((_OWORD *)v107 + 2);
            __p[2] = (void *)v107[6];
          }
          size_t v158 = sub_10000369C(v105, (uint64_t)"\t\t\t\t", 4);
          uint64_t v159 = *v158;
          *(uint64_t *)((char *)v158 + *(void *)(*v158 - 24) + 24) = 20;
          *(_DWORD *)((char *)v158 + *(void *)(v159 - 24) + 8) = *(_DWORD *)((unsigned char *)v158 + *(void *)(v159 - 24)
                                                                                             + 8) & 0xFFFFFF4F | 0x20;
          if (SHIBYTE(__p[2]) >= 0) {
            v160 = __p;
          }
          else {
            v160 = (void **)__p[0];
          }
          if (SHIBYTE(__p[2]) >= 0) {
            uint64_t v161 = HIBYTE(__p[2]);
          }
          else {
            uint64_t v161 = (uint64_t)__p[1];
          }
          sub_10000369C(v158, (uint64_t)v160, v161);
          uint64_t v162 = (uint64_t)v367;
          int v163 = (uint64_t *)&v367;
          long long v164 = (uint64_t *)&v367;
          if (!v367)
          {
LABEL_322:
            int v176 = (char *)operator new(0x50uLL);
            v105 = v329;
            v177 = (uint64_t *)v176;
            v178 = (void **)(v176 + 32);
            if (SHIBYTE(__p[2]) < 0)
            {
              sub_1000035FC(v178, __p[0], (unint64_t)__p[1]);
            }
            else
            {
              *(_OWORD *)v178 = *(_OWORD *)__p;
              v178[2] = __p[2];
            }
            v177[7] = 0;
            v177[8] = 0;
            v177[9] = 0;
            uint64_t *v177 = 0;
            v177[1] = 0;
            v177[2] = (uint64_t)v164;
            *int v163 = (uint64_t)v177;
            uint64_t v179 = (uint64_t)v177;
            if (*v366)
            {
              std::string::size_type v366 = (uint64_t *)*v366;
              uint64_t v179 = *v163;
            }
            uint64_t v180 = (uint64_t)v367;
            *(unsigned char *)(v179 + 24) = v179 == (void)v367;
            if (v179 != v180)
            {
              do
              {
                int v181 = *(uint64_t **)(v179 + 16);
                if (*((unsigned char *)v181 + 24)) {
                  break;
                }
                uint64_t v182 = v181[2];
                unint64_t v183 = *(uint64_t **)v182;
                if (*(uint64_t **)v182 == v181)
                {
                  uint64_t v186 = *(void *)(v182 + 8);
                  if (!v186 || (v187 = *(unsigned __int8 *)(v186 + 24), int v184 = (unsigned char *)(v186 + 24), v187))
                  {
                    if (*v181 == v179)
                    {
                      *((unsigned char *)v181 + 24) = 1;
                      *(unsigned char *)(v182 + 24) = 0;
                      uint64_t v190 = v181[1];
                      *(void *)uint64_t v182 = v190;
                      if (v190) {
                        goto LABEL_341;
                      }
                    }
                    else
                    {
                      uint64_t v188 = (uint64_t **)v181[1];
                      std::string::size_type v189 = *v188;
                      v181[1] = (uint64_t)*v188;
                      if (v189)
                      {
                        v189[2] = (uint64_t)v181;
                        uint64_t v182 = v181[2];
                      }
                      v188[2] = (uint64_t *)v182;
                      *(void *)(v181[2] + 8 * (*(void *)v181[2] != (void)v181)) = v188;
                      *uint64_t v188 = v181;
                      v181[2] = (uint64_t)v188;
                      uint64_t v182 = (uint64_t)v188[2];
                      int v181 = *(uint64_t **)v182;
                      *((unsigned char *)v188 + 24) = 1;
                      *(unsigned char *)(v182 + 24) = 0;
                      uint64_t v190 = v181[1];
                      *(void *)uint64_t v182 = v190;
                      if (v190) {
LABEL_341:
                      }
                        *(void *)(v190 + 16) = v182;
                    }
                    v181[2] = *(void *)(v182 + 16);
                    *(void *)(*(void *)(v182 + 16) + 8 * (**(void **)(v182 + 16) != v182)) = v181;
                    v181[1] = v182;
LABEL_350:
                    *(void *)(v182 + 16) = v181;
                    break;
                  }
                }
                else if (!v183 || (v185 = *((unsigned __int8 *)v183 + 24), int v184 = v183 + 3, v185))
                {
                  if (*v181 == v179)
                  {
                    uint64_t v235 = *(void *)(v179 + 8);
                    uint64_t *v181 = v235;
                    if (v235)
                    {
                      *(void *)(v235 + 16) = v181;
                      uint64_t v182 = v181[2];
                    }
                    *(void *)(v179 + 16) = v182;
                    *(void *)(v181[2] + 8 * (*(void *)v181[2] != (void)v181)) = v179;
                    *(void *)(v179 + 8) = v181;
                    v181[2] = v179;
                    uint64_t v182 = *(void *)(v179 + 16);
                    *(unsigned char *)(v179 + 24) = 1;
                    *(unsigned char *)(v182 + 24) = 0;
                    int v181 = *(uint64_t **)(v182 + 8);
                    uint64_t v192 = *v181;
                    *(void *)(v182 + 8) = *v181;
                    if (v192) {
LABEL_348:
                    }
                      *(void *)(v192 + 16) = v182;
                  }
                  else
                  {
                    *((unsigned char *)v181 + 24) = 1;
                    *(unsigned char *)(v182 + 24) = 0;
                    int v181 = *(uint64_t **)(v182 + 8);
                    uint64_t v192 = *v181;
                    *(void *)(v182 + 8) = *v181;
                    if (v192) {
                      goto LABEL_348;
                    }
                  }
                  v181[2] = *(void *)(v182 + 16);
                  *(void *)(*(void *)(v182 + 16) + 8 * (**(void **)(v182 + 16) != v182)) = v181;
                  uint64_t *v181 = v182;
                  goto LABEL_350;
                }
                *((unsigned char *)v181 + 24) = 1;
                uint64_t v179 = v182;
                *(unsigned char *)(v182 + 24) = v182 == v180;
                *int v184 = 1;
              }
              while (v182 != v180);
            }
            ++v368;
            int v191 = *((char *)v177 + 79);
            if ((v191 & 0x80000000) == 0) {
              goto LABEL_352;
            }
LABEL_344:
            if (!v177[8]) {
              goto LABEL_415;
            }
LABEL_353:
            v193 = sub_10000369C(v105, (uint64_t)"\t", 1);
            uint64_t v194 = *v193;
            *(uint64_t *)((char *)v193 + *(void *)(*v193 - 24) + 24) = 16;
            *(_DWORD *)((char *)v193 + *(void *)(v194 - 24) + 8) = *(_DWORD *)((unsigned char *)v193
                                                                               + *(void *)(v194 - 24)
                                                                               + 8) & 0xFFFFFF4F | 0x80;
            uint64_t v195 = sub_10000369C(v193, (uint64_t)"- ", 2);
            uint64_t v196 = (uint64_t)v367;
            std::string::size_type v197 = (uint64_t *)&v367;
            v198 = (uint64_t *)&v367;
            if (!v367)
            {
LABEL_380:
              size_t v210 = operator new(0x50uLL);
              v105 = v329;
              int v211 = v210;
              size_t v212 = (void **)(v210 + 4);
              if (SHIBYTE(__p[2]) < 0)
              {
                sub_1000035FC(v212, __p[0], (unint64_t)__p[1]);
              }
              else
              {
                *(_OWORD *)size_t v212 = *(_OWORD *)__p;
                v212[2] = __p[2];
              }
              v211[7] = 0;
              v211[8] = 0;
              v211[9] = 0;
              *int v211 = 0;
              v211[1] = 0;
              v211[2] = (uint64_t)v198;
              *std::string::size_type v197 = (uint64_t)v211;
              int v213 = v211;
              if (*v366)
              {
                std::string::size_type v366 = (uint64_t *)*v366;
                int v213 = (uint64_t *)*v197;
              }
              uint64_t v214 = (uint64_t)v367;
              *((unsigned char *)v213 + 24) = v213 == (uint64_t *)v367;
              if (v213 != (uint64_t *)v214)
              {
                do
                {
                  uint64_t v215 = v213[2];
                  if (*(unsigned char *)(v215 + 24)) {
                    break;
                  }
                  uint64_t v216 = *(void *)(v215 + 16);
                  uint64_t v217 = *(void *)v216;
                  if (*(void *)v216 == v215)
                  {
                    uint64_t v220 = *(void *)(v216 + 8);
                    if (!v220 || (v221 = *(unsigned __int8 *)(v220 + 24), std::string::size_type v218 = (unsigned char *)(v220 + 24), v221))
                    {
                      if (*(uint64_t **)v215 == v213)
                      {
                        *(unsigned char *)(v215 + 24) = 1;
                        *(unsigned char *)(v216 + 24) = 0;
                        uint64_t v224 = *(void *)(v215 + 8);
                        *(void *)uint64_t v216 = v224;
                        if (v224) {
                          goto LABEL_399;
                        }
                      }
                      else
                      {
                        uint64_t v222 = *(uint64_t **)(v215 + 8);
                        uint64_t v223 = *v222;
                        *(void *)(v215 + 8) = *v222;
                        if (v223)
                        {
                          *(void *)(v223 + 16) = v215;
                          uint64_t v216 = *(void *)(v215 + 16);
                        }
                        v222[2] = v216;
                        *(void *)(*(void *)(v215 + 16) + 8 * (**(void **)(v215 + 16) != v215)) = v222;
                        *uint64_t v222 = v215;
                        *(void *)(v215 + 16) = v222;
                        uint64_t v216 = v222[2];
                        uint64_t v215 = *(void *)v216;
                        *((unsigned char *)v222 + 24) = 1;
                        *(unsigned char *)(v216 + 24) = 0;
                        uint64_t v224 = *(void *)(v215 + 8);
                        *(void *)uint64_t v216 = v224;
                        if (v224) {
LABEL_399:
                        }
                          *(void *)(v224 + 16) = v216;
                      }
                      *(void *)(v215 + 16) = *(void *)(v216 + 16);
                      *(void *)(*(void *)(v216 + 16) + 8 * (**(void **)(v216 + 16) != v216)) = v215;
                      *(void *)(v215 + 8) = v216;
LABEL_406:
                      *(void *)(v216 + 16) = v215;
                      break;
                    }
                  }
                  else if (!v217 || (int v219 = *(unsigned __int8 *)(v217 + 24), v218 = (unsigned char *)(v217 + 24), v219))
                  {
                    if (*(uint64_t **)v215 == v213)
                    {
                      uint64_t v236 = v213[1];
                      *(void *)uint64_t v215 = v236;
                      if (v236)
                      {
                        *(void *)(v236 + 16) = v215;
                        uint64_t v216 = *(void *)(v215 + 16);
                      }
                      v213[2] = v216;
                      *(void *)(*(void *)(v215 + 16) + 8 * (**(void **)(v215 + 16) != v215)) = v213;
                      v213[1] = v215;
                      *(void *)(v215 + 16) = v213;
                      uint64_t v216 = v213[2];
                      *((unsigned char *)v213 + 24) = 1;
                      *(unsigned char *)(v216 + 24) = 0;
                      uint64_t v215 = *(void *)(v216 + 8);
                      int v225 = *(uint64_t **)v215;
                      *(void *)(v216 + 8) = *(void *)v215;
                      if (v225) {
LABEL_404:
                      }
                        v225[2] = v216;
                    }
                    else
                    {
                      *(unsigned char *)(v215 + 24) = 1;
                      *(unsigned char *)(v216 + 24) = 0;
                      uint64_t v215 = *(void *)(v216 + 8);
                      int v225 = *(uint64_t **)v215;
                      *(void *)(v216 + 8) = *(void *)v215;
                      if (v225) {
                        goto LABEL_404;
                      }
                    }
                    *(void *)(v215 + 16) = *(void *)(v216 + 16);
                    *(void *)(*(void *)(v216 + 16) + 8 * (**(void **)(v216 + 16) != v216)) = v215;
                    *(void *)uint64_t v215 = v216;
                    goto LABEL_406;
                  }
                  *(unsigned char *)(v215 + 24) = 1;
                  int v213 = (uint64_t *)v216;
                  *(unsigned char *)(v216 + 24) = v216 == v214;
                  *std::string::size_type v218 = 1;
                }
                while (v216 != v214);
              }
              ++v368;
LABEL_408:
              uint64_t v228 = v211[7];
              unint64_t v227 = v211 + 7;
              uint64_t v226 = v228;
              int v229 = *((char *)v227 + 23);
              if (v229 >= 0) {
                uint64_t v230 = (uint64_t)v227;
              }
              else {
                uint64_t v230 = v226;
              }
              if (v229 >= 0) {
                uint64_t v231 = *((unsigned __int8 *)v227 + 23);
              }
              else {
                uint64_t v231 = v227[1];
              }
              sub_10000369C(v195, v230, v231);
              goto LABEL_415;
            }
            if (SHIBYTE(__p[2]) >= 0) {
              int v199 = __p;
            }
            else {
              int v199 = (void **)__p[0];
            }
            if (SHIBYTE(__p[2]) >= 0) {
              v200 = (void *)HIBYTE(__p[2]);
            }
            else {
              v200 = __p[1];
            }
            while (1)
            {
              v198 = (uint64_t *)v196;
              int v203 = *(const void **)(v196 + 32);
              uint64_t v201 = v196 + 32;
              size_t v202 = v203;
              int v204 = *(char *)(v201 + 23);
              if (v204 >= 0) {
                v205 = (const void *)v201;
              }
              else {
                v205 = v202;
              }
              if (v204 >= 0) {
                size_t v206 = *(unsigned __int8 *)(v201 + 23);
              }
              else {
                size_t v206 = *(void *)(v201 + 8);
              }
              if (v206 >= (unint64_t)v200) {
                size_t v207 = (size_t)v200;
              }
              else {
                size_t v207 = v206;
              }
              int v208 = memcmp(v199, v205, v207);
              if (v208)
              {
                if (v208 < 0) {
                  goto LABEL_360;
                }
              }
              else if ((unint64_t)v200 < v206)
              {
LABEL_360:
                uint64_t v196 = *v198;
                std::string::size_type v197 = v198;
                if (!*v198) {
                  goto LABEL_380;
                }
                continue;
              }
              int v209 = memcmp(v205, v199, v207);
              if (v209)
              {
                if ((v209 & 0x80000000) == 0) {
                  goto LABEL_401;
                }
              }
              else if (v206 >= (unint64_t)v200)
              {
LABEL_401:
                int v211 = v198;
                v105 = v329;
                goto LABEL_408;
              }
              uint64_t v196 = v198[1];
              if (!v196)
              {
                std::string::size_type v197 = v198 + 1;
                goto LABEL_380;
              }
            }
          }
          if (SHIBYTE(__p[2]) >= 0) {
            size_t v165 = __p;
          }
          else {
            size_t v165 = (void **)__p[0];
          }
          if (SHIBYTE(__p[2]) >= 0) {
            size_t v166 = (void *)HIBYTE(__p[2]);
          }
          else {
            size_t v166 = __p[1];
          }
          while (1)
          {
            long long v164 = (uint64_t *)v162;
            v169 = *(const void **)(v162 + 32);
            uint64_t v167 = v162 + 32;
            std::string::size_type v168 = v169;
            int v170 = *(char *)(v167 + 23);
            if (v170 >= 0) {
              uint64_t v171 = (const void *)v167;
            }
            else {
              uint64_t v171 = v168;
            }
            if (v170 >= 0) {
              size_t v172 = *(unsigned __int8 *)(v167 + 23);
            }
            else {
              size_t v172 = *(void *)(v167 + 8);
            }
            if (v172 >= (unint64_t)v166) {
              size_t v173 = (size_t)v166;
            }
            else {
              size_t v173 = v172;
            }
            int v174 = memcmp(v165, v171, v173);
            if (v174)
            {
              if (v174 < 0) {
                goto LABEL_302;
              }
LABEL_316:
              int v175 = memcmp(v171, v165, v173);
              if (v175)
              {
                if ((v175 & 0x80000000) == 0) {
                  goto LABEL_343;
                }
              }
              else if (v172 >= (unint64_t)v166)
              {
LABEL_343:
                v177 = v164;
                v105 = v329;
                int v191 = *((char *)v164 + 79);
                if (v191 < 0) {
                  goto LABEL_344;
                }
LABEL_352:
                if ((_BYTE)v191) {
                  goto LABEL_353;
                }
LABEL_415:
                std::ios_base::getloc((const std::ios_base *)((char *)v105 + *((void *)v349[2].__locale_ - 3)));
                v232 = std::locale::use_facet((const std::locale *)__dst, &std::ctype<char>::id);
                ((void (*)(const std::locale::facet *, uint64_t))v232->__vftable[2].~facet_0)(v232, 10);
                std::locale::~locale((std::locale *)__dst);
                std::ostream::put();
                std::ostream::flush();
                if (SHIBYTE(__p[2]) < 0)
                {
                  operator delete(__p[0]);
                  v233 = (char *)v107[1];
                  if (v233) {
                    goto LABEL_419;
                  }
                  do
                  {
LABEL_421:
                    v234 = (char **)v107[2];
                    BOOL v46 = *v234 == (char *)v107;
                    v107 = (uint64_t *)v234;
                  }
                  while (!v46);
                }
                else
                {
                  v233 = (char *)v107[1];
                  if (!v233) {
                    goto LABEL_421;
                  }
                  do
                  {
LABEL_419:
                    v234 = (char **)v233;
                    v233 = *(char **)v233;
                  }
                  while (v233);
                }
                v107 = (uint64_t *)v234;
                if (v234 == &v373) {
                  break;
                }
                goto LABEL_286;
              }
              uint64_t v162 = v164[1];
              if (!v162)
              {
                int v163 = v164 + 1;
                goto LABEL_322;
              }
            }
            else
            {
              if ((unint64_t)v166 >= v172) {
                goto LABEL_316;
              }
LABEL_302:
              uint64_t v162 = *v164;
              int v163 = v164;
              if (!*v164) {
                goto LABEL_322;
              }
            }
          }
        }
        if (!v371) {
          goto LABEL_485;
        }
        uint64_t v108 = sub_10000369C(v105, (uint64_t)"\t\t\t\t", 4);
        uint64_t v109 = *v108;
        *(uint64_t *)((char *)v108 + *(void *)(*v108 - 24) + 24) = 20;
        *(_DWORD *)((char *)v108 + *(void *)(v109 - 24) + 8) = *(_DWORD *)((unsigned char *)v108 + *(void *)(v109 - 24) + 8) & 0xFFFFFF4F | 0x20;
        sub_10000369C(v108, (uint64_t)"sub-commands", 12);
        v110 = sub_10000369C(v105, (uint64_t)"\t", 1);
        uint64_t v111 = *v110;
        *(uint64_t *)((char *)v110 + *(void *)(*v110 - 24) + 24) = 16;
        *(_DWORD *)((char *)v110 + *(void *)(v111 - 24) + 8) = *(_DWORD *)((unsigned char *)v110 + *(void *)(v111 - 24) + 8) & 0xFFFFFF4F | 0x80;
        sub_10000369C(v110, (uint64_t)"- ", 2);
        unint64_t v348 = 0xAAAAAAAAAAAAAAAALL;
        *(void *)&long long v112 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v112 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v346 = v112;
        long long v347 = v112;
        long long v344 = v112;
        long long v345 = v112;
        long long v342 = v112;
        long long v343 = v112;
        long long v340 = v112;
        long long v341 = v112;
        long long v338 = v112;
        long long v339 = v112;
        *(_OWORD *)v336 = v112;
        long long v337 = v112;
        long long v334 = v112;
        long long v335 = v112;
        *(_OWORD *)&__p[2] = v112;
        long long v333 = v112;
        *(_OWORD *)std::string __p = v112;
        sub_1000129F4((uint64_t)__p);
        sub_10000369C(&__p[2], (uint64_t)"[ ", 2);
        size_t v113 = (uint64_t *)v369;
        if (v369 != (uint64_t **)&v370)
        {
          do
          {
            unint64_t v331 = 0xAAAAAAAAAAAAAAAALL;
            *(void *)&long long v237 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v237 + 1) = 0xAAAAAAAAAAAAAAAALL;
            *(_OWORD *)long long __dst = v237;
            *(_OWORD *)&__dst[16] = v237;
            if (*((char *)v113 + 55) < 0)
            {
              sub_1000035FC(__dst, (void *)v113[4], v113[5]);
            }
            else
            {
              *(_OWORD *)long long __dst = *((_OWORD *)v113 + 2);
              *(void *)&__dst[16] = v113[6];
            }
            unint64_t v238 = v113[8];
            *(void *)&__dst[24] = v113[7];
            unint64_t v331 = v238;
            if (v238) {
              atomic_fetch_add_explicit((atomic_ullong *volatile)(v238 + 8), 1uLL, memory_order_relaxed);
            }
            if (__dst[23] >= 0) {
              uint64_t v239 = __dst;
            }
            else {
              uint64_t v239 = *(unsigned char **)__dst;
            }
            if (__dst[23] >= 0) {
              uint64_t v240 = __dst[23];
            }
            else {
              uint64_t v240 = *(void *)&__dst[8];
            }
            v241 = sub_10000369C(&__p[2], (uint64_t)v239, v240);
            sub_10000369C(v241, (uint64_t)" | ", 3);
            std::string::size_type v242 = (std::__shared_weak_count *)v331;
            if (v331 && !atomic_fetch_add((atomic_ullong *volatile)(v331 + 8), 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v242->__on_zero_shared)(v242);
              std::__shared_weak_count::__release_weak(v242);
              if ((__dst[23] & 0x80000000) == 0)
              {
LABEL_451:
                int v243 = (uint64_t *)v113[1];
                if (v243) {
                  goto LABEL_455;
                }
                goto LABEL_457;
              }
            }
            else if ((__dst[23] & 0x80000000) == 0)
            {
              goto LABEL_451;
            }
            operator delete(*(void **)__dst);
            int v243 = (uint64_t *)v113[1];
            if (v243)
            {
              do
              {
LABEL_455:
                size_t v244 = v243;
                int v243 = (uint64_t *)*v243;
              }
              while (v243);
              goto LABEL_436;
            }
            do
            {
LABEL_457:
              size_t v244 = (uint64_t *)v113[2];
              BOOL v46 = *v244 == (void)v113;
              size_t v113 = v244;
            }
            while (!v46);
LABEL_436:
            size_t v113 = v244;
          }
          while (v244 != (uint64_t *)&v370);
        }
        memset(__dst, 170, 24);
        if ((BYTE8(v338) & 0x10) != 0)
        {
          uint64_t v245 = v338;
          size_t v246 = (const void **)&v335;
          if ((unint64_t)v338 < *((void *)&v335 + 1))
          {
            *(void *)&long long v338 = *((void *)&v335 + 1);
            uint64_t v245 = *((void *)&v335 + 1);
            size_t v246 = (const void **)&v335;
          }
        }
        else
        {
          if ((BYTE8(v338) & 8) == 0)
          {
            size_t v114 = 0;
            __dst[23] = 0;
            v115 = __dst;
            goto LABEL_471;
          }
          uint64_t v245 = *((void *)&v334 + 1);
          size_t v246 = (const void **)&v333 + 1;
        }
        unint64_t v247 = *v246;
        size_t v114 = v245 - (void)*v246;
        if (v114 > 0x7FFFFFFFFFFFFFF7) {
          sub_100003540();
        }
        if (v114 >= 0x17)
        {
          uint64_t v248 = (v114 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v114 | 7) != 0x17) {
            uint64_t v248 = v114 | 7;
          }
          uint64_t v249 = v248 + 1;
          v115 = operator new(v248 + 1);
          *(void *)&__dst[8] = v114;
          *(void *)&__dst[16] = v249 | 0x8000000000000000;
          *(void *)long long __dst = v115;
          goto LABEL_470;
        }
        __dst[23] = v245 - *(unsigned char *)v246;
        v115 = __dst;
        if (v114) {
LABEL_470:
        }
          memmove(v115, v247, v114);
LABEL_471:
        v115[v114] = 0;
        uint64_t v250 = __dst[23];
        if (__dst[23] >= 0)
        {
          v251 = __dst;
        }
        else
        {
          uint64_t v250 = *(void *)&__dst[8];
          v251 = *(unsigned char **)__dst;
        }
        v251[v250 - 2] = 93;
        if (__dst[23] >= 0) {
          v252 = __dst;
        }
        else {
          v252 = *(unsigned char **)__dst;
        }
        if (__dst[23] >= 0) {
          uint64_t v253 = __dst[23];
        }
        else {
          uint64_t v253 = *(void *)&__dst[8];
        }
        v254 = sub_10000369C(v329, (uint64_t)v252, v253);
        std::ios_base::getloc((const std::ios_base *)((char *)v254 + *(void *)(*v254 - 24)));
        std::string::size_type v255 = std::locale::use_facet(&v380, &std::ctype<char>::id);
        ((void (*)(const std::locale::facet *, uint64_t))v255->__vftable[2].~facet_0)(v255, 10);
        std::locale::~locale(&v380);
        std::ostream::put();
        std::ostream::flush();
        if ((__dst[23] & 0x80000000) != 0) {
          operator delete(*(void **)__dst);
        }
        __p[0] = v325;
        *(void **)((char *)__p + *((void *)v325 - 3)) = v324;
        __p[2] = v323;
        if (SHIBYTE(v337) < 0) {
          operator delete(v336[1]);
        }
        std::streambuf::~streambuf();
        std::iostream::~basic_iostream();
        std::ios::~ios();
LABEL_485:
        char v256 = sub_10000369C(&std::cout, (uint64_t)"\t", 1);
        uint64_t v257 = *v256;
        *(uint64_t *)((char *)v256 + *(void *)(*v256 - 24) + 24) = 16;
        *(_DWORD *)((char *)v256 + *(void *)(v257 - 24) + 8) = *(_DWORD *)((unsigned char *)v256 + *(void *)(v257 - 24) + 8) & 0xFFFFFF4F | 0x80;
        int v258 = *((char *)v375 + 63);
        if (v258 >= 0) {
          uint64_t v259 = (uint64_t)(v375 + 5);
        }
        else {
          uint64_t v259 = v375[5];
        }
        if (v258 >= 0) {
          uint64_t v260 = *((unsigned __int8 *)v375 + 63);
        }
        else {
          uint64_t v260 = v375[6];
        }
        v261 = sub_10000369C(v256, v259, v260);
        uint64_t v262 = sub_10000369C(v261, (uint64_t)":", 1);
        if ((BYTE8(v355) & 0x10) != 0)
        {
          uint64_t v265 = v355;
          v266 = (const void **)&v352;
          if ((unint64_t)v355 < *((void *)&v352 + 1))
          {
            *(void *)&long long v355 = *((void *)&v352 + 1);
            uint64_t v265 = *((void *)&v352 + 1);
            v266 = (const void **)&v352;
          }
        }
        else
        {
          if ((BYTE8(v355) & 8) == 0)
          {
            size_t v263 = 0;
            HIBYTE(__p[2]) = 0;
            v264 = __p;
            goto LABEL_505;
          }
          uint64_t v265 = *((void *)&v351 + 1);
          v266 = (const void **)&v350 + 1;
        }
        int v267 = *v266;
        size_t v263 = v265 - (void)*v266;
        if (v263 > 0x7FFFFFFFFFFFFFF7) {
          sub_100003540();
        }
        if (v263 >= 0x17)
        {
          uint64_t v268 = (v263 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v263 | 7) != 0x17) {
            uint64_t v268 = v263 | 7;
          }
          uint64_t v269 = v268 + 1;
          v264 = operator new(v268 + 1);
          __p[1] = (void *)v263;
          __p[2] = (void *)(v269 | 0x8000000000000000);
          __p[0] = v264;
          goto LABEL_504;
        }
        HIBYTE(__p[2]) = v265 - *(unsigned char *)v266;
        v264 = __p;
        if (v263) {
LABEL_504:
        }
          memmove(v264, v267, v263);
LABEL_505:
        *((unsigned char *)v264 + v263) = 0;
        if (SHIBYTE(__p[2]) >= 0) {
          v270 = __p;
        }
        else {
          v270 = (void **)__p[0];
        }
        if (SHIBYTE(__p[2]) >= 0) {
          uint64_t v271 = HIBYTE(__p[2]);
        }
        else {
          uint64_t v271 = (uint64_t)__p[1];
        }
        uint64_t v272 = sub_10000369C(v262, (uint64_t)v270, v271);
        std::ios_base::getloc((const std::ios_base *)((char *)v272 + *(void *)(*v272 - 24)));
        v273 = std::locale::use_facet((const std::locale *)__dst, &std::ctype<char>::id);
        ((void (*)(const std::locale::facet *, uint64_t))v273->__vftable[2].~facet_0)(v273, 10);
        std::locale::~locale((std::locale *)__dst);
        std::ostream::put();
        std::ostream::flush();
        if (SHIBYTE(__p[2]) < 0) {
          operator delete(__p[0]);
        }
        v349[0].__locale_ = (std::locale::__imp *)v325;
        *(std::locale::__imp **)((char *)&v349[0].__locale_ + *((void *)v325 - 3)) = (std::locale::__imp *)v324;
        v349[2].__locale_ = (std::locale::__imp *)v323;
        if (SHIBYTE(v354) < 0) {
          operator delete(v353[1]);
        }
        std::streambuf::~streambuf();
        std::iostream::~basic_iostream();
        std::ios::~ios();
        sub_100004A14((uint64_t)&v366, (uint64_t)v367);
        sub_10000E6C8((uint64_t)&v369, (uint64_t)v370);
        sub_10000E644((uint64_t)&v372, v373);
        uint64_t v274 = v376;
        if (v376 && !atomic_fetch_add(&v376->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v274->__on_zero_shared)(v274);
          std::__shared_weak_count::__release_weak(v274);
          v275 = (std::__shared_weak_count *)v379;
          if (v379) {
            goto LABEL_518;
          }
        }
        else
        {
          v275 = (std::__shared_weak_count *)v379;
          if (v379)
          {
LABEL_518:
            if (!atomic_fetch_add(&v275->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v275->__on_zero_shared)(v275);
              std::__shared_weak_count::__release_weak(v275);
            }
          }
        }
        if (SBYTE7(v378) < 0)
        {
          operator delete(v377[0].__locale_);
          long long v276 = v326;
          v277 = (char *)*((void *)v326 + 1);
          if (v277) {
            goto LABEL_525;
          }
          do
          {
LABEL_527:
            long long v278 = (char *)*((void *)v276 + 2);
            BOOL v46 = *(void *)v278 == (void)v276;
            long long v276 = v278;
          }
          while (!v46);
        }
        else
        {
          long long v276 = v326;
          v277 = (char *)*((void *)v326 + 1);
          if (!v277) {
            goto LABEL_527;
          }
          do
          {
LABEL_525:
            long long v278 = v277;
            v277 = *(char **)v277;
          }
          while (v277);
        }
        size_t v52 = v278;
        if (v278 == v322) {
          goto LABEL_530;
        }
      }
LABEL_97:
      v349[0].__locale_ = (std::locale::__imp *)0xAAAAAAAAAAAAAAAALL;
      __p[0] = (void *)0xAAAAAAAAAAAAAAAALL;
      unint64_t v60 = sub_100013C00((uint64_t **)&v372, (uint64_t *)&v373, (uint64_t **)v349, (uint64_t **)__p, v56 + 4);
      if (*v60)
      {
        v61 = (const void **)v56[1];
        if (!v61) {
          goto LABEL_128;
        }
        goto LABEL_122;
      }
      long long v62 = (char *)operator new(0x38uLL);
      v63 = v62 + 32;
      if (*((char *)v56 + 55) < 0)
      {
        sub_1000035FC(v63, (void *)v56[4], (unint64_t)v56[5]);
      }
      else
      {
        long long v64 = *((_OWORD *)v56 + 2);
        *((void *)v62 + 6) = v56[6];
        *(_OWORD *)v63 = v64;
      }
      char v65 = v349[0].__locale_;
      *(void *)long long v62 = 0;
      *((void *)v62 + 1) = 0;
      *((void *)v62 + 2) = v65;
      *unint64_t v60 = (uint64_t)v62;
      if (*v372)
      {
        BOOL v372 = (uint64_t **)*v372;
        long long v62 = (char *)*v60;
      }
      size_t v66 = v373;
      v62[24] = v62 == v373;
      if (v62 == v66)
      {
LABEL_121:
        ++v374;
        v61 = (const void **)v56[1];
        if (!v61) {
          goto LABEL_128;
        }
        goto LABEL_122;
      }
      while (1)
      {
        uint64_t v67 = *((void *)v62 + 2);
        if (*(unsigned char *)(v67 + 24)) {
          goto LABEL_121;
        }
        v68 = *(char **)(v67 + 16);
        uint64_t v69 = *(void *)v68;
        if (*(void *)v68 == v67)
        {
          uint64_t v72 = *((void *)v68 + 1);
          if (!v72 || (int v73 = *(unsigned __int8 *)(v72 + 24), v70 = (unsigned char *)(v72 + 24), v73))
          {
            if (*(char **)v67 == v62)
            {
              *(unsigned char *)(v67 + 24) = 1;
              v68[24] = 0;
              uint64_t v76 = *(void *)(v67 + 8);
              *(void *)v68 = v76;
              if (v76) {
                goto LABEL_119;
              }
            }
            else
            {
              uint64_t v74 = *(uint64_t **)(v67 + 8);
              uint64_t v75 = *v74;
              *(void *)(v67 + 8) = *v74;
              if (v75)
              {
                *(void *)(v75 + 16) = v67;
                v68 = *(char **)(v67 + 16);
              }
              v74[2] = (uint64_t)v68;
              *(void *)(*(void *)(v67 + 16) + 8 * (**(void **)(v67 + 16) != v67)) = v74;
              *uint64_t v74 = v67;
              *(void *)(v67 + 16) = v74;
              v68 = (char *)v74[2];
              uint64_t v67 = *(void *)v68;
              *((unsigned char *)v74 + 24) = 1;
              v68[24] = 0;
              uint64_t v76 = *(void *)(v67 + 8);
              *(void *)v68 = v76;
              if (v76) {
LABEL_119:
              }
                *(void *)(v76 + 16) = v68;
            }
            *(void *)(v67 + 16) = *((void *)v68 + 2);
            *(void *)(*((void *)v68 + 2) + 8 * (**((void **)v68 + 2) != (void)v68)) = v67;
            *(void *)(v67 + 8) = v68;
            *((void *)v68 + 2) = v67;
            goto LABEL_121;
          }
        }
        else if (!v69 || (int v71 = *(unsigned __int8 *)(v69 + 24), v70 = (unsigned char *)(v69 + 24), v71))
        {
          if (*(char **)v67 == v62)
          {
            uint64_t v80 = *((void *)v62 + 1);
            *(void *)uint64_t v67 = v80;
            if (v80)
            {
              *(void *)(v80 + 16) = v67;
              v68 = *(char **)(v67 + 16);
            }
            *((void *)v62 + 2) = v68;
            *(void *)(*(void *)(v67 + 16) + 8 * (**(void **)(v67 + 16) != v67)) = v62;
            *((void *)v62 + 1) = v67;
            *(void *)(v67 + 16) = v62;
            v68 = (char *)*((void *)v62 + 2);
            v62[24] = 1;
            v68[24] = 0;
            v78 = (char **)*((void *)v68 + 1);
            int v79 = *v78;
            *((void *)v68 + 1) = *v78;
            if (v79) {
LABEL_126:
            }
              *((void *)v79 + 2) = v68;
          }
          else
          {
            *(unsigned char *)(v67 + 24) = 1;
            v68[24] = 0;
            v78 = (char **)*((void *)v68 + 1);
            int v79 = *v78;
            *((void *)v68 + 1) = *v78;
            if (v79) {
              goto LABEL_126;
            }
          }
          v78[2] = (char *)*((void *)v68 + 2);
          *(void *)(*((void *)v68 + 2) + 8 * (**((void **)v68 + 2) != (void)v68)) = v78;
          std::string *v78 = v68;
          *((void *)v68 + 2) = v78;
          ++v374;
          v61 = (const void **)v56[1];
          if (!v61)
          {
            do
            {
LABEL_128:
              v77 = (const void ***)v56[2];
              BOOL v46 = *v77 == v56;
              int v56 = (const void **)v77;
            }
            while (!v46);
            goto LABEL_96;
          }
          do
          {
LABEL_122:
            v77 = (const void ***)v61;
            v61 = (const void **)*v61;
          }
          while (v61);
LABEL_96:
          int v56 = (const void **)v77;
          if (v77 == v57)
          {
            v54 = v375;
            uint64_t v370 = 0;
            uint64_t v371 = 0;
            v369 = (uint64_t **)&v370;
            long long v58 = (const void **)v375[20];
            v59 = (const void ***)(v375 + 21);
            if (v58 == v375 + 21) {
              goto LABEL_183;
            }
LABEL_140:
            v349[0].__locale_ = (std::locale::__imp *)0xAAAAAAAAAAAAAAAALL;
            __p[0] = (void *)0xAAAAAAAAAAAAAAAALL;
            size_t v81 = sub_100013C00((uint64_t **)&v369, (uint64_t *)&v370, (uint64_t **)v349, (uint64_t **)__p, v58 + 4);
            if (*v81)
            {
              size_t v82 = (const void **)v58[1];
              if (!v82) {
                goto LABEL_173;
              }
              goto LABEL_167;
            }
            uint64_t v83 = (char *)operator new(0x48uLL);
            uint64_t v84 = v83 + 32;
            if (*((char *)v58 + 55) < 0)
            {
              sub_1000035FC(v84, (void *)v58[4], (unint64_t)v58[5]);
            }
            else
            {
              long long v85 = *((_OWORD *)v58 + 2);
              *((void *)v83 + 6) = v58[6];
              *(_OWORD *)uint64_t v84 = v85;
            }
            *((void *)v83 + 7) = v58[7];
            size_t v86 = (atomic_ullong *)v58[8];
            *((void *)v83 + 8) = v86;
            if (v86) {
              atomic_fetch_add_explicit(v86 + 1, 1uLL, memory_order_relaxed);
            }
            size_t v87 = v349[0].__locale_;
            *(void *)uint64_t v83 = 0;
            *((void *)v83 + 1) = 0;
            *((void *)v83 + 2) = v87;
            *size_t v81 = (uint64_t)v83;
            if (*v369)
            {
              v369 = (uint64_t **)*v369;
              uint64_t v83 = (char *)*v81;
            }
            uint64_t v88 = (uint64_t)v370;
            v83[24] = v83 == v370;
            if (v83 == (char *)v88)
            {
LABEL_166:
              ++v371;
              size_t v82 = (const void **)v58[1];
              if (!v82) {
                goto LABEL_173;
              }
              goto LABEL_167;
            }
            while (1)
            {
              uint64_t v89 = *((void *)v83 + 2);
              if (*(unsigned char *)(v89 + 24)) {
                goto LABEL_166;
              }
              uint64_t v90 = *(unsigned char **)(v89 + 16);
              uint64_t v91 = *(void *)v90;
              if (*(void *)v90 == v89)
              {
                uint64_t v94 = *((void *)v90 + 1);
                if (!v94 || (v95 = *(unsigned __int8 *)(v94 + 24), uint64_t v92 = (unsigned char *)(v94 + 24), v95))
                {
                  if (*(char **)v89 == v83)
                  {
                    *(unsigned char *)(v89 + 24) = 1;
                    v90[24] = 0;
                    uint64_t v98 = *(void *)(v89 + 8);
                    *(void *)uint64_t v90 = v98;
                    if (v98) {
                      goto LABEL_164;
                    }
                  }
                  else
                  {
                    unint64_t v96 = *(uint64_t **)(v89 + 8);
                    uint64_t v97 = *v96;
                    *(void *)(v89 + 8) = *v96;
                    if (v97)
                    {
                      *(void *)(v97 + 16) = v89;
                      uint64_t v90 = *(unsigned char **)(v89 + 16);
                    }
                    v96[2] = (uint64_t)v90;
                    *(void *)(*(void *)(v89 + 16) + 8 * (**(void **)(v89 + 16) != v89)) = v96;
                    *unint64_t v96 = v89;
                    *(void *)(v89 + 16) = v96;
                    uint64_t v90 = (unsigned char *)v96[2];
                    uint64_t v89 = *(void *)v90;
                    *((unsigned char *)v96 + 24) = 1;
                    v90[24] = 0;
                    uint64_t v98 = *(void *)(v89 + 8);
                    *(void *)uint64_t v90 = v98;
                    if (v98) {
LABEL_164:
                    }
                      *(void *)(v98 + 16) = v90;
                  }
                  *(void *)(v89 + 16) = *((void *)v90 + 2);
                  *(void *)(*((void *)v90 + 2) + 8 * (**((void **)v90 + 2) != (void)v90)) = v89;
                  *(void *)(v89 + 8) = v90;
                  *((void *)v90 + 2) = v89;
                  goto LABEL_166;
                }
              }
              else if (!v91 || (v93 = *(unsigned __int8 *)(v91 + 24), uint64_t v92 = (unsigned char *)(v91 + 24), v93))
              {
                if (*(char **)v89 == v83)
                {
                  uint64_t v102 = *((void *)v83 + 1);
                  *(void *)uint64_t v89 = v102;
                  if (v102)
                  {
                    *(void *)(v102 + 16) = v89;
                    uint64_t v90 = *(unsigned char **)(v89 + 16);
                  }
                  *((void *)v83 + 2) = v90;
                  *(void *)(*(void *)(v89 + 16) + 8 * (**(void **)(v89 + 16) != v89)) = v83;
                  *((void *)v83 + 1) = v89;
                  *(void *)(v89 + 16) = v83;
                  uint64_t v90 = (unsigned char *)*((void *)v83 + 2);
                  v83[24] = 1;
                  v90[24] = 0;
                  int64_t v100 = (uint64_t *)*((void *)v90 + 1);
                  uint64_t v101 = *v100;
                  *((void *)v90 + 1) = *v100;
                  if (v101) {
LABEL_171:
                  }
                    *(void *)(v101 + 16) = v90;
                }
                else
                {
                  *(unsigned char *)(v89 + 24) = 1;
                  v90[24] = 0;
                  int64_t v100 = (uint64_t *)*((void *)v90 + 1);
                  uint64_t v101 = *v100;
                  *((void *)v90 + 1) = *v100;
                  if (v101) {
                    goto LABEL_171;
                  }
                }
                v100[2] = *((void *)v90 + 2);
                *(void *)(*((void *)v90 + 2) + 8 * (**((void **)v90 + 2) != (void)v90)) = v100;
                *int64_t v100 = (uint64_t)v90;
                *((void *)v90 + 2) = v100;
                ++v371;
                size_t v82 = (const void **)v58[1];
                if (!v82)
                {
                  do
                  {
LABEL_173:
                    v99 = (const void ***)v58[2];
                    BOOL v46 = *v99 == v58;
                    long long v58 = (const void **)v99;
                  }
                  while (!v46);
                  goto LABEL_139;
                }
                do
                {
LABEL_167:
                  v99 = (const void ***)v82;
                  size_t v82 = (const void **)*v82;
                }
                while (v82);
LABEL_139:
                long long v58 = (const void **)v99;
                if (v99 == v59)
                {
                  v54 = v375;
                  goto LABEL_183;
                }
                goto LABEL_140;
              }
              *(unsigned char *)(v89 + 24) = 1;
              uint64_t v83 = v90;
              v90[24] = v90 == (unsigned char *)v88;
              *uint64_t v92 = 1;
              if (v90 == (unsigned char *)v88) {
                goto LABEL_166;
              }
            }
          }
          goto LABEL_97;
        }
        *(unsigned char *)(v67 + 24) = 1;
        long long v62 = v68;
        v68[24] = v68 == v66;
        unsigned char *v70 = 1;
        if (v68 == v66) {
          goto LABEL_121;
        }
      }
    }
  }
LABEL_530:
  std::string::size_type v279 = sub_10000369C(&std::cout, (uint64_t)"\t", 1);
  uint64_t v280 = *v279;
  *(uint64_t *)((char *)v279 + *(void *)(*v279 - 24) + 24) = 16;
  *(_DWORD *)((char *)v279 + *(void *)(v280 - 24) + 8) = *(_DWORD *)((unsigned char *)v279 + *(void *)(v280 - 24) + 8) & 0xFFFFFF4F | 0x80;
  v281 = sub_10000369C(v279, (uint64_t)"help", 4);
  sub_10000369C(v281, (uint64_t)":", 1);
  size_t v282 = sub_10000369C(&std::cout, (uint64_t)"\t", 1);
  uint64_t v283 = *v282;
  *(uint64_t *)((char *)v282 + *(void *)(*v282 - 24) + 24) = 20;
  *(_DWORD *)((char *)v282 + *(void *)(v283 - 24) + 8) = *(_DWORD *)((unsigned char *)v282 + *(void *)(v283 - 24) + 8) & 0xFFFFFF4F | 0x20;
  int v284 = sub_10000369C(v282, (uint64_t)"print this help message", 23);
  std::ios_base::getloc((const std::ios_base *)((char *)v284 + *(void *)(*v284 - 24)));
  long long v285 = std::locale::use_facet(v349, &std::ctype<char>::id);
  ((void (*)(const std::locale::facet *, uint64_t))v285->__vftable[2].~facet_0)(v285, 10);
  std::locale::~locale(v349);
  std::ostream::put();
  std::ostream::flush();
  if (a2)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)&std::cout
                                                + (unint64_t)std::cout.__vftable[-2].~basic_ostream_0));
    size_t v286 = std::locale::use_facet(v349, &std::ctype<char>::id);
    ((void (*)(const std::locale::facet *, uint64_t))v286->__vftable[2].~facet_0)(v286, 10);
    std::locale::~locale(v349);
    std::ostream::put();
    std::ostream::flush();
    size_t v287 = sub_10000369C(&std::cout, (uint64_t)"\t", 1);
    uint64_t v288 = *v287;
    *(uint64_t *)((char *)v287 + *(void *)(*v287 - 24) + 24) = 4;
    *(_DWORD *)((char *)v287 + *(void *)(v288 - 24) + 8) = *(_DWORD *)((unsigned char *)v287 + *(void *)(v288 - 24) + 8) & 0xFFFFFF4F | 0x80;
    v289 = sub_10000369C(v287, (uint64_t)"Shell commands:", 15);
    std::ios_base::getloc((const std::ios_base *)((char *)v289 + *(void *)(*v289 - 24)));
    v290 = std::locale::use_facet(v349, &std::ctype<char>::id);
    ((void (*)(const std::locale::facet *, uint64_t))v290->__vftable[2].~facet_0)(v290, 10);
    std::locale::~locale(v349);
    std::ostream::put();
    std::ostream::flush();
    std::string::size_type v291 = sub_10000369C(&std::cout, (uint64_t)"\t", 1);
    uint64_t v292 = *v291;
    *(uint64_t *)((char *)v291 + *(void *)(*v291 - 24) + 24) = 16;
    *(_DWORD *)((char *)v291 + *(void *)(v292 - 24) + 8) = *(_DWORD *)((unsigned char *)v291 + *(void *)(v292 - 24) + 8) & 0xFFFFFF4F | 0x80;
    uint64_t v293 = sub_10000369C(v291, (uint64_t)"cd", 2);
    sub_10000369C(v293, (uint64_t)":", 1);
    size_t v294 = sub_10000369C(&std::cout, (uint64_t)"\t", 1);
    uint64_t v295 = *v294;
    *(uint64_t *)((char *)v294 + *(void *)(*v294 - 24) + 24) = 20;
    *(_DWORD *)((char *)v294 + *(void *)(v295 - 24) + 8) = *(_DWORD *)((unsigned char *)v294 + *(void *)(v295 - 24) + 8) & 0xFFFFFF4F | 0x20;
    int v296 = sub_10000369C(v294, (uint64_t)"switch to <path>", 16);
    std::ios_base::getloc((const std::ios_base *)((char *)v296 + *(void *)(*v296 - 24)));
    v297 = std::locale::use_facet(v349, &std::ctype<char>::id);
    ((void (*)(const std::locale::facet *, uint64_t))v297->__vftable[2].~facet_0)(v297, 10);
    std::locale::~locale(v349);
    std::ostream::put();
    std::ostream::flush();
    char v298 = sub_10000369C(&std::cout, (uint64_t)"\t", 1);
    uint64_t v299 = *v298;
    *(uint64_t *)((char *)v298 + *(void *)(*v298 - 24) + 24) = 16;
    *(_DWORD *)((char *)v298 + *(void *)(v299 - 24) + 8) = *(_DWORD *)((unsigned char *)v298 + *(void *)(v299 - 24) + 8) & 0xFFFFFF4F | 0x80;
    v300 = sub_10000369C(v298, (uint64_t)"ls", 2);
    sub_10000369C(v300, (uint64_t)":", 1);
    char v301 = sub_10000369C(&std::cout, (uint64_t)"\t", 1);
    uint64_t v302 = *v301;
    *(uint64_t *)((char *)v301 + *(void *)(*v301 - 24) + 24) = 20;
    *(_DWORD *)((char *)v301 + *(void *)(v302 - 24) + 8) = *(_DWORD *)((unsigned char *)v301 + *(void *)(v302 - 24) + 8) & 0xFFFFFF4F | 0x20;
    size_t v303 = sub_10000369C(v301, (uint64_t)"list commands in current path", 29);
    std::ios_base::getloc((const std::ios_base *)((char *)v303 + *(void *)(*v303 - 24)));
    int v304 = std::locale::use_facet(v349, &std::ctype<char>::id);
    ((void (*)(const std::locale::facet *, uint64_t))v304->__vftable[2].~facet_0)(v304, 10);
    std::locale::~locale(v349);
    std::ostream::put();
    std::ostream::flush();
    std::string::size_type v305 = sub_10000369C(&std::cout, (uint64_t)"\t", 1);
    uint64_t v306 = *v305;
    *(uint64_t *)((char *)v305 + *(void *)(*v305 - 24) + 24) = 16;
    *(_DWORD *)((char *)v305 + *(void *)(v306 - 24) + 8) = *(_DWORD *)((unsigned char *)v305 + *(void *)(v306 - 24) + 8) & 0xFFFFFF4F | 0x80;
    int v307 = sub_10000369C(v305, (uint64_t)"history", 7);
    sub_10000369C(v307, (uint64_t)":", 1);
    size_t v308 = sub_10000369C(&std::cout, (uint64_t)"\t", 1);
    uint64_t v309 = *v308;
    *(uint64_t *)((char *)v308 + *(void *)(*v308 - 24) + 24) = 20;
    *(_DWORD *)((char *)v308 + *(void *)(v309 - 24) + 8) = *(_DWORD *)((unsigned char *)v308 + *(void *)(v309 - 24) + 8) & 0xFFFFFF4F | 0x20;
    int v310 = sub_10000369C(v308, (uint64_t)"print command history", 21);
    std::ios_base::getloc((const std::ios_base *)((char *)v310 + *(void *)(*v310 - 24)));
    unint64_t v311 = std::locale::use_facet(v349, &std::ctype<char>::id);
    ((void (*)(const std::locale::facet *, uint64_t))v311->__vftable[2].~facet_0)(v311, 10);
    std::locale::~locale(v349);
    std::ostream::put();
    std::ostream::flush();
    uint64_t v312 = sub_10000369C(&std::cout, (uint64_t)"\t", 1);
    uint64_t v313 = *v312;
    *(uint64_t *)((char *)v312 + *(void *)(*v312 - 24) + 24) = 16;
    *(_DWORD *)((char *)v312 + *(void *)(v313 - 24) + 8) = *(_DWORD *)((unsigned char *)v312 + *(void *)(v313 - 24) + 8) & 0xFFFFFF4F | 0x80;
    int v314 = sub_10000369C(v312, (uint64_t)"quit", 4);
    sub_10000369C(v314, (uint64_t)":", 1);
    v315 = sub_10000369C(&std::cout, (uint64_t)"\t", 1);
    uint64_t v316 = *v315;
    *(uint64_t *)((char *)v315 + *(void *)(*v315 - 24) + 24) = 20;
    *(_DWORD *)((char *)v315 + *(void *)(v316 - 24) + 8) = *(_DWORD *)((unsigned char *)v315 + *(void *)(v316 - 24) + 8) & 0xFFFFFF4F | 0x20;
    size_t v317 = sub_10000369C(v315, (uint64_t)"quit the application", 20);
    std::ios_base::getloc((const std::ios_base *)((char *)v317 + *(void *)(*v317 - 24)));
    int v318 = std::locale::use_facet(v349, &std::ctype<char>::id);
    ((void (*)(const std::locale::facet *, uint64_t))v318->__vftable[2].~facet_0)(v318, 10);
    std::locale::~locale(v349);
    std::ostream::put();
    std::ostream::flush();
  }
  std::ios_base::getloc((const std::ios_base *)((char *)&std::cout
                                              + (unint64_t)std::cout.__vftable[-2].~basic_ostream_0));
  int64_t v319 = std::locale::use_facet(v349, &std::ctype<char>::id);
  ((void (*)(const std::locale::facet *, uint64_t))v319->__vftable[2].~facet_0)(v319, 10);
  std::locale::~locale(v349);
  std::ostream::put();
  return std::ostream::flush();
}

void sub_1000125B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  std::locale::~locale(&a71);
  _Unwind_Resume(a1);
}

void sub_1000125CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  std::locale::~locale(&a71);
  _Unwind_Resume(a1);
}

void sub_1000125E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  std::locale::~locale(&a71);
  _Unwind_Resume(a1);
}

void sub_1000125F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  std::locale::~locale(&a71);
  _Unwind_Resume(a1);
}

void sub_100012608(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  std::locale::~locale(&a71);
  _Unwind_Resume(a1);
}

void sub_10001261C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  std::locale::~locale(&a71);
  _Unwind_Resume(a1);
}

void sub_100012630(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  std::locale::~locale(&a71);
  _Unwind_Resume(a1);
}

void sub_100012644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  std::locale::~locale(&a71);
  _Unwind_Resume(a1);
}

void sub_100012658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  std::locale::~locale(&a71);
  _Unwind_Resume(a1);
}

void sub_10001266C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  std::locale::~locale(&a71);
  _Unwind_Resume(a1);
}

void sub_100012680(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  std::locale::~locale(&a71);
  _Unwind_Resume(a1);
}

void sub_100012694(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,std::locale a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  sub_100005AB8((uint64_t)&a35);
  sub_100005AB8((uint64_t)&a71);
  sub_100004A14(v71 - 232, *(void *)(v71 - 224));
  sub_10000E6C8(v71 - 208, *(void *)(v71 - 200));
  sub_10000E644(v71 - 184, *(char **)(v71 - 176));
  sub_10000340C(v71 - 160);
  sub_10000F5B8(v71 - 144);
  _Unwind_Resume(a1);
}

void *CommandBase::getCommandSet@<X0>(void *this@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a2 + 8) = 0;
  unint64_t v2 = (uint64_t *)(a2 + 8);
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = a2 + 8;
  uint64_t v3 = (const void **)this[11];
  uint64_t v4 = (const void ***)(this + 12);
  if (v3 != this + 12)
  {
    do
    {
      this = sub_100013B00((uint64_t **)a2, v2, v3 + 4, (uint64_t)(v3 + 4));
      uint64_t v6 = (const void **)v3[1];
      if (v6)
      {
        do
        {
          long long v7 = (const void ***)v6;
          uint64_t v6 = (const void **)*v6;
        }
        while (v6);
      }
      else
      {
        do
        {
          long long v7 = (const void ***)v3[2];
          BOOL v8 = *v7 == v3;
          uint64_t v3 = (const void **)v7;
        }
        while (!v8);
      }
      uint64_t v3 = (const void **)v7;
    }
    while (v7 != v4);
  }
  return this;
}

void sub_100012928(_Unwind_Exception *a1)
{
  sub_10000E644(v1, *(char **)(v1 + 8));
  _Unwind_Resume(a1);
}

void *CommandBase::getSubCommandMap@<X0>(void *this@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a2 + 8) = 0;
  unint64_t v2 = (uint64_t *)(a2 + 8);
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = a2 + 8;
  uint64_t v3 = (const void **)this[20];
  uint64_t v4 = (const void ***)(this + 21);
  if (v3 != this + 21)
  {
    do
    {
      this = sub_100013FAC((uint64_t **)a2, v2, v3 + 4, (uint64_t)(v3 + 4));
      uint64_t v6 = (const void **)v3[1];
      if (v6)
      {
        do
        {
          long long v7 = (const void ***)v6;
          uint64_t v6 = (const void **)*v6;
        }
        while (v6);
      }
      else
      {
        do
        {
          long long v7 = (const void ***)v3[2];
          BOOL v8 = *v7 == v3;
          uint64_t v3 = (const void **)v7;
        }
        while (!v8);
      }
      uint64_t v3 = (const void **)v7;
    }
    while (v7 != v4);
  }
  return this;
}

void sub_1000129DC(_Unwind_Exception *a1)
{
  sub_10000E6C8(v1, *(void *)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t sub_1000129F4(uint64_t a1)
{
  uint64_t v2 = a1 + 16;
  *(void *)a1 = v4;
  *(void *)(a1 + *(void *)(v4 - 24)) = v3;
  *(void *)(a1 + 8) = 0;
  uint64_t v5 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v5, (void *)(a1 + 24));
  v5[1].__vftable = 0;
  v5[1].__fmtflags_ = -1;
  *(void *)(a1 + 16) = v7;
  *(void *)(v2 + *(void *)(v7 - 24)) = v6;
  *(void *)a1 = v8;
  std::streambuf::basic_streambuf();
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_DWORD *)(a1 + 120) = 24;
  return a1;
}

void sub_100012CA4(_Unwind_Exception *a1)
{
}

void sub_100012CC4(_Unwind_Exception *a1)
{
}

uint64_t CommandBase::execCommand(uint64_t a1, const void **a2, uint64_t a3)
{
  uint64_t v6 = dispatch_group_create();
  uint64_t v7 = sub_100013648((uint64_t **)(a1 + 112), a2, (uint64_t)a2)[7];
  dispatch_object_t object = v6;
  if (v6) {
    dispatch_retain(v6);
  }
  sub_10000A680(&v18, a3);
  uint64_t v8 = (*(uint64_t (**)(uint64_t, dispatch_object_t *, uint64_t *))(v7 + 16))(v7, &object, &v18);
  if (v20)
  {
    uint64_t v9 = v18;
    uint64_t v10 = v19;
    uint64_t v11 = *v19;
    *(void *)(v11 + 8) = *(void *)(v18 + 8);
    **(void **)(v9 + 8) = v11;
    uint64_t v20 = 0;
    if (v10 != &v18)
    {
      do
      {
        int v16 = (uint64_t *)v10[1];
        if (*((char *)v10 + 39) < 0) {
          operator delete((void *)v10[2]);
        }
        operator delete(v10);
        uint64_t v10 = v16;
      }
      while (v16 != &v18);
    }
  }
  if (object) {
    dispatch_release(object);
  }
  dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  int v12 = off_100024288;
  if (off_100024288 != &qword_100024290)
  {
    do
    {
      signal(*((_DWORD *)v12 + 8), 0);
      long long v13 = (uint64_t *)v12[1];
      if (v13)
      {
        do
        {
          unint64_t v14 = v13;
          long long v13 = (uint64_t *)*v13;
        }
        while (v13);
      }
      else
      {
        do
        {
          unint64_t v14 = (uint64_t *)v12[2];
          BOOL v15 = *v14 == (void)v12;
          int v12 = v14;
        }
        while (!v15);
      }
      int v12 = v14;
    }
    while (v14 != &qword_100024290);
  }
  sub_1000137E0((void *)qword_100024290);
  off_100024288 = &qword_100024290;
  qword_100024298 = 0;
  qword_100024290 = 0;
  if (v6) {
    dispatch_release(v6);
  }
  return v8;
}

void sub_100012E74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, dispatch_object_t object)
{
  sub_100005930((char *)&a9);
  if (object)
  {
    dispatch_release(object);
    if (!v12) {
LABEL_3:
    }
      _Unwind_Resume(a1);
  }
  else if (!v12)
  {
    goto LABEL_3;
  }
  dispatch_release(v12);
  _Unwind_Resume(a1);
}

void CommandBase::addCommandHandler(uint64_t a1, uint64_t a2, const void **a3, uint64_t a4)
{
  uint64_t v8 = (uint64_t *)(a1 + 120);
  uint64_t v9 = *(uint64_t **)(a1 + 120);
  if (!v9) {
    goto LABEL_36;
  }
  int v10 = *(char *)(a2 + 23);
  if (v10 >= 0) {
    uint64_t v11 = (const void *)a2;
  }
  else {
    uint64_t v11 = *(const void **)a2;
  }
  if (v10 >= 0) {
    size_t v12 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    size_t v12 = *(void *)(a2 + 8);
  }
  long long v13 = (uint64_t *)(a1 + 120);
  do
  {
    while (1)
    {
      int v14 = *((char *)v9 + 55);
      BOOL v15 = v14 >= 0 ? v9 + 4 : (uint64_t *)v9[4];
      size_t v16 = v14 >= 0 ? *((unsigned __int8 *)v9 + 55) : v9[5];
      size_t v17 = v12 >= v16 ? v16 : v12;
      int v18 = memcmp(v15, v11, v17);
      if (v18) {
        break;
      }
      if (v16 >= v12) {
        goto LABEL_23;
      }
LABEL_9:
      uint64_t v9 = (uint64_t *)v9[1];
      if (!v9) {
        goto LABEL_24;
      }
    }
    if (v18 < 0) {
      goto LABEL_9;
    }
LABEL_23:
    long long v13 = v9;
    uint64_t v9 = (uint64_t *)*v9;
  }
  while (v9);
LABEL_24:
  if (v13 == v8) {
    goto LABEL_36;
  }
  uint64_t v21 = (uint64_t *)v13[4];
  uint64_t v20 = v13 + 4;
  size_t v19 = v21;
  int v22 = *((char *)v20 + 23);
  if (v22 >= 0) {
    v23 = v20;
  }
  else {
    v23 = v19;
  }
  if (v22 >= 0) {
    size_t v24 = *((unsigned __int8 *)v20 + 23);
  }
  else {
    size_t v24 = v20[1];
  }
  if (v24 >= v12) {
    size_t v25 = v12;
  }
  else {
    size_t v25 = v24;
  }
  int v26 = memcmp(v11, v23, v25);
  if (v26)
  {
    if (v26 < 0) {
      goto LABEL_36;
    }
LABEL_84:
    __cxa_rethrow();
  }
  if (v12 >= v24) {
    goto LABEL_84;
  }
LABEL_36:
  if (!*a3) {
    return;
  }
  size_t v27 = _Block_copy(*a3);
  int v28 = sub_100013648((uint64_t **)v8 - 1, (const void **)a2, a2);
  uint64_t v29 = (const void *)v28[7];
  v28[7] = (uint64_t)v27;
  if (v29) {
    _Block_release(v29);
  }
  if (*(char *)(a2 + 23) < 0)
  {
    sub_1000035FC(__dst, *(void **)a2, *(void *)(a2 + 8));
    if (*(char *)(a4 + 23) < 0) {
      goto LABEL_43;
    }
LABEL_41:
    *(_OWORD *)std::string __p = *(_OWORD *)a4;
    uint64_t v55 = *(void *)(a4 + 16);
  }
  else
  {
    *(_OWORD *)long long __dst = *(_OWORD *)a2;
    uint64_t v57 = *(void *)(a2 + 16);
    if ((*(char *)(a4 + 23) & 0x80000000) == 0) {
      goto LABEL_41;
    }
LABEL_43:
    sub_1000035FC(__p, *(void **)a4, *(void *)(a4 + 8));
  }
  char v30 = (void **)(a1 + 88);
  char v31 = sub_1000139E4(a1 + 88, (const void **)__dst);
  size_t v32 = (uint64_t **)v31;
  if ((uint64_t *)(a1 + 96) != v31) {
    __cxa_rethrow();
  }
  unint64_t v33 = (uint64_t *)*v31;
  if (!*v31)
  {
    uint64_t v36 = (uint64_t **)v31;
    uint64_t v37 = v31;
    goto LABEL_73;
  }
  if (v57 >= 0) {
    uint64_t v34 = __dst;
  }
  else {
    uint64_t v34 = (void **)__dst[0];
  }
  if (v57 >= 0) {
    v35 = (void *)HIBYTE(v57);
  }
  else {
    v35 = __dst[1];
  }
  do
  {
    while (2)
    {
      uint64_t v37 = v33;
      char v40 = (const void *)v33[4];
      uint64_t v38 = v33 + 4;
      uint64_t v39 = v40;
      int v41 = *((char *)v38 + 23);
      if (v41 >= 0) {
        size_t v42 = v38;
      }
      else {
        size_t v42 = v39;
      }
      if (v41 >= 0) {
        size_t v43 = *((unsigned __int8 *)v38 + 23);
      }
      else {
        size_t v43 = v38[1];
      }
      if (v43 >= (unint64_t)v35) {
        size_t v44 = (size_t)v35;
      }
      else {
        size_t v44 = v43;
      }
      int v45 = memcmp(v34, v42, v44);
      if (v45)
      {
        if (v45 < 0) {
          goto LABEL_52;
        }
      }
      else if ((unint64_t)v35 < v43)
      {
LABEL_52:
        unint64_t v33 = (uint64_t *)*v37;
        uint64_t v36 = (uint64_t **)v37;
        if (!*v37) {
          goto LABEL_73;
        }
        continue;
      }
      break;
    }
    int v46 = memcmp(v42, v34, v44);
    if (v46)
    {
      if ((v46 & 0x80000000) == 0) {
        goto LABEL_79;
      }
    }
    else if (v43 >= (unint64_t)v35)
    {
      goto LABEL_79;
    }
    unint64_t v33 = (uint64_t *)v37[1];
  }
  while (v33);
  uint64_t v36 = (uint64_t **)(v37 + 1);
LABEL_73:
  size_t v47 = (uint64_t *)operator new(0x38uLL);
  long long v48 = v47 + 4;
  if (SHIBYTE(v57) < 0)
  {
    sub_1000035FC(v48, __dst[0], (unint64_t)__dst[1]);
  }
  else
  {
    *(_OWORD *)long long v48 = *(_OWORD *)__dst;
    v47[6] = v57;
  }
  *size_t v47 = 0;
  v47[1] = 0;
  v47[2] = (uint64_t)v37;
  *uint64_t v36 = v47;
  uint64_t v49 = (void *)**v30;
  if (v49)
  {
    *char v30 = v49;
    size_t v47 = *v36;
  }
  sub_100004AB0(*v32, v47);
  ++*(void *)(a1 + 104);
LABEL_79:
  v50 = sub_1000134AC((uint64_t **)(a1 + 136), (const void **)__dst, (uint64_t)__dst);
  size_t v51 = (void **)(v50 + 7);
  if (v50 + 7 != (uint64_t *)__p)
  {
    if (*((char *)v50 + 79) < 0)
    {
      if (v55 >= 0) {
        size_t v52 = __p;
      }
      else {
        size_t v52 = (void **)__p[0];
      }
      if (v55 >= 0) {
        size_t v53 = HIBYTE(v55);
      }
      else {
        size_t v53 = (size_t)__p[1];
      }
      sub_100004424(v51, v52, v53);
    }
    else if (v55 < 0)
    {
      sub_10000435C(v51, __p[0], (size_t)__p[1]);
    }
    else
    {
      *(_OWORD *)size_t v51 = *(_OWORD *)__p;
      v50[9] = v55;
    }
  }
  if ((SHIBYTE(v55) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v57) & 0x80000000) == 0) {
      return;
    }
LABEL_97:
    operator delete(__dst[0]);
    return;
  }
  operator delete(__p[0]);
  if (SHIBYTE(v57) < 0) {
    goto LABEL_97;
  }
}

void sub_100013260(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  operator delete(v21);
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  _Unwind_Resume(a1);
}

void CommandBase::getSubCommandObj(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t **a3@<X8>)
{
  *a3 = 0;
  a3[1] = 0;
  if (*(char *)(a2 + 23) < 0)
  {
    sub_1000035FC(__p, *(void **)a2, *(void *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)std::string __p = *(_OWORD *)a2;
    uint64_t v14 = *(void *)(a2 + 16);
  }
  if ((uint64_t *)(a1 + 168) != sub_1000139E4(a1 + 160, (const void **)__p))
  {
    BOOL v6 = 1;
    if ((SHIBYTE(v14) & 0x80000000) == 0) {
      goto LABEL_6;
    }
LABEL_9:
    operator delete(__p[0]);
    if (!v6) {
      return;
    }
    goto LABEL_10;
  }
  BOOL v6 = a1 + 192 != (void)sub_1000139E4(a1 + 184, (const void **)__p);
  if (SHIBYTE(v14) < 0) {
    goto LABEL_9;
  }
LABEL_6:
  if (!v6) {
    return;
  }
LABEL_10:
  BOOL v15 = (long long *)a2;
  uint64_t v7 = sub_10000E4B4((uint64_t **)(a1 + 160), (const void **)a2, (uint64_t)&std::piecewise_construct, &v15);
  uint64_t v8 = v7[7];
  uint64_t v9 = (std::__shared_weak_count *)v7[8];
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  *a3 = v8;
  a3[1] = (uint64_t *)v9;
  if (!v8)
  {
    BOOL v15 = (long long *)a2;
    int v10 = sub_10000E4B4((uint64_t **)(a1 + 184), (const void **)a2, (uint64_t)&std::piecewise_construct, &v15);
    size_t v12 = v10[7];
    uint64_t v11 = v10[8];
    if (v11) {
      atomic_fetch_add_explicit(v11 + 1, 1uLL, memory_order_relaxed);
    }
    *a3 = v12;
    a3[1] = v11;
    if (v9)
    {
      if (!atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
  }
}

void sub_100013458(_Unwind_Exception *a1)
{
  sub_10000340C(v1);
  _Unwind_Resume(a1);
}

void sub_10001346C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  sub_10000340C(v14);
  _Unwind_Resume(a1);
}

void CommandBase::getCommandOptions(void *a1@<X8>)
{
  *a1 = a1;
  a1[1] = a1;
  a1[2] = 0;
}

uint64_t CommandBase::isAllowed()
{
  return 1;
}

uint64_t *sub_1000134AC(uint64_t **a1, const void **a2, uint64_t a3)
{
  BOOL v6 = a1 + 1;
  uint64_t v5 = a1[1];
  if (v5)
  {
    int v7 = *((char *)a2 + 23);
    if (v7 >= 0) {
      uint64_t v8 = a2;
    }
    else {
      uint64_t v8 = *a2;
    }
    if (v7 >= 0) {
      size_t v9 = *((unsigned __int8 *)a2 + 23);
    }
    else {
      size_t v9 = (size_t)a2[1];
    }
    while (1)
    {
      int v10 = (uint64_t **)v5;
      long long v13 = (const void *)v5[4];
      uint64_t v11 = v5 + 4;
      size_t v12 = v13;
      int v14 = *((char *)v11 + 23);
      if (v14 >= 0) {
        BOOL v15 = v11;
      }
      else {
        BOOL v15 = v12;
      }
      if (v14 >= 0) {
        size_t v16 = *((unsigned __int8 *)v11 + 23);
      }
      else {
        size_t v16 = v11[1];
      }
      if (v16 >= v9) {
        size_t v17 = v9;
      }
      else {
        size_t v17 = v16;
      }
      int v18 = memcmp(v8, v15, v17);
      if (v18)
      {
        if (v18 < 0) {
          goto LABEL_8;
        }
LABEL_22:
        int v19 = memcmp(v15, v8, v17);
        if (v19)
        {
          if ((v19 & 0x80000000) == 0) {
            return (uint64_t *)v10;
          }
        }
        else if (v16 >= v9)
        {
          return (uint64_t *)v10;
        }
        uint64_t v5 = v10[1];
        if (!v5)
        {
          BOOL v6 = v10 + 1;
LABEL_28:
          uint64_t v20 = (uint64_t *)operator new(0x50uLL);
          uint64_t v21 = v20 + 4;
          if (*(char *)(a3 + 23) < 0) {
            goto LABEL_31;
          }
LABEL_29:
          *(_OWORD *)uint64_t v21 = *(_OWORD *)a3;
          v21[2] = *(void *)(a3 + 16);
          goto LABEL_32;
        }
      }
      else
      {
        if (v9 >= v16) {
          goto LABEL_22;
        }
LABEL_8:
        uint64_t v5 = *v10;
        BOOL v6 = v10;
        if (!*v10) {
          goto LABEL_28;
        }
      }
    }
  }
  int v10 = a1 + 1;
  uint64_t v20 = (uint64_t *)operator new(0x50uLL);
  uint64_t v21 = v20 + 4;
  if ((*(char *)(a3 + 23) & 0x80000000) == 0) {
    goto LABEL_29;
  }
LABEL_31:
  sub_1000035FC(v21, *(void **)a3, *(void *)(a3 + 8));
LABEL_32:
  v20[7] = 0;
  v20[8] = 0;
  v20[9] = 0;
  *uint64_t v20 = 0;
  v20[1] = 0;
  v20[2] = (uint64_t)v10;
  *BOOL v6 = v20;
  int v22 = (uint64_t *)**a1;
  v23 = v20;
  if (v22)
  {
    *a1 = v22;
    v23 = *v6;
  }
  sub_100004AB0(a1[1], v23);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return v20;
}

void sub_100013634(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t *sub_100013648(uint64_t **a1, const void **a2, uint64_t a3)
{
  BOOL v6 = a1 + 1;
  uint64_t v5 = a1[1];
  if (v5)
  {
    int v7 = *((char *)a2 + 23);
    if (v7 >= 0) {
      uint64_t v8 = a2;
    }
    else {
      uint64_t v8 = *a2;
    }
    if (v7 >= 0) {
      size_t v9 = *((unsigned __int8 *)a2 + 23);
    }
    else {
      size_t v9 = (size_t)a2[1];
    }
    while (1)
    {
      int v10 = (uint64_t **)v5;
      long long v13 = (const void *)v5[4];
      uint64_t v11 = v5 + 4;
      size_t v12 = v13;
      int v14 = *((char *)v11 + 23);
      if (v14 >= 0) {
        BOOL v15 = v11;
      }
      else {
        BOOL v15 = v12;
      }
      if (v14 >= 0) {
        size_t v16 = *((unsigned __int8 *)v11 + 23);
      }
      else {
        size_t v16 = v11[1];
      }
      if (v16 >= v9) {
        size_t v17 = v9;
      }
      else {
        size_t v17 = v16;
      }
      int v18 = memcmp(v8, v15, v17);
      if (v18)
      {
        if (v18 < 0) {
          goto LABEL_8;
        }
LABEL_22:
        int v19 = memcmp(v15, v8, v17);
        if (v19)
        {
          if ((v19 & 0x80000000) == 0) {
            return (uint64_t *)v10;
          }
        }
        else if (v16 >= v9)
        {
          return (uint64_t *)v10;
        }
        uint64_t v5 = v10[1];
        if (!v5)
        {
          BOOL v6 = v10 + 1;
LABEL_28:
          uint64_t v20 = (uint64_t *)operator new(0x40uLL);
          uint64_t v21 = v20 + 4;
          if (*(char *)(a3 + 23) < 0) {
            goto LABEL_31;
          }
LABEL_29:
          *(_OWORD *)uint64_t v21 = *(_OWORD *)a3;
          v21[2] = *(void *)(a3 + 16);
          goto LABEL_32;
        }
      }
      else
      {
        if (v9 >= v16) {
          goto LABEL_22;
        }
LABEL_8:
        uint64_t v5 = *v10;
        BOOL v6 = v10;
        if (!*v10) {
          goto LABEL_28;
        }
      }
    }
  }
  int v10 = a1 + 1;
  uint64_t v20 = (uint64_t *)operator new(0x40uLL);
  uint64_t v21 = v20 + 4;
  if ((*(char *)(a3 + 23) & 0x80000000) == 0) {
    goto LABEL_29;
  }
LABEL_31:
  sub_1000035FC(v21, *(void **)a3, *(void *)(a3 + 8));
LABEL_32:
  v20[7] = 0;
  *uint64_t v20 = 0;
  v20[1] = 0;
  v20[2] = (uint64_t)v10;
  *BOOL v6 = v20;
  int v22 = (uint64_t *)**a1;
  v23 = v20;
  if (v22)
  {
    *a1 = v22;
    v23 = *v6;
  }
  sub_100004AB0(a1[1], v23);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return v20;
}

void sub_1000137CC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_1000137E0(void *a1)
{
  if (!a1) {
    return;
  }
  sub_1000137E0(*a1);
  sub_1000137E0(a1[1]);
  uint64_t v2 = (void **)a1[6];
  uint64_t v3 = (void **)a1[7];
  if (v3 == v2)
  {
    uint64_t v3 = (void **)a1[6];
    a1[10] = 0;
    unint64_t v10 = 0;
    goto LABEL_17;
  }
  unint64_t v4 = a1[9];
  uint64_t v5 = &v2[v4 >> 7];
  BOOL v6 = (char *)*v5 + 32 * (v4 & 0x7F);
  uint64_t v7 = *(uint64_t *)((char *)v2 + (((a1[10] + v4) >> 4) & 0xFFFFFFFFFFFFFF8)) + 32 * ((a1[10] + v4) & 0x7F);
  if (v6 == (char *)v7) {
    goto LABEL_15;
  }
  do
  {
    uint64_t v8 = (char *)*((void *)v6 + 3);
    if (v8 == v6)
    {
      (*(void (**)(char *))(*(void *)v6 + 32))(v6);
      v6 += 32;
      if (v6 - (unsigned char *)*v5 != 4096) {
        continue;
      }
LABEL_12:
      size_t v9 = (char *)v5[1];
      ++v5;
      BOOL v6 = v9;
      continue;
    }
    if (v8) {
      (*(void (**)(char *))(*(void *)v8 + 40))(v8);
    }
    v6 += 32;
    if (v6 - (unsigned char *)*v5 == 4096) {
      goto LABEL_12;
    }
  }
  while (v6 != (char *)v7);
  uint64_t v2 = (void **)a1[6];
  uint64_t v3 = (void **)a1[7];
LABEL_15:
  a1[10] = 0;
  unint64_t v10 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      uint64_t v3 = (void **)a1[7];
      uint64_t v2 = (void **)(a1[6] + 8);
      a1[6] = v2;
      unint64_t v10 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
LABEL_17:
  unint64_t v11 = v10 >> 3;
  if (v11 == 1)
  {
    uint64_t v12 = 64;
LABEL_22:
    a1[9] = v12;
  }
  else if (v11 == 2)
  {
    uint64_t v12 = 128;
    goto LABEL_22;
  }
  if (v2 != v3)
  {
    do
    {
      long long v13 = *v2++;
      operator delete(v13);
    }
    while (v2 != v3);
    uint64_t v15 = a1[6];
    uint64_t v14 = a1[7];
    if (v14 != v15) {
      a1[7] = v14 + ((v15 - v14 + 7) & 0xFFFFFFFFFFFFFFF8);
    }
  }
  size_t v16 = (void *)a1[5];
  if (v16) {
    operator delete(v16);
  }

  operator delete(a1);
}

uint64_t *sub_1000139E4(uint64_t a1, const void **a2)
{
  uint64_t v2 = (uint64_t *)(a1 + 8);
  uint64_t v3 = *(uint64_t **)(a1 + 8);
  if (!v3) {
    return v2;
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
  uint64_t v7 = (uint64_t *)(a1 + 8);
  do
  {
    while (1)
    {
      int v8 = *((char *)v3 + 55);
      size_t v9 = v8 >= 0 ? v3 + 4 : (uint64_t *)v3[4];
      size_t v10 = v8 >= 0 ? *((unsigned __int8 *)v3 + 55) : v3[5];
      size_t v11 = v6 >= v10 ? v10 : v6;
      int v12 = memcmp(v9, v5, v11);
      if (v12) {
        break;
      }
      if (v10 >= v6) {
        goto LABEL_23;
      }
LABEL_9:
      uint64_t v3 = (uint64_t *)v3[1];
      if (!v3) {
        goto LABEL_24;
      }
    }
    if (v12 < 0) {
      goto LABEL_9;
    }
LABEL_23:
    uint64_t v7 = v3;
    uint64_t v3 = (uint64_t *)*v3;
  }
  while (v3);
LABEL_24:
  if (v7 == v2) {
    return v2;
  }
  int v13 = *((char *)v7 + 55);
  if (v13 >= 0) {
    uint64_t v14 = v7 + 4;
  }
  else {
    uint64_t v14 = (const void *)v7[4];
  }
  if (v13 >= 0) {
    size_t v15 = *((unsigned __int8 *)v7 + 55);
  }
  else {
    size_t v15 = v7[5];
  }
  if (v15 >= v6) {
    size_t v16 = v6;
  }
  else {
    size_t v16 = v15;
  }
  int v17 = memcmp(v5, v14, v16);
  if (v17)
  {
    if ((v17 & 0x80000000) == 0) {
      return v7;
    }
    return v2;
  }
  else
  {
    if (v6 < v15) {
      return v2;
    }
    return v7;
  }
}

void *sub_100013B00(uint64_t **a1, uint64_t *a2, const void **a3, uint64_t a4)
{
  uint64_t v14 = (uint64_t *)0xAAAAAAAAAAAAAAAALL;
  size_t v15 = (uint64_t *)0xAAAAAAAAAAAAAAAALL;
  size_t v6 = sub_100013C00(a1, a2, &v15, &v14, a3);
  if (*v6) {
    return (void *)*v6;
  }
  int v8 = v6;
  size_t v9 = operator new(0x38uLL);
  size_t v10 = v9 + 4;
  if (*(char *)(a4 + 23) < 0)
  {
    sub_1000035FC(v10, *(void **)a4, *(void *)(a4 + 8));
  }
  else
  {
    *(_OWORD *)size_t v10 = *(_OWORD *)a4;
    v9[6] = *(void *)(a4 + 16);
  }
  size_t v11 = v15;
  *size_t v9 = 0;
  v9[1] = 0;
  v9[2] = v11;
  uint64_t *v8 = (uint64_t)v9;
  int v12 = (uint64_t *)**a1;
  int v13 = v9;
  if (v12)
  {
    *a1 = v12;
    int v13 = (uint64_t *)*v8;
  }
  sub_100004AB0(a1[1], v13);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return v9;
}

void sub_100013BEC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t *sub_100013C00(uint64_t **a1, uint64_t *a2, uint64_t **a3, uint64_t **a4, const void **a5)
{
  int v8 = a1 + 1;
  if (a1 + 1 == (uint64_t **)a2) {
    goto LABEL_23;
  }
  int v10 = *((char *)a5 + 23);
  if (v10 >= 0) {
    size_t v11 = a5;
  }
  else {
    size_t v11 = *a5;
  }
  if (v10 >= 0) {
    size_t v12 = *((unsigned __int8 *)a5 + 23);
  }
  else {
    size_t v12 = (size_t)a5[1];
  }
  int v13 = *((char *)a2 + 55);
  if (v13 >= 0) {
    uint64_t v14 = a2 + 4;
  }
  else {
    uint64_t v14 = (const void *)a2[4];
  }
  if (v13 >= 0) {
    size_t v15 = *((unsigned __int8 *)a2 + 55);
  }
  else {
    size_t v15 = a2[5];
  }
  if (v15 >= v12) {
    size_t v16 = v12;
  }
  else {
    size_t v16 = v15;
  }
  int v17 = memcmp(v11, v14, v16);
  if (!v17)
  {
    if (v12 >= v15) {
      goto LABEL_19;
    }
LABEL_23:
    int v19 = (uint64_t *)*a2;
    if (*a1 == a2)
    {
      uint64_t v21 = a2;
    }
    else
    {
      if (v19)
      {
        uint64_t v20 = (uint64_t *)*a2;
        do
        {
          uint64_t v21 = v20;
          uint64_t v20 = (uint64_t *)v20[1];
        }
        while (v20);
      }
      else
      {
        int v22 = a2;
        do
        {
          uint64_t v21 = (uint64_t *)v22[2];
          BOOL v23 = *v21 == (void)v22;
          int v22 = v21;
        }
        while (v23);
      }
      int v24 = *((char *)v21 + 55);
      if (v24 >= 0) {
        size_t v25 = v21 + 4;
      }
      else {
        size_t v25 = (const void *)v21[4];
      }
      if (v24 >= 0) {
        size_t v26 = *((unsigned __int8 *)v21 + 55);
      }
      else {
        size_t v26 = v21[5];
      }
      int v27 = *((char *)a5 + 23);
      if (v27 >= 0) {
        int v28 = a5;
      }
      else {
        int v28 = *a5;
      }
      if (v27 >= 0) {
        size_t v29 = *((unsigned __int8 *)a5 + 23);
      }
      else {
        size_t v29 = (size_t)a5[1];
      }
      if (v29 >= v26) {
        size_t v30 = v26;
      }
      else {
        size_t v30 = v29;
      }
      int v31 = memcmp(v25, v28, v30);
      if (v31)
      {
        if ((v31 & 0x80000000) == 0) {
          goto LABEL_48;
        }
      }
      else if (v26 >= v29)
      {
LABEL_48:
        size_t v32 = *v8;
        if (!*v8)
        {
          unint64_t v33 = v8;
LABEL_69:
          *a3 = (uint64_t *)v33;
          return (uint64_t *)v8;
        }
        while (1)
        {
          unint64_t v33 = (uint64_t **)v32;
          uint64_t v36 = (const void *)v32[4];
          uint64_t v34 = v32 + 4;
          v35 = v36;
          int v37 = *((char *)v34 + 23);
          if (v37 >= 0) {
            uint64_t v38 = v34;
          }
          else {
            uint64_t v38 = v35;
          }
          if (v37 >= 0) {
            size_t v39 = *((unsigned __int8 *)v34 + 23);
          }
          else {
            size_t v39 = v34[1];
          }
          if (v39 >= v29) {
            size_t v40 = v29;
          }
          else {
            size_t v40 = v39;
          }
          int v41 = memcmp(v28, v38, v40);
          if (v41)
          {
            if (v41 < 0) {
              goto LABEL_50;
            }
LABEL_64:
            int v42 = memcmp(v38, v28, v40);
            if (v42)
            {
              if ((v42 & 0x80000000) == 0) {
                goto LABEL_69;
              }
            }
            else if (v39 >= v29)
            {
              goto LABEL_69;
            }
            int v8 = v33 + 1;
            size_t v32 = v33[1];
            if (!v32) {
              goto LABEL_69;
            }
          }
          else
          {
            if (v29 >= v39) {
              goto LABEL_64;
            }
LABEL_50:
            size_t v32 = *v33;
            int v8 = v33;
            if (!*v33) {
              goto LABEL_69;
            }
          }
        }
      }
    }
    if (v19)
    {
      *a3 = v21;
      return v21 + 1;
    }
    else
    {
      *a3 = a2;
      return a2;
    }
  }
  if (v17 < 0) {
    goto LABEL_23;
  }
LABEL_19:
  int v18 = memcmp(v14, v11, v16);
  if (v18)
  {
    if ((v18 & 0x80000000) == 0)
    {
LABEL_21:
      *a3 = a2;
      *a4 = a2;
      return (uint64_t *)a4;
    }
  }
  else if (v15 >= v12)
  {
    goto LABEL_21;
  }
  uint64_t v43 = a2[1];
  if (v43)
  {
    size_t v44 = (uint64_t *)a2[1];
    do
    {
      a4 = (uint64_t **)v44;
      size_t v44 = (uint64_t *)*v44;
    }
    while (v44);
  }
  else
  {
    int v45 = a2;
    do
    {
      a4 = (uint64_t **)v45[2];
      BOOL v23 = *a4 == v45;
      int v45 = (uint64_t *)a4;
    }
    while (!v23);
  }
  if (a4 != v8)
  {
    int v46 = *((char *)a4 + 55);
    if (v46 >= 0) {
      size_t v47 = (uint64_t *)(a4 + 4);
    }
    else {
      size_t v47 = a4[4];
    }
    if (v46 >= 0) {
      size_t v48 = *((unsigned __int8 *)a4 + 55);
    }
    else {
      size_t v48 = (size_t)a4[5];
    }
    if (v48 >= v12) {
      size_t v49 = v12;
    }
    else {
      size_t v49 = v48;
    }
    int v50 = memcmp(v11, v47, v49);
    if (v50)
    {
      if ((v50 & 0x80000000) == 0)
      {
LABEL_95:
        size_t v51 = *v8;
        if (*v8)
        {
          size_t v52 = a3;
          while (1)
          {
            size_t v53 = (uint64_t **)v51;
            int v56 = (const void *)v51[4];
            v54 = v51 + 4;
            uint64_t v55 = v56;
            int v57 = *((char *)v54 + 23);
            if (v57 >= 0) {
              long long v58 = v54;
            }
            else {
              long long v58 = v55;
            }
            if (v57 >= 0) {
              size_t v59 = *((unsigned __int8 *)v54 + 23);
            }
            else {
              size_t v59 = v54[1];
            }
            if (v59 >= v12) {
              size_t v60 = v12;
            }
            else {
              size_t v60 = v59;
            }
            int v61 = memcmp(v11, v58, v60);
            if (v61)
            {
              if (v61 < 0) {
                goto LABEL_97;
              }
LABEL_111:
              int v62 = memcmp(v58, v11, v60);
              if (v62)
              {
                if ((v62 & 0x80000000) == 0) {
                  goto LABEL_123;
                }
              }
              else if (v59 >= v12)
              {
                goto LABEL_123;
              }
              int v8 = v53 + 1;
              size_t v51 = v53[1];
              if (!v51) {
                goto LABEL_123;
              }
            }
            else
            {
              if (v12 >= v59) {
                goto LABEL_111;
              }
LABEL_97:
              size_t v51 = *v53;
              int v8 = v53;
              if (!*v53) {
                goto LABEL_123;
              }
            }
          }
        }
        size_t v53 = v8;
        size_t v52 = a3;
LABEL_123:
        *size_t v52 = (uint64_t *)v53;
        return (uint64_t *)v8;
      }
    }
    else if (v12 >= v48)
    {
      goto LABEL_95;
    }
  }
  if (v43)
  {
    *a3 = (uint64_t *)a4;
  }
  else
  {
    *a3 = a2;
    return a2 + 1;
  }
  return (uint64_t *)a4;
}

void *sub_100013FAC(uint64_t **a1, uint64_t *a2, const void **a3, uint64_t a4)
{
  size_t v15 = (uint64_t *)0xAAAAAAAAAAAAAAAALL;
  size_t v16 = (uint64_t *)0xAAAAAAAAAAAAAAAALL;
  size_t v6 = sub_100013C00(a1, a2, &v16, &v15, a3);
  if (*v6) {
    return (void *)*v6;
  }
  int v8 = v6;
  size_t v9 = operator new(0x48uLL);
  int v10 = v9 + 4;
  if (*(char *)(a4 + 23) < 0)
  {
    sub_1000035FC(v10, *(void **)a4, *(void *)(a4 + 8));
  }
  else
  {
    *(_OWORD *)int v10 = *(_OWORD *)a4;
    v9[6] = *(void *)(a4 + 16);
  }
  uint64_t v11 = *(void *)(a4 + 32);
  v9[7] = *(void *)(a4 + 24);
  v9[8] = v11;
  if (v11) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v11 + 8), 1uLL, memory_order_relaxed);
  }
  size_t v12 = v16;
  *size_t v9 = 0;
  v9[1] = 0;
  v9[2] = v12;
  uint64_t *v8 = (uint64_t)v9;
  int v13 = (uint64_t *)**a1;
  uint64_t v14 = v9;
  if (v13)
  {
    *a1 = v13;
    uint64_t v14 = (uint64_t *)*v8;
  }
  sub_100004AB0(a1[1], v14);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return v9;
}

void sub_1000140B0(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_1000140C8(CommandShell *a1)
{
  CommandShell::~CommandShell(a1);

  operator delete(v1);
}

void sub_1000140F0(void *a1@<X8>)
{
  uint64_t v2 = dispatch_queue_create("abmtool.queue", 0);
  uint64_t v34 = 0xAAAAAAAAAAAAAAAALL;
  v35 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  strcpy((char *)__dst, "abmtool");
  abm::client::CreateManager();
  uint64_t v3 = dispatch_group_create();
  int v4 = v3;
  if (v3)
  {
    dispatch_retain(v3);
    dispatch_group_enter(v4);
  }
  uint64_t v30 = v34;
  int v31 = v35;
  atomic_fetch_add_explicit(&v35->__shared_owners_, 1uLL, memory_order_relaxed);
  uint64_t v5 = (const void *)abm::kEventServerStateChange;
  size_t v6 = strlen(abm::kEventServerStateChange);
  if (v6 >= 0x7FFFFFFFFFFFFFF8) {
    sub_100003540();
  }
  uint64_t v7 = (void *)v6;
  if (v6 >= 0x17)
  {
    uint64_t v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17) {
      uint64_t v9 = v6 | 7;
    }
    uint64_t v10 = v9 + 1;
    int v8 = (void **)operator new(v9 + 1);
    __dst[1] = v7;
    unint64_t v33 = v10 | 0x8000000000000000;
    __dst[0] = v8;
    goto LABEL_10;
  }
  HIBYTE(v33) = v6;
  int v8 = __dst;
  if (v6) {
LABEL_10:
  }
    memmove(v8, v5, (size_t)v7);
  *((unsigned char *)v7 + (void)v8) = 0;
  BOOL v23 = _NSConcreteStackBlock;
  uint64_t v24 = 1174405120;
  size_t v25 = sub_1000146A0;
  size_t v26 = &unk_100020830;
  uint64_t v27 = v34;
  int v28 = v35;
  if (v35) {
    atomic_fetch_add_explicit(&v35->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  dispatch_group_t group = v4;
  if (v4)
  {
    dispatch_retain(v4);
    dispatch_group_enter(group);
  }
  abm::client::RegisterEventHandler();
  if (SHIBYTE(v33) < 0) {
    operator delete(__dst[0]);
  }
  if (v31 && !atomic_fetch_add(&v31->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
    std::__shared_weak_count::__release_weak(v31);
  }
  uint64_t v21 = v34;
  int v22 = v35;
  if (v35) {
    atomic_fetch_add_explicit(&v35->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  abm::client::EventsOff();
  if (v22 && !atomic_fetch_add(&v22->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
    std::__shared_weak_count::__release_weak(v22);
  }
  uint64_t v19 = v34;
  uint64_t v20 = v35;
  if (v35) {
    atomic_fetch_add_explicit(&v35->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  abm::client::EventsOn();
  if (v20 && !atomic_fetch_add(&v20->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
    std::__shared_weak_count::__release_weak(v20);
  }
  if (group)
  {
    dispatch_group_leave(group);
    dispatch_release(group);
  }
  if (v28 && !atomic_fetch_add(&v28->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
    std::__shared_weak_count::__release_weak(v28);
  }
  if (v4)
  {
    dispatch_group_leave(v4);
    dispatch_release(v4);
  }
  dispatch_time_t v11 = dispatch_time(0, 500000000);
  dispatch_group_wait(v4, v11);
  size_t v12 = (char *)getprogname();
  uint64_t v17 = 0;
  int v18 = 0;
  int v13 = v35;
  v16[0] = v34;
  v16[1] = (uint64_t)v35;
  if (v35) {
    atomic_fetch_add_explicit(&v35->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  size_t v15 = v2;
  if (v2) {
    dispatch_retain(v2);
  }
  ABMCommand::create(v12, &v17, v16, &v15, a1);
  if (v2) {
    dispatch_release(v2);
  }
  if (v13 && !atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
  }
  if (v18) {
    std::__shared_weak_count::__release_weak(v18);
  }
  if (v4) {
    dispatch_release(v4);
  }
  uint64_t v14 = v35;
  if (v35 && !atomic_fetch_add(&v35->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
    std::__shared_weak_count::__release_weak(v14);
  }
  if (v2) {
    dispatch_release(v2);
  }
}

void sub_10001459C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,dispatch_group_t group)
{
  if (v25) {
    dispatch_release(v25);
  }
  sub_10000340C((uint64_t)&a11);
  if (v26) {
    dispatch_release(v26);
  }
  sub_10000340C(v27 - 80);
  if (v25)
  {
    dispatch_release(v25);
    _Unwind_Resume(a1);
  }
  _Unwind_Resume(a1);
}

void sub_1000146A0(int a1, xpc_object_t object)
{
  if (object)
  {
    xpc_object_t v2 = object;
    xpc_retain(object);
    goto LABEL_4;
  }
  xpc_object_t v2 = xpc_null_create();
  if (v2)
  {
LABEL_4:
    if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_retain(v2);
      xpc_object_t v3 = v2;
    }
    else
    {
      xpc_object_t v3 = xpc_null_create();
    }
    goto LABEL_8;
  }
  xpc_object_t v3 = xpc_null_create();
  xpc_object_t v2 = 0;
LABEL_8:
  xpc_release(v2);
  memset(v9, 170, 24);
  xpc_object_t value = xpc_dictionary_get_value(v3, abm::kKeyServerState);
  xpc_object_t objecta = value;
  if (value) {
    xpc_retain(value);
  }
  else {
    xpc_object_t objecta = xpc_null_create();
  }
  memset(&v9[3], 0, 24);
  xpc::dyn_cast_or_default();
  xpc_release(objecta);
  int v5 = SHIBYTE(v9[2]);
  if (SHIBYTE(v9[2]) >= 0) {
    size_t v6 = HIBYTE(v9[2]);
  }
  else {
    size_t v6 = (size_t)v9[1];
  }
  if (v6 == strlen(abm::kServerStateStarted))
  {
    if (SHIBYTE(v9[2]) >= 0) {
      uint64_t v7 = v9;
    }
    else {
      uint64_t v7 = (void **)v9[0];
    }
    byte_1000242F0 = memcmp(v7, abm::kServerStateStarted, v6) == 0;
    if (v5 < 0) {
      goto LABEL_21;
    }
  }
  else
  {
    byte_1000242F0 = 0;
    if (SHIBYTE(v9[2]) < 0) {
LABEL_21:
    }
      operator delete(v9[0]);
  }
  xpc_release(v3);
}

void sub_100014828(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  xpc_release(object);
  xpc_release(v19);
  _Unwind_Resume(a1);
}

void sub_100014874(void *a1, void *a2)
{
  uint64_t v3 = a2[5];
  a1[4] = a2[4];
  a1[5] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  int v4 = a2[6];
  a1[6] = v4;
  if (v4)
  {
    dispatch_retain(v4);
    int v5 = a1[6];
    if (v5)
    {
      dispatch_group_enter(v5);
    }
  }
}

void sub_1000148E0(uint64_t a1)
{
  xpc_object_t v2 = *(NSObject **)(a1 + 48);
  if (v2)
  {
    dispatch_group_leave(v2);
    uint64_t v3 = *(NSObject **)(a1 + 48);
    if (v3) {
      dispatch_release(v3);
    }
  }
  int v4 = *(std::__shared_weak_count **)(a1 + 40);
  if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
}

int main(int argc, const char **argv, const char **envp)
{
  memset(v16, 170, sizeof(v16));
  CommandShell::convertCmdArgsToList(*(CommandShell **)&argc, argv, v16);
  int v4 = (config::hw *)capabilities::radio::radioUnknown(v3);
  if (v4)
  {
    int v5 = "'abmtool' is not supported on this product.";
    uint64_t v6 = 43;
    goto LABEL_3;
  }
  if (config::hw::watch(v4))
  {
LABEL_15:
    v19[0].__locale_ = (std::locale::__imp *)0xAAAAAAAAAAAAAAAALL;
    pthread_create((pthread_t *)v19, 0, (void *(__cdecl *)(void *))sub_100014C48, v16);
    CFRunLoopRun();
    int v9 = 0;
    if (!v16[2]) {
      return v9;
    }
    goto LABEL_16;
  }
  char v20 = 10;
  strcpy((char *)v19, "CommCenter");
  if ((ctu::isProcessRunning() & 1) == 0)
  {
    char v18 = 9;
    strcpy((char *)__p, "basebandd");
    int v10 = ctu::isProcessRunning() ^ 1;
    if (v18 < 0)
    {
      operator delete(__p[0]);
      if (v20 < 0) {
        goto LABEL_14;
      }
    }
    else if (v20 < 0)
    {
      goto LABEL_14;
    }
LABEL_11:
    if (!v10) {
      goto LABEL_15;
    }
    goto LABEL_12;
  }
  int v10 = 0;
  if ((v20 & 0x80000000) == 0) {
    goto LABEL_11;
  }
LABEL_14:
  operator delete(v19[0].__locale_);
  if (!v10) {
    goto LABEL_15;
  }
LABEL_12:
  int v5 = "CommCenter process is not running. Please run/load CommCenter (or basebandd) and try again.";
  uint64_t v6 = 91;
LABEL_3:
  uint64_t v7 = sub_10000369C(&std::cout, (uint64_t)v5, v6);
  std::ios_base::getloc((const std::ios_base *)((char *)v7 + *(void *)(*v7 - 24)));
  int v8 = std::locale::use_facet(v19, &std::ctype<char>::id);
  ((void (*)(const std::locale::facet *, uint64_t))v8->__vftable[2].~facet_0)(v8, 10);
  std::locale::~locale(v19);
  std::ostream::put();
  std::ostream::flush();
  int v9 = -1;
  if (!v16[2]) {
    return v9;
  }
LABEL_16:
  uint64_t v11 = v16[0];
  size_t v12 = (void *)v16[1];
  uint64_t v13 = *(void *)v16[1];
  *(void *)(v13 + 8) = *(void *)(v16[0] + 8);
  **(void **)(v11 + 8) = v13;
  uint64_t v16[2] = 0;
  if (v12 != v16)
  {
    do
    {
      size_t v15 = (void *)v12[1];
      if (*((char *)v12 + 39) < 0) {
        operator delete((void *)v12[2]);
      }
      operator delete(v12);
      size_t v12 = v15;
    }
    while (v15 != v16);
  }
  return v9;
}

void sub_100014BA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a18 < 0)
  {
    operator delete(__p);
    if ((a24 & 0x80000000) == 0)
    {
LABEL_3:
      sub_100005930(&a10);
      _Unwind_Resume(a1);
    }
  }
  else if ((a24 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a19);
  sub_100005930(&a10);
  _Unwind_Resume(a1);
}

void sub_100014C04(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_100005930(va);
  _Unwind_Resume(a1);
}

void sub_100014C18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::locale a16)
{
}

void sub_100014C34(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_100005930(va);
  _Unwind_Resume(a1);
}

void sub_100014C48(uint64_t a1)
{
  memset(v11, 170, sizeof(v11));
  sub_10000A680(v11, a1);
  uint64_t v1 = (char *)operator new(0x48uLL);
  *(_OWORD *)(v1 + 56) = 0u;
  *(_OWORD *)(v1 + 40) = 0u;
  *(_OWORD *)(v1 + 24) = 0u;
  *(_OWORD *)(v1 + 8) = 0u;
  *(void *)uint64_t v1 = &off_100020818;
  xpc_object_t v2 = operator new(0x20uLL);
  v2[1] = 0;
  void *v2 = &off_100020888;
  v2[2] = 0;
  v2[3] = v1;
  sub_10000A680(&v8, (uint64_t)v11);
  int v3 = CommandShell::run(v1, (uint64_t)&v8);
  if (v10)
  {
    uint64_t v4 = v8;
    int v5 = v9;
    uint64_t v6 = *v9;
    *(void *)(v6 + 8) = *(void *)(v8 + 8);
    **(void **)(v4 + 8) = v6;
    uint64_t v10 = 0;
    if (v5 != &v8)
    {
      do
      {
        uint64_t v7 = (uint64_t *)v5[1];
        if (*((char *)v5 + 39) < 0) {
          operator delete((void *)v5[2]);
        }
        operator delete(v5);
        int v5 = v7;
      }
      while (v7 != &v8);
    }
  }
  exit(v3 ^ 1);
}

void sub_100014D70(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t *a10, uint64_t a11, uint64_t a12, uint64_t *a13, uint64_t a14)
{
  if (a11)
  {
    uint64_t v17 = a9;
    uint64_t v18 = (uint64_t)a10;
    uint64_t v19 = *a10;
    *(void *)(v19 + 8) = *(void *)(a9 + 8);
    **(void **)(v17 + 8) = v19;
    a11 = 0;
    if ((uint64_t *)v18 != &a9)
    {
      do
      {
        char v20 = *(uint64_t **)(v18 + 8);
        if (*(char *)(v18 + 39) < 0) {
          operator delete(*(void **)(v18 + 16));
        }
        operator delete((void *)v18);
        uint64_t v18 = (uint64_t)v20;
      }
      while (v20 != &a9);
    }
  }
  if (!atomic_fetch_add(v15, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
    std::__shared_weak_count::__release_weak(v14);
  }
  if (a14)
  {
    uint64_t v21 = a12;
    uint64_t v22 = (uint64_t)a13;
    uint64_t v23 = *a13;
    *(void *)(v23 + 8) = *(void *)(a12 + 8);
    **(void **)(v21 + 8) = v23;
    a14 = 0;
    if ((uint64_t *)v22 != &a12)
    {
      do
      {
        uint64_t v24 = *(uint64_t **)(v22 + 8);
        if (*(char *)(v22 + 39) < 0) {
          operator delete(*(void **)(v22 + 16));
        }
        operator delete((void *)v22);
        uint64_t v22 = (uint64_t)v24;
      }
      while (v24 != &a12);
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_100014E98(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t sub_100014EC0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t sub_100014EF0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x800000010001F4FDLL) {
    return a1 + 24;
  }
  if (((v3 & 0x800000010001F4FDLL & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x800000010001F4FDLL)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000010001F4FDLL & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 24;
  }
  return 0;
}

void *ABMCommand::ABMCommand(void *a1, char *__s, uint64_t *a3, uint64_t *a4, dispatch_object_t *a5)
{
  uint64_t v8 = *a3;
  uint64_t v7 = (std::__shared_weak_count *)a3[1];
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v10 = *a4;
  int v9 = (std::__shared_weak_count *)a4[1];
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v11 = *a5;
  if (*a5) {
    dispatch_retain(*a5);
  }
  uint64_t v13 = v8;
  uint64_t v14 = v7;
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  CommandBase::CommandBase((uint64_t)a1, __s, &v13);
  if (v14) {
    std::__shared_weak_count::__release_weak(v14);
  }
  *a1 = off_100020728;
  a1[26] = v10;
  a1[27] = v9;
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  a1[28] = v11;
  if (v11)
  {
    dispatch_retain(v11);
    dispatch_release(v11);
  }
  if (v9 && !atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v9);
  }
  if (v7) {
    std::__shared_weak_count::__release_weak(v7);
  }
  *a1 = off_1000208D8;
  return a1;
}

void sub_1000150DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12)
{
  if (a12)
  {
    std::__shared_weak_count::__release_weak(a12);
    if (!v13)
    {
LABEL_3:
      sub_10000340C((uint64_t)&a9);
      if (!v12) {
        goto LABEL_4;
      }
      goto LABEL_7;
    }
  }
  else if (!v13)
  {
    goto LABEL_3;
  }
  dispatch_release(v13);
  sub_10000340C((uint64_t)&a9);
  if (!v12) {
LABEL_4:
  }
    _Unwind_Resume(a1);
LABEL_7:
  std::__shared_weak_count::__release_weak(v12);
  _Unwind_Resume(a1);
}

void sub_10001512C(uint64_t a1)
{
  char v24 = 7;
  strcpy((char *)__p, "logdump");
  uint64_t v3 = *(void *)(a1 + 8);
  xpc_object_t v2 = *(std::__shared_weak_count **)(a1 + 16);
  uint64_t v17 = v3;
  if (!v2 || (uint64_t v4 = std::__shared_weak_count::lock(v2), (v18 = v4) == 0)) {
    sub_100003A44();
  }
  uint64_t v19 = v3;
  char v20 = v4;
  atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  int v5 = *(std::__shared_weak_count **)(a1 + 216);
  uint64_t v15 = *(void *)(a1 + 208);
  size_t v16 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v6 = *(NSObject **)(a1 + 224);
  dispatch_object_t object = v6;
  if (v6) {
    dispatch_retain(v6);
  }
  LogdumpCommand::create("logdump", &v19, &v15, &object, &v21);
  if (v21)
  {
    if ((uint64_t *)(a1 + 168) != sub_1000139E4(a1 + 160, (const void **)__p)) {
      __cxa_rethrow();
    }
    size_t v25 = __p;
    uint64_t v7 = sub_10000E4B4((uint64_t **)(a1 + 160), (const void **)__p, (uint64_t)&std::piecewise_construct, (long long **)&v25);
    int v9 = v21;
    uint64_t v8 = (uint64_t *)v22;
    if (v22) {
      atomic_fetch_add_explicit(&v22->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v10 = (std::__shared_weak_count *)v7[8];
    v7[7] = v9;
    v7[8] = v8;
    if (v10 && !atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  uint64_t v11 = v22;
  if (v22 && !atomic_fetch_add(&v22->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
    std::__shared_weak_count::__release_weak(v11);
  }
  if (object) {
    dispatch_release(object);
  }
  size_t v12 = v16;
  if (v16 && !atomic_fetch_add(&v16->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
  }
  if (v20) {
    std::__shared_weak_count::__release_weak(v20);
  }
  uint64_t v13 = v18;
  if (!v18 || atomic_fetch_add(&v18->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    if ((v24 & 0x80000000) == 0) {
      return;
    }
LABEL_29:
    operator delete(__p[0]);
    return;
  }
  ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
  std::__shared_weak_count::__release_weak(v13);
  if (v24 < 0) {
    goto LABEL_29;
  }
}

void sub_1000153C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (v24) {
    dispatch_release(v24);
  }
  sub_10000340C((uint64_t)&a10);
  std::__shared_weak_count::__release_weak(v23);
  sub_10000340C((uint64_t)&a12);
  if (a23 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t ABMCommand::create@<X0>(char *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, NSObject **a4@<X3>, void *a5@<X8>)
{
  *a5 = 0xAAAAAAAAAAAAAAAALL;
  a5[1] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v10 = operator new(0xE8uLL);
  uint64_t v11 = *a2;
  size_t v12 = (std::__shared_weak_count *)a2[1];
  uint64_t v19 = v11;
  char v20 = v12;
  if (v12) {
    atomic_fetch_add_explicit(&v12->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v13 = *a3;
  uint64_t v14 = (std::__shared_weak_count *)a3[1];
  v18[0] = v13;
  v18[1] = (uint64_t)v14;
  if (v14) {
    atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v15 = *a4;
  dispatch_object_t v17 = v15;
  if (v15) {
    dispatch_retain(v15);
  }
  ABMCommand::ABMCommand(v10, a1, &v19, v18, &v17);
  sub_100015760(a5, (uint64_t)v10);
  if (v15) {
    dispatch_release(v15);
  }
  if (v14 && !atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
    std::__shared_weak_count::__release_weak(v14);
  }
  if (v20) {
    std::__shared_weak_count::__release_weak(v20);
  }
  return (*(uint64_t (**)(void))(*(void *)*a5 + 16))();
}

void sub_10001556C(_Unwind_Exception *a1)
{
  sub_10000340C(v1);
  _Unwind_Resume(a1);
}

void sub_100015580(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  if (v13)
  {
    dispatch_release(v13);
    sub_10000340C((uint64_t)&a11);
    if (!v12)
    {
LABEL_3:
      if (v14) {
        goto LABEL_4;
      }
      goto LABEL_7;
    }
  }
  else
  {
    sub_10000340C((uint64_t)&a11);
    if (!v12) {
      goto LABEL_3;
    }
  }
  std::__shared_weak_count::__release_weak(v12);
  if (v14)
  {
LABEL_4:
    operator delete(v11);
    _Unwind_Resume(a1);
  }
LABEL_7:
  _Unwind_Resume(a1);
}

uint64_t sub_1000155D0(void *a1)
{
  *a1 = off_100020728;
  xpc_object_t v2 = a1[28];
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = (std::__shared_weak_count *)a1[27];
  if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
    uint64_t v4 = (uint64_t)a1;
  }
  else
  {
    uint64_t v4 = (uint64_t)a1;
  }
  return sub_10000EB68(v4);
}

void sub_100015694(void *a1)
{
  *a1 = off_100020728;
  xpc_object_t v2 = a1[28];
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = (std::__shared_weak_count *)a1[27];
  if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
    uint64_t v4 = (void *)sub_10000EB68((uint64_t)a1);
  }
  else
  {
    uint64_t v4 = (void *)sub_10000EB68((uint64_t)a1);
  }
  operator delete(v4);
}

void *sub_100015760(void *a1, uint64_t a2)
{
  *a1 = a2;
  uint64_t v4 = (std::__shared_weak_count *)operator new(0x20uLL);
  v4->__shared_owners_ = 0;
  p_shared_owners = &v4->__shared_owners_;
  v4->__vftable = (std::__shared_weak_count_vtbl *)&off_100020940;
  v4->__shared_weak_owners_ = 0;
  v4[1].__vftable = (std::__shared_weak_count_vtbl *)a2;
  a1[1] = v4;
  if (!a2) {
    return a1;
  }
  uint64_t v6 = *(std::__shared_weak_count **)(a2 + 16);
  if (v6)
  {
    if (v6->__shared_owners_ == -1)
    {
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
      atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
      *(void *)(a2 + 8) = a2;
      *(void *)(a2 + 16) = v4;
      std::__shared_weak_count::__release_weak(v6);
      if (!atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
        goto LABEL_8;
      }
    }
    return a1;
  }
  atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  *(void *)(a2 + 8) = a2;
  *(void *)(a2 + 16) = v4;
  if (atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
    return a1;
  }
LABEL_8:
  ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
  std::__shared_weak_count::__release_weak(v4);
  return a1;
}

void sub_100015878(_Unwind_Exception *exception_object)
{
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000158B4(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t sub_1000158DC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t sub_10001590C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x800000010001F5DFLL) {
    return a1 + 24;
  }
  if (((v3 & 0x800000010001F5DFLL & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x800000010001F5DFLL)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000010001F5DFLL & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 24;
  }
  return 0;
}

void *LogdumpCommand::LogdumpCommand(void *a1, char *__s, uint64_t *a3, uint64_t *a4, dispatch_object_t *a5)
{
  uint64_t v8 = *a3;
  uint64_t v7 = (std::__shared_weak_count *)a3[1];
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v10 = *a4;
  int v9 = (std::__shared_weak_count *)a4[1];
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v11 = *a5;
  if (*a5) {
    dispatch_retain(*a5);
  }
  uint64_t v13 = v8;
  int v14 = v7;
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  CommandBase::CommandBase((uint64_t)a1, __s, &v13);
  if (v14) {
    std::__shared_weak_count::__release_weak(v14);
  }
  *a1 = off_100020728;
  a1[26] = v10;
  a1[27] = v9;
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  a1[28] = v11;
  if (v11)
  {
    dispatch_retain(v11);
    dispatch_release(v11);
  }
  if (v9 && !atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v9);
  }
  if (v7) {
    std::__shared_weak_count::__release_weak(v7);
  }
  *a1 = off_100020990;
  return a1;
}

void sub_100015AF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12)
{
  if (a12)
  {
    std::__shared_weak_count::__release_weak(a12);
    if (!v13)
    {
LABEL_3:
      sub_10000340C((uint64_t)&a9);
      if (!v12) {
        goto LABEL_4;
      }
      goto LABEL_7;
    }
  }
  else if (!v13)
  {
    goto LABEL_3;
  }
  dispatch_release(v13);
  sub_10000340C((uint64_t)&a9);
  if (!v12) {
LABEL_4:
  }
    _Unwind_Resume(a1);
LABEL_7:
  std::__shared_weak_count::__release_weak(v12);
  _Unwind_Resume(a1);
}

uint64_t sub_100015B48(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 *)(a2 + 23);
  int v3 = (char)v2;
  if ((v2 & 0x80u) != 0) {
    uint64_t v2 = *(void *)(a2 + 8);
  }
  if (v2 == 2)
  {
    uint64_t v4 = v3 >= 0 ? (_WORD *)a2 : *(_WORD **)a2;
    if (*v4 == 25186) {
      return 1;
    }
  }
  if (byte_1000242F0) {
    return 1;
  }
  size_t v6 = strlen(kServerDownErrorPrint);
  uint64_t v7 = sub_10000369C(&std::cerr, (uint64_t)kServerDownErrorPrint, v6);
  std::ios_base::getloc((const std::ios_base *)((char *)v7 + *(void *)(*v7 - 24)));
  uint64_t v8 = std::locale::use_facet(&v9, &std::ctype<char>::id);
  ((void (*)(const std::locale::facet *, uint64_t))v8->__vftable[2].~facet_0)(v8, 10);
  std::locale::~locale(&v9);
  std::ostream::put();
  std::ostream::flush();
  return 0;
}

void sub_100015C6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
}

void sub_100015C80(uint64_t a1, std::__shared_weak_count *a2, _DWORD *a3)
{
  int v41 = 0;
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)size_t v39 = v4;
  long long v40 = v4;
  uint64_t v37 = a1;
  uint64_t v38 = a2;
  if (a2) {
    atomic_fetch_add_explicit(&a2->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  int v5 = (const void *)abm::kTraceCompression;
  size_t v6 = strlen(abm::kTraceCompression);
  if (v6 > 0x7FFFFFFFFFFFFFF7) {
    sub_100003540();
  }
  uint64_t v7 = (void *)v6;
  if (v6 >= 0x17)
  {
    uint64_t v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17) {
      uint64_t v9 = v6 | 7;
    }
    uint64_t v10 = v9 + 1;
    uint64_t v8 = (void **)operator new(v9 + 1);
    __dst[1] = v7;
    unint64_t v36 = v10 | 0x8000000000000000;
    __dst[0] = v8;
    goto LABEL_10;
  }
  HIBYTE(v36) = v6;
  uint64_t v8 = __dst;
  if (v6) {
LABEL_10:
  }
    memmove(v8, v5, (size_t)v7);
  *((unsigned char *)v7 + (void)v8) = 0;
  uint64_t v11 = (const void *)abm::helper::kKeyMode;
  size_t v12 = strlen(abm::helper::kKeyMode);
  if (v12 > 0x7FFFFFFFFFFFFFF7) {
    sub_100003540();
  }
  uint64_t v13 = (void *)v12;
  if (v12 >= 0x17)
  {
    uint64_t v15 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v12 | 7) != 0x17) {
      uint64_t v15 = v12 | 7;
    }
    uint64_t v16 = v15 + 1;
    int v14 = operator new(v15 + 1);
    __p[1] = v13;
    unint64_t v34 = v16 | 0x8000000000000000;
    __p[0] = v14;
    goto LABEL_18;
  }
  HIBYTE(v34) = v12;
  int v14 = __p;
  if (v12) {
LABEL_18:
  }
    memmove(v14, v11, (size_t)v13);
  *((unsigned char *)v13 + (void)v14) = 0;
  TraceCommand::GetTraceProperty(&v37, (const char *)__dst, (const char *)__p, (uint64_t)&v41, 0, (uint64_t)v39);
  if (SHIBYTE(v34) < 0)
  {
    operator delete(__p[0]);
    if ((SHIBYTE(v36) & 0x80000000) == 0)
    {
LABEL_21:
      dispatch_object_t v17 = v38;
      if (!v38) {
        goto LABEL_26;
      }
      goto LABEL_25;
    }
  }
  else if ((SHIBYTE(v36) & 0x80000000) == 0)
  {
    goto LABEL_21;
  }
  operator delete(__dst[0]);
  dispatch_object_t v17 = v38;
  if (!v38) {
    goto LABEL_26;
  }
LABEL_25:
  if (!atomic_fetch_add(&v17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
    std::__shared_weak_count::__release_weak(v17);
    if (LODWORD(v39[0])) {
      goto LABEL_27;
    }
    goto LABEL_30;
  }
LABEL_26:
  if (LODWORD(v39[0]))
  {
LABEL_27:
    uint64_t v18 = "Unable to get compression mode";
    uint64_t v19 = &std::cout;
    uint64_t v20 = 30;
LABEL_28:
    uint64_t v21 = sub_10000369C(v19, (uint64_t)v18, v20);
    std::ios_base::getloc((const std::ios_base *)((char *)v21 + *(void *)(*v21 - 24)));
    uint64_t v22 = std::locale::use_facet((const std::locale *)&v32, &std::ctype<char>::id);
    ((void (*)(const std::locale::facet *, uint64_t))v22->__vftable[2].~facet_0)(v22, 10);
    std::locale::~locale((std::locale *)&v32);
    std::ostream::put();
    std::ostream::flush();
    goto LABEL_38;
  }
LABEL_30:
  std::to_string(&v32, 0);
  char v23 = util::equal_nocase();
  char v24 = v23;
  if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v32.__r_.__value_.__l.__data_);
    if (v24)
    {
LABEL_32:
      *a3 = 0;
      if ((SHIBYTE(v40) & 0x80000000) == 0) {
        goto LABEL_39;
      }
      goto LABEL_45;
    }
  }
  else if (v23)
  {
    goto LABEL_32;
  }
  std::to_string(&v32, 1);
  char v25 = util::equal_nocase();
  char v26 = v25;
  if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v32.__r_.__value_.__l.__data_);
    if (v26) {
      goto LABEL_37;
    }
  }
  else if (v25)
  {
LABEL_37:
    *a3 = 1;
LABEL_38:
    if ((SHIBYTE(v40) & 0x80000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_45;
  }
  std::to_string(&v32, 2);
  char v27 = util::equal_nocase();
  char v28 = v27;
  if ((SHIBYTE(v32.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (v27) {
      goto LABEL_44;
    }
LABEL_48:
    size_t v29 = sub_10000369C(&std::cout, (uint64_t)"Invalid trace mode ", 19);
    if (v43 >= 0) {
      uint64_t v30 = (void **)&v41;
    }
    else {
      uint64_t v30 = v41;
    }
    if (v43 >= 0) {
      uint64_t v31 = HIBYTE(v43);
    }
    else {
      uint64_t v31 = v42;
    }
    uint64_t v19 = (std::ostream *)sub_10000369C(v29, (uint64_t)v30, v31);
    uint64_t v18 = " received";
    uint64_t v20 = 9;
    goto LABEL_28;
  }
  operator delete(v32.__r_.__value_.__l.__data_);
  if ((v28 & 1) == 0) {
    goto LABEL_48;
  }
LABEL_44:
  *a3 = 2;
  if ((SHIBYTE(v40) & 0x80000000) == 0)
  {
LABEL_39:
    if ((SHIBYTE(v43) & 0x80000000) == 0) {
      return;
    }
LABEL_46:
    operator delete(v41);
    return;
  }
LABEL_45:
  operator delete(v39[1]);
  if (SHIBYTE(v43) < 0) {
    goto LABEL_46;
  }
}

void sub_100016084(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,char a28,uint64_t a29,uint64_t a30,void *a31,uint64_t a32,int a33,__int16 a34,char a35,char a36)
{
  if (a15 < 0)
  {
    operator delete(__p);
    if ((a36 & 0x80000000) == 0)
    {
LABEL_3:
      if ((*(char *)(v36 - 49) & 0x80000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_7;
    }
  }
  else if ((a36 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a31);
  if ((*(char *)(v36 - 49) & 0x80000000) == 0) {
LABEL_4:
  }
    _Unwind_Resume(exception_object);
LABEL_7:
  operator delete(*(void **)(v36 - 72));
  _Unwind_Resume(exception_object);
}

void *sub_10001615C(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_100003540();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    size_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    size_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void sub_100016210(uint64_t a1, std::__shared_weak_count *a2, BOOL *a3)
{
  memset(&v28, 0, sizeof(v28));
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)char v26 = v4;
  long long v27 = v4;
  uint64_t v24 = a1;
  char v25 = a2;
  if (a2) {
    atomic_fetch_add_explicit(&a2->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  size_t v5 = (const void *)abm::kTraceCompression;
  size_t v6 = strlen(abm::kTraceCompression);
  if (v6 > 0x7FFFFFFFFFFFFFF7) {
    sub_100003540();
  }
  uint64_t v7 = (void *)v6;
  if (v6 >= 0x17)
  {
    uint64_t v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17) {
      uint64_t v9 = v6 | 7;
    }
    uint64_t v10 = v9 + 1;
    uint64_t v8 = (void **)operator new(v9 + 1);
    __dst[1] = v7;
    unint64_t v23 = v10 | 0x8000000000000000;
    __dst[0] = v8;
    goto LABEL_10;
  }
  HIBYTE(v23) = v6;
  uint64_t v8 = __dst;
  if (v6) {
LABEL_10:
  }
    memmove(v8, v5, (size_t)v7);
  *((unsigned char *)v7 + (void)v8) = 0;
  uint64_t v11 = (const void *)abm::helper::kKeySplitArchive;
  size_t v12 = strlen(abm::helper::kKeySplitArchive);
  if (v12 > 0x7FFFFFFFFFFFFFF7) {
    sub_100003540();
  }
  uint64_t v13 = (void *)v12;
  if (v12 >= 0x17)
  {
    uint64_t v15 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v12 | 7) != 0x17) {
      uint64_t v15 = v12 | 7;
    }
    uint64_t v16 = v15 + 1;
    int v14 = operator new(v15 + 1);
    __p[1] = v13;
    unint64_t v21 = v16 | 0x8000000000000000;
    __p[0] = v14;
    goto LABEL_18;
  }
  HIBYTE(v21) = v12;
  int v14 = __p;
  if (v12) {
LABEL_18:
  }
    memmove(v14, v11, (size_t)v13);
  *((unsigned char *)v13 + (void)v14) = 0;
  TraceCommand::GetTraceProperty(&v24, (const char *)__dst, (const char *)__p, (uint64_t)&v28, 0, (uint64_t)v26);
  if (SHIBYTE(v21) < 0)
  {
    operator delete(__p[0]);
    if ((SHIBYTE(v23) & 0x80000000) == 0)
    {
LABEL_21:
      dispatch_object_t v17 = v25;
      if (!v25) {
        goto LABEL_26;
      }
      goto LABEL_25;
    }
  }
  else if ((SHIBYTE(v23) & 0x80000000) == 0)
  {
    goto LABEL_21;
  }
  operator delete(__dst[0]);
  dispatch_object_t v17 = v25;
  if (!v25) {
    goto LABEL_26;
  }
LABEL_25:
  if (!atomic_fetch_add(&v17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
    std::__shared_weak_count::__release_weak(v17);
    if (LODWORD(v26[0])) {
      goto LABEL_30;
    }
    goto LABEL_27;
  }
LABEL_26:
  if (LODWORD(v26[0]))
  {
LABEL_30:
    uint64_t v18 = sub_10000369C(&std::cout, (uint64_t)"Unable to get 'Split Archive' property", 38);
    std::ios_base::getloc((const std::ios_base *)((char *)v18 + *(void *)(*v18 - 24)));
    uint64_t v19 = std::locale::use_facet(&v29, &std::ctype<char>::id);
    ((void (*)(const std::locale::facet *, uint64_t))v19->__vftable[2].~facet_0)(v19, 10);
    std::locale::~locale(&v29);
    std::ostream::put();
    std::ostream::flush();
    goto LABEL_31;
  }
LABEL_27:
  if ((sub_1000165A8(&v28, a3) & 1) == 0) {
    goto LABEL_30;
  }
LABEL_31:
  if ((SHIBYTE(v27) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v28.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      return;
    }
LABEL_35:
    operator delete(v28.__r_.__value_.__l.__data_);
    return;
  }
  operator delete(v26[1]);
  if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_35;
  }
}

void sub_100016514(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  sub_10000340C((uint64_t)&a21);
  if ((*(char *)(v29 - 57) & 0x80000000) == 0) {
    _Unwind_Resume(a1);
  }
  operator delete(*(void **)(v29 - 80));
  _Unwind_Resume(a1);
}

uint64_t sub_1000165A8(const std::string *a1, BOOL *a2)
{
  if (SHIBYTE(a1->__r_.__value_.__r.__words[2]) < 0)
  {
    long long v4 = (const char *)a1->__r_.__value_.__r.__words[0];
    if (strcasecmp(a1->__r_.__value_.__l.__data_, "false") && strcasecmp(v4, "off") && strcasecmp(v4, "no"))
    {
      if (!strcasecmp(v4, "true")
        || !strcasecmp(v4, "on")
        || !strcasecmp(v4, "yes")
        || !strcasecmp(v4, "full")
        || !strcasecmp(v4, "streaming")
        || !strcasecmp(v4, "lite"))
      {
        goto LABEL_28;
      }
      goto LABEL_21;
    }
LABEL_27:
    unint64_t v5 = 0;
LABEL_29:
    *a2 = v5 != 0;
    return 1;
  }
  if (!strcasecmp((const char *)a1, "false")
    || !strcasecmp((const char *)a1, "off")
    || !strcasecmp((const char *)a1, "no"))
  {
    goto LABEL_27;
  }
  if (!strcasecmp((const char *)a1, "true")) {
    goto LABEL_28;
  }
  if (!strcasecmp((const char *)a1, "on")) {
    goto LABEL_28;
  }
  if (!strcasecmp((const char *)a1, "yes")) {
    goto LABEL_28;
  }
  if (!strcasecmp((const char *)a1, "full")) {
    goto LABEL_28;
  }
  if (!strcasecmp((const char *)a1, "streaming")) {
    goto LABEL_28;
  }
  long long v4 = (const char *)a1;
  if (!strcasecmp((const char *)a1, "lite")) {
    goto LABEL_28;
  }
LABEL_21:
  if (!strcasecmp(v4, "background"))
  {
LABEL_28:
    unint64_t v5 = 1;
    goto LABEL_29;
  }
  size_t __idx = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v5 = std::stol(a1, &__idx, 0);
  uint64_t v6 = 0;
  std::string::size_type size = HIBYTE(a1->__r_.__value_.__r.__words[2]);
  if ((size & 0x80u) != 0) {
    std::string::size_type size = a1->__r_.__value_.__l.__size_;
  }
  if (__idx == size && v5 < 2) {
    goto LABEL_29;
  }
  return v6;
}

uint64_t sub_1000167D4(void *a1)
{
  return 0;
}

void sub_1000167F8(uint64_t a1)
{
  char v28 = 3;
  LODWORD(v27) = 7103860;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 3221225472;
  aBlock[2] = sub_100016D00;
  aBlock[3] = &unk_100020A00;
  aBlock[4] = a1;
  char v26 = _Block_copy(aBlock);
  unint64_t v23 = (char *)operator new(0x70uLL);
  long long v24 = xmmword_10001F640;
  strcpy(v23, "[nocompress|tar.gz|tar] [no-split-archive|split-archive] [nonui] [clear] [REASON] collect telephony logs");
  CommandBase::addCommandHandler(a1, (uint64_t)&v27, (const void **)&v26, (uint64_t)&v23);
  if (SHIBYTE(v24) < 0)
  {
    operator delete(v23);
    uint64_t v2 = v26;
    if (!v26) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v2 = v26;
  if (v26) {
LABEL_5:
  }
    _Block_release(v2);
LABEL_6:
  if (v28 < 0) {
    operator delete(v27);
  }
  char v22 = 4;
  strcpy((char *)v21, "core");
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  std::locale v19[2] = sub_100018D64;
  v19[3] = &unk_100020A00;
  v19[4] = a1;
  uint64_t v20 = _Block_copy(v19);
  std::string __p = operator new(0x70uLL);
  long long v18 = xmmword_10001F650;
  strcpy((char *)__p, "[nocompress|tar.gz|tar] [no-split-archive|split-archive] [nonui] [REASON] collect telephony logs with coredump");
  CommandBase::addCommandHandler(a1, (uint64_t)v21, (const void **)&v20, (uint64_t)&__p);
  if (SHIBYTE(v18) < 0)
  {
    operator delete(__p);
    int v3 = v20;
    if (!v20) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  int v3 = v20;
  if (v20) {
LABEL_12:
  }
    _Block_release(v3);
LABEL_13:
  if (v22 < 0) {
    operator delete(v21[0]);
  }
  char v16 = 2;
  strcpy((char *)v15, "bb");
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100019CE4;
  v13[3] = &unk_100020A00;
  v13[4] = a1;
  int v14 = _Block_copy(v13);
  uint64_t v11 = operator new(0x60uLL);
  long long v12 = xmmword_10001F660;
  strcpy((char *)v11, "[nocompress|tar.gz|tar] [no-split-archive|split-archive] [REASON] collect baseband logs only");
  CommandBase::addCommandHandler(a1, (uint64_t)v15, (const void **)&v14, (uint64_t)&v11);
  if (SHIBYTE(v12) < 0)
  {
    operator delete(v11);
    long long v4 = v14;
    if (!v14) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  long long v4 = v14;
  if (v14) {
LABEL_19:
  }
    _Block_release(v4);
LABEL_20:
  if (v16 < 0) {
    operator delete(v15[0]);
  }
  char v10 = 5;
  strcpy((char *)v9, "oslog");
  uint64_t v8 = _Block_copy(&stru_100020A70);
  uint64_t v6 = operator new(0x78uLL);
  long long v7 = xmmword_10001F670;
  strcpy((char *)v6, "[history size] [output txt file path] -p <process1 process2..> -i <imagePath1 imagePath2..> collect oslog to txt");
  CommandBase::addCommandHandler(a1, (uint64_t)v9, (const void **)&v8, (uint64_t)&v6);
  if (SHIBYTE(v7) < 0)
  {
    operator delete(v6);
    unint64_t v5 = v8;
    if (!v8) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  unint64_t v5 = v8;
  if (v8) {
LABEL_26:
  }
    _Block_release(v5);
LABEL_27:
  if (v10 < 0) {
    operator delete(v9[0]);
  }
}

void sub_100016BE4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *aBlock, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,void *a34,char a35,uint64_t a36,int a37,__int16 a38,char a39,char a40,void *a41,uint64_t a42,int a43,__int16 a44,char a45,char a46)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (a22 < 0) {
    operator delete(a17);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100016D00(defaults::compression *a1, NSObject **a2, uint64_t a3)
{
  uint64_t v5 = *((void *)a1 + 4);
  int v48 = defaults::compression::mode(a1);
  sub_100015C80(*(void *)(v5 + 208), *(std::__shared_weak_count **)(v5 + 216), &v48);
  BOOL v47 = defaults::compression::splitArchive(v6);
  sub_100016210(*(void *)(v5 + 208), *(std::__shared_weak_count **)(v5 + 216), &v47);
  __int16 v46 = 0;
  v44[0] = 0;
  v44[1] = 0;
  uint64_t v45 = 0;
  sub_10000A680(&v41, a3);
  sub_100017384(&v41, &v48, &v47, (unsigned char *)&v46 + 1, &v46, v44);
  if (v43)
  {
    uint64_t v7 = v41;
    uint64_t v8 = v42;
    uint64_t v9 = *v42;
    *(void *)(v9 + 8) = *(void *)(v41 + 8);
    **(void **)(v7 + 8) = v9;
    uint64_t v43 = 0;
    if (v8 != &v41)
    {
      do
      {
        uint64_t v13 = (uint64_t *)v8[1];
        if (*((char *)v8 + 39) < 0) {
          operator delete((void *)v8[2]);
        }
        operator delete(v8);
        uint64_t v8 = v13;
      }
      while (v13 != &v41);
    }
  }
  if (sub_1000178B0(v5)) {
    int v10 = 0;
  }
  else {
    int v10 = v48;
  }
  int v48 = v10;
  if (!v10) {
    BOOL v47 = 0;
  }
  xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
  if (v11 || (xpc_object_t v11 = xpc_null_create()) != 0)
  {
    if (xpc_get_type(v11) == (xpc_type_t)&_xpc_type_dictionary)
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
  xpc_object_t v14 = xpc_string_create(abm::kCollectTelephonyLogs);
  if (!v14) {
    xpc_object_t v14 = xpc_null_create();
  }
  xpc_dictionary_set_value(v12, abm::kKeyTraceAction, v14);
  xpc_object_t v15 = xpc_null_create();
  xpc_release(v14);
  xpc_release(v15);
  if (v45 >= 0) {
    char v16 = (const char *)v44;
  }
  else {
    char v16 = (const char *)v44[0];
  }
  xpc_object_t v17 = xpc_string_create(v16);
  if (!v17) {
    xpc_object_t v17 = xpc_null_create();
  }
  xpc_dictionary_set_value(v12, abm::kKeyTraceDumpStateReason, v17);
  xpc_object_t v18 = xpc_null_create();
  xpc_release(v17);
  xpc_release(v18);
  xpc_object_t v19 = xpc_int64_create(v10);
  if (!v19) {
    xpc_object_t v19 = xpc_null_create();
  }
  xpc_dictionary_set_value(v12, abm::kKeyTraceDumpStatePerformCompression, v19);
  xpc_object_t v20 = xpc_null_create();
  xpc_release(v19);
  xpc_release(v20);
  xpc_object_t v21 = xpc_BOOL_create(v47);
  if (!v21) {
    xpc_object_t v21 = xpc_null_create();
  }
  xpc_dictionary_set_value(v12, abm::kKeyTraceDumpStateSplitArchive, v21);
  xpc_object_t v22 = xpc_null_create();
  xpc_release(v21);
  xpc_release(v22);
  if (HIBYTE(v46))
  {
    xpc_object_t v23 = xpc_BOOL_create(0);
    if (!v23) {
      xpc_object_t v23 = xpc_null_create();
    }
    xpc_dictionary_set_value(v12, abm::kKeyTraceUserConfirmation, v23);
    xpc_object_t v24 = xpc_null_create();
    xpc_release(v23);
    xpc_release(v24);
  }
  if ((_BYTE)v46)
  {
    xpc_object_t v25 = xpc_BOOL_create(1);
    if (!v25) {
      xpc_object_t v25 = xpc_null_create();
    }
    xpc_dictionary_set_value(v12, abm::kKeyTraceClear, v25);
    xpc_object_t v26 = xpc_null_create();
    xpc_release(v25);
    xpc_release(v26);
  }
  long long v27 = *a2;
  if (v27)
  {
    dispatch_retain(v27);
    dispatch_group_enter(v27);
  }
  uint64_t v39 = *(void *)(v5 + 208);
  char v28 = *(std::__shared_weak_count **)(v5 + 216);
  long long v40 = v28;
  if (v28) {
    atomic_fetch_add_explicit(&v28->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v29 = (const void *)abm::kCommandTraceDumpState;
  size_t v30 = strlen(abm::kCommandTraceDumpState);
  if (v30 >= 0x7FFFFFFFFFFFFFF8) {
    sub_100003540();
  }
  uint64_t v31 = (void *)v30;
  if (v30 >= 0x17)
  {
    uint64_t v33 = (v30 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v30 | 7) != 0x17) {
      uint64_t v33 = v30 | 7;
    }
    uint64_t v34 = v33 + 1;
    std::string v32 = (void **)operator new(v33 + 1);
    __dst[1] = v31;
    unint64_t v38 = v34 | 0x8000000000000000;
    __dst[0] = v32;
    goto LABEL_47;
  }
  HIBYTE(v38) = v30;
  std::string v32 = __dst;
  if (v30) {
LABEL_47:
  }
    memmove(v32, v29, (size_t)v31);
  *((unsigned char *)v31 + (void)v32) = 0;
  if (v27)
  {
    dispatch_retain(v27);
    dispatch_group_enter(v27);
  }
  abm::client::PerformCommand();
  if (SHIBYTE(v38) < 0) {
    operator delete(__dst[0]);
  }
  v35 = v40;
  if (v40 && !atomic_fetch_add(&v40->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
    std::__shared_weak_count::__release_weak(v35);
  }
  if (v27)
  {
    dispatch_group_leave(v27);
    dispatch_release(v27);
    dispatch_group_leave(v27);
    dispatch_release(v27);
  }
  xpc_release(v12);
  if (SHIBYTE(v45) < 0) {
    operator delete(v44[0]);
  }
  return 1;
}

void sub_10001729C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, dispatch_group_t group, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,char a23,uint64_t a24,char a25)
{
  if (group)
  {
    dispatch_group_leave(group);
    dispatch_release(group);
  }
  if (a22 < 0) {
    operator delete(__p);
  }
  sub_10000340C((uint64_t)&a23);
  if (v26)
  {
    dispatch_group_leave(v26);
    dispatch_release(v26);
  }
  xpc_release(v25);
  if (*(char *)(v27 - 73) < 0) {
    operator delete(*(void **)(v27 - 96));
  }
  _Unwind_Resume(a1);
}

void sub_100017384(void *a1, _DWORD *a2, unsigned char *a3, unsigned char *a4, unsigned char *a5, void **__dst)
{
  sub_10000E79C(__dst, "[abmtool] User triggered", 0x18uLL);
  do
  {
    uint64_t v8 = a1[2];
    if (!v8) {
      break;
    }
    memset(__dsta, 170, 24);
    uint64_t v9 = (char *)*a1;
    if (*(char *)(*a1 + 39) < 0)
    {
      sub_1000035FC(__dsta, *((void **)v9 + 2), *((void *)v9 + 3));
      uint64_t v9 = (char *)*a1;
      uint64_t v8 = a1[2];
    }
    else
    {
      *(_OWORD *)__dsta = *((_OWORD *)v9 + 1);
      __dsta[2] = *((void **)v9 + 4);
    }
    int v10 = *(void **)v9;
    v10[1] = *((void *)v9 + 1);
    **((void **)v9 + 1) = v10;
    a1[2] = v8 - 1;
    if (v9[39] < 0) {
      operator delete(*((void **)v9 + 2));
    }
    operator delete(v9);
    HIBYTE(__p[2]) = 10;
    strcpy((char *)__p, "nocompress");
    int v11 = util::equal_nocase();
    int v12 = v11;
    if (SHIBYTE(__p[2]) < 0)
    {
      operator delete(__p[0]);
      if (v12)
      {
LABEL_11:
        *a2 = 0;
        char v13 = 1;
        if (SHIBYTE(__dsta[2]) < 0) {
          goto LABEL_60;
        }
        continue;
      }
    }
    else if (v11)
    {
      goto LABEL_11;
    }
    HIBYTE(__p[2]) = 6;
    strcpy((char *)__p, "tar.gz");
    int v14 = util::equal_nocase();
    int v15 = v14;
    if (SHIBYTE(__p[2]) < 0)
    {
      operator delete(__p[0]);
      if (v15)
      {
LABEL_16:
        char v13 = 1;
        *a2 = 1;
        if (SHIBYTE(__dsta[2]) < 0) {
          goto LABEL_60;
        }
        continue;
      }
    }
    else if (v14)
    {
      goto LABEL_16;
    }
    HIBYTE(__p[2]) = 3;
    LODWORD(__p[0]) = 7496052;
    int v16 = util::equal_nocase();
    int v17 = v16;
    if (SHIBYTE(__p[2]) < 0)
    {
      operator delete(__p[0]);
      if (v17)
      {
LABEL_21:
        *a2 = 2;
        char v13 = 1;
        if (SHIBYTE(__dsta[2]) < 0) {
          goto LABEL_60;
        }
        continue;
      }
    }
    else if (v16)
    {
      goto LABEL_21;
    }
    HIBYTE(__p[2]) = 5;
    strcpy((char *)__p, "nonui");
    int v18 = util::equal_nocase();
    int v19 = v18;
    if (SHIBYTE(__p[2]) < 0)
    {
      operator delete(__p[0]);
      if (v19)
      {
LABEL_26:
        char v13 = 1;
        *a4 = 1;
        if (SHIBYTE(__dsta[2]) < 0) {
          goto LABEL_60;
        }
        continue;
      }
    }
    else if (v18)
    {
      goto LABEL_26;
    }
    HIBYTE(__p[2]) = 5;
    strcpy((char *)__p, "clear");
    int v20 = util::equal_nocase();
    int v21 = v20;
    if (SHIBYTE(__p[2]) < 0)
    {
      operator delete(__p[0]);
      if (v21)
      {
LABEL_31:
        char v13 = 1;
        *a5 = 1;
        if (SHIBYTE(__dsta[2]) < 0) {
          goto LABEL_60;
        }
        continue;
      }
    }
    else if (v20)
    {
      goto LABEL_31;
    }
    HIBYTE(__p[2]) = 13;
    strcpy((char *)__p, "split-archive");
    int v22 = util::equal_nocase();
    int v23 = v22;
    if (SHIBYTE(__p[2]) < 0)
    {
      operator delete(__p[0]);
      if (v23)
      {
LABEL_36:
        char v13 = 1;
        *a3 = 1;
        if (SHIBYTE(__dsta[2]) < 0) {
          goto LABEL_60;
        }
        continue;
      }
    }
    else if (v22)
    {
      goto LABEL_36;
    }
    HIBYTE(__p[2]) = 16;
    strcpy((char *)__p, "no-split-archive");
    int v24 = util::equal_nocase();
    int v25 = v24;
    if (SHIBYTE(__p[2]) < 0)
    {
      operator delete(__p[0]);
      if (!v25)
      {
LABEL_44:
        xpc_object_t v26 = (void *)HIBYTE(__dsta[2]);
        int v27 = SHIBYTE(__dsta[2]);
        if (SHIBYTE(__dsta[2]) < 0) {
          xpc_object_t v26 = __dsta[1];
        }
        size_t v37 = (size_t)v26;
        unint64_t v28 = (unint64_t)v26 + 10;
        memset(__p, 170, 24);
        if ((unint64_t)v26 + 10 >= 0x7FFFFFFFFFFFFFF8) {
          sub_100003540();
        }
        if (v28 >= 0x17)
        {
          int v36 = SHIBYTE(__dsta[2]);
          uint64_t v31 = (v28 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v28 | 7) != 0x17) {
            uint64_t v31 = v28 | 7;
          }
          uint64_t v32 = v31 + 1;
          uint64_t v33 = (char *)operator new(v31 + 1);
          __p[1] = (void *)v28;
          __p[2] = (void *)(v32 | 0x8000000000000000);
          __p[0] = v33;
          *((_WORD *)v33 + 4) = 8285;
          *(void *)uint64_t v33 = *(void *)"[abmtool] ";
          size_t v30 = v33 + 10;
          size_t v29 = v37;
          int v27 = v36;
        }
        else
        {
          __p[1] = (void *)8285;
          __p[2] = 0;
          HIBYTE(__p[2]) = (_BYTE)v26 + 10;
          __p[0] = *(void **)"[abmtool] ";
          size_t v29 = (size_t)v26;
          size_t v30 = (char *)&__p[1] + 2;
          if (!v26) {
            goto LABEL_57;
          }
        }
        if (v27 >= 0) {
          uint64_t v34 = __dsta;
        }
        else {
          uint64_t v34 = (void **)__dsta[0];
        }
        memmove(v30, v34, v29);
LABEL_57:
        v30[v29] = 0;
        v35 = __dst;
        if (*((char *)__dst + 23) < 0)
        {
          operator delete(*__dst);
          v35 = __dst;
        }
        char v13 = 0;
        *(_OWORD *)v35 = *(_OWORD *)__p;
        v35[2] = __p[2];
        if ((SHIBYTE(__dsta[2]) & 0x80000000) == 0) {
          continue;
        }
LABEL_60:
        operator delete(__dsta[0]);
        continue;
      }
    }
    else if (!v24)
    {
      goto LABEL_44;
    }
    *a3 = 0;
    char v13 = 1;
    if (SHIBYTE(__dsta[2]) < 0) {
      goto LABEL_60;
    }
  }
  while ((v13 & 1) != 0);
  if (!*a2) {
    *a3 = 0;
  }
}

void sub_100017848(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if ((a29 & 0x80000000) == 0) {
    _Unwind_Resume(exception_object);
  }
  operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_1000178B0(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  if (v2 || (xpc_object_t v2 = xpc_null_create()) != 0)
  {
    if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_dictionary)
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
  xpc_object_t v4 = xpc_string_create(abm::kTraceSystemLogs);
  if (!v4) {
    xpc_object_t v4 = xpc_null_create();
  }
  xpc_dictionary_set_value(v3, abm::kKeyTraceName, v4);
  xpc_object_t v5 = xpc_null_create();
  xpc_release(v4);
  xpc_release(v5);
  xpc_object_t v6 = xpc_string_create(abm::kKeyTraceMode);
  if (!v6) {
    xpc_object_t v6 = xpc_null_create();
  }
  xpc_dictionary_set_value(v3, abm::kKeyTracePropertyName, v6);
  xpc_object_t v7 = xpc_null_create();
  xpc_release(v6);
  xpc_release(v7);
  xpc_object_t v33 = xpc_null_create();
  *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)std::string __p = v8;
  long long v32 = v8;
  uint64_t v9 = *(std::__shared_weak_count **)(a1 + 216);
  uint64_t v29 = *(void *)(a1 + 208);
  size_t v30 = v9;
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  int v10 = (const void *)abm::kCommandGetTraceProperty;
  size_t v11 = strlen(abm::kCommandGetTraceProperty);
  if (v11 >= 0x7FFFFFFFFFFFFFF8) {
    sub_100003540();
  }
  std::string::size_type v12 = v11;
  if (v11 >= 0x17)
  {
    uint64_t v14 = (v11 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v11 | 7) != 0x17) {
      uint64_t v14 = v11 | 7;
    }
    uint64_t v15 = v14 + 1;
    p_dst = (std::string *)operator new(v14 + 1);
    __dst.__r_.__value_.__l.__size_ = v12;
    __dst.__r_.__value_.__r.__words[2] = v15 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
    goto LABEL_20;
  }
  *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v11;
  p_dst = &__dst;
  if (v11) {
LABEL_20:
  }
    memmove(p_dst, v10, v12);
  p_dst->__r_.__value_.__s.__data_[v12] = 0;
  abm::client::PerformCommand();
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__dst.__r_.__value_.__l.__data_);
    int v16 = v30;
    if (!v30) {
      goto LABEL_26;
    }
  }
  else
  {
    int v16 = v30;
    if (!v30)
    {
LABEL_26:
      xpc_object_t v17 = v33;
      if (v33) {
        goto LABEL_30;
      }
      goto LABEL_27;
    }
  }
  if (atomic_fetch_add(&v16->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    goto LABEL_26;
  }
  ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
  std::__shared_weak_count::__release_weak(v16);
  xpc_object_t v17 = v33;
  if (v33)
  {
LABEL_30:
    if (xpc_get_type(v17) == (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_retain(v17);
      xpc_object_t v18 = v17;
    }
    else
    {
      xpc_object_t v18 = xpc_null_create();
    }
    goto LABEL_33;
  }
LABEL_27:
  xpc_object_t v17 = xpc_null_create();
  if (v17) {
    goto LABEL_30;
  }
  xpc_object_t v18 = xpc_null_create();
  xpc_object_t v17 = 0;
LABEL_33:
  xpc_release(v17);
  memset(&__dst, 170, sizeof(__dst));
  xpc_object_t value = xpc_dictionary_get_value(v18, abm::kKeyTracePropertyValue);
  size_t __idx = (size_t)value;
  if (value) {
    xpc_retain(value);
  }
  else {
    size_t __idx = (size_t)xpc_null_create();
  }
  xpc::dyn_cast_or_default((uint64_t *)&__dst, (xpc *)&__idx, (const object *)&unk_10001EBA7, v20);
  xpc_release((xpc_object_t)__idx);
  char v21 = HIBYTE(__dst.__r_.__value_.__r.__words[2]);
  if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (strcasecmp((const char *)&__dst, "false")
      && strcasecmp((const char *)&__dst, "off")
      && strcasecmp((const char *)&__dst, "no"))
    {
      if (strcasecmp((const char *)&__dst, "true")
        && strcasecmp((const char *)&__dst, "on")
        && strcasecmp((const char *)&__dst, "yes")
        && strcasecmp((const char *)&__dst, "full")
        && strcasecmp((const char *)&__dst, "streaming"))
      {
        int v22 = &__dst;
        if (!strcasecmp((const char *)&__dst, "lite")) {
          goto LABEL_73;
        }
        goto LABEL_56;
      }
LABEL_64:
      int v24 = 1;
      goto LABEL_65;
    }
LABEL_63:
    int v24 = 0;
    goto LABEL_65;
  }
  int v22 = (std::string *)__dst.__r_.__value_.__r.__words[0];
  if (!strcasecmp(__dst.__r_.__value_.__l.__data_, "false")
    || !strcasecmp((const char *)v22, "off")
    || !strcasecmp((const char *)v22, "no"))
  {
    goto LABEL_63;
  }
  if (!strcasecmp((const char *)v22, "true")
    || !strcasecmp((const char *)v22, "on")
    || !strcasecmp((const char *)v22, "yes")
    || !strcasecmp((const char *)v22, "full")
    || !strcasecmp((const char *)v22, "streaming"))
  {
    goto LABEL_64;
  }
  if (!strcasecmp((const char *)v22, "lite"))
  {
LABEL_73:
    int v24 = 2;
    goto LABEL_65;
  }
LABEL_56:
  if (!strcasecmp((const char *)v22, "background")) {
    goto LABEL_73;
  }
  size_t __idx = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v23 = std::stol(&__dst, &__idx, 0);
  int v24 = -1431655766;
  std::string::size_type size = HIBYTE(__dst.__r_.__value_.__r.__words[2]);
  char v21 = HIBYTE(__dst.__r_.__value_.__r.__words[2]);
  if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type size = __dst.__r_.__value_.__l.__size_;
  }
  if (__idx == size && v23 >= (uint64_t)0xFFFFFFFF80000000 && v23 <= 0x7FFFFFFF)
  {
    int v24 = v23;
LABEL_65:
    unsigned int v26 = 1;
    goto LABEL_66;
  }
  unsigned int v26 = 0;
LABEL_66:
  if (v21 < 0) {
    operator delete(__dst.__r_.__value_.__l.__data_);
  }
  xpc_release(v18);
  if (SHIBYTE(v32) < 0) {
    operator delete(__p[1]);
  }
  xpc_release(v3);
  if (v24 == 2) {
    return v26;
  }
  else {
    return 0;
  }
}

void sub_100017E1C(void *a1)
{
}

void sub_100017E34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  xpc_release(v25);
  if (a24 < 0) {
    operator delete(a19);
  }
  xpc_release(v24);
  _Unwind_Resume(a1);
}

void sub_100017F20(uint64_t a1, _DWORD *a2, xpc_object_t a3)
{
  if (*(unsigned char *)(a1 + 52))
  {
    xpc_object_t v4 = sub_10000369C(&std::cout, (uint64_t)"Telephony log clear: ", 21);
    if (*a2) {
      xpc_object_t v5 = "Failed";
    }
    else {
      xpc_object_t v5 = "Success";
    }
    if (*a2) {
      uint64_t v6 = 6;
    }
    else {
      uint64_t v6 = 7;
    }
    xpc_object_t v7 = sub_10000369C(v4, (uint64_t)v5, v6);
    std::ios_base::getloc((const std::ios_base *)((char *)v7 + *(void *)(*v7 - 24)));
    long long v8 = std::locale::use_facet(&v49, &std::ctype<char>::id);
    ((void (*)(const std::locale::facet *, uint64_t))v8->__vftable[2].~facet_0)(v8, 10);
    std::locale::~locale(&v49);
    std::ostream::put();
    std::ostream::flush();
    return;
  }
  size_t v11 = sub_10000369C(&std::cout, (uint64_t)"Telephony log collection: ", 26);
  if (*a2) {
    std::string::size_type v12 = "Failed";
  }
  else {
    std::string::size_type v12 = "Success";
  }
  if (*a2) {
    uint64_t v13 = 6;
  }
  else {
    uint64_t v13 = 7;
  }
  uint64_t v14 = sub_10000369C(v11, (uint64_t)v12, v13);
  std::ios_base::getloc((const std::ios_base *)((char *)v14 + *(void *)(*v14 - 24)));
  uint64_t v15 = std::locale::use_facet(&v49, &std::ctype<char>::id);
  ((void (*)(const std::locale::facet *, uint64_t))v15->__vftable[2].~facet_0)(v15, 10);
  std::locale::~locale(&v49);
  std::ostream::put();
  std::ostream::flush();
  if (!*a2)
  {
    if (a3)
    {
      xpc_retain(a3);
    }
    else
    {
      a3 = xpc_null_create();
      if (!a3)
      {
        xpc_object_t v16 = xpc_null_create();
        a3 = 0;
LABEL_23:
        xpc_release(a3);
        if (xpc_get_type(v16) == (xpc_type_t)&_xpc_type_dictionary)
        {
          if (*(unsigned char *)(a1 + 53))
          {
            xpc_object_t v17 = sub_10000369C(&std::cout, (uint64_t)"Main archive path = ", 20);
            xpc_object_t v18 = (const char *)abm::kKeyTimestampString;
            xpc_object_t value = xpc_dictionary_get_value(v16, abm::kKeyTimestampString);
            xpc_object_t object = value;
            if (value) {
              xpc_retain(value);
            }
            else {
              xpc_object_t object = xpc_null_create();
            }
            v49.__locale_ = 0;
            uint64_t v50 = 0;
            uint64_t v51 = 0;
            xpc::dyn_cast_or_default();
            if (SHIBYTE(v51) < 0) {
              operator delete(v49.__locale_);
            }
            int v22 = *(_DWORD *)(a1 + 48);
            v44[23] = 2;
            strcpy(v44, "-*");
            sub_1000186B0(&v48, (uint64_t)&v46, v22, 0, (uint64_t)v44);
            if ((v48.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              uint64_t v23 = &v48;
            }
            else {
              uint64_t v23 = (std::string *)v48.__r_.__value_.__r.__words[0];
            }
            if ((v48.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              std::string::size_type size = HIBYTE(v48.__r_.__value_.__r.__words[2]);
            }
            else {
              std::string::size_type size = v48.__r_.__value_.__l.__size_;
            }
            int v25 = sub_10000369C(v17, (uint64_t)v23, size);
            std::ios_base::getloc((const std::ios_base *)((char *)v25 + *(void *)(*v25 - 24)));
            unsigned int v26 = std::locale::use_facet(&v49, &std::ctype<char>::id);
            ((void (*)(const std::locale::facet *, uint64_t))v26->__vftable[2].~facet_0)(v26, 10);
            std::locale::~locale(&v49);
            std::ostream::put();
            std::ostream::flush();
            if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v48.__r_.__value_.__l.__data_);
            }
            if (v47 < 0) {
              operator delete(v46);
            }
            xpc_release(object);
            int v27 = sub_10000369C(&std::cout, (uint64_t)"Lite archive path = ", 20);
            xpc_object_t v28 = xpc_dictionary_get_value(v16, v18);
            xpc_object_t object = v28;
            if (v28) {
              xpc_retain(v28);
            }
            else {
              xpc_object_t object = xpc_null_create();
            }
            v49.__locale_ = 0;
            uint64_t v50 = 0;
            uint64_t v51 = 0;
            xpc::dyn_cast_or_default();
            if (SHIBYTE(v51) < 0) {
              operator delete(v49.__locale_);
            }
            int v29 = *(_DWORD *)(a1 + 48);
            v41[23] = 2;
            strcpy(v41, "-*");
            sub_1000186B0(&v48, (uint64_t)&__p, v29, 1, (uint64_t)v41);
            if ((v48.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              size_t v30 = &v48;
            }
            else {
              size_t v30 = (std::string *)v48.__r_.__value_.__r.__words[0];
            }
            if ((v48.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              std::string::size_type v31 = HIBYTE(v48.__r_.__value_.__r.__words[2]);
            }
            else {
              std::string::size_type v31 = v48.__r_.__value_.__l.__size_;
            }
            long long v32 = sub_10000369C(v27, (uint64_t)v30, v31);
            std::ios_base::getloc((const std::ios_base *)((char *)v32 + *(void *)(*v32 - 24)));
            xpc_object_t v33 = std::locale::use_facet(&v49, &std::ctype<char>::id);
            ((void (*)(const std::locale::facet *, uint64_t))v33->__vftable[2].~facet_0)(v33, 10);
            std::locale::~locale(&v49);
            std::ostream::put();
            std::ostream::flush();
            if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v48.__r_.__value_.__l.__data_);
            }
            if (v43 < 0) {
              operator delete(__p);
            }
            xpc_release(object);
          }
          else
          {
            int v20 = sub_10000369C(&std::cout, (uint64_t)"Path = ", 7);
            xpc_object_t v21 = xpc_dictionary_get_value(v16, abm::kKeyTimestampString);
            xpc_object_t object = v21;
            if (v21) {
              xpc_retain(v21);
            }
            else {
              xpc_object_t object = xpc_null_create();
            }
            v49.__locale_ = 0;
            uint64_t v50 = 0;
            uint64_t v51 = 0;
            xpc::dyn_cast_or_default();
            if (SHIBYTE(v51) < 0) {
              operator delete(v49.__locale_);
            }
            int v34 = *(_DWORD *)(a1 + 48);
            v38[23] = 2;
            strcpy(v38, "-*");
            sub_1000186B0(&v48, (uint64_t)&v39, v34, 0, (uint64_t)v38);
            if ((v48.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              v35 = &v48;
            }
            else {
              v35 = (std::string *)v48.__r_.__value_.__r.__words[0];
            }
            if ((v48.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              std::string::size_type v36 = HIBYTE(v48.__r_.__value_.__r.__words[2]);
            }
            else {
              std::string::size_type v36 = v48.__r_.__value_.__l.__size_;
            }
            size_t v37 = sub_10000369C(v20, (uint64_t)v35, v36);
            sub_100003488(v37);
            if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v48.__r_.__value_.__l.__data_);
            }
            if (v40 < 0) {
              operator delete(v39);
            }
            xpc_release(object);
          }
        }
        xpc_release(v16);
        return;
      }
    }
    if (xpc_get_type(a3) == (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_retain(a3);
      xpc_object_t v16 = a3;
    }
    else
    {
      xpc_object_t v16 = xpc_null_create();
    }
    goto LABEL_23;
  }
}

void sub_100018530(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,xpc_object_t object)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  xpc_release(object);
  xpc_release(v31);
  _Unwind_Resume(a1);
}

void sub_100018688(_Unwind_Exception *a1)
{
  std::locale::~locale((std::locale *)(v1 - 72));
  _Unwind_Resume(a1);
}

void sub_10001869C(_Unwind_Exception *a1)
{
  std::locale::~locale((std::locale *)(v1 - 72));
  _Unwind_Resume(a1);
}

void sub_1000186B0(std::string *a1, uint64_t a2, int a3, int a4, uint64_t a5)
{
  memset(&__p, 170, sizeof(__p));
  if (*(char *)(a5 + 23) < 0) {
    sub_1000035FC(&__p, *(void **)a5, *(void *)(a5 + 8));
  }
  else {
    std::string __p = *(std::string *)a5;
  }
  if (a3 == 2)
  {
    *((unsigned char *)&__dst.__r_.__value_.__s + 23) = 1;
    LOWORD(__dst.__r_.__value_.__l.__data_) = 46;
    size_t v11 = strlen(abm::trace::kLogTarExtension);
    int v10 = std::string::append(&__dst, abm::trace::kLogTarExtension, v11);
  }
  else
  {
    if (a3 != 1) {
      goto LABEL_11;
    }
    *((unsigned char *)&__dst.__r_.__value_.__s + 23) = 1;
    LOWORD(__dst.__r_.__value_.__l.__data_) = 46;
    size_t v9 = strlen(abm::trace::kLogTarGzExtension);
    int v10 = std::string::append(&__dst, abm::trace::kLogTarGzExtension, v9);
  }
  std::string::size_type v12 = v10->__r_.__value_.__r.__words[0];
  v55.__r_.__value_.__r.__words[0] = v10->__r_.__value_.__l.__size_;
  *(std::string::size_type *)((char *)v55.__r_.__value_.__r.__words + 7) = *(std::string::size_type *)((char *)&v10->__r_.__value_.__r.__words[1] + 7);
  char v13 = HIBYTE(v10->__r_.__value_.__r.__words[2]);
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  __p.__r_.__value_.__r.__words[0] = v12;
  __p.__r_.__value_.__l.__size_ = v55.__r_.__value_.__r.__words[0];
  *(std::string::size_type *)((char *)&__p.__r_.__value_.__r.__words[1] + 7) = *(std::string::size_type *)((char *)v55.__r_.__value_.__r.__words + 7);
  *((unsigned char *)&__p.__r_.__value_.__s + 23) = v13;
  if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_11:
    if (a4 != 1) {
      goto LABEL_28;
    }
    goto LABEL_12;
  }
  operator delete(__dst.__r_.__value_.__l.__data_);
  if (a4 != 1) {
    goto LABEL_28;
  }
LABEL_12:
  uint64_t v14 = (const void *)abm::trace::kLiteDirectorySuffix;
  size_t v15 = strlen(abm::trace::kLiteDirectorySuffix);
  int v16 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    size_t size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  }
  else {
    size_t size = __p.__r_.__value_.__l.__size_;
  }
  std::string::size_type v18 = size + v15;
  memset(&__dst, 170, sizeof(__dst));
  if (size + v15 > 0x7FFFFFFFFFFFFFF7) {
    sub_100003540();
  }
  size_t v19 = v15;
  if (v18 > 0x16)
  {
    uint64_t v47 = (v18 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v18 | 7) != 0x17) {
      uint64_t v47 = v18 | 7;
    }
    uint64_t v48 = v47 + 1;
    p_dst = (char *)operator new(v47 + 1);
    __dst.__r_.__value_.__l.__size_ = v18;
    __dst.__r_.__value_.__r.__words[2] = v48 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
    if (!v19) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  memset(&__dst, 0, sizeof(__dst));
  p_dst = (char *)&__dst;
  *((unsigned char *)&__dst.__r_.__value_.__s + 23) = size + v15;
  if (v15) {
LABEL_18:
  }
    memcpy(p_dst, v14, v19);
LABEL_19:
  xpc_object_t v21 = &p_dst[v19];
  if (size)
  {
    if (v16 >= 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    memmove(v21, p_p, size);
  }
  v21[size] = 0;
  if (v16 < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  std::string __p = __dst;
LABEL_28:
  uint64_t v23 = (const void *)abm::trace::kSnapshotFolder;
  size_t v24 = strlen(abm::trace::kSnapshotFolder);
  if (v24 > 0x7FFFFFFFFFFFFFF7) {
    sub_100003540();
  }
  std::string::size_type v25 = v24;
  if (v24 >= 0x17)
  {
    uint64_t v27 = (v24 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v24 | 7) != 0x17) {
      uint64_t v27 = v24 | 7;
    }
    uint64_t v28 = v27 + 1;
    unsigned int v26 = operator new(v27 + 1);
    v52.__r_.__value_.__l.__size_ = v25;
    v52.__r_.__value_.__r.__words[2] = v28 | 0x8000000000000000;
    v52.__r_.__value_.__r.__words[0] = (std::string::size_type)v26;
    goto LABEL_35;
  }
  *((unsigned char *)&v52.__r_.__value_.__s + 23) = v24;
  unsigned int v26 = &v52;
  if (v24) {
LABEL_35:
  }
    memmove(v26, v23, v25);
  *((unsigned char *)v26 + v25) = 0;
  int v29 = (const void *)abm::trace::kLogDirPrefix;
  size_t v30 = strlen(abm::trace::kLogDirPrefix);
  if (v30 > 0x7FFFFFFFFFFFFFF7) {
    sub_100003540();
  }
  size_t v31 = v30;
  if (v30 >= 0x17)
  {
    uint64_t v33 = (v30 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v30 | 7) != 0x17) {
      uint64_t v33 = v30 | 7;
    }
    uint64_t v34 = v33 + 1;
    long long v32 = operator new(v33 + 1);
    size_t v50 = v31;
    int64_t v51 = v34 | 0x8000000000000000;
    std::locale v49 = v32;
    goto LABEL_43;
  }
  HIBYTE(v51) = v30;
  long long v32 = &v49;
  if (v30) {
LABEL_43:
  }
    memmove(v32, v29, v31);
  *((unsigned char *)v32 + v31) = 0;
  if (v51 >= 0) {
    v35 = (const std::string::value_type *)&v49;
  }
  else {
    v35 = (const std::string::value_type *)v49;
  }
  if (v51 >= 0) {
    std::string::size_type v36 = HIBYTE(v51);
  }
  else {
    std::string::size_type v36 = v50;
  }
  size_t v37 = std::string::append(&v52, v35, v36);
  long long v38 = *(_OWORD *)&v37->__r_.__value_.__l.__data_;
  v55.__r_.__value_.__r.__words[2] = v37->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v55.__r_.__value_.__l.__data_ = v38;
  v37->__r_.__value_.__l.__size_ = 0;
  v37->__r_.__value_.__r.__words[2] = 0;
  v37->__r_.__value_.__r.__words[0] = 0;
  int v39 = *(char *)(a2 + 23);
  if (v39 >= 0) {
    char v40 = (const std::string::value_type *)a2;
  }
  else {
    char v40 = *(const std::string::value_type **)a2;
  }
  if (v39 >= 0) {
    std::string::size_type v41 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    std::string::size_type v41 = *(void *)(a2 + 8);
  }
  uint64_t v42 = std::string::append(&v55, v40, v41);
  long long v43 = *(_OWORD *)&v42->__r_.__value_.__l.__data_;
  __dst.__r_.__value_.__r.__words[2] = v42->__r_.__value_.__r.__words[2];
  *(_OWORD *)&__dst.__r_.__value_.__l.__data_ = v43;
  v42->__r_.__value_.__l.__size_ = 0;
  v42->__r_.__value_.__r.__words[2] = 0;
  v42->__r_.__value_.__r.__words[0] = 0;
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    size_t v44 = &__p;
  }
  else {
    size_t v44 = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v45 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v45 = __p.__r_.__value_.__l.__size_;
  }
  __int16 v46 = std::string::append(&__dst, (const std::string::value_type *)v44, v45);
  *a1 = *v46;
  v46->__r_.__value_.__l.__size_ = 0;
  v46->__r_.__value_.__r.__words[2] = 0;
  v46->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__dst.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v55.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_64:
      if ((SHIBYTE(v51) & 0x80000000) == 0) {
        goto LABEL_65;
      }
      goto LABEL_70;
    }
  }
  else if ((SHIBYTE(v55.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_64;
  }
  operator delete(v55.__r_.__value_.__l.__data_);
  if ((SHIBYTE(v51) & 0x80000000) == 0)
  {
LABEL_65:
    if ((SHIBYTE(v52.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_71;
  }
LABEL_70:
  operator delete(v49);
  if ((SHIBYTE(v52.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_66:
    if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      return;
    }
LABEL_72:
    operator delete(__p.__r_.__value_.__l.__data_);
    return;
  }
LABEL_71:
  operator delete(v52.__r_.__value_.__l.__data_);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_72;
  }
}

void sub_100018BA0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,uint64_t a34,void *a35,uint64_t a36,int a37,__int16 a38,char a39,char a40)
{
  if (a26 < 0) {
    operator delete(__p);
  }
  if (a33 < 0) {
    operator delete(a28);
  }
  _Unwind_Resume(exception_object);
}

xpc_object_t sub_100018C70(void *a1, xpc_object_t xdict, char *key)
{
  xpc_object_t value = xpc_dictionary_get_value(xdict, key);
  *a1 = value;
  if (value) {
    return xpc_retain(value);
  }
  xpc_object_t result = xpc_null_create();
  *a1 = result;
  return result;
}

void sub_100018CC0(uint64_t a1, uint64_t a2)
{
  xpc_object_t v3 = *(NSObject **)(a2 + 40);
  *(void *)(a1 + 40) = v3;
  if (v3)
  {
    dispatch_retain(v3);
    xpc_object_t v4 = *(NSObject **)(a1 + 40);
    if (v4)
    {
      dispatch_group_enter(v4);
    }
  }
}

void sub_100018D14(uint64_t a1)
{
  xpc_object_t v2 = *(NSObject **)(a1 + 40);
  if (v2)
  {
    dispatch_group_leave(v2);
    xpc_object_t v3 = *(NSObject **)(a1 + 40);
    if (v3)
    {
      dispatch_release(v3);
    }
  }
}

uint64_t sub_100018D64(defaults::compression *a1, NSObject **a2, uint64_t a3)
{
  uint64_t v5 = *((void *)a1 + 4);
  int v53 = defaults::compression::mode(a1);
  sub_100015C80(*(void *)(v5 + 208), *(std::__shared_weak_count **)(v5 + 216), &v53);
  BOOL v52 = defaults::compression::splitArchive(v6);
  sub_100016210(*(void *)(v5 + 208), *(std::__shared_weak_count **)(v5 + 216), &v52);
  __int16 v51 = 0;
  v49[0] = 0;
  v49[1] = 0;
  uint64_t v50 = 0;
  sub_10000A680(&v46, a3);
  sub_100017384(&v46, &v53, &v52, (unsigned char *)&v51 + 1, &v51, v49);
  if (v48)
  {
    uint64_t v7 = v46;
    long long v8 = v47;
    uint64_t v9 = *v47;
    *(void *)(v9 + 8) = *(void *)(v46 + 8);
    **(void **)(v7 + 8) = v9;
    uint64_t v48 = 0;
    if (v8 != &v46)
    {
      do
      {
        char v13 = (uint64_t *)v8[1];
        if (*((char *)v8 + 39) < 0) {
          operator delete((void *)v8[2]);
        }
        operator delete(v8);
        long long v8 = v13;
      }
      while (v13 != &v46);
    }
  }
  int64_t v10 = v53;
  if (!v53) {
    BOOL v52 = 0;
  }
  xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
  if (v11 || (xpc_object_t v11 = xpc_null_create()) != 0)
  {
    if (xpc_get_type(v11) == (xpc_type_t)&_xpc_type_dictionary)
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
  xpc_object_t v14 = xpc_string_create(abm::kBasebandResetTypeHard);
  if (!v14) {
    xpc_object_t v14 = xpc_null_create();
  }
  xpc_dictionary_set_value(v12, abm::kKeyBasebandResetType, v14);
  xpc_object_t v15 = xpc_null_create();
  xpc_release(v14);
  xpc_release(v15);
  xpc_object_t v16 = xpc_string_create(abm::kBasebandResetSubTypeOtherErrors);
  if (!v16) {
    xpc_object_t v16 = xpc_null_create();
  }
  xpc_dictionary_set_value(v12, abm::kKeyBasebandResetSubType, v16);
  xpc_object_t v17 = xpc_null_create();
  xpc_release(v16);
  xpc_release(v17);
  xpc_object_t v18 = xpc_string_create(abm::kCollectTelephonyLogsWithCoredump);
  if (!v18) {
    xpc_object_t v18 = xpc_null_create();
  }
  xpc_dictionary_set_value(v12, abm::kKeyTraceAction, v18);
  xpc_object_t v19 = xpc_null_create();
  xpc_release(v18);
  xpc_release(v19);
  if (v50 >= 0) {
    int v20 = (const char *)v49;
  }
  else {
    int v20 = (const char *)v49[0];
  }
  xpc_object_t v21 = xpc_string_create(v20);
  if (!v21) {
    xpc_object_t v21 = xpc_null_create();
  }
  xpc_dictionary_set_value(v12, abm::kKeyBasebandResetReason, v21);
  xpc_object_t v22 = xpc_null_create();
  xpc_release(v21);
  xpc_release(v22);
  if (v50 >= 0) {
    uint64_t v23 = (const char *)v49;
  }
  else {
    uint64_t v23 = (const char *)v49[0];
  }
  xpc_object_t v24 = xpc_string_create(v23);
  if (!v24) {
    xpc_object_t v24 = xpc_null_create();
  }
  xpc_dictionary_set_value(v12, abm::kKeyTraceDumpStateReason, v24);
  xpc_object_t v25 = xpc_null_create();
  xpc_release(v24);
  xpc_release(v25);
  xpc_object_t v26 = xpc_int64_create(v10);
  if (!v26) {
    xpc_object_t v26 = xpc_null_create();
  }
  xpc_dictionary_set_value(v12, abm::kKeyTraceDumpStatePerformCompression, v26);
  xpc_object_t v27 = xpc_null_create();
  xpc_release(v26);
  xpc_release(v27);
  xpc_object_t v28 = xpc_BOOL_create(v52);
  if (!v28) {
    xpc_object_t v28 = xpc_null_create();
  }
  xpc_dictionary_set_value(v12, abm::kKeyTraceDumpStateSplitArchive, v28);
  xpc_object_t v29 = xpc_null_create();
  xpc_release(v28);
  xpc_release(v29);
  if (HIBYTE(v51))
  {
    xpc_object_t v30 = xpc_BOOL_create(0);
    if (!v30) {
      xpc_object_t v30 = xpc_null_create();
    }
    xpc_dictionary_set_value(v12, abm::kKeyTraceUserConfirmation, v30);
    xpc_object_t v31 = xpc_null_create();
    xpc_release(v30);
    xpc_release(v31);
  }
  long long v32 = *a2;
  if (v32)
  {
    dispatch_retain(v32);
    dispatch_group_enter(v32);
  }
  uint64_t v44 = *(void *)(v5 + 208);
  uint64_t v33 = *(std::__shared_weak_count **)(v5 + 216);
  std::string::size_type v45 = v33;
  if (v33) {
    atomic_fetch_add_explicit(&v33->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v34 = (const void *)abm::kCommandTraceDumpState;
  size_t v35 = strlen(abm::kCommandTraceDumpState);
  if (v35 >= 0x7FFFFFFFFFFFFFF8) {
    sub_100003540();
  }
  std::string::size_type v36 = (void *)v35;
  if (v35 >= 0x17)
  {
    uint64_t v38 = (v35 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v35 | 7) != 0x17) {
      uint64_t v38 = v35 | 7;
    }
    uint64_t v39 = v38 + 1;
    size_t v37 = (void **)operator new(v38 + 1);
    __dst[1] = v36;
    unint64_t v43 = v39 | 0x8000000000000000;
    __dst[0] = v37;
    goto LABEL_49;
  }
  HIBYTE(v43) = v35;
  size_t v37 = __dst;
  if (v35) {
LABEL_49:
  }
    memmove(v37, v34, (size_t)v36);
  *((unsigned char *)v36 + (void)v37) = 0;
  if (v32)
  {
    dispatch_retain(v32);
    dispatch_group_enter(v32);
  }
  abm::client::PerformCommand();
  if (SHIBYTE(v43) < 0) {
    operator delete(__dst[0]);
  }
  char v40 = v45;
  if (v45 && !atomic_fetch_add(&v45->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
    std::__shared_weak_count::__release_weak(v40);
  }
  if (v32)
  {
    dispatch_group_leave(v32);
    dispatch_release(v32);
    dispatch_group_leave(v32);
    dispatch_release(v32);
  }
  xpc_release(v12);
  if (SHIBYTE(v50) < 0) {
    operator delete(v49[0]);
  }
  return 1;
}

void sub_100019380(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, dispatch_group_t group, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,char a23,uint64_t a24,char a25)
{
  if (group)
  {
    dispatch_group_leave(group);
    dispatch_release(group);
  }
  if (a22 < 0) {
    operator delete(__p);
  }
  sub_10000340C((uint64_t)&a23);
  if (v26)
  {
    dispatch_group_leave(v26);
    dispatch_release(v26);
  }
  xpc_release(v25);
  if (*(char *)(v27 - 73) < 0) {
    operator delete(*(void **)(v27 - 96));
  }
  _Unwind_Resume(a1);
}

void sub_1000194A4(uint64_t a1, _DWORD *a2, xpc_object_t a3)
{
  uint64_t v6 = sub_10000369C(&std::cout, (uint64_t)"Telephony log collection with Coredump: ", 40);
  if (*a2) {
    uint64_t v7 = "Failed";
  }
  else {
    uint64_t v7 = "Success";
  }
  if (*a2) {
    uint64_t v8 = 6;
  }
  else {
    uint64_t v8 = 7;
  }
  uint64_t v9 = sub_10000369C(v6, (uint64_t)v7, v8);
  std::ios_base::getloc((const std::ios_base *)((char *)v9 + *(void *)(*v9 - 24)));
  int64_t v10 = std::locale::use_facet(&v51, &std::ctype<char>::id);
  ((void (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 10);
  std::locale::~locale(&v51);
  std::ostream::put();
  std::ostream::flush();
  if (!*a2)
  {
    if (a3)
    {
      xpc_retain(a3);
    }
    else
    {
      a3 = xpc_null_create();
      if (!a3)
      {
        xpc_object_t v11 = xpc_null_create();
        a3 = 0;
        goto LABEL_15;
      }
    }
    if (xpc_get_type(a3) == (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_retain(a3);
      xpc_object_t v11 = a3;
    }
    else
    {
      xpc_object_t v11 = xpc_null_create();
    }
LABEL_15:
    xpc_release(a3);
    if (xpc_get_type(v11) != (xpc_type_t)&_xpc_type_dictionary)
    {
LABEL_67:
      xpc_release(v11);
      return;
    }
    if (*(unsigned char *)(a1 + 52))
    {
      xpc_object_t v12 = sub_10000369C(&std::cout, (uint64_t)"Main archive path = ", 20);
      char v13 = (const char *)abm::kKeyTimestampString;
      xpc_object_t value = xpc_dictionary_get_value(v11, abm::kKeyTimestampString);
      xpc_object_t object = value;
      if (value) {
        xpc_retain(value);
      }
      else {
        xpc_object_t object = xpc_null_create();
      }
      v51.__locale_ = 0;
      uint64_t v52 = 0;
      uint64_t v53 = 0;
      xpc_object_t v17 = (abm::trace *)xpc::dyn_cast_or_default();
      if (SHIBYTE(v53) < 0) {
        operator delete(v51.__locale_);
      }
      int v18 = *(_DWORD *)(a1 + 48);
      abm::trace::getCoreDumpDirSuffix((uint64_t *)__p, v17);
      sub_1000186B0(&v50, (uint64_t)&v48, v18, 0, (uint64_t)__p);
      if ((v50.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        xpc_object_t v19 = &v50;
      }
      else {
        xpc_object_t v19 = (std::string *)v50.__r_.__value_.__r.__words[0];
      }
      if ((v50.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type size = HIBYTE(v50.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type size = v50.__r_.__value_.__l.__size_;
      }
      xpc_object_t v21 = sub_10000369C(v12, (uint64_t)v19, size);
      std::ios_base::getloc((const std::ios_base *)((char *)v21 + *(void *)(*v21 - 24)));
      xpc_object_t v22 = std::locale::use_facet(&v51, &std::ctype<char>::id);
      ((void (*)(const std::locale::facet *, uint64_t))v22->__vftable[2].~facet_0)(v22, 10);
      std::locale::~locale(&v51);
      std::ostream::put();
      std::ostream::flush();
      if (SHIBYTE(v50.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v50.__r_.__value_.__l.__data_);
        if ((v46 & 0x80000000) == 0)
        {
LABEL_32:
          if ((v49 & 0x80000000) == 0) {
            goto LABEL_33;
          }
LABEL_37:
          operator delete(v48);
LABEL_33:
          xpc_release(object);
          uint64_t v23 = sub_10000369C(&std::cout, (uint64_t)"Lite archive path = ", 20);
          xpc_object_t v24 = xpc_dictionary_get_value(v11, v13);
          xpc_object_t object = v24;
          if (v24) {
            xpc_retain(v24);
          }
          else {
            xpc_object_t object = xpc_null_create();
          }
          v51.__locale_ = 0;
          uint64_t v52 = 0;
          uint64_t v53 = 0;
          xpc_object_t v25 = (abm::trace *)xpc::dyn_cast_or_default();
          if (SHIBYTE(v53) < 0) {
            operator delete(v51.__locale_);
          }
          int v26 = *(_DWORD *)(a1 + 48);
          abm::trace::getCoreDumpDirSuffix((uint64_t *)v41, v25);
          sub_1000186B0(&v50, (uint64_t)&v43, v26, 1, (uint64_t)v41);
          if ((v50.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            uint64_t v27 = &v50;
          }
          else {
            uint64_t v27 = (std::string *)v50.__r_.__value_.__r.__words[0];
          }
          if ((v50.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            std::string::size_type v28 = HIBYTE(v50.__r_.__value_.__r.__words[2]);
          }
          else {
            std::string::size_type v28 = v50.__r_.__value_.__l.__size_;
          }
          xpc_object_t v29 = sub_10000369C(v23, (uint64_t)v27, v28);
          std::ios_base::getloc((const std::ios_base *)((char *)v29 + *(void *)(*v29 - 24)));
          xpc_object_t v30 = std::locale::use_facet(&v51, &std::ctype<char>::id);
          ((void (*)(const std::locale::facet *, uint64_t))v30->__vftable[2].~facet_0)(v30, 10);
          std::locale::~locale(&v51);
          std::ostream::put();
          std::ostream::flush();
          if (SHIBYTE(v50.__r_.__value_.__r.__words[2]) < 0)
          {
            operator delete(v50.__r_.__value_.__l.__data_);
            if ((v42 & 0x80000000) == 0)
            {
LABEL_49:
              if ((v44 & 0x80000000) == 0)
              {
LABEL_50:
                xpc_release(object);
                goto LABEL_67;
              }
LABEL_53:
              operator delete(v43);
              goto LABEL_50;
            }
          }
          else if ((v42 & 0x80000000) == 0)
          {
            goto LABEL_49;
          }
          operator delete(v41[0]);
          if ((v44 & 0x80000000) == 0) {
            goto LABEL_50;
          }
          goto LABEL_53;
        }
      }
      else if ((v46 & 0x80000000) == 0)
      {
        goto LABEL_32;
      }
      operator delete(__p[0]);
      if ((v49 & 0x80000000) == 0) {
        goto LABEL_33;
      }
      goto LABEL_37;
    }
    xpc_object_t v15 = sub_10000369C(&std::cout, (uint64_t)"Path = ", 7);
    xpc_object_t v16 = xpc_dictionary_get_value(v11, abm::kKeyTimestampString);
    xpc_object_t object = v16;
    if (v16) {
      xpc_retain(v16);
    }
    else {
      xpc_object_t object = xpc_null_create();
    }
    v51.__locale_ = 0;
    uint64_t v52 = 0;
    uint64_t v53 = 0;
    xpc_object_t v31 = (abm::trace *)xpc::dyn_cast_or_default();
    if (SHIBYTE(v53) < 0) {
      operator delete(v51.__locale_);
    }
    int v32 = *(_DWORD *)(a1 + 48);
    abm::trace::getCoreDumpDirSuffix((uint64_t *)v37, v31);
    sub_1000186B0(&v50, (uint64_t)&v39, v32, 0, (uint64_t)v37);
    if ((v50.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v33 = &v50;
    }
    else {
      uint64_t v33 = (std::string *)v50.__r_.__value_.__r.__words[0];
    }
    if ((v50.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v34 = HIBYTE(v50.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v34 = v50.__r_.__value_.__l.__size_;
    }
    size_t v35 = sub_10000369C(v15, (uint64_t)v33, v34);
    std::ios_base::getloc((const std::ios_base *)((char *)v35 + *(void *)(*v35 - 24)));
    std::string::size_type v36 = std::locale::use_facet(&v51, &std::ctype<char>::id);
    ((void (*)(const std::locale::facet *, uint64_t))v36->__vftable[2].~facet_0)(v36, 10);
    std::locale::~locale(&v51);
    std::ostream::put();
    std::ostream::flush();
    if (SHIBYTE(v50.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v50.__r_.__value_.__l.__data_);
      if ((v38 & 0x80000000) == 0)
      {
LABEL_65:
        if ((v40 & 0x80000000) == 0)
        {
LABEL_66:
          xpc_release(object);
          goto LABEL_67;
        }
LABEL_71:
        operator delete(v39);
        goto LABEL_66;
      }
    }
    else if ((v38 & 0x80000000) == 0)
    {
      goto LABEL_65;
    }
    operator delete(v37[0]);
    if ((v40 & 0x80000000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_71;
  }
}

void sub_100019AB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,void *a34,uint64_t a35,int a36,__int16 a37,char a38,char a39,xpc_object_t object,void *a41,uint64_t a42,int a43,__int16 a44,char a45,char a46)
{
  if (a15 < 0)
  {
    operator delete(__p);
    if ((a21 & 0x80000000) == 0) {
      goto LABEL_6;
    }
  }
  else if ((a21 & 0x80000000) == 0)
  {
LABEL_6:
    xpc_release(object);
    xpc_release(v46);
    _Unwind_Resume(a1);
  }
  operator delete(a16);
  goto LABEL_6;
}

BOOL sub_100019CE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  BOOL v172 = 0;
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  if (v5 || (xpc_object_t v5 = xpc_null_create()) != 0)
  {
    if (xpc_get_type(v5) == (xpc_type_t)&_xpc_type_dictionary)
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
  xpc_object_t v7 = xpc_string_create(abm::kTraceBaseband);
  if (!v7) {
    xpc_object_t v7 = xpc_null_create();
  }
  xpc_dictionary_set_value(v6, abm::kKeyTraceName, v7);
  xpc_object_t v8 = xpc_null_create();
  xpc_release(v7);
  xpc_release(v8);
  xpc_object_t v9 = xpc_string_create(abm::kKeyTraceEnabled);
  if (!v9) {
    xpc_object_t v9 = xpc_null_create();
  }
  int64_t v10 = (const char *)abm::kKeyTracePropertyName;
  xpc_dictionary_set_value(v6, abm::kKeyTracePropertyName, v9);
  xpc_object_t v11 = xpc_null_create();
  xpc_release(v9);
  xpc_release(v11);
  xpc_object_t v171 = xpc_null_create();
  *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v169 = v12;
  long long v170 = v12;
  uint64_t v167 = *(void *)(v4 + 208);
  char v13 = *(std::__shared_weak_count **)(v4 + 216);
  std::string::size_type v168 = v13;
  if (v13) {
    atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  xpc_object_t v14 = (const void *)abm::kCommandGetTraceProperty;
  size_t v15 = strlen(abm::kCommandGetTraceProperty);
  if (v15 > 0x7FFFFFFFFFFFFFF7) {
    sub_100003540();
  }
  size_t v16 = v15;
  if (v15 >= 0x17)
  {
    uint64_t v18 = (v15 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v15 | 7) != 0x17) {
      uint64_t v18 = v15 | 7;
    }
    uint64_t v19 = v18 + 1;
    xpc_object_t v17 = operator new(v18 + 1);
    *(void *)&__dst[8] = v16;
    *(void *)&__dst[16] = v19 | 0x8000000000000000;
    *(void *)std::string __dst = v17;
    goto LABEL_20;
  }
  __dst[23] = v15;
  xpc_object_t v17 = __dst;
  if (v15) {
LABEL_20:
  }
    memmove(v17, v14, v16);
  v17[v16] = 0;
  abm::client::PerformCommand();
  if ((__dst[23] & 0x80000000) != 0)
  {
    operator delete(*(void **)__dst);
    int v20 = v168;
    if (!v168) {
      goto LABEL_26;
    }
  }
  else
  {
    int v20 = v168;
    if (!v168) {
      goto LABEL_26;
    }
  }
  if (!atomic_fetch_add(&v20->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
    std::__shared_weak_count::__release_weak(v20);
    xpc_object_t v21 = v171;
    if (v171) {
      goto LABEL_30;
    }
    goto LABEL_27;
  }
LABEL_26:
  xpc_object_t v21 = v171;
  if (v171) {
    goto LABEL_30;
  }
LABEL_27:
  xpc_object_t v21 = xpc_null_create();
  if (!v21)
  {
    xpc_object_t v22 = xpc_null_create();
    xpc_object_t v21 = 0;
    goto LABEL_33;
  }
LABEL_30:
  if (xpc_get_type(v21) == (xpc_type_t)&_xpc_type_dictionary)
  {
    xpc_retain(v21);
    xpc_object_t v22 = v21;
  }
  else
  {
    xpc_object_t v22 = xpc_null_create();
  }
LABEL_33:
  xpc_release(v21);
  if (v169 || xpc_get_type(v22) != (xpc_type_t)&_xpc_type_dictionary)
  {
    uint64_t v23 = sub_10000369C(&std::cout, (uint64_t)"Baseband log collection: Failed", 31);
    std::ios_base::getloc((const std::ios_base *)((char *)v23 + *(void *)(*v23 - 24)));
    xpc_object_t v24 = std::locale::use_facet((const std::locale *)__dst, &std::ctype<char>::id);
    ((void (*)(const std::locale::facet *, uint64_t))v24->__vftable[2].~facet_0)(v24, 10);
    std::locale::~locale((std::locale *)__dst);
    std::ostream::put();
    std::ostream::flush();
    xpc_object_t v25 = v22;
    goto LABEL_36;
  }
  memset(&v166, 170, sizeof(v166));
  std::string::size_type v28 = (char *)abm::kKeyTracePropertyValue;
  xpc_object_t v29 = xpc_dictionary_get_value(v22, abm::kKeyTracePropertyValue);
  *(void *)std::string __dst = v29;
  if (v29) {
    xpc_retain(v29);
  }
  else {
    *(void *)std::string __dst = xpc_null_create();
  }
  xpc_object_t v31 = (const object *)abm::kUnknown;
  xpc::dyn_cast_or_default((uint64_t *)&v166, (xpc *)__dst, abm::kUnknown, v30);
  xpc_release(*(xpc_object_t *)__dst);
  int v32 = (capabilities::diag *)sub_1000165A8(&v166, &v172);
  if (v172)
  {
    BOOL v165 = 0;
    type = (defaults::compression *)capabilities::diag::supportsQDSS(v32);
    if (!type)
    {
      xpc_object_t v25 = v22;
      goto LABEL_76;
    }
    xpc_object_t v34 = xpc_string_create(abm::kKeyTraceHighTput);
    if (!v34) {
      xpc_object_t v34 = xpc_null_create();
    }
    xpc_dictionary_set_value(v6, v10, v34);
    xpc_object_t v35 = xpc_null_create();
    xpc_release(v34);
    xpc_release(v35);
    xpc_object_t v171 = xpc_null_create();
    *(void *)&long long v36 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v36 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)std::string __dst = v36;
    *(_OWORD *)&__dst[16] = v36;
    uint64_t v163 = *(void *)(v4 + 208);
    size_t v37 = *(std::__shared_weak_count **)(v4 + 216);
    long long v164 = v37;
    if (v37) {
      atomic_fetch_add_explicit(&v37->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    size_t v38 = strlen((const char *)v14);
    if (v38 > 0x7FFFFFFFFFFFFFF7) {
      sub_100003540();
    }
    uint64_t v39 = (void *)v38;
    if (v38 >= 0x17)
    {
      uint64_t v43 = (v38 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v38 | 7) != 0x17) {
        uint64_t v43 = v38 | 7;
      }
      uint64_t v44 = v43 + 1;
      char v40 = operator new(v43 + 1);
      __p[1] = v39;
      *(void *)&long long v152 = v44 | 0x8000000000000000;
      __p[0] = v40;
    }
    else
    {
      BYTE7(v152) = v38;
      char v40 = __p;
      if (!v38) {
        goto LABEL_58;
      }
    }
    memmove(v40, v14, (size_t)v39);
LABEL_58:
    *((unsigned char *)v39 + (void)v40) = 0;
    abm::client::PerformCommand();
    if (SBYTE7(v152) < 0) {
      operator delete(__p[0]);
    }
    std::string::size_type v45 = v164;
    if (v164 && !atomic_fetch_add(&v164->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
      std::__shared_weak_count::__release_weak(v45);
    }
    xpc_object_t v46 = v171;
    if (v171 || (xpc_object_t v46 = xpc_null_create()) != 0)
    {
      if (xpc_get_type(v46) == (xpc_type_t)&_xpc_type_dictionary)
      {
        xpc_retain(v46);
        xpc_object_t v25 = v46;
      }
      else
      {
        xpc_object_t v25 = xpc_null_create();
      }
    }
    else
    {
      xpc_object_t v25 = xpc_null_create();
      xpc_object_t v46 = 0;
    }
    xpc_object_t v47 = xpc_null_create();
    xpc_release(v22);
    xpc_release(v47);
    xpc_release(v46);
    if (!*(_DWORD *)__dst)
    {
      type = xpc_get_type(v25);
      if (type == (defaults::compression *)&_xpc_type_dictionary)
      {
        sub_100018C70(&v174, v25, v28);
        xpc::dyn_cast_or_default((uint64_t *)__p, (xpc *)&v174, v31, v48);
        if (SHIBYTE(v166.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v166.__r_.__value_.__l.__data_);
        }
        *(_OWORD *)&v166.__r_.__value_.__l.__data_ = *(_OWORD *)__p;
        v166.__r_.__value_.__r.__words[2] = v152;
        BYTE7(v152) = 0;
        LOBYTE(__p[0]) = 0;
        xpc_release(v174.__r_.__value_.__l.__data_);
        type = (defaults::compression *)sub_1000165A8(&v166, &v165);
      }
    }
    if ((__dst[31] & 0x80000000) != 0) {
      operator delete(*(void **)&__dst[8]);
    }
LABEL_76:
    int v162 = defaults::compression::mode(type);
    sub_100015C80(*(void *)(v4 + 208), *(std::__shared_weak_count **)(v4 + 216), &v162);
    BOOL value = defaults::compression::splitArchive(v49);
    sub_100016210(*(void *)(v4 + 208), *(std::__shared_weak_count **)(v4 + 216), &value);
    char v160 = 0;
    char v159 = 0;
    v157[0] = 0;
    v157[1] = 0;
    uint64_t v158 = 0;
    sub_10000A680(&v154, a3);
    sub_100017384(&v154, &v162, &value, &v160, &v159, v157);
    if (v156)
    {
      uint64_t v50 = v154;
      std::locale v51 = v155;
      uint64_t v52 = *v155;
      *(void *)(v52 + 8) = *(void *)(v154 + 8);
      **(void **)(v50 + 8) = v52;
      uint64_t v156 = 0;
      if (v51 != &v154)
      {
        do
        {
          std::string v55 = (uint64_t *)v51[1];
          if (*((char *)v51 + 39) < 0) {
            operator delete((void *)v51[2]);
          }
          operator delete(v51);
          std::locale v51 = v55;
        }
        while (v55 != &v154);
      }
    }
    uint64_t v53 = sub_1000178B0(v4);
    if ((v53 & 1) != 0 || (defaults::compression::supported((defaults::compression *)v53) & 1) == 0)
    {
      int v162 = 0;
    }
    else
    {
      int v54 = v162;
      if (v162)
      {
LABEL_87:
        xpc_object_t v56 = xpc_dictionary_create(0, 0, 0);
        if (v56 || (xpc_object_t v56 = xpc_null_create()) != 0)
        {
          if (xpc_get_type(v56) == (xpc_type_t)&_xpc_type_dictionary)
          {
            xpc_retain(v56);
            xpc_object_t v57 = v56;
          }
          else
          {
            xpc_object_t v57 = xpc_null_create();
          }
        }
        else
        {
          xpc_object_t v57 = xpc_null_create();
          xpc_object_t v56 = 0;
        }
        xpc_release(v56);
        if (v158 >= 0) {
          long long v58 = v157;
        }
        else {
          long long v58 = (void **)v157[0];
        }
        xpc_object_t v59 = xpc_string_create((const char *)v58);
        if (!v59) {
          xpc_object_t v59 = xpc_null_create();
        }
        xpc_dictionary_set_value(v57, abm::kKeyTraceDumpStateReason, v59);
        xpc_object_t v60 = xpc_null_create();
        xpc_release(v59);
        xpc_release(v60);
        xpc_object_t v61 = xpc_string_create(abm::kCollectBasebandLogs);
        if (!v61) {
          xpc_object_t v61 = xpc_null_create();
        }
        xpc_dictionary_set_value(v57, abm::kKeyTraceAction, v61);
        xpc_object_t v62 = xpc_null_create();
        xpc_release(v61);
        xpc_release(v62);
        xpc_object_t v63 = xpc_int64_create(v54);
        if (!v63) {
          xpc_object_t v63 = xpc_null_create();
        }
        xpc_dictionary_set_value(v57, abm::kKeyTraceDumpStatePerformCompression, v63);
        xpc_object_t v64 = xpc_null_create();
        xpc_release(v63);
        xpc_release(v64);
        xpc_object_t v65 = xpc_BOOL_create(value);
        if (!v65) {
          xpc_object_t v65 = xpc_null_create();
        }
        xpc_dictionary_set_value(v57, abm::kKeyTraceDumpStateSplitArchive, v65);
        xpc_object_t v66 = xpc_null_create();
        xpc_release(v65);
        xpc_release(v66);
        xpc_object_t object = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
        xpc_object_t object = xpc_null_create();
        *(void *)&long long v67 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v67 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)std::string __p = v67;
        long long v152 = v67;
        uint64_t v149 = *(void *)(v4 + 208);
        v68 = *(std::__shared_weak_count **)(v4 + 216);
        int v150 = v68;
        if (v68) {
          atomic_fetch_add_explicit(&v68->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        uint64_t v69 = (const void *)abm::kCommandTraceDumpState;
        size_t v70 = strlen(abm::kCommandTraceDumpState);
        if (v70 > 0x7FFFFFFFFFFFFFF7) {
          sub_100003540();
        }
        size_t v71 = v70;
        if (v70 >= 0x17)
        {
          uint64_t v73 = (v70 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v70 | 7) != 0x17) {
            uint64_t v73 = v70 | 7;
          }
          uint64_t v74 = v73 + 1;
          uint64_t v72 = operator new(v73 + 1);
          *(void *)&__dst[8] = v71;
          *(void *)&__dst[16] = v74 | 0x8000000000000000;
          *(void *)std::string __dst = v72;
        }
        else
        {
          __dst[23] = v70;
          uint64_t v72 = __dst;
          if (!v70)
          {
LABEL_114:
            v72[v71] = 0;
            abm::client::PerformCommand();
            if ((__dst[23] & 0x80000000) != 0) {
              operator delete(*(void **)__dst);
            }
            if (v150 && !atomic_fetch_add(&v150->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v150->__on_zero_shared)(v150);
              std::__shared_weak_count::__release_weak(v150);
            }
            if (LODWORD(__p[0]) != -534716415)
            {
              if (LODWORD(__p[0]))
              {
                size_t v82 = sub_10000369C(&std::cout, (uint64_t)"Baseband log collection: Failed", 31);
                std::ios_base::getloc((const std::ios_base *)((char *)v82 + *(void *)(*v82 - 24)));
                uint64_t v83 = std::locale::use_facet((const std::locale *)__dst, &std::ctype<char>::id);
                ((void (*)(const std::locale::facet *, uint64_t))v83->__vftable[2].~facet_0)(v83, 10);
                std::locale::~locale((std::locale *)__dst);
                std::ostream::put();
                std::ostream::flush();
LABEL_250:
                if (SHIBYTE(v152) < 0) {
                  operator delete(__p[1]);
                }
                xpc_release(v57);
                if (SHIBYTE(v158) < 0) {
                  operator delete(v157[0]);
                }
                goto LABEL_254;
              }
              uint64_t v75 = sub_10000369C(&std::cout, (uint64_t)"Baseband log collection: Success (ABM running)", 46);
              std::ios_base::getloc((const std::ios_base *)((char *)v75 + *(void *)(*v75 - 24)));
              uint64_t v76 = std::locale::use_facet((const std::locale *)__dst, &std::ctype<char>::id);
              ((void (*)(const std::locale::facet *, uint64_t))v76->__vftable[2].~facet_0)(v76, 10);
              std::locale::~locale((std::locale *)__dst);
              std::ostream::put();
              std::ostream::flush();
              xpc_object_t v77 = object;
              if (object || (xpc_object_t v77 = xpc_null_create()) != 0)
              {
                if (xpc_get_type(v77) == (xpc_type_t)&_xpc_type_dictionary)
                {
                  xpc_retain(v77);
                  xpc_object_t v78 = v77;
                }
                else
                {
                  xpc_object_t v78 = xpc_null_create();
                }
              }
              else
              {
                xpc_object_t v78 = xpc_null_create();
                xpc_object_t v77 = 0;
              }
              xpc_release(v77);
              if (value)
              {
                long long v85 = sub_10000369C(&std::cout, (uint64_t)"Main archive path = ", 20);
                size_t v86 = (const char *)abm::kKeyTimestampString;
                xpc_object_t v87 = xpc_dictionary_get_value(v78, abm::kKeyTimestampString);
                v136.__r_.__value_.__r.__words[0] = (std::string::size_type)v87;
                if (v87) {
                  xpc_retain(v87);
                }
                else {
                  v136.__r_.__value_.__r.__words[0] = (std::string::size_type)xpc_null_create();
                }
                memset(__dst, 0, 24);
                xpc::dyn_cast_or_default();
                if ((__dst[23] & 0x80000000) != 0) {
                  operator delete(*(void **)__dst);
                }
                int v91 = v162;
                abm::trace::getBasebandTraceDirSuffix((uint64_t *)v145, (abm::trace *)v165, v90);
                sub_1000186B0(&v174, (uint64_t)&v147, v91, 0, (uint64_t)v145);
                if ((v174.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                  uint64_t v92 = &v174;
                }
                else {
                  uint64_t v92 = (std::string *)v174.__r_.__value_.__r.__words[0];
                }
                if ((v174.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                  std::string::size_type size = HIBYTE(v174.__r_.__value_.__r.__words[2]);
                }
                else {
                  std::string::size_type size = v174.__r_.__value_.__l.__size_;
                }
                uint64_t v94 = sub_10000369C(v85, (uint64_t)v92, size);
                sub_100003488(v94);
                if (SHIBYTE(v174.__r_.__value_.__r.__words[2]) < 0)
                {
                  operator delete(v174.__r_.__value_.__l.__data_);
                  if ((v146 & 0x80000000) == 0)
                  {
LABEL_155:
                    if ((v148 & 0x80000000) == 0) {
                      goto LABEL_156;
                    }
LABEL_160:
                    operator delete(v147);
LABEL_156:
                    xpc_release(v136.__r_.__value_.__l.__data_);
                    int v95 = sub_10000369C(&std::cout, (uint64_t)"Lite archive path = ", 20);
                    xpc_object_t v96 = xpc_dictionary_get_value(v78, v86);
                    v136.__r_.__value_.__r.__words[0] = (std::string::size_type)v96;
                    if (v96) {
                      xpc_retain(v96);
                    }
                    else {
                      v136.__r_.__value_.__r.__words[0] = (std::string::size_type)xpc_null_create();
                    }
                    memset(__dst, 0, 24);
                    xpc::dyn_cast_or_default();
                    if ((__dst[23] & 0x80000000) != 0) {
                      operator delete(*(void **)__dst);
                    }
                    abm::trace::getBasebandTraceDirSuffix((uint64_t *)v141, (abm::trace *)v165, v97);
                    sub_1000186B0(&v174, (uint64_t)&v143, v91, 1, (uint64_t)v141);
                    if ((v174.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                      uint64_t v98 = &v174;
                    }
                    else {
                      uint64_t v98 = (std::string *)v174.__r_.__value_.__r.__words[0];
                    }
                    if ((v174.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                      std::string::size_type v99 = HIBYTE(v174.__r_.__value_.__r.__words[2]);
                    }
                    else {
                      std::string::size_type v99 = v174.__r_.__value_.__l.__size_;
                    }
                    int64_t v100 = sub_10000369C(v95, (uint64_t)v98, v99);
                    sub_100003488(v100);
                    if (SHIBYTE(v174.__r_.__value_.__r.__words[2]) < 0)
                    {
                      operator delete(v174.__r_.__value_.__l.__data_);
                      if ((v142 & 0x80000000) == 0)
                      {
LABEL_172:
                        if ((v144 & 0x80000000) == 0)
                        {
LABEL_173:
                          xpc_release(v136.__r_.__value_.__l.__data_);
LABEL_190:
                          xpc_release(v78);
                          goto LABEL_250;
                        }
LABEL_176:
                        operator delete(v143);
                        goto LABEL_173;
                      }
                    }
                    else if ((v142 & 0x80000000) == 0)
                    {
                      goto LABEL_172;
                    }
                    operator delete(v141[0]);
                    if ((v144 & 0x80000000) == 0) {
                      goto LABEL_173;
                    }
                    goto LABEL_176;
                  }
                }
                else if ((v146 & 0x80000000) == 0)
                {
                  goto LABEL_155;
                }
                operator delete(v145[0]);
                if ((v148 & 0x80000000) == 0) {
                  goto LABEL_156;
                }
                goto LABEL_160;
              }
              uint64_t v88 = sub_10000369C(&std::cout, (uint64_t)"Path = ", 7);
              xpc_object_t v89 = xpc_dictionary_get_value(v78, abm::kKeyTimestampString);
              v136.__r_.__value_.__r.__words[0] = (std::string::size_type)v89;
              if (v89) {
                xpc_retain(v89);
              }
              else {
                v136.__r_.__value_.__r.__words[0] = (std::string::size_type)xpc_null_create();
              }
              memset(__dst, 0, 24);
              xpc::dyn_cast_or_default();
              if ((__dst[23] & 0x80000000) != 0) {
                operator delete(*(void **)__dst);
              }
              int v102 = v162;
              abm::trace::getBasebandTraceDirSuffix((uint64_t *)v137, (abm::trace *)v165, v101);
              sub_1000186B0(&v174, (uint64_t)&v139, v102, 0, (uint64_t)v137);
              if ((v174.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                long long v103 = &v174;
              }
              else {
                long long v103 = (std::string *)v174.__r_.__value_.__r.__words[0];
              }
              if ((v174.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                std::string::size_type v104 = HIBYTE(v174.__r_.__value_.__r.__words[2]);
              }
              else {
                std::string::size_type v104 = v174.__r_.__value_.__l.__size_;
              }
              v105 = sub_10000369C(v88, (uint64_t)v103, v104);
              sub_100003488(v105);
              if (SHIBYTE(v174.__r_.__value_.__r.__words[2]) < 0)
              {
                operator delete(v174.__r_.__value_.__l.__data_);
                if ((v138 & 0x80000000) == 0)
                {
LABEL_188:
                  if ((v140 & 0x80000000) == 0)
                  {
LABEL_189:
                    xpc_release(v136.__r_.__value_.__l.__data_);
                    goto LABEL_190;
                  }
LABEL_193:
                  operator delete(v139);
                  goto LABEL_189;
                }
              }
              else if ((v138 & 0x80000000) == 0)
              {
                goto LABEL_188;
              }
              operator delete(v137[0]);
              if ((v140 & 0x80000000) == 0) {
                goto LABEL_189;
              }
              goto LABEL_193;
            }
            v136.__r_.__value_.__l.__size_ = 0xAAAAAAAAAAAAAAAALL;
            v136.__r_.__value_.__r.__words[2] = 0xAAAAAAAAAAAAAALL;
            v136.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAA00;
            if ((TelephonyUtilIsInternalBuild() & 1) == 0 && !TelephonyUtilIsCarrierBuild())
            {
LABEL_220:
              std::string::size_type v114 = HIBYTE(v136.__r_.__value_.__r.__words[2]);
              if ((v136.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
                std::string::size_type v114 = v136.__r_.__value_.__l.__size_;
              }
              if (v114)
              {
                v115 = sub_10000369C(&std::cout, (uint64_t)"Baseband log collection: Success (ABM not running)", 50);
                sub_100003488(v115);
                uint64_t v116 = sub_10000369C(&std::cout, (uint64_t)"Path = ", 7);
                size_t v117 = strlen(abm::trace::kSnapshotFolder);
                uint64_t v118 = sub_10000369C(v116, abm::trace::kSnapshotFolder, v117);
                size_t v119 = strlen(abm::trace::kLogDirPrefix);
                int v120 = sub_10000369C(v118, abm::trace::kLogDirPrefix, v119);
                if ((v136.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                  uint64_t v121 = &v136;
                }
                else {
                  uint64_t v121 = (std::string *)v136.__r_.__value_.__r.__words[0];
                }
                if ((v136.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                  std::string::size_type v122 = HIBYTE(v136.__r_.__value_.__r.__words[2]);
                }
                else {
                  std::string::size_type v122 = v136.__r_.__value_.__l.__size_;
                }
                int v123 = sub_10000369C(v120, (uint64_t)v121, v122);
                abm::trace::getBasebandTraceDirSuffix((uint64_t *)__dst, (abm::trace *)v165, v124);
                if (__dst[23] >= 0) {
                  size_t v125 = __dst;
                }
                else {
                  size_t v125 = *(unsigned char **)__dst;
                }
                if (__dst[23] >= 0) {
                  uint64_t v126 = __dst[23];
                }
                else {
                  uint64_t v126 = *(void *)&__dst[8];
                }
                int v127 = sub_10000369C(v123, (uint64_t)v125, v126);
                sub_100003488(v127);
              }
              else
              {
                memset(__dst, 170, 24);
                if (v165) {
                  uint64_t v128 = "QDSS.scratch";
                }
                else {
                  uint64_t v128 = "DIAG.scratch";
                }
                sub_10001615C(__dst, v128);
                uint64_t v129 = sub_10000369C(&std::cout, (uint64_t)"Baseband log collection: Success (ABM not running)", 50);
                sub_100003488(v129);
                int v130 = sub_10000369C(&std::cout, (uint64_t)"Path = ", 7);
                size_t v131 = strlen(abm::trace::kScratchFolder);
                size_t v132 = sub_10000369C(v130, abm::trace::kScratchFolder, v131);
                if (__dst[23] >= 0) {
                  size_t v133 = __dst;
                }
                else {
                  size_t v133 = *(unsigned char **)__dst;
                }
                if (__dst[23] >= 0) {
                  uint64_t v134 = __dst[23];
                }
                else {
                  uint64_t v134 = *(void *)&__dst[8];
                }
                int v135 = sub_10000369C(v132, (uint64_t)v133, v134);
                sub_100003488(v135);
              }
              if ((__dst[23] & 0x80000000) != 0) {
                operator delete(*(void **)__dst);
              }
              if (SHIBYTE(v136.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v136.__r_.__value_.__l.__data_);
              }
              goto LABEL_250;
            }
            unint64_t v180 = 0xAAAAAAAAAAAAAAAALL;
            unint64_t v181 = 0xAAAAAAAAAAAAAAAALL;
            uint64_t v178 = 0;
            uint64_t v179 = 0;
            abm::HelperClient::create();
            int v79 = v179;
            if (v179 && !atomic_fetch_add(&v179->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v79->__on_zero_shared)(v79);
              std::__shared_weak_count::__release_weak(v79);
            }
            xpc_object_t v177 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
            xpc_object_t v80 = xpc_dictionary_create(0, 0, 0);
            xpc_object_t v81 = v80;
            if (v80)
            {
              xpc_object_t v177 = v80;
            }
            else
            {
              xpc_object_t v81 = xpc_null_create();
              xpc_object_t v177 = v81;
              if (!v81)
              {
                xpc_object_t v84 = xpc_null_create();
                xpc_object_t v81 = 0;
                goto LABEL_195;
              }
            }
            if (xpc_get_type(v81) == (xpc_type_t)&_xpc_type_dictionary)
            {
              xpc_retain(v81);
              goto LABEL_196;
            }
            xpc_object_t v84 = xpc_null_create();
LABEL_195:
            xpc_object_t v177 = v84;
LABEL_196:
            xpc_release(v81);
            xpc_object_t v106 = xpc_dictionary_create(0, 0, 0);
            if (v106 || (xpc_object_t v106 = xpc_null_create()) != 0)
            {
              if (xpc_get_type(v106) == (xpc_type_t)&_xpc_type_dictionary)
              {
                xpc_retain(v106);
                xpc_object_t v107 = v106;
              }
              else
              {
                xpc_object_t v107 = xpc_null_create();
              }
            }
            else
            {
              xpc_object_t v107 = xpc_null_create();
              xpc_object_t v106 = 0;
            }
            xpc_release(v106);
            xpc_object_t v108 = xpc_int64_create(1500);
            if (!v108) {
              xpc_object_t v108 = xpc_null_create();
            }
            xpc_dictionary_set_value(v107, abm::helper::kKeyTimeout, v108);
            xpc_object_t v109 = xpc_null_create();
            xpc_release(v108);
            xpc_release(v109);
            *(void *)&long long v110 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v110 + 1) = 0xAAAAAAAAAAAAAAAALL;
            *(_OWORD *)std::string __dst = v110;
            *(_OWORD *)&__dst[16] = v110;
            xpc_object_t v175 = v107;
            if (v107) {
              xpc_retain(v107);
            }
            else {
              xpc_object_t v175 = xpc_null_create();
            }
            abm::HelperClient::perform();
            xpc_release(v175);
            xpc_object_t v175 = 0;
            if (!*(_DWORD *)__dst && xpc_get_type(v177) == (xpc_type_t)&_xpc_type_dictionary)
            {
              xpc_object_t v111 = xpc_dictionary_get_value(v177, abm::helper::kKeyTimestampString);
              xpc_object_t v173 = v111;
              if (v111) {
                xpc_retain(v111);
              }
              else {
                xpc_object_t v173 = xpc_null_create();
              }
              xpc::dyn_cast_or_default((uint64_t *)&v174, (xpc *)&v173, (const object *)&unk_10001EBA7, v112);
              if (SHIBYTE(v136.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v136.__r_.__value_.__l.__data_);
              }
              std::string v136 = v174;
              *((unsigned char *)&v174.__r_.__value_.__s + 23) = 0;
              v174.__r_.__value_.__s.__data_[0] = 0;
              xpc_release(v173);
            }
            if ((__dst[31] & 0x80000000) != 0) {
              operator delete(*(void **)&__dst[8]);
            }
            xpc_release(v107);
            xpc_release(v177);
            size_t v113 = (std::__shared_weak_count *)v181;
            if (v181 && !atomic_fetch_add((atomic_ullong *volatile)(v181 + 8), 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v113->__on_zero_shared)(v113);
              std::__shared_weak_count::__release_weak(v113);
            }
            goto LABEL_220;
          }
        }
        memmove(v72, v69, v71);
        goto LABEL_114;
      }
    }
    int v54 = 0;
    BOOL value = 0;
    goto LABEL_87;
  }
  std::string::size_type v41 = sub_10000369C(&std::cout, (uint64_t)"Baseband logs are not enabled", 29);
  std::ios_base::getloc((const std::ios_base *)((char *)v41 + *(void *)(*v41 - 24)));
  char v42 = std::locale::use_facet((const std::locale *)__dst, &std::ctype<char>::id);
  ((void (*)(const std::locale::facet *, uint64_t))v42->__vftable[2].~facet_0)(v42, 10);
  std::locale::~locale((std::locale *)__dst);
  std::ostream::put();
  std::ostream::flush();
  xpc_object_t v25 = v22;
LABEL_254:
  if (SHIBYTE(v166.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v166.__r_.__value_.__l.__data_);
  }
LABEL_36:
  int v26 = v169;
  xpc_release(v25);
  if (SHIBYTE(v170) < 0) {
    operator delete(*((void **)&v169 + 1));
  }
  xpc_release(v6);
  return v26 == 0;
}

void sub_10001B1C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,void *a28,uint64_t a29,uint64_t a30,void *a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,void *a36,void *a37,uint64_t a38,int a39,__int16 a40,char a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,void *a48,uint64_t a49,int a50,__int16 a51,char a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,void *a58,uint64_t a59,int a60,__int16 a61,char a62,char a63)
{
  xpc_release(*(xpc_object_t *)(v67 - 200));
  if (*(char *)(v67 - 129) < 0) {
    operator delete(*(void **)(v67 - 152));
  }
  xpc_release(v66);
  xpc_release(*(xpc_object_t *)(v67 - 128));
  sub_10000340C(v67 - 104);
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a42 < 0) {
    operator delete(a37);
  }
  xpc_release(v65);
  if (a53 < 0) {
    operator delete(a48);
  }
  if (a63 < 0) {
    operator delete(a58);
  }
  xpc_release(v64);
  if (*(char *)(v67 - 225) < 0) {
    operator delete(*(void **)(v67 - 248));
  }
  xpc_release(v63);
  _Unwind_Resume(a1);
}

BOOL sub_10001B76C(id a1, group *a2, list<std::string, std::allocator<std::string>> *a3)
{
  gr_name = a2->gr_name;
  if (a2->gr_name)
  {
    dispatch_retain((dispatch_object_t)a2->gr_name);
    dispatch_group_enter((dispatch_group_t)gr_name);
  }
  __p[0] = 0;
  __p[1] = 0;
  xpc_object_t v46 = 0;
  unint64_t var0 = a3->var1.var0;
  if (var0 < 2)
  {
    xpc_object_t v8 = sub_10000369C(&std::cout, (uint64_t)"os log collection: Failed", 25);
    std::ios_base::getloc((const std::ios_base *)((char *)v8 + *(void *)(*v8 - 24)));
    xpc_object_t v9 = std::locale::use_facet(&v47, &std::ctype<char>::id);
    ((void (*)(const std::locale::facet *, uint64_t))v9->__vftable[2].~facet_0)(v9, 10);
    std::locale::~locale(&v47);
    std::ostream::put();
    std::ostream::flush();
    BOOL v10 = 0;
  }
  else
  {
    xpc_object_t v6 = (char *)a3->var0.var0;
    xpc_object_t v7 = (void **)((char *)a3->var0.var0 + 16);
    if (__p != v7)
    {
      if (v6[39] < 0)
      {
        sub_10000435C(__p, *((void **)v6 + 2), *((void *)v6 + 3));
        xpc_object_t v6 = (char *)a3->var0.var0;
        unint64_t var0 = a3->var1.var0;
      }
      else
      {
        *(_OWORD *)std::string __p = *(_OWORD *)v7;
        xpc_object_t v46 = v7[2];
      }
    }
    if (SHIBYTE(v46) >= 0) {
      xpc_object_t v11 = __p;
    }
    else {
      xpc_object_t v11 = (void **)__p[0];
    }
    int v12 = atoi((const char *)v11);
    char v13 = *(void **)v6;
    v13[1] = *((void *)v6 + 1);
    **((void **)v6 + 1) = v13;
    a3->var1.unint64_t var0 = var0 - 1;
    if (v6[39] < 0) {
      operator delete(*((void **)v6 + 2));
    }
    operator delete(v6);
    xpc_object_t v14 = (char *)a3->var0.var0 + 16;
    if (*((char *)a3->var0.var0 + 39) < 0) {
      xpc_object_t v14 = (void *)*v14;
    }
    size_t v15 = +[NSString stringWithUTF8String:v14];
    size_t v16 = (char *)a3->var0.var0;
    uint64_t v17 = *(void *)a3->var0.var0;
    *(void *)(v17 + 8) = *((void *)a3->var0.var0 + 1);
    **((void **)v16 + 1) = v17;
    --a3->var1.var0;
    if (v16[39] < 0)
    {
      operator delete(*((void **)v16 + 2));
      operator delete(v16);
      if (a3->var1.var0) {
        goto LABEL_18;
      }
    }
    else
    {
      operator delete(v16);
      if (a3->var1.var0)
      {
LABEL_18:
        id v18 = objc_alloc_init((Class)NSMutableArray);
        id v19 = objc_alloc_init((Class)NSMutableArray);
        if (!a3->var1.var0) {
          goto LABEL_69;
        }
        uint64_t v43 = v15;
        uint64_t v44 = gr_name;
        int v20 = 0;
        while (1)
        {
          xpc_object_t v21 = (unsigned __int8 *)a3->var0.var0;
          xpc_object_t v22 = (void **)((char *)a3->var0.var0 + 16);
          if (__p != v22)
          {
            size_t v23 = v21[39];
            if (SHIBYTE(v46) < 0)
            {
              xpc_object_t v25 = (char *)*((void *)v21 + 2);
              size_t v24 = *((void *)v21 + 3);
              if ((v23 & 0x80u) == 0) {
                int v26 = (char *)a3->var0.var0 + 16;
              }
              else {
                int v26 = v25;
              }
              if ((v23 & 0x80u) == 0) {
                size_t v27 = v23;
              }
              else {
                size_t v27 = v24;
              }
              sub_100004424(__p, v26, v27);
            }
            else if ((v23 & 0x80) != 0)
            {
              sub_10000435C(__p, *((void **)v21 + 2), *((void *)v21 + 3));
            }
            else
            {
              *(_OWORD *)std::string __p = *(_OWORD *)v22;
              xpc_object_t v46 = v22[2];
            }
          }
          std::string::size_type v28 = (void *)HIBYTE(v46);
          xpc_object_t v29 = __p[1];
          if (SHIBYTE(v46) >= 0) {
            size_t v30 = HIBYTE(v46) != 0;
          }
          else {
            size_t v30 = __p[1] != 0;
          }
          if (SHIBYTE(v46) >= 0) {
            xpc_object_t v31 = __p;
          }
          else {
            xpc_object_t v31 = (void **)__p[0];
          }
          int v32 = memcmp(v31, "-", v30);
          if (v30 == 1 && v32 == 0)
          {
            if ((char)v28 >= 0) {
              xpc_object_t v29 = v28;
            }
            if ((unint64_t)v29 >= 2) {
              size_t v38 = 2;
            }
            else {
              size_t v38 = (size_t)v29;
            }
            if (!memcmp(v31, "-p", v38) && v29 == (void *)2)
            {
              int v20 = 112;
            }
            else
            {
              int v40 = memcmp(v31, "-i", v38);
              if (v29 == (void *)2 && v40 == 0) {
                int v20 = 105;
              }
              else {
                int v20 = 0;
              }
            }
            goto LABEL_48;
          }
          if (v20 == 105) {
            break;
          }
          if (v20 == 112)
          {
            xpc_object_t v34 = +[NSString stringWithUTF8String:v31];
            xpc_object_t v35 = v18;
LABEL_47:
            [v35 addObject:v34];
          }
LABEL_48:
          long long v36 = (char *)a3->var0.var0;
          uint64_t v37 = *(void *)a3->var0.var0;
          *(void *)(v37 + 8) = *((void *)a3->var0.var0 + 1);
          **((void **)v36 + 1) = v37;
          --a3->var1.var0;
          if (v36[39] < 0) {
            operator delete(*((void **)v36 + 2));
          }
          operator delete(v36);
          if (!a3->var1.var0)
          {
            gr_name = v44;
            size_t v15 = v43;
            goto LABEL_69;
          }
        }
        xpc_object_t v34 = +[NSString stringWithUTF8String:v31];
        xpc_object_t v35 = v19;
        goto LABEL_47;
      }
    }
    id v18 = [objc_alloc((Class)NSMutableArray) initWithObjects:@"CommCenter", @"CommCenterMobileHelper", @"CommCenterRootHelper", @"abm-helper", @"WirelessRadioManagerd", @"com.apple.DiagnosticExtensions.Cellular", @"powerd", 0];
    id v19 = [objc_alloc((Class)NSMutableArray) initWithObjects:@"AppleBaseband", nil];
LABEL_69:
    BOOL v10 = +[OsLogStream putOsLogStreamToFile:v15 process:v18 imagePath:v19 history:(double)v12];
  }
  if (SHIBYTE(v46) < 0) {
    operator delete(__p[0]);
  }
  if (gr_name)
  {
    dispatch_group_leave((dispatch_group_t)gr_name);
    dispatch_release((dispatch_object_t)gr_name);
  }
  return v10;
}

void sub_10001BC30(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, dispatch_group_t group, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0)
  {
    operator delete(__p);
    if (!v24) {
LABEL_3:
    }
      _Unwind_Resume(exception_object);
  }
  else if (!v24)
  {
    goto LABEL_3;
  }
  dispatch_group_leave(v24);
  dispatch_release(v24);
  _Unwind_Resume(exception_object);
}

uint64_t LogdumpCommand::create@<X0>(char *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, NSObject **a4@<X3>, void *a5@<X8>)
{
  *a5 = 0xAAAAAAAAAAAAAAAALL;
  a5[1] = 0xAAAAAAAAAAAAAAAALL;
  BOOL v10 = operator new(0xE8uLL);
  uint64_t v11 = *a2;
  int v12 = (std::__shared_weak_count *)a2[1];
  uint64_t v19 = v11;
  int v20 = v12;
  if (v12) {
    atomic_fetch_add_explicit(&v12->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v13 = *a3;
  xpc_object_t v14 = (std::__shared_weak_count *)a3[1];
  v18[0] = v13;
  v18[1] = (uint64_t)v14;
  if (v14) {
    atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  size_t v15 = *a4;
  dispatch_object_t v17 = v15;
  if (v15) {
    dispatch_retain(v15);
  }
  LogdumpCommand::LogdumpCommand(v10, a1, &v19, v18, &v17);
  sub_10001C000(a5, (uint64_t)v10);
  if (v15) {
    dispatch_release(v15);
  }
  if (v14 && !atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
    std::__shared_weak_count::__release_weak(v14);
  }
  if (v20) {
    std::__shared_weak_count::__release_weak(v20);
  }
  return (*(uint64_t (**)(void))(*(void *)*a5 + 16))();
}

void sub_10001BE0C(_Unwind_Exception *a1)
{
  sub_10000340C(v1);
  _Unwind_Resume(a1);
}

void sub_10001BE20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  if (v13)
  {
    dispatch_release(v13);
    sub_10000340C((uint64_t)&a11);
    if (!v12)
    {
LABEL_3:
      if (v14) {
        goto LABEL_4;
      }
      goto LABEL_7;
    }
  }
  else
  {
    sub_10000340C((uint64_t)&a11);
    if (!v12) {
      goto LABEL_3;
    }
  }
  std::__shared_weak_count::__release_weak(v12);
  if (v14)
  {
LABEL_4:
    operator delete(v11);
    _Unwind_Resume(a1);
  }
LABEL_7:
  _Unwind_Resume(a1);
}

uint64_t sub_10001BE70(void *a1)
{
  *a1 = off_100020728;
  xpc_object_t v2 = a1[28];
  if (v2) {
    dispatch_release(v2);
  }
  xpc_object_t v3 = (std::__shared_weak_count *)a1[27];
  if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
    uint64_t v4 = (uint64_t)a1;
  }
  else
  {
    uint64_t v4 = (uint64_t)a1;
  }
  return sub_10000EB68(v4);
}

void sub_10001BF34(void *a1)
{
  *a1 = off_100020728;
  xpc_object_t v2 = a1[28];
  if (v2) {
    dispatch_release(v2);
  }
  xpc_object_t v3 = (std::__shared_weak_count *)a1[27];
  if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
    uint64_t v4 = (void *)sub_10000EB68((uint64_t)a1);
  }
  else
  {
    uint64_t v4 = (void *)sub_10000EB68((uint64_t)a1);
  }
  operator delete(v4);
}

void *sub_10001C000(void *a1, uint64_t a2)
{
  *a1 = a2;
  uint64_t v4 = (std::__shared_weak_count *)operator new(0x20uLL);
  v4->__shared_owners_ = 0;
  p_shared_owners = &v4->__shared_owners_;
  v4->__vftable = (std::__shared_weak_count_vtbl *)&off_100020AB8;
  v4->__shared_weak_owners_ = 0;
  v4[1].__vftable = (std::__shared_weak_count_vtbl *)a2;
  a1[1] = v4;
  if (!a2) {
    return a1;
  }
  xpc_object_t v6 = *(std::__shared_weak_count **)(a2 + 16);
  if (v6)
  {
    if (v6->__shared_owners_ == -1)
    {
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
      atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
      *(void *)(a2 + 8) = a2;
      *(void *)(a2 + 16) = v4;
      std::__shared_weak_count::__release_weak(v6);
      if (!atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
        goto LABEL_8;
      }
    }
    return a1;
  }
  atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  *(void *)(a2 + 8) = a2;
  *(void *)(a2 + 16) = v4;
  if (atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
    return a1;
  }
LABEL_8:
  ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
  std::__shared_weak_count::__release_weak(v4);
  return a1;
}

void sub_10001C118(_Unwind_Exception *exception_object)
{
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_10001C154(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t sub_10001C17C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t sub_10001C1AC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x800000010001F71ALL) {
    return a1 + 24;
  }
  if (((v3 & 0x800000010001F71ALL & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x800000010001F71ALL)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000010001F71ALL & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 24;
  }
  return 0;
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

void CFRunLoopRun(void)
{
}

uint64_t TelephonyUtilIsCarrierBuild()
{
  return _TelephonyUtilIsCarrierBuild();
}

uint64_t TelephonyUtilIsInternalBuild()
{
  return _TelephonyUtilIsInternalBuild();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
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

uint64_t capabilities::diag::supportsQDSS(capabilities::diag *this)
{
  return capabilities::diag::supportsQDSS(this);
}

uint64_t capabilities::radio::radioUnknown(capabilities::radio *this)
{
  return capabilities::radio::radioUnknown(this);
}

uint64_t abm::HelperClient::create()
{
  return abm::HelperClient::create();
}

uint64_t abm::HelperClient::perform()
{
  return abm::HelperClient::perform();
}

uint64_t abm::trace::getCoreDumpDirSuffix(abm::trace *this)
{
  return abm::trace::getCoreDumpDirSuffix(this);
}

uint64_t abm::trace::getBasebandTraceDirSuffix(abm::trace *this, BOOL a2)
{
  return abm::trace::getBasebandTraceDirSuffix(this, a2);
}

uint64_t abm::client::CreateManager()
{
  return abm::client::CreateManager();
}

uint64_t abm::client::PerformCommand()
{
  return abm::client::PerformCommand();
}

{
  return abm::client::PerformCommand();
}

uint64_t abm::client::RegisterEventHandler()
{
  return abm::client::RegisterEventHandler();
}

uint64_t abm::client::EventsOn()
{
  return abm::client::EventsOn();
}

uint64_t abm::client::EventsOff()
{
  return abm::client::EventsOff();
}

uint64_t ctu::isProcessRunning()
{
  return ctu::isProcessRunning();
}

uint64_t ctu::Gestalt::create_default_global(ctu::Gestalt *this)
{
  return ctu::Gestalt::create_default_global(this);
}

uint64_t xpc::dyn_cast_or_default(xpc *this, const object *a2, const char *a3)
{
  return xpc::dyn_cast_or_default(this, a2, a3);
}

uint64_t xpc::dyn_cast_or_default()
{
  return xpc::dyn_cast_or_default();
}

uint64_t util::equal_nocase()
{
  return util::equal_nocase();
}

uint64_t defaults::compression::splitArchive(defaults::compression *this)
{
  return defaults::compression::splitArchive(this);
}

uint64_t defaults::compression::mode(defaults::compression *this)
{
  return defaults::compression::mode(this);
}

uint64_t defaults::compression::supported(defaults::compression *this)
{
  return defaults::compression::supported(this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return std::locale::use_facet(this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return std::ios_base::getloc(this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return std::string::append(this, __s, __n);
}

std::string *__cdecl std::string::append(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return std::string::append(this, __n, __c);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return std::string::insert(this, __pos, __s, __n);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

uint64_t std::istream::unget()
{
  return std::istream::unget();
}

uint64_t std::istream::sentry::sentry()
{
  return std::istream::sentry::sentry();
}

uint64_t std::istream::~istream()
{
  return std::istream::~istream();
}

uint64_t std::ostream::put()
{
  return std::ostream::put();
}

uint64_t std::ostream::flush()
{
  return std::ostream::flush();
}

uint64_t std::ostream::sentry::sentry()
{
  return std::ostream::sentry::sentry();
}

uint64_t std::ostream::sentry::~sentry()
{
  return std::ostream::sentry::~sentry();
}

uint64_t std::iostream::~basic_iostream()
{
  return std::iostream::~basic_iostream();
}

uint64_t std::streambuf::basic_streambuf()
{
  return std::streambuf::basic_streambuf();
}

uint64_t std::streambuf::~streambuf()
{
  return std::streambuf::~streambuf();
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

uint64_t std::stol(const std::string *__str, size_t *__idx, int __base)
{
  return std::stol(__str, __idx, __base);
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
  return std::ios::~ios();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return std::to_string(retstr, __val);
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
  return ___cxa_allocate_exception(thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return ___cxa_atexit(lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
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

int add_history(const char *a1)
{
  return _add_history(a1);
}

int atoi(const char *a1)
{
  return _atoi(a1);
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

const char *getprogname(void)
{
  return _getprogname();
}

HIST_ENTRY *__cdecl history_get(int a1)
{
  return _history_get(a1);
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

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

void objc_enumerationMutation(id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create(a1, a2, a3, a4);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

char *__cdecl readline(const char *a1)
{
  return _readline(a1);
}

int rl_bind_key(int a1, rl_command_func_t *a2)
{
  return _rl_bind_key(a1, a2);
}

char **__cdecl rl_completion_matches(const char *a1, rl_compentry_func_t *a2)
{
  return _rl_completion_matches(a1, a2);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return _strcasecmp(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

char *__cdecl strtok(char *__str, const char *__sep)
{
  return _strtok(__str, __sep);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return _xpc_BOOL_create(value);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return _xpc_int64_create(value);
}

xpc_object_t xpc_null_create(void)
{
  return _xpc_null_create();
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return _xpc_retain(object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return _xpc_string_create(string);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_activityIdentifier(void *a1, const char *a2, ...)
{
  return [a1 activityIdentifier];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_category(void *a1, const char *a2, ...)
{
  return [a1 category];
}

id objc_msgSend_closeFile(void *a1, const char *a2, ...)
{
  return [a1 closeFile];
}

id objc_msgSend_composedMessage(void *a1, const char *a2, ...)
{
  return [a1 composedMessage];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_localStore(void *a1, const char *a2, ...)
{
  return [a1 localStore];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_process(void *a1, const char *a2, ...)
{
  return [a1 process];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_seekToEndOfFile(void *a1, const char *a2, ...)
{
  return [a1 seekToEndOfFile];
}

id objc_msgSend_sender(void *a1, const char *a2, ...)
{
  return [a1 sender];
}

id objc_msgSend_subsystem(void *a1, const char *a2, ...)
{
  return [a1 subsystem];
}

id objc_msgSend_threadIdentifier(void *a1, const char *a2, ...)
{
  return [a1 threadIdentifier];
}

id objc_msgSend_timeZone(void *a1, const char *a2, ...)
{
  return [a1 timeZone];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_writeData_(void *a1, const char *a2, ...)
{
  return [a1 writeData:];
}