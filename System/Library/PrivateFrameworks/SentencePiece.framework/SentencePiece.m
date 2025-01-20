void *sub_25C135DA0()
{
  pthread_key_t *v0;
  void *v1;

  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26A596110, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26A596110))
  {
    operator new();
  }
  v0 = (pthread_key_t *)qword_26A596108;
  v1 = pthread_getspecific(*(void *)qword_26A596108);
  if (!v1)
  {
    v1 = operator new(0x40uLL, (std::align_val_t)0x40uLL);
    *(_OWORD *)v1 = xmmword_25C16D9F0;
    v1[2] = 0;
    pthread_setspecific(*v0, v1);
  }
  return v1;
}

void sub_25C135E68(_Unwind_Exception *a1)
{
  MEMORY[0x26117F4A0](v1, 0x1000C4000313F17);
  __cxa_guard_abort(&qword_26A596110);
  _Unwind_Resume(a1);
}

uint64_t sub_25C135EA0(uint64_t result)
{
  if (result) {
    JUMPOUT(0x26117F490);
  }
  return result;
}

void sub_25C135EB0(void *a1)
{
}

void *sub_25C135EC4(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (a2 != -1)
  {
    if (v4)
    {
      unint64_t v5 = *(void *)(v4 + 8);
      if (v5 >= 2 * a2) {
        unint64_t v5 = 2 * a2;
      }
      goto LABEL_8;
    }
    unint64_t v8 = 2 * a2;
    if ((unint64_t)(2 * a2) >= 0x2000) {
      unint64_t v8 = 0x2000;
    }
    if (v8 <= a3 + 24) {
      size_t v6 = a3 + 24;
    }
    else {
      size_t v6 = v8;
    }
LABEL_20:
    result = operator new(v6);
    goto LABEL_21;
  }
  if (!v4)
  {
    uint64_t v9 = 232;
    if (a3 > 0xE8) {
      uint64_t v9 = a3;
    }
    size_t v6 = v9 + 24;
    goto LABEL_20;
  }
  unint64_t v5 = *(void *)v4;
LABEL_8:
  if (v5 <= a3 + 24) {
    size_t v6 = a3 + 24;
  }
  else {
    size_t v6 = v5;
  }
  result = (void *)(*(uint64_t (**)(size_t))(v4 + 16))(v6);
LABEL_21:
  atomic_fetch_add_explicit((atomic_ullong *volatile)(a1 + 16), v6, memory_order_relaxed);
  return result;
}

void *sub_25C135F70(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  result = (void *)a1[3];
  do
  {
    if (result)
    {
      if ((unint64_t)(2 * *result) >= 0x40) {
        uint64_t v7 = 64;
      }
      else {
        uint64_t v7 = 2 * *result;
      }
    }
    else
    {
      uint64_t v7 = 8;
    }
    unint64_t v8 = (16 * (_WORD)v7 + 23) & 0xFF0;
    uint64_t v9 = (void *)a1[5];
    if (a1[6] - (uint64_t)v9 < v8)
    {
      result = sub_25C136034(a1, v8);
      v10 = (void *)a1[3];
    }
    else
    {
      a1[5] = (uint64_t)v9 + v8;
      v10 = result;
      result = v9;
    }
    void *result = v7;
    result[1] = v10;
    a1[3] = (uint64_t)result;
    a1[7] = (uint64_t)(result + 2);
    a1[8] = (uint64_t)&result[2 * v7 + 2];
  }
  while (!(16 * v7));
  result[2] = a2;
  result[3] = a3;
  a1[7] = (uint64_t)(result + 4);
  return result;
}

void *sub_25C136034(uint64_t *a1, unint64_t a2)
{
  uint64_t v4 = (void *)a1[2];
  uint64_t v5 = v4[2];
  unint64_t v8 = a1 + 5;
  result = (void *)a1[5];
  uint64_t v7 = (char *)v8[1];
  do
  {
    v4[1] = (char *)result + v5 - (void)v7;
    uint64_t v9 = sub_25C135EC4(*a1, v5, a2);
    *uint64_t v9 = v4;
    v9[1] = 24;
    v9[2] = v5;
    a1[2] = (uint64_t)v9;
    result = v9 + 3;
    uint64_t v7 = (char *)v9 + v5;
    a1[5] = (uint64_t)(v9 + 3);
    a1[6] = (uint64_t)v9 + v5;
    uint64_t v4 = v9;
  }
  while (v5 - 24 < a2);
  a1[5] = (uint64_t)result + a2;
  return result;
}

void *sub_25C1360BC(void *a1, unint64_t a2, uint64_t a3)
{
  size_t v6 = sub_25C135DA0();
  if (v6[1] == a1[3])
  {
    explicit = (uint64_t *)v6[2];
    goto LABEL_3;
  }
  uint64_t v9 = sub_25C135DA0();
  explicit = (uint64_t *)atomic_load_explicit(a1 + 1, memory_order_acquire);
  if (explicit && (void *)explicit[1] == v9)
  {
LABEL_3:
    return sub_25C136168(explicit, a2, a3);
  }

  return sub_25C1361E8(a1, a2, a3);
}

void *sub_25C136168(uint64_t *a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)a1[5];
  if (a1[6] - (uint64_t)v5 < a2) {
    uint64_t v5 = sub_25C136034(a1, a2);
  }
  else {
    a1[5] = (uint64_t)v5 + a2;
  }
  size_t v6 = (void *)a1[7];
  if (v6 == (void *)a1[8])
  {
    sub_25C135F70(a1, (uint64_t)v5, a3);
  }
  else
  {
    *size_t v6 = v5;
    v6[1] = a3;
    a1[7] = (uint64_t)(v6 + 2);
  }
  return v5;
}

void *sub_25C1361E8(void *a1, unint64_t a2, uint64_t a3)
{
  size_t v6 = sub_25C135DA0();
  uint64_t v7 = (uint64_t *)sub_25C136240(a1, (uint64_t)v6);

  return sub_25C136168(v7, a2, a3);
}

unint64_t sub_25C136240(void *a1, uint64_t a2)
{
  unint64_t explicit = atomic_load_explicit(a1, memory_order_acquire);
  if (explicit)
  {
    while (*(void *)(explicit + 8) != a2)
    {
      unint64_t explicit = *(void *)(explicit + 32);
      if (!explicit) {
        goto LABEL_4;
      }
    }
  }
  else
  {
LABEL_4:
    uint64_t v5 = sub_25C135EC4((uint64_t)a1, -1, 0x48uLL);
    v5[3] = a1;
    unint64_t explicit = (unint64_t)(v5 + 3);
    v5[2] = v6;
    *(_OWORD *)uint64_t v5 = xmmword_25C16DA00;
    v5[4] = a2;
    v5[5] = v5;
    v5[8] = v5 + 12;
    v5[9] = (char *)v5 + v6;
    v5[6] = 0;
    v5[10] = 0;
    v5[11] = 0;
    atomic_ullong v7 = *a1;
    v5[7] = *a1;
    atomic_ullong v8 = v7;
    atomic_compare_exchange_strong_explicit(a1, (unint64_t *)&v8, (unint64_t)(v5 + 3), memory_order_release, memory_order_relaxed);
    if (v8 != v7)
    {
      atomic_ullong v9 = v8;
      do
      {
        v5[7] = v8;
        atomic_compare_exchange_strong_explicit(a1, (unint64_t *)&v9, explicit, memory_order_release, memory_order_relaxed);
        BOOL v10 = v9 == v8;
        atomic_ullong v8 = v9;
      }
      while (!v10);
    }
  }
  sub_25C135DA0()[2] = explicit;
  uint64_t v11 = a1[3];
  sub_25C135DA0()[1] = v11;
  atomic_store(explicit, a1 + 1);
  return explicit;
}

void *sub_25C136318(void *a1, unint64_t a2)
{
  uint64_t v4 = sub_25C135DA0();
  uint64_t v5 = (uint64_t *)sub_25C136240(a1, (uint64_t)v4);
  uint64_t v6 = v5[5];
  if (v5[6] - v6 < a2)
  {
    return sub_25C136034(v5, a2);
  }
  else
  {
    v5[5] = v6 + a2;
    return (void *)v6;
  }
}

void *sub_25C1363A0(void *a1, unint64_t a2)
{
  uint64_t v4 = sub_25C135DA0();
  if (v4[1] == a1[3])
  {
    unint64_t explicit = (uint64_t *)v4[2];
    goto LABEL_3;
  }
  atomic_ullong v8 = sub_25C135DA0();
  unint64_t explicit = (uint64_t *)atomic_load_explicit(a1 + 1, memory_order_acquire);
  if (explicit && (void *)explicit[1] == v8)
  {
LABEL_3:
    uint64_t v6 = explicit[5];
    if (explicit[6] - v6 < a2)
    {
      return sub_25C136034(explicit, a2);
    }
    else
    {
      explicit[5] = v6 + a2;
      return (void *)v6;
    }
  }

  return sub_25C136318(a1, a2);
}

unint64_t sub_25C13645C(void *a1)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26A596118, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26A596118))
  {
    __cxa_atexit((void (*)(void *))std::mutex::~mutex, &stru_26A595FE8, &dword_25C135000);
    __cxa_guard_release(&qword_26A596118);
  }
  std::mutex::lock(&stru_26A595FE8);
  unint64_t explicit = atomic_load_explicit(a1 + 3, memory_order_acquire);
  if (!explicit)
  {
    sub_25C136514(a1, (void *)*a1, a1[1]);
    atomic_store((unint64_t)a1, a1 + 3);
    unint64_t explicit = (unint64_t)a1;
  }
  std::mutex::unlock(&stru_26A595FE8);
  return explicit;
}

void *sub_25C136514(void *__dst, void *__src, size_t __len)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    sub_25C1365BC();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *__dst = v6;
  }
  else
  {
    *((unsigned char *)__dst + 23) = __len;
    uint64_t v6 = __dst;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memmove(v6, __src, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __dst;
}

void sub_25C1365BC()
{
}

void sub_25C1365D4(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_25C136630(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2654AE168, MEMORY[0x263F8C060]);
}

void sub_25C13661C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_25C136630(std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void *sub_25C136668(void *a1, uint64_t a2, long long *a3, uint64_t a4)
{
  if (*a1 != a2)
  {
    JUMPOUT(0x26117F1E0);
  }
  if (!a4) {
    operator new();
  }
  if (*(unsigned char *)(a4 + 24)) {
    (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(a4 + 32) + 32) + 40))(*(void *)(*(void *)(a4 + 32) + 32), &unk_270989328, 24);
  }
  result = sub_25C1360BC((void *)a4, 0x18uLL, (uint64_t)sub_25C136878);
  size_t v8 = result;
  if (*((char *)a3 + 23) < 0)
  {
    result = sub_25C1367DC(result, *(void **)a3, *((void *)a3 + 1));
  }
  else
  {
    long long v9 = *a3;
    result[2] = *((void *)a3 + 2);
    *(_OWORD *)result = v9;
  }
  *a1 = v8;
  return result;
}

void sub_25C1367B8(_Unwind_Exception *a1)
{
  MEMORY[0x26117F4A0](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

void *sub_25C1367DC(unsigned char *__dst, void *__src, unint64_t a3)
{
  uint64_t v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8) {
      sub_25C1365BC();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    size_t v8 = operator new(v6 + 1);
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

void sub_25C136878(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
}

void sub_25C13688C(uint64_t **a1, long long *a2, uint64_t a3)
{
  uint64_t v4 = *a1;
  if (*a1 == &qword_26A5963D0)
  {
    if (!a3) {
      operator new();
    }
    if (*(unsigned char *)(a3 + 24))
    {
      uint64_t v9 = a3;
      (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(a3 + 32) + 32) + 40))(*(void *)(*(void *)(a3 + 32) + 32), &unk_270989328, 24);
      a3 = v9;
    }
    uint64_t v7 = sub_25C1360BC((void *)a3, 0x18uLL, (uint64_t)sub_25C136878);
    uint64_t v8 = *((void *)a2 + 2);
    *(_OWORD *)uint64_t v7 = *a2;
    v7[2] = v8;
    *((void *)a2 + 1) = 0;
    *((void *)a2 + 2) = 0;
    *(void *)a2 = 0;
    *a1 = v7;
  }
  else
  {
    if (*((char *)v4 + 23) < 0) {
      operator delete((void *)*v4);
    }
    long long v5 = *a2;
    v4[2] = *((void *)a2 + 2);
    *(_OWORD *)uint64_t v4 = v5;
    *((unsigned char *)a2 + 23) = 0;
    *(unsigned char *)a2 = 0;
  }
}

uint64_t *sub_25C1369B4(uint64_t **a1, uint64_t a2)
{
  result = *a1;
  if (result == &qword_26A5963D0)
  {
    if (!a2) {
      operator new();
    }
    if (*(unsigned char *)(a2 + 24))
    {
      uint64_t v4 = a2;
      (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(a2 + 32) + 32) + 40))(*(void *)(*(void *)(a2 + 32) + 32), &unk_270989328, 24);
      a2 = v4;
    }
    result = sub_25C1360BC((void *)a2, 0x18uLL, (uint64_t)sub_25C136878);
    uint64_t *result = 0;
    result[1] = 0;
    result[2] = 0;
    *a1 = result;
  }
  return result;
}

void *sub_25C136A88(void *a1, void *a2, uint64_t a3)
{
  v3 = (void *)*a1;
  if (*a1) {
    return v3;
  }
  unint64_t explicit = atomic_load_explicit(a2 + 3, memory_order_acquire);
  if (!explicit)
  {
    unint64_t explicit = sub_25C13645C(a2);
    if (a3) {
      goto LABEL_4;
    }
LABEL_9:
    operator new();
  }
  if (!a3) {
    goto LABEL_9;
  }
LABEL_4:
  if (*(unsigned char *)(a3 + 24)) {
    (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(a3 + 32) + 32) + 40))(*(void *)(*(void *)(a3 + 32) + 32), &unk_270989328, 24);
  }
  uint64_t v7 = sub_25C1360BC((void *)a3, 0x18uLL, (uint64_t)sub_25C136878);
  v3 = v7;
  if (*(char *)(explicit + 23) < 0)
  {
    sub_25C1367DC(v7, *(void **)explicit, *(void *)(explicit + 8));
  }
  else
  {
    long long v8 = *(_OWORD *)explicit;
    v7[2] = *(void *)(explicit + 16);
    *(_OWORD *)uint64_t v7 = v8;
  }
  *a1 = v3;
  return v3;
}

void sub_25C136BA4(_Unwind_Exception *a1)
{
  MEMORY[0x26117F4A0](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

std::string *sub_25C136BC8(std::string *this, void *a2)
{
  if (this)
  {
    v2 = this;
    unint64_t explicit = (const std::string *)atomic_load_explicit(a2 + 3, memory_order_acquire);
    if (!explicit) {
      unint64_t explicit = (const std::string *)sub_25C13645C(a2);
    }
    return std::string::operator=(v2, explicit);
  }
  return this;
}

BOOL sub_25C136C24(int a1, void *__s1, size_t a3, void *__s2, uint64_t a5)
{
  return a3 == a5 && memcmp(__s1, __s2, a3) == 0;
}

BOOL sub_25C136C60(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  if (!v1) {
    return 0;
  }
  v2 = *(unsigned char **)(v1 + 72);
  if (!v2) {
    v2 = &unk_26A5963E8;
  }
  return v2[240] != 0;
}

BOOL sub_25C136C94(uint64_t a1, int a2)
{
  return *(_DWORD *)(*(void *)(*(void *)(*(void *)(a1 + 8) + 64) + 8 * a2 + 8) + 60) == 6;
}

BOOL sub_25C136CB4(uint64_t a1, int a2)
{
  return *(_DWORD *)(*(void *)(*(void *)(*(void *)(a1 + 8) + 64) + 8 * a2 + 8) + 60) == 4;
}

BOOL sub_25C136CD4(uint64_t a1, int a2)
{
  return *(_DWORD *)(*(void *)(*(void *)(*(void *)(a1 + 8) + 64) + 8 * a2 + 8) + 60) == 5;
}

BOOL sub_25C136CF4(uint64_t a1, int a2)
{
  return *(_DWORD *)(*(void *)(*(void *)(*(void *)(a1 + 8) + 64) + 8 * a2 + 8) + 60) == 3;
}

BOOL sub_25C136D14(uint64_t a1, int a2)
{
  return *(_DWORD *)(*(void *)(*(void *)(*(void *)(a1 + 8) + 64) + 8 * a2 + 8) + 60) == 2;
}

float sub_25C136D34(uint64_t a1, int a2)
{
  return *(float *)(*(void *)(*(void *)(*(void *)(a1 + 8) + 64) + 8 * a2 + 8) + 56);
}

uint64_t sub_25C136D4C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  if (v1) {
    return *(unsigned int *)(v1 + 56);
  }
  else {
    return 0;
  }
}

unint64_t sub_25C136D64(uint64_t a1, int a2)
{
  return *(void *)(*(void *)(*(void *)(*(void *)(a1 + 8) + 64) + 8 * a2 + 8) + 48) & 0xFFFFFFFFFFFFFFFELL;
}

uint64_t sub_25C136D80()
{
  return 0;
}

uint64_t sub_25C136D88()
{
  return 0;
}

uint64_t sub_25C136D90()
{
  return 0;
}

uint64_t sub_25C136D98()
{
  return 1;
}

double sub_25C136DA0()
{
  char v7 = 0;
  v0 = sub_25C136E68(MEMORY[0x263F8C0F8], (uint64_t)"model_interface.h", 17);
  sub_25C136E68(v0, (uint64_t)"(", 1);
  uint64_t v1 = (void *)std::ostream::operator<<();
  v2 = sub_25C136E68(v1, (uint64_t)") ", 2);
  v3 = sub_25C136E68(v2, (uint64_t)"LOG(", 4);
  uint64_t v4 = sub_25C136E68(v3, (uint64_t)"ERROR", 5);
  long long v5 = sub_25C136E68(v4, (uint64_t)") ", 2);
  sub_25C136E68(v5, (uint64_t)"Not implemented.", 16);
  sub_25C137184(&v7);
  return 0.0;
}

void sub_25C136E54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12, char a13)
{
}

void *sub_25C136E68(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x26117F2C0](v23, a1);
  if (v23[0])
  {
    uint64_t v6 = (char *)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *((void *)v6 + 5);
    int v8 = *((_DWORD *)v6 + 2);
    int v9 = *((_DWORD *)v6 + 36);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      BOOL v10 = std::locale::use_facet(&__b, MEMORY[0x263F8C108]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&__b);
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
      if (v16 >= 0x7FFFFFFFFFFFFFF8) {
        sub_25C1365BC();
      }
      if (v16 >= 0x17)
      {
        uint64_t v18 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v16 | 7) != 0x17) {
          uint64_t v18 = v16 | 7;
        }
        uint64_t v19 = v18 + 1;
        p_b = (std::locale::__imp *)operator new(v18 + 1);
        size_t v25 = v16;
        int64_t v26 = v19 | 0x8000000000000000;
        __b.__locale_ = p_b;
      }
      else
      {
        HIBYTE(v26) = v16;
        p_b = (std::locale::__imp *)&__b;
      }
      memset(p_b, v9, v16);
      *((unsigned char *)p_b + v16) = 0;
      v20 = v26 >= 0 ? &__b : (std::locale *)__b.__locale_;
      uint64_t v21 = (*(uint64_t (**)(uint64_t, std::locale *, size_t))(*(void *)v7 + 96))(v7, v20, v16);
      if (SHIBYTE(v26) < 0) {
        operator delete(__b.__locale_);
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
  MEMORY[0x26117F2D0](v23);
  return a1;
}

void sub_25C137104(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  MEMORY[0x26117F2D0](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v17 + *(void *)(*v17 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x25C1370D8);
}

void sub_25C137170(_Unwind_Exception *a1)
{
}

unsigned char *sub_25C137184(unsigned char *a1)
{
  std::ios_base::getloc((const std::ios_base *)(MEMORY[0x263F8C0F8] + *(void *)(*MEMORY[0x263F8C0F8] - 24)));
  v2 = std::locale::use_facet(&v4, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v2->__vftable[2].~facet_0)(v2, 10);
  std::locale::~locale(&v4);
  std::ostream::put();
  std::ostream::flush();
  if (*a1) {
    sub_25C13D764();
  }
  return a1;
}

void sub_25C137248(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
}

void sub_25C137264(void *a1@<X8>)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  LOBYTE(__p) = 0;
  v2 = sub_25C136E68(MEMORY[0x263F8C0F8], (uint64_t)"model_interface.h", 17);
  sub_25C136E68(v2, (uint64_t)"(", 1);
  v3 = (void *)std::ostream::operator<<();
  std::locale v4 = sub_25C136E68(v3, (uint64_t)") ", 2);
  long long v5 = sub_25C136E68(v4, (uint64_t)"LOG(", 4);
  uint64_t v6 = sub_25C136E68(v5, (uint64_t)"ERROR", 5);
  uint64_t v7 = sub_25C136E68(v6, (uint64_t)") ", 2);
  sub_25C136E68(v7, (uint64_t)"Not implemented.", 16);
  sub_25C137184(&__p);
  __p = 0;
  BOOL v10 = 0;
  int v12 = 0;
  uint64_t v11 = 0;
  a1[1] = 0;
  a1[2] = 0;
  *a1 = 0;
  int v8 = (char *)operator new(0x20uLL);
  *a1 = v8;
  a1[1] = v8;
  a1[2] = v8 + 32;
  a1[1] = sub_25C1373F0((uint64_t)(a1 + 2), (uint64_t)&__p, (uint64_t)&v13, (uint64_t)v8);
  if (__p)
  {
    BOOL v10 = __p;
    operator delete(__p);
  }
}

void sub_25C1373AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **a10, uint64_t a11, void *__p, uint64_t a13)
{
  uint64_t v15 = v14;
  *(void *)(v13 + 8) = v15;
  sub_25C1374B8(&a10);
  if (__p)
  {
    a13 = (uint64_t)__p;
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_25C1373F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
      *(void *)uint64_t v4 = 0;
      *(void *)(v4 + 8) = 0;
      *(void *)(v4 + 16) = 0;
      sub_25C137548((void *)v4, *(long long **)v6, *(long long **)(v6 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v6 + 8) - *(void *)v6) >> 3));
      *(_DWORD *)(v4 + 24) = *(_DWORD *)(v6 + 24);
      uint64_t v4 = v11 + 32;
      v11 += 32;
      v6 += 32;
    }
    while (v6 != a3);
  }
  char v9 = 1;
  sub_25C1375F0((uint64_t)v8);
  return v4;
}

void sub_25C1374A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_25C1374B8(void ***a1)
{
  uint64_t v1 = *a1;
  v2 = (char *)**a1;
  if (v2)
  {
    uint64_t v4 = (char *)v1[1];
    long long v5 = **a1;
    if (v4 != v2)
    {
      uint64_t v6 = (char *)v1[1];
      do
      {
        int v8 = (void *)*((void *)v6 - 4);
        v6 -= 32;
        uint64_t v7 = v8;
        if (v8)
        {
          *((void *)v4 - 3) = v7;
          operator delete(v7);
        }
        uint64_t v4 = v6;
      }
      while (v6 != v2);
      long long v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void *sub_25C137548(void *result, long long *a2, long long *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v4 = result;
    if (a4 >= 0xAAAAAAAAAAAAAABLL) {
      sub_25C137658();
    }
    result = sub_25C137670(a4);
    *uint64_t v4 = result;
    v4[1] = result;
    v4[2] = &result[3 * v7];
    while (a2 != a3)
    {
      long long v8 = *a2;
      result[2] = *((void *)a2 + 2);
      *(_OWORD *)result = v8;
      result += 3;
      a2 = (long long *)((char *)a2 + 24);
    }
    v4[1] = result;
  }
  return result;
}

void sub_25C1375D4(_Unwind_Exception *exception_object)
{
  v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_25C1375F0(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24))
  {
    uint64_t v2 = **(void **)(a1 + 16);
    uint64_t v3 = **(void **)(a1 + 8);
    if (v2 != v3)
    {
      uint64_t v4 = **(void **)(a1 + 16);
      do
      {
        uint64_t v6 = *(void **)(v4 - 32);
        v4 -= 32;
        long long v5 = v6;
        if (v6)
        {
          *(void *)(v2 - 24) = v5;
          operator delete(v5);
        }
        uint64_t v2 = v4;
      }
      while (v4 != v3);
    }
  }
  return a1;
}

void sub_25C137658()
{
}

void *sub_25C137670(unint64_t a1)
{
  if (a1 >= 0xAAAAAAAAAAAAAABLL) {
    sub_25C1376B8();
  }
  return operator new(24 * a1);
}

void sub_25C1376B8()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void sub_25C1376EC(uint64_t a1@<X0>, unsigned char *a2@<X1>, unint64_t a3@<X2>, void *a4@<X8>, float a5@<S0>)
{
  uint64_t v8 = a1;
  uint64_t v84 = *MEMORY[0x263EF8340];
  (*(void (**)(void **__return_ptr))(*(void *)a1 + 16))(&v67);
  uint64_t v9 = (uint64_t)v67;
  if (v67)
  {
    v67 = 0;
    sub_25C13D850(v9);
LABEL_3:
    *a4 = 0;
    a4[1] = 0;
    a4[2] = 0;
    return;
  }
  if (!a3) {
    goto LABEL_3;
  }
  v77 = 0;
  v78 = 0;
  uint64_t v79 = 0;
  __p = 0;
  v75 = 0;
  v76 = 0;
  if (a3 >> 59) {
    sub_25C137658();
  }
  uint64_t v10 = (__n128 *)operator new(32 * a3);
  int v11 = 0;
  __p = v10;
  v75 = v10;
  v76 = &v10[2 * a3];
  memset(v72, 0, sizeof(v72));
  int v73 = 1065353216;
  long long v68 = 0u;
  long long v69 = 0u;
  uint64_t v70 = 0;
  uint64_t v71 = 256;
  v66[0] = v8;
  v66[1] = &v67;
  v66[2] = &__p;
  v66[3] = &v77;
  int v12 = (BOOL *)&v82.n128_i8[8];
  v66[4] = v72;
  v67 = &unk_270989E08;
  do
  {
    __n128 v83 = 0uLL;
    int v13 = sub_25C14A790(**(void **)(v8 + 16), a2, a3, v12);
    v83.n128_u64[0] = (unint64_t)a2;
    v83.n128_u64[1] = v13;
    a3 -= v13;
    if (a3) {
      int v14 = v11 + 1;
    }
    else {
      int v14 = -1;
    }
    v82.n128_u32[0] = v11 - 1;
    v82.n128_u32[1] = v14;
    if (v10 < v76)
    {
      __n128 v15 = v82;
      __n128 v16 = v83;
      __n128 *v10 = v82;
      v10[1] = v16;
      v10 += 2;
      goto LABEL_30;
    }
    v17 = v12;
    uint64_t v18 = v8;
    uint64_t v19 = (__n128 *)__p;
    uint64_t v20 = ((char *)v10 - (unsigned char *)__p) >> 5;
    unint64_t v21 = v20 + 1;
    if ((unint64_t)(v20 + 1) >> 59) {
      sub_25C137658();
    }
    uint64_t v22 = (char *)v76 - (unsigned char *)__p;
    if (((char *)v76 - (unsigned char *)__p) >> 4 > v21) {
      unint64_t v21 = v22 >> 4;
    }
    if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFE0) {
      unint64_t v23 = 0x7FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v23 = v21;
    }
    if (v23)
    {
      if (v23 >> 59) {
        sub_25C1376B8();
      }
      v24 = (char *)operator new(32 * v23);
    }
    else
    {
      v24 = 0;
    }
    size_t v25 = (__n128 *)&v24[32 * v20];
    __n128 v26 = v83;
    *size_t v25 = v82;
    v25[1] = v26;
    v27 = v25 + 2;
    if (v10 == v19)
    {
      __p = v25;
      v75 = v25 + 2;
      uint64_t v19 = v10;
      v76 = (__n128 *)&v24[32 * v23];
    }
    else
    {
      do
      {
        __n128 v15 = v10[-2];
        __n128 v28 = v10[-1];
        v25[-2] = v15;
        v25[-1] = v28;
        v25 -= 2;
        v10 -= 2;
      }
      while (v10 != v19);
      __p = v25;
      v75 = v27;
      v76 = (__n128 *)&v24[32 * v23];
      if (!v19) {
        goto LABEL_29;
      }
    }
    operator delete(v19);
LABEL_29:
    uint64_t v10 = v27;
    uint64_t v8 = v18;
    int v12 = v17;
LABEL_30:
    a2 += v13;
    ++v11;
    v75 = v10;
  }
  while (a3);
  if (__p == v10)
  {
    *a4 = 0;
    a4[1] = 0;
    a4[2] = 0;
  }
  else
  {
    if ((unint64_t)((char *)v10 - (unsigned char *)__p) >= 0x21)
    {
      unint64_t v29 = 1;
      do
      {
        __n128 v15 = sub_25C137E88((uint64_t)v66, (int)v29 - 1, v29, v15);
        ++v29;
      }
      while (v29 < ((char *)v75 - (unsigned char *)__p) >> 5);
    }
    v30 = (int **)v77;
    v31 = v78;
    if (v77 != v78)
    {
      uint64_t v32 = 0;
      do
      {
        v33 = *v30;
        if (v31 - (char *)v30 >= 9)
        {
          uint64_t v34 = 0;
          uint64_t v35 = (v31 - (char *)v30) >> 3;
          v36 = v30;
          do
          {
            v37 = v36;
            v36 += v34 + 1;
            uint64_t v38 = 2 * v34;
            uint64_t v34 = (2 * v34) | 1;
            uint64_t v39 = v38 + 2;
            if (v39 < v35)
            {
              v40 = v36[1];
              v15.n128_u32[0] = (*v36)[2];
              float v41 = *((float *)v40 + 2);
              if (v15.n128_f32[0] < v41 || v15.n128_f32[0] == v41 && **v36 > *v40)
              {
                ++v36;
                uint64_t v34 = v39;
              }
            }
            *v37 = *v36;
          }
          while (v34 <= (uint64_t)((unint64_t)(v35 - 2) >> 1));
          v42 = (int **)(v31 - 8);
          if (v36 == v42)
          {
            *v36 = v33;
          }
          else
          {
            *v36 = *v42;
            *v42 = v33;
            sub_25C1385E4((uint64_t)v30, (uint64_t)(v36 + 1), v36 + 1 - v30);
          }
        }
        v78 -= 8;
        int v43 = *v33;
        uint64_t v44 = *v33;
        v45 = __p;
        uint64_t v46 = *((void *)__p + 4 * v44 + 3);
        if (!v46) {
          goto LABEL_60;
        }
        uint64_t v47 = v33[1];
        uint64_t v48 = *((void *)__p + 4 * v47 + 3);
        if (!v48) {
          goto LABEL_60;
        }
        uint64_t v49 = v48 + v46;
        if (v49 != *((void *)v33 + 2)) {
          goto LABEL_60;
        }
        if (a5 > 0.0)
        {
          if (a5 >= 1.0) {
            goto LABEL_60;
          }
          if (!v32) {
            uint64_t v32 = sub_25C16CE20();
          }
          unsigned int v50 = sub_25C13867C(v32);
          v15.n128_f64[0] = ((double)v50 + (double)sub_25C13867C(v32) * 4294967300.0) * 5.42101086e-20
                          + 0.0;
          if (v15.n128_f64[0] < a5) {
            goto LABEL_60;
          }
          v45 = __p;
          int v43 = *v33;
          uint64_t v47 = v33[1];
          uint64_t v44 = *v33;
          uint64_t v49 = *((void *)__p + 4 * v47 + 3) + *((void *)__p + 4 * v44 + 3);
        }
        v51 = (char *)&v45[8 * v44];
        v52 = (char *)&v45[8 * v47];
        *((void *)v51 + 3) = v49;
        *((_DWORD *)v51 + 1) = *((_DWORD *)v52 + 1);
        uint64_t v53 = *((unsigned int *)v52 + 1);
        if ((v53 & 0x80000000) == 0) {
          v45[8 * v53] = v43;
        }
        *((void *)v52 + 2) = "";
        *((void *)v52 + 3) = 0;
        __n128 v54 = sub_25C137E88((uint64_t)v66, *((_DWORD *)__p + 8 * v44), v43, v15);
        __n128 v15 = sub_25C137E88((uint64_t)v66, *v33, *((_DWORD *)__p + 8 * *v33 + 1), v54);
LABEL_60:
        v30 = (int **)v77;
        v31 = v78;
      }
      while (v77 != v78);
    }
    v81 = 0;
    v55 = operator new(0x20uLL);
    void *v55 = &unk_27098A090;
    v55[1] = v8;
    v55[2] = v80;
    v55[3] = v72;
    v83.n128_u64[1] = 0;
    v81 = v55;
    sub_25C13871C(&v82);
    int v56 = 0;
    v57 = (void *)MEMORY[0x263F8C0F8];
    *a4 = 0;
    a4[1] = 0;
    a4[2] = 0;
    do
    {
      if (v56 < 0)
      {
        v82.n128_u8[0] = 1;
        sub_25C136E68(v57, (uint64_t)"bpe_model.cc", 12);
        sub_25C136E68(v57, (uint64_t)"(", 1);
        v58 = (void *)std::ostream::operator<<();
        v59 = sub_25C136E68(v58, (uint64_t)") [", 3);
        v60 = sub_25C136E68(v59, (uint64_t)"(index) >= (0)", 14);
        sub_25C136E68(v60, (uint64_t)"] ", 2);
        sub_25C137184(&v82);
      }
      v61 = __p;
      if (v56 >= (int)((unint64_t)((char *)v75 - (unsigned char *)__p) >> 5))
      {
        v82.n128_u8[0] = 1;
        sub_25C136E68(v57, (uint64_t)"bpe_model.cc", 12);
        sub_25C136E68(v57, (uint64_t)"(", 1);
        v62 = (void *)std::ostream::operator<<();
        v63 = sub_25C136E68(v62, (uint64_t)") [", 3);
        v64 = sub_25C136E68(v63, (uint64_t)"(index) < (static_cast<int>(symbols.size()))", 44);
        sub_25C136E68(v64, (uint64_t)"] ", 2);
        sub_25C137184(&v82);
        v61 = __p;
      }
      sub_25C1387A0((uint64_t)v81, v61[4 * v56 + 2], v61[4 * v56 + 3], (uint64_t)a4);
      int v56 = *((_DWORD *)__p + 8 * v56 + 1);
    }
    while (v56 != -1);
    sub_25C13871C(v80);
  }
  sub_25C1387F8(&v67);
  sub_25C138888((uint64_t)v72);
  if (__p)
  {
    v75 = (__n128 *)__p;
    operator delete(__p);
  }
  if (v77)
  {
    v78 = (char *)v77;
    operator delete(v77);
  }
}

void sub_25C137DD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30,uint64_t a31,void *a32,uint64_t a33)
{
  sub_25C13871C((void *)(v33 - 200));
  sub_25C1387F8(&a16);
  sub_25C138888((uint64_t)&a23);
  if (__p)
  {
    a30 = (uint64_t)__p;
    operator delete(__p);
  }
  if (a32)
  {
    a33 = (uint64_t)a32;
    operator delete(a32);
  }
  _Unwind_Resume(a1);
}

__n128 sub_25C137E88(uint64_t a1, int a2, int a3, __n128 result)
{
  if (a2 == -1) {
    return result;
  }
  if (a3 == -1) {
    return result;
  }
  uint64_t v7 = a2;
  uint64_t v8 = **(void **)(a1 + 16);
  if (*(unsigned char *)(v8 + 32 * a2 + 8)) {
    return result;
  }
  unint64_t v9 = a3;
  uint64_t v10 = v8 + 32 * a3;
  if (*(unsigned char *)(v10 + 8)) {
    return result;
  }
  int v11 = *(void **)a1;
  uint64_t v12 = v8 + 32 * a2;
  int v13 = *(uint64_t **)(v12 + 16);
  unint64_t v14 = *(void *)(v10 + 24) + *(void *)(v12 + 24);
  __n128 v15 = sub_25C1391F4((void *)(*(void *)a1 + 24), v13, v14);
  if (!v15) {
    return result;
  }
  __n128 v16 = *(void **)(a1 + 8);
  uint64_t v17 = v16[5];
  unint64_t v18 = v16[6];
  unint64_t v19 = v16[4];
  if (v19 >= v18)
  {
    unint64_t v19 = 0;
    ++v17;
    v16[4] = 0;
    v16[5] = v17;
  }
  long long v68 = v15;
  unint64_t v69 = v14;
  uint64_t v20 = v16[1];
  v67 = v13;
  if (v17 == (v16[2] - v20) >> 3)
  {
    is_mul_ok(v18, 0x18uLL);
    operator new[]();
  }
  uint64_t v21 = *(void *)(v20 + 8 * v17) + 24 * v19;
  v16[4] = v19 + 1;
  *(_DWORD *)uint64_t v21 = a2;
  *(_DWORD *)(v21 + 4) = a3;
  *(float *)(v21 + 8) = (*(float (**)(void *, void))(*v11 + 136))(v11, *((unsigned int *)v15 + 8));
  *(void *)(v21 + 16) = v14;
  uint64_t v22 = *(uint64_t **)(a1 + 24);
  v24 = (void *)v22[1];
  unint64_t v23 = v22[2];
  if ((unint64_t)v24 >= v23)
  {
    uint64_t v27 = *v22;
    uint64_t v28 = ((uint64_t)v24 - *v22) >> 3;
    unint64_t v29 = v28 + 1;
    if ((unint64_t)(v28 + 1) >> 61) {
      sub_25C137658();
    }
    uint64_t v30 = v23 - v27;
    if (v30 >> 2 > v29) {
      unint64_t v29 = v30 >> 2;
    }
    unint64_t v31 = (unint64_t)v30 >= 0x7FFFFFFFFFFFFFF8 ? 0x1FFFFFFFFFFFFFFFLL : v29;
    if (v31)
    {
      if (v31 >> 61) {
        sub_25C1376B8();
      }
      uint64_t v32 = (char *)operator new(8 * v31);
    }
    else
    {
      uint64_t v32 = 0;
    }
    uint64_t v33 = (uint64_t *)&v32[8 * v28];
    uint64_t v34 = &v32[8 * v31];
    uint64_t *v33 = v21;
    uint64_t v25 = (uint64_t)(v33 + 1);
    if (v24 == (void *)v27)
    {
      int v13 = v67;
      unint64_t v26 = v69;
    }
    else
    {
      int v13 = v67;
      unint64_t v26 = v69;
      do
      {
        uint64_t v35 = *--v24;
        *--uint64_t v33 = v35;
      }
      while (v24 != (void *)v27);
      v24 = (void *)*v22;
    }
    *uint64_t v22 = (uint64_t)v33;
    v22[1] = v25;
    v22[2] = (uint64_t)v34;
    if (v24) {
      operator delete(v24);
    }
  }
  else
  {
    void *v24 = v21;
    uint64_t v25 = (uint64_t)(v24 + 1);
    unint64_t v26 = v14;
  }
  v22[1] = v25;
  sub_25C1385E4(*v22, v25, (v25 - *v22) >> 3);
  if (*(_DWORD *)(*(void *)(*(void *)(v11[1] + 64) + 8 * *((int *)v68 + 8) + 8) + 60) != 5) {
    return result;
  }
  uint64_t v36 = **(void **)(a1 + 16);
  __n128 v70 = *(__n128 *)(v36 + 32 * v7 + 16);
  long long v71 = *(_OWORD *)(v36 + 32 * v9 + 16);
  v37 = *(float **)(a1 + 32);
  unint64_t v38 = sub_25C138D1C(v13, v26);
  unint64_t v39 = v38;
  unint64_t v40 = *((void *)v37 + 1);
  if (v40)
  {
    uint8x8_t v41 = (uint8x8_t)vcnt_s8((int8x8_t)v40);
    v41.i16[0] = vaddlv_u8(v41);
    unint64_t v42 = v41.u32[0];
    if (v41.u32[0] > 1uLL)
    {
      unint64_t v9 = v38;
      if (v38 >= v40) {
        unint64_t v9 = v38 % v40;
      }
    }
    else
    {
      unint64_t v9 = (v40 - 1) & v38;
    }
    int v43 = *(void ***)(*(void *)v37 + 8 * v9);
    if (v43)
    {
      for (i = *v43; i; i = *(void **)i)
      {
        unint64_t v45 = *((void *)i + 1);
        if (v45 == v39)
        {
          if (*((void *)i + 3) == v26 && !memcmp(*((const void **)i + 2), v13, v26)) {
            goto LABEL_105;
          }
        }
        else
        {
          if (v42 > 1)
          {
            if (v45 >= v40) {
              v45 %= v40;
            }
          }
          else
          {
            v45 &= v40 - 1;
          }
          if (v45 != v9) {
            break;
          }
        }
      }
    }
  }
  i = operator new(0x40uLL);
  *(void *)i = 0;
  *((void *)i + 1) = v39;
  *((void *)i + 2) = v13;
  *((void *)i + 3) = v26;
  *((_OWORD *)i + 2) = 0u;
  *((_OWORD *)i + 3) = 0u;
  float v46 = (float)(unint64_t)(*((void *)v37 + 3) + 1);
  float v47 = v37[8];
  if (!v40 || (float)(v47 * (float)v40) < v46)
  {
    BOOL v48 = 1;
    if (v40 >= 3) {
      BOOL v48 = (v40 & (v40 - 1)) != 0;
    }
    unint64_t v49 = v48 | (2 * v40);
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
    }
    unint64_t v40 = *((void *)v37 + 1);
    if (*(void *)&prime > v40) {
      goto LABEL_61;
    }
    if (*(void *)&prime < v40)
    {
      unint64_t v58 = vcvtps_u32_f32((float)*((unint64_t *)v37 + 3) / v37[8]);
      if (v40 < 3 || (uint8x8_t v59 = (uint8x8_t)vcnt_s8((int8x8_t)v40), v59.i16[0] = vaddlv_u8(v59), v59.u32[0] > 1uLL))
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
      if (*(void *)&prime >= v40)
      {
        unint64_t v40 = *((void *)v37 + 1);
      }
      else
      {
        if (prime)
        {
LABEL_61:
          if (*(void *)&prime >> 61) {
            sub_25C1376B8();
          }
          v52 = operator new(8 * *(void *)&prime);
          uint64_t v53 = *(void **)v37;
          *(void *)v37 = v52;
          if (v53) {
            operator delete(v53);
          }
          uint64_t v54 = 0;
          *((int8x8_t *)v37 + 1) = prime;
          do
            *(void *)(*(void *)v37 + 8 * v54++) = 0;
          while (*(void *)&prime != v54);
          v55 = (void *)*((void *)v37 + 2);
          if (v55)
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
            *(void *)(*(void *)v37 + 8 * v56) = v37 + 4;
            v61 = (void *)*v55;
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
                  if (!*(void *)(*(void *)v37 + 8 * v62))
                  {
                    *(void *)(*(void *)v37 + 8 * v62) = v55;
                    goto LABEL_86;
                  }
                  void *v55 = *v61;
                  void *v61 = **(void **)(*(void *)v37 + 8 * v62);
                  **(void **)(*(void *)v37 + 8 * v62) = v61;
                  v61 = v55;
                }
                unint64_t v62 = v56;
LABEL_86:
                v55 = v61;
                v61 = (void *)*v61;
                unint64_t v56 = v62;
              }
              while (v61);
            }
          }
          unint64_t v40 = (unint64_t)prime;
          goto LABEL_90;
        }
        v66 = *(void **)v37;
        *(void *)v37 = 0;
        if (v66) {
          operator delete(v66);
        }
        unint64_t v40 = 0;
        *((void *)v37 + 1) = 0;
      }
    }
LABEL_90:
    if ((v40 & (v40 - 1)) != 0)
    {
      if (v39 >= v40) {
        unint64_t v9 = v39 % v40;
      }
      else {
        unint64_t v9 = v39;
      }
    }
    else
    {
      unint64_t v9 = (v40 - 1) & v39;
    }
  }
  v63 = *(void **)v37;
  v64 = *(void **)(*(void *)v37 + 8 * v9);
  if (v64)
  {
    *(void *)i = *v64;
  }
  else
  {
    *(void *)i = *((void *)v37 + 2);
    *((void *)v37 + 2) = i;
    v63[v9] = v37 + 4;
    if (!*(void *)i) {
      goto LABEL_104;
    }
    unint64_t v65 = *(void *)(*(void *)i + 8);
    if ((v40 & (v40 - 1)) != 0)
    {
      if (v65 >= v40) {
        v65 %= v40;
      }
    }
    else
    {
      v65 &= v40 - 1;
    }
    v64 = (void *)(*(void *)v37 + 8 * v65);
  }
  void *v64 = i;
LABEL_104:
  ++*((void *)v37 + 3);
LABEL_105:
  result = v70;
  *((__n128 *)i + 2) = v70;
  *((_OWORD *)i + 3) = v71;
  return result;
}

void sub_25C1385D0(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_25C1385E4(uint64_t result, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = a3 - 2;
  if (a3 >= 2)
  {
    unint64_t v4 = v3 >> 1;
    uint64_t v5 = result + 8 * (v3 >> 1);
    uint64_t v6 = *(_DWORD **)v5;
    uint64_t v7 = *(void *)(a2 - 8);
    float v8 = *(float *)(*(void *)v5 + 8);
    float v9 = *(float *)(v7 + 8);
    if (v8 < v9 || v8 == v9 && *v6 > *(_DWORD *)v7)
    {
      *(void *)(a2 - 8) = v6;
      if (v3 >= 2)
      {
        while (1)
        {
          unint64_t v11 = v4 - 1;
          unint64_t v4 = (v4 - 1) >> 1;
          uint64_t v10 = result + 8 * v4;
          uint64_t v12 = *(_DWORD **)v10;
          float v13 = *(float *)(*(void *)v10 + 8);
          if (v13 >= v9 && (v13 != v9 || *v12 <= *(_DWORD *)v7)) {
            break;
          }
          *(void *)uint64_t v5 = v12;
          uint64_t v5 = result + 8 * v4;
          if (v11 <= 1) {
            goto LABEL_11;
          }
        }
      }
      uint64_t v10 = v5;
LABEL_11:
      *(void *)uint64_t v10 = v7;
    }
  }
  return result;
}

uint64_t sub_25C13867C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 2496);
  unint64_t v2 = (v1 + 1) % 0x270uLL;
  unsigned int v3 = *(_DWORD *)(a1 + 4 * ((v1 + 397) % 0x270uLL)) ^ ((*(_DWORD *)(a1 + 4 * v2) & 0x7FFFFFFE | *(_DWORD *)(a1 + 4 * v1) & 0x80000000) >> 1) ^ ((int)(*(_DWORD *)(a1 + 4 * v2) << 31) >> 31) & 0x9908B0DF;
  *(_DWORD *)(a1 + 4 * v1) = v3;
  *(void *)(a1 + 2496) = v2;
  LODWORD(v1) = ((v3 ^ (v3 >> 11)) << 7) & 0x9D2C5680 ^ v3 ^ (v3 >> 11);
  return (v1 << 15) & 0xEFC60000 ^ v1 ^ (((v1 << 15) & 0xEFC60000 ^ v1) >> 18);
}

void *sub_25C13871C(void *a1)
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

uint64_t sub_25C1387A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v6[0] = a2;
  v6[1] = a3;
  uint64_t v5 = a4;
  if (!a1) {
    sub_25C1388D4();
  }
  return (*(uint64_t (**)(uint64_t, void *, uint64_t *))(*(void *)a1 + 48))(a1, v6, &v5);
}

void *sub_25C1387F8(void *a1)
{
  *a1 = &unk_270989E08;
  unint64_t v2 = (void *)a1[1];
  unsigned int v3 = (void *)a1[2];
  if (v2 != v3)
  {
    do
    {
      if (*v2) {
        MEMORY[0x26117F470](*v2, 0x1000C801E56706BLL);
      }
      ++v2;
    }
    while (v2 != v3);
    unint64_t v2 = (void *)a1[1];
  }
  if (v2)
  {
    a1[2] = v2;
    operator delete(v2);
  }
  return a1;
}

uint64_t sub_25C138888(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      unsigned int v3 = (void *)*v2;
      operator delete(v2);
      unint64_t v2 = v3;
    }
    while (v3);
  }
  unint64_t v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

void sub_25C1388D4()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = &unk_27098A0E8;
  __cxa_throw(exception, (struct type_info *)&unk_270989338, (void (*)(void *))std::exception::~exception);
}

void sub_25C138924(std::exception *a1)
{
  std::exception::~exception(a1);

  JUMPOUT(0x26117F4A0);
}

void *sub_25C13895C()
{
  return &unk_2709893A8;
}

uint64_t sub_25C138968(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZNK13sentencepiece3bpe5Model12SampleEncodeENSt3__117basic_string_viewIcNS2_11char_traitsIcEEEEfE3$_2"
    || ((v3 & (unint64_t)"ZNK13sentencepiece3bpe5Model12SampleEncodeENSt3__117basic_string_viewIcNS2_11char_traitsIcEEEEfE3$_2" & 0x8000000000000000) != 0) != __OFSUB__(v3, "ZNK13sentencepiece3bpe5Model12SampleEncodeENSt3__117basic_string_viewIcNS2_11char_traitsIcEEEEfE3$_2")&& !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZNK13sentencepiece3bpe5Model12SampleEncodeENSt3__117basic_string_viewIcNS2_11char_traitsIcEEEEfE3$_2" & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void sub_25C1389C0(void *a1, uint64_t **a2, void ***a3)
{
  uint64_t v5 = *a2;
  unint64_t v4 = (unint64_t)a2[1];
  uint64_t v6 = *a3;
  uint64_t v7 = (void *)a1[1];
  int v8 = (*(uint64_t (**)(void *, uint64_t *, unint64_t))(*v7 + 112))(v7, *a2, v4);
  int v9 = v8;
  if (v8 == -1 || *(_DWORD *)(*(void *)(*(void *)(v7[1] + 64) + 8 * v8 + 8) + 60) != 5)
  {
    unint64_t v18 = (char *)v6[1];
    uint64_t v17 = (char *)v6[2];
    if (v18 < v17)
    {
LABEL_31:
      *(void *)unint64_t v18 = v5;
      *((void *)v18 + 1) = v4;
      uint64_t v27 = v18 + 24;
      *((_DWORD *)v18 + 4) = v9;
LABEL_43:
      v6[1] = v27;
      return;
    }
    unint64_t v19 = 0xAAAAAAAAAAAAAAABLL * ((v18 - (unsigned char *)*v6) >> 3);
    unint64_t v20 = v19 + 1;
    if (v19 + 1 <= 0xAAAAAAAAAAAAAAALL)
    {
      unint64_t v21 = 0xAAAAAAAAAAAAAAABLL * ((v17 - (unsigned char *)*v6) >> 3);
      if (2 * v21 > v20) {
        unint64_t v20 = 2 * v21;
      }
      if (v21 >= 0x555555555555555) {
        unint64_t v22 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v22 = v20;
      }
      unint64_t v23 = (char *)sub_25C137670(v22);
      v24 = &v23[24 * v19];
      unint64_t v26 = &v23[24 * v25];
      *(void *)v24 = v5;
      *((void *)v24 + 1) = v4;
      *((_DWORD *)v24 + 4) = v9;
      uint64_t v27 = v24 + 24;
      unint64_t v29 = (char *)*v6;
      uint64_t v28 = (char *)v6[1];
      if (v28 == *v6) {
        goto LABEL_41;
      }
      do
      {
        long long v30 = *(_OWORD *)(v28 - 24);
        *((void *)v24 - 1) = *((void *)v28 - 1);
        *(_OWORD *)(v24 - 24) = v30;
        v24 -= 24;
        v28 -= 24;
      }
      while (v28 != v29);
      goto LABEL_40;
    }
LABEL_47:
    sub_25C137658();
  }
  uint64_t v10 = (void *)a1[3];
  unint64_t v11 = sub_25C138D1C(v5, v4);
  int8x8_t v12 = (int8x8_t)v10[1];
  if (!*(void *)&v12) {
    goto LABEL_30;
  }
  unint64_t v13 = v11;
  uint8x8_t v14 = (uint8x8_t)vcnt_s8(v12);
  v14.i16[0] = vaddlv_u8(v14);
  unint64_t v15 = v14.u32[0];
  if (v14.u32[0] > 1uLL)
  {
    unint64_t v16 = v11;
    if (v11 >= *(void *)&v12) {
      unint64_t v16 = v11 % *(void *)&v12;
    }
  }
  else
  {
    unint64_t v16 = (*(void *)&v12 - 1) & v11;
  }
  unint64_t v31 = *(uint64_t ****)(*v10 + 8 * v16);
  if (!v31 || (uint64_t v32 = *v31) == 0)
  {
LABEL_30:
    unint64_t v18 = (char *)v6[1];
    uint64_t v34 = (char *)v6[2];
    if (v18 < v34) {
      goto LABEL_31;
    }
    unint64_t v35 = 0xAAAAAAAAAAAAAAABLL * ((v18 - (unsigned char *)*v6) >> 3);
    unint64_t v36 = v35 + 1;
    if (v35 + 1 <= 0xAAAAAAAAAAAAAAALL)
    {
      unint64_t v37 = 0xAAAAAAAAAAAAAAABLL * ((v34 - (unsigned char *)*v6) >> 3);
      if (2 * v37 > v36) {
        unint64_t v36 = 2 * v37;
      }
      if (v37 >= 0x555555555555555) {
        unint64_t v38 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v38 = v36;
      }
      unint64_t v39 = (char *)sub_25C137670(v38);
      v24 = &v39[24 * v35];
      unint64_t v26 = &v39[24 * v40];
      *(void *)v24 = v5;
      *((void *)v24 + 1) = v4;
      *((_DWORD *)v24 + 4) = v9;
      uint64_t v27 = v24 + 24;
      uint8x8_t v41 = (char *)*v6;
      uint64_t v28 = (char *)v6[1];
      if (v28 == *v6) {
        goto LABEL_41;
      }
      do
      {
        long long v42 = *(_OWORD *)(v28 - 24);
        *((void *)v24 - 1) = *((void *)v28 - 1);
        *(_OWORD *)(v24 - 24) = v42;
        v24 -= 24;
        v28 -= 24;
      }
      while (v28 != v41);
LABEL_40:
      uint64_t v28 = (char *)*v6;
LABEL_41:
      *uint64_t v6 = v24;
      v6[1] = v27;
      void v6[2] = v26;
      if (v28) {
        operator delete(v28);
      }
      goto LABEL_43;
    }
    goto LABEL_47;
  }
  while (1)
  {
    unint64_t v33 = (unint64_t)v32[1];
    if (v33 == v13) {
      break;
    }
    if (v15 > 1)
    {
      if (v33 >= *(void *)&v12) {
        v33 %= *(void *)&v12;
      }
    }
    else
    {
      v33 &= *(void *)&v12 - 1;
    }
    if (v33 != v16) {
      goto LABEL_30;
    }
LABEL_29:
    uint64_t v32 = (uint64_t **)*v32;
    if (!v32) {
      goto LABEL_30;
    }
  }
  if (v32[3] != (uint64_t *)v4 || memcmp(v32[2], v5, v4)) {
    goto LABEL_29;
  }
  sub_25C1387A0(*(void *)(a1[2] + 24), (uint64_t)v32[4], (uint64_t)v32[5], (uint64_t)v6);
  uint64_t v43 = (uint64_t)v32[6];
  uint64_t v44 = (uint64_t)v32[7];
  uint64_t v45 = *(void *)(a1[2] + 24);

  sub_25C1387A0(v45, v43, v44, (uint64_t)v6);
}

unint64_t sub_25C138D1C(uint64_t *a1, unint64_t a2)
{
  if (a2 > 0x20)
  {
    if (a2 <= 0x40)
    {
      uint64_t v5 = *(uint64_t *)((char *)a1 + a2 - 16);
      uint64_t v6 = *a1 - 0x3C5A37A36834CED9 * (v5 + a2);
      uint64_t v8 = a1[2];
      uint64_t v7 = a1[3];
      uint64_t v9 = __ROR8__(v6 + v7, 52);
      uint64_t v10 = v6 + a1[1];
      uint64_t v11 = __ROR8__(v10, 7);
      uint64_t v12 = v10 + v8;
      uint64_t v13 = *(uint64_t *)((char *)a1 + a2 - 32) + v8;
      uint64_t v14 = *(uint64_t *)((char *)a1 + a2 - 8) + v7;
      uint64_t v15 = __ROR8__(v14 + v13, 52);
      uint64_t v16 = v11 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v5 + a2), 37) + v9;
      uint64_t v17 = __ROR8__(v13, 37);
      uint64_t v18 = *(uint64_t *)((char *)a1 + a2 - 24) + v13;
      uint64_t v19 = __ROR8__(v18, 7);
      uint64_t v20 = v16 + __ROR8__(v12, 31);
      uint64_t v21 = v18 + v5;
      uint64_t v22 = v21 + v14;
      unint64_t v23 = 0x9AE16A3B2F90404FLL;
      unint64_t v24 = 0xC3A5C85C97CB3127 * (v22 + v20) - 0x651E95C4D06FBFB1 * (v12 + v7 + v17 + v19 + v15 + __ROR8__(v21, 31));
      unint64_t v25 = v20 - 0x3C5A37A36834CED9 * (v24 ^ (v24 >> 47));
      return (v25 ^ (v25 >> 47)) * v23;
    }
    unint64_t v4 = 0x9DDFEA08EB382D69;
    uint64_t v32 = *(uint64_t *)((char *)a1 + a2 - 48);
    uint64_t v33 = *(uint64_t *)((char *)a1 + a2 - 40);
    uint64_t v34 = *(uint64_t *)((char *)a1 + a2 - 24);
    uint64_t v36 = *(uint64_t *)((char *)a1 + a2 - 64);
    uint64_t v35 = *(uint64_t *)((char *)a1 + a2 - 56);
    uint64_t v37 = *(uint64_t *)((char *)a1 + a2 - 16);
    uint64_t v38 = *(uint64_t *)((char *)a1 + a2 - 8);
    unint64_t v39 = v35 + v37;
    unint64_t v40 = 0x9DDFEA08EB382D69
        * (v34 ^ ((0x9DDFEA08EB382D69 * (v34 ^ (v32 + a2))) >> 47) ^ (0x9DDFEA08EB382D69 * (v34 ^ (v32 + a2))));
    unint64_t v41 = 0x9DDFEA08EB382D69 * (v40 ^ (v40 >> 47));
    unint64_t v42 = v36 + a2 + v35 + v32;
    uint64_t v43 = v42 + v33;
    unint64_t v44 = __ROR8__(v42, 44) + v36 + a2 + __ROR8__(v33 + v36 + a2 - 0x622015F714C7D297 * (v40 ^ (v40 >> 47)), 21);
    uint64_t v45 = v35 + v37 + *(uint64_t *)((char *)a1 + a2 - 32) - 0x4B6D499041670D8DLL;
    uint64_t v46 = v45 + v34 + v37;
    uint64_t v47 = __ROR8__(v46, 44);
    uint64_t v48 = v46 + v38;
    uint64_t v49 = v47 + v45 + __ROR8__(v45 + v33 + v38, 21);
    uint64_t v51 = *a1;
    unint64_t v50 = a1 + 4;
    unint64_t v52 = v51 - 0x4B6D499041670D8DLL * v33;
    uint64_t v53 = -(uint64_t)((a2 - 1) & 0xFFFFFFFFFFFFFFC0);
    do
    {
      uint64_t v54 = *(v50 - 3);
      uint64_t v55 = v52 + v43 + v39 + v54;
      uint64_t v56 = v50[2];
      uint64_t v57 = v50[3];
      uint64_t v58 = v50[1];
      unint64_t v39 = v58 + v43 - 0x4B6D499041670D8DLL * __ROR8__(v39 + v44 + v56, 42);
      uint64_t v59 = v41 + v48;
      uint64_t v60 = *(v50 - 2);
      uint64_t v61 = *(v50 - 1);
      uint64_t v62 = *(v50 - 4) - 0x4B6D499041670D8DLL * v44;
      uint64_t v63 = v62 + v48 + v61;
      uint64_t v64 = v62 + v54 + v60;
      uint64_t v43 = v64 + v61;
      uint64_t v65 = __ROR8__(v64, 44) + v62;
      unint64_t v66 = (0xB492B66FBE98F273 * __ROR8__(v55, 37)) ^ v49;
      unint64_t v52 = 0xB492B66FBE98F273 * __ROR8__(v59, 33);
      unint64_t v44 = v65 + __ROR8__(v63 + v66, 21);
      unint64_t v67 = v52 + v49 + *v50;
      uint64_t v48 = v67 + v58 + v56 + v57;
      uint64_t v49 = __ROR8__(v67 + v58 + v56, 44) + v67 + __ROR8__(v39 + v60 + v67 + v57, 21);
      v50 += 8;
      unint64_t v41 = v66;
      v53 += 64;
    }
    while (v53);
    unint64_t v68 = v52
        - 0x622015F714C7D297
        * ((0x9DDFEA08EB382D69
          * (v49 ^ ((0x9DDFEA08EB382D69 * (v49 ^ v44)) >> 47) ^ (0x9DDFEA08EB382D69 * (v49 ^ v44)))) ^ ((0x9DDFEA08EB382D69 * (v49 ^ ((0x9DDFEA08EB382D69 * (v49 ^ v44)) >> 47) ^ (0x9DDFEA08EB382D69 * (v49 ^ v44)))) >> 47));
    unint64_t v69 = 0x9DDFEA08EB382D69
        * (v68 ^ (v66
                - 0x4B6D499041670D8DLL * (v39 ^ (v39 >> 47))
                - 0x622015F714C7D297
                * ((0x9DDFEA08EB382D69
                  * (v48 ^ ((0x9DDFEA08EB382D69 * (v48 ^ v43)) >> 47) ^ (0x9DDFEA08EB382D69 * (v48 ^ v43)))) ^ ((0x9DDFEA08EB382D69 * (v48 ^ ((0x9DDFEA08EB382D69 * (v48 ^ v43)) >> 47) ^ (0x9DDFEA08EB382D69 * (v48 ^ v43)))) >> 47))));
    unint64_t v70 = 0x9DDFEA08EB382D69 * (v68 ^ (v69 >> 47) ^ v69);
    goto LABEL_13;
  }
  if (a2 > 0x10)
  {
    uint64_t v26 = a1[1];
    unint64_t v27 = 0xB492B66FBE98F273 * *a1;
    uint64_t v28 = __ROR8__(0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a1 + a2 - 8), 30) + __ROR8__(v27 - v26, 43);
    unint64_t v29 = v27 + a2 + __ROR8__(v26 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a1 + a2 - 8);
    unint64_t v23 = 0x9DDFEA08EB382D69;
    unint64_t v30 = 0x9DDFEA08EB382D69 * (v29 ^ (v28 - 0x3C5A37A36834CED9 * *(uint64_t *)((char *)a1 + a2 - 16)));
    unint64_t v31 = v29 ^ (v30 >> 47) ^ v30;
LABEL_8:
    unint64_t v25 = 0x9DDFEA08EB382D69 * v31;
    return (v25 ^ (v25 >> 47)) * v23;
  }
  if (a2 < 9)
  {
    if (a2 >= 4)
    {
      uint64_t v72 = *(unsigned int *)((char *)a1 + a2 - 4);
      unint64_t v23 = 0x9DDFEA08EB382D69;
      unint64_t v73 = 0x9DDFEA08EB382D69 * (((8 * *(_DWORD *)a1) + a2) ^ v72);
      unint64_t v31 = v72 ^ (v73 >> 47) ^ v73;
      goto LABEL_8;
    }
    unint64_t v4 = 0x9AE16A3B2F90404FLL;
    if (!a2) {
      return v4;
    }
    unint64_t v70 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                   * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
LABEL_13:
    v4 *= v70 ^ (v70 >> 47);
    return v4;
  }
  uint64_t v2 = *(uint64_t *)((char *)a1 + a2 - 8);
  uint64_t v3 = __ROR8__(v2 + a2, a2);
  return (0x9DDFEA08EB382D69
        * ((0x9DDFEA08EB382D69
          * (v3 ^ ((0x9DDFEA08EB382D69 * (v3 ^ *a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v3 ^ *a1)))) ^ ((0x9DDFEA08EB382D69 * (v3 ^ ((0x9DDFEA08EB382D69 * (v3 ^ *a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v3 ^ *a1)))) >> 47))) ^ v2;
}

__n128 sub_25C139158(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_27098A090;
  __n128 result = *(__n128 *)(a1 + 8);
  *(void *)(a2 + 24) = *(void *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

__n128 sub_25C139188(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x20uLL);
  *(void *)uint64_t v2 = &unk_27098A090;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  *((void *)v2 + 3) = *(void *)(a1 + 24);
  return result;
}

void sub_25C1391DC()
{
}

uint64_t **sub_25C1391F4(void *a1, uint64_t *a2, unint64_t a3)
{
  unint64_t v6 = sub_25C138D1C(a2, a3);
  int8x8_t v7 = (int8x8_t)a1[1];
  if (!*(void *)&v7) {
    return 0;
  }
  unint64_t v8 = v6;
  uint8x8_t v9 = (uint8x8_t)vcnt_s8(v7);
  v9.i16[0] = vaddlv_u8(v9);
  unint64_t v10 = v9.u32[0];
  if (v9.u32[0] > 1uLL)
  {
    unint64_t v11 = v6;
    if (v6 >= *(void *)&v7) {
      unint64_t v11 = v6 % *(void *)&v7;
    }
  }
  else
  {
    unint64_t v11 = (*(void *)&v7 - 1) & v6;
  }
  uint64_t v12 = *(uint64_t ****)(*a1 + 8 * v11);
  if (!v12) {
    return 0;
  }
  for (i = *v12; i; i = (uint64_t **)*i)
  {
    unint64_t v14 = (unint64_t)i[1];
    if (v8 == v14)
    {
      if (i[3] == (uint64_t *)a3 && !memcmp(i[2], a2, a3)) {
        return i;
      }
    }
    else
    {
      if (v10 > 1)
      {
        if (v14 >= *(void *)&v7) {
          v14 %= *(void *)&v7;
        }
      }
      else
      {
        v14 &= *(void *)&v7 - 1;
      }
      if (v14 != v11) {
        return 0;
      }
    }
  }
  return i;
}

void sub_25C139320(void *a1)
{
  sub_25C1387F8(a1);

  JUMPOUT(0x26117F4A0);
}

unsigned char *sub_25C139358@<X0>(void *a1@<X8>)
{
  char v9 = 0;
  uint64_t v2 = sub_25C136E68(MEMORY[0x263F8C0F8], (uint64_t)"model_interface.h", 17);
  sub_25C136E68(v2, (uint64_t)"(", 1);
  uint64_t v3 = (void *)std::ostream::operator<<();
  unint64_t v4 = sub_25C136E68(v3, (uint64_t)") ", 2);
  uint64_t v5 = sub_25C136E68(v4, (uint64_t)"LOG(", 4);
  unint64_t v6 = sub_25C136E68(v5, (uint64_t)"ERROR", 5);
  int8x8_t v7 = sub_25C136E68(v6, (uint64_t)") ", 2);
  sub_25C136E68(v7, (uint64_t)"Not implemented.", 16);
  __n128 result = sub_25C137184(&v9);
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  return result;
}

void sub_25C139414(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12, char a13)
{
}

uint64_t sub_25C139428(uint64_t a1)
{
  return (*(uint64_t (**)(double))(*(void *)a1 + 56))(0.0);
}

uint64_t sub_25C139450(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

uint64_t sub_25C139458(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

void *sub_25C139460@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_25C13D9C8(a2, (void *)(a1 + 112));
}

void sub_25C13946C(void *a1)
{
  sub_25C147FF4(a1);

  JUMPOUT(0x26117F4A0);
}

void sub_25C1394B4(uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }

  JUMPOUT(0x26117F4A0);
}

uint64_t sub_25C139528(uint64_t a1)
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

void sub_25C139698(_Unwind_Exception *a1)
{
  std::ostream::~ostream();
  MEMORY[0x26117F430](v1);
  _Unwind_Resume(a1);
}

void sub_25C1396C0()
{
}

void sub_25C139738(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_25C139754(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C2C8];
  uint64_t v3 = *MEMORY[0x263F8C2C8];
  *(void *)(a1 + 8) = *MEMORY[0x263F8C2C8];
  *(void *)(a1 + 8 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 16) = MEMORY[0x263F8C318] + 16;
  if (*(char *)(a1 + 103) < 0) {
    operator delete(*(void **)(a1 + 80));
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x26117F430](a1 + 120);
  return a1;
}

void sub_25C13985C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = a2;
  unint64_t v38 = a2;
  uint64_t v39 = a3;
  uint64_t v40 = 0;
  uint64_t v41 = a4;
  memset(v37, 0, 76);
  if (!a4)
  {
    uint64_t v7 = 1;
    do
    {
      unint64_t v8 = v7;
      v7 *= 2;
    }
    while (v8 < v4);
    if (v8) {
      sub_25C13A9BC((uint64_t)v37 + 8, v8);
    }
    operator new[]();
  }
  uint64_t v49 = 0;
  long long v47 = 0uLL;
  long long v48 = 0uLL;
  long long v45 = 0uLL;
  long long v46 = 0uLL;
  long long v44 = 0uLL;
  memset(v43, 0, sizeof(v43));
  memset(v42, 0, sizeof(v42));
  v50[0] = 0;
  sub_25C13C028((uint64_t *)&v44 + 1, 0x400uLL, v50);
  if ((void)v48)
  {
    uint64_t v5 = v48 - 1;
    uint64_t v6 = *(void *)&v42[0] + 12 * *(unsigned int *)(*((void *)&v47 + 1) + 4 * (v48 - 1));
    *(_DWORD *)(v6 + 7) = 0;
    *(void *)uint64_t v6 = 0;
    *(void *)&long long v48 = v5;
  }
  else
  {
    sub_25C13BE6C(v42);
  }
  sub_25C13C0B0((void *)&v43[1] + 1);
  sub_25C13C100((void *)&v42[1] + 1);
  if (*((void *)&v43[0] + 1) == *(void *)&v43[1]) {
    sub_25C13A7BC((uint64_t)v43, *((void *)&v43[0] + 1) + 1);
  }
  ++*((void *)&v43[0] + 1);
  uint64_t v49 = 1;
  *(unsigned char *)(*(void *)&v42[0] + 8) = -1;
  v50[0] = 0;
  sub_25C13BFD4(&v46, v50);
  if (!v4) {
    goto LABEL_42;
  }
  uint64_t v9 = 0;
  unint64_t v33 = v4 + 1;
  unint64_t v34 = v4;
LABEL_14:
  unint64_t v10 = 0;
  uint64_t v11 = *(void *)(a3 + 8 * v9);
  do
    unint64_t v12 = v10;
  while (*(unsigned __int8 *)(v11 + v10++));
  int v14 = *(_DWORD *)(a4 + 4 * v9);
  if (v14 < 0)
  {
    unint64_t v31 = "/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiece/third_p"
          "arty/darts_clone/darts.h:1141: exception: failed to insert key: negative value";
  }
  else if (v12)
  {
    unint64_t v15 = 0;
    unsigned int v16 = 0;
    while (1)
    {
      unsigned int v17 = *(_DWORD *)(*(void *)&v42[0] + 12 * v16);
      if (!v17) {
        goto LABEL_27;
      }
      unsigned int v18 = *(unsigned __int8 *)(v11 + v15);
      if (v15 < v12 && !*(unsigned char *)(v11 + v15)) {
        break;
      }
      unsigned int v19 = *(unsigned __int8 *)(*(void *)&v42[0] + 12 * v17 + 8);
      if (v18 < v19)
      {
        unint64_t v31 = "/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiece/thi"
              "rd_party/darts_clone/darts.h:1162: exception: failed to insert key: wrong key order";
        goto LABEL_56;
      }
      if (v18 > v19)
      {
        *(unsigned char *)(*(void *)&v42[0] + 12 * v17 + 10) = 1;
        sub_25C13B9E8((uint64_t *)v42, v17);
LABEL_27:
        if (v15 <= v12)
        {
          do
          {
            if (v15 >= v12) {
              char v21 = 0;
            }
            else {
              char v21 = *(unsigned char *)(v11 + v15);
            }
            if ((void)v48)
            {
              uint64_t v22 = v48 - 1;
              uint64_t v23 = *(void *)&v42[0];
              unsigned int v20 = *(_DWORD *)(*((void *)&v47 + 1) + 4 * (v48 - 1));
              uint64_t v24 = *(void *)&v42[0] + 12 * v20;
              *(_DWORD *)(v24 + 7) = 0;
              *(void *)uint64_t v24 = 0;
              *(void *)&long long v48 = v22;
            }
            else
            {
              unsigned int v20 = DWORD2(v42[0]);
              sub_25C13BE6C(v42);
              uint64_t v23 = *(void *)&v42[0];
            }
            v50[0] = v20;
            unint64_t v25 = (unsigned int *)(v23 + 12 * v16);
            unsigned int v26 = *v25;
            if (!*v25) {
              *(unsigned char *)(v23 + 12 * v20 + 9) = 1;
            }
            uint64_t v27 = v23 + 12 * v20;
            *(_DWORD *)(v27 + 4) = v26;
            *(unsigned char *)(v27 + 8) = v21;
            *unint64_t v25 = v20;
            sub_25C13BFD4(&v46, v50);
            ++v15;
            unsigned int v16 = v20;
          }
          while (v15 <= v12);
        }
        else
        {
          unsigned int v20 = v16;
        }
        *(_DWORD *)(*(void *)&v42[0] + 12 * v20) = v14;
        unint64_t v4 = v34;
LABEL_39:
        ++v9;
        if (*(void *)&v37[0]) {
          (*(void (**)(uint64_t, unint64_t))&v37[0])(v9, v33);
        }
        if (v9 == v4)
        {
LABEL_42:
          sub_25C13B9E8((uint64_t *)v42, 0);
          char v28 = *(unsigned char *)(*(void *)&v42[0] + 8);
          int v29 = **(_DWORD **)&v42[0];
          if (v28) {
            int v30 = (2 * *(unsigned __int8 *)(*(void *)&v42[0] + 9)) | (4 * v29);
          }
          else {
            int v30 = 2 * v29;
          }
          **((_DWORD **)&v42[1] + 1) = v30 | *(unsigned __int8 *)(*(void *)&v42[0] + 10);
          **(unsigned char **)&v43[0] = v28;
          if (*(void *)&v42[0])
          {
            MEMORY[0x26117F470](*(void *)&v42[0], 0x1000C8077774924);
            *(void *)&v42[0] = 0;
          }
          *((void *)&v42[0] + 1) = 0;
          *(void *)&v42[1] = 0;
          if (*((void *)&v44 + 1))
          {
            MEMORY[0x26117F470](*((void *)&v44 + 1), 0x1000C8077774924);
            *((void *)&v44 + 1) = 0;
          }
          long long v45 = 0uLL;
          if ((void)v46)
          {
            MEMORY[0x26117F470](v46, 0x1000C8077774924);
            *(void *)&long long v46 = 0;
          }
          *((void *)&v46 + 1) = 0;
          *(void *)&long long v47 = 0;
          if (*((void *)&v47 + 1))
          {
            MEMORY[0x26117F470](*((void *)&v47 + 1), 0x1000C8077774924);
            *((void *)&v47 + 1) = 0;
          }
          long long v48 = 0uLL;
          operator new[]();
        }
        goto LABEL_14;
      }
      ++v15;
      unsigned int v16 = *(_DWORD *)(*(void *)&v42[0] + 12 * v16);
      if (v15 > v12) {
        goto LABEL_39;
      }
    }
    unint64_t v31 = "/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiece/third_p"
          "arty/darts_clone/darts.h:1157: exception: failed to insert key: invalid null character";
  }
  else
  {
    unint64_t v31 = "/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiece/third_p"
          "arty/darts_clone/darts.h:1143: exception: failed to insert key: zero-length key";
  }
LABEL_56:
  exception = __cxa_allocate_exception(0x10uLL);
  void *exception = &unk_27098A018;
  exception[1] = v31;
  __cxa_throw(exception, (struct type_info *)&unk_270989190, (void (*)(void *))std::exception::~exception);
}

void sub_25C13A49C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31)
{
}

void *sub_25C13A4E4(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    if (a2 >> 60) {
      sub_25C137658();
    }
    uint64_t v4 = 16 * a2;
    uint64_t v5 = (char *)operator new(16 * a2);
    *a1 = v5;
    a1[2] = &v5[16 * a2];
    bzero(v5, 16 * a2);
    a1[1] = &v5[v4];
  }
  return a1;
}

void sub_25C13A55C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *sub_25C13A578(void *a1)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_270989FF8;
  uint64_t v2 = a1[3];
  if (v2)
  {
    MEMORY[0x26117F470](v2, 0x1000C8052888210);
    a1[3] = 0;
  }
  return a1;
}

uint64_t sub_25C13A5F4(uint64_t a1)
{
  uint64_t v2 = (uint64_t *)(a1 + 8);
  sub_25C13A6D4((uint64_t *)(a1 + 8));
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    MEMORY[0x26117F470](v3, 0x1000C80CBA68D63);
    *(void *)(a1 + 32) = 0;
  }
  sub_25C13A720((uint64_t *)(a1 + 40));
  uint64_t v4 = *(void *)(a1 + 64);
  if (v4)
  {
    MEMORY[0x26117F470](v4, 0x1000C8052888210);
    *(void *)(a1 + 64) = 0;
  }
  *(_DWORD *)(a1 + 72) = 0;
  sub_25C13A774((uint64_t *)(a1 + 40));
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    MEMORY[0x26117F470](v5, 0x1000C80CBA68D63);
    *(void *)(a1 + 32) = 0;
  }
  sub_25C13A6D4(v2);
  if (*v2)
  {
    MEMORY[0x26117F470](*v2, 0x1000C8077774924);
    uint64_t *v2 = 0;
  }
  return a1;
}

uint64_t sub_25C13A6D4(uint64_t *a1)
{
  sub_25C13A94C(a1, 0);
  uint64_t result = *a1;
  if (*a1)
  {
    uint64_t result = MEMORY[0x26117F470](result, 0x1000C8077774924);
    *a1 = 0;
  }
  a1[1] = 0;
  a1[2] = 0;
  return result;
}

uint64_t sub_25C13A720(uint64_t *a1)
{
  uint64_t v2 = a1 + 1;
  if (a1[1]) {
    void *v2 = 0;
  }
  uint64_t result = *a1;
  if (*a1)
  {
    uint64_t result = MEMORY[0x26117F470]();
    *a1 = 0;
  }
  void *v2 = 0;
  v2[1] = 0;
  return result;
}

uint64_t *sub_25C13A774(uint64_t *a1)
{
  if (*a1)
  {
    MEMORY[0x26117F470](*a1, 0x1000C8077774924);
    *a1 = 0;
  }
  return a1;
}

void sub_25C13A7BC(uint64_t a1, unint64_t a2)
{
  if (a2 < 2 * *(void *)(a1 + 16))
  {
    uint64_t v2 = 1;
    do
    {
      unint64_t v3 = v2;
      v2 *= 2;
    }
    while (v3 < a2);
  }
  operator new[]();
}

const char *sub_25C13A8FC(uint64_t a1)
{
  if (*(void *)(a1 + 8)) {
    return *(const char **)(a1 + 8);
  }
  else {
    return "";
  }
}

void sub_25C13A914(std::exception *a1)
{
  std::exception::~exception(a1);

  JUMPOUT(0x26117F4A0);
}

void sub_25C13A94C(void *a1, unint64_t a2)
{
  unint64_t v4 = a1[1];
  if (v4 > a2)
  {
    a1[1] = a2;
    unint64_t v4 = a2;
  }
  if (a1[2] < a2) {
    sub_25C13A9BC((uint64_t)a1, a2);
  }
  if (a2 > v4)
  {
    bzero((void *)(*a1 + 4 * v4), 4 * (a2 - v4));
    a1[1] = a2;
  }
}

void sub_25C13A9BC(uint64_t a1, unint64_t a2)
{
  if (a2 < 2 * *(void *)(a1 + 16))
  {
    uint64_t v2 = 1;
    do
    {
      unint64_t v3 = v2;
      v2 *= 2;
    }
    while (v3 < a2);
  }
  operator new[]();
}

uint64_t sub_25C13AB00(uint64_t *a1)
{
  sub_25C13A720(a1);
  uint64_t result = a1[3];
  if (result)
  {
    uint64_t result = MEMORY[0x26117F470](result, 0x1000C8052888210);
    a1[3] = 0;
  }
  return result;
}

uint64_t *sub_25C13AB58(uint64_t *a1)
{
  sub_25C13A720(a1);
  uint64_t v2 = a1 + 3;
  sub_25C13A720(a1 + 3);
  sub_25C13A720(a1 + 6);
  sub_25C13AB00(a1 + 9);
  sub_25C13A720(a1 + 15);
  sub_25C13A720(a1 + 18);
  sub_25C13A720(a1 + 21);
  a1[24] = 0;
  sub_25C13B438(a1 + 21);
  sub_25C13B438(a1 + 18);
  sub_25C13A774(a1 + 15);
  sub_25C13AB00(a1 + 9);
  uint64_t v3 = a1[12];
  if (v3)
  {
    MEMORY[0x26117F470](v3, 0x1000C8052888210);
    a1[12] = 0;
  }
  sub_25C13A774(a1 + 9);
  sub_25C13A774(a1 + 6);
  sub_25C13A720(a1 + 3);
  if (*v2)
  {
    MEMORY[0x26117F470](*v2, 0x1000C8077774924);
    void *v2 = 0;
  }
  sub_25C13A720(a1);
  if (*a1)
  {
    MEMORY[0x26117F470](*a1, 0x1000C8077774924);
    *a1 = 0;
  }
  return a1;
}

void sub_25C13AC84(uint64_t a1)
{
  uint64_t v2 = (void *)(a1 + 8);
  unint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = (v3 + 256);
  unsigned int v5 = (v3 >> 8) - 16;
  if (v5 >= 0xFFFFFFEF)
  {
    sub_25C13A94C((void *)(a1 + 8), (v3 + 256));
  }
  else
  {
    int v6 = 0;
    unint64_t v7 = v5 << 8;
    uint64_t v8 = *(void *)(a1 + 32);
    while (1)
    {
      char v9 = v7 + v6;
      if (!*(unsigned char *)(v8 + 12 * ((v7 + v6) & 0xFFF) + 9)) {
        break;
      }
      if (++v6 == 256)
      {
        char v9 = 0;
        break;
      }
    }
    uint64_t v10 = 0;
    uint64_t v11 = 3072 * ((v3 >> 8) & 0xF);
    do
    {
      if (!*(unsigned char *)(v8 + v11 + v10 + 8))
      {
        if (*(void *)(a1 + 16) <= v7)
        {
          sub_25C13AC84(a1);
          uint64_t v8 = *(void *)(a1 + 32);
        }
        unint64_t v12 = (int *)(v8 + v11 + v10);
        uint64_t v13 = v12[1];
        if (v7 == *(_DWORD *)(a1 + 72))
        {
          *(_DWORD *)(a1 + 72) = v13;
          if (v7 == v13) {
            *(_DWORD *)(a1 + 72) = *(void *)(a1 + 16);
          }
        }
        int v14 = *v12;
        *(_DWORD *)(v8 + 12 * (*v12 & 0xFFF) + 4) = v13;
        *(_DWORD *)(v8 + 12 * (v12[1] & 0xFFF)) = v14;
        *((unsigned char *)v12 + 8) = 1;
        *(unsigned char *)(*v2 + 4 * v7) = v9 ^ v7;
      }
      ++v7;
      v10 += 12;
    }
    while (v10 != 3072);
    sub_25C13A94C(v2, (v3 + 256));
    uint64_t v15 = v3;
    if (v3 < (unint64_t)v4)
    {
      uint64_t v16 = *(void *)(a1 + 32);
      do
        *(_WORD *)(v16 + 12 * (v15++ & 0xFFF) + 8) = 0;
      while (v4 != v15);
    }
  }
  uint64_t v17 = *(void *)(a1 + 32);
  if ((int)v3 + 1 < v4)
  {
    for (int i = 0; i != 255; ++i)
    {
      int v19 = v3 + i;
      *(_DWORD *)(v17 + 12 * (v19 & 0xFFF) + 4) = v19 + 1;
      *(_DWORD *)(v17 + 12 * ((v19 + 1) & 0xFFF)) = v19;
    }
  }
  uint64_t v20 = 12 * (v3 & 0xFFF);
  *(_DWORD *)(v17 + v20) = v3 + 255;
  int v21 = *(_DWORD *)(a1 + 72);
  uint64_t v22 = 12 * (v21 & 0xFFF);
  *(_DWORD *)(v17 + v20) = *(_DWORD *)(v17 + v22);
  LOWORD(v20) = *(_DWORD *)(v17 + v22);
  *(_DWORD *)(v17 + 12 * ((v3 + 255) & 0xFFF) + 4) = v21;
  *(_DWORD *)(v17 + 12 * (v20 & 0xFFF) + 4) = v3;
  *(_DWORD *)(v17 + v22) = v3 + 255;
}

void sub_25C13AE98(uint64_t a1, void *a2, unint64_t a3, unint64_t a4, unint64_t a5, unsigned int a6)
{
  unint64_t v12 = (void *)(a1 + 40);
  for (i = (void *)(a1 + 40); ; unint64_t v12 = i)
  {
    if (*(void *)(a1 + 48)) {
      *(void *)(a1 + 48) = 0;
    }
    int v13 = -1;
    if (a3 < a4)
    {
      for (unint64_t j = a3; a4 != j; ++j)
      {
        unsigned __int8 v52 = 0;
        uint64_t v15 = a2[2];
        if (v15)
        {
          if (*(void *)(v15 + 8 * j) > a5)
          {
            unsigned __int8 v52 = *(unsigned char *)(*(void *)(a2[1] + 8 * j) + a5);
            LODWORD(v16) = v52;
            if (!v52)
            {
              exception = __cxa_allocate_exception(0x10uLL);
              uint64_t v49 = "/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepie"
                    "ce/third_party/darts_clone/darts.h:1726: exception: failed to build double-array: invalid null character";
              goto LABEL_81;
            }
            goto LABEL_21;
          }
        }
        else
        {
          unsigned __int8 v52 = *(unsigned char *)(*(void *)(a2[1] + 8 * j) + a5);
          LODWORD(v16) = v52;
          if (v52) {
            goto LABEL_21;
          }
        }
        uint64_t v17 = a2[3];
        if (v17)
        {
          if ((*(_DWORD *)(v17 + 4 * j) & 0x80000000) != 0) {
            goto LABEL_80;
          }
        }
        else if ((j & 0x80000000) != 0)
        {
LABEL_80:
          exception = __cxa_allocate_exception(0x10uLL);
          uint64_t v49 = "/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiece/t"
                "hird_party/darts_clone/darts.h:1728: exception: failed to build double-array: negative value";
LABEL_81:
          void *exception = &unk_27098A018;
          exception[1] = v49;
          __cxa_throw(exception, (struct type_info *)&unk_270989190, (void (*)(void *))std::exception::~exception);
        }
        if (v13 == -1)
        {
          if (v17) {
            int v13 = *(_DWORD *)(v17 + 4 * j);
          }
          else {
            int v13 = j;
          }
        }
        uint64_t v16 = *(void (**)(unint64_t, uint64_t))a1;
        if (*(void *)a1)
        {
          v16(j + 1, *a2 + 1);
          LODWORD(v16) = 0;
        }
LABEL_21:
        uint64_t v18 = *(void *)(a1 + 48);
        if (!v18) {
          goto LABEL_25;
        }
        unsigned int v19 = *(unsigned __int8 *)(v18 + *v12 - 1);
        if (v16 != v19)
        {
          if (v16 < v19)
          {
            exception = __cxa_allocate_exception(0x10uLL);
            uint64_t v49 = "/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiece"
                  "/third_party/darts_clone/darts.h:1743: exception: failed to build double-array: wrong key order";
            goto LABEL_81;
          }
LABEL_25:
          sub_25C13B3E4(v12, &v52);
        }
      }
    }
    unint64_t v20 = *(unsigned int *)(a1 + 72);
    unint64_t v21 = *(void *)(a1 + 16);
    if (v21 <= v20)
    {
LABEL_39:
      unsigned int v26 = a6 | v21;
    }
    else
    {
      uint64_t v23 = *(void *)(a1 + 32);
      uint64_t v22 = *(unsigned __int8 **)(a1 + 40);
      int v24 = *v22;
      int v25 = *(_DWORD *)(a1 + 72);
      while (1)
      {
        unsigned int v26 = v25 ^ v24;
        unsigned int v27 = (v25 ^ v24) & 0xFFF;
        if (!*(unsigned char *)(v23 + 12 * v27 + 9)
          && (v26 == a6 || ((v26 ^ a6) & 0x1FE00000) == 0))
        {
          unint64_t v28 = *(void *)(a1 + 48);
          if (v28 < 2) {
            goto LABEL_40;
          }
          if (!*(unsigned char *)(v23 + 12 * (v27 ^ v22[1]) + 8)) {
            break;
          }
        }
LABEL_38:
        int v25 = *(_DWORD *)(v23 + 12 * (v25 & 0xFFF) + 4);
        if (v25 == v20) {
          goto LABEL_39;
        }
      }
      uint64_t v29 = 2;
      while (v28 != v29)
      {
        unint64_t v30 = v29;
        if (*(unsigned __int8 *)(v23 + 12 * (v27 ^ v22[v29++]) + 8))
        {
          if (v30 >= v28) {
            break;
          }
          goto LABEL_38;
        }
      }
    }
LABEL_40:
    sub_25C13B35C((unsigned int *)(*(void *)(a1 + 8) + 4 * a6), v26 ^ a6);
    if (*(void *)(a1 + 48))
    {
      unsigned int v32 = a6;
      unint64_t v33 = 0;
      uint64_t v34 = v32;
      unsigned int v51 = v13 | 0x80000000;
      uint64_t v35 = *i;
      do
      {
        unint64_t v36 = v26 ^ *(unsigned __int8 *)(v35 + v33);
        if (*(void *)(a1 + 16) <= v36) {
          sub_25C13AC84(a1);
        }
        if (*(_DWORD *)(a1 + 72) == v36)
        {
          unsigned int v37 = v36 & 0xFFF;
          uint64_t v38 = *(void *)(a1 + 32);
          int v39 = *(_DWORD *)(v38 + 12 * (v36 & 0xFFF) + 4);
          *(_DWORD *)(a1 + 72) = v39;
          if (v39 == v36)
          {
            *(_DWORD *)(a1 + 72) = *(void *)(a1 + 16);
            int v39 = v36;
          }
        }
        else
        {
          uint64_t v38 = *(void *)(a1 + 32);
          unsigned int v37 = v36 & 0xFFF;
          int v39 = *(_DWORD *)(v38 + 12 * (v36 & 0xFFF) + 4);
        }
        uint64_t v40 = (int *)(v38 + 12 * v37);
        int v41 = *v40;
        *(_DWORD *)(v38 + 12 * (*v40 & 0xFFF) + 4) = v39;
        *(_DWORD *)(v38 + 12 * (v40[1] & 0xFFF)) = v41;
        *((unsigned char *)v40 + 8) = 1;
        uint64_t v35 = *(void *)(a1 + 40);
        uint64_t v42 = *(void *)(a1 + 8);
        if (*(unsigned char *)(v35 + v33))
        {
          *(unsigned char *)(v42 + 4 * v36) = *(unsigned char *)(v35 + v33);
        }
        else
        {
          *(_DWORD *)(v42 + 4 * v34) |= 0x100u;
          *(_DWORD *)(v42 + 4 * v36) = v51;
        }
        ++v33;
      }
      while (v33 < *(void *)(a1 + 48));
    }
    else
    {
      uint64_t v38 = *(void *)(a1 + 32);
    }
    *(unsigned char *)(v38 + 12 * (v26 & 0xFFF) + 9) = 1;
    if (a3 < a4)
    {
      uint64_t v43 = a2[2];
      while (v43 && *(void *)(v43 + 8 * a3) <= a5 || !*(unsigned char *)(*(void *)(a2[1] + 8 * a3) + a5))
      {
        if (a4 == ++a3) {
          return;
        }
      }
    }
    if (a3 == a4) {
      break;
    }
    uint64_t v44 = a2[2];
    if (v44 && *(void *)(v44 + 8 * a3) <= a5) {
      int v45 = 0;
    }
    else {
      int v45 = *(unsigned __int8 *)(*(void *)(a2[1] + 8 * a3) + a5);
    }
    unint64_t v46 = a3 + 1;
    if (a3 + 1 < a4)
    {
      do
      {
        if (v44 && *(void *)(v44 + 8 * v46) <= a5) {
          int v47 = 0;
        }
        else {
          int v47 = *(unsigned __int8 *)(*(void *)(a2[1] + 8 * v46) + a5);
        }
        if (v47 != v45)
        {
          sub_25C13AE98(a1, a2, a3, v46, a5 + 1, v26 ^ v45);
          uint64_t v44 = a2[2];
          if (v44 && *(void *)(v44 + 8 * v46) <= a5) {
            int v45 = 0;
          }
          else {
            int v45 = *(unsigned __int8 *)(*(void *)(a2[1] + 8 * v46) + a5);
          }
          a3 = v46;
        }
        ++v46;
      }
      while (a4 != v46);
    }
    a6 = v26 ^ v45;
    ++a5;
  }
}

unsigned int *sub_25C13B35C(unsigned int *result, unsigned int a2)
{
  if (a2 >> 29)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    void *exception = &unk_27098A018;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiec"
                   "e/third_party/darts_clone/darts.h:1380: exception: failed to modify unit: too large offset";
    __cxa_throw(exception, (struct type_info *)&unk_270989190, (void (*)(void *))std::exception::~exception);
  }
  int v2 = (4 * a2) | 0x200;
  if (a2 < 0x200000) {
    int v2 = a2 << 10;
  }
  unsigned char *result = *result & 0x800001FF | v2;
  return result;
}

void *sub_25C13B3E4(void *result, unsigned char *a2)
{
  uint64_t v2 = result[1];
  if (v2 == result[2]) {
    sub_25C13A7BC((uint64_t)result, v2 + 1);
  }
  result[1] = v2 + 1;
  *(unsigned char *)(*result + v2) = *a2;
  return result;
}

uint64_t *sub_25C13B438(uint64_t *a1)
{
  sub_25C13A720(a1);

  return sub_25C13A774(a1);
}

void sub_25C13B478(uint64_t a1, unint64_t a2)
{
  if (a2 < 2 * *(void *)(a1 + 16))
  {
    uint64_t v2 = 1;
    do
    {
      unint64_t v3 = v2;
      v2 *= 2;
    }
    while (v3 < a2);
  }
  operator new[]();
}

unsigned int *sub_25C13B5B4(uint64_t a1, void *a2, unsigned int a3, unsigned int a4)
{
  unint64_t v8 = *(unsigned int *)(a2[3] + 4 * a3);
  unint64_t v9 = v8 >> 2;
  unint64_t v10 = v8 >> 7;
  uint64_t v11 = a2[9];
  int v12 = 1 << (v8 >> 2);
  if ((v12 & *(_DWORD *)(v11 + 4 * (v8 >> 7))) != 0
    && (int v13 = *(_DWORD *)(*(void *)(a1 + 64) + 4 * (sub_25C13B98C(v11, a2[12], v8 >> 2) - 1))) != 0
    && ((unsigned int v14 = v13 ^ a4, ((v13 ^ a4) & 0x1FE00000) != 0) ? (v15 = (v13 ^ a4) == 0) : (v15 = 1), v15))
  {
    if (*(unsigned char *)(a2[6] + v9))
    {
      uint64_t v16 = *(void *)(a1 + 8);
      uint64_t v17 = a4;
    }
    else
    {
      uint64_t v17 = a4;
      uint64_t v16 = *(void *)(a1 + 8);
      *(_DWORD *)(v16 + 4 * a4) |= 0x100u;
    }
    return sub_25C13B35C((unsigned int *)(v16 + 4 * v17), v14);
  }
  else
  {
    if (*(void *)(a1 + 48)) {
      *(void *)(a1 + 48) = 0;
    }
    if (v8 >= 4)
    {
      unint64_t v18 = v8 >> 2;
      do
      {
        char v48 = *(unsigned char *)(a2[6] + v18);
        sub_25C13B3E4((void *)(a1 + 40), &v48);
        int v19 = *(_DWORD *)(a2[3] + 4 * v18);
        BOOL v20 = __CFADD__(v18, 1);
        LODWORD(v18) = v18 + 1;
        int v21 = v20;
      }
      while ((v19 & 1) != 0 && !v21);
    }
    unint64_t v22 = *(unsigned int *)(a1 + 72);
    unint64_t v23 = *(void *)(a1 + 16);
    int v46 = v12;
    if (v23 <= v22)
    {
LABEL_31:
      unsigned int v28 = a4 | v23;
    }
    else
    {
      uint64_t v25 = *(void *)(a1 + 32);
      int v24 = *(unsigned __int8 **)(a1 + 40);
      int v26 = *v24;
      int v27 = *(_DWORD *)(a1 + 72);
      while (1)
      {
        unsigned int v28 = v27 ^ v26;
        unsigned int v29 = (v27 ^ v26) & 0xFFF;
        if (!*(unsigned char *)(v25 + 12 * v29 + 9)
          && (v28 == a4 || ((v28 ^ a4) & 0x1FE00000) == 0))
        {
          unint64_t v30 = *(void *)(a1 + 48);
          if (v30 < 2) {
            goto LABEL_32;
          }
          if (!*(unsigned char *)(v25 + 12 * (v29 ^ v24[1]) + 8)) {
            break;
          }
        }
LABEL_30:
        int v27 = *(_DWORD *)(v25 + 12 * (v27 & 0xFFF) + 4);
        if (v27 == v22) {
          goto LABEL_31;
        }
      }
      uint64_t v31 = 2;
      while (v30 != v31)
      {
        unint64_t v32 = v31;
        if (*(unsigned __int8 *)(v25 + 12 * (v29 ^ v24[v31++]) + 8))
        {
          if (v32 >= v30) {
            break;
          }
          goto LABEL_30;
        }
      }
    }
LABEL_32:
    sub_25C13B35C((unsigned int *)(*(void *)(a1 + 8) + 4 * a4), v28 ^ a4);
    unint64_t v47 = v10;
    if (*(void *)(a1 + 48))
    {
      unint64_t v34 = 0;
      unsigned int v35 = *(_DWORD *)(a2[3] + 4 * a3) >> 2;
      do
      {
        unint64_t v36 = v28 ^ *(unsigned __int8 *)(*(void *)(a1 + 40) + v34);
        if (*(void *)(a1 + 16) <= v36) {
          sub_25C13AC84(a1);
        }
        if (*(_DWORD *)(a1 + 72) == v36)
        {
          unsigned int v37 = v36 & 0xFFF;
          uint64_t v38 = *(void *)(a1 + 32);
          int v39 = *(_DWORD *)(v38 + 12 * (v36 & 0xFFF) + 4);
          *(_DWORD *)(a1 + 72) = v39;
          if (v39 == v36)
          {
            *(_DWORD *)(a1 + 72) = *(void *)(a1 + 16);
            int v39 = v36;
          }
        }
        else
        {
          uint64_t v38 = *(void *)(a1 + 32);
          unsigned int v37 = v36 & 0xFFF;
          int v39 = *(_DWORD *)(v38 + 12 * (v36 & 0xFFF) + 4);
        }
        uint64_t v40 = (int *)(v38 + 12 * v37);
        int v41 = *v40;
        *(_DWORD *)(v38 + 12 * (*v40 & 0xFFF) + 4) = v39;
        *(_DWORD *)(v38 + 12 * (v40[1] & 0xFFF)) = v41;
        *((unsigned char *)v40 + 8) = 1;
        uint64_t v42 = *(void *)(a1 + 8);
        if (*(unsigned char *)(a2[6] + v35))
        {
          *(unsigned char *)(v42 + 4 * v36) = *(unsigned char *)(*(void *)(a1 + 40) + v34);
          unsigned int v43 = *(_DWORD *)(a2[3] + 4 * v35);
        }
        else
        {
          *(_DWORD *)(v42 + 4 * a4) |= 0x100u;
          unsigned int v43 = *(_DWORD *)(a2[3] + 4 * v35);
          *(_DWORD *)(v42 + 4 * v36) = (v43 >> 1) | 0x80000000;
        }
        unsigned int v35 = ((int)(v43 << 31) >> 31) & (v35 + 1);
        ++v34;
      }
      while (v34 < *(void *)(a1 + 48));
    }
    else
    {
      uint64_t v38 = *(void *)(a1 + 32);
    }
    *(unsigned char *)(v38 + 12 * (v28 & 0xFFF) + 9) = 1;
    uint64_t result = (unsigned int *)a2[9];
    if ((result[v47] & v46) != 0)
    {
      uint64_t result = (unsigned int *)sub_25C13B98C((uint64_t)result, a2[12], v9);
      *(_DWORD *)(*(void *)(a1 + 64) + 4 * (result - 1)) = v28;
    }
    do
    {
      if (*(unsigned char *)(a2[6] + v9)) {
        uint64_t result = (unsigned int *)sub_25C13B5B4(a1, a2, v9, v28 ^ *(unsigned __int8 *)(a2[6] + v9));
      }
      if (v9 == -1) {
        break;
      }
      int v45 = *(_DWORD *)(a2[3] + 4 * v9);
      LODWORD(v9) = v9 + 1;
    }
    while ((v45 & 1) != 0);
  }
  return result;
}

uint64_t sub_25C13B98C(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3 = (a3 >> 3) & 0x1FFFFFFFFFFFFFFCLL;
  int v4 = *(_DWORD *)(a2 + v3);
  LODWORD(v3) = *(_DWORD *)(a1 + v3) & (0xFFFFFFFF >> ~(_BYTE)a3);
  LODWORD(v3) = ((((unint64_t)(((v3 >> 1) & 0x55555555) + (v3 & 0x55555555)) >> 2) & 0x33333333)
               + ((((v3 >> 1) & 0x55555555) + (v3 & 0x55555555)) & 0x33333333)
               + (((((unint64_t)(((v3 >> 1) & 0x55555555) + (v3 & 0x55555555)) >> 2) & 0x33333333)
                 + ((((v3 >> 1) & 0x55555555) + (v3 & 0x55555555)) & 0x33333333)) >> 4)) & 0xF0F0F0F;
  return (((_BYTE)v3 + BYTE1(v3) + ((v3 + (v3 >> 8)) >> 16)) & 0x3Fu) + v4;
}

uint64_t *sub_25C13B9E8(uint64_t *result, unsigned int a2)
{
  uint64_t v2 = result;
  uint64_t v3 = result[19] - 1;
  uint64_t v4 = *(unsigned int *)(result[18] + 4 * v3);
  if (v4 != a2)
  {
    unsigned int v5 = result + 3;
    int v6 = result + 6;
    uint64_t v57 = result + 15;
    uint64_t v58 = result + 9;
    uint64_t v59 = a2;
    while (1)
    {
      v2[19] = v3;
      unint64_t v7 = v2[16];
      if (v2[24] >= v7 - (v7 >> 2))
      {
        unint64_t v8 = 2 * v7;
        sub_25C13A720(v57);
        int v60 = 0;
        uint64_t result = sub_25C13C028(v57, v8, &v60);
        unint64_t v9 = v2[4];
        if (v9 >= 2)
        {
          uint64_t v10 = *v6;
          for (uint64_t i = 1; i != v9; ++i)
          {
            if (!*(unsigned char *)(v10 + i) || (*(_DWORD *)(*v5 + 4 * i) & 2) != 0)
            {
              unsigned int v12 = 0;
              if (i)
              {
                unsigned int v13 = i;
                do
                {
                  int v14 = *(_DWORD *)(*v5 + 4 * v13);
                  unsigned int v15 = (v14 ^ ~(*(unsigned __int8 *)(v10 + v13) << 24)) + (v14 << 15);
                  unsigned int v16 = 2057 * ((5 * (v15 ^ (v15 >> 12))) ^ ((5 * (v15 ^ (v15 >> 12))) >> 4));
                  v12 ^= HIWORD(v16) ^ v16;
                  BOOL v17 = __CFADD__(v13++, 1);
                }
                while (!v17 && (v14 & 1) != 0);
              }
              uint64_t v18 = v2[15];
              do
              {
                unint64_t v19 = v12 % (unint64_t)v2[16];
                unsigned int v12 = v19 + 1;
              }
              while (*(_DWORD *)(v18 + 4 * v19));
              *(_DWORD *)(v18 + 4 * v19) = i;
            }
          }
        }
      }
      if (!v4)
      {
        unsigned int v43 = (unsigned int *)v2[15];
        unsigned int v35 = *v43;
        if (*v43)
        {
          LODWORD(v34) = 0;
          uint64_t v44 = v2[3];
          while (1)
          {
            unsigned int v45 = v35;
            if (*(_DWORD *)(*v2 + 4))
            {
              unsigned int v45 = v35;
              while ((*(_DWORD *)(v44 + 4 * v45) & 1) != 0)
              {
                ++v45;
                if (!*(_DWORD *)(*v2 + 12 * *(unsigned int *)(*v2 + 4) + 4)) {
                  goto LABEL_47;
                }
              }
            }
            else
            {
LABEL_47:
              if ((*(_DWORD *)(v44 + 4 * v45) & 1) == 0)
              {
LABEL_51:
                *(_DWORD *)(*v58 + 4 * (v35 >> 5)) |= 1 << v35;
                if (!v4) {
                  goto LABEL_66;
                }
                goto LABEL_65;
              }
            }
            unint64_t v34 = (v34 + 1) % (unint64_t)v2[16];
            unsigned int v35 = v43[v34];
            if (!v35) {
              goto LABEL_58;
            }
          }
        }
        unint64_t v34 = 0;
        unsigned int v46 = 0;
        goto LABEL_64;
      }
      int v20 = 0;
      uint64_t v21 = *v2;
      uint64_t v22 = v4;
      do
      {
        ++v20;
        LODWORD(v22) = *(_DWORD *)(v21 + 12 * v22 + 4);
      }
      while (v22);
      LODWORD(v23) = 0;
      uint64_t v24 = v4;
      do
      {
        uint64_t v25 = (int *)(v21 + 12 * v24);
        int v26 = *((unsigned __int8 *)v25 + 8);
        int v27 = *v25;
        if (v26) {
          int v28 = (2 * *(unsigned __int8 *)(v21 + 12 * v24 + 9)) | (4 * v27);
        }
        else {
          int v28 = 2 * v27;
        }
        uint64_t v29 = v21 + 12 * v24;
        unsigned int v30 = ((v28 | *(unsigned __int8 *)(v29 + 10)) ^ ~(v26 << 24)) + ((v28 | *(unsigned __int8 *)(v29 + 10)) << 15);
        unsigned int v31 = 2057 * ((5 * (v30 ^ (v30 >> 12))) ^ ((5 * (v30 ^ (v30 >> 12))) >> 4));
        unint64_t v23 = v23 ^ HIWORD(v31) ^ v31;
        uint64_t v24 = *(unsigned int *)(v29 + 4);
      }
      while (v24);
      uint64_t v33 = v2[15];
      unint64_t v32 = v2[16];
      unint64_t v34 = v23 % v32;
      unsigned int v35 = *(_DWORD *)(v33 + 4 * (v23 % v32));
      if (v35)
      {
        uint64_t v36 = *v5;
        do
        {
          unsigned int v37 = v35;
          if (*(_DWORD *)(v21 + 12 * v4 + 4))
          {
            unsigned int v37 = v35;
            while ((*(_DWORD *)(v36 + 4 * v37) & 1) != 0)
            {
              ++v37;
              if (!*(_DWORD *)(v21 + 12 * *(unsigned int *)(v21 + 12 * v4 + 4) + 4)) {
                goto LABEL_30;
              }
            }
          }
          else
          {
LABEL_30:
            if ((*(_DWORD *)(v36 + 4 * v37) & 1) == 0)
            {
              uint64_t v38 = v4;
              while (1)
              {
                int v39 = (int *)(v21 + 12 * v38);
                int v40 = *((unsigned __int8 *)v39 + 8);
                int v41 = *v39;
                int v42 = v40 ? (2 * *(unsigned __int8 *)(v21 + 12 * v38 + 9)) | (4 * v41) : 2 * v41;
                if ((v42 | *(unsigned __int8 *)(v21 + 12 * v38 + 10)) != *(_DWORD *)(v36 + 4 * v37)
                  || v40 != *(unsigned __int8 *)(*v6 + v37))
                {
                  break;
                }
                uint64_t v38 = *(unsigned int *)(v21 + 12 * v38 + 4);
                --v37;
                if (!v38) {
                  goto LABEL_51;
                }
              }
            }
          }
          unint64_t v34 = (v34 + 1) % v32;
          unsigned int v35 = *(_DWORD *)(v33 + 4 * v34);
        }
        while (v35);
      }
      if (v20) {
        break;
      }
LABEL_58:
      unsigned int v46 = 0;
      if (v4) {
        goto LABEL_59;
      }
LABEL_64:
      unsigned int v35 = v46 + 1;
      *(_DWORD *)(v2[15] + 4 * v34) = v46 + 1;
      ++v2[24];
      if (!v4) {
        goto LABEL_66;
      }
      do
      {
LABEL_65:
        uint64_t v55 = *(unsigned int *)(*v2 + 12 * v4 + 4);
        int v61 = v4;
        uint64_t result = sub_25C13BFD4(v2 + 21, &v61);
        uint64_t v4 = v55;
      }
      while (v55);
LABEL_66:
      uint64_t v56 = v2[18];
      uint64_t v3 = v2[19] - 1;
      *(_DWORD *)(*v2 + 12 * *(unsigned int *)(v56 + 4 * v3)) = v35;
      uint64_t v4 = *(unsigned int *)(v56 + 4 * v3);
      if (v4 == v59) {
        goto LABEL_67;
      }
    }
    do
    {
      sub_25C13C0B0(v58);
      uint64_t result = sub_25C13C100(v2 + 3);
      uint64_t v47 = v2[7];
      if (v47 == v2[8]) {
        sub_25C13A7BC((uint64_t)(v2 + 6), v47 + 1);
      }
      v2[7] = v47 + 1;
      --v20;
    }
    while (v20);
    unsigned int v46 = *((_DWORD *)v2 + 28) - 1;
LABEL_59:
    uint64_t v48 = *v2;
    uint64_t v49 = v4;
    do
    {
      unint64_t v50 = (int *)(v48 + 12 * v49);
      int v51 = *((unsigned __int8 *)v50 + 8);
      int v52 = *v50;
      if (v51) {
        int v53 = (2 * *(unsigned __int8 *)(v48 + 12 * v49 + 9)) | (4 * v52);
      }
      else {
        int v53 = 2 * v52;
      }
      uint64_t v54 = 3 * v49;
      *(_DWORD *)(v2[3] + 4 * v46) = v53 | *(unsigned __int8 *)(v48 + 4 * v54 + 10);
      *(unsigned char *)(v2[6] + v46--) = v51;
      uint64_t v48 = *v2;
      uint64_t v49 = *(unsigned int *)(*v2 + 4 * v54 + 4);
    }
    while (v49);
    goto LABEL_64;
  }
LABEL_67:
  v2[19] = v3;
  return result;
}

void *sub_25C13BE6C(void *result)
{
  uint64_t v1 = result[1];
  if (v1 == result[2])
  {
    unint64_t v2 = v1 + 1;
    if (v1 + 1 < (unint64_t)(2 * v1))
    {
      uint64_t v3 = 1;
      do
      {
        unint64_t v4 = v3;
        v3 *= 2;
      }
      while (v4 < v2);
    }
    operator new[]();
  }
  result[1] = v1 + 1;
  uint64_t v5 = *result + 12 * v1;
  *(_DWORD *)(v5 + 7) = 0;
  *(void *)uint64_t v5 = 0;
  return result;
}

void *sub_25C13BFD4(void *result, _DWORD *a2)
{
  uint64_t v2 = result[1];
  if (v2 == result[2]) {
    sub_25C13B478((uint64_t)result, v2 + 1);
  }
  result[1] = v2 + 1;
  *(_DWORD *)(*result + 4 * v2) = *a2;
  return result;
}

uint64_t *sub_25C13C028(uint64_t *result, unint64_t a2, _DWORD *a3)
{
  unint64_t v3 = result[1];
  if (v3 > a2)
  {
    result[1] = a2;
    unint64_t v3 = a2;
  }
  if (result[2] < a2) {
    sub_25C13B478((uint64_t)result, a2);
  }
  if (v3 < a2)
  {
    uint64_t v4 = *result;
    do
      *(_DWORD *)(v4 + 4 * v3++) = *a3;
    while (a2 != v3);
    result[1] = a2;
  }
  return result;
}

void *sub_25C13C0B0(void *result)
{
  uint64_t v1 = result;
  uint64_t v2 = result[5];
  if ((v2 & 0x1F) == 0)
  {
    int v3 = 0;
    uint64_t result = sub_25C13BFD4(result, &v3);
    uint64_t v2 = v1[5];
  }
  v1[5] = v2 + 1;
  return result;
}

void *sub_25C13C100(void *result)
{
  uint64_t v1 = result[1];
  if (v1 == result[2])
  {
    unint64_t v2 = v1 + 1;
    if (v1 + 1 < (unint64_t)(2 * v1))
    {
      uint64_t v3 = 1;
      do
      {
        unint64_t v4 = v3;
        v3 *= 2;
      }
      while (v4 < v2);
    }
    operator new[]();
  }
  result[1] = v1 + 1;
  *(_DWORD *)(*result + 4 * v1) = 0;
  return result;
}

void sub_25C13C248(void *a1)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_270989FF8;
  uint64_t v2 = a1[3];
  if (v2)
  {
    MEMORY[0x26117F470](v2, 0x1000C8052888210);
    a1[3] = 0;
  }

  JUMPOUT(0x26117F4A0);
}

char *sub_25C13C2CC(void *a1, unint64_t a2)
{
  if (a2 >> 62) {
    sub_25C137658();
  }
  uint64_t result = (char *)sub_25C13C324(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void *sub_25C13C324(unint64_t a1)
{
  if (a1 >> 62) {
    sub_25C1376B8();
  }
  return operator new(4 * a1);
}

void *sub_25C13C374(unint64_t a1)
{
  if (a1 >> 61) {
    sub_25C1376B8();
  }
  return operator new(8 * a1);
}

uint64_t *sub_25C13C3AC(uint64_t *result, uint64_t *a2)
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
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), uint64_t v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            unint64_t v9 = (uint64_t **)a2[2];
          }
          else
          {
            unint64_t v9 = (uint64_t **)v2[1];
            uint64_t v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              uint64_t v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *unint64_t v9 = v2;
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
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), uint64_t v5 = v4 + 3, v6))
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
      *uint64_t v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void **sub_25C13C544(void **a1, uint64_t a2, unint64_t a3, unsigned __int8 *a4, uint64_t a5)
{
  int v8 = 0;
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  unint64_t v9 = 0;
  if (a5 && a3)
  {
    int v8 = 0;
    unint64_t v9 = 0;
    uint64_t v12 = (unsigned __int8 *)(a2 + a3);
    while (2)
    {
      uint64_t v13 = &v9[a2];
      int v14 = &v9[a2];
LABEL_5:
      uint64_t v15 = a5;
      unsigned int v16 = a4;
      while (*v14 != *v16)
      {
        ++v16;
        if (!--v15)
        {
          if (++v14 != v12) {
            goto LABEL_5;
          }
          goto LABEL_34;
        }
      }
      if (v14 != v12)
      {
        BOOL v17 = &v14[-a2];
        if (&v14[-a2] != (unsigned __int8 *)-1)
        {
          uint64_t v18 = (unsigned __int8 *)(v17 - v9);
          if (v17 > v9)
          {
            unint64_t v19 = (unsigned __int8 *)(a3 - (void)v9);
            if (v19 >= v18) {
              int v20 = v18;
            }
            else {
              int v20 = v19;
            }
            unint64_t v21 = (unint64_t)a1[2];
            if ((unint64_t)v8 >= v21)
            {
              uint64_t v22 = ((char *)v8 - (unsigned char *)*a1) >> 4;
              if ((unint64_t)(v22 + 1) >> 60) {
                sub_25C137658();
              }
              uint64_t v23 = v21 - (void)*a1;
              uint64_t v24 = v23 >> 3;
              if (v23 >> 3 <= (unint64_t)(v22 + 1)) {
                uint64_t v24 = v22 + 1;
              }
              if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFF0) {
                unint64_t v25 = 0xFFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v25 = v24;
              }
              if (v25) {
                unint64_t v25 = (unint64_t)sub_25C13CA74(v25);
              }
              else {
                uint64_t v26 = 0;
              }
              int v27 = (unsigned __int8 **)(v25 + 16 * v22);
              char *v27 = v13;
              v27[1] = v20;
              uint64_t v29 = (char *)*a1;
              int v28 = (char *)a1[1];
              unsigned int v30 = v27;
              if (v28 != *a1)
              {
                do
                {
                  *((_OWORD *)v30 - 1) = *((_OWORD *)v28 - 1);
                  v30 -= 2;
                  v28 -= 16;
                }
                while (v28 != v29);
                int v28 = (char *)*a1;
              }
              int v8 = v27 + 2;
              *a1 = v30;
              a1[1] = v27 + 2;
              a1[2] = (void *)(v25 + 16 * v26);
              if (v28) {
                operator delete(v28);
              }
            }
            else
            {
              *int v8 = v13;
              v8[1] = v20;
              v8 += 2;
            }
            a1[1] = v8;
          }
          unint64_t v9 = v17 + 1;
          if (a3 > (unint64_t)(v17 + 1)) {
            continue;
          }
        }
      }
      break;
    }
  }
LABEL_34:
  BOOL v31 = a3 > (unint64_t)v9;
  unint64_t v32 = a3 - (void)v9;
  if (v31)
  {
    uint64_t v33 = &v9[a2];
    unint64_t v34 = (unint64_t)a1[2];
    if ((unint64_t)v8 >= v34)
    {
      uint64_t v36 = ((char *)v8 - (unsigned char *)*a1) >> 4;
      if ((unint64_t)(v36 + 1) >> 60) {
        sub_25C137658();
      }
      uint64_t v37 = v34 - (void)*a1;
      uint64_t v38 = v37 >> 3;
      if (v37 >> 3 <= (unint64_t)(v36 + 1)) {
        uint64_t v38 = v36 + 1;
      }
      if ((unint64_t)v37 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v39 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v39 = v38;
      }
      if (v39) {
        unint64_t v39 = (unint64_t)sub_25C13CA74(v39);
      }
      else {
        uint64_t v40 = 0;
      }
      int v41 = (unsigned __int8 **)(v39 + 16 * v36);
      unint64_t v42 = v39 + 16 * v40;
      *int v41 = v33;
      v41[1] = (unsigned __int8 *)v32;
      unsigned int v35 = v41 + 2;
      uint64_t v44 = (char *)*a1;
      unsigned int v43 = (char *)a1[1];
      if (v43 != *a1)
      {
        do
        {
          *((_OWORD *)v41 - 1) = *((_OWORD *)v43 - 1);
          v41 -= 2;
          v43 -= 16;
        }
        while (v43 != v44);
        unsigned int v43 = (char *)*a1;
      }
      *a1 = v41;
      a1[1] = v35;
      a1[2] = (void *)v42;
      if (v43) {
        operator delete(v43);
      }
    }
    else
    {
      *int v8 = v33;
      v8[1] = (unsigned __int8 *)v32;
      unsigned int v35 = v8 + 2;
    }
    a1[1] = v35;
  }
  return a1;
}

void sub_25C13C7AC(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_25C13C7D0(void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    sub_25C13C9BC((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void *sub_25C13C824(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_25C1365BC();
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

uint64_t *sub_25C13C8D4(uint64_t *result, void *a2)
{
  uint64_t v2 = *result;
  uint64_t v3 = result[1];
  uint64_t v4 = a2[1];
  if (v3 == *result)
  {
    uint64_t v5 = a2[1];
  }
  else
  {
    do
    {
      uint64_t v5 = v4 - 24;
      long long v6 = *(_OWORD *)(v3 - 24);
      *(void *)(v4 - 8) = *(void *)(v3 - 8);
      *(_OWORD *)(v4 - 24) = v6;
      *(void *)(v3 - 16) = 0;
      *(void *)(v3 - 8) = 0;
      *(void *)(v3 - 24) = 0;
      v4 -= 24;
      v3 -= 24;
    }
    while (v3 != v2);
  }
  a2[1] = v5;
  uint64_t v7 = *result;
  char *result = v5;
  a2[1] = v7;
  uint64_t v8 = result[1];
  result[1] = a2[2];
  a2[2] = v8;
  uint64_t v9 = result[2];
  result[2] = a2[3];
  a2[3] = v9;
  *a2 = a2[1];
  return result;
}

uint64_t sub_25C13C958(uint64_t a1)
{
  uint64_t v3 = *(void ***)(a1 + 8);
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != v3)
  {
    do
    {
      uint64_t v4 = v2 - 3;
      *(void *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v4);
        uint64_t v4 = *(void ***)(a1 + 16);
      }
      uint64_t v2 = v4;
    }
    while (v4 != v3);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_25C13C9BC(uint64_t *a1)
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

char *sub_25C13CA0C(void *a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    sub_25C137658();
  }
  uint64_t result = (char *)sub_25C137670(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void *sub_25C13CA74(unint64_t a1)
{
  if (a1 >> 60) {
    sub_25C1376B8();
  }
  return operator new(16 * a1);
}

uint64_t sub_25C13CAAC(uint64_t a1)
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
  MEMORY[0x26117F430](a1 + 112);
  return a1;
}

uint64_t sub_25C13CBB0()
{
  return 0;
}

uint64_t sub_25C13CBB8()
{
  return 0;
}

unsigned char *sub_25C13CBC0@<X0>(void *a1@<X8>)
{
  char v9 = 0;
  uint64_t v2 = sub_25C136E68(MEMORY[0x263F8C0F8], (uint64_t)"model_interface.h", 17);
  sub_25C136E68(v2, (uint64_t)"(", 1);
  uint64_t v3 = (void *)std::ostream::operator<<();
  uint64_t v4 = sub_25C136E68(v3, (uint64_t)") ", 2);
  uint64_t v5 = sub_25C136E68(v4, (uint64_t)"LOG(", 4);
  long long v6 = sub_25C136E68(v5, (uint64_t)"ERROR", 5);
  uint64_t v7 = sub_25C136E68(v6, (uint64_t)") ", 2);
  sub_25C136E68(v7, (uint64_t)"Not implemented.", 16);
  uint64_t result = sub_25C137184(&v9);
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  return result;
}

void sub_25C13CC7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12, char a13)
{
}

void sub_25C13CC90(uint64_t **a1@<X0>, unsigned char *a2@<X1>, uint64_t a3@<X2>, char **a4@<X8>)
{
  ((void (*)(uint64_t *__return_ptr))(*a1)[2])(&v23);
  uint64_t v8 = v23;
  if (v23)
  {
    uint64_t v23 = 0;
    sub_25C13D850(v8);
LABEL_3:
    *a4 = 0;
    a4[1] = 0;
    a4[2] = 0;
    return;
  }
  if (!a3) {
    goto LABEL_3;
  }
  char v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  *a4 = 0;
  a4[1] = 0;
  a4[2] = 0;
  do
  {
    uint64_t v12 = (int)sub_25C14A790(*a1[2], a2, a3, 0);
    int v13 = ((uint64_t (*)(uint64_t **, unsigned char *, uint64_t))(*a1)[14])(a1, a2, v12);
    int v14 = v13;
    if (v11 >= v10)
    {
      unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * ((v11 - v9) >> 3) + 1;
      if (v15 > 0xAAAAAAAAAAAAAAALL) {
        sub_25C137658();
      }
      if (0x5555555555555556 * ((v10 - v9) >> 3) > v15) {
        unint64_t v15 = 0x5555555555555556 * ((v10 - v9) >> 3);
      }
      if (0xAAAAAAAAAAAAAAABLL * ((v10 - v9) >> 3) >= 0x555555555555555) {
        unint64_t v16 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v16 = v15;
      }
      BOOL v17 = (char *)sub_25C137670(v16);
      unint64_t v19 = &v17[8 * ((v11 - v9) >> 3)];
      *(void *)unint64_t v19 = a2;
      *((void *)v19 + 1) = v12;
      *((_DWORD *)v19 + 4) = v14;
      if (v11 == v9)
      {
        unint64_t v21 = &v17[8 * ((v11 - v9) >> 3)];
      }
      else
      {
        int v20 = &v17[8 * ((v11 - v9) >> 3)];
        do
        {
          unint64_t v21 = v20 - 24;
          long long v22 = *(_OWORD *)(v11 - 24);
          *((void *)v20 - 1) = *((void *)v11 - 1);
          *(_OWORD *)(v20 - 24) = v22;
          v11 -= 24;
          v20 -= 24;
        }
        while (v11 != v9);
      }
      uint64_t v10 = &v17[24 * v18];
      uint64_t v11 = v19 + 24;
      *a4 = v21;
      a4[1] = v19 + 24;
      a4[2] = v10;
      if (v9) {
        operator delete(v9);
      }
      char v9 = v21;
    }
    else
    {
      *(void *)uint64_t v11 = a2;
      *((void *)v11 + 1) = v12;
      *((_DWORD *)v11 + 4) = v13;
      v11 += 24;
    }
    a4[1] = v11;
    a2 += v12;
    a3 -= v12;
  }
  while (a3);
}

void sub_25C13CE84(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_25C13CEA4(void *a1)
{
  sub_25C147FF4(a1);

  JUMPOUT(0x26117F4A0);
}

_OWORD *sub_25C13CEE0(uint64_t a1, int a2)
{
  LODWORD(v2) = a2;
  uint64_t v4 = (_OWORD *)(a1 + 16);
  unint64_t v5 = a1 + 32;
  while (!*(unsigned char *)(a1 + 56))
  {
    long long v6 = *(char **)a1;
    if (*(void *)(a1 + 48))
    {
      uint64_t v7 = *(void **)(a1 + 8);
      if (!v7)
      {
        *uint64_t v4 = *(_OWORD *)v6;
        *(void *)(a1 + 8) = v6;
        goto LABEL_11;
      }
      memcpy(v7, v4, v6 - (char *)v4);
      int v14 = 0;
      while (1)
      {
        int v13 = 0;
        if (((*(uint64_t (**)(void, _OWORD **, int *))(**(void **)(a1 + 48) + 16))(*(void *)(a1 + 48), &v13, &v14) & 1) == 0)break; {
        uint64_t v8 = v14;
        }
        if (v14)
        {
          char v9 = v13;
          uint64_t v10 = *(char **)a1;
          if (v14 >= 17)
          {
            *int v13 = *(_OWORD *)v10;
            unint64_t v11 = (unint64_t)v9 + v8 - 16;
            *(void *)a1 = v11;
            *(void *)(a1 + 8) = 0;
            goto LABEL_13;
          }
          *uint64_t v4 = *(_OWORD *)v10;
          unint64_t v11 = (unint64_t)v4 + (int)v8;
          *(void *)a1 = v11;
          *(void *)(a1 + 8) = v9;
          goto LABEL_12;
        }
      }
    }
    *(unsigned char *)(a1 + 56) = 1;
LABEL_11:
    *(void *)a1 = v5;
    unint64_t v11 = v5;
LABEL_12:
    char v9 = v4;
LABEL_13:
    unint64_t v2 = (unint64_t)v9 + (int)v2 - (int)v6;
    if (v2 < v11) {
      return (_OWORD *)v2;
    }
  }
  return v4;
}

uint64_t sub_25C13D00C(_DWORD *a1, char *__src, int a3, _OWORD *__dst)
{
  uint64_t v4 = __dst;
  int v5 = a3;
  int v7 = *a1 - __dst + 16;
  if (v7 < a3)
  {
    do
    {
      memcpy(v4, __src, v7);
      v5 -= v7;
      __src += v7;
      uint64_t v4 = sub_25C13CEE0((uint64_t)a1, (int)v4 + v7);
      int v7 = *a1 - v4 + 16;
    }
    while (v5 > v7);
  }
  memcpy(v4, __src, v5);
  return (uint64_t)v4 + v5;
}

char *sub_25C13D0AC(uint64_t a1, unsigned int a2, void *a3, unsigned char *a4)
{
  if (*(void *)a1 <= (unint64_t)a4) {
    a4 = sub_25C13CEE0(a1, (int)a4);
  }
  if (*((char *)a3 + 23) >= 0) {
    uint64_t v7 = *((unsigned __int8 *)a3 + 23);
  }
  else {
    uint64_t v7 = a3[1];
  }
  unsigned int v8 = (8 * a2) | 2;
  if (v8 >= 0x80)
  {
    LOBYTE(v8) = (8 * a2) | 0x82;
    a4[1] = a2 >> 4;
    uint64_t v9 = 2;
  }
  else
  {
    uint64_t v9 = 1;
  }
  uint64_t v10 = &a4[v9];
  *a4 = v8;
  if (v7 >= 0x80)
  {
    unsigned int v24 = v7;
    do
    {
      *v10++ = v24 | 0x80;
      unsigned int v11 = v24 >> 7;
      unsigned int v25 = v24 >> 14;
      v24 >>= 7;
    }
    while (v25);
  }
  else
  {
    LOBYTE(v11) = v7;
  }
  unsigned char *v10 = v11;
  uint64_t v12 = v10 + 1;
  if (*((char *)a3 + 23) < 0) {
    a3 = (void *)*a3;
  }
  if (!*(unsigned char *)(a1 + 57))
  {
    if (*(void *)a1 - (void)v12 >= (int)v7) {
      goto LABEL_16;
    }
    goto LABEL_45;
  }
  unint64_t v13 = *(void *)a1;
  uint64_t v14 = *(void *)a1 - (void)v12;
  if (v14 + 16 <= (int)v7)
  {
    if (*(unsigned char *)(a1 + 56))
    {
      unint64_t v15 = v12;
      goto LABEL_39;
    }
    unint64_t v15 = (char *)(a1 + 16);
    unint64_t v16 = *(void **)(a1 + 8);
LABEL_22:
    if (v16)
    {
      int v17 = v12 - v13;
      if ((unint64_t)v12 > v13)
      {
        if (*(void *)(a1 + 48))
        {
          memcpy(v16, (const void *)(a1 + 16), v13 - (void)v15);
          int v27 = 0;
          while (1)
          {
            uint64_t v26 = 0;
            if (((*(uint64_t (**)(void, _OWORD **, int *))(**(void **)(a1 + 48) + 16))(*(void *)(a1 + 48), &v26, &v27) & 1) == 0)break; {
            uint64_t v18 = v27;
            }
            if (v27)
            {
              unint64_t v19 = v26;
              int v20 = *(_OWORD **)a1;
              if (v27 < 17)
              {
                *(_OWORD *)unint64_t v15 = *v20;
                unint64_t v13 = (unint64_t)&v15[(int)v18];
                unint64_t v16 = v19;
                unint64_t v19 = (_OWORD *)(a1 + 16);
              }
              else
              {
                unint64_t v16 = 0;
                *uint64_t v26 = *v20;
                unint64_t v13 = (unint64_t)v19 + v18 - 16;
              }
              *(void *)a1 = v13;
              *(void *)(a1 + 8) = v16;
              uint64_t v12 = (char *)v19 + v17;
              if (!*(unsigned char *)(a1 + 56)) {
                goto LABEL_22;
              }
              goto LABEL_38;
            }
          }
        }
        *(unsigned char *)(a1 + 56) = 1;
        goto LABEL_38;
      }
      memcpy(v16, (const void *)(a1 + 16), v12 - v15);
      unint64_t v22 = *(void *)a1;
      *(void *)(a1 + 8) += v12 - v15;
      int v21 = v22 - v12;
    }
    else
    {
      int v21 = v13 - v12 + 16;
      *(void *)(a1 + 8) = v12;
    }
    if (v21) {
      (*(void (**)(void))(**(void **)(a1 + 48) + 24))(*(void *)(a1 + 48));
    }
LABEL_38:
    *(void *)a1 = v15;
    *(void *)(a1 + 8) = v15;
LABEL_39:
    if (((*(uint64_t (**)(void, void *, uint64_t))(**(void **)(a1 + 48) + 40))(*(void *)(a1 + 48), a3, v7) & 1) == 0)
    {
      *(unsigned char *)(a1 + 56) = 1;
      unint64_t v15 = (char *)(a1 + 16);
      *(void *)a1 = a1 + 32;
    }
    return v15;
  }
  if (v14 >= (int)v7)
  {
LABEL_16:
    memcpy(v12, a3, (int)v7);
    return &v12[(int)v7];
  }
LABEL_45:

  return (char *)sub_25C13D00C((_DWORD *)a1, (char *)a3, v7, v12);
}

uint64_t sub_25C13D3B8(_DWORD *a1, int a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v4 = a4;
  if (*(void *)a1 <= (unint64_t)a4) {
    uint64_t v4 = sub_25C13CEE0((uint64_t)a1, (int)a4);
  }
  if (*(char *)(a3 + 23) >= 0) {
    LODWORD(v8) = *(unsigned __int8 *)(a3 + 23);
  }
  else {
    uint64_t v8 = *(void *)(a3 + 8);
  }
  unsigned int v9 = (8 * a2) | 2;
  if (v9 > 0x7F)
  {
    *uint64_t v4 = (8 * a2) | 0x82;
    unsigned int v11 = (8 * a2) >> 7;
    if (v9 >> 14)
    {
      uint64_t v12 = v4 + 1;
      do
      {
        unint64_t v13 = v12;
        *v12++ = v11 | 0x80;
        unsigned int v14 = v11 >> 7;
        unsigned int v15 = v11 >> 14;
        v11 >>= 7;
      }
      while (v15);
      uint64_t v10 = v13 + 2;
      *uint64_t v12 = v14;
    }
    else
    {
      v4[1] = v11;
      uint64_t v10 = v4 + 2;
    }
  }
  else
  {
    *uint64_t v4 = v9;
    uint64_t v10 = v4 + 1;
  }
  if (v8 >= 0x80)
  {
    unsigned int v21 = v8;
    do
    {
      *v10++ = v21 | 0x80;
      unsigned int v16 = v21 >> 7;
      unsigned int v22 = v21 >> 14;
      v21 >>= 7;
    }
    while (v22);
  }
  else
  {
    LOBYTE(v16) = v8;
  }
  unsigned char *v10 = v16;
  int v17 = v10 + 1;
  if (*(char *)(a3 + 23) >= 0) {
    uint64_t v18 = (char *)a3;
  }
  else {
    uint64_t v18 = *(char **)a3;
  }
  if (*(void *)a1 - (void)v17 < (int)v8)
  {
    return sub_25C13D00C(a1, v18, v8, v17);
  }
  else
  {
    uint64_t v19 = (int)v8;
    memcpy(v17, v18, (int)v8);
    return (uint64_t)v17 + v19;
  }
}

uint64_t sub_25C13D510(uint64_t a1)
{
  uint64_t result = a1 + 24;
  if (*(char *)(a1 + 47) < 0) {
    return *(void *)result;
  }
  return result;
}

void sub_25C13D52C(std::exception *a1)
{
  sub_25C13D564(a1);

  JUMPOUT(0x26117F4A0);
}

void sub_25C13D564(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&unk_27098A040;
  if (SHIBYTE(this[5].__vftable) < 0) {
    operator delete(this[3].__vftable);
  }

  std::exception::~exception(this);
}

uint64_t sub_25C13D5C8(uint64_t a1, uint64_t a2, int a3, long long *a4)
{
  *(void *)a1 = &unk_27098A040;
  *(void *)(a1 + 8) = a2;
  *(_DWORD *)(a1 + 16) = a3;
  uint64_t v5 = a1 + 24;
  if (*((char *)a4 + 23) < 0)
  {
    sub_25C1367DC((unsigned char *)v5, *(void **)a4, *((void *)a4 + 1));
  }
  else
  {
    long long v6 = *a4;
    *(void *)(v5 + 16) = *((void *)a4 + 2);
    *(_OWORD *)uint64_t v5 = v6;
  }
  return a1;
}

void sub_25C13D634(_Unwind_Exception *a1)
{
  std::exception::~exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_25C13D648(uint64_t result, const char *a2, int a3, uint64_t a4)
{
  if ((result & 0x80000000) == 0)
  {
    uint64_t v4 = (FILE **)MEMORY[0x263EF8348];
    if (*(char *)(a4 + 23) >= 0) {
      uint64_t v5 = (const char *)a4;
    }
    else {
      uint64_t v5 = *(const char **)a4;
    }
    fprintf((FILE *)*MEMORY[0x263EF8348], "[libprotobuf %s %s:%d] %s\n", (&off_2654AE1E8)[result], a2, a3, v5);
    long long v6 = *v4;
    return fflush(v6);
  }
  return result;
}

uint64_t sub_25C13D6C8(unsigned int *a1)
{
  uint64_t result = sub_25C13D648(*a1, *((const char **)a1 + 1), a1[4], (uint64_t)(a1 + 6));
  if (*a1 == 3)
  {
    exception = __cxa_allocate_exception(0x30uLL);
    sub_25C13D5C8((uint64_t)exception, *((void *)a1 + 1), a1[4], (long long *)(a1 + 6));
    __cxa_throw(exception, (struct type_info *)&unk_270989228, (void (*)(void *))sub_25C13D5C4);
  }
  return result;
}

void sub_25C13D750(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_25C13D764()
{
  v0 = sub_25C13D780();
  sub_25C13D798(v0);
  exit(-1);
}

void *sub_25C13D780()
{
  return sub_25C136E68(MEMORY[0x263F8C0F8], (uint64_t)"Program terminated with an unrecoverable error.", 47);
}

void *sub_25C13D798(void *a1)
{
  std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
  unint64_t v2 = std::locale::use_facet(&v4, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v2->__vftable[2].~facet_0)(v2, 10);
  std::locale::~locale(&v4);
  std::ostream::put();
  std::ostream::flush();
  return a1;
}

void sub_25C13D83C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
}

void sub_25C13D850(uint64_t a1)
{
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*(void **)(a1 + 8));
  }

  JUMPOUT(0x26117F4A0);
}

void sub_25C13D8A4()
{
}

void sub_25C13D9AC(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *v1;
  *uint64_t v1 = 0;
  if (v3) {
    sub_25C13D850(v3);
  }
  _Unwind_Resume(exception_object);
}

void *sub_25C13D9C8(void *result, void *a2)
{
  if (*a2) {
    operator new();
  }
  unsigned char *result = 0;
  return result;
}

void sub_25C13DA58(_Unwind_Exception *a1)
{
  MEMORY[0x26117F4A0](v1, 0x1012C40849EBCB1);
  _Unwind_Resume(a1);
}

void sub_25C13DA7C(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  if (v3 != *a2)
  {
    if (*a2) {
      operator new();
    }
    *a1 = 0;
    if (v3)
    {
      sub_25C13D850(v3);
    }
  }
}

void sub_25C13DB3C(_Unwind_Exception *a1)
{
  MEMORY[0x26117F4A0](v1, 0x1012C40849EBCB1);
  _Unwind_Resume(a1);
}

uint64_t sub_25C13DB60()
{
  return 0;
}

void sub_25C13DB68()
{
}

uint64_t sub_25C13DB80(uint64_t a1)
{
  if (!*(void *)a1)
  {
    uint64_t v2 = *(void *)(a1 + 16);
    if (*(unsigned __int16 *)(a1 + 8) >= 0x101u)
    {
      sub_25C13DC50(*(int **)v2, (int *)(v2 + 8));
    }
    else if (*(_WORD *)(a1 + 10))
    {
      uint64_t v3 = 32 * *(unsigned __int16 *)(a1 + 10);
      std::locale v4 = (int *)(v2 + 8);
      do
      {
        sub_25C13DCC0(v4);
        v4 += 8;
        v3 -= 32;
      }
      while (v3);
    }
    uint64_t v5 = *(void *)(a1 + 16);
    if (*(unsigned __int16 *)(a1 + 8) >= 0x101u)
    {
      if (v5)
      {
        sub_25C13DEA0(*(void **)(v5 + 8));
        MEMORY[0x26117F4A0](v5, 0x1020C4062D53EE8);
      }
    }
    else if (v5)
    {
      MEMORY[0x26117F470](*(void *)(a1 + 16), 0x1062C802AB6010CLL);
    }
  }
  return a1;
}

int *sub_25C13DC50(int *result, int *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    do
    {
      uint64_t result = sub_25C13DCC0(v3 + 10);
      std::locale v4 = (int *)*((void *)v3 + 1);
      if (v4)
      {
        do
        {
          uint64_t v5 = v4;
          std::locale v4 = *(int **)v4;
        }
        while (v4);
      }
      else
      {
        do
        {
          uint64_t v5 = (int *)*((void *)v3 + 2);
          BOOL v6 = *(void *)v5 == (void)v3;
          uint64_t v3 = v5;
        }
        while (!v6);
      }
      uint64_t v3 = v5;
    }
    while (v5 != a2);
  }
  return result;
}

int *sub_25C13DCC0(int *result)
{
  int v1 = dword_25C16E5EC[*((unsigned __int8 *)result + 8)];
  if (*((unsigned char *)result + 9))
  {
    switch(*((unsigned char *)result + 8))
    {
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 0xD:
      case 0xE:
      case 0xF:
      case 0x10:
      case 0x11:
      case 0x12:
        uint64_t v2 = *(int **)result;
        if (!*(void *)result) {
          return result;
        }
        if (v2[1] >= 1)
        {
          uint64_t v3 = (void *)*((void *)v2 + 1);
          uint64_t v5 = *(v3 - 1);
          std::locale v4 = v3 - 1;
          if (!v5) {
            operator delete(v4);
          }
        }
        break;
      case 9:
      case 0xC:
        uint64_t result = *(int **)result;
        if (!result) {
          return result;
        }
        sub_25C14C2D4(result);
        break;
      case 0xA:
      case 0xB:
        if (!*(void *)result) {
          return result;
        }
        sub_25C13DEEC(*(void **)result);
        break;
      default:
        return result;
    }
    goto LABEL_27;
  }
  if (v1 == 10)
  {
    char v7 = *((unsigned char *)result + 10);
    uint64_t result = *(int **)result;
    if ((v7 & 0x10) != 0)
    {
      if (!result) {
        return result;
      }
      uint64_t v8 = *(uint64_t (**)(void))(*(void *)result + 8);
    }
    else
    {
      if (!result) {
        return result;
      }
      uint64_t v8 = *(uint64_t (**)(void))(*(void *)result + 8);
    }
    return (int *)v8();
  }
  if (v1 == 9)
  {
    BOOL v6 = *(int **)result;
    if (*(void *)result)
    {
      if (*((char *)v6 + 23) < 0) {
        operator delete(*(void **)v6);
      }
LABEL_27:
      JUMPOUT(0x26117F4A0);
    }
  }
  return result;
}

void sub_25C13DEA0(void *a1)
{
  if (a1)
  {
    sub_25C13DEA0(*a1);
    sub_25C13DEA0(a1[1]);
    operator delete(a1);
  }
}

void sub_25C13DEEC(void *a1)
{
  uint64_t v2 = (unsigned int *)a1[2];
  if (v2 && !*a1)
  {
    uint64_t v3 = v2 + 2;
    uint64_t v4 = *v2;
    if ((int)v4 >= 1)
    {
      do
      {
        if (*v3) {
          (*(void (**)(void))(*(void *)*v3 + 8))(*v3);
        }
        ++v3;
        --v4;
      }
      while (v4);
      uint64_t v2 = (unsigned int *)a1[2];
    }
    operator delete(v2);
  }
  a1[2] = 0;
}

unsigned char *sub_25C13DF78(unsigned char *result)
{
  int v1 = result;
  if (result[9])
  {
    switch(result[8])
    {
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 0xD:
      case 0xE:
      case 0xF:
      case 0x10:
      case 0x11:
      case 0x12:
        **(_DWORD **)uint64_t result = 0;
        break;
      case 9:
      case 0xC:
        uint64_t v5 = *(_DWORD **)result;
        uint64_t result = (unsigned char *)sub_25C13E13C((uint64_t)v5);
        break;
      case 0xA:
      case 0xB:
        BOOL v6 = *(_DWORD **)result;
        uint64_t v7 = *(unsigned int *)(*(void *)result + 8);
        if ((int)v7 >= 1)
        {
          uint64_t v8 = (uint64_t *)(*((void *)v6 + 2) + 8);
          do
          {
            uint64_t v9 = *v8++;
            uint64_t result = (unsigned char *)(*(uint64_t (**)(uint64_t))(*(void *)v9 + 40))(v9);
            --v7;
          }
          while (v7);
          void v6[2] = 0;
        }
        break;
      default:
        return result;
    }
  }
  else if ((result[10] & 1) == 0)
  {
    int v2 = dword_25C16E5EC[result[8]];
    if (v2 == 10)
    {
      uint64_t v4 = **(void **)result;
      if ((result[10] & 0x10) != 0) {
        uint64_t result = (unsigned char *)(*(uint64_t (**)(void))(v4 + 112))();
      }
      else {
        uint64_t result = (unsigned char *)(*(uint64_t (**)(void))(v4 + 40))();
      }
    }
    else if (v2 == 9)
    {
      uint64_t v3 = *(void **)result;
      if (*(char *)(*(void *)result + 23) < 0)
      {
        *(unsigned char *)void *v3 = 0;
        v3[1] = 0;
      }
      else
      {
        *(unsigned char *)uint64_t v3 = 0;
        *((unsigned char *)v3 + 23) = 0;
      }
    }
    v1[10] = v1[10] & 0xF0 | 1;
  }
  return result;
}

uint64_t sub_25C13E13C(uint64_t result)
{
  uint64_t v1 = *(unsigned int *)(result + 8);
  if ((int)v1 >= 1)
  {
    uint64_t v2 = *(void *)(result + 16) + 8;
    do
    {
      uint64_t v3 = *(void *)v2;
      if (*(char *)(*(void *)v2 + 23) < 0)
      {
        **(unsigned char **)uint64_t v3 = 0;
        *(void *)(v3 + 8) = 0;
      }
      else
      {
        *(unsigned char *)uint64_t v3 = 0;
        *(unsigned char *)(v3 + 23) = 0;
      }
      v2 += 8;
      --v1;
    }
    while (v1);
    *(_DWORD *)(result + 8) = 0;
  }
  return result;
}

uint64_t **sub_25C13E188(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(unsigned __int16 *)(a1 + 8);
  uint64_t v4 = *(uint64_t ***)(a1 + 16);
  if (v3 >= 0x101)
  {
    *((void *)&v14 + 1) = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    LODWORD(v14) = a2;
    return sub_25C13E2D4(v4, a2, &v14) + 5;
  }
  uint64_t v6 = *(unsigned __int16 *)(a1 + 10);
  uint64_t v7 = &v4[4 * v6];
  if (!*(_WORD *)(a1 + 10))
  {
    if (!*(_WORD *)(a1 + 8)) {
      goto LABEL_18;
    }
    LOWORD(v6) = 0;
LABEL_17:
    *(_WORD *)(a1 + 10) = v6 + 1;
    *(_DWORD *)uint64_t v7 = a2;
    v7[1] = 0;
    uint64_t result = v7 + 1;
    v7[2] = 0;
    v7[3] = 0;
    return result;
  }
  unint64_t v8 = *(unsigned __int16 *)(a1 + 10);
  do
  {
    unint64_t v9 = v8 >> 1;
    uint64_t v10 = (int *)&v4[4 * (v8 >> 1)];
    int v12 = *v10;
    unsigned int v11 = (uint64_t **)(v10 + 8);
    v8 += ~(v8 >> 1);
    if (v12 < (int)a2) {
      uint64_t v4 = v11;
    }
    else {
      unint64_t v8 = v9;
    }
  }
  while (v8);
  if (v4 != v7)
  {
    if (*(_DWORD *)v4 == a2) {
      return v4 + 1;
    }
    if (v6 < v3)
    {
      memmove(v4 + 4, v4, (char *)v7 - (char *)v4);
      LOWORD(v6) = *(_WORD *)(a1 + 10);
      uint64_t v7 = v4;
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  if (v6 < v3) {
    goto LABEL_17;
  }
LABEL_18:
  sub_25C13E388((void *)a1, v6 + 1);
  return (uint64_t **)sub_25C13E188(a1, a2);
}

uint64_t **sub_25C13E2D4(uint64_t **a1, int a2, _OWORD *a3)
{
  uint64_t v6 = a1 + 1;
  uint64_t v5 = a1[1];
  if (v5)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v7 = (uint64_t **)v5;
        int v8 = *((_DWORD *)v5 + 8);
        if (v8 <= a2) {
          break;
        }
        uint64_t v5 = *v7;
        uint64_t v6 = v7;
        if (!*v7) {
          goto LABEL_9;
        }
      }
      if (v8 >= a2) {
        break;
      }
      uint64_t v5 = v7[1];
      if (!v5)
      {
        uint64_t v6 = v7 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
    uint64_t v7 = a1 + 1;
LABEL_9:
    unint64_t v9 = (uint64_t *)operator new(0x40uLL);
    long long v10 = a3[1];
    *((_OWORD *)v9 + 2) = *a3;
    *((_OWORD *)v9 + 3) = v10;
    sub_25C13E778(a1, (uint64_t)v7, v6, v9);
    return (uint64_t **)v9;
  }
  return v7;
}

void *sub_25C13E388(void *result, unint64_t a2)
{
  unint64_t v2 = *((unsigned __int16 *)result + 4);
  if (v2 <= 0x100 && v2 < a2)
  {
    uint64_t v4 = result;
    do
    {
      if ((_WORD)v2) {
        LOWORD(v2) = 4 * v2;
      }
      else {
        LOWORD(v2) = 1;
      }
    }
    while ((unsigned __int16)v2 < a2);
    uint64_t v5 = (char *)result[2];
    uint64_t v6 = *((unsigned __int16 *)result + 5);
    uint64_t v7 = (uint64_t *)*result;
    if ((unsigned __int16)v2 < 0x101u)
    {
      unint64_t v8 = 32 * (unsigned __int16)v2;
      if (v7)
      {
        if (v7[3]) {
          (*(void (**)(void, void *, unint64_t))(**(void **)(v7[4] + 32) + 40))(*(void *)(v7[4] + 32), &unk_270989290, v8);
        }
        uint64_t result = sub_25C1363A0(v7, v8);
      }
      else
      {
        uint64_t result = operator new[](32 * (unsigned __int16)v2);
      }
      unint64_t v9 = (uint64_t **)result;
      if (v6) {
        uint64_t result = memmove(result, v5, 32 * v6);
      }
    }
    else
    {
      if (!v7) {
        operator new();
      }
      if (v7[3]) {
        (*(void (**)(void, void *, uint64_t))(**(void **)(v7[4] + 32) + 40))(*(void *)(v7[4] + 32), &unk_270989398, 24);
      }
      uint64_t result = sub_25C1360BC(v7, 0x18uLL, (uint64_t)sub_25C13E7D0);
      unint64_t v9 = (uint64_t **)result;
      result[1] = 0;
      uint64_t v10 = (uint64_t)(result + 1);
      result[2] = 0;
      unsigned char *result = result + 1;
      if (v6)
      {
        unsigned int v30 = v5;
        BOOL v31 = v4;
        unsigned int v11 = &v5[32 * v6];
        int v12 = result + 1;
        unint64_t v13 = v5;
        while (1)
        {
          int v14 = *(_DWORD *)v13;
          *(_OWORD *)&v32[4] = *(_OWORD *)(v13 + 8);
          *(void *)&v32[20] = *((void *)v13 + 3);
          if (v12 == (uint64_t *)v10 || (int v15 = *(_DWORD *)(v10 + 32), v14 < v15))
          {
            uint64_t v16 = *(void *)v10;
            uint64_t v17 = v10;
            if (*v9 == (uint64_t *)v10) {
              goto LABEL_30;
            }
            uint64_t v18 = *(void *)v10;
            uint64_t v19 = v10;
            if (v16)
            {
              do
              {
                uint64_t v17 = v18;
                uint64_t v18 = *(void *)(v18 + 8);
              }
              while (v18);
            }
            else
            {
              do
              {
                uint64_t v17 = *(void *)(v19 + 16);
                BOOL v20 = *(void *)v17 == v19;
                uint64_t v19 = v17;
              }
              while (v20);
            }
            if (*(_DWORD *)(v17 + 32) < v14)
            {
LABEL_30:
              if (v16) {
                unsigned int v21 = (uint64_t **)(v17 + 8);
              }
              else {
                unsigned int v21 = (uint64_t **)v10;
              }
              if (v16) {
                uint64_t v10 = v17;
              }
            }
            else
            {
              uint64_t v25 = *v12;
              unsigned int v21 = v9 + 1;
              uint64_t v10 = (uint64_t)(v9 + 1);
              if (!*v12) {
                goto LABEL_61;
              }
              unsigned int v21 = v9 + 1;
              while (1)
              {
                while (1)
                {
                  uint64_t v10 = v25;
                  int v26 = *(_DWORD *)(v25 + 32);
                  if (v14 >= v26) {
                    break;
                  }
                  uint64_t v25 = *(void *)v10;
                  unsigned int v21 = (uint64_t **)v10;
                  if (!*(void *)v10) {
                    goto LABEL_61;
                  }
                }
                if (v26 >= v14) {
                  break;
                }
                unsigned int v21 = (uint64_t **)(v10 + 8);
                uint64_t v25 = *(void *)(v10 + 8);
                if (!v25) {
                  goto LABEL_61;
                }
              }
            }
          }
          else
          {
            if (v15 >= v14)
            {
              unsigned int v22 = (uint64_t *)v10;
              goto LABEL_62;
            }
            unsigned int v21 = (uint64_t **)(v10 + 8);
            uint64_t v23 = *(uint64_t **)(v10 + 8);
            if (v23)
            {
              do
              {
                unsigned int v21 = (uint64_t **)v23;
                uint64_t v23 = (uint64_t *)*v23;
                uint64_t v10 = (uint64_t)v21;
                uint64_t v24 = (uint64_t)v21;
              }
              while (v23);
            }
            else
            {
              uint64_t v24 = v10;
              do
              {
                uint64_t v27 = v24;
                uint64_t v24 = *(void *)(v24 + 16);
              }
              while (*(void *)v24 != v27);
            }
            if ((uint64_t *)v24 != v12 && v14 >= *(_DWORD *)(v24 + 32))
            {
              uint64_t v28 = *v12;
              unsigned int v21 = v9 + 1;
              uint64_t v10 = (uint64_t)(v9 + 1);
              if (!*v12)
              {
LABEL_61:
                unsigned int v22 = (uint64_t *)operator new(0x40uLL);
                *((_DWORD *)v22 + 8) = v14;
                *(_OWORD *)((char *)v22 + 36) = *(_OWORD *)v32;
                *((_OWORD *)v22 + 3) = *(_OWORD *)&v32[12];
                uint64_t result = sub_25C13E778(v9, v10, v21, v22);
                goto LABEL_62;
              }
              unsigned int v21 = v9 + 1;
              while (1)
              {
                while (1)
                {
                  uint64_t v10 = v28;
                  int v29 = *(_DWORD *)(v28 + 32);
                  if (v14 >= v29) {
                    break;
                  }
                  uint64_t v28 = *(void *)v10;
                  unsigned int v21 = (uint64_t **)v10;
                  if (!*(void *)v10) {
                    goto LABEL_61;
                  }
                }
                if (v29 >= v14) {
                  break;
                }
                unsigned int v21 = (uint64_t **)(v10 + 8);
                uint64_t v28 = *(void *)(v10 + 8);
                if (!v28) {
                  goto LABEL_61;
                }
              }
            }
          }
          unsigned int v22 = *v21;
          if (!*v21) {
            goto LABEL_61;
          }
LABEL_62:
          v13 += 32;
          uint64_t v10 = (uint64_t)v22;
          if (v13 == v11)
          {
            uint64_t v5 = v30;
            uint64_t v4 = v31;
            break;
          }
        }
      }
    }
    if (!*v4 && v5) {
      uint64_t result = (void *)MEMORY[0x26117F470](v5, 0x1062C802AB6010CLL);
    }
    *((_WORD *)v4 + 4) = v2;
    v4[2] = v9;
    if ((unsigned __int16)v2 >= 0x101u) {
      *((_WORD *)v4 + 5) = 0;
    }
  }
  return result;
}

uint64_t *sub_25C13E778(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
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
  uint64_t result = sub_25C13C3AC(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

void sub_25C13E7D0(uint64_t a1)
{
}

void sub_25C13E7D8(uint64_t *a1, uint64_t a2, char a3, char a4, int a5, uint64_t *a6)
{
  unsigned int v11 = sub_25C13E188((uint64_t)a1, a2);
  int v12 = v11;
  v11[2] = a6;
  if (v13)
  {
    *((unsigned char *)v11 + 8) = a3;
    *((unsigned char *)v11 + 9) = 1;
    *((unsigned char *)v11 + 11) = a4;
    uint64_t v14 = *a1;
    if (!v14) {
      operator new();
    }
    if (*(unsigned char *)(v14 + 24)) {
      (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v14 + 32) + 32) + 40))(*(void *)(*(void *)(v14 + 32) + 32), &unk_2709891E8, 16);
    }
    int v15 = (unsigned int *)sub_25C1360BC((void *)v14, 0x10uLL, (uint64_t)sub_25C13E914);
    *(void *)int v15 = 0;
    *((void *)v15 + 1) = v14;
    *int v12 = (uint64_t *)v15;
  }
  else
  {
    int v15 = (unsigned int *)*v11;
  }
  uint64_t v16 = *v15;
  if (v16 == v15[1])
  {
    unsigned int v17 = v16 + 1;
    sub_25C14BEC0(v15, v16 + 1);
    *(_DWORD *)(*((void *)v15 + 1) + 4 * v16) = a5;
  }
  else
  {
    *(_DWORD *)(*((void *)v15 + 1) + 4 * v16) = a5;
    unsigned int v17 = v16 + 1;
  }
  *int v15 = v17;
}

void sub_25C13E914(uint64_t a1)
{
  if (*(int *)(a1 + 4) >= 1)
  {
    uint64_t v1 = *(void *)(a1 + 8);
    uint64_t v3 = *(void *)(v1 - 8);
    unint64_t v2 = (void *)(v1 - 8);
    if (!v3) {
      operator delete(v2);
    }
  }
}

void sub_25C13E934(uint64_t *a1, uint64_t a2, char a3, char a4, uint64_t a5, uint64_t *a6)
{
  unsigned int v11 = sub_25C13E188((uint64_t)a1, a2);
  int v12 = v11;
  v11[2] = a6;
  if (v13)
  {
    *((unsigned char *)v11 + 8) = a3;
    *((unsigned char *)v11 + 9) = 1;
    *((unsigned char *)v11 + 11) = a4;
    uint64_t v14 = *a1;
    if (!v14) {
      operator new();
    }
    if (*(unsigned char *)(v14 + 24)) {
      (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v14 + 32) + 32) + 40))(*(void *)(*(void *)(v14 + 32) + 32), &unk_270989208, 16);
    }
    int v15 = (unsigned int *)sub_25C1360BC((void *)v14, 0x10uLL, (uint64_t)sub_25C13EA70);
    *(void *)int v15 = 0;
    *((void *)v15 + 1) = v14;
    *int v12 = (uint64_t *)v15;
  }
  else
  {
    int v15 = (unsigned int *)*v11;
  }
  uint64_t v16 = *v15;
  if (v16 == v15[1])
  {
    unsigned int v17 = v16 + 1;
    sub_25C14C038(v15, v16 + 1);
    *(void *)(*((void *)v15 + 1) + 8 * v16) = a5;
  }
  else
  {
    *(void *)(*((void *)v15 + 1) + 8 * v16) = a5;
    unsigned int v17 = v16 + 1;
  }
  *int v15 = v17;
}

void sub_25C13EA70(uint64_t a1)
{
  if (*(int *)(a1 + 4) >= 1)
  {
    uint64_t v1 = *(void *)(a1 + 8);
    uint64_t v3 = *(void *)(v1 - 8);
    unint64_t v2 = (void *)(v1 - 8);
    if (!v3) {
      operator delete(v2);
    }
  }
}

void sub_25C13EA90(uint64_t *a1, uint64_t a2, char a3, char a4, int a5, uint64_t *a6)
{
  unsigned int v11 = sub_25C13E188((uint64_t)a1, a2);
  int v12 = v11;
  v11[2] = a6;
  if (v13)
  {
    *((unsigned char *)v11 + 8) = a3;
    *((unsigned char *)v11 + 9) = 1;
    *((unsigned char *)v11 + 11) = a4;
    uint64_t v14 = *a1;
    if (!v14) {
      operator new();
    }
    if (*(unsigned char *)(v14 + 24)) {
      (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v14 + 32) + 32) + 40))(*(void *)(*(void *)(v14 + 32) + 32), &unk_2709891F8, 16);
    }
    int v15 = (unsigned int *)sub_25C1360BC((void *)v14, 0x10uLL, (uint64_t)sub_25C13EBCC);
    *(void *)int v15 = 0;
    *((void *)v15 + 1) = v14;
    *int v12 = (uint64_t *)v15;
  }
  else
  {
    int v15 = (unsigned int *)*v11;
  }
  uint64_t v16 = *v15;
  if (v16 == v15[1])
  {
    unsigned int v17 = v16 + 1;
    sub_25C14BEC0(v15, v16 + 1);
    *(_DWORD *)(*((void *)v15 + 1) + 4 * v16) = a5;
  }
  else
  {
    *(_DWORD *)(*((void *)v15 + 1) + 4 * v16) = a5;
    unsigned int v17 = v16 + 1;
  }
  *int v15 = v17;
}

void sub_25C13EBCC(uint64_t a1)
{
  if (*(int *)(a1 + 4) >= 1)
  {
    uint64_t v1 = *(void *)(a1 + 8);
    uint64_t v3 = *(void *)(v1 - 8);
    unint64_t v2 = (void *)(v1 - 8);
    if (!v3) {
      operator delete(v2);
    }
  }
}

void sub_25C13EBEC(uint64_t *a1, uint64_t a2, char a3, char a4, uint64_t a5, uint64_t *a6)
{
  unsigned int v11 = sub_25C13E188((uint64_t)a1, a2);
  int v12 = v11;
  v11[2] = a6;
  if (v13)
  {
    *((unsigned char *)v11 + 8) = a3;
    *((unsigned char *)v11 + 9) = 1;
    *((unsigned char *)v11 + 11) = a4;
    uint64_t v14 = *a1;
    if (!v14) {
      operator new();
    }
    if (*(unsigned char *)(v14 + 24)) {
      (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v14 + 32) + 32) + 40))(*(void *)(*(void *)(v14 + 32) + 32), &unk_270989218, 16);
    }
    int v15 = (unsigned int *)sub_25C1360BC((void *)v14, 0x10uLL, (uint64_t)sub_25C13ED28);
    *(void *)int v15 = 0;
    *((void *)v15 + 1) = v14;
    *int v12 = (uint64_t *)v15;
  }
  else
  {
    int v15 = (unsigned int *)*v11;
  }
  uint64_t v16 = *v15;
  if (v16 == v15[1])
  {
    unsigned int v17 = v16 + 1;
    sub_25C14C038(v15, v16 + 1);
    *(void *)(*((void *)v15 + 1) + 8 * v16) = a5;
  }
  else
  {
    *(void *)(*((void *)v15 + 1) + 8 * v16) = a5;
    unsigned int v17 = v16 + 1;
  }
  *int v15 = v17;
}

void sub_25C13ED28(uint64_t a1)
{
  if (*(int *)(a1 + 4) >= 1)
  {
    uint64_t v1 = *(void *)(a1 + 8);
    uint64_t v3 = *(void *)(v1 - 8);
    unint64_t v2 = (void *)(v1 - 8);
    if (!v3) {
      operator delete(v2);
    }
  }
}

void sub_25C13ED48(uint64_t *a1, uint64_t a2, char a3, uint64_t *a4, float a5)
{
  unint64_t v9 = sub_25C13E188((uint64_t)a1, a2);
  uint64_t v10 = v9;
  v9[2] = a4;
  if (v11)
  {
    *((_WORD *)v9 + 4) = 258;
    *((unsigned char *)v9 + 11) = a3;
    uint64_t v12 = *a1;
    if (!v12) {
      operator new();
    }
    if (*(unsigned char *)(v12 + 24)) {
      (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v12 + 32) + 32) + 40))(*(void *)(*(void *)(v12 + 32) + 32), &unk_2709891D8, 16);
    }
    char v13 = (unsigned int *)sub_25C1360BC((void *)v12, 0x10uLL, (uint64_t)sub_25C13EE7C);
    *(void *)char v13 = 0;
    *((void *)v13 + 1) = v12;
    int *v10 = (uint64_t *)v13;
  }
  else
  {
    char v13 = (unsigned int *)*v9;
  }
  uint64_t v14 = *v13;
  if (v14 == v13[1])
  {
    unsigned int v15 = v14 + 1;
    sub_25C14BEC0(v13, v14 + 1);
    *(float *)(*((void *)v13 + 1) + 4 * v14) = a5;
  }
  else
  {
    *(float *)(*((void *)v13 + 1) + 4 * v14) = a5;
    unsigned int v15 = v14 + 1;
  }
  *char v13 = v15;
}

void sub_25C13EE7C(uint64_t a1)
{
  if (*(int *)(a1 + 4) >= 1)
  {
    uint64_t v1 = *(void *)(a1 + 8);
    uint64_t v3 = *(void *)(v1 - 8);
    unint64_t v2 = (void *)(v1 - 8);
    if (!v3) {
      operator delete(v2);
    }
  }
}

void sub_25C13EE9C(uint64_t *a1, uint64_t a2, char a3, uint64_t *a4, double a5)
{
  unint64_t v9 = sub_25C13E188((uint64_t)a1, a2);
  uint64_t v10 = v9;
  v9[2] = a4;
  if (v11)
  {
    *((_WORD *)v9 + 4) = 257;
    *((unsigned char *)v9 + 11) = a3;
    uint64_t v12 = *a1;
    if (!v12) {
      operator new();
    }
    if (*(unsigned char *)(v12 + 24)) {
      (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v12 + 32) + 32) + 40))(*(void *)(*(void *)(v12 + 32) + 32), &unk_2709891C8, 16);
    }
    char v13 = (unsigned int *)sub_25C1360BC((void *)v12, 0x10uLL, (uint64_t)sub_25C13EFD0);
    *(void *)char v13 = 0;
    *((void *)v13 + 1) = v12;
    int *v10 = (uint64_t *)v13;
  }
  else
  {
    char v13 = (unsigned int *)*v9;
  }
  uint64_t v14 = *v13;
  if (v14 == v13[1])
  {
    unsigned int v15 = v14 + 1;
    sub_25C14C038(v13, v14 + 1);
    *(double *)(*((void *)v13 + 1) + 8 * v14) = a5;
  }
  else
  {
    *(double *)(*((void *)v13 + 1) + 8 * v14) = a5;
    unsigned int v15 = v14 + 1;
  }
  *char v13 = v15;
}

void sub_25C13EFD0(uint64_t a1)
{
  if (*(int *)(a1 + 4) >= 1)
  {
    uint64_t v1 = *(void *)(a1 + 8);
    uint64_t v3 = *(void *)(v1 - 8);
    unint64_t v2 = (void *)(v1 - 8);
    if (!v3) {
      operator delete(v2);
    }
  }
}

void sub_25C13EFF0(uint64_t *a1, uint64_t a2, char a3, char a4, uint64_t *a5)
{
  unint64_t v9 = sub_25C13E188((uint64_t)a1, a2);
  uint64_t v10 = v9;
  v9[2] = a5;
  if (v11)
  {
    *((_WORD *)v9 + 4) = 264;
    *((unsigned char *)v9 + 11) = a3;
    uint64_t v12 = *a1;
    if (!v12) {
      operator new();
    }
    if (*(unsigned char *)(v12 + 24)) {
      (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v12 + 32) + 32) + 40))(*(void *)(*(void *)(v12 + 32) + 32), &unk_2709891B8, 16);
    }
    char v13 = (unsigned int *)sub_25C1360BC((void *)v12, 0x10uLL, (uint64_t)sub_25C13F124);
    *(void *)char v13 = 0;
    *((void *)v13 + 1) = v12;
    int *v10 = (uint64_t *)v13;
  }
  else
  {
    char v13 = (unsigned int *)*v9;
  }
  uint64_t v14 = *v13;
  if (v14 == v13[1])
  {
    unsigned int v15 = v14 + 1;
    sub_25C14BD68(v13, v14 + 1);
    *(unsigned char *)(*((void *)v13 + 1) + v14) = a4;
  }
  else
  {
    *(unsigned char *)(*((void *)v13 + 1) + v14) = a4;
    unsigned int v15 = v14 + 1;
  }
  *char v13 = v15;
}

void sub_25C13F124(uint64_t a1)
{
  if (*(int *)(a1 + 4) >= 1)
  {
    uint64_t v1 = *(void *)(a1 + 8);
    uint64_t v3 = *(void *)(v1 - 8);
    unint64_t v2 = (void *)(v1 - 8);
    if (!v3) {
      operator delete(v2);
    }
  }
}

uint64_t *sub_25C13F144(uint64_t *a1, uint64_t a2, int a3, char a4, uint64_t *a5)
{
  unint64_t v9 = sub_25C13E188((uint64_t)a1, a2);
  uint64_t v10 = v9;
  v9[2] = a5;
  if (v11)
  {
    *((unsigned char *)v9 + 9) = 1;
    *((unsigned char *)v9 + 8) = a3;
    *((unsigned char *)v9 + 11) = a4;
    switch(a3)
    {
      case 1:
        uint64_t v12 = *a1;
        if (!v12) {
          goto LABEL_32;
        }
        if (*(unsigned char *)(v12 + 24)) {
          (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v12 + 32) + 32) + 40))(*(void *)(*(void *)(v12 + 32) + 32), &unk_2709891C8, 16);
        }
        char v13 = sub_25C13EFD0;
        goto LABEL_31;
      case 2:
        uint64_t v12 = *a1;
        if (!v12) {
          goto LABEL_32;
        }
        if (*(unsigned char *)(v12 + 24)) {
          (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v12 + 32) + 32) + 40))(*(void *)(*(void *)(v12 + 32) + 32), &unk_2709891D8, 16);
        }
        char v13 = sub_25C13EE7C;
        goto LABEL_31;
      case 3:
      case 16:
      case 18:
        uint64_t v12 = *a1;
        if (!v12) {
          goto LABEL_32;
        }
        if (*(unsigned char *)(v12 + 24)) {
          (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v12 + 32) + 32) + 40))(*(void *)(*(void *)(v12 + 32) + 32), &unk_270989208, 16);
        }
        char v13 = sub_25C13EA70;
        goto LABEL_31;
      case 4:
      case 6:
        uint64_t v12 = *a1;
        if (!v12) {
          goto LABEL_32;
        }
        if (*(unsigned char *)(v12 + 24)) {
          (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v12 + 32) + 32) + 40))(*(void *)(*(void *)(v12 + 32) + 32), &unk_270989218, 16);
        }
        char v13 = sub_25C13ED28;
        goto LABEL_31;
      case 5:
      case 14:
      case 15:
      case 17:
        uint64_t v12 = *a1;
        if (!v12) {
          goto LABEL_32;
        }
        if (*(unsigned char *)(v12 + 24)) {
          (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v12 + 32) + 32) + 40))(*(void *)(*(void *)(v12 + 32) + 32), &unk_2709891E8, 16);
        }
        char v13 = sub_25C13E914;
        goto LABEL_31;
      case 7:
      case 13:
        uint64_t v12 = *a1;
        if (!v12) {
          goto LABEL_32;
        }
        if (*(unsigned char *)(v12 + 24)) {
          (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v12 + 32) + 32) + 40))(*(void *)(*(void *)(v12 + 32) + 32), &unk_2709891F8, 16);
        }
        char v13 = sub_25C13EBCC;
        goto LABEL_31;
      case 8:
        uint64_t v12 = *a1;
        if (!v12) {
LABEL_32:
        }
          operator new();
        if (*(unsigned char *)(v12 + 24)) {
          (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v12 + 32) + 32) + 40))(*(void *)(*(void *)(v12 + 32) + 32), &unk_2709891B8, 16);
        }
        char v13 = sub_25C13F124;
LABEL_31:
        uint64_t v14 = sub_25C1360BC((void *)v12, 0x10uLL, (uint64_t)v13);
        *uint64_t v14 = 0;
        v14[1] = v12;
        goto LABEL_43;
      case 9:
      case 12:
        uint64_t v15 = *a1;
        if (!v15) {
          goto LABEL_42;
        }
        if (*(unsigned char *)(v15 + 24)) {
          (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v15 + 32) + 32) + 40))(*(void *)(*(void *)(v15 + 32) + 32), &unk_270989268, 24);
        }
        uint64_t v16 = sub_25C13F5BC;
        goto LABEL_41;
      case 10:
      case 11:
        uint64_t v15 = *a1;
        if (!v15) {
LABEL_42:
        }
          operator new();
        if (*(unsigned char *)(v15 + 24)) {
          (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v15 + 32) + 32) + 40))(*(void *)(*(void *)(v15 + 32) + 32), &unk_270989240, 24);
        }
        uint64_t v16 = sub_25C13F5B8;
LABEL_41:
        uint64_t v14 = sub_25C1360BC((void *)v15, 0x18uLL, (uint64_t)v16);
        v14[2] = 0;
        *uint64_t v14 = v15;
        v14[1] = 0;
LABEL_43:
        int *v10 = v14;
        break;
      default:
        return *v10;
    }
  }
  return *v10;
}

void sub_25C13F5C0(uint64_t *a1, uint64_t a2, char a3, int a4, uint64_t *a5)
{
  unint64_t v9 = sub_25C13E188((uint64_t)a1, a2);
  uint64_t v10 = v9;
  v9[2] = a5;
  if (v11)
  {
    *((_WORD *)v9 + 4) = 270;
    *((unsigned char *)v9 + 11) = a3;
    uint64_t v12 = *a1;
    if (!v12) {
      operator new();
    }
    if (*(unsigned char *)(v12 + 24)) {
      (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v12 + 32) + 32) + 40))(*(void *)(*(void *)(v12 + 32) + 32), &unk_2709891E8, 16);
    }
    char v13 = (unsigned int *)sub_25C1360BC((void *)v12, 0x10uLL, (uint64_t)sub_25C13E914);
    *(void *)char v13 = 0;
    *((void *)v13 + 1) = v12;
    int *v10 = (uint64_t *)v13;
  }
  else
  {
    char v13 = (unsigned int *)*v9;
  }
  uint64_t v14 = *v13;
  if (v14 == v13[1])
  {
    unsigned int v15 = v14 + 1;
    sub_25C14BEC0(v13, v14 + 1);
    *(_DWORD *)(*((void *)v13 + 1) + 4 * v14) = a4;
  }
  else
  {
    *(_DWORD *)(*((void *)v13 + 1) + 4 * v14) = a4;
    unsigned int v15 = v14 + 1;
  }
  *char v13 = v15;
}

uint64_t *sub_25C13F6F4(uint64_t *a1, uint64_t a2, char a3, uint64_t *a4)
{
  uint64_t v7 = sub_25C13E188((uint64_t)a1, a2);
  unint64_t v8 = v7;
  v7[2] = a4;
  if (v9)
  {
    *((unsigned char *)v7 + 8) = a3;
    *((unsigned char *)v7 + 9) = 0;
    uint64_t v10 = *a1;
    if (!v10) {
      operator new();
    }
    if (*(unsigned char *)(v10 + 24)) {
      (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v10 + 32) + 32) + 40))(*(void *)(*(void *)(v10 + 32) + 32), &unk_270989328, 24);
    }
    uint64_t result = sub_25C1360BC((void *)v10, 0x18uLL, (uint64_t)sub_25C136878);
    uint64_t *result = 0;
    result[1] = 0;
    result[2] = 0;
    *unint64_t v8 = result;
  }
  else
  {
    uint64_t result = *v7;
  }
  *((unsigned char *)v8 + 10) &= 0xF0u;
  return result;
}

uint64_t sub_25C13F7E4(void *a1, uint64_t a2, char a3, uint64_t a4, uint64_t *a5)
{
  char v9 = sub_25C13E188((uint64_t)a1, a2);
  uint64_t v10 = v9;
  v9[2] = a5;
  if (v11)
  {
    *((unsigned char *)v9 + 8) = a3;
    *((unsigned char *)v9 + 9) = 0;
    *((unsigned char *)v9 + 10) &= 0xFu;
    uint64_t result = (*(uint64_t (**)(uint64_t, void))(*(void *)a4 + 32))(a4, *a1);
    int *v10 = (uint64_t *)result;
    *((unsigned char *)v10 + 10) &= 0xF0u;
  }
  else
  {
    char v13 = *((unsigned char *)v9 + 10);
    *((unsigned char *)v9 + 10) = v13 & 0xF0;
    uint64_t result = (uint64_t)*v9;
    if ((v13 & 0x10) != 0)
    {
      uint64_t v14 = *(uint64_t (**)(void))(*(void *)result + 32);
      return v14();
    }
  }
  return result;
}

uint64_t sub_25C13F8E4(void *a1, uint64_t a2, char a3, uint64_t a4, uint64_t *a5)
{
  char v9 = sub_25C13E188((uint64_t)a1, a2);
  uint64_t v10 = (uint64_t *)v9;
  v9[2] = a5;
  if (v11)
  {
    *((unsigned char *)v9 + 8) = a3;
    *((unsigned char *)v9 + 9) = 1;
    uint64_t v12 = *a1;
    if (!*a1) {
      operator new();
    }
    if (*(unsigned char *)(v12 + 24)) {
      (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v12 + 32) + 32) + 40))(*(void *)(*(void *)(v12 + 32) + 32), &unk_270989240, 24);
    }
    char v13 = sub_25C1360BC((void *)v12, 0x18uLL, (uint64_t)sub_25C13F5B8);
    v13[2] = 0;
    *char v13 = v12;
    v13[1] = 0;
    uint64_t *v10 = (uint64_t)v13;
  }
  else
  {
    char v13 = *v9;
  }
  uint64_t v14 = (_DWORD *)v13[2];
  if (!v14
    || (uint64_t v15 = *((int *)v13 + 2), (int)v15 >= *v14)
    || (*((_DWORD *)v13 + 2) = v15 + 1, (uint64_t v16 = *(void *)&v14[2 * v15 + 2]) == 0))
  {
    uint64_t v16 = (*(uint64_t (**)(uint64_t, void))(*(void *)a4 + 32))(a4, *a1);
    sub_25C13FA50(*v10, v16);
  }
  return v16;
}

uint64_t sub_25C13FA50(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  uint64_t v4 = *(int **)(result + 16);
  if (!v4)
  {
    int v10 = *(_DWORD *)(result + 8);
    int v9 = *(_DWORD *)(result + 12);
    if (v10 > v9) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  uint64_t v5 = *v4;
  int v6 = *(_DWORD *)(result + 12);
  if ((int)v5 >= v6)
  {
    int v9 = *(_DWORD *)(result + 8);
    int v10 = v9;
    if (v9 != v6)
    {
      if (v5 == v6)
      {
        uint64_t result = *(void *)&v4[2 * v9 + 2];
        if (result) {
          BOOL v13 = *(void *)v3 == 0;
        }
        else {
          BOOL v13 = 0;
        }
        if (v13)
        {
          uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 8))(result);
          uint64_t v4 = *(int **)(v3 + 16);
        }
        goto LABEL_13;
      }
      if (v9 >= (int)v5)
      {
        int v11 = v5 + 1;
        goto LABEL_12;
      }
      *(void *)&v4[2 * v5 + 2] = *(void *)&v4[2 * v9 + 2];
      goto LABEL_10;
    }
LABEL_9:
    uint64_t result = sub_25C14C1A8((uint64_t *)result, v9 - v10 + 1);
LABEL_10:
    uint64_t v4 = *(int **)(v3 + 16);
LABEL_11:
    int v11 = *v4 + 1;
LABEL_12:
    *uint64_t v4 = v11;
LABEL_13:
    uint64_t v12 = *(int *)(v3 + 8);
    *(_DWORD *)(v3 + 8) = v12 + 1;
    *(void *)&v4[2 * v12 + 2] = a2;
    return result;
  }
  uint64_t v7 = v4 + 2;
  uint64_t v8 = *(int *)(result + 8);
  if ((int)v8 < (int)v5) {
    *(void *)&v7[2 * v5] = *(void *)&v7[2 * v8];
  }
  *(void *)&v7[2 * v8] = a2;
  *(_DWORD *)(result + 8) = v8 + 1;
  ++**(_DWORD **)(result + 16);
  return result;
}

unsigned char *sub_25C13FB88(unsigned char *result)
{
  uint64_t v1 = (void *)*((void *)result + 2);
  if (*((unsigned __int16 *)result + 4) >= 0x101u)
  {
    int v6 = (void *)*v1;
    uint64_t v4 = v1 + 1;
    uint64_t v5 = v6;
    if (v6 != v4)
    {
      do
      {
        uint64_t result = sub_25C13DF78((unsigned char *)v5 + 40);
        uint64_t v7 = (void *)v5[1];
        if (v7)
        {
          do
          {
            uint64_t v8 = v7;
            uint64_t v7 = (void *)*v7;
          }
          while (v7);
        }
        else
        {
          do
          {
            uint64_t v8 = (void *)v5[2];
            BOOL v9 = *v8 == (void)v5;
            uint64_t v5 = v8;
          }
          while (!v9);
        }
        uint64_t v5 = v8;
      }
      while (v8 != v4);
    }
  }
  else if (*((_WORD *)result + 5))
  {
    uint64_t v2 = 32 * *((unsigned __int16 *)result + 5);
    uint64_t v3 = v1 + 1;
    do
    {
      uint64_t result = sub_25C13DF78(v3);
      v3 += 32;
      v2 -= 32;
    }
    while (v2);
  }
  return result;
}

void sub_25C13FC28(uint64_t a1, uint64_t a2)
{
  if (*(unsigned __int16 *)(a1 + 8) <= 0x100u)
  {
    unsigned int v4 = *(unsigned __int16 *)(a2 + 8);
    uint64_t v5 = *(char **)(a1 + 16);
    uint64_t v6 = *(unsigned __int16 *)(a1 + 10);
    uint64_t v7 = &v5[32 * v6];
    uint64_t v8 = *(void *)(a2 + 16);
    if (v4 > 0x100)
    {
      unint64_t v14 = sub_25C13FD58(v5, v7, *(void **)v8, (void *)(v8 + 8));
    }
    else
    {
      uint64_t v9 = *(unsigned __int16 *)(a2 + 10);
      uint64_t v10 = v8 + 32 * v9;
      BOOL v12 = v6 == 0;
      uint64_t v11 = 0;
      BOOL v12 = v12 || v9 == 0;
      if (!v12)
      {
        do
        {
          if (*(_DWORD *)v5 == *(_DWORD *)v8) {
            BOOL v13 = v5 + 32;
          }
          else {
            BOOL v13 = v5;
          }
          if (*(_DWORD *)v5 < *(_DWORD *)v8)
          {
            v5 += 32;
          }
          else
          {
            v8 += 32;
            uint64_t v5 = v13;
          }
          ++v11;
        }
        while (v5 != v7 && v8 != v10);
      }
      unint64_t v14 = v11 + ((v10 - v8) >> 5) + ((v7 - v5) >> 5);
    }
    sub_25C13E388((void *)a1, v14);
  }
  uint64_t v15 = *(int ***)(a2 + 16);
  if (*(unsigned __int16 *)(a2 + 8) >= 0x101u)
  {
    uint64_t v19 = (int **)*v15;
    sub_25C13FE60(v19, v15 + 1, (uint64_t *)a1);
  }
  else if (*(_WORD *)(a2 + 10))
  {
    uint64_t v16 = (int *)&v15[4 * *(unsigned __int16 *)(a2 + 10)];
    do
    {
      unsigned int v17 = v15 + 1;
      unsigned int v18 = *(_DWORD *)v15;
      v15 += 4;
      sub_25C13FEE4((uint64_t *)a1, v18, v17);
    }
    while (v15 != (int **)v16);
  }
}

uint64_t sub_25C13FD58(char *a1, char *a2, void *a3, void *a4)
{
  uint64_t v4 = 0;
  if (a1 != a2 && a3 != a4)
  {
    uint64_t v4 = 0;
    do
    {
      int v5 = *((_DWORD *)a3 + 8);
      if (*(_DWORD *)a1 >= v5)
      {
        if (*(_DWORD *)a1 == v5)
        {
          a1 += 32;
          uint64_t v6 = (void *)a3[1];
          if (v6)
          {
            do
            {
              a3 = v6;
              uint64_t v6 = (void *)*v6;
            }
            while (v6);
          }
          else
          {
            do
            {
              uint64_t v7 = a3;
              a3 = (void *)a3[2];
            }
            while ((void *)*a3 != v7);
          }
        }
        else
        {
          uint64_t v8 = (void *)a3[1];
          if (v8)
          {
            do
            {
              a3 = v8;
              uint64_t v8 = (void *)*v8;
            }
            while (v8);
          }
          else
          {
            do
            {
              uint64_t v9 = a3;
              a3 = (void *)a3[2];
            }
            while ((void *)*a3 != v9);
          }
        }
      }
      else
      {
        a1 += 32;
      }
      ++v4;
    }
    while (a1 != a2 && a3 != a4);
  }
  if (a3 == a4)
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = 0;
    do
    {
      uint64_t v11 = (void *)a3[1];
      if (v11)
      {
        do
        {
          BOOL v12 = v11;
          uint64_t v11 = (void *)*v11;
        }
        while (v11);
      }
      else
      {
        do
        {
          BOOL v12 = (void *)a3[2];
          BOOL v13 = *v12 == (void)a3;
          a3 = v12;
        }
        while (!v13);
      }
      ++v10;
      a3 = v12;
    }
    while (v12 != a4);
  }
  return v4 + ((a2 - a1) >> 5) + v10;
}

uint64_t *sub_25C13FE60(int **a1, int **a2, uint64_t *a3)
{
  if (a1 != a2)
  {
    int v5 = a1;
    do
    {
      sub_25C13FEE4(a3, *((unsigned int *)v5 + 8), v5 + 5);
      uint64_t v6 = v5[1];
      if (v6)
      {
        do
        {
          uint64_t v7 = (int **)v6;
          uint64_t v6 = *(int **)v6;
        }
        while (v6);
      }
      else
      {
        do
        {
          uint64_t v7 = (int **)v5[2];
          BOOL v8 = *v7 == (int *)v5;
          int v5 = v7;
        }
        while (!v8);
      }
      int v5 = v7;
    }
    while (v7 != a2);
  }
  return a3;
}

void sub_25C13FEE4(uint64_t *a1, uint64_t a2, int **a3)
{
  if (!*((unsigned char *)a3 + 9))
  {
    if (*((unsigned char *)a3 + 10)) {
      return;
    }
    char v12 = *((unsigned char *)a3 + 8);
    switch(v12)
    {
      case 1:
        unint64_t v39 = (uint64_t *)*a3;
        uint64_t v40 = (uint64_t *)a3[2];
        int v41 = sub_25C13E188((uint64_t)a1, a2);
        v41[2] = v40;
        if (v42)
        {
          *((unsigned char *)v41 + 8) = v12;
          *((unsigned char *)v41 + 9) = 0;
        }
        *((unsigned char *)v41 + 10) &= 0xF0u;
        *int v41 = v39;
        return;
      case 2:
        int v43 = *(_DWORD *)a3;
        uint64_t v44 = (uint64_t *)a3[2];
        unsigned int v45 = sub_25C13E188((uint64_t)a1, a2);
        v45[2] = v44;
        if (v46)
        {
          *((unsigned char *)v45 + 8) = v12;
          *((unsigned char *)v45 + 9) = 0;
        }
        *((unsigned char *)v45 + 10) &= 0xF0u;
        *(_DWORD *)unsigned int v45 = v43;
        return;
      case 3:
      case 4:
      case 6:
      case 16:
      case 18:
        uint64_t v33 = (uint64_t *)*a3;
        unint64_t v34 = (uint64_t *)a3[2];
        unsigned int v35 = sub_25C13E188((uint64_t)a1, a2);
        v35[2] = v34;
        if (v36)
        {
          *((unsigned char *)v35 + 8) = v12;
          *((unsigned char *)v35 + 9) = 0;
        }
        *((unsigned char *)v35 + 10) &= 0xF0u;
        *unsigned int v35 = v33;
        return;
      case 5:
      case 7:
      case 13:
      case 14:
      case 15:
      case 17:
        int v13 = *(_DWORD *)a3;
        unint64_t v14 = (uint64_t *)a3[2];
        uint64_t v15 = sub_25C13E188((uint64_t)a1, a2);
        v15[2] = v14;
        if (v16)
        {
          *((unsigned char *)v15 + 8) = v12;
          *((unsigned char *)v15 + 9) = 0;
        }
        *((unsigned char *)v15 + 10) &= 0xF0u;
        *(_DWORD *)uint64_t v15 = v13;
        return;
      case 8:
        char v47 = *(unsigned char *)a3;
        uint64_t v48 = (uint64_t *)a3[2];
        uint64_t v49 = sub_25C13E188((uint64_t)a1, a2);
        v49[2] = v48;
        if (v50)
        {
          *((unsigned char *)v49 + 8) = v12;
          *((unsigned char *)v49 + 9) = 0;
        }
        *((unsigned char *)v49 + 10) &= 0xF0u;
        *(unsigned char *)uint64_t v49 = v47;
        return;
      case 9:
      case 12:
        uint64_t v57 = *a3;
        if (*((char *)*a3 + 23) < 0)
        {
          sub_25C1367DC(__p, *(void **)v57, *((void *)v57 + 1));
        }
        else
        {
          *(_OWORD *)__p = *(_OWORD *)v57;
          uint64_t v94 = *((void *)v57 + 2);
        }
        sub_25C140D10(a1, a2, v12, (__n128 *)__p, (uint64_t *)a3[2]);
        if (SHIBYTE(v94) < 0)
        {
          v91 = __p[0];
          operator delete(v91);
        }
        return;
      case 10:
      case 11:
        int v51 = (uint64_t *)a3[2];
        int v52 = sub_25C13E188((uint64_t)a1, a2);
        int v53 = v52;
        v52[2] = v51;
        if (v54)
        {
          *((unsigned char *)v52 + 8) = *((unsigned char *)a3 + 8);
          *((unsigned char *)v52 + 11) = *((unsigned char *)a3 + 11);
          *((unsigned char *)v52 + 9) = 0;
          char v55 = *((unsigned char *)v52 + 10) & 0xF;
          if ((*((unsigned char *)a3 + 10) & 0x10) != 0)
          {
            *((unsigned char *)v52 + 10) = v55 | 0x10;
            uint64_t v92 = (*(uint64_t (**)(int *, uint64_t))(*(void *)*a3 + 16))(*a3, *a1);
            *int v53 = (uint64_t *)v92;
            (*(void (**)(uint64_t, int *))(*(void *)v92 + 104))(v92, *a3);
            goto LABEL_123;
          }
          *((unsigned char *)v52 + 10) = v55;
          uint64_t v56 = (*(uint64_t (**)(int *, uint64_t))(*(void *)*a3 + 32))(*a3, *a1);
          *int v53 = (uint64_t *)v56;
LABEL_112:
          (*(void (**)(uint64_t, int *))(*(void *)v56 + 64))(v56, *a3);
LABEL_123:
          *((unsigned char *)v53 + 10) &= 0xF0u;
          return;
        }
        v88 = *v52;
        uint64_t v89 = (uint64_t)*a3;
        if ((*((unsigned char *)a3 + 10) & 0x10) != 0)
        {
          if ((*((unsigned char *)v52 + 10) & 0x10) != 0)
          {
            (*(void (**)(uint64_t *, uint64_t))(*v88 + 104))(*v52, v89);
            goto LABEL_123;
          }
          uint64_t v89 = (*(uint64_t (**)(int *, uint64_t *))(*(void *)v89 + 24))(*a3, *v52);
          uint64_t v90 = *v88;
        }
        else
        {
          uint64_t v90 = *v88;
          if ((*((unsigned char *)v52 + 10) & 0x10) != 0)
          {
            uint64_t v56 = (*(uint64_t (**)(uint64_t *, uint64_t))(v90 + 32))(*v52, v89);
            goto LABEL_112;
          }
        }
        (*(void (**)(uint64_t *, uint64_t))(v90 + 64))(v88, v89);
        goto LABEL_123;
      default:
        return;
    }
  }
  uint64_t v6 = (uint64_t *)a3[2];
  uint64_t v7 = sub_25C13E188((uint64_t)a1, a2);
  uint64_t v9 = (uint64_t *)v7;
  v7[2] = v6;
  if (v8)
  {
    *((unsigned char *)v7 + 8) = *((unsigned char *)a3 + 8);
    *((unsigned char *)v7 + 11) = *((unsigned char *)a3 + 11);
    *((unsigned char *)v7 + 9) = 1;
  }
  switch(*((unsigned char *)a3 + 8))
  {
    case 1:
      if (v8)
      {
        uint64_t v23 = *a1;
        if (!v23) {
          operator new();
        }
        if (*(unsigned char *)(v23 + 24)) {
          (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v23 + 32) + 32) + 40))(*(void *)(*(void *)(v23 + 32) + 32), &unk_2709891C8, 16);
        }
        uint64_t v24 = sub_25C1360BC((void *)v23, 0x10uLL, (uint64_t)sub_25C13EFD0);
        void *v24 = 0;
        v24[1] = v23;
        *uint64_t v9 = (uint64_t)v24;
      }
      uint64_t v58 = *a3;
      int v59 = **a3;
      if (v59) {
        goto LABEL_86;
      }
      break;
    case 2:
      if (v8)
      {
        uint64_t v25 = *a1;
        if (!v25) {
          operator new();
        }
        if (*(unsigned char *)(v25 + 24)) {
          (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v25 + 32) + 32) + 40))(*(void *)(*(void *)(v25 + 32) + 32), &unk_2709891D8, 16);
        }
        int v26 = sub_25C1360BC((void *)v25, 0x10uLL, (uint64_t)sub_25C13EE7C);
        *int v26 = 0;
        v26[1] = v25;
        *uint64_t v9 = (uint64_t)v26;
      }
      uint64_t v37 = *a3;
      int v38 = **a3;
      if (v38) {
        goto LABEL_89;
      }
      break;
    case 3:
    case 0x10:
    case 0x12:
      if (v8)
      {
        uint64_t v17 = *a1;
        if (!v17) {
          operator new();
        }
        if (*(unsigned char *)(v17 + 24)) {
          (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v17 + 32) + 32) + 40))(*(void *)(*(void *)(v17 + 32) + 32), &unk_270989208, 16);
        }
        unsigned int v18 = sub_25C1360BC((void *)v17, 0x10uLL, (uint64_t)sub_25C13EA70);
        *unsigned int v18 = 0;
        v18[1] = v17;
        *uint64_t v9 = (uint64_t)v18;
      }
      uint64_t v58 = *a3;
      int v59 = **a3;
      if (v59) {
        goto LABEL_86;
      }
      break;
    case 4:
    case 6:
      if (v8)
      {
        uint64_t v21 = *a1;
        if (!v21) {
          operator new();
        }
        if (*(unsigned char *)(v21 + 24)) {
          (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v21 + 32) + 32) + 40))(*(void *)(*(void *)(v21 + 32) + 32), &unk_270989218, 16);
        }
        unsigned int v22 = sub_25C1360BC((void *)v21, 0x10uLL, (uint64_t)sub_25C13ED28);
        *unsigned int v22 = 0;
        v22[1] = v21;
        *uint64_t v9 = (uint64_t)v22;
      }
      uint64_t v58 = *a3;
      int v59 = **a3;
      if (v59)
      {
LABEL_86:
        uint64_t v60 = *v9;
        uint64_t v61 = *(int *)*v9;
        sub_25C14C038((unsigned int *)v60, v61 + v59);
        uint64_t v62 = *(void *)(v60 + 8);
        *(_DWORD *)v60 += *v58;
        uint64_t v63 = (void *)(v62 + 8 * v61);
        uint64_t v64 = (const void *)*((void *)v58 + 1);
        size_t v65 = 8 * *v58;
        goto LABEL_93;
      }
      break;
    case 5:
    case 0xE:
    case 0xF:
    case 0x11:
      if (v8)
      {
        uint64_t v10 = *a1;
        if (!v10) {
          operator new();
        }
        if (*(unsigned char *)(v10 + 24)) {
          (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v10 + 32) + 32) + 40))(*(void *)(*(void *)(v10 + 32) + 32), &unk_2709891E8, 16);
        }
        uint64_t v11 = sub_25C1360BC((void *)v10, 0x10uLL, (uint64_t)sub_25C13E914);
        *uint64_t v11 = 0;
        v11[1] = v10;
        *uint64_t v9 = (uint64_t)v11;
      }
      uint64_t v37 = *a3;
      int v38 = **a3;
      if (v38) {
        goto LABEL_89;
      }
      break;
    case 7:
    case 0xD:
      if (v8)
      {
        uint64_t v19 = *a1;
        if (!v19) {
          operator new();
        }
        if (*(unsigned char *)(v19 + 24)) {
          (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v19 + 32) + 32) + 40))(*(void *)(*(void *)(v19 + 32) + 32), &unk_2709891F8, 16);
        }
        BOOL v20 = sub_25C1360BC((void *)v19, 0x10uLL, (uint64_t)sub_25C13EBCC);
        void *v20 = 0;
        v20[1] = v19;
        *uint64_t v9 = (uint64_t)v20;
      }
      uint64_t v37 = *a3;
      int v38 = **a3;
      if (v38)
      {
LABEL_89:
        uint64_t v66 = *v9;
        uint64_t v67 = *(int *)*v9;
        sub_25C14BEC0((unsigned int *)v66, v67 + v38);
        uint64_t v68 = *(void *)(v66 + 8);
        *(_DWORD *)v66 += *v37;
        uint64_t v63 = (void *)(v68 + 4 * v67);
        uint64_t v64 = (const void *)*((void *)v37 + 1);
        size_t v65 = 4 * *v37;
        goto LABEL_93;
      }
      break;
    case 8:
      if (v8)
      {
        uint64_t v27 = *a1;
        if (!v27) {
          operator new();
        }
        if (*(unsigned char *)(v27 + 24)) {
          (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v27 + 32) + 32) + 40))(*(void *)(*(void *)(v27 + 32) + 32), &unk_2709891B8, 16);
        }
        uint64_t v28 = sub_25C1360BC((void *)v27, 0x10uLL, (uint64_t)sub_25C13F124);
        *uint64_t v28 = 0;
        v28[1] = v27;
        *uint64_t v9 = (uint64_t)v28;
      }
      unint64_t v69 = *a3;
      int v70 = **a3;
      if (v70)
      {
        uint64_t v71 = *v9;
        uint64_t v72 = *(int *)*v9;
        sub_25C14BD68((unsigned int *)v71, v72 + v70);
        uint64_t v73 = *(void *)(v71 + 8);
        *(_DWORD *)v71 += *v69;
        uint64_t v63 = (void *)(v73 + v72);
        uint64_t v64 = (const void *)*((void *)v69 + 1);
        size_t v65 = *v69;
LABEL_93:
        memcpy(v63, v64, v65);
      }
      break;
    case 9:
    case 0xC:
      if (v8)
      {
        uint64_t v29 = *a1;
        if (!v29) {
          operator new();
        }
        if (*(unsigned char *)(v29 + 24)) {
          (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v29 + 32) + 32) + 40))(*(void *)(*(void *)(v29 + 32) + 32), &unk_270989268, 24);
        }
        unsigned int v30 = sub_25C1360BC((void *)v29, 0x18uLL, (uint64_t)sub_25C13F5BC);
        v30[2] = 0;
        *unsigned int v30 = v29;
        v30[1] = 0;
        *uint64_t v9 = (uint64_t)v30;
      }
      v81 = *a3;
      unsigned int v82 = (*a3)[2];
      if (v82)
      {
        uint64_t v83 = *v9;
        uint64_t v84 = (const std::string **)(*((void *)v81 + 2) + 8);
        v85 = (std::string **)sub_25C14C1A8((uint64_t *)v83, v82);
        sub_25C140BD8((std::string *)v83, v85, v84, v82, **(_DWORD **)(v83 + 16) - *(_DWORD *)(v83 + 8));
        signed int v86 = *(_DWORD *)(v83 + 8) + v82;
        *(_DWORD *)(v83 + 8) = v86;
        v87 = *(signed int **)(v83 + 16);
        if (*v87 < v86) {
          signed int *v87 = v86;
        }
      }
      break;
    case 0xA:
    case 0xB:
      if (v8)
      {
        uint64_t v31 = *a1;
        if (!*a1) {
          operator new();
        }
        if (*(unsigned char *)(v31 + 24)) {
          (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v31 + 32) + 32) + 40))(*(void *)(*(void *)(v31 + 32) + 32), &unk_270989240, 24);
        }
        unint64_t v32 = sub_25C1360BC((void *)v31, 0x18uLL, (uint64_t)sub_25C13F5B8);
        v32[2] = 0;
        *unint64_t v32 = v31;
        v32[1] = 0;
        *uint64_t v9 = (uint64_t)v32;
      }
      v74 = *a3;
      if ((*a3)[2] >= 1)
      {
        uint64_t v75 = 0;
        do
        {
          uint64_t v76 = *(void *)(*((void *)v74 + 2) + 8 * v75 + 8);
          uint64_t v77 = *v9;
          v78 = *(_DWORD **)(*v9 + 16);
          if (!v78
            || (uint64_t v79 = *(int *)(v77 + 8), (int)v79 >= *v78)
            || (*(_DWORD *)(v77 + 8) = v79 + 1, (uint64_t v80 = *(void *)&v78[2 * v79 + 2]) == 0))
          {
            uint64_t v80 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v76 + 32))(v76, *a1);
            sub_25C13FA50(*v9, v80);
          }
          (*(void (**)(uint64_t, uint64_t))(*(void *)v80 + 64))(v80, v76);
          ++v75;
        }
        while (v75 < v74[2]);
      }
      break;
    default:
      return;
  }
}

void sub_25C140B6C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

std::string *sub_25C140BD8(std::string *result, std::string **a2, const std::string **a3, unsigned int a4, unsigned int a5)
{
  uint64_t v9 = (std::string::__raw *)result;
  if ((int)a5 >= (int)a4) {
    uint64_t v10 = a4;
  }
  else {
    uint64_t v10 = a5;
  }
  if ((int)v10 >= 1)
  {
    uint64_t v11 = a3;
    char v12 = a2;
    do
    {
      unint64_t v14 = *v11++;
      int v13 = v14;
      uint64_t v15 = *v12++;
      uint64_t result = std::string::operator=(v15, v13);
      --v10;
    }
    while (v10);
  }
  BOOL v16 = __OFSUB__(a4, a5);
  int v17 = a4 - a5;
  if (!((v17 < 0) ^ v16 | (v17 == 0)))
  {
    std::string::size_type v18 = v9->__words[0];
    uint64_t v19 = &a2[a5];
    BOOL v20 = &a3[a5];
    do
    {
      uint64_t v21 = *v20;
      if (!v18) {
        operator new();
      }
      if (*(unsigned char *)(v18 + 24)) {
        (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v18 + 32) + 32) + 40))(*(void *)(*(void *)(v18 + 32) + 32), &unk_270989328, 24);
      }
      unsigned int v22 = (std::string *)sub_25C1360BC((void *)v18, 0x18uLL, (uint64_t)sub_25C136878);
      v22->__r_.__value_.__r.__words[0] = 0;
      v22->__r_.__value_.__l.__size_ = 0;
      v22->__r_.__value_.__r.__words[2] = 0;
      uint64_t result = std::string::operator=(v22, v21);
      *v19++ = v22;
      ++v20;
      --v17;
    }
    while (v17);
  }
  return result;
}

__n128 sub_25C140D10(uint64_t *a1, uint64_t a2, char a3, __n128 *a4, uint64_t *a5)
{
  uint64_t v6 = sub_25C13F6F4(a1, a2, a3, a5);
  uint64_t v7 = (__n128 *)v6;
  if (*((char *)v6 + 23) < 0) {
    operator delete((void *)*v6);
  }
  __n128 result = *a4;
  v7[1].n128_u64[0] = a4[1].n128_u64[0];
  *uint64_t v7 = result;
  a4[1].n128_u8[7] = 0;
  a4->n128_u8[0] = 0;
  return result;
}

uint64_t sub_25C140D64(uint64_t a1)
{
  if (*(unsigned __int16 *)(a1 + 8) < 0x101u)
  {
    if (*(_WORD *)(a1 + 10))
    {
      uint64_t v2 = *(void *)(a1 + 16);
      do
      {
        uint64_t result = sub_25C140E20((unsigned __int8 *)(v2 + 8));
        if ((result & 1) == 0) {
          break;
        }
        v2 += 32;
      }
      while (v2 != *(void *)(a1 + 16) + 32 * *(unsigned __int16 *)(a1 + 10));
      return result;
    }
    return 1;
  }
  uint64_t v4 = *(void **)(a1 + 16);
  uint64_t v7 = (unsigned __int8 *)*v4;
  int v5 = (unsigned __int8 *)(v4 + 1);
  uint64_t v6 = v7;
  if (v7 == v5) {
    return 1;
  }
  do
  {
    uint64_t result = sub_25C140E20(v6 + 40);
    if (!result) {
      break;
    }
    char v8 = (unsigned __int8 *)*((void *)v6 + 1);
    if (v8)
    {
      do
      {
        uint64_t v9 = v8;
        char v8 = *(unsigned __int8 **)v8;
      }
      while (v8);
    }
    else
    {
      do
      {
        uint64_t v9 = (unsigned __int8 *)*((void *)v6 + 2);
        BOOL v10 = *(void *)v9 == (void)v6;
        uint64_t v6 = v9;
      }
      while (!v10);
    }
    uint64_t v6 = v9;
  }
  while (v9 != v5);
  return result;
}

uint64_t sub_25C140E20(unsigned __int8 *a1)
{
  if (dword_25C16E5EC[a1[8]] != 10) {
    return 1;
  }
  if (a1[9])
  {
    uint64_t v2 = *(uint64_t **)a1;
    if (*(int *)(*(void *)a1 + 8) >= 1)
    {
      uint64_t v3 = 0;
      while (1)
      {
        uint64_t v4 = *(void *)(v2[2] + 8 * v3 + 8);
        if (((*(uint64_t (**)(uint64_t))(*(void *)v4 + 48))(v4) & 1) == 0) {
          break;
        }
        ++v3;
        uint64_t v2 = *(uint64_t **)a1;
        if (v3 >= *(int *)(*(void *)a1 + 8)) {
          return 1;
        }
      }
      return 0;
    }
    return 1;
  }
  if (a1[10]) {
    return 1;
  }
  uint64_t v5 = **(void **)a1;
  if ((a1[10] & 0x10) != 0) {
    return ((*(uint64_t (**)(void))(v5 + 72))() & 1) != 0;
  }
  uint64_t result = (*(uint64_t (**)(void))(v5 + 48))();
  if (result) {
    return 1;
  }
  return result;
}

uint64_t sub_25C140F2C(uint64_t *a1, unint64_t a2, char *a3, uint64_t a4, unint64_t *a5, int32x2_t *a6)
{
  unsigned int v9 = a2;
  uint64_t v240 = *MEMORY[0x263EF8340];
  uint64_t v11 = a2 >> 3;
  if (!sub_25C13DB60()) {
    goto LABEL_14;
  }
  unsigned int v12 = dword_25C16E638[v226];
  if ((v9 & 7) != 2 || !v227)
  {
LABEL_6:
    if (v12 == (v9 & 7))
    {
      switch(v226)
      {
        case 1u:
          double v22 = *(double *)a3;
          BOOL v20 = a3 + 8;
          if (v227)
          {
            sub_25C13EE9C(a1, v11, v228, v230, v22);
          }
          else
          {
            uint64_t v62 = sub_25C13E188((uint64_t)a1, v11);
            v62[2] = v230;
            if (v63) {
              *((_WORD *)v62 + 4) = 1;
            }
            *((unsigned char *)v62 + 10) &= 0xF0u;
            *(double *)uint64_t v62 = v22;
          }
          return (uint64_t)v20;
        case 2u:
          float v23 = *(float *)a3;
          BOOL v20 = a3 + 4;
          if (v227)
          {
            sub_25C13ED48(a1, v11, v228, v230, v23);
          }
          else
          {
            uint64_t v64 = sub_25C13E188((uint64_t)a1, v11);
            v64[2] = v230;
            if (v65) {
              *((_WORD *)v64 + 4) = 2;
            }
            *((unsigned char *)v64 + 10) &= 0xF0u;
            *(float *)uint64_t v64 = v23;
          }
          return (uint64_t)v20;
        case 3u:
          BOOL v20 = a3 + 1;
          uint64_t v24 = *a3;
          if ((*a3 & 0x80000000) == 0) {
            goto LABEL_294;
          }
          int v25 = *v20;
          uint64_t v24 = (v24 + (v25 << 7) - 128);
          if ((v25 & 0x80) != 0)
          {
            uint64_t v192 = 2;
            for (char i = 14; ; i += 7)
            {
              v24 += (a3[v192] - 1) << i;
              if ((a3[v192] & 0x80000000) == 0) {
                break;
              }
              BOOL v20 = 0;
              if (++v192 == 10) {
                return (uint64_t)v20;
              }
            }
            BOOL v20 = &a3[v192 + 1];
          }
          else
          {
            BOOL v20 = a3 + 2;
          }
LABEL_294:
          if (v227)
          {
            sub_25C13E934(a1, v11, 3, v228, v24, v230);
            return (uint64_t)v20;
          }
          uint64_t v66 = sub_25C13E188((uint64_t)a1, v11);
          v66[2] = v230;
          if (!v208) {
            goto LABEL_343;
          }
          __int16 v68 = 3;
          goto LABEL_342;
        case 4u:
          BOOL v20 = a3 + 1;
          uint64_t v24 = *a3;
          if ((*a3 & 0x80000000) == 0) {
            goto LABEL_299;
          }
          int v26 = *v20;
          uint64_t v24 = (v24 + (v26 << 7) - 128);
          if ((v26 & 0x80) != 0)
          {
            uint64_t v194 = 2;
            for (char j = 14; ; j += 7)
            {
              v24 += (a3[v194] - 1) << j;
              if ((a3[v194] & 0x80000000) == 0) {
                break;
              }
              BOOL v20 = 0;
              if (++v194 == 10) {
                return (uint64_t)v20;
              }
            }
            BOOL v20 = &a3[v194 + 1];
          }
          else
          {
            BOOL v20 = a3 + 2;
          }
LABEL_299:
          if (v227)
          {
            sub_25C13EBEC(a1, v11, 4, v228, v24, v230);
            return (uint64_t)v20;
          }
          uint64_t v66 = sub_25C13E188((uint64_t)a1, v11);
          v66[2] = v230;
          if (!v209) {
            goto LABEL_343;
          }
          __int16 v68 = 4;
          goto LABEL_342;
        case 5u:
          BOOL v20 = a3 + 1;
          LODWORD(v27) = *a3;
          if ((*a3 & 0x80000000) == 0) {
            goto LABEL_304;
          }
          int v28 = *v20;
          unint64_t v27 = (v27 + (v28 << 7) - 128);
          if ((v28 & 0x80) != 0)
          {
            uint64_t v196 = 2;
            for (char k = 14; ; k += 7)
            {
              v27 += (a3[v196] - 1) << k;
              if ((a3[v196] & 0x80000000) == 0) {
                break;
              }
              BOOL v20 = 0;
              if (++v196 == 10) {
                return (uint64_t)v20;
              }
            }
            BOOL v20 = &a3[v196 + 1];
          }
          else
          {
            BOOL v20 = a3 + 2;
          }
LABEL_304:
          if (v227)
          {
            sub_25C13E7D8(a1, v11, 5, v228, v27, v230);
            return (uint64_t)v20;
          }
          v210 = sub_25C13E188((uint64_t)a1, v11);
          v210[2] = v230;
          if (!v211) {
            goto LABEL_329;
          }
          __int16 v212 = 5;
          goto LABEL_328;
        case 6u:
          uint64_t v24 = *(void *)a3;
          BOOL v20 = a3 + 8;
          if (v227)
          {
            sub_25C13EBEC(a1, v11, 6, v228, v24, v230);
            return (uint64_t)v20;
          }
          uint64_t v66 = sub_25C13E188((uint64_t)a1, v11);
          v66[2] = v230;
          if (!v67) {
            goto LABEL_343;
          }
          __int16 v68 = 6;
          goto LABEL_342;
        case 7u:
          int v29 = *(_DWORD *)a3;
          BOOL v20 = a3 + 4;
          if (v227)
          {
            sub_25C13EA90(a1, v11, 7, v228, v29, v230);
            return (uint64_t)v20;
          }
          unint64_t v69 = sub_25C13E188((uint64_t)a1, v11);
          v69[2] = v230;
          if (!v70) {
            goto LABEL_336;
          }
          __int16 v71 = 7;
          goto LABEL_335;
        case 8u:
          BOOL v20 = a3 + 1;
          uint64_t v30 = *a3;
          if ((*a3 & 0x80000000) == 0) {
            goto LABEL_309;
          }
          int v31 = *v20;
          uint64_t v30 = (v30 + (v31 << 7) - 128);
          if ((v31 & 0x80) != 0)
          {
            uint64_t v198 = 2;
            for (char m = 14; ; m += 7)
            {
              v30 += (a3[v198] - 1) << m;
              if ((a3[v198] & 0x80000000) == 0) {
                break;
              }
              BOOL v20 = 0;
              if (++v198 == 10) {
                return (uint64_t)v20;
              }
            }
            BOOL v20 = &a3[v198 + 1];
          }
          else
          {
            BOOL v20 = a3 + 2;
          }
LABEL_309:
          if (v227)
          {
            sub_25C13EFF0(a1, v11, v228, v30 != 0, v230);
          }
          else
          {
            v213 = sub_25C13E188((uint64_t)a1, v11);
            v213[2] = v230;
            if (v214) {
              *((_WORD *)v213 + 4) = 8;
            }
            *((unsigned char *)v213 + 10) &= 0xF0u;
            *(unsigned char *)v213 = v30 != 0;
          }
          return (uint64_t)v20;
        case 9u:
        case 0xCu:
          if (!v227)
          {
            uint64_t v40 = (std::string *)sub_25C13F6F4(a1, v11, 9, v230);
            goto LABEL_135;
          }
          int v13 = sub_25C13E188((uint64_t)a1, v11);
          unint64_t v14 = v13;
          v13[2] = v230;
          if (v15)
          {
            *((_WORD *)v13 + 4) = 265;
            *((unsigned char *)v13 + 11) = 0;
            uint64_t v16 = *a1;
            if (!v16) {
              operator new();
            }
            if (*(unsigned char *)(v16 + 24)) {
              (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v16 + 32) + 32) + 40))(*(void *)(*(void *)(v16 + 32) + 32), &unk_270989268, 24);
            }
            int v17 = sub_25C1360BC((void *)v16, 0x18uLL, (uint64_t)sub_25C13F5BC);
            v17[1] = 0;
            v17[2] = 0;
            uint64_t *v17 = v16;
            *unint64_t v14 = v17;
          }
          else
          {
            int v17 = *v13;
          }
          v87 = (int *)v17[2];
          if (!v87)
          {
            int v88 = *((_DWORD *)v17 + 2);
            int v89 = *((_DWORD *)v17 + 3);
LABEL_127:
            if (v88 <= v89)
            {
              sub_25C14C1A8(v17, v89 - v88 + 1);
              v87 = (int *)v17[2];
            }
            int v89 = *v87;
            goto LABEL_130;
          }
          int v88 = *((_DWORD *)v17 + 2);
          int v89 = *v87;
          if (v88 < *v87)
          {
            *((_DWORD *)v17 + 2) = v88 + 1;
            uint64_t v40 = *(std::string **)&v87[2 * v88 + 2];
            goto LABEL_135;
          }
          if (v89 == *((_DWORD *)v17 + 3)) {
            goto LABEL_127;
          }
LABEL_130:
          int *v87 = v89 + 1;
          uint64_t v90 = *v17;
          if (!*v17) {
            operator new();
          }
          if (*(unsigned char *)(v90 + 24)) {
            (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v90 + 32) + 32) + 40))(*(void *)(*(void *)(v90 + 32) + 32), &unk_270989328, 24);
          }
          uint64_t v40 = (std::string *)sub_25C1360BC((void *)v90, 0x18uLL, (uint64_t)sub_25C136878);
          v40->__r_.__value_.__r.__words[0] = 0;
          v40->__r_.__value_.__l.__size_ = 0;
          v40->__r_.__value_.__r.__words[2] = 0;
          uint64_t v91 = v17[2];
          uint64_t v92 = *((int *)v17 + 2);
          *((_DWORD *)v17 + 2) = v92 + 1;
          *(void *)(v91 + 8 * v92 + 8) = v40;
LABEL_135:
          int v93 = *a3;
          if (*a3 < 0)
          {
            uint64_t v95 = sub_25C14B1B0((uint64_t)a3, *a3);
            if (!v95) {
              return 0;
            }
            uint64_t v94 = (std::string::value_type *)v95;
            int v93 = v96;
          }
          else
          {
            uint64_t v94 = a3 + 1;
          }
          uint64_t v19 = sub_25C142BF0((uint64_t)a6, v94, v93, v40);
          break;
        case 0xAu:
          if (v227) {
            uint64_t v32 = sub_25C13F8E4(a1, v11, 10, v229, v230);
          }
          else {
            uint64_t v32 = sub_25C13F7E4(a1, v11, 10, v229, v230);
          }
          int v72 = a6[11].i32[0];
          BOOL v73 = __OFSUB__(v72--, 1);
          a6[11].i32[0] = v72;
          if (v72 < 0 != v73) {
            return 0;
          }
          ++a6[11].i32[1];
          v74 = (char *)(*(uint64_t (**)(uint64_t, char *, int32x2_t *))(*(void *)v32 + 88))(v32, a3, a6);
          a6[11] = vadd_s32(a6[11], (int32x2_t)0xFFFFFFFF00000001);
          __int32 v75 = a6[10].i32[0];
          a6[10].i32[0] = 0;
          BOOL v76 = v75 == ((8 * v11) | 3);
          goto LABEL_258;
        case 0xBu:
          if (v227) {
            uint64_t v33 = sub_25C13F8E4(a1, v11, 11, v229, v230);
          }
          else {
            uint64_t v33 = sub_25C13F7E4(a1, v11, 11, v229, v230);
          }
          uint64_t v77 = v33;
          int v78 = *a3;
          if (*a3 < 0)
          {
            uint64_t v82 = sub_25C14B1B0((uint64_t)a3, v78);
            if (!v82) {
              return 0;
            }
            uint64_t v79 = (char *)v82;
          }
          else
          {
            uint64_t v79 = a3 + 1;
          }
          int32x2_t v83 = a6[1];
          int v84 = v78 + v79 - v83.i32[0];
          *a6 = (int32x2_t)(*(void *)&v83 + (v84 & (v84 >> 31)));
          __int32 v85 = a6[3].i32[1];
          a6[3].i32[1] = v84;
          v83.i32[0] = a6[11].i32[0];
          BOOL v73 = __OFSUB__(v83.i32[0]--, 1);
          a6[11].i32[0] = v83.i32[0];
          if (v83.i32[0] < 0 != v73) {
            return 0;
          }
          BOOL v20 = (char *)(*(uint64_t (**)(uint64_t, char *, int32x2_t *))(*(void *)v77 + 88))(v77, v79, a6);
          if (!v20) {
            return (uint64_t)v20;
          }
          ++a6[11].i32[0];
          if (a6[10].i32[0]) {
            return 0;
          }
          int v86 = a6[3].i32[1] + v85 - v84;
          a6[3].i32[1] = v86;
          *a6 = (int32x2_t)(*(void *)&a6[1] + (v86 & (v86 >> 31)));
          return (uint64_t)v20;
        case 0xDu:
          BOOL v20 = a3 + 1;
          LODWORD(v27) = *a3;
          if ((*a3 & 0x80000000) == 0) {
            goto LABEL_315;
          }
          int v34 = *v20;
          unint64_t v27 = (v27 + (v34 << 7) - 128);
          if ((v34 & 0x80) != 0)
          {
            uint64_t v200 = 2;
            for (char n = 14; ; n += 7)
            {
              v27 += (a3[v200] - 1) << n;
              if ((a3[v200] & 0x80000000) == 0) {
                break;
              }
              BOOL v20 = 0;
              if (++v200 == 10) {
                return (uint64_t)v20;
              }
            }
            BOOL v20 = &a3[v200 + 1];
          }
          else
          {
            BOOL v20 = a3 + 2;
          }
LABEL_315:
          if (v227)
          {
            sub_25C13EA90(a1, v11, 13, v228, v27, v230);
            return (uint64_t)v20;
          }
          v210 = sub_25C13E188((uint64_t)a1, v11);
          v210[2] = v230;
          if (!v215) {
            goto LABEL_329;
          }
          __int16 v212 = 13;
          goto LABEL_328;
        case 0xEu:
          BOOL v20 = a3 + 1;
          unint64_t v27 = *a3;
          if ((*a3 & 0x80000000) == 0) {
            goto LABEL_320;
          }
          int v35 = *v20;
          unint64_t v27 = (v27 + (v35 << 7) - 128);
          if ((v35 & 0x80) != 0)
          {
            uint64_t v202 = 2;
            for (ichar i = 14; ; ii += 7)
            {
              v27 += (a3[v202] - 1) << ii;
              if ((a3[v202] & 0x80000000) == 0) {
                break;
              }
              BOOL v20 = 0;
              if (++v202 == 10) {
                return (uint64_t)v20;
              }
            }
            BOOL v20 = &a3[v202 + 1];
          }
          else
          {
            BOOL v20 = a3 + 2;
          }
LABEL_320:
          if (((uint64_t (*)(void, unint64_t))v229)(*((void *)&v229 + 1), v27))
          {
            if (v227)
            {
              sub_25C13F5C0(a1, v11, v228, v27, v230);
            }
            else
            {
              v210 = sub_25C13E188((uint64_t)a1, v11);
              v210[2] = v230;
              if (v217)
              {
                __int16 v212 = 14;
LABEL_328:
                *((_WORD *)v210 + 4) = v212;
              }
LABEL_329:
              *((unsigned char *)v210 + 10) &= 0xF0u;
              *(_DWORD *)v210 = v27;
            }
          }
          else
          {
            if (*a5) {
              v216 = (std::string *)((*a5 & 0xFFFFFFFFFFFFFFFELL) + 8);
            }
            else {
              v216 = (std::string *)sub_25C142B28(a5);
            }
            sub_25C14B228(v11, v27, v216);
          }
          return (uint64_t)v20;
        case 0xFu:
          int v29 = *(_DWORD *)a3;
          BOOL v20 = a3 + 4;
          if (v227)
          {
            sub_25C13E7D8(a1, v11, 15, v228, v29, v230);
            return (uint64_t)v20;
          }
          unint64_t v69 = sub_25C13E188((uint64_t)a1, v11);
          v69[2] = v230;
          if (!v80) {
            goto LABEL_336;
          }
          __int16 v71 = 15;
          goto LABEL_335;
        case 0x10u:
          uint64_t v24 = *(void *)a3;
          BOOL v20 = a3 + 8;
          if (v227)
          {
            sub_25C13E934(a1, v11, 16, v228, v24, v230);
            return (uint64_t)v20;
          }
          uint64_t v66 = sub_25C13E188((uint64_t)a1, v11);
          v66[2] = v230;
          if (!v81) {
            goto LABEL_343;
          }
          __int16 v68 = 16;
          goto LABEL_342;
        case 0x11u:
          BOOL v20 = a3 + 1;
          LODWORD(v36) = *a3;
          if ((*a3 & 0x80000000) == 0) {
            goto LABEL_331;
          }
          int v37 = *v20;
          uint64_t v36 = (v36 + (v37 << 7) - 128);
          if ((v37 & 0x80) != 0)
          {
            uint64_t v204 = 2;
            for (jchar j = 14; ; jj += 7)
            {
              v36 += (a3[v204] - 1) << jj;
              if ((a3[v204] & 0x80000000) == 0) {
                break;
              }
              BOOL v20 = 0;
              if (++v204 == 10) {
                return (uint64_t)v20;
              }
            }
            BOOL v20 = &a3[v204 + 1];
          }
          else
          {
            BOOL v20 = a3 + 2;
          }
LABEL_331:
          int v29 = -(v36 & 1) ^ (v36 >> 1);
          if (v227)
          {
            sub_25C13E7D8(a1, v11, 17, v228, v29, v230);
          }
          else
          {
            unint64_t v69 = sub_25C13E188((uint64_t)a1, v11);
            v69[2] = v230;
            if (v218)
            {
              __int16 v71 = 17;
LABEL_335:
              *((_WORD *)v69 + 4) = v71;
            }
LABEL_336:
            *((unsigned char *)v69 + 10) &= 0xF0u;
            *(_DWORD *)unint64_t v69 = v29;
          }
          return (uint64_t)v20;
        case 0x12u:
          BOOL v20 = a3 + 1;
          unint64_t v38 = *a3;
          if ((*a3 & 0x80000000) == 0) {
            goto LABEL_338;
          }
          int v39 = *v20;
          unint64_t v38 = (v38 + (v39 << 7) - 128);
          if ((v39 & 0x80) != 0)
          {
            uint64_t v206 = 2;
            for (kchar k = 14; ; kk += 7)
            {
              v38 += (a3[v206] - 1) << kk;
              if ((a3[v206] & 0x80000000) == 0) {
                break;
              }
              BOOL v20 = 0;
              if (++v206 == 10) {
                return (uint64_t)v20;
              }
            }
            BOOL v20 = &a3[v206 + 1];
          }
          else
          {
            BOOL v20 = a3 + 2;
          }
LABEL_338:
          uint64_t v24 = -(uint64_t)(v38 & 1) ^ (v38 >> 1);
          if (v227)
          {
            sub_25C13E934(a1, v11, 18, v228, v24, v230);
          }
          else
          {
            uint64_t v66 = sub_25C13E188((uint64_t)a1, v11);
            v66[2] = v230;
            if (v219)
            {
              __int16 v68 = 18;
LABEL_342:
              *((_WORD *)v66 + 4) = v68;
            }
LABEL_343:
            *((unsigned char *)v66 + 10) &= 0xF0u;
            void *v66 = (uint64_t *)v24;
          }
          return (uint64_t)v20;
        default:
          return (uint64_t)a3;
      }
      return (uint64_t)v19;
    }
LABEL_14:
    if (*a5) {
      std::string::size_type v18 = (char *)((*a5 & 0xFFFFFFFFFFFFFFFELL) + 8);
    }
    else {
      std::string::size_type v18 = sub_25C142B28(a5);
    }
    *(void *)v235 = v18;
    return sub_25C14B72C(v9, (std::string **)v235, a3, a6);
  }
  if (v12 > 5)
  {
    *(_DWORD *)v235 = 3;
    *(void *)&v235[8] = "/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsente"
                          "ncepiece/third_party/protobuf-lite/extension_set.cc";
    *(_DWORD *)&v235[16] = 82;
    memset(&__p, 0, sizeof(__p));
    std::string::append(&__p, "can't reach here.");
    sub_25C13D6C8((unsigned int *)v235);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    goto LABEL_6;
  }
  if (((1 << v12) & 0x1C) != 0) {
    goto LABEL_6;
  }
  switch(v226)
  {
    case 1u:
      uint64_t v44 = sub_25C13F144(a1, v11, 1, v228, v230);
      int v45 = *a3;
      if (*a3 < 0)
      {
        uint64_t v124 = sub_25C14B1B0((uint64_t)a3, *a3);
        if (!v124) {
          return 0;
        }
        char v46 = (const void *)v124;
        int v45 = v125;
      }
      else
      {
        char v46 = a3 + 1;
      }
      while (1)
      {
        int v126 = a6[1].i32[0] - v46 + 16;
        if (v45 <= v126) {
          goto LABEL_244;
        }
        sub_25C14C038((unsigned int *)v44, *(_DWORD *)v44 + (v126 >> 3));
        uint64_t v127 = *(int *)v44;
        v128 = (void *)(v44[1] + 8 * v127);
        *(_DWORD *)uint64_t v44 = v127 + (v126 >> 3);
        memcpy(v128, v46, (int)(v126 & 0xFFFFFFF8));
        if (a6[3].i32[1] < 17) {
          return 0;
        }
        v129 = sub_25C14AC64((uint64_t)a6);
        if (!v129) {
          return 0;
        }
        v45 -= v126 & 0xFFFFFFF8;
        char v46 = (char *)v129 - (v126 & 7) + 16;
      }
    case 2u:
      uint64_t v44 = sub_25C13F144(a1, v11, 2, v228, v230);
      int v45 = *a3;
      if (*a3 < 0)
      {
        uint64_t v130 = sub_25C14B1B0((uint64_t)a3, *a3);
        if (!v130) {
          return 0;
        }
        char v46 = (const void *)v130;
        int v45 = v131;
      }
      else
      {
        char v46 = a3 + 1;
      }
      while (2)
      {
        int v132 = a6[1].i32[0] - v46 + 16;
        if (v45 <= v132) {
          goto LABEL_219;
        }
        sub_25C14BEC0((unsigned int *)v44, *(_DWORD *)v44 + (v132 >> 2));
        uint64_t v133 = *(int *)v44;
        v134 = (void *)(v44[1] + 4 * v133);
        *(_DWORD *)uint64_t v44 = v133 + (v132 >> 2);
        memcpy(v134, v46, (int)(v132 & 0xFFFFFFFC));
        if (a6[3].i32[1] >= 17)
        {
          v135 = sub_25C14AC64((uint64_t)a6);
          if (v135)
          {
            v45 -= v132 & 0xFFFFFFFC;
            char v46 = (char *)v135 - (v132 & 3) + 16;
            continue;
          }
        }
        return 0;
      }
    case 3u:
      char v50 = sub_25C13F144(a1, v11, 3, v228, v230);
      int v51 = *a3;
      if (*a3 < 0)
      {
        int v52 = (char *)sub_25C14B1B0((uint64_t)a3, *a3);
        if (!v52) {
          return 0;
        }
        int v51 = v136;
      }
      else
      {
        int v52 = a3 + 1;
      }
      while (2)
      {
        unint64_t v137 = (unint64_t)a6[1];
        int v138 = v137 - v52;
        if (v51 <= (int)v137 - (int)v52) {
          goto LABEL_196;
        }
        v139 = sub_25C14B464(v52, v137, (unsigned int *)v50);
        if (!v139) {
          return 0;
        }
        v140 = (_OWORD *)a6[1];
        int v141 = v139 - v140;
        int v103 = v51 - v138;
        if (v51 - v138 <= 16) {
          goto LABEL_347;
        }
        if (a6[3].i32[1] >= 17)
        {
          v142 = sub_25C14AC64((uint64_t)a6);
          if (v142)
          {
            int v51 = v51 - v138 - v141;
            int v52 = (char *)v142 + v141;
            continue;
          }
        }
        return 0;
      }
    case 4u:
      char v50 = sub_25C13F144(a1, v11, 4, v228, v230);
      int v51 = *a3;
      if (*a3 < 0)
      {
        int v52 = (char *)sub_25C14B1B0((uint64_t)a3, *a3);
        if (!v52) {
          return 0;
        }
        int v51 = v143;
      }
      else
      {
        int v52 = a3 + 1;
      }
      while (2)
      {
        unint64_t v144 = (unint64_t)a6[1];
        int v145 = v144 - v52;
        if (v51 <= (int)v144 - (int)v52)
        {
LABEL_196:
          unint64_t v105 = (unint64_t)&v52[v51];
          v74 = sub_25C14B464(v52, v105, (unsigned int *)v50);
          goto LABEL_257;
        }
        v146 = sub_25C14B464(v52, v144, (unsigned int *)v50);
        if (!v146) {
          return 0;
        }
        v140 = (_OWORD *)a6[1];
        int v141 = v146 - v140;
        int v103 = v51 - v145;
        if (v51 - v145 <= 16)
        {
LABEL_347:
          LOWORD(__p.__r_.__value_.__l.__data_) = 0;
          *(void *)&v235[16] = 0;
          *(_OWORD *)v235 = *v140;
          v220 = &v235[v103];
          v221 = sub_25C14B464(&v235[v141], (unint64_t)v220, (unsigned int *)v50);
          goto LABEL_357;
        }
        if (a6[3].i32[1] >= 17)
        {
          v147 = sub_25C14AC64((uint64_t)a6);
          if (v147)
          {
            int v51 = v51 - v145 - v141;
            int v52 = (char *)v147 + v141;
            continue;
          }
        }
        return 0;
      }
    case 5u:
      int v41 = sub_25C13F144(a1, v11, 5, v228, v230);
      int v42 = *a3;
      if (*a3 < 0)
      {
        int v43 = (char *)sub_25C14B1B0((uint64_t)a3, *a3);
        if (!v43) {
          return 0;
        }
        int v42 = v97;
      }
      else
      {
        int v43 = a3 + 1;
      }
      while (2)
      {
        unint64_t v98 = (unint64_t)a6[1];
        int v99 = v98 - v43;
        if (v42 <= (int)v98 - (int)v43) {
          goto LABEL_148;
        }
        v100 = sub_25C14B3B4(v43, v98, (unsigned int *)v41);
        if (!v100) {
          return 0;
        }
        v101 = (_OWORD *)a6[1];
        int v102 = v100 - v101;
        int v103 = v42 - v99;
        if (v42 - v99 <= 16) {
          goto LABEL_344;
        }
        if (a6[3].i32[1] >= 17)
        {
          v104 = sub_25C14AC64((uint64_t)a6);
          if (v104)
          {
            int v42 = v42 - v99 - v102;
            int v43 = (char *)v104 + v102;
            continue;
          }
        }
        return 0;
      }
    case 6u:
      uint64_t v44 = sub_25C13F144(a1, v11, 6, v228, v230);
      int v45 = *a3;
      if (*a3 < 0)
      {
        uint64_t v148 = sub_25C14B1B0((uint64_t)a3, *a3);
        if (!v148) {
          return 0;
        }
        char v46 = (const void *)v148;
        int v45 = v149;
      }
      else
      {
        char v46 = a3 + 1;
      }
      while (2)
      {
        int v150 = a6[1].i32[0] - v46 + 16;
        if (v45 <= v150) {
          goto LABEL_244;
        }
        sub_25C14C038((unsigned int *)v44, *(_DWORD *)v44 + (v150 >> 3));
        uint64_t v151 = *(int *)v44;
        v152 = (void *)(v44[1] + 8 * v151);
        *(_DWORD *)uint64_t v44 = v151 + (v150 >> 3);
        memcpy(v152, v46, (int)(v150 & 0xFFFFFFF8));
        if (a6[3].i32[1] >= 17)
        {
          v153 = sub_25C14AC64((uint64_t)a6);
          if (v153)
          {
            v45 -= v150 & 0xFFFFFFF8;
            char v46 = (char *)v153 - (v150 & 7) + 16;
            continue;
          }
        }
        return 0;
      }
    case 7u:
      uint64_t v44 = sub_25C13F144(a1, v11, 7, v228, v230);
      int v45 = *a3;
      if (*a3 < 0)
      {
        uint64_t v154 = sub_25C14B1B0((uint64_t)a3, *a3);
        if (!v154) {
          return 0;
        }
        char v46 = (const void *)v154;
        int v45 = v155;
      }
      else
      {
        char v46 = a3 + 1;
      }
      while (2)
      {
        int v156 = a6[1].i32[0] - v46 + 16;
        if (v45 <= v156) {
          goto LABEL_219;
        }
        sub_25C14BEC0((unsigned int *)v44, *(_DWORD *)v44 + (v156 >> 2));
        uint64_t v157 = *(int *)v44;
        v158 = (void *)(v44[1] + 4 * v157);
        *(_DWORD *)uint64_t v44 = v157 + (v156 >> 2);
        memcpy(v158, v46, (int)(v156 & 0xFFFFFFFC));
        if (a6[3].i32[1] >= 17)
        {
          v159 = sub_25C14AC64((uint64_t)a6);
          if (v159)
          {
            v45 -= v156 & 0xFFFFFFFC;
            char v46 = (char *)v159 - (v156 & 3) + 16;
            continue;
          }
        }
        return 0;
      }
    case 8u:
      int v53 = sub_25C13F144(a1, v11, 8, v228, v230);
      int v54 = *a3;
      if (*a3 < 0)
      {
        char v55 = (char *)sub_25C14B1B0((uint64_t)a3, *a3);
        if (!v55) {
          return 0;
        }
        int v54 = v164;
      }
      else
      {
        char v55 = a3 + 1;
      }
      while (2)
      {
        unint64_t v165 = (unint64_t)a6[1];
        int v166 = v165 - v55;
        if (v54 <= (int)v165 - (int)v55)
        {
          unint64_t v105 = (unint64_t)&v55[v54];
          v74 = sub_25C14B67C(v55, v105, (unsigned int *)v53);
          goto LABEL_257;
        }
        v167 = sub_25C14B67C(v55, v165, (unsigned int *)v53);
        if (!v167) {
          return 0;
        }
        v168 = (_OWORD *)a6[1];
        int v169 = v167 - v168;
        int v103 = v54 - v166;
        if (v54 - v166 <= 16)
        {
          LOWORD(__p.__r_.__value_.__l.__data_) = 0;
          *(void *)&v235[16] = 0;
          *(_OWORD *)v235 = *v168;
          v220 = &v235[v103];
          v221 = sub_25C14B67C(&v235[v169], (unint64_t)v220, (unsigned int *)v53);
          goto LABEL_357;
        }
        if (a6[3].i32[1] >= 17)
        {
          v170 = sub_25C14AC64((uint64_t)a6);
          if (v170)
          {
            int v54 = v54 - v166 - v169;
            char v55 = (char *)v170 + v169;
            continue;
          }
        }
        return 0;
      }
    case 9u:
    case 0xAu:
    case 0xBu:
    case 0xCu:
      *(_DWORD *)v235 = 3;
      *(void *)&v235[8] = "/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsen"
                            "tencepiece/third_party/protobuf-lite/google/protobuf/extension_set_inl.h";
      *(_DWORD *)&v235[16] = 79;
      memset(&__p, 0, sizeof(__p));
      std::string::append(&__p, "Non-primitive types can't be packed.");
      sub_25C13D6C8((unsigned int *)v235);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      return (uint64_t)a3;
    case 0xDu:
      int v41 = sub_25C13F144(a1, v11, 13, v228, v230);
      int v42 = *a3;
      if (*a3 < 0)
      {
        int v43 = (char *)sub_25C14B1B0((uint64_t)a3, *a3);
        if (!v43) {
          return 0;
        }
        int v42 = v106;
      }
      else
      {
        int v43 = a3 + 1;
      }
      while (2)
      {
        unint64_t v107 = (unint64_t)a6[1];
        int v108 = v107 - v43;
        if (v42 <= (int)v107 - (int)v43)
        {
LABEL_148:
          unint64_t v105 = (unint64_t)&v43[v42];
          v74 = sub_25C14B3B4(v43, v105, (unsigned int *)v41);
          goto LABEL_257;
        }
        v109 = sub_25C14B3B4(v43, v107, (unsigned int *)v41);
        if (!v109) {
          return 0;
        }
        v101 = (_OWORD *)a6[1];
        int v102 = v109 - v101;
        int v103 = v42 - v108;
        if (v42 - v108 <= 16)
        {
LABEL_344:
          LOWORD(__p.__r_.__value_.__l.__data_) = 0;
          *(void *)&v235[16] = 0;
          *(_OWORD *)v235 = *v101;
          v220 = &v235[v103];
          v221 = sub_25C14B3B4(&v235[v102], (unint64_t)v220, (unsigned int *)v41);
          goto LABEL_357;
        }
        if (a6[3].i32[1] >= 17)
        {
          v110 = sub_25C14AC64((uint64_t)a6);
          if (v110)
          {
            int v42 = v42 - v108 - v102;
            int v43 = (char *)v110 + v102;
            continue;
          }
        }
        return 0;
      }
    case 0xEu:
      uint64_t v56 = sub_25C13F144(a1, v11, 14, v228, v230);
      int v57 = *a3;
      if (*a3 < 0)
      {
        uint64_t v58 = (char *)sub_25C14B1B0((uint64_t)a3, *a3);
        if (!v58) {
          return 0;
        }
        int v57 = v171;
      }
      else
      {
        uint64_t v58 = a3 + 1;
      }
      while (2)
      {
        unint64_t v172 = (unint64_t)a6[1];
        int v173 = v172 - v58;
        if (v57 <= (int)v172 - (int)v58)
        {
          v231 = (unsigned int *)v56;
          long long v232 = v229;
          unint64_t v105 = (unint64_t)&v58[v57];
          v233 = a5;
          int v234 = v11;
          v74 = sub_25C142D3C(v58, v105, &v231);
          goto LABEL_257;
        }
        *(void *)v235 = v56;
        *(_OWORD *)&v235[8] = v229;
        __p.__r_.__value_.__r.__words[0] = (std::string::size_type)a5;
        LODWORD(__p.__r_.__value_.__r.__words[1]) = v11;
        v174 = sub_25C142D3C(v58, v172, (unsigned int **)v235);
        if (!v174) {
          return 0;
        }
        v175 = (long long *)a6[1];
        int v176 = v174 - v175;
        int v177 = v57 - v173;
        if (v57 - v173 <= 16)
        {
          __int16 v239 = 0;
          uint64_t v238 = 0;
          long long v237 = *v175;
          v231 = (unsigned int *)v56;
          long long v232 = v229;
          v233 = a5;
          int v234 = v11;
          v222 = sub_25C142D3C((char *)&v237 + v176, (unint64_t)&v237 + v177, &v231);
          if (v222) {
            BOOL v223 = v222 == (char *)&v237 + v177;
          }
          else {
            BOOL v223 = 0;
          }
          if (v223)
          {
            uint64_t v224 = v177;
            return *(void *)&a6[1] + v224;
          }
        }
        else if (a6[3].i32[1] >= 17)
        {
          v178 = sub_25C14AC64((uint64_t)a6);
          if (v178)
          {
            int v57 = v57 - v173 - v176;
            uint64_t v58 = (char *)v178 + v176;
            continue;
          }
        }
        return 0;
      }
    case 0xFu:
      uint64_t v44 = sub_25C13F144(a1, v11, 15, v228, v230);
      int v45 = *a3;
      if (*a3 < 0)
      {
        uint64_t v111 = sub_25C14B1B0((uint64_t)a3, *a3);
        if (!v111) {
          return 0;
        }
        char v46 = (const void *)v111;
        int v45 = v112;
      }
      else
      {
        char v46 = a3 + 1;
      }
      while (2)
      {
        int v113 = a6[1].i32[0] - v46 + 16;
        if (v45 <= v113)
        {
LABEL_219:
          sub_25C14BEC0((unsigned int *)v44, *(_DWORD *)v44 + (v45 >> 2));
          int v160 = v45 >> 2;
          signed int v161 = v45 & 0xFFFFFFFC;
          uint64_t v162 = *(int *)v44;
          v163 = (void *)(v44[1] + 4 * v162);
          goto LABEL_245;
        }
        sub_25C14BEC0((unsigned int *)v44, *(_DWORD *)v44 + (v113 >> 2));
        uint64_t v114 = *(int *)v44;
        v115 = (void *)(v44[1] + 4 * v114);
        *(_DWORD *)uint64_t v44 = v114 + (v113 >> 2);
        memcpy(v115, v46, (int)(v113 & 0xFFFFFFFC));
        if (a6[3].i32[1] >= 17)
        {
          v116 = sub_25C14AC64((uint64_t)a6);
          if (v116)
          {
            v45 -= v113 & 0xFFFFFFFC;
            char v46 = (char *)v116 - (v113 & 3) + 16;
            continue;
          }
        }
        return 0;
      }
    case 0x10u:
      uint64_t v44 = sub_25C13F144(a1, v11, 16, v228, v230);
      int v45 = *a3;
      if (*a3 < 0)
      {
        uint64_t v179 = sub_25C14B1B0((uint64_t)a3, *a3);
        if (!v179) {
          return 0;
        }
        char v46 = (const void *)v179;
        int v45 = v180;
      }
      else
      {
        char v46 = a3 + 1;
      }
      while (2)
      {
        int v181 = a6[1].i32[0] - v46 + 16;
        if (v45 <= v181)
        {
LABEL_244:
          sub_25C14C038((unsigned int *)v44, *(_DWORD *)v44 + (v45 >> 3));
          int v160 = v45 >> 3;
          signed int v161 = v45 & 0xFFFFFFF8;
          uint64_t v162 = *(int *)v44;
          v163 = (void *)(v44[1] + 8 * v162);
LABEL_245:
          *(_DWORD *)uint64_t v44 = v162 + v160;
          memcpy(v163, v46, v161);
          if (v45 == v161) {
            return (uint64_t)v46 + v161;
          }
          else {
            return 0;
          }
        }
        sub_25C14C038((unsigned int *)v44, *(_DWORD *)v44 + (v181 >> 3));
        uint64_t v182 = *(int *)v44;
        v183 = (void *)(v44[1] + 8 * v182);
        *(_DWORD *)uint64_t v44 = v182 + (v181 >> 3);
        memcpy(v183, v46, (int)(v181 & 0xFFFFFFF8));
        if (a6[3].i32[1] >= 17)
        {
          v184 = sub_25C14AC64((uint64_t)a6);
          if (v184)
          {
            v45 -= v181 & 0xFFFFFFF8;
            char v46 = (char *)v184 - (v181 & 7) + 16;
            continue;
          }
        }
        break;
      }
      return 0;
    case 0x11u:
      char v47 = sub_25C13F144(a1, v11, 17, v228, v230);
      int v48 = *a3;
      if (*a3 < 0)
      {
        uint64_t v49 = (char *)sub_25C14B1B0((uint64_t)a3, *a3);
        if (!v49) {
          return 0;
        }
        int v48 = v117;
      }
      else
      {
        uint64_t v49 = a3 + 1;
      }
      while (2)
      {
        unint64_t v118 = (unint64_t)a6[1];
        int v119 = v118 - v49;
        if (v48 <= (int)v118 - (int)v49)
        {
          unint64_t v105 = (unint64_t)&v49[v48];
          v74 = sub_25C14B514(v49, v105, (unsigned int *)v47);
          goto LABEL_257;
        }
        v120 = sub_25C14B514(v49, v118, (unsigned int *)v47);
        if (!v120) {
          return 0;
        }
        v121 = (_OWORD *)a6[1];
        int v122 = v120 - v121;
        int v103 = v48 - v119;
        if (v48 - v119 <= 16)
        {
          LOWORD(__p.__r_.__value_.__l.__data_) = 0;
          *(void *)&v235[16] = 0;
          *(_OWORD *)v235 = *v121;
          v220 = &v235[v103];
          v221 = sub_25C14B514(&v235[v122], (unint64_t)v220, (unsigned int *)v47);
          goto LABEL_357;
        }
        if (a6[3].i32[1] >= 17)
        {
          v123 = sub_25C14AC64((uint64_t)a6);
          if (v123)
          {
            int v48 = v48 - v119 - v122;
            uint64_t v49 = (char *)v123 + v122;
            continue;
          }
        }
        return 0;
      }
    case 0x12u:
      int v59 = sub_25C13F144(a1, v11, 18, v228, v230);
      int v60 = *a3;
      if (*a3 < 0)
      {
        uint64_t v61 = (char *)sub_25C14B1B0((uint64_t)a3, *a3);
        if (!v61) {
          return 0;
        }
        int v60 = v185;
      }
      else
      {
        uint64_t v61 = a3 + 1;
      }
      break;
    default:
      return (uint64_t)a3;
  }
  while (1)
  {
    unint64_t v186 = (unint64_t)a6[1];
    int v187 = v186 - v61;
    if (v60 <= (int)v186 - (int)v61)
    {
      unint64_t v105 = (unint64_t)&v61[v60];
      v74 = sub_25C14B5C8(v61, v105, (unsigned int *)v59);
LABEL_257:
      BOOL v76 = v105 == (void)v74;
LABEL_258:
      if (v76) {
        return (uint64_t)v74;
      }
      else {
        return 0;
      }
    }
    v188 = sub_25C14B5C8(v61, v186, (unsigned int *)v59);
    if (!v188) {
      return 0;
    }
    v189 = (_OWORD *)a6[1];
    int v190 = v188 - v189;
    int v103 = v60 - v187;
    if (v60 - v187 <= 16) {
      break;
    }
    if (a6[3].i32[1] < 17) {
      return 0;
    }
    v191 = sub_25C14AC64((uint64_t)a6);
    if (!v191) {
      return 0;
    }
    int v60 = v60 - v187 - v190;
    uint64_t v61 = (char *)v191 + v190;
  }
  LOWORD(__p.__r_.__value_.__l.__data_) = 0;
  *(void *)&v235[16] = 0;
  *(_OWORD *)v235 = *v189;
  v220 = &v235[v103];
  v221 = sub_25C14B5C8(&v235[v190], (unint64_t)v220, (unsigned int *)v59);
LABEL_357:
  if (v221) {
    BOOL v225 = v221 == v220;
  }
  else {
    BOOL v225 = 0;
  }
  if (v225)
  {
    uint64_t v224 = v103;
    return *(void *)&a6[1] + v224;
  }
  return 0;
}

void sub_25C142A68(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *__p,uint64_t a27,int a28,__int16 a29,char a30,char a31)
{
  if (a31 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

char *sub_25C142B28(unint64_t *a1)
{
  unint64_t v2 = *a1 & 0xFFFFFFFFFFFFFFFELL;
  if ((*a1 & 1) == 0)
  {
    if (v2) {
      goto LABEL_3;
    }
LABEL_7:
    operator new();
  }
  unint64_t v2 = *(void *)v2;
  if (!v2) {
    goto LABEL_7;
  }
LABEL_3:
  if (*(unsigned char *)(v2 + 24)) {
    (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v2 + 32) + 32) + 40))(*(void *)(*(void *)(v2 + 32) + 32), &unk_2709892C0, 32);
  }
  unint64_t v3 = (unint64_t)sub_25C1360BC((void *)v2, 0x20uLL, (uint64_t)sub_25C142E84);
  *(_OWORD *)unint64_t v3 = 0u;
  *(_OWORD *)(v3 + 16) = 0u;
  *a1 = v3 | 1;
  *(void *)unint64_t v3 = v2;
  return (char *)(v3 + 8);
}

const std::string::value_type *sub_25C142BF0(uint64_t a1, std::string::value_type *__s, int a3, std::string *this)
{
  uint64_t v5 = __s;
  uint64_t v6 = a3;
  if (*(void *)(a1 + 8) - (void)__s + 16 >= a3)
  {
    MEMORY[0x26117F1E0](this, __s, a3);
    return &v5[v6];
  }
  else
  {
    int v7 = a3;
    if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
    {
      *this->__r_.__value_.__l.__data_ = 0;
      this->__r_.__value_.__l.__size_ = 0;
    }
    else
    {
      this->__r_.__value_.__s.__data_[0] = 0;
      *((unsigned char *)&this->__r_.__value_.__s + 23) = 0;
    }
    uint64_t v10 = *(void *)(a1 + 8);
    if (v10 - (uint64_t)__s + *(int *)(a1 + 28) >= a3)
    {
      if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
        std::string::size_type size = this->__r_.__value_.__l.__size_;
      }
      else {
        std::string::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
      }
      if (a3 >= 50000000) {
        int v12 = 50000000;
      }
      else {
        int v12 = a3;
      }
      std::string::reserve(this, size + v12);
      uint64_t v10 = *(void *)(a1 + 8);
    }
    int v13 = v10 - v5 + 16;
    while (*(void *)(a1 + 16))
    {
      std::string::append(this, v5, v13);
      if (*(int *)(a1 + 28) < 17) {
        break;
      }
      uint64_t result = (const std::string::value_type *)sub_25C14AC64(a1);
      if (!result) {
        return result;
      }
      v7 -= v13;
      uint64_t v5 = result + 16;
      int v13 = *(_DWORD *)(a1 + 8) - result;
      if (v7 <= v13)
      {
        std::string::append(this, v5, v7);
        return &v5[v7];
      }
    }
    return 0;
  }
}

char *sub_25C142D3C(char *a1, unint64_t a2, unsigned int **a3)
{
  unint64_t v3 = a1;
  while ((unint64_t)v3 < a2)
  {
    unint64_t v6 = *v3;
    if (*v3 < 0)
    {
      int v7 = v3[1];
      unint64_t v6 = (v6 + (v7 << 7) - 128);
      if ((v7 & 0x80) != 0)
      {
        char v8 = 14;
        uint64_t v9 = 2;
        while (1)
        {
          v6 += (v3[v9] - 1) << v8;
          if ((v3[v9] & 0x80000000) == 0) {
            break;
          }
          ++v9;
          v8 += 7;
          if (v9 == 10) {
            return 0;
          }
        }
        v3 += v9 + 1;
      }
      else
      {
        v3 += 2;
      }
    }
    else
    {
      ++v3;
    }
    if (((unsigned int (*)(unsigned int *, unint64_t))a3[1])(a3[2], v6))
    {
      uint64_t v10 = *a3;
      uint64_t v11 = **a3;
      if (v11 == (*a3)[1])
      {
        unsigned int v12 = v11 + 1;
        sub_25C14BEC0(*a3, v11 + 1);
        *(_DWORD *)(*((void *)v10 + 1) + 4 * v11) = v6;
      }
      else
      {
        *(_DWORD *)(*((void *)v10 + 1) + 4 * v11) = v6;
        unsigned int v12 = v11 + 1;
      }
      unsigned int *v10 = v12;
    }
    else
    {
      int v13 = *((_DWORD *)a3 + 8);
      unint64_t v14 = (unint64_t *)a3[3];
      if (*v14) {
        char v15 = (std::string *)((*v14 & 0xFFFFFFFFFFFFFFFELL) + 8);
      }
      else {
        char v15 = (std::string *)sub_25C142B28(v14);
      }
      sub_25C14B228(v13, v6, v15);
    }
  }
  return v3;
}

void sub_25C142E84(uint64_t a1)
{
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*(void **)(a1 + 8));
  }
}

uint64_t sub_25C142E98(uint64_t a1, char **a2, int a3)
{
  if ((unint64_t)*a2 < *(void *)a1) {
    return 0;
  }
  int v5 = *a2 - *(_DWORD *)(a1 + 8);
  if (*(_DWORD *)(a1 + 28) == v5)
  {
    if (v5 >= 1 && !*(void *)(a1 + 16)) {
      *a2 = 0;
    }
    return 1;
  }
  else
  {
    *a2 = sub_25C14ADFC(a1, v5, a3);
    return v6 & 1;
  }
}

char *sub_25C142F0C(uint64_t a1, char *a2, _DWORD *a3)
{
  int v5 = *(_DWORD **)(a1 + 16);
  if (*(unsigned __int16 *)(a1 + 8) >= 0x101u)
  {
    uint64_t v15 = *((void *)v5 + 1);
    unint64_t v14 = v5 + 2;
    uint64_t v13 = v15;
    if (v15)
    {
      uint64_t v16 = v14;
      do
      {
        int v17 = *(_DWORD *)(v13 + 32);
        BOOL v18 = v17 < 200;
        if (v17 >= 200) {
          uint64_t v19 = (uint64_t *)v13;
        }
        else {
          uint64_t v19 = (uint64_t *)(v13 + 8);
        }
        if (!v18) {
          uint64_t v16 = (void *)v13;
        }
        uint64_t v13 = *v19;
      }
      while (*v19);
      if (v16 != v14)
      {
        do
        {
          signed int v20 = *((_DWORD *)v16 + 8);
          if (v20 > 0x1FFFFFFF) {
            break;
          }
          a2 = sub_25C143040((unsigned char *)v16 + 40, v20, a2, a3);
          uint64_t v21 = (void *)v16[1];
          if (v21)
          {
            do
            {
              double v22 = v21;
              uint64_t v21 = (void *)*v21;
            }
            while (v21);
          }
          else
          {
            do
            {
              double v22 = (void *)v16[2];
              BOOL v23 = *v22 == (void)v16;
              uint64_t v16 = v22;
            }
            while (!v23);
          }
          uint64_t v16 = v22;
        }
        while (v22 != v14);
      }
    }
  }
  else
  {
    unint64_t v6 = *(unsigned __int16 *)(a1 + 10);
    if (*(_WORD *)(a1 + 10))
    {
      int v7 = &v5[8 * v6];
      do
      {
        unint64_t v8 = v6 >> 1;
        uint64_t v9 = &v5[8 * (v6 >> 1)];
        int v11 = *v9;
        uint64_t v10 = v9 + 8;
        v6 += ~(v6 >> 1);
        if (v11 < 200) {
          int v5 = v10;
        }
        else {
          unint64_t v6 = v8;
        }
      }
      while (v6);
      for (; v5 != v7; v5 += 8)
      {
        if ((int)*v5 > 0x1FFFFFFF) {
          break;
        }
        a2 = sub_25C143040((unsigned char *)v5 + 8, *v5, a2, a3);
      }
    }
  }
  return a2;
}

char *sub_25C143040(unsigned char *a1, unsigned int a2, char *a3, _DWORD *a4)
{
  int v5 = a3;
  if (a1[9])
  {
    if (a1[11])
    {
      if (*((_DWORD *)a1 + 3))
      {
        if (*(void *)a4 <= (unint64_t)a3) {
          int v5 = (char *)sub_25C13CEE0((uint64_t)a4, (int)a3);
        }
        unsigned int v8 = (8 * a2) | 2;
        if (v8 > 0x7F)
        {
          *int v5 = (8 * a2) | 0x82;
          unsigned int v30 = (8 * a2) >> 7;
          if (v8 >> 14)
          {
            int v31 = v5 + 1;
            do
            {
              uint64_t v32 = v31;
              *v31++ = v30 | 0x80;
              unsigned int v33 = v30 >> 7;
              unsigned int v34 = v30 >> 14;
              v30 >>= 7;
            }
            while (v34);
            uint64_t v9 = v32 + 2;
            unsigned char *v31 = v33;
          }
          else
          {
            v5[1] = v30;
            uint64_t v9 = v5 + 2;
          }
        }
        else
        {
          *int v5 = v8;
          uint64_t v9 = v5 + 1;
        }
        unint64_t v35 = *((int *)a1 + 3);
        if (v35 > 0x7F)
        {
          *uint64_t v9 = v35 | 0x80;
          unint64_t v36 = v35 >> 7;
          if (v35 >> 14)
          {
            int v37 = v9 + 1;
            do
            {
              unint64_t v38 = v37;
              *v37++ = v36 | 0x80;
              unint64_t v39 = v36 >> 7;
              unint64_t v40 = v36 >> 14;
              v36 >>= 7;
            }
            while (v40);
            int v5 = v38 + 2;
            unsigned char *v37 = v39;
          }
          else
          {
            v9[1] = v36;
            int v5 = v9 + 2;
          }
        }
        else
        {
          *uint64_t v9 = v35;
          int v5 = v9 + 1;
        }
        switch(a1[8])
        {
          case 1:
            __int16 v68 = *(int **)a1;
            if (**(int **)a1 >= 1)
            {
              uint64_t v69 = 0;
              do
              {
                if (*(void *)a4 <= (unint64_t)v5)
                {
                  int v5 = (char *)sub_25C13CEE0((uint64_t)a4, (int)v5);
                  __int16 v68 = *(int **)a1;
                }
                *(void *)int v5 = *(void *)(*((void *)v68 + 1) + 8 * v69);
                v5 += 8;
                ++v69;
                __int16 v68 = *(int **)a1;
              }
              while (v69 < **(int **)a1);
            }
            break;
          case 2:
            uint64_t v70 = *(void *)a1;
            if (**(int **)a1 >= 1)
            {
              uint64_t v71 = 0;
              do
              {
                if (*(void *)a4 <= (unint64_t)v5)
                {
                  int v5 = (char *)sub_25C13CEE0((uint64_t)a4, (int)v5);
                  uint64_t v70 = *(void *)a1;
                }
                *(_DWORD *)int v5 = *(_DWORD *)(*(void *)(v70 + 8) + 4 * v71);
                v5 += 4;
                ++v71;
                uint64_t v70 = *(void *)a1;
              }
              while (v71 < **(int **)a1);
            }
            break;
          case 3:
            uint64_t v72 = *(void *)a1;
            if (**(int **)a1 >= 1)
            {
              uint64_t v73 = 0;
              do
              {
                if (*(void *)a4 <= (unint64_t)v5)
                {
                  int v5 = (char *)sub_25C13CEE0((uint64_t)a4, (int)v5);
                  uint64_t v72 = *(void *)a1;
                }
                unint64_t v74 = *(void *)(*(void *)(v72 + 8) + 8 * v73);
                if (v74 > 0x7F)
                {
                  *int v5 = v74 | 0x80;
                  unint64_t v75 = v74 >> 7;
                  if (v74 >> 14)
                  {
                    BOOL v76 = v5 + 1;
                    do
                    {
                      uint64_t v77 = v76;
                      *v76++ = v75 | 0x80;
                      unint64_t v78 = v75 >> 7;
                      unint64_t v79 = v75 >> 14;
                      v75 >>= 7;
                    }
                    while (v79);
                    int v5 = v77 + 2;
                    unsigned char *v76 = v78;
                  }
                  else
                  {
                    v5[1] = v75;
                    v5 += 2;
                  }
                }
                else
                {
                  *v5++ = v74;
                }
                ++v73;
                uint64_t v72 = *(void *)a1;
              }
              while (v73 < **(int **)a1);
            }
            break;
          case 4:
            uint64_t v80 = *(void *)a1;
            if (**(int **)a1 >= 1)
            {
              uint64_t v81 = 0;
              do
              {
                if (*(void *)a4 <= (unint64_t)v5)
                {
                  int v5 = (char *)sub_25C13CEE0((uint64_t)a4, (int)v5);
                  uint64_t v80 = *(void *)a1;
                }
                unint64_t v82 = *(void *)(*(void *)(v80 + 8) + 8 * v81);
                if (v82 > 0x7F)
                {
                  *int v5 = v82 | 0x80;
                  unint64_t v83 = v82 >> 7;
                  if (v82 >> 14)
                  {
                    int v84 = v5 + 1;
                    do
                    {
                      __int32 v85 = v84;
                      *v84++ = v83 | 0x80;
                      unint64_t v86 = v83 >> 7;
                      unint64_t v87 = v83 >> 14;
                      v83 >>= 7;
                    }
                    while (v87);
                    int v5 = v85 + 2;
                    *int v84 = v86;
                  }
                  else
                  {
                    v5[1] = v83;
                    v5 += 2;
                  }
                }
                else
                {
                  *v5++ = v82;
                }
                ++v81;
                uint64_t v80 = *(void *)a1;
              }
              while (v81 < **(int **)a1);
            }
            break;
          case 5:
            uint64_t v41 = *(void *)a1;
            if (**(int **)a1 >= 1)
            {
              uint64_t v42 = 0;
              do
              {
                if (*(void *)a4 <= (unint64_t)v5)
                {
                  int v5 = (char *)sub_25C13CEE0((uint64_t)a4, (int)v5);
                  uint64_t v41 = *(void *)a1;
                }
                unint64_t v43 = *(int *)(*(void *)(v41 + 8) + 4 * v42);
                if (v43 > 0x7F)
                {
                  *int v5 = v43 | 0x80;
                  unint64_t v44 = v43 >> 7;
                  if (v43 >> 14)
                  {
                    int v45 = v5 + 1;
                    do
                    {
                      char v46 = v45;
                      *v45++ = v44 | 0x80;
                      unint64_t v47 = v44 >> 7;
                      unint64_t v48 = v44 >> 14;
                      v44 >>= 7;
                    }
                    while (v48);
                    int v5 = v46 + 2;
                    unsigned char *v45 = v47;
                  }
                  else
                  {
                    v5[1] = v44;
                    v5 += 2;
                  }
                }
                else
                {
                  *v5++ = v43;
                }
                ++v42;
                uint64_t v41 = *(void *)a1;
              }
              while (v42 < **(int **)a1);
            }
            break;
          case 6:
            uint64_t v88 = *(void *)a1;
            if (**(int **)a1 >= 1)
            {
              uint64_t v89 = 0;
              do
              {
                if (*(void *)a4 <= (unint64_t)v5)
                {
                  int v5 = (char *)sub_25C13CEE0((uint64_t)a4, (int)v5);
                  uint64_t v88 = *(void *)a1;
                }
                *(void *)int v5 = *(void *)(*(void *)(v88 + 8) + 8 * v89);
                v5 += 8;
                ++v89;
                uint64_t v88 = *(void *)a1;
              }
              while (v89 < **(int **)a1);
            }
            break;
          case 7:
            uint64_t v90 = *(void *)a1;
            if (**(int **)a1 >= 1)
            {
              uint64_t v91 = 0;
              do
              {
                if (*(void *)a4 <= (unint64_t)v5)
                {
                  int v5 = (char *)sub_25C13CEE0((uint64_t)a4, (int)v5);
                  uint64_t v90 = *(void *)a1;
                }
                *(_DWORD *)int v5 = *(_DWORD *)(*(void *)(v90 + 8) + 4 * v91);
                v5 += 4;
                ++v91;
                uint64_t v90 = *(void *)a1;
              }
              while (v91 < **(int **)a1);
            }
            break;
          case 8:
            uint64_t v92 = *(void *)a1;
            if (**(int **)a1 >= 1)
            {
              uint64_t v93 = 0;
              do
              {
                if (*(void *)a4 <= (unint64_t)v5)
                {
                  int v5 = (char *)sub_25C13CEE0((uint64_t)a4, (int)v5);
                  uint64_t v92 = *(void *)a1;
                }
                *v5++ = *(unsigned char *)(*(void *)(v92 + 8) + v93++);
                uint64_t v92 = *(void *)a1;
              }
              while (v93 < **(int **)a1);
            }
            break;
          case 9:
          case 0xA:
          case 0xB:
          case 0xC:
            unsigned int v521 = 3;
            v522 = "/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiec"
                   "e/third_party/protobuf-lite/extension_set.cc";
            int v523 = 1966;
            memset(&__p, 0, sizeof(__p));
            std::string::append(&__p, "Non-primitive types can't be packed.");
            sub_25C13D6C8(&v521);
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(__p.__r_.__value_.__l.__data_);
            }
            break;
          case 0xD:
            uint64_t v49 = *(void *)a1;
            if (**(int **)a1 >= 1)
            {
              uint64_t v50 = 0;
              do
              {
                if (*(void *)a4 <= (unint64_t)v5)
                {
                  int v5 = (char *)sub_25C13CEE0((uint64_t)a4, (int)v5);
                  uint64_t v49 = *(void *)a1;
                }
                unsigned int v51 = *(_DWORD *)(*(void *)(v49 + 8) + 4 * v50);
                if (v51 > 0x7F)
                {
                  *int v5 = v51 | 0x80;
                  unsigned int v52 = v51 >> 7;
                  if (v51 >> 14)
                  {
                    int v53 = v5 + 1;
                    do
                    {
                      int v54 = v53;
                      *v53++ = v52 | 0x80;
                      unsigned int v55 = v52 >> 7;
                      unsigned int v56 = v52 >> 14;
                      v52 >>= 7;
                    }
                    while (v56);
                    int v5 = v54 + 2;
                    *int v53 = v55;
                  }
                  else
                  {
                    v5[1] = v52;
                    v5 += 2;
                  }
                }
                else
                {
                  *v5++ = v51;
                }
                ++v50;
                uint64_t v49 = *(void *)a1;
              }
              while (v50 < **(int **)a1);
            }
            break;
          case 0xE:
            uint64_t v94 = *(void *)a1;
            if (**(int **)a1 >= 1)
            {
              uint64_t v95 = 0;
              do
              {
                if (*(void *)a4 <= (unint64_t)v5)
                {
                  int v5 = (char *)sub_25C13CEE0((uint64_t)a4, (int)v5);
                  uint64_t v94 = *(void *)a1;
                }
                unint64_t v96 = *(int *)(*(void *)(v94 + 8) + 4 * v95);
                if (v96 > 0x7F)
                {
                  *int v5 = v96 | 0x80;
                  unint64_t v97 = v96 >> 7;
                  if (v96 >> 14)
                  {
                    unint64_t v98 = v5 + 1;
                    do
                    {
                      int v99 = v98;
                      *v98++ = v97 | 0x80;
                      unint64_t v100 = v97 >> 7;
                      unint64_t v101 = v97 >> 14;
                      v97 >>= 7;
                    }
                    while (v101);
                    int v5 = v99 + 2;
                    *unint64_t v98 = v100;
                  }
                  else
                  {
                    v5[1] = v97;
                    v5 += 2;
                  }
                }
                else
                {
                  *v5++ = v96;
                }
                ++v95;
                uint64_t v94 = *(void *)a1;
              }
              while (v95 < **(int **)a1);
            }
            break;
          case 0xF:
            uint64_t v57 = *(void *)a1;
            if (**(int **)a1 >= 1)
            {
              uint64_t v58 = 0;
              do
              {
                if (*(void *)a4 <= (unint64_t)v5)
                {
                  int v5 = (char *)sub_25C13CEE0((uint64_t)a4, (int)v5);
                  uint64_t v57 = *(void *)a1;
                }
                *(_DWORD *)int v5 = *(_DWORD *)(*(void *)(v57 + 8) + 4 * v58);
                v5 += 4;
                ++v58;
                uint64_t v57 = *(void *)a1;
              }
              while (v58 < **(int **)a1);
            }
            break;
          case 0x10:
            uint64_t v102 = *(void *)a1;
            if (**(int **)a1 >= 1)
            {
              uint64_t v103 = 0;
              do
              {
                if (*(void *)a4 <= (unint64_t)v5)
                {
                  int v5 = (char *)sub_25C13CEE0((uint64_t)a4, (int)v5);
                  uint64_t v102 = *(void *)a1;
                }
                *(void *)int v5 = *(void *)(*(void *)(v102 + 8) + 8 * v103);
                v5 += 8;
                ++v103;
                uint64_t v102 = *(void *)a1;
              }
              while (v103 < **(int **)a1);
            }
            break;
          case 0x11:
            uint64_t v59 = *(void *)a1;
            if (**(int **)a1 >= 1)
            {
              uint64_t v60 = 0;
              do
              {
                if (*(void *)a4 <= (unint64_t)v5)
                {
                  int v5 = (char *)sub_25C13CEE0((uint64_t)a4, (int)v5);
                  uint64_t v59 = *(void *)a1;
                }
                int v61 = *(_DWORD *)(*(void *)(v59 + 8) + 4 * v60);
                unsigned int v62 = (2 * v61) ^ (v61 >> 31);
                if (v62 > 0x7F)
                {
                  *int v5 = v62 | 0x80;
                  unsigned int v63 = v62 >> 7;
                  if (v62 >> 14)
                  {
                    uint64_t v64 = v5 + 1;
                    do
                    {
                      char v65 = v64;
                      *v64++ = v63 | 0x80;
                      unsigned int v66 = v63 >> 7;
                      unsigned int v67 = v63 >> 14;
                      v63 >>= 7;
                    }
                    while (v67);
                    int v5 = v65 + 2;
                    unsigned char *v64 = v66;
                  }
                  else
                  {
                    v5[1] = v63;
                    v5 += 2;
                  }
                }
                else
                {
                  *v5++ = v62;
                }
                ++v60;
                uint64_t v59 = *(void *)a1;
              }
              while (v60 < **(int **)a1);
            }
            break;
          case 0x12:
            uint64_t v104 = *(void *)a1;
            if (**(int **)a1 >= 1)
            {
              uint64_t v105 = 0;
              do
              {
                if (*(void *)a4 <= (unint64_t)v5)
                {
                  int v5 = (char *)sub_25C13CEE0((uint64_t)a4, (int)v5);
                  uint64_t v104 = *(void *)a1;
                }
                uint64_t v106 = *(void *)(*(void *)(v104 + 8) + 8 * v105);
                unint64_t v107 = (2 * v106) ^ (v106 >> 63);
                if (v107 > 0x7F)
                {
                  *int v5 = v107 | 0x80;
                  unint64_t v108 = v107 >> 7;
                  if (v107 >> 14)
                  {
                    v109 = v5 + 1;
                    do
                    {
                      v110 = v109;
                      *v109++ = v108 | 0x80;
                      unint64_t v111 = v108 >> 7;
                      unint64_t v112 = v108 >> 14;
                      v108 >>= 7;
                    }
                    while (v112);
                    int v5 = v110 + 2;
                    unsigned char *v109 = v111;
                  }
                  else
                  {
                    v5[1] = v108;
                    v5 += 2;
                  }
                }
                else
                {
                  *v5++ = v107;
                }
                ++v105;
                uint64_t v104 = *(void *)a1;
              }
              while (v105 < **(int **)a1);
            }
            break;
          default:
            return v5;
        }
      }
      return v5;
    }
    switch(a1[8])
    {
      case 1:
        uint64_t v17 = *(void *)a1;
        if (**(int **)a1 >= 1)
        {
          uint64_t v18 = 0;
          unsigned int v19 = (8 * a2) | 1;
          char v20 = (8 * a2) | 0x81;
          int v21 = (a2 >> 4) & 0x1FFFFFF;
          unsigned int v22 = (8 * a2) >> 7;
          BOOL v23 = a3;
          do
          {
            if (*(void *)a4 <= (unint64_t)v23)
            {
              BOOL v23 = sub_25C13CEE0((uint64_t)a4, (int)v23);
              uint64_t v17 = *(void *)a1;
            }
            uint64_t v24 = *(void *)(*(void *)(v17 + 8) + 8 * v18);
            int v25 = v23 + 1;
            if (v19 > 0x7F)
            {
              *BOOL v23 = v20;
              unsigned int v26 = v21;
              if (v19 >= 0x4000)
              {
                do
                {
                  unint64_t v27 = v25;
                  *v25++ = v26 | 0x80;
                  unsigned int v28 = v26 >> 7;
                  unsigned int v29 = v26 >> 14;
                  v26 >>= 7;
                }
                while (v29);
                *int v25 = v28;
                int v25 = v27 + 2;
              }
              else
              {
                v23[1] = v22;
                int v25 = v23 + 2;
              }
            }
            else
            {
              *BOOL v23 = v19;
            }
            *(void *)int v25 = v24;
            int v5 = v25 + 8;
            ++v18;
            uint64_t v17 = *(void *)a1;
            BOOL v23 = v5;
          }
          while (v18 < **(int **)a1);
        }
        return v5;
      case 2:
        uint64_t v113 = *(void *)a1;
        if (**(int **)a1 >= 1)
        {
          uint64_t v114 = 0;
          unsigned int v115 = (8 * a2) | 5;
          int v116 = (a2 >> 4) & 0x1FFFFFF;
          unsigned int v117 = (8 * a2) >> 7;
          unint64_t v118 = a3;
          char v119 = (8 * a2) | 0x85;
          do
          {
            if (*(void *)a4 <= (unint64_t)v118)
            {
              unint64_t v118 = sub_25C13CEE0((uint64_t)a4, (int)v118);
              uint64_t v113 = *(void *)a1;
            }
            int v120 = *(_DWORD *)(*(void *)(v113 + 8) + 4 * v114);
            v121 = v118 + 1;
            if (v115 > 0x7F)
            {
              *unint64_t v118 = v119;
              unsigned int v122 = v116;
              if (v115 >= 0x4000)
              {
                do
                {
                  v123 = v121;
                  *v121++ = v122 | 0x80;
                  unsigned int v124 = v122 >> 7;
                  unsigned int v125 = v122 >> 14;
                  v122 >>= 7;
                }
                while (v125);
                unsigned char *v121 = v124;
                v121 = v123 + 2;
              }
              else
              {
                v118[1] = v117;
                v121 = v118 + 2;
              }
            }
            else
            {
              *unint64_t v118 = v115;
            }
            *(_DWORD *)v121 = v120;
            int v5 = v121 + 4;
            ++v114;
            uint64_t v113 = *(void *)a1;
            unint64_t v118 = v5;
          }
          while (v114 < **(int **)a1);
        }
        return v5;
      case 3:
        uint64_t v126 = *(void *)a1;
        if (**(int **)a1 >= 1)
        {
          uint64_t v127 = 0;
          unsigned int v128 = 8 * a2;
          char v129 = (8 * a2) | 0x80;
          int v130 = (a2 >> 4) & 0x1FFFFFF;
          do
          {
            if (*(void *)a4 <= (unint64_t)v5)
            {
              int v5 = (char *)sub_25C13CEE0((uint64_t)a4, (int)v5);
              uint64_t v126 = *(void *)a1;
            }
            unint64_t v131 = *(void *)(*(void *)(v126 + 8) + 8 * v127);
            int v132 = v5 + 1;
            if (v128 > 0x7F)
            {
              *int v5 = v129;
              unsigned int v133 = v130;
              if (v128 >= 0x4000)
              {
                do
                {
                  v134 = v132;
                  *v132++ = v133 | 0x80;
                  unsigned int v135 = v133 >> 7;
                  unsigned int v136 = v133 >> 14;
                  v133 >>= 7;
                }
                while (v136);
                *int v132 = v135;
                int v132 = v134 + 2;
              }
              else
              {
                v5[1] = v128 >> 7;
                int v132 = v5 + 2;
              }
            }
            else
            {
              *int v5 = v128;
            }
            if (v131 > 0x7F)
            {
              *int v132 = v131 | 0x80;
              unint64_t v137 = v131 >> 7;
              if (v131 >> 14)
              {
                int v138 = v132 + 1;
                do
                {
                  v139 = v138;
                  *v138++ = v137 | 0x80;
                  unint64_t v140 = v137 >> 7;
                  unint64_t v141 = v137 >> 14;
                  v137 >>= 7;
                }
                while (v141);
                int v5 = v139 + 2;
                *int v138 = v140;
              }
              else
              {
                v132[1] = v137;
                int v5 = v132 + 2;
              }
            }
            else
            {
              *int v132 = v131;
              int v5 = v132 + 1;
            }
            ++v127;
            uint64_t v126 = *(void *)a1;
          }
          while (v127 < **(int **)a1);
        }
        return v5;
      case 4:
        uint64_t v142 = *(void *)a1;
        if (**(int **)a1 >= 1)
        {
          uint64_t v143 = 0;
          unsigned int v144 = 8 * a2;
          char v145 = (8 * a2) | 0x80;
          int v146 = (a2 >> 4) & 0x1FFFFFF;
          do
          {
            if (*(void *)a4 <= (unint64_t)v5)
            {
              int v5 = (char *)sub_25C13CEE0((uint64_t)a4, (int)v5);
              uint64_t v142 = *(void *)a1;
            }
            unint64_t v147 = *(void *)(*(void *)(v142 + 8) + 8 * v143);
            uint64_t v148 = v5 + 1;
            if (v144 > 0x7F)
            {
              *int v5 = v145;
              unsigned int v149 = v146;
              if (v144 >= 0x4000)
              {
                do
                {
                  int v150 = v148;
                  *v148++ = v149 | 0x80;
                  unsigned int v151 = v149 >> 7;
                  unsigned int v152 = v149 >> 14;
                  v149 >>= 7;
                }
                while (v152);
                *uint64_t v148 = v151;
                uint64_t v148 = v150 + 2;
              }
              else
              {
                v5[1] = v144 >> 7;
                uint64_t v148 = v5 + 2;
              }
            }
            else
            {
              *int v5 = v144;
            }
            if (v147 > 0x7F)
            {
              *uint64_t v148 = v147 | 0x80;
              unint64_t v153 = v147 >> 7;
              if (v147 >> 14)
              {
                uint64_t v154 = v148 + 1;
                do
                {
                  int v155 = v154;
                  *v154++ = v153 | 0x80;
                  unint64_t v156 = v153 >> 7;
                  unint64_t v157 = v153 >> 14;
                  v153 >>= 7;
                }
                while (v157);
                int v5 = v155 + 2;
                *uint64_t v154 = v156;
              }
              else
              {
                v148[1] = v153;
                int v5 = v148 + 2;
              }
            }
            else
            {
              *uint64_t v148 = v147;
              int v5 = v148 + 1;
            }
            ++v143;
            uint64_t v142 = *(void *)a1;
          }
          while (v143 < **(int **)a1);
        }
        return v5;
      case 5:
        uint64_t v158 = *(void *)a1;
        if (**(int **)a1 >= 1)
        {
          uint64_t v159 = 0;
          unsigned int v160 = 8 * a2;
          char v161 = (8 * a2) | 0x80;
          int v162 = (a2 >> 4) & 0x1FFFFFF;
          do
          {
            if (*(void *)a4 <= (unint64_t)v5)
            {
              int v5 = (char *)sub_25C13CEE0((uint64_t)a4, (int)v5);
              uint64_t v158 = *(void *)a1;
            }
            unint64_t v163 = *(int *)(*(void *)(v158 + 8) + 4 * v159);
            int v164 = v5 + 1;
            if (v160 > 0x7F)
            {
              *int v5 = v161;
              unsigned int v165 = v162;
              if (v160 >= 0x4000)
              {
                do
                {
                  int v166 = v164;
                  *v164++ = v165 | 0x80;
                  unsigned int v167 = v165 >> 7;
                  unsigned int v168 = v165 >> 14;
                  v165 >>= 7;
                }
                while (v168);
                *int v164 = v167;
                int v164 = v166 + 2;
              }
              else
              {
                v5[1] = v160 >> 7;
                int v164 = v5 + 2;
              }
            }
            else
            {
              *int v5 = v160;
            }
            if (v163 > 0x7F)
            {
              *int v164 = v163 | 0x80;
              unint64_t v169 = v163 >> 7;
              if (v163 >> 14)
              {
                v170 = v164 + 1;
                do
                {
                  int v171 = v170;
                  *v170++ = v169 | 0x80;
                  unint64_t v172 = v169 >> 7;
                  unint64_t v173 = v169 >> 14;
                  v169 >>= 7;
                }
                while (v173);
                int v5 = v171 + 2;
                unsigned char *v170 = v172;
              }
              else
              {
                v164[1] = v169;
                int v5 = v164 + 2;
              }
            }
            else
            {
              *int v164 = v163;
              int v5 = v164 + 1;
            }
            ++v159;
            uint64_t v158 = *(void *)a1;
          }
          while (v159 < **(int **)a1);
        }
        return v5;
      case 6:
        uint64_t v174 = *(void *)a1;
        if (**(int **)a1 >= 1)
        {
          uint64_t v175 = 0;
          unsigned int v176 = (8 * a2) | 1;
          char v177 = (8 * a2) | 0x81;
          int v178 = (a2 >> 4) & 0x1FFFFFF;
          unsigned int v179 = (8 * a2) >> 7;
          int v180 = a3;
          do
          {
            if (*(void *)a4 <= (unint64_t)v180)
            {
              int v180 = sub_25C13CEE0((uint64_t)a4, (int)v180);
              uint64_t v174 = *(void *)a1;
            }
            uint64_t v181 = *(void *)(*(void *)(v174 + 8) + 8 * v175);
            uint64_t v182 = v180 + 1;
            if (v176 > 0x7F)
            {
              *int v180 = v177;
              unsigned int v183 = v178;
              if (v176 >= 0x4000)
              {
                do
                {
                  v184 = v182;
                  *v182++ = v183 | 0x80;
                  unsigned int v185 = v183 >> 7;
                  unsigned int v186 = v183 >> 14;
                  v183 >>= 7;
                }
                while (v186);
                *uint64_t v182 = v185;
                uint64_t v182 = v184 + 2;
              }
              else
              {
                v180[1] = v179;
                uint64_t v182 = v180 + 2;
              }
            }
            else
            {
              *int v180 = v176;
            }
            *(void *)uint64_t v182 = v181;
            int v5 = v182 + 8;
            ++v175;
            uint64_t v174 = *(void *)a1;
            int v180 = v5;
          }
          while (v175 < **(int **)a1);
        }
        return v5;
      case 7:
        uint64_t v187 = *(void *)a1;
        if (**(int **)a1 >= 1)
        {
          uint64_t v188 = 0;
          unsigned int v189 = (8 * a2) | 5;
          int v190 = (a2 >> 4) & 0x1FFFFFF;
          unsigned int v191 = (8 * a2) >> 7;
          uint64_t v192 = a3;
          char v193 = (8 * a2) | 0x85;
          do
          {
            if (*(void *)a4 <= (unint64_t)v192)
            {
              uint64_t v192 = sub_25C13CEE0((uint64_t)a4, (int)v192);
              uint64_t v187 = *(void *)a1;
            }
            int v194 = *(_DWORD *)(*(void *)(v187 + 8) + 4 * v188);
            v195 = v192 + 1;
            if (v189 > 0x7F)
            {
              *uint64_t v192 = v193;
              unsigned int v196 = v190;
              if (v189 >= 0x4000)
              {
                do
                {
                  v197 = v195;
                  *v195++ = v196 | 0x80;
                  unsigned int v198 = v196 >> 7;
                  unsigned int v199 = v196 >> 14;
                  v196 >>= 7;
                }
                while (v199);
                unsigned char *v195 = v198;
                v195 = v197 + 2;
              }
              else
              {
                v192[1] = v191;
                v195 = v192 + 2;
              }
            }
            else
            {
              *uint64_t v192 = v189;
            }
            *(_DWORD *)v195 = v194;
            int v5 = v195 + 4;
            ++v188;
            uint64_t v187 = *(void *)a1;
            uint64_t v192 = v5;
          }
          while (v188 < **(int **)a1);
        }
        return v5;
      case 8:
        uint64_t v200 = *(void *)a1;
        if (**(int **)a1 >= 1)
        {
          uint64_t v201 = 0;
          unsigned int v202 = 8 * a2;
          char v203 = (8 * a2) | 0x80;
          int v204 = (a2 >> 4) & 0x1FFFFFF;
          unsigned int v205 = (8 * a2) >> 7;
          uint64_t v206 = a3;
          do
          {
            if (*(void *)a4 <= (unint64_t)v206)
            {
              uint64_t v206 = sub_25C13CEE0((uint64_t)a4, (int)v206);
              uint64_t v200 = *(void *)a1;
            }
            char v207 = *(unsigned char *)(*(void *)(v200 + 8) + v201);
            char v208 = v206 + 1;
            if (v202 > 0x7F)
            {
              *uint64_t v206 = v203;
              unsigned int v209 = v204;
              if (v202 >= 0x4000)
              {
                do
                {
                  v210 = v208;
                  *v208++ = v209 | 0x80;
                  unsigned int v211 = v209 >> 7;
                  unsigned int v212 = v209 >> 14;
                  v209 >>= 7;
                }
                while (v212);
                *char v208 = v211;
                char v208 = v210 + 2;
              }
              else
              {
                v206[1] = v205;
                char v208 = v206 + 2;
              }
            }
            else
            {
              *uint64_t v206 = v202;
            }
            *char v208 = v207;
            int v5 = v208 + 1;
            ++v201;
            uint64_t v200 = *(void *)a1;
            uint64_t v206 = v5;
          }
          while (v201 < **(int **)a1);
        }
        return v5;
      case 9:
        uint64_t v213 = *(void *)a1;
        if (*(int *)(*(void *)a1 + 8) < 1) {
          return v5;
        }
        uint64_t v214 = 0;
        unsigned int v215 = 8 * a2;
        uint64_t v216 = 4;
        if (((a2 >> 25) & 0xF) != 0) {
          uint64_t v216 = 5;
        }
        unsigned int v217 = (8 * a2) | 2;
        char v519 = (8 * a2) | 0x82;
        uint64_t v218 = 1;
        if (v215 >= 0x80) {
          uint64_t v218 = 2;
        }
        if (v215 < 0x200000) {
          uint64_t v216 = 3;
        }
        if (v215 >= 0x4000) {
          uint64_t v219 = v216;
        }
        else {
          uint64_t v219 = v218;
        }
        unsigned int v517 = v215 >> 7;
        while (1)
        {
          if (*(void *)a4 <= (unint64_t)v5)
          {
            int v5 = (char *)sub_25C13CEE0((uint64_t)a4, (int)v5);
            uint64_t v213 = *(void *)a1;
          }
          v220 = *(void **)(*(void *)(v213 + 16) + 8 * v214 + 8);
          if (*((char *)v220 + 23) < 0)
          {
            int64_t v221 = v220[1];
            if (v221 > 127) {
              goto LABEL_311;
            }
          }
          else
          {
            int64_t v221 = *((unsigned __int8 *)v220 + 23);
          }
          if ((uint64_t)(*(void *)a4 + ~(unint64_t)&v5[v219] + 16) >= v221)
          {
            v222 = v5 + 1;
            if (v217 > 0x7F)
            {
              *int v5 = v519;
              unsigned int v223 = (a2 >> 4) & 0x1FFFFFF;
              if (v217 >= 0x4000)
              {
                do
                {
                  uint64_t v224 = v222;
                  *v222++ = v223 | 0x80;
                  unsigned int v225 = v223 >> 7;
                  unsigned int v226 = v223 >> 14;
                  v223 >>= 7;
                }
                while (v226);
                unsigned char *v222 = v225;
                v222 = v224 + 2;
              }
              else
              {
                v5[1] = v517;
                v222 = v5 + 2;
              }
            }
            else
            {
              *int v5 = v217;
            }
            unsigned char *v222 = v221;
            char v227 = v222 + 1;
            if (*((char *)v220 + 23) < 0) {
              v220 = (void *)*v220;
            }
            memcpy(v227, v220, v221);
            int v5 = &v227[v221];
            goto LABEL_309;
          }
LABEL_311:
          int v5 = (char *)sub_25C13D3B8(a4, a2, (uint64_t)v220, v5);
LABEL_309:
          ++v214;
          uint64_t v213 = *(void *)a1;
          if (v214 >= *(int *)(*(void *)a1 + 8)) {
            return v5;
          }
        }
      case 0xA:
        uint64_t v228 = *(void *)a1;
        if (*(int *)(*(void *)a1 + 8) >= 1)
        {
          uint64_t v229 = 0;
          unsigned int v230 = (8 * a2) | 3;
          char v231 = (8 * a2) | 0x83;
          int v232 = (a2 >> 4) & 0x1FFFFFF;
          unsigned int v233 = (8 * a2) | 4;
          unsigned int v234 = (8 * a2) >> 7;
          char v235 = (8 * a2) | 0x84;
          do
          {
            if (*(void *)a4 <= (unint64_t)v5)
            {
              int v5 = (char *)sub_25C13CEE0((uint64_t)a4, (int)v5);
              uint64_t v228 = *(void *)a1;
            }
            uint64_t v236 = *(void *)(*(void *)(v228 + 16) + 8 * v229 + 8);
            long long v237 = v5 + 1;
            if (v230 > 0x7F)
            {
              *int v5 = v231;
              unsigned int v238 = v232;
              if (v230 >= 0x4000)
              {
                do
                {
                  __int16 v239 = v237;
                  *v237++ = v238 | 0x80;
                  unsigned int v240 = v238 >> 7;
                  unsigned int v241 = v238 >> 14;
                  v238 >>= 7;
                }
                while (v241);
                *long long v237 = v240;
                long long v237 = v239 + 2;
              }
              else
              {
                v5[1] = v234;
                long long v237 = v5 + 2;
              }
            }
            else
            {
              *int v5 = v230;
            }
            v242 = (unsigned char *)(*(uint64_t (**)(uint64_t, unsigned char *, _DWORD *))(*(void *)v236 + 96))(v236, v237, a4);
            if (*(void *)a4 <= (unint64_t)v242) {
              v242 = sub_25C13CEE0((uint64_t)a4, (int)v242);
            }
            int v5 = v242 + 1;
            if (v233 > 0x7F)
            {
              unsigned char *v242 = v235;
              unsigned int v243 = v232;
              if (v233 >= 0x4000)
              {
                do
                {
                  v244 = v5;
                  *v5++ = v243 | 0x80;
                  unsigned int v245 = v243 >> 7;
                  unsigned int v246 = v243 >> 14;
                  v243 >>= 7;
                }
                while (v246);
                *int v5 = v245;
                int v5 = v244 + 2;
              }
              else
              {
                v242[1] = v234;
                int v5 = v242 + 2;
              }
            }
            else
            {
              unsigned char *v242 = v233;
            }
            ++v229;
            uint64_t v228 = *(void *)a1;
          }
          while (v229 < *(int *)(*(void *)a1 + 8));
        }
        return v5;
      case 0xB:
        uint64_t v247 = *(void *)a1;
        if (*(int *)(*(void *)a1 + 8) >= 1)
        {
          uint64_t v248 = 0;
          unsigned int v249 = (8 * a2) | 2;
          int v250 = (a2 >> 4) & 0x1FFFFFF;
          unsigned int v251 = (8 * a2) >> 7;
          char v252 = (8 * a2) | 0x82;
          do
          {
            if (*(void *)a4 <= (unint64_t)v5)
            {
              int v5 = (char *)sub_25C13CEE0((uint64_t)a4, (int)v5);
              uint64_t v247 = *(void *)a1;
            }
            uint64_t v253 = *(void *)(*(void *)(v247 + 16) + 8 * v248 + 8);
            v254 = v5 + 1;
            if (v249 > 0x7F)
            {
              *int v5 = v252;
              unsigned int v255 = v250;
              if (v249 >= 0x4000)
              {
                do
                {
                  v256 = v254;
                  *v254++ = v255 | 0x80;
                  unsigned int v257 = v255 >> 7;
                  unsigned int v258 = v255 >> 14;
                  v255 >>= 7;
                }
                while (v258);
                unsigned char *v254 = v257;
                v254 = v256 + 2;
              }
              else
              {
                v5[1] = v251;
                v254 = v5 + 2;
              }
            }
            else
            {
              *int v5 = v249;
            }
            unsigned int v259 = (*(uint64_t (**)(uint64_t))(*(void *)v253 + 80))(v253);
            if (v259 > 0x7F)
            {
              unsigned char *v254 = v259 | 0x80;
              unsigned int v261 = v259 >> 7;
              if (v259 >> 14)
              {
                v262 = v254 + 1;
                do
                {
                  v263 = v262;
                  *v262++ = v261 | 0x80;
                  unsigned int v264 = v261 >> 7;
                  unsigned int v265 = v261 >> 14;
                  v261 >>= 7;
                }
                while (v265);
                v260 = v263 + 2;
                unsigned char *v262 = v264;
              }
              else
              {
                v254[1] = v261;
                v260 = v254 + 2;
              }
            }
            else
            {
              unsigned char *v254 = v259;
              v260 = v254 + 1;
            }
            int v5 = (char *)(*(uint64_t (**)(uint64_t, unsigned char *, _DWORD *))(*(void *)v253 + 96))(v253, v260, a4);
            ++v248;
            uint64_t v247 = *(void *)a1;
          }
          while (v248 < *(int *)(*(void *)a1 + 8));
        }
        return v5;
      case 0xC:
        uint64_t v266 = *(void *)a1;
        if (*(int *)(*(void *)a1 + 8) < 1) {
          return v5;
        }
        uint64_t v267 = 0;
        unsigned int v268 = 8 * a2;
        uint64_t v269 = 4;
        if (((a2 >> 25) & 0xF) != 0) {
          uint64_t v269 = 5;
        }
        unsigned int v270 = (8 * a2) | 2;
        char v520 = (8 * a2) | 0x82;
        uint64_t v271 = 1;
        if (v268 >= 0x80) {
          uint64_t v271 = 2;
        }
        if (v268 < 0x200000) {
          uint64_t v269 = 3;
        }
        if (v268 >= 0x4000) {
          uint64_t v272 = v269;
        }
        else {
          uint64_t v272 = v271;
        }
        unsigned int v518 = v268 >> 7;
        break;
      case 0xD:
        uint64_t v281 = *(void *)a1;
        if (**(int **)a1 >= 1)
        {
          uint64_t v282 = 0;
          unsigned int v283 = 8 * a2;
          char v284 = (8 * a2) | 0x80;
          int v285 = (a2 >> 4) & 0x1FFFFFF;
          do
          {
            if (*(void *)a4 <= (unint64_t)v5)
            {
              int v5 = (char *)sub_25C13CEE0((uint64_t)a4, (int)v5);
              uint64_t v281 = *(void *)a1;
            }
            unsigned int v286 = *(_DWORD *)(*(void *)(v281 + 8) + 4 * v282);
            v287 = v5 + 1;
            if (v283 > 0x7F)
            {
              *int v5 = v284;
              unsigned int v288 = v285;
              if (v283 >= 0x4000)
              {
                do
                {
                  v289 = v287;
                  *v287++ = v288 | 0x80;
                  unsigned int v290 = v288 >> 7;
                  unsigned int v291 = v288 >> 14;
                  v288 >>= 7;
                }
                while (v291);
                unsigned char *v287 = v290;
                v287 = v289 + 2;
              }
              else
              {
                v5[1] = v283 >> 7;
                v287 = v5 + 2;
              }
            }
            else
            {
              *int v5 = v283;
            }
            if (v286 > 0x7F)
            {
              unsigned char *v287 = v286 | 0x80;
              unsigned int v292 = v286 >> 7;
              if (v286 >> 14)
              {
                v293 = v287 + 1;
                do
                {
                  v294 = v293;
                  *v293++ = v292 | 0x80;
                  unsigned int v295 = v292 >> 7;
                  unsigned int v296 = v292 >> 14;
                  v292 >>= 7;
                }
                while (v296);
                int v5 = v294 + 2;
                unsigned char *v293 = v295;
              }
              else
              {
                v287[1] = v292;
                int v5 = v287 + 2;
              }
            }
            else
            {
              unsigned char *v287 = v286;
              int v5 = v287 + 1;
            }
            ++v282;
            uint64_t v281 = *(void *)a1;
          }
          while (v282 < **(int **)a1);
        }
        return v5;
      case 0xE:
        uint64_t v297 = *(void *)a1;
        if (**(int **)a1 >= 1)
        {
          uint64_t v298 = 0;
          unsigned int v299 = 8 * a2;
          char v300 = (8 * a2) | 0x80;
          int v301 = (a2 >> 4) & 0x1FFFFFF;
          do
          {
            if (*(void *)a4 <= (unint64_t)v5)
            {
              int v5 = (char *)sub_25C13CEE0((uint64_t)a4, (int)v5);
              uint64_t v297 = *(void *)a1;
            }
            unint64_t v302 = *(int *)(*(void *)(v297 + 8) + 4 * v298);
            v303 = v5 + 1;
            if (v299 > 0x7F)
            {
              *int v5 = v300;
              unsigned int v304 = v301;
              if (v299 >= 0x4000)
              {
                do
                {
                  v305 = v303;
                  *v303++ = v304 | 0x80;
                  unsigned int v306 = v304 >> 7;
                  unsigned int v307 = v304 >> 14;
                  v304 >>= 7;
                }
                while (v307);
                unsigned char *v303 = v306;
                v303 = v305 + 2;
              }
              else
              {
                v5[1] = v299 >> 7;
                v303 = v5 + 2;
              }
            }
            else
            {
              *int v5 = v299;
            }
            if (v302 > 0x7F)
            {
              unsigned char *v303 = v302 | 0x80;
              unint64_t v308 = v302 >> 7;
              if (v302 >> 14)
              {
                v309 = v303 + 1;
                do
                {
                  v310 = v309;
                  *v309++ = v308 | 0x80;
                  unint64_t v311 = v308 >> 7;
                  unint64_t v312 = v308 >> 14;
                  v308 >>= 7;
                }
                while (v312);
                int v5 = v310 + 2;
                unsigned char *v309 = v311;
              }
              else
              {
                v303[1] = v308;
                int v5 = v303 + 2;
              }
            }
            else
            {
              unsigned char *v303 = v302;
              int v5 = v303 + 1;
            }
            ++v298;
            uint64_t v297 = *(void *)a1;
          }
          while (v298 < **(int **)a1);
        }
        return v5;
      case 0xF:
        uint64_t v313 = *(void *)a1;
        if (**(int **)a1 >= 1)
        {
          uint64_t v314 = 0;
          unsigned int v315 = (8 * a2) | 5;
          int v316 = (a2 >> 4) & 0x1FFFFFF;
          unsigned int v317 = (8 * a2) >> 7;
          v318 = a3;
          char v319 = (8 * a2) | 0x85;
          do
          {
            if (*(void *)a4 <= (unint64_t)v318)
            {
              v318 = sub_25C13CEE0((uint64_t)a4, (int)v318);
              uint64_t v313 = *(void *)a1;
            }
            int v320 = *(_DWORD *)(*(void *)(v313 + 8) + 4 * v314);
            v321 = v318 + 1;
            if (v315 > 0x7F)
            {
              unsigned char *v318 = v319;
              unsigned int v322 = v316;
              if (v315 >= 0x4000)
              {
                do
                {
                  v323 = v321;
                  *v321++ = v322 | 0x80;
                  unsigned int v324 = v322 >> 7;
                  unsigned int v325 = v322 >> 14;
                  v322 >>= 7;
                }
                while (v325);
                unsigned char *v321 = v324;
                v321 = v323 + 2;
              }
              else
              {
                v318[1] = v317;
                v321 = v318 + 2;
              }
            }
            else
            {
              unsigned char *v318 = v315;
            }
            *(_DWORD *)v321 = v320;
            int v5 = v321 + 4;
            ++v314;
            uint64_t v313 = *(void *)a1;
            v318 = v5;
          }
          while (v314 < **(int **)a1);
        }
        return v5;
      case 0x10:
        uint64_t v326 = *(void *)a1;
        if (**(int **)a1 >= 1)
        {
          uint64_t v327 = 0;
          unsigned int v328 = (8 * a2) | 1;
          char v329 = (8 * a2) | 0x81;
          int v330 = (a2 >> 4) & 0x1FFFFFF;
          unsigned int v331 = (8 * a2) >> 7;
          v332 = a3;
          do
          {
            if (*(void *)a4 <= (unint64_t)v332)
            {
              v332 = sub_25C13CEE0((uint64_t)a4, (int)v332);
              uint64_t v326 = *(void *)a1;
            }
            uint64_t v333 = *(void *)(*(void *)(v326 + 8) + 8 * v327);
            v334 = v332 + 1;
            if (v328 > 0x7F)
            {
              unsigned char *v332 = v329;
              unsigned int v335 = v330;
              if (v328 >= 0x4000)
              {
                do
                {
                  v336 = v334;
                  *v334++ = v335 | 0x80;
                  unsigned int v337 = v335 >> 7;
                  unsigned int v338 = v335 >> 14;
                  v335 >>= 7;
                }
                while (v338);
                unsigned char *v334 = v337;
                v334 = v336 + 2;
              }
              else
              {
                v332[1] = v331;
                v334 = v332 + 2;
              }
            }
            else
            {
              unsigned char *v332 = v328;
            }
            *(void *)v334 = v333;
            int v5 = v334 + 8;
            ++v327;
            uint64_t v326 = *(void *)a1;
            v332 = v5;
          }
          while (v327 < **(int **)a1);
        }
        return v5;
      case 0x11:
        uint64_t v339 = *(void *)a1;
        if (**(int **)a1 >= 1)
        {
          uint64_t v340 = 0;
          unsigned int v341 = 8 * a2;
          char v342 = (8 * a2) | 0x80;
          int v343 = (a2 >> 4) & 0x1FFFFFF;
          do
          {
            if (*(void *)a4 <= (unint64_t)v5)
            {
              int v5 = (char *)sub_25C13CEE0((uint64_t)a4, (int)v5);
              uint64_t v339 = *(void *)a1;
            }
            int v344 = *(_DWORD *)(*(void *)(v339 + 8) + 4 * v340);
            v345 = v5 + 1;
            if (v341 > 0x7F)
            {
              *int v5 = v342;
              unsigned int v346 = v343;
              if (v341 >= 0x4000)
              {
                do
                {
                  v347 = v345;
                  *v345++ = v346 | 0x80;
                  unsigned int v348 = v346 >> 7;
                  unsigned int v349 = v346 >> 14;
                  v346 >>= 7;
                }
                while (v349);
                unsigned char *v345 = v348;
                v345 = v347 + 2;
              }
              else
              {
                v5[1] = v341 >> 7;
                v345 = v5 + 2;
              }
            }
            else
            {
              *int v5 = v341;
            }
            unsigned int v350 = (2 * v344) ^ (v344 >> 31);
            if (v350 > 0x7F)
            {
              unsigned char *v345 = v350 | 0x80;
              unsigned int v351 = v350 >> 7;
              if (v350 >> 14)
              {
                v352 = v345 + 1;
                do
                {
                  v353 = v352;
                  *v352++ = v351 | 0x80;
                  unsigned int v354 = v351 >> 7;
                  unsigned int v355 = v351 >> 14;
                  v351 >>= 7;
                }
                while (v355);
                int v5 = v353 + 2;
                unsigned char *v352 = v354;
              }
              else
              {
                v345[1] = v351;
                int v5 = v345 + 2;
              }
            }
            else
            {
              unsigned char *v345 = v350;
              int v5 = v345 + 1;
            }
            ++v340;
            uint64_t v339 = *(void *)a1;
          }
          while (v340 < **(int **)a1);
        }
        return v5;
      case 0x12:
        uint64_t v356 = *(void *)a1;
        if (**(int **)a1 >= 1)
        {
          uint64_t v357 = 0;
          unsigned int v358 = 8 * a2;
          char v359 = (8 * a2) | 0x80;
          int v360 = (a2 >> 4) & 0x1FFFFFF;
          do
          {
            if (*(void *)a4 <= (unint64_t)v5)
            {
              int v5 = (char *)sub_25C13CEE0((uint64_t)a4, (int)v5);
              uint64_t v356 = *(void *)a1;
            }
            uint64_t v361 = *(void *)(*(void *)(v356 + 8) + 8 * v357);
            v362 = v5 + 1;
            if (v358 > 0x7F)
            {
              *int v5 = v359;
              unsigned int v363 = v360;
              if (v358 >= 0x4000)
              {
                do
                {
                  v364 = v362;
                  *v362++ = v363 | 0x80;
                  unsigned int v365 = v363 >> 7;
                  unsigned int v366 = v363 >> 14;
                  v363 >>= 7;
                }
                while (v366);
                unsigned char *v362 = v365;
                v362 = v364 + 2;
              }
              else
              {
                v5[1] = v358 >> 7;
                v362 = v5 + 2;
              }
            }
            else
            {
              *int v5 = v358;
            }
            unint64_t v367 = (2 * v361) ^ (v361 >> 63);
            if (v367 > 0x7F)
            {
              unsigned char *v362 = v367 | 0x80;
              unint64_t v368 = v367 >> 7;
              if (v367 >> 14)
              {
                v369 = v362 + 1;
                do
                {
                  v370 = v369;
                  *v369++ = v368 | 0x80;
                  unint64_t v371 = v368 >> 7;
                  unint64_t v372 = v368 >> 14;
                  v368 >>= 7;
                }
                while (v372);
                int v5 = v370 + 2;
                unsigned char *v369 = v371;
              }
              else
              {
                v362[1] = v368;
                int v5 = v362 + 2;
              }
            }
            else
            {
              unsigned char *v362 = v367;
              int v5 = v362 + 1;
            }
            ++v357;
            uint64_t v356 = *(void *)a1;
          }
          while (v357 < **(int **)a1);
        }
        return v5;
      default:
        return v5;
    }
    while (1)
    {
      if (*(void *)a4 <= (unint64_t)v5)
      {
        int v5 = (char *)sub_25C13CEE0((uint64_t)a4, (int)v5);
        uint64_t v266 = *(void *)a1;
      }
      v273 = *(void **)(*(void *)(v266 + 16) + 8 * v267 + 8);
      if (*((char *)v273 + 23) < 0)
      {
        int64_t v274 = v273[1];
        if (v274 > 127) {
          goto LABEL_379;
        }
      }
      else
      {
        int64_t v274 = *((unsigned __int8 *)v273 + 23);
      }
      if ((uint64_t)(*(void *)a4 + ~(unint64_t)&v5[v272] + 16) >= v274)
      {
        v275 = v5 + 1;
        if (v270 > 0x7F)
        {
          *int v5 = v520;
          unsigned int v276 = (a2 >> 4) & 0x1FFFFFF;
          if (v270 >= 0x4000)
          {
            do
            {
              v277 = v275;
              *v275++ = v276 | 0x80;
              unsigned int v278 = v276 >> 7;
              unsigned int v279 = v276 >> 14;
              v276 >>= 7;
            }
            while (v279);
            unsigned char *v275 = v278;
            v275 = v277 + 2;
          }
          else
          {
            v5[1] = v518;
            v275 = v5 + 2;
          }
        }
        else
        {
          *int v5 = v270;
        }
        unsigned char *v275 = v274;
        v280 = v275 + 1;
        if (*((char *)v273 + 23) < 0) {
          v273 = (void *)*v273;
        }
        memcpy(v280, v273, v274);
        int v5 = &v280[v274];
        goto LABEL_377;
      }
LABEL_379:
      int v5 = (char *)sub_25C13D3B8(a4, a2, (uint64_t)v273, v5);
LABEL_377:
      ++v267;
      uint64_t v266 = *(void *)a1;
      if (v267 >= *(int *)(*(void *)a1 + 8)) {
        return v5;
      }
    }
  }
  if ((a1[10] & 1) == 0)
  {
    switch(a1[8])
    {
      case 1:
        if (*(void *)a4 <= (unint64_t)a3) {
          int v5 = (char *)sub_25C13CEE0((uint64_t)a4, (int)a3);
        }
        uint64_t v10 = *(void *)a1;
        unsigned int v11 = (8 * a2) | 1;
        if (v11 <= 0x7F) {
          goto LABEL_549;
        }
        *int v5 = (8 * a2) | 0x81;
        unsigned int v12 = (8 * a2) >> 7;
        if (!(v11 >> 14)) {
          goto LABEL_578;
        }
        uint64_t v13 = v5 + 1;
        do
        {
          unint64_t v14 = v13;
          *v13++ = v12 | 0x80;
          unsigned int v15 = v12 >> 7;
          unsigned int v16 = v12 >> 14;
          v12 >>= 7;
        }
        while (v16);
        goto LABEL_669;
      case 2:
        if (*(void *)a4 <= (unint64_t)a3) {
          int v5 = (char *)sub_25C13CEE0((uint64_t)a4, (int)a3);
        }
        int v373 = *(_DWORD *)a1;
        unsigned int v374 = (8 * a2) | 5;
        if (v374 <= 0x7F) {
          goto LABEL_545;
        }
        *int v5 = (8 * a2) | 0x85;
        unsigned int v375 = (8 * a2) >> 7;
        if (!(v374 >> 14)) {
          goto LABEL_576;
        }
        v376 = v5 + 1;
        do
        {
          v377 = v376;
          *v376++ = v375 | 0x80;
          unsigned int v378 = v375 >> 7;
          unsigned int v379 = v375 >> 14;
          v375 >>= 7;
        }
        while (v379);
        goto LABEL_665;
      case 3:
        if (*(void *)a4 <= (unint64_t)a3) {
          int v5 = (char *)sub_25C13CEE0((uint64_t)a4, (int)a3);
        }
        unint64_t v380 = *(void *)a1;
        unsigned int v381 = 8 * a2;
        if (8 * a2 > 0x7F)
        {
          *int v5 = v381 | 0x80;
          unsigned int v407 = v381 >> 7;
          if (v381 >> 14)
          {
            v435 = v5 + 1;
            do
            {
              v436 = v435;
              *v435++ = v407 | 0x80;
              unsigned int v437 = v407 >> 7;
              unsigned int v438 = v407 >> 14;
              v407 >>= 7;
            }
            while (v438);
            v382 = v436 + 2;
            unsigned char *v435 = v437;
          }
          else
          {
            v5[1] = v407;
            v382 = v5 + 2;
          }
        }
        else
        {
          *int v5 = v381;
          v382 = v5 + 1;
        }
        if (v380 <= 0x7F) {
          goto LABEL_660;
        }
        unsigned char *v382 = v380 | 0x80;
        unint64_t v439 = v380 >> 7;
        if (!(v380 >> 14)) {
          goto LABEL_662;
        }
        v440 = v382 + 1;
        do
        {
          v441 = v440;
          *v440++ = v439 | 0x80;
          unint64_t v442 = v439 >> 7;
          unint64_t v443 = v439 >> 14;
          v439 >>= 7;
        }
        while (v443);
        goto LABEL_694;
      case 4:
        if (*(void *)a4 <= (unint64_t)a3) {
          int v5 = (char *)sub_25C13CEE0((uint64_t)a4, (int)a3);
        }
        unint64_t v380 = *(void *)a1;
        unsigned int v383 = 8 * a2;
        if (8 * a2 > 0x7F)
        {
          *int v5 = v383 | 0x80;
          unsigned int v408 = v383 >> 7;
          if (v383 >> 14)
          {
            v444 = v5 + 1;
            do
            {
              v445 = v444;
              *v444++ = v408 | 0x80;
              unsigned int v446 = v408 >> 7;
              unsigned int v447 = v408 >> 14;
              v408 >>= 7;
            }
            while (v447);
            v382 = v445 + 2;
            unsigned char *v444 = v446;
          }
          else
          {
            v5[1] = v408;
            v382 = v5 + 2;
          }
        }
        else
        {
          *int v5 = v383;
          v382 = v5 + 1;
        }
        if (v380 <= 0x7F) {
          goto LABEL_660;
        }
        unsigned char *v382 = v380 | 0x80;
        unint64_t v439 = v380 >> 7;
        if (!(v380 >> 14)) {
          goto LABEL_662;
        }
        v440 = v382 + 1;
        do
        {
          v441 = v440;
          *v440++ = v439 | 0x80;
          unint64_t v442 = v439 >> 7;
          unint64_t v448 = v439 >> 14;
          v439 >>= 7;
        }
        while (v448);
        goto LABEL_694;
      case 5:
        if (*(void *)a4 <= (unint64_t)a3) {
          int v5 = (char *)sub_25C13CEE0((uint64_t)a4, (int)a3);
        }
        unint64_t v380 = *(int *)a1;
        unsigned int v384 = 8 * a2;
        if (8 * a2 > 0x7F)
        {
          *int v5 = v384 | 0x80;
          unsigned int v409 = v384 >> 7;
          if (v384 >> 14)
          {
            v449 = v5 + 1;
            do
            {
              v450 = v449;
              *v449++ = v409 | 0x80;
              unsigned int v451 = v409 >> 7;
              unsigned int v452 = v409 >> 14;
              v409 >>= 7;
            }
            while (v452);
            v382 = v450 + 2;
            unsigned char *v449 = v451;
          }
          else
          {
            v5[1] = v409;
            v382 = v5 + 2;
          }
        }
        else
        {
          *int v5 = v384;
          v382 = v5 + 1;
        }
        if (v380 <= 0x7F) {
          goto LABEL_660;
        }
        unsigned char *v382 = v380 | 0x80;
        unint64_t v439 = v380 >> 7;
        if (!(v380 >> 14)) {
          goto LABEL_662;
        }
        v440 = v382 + 1;
        do
        {
          v441 = v440;
          *v440++ = v439 | 0x80;
          unint64_t v442 = v439 >> 7;
          unint64_t v453 = v439 >> 14;
          v439 >>= 7;
        }
        while (v453);
        goto LABEL_694;
      case 6:
        if (*(void *)a4 <= (unint64_t)a3) {
          int v5 = (char *)sub_25C13CEE0((uint64_t)a4, (int)a3);
        }
        uint64_t v10 = *(void *)a1;
        unsigned int v11 = (8 * a2) | 1;
        if (v11 <= 0x7F) {
          goto LABEL_549;
        }
        *int v5 = (8 * a2) | 0x81;
        unsigned int v12 = (8 * a2) >> 7;
        if (!(v11 >> 14)) {
          goto LABEL_578;
        }
        uint64_t v13 = v5 + 1;
        do
        {
          unint64_t v14 = v13;
          *v13++ = v12 | 0x80;
          unsigned int v15 = v12 >> 7;
          unsigned int v385 = v12 >> 14;
          v12 >>= 7;
        }
        while (v385);
        goto LABEL_669;
      case 7:
        if (*(void *)a4 <= (unint64_t)a3) {
          int v5 = (char *)sub_25C13CEE0((uint64_t)a4, (int)a3);
        }
        int v373 = *(_DWORD *)a1;
        unsigned int v374 = (8 * a2) | 5;
        if (v374 <= 0x7F) {
          goto LABEL_545;
        }
        *int v5 = (8 * a2) | 0x85;
        unsigned int v375 = (8 * a2) >> 7;
        if (!(v374 >> 14)) {
          goto LABEL_576;
        }
        v376 = v5 + 1;
        do
        {
          v377 = v376;
          *v376++ = v375 | 0x80;
          unsigned int v378 = v375 >> 7;
          unsigned int v386 = v375 >> 14;
          v375 >>= 7;
        }
        while (v386);
        goto LABEL_665;
      case 8:
        if (*(void *)a4 <= (unint64_t)a3) {
          int v5 = (char *)sub_25C13CEE0((uint64_t)a4, (int)a3);
        }
        LOBYTE(v387) = *a1;
        unsigned int v388 = 8 * a2;
        if (8 * a2 > 0x7F)
        {
          *int v5 = v388 | 0x80;
          unsigned int v410 = v388 >> 7;
          if (v388 >> 14)
          {
            v454 = v5 + 1;
            do
            {
              v455 = v454;
              *v454++ = v410 | 0x80;
              unsigned int v456 = v410 >> 7;
              unsigned int v457 = v410 >> 14;
              v410 >>= 7;
            }
            while (v457);
            v382 = v455 + 2;
            unsigned char *v454 = v456;
          }
          else
          {
            v5[1] = v410;
            v382 = v5 + 2;
          }
        }
        else
        {
          *int v5 = v388;
          v382 = v5 + 1;
        }
        goto LABEL_653;
      case 9:
        if (*(void *)a4 <= (unint64_t)a3) {
          int v5 = (char *)sub_25C13CEE0((uint64_t)a4, (int)a3);
        }
        v389 = *(void **)a1;
        if (*(char *)(*(void *)a1 + 23) < 0)
        {
          int64_t v390 = v389[1];
          if (v390 > 127) {
            goto LABEL_721;
          }
        }
        else
        {
          int64_t v390 = *(unsigned __int8 *)(*(void *)a1 + 23);
        }
        unsigned int v417 = 8 * a2;
        uint64_t v418 = 1;
        uint64_t v419 = 2;
        uint64_t v420 = 3;
        uint64_t v421 = 4;
        if ((8 * a2) >> 28) {
          uint64_t v421 = 5;
        }
        if (v417 >= 0x200000) {
          uint64_t v420 = v421;
        }
        if (v417 >= 0x4000) {
          uint64_t v419 = v420;
        }
        if (v417 >= 0x80) {
          uint64_t v418 = v419;
        }
        if ((uint64_t)(*(void *)a4 + ~(unint64_t)&v5[v418] + 16) < v390) {
          goto LABEL_721;
        }
        unsigned int v422 = v417 | 2;
        if ((v417 | 2) <= 0x7F) {
          goto LABEL_609;
        }
        *int v5 = v417 | 0x82;
        unsigned int v423 = v417 >> 7;
        if (!(v422 >> 14)) {
          goto LABEL_611;
        }
        v424 = v5 + 1;
        do
        {
          v425 = v424;
          *v424++ = v423 | 0x80;
          unsigned int v426 = v423 >> 7;
          unsigned int v427 = v423 >> 14;
          v423 >>= 7;
        }
        while (v427);
        goto LABEL_703;
      case 0xA:
        if (*(void *)a4 <= (unint64_t)a3) {
          int v5 = (char *)sub_25C13CEE0((uint64_t)a4, (int)a3);
        }
        uint64_t v391 = *(void *)a1;
        unsigned int v392 = 8 * a2;
        unsigned int v393 = (8 * a2) | 3;
        unsigned int v394 = (8 * a2) >> 7;
        if (v393 > 0x7F)
        {
          *int v5 = (8 * a2) | 0x83;
          if (v393 >> 14)
          {
            v458 = v5 + 1;
            unsigned int v459 = v392 >> 7;
            do
            {
              v460 = v458;
              *v458++ = v459 | 0x80;
              unsigned int v461 = v459 >> 7;
              unsigned int v462 = v459 >> 14;
              v459 >>= 7;
            }
            while (v462);
            v395 = v460 + 2;
            unsigned char *v458 = v461;
          }
          else
          {
            v5[1] = v394;
            v395 = v5 + 2;
          }
        }
        else
        {
          *int v5 = v393;
          v395 = v5 + 1;
        }
        v382 = (unsigned char *)(*(uint64_t (**)(uint64_t, unsigned char *, _DWORD *))(*(void *)v391 + 96))(v391, v395, a4);
        if (*(void *)a4 <= (unint64_t)v382) {
          v382 = sub_25C13CEE0((uint64_t)a4, (int)v382);
        }
        unsigned int v387 = v392 | 4;
        if ((v392 | 4) <= 0x7F) {
          goto LABEL_653;
        }
        unsigned char *v382 = v392 | 0x84;
        if (!(v387 >> 14))
        {
          v382[1] = v394;
          return v382 + 2;
        }
        v486 = v382 + 1;
        do
        {
          v487 = v486;
          *v486++ = v394 | 0x80;
          unsigned int v488 = v394 >> 7;
          unsigned int v489 = v394 >> 14;
          v394 >>= 7;
        }
        while (v489);
        int v5 = v487 + 2;
        unsigned char *v486 = v488;
        return v5;
      case 0xB:
        if ((a1[10] & 0x10) != 0)
        {
          v411 = *(uint64_t (**)(void))(**(void **)a1 + 136);
          return (char *)v411();
        }
        else
        {
          if (*(void *)a4 <= (unint64_t)a3) {
            int v5 = (char *)sub_25C13CEE0((uint64_t)a4, (int)a3);
          }
          uint64_t v396 = *(void *)a1;
          unsigned int v397 = (8 * a2) | 2;
          if (v397 > 0x7F)
          {
            *int v5 = (8 * a2) | 0x82;
            unsigned int v434 = (8 * a2) >> 7;
            if (v397 >> 14)
            {
              v505 = v5 + 1;
              do
              {
                v506 = v505;
                *v505++ = v434 | 0x80;
                unsigned int v507 = v434 >> 7;
                unsigned int v508 = v434 >> 14;
                v434 >>= 7;
              }
              while (v508);
              v398 = v506 + 2;
              unsigned char *v505 = v507;
            }
            else
            {
              v5[1] = v434;
              v398 = v5 + 2;
            }
          }
          else
          {
            *int v5 = v397;
            v398 = v5 + 1;
          }
          unsigned int v509 = (*(uint64_t (**)(uint64_t))(*(void *)v396 + 80))(v396);
          if (v509 > 0x7F)
          {
            unsigned char *v398 = v509 | 0x80;
            unsigned int v511 = v509 >> 7;
            if (v509 >> 14)
            {
              v512 = v398 + 1;
              do
              {
                v513 = v512;
                *v512++ = v511 | 0x80;
                unsigned int v514 = v511 >> 7;
                unsigned int v515 = v511 >> 14;
                v511 >>= 7;
              }
              while (v515);
              v510 = v513 + 2;
              unsigned char *v512 = v514;
            }
            else
            {
              v398[1] = v511;
              v510 = v398 + 2;
            }
          }
          else
          {
            unsigned char *v398 = v509;
            v510 = v398 + 1;
          }
          v516 = *(uint64_t (**)(uint64_t, unsigned char *, _DWORD *))(*(void *)v396 + 96);
          return (char *)v516(v396, v510, a4);
        }
      case 0xC:
        if (*(void *)a4 <= (unint64_t)a3) {
          int v5 = (char *)sub_25C13CEE0((uint64_t)a4, (int)a3);
        }
        v389 = *(void **)a1;
        if (*(char *)(*(void *)a1 + 23) < 0)
        {
          int64_t v390 = v389[1];
          if (v390 > 127) {
            goto LABEL_721;
          }
        }
        else
        {
          int64_t v390 = *(unsigned __int8 *)(*(void *)a1 + 23);
        }
        unsigned int v428 = 8 * a2;
        uint64_t v429 = 1;
        uint64_t v430 = 2;
        uint64_t v431 = 3;
        uint64_t v432 = 4;
        if ((8 * a2) >> 28) {
          uint64_t v432 = 5;
        }
        if (v428 >= 0x200000) {
          uint64_t v431 = v432;
        }
        if (v428 >= 0x4000) {
          uint64_t v430 = v431;
        }
        if (v428 >= 0x80) {
          uint64_t v429 = v430;
        }
        if ((uint64_t)(*(void *)a4 + ~(unint64_t)&v5[v429] + 16) >= v390)
        {
          unsigned int v422 = v428 | 2;
          if ((v428 | 2) > 0x7F)
          {
            *int v5 = v428 | 0x82;
            unsigned int v423 = v428 >> 7;
            if (v422 >> 14)
            {
              v424 = v5 + 1;
              do
              {
                v425 = v424;
                *v424++ = v423 | 0x80;
                unsigned int v426 = v423 >> 7;
                unsigned int v503 = v423 >> 14;
                v423 >>= 7;
              }
              while (v503);
LABEL_703:
              v433 = v425 + 2;
              unsigned char *v424 = v426;
            }
            else
            {
LABEL_611:
              v5[1] = v423;
              v433 = v5 + 2;
            }
          }
          else
          {
LABEL_609:
            *int v5 = v422;
            v433 = v5 + 1;
          }
          unsigned char *v433 = v390;
          v504 = v433 + 1;
          if (*((char *)v389 + 23) < 0) {
            v389 = (void *)*v389;
          }
          memcpy(v504, v389, v390);
          return &v504[v390];
        }
LABEL_721:
        return (char *)sub_25C13D3B8(a4, a2, (uint64_t)v389, v5);
      case 0xD:
        if (*(void *)a4 <= (unint64_t)a3) {
          int v5 = (char *)sub_25C13CEE0((uint64_t)a4, (int)a3);
        }
        unsigned int v387 = *(_DWORD *)a1;
        unsigned int v399 = 8 * a2;
        if (8 * a2 > 0x7F)
        {
          *int v5 = v399 | 0x80;
          unsigned int v413 = v399 >> 7;
          if (v399 >> 14)
          {
            v463 = v5 + 1;
            do
            {
              v464 = v463;
              *v463++ = v413 | 0x80;
              unsigned int v465 = v413 >> 7;
              unsigned int v466 = v413 >> 14;
              v413 >>= 7;
            }
            while (v466);
            v382 = v464 + 2;
            unsigned char *v463 = v465;
          }
          else
          {
            v5[1] = v413;
            v382 = v5 + 2;
          }
        }
        else
        {
          *int v5 = v399;
          v382 = v5 + 1;
        }
        if (v387 <= 0x7F)
        {
LABEL_653:
          unsigned char *v382 = v387;
          return v382 + 1;
        }
        unsigned char *v382 = v387 | 0x80;
        unsigned int v467 = v387 >> 7;
        if (!(v387 >> 14))
        {
          v382[1] = v467;
          return v382 + 2;
        }
        v490 = v382 + 1;
        do
        {
          v491 = v490;
          *v490++ = v467 | 0x80;
          unsigned int v492 = v467 >> 7;
          unsigned int v493 = v467 >> 14;
          v467 >>= 7;
        }
        while (v493);
        int v5 = v491 + 2;
        unsigned char *v490 = v492;
        return v5;
      case 0xE:
        if (*(void *)a4 <= (unint64_t)a3) {
          int v5 = (char *)sub_25C13CEE0((uint64_t)a4, (int)a3);
        }
        unint64_t v380 = *(int *)a1;
        unsigned int v400 = 8 * a2;
        if (8 * a2 > 0x7F)
        {
          *int v5 = v400 | 0x80;
          unsigned int v414 = v400 >> 7;
          if (v400 >> 14)
          {
            v468 = v5 + 1;
            do
            {
              v469 = v468;
              *v468++ = v414 | 0x80;
              unsigned int v470 = v414 >> 7;
              unsigned int v471 = v414 >> 14;
              v414 >>= 7;
            }
            while (v471);
            v382 = v469 + 2;
            unsigned char *v468 = v470;
          }
          else
          {
            v5[1] = v414;
            v382 = v5 + 2;
          }
        }
        else
        {
          *int v5 = v400;
          v382 = v5 + 1;
        }
        if (v380 <= 0x7F)
        {
LABEL_660:
          unsigned char *v382 = v380;
          return v382 + 1;
        }
        unsigned char *v382 = v380 | 0x80;
        unint64_t v439 = v380 >> 7;
        if (!(v380 >> 14))
        {
LABEL_662:
          v382[1] = v439;
          return v382 + 2;
        }
        v440 = v382 + 1;
        do
        {
          v441 = v440;
          *v440++ = v439 | 0x80;
          unint64_t v442 = v439 >> 7;
          unint64_t v494 = v439 >> 14;
          v439 >>= 7;
        }
        while (v494);
LABEL_694:
        int v5 = v441 + 2;
        unsigned char *v440 = v442;
        return v5;
      case 0xF:
        if (*(void *)a4 <= (unint64_t)a3) {
          int v5 = (char *)sub_25C13CEE0((uint64_t)a4, (int)a3);
        }
        int v373 = *(_DWORD *)a1;
        unsigned int v374 = (8 * a2) | 5;
        if (v374 > 0x7F)
        {
          *int v5 = (8 * a2) | 0x85;
          unsigned int v375 = (8 * a2) >> 7;
          if (v374 >> 14)
          {
            v376 = v5 + 1;
            do
            {
              v377 = v376;
              *v376++ = v375 | 0x80;
              unsigned int v378 = v375 >> 7;
              unsigned int v472 = v375 >> 14;
              v375 >>= 7;
            }
            while (v472);
LABEL_665:
            v401 = v377 + 2;
            unsigned char *v376 = v378;
          }
          else
          {
LABEL_576:
            v5[1] = v375;
            v401 = v5 + 2;
          }
        }
        else
        {
LABEL_545:
          *int v5 = v374;
          v401 = v5 + 1;
        }
        _DWORD *v401 = v373;
        return (char *)(v401 + 1);
      case 0x10:
        if (*(void *)a4 <= (unint64_t)a3) {
          int v5 = (char *)sub_25C13CEE0((uint64_t)a4, (int)a3);
        }
        uint64_t v10 = *(void *)a1;
        unsigned int v11 = (8 * a2) | 1;
        if (v11 > 0x7F)
        {
          *int v5 = (8 * a2) | 0x81;
          unsigned int v12 = (8 * a2) >> 7;
          if (v11 >> 14)
          {
            uint64_t v13 = v5 + 1;
            do
            {
              unint64_t v14 = v13;
              *v13++ = v12 | 0x80;
              unsigned int v15 = v12 >> 7;
              unsigned int v473 = v12 >> 14;
              v12 >>= 7;
            }
            while (v473);
LABEL_669:
            v402 = v14 + 2;
            *uint64_t v13 = v15;
          }
          else
          {
LABEL_578:
            v5[1] = v12;
            v402 = v5 + 2;
          }
        }
        else
        {
LABEL_549:
          *int v5 = v11;
          v402 = v5 + 1;
        }
        void *v402 = v10;
        return (char *)(v402 + 1);
      case 0x11:
        if (*(void *)a4 <= (unint64_t)a3) {
          int v5 = (char *)sub_25C13CEE0((uint64_t)a4, (int)a3);
        }
        int v403 = *(_DWORD *)a1;
        unsigned int v404 = 8 * a2;
        if (8 * a2 > 0x7F)
        {
          *int v5 = v404 | 0x80;
          unsigned int v415 = v404 >> 7;
          if (v404 >> 14)
          {
            v474 = v5 + 1;
            do
            {
              v475 = v474;
              *v474++ = v415 | 0x80;
              unsigned int v476 = v415 >> 7;
              unsigned int v477 = v415 >> 14;
              v415 >>= 7;
            }
            while (v477);
            v382 = v475 + 2;
            unsigned char *v474 = v476;
          }
          else
          {
            v5[1] = v415;
            v382 = v5 + 2;
          }
        }
        else
        {
          *int v5 = v404;
          v382 = v5 + 1;
        }
        unsigned int v478 = (2 * v403) ^ (v403 >> 31);
        if (v478 <= 0x7F)
        {
          unsigned char *v382 = v478;
          return v382 + 1;
        }
        unsigned char *v382 = v478 | 0x80;
        unsigned int v479 = v478 >> 7;
        if (!(v478 >> 14))
        {
          v382[1] = v479;
          return v382 + 2;
        }
        v495 = v382 + 1;
        do
        {
          v496 = v495;
          *v495++ = v479 | 0x80;
          unsigned int v497 = v479 >> 7;
          unsigned int v498 = v479 >> 14;
          v479 >>= 7;
        }
        while (v498);
        int v5 = v496 + 2;
        unsigned char *v495 = v497;
        return v5;
      case 0x12:
        if (*(void *)a4 <= (unint64_t)a3) {
          int v5 = (char *)sub_25C13CEE0((uint64_t)a4, (int)a3);
        }
        uint64_t v405 = *(void *)a1;
        unsigned int v406 = 8 * a2;
        if (8 * a2 > 0x7F)
        {
          *int v5 = v406 | 0x80;
          unsigned int v416 = v406 >> 7;
          if (v406 >> 14)
          {
            v480 = v5 + 1;
            do
            {
              v481 = v480;
              *v480++ = v416 | 0x80;
              unsigned int v482 = v416 >> 7;
              unsigned int v483 = v416 >> 14;
              v416 >>= 7;
            }
            while (v483);
            v382 = v481 + 2;
            unsigned char *v480 = v482;
          }
          else
          {
            v5[1] = v416;
            v382 = v5 + 2;
          }
        }
        else
        {
          *int v5 = v406;
          v382 = v5 + 1;
        }
        unint64_t v484 = (2 * v405) ^ (v405 >> 63);
        if (v484 > 0x7F)
        {
          unsigned char *v382 = v484 | 0x80;
          unint64_t v485 = v484 >> 7;
          if (v484 >> 14)
          {
            v499 = v382 + 1;
            do
            {
              v500 = v499;
              *v499++ = v485 | 0x80;
              unint64_t v501 = v485 >> 7;
              unint64_t v502 = v485 >> 14;
              v485 >>= 7;
            }
            while (v502);
            int v5 = v500 + 2;
            unsigned char *v499 = v501;
          }
          else
          {
            v382[1] = v485;
            return v382 + 2;
          }
        }
        else
        {
          unsigned char *v382 = v484;
          return v382 + 1;
        }
        return v5;
      default:
        return v5;
    }
  }
  return v5;
}

void sub_25C145B58(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_25C145C50(uint64_t a1)
{
  uint64_t v1 = *(int **)(a1 + 16);
  if (*(unsigned __int16 *)(a1 + 8) < 0x101u)
  {
    if (*(_WORD *)(a1 + 10))
    {
      uint64_t v2 = 0;
      unint64_t v3 = &v1[8 * *(unsigned __int16 *)(a1 + 10)];
      do
      {
        uint64_t v4 = v1 + 2;
        int v5 = *v1;
        v1 += 8;
        v2 += sub_25C145D14(v4, v5);
      }
      while (v1 != v3);
      return v2;
    }
    return 0;
  }
  unsigned int v8 = *(int **)v1;
  unint64_t v6 = v1 + 2;
  int v7 = v8;
  if (v8 == v6) {
    return 0;
  }
  uint64_t v2 = 0;
  do
  {
    unint64_t v9 = sub_25C145D14((unsigned char *)v7 + 40, v7[8]);
    uint64_t v10 = (int *)*((void *)v7 + 1);
    if (v10)
    {
      do
      {
        unsigned int v11 = v10;
        uint64_t v10 = *(int **)v10;
      }
      while (v10);
    }
    else
    {
      do
      {
        unsigned int v11 = (int *)*((void *)v7 + 2);
        BOOL v12 = *(void *)v11 == (void)v7;
        int v7 = v11;
      }
      while (!v12);
    }
    v2 += v9;
    int v7 = v11;
  }
  while (v11 != v6);
  return v2;
}

unint64_t sub_25C145D14(unsigned char *a1, int a2)
{
  if (a1[9])
  {
    if (a1[11])
    {
      switch(a1[8])
      {
        case 1:
        case 6:
        case 0x10:
          uint64_t v6 = 8 * **(unsigned int **)a1;
          goto LABEL_51;
        case 2:
        case 7:
        case 0xF:
          uint64_t v6 = 4 * **(unsigned int **)a1;
          goto LABEL_51;
        case 3:
          uint64_t v13 = **(unsigned int **)a1;
          if ((int)v13 < 1) {
            goto LABEL_54;
          }
          uint64_t v6 = 0;
          unint64_t v14 = *(uint64_t **)(*(void *)a1 + 8);
          do
          {
            uint64_t v15 = *v14++;
            v6 += (9 * (__clz(v15 | 1) ^ 0x3F) + 73) >> 6;
            --v13;
          }
          while (v13);
          goto LABEL_51;
        case 4:
          uint64_t v16 = **(unsigned int **)a1;
          if ((int)v16 < 1) {
            goto LABEL_54;
          }
          uint64_t v6 = 0;
          uint64_t v17 = *(uint64_t **)(*(void *)a1 + 8);
          do
          {
            uint64_t v18 = *v17++;
            v6 += (9 * (__clz(v18 | 1) ^ 0x3F) + 73) >> 6;
            --v16;
          }
          while (v16);
          goto LABEL_51;
        case 5:
          uint64_t v19 = **(unsigned int **)a1;
          if ((int)v19 < 1) {
            goto LABEL_54;
          }
          uint64_t v6 = 0;
          char v20 = *(int **)(*(void *)a1 + 8);
          do
          {
            int v22 = *v20++;
            int v21 = v22;
            if (v22 < 0) {
              uint64_t v23 = 10;
            }
            else {
              uint64_t v23 = (9 * (__clz(v21 | 1) ^ 0x1F) + 73) >> 6;
            }
            v6 += v23;
            --v19;
          }
          while (v19);
          goto LABEL_51;
        case 8:
          uint64_t v6 = **(unsigned int **)a1;
          goto LABEL_51;
        case 9:
        case 0xA:
        case 0xB:
        case 0xC:
          unsigned int v85 = 3;
          unint64_t v86 = "/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiece/t"
                "hird_party/protobuf-lite/extension_set.cc";
          int v87 = 1599;
          memset(&__p, 0, sizeof(__p));
          std::string::append(&__p, "Non-primitive types can't be packed.");
          sub_25C13D6C8(&v85);
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__p.__r_.__value_.__l.__data_);
          }
          goto LABEL_54;
        case 0xD:
          uint64_t v7 = **(unsigned int **)a1;
          if ((int)v7 < 1) {
            goto LABEL_54;
          }
          uint64_t v6 = 0;
          unsigned int v8 = *(int **)(*(void *)a1 + 8);
          do
          {
            int v9 = *v8++;
            v6 += (9 * (__clz(v9 | 1) ^ 0x1F) + 73) >> 6;
            --v7;
          }
          while (v7);
          goto LABEL_51;
        case 0xE:
          uint64_t v24 = **(unsigned int **)a1;
          if ((int)v24 < 1) {
            goto LABEL_54;
          }
          uint64_t v6 = 0;
          int v25 = *(int **)(*(void *)a1 + 8);
          do
          {
            int v27 = *v25++;
            int v26 = v27;
            if (v27 < 0) {
              uint64_t v28 = 10;
            }
            else {
              uint64_t v28 = (9 * (__clz(v26 | 1) ^ 0x1F) + 73) >> 6;
            }
            v6 += v28;
            --v24;
          }
          while (v24);
          goto LABEL_51;
        case 0x11:
          uint64_t v10 = **(unsigned int **)a1;
          if ((int)v10 < 1) {
            goto LABEL_54;
          }
          uint64_t v6 = 0;
          unsigned int v11 = *(int **)(*(void *)a1 + 8);
          do
          {
            int v12 = *v11++;
            v6 += (9 * (__clz((2 * v12) ^ (v12 >> 31) | 1) ^ 0x1F) + 73) >> 6;
            --v10;
          }
          while (v10);
          goto LABEL_51;
        case 0x12:
          uint64_t v29 = **(unsigned int **)a1;
          if ((int)v29 < 1) {
            goto LABEL_54;
          }
          uint64_t v6 = 0;
          unsigned int v30 = *(uint64_t **)(*(void *)a1 + 8);
          do
          {
            uint64_t v31 = *v30++;
            v6 += (9 * (__clz((2 * v31) ^ (v31 >> 63) | 1) ^ 0x3F) + 73) >> 6;
            --v29;
          }
          while (v29);
LABEL_51:
          *((_DWORD *)a1 + 3) = v6;
          unint64_t v32 = v6 + ((9 * (__clz((8 * a2) | 3) ^ 0x1F) + 73) >> 6) + ((9 * (__clz(v6 | 1) ^ 0x1F) + 73) >> 6);
          if (v6) {
            unint64_t v3 = v32;
          }
          else {
            unint64_t v3 = 0;
          }
          break;
        default:
LABEL_54:
          unint64_t v3 = 0;
          *((_DWORD *)a1 + 3) = 0;
          break;
      }
    }
    else
    {
      unint64_t v4 = (unint64_t)((9 * (__clz((8 * a2) | 1) ^ 0x1F) + 73) >> 6) << (a1[8] == 10);
      switch(a1[8])
      {
        case 1:
        case 6:
        case 0x10:
          unsigned int v5 = v4 + 8;
          goto LABEL_15;
        case 2:
        case 7:
        case 0xF:
          unsigned int v5 = v4 + 4;
LABEL_15:
          unint64_t v3 = v5 * (unint64_t)**(unsigned int **)a1;
          break;
        case 3:
          uint64_t v38 = **(unsigned int **)a1;
          unint64_t v3 = v4 * (unint64_t)v38;
          if ((int)v38 >= 1)
          {
            unint64_t v39 = *(uint64_t **)(*(void *)a1 + 8);
            do
            {
              uint64_t v40 = *v39++;
              v3 += (9 * (__clz(v40 | 1) ^ 0x3F) + 73) >> 6;
              --v38;
            }
            while (v38);
          }
          break;
        case 4:
          uint64_t v41 = **(unsigned int **)a1;
          unint64_t v3 = v4 * (unint64_t)v41;
          if ((int)v41 >= 1)
          {
            uint64_t v42 = *(uint64_t **)(*(void *)a1 + 8);
            do
            {
              uint64_t v43 = *v42++;
              v3 += (9 * (__clz(v43 | 1) ^ 0x3F) + 73) >> 6;
              --v41;
            }
            while (v41);
          }
          break;
        case 5:
          uint64_t v44 = **(unsigned int **)a1;
          unint64_t v3 = v4 * (unint64_t)v44;
          if ((int)v44 >= 1)
          {
            int v45 = *(int **)(*(void *)a1 + 8);
            do
            {
              int v47 = *v45++;
              int v46 = v47;
              if (v47 < 0) {
                uint64_t v48 = 10;
              }
              else {
                uint64_t v48 = (9 * (__clz(v46 | 1) ^ 0x1F) + 73) >> 6;
              }
              v3 += v48;
              --v44;
            }
            while (v44);
          }
          break;
        case 8:
          unint64_t v3 = **(unsigned int **)a1 + **(unsigned int **)a1 * (unint64_t)v4;
          break;
        case 9:
          uint64_t v49 = *(unsigned int *)(*(void *)a1 + 8);
          unint64_t v3 = v4 * (unint64_t)v49;
          if ((int)v49 >= 1)
          {
            uint64_t v50 = (uint64_t *)(*(void *)(*(void *)a1 + 16) + 8);
            do
            {
              uint64_t v51 = *v50++;
              uint64_t v52 = *(unsigned __int8 *)(v51 + 23);
              uint64_t v53 = *(void *)(v51 + 8);
              if ((v52 & 0x80u) == 0) {
                uint64_t v53 = v52;
              }
              v3 += v53 + ((9 * (__clz(v53 | 1) ^ 0x1F) + 73) >> 6);
              --v49;
            }
            while (v49);
          }
          break;
        case 0xA:
          uint64_t v54 = *(void *)a1;
          int v55 = *(_DWORD *)(*(void *)a1 + 8);
          unint64_t v3 = v4 * (unint64_t)v55;
          if (v55 >= 1)
          {
            uint64_t v56 = 0;
            do
            {
              uint64_t v57 = *(void *)(*(void *)(v54 + 16) + 8 * v56 + 8);
              v3 += (*(uint64_t (**)(uint64_t))(*(void *)v57 + 72))(v57);
              ++v56;
              uint64_t v54 = *(void *)a1;
            }
            while (v56 < *(int *)(*(void *)a1 + 8));
          }
          break;
        case 0xB:
          uint64_t v58 = *(void *)a1;
          int v59 = *(_DWORD *)(*(void *)a1 + 8);
          unint64_t v3 = v4 * (unint64_t)v59;
          if (v59 >= 1)
          {
            uint64_t v60 = 0;
            do
            {
              uint64_t v61 = *(void *)(*(void *)(v58 + 16) + 8 * v60 + 8);
              uint64_t v62 = (*(uint64_t (**)(uint64_t))(*(void *)v61 + 72))(v61);
              v3 += v62 + ((9 * (__clz(v62 | 1) ^ 0x1F) + 73) >> 6);
              ++v60;
              uint64_t v58 = *(void *)a1;
            }
            while (v60 < *(int *)(*(void *)a1 + 8));
          }
          break;
        case 0xC:
          uint64_t v63 = *(unsigned int *)(*(void *)a1 + 8);
          unint64_t v3 = v4 * (unint64_t)v63;
          if ((int)v63 >= 1)
          {
            uint64_t v64 = (uint64_t *)(*(void *)(*(void *)a1 + 16) + 8);
            do
            {
              uint64_t v65 = *v64++;
              uint64_t v66 = *(unsigned __int8 *)(v65 + 23);
              uint64_t v67 = *(void *)(v65 + 8);
              if ((v66 & 0x80u) == 0) {
                uint64_t v67 = v66;
              }
              v3 += v67 + ((9 * (__clz(v67 | 1) ^ 0x1F) + 73) >> 6);
              --v63;
            }
            while (v63);
          }
          break;
        case 0xD:
          uint64_t v68 = **(unsigned int **)a1;
          unint64_t v3 = v4 * (unint64_t)v68;
          if ((int)v68 >= 1)
          {
            uint64_t v69 = *(int **)(*(void *)a1 + 8);
            do
            {
              int v70 = *v69++;
              v3 += (9 * (__clz(v70 | 1) ^ 0x1F) + 73) >> 6;
              --v68;
            }
            while (v68);
          }
          break;
        case 0xE:
          uint64_t v71 = **(unsigned int **)a1;
          unint64_t v3 = v4 * (unint64_t)v71;
          if ((int)v71 >= 1)
          {
            uint64_t v72 = *(int **)(*(void *)a1 + 8);
            do
            {
              int v74 = *v72++;
              int v73 = v74;
              if (v74 < 0) {
                uint64_t v75 = 10;
              }
              else {
                uint64_t v75 = (9 * (__clz(v73 | 1) ^ 0x1F) + 73) >> 6;
              }
              v3 += v75;
              --v71;
            }
            while (v71);
          }
          break;
        case 0x11:
          uint64_t v76 = **(unsigned int **)a1;
          unint64_t v3 = v4 * (unint64_t)v76;
          if ((int)v76 >= 1)
          {
            uint64_t v77 = *(int **)(*(void *)a1 + 8);
            do
            {
              int v78 = *v77++;
              v3 += (9 * (__clz((2 * v78) ^ (v78 >> 31) | 1) ^ 0x1F) + 73) >> 6;
              --v76;
            }
            while (v76);
          }
          break;
        case 0x12:
          uint64_t v79 = **(unsigned int **)a1;
          unint64_t v3 = v4 * (unint64_t)v79;
          if ((int)v79 >= 1)
          {
            uint64_t v80 = *(uint64_t **)(*(void *)a1 + 8);
            do
            {
              uint64_t v81 = *v80++;
              v3 += (9 * (__clz((2 * v81) ^ (v81 >> 63) | 1) ^ 0x3F) + 73) >> 6;
              --v79;
            }
            while (v79);
          }
          break;
        default:
          return 0;
      }
    }
  }
  else if (a1[10])
  {
    return 0;
  }
  else
  {
    unint64_t v3 = (unint64_t)((9 * (__clz((8 * a2) | 1) ^ 0x1F) + 73) >> 6) << (a1[8] == 10);
    switch(a1[8])
    {
      case 1:
      case 6:
      case 0x10:
        v3 += 8;
        return v3;
      case 2:
      case 7:
      case 0xF:
        v3 += 4;
        return v3;
      case 3:
      case 4:
        uint64_t v34 = *(void *)a1;
        goto LABEL_127;
      case 5:
      case 0xE:
        uint64_t v35 = (9 * (__clz(*(_DWORD *)a1 | 1) ^ 0x1F) + 73) >> 6;
        if (*(int *)a1 >= 0) {
          uint64_t v36 = v35;
        }
        else {
          uint64_t v36 = 10;
        }
        v3 += v36;
        return v3;
      case 8:
        return ++v3;
      case 9:
      case 0xC:
        uint64_t v37 = *(void *)(*(void *)a1 + 8);
        if (*(char *)(*(void *)a1 + 23) >= 0) {
          uint64_t v37 = *(unsigned __int8 *)(*(void *)a1 + 23);
        }
        v3 += v37 + ((9 * (__clz(v37 | 1) ^ 0x1F) + 73) >> 6);
        return v3;
      case 0xA:
        v3 += (*(uint64_t (**)(void))(**(void **)a1 + 72))();
        return v3;
      case 0xB:
        uint64_t v82 = **(void **)a1;
        if ((a1[10] & 0x10) != 0) {
          uint64_t v83 = (*(uint64_t (**)(void))(v82 + 88))();
        }
        else {
          uint64_t v83 = (*(uint64_t (**)(void))(v82 + 72))();
        }
        v3 += v83 + ((9 * (__clz(v83 | 1) ^ 0x1F) + 73) >> 6);
        return v3;
      case 0xD:
        int v84 = *(_DWORD *)a1;
        goto LABEL_125;
      case 0x11:
        int v84 = (2 * *(_DWORD *)a1) ^ (*(int *)a1 >> 31);
LABEL_125:
        v3 += (9 * (__clz(v84 | 1) ^ 0x1F) + 73) >> 6;
        break;
      case 0x12:
        uint64_t v34 = (2 * *(void *)a1) ^ (*(uint64_t *)a1 >> 63);
LABEL_127:
        v3 += (9 * (__clz(v34 | 1) ^ 0x3F) + 73) >> 6;
        break;
      default:
        return v3;
    }
  }
  return v3;
}

void sub_25C146660(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_25C146758()
{
  uint64_t v0 = *MEMORY[0x263EF8340];
  operator new();
}

void sub_25C146C6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,int a28,__int16 a29,char a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53)
{
  uint64_t v57 = a53;
  a53 = 0;
  if (v57) {
    sub_25C13D850(v57);
  }
  if (a15 < 0) {
    operator delete(__p);
  }
  *(void *)(v54 + *(void *)(*MEMORY[0x263F8C2C8] - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
  if (a31 < 0) {
    operator delete(a26);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x26117F430](&a34);
  uint64_t v58 = *v55;
  uint64_t *v55 = 0;
  if (v58) {
    sub_25C13D850(v58);
  }
  MEMORY[0x26117F4A0](v53, 0xA1C409BE6959DLL);
  _Unwind_Resume(a1);
}

BOOL sub_25C146F08(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 16);
  unint64_t v3 = (void *)MEMORY[0x263F8C0E8];
  if (v2 == (void *)MEMORY[0x263F8C0E8])
  {
    v18.__r_.__value_.__s.__data_[0] = 0;
    unsigned int v11 = sub_25C136E68(MEMORY[0x263F8C0F8], (uint64_t)"filesystem.cc", 13);
    sub_25C136E68(v11, (uint64_t)"(", 1);
    int v12 = (void *)std::ostream::operator<<();
    uint64_t v13 = sub_25C136E68(v12, (uint64_t)") ", 2);
    unint64_t v14 = sub_25C136E68(v13, (uint64_t)"LOG(", 4);
    uint64_t v15 = sub_25C136E68(v14, (uint64_t)"ERROR", 5);
    uint64_t v16 = sub_25C136E68(v15, (uint64_t)") ", 2);
    sub_25C136E68(v16, (uint64_t)"ReadAll is not supported for stdin.", 35);
    sub_25C137184(&v18);
  }
  else
  {
    unsigned int v5 = *(void **)((char *)v2 + *(void *)(*v2 - 24) + 40);
    memset(&v18, 0, sizeof(v18));
    while (v5 && (v5[3] != v5[4] || (*(unsigned int (**)(void *))(*v5 + 72))(v5) != -1))
    {
      uint64_t v6 = (std::string::value_type *)v5[3];
      if (v6 == (std::string::value_type *)v5[4]) {
        std::string::value_type v7 = (*(uint64_t (**)(void *))(*v5 + 72))(v5);
      }
      else {
        std::string::value_type v7 = *v6;
      }
      std::string::push_back(&v18, v7);
      uint64_t v8 = v5[3];
      if (v8 == v5[4]) {
        (*(void (**)(void *))(*v5 + 80))(v5);
      }
      else {
        v5[3] = v8 + 1;
      }
    }
    if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      int v9 = &v18;
    }
    else {
      int v9 = (std::string *)v18.__r_.__value_.__r.__words[0];
    }
    if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(v18.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = v18.__r_.__value_.__l.__size_;
    }
    MEMORY[0x26117F1E0](a2, v9, size);
    if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v18.__r_.__value_.__l.__data_);
    }
  }
  return v2 != v3;
}

void sub_25C14710C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_25C147164(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void **)(a1 + 16);
  std::ios_base::getloc((const std::ios_base *)((char *)v3 + *(void *)(*v3 - 24)));
  unint64_t v4 = std::locale::use_facet(&v11, MEMORY[0x263F8C108]);
  unsigned __int8 v5 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v4->__vftable[2].~facet_0)(v4, 10);
  std::locale::~locale(&v11);
  MEMORY[0x26117F270](&v12, v3, 1);
  if (!v12) {
    return (*((unsigned char *)v3 + *(void *)(*v3 - 24) + 32) & 5) == 0;
  }
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
    std::string::value_type v7 = *(void **)((char *)v3 + *(void *)(*v3 - 24) + 40);
    uint64_t v8 = (unsigned char *)v7[3];
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
    if (v5 == v7)
    {
      int v9 = 0;
      goto LABEL_17;
    }
    std::string::push_back((std::string *)a2, (std::string::value_type)v7);
    ++v6;
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
  std::ios_base::clear((std::ios_base *)((char *)v3 + *(void *)(*v3 - 24)), *(_DWORD *)((char *)v3 + *(void *)(*v3 - 24) + 32) | v9);
  return (*((unsigned char *)v3 + *(void *)(*v3 - 24) + 32) & 5) == 0;
}

void sub_25C147348(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
}

void sub_25C14735C(void *a1)
{
  __cxa_begin_catch(a1);
  uint64_t v2 = *v1;
  *(_DWORD *)((char *)v1 + *(void *)(*v1 - 24) + 32) |= 1u;
  if ((*((unsigned char *)v1 + *(void *)(v2 - 24) + 36) & 1) == 0)
  {
    __cxa_end_catch();
    JUMPOUT(0x25C1472E4);
  }
  __cxa_rethrow();
}

void sub_25C1473D8()
{
}

void *sub_25C1473E8@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_25C13D9C8(a2, (void *)(a1 + 8));
}

void sub_25C1473F4(void *a1)
{
  sub_25C14742C(a1);

  JUMPOUT(0x26117F4A0);
}

void *sub_25C14742C(void *a1)
{
  *a1 = &unk_270989448;
  uint64_t v2 = a1[2];
  if (v2 != MEMORY[0x263F8C0E8] && v2 != 0) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  uint64_t v4 = a1[1];
  a1[1] = 0;
  if (v4) {
    sub_25C13D850(v4);
  }
  return a1;
}

uint64_t sub_25C1474BC(uint64_t (***a1)(void))
{
  return (**a1)(a1);
}

void sub_25C1474E0(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
}

void sub_25C1474F4()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26A596120, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26A596120))
  {
    qword_26A5963D0 = 0;
    *(void *)algn_26A5963D8 = 0;
    qword_26A5963E0 = 0;
    sub_25C147DA8((uint64_t)sub_25C1474E0, (uint64_t)&qword_26A5963D0);
    atomic_store(1u, byte_26A596300);
    __cxa_guard_release(&qword_26A596120);
  }
}

void sub_25C147588(_Unwind_Exception *a1)
{
}

void sub_25C1475A0(_DWORD *a1)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26A596128, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26A596128))
  {
    __cxa_atexit((void (*)(void *))std::mutex::~mutex, &stru_26A596028, &dword_25C135000);
    __cxa_guard_release(&qword_26A596128);
  }
  pthread_t v2 = pthread_self();
  uint64_t v3 = (uint64_t)v2;
  if (qword_26A596130)
  {
    if (v2 && v2 == (pthread_t)qword_26A596130)
    {
LABEL_5:
      if (*a1 != 1)
      {
        unsigned int v4 = 3;
        unsigned __int8 v5 = "/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiece/thir"
             "d_party/protobuf-lite/generated_message_util.cc";
        int v6 = 785;
        memset(&__p, 0, sizeof(__p));
        std::string::append(&__p, "CHECK failed: (scc->visit_status.load(std::memory_order_relaxed)) == (SCCInfoBase::kRunning): ");
        sub_25C13D6C8(&v4);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
      }
      return;
    }
  }
  else if (!v2)
  {
    goto LABEL_5;
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)byte_26A596300, memory_order_acquire) & 1) == 0) {
    sub_25C1474F4();
  }
  std::mutex::lock(&stru_26A596028);
  qword_26A596130 = v3;
  sub_25C147728(a1);
  qword_26A596130 = 0;

  std::mutex::unlock(&stru_26A596028);
}

void sub_25C147704(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

_DWORD *sub_25C147728(_DWORD *result)
{
  if (*result == -1)
  {
    uint64_t v1 = (uint64_t (**)(void))result;
    const std::string::value_type *result = 1;
    pthread_t v2 = result + 6;
    int v3 = result[1];
    if (v3 >= 1)
    {
      for (uint64_t i = 0; i < v3; ++i)
      {
        if (*(void *)&v2[2 * i])
        {
          sub_25C147728();
          int v3 = *((_DWORD *)v1 + 1);
        }
      }
    }
    uint64_t v5 = v3;
    int v6 = *((_DWORD *)v1 + 2);
    if (v6 >= 1)
    {
      uint64_t v7 = 0;
      uint64_t v8 = &v2[2 * v5];
      do
      {
        if (**(void **)&v8[2 * v7])
        {
          sub_25C147728();
          int v6 = *((_DWORD *)v1 + 2);
        }
        ++v7;
      }
      while (v7 < v6);
    }
    uint64_t result = (_DWORD *)v1[2]();
    atomic_store(0, (unsigned int *)v1);
  }
  return result;
}

uint64_t sub_25C1477D8()
{
  return 0;
}

void *sub_25C1477E0@<X0>(void *a1@<X8>)
{
  return sub_25C13C824(a1, "(cannot determine missing fields for lite message)");
}

uint64_t sub_25C1477F0(uint64_t a1, char *a2, int a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  size_t v6 = a3;
  (*(void (**)(uint64_t))(*(void *)a1 + 40))(a1);
  int v29 = 0;
  long long v28 = 0u;
  memset(v27, 0, sizeof(v27));
  unsigned int v31 = 0x80000000;
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  uint64_t v30 = 0x6400000000;
  if (a3 < 17)
  {
    memcpy((char *)v27 + 8, a2, v6);
    int v26 = 0;
    uint64_t v23 = (char *)v27 + v6 + 8;
    uint64_t v24 = (char *)v27 + v6 + 8;
    int v25 = 0;
    if (*((void *)&v28 + 1) == 1) {
      *((void *)&v28 + 1) = a2 - ((char *)v27 + 8);
    }
    a2 = (char *)v27 + 8;
  }
  else
  {
    int v26 = 16;
    uint64_t v23 = &a2[v6 - 16];
    uint64_t v24 = v23;
    int v25 = (char *)v27 + 8;
  }
  if ((*(uint64_t (**)(uint64_t, char *, char **))(*(void *)a1 + 88))(a1, a2, &v23)) {
    BOOL v7 = v29 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    if ((*(uint64_t (**)(uint64_t))(*(void *)a1 + 48))(a1)) {
      return 1;
    }
    unsigned int v16 = 2;
    uint64_t v17 = "/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiece/third_p"
          "arty/protobuf-lite/message_lite.cc";
    int v18 = 133;
    memset(&v19, 0, sizeof(v19));
    memset(&v15, 0, sizeof(v15));
    std::string::append(&v15, "Can't ");
    std::string::append(&v15, "parse");
    std::string::append(&v15, " message of type \"");
    (*(void (**)(void **__return_ptr, uint64_t))(*(void *)a1 + 16))(&__p, a1);
    if ((v22 & 0x80u) == 0) {
      p_p = (const std::string::value_type *)&__p;
    }
    else {
      p_p = (const std::string::value_type *)__p;
    }
    if ((v22 & 0x80u) == 0) {
      std::string::size_type v10 = v22;
    }
    else {
      std::string::size_type v10 = v21;
    }
    std::string::append(&v15, p_p, v10);
    if ((char)v22 < 0) {
      operator delete(__p);
    }
    std::string::append(&v15, "\" because it is missing required fields: ");
    (*(void (**)(void **__return_ptr, uint64_t))(*(void *)a1 + 56))(&__p, a1);
    if ((v22 & 0x80u) == 0) {
      std::locale v11 = (const std::string::value_type *)&__p;
    }
    else {
      std::locale v11 = (const std::string::value_type *)__p;
    }
    if ((v22 & 0x80u) == 0) {
      std::string::size_type v12 = v22;
    }
    else {
      std::string::size_type v12 = v21;
    }
    std::string::append(&v15, v11, v12);
    if ((char)v22 < 0) {
      operator delete(__p);
    }
    if ((v15.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v13 = &v15;
    }
    else {
      uint64_t v13 = (std::string *)v15.__r_.__value_.__r.__words[0];
    }
    if ((v15.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(v15.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = v15.__r_.__value_.__l.__size_;
    }
    std::string::append(&v19, (const std::string::value_type *)v13, size);
    sub_25C13D6C8(&v16);
    if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v15.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v19.__r_.__value_.__l.__data_);
    }
  }
  return 0;
}

void sub_25C147B14(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a24 < 0) {
    operator delete(a19);
  }
  _Unwind_Resume(exception_object);
}

void sub_25C147B74(std::string *a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  a1->__r_.__value_.__r.__words[0] = 0;
  a1->__r_.__value_.__l.__size_ = 0;
  a1->__r_.__value_.__r.__words[2] = 0;
  std::string::size_type v4 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 72))(a2);
  if (v4 >> 31)
  {
    unsigned int v10 = 2;
    std::locale v11 = "/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiece/third_p"
          "arty/protobuf-lite/message_lite.cc";
    int v12 = 457;
    memset(&v13, 0, sizeof(v13));
    (*(void (**)(void **__return_ptr, uint64_t))(*(void *)a2 + 16))(__p, a2);
    if ((v9 & 0x80u) == 0) {
      size_t v6 = __p;
    }
    else {
      size_t v6 = (void **)__p[0];
    }
    if ((v9 & 0x80u) == 0) {
      std::string::size_type v7 = v9;
    }
    else {
      std::string::size_type v7 = (std::string::size_type)__p[1];
    }
    std::string::append(&v13, (const std::string::value_type *)v6, v7);
    std::string::append(&v13, " exceeded maximum protobuf size of 2GB: ");
    snprintf(__str, 0x80uLL, "%lu", v4);
    char v17 = 0;
    std::string::append(&v13, __str);
    sub_25C13D6C8(&v10);
    if ((char)v9 < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v13.__r_.__value_.__l.__data_);
    }
    a1->__r_.__value_.__s.__data_[0] = 0;
    *((unsigned char *)&a1->__r_.__value_.__s + 23) = 0;
  }
  else
  {
    std::string::resize(a1, v4, 0);
    uint64_t v5 = a1;
    if (SHIBYTE(a1->__r_.__value_.__r.__words[2]) < 0) {
      uint64_t v5 = (std::string *)a1->__r_.__value_.__r.__words[0];
    }
    *(void *)__str = (char *)v5 + v4;
    uint64_t v15 = 0;
    v16[0] = 0;
    *(_DWORD *)((char *)v16 + 7) = 0;
    (*(void (**)(uint64_t))(*(void *)a2 + 96))(a2);
  }
}

void sub_25C147D5C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  if (a25 < 0) {
    operator delete(a20);
  }
  _Unwind_Resume(exception_object);
}

void sub_25C147DA8(uint64_t a1, uint64_t a2)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26A596140, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26A596140))
  {
    operator new();
  }
  uint64_t v4 = qword_26A596138;
  std::mutex::lock((std::mutex *)(qword_26A596138 + 24));
  size_t v6 = *(void **)(v4 + 8);
  unint64_t v5 = *(void *)(v4 + 16);
  if ((unint64_t)v6 >= v5)
  {
    uint64_t v8 = *(void **)v4;
    uint64_t v9 = ((uint64_t)v6 - *(void *)v4) >> 4;
    unint64_t v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 60) {
      sub_25C137658();
    }
    uint64_t v11 = v5 - (void)v8;
    if (v11 >> 3 > v10) {
      unint64_t v10 = v11 >> 3;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v12 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v12)
    {
      if (v12 >> 60) {
        sub_25C1376B8();
      }
      std::string v13 = (char *)operator new(16 * v12);
    }
    else
    {
      std::string v13 = 0;
    }
    unint64_t v14 = &v13[16 * v9];
    *(void *)unint64_t v14 = a1;
    *((void *)v14 + 1) = a2;
    std::string::size_type v7 = v14 + 16;
    if (v6 != v8)
    {
      do
      {
        *((_OWORD *)v14 - 1) = *((_OWORD *)v6 - 1);
        v14 -= 16;
        v6 -= 2;
      }
      while (v6 != v8);
      size_t v6 = *(void **)v4;
    }
    *(void *)uint64_t v4 = v14;
    *(void *)(v4 + 8) = v7;
    *(void *)(v4 + 16) = &v13[16 * v12];
    if (v6) {
      operator delete(v6);
    }
  }
  else
  {
    *size_t v6 = a1;
    v6[1] = a2;
    std::string::size_type v7 = v6 + 2;
  }
  *(void *)(v4 + 8) = v7;

  std::mutex::unlock((std::mutex *)(v4 + 24));
}

void sub_25C147F44(_Unwind_Exception *a1)
{
}

uint64_t sub_25C147F84(uint64_t a1, uint64_t *a2, unint64_t a3)
{
  size_t v6 = sub_25C1391F4((void *)(a1 + 64), a2, a3);
  if (v6)
  {
    std::string::size_type v7 = (unsigned int *)(v6 + 4);
  }
  else
  {
    uint64_t v8 = sub_25C1391F4((void *)(a1 + 24), a2, a3);
    std::string::size_type v7 = (unsigned int *)(v8 + 4);
    if (!v8) {
      std::string::size_type v7 = (unsigned int *)(a1 + 104);
    }
  }
  return *v7;
}

void *sub_25C147FF4(void *a1)
{
  *a1 = &unk_2709895C0;
  uint64_t v2 = a1[14];
  a1[14] = 0;
  if (v2) {
    sub_25C13D850(v2);
  }
  sub_25C138888((uint64_t)(a1 + 8));
  sub_25C138888((uint64_t)(a1 + 3));
  int v3 = (uint64_t *)a1[2];
  a1[2] = 0;
  if (v3) {
    sub_25C1394B4(v3);
  }
  return a1;
}

char *sub_25C148064(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 8) + 72);
  if (!v2) {
    uint64_t v2 = &unk_26A5963E8;
  }
  uint64_t v3 = v2[23];
  if (v3)
  {
    unint64_t explicit = v3 & 0xFFFFFFFFFFFFFFFELL;
  }
  else
  {
    unint64_t explicit = atomic_load_explicit(&qword_26A596080, memory_order_acquire);
    if (!explicit) {
      unint64_t explicit = sub_25C13645C(&off_26A596068);
    }
  }
  if (*(char *)(explicit + 23) < 0)
  {
    if (*(void *)(explicit + 8)) {
      goto LABEL_9;
    }
    return "<unk>";
  }
  if (!*(unsigned char *)(explicit + 23)) {
    return "<unk>";
  }
LABEL_9:
  unint64_t v5 = *(void **)(*(void *)(a1 + 8) + 72);
  if (!v5) {
    unint64_t v5 = &unk_26A5963E8;
  }
  uint64_t v6 = v5[23];
  if (v6)
  {
    uint64_t result = (char *)(v6 & 0xFFFFFFFFFFFFFFFELL);
  }
  else
  {
    uint64_t result = (char *)atomic_load_explicit(&qword_26A596080, memory_order_acquire);
    if (!result) {
      uint64_t result = (char *)sub_25C13645C(&off_26A596068);
    }
  }
  if (result[23] < 0) {
    return *(char **)result;
  }
  return result;
}

char *sub_25C148148(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 8) + 72);
  if (!v2) {
    uint64_t v2 = &unk_26A5963E8;
  }
  uint64_t v3 = v2[24];
  if (v3)
  {
    unint64_t explicit = v3 & 0xFFFFFFFFFFFFFFFELL;
  }
  else
  {
    unint64_t explicit = atomic_load_explicit(&qword_26A5960A0, memory_order_acquire);
    if (!explicit) {
      unint64_t explicit = sub_25C13645C(&off_26A596088);
    }
  }
  if (*(char *)(explicit + 23) < 0)
  {
    if (*(void *)(explicit + 8)) {
      goto LABEL_9;
    }
    return "<s>";
  }
  if (!*(unsigned char *)(explicit + 23)) {
    return "<s>";
  }
LABEL_9:
  unint64_t v5 = *(void **)(*(void *)(a1 + 8) + 72);
  if (!v5) {
    unint64_t v5 = &unk_26A5963E8;
  }
  uint64_t v6 = v5[24];
  if (v6)
  {
    uint64_t result = (char *)(v6 & 0xFFFFFFFFFFFFFFFELL);
  }
  else
  {
    uint64_t result = (char *)atomic_load_explicit(&qword_26A5960A0, memory_order_acquire);
    if (!result) {
      uint64_t result = (char *)sub_25C13645C(&off_26A596088);
    }
  }
  if (result[23] < 0) {
    return *(char **)result;
  }
  return result;
}

char *sub_25C14822C(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 8) + 72);
  if (!v2) {
    uint64_t v2 = &unk_26A5963E8;
  }
  uint64_t v3 = v2[25];
  if (v3)
  {
    unint64_t explicit = v3 & 0xFFFFFFFFFFFFFFFELL;
  }
  else
  {
    unint64_t explicit = atomic_load_explicit(&qword_26A5960C0, memory_order_acquire);
    if (!explicit) {
      unint64_t explicit = sub_25C13645C(&off_26A5960A8);
    }
  }
  if (*(char *)(explicit + 23) < 0)
  {
    if (*(void *)(explicit + 8)) {
      goto LABEL_9;
    }
    return "</s>";
  }
  if (!*(unsigned char *)(explicit + 23)) {
    return "</s>";
  }
LABEL_9:
  unint64_t v5 = *(void **)(*(void *)(a1 + 8) + 72);
  if (!v5) {
    unint64_t v5 = &unk_26A5963E8;
  }
  uint64_t v6 = v5[25];
  if (v6)
  {
    uint64_t result = (char *)(v6 & 0xFFFFFFFFFFFFFFFELL);
  }
  else
  {
    uint64_t result = (char *)atomic_load_explicit(&qword_26A5960C0, memory_order_acquire);
    if (!result) {
      uint64_t result = (char *)sub_25C13645C(&off_26A5960A8);
    }
  }
  if (result[23] < 0) {
    return *(char **)result;
  }
  return result;
}

void sub_25C148310(uint64_t a1)
{
  uint64_t v2 = a1;
  uint64_t v79 = (float *)(a1 + 24);
  sub_25C14900C((void *)(a1 + 24));
  int v78 = (float *)(v2 + 64);
  sub_25C14900C((void *)(v2 + 64));
  *(_DWORD *)(v2 + 104) = -1;
  int v84 = 0;
  uint64_t v85 = 0;
  uint64_t v83 = &v84;
  uint64_t v3 = operator new(0x20uLL);
  _OWORD *v3 = 0u;
  v3[1] = 0u;
  uint64_t v4 = *(void *)(v2 + 8);
  uint64_t v75 = v3;
  if (*(int *)(v4 + 56) < 1) {
    goto LABEL_141;
  }
  uint64_t v5 = 0;
  uint64_t v76 = v2;
  while (1)
  {
    uint64_t v6 = *(void *)(*(void *)(v4 + 64) + 8 * v5 + 8);
    unint64_t v7 = *(void *)(v6 + 48) & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v7 + 23) < 0)
    {
      if (!*(void *)(v7 + 8)) {
LABEL_132:
      }
        sub_25C13D8A4();
    }
    else if (!*(unsigned char *)(v7 + 23))
    {
      goto LABEL_132;
    }
    unsigned int v8 = *(_DWORD *)(v6 + 60);
    BOOL v9 = v8 > 5;
    int v10 = (1 << v8) & 0x32;
    if (v9 || v10 == 0) {
      unint64_t v12 = v78;
    }
    else {
      unint64_t v12 = v79;
    }
    uint64_t v81 = v6;
    size_t v77 = *(unsigned __int8 *)(v7 + 23);
    if ((*(unsigned char *)(v7 + 23) & 0x80) != 0)
    {
      std::string v13 = *(uint64_t **)v7;
      unint64_t v14 = *(void *)(v7 + 8);
    }
    else
    {
      std::string v13 = (uint64_t *)(*(void *)(v6 + 48) & 0xFFFFFFFFFFFFFFFELL);
      unint64_t v14 = *(unsigned __int8 *)(v7 + 23);
    }
    unint64_t v15 = sub_25C138D1C(v13, v14);
    size_t v16 = v15;
    unint64_t v17 = *((void *)v12 + 1);
    if (v17)
    {
      uint64_t v80 = v5;
      uint8x8_t v18 = (uint8x8_t)vcnt_s8((int8x8_t)v17);
      v18.i16[0] = vaddlv_u8(v18);
      unint64_t v19 = v18.u32[0];
      if (v18.u32[0] > 1uLL)
      {
        size_t v1 = v15;
        if (v15 >= v17) {
          size_t v1 = v15 % v17;
        }
      }
      else
      {
        size_t v1 = (v17 - 1) & v15;
      }
      char v20 = *(uint64_t ****)(*(void *)v12 + 8 * v1);
      if (v20)
      {
        std::string::size_type v21 = *v20;
        if (*v20)
        {
          while (1)
          {
            unint64_t v22 = (unint64_t)v21[1];
            if (v22 == v16)
            {
              if (v21[3] == (uint64_t *)v14 && !memcmp(v21[2], v13, v14))
              {
                char v58 = v77;
                if ((v77 & 0x80u) == 0) {
                  size_t v59 = v77;
                }
                else {
                  size_t v59 = *(void *)(v7 + 8);
                }
                unint64_t v60 = v59 + 20;
                if (v59 + 20 >= 0x7FFFFFFFFFFFFFF8) {
                  sub_25C1365BC();
                }
                if (v60 >= 0x17)
                {
                  uint64_t v65 = (v60 & 0xFFFFFFFFFFFFFFF8) + 8;
                  if ((v60 | 7) != 0x17) {
                    uint64_t v65 = v60 | 7;
                  }
                  uint64_t v66 = v65 + 1;
                  uint64_t v61 = (char *)operator new(v65 + 1);
                  *((void *)&v86 + 1) = v59 + 20;
                  int64_t v87 = v66 | 0x8000000000000000;
                  *(void *)&long long v86 = v61;
                  char v58 = v77;
                }
                else
                {
                  int64_t v87 = 0;
                  long long v86 = 0uLL;
                  HIBYTE(v87) = v59 + 20;
                  if ((v60 & 0x80u) == 0) {
                    uint64_t v61 = (char *)&v86;
                  }
                  else {
                    uint64_t v61 = 0;
                  }
                  if (!v59)
                  {
LABEL_149:
                    strcpy(&v61[v59], " is already defined.");
                    if (v87 >= 0) {
                      uint64_t v68 = (const char *)&v86;
                    }
                    else {
                      uint64_t v68 = (const char *)v86;
                    }
                    strlen(v68);
                    sub_25C13D8A4();
                  }
                }
                if (v58 >= 0) {
                  uint64_t v67 = (uint64_t *)v7;
                }
                else {
                  uint64_t v67 = *(uint64_t **)v7;
                }
                memmove(v61, v67, v59);
                goto LABEL_149;
              }
            }
            else
            {
              if (v19 > 1)
              {
                if (v22 >= v17) {
                  v22 %= v17;
                }
              }
              else
              {
                v22 &= v17 - 1;
              }
              if (v22 != v1)
              {
LABEL_33:
                uint64_t v3 = v75;
                break;
              }
            }
            std::string::size_type v21 = (uint64_t **)*v21;
            if (!v21) {
              goto LABEL_33;
            }
          }
        }
      }
      uint64_t v2 = v76;
      uint64_t v5 = v80;
    }
    uint64_t v23 = operator new(0x28uLL);
    *uint64_t v23 = 0;
    v23[1] = v16;
    v23[2] = v13;
    v23[3] = v14;
    *((_DWORD *)v23 + 8) = v5;
    float v24 = (float)(unint64_t)(*((void *)v12 + 3) + 1);
    float v25 = v12[8];
    if (!v17 || (float)(v25 * (float)v17) < v24) {
      break;
    }
LABEL_81:
    uint64_t v41 = *(void **)v12;
    uint64_t v42 = *(void **)(*(void *)v12 + 8 * v1);
    if (v42)
    {
      *uint64_t v23 = *v42;
      uint64_t v43 = v81;
LABEL_89:
      *uint64_t v42 = v23;
      goto LABEL_90;
    }
    *uint64_t v23 = *((void *)v12 + 2);
    *((void *)v12 + 2) = v23;
    v41[v1] = v12 + 4;
    uint64_t v43 = v81;
    if (*v23)
    {
      unint64_t v44 = *(void *)(*v23 + 8);
      if ((v17 & (v17 - 1)) != 0)
      {
        if (v44 >= v17) {
          v44 %= v17;
        }
      }
      else
      {
        v44 &= v17 - 1;
      }
      uint64_t v42 = (void *)(*(void *)v12 + 8 * v44);
      goto LABEL_89;
    }
LABEL_90:
    ++*((void *)v12 + 3);
    int v45 = *(_DWORD *)(v43 + 60);
    if (v45 == 4)
    {
      unint64_t v46 = *(void *)(v43 + 48) & 0xFFFFFFFFFFFFFFFELL;
      if (*(char *)(v46 + 23) < 0)
      {
        int v47 = *(void **)v46;
        size_t v1 = *(void *)(v46 + 8);
      }
      else
      {
        size_t v1 = *(unsigned __int8 *)(v46 + 23);
        int v47 = (void *)(*(void *)(v43 + 48) & 0xFFFFFFFFFFFFFFFELL);
      }
      uint64_t v48 = (uint64_t **)sub_25C1498EC((uint64_t)&v83, &v86, v47, v1);
      if (!*v48)
      {
        uint64_t v49 = v48;
        uint64_t v50 = (uint64_t *)operator new(0x30uLL);
        v50[4] = (uint64_t)v47;
        v50[5] = v1;
        uint64_t v51 = v86;
        *uint64_t v50 = 0;
        v50[1] = 0;
        v50[2] = v51;
        *uint64_t v49 = v50;
        if (*v83)
        {
          uint64_t v83 = (uint64_t **)*v83;
          uint64_t v50 = *v49;
        }
        sub_25C13C3AC(v84, v50);
        ++v85;
      }
      int v45 = *(_DWORD *)(v43 + 60);
    }
    if (v45 == 6)
    {
      uint64_t v52 = *(unsigned char **)(*(void *)(v2 + 8) + 72);
      if (!v52) {
        uint64_t v52 = &unk_26A5963E8;
      }
      if (!v52[240])
      {
        std::operator+<char>();
        long long v70 = *(_OWORD *)&v69->__r_.__value_.__l.__data_;
        int64_t v87 = v69->__r_.__value_.__r.__words[2];
        long long v86 = v70;
        v69->__r_.__value_.__l.__size_ = 0;
        v69->__r_.__value_.__r.__words[2] = 0;
        v69->__r_.__value_.__r.__words[0] = 0;
        if (v87 >= 0) {
          uint64_t v71 = (const char *)&v86;
        }
        else {
          uint64_t v71 = (const char *)v86;
        }
        strlen(v71);
        sub_25C13D8A4();
      }
      unint64_t v53 = *(void *)(v43 + 48) & 0xFFFFFFFFFFFFFFFELL;
      if (*(char *)(v53 + 23) < 0)
      {
        int v55 = *(void **)v53;
        size_t v54 = *(void *)(v53 + 8);
      }
      else
      {
        size_t v54 = *(unsigned __int8 *)(v53 + 23);
        int v55 = (void *)(*(void *)(v43 + 48) & 0xFFFFFFFFFFFFFFFELL);
      }
      unsigned int v56 = sub_25C149074(v55, v54);
      if ((v56 & 0x80000000) != 0)
      {
        std::operator+<char>();
        uint64_t v72 = std::string::append(&v82, " is invalid.");
        long long v73 = *(_OWORD *)&v72->__r_.__value_.__l.__data_;
        int64_t v87 = v72->__r_.__value_.__r.__words[2];
        long long v86 = v73;
        v72->__r_.__value_.__l.__size_ = 0;
        v72->__r_.__value_.__r.__words[2] = 0;
        v72->__r_.__value_.__r.__words[0] = 0;
        if (v87 >= 0) {
          int v74 = (const char *)&v86;
        }
        else {
          int v74 = (const char *)v86;
        }
        strlen(v74);
        sub_25C13D8A4();
      }
      *(void *)((char *)v3 + (((unint64_t)v56 >> 3) & 0x1FFFFFF8)) |= 1 << v56;
    }
    else if (v45 == 2)
    {
      if ((*(_DWORD *)(v2 + 104) & 0x80000000) == 0) {
        sub_25C13D8A4();
      }
      *(_DWORD *)(v2 + 104) = v5;
    }
    ++v5;
    uint64_t v4 = *(void *)(v2 + 8);
    if (v5 >= *(int *)(v4 + 56))
    {
      if (*(_DWORD *)(v2 + 104) != -1)
      {
        uint64_t v62 = *(unsigned char **)(v4 + 72);
        if (!v62) {
          uint64_t v62 = &unk_26A5963E8;
        }
        if (v62[240])
        {
          uint64_t v63 = -256;
          uint64_t v64 = v3;
          while (*v64 == -1)
          {
            ++v64;
            v63 += 64;
            if (!v63)
            {
              uint64_t v64 = v3 + 2;
              goto LABEL_163;
            }
          }
          LODWORD(v63) = __clz(__rbit64(~*v64));
LABEL_163:
          if (v64 != (void *)(v3 + 2) || v63) {
            sub_25C13D8A4();
          }
        }
        operator new();
      }
LABEL_141:
      sub_25C13D8A4();
    }
  }
  BOOL v26 = (v17 & (v17 - 1)) != 0;
  if (v17 < 3) {
    BOOL v26 = 1;
  }
  unint64_t v27 = v26 | (2 * v17);
  unint64_t v28 = vcvtps_u32_f32(v24 / v25);
  if (v27 <= v28) {
    int8x8_t prime = (int8x8_t)v28;
  }
  else {
    int8x8_t prime = (int8x8_t)v27;
  }
  if (*(void *)&prime == 1)
  {
    int8x8_t prime = (int8x8_t)2;
  }
  else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
  {
    int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
  }
  unint64_t v17 = *((void *)v12 + 1);
  if (*(void *)&prime > v17) {
    goto LABEL_47;
  }
  if (*(void *)&prime < v17)
  {
    unint64_t v36 = vcvtps_u32_f32((float)*((unint64_t *)v12 + 3) / v12[8]);
    if (v17 < 3 || (uint8x8_t v37 = (uint8x8_t)vcnt_s8((int8x8_t)v17), v37.i16[0] = vaddlv_u8(v37), v37.u32[0] > 1uLL))
    {
      unint64_t v36 = std::__next_prime(v36);
    }
    else
    {
      uint64_t v38 = 1 << -(char)__clz(v36 - 1);
      if (v36 >= 2) {
        unint64_t v36 = v38;
      }
    }
    if (*(void *)&prime <= v36) {
      int8x8_t prime = (int8x8_t)v36;
    }
    if (*(void *)&prime >= v17)
    {
      unint64_t v17 = *((void *)v12 + 1);
    }
    else
    {
      if (prime)
      {
LABEL_47:
        if (*(void *)&prime >> 61) {
          sub_25C1376B8();
        }
        uint64_t v30 = operator new(8 * *(void *)&prime);
        unsigned int v31 = *(void **)v12;
        *(void *)unint64_t v12 = v30;
        if (v31) {
          operator delete(v31);
        }
        uint64_t v32 = 0;
        *((int8x8_t *)v12 + 1) = prime;
        do
          *(void *)(*(void *)v12 + 8 * v32++) = 0;
        while (*(void *)&prime != v32);
        uint64_t v33 = (void *)*((void *)v12 + 2);
        if (v33)
        {
          unint64_t v34 = v33[1];
          uint8x8_t v35 = (uint8x8_t)vcnt_s8(prime);
          v35.i16[0] = vaddlv_u8(v35);
          if (v35.u32[0] > 1uLL)
          {
            if (v34 >= *(void *)&prime) {
              v34 %= *(void *)&prime;
            }
          }
          else
          {
            v34 &= *(void *)&prime - 1;
          }
          *(void *)(*(void *)v12 + 8 * v34) = v12 + 4;
          unint64_t v39 = (void *)*v33;
          if (*v33)
          {
            do
            {
              unint64_t v40 = v39[1];
              if (v35.u32[0] > 1uLL)
              {
                if (v40 >= *(void *)&prime) {
                  v40 %= *(void *)&prime;
                }
              }
              else
              {
                v40 &= *(void *)&prime - 1;
              }
              if (v40 != v34)
              {
                if (!*(void *)(*(void *)v12 + 8 * v40))
                {
                  *(void *)(*(void *)v12 + 8 * v40) = v33;
                  goto LABEL_72;
                }
                void *v33 = *v39;
                *unint64_t v39 = **(void **)(*(void *)v12 + 8 * v40);
                **(void **)(*(void *)v12 + 8 * v40) = v39;
                unint64_t v39 = v33;
              }
              unint64_t v40 = v34;
LABEL_72:
              uint64_t v33 = v39;
              unint64_t v39 = (void *)*v39;
              unint64_t v34 = v40;
            }
            while (v39);
          }
        }
        unint64_t v17 = (unint64_t)prime;
        goto LABEL_76;
      }
      uint64_t v57 = *(void **)v12;
      *(void *)unint64_t v12 = 0;
      if (v57) {
        operator delete(v57);
      }
      unint64_t v17 = 0;
      *((void *)v12 + 1) = 0;
    }
  }
LABEL_76:
  if ((v17 & (v17 - 1)) != 0)
  {
    if (v16 >= v17) {
      size_t v1 = v16 % v17;
    }
    else {
      size_t v1 = v16;
    }
  }
  else
  {
    size_t v1 = (v17 - 1) & v16;
  }
  goto LABEL_81;
}

void sub_25C148EA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,uint64_t a25,void *a26)
{
  uint64_t v28 = *(void *)(v26 - 112);
  *(void *)(v26 - 112) = 0;
  if (v28) {
    sub_25C13D850(v28);
  }
  operator delete(__p);
  sub_25C13DEA0(a26);
  _Unwind_Resume(a1);
}

void *sub_25C14900C(void *result)
{
  if (result[3])
  {
    size_t v1 = result;
    uint64_t result = (void *)result[2];
    if (result)
    {
      do
      {
        uint64_t v2 = (void *)*result;
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

uint64_t sub_25C149074(void *__src, size_t __len)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26A596150, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26A596150))
  {
    sub_25C14927C();
  }
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    sub_25C1365BC();
  }
  uint64_t v4 = (void *)qword_26A596148;
  if (__len >= 0x17)
  {
    size_t v6 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v6 = __len | 7;
    }
    size_t v7 = v6 + 1;
    p_dst = operator new(v6 + 1);
    size_t v23 = __len;
    int64_t v24 = v7 | 0x8000000000000000;
    __dst = p_dst;
  }
  else
  {
    HIBYTE(v24) = __len;
    p_dst = &__dst;
    if (!__len) {
      goto LABEL_10;
    }
  }
  memmove(p_dst, __src, __len);
LABEL_10:
  *((unsigned char *)p_dst + __len) = 0;
  int v8 = SHIBYTE(v24);
  BOOL v9 = __dst;
  if (v24 >= 0) {
    int v10 = (uint64_t *)&__dst;
  }
  else {
    int v10 = __dst;
  }
  if (v24 >= 0) {
    unint64_t v11 = HIBYTE(v24);
  }
  else {
    unint64_t v11 = v23;
  }
  unint64_t v12 = sub_25C138D1C(v10, v11);
  int8x8_t v13 = (int8x8_t)v4[1];
  if (!*(void *)&v13) {
    goto LABEL_33;
  }
  unint64_t v14 = v12;
  uint8x8_t v15 = (uint8x8_t)vcnt_s8(v13);
  v15.i16[0] = vaddlv_u8(v15);
  unint64_t v16 = v15.u32[0];
  if (v15.u32[0] > 1uLL)
  {
    unint64_t v17 = v12;
    if (v12 >= *(void *)&v13) {
      unint64_t v17 = v12 % *(void *)&v13;
    }
  }
  else
  {
    unint64_t v17 = (*(void *)&v13 - 1) & v12;
  }
  uint8x8_t v18 = *(unsigned __int8 ***)(*v4 + 8 * v17);
  if (v18)
  {
    for (uint64_t i = *v18; i; uint64_t i = *(unsigned __int8 **)i)
    {
      unint64_t v20 = *((void *)i + 1);
      if (v14 == v20)
      {
        if (sub_25C14973C(i + 16, (unsigned __int8 *)&__dst)) {
          break;
        }
      }
      else
      {
        if (v16 > 1)
        {
          if (v20 >= *(void *)&v13) {
            v20 %= *(void *)&v13;
          }
        }
        else
        {
          v20 &= *(void *)&v13 - 1;
        }
        if (v20 != v17) {
          goto LABEL_33;
        }
      }
    }
  }
  else
  {
LABEL_33:
    uint64_t i = 0;
  }
  if (v8 < 0)
  {
    operator delete(v9);
    if (i) {
      return i[40];
    }
  }
  else if (i)
  {
    return i[40];
  }
  return 0xFFFFFFFFLL;
}

void sub_25C149258(_Unwind_Exception *a1)
{
}

void sub_25C14927C()
{
}

void sub_25C149708(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  sub_25C14988C(1, v14);
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

BOOL sub_25C14973C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t v2 = a1[23];
  if ((v2 & 0x80u) == 0) {
    uint64_t v3 = a1[23];
  }
  else {
    uint64_t v3 = *((void *)a1 + 1);
  }
  uint64_t v4 = a2[23];
  int v5 = (char)v4;
  if ((v4 & 0x80u) != 0) {
    uint64_t v4 = *((void *)a2 + 1);
  }
  if (v3 != v4) {
    return 0;
  }
  if (v5 < 0) {
    a2 = *(unsigned __int8 **)a2;
  }
  if ((v2 & 0x80) != 0) {
    return memcmp(*(const void **)a1, a2, *((void *)a1 + 1)) == 0;
  }
  if (!a1[23]) {
    return 1;
  }
  uint64_t v6 = v2 - 1;
  do
  {
    int v8 = *a1++;
    int v7 = v8;
    int v10 = *a2++;
    int v9 = v10;
    BOOL v12 = v6-- != 0;
    BOOL v13 = v7 == v9;
    BOOL v14 = v7 == v9;
  }
  while (v13 && v12);
  return v14;
}

uint64_t sub_25C1497E0(uint64_t a1, unsigned __int8 *a2)
{
  int v4 = snprintf(0, 0, "<0x%02X>", *a2);
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = 0;
  std::string::resize((std::string *)a1, v4, 0);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 23);
  if ((v5 & 0x80u) == 0) {
    uint64_t v6 = (char *)a1;
  }
  else {
    uint64_t v6 = *(char **)a1;
  }
  if ((v5 & 0x80u) != 0) {
    uint64_t v5 = *(void *)(a1 + 8);
  }
  return snprintf(v6, v5 + 1, "<0x%02X>", *a2);
}

void sub_25C149870(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_25C14988C(char a1, void **__p)
{
  if (a1)
  {
    if (*((char *)__p + 39) < 0) {
      operator delete(__p[2]);
    }
  }
  else if (!__p)
  {
    return;
  }

  operator delete(__p);
}

void *sub_25C1498EC(uint64_t a1, void *a2, void *a3, size_t a4)
{
  uint64_t v6 = (void *)(a1 + 8);
  uint64_t v5 = *(void **)(a1 + 8);
  if (v5)
  {
    do
    {
      while (1)
      {
        int v9 = v5;
        int v10 = (void *)v5[4];
        size_t v11 = v5[5];
        if (!sub_25C14999C(a3, a4, v10, v11)) {
          break;
        }
        uint64_t v5 = (void *)*v9;
        uint64_t v6 = v9;
        if (!*v9) {
          goto LABEL_9;
        }
      }
      if (!sub_25C14999C(v10, v11, a3, a4)) {
        break;
      }
      uint64_t v6 = v9 + 1;
      uint64_t v5 = (void *)v9[1];
    }
    while (v5);
  }
  else
  {
    int v9 = (void *)(a1 + 8);
  }
LABEL_9:
  *a2 = v9;
  return v6;
}

uint64_t sub_25C14999C(const void *a1, size_t a2, void *__s2, size_t a4)
{
  if (a4 >= a2) {
    size_t v7 = a2;
  }
  else {
    size_t v7 = a4;
  }
  int v8 = memcmp(a1, __s2, v7);
  if (a2 < a4) {
    unsigned int v9 = -1;
  }
  else {
    unsigned int v9 = 1;
  }
  if (a2 == a4) {
    unsigned int v9 = 0;
  }
  if (v8) {
    unsigned int v9 = v8;
  }
  return v9 >> 31;
}

void sub_25C149A08(uint64_t a1@<X0>, void *a2@<X8>)
{
  std::string __p = 0;
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  a2[1] = 0;
  a2[2] = 0;
  *a2 = 0;
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 32))(&v3);
  uint64_t v2 = v3;
  uint64_t v3 = 0;
  if (v2) {
    sub_25C13D850(v2);
  }
  if (__p)
  {
    uint64_t v5 = __p;
    operator delete(__p);
  }
}

void sub_25C149A90(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (*(char *)(v11 + 23) < 0) {
    operator delete(*(void **)v11);
  }
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_25C149ABC(void *a1@<X0>, char *a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, char **a5@<X4>, void *a6@<X8>)
{
  unint64_t v6 = a3;
  v109 = a5;
  v110 = (std::string *)a4;
  a5[1] = *a5;
  if (*(char *)(a4 + 23) < 0)
  {
    **(unsigned char **)a4 = 0;
    *(void *)(a4 + 8) = 0;
    if (!a3)
    {
LABEL_10:
      *a6 = 0;
      return;
    }
  }
  else
  {
    *(unsigned char *)a4 = 0;
    *(unsigned char *)(a4 + 23) = 0;
    if (!a3) {
      goto LABEL_10;
    }
  }
  (*(void (**)(void *))(*a1 + 24))(a1);
  if (*a6) {
    return;
  }
  *a6 = 0;
  int v10 = *(unsigned __int8 *)(a1[3] + 73);
  int v108 = 0;
  if (v10)
  {
    while (1)
    {
      sub_25C14A398((size_t)&v102, a1, a2, v6);
      if (v103 != 1 || *v102 != 32) {
        break;
      }
      a2 += (int)v104;
      v108 += v104;
      v6 -= (int)v104;
      if (!v6) {
        goto LABEL_10;
      }
    }
  }
  int v99 = a6;
  std::string::reserve(v110, 3 * v6);
  uint64_t v11 = v109;
  if (3 * v6 > (v11[2] - *v11) >> 3)
  {
    if ((3 * v6) >> 61) {
      goto LABEL_133;
    }
    uint64_t v12 = v109[1] - *v109;
    BOOL v13 = (char *)sub_25C13C374(3 * v6);
    BOOL v14 = &v13[v12 & 0xFFFFFFFFFFFFFFF8];
    unint64_t v16 = &v13[8 * v15];
    unint64_t v17 = *v11;
    uint8x8_t v18 = v11[1];
    unint64_t v19 = v14;
    if (v18 != *v11)
    {
      unint64_t v19 = v14;
      do
      {
        uint64_t v20 = *((void *)v18 - 1);
        v18 -= 8;
        *((void *)v19 - 1) = v20;
        v19 -= 8;
      }
      while (v18 != v17);
    }
    *uint64_t v11 = v19;
    v11[1] = v14;
    v11[2] = v16;
    if (v17) {
      operator delete(v17);
    }
  }
  uint64_t v106 = (const std::string::value_type *)&unk_25C16E0C1;
  std::string::size_type v107 = 3;
  v105[0] = a1;
  v105[1] = &v108;
  v105[2] = &v110;
  v105[3] = &v109;
  v105[4] = &v106;
  uint64_t v21 = a1[3];
  if (!*((unsigned char *)a1 + 40) && *(unsigned char *)(v21 + 72))
  {
    sub_25C14A57C((uint64_t)v105);
    uint64_t v21 = a1[3];
  }
  BOOL v22 = *(unsigned char *)(v21 + 73) != 0;
  do
  {
    sub_25C14A398((size_t)&v102, a1, a2, v6);
    size_t v23 = v102;
    uint64_t v24 = v103;
    if (v22)
    {
      if (!v103)
      {
LABEL_26:
        BOOL v25 = 1;
        goto LABEL_71;
      }
      while (*v23 == 32)
      {
        ++v23;
        if (!--v24) {
          goto LABEL_26;
        }
      }
    }
    else if (!v103)
    {
      BOOL v25 = 0;
      goto LABEL_71;
    }
    unint64_t v100 = a2;
    unint64_t v101 = v6;
    uint64_t v26 = 0;
    do
    {
      int v27 = v23[v26];
      if (*(unsigned char *)(a1[3] + 74) && v27 == 32)
      {
        std::string::append(v110, v106, v107);
        if (v107)
        {
          for (std::string::size_type i = 0; i < v107; ++i)
          {
            int v29 = v109;
            uint64_t v30 = v108;
            uint64_t v32 = v109[1];
            unint64_t v31 = (unint64_t)v109[2];
            if ((unint64_t)v32 >= v31)
            {
              unint64_t v34 = *v109;
              uint64_t v35 = (v32 - *v109) >> 3;
              unint64_t v36 = v35 + 1;
              if ((unint64_t)(v35 + 1) >> 61) {
                goto LABEL_133;
              }
              uint64_t v37 = v31 - (void)v34;
              if (v37 >> 2 > v36) {
                unint64_t v36 = v37 >> 2;
              }
              if ((unint64_t)v37 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v38 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v38 = v36;
              }
              if (v38)
              {
                unint64_t v38 = (unint64_t)sub_25C13C374(v38);
                unint64_t v34 = *v29;
                uint64_t v32 = v29[1];
              }
              else
              {
                uint64_t v39 = 0;
              }
              unint64_t v40 = (char *)(v38 + 8 * v35);
              *(void *)unint64_t v40 = v30;
              uint64_t v33 = v40 + 8;
              while (v32 != v34)
              {
                uint64_t v41 = *((void *)v32 - 1);
                v32 -= 8;
                *((void *)v40 - 1) = v41;
                v40 -= 8;
              }
              *int v29 = v40;
              v29[1] = v33;
              v29[2] = (char *)(v38 + 8 * v39);
              if (v34) {
                operator delete(v34);
              }
            }
            else
            {
              *(void *)uint64_t v32 = v108;
              uint64_t v33 = v32 + 8;
            }
            v29[1] = v33;
          }
        }
      }
      else
      {
        std::string::push_back(v110, v27);
        uint64_t v42 = v109;
        uint64_t v43 = v108;
        int v45 = v109[1];
        unint64_t v44 = (unint64_t)v109[2];
        if ((unint64_t)v45 >= v44)
        {
          int v47 = *v109;
          uint64_t v48 = (v45 - *v109) >> 3;
          unint64_t v49 = v48 + 1;
          if ((unint64_t)(v48 + 1) >> 61) {
            goto LABEL_133;
          }
          uint64_t v50 = v44 - (void)v47;
          if (v50 >> 2 > v49) {
            unint64_t v49 = v50 >> 2;
          }
          if ((unint64_t)v50 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v51 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v51 = v49;
          }
          if (v51)
          {
            unint64_t v51 = (unint64_t)sub_25C13C374(v51);
            int v47 = *v42;
            int v45 = v42[1];
          }
          else
          {
            uint64_t v52 = 0;
          }
          unint64_t v53 = (char *)(v51 + 8 * v48);
          *(void *)unint64_t v53 = v43;
          unint64_t v46 = v53 + 8;
          while (v45 != v47)
          {
            uint64_t v54 = *((void *)v45 - 1);
            v45 -= 8;
            *((void *)v53 - 1) = v54;
            v53 -= 8;
          }
          *uint64_t v42 = v53;
          v42[1] = v46;
          v42[2] = (char *)(v51 + 8 * v52);
          if (v47) {
            operator delete(v47);
          }
        }
        else
        {
          *(void *)int v45 = v108;
          unint64_t v46 = v45 + 8;
        }
        v42[1] = v46;
      }
      ++v26;
    }
    while (v26 != v24);
    BOOL v25 = v23[v24 - 1] == 32;
    a2 = v100;
    unint64_t v6 = v101;
LABEL_71:
    v108 += v104;
    a2 += (int)v104;
    uint64_t v55 = a1[3];
    if (*(unsigned char *)(v55 + 73)) {
      BOOL v22 = v25;
    }
    else {
      BOOL v22 = 0;
    }
    v6 -= (int)v104;
  }
  while (v6);
  if (*(unsigned char *)(v55 + 73))
  {
    if (*(unsigned char *)(v55 + 74)) {
      size_t v56 = v107;
    }
    else {
      size_t v56 = 1;
    }
    if (*(unsigned char *)(v55 + 74)) {
      uint64_t v57 = v106;
    }
    else {
      uint64_t v57 = " ";
    }
    while (1)
    {
      char v58 = v110;
      LODWORD(v59) = HIBYTE(v110->__r_.__value_.__r.__words[2]);
      if (SHIBYTE(v110->__r_.__value_.__r.__words[2]) < 0)
      {
        unint64_t v60 = (std::string *)v110->__r_.__value_.__r.__words[0];
        std::string::size_type size = v110->__r_.__value_.__l.__size_;
        if (!v56) {
          goto LABEL_89;
        }
      }
      else
      {
        unint64_t v60 = v110;
        std::string::size_type size = HIBYTE(v110->__r_.__value_.__r.__words[2]);
        if (!v56) {
          goto LABEL_89;
        }
      }
      BOOL v62 = size >= v56;
      std::string::size_type v63 = size - v56;
      if (!v62 || memcmp((char *)v60 + v63, v57, v56)) {
        break;
      }
LABEL_89:
      if ((v59 & 0x80) != 0) {
        std::string::size_type v59 = v58->__r_.__value_.__l.__size_;
      }
      if (v59 - v56 < 0)
      {
        LODWORD(v102) = 13;
        uint64_t v93 = (void *)sub_25C139528((uint64_t)&v103);
        sub_25C136E68(v93, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiece/src/normalizer.cc", 120);
        sub_25C136E68(&v103, (uint64_t)"(", 1);
        std::ostream::operator<<();
        sub_25C136E68(&v103, (uint64_t)") [", 3);
        sub_25C136E68(&v103, (uint64_t)"(length) >= (0)", 15);
        sub_25C136E68(&v103, (uint64_t)"] ", 2);
        sub_25C1396C0();
      }
      std::string::size_type v64 = (v59 - v56);
      int v108 = *(void *)&(*v109)[8 * v64];
      std::string::resize(v58, v64, 0);
      uint64_t v65 = v109;
      uint64_t v66 = *v109;
      uint64_t v67 = v109[1];
      unint64_t v68 = (v67 - *v109) >> 3;
      if (v64 <= v68)
      {
        if (v64 < v68) {
          v109[1] = &v66[8 * v64];
        }
      }
      else
      {
        std::string::size_type v69 = v64 - v68;
        long long v70 = v109[2];
        if (v64 - v68 <= (v70 - v67) >> 3)
        {
          bzero(v109[1], 8 * v69);
          v65[1] = &v67[8 * v69];
        }
        else
        {
          uint64_t v71 = v70 - v66;
          uint64_t v72 = v71 >> 2;
          if (v71 >> 2 <= v64) {
            uint64_t v72 = v64;
          }
          if ((unint64_t)v71 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v73 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v73 = v72;
          }
          int v74 = (char *)sub_25C13C374(v73);
          uint64_t v76 = v75;
          size_t v77 = *v65;
          int v78 = v65[1];
          uint64_t v79 = &v74[8 * v68];
          bzero(v79, 8 * v69);
          uint64_t v80 = v79;
          while (v78 != v77)
          {
            uint64_t v81 = *((void *)v78 - 1);
            v78 -= 8;
            *((void *)v80 - 1) = v81;
            v80 -= 8;
          }
          *uint64_t v65 = v80;
          v65[1] = &v79[8 * v69];
          v65[2] = &v74[8 * v76];
          if (v77) {
            operator delete(v77);
          }
        }
      }
    }
  }
  if (*((unsigned char *)a1 + 40) && *(unsigned char *)(a1[3] + 72)) {
    sub_25C14A57C((uint64_t)v105);
  }
  std::string v82 = v109;
  uint64_t v83 = v108;
  uint64_t v85 = v109[1];
  unint64_t v84 = (unint64_t)v109[2];
  if ((unint64_t)v85 < v84)
  {
    *(void *)uint64_t v85 = v108;
    long long v86 = v85 + 8;
    goto LABEL_126;
  }
  int64_t v87 = *v109;
  uint64_t v88 = (v85 - *v109) >> 3;
  unint64_t v89 = v88 + 1;
  if ((unint64_t)(v88 + 1) >> 61) {
LABEL_133:
  }
    sub_25C137658();
  uint64_t v90 = v84 - (void)v87;
  if (v90 >> 2 > v89) {
    unint64_t v89 = v90 >> 2;
  }
  BOOL v62 = (unint64_t)v90 >= 0x7FFFFFFFFFFFFFF8;
  unint64_t v91 = 0x1FFFFFFFFFFFFFFFLL;
  if (!v62) {
    unint64_t v91 = v89;
  }
  if (v91)
  {
    unint64_t v91 = (unint64_t)sub_25C13C374(v91);
    int64_t v87 = *v82;
    uint64_t v85 = v82[1];
  }
  else
  {
    uint64_t v92 = 0;
  }
  uint64_t v94 = (char *)(v91 + 8 * v88);
  unint64_t v95 = v91 + 8 * v92;
  *(void *)uint64_t v94 = v83;
  long long v86 = v94 + 8;
  while (v85 != v87)
  {
    uint64_t v96 = *((void *)v85 - 1);
    v85 -= 8;
    *((void *)v94 - 1) = v96;
    v94 -= 8;
  }
  *std::string v82 = v94;
  v82[1] = v86;
  v82[2] = (char *)v95;
  if (v87) {
    operator delete(v87);
  }
LABEL_126:
  v82[1] = v86;
  if (SHIBYTE(v110->__r_.__value_.__r.__words[2]) < 0) {
    std::string::size_type v97 = v110->__r_.__value_.__l.__size_;
  }
  else {
    std::string::size_type v97 = HIBYTE(v110->__r_.__value_.__r.__words[2]);
  }
  if ((v109[1] - *v109) >> 3 != v97 + 1)
  {
    LODWORD(v102) = 13;
    unint64_t v98 = (void *)sub_25C139528((uint64_t)&v103);
    sub_25C136E68(v98, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiece/src/normalizer.cc", 120);
    sub_25C136E68(&v103, (uint64_t)"(", 1);
    std::ostream::operator<<();
    sub_25C136E68(&v103, (uint64_t)") [", 3);
    sub_25C136E68(&v103, (uint64_t)"(norm_to_orig->size()) == (normalized->size() + 1)", 50);
    sub_25C136E68(&v103, (uint64_t)"] ", 2);
    sub_25C1396C0();
  }
  *int v99 = 0;
}

void sub_25C14A378(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  sub_25C139754((uint64_t)va);
  _Unwind_Resume(a1);
}

size_t sub_25C14A398(size_t result, void *a2, char *a3, unint64_t a4)
{
  size_t v4 = result;
  v24[63] = *MEMORY[0x263EF8340];
  if (a4)
  {
    unint64_t v6 = a3;
    int v8 = (uint64_t *)a2[4];
    if (v8 && (LOBYTE(v23) = 0, uint64_t result = sub_25C14A790(*v8, a3, a4, (BOOL *)&v23), (_BYTE)v23))
    {
      unint64_t v9 = (int)result;
      if (a4 < (int)result) {
        unint64_t v9 = a4;
      }
      *(void *)size_t v4 = v6;
      *(void *)(v4 + 8) = v9;
      *(_DWORD *)(v4 + 16) = result;
    }
    else
    {
      uint64_t v10 = a2[1];
      if (!v10) {
        goto LABEL_24;
      }
      uint64_t v11 = 0;
      unint64_t v12 = 0;
      BOOL v13 = *(_DWORD **)(v10 + 16);
      uint64_t v14 = (*v13 >> 10 << ((*v13 >> 6) & 8));
      do
      {
        uint64_t v15 = v6[v11];
        uint64_t v16 = v14 ^ v15;
        unsigned int v17 = v13[v16];
        if ((v17 & 0x800000FF) != v15) {
          break;
        }
        uint64_t v14 = v16 ^ (v17 >> 10 << ((v17 >> 6) & 8));
        if ((v17 & 0x100) != 0)
        {
          if (v12 <= 0x1F)
          {
            uint8x8_t v18 = &v24[2 * v12 - 1];
            *(_DWORD *)uint8x8_t v18 = v13[v14] & 0x7FFFFFFF;
            v18[1] = v11 + 1;
          }
          ++v12;
        }
        ++v11;
      }
      while (a4 != v11);
      if (!v12) {
        goto LABEL_24;
      }
      unint64_t v19 = 0;
      int v20 = 0;
      uint64_t v21 = v24;
      do
      {
        if (!v19 || *v21 > v19)
        {
          int v20 = *((_DWORD *)v21 - 2);
          unint64_t v19 = *v21;
        }
        v21 += 2;
        --v12;
      }
      while (v12);
      if (v19)
      {
        unint64_t v6 = (char *)(a2[2] + v20);
        uint64_t result = strlen(v6);
      }
      else
      {
LABEL_24:
        uint64_t v23 = 0;
        BOOL v22 = sub_25C16CCD8((unsigned __int8 *)v6, (uint64_t)&v6[a4], &v23) != 65533 || v23 == 3;
        if (v22) {
          LODWORD(v19) = v23;
        }
        else {
          LODWORD(v19) = 1;
        }
        if (v22) {
          uint64_t result = (int)v23;
        }
        else {
          uint64_t result = 3;
        }
        if (!v22) {
          unint64_t v6 = (char *)&unk_25C16E0C5;
        }
      }
      *(void *)size_t v4 = v6;
      *(void *)(v4 + 8) = result;
      *(_DWORD *)(v4 + 16) = v19;
    }
  }
  else
  {
    *(void *)uint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)(result + 16) = 0;
  }
  return result;
}

void sub_25C14A57C(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(*(void *)(*(void *)a1 + 24) + 74);
  uint64_t v3 = **(std::string ***)(a1 + 16);
  if (v2)
  {
    std::string::append(v3, **(const std::string::value_type ***)(a1 + 32), *(void *)(*(void *)(a1 + 32) + 8));
    if (*(void *)(*(void *)(a1 + 32) + 8))
    {
      unint64_t v4 = 0;
      do
      {
        uint64_t v5 = **(void **)(a1 + 24);
        uint64_t v6 = **(int **)(a1 + 8);
        int v8 = *(void **)(v5 + 8);
        unint64_t v7 = *(void *)(v5 + 16);
        if ((unint64_t)v8 >= v7)
        {
          uint64_t v10 = *(void **)v5;
          uint64_t v11 = ((uint64_t)v8 - *(void *)v5) >> 3;
          unint64_t v12 = v11 + 1;
          if ((unint64_t)(v11 + 1) >> 61) {
            goto LABEL_39;
          }
          uint64_t v13 = v7 - (void)v10;
          if (v13 >> 2 > v12) {
            unint64_t v12 = v13 >> 2;
          }
          if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v14 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v14 = v12;
          }
          if (v14)
          {
            unint64_t v14 = (unint64_t)sub_25C13C374(v14);
            uint64_t v10 = *(void **)v5;
            int v8 = *(void **)(v5 + 8);
          }
          else
          {
            uint64_t v15 = 0;
          }
          uint64_t v16 = (void *)(v14 + 8 * v11);
          *uint64_t v16 = v6;
          unint64_t v9 = v16 + 1;
          while (v8 != v10)
          {
            uint64_t v17 = *--v8;
            *--uint64_t v16 = v17;
          }
          *(void *)uint64_t v5 = v16;
          *(void *)(v5 + 8) = v9;
          *(void *)(v5 + 16) = v14 + 8 * v15;
          if (v10) {
            operator delete(v10);
          }
        }
        else
        {
          *int v8 = v6;
          unint64_t v9 = v8 + 1;
        }
        *(void *)(v5 + 8) = v9;
        ++v4;
      }
      while (v4 < *(void *)(*(void *)(a1 + 32) + 8));
    }
  }
  else
  {
    std::string::append(v3, " ");
    uint64_t v18 = **(void **)(a1 + 24);
    uint64_t v19 = **(int **)(a1 + 8);
    uint64_t v21 = *(void **)(v18 + 8);
    unint64_t v20 = *(void *)(v18 + 16);
    if ((unint64_t)v21 >= v20)
    {
      uint64_t v23 = *(void **)v18;
      uint64_t v24 = ((uint64_t)v21 - *(void *)v18) >> 3;
      unint64_t v25 = v24 + 1;
      if ((unint64_t)(v24 + 1) >> 61) {
LABEL_39:
      }
        sub_25C137658();
      uint64_t v26 = v20 - (void)v23;
      if (v26 >> 2 > v25) {
        unint64_t v25 = v26 >> 2;
      }
      BOOL v27 = (unint64_t)v26 >= 0x7FFFFFFFFFFFFFF8;
      unint64_t v28 = 0x1FFFFFFFFFFFFFFFLL;
      if (!v27) {
        unint64_t v28 = v25;
      }
      if (v28)
      {
        unint64_t v28 = (unint64_t)sub_25C13C374(v28);
        uint64_t v23 = *(void **)v18;
        uint64_t v21 = *(void **)(v18 + 8);
      }
      else
      {
        uint64_t v29 = 0;
      }
      uint64_t v30 = (void *)(v28 + 8 * v24);
      unint64_t v31 = v28 + 8 * v29;
      *uint64_t v30 = v19;
      BOOL v22 = v30 + 1;
      while (v21 != v23)
      {
        uint64_t v32 = *--v21;
        *--uint64_t v30 = v32;
      }
      *(void *)uint64_t v18 = v30;
      *(void *)(v18 + 8) = v22;
      *(void *)(v18 + 16) = v31;
      if (v23) {
        operator delete(v23);
      }
    }
    else
    {
      *uint64_t v21 = v19;
      BOOL v22 = v21 + 1;
    }
    *(void *)(v18 + 8) = v22;
  }
}

uint64_t sub_25C14A790(uint64_t a1, unsigned char *a2, uint64_t a3, BOOL *a4)
{
  v23[127] = *MEMORY[0x263EF8340];
  if (!a1)
  {
    if (a4) {
      *a4 = 0;
    }
    goto LABEL_33;
  }
  unint64_t v4 = *(_DWORD **)(a1 + 16);
  uint64_t v5 = (*v4 >> 10 << ((*v4 >> 6) & 8));
  if (a3)
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    do
    {
      uint64_t v8 = a2[v6];
      uint64_t v9 = v5 ^ v8;
      unsigned int v10 = v4[v9];
      if ((v10 & 0x800000FF) != v8) {
        break;
      }
      uint64_t v5 = v9 ^ (v10 >> 10 << ((v10 >> 6) & 8));
      if ((v10 & 0x100) != 0)
      {
        if (v7 <= 0x3F)
        {
          uint64_t v11 = &v22[16 * v7];
          *(_DWORD *)uint64_t v11 = v4[v5] & 0x7FFFFFFF;
          *((void *)v11 + 1) = v6 + 1;
        }
        ++v7;
      }
      ++v6;
    }
    while (a3 != v6);
  }
  else
  {
    unsigned int v12 = *a2;
    if (*a2)
    {
      unint64_t v7 = 0;
      uint64_t v13 = 1;
      do
      {
        uint64_t v14 = v5 ^ v12;
        unsigned int v15 = v4[v14];
        if ((v15 & 0x800000FF) != v12) {
          break;
        }
        uint64_t v5 = v14 ^ (v15 >> 10 << ((v15 >> 6) & 8));
        if ((v15 & 0x100) != 0)
        {
          if (v7 <= 0x3F)
          {
            uint64_t v16 = &v22[16 * v7];
            *(_DWORD *)uint64_t v16 = v4[v5] & 0x7FFFFFFF;
            *((void *)v16 + 1) = v13;
          }
          ++v7;
        }
        unsigned int v12 = a2[v13++];
      }
      while (v12);
    }
    else
    {
      LODWORD(v7) = 0;
    }
  }
  if (a4) {
    *a4 = (int)v7 > 0;
  }
  if (!v7)
  {
LABEL_33:
    int v21 = asc_25C171EB8[(unint64_t)*a2 >> 4];
    if (v21 >= (int)a3) {
      return a3;
    }
    else {
      return v21;
    }
  }
  if ((int)v7 < 1) {
    return 0;
  }
  LODWORD(result) = 0;
  unint64_t v7 = v7;
  uint64_t v18 = (int *)v23;
  do
  {
    int v20 = *v18;
    v18 += 4;
    unsigned int v19 = v20;
    if ((int)result <= v20) {
      uint64_t result = v19;
    }
    else {
      uint64_t result = result;
    }
    --v7;
  }
  while (v7);
  return result;
}

void *sub_25C14A95C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_25C13D9C8(a2, (void *)(a1 + 48));
}

uint64_t sub_25C14A968(uint64_t result, uint64_t a2)
{
  *(void *)(result + 32) = a2;
  return result;
}

void sub_25C14A970(void *a1)
{
  sub_25C14A9A8(a1);

  JUMPOUT(0x26117F4A0);
}

void *sub_25C14A9A8(void *a1)
{
  *a1 = &unk_270989480;
  uint64_t v2 = a1[6];
  a1[6] = 0;
  if (v2) {
    sub_25C13D850(v2);
  }
  uint64_t v3 = a1[1];
  a1[1] = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  return a1;
}

void sub_25C14AA2C(uint64_t a1)
{
  unint64_t v1 = *(void *)(*(void *)(a1 + 24) + 56) & 0xFFFFFFFFFFFFFFFELL;
  if (*(char *)(v1 + 23) < 0)
  {
    uint64_t v3 = *(unsigned int **)v1;
    unint64_t v2 = *(void *)(v1 + 8);
    if (!v2) {
      return;
    }
  }
  else
  {
    unint64_t v2 = *(unsigned __int8 *)(v1 + 23);
    uint64_t v3 = (unsigned int *)(*(void *)(*(void *)(a1 + 24) + 56) & 0xFFFFFFFFFFFFFFFELL);
    if (!*(unsigned char *)(v1 + 23)) {
      return;
    }
  }
  if (v2 < 5 || v2 <= *v3) {
    sub_25C13D8A4();
  }
  uint64_t v6 = 0;
  unint64_t v4 = (void *)(a1 + 48);
  sub_25C13DA7C((uint64_t *)(a1 + 48), &v6);
  uint64_t v5 = v6;
  uint64_t v6 = 0;
  if (v5) {
    sub_25C13D850(v5);
  }
  if (!*v4) {
    operator new();
  }
}

void sub_25C14ABA0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    sub_25C13D850(a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_25C14ABBC(void **a1, unint64_t a2)
{
  if (a2 > ((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3)
  {
    if (a2 >> 61) {
      sub_25C137658();
    }
    int64_t v3 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    unint64_t v4 = (char *)sub_25C13C374(a2);
    uint64_t v5 = &v4[v3 & 0xFFFFFFFFFFFFFFF8];
    unint64_t v7 = &v4[8 * v6];
    uint64_t v9 = (char *)*a1;
    uint64_t v8 = (char *)a1[1];
    unsigned int v10 = v5;
    if (v8 != *a1)
    {
      do
      {
        uint64_t v11 = *((void *)v8 - 1);
        v8 -= 8;
        *((void *)v10 - 1) = v11;
        v10 -= 8;
      }
      while (v8 != v9);
      uint64_t v8 = (char *)*a1;
    }
    *a1 = v10;
    a1[1] = v5;
    a1[2] = v7;
    if (v8)
    {
      operator delete(v8);
    }
  }
}

_OWORD *sub_25C14AC64(uint64_t a1)
{
  unint64_t v2 = *(_OWORD **)(a1 + 16);
  if (v2)
  {
    if (v2 == (_OWORD *)(a1 + 40))
    {
      _OWORD *v2 = *(_OWORD *)*(void *)(a1 + 8);
      if (*(int *)(a1 + 84) < 1)
      {
LABEL_14:
        if (*(void *)(a1 + 72) == 2) {
          *(void *)(a1 + 72) = *(void *)(a1 + 8) - (void)v2;
        }
        uint64_t v3 = a1 + 56;
        *(void *)(a1 + 8) = a1 + 56;
        *(void *)(a1 + 16) = 0;
        *(_DWORD *)(a1 + 24) = 0;
      }
      else
      {
        __src = 0;
        while (1)
        {
          if (!(*(unsigned int (**)(void, void **, uint64_t))(**(void **)(a1 + 32) + 16))(*(void *)(a1 + 32), &__src, a1 + 24))
          {
            *(_DWORD *)(a1 + 84) = 0;
            goto LABEL_14;
          }
          size_t v4 = *(unsigned int *)(a1 + 24);
          *(_DWORD *)(a1 + 84) -= v4;
          if ((int)v4 >= 17) {
            break;
          }
          if ((int)v4 >= 1)
          {
            memcpy((void *)(a1 + 56), __src, v4);
            uint64_t v5 = (void *)(a1 + 72);
            unint64_t v6 = *(void *)(a1 + 72);
            uint64_t v3 = (uint64_t)v2 + v4;
            *(void *)(a1 + 8) = (char *)v2 + v4;
            *(void *)(a1 + 16) = v2;
            if (v6 < 2) {
              goto LABEL_19;
            }
            goto LABEL_18;
          }
        }
        uint64_t v5 = (void *)(a1 + 72);
        unint64_t v7 = *(void *)(a1 + 72);
        uint64_t v3 = a1 + 56;
        uint64_t v8 = __src;
        *(_OWORD *)(a1 + 56) = *(_OWORD *)__src;
        *(void *)(a1 + 8) = a1 + 56;
        *(void *)(a1 + 16) = v8;
        if (v7 <= 1) {
          goto LABEL_19;
        }
LABEL_18:
        *uint64_t v5 = 1;
      }
    }
    else
    {
      uint64_t v3 = (uint64_t)v2 + *(int *)(a1 + 24) - 16;
      *(void *)(a1 + 8) = v3;
      *(void *)(a1 + 16) = a1 + 40;
      if (*(void *)(a1 + 72) == 1) {
        *(void *)(a1 + 72) = 2;
      }
    }
LABEL_19:
    int v9 = *(_DWORD *)(a1 + 28) + v2 - v3;
    *(_DWORD *)(a1 + 28) = v9;
    *(void *)a1 = v3 + (v9 & (v9 >> 31));
  }
  else
  {
    *(void *)a1 = *(void *)(a1 + 8);
    *(_DWORD *)(a1 + 80) = 1;
  }
  return v2;
}

char *sub_25C14ADFC(uint64_t a1, int a2, int a3)
{
  int v3 = *(_DWORD *)(a1 + 28);
  if (v3 < a2) {
    return 0;
  }
  int v5 = a2;
  unint64_t v7 = (_OWORD *)(a1 + 40);
  uint64_t v8 = a1 + 24;
  int v9 = (char *)(a1 + 56);
  unsigned int v10 = *(_OWORD **)(a1 + 16);
  while (v10)
  {
    if (v10 == v7)
    {
      *unint64_t v7 = *(_OWORD *)*(void *)(a1 + 8);
      if (*(int *)(a1 + 84) < 1)
      {
LABEL_44:
        if (*(void *)(a1 + 72) == 2) {
          *(void *)(a1 + 72) = *(void *)(a1 + 8) - (void)v7;
        }
        unsigned int v12 = 0;
        *(void *)(a1 + 8) = v9;
        *(void *)(a1 + 16) = 0;
        uint64_t v11 = (uint64_t)v9;
        *(_DWORD *)(a1 + 24) = 0;
      }
      else
      {
        if ((a3 & 0x80000000) == 0 && v5 <= 15)
        {
          uint64_t v13 = (char *)v7 + v5;
          int v14 = a3;
          unsigned int v15 = v13;
          while (2)
          {
            int v16 = *v15++;
            int v17 = v16;
            if (v16 < 0)
            {
              int v17 = v17 + (*v15 << 7) - 128;
              if (*v15 < 0)
              {
                char v18 = 14;
                uint64_t v19 = 2;
                while (1)
                {
                  v17 += (v13[v19] - 1) << v18;
                  if ((v13[v19] & 0x80000000) == 0) {
                    break;
                  }
                  ++v19;
                  v18 += 7;
                  if (v19 == 5) {
                    goto LABEL_37;
                  }
                }
                unsigned int v15 = &v13[v19 + 1];
              }
              else
              {
                unsigned int v15 = v13 + 2;
              }
            }
            if (v15 <= v9)
            {
              if (!v17) {
                goto LABEL_44;
              }
              switch(v17 & 7)
              {
                case 0:
                  __src = 0;
                  unsigned int v15 = (char *)sub_25C14B130(v15, &__src);
                  if (!v15) {
                    break;
                  }
                  goto LABEL_36;
                case 1:
                  v15 += 8;
                  goto LABEL_36;
                case 2:
                  int v20 = *v15;
                  if (*v15 < 0)
                  {
                    uint64_t v21 = sub_25C14B1B0((uint64_t)v15, v20);
                    if (!v21) {
                      break;
                    }
                  }
                  else
                  {
                    uint64_t v21 = (uint64_t)(v15 + 1);
                  }
                  if ((uint64_t)&v9[-v21] < v20) {
                    break;
                  }
                  unsigned int v15 = (char *)(v21 + v20);
LABEL_36:
                  uint64_t v13 = v15;
                  if (v15 >= v9) {
                    break;
                  }
                  continue;
                case 3:
                  ++v14;
                  goto LABEL_36;
                case 4:
                  BOOL v22 = __OFSUB__(v14--, 1);
                  if (v14 < 0 != v22) {
                    goto LABEL_44;
                  }
                  goto LABEL_36;
                case 5:
                  v15 += 4;
                  goto LABEL_36;
                default:
                  goto LABEL_37;
              }
            }
            break;
          }
        }
LABEL_37:
        __src = 0;
        while (1)
        {
          if (!(*(unsigned int (**)(void, void **, uint64_t))(**(void **)(a1 + 32) + 16))(*(void *)(a1 + 32), &__src, v8))
          {
            *(_DWORD *)(a1 + 84) = 0;
            goto LABEL_44;
          }
          size_t v23 = *(unsigned int *)(a1 + 24);
          *(_DWORD *)(a1 + 84) -= v23;
          if ((int)v23 >= 17) {
            break;
          }
          if ((int)v23 >= 1)
          {
            memcpy(v9, __src, v23);
            uint64_t v11 = (uint64_t)v7 + v23;
            *(void *)(a1 + 8) = (char *)v7 + v23;
            *(void *)(a1 + 16) = v7;
            unsigned int v12 = v7;
            if (*(void *)(a1 + 72) < 2uLL) {
              goto LABEL_49;
            }
            goto LABEL_48;
          }
        }
        unsigned int v12 = __src;
        *(_OWORD *)int v9 = *(_OWORD *)__src;
        *(void *)(a1 + 8) = v9;
        *(void *)(a1 + 16) = v12;
        uint64_t v11 = (uint64_t)v9;
        if (*(void *)(a1 + 72) <= 1uLL) {
          goto LABEL_49;
        }
LABEL_48:
        *(void *)(a1 + 72) = 1;
      }
LABEL_49:
      int v3 = *(_DWORD *)(a1 + 28);
    }
    else
    {
      uint64_t v11 = (uint64_t)v10 + *(int *)(a1 + 24) - 16;
      *(void *)(a1 + 8) = v11;
      *(void *)(a1 + 16) = v7;
      if (*(void *)(a1 + 72) == 1) {
        *(void *)(a1 + 72) = 2;
      }
      unsigned int v12 = v7;
    }
    v3 += v10 - v11;
    *(_DWORD *)(a1 + 28) = v3;
    uint64_t result = (char *)v10 + v5;
    unsigned int v10 = v12;
    int v5 = result - v11;
    if ((int)result - (int)v11 < 0)
    {
      *(void *)a1 = v11 + (v3 & (v3 >> 31));
      return result;
    }
  }
  if (v5) {
    return 0;
  }
  uint64_t result = *(char **)(a1 + 8);
  *(void *)a1 = result;
  *(_DWORD *)(a1 + 80) = 1;
  return result;
}

uint64_t sub_25C14B130(char *a1, void *a2)
{
  uint64_t v2 = *a1;
  if (*a1 < 0)
  {
    int v4 = a1[1];
    uint64_t v5 = (v2 + (v4 << 7) - 128);
    if ((v4 & 0x80) != 0)
    {
      uint64_t v6 = 2;
      char v7 = 14;
      while (1)
      {
        v5 += (a1[v6] - 1) << v7;
        if ((a1[v6] & 0x80000000) == 0) {
          break;
        }
        ++v6;
        v7 += 7;
        if (v6 == 10)
        {
          uint64_t result = 0;
          uint64_t v5 = 0;
          goto LABEL_10;
        }
      }
      uint64_t result = (uint64_t)&a1[v6 + 1];
LABEL_10:
      *a2 = v5;
    }
    else
    {
      *a2 = v5;
      return (uint64_t)(a1 + 2);
    }
  }
  else
  {
    *a2 = v2;
    return (uint64_t)(a1 + 1);
  }
  return result;
}

uint64_t sub_25C14B1B0(uint64_t a1, int a2)
{
  char v2 = 7;
  for (uint64_t i = 1; i != 4; ++i)
  {
    a2 += (*(unsigned __int8 *)(a1 + i) - 1) << v2;
    if ((*(char *)(a1 + i) & 0x80000000) == 0) {
      return a1 + i + 1;
    }
    v2 += 7;
  }
  unsigned int v4 = *(unsigned __int8 *)(a1 + 4);
  uint64_t v5 = a1 + 5;
  if (a2 + (v4 << 28) - 0x10000000 > 0x7FFFFFEF) {
    uint64_t v5 = 0;
  }
  if (v4 <= 7) {
    return v5;
  }
  else {
    return 0;
  }
}

void sub_25C14B228(int a1, unint64_t a2, std::string *this)
{
  unint64_t v5 = (8 * a1);
  if (v5 < 0x80)
  {
    LOBYTE(v6) = 8 * a1;
  }
  else
  {
    do
    {
      std::string::push_back(this, v5 | 0x80);
      unint64_t v6 = v5 >> 7;
      unint64_t v7 = v5 >> 14;
      v5 >>= 7;
    }
    while (v7);
  }
  std::string::push_back(this, v6);
  if (a2 < 0x80)
  {
    LOBYTE(v8) = a2;
  }
  else
  {
    do
    {
      std::string::push_back(this, a2 | 0x80);
      unint64_t v8 = a2 >> 7;
      unint64_t v9 = a2 >> 14;
      a2 >>= 7;
    }
    while (v9);
  }

  std::string::push_back(this, v8);
}

uint64_t sub_25C14B2D4(uint64_t a1, int a2)
{
  char v2 = 14;
  uint64_t v3 = 2;
  while (1)
  {
    a2 += (*(unsigned __int8 *)(a1 + v3) - 1) << v2;
    if ((*(char *)(a1 + v3) & 0x80000000) == 0) {
      break;
    }
    ++v3;
    v2 += 7;
    if (v3 == 5)
    {
      while (*(char *)(a1 + v3) < 0)
      {
        uint64_t v4 = 0;
        if (++v3 == 10) {
          return v4;
        }
      }
      return a1 + v3 + 1;
    }
  }
  return a1 + v3 + 1;
}

const std::string::value_type *sub_25C14B33C(std::string *this, char *a2, uint64_t a3)
{
  int v5 = *a2;
  if (*a2 < 0)
  {
    uint64_t result = (const std::string::value_type *)sub_25C14B1B0((uint64_t)a2, *a2);
    if (!result) {
      return result;
    }
    unint64_t v6 = (std::string::value_type *)result;
    int v5 = v8;
  }
  else
  {
    unint64_t v6 = a2 + 1;
  }

  return sub_25C142BF0(a3, v6, v5, this);
}

char *sub_25C14B3B4(char *a1, unint64_t a2, unsigned int *a3)
{
  for (uint64_t i = a1; (unint64_t)i < a2; *a3 = v8)
  {
    uint64_t v10 = 0;
    uint64_t i = (char *)sub_25C14B130(i, &v10);
    if (!i) {
      break;
    }
    int v6 = v10;
    uint64_t v7 = *a3;
    if (v7 == a3[1])
    {
      unsigned int v8 = v7 + 1;
      sub_25C14BEC0(a3, v7 + 1);
      *(_DWORD *)(*((void *)a3 + 1) + 4 * v7) = v6;
    }
    else
    {
      *(_DWORD *)(*((void *)a3 + 1) + 4 * v7) = v10;
      unsigned int v8 = v7 + 1;
    }
  }
  return i;
}

char *sub_25C14B464(char *a1, unint64_t a2, unsigned int *a3)
{
  for (uint64_t i = a1; (unint64_t)i < a2; *a3 = v8)
  {
    uint64_t v10 = 0;
    uint64_t i = (char *)sub_25C14B130(i, &v10);
    if (!i) {
      break;
    }
    uint64_t v6 = v10;
    uint64_t v7 = *a3;
    if (v7 == a3[1])
    {
      unsigned int v8 = v7 + 1;
      sub_25C14C038(a3, v7 + 1);
      *(void *)(*((void *)a3 + 1) + 8 * v7) = v6;
    }
    else
    {
      *(void *)(*((void *)a3 + 1) + 8 * v7) = v10;
      unsigned int v8 = v7 + 1;
    }
  }
  return i;
}

char *sub_25C14B514(char *a1, unint64_t a2, unsigned int *a3)
{
  for (uint64_t i = a1; (unint64_t)i < a2; *a3 = v8)
  {
    uint64_t v10 = 0;
    uint64_t i = (char *)sub_25C14B130(i, &v10);
    if (!i) {
      break;
    }
    int v6 = -(v10 & 1) ^ (v10 >> 1);
    uint64_t v7 = *a3;
    if (v7 == a3[1])
    {
      unsigned int v8 = v7 + 1;
      sub_25C14BEC0(a3, v7 + 1);
      *(_DWORD *)(*((void *)a3 + 1) + 4 * v7) = v6;
    }
    else
    {
      *(_DWORD *)(*((void *)a3 + 1) + 4 * v7) = v6;
      unsigned int v8 = v7 + 1;
    }
  }
  return i;
}

char *sub_25C14B5C8(char *a1, unint64_t a2, unsigned int *a3)
{
  for (uint64_t i = a1; (unint64_t)i < a2; *a3 = v8)
  {
    unint64_t v10 = 0;
    uint64_t i = (char *)sub_25C14B130(i, &v10);
    if (!i) {
      break;
    }
    unint64_t v6 = -(uint64_t)(v10 & 1) ^ (v10 >> 1);
    uint64_t v7 = *a3;
    if (v7 == a3[1])
    {
      unsigned int v8 = v7 + 1;
      sub_25C14C038(a3, v7 + 1);
      *(void *)(*((void *)a3 + 1) + 8 * v7) = v6;
    }
    else
    {
      *(void *)(*((void *)a3 + 1) + 8 * v7) = v6;
      unsigned int v8 = v7 + 1;
    }
  }
  return i;
}

char *sub_25C14B67C(char *a1, unint64_t a2, unsigned int *a3)
{
  for (uint64_t i = a1; (unint64_t)i < a2; *a3 = v8)
  {
    uint64_t v10 = 0;
    uint64_t i = (char *)sub_25C14B130(i, &v10);
    if (!i) {
      break;
    }
    BOOL v6 = v10 != 0;
    uint64_t v7 = *a3;
    if (v7 == a3[1])
    {
      unsigned int v8 = v7 + 1;
      sub_25C14BD68(a3, v7 + 1);
      *(unsigned char *)(*((void *)a3 + 1) + v7) = v6;
    }
    else
    {
      *(unsigned char *)(*((void *)a3 + 1) + v7) = v6;
      unsigned int v8 = v7 + 1;
    }
  }
  return i;
}

uint64_t sub_25C14B72C(unint64_t a1, std::string **a2, char *a3, int32x2_t *a4)
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  unint64_t v4 = a1 >> 3;
  if ((a1 >> 3))
  {
    int v5 = a1;
    uint64_t v7 = a3;
    switch(a1 & 7)
    {
      case 0uLL:
        *(void *)__s = 0;
        uint64_t v7 = (const std::string::value_type *)sub_25C14B130(a3, __s);
        if (!v7) {
          return (uint64_t)v7;
        }
        unint64_t v9 = *a2;
        if (!*a2) {
          return (uint64_t)v7;
        }
        unint64_t v10 = *(void *)__s;
        unint64_t v11 = v5 & 0xFFFFFFF8;
        if (v4 < 0x10)
        {
          LOBYTE(v12) = v11;
        }
        else
        {
          do
          {
            std::string::push_back(v9, v11 | 0x80);
            unint64_t v12 = v11 >> 7;
            unint64_t v13 = v11 >> 14;
            v11 >>= 7;
          }
          while (v13);
        }
        std::string::push_back(v9, v12);
        uint64_t v54 = *a2;
        if (v10 < 0x80)
        {
          LOBYTE(v55) = v10;
        }
        else
        {
          do
          {
            std::string::push_back(v54, v10 | 0x80);
            unint64_t v55 = v10 >> 7;
            unint64_t v58 = v10 >> 14;
            v10 >>= 7;
          }
          while (v58);
        }
        goto LABEL_86;
      case 1uLL:
        uint64_t v7 = a3 + 8;
        uint64_t v14 = *(void *)a3;
        unsigned int v15 = *a2;
        if (*a2)
        {
          unint64_t v16 = (8 * v4) | 1u;
          if (v16 < 0x80)
          {
            LOBYTE(v17) = (8 * v4) | 1;
          }
          else
          {
            do
            {
              std::string::push_back(v15, v16 | 0x80);
              unint64_t v17 = v16 >> 7;
              unint64_t v18 = v16 >> 14;
              v16 >>= 7;
            }
            while (v18);
          }
          std::string::push_back(v15, v17);
          *(void *)__s = v14;
          std::string::append(*a2, __s, 8uLL);
        }
        return (uint64_t)v7;
      case 2uLL:
        int v19 = *a3;
        if (*a3 < 0)
        {
          uint64_t v7 = (const std::string::value_type *)sub_25C14B1B0((uint64_t)a3, *a3);
          if (!v7) {
            return (uint64_t)v7;
          }
          int v19 = v30;
        }
        else
        {
          uint64_t v7 = a3 + 1;
        }
        unint64_t v31 = *a2;
        if (*a2)
        {
          unint64_t v32 = (8 * v4) | 2u;
          if (v32 < 0x80)
          {
            LOBYTE(v33) = v32;
          }
          else
          {
            do
            {
              std::string::push_back(v31, v32 | 0x80);
              unint64_t v33 = v32 >> 7;
              unint64_t v34 = v32 >> 14;
              v32 >>= 7;
            }
            while (v34);
          }
          std::string::push_back(v31, v33);
          uint64_t v43 = v19;
          unint64_t v44 = *a2;
          LOBYTE(v45) = v19;
          if (v19 >= 0x80)
          {
            unint64_t v46 = v19;
            do
            {
              std::string::push_back(v44, v46 | 0x80);
              unint64_t v45 = v46 >> 7;
              unint64_t v47 = v46 >> 14;
              v46 >>= 7;
            }
            while (v47);
          }
          std::string::push_back(v44, v45);
          uint64_t v48 = *a2;
          int32x2_t v49 = a4[1];
          if (*(void *)&v49 - (void)v7 + 16 < v19)
          {
            if (*(void *)&v49 - (void)v7 + a4[3].i32[1] >= v19)
            {
              if (SHIBYTE(v48->__r_.__value_.__r.__words[2]) < 0) {
                std::string::size_type size = v48->__r_.__value_.__l.__size_;
              }
              else {
                std::string::size_type size = HIBYTE(v48->__r_.__value_.__r.__words[2]);
              }
              if (v19 >= 50000000) {
                int v59 = 50000000;
              }
              else {
                int v59 = v19;
              }
              std::string::reserve(v48, size + v59);
              int32x2_t v49 = a4[1];
            }
            int v60 = v49.i32[0] - v7 + 16;
            while (a4[2])
            {
              std::string::append(v48, v7, v60);
              if (a4[3].i32[1] < 17) {
                break;
              }
              uint64_t v61 = sub_25C14AC64((uint64_t)a4);
              if (!v61) {
                break;
              }
              v19 -= v60;
              uint64_t v7 = (const std::string::value_type *)(v61 + 1);
              int v60 = a4[1].i32[0] - v61;
              if (v19 <= v60)
              {
                std::string::append(v48, v7, v19);
                v7 += v19;
                return (uint64_t)v7;
              }
            }
            return 0;
          }
          std::string::append(v48, v7, v19);
LABEL_89:
          if (v7) {
            v7 += v43;
          }
          return (uint64_t)v7;
        }
        uint64_t v35 = *(void *)&a4[1] - (void)v7 + 16;
        if (v35 >= v19)
        {
          uint64_t v43 = v19;
          goto LABEL_89;
        }
        while (a4[2])
        {
          if (a4[3].i32[1] < 17) {
            break;
          }
          unint64_t v36 = sub_25C14AC64((uint64_t)a4);
          if (!v36) {
            break;
          }
          v19 -= v35;
          LODWORD(v35) = a4[1].i32[0] - v36;
          if (v19 <= (int)v35) {
            return (uint64_t)v36 + v19 + 16;
          }
        }
        break;
      case 3uLL:
        int v20 = *a2;
        int v21 = 8 * v4;
        if (*a2)
        {
          unint64_t v22 = v21 | 3u;
          if (v22 < 0x80)
          {
            LOBYTE(v23) = v21 | 3;
          }
          else
          {
            do
            {
              std::string::push_back(v20, v22 | 0x80);
              unint64_t v23 = v22 >> 7;
              unint64_t v24 = v22 >> 14;
              v22 >>= 7;
            }
            while (v24);
          }
          std::string::push_back(v20, v23);
        }
        int v37 = a4[11].i32[0];
        BOOL v38 = __OFSUB__(v37--, 1);
        a4[11].i32[0] = v37;
        if (v37 < 0 != v38) {
          return 0;
        }
        ++a4[11].i32[1];
        *(void *)__s = v7;
        while (2)
        {
          if (sub_25C142E98((uint64_t)a4, (char **)__s, a4[11].i32[1]))
          {
            uint64_t v7 = *(const std::string::value_type **)__s;
          }
          else
          {
            uint64_t v7 = (const std::string::value_type *)(*(void *)__s + 1);
            unsigned int v39 = **(unsigned char **)__s;
            if ((char)**(unsigned char **)__s < 0)
            {
              unsigned int v39 = v39 + (*(unsigned __int8 *)v7 << 7) - 128;
              if (*v7 < 0)
              {
                char v40 = 14;
                uint64_t v41 = 2;
                while (1)
                {
                  v39 += (*(unsigned __int8 *)(*(void *)__s + v41) - 1) << v40;
                  if ((*(char *)(*(void *)__s + v41) & 0x80000000) == 0) {
                    break;
                  }
                  ++v41;
                  v40 += 7;
                  if (v41 == 5) {
                    goto LABEL_56;
                  }
                }
                uint64_t v7 = (const std::string::value_type *)(*(void *)__s + v41 + 1);
              }
              else
              {
                uint64_t v7 = (const std::string::value_type *)(*(void *)__s + 2);
              }
            }
            if (v39) {
              BOOL v42 = (v39 & 7) == 4;
            }
            else {
              BOOL v42 = 1;
            }
            if (!v42)
            {
              *(void *)__s = sub_25C14B72C(v39, a2, v7, a4);
              if (!*(void *)__s)
              {
LABEL_56:
                uint64_t v7 = 0;
                break;
              }
              continue;
            }
            a4[10].i32[0] = v39 - 1;
          }
          break;
        }
        a4[11] = vadd_s32(a4[11], (int32x2_t)0xFFFFFFFF00000001);
        __int32 v51 = a4[10].i32[0];
        a4[10].i32[0] = 0;
        if (v51 != (v21 | 3) || v7 == 0) {
          return 0;
        }
        uint64_t v54 = *a2;
        if (v54)
        {
          unint64_t v55 = v21 | 4u;
          if (v55 < 0x80)
          {
LABEL_86:
            LOBYTE(v57) = v55;
          }
          else
          {
            do
            {
              unint64_t v56 = v55;
              std::string::push_back(v54, v55 | 0x80);
              unint64_t v55 = v56 >> 7;
            }
            while (v56 >> 14);
            int v57 = (int)(v56 << 17) >> 24;
          }
          std::string::push_back(v54, v57);
        }
        return (uint64_t)v7;
      case 4uLL:
        *(_DWORD *)__s = 3;
        std::string::size_type v63 = "/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiece/thi"
              "rd_party/protobuf-lite/google/protobuf/parse_context.h";
        int v64 = 758;
        memset(&__p, 0, sizeof(__p));
        std::string::append(&__p, "Can't happen");
        sub_25C13D6C8((unsigned int *)__s);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        return (uint64_t)v7;
      case 5uLL:
        uint64_t v7 = a3 + 4;
        int v25 = *(_DWORD *)a3;
        uint64_t v26 = *a2;
        if (*a2)
        {
          unint64_t v27 = (8 * v4) | 5u;
          if (v27 < 0x80)
          {
            LOBYTE(v28) = (8 * v4) | 5;
          }
          else
          {
            do
            {
              std::string::push_back(v26, v27 | 0x80);
              unint64_t v28 = v27 >> 7;
              unint64_t v29 = v27 >> 14;
              v27 >>= 7;
            }
            while (v29);
          }
          std::string::push_back(v26, v28);
          *(_DWORD *)__s = v25;
          std::string::append(*a2, __s, 4uLL);
        }
        return (uint64_t)v7;
      default:
        return 0;
    }
  }
  return 0;
}

void sub_25C14BD28(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_25C14BD68(unsigned int *a1, int a2)
{
  int v2 = a1[1];
  if (v2 >= a2) {
    return;
  }
  if (v2 < 1)
  {
    uint64_t v4 = *((void *)a1 + 1);
    int v5 = 0;
    if (!v2)
    {
      if (a2 < 4) {
        goto LABEL_6;
      }
LABEL_10:
      int v7 = 2 * v2;
      if (v7 <= a2) {
        unsigned int v6 = a2;
      }
      else {
        unsigned int v6 = v7;
      }
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v4 = *((void *)a1 + 1);
    int v5 = (void *)(v4 - 8);
  }
  uint64_t v4 = *(void *)(v4 - 8);
  if (a2 >= 4)
  {
    if (v2 > 0x3FFFFFFF)
    {
      unsigned int v6 = 0x7FFFFFFF;
      goto LABEL_13;
    }
    goto LABEL_10;
  }
LABEL_6:
  unsigned int v6 = 4;
LABEL_13:
  if (v4)
  {
    unint64_t v8 = (v6 + 15) & 0x1FFFFFFF8;
    if (*(unsigned char *)(v4 + 24)) {
      (*(void (**)(void, void, unint64_t))(**(void **)(*(void *)(v4 + 32) + 32) + 40))(*(void *)(*(void *)(v4 + 32) + 32), MEMORY[0x263F8C238], v8);
    }
    unint64_t v9 = sub_25C1363A0((void *)v4, v8);
  }
  else
  {
    unint64_t v9 = operator new(v6 + 8);
  }
  *unint64_t v9 = v4;
  unint64_t v10 = v9 + 1;
  a1[1] = v6;
  *((void *)a1 + 1) = v10;
  size_t v11 = *a1;
  if ((int)v11 >= 1) {
    memcpy(v10, v5 + 1, v11);
  }
  if (v5 && !*v5)
  {
    operator delete(v5);
  }
}

void sub_25C14BEC0(unsigned int *a1, int a2)
{
  int v2 = a1[1];
  if (v2 >= a2) {
    return;
  }
  if (v2 < 1)
  {
    uint64_t v4 = *((void *)a1 + 1);
    int v5 = 0;
    if (!v2)
    {
      if (a2 < 4) {
        goto LABEL_6;
      }
LABEL_10:
      int v7 = 2 * v2;
      if (v7 <= a2) {
        unsigned int v6 = a2;
      }
      else {
        unsigned int v6 = v7;
      }
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v4 = *((void *)a1 + 1);
    int v5 = (void *)(v4 - 8);
  }
  uint64_t v4 = *(void *)(v4 - 8);
  if (a2 >= 4)
  {
    if (v2 > 0x3FFFFFFF)
    {
      unsigned int v6 = 0x7FFFFFFF;
      goto LABEL_13;
    }
    goto LABEL_10;
  }
LABEL_6:
  unsigned int v6 = 4;
LABEL_13:
  uint64_t v8 = 4 * v6;
  if (v4)
  {
    unint64_t v9 = (v8 + 15) & 0x7FFFFFFF8;
    if (*(unsigned char *)(v4 + 24)) {
      (*(void (**)(void, void, unint64_t))(**(void **)(*(void *)(v4 + 32) + 32) + 40))(*(void *)(*(void *)(v4 + 32) + 32), MEMORY[0x263F8C238], v9);
    }
    unint64_t v10 = sub_25C1363A0((void *)v4, v9);
  }
  else
  {
    unint64_t v10 = operator new(v8 + 8);
  }
  void *v10 = v4;
  size_t v11 = v10 + 1;
  a1[1] = v6;
  *((void *)a1 + 1) = v11;
  uint64_t v12 = *a1;
  if ((int)v12 >= 1) {
    memcpy(v11, v5 + 1, 4 * v12);
  }
  if (v5 && !*v5)
  {
    operator delete(v5);
  }
}

void sub_25C14C038(unsigned int *a1, int a2)
{
  int v2 = a1[1];
  if (v2 >= a2) {
    return;
  }
  if (v2 < 1)
  {
    uint64_t v4 = *((void *)a1 + 1);
    int v5 = 0;
    if (!v2)
    {
      if (a2 < 4) {
        goto LABEL_6;
      }
LABEL_10:
      int v7 = 2 * v2;
      if (v7 <= a2) {
        unsigned int v6 = a2;
      }
      else {
        unsigned int v6 = v7;
      }
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v4 = *((void *)a1 + 1);
    int v5 = (void *)(v4 - 8);
  }
  uint64_t v4 = *(void *)(v4 - 8);
  if (a2 >= 4)
  {
    if (v2 > 0x3FFFFFFF)
    {
      unsigned int v6 = 0x7FFFFFFF;
      goto LABEL_13;
    }
    goto LABEL_10;
  }
LABEL_6:
  unsigned int v6 = 4;
LABEL_13:
  uint64_t v8 = 8 * v6;
  if (v4)
  {
    unint64_t v9 = (v8 + 15) & 0xFFFFFFFF8;
    if (*(unsigned char *)(v4 + 24)) {
      (*(void (**)(void, void, unint64_t))(**(void **)(*(void *)(v4 + 32) + 32) + 40))(*(void *)(*(void *)(v4 + 32) + 32), MEMORY[0x263F8C238], v9);
    }
    unint64_t v10 = sub_25C1363A0((void *)v4, v9);
  }
  else
  {
    unint64_t v10 = operator new(v8 + 8);
  }
  void *v10 = v4;
  size_t v11 = v10 + 1;
  a1[1] = v6;
  *((void *)a1 + 1) = v11;
  uint64_t v12 = *a1;
  if ((int)v12 >= 1) {
    memcpy(v11, v5 + 1, 8 * v12);
  }
  if (v5 && !*v5)
  {
    operator delete(v5);
  }
}

uint64_t sub_25C14C1A8(uint64_t *a1, int a2)
{
  int v2 = *((_DWORD *)a1 + 2);
  int v3 = *((_DWORD *)a1 + 3);
  int v4 = v2 + a2;
  int v5 = (unsigned int *)a1[2];
  if (v3 < v2 + a2)
  {
    uint64_t v7 = *a1;
    int v8 = 2 * v3;
    if (2 * v3 <= v4) {
      int v8 = v4;
    }
    if (v8 <= 4) {
      unsigned int v9 = 4;
    }
    else {
      unsigned int v9 = v8;
    }
    uint64_t v10 = 8 * v9;
    if (v7)
    {
      unint64_t v11 = (v10 + 15) & 0x7FFFFFFF8;
      if (*(unsigned char *)(v7 + 24)) {
        (*(void (**)(void, void, unint64_t))(**(void **)(*(void *)(v7 + 32) + 32) + 40))(*(void *)(*(void *)(v7 + 32) + 32), MEMORY[0x263F8C238], v11);
      }
      uint64_t v12 = (unsigned int *)sub_25C1363A0((void *)v7, v11);
    }
    else
    {
      uint64_t v12 = (unsigned int *)operator new(v10 + 8);
    }
    a1[2] = (uint64_t)v12;
    *((_DWORD *)a1 + 3) = v9;
    if (v5 && (uint64_t v13 = *v5, (int)v13 >= 1))
    {
      memcpy(v12 + 2, v5 + 2, 8 * v13);
      uint64_t v12 = (unsigned int *)a1[2];
      *uint64_t v12 = *v5;
      if (!v7) {
        goto LABEL_17;
      }
    }
    else
    {
      *uint64_t v12 = 0;
      if (!v7)
      {
LABEL_17:
        operator delete(v5);
        uint64_t v12 = (unsigned int *)a1[2];
      }
    }
    int v2 = *((_DWORD *)a1 + 2);
    int v5 = v12;
  }
  return (uint64_t)&v5[2 * v2 + 2];
}

void *sub_25C14C2D4(void *a1)
{
  int v2 = (unsigned int *)a1[2];
  if (v2 && !*a1)
  {
    int v3 = (uint64_t *)(v2 + 2);
    uint64_t v4 = *v2;
    if ((int)v4 >= 1)
    {
      do
      {
        uint64_t v5 = *v3;
        if (*v3)
        {
          if (*(char *)(v5 + 23) < 0) {
            operator delete(*(void **)v5);
          }
          MEMORY[0x26117F4A0](v5, 0x1012C40EC159624);
        }
        ++v3;
        --v4;
      }
      while (v4);
      int v2 = (unsigned int *)a1[2];
    }
    operator delete(v2);
  }
  a1[2] = 0;
  return a1;
}

void sub_25C14C368()
{
  sub_25C14C3BC((uint64_t)&unk_26A596158, 0);

  sub_25C147DA8((uint64_t)sub_25C1474BC, (uint64_t)&unk_26A596158);
}

uint64_t sub_25C14C3BC(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_270989B98;
  *(void *)(a1 + 8) = a2;
  *(void *)(a1 + 16) = a2;
  *(_DWORD *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  if (atomic_load_explicit(dword_26B34E538, memory_order_acquire)) {
    sub_25C1475A0(dword_26B34E538);
  }
  *(void *)(a1 + 48) = &qword_26A5963D0;
  *(void *)(a1 + 56) = &qword_26A5963D0;
  *(void *)(a1 + 64) = 0;
  *(_DWORD *)(a1 + 72) = 0;
  return a1;
}

void sub_25C14C440(_Unwind_Exception *a1)
{
  sub_25C13DB80(v1);
  _Unwind_Resume(a1);
}

char *sub_25C14C454(uint64_t a1, char *a2, void *a3)
{
  uint64_t v4 = a2;
  int v6 = *(_DWORD *)(a1 + 40);
  if ((v6 & 1) == 0)
  {
    if ((v6 & 4) == 0) {
      goto LABEL_3;
    }
LABEL_11:
    if (*a3 <= (unint64_t)v4) {
      uint64_t v4 = (char *)sub_25C13CEE0((uint64_t)a3, (int)v4);
    }
    unsigned int v8 = *(_DWORD *)(a1 + 64);
    *uint64_t v4 = 16;
    if (v8 > 0x7F)
    {
      v4[1] = v8 | 0x80;
      unsigned int v10 = v8 >> 7;
      if (v8 >> 14)
      {
        unsigned int v15 = v4 + 2;
        do
        {
          unint64_t v16 = v15;
          *v15++ = v10 | 0x80;
          unsigned int v17 = v10 >> 7;
          unsigned int v18 = v10 >> 14;
          v10 >>= 7;
        }
        while (v18);
        uint64_t v4 = v16 + 2;
        *unsigned int v15 = v17;
        if ((v6 & 2) != 0) {
          goto LABEL_27;
        }
      }
      else
      {
        v4[2] = v10;
        v4 += 3;
        if ((v6 & 2) != 0) {
          goto LABEL_27;
        }
      }
    }
    else
    {
      v4[1] = v8;
      v4 += 2;
      if ((v6 & 2) != 0) {
        goto LABEL_27;
      }
    }
LABEL_4:
    if ((v6 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_28;
  }
  uint64_t v4 = sub_25C14C714(a3, 1u, (const void **)(*(void *)(a1 + 48) & 0xFFFFFFFFFFFFFFFELL), a2);
  if ((v6 & 4) != 0) {
    goto LABEL_11;
  }
LABEL_3:
  if ((v6 & 2) == 0) {
    goto LABEL_4;
  }
LABEL_27:
  uint64_t v4 = sub_25C14C714(a3, 3u, (const void **)(*(void *)(a1 + 56) & 0xFFFFFFFFFFFFFFFELL), v4);
  if ((v6 & 8) == 0)
  {
LABEL_5:
    if ((v6 & 0x10) == 0) {
      goto LABEL_39;
    }
    goto LABEL_6;
  }
LABEL_28:
  if (*a3 <= (unint64_t)v4) {
    uint64_t v4 = (char *)sub_25C13CEE0((uint64_t)a3, (int)v4);
  }
  unsigned int v19 = *(_DWORD *)(a1 + 68);
  *uint64_t v4 = 32;
  if (v19 > 0x7F)
  {
    v4[1] = v19 | 0x80;
    unsigned int v20 = v19 >> 7;
    if (v19 >> 14)
    {
      int v21 = v4 + 2;
      do
      {
        unint64_t v22 = v21;
        *v21++ = v20 | 0x80;
        unsigned int v23 = v20 >> 7;
        unsigned int v24 = v20 >> 14;
        v20 >>= 7;
      }
      while (v24);
      uint64_t v4 = v22 + 2;
      *int v21 = v23;
      if ((v6 & 0x10) == 0) {
        goto LABEL_39;
      }
    }
    else
    {
      v4[2] = v20;
      v4 += 3;
      if ((v6 & 0x10) == 0) {
        goto LABEL_39;
      }
    }
  }
  else
  {
    v4[1] = v19;
    v4 += 2;
    if ((v6 & 0x10) == 0) {
      goto LABEL_39;
    }
  }
LABEL_6:
  if (*a3 <= (unint64_t)v4) {
    uint64_t v4 = (char *)sub_25C13CEE0((uint64_t)a3, (int)v4);
  }
  unsigned int v7 = *(_DWORD *)(a1 + 72);
  *uint64_t v4 = 40;
  if (v7 > 0x7F)
  {
    v4[1] = v7 | 0x80;
    unsigned int v9 = v7 >> 7;
    if (v7 >> 14)
    {
      unint64_t v11 = v4 + 2;
      do
      {
        uint64_t v12 = v11;
        *v11++ = v9 | 0x80;
        unsigned int v13 = v9 >> 7;
        unsigned int v14 = v9 >> 14;
        v9 >>= 7;
      }
      while (v14);
      uint64_t v4 = v12 + 2;
      *unint64_t v11 = v13;
    }
    else
    {
      v4[2] = v9;
      v4 += 3;
    }
  }
  else
  {
    v4[1] = v7;
    v4 += 2;
  }
LABEL_39:
  int v25 = sub_25C142F0C(a1 + 16, v4, a3);
  uint64_t v26 = v25;
  uint64_t v27 = *(void *)(a1 + 8);
  if ((v27 & 1) == 0) {
    return v26;
  }
  unint64_t v29 = v27 & 0xFFFFFFFFFFFFFFFELL;
  if (*(char *)(v29 + 31) < 0)
  {
    int v30 = *(void **)(v29 + 8);
    uint64_t v31 = *(void *)(v29 + 16);
  }
  else
  {
    int v30 = (void *)(v29 + 8);
    LODWORD(v31) = *(unsigned __int8 *)(v29 + 31);
  }
  if (*a3 - (void)v25 >= (int)v31)
  {
    uint64_t v32 = (int)v31;
    memcpy(v25, v30, (int)v31);
    v26 += v32;
    return v26;
  }

  return (char *)sub_25C13D00C(a3, (char *)v30, v31, v25);
}

char *sub_25C14C714(void *a1, unsigned int a2, const void **a3, unsigned char *a4)
{
  if (*((char *)a3 + 23) < 0)
  {
    int64_t v4 = (int64_t)a3[1];
    if (v4 > 127) {
      goto LABEL_14;
    }
  }
  else
  {
    int64_t v4 = *((unsigned __int8 *)a3 + 23);
  }
  uint64_t v5 = 1;
  if (a2 >= 0x10) {
    uint64_t v5 = 2;
  }
  if ((uint64_t)(*a1 + ~(unint64_t)&a4[v5] + 16) >= v4)
  {
    unsigned int v6 = (8 * a2) | 2;
    if (v6 >= 0x80)
    {
      LOBYTE(v6) = (8 * a2) | 0x82;
      a4[1] = a2 >> 4;
      uint64_t v7 = 2;
    }
    else
    {
      uint64_t v7 = 1;
    }
    *a4 = v6;
    a4[v7] = v4;
    uint64_t v8 = (uint64_t)&a4[v7 + 1];
    if (*((char *)a3 + 23) >= 0) {
      unsigned int v9 = a3;
    }
    else {
      unsigned int v9 = *a3;
    }
    memcpy(&a4[v7 + 1], v9, v4);
    return (char *)(v8 + v4);
  }
LABEL_14:

  return sub_25C13D0AC((uint64_t)a1, a2, a3, a4);
}

char *sub_25C14C7E4(uint64_t a1, char *a2, int32x2_t *a3)
{
  int v5 = 0;
  unsigned int v39 = a2;
  unsigned int v6 = (unint64_t *)(a1 + 8);
  uint64_t v7 = (uint64_t **)(a1 + 56);
  uint64_t v8 = (uint64_t **)(a1 + 48);
  unsigned int v9 = (uint64_t *)(a1 + 16);
  while ((sub_25C142E98((uint64_t)a3, &v39, a3[11].i32[1]) & 1) == 0)
  {
    unsigned int v10 = v39 + 1;
    unsigned int v11 = *v39;
    if (*v39 < 0)
    {
      unsigned int v11 = v11 + (*v10 << 7) - 128;
      if (*v10 < 0)
      {
        char v12 = 14;
        uint64_t v13 = 2;
        while (1)
        {
          v11 += (v39[v13] - 1) << v12;
          if ((v39[v13] & 0x80000000) == 0) {
            break;
          }
          ++v13;
          v12 += 7;
          if (v13 == 5) {
            goto LABEL_57;
          }
        }
        unsigned int v10 = &v39[v13 + 1];
      }
      else
      {
        unsigned int v10 = v39 + 2;
      }
    }
    unsigned int v39 = v10;
    switch(v11 >> 3)
    {
      case 1u:
        if (v11 != 10) {
          goto LABEL_38;
        }
        *(_DWORD *)(a1 + 40) |= 1u;
        uint64_t v14 = *(void *)(a1 + 8);
        unsigned int v15 = (void *)(v14 & 0xFFFFFFFFFFFFFFFELL);
        if (v14) {
          unsigned int v15 = (void *)*v15;
        }
        unint64_t v16 = v8;
        goto LABEL_25;
      case 2u:
        if (v11 != 16) {
          goto LABEL_38;
        }
        v5 |= 4u;
        unsigned int v17 = v10 + 1;
        int v18 = *v10;
        if ((*v10 & 0x80000000) == 0) {
          goto LABEL_20;
        }
        int v19 = *v17;
        int v18 = v18 + (v19 << 7) - 128;
        if (v19 < 0)
        {
          uint64_t v32 = (char *)sub_25C14B2D4((uint64_t)v10, v18);
          unsigned int v39 = v32;
          *(_DWORD *)(a1 + 64) = v33;
          if (!v32) {
            goto LABEL_57;
          }
        }
        else
        {
          unsigned int v17 = v10 + 2;
LABEL_20:
          unsigned int v39 = v17;
          *(_DWORD *)(a1 + 64) = v18;
        }
        continue;
      case 3u:
        if (v11 != 26) {
          goto LABEL_38;
        }
        *(_DWORD *)(a1 + 40) |= 2u;
        uint64_t v20 = *(void *)(a1 + 8);
        unsigned int v15 = (void *)(v20 & 0xFFFFFFFFFFFFFFFELL);
        if (v20) {
          unsigned int v15 = (void *)*v15;
        }
        unint64_t v16 = v7;
LABEL_25:
        int v21 = (std::string *)sub_25C1369B4(v16, (uint64_t)v15);
        unint64_t v22 = (char *)sub_25C14B33C(v21, v10, (uint64_t)a3);
        goto LABEL_26;
      case 4u:
        if (v11 != 32) {
          goto LABEL_38;
        }
        v5 |= 8u;
        unsigned int v23 = v10 + 1;
        int v24 = *v10;
        if ((*v10 & 0x80000000) == 0) {
          goto LABEL_32;
        }
        int v25 = *v23;
        int v24 = v24 + (v25 << 7) - 128;
        if (v25 < 0)
        {
          unint64_t v34 = (char *)sub_25C14B2D4((uint64_t)v10, v24);
          unsigned int v39 = v34;
          *(_DWORD *)(a1 + 68) = v35;
          if (!v34) {
            goto LABEL_57;
          }
        }
        else
        {
          unsigned int v23 = v10 + 2;
LABEL_32:
          unsigned int v39 = v23;
          *(_DWORD *)(a1 + 68) = v24;
        }
        continue;
      case 5u:
        if (v11 != 40) {
          goto LABEL_38;
        }
        v5 |= 0x10u;
        uint64_t v26 = v10 + 1;
        int v27 = *v10;
        if ((*v10 & 0x80000000) == 0) {
          goto LABEL_37;
        }
        int v28 = *v26;
        int v27 = v27 + (v28 << 7) - 128;
        if (v28 < 0)
        {
          unint64_t v36 = (char *)sub_25C14B2D4((uint64_t)v10, v27);
          unsigned int v39 = v36;
          *(_DWORD *)(a1 + 72) = v37;
          if (!v36) {
            goto LABEL_57;
          }
        }
        else
        {
          uint64_t v26 = v10 + 2;
LABEL_37:
          unsigned int v39 = v26;
          *(_DWORD *)(a1 + 72) = v27;
        }
        continue;
      default:
LABEL_38:
        if (v11) {
          BOOL v29 = (v11 & 7) == 4;
        }
        else {
          BOOL v29 = 1;
        }
        if (v29)
        {
          a3[10].i32[0] = v11 - 1;
          goto LABEL_55;
        }
        unint64_t v30 = v11;
        if (v11 < 0x640)
        {
          if (*v6) {
            uint64_t v31 = (std::string *)((*v6 & 0xFFFFFFFFFFFFFFFELL) + 8);
          }
          else {
            uint64_t v31 = (std::string *)sub_25C142B28(v6);
          }
          char v40 = v31;
          unint64_t v22 = (char *)sub_25C14B72C(v30, &v40, v10, a3);
        }
        else
        {
          unint64_t v22 = (char *)sub_25C140F2C(v9, v11, v10, (uint64_t)&unk_26A596158, v6, a3);
        }
LABEL_26:
        unsigned int v39 = v22;
        if (!v22)
        {
LABEL_57:
          unsigned int v10 = 0;
          goto LABEL_55;
        }
        break;
    }
  }
  unsigned int v10 = v39;
LABEL_55:
  *(_DWORD *)(a1 + 40) |= v5;
  return v10;
}

uint64_t sub_25C14CB48(uint64_t a1)
{
  return *(unsigned int *)(a1 + 44);
}

uint64_t sub_25C14CB50(uint64_t a1)
{
  uint64_t result = sub_25C145C50(a1 + 16);
  int v3 = *(_DWORD *)(a1 + 40);
  if ((v3 & 0x1F) == 0) {
    goto LABEL_8;
  }
  if (v3)
  {
    unint64_t v5 = *(void *)(a1 + 48) & 0xFFFFFFFFFFFFFFFELL;
    uint64_t v6 = *(unsigned __int8 *)(v5 + 23);
    uint64_t v7 = *(void *)(v5 + 8);
    if ((v6 & 0x80u) == 0) {
      uint64_t v7 = v6;
    }
    result += v7 + ((9 * (__clz(v7 | 1) ^ 0x1F) + 73) >> 6) + 1;
    if ((v3 & 2) == 0)
    {
LABEL_4:
      if ((v3 & 4) == 0) {
        goto LABEL_5;
      }
LABEL_16:
      result += ((9 * (__clz(*(_DWORD *)(a1 + 64) | 1) ^ 0x1F) + 73) >> 6) + 1;
      if ((v3 & 8) == 0)
      {
LABEL_6:
        if ((v3 & 0x10) == 0) {
          goto LABEL_8;
        }
        goto LABEL_7;
      }
      goto LABEL_17;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_4;
  }
  unint64_t v8 = *(void *)(a1 + 56) & 0xFFFFFFFFFFFFFFFELL;
  uint64_t v9 = *(unsigned __int8 *)(v8 + 23);
  uint64_t v10 = *(void *)(v8 + 8);
  if ((v9 & 0x80u) == 0) {
    uint64_t v10 = v9;
  }
  result += v10 + ((9 * (__clz(v10 | 1) ^ 0x1F) + 73) >> 6) + 1;
  if ((v3 & 4) != 0) {
    goto LABEL_16;
  }
LABEL_5:
  if ((v3 & 8) == 0) {
    goto LABEL_6;
  }
LABEL_17:
  result += ((9 * (__clz(*(_DWORD *)(a1 + 68) | 1) ^ 0x1F) + 73) >> 6) + 1;
  if ((v3 & 0x10) != 0) {
LABEL_7:
  }
    result += ((9 * (__clz(*(_DWORD *)(a1 + 72) | 1) ^ 0x1F) + 73) >> 6) + 1;
LABEL_8:
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4)
  {
    unint64_t v11 = v4 & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v11 + 31) < 0) {
      uint64_t v12 = *(void *)(v11 + 16);
    }
    else {
      uint64_t v12 = *(unsigned __int8 *)(v11 + 31);
    }
    result += v12;
  }
  *(_DWORD *)(a1 + 44) = result;
  return result;
}

void sub_25C14CCC8(uint64_t a1, uint64_t a2)
{
  sub_25C13FC28(a1 + 16, a2 + 16);
  uint64_t v4 = *(void *)(a2 + 8);
  if (v4)
  {
    unint64_t v5 = v4 & 0xFFFFFFFFFFFFFFFELL;
    unint64_t v6 = (v4 & 0xFFFFFFFFFFFFFFFELL) + 8;
    uint64_t v7 = *(void *)(a1 + 8);
    if (v7) {
      unint64_t v8 = (std::string *)((v7 & 0xFFFFFFFFFFFFFFFELL) + 8);
    }
    else {
      unint64_t v8 = (std::string *)sub_25C142B28((unint64_t *)(a1 + 8));
    }
    int v9 = *(char *)(v5 + 31);
    if (v9 >= 0) {
      uint64_t v10 = (const std::string::value_type *)v6;
    }
    else {
      uint64_t v10 = *(const std::string::value_type **)(v5 + 8);
    }
    if (v9 >= 0) {
      std::string::size_type v11 = *(unsigned __int8 *)(v5 + 31);
    }
    else {
      std::string::size_type v11 = *(void *)(v5 + 16);
    }
    std::string::append(v8, v10, v11);
  }
  int v12 = *(_DWORD *)(a2 + 40);
  if ((v12 & 0x1F) != 0)
  {
    if (v12)
    {
      uint64_t v13 = (long long *)(*(void *)(a2 + 48) & 0xFFFFFFFFFFFFFFFELL);
      *(_DWORD *)(a1 + 40) |= 1u;
      uint64_t v14 = *(void *)(a1 + 8);
      unsigned int v15 = (void *)(v14 & 0xFFFFFFFFFFFFFFFELL);
      if (v14) {
        unsigned int v15 = (void *)*v15;
      }
      sub_25C136668((void *)(a1 + 48), (uint64_t)&qword_26A5963D0, v13, (uint64_t)v15);
      if ((v12 & 2) == 0)
      {
LABEL_14:
        if ((v12 & 4) == 0) {
          goto LABEL_15;
        }
        goto LABEL_26;
      }
    }
    else if ((v12 & 2) == 0)
    {
      goto LABEL_14;
    }
    unint64_t v16 = (long long *)(*(void *)(a2 + 56) & 0xFFFFFFFFFFFFFFFELL);
    *(_DWORD *)(a1 + 40) |= 2u;
    uint64_t v17 = *(void *)(a1 + 8);
    int v18 = (void *)(v17 & 0xFFFFFFFFFFFFFFFELL);
    if (v17) {
      int v18 = (void *)*v18;
    }
    sub_25C136668((void *)(a1 + 56), (uint64_t)&qword_26A5963D0, v16, (uint64_t)v18);
    if ((v12 & 4) == 0)
    {
LABEL_15:
      if ((v12 & 8) == 0) {
        goto LABEL_16;
      }
      goto LABEL_27;
    }
LABEL_26:
    *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
    if ((v12 & 8) == 0)
    {
LABEL_16:
      if ((v12 & 0x10) == 0)
      {
LABEL_18:
        *(_DWORD *)(a1 + 40) |= v12;
        return;
      }
LABEL_17:
      *(_DWORD *)(a1 + 72) = *(_DWORD *)(a2 + 72);
      goto LABEL_18;
    }
LABEL_27:
    *(_DWORD *)(a1 + 68) = *(_DWORD *)(a2 + 68);
    if ((v12 & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
}

uint64_t sub_25C14CE10(uint64_t a1)
{
  return sub_25C140D64(a1 + 16);
}

unsigned char *sub_25C14CE18(uint64_t a1)
{
  uint64_t result = sub_25C13FB88((unsigned char *)(a1 + 16));
  int v3 = *(_DWORD *)(a1 + 40);
  if ((v3 & 3) != 0)
  {
    if (v3)
    {
      unint64_t v4 = *(void *)(a1 + 48) & 0xFFFFFFFFFFFFFFFELL;
      if (*(char *)(v4 + 23) < 0)
      {
        **(unsigned char **)unint64_t v4 = 0;
        *(void *)(v4 + 8) = 0;
        if ((v3 & 2) == 0) {
          goto LABEL_11;
        }
        goto LABEL_6;
      }
      *(unsigned char *)unint64_t v4 = 0;
      *(unsigned char *)(v4 + 23) = 0;
    }
    if ((v3 & 2) == 0) {
      goto LABEL_11;
    }
LABEL_6:
    unint64_t v5 = *(void *)(a1 + 56) & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v5 + 23) < 0)
    {
      **(unsigned char **)unint64_t v5 = 0;
      *(void *)(v5 + 8) = 0;
    }
    else
    {
      *(unsigned char *)unint64_t v5 = 0;
      *(unsigned char *)(v5 + 23) = 0;
    }
  }
LABEL_11:
  if ((v3 & 0x1C) != 0)
  {
    *(_DWORD *)(a1 + 72) = 0;
    *(void *)(a1 + 64) = 0;
  }
  *(_DWORD *)(a1 + 40) = 0;
  uint64_t v6 = *(void *)(a1 + 8);
  if (v6)
  {
    unint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v7 + 31) < 0)
    {
      **(unsigned char **)(v7 + 8) = 0;
      *(void *)(v7 + 16) = 0;
    }
    else
    {
      *(unsigned char *)(v7 + 8) = 0;
      *(unsigned char *)(v7 + 31) = 0;
    }
  }
  return result;
}

void *sub_25C14CEE8(uint64_t a1, uint64_t a2)
{
  return sub_25C14CEF0(a2);
}

void *sub_25C14CEF0(uint64_t a1)
{
  if (!a1) {
    operator new();
  }
  if (*(unsigned char *)(a1 + 24)) {
    (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(a1 + 32) + 32) + 40))(*(void *)(*(void *)(a1 + 32) + 32), &unk_2709890C8, 80);
  }
  int v2 = sub_25C1363A0((void *)a1, 0x50uLL);
  sub_25C14C3BC((uint64_t)v2, a1);
  return v2;
}

void sub_25C14CF9C(_Unwind_Exception *a1)
{
  MEMORY[0x26117F4A0](v1, 0x10A1C40E4A317A1);
  _Unwind_Resume(a1);
}

void *sub_25C14CFC0()
{
  return sub_25C14CEF0(0);
}

void *sub_25C14CFC8@<X0>(void *a1@<X8>)
{
  return sub_25C13C824(a1, "sentencepiece.SentencePieceText.SentencePiece");
}

void sub_25C14CFD8(uint64_t *a1)
{
  sub_25C14D010(a1);

  JUMPOUT(0x26117F4A0);
}

uint64_t *sub_25C14D010(uint64_t *a1)
{
  uint64_t v2 = a1[6];
  if ((uint64_t *)v2 != &qword_26A5963D0)
  {
    if (*(char *)(v2 + 23) < 0) {
      operator delete(*(void **)v2);
    }
    MEMORY[0x26117F4A0](v2, 0x1012C40EC159624);
  }
  uint64_t v3 = a1[7];
  if ((uint64_t *)v3 != &qword_26A5963D0)
  {
    if (*(char *)(v3 + 23) < 0) {
      operator delete(*(void **)v3);
    }
    MEMORY[0x26117F4A0](v3, 0x1012C40EC159624);
  }
  sub_25C14D0BC(a1[1]);
  sub_25C13DB80((uint64_t)(a1 + 2));
  return a1;
}

uint64_t sub_25C14D0BC(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = result & 0xFFFFFFFFFFFFFFFELL;
    if (!*(void *)(result & 0xFFFFFFFFFFFFFFFELL) && v1 != 0)
    {
      if (*(char *)(v1 + 31) < 0) {
        operator delete(*(void **)(v1 + 8));
      }
      JUMPOUT(0x26117F4A0);
    }
  }
  return result;
}

void sub_25C14D134()
{
  sub_25C14D188((uint64_t)&unk_26A5961A8, 0);

  sub_25C147DA8((uint64_t)sub_25C1474BC, (uint64_t)&unk_26A5961A8);
}

uint64_t sub_25C14D188(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 16) = a2;
  *(void *)a1 = &unk_270989718;
  *(void *)(a1 + 8) = a2;
  *(_DWORD *)(a1 + 24) = 0;
  *(void *)(a1 + 48) = a2;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  if (atomic_load_explicit(dword_26B34E550, memory_order_acquire)) {
    sub_25C1475A0(dword_26B34E550);
  }
  *(void *)(a1 + 72) = &qword_26A5963D0;
  *(_DWORD *)(a1 + 80) = 0;
  return a1;
}

void sub_25C14D21C(_Unwind_Exception *a1)
{
  sub_25C14D238(v2);
  sub_25C13DB80(v1);
  _Unwind_Resume(a1);
}

void sub_25C14D238(void *a1)
{
  uint64_t v2 = (uint64_t **)a1[2];
  if (v2 && !*a1)
  {
    uint64_t v3 = v2 + 1;
    uint64_t v4 = *(unsigned int *)v2;
    if ((int)v4 >= 1)
    {
      do
      {
        if (*v3)
        {
          unint64_t v5 = sub_25C14D010(*v3);
          MEMORY[0x26117F4A0](v5, 0x10A1C40E4A317A1);
        }
        ++v3;
        --v4;
      }
      while (v4);
      uint64_t v2 = (uint64_t **)a1[2];
    }
    operator delete(v2);
  }
  a1[2] = 0;
}

char *sub_25C14D2B8(uint64_t a1, char *a2, void *a3)
{
  uint64_t v4 = a2;
  int v6 = *(_DWORD *)(a1 + 40);
  if (v6) {
    uint64_t v4 = sub_25C14C714(a3, 1u, (const void **)(*(void *)(a1 + 72) & 0xFFFFFFFFFFFFFFFELL), a2);
  }
  int v7 = *(_DWORD *)(a1 + 56);
  if (v7)
  {
    for (int i = 0; i != v7; ++i)
    {
      if (*a3 <= (unint64_t)v4) {
        uint64_t v4 = (char *)sub_25C13CEE0((uint64_t)a3, (int)v4);
      }
      uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8 * i + 8);
      *uint64_t v4 = 18;
      unsigned int v10 = *(_DWORD *)(v9 + 44);
      if (v10 > 0x7F)
      {
        v4[1] = v10 | 0x80;
        unsigned int v12 = v10 >> 7;
        if (v10 >> 14)
        {
          uint64_t v13 = v4 + 2;
          do
          {
            uint64_t v14 = v13;
            *v13++ = v12 | 0x80;
            unsigned int v15 = v12 >> 7;
            unsigned int v16 = v12 >> 14;
            v12 >>= 7;
          }
          while (v16);
          std::string::size_type v11 = v14 + 2;
          *uint64_t v13 = v15;
        }
        else
        {
          v4[2] = v12;
          std::string::size_type v11 = v4 + 3;
        }
      }
      else
      {
        v4[1] = v10;
        std::string::size_type v11 = v4 + 2;
      }
      uint64_t v4 = sub_25C14C454(v9, v11, a3);
    }
  }
  if ((v6 & 2) != 0)
  {
    if (*a3 <= (unint64_t)v4) {
      uint64_t v4 = (char *)sub_25C13CEE0((uint64_t)a3, (int)v4);
    }
    int v17 = *(_DWORD *)(a1 + 80);
    *uint64_t v4 = 29;
    *(_DWORD *)(v4 + 1) = v17;
    v4 += 5;
  }
  int v18 = sub_25C142F0C(a1 + 16, v4, a3);
  int v19 = v18;
  uint64_t v20 = *(void *)(a1 + 8);
  if ((v20 & 1) == 0) {
    return v19;
  }
  unint64_t v22 = v20 & 0xFFFFFFFFFFFFFFFELL;
  if (*(char *)(v22 + 31) < 0)
  {
    unsigned int v23 = *(void **)(v22 + 8);
    uint64_t v24 = *(void *)(v22 + 16);
  }
  else
  {
    unsigned int v23 = (void *)(v22 + 8);
    LODWORD(v24) = *(unsigned __int8 *)(v22 + 31);
  }
  if (*a3 - (void)v18 >= (int)v24)
  {
    uint64_t v25 = (int)v24;
    memcpy(v18, v23, (int)v24);
    v19 += v25;
    return v19;
  }

  return (char *)sub_25C13D00C(a3, (char *)v23, v24, v18);
}

char *sub_25C14D494(uint64_t a1, char *a2, int32x2_t *a3)
{
  int v5 = 0;
  int v6 = (uint64_t *)(a1 + 48);
  int v7 = (unint64_t *)(a1 + 8);
  unint64_t v8 = (uint64_t **)(a1 + 72);
  char v40 = (uint64_t *)(a1 + 16);
  uint64_t v41 = a2;
  do
  {
    while (1)
    {
LABEL_2:
      if (sub_25C142E98((uint64_t)a3, &v41, a3[11].i32[1]))
      {
        uint64_t v9 = v41;
        goto LABEL_57;
      }
      uint64_t v9 = v41 + 1;
      unsigned int v10 = *v41;
      if (*v41 < 0)
      {
        unsigned int v10 = v10 + (*v9 << 7) - 128;
        if (*v9 < 0)
        {
          char v11 = 14;
          uint64_t v12 = 2;
          while (1)
          {
            v10 += (v41[v12] - 1) << v11;
            if ((v41[v12] & 0x80000000) == 0) {
              break;
            }
            uint64_t v9 = 0;
            ++v12;
            v11 += 7;
            if (v12 == 5) {
              goto LABEL_57;
            }
          }
          uint64_t v9 = &v41[v12 + 1];
        }
        else
        {
          uint64_t v9 = v41 + 2;
        }
      }
      uint64_t v41 = v9;
      unsigned int v13 = v10 >> 3;
      if (v10 >> 3 != 3) {
        break;
      }
      if (v10 != 29) {
        goto LABEL_17;
      }
      *(_DWORD *)(a1 + 80) = *(_DWORD *)v9;
      uint64_t v41 = v9 + 4;
      int v5 = 2;
    }
    if (v13 == 2)
    {
      if (v10 != 18) {
        goto LABEL_17;
      }
      --v9;
      while (1)
      {
        int v18 = v9 + 1;
        uint64_t v41 = v9 + 1;
        int v19 = *(int **)(a1 + 64);
        if (!v19) {
          break;
        }
        int v20 = *(_DWORD *)(a1 + 56);
        int v21 = *v19;
        if (v20 >= *v19)
        {
          if (v21 == *(_DWORD *)(a1 + 60))
          {
LABEL_32:
            if (v20 <= v21)
            {
              sub_25C14C1A8(v6, v21 - v20 + 1);
              int v19 = *(int **)(a1 + 64);
            }
            int v21 = *v19;
          }
          *int v19 = v21 + 1;
          unint64_t v22 = sub_25C14CEF0(*(void *)(a1 + 48));
          uint64_t v23 = *(void *)(a1 + 64);
          uint64_t v24 = *(int *)(a1 + 56);
          *(_DWORD *)(a1 + 56) = v24 + 1;
          *(void *)(v23 + 8 * v24 + 8) = v22;
          goto LABEL_36;
        }
        *(_DWORD *)(a1 + 56) = v20 + 1;
        unint64_t v22 = *(void **)&v19[2 * v20 + 2];
LABEL_36:
        int v25 = *v18;
        if (*v18 < 0)
        {
          uint64_t v27 = sub_25C14B1B0((uint64_t)(v9 + 1), v25);
          if (!v27) {
            goto LABEL_55;
          }
          uint64_t v26 = (char *)v27;
        }
        else
        {
          uint64_t v26 = v9 + 2;
        }
        int32x2_t v28 = a3[1];
        int v29 = v25 + v26 - v28.i32[0];
        *a3 = (int32x2_t)(*(void *)&v28 + (v29 & (v29 >> 31)));
        __int32 v30 = a3[3].i32[1];
        a3[3].i32[1] = v29;
        v28.i32[0] = a3[11].i32[0];
        BOOL v31 = __OFSUB__(v28.i32[0]--, 1);
        a3[11].i32[0] = v28.i32[0];
        if (v28.i32[0] < 0 != v31) {
          goto LABEL_55;
        }
        uint64_t v32 = sub_25C14C7E4((uint64_t)v22, v26, a3);
        uint64_t v9 = v32;
        if (!v32) {
          goto LABEL_57;
        }
        ++a3[11].i32[0];
        if (a3[10].i32[0]) {
          goto LABEL_55;
        }
        int v33 = a3[3].i32[1] + v30 - v29;
        a3[3].i32[1] = v33;
        int32x2_t v34 = (int32x2_t)(*(void *)&a3[1] + (v33 & (v33 >> 31)));
        *a3 = v34;
        uint64_t v41 = v32;
        if (*(void *)&v34 <= (unint64_t)v32 || *v32 != 18) {
          goto LABEL_2;
        }
      }
      int v20 = *(_DWORD *)(a1 + 56);
      int v21 = *(_DWORD *)(a1 + 60);
      goto LABEL_32;
    }
    if (v13 == 1 && v10 == 10)
    {
      *(_DWORD *)(a1 + 40) |= 1u;
      uint64_t v35 = *(void *)(a1 + 8);
      unint64_t v36 = (void *)(v35 & 0xFFFFFFFFFFFFFFFELL);
      if (v35) {
        unint64_t v36 = (void *)*v36;
      }
      int v37 = (std::string *)sub_25C1369B4(v8, (uint64_t)v36);
      int v17 = (char *)sub_25C14B33C(v37, v9, (uint64_t)a3);
      goto LABEL_52;
    }
LABEL_17:
    if (v10) {
      BOOL v15 = (v10 & 7) == 4;
    }
    else {
      BOOL v15 = 1;
    }
    if (v15)
    {
      a3[10].i32[0] = v10 - 1;
      goto LABEL_57;
    }
    unint64_t v16 = v10;
    if (v10 < 0x640)
    {
      if (*v7) {
        BOOL v38 = (std::string *)((*v7 & 0xFFFFFFFFFFFFFFFELL) + 8);
      }
      else {
        BOOL v38 = (std::string *)sub_25C142B28(v7);
      }
      BOOL v42 = v38;
      int v17 = (char *)sub_25C14B72C(v16, &v42, v9, a3);
    }
    else
    {
      int v17 = (char *)sub_25C140F2C(v40, v10, v9, (uint64_t)&unk_26A5961A8, v7, a3);
    }
LABEL_52:
    uint64_t v41 = v17;
  }
  while (v17);
LABEL_55:
  uint64_t v9 = 0;
LABEL_57:
  *(_DWORD *)(a1 + 40) |= v5;
  return v9;
}

uint64_t sub_25C14D808(uint64_t a1)
{
  return *(unsigned int *)(a1 + 44);
}

uint64_t sub_25C14D810(uint64_t a1)
{
  uint64_t v2 = sub_25C145C50(a1 + 16);
  uint64_t v3 = *(int *)(a1 + 56);
  uint64_t v4 = v2 + v3;
  uint64_t v5 = *(void *)(a1 + 64);
  if (v5) {
    int v6 = (uint64_t *)(v5 + 8);
  }
  else {
    int v6 = 0;
  }
  if (v3)
  {
    uint64_t v7 = 8 * v3;
    do
    {
      uint64_t v8 = *v6++;
      uint64_t v9 = sub_25C14CB50(v8);
      v4 += v9 + ((9 * (__clz(v9 | 1) ^ 0x1F) + 73) >> 6);
      v7 -= 8;
    }
    while (v7);
  }
  int v10 = *(_DWORD *)(a1 + 40);
  if ((v10 & 3) != 0)
  {
    if (v10)
    {
      unint64_t v11 = *(void *)(a1 + 72) & 0xFFFFFFFFFFFFFFFELL;
      uint64_t v12 = *(unsigned __int8 *)(v11 + 23);
      uint64_t v13 = *(void *)(v11 + 8);
      if ((v12 & 0x80u) == 0) {
        uint64_t v13 = v12;
      }
      v4 += v13 + ((9 * (__clz(v13 | 1) ^ 0x1F) + 73) >> 6) + 1;
    }
    if ((v10 & 2) != 0) {
      v4 += 5;
    }
  }
  uint64_t v14 = *(void *)(a1 + 8);
  if (v14)
  {
    unint64_t v16 = v14 & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v16 + 31) < 0) {
      uint64_t v17 = *(void *)(v16 + 16);
    }
    else {
      uint64_t v17 = *(unsigned __int8 *)(v16 + 31);
    }
    v4 += v17;
  }
  *(_DWORD *)(a1 + 44) = v4;
  return v4;
}

void sub_25C14D920(uint64_t a1, uint64_t a2)
{
  sub_25C13FC28(a1 + 16, a2 + 16);
  uint64_t v4 = *(void *)(a2 + 8);
  if (v4)
  {
    unint64_t v5 = v4 & 0xFFFFFFFFFFFFFFFELL;
    unint64_t v6 = (v4 & 0xFFFFFFFFFFFFFFFELL) + 8;
    uint64_t v7 = *(void *)(a1 + 8);
    if (v7) {
      uint64_t v8 = (std::string *)((v7 & 0xFFFFFFFFFFFFFFFELL) + 8);
    }
    else {
      uint64_t v8 = (std::string *)sub_25C142B28((unint64_t *)(a1 + 8));
    }
    int v9 = *(char *)(v5 + 31);
    if (v9 >= 0) {
      int v10 = (const std::string::value_type *)v6;
    }
    else {
      int v10 = *(const std::string::value_type **)(v5 + 8);
    }
    if (v9 >= 0) {
      std::string::size_type v11 = *(unsigned __int8 *)(v5 + 31);
    }
    else {
      std::string::size_type v11 = *(void *)(v5 + 16);
    }
    std::string::append(v8, v10, v11);
  }
  int v12 = *(_DWORD *)(a2 + 56);
  if (v12)
  {
    uint64_t v36 = *(void *)(a2 + 64);
    uint64_t v35 = sub_25C14C1A8((uint64_t *)(a1 + 48), v12);
    uint64_t v13 = **(int **)(a1 + 64);
    uint64_t v14 = *(int *)(a1 + 56);
    int v15 = v13 - v14;
    if ((int)v13 - (int)v14 >= v12) {
      uint64_t v16 = v12;
    }
    else {
      uint64_t v16 = v15;
    }
    if ((int)v16 >= 1)
    {
      uint64_t v17 = (uint64_t *)v35;
      int v18 = (uint64_t *)(v36 + 8);
      do
      {
        uint64_t v20 = *v18++;
        uint64_t v19 = v20;
        uint64_t v21 = *v17++;
        sub_25C14DAF8(v19, v21);
        --v16;
      }
      while (v16);
    }
    if (v15 < v12)
    {
      uint64_t v22 = *(void *)(a1 + 48);
      int v23 = v14 + v12 - v13;
      uint64_t v24 = 8 * v13 - 8 * v14;
      int v25 = (void *)(v35 + v24);
      uint64_t v26 = (uint64_t *)(v24 + v36 + 8);
      do
      {
        uint64_t v27 = *v26++;
        int32x2_t v28 = sub_25C14CEF0(v22);
        sub_25C14DAF8(v27, (uint64_t)v28);
        *v25++ = v28;
        --v23;
      }
      while (v23);
    }
    int v29 = *(_DWORD *)(a1 + 56) + v12;
    *(_DWORD *)(a1 + 56) = v29;
    __int32 v30 = *(int **)(a1 + 64);
    if (*v30 < v29) {
      *__int32 v30 = v29;
    }
  }
  int v31 = *(_DWORD *)(a2 + 40);
  if ((v31 & 3) != 0)
  {
    if (v31)
    {
      uint64_t v32 = (long long *)(*(void *)(a2 + 72) & 0xFFFFFFFFFFFFFFFELL);
      *(_DWORD *)(a1 + 40) |= 1u;
      uint64_t v33 = *(void *)(a1 + 8);
      int32x2_t v34 = (void *)(v33 & 0xFFFFFFFFFFFFFFFELL);
      if (v33) {
        int32x2_t v34 = (void *)*v34;
      }
      sub_25C136668((void *)(a1 + 72), (uint64_t)&qword_26A5963D0, v32, (uint64_t)v34);
    }
    if ((v31 & 2) != 0) {
      *(_DWORD *)(a1 + 80) = *(_DWORD *)(a2 + 80);
    }
    *(_DWORD *)(a1 + 40) |= v31;
  }
}

void sub_25C14DAF8(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_25C14DB08(uint64_t a1)
{
  uint64_t result = sub_25C140D64(a1 + 16);
  if (result)
  {
    uint64_t v3 = *(unsigned int *)(a1 + 56);
    while (1)
    {
      uint64_t result = (int)v3 < 1;
      if ((int)v3 < 1) {
        break;
      }
      uint64_t v4 = v3 - 1;
      char v5 = sub_25C140D64(*(void *)(*(void *)(a1 + 64) + 8 * v3) + 16);
      uint64_t v3 = v4;
      if ((v5 & 1) == 0) {
        return 0;
      }
    }
  }
  return result;
}

unsigned char *sub_25C14DB64(uint64_t a1)
{
  uint64_t result = sub_25C13FB88((unsigned char *)(a1 + 16));
  uint64_t v3 = *(unsigned int *)(a1 + 56);
  if ((int)v3 >= 1)
  {
    uint64_t v4 = (uint64_t *)(*(void *)(a1 + 64) + 8);
    do
    {
      uint64_t v5 = *v4++;
      uint64_t result = sub_25C14CE18(v5);
      --v3;
    }
    while (v3);
    *(_DWORD *)(a1 + 56) = 0;
  }
  if (*(unsigned char *)(a1 + 40))
  {
    unint64_t v6 = *(void *)(a1 + 72) & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v6 + 23) < 0)
    {
      **(unsigned char **)unint64_t v6 = 0;
      *(void *)(v6 + 8) = 0;
    }
    else
    {
      *(unsigned char *)unint64_t v6 = 0;
      *(unsigned char *)(v6 + 23) = 0;
    }
  }
  *(_DWORD *)(a1 + 80) = 0;
  *(_DWORD *)(a1 + 40) = 0;
  uint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    unint64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v8 + 31) < 0)
    {
      **(unsigned char **)(v8 + 8) = 0;
      *(void *)(v8 + 16) = 0;
    }
    else
    {
      *(unsigned char *)(v8 + 8) = 0;
      *(unsigned char *)(v8 + 31) = 0;
    }
  }
  return result;
}

void *sub_25C14DC20(uint64_t a1, uint64_t a2)
{
  return sub_25C14DC28(a2);
}

void *sub_25C14DC28(uint64_t a1)
{
  if (!a1) {
    operator new();
  }
  if (*(unsigned char *)(a1 + 24)) {
    (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(a1 + 32) + 32) + 40))(*(void *)(*(void *)(a1 + 32) + 32), &unk_270989038, 88);
  }
  uint64_t v2 = sub_25C1363A0((void *)a1, 0x58uLL);
  sub_25C14D188((uint64_t)v2, a1);
  return v2;
}

void sub_25C14DCD4(_Unwind_Exception *a1)
{
  MEMORY[0x26117F4A0](v1, 0x10A1C40431D3885);
  _Unwind_Resume(a1);
}

void *sub_25C14DCF8()
{
  return sub_25C14DC28(0);
}

void *sub_25C14DD00@<X0>(void *a1@<X8>)
{
  return sub_25C13C824(a1, "sentencepiece.SentencePieceText");
}

void sub_25C14DD10(uint64_t *a1)
{
  sub_25C14DD48(a1);

  JUMPOUT(0x26117F4A0);
}

uint64_t *sub_25C14DD48(uint64_t *a1)
{
  uint64_t v2 = a1[9];
  if ((uint64_t *)v2 != &qword_26A5963D0)
  {
    if (*(char *)(v2 + 23) < 0) {
      operator delete(*(void **)v2);
    }
    MEMORY[0x26117F4A0](v2, 0x1012C40EC159624);
  }
  sub_25C14D0BC(a1[1]);
  sub_25C14D238(a1 + 6);
  sub_25C13DB80((uint64_t)(a1 + 2));
  return a1;
}

void sub_25C14DDC4()
{
  sub_25C14DE18((uint64_t)&unk_26A596200, 0);

  sub_25C147DA8((uint64_t)sub_25C1474BC, (uint64_t)&unk_26A596200);
}

uint64_t sub_25C14DE18(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_270989818;
  *(void *)(a1 + 8) = a2;
  *(void *)(a1 + 16) = a2;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(_DWORD *)(a1 + 40) = 0;
  if (atomic_load_explicit(dword_26B34E4C8, memory_order_acquire)) {
    sub_25C1475A0(dword_26B34E4C8);
  }
  return a1;
}

void sub_25C14DE88(_Unwind_Exception *a1)
{
  sub_25C14DE9C(v1);
  _Unwind_Resume(a1);
}

void sub_25C14DE9C(void *a1)
{
  uint64_t v2 = (uint64_t **)a1[2];
  if (v2 && !*a1)
  {
    uint64_t v3 = v2 + 1;
    uint64_t v4 = *(unsigned int *)v2;
    if ((int)v4 >= 1)
    {
      do
      {
        if (*v3)
        {
          uint64_t v5 = sub_25C14DD48(*v3);
          MEMORY[0x26117F4A0](v5, 0x10A1C40431D3885);
        }
        ++v3;
        --v4;
      }
      while (v4);
      uint64_t v2 = (uint64_t **)a1[2];
    }
    operator delete(v2);
  }
  a1[2] = 0;
}

char *sub_25C14DF1C(uint64_t a1, char *__dst, void *a3)
{
  int v6 = *(_DWORD *)(a1 + 24);
  if (v6)
  {
    for (int i = 0; i != v6; ++i)
    {
      if (*a3 <= (unint64_t)__dst) {
        __dst = (char *)sub_25C13CEE0((uint64_t)a3, (int)__dst);
      }
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8 * i + 8);
      void *__dst = 10;
      unsigned int v9 = *(_DWORD *)(v8 + 44);
      if (v9 > 0x7F)
      {
        __dst[1] = v9 | 0x80;
        unsigned int v11 = v9 >> 7;
        if (v9 >> 14)
        {
          int v12 = __dst + 2;
          do
          {
            uint64_t v13 = v12;
            *v12++ = v11 | 0x80;
            unsigned int v14 = v11 >> 7;
            unsigned int v15 = v11 >> 14;
            v11 >>= 7;
          }
          while (v15);
          int v10 = v13 + 2;
          *int v12 = v14;
        }
        else
        {
          __dst[2] = v11;
          int v10 = __dst + 3;
        }
      }
      else
      {
        __dst[1] = v9;
        int v10 = __dst + 2;
      }
      __dst = sub_25C14D2B8(v8, v10, a3);
    }
  }
  uint64_t v16 = *(void *)(a1 + 8);
  if ((v16 & 1) == 0) {
    return __dst;
  }
  unint64_t v18 = v16 & 0xFFFFFFFFFFFFFFFELL;
  if (*(char *)(v18 + 31) < 0)
  {
    uint64_t v19 = *(void **)(v18 + 8);
    uint64_t v20 = *(void *)(v18 + 16);
  }
  else
  {
    uint64_t v19 = (void *)(v18 + 8);
    LODWORD(v20) = *(unsigned __int8 *)(v18 + 31);
  }
  if (*a3 - (void)__dst >= (int)v20)
  {
    uint64_t v21 = (int)v20;
    memcpy(__dst, v19, (int)v20);
    __dst += v21;
    return __dst;
  }

  return (char *)sub_25C13D00C(a3, (char *)v19, v20, __dst);
}

char *sub_25C14E08C(uint64_t a1, char *a2, int32x2_t *a3)
{
  int v31 = a2;
  uint64_t v5 = (unint64_t *)(a1 + 8);
  int v6 = (uint64_t *)(a1 + 16);
  do
  {
LABEL_2:
    if (sub_25C142E98((uint64_t)a3, &v31, a3[11].i32[1])) {
      return v31;
    }
    uint64_t v7 = v31 + 1;
    unsigned int v8 = *v31;
    if (*v31 < 0)
    {
      unsigned int v8 = v8 + (*v7 << 7) - 128;
      if (*v7 < 0)
      {
        char v9 = 14;
        uint64_t v10 = 2;
        while (1)
        {
          v8 += (v31[v10] - 1) << v9;
          if ((v31[v10] & 0x80000000) == 0) {
            break;
          }
          uint64_t v7 = 0;
          ++v10;
          v9 += 7;
          if (v10 == 5) {
            return v7;
          }
        }
        uint64_t v7 = &v31[v10 + 1];
      }
      else
      {
        uint64_t v7 = v31 + 2;
      }
    }
    int v31 = v7;
    if (v8 == 10)
    {
      --v7;
      while (1)
      {
        uint64_t v13 = v7 + 1;
        int v31 = v7 + 1;
        unsigned int v14 = *(int **)(a1 + 32);
        if (!v14) {
          break;
        }
        int v15 = *(_DWORD *)(a1 + 24);
        int v16 = *v14;
        if (v15 >= *v14)
        {
          if (v16 == *(_DWORD *)(a1 + 28))
          {
LABEL_26:
            if (v15 <= v16)
            {
              sub_25C14C1A8(v6, v16 - v15 + 1);
              unsigned int v14 = *(int **)(a1 + 32);
            }
            int v16 = *v14;
          }
          *unsigned int v14 = v16 + 1;
          uint64_t v17 = sub_25C14DC28(*(void *)(a1 + 16));
          uint64_t v18 = *(void *)(a1 + 32);
          uint64_t v19 = *(int *)(a1 + 24);
          *(_DWORD *)(a1 + 24) = v19 + 1;
          *(void *)(v18 + 8 * v19 + 8) = v17;
          goto LABEL_30;
        }
        *(_DWORD *)(a1 + 24) = v15 + 1;
        uint64_t v17 = *(void **)&v14[2 * v15 + 2];
LABEL_30:
        int v20 = *v13;
        if (*v13 < 0)
        {
          uint64_t v22 = sub_25C14B1B0((uint64_t)(v7 + 1), v20);
          if (!v22) {
            return 0;
          }
          uint64_t v21 = (char *)v22;
        }
        else
        {
          uint64_t v21 = v7 + 2;
        }
        int32x2_t v23 = a3[1];
        int v24 = v20 + v21 - v23.i32[0];
        *a3 = (int32x2_t)(*(void *)&v23 + (v24 & (v24 >> 31)));
        __int32 v25 = a3[3].i32[1];
        a3[3].i32[1] = v24;
        v23.i32[0] = a3[11].i32[0];
        BOOL v26 = __OFSUB__(v23.i32[0]--, 1);
        a3[11].i32[0] = v23.i32[0];
        if (v23.i32[0] < 0 != v26) {
          return 0;
        }
        uint64_t v27 = sub_25C14D494((uint64_t)v17, v21, a3);
        uint64_t v7 = v27;
        if (!v27) {
          return v7;
        }
        ++a3[11].i32[0];
        if (a3[10].i32[0]) {
          return 0;
        }
        int v28 = a3[3].i32[1] + v25 - v24;
        a3[3].i32[1] = v28;
        int32x2_t v29 = (int32x2_t)(*(void *)&a3[1] + (v28 & (v28 >> 31)));
        *a3 = v29;
        int v31 = v27;
        if (*(void *)&v29 <= (unint64_t)v27 || *v27 != 10) {
          goto LABEL_2;
        }
      }
      int v15 = *(_DWORD *)(a1 + 24);
      int v16 = *(_DWORD *)(a1 + 28);
      goto LABEL_26;
    }
    if (v8) {
      BOOL v11 = (v8 & 7) == 4;
    }
    else {
      BOOL v11 = 1;
    }
    if (v11)
    {
      a3[10].i32[0] = v8 - 1;
      return v7;
    }
    if (*v5) {
      int v12 = (std::string *)((*v5 & 0xFFFFFFFFFFFFFFFELL) + 8);
    }
    else {
      int v12 = (std::string *)sub_25C142B28(v5);
    }
    uint64_t v32 = v12;
    int v31 = (char *)sub_25C14B72C(v8, &v32, v7, a3);
  }
  while (v31);
  return 0;
}

uint64_t sub_25C14E330(uint64_t a1)
{
  return *(unsigned int *)(a1 + 40);
}

uint64_t sub_25C14E338(uint64_t a1)
{
  uint64_t v2 = *(int *)(a1 + 24);
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    uint64_t v4 = (uint64_t *)(v3 + 8);
  }
  else {
    uint64_t v4 = 0;
  }
  if (v2)
  {
    uint64_t v5 = 8 * v2;
    do
    {
      uint64_t v6 = *v4++;
      uint64_t v7 = sub_25C14D810(v6);
      v2 += v7 + ((9 * (__clz(v7 | 1) ^ 0x1F) + 73) >> 6);
      v5 -= 8;
    }
    while (v5);
  }
  else
  {
    uint64_t v2 = 0;
  }
  uint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    unint64_t v10 = v8 & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v10 + 31) < 0) {
      uint64_t v11 = *(void *)(v10 + 16);
    }
    else {
      uint64_t v11 = *(unsigned __int8 *)(v10 + 31);
    }
    v2 += v11;
  }
  *(_DWORD *)(a1 + 40) = v2;
  return v2;
}

void sub_25C14E3E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  if (v4)
  {
    uint64_t v5 = (unint64_t *)(a1 + 8);
    unint64_t v6 = v4 & 0xFFFFFFFFFFFFFFFELL;
    unint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFFELL) + 8;
    uint64_t v8 = *(void *)(a1 + 8);
    if (v8) {
      char v9 = (std::string *)((v8 & 0xFFFFFFFFFFFFFFFELL) + 8);
    }
    else {
      char v9 = (std::string *)sub_25C142B28(v5);
    }
    int v10 = *(char *)(v6 + 31);
    if (v10 >= 0) {
      uint64_t v11 = (const std::string::value_type *)v7;
    }
    else {
      uint64_t v11 = *(const std::string::value_type **)(v6 + 8);
    }
    if (v10 >= 0) {
      std::string::size_type v12 = *(unsigned __int8 *)(v6 + 31);
    }
    else {
      std::string::size_type v12 = *(void *)(v6 + 16);
    }
    std::string::append(v9, v11, v12);
  }
  int v13 = *(_DWORD *)(a2 + 24);
  if (v13)
  {
    uint64_t v34 = *(void *)(a2 + 32);
    uint64_t v14 = sub_25C14C1A8((uint64_t *)(a1 + 16), v13);
    uint64_t v15 = v14;
    uint64_t v16 = **(int **)(a1 + 32);
    uint64_t v17 = *(int *)(a1 + 24);
    int v18 = v16 - v17;
    if ((int)v16 - (int)v17 >= v13) {
      uint64_t v19 = v13;
    }
    else {
      uint64_t v19 = v18;
    }
    if ((int)v19 >= 1)
    {
      int v20 = (uint64_t *)(v34 + 8);
      uint64_t v21 = (uint64_t *)v14;
      do
      {
        uint64_t v23 = *v20++;
        uint64_t v22 = v23;
        uint64_t v24 = *v21++;
        sub_25C14E550(v22, v24);
        --v19;
      }
      while (v19);
    }
    if (v18 < v13)
    {
      uint64_t v25 = *(void *)(a1 + 16);
      int v26 = v17 + v13 - v16;
      uint64_t v27 = 8 * v16 - 8 * v17;
      int v28 = (void *)(v15 + v27);
      int32x2_t v29 = (uint64_t *)(v27 + v34 + 8);
      do
      {
        uint64_t v30 = *v29++;
        int v31 = sub_25C14DC28(v25);
        sub_25C14E550(v30, (uint64_t)v31);
        *v28++ = v31;
        --v26;
      }
      while (v26);
    }
    int v32 = *(_DWORD *)(a1 + 24) + v13;
    *(_DWORD *)(a1 + 24) = v32;
    uint64_t v33 = *(int **)(a1 + 32);
    if (*v33 < v32) {
      int *v33 = v32;
    }
  }
}

void sub_25C14E550(uint64_t a1, uint64_t a2)
{
}

BOOL sub_25C14E560(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 24);
  do
  {
    int v3 = v2;
    if ((int)v2 < 1) {
      break;
    }
    uint64_t v4 = v2 - 1;
    char v5 = sub_25C14DB08(*(void *)(*(void *)(a1 + 32) + 8 * v2));
    uint64_t v2 = v4;
  }
  while ((v5 & 1) != 0);
  return v3 < 1;
}

unsigned char *sub_25C14E5B8(unsigned char *result)
{
  uint64_t v1 = result;
  uint64_t v2 = *((unsigned int *)result + 6);
  if ((int)v2 >= 1)
  {
    int v3 = (uint64_t *)(*((void *)result + 4) + 8);
    do
    {
      uint64_t v4 = *v3++;
      uint64_t result = sub_25C14DB64(v4);
      --v2;
    }
    while (v2);
    *((_DWORD *)v1 + 6) = 0;
  }
  uint64_t v5 = *((void *)v1 + 1);
  if (v5)
  {
    unint64_t v6 = v5 & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v6 + 31) < 0)
    {
      **(unsigned char **)(v6 + 8) = 0;
      *(void *)(v6 + 16) = 0;
    }
    else
    {
      *(unsigned char *)(v6 + 8) = 0;
      *(unsigned char *)(v6 + 31) = 0;
    }
  }
  return result;
}

void *sub_25C14E634(uint64_t a1, uint64_t a2)
{
  return sub_25C14E63C(a2);
}

void *sub_25C14E63C(uint64_t a1)
{
  if (!a1) {
    operator new();
  }
  if (*(unsigned char *)(a1 + 24)) {
    (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(a1 + 32) + 32) + 40))(*(void *)(*(void *)(a1 + 32) + 32), &unk_270989068, 48);
  }
  uint64_t v2 = sub_25C1363A0((void *)a1, 0x30uLL);
  sub_25C14DE18((uint64_t)v2, a1);
  return v2;
}

void sub_25C14E6E8(_Unwind_Exception *a1)
{
  MEMORY[0x26117F4A0](v1, 0x10A1C40290C9B23);
  _Unwind_Resume(a1);
}

void *sub_25C14E70C()
{
  return sub_25C14E63C(0);
}

void *sub_25C14E714@<X0>(void *a1@<X8>)
{
  return sub_25C13C824(a1, "sentencepiece.NBestSentencePieceText");
}

void sub_25C14E724(uint64_t a1)
{
  sub_25C14D0BC(*(void *)(a1 + 8));
  sub_25C14DE9C((void *)(a1 + 16));

  JUMPOUT(0x26117F4A0);
}

uint64_t sub_25C14E778(uint64_t a1)
{
  return a1;
}

void sub_25C14E7AC()
{
  qword_26A596230 = (uint64_t)&unk_270989798;
  *(void *)algn_26A596238 = 0;
  qword_26A596240 = 0;
  if (atomic_load_explicit(dword_26B34E500, memory_order_acquire)) {
    sub_25C1475A0(dword_26B34E500);
  }
  qword_26A596248 = (uint64_t)&qword_26A5963D0;
  unk_26A596250 = &qword_26A5963D0;

  sub_25C147DA8((uint64_t)sub_25C1474BC, (uint64_t)&qword_26A596230);
}

char *sub_25C14E840(uint64_t a1, char *__dst, void *a3)
{
  uint64_t v4 = __dst;
  int v6 = *(_DWORD *)(a1 + 16);
  if (v6) {
    uint64_t v4 = sub_25C14C714(a3, 1u, (const void **)(*(void *)(a1 + 24) & 0xFFFFFFFFFFFFFFFELL), __dst);
  }
  if ((v6 & 2) != 0) {
    uint64_t v4 = sub_25C14C714(a3, 2u, (const void **)(*(void *)(a1 + 32) & 0xFFFFFFFFFFFFFFFELL), v4);
  }
  uint64_t v7 = *(void *)(a1 + 8);
  if ((v7 & 1) == 0) {
    return v4;
  }
  unint64_t v9 = v7 & 0xFFFFFFFFFFFFFFFELL;
  if (*(char *)(v9 + 31) < 0)
  {
    int v10 = *(void **)(v9 + 8);
    uint64_t v11 = *(void *)(v9 + 16);
  }
  else
  {
    int v10 = (void *)(v9 + 8);
    LODWORD(v11) = *(unsigned __int8 *)(v9 + 31);
  }
  if (*a3 - (void)v4 >= (int)v11)
  {
    uint64_t v12 = (int)v11;
    memcpy(v4, v10, (int)v11);
    v4 += v12;
    return v4;
  }

  return (char *)sub_25C13D00C(a3, (char *)v10, v11, v4);
}

char *sub_25C14E92C(uint64_t a1, char *a2, int32x2_t *a3)
{
  uint64_t v22 = a2;
  uint64_t v5 = (unint64_t *)(a1 + 8);
  int v6 = (uint64_t **)(a1 + 32);
  uint64_t v7 = (uint64_t **)(a1 + 24);
  do
  {
    if (sub_25C142E98((uint64_t)a3, &v22, a3[11].i32[1])) {
      return v22;
    }
    uint64_t v8 = v22 + 1;
    unsigned int v9 = *v22;
    if (*v22 < 0)
    {
      unsigned int v9 = v9 + (*v8 << 7) - 128;
      if (*v8 < 0)
      {
        char v10 = 14;
        uint64_t v11 = 2;
        while (1)
        {
          v9 += (v22[v11] - 1) << v10;
          if ((v22[v11] & 0x80000000) == 0) {
            break;
          }
          ++v11;
          v10 += 7;
          if (v11 == 5) {
            return 0;
          }
        }
        uint64_t v8 = &v22[v11 + 1];
      }
      else
      {
        uint64_t v8 = v22 + 2;
      }
    }
    uint64_t v22 = v8;
    if (v9 >> 3 != 2)
    {
      if (v9 >> 3 != 1 || v9 != 10) {
        goto LABEL_16;
      }
      *(_DWORD *)(a1 + 16) |= 1u;
      uint64_t v19 = *(void *)(a1 + 8);
      uint64_t v17 = (void *)(v19 & 0xFFFFFFFFFFFFFFFELL);
      if (v19) {
        uint64_t v17 = (void *)*v17;
      }
      int v18 = v7;
LABEL_30:
      int v20 = (std::string *)sub_25C1369B4(v18, (uint64_t)v17);
      uint64_t v15 = (char *)sub_25C14B33C(v20, v8, (uint64_t)a3);
      goto LABEL_31;
    }
    if (v9 == 18)
    {
      *(_DWORD *)(a1 + 16) |= 2u;
      uint64_t v16 = *(void *)(a1 + 8);
      uint64_t v17 = (void *)(v16 & 0xFFFFFFFFFFFFFFFELL);
      if (v16) {
        uint64_t v17 = (void *)*v17;
      }
      int v18 = v6;
      goto LABEL_30;
    }
LABEL_16:
    if (v9) {
      BOOL v13 = (v9 & 7) == 4;
    }
    else {
      BOOL v13 = 1;
    }
    if (v13)
    {
      a3[10].i32[0] = v9 - 1;
      return v8;
    }
    if (*v5) {
      uint64_t v14 = (std::string *)((*v5 & 0xFFFFFFFFFFFFFFFELL) + 8);
    }
    else {
      uint64_t v14 = (std::string *)sub_25C142B28(v5);
    }
    uint64_t v23 = v14;
    uint64_t v15 = (char *)sub_25C14B72C(v9, &v23, v8, a3);
LABEL_31:
    uint64_t v22 = v15;
  }
  while (v15);
  return 0;
}

uint64_t sub_25C14EAF8(uint64_t a1)
{
  return *(unsigned int *)(a1 + 20);
}

uint64_t sub_25C14EB00(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16);
  if ((v1 & 3) == 0)
  {
    uint64_t v2 = 0;
    goto LABEL_12;
  }
  if ((v1 & 1) == 0)
  {
    uint64_t v2 = 0;
    if ((v1 & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  unint64_t v3 = *(void *)(a1 + 24) & 0xFFFFFFFFFFFFFFFELL;
  uint64_t v4 = *(unsigned __int8 *)(v3 + 23);
  uint64_t v5 = *(void *)(v3 + 8);
  if ((v4 & 0x80u) == 0) {
    uint64_t v5 = v4;
  }
  uint64_t v2 = v5 + ((9 * (__clz(v5 | 1) ^ 0x1F) + 73) >> 6) + 1;
  if ((v1 & 2) != 0)
  {
LABEL_9:
    unint64_t v6 = *(void *)(a1 + 32) & 0xFFFFFFFFFFFFFFFELL;
    uint64_t v7 = *(unsigned __int8 *)(v6 + 23);
    uint64_t v8 = *(void *)(v6 + 8);
    if ((v7 & 0x80u) == 0) {
      uint64_t v8 = v7;
    }
    v2 += v8 + ((9 * (__clz(v8 | 1) ^ 0x1F) + 73) >> 6) + 1;
  }
LABEL_12:
  uint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    unint64_t v11 = v9 & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v11 + 31) < 0) {
      uint64_t v12 = *(void *)(v11 + 16);
    }
    else {
      uint64_t v12 = *(unsigned __int8 *)(v11 + 31);
    }
    v2 += v12;
  }
  *(_DWORD *)(a1 + 20) = v2;
  return v2;
}

std::string *sub_25C14EBDC(std::string *result, uint64_t a2)
{
  unint64_t v3 = result;
  uint64_t v4 = *(void *)(a2 + 8);
  if (v4)
  {
    p_std::string::size_type size = &result->__r_.__value_.__l.__size_;
    unint64_t v6 = v4 & 0xFFFFFFFFFFFFFFFELL;
    unint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFFELL) + 8;
    std::string::size_type size = v3->__r_.__value_.__l.__size_;
    if (size) {
      uint64_t v9 = (std::string *)((size & 0xFFFFFFFFFFFFFFFELL) + 8);
    }
    else {
      uint64_t v9 = (std::string *)sub_25C142B28(p_size);
    }
    int v10 = *(char *)(v6 + 31);
    if (v10 >= 0) {
      unint64_t v11 = (const std::string::value_type *)v7;
    }
    else {
      unint64_t v11 = *(const std::string::value_type **)(v6 + 8);
    }
    if (v10 >= 0) {
      std::string::size_type v12 = *(unsigned __int8 *)(v6 + 31);
    }
    else {
      std::string::size_type v12 = *(void *)(v6 + 16);
    }
    uint64_t result = std::string::append(v9, v11, v12);
  }
  int v13 = *(_DWORD *)(a2 + 16);
  if ((v13 & 3) != 0)
  {
    if (v13)
    {
      uint64_t v14 = (long long *)(*(void *)(a2 + 24) & 0xFFFFFFFFFFFFFFFELL);
      LODWORD(v3->__r_.__value_.__r.__words[2]) |= 1u;
      std::string::size_type v15 = v3->__r_.__value_.__l.__size_;
      uint64_t v16 = (void *)(v15 & 0xFFFFFFFFFFFFFFFELL);
      if (v15) {
        uint64_t v16 = (void *)*v16;
      }
      uint64_t result = (std::string *)sub_25C136668(v3[1].__r_.__value_.__r.__words, (uint64_t)&qword_26A5963D0, v14, (uint64_t)v16);
    }
    if ((v13 & 2) != 0)
    {
      uint64_t v17 = (long long *)(*(void *)(a2 + 32) & 0xFFFFFFFFFFFFFFFELL);
      LODWORD(v3->__r_.__value_.__r.__words[2]) |= 2u;
      std::string::size_type v18 = v3->__r_.__value_.__l.__size_;
      uint64_t v19 = (void *)(v18 & 0xFFFFFFFFFFFFFFFELL);
      if (v18) {
        uint64_t v19 = (void *)*v19;
      }
      return (std::string *)sub_25C136668(&v3[1].__r_.__value_.__l.__size_, (uint64_t)&qword_26A5963D0, v17, (uint64_t)v19);
    }
  }
  return result;
}

uint64_t sub_25C14ECF0()
{
  return 1;
}

uint64_t sub_25C14ECF8(uint64_t result)
{
  int v1 = *(_DWORD *)(result + 16);
  if ((v1 & 3) != 0)
  {
    if (v1)
    {
      unint64_t v2 = *(void *)(result + 24) & 0xFFFFFFFFFFFFFFFELL;
      if (*(char *)(v2 + 23) < 0)
      {
        **(unsigned char **)unint64_t v2 = 0;
        *(void *)(v2 + 8) = 0;
        if ((v1 & 2) == 0) {
          goto LABEL_11;
        }
        goto LABEL_6;
      }
      *(unsigned char *)unint64_t v2 = 0;
      *(unsigned char *)(v2 + 23) = 0;
    }
    if ((v1 & 2) == 0) {
      goto LABEL_11;
    }
LABEL_6:
    unint64_t v3 = *(void *)(result + 32) & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v3 + 23) < 0)
    {
      **(unsigned char **)unint64_t v3 = 0;
      *(void *)(v3 + 8) = 0;
    }
    else
    {
      *(unsigned char *)unint64_t v3 = 0;
      *(unsigned char *)(v3 + 23) = 0;
    }
  }
LABEL_11:
  *(_DWORD *)(result + 16) = 0;
  uint64_t v4 = *(void *)(result + 8);
  if (v4)
  {
    unint64_t v5 = v4 & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v5 + 31) < 0)
    {
      **(unsigned char **)(v5 + 8) = 0;
      *(void *)(v5 + 16) = 0;
    }
    else
    {
      *(unsigned char *)(v5 + 8) = 0;
      *(unsigned char *)(v5 + 31) = 0;
    }
  }
  return result;
}

void *sub_25C14ED94(uint64_t a1, uint64_t a2)
{
  return sub_25C14ED9C(a2);
}

void *sub_25C14ED9C(uint64_t a1)
{
  if (!a1) {
    operator new();
  }
  if (*(unsigned char *)(a1 + 24)) {
    (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(a1 + 32) + 32) + 40))(*(void *)(*(void *)(a1 + 32) + 32), &unk_270989050, 40);
  }
  unint64_t v2 = sub_25C1363A0((void *)a1, 0x28uLL);
  void *v2 = &unk_270989798;
  v2[1] = a1;
  v2[2] = 0;
  if (atomic_load_explicit(dword_26B34E500, memory_order_acquire)) {
    sub_25C1475A0(dword_26B34E500);
  }
  v2[3] = &qword_26A5963D0;
  v2[4] = &qword_26A5963D0;
  return v2;
}

void sub_25C14EEC0(_Unwind_Exception *a1)
{
  MEMORY[0x26117F4A0](v1, 0x1081C400F7E8713);
  _Unwind_Resume(a1);
}

void *sub_25C14EEE4()
{
  return sub_25C14ED9C(0);
}

void *sub_25C14EEEC@<X0>(void *a1@<X8>)
{
  return sub_25C13C824(a1, "sentencepiece.SelfTestData.Sample");
}

void sub_25C14EEFC(uint64_t *a1)
{
  sub_25C14EF34(a1);

  JUMPOUT(0x26117F4A0);
}

uint64_t *sub_25C14EF34(uint64_t *a1)
{
  uint64_t v2 = a1[3];
  if ((uint64_t *)v2 != &qword_26A5963D0)
  {
    if (*(char *)(v2 + 23) < 0) {
      operator delete(*(void **)v2);
    }
    MEMORY[0x26117F4A0](v2, 0x1012C40EC159624);
  }
  uint64_t v3 = a1[4];
  if ((uint64_t *)v3 != &qword_26A5963D0)
  {
    if (*(char *)(v3 + 23) < 0) {
      operator delete(*(void **)v3);
    }
    MEMORY[0x26117F4A0](v3, 0x1012C40EC159624);
  }
  sub_25C14D0BC(a1[1]);
  return a1;
}

void sub_25C14EFDC()
{
  sub_25C14F030((uint64_t)&unk_26A596388, 0);

  sub_25C147DA8((uint64_t)sub_25C1474BC, (uint64_t)&unk_26A596388);
}

uint64_t sub_25C14F030(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 16) = a2;
  *(void *)a1 = &unk_270989540;
  *(void *)(a1 + 8) = a2;
  *(_DWORD *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = a2;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  *(_DWORD *)(a1 + 64) = 0;
  if (atomic_load_explicit(dword_26B34E518, memory_order_acquire)) {
    sub_25C1475A0(dword_26B34E518);
  }
  return a1;
}

void sub_25C14F0B8(_Unwind_Exception *a1)
{
  sub_25C14F0D4(v2);
  sub_25C13DB80(v1);
  _Unwind_Resume(a1);
}

void sub_25C14F0D4(void *a1)
{
  uint64_t v2 = (uint64_t **)a1[2];
  if (v2 && !*a1)
  {
    uint64_t v3 = v2 + 1;
    uint64_t v4 = *(unsigned int *)v2;
    if ((int)v4 >= 1)
    {
      do
      {
        if (*v3)
        {
          unint64_t v5 = sub_25C14EF34(*v3);
          MEMORY[0x26117F4A0](v5, 0x1081C400F7E8713);
        }
        ++v3;
        --v4;
      }
      while (v4);
      uint64_t v2 = (uint64_t **)a1[2];
    }
    operator delete(v2);
  }
  a1[2] = 0;
}

char *sub_25C14F154(uint64_t a1, char *a2, void *a3)
{
  int v5 = *(_DWORD *)(a1 + 48);
  if (v5)
  {
    for (int i = 0; i != v5; ++i)
    {
      if (*a3 <= (unint64_t)a2) {
        a2 = (char *)sub_25C13CEE0((uint64_t)a3, (int)a2);
      }
      uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8 * i + 8);
      *a2 = 10;
      unsigned int v8 = *(_DWORD *)(v7 + 20);
      if (v8 > 0x7F)
      {
        a2[1] = v8 | 0x80;
        unsigned int v10 = v8 >> 7;
        if (v8 >> 14)
        {
          unint64_t v11 = a2 + 2;
          do
          {
            std::string::size_type v12 = v11;
            *v11++ = v10 | 0x80;
            unsigned int v13 = v10 >> 7;
            unsigned int v14 = v10 >> 14;
            v10 >>= 7;
          }
          while (v14);
          uint64_t v9 = v12 + 2;
          *unint64_t v11 = v13;
        }
        else
        {
          a2[2] = v10;
          uint64_t v9 = a2 + 3;
        }
      }
      else
      {
        a2[1] = v8;
        uint64_t v9 = a2 + 2;
      }
      a2 = sub_25C14E840(v7, v9, a3);
    }
  }
  std::string::size_type v15 = sub_25C142F0C(a1 + 16, a2, a3);
  uint64_t v16 = v15;
  uint64_t v17 = *(void *)(a1 + 8);
  if ((v17 & 1) == 0) {
    return v16;
  }
  unint64_t v19 = v17 & 0xFFFFFFFFFFFFFFFELL;
  if (*(char *)(v19 + 31) < 0)
  {
    int v20 = *(void **)(v19 + 8);
    uint64_t v21 = *(void *)(v19 + 16);
  }
  else
  {
    int v20 = (void *)(v19 + 8);
    LODWORD(v21) = *(unsigned __int8 *)(v19 + 31);
  }
  if (*a3 - (void)v15 >= (int)v21)
  {
    uint64_t v22 = (int)v21;
    memcpy(v15, v20, (int)v21);
    v16 += v22;
    return v16;
  }

  return (char *)sub_25C13D00C(a3, (char *)v20, v21, v15);
}

char *sub_25C14F2CC(uint64_t a1, char *a2, int32x2_t *a3)
{
  uint64_t v33 = a2;
  int v5 = (unint64_t *)(a1 + 8);
  unint64_t v6 = (uint64_t *)(a1 + 16);
  uint64_t v7 = (uint64_t *)(a1 + 40);
  do
  {
LABEL_2:
    if (sub_25C142E98((uint64_t)a3, &v33, a3[11].i32[1])) {
      return v33;
    }
    unsigned int v8 = v33 + 1;
    unsigned int v9 = *v33;
    if (*v33 < 0)
    {
      unsigned int v9 = v9 + (*v8 << 7) - 128;
      if (*v8 < 0)
      {
        char v10 = 14;
        uint64_t v11 = 2;
        while (1)
        {
          v9 += (v33[v11] - 1) << v10;
          if ((v33[v11] & 0x80000000) == 0) {
            break;
          }
          unsigned int v8 = 0;
          ++v11;
          v10 += 7;
          if (v11 == 5) {
            return v8;
          }
        }
        unsigned int v8 = &v33[v11 + 1];
      }
      else
      {
        unsigned int v8 = v33 + 2;
      }
    }
    uint64_t v33 = v8;
    if (v9 == 10)
    {
      --v8;
      while (1)
      {
        unsigned int v14 = v8 + 1;
        uint64_t v33 = v8 + 1;
        std::string::size_type v15 = *(int **)(a1 + 56);
        if (!v15) {
          break;
        }
        int v16 = *(_DWORD *)(a1 + 48);
        int v17 = *v15;
        if (v16 >= *v15)
        {
          if (v17 == *(_DWORD *)(a1 + 52))
          {
LABEL_24:
            if (v16 <= v17)
            {
              sub_25C14C1A8(v7, v17 - v16 + 1);
              std::string::size_type v15 = *(int **)(a1 + 56);
            }
            int v17 = *v15;
          }
          *std::string::size_type v15 = v17 + 1;
          std::string::size_type v18 = sub_25C14ED9C(*(void *)(a1 + 40));
          uint64_t v19 = *(void *)(a1 + 56);
          uint64_t v20 = *(int *)(a1 + 48);
          *(_DWORD *)(a1 + 48) = v20 + 1;
          *(void *)(v19 + 8 * v20 + 8) = v18;
          goto LABEL_28;
        }
        *(_DWORD *)(a1 + 48) = v16 + 1;
        std::string::size_type v18 = *(void **)&v15[2 * v16 + 2];
LABEL_28:
        int v21 = *v14;
        if (*v14 < 0)
        {
          uint64_t v23 = sub_25C14B1B0((uint64_t)(v8 + 1), v21);
          if (!v23) {
            return 0;
          }
          uint64_t v22 = (char *)v23;
        }
        else
        {
          uint64_t v22 = v8 + 2;
        }
        int32x2_t v24 = a3[1];
        int v25 = v21 + v22 - v24.i32[0];
        *a3 = (int32x2_t)(*(void *)&v24 + (v25 & (v25 >> 31)));
        __int32 v26 = a3[3].i32[1];
        a3[3].i32[1] = v25;
        v24.i32[0] = a3[11].i32[0];
        BOOL v27 = __OFSUB__(v24.i32[0]--, 1);
        a3[11].i32[0] = v24.i32[0];
        if (v24.i32[0] < 0 != v27) {
          return 0;
        }
        int v28 = sub_25C14E92C((uint64_t)v18, v22, a3);
        unsigned int v8 = v28;
        if (!v28) {
          return v8;
        }
        ++a3[11].i32[0];
        if (a3[10].i32[0]) {
          return 0;
        }
        int v29 = a3[3].i32[1] + v26 - v25;
        a3[3].i32[1] = v29;
        int32x2_t v30 = (int32x2_t)(*(void *)&a3[1] + (v29 & (v29 >> 31)));
        *a3 = v30;
        uint64_t v33 = v28;
        if (*(void *)&v30 <= (unint64_t)v28 || *v28 != 10) {
          goto LABEL_2;
        }
      }
      int v16 = *(_DWORD *)(a1 + 48);
      int v17 = *(_DWORD *)(a1 + 52);
      goto LABEL_24;
    }
    if (v9) {
      BOOL v12 = (v9 & 7) == 4;
    }
    else {
      BOOL v12 = 1;
    }
    if (v12)
    {
      a3[10].i32[0] = v9 - 1;
      return v8;
    }
    if (v9 < 0x640)
    {
      if (*v5) {
        int v31 = (std::string *)((*v5 & 0xFFFFFFFFFFFFFFFELL) + 8);
      }
      else {
        int v31 = (std::string *)sub_25C142B28(v5);
      }
      uint64_t v34 = v31;
      unsigned int v13 = (char *)sub_25C14B72C(v9, &v34, v8, a3);
    }
    else
    {
      unsigned int v13 = (char *)sub_25C140F2C(v6, v9, v8, (uint64_t)&unk_26A596388, v5, a3);
    }
    uint64_t v33 = v13;
  }
  while (v13);
  return 0;
}

uint64_t sub_25C14F5AC(uint64_t a1)
{
  return *(unsigned int *)(a1 + 64);
}

uint64_t sub_25C14F5B4(uint64_t a1)
{
  uint64_t v2 = sub_25C145C50(a1 + 16);
  uint64_t v3 = *(int *)(a1 + 48);
  uint64_t v4 = v2 + v3;
  uint64_t v5 = *(void *)(a1 + 56);
  if (v5) {
    unint64_t v6 = (uint64_t *)(v5 + 8);
  }
  else {
    unint64_t v6 = 0;
  }
  if (v3)
  {
    uint64_t v7 = 8 * v3;
    do
    {
      uint64_t v8 = *v6++;
      uint64_t v9 = sub_25C14EB00(v8);
      v4 += v9 + ((9 * (__clz(v9 | 1) ^ 0x1F) + 73) >> 6);
      v7 -= 8;
    }
    while (v7);
  }
  uint64_t v10 = *(void *)(a1 + 8);
  if (v10)
  {
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v12 + 31) < 0) {
      uint64_t v13 = *(void *)(v12 + 16);
    }
    else {
      uint64_t v13 = *(unsigned __int8 *)(v12 + 31);
    }
    v4 += v13;
  }
  *(_DWORD *)(a1 + 64) = v4;
  return v4;
}

void sub_25C14F668(uint64_t a1, uint64_t a2)
{
  sub_25C13FC28(a1 + 16, a2 + 16);
  uint64_t v4 = *(void *)(a2 + 8);
  if (v4)
  {
    unint64_t v5 = v4 & 0xFFFFFFFFFFFFFFFELL;
    unint64_t v6 = (v4 & 0xFFFFFFFFFFFFFFFELL) + 8;
    uint64_t v7 = *(void *)(a1 + 8);
    if (v7) {
      uint64_t v8 = (std::string *)((v7 & 0xFFFFFFFFFFFFFFFELL) + 8);
    }
    else {
      uint64_t v8 = (std::string *)sub_25C142B28((unint64_t *)(a1 + 8));
    }
    int v9 = *(char *)(v5 + 31);
    if (v9 >= 0) {
      uint64_t v10 = (const std::string::value_type *)v6;
    }
    else {
      uint64_t v10 = *(const std::string::value_type **)(v5 + 8);
    }
    if (v9 >= 0) {
      std::string::size_type v11 = *(unsigned __int8 *)(v5 + 31);
    }
    else {
      std::string::size_type v11 = *(void *)(v5 + 16);
    }
    std::string::append(v8, v10, v11);
  }
  int v12 = *(_DWORD *)(a2 + 48);
  if (v12)
  {
    uint64_t v33 = *(void *)(a2 + 56);
    uint64_t v13 = sub_25C14C1A8((uint64_t *)(a1 + 40), v12);
    uint64_t v14 = v13;
    uint64_t v15 = **(int **)(a1 + 56);
    uint64_t v16 = *(int *)(a1 + 48);
    int v17 = v15 - v16;
    if ((int)v15 - (int)v16 >= v12) {
      uint64_t v18 = v12;
    }
    else {
      uint64_t v18 = v17;
    }
    if ((int)v18 >= 1)
    {
      uint64_t v19 = (uint64_t *)(v33 + 8);
      uint64_t v20 = (std::string **)v13;
      do
      {
        uint64_t v22 = *v19++;
        uint64_t v21 = v22;
        uint64_t v23 = *v20++;
        sub_25C14F7E0(v21, v23);
        --v18;
      }
      while (v18);
    }
    if (v17 < v12)
    {
      uint64_t v24 = *(void *)(a1 + 40);
      int v25 = v16 + v12 - v15;
      uint64_t v26 = 8 * v15 - 8 * v16;
      BOOL v27 = (std::string **)(v14 + v26);
      int v28 = (uint64_t *)(v26 + v33 + 8);
      do
      {
        uint64_t v29 = *v28++;
        int32x2_t v30 = (std::string *)sub_25C14ED9C(v24);
        sub_25C14F7E0(v29, v30);
        *v27++ = v30;
        --v25;
      }
      while (v25);
    }
    int v31 = *(_DWORD *)(a1 + 48) + v12;
    *(_DWORD *)(a1 + 48) = v31;
    int v32 = *(int **)(a1 + 56);
    if (*v32 < v31) {
      *int v32 = v31;
    }
  }
}

std::string *sub_25C14F7E0(uint64_t a1, std::string *a2)
{
  return sub_25C14EBDC(a2, a1);
}

uint64_t sub_25C14F7F0(uint64_t a1)
{
  return sub_25C140D64(a1 + 16);
}

uint64_t sub_25C14F7F8(uint64_t a1)
{
  uint64_t result = (uint64_t)sub_25C13FB88((unsigned char *)(a1 + 16));
  uint64_t v3 = *(unsigned int *)(a1 + 48);
  if ((int)v3 >= 1)
  {
    uint64_t v4 = (uint64_t *)(*(void *)(a1 + 56) + 8);
    do
    {
      uint64_t v5 = *v4++;
      uint64_t result = sub_25C14ECF8(v5);
      --v3;
    }
    while (v3);
    *(_DWORD *)(a1 + 48) = 0;
  }
  uint64_t v6 = *(void *)(a1 + 8);
  if (v6)
  {
    unint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v7 + 31) < 0)
    {
      **(unsigned char **)(v7 + 8) = 0;
      *(void *)(v7 + 16) = 0;
    }
    else
    {
      *(unsigned char *)(v7 + 8) = 0;
      *(unsigned char *)(v7 + 31) = 0;
    }
  }
  return result;
}

void *sub_25C14F87C(uint64_t a1, uint64_t a2)
{
  return sub_25C14F884(a2);
}

void *sub_25C14F884(uint64_t a1)
{
  if (!a1) {
    operator new();
  }
  if (*(unsigned char *)(a1 + 24)) {
    (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(a1 + 32) + 32) + 40))(*(void *)(*(void *)(a1 + 32) + 32), &unk_270988FF8, 72);
  }
  uint64_t v2 = sub_25C1363A0((void *)a1, 0x48uLL);
  sub_25C14F030((uint64_t)v2, a1);
  return v2;
}

void sub_25C14F930(_Unwind_Exception *a1)
{
  MEMORY[0x26117F4A0](v1, 0x10A1C4075D007F8);
  _Unwind_Resume(a1);
}

void *sub_25C14F954()
{
  return sub_25C14F884(0);
}

void *sub_25C14F95C@<X0>(void *a1@<X8>)
{
  return sub_25C13C824(a1, "sentencepiece.SelfTestData");
}

void sub_25C14F96C(uint64_t a1)
{
  sub_25C14D0BC(*(void *)(a1 + 8));
  sub_25C14F0D4((void *)(a1 + 40));
  sub_25C13DB80(a1 + 16);

  JUMPOUT(0x26117F4A0);
}

uint64_t sub_25C14F9C8(uint64_t a1)
{
  return a1;
}

void sub_25C14FA04()
{
  sub_25C14FA58((uint64_t)&unk_26A596338, 0);

  sub_25C147DA8((uint64_t)sub_25C1474BC, (uint64_t)&unk_26A596338);
}

uint64_t sub_25C14FA58(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_270989698;
  *(void *)(a1 + 8) = a2;
  *(void *)(a1 + 16) = a2;
  *(_DWORD *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  if (atomic_load_explicit(dword_26B34E4E8, memory_order_acquire)) {
    sub_25C1475A0(dword_26B34E4E8);
  }
  *(void *)(a1 + 48) = &qword_26A5963D0;
  *(void *)(a1 + 56) = &qword_26A5963D0;
  *(void *)(a1 + 64) = &qword_26A5963D0;
  *(_WORD *)(a1 + 72) = 257;
  *(unsigned char *)(a1 + 74) = 1;
  return a1;
}

void sub_25C14FAE8(_Unwind_Exception *a1)
{
  sub_25C13DB80(v1);
  _Unwind_Resume(a1);
}

char *sub_25C14FAFC(uint64_t a1, char *a2, void *a3)
{
  uint64_t v4 = a2;
  int v6 = *(_DWORD *)(a1 + 40);
  if (v6)
  {
    uint64_t v4 = sub_25C14C714(a3, 1u, (const void **)(*(void *)(a1 + 48) & 0xFFFFFFFFFFFFFFFELL), a2);
    if ((v6 & 2) == 0)
    {
LABEL_3:
      if ((v6 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_3;
  }
  uint64_t v4 = sub_25C14C714(a3, 2u, (const void **)(*(void *)(a1 + 56) & 0xFFFFFFFFFFFFFFFELL), v4);
  if ((v6 & 8) == 0)
  {
LABEL_4:
    if ((v6 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_12:
  if (*a3 <= (unint64_t)v4) {
    uint64_t v4 = (char *)sub_25C13CEE0((uint64_t)a3, (int)v4);
  }
  char v11 = *(unsigned char *)(a1 + 72);
  *uint64_t v4 = 24;
  v4[1] = v11;
  v4 += 2;
  if ((v6 & 0x10) == 0)
  {
LABEL_5:
    if ((v6 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_15:
  if (*a3 <= (unint64_t)v4) {
    uint64_t v4 = (char *)sub_25C13CEE0((uint64_t)a3, (int)v4);
  }
  char v12 = *(unsigned char *)(a1 + 73);
  *uint64_t v4 = 32;
  v4[1] = v12;
  v4 += 2;
  if ((v6 & 0x20) == 0)
  {
LABEL_6:
    if ((v6 & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_18:
  if (*a3 <= (unint64_t)v4) {
    uint64_t v4 = (char *)sub_25C13CEE0((uint64_t)a3, (int)v4);
  }
  char v13 = *(unsigned char *)(a1 + 74);
  *uint64_t v4 = 40;
  v4[1] = v13;
  v4 += 2;
  if ((v6 & 4) != 0) {
LABEL_7:
  }
    uint64_t v4 = sub_25C14C714(a3, 6u, (const void **)(*(void *)(a1 + 64) & 0xFFFFFFFFFFFFFFFELL), v4);
LABEL_8:
  unint64_t v7 = sub_25C142F0C(a1 + 16, v4, a3);
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)(a1 + 8);
  if ((v9 & 1) == 0) {
    return v8;
  }
  unint64_t v14 = v9 & 0xFFFFFFFFFFFFFFFELL;
  if (*(char *)(v14 + 31) < 0)
  {
    uint64_t v15 = *(void **)(v14 + 8);
    uint64_t v16 = *(void *)(v14 + 16);
  }
  else
  {
    uint64_t v15 = (void *)(v14 + 8);
    LODWORD(v16) = *(unsigned __int8 *)(v14 + 31);
  }
  if (*a3 - (void)v7 >= (int)v16)
  {
    uint64_t v17 = (int)v16;
    memcpy(v7, v15, (int)v16);
    v8 += v17;
    return v8;
  }

  return (char *)sub_25C13D00C(a3, (char *)v15, v16, v7);
}

char *sub_25C14FCD0(uint64_t a1, char *a2, int32x2_t *a3)
{
  int v5 = 0;
  char v40 = a2;
  int v6 = (unint64_t *)(a1 + 8);
  unint64_t v7 = (uint64_t **)(a1 + 64);
  uint64_t v8 = (uint64_t **)(a1 + 56);
  uint64_t v9 = (uint64_t **)(a1 + 48);
  uint64_t v10 = (uint64_t *)(a1 + 16);
LABEL_2:
  while (2)
  {
    if (sub_25C142E98((uint64_t)a3, &v40, a3[11].i32[1]))
    {
      char v11 = v40;
      goto LABEL_68;
    }
    char v11 = v40 + 1;
    unsigned int v12 = *v40;
    if (*v40 < 0)
    {
      unsigned int v12 = v12 + (*v11 << 7) - 128;
      if (*v11 < 0)
      {
        char v13 = 14;
        uint64_t v14 = 2;
        while (1)
        {
          v12 += (v40[v14] - 1) << v13;
          if ((v40[v14] & 0x80000000) == 0) {
            break;
          }
          ++v14;
          v13 += 7;
          if (v14 == 5)
          {
LABEL_70:
            char v11 = 0;
            goto LABEL_68;
          }
        }
        char v11 = &v40[v14 + 1];
      }
      else
      {
        char v11 = v40 + 2;
      }
    }
    char v40 = v11;
    switch(v12 >> 3)
    {
      case 1u:
        if (v12 != 10) {
          goto LABEL_39;
        }
        *(_DWORD *)(a1 + 40) |= 1u;
        uint64_t v15 = *(void *)(a1 + 8);
        uint64_t v16 = (void *)(v15 & 0xFFFFFFFFFFFFFFFELL);
        if (v15) {
          uint64_t v16 = (void *)*v16;
        }
        uint64_t v17 = v9;
        goto LABEL_36;
      case 2u:
        if (v12 != 18) {
          goto LABEL_39;
        }
        *(_DWORD *)(a1 + 40) |= 2u;
        uint64_t v18 = *(void *)(a1 + 8);
        uint64_t v16 = (void *)(v18 & 0xFFFFFFFFFFFFFFFELL);
        if (v18) {
          uint64_t v16 = (void *)*v16;
        }
        uint64_t v17 = v8;
        goto LABEL_36;
      case 3u:
        if (v12 != 24) {
          goto LABEL_39;
        }
        v5 |= 8u;
        uint64_t v19 = v11 + 1;
        uint64_t v20 = *v11;
        if ((*v11 & 0x80000000) == 0) {
          goto LABEL_61;
        }
        int v21 = *v19;
        uint64_t v20 = (v20 + (v21 << 7) - 128);
        if ((v21 & 0x80) == 0)
        {
          uint64_t v19 = v11 + 2;
          goto LABEL_61;
        }
        char v33 = 14;
        uint64_t v34 = 2;
        break;
      case 4u:
        if (v12 != 32) {
          goto LABEL_39;
        }
        v5 |= 0x10u;
        uint64_t v22 = v11 + 1;
        uint64_t v23 = *v11;
        if ((*v11 & 0x80000000) == 0) {
          goto LABEL_63;
        }
        int v24 = *v22;
        uint64_t v23 = (v23 + (v24 << 7) - 128);
        if ((v24 & 0x80) != 0)
        {
          char v35 = 14;
          uint64_t v36 = 2;
          while (1)
          {
            v23 += (v11[v36] - 1) << v35;
            if ((v11[v36] & 0x80000000) == 0) {
              break;
            }
            ++v36;
            v35 += 7;
            if (v36 == 10)
            {
              char v11 = 0;
              *(unsigned char *)(a1 + 73) = 0;
              goto LABEL_68;
            }
          }
          uint64_t v22 = &v11[v36 + 1];
        }
        else
        {
          uint64_t v22 = v11 + 2;
        }
LABEL_63:
        char v40 = v22;
        *(unsigned char *)(a1 + 73) = v23 != 0;
        continue;
      case 5u:
        if (v12 != 40) {
          goto LABEL_39;
        }
        v5 |= 0x20u;
        int v25 = v11 + 1;
        uint64_t v26 = *v11;
        if ((*v11 & 0x80000000) == 0) {
          goto LABEL_65;
        }
        int v27 = *v25;
        uint64_t v26 = (v26 + (v27 << 7) - 128);
        if ((v27 & 0x80) != 0)
        {
          char v37 = 14;
          uint64_t v38 = 2;
          while (1)
          {
            v26 += (v11[v38] - 1) << v37;
            if ((v11[v38] & 0x80000000) == 0) {
              break;
            }
            ++v38;
            v37 += 7;
            if (v38 == 10)
            {
              char v11 = 0;
              *(unsigned char *)(a1 + 74) = 0;
              goto LABEL_68;
            }
          }
          int v25 = &v11[v38 + 1];
        }
        else
        {
          int v25 = v11 + 2;
        }
LABEL_65:
        char v40 = v25;
        *(unsigned char *)(a1 + 74) = v26 != 0;
        continue;
      case 6u:
        if (v12 != 50) {
          goto LABEL_39;
        }
        *(_DWORD *)(a1 + 40) |= 4u;
        uint64_t v28 = *(void *)(a1 + 8);
        uint64_t v16 = (void *)(v28 & 0xFFFFFFFFFFFFFFFELL);
        if (v28) {
          uint64_t v16 = (void *)*v16;
        }
        uint64_t v17 = v7;
LABEL_36:
        uint64_t v29 = (std::string *)sub_25C1369B4(v17, (uint64_t)v16);
        int32x2_t v30 = (char *)sub_25C14B33C(v29, v11, (uint64_t)a3);
        goto LABEL_37;
      default:
LABEL_39:
        if (v12) {
          BOOL v31 = (v12 & 7) == 4;
        }
        else {
          BOOL v31 = 1;
        }
        if (v31)
        {
          a3[10].i32[0] = v12 - 1;
          goto LABEL_68;
        }
        if (v12 < 0x640)
        {
          if (*v6) {
            int v32 = (std::string *)((*v6 & 0xFFFFFFFFFFFFFFFELL) + 8);
          }
          else {
            int v32 = (std::string *)sub_25C142B28(v6);
          }
          uint64_t v41 = v32;
          int32x2_t v30 = (char *)sub_25C14B72C(v12, &v41, v11, a3);
        }
        else
        {
          int32x2_t v30 = (char *)sub_25C140F2C(v10, v12, v11, (uint64_t)&unk_26A596338, v6, a3);
        }
LABEL_37:
        char v40 = v30;
        if (!v30) {
          goto LABEL_70;
        }
        continue;
    }
    break;
  }
  do
  {
    v20 += (v11[v34] - 1) << v33;
    if ((v11[v34] & 0x80000000) == 0)
    {
      uint64_t v19 = &v11[v34 + 1];
LABEL_61:
      char v40 = v19;
      *(unsigned char *)(a1 + 72) = v20 != 0;
      goto LABEL_2;
    }
    ++v34;
    v33 += 7;
  }
  while (v34 != 10);
  char v11 = 0;
  *(unsigned char *)(a1 + 72) = 0;
LABEL_68:
  *(_DWORD *)(a1 + 40) |= v5;
  return v11;
}

uint64_t sub_25C150110(uint64_t a1)
{
  return *(unsigned int *)(a1 + 44);
}

uint64_t sub_25C150118(uint64_t a1)
{
  uint64_t result = sub_25C145C50(a1 + 16);
  int v3 = *(_DWORD *)(a1 + 40);
  if ((v3 & 0x3F) == 0) {
    goto LABEL_15;
  }
  if ((v3 & 1) == 0)
  {
    if ((v3 & 2) == 0) {
      goto LABEL_4;
    }
LABEL_20:
    unint64_t v12 = *(void *)(a1 + 56) & 0xFFFFFFFFFFFFFFFELL;
    uint64_t v13 = *(unsigned __int8 *)(v12 + 23);
    uint64_t v14 = *(void *)(v12 + 8);
    if ((v13 & 0x80u) == 0) {
      uint64_t v14 = v13;
    }
    result += v14 + ((9 * (__clz(v14 | 1) ^ 0x1F) + 73) >> 6) + 1;
    if ((v3 & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_5;
  }
  unint64_t v9 = *(void *)(a1 + 48) & 0xFFFFFFFFFFFFFFFELL;
  uint64_t v10 = *(unsigned __int8 *)(v9 + 23);
  uint64_t v11 = *(void *)(v9 + 8);
  if ((v10 & 0x80u) == 0) {
    uint64_t v11 = v10;
  }
  result += v11 + ((9 * (__clz(v11 | 1) ^ 0x1F) + 73) >> 6) + 1;
  if ((v3 & 2) != 0) {
    goto LABEL_20;
  }
LABEL_4:
  if ((v3 & 4) != 0)
  {
LABEL_5:
    unint64_t v4 = *(void *)(a1 + 64) & 0xFFFFFFFFFFFFFFFELL;
    uint64_t v5 = *(unsigned __int8 *)(v4 + 23);
    uint64_t v6 = *(void *)(v4 + 8);
    if ((v5 & 0x80u) == 0) {
      uint64_t v6 = v5;
    }
    result += v6 + ((9 * (__clz(v6 | 1) ^ 0x1F) + 73) >> 6) + 1;
  }
LABEL_8:
  uint64_t v7 = result + 2;
  if ((v3 & 8) == 0) {
    uint64_t v7 = result;
  }
  if ((v3 & 0x10) != 0) {
    v7 += 2;
  }
  if ((v3 & 0x20) != 0) {
    uint64_t result = v7 + 2;
  }
  else {
    uint64_t result = v7;
  }
LABEL_15:
  uint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    unint64_t v15 = v8 & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v15 + 31) < 0) {
      uint64_t v16 = *(void *)(v15 + 16);
    }
    else {
      uint64_t v16 = *(unsigned __int8 *)(v15 + 31);
    }
    result += v16;
  }
  *(_DWORD *)(a1 + 44) = result;
  return result;
}

void sub_25C150278(uint64_t a1, uint64_t a2)
{
  sub_25C13FC28(a1 + 16, a2 + 16);
  uint64_t v4 = *(void *)(a2 + 8);
  if (v4)
  {
    unint64_t v5 = v4 & 0xFFFFFFFFFFFFFFFELL;
    unint64_t v6 = (v4 & 0xFFFFFFFFFFFFFFFELL) + 8;
    uint64_t v7 = *(void *)(a1 + 8);
    if (v7) {
      uint64_t v8 = (std::string *)((v7 & 0xFFFFFFFFFFFFFFFELL) + 8);
    }
    else {
      uint64_t v8 = (std::string *)sub_25C142B28((unint64_t *)(a1 + 8));
    }
    int v9 = *(char *)(v5 + 31);
    if (v9 >= 0) {
      uint64_t v10 = (const std::string::value_type *)v6;
    }
    else {
      uint64_t v10 = *(const std::string::value_type **)(v5 + 8);
    }
    if (v9 >= 0) {
      std::string::size_type v11 = *(unsigned __int8 *)(v5 + 31);
    }
    else {
      std::string::size_type v11 = *(void *)(v5 + 16);
    }
    std::string::append(v8, v10, v11);
  }
  int v12 = *(_DWORD *)(a2 + 40);
  if ((v12 & 0x3F) != 0)
  {
    if (v12)
    {
      uint64_t v13 = (long long *)(*(void *)(a2 + 48) & 0xFFFFFFFFFFFFFFFELL);
      *(_DWORD *)(a1 + 40) |= 1u;
      uint64_t v14 = *(void *)(a1 + 8);
      unint64_t v15 = (void *)(v14 & 0xFFFFFFFFFFFFFFFELL);
      if (v14) {
        unint64_t v15 = (void *)*v15;
      }
      sub_25C136668((void *)(a1 + 48), (uint64_t)&qword_26A5963D0, v13, (uint64_t)v15);
      if ((v12 & 2) == 0)
      {
LABEL_14:
        if ((v12 & 4) == 0) {
          goto LABEL_15;
        }
        goto LABEL_27;
      }
    }
    else if ((v12 & 2) == 0)
    {
      goto LABEL_14;
    }
    uint64_t v16 = (long long *)(*(void *)(a2 + 56) & 0xFFFFFFFFFFFFFFFELL);
    *(_DWORD *)(a1 + 40) |= 2u;
    uint64_t v17 = *(void *)(a1 + 8);
    uint64_t v18 = (void *)(v17 & 0xFFFFFFFFFFFFFFFELL);
    if (v17) {
      uint64_t v18 = (void *)*v18;
    }
    sub_25C136668((void *)(a1 + 56), (uint64_t)&qword_26A5963D0, v16, (uint64_t)v18);
    if ((v12 & 4) == 0)
    {
LABEL_15:
      if ((v12 & 8) == 0) {
        goto LABEL_16;
      }
      goto LABEL_30;
    }
LABEL_27:
    uint64_t v19 = (long long *)(*(void *)(a2 + 64) & 0xFFFFFFFFFFFFFFFELL);
    *(_DWORD *)(a1 + 40) |= 4u;
    uint64_t v20 = *(void *)(a1 + 8);
    int v21 = (void *)(v20 & 0xFFFFFFFFFFFFFFFELL);
    if (v20) {
      int v21 = (void *)*v21;
    }
    sub_25C136668((void *)(a1 + 64), (uint64_t)&qword_26A5963D0, v19, (uint64_t)v21);
    if ((v12 & 8) == 0)
    {
LABEL_16:
      if ((v12 & 0x10) == 0) {
        goto LABEL_17;
      }
      goto LABEL_31;
    }
LABEL_30:
    *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
    if ((v12 & 0x10) == 0)
    {
LABEL_17:
      if ((v12 & 0x20) == 0)
      {
LABEL_19:
        *(_DWORD *)(a1 + 40) |= v12;
        return;
      }
LABEL_18:
      *(unsigned char *)(a1 + 74) = *(unsigned char *)(a2 + 74);
      goto LABEL_19;
    }
LABEL_31:
    *(unsigned char *)(a1 + 73) = *(unsigned char *)(a2 + 73);
    if ((v12 & 0x20) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
}

uint64_t sub_25C150400(uint64_t a1)
{
  return sub_25C140D64(a1 + 16);
}

unsigned char *sub_25C150408(uint64_t a1)
{
  uint64_t result = sub_25C13FB88((unsigned char *)(a1 + 16));
  int v3 = *(_DWORD *)(a1 + 40);
  if ((v3 & 0x3F) != 0)
  {
    if ((v3 & 1) == 0)
    {
      if ((v3 & 2) == 0) {
        goto LABEL_4;
      }
LABEL_10:
      unint64_t v5 = *(void *)(a1 + 56) & 0xFFFFFFFFFFFFFFFELL;
      if (*(char *)(v5 + 23) < 0)
      {
        **(unsigned char **)unint64_t v5 = 0;
        *(void *)(v5 + 8) = 0;
        if ((v3 & 4) == 0)
        {
LABEL_17:
          *(_WORD *)(a1 + 72) = 257;
          *(unsigned char *)(a1 + 74) = 1;
          goto LABEL_18;
        }
      }
      else
      {
        *(unsigned char *)unint64_t v5 = 0;
        *(unsigned char *)(v5 + 23) = 0;
        if ((v3 & 4) == 0) {
          goto LABEL_17;
        }
      }
LABEL_14:
      unint64_t v6 = *(void *)(a1 + 64) & 0xFFFFFFFFFFFFFFFELL;
      if (*(char *)(v6 + 23) < 0)
      {
        **(unsigned char **)unint64_t v6 = 0;
        *(void *)(v6 + 8) = 0;
      }
      else
      {
        *(unsigned char *)unint64_t v6 = 0;
        *(unsigned char *)(v6 + 23) = 0;
      }
      goto LABEL_17;
    }
    unint64_t v4 = *(void *)(a1 + 48) & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v4 + 23) < 0)
    {
      **(unsigned char **)unint64_t v4 = 0;
      *(void *)(v4 + 8) = 0;
      if ((v3 & 2) != 0) {
        goto LABEL_10;
      }
    }
    else
    {
      *(unsigned char *)unint64_t v4 = 0;
      *(unsigned char *)(v4 + 23) = 0;
      if ((v3 & 2) != 0) {
        goto LABEL_10;
      }
    }
LABEL_4:
    if ((v3 & 4) == 0) {
      goto LABEL_17;
    }
    goto LABEL_14;
  }
LABEL_18:
  *(_DWORD *)(a1 + 40) = 0;
  uint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    unint64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v8 + 31) < 0)
    {
      **(unsigned char **)(v8 + 8) = 0;
      *(void *)(v8 + 16) = 0;
    }
    else
    {
      *(unsigned char *)(v8 + 8) = 0;
      *(unsigned char *)(v8 + 31) = 0;
    }
  }
  return result;
}

void *sub_25C150514(uint64_t a1, uint64_t a2)
{
  return sub_25C15051C(a2);
}

void *sub_25C15051C(uint64_t a1)
{
  if (!a1) {
    operator new();
  }
  if (*(unsigned char *)(a1 + 24)) {
    (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(a1 + 32) + 32) + 40))(*(void *)(*(void *)(a1 + 32) + 32), &unk_270989020, 80);
  }
  uint64_t v2 = sub_25C1363A0((void *)a1, 0x50uLL);
  sub_25C14FA58((uint64_t)v2, a1);
  return v2;
}

void sub_25C1505C8(_Unwind_Exception *a1)
{
  MEMORY[0x26117F4A0](v1, 0x10A1C406853ED09);
  _Unwind_Resume(a1);
}

void *sub_25C1505EC()
{
  return sub_25C15051C(0);
}

void *sub_25C1505F4@<X0>(void *a1@<X8>)
{
  return sub_25C13C824(a1, "sentencepiece.NormalizerSpec");
}

void sub_25C150604(uint64_t *a1)
{
  sub_25C15063C(a1);

  JUMPOUT(0x26117F4A0);
}

uint64_t *sub_25C15063C(uint64_t *a1)
{
  uint64_t v2 = a1[6];
  if ((uint64_t *)v2 != &qword_26A5963D0)
  {
    if (*(char *)(v2 + 23) < 0) {
      operator delete(*(void **)v2);
    }
    MEMORY[0x26117F4A0](v2, 0x1012C40EC159624);
  }
  uint64_t v3 = a1[7];
  if ((uint64_t *)v3 != &qword_26A5963D0)
  {
    if (*(char *)(v3 + 23) < 0) {
      operator delete(*(void **)v3);
    }
    MEMORY[0x26117F4A0](v3, 0x1012C40EC159624);
  }
  uint64_t v4 = a1[8];
  if ((uint64_t *)v4 != &qword_26A5963D0)
  {
    if (*(char *)(v4 + 23) < 0) {
      operator delete(*(void **)v4);
    }
    MEMORY[0x26117F4A0](v4, 0x1012C40EC159624);
  }
  sub_25C14D0BC(a1[1]);
  sub_25C13DB80((uint64_t)(a1 + 2));
  return a1;
}

void sub_25C150720()
{
  sub_25C150774((uint64_t)&unk_26A5963E8, 0);

  sub_25C147DA8((uint64_t)sub_25C1474BC, (uint64_t)&unk_26A5963E8);
}

uint64_t sub_25C150774(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_2709894C0;
  *(void *)(a1 + 8) = a2;
  *(void *)(a1 + 16) = a2;
  *(void *)(a1 + 56) = a2;
  *(_DWORD *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  *(_DWORD *)(a1 + 48) = 0;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = a2;
  *(void *)(a1 + 88) = 0;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = a2;
  *(void *)(a1 + 128) = a2;
  *(void *)(a1 + 112) = 0;
  *(void *)(a1 + 120) = 0;
  *(void *)(a1 + 136) = 0;
  *(void *)(a1 + 144) = 0;
  if (atomic_load_explicit(dword_26B34E570, memory_order_acquire)) {
    sub_25C1475A0(dword_26B34E570);
  }
  *(void *)(a1 + 152) = &qword_26A5963D0;
  *(void *)(a1 + 160) = &qword_26A5963D0;
  *(void *)(a1 + 168) = &qword_26A5963D0;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(void *)(a1 + 256) = 0;
  *(void *)(a1 + 264) = 0x1F4000000001;
  *(void *)(a1 + 272) = 0xF42403F7FDF3BLL;
  *(_DWORD *)(a1 + 280) = 1061158912;
  *(_OWORD *)(a1 + 284) = xmmword_25C16DA10;
  *(_DWORD *)(a1 + 300) = 16843009;
  *(_WORD *)(a1 + 304) = 257;
  *(_DWORD *)(a1 + 308) = 1;
  *(void *)(a1 + 312) = 0xFFFFFFFF00000002;
  return a1;
}

void sub_25C1508A4(_Unwind_Exception *a1)
{
  sub_25C14C2D4(v5);
  sub_25C14C2D4(v4);
  sub_25C14C2D4(v3);
  sub_25C14C2D4(v2);
  sub_25C13DB80(v1);
  _Unwind_Resume(a1);
}

char *sub_25C1508D8(uint64_t a1, unsigned char *a2, _DWORD *a3)
{
  uint64_t v6 = *(unsigned int *)(a1 + 64);
  if ((int)v6 >= 1)
  {
    uint64_t v7 = 0;
    uint64_t v8 = 8 * v6;
    do
    {
      int v9 = *(void **)(*(void *)(a1 + 72) + v7 + 8);
      if (*((char *)v9 + 23) < 0)
      {
        int64_t v10 = v9[1];
        if (v10 > 127) {
          goto LABEL_12;
        }
      }
      else
      {
        int64_t v10 = *((unsigned __int8 *)v9 + 23);
      }
      if (*(void *)a3 - (void)a2 + 14 >= v10)
      {
        *a2 = 10;
        a2[1] = v10;
        if (*((char *)v9 + 23) < 0) {
          int v9 = (void *)*v9;
        }
        std::string::size_type v11 = a2 + 2;
        memcpy(a2 + 2, v9, v10);
        a2 = &v11[v10];
        goto LABEL_10;
      }
LABEL_12:
      a2 = (unsigned char *)sub_25C13D3B8(a3, 1, (uint64_t)v9, a2);
LABEL_10:
      v7 += 8;
    }
    while (v8 != v7);
  }
  int v12 = *(_DWORD *)(a1 + 40);
  if (v12)
  {
    a2 = sub_25C14C714(a3, 2u, (const void **)(*(void *)(a1 + 152) & 0xFFFFFFFFFFFFFFFELL), a2);
    if ((v12 & 0x400000) == 0)
    {
LABEL_15:
      if ((v12 & 0x800000) == 0) {
        goto LABEL_37;
      }
      goto LABEL_16;
    }
  }
  else if ((v12 & 0x400000) == 0)
  {
    goto LABEL_15;
  }
  if (*(void *)a3 <= (unint64_t)a2) {
    a2 = sub_25C13CEE0((uint64_t)a3, (int)a2);
  }
  unint64_t v14 = *(int *)(a1 + 264);
  *a2 = 24;
  if (v14 > 0x7F)
  {
    a2[1] = v14 | 0x80;
    unint64_t v16 = v14 >> 7;
    if (v14 >> 14)
    {
      int v21 = a2 + 2;
      do
      {
        uint64_t v22 = v21;
        *v21++ = v16 | 0x80;
        unint64_t v23 = v16 >> 7;
        unint64_t v24 = v16 >> 14;
        v16 >>= 7;
      }
      while (v24);
      a2 = v22 + 2;
      *int v21 = v23;
      if ((v12 & 0x800000) == 0) {
        goto LABEL_37;
      }
    }
    else
    {
      a2[2] = v16;
      a2 += 3;
      if ((v12 & 0x800000) == 0) {
        goto LABEL_37;
      }
    }
  }
  else
  {
    a2[1] = v14;
    a2 += 2;
    if ((v12 & 0x800000) == 0) {
      goto LABEL_37;
    }
  }
LABEL_16:
  if (*(void *)a3 <= (unint64_t)a2) {
    a2 = sub_25C13CEE0((uint64_t)a3, (int)a2);
  }
  unint64_t v13 = *(int *)(a1 + 268);
  *a2 = 32;
  if (v13 > 0x7F)
  {
    a2[1] = v13 | 0x80;
    unint64_t v15 = v13 >> 7;
    if (v13 >> 14)
    {
      uint64_t v17 = a2 + 2;
      do
      {
        uint64_t v18 = v17;
        *v17++ = v15 | 0x80;
        unint64_t v19 = v15 >> 7;
        unint64_t v20 = v15 >> 14;
        v15 >>= 7;
      }
      while (v20);
      a2 = v18 + 2;
      unsigned char *v17 = v19;
    }
    else
    {
      a2[2] = v15;
      a2 += 3;
    }
  }
  else
  {
    a2[1] = v13;
    a2 += 2;
  }
LABEL_37:
  uint64_t v25 = *(unsigned int *)(a1 + 88);
  if ((int)v25 >= 1)
  {
    uint64_t v26 = 0;
    uint64_t v27 = 8 * v25;
    do
    {
      uint64_t v28 = *(void **)(*(void *)(a1 + 96) + v26 + 8);
      if (*((char *)v28 + 23) < 0)
      {
        int64_t v29 = v28[1];
        if (v29 > 127) {
          goto LABEL_48;
        }
      }
      else
      {
        int64_t v29 = *((unsigned __int8 *)v28 + 23);
      }
      if (*(void *)a3 - (void)a2 + 14 >= v29)
      {
        *a2 = 42;
        a2[1] = v29;
        if (*((char *)v28 + 23) < 0) {
          uint64_t v28 = (void *)*v28;
        }
        int32x2_t v30 = a2 + 2;
        memcpy(a2 + 2, v28, v29);
        a2 = &v30[v29];
        goto LABEL_46;
      }
LABEL_48:
      a2 = (unsigned char *)sub_25C13D3B8(a3, 5, (uint64_t)v28, a2);
LABEL_46:
      v26 += 8;
    }
    while (v27 != v26);
  }
  if ((v12 & 0x100) != 0)
  {
    if (*(void *)a3 <= (unint64_t)a2) {
      a2 = sub_25C13CEE0((uint64_t)a3, (int)a2);
    }
    unint64_t v31 = *(int *)(a1 + 216);
    *a2 = 48;
    if (v31 > 0x7F)
    {
      a2[1] = v31 | 0x80;
      unint64_t v32 = v31 >> 7;
      if (v31 >> 14)
      {
        char v33 = a2 + 2;
        do
        {
          uint64_t v34 = v33;
          *v33++ = v32 | 0x80;
          unint64_t v35 = v32 >> 7;
          unint64_t v36 = v32 >> 14;
          v32 >>= 7;
        }
        while (v36);
        a2 = v34 + 2;
        unsigned char *v33 = v35;
        if ((v12 & 2) != 0) {
          goto LABEL_74;
        }
      }
      else
      {
        a2[2] = v32;
        a2 += 3;
        if ((v12 & 2) != 0) {
          goto LABEL_74;
        }
      }
    }
    else
    {
      a2[1] = v31;
      a2 += 2;
      if ((v12 & 2) != 0) {
        goto LABEL_74;
      }
    }
LABEL_51:
    if ((v12 & 0x1000000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_75;
  }
  if ((v12 & 2) == 0) {
    goto LABEL_51;
  }
LABEL_74:
  a2 = sub_25C14C714(a3, 7u, (const void **)(*(void *)(a1 + 160) & 0xFFFFFFFFFFFFFFFELL), a2);
  if ((v12 & 0x1000000) == 0)
  {
LABEL_52:
    if ((v12 & 0x400) == 0) {
      goto LABEL_53;
    }
    goto LABEL_78;
  }
LABEL_75:
  if (*(void *)a3 <= (unint64_t)a2) {
    a2 = sub_25C13CEE0((uint64_t)a3, (int)a2);
  }
  int v37 = *(_DWORD *)(a1 + 272);
  *a2 = 85;
  *(_DWORD *)(a2 + 1) = v37;
  a2 += 5;
  if ((v12 & 0x400) == 0)
  {
LABEL_53:
    if ((v12 & 0x200) == 0) {
      goto LABEL_54;
    }
LABEL_89:
    if (*(void *)a3 <= (unint64_t)a2) {
      a2 = sub_25C13CEE0((uint64_t)a3, (int)a2);
    }
    unint64_t v44 = *(int *)(a1 + 220);
    *a2 = 96;
    if (v44 > 0x7F)
    {
      a2[1] = v44 | 0x80;
      unint64_t v45 = v44 >> 7;
      if (v44 >> 14)
      {
        unint64_t v46 = a2 + 2;
        do
        {
          unint64_t v47 = v46;
          *v46++ = v45 | 0x80;
          unint64_t v48 = v45 >> 7;
          unint64_t v49 = v45 >> 14;
          v45 >>= 7;
        }
        while (v49);
        a2 = v47 + 2;
        *unint64_t v46 = v48;
        if ((v12 & 0x800) != 0) {
          goto LABEL_100;
        }
      }
      else
      {
        a2[2] = v45;
        a2 += 3;
        if ((v12 & 0x800) != 0) {
          goto LABEL_100;
        }
      }
    }
    else
    {
      a2[1] = v44;
      a2 += 2;
      if ((v12 & 0x800) != 0) {
        goto LABEL_100;
      }
    }
LABEL_55:
    if ((v12 & 0x2000000) == 0) {
      goto LABEL_56;
    }
LABEL_111:
    if (*(void *)a3 <= (unint64_t)a2) {
      a2 = sub_25C13CEE0((uint64_t)a3, (int)a2);
    }
    unint64_t v56 = *(int *)(a1 + 276);
    *a2 = 112;
    if (v56 > 0x7F)
    {
      a2[1] = v56 | 0x80;
      unint64_t v57 = v56 >> 7;
      if (v56 >> 14)
      {
        unint64_t v58 = a2 + 2;
        do
        {
          int v59 = v58;
          *v58++ = v57 | 0x80;
          unint64_t v60 = v57 >> 7;
          unint64_t v61 = v57 >> 14;
          v57 >>= 7;
        }
        while (v61);
        a2 = v59 + 2;
        unsigned char *v58 = v60;
        if ((v12 & 0x4000000) != 0) {
          goto LABEL_122;
        }
      }
      else
      {
        a2[2] = v57;
        a2 += 3;
        if ((v12 & 0x4000000) != 0) {
          goto LABEL_122;
        }
      }
    }
    else
    {
      a2[1] = v56;
      a2 += 2;
      if ((v12 & 0x4000000) != 0) {
        goto LABEL_122;
      }
    }
LABEL_57:
    if ((v12 & 0x8000000) == 0) {
      goto LABEL_58;
    }
LABEL_125:
    if (*(void *)a3 <= (unint64_t)a2) {
      a2 = sub_25C13CEE0((uint64_t)a3, (int)a2);
    }
    unint64_t v63 = *(int *)(a1 + 284);
    *(_WORD *)a2 = 384;
    if (v63 > 0x7F)
    {
      a2[2] = v63 | 0x80;
      unint64_t v64 = v63 >> 7;
      if (v63 >> 14)
      {
        uint64_t v65 = a2 + 3;
        do
        {
          uint64_t v66 = v65;
          *v65++ = v64 | 0x80;
          unint64_t v67 = v64 >> 7;
          unint64_t v68 = v64 >> 14;
          v64 >>= 7;
        }
        while (v68);
        a2 = v66 + 2;
        *uint64_t v65 = v67;
        if ((v12 & 0x10000000) != 0) {
          goto LABEL_136;
        }
      }
      else
      {
        a2[3] = v64;
        a2 += 4;
        if ((v12 & 0x10000000) != 0) {
          goto LABEL_136;
        }
      }
    }
    else
    {
      a2[2] = v63;
      a2 += 3;
      if ((v12 & 0x10000000) != 0) {
        goto LABEL_136;
      }
    }
LABEL_59:
    if ((v12 & 0x20000000) == 0) {
      goto LABEL_60;
    }
LABEL_147:
    if (*(void *)a3 <= (unint64_t)a2) {
      a2 = sub_25C13CEE0((uint64_t)a3, (int)a2);
    }
    unint64_t v75 = *(int *)(a1 + 292);
    *(_WORD *)a2 = 400;
    if (v75 > 0x7F)
    {
      a2[2] = v75 | 0x80;
      unint64_t v76 = v75 >> 7;
      if (v75 >> 14)
      {
        size_t v77 = a2 + 3;
        do
        {
          int v78 = v77;
          *v77++ = v76 | 0x80;
          unint64_t v79 = v76 >> 7;
          unint64_t v80 = v76 >> 14;
          v76 >>= 7;
        }
        while (v80);
        a2 = v78 + 2;
        unsigned char *v77 = v79;
        if (v12 < 0) {
          goto LABEL_158;
        }
      }
      else
      {
        a2[3] = v76;
        a2 += 4;
        if (v12 < 0) {
          goto LABEL_158;
        }
      }
    }
    else
    {
      a2[2] = v75;
      a2 += 3;
      if (v12 < 0) {
        goto LABEL_158;
      }
    }
LABEL_61:
    if ((v12 & 0x40000000) == 0) {
      goto LABEL_170;
    }
    goto LABEL_161;
  }
LABEL_78:
  if (*(void *)a3 <= (unint64_t)a2) {
    a2 = sub_25C13CEE0((uint64_t)a3, (int)a2);
  }
  unint64_t v38 = *(void *)(a1 + 224);
  *a2 = 88;
  if (v38 > 0x7F)
  {
    a2[1] = v38 | 0x80;
    unint64_t v39 = v38 >> 7;
    if (v38 >> 14)
    {
      char v40 = a2 + 2;
      do
      {
        uint64_t v41 = v40;
        *v40++ = v39 | 0x80;
        unint64_t v42 = v39 >> 7;
        unint64_t v43 = v39 >> 14;
        v39 >>= 7;
      }
      while (v43);
      a2 = v41 + 2;
      unsigned char *v40 = v42;
      if ((v12 & 0x200) != 0) {
        goto LABEL_89;
      }
    }
    else
    {
      a2[2] = v39;
      a2 += 3;
      if ((v12 & 0x200) != 0) {
        goto LABEL_89;
      }
    }
  }
  else
  {
    a2[1] = v38;
    a2 += 2;
    if ((v12 & 0x200) != 0) {
      goto LABEL_89;
    }
  }
LABEL_54:
  if ((v12 & 0x800) == 0) {
    goto LABEL_55;
  }
LABEL_100:
  if (*(void *)a3 <= (unint64_t)a2) {
    a2 = sub_25C13CEE0((uint64_t)a3, (int)a2);
  }
  unint64_t v50 = *(int *)(a1 + 232);
  *a2 = 104;
  if (v50 > 0x7F)
  {
    a2[1] = v50 | 0x80;
    unint64_t v51 = v50 >> 7;
    if (v50 >> 14)
    {
      uint64_t v52 = a2 + 2;
      do
      {
        unint64_t v53 = v52;
        *v52++ = v51 | 0x80;
        unint64_t v54 = v51 >> 7;
        unint64_t v55 = v51 >> 14;
        v51 >>= 7;
      }
      while (v55);
      a2 = v53 + 2;
      unsigned char *v52 = v54;
      if ((v12 & 0x2000000) != 0) {
        goto LABEL_111;
      }
    }
    else
    {
      a2[2] = v51;
      a2 += 3;
      if ((v12 & 0x2000000) != 0) {
        goto LABEL_111;
      }
    }
  }
  else
  {
    a2[1] = v50;
    a2 += 2;
    if ((v12 & 0x2000000) != 0) {
      goto LABEL_111;
    }
  }
LABEL_56:
  if ((v12 & 0x4000000) == 0) {
    goto LABEL_57;
  }
LABEL_122:
  if (*(void *)a3 <= (unint64_t)a2) {
    a2 = sub_25C13CEE0((uint64_t)a3, (int)a2);
  }
  int v62 = *(_DWORD *)(a1 + 280);
  *a2 = 125;
  *(_DWORD *)(a2 + 1) = v62;
  a2 += 5;
  if ((v12 & 0x8000000) != 0) {
    goto LABEL_125;
  }
LABEL_58:
  if ((v12 & 0x10000000) == 0) {
    goto LABEL_59;
  }
LABEL_136:
  if (*(void *)a3 <= (unint64_t)a2) {
    a2 = sub_25C13CEE0((uint64_t)a3, (int)a2);
  }
  unint64_t v69 = *(int *)(a1 + 288);
  *(_WORD *)a2 = 392;
  if (v69 > 0x7F)
  {
    a2[2] = v69 | 0x80;
    unint64_t v70 = v69 >> 7;
    if (v69 >> 14)
    {
      uint64_t v71 = a2 + 3;
      do
      {
        uint64_t v72 = v71;
        *v71++ = v70 | 0x80;
        unint64_t v73 = v70 >> 7;
        unint64_t v74 = v70 >> 14;
        v70 >>= 7;
      }
      while (v74);
      a2 = v72 + 2;
      *uint64_t v71 = v73;
      if ((v12 & 0x20000000) != 0) {
        goto LABEL_147;
      }
    }
    else
    {
      a2[3] = v70;
      a2 += 4;
      if ((v12 & 0x20000000) != 0) {
        goto LABEL_147;
      }
    }
  }
  else
  {
    a2[2] = v69;
    a2 += 3;
    if ((v12 & 0x20000000) != 0) {
      goto LABEL_147;
    }
  }
LABEL_60:
  if ((v12 & 0x80000000) == 0) {
    goto LABEL_61;
  }
LABEL_158:
  if (*(void *)a3 <= (unint64_t)a2) {
    a2 = sub_25C13CEE0((uint64_t)a3, (int)a2);
  }
  char v81 = *(unsigned char *)(a1 + 300);
  *(_WORD *)a2 = 408;
  a2[2] = v81;
  a2 += 3;
  if ((v12 & 0x40000000) != 0)
  {
LABEL_161:
    if (*(void *)a3 <= (unint64_t)a2) {
      a2 = sub_25C13CEE0((uint64_t)a3, (int)a2);
    }
    unint64_t v82 = *(int *)(a1 + 296);
    *(_WORD *)a2 = 416;
    if (v82 > 0x7F)
    {
      a2[2] = v82 | 0x80;
      unint64_t v83 = v82 >> 7;
      if (v82 >> 14)
      {
        unint64_t v84 = a2 + 3;
        do
        {
          uint64_t v85 = v84;
          *v84++ = v83 | 0x80;
          unint64_t v86 = v83 >> 7;
          unint64_t v87 = v83 >> 14;
          v83 >>= 7;
        }
        while (v87);
        a2 = v85 + 2;
        *unint64_t v84 = v86;
      }
      else
      {
        a2[3] = v83;
        a2 += 4;
      }
    }
    else
    {
      a2[2] = v82;
      a2 += 3;
    }
  }
LABEL_170:
  int v88 = *(_DWORD *)(a1 + 44);
  if (v88)
  {
    if (*(void *)a3 <= (unint64_t)a2) {
      a2 = sub_25C13CEE0((uint64_t)a3, (int)a2);
    }
    char v89 = *(unsigned char *)(a1 + 301);
    *(_WORD *)a2 = 424;
    a2[2] = v89;
    a2 += 3;
    if ((v88 & 4) == 0)
    {
LABEL_172:
      if ((v88 & 2) == 0) {
        goto LABEL_183;
      }
      goto LABEL_180;
    }
  }
  else if ((v88 & 4) == 0)
  {
    goto LABEL_172;
  }
  if (*(void *)a3 <= (unint64_t)a2) {
    a2 = sub_25C13CEE0((uint64_t)a3, (int)a2);
  }
  char v90 = *(unsigned char *)(a1 + 303);
  *(_WORD *)a2 = 432;
  a2[2] = v90;
  a2 += 3;
  if ((v88 & 2) != 0)
  {
LABEL_180:
    if (*(void *)a3 <= (unint64_t)a2) {
      a2 = sub_25C13CEE0((uint64_t)a3, (int)a2);
    }
    char v91 = *(unsigned char *)(a1 + 302);
    *(_WORD *)a2 = 440;
    a2[2] = v91;
    a2 += 3;
  }
LABEL_183:
  int v92 = *(_DWORD *)(a1 + 40);
  if ((v92 & 0x2000) != 0)
  {
    if (*(void *)a3 <= (unint64_t)a2) {
      a2 = sub_25C13CEE0((uint64_t)a3, (int)a2);
    }
    char v93 = *(unsigned char *)(a1 + 237);
    *(_WORD *)a2 = 448;
    a2[2] = v93;
    a2 += 3;
    if ((v92 & 0x8000) == 0)
    {
LABEL_185:
      if ((v92 & 0x4000) == 0) {
        goto LABEL_196;
      }
      goto LABEL_193;
    }
  }
  else if ((v92 & 0x8000) == 0)
  {
    goto LABEL_185;
  }
  if (*(void *)a3 <= (unint64_t)a2) {
    a2 = sub_25C13CEE0((uint64_t)a3, (int)a2);
  }
  char v94 = *(unsigned char *)(a1 + 239);
  *(_WORD *)a2 = 456;
  a2[2] = v94;
  a2 += 3;
  if ((v92 & 0x4000) != 0)
  {
LABEL_193:
    if (*(void *)a3 <= (unint64_t)a2) {
      a2 = sub_25C13CEE0((uint64_t)a3, (int)a2);
    }
    char v95 = *(unsigned char *)(a1 + 238);
    *(_WORD *)a2 = 464;
    a2[2] = v95;
    a2 += 3;
  }
LABEL_196:
  uint64_t v96 = *(unsigned int *)(a1 + 112);
  if ((int)v96 >= 1)
  {
    uint64_t v97 = 0;
    uint64_t v98 = 8 * v96;
    do
    {
      int v99 = *(void **)(*(void *)(a1 + 120) + v97 + 8);
      if (*((char *)v99 + 23) < 0)
      {
        int64_t v100 = v99[1];
        if (v100 > 127) {
          goto LABEL_207;
        }
      }
      else
      {
        int64_t v100 = *((unsigned __int8 *)v99 + 23);
      }
      if (*(void *)a3 - (void)a2 + 13 >= v100)
      {
        *(_WORD *)a2 = 498;
        a2[2] = v100;
        if (*((char *)v99 + 23) < 0) {
          int v99 = (void *)*v99;
        }
        unint64_t v101 = a2 + 3;
        memcpy(a2 + 3, v99, v100);
        a2 = &v101[v100];
        goto LABEL_205;
      }
LABEL_207:
      a2 = (unsigned char *)sub_25C13D3B8(a3, 30, (uint64_t)v99, a2);
LABEL_205:
      v97 += 8;
    }
    while (v98 != v97);
  }
  uint64_t v102 = *(unsigned int *)(a1 + 136);
  if ((int)v102 >= 1)
  {
    uint64_t v103 = 0;
    uint64_t v104 = 8 * v102;
    do
    {
      uint64_t v105 = *(void **)(*(void *)(a1 + 144) + v103 + 8);
      if (*((char *)v105 + 23) < 0)
      {
        int64_t v106 = v105[1];
        if (v106 > 127) {
          goto LABEL_219;
        }
      }
      else
      {
        int64_t v106 = *((unsigned __int8 *)v105 + 23);
      }
      if (*(void *)a3 - (void)a2 + 13 >= v106)
      {
        *(_WORD *)a2 = 506;
        a2[2] = v106;
        if (*((char *)v105 + 23) < 0) {
          uint64_t v105 = (void *)*v105;
        }
        std::string::size_type v107 = a2 + 3;
        memcpy(a2 + 3, v105, v106);
        a2 = &v107[v106];
        goto LABEL_217;
      }
LABEL_219:
      a2 = (unsigned char *)sub_25C13D3B8(a3, 31, (uint64_t)v105, a2);
LABEL_217:
      v103 += 8;
    }
    while (v104 != v103);
  }
  int v108 = *(_DWORD *)(a1 + 44);
  if ((v108 & 8) != 0)
  {
    if (*(void *)a3 <= (unint64_t)a2) {
      a2 = sub_25C13CEE0((uint64_t)a3, (int)a2);
    }
    char v109 = *(unsigned char *)(a1 + 304);
    *(_WORD *)a2 = 640;
    a2[2] = v109;
    a2 += 3;
  }
  if ((v108 & 0x10) != 0)
  {
    if (*(void *)a3 <= (unint64_t)a2) {
      a2 = sub_25C13CEE0((uint64_t)a3, (int)a2);
    }
    char v110 = *(unsigned char *)(a1 + 305);
    *(_WORD *)a2 = 648;
    a2[2] = v110;
    a2 += 3;
  }
  int v111 = *(_DWORD *)(a1 + 40);
  if ((v111 & 0x20000) != 0)
  {
    if (*(void *)a3 <= (unint64_t)a2) {
      a2 = sub_25C13CEE0((uint64_t)a3, (int)a2);
    }
    char v112 = *(unsigned char *)(a1 + 241);
    *(_WORD *)a2 = 656;
    a2[2] = v112;
    a2 += 3;
    if ((v111 & 0x10000) == 0)
    {
LABEL_230:
      if ((v111 & 4) == 0) {
        goto LABEL_231;
      }
      goto LABEL_239;
    }
  }
  else if ((v111 & 0x10000) == 0)
  {
    goto LABEL_230;
  }
  if (*(void *)a3 <= (unint64_t)a2) {
    a2 = sub_25C13CEE0((uint64_t)a3, (int)a2);
  }
  char v113 = *(unsigned char *)(a1 + 240);
  *(_WORD *)a2 = 664;
  a2[2] = v113;
  a2 += 3;
  if ((v111 & 4) == 0)
  {
LABEL_231:
    if ((v111 & 0x80000) == 0) {
      goto LABEL_249;
    }
    goto LABEL_240;
  }
LABEL_239:
  a2 = sub_25C14C714(a3, 0x24u, (const void **)(*(void *)(a1 + 168) & 0xFFFFFFFFFFFFFFFELL), a2);
  if ((v111 & 0x80000) == 0) {
    goto LABEL_249;
  }
LABEL_240:
  if (*(void *)a3 <= (unint64_t)a2) {
    a2 = sub_25C13CEE0((uint64_t)a3, (int)a2);
  }
  unint64_t v114 = *(int *)(a1 + 244);
  *(_WORD *)a2 = 704;
  if (v114 > 0x7F)
  {
    a2[2] = v114 | 0x80;
    unint64_t v115 = v114 >> 7;
    if (v114 >> 14)
    {
      int v116 = a2 + 3;
      do
      {
        unsigned int v117 = v116;
        *v116++ = v115 | 0x80;
        unint64_t v118 = v115 >> 7;
        unint64_t v119 = v115 >> 14;
        v115 >>= 7;
      }
      while (v119);
      a2 = v117 + 2;
      unsigned char *v116 = v118;
    }
    else
    {
      a2[3] = v115;
      a2 += 4;
    }
  }
  else
  {
    a2[2] = v114;
    a2 += 3;
  }
LABEL_249:
  int v120 = *(_DWORD *)(a1 + 44);
  if ((v120 & 0x20) != 0)
  {
    if (*(void *)a3 <= (unint64_t)a2) {
      a2 = sub_25C13CEE0((uint64_t)a3, (int)a2);
    }
    unint64_t v122 = *(int *)(a1 + 308);
    *(_WORD *)a2 = 712;
    if (v122 > 0x7F)
    {
      a2[2] = v122 | 0x80;
      unint64_t v124 = v122 >> 7;
      if (v122 >> 14)
      {
        char v129 = a2 + 3;
        do
        {
          int v130 = v129;
          *v129++ = v124 | 0x80;
          unint64_t v131 = v124 >> 7;
          unint64_t v132 = v124 >> 14;
          v124 >>= 7;
        }
        while (v132);
        a2 = v130 + 2;
        unsigned char *v129 = v131;
        if ((v120 & 0x40) != 0) {
          goto LABEL_272;
        }
      }
      else
      {
        a2[3] = v124;
        a2 += 4;
        if ((v120 & 0x40) != 0) {
          goto LABEL_272;
        }
      }
    }
    else
    {
      a2[2] = v122;
      a2 += 3;
      if ((v120 & 0x40) != 0) {
        goto LABEL_272;
      }
    }
LABEL_251:
    if ((v120 & 0x80) == 0) {
      goto LABEL_283;
    }
    goto LABEL_252;
  }
  if ((v120 & 0x40) == 0) {
    goto LABEL_251;
  }
LABEL_272:
  if (*(void *)a3 <= (unint64_t)a2) {
    a2 = sub_25C13CEE0((uint64_t)a3, (int)a2);
  }
  unint64_t v133 = *(int *)(a1 + 312);
  *(_WORD *)a2 = 720;
  if (v133 > 0x7F)
  {
    a2[2] = v133 | 0x80;
    unint64_t v134 = v133 >> 7;
    if (v133 >> 14)
    {
      unsigned int v135 = a2 + 3;
      do
      {
        unsigned int v136 = v135;
        *v135++ = v134 | 0x80;
        unint64_t v137 = v134 >> 7;
        unint64_t v138 = v134 >> 14;
        v134 >>= 7;
      }
      while (v138);
      a2 = v136 + 2;
      unsigned char *v135 = v137;
      if ((v120 & 0x80) == 0) {
        goto LABEL_283;
      }
    }
    else
    {
      a2[3] = v134;
      a2 += 4;
      if ((v120 & 0x80) == 0) {
        goto LABEL_283;
      }
    }
  }
  else
  {
    a2[2] = v133;
    a2 += 3;
    if ((v120 & 0x80) == 0) {
      goto LABEL_283;
    }
  }
LABEL_252:
  if (*(void *)a3 <= (unint64_t)a2) {
    a2 = sub_25C13CEE0((uint64_t)a3, (int)a2);
  }
  unint64_t v121 = *(int *)(a1 + 316);
  *(_WORD *)a2 = 728;
  if (v121 > 0x7F)
  {
    a2[2] = v121 | 0x80;
    unint64_t v123 = v121 >> 7;
    if (v121 >> 14)
    {
      unsigned int v125 = a2 + 3;
      do
      {
        uint64_t v126 = v125;
        *v125++ = v123 | 0x80;
        unint64_t v127 = v123 >> 7;
        unint64_t v128 = v123 >> 14;
        v123 >>= 7;
      }
      while (v128);
      a2 = v126 + 2;
      *unsigned int v125 = v127;
    }
    else
    {
      a2[3] = v123;
      a2 += 4;
    }
  }
  else
  {
    a2[2] = v121;
    a2 += 3;
  }
LABEL_283:
  int v139 = *(_DWORD *)(a1 + 40);
  if ((v139 & 8) != 0)
  {
    a2 = sub_25C14C714(a3, 0x2Cu, (const void **)(*(void *)(a1 + 176) & 0xFFFFFFFFFFFFFFFELL), a2);
    if ((v139 & 0x10) == 0)
    {
LABEL_285:
      if ((v139 & 0x20) == 0) {
        goto LABEL_286;
      }
      goto LABEL_295;
    }
  }
  else if ((v139 & 0x10) == 0)
  {
    goto LABEL_285;
  }
  a2 = sub_25C14C714(a3, 0x2Du, (const void **)(*(void *)(a1 + 184) & 0xFFFFFFFFFFFFFFFELL), a2);
  if ((v139 & 0x20) == 0)
  {
LABEL_286:
    if ((v139 & 0x40) == 0) {
      goto LABEL_287;
    }
    goto LABEL_296;
  }
LABEL_295:
  a2 = sub_25C14C714(a3, 0x2Eu, (const void **)(*(void *)(a1 + 192) & 0xFFFFFFFFFFFFFFFELL), a2);
  if ((v139 & 0x40) == 0)
  {
LABEL_287:
    if ((v139 & 0x80) == 0) {
      goto LABEL_288;
    }
    goto LABEL_297;
  }
LABEL_296:
  a2 = sub_25C14C714(a3, 0x2Fu, (const void **)(*(void *)(a1 + 200) & 0xFFFFFFFFFFFFFFFELL), a2);
  if ((v139 & 0x80) == 0)
  {
LABEL_288:
    if ((v139 & 0x40000) == 0) {
      goto LABEL_289;
    }
    goto LABEL_298;
  }
LABEL_297:
  a2 = sub_25C14C714(a3, 0x30u, (const void **)(*(void *)(a1 + 208) & 0xFFFFFFFFFFFFFFFELL), a2);
  if ((v139 & 0x40000) == 0)
  {
LABEL_289:
    if ((v139 & 0x1000) == 0) {
      goto LABEL_290;
    }
    goto LABEL_301;
  }
LABEL_298:
  if (*(void *)a3 <= (unint64_t)a2) {
    a2 = sub_25C13CEE0((uint64_t)a3, (int)a2);
  }
  char v140 = *(unsigned char *)(a1 + 242);
  *(_WORD *)a2 = 904;
  a2[2] = v140;
  a2 += 3;
  if ((v139 & 0x1000) == 0)
  {
LABEL_290:
    if ((v139 & 0x100000) == 0) {
      goto LABEL_291;
    }
    goto LABEL_304;
  }
LABEL_301:
  if (*(void *)a3 <= (unint64_t)a2) {
    a2 = sub_25C13CEE0((uint64_t)a3, (int)a2);
  }
  char v141 = *(unsigned char *)(a1 + 236);
  *(_WORD *)a2 = 912;
  a2[2] = v141;
  a2 += 3;
  if ((v139 & 0x100000) == 0)
  {
LABEL_291:
    if ((v139 & 0x200000) == 0) {
      goto LABEL_316;
    }
    goto LABEL_307;
  }
LABEL_304:
  if (*(void *)a3 <= (unint64_t)a2) {
    a2 = sub_25C13CEE0((uint64_t)a3, (int)a2);
  }
  int v142 = *(_DWORD *)(a1 + 248);
  *(_WORD *)a2 = 925;
  *(_DWORD *)(a2 + 2) = v142;
  a2 += 6;
  if ((v139 & 0x200000) != 0)
  {
LABEL_307:
    if (*(void *)a3 <= (unint64_t)a2) {
      a2 = sub_25C13CEE0((uint64_t)a3, (int)a2);
    }
    unint64_t v143 = *(void *)(a1 + 256);
    *(_WORD *)a2 = 928;
    if (v143 > 0x7F)
    {
      a2[2] = v143 | 0x80;
      unint64_t v144 = v143 >> 7;
      if (v143 >> 14)
      {
        char v145 = a2 + 3;
        do
        {
          int v146 = v145;
          *v145++ = v144 | 0x80;
          unint64_t v147 = v144 >> 7;
          unint64_t v148 = v144 >> 14;
          v144 >>= 7;
        }
        while (v148);
        a2 = v146 + 2;
        *char v145 = v147;
      }
      else
      {
        a2[3] = v144;
        a2 += 4;
      }
    }
    else
    {
      a2[2] = v143;
      a2 += 3;
    }
  }
LABEL_316:
  unsigned int v149 = sub_25C142F0C(a1 + 16, a2, a3);
  int v150 = v149;
  uint64_t v151 = *(void *)(a1 + 8);
  if ((v151 & 1) == 0) {
    return v150;
  }
  unint64_t v153 = v151 & 0xFFFFFFFFFFFFFFFELL;
  if (*(char *)(v153 + 31) < 0)
  {
    uint64_t v154 = *(void **)(v153 + 8);
    uint64_t v155 = *(void *)(v153 + 16);
  }
  else
  {
    uint64_t v154 = (void *)(v153 + 8);
    LODWORD(v155) = *(unsigned __int8 *)(v153 + 31);
  }
  if (*(void *)a3 - (void)v149 >= (int)v155)
  {
    uint64_t v156 = (int)v155;
    memcpy(v149, v154, (int)v155);
    v150 += v156;
    return v150;
  }

  return (char *)sub_25C13D00C(a3, (char *)v154, v155, v149);
}

char *sub_25C151A68(uint64_t a1, char *a2, int32x2_t *a3)
{
  uint64_t v218 = (void *)(a1 + 208);
  uint64_t v219 = a2;
  uint64_t v216 = (void *)(a1 + 192);
  unsigned int v217 = (void *)(a1 + 200);
  uint64_t v214 = (void *)(a1 + 176);
  unsigned int v215 = (void *)(a1 + 184);
  unsigned int v212 = (unint64_t *)(a1 + 8);
  uint64_t v213 = (uint64_t **)(a1 + 168);
  unint64_t v5 = (uint64_t *)(a1 + 128);
  uint64_t v6 = (uint64_t *)(a1 + 104);
  uint64_t v7 = (uint64_t **)(a1 + 160);
  uint64_t v8 = (uint64_t *)(a1 + 80);
  int v9 = (uint64_t **)(a1 + 152);
  int64_t v10 = (uint64_t *)(a1 + 56);
  unsigned int v211 = (uint64_t *)(a1 + 16);
LABEL_2:
  while (2)
  {
    char v11 = sub_25C142E98((uint64_t)a3, &v219, a3[11].i32[1]);
    uint64_t result = v219;
    if (v11) {
      return result;
    }
    unint64_t v13 = v219 + 1;
    unsigned int v14 = *v219;
    if (*v219 < 0)
    {
      unsigned int v14 = v14 + (*v13 << 7) - 128;
      if (*v13 < 0)
      {
        char v15 = 14;
        uint64_t v16 = 2;
        while (1)
        {
          v14 += (v219[v16] - 1) << v15;
          if ((v219[v16] & 0x80000000) == 0) {
            break;
          }
          ++v16;
          v15 += 7;
          if (v16 == 5) {
            return 0;
          }
        }
        unint64_t v13 = &v219[v16 + 1];
      }
      else
      {
        unint64_t v13 = v219 + 2;
      }
    }
    uint64_t v219 = v13;
    switch(v14 >> 3)
    {
      case 1u:
        if (v14 != 10) {
          goto LABEL_248;
        }
        uint64_t v17 = v13 - 1;
        while (1)
        {
          uint64_t v18 = *(int **)(a1 + 72);
          if (!v18) {
            break;
          }
          int v19 = *(_DWORD *)(a1 + 64);
          int v20 = *v18;
          if (v19 >= *v18)
          {
            if (v20 == *(_DWORD *)(a1 + 68))
            {
LABEL_19:
              if (v19 <= v20)
              {
                sub_25C14C1A8(v10, v20 - v19 + 1);
                uint64_t v18 = *(int **)(a1 + 72);
              }
              int v20 = *v18;
            }
            *uint64_t v18 = v20 + 1;
            uint64_t v22 = *v10;
            if (!*v10) {
              operator new();
            }
            if (*(unsigned char *)(v22 + 24)) {
              (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v22 + 32) + 32) + 40))(*(void *)(*(void *)(v22 + 32) + 32), &unk_270989328, 24);
            }
            int v21 = (std::string *)sub_25C1360BC((void *)v22, 0x18uLL, (uint64_t)sub_25C136878);
            v21->__r_.__value_.__r.__words[0] = 0;
            v21->__r_.__value_.__l.__size_ = 0;
            v21->__r_.__value_.__r.__words[2] = 0;
            uint64_t v23 = *(void *)(a1 + 72);
            uint64_t v24 = *(int *)(a1 + 64);
            *(_DWORD *)(a1 + 64) = v24 + 1;
            *(void *)(v23 + 8 * v24 + 8) = v21;
            goto LABEL_27;
          }
          *(_DWORD *)(a1 + 64) = v19 + 1;
          int v21 = *(std::string **)&v18[2 * v19 + 2];
LABEL_27:
          uint64_t result = (char *)sub_25C14B33C(v21, v17 + 1, (uint64_t)a3);
          uint64_t v17 = result;
          if (!result) {
            goto LABEL_437;
          }
          if (*(void *)a3 <= (unint64_t)result || *result != 10) {
            goto LABEL_243;
          }
        }
        int v19 = *(_DWORD *)(a1 + 64);
        int v20 = *(_DWORD *)(a1 + 68);
        goto LABEL_19;
      case 2u:
        if (v14 != 18) {
          goto LABEL_248;
        }
        *(_DWORD *)(a1 + 40) |= 1u;
        uint64_t v25 = *(void *)(a1 + 8);
        uint64_t v26 = (void *)(v25 & 0xFFFFFFFFFFFFFFFELL);
        if (v25) {
          uint64_t v26 = (void *)*v26;
        }
        uint64_t v27 = v9;
        goto LABEL_192;
      case 3u:
        if (v14 != 24) {
          goto LABEL_248;
        }
        uint64_t v28 = v13 + 1;
        unint64_t v29 = *v13;
        if ((*v13 & 0x80000000) == 0) {
          goto LABEL_374;
        }
        int v30 = *v28;
        unint64_t v29 = (v29 + (v30 << 7) - 128);
        if ((v30 & 0x80) != 0)
        {
          uint64_t v152 = 2;
          for (char i = 14; ; i += 7)
          {
            v29 += (v13[v152] - 1) << i;
            if ((v13[v152] & 0x80000000) == 0) {
              break;
            }
            uint64_t result = 0;
            if (++v152 == 10) {
              return result;
            }
          }
          uint64_t v28 = &v13[v152 + 1];
        }
        else
        {
          uint64_t v28 = v13 + 2;
        }
LABEL_374:
        uint64_t v219 = v28;
        if ((v29 - 1) > 3)
        {
          if (*v212) {
            v210 = (std::string *)((*v212 & 0xFFFFFFFFFFFFFFFELL) + 8);
          }
          else {
            v210 = (std::string *)sub_25C142B28(v212);
          }
          sub_25C14B228(3, v29, v210);
        }
        else
        {
          *(_DWORD *)(a1 + 40) |= 0x400000u;
          *(_DWORD *)(a1 + 264) = v29;
        }
        continue;
      case 4u:
        if (v14 != 32) {
          goto LABEL_248;
        }
        *(_DWORD *)(a1 + 40) |= 0x800000u;
        unint64_t v32 = v13 + 1;
        LODWORD(v31) = *v13;
        if ((v31 & 0x80) == 0) {
          goto LABEL_377;
        }
        int v33 = *v32;
        uint64_t v31 = v31 + (v33 << 7) - 128;
        if (v33 < 0)
        {
          uint64_t v154 = 2;
          for (char j = 14; ; j += 7)
          {
            v31 += (v13[v154] - 1) << j;
            if ((v13[v154] & 0x80000000) == 0) {
              break;
            }
            if (++v154 == 10)
            {
              uint64_t result = 0;
              *(_DWORD *)(a1 + 268) = 0;
              return result;
            }
          }
          unint64_t v32 = &v13[v154 + 1];
        }
        else
        {
          unint64_t v32 = v13 + 2;
        }
LABEL_377:
        uint64_t v219 = v32;
        *(_DWORD *)(a1 + 268) = v31;
        continue;
      case 5u:
        if (v14 != 42) {
          goto LABEL_248;
        }
        uint64_t v17 = v13 - 1;
        while (1)
        {
          uint64_t v34 = *(int **)(a1 + 96);
          if (!v34) {
            break;
          }
          int v35 = *(_DWORD *)(a1 + 88);
          int v36 = *v34;
          if (v35 >= *v34)
          {
            if (v36 == *(_DWORD *)(a1 + 92))
            {
LABEL_50:
              if (v35 <= v36)
              {
                sub_25C14C1A8(v8, v36 - v35 + 1);
                uint64_t v34 = *(int **)(a1 + 96);
              }
              int v36 = *v34;
            }
            *uint64_t v34 = v36 + 1;
            uint64_t v38 = *v8;
            if (!*v8) {
              operator new();
            }
            if (*(unsigned char *)(v38 + 24)) {
              (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v38 + 32) + 32) + 40))(*(void *)(*(void *)(v38 + 32) + 32), &unk_270989328, 24);
            }
            int v37 = (std::string *)sub_25C1360BC((void *)v38, 0x18uLL, (uint64_t)sub_25C136878);
            v37->__r_.__value_.__r.__words[0] = 0;
            v37->__r_.__value_.__l.__size_ = 0;
            v37->__r_.__value_.__r.__words[2] = 0;
            uint64_t v39 = *(void *)(a1 + 96);
            uint64_t v40 = *(int *)(a1 + 88);
            *(_DWORD *)(a1 + 88) = v40 + 1;
            *(void *)(v39 + 8 * v40 + 8) = v37;
            goto LABEL_58;
          }
          *(_DWORD *)(a1 + 88) = v35 + 1;
          int v37 = *(std::string **)&v34[2 * v35 + 2];
LABEL_58:
          uint64_t result = (char *)sub_25C14B33C(v37, v17 + 1, (uint64_t)a3);
          uint64_t v17 = result;
          if (!result) {
            goto LABEL_437;
          }
          if (*(void *)a3 <= (unint64_t)result || *result != 42) {
            goto LABEL_243;
          }
        }
        int v35 = *(_DWORD *)(a1 + 88);
        int v36 = *(_DWORD *)(a1 + 92);
        goto LABEL_50;
      case 6u:
        if (v14 != 48) {
          goto LABEL_248;
        }
        *(_DWORD *)(a1 + 40) |= 0x100u;
        unint64_t v42 = v13 + 1;
        LODWORD(v41) = *v13;
        if ((v41 & 0x80) == 0) {
          goto LABEL_379;
        }
        int v43 = *v42;
        uint64_t v41 = v41 + (v43 << 7) - 128;
        if (v43 < 0)
        {
          uint64_t v156 = 2;
          for (char k = 14; ; k += 7)
          {
            v41 += (v13[v156] - 1) << k;
            if ((v13[v156] & 0x80000000) == 0) {
              break;
            }
            if (++v156 == 10)
            {
              uint64_t result = 0;
              *(_DWORD *)(a1 + 216) = 0;
              return result;
            }
          }
          unint64_t v42 = &v13[v156 + 1];
        }
        else
        {
          unint64_t v42 = v13 + 2;
        }
LABEL_379:
        uint64_t v219 = v42;
        *(_DWORD *)(a1 + 216) = v41;
        continue;
      case 7u:
        if (v14 != 58) {
          goto LABEL_248;
        }
        *(_DWORD *)(a1 + 40) |= 2u;
        uint64_t v44 = *(void *)(a1 + 8);
        uint64_t v26 = (void *)(v44 & 0xFFFFFFFFFFFFFFFELL);
        if (v44) {
          uint64_t v26 = (void *)*v26;
        }
        uint64_t v27 = v7;
        goto LABEL_192;
      case 0xAu:
        if (v14 != 85) {
          goto LABEL_248;
        }
        *(_DWORD *)(a1 + 40) |= 0x1000000u;
        int v45 = *(_DWORD *)v13;
        uint64_t v17 = v13 + 4;
        *(_DWORD *)(a1 + 272) = v45;
        goto LABEL_243;
      case 0xBu:
        if (v14 != 88) {
          goto LABEL_248;
        }
        *(_DWORD *)(a1 + 40) |= 0x400u;
        unint64_t v46 = v13 + 1;
        uint64_t v47 = *v13;
        if ((*v13 & 0x80000000) == 0) {
          goto LABEL_381;
        }
        int v48 = *v46;
        uint64_t v47 = (v47 + (v48 << 7) - 128);
        if ((v48 & 0x80) != 0)
        {
          uint64_t v158 = 2;
          for (char m = 14; ; m += 7)
          {
            v47 += (v13[v158] - 1) << m;
            if ((v13[v158] & 0x80000000) == 0) {
              break;
            }
            if (++v158 == 10)
            {
              uint64_t result = 0;
              *(void *)(a1 + 224) = 0;
              return result;
            }
          }
          unint64_t v46 = &v13[v158 + 1];
        }
        else
        {
          unint64_t v46 = v13 + 2;
        }
LABEL_381:
        uint64_t v219 = v46;
        *(void *)(a1 + 224) = v47;
        continue;
      case 0xCu:
        if (v14 != 96) {
          goto LABEL_248;
        }
        *(_DWORD *)(a1 + 40) |= 0x200u;
        unint64_t v50 = v13 + 1;
        LODWORD(v49) = *v13;
        if ((v49 & 0x80) == 0) {
          goto LABEL_383;
        }
        int v51 = *v50;
        uint64_t v49 = v49 + (v51 << 7) - 128;
        if (v51 < 0)
        {
          uint64_t v160 = 2;
          for (char n = 14; ; n += 7)
          {
            v49 += (v13[v160] - 1) << n;
            if ((v13[v160] & 0x80000000) == 0) {
              break;
            }
            if (++v160 == 10)
            {
              uint64_t result = 0;
              *(_DWORD *)(a1 + 220) = 0;
              return result;
            }
          }
          unint64_t v50 = &v13[v160 + 1];
        }
        else
        {
          unint64_t v50 = v13 + 2;
        }
LABEL_383:
        uint64_t v219 = v50;
        *(_DWORD *)(a1 + 220) = v49;
        continue;
      case 0xDu:
        if (v14 != 104) {
          goto LABEL_248;
        }
        *(_DWORD *)(a1 + 40) |= 0x800u;
        unint64_t v53 = v13 + 1;
        LODWORD(v52) = *v13;
        if ((v52 & 0x80) == 0) {
          goto LABEL_385;
        }
        int v54 = *v53;
        uint64_t v52 = v52 + (v54 << 7) - 128;
        if (v54 < 0)
        {
          uint64_t v162 = 2;
          for (ichar i = 14; ; ii += 7)
          {
            v52 += (v13[v162] - 1) << ii;
            if ((v13[v162] & 0x80000000) == 0) {
              break;
            }
            if (++v162 == 10)
            {
              uint64_t result = 0;
              *(_DWORD *)(a1 + 232) = 0;
              return result;
            }
          }
          unint64_t v53 = &v13[v162 + 1];
        }
        else
        {
          unint64_t v53 = v13 + 2;
        }
LABEL_385:
        uint64_t v219 = v53;
        *(_DWORD *)(a1 + 232) = v52;
        continue;
      case 0xEu:
        if (v14 != 112) {
          goto LABEL_248;
        }
        *(_DWORD *)(a1 + 40) |= 0x2000000u;
        unint64_t v56 = v13 + 1;
        LODWORD(v55) = *v13;
        if ((v55 & 0x80) == 0) {
          goto LABEL_387;
        }
        int v57 = *v56;
        uint64_t v55 = v55 + (v57 << 7) - 128;
        if (v57 < 0)
        {
          uint64_t v164 = 2;
          for (jchar j = 14; ; jj += 7)
          {
            v55 += (v13[v164] - 1) << jj;
            if ((v13[v164] & 0x80000000) == 0) {
              break;
            }
            if (++v164 == 10)
            {
              uint64_t result = 0;
              *(_DWORD *)(a1 + 276) = 0;
              return result;
            }
          }
          unint64_t v56 = &v13[v164 + 1];
        }
        else
        {
          unint64_t v56 = v13 + 2;
        }
LABEL_387:
        uint64_t v219 = v56;
        *(_DWORD *)(a1 + 276) = v55;
        continue;
      case 0xFu:
        if (v14 != 125) {
          goto LABEL_248;
        }
        *(_DWORD *)(a1 + 40) |= 0x4000000u;
        int v58 = *(_DWORD *)v13;
        uint64_t v17 = v13 + 4;
        *(_DWORD *)(a1 + 280) = v58;
        goto LABEL_243;
      case 0x10u:
        if (v14 != 128) {
          goto LABEL_248;
        }
        *(_DWORD *)(a1 + 40) |= 0x8000000u;
        unint64_t v60 = v13 + 1;
        LODWORD(v59) = *v13;
        if ((v59 & 0x80) == 0) {
          goto LABEL_389;
        }
        int v61 = *v60;
        uint64_t v59 = v59 + (v61 << 7) - 128;
        if (v61 < 0)
        {
          uint64_t v166 = 2;
          for (kchar k = 14; ; kk += 7)
          {
            v59 += (v13[v166] - 1) << kk;
            if ((v13[v166] & 0x80000000) == 0) {
              break;
            }
            if (++v166 == 10)
            {
              uint64_t result = 0;
              *(_DWORD *)(a1 + 284) = 0;
              return result;
            }
          }
          unint64_t v60 = &v13[v166 + 1];
        }
        else
        {
          unint64_t v60 = v13 + 2;
        }
LABEL_389:
        uint64_t v219 = v60;
        *(_DWORD *)(a1 + 284) = v59;
        continue;
      case 0x11u:
        if (v14 != 136) {
          goto LABEL_248;
        }
        *(_DWORD *)(a1 + 40) |= 0x10000000u;
        unint64_t v63 = v13 + 1;
        LODWORD(v62) = *v13;
        if ((v62 & 0x80) == 0) {
          goto LABEL_391;
        }
        int v64 = *v63;
        uint64_t v62 = v62 + (v64 << 7) - 128;
        if (v64 < 0)
        {
          uint64_t v168 = 2;
          for (mchar m = 14; ; mm += 7)
          {
            v62 += (v13[v168] - 1) << mm;
            if ((v13[v168] & 0x80000000) == 0) {
              break;
            }
            if (++v168 == 10)
            {
              uint64_t result = 0;
              *(_DWORD *)(a1 + 288) = 0;
              return result;
            }
          }
          unint64_t v63 = &v13[v168 + 1];
        }
        else
        {
          unint64_t v63 = v13 + 2;
        }
LABEL_391:
        uint64_t v219 = v63;
        *(_DWORD *)(a1 + 288) = v62;
        continue;
      case 0x12u:
        if (v14 != 144) {
          goto LABEL_248;
        }
        *(_DWORD *)(a1 + 40) |= 0x20000000u;
        uint64_t v66 = v13 + 1;
        LODWORD(v65) = *v13;
        if ((v65 & 0x80) == 0) {
          goto LABEL_393;
        }
        int v67 = *v66;
        uint64_t v65 = v65 + (v67 << 7) - 128;
        if (v67 < 0)
        {
          uint64_t v170 = 2;
          for (nchar n = 14; ; nn += 7)
          {
            v65 += (v13[v170] - 1) << nn;
            if ((v13[v170] & 0x80000000) == 0) {
              break;
            }
            if (++v170 == 10)
            {
              uint64_t result = 0;
              *(_DWORD *)(a1 + 292) = 0;
              return result;
            }
          }
          uint64_t v66 = &v13[v170 + 1];
        }
        else
        {
          uint64_t v66 = v13 + 2;
        }
LABEL_393:
        uint64_t v219 = v66;
        *(_DWORD *)(a1 + 292) = v65;
        continue;
      case 0x13u:
        if (v14 != 152) {
          goto LABEL_248;
        }
        *(_DWORD *)(a1 + 40) |= 0x80000000;
        unint64_t v68 = v13 + 1;
        uint64_t v69 = *v13;
        if ((*v13 & 0x80000000) == 0) {
          goto LABEL_395;
        }
        int v70 = *v68;
        uint64_t v69 = (v69 + (v70 << 7) - 128);
        if ((v70 & 0x80) != 0)
        {
          uint64_t v172 = 2;
          for (char i1 = 14; ; i1 += 7)
          {
            v69 += (v13[v172] - 1) << i1;
            if ((v13[v172] & 0x80000000) == 0) {
              break;
            }
            if (++v172 == 10)
            {
              uint64_t result = 0;
              *(unsigned char *)(a1 + 300) = 0;
              return result;
            }
          }
          unint64_t v68 = &v13[v172 + 1];
        }
        else
        {
          unint64_t v68 = v13 + 2;
        }
LABEL_395:
        uint64_t v219 = v68;
        *(unsigned char *)(a1 + 300) = v69 != 0;
        continue;
      case 0x14u:
        if (v14 != 160) {
          goto LABEL_248;
        }
        *(_DWORD *)(a1 + 40) |= 0x40000000u;
        uint64_t v72 = v13 + 1;
        LODWORD(v71) = *v13;
        if ((v71 & 0x80) == 0) {
          goto LABEL_397;
        }
        int v73 = *v72;
        uint64_t v71 = v71 + (v73 << 7) - 128;
        if (v73 < 0)
        {
          uint64_t v174 = 2;
          for (char i2 = 14; ; i2 += 7)
          {
            v71 += (v13[v174] - 1) << i2;
            if ((v13[v174] & 0x80000000) == 0) {
              break;
            }
            if (++v174 == 10)
            {
              uint64_t result = 0;
              *(_DWORD *)(a1 + 296) = 0;
              return result;
            }
          }
          uint64_t v72 = &v13[v174 + 1];
        }
        else
        {
          uint64_t v72 = v13 + 2;
        }
LABEL_397:
        uint64_t v219 = v72;
        *(_DWORD *)(a1 + 296) = v71;
        continue;
      case 0x15u:
        if (v14 != 168) {
          goto LABEL_248;
        }
        *(_DWORD *)(a1 + 44) |= 1u;
        unint64_t v74 = v13 + 1;
        uint64_t v75 = *v13;
        if ((*v13 & 0x80000000) == 0) {
          goto LABEL_399;
        }
        int v76 = *v74;
        uint64_t v75 = (v75 + (v76 << 7) - 128);
        if ((v76 & 0x80) != 0)
        {
          uint64_t v176 = 2;
          for (char i3 = 14; ; i3 += 7)
          {
            v75 += (v13[v176] - 1) << i3;
            if ((v13[v176] & 0x80000000) == 0) {
              break;
            }
            if (++v176 == 10)
            {
              uint64_t result = 0;
              *(unsigned char *)(a1 + 301) = 0;
              return result;
            }
          }
          unint64_t v74 = &v13[v176 + 1];
        }
        else
        {
          unint64_t v74 = v13 + 2;
        }
LABEL_399:
        uint64_t v219 = v74;
        *(unsigned char *)(a1 + 301) = v75 != 0;
        continue;
      case 0x16u:
        if (v14 != 176) {
          goto LABEL_248;
        }
        *(_DWORD *)(a1 + 44) |= 4u;
        size_t v77 = v13 + 1;
        uint64_t v78 = *v13;
        if ((*v13 & 0x80000000) == 0) {
          goto LABEL_401;
        }
        int v79 = *v77;
        uint64_t v78 = (v78 + (v79 << 7) - 128);
        if ((v79 & 0x80) != 0)
        {
          uint64_t v178 = 2;
          for (char i4 = 14; ; i4 += 7)
          {
            v78 += (v13[v178] - 1) << i4;
            if ((v13[v178] & 0x80000000) == 0) {
              break;
            }
            if (++v178 == 10)
            {
              uint64_t result = 0;
              *(unsigned char *)(a1 + 303) = 0;
              return result;
            }
          }
          size_t v77 = &v13[v178 + 1];
        }
        else
        {
          size_t v77 = v13 + 2;
        }
LABEL_401:
        uint64_t v219 = v77;
        *(unsigned char *)(a1 + 303) = v78 != 0;
        continue;
      case 0x17u:
        if (v14 != 184) {
          goto LABEL_248;
        }
        *(_DWORD *)(a1 + 44) |= 2u;
        unint64_t v80 = v13 + 1;
        uint64_t v81 = *v13;
        if ((*v13 & 0x80000000) == 0) {
          goto LABEL_403;
        }
        int v82 = *v80;
        uint64_t v81 = (v81 + (v82 << 7) - 128);
        if ((v82 & 0x80) != 0)
        {
          uint64_t v180 = 2;
          for (char i5 = 14; ; i5 += 7)
          {
            v81 += (v13[v180] - 1) << i5;
            if ((v13[v180] & 0x80000000) == 0) {
              break;
            }
            if (++v180 == 10)
            {
              uint64_t result = 0;
              *(unsigned char *)(a1 + 302) = 0;
              return result;
            }
          }
          unint64_t v80 = &v13[v180 + 1];
        }
        else
        {
          unint64_t v80 = v13 + 2;
        }
LABEL_403:
        uint64_t v219 = v80;
        *(unsigned char *)(a1 + 302) = v81 != 0;
        continue;
      case 0x18u:
        if (v14 != 192) {
          goto LABEL_248;
        }
        *(_DWORD *)(a1 + 40) |= 0x2000u;
        unint64_t v83 = v13 + 1;
        uint64_t v84 = *v13;
        if ((*v13 & 0x80000000) == 0) {
          goto LABEL_405;
        }
        int v85 = *v83;
        uint64_t v84 = (v84 + (v85 << 7) - 128);
        if ((v85 & 0x80) != 0)
        {
          uint64_t v182 = 2;
          for (char i6 = 14; ; i6 += 7)
          {
            v84 += (v13[v182] - 1) << i6;
            if ((v13[v182] & 0x80000000) == 0) {
              break;
            }
            if (++v182 == 10)
            {
              uint64_t result = 0;
              *(unsigned char *)(a1 + 237) = 0;
              return result;
            }
          }
          unint64_t v83 = &v13[v182 + 1];
        }
        else
        {
          unint64_t v83 = v13 + 2;
        }
LABEL_405:
        uint64_t v219 = v83;
        *(unsigned char *)(a1 + 237) = v84 != 0;
        continue;
      case 0x19u:
        if (v14 != 200) {
          goto LABEL_248;
        }
        *(_DWORD *)(a1 + 40) |= 0x8000u;
        unint64_t v86 = v13 + 1;
        uint64_t v87 = *v13;
        if ((*v13 & 0x80000000) == 0) {
          goto LABEL_407;
        }
        int v88 = *v86;
        uint64_t v87 = (v87 + (v88 << 7) - 128);
        if ((v88 & 0x80) != 0)
        {
          uint64_t v184 = 2;
          for (char i7 = 14; ; i7 += 7)
          {
            v87 += (v13[v184] - 1) << i7;
            if ((v13[v184] & 0x80000000) == 0) {
              break;
            }
            if (++v184 == 10)
            {
              uint64_t result = 0;
              *(unsigned char *)(a1 + 239) = 0;
              return result;
            }
          }
          unint64_t v86 = &v13[v184 + 1];
        }
        else
        {
          unint64_t v86 = v13 + 2;
        }
LABEL_407:
        uint64_t v219 = v86;
        *(unsigned char *)(a1 + 239) = v87 != 0;
        continue;
      case 0x1Au:
        if (v14 != 208) {
          goto LABEL_248;
        }
        *(_DWORD *)(a1 + 40) |= 0x4000u;
        char v89 = v13 + 1;
        uint64_t v90 = *v13;
        if ((*v13 & 0x80000000) == 0) {
          goto LABEL_409;
        }
        int v91 = *v89;
        uint64_t v90 = (v90 + (v91 << 7) - 128);
        if ((v91 & 0x80) != 0)
        {
          uint64_t v186 = 2;
          for (char i8 = 14; ; i8 += 7)
          {
            v90 += (v13[v186] - 1) << i8;
            if ((v13[v186] & 0x80000000) == 0) {
              break;
            }
            if (++v186 == 10)
            {
              uint64_t result = 0;
              *(unsigned char *)(a1 + 238) = 0;
              return result;
            }
          }
          char v89 = &v13[v186 + 1];
        }
        else
        {
          char v89 = v13 + 2;
        }
LABEL_409:
        uint64_t v219 = v89;
        *(unsigned char *)(a1 + 238) = v90 != 0;
        continue;
      case 0x1Eu:
        if (v14 != 242) {
          goto LABEL_248;
        }
        uint64_t v17 = v13 - 2;
        while (1)
        {
          int v92 = *(int **)(a1 + 120);
          if (!v92) {
            break;
          }
          int v93 = *(_DWORD *)(a1 + 112);
          int v94 = *v92;
          if (v93 >= *v92)
          {
            if (v94 == *(_DWORD *)(a1 + 116))
            {
LABEL_141:
              if (v93 <= v94)
              {
                sub_25C14C1A8(v6, v94 - v93 + 1);
                int v92 = *(int **)(a1 + 120);
              }
              int v94 = *v92;
            }
            *int v92 = v94 + 1;
            uint64_t v96 = *v6;
            if (!*v6) {
              operator new();
            }
            if (*(unsigned char *)(v96 + 24)) {
              (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v96 + 32) + 32) + 40))(*(void *)(*(void *)(v96 + 32) + 32), &unk_270989328, 24);
            }
            char v95 = (std::string *)sub_25C1360BC((void *)v96, 0x18uLL, (uint64_t)sub_25C136878);
            v95->__r_.__value_.__r.__words[0] = 0;
            v95->__r_.__value_.__l.__size_ = 0;
            v95->__r_.__value_.__r.__words[2] = 0;
            uint64_t v97 = *(void *)(a1 + 120);
            uint64_t v98 = *(int *)(a1 + 112);
            *(_DWORD *)(a1 + 112) = v98 + 1;
            *(void *)(v97 + 8 * v98 + 8) = v95;
            goto LABEL_149;
          }
          *(_DWORD *)(a1 + 112) = v93 + 1;
          char v95 = *(std::string **)&v92[2 * v93 + 2];
LABEL_149:
          uint64_t result = (char *)sub_25C14B33C(v95, v17 + 2, (uint64_t)a3);
          uint64_t v17 = result;
          if (!result) {
            goto LABEL_437;
          }
          if (*(void *)a3 <= (unint64_t)result || *(_WORD *)result != 498) {
            goto LABEL_243;
          }
        }
        int v93 = *(_DWORD *)(a1 + 112);
        int v94 = *(_DWORD *)(a1 + 116);
        goto LABEL_141;
      case 0x1Fu:
        if (v14 != 250) {
          goto LABEL_248;
        }
        uint64_t v17 = v13 - 2;
        break;
      case 0x20u:
        if ((_BYTE)v14) {
          goto LABEL_248;
        }
        *(_DWORD *)(a1 + 44) |= 8u;
        int64_t v106 = v13 + 1;
        uint64_t v107 = *v13;
        if ((*v13 & 0x80000000) == 0) {
          goto LABEL_411;
        }
        int v108 = *v106;
        uint64_t v107 = (v107 + (v108 << 7) - 128);
        if ((v108 & 0x80) != 0)
        {
          uint64_t v188 = 2;
          for (char i9 = 14; ; i9 += 7)
          {
            v107 += (v13[v188] - 1) << i9;
            if ((v13[v188] & 0x80000000) == 0) {
              break;
            }
            if (++v188 == 10)
            {
              uint64_t result = 0;
              *(unsigned char *)(a1 + 304) = 0;
              return result;
            }
          }
          int64_t v106 = &v13[v188 + 1];
        }
        else
        {
          int64_t v106 = v13 + 2;
        }
LABEL_411:
        uint64_t v219 = v106;
        *(unsigned char *)(a1 + 304) = v107 != 0;
        continue;
      case 0x21u:
        if (v14 != 8) {
          goto LABEL_248;
        }
        *(_DWORD *)(a1 + 44) |= 0x10u;
        char v109 = v13 + 1;
        uint64_t v110 = *v13;
        if ((*v13 & 0x80000000) == 0) {
          goto LABEL_413;
        }
        int v111 = *v109;
        uint64_t v110 = (v110 + (v111 << 7) - 128);
        if ((v111 & 0x80) != 0)
        {
          uint64_t v190 = 2;
          for (char i10 = 14; ; i10 += 7)
          {
            v110 += (v13[v190] - 1) << i10;
            if ((v13[v190] & 0x80000000) == 0) {
              break;
            }
            if (++v190 == 10)
            {
              uint64_t result = 0;
              *(unsigned char *)(a1 + 305) = 0;
              return result;
            }
          }
          char v109 = &v13[v190 + 1];
        }
        else
        {
          char v109 = v13 + 2;
        }
LABEL_413:
        uint64_t v219 = v109;
        *(unsigned char *)(a1 + 305) = v110 != 0;
        continue;
      case 0x22u:
        if (v14 != 16) {
          goto LABEL_248;
        }
        *(_DWORD *)(a1 + 40) |= 0x20000u;
        char v112 = v13 + 1;
        uint64_t v113 = *v13;
        if ((*v13 & 0x80000000) == 0) {
          goto LABEL_415;
        }
        int v114 = *v112;
        uint64_t v113 = (v113 + (v114 << 7) - 128);
        if ((v114 & 0x80) != 0)
        {
          uint64_t v192 = 2;
          for (char i11 = 14; ; i11 += 7)
          {
            v113 += (v13[v192] - 1) << i11;
            if ((v13[v192] & 0x80000000) == 0) {
              break;
            }
            if (++v192 == 10)
            {
              uint64_t result = 0;
              *(unsigned char *)(a1 + 241) = 0;
              return result;
            }
          }
          char v112 = &v13[v192 + 1];
        }
        else
        {
          char v112 = v13 + 2;
        }
LABEL_415:
        uint64_t v219 = v112;
        *(unsigned char *)(a1 + 241) = v113 != 0;
        continue;
      case 0x23u:
        if (v14 != 24) {
          goto LABEL_248;
        }
        *(_DWORD *)(a1 + 40) |= 0x10000u;
        unint64_t v115 = v13 + 1;
        uint64_t v116 = *v13;
        if ((*v13 & 0x80000000) == 0) {
          goto LABEL_417;
        }
        int v117 = *v115;
        uint64_t v116 = (v116 + (v117 << 7) - 128);
        if ((v117 & 0x80) != 0)
        {
          uint64_t v194 = 2;
          for (char i12 = 14; ; i12 += 7)
          {
            v116 += (v13[v194] - 1) << i12;
            if ((v13[v194] & 0x80000000) == 0) {
              break;
            }
            if (++v194 == 10)
            {
              uint64_t result = 0;
              *(unsigned char *)(a1 + 240) = 0;
              return result;
            }
          }
          unint64_t v115 = &v13[v194 + 1];
        }
        else
        {
          unint64_t v115 = v13 + 2;
        }
LABEL_417:
        uint64_t v219 = v115;
        *(unsigned char *)(a1 + 240) = v116 != 0;
        continue;
      case 0x24u:
        if (v14 != 34) {
          goto LABEL_248;
        }
        *(_DWORD *)(a1 + 40) |= 4u;
        uint64_t v118 = *(void *)(a1 + 8);
        uint64_t v26 = (void *)(v118 & 0xFFFFFFFFFFFFFFFELL);
        if (v118) {
          uint64_t v26 = (void *)*v26;
        }
        uint64_t v27 = v213;
LABEL_192:
        unint64_t v119 = (std::string *)sub_25C1369B4(v27, (uint64_t)v26);
        goto LABEL_230;
      case 0x28u:
        if (v14 != 64) {
          goto LABEL_248;
        }
        *(_DWORD *)(a1 + 40) |= 0x80000u;
        unint64_t v121 = v13 + 1;
        LODWORD(v120) = *v13;
        if ((v120 & 0x80) == 0) {
          goto LABEL_419;
        }
        int v122 = *v121;
        uint64_t v120 = v120 + (v122 << 7) - 128;
        if (v122 < 0)
        {
          uint64_t v196 = 2;
          for (char i13 = 14; ; i13 += 7)
          {
            v120 += (v13[v196] - 1) << i13;
            if ((v13[v196] & 0x80000000) == 0) {
              break;
            }
            if (++v196 == 10)
            {
              uint64_t result = 0;
              *(_DWORD *)(a1 + 244) = 0;
              return result;
            }
          }
          unint64_t v121 = &v13[v196 + 1];
        }
        else
        {
          unint64_t v121 = v13 + 2;
        }
LABEL_419:
        uint64_t v219 = v121;
        *(_DWORD *)(a1 + 244) = v120;
        continue;
      case 0x29u:
        if (v14 != 72) {
          goto LABEL_248;
        }
        *(_DWORD *)(a1 + 44) |= 0x20u;
        unint64_t v124 = v13 + 1;
        LODWORD(v123) = *v13;
        if ((v123 & 0x80) == 0) {
          goto LABEL_421;
        }
        int v125 = *v124;
        uint64_t v123 = v123 + (v125 << 7) - 128;
        if (v125 < 0)
        {
          uint64_t v198 = 2;
          for (char i14 = 14; ; i14 += 7)
          {
            v123 += (v13[v198] - 1) << i14;
            if ((v13[v198] & 0x80000000) == 0) {
              break;
            }
            if (++v198 == 10)
            {
              uint64_t result = 0;
              *(_DWORD *)(a1 + 308) = 0;
              return result;
            }
          }
          unint64_t v124 = &v13[v198 + 1];
        }
        else
        {
          unint64_t v124 = v13 + 2;
        }
LABEL_421:
        uint64_t v219 = v124;
        *(_DWORD *)(a1 + 308) = v123;
        continue;
      case 0x2Au:
        if (v14 != 80) {
          goto LABEL_248;
        }
        *(_DWORD *)(a1 + 44) |= 0x40u;
        unint64_t v127 = v13 + 1;
        LODWORD(v126) = *v13;
        if ((v126 & 0x80) == 0) {
          goto LABEL_423;
        }
        int v128 = *v127;
        uint64_t v126 = v126 + (v128 << 7) - 128;
        if (v128 < 0)
        {
          uint64_t v200 = 2;
          for (char i15 = 14; ; i15 += 7)
          {
            v126 += (v13[v200] - 1) << i15;
            if ((v13[v200] & 0x80000000) == 0) {
              break;
            }
            if (++v200 == 10)
            {
              uint64_t result = 0;
              *(_DWORD *)(a1 + 312) = 0;
              return result;
            }
          }
          unint64_t v127 = &v13[v200 + 1];
        }
        else
        {
          unint64_t v127 = v13 + 2;
        }
LABEL_423:
        uint64_t v219 = v127;
        *(_DWORD *)(a1 + 312) = v126;
        continue;
      case 0x2Bu:
        if (v14 != 88) {
          goto LABEL_248;
        }
        *(_DWORD *)(a1 + 44) |= 0x80u;
        int v130 = v13 + 1;
        LODWORD(v129) = *v13;
        if ((v129 & 0x80) == 0) {
          goto LABEL_425;
        }
        int v131 = *v130;
        uint64_t v129 = v129 + (v131 << 7) - 128;
        if (v131 < 0)
        {
          uint64_t v202 = 2;
          for (char i16 = 14; ; i16 += 7)
          {
            v129 += (v13[v202] - 1) << i16;
            if ((v13[v202] & 0x80000000) == 0) {
              break;
            }
            if (++v202 == 10)
            {
              uint64_t result = 0;
              *(_DWORD *)(a1 + 316) = 0;
              return result;
            }
          }
          int v130 = &v13[v202 + 1];
        }
        else
        {
          int v130 = v13 + 2;
        }
LABEL_425:
        uint64_t v219 = v130;
        *(_DWORD *)(a1 + 316) = v129;
        continue;
      case 0x2Cu:
        if (v14 != 98) {
          goto LABEL_248;
        }
        *(_DWORD *)(a1 + 40) |= 8u;
        uint64_t v132 = *(void *)(a1 + 8);
        unint64_t v133 = (void *)(v132 & 0xFFFFFFFFFFFFFFFELL);
        if (v132) {
          unint64_t v133 = (void *)*v133;
        }
        unint64_t v134 = (char **)&off_26A5960E8;
        unsigned int v135 = v214;
        goto LABEL_229;
      case 0x2Du:
        if (v14 != 106) {
          goto LABEL_248;
        }
        *(_DWORD *)(a1 + 40) |= 0x10u;
        uint64_t v136 = *(void *)(a1 + 8);
        unint64_t v133 = (void *)(v136 & 0xFFFFFFFFFFFFFFFELL);
        if (v136) {
          unint64_t v133 = (void *)*v133;
        }
        unint64_t v134 = &off_26A596068;
        unsigned int v135 = v215;
        goto LABEL_229;
      case 0x2Eu:
        if (v14 != 114) {
          goto LABEL_248;
        }
        *(_DWORD *)(a1 + 40) |= 0x20u;
        uint64_t v137 = *(void *)(a1 + 8);
        unint64_t v133 = (void *)(v137 & 0xFFFFFFFFFFFFFFFELL);
        if (v137) {
          unint64_t v133 = (void *)*v133;
        }
        unint64_t v134 = &off_26A596088;
        unsigned int v135 = v216;
        goto LABEL_229;
      case 0x2Fu:
        if (v14 != 122) {
          goto LABEL_248;
        }
        *(_DWORD *)(a1 + 40) |= 0x40u;
        uint64_t v138 = *(void *)(a1 + 8);
        unint64_t v133 = (void *)(v138 & 0xFFFFFFFFFFFFFFFELL);
        if (v138) {
          unint64_t v133 = (void *)*v133;
        }
        unint64_t v134 = &off_26A5960A8;
        unsigned int v135 = v217;
        goto LABEL_229;
      case 0x30u:
        if (v14 != 130) {
          goto LABEL_248;
        }
        *(_DWORD *)(a1 + 40) |= 0x80u;
        uint64_t v139 = *(void *)(a1 + 8);
        unint64_t v133 = (void *)(v139 & 0xFFFFFFFFFFFFFFFELL);
        if (v139) {
          unint64_t v133 = (void *)*v133;
        }
        unint64_t v134 = &off_26A5960C8;
        unsigned int v135 = v218;
LABEL_229:
        unint64_t v119 = (std::string *)sub_25C136A88(v135, v134, (uint64_t)v133);
LABEL_230:
        uint64_t result = (char *)sub_25C14B33C(v119, v13, (uint64_t)a3);
        goto LABEL_231;
      case 0x31u:
        if (v14 != 136) {
          goto LABEL_248;
        }
        *(_DWORD *)(a1 + 40) |= 0x40000u;
        char v140 = v13 + 1;
        uint64_t v141 = *v13;
        if ((*v13 & 0x80000000) == 0) {
          goto LABEL_427;
        }
        int v142 = *v140;
        uint64_t v141 = (v141 + (v142 << 7) - 128);
        if ((v142 & 0x80) != 0)
        {
          uint64_t v204 = 2;
          for (char i17 = 14; ; i17 += 7)
          {
            v141 += (v13[v204] - 1) << i17;
            if ((v13[v204] & 0x80000000) == 0) {
              break;
            }
            if (++v204 == 10)
            {
              uint64_t result = 0;
              *(unsigned char *)(a1 + 242) = 0;
              return result;
            }
          }
          char v140 = &v13[v204 + 1];
        }
        else
        {
          char v140 = v13 + 2;
        }
LABEL_427:
        uint64_t v219 = v140;
        *(unsigned char *)(a1 + 242) = v141 != 0;
        continue;
      case 0x32u:
        if (v14 != 144) {
          goto LABEL_248;
        }
        *(_DWORD *)(a1 + 40) |= 0x1000u;
        unint64_t v143 = v13 + 1;
        uint64_t v144 = *v13;
        if ((*v13 & 0x80000000) == 0) {
          goto LABEL_429;
        }
        int v145 = *v143;
        uint64_t v144 = (v144 + (v145 << 7) - 128);
        if ((v145 & 0x80) != 0)
        {
          uint64_t v206 = 2;
          for (char i18 = 14; ; i18 += 7)
          {
            v144 += (v13[v206] - 1) << i18;
            if ((v13[v206] & 0x80000000) == 0) {
              break;
            }
            if (++v206 == 10)
            {
              uint64_t result = 0;
              *(unsigned char *)(a1 + 236) = 0;
              return result;
            }
          }
          unint64_t v143 = &v13[v206 + 1];
        }
        else
        {
          unint64_t v143 = v13 + 2;
        }
LABEL_429:
        uint64_t v219 = v143;
        *(unsigned char *)(a1 + 236) = v144 != 0;
        continue;
      case 0x33u:
        if (v14 != 157) {
          goto LABEL_248;
        }
        *(_DWORD *)(a1 + 40) |= 0x100000u;
        int v146 = *(_DWORD *)v13;
        uint64_t v17 = v13 + 4;
        *(_DWORD *)(a1 + 248) = v146;
        goto LABEL_243;
      case 0x34u:
        if (v14 != 160) {
          goto LABEL_248;
        }
        *(_DWORD *)(a1 + 40) |= 0x200000u;
        unint64_t v147 = v13 + 1;
        uint64_t v148 = *v13;
        if ((*v13 & 0x80000000) == 0) {
          goto LABEL_431;
        }
        int v149 = *v147;
        uint64_t v148 = (v148 + (v149 << 7) - 128);
        if ((v149 & 0x80) != 0)
        {
          uint64_t v208 = 2;
          for (char i19 = 14; ; i19 += 7)
          {
            v148 += (v13[v208] - 1) << i19;
            if ((v13[v208] & 0x80000000) == 0) {
              break;
            }
            if (++v208 == 10)
            {
              uint64_t result = 0;
              *(void *)(a1 + 256) = 0;
              return result;
            }
          }
          unint64_t v147 = &v13[v208 + 1];
        }
        else
        {
          unint64_t v147 = v13 + 2;
        }
LABEL_431:
        uint64_t v219 = v147;
        *(void *)(a1 + 256) = v148;
        continue;
      default:
LABEL_248:
        if (v14) {
          BOOL v150 = (v14 & 7) == 4;
        }
        else {
          BOOL v150 = 1;
        }
        if (v150)
        {
          a3[10].i32[0] = v14 - 1;
          return v13;
        }
        else
        {
          if (v14 < 0x640)
          {
            if (*v212) {
              uint64_t v151 = (std::string *)((*v212 & 0xFFFFFFFFFFFFFFFELL) + 8);
            }
            else {
              uint64_t v151 = (std::string *)sub_25C142B28(v212);
            }
            v220 = v151;
            uint64_t result = (char *)sub_25C14B72C(v14, &v220, v13, a3);
          }
          else
          {
            uint64_t result = (char *)sub_25C140F2C(v211, v14, v13, (uint64_t)&unk_26A5963E8, v212, a3);
          }
LABEL_231:
          uint64_t v219 = result;
          if (result) {
            continue;
          }
        }
        return result;
    }
    break;
  }
  while (1)
  {
    int v99 = *(int **)(a1 + 144);
    if (!v99)
    {
      int v100 = *(_DWORD *)(a1 + 136);
      int v101 = *(_DWORD *)(a1 + 140);
LABEL_160:
      if (v100 <= v101)
      {
        sub_25C14C1A8(v5, v101 - v100 + 1);
        int v99 = *(int **)(a1 + 144);
      }
      int v101 = *v99;
      goto LABEL_163;
    }
    int v100 = *(_DWORD *)(a1 + 136);
    int v101 = *v99;
    if (v100 < *v99)
    {
      *(_DWORD *)(a1 + 136) = v100 + 1;
      uint64_t v102 = *(std::string **)&v99[2 * v100 + 2];
      goto LABEL_168;
    }
    if (v101 == *(_DWORD *)(a1 + 140)) {
      goto LABEL_160;
    }
LABEL_163:
    *int v99 = v101 + 1;
    uint64_t v103 = *v5;
    if (!*v5) {
      operator new();
    }
    if (*(unsigned char *)(v103 + 24)) {
      (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(v103 + 32) + 32) + 40))(*(void *)(*(void *)(v103 + 32) + 32), &unk_270989328, 24);
    }
    uint64_t v102 = (std::string *)sub_25C1360BC((void *)v103, 0x18uLL, (uint64_t)sub_25C136878);
    v102->__r_.__value_.__r.__words[0] = 0;
    v102->__r_.__value_.__l.__size_ = 0;
    v102->__r_.__value_.__r.__words[2] = 0;
    uint64_t v104 = *(void *)(a1 + 144);
    uint64_t v105 = *(int *)(a1 + 136);
    *(_DWORD *)(a1 + 136) = v105 + 1;
    *(void *)(v104 + 8 * v105 + 8) = v102;
LABEL_168:
    uint64_t result = (char *)sub_25C14B33C(v102, v17 + 2, (uint64_t)a3);
    uint64_t v17 = result;
    if (!result) {
      break;
    }
    if (*(void *)a3 <= (unint64_t)result || *(_WORD *)result != 506)
    {
LABEL_243:
      uint64_t v219 = v17;
      goto LABEL_2;
    }
  }
LABEL_437:
  uint64_t v219 = v17;
  return result;
}

uint64_t sub_25C15360C(uint64_t a1)
{
  return *(unsigned int *)(a1 + 48);
}

uint64_t sub_25C153614(uint64_t a1)
{
  uint64_t v2 = sub_25C145C50(a1 + 16);
  uint64_t v3 = *(unsigned int *)(a1 + 64);
  uint64_t v4 = v2 + v3;
  if ((int)v3 >= 1)
  {
    unint64_t v5 = (uint64_t *)(*(void *)(a1 + 72) + 8);
    do
    {
      uint64_t v6 = *v5++;
      uint64_t v7 = *(unsigned __int8 *)(v6 + 23);
      uint64_t v8 = *(void *)(v6 + 8);
      if ((v7 & 0x80u) == 0) {
        uint64_t v8 = v7;
      }
      v4 += v8 + ((9 * (__clz(v8 | 1) ^ 0x1F) + 73) >> 6);
      --v3;
    }
    while (v3);
  }
  uint64_t v9 = *(unsigned int *)(a1 + 88);
  uint64_t v10 = v4 + v9;
  if ((int)v9 >= 1)
  {
    char v11 = (uint64_t *)(*(void *)(a1 + 96) + 8);
    do
    {
      uint64_t v12 = *v11++;
      uint64_t v13 = *(unsigned __int8 *)(v12 + 23);
      uint64_t v14 = *(void *)(v12 + 8);
      if ((v13 & 0x80u) == 0) {
        uint64_t v14 = v13;
      }
      v10 += v14 + ((9 * (__clz(v14 | 1) ^ 0x1F) + 73) >> 6);
      --v9;
    }
    while (v9);
  }
  uint64_t v15 = *(unsigned int *)(a1 + 112);
  uint64_t v16 = v10 + 2 * v15;
  if ((int)v15 >= 1)
  {
    uint64_t v17 = (uint64_t *)(*(void *)(a1 + 120) + 8);
    do
    {
      uint64_t v18 = *v17++;
      uint64_t v19 = *(unsigned __int8 *)(v18 + 23);
      uint64_t v20 = *(void *)(v18 + 8);
      if ((v19 & 0x80u) == 0) {
        uint64_t v20 = v19;
      }
      v16 += v20 + ((9 * (__clz(v20 | 1) ^ 0x1F) + 73) >> 6);
      --v15;
    }
    while (v15);
  }
  uint64_t v21 = *(unsigned int *)(a1 + 136);
  uint64_t result = v16 + 2 * v21;
  if ((int)v21 >= 1)
  {
    uint64_t v23 = (uint64_t *)(*(void *)(a1 + 144) + 8);
    do
    {
      uint64_t v24 = *v23++;
      uint64_t v25 = *(unsigned __int8 *)(v24 + 23);
      uint64_t v26 = *(void *)(v24 + 8);
      if ((v25 & 0x80u) == 0) {
        uint64_t v26 = v25;
      }
      result += v26 + ((9 * (__clz(v26 | 1) ^ 0x1F) + 73) >> 6);
      --v21;
    }
    while (v21);
  }
  int v27 = *(_DWORD *)(a1 + 40);
  if (!(_BYTE)v27) {
    goto LABEL_33;
  }
  if (v27)
  {
    unint64_t v54 = *(void *)(a1 + 152) & 0xFFFFFFFFFFFFFFFELL;
    uint64_t v55 = *(unsigned __int8 *)(v54 + 23);
    uint64_t v56 = *(void *)(v54 + 8);
    if ((v55 & 0x80u) == 0) {
      uint64_t v56 = v55;
    }
    result += v56 + ((9 * (__clz(v56 | 1) ^ 0x1F) + 73) >> 6) + 1;
    if ((v27 & 2) == 0)
    {
LABEL_24:
      if ((v27 & 4) == 0) {
        goto LABEL_25;
      }
      goto LABEL_121;
    }
  }
  else if ((v27 & 2) == 0)
  {
    goto LABEL_24;
  }
  unint64_t v57 = *(void *)(a1 + 160) & 0xFFFFFFFFFFFFFFFELL;
  uint64_t v58 = *(unsigned __int8 *)(v57 + 23);
  uint64_t v59 = *(void *)(v57 + 8);
  if ((v58 & 0x80u) == 0) {
    uint64_t v59 = v58;
  }
  result += v59 + ((9 * (__clz(v59 | 1) ^ 0x1F) + 73) >> 6) + 1;
  if ((v27 & 4) == 0)
  {
LABEL_25:
    if ((v27 & 8) == 0) {
      goto LABEL_26;
    }
    goto LABEL_124;
  }
LABEL_121:
  unint64_t v60 = *(void *)(a1 + 168) & 0xFFFFFFFFFFFFFFFELL;
  uint64_t v61 = *(unsigned __int8 *)(v60 + 23);
  uint64_t v62 = *(void *)(v60 + 8);
  if ((v61 & 0x80u) == 0) {
    uint64_t v62 = v61;
  }
  result += v62 + ((9 * (__clz(v62 | 1) ^ 0x1F) + 73) >> 6) + 2;
  if ((v27 & 8) == 0)
  {
LABEL_26:
    if ((v27 & 0x10) == 0) {
      goto LABEL_27;
    }
    goto LABEL_127;
  }
LABEL_124:
  unint64_t v63 = *(void *)(a1 + 176) & 0xFFFFFFFFFFFFFFFELL;
  uint64_t v64 = *(unsigned __int8 *)(v63 + 23);
  uint64_t v65 = *(void *)(v63 + 8);
  if ((v64 & 0x80u) == 0) {
    uint64_t v65 = v64;
  }
  result += v65 + ((9 * (__clz(v65 | 1) ^ 0x1F) + 73) >> 6) + 2;
  if ((v27 & 0x10) == 0)
  {
LABEL_27:
    if ((v27 & 0x20) == 0) {
      goto LABEL_28;
    }
LABEL_130:
    unint64_t v69 = *(void *)(a1 + 192) & 0xFFFFFFFFFFFFFFFELL;
    uint64_t v70 = *(unsigned __int8 *)(v69 + 23);
    uint64_t v71 = *(void *)(v69 + 8);
    if ((v70 & 0x80u) == 0) {
      uint64_t v71 = v70;
    }
    result += v71 + ((9 * (__clz(v71 | 1) ^ 0x1F) + 73) >> 6) + 2;
    if ((v27 & 0x40) == 0)
    {
LABEL_29:
      if ((v27 & 0x80) == 0) {
        goto LABEL_33;
      }
      goto LABEL_30;
    }
    goto LABEL_133;
  }
LABEL_127:
  unint64_t v66 = *(void *)(a1 + 184) & 0xFFFFFFFFFFFFFFFELL;
  uint64_t v67 = *(unsigned __int8 *)(v66 + 23);
  uint64_t v68 = *(void *)(v66 + 8);
  if ((v67 & 0x80u) == 0) {
    uint64_t v68 = v67;
  }
  result += v68 + ((9 * (__clz(v68 | 1) ^ 0x1F) + 73) >> 6) + 2;
  if ((v27 & 0x20) != 0) {
    goto LABEL_130;
  }
LABEL_28:
  if ((v27 & 0x40) == 0) {
    goto LABEL_29;
  }
LABEL_133:
  unint64_t v72 = *(void *)(a1 + 200) & 0xFFFFFFFFFFFFFFFELL;
  uint64_t v73 = *(unsigned __int8 *)(v72 + 23);
  uint64_t v74 = *(void *)(v72 + 8);
  if ((v73 & 0x80u) == 0) {
    uint64_t v74 = v73;
  }
  result += v74 + ((9 * (__clz(v74 | 1) ^ 0x1F) + 73) >> 6) + 2;
  if ((v27 & 0x80) != 0)
  {
LABEL_30:
    unint64_t v28 = *(void *)(a1 + 208) & 0xFFFFFFFFFFFFFFFELL;
    uint64_t v29 = *(unsigned __int8 *)(v28 + 23);
    uint64_t v30 = *(void *)(v28 + 8);
    if ((v29 & 0x80u) == 0) {
      uint64_t v30 = v29;
    }
    result += v30 + ((9 * (__clz(v30 | 1) ^ 0x1F) + 73) >> 6) + 2;
  }
LABEL_33:
  if ((v27 & 0xFF00) == 0) {
    goto LABEL_51;
  }
  if ((v27 & 0x100) != 0)
  {
    int v75 = *(_DWORD *)(a1 + 216);
    uint64_t v76 = (9 * (__clz(v75 | 1) ^ 0x1F) + 73) >> 6;
    if (v75 >= 0) {
      uint64_t v77 = v76;
    }
    else {
      uint64_t v77 = 10;
    }
    result += v77 + 1;
    if ((v27 & 0x200) == 0)
    {
LABEL_36:
      if ((v27 & 0x400) == 0) {
        goto LABEL_37;
      }
LABEL_145:
      result += ((9 * (__clz(*(void *)(a1 + 224) | 1) ^ 0x3F) + 73) >> 6) + 1;
      if ((v27 & 0x800) != 0) {
        goto LABEL_38;
      }
      goto LABEL_42;
    }
  }
  else if ((v27 & 0x200) == 0)
  {
    goto LABEL_36;
  }
  int v78 = *(_DWORD *)(a1 + 220);
  uint64_t v79 = (9 * (__clz(v78 | 1) ^ 0x1F) + 73) >> 6;
  if (v78 >= 0) {
    uint64_t v80 = v79;
  }
  else {
    uint64_t v80 = 10;
  }
  result += v80 + 1;
  if ((v27 & 0x400) != 0) {
    goto LABEL_145;
  }
LABEL_37:
  if ((v27 & 0x800) != 0)
  {
LABEL_38:
    int v31 = *(_DWORD *)(a1 + 232);
    uint64_t v32 = (9 * (__clz(v31 | 1) ^ 0x1F) + 73) >> 6;
    if (v31 >= 0) {
      uint64_t v33 = v32;
    }
    else {
      uint64_t v33 = 10;
    }
    result += v33 + 1;
  }
LABEL_42:
  uint64_t v34 = result + 3;
  if ((v27 & 0x1000) == 0) {
    uint64_t v34 = result;
  }
  if ((v27 & 0x2000) != 0) {
    v34 += 3;
  }
  if ((v27 & 0x4000) != 0) {
    v34 += 3;
  }
  if ((v27 & 0x8000) != 0) {
    uint64_t result = v34 + 3;
  }
  else {
    uint64_t result = v34;
  }
LABEL_51:
  if ((v27 & 0xFF0000) == 0) {
    goto LABEL_73;
  }
  uint64_t v35 = result + 3;
  if ((v27 & 0x10000) == 0) {
    uint64_t v35 = result;
  }
  if ((v27 & 0x20000) != 0) {
    v35 += 3;
  }
  if ((v27 & 0x40000) != 0) {
    v35 += 3;
  }
  if ((v27 & 0x80000) != 0)
  {
    int v36 = *(_DWORD *)(a1 + 244);
    uint64_t v37 = (9 * (__clz(v36 | 1) ^ 0x1F) + 73) >> 6;
    if (v36 >= 0) {
      uint64_t v38 = v37;
    }
    else {
      uint64_t v38 = 10;
    }
    v35 += v38 + 2;
  }
  if ((v27 & 0x100000) != 0) {
    uint64_t result = v35 + 6;
  }
  else {
    uint64_t result = v35;
  }
  if ((v27 & 0x200000) != 0)
  {
    result += ((9 * (__clz(*(void *)(a1 + 256) | 1) ^ 0x3F) + 73) >> 6) + 2;
    if ((v27 & 0x400000) == 0)
    {
LABEL_68:
      if ((v27 & 0x800000) == 0) {
        goto LABEL_73;
      }
      goto LABEL_69;
    }
  }
  else if ((v27 & 0x400000) == 0)
  {
    goto LABEL_68;
  }
  int v81 = *(_DWORD *)(a1 + 264);
  uint64_t v82 = (9 * (__clz(v81 | 1) ^ 0x1F) + 73) >> 6;
  if (v81 >= 0) {
    uint64_t v83 = v82;
  }
  else {
    uint64_t v83 = 10;
  }
  result += v83 + 1;
  if ((v27 & 0x800000) != 0)
  {
LABEL_69:
    int v39 = *(_DWORD *)(a1 + 268);
    uint64_t v40 = (9 * (__clz(v39 | 1) ^ 0x1F) + 73) >> 6;
    if (v39 >= 0) {
      uint64_t v41 = v40;
    }
    else {
      uint64_t v41 = 10;
    }
    result += v41 + 1;
  }
LABEL_73:
  if (!HIBYTE(v27)) {
    goto LABEL_94;
  }
  uint64_t v42 = result + 5;
  if ((v27 & 0x1000000) == 0) {
    uint64_t v42 = result;
  }
  if ((v27 & 0x2000000) != 0)
  {
    int v43 = *(_DWORD *)(a1 + 276);
    uint64_t v44 = (9 * (__clz(v43 | 1) ^ 0x1F) + 73) >> 6;
    if (v43 >= 0) {
      uint64_t v45 = v44;
    }
    else {
      uint64_t v45 = 10;
    }
    v42 += v45 + 1;
  }
  if ((v27 & 0x4000000) != 0) {
    v42 += 5;
  }
  if ((v27 & 0x8000000) != 0)
  {
    int v90 = *(_DWORD *)(a1 + 284);
    uint64_t v91 = (9 * (__clz(v90 | 1) ^ 0x1F) + 73) >> 6;
    if (v90 >= 0) {
      uint64_t v92 = v91;
    }
    else {
      uint64_t v92 = 10;
    }
    v42 += v92 + 2;
    if ((v27 & 0x10000000) == 0)
    {
LABEL_85:
      if ((v27 & 0x20000000) == 0) {
        goto LABEL_86;
      }
LABEL_170:
      int v96 = *(_DWORD *)(a1 + 292);
      uint64_t v97 = ((9 * (__clz(v96 | 1) ^ 0x1F) + 73) >> 6) + 2;
      if (v96 >= 0) {
        uint64_t v98 = v97;
      }
      else {
        uint64_t v98 = 12;
      }
      v42 += v98;
      if ((v27 & 0x40000000) == 0) {
        goto LABEL_91;
      }
      goto LABEL_87;
    }
  }
  else if ((v27 & 0x10000000) == 0)
  {
    goto LABEL_85;
  }
  int v93 = *(_DWORD *)(a1 + 288);
  uint64_t v94 = ((9 * (__clz(v93 | 1) ^ 0x1F) + 73) >> 6) + 2;
  if (v93 >= 0) {
    uint64_t v95 = v94;
  }
  else {
    uint64_t v95 = 12;
  }
  v42 += v95;
  if ((v27 & 0x20000000) != 0) {
    goto LABEL_170;
  }
LABEL_86:
  if ((v27 & 0x40000000) != 0)
  {
LABEL_87:
    int v46 = *(_DWORD *)(a1 + 296);
    uint64_t v47 = ((9 * (__clz(v46 | 1) ^ 0x1F) + 73) >> 6) + 2;
    if (v46 >= 0) {
      uint64_t v48 = v47;
    }
    else {
      uint64_t v48 = 12;
    }
    v42 += v48;
  }
LABEL_91:
  if (v27 >= 0) {
    uint64_t result = v42;
  }
  else {
    uint64_t result = v42 + 3;
  }
LABEL_94:
  if (!*(unsigned char *)(a1 + 44)) {
    goto LABEL_113;
  }
  uint64_t v49 = result + 3;
  if ((*(unsigned char *)(a1 + 44) & 1) == 0) {
    uint64_t v49 = result;
  }
  if ((*(unsigned char *)(a1 + 44) & 2) != 0) {
    v49 += 3;
  }
  if ((*(unsigned char *)(a1 + 44) & 4) != 0) {
    v49 += 3;
  }
  if ((*(unsigned char *)(a1 + 44) & 8) != 0) {
    v49 += 3;
  }
  if ((*(unsigned char *)(a1 + 44) & 0x10) != 0) {
    uint64_t result = v49 + 3;
  }
  else {
    uint64_t result = v49;
  }
  if ((*(unsigned char *)(a1 + 44) & 0x20) != 0)
  {
    int v84 = *(_DWORD *)(a1 + 308);
    uint64_t v85 = ((9 * (__clz(v84 | 1) ^ 0x1F) + 73) >> 6) + 2;
    if (v84 >= 0) {
      uint64_t v86 = v85;
    }
    else {
      uint64_t v86 = 12;
    }
    result += v86;
    if ((*(unsigned char *)(a1 + 44) & 0x40) == 0)
    {
LABEL_108:
      if ((*(unsigned char *)(a1 + 44) & 0x80) == 0) {
        goto LABEL_113;
      }
      goto LABEL_109;
    }
  }
  else if ((*(unsigned char *)(a1 + 44) & 0x40) == 0)
  {
    goto LABEL_108;
  }
  int v87 = *(_DWORD *)(a1 + 312);
  uint64_t v88 = ((9 * (__clz(v87 | 1) ^ 0x1F) + 73) >> 6) + 2;
  if (v87 >= 0) {
    uint64_t v89 = v88;
  }
  else {
    uint64_t v89 = 12;
  }
  result += v89;
  if ((*(unsigned char *)(a1 + 44) & 0x80) != 0)
  {
LABEL_109:
    int v50 = *(_DWORD *)(a1 + 316);
    uint64_t v51 = ((9 * (__clz(v50 | 1) ^ 0x1F) + 73) >> 6) + 2;
    if (v50 >= 0) {
      uint64_t v52 = v51;
    }
    else {
      uint64_t v52 = 12;
    }
    result += v52;
  }
LABEL_113:
  uint64_t v53 = *(void *)(a1 + 8);
  if (v53)
  {
    unint64_t v99 = v53 & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v99 + 31) < 0) {
      uint64_t v100 = *(void *)(v99 + 16);
    }
    else {
      uint64_t v100 = *(unsigned __int8 *)(v99 + 31);
    }
    result += v100;
  }
  *(_DWORD *)(a1 + 48) = result;
  return result;
}

void sub_25C153E50(uint64_t a1, uint64_t a2)
{
  sub_25C13FC28(a1 + 16, a2 + 16);
  uint64_t v4 = *(void *)(a2 + 8);
  if (v4)
  {
    unint64_t v5 = v4 & 0xFFFFFFFFFFFFFFFELL;
    unint64_t v6 = (v4 & 0xFFFFFFFFFFFFFFFELL) + 8;
    uint64_t v7 = *(void *)(a1 + 8);
    if (v7) {
      uint64_t v8 = (std::string *)((v7 & 0xFFFFFFFFFFFFFFFELL) + 8);
    }
    else {
      uint64_t v8 = (std::string *)sub_25C142B28((unint64_t *)(a1 + 8));
    }
    int v9 = *(char *)(v5 + 31);
    if (v9 >= 0) {
      uint64_t v10 = (const std::string::value_type *)v6;
    }
    else {
      uint64_t v10 = *(const std::string::value_type **)(v5 + 8);
    }
    if (v9 >= 0) {
      std::string::size_type v11 = *(unsigned __int8 *)(v5 + 31);
    }
    else {
      std::string::size_type v11 = *(void *)(v5 + 16);
    }
    std::string::append(v8, v10, v11);
  }
  unsigned int v12 = *(_DWORD *)(a2 + 64);
  if (v12)
  {
    uint64_t v13 = (const std::string **)(*(void *)(a2 + 72) + 8);
    uint64_t v14 = (std::string **)sub_25C14C1A8((uint64_t *)(a1 + 56), *(_DWORD *)(a2 + 64));
    sub_25C140BD8((std::string *)(a1 + 56), v14, v13, v12, **(_DWORD **)(a1 + 72) - *(_DWORD *)(a1 + 64));
    signed int v15 = *(_DWORD *)(a1 + 64) + v12;
    *(_DWORD *)(a1 + 64) = v15;
    uint64_t v16 = *(signed int **)(a1 + 72);
    if (*v16 < v15) {
      *uint64_t v16 = v15;
    }
  }
  unsigned int v17 = *(_DWORD *)(a2 + 88);
  if (v17)
  {
    uint64_t v18 = (const std::string **)(*(void *)(a2 + 96) + 8);
    uint64_t v19 = (std::string **)sub_25C14C1A8((uint64_t *)(a1 + 80), *(_DWORD *)(a2 + 88));
    sub_25C140BD8((std::string *)(a1 + 80), v19, v18, v17, **(_DWORD **)(a1 + 96) - *(_DWORD *)(a1 + 88));
    signed int v20 = *(_DWORD *)(a1 + 88) + v17;
    *(_DWORD *)(a1 + 88) = v20;
    uint64_t v21 = *(signed int **)(a1 + 96);
    if (*v21 < v20) {
      *uint64_t v21 = v20;
    }
  }
  unsigned int v22 = *(_DWORD *)(a2 + 112);
  if (v22)
  {
    uint64_t v23 = (const std::string **)(*(void *)(a2 + 120) + 8);
    uint64_t v24 = (std::string **)sub_25C14C1A8((uint64_t *)(a1 + 104), *(_DWORD *)(a2 + 112));
    sub_25C140BD8((std::string *)(a1 + 104), v24, v23, v22, **(_DWORD **)(a1 + 120) - *(_DWORD *)(a1 + 112));
    signed int v25 = *(_DWORD *)(a1 + 112) + v22;
    *(_DWORD *)(a1 + 112) = v25;
    uint64_t v26 = *(signed int **)(a1 + 120);
    if (*v26 < v25) {
      *uint64_t v26 = v25;
    }
  }
  unsigned int v27 = *(_DWORD *)(a2 + 136);
  if (v27)
  {
    unint64_t v28 = (const std::string **)(*(void *)(a2 + 144) + 8);
    uint64_t v29 = (std::string **)sub_25C14C1A8((uint64_t *)(a1 + 128), *(_DWORD *)(a2 + 136));
    sub_25C140BD8((std::string *)(a1 + 128), v29, v28, v27, **(_DWORD **)(a1 + 144) - *(_DWORD *)(a1 + 136));
    signed int v30 = *(_DWORD *)(a1 + 136) + v27;
    *(_DWORD *)(a1 + 136) = v30;
    int v31 = *(signed int **)(a1 + 144);
    if (*v31 < v30) {
      signed int *v31 = v30;
    }
  }
  unsigned int v32 = *(_DWORD *)(a2 + 40);
  if (!(_BYTE)v32) {
    goto LABEL_57;
  }
  if (v32)
  {
    uint64_t v33 = (long long *)(*(void *)(a2 + 152) & 0xFFFFFFFFFFFFFFFELL);
    *(_DWORD *)(a1 + 40) |= 1u;
    uint64_t v34 = *(void *)(a1 + 8);
    uint64_t v35 = (void *)(v34 & 0xFFFFFFFFFFFFFFFELL);
    if (v34) {
      uint64_t v35 = (void *)*v35;
    }
    sub_25C136668((void *)(a1 + 152), (uint64_t)&qword_26A5963D0, v33, (uint64_t)v35);
    if ((v32 & 2) == 0)
    {
LABEL_26:
      if ((v32 & 4) == 0) {
        goto LABEL_27;
      }
      goto LABEL_39;
    }
  }
  else if ((v32 & 2) == 0)
  {
    goto LABEL_26;
  }
  int v36 = (long long *)(*(void *)(a2 + 160) & 0xFFFFFFFFFFFFFFFELL);
  *(_DWORD *)(a1 + 40) |= 2u;
  uint64_t v37 = *(void *)(a1 + 8);
  uint64_t v38 = (void *)(v37 & 0xFFFFFFFFFFFFFFFELL);
  if (v37) {
    uint64_t v38 = (void *)*v38;
  }
  sub_25C136668((void *)(a1 + 160), (uint64_t)&qword_26A5963D0, v36, (uint64_t)v38);
  if ((v32 & 4) == 0)
  {
LABEL_27:
    if ((v32 & 8) == 0) {
      goto LABEL_28;
    }
    goto LABEL_42;
  }
LABEL_39:
  int v39 = (long long *)(*(void *)(a2 + 168) & 0xFFFFFFFFFFFFFFFELL);
  *(_DWORD *)(a1 + 40) |= 4u;
  uint64_t v40 = *(void *)(a1 + 8);
  uint64_t v41 = (void *)(v40 & 0xFFFFFFFFFFFFFFFELL);
  if (v40) {
    uint64_t v41 = (void *)*v41;
  }
  sub_25C136668((void *)(a1 + 168), (uint64_t)&qword_26A5963D0, v39, (uint64_t)v41);
  if ((v32 & 8) == 0)
  {
LABEL_28:
    if ((v32 & 0x10) == 0) {
      goto LABEL_29;
    }
    goto LABEL_45;
  }
LABEL_42:
  uint64_t v42 = (long long *)(*(void *)(a2 + 176) & 0xFFFFFFFFFFFFFFFELL);
  *(_DWORD *)(a1 + 40) |= 8u;
  uint64_t v43 = *(void *)(a1 + 8);
  uint64_t v44 = (void *)(v43 & 0xFFFFFFFFFFFFFFFELL);
  if (v43) {
    uint64_t v44 = (void *)*v44;
  }
  sub_25C136668((void *)(a1 + 176), 0, v42, (uint64_t)v44);
  if ((v32 & 0x10) == 0)
  {
LABEL_29:
    if ((v32 & 0x20) == 0) {
      goto LABEL_30;
    }
LABEL_48:
    uint64_t v48 = (long long *)(*(void *)(a2 + 192) & 0xFFFFFFFFFFFFFFFELL);
    *(_DWORD *)(a1 + 40) |= 0x20u;
    uint64_t v49 = *(void *)(a1 + 8);
    int v50 = (void *)(v49 & 0xFFFFFFFFFFFFFFFELL);
    if (v49) {
      int v50 = (void *)*v50;
    }
    sub_25C136668((void *)(a1 + 192), 0, v48, (uint64_t)v50);
    if ((v32 & 0x40) == 0)
    {
LABEL_31:
      if ((v32 & 0x80) == 0) {
        goto LABEL_57;
      }
      goto LABEL_54;
    }
    goto LABEL_51;
  }
LABEL_45:
  uint64_t v45 = (long long *)(*(void *)(a2 + 184) & 0xFFFFFFFFFFFFFFFELL);
  *(_DWORD *)(a1 + 40) |= 0x10u;
  uint64_t v46 = *(void *)(a1 + 8);
  uint64_t v47 = (void *)(v46 & 0xFFFFFFFFFFFFFFFELL);
  if (v46) {
    uint64_t v47 = (void *)*v47;
  }
  sub_25C136668((void *)(a1 + 184), 0, v45, (uint64_t)v47);
  if ((v32 & 0x20) != 0) {
    goto LABEL_48;
  }
LABEL_30:
  if ((v32 & 0x40) == 0) {
    goto LABEL_31;
  }
LABEL_51:
  uint64_t v51 = (long long *)(*(void *)(a2 + 200) & 0xFFFFFFFFFFFFFFFELL);
  *(_DWORD *)(a1 + 40) |= 0x40u;
  uint64_t v52 = *(void *)(a1 + 8);
  uint64_t v53 = (void *)(v52 & 0xFFFFFFFFFFFFFFFELL);
  if (v52) {
    uint64_t v53 = (void *)*v53;
  }
  sub_25C136668((void *)(a1 + 200), 0, v51, (uint64_t)v53);
  if ((v32 & 0x80) != 0)
  {
LABEL_54:
    unint64_t v54 = (long long *)(*(void *)(a2 + 208) & 0xFFFFFFFFFFFFFFFELL);
    *(_DWORD *)(a1 + 40) |= 0x80u;
    uint64_t v55 = *(void *)(a1 + 8);
    uint64_t v56 = (void *)(v55 & 0xFFFFFFFFFFFFFFFELL);
    if (v55) {
      uint64_t v56 = (void *)*v56;
    }
    sub_25C136668((void *)(a1 + 208), 0, v54, (uint64_t)v56);
  }
LABEL_57:
  if ((v32 & 0xFF00) == 0) {
    goto LABEL_68;
  }
  if ((v32 & 0x100) != 0)
  {
    *(_DWORD *)(a1 + 216) = *(_DWORD *)(a2 + 216);
    if ((v32 & 0x200) == 0)
    {
LABEL_60:
      if ((v32 & 0x400) == 0) {
        goto LABEL_61;
      }
      goto LABEL_103;
    }
  }
  else if ((v32 & 0x200) == 0)
  {
    goto LABEL_60;
  }
  *(_DWORD *)(a1 + 220) = *(_DWORD *)(a2 + 220);
  if ((v32 & 0x400) == 0)
  {
LABEL_61:
    if ((v32 & 0x800) == 0) {
      goto LABEL_62;
    }
    goto LABEL_104;
  }
LABEL_103:
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  if ((v32 & 0x800) == 0)
  {
LABEL_62:
    if ((v32 & 0x1000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_105;
  }
LABEL_104:
  *(_DWORD *)(a1 + 232) = *(_DWORD *)(a2 + 232);
  if ((v32 & 0x1000) == 0)
  {
LABEL_63:
    if ((v32 & 0x2000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_106;
  }
LABEL_105:
  *(unsigned char *)(a1 + 236) = *(unsigned char *)(a2 + 236);
  if ((v32 & 0x2000) == 0)
  {
LABEL_64:
    if ((v32 & 0x4000) == 0) {
      goto LABEL_65;
    }
LABEL_107:
    *(unsigned char *)(a1 + 238) = *(unsigned char *)(a2 + 238);
    if ((v32 & 0x8000) == 0) {
      goto LABEL_67;
    }
    goto LABEL_66;
  }
LABEL_106:
  *(unsigned char *)(a1 + 237) = *(unsigned char *)(a2 + 237);
  if ((v32 & 0x4000) != 0) {
    goto LABEL_107;
  }
LABEL_65:
  if ((v32 & 0x8000) != 0) {
LABEL_66:
  }
    *(unsigned char *)(a1 + 239) = *(unsigned char *)(a2 + 239);
LABEL_67:
  *(_DWORD *)(a1 + 40) |= v32;
LABEL_68:
  if ((v32 & 0xFF0000) == 0) {
    goto LABEL_79;
  }
  if ((v32 & 0x10000) != 0)
  {
    *(unsigned char *)(a1 + 240) = *(unsigned char *)(a2 + 240);
    if ((v32 & 0x20000) == 0)
    {
LABEL_71:
      if ((v32 & 0x40000) == 0) {
        goto LABEL_72;
      }
      goto LABEL_111;
    }
  }
  else if ((v32 & 0x20000) == 0)
  {
    goto LABEL_71;
  }
  *(unsigned char *)(a1 + 241) = *(unsigned char *)(a2 + 241);
  if ((v32 & 0x40000) == 0)
  {
LABEL_72:
    if ((v32 & 0x80000) == 0) {
      goto LABEL_73;
    }
    goto LABEL_112;
  }
LABEL_111:
  *(unsigned char *)(a1 + 242) = *(unsigned char *)(a2 + 242);
  if ((v32 & 0x80000) == 0)
  {
LABEL_73:
    if ((v32 & 0x100000) == 0) {
      goto LABEL_74;
    }
    goto LABEL_113;
  }
LABEL_112:
  *(_DWORD *)(a1 + 244) = *(_DWORD *)(a2 + 244);
  if ((v32 & 0x100000) == 0)
  {
LABEL_74:
    if ((v32 & 0x200000) == 0) {
      goto LABEL_75;
    }
    goto LABEL_114;
  }
LABEL_113:
  *(_DWORD *)(a1 + 248) = *(_DWORD *)(a2 + 248);
  if ((v32 & 0x200000) == 0)
  {
LABEL_75:
    if ((v32 & 0x400000) == 0) {
      goto LABEL_76;
    }
LABEL_115:
    *(_DWORD *)(a1 + 264) = *(_DWORD *)(a2 + 264);
    if ((v32 & 0x800000) == 0) {
      goto LABEL_78;
    }
    goto LABEL_77;
  }
LABEL_114:
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  if ((v32 & 0x400000) != 0) {
    goto LABEL_115;
  }
LABEL_76:
  if ((v32 & 0x800000) != 0) {
LABEL_77:
  }
    *(_DWORD *)(a1 + 268) = *(_DWORD *)(a2 + 268);
LABEL_78:
  *(_DWORD *)(a1 + 40) |= v32;
LABEL_79:
  if (!HIBYTE(v32)) {
    goto LABEL_89;
  }
  if ((v32 & 0x1000000) != 0)
  {
    *(_DWORD *)(a1 + 272) = *(_DWORD *)(a2 + 272);
    if ((v32 & 0x2000000) == 0)
    {
LABEL_82:
      if ((v32 & 0x4000000) == 0) {
        goto LABEL_83;
      }
      goto LABEL_127;
    }
  }
  else if ((v32 & 0x2000000) == 0)
  {
    goto LABEL_82;
  }
  *(_DWORD *)(a1 + 276) = *(_DWORD *)(a2 + 276);
  if ((v32 & 0x4000000) == 0)
  {
LABEL_83:
    if ((v32 & 0x8000000) == 0) {
      goto LABEL_84;
    }
    goto LABEL_128;
  }
LABEL_127:
  *(_DWORD *)(a1 + 280) = *(_DWORD *)(a2 + 280);
  if ((v32 & 0x8000000) == 0)
  {
LABEL_84:
    if ((v32 & 0x10000000) == 0) {
      goto LABEL_85;
    }
    goto LABEL_129;
  }
LABEL_128:
  *(_DWORD *)(a1 + 284) = *(_DWORD *)(a2 + 284);
  if ((v32 & 0x10000000) == 0)
  {
LABEL_85:
    if ((v32 & 0x20000000) == 0) {
      goto LABEL_86;
    }
    goto LABEL_130;
  }
LABEL_129:
  *(_DWORD *)(a1 + 288) = *(_DWORD *)(a2 + 288);
  if ((v32 & 0x20000000) == 0)
  {
LABEL_86:
    if ((v32 & 0x40000000) == 0) {
      goto LABEL_87;
    }
LABEL_131:
    *(_DWORD *)(a1 + 296) = *(_DWORD *)(a2 + 296);
    if ((v32 & 0x80000000) == 0) {
      goto LABEL_88;
    }
LABEL_132:
    *(unsigned char *)(a1 + 300) = *(unsigned char *)(a2 + 300);
    goto LABEL_88;
  }
LABEL_130:
  *(_DWORD *)(a1 + 292) = *(_DWORD *)(a2 + 292);
  if ((v32 & 0x40000000) != 0) {
    goto LABEL_131;
  }
LABEL_87:
  if ((v32 & 0x80000000) != 0) {
    goto LABEL_132;
  }
LABEL_88:
  *(_DWORD *)(a1 + 40) |= v32;
LABEL_89:
  int v57 = *(_DWORD *)(a2 + 44);
  if (!(_BYTE)v57) {
    return;
  }
  if (v57)
  {
    *(unsigned char *)(a1 + 301) = *(unsigned char *)(a2 + 301);
    if ((v57 & 2) == 0)
    {
LABEL_92:
      if ((v57 & 4) == 0) {
        goto LABEL_93;
      }
      goto LABEL_119;
    }
  }
  else if ((v57 & 2) == 0)
  {
    goto LABEL_92;
  }
  *(unsigned char *)(a1 + 302) = *(unsigned char *)(a2 + 302);
  if ((v57 & 4) == 0)
  {
LABEL_93:
    if ((v57 & 8) == 0) {
      goto LABEL_94;
    }
    goto LABEL_120;
  }
LABEL_119:
  *(unsigned char *)(a1 + 303) = *(unsigned char *)(a2 + 303);
  if ((v57 & 8) == 0)
  {
LABEL_94:
    if ((v57 & 0x10) == 0) {
      goto LABEL_95;
    }
    goto LABEL_121;
  }
LABEL_120:
  *(unsigned char *)(a1 + 304) = *(unsigned char *)(a2 + 304);
  if ((v57 & 0x10) == 0)
  {
LABEL_95:
    if ((v57 & 0x20) == 0) {
      goto LABEL_96;
    }
    goto LABEL_122;
  }
LABEL_121:
  *(unsigned char *)(a1 + 305) = *(unsigned char *)(a2 + 305);
  if ((v57 & 0x20) == 0)
  {
LABEL_96:
    if ((v57 & 0x40) == 0) {
      goto LABEL_97;
    }
LABEL_123:
    *(_DWORD *)(a1 + 312) = *(_DWORD *)(a2 + 312);
    if ((v57 & 0x80) == 0) {
      goto LABEL_99;
    }
    goto LABEL_98;
  }
LABEL_122:
  *(_DWORD *)(a1 + 308) = *(_DWORD *)(a2 + 308);
  if ((v57 & 0x40) != 0) {
    goto LABEL_123;
  }
LABEL_97:
  if ((v57 & 0x80) != 0) {
LABEL_98:
  }
    *(_DWORD *)(a1 + 316) = *(_DWORD *)(a2 + 316);
LABEL_99:
  *(_DWORD *)(a1 + 44) |= v57;
}

uint64_t sub_25C1544B4(uint64_t a1)
{
  return sub_25C140D64(a1 + 16);
}

uint64_t sub_25C1544BC(uint64_t a1)
{
  sub_25C13FB88((unsigned char *)(a1 + 16));
  sub_25C13E13C(a1 + 56);
  sub_25C13E13C(a1 + 80);
  sub_25C13E13C(a1 + 104);
  uint64_t result = sub_25C13E13C(a1 + 128);
  unsigned int v3 = *(_DWORD *)(a1 + 40);
  if (!(_BYTE)v3) {
    goto LABEL_11;
  }
  if (v3)
  {
    unint64_t v6 = *(void *)(a1 + 152) & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v6 + 23) < 0)
    {
      **(unsigned char **)unint64_t v6 = 0;
      *(void *)(v6 + 8) = 0;
      if ((v3 & 2) != 0) {
        goto LABEL_28;
      }
    }
    else
    {
      *(unsigned char *)unint64_t v6 = 0;
      *(unsigned char *)(v6 + 23) = 0;
      if ((v3 & 2) != 0) {
        goto LABEL_28;
      }
    }
LABEL_4:
    if ((v3 & 4) == 0) {
      goto LABEL_5;
    }
LABEL_32:
    unint64_t v8 = *(void *)(a1 + 168) & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v8 + 23) < 0)
    {
      **(unsigned char **)unint64_t v8 = 0;
      *(void *)(v8 + 8) = 0;
      if ((v3 & 8) != 0) {
        goto LABEL_36;
      }
    }
    else
    {
      *(unsigned char *)unint64_t v8 = 0;
      *(unsigned char *)(v8 + 23) = 0;
      if ((v3 & 8) != 0) {
        goto LABEL_36;
      }
    }
LABEL_6:
    if ((v3 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_37;
  }
  if ((v3 & 2) == 0) {
    goto LABEL_4;
  }
LABEL_28:
  unint64_t v7 = *(void *)(a1 + 160) & 0xFFFFFFFFFFFFFFFELL;
  if (*(char *)(v7 + 23) < 0)
  {
    **(unsigned char **)unint64_t v7 = 0;
    *(void *)(v7 + 8) = 0;
    if ((v3 & 4) != 0) {
      goto LABEL_32;
    }
  }
  else
  {
    *(unsigned char *)unint64_t v7 = 0;
    *(unsigned char *)(v7 + 23) = 0;
    if ((v3 & 4) != 0) {
      goto LABEL_32;
    }
  }
LABEL_5:
  if ((v3 & 8) == 0) {
    goto LABEL_6;
  }
LABEL_36:
  uint64_t result = (uint64_t)sub_25C136BC8(*(std::string **)(a1 + 176), &off_26A5960E8);
  if ((v3 & 0x10) == 0)
  {
LABEL_7:
    if ((v3 & 0x20) == 0) {
      goto LABEL_8;
    }
LABEL_38:
    uint64_t result = (uint64_t)sub_25C136BC8(*(std::string **)(a1 + 192), &off_26A596088);
    if ((v3 & 0x40) == 0)
    {
LABEL_9:
      if ((v3 & 0x80) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    goto LABEL_39;
  }
LABEL_37:
  uint64_t result = (uint64_t)sub_25C136BC8(*(std::string **)(a1 + 184), &off_26A596068);
  if ((v3 & 0x20) != 0) {
    goto LABEL_38;
  }
LABEL_8:
  if ((v3 & 0x40) == 0) {
    goto LABEL_9;
  }
LABEL_39:
  uint64_t result = (uint64_t)sub_25C136BC8(*(std::string **)(a1 + 200), &off_26A5960A8);
  if ((v3 & 0x80) != 0) {
LABEL_10:
  }
    uint64_t result = (uint64_t)sub_25C136BC8(*(std::string **)(a1 + 208), &off_26A5960C8);
LABEL_11:
  if ((v3 & 0xFF00) != 0)
  {
    *(void *)(a1 + 216) = 0;
    *(void *)(a1 + 224) = 0;
    *(void *)(a1 + 232) = 0;
  }
  if ((v3 & 0xFF0000) != 0)
  {
    *(void *)(a1 + 240) = 0;
    *(void *)(a1 + 248) = 0;
    *(void *)(a1 + 256) = 0;
    *(void *)(a1 + 264) = 0x1F4000000001;
  }
  if (HIBYTE(v3))
  {
    *(void *)(a1 + 272) = 0xF42403F7FDF3BLL;
    *(_DWORD *)(a1 + 280) = 1061158912;
    *(_OWORD *)(a1 + 284) = xmmword_25C16DA10;
    *(unsigned char *)(a1 + 300) = 1;
  }
  if (*(unsigned char *)(a1 + 44))
  {
    *(unsigned char *)(a1 + 305) = 1;
    *(_DWORD *)(a1 + 301) = 16843009;
    *(_DWORD *)(a1 + 308) = 1;
    *(void *)(a1 + 312) = 0xFFFFFFFF00000002;
  }
  *(void *)(a1 + 40) = 0;
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4)
  {
    unint64_t v5 = v4 & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v5 + 31) < 0)
    {
      **(unsigned char **)(v5 + 8) = 0;
      *(void *)(v5 + 16) = 0;
    }
    else
    {
      *(unsigned char *)(v5 + 8) = 0;
      *(unsigned char *)(v5 + 31) = 0;
    }
  }
  return result;
}

void *sub_25C1546E8(uint64_t a1, uint64_t a2)
{
  return sub_25C1546F0(a2);
}

void *sub_25C1546F0(uint64_t a1)
{
  if (!a1) {
    operator new();
  }
  if (*(unsigned char *)(a1 + 24)) {
    (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(a1 + 32) + 32) + 40))(*(void *)(*(void *)(a1 + 32) + 32), &unk_270988FE0, 320);
  }
  uint64_t v2 = sub_25C1363A0((void *)a1, 0x140uLL);
  sub_25C150774((uint64_t)v2, a1);
  return v2;
}

void sub_25C15479C(_Unwind_Exception *a1)
{
  MEMORY[0x26117F4A0](v1, 0x10A1C40DFE95DFBLL);
  _Unwind_Resume(a1);
}

void *sub_25C1547C0()
{
  return sub_25C1546F0(0);
}

void *sub_25C1547C8@<X0>(void *a1@<X8>)
{
  return sub_25C13C824(a1, "sentencepiece.TrainerSpec");
}

void sub_25C1547D8(uint64_t *a1)
{
  sub_25C154810(a1);

  JUMPOUT(0x26117F4A0);
}

uint64_t *sub_25C154810(uint64_t *a1)
{
  uint64_t v2 = a1[19];
  if ((uint64_t *)v2 != &qword_26A5963D0)
  {
    if (*(char *)(v2 + 23) < 0) {
      operator delete(*(void **)v2);
    }
    MEMORY[0x26117F4A0](v2, 0x1012C40EC159624);
  }
  uint64_t v3 = a1[20];
  if ((uint64_t *)v3 != &qword_26A5963D0)
  {
    if (*(char *)(v3 + 23) < 0) {
      operator delete(*(void **)v3);
    }
    MEMORY[0x26117F4A0](v3, 0x1012C40EC159624);
  }
  uint64_t v4 = a1[21];
  if ((uint64_t *)v4 != &qword_26A5963D0)
  {
    if (*(char *)(v4 + 23) < 0) {
      operator delete(*(void **)v4);
    }
    MEMORY[0x26117F4A0](v4, 0x1012C40EC159624);
  }
  uint64_t v5 = a1[22];
  if (v5)
  {
    if (*(char *)(v5 + 23) < 0) {
      operator delete(*(void **)v5);
    }
    MEMORY[0x26117F4A0](v5, 0x1012C40EC159624);
  }
  uint64_t v6 = a1[23];
  if (v6)
  {
    if (*(char *)(v6 + 23) < 0) {
      operator delete(*(void **)v6);
    }
    MEMORY[0x26117F4A0](v6, 0x1012C40EC159624);
  }
  uint64_t v7 = a1[24];
  if (v7)
  {
    if (*(char *)(v7 + 23) < 0) {
      operator delete(*(void **)v7);
    }
    MEMORY[0x26117F4A0](v7, 0x1012C40EC159624);
  }
  uint64_t v8 = a1[25];
  if (v8)
  {
    if (*(char *)(v8 + 23) < 0) {
      operator delete(*(void **)v8);
    }
    MEMORY[0x26117F4A0](v8, 0x1012C40EC159624);
  }
  uint64_t v9 = a1[26];
  if (v9)
  {
    if (*(char *)(v9 + 23) < 0) {
      operator delete(*(void **)v9);
    }
    MEMORY[0x26117F4A0](v9, 0x1012C40EC159624);
  }
  sub_25C14D0BC(a1[1]);
  sub_25C14C2D4(a1 + 16);
  sub_25C14C2D4(a1 + 13);
  sub_25C14C2D4(a1 + 10);
  sub_25C14C2D4(a1 + 7);
  sub_25C13DB80((uint64_t)(a1 + 2));
  return a1;
}

void sub_25C154A04()
{
  sub_25C154A58((uint64_t)&unk_26A596258, 0);

  sub_25C147DA8((uint64_t)sub_25C1474BC, (uint64_t)&unk_26A596258);
}

uint64_t sub_25C154A58(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_270989AD8;
  *(void *)(a1 + 8) = a2;
  *(void *)(a1 + 16) = a2;
  *(_DWORD *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  if (atomic_load_explicit(dword_26B34E478, memory_order_acquire)) {
    sub_25C1475A0(dword_26B34E478);
  }
  *(void *)(a1 + 48) = &qword_26A5963D0;
  *(void *)(a1 + 56) = 0x100000000;
  return a1;
}

void sub_25C154AD8(_Unwind_Exception *a1)
{
  sub_25C13DB80(v1);
  _Unwind_Resume(a1);
}

char *sub_25C154AEC(uint64_t a1, char *a2, void *a3)
{
  uint64_t v4 = a2;
  int v6 = *(_DWORD *)(a1 + 40);
  if (v6)
  {
    uint64_t v4 = sub_25C14C714(a3, 1u, (const void **)(*(void *)(a1 + 48) & 0xFFFFFFFFFFFFFFFELL), a2);
    if ((v6 & 2) == 0)
    {
LABEL_3:
      if ((v6 & 4) == 0) {
        goto LABEL_18;
      }
      goto LABEL_9;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_3;
  }
  if (*a3 <= (unint64_t)v4) {
    uint64_t v4 = (char *)sub_25C13CEE0((uint64_t)a3, (int)v4);
  }
  int v7 = *(_DWORD *)(a1 + 56);
  *uint64_t v4 = 21;
  *(_DWORD *)(v4 + 1) = v7;
  v4 += 5;
  if ((v6 & 4) != 0)
  {
LABEL_9:
    if (*a3 <= (unint64_t)v4) {
      uint64_t v4 = (char *)sub_25C13CEE0((uint64_t)a3, (int)v4);
    }
    unint64_t v8 = *(int *)(a1 + 60);
    *uint64_t v4 = 24;
    if (v8 > 0x7F)
    {
      v4[1] = v8 | 0x80;
      unint64_t v9 = v8 >> 7;
      if (v8 >> 14)
      {
        uint64_t v10 = v4 + 2;
        do
        {
          std::string::size_type v11 = v10;
          *v10++ = v9 | 0x80;
          unint64_t v12 = v9 >> 7;
          unint64_t v13 = v9 >> 14;
          v9 >>= 7;
        }
        while (v13);
        uint64_t v4 = v11 + 2;
        unsigned char *v10 = v12;
      }
      else
      {
        v4[2] = v9;
        v4 += 3;
      }
    }
    else
    {
      v4[1] = v8;
      v4 += 2;
    }
  }
LABEL_18:
  uint64_t v14 = sub_25C142F0C(a1 + 16, v4, a3);
  signed int v15 = v14;
  uint64_t v16 = *(void *)(a1 + 8);
  if ((v16 & 1) == 0) {
    return v15;
  }
  unint64_t v18 = v16 & 0xFFFFFFFFFFFFFFFELL;
  if (*(char *)(v18 + 31) < 0)
  {
    uint64_t v19 = *(void **)(v18 + 8);
    uint64_t v20 = *(void *)(v18 + 16);
  }
  else
  {
    uint64_t v19 = (void *)(v18 + 8);
    LODWORD(v20) = *(unsigned __int8 *)(v18 + 31);
  }
  if (*a3 - (void)v14 >= (int)v20)
  {
    uint64_t v21 = (int)v20;
    memcpy(v14, v19, (int)v20);
    v15 += v21;
    return v15;
  }

  return (char *)sub_25C13D00C(a3, (char *)v19, v20, v14);
}

char *sub_25C154C98(uint64_t a1, char *a2, int32x2_t *a3)
{
  int v5 = 0;
  int v31 = a2;
  int v6 = (unint64_t *)(a1 + 8);
  int v7 = (uint64_t **)(a1 + 48);
  unint64_t v8 = (uint64_t *)(a1 + 16);
  while (1)
  {
    char v9 = sub_25C142E98((uint64_t)a3, &v31, a3[11].i32[1]);
    uint64_t result = v31;
    if (v9) {
      break;
    }
    std::string::size_type v11 = v31 + 1;
    unsigned int v12 = *v31;
    if (*v31 < 0)
    {
      unsigned int v12 = v12 + (*v11 << 7) - 128;
      if (*v11 < 0)
      {
        char v13 = 14;
        uint64_t v14 = 2;
        while (1)
        {
          v12 += (v31[v14] - 1) << v13;
          if ((v31[v14] & 0x80000000) == 0) {
            break;
          }
          ++v14;
          v13 += 7;
          if (v14 == 5)
          {
            uint64_t result = 0;
            goto LABEL_50;
          }
        }
        std::string::size_type v11 = &v31[v14 + 1];
      }
      else
      {
        std::string::size_type v11 = v31 + 2;
      }
    }
    int v31 = v11;
    unsigned int v15 = v12 >> 3;
    if (v12 >> 3 == 3)
    {
      if (v12 != 24) {
        goto LABEL_17;
      }
      uint64_t v19 = v11 + 1;
      unint64_t v20 = *v11;
      if (*v11 < 0)
      {
        int v21 = *v19;
        unint64_t v20 = (v20 + (v21 << 7) - 128);
        if ((v21 & 0x80) != 0)
        {
          char v26 = 14;
          uint64_t v27 = 2;
          while (1)
          {
            v20 += (v11[v27] - 1) << v26;
            if ((v11[v27] & 0x80000000) == 0) {
              break;
            }
            uint64_t result = 0;
            ++v27;
            v26 += 7;
            if (v27 == 10) {
              goto LABEL_50;
            }
          }
          uint64_t v19 = &v11[v27 + 1];
        }
        else
        {
          uint64_t v19 = v11 + 2;
        }
      }
      int v31 = v19;
      if ((v20 - 1) > 5)
      {
        if (*v6)
        {
          unint64_t v28 = (std::string *)((*v6 & 0xFFFFFFFFFFFFFFFELL) + 8);
        }
        else
        {
          unint64_t v29 = v20;
          signed int v30 = sub_25C142B28(v6);
          unint64_t v20 = v29;
          unint64_t v28 = (std::string *)v30;
        }
        sub_25C14B228(3, v20, v28);
      }
      else
      {
        *(_DWORD *)(a1 + 40) |= 4u;
        *(_DWORD *)(a1 + 60) = v20;
      }
    }
    else if (v15 == 2)
    {
      if (v12 != 21) {
        goto LABEL_17;
      }
      *(_DWORD *)(a1 + 56) = *(_DWORD *)v11;
      int v31 = v11 + 4;
      int v5 = 2;
    }
    else
    {
      if (v15 == 1 && v12 == 10)
      {
        *(_DWORD *)(a1 + 40) |= 1u;
        uint64_t v22 = *(void *)(a1 + 8);
        uint64_t v23 = (void *)(v22 & 0xFFFFFFFFFFFFFFFELL);
        if (v22) {
          uint64_t v23 = (void *)*v23;
        }
        uint64_t v24 = (std::string *)sub_25C1369B4(v7, (uint64_t)v23);
        uint64_t result = (char *)sub_25C14B33C(v24, v11, (uint64_t)a3);
        goto LABEL_35;
      }
LABEL_17:
      if (v12) {
        BOOL v17 = (v12 & 7) == 4;
      }
      else {
        BOOL v17 = 1;
      }
      if (v17)
      {
        a3[10].i32[0] = v12 - 1;
        uint64_t result = v11;
        break;
      }
      unint64_t v18 = v12;
      if (v12 < 0x640)
      {
        if (*v6) {
          signed int v25 = (std::string *)((*v6 & 0xFFFFFFFFFFFFFFFELL) + 8);
        }
        else {
          signed int v25 = (std::string *)sub_25C142B28(v6);
        }
        unsigned int v32 = v25;
        uint64_t result = (char *)sub_25C14B72C(v18, &v32, v11, a3);
      }
      else
      {
        uint64_t result = (char *)sub_25C140F2C(v8, v12, v11, (uint64_t)&unk_26A596258, v6, a3);
      }
LABEL_35:
      int v31 = result;
      if (!result) {
        break;
      }
    }
  }
LABEL_50:
  *(_DWORD *)(a1 + 40) |= v5;
  return result;
}

uint64_t sub_25C154F6C(uint64_t a1)
{
  return *(unsigned int *)(a1 + 44);
}

uint64_t sub_25C154F74(uint64_t a1)
{
  uint64_t result = sub_25C145C50(a1 + 16);
  int v3 = *(_DWORD *)(a1 + 40);
  if ((v3 & 7) != 0)
  {
    if (v3)
    {
      unint64_t v4 = *(void *)(a1 + 48) & 0xFFFFFFFFFFFFFFFELL;
      uint64_t v5 = *(unsigned __int8 *)(v4 + 23);
      uint64_t v6 = *(void *)(v4 + 8);
      if ((v5 & 0x80u) == 0) {
        uint64_t v6 = v5;
      }
      result += v6 + ((9 * (__clz(v6 | 1) ^ 0x1F) + 73) >> 6) + 1;
    }
    if ((v3 & 2) != 0) {
      result += 5;
    }
    if ((v3 & 4) != 0)
    {
      int v7 = *(_DWORD *)(a1 + 60);
      if (v7 < 0) {
        uint64_t v8 = 11;
      }
      else {
        uint64_t v8 = ((9 * (__clz(v7 | 1) ^ 0x1F) + 73) >> 6) + 1;
      }
      result += v8;
    }
  }
  uint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    unint64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v10 + 31) < 0) {
      uint64_t v11 = *(void *)(v10 + 16);
    }
    else {
      uint64_t v11 = *(unsigned __int8 *)(v10 + 31);
    }
    result += v11;
  }
  *(_DWORD *)(a1 + 44) = result;
  return result;
}

void sub_25C15505C(uint64_t a1, uint64_t a2)
{
  sub_25C13FC28(a1 + 16, a2 + 16);
  uint64_t v4 = *(void *)(a2 + 8);
  if (v4)
  {
    unint64_t v5 = v4 & 0xFFFFFFFFFFFFFFFELL;
    unint64_t v6 = (v4 & 0xFFFFFFFFFFFFFFFELL) + 8;
    uint64_t v7 = *(void *)(a1 + 8);
    if (v7) {
      uint64_t v8 = (std::string *)((v7 & 0xFFFFFFFFFFFFFFFELL) + 8);
    }
    else {
      uint64_t v8 = (std::string *)sub_25C142B28((unint64_t *)(a1 + 8));
    }
    int v9 = *(char *)(v5 + 31);
    if (v9 >= 0) {
      unint64_t v10 = (const std::string::value_type *)v6;
    }
    else {
      unint64_t v10 = *(const std::string::value_type **)(v5 + 8);
    }
    if (v9 >= 0) {
      std::string::size_type v11 = *(unsigned __int8 *)(v5 + 31);
    }
    else {
      std::string::size_type v11 = *(void *)(v5 + 16);
    }
    std::string::append(v8, v10, v11);
  }
  int v12 = *(_DWORD *)(a2 + 40);
  if ((v12 & 7) != 0)
  {
    if (v12)
    {
      char v13 = (long long *)(*(void *)(a2 + 48) & 0xFFFFFFFFFFFFFFFELL);
      *(_DWORD *)(a1 + 40) |= 1u;
      uint64_t v14 = *(void *)(a1 + 8);
      unsigned int v15 = (void *)(v14 & 0xFFFFFFFFFFFFFFFELL);
      if (v14) {
        unsigned int v15 = (void *)*v15;
      }
      sub_25C136668((void *)(a1 + 48), (uint64_t)&qword_26A5963D0, v13, (uint64_t)v15);
      if ((v12 & 2) == 0)
      {
LABEL_14:
        if ((v12 & 4) == 0)
        {
LABEL_16:
          *(_DWORD *)(a1 + 40) |= v12;
          return;
        }
LABEL_15:
        *(_DWORD *)(a1 + 60) = *(_DWORD *)(a2 + 60);
        goto LABEL_16;
      }
    }
    else if ((v12 & 2) == 0)
    {
      goto LABEL_14;
    }
    *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
    if ((v12 & 4) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
}

uint64_t sub_25C155154(uint64_t a1)
{
  return sub_25C140D64(a1 + 16);
}

unsigned char *sub_25C15515C(uint64_t a1)
{
  uint64_t result = sub_25C13FB88((unsigned char *)(a1 + 16));
  int v3 = *(_DWORD *)(a1 + 40);
  if (v3)
  {
    unint64_t v4 = *(void *)(a1 + 48) & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v4 + 23) < 0)
    {
      **(unsigned char **)unint64_t v4 = 0;
      *(void *)(v4 + 8) = 0;
    }
    else
    {
      *(unsigned char *)unint64_t v4 = 0;
      *(unsigned char *)(v4 + 23) = 0;
    }
  }
  if ((v3 & 6) != 0) {
    *(void *)(a1 + 56) = 0x100000000;
  }
  *(_DWORD *)(a1 + 40) = 0;
  uint64_t v5 = *(void *)(a1 + 8);
  if (v5)
  {
    unint64_t v6 = v5 & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v6 + 31) < 0)
    {
      **(unsigned char **)(v6 + 8) = 0;
      *(void *)(v6 + 16) = 0;
    }
    else
    {
      *(unsigned char *)(v6 + 8) = 0;
      *(unsigned char *)(v6 + 31) = 0;
    }
  }
  return result;
}

void *sub_25C1551F4(uint64_t a1, uint64_t a2)
{
  return sub_25C1551FC(a2);
}

void *sub_25C1551FC(uint64_t a1)
{
  if (!a1) {
    operator new();
  }
  if (*(unsigned char *)(a1 + 24)) {
    (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(a1 + 32) + 32) + 40))(*(void *)(*(void *)(a1 + 32) + 32), &unk_270989090, 64);
  }
  uint64_t v2 = sub_25C1363A0((void *)a1, 0x40uLL);
  sub_25C154A58((uint64_t)v2, a1);
  return v2;
}

void sub_25C1552A8(_Unwind_Exception *a1)
{
  MEMORY[0x26117F4A0](v1, 0x10A1C40F497E4DALL);
  _Unwind_Resume(a1);
}

void *sub_25C1552CC()
{
  return sub_25C1551FC(0);
}

void *sub_25C1552D4@<X0>(void *a1@<X8>)
{
  return sub_25C13C824(a1, "sentencepiece.ModelProto.SentencePiece");
}

void sub_25C1552E4(uint64_t a1)
{
  sub_25C15531C(a1);

  JUMPOUT(0x26117F4A0);
}

uint64_t sub_25C15531C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if ((uint64_t *)v2 != &qword_26A5963D0)
  {
    if (*(char *)(v2 + 23) < 0) {
      operator delete(*(void **)v2);
    }
    MEMORY[0x26117F4A0](v2, 0x1012C40EC159624);
  }
  sub_25C14D0BC(*(void *)(a1 + 8));
  sub_25C13DB80(a1 + 16);
  return a1;
}

void sub_25C155390()
{
  sub_25C1553E4((uint64_t)&unk_26A596298, 0);

  sub_25C147DA8((uint64_t)sub_25C1474BC, (uint64_t)&unk_26A596298);
}

uint64_t sub_25C1553E4(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 16) = a2;
  *(void *)a1 = &unk_2709893C8;
  *(void *)(a1 + 8) = a2;
  *(_DWORD *)(a1 + 24) = 0;
  *(void *)(a1 + 48) = a2;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  if (atomic_load_explicit(dword_26B34E490, memory_order_acquire)) {
    sub_25C1475A0(dword_26B34E490);
  }
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  return a1;
}

void sub_25C155474(_Unwind_Exception *a1)
{
  sub_25C155490(v2);
  sub_25C13DB80(v1);
  _Unwind_Resume(a1);
}

void sub_25C155490(void *a1)
{
  uint64_t v2 = (uint64_t *)a1[2];
  if (v2 && !*a1)
  {
    int v3 = v2 + 1;
    uint64_t v4 = *(unsigned int *)v2;
    if ((int)v4 >= 1)
    {
      do
      {
        if (*v3)
        {
          uint64_t v5 = sub_25C15531C(*v3);
          MEMORY[0x26117F4A0](v5, 0x10A1C40F497E4DALL);
        }
        ++v3;
        --v4;
      }
      while (v4);
      uint64_t v2 = (uint64_t *)a1[2];
    }
    operator delete(v2);
  }
  a1[2] = 0;
}

char *sub_25C155510(uint64_t a1, char *a2, void *a3)
{
  int v5 = *(_DWORD *)(a1 + 56);
  if (v5)
  {
    for (int i = 0; i != v5; ++i)
    {
      if (*a3 <= (unint64_t)a2) {
        a2 = (char *)sub_25C13CEE0((uint64_t)a3, (int)a2);
      }
      uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8 * i + 8);
      *a2 = 10;
      unsigned int v8 = *(_DWORD *)(v7 + 44);
      if (v8 > 0x7F)
      {
        a2[1] = v8 | 0x80;
        unsigned int v10 = v8 >> 7;
        if (v8 >> 14)
        {
          std::string::size_type v11 = a2 + 2;
          do
          {
            int v12 = v11;
            *v11++ = v10 | 0x80;
            unsigned int v13 = v10 >> 7;
            unsigned int v14 = v10 >> 14;
            v10 >>= 7;
          }
          while (v14);
          int v9 = v12 + 2;
          *std::string::size_type v11 = v13;
        }
        else
        {
          a2[2] = v10;
          int v9 = a2 + 3;
        }
      }
      else
      {
        a2[1] = v8;
        int v9 = a2 + 2;
      }
      a2 = sub_25C154AEC(v7, v9, a3);
    }
  }
  int v15 = *(_DWORD *)(a1 + 40);
  if (v15)
  {
    if (*a3 <= (unint64_t)a2) {
      a2 = (char *)sub_25C13CEE0((uint64_t)a3, (int)a2);
    }
    uint64_t v16 = *(void *)(a1 + 72);
    *a2 = 18;
    unsigned int v17 = *(_DWORD *)(v16 + 48);
    if (v17 > 0x7F)
    {
      a2[1] = v17 | 0x80;
      unsigned int v19 = v17 >> 7;
      if (v17 >> 14)
      {
        unint64_t v20 = a2 + 2;
        do
        {
          int v21 = v20;
          *v20++ = v19 | 0x80;
          unsigned int v22 = v19 >> 7;
          unsigned int v23 = v19 >> 14;
          v19 >>= 7;
        }
        while (v23);
        unint64_t v18 = v21 + 2;
        unsigned char *v20 = v22;
      }
      else
      {
        a2[2] = v19;
        unint64_t v18 = a2 + 3;
      }
    }
    else
    {
      a2[1] = v17;
      unint64_t v18 = a2 + 2;
    }
    a2 = sub_25C1508D8(v16, v18, a3);
    if ((v15 & 2) == 0)
    {
LABEL_15:
      if ((v15 & 4) == 0) {
        goto LABEL_16;
      }
      goto LABEL_38;
    }
  }
  else if ((v15 & 2) == 0)
  {
    goto LABEL_15;
  }
  if (*a3 <= (unint64_t)a2) {
    a2 = (char *)sub_25C13CEE0((uint64_t)a3, (int)a2);
  }
  uint64_t v24 = *(void *)(a1 + 80);
  *a2 = 26;
  unsigned int v25 = *(_DWORD *)(v24 + 44);
  if (v25 > 0x7F)
  {
    a2[1] = v25 | 0x80;
    unsigned int v27 = v25 >> 7;
    if (v25 >> 14)
    {
      unint64_t v28 = a2 + 2;
      do
      {
        unint64_t v29 = v28;
        *v28++ = v27 | 0x80;
        unsigned int v30 = v27 >> 7;
        unsigned int v31 = v27 >> 14;
        v27 >>= 7;
      }
      while (v31);
      char v26 = v29 + 2;
      *unint64_t v28 = v30;
    }
    else
    {
      a2[2] = v27;
      char v26 = a2 + 3;
    }
  }
  else
  {
    a2[1] = v25;
    char v26 = a2 + 2;
  }
  a2 = sub_25C14FAFC(v24, v26, a3);
  if ((v15 & 4) == 0)
  {
LABEL_16:
    if ((v15 & 8) == 0) {
      goto LABEL_58;
    }
    goto LABEL_48;
  }
LABEL_38:
  if (*a3 <= (unint64_t)a2) {
    a2 = (char *)sub_25C13CEE0((uint64_t)a3, (int)a2);
  }
  uint64_t v32 = *(void *)(a1 + 88);
  *a2 = 34;
  unsigned int v33 = *(_DWORD *)(v32 + 64);
  if (v33 > 0x7F)
  {
    a2[1] = v33 | 0x80;
    unsigned int v35 = v33 >> 7;
    if (v33 >> 14)
    {
      int v36 = a2 + 2;
      do
      {
        uint64_t v37 = v36;
        *v36++ = v35 | 0x80;
        unsigned int v38 = v35 >> 7;
        unsigned int v39 = v35 >> 14;
        v35 >>= 7;
      }
      while (v39);
      uint64_t v34 = v37 + 2;
      *int v36 = v38;
    }
    else
    {
      a2[2] = v35;
      uint64_t v34 = a2 + 3;
    }
  }
  else
  {
    a2[1] = v33;
    uint64_t v34 = a2 + 2;
  }
  a2 = sub_25C14F154(v32, v34, a3);
  if ((v15 & 8) != 0)
  {
LABEL_48:
    if (*a3 <= (unint64_t)a2) {
      a2 = (char *)sub_25C13CEE0((uint64_t)a3, (int)a2);
    }
    uint64_t v40 = *(void *)(a1 + 96);
    *a2 = 42;
    unsigned int v41 = *(_DWORD *)(v40 + 44);
    if (v41 > 0x7F)
    {
      a2[1] = v41 | 0x80;
      unsigned int v43 = v41 >> 7;
      if (v41 >> 14)
      {
        uint64_t v44 = a2 + 2;
        do
        {
          uint64_t v45 = v44;
          *v44++ = v43 | 0x80;
          unsigned int v46 = v43 >> 7;
          unsigned int v47 = v43 >> 14;
          v43 >>= 7;
        }
        while (v47);
        uint64_t v42 = v45 + 2;
        *uint64_t v44 = v46;
      }
      else
      {
        a2[2] = v43;
        uint64_t v42 = a2 + 3;
      }
    }
    else
    {
      a2[1] = v41;
      uint64_t v42 = a2 + 2;
    }
    a2 = sub_25C14FAFC(v40, v42, a3);
  }
LABEL_58:
  uint64_t v48 = sub_25C142F0C(a1 + 16, a2, a3);
  uint64_t v49 = v48;
  uint64_t v50 = *(void *)(a1 + 8);
  if ((v50 & 1) == 0) {
    return v49;
  }
  unint64_t v52 = v50 & 0xFFFFFFFFFFFFFFFELL;
  if (*(char *)(v52 + 31) < 0)
  {
    uint64_t v53 = *(void **)(v52 + 8);
    uint64_t v54 = *(void *)(v52 + 16);
  }
  else
  {
    uint64_t v53 = (void *)(v52 + 8);
    LODWORD(v54) = *(unsigned __int8 *)(v52 + 31);
  }
  if (*a3 - (void)v48 >= (int)v54)
  {
    uint64_t v55 = (int)v54;
    memcpy(v48, v53, (int)v54);
    v49 += v55;
    return v49;
  }

  return (char *)sub_25C13D00C(a3, (char *)v53, v54, v48);
}

char *sub_25C1558FC(uint64_t a1, char *a2, int32x2_t *a3)
{
  uint64_t v53 = a2;
  int v5 = (unint64_t *)(a1 + 8);
  unint64_t v6 = (uint64_t *)(a1 + 48);
  uint64_t v7 = (uint64_t *)(a1 + 16);
  while (2)
  {
    if (sub_25C142E98((uint64_t)a3, &v53, a3[11].i32[1])) {
      return v53;
    }
    unsigned int v8 = v53 + 1;
    unsigned int v9 = *v53;
    if (*v53 < 0)
    {
      unsigned int v9 = v9 + (*v8 << 7) - 128;
      if (*v8 < 0)
      {
        char v10 = 14;
        uint64_t v11 = 2;
        while (1)
        {
          v9 += (v53[v11] - 1) << v10;
          if ((v53[v11] & 0x80000000) == 0) {
            break;
          }
          ++v11;
          v10 += 7;
          if (v11 == 5) {
            return 0;
          }
        }
        unsigned int v8 = &v53[v11 + 1];
      }
      else
      {
        unsigned int v8 = v53 + 2;
      }
    }
    uint64_t v53 = v8;
    switch(v9 >> 3)
    {
      case 1u:
        if (v9 != 10) {
          goto LABEL_60;
        }
        --v8;
LABEL_14:
        int v12 = v8 + 1;
        uint64_t v53 = v8 + 1;
        unsigned int v13 = *(int **)(a1 + 64);
        if (!v13)
        {
          int v14 = *(_DWORD *)(a1 + 56);
          int v15 = *(_DWORD *)(a1 + 60);
LABEL_19:
          if (v14 <= v15)
          {
            sub_25C14C1A8(v6, v15 - v14 + 1);
            unsigned int v13 = *(int **)(a1 + 64);
          }
          int v15 = *v13;
          goto LABEL_22;
        }
        int v14 = *(_DWORD *)(a1 + 56);
        int v15 = *v13;
        if (v14 < *v13)
        {
          *(_DWORD *)(a1 + 56) = v14 + 1;
          uint64_t v16 = *(void **)&v13[2 * v14 + 2];
          goto LABEL_23;
        }
        if (v15 == *(_DWORD *)(a1 + 60)) {
          goto LABEL_19;
        }
LABEL_22:
        *unsigned int v13 = v15 + 1;
        uint64_t v16 = sub_25C1551FC(*(void *)(a1 + 48));
        uint64_t v17 = *(void *)(a1 + 64);
        uint64_t v18 = *(int *)(a1 + 56);
        *(_DWORD *)(a1 + 56) = v18 + 1;
        *(void *)(v17 + 8 * v18 + 8) = v16;
LABEL_23:
        int v19 = *v12;
        if (*v12 < 0)
        {
          uint64_t v21 = sub_25C14B1B0((uint64_t)(v8 + 1), v19);
          if (!v21) {
            return 0;
          }
          unint64_t v20 = (char *)v21;
        }
        else
        {
          unint64_t v20 = v8 + 2;
        }
        int32x2_t v22 = a3[1];
        int v23 = v19 + v20 - v22.i32[0];
        *a3 = (int32x2_t)(*(void *)&v22 + (v23 & (v23 >> 31)));
        __int32 v24 = a3[3].i32[1];
        a3[3].i32[1] = v23;
        v22.i32[0] = a3[11].i32[0];
        BOOL v25 = __OFSUB__(v22.i32[0]--, 1);
        a3[11].i32[0] = v22.i32[0];
        if (v22.i32[0] < 0 != v25) {
          return 0;
        }
        char v26 = sub_25C154C98((uint64_t)v16, v20, a3);
        unsigned int v8 = v26;
        if (v26)
        {
          ++a3[11].i32[0];
          if (a3[10].i32[0]) {
            return 0;
          }
          int v27 = a3[3].i32[1] + v24 - v23;
          a3[3].i32[1] = v27;
          int32x2_t v28 = (int32x2_t)(*(void *)&a3[1] + (v27 & (v27 >> 31)));
          *a3 = v28;
          uint64_t v53 = v26;
          if (*(void *)&v28 <= (unint64_t)v26 || *v26 != 10) {
            continue;
          }
          goto LABEL_14;
        }
        break;
      case 2u:
        if (v9 != 18) {
          goto LABEL_60;
        }
        *(_DWORD *)(a1 + 40) |= 1u;
        unint64_t v29 = *(void **)(a1 + 72);
        if (!v29)
        {
          unsigned int v30 = (void *)(*v5 & 0xFFFFFFFFFFFFFFFELL);
          if (*v5) {
            unsigned int v30 = (void *)*v30;
          }
          unint64_t v29 = sub_25C1546F0((uint64_t)v30);
          *(void *)(a1 + 72) = v29;
        }
        int v31 = *v8;
        if (*v8 < 0)
        {
          uint64_t v44 = sub_25C14B1B0((uint64_t)v8, v31);
          if (!v44) {
            return 0;
          }
          uint64_t v32 = (char *)v44;
        }
        else
        {
          uint64_t v32 = v8 + 1;
        }
        int32x2_t v45 = a3[1];
        int v46 = v31 + v32 - v45.i32[0];
        *a3 = (int32x2_t)(*(void *)&v45 + (v46 & (v46 >> 31)));
        __int32 v47 = a3[3].i32[1];
        a3[3].i32[1] = v46;
        v45.i32[0] = a3[11].i32[0];
        BOOL v25 = __OFSUB__(v45.i32[0]--, 1);
        a3[11].i32[0] = v45.i32[0];
        if (v45.i32[0] < 0 != v25) {
          return 0;
        }
        uint64_t v48 = sub_25C151A68((uint64_t)v29, v32, a3);
        if (!v48) {
          return 0;
        }
        goto LABEL_78;
      case 3u:
        if (v9 != 26) {
          goto LABEL_60;
        }
        *(_DWORD *)(a1 + 40) |= 2u;
        unsigned int v33 = *(void **)(a1 + 80);
        if (!v33)
        {
          uint64_t v34 = (void *)(*v5 & 0xFFFFFFFFFFFFFFFELL);
          if (*v5) {
            uint64_t v34 = (void *)*v34;
          }
          unsigned int v33 = sub_25C15051C((uint64_t)v34);
          *(void *)(a1 + 80) = v33;
        }
        goto LABEL_57;
      case 4u:
        if (v9 != 34) {
          goto LABEL_60;
        }
        *(_DWORD *)(a1 + 40) |= 4u;
        unsigned int v35 = *(void **)(a1 + 88);
        if (!v35)
        {
          int v36 = (void *)(*v5 & 0xFFFFFFFFFFFFFFFELL);
          if (*v5) {
            int v36 = (void *)*v36;
          }
          unsigned int v35 = sub_25C14F884((uint64_t)v36);
          *(void *)(a1 + 88) = v35;
        }
        int v37 = *v8;
        if (*v8 < 0)
        {
          uint64_t v49 = sub_25C14B1B0((uint64_t)v8, v37);
          if (!v49) {
            return 0;
          }
          unsigned int v38 = (char *)v49;
        }
        else
        {
          unsigned int v38 = v8 + 1;
        }
        int32x2_t v50 = a3[1];
        int v46 = v37 + v38 - v50.i32[0];
        *a3 = (int32x2_t)(*(void *)&v50 + (v46 & (v46 >> 31)));
        __int32 v47 = a3[3].i32[1];
        a3[3].i32[1] = v46;
        v50.i32[0] = a3[11].i32[0];
        BOOL v25 = __OFSUB__(v50.i32[0]--, 1);
        a3[11].i32[0] = v50.i32[0];
        if (v50.i32[0] < 0 != v25) {
          return 0;
        }
        uint64_t v48 = sub_25C14F2CC((uint64_t)v35, v38, a3);
        if (!v48) {
          return 0;
        }
LABEL_78:
        ++a3[11].i32[0];
        if (a3[10].i32[0]) {
          return 0;
        }
        int v51 = a3[3].i32[1] + v47 - v46;
        a3[3].i32[1] = v51;
        *a3 = (int32x2_t)(*(void *)&a3[1] + (v51 & (v51 >> 31)));
        uint64_t v53 = v48;
        continue;
      case 5u:
        if (v9 != 42) {
          goto LABEL_60;
        }
        *(_DWORD *)(a1 + 40) |= 8u;
        unsigned int v33 = *(void **)(a1 + 96);
        if (!v33)
        {
          unsigned int v39 = (void *)(*v5 & 0xFFFFFFFFFFFFFFFELL);
          if (*v5) {
            unsigned int v39 = (void *)*v39;
          }
          unsigned int v33 = sub_25C15051C((uint64_t)v39);
          *(void *)(a1 + 96) = v33;
        }
LABEL_57:
        uint64_t v40 = (char *)sub_25C155E48(a3, (uint64_t)v33, v8);
        goto LABEL_58;
      default:
LABEL_60:
        if (v9) {
          BOOL v41 = (v9 & 7) == 4;
        }
        else {
          BOOL v41 = 1;
        }
        if (v41)
        {
          a3[10].i32[0] = v9 - 1;
          return v8;
        }
        unint64_t v42 = v9;
        if (v9 < 0x640)
        {
          if (*v5) {
            unsigned int v43 = (std::string *)((*v5 & 0xFFFFFFFFFFFFFFFELL) + 8);
          }
          else {
            unsigned int v43 = (std::string *)sub_25C142B28(v5);
          }
          uint64_t v54 = v43;
          uint64_t v40 = (char *)sub_25C14B72C(v42, &v54, v8, a3);
        }
        else
        {
          uint64_t v40 = (char *)sub_25C140F2C(v7, v9, v8, (uint64_t)&unk_26A596298, v5, a3);
        }
LABEL_58:
        uint64_t v53 = v40;
        if (v40) {
          continue;
        }
        return 0;
    }
    return v8;
  }
}

uint64_t sub_25C155E48(int32x2_t *a1, uint64_t a2, char *a3)
{
  int v5 = *a3;
  if (*a3 < 0)
  {
    uint64_t result = sub_25C14B1B0((uint64_t)a3, v5);
    if (!result) {
      return result;
    }
    unint64_t v6 = (char *)result;
  }
  else
  {
    unint64_t v6 = a3 + 1;
  }
  int32x2_t v8 = a1[1];
  int v9 = v5 + v6 - v8.i32[0];
  *a1 = (int32x2_t)(*(void *)&v8 + (v9 & (v9 >> 31)));
  __int32 v10 = a1[3].i32[1];
  a1[3].i32[1] = v9;
  v8.i32[0] = a1[11].i32[0];
  BOOL v11 = __OFSUB__(v8.i32[0]--, 1);
  a1[11].i32[0] = v8.i32[0];
  if (v8.i32[0] < 0 != v11) {
    return 0;
  }
  uint64_t result = (uint64_t)sub_25C14FCD0(a2, v6, a1);
  if (!result) {
    return result;
  }
  ++a1[11].i32[0];
  if (a1[10].i32[0]) {
    return 0;
  }
  int v12 = a1[3].i32[1] + v10 - v9;
  a1[3].i32[1] = v12;
  *a1 = (int32x2_t)(*(void *)&a1[1] + (v12 & (v12 >> 31)));
  return result;
}

uint64_t sub_25C155F18(uint64_t a1)
{
  return *(unsigned int *)(a1 + 44);
}

uint64_t sub_25C155F20(uint64_t a1)
{
  uint64_t v2 = sub_25C145C50(a1 + 16);
  uint64_t v3 = *(int *)(a1 + 56);
  uint64_t v4 = v2 + v3;
  uint64_t v5 = *(void *)(a1 + 64);
  if (v5) {
    unint64_t v6 = (uint64_t *)(v5 + 8);
  }
  else {
    unint64_t v6 = 0;
  }
  if (v3)
  {
    uint64_t v7 = 8 * v3;
    do
    {
      uint64_t v8 = *v6++;
      uint64_t v9 = sub_25C154F74(v8);
      v4 += v9 + ((9 * (__clz(v9 | 1) ^ 0x1F) + 73) >> 6);
      v7 -= 8;
    }
    while (v7);
  }
  int v10 = *(_DWORD *)(a1 + 40);
  if ((v10 & 0xF) == 0) {
    goto LABEL_13;
  }
  if ((v10 & 1) == 0)
  {
    if ((v10 & 2) == 0) {
      goto LABEL_10;
    }
LABEL_16:
    uint64_t v15 = sub_25C150118(*(void *)(a1 + 80));
    v4 += v15 + ((9 * (__clz(v15 | 1) ^ 0x1F) + 73) >> 6) + 1;
    if ((v10 & 4) == 0)
    {
LABEL_11:
      if ((v10 & 8) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
    goto LABEL_17;
  }
  uint64_t v14 = sub_25C153614(*(void *)(a1 + 72));
  v4 += v14 + ((9 * (__clz(v14 | 1) ^ 0x1F) + 73) >> 6) + 1;
  if ((v10 & 2) != 0) {
    goto LABEL_16;
  }
LABEL_10:
  if ((v10 & 4) == 0) {
    goto LABEL_11;
  }
LABEL_17:
  uint64_t v16 = sub_25C14F5B4(*(void *)(a1 + 88));
  v4 += v16 + ((9 * (__clz(v16 | 1) ^ 0x1F) + 73) >> 6) + 1;
  if ((v10 & 8) != 0)
  {
LABEL_12:
    uint64_t v11 = sub_25C150118(*(void *)(a1 + 96));
    v4 += v11 + ((9 * (__clz(v11 | 1) ^ 0x1F) + 73) >> 6) + 1;
  }
LABEL_13:
  uint64_t v12 = *(void *)(a1 + 8);
  if (v12)
  {
    unint64_t v17 = v12 & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v17 + 31) < 0) {
      uint64_t v18 = *(void *)(v17 + 16);
    }
    else {
      uint64_t v18 = *(unsigned __int8 *)(v17 + 31);
    }
    v4 += v18;
  }
  *(_DWORD *)(a1 + 44) = v4;
  return v4;
}

void sub_25C1560B0(uint64_t a1, uint64_t a2)
{
  sub_25C13FC28(a1 + 16, a2 + 16);
  uint64_t v4 = (void *)(a1 + 8);
  uint64_t v5 = *(void *)(a2 + 8);
  if (v5)
  {
    unint64_t v6 = v5 & 0xFFFFFFFFFFFFFFFELL;
    unint64_t v7 = (v5 & 0xFFFFFFFFFFFFFFFELL) + 8;
    if (*v4) {
      uint64_t v8 = (std::string *)((*v4 & 0xFFFFFFFFFFFFFFFELL) + 8);
    }
    else {
      uint64_t v8 = (std::string *)sub_25C142B28((unint64_t *)(a1 + 8));
    }
    int v9 = *(char *)(v6 + 31);
    if (v9 >= 0) {
      int v10 = (const std::string::value_type *)v7;
    }
    else {
      int v10 = *(const std::string::value_type **)(v6 + 8);
    }
    if (v9 >= 0) {
      std::string::size_type v11 = *(unsigned __int8 *)(v6 + 31);
    }
    else {
      std::string::size_type v11 = *(void *)(v6 + 16);
    }
    std::string::append(v8, v10, v11);
  }
  int v12 = *(_DWORD *)(a2 + 56);
  if (v12)
  {
    uint64_t v45 = *(void *)(a2 + 64);
    uint64_t v44 = sub_25C14C1A8((uint64_t *)(a1 + 48), v12);
    uint64_t v13 = **(int **)(a1 + 64);
    uint64_t v14 = *(int *)(a1 + 56);
    int v15 = v13 - v14;
    if ((int)v13 - (int)v14 >= v12) {
      uint64_t v16 = v12;
    }
    else {
      uint64_t v16 = v15;
    }
    if ((int)v16 >= 1)
    {
      unint64_t v17 = (uint64_t *)v44;
      uint64_t v18 = (uint64_t *)(v45 + 8);
      do
      {
        uint64_t v20 = *v18++;
        uint64_t v19 = v20;
        uint64_t v21 = *v17++;
        sub_25C15639C(v19, v21);
        --v16;
      }
      while (v16);
    }
    if (v15 < v12)
    {
      uint64_t v22 = *(void *)(a1 + 48);
      int v23 = v14 + v12 - v13;
      uint64_t v24 = 8 * v13 - 8 * v14;
      BOOL v25 = (void *)(v44 + v24);
      char v26 = (uint64_t *)(v24 + v45 + 8);
      do
      {
        uint64_t v27 = *v26++;
        int32x2_t v28 = sub_25C1551FC(v22);
        sub_25C15639C(v27, (uint64_t)v28);
        *v25++ = v28;
        --v23;
      }
      while (v23);
    }
    int v29 = *(_DWORD *)(a1 + 56) + v12;
    *(_DWORD *)(a1 + 56) = v29;
    unsigned int v30 = *(int **)(a1 + 64);
    uint64_t v4 = (void *)(a1 + 8);
    if (*v30 < v29) {
      *unsigned int v30 = v29;
    }
  }
  int v31 = *(_DWORD *)(a2 + 40);
  if ((v31 & 0xF) != 0)
  {
    if (v31)
    {
      *(_DWORD *)(a1 + 40) |= 1u;
      uint64_t v32 = *(void **)(a1 + 72);
      if (!v32)
      {
        unsigned int v33 = (void *)(*v4 & 0xFFFFFFFFFFFFFFFELL);
        if (*v4) {
          unsigned int v33 = (void *)*v33;
        }
        uint64_t v32 = sub_25C1546F0((uint64_t)v33);
        *(void *)(a1 + 72) = v32;
      }
      if (*(void *)(a2 + 72)) {
        uint64_t v34 = *(void **)(a2 + 72);
      }
      else {
        uint64_t v34 = &unk_26A5963E8;
      }
      sub_25C153E50((uint64_t)v32, (uint64_t)v34);
    }
    if ((v31 & 2) != 0)
    {
      *(_DWORD *)(a1 + 40) |= 2u;
      unsigned int v35 = *(void **)(a1 + 80);
      if (!v35)
      {
        int v36 = (void *)(*v4 & 0xFFFFFFFFFFFFFFFELL);
        if (*v4) {
          int v36 = (void *)*v36;
        }
        unsigned int v35 = sub_25C15051C((uint64_t)v36);
        *(void *)(a1 + 80) = v35;
      }
      if (*(void *)(a2 + 80)) {
        int v37 = *(void **)(a2 + 80);
      }
      else {
        int v37 = &unk_26A596338;
      }
      sub_25C150278((uint64_t)v35, (uint64_t)v37);
      if ((v31 & 4) == 0)
      {
LABEL_35:
        if ((v31 & 8) == 0) {
          return;
        }
        goto LABEL_53;
      }
    }
    else if ((v31 & 4) == 0)
    {
      goto LABEL_35;
    }
    *(_DWORD *)(a1 + 40) |= 4u;
    unsigned int v38 = *(void **)(a1 + 88);
    if (!v38)
    {
      unsigned int v39 = (void *)(*v4 & 0xFFFFFFFFFFFFFFFELL);
      if (*v4) {
        unsigned int v39 = (void *)*v39;
      }
      unsigned int v38 = sub_25C14F884((uint64_t)v39);
      *(void *)(a1 + 88) = v38;
    }
    if (*(void *)(a2 + 88)) {
      uint64_t v40 = *(void **)(a2 + 88);
    }
    else {
      uint64_t v40 = &unk_26A596388;
    }
    sub_25C14F668((uint64_t)v38, (uint64_t)v40);
    if ((v31 & 8) != 0)
    {
LABEL_53:
      *(_DWORD *)(a1 + 40) |= 8u;
      BOOL v41 = *(void **)(a1 + 96);
      if (!v41)
      {
        unint64_t v42 = (void *)(*v4 & 0xFFFFFFFFFFFFFFFELL);
        if (*v4) {
          unint64_t v42 = (void *)*v42;
        }
        BOOL v41 = sub_25C15051C((uint64_t)v42);
        *(void *)(a1 + 96) = v41;
      }
      if (*(void *)(a2 + 96)) {
        unsigned int v43 = *(void **)(a2 + 96);
      }
      else {
        unsigned int v43 = &unk_26A596338;
      }
      sub_25C150278((uint64_t)v41, (uint64_t)v43);
    }
  }
}

void sub_25C15639C(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_25C1563AC(uint64_t a1)
{
  uint64_t result = sub_25C140D64(a1 + 16);
  if (result)
  {
    uint64_t v3 = *(unsigned int *)(a1 + 56);
    while ((int)v3 >= 1)
    {
      uint64_t v4 = v3 - 1;
      char v5 = sub_25C140D64(*(void *)(*(void *)(a1 + 64) + 8 * v3) + 16);
      uint64_t v3 = v4;
      if ((v5 & 1) == 0) {
        return 0;
      }
    }
    int v6 = *(_DWORD *)(a1 + 40);
    if (v6)
    {
      uint64_t result = sub_25C140D64(*(void *)(a1 + 72) + 16);
      if (!result) {
        return result;
      }
      int v6 = *(_DWORD *)(a1 + 40);
    }
    if ((v6 & 2) != 0)
    {
      uint64_t result = sub_25C140D64(*(void *)(a1 + 80) + 16);
      if (!result) {
        return result;
      }
      int v6 = *(_DWORD *)(a1 + 40);
    }
    if ((v6 & 4) != 0)
    {
      uint64_t result = sub_25C140D64(*(void *)(a1 + 88) + 16);
      if (!result) {
        return result;
      }
      int v6 = *(_DWORD *)(a1 + 40);
    }
    if ((v6 & 8) == 0) {
      return 1;
    }
    uint64_t result = sub_25C140D64(*(void *)(a1 + 96) + 16);
    if (result) {
      return 1;
    }
  }
  return result;
}

uint64_t sub_25C15646C(uint64_t a1)
{
  uint64_t result = (uint64_t)sub_25C13FB88((unsigned char *)(a1 + 16));
  uint64_t v3 = *(unsigned int *)(a1 + 56);
  if ((int)v3 >= 1)
  {
    uint64_t v4 = (uint64_t *)(*(void *)(a1 + 64) + 8);
    do
    {
      uint64_t v5 = *v4++;
      uint64_t result = (uint64_t)sub_25C15515C(v5);
      --v3;
    }
    while (v3);
    *(_DWORD *)(a1 + 56) = 0;
  }
  int v6 = *(_DWORD *)(a1 + 40);
  if ((v6 & 0xF) == 0) {
    goto LABEL_11;
  }
  if ((v6 & 1) == 0)
  {
    if ((v6 & 2) == 0) {
      goto LABEL_8;
    }
LABEL_15:
    uint64_t result = (uint64_t)sub_25C150408(*(void *)(a1 + 80));
    if ((v6 & 4) == 0)
    {
LABEL_9:
      if ((v6 & 8) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    goto LABEL_16;
  }
  uint64_t result = sub_25C1544BC(*(void *)(a1 + 72));
  if ((v6 & 2) != 0) {
    goto LABEL_15;
  }
LABEL_8:
  if ((v6 & 4) == 0) {
    goto LABEL_9;
  }
LABEL_16:
  uint64_t result = sub_25C14F7F8(*(void *)(a1 + 88));
  if ((v6 & 8) != 0) {
LABEL_10:
  }
    uint64_t result = (uint64_t)sub_25C150408(*(void *)(a1 + 96));
LABEL_11:
  *(_DWORD *)(a1 + 40) = 0;
  uint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    unint64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
    if (*(char *)(v8 + 31) < 0)
    {
      **(unsigned char **)(v8 + 8) = 0;
      *(void *)(v8 + 16) = 0;
    }
    else
    {
      *(unsigned char *)(v8 + 8) = 0;
      *(unsigned char *)(v8 + 31) = 0;
    }
  }
  return result;
}

void *sub_25C156540(uint64_t a1, uint64_t a2)
{
  return sub_25C156548(a2);
}

void *sub_25C156548(uint64_t a1)
{
  if (!a1) {
    operator new();
  }
  if (*(unsigned char *)(a1 + 24)) {
    (*(void (**)(void, void *, uint64_t))(**(void **)(*(void *)(a1 + 32) + 32) + 40))(*(void *)(*(void *)(a1 + 32) + 32), &unk_270988F90, 104);
  }
  uint64_t v2 = sub_25C1363A0((void *)a1, 0x68uLL);
  sub_25C1553E4((uint64_t)v2, a1);
  return v2;
}

void sub_25C1565F4(_Unwind_Exception *a1)
{
  MEMORY[0x26117F4A0](v1, 0x10A1C401E679671);
  _Unwind_Resume(a1);
}

void *sub_25C156618()
{
  return sub_25C156548(0);
}

void *sub_25C156620@<X0>(void *a1@<X8>)
{
  return sub_25C13C824(a1, "sentencepiece.ModelProto");
}

void sub_25C156630(uint64_t a1)
{
  sub_25C156668(a1);

  JUMPOUT(0x26117F4A0);
}

uint64_t sub_25C156668(uint64_t a1)
{
  if ((_UNKNOWN *)a1 != &unk_26A596298)
  {
    uint64_t v2 = *(uint64_t **)(a1 + 72);
    if (v2)
    {
      uint64_t v3 = sub_25C154810(v2);
      MEMORY[0x26117F4A0](v3, 0x10A1C40DFE95DFBLL);
    }
    uint64_t v4 = *(uint64_t **)(a1 + 80);
    if (v4)
    {
      uint64_t v5 = sub_25C15063C(v4);
      MEMORY[0x26117F4A0](v5, 0x10A1C406853ED09);
    }
    uint64_t v6 = *(void *)(a1 + 88);
    if (v6)
    {
      sub_25C14D0BC(*(void *)(v6 + 8));
      sub_25C14F0D4((void *)(v6 + 40));
      sub_25C13DB80(v6 + 16);
      MEMORY[0x26117F4A0](v6, 0x10A1C4075D007F8);
    }
    uint64_t v7 = *(uint64_t **)(a1 + 96);
    if (v7)
    {
      unint64_t v8 = sub_25C15063C(v7);
      MEMORY[0x26117F4A0](v8, 0x10A1C406853ED09);
    }
  }
  sub_25C14D0BC(*(void *)(a1 + 8));
  sub_25C155490((void *)(a1 + 48));
  sub_25C13DB80(a1 + 16);
  return a1;
}

void sub_25C156750(void *a1)
{
  *a1 = &unk_270989B58;
  uint64_t v1 = (std::__shared_weak_count *)a1[3];
  if (v1) {
    sub_25C1567BC(v1);
  }

  JUMPOUT(0x26117F4A0);
}

void sub_25C1567BC(std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void *sub_25C156830(void *a1)
{
  *a1 = &unk_270989B58;
  uint64_t v2 = (std::__shared_weak_count *)a1[3];
  if (v2) {
    sub_25C1567BC(v2);
  }
  return a1;
}

void sub_25C15687C(void *a1)
{
  *a1 = &unk_270989B78;
  uint64_t v1 = (std::__shared_weak_count *)a1[2];
  if (v1) {
    sub_25C1567BC(v1);
  }

  JUMPOUT(0x26117F4A0);
}

void *sub_25C1568E8(void *a1)
{
  *a1 = &unk_270989B78;
  uint64_t v2 = (std::__shared_weak_count *)a1[2];
  if (v2) {
    sub_25C1567BC(v2);
  }
  return a1;
}

uint64_t sub_25C156934(void *a1)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = *(void **)(*(void *)(v2 + 8) + 72);
  if (!v3) {
    uint64_t v3 = &unk_26A5963E8;
  }
  uint64_t v4 = v3[26];
  if (v4)
  {
    unint64_t explicit = v4 & 0xFFFFFFFFFFFFFFFELL;
  }
  else
  {
    unint64_t explicit = atomic_load_explicit(&qword_26A5960E0, memory_order_acquire);
    if (!explicit) {
      unint64_t explicit = sub_25C13645C(&off_26A5960C8);
    }
  }
  if (*(char *)(explicit + 23) < 0)
  {
    if (*(void *)(explicit + 8)) {
      goto LABEL_9;
    }
LABEL_14:
    unint64_t v8 = "<pad>";
    goto LABEL_19;
  }
  if (!*(unsigned char *)(explicit + 23)) {
    goto LABEL_14;
  }
LABEL_9:
  uint64_t v6 = *(void **)(*(void *)(v2 + 8) + 72);
  if (!v6) {
    uint64_t v6 = &unk_26A5963E8;
  }
  uint64_t v7 = v6[26];
  if (v7)
  {
    unint64_t v8 = (const char *)(v7 & 0xFFFFFFFFFFFFFFFELL);
  }
  else
  {
    unint64_t v8 = (const char *)atomic_load_explicit(&qword_26A5960E0, memory_order_acquire);
    if (!v8) {
      unint64_t v8 = (const char *)sub_25C13645C(&off_26A5960C8);
    }
  }
  if (v8[23] < 0) {
    unint64_t v8 = *(const char **)v8;
  }
LABEL_19:
  size_t v9 = strlen(v8);
  uint64_t v10 = (*(uint64_t (**)(void *, const char *, size_t))(*a1 + 472))(a1, v8, v9);
  if ((*(unsigned int (**)(void *, uint64_t))(*a1 + 504))(a1, v10)) {
    return v10;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t sub_25C156AA8(uint64_t *a1)
{
  uint64_t v2 = sub_25C14822C(a1[1]);
  size_t v3 = strlen(v2);
  uint64_t v4 = (*(uint64_t (**)(uint64_t *, char *, size_t))(*a1 + 472))(a1, v2, v3);
  if ((*(unsigned int (**)(uint64_t *, uint64_t))(*a1 + 504))(a1, v4)) {
    return v4;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t sub_25C156B68(uint64_t *a1)
{
  uint64_t v2 = sub_25C148148(a1[1]);
  size_t v3 = strlen(v2);
  uint64_t v4 = (*(uint64_t (**)(uint64_t *, char *, size_t))(*a1 + 472))(a1, v2, v3);
  if ((*(unsigned int (**)(uint64_t *, uint64_t))(*a1 + 504))(a1, v4)) {
    return v4;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t sub_25C156C28(uint64_t *a1)
{
  uint64_t v2 = sub_25C148064(a1[1]);
  size_t v3 = strlen(v2);
  uint64_t v4 = (*(uint64_t (**)(uint64_t *, char *, size_t))(*a1 + 472))(a1, v2, v3);
  if ((*(unsigned int (**)(uint64_t *, uint64_t))(*a1 + 496))(a1, v4)) {
    return v4;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t sub_25C156CE8(void **a1, uint64_t a2)
{
  ((void (*)(uint64_t *__return_ptr))(*a1)[7])(&v12);
  uint64_t v4 = v12;
  uint64_t v12 = 0;
  if (!v4) {
    return (*(uint64_t (**)(void *, uint64_t))(*a1[1] + 176))(a1[1], a2);
  }
  sub_25C13D850(v4);
  char v11 = 0;
  uint64_t v5 = sub_25C136E68(MEMORY[0x263F8C0F8], (uint64_t)"sentencepiece_processor.cc", 26);
  sub_25C136E68(v5, (uint64_t)"(", 1);
  uint64_t v6 = (void *)std::ostream::operator<<();
  sub_25C136E68(v6, (uint64_t)") ", 2);
  sub_25C136E68(v6, (uint64_t)"LOG(", 4);
  sub_25C136E68(v6, (uint64_t)"ERROR", 5);
  sub_25C136E68(v6, (uint64_t)") ", 2);
  ((void (*)(uint64_t *__return_ptr, void **))(*a1)[7])(&v12, a1);
  if (v12)
  {
    uint64_t v7 = (const char *)(v12 + 8);
    if (*(char *)(v12 + 31) < 0) {
      uint64_t v7 = *(const char **)v7;
    }
  }
  else
  {
    uint64_t v7 = "";
  }
  size_t v9 = strlen(v7);
  sub_25C136E68(v6, (uint64_t)v7, v9);
  sub_25C136E68(v6, (uint64_t)"\nReturns default value ", 23);
  std::ostream::operator<<();
  uint64_t v10 = v12;
  uint64_t v12 = 0;
  if (v10) {
    sub_25C13D850(v10);
  }
  sub_25C137184(&v11);
  return 0;
}

void sub_25C156EA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, __int16 a10, char a11, char a12)
{
}

uint64_t sub_25C156ED4(void **a1, uint64_t a2)
{
  ((void (*)(uint64_t *__return_ptr))(*a1)[7])(&v12);
  uint64_t v4 = v12;
  uint64_t v12 = 0;
  if (!v4) {
    return (*(uint64_t (**)(void *, uint64_t))(*a1[1] + 160))(a1[1], a2);
  }
  sub_25C13D850(v4);
  char v11 = 0;
  uint64_t v5 = sub_25C136E68(MEMORY[0x263F8C0F8], (uint64_t)"sentencepiece_processor.cc", 26);
  sub_25C136E68(v5, (uint64_t)"(", 1);
  uint64_t v6 = (void *)std::ostream::operator<<();
  sub_25C136E68(v6, (uint64_t)") ", 2);
  sub_25C136E68(v6, (uint64_t)"LOG(", 4);
  sub_25C136E68(v6, (uint64_t)"ERROR", 5);
  sub_25C136E68(v6, (uint64_t)") ", 2);
  ((void (*)(uint64_t *__return_ptr, void **))(*a1)[7])(&v12, a1);
  if (v12)
  {
    uint64_t v7 = (const char *)(v12 + 8);
    if (*(char *)(v12 + 31) < 0) {
      uint64_t v7 = *(const char **)v7;
    }
  }
  else
  {
    uint64_t v7 = "";
  }
  size_t v9 = strlen(v7);
  sub_25C136E68(v6, (uint64_t)v7, v9);
  sub_25C136E68(v6, (uint64_t)"\nReturns default value ", 23);
  std::ostream::operator<<();
  uint64_t v10 = v12;
  uint64_t v12 = 0;
  if (v10) {
    sub_25C13D850(v10);
  }
  sub_25C137184(&v11);
  return 0;
}

void sub_25C157090(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, __int16 a10, char a11, char a12)
{
}

uint64_t sub_25C1570C0(void **a1, uint64_t a2)
{
  ((void (*)(uint64_t *__return_ptr))(*a1)[7])(&v12);
  uint64_t v4 = v12;
  uint64_t v12 = 0;
  if (!v4) {
    return (*(uint64_t (**)(void *, uint64_t))(*a1[1] + 152))(a1[1], a2);
  }
  sub_25C13D850(v4);
  char v11 = 0;
  uint64_t v5 = sub_25C136E68(MEMORY[0x263F8C0F8], (uint64_t)"sentencepiece_processor.cc", 26);
  sub_25C136E68(v5, (uint64_t)"(", 1);
  uint64_t v6 = (void *)std::ostream::operator<<();
  sub_25C136E68(v6, (uint64_t)") ", 2);
  sub_25C136E68(v6, (uint64_t)"LOG(", 4);
  sub_25C136E68(v6, (uint64_t)"ERROR", 5);
  sub_25C136E68(v6, (uint64_t)") ", 2);
  ((void (*)(uint64_t *__return_ptr, void **))(*a1)[7])(&v12, a1);
  if (v12)
  {
    uint64_t v7 = (const char *)(v12 + 8);
    if (*(char *)(v12 + 31) < 0) {
      uint64_t v7 = *(const char **)v7;
    }
  }
  else
  {
    uint64_t v7 = "";
  }
  size_t v9 = strlen(v7);
  sub_25C136E68(v6, (uint64_t)v7, v9);
  sub_25C136E68(v6, (uint64_t)"\nReturns default value ", 23);
  std::ostream::operator<<();
  uint64_t v10 = v12;
  uint64_t v12 = 0;
  if (v10) {
    sub_25C13D850(v10);
  }
  sub_25C137184(&v11);
  return 0;
}

void sub_25C15727C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, __int16 a10, char a11, char a12)
{
}

uint64_t sub_25C1572AC(void **a1, uint64_t a2)
{
  ((void (*)(uint64_t *__return_ptr))(*a1)[7])(&v12);
  uint64_t v4 = v12;
  uint64_t v12 = 0;
  if (!v4) {
    return (*(uint64_t (**)(void *, uint64_t))(*a1[1] + 144))(a1[1], a2);
  }
  sub_25C13D850(v4);
  char v11 = 0;
  uint64_t v5 = sub_25C136E68(MEMORY[0x263F8C0F8], (uint64_t)"sentencepiece_processor.cc", 26);
  sub_25C136E68(v5, (uint64_t)"(", 1);
  uint64_t v6 = (void *)std::ostream::operator<<();
  sub_25C136E68(v6, (uint64_t)") ", 2);
  sub_25C136E68(v6, (uint64_t)"LOG(", 4);
  sub_25C136E68(v6, (uint64_t)"ERROR", 5);
  sub_25C136E68(v6, (uint64_t)") ", 2);
  ((void (*)(uint64_t *__return_ptr, void **))(*a1)[7])(&v12, a1);
  if (v12)
  {
    uint64_t v7 = (const char *)(v12 + 8);
    if (*(char *)(v12 + 31) < 0) {
      uint64_t v7 = *(const char **)v7;
    }
  }
  else
  {
    uint64_t v7 = "";
  }
  size_t v9 = strlen(v7);
  sub_25C136E68(v6, (uint64_t)v7, v9);
  sub_25C136E68(v6, (uint64_t)"\nReturns default value ", 23);
  std::ostream::operator<<();
  uint64_t v10 = v12;
  uint64_t v12 = 0;
  if (v10) {
    sub_25C13D850(v10);
  }
  sub_25C137184(&v11);
  return 0;
}

void sub_25C157468(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, __int16 a10, char a11, char a12)
{
}

double sub_25C157498(void **a1, uint64_t a2)
{
  ((void (*)(uint64_t *__return_ptr))(*a1)[7])(&v12);
  uint64_t v4 = v12;
  uint64_t v12 = 0;
  if (v4)
  {
    sub_25C13D850(v4);
    char v11 = 0;
    uint64_t v5 = sub_25C136E68(MEMORY[0x263F8C0F8], (uint64_t)"sentencepiece_processor.cc", 26);
    sub_25C136E68(v5, (uint64_t)"(", 1);
    uint64_t v6 = (void *)std::ostream::operator<<();
    sub_25C136E68(v6, (uint64_t)") ", 2);
    sub_25C136E68(v6, (uint64_t)"LOG(", 4);
    sub_25C136E68(v6, (uint64_t)"ERROR", 5);
    sub_25C136E68(v6, (uint64_t)") ", 2);
    ((void (*)(uint64_t *__return_ptr, void **))(*a1)[7])(&v12, a1);
    if (v12)
    {
      uint64_t v7 = (const char *)(v12 + 8);
      if (*(char *)(v12 + 31) < 0) {
        uint64_t v7 = *(const char **)v7;
      }
    }
    else
    {
      uint64_t v7 = "";
    }
    size_t v9 = strlen(v7);
    sub_25C136E68(v6, (uint64_t)v7, v9);
    sub_25C136E68(v6, (uint64_t)"\nReturns default value ", 23);
    std::ostream::operator<<();
    uint64_t v10 = v12;
    uint64_t v12 = 0;
    if (v10) {
      sub_25C13D850(v10);
    }
    sub_25C137184(&v11);
    return 0.0;
  }
  else
  {
    (*(void (**)(void *, uint64_t))(*a1[1] + 136))(a1[1], a2);
  }
  return result;
}

void sub_25C157654(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, __int16 a10, char a11, char a12)
{
}

uint64_t sub_25C157684(void **a1, uint64_t a2)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26A596310, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26A596310))
  {
    operator new();
  }
  ((void (*)(uint64_t *__return_ptr, void **))(*a1)[7])(&v15, a1);
  uint64_t v4 = v15;
  uint64_t v15 = 0;
  if (!v4) {
    return (*(uint64_t (**)(void *, uint64_t))(*a1[1] + 120))(a1[1], a2);
  }
  sub_25C13D850(v4);
  char v14 = 0;
  uint64_t v5 = sub_25C136E68(MEMORY[0x263F8C0F8], (uint64_t)"sentencepiece_processor.cc", 26);
  sub_25C136E68(v5, (uint64_t)"(", 1);
  uint64_t v6 = (void *)std::ostream::operator<<();
  sub_25C136E68(v6, (uint64_t)") ", 2);
  sub_25C136E68(v6, (uint64_t)"LOG(", 4);
  sub_25C136E68(v6, (uint64_t)"ERROR", 5);
  sub_25C136E68(v6, (uint64_t)") ", 2);
  ((void (*)(uint64_t *__return_ptr, void **))(*a1)[7])(&v15, a1);
  if (v15)
  {
    uint64_t v7 = (const char *)(v15 + 8);
    if (*(char *)(v15 + 31) < 0) {
      uint64_t v7 = *(const char **)v7;
    }
  }
  else
  {
    uint64_t v7 = "";
  }
  size_t v9 = strlen(v7);
  sub_25C136E68(v6, (uint64_t)v7, v9);
  sub_25C136E68(v6, (uint64_t)"\nReturns default value ", 23);
  int v10 = *(char *)(qword_26A596308 + 23);
  if (v10 >= 0) {
    uint64_t v11 = qword_26A596308;
  }
  else {
    uint64_t v11 = *(void *)qword_26A596308;
  }
  if (v10 >= 0) {
    uint64_t v12 = *(unsigned __int8 *)(qword_26A596308 + 23);
  }
  else {
    uint64_t v12 = *(void *)(qword_26A596308 + 8);
  }
  sub_25C136E68(v6, v11, v12);
  uint64_t v13 = v15;
  uint64_t v15 = 0;
  if (v13) {
    sub_25C13D850(v13);
  }
  sub_25C137184(&v14);
  return qword_26A596308;
}

void sub_25C1578B8(_Unwind_Exception *a1)
{
}

uint64_t sub_25C1578FC(void **a1, uint64_t a2, uint64_t a3)
{
  ((void (*)(uint64_t *__return_ptr))(*a1)[7])(&v14);
  uint64_t v6 = v14;
  uint64_t v14 = 0;
  if (!v6) {
    return (*(uint64_t (**)(void *, uint64_t, uint64_t))(*a1[1] + 112))(a1[1], a2, a3);
  }
  sub_25C13D850(v6);
  char v13 = 0;
  uint64_t v7 = sub_25C136E68(MEMORY[0x263F8C0F8], (uint64_t)"sentencepiece_processor.cc", 26);
  sub_25C136E68(v7, (uint64_t)"(", 1);
  unint64_t v8 = (void *)std::ostream::operator<<();
  sub_25C136E68(v8, (uint64_t)") ", 2);
  sub_25C136E68(v8, (uint64_t)"LOG(", 4);
  sub_25C136E68(v8, (uint64_t)"ERROR", 5);
  sub_25C136E68(v8, (uint64_t)") ", 2);
  ((void (*)(uint64_t *__return_ptr, void **))(*a1)[7])(&v14, a1);
  if (v14)
  {
    size_t v9 = (const char *)(v14 + 8);
    if (*(char *)(v14 + 31) < 0) {
      size_t v9 = *(const char **)v9;
    }
  }
  else
  {
    size_t v9 = "";
  }
  size_t v11 = strlen(v9);
  sub_25C136E68(v8, (uint64_t)v9, v11);
  sub_25C136E68(v8, (uint64_t)"\nReturns default value ", 23);
  std::ostream::operator<<();
  uint64_t v12 = v14;
  uint64_t v14 = 0;
  if (v12) {
    sub_25C13D850(v12);
  }
  sub_25C137184(&v13);
  return 0;
}

void sub_25C157AC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, __int16 a10, char a11, char a12)
{
}

uint64_t sub_25C157AF8(void **a1)
{
  ((void (*)(uint64_t *__return_ptr))(*a1)[7])(&v10);
  uint64_t v2 = v10;
  uint64_t v10 = 0;
  if (!v2) {
    return (*(uint64_t (**)(void *))(*a1[1] + 128))(a1[1]);
  }
  sub_25C13D850(v2);
  char v9 = 0;
  size_t v3 = sub_25C136E68(MEMORY[0x263F8C0F8], (uint64_t)"sentencepiece_processor.cc", 26);
  sub_25C136E68(v3, (uint64_t)"(", 1);
  uint64_t v4 = (void *)std::ostream::operator<<();
  sub_25C136E68(v4, (uint64_t)") ", 2);
  sub_25C136E68(v4, (uint64_t)"LOG(", 4);
  sub_25C136E68(v4, (uint64_t)"ERROR", 5);
  sub_25C136E68(v4, (uint64_t)") ", 2);
  ((void (*)(uint64_t *__return_ptr, void **))(*a1)[7])(&v10, a1);
  if (v10)
  {
    uint64_t v5 = (const char *)(v10 + 8);
    if (*(char *)(v10 + 31) < 0) {
      uint64_t v5 = *(const char **)v5;
    }
  }
  else
  {
    uint64_t v5 = "";
  }
  size_t v7 = strlen(v5);
  sub_25C136E68(v4, (uint64_t)v5, v7);
  sub_25C136E68(v4, (uint64_t)"\nReturns default value ", 23);
  std::ostream::operator<<();
  uint64_t v8 = v10;
  uint64_t v10 = 0;
  if (v8) {
    sub_25C13D850(v8);
  }
  sub_25C137184(&v9);
  return 0;
}

void sub_25C157CAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, __int16 a10, char a11, char a12)
{
}

void sub_25C157CDC(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = &unk_270989B58;
  if (atomic_load_explicit(dword_26B34E550, memory_order_acquire)) {
    sub_25C1475A0(dword_26B34E550);
  }
  a3[2] = 0;
  a3[3] = 0;
  a3[1] = &unk_26A5961A8;
  uint64_t v6 = sub_25C157DCC(a3);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 248))(&v8, a1, a2, v6);
  uint64_t v7 = v8;
  uint64_t v8 = 0;
  if (v7) {
    sub_25C13D850(v7);
  }
}

void sub_25C157DB0(_Unwind_Exception *exception_object)
{
  *uint64_t v1 = v2;
  uint64_t v4 = (std::__shared_weak_count *)v1[3];
  if (v4) {
    sub_25C1567BC(v4);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_25C157DCC(void *a1)
{
  uint64_t result = a1[2];
  if (!result)
  {
    size_t v3 = operator new(0x70uLL);
    v3[1] = 0;
    v3[2] = 0;
    void *v3 = &unk_27098A110;
    uint64_t result = sub_25C14D188((uint64_t)(v3 + 3), 0);
    *(void *)&long long v4 = result;
    *((void *)&v4 + 1) = v3;
    uint64_t v5 = (std::__shared_weak_count *)a1[3];
    *((_OWORD *)a1 + 1) = v4;
    if (v5)
    {
      sub_25C1567BC(v5);
      uint64_t result = a1[2];
    }
    a1[1] = result;
  }
  return result;
}

void sub_25C157E4C(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  operator delete(v3);
  _Unwind_Resume(a1);
}

uint64_t *sub_25C157E68(uint64_t a1)
{
  return sub_25C14DD48((uint64_t *)(a1 + 24));
}

void sub_25C157E70(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_27098A110;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x26117F4A0);
}

void sub_25C157EC4(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_27098A110;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_25C157EE4(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = &unk_270989B58;
  if (atomic_load_explicit(dword_26B34E550, memory_order_acquire)) {
    sub_25C1475A0(dword_26B34E550);
  }
  a3[2] = 0;
  a3[3] = 0;
  a3[1] = &unk_26A5961A8;
  uint64_t v6 = sub_25C157DCC(a3);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 240))(&v8, a1, a2, v6);
  uint64_t v7 = v8;
  uint64_t v8 = 0;
  if (v7) {
    sub_25C13D850(v7);
  }
}

void sub_25C157FB8(_Unwind_Exception *exception_object)
{
  *uint64_t v1 = v2;
  long long v4 = (std::__shared_weak_count *)v1[3];
  if (v4) {
    sub_25C1567BC(v4);
  }
  _Unwind_Resume(exception_object);
}

void sub_25C157FD4(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = &unk_270989B58;
  if (atomic_load_explicit(dword_26B34E550, memory_order_acquire)) {
    sub_25C1475A0(dword_26B34E550);
  }
  a3[2] = 0;
  a3[3] = 0;
  a3[1] = &unk_26A5961A8;
  uint64_t v6 = sub_25C157DCC(a3);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 232))(&v8, a1, a2, v6);
  uint64_t v7 = v8;
  uint64_t v8 = 0;
  if (v7) {
    sub_25C13D850(v7);
  }
}

void sub_25C1580A8(_Unwind_Exception *exception_object)
{
  *uint64_t v1 = v2;
  long long v4 = (std::__shared_weak_count *)v1[3];
  if (v4) {
    sub_25C1567BC(v4);
  }
  _Unwind_Resume(exception_object);
}

void sub_25C1580C4(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>, float a8@<S0>)
{
  a7[1] = 0;
  a7[2] = 0;
  *a7 = &unk_270989B78;
  uint64_t v15 = sub_25C1581C8((uint64_t)a7);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, float))(*(void *)a1 + 224))(&v17, a1, a2, a3, a4, a5, a6, v15, a8);
  uint64_t v16 = v17;
  uint64_t v17 = 0;
  if (v16) {
    sub_25C13D850(v16);
  }
}

void sub_25C1581AC(_Unwind_Exception *exception_object)
{
  *uint64_t v1 = v2;
  long long v4 = (std::__shared_weak_count *)v1[2];
  if (v4) {
    sub_25C1567BC(v4);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_25C1581C8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 8);
  if (!result)
  {
    size_t v3 = operator new(0x48uLL);
    v3[1] = 0;
    v3[2] = 0;
    void *v3 = &unk_27098A148;
    uint64_t result = sub_25C14DE18((uint64_t)(v3 + 3), 0);
    *(void *)&long long v4 = result;
    *((void *)&v4 + 1) = v3;
    uint64_t v5 = *(std::__shared_weak_count **)(a1 + 16);
    *(_OWORD *)(a1 + 8) = v4;
    if (v5)
    {
      sub_25C1567BC(v5);
      return *(void *)(a1 + 8);
    }
  }
  return result;
}

void sub_25C158244(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  operator delete(v3);
  _Unwind_Resume(a1);
}

void sub_25C158260(uint64_t a1)
{
  sub_25C14D0BC(*(void *)(a1 + 32));

  sub_25C14DE9C((void *)(a1 + 40));
}

void sub_25C15829C(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_27098A148;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x26117F4A0);
}

void sub_25C1582F0(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_27098A148;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_25C158310(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  a5[1] = 0;
  a5[2] = 0;
  *a5 = &unk_270989B78;
  uint64_t v9 = sub_25C1581C8((uint64_t)a5);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 208))(&v11, a1, a2, a3, a4, v9);
  uint64_t v10 = v11;
  uint64_t v11 = 0;
  if (v10) {
    sub_25C13D850(v10);
  }
}

void sub_25C1583D0(_Unwind_Exception *exception_object)
{
  *uint64_t v1 = v2;
  long long v4 = (std::__shared_weak_count *)v1[2];
  if (v4) {
    sub_25C1567BC(v4);
  }
  _Unwind_Resume(exception_object);
}

void sub_25C1583EC(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>, float a6@<S0>)
{
  *a5 = &unk_270989B58;
  if (atomic_load_explicit(dword_26B34E550, memory_order_acquire)) {
    sub_25C1475A0(dword_26B34E550);
  }
  a5[2] = 0;
  a5[3] = 0;
  a5[1] = &unk_26A5961A8;
  uint64_t v12 = sub_25C157DCC(a5);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, float))(*(void *)a1 + 216))(&v14, a1, a2, a3, a4, v12, a6);
  uint64_t v13 = v14;
  uint64_t v14 = 0;
  if (v13) {
    sub_25C13D850(v13);
  }
}

void sub_25C1584E8(_Unwind_Exception *exception_object)
{
  *uint64_t v1 = v2;
  long long v4 = (std::__shared_weak_count *)v1[3];
  if (v4) {
    sub_25C1567BC(v4);
  }
  _Unwind_Resume(exception_object);
}

void sub_25C158504(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  *a4 = &unk_270989B58;
  if (atomic_load_explicit(dword_26B34E550, memory_order_acquire)) {
    sub_25C1475A0(dword_26B34E550);
  }
  a4[2] = 0;
  a4[3] = 0;
  a4[1] = &unk_26A5961A8;
  uint64_t v8 = sub_25C157DCC(a4);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 200))(&v10, a1, a2, a3, v8);
  uint64_t v9 = v10;
  uint64_t v10 = 0;
  if (v9) {
    sub_25C13D850(v9);
  }
}

void sub_25C1585E8(_Unwind_Exception *exception_object)
{
  *uint64_t v1 = v2;
  long long v4 = (std::__shared_weak_count *)v1[3];
  if (v4) {
    sub_25C1567BC(v4);
  }
  _Unwind_Resume(exception_object);
}

void sub_25C158604(uint64_t a1@<X0>, uint64_t a2@<X1>, std::string *a3@<X8>)
{
  uint64_t v9 = &unk_270989B58;
  if (atomic_load_explicit(dword_26B34E550, memory_order_acquire)) {
    sub_25C1475A0(dword_26B34E550);
  }
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v10 = &unk_26A5961A8;
  uint64_t v6 = sub_25C157DCC(&v9);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 248))(&v8, a1, a2, v6);
  sub_25C147B74(a3, (uint64_t)v10);
  uint64_t v7 = v8;
  uint64_t v8 = 0;
  if (v7) {
    sub_25C13D850(v7);
  }
  uint64_t v9 = &unk_270989B58;
  if (v12) {
    sub_25C1567BC(v12);
  }
}

void sub_25C1586F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::__shared_weak_count *a14)
{
  if (a10) {
    sub_25C13D850(a10);
  }
  if (a14) {
    sub_25C1567BC(a14);
  }
  _Unwind_Resume(exception_object);
}

void sub_25C15872C(uint64_t a1@<X0>, uint64_t a2@<X1>, std::string *a3@<X8>)
{
  uint64_t v9 = &unk_270989B58;
  if (atomic_load_explicit(dword_26B34E550, memory_order_acquire)) {
    sub_25C1475A0(dword_26B34E550);
  }
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v10 = &unk_26A5961A8;
  uint64_t v6 = sub_25C157DCC(&v9);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 240))(&v8, a1, a2, v6);
  sub_25C147B74(a3, (uint64_t)v10);
  uint64_t v7 = v8;
  uint64_t v8 = 0;
  if (v7) {
    sub_25C13D850(v7);
  }
  uint64_t v9 = &unk_270989B58;
  if (v12) {
    sub_25C1567BC(v12);
  }
}

void sub_25C158820(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::__shared_weak_count *a14)
{
  if (a10) {
    sub_25C13D850(a10);
  }
  if (a14) {
    sub_25C1567BC(a14);
  }
  _Unwind_Resume(exception_object);
}

void sub_25C158854(uint64_t a1@<X0>, uint64_t a2@<X1>, std::string *a3@<X8>)
{
  uint64_t v9 = &unk_270989B58;
  if (atomic_load_explicit(dword_26B34E550, memory_order_acquire)) {
    sub_25C1475A0(dword_26B34E550);
  }
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v10 = &unk_26A5961A8;
  uint64_t v6 = sub_25C157DCC(&v9);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 232))(&v8, a1, a2, v6);
  sub_25C147B74(a3, (uint64_t)v10);
  uint64_t v7 = v8;
  uint64_t v8 = 0;
  if (v7) {
    sub_25C13D850(v7);
  }
  uint64_t v9 = &unk_270989B58;
  if (v12) {
    sub_25C1567BC(v12);
  }
}

void sub_25C158948(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::__shared_weak_count *a14)
{
  if (a10) {
    sub_25C13D850(a10);
  }
  if (a14) {
    sub_25C1567BC(a14);
  }
  _Unwind_Resume(exception_object);
}

void sub_25C15897C(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, std::string *a7@<X8>, float a8@<S0>)
{
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v19 = &unk_270989B78;
  uint64_t v16 = sub_25C1581C8((uint64_t)&v19);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, float))(*(void *)a1 + 224))(&v18, a1, a2, a3, a4, a5, a6, v16, a8);
  sub_25C158AB8(a7, v20);
  uint64_t v17 = v18;
  uint64_t v18 = 0;
  if (v17) {
    sub_25C13D850(v17);
  }
  uint64_t v19 = &unk_270989B78;
  if (v21) {
    sub_25C1567BC(v21);
  }
}

void sub_25C158A84(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12)
{
  if (a9) {
    sub_25C13D850(a9);
  }
  if (a12) {
    sub_25C1567BC(a12);
  }
  _Unwind_Resume(exception_object);
}

void sub_25C158AB8(std::string *a1, uint64_t a2)
{
  if (a2) {
    sub_25C147B74(a1, a2);
  }
  else {
    sub_25C13C824(a1, "");
  }
}

void sub_25C158ACC(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, std::string *a5@<X8>)
{
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v13 = &unk_270989B78;
  uint64_t v10 = sub_25C1581C8((uint64_t)&v13);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 208))(&v12, a1, a2, a3, a4, v10);
  sub_25C158AB8(a5, v14);
  uint64_t v11 = v12;
  uint64_t v12 = 0;
  if (v11) {
    sub_25C13D850(v11);
  }
  uint64_t v13 = &unk_270989B78;
  if (v15) {
    sub_25C1567BC(v15);
  }
}

void sub_25C158BAC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12)
{
  if (a9) {
    sub_25C13D850(a9);
  }
  if (a12) {
    sub_25C1567BC(a12);
  }
  _Unwind_Resume(exception_object);
}

void sub_25C158BE0(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, std::string *a5@<X8>, float a6@<S0>)
{
  uint64_t v15 = &unk_270989B58;
  if (atomic_load_explicit(dword_26B34E550, memory_order_acquire)) {
    sub_25C1475A0(dword_26B34E550);
  }
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v16 = &unk_26A5961A8;
  uint64_t v12 = sub_25C157DCC(&v15);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, float))(*(void *)a1 + 216))(&v14, a1, a2, a3, a4, v12, a6);
  sub_25C147B74(a5, (uint64_t)v16);
  uint64_t v13 = v14;
  uint64_t v14 = 0;
  if (v13) {
    sub_25C13D850(v13);
  }
  uint64_t v15 = &unk_270989B58;
  if (v18) {
    sub_25C1567BC(v18);
  }
}

void sub_25C158CFC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::__shared_weak_count *a14)
{
  if (a10) {
    sub_25C13D850(a10);
  }
  if (a14) {
    sub_25C1567BC(a14);
  }
  _Unwind_Resume(exception_object);
}

void sub_25C158D30(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, std::string *a4@<X8>)
{
  uint64_t v11 = &unk_270989B58;
  if (atomic_load_explicit(dword_26B34E550, memory_order_acquire)) {
    sub_25C1475A0(dword_26B34E550);
  }
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v12 = &unk_26A5961A8;
  uint64_t v8 = sub_25C157DCC(&v11);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 200))(&v10, a1, a2, a3, v8);
  sub_25C147B74(a4, (uint64_t)v12);
  uint64_t v9 = v10;
  uint64_t v10 = 0;
  if (v9) {
    sub_25C13D850(v9);
  }
  uint64_t v11 = &unk_270989B58;
  if (v14) {
    sub_25C1567BC(v14);
  }
}

void sub_25C158E34(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::__shared_weak_count *a14)
{
  if (a10) {
    sub_25C13D850(a10);
  }
  if (a14) {
    sub_25C1567BC(a14);
  }
  _Unwind_Resume(exception_object);
}

float sub_25C158E68(uint64_t a1)
{
  float v5 = 0.0;
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 192))(&v4);
  float v1 = v5;
  uint64_t v2 = v4;
  uint64_t v4 = 0;
  if (v2) {
    sub_25C13D850(v2);
  }
  return v1;
}

void sub_25C158ED4(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 136))(&v3);
  uint64_t v2 = v3;
  uint64_t v3 = 0;
  if (v2) {
    sub_25C13D850(v2);
  }
}

void sub_25C158F40(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_25C158F5C(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 128))(&v3);
  uint64_t v2 = v3;
  uint64_t v3 = 0;
  if (v2) {
    sub_25C13D850(v2);
  }
}

void sub_25C158FC8(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_25C158FE4(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 120))(&v3);
  uint64_t v2 = v3;
  uint64_t v3 = 0;
  if (v2) {
    sub_25C13D850(v2);
  }
}

void sub_25C159050(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_25C15906C(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 184))(&v3);
  uint64_t v2 = v3;
  uint64_t v3 = 0;
  if (v2) {
    sub_25C13D850(v2);
  }
}

void sub_25C1590D8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_25C1590F0((void ***)va);
  _Unwind_Resume(a1);
}

void sub_25C1590F0(void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    sub_25C159144((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void sub_25C159144(uint64_t *a1)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  if (v2 != *a1)
  {
    uint64_t v4 = a1[1];
    do
    {
      uint64_t v6 = *(void **)(v4 - 32);
      v4 -= 32;
      float v5 = v6;
      if (v6)
      {
        *(void *)(v2 - 24) = v5;
        operator delete(v5);
      }
      uint64_t v2 = v4;
    }
    while (v4 != v3);
  }
  a1[1] = v3;
}

void sub_25C15919C(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 176))(&v3);
  uint64_t v2 = v3;
  uint64_t v3 = 0;
  if (v2) {
    sub_25C13D850(v2);
  }
}

void sub_25C159208(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_25C159220((void ***)va);
  _Unwind_Resume(a1);
}

void sub_25C159220(void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (void **)**a1;
  if (v2)
  {
    uint64_t v4 = (void **)v1[1];
    float v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 4;
        uint64_t v6 = v4;
        sub_25C13C7D0(&v6);
      }
      while (v4 != v2);
      float v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_25C1592B4(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 168))(&v3);
  uint64_t v2 = v3;
  uint64_t v3 = 0;
  if (v2) {
    sub_25C13D850(v2);
  }
}

void sub_25C159320(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_25C15933C(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 160))(&v3);
  uint64_t v2 = v3;
  uint64_t v3 = 0;
  if (v2) {
    sub_25C13D850(v2);
  }
}

void sub_25C1593A8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_25C13C7D0((void ***)va);
  _Unwind_Resume(a1);
}

void sub_25C1593C0(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 152))(&v3);
  uint64_t v2 = v3;
  uint64_t v3 = 0;
  if (v2) {
    sub_25C13D850(v2);
  }
}

void sub_25C15942C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_25C159444((void ***)va);
  _Unwind_Resume(a1);
}

void sub_25C159444(void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    sub_25C159498((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void sub_25C159498(uint64_t *a1)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  if (v2 != *a1)
  {
    uint64_t v4 = a1[1];
    do
    {
      uint64_t v6 = *(void **)(v4 - 24);
      v4 -= 24;
      float v5 = v6;
      if (v6)
      {
        *(void *)(v2 - 16) = v5;
        operator delete(v5);
      }
      uint64_t v2 = v4;
    }
    while (v4 != v3);
  }
  a1[1] = v3;
}

void sub_25C1594F0(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 144))(&v3);
  uint64_t v2 = v3;
  uint64_t v3 = 0;
  if (v2) {
    sub_25C13D850(v2);
  }
}

void sub_25C15955C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_25C159574((void ***)va);
  _Unwind_Resume(a1);
}

void sub_25C159574(void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (void **)**a1;
  if (v2)
  {
    uint64_t v4 = (void **)v1[1];
    float v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 3;
        uint64_t v6 = v4;
        sub_25C13C7D0(&v6);
      }
      while (v4 != v2);
      float v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_25C159608(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 112))(&v3);
  uint64_t v2 = v3;
  uint64_t v3 = 0;
  if (v2) {
    sub_25C13D850(v2);
  }
}

void sub_25C159674(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_25C159690(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 104))(&v3);
  uint64_t v2 = v3;
  uint64_t v3 = 0;
  if (v2) {
    sub_25C13D850(v2);
  }
}

void sub_25C1596FC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_25C13C7D0((void ***)va);
  _Unwind_Resume(a1);
}

void sub_25C159714(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  unint64_t v18 = 0;
  int v6 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 464))(a1);
  sub_25C159AD8(&v16, (uint64_t)(a2[1] - *a2) >> 2);
  uint64_t v7 = (_DWORD *)*a2;
  uint64_t v8 = (_DWORD *)a2[1];
  while (v7 != v8)
  {
    if ((*v7 & 0x80000000) != 0 || *v7 >= v6)
    {
      *((unsigned char *)&v21.__r_.__value_.__s + 23) = 12;
      strcpy((char *)&v21, "Invalid id: ");
      sub_25C139528((uint64_t)v22);
      std::ostream::operator<<();
      std::stringbuf::str();
      v22[0] = *(void ***)MEMORY[0x263F8C2C8];
      *(void ***)((char *)v22 + (unint64_t)*(v22[0] - 3)) = *(void ***)(MEMORY[0x263F8C2C8] + 24);
      v22[1] = (void **)(MEMORY[0x263F8C318] + 16);
      if (v23 < 0) {
        operator delete(v22[9]);
      }
      std::streambuf::~streambuf();
      std::ostream::~ostream();
      MEMORY[0x26117F430](&v24);
      if ((v20 & 0x80u) == 0) {
        uint64_t v13 = v19;
      }
      else {
        uint64_t v13 = (void **)v19[0];
      }
      if ((v20 & 0x80u) == 0) {
        std::string::size_type v14 = v20;
      }
      else {
        std::string::size_type v14 = (std::string::size_type)v19[1];
      }
      uint64_t v15 = std::string::append(&v21, (const std::string::value_type *)v13, v14);
      v15->__r_.__value_.__l.__size_ = 0;
      v15->__r_.__value_.__r.__words[2] = 0;
      v15->__r_.__value_.__r.__words[0] = 0;
      if ((char)v20 < 0) {
        operator delete(v19[0]);
      }
      if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v21.__r_.__value_.__l.__data_);
      }
      sub_25C13D8A4();
    }
    uint64_t v9 = (*(uint64_t (**)(uint64_t, void))(*(void *)a1 + 480))(a1, *v7);
    uint64_t v10 = v17;
    if ((unint64_t)v17 >= v18)
    {
      uint64_t v12 = (long long *)sub_25C159B7C(&v16, (long long *)v9);
    }
    else
    {
      if (*(char *)(v9 + 23) < 0)
      {
        sub_25C1367DC(v17, *(void **)v9, *(void *)(v9 + 8));
      }
      else
      {
        long long v11 = *(_OWORD *)v9;
        *((void *)v17 + 2) = *(void *)(v9 + 16);
        long long *v10 = v11;
      }
      uint64_t v12 = (long long *)((char *)v10 + 24);
    }
    uint64_t v17 = v12;
    ++v7;
  }
  (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(void *)a1 + 232))(a1, &v16, a3);
  v22[0] = (void **)&v16;
  sub_25C13C7D0(v22);
}

void sub_25C159A58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,char *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,char a31)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  a25 = &a16;
  sub_25C13C7D0((void ***)&a25);
  _Unwind_Resume(a1);
}

uint64_t *sub_25C159AD8(uint64_t *result, unint64_t a2)
{
  if (0xAAAAAAAAAAAAAAABLL * ((result[2] - *result) >> 3) < a2)
  {
    if (a2 >= 0xAAAAAAAAAAAAAABLL) {
      sub_25C137658();
    }
    uint64_t v2 = result;
    uint64_t v3 = result[1] - *result;
    v5[4] = result + 2;
    v5[0] = sub_25C137670(a2);
    v5[1] = v5[0] + v3;
    v5[2] = v5[0] + v3;
    v5[3] = v5[0] + 24 * v4;
    sub_25C13C8D4(v2, v5);
    return (uint64_t *)sub_25C13C958((uint64_t)v5);
  }
  return result;
}

uint64_t sub_25C159B7C(uint64_t *a1, long long *a2)
{
  unint64_t v2 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v3 = v2 + 1;
  if (v2 + 1 > 0xAAAAAAAAAAAAAAALL) {
    sub_25C137658();
  }
  int v6 = a1 + 2;
  if (0x5555555555555556 * ((a1[2] - *a1) >> 3) > v3) {
    unint64_t v3 = 0x5555555555555556 * ((a1[2] - *a1) >> 3);
  }
  if (0xAAAAAAAAAAAAAAABLL * ((a1[2] - *a1) >> 3) >= 0x555555555555555) {
    unint64_t v7 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v7 = v3;
  }
  uint64_t v17 = v6;
  if (v7)
  {
    uint64_t v9 = (char *)sub_25C137670(v7);
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v8 = 0;
  }
  uint64_t v10 = &v9[24 * v2];
  v14[0] = v9;
  v14[1] = v10;
  uint64_t v15 = v10;
  uint64_t v16 = &v9[24 * v8];
  if (*((char *)a2 + 23) < 0)
  {
    sub_25C1367DC(v10, *(void **)a2, *((void *)a2 + 1));
    uint64_t v10 = v15;
  }
  else
  {
    long long v11 = *a2;
    *((void *)v10 + 2) = *((void *)a2 + 2);
    *(_OWORD *)uint64_t v10 = v11;
  }
  uint64_t v15 = v10 + 24;
  sub_25C13C8D4(a1, v14);
  uint64_t v12 = a1[1];
  sub_25C13C958((uint64_t)v14);
  return v12;
}

void sub_25C159C8C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_25C13C958((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_25C159CA0(uint64_t *a1@<X0>, uint64_t **a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v89 = a3;
  (*(void (**)(uint64_t *))(*a1 + 56))(a1);
  if (*a4) {
    return;
  }
  *a4 = 0;
  if (!a3)
  {
    LODWORD(v87.__r_.__value_.__l.__data_) = 13;
    long long v11 = (void *)sub_25C139528((uint64_t)&v87.__r_.__value_.__l.__size_);
    sub_25C136E68(v11, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiece/src/sentencepiece_processor.cc", 133);
    sub_25C136E68(&v87.__r_.__value_.__l.__size_, (uint64_t)"(", 1);
    std::ostream::operator<<();
    sub_25C136E68(&v87.__r_.__value_.__l.__size_, (uint64_t)") [", 3);
    sub_25C136E68(&v87.__r_.__value_.__l.__size_, (uint64_t)"spt", 3);
    sub_25C136E68(&v87.__r_.__value_.__l.__size_, (uint64_t)"] ", 2);
    sub_25C136E68(&v87.__r_.__value_.__l.__size_, (uint64_t)"output proto is null", 20);
    sub_25C1396C0();
  }
  sub_25C14DB64(a3);
  uint64_t v8 = a1[4];
  if (!v8) {
    goto LABEL_8;
  }
  uint64_t v9 = *(void **)(v8 + 72);
  if (!v9) {
    uint64_t v9 = &unk_26A5963E8;
  }
  if ((v9[5] & 8) != 0)
  {
    uint64_t v12 = v9[22];
    if (v12)
    {
      unint64_t explicit = (char *)(v12 & 0xFFFFFFFFFFFFFFFELL);
    }
    else
    {
      unint64_t explicit = (char *)atomic_load_explicit(&qword_26A596100, memory_order_acquire);
      if (!explicit) {
        unint64_t explicit = (char *)sub_25C13645C(&off_26A5960E8);
      }
    }
    if (explicit[23] < 0) {
      unint64_t explicit = *(char **)explicit;
    }
  }
  else
  {
LABEL_8:
    unint64_t explicit = (char *)&unk_25C16E175;
  }
  uint64_t v13 = *a2;
  std::string::size_type v14 = a2[1];
  while (v13 != v14)
  {
    uint64_t v15 = *v13;
    uint64_t v16 = v13[1];
    uint64_t v17 = v89;
    unint64_t v18 = *(int **)(v89 + 64);
    if (!v18)
    {
      int v19 = *(_DWORD *)(v89 + 56);
      int v20 = *(_DWORD *)(v89 + 60);
LABEL_23:
      if (v19 <= v20)
      {
        sub_25C14C1A8((uint64_t *)(v89 + 48), v20 - v19 + 1);
        unint64_t v18 = *(int **)(v89 + 64);
      }
      int v20 = *v18;
      goto LABEL_26;
    }
    int v19 = *(_DWORD *)(v89 + 56);
    int v20 = *v18;
    if (v19 < *v18)
    {
      *(_DWORD *)(v89 + 56) = v19 + 1;
      std::string v21 = *(void **)&v18[2 * v19 + 2];
      goto LABEL_27;
    }
    if (v20 == *(_DWORD *)(v89 + 60)) {
      goto LABEL_23;
    }
LABEL_26:
    *unint64_t v18 = v20 + 1;
    std::string v21 = sub_25C14CEF0(*(void *)(v17 + 48));
    uint64_t v22 = *(void *)(v17 + 64);
    uint64_t v23 = *(int *)(v17 + 56);
    *(_DWORD *)(v17 + 56) = v23 + 1;
    *(void *)(v22 + 8 * v23 + 8) = v21;
LABEL_27:
    *((_DWORD *)v21 + 10) |= 1u;
    uint64_t v24 = v21[1];
    BOOL v25 = (void *)(v24 & 0xFFFFFFFFFFFFFFFELL);
    if (v24) {
      BOOL v25 = (void *)*v25;
    }
    char v26 = sub_25C1369B4((uint64_t **)v21 + 6, (uint64_t)v25);
    MEMORY[0x26117F1E0](v26, v15, v16);
    int v27 = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*a1 + 472))(a1, v15, v16);
    *((_DWORD *)v21 + 10) |= 4u;
    *((_DWORD *)v21 + 16) = v27;
    v13 += 2;
  }
  uint64_t v28 = v89;
  sub_25C15A71C(a4, a1, (_DWORD *)a1[8], (_DWORD *)a1[9], v89);
  if (*a4) {
    return;
  }
  *a4 = 0;
  int v29 = *(_DWORD *)(v28 + 40);
  uint64_t v30 = *(void *)(v28 + 8);
  uint64_t v86 = 0;
  *(_DWORD *)(v28 + 40) = v29 | 1;
  int v31 = (void *)(v30 & 0xFFFFFFFFFFFFFFFELL);
  if (v30) {
    int v31 = (void *)*v31;
  }
  v85[1] = &v86;
  uint64_t v86 = sub_25C1369B4((uint64_t **)(v28 + 72), (uint64_t)v31);
  v84[0] = (void **)&v89;
  v84[1] = v85;
  v85[0] = &v89;
  memset(&v83, 0, sizeof(v83));
  LODWORD(v32) = *(_DWORD *)(v28 + 56);
  if ((int)v32 >= 1)
  {
    BOOL v33 = 0;
    uint64_t v34 = 0;
    uint64_t v35 = 0;
    char v82 = 1;
    uint64_t v77 = a4;
    int v78 = explicit;
    while (1)
    {
      uint64_t v36 = *(void *)(*(void *)(v28 + 64) + 8 * v34 + 8);
      if (!(*(unsigned int (**)(uint64_t *, void))(*a1 + 520))(a1, *(unsigned int *)(v36 + 64))) {
        break;
      }
      ++v34;
LABEL_122:
      uint64_t v28 = v89;
      uint64_t v32 = *(int *)(v89 + 56);
      if (v34 >= v32) {
        goto LABEL_126;
      }
    }
    sub_25C15AEF8(a4, v84, v35, v34);
    if (*a4) {
      goto LABEL_132;
    }
    *a4 = 0;
    if (!v33)
    {
      if (*((char *)v86 + 23) < 0)
      {
        if (!v86[1])
        {
LABEL_42:
          unint64_t v37 = *(void *)(v36 + 48) & 0xFFFFFFFFFFFFFFFELL;
          if (*(char *)(v37 + 23) < 0)
          {
            unsigned int v39 = *(unsigned __int8 **)v37;
            size_t v38 = *(void *)(v37 + 8);
          }
          else
          {
            size_t v38 = *(unsigned __int8 *)(v37 + 23);
            unsigned int v39 = (unsigned __int8 *)(*(void *)(v36 + 48) & 0xFFFFFFFFFFFFFFFELL);
          }
          uint64_t v40 = *(unsigned int *)(v36 + 64);
          if ((*(unsigned int (**)(uint64_t *, uint64_t))(*a1 + 504))(a1, v40))
          {
            sub_25C13C824(&v87, "");
LABEL_74:
            BOOL v88 = 0;
LABEL_113:
            if (SHIBYTE(v83.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v83.__r_.__value_.__l.__data_);
            }
            std::string v83 = v87;
            BOOL v33 = v88;
            if ((v87.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              unint64_t v69 = &v83;
            }
            else {
              unint64_t v69 = (std::string *)v87.__r_.__value_.__r.__words[0];
            }
            if ((v87.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              std::string::size_type size = HIBYTE(v87.__r_.__value_.__r.__words[2]);
            }
            else {
              std::string::size_type size = v87.__r_.__value_.__l.__size_;
            }
            sub_25C15B478(v85, v34++, v69, size);
            uint64_t v35 = v34;
            goto LABEL_122;
          }
          if (!(*(unsigned int (**)(uint64_t *, uint64_t))(*a1 + 496))(a1, v40))
          {
            if ((v82 & 1) == 0) {
              goto LABEL_68;
            }
            uint64_t v45 = a1[4];
            if (!v45) {
              goto LABEL_64;
            }
            int v46 = *(unsigned char **)(v45 + 80);
            if (!v46) {
              int v46 = &unk_26A596338;
            }
            if (v46[72] || v46[73])
            {
LABEL_64:
              if (v38 >= 3)
              {
                BOOL v51 = *(unsigned __int16 *)v39 != 38626 || v39[2] != 129;
                if (!v51)
                {
                  v39 += 3;
                  v38 -= 3;
                }
                BOOL v47 = !v51;
              }
              else
              {
                BOOL v47 = 0;
              }
              if (v45)
              {
                unint64_t v52 = *(unsigned char **)(v45 + 80);
                if (!v52) {
                  unint64_t v52 = &unk_26A596338;
                }
                if (v52[73]) {
                  BOOL v47 = 0;
                }
              }
            }
            else
            {
LABEL_68:
              BOOL v47 = 0;
            }
            uint64_t v53 = (char **)operator new(0x20uLL);
            *uint64_t v53 = (char *)&unk_25C16E0C1;
            v53[1] = (char *)3;
            v53[2] = " ";
            v53[3] = (char *)1;
            sub_25C136514(&__dst, v39, v38);
            memset(&__str, 0, sizeof(__str));
            __str.__r_.__value_.__s.__data_[0] = 0;
            std::string::size_type v54 = HIBYTE(__dst.__r_.__value_.__r.__words[2]);
            if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              p_dst = &__dst;
            }
            else {
              p_dst = (std::string *)__dst.__r_.__value_.__r.__words[0];
            }
            if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
              std::string::size_type v54 = __dst.__r_.__value_.__l.__size_;
            }
            int64_t v56 = (int64_t)v53[1];
            if (v56)
            {
              BOOL v79 = v47;
              unint64_t v57 = 0;
              std::string::size_type v75 = (std::string::size_type)v53[3];
              uint64_t v76 = v53[2];
              int v81 = p_dst;
              uint64_t v58 = (char *)p_dst + v54;
              uint64_t v59 = *v53;
              std::string::size_type v74 = v54;
LABEL_96:
              unint64_t v60 = v57;
              std::string::size_type v80 = v54 - v57;
              if (v54 >= v57)
              {
                p_dst = (std::string *)((char *)v81 + v57);
                uint64_t v61 = v58 - ((char *)v81 + v57);
                if (v61 >= v56)
                {
                  int v62 = *v59;
                  unint64_t v63 = (char *)v81 + v57;
                  do
                  {
                    uint64_t v64 = v61 - v56;
                    if (v64 == -1) {
                      break;
                    }
                    uint64_t v65 = (char *)memchr(v63, v62, v64 + 1);
                    if (!v65) {
                      break;
                    }
                    unint64_t v66 = v65;
                    if (!memcmp(v65, v59, v56))
                    {
                      if (v66 == v58) {
                        break;
                      }
                      int64_t v67 = v66 - (char *)v81;
                      if (v66 - (char *)v81 != -1)
                      {
                        std::string::append(&__str, (const std::string::value_type *)p_dst, v67 - v60);
                        std::string::append(&__str, v76, v75);
                        unint64_t v57 = v67 + v56;
                        std::string::size_type v54 = v74;
                        goto LABEL_96;
                      }
                      goto LABEL_108;
                    }
                    unint64_t v63 = v66 + 1;
                    uint64_t v61 = v58 - (v66 + 1);
                  }
                  while (v61 >= v56);
                }
              }
              p_dst = (std::string *)((char *)v81 + v60);
LABEL_108:
              a4 = v77;
              unint64_t explicit = v78;
              BOOL v47 = v79;
              std::string::size_type v68 = v80;
            }
            else
            {
              std::string::size_type v68 = v54;
            }
            std::string::append(&__str, (const std::string::value_type *)p_dst, v68);
            std::string::operator=(&__dst, &__str);
            if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(__dst.__r_.__value_.__l.__data_);
            }
            std::string v87 = __str;
            memset(&__str, 0, sizeof(__str));
            BOOL v88 = v47;
            operator delete(v53);
            goto LABEL_113;
          }
          BOOL v41 = (void *)(*(uint64_t (**)(uint64_t *, uint64_t))(*a1 + 480))(a1, v40);
          uint64_t v42 = *((unsigned __int8 *)v41 + 23);
          int v43 = (char)v42;
          if ((v42 & 0x80u) != 0) {
            uint64_t v42 = v41[1];
          }
          if (v42 == v38)
          {
            if (v43 < 0) {
              BOOL v41 = (void *)*v41;
            }
            if (!memcmp(v41, v39, v38))
            {
              sub_25C13C824(&v87, explicit);
              goto LABEL_74;
            }
          }
          if (v38 >= 0x7FFFFFFFFFFFFFF8) {
            sub_25C1365BC();
          }
          if (v38 >= 0x17)
          {
            uint64_t v48 = (v38 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v38 | 7) != 0x17) {
              uint64_t v48 = v38 | 7;
            }
            uint64_t v49 = v48 + 1;
            uint64_t v44 = (std::string *)operator new(v48 + 1);
            __dst.__r_.__value_.__l.__size_ = v38;
            __dst.__r_.__value_.__r.__words[2] = v49 | 0x8000000000000000;
            __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)v44;
          }
          else
          {
            *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v38;
            uint64_t v44 = &__dst;
            if (!v38) {
              goto LABEL_73;
            }
          }
          memmove(v44, v39, v38);
LABEL_73:
          v44->__r_.__value_.__s.__data_[v38] = 0;
          std::string v87 = __dst;
          goto LABEL_74;
        }
      }
      else if (!*((unsigned char *)v86 + 23))
      {
        goto LABEL_42;
      }
    }
    char v82 = 0;
    goto LABEL_42;
  }
  uint64_t v35 = 0;
LABEL_126:
  sub_25C15AEF8(a4, v84, v35, v32);
  if (!*a4)
  {
    *a4 = 0;
    uint64_t v71 = a1[3];
    if (v71)
    {
      (*(void (**)(std::string *__return_ptr))(*(void *)v71 + 40))(&v87);
      unint64_t v72 = v86;
      if (*((char *)v86 + 23) < 0) {
        operator delete((void *)*v86);
      }
      long long v73 = *(_OWORD *)&v87.__r_.__value_.__l.__data_;
      _OWORD v72[2] = v87.__r_.__value_.__r.__words[2];
      *(_OWORD *)unint64_t v72 = v73;
    }
    *a4 = 0;
  }
LABEL_132:
  if (SHIBYTE(v83.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v83.__r_.__value_.__l.__data_);
  }
}

void sub_25C15A6A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  if (a24 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_25C15A71C(void *a1, uint64_t *a2, _DWORD *a3, _DWORD *a4, uint64_t a5)
{
  if (a3 != a4)
  {
    int v6 = a3;
    std::string::size_type v74 = (uint64_t *)(a5 + 48);
    while (2)
    {
      uint64_t v76 = v6;
      switch(*v6)
      {
        case 0:
          uint64_t v8 = *(void *)(a5 + 64);
          if (v8) {
            unint64_t v9 = v8 + 8;
          }
          else {
            unint64_t v9 = 0;
          }
          uint64_t v10 = *(int *)(a5 + 56);
          long long v11 = (uint64_t *)(v9 + 8 * v10 - 8);
          if (v10) {
            BOOL v12 = (unint64_t)v11 > v9;
          }
          else {
            BOOL v12 = 0;
          }
          if (!v12) {
            goto LABEL_74;
          }
          unint64_t v13 = v9 + 8;
          break;
        case 1:
          unint64_t v37 = *(int **)(a5 + 64);
          if (!v37)
          {
            int v38 = *(_DWORD *)(a5 + 56);
            int v39 = *(_DWORD *)(a5 + 60);
LABEL_54:
            if (v38 <= v39)
            {
              sub_25C14C1A8(v74, v39 - v38 + 1);
              unint64_t v37 = *(int **)(a5 + 64);
            }
            int v39 = *v37;
            goto LABEL_57;
          }
          int v38 = *(_DWORD *)(a5 + 56);
          int v39 = *v37;
          if (v38 < *v37)
          {
            LODWORD(v40) = v38 + 1;
            *(_DWORD *)(a5 + 56) = v38 + 1;
            goto LABEL_58;
          }
          if (v39 == *(_DWORD *)(a5 + 60)) {
            goto LABEL_54;
          }
LABEL_57:
          int *v37 = v39 + 1;
          BOOL v51 = sub_25C14CEF0(*(void *)(a5 + 48));
          uint64_t v52 = *(void *)(a5 + 64);
          uint64_t v53 = *(int *)(a5 + 56);
          LODWORD(v40) = v53 + 1;
          *(_DWORD *)(a5 + 56) = v53 + 1;
          *(void *)(v52 + 8 * v53 + 8) = v51;
LABEL_58:
          if ((int)v40 >= 2)
          {
            unint64_t v40 = v40;
            do
            {
              uint64_t v54 = *(void *)(a5 + 64) + 8;
              uint64_t v55 = *(void *)(v54 + 8 * (v40 - 2));
              *(void *)(v54 + 8 * (v40 - 2)) = *(void *)(v54 + 8 * (v40 - 1));
              *(void *)(v54 + 8 * (v40 - 1)) = v55;
              BOOL v12 = v40-- > 2;
            }
            while (v12);
          }
          uint64_t v56 = *(void *)(*(void *)(a5 + 64) + 8);
          unint64_t v57 = sub_25C148148(a2[1]);
          size_t v58 = strlen(v57);
          int v59 = (*(uint64_t (**)(uint64_t *, char *, size_t))(*a2 + 472))(a2, v57, v58);
          *(_DWORD *)(v56 + 40) |= 4u;
          *(_DWORD *)(v56 + 64) = v59;
          unint64_t v60 = sub_25C148148(a2[1]);
          sub_25C148148(a2[1]);
          *(_DWORD *)(v56 + 40) |= 1u;
          sub_25C136514(&__p, v60, v61);
          uint64_t v62 = *(void *)(v56 + 8);
          unint64_t v63 = (void *)(v62 & 0xFFFFFFFFFFFFFFFELL);
          if (v62) {
            unint64_t v63 = (void *)*v63;
          }
          sub_25C13688C((uint64_t **)(v56 + 48), &__p, (uint64_t)v63);
          goto LABEL_72;
        case 2:
          BOOL v41 = *(int **)(a5 + 64);
          if (!v41)
          {
            int v42 = *(_DWORD *)(a5 + 56);
            int v43 = *(_DWORD *)(a5 + 60);
LABEL_65:
            if (v42 <= v43)
            {
              sub_25C14C1A8(v74, v43 - v42 + 1);
              BOOL v41 = *(int **)(a5 + 64);
            }
            int v43 = *v41;
            goto LABEL_68;
          }
          int v42 = *(_DWORD *)(a5 + 56);
          int v43 = *v41;
          if (v42 < *v41)
          {
            *(_DWORD *)(a5 + 56) = v42 + 1;
            uint64_t v44 = *(void **)&v41[2 * v42 + 2];
            goto LABEL_69;
          }
          if (v43 == *(_DWORD *)(a5 + 60)) {
            goto LABEL_65;
          }
LABEL_68:
          *BOOL v41 = v43 + 1;
          uint64_t v44 = sub_25C14CEF0(*(void *)(a5 + 48));
          uint64_t v64 = *(void *)(a5 + 64);
          uint64_t v65 = *(int *)(a5 + 56);
          *(_DWORD *)(a5 + 56) = v65 + 1;
          *(void *)(v64 + 8 * v65 + 8) = v44;
LABEL_69:
          unint64_t v66 = sub_25C14822C(a2[1]);
          size_t v67 = strlen(v66);
          int v68 = (*(uint64_t (**)(uint64_t *, char *, size_t))(*a2 + 472))(a2, v66, v67);
          *((_DWORD *)v44 + 10) |= 4u;
          *((_DWORD *)v44 + 16) = v68;
          unint64_t v69 = sub_25C14822C(a2[1]);
          sub_25C14822C(a2[1]);
          *((_DWORD *)v44 + 10) |= 1u;
          sub_25C136514(&__p, v69, v70);
          uint64_t v71 = v44[1];
          unint64_t v72 = (void *)(v71 & 0xFFFFFFFFFFFFFFFELL);
          if (v71) {
            unint64_t v72 = (void *)*v72;
          }
          sub_25C13688C((uint64_t **)v44 + 6, &__p, (uint64_t)v72);
LABEL_72:
          if (SHIBYTE(v78) < 0) {
            operator delete((void *)__p);
          }
LABEL_74:
          int v6 = v76 + 1;
          if (v76 + 1 == a4) {
            goto LABEL_75;
          }
          continue;
        case 3:
          if (*(int *)(a5 + 56) >= 1)
          {
            uint64_t v45 = 0;
            do
            {
              uint64_t v46 = *(void *)(*(void *)(a5 + 64) + 8 * v45 + 8);
              if ((*(unsigned int (**)(uint64_t *, void))(*a2 + 496))(a2, *(unsigned int *)(v46 + 64)))
              {
                BOOL v47 = sub_25C148064(a2[1]);
                sub_25C148064(a2[1]);
                *(_DWORD *)(v46 + 40) |= 1u;
                sub_25C136514(&__p, v47, v48);
                uint64_t v49 = *(void *)(v46 + 8);
                int32x2_t v50 = (void *)(v49 & 0xFFFFFFFFFFFFFFFELL);
                if (v49) {
                  int32x2_t v50 = (void *)*v50;
                }
                sub_25C13688C((uint64_t **)(v46 + 48), &__p, (uint64_t)v50);
                if (SHIBYTE(v78) < 0) {
                  operator delete((void *)__p);
                }
              }
              ++v45;
            }
            while (v45 < *(int *)(a5 + 56));
          }
          goto LABEL_74;
        default:
          sub_25C13D8A4();
      }
      break;
    }
    while (1)
    {
      uint64_t v14 = *(void *)(v13 - 8);
      uint64_t v15 = *v11;
      if (*v11 != v14)
      {
        uint64_t v17 = (uint64_t *)(v14 + 8);
        uint64_t v16 = *(void *)(v14 + 8);
        unint64_t v18 = (void *)(v16 & 0xFFFFFFFFFFFFFFFELL);
        if (v16) {
          unint64_t v18 = (void *)*v18;
        }
        uint64_t v19 = *(void *)(v15 + 8);
        int v20 = (void *)(v19 & 0xFFFFFFFFFFFFFFFELL);
        if (v19) {
          int v20 = (void *)*v20;
        }
        if (v18 == v20)
        {
          if (*(void *)(v14 + 16) == *(void *)(v15 + 16))
          {
            __int16 v22 = *(_WORD *)(v14 + 24);
            *(_WORD *)(v14 + 24) = *(_WORD *)(v15 + 24);
            *(_WORD *)(v15 + 24) = v22;
            __int16 v23 = *(_WORD *)(v14 + 26);
            *(_WORD *)(v14 + 26) = *(_WORD *)(v15 + 26);
            *(_WORD *)(v15 + 26) = v23;
            uint64_t v24 = *(void *)(v14 + 32);
            *(void *)(v14 + 32) = *(void *)(v15 + 32);
            *(void *)(v15 + 32) = v24;
          }
          else
          {
            *(void *)&long long __p = 0;
            DWORD2(__p) = 0;
            uint64_t v78 = 0;
            sub_25C13FC28((uint64_t)&__p, v15 + 16);
            sub_25C13FB88((unsigned char *)(v15 + 16));
            sub_25C13FC28(v15 + 16, v14 + 16);
            sub_25C13FB88((unsigned char *)(v14 + 16));
            sub_25C13FC28(v14 + 16, (uint64_t)&__p);
            sub_25C13DB80((uint64_t)&__p);
          }
          uint64_t v25 = *v17;
          uint64_t v26 = *(void *)(v15 + 8);
          if (*v17)
          {
            if (v26) {
              goto LABEL_27;
            }
            int v27 = sub_25C142B28((unint64_t *)(v15 + 8));
            uint64_t v25 = *v17;
            if ((*v17 & 1) == 0) {
              goto LABEL_35;
            }
LABEL_28:
            uint64_t v28 = (char *)((v25 & 0xFFFFFFFFFFFFFFFELL) + 8);
          }
          else
          {
            if ((v26 & 1) == 0) {
              goto LABEL_30;
            }
LABEL_27:
            int v27 = (char *)((v26 & 0xFFFFFFFFFFFFFFFELL) + 8);
            if (v25) {
              goto LABEL_28;
            }
LABEL_35:
            uint64_t v28 = sub_25C142B28((unint64_t *)(v14 + 8));
          }
          uint64_t v29 = *((void *)v28 + 2);
          long long v30 = *(_OWORD *)v28;
          uint64_t v31 = *((void *)v27 + 2);
          *(_OWORD *)uint64_t v28 = *(_OWORD *)v27;
          *((void *)v28 + 2) = v31;
          *(_OWORD *)int v27 = v30;
          *((void *)v27 + 2) = v29;
LABEL_30:
          int v32 = *(_DWORD *)(v14 + 40);
          *(_DWORD *)(v14 + 40) = *(_DWORD *)(v15 + 40);
          *(_DWORD *)(v15 + 40) = v32;
          uint64_t v33 = *(void *)(v14 + 48);
          *(void *)(v14 + 48) = *(void *)(v15 + 48);
          *(void *)(v15 + 48) = v33;
          uint64_t v34 = *(void *)(v14 + 56);
          *(void *)(v14 + 56) = *(void *)(v15 + 56);
          *(void *)(v15 + 56) = v34;
          uint64_t v35 = *(void *)(v14 + 64);
          *(void *)(v14 + 64) = *(void *)(v15 + 64);
          *(void *)(v15 + 64) = v35;
          LODWORD(v35) = *(_DWORD *)(v14 + 72);
          *(_DWORD *)(v14 + 72) = *(_DWORD *)(v15 + 72);
          *(_DWORD *)(v15 + 72) = v35;
          goto LABEL_31;
        }
        uint64_t v21 = (*(uint64_t (**)(void))(*(void *)v14 + 24))(*(void *)(v13 - 8));
        (*(void (**)(uint64_t, uint64_t))(*(void *)v21 + 64))(v21, v14);
        (*(void (**)(uint64_t))(*(void *)v14 + 40))(v14);
        (*(void (**)(uint64_t, uint64_t))(*(void *)v14 + 64))(v14, v15);
        (*(void (**)(uint64_t))(*(void *)v15 + 40))(v15);
        (*(void (**)(uint64_t, uint64_t))(*(void *)v15 + 64))(v15, v21);
        (*(void (**)(uint64_t))(*(void *)v21 + 8))(v21);
      }
LABEL_31:
      BOOL v36 = v13 >= (unint64_t)--v11;
      v13 += 8;
      if (v36) {
        goto LABEL_74;
      }
    }
  }
LABEL_75:
  *a1 = 0;
}

void sub_25C15AE84(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_25C15AEF8(void *a1, void ***a2, uint64_t a3, int a4)
{
  if ((int)a3 >= a4)
  {
    *a1 = 0;
  }
  else
  {
    uint64_t v6 = a3;
    memset(&v39, 0, sizeof(v39));
    uint64_t v8 = 8 * (int)a3 + 8;
    int v9 = a3;
    do
    {
      unint64_t v10 = *(void *)(*(void *)((**a2)[8] + v8) + 48) & 0xFFFFFFFFFFFFFFFELL;
      if (*(char *)(v10 + 23) < 0)
      {
        BOOL v12 = *(void **)v10;
        size_t v11 = *(void *)(v10 + 8);
      }
      else
      {
        size_t v11 = *(unsigned __int8 *)(v10 + 23);
        BOOL v12 = (void *)(*(void *)(*(void *)((**a2)[8] + v8) + 48) & 0xFFFFFFFFFFFFFFFELL);
      }
      int v13 = sub_25C149074(v12, v11);
      if (v13 < 0)
      {
        int v37 = 13;
        sub_25C139528((uint64_t)&v38);
        sub_25C136E68(&v38, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiece/src/sentencepiece_processor.cc", 133);
        sub_25C136E68(&v38, (uint64_t)"(", 1);
        std::ostream::operator<<();
        sub_25C136E68(&v38, (uint64_t)") [", 3);
        sub_25C136E68(&v38, (uint64_t)"(0) <= (byte)", 13);
        sub_25C136E68(&v38, (uint64_t)"] ", 2);
        sub_25C1396C0();
      }
      std::string::append(&v39, 1uLL, v13);
      ++v9;
      v8 += 8;
    }
    while (a4 != v9);
    int v33 = a4;
    uint64_t v34 = a1;
    if ((v39.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      int v14 = HIBYTE(v39.__r_.__value_.__r.__words[2]);
    }
    else {
      int v14 = v39.__r_.__value_.__r.__words[1];
    }
    if (v14 >= 1)
    {
      int v15 = 0;
      int v35 = v14;
      while (1)
      {
        unint64_t v36 = 0;
        std::string::size_type size = HIBYTE(v39.__r_.__value_.__r.__words[2]);
        if ((v39.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          std::string::size_type size = v39.__r_.__value_.__l.__size_;
        }
        if (size < v15) {
          sub_25C15B5F8("string_view::substr");
        }
        std::string::size_type v17 = v15;
        unint64_t v18 = (std::string *)v39.__r_.__value_.__r.__words[0];
        if ((v39.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          unint64_t v18 = &v39;
        }
        if (sub_25C16CCD8((unsigned __int8 *)v18 + v17, (uint64_t)v18 + size, (uint64_t *)&v36) != 65533) {
          break;
        }
        int v19 = v17 + v6;
        if (v36 != 1)
        {
          if (v36 != 3)
          {
            int v37 = 13;
            sub_25C139528((uint64_t)&v38);
            sub_25C136E68(&v38, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiece/src/sentencepiece_processor.cc", 133);
            sub_25C136E68(&v38, (uint64_t)"(", 1);
            std::ostream::operator<<();
            sub_25C136E68(&v38, (uint64_t)") [", 3);
            sub_25C136E68(&v38, (uint64_t)"(consumed) == (1)", 17);
            sub_25C136E68(&v38, (uint64_t)"] ", 2);
            sub_25C1396C0();
          }
          goto LABEL_23;
        }
        sub_25C15B478(a2[1], v19, &unk_25C16E3D2, 3uLL);
        LODWORD(v23) = 1;
LABEL_44:
        int v15 = v17 + v23;
        if ((int)v17 + (int)v23 >= v14) {
          goto LABEL_49;
        }
      }
      int v19 = v17 + v6;
LABEL_23:
      std::string::size_type v20 = HIBYTE(v39.__r_.__value_.__r.__words[2]);
      if ((v39.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        std::string::size_type v20 = v39.__r_.__value_.__l.__size_;
      }
      BOOL v21 = v20 >= v17;
      unint64_t v22 = v20 - v17;
      if (!v21) {
        sub_25C15B5F8("string_view::substr");
      }
      uint64_t v23 = v36;
      if ((v39.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        uint64_t v24 = &v39;
      }
      else {
        uint64_t v24 = (std::string *)v39.__r_.__value_.__r.__words[0];
      }
      if (v22 >= v36) {
        unint64_t v25 = v36;
      }
      else {
        unint64_t v25 = v22;
      }
      if (v36)
      {
        uint64_t v26 = v6;
        uint64_t v27 = 0;
        uint64_t v28 = (char *)v24 + v17;
        unint64_t v29 = v36 - 1;
        int v30 = v19;
        do
        {
          if (v29 == v27) {
            uint64_t v31 = v28;
          }
          else {
            uint64_t v31 = "";
          }
          if (v29 == v27) {
            size_t v32 = v25;
          }
          else {
            size_t v32 = 0;
          }
          sub_25C15B478(a2[1], v30 + v27++, v31, v32);
        }
        while (v23 != v27);
        uint64_t v6 = v26;
        int v14 = v35;
      }
      goto LABEL_44;
    }
    int v15 = 0;
LABEL_49:
    if (v15 + v6 != v33)
    {
      int v37 = 13;
      sub_25C139528((uint64_t)&v38);
      sub_25C136E68(&v38, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiece/src/sentencepiece_processor.cc", 133);
      sub_25C136E68(&v38, (uint64_t)"(", 1);
      std::ostream::operator<<();
      sub_25C136E68(&v38, (uint64_t)") [", 3);
      sub_25C136E68(&v38, (uint64_t)"(token_index_begin + offset) == (token_index_end)", 49);
      sub_25C136E68(&v38, (uint64_t)"] ", 2);
      sub_25C1396C0();
    }
    *uint64_t v34 = 0;
    if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v39.__r_.__value_.__l.__data_);
    }
  }
}

void sub_25C15B41C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  if (*(char *)(v13 - 89) < 0) {
    operator delete(*(void **)(v13 - 112));
  }
  _Unwind_Resume(exception_object);
}

std::string *sub_25C15B478(void **a1, int a2, void *__src, size_t __len)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    sub_25C1365BC();
  }
  uint64_t v7 = *(void *)(*(void *)(**a1 + 64) + 8 * a2 + 8);
  if (__len >= 0x17)
  {
    size_t v9 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v9 = __len | 7;
    }
    size_t v10 = v9 + 1;
    p_dst = (long long *)operator new(v9 + 1);
    *((void *)&__dst + 1) = __len;
    unint64_t v19 = v10 | 0x8000000000000000;
    *(void *)&long long __dst = p_dst;
    goto LABEL_8;
  }
  HIBYTE(v19) = __len;
  p_dst = &__dst;
  if (__len) {
LABEL_8:
  }
    memmove(p_dst, __src, __len);
  *((unsigned char *)p_dst + __len) = 0;
  *(_DWORD *)(v7 + 40) |= 2u;
  uint64_t v11 = *(void *)(v7 + 8);
  BOOL v12 = (void *)(v11 & 0xFFFFFFFFFFFFFFFELL);
  if (v11) {
    BOOL v12 = (void *)*v12;
  }
  sub_25C13688C((uint64_t **)(v7 + 56), &__dst, (uint64_t)v12);
  if (SHIBYTE(v19) < 0) {
    operator delete((void *)__dst);
  }
  uint64_t v13 = *a1[1];
  if (*(char *)(v13 + 23) < 0) {
    uint64_t v14 = *(void *)(v13 + 8);
  }
  else {
    LODWORD(v14) = *(unsigned __int8 *)(v13 + 23);
  }
  int v15 = *(_DWORD *)(v7 + 40);
  *(_DWORD *)(v7 + 40) = v15 | 8;
  *(_DWORD *)(v7 + 68) = v14;
  if (*(char *)(v13 + 23) < 0) {
    uint64_t v16 = *(void *)(v13 + 8);
  }
  else {
    LODWORD(v16) = *(unsigned __int8 *)(v13 + 23);
  }
  *(_DWORD *)(v7 + 40) = v15 | 0x18;
  *(_DWORD *)(v7 + 72) = v16 + __len;

  return std::string::append((std::string *)v13, (const std::string::value_type *)__src, __len);
}

void sub_25C15B5DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_25C15B5F8(const char *a1)
{
  exceptiochar n = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_25C15B654(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2654AE170, MEMORY[0x263F8C068]);
}

void sub_25C15B640(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_25C15B654(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C390] + 16);
  return result;
}

void sub_25C15B688(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  sub_25C15B728(__p, a2);
  (*(void (**)(uint64_t, void **, uint64_t))(*(void *)a1 + 240))(a1, __p, a3);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

void sub_25C15B70C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_25C15B728(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v2 = a2[1];
  a1[1] = 0;
  a1[2] = 0;
  *a1 = 0;
  uint64_t v4 = v2 - v3;
  if (v4)
  {
    unint64_t v7 = 0xAAAAAAAAAAAAAAABLL * (v4 >> 3);
    sub_25C15B81C(a1, v7);
    uint64_t v8 = (char *)a1[1];
    bzero(v8, 16 * v7);
    a1[1] = &v8[16 * v7];
    uint64_t v9 = *a2;
    if (a2[1] != *a2)
    {
      uint64_t v10 = 0;
      unint64_t v11 = 0;
      BOOL v12 = (void *)(*a1 + 8);
      do
      {
        uint64_t v13 = (void *)(v9 + v10);
        LODWORD(v9) = *(char *)(v9 + v10 + 23);
        if ((v9 & 0x80000000) != 0)
        {
          uint64_t v14 = (void *)*v13;
          uint64_t v9 = v13[1];
        }
        else
        {
          uint64_t v9 = v9;
          uint64_t v14 = v13;
        }
        *(v12 - 1) = v14;
        *BOOL v12 = v9;
        ++v11;
        uint64_t v9 = *a2;
        v12 += 2;
        v10 += 24;
      }
      while (0xAAAAAAAAAAAAAAABLL * ((a2[1] - *a2) >> 3) > v11);
    }
  }
}

void sub_25C15B800(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_25C15B81C(void *a1, unint64_t a2)
{
  if (a2 >> 60) {
    sub_25C137658();
  }
  uint64_t result = (char *)sub_25C13CA74(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

void sub_25C15B85C(uint64_t a1@<X0>, char *a2@<X1>, size_t a3@<X2>, uint64_t a4@<X6>, void *a5@<X8>, float a6@<S0>)
{
  if (((*(uint64_t (**)(void))(**(void **)(a1 + 8) + 96))(*(void *)(a1 + 8)) & 1) == 0)
  {
    LODWORD(v32) = 13;
    uint64_t v23 = (void *)sub_25C139528((uint64_t)&v33);
    sub_25C136E68(v23, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiece/src/sentencepiece_processor.cc", 133);
    sub_25C136E68(&v33, (uint64_t)"(", 1);
    std::ostream::operator<<();
    sub_25C136E68(&v33, (uint64_t)") [", 3);
    sub_25C136E68(&v33, (uint64_t)"model_->IsSampleEncodeAndScoreAvailable()", 41);
    sub_25C136E68(&v33, (uint64_t)"] ", 2);
    sub_25C136E68(&v33, (uint64_t)"SampleEncodeAndScore is not available for the current model.", 60);
    sub_25C1396C0();
  }
  unint64_t v29 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  (*(void (**)(void, char *, size_t, void **, void **))(**(void **)(a1 + 16) + 32))(*(void *)(a1 + 16), a2, a3, &v29, &v26);
  if (*a5) {
    goto LABEL_25;
  }
  *a5 = 0;
  (*(void (**)(uint64_t *__return_ptr, float))(**(void **)(a1 + 8) + 64))(&v24, a6);
  uint64_t v12 = v24;
  uint64_t v13 = v25;
  if (v24 == v25)
  {
    LODWORD(v32) = 13;
    sub_25C139528((uint64_t)&v33);
    sub_25C136E68(&v33, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiece/src/sentencepiece_processor.cc", 133);
    sub_25C136E68(&v33, (uint64_t)"(", 1);
    std::ostream::operator<<();
    sub_25C136E68(&v33, (uint64_t)") [", 3);
    sub_25C136E68(&v33, (uint64_t)"!results.empty()", 16);
    sub_25C136E68(&v33, (uint64_t)"] ", 2);
    sub_25C136E68(&v33, (uint64_t)"SampleEncodeAndScore returns empty result.", 42);
    sub_25C1396C0();
  }
  do
  {
    uint64_t v14 = *(int **)(a4 + 32);
    if (!v14)
    {
      int v15 = *(_DWORD *)(a4 + 24);
      int v16 = *(_DWORD *)(a4 + 28);
LABEL_9:
      if (v15 <= v16)
      {
        sub_25C14C1A8((uint64_t *)(a4 + 16), v16 - v15 + 1);
        uint64_t v14 = *(int **)(a4 + 32);
      }
      int v16 = *v14;
      goto LABEL_12;
    }
    int v15 = *(_DWORD *)(a4 + 24);
    int v16 = *v14;
    if (v15 < *v14)
    {
      *(_DWORD *)(a4 + 24) = v15 + 1;
      std::string::size_type v17 = *(void **)&v14[2 * v15 + 2];
      goto LABEL_13;
    }
    if (v16 == *(_DWORD *)(a4 + 28)) {
      goto LABEL_9;
    }
LABEL_12:
    *uint64_t v14 = v16 + 1;
    std::string::size_type v17 = sub_25C14DC28(*(void *)(a4 + 16));
    uint64_t v18 = *(void *)(a4 + 32);
    uint64_t v19 = *(int *)(a4 + 24);
    *(_DWORD *)(a4 + 24) = v19 + 1;
    *(void *)(v18 + 8 * v19 + 8) = v17;
LABEL_13:
    int v20 = *(_DWORD *)(v12 + 24);
    *((_DWORD *)v17 + 10) |= 2u;
    *((_DWORD *)v17 + 20) = v20;
    if (v31 >= 0) {
      BOOL v21 = &v29;
    }
    else {
      BOOL v21 = v29;
    }
    if (v31 >= 0) {
      uint64_t v22 = HIBYTE(v31);
    }
    else {
      uint64_t v22 = v30;
    }
    sub_25C15BE68(a5, (uint64_t *)a1, a2, a3, (uint64_t)v21, v22, (uint64_t *)&v26, *(void *)v12, *(void *)(v12 + 8), (uint64_t)v17);
    if (*a5) {
      goto LABEL_24;
    }
    *a5 = 0;
    v12 += 32;
  }
  while (v12 != v13);
  *a5 = 0;
LABEL_24:
  size_t v32 = (void **)&v24;
  sub_25C1374B8(&v32);
LABEL_25:
  if (v26)
  {
    uint64_t v27 = v26;
    operator delete(v26);
  }
  if (SHIBYTE(v31) < 0) {
    operator delete(v29);
  }
}

void sub_25C15BDF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,char *a24)
{
  a24 = &a12;
  sub_25C1374B8((void ***)&a24);
  if (__p)
  {
    a16 = (uint64_t)__p;
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  _Unwind_Resume(a1);
}

void sub_25C15BE68(void *a1, uint64_t *a2, char *a3, size_t a4, uint64_t a5, uint64_t a6, uint64_t *a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  if (a8 == a9)
  {
    size_t v23 = 0;
    goto LABEL_130;
  }
  uint64_t v11 = a8;
  unint64_t v12 = 0;
  char v13 = 0;
  uint64_t v105 = (uint64_t *)(a10 + 48);
  do
  {
    size_t v14 = *(void *)(v11 + 8);
    if (!v14)
    {
      LODWORD(__p[0].__r_.__value_.__l.__data_) = 13;
      int v93 = (void *)sub_25C139528((uint64_t)&__p[0].__r_.__value_.__l.__size_);
      sub_25C136E68(v93, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiece/src/sentencepiece_processor.cc", 133);
      sub_25C136E68(&__p[0].__r_.__value_.__l.__size_, (uint64_t)"(", 1);
      std::ostream::operator<<();
      sub_25C136E68(&__p[0].__r_.__value_.__l.__size_, (uint64_t)") [", 3);
      sub_25C136E68(&__p[0].__r_.__value_.__l.__size_, (uint64_t)"!w.empty()", 10);
      sub_25C136E68(&__p[0].__r_.__value_.__l.__size_, (uint64_t)"] ", 2);
      sub_25C136E68(&__p[0].__r_.__value_.__l.__size_, (uint64_t)"Empty piece is not allowed.", 27);
      sub_25C1396C0();
    }
    int v15 = *(std::string::value_type **)v11;
    uint64_t v16 = *(unsigned int *)(v11 + 16);
    int v106 = (*(uint64_t (**)(uint64_t *, uint64_t))(*a2 + 496))(a2, v16);
    if ((*(unsigned int (**)(uint64_t *, uint64_t))(*a2 + 504))(a2, v16))
    {
      std::string::size_type v17 = *(int **)(a10 + 64);
      if (v17)
      {
        int v18 = *(_DWORD *)(a10 + 56);
        int v19 = *v17;
        if (v18 < *v17)
        {
          *(_DWORD *)(a10 + 56) = v18 + 1;
          int v20 = *(void **)&v17[2 * v18 + 2];
LABEL_62:
          *((_DWORD *)v20 + 10) |= 1u;
          sub_25C136514(__p, v15, v14);
          uint64_t v53 = v20[1];
          uint64_t v54 = (void *)(v53 & 0xFFFFFFFFFFFFFFFELL);
          if (v53) {
            uint64_t v54 = (void *)*v54;
          }
          sub_25C13688C((uint64_t **)v20 + 6, (long long *)__p, (uint64_t)v54);
          if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__p[0].__r_.__value_.__l.__data_);
          }
          int v55 = *((_DWORD *)v20 + 10);
          *((_DWORD *)v20 + 16) = v16;
          size_t v25 = *(void *)(*a7 + 8 * v12);
          *((_DWORD *)v20 + 17) = v25;
          *((_DWORD *)v20 + 10) = v55 | 0x1C;
          goto LABEL_90;
        }
        if (v19 != *(_DWORD *)(a10 + 60))
        {
LABEL_61:
          int *v17 = v19 + 1;
          int v20 = sub_25C14CEF0(*(void *)(a10 + 48));
          uint64_t v51 = *(void *)(a10 + 64);
          uint64_t v52 = *(int *)(a10 + 56);
          *(_DWORD *)(a10 + 56) = v52 + 1;
          *(void *)(v51 + 8 * v52 + 8) = v20;
          goto LABEL_62;
        }
      }
      else
      {
        int v18 = *(_DWORD *)(a10 + 56);
        int v19 = *(_DWORD *)(a10 + 60);
      }
      if (v18 <= v19)
      {
        sub_25C14C1A8(v105, v19 - v18 + 1);
        std::string::size_type v17 = *(int **)(a10 + 64);
      }
      int v19 = *v17;
      goto LABEL_61;
    }
    uint64_t v21 = *a7;
    uint64_t v22 = a7[1] - *a7;
    if (v12 >= v22 >> 3)
    {
      LODWORD(__p[0].__r_.__value_.__l.__data_) = 13;
      uint64_t v94 = (void *)sub_25C139528((uint64_t)&__p[0].__r_.__value_.__l.__size_);
      sub_25C136E68(v94, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiece/src/sentencepiece_processor.cc", 133);
      sub_25C136E68(&__p[0].__r_.__value_.__l.__size_, (uint64_t)"(", 1);
      std::ostream::operator<<();
      sub_25C136E68(&__p[0].__r_.__value_.__l.__size_, (uint64_t)") [", 3);
      sub_25C136E68(&__p[0].__r_.__value_.__l.__size_, (uint64_t)"(begin) < (norm_to_orig.size())", 31);
      sub_25C136E68(&__p[0].__r_.__value_.__l.__size_, (uint64_t)"] ", 2);
      sub_25C1396C0();
    }
    size_t v23 = v14 + v12;
    if (v14 + v12 >= v22 >> 3)
    {
      LODWORD(__p[0].__r_.__value_.__l.__data_) = 13;
      uint64_t v95 = (void *)sub_25C139528((uint64_t)&__p[0].__r_.__value_.__l.__size_);
      sub_25C136E68(v95, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiece/src/sentencepiece_processor.cc", 133);
      sub_25C136E68(&__p[0].__r_.__value_.__l.__size_, (uint64_t)"(", 1);
      std::ostream::operator<<();
      sub_25C136E68(&__p[0].__r_.__value_.__l.__size_, (uint64_t)") [", 3);
      sub_25C136E68(&__p[0].__r_.__value_.__l.__size_, (uint64_t)"(end) < (norm_to_orig.size())", 29);
      sub_25C136E68(&__p[0].__r_.__value_.__l.__size_, (uint64_t)"] ", 2);
      sub_25C1396C0();
    }
    size_t v24 = *(void *)(v21 + 8 * v12);
    if (v24 > a4)
    {
      LODWORD(__p[0].__r_.__value_.__l.__data_) = 13;
      int v96 = (void *)sub_25C139528((uint64_t)&__p[0].__r_.__value_.__l.__size_);
      sub_25C136E68(v96, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiece/src/sentencepiece_processor.cc", 133);
      sub_25C136E68(&__p[0].__r_.__value_.__l.__size_, (uint64_t)"(", 1);
      std::ostream::operator<<();
      sub_25C136E68(&__p[0].__r_.__value_.__l.__size_, (uint64_t)") [", 3);
      sub_25C136E68(&__p[0].__r_.__value_.__l.__size_, (uint64_t)"(orig_begin) <= (input.size())", 30);
      sub_25C136E68(&__p[0].__r_.__value_.__l.__size_, (uint64_t)"] ", 2);
      sub_25C1396C0();
    }
    size_t v25 = *(void *)(v21 + 8 * v23);
    if (v25 > a4)
    {
      LODWORD(__p[0].__r_.__value_.__l.__data_) = 13;
      uint64_t v97 = (void *)sub_25C139528((uint64_t)&__p[0].__r_.__value_.__l.__size_);
      sub_25C136E68(v97, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiece/src/sentencepiece_processor.cc", 133);
      sub_25C136E68(&__p[0].__r_.__value_.__l.__size_, (uint64_t)"(", 1);
      std::ostream::operator<<();
      sub_25C136E68(&__p[0].__r_.__value_.__l.__size_, (uint64_t)") [", 3);
      sub_25C136E68(&__p[0].__r_.__value_.__l.__size_, (uint64_t)"(orig_end) <= (input.size())", 28);
      sub_25C136E68(&__p[0].__r_.__value_.__l.__size_, (uint64_t)"] ", 2);
      sub_25C1396C0();
    }
    size_t v26 = v25 - v24;
    if (v25 < v24)
    {
      LODWORD(__p[0].__r_.__value_.__l.__data_) = 13;
      uint64_t v98 = (void *)sub_25C139528((uint64_t)&__p[0].__r_.__value_.__l.__size_);
      sub_25C136E68(v98, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiece/src/sentencepiece_processor.cc", 133);
      sub_25C136E68(&__p[0].__r_.__value_.__l.__size_, (uint64_t)"(", 1);
      std::ostream::operator<<();
      sub_25C136E68(&__p[0].__r_.__value_.__l.__size_, (uint64_t)") [", 3);
      sub_25C136E68(&__p[0].__r_.__value_.__l.__size_, (uint64_t)"(orig_begin) <= (orig_end)", 26);
      sub_25C136E68(&__p[0].__r_.__value_.__l.__size_, (uint64_t)"] ", 2);
      sub_25C1396C0();
    }
    if (a4 >= v24) {
      size_t v27 = v24;
    }
    else {
      size_t v27 = a4;
    }
    uint64_t v28 = &a3[v27];
    size_t v29 = a4 - v27;
    if (v29 < v26) {
      size_t v26 = v29;
    }
    __src = v28;
    __lechar n = v26;
    if (!v106) {
      goto LABEL_71;
    }
    if ((*(unsigned int (**)(uint64_t))(*(void *)a2[1] + 184))(a2[1]))
    {
      while (1)
      {
        std::string::value_type v31 = *v15++;
        std::string::value_type v30 = v31;
        size_t v32 = *(int **)(a10 + 64);
        if (!v32) {
          break;
        }
        int v33 = *(_DWORD *)(a10 + 56);
        int v34 = *v32;
        if (v33 >= *v32)
        {
          if (v34 == *(_DWORD *)(a10 + 60))
          {
LABEL_25:
            if (v33 <= v34)
            {
              sub_25C14C1A8(v105, v34 - v33 + 1);
              size_t v32 = *(int **)(a10 + 64);
            }
            int v34 = *v32;
          }
          *size_t v32 = v34 + 1;
          int v35 = sub_25C14CEF0(*(void *)(a10 + 48));
          uint64_t v36 = *(void *)(a10 + 64);
          uint64_t v37 = *(int *)(a10 + 56);
          *(_DWORD *)(a10 + 56) = v37 + 1;
          *(void *)(v36 + 8 * v37 + 8) = v35;
          goto LABEL_29;
        }
        *(_DWORD *)(a10 + 56) = v33 + 1;
        int v35 = *(void **)&v32[2 * v33 + 2];
LABEL_29:
        __p[0].__r_.__value_.__s.__data_[0] = v30;
        sub_25C1497E0((uint64_t)&__dst, (unsigned __int8 *)__p);
        if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          p_dst = &__dst;
        }
        else {
          p_dst = (std::string *)__dst.__r_.__value_.__r.__words[0];
        }
        if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          std::string::size_type size = HIBYTE(__dst.__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type size = __dst.__r_.__value_.__l.__size_;
        }
        int v40 = (*(uint64_t (**)(uint64_t, std::string *, std::string::size_type))(*(void *)a2[1] + 112))(a2[1], p_dst, size);
        if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          BOOL v41 = &__dst;
        }
        else {
          BOOL v41 = (std::string *)__dst.__r_.__value_.__r.__words[0];
        }
        if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          std::string::size_type v42 = HIBYTE(__dst.__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type v42 = __dst.__r_.__value_.__l.__size_;
        }
        *((_DWORD *)v35 + 10) |= 1u;
        sub_25C136514(__p, v41, v42);
        uint64_t v43 = v35[1];
        uint64_t v44 = (void *)(v43 & 0xFFFFFFFFFFFFFFFELL);
        if (v43) {
          uint64_t v44 = (void *)*v44;
        }
        sub_25C13688C((uint64_t **)v35 + 6, (long long *)__p, (uint64_t)v44);
        if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p[0].__r_.__value_.__l.__data_);
        }
        int v45 = *((_DWORD *)v35 + 10);
        *((_DWORD *)v35 + 10) = v45 | 4;
        *((_DWORD *)v35 + 16) = v40;
        if (v14 == 1)
        {
          *((_DWORD *)v35 + 10) = v45 | 6;
          sub_25C136514(__p, __src, __len);
          uint64_t v46 = v35[1];
          BOOL v47 = (void *)(v46 & 0xFFFFFFFFFFFFFFFELL);
          if (v46) {
            BOOL v47 = (void *)*v47;
          }
          sub_25C13688C((uint64_t **)v35 + 7, (long long *)__p, (uint64_t)v47);
          if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__p[0].__r_.__value_.__l.__data_);
          }
          int v48 = *((_DWORD *)v35 + 10);
          *((_DWORD *)v35 + 17) = v24;
          int v49 = v48 | 0x18;
          int v50 = v25;
        }
        else
        {
          *((_DWORD *)v35 + 17) = v24;
          int v49 = v45 | 0x1C;
          int v50 = v24;
        }
        *((_DWORD *)v35 + 10) = v49;
        *((_DWORD *)v35 + 18) = v50;
        if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__dst.__r_.__value_.__l.__data_);
        }
        if (!--v14)
        {
          unint64_t v12 = v23;
          goto LABEL_91;
        }
      }
      int v33 = *(_DWORD *)(a10 + 56);
      int v34 = *(_DWORD *)(a10 + 60);
      goto LABEL_25;
    }
    if ((v13 & 1) == 0)
    {
LABEL_71:
      size_t v58 = *(int **)(a10 + 64);
      if (v58)
      {
        int v59 = *(_DWORD *)(a10 + 56);
        int v60 = *v58;
        if (v59 < *v58)
        {
          *(_DWORD *)(a10 + 56) = v59 + 1;
          int v20 = *(void **)&v58[2 * v59 + 2];
LABEL_80:
          *((_DWORD *)v20 + 10) |= 1u;
          sub_25C136514(__p, v15, v14);
          uint64_t v63 = v20[1];
          uint64_t v64 = (void *)(v63 & 0xFFFFFFFFFFFFFFFELL);
          if (v63) {
            uint64_t v64 = (void *)*v64;
          }
          sub_25C13688C((uint64_t **)v20 + 6, (long long *)__p, (uint64_t)v64);
          if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__p[0].__r_.__value_.__l.__data_);
          }
          int v65 = *((_DWORD *)v20 + 10);
          *((_DWORD *)v20 + 16) = v16;
          *((_DWORD *)v20 + 10) = v65 | 6;
          sub_25C136514(__p, __src, __len);
          uint64_t v66 = v20[1];
          size_t v67 = (void *)(v66 & 0xFFFFFFFFFFFFFFFELL);
          if (v66) {
            size_t v67 = (void *)*v67;
          }
          sub_25C13688C((uint64_t **)v20 + 7, (long long *)__p, (uint64_t)v67);
          if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__p[0].__r_.__value_.__l.__data_);
          }
          int v68 = *((_DWORD *)v20 + 10);
          *((_DWORD *)v20 + 17) = v24;
          int v69 = v68 | 0x18;
          goto LABEL_89;
        }
        if (v60 != *(_DWORD *)(a10 + 60))
        {
LABEL_79:
          int *v58 = v60 + 1;
          int v20 = sub_25C14CEF0(*(void *)(a10 + 48));
          uint64_t v61 = *(void *)(a10 + 64);
          uint64_t v62 = *(int *)(a10 + 56);
          *(_DWORD *)(a10 + 56) = v62 + 1;
          *(void *)(v61 + 8 * v62 + 8) = v20;
          goto LABEL_80;
        }
      }
      else
      {
        int v59 = *(_DWORD *)(a10 + 56);
        int v60 = *(_DWORD *)(a10 + 60);
      }
      if (v59 <= v60)
      {
        sub_25C14C1A8(v105, v60 - v59 + 1);
        size_t v58 = *(int **)(a10 + 64);
      }
      int v60 = *v58;
      goto LABEL_79;
    }
    if (v14 > 0x7FFFFFFFFFFFFFF7) {
      goto LABEL_145;
    }
    int v20 = *(void **)(*(void *)(a10 + 64) + 8 * *(int *)(a10 + 56));
    uint64_t v56 = v20[6];
    if (v14 >= 0x17)
    {
      uint64_t v70 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v14 | 7) != 0x17) {
        uint64_t v70 = v14 | 7;
      }
      uint64_t v99 = v70 + 1;
      unint64_t v57 = (std::string *)operator new(v70 + 1);
      __dst.__r_.__value_.__l.__size_ = v14;
      __dst.__r_.__value_.__r.__words[2] = v99 | 0x8000000000000000;
      __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)v57;
    }
    else
    {
      *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v14;
      unint64_t v57 = &__dst;
    }
    unint64_t v71 = v56 & 0xFFFFFFFFFFFFFFFELL;
    memmove(v57, v15, v14);
    v57->__r_.__value_.__s.__data_[v14] = 0;
    int v72 = *(char *)(v71 + 23);
    if (v72 >= 0) {
      long long v73 = (const std::string::value_type *)v71;
    }
    else {
      long long v73 = *(const std::string::value_type **)v71;
    }
    if (v72 >= 0) {
      std::string::size_type v74 = *(unsigned __int8 *)(v71 + 23);
    }
    else {
      std::string::size_type v74 = *(void *)(v71 + 8);
    }
    std::string::size_type v75 = std::string::insert(&__dst, 0, v73, v74);
    __p[0] = *v75;
    v75->__r_.__value_.__l.__size_ = 0;
    v75->__r_.__value_.__r.__words[2] = 0;
    v75->__r_.__value_.__r.__words[0] = 0;
    *((_DWORD *)v20 + 10) |= 1u;
    uint64_t v76 = v20[1];
    uint64_t v77 = (void *)(v76 & 0xFFFFFFFFFFFFFFFELL);
    size_t v78 = __len;
    if (v76) {
      uint64_t v77 = (void *)*v77;
    }
    sub_25C13688C((uint64_t **)v20 + 6, (long long *)__p, (uint64_t)v77);
    if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p[0].__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__dst.__r_.__value_.__l.__data_);
    }
    if (__len > 0x7FFFFFFFFFFFFFF7) {
LABEL_145:
    }
      sub_25C1365BC();
    uint64_t v79 = v20[7];
    if (__len >= 0x17)
    {
      uint64_t v81 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((__len | 7) != 0x17) {
        uint64_t v81 = __len | 7;
      }
      uint64_t v82 = v81 + 1;
      std::string::size_type v80 = (std::string *)operator new(v81 + 1);
      unint64_t v83 = v82 | 0x8000000000000000;
      size_t v78 = __len;
      __dst.__r_.__value_.__l.__size_ = __len;
      __dst.__r_.__value_.__r.__words[2] = v83;
      __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)v80;
    }
    else
    {
      *((unsigned char *)&__dst.__r_.__value_.__s + 23) = __len;
      std::string::size_type v80 = &__dst;
      if (!__len) {
        goto LABEL_116;
      }
    }
    memmove(v80, __src, v78);
LABEL_116:
    v80->__r_.__value_.__s.__data_[v78] = 0;
    int v84 = *(char *)((v79 & 0xFFFFFFFFFFFFFFFELL) + 23);
    if (v84 >= 0) {
      uint64_t v85 = (const std::string::value_type *)(v79 & 0xFFFFFFFFFFFFFFFELL);
    }
    else {
      uint64_t v85 = *(const std::string::value_type **)(v79 & 0xFFFFFFFFFFFFFFFELL);
    }
    if (v84 >= 0) {
      std::string::size_type v86 = *(unsigned __int8 *)((v79 & 0xFFFFFFFFFFFFFFFELL) + 23);
    }
    else {
      std::string::size_type v86 = *(void *)((v79 & 0xFFFFFFFFFFFFFFFELL) + 8);
    }
    std::string v87 = std::string::insert(&__dst, 0, v85, v86);
    __p[0] = *v87;
    v87->__r_.__value_.__l.__size_ = 0;
    v87->__r_.__value_.__r.__words[2] = 0;
    v87->__r_.__value_.__r.__words[0] = 0;
    *((_DWORD *)v20 + 10) |= 2u;
    uint64_t v88 = v20[1];
    uint64_t v89 = (void *)(v88 & 0xFFFFFFFFFFFFFFFELL);
    if (v88) {
      uint64_t v89 = (void *)*v89;
    }
    sub_25C13688C((uint64_t **)v20 + 7, (long long *)__p, (uint64_t)v89);
    if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p[0].__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__dst.__r_.__value_.__l.__data_);
    }
    int v69 = *((_DWORD *)v20 + 10) | 0x10;
LABEL_89:
    *((_DWORD *)v20 + 10) = v69;
    unint64_t v12 = v23;
LABEL_90:
    *((_DWORD *)v20 + 18) = v25;
    size_t v23 = v12;
LABEL_91:
    v11 += 24;
    char v13 = v106;
  }
  while (v11 != a9);
LABEL_130:
  if (v23 != a6)
  {
    LODWORD(__p[0].__r_.__value_.__l.__data_) = 13;
    uint64_t v92 = (void *)sub_25C139528((uint64_t)&__p[0].__r_.__value_.__l.__size_);
    sub_25C136E68(v92, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiece/src/sentencepiece_processor.cc", 133);
    sub_25C136E68(&__p[0].__r_.__value_.__l.__size_, (uint64_t)"(", 1);
    std::ostream::operator<<();
    sub_25C136E68(&__p[0].__r_.__value_.__l.__size_, (uint64_t)") [", 3);
    sub_25C136E68(&__p[0].__r_.__value_.__l.__size_, (uint64_t)"(consumed) == (normalized.size())", 33);
    sub_25C136E68(&__p[0].__r_.__value_.__l.__size_, (uint64_t)"] ", 2);
    sub_25C136E68(&__p[0].__r_.__value_.__l.__size_, (uint64_t)"all normalized characters are not consumed.", 43);
    sub_25C1396C0();
  }
  sub_25C15A71C(a1, a2, (_DWORD *)a2[5], (_DWORD *)a2[6], a10);
  if (!*a1)
  {
    *a1 = 0;
    *(_DWORD *)(a10 + 40) |= 1u;
    sub_25C136514(__p, a3, a4);
    uint64_t v90 = *(void *)(a10 + 8);
    uint64_t v91 = (void *)(v90 & 0xFFFFFFFFFFFFFFFELL);
    if (v90) {
      uint64_t v91 = (void *)*v91;
    }
    sub_25C13688C((uint64_t **)(a10 + 72), (long long *)__p, (uint64_t)v91);
    if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p[0].__r_.__value_.__l.__data_);
    }
    *a1 = 0;
  }
}

void sub_25C15CC38(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *__p,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  if (a33 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_25C15CCE4(uint64_t *a1@<X0>, char *a2@<X1>, size_t a3@<X2>, int a4@<W3>, uint64_t a5@<X4>, uint64_t *a6@<X8>, float a7@<S0>)
{
  (*(void (**)(uint64_t *))(*a1 + 56))(a1);
  if (*a6) {
    return;
  }
  *a6 = 0;
  if (!a5)
  {
    LODWORD(v41) = 13;
    size_t v14 = (void *)sub_25C139528((uint64_t)&v42);
    sub_25C136E68(v14, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiece/src/sentencepiece_processor.cc", 133);
    sub_25C136E68(&v42, (uint64_t)"(", 1);
    std::ostream::operator<<();
    sub_25C136E68(&v42, (uint64_t)") [", 3);
    sub_25C136E68(&v42, (uint64_t)"spt", 3);
    sub_25C136E68(&v42, (uint64_t)"] ", 2);
    sub_25C136E68(&v42, (uint64_t)"output proto is null", 20);
    sub_25C1396C0();
  }
  sub_25C14DB64(a5);
  if (a4 >= 513)
  {
    LODWORD(v41) = 13;
    int v15 = (void *)sub_25C139528((uint64_t)&v42);
    sub_25C136E68(v15, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiece/src/sentencepiece_processor.cc", 133);
    sub_25C136E68(&v42, (uint64_t)"(", 1);
    std::ostream::operator<<();
    sub_25C136E68(&v42, (uint64_t)") [", 3);
    sub_25C136E68(&v42, (uint64_t)"(nbest_size) <= (512)", 21);
    sub_25C136E68(&v42, (uint64_t)"] ", 2);
    sub_25C136E68(&v42, (uint64_t)"nbest_size must be nbest_size <= 512", 36);
    sub_25C1396C0();
  }
  uint64_t v38 = 0;
  uint64_t v39 = 0;
  uint64_t v40 = 0;
  long long __p = 0;
  uint64_t v36 = 0;
  uint64_t v37 = 0;
  (*(void (**)(uint64_t, char *, size_t, void **, void **))(*(void *)a1[2] + 32))(a1[2], a2, a3, &v38, &__p);
  if (!*a6)
  {
    *a6 = 0;
    char v16 = (*(uint64_t (**)(uint64_t))(*(void *)a1[1] + 88))(a1[1]);
    if (a4 >= 0) {
      char v17 = v16;
    }
    else {
      char v17 = 0;
    }
    if (v17)
    {
      if (a4 > 1)
      {
        (*(void (**)(uint64_t *__return_ptr))(*(void *)a1[1] + 48))(&v33);
        if (v33 == v34)
        {
          LODWORD(v41) = 13;
          sub_25C139528((uint64_t)&v42);
          sub_25C136E68(&v42, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiece/src/sentencepiece_processor.cc", 133);
          sub_25C136E68(&v42, (uint64_t)"(", 1);
          std::ostream::operator<<();
          sub_25C136E68(&v42, (uint64_t)") [", 3);
          sub_25C136E68(&v42, (uint64_t)"!nbests.empty()", 15);
          sub_25C136E68(&v42, (uint64_t)"] ", 2);
          sub_25C136E68(&v42, (uint64_t)"NBestEncode returns empty result.", 33);
          sub_25C1396C0();
        }
        LODWORD(v32[0]) = 0;
        sub_25C15D59C(&v41, (v34 - v33) >> 5, v32);
        if (v34 != v33)
        {
          int v20 = (float *)v41;
          if ((unint64_t)((v34 - v33) >> 5) <= 1) {
            uint64_t v21 = 1;
          }
          else {
            uint64_t v21 = (v34 - v33) >> 5;
          }
          uint64_t v22 = (float *)(v33 + 24);
          do
          {
            float v23 = *v22;
            v22 += 8;
            *v20++ = expf(v23 * a7);
            --v21;
          }
          while (v21);
        }
        uint64_t v24 = sub_25C16CE20();
        sub_25C15D638((double **)v32, (float *)v41, v42);
        int v25 = SHIBYTE(v40);
        size_t v26 = (void **)v38;
        uint64_t v27 = v39;
        int v28 = sub_25C15D868(v24, (double **)v32);
        if (v25 >= 0) {
          size_t v29 = &v38;
        }
        else {
          size_t v29 = v26;
        }
        if (v25 >= 0) {
          uint64_t v30 = v25;
        }
        else {
          uint64_t v30 = v27;
        }
        sub_25C15BE68(a6, a1, a2, a3, (uint64_t)v29, v30, (uint64_t *)&__p, *(void *)(v33 + 32 * v28), *(void *)(v33 + 32 * v28 + 8), a5);
        uint64_t v31 = *a6;
        if (!*a6) {
          *a6 = 0;
        }
        if (v32[0])
        {
          v32[1] = v32[0];
          operator delete(v32[0]);
        }
        if (v41)
        {
          std::string::size_type v42 = (float *)v41;
          operator delete(v41);
        }
        BOOL v41 = &v33;
        sub_25C1374B8((void ***)&v41);
        if (v31) {
          goto LABEL_5;
        }
LABEL_57:
        *a6 = 0;
        goto LABEL_5;
      }
      (*(void (**)(void **__return_ptr))(*(void *)a1[1] + 40))(&v41);
      if (v40 >= 0) {
        int v18 = &v38;
      }
      else {
        int v18 = v38;
      }
      if (v40 >= 0) {
        uint64_t v19 = HIBYTE(v40);
      }
      else {
        uint64_t v19 = v39;
      }
    }
    else
    {
      if (((*(uint64_t (**)(uint64_t))(*(void *)a1[1] + 80))(a1[1]) & 1) == 0)
      {
        LODWORD(v41) = 13;
        sub_25C139528((uint64_t)&v42);
        sub_25C136E68(&v42, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiece/src/sentencepiece_processor.cc", 133);
        sub_25C136E68(&v42, (uint64_t)"(", 1);
        std::ostream::operator<<();
        sub_25C136E68(&v42, (uint64_t)") [", 3);
        sub_25C136E68(&v42, (uint64_t)"model_->IsSampleEncodeAvailable()", 33);
        sub_25C136E68(&v42, (uint64_t)"] ", 2);
        sub_25C136E68(&v42, (uint64_t)"SampleEncode is not available for the current model.", 52);
        sub_25C1396C0();
      }
      (*(void (**)(void **__return_ptr, float))(*(void *)a1[1] + 56))(&v41, a7);
      if (v40 >= 0) {
        int v18 = &v38;
      }
      else {
        int v18 = v38;
      }
      if (v40 >= 0) {
        uint64_t v19 = HIBYTE(v40);
      }
      else {
        uint64_t v19 = v39;
      }
    }
    sub_25C15BE68(a6, a1, a2, a3, (uint64_t)v18, v19, (uint64_t *)&__p, (uint64_t)v41, (uint64_t)v42, a5);
    if (*a6)
    {
      if (v41)
      {
        std::string::size_type v42 = (float *)v41;
        operator delete(v41);
      }
      goto LABEL_5;
    }
    *a6 = 0;
    if (v41)
    {
      std::string::size_type v42 = (float *)v41;
      operator delete(v41);
    }
    goto LABEL_57;
  }
LABEL_5:
  if (__p)
  {
    uint64_t v36 = __p;
    operator delete(__p);
  }
  if (SHIBYTE(v40) < 0) {
    operator delete(v38);
  }
}

void sub_25C15D4B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,char *a26,uint64_t a27)
{
  a26 = &a14;
  sub_25C1374B8((void ***)&a26);
  if (__p)
  {
    a18 = (uint64_t)__p;
    operator delete(__p);
  }
  if (a25 < 0) {
    operator delete(a20);
  }
  _Unwind_Resume(a1);
}

void *sub_25C15D59C(void *a1, unint64_t a2, _DWORD *a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    if (a2 >> 62) {
      sub_25C137658();
    }
    uint64_t v6 = sub_25C13C324(a2);
    *a1 = v6;
    a1[1] = v6;
    a1[2] = &v6[v7];
    uint64_t v8 = &v6[a2];
    uint64_t v9 = 4 * a2;
    do
    {
      *v6++ = *a3;
      v9 -= 4;
    }
    while (v9);
    a1[1] = v8;
  }
  return a1;
}

void sub_25C15D61C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

double **sub_25C15D638(double **a1, float *a2, float *a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  uint64_t v4 = (char *)a3 - (char *)a2;
  if (a3 != a2)
  {
    if ((unint64_t)v4 >= 0x7FFFFFFFFFFFFFFDLL) {
      sub_25C137658();
    }
    uint64_t v6 = a2;
    uint64_t v7 = (double *)sub_25C13C374(v4 >> 2);
    *a1 = v7;
    a1[1] = v7;
    uint64_t v9 = &v7[v8];
    a1[2] = v9;
    uint64_t v10 = v7;
    while (v6 != a3)
    {
      float v11 = *v6++;
      *v10++ = v11;
    }
    a1[1] = v10;
    uint64_t v12 = (char *)v10 - (char *)v7;
    if (v10 != v7)
    {
      if ((unint64_t)v12 >= 9)
      {
        unint64_t v13 = 0;
        uint64_t v14 = v12 >> 3;
        double v15 = 0.0;
        do
        {
          double v15 = v15 + v7[v13 / 8];
          v13 += 8;
        }
        while (v12 != v13);
        if (v7 < v10)
        {
          char v16 = v7;
          do
          {
            *char v16 = *v16 / v15;
            ++v16;
          }
          while (v16 < v10);
        }
        unint64_t v17 = v14 - 1;
        if (v14 == 1)
        {
          int v18 = 0;
          long long v21 = 0uLL;
        }
        else
        {
          if (v17 >> 61) {
            sub_25C137658();
          }
          int v18 = (double *)sub_25C13C374(v14 - 1);
          int v20 = &v18[v19];
          bzero(v18, 8 * v17);
          *(void *)&long long v21 = &v18[v17];
          *((void *)&v21 + 1) = v20;
          uint64_t v7 = *a1;
          uint64_t v10 = a1[1];
        }
        uint64_t v30 = v10 - 1;
        if (v7 == v30)
        {
LABEL_27:
          *a1 = v18;
          *(_OWORD *)(a1 + 1) = v21;
          if (!v7) {
            return a1;
          }
          goto LABEL_33;
        }
        uint64_t v31 = v7 + 1;
        double v32 = *v7;
        *int v18 = *v7;
        if (v7 + 1 != v30)
        {
          uint64_t v33 = v18 + 1;
          do
          {
            double v34 = *v31++;
            double v32 = v32 + v34;
            *v33++ = v32;
          }
          while (v31 != v30);
          goto LABEL_27;
        }
        *a1 = v18;
        *(_OWORD *)(a1 + 1) = v21;
LABEL_33:
        operator delete(v7);
        return a1;
      }
      a1[1] = v7;
      unint64_t v22 = v7 - *a1;
      if (v22 < v9 - *a1)
      {
        if (v7 == *a1)
        {
          uint64_t v27 = 0;
          uint64_t v25 = 8 * v22;
        }
        else
        {
          float v23 = (char *)sub_25C13C374(v7 - *a1);
          uint64_t v24 = *a1;
          uint64_t v7 = a1[1];
          uint64_t v25 = (uint64_t)&v23[8 * v22];
          uint64_t v27 = (double *)&v23[8 * v26];
          if (v7 != *a1)
          {
            uint64_t v28 = v25;
            do
            {
              uint64_t v29 = *((void *)v7-- - 1);
              *(void *)(v28 - 8) = v29;
              v28 -= 8;
            }
            while (v7 != v24);
            uint64_t v7 = v24;
LABEL_32:
            *a1 = (double *)v28;
            a1[1] = (double *)v25;
            a1[2] = v27;
            if (v7) {
              goto LABEL_33;
            }
            return a1;
          }
        }
        uint64_t v28 = v25;
        goto LABEL_32;
      }
    }
  }
  return a1;
}

void sub_25C15D838(void *a1)
{
}

void sub_25C15D848(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

unint64_t sub_25C15D868(uint64_t a1, double **a2)
{
  uint64_t v4 = *a2;
  float v5 = a2[1];
  unsigned int v6 = sub_25C13867C(a1);
  unsigned int v7 = sub_25C13867C(a1);
  if (v5 != v4)
  {
    unint64_t v8 = v5 - v4;
    do
    {
      unint64_t v9 = v8 >> 1;
      uint64_t v10 = &v4[v8 >> 1];
      double v12 = *v10;
      float v11 = v10 + 1;
      v8 += ~(v8 >> 1);
      if (((double)v6 + (double)v7 * 4294967300.0) * 5.42101086e-20 + 0.0 < v12) {
        unint64_t v8 = v9;
      }
      else {
        uint64_t v4 = v11;
      }
    }
    while (v8);
    float v5 = v4;
  }
  return (unint64_t)((char *)v5 - (char *)*a2) >> 3;
}

void sub_25C15D91C(uint64_t *a1@<X0>, char *a2@<X1>, size_t a3@<X2>, uint64_t a4@<X4>, void *a5@<X8>)
{
  (*(void (**)(uint64_t *))(*a1 + 56))(a1);
  if (*a5) {
    return;
  }
  *a5 = 0;
  if (!a4)
  {
    LODWORD(v30) = 13;
    long long v21 = (void *)sub_25C139528((uint64_t)&v31);
    sub_25C136E68(v21, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiece/src/sentencepiece_processor.cc", 133);
    sub_25C136E68(&v31, (uint64_t)"(", 1);
    std::ostream::operator<<();
    sub_25C136E68(&v31, (uint64_t)") [", 3);
    sub_25C136E68(&v31, (uint64_t)"nbest_spt", 9);
    sub_25C136E68(&v31, (uint64_t)"] ", 2);
    sub_25C136E68(&v31, (uint64_t)"output proto is null", 20);
    sub_25C1396C0();
  }
  sub_25C14E5B8((unsigned char *)a4);
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  (*(void (**)(uint64_t, char *, size_t, void **, void **))(*(void *)a1[2] + 32))(a1[2], a2, a3, &v27, &v24);
  if (*a5) {
    goto LABEL_29;
  }
  *a5 = 0;
  if (((*(uint64_t (**)(uint64_t))(*(void *)a1[1] + 88))(a1[1]) & 1) == 0)
  {
    LODWORD(v30) = 13;
    sub_25C139528((uint64_t)&v31);
    sub_25C136E68(&v31, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiece/src/sentencepiece_processor.cc", 133);
    sub_25C136E68(&v31, (uint64_t)"(", 1);
    std::ostream::operator<<();
    sub_25C136E68(&v31, (uint64_t)") [", 3);
    sub_25C136E68(&v31, (uint64_t)"model_->IsNBestEncodeAvailable()", 32);
    sub_25C136E68(&v31, (uint64_t)"] ", 2);
    sub_25C136E68(&v31, (uint64_t)"NBestEncode is not available for the current model.", 51);
    sub_25C1396C0();
  }
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1[1] + 48))(&v22);
  uint64_t v10 = v22;
  uint64_t v11 = v23;
  if (v22 == v23)
  {
    LODWORD(v30) = 13;
    sub_25C139528((uint64_t)&v31);
    sub_25C136E68(&v31, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiece/src/sentencepiece_processor.cc", 133);
    sub_25C136E68(&v31, (uint64_t)"(", 1);
    std::ostream::operator<<();
    sub_25C136E68(&v31, (uint64_t)") [", 3);
    sub_25C136E68(&v31, (uint64_t)"!nbests.empty()", 15);
    sub_25C136E68(&v31, (uint64_t)"] ", 2);
    sub_25C136E68(&v31, (uint64_t)"NBestEncode returns empty result.", 33);
    sub_25C1396C0();
  }
  do
  {
    double v12 = *(int **)(a4 + 32);
    if (!v12)
    {
      int v13 = *(_DWORD *)(a4 + 24);
      int v14 = *(_DWORD *)(a4 + 28);
LABEL_12:
      if (v13 <= v14)
      {
        sub_25C14C1A8((uint64_t *)(a4 + 16), v14 - v13 + 1);
        double v12 = *(int **)(a4 + 32);
      }
      int v14 = *v12;
      goto LABEL_15;
    }
    int v13 = *(_DWORD *)(a4 + 24);
    int v14 = *v12;
    if (v13 < *v12)
    {
      *(_DWORD *)(a4 + 24) = v13 + 1;
      double v15 = *(void **)&v12[2 * v13 + 2];
      goto LABEL_16;
    }
    if (v14 == *(_DWORD *)(a4 + 28)) {
      goto LABEL_12;
    }
LABEL_15:
    *double v12 = v14 + 1;
    double v15 = sub_25C14DC28(*(void *)(a4 + 16));
    uint64_t v16 = *(void *)(a4 + 32);
    uint64_t v17 = *(int *)(a4 + 24);
    *(_DWORD *)(a4 + 24) = v17 + 1;
    *(void *)(v16 + 8 * v17 + 8) = v15;
LABEL_16:
    int v18 = *(_DWORD *)(v10 + 24);
    *((_DWORD *)v15 + 10) |= 2u;
    *((_DWORD *)v15 + 20) = v18;
    if (v29 >= 0) {
      uint64_t v19 = &v27;
    }
    else {
      uint64_t v19 = v27;
    }
    if (v29 >= 0) {
      uint64_t v20 = HIBYTE(v29);
    }
    else {
      uint64_t v20 = v28;
    }
    sub_25C15BE68(a5, a1, a2, a3, (uint64_t)v19, v20, (uint64_t *)&v24, *(void *)v10, *(void *)(v10 + 8), (uint64_t)v15);
    if (*a5) {
      goto LABEL_28;
    }
    *a5 = 0;
    v10 += 32;
  }
  while (v10 != v11);
  *a5 = 0;
LABEL_28:
  uint64_t v30 = (void **)&v22;
  sub_25C1374B8(&v30);
LABEL_29:
  if (v24)
  {
    uint64_t v25 = v24;
    operator delete(v24);
  }
  if (SHIBYTE(v29) < 0) {
    operator delete(v27);
  }
}

void sub_25C15E060(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,char *a24)
{
  a24 = &a12;
  sub_25C1374B8((void ***)&a24);
  if (__p)
  {
    a16 = (uint64_t)__p;
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  _Unwind_Resume(a1);
}

void sub_25C15E0EC(uint64_t *a1@<X0>, char *a2@<X1>, size_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  (*(void (**)(uint64_t *))(*a1 + 56))(a1);
  if (!*a5)
  {
    *a5 = 0;
    if (!a4)
    {
      LODWORD(v18) = 13;
      double v12 = (void *)sub_25C139528((uint64_t)&v19);
      sub_25C136E68(v12, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiece/src/sentencepiece_processor.cc", 133);
      sub_25C136E68(&v19, (uint64_t)"(", 1);
      std::ostream::operator<<();
      sub_25C136E68(&v19, (uint64_t)") [", 3);
      sub_25C136E68(&v19, (uint64_t)"spt", 3);
      sub_25C136E68(&v19, (uint64_t)"] ", 2);
      sub_25C136E68(&v19, (uint64_t)"output proto is null", 20);
      sub_25C1396C0();
    }
    sub_25C14DB64(a4);
    int v18 = 0;
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    double v15 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    (*(void (**)(uint64_t, char *, size_t, void **, void **))(*(void *)a1[2] + 32))(a1[2], a2, a3, &v18, &v15);
    if (!*a5)
    {
      *a5 = 0;
      (*(void (**)(void **__return_ptr))(*(void *)a1[1] + 40))(&__p);
      if (v20 >= 0) {
        uint64_t v10 = &v18;
      }
      else {
        uint64_t v10 = v18;
      }
      if (v20 >= 0) {
        uint64_t v11 = HIBYTE(v20);
      }
      else {
        uint64_t v11 = v19;
      }
      sub_25C15BE68(a5, a1, a2, a3, (uint64_t)v10, v11, (uint64_t *)&v15, (uint64_t)__p, (uint64_t)v14, a4);
      if (!*a5) {
        *a5 = 0;
      }
      if (__p)
      {
        int v14 = __p;
        operator delete(__p);
      }
    }
    if (v15)
    {
      uint64_t v16 = v15;
      operator delete(v15);
    }
    if (SHIBYTE(v20) < 0) {
      operator delete(v18);
    }
  }
}

void sub_25C15E418(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (__p) {
    operator delete(__p);
  }
  if (a14) {
    operator delete(a14);
  }
  if (a22 < 0) {
    operator delete(a17);
  }
  _Unwind_Resume(exception_object);
}

void sub_25C15E474(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, float *a4@<X3>, void *a5@<X8>, float a6@<S0>)
{
  if (((*(uint64_t (**)(void))(**(void **)(a1 + 8) + 104))(*(void *)(a1 + 8)) & 1) == 0)
  {
    LODWORD(v16) = 13;
    double v12 = (void *)sub_25C139528((uint64_t)&v17);
    sub_25C136E68(v12, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiece/src/sentencepiece_processor.cc", 133);
    sub_25C136E68(&v17, (uint64_t)"(", 1);
    std::ostream::operator<<();
    sub_25C136E68(&v17, (uint64_t)") [", 3);
    sub_25C136E68(&v17, (uint64_t)"model_->IsCalculateEntropyAvailable()", 37);
    sub_25C136E68(&v17, (uint64_t)"] ", 2);
    sub_25C136E68(&v17, (uint64_t)"CalculateEntropy is not available for the current model.", 56);
    sub_25C1396C0();
  }
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  long long __p = 0;
  int v14 = 0;
  uint64_t v15 = 0;
  (*(void (**)(void, uint64_t, uint64_t, void **, void **))(**(void **)(a1 + 16) + 32))(*(void *)(a1 + 16), a2, a3, &v16, &__p);
  if (!*a5)
  {
    *a5 = 0;
    *a4 = (*(float (**)(float))(**(void **)(a1 + 8) + 72))(a6);
    *a5 = 0;
  }
  if (__p)
  {
    int v14 = __p;
    operator delete(__p);
  }
  if (SHIBYTE(v18) < 0) {
    operator delete(v16);
  }
}

void sub_25C15E744(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (__p) {
    operator delete(__p);
  }
  if (a18 < 0) {
    operator delete(a13);
  }
  _Unwind_Resume(exception_object);
}

void sub_25C15E784(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X6>, void *a8@<X8>, float a9@<S0>)
{
  (*(void (**)(uint64_t))(*(void *)a1 + 56))(a1);
  if (!*a8)
  {
    *a8 = 0;
    if (!a7)
    {
      int v58 = 13;
      uint64_t v53 = (void *)sub_25C139528((uint64_t)&v59);
      sub_25C136E68(v53, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiece/src/sentencepiece_processor.cc", 133);
      sub_25C136E68(&v59, (uint64_t)"(", 1);
      std::ostream::operator<<();
      sub_25C136E68(&v59, (uint64_t)") [", 3);
      sub_25C136E68(&v59, (uint64_t)"ids", 3);
      sub_25C136E68(&v59, (uint64_t)"] ", 2);
      sub_25C136E68(&v59, (uint64_t)"output container is null", 24);
      sub_25C1396C0();
    }
    sub_25C159144(a7);
    sub_25C14DE18((uint64_t)&v58, 0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, int *, float))(*(void *)a1 + 224))(a1, a2, a3, a4, a5, a6, &v58, a9);
    if (!*a8)
    {
      *a8 = 0;
      sub_25C159144(a7);
      int v18 = v61;
      uint64_t v19 = v61;
      uint64_t v54 = a8;
      int v55 = a7 + 2;
      uint64_t v20 = *a7;
      if (v61 > (unint64_t)((a7[2] - *a7) >> 5))
      {
        if (v61 < 0) {
          sub_25C137658();
        }
        uint64_t v21 = a7[1];
        size_t v67 = a7 + 2;
        uint64_t v63 = (char *)sub_25C15ED7C(v61);
        uint64_t v64 = &v63[v21 - v20];
        int v65 = v64;
        uint64_t v66 = &v63[32 * v22];
        sub_25C15EE30(a7, &v63);
        sub_25C15EEC4((uint64_t)&v63);
        int v18 = v61;
        uint64_t v19 = v61;
      }
      if (v62) {
        uint64_t v23 = (uint64_t *)(v62 + 8);
      }
      else {
        uint64_t v23 = 0;
      }
      if (v18)
      {
        uint64_t v56 = &v23[v19];
        unint64_t v57 = a7;
        do
        {
          uint64_t v24 = *v23;
          unint64_t v25 = *(int *)(*v23 + 56);
          if (v25)
          {
            if ((v25 & 0x80000000) != 0) {
              sub_25C137658();
            }
            uint64_t v26 = (char *)sub_25C13C324(v25);
            uint64_t v28 = (uint64_t)v26;
            uint64_t v29 = *(int *)(v24 + 56);
            uint64_t v30 = *(void *)(v24 + 64);
            if (v30) {
              uint64_t v31 = v30 + 8;
            }
            else {
              uint64_t v31 = 0;
            }
            if (v29)
            {
              double v32 = &v26[4 * v27];
              uint64_t v33 = v26;
              double v34 = v26;
              uint64_t v35 = v31 + 8 * v29;
              do
              {
                int v36 = *(_DWORD *)(*(void *)v31 + 64);
                if (v33 >= v32)
                {
                  uint64_t v37 = (v33 - v34) >> 2;
                  unint64_t v38 = v37 + 1;
                  if ((unint64_t)(v37 + 1) >> 62) {
                    sub_25C137658();
                  }
                  if ((v32 - v34) >> 1 > v38) {
                    unint64_t v38 = (v32 - v34) >> 1;
                  }
                  if ((unint64_t)(v32 - v34) >= 0x7FFFFFFFFFFFFFFCLL) {
                    unint64_t v39 = 0x3FFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v39 = v38;
                  }
                  if (v39) {
                    unint64_t v39 = (unint64_t)sub_25C13C324(v39);
                  }
                  else {
                    uint64_t v40 = 0;
                  }
                  BOOL v41 = (char *)(v39 + 4 * v37);
                  *(_DWORD *)BOOL v41 = v36;
                  uint64_t v28 = (uint64_t)(v41 + 4);
                  while (v33 != v34)
                  {
                    int v42 = *((_DWORD *)v33 - 1);
                    v33 -= 4;
                    *((_DWORD *)v41 - 1) = v42;
                    v41 -= 4;
                  }
                  double v32 = (char *)(v39 + 4 * v40);
                  if (v34) {
                    operator delete(v34);
                  }
                  double v34 = v41;
                }
                else
                {
                  *(_DWORD *)uint64_t v33 = v36;
                  uint64_t v28 = (uint64_t)(v33 + 4);
                }
                v31 += 8;
                uint64_t v33 = (char *)v28;
              }
              while (v31 != v35);
            }
            else
            {
              double v34 = v26;
            }
          }
          else
          {
            uint64_t v28 = 0;
            double v34 = 0;
          }
          int v43 = *(_DWORD *)(v24 + 80);
          unint64_t v45 = v57[1];
          unint64_t v44 = v57[2];
          if (v45 >= v44)
          {
            uint64_t v47 = (uint64_t)(v45 - *v57) >> 5;
            if ((unint64_t)(v47 + 1) >> 59) {
              sub_25C137658();
            }
            uint64_t v48 = v44 - *v57;
            uint64_t v49 = v48 >> 4;
            if (v48 >> 4 <= (unint64_t)(v47 + 1)) {
              uint64_t v49 = v47 + 1;
            }
            if ((unint64_t)v48 >= 0x7FFFFFFFFFFFFFE0) {
              unint64_t v50 = 0x7FFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v50 = v49;
            }
            size_t v67 = v55;
            if (v50) {
              unint64_t v50 = (unint64_t)sub_25C15ED7C(v50);
            }
            else {
              uint64_t v51 = 0;
            }
            unint64_t v52 = v50 + 32 * v47;
            uint64_t v63 = (char *)v50;
            uint64_t v64 = (char *)v52;
            int v65 = (char *)v52;
            uint64_t v66 = (char *)(v50 + 32 * v51);
            *(void *)unint64_t v52 = 0;
            *(void *)(v52 + 8) = 0;
            *(void *)(v52 + 16) = 0;
            sub_25C15EDB4((void *)v52, v34, v28, (v28 - (uint64_t)v34) >> 2);
            *(_DWORD *)(v52 + 24) = v43;
            v65 += 32;
            sub_25C15EE30(v57, &v63);
            uint64_t v46 = v57[1];
            sub_25C15EEC4((uint64_t)&v63);
          }
          else
          {
            *(void *)unint64_t v45 = 0;
            *(void *)(v45 + 8) = 0;
            *(void *)(v45 + 16) = 0;
            sub_25C15EDB4((void *)v45, v34, v28, (v28 - (uint64_t)v34) >> 2);
            *(_DWORD *)(v45 + 24) = v43;
            uint64_t v46 = v45 + 32;
            v57[1] = v45 + 32;
          }
          v57[1] = v46;
          if (v34) {
            operator delete(v34);
          }
          ++v23;
        }
        while (v23 != v56);
      }
      *uint64_t v54 = 0;
    }
    sub_25C14D0BC(v59);
    sub_25C14DE9C(&v60);
  }
}

void sub_25C15ECEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  sub_25C139754((uint64_t)va);
  _Unwind_Resume(a1);
}

void *sub_25C15ED7C(unint64_t a1)
{
  if (a1 >> 59) {
    sub_25C1376B8();
  }
  return operator new(32 * a1);
}

void *sub_25C15EDB4(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    unsigned int v6 = result;
    uint64_t result = sub_25C13C2CC(result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_25C15EE14(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *sub_25C15EE30(uint64_t *result, void *a2)
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
      *(void *)(v6 - 32) = 0;
      *(void *)(v6 - 24) = 0;
      *(void *)(v6 - 16) = 0;
      *(_OWORD *)(v6 - 32) = *(_OWORD *)(v2 + v5 - 32);
      *(void *)(v6 - 16) = *(void *)(v2 + v5 - 16);
      *(void *)(v7 - 32) = 0;
      *(void *)(v7 - 24) = 0;
      *(void *)(v7 - 16) = 0;
      *(_DWORD *)(v6 - 8) = *(_DWORD *)(v2 + v5 - 8);
      v5 -= 32;
    }
    while (v2 + v5 != v3);
    v4 += v5;
  }
  a2[1] = v4;
  uint64_t v8 = *result;
  char *result = v4;
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

uint64_t sub_25C15EEC4(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  while (v2 != v3)
  {
    uint64_t v4 = *(void **)(v2 - 32);
    *(void *)(a1 + 16) = v2 - 32;
    if (v4)
    {
      *(void *)(v2 - 24) = v4;
      operator delete(v4);
      uint64_t v2 = *(void *)(a1 + 16);
    }
    else
    {
      v2 -= 32;
    }
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_25C15EF28(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X6>, void *a8@<X8>, float a9@<S0>)
{
  (*(void (**)(uint64_t))(*(void *)a1 + 56))(a1);
  if (!*a8)
  {
    *a8 = 0;
    if (!a7)
    {
      LODWORD(v51) = 13;
      uint64_t v47 = (void *)sub_25C139528((uint64_t)&v52);
      sub_25C136E68(v47, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiece/src/sentencepiece_processor.cc", 133);
      sub_25C136E68(&v52, (uint64_t)"(", 1);
      std::ostream::operator<<();
      sub_25C136E68(&v52, (uint64_t)") [", 3);
      sub_25C136E68(&v52, (uint64_t)"pieces", 6);
      sub_25C136E68(&v52, (uint64_t)"] ", 2);
      sub_25C136E68(&v52, (uint64_t)"output container is null", 24);
      sub_25C1396C0();
    }
    uint64_t v18 = *a7;
    uint64_t v19 = (void **)a7[1];
    while (v19 != (void **)v18)
    {
      v19 -= 4;
      uint64_t v51 = v19;
      sub_25C13C7D0(&v51);
    }
    a7[1] = v18;
    sub_25C14DE18((uint64_t)&v51, 0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void ***, float))(*(void *)a1 + 224))(a1, a2, a3, a4, a5, a6, &v51, a9);
    if (!*a8)
    {
      *a8 = 0;
      uint64_t v20 = (void **)*a7;
      uint64_t v21 = (void **)a7[1];
      uint64_t v22 = *a7;
      if (v21 != (void **)*a7)
      {
        do
        {
          v21 -= 4;
          uint64_t v56 = (long long **)v21;
          sub_25C13C7D0((void ***)&v56);
        }
        while (v21 != v20);
        uint64_t v22 = *a7;
      }
      uint64_t v23 = a7[2];
      a7[1] = (uint64_t)v20;
      int v24 = v54;
      uint64_t v25 = v54;
      if (v54 > (unint64_t)((v23 - v22) >> 5))
      {
        if (v54 < 0) {
          sub_25C137658();
        }
        uint64_t v60 = a7 + 2;
        uint64_t v56 = (long long **)sub_25C15ED7C(v54);
        unint64_t v57 = (char *)v20 + (void)v56 - v22;
        int v58 = v57;
        uint64_t v59 = (void **)&v56[4 * v26];
        sub_25C15EE30(a7, &v56);
        sub_25C15F5F4((uint64_t)&v56);
        int v24 = v54;
        uint64_t v25 = v54;
      }
      if (v55) {
        uint64_t v27 = (uint64_t *)(v55 + 8);
      }
      else {
        uint64_t v27 = 0;
      }
      if (v24)
      {
        uint64_t v28 = &v27[v25];
        do
        {
          uint64_t v29 = *v27;
          uint64_t v48 = 0;
          std::string __dst = 0;
          unint64_t v50 = 0;
          sub_25C159AD8((uint64_t *)&v48, *(int *)(v29 + 56));
          uint64_t v30 = *(void *)(v29 + 64);
          if (v30) {
            uint64_t v31 = v30 + 8;
          }
          else {
            uint64_t v31 = 0;
          }
          uint64_t v32 = *(int *)(v29 + 56);
          if (v32)
          {
            unint64_t v33 = (unint64_t)__dst;
            uint64_t v34 = 8 * v32;
            do
            {
              unint64_t v35 = *(void *)(*(void *)v31 + 48) & 0xFFFFFFFFFFFFFFFELL;
              if (v33 >= v50)
              {
                unint64_t v33 = sub_25C159B7C((uint64_t *)&v48, (long long *)v35);
              }
              else
              {
                if (*(char *)(v35 + 23) < 0)
                {
                  sub_25C1367DC((unsigned char *)v33, *(void **)v35, *(void *)(v35 + 8));
                }
                else
                {
                  long long v36 = *(_OWORD *)v35;
                  *(void *)(v33 + 16) = *(void *)(v35 + 16);
                  *(_OWORD *)unint64_t v33 = v36;
                }
                v33 += 24;
              }
              std::string __dst = (void *)v33;
              v31 += 8;
              v34 -= 8;
            }
            while (v34);
          }
          int v37 = *(_DWORD *)(v29 + 80);
          unint64_t v39 = a7[1];
          unint64_t v38 = a7[2];
          if (v39 >= v38)
          {
            uint64_t v41 = (uint64_t)(v39 - *a7) >> 5;
            if ((unint64_t)(v41 + 1) >> 59) {
              sub_25C137658();
            }
            uint64_t v42 = v38 - *a7;
            uint64_t v43 = v42 >> 4;
            if (v42 >> 4 <= (unint64_t)(v41 + 1)) {
              uint64_t v43 = v41 + 1;
            }
            if ((unint64_t)v42 >= 0x7FFFFFFFFFFFFFE0) {
              unint64_t v44 = 0x7FFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v44 = v43;
            }
            uint64_t v60 = a7 + 2;
            if (v44) {
              unint64_t v44 = (unint64_t)sub_25C15ED7C(v44);
            }
            else {
              uint64_t v45 = 0;
            }
            uint64_t v46 = (char *)(v44 + 32 * v41);
            uint64_t v56 = (long long **)v44;
            unint64_t v57 = v46;
            int v58 = v46;
            uint64_t v59 = (void **)(v44 + 32 * v45);
            *(void *)uint64_t v46 = 0;
            *((void *)v46 + 1) = 0;
            *((void *)v46 + 2) = 0;
            sub_25C15F4DC(v46, v48, (long long *)__dst, 0xAAAAAAAAAAAAAAABLL * (((unsigned char *)__dst - (unsigned char *)v48) >> 3));
            *((_DWORD *)v46 + 6) = v37;
            v58 += 32;
            sub_25C15EE30(a7, &v56);
            uint64_t v40 = a7[1];
            sub_25C15F5F4((uint64_t)&v56);
          }
          else
          {
            *(void *)unint64_t v39 = 0;
            *(void *)(v39 + 8) = 0;
            *(void *)(v39 + 16) = 0;
            sub_25C15F4DC((void *)v39, v48, (long long *)__dst, 0xAAAAAAAAAAAAAAABLL * (((unsigned char *)__dst - (unsigned char *)v48) >> 3));
            *(_DWORD *)(v39 + 24) = v37;
            uint64_t v40 = v39 + 32;
            a7[1] = v40;
          }
          a7[1] = v40;
          uint64_t v56 = &v48;
          sub_25C13C7D0((void ***)&v56);
          ++v27;
        }
        while (v27 != v28);
      }
      *a8 = 0;
    }
    sub_25C14D0BC(v52);
    sub_25C14DE9C(&v53);
  }
}

void sub_25C15F44C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  sub_25C139754((uint64_t)va);
  _Unwind_Resume(a1);
}

void *sub_25C15F4DC(void *result, long long *a2, long long *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    sub_25C13CA0C(result, a4);
    uint64_t v7 = v6[1];
    uint64_t v12 = v7;
    uint64_t v13 = v7;
    v10[0] = v6 + 2;
    v10[1] = &v12;
    v10[2] = &v13;
    char v11 = 0;
    if (a2 == a3)
    {
      uint64_t v8 = v7;
    }
    else
    {
      uint64_t v8 = v7;
      do
      {
        if (*((char *)a2 + 23) < 0)
        {
          sub_25C1367DC((unsigned char *)v8, *(void **)a2, *((void *)a2 + 1));
          uint64_t v8 = v13;
        }
        else
        {
          long long v9 = *a2;
          *(void *)(v8 + 16) = *((void *)a2 + 2);
          *(_OWORD *)uint64_t v8 = v9;
        }
        a2 = (long long *)((char *)a2 + 24);
        v8 += 24;
        uint64_t v13 = v8;
      }
      while (a2 != a3);
    }
    char v11 = 1;
    uint64_t result = (void *)sub_25C15F654((uint64_t)v10);
    v6[1] = v8;
  }
  return result;
}

void sub_25C15F5B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
}

uint64_t sub_25C15F5F4(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    uint64_t v4 = (void **)(i - 32);
    *(void *)(a1 + 16) = v4;
    uint64_t v6 = v4;
    sub_25C13C7D0(&v6);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t sub_25C15F654(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24))
  {
    uint64_t v3 = **(void **)(a1 + 16);
    uint64_t v4 = **(void **)(a1 + 8);
    while (v3 != v4)
    {
      if (*(char *)(v3 - 1) < 0) {
        operator delete(*(void **)(v3 - 24));
      }
      v3 -= 24;
    }
  }
  return a1;
}

uint64_t *sub_25C15F6B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X4>, void *a6@<X8>, float a7@<S0>)
{
  uint64_t result = (uint64_t *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 56))(a1);
  if (!*a6)
  {
    *a6 = 0;
    if (!a5)
    {
      LODWORD(v30) = 13;
      uint64_t v29 = (void *)sub_25C139528((uint64_t)&v31);
      sub_25C136E68(v29, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiece/src/sentencepiece_processor.cc", 133);
      sub_25C136E68(&v31, (uint64_t)"(", 1);
      std::ostream::operator<<();
      sub_25C136E68(&v31, (uint64_t)") [", 3);
      sub_25C136E68(&v31, (uint64_t)"ids", 3);
      sub_25C136E68(&v31, (uint64_t)"] ", 2);
      sub_25C136E68(&v31, (uint64_t)"output container is null", 24);
      sub_25C1396C0();
    }
    a5[1] = *a5;
    sub_25C14D188((uint64_t)&v30, 0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t *, float))(*(void *)a1 + 216))(a1, a2, a3, a4, &v30, a7);
    if (!*a6)
    {
      *a6 = 0;
      if (v33) {
        uint64_t v15 = v33 + 8;
      }
      else {
        uint64_t v15 = 0;
      }
      if (v32)
      {
        uint64_t v16 = v15 + 8 * v32;
        uint64_t v17 = (_DWORD *)a5[1];
        do
        {
          int v18 = *(_DWORD *)(*(void *)v15 + 64);
          unint64_t v19 = a5[2];
          if ((unint64_t)v17 >= v19)
          {
            uint64_t v21 = (_DWORD *)*a5;
            uint64_t v22 = ((uint64_t)v17 - *a5) >> 2;
            unint64_t v23 = v22 + 1;
            if ((unint64_t)(v22 + 1) >> 62) {
              sub_25C137658();
            }
            uint64_t v24 = v19 - (void)v21;
            if (v24 >> 1 > v23) {
              unint64_t v23 = v24 >> 1;
            }
            if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v25 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v25 = v23;
            }
            if (v25)
            {
              unint64_t v25 = (unint64_t)sub_25C13C324(v25);
              uint64_t v21 = (_DWORD *)*a5;
              uint64_t v17 = (_DWORD *)a5[1];
            }
            else
            {
              uint64_t v26 = 0;
            }
            uint64_t v27 = (_DWORD *)(v25 + 4 * v22);
            _DWORD *v27 = v18;
            uint64_t v20 = v27 + 1;
            while (v17 != v21)
            {
              int v28 = *--v17;
              *--uint64_t v27 = v28;
            }
            *a5 = v27;
            a5[1] = v20;
            a5[2] = v25 + 4 * v26;
            if (v21) {
              operator delete(v21);
            }
          }
          else
          {
            _DWORD *v17 = v18;
            uint64_t v20 = v17 + 1;
          }
          a5[1] = v20;
          v15 += 8;
          uint64_t v17 = v20;
        }
        while (v15 != v16);
      }
      *a6 = 0;
    }
    return sub_25C14DD48(&v30);
  }
  return result;
}

void sub_25C15FA28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t *sub_25C15FA58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X4>, void *a6@<X8>, float a7@<S0>)
{
  uint64_t result = (uint64_t *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 56))(a1);
  if (!*a6)
  {
    *a6 = 0;
    if (!a5)
    {
      LODWORD(v20) = 13;
      unint64_t v19 = (void *)sub_25C139528((uint64_t)&v21);
      sub_25C136E68(v19, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiece/src/sentencepiece_processor.cc", 133);
      sub_25C136E68(&v21, (uint64_t)"(", 1);
      std::ostream::operator<<();
      sub_25C136E68(&v21, (uint64_t)") [", 3);
      sub_25C136E68(&v21, (uint64_t)"pieces", 6);
      sub_25C136E68(&v21, (uint64_t)"] ", 2);
      sub_25C136E68(&v21, (uint64_t)"output container is null", 24);
      sub_25C1396C0();
    }
    sub_25C13C9BC(a5);
    sub_25C14D188((uint64_t)&v20, 0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t *, float))(*(void *)a1 + 216))(a1, a2, a3, a4, &v20, a7);
    if (!*a6)
    {
      *a6 = 0;
      if (v23) {
        uint64_t v15 = v23 + 8;
      }
      else {
        uint64_t v15 = 0;
      }
      if (v22)
      {
        unint64_t v16 = a5[1];
        uint64_t v17 = 8 * v22;
        do
        {
          int v18 = (long long *)(*(void *)(*(void *)v15 + 48) & 0xFFFFFFFFFFFFFFFELL);
          if (v16 >= a5[2])
          {
            unint64_t v16 = sub_25C159B7C(a5, v18);
          }
          else
          {
            sub_25C15FD70(a5, v18);
            v16 += 24;
          }
          a5[1] = v16;
          v15 += 8;
          v17 -= 8;
        }
        while (v17);
      }
      *a6 = 0;
    }
    return sub_25C14DD48(&v20);
  }
  return result;
}

void sub_25C15FD44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *sub_25C15FD70(void *result, long long *a2)
{
  uint64_t v2 = result;
  uint64_t v3 = result[1];
  if (*((char *)a2 + 23) < 0)
  {
    uint64_t result = sub_25C1367DC((unsigned char *)result[1], *(void **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    *(void *)(v3 + 16) = *((void *)a2 + 2);
    *(_OWORD *)uint64_t v3 = v4;
  }
  v2[1] = v3 + 24;
  return result;
}

void sub_25C15FDC8(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_25C15FDD0(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X4>, void *a6@<X8>)
{
  (*(void (**)(uint64_t))(*(void *)a1 + 56))(a1);
  if (!*a6)
  {
    *a6 = 0;
    if (!a5)
    {
      int v46 = 13;
      uint64_t v43 = (void *)sub_25C139528((uint64_t)&v47);
      sub_25C136E68(v43, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiece/src/sentencepiece_processor.cc", 133);
      sub_25C136E68(&v47, (uint64_t)"(", 1);
      std::ostream::operator<<();
      sub_25C136E68(&v47, (uint64_t)") [", 3);
      sub_25C136E68(&v47, (uint64_t)"ids", 3);
      sub_25C136E68(&v47, (uint64_t)"] ", 2);
      sub_25C136E68(&v47, (uint64_t)"output container is null", 24);
      sub_25C1396C0();
    }
    sub_25C159498(a5);
    sub_25C14DE18((uint64_t)&v46, 0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, int *))(*(void *)a1 + 208))(a1, a2, a3, a4, &v46);
    if (!*a6)
    {
      unint64_t v44 = a6;
      *a6 = 0;
      if (v50) {
        uint64_t v12 = v50 + 8;
      }
      else {
        uint64_t v12 = 0;
      }
      if (v49)
      {
        uint64_t v45 = v12 + 8 * v49;
        do
        {
          uint64_t v13 = *(void *)(*(void *)v12 + 64);
          if (v13) {
            uint64_t v14 = v13 + 8;
          }
          else {
            uint64_t v14 = 0;
          }
          uint64_t v15 = *(int *)(*(void *)v12 + 56);
          if (v15)
          {
            unint64_t v16 = 0;
            uint64_t v17 = 0;
            unint64_t v18 = 0;
            uint64_t v19 = v14 + 8 * v15;
            do
            {
              int v20 = *(_DWORD *)(*(void *)v14 + 64);
              if ((unint64_t)v17 >= v18)
              {
                uint64_t v22 = (v17 - v16) >> 2;
                unint64_t v23 = v22 + 1;
                if ((unint64_t)(v22 + 1) >> 62) {
                  sub_25C137658();
                }
                if ((uint64_t)(v18 - (void)v16) >> 1 > v23) {
                  unint64_t v23 = (uint64_t)(v18 - (void)v16) >> 1;
                }
                if (v18 - (unint64_t)v16 >= 0x7FFFFFFFFFFFFFFCLL) {
                  unint64_t v24 = 0x3FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v24 = v23;
                }
                if (v24) {
                  unint64_t v24 = (unint64_t)sub_25C13C324(v24);
                }
                else {
                  uint64_t v25 = 0;
                }
                uint64_t v26 = (char *)(v24 + 4 * v22);
                *(_DWORD *)uint64_t v26 = v20;
                uint64_t v21 = (uint64_t)(v26 + 4);
                while (v17 != v16)
                {
                  int v27 = *((_DWORD *)v17 - 1);
                  v17 -= 4;
                  *((_DWORD *)v26 - 1) = v27;
                  v26 -= 4;
                }
                unint64_t v18 = v24 + 4 * v25;
                if (v16) {
                  operator delete(v16);
                }
                unint64_t v16 = v26;
              }
              else
              {
                *(_DWORD *)uint64_t v17 = v20;
                uint64_t v21 = (uint64_t)(v17 + 4);
              }
              v14 += 8;
              uint64_t v17 = (char *)v21;
            }
            while (v14 != v19);
          }
          else
          {
            unint64_t v16 = 0;
            uint64_t v21 = 0;
          }
          uint64_t v29 = (void *)a5[1];
          unint64_t v28 = a5[2];
          if ((unint64_t)v29 >= v28)
          {
            unint64_t v31 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v29 - *a5) >> 3);
            unint64_t v32 = v31 + 1;
            if (v31 + 1 > 0xAAAAAAAAAAAAAAALL) {
              sub_25C137658();
            }
            unint64_t v33 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v28 - *a5) >> 3);
            if (2 * v33 > v32) {
              unint64_t v32 = 2 * v33;
            }
            if (v33 >= 0x555555555555555) {
              unint64_t v34 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v34 = v32;
            }
            int v54 = a5 + 2;
            if (v34)
            {
              if (v34 > 0xAAAAAAAAAAAAAAALL) {
                sub_25C1376B8();
              }
              unint64_t v35 = (char *)operator new(24 * v34);
            }
            else
            {
              unint64_t v35 = 0;
            }
            long long v36 = &v35[24 * v31];
            uint64_t v51 = v35;
            v52.i64[0] = (uint64_t)v36;
            v52.i64[1] = (uint64_t)v36;
            uint64_t v53 = &v35[24 * v34];
            *((void *)v36 + 1) = 0;
            *((void *)v36 + 2) = 0;
            *(void *)long long v36 = 0;
            sub_25C15EDB4(v36, v16, v21, (v21 - (uint64_t)v16) >> 2);
            uint64_t v37 = v52.i64[0];
            uint64_t v30 = v52.i64[1] + 24;
            v52.i64[1] += 24;
            uint64_t v39 = *a5;
            unint64_t v38 = (void *)a5[1];
            if (v38 == (void *)*a5)
            {
              int64x2_t v41 = vdupq_n_s64((unint64_t)v38);
            }
            else
            {
              do
              {
                *(void *)(v37 - 24) = 0;
                *(void *)(v37 - 16) = 0;
                v37 -= 24;
                *(void *)(v37 + 16) = 0;
                long long v40 = *(_OWORD *)(v38 - 3);
                v38 -= 3;
                *(_OWORD *)uint64_t v37 = v40;
                *(void *)(v37 + 16) = v38[2];
                *unint64_t v38 = 0;
                v38[1] = 0;
                v38[2] = 0;
              }
              while (v38 != (void *)v39);
              int64x2_t v41 = *(int64x2_t *)a5;
              uint64_t v30 = v52.i64[1];
            }
            *a5 = v37;
            a5[1] = v30;
            int64x2_t v52 = v41;
            uint64_t v42 = a5[2];
            a5[2] = (uint64_t)v53;
            uint64_t v53 = (char *)v42;
            uint64_t v51 = (char *)v41.i64[0];
            sub_25C160380((uint64_t)&v51);
          }
          else
          {
            *uint64_t v29 = 0;
            v29[1] = 0;
            v29[2] = 0;
            sub_25C15EDB4(v29, v16, v21, (v21 - (uint64_t)v16) >> 2);
            uint64_t v30 = (uint64_t)(v29 + 3);
            a5[1] = (uint64_t)(v29 + 3);
          }
          a5[1] = v30;
          if (v16) {
            operator delete(v16);
          }
          v12 += 8;
        }
        while (v12 != v45);
      }
      *unint64_t v44 = 0;
    }
    sub_25C14D0BC(v47);
    sub_25C14DE9C(&v48);
  }
}

void sub_25C1602F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  sub_25C14D0BC(a7);
  sub_25C14DE9C((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t sub_25C160380(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  while (v2 != v3)
  {
    long long v4 = *(void **)(v2 - 24);
    *(void *)(a1 + 16) = v2 - 24;
    if (v4)
    {
      *(void *)(v2 - 16) = v4;
      operator delete(v4);
      uint64_t v2 = *(void *)(a1 + 16);
    }
    else
    {
      v2 -= 24;
    }
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_25C1603E4(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void ***a5@<X4>, void *a6@<X8>)
{
  (*(void (**)(uint64_t))(*(void *)a1 + 56))(a1);
  if (!*a6)
  {
    *a6 = 0;
    if (!a5)
    {
      LODWORD(v43) = 13;
      uint64_t v39 = (void *)sub_25C139528((uint64_t)&v44);
      sub_25C136E68(v39, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiece/src/sentencepiece_processor.cc", 133);
      sub_25C136E68(&v44, (uint64_t)"(", 1);
      std::ostream::operator<<();
      sub_25C136E68(&v44, (uint64_t)") [", 3);
      sub_25C136E68(&v44, (uint64_t)"pieces", 6);
      sub_25C136E68(&v44, (uint64_t)"] ", 2);
      sub_25C136E68(&v44, (uint64_t)"output container is null", 24);
      sub_25C1396C0();
    }
    uint64_t v12 = *a5;
    uint64_t v13 = a5[1];
    while (v13 != v12)
    {
      v13 -= 3;
      uint64_t v43 = v13;
      sub_25C13C7D0(&v43);
    }
    a5[1] = v12;
    sub_25C14DE18((uint64_t)&v43, 0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void ***))(*(void *)a1 + 208))(a1, a2, a3, a4, &v43);
    if (!*a6)
    {
      *a6 = 0;
      if (v47) {
        uint64_t v14 = (uint64_t *)(v47 + 8);
      }
      else {
        uint64_t v14 = 0;
      }
      if (v46)
      {
        uint64_t v15 = &v14[v46];
        do
        {
          uint64_t v16 = *v14;
          long long v40 = 0;
          int64x2_t v41 = 0;
          unint64_t v42 = 0;
          uint64_t v17 = *(void *)(v16 + 64);
          if (v17) {
            uint64_t v18 = v17 + 8;
          }
          else {
            uint64_t v18 = 0;
          }
          uint64_t v19 = *(int *)(v16 + 56);
          if (v19)
          {
            unint64_t v20 = 0;
            uint64_t v21 = 8 * v19;
            do
            {
              unint64_t v22 = *(void *)(*(void *)v18 + 48) & 0xFFFFFFFFFFFFFFFELL;
              if (v20 >= v42)
              {
                unint64_t v20 = sub_25C159B7C((uint64_t *)&v40, (long long *)v22);
              }
              else
              {
                if (*(char *)(v22 + 23) < 0)
                {
                  sub_25C1367DC((unsigned char *)v20, *(void **)v22, *(void *)(v22 + 8));
                }
                else
                {
                  long long v23 = *(_OWORD *)v22;
                  *(void *)(v20 + 16) = *(void *)(v22 + 16);
                  *(_OWORD *)unint64_t v20 = v23;
                }
                v20 += 24;
              }
              int64x2_t v41 = (long long *)v20;
              v18 += 8;
              v21 -= 8;
            }
            while (v21);
          }
          else
          {
            unint64_t v20 = 0;
          }
          uint64_t v25 = a5[1];
          unint64_t v24 = (unint64_t)a5[2];
          if ((unint64_t)v25 >= v24)
          {
            unint64_t v27 = 0xAAAAAAAAAAAAAAABLL * (v25 - *a5);
            unint64_t v28 = v27 + 1;
            if (v27 + 1 > 0xAAAAAAAAAAAAAAALL) {
              sub_25C137658();
            }
            unint64_t v29 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v24 - (void)*a5) >> 3);
            if (2 * v29 > v28) {
              unint64_t v28 = 2 * v29;
            }
            if (v29 >= 0x555555555555555) {
              unint64_t v30 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v30 = v28;
            }
            uint64_t v51 = a5 + 2;
            if (v30)
            {
              if (v30 > 0xAAAAAAAAAAAAAAALL) {
                sub_25C1376B8();
              }
              unint64_t v31 = (void **)operator new(24 * v30);
            }
            else
            {
              unint64_t v31 = 0;
            }
            unint64_t v32 = &v31[3 * v27];
            uint64_t v48 = (long long **)v31;
            v49.i64[0] = (uint64_t)v32;
            v49.i64[1] = (uint64_t)v32;
            uint64_t v50 = &v31[3 * v30];
            v32[1] = 0;
            v32[2] = 0;
            *unint64_t v32 = 0;
            sub_25C15F4DC(v32, v40, (long long *)v20, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v20 - (void)v40) >> 3));
            uint64_t v33 = v49.i64[0];
            uint64_t v26 = v49.i64[1] + 24;
            v49.i64[1] += 24;
            unint64_t v35 = *a5;
            unint64_t v34 = a5[1];
            if (v34 == *a5)
            {
              int64x2_t v37 = vdupq_n_s64((unint64_t)v34);
            }
            else
            {
              do
              {
                *(void *)(v33 - 24) = 0;
                *(void *)(v33 - 16) = 0;
                v33 -= 24;
                *(void *)(v33 + 16) = 0;
                long long v36 = *(_OWORD *)(v34 - 3);
                v34 -= 3;
                *(_OWORD *)uint64_t v33 = v36;
                *(void *)(v33 + 16) = v34[2];
                *unint64_t v34 = 0;
                v34[1] = 0;
                v34[2] = 0;
              }
              while (v34 != v35);
              int64x2_t v37 = *(int64x2_t *)a5;
              uint64_t v26 = v49.i64[1];
            }
            *a5 = (void **)v33;
            a5[1] = (void **)v26;
            int64x2_t v49 = v37;
            unint64_t v38 = a5[2];
            a5[2] = v50;
            uint64_t v50 = v38;
            uint64_t v48 = (long long **)v37.i64[0];
            sub_25C160968((uint64_t)&v48);
          }
          else
          {
            *uint64_t v25 = 0;
            v25[1] = 0;
            v25[2] = 0;
            sub_25C15F4DC(v25, v40, v41, 0xAAAAAAAAAAAAAAABLL * (((char *)v41 - (char *)v40) >> 3));
            uint64_t v26 = (uint64_t)(v25 + 3);
            a5[1] = v25 + 3;
          }
          a5[1] = (void **)v26;
          uint64_t v48 = &v40;
          sub_25C13C7D0((void ***)&v48);
          ++v14;
        }
        while (v14 != v15);
      }
      *a6 = 0;
    }
    sub_25C14D0BC(v44);
    sub_25C14DE9C(&v45);
  }
}

void sub_25C1608D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  sub_25C14D0BC(a6);
  sub_25C14DE9C((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t sub_25C160968(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    long long v4 = (void **)(i - 24);
    *(void *)(a1 + 16) = v4;
    uint64_t v6 = v4;
    sub_25C13C7D0(&v6);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t *sub_25C1609C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t result = (uint64_t *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 56))(a1);
  if (!*a4)
  {
    *a4 = 0;
    if (!a3)
    {
      LODWORD(v10) = 13;
      long long v9 = (void *)sub_25C139528((uint64_t)v11);
      sub_25C136E68(v9, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiece/src/sentencepiece_processor.cc", 133);
      sub_25C136E68(v11, (uint64_t)"(", 1);
      std::ostream::operator<<();
      sub_25C136E68(v11, (uint64_t)") [", 3);
      sub_25C136E68(v11, (uint64_t)"detokenized", 11);
      sub_25C136E68(v11, (uint64_t)"] ", 2);
      sub_25C136E68(v11, (uint64_t)"output container is null", 24);
      sub_25C1396C0();
    }
    if (*(char *)(a3 + 23) < 0)
    {
      **(unsigned char **)a3 = 0;
      *(void *)(a3 + 8) = 0;
    }
    else
    {
      *(unsigned char *)a3 = 0;
      *(unsigned char *)(a3 + 23) = 0;
    }
    sub_25C14D188((uint64_t)&v10, 0);
    (*(void (**)(uint64_t, uint64_t, uint64_t *))(*(void *)a1 + 248))(a1, a2, &v10);
    if (!*a4)
    {
      *a4 = 0;
      std::string::operator=((std::string *)a3, (const std::string *)((unint64_t)v11[8] & 0xFFFFFFFFFFFFFFFELL));
      *a4 = 0;
    }
    return sub_25C14DD48(&v10);
  }
  return result;
}

void sub_25C160C50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t *sub_25C160C78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t result = (uint64_t *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 56))(a1);
  if (!*a4)
  {
    *a4 = 0;
    if (!a3)
    {
      LODWORD(v10) = 13;
      long long v9 = (void *)sub_25C139528((uint64_t)v11);
      sub_25C136E68(v9, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiece/src/sentencepiece_processor.cc", 133);
      sub_25C136E68(v11, (uint64_t)"(", 1);
      std::ostream::operator<<();
      sub_25C136E68(v11, (uint64_t)") [", 3);
      sub_25C136E68(v11, (uint64_t)"detokenized", 11);
      sub_25C136E68(v11, (uint64_t)"] ", 2);
      sub_25C136E68(v11, (uint64_t)"output container is null", 24);
      sub_25C1396C0();
    }
    if (*(char *)(a3 + 23) < 0)
    {
      **(unsigned char **)a3 = 0;
      *(void *)(a3 + 8) = 0;
    }
    else
    {
      *(unsigned char *)a3 = 0;
      *(unsigned char *)(a3 + 23) = 0;
    }
    sub_25C14D188((uint64_t)&v10, 0);
    (*(void (**)(uint64_t, uint64_t, uint64_t *))(*(void *)a1 + 240))(a1, a2, &v10);
    if (!*a4)
    {
      *a4 = 0;
      std::string::operator=((std::string *)a3, (const std::string *)((unint64_t)v11[8] & 0xFFFFFFFFFFFFFFFELL));
      *a4 = 0;
    }
    return sub_25C14DD48(&v10);
  }
  return result;
}

void sub_25C160F00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_25C160F28(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  sub_25C15B728(__p, a2);
  (*(void (**)(uint64_t, void **, uint64_t))(*(void *)a1 + 128))(a1, __p, a3);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

void sub_25C160FAC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *sub_25C160FC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, void *a5@<X8>)
{
  uint64_t result = (uint64_t *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 56))(a1);
  if (!*a5)
  {
    *a5 = 0;
    if (!a4)
    {
      LODWORD(v26) = 13;
      uint64_t v25 = (void *)sub_25C139528((uint64_t)&v27);
      sub_25C136E68(v25, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiece/src/sentencepiece_processor.cc", 133);
      sub_25C136E68(&v27, (uint64_t)"(", 1);
      std::ostream::operator<<();
      sub_25C136E68(&v27, (uint64_t)") [", 3);
      sub_25C136E68(&v27, (uint64_t)"ids", 3);
      sub_25C136E68(&v27, (uint64_t)"] ", 2);
      sub_25C136E68(&v27, (uint64_t)"output container is null", 24);
      sub_25C1396C0();
    }
    a4[1] = *a4;
    sub_25C14D188((uint64_t)&v26, 0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t *))(*(void *)a1 + 200))(a1, a2, a3, &v26);
    if (!*a5)
    {
      *a5 = 0;
      if (v29) {
        uint64_t v11 = v29 + 8;
      }
      else {
        uint64_t v11 = 0;
      }
      if (v28)
      {
        uint64_t v12 = v11 + 8 * v28;
        uint64_t v13 = (_DWORD *)a4[1];
        do
        {
          int v14 = *(_DWORD *)(*(void *)v11 + 64);
          unint64_t v15 = a4[2];
          if ((unint64_t)v13 >= v15)
          {
            uint64_t v17 = (_DWORD *)*a4;
            uint64_t v18 = ((uint64_t)v13 - *a4) >> 2;
            unint64_t v19 = v18 + 1;
            if ((unint64_t)(v18 + 1) >> 62) {
              sub_25C137658();
            }
            uint64_t v20 = v15 - (void)v17;
            if (v20 >> 1 > v19) {
              unint64_t v19 = v20 >> 1;
            }
            if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v21 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v21 = v19;
            }
            if (v21)
            {
              unint64_t v21 = (unint64_t)sub_25C13C324(v21);
              uint64_t v17 = (_DWORD *)*a4;
              uint64_t v13 = (_DWORD *)a4[1];
            }
            else
            {
              uint64_t v22 = 0;
            }
            long long v23 = (_DWORD *)(v21 + 4 * v18);
            *long long v23 = v14;
            uint64_t v16 = v23 + 1;
            while (v13 != v17)
            {
              int v24 = *--v13;
              *--long long v23 = v24;
            }
            *a4 = v23;
            a4[1] = v16;
            a4[2] = v21 + 4 * v22;
            if (v17) {
              operator delete(v17);
            }
          }
          else
          {
            *uint64_t v13 = v14;
            uint64_t v16 = v13 + 1;
          }
          a4[1] = v16;
          v11 += 8;
          uint64_t v13 = v16;
        }
        while (v11 != v12);
      }
      *a5 = 0;
    }
    return sub_25C14DD48(&v26);
  }
  return result;
}

void sub_25C161324(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t *sub_25C161354@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X3>, void *a5@<X8>)
{
  uint64_t result = (uint64_t *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 56))(a1);
  if (!*a5)
  {
    *a5 = 0;
    if (!a4)
    {
      LODWORD(v16) = 13;
      unint64_t v15 = (void *)sub_25C139528((uint64_t)&v17);
      sub_25C136E68(v15, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiece/src/sentencepiece_processor.cc", 133);
      sub_25C136E68(&v17, (uint64_t)"(", 1);
      std::ostream::operator<<();
      sub_25C136E68(&v17, (uint64_t)") [", 3);
      sub_25C136E68(&v17, (uint64_t)"pieces", 6);
      sub_25C136E68(&v17, (uint64_t)"] ", 2);
      sub_25C136E68(&v17, (uint64_t)"output container is null", 24);
      sub_25C1396C0();
    }
    sub_25C13C9BC(a4);
    sub_25C14D188((uint64_t)&v16, 0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t *))(*(void *)a1 + 200))(a1, a2, a3, &v16);
    if (!*a5)
    {
      *a5 = 0;
      if (v19) {
        uint64_t v11 = v19 + 8;
      }
      else {
        uint64_t v11 = 0;
      }
      if (v18)
      {
        unint64_t v12 = a4[1];
        uint64_t v13 = 8 * v18;
        do
        {
          int v14 = (long long *)(*(void *)(*(void *)v11 + 48) & 0xFFFFFFFFFFFFFFFELL);
          if (v12 >= a4[2])
          {
            unint64_t v12 = sub_25C159B7C(a4, v14);
          }
          else
          {
            sub_25C15FD70(a4, v14);
            v12 += 24;
          }
          a4[1] = v12;
          v11 += 8;
          v13 -= 8;
        }
        while (v13);
      }
      *a5 = 0;
    }
    return sub_25C14DD48(&v16);
  }
  return result;
}

void sub_25C161620(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_25C16164C()
{
}

void sub_25C16209C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char *a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30,int a31,__int16 a32,char a33,char a34,uint64_t a35,uint64_t *a36,uint64_t a37,void *a38,uint64_t a39)
{
  a36 = (uint64_t *)&a23;
  sub_25C13C7D0((void ***)&a36);
  a23 = &a26;
  sub_25C13C7D0((void ***)&a23);
  if (a34 < 0) {
    operator delete(__p);
  }
  if (a35) {
    (*(void (**)(uint64_t))(*(void *)a35 + 8))(a35);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_25C1621D4(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C2B8];
  uint64_t v3 = *MEMORY[0x263F8C2B8];
  *(void *)a1 = *MEMORY[0x263F8C2B8];
  uint64_t v4 = *(void *)(v2 + 72);
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 64);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = MEMORY[0x263F8C318] + 16;
  if (*(char *)(a1 + 111) < 0) {
    operator delete(*(void **)(a1 + 88));
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x26117F430](a1 + 128);
  return a1;
}

uint64_t sub_25C16230C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void *))(*a1 + 56))(a1);
  if (!*a2)
  {
    *a2 = 0;
    uint64_t v5 = a1[4];
    uint64_t v6 = *(void *)(v5 + 64);
    uint64_t v7 = *(int *)(v5 + 56);
    uint64_t v8 = (uint64_t *)(v6 + 8);
    if (!v6) {
      uint64_t v8 = 0;
    }
    if (v7)
    {
      uint64_t v9 = 8 * v7;
      do
      {
        uint64_t v10 = *v8;
        if (*(_DWORD *)(*v8 + 60) == 5)
        {
          *(_DWORD *)(v10 + 40) |= 4u;
          *(_DWORD *)(v10 + 60) = 1;
        }
        ++v8;
        v9 -= 8;
      }
      while (v9);
    }
    *a2 = 0;
  }
  return result;
}

void sub_25C1623B4(void *a1@<X0>, uint64_t *a2@<X1>, void *a3@<X8>)
{
  (*(void (**)(void *))(*a1 + 56))(a1);
  if (!*a3)
  {
    *a3 = 0;
    uint64_t v6 = a1[4];
    uint64_t v7 = &unk_26A5963E8;
    if (*(void *)(v6 + 72)) {
      uint64_t v7 = *(_DWORD **)(v6 + 72);
    }
    if ((v7[66] - 1) >= 2)
    {
      LODWORD(v42) = 13;
      uint64_t v20 = (void *)sub_25C139528((uint64_t)&v43);
      sub_25C136E68(v20, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiece/src/sentencepiece_processor.cc", 133);
      sub_25C136E68(&v43, (uint64_t)"(", 1);
      std::ostream::operator<<();
      sub_25C136E68(&v43, (uint64_t)") [", 3);
      sub_25C136E68(&v43, (uint64_t)"type == TrainerSpec::UNIGRAM || type == TrainerSpec::BPE", 56);
      sub_25C136E68(&v43, (uint64_t)"] ", 2);
      sub_25C136E68(&v43, (uint64_t)"Vocabulary constraint is only enabled in subword units.", 55);
      sub_25C1396C0();
    }
    uint64_t v8 = *a2;
    uint64_t v9 = a2[1];
    uint64_t v43 = 0;
    uint64_t v44 = 0;
    unint64_t v42 = &v43;
    uint64_t v39 = a3;
    if (v8 != v9)
    {
      for (uint64_t i = 0; ; uint64_t i = v43)
      {
        uint64_t v11 = &v43;
        if (v42 != &v43)
        {
          unint64_t v12 = i;
          uint64_t v13 = &v43;
          if (i)
          {
            do
            {
              uint64_t v11 = (uint64_t **)v12;
              unint64_t v12 = (uint64_t *)v12[1];
            }
            while (v12);
          }
          else
          {
            do
            {
              uint64_t v11 = (uint64_t **)v13[2];
              BOOL v14 = *v11 == (uint64_t *)v13;
              uint64_t v13 = v11;
            }
            while (v14);
          }
          unint64_t v15 = *(void **)v8;
          size_t v16 = *(void *)(v8 + 8);
          if (!sub_25C14999C(v11[4], (size_t)v11[5], *(void **)v8, v16)) {
            break;
          }
        }
        if (i)
        {
          uint64_t v45 = v11;
          uint64_t v17 = v11 + 1;
          goto LABEL_16;
        }
        uint64_t v45 = &v43;
        uint64_t v17 = &v43;
LABEL_19:
        int v18 = operator new(0x30uLL);
        v18[2] = *(_OWORD *)v8;
        uint64_t v19 = v45;
        *(void *)int v18 = 0;
        *((void *)v18 + 1) = 0;
        *((void *)v18 + 2) = v19;
        _DWORD *v17 = (uint64_t *)v18;
        if (*v42)
        {
          unint64_t v42 = (uint64_t **)*v42;
          int v18 = *v17;
        }
        sub_25C13C3AC(v43, (uint64_t *)v18);
        ++v44;
LABEL_22:
        v8 += 16;
        if (v8 == v9)
        {
          uint64_t v6 = a1[4];
          int64x2_t v41 = v43;
          goto LABEL_27;
        }
      }
      uint64_t v17 = (uint64_t **)sub_25C1498EC((uint64_t)&v42, &v45, v15, v16);
LABEL_16:
      if (*v17) {
        goto LABEL_22;
      }
      goto LABEL_19;
    }
    int64x2_t v41 = 0;
LABEL_27:
    int v21 = *(_DWORD *)(v6 + 56);
    if (v21 >= 1)
    {
      uint64_t v22 = 0;
      uint64_t v23 = *(void *)(v6 + 64);
      uint64_t v40 = v6;
      do
      {
        uint64_t v24 = *(void *)(v23 + 8 * v22 + 8);
        if ((*(_DWORD *)(v24 + 60) - 2) >= 3)
        {
          unint64_t v25 = *(void *)(v24 + 48) & 0xFFFFFFFFFFFFFFFELL;
          uint64_t v26 = *(unsigned __int8 *)(v25 + 23);
          if (*(char *)(v25 + 23) < 0)
          {
            uint64_t v27 = *(unsigned __int8 **)v25;
            size_t v28 = *(void *)(v25 + 8);
          }
          else
          {
            uint64_t v27 = (unsigned __int8 *)(*(void *)(v24 + 48) & 0xFFFFFFFFFFFFFFFELL);
            size_t v28 = *(unsigned __int8 *)(v25 + 23);
          }
          if (!v41) {
            goto LABEL_47;
          }
          uint64_t v29 = &v43;
          unint64_t v30 = v41;
          do
          {
            unint64_t v31 = v30;
            unint64_t v32 = v29;
            int v33 = sub_25C14999C((const void *)v30[4], v30[5], v27, v28);
            if (v33) {
              unint64_t v34 = (uint64_t **)(v31 + 1);
            }
            else {
              unint64_t v34 = (uint64_t **)v31;
            }
            if (v33) {
              uint64_t v29 = v32;
            }
            else {
              uint64_t v29 = (uint64_t **)v31;
            }
            unint64_t v30 = *v34;
          }
          while (v30);
          if (v29 == &v43
            || (!v33 ? (unint64_t v35 = (uint64_t **)v31) : (unint64_t v35 = v32),
                sub_25C14999C(v27, v28, v35[4], (size_t)v35[5])))
          {
LABEL_47:
            if ((v26 & 0x80) != 0)
            {
              long long v36 = *(unsigned __int8 **)v25;
              uint64_t v26 = *(void *)(v25 + 8);
            }
            else
            {
              long long v36 = (unsigned __int8 *)v25;
            }
            uint64_t v37 = v40;
            if (v26 == asc_25C171EB8[(unint64_t)*v36 >> 4]) {
              int v38 = 1;
            }
            else {
              int v38 = 5;
            }
          }
          else
          {
            int v38 = 1;
            uint64_t v37 = v40;
          }
          *(_DWORD *)(v24 + 40) |= 4u;
          *(_DWORD *)(v24 + 60) = v38;
          int v21 = *(_DWORD *)(v37 + 56);
        }
        ++v22;
      }
      while (v22 < v21);
    }
    *uint64_t v39 = 0;
    sub_25C13DEA0(v41);
  }
}

void sub_25C16283C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  sub_25C139754((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_25C162864(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, void *a4@<X8>)
{
}

void sub_25C16287C(void *a1, uint64_t *a2, uint64_t a3, unint64_t a4, char **a5)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  a5[1] = *a5;
  if (a4)
  {
    (*(void (**)(uint64_t *))(*a2 + 56))(a2);
    if (*a1) {
      return;
    }
    *a1 = 0;
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26A596330, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_26A596330))
    {
      v42[4] = xmmword_2654AE2C8;
      *(_OWORD *)long long __p = unk_2654AE2D8;
      long long v44 = xmmword_2654AE2E8;
      uint64_t v45 = 3;
      v42[0] = xmmword_2654AE288;
      v42[1] = unk_2654AE298;
      v42[2] = xmmword_2654AE2A8;
      _OWORD v42[3] = *(_OWORD *)&off_2654AE2B8;
      sub_25C163138((uint64_t)v42, 5);
      __cxa_atexit((void (*)(void *))sub_25C163314, &qword_26A596318, &dword_25C135000);
      __cxa_guard_release(&qword_26A596330);
    }
    sub_25C13C544(&v40, a3, a4, ":", 1);
    uint64_t v10 = (uint64_t *)v40;
    uint64_t v11 = v41;
    if (v40 != v41)
    {
      do
      {
        uint64_t v12 = qword_26A596320;
        if (!qword_26A596320) {
          goto LABEL_40;
        }
        uint64_t v13 = (void *)*v10;
        size_t v14 = v10[1];
        unint64_t v15 = &qword_26A596320;
        do
        {
          int v16 = sub_25C14999C(*(const void **)(v12 + 32), *(void *)(v12 + 40), v13, v14);
          uint64_t v17 = (uint64_t *)(v12 + 8);
          if (!v16)
          {
            uint64_t v17 = (uint64_t *)v12;
            unint64_t v15 = (uint64_t *)v12;
          }
          uint64_t v12 = *v17;
        }
        while (*v17);
        if (v15 == &qword_26A596320 || (sub_25C14999C(v13, v14, (void *)v15[4], v15[5]) & 1) != 0)
        {
LABEL_40:
          LODWORD(v42[0]) = 13;
          sub_25C139528((uint64_t)v42 + 8);
          sub_25C136E68((void *)v42 + 1, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiece/src/sentencepiece_processor.cc", 133);
          sub_25C136E68((void *)v42 + 1, (uint64_t)"(", 1);
          std::ostream::operator<<();
          sub_25C136E68((void *)v42 + 1, (uint64_t)") [", 3);
          sub_25C136E68((void *)v42 + 1, (uint64_t)"it != extra_option_map.end()", 28);
          sub_25C136E68((void *)v42 + 1, (uint64_t)"] ", 2);
          sub_25C136E68((void *)v42 + 1, (uint64_t)"option \"", 8);
          sub_25C136E68((void *)v42 + 1, *v10, v10[1]);
          sub_25C136E68((void *)v42 + 1, (uint64_t)"\" is not available.", 19);
          sub_25C1396C0();
        }
        uint64_t v19 = a5[1];
        unint64_t v18 = (unint64_t)a5[2];
        if ((unint64_t)v19 >= v18)
        {
          int v21 = *a5;
          uint64_t v22 = (v19 - *a5) >> 2;
          unint64_t v23 = v22 + 1;
          if ((unint64_t)(v22 + 1) >> 62) {
            sub_25C137658();
          }
          uint64_t v24 = v18 - (void)v21;
          if (v24 >> 1 > v23) {
            unint64_t v23 = v24 >> 1;
          }
          if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v25 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v25 = v23;
          }
          if (v25)
          {
            if (v25 >> 62) {
              sub_25C1376B8();
            }
            uint64_t v26 = (char *)operator new(4 * v25);
          }
          else
          {
            uint64_t v26 = 0;
          }
          uint64_t v27 = &v26[4 * v22];
          *(_DWORD *)uint64_t v27 = *((_DWORD *)v15 + 12);
          uint64_t v20 = v27 + 4;
          while (v19 != v21)
          {
            int v28 = *((_DWORD *)v19 - 1);
            v19 -= 4;
            *((_DWORD *)v27 - 1) = v28;
            v27 -= 4;
          }
          *a5 = v27;
          a5[1] = v20;
          a5[2] = &v26[4 * v25];
          if (v21) {
            operator delete(v21);
          }
        }
        else
        {
          *(_DWORD *)uint64_t v19 = *((_DWORD *)v15 + 12);
          uint64_t v20 = v19 + 4;
        }
        a5[1] = v20;
        int v29 = *((_DWORD *)v15 + 12);
        if (v29 == 1)
        {
          unint64_t v30 = sub_25C148148(a2[1]);
          size_t v31 = strlen(v30);
          uint64_t v32 = (*(uint64_t (**)(uint64_t *, char *, size_t))(*a2 + 472))(a2, v30, v31);
          if ((*(uint64_t (**)(uint64_t *, uint64_t))(*a2 + 496))(a2, v32))
          {
            LODWORD(v42[0]) = 13;
            sub_25C139528((uint64_t)v42 + 8);
            sub_25C136E68((void *)v42 + 1, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiece/src/sentencepiece_processor.cc", 133);
            sub_25C136E68((void *)v42 + 1, (uint64_t)"(", 1);
            std::ostream::operator<<();
            sub_25C136E68((void *)v42 + 1, (uint64_t)") [", 3);
            sub_25C136E68((void *)v42 + 1, (uint64_t)"!IsUnknown(PieceToId(absl::string_view(model_->bos_piece().data())))", 68);
            sub_25C136E68((void *)v42 + 1, (uint64_t)"] ", 2);
            long long v36 = sub_25C148148(a2[1]);
            sub_25C136E68((void *)v42 + 1, (uint64_t)v36, v37);
            sub_25C1396C0();
          }
          int v29 = *((_DWORD *)v15 + 12);
        }
        if (v29 == 2)
        {
          int v33 = sub_25C14822C(a2[1]);
          size_t v34 = strlen(v33);
          uint64_t v35 = (*(uint64_t (**)(uint64_t *, char *, size_t))(*a2 + 472))(a2, v33, v34);
          if ((*(uint64_t (**)(uint64_t *, uint64_t))(*a2 + 496))(a2, v35))
          {
            LODWORD(v42[0]) = 13;
            sub_25C139528((uint64_t)v42 + 8);
            sub_25C136E68((void *)v42 + 1, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiece/src/sentencepiece_processor.cc", 133);
            sub_25C136E68((void *)v42 + 1, (uint64_t)"(", 1);
            std::ostream::operator<<();
            sub_25C136E68((void *)v42 + 1, (uint64_t)") [", 3);
            sub_25C136E68((void *)v42 + 1, (uint64_t)"!IsUnknown(PieceToId(absl::string_view(model_->eos_piece().data())))", 68);
            sub_25C136E68((void *)v42 + 1, (uint64_t)"] ", 2);
            int v38 = sub_25C14822C(a2[1]);
            sub_25C136E68((void *)v42 + 1, (uint64_t)v38, v39);
            sub_25C1396C0();
          }
        }
        v10 += 2;
      }
      while (v10 != v11);
      uint64_t v10 = (uint64_t *)v40;
    }
    if (v10)
    {
      int64x2_t v41 = v10;
      operator delete(v10);
    }
  }
  *a1 = 0;
}

void sub_25C1630B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, char a13)
{
}

uint64_t sub_25C163138(uint64_t result, uint64_t a2)
{
  qword_26A596328 = 0;
  qword_26A596320 = 0;
  qword_26A596318 = (uint64_t)&qword_26A596320;
  if (a2)
  {
    uint64_t v2 = result;
    uint64_t v3 = 0;
    uint64_t v4 = result + 24 * a2;
    for (uint64_t i = &qword_26A596320; i != &qword_26A596320; uint64_t i = (uint64_t *)qword_26A596318)
    {
      uint64_t v6 = (uint64_t *)v3;
      if (v3)
      {
        do
        {
          uint64_t v7 = v6;
          uint64_t v6 = (uint64_t *)v6[1];
        }
        while (v6);
      }
      else
      {
        uint64_t v8 = &qword_26A596320;
        do
        {
          uint64_t v7 = (uint64_t *)v8[2];
          BOOL v9 = *v7 == (void)v8;
          uint64_t v8 = v7;
        }
        while (v9);
      }
      uint64_t v10 = *(void **)v2;
      size_t v11 = *(void *)(v2 + 8);
      uint64_t result = sub_25C14999C((const void *)v7[4], v7[5], *(void **)v2, v11);
      if (result) {
        goto LABEL_11;
      }
      if (!v3) {
        goto LABEL_22;
      }
      uint64_t v13 = (uint64_t *)v3;
      while (1)
      {
        while (1)
        {
          uint64_t v7 = v13;
          size_t v14 = (void *)v13[4];
          size_t v15 = v13[5];
          if (!sub_25C14999C(v10, v11, v14, v15)) {
            break;
          }
          uint64_t v13 = (uint64_t *)*v7;
          uint64_t v12 = v7;
          if (!*v7) {
            goto LABEL_23;
          }
        }
        uint64_t result = sub_25C14999C(v14, v15, v10, v11);
        if (!result) {
          break;
        }
        uint64_t v12 = v7 + 1;
        uint64_t v13 = (uint64_t *)v7[1];
        if (!v13) {
          goto LABEL_23;
        }
      }
LABEL_26:
      v2 += 24;
      if (v2 == v4) {
        return result;
      }
    }
    uint64_t v7 = &qword_26A596320;
LABEL_11:
    if (v3)
    {
      uint64_t v12 = v7 + 1;
      if (v7[1]) {
        goto LABEL_26;
      }
    }
    else
    {
LABEL_22:
      uint64_t v7 = &qword_26A596320;
      uint64_t v12 = &qword_26A596320;
    }
LABEL_23:
    int v16 = operator new(0x38uLL);
    long long v17 = *(_OWORD *)v2;
    v16[6] = *(void *)(v2 + 16);
    *((_OWORD *)v16 + 2) = v17;
    *int v16 = 0;
    v16[1] = 0;
    v16[2] = v7;
    *uint64_t v12 = (uint64_t)v16;
    if (*(void *)qword_26A596318)
    {
      qword_26A596318 = *(void *)qword_26A596318;
      int v16 = (void *)*v12;
    }
    uint64_t result = (uint64_t)sub_25C13C3AC((uint64_t *)qword_26A596320, v16);
    uint64_t v3 = qword_26A596320;
    ++qword_26A596328;
    goto LABEL_26;
  }
  return result;
}

void sub_25C1632E8(_Unwind_Exception *a1)
{
  sub_25C13DEA0(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_25C163314(uint64_t a1)
{
  return a1;
}

void sub_25C16334C(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, void *a4@<X8>)
{
}

uint64_t sub_25C163364@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 8);
  if (!v4)
  {
    int v8 = 13;
    uint64_t v6 = (void *)sub_25C139528((uint64_t)&v9);
    sub_25C136E68(v6, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiece/src/sentencepiece_processor.cc", 133);
    sub_25C136E68(&v9, (uint64_t)"(", 1);
    std::ostream::operator<<();
    sub_25C136E68(&v9, (uint64_t)") [", 3);
    sub_25C136E68(&v9, (uint64_t)"model_", 6);
    sub_25C136E68(&v9, (uint64_t)"] ", 2);
    sub_25C136E68(&v9, (uint64_t)"Model is not initialized.", 25);
    sub_25C1396C0();
  }
  if (!*(void *)(a1 + 16))
  {
    int v8 = 13;
    uint64_t v7 = (void *)sub_25C139528((uint64_t)&v9);
    sub_25C136E68(v7, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IntelligencePlatformSentencePiece/SentencePiece/libsentencepiece/src/sentencepiece_processor.cc", 133);
    sub_25C136E68(&v9, (uint64_t)"(", 1);
    std::ostream::operator<<();
    sub_25C136E68(&v9, (uint64_t)") [", 3);
    sub_25C136E68(&v9, (uint64_t)"normalizer_", 11);
    sub_25C136E68(&v9, (uint64_t)"] ", 2);
    sub_25C136E68(&v9, (uint64_t)"Normalizer is not initialized.", 30);
    sub_25C1396C0();
  }
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 16))(v4);
  if (!*a2)
  {
    *a2 = 0;
    uint64_t result = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 24))(*(void *)(a1 + 16));
    if (!*a2) {
      *a2 = 0;
    }
  }
  return result;
}

void sub_25C163650(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_25C163670()
{
}

void sub_25C1638B0(_Unwind_Exception *a1)
{
  sub_25C163960((uint64_t *)(v1 - 56), 0);
  _Unwind_Resume(a1);
}

void sub_25C1638F4()
{
}

void sub_25C16393C(_Unwind_Exception *a1)
{
  MEMORY[0x26117F4A0](v1, 0x10A1C401E679671);
  _Unwind_Resume(a1);
}

uint64_t sub_25C163960(uint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    sub_25C156668(result);
    JUMPOUT(0x26117F4A0);
  }
  return result;
}

void sub_25C1639B0(uint64_t a1, uint64_t *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a2;
  *a2 = 0;
  sub_25C163960((uint64_t *)(a1 + 32), v3);
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(void *)(v4 + 72)) {
    uint64_t v5 = *(_DWORD **)(v4 + 72);
  }
  else {
    uint64_t v5 = &unk_26A5963E8;
  }
  switch(v5[66])
  {
    case 1:
      operator new();
    case 2:
      operator new();
    case 3:
      operator new();
    case 4:
      operator new();
    default:
      v13.__r_.__value_.__s.__data_[0] = 0;
      uint64_t v6 = sub_25C136E68(MEMORY[0x263F8C0F8], (uint64_t)"model_factory.cc", 16);
      sub_25C136E68(v6, (uint64_t)"(", 1);
      uint64_t v7 = (void *)std::ostream::operator<<();
      int v8 = sub_25C136E68(v7, (uint64_t)") ", 2);
      uint64_t v9 = sub_25C136E68(v8, (uint64_t)"LOG(", 4);
      uint64_t v10 = sub_25C136E68(v9, (uint64_t)"ERROR", 5);
      size_t v11 = sub_25C136E68(v10, (uint64_t)") ", 2);
      sub_25C136E68(v11, (uint64_t)"Unknown model_type: ", 20);
      std::ostream::operator<<();
      sub_25C137184(&v13);
      uint64_t v12 = *(void *)(a1 + 8);
      *(void *)(a1 + 8) = 0;
      if (v12) {
        (*(void (**)(uint64_t))(*(void *)v12 + 8))(v12);
      }
      operator new();
  }
}

void sub_25C164AD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, char a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,int a35,__int16 a36,char a37,char a38,uint64_t a39,uint64_t a40,int a41,__int16 a42,char a43,char a44,void *a45,uint64_t a46,int a47,__int16 a48,char a49,char a50,void *a51,uint64_t a52,int a53,__int16 a54,char a55,char a56)
{
  uint64_t v62 = *(void *)(v60 - 144);
  *(void *)(v60 - 144) = 0;
  if (v62) {
    sub_25C13D850(v62);
  }
  if (__p)
  {
    operator delete(__p);
    if (!v59)
    {
LABEL_5:
      if (!v58)
      {
LABEL_10:
        if (v57) {
          operator delete(v57);
        }
        uint64_t v63 = v56[16];
        v56[16] = 0;
        if (v63) {
          (*(void (**)(uint64_t))(*(void *)v63 + 8))(v63);
        }
        uint64_t v64 = sub_25C147FF4(v56);
        MEMORY[0x26117F4A0](v64, 0x10E1C40AECB0B9ELL);
        _Unwind_Resume(a1);
      }
LABEL_9:
      operator delete(v58);
      goto LABEL_10;
    }
  }
  else if (!v59)
  {
    goto LABEL_5;
  }
  operator delete(v59);
  if (!v58) {
    goto LABEL_10;
  }
  goto LABEL_9;
}

void sub_25C164D98()
{
}

void sub_25C164E50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

void sub_25C164E7C(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 16))(&v12);
  if (v12)
  {
    char v11 = 1;
    uint64_t v1 = sub_25C136E68(MEMORY[0x263F8C0F8], (uint64_t)"sentencepiece_processor.cc", 26);
    sub_25C136E68(v1, (uint64_t)"(", 1);
    uint64_t v2 = (void *)std::ostream::operator<<();
    sub_25C136E68(v2, (uint64_t)") [", 3);
    sub_25C136E68(v2, (uint64_t)"_status.ok()", 12);
    sub_25C136E68(v2, (uint64_t)"] ", 2);
    if (v12)
    {
      memset(&v10, 0, sizeof(v10));
      unsigned int v3 = *(_DWORD *)v12 - 1;
      if (v3 < 0x10) {
        MEMORY[0x26117F1D0](&v10, (&off_2654AE208)[v3]);
      }
      std::string::append(&v10, ": ");
      int v4 = *(char *)(v12 + 31);
      if (v4 >= 0) {
        uint64_t v5 = (const std::string::value_type *)(v12 + 8);
      }
      else {
        uint64_t v5 = *(const std::string::value_type **)(v12 + 8);
      }
      if (v4 >= 0) {
        std::string::size_type v6 = *(unsigned __int8 *)(v12 + 31);
      }
      else {
        std::string::size_type v6 = *(void *)(v12 + 16);
      }
      std::string::append(&v10, v5, v6);
    }
    else
    {
      sub_25C13C824(&v10, "OK");
    }
    if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v7 = &v10;
    }
    else {
      uint64_t v7 = (std::string *)v10.__r_.__value_.__r.__words[0];
    }
    if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(v10.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = v10.__r_.__value_.__l.__size_;
    }
    sub_25C136E68(v2, (uint64_t)v7, size);
    if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v10.__r_.__value_.__l.__data_);
    }
    sub_25C137184(&v11);
    uint64_t v9 = v12;
    uint64_t v12 = 0;
    if (v9) {
      sub_25C13D850(v9);
    }
  }
}

void sub_25C165010(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  sub_25C137184((unsigned char *)(v15 - 25));
  uint64_t v17 = *(void *)(v15 - 24);
  *(void *)(v15 - 24) = 0;
  if (v17) {
    sub_25C13D850(v17);
  }
  _Unwind_Resume(a1);
}

void sub_25C165054()
{
}

void sub_25C165438(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  if (*(char *)(v3 - 73) < 0) {
    operator delete(*(void **)(v3 - 96));
  }
  (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  sub_25C163960((uint64_t *)va, 0);
  _Unwind_Resume(a1);
}

void sub_25C1654D0(void *a1)
{
  sub_25C165508(a1);

  JUMPOUT(0x26117F4A0);
}

void *sub_25C165508(void *a1)
{
  *a1 = &unk_270989898;
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
  sub_25C163960(a1 + 4, 0);
  uint64_t v4 = a1[3];
  a1[3] = 0;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  uint64_t v5 = a1[2];
  a1[2] = 0;
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
  }
  uint64_t v6 = a1[1];
  a1[1] = 0;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  return a1;
}

void sub_25C1658A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *__p,uint64_t a28)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_25C165BDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30,int a31,__int16 a32,char a33,char a34)
{
  a12 = &a26;
  sub_25C13C7D0((void ***)&a12);

  _Unwind_Resume(a1);
}

void sub_25C165DE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, char *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  a9 = &a16;
  sub_25C13C7D0((void ***)&a9);
  if (a24 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_25C165FA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (__p) {
    operator delete(__p);
  }
  if (a19 < 0) {
    operator delete(a14);
  }

  _Unwind_Resume(a1);
}

void sub_25C1661C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

uint64_t sub_25C166200(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void sub_25C166224(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_27098A180;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x26117F4A0);
}

void sub_25C166278(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_27098A180;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_25C166298(uint64_t a1)
{
  sub_25C1662D0(a1);

  JUMPOUT(0x26117F4A0);
}

uint64_t sub_25C1662D0(uint64_t a1)
{
  *(void *)a1 = &unk_270989F00;
  sub_25C16634C((void *)(a1 + 96));
  uint64_t v4 = (void **)(a1 + 72);
  sub_25C159444(&v4);
  uint64_t v4 = (void **)(a1 + 48);
  sub_25C159444(&v4);
  uint64_t v2 = *(void **)(a1 + 24);
  if (v2)
  {
    *(void *)(a1 + 32) = v2;
    operator delete(v2);
  }
  return a1;
}

void *sub_25C16634C(void *a1)
{
  *a1 = &unk_270989DE8;
  uint64_t v2 = (void *)a1[1];
  uint64_t v3 = (void *)a1[2];
  if (v2 != v3)
  {
    do
    {
      if (*v2) {
        MEMORY[0x26117F470](*v2, 0x1070C8005A2B047);
      }
      ++v2;
    }
    while (v2 != v3);
    uint64_t v2 = (void *)a1[1];
  }
  if (v2)
  {
    a1[2] = v2;
    operator delete(v2);
  }
  return a1;
}

void sub_25C1663E8(void *a1)
{
  sub_25C16634C(a1);

  JUMPOUT(0x26117F4A0);
}

BOOL sub_25C166428(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5)
{
  strcpy(__s, " ");
  size_t v10 = strlen(__s);
  sub_25C13C544(&__p, a2, a3, (unsigned __int8 *)__s, v10);
  uint64_t v50 = 0;
  uint64_t v51 = 0;
  int64x2_t v49 = 0;
  sub_25C16683C(&v49, __p, (uint64_t)v48, (v48 - (unsigned char *)__p) >> 4);
  char v11 = v49;
  uint64_t v12 = v50;
  if (v49 == v50)
  {
    float v14 = 0.0;
    if (v49) {
LABEL_11:
    }
      operator delete(v11);
  }
  else
  {
    float v13 = *(float *)(a1 + 120) + -10.0;
    float v14 = 0.0;
    uint64_t v15 = v49;
    do
    {
      uint64_t v16 = v15[1];
      int v17 = (*(uint64_t (**)(uint64_t, void, uint64_t))(*(void *)a1 + 112))(a1, *v15, v16);
      if (v17 == *(_DWORD *)(a1 + 104))
      {
        float v14 = v13 + v14;
      }
      else
      {
        uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 8) + 64) + 8 * v17 + 8);
        if (*(_DWORD *)(v18 + 60) == 4) {
          double v19 = (float)(*(float *)(a1 + 124) * (float)(int)v16) + -0.1;
        }
        else {
          double v19 = *(float *)(v18 + 56);
        }
        float v14 = v19 + v14;
      }
      v15 += 2;
    }
    while (v15 != v12);
    if (v11) {
      goto LABEL_11;
    }
  }
  if (__p)
  {
    uint64_t v48 = __p;
    operator delete(__p);
  }
  strcpy(__s, " ");
  size_t v20 = strlen(__s);
  sub_25C13C544(&__p, a4, a5, (unsigned __int8 *)__s, v20);
  uint64_t v45 = 0;
  uint64_t v46 = 0;
  long long v44 = 0;
  sub_25C16683C(&v44, __p, (uint64_t)v48, (v48 - (unsigned char *)__p) >> 4);
  int v21 = v44;
  uint64_t v22 = v45;
  if (v44 != v45)
  {
    float v23 = *(float *)(a1 + 120) + -10.0;
    float v24 = 0.0;
    unint64_t v25 = v44;
    do
    {
      uint64_t v26 = v25[1];
      int v27 = (*(uint64_t (**)(uint64_t, void, uint64_t))(*(void *)a1 + 112))(a1, *v25, v26);
      if (v27 == *(_DWORD *)(a1 + 104))
      {
        float v24 = v23 + v24;
      }
      else
      {
        uint64_t v28 = *(void *)(*(void *)(*(void *)(a1 + 8) + 64) + 8 * v27 + 8);
        if (*(_DWORD *)(v28 + 60) == 4) {
          double v29 = (float)(*(float *)(a1 + 124) * (float)(int)v26) + -0.1;
        }
        else {
          double v29 = *(float *)(v28 + 56);
        }
        float v24 = v29 + v24;
      }
      v25 += 2;
    }
    while (v25 != v22);
    if (!v21) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  float v24 = 0.0;
  if (v44) {
LABEL_24:
  }
    operator delete(v21);
LABEL_25:
  if (__p)
  {
    uint64_t v48 = __p;
    operator delete(__p);
  }
  float v30 = vabds_f32(v14, v24);
  if (v30 > 0.0000001)
  {
    LOBYTE(__p) = 0;
    size_t v31 = sub_25C136E68(MEMORY[0x263F8C0F8], (uint64_t)"unigram_model.cc", 16);
    sub_25C136E68(v31, (uint64_t)"(", 1);
    uint64_t v32 = (void *)std::ostream::operator<<();
    int v33 = sub_25C136E68(v32, (uint64_t)") ", 2);
    size_t v34 = sub_25C136E68(v33, (uint64_t)"LOG(", 4);
    uint64_t v35 = sub_25C136E68(v34, (uint64_t)"WARNING", 7);
    long long v36 = sub_25C136E68(v35, (uint64_t)") ", 2);
    uint64_t v37 = sub_25C136E68(v36, (uint64_t)"Two sentence piece sequences are not equivalent! Left: ", 55);
    int v38 = sub_25C136E68(v37, a2, a3);
    sub_25C136E68(v38, (uint64_t)", Score: ", 9);
    uint64_t v39 = (void *)std::ostream::operator<<();
    uint64_t v40 = sub_25C136E68(v39, (uint64_t)". Right: ", 9);
    int64x2_t v41 = sub_25C136E68(v40, a4, a5);
    sub_25C136E68(v41, (uint64_t)", Score: ", 9);
    unint64_t v42 = (void *)std::ostream::operator<<();
    sub_25C136E68(v42, (uint64_t)".", 1);
    sub_25C137184(&__p);
  }
  return v30 <= 0.0000001;
}

void sub_25C1667F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_25C16683C(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    uint64_t result = sub_25C15B81C(result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_25C16689C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_25C1668B8(uint64_t a1, uint64_t *a2, unint64_t a3)
{
  unint64_t v3 = a3;
  uint64_t v4 = a2;
  uint64_t v6 = sub_25C1391F4((void *)(a1 + 64), a2, a3);
  if (v6) {
    return *((unsigned int *)v6 + 8);
  }
  size_t v8 = *(unsigned int **)(*(void *)(a1 + 128) + 16);
  unsigned int v9 = *v8;
  if (v3)
  {
    uint64_t v10 = 0;
    while (1)
    {
      int v11 = *(unsigned __int8 *)v4;
      uint64_t v4 = (uint64_t *)((char *)v4 + 1);
      v10 ^= (v9 >> 10 << ((v9 >> 6) & 8)) ^ v11;
      unsigned int v9 = v8[v10];
      if ((v9 & 0x800000FF) != v11) {
        return *(unsigned int *)(a1 + 104);
      }
      if (!--v3) {
        goto LABEL_12;
      }
    }
  }
  int v12 = *(unsigned __int8 *)v4;
  if (*(unsigned char *)v4)
  {
    uint64_t v10 = 0;
    float v13 = (unsigned __int8 *)v4 + 1;
    while (1)
    {
      v10 ^= (v9 >> 10 << ((v9 >> 6) & 8)) ^ v12;
      unsigned int v9 = v8[v10];
      if ((v9 & 0x800000FF) != v12) {
        break;
      }
      int v14 = *v13++;
      int v12 = v14;
      if (!v14)
      {
LABEL_12:
        if ((v9 & 0x100) != 0) {
          return v8[v10 ^ (v9 >> 10 << ((v9 >> 6) & 8))] & 0x7FFFFFFF;
        }
        return *(unsigned int *)(a1 + 104);
      }
    }
    return *(unsigned int *)(a1 + 104);
  }
  uint64_t v10 = 0;
  if ((v9 & 0x100) == 0) {
    return *(unsigned int *)(a1 + 104);
  }
  return v8[v10 ^ (v9 >> 10 << ((v9 >> 6) & 8))] & 0x7FFFFFFF;
}

uint64_t sub_25C1669B8()
{
  return 1;
}

uint64_t sub_25C1669C0()
{
  return 1;
}

uint64_t sub_25C1669C8()
{
  return 1;
}

uint64_t sub_25C1669D0()
{
  return 1;
}

float sub_25C1669D8(uint64_t a1, unsigned __int8 *a2, uint64_t a3, float a4)
{
  uint64_t v28 = &unk_270989F00;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v34 = 0;
  uint64_t v35 = &unk_270989DE8;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v38 = 0;
  uint64_t v39 = 1024;
  sub_25C166C30((uint64_t)&v28, a2, a3);
  sub_25C1670B4(a1, &v28);
  long long v6 = v30;
  LODWORD(v40[0]) = 0;
  sub_25C15D59C(v41, *((void *)&v37 + 1) + v38 * v39, v40);
  sub_25C167448((uint64_t *)v40, &v28, a4);
  uint64_t v7 = 0;
  unsigned int v25 = (((*((void *)&v6 + 1) - (void)v6) >> 3) - 1) & ~((int)(((*((void *)&v6 + 1) - (void)v6) >> 3) - 1) >> 31);
  uint64_t v27 = *((void *)&v31 + 1);
  uint64_t v26 = v33;
  do
  {
    size_t v8 = (uint64_t *)(v27 + 24 * v7);
    uint64_t v9 = *v8;
    uint64_t v10 = v8[1];
    if (*v8 != v10)
    {
      int v11 = (uint64_t **)(v26 + 24 * v7);
      int v12 = *v11;
      float v13 = v11[1];
      int v14 = (float *)v40[0];
      uint64_t v15 = v41[0];
      do
      {
        if (v12 != v13)
        {
          uint64_t v16 = *(unsigned int *)(*(void *)v9 + 24);
          float v17 = *(float *)(v15 + 4 * v16);
          uint64_t v18 = v12;
          do
          {
            uint64_t v19 = *v18++;
            uint64_t v20 = *(unsigned int *)(v19 + 24);
            float v21 = (float)(v14[v20] + (float)(a4 * *(float *)(v19 + 32))) - v14[v16];
            float v17 = v17 + (float)(expf(v21) * (float)(v21 + *(float *)(v15 + 4 * v20)));
            *(float *)(v15 + 4 * v16) = v17;
          }
          while (v18 != v13);
        }
        v9 += 8;
      }
      while (v9 != v10);
    }
    ++v7;
  }
  while (v7 != v25 + 1);
  uint64_t v22 = (void *)v41[0];
  float v23 = *(float *)(v41[0] + 4 * *(unsigned int *)(**(void **)(v27 + 24 * v25) + 24));
  if (!v40[0] || (v40[1] = v40[0], operator delete(v40[0]), (uint64_t v22 = (void *)v41[0]) != 0))
  {
    v41[1] = v22;
    operator delete(v22);
  }
  sub_25C1662D0((uint64_t)&v28);
  return -v23;
}

void sub_25C166C04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  uint64_t v7 = *(void **)(v5 - 144);
  if (v7)
  {
    *(void *)(v5 - 136) = v7;
    operator delete(v7);
  }
  sub_25C1662D0((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_25C166C30(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  long long v6 = (void *)(a1 + 48);
  sub_25C159498((uint64_t *)(a1 + 48));
  sub_25C159498((uint64_t *)(a1 + 72));
  size_t v8 = (char **)(a1 + 24);
  uint64_t v7 = *(void *)(a1 + 24);
  *(void *)(a1 + 8) = "";
  *(void *)(a1 + 32) = v7;
  int v9 = *(_DWORD *)(a1 + 136);
  if (v9 + 1 < (int)((*(void *)(a1 + 112) - *(void *)(a1 + 104)) >> 3)) {
    int v10 = v9 + 1;
  }
  else {
    int v10 = (*(void *)(a1 + 112) - *(void *)(a1 + 104)) >> 3;
  }
  if (v10 >= 1)
  {
    uint64_t v11 = 0;
    uint64_t v12 = 8 * v10;
    do
    {
      bzero(*(void **)(*(void *)(a1 + 104) + v11), 48 * *(void *)(a1 + 144));
      v11 += 8;
    }
    while (v12 != v11);
  }
  *(void *)(a1 + 128) = 0;
  *(void *)(a1 + 136) = 0;
  *(void *)(a1 + 8) = a2;
  *(void *)(a1 + 16) = a3;
  sub_25C14ABBC((void **)(a1 + 24), a3 + 1);
  if (a3)
  {
    float v13 = *(void **)(a1 + 32);
    do
    {
      if ((int)a3 >= asc_25C171EB8[(unint64_t)*a2 >> 4]) {
        int v14 = asc_25C171EB8[(unint64_t)*a2 >> 4];
      }
      else {
        int v14 = a3;
      }
      unint64_t v15 = *(void *)(a1 + 40);
      if ((unint64_t)v13 >= v15)
      {
        uint64_t v16 = ((char *)v13 - *v8) >> 3;
        if ((unint64_t)(v16 + 1) >> 61) {
          goto LABEL_82;
        }
        uint64_t v17 = v15 - (void)*v8;
        uint64_t v18 = v17 >> 2;
        if (v17 >> 2 <= (unint64_t)(v16 + 1)) {
          uint64_t v18 = v16 + 1;
        }
        if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v19 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v19 = v18;
        }
        if (v19) {
          unint64_t v19 = (unint64_t)sub_25C13C374(v19);
        }
        else {
          uint64_t v20 = 0;
        }
        float v21 = (void *)(v19 + 8 * v16);
        *float v21 = a2;
        float v13 = v21 + 1;
        float v23 = *(char **)(a1 + 24);
        uint64_t v22 = *(char **)(a1 + 32);
        if (v22 != v23)
        {
          do
          {
            uint64_t v24 = *((void *)v22 - 1);
            v22 -= 8;
            *--float v21 = v24;
          }
          while (v22 != v23);
          uint64_t v22 = *v8;
        }
        *(void *)(a1 + 24) = v21;
        *(void *)(a1 + 32) = v13;
        *(void *)(a1 + 4sub_25C163960(&a9, 0) = v19 + 8 * v20;
        if (v22) {
          operator delete(v22);
        }
      }
      else
      {
        *v13++ = a2;
      }
      *(void *)(a1 + 32) = v13;
      a2 += v14;
      a3 -= v14;
    }
    while (a3);
  }
  else
  {
    float v13 = *(void **)(a1 + 32);
  }
  unint64_t v25 = *(void *)(a1 + 40);
  if ((unint64_t)v13 >= v25)
  {
    uint64_t v27 = ((char *)v13 - *v8) >> 3;
    if ((unint64_t)(v27 + 1) >> 61) {
LABEL_82:
    }
      sub_25C137658();
    uint64_t v28 = v25 - (void)*v8;
    uint64_t v29 = v28 >> 2;
    if (v28 >> 2 <= (unint64_t)(v27 + 1)) {
      uint64_t v29 = v27 + 1;
    }
    if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v30 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v30 = v29;
    }
    if (v30) {
      unint64_t v30 = (unint64_t)sub_25C13C374(v30);
    }
    else {
      uint64_t v31 = 0;
    }
    long long v32 = (void *)(v30 + 8 * v27);
    unint64_t v33 = v30 + 8 * v31;
    *long long v32 = a2;
    uint64_t v26 = v32 + 1;
    uint64_t v35 = *(char **)(a1 + 24);
    uint64_t v34 = *(char **)(a1 + 32);
    if (v34 != v35)
    {
      do
      {
        uint64_t v36 = *((void *)v34 - 1);
        v34 -= 8;
        *--long long v32 = v36;
      }
      while (v34 != v35);
      uint64_t v34 = *v8;
    }
    *(void *)(a1 + 24) = v32;
    *(void *)(a1 + 32) = v26;
    *(void *)(a1 + 4sub_25C163960(&a9, 0) = v33;
    if (v34) {
      operator delete(v34);
    }
  }
  else
  {
    *float v13 = a2;
    uint64_t v26 = v13 + 1;
  }
  *(void *)(a1 + 32) = v26;
  int v37 = (((unint64_t)v26 - *(void *)(a1 + 24)) >> 3) - 1;
  unsigned int v38 = v37 & ~(v37 >> 31);
  sub_25C16795C((uint64_t)v6, v38 + 1);
  sub_25C16795C(a1 + 72, v38 + 1);
  uint64_t v39 = 0;
  do
  {
    sub_25C167B5C(*v6 + v39);
    sub_25C167B5C(*(void *)(a1 + 72) + v39);
    v39 += 24;
  }
  while (24 * v38 + 24 != v39);
  uint64_t v40 = (_DWORD *)sub_25C1677E0((void *)(a1 + 96));
  int64x2_t v41 = v40;
  v40[6] = *(_DWORD *)(a1 + 128) + *(_DWORD *)(a1 + 136) * *(_DWORD *)(a1 + 144) - 1;
  v40[7] = -1;
  v40[4] = 0;
  unint64_t v42 = *(void ***)(a1 + 72);
  long long v44 = v42[1];
  unint64_t v43 = (unint64_t)v42[2];
  if ((unint64_t)v44 >= v43)
  {
    uint64_t v46 = ((char *)v44 - (unsigned char *)*v42) >> 3;
    if ((unint64_t)(v46 + 1) >> 61) {
      goto LABEL_83;
    }
    uint64_t v47 = v43 - (void)*v42;
    uint64_t v48 = v47 >> 2;
    if (v47 >> 2 <= (unint64_t)(v46 + 1)) {
      uint64_t v48 = v46 + 1;
    }
    if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v49 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v49 = v48;
    }
    if (v49) {
      unint64_t v49 = (unint64_t)sub_25C13C374(v49);
    }
    else {
      uint64_t v50 = 0;
    }
    uint64_t v51 = (void *)(v49 + 8 * v46);
    unint64_t v52 = v49 + 8 * v50;
    void *v51 = v41;
    uint64_t v45 = v51 + 1;
    int v54 = (char *)*v42;
    uint64_t v53 = (char *)v42[1];
    if (v53 != *v42)
    {
      do
      {
        uint64_t v55 = *((void *)v53 - 1);
        v53 -= 8;
        *--uint64_t v51 = v55;
      }
      while (v53 != v54);
      uint64_t v53 = (char *)*v42;
    }
    *unint64_t v42 = v51;
    v42[1] = v45;
    v42[2] = (void *)v52;
    if (v53) {
      operator delete(v53);
    }
  }
  else
  {
    *long long v44 = v40;
    uint64_t v45 = v44 + 1;
  }
  v42[1] = v45;
  uint64_t v56 = (_DWORD *)sub_25C1677E0((void *)(a1 + 96));
  unint64_t v57 = v56;
  v56[6] = *(_DWORD *)(a1 + 128) + *(_DWORD *)(a1 + 136) * *(_DWORD *)(a1 + 144) - 1;
  v56[7] = -1;
  v56[4] = v38;
  int v58 = (void **)(*(void *)(a1 + 48) + 24 * v38);
  uint64_t v59 = v58 + 1;
  uint64_t v60 = v58[1];
  unint64_t v61 = (unint64_t)v58[2];
  if ((unint64_t)v60 < v61)
  {
    void *v60 = v56;
    uint64_t v62 = v60 + 1;
    goto LABEL_81;
  }
  uint64_t v63 = ((char *)v60 - (unsigned char *)*v58) >> 3;
  if ((unint64_t)(v63 + 1) >> 61) {
LABEL_83:
  }
    sub_25C137658();
  uint64_t v64 = v61 - (void)*v58;
  uint64_t v65 = v64 >> 2;
  if (v64 >> 2 <= (unint64_t)(v63 + 1)) {
    uint64_t v65 = v63 + 1;
  }
  if ((unint64_t)v64 >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v66 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v66 = v65;
  }
  if (v66) {
    unint64_t v66 = (unint64_t)sub_25C13C374(v66);
  }
  else {
    uint64_t v67 = 0;
  }
  int v68 = (void *)(v66 + 8 * v63);
  unint64_t v69 = v66 + 8 * v67;
  *int v68 = v57;
  uint64_t v62 = v68 + 1;
  uint64_t v70 = (char *)*v59;
  unint64_t v71 = (char *)*v58;
  if (*v59 != *v58)
  {
    do
    {
      uint64_t v72 = *((void *)v70 - 1);
      v70 -= 8;
      *--int v68 = v72;
    }
    while (v70 != v71);
    uint64_t v70 = (char *)*v58;
  }
  void *v58 = v68;
  void *v59 = v62;
  v58[2] = (void *)v69;
  if (v70) {
    operator delete(v70);
  }
LABEL_81:
  void *v59 = v62;
}

void sub_25C1670B4(uint64_t a1, void *a2)
{
  float v4 = *(float *)(a1 + 120);
  uint64_t v5 = ((a2[4] - a2[3]) >> 3) - 1;
  uint64_t v6 = a2[1];
  uint64_t v7 = a2[2];
  sub_25C13A4E4(&__p, *(int *)(a1 + 136) + 1);
  if ((int)v5 < 1) {
    goto LABEL_40;
  }
  uint64_t v8 = 0;
  float v9 = v4 + -10.0;
  uint64_t v42 = v6 + (int)v7;
  do
  {
    int v10 = *(unsigned char **)(a2[3] + 8 * v8);
    uint64_t v11 = (char *)__p;
    unint64_t v12 = (v45 - (unsigned char *)__p) >> 4;
    float v13 = *(_DWORD **)(*(void *)(a1 + 128) + 16);
    uint64_t v14 = (*v13 >> 10 << ((*v13 >> 6) & 8));
    if ((v42 - (void)v10) << 32)
    {
      uint64_t v15 = 0;
      unint64_t v16 = 0;
      do
      {
        uint64_t v17 = v10[v15];
        uint64_t v18 = v14 ^ v17;
        unsigned int v19 = v13[v18];
        if ((v19 & 0x800000FF) != v17) {
          break;
        }
        uint64_t v14 = v18 ^ (v19 >> 10 << ((v19 >> 6) & 8));
        if ((v19 & 0x100) != 0)
        {
          if (v16 < v12)
          {
            uint64_t v20 = &v11[16 * v16];
            *(_DWORD *)uint64_t v20 = v13[v14] & 0x7FFFFFFF;
            *((void *)v20 + 1) = v15 + 1;
          }
          ++v16;
        }
        ++v15;
      }
      while (v42 - v10 != v15);
    }
    else
    {
      unsigned int v21 = *v10;
      if (*v10)
      {
        unint64_t v16 = 0;
        uint64_t v22 = 1;
        do
        {
          uint64_t v23 = v14 ^ v21;
          unsigned int v24 = v13[v23];
          if ((v24 & 0x800000FF) != v21) {
            break;
          }
          uint64_t v14 = v23 ^ (v24 >> 10 << ((v24 >> 6) & 8));
          if ((v24 & 0x100) != 0)
          {
            if (v16 < v12)
            {
              unint64_t v25 = &v11[16 * v16];
              *(_DWORD *)unint64_t v25 = v13[v14] & 0x7FFFFFFF;
              *((void *)v25 + 1) = v22;
            }
            ++v16;
          }
          unsigned int v21 = v10[v22++];
        }
        while (v21);
      }
      else
      {
        unint64_t v16 = 0;
      }
    }
    if (v16 >= v12)
    {
      char v43 = 1;
      uint64_t v26 = sub_25C136E68(MEMORY[0x263F8C0F8], (uint64_t)"unigram_model.cc", 16);
      sub_25C136E68(v26, (uint64_t)"(", 1);
      uint64_t v27 = (void *)std::ostream::operator<<();
      uint64_t v28 = sub_25C136E68(v27, (uint64_t)") [", 3);
      uint64_t v29 = sub_25C136E68(v28, (uint64_t)"(num_nodes) < (trie_results.size())", 35);
      sub_25C136E68(v29, (uint64_t)"] ", 2);
      sub_25C137184(&v43);
    }
    if (!v16)
    {
LABEL_38:
      uint64_t v41 = sub_25C1675CC((uint64_t)a2, v8, 1);
      *(_DWORD *)(v41 + 28) = *(_DWORD *)(a1 + 104);
      *(float *)(v41 + 32) = v9;
      goto LABEL_39;
    }
    uint64_t v30 = 0;
    BOOL v31 = 0;
    do
    {
      while (1)
      {
        uint64_t v32 = v8;
        do
        {
          int v33 = v32;
          unint64_t v34 = *(void *)(a2[3] + 8 * v32++);
        }
        while (v34 < (unint64_t)&v10[*((void *)__p + 2 * v30 + 1)]);
        int v35 = *((_DWORD *)__p + 4 * v30);
        if (*(_DWORD *)(*(void *)(*(void *)(*(void *)(a1 + 8) + 64) + 8 * v35 + 8) + 60) == 5) {
          break;
        }
        int v36 = v33 - v8;
        uint64_t v37 = sub_25C1675CC((uint64_t)a2, v8, v33 - (int)v8);
        *(_DWORD *)(v37 + 28) = v35;
        uint64_t v38 = *(void *)(*(void *)(*(void *)(a1 + 8) + 64) + 8 * v35 + 8);
        if (*(_DWORD *)(v38 + 60) == 4) {
          double v39 = (float)(*(float *)(a1 + 124) * (float)v36) + -0.1;
        }
        else {
          double v39 = *(float *)(v38 + 56);
        }
        float v40 = v39;
        *(float *)(v37 + 32) = v40;
        if (!v31)
        {
          BOOL v31 = *(_DWORD *)(v37 + 20) == 1;
          break;
        }
        ++v30;
        BOOL v31 = 1;
        if (v30 == v16) {
          goto LABEL_39;
        }
      }
      ++v30;
    }
    while (v30 != v16);
    if (!v31) {
      goto LABEL_38;
    }
LABEL_39:
    ++v8;
  }
  while (v8 != v5);
LABEL_40:
  if (__p)
  {
    uint64_t v45 = __p;
    operator delete(__p);
  }
}

void sub_25C167418(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_25C167448(uint64_t *a1, void *a2, float a3)
{
  int v5 = ((a2[4] - a2[3]) >> 3) - 1;
  int v6 = v5 & ~(v5 >> 31);
  unint64_t v7 = a2[16] + a2[17] * a2[18];
  int v28 = 0;
  sub_25C15D59C(a1, v7, &v28);
  uint64_t v8 = 0;
  uint64_t v27 = a2[6];
  unint64_t v25 = a2;
  uint64_t v26 = (v6 + 1);
  do
  {
    float v9 = (uint64_t *)(v27 + 24 * v8);
    uint64_t v10 = *v9;
    uint64_t v11 = v9[1];
    if (*v9 != v11)
    {
      uint64_t v12 = v25[9] + 24 * v8;
      uint64_t v14 = *(void **)v12;
      float v13 = *(void **)(v12 + 8);
      uint64_t v15 = *a1;
      do
      {
        if (v14 != v13)
        {
          uint64_t v16 = *(unsigned int *)(*(void *)v10 + 24);
          uint64_t v17 = *v14;
          float v18 = *(float *)(v15 + 4 * v16);
          unsigned int v19 = v14;
          do
          {
            float v20 = *(float *)(v15 + 4 * *(unsigned int *)(*v19 + 24)) + (float)(a3 * *(float *)(*v19 + 32));
            if (*v19 != v17)
            {
              if (v20 >= v18) {
                float v21 = v18;
              }
              else {
                float v21 = *(float *)(v15 + 4 * *(unsigned int *)(*v19 + 24)) + (float)(a3 * *(float *)(*v19 + 32));
              }
              if (v18 >= v20) {
                float v20 = v18;
              }
              if (v20 <= (float)(v21 + 50.0))
              {
                double v22 = v20;
                long double v23 = exp((float)(v21 - v20));
                float v20 = log(v23 + 1.0) + v22;
              }
            }
            *(float *)(v15 + 4 * v16) = v20;
            ++v19;
            float v18 = v20;
          }
          while (v19 != v13);
        }
        v10 += 8;
      }
      while (v10 != v11);
    }
    ++v8;
  }
  while (v8 != v26);
}

uint64_t sub_25C1675CC(uint64_t a1, int a2, int a3)
{
  uint64_t v6 = sub_25C1677E0((void *)(a1 + 96));
  uint64_t v7 = v6;
  int v8 = *(_DWORD *)(a1 + 128) + *(_DWORD *)(a1 + 136) * *(_DWORD *)(a1 + 144) - 1;
  *(_DWORD *)(v6 + 2sub_25C163960(&a9, 0) = a3;
  *(_DWORD *)(v6 + 24) = v8;
  *(_DWORD *)(v6 + 16) = a2;
  uint64_t v9 = *(void *)(a1 + 24);
  uint64_t v10 = *(void *)(v9 + 8 * (a3 + a2));
  uint64_t v11 = *(void *)(v9 + 8 * a2);
  *(void *)uint64_t v6 = v11;
  *(void *)(v6 + 8) = (int)v10 - (int)v11;
  uint64_t v12 = (void **)(*(void *)(a1 + 48) + 24 * a2);
  float v13 = v12 + 1;
  uint64_t v14 = (uint64_t *)v12[1];
  unint64_t v15 = (unint64_t)v12[2];
  if ((unint64_t)v14 >= v15)
  {
    uint64_t v17 = ((char *)v14 - (unsigned char *)*v12) >> 3;
    if ((unint64_t)(v17 + 1) >> 61) {
      goto LABEL_34;
    }
    uint64_t v18 = v15 - (void)*v12;
    uint64_t v19 = v18 >> 2;
    if (v18 >> 2 <= (unint64_t)(v17 + 1)) {
      uint64_t v19 = v17 + 1;
    }
    if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v20 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v20 = v19;
    }
    if (v20) {
      unint64_t v20 = (unint64_t)sub_25C13C374(v20);
    }
    else {
      uint64_t v21 = 0;
    }
    double v22 = (uint64_t *)(v20 + 8 * v17);
    unint64_t v23 = v20 + 8 * v21;
    *double v22 = v7;
    uint64_t v16 = v22 + 1;
    unsigned int v24 = (char *)*v13;
    unint64_t v25 = (char *)*v12;
    if (*v13 != *v12)
    {
      do
      {
        uint64_t v26 = *((void *)v24 - 1);
        v24 -= 8;
        *--double v22 = v26;
      }
      while (v24 != v25);
      unsigned int v24 = (char *)*v12;
    }
    *uint64_t v12 = v22;
    *float v13 = v16;
    v12[2] = (void *)v23;
    if (v24) {
      operator delete(v24);
    }
  }
  else
  {
    *uint64_t v14 = v6;
    uint64_t v16 = v14 + 1;
  }
  *float v13 = v16;
  uint64_t v27 = (void **)(*(void *)(a1 + 72) + 24 * (*(_DWORD *)(v7 + 20) + a2));
  int v28 = v27 + 1;
  uint64_t v29 = (uint64_t *)v27[1];
  unint64_t v30 = (unint64_t)v27[2];
  if ((unint64_t)v29 < v30)
  {
    *uint64_t v29 = v7;
    BOOL v31 = v29 + 1;
    goto LABEL_33;
  }
  uint64_t v32 = ((char *)v29 - (unsigned char *)*v27) >> 3;
  if ((unint64_t)(v32 + 1) >> 61) {
LABEL_34:
  }
    sub_25C137658();
  uint64_t v33 = v30 - (void)*v27;
  uint64_t v34 = v33 >> 2;
  if (v33 >> 2 <= (unint64_t)(v32 + 1)) {
    uint64_t v34 = v32 + 1;
  }
  if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v35 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v35 = v34;
  }
  if (v35) {
    unint64_t v35 = (unint64_t)sub_25C13C374(v35);
  }
  else {
    uint64_t v36 = 0;
  }
  uint64_t v37 = (uint64_t *)(v35 + 8 * v32);
  unint64_t v38 = v35 + 8 * v36;
  uint64_t *v37 = v7;
  BOOL v31 = v37 + 1;
  double v39 = (char *)*v28;
  float v40 = (char *)*v27;
  if (*v28 != *v27)
  {
    do
    {
      uint64_t v41 = *((void *)v39 - 1);
      v39 -= 8;
      *--uint64_t v37 = v41;
    }
    while (v39 != v40);
    double v39 = (char *)*v27;
  }
  void *v27 = v37;
  *int v28 = v31;
  _OWORD v27[2] = (void *)v38;
  if (v39) {
    operator delete(v39);
  }
LABEL_33:
  *int v28 = v31;
  return v7;
}

uint64_t sub_25C1677E0(void *a1)
{
  uint64_t v2 = a1[5];
  unint64_t v3 = a1[6];
  unint64_t v4 = a1[4];
  if (v4 >= v3)
  {
    unint64_t v4 = 0;
    ++v2;
    a1[4] = 0;
    a1[5] = v2;
  }
  uint64_t v5 = a1[1];
  if (v2 == (a1[2] - v5) >> 3)
  {
    is_mul_ok(v3, 0x30uLL);
    operator new[]();
  }
  uint64_t result = *(void *)(v5 + 8 * v2) + 48 * v4;
  a1[4] = v4 + 1;
  return result;
}

void sub_25C16795C(uint64_t a1, unint64_t a2)
{
  unint64_t v3 = *(void **)a1;
  unint64_t v4 = *(void **)(a1 + 8);
  unint64_t v5 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v4 - *(void *)a1) >> 3);
  unint64_t v6 = a2 - v5;
  if (a2 > v5)
  {
    uint64_t v7 = *(void *)(a1 + 16);
    if (0xAAAAAAAAAAAAAAABLL * ((v7 - (uint64_t)v4) >> 3) >= v6)
    {
      size_t v28 = 24 * ((24 * v6 - 24) / 0x18) + 24;
      bzero(*(void **)(a1 + 8), v28);
      *(void *)(a1 + 8) = (char *)v4 + v28;
      return;
    }
    if (a2 > 0xAAAAAAAAAAAAAAALL) {
      sub_25C137658();
    }
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((v7 - (uint64_t)v3) >> 3);
    uint64_t v9 = 2 * v8;
    if (2 * v8 <= a2) {
      uint64_t v9 = a2;
    }
    if (v8 >= 0x555555555555555) {
      unint64_t v10 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v10 = v9;
    }
    uint64_t v11 = (char *)sub_25C137670(v10);
    uint64_t v12 = &v11[24 * v5];
    uint64_t v14 = &v11[24 * v13];
    size_t v15 = 24 * ((24 * v6 - 24) / 0x18) + 24;
    bzero(v12, v15);
    uint64_t v16 = &v12[v15];
    uint64_t v18 = *(void **)a1;
    uint64_t v17 = *(void **)(a1 + 8);
    if (v17 == *(void **)a1)
    {
      *(void *)a1 = v12;
      *(void *)(a1 + 8) = v16;
      *(void *)(a1 + 16) = v14;
      if (!v17) {
        return;
      }
    }
    else
    {
      do
      {
        *((void *)v12 - 3) = 0;
        *((void *)v12 - 2) = 0;
        v12 -= 24;
        *((void *)v12 + 2) = 0;
        long long v19 = *(_OWORD *)(v17 - 3);
        v17 -= 3;
        *(_OWORD *)uint64_t v12 = v19;
        *((void *)v12 + 2) = v17[2];
        void *v17 = 0;
        v17[1] = 0;
        v17[2] = 0;
      }
      while (v17 != v18);
      unint64_t v20 = *(void **)a1;
      uint64_t v17 = *(void **)(a1 + 8);
      *(void *)a1 = v12;
      *(void *)(a1 + 8) = v16;
      *(void *)(a1 + 16) = v14;
      if (v17 != v20)
      {
        uint64_t v21 = v17;
        do
        {
          unint64_t v23 = (void *)*(v21 - 3);
          v21 -= 3;
          double v22 = v23;
          if (v23)
          {
            *(v17 - 2) = v22;
            operator delete(v22);
          }
          uint64_t v17 = v21;
        }
        while (v21 != v20);
        uint64_t v17 = v20;
      }
      if (!v17) {
        return;
      }
    }
    operator delete(v17);
    return;
  }
  if (a2 < v5)
  {
    unsigned int v24 = &v3[3 * a2];
    if (v4 != v24)
    {
      unint64_t v25 = *(void **)(a1 + 8);
      do
      {
        uint64_t v27 = (void *)*(v25 - 3);
        v25 -= 3;
        uint64_t v26 = v27;
        if (v27)
        {
          *(v4 - 2) = v26;
          operator delete(v26);
        }
        unint64_t v4 = v25;
      }
      while (v25 != v24);
    }
    *(void *)(a1 + 8) = v24;
  }
}

void sub_25C167B5C(uint64_t a1)
{
  uint64_t v1 = *(unsigned char **)a1;
  if (*(void *)(a1 + 16) - *(void *)a1 <= 0x7FuLL)
  {
    unint64_t v3 = *(unsigned char **)(a1 + 8);
    unint64_t v4 = (char *)operator new(0x80uLL);
    unint64_t v5 = &v4[(v3 - v1) & 0xFFFFFFFFFFFFFFF8];
    unint64_t v6 = v5;
    if (v3 != v1)
    {
      unint64_t v6 = &v4[(v3 - v1) & 0xFFFFFFFFFFFFFFF8];
      do
      {
        uint64_t v7 = *((void *)v3 - 1);
        v3 -= 8;
        *((void *)v6 - 1) = v7;
        v6 -= 8;
      }
      while (v3 != v1);
    }
    *(void *)a1 = v6;
    *(void *)(a1 + 8) = v5;
    *(void *)(a1 + 16) = v4 + 128;
    if (v1)
    {
      operator delete(v1);
    }
  }
}

void sub_25C167C00(uint64_t a1@<X0>, unsigned __int8 *a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, char a5@<W4>, int a6@<W5>, uint64_t *j@<X8>, float a8@<S0>)
{
  (*(void (**)(void ***__return_ptr))(*(void *)a1 + 16))(&v167);
  uint64_t v16 = v167;
  if (v167)
  {
    unsigned int v167 = 0;
    sub_25C13D850((uint64_t)v16);
LABEL_3:
    *char j = 0;
    j[1] = 0;
    j[2] = 0;
    return;
  }
  if (!a3) {
    goto LABEL_3;
  }
  uint64_t v179 = 0;
  uint64_t v180 = 0;
  unint64_t v181 = 0;
  unsigned int v167 = (void **)&unk_270989F00;
  long long v168 = 0u;
  long long v169 = 0u;
  long long v170 = 0u;
  long long v171 = 0u;
  long long v172 = 0u;
  uint64_t v173 = 0;
  uint64_t v174 = &unk_270989DE8;
  long long v175 = 0u;
  long long v176 = 0u;
  uint64_t v177 = 0;
  uint64_t v178 = 1024;
  sub_25C166C30((uint64_t)&v167, a2, a3);
  sub_25C1670B4(a1, &v167);
  sub_25C167448((uint64_t *)v166, &v167, a8);
  float v17 = *((float *)v166[0]
        + *(unsigned int *)(**(void **)(*((void *)&v170 + 1)
                                        + 24
                                        * ((((*((void *)&v169 + 1) - (void)v169) >> 3) - 1) & ~((int)(((*((void *)&v169 + 1) - (void)v169) >> 3) - 1) >> 31)))
                          + 24));
  if (a6)
  {
    if ((a5 & 1) == 0)
    {
      LOBYTE(__p) = 0;
      uint64_t v32 = sub_25C136E68(MEMORY[0x263F8C0F8], (uint64_t)"unigram_model.cc", 16);
      sub_25C136E68(v32, (uint64_t)"(", 1);
      uint64_t v33 = (void *)std::ostream::operator<<();
      uint64_t v34 = sub_25C136E68(v33, (uint64_t)") ", 2);
      unint64_t v35 = sub_25C136E68(v34, (uint64_t)"LOG(", 4);
      uint64_t v36 = sub_25C136E68(v35, (uint64_t)"ERROR", 5);
      uint64_t v37 = sub_25C136E68(v36, (uint64_t)") ", 2);
      sub_25C136E68(v37, (uint64_t)"include_best not supported for wor false", 40);
      sub_25C137184(&__p);
      goto LABEL_165;
    }
    sub_25C168B1C((uint64_t)&v163, &v167);
    char v140 = a5;
    int v141 = a4;
    uint64_t v144 = a2;
    uint64_t v142 = a3;
    uint64_t v18 = v163;
    long long v19 = v164;
    if (v163 == v164)
    {
      unsigned int v24 = 0;
      double v22 = 0;
    }
    else
    {
      unint64_t v20 = 0;
      uint64_t v21 = 0;
      double v22 = 0;
      do
      {
        uint64_t v23 = *(void *)v18;
        if (v20 >= v21)
        {
          unint64_t v25 = 0xAAAAAAAAAAAAAAABLL * (((char *)v20 - (char *)v22) >> 3) + 1;
          if (v25 > 0xAAAAAAAAAAAAAAALL) {
            sub_25C137658();
          }
          if (0x5555555555555556 * (((char *)v21 - (char *)v22) >> 3) > v25) {
            unint64_t v25 = 0x5555555555555556 * (((char *)v21 - (char *)v22) >> 3);
          }
          if (0xAAAAAAAAAAAAAAABLL * (((char *)v21 - (char *)v22) >> 3) >= 0x555555555555555) {
            unint64_t v26 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v26 = v25;
          }
          uint64_t v27 = (char *)sub_25C137670(v26);
          uint64_t v29 = &v27[8 * (((char *)v20 - (char *)v22) >> 3)];
          *(_OWORD *)uint64_t v29 = *(_OWORD *)v23;
          *((_DWORD *)v29 + 4) = *(_DWORD *)(v23 + 28);
          if (v20 == v22)
          {
            double v22 = (long long *)&v27[8 * (((char *)v20 - (char *)v22) >> 3)];
          }
          else
          {
            unint64_t v30 = (long long *)&v27[8 * (((char *)v20 - (char *)v22) >> 3)];
            do
            {
              long long v31 = *(long long *)((char *)v20 - 24);
              *((void *)v30 - 1) = *((void *)v20 - 1);
              *(long long *)((char *)v30 - 24) = v31;
              unint64_t v30 = (long long *)((char *)v30 - 24);
              unint64_t v20 = (long long *)((char *)v20 - 24);
            }
            while (v20 != v22);
            unint64_t v20 = v22;
            double v22 = v30;
          }
          uint64_t v21 = (long long *)&v27[24 * v28];
          unsigned int v24 = (long long *)(v29 + 24);
          if (v20) {
            operator delete(v20);
          }
        }
        else
        {
          long long *v20 = *(_OWORD *)v23;
          *((_DWORD *)v20 + 4) = *(_DWORD *)(v23 + 28);
          unsigned int v24 = (long long *)((char *)v20 + 24);
        }
        uint64_t v18 = (long long *)((char *)v18 + 8);
        unint64_t v20 = v24;
      }
      while (v18 != v19);
    }
    unint64_t v38 = v180;
    if ((unint64_t)v180 >= v181)
    {
      uint64_t v40 = ((uint64_t)v180 - v179) >> 5;
      if ((unint64_t)(v40 + 1) >> 59) {
        sub_25C137658();
      }
      unint64_t v41 = (uint64_t)(v181 - v179) >> 4;
      if (v41 <= v40 + 1) {
        unint64_t v41 = v40 + 1;
      }
      if (v181 - v179 >= 0x7FFFFFFFFFFFFFE0) {
        unint64_t v42 = 0x7FFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v42 = v41;
      }
      *((void *)&v150 + 1) = &v181;
      if (v42) {
        unint64_t v42 = (unint64_t)sub_25C15ED7C(v42);
      }
      else {
        uint64_t v43 = 0;
      }
      unint64_t v44 = v42 + 32 * v40;
      long long __p = (void *)v42;
      *(void *)&long long v149 = v44;
      *((void *)&v149 + 1) = v44;
      *(void *)&long long v150 = v42 + 32 * v43;
      *(void *)unint64_t v44 = 0;
      *(void *)(v44 + 8) = 0;
      *(void *)(v44 + 16) = 0;
      sub_25C137548((void *)v44, v22, v24, 0xAAAAAAAAAAAAAAABLL * (((char *)v24 - (char *)v22) >> 3));
      *(_DWORD *)(v44 + 24) = 0;
      *((void *)&v149 + 1) += 32;
      sub_25C15EE30(&v179, &__p);
      double v39 = v180;
      sub_25C15EEC4((uint64_t)&__p);
    }
    else
    {
      *uint64_t v180 = 0;
      v38[1] = 0;
      v38[2] = 0;
      sub_25C137548(v38, v22, v24, 0xAAAAAAAAAAAAAAABLL * (((char *)v24 - (char *)v22) >> 3));
      *((_DWORD *)v38 + 6) = 0;
      double v39 = v38 + 4;
    }
    a2 = v144;
    a4 = v141;
    uint64_t v180 = v39;
    a5 = v140;
    if (v163) {
      operator delete(v163);
    }
    a3 = v142;
    if (v22) {
      operator delete(v22);
    }
  }
  if (a5)
  {
    sub_25C168E4C((void **)&v163, &v167, a4 + 1, 1, a8);
    uint64_t v138 = j;
    if (a6)
    {
      char v161 = 0;
      uint64_t v162 = 0;
      uint64_t v160 = 0;
      long long __p = &v160;
      LOBYTE(v149) = 0;
      uint64_t v45 = (char *)v164 - (char *)v163;
      if (v164 != v163)
      {
        if (v45 < 0) {
          sub_25C137658();
        }
        uint64_t v46 = v45 >> 5;
        uint64_t v47 = (char *)sub_25C137670(v45 >> 5);
        uint64_t v160 = v47;
        uint64_t v162 = &v47[24 * v48];
        size_t v49 = 24 * ((24 * v46 - 24) / 0x18uLL) + 24;
        bzero(v47, v49);
        char v161 = &v47[v49];
        uint64_t v51 = v163;
        uint64_t v50 = v164;
        if (v164 != v163)
        {
          uint64_t v52 = 0;
          uint64_t v53 = 0;
          unint64_t v54 = 0;
          while (1)
          {
            uint64_t v55 = (char *)&v51[v52];
            uint64_t v56 = v160;
            unint64_t v57 = &v160[v53];
            if (&v51[v52] != (long long *)&v160[v53]) {
              break;
            }
LABEL_72:
            ++v54;
            v53 += 24;
            v52 += 2;
            if (v54 >= ((char *)v50 - (char *)v51) >> 5) {
              goto LABEL_73;
            }
          }
          int v58 = *(char **)v55;
          uint64_t v59 = (char *)*((void *)v55 + 1);
          int64_t v60 = (int64_t)&v59[-*(void *)v55];
          unint64_t v61 = v60 >> 3;
          uint64_t v62 = *((void *)v57 + 2);
          uint64_t v63 = *(char **)v57;
          if (v60 >> 3 <= (unint64_t)((v62 - *(void *)v57) >> 3))
          {
            int v145 = &v160[24 * v54 + 8];
            unint64_t v69 = &v160[v53];
            uint64_t v70 = *(unsigned char **)&v160[v53 + 8];
            unint64_t v71 = (v70 - v63) >> 3;
            if (v71 >= v61)
            {
              if (v59 != v58) {
                memmove(v63, v58, v60);
              }
              unint64_t v66 = v145;
              goto LABEL_71;
            }
            if (v70 != v63)
            {
              memmove(v63, v58, v70 - v63);
              uint64_t v63 = (char *)*((void *)v69 + 1);
            }
            unint64_t v66 = v145;
            int v68 = &v58[8 * v71];
            int64_t v60 = v59 - v68;
            if (v59 == v68)
            {
LABEL_71:
              *(void *)unint64_t v66 = &v63[v60];
              uint64_t v51 = v163;
              uint64_t v50 = v164;
              goto LABEL_72;
            }
            uint64_t v67 = v63;
          }
          else
          {
            if (v63)
            {
              *(void *)&v160[v53 + 8] = v63;
              operator delete(v63);
              uint64_t v62 = 0;
              *(void *)unint64_t v57 = 0;
              *((void *)v57 + 1) = 0;
              *((void *)v57 + 2) = 0;
            }
            if (v60 < 0) {
              sub_25C137658();
            }
            uint64_t v64 = v62 >> 2;
            if (v62 >> 2 <= v61) {
              uint64_t v64 = v60 >> 3;
            }
            if ((unint64_t)v62 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v65 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v65 = v64;
            }
            sub_25C16A9A8(&v56[v53], v65);
            unint64_t v66 = &v56[v53 + 8];
            uint64_t v63 = *(char **)v66;
            if (v59 == v58) {
              goto LABEL_71;
            }
            uint64_t v67 = *(void **)&v56[v53 + 8];
            int v68 = v58;
          }
          memmove(v67, v68, v60);
          goto LABEL_71;
        }
      }
LABEL_73:
      sub_25C168B1C((uint64_t)&__p, &v167);
      uint64_t v72 = v160;
      long long v73 = v161;
      if (v160 == v161)
      {
        uint64_t v76 = v160;
      }
      else
      {
        std::string::size_type v74 = __p;
        size_t v75 = v149 - (void)__p;
        uint64_t v76 = v160;
        while (*((void *)v76 + 1) - *(void *)v76 != v75 || memcmp(*(const void **)v76, v74, v75))
        {
          v76 += 24;
          if (v76 == v73)
          {
            uint64_t v76 = v73;
            break;
          }
        }
      }
      uint64_t v97 = (int)(-1431655765 * ((unint64_t)(v76 - v72) >> 3));
      uint64_t v98 = (char *)v164;
      if (v97 == ((char *)v164 - (char *)v163) >> 5)
      {
        uint64_t v100 = (char *)(v164 - 2);
        uint64_t v99 = (void *)*((void *)v164 - 4);
        if (v99)
        {
          *((void *)v164 - 3) = v99;
          operator delete(v99);
        }
      }
      else
      {
        int v101 = (char *)&v163[2 * v97];
        if (v101 + 32 == (char *)v164)
        {
          uint64_t v100 = (char *)&v163[2 * v97];
        }
        else
        {
          do
          {
            uint64_t v102 = *(void **)v101;
            if (*(void *)v101)
            {
              *((void *)v101 + 1) = v102;
              operator delete(v102);
              *(void *)int v101 = 0;
              *((void *)v101 + 1) = 0;
              *((void *)v101 + 2) = 0;
            }
            uint64_t v100 = v101 + 32;
            *(_OWORD *)int v101 = *((_OWORD *)v101 + 2);
            *((void *)v101 + 2) = *((void *)v101 + 6);
            *((void *)v101 + 5) = 0;
            *((void *)v101 + 6) = 0;
            *((void *)v101 + 4) = 0;
            *((_DWORD *)v101 + 6) = *((_DWORD *)v101 + 14);
            uint64_t v103 = v101 + 64;
            v101 += 32;
          }
          while (v103 != v98);
          uint64_t v98 = (char *)v164;
        }
        if (v98 == v100)
        {
          uint64_t v100 = v98;
        }
        else
        {
          uint64_t v104 = v98;
          do
          {
            int v106 = (void *)*((void *)v104 - 4);
            v104 -= 32;
            uint64_t v105 = v106;
            if (v106)
            {
              *((void *)v98 - 3) = v105;
              operator delete(v105);
            }
            uint64_t v98 = v104;
          }
          while (v104 != v100);
        }
      }
      uint64_t v164 = (long long *)v100;
      if (__p) {
        operator delete(__p);
      }
      long long __p = &v160;
      sub_25C159444((void ***)&__p);
    }
    uint64_t v107 = (void *)*((void *)v164 - 4);
    int v146 = v164 - 2;
    float v108 = *((float *)v164 - 2);
    if (v107)
    {
      *((void *)v164 - 3) = v107;
      operator delete(v107);
    }
    uint64_t v164 = v146;
    for (uint64_t i = v163; i != v146; i += 2)
    {
      long long __p = 0;
      long long v149 = 0uLL;
      int v111 = *(uint64_t **)i;
      uint64_t v110 = (uint64_t *)*((void *)i + 1);
      if (*(uint64_t **)i == v110)
      {
        uint64_t v116 = 0;
        float v113 = 0.0;
      }
      else
      {
        char v112 = 0;
        float v113 = 0.0;
        do
        {
          uint64_t v114 = *v111;
          float v115 = *(float *)(*v111 + 32);
          if ((unint64_t)v112 >= *((void *)&v149 + 1))
          {
            int v117 = (long long *)__p;
            unint64_t v118 = 0xAAAAAAAAAAAAAAABLL * (((char *)v112 - (unsigned char *)__p) >> 3);
            unint64_t v119 = v118 + 1;
            if (v118 + 1 > 0xAAAAAAAAAAAAAAALL) {
              sub_25C137658();
            }
            if (0x5555555555555556 * ((uint64_t)(*((void *)&v149 + 1) - (void)__p) >> 3) > v119) {
              unint64_t v119 = 0x5555555555555556 * ((uint64_t)(*((void *)&v149 + 1) - (void)__p) >> 3);
            }
            if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)&v149 + 1) - (void)__p) >> 3) >= 0x555555555555555) {
              unint64_t v120 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v120 = v119;
            }
            unint64_t v121 = (char *)sub_25C137670(v120);
            uint64_t v123 = &v121[24 * v118];
            *(_OWORD *)uint64_t v123 = *(_OWORD *)v114;
            *((_DWORD *)v123 + 4) = *(_DWORD *)(v114 + 28);
            unint64_t v124 = v123;
            if (v112 != v117)
            {
              do
              {
                long long v125 = *(long long *)((char *)v112 - 24);
                *((void *)v124 - 1) = *((void *)v112 - 1);
                *(_OWORD *)(v124 - 24) = v125;
                v124 -= 24;
                char v112 = (long long *)((char *)v112 - 24);
              }
              while (v112 != v117);
              char v112 = v117;
            }
            uint64_t v116 = (long long *)(v123 + 24);
            long long __p = v124;
            *(void *)&long long v149 = v123 + 24;
            *((void *)&v149 + 1) = &v121[24 * v122];
            if (v112) {
              operator delete(v112);
            }
          }
          else
          {
            *char v112 = *(_OWORD *)v114;
            *((_DWORD *)v112 + 4) = *(_DWORD *)(v114 + 28);
            uint64_t v116 = (long long *)((char *)v112 + 24);
          }
          *(void *)&long long v149 = v116;
          float v113 = v113 + (float)(a8 * v115);
          ++v111;
          char v112 = v116;
        }
        while (v111 != v110);
      }
      float v126 = v113 - v17;
      *(float *)&uint64_t v160 = v126;
      unint64_t v127 = (float *)v180;
      if ((unint64_t)v180 >= v181)
      {
        uint64_t v129 = sub_25C16A48C(&v179, (long long **)&__p, &v160);
        int v128 = __p;
      }
      else
      {
        *uint64_t v180 = 0;
        *((void *)v127 + 1) = 0;
        *((void *)v127 + 2) = 0;
        int v128 = __p;
        sub_25C137548(v127, (long long *)__p, v116, 0xAAAAAAAAAAAAAAABLL * (((char *)v116 - (unsigned char *)__p) >> 3));
        v127[6] = v126;
        uint64_t v129 = (uint64_t)(v127 + 8);
      }
      uint64_t v180 = (void *)v129;
      if (v128) {
        operator delete(v128);
      }
    }
    uint64_t v130 = v179;
    int v131 = v180;
    for (char j = v138; (void *)v130 != v131; v130 += 32)
    {
      float v132 = *(float *)(v130 + 24);
      if (v132 != 0.0)
      {
        double v133 = v132 - v108;
        long double v134 = exp(v133);
        if (v133 <= -10.0)
        {
          double v136 = v133 + v134 * -0.5 + v134 * v134 / 24.0 + pow(v134, 4.0) / -2880.0;
        }
        else
        {
          long double v135 = expm1(-v134);
          double v136 = log(-v135);
        }
        float v137 = v136;
        *(float *)(v130 + 24) = v137;
      }
    }
    long long __p = &v163;
    sub_25C1374B8((void ***)&__p);
    uint64_t v78 = v179;
    uint64_t v77 = v180;
  }
  else
  {
    uint64_t v78 = v179;
    uint64_t v77 = v180;
    if (a4 > (unint64_t)(((uint64_t)v180 - v179) >> 5))
    {
      uint64_t v139 = j;
      uint64_t v143 = a3;
      do
      {
        long long v149 = 0u;
        long long v150 = 0u;
        long long v151 = 0u;
        long long v152 = 0u;
        long long v153 = 0u;
        uint64_t v154 = 0;
        long long __p = &unk_270989F00;
        uint64_t v155 = &unk_270989DE8;
        long long v156 = 0u;
        long long v157 = 0u;
        uint64_t v158 = 0;
        uint64_t v159 = 1024;
        sub_25C166C30((uint64_t)&__p, a2, a3);
        sub_25C1670B4(a1, &__p);
        unint64_t v163 = 0;
        uint64_t v164 = 0;
        unsigned int v165 = 0;
        sub_25C16A5A8((unint64_t *)&v160, &__p, a8);
        uint64_t v79 = v160;
        std::string::size_type v80 = v161;
        if (v160 == v161)
        {
          int v84 = 0;
          float v82 = 0.0;
        }
        else
        {
          uint64_t v81 = 0;
          float v82 = 0.0;
          do
          {
            uint64_t v83 = *(void *)v79;
            if (v81 >= v165)
            {
              uint64_t v85 = v163;
              unint64_t v86 = 0xAAAAAAAAAAAAAAABLL * (((char *)v81 - (char *)v163) >> 3);
              unint64_t v87 = v86 + 1;
              if (v86 + 1 > 0xAAAAAAAAAAAAAAALL) {
                sub_25C137658();
              }
              if (0x5555555555555556 * (((char *)v165 - (char *)v163) >> 3) > v87) {
                unint64_t v87 = 0x5555555555555556 * (((char *)v165 - (char *)v163) >> 3);
              }
              if (0xAAAAAAAAAAAAAAABLL * (((char *)v165 - (char *)v163) >> 3) >= 0x555555555555555) {
                unint64_t v88 = 0xAAAAAAAAAAAAAAALL;
              }
              else {
                unint64_t v88 = v87;
              }
              uint64_t v89 = (char *)sub_25C137670(v88);
              uint64_t v91 = &v89[24 * v86];
              *(_OWORD *)uint64_t v91 = *(_OWORD *)v83;
              *((_DWORD *)v91 + 4) = *(_DWORD *)(v83 + 28);
              uint64_t v92 = v91;
              if (v81 != v85)
              {
                do
                {
                  long long v93 = *(long long *)((char *)v81 - 24);
                  *((void *)v92 - 1) = *((void *)v81 - 1);
                  *(_OWORD *)(v92 - 24) = v93;
                  v92 -= 24;
                  uint64_t v81 = (long long *)((char *)v81 - 24);
                }
                while (v81 != v85);
                uint64_t v81 = v85;
              }
              int v84 = (long long *)(v91 + 24);
              unint64_t v163 = (long long *)v92;
              uint64_t v164 = (long long *)(v91 + 24);
              unsigned int v165 = (long long *)&v89[24 * v90];
              if (v81) {
                operator delete(v81);
              }
            }
            else
            {
              long long *v81 = *(_OWORD *)v83;
              *((_DWORD *)v81 + 4) = *(_DWORD *)(v83 + 28);
              int v84 = (long long *)((char *)v81 + 24);
            }
            uint64_t v164 = v84;
            float v82 = v82 + (float)(a8 * *(float *)(v83 + 32));
            v79 += 8;
            uint64_t v81 = v84;
          }
          while (v79 != v80);
        }
        float v94 = v82 - v17;
        float v147 = v94;
        uint64_t v95 = (float *)v180;
        if ((unint64_t)v180 >= v181)
        {
          uint64_t v96 = sub_25C16A48C(&v179, &v163, &v147);
        }
        else
        {
          *uint64_t v180 = 0;
          *((void *)v95 + 1) = 0;
          *((void *)v95 + 2) = 0;
          sub_25C137548(v95, v163, v84, 0xAAAAAAAAAAAAAAABLL * (((char *)v84 - (char *)v163) >> 3));
          v95[6] = v94;
          uint64_t v96 = (uint64_t)(v95 + 8);
        }
        a3 = v143;
        uint64_t v180 = (void *)v96;
        if (v160) {
          operator delete(v160);
        }
        if (v163) {
          operator delete(v163);
        }
        sub_25C1662D0((uint64_t)&__p);
        uint64_t v78 = v179;
        uint64_t v77 = v180;
      }
      while (a4 > (unint64_t)(((uint64_t)v180 - v179) >> 5));
      char j = v139;
    }
  }
  *char j = v78;
  j[1] = (uint64_t)v77;
  j[2] = v181;
  char j = &v179;
LABEL_165:
  *char j = 0;
  j[1] = 0;
  j[2] = 0;
  if (v166[0])
  {
    v166[1] = v166[0];
    operator delete(v166[0]);
  }
  sub_25C1662D0((uint64_t)&v167);
  unsigned int v167 = (void **)&v179;
  sub_25C1374B8(&v167);
}

void sub_25C1689B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,void *a41,uint64_t a42,uint64_t a43,uint64_t a44,void *a45,void *a46,uint64_t a47,void **a48)
{
  sub_25C15EEC4((uint64_t)&a19);
  if (a41) {
    operator delete(a41);
  }
  if (v48) {
    operator delete(v48);
  }
  if (a45)
  {
    a46 = a45;
    operator delete(a45);
  }
  sub_25C1662D0((uint64_t)&a48);
  a48 = (void **)(v49 - 160);
  sub_25C1374B8(&a48);
  _Unwind_Resume(a1);
}

void sub_25C168B1C(uint64_t a1, void *a2)
{
  uint64_t v3 = 0;
  int v4 = ((a2[4] - a2[3]) >> 3) - 1;
  unsigned int v5 = v4 & ~(v4 >> 31);
  uint64_t v6 = a2[6];
  while (1)
  {
    uint64_t v7 = (uint64_t **)(v6 + 24 * v3);
    unint64_t v8 = *v7;
    uint64_t v9 = v7[1];
    if (v8 != v9) {
      break;
    }
LABEL_14:
    if (++v3 == v5 + 1)
    {
      uint64_t v21 = **(void **)(v6 + 24 * v5);
      int v22 = *(_DWORD *)(v21 + 36);
      uint64_t v23 = *(void *)(v21 + 40);
      if (*(void *)(v23 + 40))
      {
        unsigned int v24 = 0;
        unint64_t v25 = 0;
        unint64_t v26 = 0;
        do
        {
          if ((unint64_t)v25 >= v26)
          {
            uint64_t v27 = (v25 - v24) >> 3;
            unint64_t v28 = v27 + 1;
            if ((unint64_t)(v27 + 1) >> 61) {
              sub_25C137658();
            }
            if ((uint64_t)(v26 - (void)v24) >> 2 > v28) {
              unint64_t v28 = (uint64_t)(v26 - (void)v24) >> 2;
            }
            if (v26 - (unint64_t)v24 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v29 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v29 = v28;
            }
            if (v29) {
              unint64_t v29 = (unint64_t)sub_25C13C374(v29);
            }
            else {
              uint64_t v30 = 0;
            }
            long long v31 = (char *)(v29 + 8 * v27);
            *(void *)long long v31 = v23;
            uint64_t v32 = v31 + 8;
            while (v25 != v24)
            {
              uint64_t v33 = *((void *)v25 - 1);
              v25 -= 8;
              *((void *)v31 - 1) = v33;
              v31 -= 8;
            }
            unint64_t v26 = v29 + 8 * v30;
            if (v24) {
              operator delete(v24);
            }
            unsigned int v24 = v31;
            unint64_t v25 = v32;
          }
          else
          {
            *(void *)unint64_t v25 = v23;
            v25 += 8;
          }
          uint64_t v23 = *(void *)(v23 + 40);
        }
        while (*(void *)(v23 + 40));
        if (v24 != v25)
        {
          uint64_t v34 = v25 - 8;
          if (v25 - 8 > v24)
          {
            unint64_t v35 = v24 + 8;
            do
            {
              uint64_t v36 = *((void *)v35 - 1);
              *((void *)v35 - 1) = *(void *)v34;
              *(void *)uint64_t v34 = v36;
              v34 -= 8;
              BOOL v37 = v35 >= v34;
              v35 += 8;
            }
            while (!v37);
          }
        }
      }
      else
      {
        unsigned int v24 = 0;
        unint64_t v25 = 0;
      }
      *(void *)a1 = 0;
      *(void *)(a1 + 8) = 0;
      *(void *)(a1 + 16) = 0;
      sub_25C16AC98((void *)a1, v24, (uint64_t)v25, (v25 - v24) >> 3);
      *(_DWORD *)(a1 + 24) = v22;
      if (v24)
      {
        operator delete(v24);
      }
      return;
    }
  }
  unint64_t v10 = (uint64_t **)(a2[9] + 24 * v3);
  uint64_t v11 = *v10;
  uint64_t v12 = v10[1];
  while (1)
  {
    uint64_t v13 = *v8;
    *(void *)(*v8 + 4sub_25C163960(&a9, 0) = 0;
    if (v11 == v12) {
      break;
    }
    uint64_t v14 = 0;
    float v15 = 0.0;
    uint64_t v16 = v11;
    do
    {
      uint64_t v18 = *v16++;
      uint64_t v17 = v18;
      float v19 = *(float *)(v18 + 36) + *(float *)(v13 + 32);
      if (v19 > v15 || v14 == 0)
      {
        float v15 = v19;
        uint64_t v14 = v17;
      }
    }
    while (v16 != v12);
    if (!v14) {
      break;
    }
    *(void *)(v13 + 4sub_25C163960(&a9, 0) = v14;
    *(float *)(v13 + 36) = v15;
    if (++v8 == v9) {
      goto LABEL_14;
    }
  }
  char v44 = 0;
  unint64_t v38 = sub_25C136E68(MEMORY[0x263F8C0F8], (uint64_t)"unigram_model.cc", 16);
  sub_25C136E68(v38, (uint64_t)"(", 1);
  double v39 = (void *)std::ostream::operator<<();
  uint64_t v40 = sub_25C136E68(v39, (uint64_t)") ", 2);
  unint64_t v41 = sub_25C136E68(v40, (uint64_t)"LOG(", 4);
  unint64_t v42 = sub_25C136E68(v41, (uint64_t)"ERROR", 5);
  uint64_t v43 = sub_25C136E68(v42, (uint64_t)") ", 2);
  sub_25C136E68(v43, (uint64_t)"Failed to find the best path in Viterbi.", 40);
  sub_25C137184(&v44);
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 24) = 0;
  *(void *)(a1 + 16) = 0;
}

void sub_25C168E1C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, __int16 a11, char a12, char a13)
{
  if (v13) {
    operator delete(v13);
  }
  _Unwind_Resume(exception_object);
}

void sub_25C168E4C(void **a1, void *a2, uint64_t a3, int a4, float a5)
{
  uint64_t v7 = a2;
  uint64_t v233 = *MEMORY[0x263EF8340];
  if (a3 == 1)
  {
    if ((a4 & 1) == 0)
    {
      sub_25C168B1C((uint64_t)v231, a2);
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
      v218[0] = a1;
      LOBYTE(v218[1]) = 0;
      uint64_t v200 = operator new(0x20uLL);
      *a1 = v200;
      a1[1] = v200;
      a1[2] = v200 + 4;
      __p[0] = v200;
      v222[0] = v200;
      unsigned int v226 = a1 + 2;
      *(void *)&long long v227 = v222;
      *((void *)&v227 + 1) = __p;
      LOBYTE(v228[0]) = 0;
      v200[1] = 0;
      v200[2] = 0;
      long long v201 = *(_OWORD *)v231;
      unint64_t v202 = (uint64_t)(*(void *)&v231[8] - *(void *)v231) >> 3;
      *uint64_t v200 = 0;
      sub_25C16AC98(v200, (const void *)v201, *((uint64_t *)&v201 + 1), v202);
      *((_DWORD *)v200 + 6) = *(_DWORD *)&v231[24];
      __p[0] = (char *)__p[0] + 32;
      char v203 = __p[0];
      LOBYTE(v228[0]) = 1;
      sub_25C1375F0((uint64_t)&v226);
      a1[1] = v203;
      if (*(void *)v231)
      {
        *(void *)&v231[8] = *(void *)v231;
        operator delete(*(void **)v231);
      }
      return;
    }
  }
  else if (!a3)
  {
    LOBYTE(v226) = 0;
    uint64_t v9 = sub_25C136E68(MEMORY[0x263F8C0F8], (uint64_t)"unigram_model.cc", 16);
    sub_25C136E68(v9, (uint64_t)"(", 1);
    unint64_t v10 = (void *)std::ostream::operator<<();
    uint64_t v11 = sub_25C136E68(v10, (uint64_t)") ", 2);
    uint64_t v12 = sub_25C136E68(v11, (uint64_t)"LOG(", 4);
    uint64_t v13 = sub_25C136E68(v12, (uint64_t)"WARNING", 7);
    uint64_t v14 = sub_25C136E68(v13, (uint64_t)") ", 2);
    sub_25C136E68(v14, (uint64_t)"nbest_size >= 1. Returns empty result.", 38);
    sub_25C137184(&v226);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
    return;
  }
  long long v227 = 0u;
  memset(v228, 0, sizeof(v228));
  unsigned int v226 = &unk_270989DC8;
  uint64_t v229 = 512;
  a1[1] = 0;
  a1[2] = 0;
  *a1 = 0;
  uint64_t v15 = sub_25C16A9E8(&v226);
  int v16 = ((v7[4] - v7[3]) >> 3) - 1;
  *(void *)uint64_t v15 = **(void **)(v7[6] + 24 * (v16 & ~(v16 >> 31)));
  *(void *)(v15 + 8) = 0;
  *(_DWORD *)(v15 + 2sub_25C163960(&a9, 0) = 0;
  unint64_t v17 = v7[16] + v7[17] * v7[18];
  *(_DWORD *)char v231 = 0;
  sub_25C15D59C(__p, v17, v231);
  if (a4)
  {
    sub_25C167448((uint64_t *)v231, v7, a5);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    *(_OWORD *)long long __p = *(_OWORD *)v231;
    uint64_t v225 = *(void *)&v231[16];
    uint64_t v18 = sub_25C16CE20();
    unsigned int v19 = sub_25C13867C(v18);
    float v20 = logf((float)((float)((float)v19 * 2.3283e-10) + 0.0) + 0.0000001);
    float v21 = -logf(-v20);
  }
  else
  {
    sub_25C168B1C((uint64_t)v223, v7);
    if (v223[0])
    {
      v223[1] = v223[0];
      operator delete(v223[0]);
    }
    float v21 = *(float *)(*(void *)v15 + 36);
  }
  *(float *)(v15 + 16) = v21;
  int v22 = operator new(8uLL);
  *int v22 = v15;
  *(void *)&long long v23 = v22;
  *((void *)&v23 + 1) = v22 + 1;
  long long v217 = v23;
  uint64_t v216 = (char *)(v22 + 1);
  sub_25C16AB58((uint64_t)v22, (uint64_t)(v22 + 1), 1);
  int v205 = 0;
  char v206 = 0;
  int v204 = 10 * a3;
  if (10 * (int)a3 >= 512) {
    int v24 = 512;
  }
  else {
    int v24 = 10 * a3;
  }
  if (v24 <= 1) {
    int v25 = 1;
  }
  else {
    int v25 = v24;
  }
  int v207 = v25;
  uint64_t v212 = a3;
  while ((void)v217 != *((void *)&v217 + 1))
  {
    unint64_t v26 = *(void **)v217;
    if ((uint64_t)(*((void *)&v217 + 1) - v217) >= 9)
    {
      uint64_t v27 = 0;
      uint64_t v28 = (uint64_t)(*((void *)&v217 + 1) - v217) >> 3;
      unint64_t v29 = (void *)v217;
      do
      {
        uint64_t v30 = v29;
        v29 += v27 + 1;
        uint64_t v31 = 2 * v27;
        uint64_t v27 = (2 * v27) | 1;
        uint64_t v32 = v31 + 2;
        if (v32 < v28 && *(float *)(*v29 + 16) < *(float *)(v29[1] + 16))
        {
          ++v29;
          uint64_t v27 = v32;
        }
        *uint64_t v30 = *v29;
      }
      while (v27 <= (uint64_t)((unint64_t)(v28 - 2) >> 1));
      uint64_t v33 = (void *)(*((void *)&v217 + 1) - 8);
      if (v29 == (void *)(*((void *)&v217 + 1) - 8))
      {
        *unint64_t v29 = v26;
      }
      else
      {
        *unint64_t v29 = *v33;
        void *v33 = v26;
        sub_25C16AB58(v217, (uint64_t)(v29 + 1), (uint64_t)((uint64_t)v29 - v217 + 8) >> 3);
      }
    }
    *(void *)&long long v34 = v217;
    *((void *)&v34 + 1) = *((void *)&v217 + 1) - 8;
    long long v217 = v34;
    uint64_t v35 = *v26;
    uint64_t v36 = (void **)v7[9];
    if (*v26 == **v36)
    {
      BOOL v37 = (char *)*a1;
      unint64_t v38 = (char *)a1[1];
      uint64_t v39 = v38 - (unsigned char *)*a1;
      uint64_t v40 = v39 >> 5;
      unint64_t v41 = (v39 >> 5) + 1;
      if (v39 == -32)
      {
        unint64_t v42 = &v37[32 * v41];
        if (v38 != v42)
        {
          uint64_t v43 = (char *)a1[1];
          do
          {
            uint64_t v45 = (void *)*((void *)v43 - 4);
            v43 -= 32;
            char v44 = v45;
            if (v45)
            {
              *((void *)v38 - 3) = v44;
              operator delete(v44);
            }
            unint64_t v38 = v43;
          }
          while (v43 != v42);
        }
        a1[1] = v42;
        goto LABEL_57;
      }
      uint64_t v46 = (char *)a1[2];
      if (v46 != v38)
      {
        *(void *)unint64_t v38 = 0;
        *((void *)v38 + 1) = 0;
        *((_DWORD *)v38 + 6) = 0;
        *((void *)v38 + 2) = 0;
        a1[1] = v38 + 32;
        goto LABEL_57;
      }
      if (v41 >> 59) {
        sub_25C137658();
      }
      uint64_t v47 = v46 - v37;
      if (v47 >> 4 > v41) {
        unint64_t v41 = v47 >> 4;
      }
      if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFE0) {
        unint64_t v48 = 0x7FFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v48 = v41;
      }
      if (v48 >> 59) {
        sub_25C1376B8();
      }
      uint64_t v49 = (char *)operator new(32 * v48);
      uint64_t v50 = &v49[32 * v40];
      uint64_t v51 = &v49[32 * v48];
      *(void *)uint64_t v50 = 0;
      *((void *)v50 + 1) = 0;
      *((_DWORD *)v50 + 6) = 0;
      *((void *)v50 + 2) = 0;
      uint64_t v52 = v50 + 32;
      uint64_t v53 = (char *)*a1;
      if (v38 != *a1)
      {
        uint64_t v54 = 0;
        do
        {
          uint64_t v55 = &v50[v54];
          uint64_t v56 = &v38[v54];
          *((void *)v55 - 4) = 0;
          *((void *)v55 - 3) = 0;
          *((void *)v55 - 2) = 0;
          *((_OWORD *)v55 - 2) = *(_OWORD *)&v38[v54 - 32];
          *((void *)v55 - 2) = *(void *)&v38[v54 - 16];
          *((void *)v56 - 4) = 0;
          *((void *)v56 - 3) = 0;
          *((void *)v56 - 2) = 0;
          *((_DWORD *)v55 - 2) = *(_DWORD *)&v38[v54 - 8];
          v54 -= 32;
        }
        while (&v38[v54] != v53);
        unint64_t v57 = (char *)*a1;
        unint64_t v38 = (char *)a1[1];
        *a1 = &v50[v54];
        a1[1] = v52;
        a1[2] = v51;
        if (v38 != v57)
        {
          int v58 = v38;
          do
          {
            int64_t v60 = (void *)*((void *)v58 - 4);
            v58 -= 32;
            uint64_t v59 = v60;
            if (v60)
            {
              *((void *)v38 - 3) = v59;
              operator delete(v59);
            }
            unint64_t v38 = v58;
          }
          while (v58 != v57);
          unint64_t v38 = v57;
        }
        if (!v38) {
          goto LABEL_57;
        }
LABEL_56:
        operator delete(v38);
        goto LABEL_57;
      }
      *a1 = v50;
      a1[1] = v52;
      a1[2] = v51;
      if (v38) {
        goto LABEL_56;
      }
LABEL_57:
      unint64_t v61 = v26;
      for (uint64_t i = (void *)v26[1]; i[1]; uint64_t i = (void *)i[1])
      {
        uint64_t v63 = a1[1];
        unint64_t v65 = (void *)*(v63 - 3);
        unint64_t v64 = *(v63 - 2);
        if ((unint64_t)v65 >= v64)
        {
          uint64_t v67 = *(v63 - 4);
          uint64_t v68 = ((uint64_t)v65 - v67) >> 3;
          if ((unint64_t)(v68 + 1) >> 61) {
            sub_25C137658();
          }
          uint64_t v69 = v64 - v67;
          uint64_t v70 = v69 >> 2;
          if (v69 >> 2 <= (unint64_t)(v68 + 1)) {
            uint64_t v70 = v68 + 1;
          }
          if ((unint64_t)v69 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v71 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v71 = v70;
          }
          if (v71) {
            unint64_t v71 = (unint64_t)sub_25C13C374(v71);
          }
          else {
            uint64_t v72 = 0;
          }
          long long v73 = (void *)(v71 + 8 * v68);
          *long long v73 = *i;
          unint64_t v66 = v73 + 1;
          size_t v75 = (char *)*(v63 - 4);
          std::string::size_type v74 = (char *)*(v63 - 3);
          if (v74 != v75)
          {
            do
            {
              uint64_t v76 = *((void *)v74 - 1);
              v74 -= 8;
              *--long long v73 = v76;
            }
            while (v74 != v75);
            std::string::size_type v74 = (char *)*(v63 - 4);
          }
          *(v63 - 4) = v73;
          *(v63 - 3) = v66;
          *(v63 - 2) = v71 + 8 * v72;
          if (v74) {
            operator delete(v74);
          }
        }
        else
        {
          *unint64_t v65 = *i;
          unint64_t v66 = v65 + 1;
        }
        *(v63 - 3) = v66;
      }
      uint64_t v77 = (char *)a1[1];
      *((_DWORD *)v77 - 2) = *((_DWORD *)v61 + 4);
      if (v212 == (v77 - (unsigned char *)*a1) >> 5) {
        break;
      }
    }
    else
    {
      uint64_t v78 = (char *)v36[3 * *(int *)(v35 + 16) + 1] - (char *)v36[3 * *(int *)(v35 + 16)];
      unint64_t v79 = (int)(v78 >> 3);
      *(_DWORD *)char v231 = 0;
      sub_25C15D59C(v222, v79, v231);
      *(_DWORD *)char v231 = 0;
      sub_25C15D59C(v221, v79, v231);
      v210 = (float *)v26;
      if (v78 << 29)
      {
        if (v78 << 29 < 0) {
          sub_25C137658();
        }
        std::string::size_type v80 = (double *)sub_25C13C374((int)(v78 >> 3));
        uint64_t v81 = v80;
        unint64_t v82 = 0;
        uint64_t v83 = 8 * v79;
        int v84 = &v80[v79];
        do
        {
          v80[v82 / 8] = 0.0;
          v82 += 8;
        }
        while (v83 != v82);
      }
      else
      {
        uint64_t v81 = 0;
        int v84 = 0;
      }
      int v85 = *(_DWORD *)(v35 + 16);
      uint64_t v86 = v7[9];
      uint64_t v208 = v81;
      if (a4)
      {
        uint64_t v87 = *(void *)(v86 + 24 * v85);
        float v88 = -100000000.0;
        if (*(void *)(v86 + 24 * v85 + 8) != v87)
        {
          unint64_t v89 = 0;
          float v90 = *((float *)__p[0] + *(unsigned int *)(v35 + 24));
          float v88 = -100000000.0;
          do
          {
            float v91 = (float)((float)(v210[5] + *((float *)__p[0] + *(unsigned int *)(*(void *)(v87 + 8 * v89) + 24)))
                        + (float)(a5 * *(float *)(*(void *)(v87 + 8 * v89) + 32)))
                - v90;
            *((float *)v222[0] + v89) = v91;
            uint64_t v92 = sub_25C16CE20();
            unsigned int v93 = sub_25C13867C(v92);
            float v94 = logf((float)((float)((float)v93 * 2.3283e-10) + 0.0) + 0.0000001);
            float v95 = v91 - logf(-v94);
            *((float *)v221[0] + v89) = v95;
            if (v95 > v88) {
              float v88 = v95;
            }
            ++v89;
            int v96 = *(_DWORD *)(v35 + 16);
            uint64_t v86 = v7[9];
            uint64_t v87 = *(void *)(v86 + 24 * v96);
          }
          while (v89 < (*(void *)(v86 + 24 * v96 + 8) - v87) >> 3);
          int v85 = *(_DWORD *)(v35 + 16);
        }
        if (v84 != v81)
        {
          float v97 = v210[4];
          uint64_t v98 = (float *)v221[0];
          if ((unint64_t)(v84 - v81) <= 1) {
            uint64_t v99 = 1;
          }
          else {
            uint64_t v99 = v84 - v81;
          }
          do
          {
            float v100 = *v98++;
            float v101 = expf(v100 - v88);
            float v102 = (float)(v97 - v100) + log1pf(-v101);
            float v103 = v97 - fmaxf(v102, 0.0);
            float v104 = expf(-fabsf(v102));
            *v81++ = (float)(v103 - log1pf(v104));
            --v99;
          }
          while (v99);
        }
      }
      uint64_t v105 = *(void *)(v86 + 24 * v85);
      if (*(void *)(v86 + 24 * v85 + 8) == v105)
      {
        long long v120 = v217;
      }
      else
      {
        unint64_t v106 = 0;
        do
        {
          uint64_t v107 = *(void *)(v105 + 8 * v106);
          uint64_t v108 = sub_25C16A9E8(&v226);
          uint64_t v86 = v108;
          *(void *)uint64_t v108 = v107;
          if (a4)
          {
            *(_DWORD *)(v108 + 2sub_25C163960(&a9, 0) = *((_DWORD *)v222[0] + v106);
            float v109 = v208[v106];
            uint64_t v110 = v210;
          }
          else
          {
            uint64_t v110 = v210;
            *(float *)(v108 + 2sub_25C163960(&a9, 0) = *(float *)(v107 + 32) + v210[5];
            float v109 = *(float *)(v107 + 36) + v210[5];
          }
          *(float *)(v108 + 16) = v109;
          *(void *)(v108 + 8) = v110;
          int v111 = (char *)*((void *)&v217 + 1);
          if (*((void *)&v217 + 1) >= (unint64_t)v216)
          {
            uint64_t v113 = (uint64_t)(*((void *)&v217 + 1) - v217) >> 3;
            unint64_t v114 = v113 + 1;
            if ((unint64_t)(v113 + 1) >> 61) {
              sub_25C137658();
            }
            if ((uint64_t)&v216[-v217] >> 2 > v114) {
              unint64_t v114 = (uint64_t)&v216[-v217] >> 2;
            }
            if ((unint64_t)&v216[-v217] >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v115 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v115 = v114;
            }
            if (v115)
            {
              if (v115 >> 61) {
                sub_25C1376B8();
              }
              uint64_t v116 = (char *)operator new(8 * v115);
            }
            else
            {
              uint64_t v116 = 0;
            }
            int v117 = (uint64_t *)&v116[8 * v113];
            *int v117 = v86;
            uint64_t v112 = (uint64_t)(v117 + 1);
            if (*((void *)&v217 + 1) != (void)v217)
            {
              do
              {
                uint64_t v118 = *((void *)v111 - 1);
                v111 -= 8;
                *--int v117 = v118;
              }
              while (v111 != (char *)v217);
              int v111 = (char *)v217;
            }
            uint64_t v216 = &v116[8 * v115];
            *(void *)&long long v217 = v117;
            if (v111) {
              operator delete(v111);
            }
          }
          else
          {
            **((void **)&v217 + 1) = v108;
            uint64_t v112 = *((void *)&v217 + 1) + 8;
          }
          *(void *)&long long v119 = v217;
          *((void *)&v119 + 1) = v112;
          long long v213 = v119;
          sub_25C16AB58(v217, v112, (v112 - (uint64_t)v217) >> 3);
          long long v120 = v213;
          ++v106;
          uint64_t v105 = *(void *)(v7[9] + 24 * *(int *)(v35 + 16));
          long long v217 = v213;
        }
        while (v106 < (*(void *)(v7[9] + 24 * *(int *)(v35 + 16) + 8) - v105) >> 3);
      }
      long long v214 = v120;
      unint64_t v121 = (void *)MEMORY[0x263F8C0F8];
      if (!(((unint64_t)(v228[1] + v228[2] * v229) < 0x3B9ACA00) | v206 & 1))
      {
        v231[0] = 0;
        sub_25C136E68(MEMORY[0x263F8C0F8], (uint64_t)"unigram_model.cc", 16);
        sub_25C136E68(v121, (uint64_t)"(", 1);
        uint64_t v122 = (void *)std::ostream::operator<<();
        uint64_t v123 = sub_25C136E68(v122, (uint64_t)") ", 2);
        unint64_t v124 = sub_25C136E68(v123, (uint64_t)"LOG(", 4);
        long long v125 = sub_25C136E68(v124, (uint64_t)"WARNING", 7);
        float v126 = sub_25C136E68(v125, (uint64_t)") ", 2);
        sub_25C136E68(v126, (uint64_t)"Allocator size exceeds ", 23);
        unint64_t v127 = (void *)std::ostream::operator<<();
        sub_25C136E68(v127, (uint64_t)" with an example of length ", 27);
        std::ostream::operator<<();
        sub_25C137184(v231);
        char v206 = 1;
      }
      if (*((void *)&v214 + 1) - (void)v214 < 0x13879uLL)
      {
        long long v217 = v214;
      }
      else
      {
        uint64_t v128 = *((void *)&v214 + 1);
        memset(&v231[8], 0, 40);
        *(void *)char v231 = &unk_270989DC8;
        uint64_t v232 = 512;
        *(_OWORD *)uint64_t v218 = 0u;
        long long v219 = 0u;
        float v220 = 1.0;
        LOBYTE(v23sub_25C163960(&a9, 0) = 0;
        sub_25C136E68(v121, (uint64_t)"unigram_model.cc", 16);
        sub_25C136E68(v121, (uint64_t)"(", 1);
        uint64_t v129 = (void *)std::ostream::operator<<();
        uint64_t v130 = sub_25C136E68(v129, (uint64_t)") ", 2);
        int v131 = sub_25C136E68(v130, (uint64_t)"LOG(", 4);
        float v132 = sub_25C136E68(v131, (uint64_t)"WARNING", 7);
        double v133 = sub_25C136E68(v132, (uint64_t)") ", 2);
        sub_25C136E68(v133, (uint64_t)"Too big agenda size ", 20);
        long double v134 = (void *)std::ostream::operator<<();
        sub_25C136E68(v134, (uint64_t)". Shrinking (round ", 19);
        ++v205;
        long double v135 = (void *)std::ostream::operator<<();
        sub_25C136E68(v135, (uint64_t)") down to ", 10);
        double v136 = (void *)std::ostream::operator<<();
        sub_25C136E68(v136, (uint64_t)".", 1);
        unsigned int v211 = v7;
        sub_25C137184(&v230);
        if (v204 >= 1)
        {
          uint64_t v216 = 0;
          int v137 = 0;
          long long v217 = 0u;
          long long v138 = v214;
          while (1)
          {
            long long v215 = v138;
            uint64_t v139 = (void *)v138;
            unint64_t v140 = *(void *)v138;
            uint64_t v230 = 0;
            if (!v140) {
              goto LABEL_229;
            }
            int v141 = &v230;
            unint64_t v142 = (unint64_t)v218[1];
            do
            {
              unint64_t v143 = 0x9DDFEA08EB382D69 * (((8 * v140) + 8) ^ HIDWORD(v140));
              unint64_t v144 = 0x9DDFEA08EB382D69 * (HIDWORD(v140) ^ (v143 >> 47) ^ v143);
              unint64_t v145 = 0x9DDFEA08EB382D69 * (v144 ^ (v144 >> 47));
              if (v142)
              {
                uint8x8_t v146 = (uint8x8_t)vcnt_s8((int8x8_t)v142);
                v146.i16[0] = vaddlv_u8(v146);
                if (v146.u32[0] > 1uLL)
                {
                  unint64_t v147 = 0x9DDFEA08EB382D69 * (v144 ^ (v144 >> 47));
                  if (v145 >= v142) {
                    unint64_t v147 = v145 % v142;
                  }
                }
                else
                {
                  unint64_t v147 = v145 & (v142 - 1);
                }
                uint64_t v148 = (void *)*((void *)v218[0] + v147);
                if (v148)
                {
                  for (char j = (void *)*v148; j; char j = (void *)*j)
                  {
                    unint64_t v150 = j[1];
                    if (v150 == v145)
                    {
                      if (j[2] == v140)
                      {
                        *int v141 = j[3];
                        goto LABEL_229;
                      }
                    }
                    else
                    {
                      if (v146.u32[0] > 1uLL)
                      {
                        if (v150 >= v142) {
                          v150 %= v142;
                        }
                      }
                      else
                      {
                        v150 &= v142 - 1;
                      }
                      if (v150 != v147) {
                        break;
                      }
                    }
                  }
                }
              }
              uint64_t v151 = sub_25C16A9E8(v231);
              long long v152 = *(_OWORD *)v140;
              *(void *)(v151 + 16) = *(void *)(v140 + 16);
              *(_OWORD *)uint64_t v151 = v152;
              *int v141 = v151;
              unint64_t v142 = (unint64_t)v218[1];
              if (v218[1])
              {
                uint8x8_t v153 = (uint8x8_t)vcnt_s8((int8x8_t)v218[1]);
                v153.i16[0] = vaddlv_u8(v153);
                if (v153.u32[0] > 1uLL)
                {
                  uint64_t v86 = v145;
                  if ((void *)v145 >= v218[1]) {
                    uint64_t v86 = v145 % (unint64_t)v218[1];
                  }
                }
                else
                {
                  uint64_t v86 = ((unint64_t)v218[1] - 1) & v145;
                }
                uint64_t v154 = (void *)*((void *)v218[0] + v86);
                if (v154)
                {
                  for (char k = (void *)*v154; k; char k = (void *)*k)
                  {
                    unint64_t v156 = k[1];
                    if (v156 == v145)
                    {
                      if (k[2] == v140) {
                        goto LABEL_218;
                      }
                    }
                    else
                    {
                      if (v153.u32[0] > 1uLL)
                      {
                        if ((void *)v156 >= v218[1]) {
                          v156 %= (unint64_t)v218[1];
                        }
                      }
                      else
                      {
                        v156 &= (unint64_t)v218[1] - 1;
                      }
                      if (v156 != v86) {
                        break;
                      }
                    }
                  }
                }
              }
              long long v157 = operator new(0x20uLL);
              *long long v157 = 0;
              v157[1] = v145;
              v157[2] = v140;
              v157[3] = v151;
              float v158 = (float)(unint64_t)(*((void *)&v219 + 1) + 1);
              if (!v142 || (float)(v220 * (float)v142) < v158)
              {
                BOOL v159 = (v142 & (v142 - 1)) == 0;
                if (v142 < 3) {
                  BOOL v159 = 0;
                }
                unint64_t v160 = (2 * v142) | !v159;
                unint64_t v161 = vcvtps_u32_f32(v158 / v220);
                if (v160 <= v161) {
                  int8x8_t prime = (int8x8_t)v161;
                }
                else {
                  int8x8_t prime = (int8x8_t)v160;
                }
                if (*(void *)&prime == 1)
                {
                  int8x8_t prime = (int8x8_t)2;
                }
                else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
                {
                  int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
                  unint64_t v142 = (unint64_t)v218[1];
                }
                if (*(void *)&prime <= v142)
                {
                  if (*(void *)&prime < v142)
                  {
                    unint64_t v169 = vcvtps_u32_f32((float)*((unint64_t *)&v219 + 1) / v220);
                    if (v142 < 3
                      || (uint8x8_t v170 = (uint8x8_t)vcnt_s8((int8x8_t)v142), v170.i16[0] = vaddlv_u8(v170), v170.u32[0] > 1uLL))
                    {
                      unint64_t v169 = std::__next_prime(v169);
                    }
                    else
                    {
                      uint64_t v171 = 1 << -(char)__clz(v169 - 1);
                      if (v169 >= 2) {
                        unint64_t v169 = v171;
                      }
                    }
                    if (*(void *)&prime <= v169) {
                      int8x8_t prime = (int8x8_t)v169;
                    }
                    if (*(void *)&prime >= v142)
                    {
                      unint64_t v142 = (unint64_t)v218[1];
                    }
                    else
                    {
                      if (prime) {
                        goto LABEL_174;
                      }
                      uint64_t v177 = v218[0];
                      v218[0] = 0;
                      if (v177) {
                        operator delete(v177);
                      }
                      unint64_t v142 = 0;
                      v218[1] = 0;
                    }
                  }
                }
                else
                {
LABEL_174:
                  if (*(void *)&prime >> 61) {
                    sub_25C1376B8();
                  }
                  unint64_t v163 = operator new(8 * *(void *)&prime);
                  uint64_t v164 = v218[0];
                  v218[0] = v163;
                  if (v164) {
                    operator delete(v164);
                  }
                  uint64_t v165 = 0;
                  v218[1] = (void *)prime;
                  do
                    *((void *)v218[0] + v165++) = 0;
                  while (*(void *)&prime != v165);
                  uint64_t v166 = (void **)v219;
                  if ((void)v219)
                  {
                    unint64_t v167 = *(void *)(v219 + 8);
                    uint8x8_t v168 = (uint8x8_t)vcnt_s8(prime);
                    v168.i16[0] = vaddlv_u8(v168);
                    if (v168.u32[0] > 1uLL)
                    {
                      if (v167 >= *(void *)&prime) {
                        v167 %= *(void *)&prime;
                      }
                    }
                    else
                    {
                      v167 &= *(void *)&prime - 1;
                    }
                    *((void *)v218[0] + v167) = &v219;
                    for (char m = *v166; m; v167 = v173)
                    {
                      unint64_t v173 = m[1];
                      if (v168.u32[0] > 1uLL)
                      {
                        if (v173 >= *(void *)&prime) {
                          v173 %= *(void *)&prime;
                        }
                      }
                      else
                      {
                        v173 &= *(void *)&prime - 1;
                      }
                      if (v173 != v167)
                      {
                        if (!*((void *)v218[0] + v173))
                        {
                          *((void *)v218[0] + v173) = v166;
                          goto LABEL_199;
                        }
                        *uint64_t v166 = (void *)*m;
                        *char m = **((void **)v218[0] + v173);
                        **((void **)v218[0] + v173) = m;
                        char m = v166;
                      }
                      unint64_t v173 = v167;
LABEL_199:
                      uint64_t v166 = (void **)m;
                      char m = (void *)*m;
                    }
                  }
                  unint64_t v142 = (unint64_t)prime;
                }
                if ((v142 & (v142 - 1)) != 0)
                {
                  if (v145 >= v142) {
                    uint64_t v86 = v145 % v142;
                  }
                  else {
                    uint64_t v86 = v145;
                  }
                }
                else
                {
                  uint64_t v86 = (v142 - 1) & v145;
                }
              }
              uint64_t v174 = v218[0];
              long long v175 = (void *)*((void *)v218[0] + v86);
              if (v175)
              {
                *long long v157 = *v175;
LABEL_216:
                void *v175 = v157;
                goto LABEL_217;
              }
              *long long v157 = v219;
              *(void *)&long long v219 = v157;
              v174[v86] = &v219;
              if (*v157)
              {
                unint64_t v176 = *(void *)(*v157 + 8);
                if ((v142 & (v142 - 1)) != 0)
                {
                  if (v176 >= v142) {
                    v176 %= v142;
                  }
                }
                else
                {
                  v176 &= v142 - 1;
                }
                long long v175 = (char *)v218[0] + 8 * v176;
                goto LABEL_216;
              }
LABEL_217:
              ++*((void *)&v219 + 1);
LABEL_218:
              unint64_t v140 = *(void *)(v140 + 8);
              int v141 = (uint64_t *)(v151 + 8);
            }
            while (v140);
LABEL_229:
            uint64_t v178 = v230;
            uint64_t v86 = *((void *)&v217 + 1);
            if (*((void *)&v217 + 1) >= (unint64_t)v216)
            {
              uint64_t v181 = (uint64_t)(*((void *)&v217 + 1) - v217) >> 3;
              unint64_t v182 = v181 + 1;
              if ((unint64_t)(v181 + 1) >> 61) {
                sub_25C137658();
              }
              uint64_t v180 = v139;
              if ((uint64_t)&v216[-v217] >> 2 > v182) {
                unint64_t v182 = (uint64_t)&v216[-v217] >> 2;
              }
              if ((unint64_t)&v216[-v217] >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v183 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v183 = v182;
              }
              if (v183)
              {
                if (v183 >> 61) {
                  sub_25C1376B8();
                }
                uint64_t v184 = (char *)operator new(8 * v183);
              }
              else
              {
                uint64_t v184 = 0;
              }
              unsigned int v185 = &v184[8 * v181];
              *(void *)unsigned int v185 = v178;
              uint64_t v179 = (uint64_t)(v185 + 8);
              if (*((void *)&v217 + 1) != (void)v217)
              {
                do
                {
                  uint64_t v186 = *(void *)(v86 - 8);
                  v86 -= 8;
                  *((void *)v185 - 1) = v186;
                  v185 -= 8;
                }
                while (v86 != (void)v217);
                uint64_t v86 = v217;
              }
              uint64_t v216 = &v184[8 * v183];
              *(void *)&long long v217 = v185;
              if (v86) {
                operator delete((void *)v86);
              }
            }
            else
            {
              **((void **)&v217 + 1) = v230;
              uint64_t v86 = *((void *)&v217 + 1) + 8;
              uint64_t v179 = *((void *)&v217 + 1) + 8;
              uint64_t v180 = v139;
            }
            sub_25C16AB58(v217, v179, (v179 - (uint64_t)v217) >> 3);
            if (v128 - (uint64_t)v180 >= 9)
            {
              uint64_t v187 = 0;
              uint64_t v188 = (v128 - (uint64_t)v180) >> 3;
              uint64_t v189 = *v180;
              uint64_t v190 = v180;
              do
              {
                unsigned int v191 = v190;
                v190 += v187 + 1;
                uint64_t v192 = 2 * v187;
                uint64_t v187 = (2 * v187) | 1;
                uint64_t v193 = v192 + 2;
                if (v193 < v188 && *(float *)(*v190 + 16) < *(float *)(v190[1] + 16))
                {
                  ++v190;
                  uint64_t v187 = v193;
                }
                void *v191 = *v190;
              }
              while (v187 <= (uint64_t)((unint64_t)(v188 - 2) >> 1));
              uint64_t v194 = (void *)(v128 - 8);
              if (v190 == (void *)(v128 - 8))
              {
                *uint64_t v190 = v189;
              }
              else
              {
                *uint64_t v190 = *v194;
                *uint64_t v194 = v189;
                sub_25C16AB58((uint64_t)v180, (uint64_t)(v190 + 1), v190 + 1 - v180);
              }
            }
            *(void *)&long long v195 = v217;
            *((void *)&v195 + 1) = v179;
            long long v217 = v195;
            *(void *)&long long v138 = v215;
            uint64_t v128 = *((void *)&v215 + 1) - 8;
            *((void *)&v138 + 1) = *((void *)&v215 + 1) - 8;
            if (++v137 == v207)
            {
              if (v180) {
                goto LABEL_257;
              }
              goto LABEL_258;
            }
          }
        }
        uint64_t v216 = 0;
        long long v217 = 0u;
        uint64_t v180 = (void *)v214;
        if ((void)v214) {
LABEL_257:
        }
          operator delete(v180);
LABEL_258:
        long long v196 = v227;
        long long v227 = *(_OWORD *)&v231[8];
        *(_OWORD *)&v231[8] = v196;
        uint64_t v197 = v228[0];
        v228[0] = *(void *)&v231[24];
        *(void *)&v231[24] = v197;
        long long v198 = *(_OWORD *)&v228[1];
        *(_OWORD *)&v228[1] = *(_OWORD *)&v231[32];
        *(_OWORD *)&v231[32] = v198;
        uint64_t v199 = v229;
        uint64_t v229 = v232;
        uint64_t v232 = v199;
        sub_25C138888((uint64_t)v218);
        sub_25C16ABC0(v231);
        uint64_t v7 = v211;
      }
      if (v208) {
        operator delete(v208);
      }
      if (v221[0])
      {
        v221[1] = v221[0];
        operator delete(v221[0]);
      }
      if (v222[0])
      {
        v222[1] = v222[0];
        operator delete(v222[0]);
      }
    }
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if ((void)v217) {
    operator delete((void *)v217);
  }
  sub_25C16ABC0(&v226);
}

void sub_25C16A2E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, long long a19, uint64_t a20,uint64_t a21,long long a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30,uint64_t a31,void *a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,void *a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43)
{
  if (__p) {
    operator delete(__p);
  }
  if (a32) {
    operator delete(a32);
  }
  if (a39) {
    operator delete(a39);
  }
  *(void *)(v44 - 224) = v43;
  sub_25C1374B8((void ***)(v44 - 224));
  if ((void)a22) {
    operator delete((void *)a22);
  }
  sub_25C16ABC0(&a43);
  _Unwind_Resume(a1);
}

uint64_t sub_25C16A48C(uint64_t *a1, long long **a2, _DWORD *a3)
{
  uint64_t v3 = (a1[1] - *a1) >> 5;
  unint64_t v4 = v3 + 1;
  if ((unint64_t)(v3 + 1) >> 59) {
    sub_25C137658();
  }
  unint64_t v8 = a1 + 2;
  uint64_t v9 = a1[2] - *a1;
  if (v9 >> 4 > v4) {
    unint64_t v4 = v9 >> 4;
  }
  if ((unint64_t)v9 >= 0x7FFFFFFFFFFFFFE0) {
    unint64_t v10 = 0x7FFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v10 = v4;
  }
  uint64_t v18 = v8;
  if (v10) {
    unint64_t v10 = (unint64_t)sub_25C15ED7C(v10);
  }
  else {
    uint64_t v11 = 0;
  }
  unint64_t v12 = v10 + 32 * v3;
  v15[0] = v10;
  v15[1] = v12;
  unint64_t v16 = v12;
  unint64_t v17 = v10 + 32 * v11;
  *(void *)unint64_t v12 = 0;
  *(void *)(v12 + 8) = 0;
  *(void *)(v12 + 16) = 0;
  sub_25C137548((void *)v12, *a2, a2[1], 0xAAAAAAAAAAAAAAABLL * (((char *)a2[1] - (char *)*a2) >> 3));
  *(_DWORD *)(v12 + 24) = *a3;
  v16 += 32;
  sub_25C15EE30(a1, v15);
  uint64_t v13 = a1[1];
  sub_25C15EEC4((uint64_t)v15);
  return v13;
}

void sub_25C16A584(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_25C15EEC4((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_25C16A5A8(unint64_t *a1, void *a2, float a3)
{
  if ((int)(((a2[4] - a2[3]) >> 3) - 1) <= 0)
  {
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
  else
  {
    unsigned int v5 = a2;
    unint64_t v6 = a2[16] + a2[17] * a2[18];
    LODWORD(v48[0]) = 0;
    sub_25C15D59C(__p, v6, v48);
    sub_25C167448((uint64_t *)v48, v5, a3);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    *(_OWORD *)long long __p = *(_OWORD *)v48;
    uint64_t v51 = v49;
    uint64_t v45 = sub_25C16CE20();
    uint64_t v7 = 0;
    unint64_t v8 = 0;
    int v9 = ((v5[4] - v5[3]) >> 3) - 1;
    uint64_t v10 = **(void **)(v5[6] + 24 * (v9 & ~(v9 >> 31)));
    float v11 = *((float *)__p[0] + *(unsigned int *)(v10 + 24));
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
    uint64_t v46 = v5;
    uint64_t v47 = a1;
    do
    {
      unint64_t v12 = (uint64_t *)(v5[9] + 24 * *(unsigned int *)(v10 + 16));
      uint64_t v13 = *v12;
      uint64_t v14 = v12[1];
      uint64_t v15 = v7;
      while (v13 != v14)
      {
        float v16 = exp((float)((float)(*((float *)__p[0] + *(unsigned int *)(*(void *)v13 + 24))
                                + (float)(a3 * *(float *)(*(void *)v13 + 32)))
                        - v11));
        if ((unint64_t)v15 >= v8)
        {
          uint64_t v18 = v15 - v7;
          unint64_t v19 = v18 + 1;
          if ((unint64_t)(v18 + 1) >> 62) {
            sub_25C137658();
          }
          if ((uint64_t)(v8 - (void)v7) >> 1 > v19) {
            unint64_t v19 = (uint64_t)(v8 - (void)v7) >> 1;
          }
          if (v8 - (unint64_t)v7 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v20 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v20 = v19;
          }
          if (v20) {
            unint64_t v20 = (unint64_t)sub_25C13C324(v20);
          }
          else {
            uint64_t v21 = 0;
          }
          int v22 = (float *)(v20 + 4 * v18);
          *int v22 = v16;
          unint64_t v17 = v22 + 1;
          while (v15 != v7)
          {
            int v23 = *((_DWORD *)v15-- - 1);
            *((_DWORD *)v22-- - 1) = v23;
          }
          unint64_t v8 = v20 + 4 * v21;
          if (v7) {
            operator delete(v7);
          }
          uint64_t v7 = v22;
        }
        else
        {
          *uint64_t v15 = v16;
          unint64_t v17 = v15 + 1;
        }
        v13 += 8;
        uint64_t v15 = v17;
      }
      sub_25C15D638((double **)v48, v7, v15);
      unsigned int v24 = *(_DWORD *)(v10 + 16);
      unsigned int v5 = v46;
      uint64_t v25 = v46[9];
      uint64_t v10 = *(void *)(*(void *)(v25 + 24 * v24) + 8 * (int)sub_25C15D868(v45, (double **)v48));
      uint64_t v26 = **(void **)v46[9];
      uint64_t v27 = v47;
      if (v10 != v26)
      {
        float v11 = *((float *)__p[0] + *(unsigned int *)(v10 + 24));
        unint64_t v29 = (void *)v47[1];
        unint64_t v28 = v47[2];
        if ((unint64_t)v29 >= v28)
        {
          uint64_t v31 = (void *)*v47;
          uint64_t v32 = (uint64_t)((uint64_t)v29 - *v47) >> 3;
          unint64_t v33 = v32 + 1;
          if ((unint64_t)(v32 + 1) >> 61) {
            sub_25C137658();
          }
          uint64_t v34 = v28 - (void)v31;
          if (v34 >> 2 > v33) {
            unint64_t v33 = v34 >> 2;
          }
          if ((unint64_t)v34 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v35 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v35 = v33;
          }
          if (v35) {
            unint64_t v35 = (unint64_t)sub_25C13C374(v35);
          }
          else {
            uint64_t v36 = 0;
          }
          BOOL v37 = (void *)(v35 + 8 * v32);
          void *v37 = v10;
          uint64_t v30 = v37 + 1;
          if (v29 == v31)
          {
            uint64_t v27 = v47;
          }
          else
          {
            do
            {
              uint64_t v38 = *--v29;
              *--BOOL v37 = v38;
            }
            while (v29 != v31);
            uint64_t v27 = v47;
            unint64_t v29 = (void *)*v47;
          }
          unint64_t *v27 = (unint64_t)v37;
          v27[1] = (unint64_t)v30;
          _OWORD v27[2] = v35 + 8 * v36;
          unsigned int v5 = v46;
          if (v29) {
            operator delete(v29);
          }
        }
        else
        {
          *unint64_t v29 = v10;
          uint64_t v30 = v29 + 1;
        }
        v27[1] = (unint64_t)v30;
      }
      if (v48[0])
      {
        v48[1] = v48[0];
        operator delete(v48[0]);
      }
    }
    while (v10 != v26);
    unint64_t v40 = *v27;
    unint64_t v39 = v27[1];
    if (*v27 != v39)
    {
      unint64_t v41 = (void *)(v39 - 8);
      if ((unint64_t)v41 > v40)
      {
        unint64_t v42 = v40 + 8;
        do
        {
          uint64_t v43 = *(void *)(v42 - 8);
          *(void *)(v42 - 8) = *v41;
          *v41-- = v43;
          BOOL v44 = v42 >= (unint64_t)v41;
          v42 += 8;
        }
        while (!v44);
      }
    }
    if (v7) {
      operator delete(v7);
    }
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
  }
}

void sub_25C16A934(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

char *sub_25C16A9A8(void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_25C137658();
  }
  uint64_t result = (char *)sub_25C13C374(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

uint64_t sub_25C16A9E8(void *a1)
{
  uint64_t v2 = a1[5];
  unint64_t v3 = a1[6];
  unint64_t v4 = a1[4];
  if (v4 >= v3)
  {
    unint64_t v4 = 0;
    ++v2;
    a1[4] = 0;
    a1[5] = v2;
  }
  uint64_t v5 = a1[1];
  if (v2 == (a1[2] - v5) >> 3)
  {
    is_mul_ok(v3, 0x18uLL);
    operator new[]();
  }
  uint64_t result = *(void *)(v5 + 8 * v2) + 24 * v4;
  a1[4] = v4 + 1;
  return result;
}

uint64_t sub_25C16AB58(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3 >= 2)
  {
    unint64_t v3 = (unint64_t)(a3 - 2) >> 1;
    unint64_t v4 = (void *)(result + 8 * v3);
    uint64_t v5 = *v4;
    uint64_t v8 = *(void *)(a2 - 8);
    unint64_t v6 = (void *)(a2 - 8);
    uint64_t v7 = v8;
    float v9 = *(float *)(v8 + 16);
    if (*(float *)(*v4 + 16) < v9)
    {
      do
      {
        uint64_t v10 = v4;
        *unint64_t v6 = v5;
        if (!v3) {
          break;
        }
        unint64_t v3 = (v3 - 1) >> 1;
        unint64_t v4 = (void *)(result + 8 * v3);
        uint64_t v5 = *v4;
        unint64_t v6 = v10;
      }
      while (*(float *)(*v4 + 16) < v9);
      void *v10 = v7;
    }
  }
  return result;
}

void *sub_25C16ABC0(void *a1)
{
  *a1 = &unk_270989DC8;
  uint64_t v2 = (void *)a1[1];
  unint64_t v3 = (void *)a1[2];
  if (v2 != v3)
  {
    do
    {
      if (*v2) {
        MEMORY[0x26117F470](*v2, 0x1020C8062D53EE8);
      }
      ++v2;
    }
    while (v2 != v3);
    uint64_t v2 = (void *)a1[1];
  }
  if (v2)
  {
    a1[2] = v2;
    operator delete(v2);
  }
  return a1;
}

void sub_25C16AC60(void *a1)
{
  sub_25C16ABC0(a1);

  JUMPOUT(0x26117F4A0);
}

void *sub_25C16AC98(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    unint64_t v6 = result;
    uint64_t result = sub_25C16A9A8(result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_25C16ACF8(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_25C16AD1C(uint64_t a1@<X0>, unsigned __int8 *a2@<X1>, uint64_t a3@<X2>, char **a4@<X8>, float a5@<S0>)
{
  (*(void (**)(void **__return_ptr))(*(void *)a1 + 16))(&v29);
  uint64_t v10 = (uint64_t)v29;
  if (v29)
  {
    unint64_t v29 = 0;
    sub_25C13D850(v10);
LABEL_3:
    *a4 = 0;
    a4[1] = 0;
    a4[2] = 0;
    return;
  }
  if (!a3) {
    goto LABEL_3;
  }
  unint64_t v29 = &unk_270989F00;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v35 = 0;
  uint64_t v36 = &unk_270989DE8;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v39 = 0;
  uint64_t v40 = 1024;
  sub_25C166C30((uint64_t)&v29, a2, a3);
  sub_25C1670B4(a1, &v29);
  *a4 = 0;
  a4[1] = 0;
  a4[2] = 0;
  sub_25C16A5A8((unint64_t *)&v27, &v29, a5);
  float v11 = v27;
  unint64_t v12 = v28;
  if (v27 != v28)
  {
    uint64_t v13 = 0;
    do
    {
      uint64_t v14 = *v11;
      unint64_t v15 = (unint64_t)a4[2];
      if ((unint64_t)v13 >= v15)
      {
        unint64_t v17 = *a4;
        unint64_t v18 = 0xAAAAAAAAAAAAAAABLL * ((v13 - *a4) >> 3);
        unint64_t v19 = v18 + 1;
        if (v18 + 1 > 0xAAAAAAAAAAAAAAALL) {
          sub_25C137658();
        }
        unint64_t v20 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v15 - (void)v17) >> 3);
        if (2 * v20 > v19) {
          unint64_t v19 = 2 * v20;
        }
        if (v20 >= 0x555555555555555) {
          unint64_t v21 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v21 = v19;
        }
        int v22 = (char *)sub_25C137670(v21);
        unsigned int v24 = &v22[24 * v18];
        *(_OWORD *)unsigned int v24 = *(_OWORD *)v14;
        *((_DWORD *)v24 + 4) = *(_DWORD *)(v14 + 28);
        uint64_t v25 = v24;
        if (v13 != v17)
        {
          do
          {
            long long v26 = *(_OWORD *)(v13 - 24);
            *((void *)v25 - 1) = *((void *)v13 - 1);
            *(_OWORD *)(v25 - 24) = v26;
            v25 -= 24;
            v13 -= 24;
          }
          while (v13 != v17);
          uint64_t v13 = v17;
        }
        float v16 = v24 + 24;
        *a4 = v25;
        a4[1] = v24 + 24;
        a4[2] = &v22[24 * v23];
        if (v13) {
          operator delete(v13);
        }
      }
      else
      {
        *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
        *((_DWORD *)v13 + 4) = *(_DWORD *)(v14 + 28);
        float v16 = v13 + 24;
      }
      a4[1] = v16;
      ++v11;
      uint64_t v13 = v16;
    }
    while (v11 != v12);
    float v11 = v27;
  }
  if (v11) {
    operator delete(v11);
  }
  sub_25C1662D0((uint64_t)&v29);
}

void sub_25C16AF90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, char a13)
{
}

void sub_25C16AFD0(uint64_t a1@<X0>, unsigned __int8 *a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t *a5@<X8>)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  (*(void (**)(void **__return_ptr))(*(void *)a1 + 16))(__p);
  uint64_t v10 = __p[0];
  if (__p[0])
  {
    __p[0] = 0;
    sub_25C13D850((uint64_t)v10);
LABEL_3:
    memset(__p, 0, 28);
    a5[1] = 0;
    a5[2] = 0;
    *a5 = 0;
    *(void *)&long long v47 = a5;
    BYTE8(v47) = 0;
    float v11 = (char *)operator new(0x20uLL);
    *a5 = (uint64_t)v11;
    a5[1] = (uint64_t)v11;
    a5[2] = (uint64_t)(v11 + 32);
    a5[1] = sub_25C1373F0((uint64_t)(a5 + 2), (uint64_t)__p, (uint64_t)&__p[4], (uint64_t)v11);
    unint64_t v12 = __p[0];
    if (!__p[0]) {
      return;
    }
    __p[1] = __p[0];
    goto LABEL_5;
  }
  if (!a3) {
    goto LABEL_3;
  }
  if (a4 >= 1024) {
    int v13 = 1024;
  }
  else {
    int v13 = a4;
  }
  if (v13 <= 1) {
    uint64_t v14 = 1;
  }
  else {
    uint64_t v14 = v13;
  }
  if (v14 > 1)
  {
    __p[0] = &unk_270989F00;
    memset(&__p[1], 0, 88);
    __p[12] = &unk_270989DE8;
    long long v52 = 0u;
    long long v53 = 0u;
    uint64_t v54 = 0;
    uint64_t v55 = 1024;
    sub_25C166C30((uint64_t)__p, a2, a3);
    sub_25C1670B4(a1, __p);
    *a5 = 0;
    a5[1] = 0;
    a5[2] = 0;
    uint64_t v43 = a5;
    sub_25C168E4C((void **)&v45, __p, v14, 0, 0.0);
    float v16 = v45;
    unint64_t v42 = v46;
    if (v45 != v46)
    {
      unint64_t v41 = a5 + 2;
      do
      {
        unint64_t v17 = (uint64_t *)*v16;
        unint64_t v18 = (uint64_t *)v16[1];
        BOOL v44 = v16;
        if ((uint64_t *)*v16 == v18)
        {
          unint64_t v19 = 0;
          unint64_t v20 = 0;
        }
        else
        {
          unint64_t v19 = 0;
          unint64_t v20 = 0;
          unint64_t v21 = 0;
          do
          {
            uint64_t v22 = *v17;
            if (v20 >= v21)
            {
              unint64_t v23 = 0xAAAAAAAAAAAAAAABLL * ((v20 - v19) >> 3) + 1;
              if (v23 > 0xAAAAAAAAAAAAAAALL) {
                sub_25C137658();
              }
              if (0x5555555555555556 * ((v21 - v19) >> 3) > v23) {
                unint64_t v23 = 0x5555555555555556 * ((v21 - v19) >> 3);
              }
              if (0xAAAAAAAAAAAAAAABLL * ((v21 - v19) >> 3) >= 0x555555555555555) {
                unint64_t v24 = 0xAAAAAAAAAAAAAAALL;
              }
              else {
                unint64_t v24 = v23;
              }
              uint64_t v25 = (char *)sub_25C137670(v24);
              uint64_t v27 = &v25[8 * ((v20 - v19) >> 3)];
              *(_OWORD *)uint64_t v27 = *(_OWORD *)v22;
              *((_DWORD *)v27 + 4) = *(_DWORD *)(v22 + 28);
              if (v20 == v19)
              {
                unint64_t v29 = &v25[8 * ((v20 - v19) >> 3)];
              }
              else
              {
                unint64_t v28 = &v25[8 * ((v20 - v19) >> 3)];
                do
                {
                  unint64_t v29 = v28 - 24;
                  long long v30 = *(_OWORD *)(v20 - 24);
                  *((void *)v28 - 1) = *((void *)v20 - 1);
                  *(_OWORD *)(v28 - 24) = v30;
                  v20 -= 24;
                  v28 -= 24;
                }
                while (v20 != v19);
              }
              unint64_t v21 = &v25[24 * v26];
              unint64_t v20 = v27 + 24;
              if (v19) {
                operator delete(v19);
              }
              unint64_t v19 = v29;
            }
            else
            {
              *(_OWORD *)unint64_t v20 = *(_OWORD *)v22;
              *((_DWORD *)v20 + 4) = *(_DWORD *)(v22 + 28);
              v20 += 24;
            }
            ++v17;
          }
          while (v17 != v18);
        }
        unint64_t v32 = v43[1];
        unint64_t v31 = v43[2];
        if (v32 >= v31)
        {
          uint64_t v35 = (uint64_t)(v32 - *v43) >> 5;
          if ((unint64_t)(v35 + 1) >> 59) {
            sub_25C137658();
          }
          uint64_t v36 = v31 - *v43;
          uint64_t v37 = v36 >> 4;
          if (v36 >> 4 <= (unint64_t)(v35 + 1)) {
            uint64_t v37 = v35 + 1;
          }
          if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFE0) {
            unint64_t v38 = 0x7FFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v38 = v37;
          }
          uint64_t v50 = v41;
          if (v38) {
            unint64_t v38 = (unint64_t)sub_25C15ED7C(v38);
          }
          else {
            uint64_t v39 = 0;
          }
          uint64_t v40 = (char *)(v38 + 32 * v35);
          *(void *)&long long v47 = v38;
          *((void *)&v47 + 1) = v40;
          unint64_t v48 = v40;
          unint64_t v49 = v38 + 32 * v39;
          *(void *)uint64_t v40 = 0;
          *((void *)v40 + 1) = 0;
          *((void *)v40 + 2) = 0;
          sub_25C137548(v40, (long long *)v19, (long long *)v20, 0xAAAAAAAAAAAAAAABLL * ((v20 - v19) >> 3));
          long long v33 = v44;
          *((_DWORD *)v40 + 6) = *((_DWORD *)v44 + 6);
          v48 += 32;
          sub_25C15EE30(v43, &v47);
          uint64_t v34 = v43[1];
          sub_25C15EEC4((uint64_t)&v47);
        }
        else
        {
          *(void *)unint64_t v32 = 0;
          *(void *)(v32 + 8) = 0;
          *(void *)(v32 + 16) = 0;
          sub_25C137548((void *)v32, (long long *)v19, (long long *)v20, 0xAAAAAAAAAAAAAAABLL * ((v20 - v19) >> 3));
          long long v33 = v44;
          *(_DWORD *)(v32 + 24) = *((_DWORD *)v44 + 6);
          uint64_t v34 = v32 + 32;
          v43[1] = v32 + 32;
        }
        v43[1] = v34;
        if (v19) {
          operator delete(v19);
        }
        float v16 = v33 + 4;
      }
      while (v16 != v42);
    }
    *(void *)&long long v47 = &v45;
    sub_25C1374B8((void ***)&v47);
    sub_25C1662D0((uint64_t)__p);
  }
  else
  {
    (*(void (**)(long long *__return_ptr, uint64_t, unsigned __int8 *, uint64_t))(*(void *)a1 + 40))(&v47, a1, a2, a3);
    *(_OWORD *)long long __p = v47;
    __p[2] = v48;
    unint64_t v48 = 0;
    long long v47 = 0uLL;
    LODWORD(__p[3]) = 0;
    a5[1] = 0;
    a5[2] = 0;
    *a5 = 0;
    uint64_t v45 = a5;
    LOBYTE(v46) = 0;
    unint64_t v15 = (char *)operator new(0x20uLL);
    *a5 = (uint64_t)v15;
    a5[1] = (uint64_t)v15;
    a5[2] = (uint64_t)(v15 + 32);
    a5[1] = sub_25C1373F0((uint64_t)(a5 + 2), (uint64_t)__p, (uint64_t)&__p[4], (uint64_t)v15);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    unint64_t v12 = (void *)v47;
    if ((void)v47)
    {
      *((void *)&v47 + 1) = v47;
LABEL_5:
      operator delete(v12);
    }
  }
}

void sub_25C16B4E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *__p,uint64_t a24)
{
  a16 = a11;
  sub_25C1374B8((void ***)&a16);
  sub_25C1662D0((uint64_t)&__p);
  _Unwind_Resume(a1);
}

void sub_25C16B5D0(uint64_t a1@<X0>, unsigned __int8 *a2@<X1>, unint64_t a3@<X2>, char **a4@<X8>)
{
  if (!*(_DWORD *)(a1 + 140))
  {
    (*(void (**)(unsigned char *__return_ptr, uint64_t))(*(void *)a1 + 16))(v80, a1);
    uint64_t v8 = *(void *)v80;
    if (*(void *)v80) {
      goto LABEL_25;
    }
    if (!a3) {
      goto LABEL_26;
    }
    float v25 = *(float *)(a1 + 120);
    uint64_t v26 = (a3 << 32) + 0x100000000;
    if (a3 << 32 == 0xFFFFFFFF00000000)
    {
      unint64_t v29 = 0;
    }
    else
    {
      if (v26 < 0) {
        sub_25C137658();
      }
      uint64_t v27 = v26 >> 32;
      uint64_t v28 = 3 * v27;
      unint64_t v29 = (float *)operator new(12 * v27);
      long long v30 = v29;
      do
      {
        *(void *)long long v30 = 0xFFFFFFFFLL;
        v30[2] = NAN;
        v30 += 3;
      }
      while (v30 != &v29[v28]);
    }
    if ((int)a3 <= 0)
    {
      *a4 = 0;
      a4[1] = 0;
      a4[2] = 0;
    }
    else
    {
      int v31 = 0;
      do
      {
        float v32 = v29[3 * v31 + 1];
        int v33 = asc_25C171EB8[(unint64_t)a2[v31] >> 4];
        if ((int)a3 - v31 < v33) {
          int v33 = a3 - v31;
        }
        if ((int)a3 <= (unint64_t)v31) {
          goto LABEL_53;
        }
        uint64_t v34 = 0;
        char v35 = 0;
        uint64_t v36 = 0;
        uint64_t v37 = *(void *)(*(void *)(a1 + 128) + 16);
        unint64_t v38 = (int *)&v29[3 * v31 + 5];
        do
        {
          int v39 = a2[v31 + v34];
          LODWORD(v36) = (*(_DWORD *)(v37 + 4 * v36) >> 10 << ((*(_DWORD *)(v37 + 4 * v36) >> 6) & 8)) ^ v36 ^ v39;
          unsigned int v40 = *(_DWORD *)(v37 + 4 * v36);
          if ((v40 & 0x800000FF) != v39) {
            break;
          }
          if ((v40 & 0x100) != 0)
          {
            uint64_t v41 = *(_DWORD *)(v37 + 4 * ((v40 >> 10 << ((v40 >> 6) & 8)) ^ v36)) & 0x7FFFFFFF;
            uint64_t v42 = *(void *)(*(void *)(*(void *)(a1 + 8) + 64) + 8 * v41 + 8);
            int v43 = *(_DWORD *)(v42 + 60);
            if (v43 != 5)
            {
              if (v43 == 4) {
                double v44 = (float)(*(float *)(a1 + 124) * (float)(unint64_t)(v34 + 1)) + -0.1;
              }
              else {
                double v44 = *(float *)(v42 + 56);
              }
              double v45 = v44 + v32;
              if (*v38 == -1 || v45 > *((float *)v38 - 1))
              {
                float v46 = v45;
                *((float *)v38 - 1) = v46;
                *unint64_t v38 = v31;
                *(v38 - 2) = v41;
              }
              v35 |= v33 - 1 == v34;
            }
          }
          ++v34;
          v38 += 3;
        }
        while ((int)a3 - (uint64_t)v31 != v34);
        if ((v35 & 1) == 0)
        {
LABEL_53:
          long long v47 = &v29[3 * v33 + 3 * v31];
          int v49 = *((_DWORD *)v47 + 2);
          unint64_t v48 = (int *)(v47 + 2);
          float v50 = (float)(v25 + -10.0) + v32;
          if (v49 == -1 || v50 > *((float *)v48 - 1))
          {
            *((float *)v48 - 1) = v50;
            *unint64_t v48 = v31;
            v29[3 * v33 + 3 * v31] = *(float *)(a1 + 104);
          }
        }
        v31 += v33;
      }
      while (v31 < (int)a3);
      long long v52 = 0;
      long long v53 = 0;
      uint64_t v54 = 0;
      *a4 = 0;
      a4[1] = 0;
      a4[2] = 0;
      unsigned int v55 = a3;
      uint64_t v77 = a4;
      do
      {
        uint64_t v56 = v29;
        unint64_t v57 = &v29[3 * v55];
        uint64_t v59 = (unsigned int *)(v57 + 2);
        unint64_t v58 = *((int *)v57 + 2);
        if (a3 < v58) {
          sub_25C15B5F8("string_view::substr");
        }
        int v60 = v55 - v58;
        unint64_t v61 = &a2[v58];
        if (a3 - v58 >= v60) {
          unint64_t v62 = v60;
        }
        else {
          unint64_t v62 = a3 - v58;
        }
        if (v52 >= v54)
        {
          unint64_t v63 = 0xAAAAAAAAAAAAAAABLL * ((v52 - v53) >> 3) + 1;
          if (v63 > 0xAAAAAAAAAAAAAAALL) {
            sub_25C137658();
          }
          if (0x5555555555555556 * ((v54 - v53) >> 3) > v63) {
            unint64_t v63 = 0x5555555555555556 * ((v54 - v53) >> 3);
          }
          if (0xAAAAAAAAAAAAAAABLL * ((v54 - v53) >> 3) >= 0x555555555555555) {
            unint64_t v64 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v64 = v63;
          }
          unint64_t v65 = (char *)sub_25C137670(v64);
          uint64_t v67 = &v65[8 * ((v52 - v53) >> 3)];
          *(void *)uint64_t v67 = v61;
          *((void *)v67 + 1) = v62;
          *((float *)v67 + 4) = *v57;
          if (v52 == v53)
          {
            uint64_t v70 = v52;
            long long v53 = &v65[8 * ((v52 - v53) >> 3)];
            unint64_t v29 = v56;
          }
          else
          {
            uint64_t v68 = &v65[8 * ((v52 - v53) >> 3)];
            unint64_t v29 = v56;
            do
            {
              long long v69 = *(_OWORD *)(v52 - 24);
              *((void *)v68 - 1) = *((void *)v52 - 1);
              *(_OWORD *)(v68 - 24) = v69;
              v68 -= 24;
              v52 -= 24;
            }
            while (v52 != v53);
            uint64_t v70 = v53;
            long long v53 = v68;
          }
          uint64_t v54 = &v65[24 * v66];
          long long v52 = v67 + 24;
          a4 = v77;
          char *v77 = v53;
          v77[1] = v67 + 24;
          v77[2] = v54;
          if (v70)
          {
            unint64_t v71 = &v65[24 * v66];
            operator delete(v70);
            uint64_t v54 = v71;
          }
        }
        else
        {
          *(void *)long long v52 = v61;
          *((void *)v52 + 1) = v62;
          *((float *)v52 + 4) = *v57;
          v52 += 24;
          unint64_t v29 = v56;
        }
        a4[1] = v52;
        unsigned int v55 = *v59;
      }
      while ((int)*v59 > 0);
      unint64_t v72 = (unint64_t)*a4;
      long long v73 = v52 - 24;
      if (*a4 == v52 || (unint64_t)v73 <= v72) {
        goto LABEL_89;
      }
      do
      {
        *(_OWORD *)std::string::size_type v80 = *(_OWORD *)v72;
        long long v75 = *(_OWORD *)v80;
        *(_OWORD *)unint64_t v72 = *(_OWORD *)v73;
        *(_OWORD *)long long v73 = v75;
        int v76 = *(_DWORD *)(v72 + 16);
        *(_DWORD *)(v72 + 16) = *((_DWORD *)v73 + 4);
        *((_DWORD *)v73 + 4) = v76;
        v72 += 24;
        v73 -= 24;
      }
      while (v72 < (unint64_t)v73);
    }
    if (!v29) {
      return;
    }
LABEL_89:
    operator delete(v29);
    return;
  }
  (*(void (**)(unsigned char *__return_ptr, uint64_t))(*(void *)a1 + 16))(v80, a1);
  uint64_t v8 = *(void *)v80;
  if (*(void *)v80)
  {
LABEL_25:
    *(void *)std::string::size_type v80 = 0;
    sub_25C13D850(v8);
    goto LABEL_26;
  }
  if (!a3)
  {
LABEL_26:
    *a4 = 0;
    a4[1] = 0;
    a4[2] = 0;
    return;
  }
  *(void *)std::string::size_type v80 = &unk_270989F00;
  memset(&v80[8], 0, 88);
  uint64_t v81 = &unk_270989DE8;
  long long v82 = 0u;
  long long v83 = 0u;
  uint64_t v84 = 0;
  uint64_t v85 = 1024;
  sub_25C166C30((uint64_t)v80, a2, a3);
  sub_25C1670B4(a1, v80);
  *a4 = 0;
  a4[1] = 0;
  a4[2] = 0;
  sub_25C168B1C((uint64_t)&v78, v80);
  float v9 = v78;
  uint64_t v10 = v79;
  if (v78 != v79)
  {
    float v11 = 0;
    do
    {
      uint64_t v12 = *v9;
      unint64_t v13 = (unint64_t)a4[2];
      if ((unint64_t)v11 >= v13)
      {
        unint64_t v15 = *a4;
        unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * ((v11 - *a4) >> 3);
        unint64_t v17 = v16 + 1;
        if (v16 + 1 > 0xAAAAAAAAAAAAAAALL) {
          sub_25C137658();
        }
        unint64_t v18 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v13 - (void)v15) >> 3);
        if (2 * v18 > v17) {
          unint64_t v17 = 2 * v18;
        }
        if (v18 >= 0x555555555555555) {
          unint64_t v19 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v19 = v17;
        }
        unint64_t v20 = (char *)sub_25C137670(v19);
        uint64_t v22 = &v20[24 * v16];
        *(_OWORD *)uint64_t v22 = *(_OWORD *)v12;
        *((_DWORD *)v22 + 4) = *(_DWORD *)(v12 + 28);
        unint64_t v23 = v22;
        if (v11 != v15)
        {
          do
          {
            long long v24 = *(_OWORD *)(v11 - 24);
            *((void *)v23 - 1) = *((void *)v11 - 1);
            *(_OWORD *)(v23 - 24) = v24;
            v23 -= 24;
            v11 -= 24;
          }
          while (v11 != v15);
          float v11 = v15;
        }
        uint64_t v14 = v22 + 24;
        *a4 = v23;
        a4[1] = v22 + 24;
        a4[2] = &v20[24 * v21];
        if (v11) {
          operator delete(v11);
        }
      }
      else
      {
        *(_OWORD *)float v11 = *(_OWORD *)v12;
        *((_DWORD *)v11 + 4) = *(_DWORD *)(v12 + 28);
        uint64_t v14 = v11 + 24;
      }
      a4[1] = v14;
      ++v9;
      float v11 = v14;
    }
    while (v9 != v10);
    float v9 = v78;
  }
  if (v9) {
    operator delete(v9);
  }
  sub_25C1662D0((uint64_t)v80);
}

void sub_25C16BC94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
}

void sub_25C16BD18(void *a1)
{
  sub_25C16BD50(a1);

  JUMPOUT(0x26117F4A0);
}

void *sub_25C16BD50(void *a1)
{
  *a1 = &unk_270989E28;
  uint64_t v2 = a1[16];
  a1[16] = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }

  return sub_25C147FF4(a1);
}

void sub_25C16BDD4(__n128 *a1, __n128 *a2, uint64_t a3, char a4)
{
  while (2)
  {
    uint64_t v10 = (__n128 *)((char *)a2 - 24);
    uint64_t v75 = (uint64_t)&a2[-3];
    uint64_t v77 = a2;
    uint64_t v11 = (uint64_t)&a2[-5].n128_i64[1];
    uint64_t v12 = a1;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          a1 = v12;
          uint64_t v13 = (char *)a2 - (char *)v12;
          unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * (((char *)a2 - (char *)v12) >> 3);
          if (v5 || !v4)
          {
            switch(v14)
            {
              case 0uLL:
              case 1uLL:
                return;
              case 2uLL:
                if (sub_25C16C6B4((uint64_t)v10, (uint64_t)a1))
                {
                  __n128 v80 = *a1;
                  *a1 = *v10;
                  __n128 *v10 = v80;
                  unsigned __int32 v33 = a1[1].n128_u32[0];
                  a1[1].n128_u32[0] = a2[-1].n128_u32[2];
                  a2[-1].n128_u32[2] = v33;
                }
                break;
              case 3uLL:
                sub_25C16C760((uint64_t)a1, (uint64_t)&a1[1].n128_i64[1], (uint64_t)v10);
                break;
              case 4uLL:
                sub_25C16C880(a1, (uint64_t)&a1[1].n128_i64[1], (uint64_t)&a1[3], (uint64_t)v10);
                break;
              case 5uLL:
                sub_25C16C950(a1, (uint64_t)&a1[1].n128_i64[1], (uint64_t)&a1[3], (uint64_t)&a1[4].n128_i64[1], (uint64_t)v10);
                break;
              default:
                JUMPOUT(0);
            }
            return;
          }
          if (v13 <= 575)
          {
            if (a4)
            {
              if (a1 != a2)
              {
                uint64_t v34 = (uint64_t)&a1[1].n128_i64[1];
                if (&a1[1].n128_i8[8] != (__int8 *)a2)
                {
                  uint64_t v35 = 0;
                  uint64_t v36 = (uint64_t)a1;
                  do
                  {
                    uint64_t v37 = v36;
                    uint64_t v36 = v34;
                    if (sub_25C16C6B4(v34, v37))
                    {
                      __n128 v38 = *(__n128 *)v36;
                      unint64_t v81 = *(void *)(v36 + 16);
                      __n128 v80 = v38;
                      uint64_t v39 = v35;
                      while (1)
                      {
                        unsigned int v40 = (char *)a1 + v39;
                        *(__n128 *)(v40 + 24) = *(__n128 *)((char *)a1 + v39);
                        *((_DWORD *)v40 + 1sub_25C163960(&a9, 0) = *(unsigned __int32 *)((char *)a1[1].n128_u32 + v39);
                        if (!v39) {
                          break;
                        }
                        v39 -= 24;
                        if (!sub_25C16C6B4((uint64_t)&v80, (uint64_t)a1 + v39))
                        {
                          uint64_t v41 = (uint64_t)&a1[1].n128_i64[1] + v39;
                          goto LABEL_75;
                        }
                      }
                      uint64_t v41 = (uint64_t)a1;
LABEL_75:
                      *(__n128 *)uint64_t v41 = v80;
                      *(_DWORD *)(v41 + 16) = v81;
                    }
                    uint64_t v34 = v36 + 24;
                    v35 += 24;
                  }
                  while ((__n128 *)(v36 + 24) != a2);
                }
              }
            }
            else if (a1 != a2)
            {
              uint64_t v68 = (uint64_t)&a1[1].n128_i64[1];
              if (&a1[1].n128_i8[8] != (__int8 *)a2)
              {
                long long v69 = &a1[-2].n128_i8[8];
                do
                {
                  uint64_t v70 = (uint64_t)a1;
                  a1 = (__n128 *)v68;
                  if (sub_25C16C6B4(v68, v70))
                  {
                    __n128 v71 = *a1;
                    unint64_t v81 = a1[1].n128_u64[0];
                    __n128 v80 = v71;
                    uint64_t v72 = (uint64_t)v69;
                    do
                    {
                      uint64_t v73 = v72;
                      *(_OWORD *)(v72 + 48) = *(_OWORD *)(v72 + 24);
                      *(_DWORD *)(v72 + 64) = *(_DWORD *)(v72 + 40);
                      BOOL v74 = sub_25C16C6B4((uint64_t)&v80, v72);
                      uint64_t v72 = v73 - 24;
                    }
                    while (v74);
                    *(__n128 *)(v73 + 24) = v80;
                    *(_DWORD *)(v73 + 4sub_25C163960(&a9, 0) = v81;
                  }
                  uint64_t v68 = (uint64_t)&a1[1].n128_i64[1];
                  v69 += 24;
                }
                while (&a1[1].n128_i8[8] != (__int8 *)a2);
              }
            }
            return;
          }
          if (!a3)
          {
            if (a1 != a2)
            {
              int64_t v42 = (v14 - 2) >> 1;
              int64_t v43 = v42;
              do
              {
                int64_t v44 = v43;
                if (v42 >= v43)
                {
                  uint64_t v45 = (2 * v43) | 1;
                  uint64_t v46 = (uint64_t)a1 + 24 * v45;
                  if (2 * v43 + 2 < (uint64_t)v14 && sub_25C16C6B4((uint64_t)a1 + 24 * v45, v46 + 24))
                  {
                    v46 += 24;
                    uint64_t v45 = 2 * v44 + 2;
                  }
                  uint64_t v47 = (uint64_t)a1 + 24 * v44;
                  if (!sub_25C16C6B4(v46, v47))
                  {
                    __n128 v48 = *(__n128 *)v47;
                    unint64_t v81 = *(void *)(v47 + 16);
                    __n128 v80 = v48;
                    do
                    {
                      int v49 = (__n128 *)v46;
                      *(_OWORD *)uint64_t v47 = *(_OWORD *)v46;
                      *(_DWORD *)(v47 + 16) = *(_DWORD *)(v46 + 16);
                      if (v42 < v45) {
                        break;
                      }
                      uint64_t v50 = (2 * v45) | 1;
                      uint64_t v46 = (uint64_t)a1 + 24 * v50;
                      uint64_t v51 = 2 * v45 + 2;
                      if (v51 < (uint64_t)v14 && sub_25C16C6B4((uint64_t)a1 + 24 * v50, v46 + 24))
                      {
                        v46 += 24;
                        uint64_t v50 = v51;
                      }
                      uint64_t v47 = (uint64_t)v49;
                      uint64_t v45 = v50;
                    }
                    while (!sub_25C16C6B4(v46, (uint64_t)&v80));
                    *int v49 = v80;
                    v49[1].n128_u32[0] = v81;
                  }
                }
                int64_t v43 = v44 - 1;
              }
              while (v44);
              int64_t v52 = v13 / 0x18uLL;
              long long v53 = v77;
              do
              {
                uint64_t v54 = 0;
                unsigned int v55 = v53;
                __n128 v79 = *a1;
                unsigned __int32 v76 = a1[1].n128_u32[0];
                uint64_t v56 = v52 - 2;
                if (v52 < 2) {
                  uint64_t v56 = v52 - 1;
                }
                uint64_t v57 = v56 >> 1;
                uint64_t v58 = (uint64_t)a1;
                do
                {
                  uint64_t v59 = v58 + 24 * v54 + 24;
                  uint64_t v60 = (2 * v54) | 1;
                  uint64_t v61 = 2 * v54 + 2;
                  if (v61 < v52 && sub_25C16C6B4(v58 + 24 * v54 + 24, v58 + 24 * v54 + 48))
                  {
                    v59 += 24;
                    uint64_t v60 = v61;
                  }
                  *(_OWORD *)uint64_t v58 = *(_OWORD *)v59;
                  *(_DWORD *)(v58 + 16) = *(_DWORD *)(v59 + 16);
                  uint64_t v58 = v59;
                  uint64_t v54 = v60;
                }
                while (v60 <= v57);
                long long v53 = (__n128 *)((char *)v55 - 24);
                if ((__int8 *)v59 == &v55[-2].n128_i8[8])
                {
                  *(__n128 *)uint64_t v59 = v79;
                  *(_DWORD *)(v59 + 16) = v76;
                }
                else
                {
                  *(__n128 *)uint64_t v59 = *v53;
                  *(_DWORD *)(v59 + 16) = v55[-1].n128_u32[2];
                  *long long v53 = v79;
                  v55[-1].n128_u32[2] = v76;
                  uint64_t v62 = v59 - (void)a1 + 24;
                  if (v62 >= 25)
                  {
                    unint64_t v63 = (unint64_t)(-2 - 0x5555555555555555 * (v62 >> 3)) >> 1;
                    uint64_t v64 = (uint64_t)a1 + 24 * v63;
                    if (sub_25C16C6B4(v64, v59))
                    {
                      __n128 v65 = *(__n128 *)v59;
                      unint64_t v81 = *(void *)(v59 + 16);
                      __n128 v80 = v65;
                      do
                      {
                        uint64_t v66 = (__n128 *)v64;
                        *(_OWORD *)uint64_t v59 = *(_OWORD *)v64;
                        *(_DWORD *)(v59 + 16) = *(_DWORD *)(v64 + 16);
                        if (!v63) {
                          break;
                        }
                        unint64_t v63 = (v63 - 1) >> 1;
                        uint64_t v64 = (uint64_t)a1 + 24 * v63;
                        uint64_t v59 = (uint64_t)v66;
                      }
                      while (sub_25C16C6B4(v64, (uint64_t)&v80));
                      __n128 *v66 = v80;
                      v66[1].n128_u32[0] = v81;
                    }
                  }
                }
              }
              while (v52-- > 2);
            }
            return;
          }
          unint64_t v15 = (__n128 *)((char *)a1 + 24 * (v14 >> 1));
          if ((unint64_t)v13 >= 0xC01)
          {
            sub_25C16C760((uint64_t)a1, (uint64_t)a1 + 24 * (v14 >> 1), (uint64_t)v10);
            unint64_t v16 = (char *)a1 + 24 * (v14 >> 1);
            sub_25C16C760((uint64_t)&a1[1].n128_i64[1], (uint64_t)(v16 - 24), v75);
            sub_25C16C760((uint64_t)&a1[3], (uint64_t)&a1[1].n128_i64[3 * (v14 >> 1) + 1], v11);
            sub_25C16C760((uint64_t)(v16 - 24), (uint64_t)v15, (uint64_t)&a1[1].n128_i64[3 * (v14 >> 1) + 1]);
            __n128 v80 = *a1;
            *a1 = *v15;
            *unint64_t v15 = v80;
            unsigned __int32 v17 = a1[1].n128_u32[0];
            a1[1].n128_u32[0] = *((_DWORD *)v16 + 4);
            *((_DWORD *)v16 + 4) = v17;
          }
          else
          {
            sub_25C16C760((uint64_t)a1 + 24 * (v14 >> 1), (uint64_t)a1, (uint64_t)v10);
          }
          --a3;
          if ((a4 & 1) != 0 || sub_25C16C6B4((uint64_t)&a1[-2].n128_i64[1], (uint64_t)a1)) {
            break;
          }
          __n128 v27 = *a1;
          unint64_t v81 = a1[1].n128_u64[0];
          __n128 v80 = v27;
          if (sub_25C16C6B4((uint64_t)&v80, (uint64_t)v10))
          {
            uint64_t v12 = a1;
            a2 = v77;
            do
              uint64_t v12 = (__n128 *)((char *)v12 + 24);
            while (!sub_25C16C6B4((uint64_t)&v80, (uint64_t)v12));
          }
          else
          {
            unint64_t v28 = (unint64_t)&a1[1].n128_u64[1];
            a2 = v77;
            do
            {
              uint64_t v12 = (__n128 *)v28;
              if (v28 >= (unint64_t)v77) {
                break;
              }
              BOOL v29 = sub_25C16C6B4((uint64_t)&v80, v28);
              unint64_t v28 = (unint64_t)&v12[1].n128_u64[1];
            }
            while (!v29);
          }
          unint64_t v30 = (unint64_t)a2;
          if (v12 < a2)
          {
            unint64_t v30 = (unint64_t)a2;
            do
              v30 -= 24;
            while (sub_25C16C6B4((uint64_t)&v80, v30));
          }
          while ((unint64_t)v12 < v30)
          {
            __n128 v78 = *v12;
            *uint64_t v12 = *(__n128 *)v30;
            *(__n128 *)unint64_t v30 = v78;
            unsigned __int32 v31 = v12[1].n128_u32[0];
            v12[1].n128_u32[0] = *(_DWORD *)(v30 + 16);
            *(_DWORD *)(v30 + 16) = v31;
            do
              uint64_t v12 = (__n128 *)((char *)v12 + 24);
            while (!sub_25C16C6B4((uint64_t)&v80, (uint64_t)v12));
            do
              v30 -= 24;
            while (sub_25C16C6B4((uint64_t)&v80, v30));
          }
          float v32 = (__n128 *)((char *)v12 - 24);
          BOOL v4 = &v12[-2].n128_i8[8] >= (__int8 *)a1;
          BOOL v5 = &v12[-2].n128_i8[8] == (__int8 *)a1;
          if (&v12[-2].n128_i8[8] != (__int8 *)a1)
          {
            *a1 = *v32;
            a1[1].n128_u32[0] = v12[-1].n128_u32[2];
          }
          a4 = 0;
          *float v32 = v80;
          v12[-1].n128_u32[2] = v81;
        }
        __n128 v18 = *a1;
        unint64_t v81 = a1[1].n128_u64[0];
        __n128 v80 = v18;
        unint64_t v19 = (unint64_t)a1;
        do
        {
          unint64_t v20 = (__n128 *)v19;
          v19 += 24;
        }
        while (sub_25C16C6B4(v19, (uint64_t)&v80));
        unint64_t v21 = (unint64_t)v77;
        if (v20 == a1)
        {
          unint64_t v21 = (unint64_t)v77;
          do
          {
            if (v19 >= v21) {
              break;
            }
            v21 -= 24;
          }
          while (!sub_25C16C6B4(v21, (uint64_t)&v80));
        }
        else
        {
          do
            v21 -= 24;
          while (!sub_25C16C6B4(v21, (uint64_t)&v80));
        }
        uint64_t v12 = (__n128 *)v19;
        if (v19 >= v21)
        {
          a2 = v77;
        }
        else
        {
          unint64_t v22 = v21;
          a2 = v77;
          do
          {
            __n128 v23 = *v12;
            *uint64_t v12 = *(__n128 *)v22;
            *(__n128 *)unint64_t v22 = v23;
            unsigned __int32 v24 = v12[1].n128_u32[0];
            v12[1].n128_u32[0] = *(_DWORD *)(v22 + 16);
            *(_DWORD *)(v22 + 16) = v24;
            do
              uint64_t v12 = (__n128 *)((char *)v12 + 24);
            while (sub_25C16C6B4((uint64_t)v12, (uint64_t)&v80));
            do
              v22 -= 24;
            while (!sub_25C16C6B4(v22, (uint64_t)&v80));
          }
          while ((unint64_t)v12 < v22);
        }
        float v25 = (__n128 *)((char *)v12 - 24);
        if (&v12[-2].n128_i8[8] != (__int8 *)a1)
        {
          *a1 = *v25;
          a1[1].n128_u32[0] = v12[-1].n128_u32[2];
        }
        *float v25 = v80;
        v12[-1].n128_u32[2] = v81;
        if (v19 >= v21) {
          break;
        }
LABEL_32:
        sub_25C16BDD4(a1, &v12[-2].n128_i8[8], a3, a4 & 1);
        a4 = 0;
      }
      BOOL v26 = sub_25C16CA5C(a1, (__n128 *)((char *)v12 - 24));
      if (sub_25C16CA5C(v12, a2)) {
        break;
      }
      if (!v26) {
        goto LABEL_32;
      }
    }
    a2 = (__n128 *)((char *)v12 - 24);
    if (!v26) {
      continue;
    }
    break;
  }
}

BOOL sub_25C16C6B4(uint64_t a1, uint64_t a2)
{
  BOOL v4 = *(const void **)a1;
  unint64_t v5 = *(void *)(a1 + 8);
  unint64_t v6 = *(const void **)a2;
  unint64_t v7 = *(void *)(a2 + 8);
  if (v7 >= v5) {
    size_t v8 = *(void *)(a1 + 8);
  }
  else {
    size_t v8 = *(void *)(a2 + 8);
  }
  int v9 = memcmp(*(const void **)a1, *(const void **)a2, v8);
  if (v9)
  {
    if (v9 < 0) {
      return 1;
    }
  }
  else if (v5 < v7)
  {
    return 1;
  }
  int v11 = memcmp(v6, v4, v8);
  if (v11)
  {
    if (v11 < 0) {
      return 0;
    }
  }
  else if (v7 < v5)
  {
    return 0;
  }
  return *(_DWORD *)(a1 + 16) < *(_DWORD *)(a2 + 16);
}

BOOL sub_25C16C760(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v6 = sub_25C16C6B4(a2, a1);
  BOOL result = sub_25C16C6B4(a3, a2);
  if (v6)
  {
    if (result)
    {
      size_t v8 = (int *)(a1 + 16);
      long long v9 = *(_OWORD *)a1;
      *(_OWORD *)a1 = *(_OWORD *)a3;
    }
    else
    {
      long long v14 = *(_OWORD *)a1;
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)a2 = v14;
      size_t v8 = (int *)(a2 + 16);
      int v15 = *(_DWORD *)(a1 + 16);
      *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
      *(_DWORD *)(a2 + 16) = v15;
      BOOL result = sub_25C16C6B4(a3, a2);
      if (!result) {
        return result;
      }
      long long v9 = *(_OWORD *)a2;
      *(_OWORD *)a2 = *(_OWORD *)a3;
    }
    *(_OWORD *)a3 = v9;
    uint64_t v12 = (int *)(a3 + 16);
    goto LABEL_10;
  }
  if (result)
  {
    long long v10 = *(_OWORD *)a2;
    *(_OWORD *)a2 = *(_OWORD *)a3;
    *(_OWORD *)a3 = v10;
    uint64_t v12 = (int *)(a2 + 16);
    int v11 = *(_DWORD *)(a2 + 16);
    *(_DWORD *)(a2 + 16) = *(_DWORD *)(a3 + 16);
    *(_DWORD *)(a3 + 16) = v11;
    BOOL result = sub_25C16C6B4(a2, a1);
    if (result)
    {
      long long v13 = *(_OWORD *)a1;
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)a2 = v13;
      size_t v8 = (int *)(a1 + 16);
LABEL_10:
      int v16 = *v8;
      *size_t v8 = *v12;
      *uint64_t v12 = v16;
    }
  }
  return result;
}

__n128 sub_25C16C880(__n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_25C16C760((uint64_t)a1, a2, a3);
  if (sub_25C16C6B4(a4, a3))
  {
    long long v9 = *(_OWORD *)a3;
    *(_OWORD *)a3 = *(_OWORD *)a4;
    *(_OWORD *)a4 = v9;
    int v10 = *(_DWORD *)(a3 + 16);
    *(_DWORD *)(a3 + 16) = *(_DWORD *)(a4 + 16);
    *(_DWORD *)(a4 + 16) = v10;
    if (sub_25C16C6B4(a3, a2))
    {
      __n128 v11 = *(__n128 *)a2;
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *(__n128 *)a3 = v11;
      int v12 = *(_DWORD *)(a2 + 16);
      *(_DWORD *)(a2 + 16) = *(_DWORD *)(a3 + 16);
      *(_DWORD *)(a3 + 16) = v12;
      if (sub_25C16C6B4(a2, (uint64_t)a1))
      {
        __n128 result = *a1;
        *a1 = *(__n128 *)a2;
        *(__n128 *)a2 = result;
        unsigned __int32 v13 = a1[1].n128_u32[0];
        a1[1].n128_u32[0] = *(_DWORD *)(a2 + 16);
        *(_DWORD *)(a2 + 16) = v13;
      }
    }
  }
  return result;
}

__n128 sub_25C16C950(__n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_25C16C880(a1, a2, a3, a4);
  if (sub_25C16C6B4(a5, a4))
  {
    long long v11 = *(_OWORD *)a4;
    *(_OWORD *)a4 = *(_OWORD *)a5;
    *(_OWORD *)a5 = v11;
    int v12 = *(_DWORD *)(a4 + 16);
    *(_DWORD *)(a4 + 16) = *(_DWORD *)(a5 + 16);
    *(_DWORD *)(a5 + 16) = v12;
    if (sub_25C16C6B4(a4, a3))
    {
      long long v13 = *(_OWORD *)a3;
      *(_OWORD *)a3 = *(_OWORD *)a4;
      *(_OWORD *)a4 = v13;
      int v14 = *(_DWORD *)(a3 + 16);
      *(_DWORD *)(a3 + 16) = *(_DWORD *)(a4 + 16);
      *(_DWORD *)(a4 + 16) = v14;
      if (sub_25C16C6B4(a3, a2))
      {
        __n128 v15 = *(__n128 *)a2;
        *(_OWORD *)a2 = *(_OWORD *)a3;
        *(__n128 *)a3 = v15;
        int v16 = *(_DWORD *)(a2 + 16);
        *(_DWORD *)(a2 + 16) = *(_DWORD *)(a3 + 16);
        *(_DWORD *)(a3 + 16) = v16;
        if (sub_25C16C6B4(a2, (uint64_t)a1))
        {
          __n128 result = *a1;
          *a1 = *(__n128 *)a2;
          *(__n128 *)a2 = result;
          unsigned __int32 v17 = a1[1].n128_u32[0];
          a1[1].n128_u32[0] = *(_DWORD *)(a2 + 16);
          *(_DWORD *)(a2 + 16) = v17;
        }
      }
    }
  }
  return result;
}

BOOL sub_25C16CA5C(__n128 *a1, __n128 *a2)
{
  uint64_t v4 = ((char *)a2 - (char *)a1) >> 3;
  BOOL result = 1;
  switch(0xAAAAAAAAAAAAAAABLL * v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      BOOL v6 = (__n128 *)((char *)a2 - 24);
      if (sub_25C16C6B4((uint64_t)&a2[-2].n128_i64[1], (uint64_t)a1))
      {
        __n128 v7 = *a1;
        *a1 = *v6;
        *BOOL v6 = v7;
        unsigned __int32 v8 = a1[1].n128_u32[0];
        a1[1].n128_u32[0] = a2[-1].n128_u32[2];
        a2[-1].n128_u32[2] = v8;
      }
      return 1;
    case 3uLL:
      sub_25C16C760((uint64_t)a1, (uint64_t)&a1[1].n128_i64[1], (uint64_t)&a2[-2].n128_i64[1]);
      return 1;
    case 4uLL:
      sub_25C16C880(a1, (uint64_t)&a1[1].n128_i64[1], (uint64_t)&a1[3], (uint64_t)&a2[-2].n128_i64[1]);
      return 1;
    case 5uLL:
      sub_25C16C950(a1, (uint64_t)&a1[1].n128_i64[1], (uint64_t)&a1[3], (uint64_t)&a1[4].n128_i64[1], (uint64_t)&a2[-2].n128_i64[1]);
      return 1;
    default:
      uint64_t v9 = (uint64_t)&a1[3];
      sub_25C16C760((uint64_t)a1, (uint64_t)&a1[1].n128_i64[1], (uint64_t)&a1[3]);
      uint64_t v10 = (uint64_t)&a1[4].n128_i64[1];
      if (&a1[4].n128_i8[8] == (__int8 *)a2) {
        return 1;
      }
      uint64_t v11 = 0;
      int v12 = 0;
      break;
  }
  while (1)
  {
    if (sub_25C16C6B4(v10, v9))
    {
      long long v16 = *(_OWORD *)v10;
      uint64_t v17 = *(void *)(v10 + 16);
      uint64_t v13 = v11;
      while (1)
      {
        int v14 = (char *)a1 + v13;
        *(__n128 *)(v14 + 72) = *(__n128 *)((char *)a1 + v13 + 48);
        *((_DWORD *)v14 + 22) = *(unsigned __int32 *)((char *)a1[4].n128_u32 + v13);
        if (v13 == -48) {
          break;
        }
        v13 -= 24;
        if (!sub_25C16C6B4((uint64_t)&v16, (uint64_t)(v14 + 24)))
        {
          uint64_t v15 = (uint64_t)&a1[4].n128_i64[1] + v13;
          goto LABEL_12;
        }
      }
      uint64_t v15 = (uint64_t)a1;
LABEL_12:
      *(_OWORD *)uint64_t v15 = v16;
      *(_DWORD *)(v15 + 16) = v17;
      if (++v12 == 8) {
        return v10 + 24 == (void)a2;
      }
    }
    uint64_t v9 = v10;
    v11 += 24;
    v10 += 24;
    if ((__n128 *)v10 == a2) {
      return 1;
    }
  }
}

uint64_t sub_25C16CC44()
{
  sub_25C13C824(&__token, "/dev/urandom");
  std::random_device::random_device(&v2, &__token);
  if (SHIBYTE(__token.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__token.__r_.__value_.__l.__data_);
  }
  uint64_t v0 = MEMORY[0x26117F360](&v2);
  std::random_device::~random_device(&v2);
  return v0;
}

void sub_25C16CCAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, int a9, std::random_device a10, std::random_device __p, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
}

uint64_t sub_25C16CCD8(unsigned __int8 *a1, uint64_t a2, uint64_t *a3)
{
  int v3 = (char)*a1;
  if ((v3 & 0x80000000) == 0)
  {
    *a3 = 1;
    return *a1;
  }
  unint64_t v5 = a2 - (void)a1;
  if ((unint64_t)(a2 - (void)a1) >= 2)
  {
    if ((v3 & 0xE0) == 0xC0)
    {
      char v6 = a1[1];
      if (v6 <= -65)
      {
        uint64_t result = v6 & 0x3F | ((v3 & 0x1F) << 6);
        if (result >= 0x80)
        {
          uint64_t v7 = 2;
LABEL_8:
          *a3 = v7;
          return result;
        }
      }
    }
    else if (v5 >= 3)
    {
      if ((v3 & 0xF0) == 0xE0)
      {
        int v8 = (char)a1[1];
        if (v8 <= -65)
        {
          char v9 = a1[2];
          if (v9 <= -65)
          {
            uint64_t result = v9 & 0x3F | ((v8 & 0x3F) << 6) & 0xFFF | ((v3 & 0xF) << 12);
            if (result >= 0x800
              && (((v3 & 0xF) << 12) - 57344 < 0x102000u || result >> 11 <= 0x1A))
            {
              uint64_t v7 = 3;
              goto LABEL_8;
            }
          }
        }
      }
      else if (v5 >= 4 && (v3 & 0xF8) == 0xF0)
      {
        int v10 = (char)a1[1];
        if (v10 <= -65)
        {
          int v11 = (char)a1[2];
          if (v11 <= -65)
          {
            char v12 = a1[3];
            if (v12 <= -65)
            {
              int v13 = ((v3 & 7) << 18) | ((v10 & 0x3F) << 12);
              uint64_t result = v12 & 0x3F | ((v11 & 0x3F) << 6) | v13;
              if (result >= 0x10000 && (v13 - 57344) < 0x102000)
              {
                uint64_t v7 = 4;
                goto LABEL_8;
              }
            }
          }
        }
      }
    }
  }
  *a3 = 1;
  return 65533;
}

uint64_t sub_25C16CE20()
{
  uint64_t v0 = off_26BC5FA00;
  if ((*(unsigned char *)off_26BC5FA00(&off_26BC5FA00) & 1) == 0)
  {
    sub_25C16CC44();
    std::random_device v2 = (_DWORD *)off_26BC5F9E8(&off_26BC5F9E8);
    _DWORD *v2 = v4;
    do
    {
      uint64_t v5 = v3(&off_26BC5F9E8);
      *(_DWORD *)(v5 + 4 * v7) = v6;
    }
    while (v7 != 623);
    *(void *)(v3(&off_26BC5F9E8) + 2496) = 0;
    *(unsigned char *)v0(&off_26BC5FA0sub_25C163960(&a9, 0) = 1;
  }
  return off_26BC5F9E8(&off_26BC5F9E8);
}

void sub_25C16CED8(uint64_t a1@<X0>, unsigned __int8 *a2@<X1>, uint64_t a3@<X2>, void **a4@<X8>)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 16))(&v40);
  uint64_t v8 = v40;
  if (v40)
  {
    uint64_t v40 = 0;
    sub_25C13D850(v8);
LABEL_3:
    *a4 = 0;
    a4[1] = 0;
    a4[2] = 0;
    return;
  }
  if (!a3) {
    goto LABEL_3;
  }
  *a4 = 0;
  a4[1] = 0;
  a4[2] = 0;
  if (a3 < 1) {
    return;
  }
  char v9 = 0;
  int v10 = 0;
  int v11 = 0;
  unint64_t v12 = (unint64_t)&a2[a3];
  int v13 = a2;
  uint64_t v39 = a4;
  do
  {
    int v14 = asc_25C171EB8[(unint64_t)*v13 >> 4];
    if ((int)v12 - (int)v13 < v14) {
      int v14 = v12 - v13;
    }
    uint64_t v15 = v14;
    if (v14 == 3)
    {
      int v16 = memcmp(v13, &unk_25C16E0C1, 3uLL);
      if (v13 != a2 && v16) {
        goto LABEL_31;
      }
    }
    else if (v13 != a2)
    {
      goto LABEL_31;
    }
    if (v10 >= v11)
    {
      uint64_t v17 = (v10 - v9) >> 4;
      unint64_t v18 = v17 + 1;
      if ((unint64_t)(v17 + 1) >> 60) {
        sub_25C137658();
      }
      if ((v11 - v9) >> 3 > v18) {
        unint64_t v18 = (v11 - v9) >> 3;
      }
      if ((unint64_t)(v11 - v9) >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v19 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v19 = v18;
      }
      unint64_t v20 = (char *)sub_25C13CA74(v19);
      unint64_t v22 = (unsigned __int8 **)&v20[16 * v17];
      *unint64_t v22 = v13;
      v22[1] = 0;
      if (v10 == v9)
      {
        unsigned __int32 v24 = &v20[16 * v17];
      }
      else
      {
        __n128 v23 = &v20[16 * v17];
        do
        {
          unsigned __int32 v24 = v23 - 16;
          *((_OWORD *)v23 - 1) = *((_OWORD *)v10 - 1);
          v10 -= 16;
          v23 -= 16;
        }
        while (v10 != v9);
      }
      int v11 = &v20[16 * v21];
      int v10 = (char *)(v22 + 2);
      if (v9) {
        operator delete(v9);
      }
      char v9 = v24;
      a4 = v39;
    }
    else
    {
      *(void *)int v10 = v13;
      *((void *)v10 + 1) = 0;
      v10 += 16;
    }
LABEL_31:
    *((void *)v10 - 1) += v15;
    v13 += v15;
  }
  while ((unint64_t)v13 < v12);
  if (v9 != v10)
  {
    BOOL v26 = (char *)a4[1];
    float v25 = (char *)a4[2];
    __n128 v27 = v9;
    unint64_t v28 = (char *)*a4;
    do
    {
      int v29 = (*(uint64_t (**)(uint64_t, void, void))(*(void *)a1 + 112))(a1, *(void *)v27, *((void *)v27 + 1));
      int v30 = v29;
      if (v26 >= v25)
      {
        unint64_t v31 = 0xAAAAAAAAAAAAAAABLL * ((v26 - v28) >> 3) + 1;
        if (v31 > 0xAAAAAAAAAAAAAAALL) {
          sub_25C137658();
        }
        if (0x5555555555555556 * ((v25 - v28) >> 3) > v31) {
          unint64_t v31 = 0x5555555555555556 * ((v25 - v28) >> 3);
        }
        if (0xAAAAAAAAAAAAAAABLL * ((v25 - v28) >> 3) >= 0x555555555555555) {
          unint64_t v32 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v32 = v31;
        }
        unsigned __int32 v33 = (char *)sub_25C137670(v32);
        uint64_t v35 = &v33[8 * ((v26 - v28) >> 3)];
        *(_OWORD *)uint64_t v35 = *(_OWORD *)v27;
        *((_DWORD *)v35 + 4) = v30;
        if (v26 == v28)
        {
          uint64_t v37 = &v33[8 * ((v26 - v28) >> 3)];
        }
        else
        {
          uint64_t v36 = &v33[8 * ((v26 - v28) >> 3)];
          do
          {
            uint64_t v37 = v36 - 24;
            long long v38 = *(_OWORD *)(v26 - 24);
            *((void *)v36 - 1) = *((void *)v26 - 1);
            *(_OWORD *)(v36 - 24) = v38;
            v26 -= 24;
            v36 -= 24;
          }
          while (v26 != v28);
        }
        float v25 = &v33[24 * v34];
        BOOL v26 = v35 + 24;
        *a4 = v37;
        a4[1] = v35 + 24;
        a4[2] = v25;
        if (v28) {
          operator delete(v28);
        }
        unint64_t v28 = v37;
      }
      else
      {
        *(_OWORD *)BOOL v26 = *(_OWORD *)v27;
        *((_DWORD *)v26 + 4) = v29;
        v26 += 24;
      }
      a4[1] = v26;
      v27 += 16;
    }
    while (v27 != v10);
  }
  if (v9) {
    operator delete(v9);
  }
}

void sub_25C16D200(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (v9) {
    operator delete(v9);
  }
  _Unwind_Resume(exception_object);
}

void sub_25C16D248(void *a1)
{
  sub_25C147FF4(a1);

  JUMPOUT(0x26117F4A0);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x270F98268]();
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

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984C0](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984E8](this, __pos, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x270F98638]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x270F98650]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x270F98658]();
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x270F986B0]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x270F986D0]();
}

uint64_t std::istream::operator>>()
{
  return MEMORY[0x270F986F0]();
}

uint64_t std::ostream::put()
{
  return MEMORY[0x270F98740]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x270F98748]();
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
  return MEMORY[0x270F98788]();
}

{
  return MEMORY[0x270F98790]();
}

{
  return MEMORY[0x270F987A0]();
}

{
  return MEMORY[0x270F987A8]();
}

{
  return MEMORY[0x270F987C0]();
}

std::random_device *__cdecl std::random_device::random_device(std::random_device *this, const std::string *__token)
{
  return (std::random_device *)MEMORY[0x270F98838](this, __token);
}

void std::random_device::~random_device(std::random_device *this)
{
}

std::random_device::result_type std::random_device::operator()(std::random_device *this)
{
  return MEMORY[0x270F98848](this);
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x270F98870]();
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

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::mutex::~mutex(std::mutex *this)
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

void operator delete(void *__p, std::align_val_t a2)
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

void *__cdecl operator new(size_t __sz, std::align_val_t a2)
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

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

void bzero(void *a1, size_t a2)
{
}

void exit(int a1)
{
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
}

float expf(float a1)
{
  MEMORY[0x270ED9870](a1);
  return result;
}

long double expm1(long double __x)
{
  MEMORY[0x270ED9878](__x);
  return result;
}

int fflush(FILE *a1)
{
  return MEMORY[0x270ED9938](a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
}

float log1pf(float a1)
{
  MEMORY[0x270EDA0C8](a1);
  return result;
}

float logf(float a1)
{
  MEMORY[0x270EDA0F8](a1);
  return result;
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x270EDA458](__s, *(void *)&__c, __n);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x270EDAEF0](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x270EDAF18](a1, a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x270EDB010]();
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x270EDB048](a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return MEMORY[0x270EDB5E8](*(void *)&__errnum, __strerrbuf, __buflen);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}