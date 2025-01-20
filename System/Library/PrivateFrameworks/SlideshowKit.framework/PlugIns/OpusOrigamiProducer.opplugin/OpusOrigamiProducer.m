void sub_4470(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_4BBC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_4CC0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_4D50(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_4DBC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_54FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_55DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_56C0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_640C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_861C(void *a1)
{
  uint64_t v2 = a1[2];
  if (!v2)
  {
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*a1 + 272))(a1, 21, -1, -1);
    uint64_t v2 = a1[2];
  }
  v3 = *(uint64_t (**)(void))(*(void *)v2 + 120);
  return v3();
}

uint64_t sub_86B4(void *a1)
{
  uint64_t v2 = (uint64_t (***)(void))a1[2];
  if (!v2)
  {
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*a1 + 272))(a1, 21, -1, -1);
    uint64_t v2 = (uint64_t (***)(void))a1[2];
  }
  v3 = **v2;
  return v3();
}

uint64_t sub_874C(uint64_t a1)
{
  return *(unsigned int *)(a1 + 32);
}

uint64_t sub_8754(uint64_t a1, char *__s1)
{
  if (!__s1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v2 = *(unsigned int *)(a1 + 32);
  if ((int)v2 < 1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v4 = 0;
  for (i = *(const char ***)(a1 + 24); !*i || strcmp(__s1, *i); i += 3)
  {
    if (v2 == ++v4) {
      return 0xFFFFFFFFLL;
    }
  }
  return v4;
}

uint64_t sub_87C0(uint64_t a1, unsigned int a2)
{
  if ((a2 & 0x80000000) != 0 || *(_DWORD *)(a1 + 32) <= (signed int)a2) {
    return 0;
  }
  else {
    return *(void *)(*(void *)(a1 + 24) + 24 * a2);
  }
}

float sub_87EC(uint64_t a1, int a2)
{
  return *(float *)(*(void *)(a1 + 24) + 24 * a2 + 16);
}

float sub_8800(void *a1)
{
  int v2 = (*(uint64_t (**)(void *))(*a1 + 304))(a1);
  if (v2 < 0) {
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*a1 + 272))(a1, 20, -1, -1);
  }
  return *(float *)(a1[3] + 24 * v2 + 16);
}

BOOL sub_88A0(uint64_t a1)
{
  return (*(unsigned int (**)(uint64_t))(*(void *)a1 + 304))(a1) != -1;
}

uint64_t sub_88E8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1) {
    return (*(uint64_t (**)(void))(*(void *)v1 + 40))();
  }
  else {
    return 1;
  }
}

void *sub_891C(uint64_t a1)
{
  int v2 = sub_89A0(0x28uLL);
  v3 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 288))(a1);
  sub_ABF0((uint64_t)v2, v3);
  return v2;
}

void sub_8988(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void *sub_89A0(size_t a1)
{
  result = malloc_type_malloc(a1, 0xD13AC9F0uLL);
  if (!result)
  {
    exception = __cxa_allocate_exception(0x18uLL);
    *(_DWORD *)exception = 5;
    exception[1] = 0;
    exception[2] = 0;
  }
  return result;
}

void sub_89EC(void *a1)
{
  if (a1) {
    free(a1);
  }
}

void sub_89F8(void *a1)
{
}

void *sub_8A0C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    int v2 = *(uint64_t (**)(void))(*(void *)v1 + 112);
    return (void *)v2();
  }
  else
  {
    result = sub_89A0(0x18uLL);
    void *result = off_1AA280;
    result[1] = 0;
    *((_DWORD *)result + 4) = 0;
  }
  return result;
}

void *sub_8A88(uint64_t a1, unsigned int a2)
{
  if ((a2 & 0x80000000) != 0
    || *(_DWORD *)(a1 + 32) <= (signed int)a2
    || !*(void *)(*(void *)(a1 + 24) + 24 * a2))
  {
    result = sub_89A0(0x18uLL);
    void *result = off_1AA280;
    result[1] = 0;
    *((_DWORD *)result + 4) = 0;
  }
  else
  {
    int v2 = *(uint64_t (**)(void))(*(void *)a1 + 112);
    return (void *)v2();
  }
  return result;
}

uint64_t sub_8B20(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 288))(a2);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 112);
  return v4(a1, v3);
}

uint64_t sub_8BA8(uint64_t a1, unsigned int a2, float a3)
{
  if ((a2 & 0x80000000) != 0 || *(_DWORD *)(a1 + 32) <= (signed int)a2) {
    return 0;
  }
  *(float *)(*(void *)(a1 + 24) + 24 * a2 + 16) = a3;
  return 1;
}

uint64_t sub_8BD8(uint64_t a1, float a2)
{
  uint64_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 304))(a1);
  if ((v4 & 0x80000000) != 0) {
    return 0;
  }
  v6 = *(uint64_t (**)(uint64_t, uint64_t, __n128))(*(void *)a1 + 352);
  v5.n128_f32[0] = a2;
  return v6(a1, v4, v5);
}

uint64_t sub_8C8C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 16);
  if (result)
  {
    (*(void (**)(uint64_t))(*(void *)result + 96))(result);
    if ((*(unsigned int (**)(void))(**(void **)(a1 + 16) + 40))(*(void *)(a1 + 16)))
    {
      if (!(*(unsigned int (**)(void))(**(void **)(a1 + 16) + 24))(*(void *)(a1 + 16)))
      {
        float v3 = (***(float (****)(void))(a1 + 16))(*(void *)(a1 + 16));
        uint64_t v4 = *(void *)(a1 + 16);
        *(void *)(a1 + 16) = 0;
        __n128 v5 = (float *)sub_89A0(0x18uLL);
        v5[4] = v3;
        *(void *)(a1 + 16) = v5;
        *(void *)__n128 v5 = off_1AA280;
        *((void *)v5 + 1) = a1;
        if (v4) {
          (*(void (**)(uint64_t))(*(void *)v4 + 152))(v4);
        }
      }
    }
    uint64_t v6 = *(unsigned int *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 16);
    v8 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0;
    *(_DWORD *)(a1 + 32) = 0;
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v7 + 88))(v7, a1);
    if ((int)v6 >= 1)
    {
      v9 = v8;
      do
      {
        int v10 = (*(uint64_t (**)(uint64_t, void))(*(void *)a1 + 304))(a1, *v9);
        if (v10 == -1)
        {
          if (*v9) {
            operator delete[]();
          }
          if (v9[1]) {
            operator delete[]();
          }
        }
        else
        {
          uint64_t v11 = *(void *)(a1 + 24);
          if (*(void *)(v11 + 24 * v10)) {
            operator delete[]();
          }
          if (*(void *)(v11 + 24 * v10 + 8)) {
            operator delete[]();
          }
          long long v12 = *(_OWORD *)v9;
          uint64_t v13 = v11 + 24 * v10;
          *(void *)(v13 + 16) = v9[2];
          *(_OWORD *)uint64_t v13 = v12;
        }
        v9 += 3;
        --v6;
      }
      while (v6);
LABEL_21:
      operator delete[]();
    }
    if (v8) {
      goto LABEL_21;
    }
  }
  return result;
}

void sub_8F4C(void *a1)
{
  __cxa_begin_catch(a1);
  uint64_t v3 = *(void *)(v1 + 16);
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 152))(v3);
  }
  *(void *)(v1 + 16) = v2;
  __cxa_end_catch();
  JUMPOUT(0x8DBCLL);
}

void sub_8F88(_Unwind_Exception *a1)
{
}

uint64_t sub_8FE4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 104))();
}

void sub_900C(_DWORD *a1, int a2)
{
  if (a2 < 0 || a1[8] <= a2) {
    (*(void (**)(_DWORD *, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 272))(a1, 20, -1, -1);
  }
  operator new[]();
}

void sub_910C(void *a1, int a2)
{
  uint64_t v4 = (unsigned int *)__cxa_begin_catch(a1);
  if (a2 == 2) {
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)v2 + 272))(v2, *v4, -1, -1);
  }
  else {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v2 + 272))(v2, 5, -1, -1);
  }
  __cxa_end_catch();
  JUMPOUT(0x90F4);
}

void sub_91A4(_Unwind_Exception *a1)
{
}

uint64_t sub_91C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 304))(a1);
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)a1 + 368);
  return v6(a1, v5, a3);
}

uint64_t sub_9264(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if ((a2 & 0x80000000) != 0 || *(_DWORD *)(a1 + 32) <= (signed int)a2) {
    return 0;
  }
  uint64_t v3 = *(void *)(a1 + 24) + 24 * a2;
  uint64_t v4 = *(void *)(v3 + 8);
  *(void *)(v3 + 8) = 0;
  if (a3) {
    operator new[]();
  }
  if (v4) {
    operator delete[]();
  }
  return 1;
}

void sub_9328(void *a1)
{
  __cxa_begin_catch(a1);
  *(void *)(v2[3] + 24 * v3 + 8) = v1;
  (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*v2 + 272))(v2, 5, -1, -1);
  __cxa_end_catch();
  if (!v1) {
    JUMPOUT(0x9308);
  }
  JUMPOUT(0x92F0);
}

void sub_9390(_Unwind_Exception *a1)
{
}

uint64_t sub_93A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 304))(a1);
  v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 384);
  return v8(a1, v7, a3, a4);
}

uint64_t sub_9454(void *a1, int a2)
{
  if (!a1[2]) {
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*a1 + 272))(a1, 21, -1, -1);
  }
  if (a2 < 1) {
    return 0;
  }
  uint64_t v4 = *(uint64_t (**)(void))(*(void *)a1[2] + 8);
  return v4();
}

uint64_t sub_950C(void *a1, uint64_t a2, int a3)
{
  if (!a1[2]) {
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*a1 + 272))(a1, 21, -1, -1);
  }
  if (a3 < 1) {
    return 0;
  }
  uint64_t v6 = *(void *)a1[2];
  if (a2)
  {
    uint64_t v7 = *(uint64_t (**)(void))(v6 + 16);
    return v7();
  }
  else
  {
    v9 = *(uint64_t (**)(void))(v6 + 8);
    return v9();
  }
}

uint64_t sub_9620(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (*a2) {
    operator delete[]();
  }
  *a2 = 0;
  return result;
}

uint64_t sub_9660(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 16);
  if (v4) {
    BOOL v5 = v4 == a2;
  }
  else {
    BOOL v5 = 1;
  }
  uint64_t v6 = v5;
  if (v5)
  {
    if (v4) {
      (*(void (**)(uint64_t))(*(void *)v4 + 152))(v4);
    }
    *(void *)(a1 + 16) = a3;
    if (a3)
    {
      a3[1] = a1;
      (*(void (**)(void *, uint64_t))(*a3 + 88))(a3, a1);
    }
  }
  return v6;
}

uint64_t sub_9704(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 304))(a1);
  if ((v5 & 0x80000000) != 0) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 272))(a1, 20, -1, -1);
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)a1 + 80);
  return v6(a1, v5, a3);
}

uint64_t sub_97DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 312))(a1);
  uint64_t v7 = v6;
  if ((a2 & 0x80000000) != 0 || (*(_DWORD *)(a1 + 32) > (int)a2 ? (BOOL v8 = v6 == 0) : (BOOL v8 = 1), v8)) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 272))(a1, 20, -1, -1);
  }
  uint64_t v9 = *(void *)(a1 + 16);
  if (v9)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)v9 + 80))(v9, a2, a3);
    if (!(*(unsigned int (**)(uint64_t, uint64_t))(*(void *)a3 + 56))(a3, v7))
    {
      uint64_t v10 = *(void *)(a1 + 24);
      uint64_t v11 = v10 + 24 * (int)a2;
      *(_DWORD *)(v11 + 16) = 0;
      if (*(void *)(v11 + 8)) {
        operator delete[]();
      }
      long long v12 = (void *)(v10 + 24 * (int)a2);
      v12[1] = 0;
      if (*v12) {
        operator delete[]();
      }
      *(void *)(v10 + 24 * (int)a2) = 0;
    }
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 272))(a1, 21, -1, -1);
  }
  uint64_t v13 = *(uint64_t (**)(void))(**(void **)(a1 + 16) + 96);
  return v13();
}

uint64_t sub_99D0(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (!v2) {
    __cxa_bad_typeid();
  }
  if (!sub_B9B4(*(void *)(*v2 - 8), *(void *)(*a2 - 8))) {
    return 1;
  }
  uint64_t v4 = *(uint64_t (**)(void))(**(void **)(a1 + 16) + 128);
  return v4();
}

uint64_t sub_9A78(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (!v2 || !sub_B9B4(*(void *)(*v2 - 8), *(void *)(*a2 - 8))) {
    return 0;
  }
  uint64_t v4 = *(uint64_t (**)(void))(**(void **)(a1 + 16) + 136);
  return v4();
}

uint64_t sub_9B1C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(a2 + 16);
  if (!(v2 | v3)) {
    return 0;
  }
  if ((v2 == 0) != (v3 == 0)) {
    return 1;
  }
  return (*(uint64_t (**)(void))(*(void *)v2 + 128))();
}

uint64_t sub_9B78(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 | *(void *)(a2 + 16)) {
    return (*(uint64_t (**)(void))(*(void *)v2 + 136))();
  }
  else {
    return 1;
  }
}

uint64_t sub_9BB4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3 != a2)
  {
    if (v3)
    {
      (*(void (**)(uint64_t))(*(void *)v3 + 152))(v3);
      *(void *)(a1 + 16) = 0;
    }
    if (*(int *)(a1 + 32) >= 1)
    {
      uint64_t v5 = 0;
      uint64_t v6 = 0;
      do
      {
        uint64_t v7 = *(void *)(a1 + 24);
        if (*(void *)(v7 + v5)) {
          operator delete[]();
        }
        if (*(void *)(v7 + v5 + 8)) {
          operator delete[]();
        }
        ++v6;
        v5 += 24;
      }
      while (v6 < *(int *)(a1 + 32));
    }
    if (*(void *)(a1 + 24)) {
      operator delete[]();
    }
    *(_DWORD *)(a1 + 32) = 0;
    *(void *)(a1 + 16) = a2;
    *(void *)(a1 + 24) = 0;
    (*(void (**)(uint64_t, uint64_t))(*(void *)a2 + 88))(a2, a1);
    (*(void (**)(uint64_t))(*(void *)a1 + 96))(a1);
  }
  return a1;
}

uint64_t sub_9D00(uint64_t a1, uint64_t a2)
{
  if (a2 != a1)
  {
    uint64_t v4 = *(void *)(a1 + 16);
    if (v4)
    {
      (*(void (**)(uint64_t))(*(void *)v4 + 152))(v4);
      *(void *)(a1 + 16) = 0;
    }
    if (*(int *)(a1 + 32) >= 1)
    {
      uint64_t v5 = 0;
      uint64_t v6 = 0;
      do
      {
        uint64_t v7 = *(void *)(a1 + 24);
        if (*(void *)(v7 + v5)) {
          operator delete[]();
        }
        if (*(void *)(v7 + v5 + 8)) {
          operator delete[]();
        }
        ++v6;
        v5 += 24;
      }
      while (v6 < *(int *)(a1 + 32));
    }
    if (*(void *)(a1 + 24)) {
      operator delete[]();
    }
    *(void *)(a1 + 24) = 0;
    *(_DWORD *)(a1 + 32) = 0;
    uint64_t v8 = *(void *)(a2 + 16);
    if (v8)
    {
      uint64_t v9 = (*(uint64_t (**)(uint64_t))(*(void *)v8 + 120))(v8);
      *(void *)(a1 + 16) = v9;
      (*(void (**)(uint64_t, uint64_t))(*(void *)v9 + 88))(v9, a1);
      (*(void (**)(uint64_t))(*(void *)a1 + 96))(a1);
    }
    else
    {
      *(void *)(a1 + 16) = 0;
    }
  }
  return a1;
}

uint64_t *sub_9E80(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if (a1[2] == a2) {
    uint64_t v2 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 120))(a2);
  }
  uint64_t v4 = sub_89A0(0x20uLL);
  sub_1B2FC(v4, a1[2], v2);
  *uint64_t v4 = off_1A8150;
  a1[2] = (uint64_t)v4;
  sub_29760((uint64_t)v4, (uint64_t)a1);
  (*(void (**)(uint64_t *))(*a1 + 96))(a1);
  return a1;
}

void sub_9F54(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void *sub_9F6C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = sub_1B2FC(a1, a2, a3);
  void *result = off_1A8150;
  return result;
}

uint64_t *sub_9FA0(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  if (v3)
  {
    uint64_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 120))(v3);
    uint64_t v5 = sub_89A0(0x20uLL);
    sub_1B2FC(v5, a1[2], v4);
    *uint64_t v5 = off_1A8150;
    a1[2] = (uint64_t)v5;
    sub_29760((uint64_t)v5, (uint64_t)a1);
    (*(void (**)(uint64_t *))(*a1 + 96))(a1);
  }
  return a1;
}

void sub_A068(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *sub_A080(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if (a1[2] == a2) {
    uint64_t v2 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 120))(a2);
  }
  uint64_t v4 = sub_89A0(0x20uLL);
  sub_1B2FC(v4, a1[2], v2);
  *uint64_t v4 = off_1A8290;
  a1[2] = (uint64_t)v4;
  sub_29760((uint64_t)v4, (uint64_t)a1);
  (*(void (**)(uint64_t *))(*a1 + 96))(a1);
  return a1;
}

void sub_A154(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void *sub_A16C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = sub_1B2FC(a1, a2, a3);
  void *result = off_1A8290;
  return result;
}

uint64_t *sub_A1A0(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  if (v3)
  {
    uint64_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 120))(v3);
    uint64_t v5 = sub_89A0(0x20uLL);
    sub_1B2FC(v5, a1[2], v4);
    *uint64_t v5 = off_1A8290;
    a1[2] = (uint64_t)v5;
    sub_29760((uint64_t)v5, (uint64_t)a1);
    (*(void (**)(uint64_t *))(*a1 + 96))(a1);
  }
  return a1;
}

void sub_A268(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *sub_A280(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if (a1[2] == a2) {
    uint64_t v2 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 120))(a2);
  }
  uint64_t v4 = sub_89A0(0x20uLL);
  sub_1B2FC(v4, a1[2], v2);
  *uint64_t v4 = off_1A83D0;
  a1[2] = (uint64_t)v4;
  sub_29760((uint64_t)v4, (uint64_t)a1);
  (*(void (**)(uint64_t *))(*a1 + 96))(a1);
  return a1;
}

void sub_A354(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void *sub_A36C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = sub_1B2FC(a1, a2, a3);
  void *result = off_1A83D0;
  return result;
}

uint64_t *sub_A3A0(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  if (v3)
  {
    uint64_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 120))(v3);
    uint64_t v5 = sub_89A0(0x20uLL);
    sub_1B2FC(v5, a1[2], v4);
    *uint64_t v5 = off_1A83D0;
    a1[2] = (uint64_t)v5;
    sub_29760((uint64_t)v5, (uint64_t)a1);
    (*(void (**)(uint64_t *))(*a1 + 96))(a1);
  }
  else
  {
    uint64_t v6 = a1[2];
    if (v6) {
      (*(void (**)(uint64_t))(*(void *)v6 + 152))(v6);
    }
    uint64_t v7 = sub_89A0(0x18uLL);
    *uint64_t v7 = off_1AA280;
    v7[1] = 0;
    *((_DWORD *)v7 + 4) = 0;
    a1[2] = (uint64_t)v7;
  }
  return a1;
}

void sub_A4C4(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *sub_A4DC(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if (a1[2] == a2) {
    uint64_t v2 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 120))(a2);
  }
  uint64_t v4 = sub_89A0(0x20uLL);
  sub_1B2FC(v4, a1[2], v2);
  *uint64_t v4 = off_1A8510;
  a1[2] = (uint64_t)v4;
  sub_29760((uint64_t)v4, (uint64_t)a1);
  (*(void (**)(uint64_t *))(*a1 + 96))(a1);
  return a1;
}

void sub_A5B0(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void *sub_A5C8(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = sub_1B2FC(a1, a2, a3);
  void *result = off_1A8510;
  return result;
}

uint64_t *sub_A5FC(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  if (!v3)
  {
    (*(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*a1 + 272))(a1, 1, -1, -1);
    uint64_t v3 = *(void *)(a2 + 16);
  }
  uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 120))(v3);
  uint64_t v6 = sub_89A0(0x20uLL);
  sub_1B2FC(v6, a1[2], v5);
  *uint64_t v6 = off_1A8510;
  a1[2] = (uint64_t)v6;
  sub_29760((uint64_t)v6, (uint64_t)a1);
  (*(void (**)(uint64_t *))(*a1 + 96))(a1);
  return a1;
}

void sub_A708(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *sub_A720(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if (a1[2] == a2) {
    uint64_t v2 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 120))(a2);
  }
  uint64_t v4 = sub_89A0(0x20uLL);
  sub_1B2FC(v4, a1[2], v2);
  *uint64_t v4 = off_1A8650;
  a1[2] = (uint64_t)v4;
  sub_29760((uint64_t)v4, (uint64_t)a1);
  (*(void (**)(uint64_t *))(*a1 + 96))(a1);
  return a1;
}

void sub_A7F4(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void *sub_A80C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = sub_1B2FC(a1, a2, a3);
  void *result = off_1A8650;
  return result;
}

uint64_t *sub_A840(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  if (!v3)
  {
    (*(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*a1 + 272))(a1, 1, -1, -1);
    uint64_t v3 = *(void *)(a2 + 16);
  }
  uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 120))(v3);
  uint64_t v6 = sub_89A0(0x20uLL);
  sub_1B2FC(v6, a1[2], v5);
  *uint64_t v6 = off_1A8650;
  a1[2] = (uint64_t)v6;
  sub_29760((uint64_t)v6, (uint64_t)a1);
  (*(void (**)(uint64_t *))(*a1 + 96))(a1);
  return a1;
}

void sub_A94C(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_A964(uint64_t result)
{
  *(void *)(result + 8) = 0;
  *(void *)(result + 16) = 0;
  *(void *)uint64_t result = off_1A5388;
  *(void *)(result + 24) = 0;
  *(_DWORD *)(result + 32) = 0;
  return result;
}

void *sub_A990(void *result)
{
  void *result = off_1A5578;
  result[1] = 0;
  return result;
}

uint64_t sub_A9B0(uint64_t a1, uint64_t *a2)
{
  *(void *)a1 = off_1A5388;
  *(void *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 32) = 0;
  a2[3] = a1;
  *(void *)(a1 + 16) = 0;
  uint64_t v3 = a1 + 16;
  *(void *)(a1 + 8) = 0;
  uint64_t v4 = (unsigned char *)a2[1];
  if (*v4 == 61) {
    a2[1] = (uint64_t)(v4 + 1);
  }
  sub_FEE8((uint64_t *)a1, a2, a1 + 16);
  if (*(void *)v3) {
    *(void *)(*(void *)v3 + 8) = a1;
  }
  (*(void (**)(uint64_t))(*(void *)a1 + 96))(a1);
  return a1;
}

void sub_AA70(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9, uint64_t a10)
{
  *uint64_t v10 = off_1A5578;
  v10[1] = 0;
  _Unwind_Resume(exception_object);
}

uint64_t sub_AB2C(uint64_t a1, void *a2)
{
  *(void *)a1 = off_1A5388;
  *(void *)(a1 + 8) = 0;
  a2[1] = a1;
  *(void *)(a1 + 16) = a2;
  *(void *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 32) = 0;
  (*(void (**)(void *, uint64_t))(*a2 + 88))(a2, a1);
  (*(void (**)(uint64_t))(*(void *)a1 + 96))(a1);
  return a1;
}

void sub_ABCC(_Unwind_Exception *a1)
{
  void *v1 = off_1A5578;
  v1[1] = 0;
  _Unwind_Resume(a1);
}

uint64_t sub_ABF0(uint64_t a1, void *a2)
{
  uint64_t v3 = off_1A5388;
  *(void *)a1 = off_1A5388;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = a2;
  if (a2)
  {
    a2[1] = a1;
    *(void *)(a1 + 24) = 0;
    *(_DWORD *)(a1 + 32) = 0;
    (*(void (**)(void *, uint64_t))(*a2 + 88))(a2, a1);
    uint64_t v3 = *(uint64_t (***)())a1;
  }
  else
  {
    *(void *)(a1 + 24) = 0;
    *(_DWORD *)(a1 + 32) = 0;
  }
  ((void (*)(uint64_t))v3[12])(a1);
  return a1;
}

void sub_ACA4(_Unwind_Exception *a1)
{
  void *v1 = off_1A5578;
  v1[1] = 0;
  _Unwind_Resume(a1);
}

uint64_t sub_ACC4(uint64_t a1, float a2)
{
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = off_1A5388;
  uint64_t v4 = (float *)sub_89A0(0x18uLL);
  *(void *)uint64_t v4 = off_1AA280;
  v4[4] = a2;
  *(void *)(a1 + 16) = v4;
  *((void *)v4 + 1) = a1;
  *(void *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 32) = 0;
  return a1;
}

uint64_t sub_AE04(uint64_t a1, char *__s)
{
  *(void *)a1 = off_1A5388;
  *(void *)(a1 + 8) = 0;
  if (!__s)
  {
    LODWORD(xmmword_1F1288) = 21;
    *((void *)&xmmword_1F1288 + 1) = -1;
    qword_1F1298 = -1;
    exception = __cxa_allocate_exception(0x18uLL);
    uint64_t v7 = qword_1F1298;
    *(_OWORD *)exception = xmmword_1F1288;
    exception[2] = v7;
  }
  *(void *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 32) = 0;
  uint64_t v8 = __s;
  uint64_t v9 = __s;
  uint64_t v10 = &__s[strlen(__s) - 1];
  uint64_t v11 = a1;
  if (*__s == 61) {
    uint64_t v9 = __s + 1;
  }
  *(void *)(a1 + 16) = 0;
  sub_FEE8((uint64_t *)a1, (uint64_t *)&v8, a1 + 16);
  uint64_t v4 = *(void **)(a1 + 16);
  if (v4) {
    v4[1] = a1;
  }
  (*(void (**)(void *, uint64_t))(*v4 + 88))(v4, a1);
  (*(void (**)(uint64_t))(*(void *)a1 + 96))(a1);
  return a1;
}

void sub_AF44()
{
}

void sub_AFC4(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  void *v1 = off_1A5578;
  v1[1] = 0;
  _Unwind_Resume(a1);
}

void sub_AFD4()
{
}

uint64_t sub_B004(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = off_1A5388;
  *(void *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 32) = 0;
  uint64_t v3 = *(void *)(a2 + 16);
  if (v3)
  {
    uint64_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 120))(v3);
    *(void *)(a1 + 16) = v4;
    (*(void (**)(uint64_t, uint64_t))(*(void *)v4 + 88))(v4, a1);
    (*(void (**)(uint64_t))(*(void *)a1 + 96))(a1);
  }
  return a1;
}

void sub_B0D0(_Unwind_Exception *a1)
{
  void *v1 = off_1A5578;
  v1[1] = 0;
  _Unwind_Resume(a1);
}

uint64_t sub_B0F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = off_1A5388;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 32) = 0;
  (*(void (**)(uint64_t))(*(void *)a3 + 288))(a3);
  uint64_t v5 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 184))(a1, a2);
  *(void *)(a1 + 16) = v5;
  v5[1] = a1;
  (*(void (**)(void *, uint64_t))(*v5 + 88))(v5, a1);
  (*(void (**)(uint64_t))(*(void *)a1 + 96))(a1);
  return a1;
}

void sub_B21C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, long long a11, uint64_t a12)
{
  *long long v12 = off_1A5578;
  v12[1] = 0;
  _Unwind_Resume(exception_object);
}

uint64_t sub_B2D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)a1 = off_1A5388;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 32) = 0;
  uint64_t v7 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 288))(a2);
  uint64_t v8 = (*(uint64_t (**)(uint64_t))(*(void *)a4 + 288))(a4);
  uint64_t v9 = (void *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 200))(a1, a3, v7, v8);
  *(void *)(a1 + 16) = v9;
  v9[1] = a1;
  (*(void (**)(void *, uint64_t))(*v9 + 88))(v9, a1);
  (*(void (**)(uint64_t))(*(void *)a1 + 96))(a1);
  return a1;
}

void sub_B41C(_Unwind_Exception *a1)
{
  void *v1 = off_1A5578;
  v1[1] = 0;
  _Unwind_Resume(a1);
}

uint64_t sub_B440(uint64_t a1)
{
  *(void *)a1 = off_1A5388;
  if (*(void *)(a1 + 24))
  {
    if (*(int *)(a1 + 32) < 1) {
      goto LABEL_10;
    }
    uint64_t v2 = 0;
    uint64_t v3 = 0;
    do
    {
      uint64_t v4 = *(void *)(a1 + 24);
      if (*(void *)(v4 + v2)) {
        operator delete[]();
      }
      if (*(void *)(v4 + v2 + 8)) {
        operator delete[]();
      }
      ++v3;
      v2 += 24;
    }
    while (v3 < *(int *)(a1 + 32));
    if (*(void *)(a1 + 24)) {
LABEL_10:
    }
      operator delete[]();
    *(void *)(a1 + 24) = 0;
  }
  uint64_t v5 = *(void *)(a1 + 16);
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 152))(v5);
  }
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = off_1A5578;
  return a1;
}

void sub_B568(_Unwind_Exception *a1)
{
  void *v1 = off_1A5578;
  v1[1] = 0;
  _Unwind_Resume(a1);
}

void sub_B58C(void *a1)
{
  sub_B440((uint64_t)a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_B5D4(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_B5EC(uint64_t a1, char *__s)
{
  *(void *)(a1 + 24) = 0;
  operator new[]();
}

uint64_t sub_B78C(uint64_t a1, char *__s2)
{
  uint64_t v4 = *(const char ***)(a1 + 24);
  uint64_t v5 = *(unsigned int *)(a1 + 32);
  if (v4) {
    BOOL v6 = (int)v5 < 1;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 0;
    while (!*v4 || strcmp(*v4, __s2))
    {
      ++v7;
      v4 += 3;
      if (v5 == v7)
      {
        uint64_t v7 = v5;
        goto LABEL_13;
      }
    }
  }
  if (v7 == v5) {
LABEL_13:
  }
    (*(void (**)(uint64_t, char *))(*(void *)a1 + 416))(a1, __s2);
  return v7;
}

double sub_B848()
{
  return 0.0;
}

uint64_t sub_B850()
{
  return 0;
}

uint64_t sub_B858()
{
  return 0;
}

uint64_t sub_B860()
{
  return 0;
}

uint64_t sub_B868()
{
  return 0;
}

uint64_t sub_B870()
{
  return 1;
}

uint64_t sub_B878()
{
  return 0;
}

uint64_t sub_B880()
{
  return 0;
}

uint64_t sub_B888()
{
  return 0;
}

uint64_t sub_B8A0()
{
  return 0;
}

uint64_t sub_B8A8(uint64_t a1)
{
  return 0;
}

uint64_t sub_B8F8(uint64_t a1)
{
  return 0;
}

BOOL sub_B948(uint64_t a1, void *a2)
{
  return !sub_B9B4((uint64_t)&off_1A5548, *(void *)(*a2 - 8));
}

BOOL sub_B980(uint64_t a1, void *a2)
{
  return sub_B9B4((uint64_t)&off_1A5548, *(void *)(*a2 - 8));
}

BOOL sub_B9B4(uint64_t a1, uint64_t a2)
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

void *sub_BA04(void *result)
{
  void *result = off_1A5578;
  result[1] = 0;
  return result;
}

uint64_t sub_BA28@<X0>(uint64_t result@<X0>, void *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6 = result;
  *(_DWORD *)a4 = 0;
  *(void *)(a4 + 8) = a3;
  *(_DWORD *)(a4 + 16) = 1;
  *(_WORD *)(a4 + 20) = 0;
  int v8 = *a3;
  if (v8 <= 93)
  {
    switch(*a3)
    {
      case '%':
        uint64_t v9 = 7;
        goto LABEL_44;
      case '&':
        if (a3[1] == 38)
        {
          uint64_t v9 = 15;
          goto LABEL_41;
        }
        uint64_t v9 = 18;
        goto LABEL_44;
      case '\'':
      case '(':
      case ')':
      case ',':
      case '.':
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
      case ';':
        goto LABEL_28;
      case '*':
        uint64_t v9 = 5;
        goto LABEL_44;
      case '+':
        uint64_t result = (*(uint64_t (**)(uint64_t, void *, char *))(*(void *)result + 216))(result, a2, a3);
        if ((result - 1) < 2) {
          goto LABEL_35;
        }
        if (result) {
          goto LABEL_28;
        }
        uint64_t v9 = 3;
        goto LABEL_44;
      case '-':
        uint64_t result = (*(uint64_t (**)(uint64_t, void *, char *))(*(void *)result + 216))(result, a2, a3);
        if (result == 2)
        {
LABEL_35:
          uint64_t v9 = 0;
          *(_DWORD *)a4 = 0;
          goto LABEL_45;
        }
        if (result == 1)
        {
          uint64_t v9 = 2;
        }
        else
        {
          if (result) {
            goto LABEL_28;
          }
          uint64_t v9 = 4;
        }
        goto LABEL_44;
      case '/':
        uint64_t v9 = 6;
        goto LABEL_44;
      case ':':
        uint64_t v9 = 22;
        goto LABEL_44;
      case '<':
        if (a3[1] == 61)
        {
          uint64_t v9 = 13;
          goto LABEL_41;
        }
        uint64_t v9 = 9;
        goto LABEL_44;
      case '=':
        if (a3[1] != 61) {
          goto LABEL_28;
        }
        uint64_t v9 = 11;
        goto LABEL_41;
      case '>':
        if (a3[1] == 61)
        {
          uint64_t v9 = 14;
          goto LABEL_41;
        }
        uint64_t v9 = 10;
        goto LABEL_44;
      case '?':
        uint64_t v9 = 23;
        goto LABEL_44;
      default:
        if (v8 != 33) {
          goto LABEL_28;
        }
        int v10 = a3[1];
        if (v10 == 38)
        {
          uint64_t v9 = 20;
          goto LABEL_41;
        }
        if (v10 == 61)
        {
          uint64_t v9 = 12;
          goto LABEL_41;
        }
        uint64_t v9 = 17;
        break;
    }
    goto LABEL_44;
  }
  switch(v8)
  {
    case '^':
      uint64_t v9 = 8;
      goto LABEL_44;
    case '|':
      if (a3[1] != 124)
      {
        uint64_t v9 = 19;
        goto LABEL_44;
      }
      uint64_t v9 = 16;
LABEL_41:
      *(_DWORD *)a4 = v9;
      *(_DWORD *)(a4 + 16) = 2;
      break;
    case '~':
      uint64_t v9 = 21;
LABEL_44:
      *(_DWORD *)a4 = v9;
      break;
    default:
LABEL_28:
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, char *, char *))(*(void *)v6 + 272))(v6, 26, &a3[-*a2], &a3[-*a2]);
      uint64_t v9 = 0;
      break;
  }
LABEL_45:
  *(_WORD *)(a4 + 20) = word_1649A8[v9];
  return result;
}

void sub_BD28()
{
  v0 = 0;
  operator new[]();
}

uint64_t sub_BE3C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a2 + 16) - *(void *)(a2 + 8);
  if (v3 > 5) {
    return 0;
  }
  if ((v3 & 0x8000000000000000) == 0)
  {
    unint64_t v6 = 0;
    do
    {
      __s1[v6] = __toupper(*(char *)(*(void *)(a2 + 8) + v6));
      if (v6 > 4) {
        break;
      }
    }
    while (v3 > (uint64_t)v6++);
  }
  uint64_t v8 = 0;
  __s1[v3 + 1] = 0;
  while (strncmp(__s1, (&off_1F1268)[v8], 6uLL))
  {
    if (++v8 == 4) {
      return 0;
    }
  }
  int v10 = sub_89A0(0x18uLL);
  double v11 = *(double *)&qword_165C10[v8];
  *int v10 = off_1AA280;
  v10[1] = 0;
  *(float *)&double v11 = v11;
  *((_DWORD *)v10 + 4) = LODWORD(v11);
  *a3 = v10;
  return 1;
}

void *sub_BF3C(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10)
{
  switch(a2)
  {
    case 1:
      int v10 = sub_89A0(0x18uLL);
      sub_10788(v10, (uint64_t)a9);
      double v11 = (uint64_t (**)())&off_1A56A8;
      goto LABEL_35;
    case 2:
      int v10 = sub_89A0(0x18uLL);
      sub_10788(v10, (uint64_t)a9);
      double v11 = (uint64_t (**)())&off_1A57E0;
      goto LABEL_35;
    case 3:
      int v10 = sub_89A0(0x18uLL);
      sub_10788(v10, (uint64_t)a9);
      double v11 = (uint64_t (**)())&off_1A5918;
      goto LABEL_35;
    case 4:
      int v10 = sub_89A0(0x18uLL);
      sub_10788(v10, (uint64_t)a9);
      double v11 = off_1A5A50;
      goto LABEL_35;
    case 5:
      int v10 = sub_89A0(0x18uLL);
      sub_10788(v10, (uint64_t)a9);
      double v11 = off_1A5B88;
      goto LABEL_35;
    case 6:
      int v10 = sub_89A0(0x18uLL);
      sub_10788(v10, (uint64_t)a9);
      double v11 = off_1A5CC0;
      goto LABEL_35;
    case 7:
      int v10 = sub_89A0(0x20uLL);
      sub_11EFC((uint64_t)v10, a9);
      return v10;
    case 8:
      int v10 = sub_89A0(0x18uLL);
      sub_10788(v10, (uint64_t)a9);
      double v11 = off_1A5F30;
      goto LABEL_35;
    case 9:
      int v10 = sub_89A0(0x18uLL);
      sub_10788(v10, (uint64_t)a9);
      double v11 = off_1A6068;
      goto LABEL_35;
    case 10:
      int v10 = sub_89A0(0x18uLL);
      sub_10788(v10, (uint64_t)a9);
      double v11 = off_1A61A0;
      goto LABEL_35;
    case 11:
      int v10 = sub_89A0(0x18uLL);
      sub_10788(v10, (uint64_t)a9);
      double v11 = off_1A62D8;
      goto LABEL_35;
    case 12:
      int v10 = sub_89A0(0x18uLL);
      sub_10788(v10, (uint64_t)a9);
      double v11 = off_1A6410;
      goto LABEL_35;
    case 13:
      int v10 = sub_89A0(0x18uLL);
      sub_10788(v10, (uint64_t)a9);
      double v11 = off_1A6548;
      goto LABEL_35;
    case 14:
      int v10 = sub_89A0(0x18uLL);
      sub_10788(v10, (uint64_t)a9);
      double v11 = off_1A6680;
      goto LABEL_35;
    case 15:
      int v10 = sub_89A0(0x18uLL);
      sub_10788(v10, (uint64_t)a9);
      double v11 = off_1A67B8;
      goto LABEL_35;
    case 16:
      int v10 = sub_89A0(0x18uLL);
      sub_10788(v10, (uint64_t)a9);
      double v11 = off_1A68F0;
      goto LABEL_35;
    case 17:
      int v10 = sub_89A0(0x18uLL);
      sub_10788(v10, (uint64_t)a9);
      double v11 = off_1A6A28;
      goto LABEL_35;
    case 18:
      int v10 = sub_89A0(0x18uLL);
      sub_10788(v10, (uint64_t)a9);
      double v11 = off_1A6B60;
      goto LABEL_35;
    case 19:
      int v10 = sub_89A0(0x18uLL);
      sub_10788(v10, (uint64_t)a9);
      double v11 = off_1A6C98;
      goto LABEL_35;
    case 20:
      int v10 = sub_89A0(0x18uLL);
      sub_10788(v10, (uint64_t)a9);
      double v11 = (uint64_t (**)())&off_1A6DD0;
      goto LABEL_35;
    case 21:
      int v10 = sub_89A0(0x18uLL);
      sub_10788(v10, (uint64_t)a9);
      double v11 = (uint64_t (**)())&off_1A6F08;
      goto LABEL_35;
    case 22:
      int v10 = sub_89A0(0x18uLL);
      sub_10788(v10, (uint64_t)a9);
      double v11 = (uint64_t (**)())&off_1A7040;
      goto LABEL_35;
    case 23:
      int v10 = sub_89A0(0x18uLL);
      sub_10788(v10, (uint64_t)a9);
      double v11 = off_1A7178;
      goto LABEL_35;
    case 24:
      int v10 = sub_89A0(0x18uLL);
      sub_10788(v10, (uint64_t)a9);
      double v11 = off_1A72B0;
      goto LABEL_35;
    case 25:
      int v10 = sub_89A0(0x18uLL);
      sub_10788(v10, (uint64_t)a9);
      double v11 = off_1A73E8;
      goto LABEL_35;
    case 26:
      int v10 = sub_89A0(0x18uLL);
      sub_10788(v10, (uint64_t)a9);
      double v11 = off_1A7520;
      goto LABEL_35;
    case 27:
      int v10 = sub_89A0(0x18uLL);
      sub_10788(v10, (uint64_t)a9);
      double v11 = off_1A7658;
      goto LABEL_35;
    case 28:
      int v10 = sub_89A0(0x18uLL);
      sub_10788(v10, (uint64_t)a9);
      double v11 = off_1A7790;
      goto LABEL_35;
    case 29:
      int v10 = sub_89A0(0x18uLL);
      sub_10788(v10, (uint64_t)a9);
      double v11 = off_1A78C8;
      goto LABEL_35;
    case 30:
      int v10 = sub_89A0(0x18uLL);
      sub_10788(v10, (uint64_t)a9);
      double v11 = off_1A7A00;
      goto LABEL_35;
    case 31:
      int v10 = sub_89A0(0x20uLL);
      sub_18880(v10, (uint64_t)a9, a10);
      double v11 = off_1A7B38;
LABEL_35:
      *int v10 = v11;
      break;
    case 32:
      operator new[]();
    case 33:
      operator new[]();
    default:
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 272))(a1, 25, -1, -1);
      int v10 = 0;
      break;
  }
  return v10;
}

void sub_C860(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void *sub_C97C(void *a1, uint64_t a2)
{
  uint64_t result = sub_10788(a1, a2);
  void *result = &off_1A56A8;
  return result;
}

void *sub_C9B0(void *a1, uint64_t a2)
{
  uint64_t result = sub_10788(a1, a2);
  void *result = &off_1A57E0;
  return result;
}

void *sub_C9E4(void *a1, uint64_t a2)
{
  uint64_t result = sub_10788(a1, a2);
  void *result = &off_1A5918;
  return result;
}

void *sub_CA18(void *a1, uint64_t a2)
{
  uint64_t result = sub_10788(a1, a2);
  void *result = off_1A5A50;
  return result;
}

void *sub_CA4C(void *a1, uint64_t a2)
{
  uint64_t result = sub_10788(a1, a2);
  void *result = off_1A5B88;
  return result;
}

void *sub_CA80(void *a1, uint64_t a2)
{
  uint64_t result = sub_10788(a1, a2);
  void *result = off_1A5CC0;
  return result;
}

void *sub_CAB8(void *a1, uint64_t a2)
{
  uint64_t result = sub_10788(a1, a2);
  void *result = off_1A5F30;
  return result;
}

void *sub_CAEC(void *a1, uint64_t a2)
{
  uint64_t result = sub_10788(a1, a2);
  void *result = off_1A6068;
  return result;
}

void *sub_CB20(void *a1, uint64_t a2)
{
  uint64_t result = sub_10788(a1, a2);
  void *result = off_1A61A0;
  return result;
}

void *sub_CB54(void *a1, uint64_t a2)
{
  uint64_t result = sub_10788(a1, a2);
  void *result = off_1A62D8;
  return result;
}

void *sub_CB88(void *a1, uint64_t a2)
{
  uint64_t result = sub_10788(a1, a2);
  void *result = off_1A6410;
  return result;
}

void *sub_CBBC(void *a1, uint64_t a2)
{
  uint64_t result = sub_10788(a1, a2);
  void *result = off_1A6548;
  return result;
}

void *sub_CBF0(void *a1, uint64_t a2)
{
  uint64_t result = sub_10788(a1, a2);
  void *result = off_1A6680;
  return result;
}

void *sub_CC24(void *a1, uint64_t a2)
{
  uint64_t result = sub_10788(a1, a2);
  void *result = off_1A67B8;
  return result;
}

void *sub_CC58(void *a1, uint64_t a2)
{
  uint64_t result = sub_10788(a1, a2);
  void *result = off_1A68F0;
  return result;
}

void *sub_CC8C(void *a1, uint64_t a2)
{
  uint64_t result = sub_10788(a1, a2);
  void *result = off_1A6A28;
  return result;
}

void *sub_CCC0(void *a1, uint64_t a2)
{
  uint64_t result = sub_10788(a1, a2);
  void *result = off_1A6B60;
  return result;
}

void *sub_CCF4(void *a1, uint64_t a2)
{
  uint64_t result = sub_10788(a1, a2);
  void *result = off_1A6C98;
  return result;
}

void *sub_CD28(void *a1, uint64_t a2)
{
  uint64_t result = sub_10788(a1, a2);
  void *result = &off_1A6DD0;
  return result;
}

void *sub_CD5C(void *a1, uint64_t a2)
{
  uint64_t result = sub_10788(a1, a2);
  void *result = &off_1A6F08;
  return result;
}

void *sub_CD90(void *a1, uint64_t a2)
{
  uint64_t result = sub_10788(a1, a2);
  void *result = &off_1A7040;
  return result;
}

void *sub_CDC4(void *a1, uint64_t a2)
{
  uint64_t result = sub_10788(a1, a2);
  void *result = off_1A7178;
  return result;
}

void *sub_CDF8(void *a1, uint64_t a2)
{
  uint64_t result = sub_10788(a1, a2);
  void *result = off_1A72B0;
  return result;
}

void *sub_CE2C(void *a1, uint64_t a2)
{
  uint64_t result = sub_10788(a1, a2);
  void *result = off_1A73E8;
  return result;
}

void *sub_CE60(void *a1, uint64_t a2)
{
  uint64_t result = sub_10788(a1, a2);
  void *result = off_1A7520;
  return result;
}

void *sub_CE94(void *a1, uint64_t a2)
{
  uint64_t result = sub_10788(a1, a2);
  void *result = off_1A7658;
  return result;
}

void *sub_CEC8(void *a1, uint64_t a2)
{
  uint64_t result = sub_10788(a1, a2);
  void *result = off_1A7790;
  return result;
}

void *sub_CEFC(void *a1, uint64_t a2)
{
  uint64_t result = sub_10788(a1, a2);
  void *result = off_1A78C8;
  return result;
}

void *sub_CF30(void *a1, uint64_t a2)
{
  uint64_t result = sub_10788(a1, a2);
  void *result = off_1A7A00;
  return result;
}

void *sub_CF64(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = sub_18880(a1, a2, a3);
  void *result = off_1A7B38;
  return result;
}

void sub_CF98(uint64_t a1, int a2, void *a3)
{
}

void sub_CFCC(uint64_t a1, int a2, void *a3)
{
}

uint64_t sub_D000(uint64_t a1, uint64_t *a2, int a3, uint64_t **a4)
{
  unint64_t v5 = a2[1];
  unint64_t v6 = (unsigned char *)a2[2];
  if (v5 > (unint64_t)v6)
  {
    uint64_t v7 = 0;
LABEL_10:
    unint64_t v6 = 0;
    goto LABEL_11;
  }
  uint64_t v7 = (unsigned char *)a2[1];
  while (*v7 != 40)
  {
    if (++v7 > v6)
    {
      uint64_t v7 = 0;
      break;
    }
  }
  if (v5 > (unint64_t)v6) {
    goto LABEL_10;
  }
  while (*v6 != 41)
  {
    if ((unint64_t)--v6 < v5) {
      goto LABEL_10;
    }
  }
LABEL_11:
  v17[0] = *a2;
  v17[1] = (uint64_t)v7;
  uint64_t v8 = a2[3];
  v17[2] = (uint64_t)v6;
  v17[3] = v8;
  switch(a3)
  {
    case 1:
      uint64_t v9 = (uint64_t *)sub_89A0(0x18uLL);
      uint64_t result = (uint64_t)sub_1066C(v9, v17);
      double v11 = (uint64_t (**)())&off_1A56A8;
      goto LABEL_48;
    case 2:
      uint64_t v9 = (uint64_t *)sub_89A0(0x18uLL);
      uint64_t result = (uint64_t)sub_1066C(v9, v17);
      double v11 = (uint64_t (**)())&off_1A57E0;
      goto LABEL_48;
    case 3:
      uint64_t v9 = (uint64_t *)sub_89A0(0x18uLL);
      uint64_t result = (uint64_t)sub_1066C(v9, v17);
      double v11 = (uint64_t (**)())&off_1A5918;
      goto LABEL_48;
    case 4:
      uint64_t v9 = (uint64_t *)sub_89A0(0x18uLL);
      uint64_t result = (uint64_t)sub_1066C(v9, v17);
      double v11 = off_1A5A50;
      goto LABEL_48;
    case 5:
      uint64_t v9 = (uint64_t *)sub_89A0(0x18uLL);
      uint64_t result = (uint64_t)sub_1066C(v9, v17);
      double v11 = off_1A5B88;
      goto LABEL_48;
    case 6:
      uint64_t v9 = (uint64_t *)sub_89A0(0x18uLL);
      uint64_t result = (uint64_t)sub_1066C(v9, v17);
      double v11 = off_1A5CC0;
      goto LABEL_48;
    case 7:
      uint64_t v9 = (uint64_t *)sub_89A0(0x20uLL);
      uint64_t result = sub_11DA8((uint64_t)v9, (uint64_t)v17);
      goto LABEL_49;
    case 8:
      uint64_t v9 = (uint64_t *)sub_89A0(0x18uLL);
      uint64_t result = (uint64_t)sub_1066C(v9, v17);
      double v11 = off_1A5F30;
      goto LABEL_48;
    case 9:
      uint64_t v9 = (uint64_t *)sub_89A0(0x18uLL);
      uint64_t result = (uint64_t)sub_1066C(v9, v17);
      double v11 = off_1A6068;
      goto LABEL_48;
    case 10:
      uint64_t v9 = (uint64_t *)sub_89A0(0x18uLL);
      uint64_t result = (uint64_t)sub_1066C(v9, v17);
      double v11 = off_1A61A0;
      goto LABEL_48;
    case 11:
      uint64_t v9 = (uint64_t *)sub_89A0(0x18uLL);
      uint64_t result = (uint64_t)sub_1066C(v9, v17);
      double v11 = off_1A62D8;
      goto LABEL_48;
    case 12:
      uint64_t v9 = (uint64_t *)sub_89A0(0x18uLL);
      uint64_t result = (uint64_t)sub_1066C(v9, v17);
      double v11 = off_1A6410;
      goto LABEL_48;
    case 13:
      uint64_t v9 = (uint64_t *)sub_89A0(0x18uLL);
      uint64_t result = (uint64_t)sub_1066C(v9, v17);
      double v11 = off_1A6548;
      goto LABEL_48;
    case 14:
      uint64_t v9 = (uint64_t *)sub_89A0(0x18uLL);
      uint64_t result = (uint64_t)sub_1066C(v9, v17);
      double v11 = off_1A6680;
      goto LABEL_48;
    case 15:
      uint64_t v9 = (uint64_t *)sub_89A0(0x18uLL);
      uint64_t result = (uint64_t)sub_1066C(v9, v17);
      double v11 = off_1A67B8;
      goto LABEL_48;
    case 16:
      uint64_t v9 = (uint64_t *)sub_89A0(0x18uLL);
      uint64_t result = (uint64_t)sub_1066C(v9, v17);
      double v11 = off_1A68F0;
      goto LABEL_48;
    case 17:
      uint64_t v9 = (uint64_t *)sub_89A0(0x18uLL);
      uint64_t result = (uint64_t)sub_1066C(v9, v17);
      double v11 = off_1A6A28;
      goto LABEL_48;
    case 18:
      uint64_t v9 = (uint64_t *)sub_89A0(0x18uLL);
      uint64_t result = (uint64_t)sub_1066C(v9, v17);
      double v11 = off_1A6B60;
      goto LABEL_48;
    case 19:
      uint64_t v9 = (uint64_t *)sub_89A0(0x18uLL);
      uint64_t result = (uint64_t)sub_1066C(v9, v17);
      double v11 = off_1A6C98;
      goto LABEL_48;
    case 20:
      uint64_t v9 = (uint64_t *)sub_89A0(0x18uLL);
      uint64_t result = (uint64_t)sub_1066C(v9, v17);
      double v11 = (uint64_t (**)())&off_1A6DD0;
      goto LABEL_48;
    case 21:
      uint64_t v9 = (uint64_t *)sub_89A0(0x18uLL);
      uint64_t result = (uint64_t)sub_1066C(v9, v17);
      double v11 = (uint64_t (**)())&off_1A6F08;
      goto LABEL_48;
    case 22:
      uint64_t v9 = (uint64_t *)sub_89A0(0x18uLL);
      uint64_t result = (uint64_t)sub_1066C(v9, v17);
      double v11 = (uint64_t (**)())&off_1A7040;
      goto LABEL_48;
    case 23:
      uint64_t v9 = (uint64_t *)sub_89A0(0x18uLL);
      uint64_t result = (uint64_t)sub_1066C(v9, v17);
      double v11 = off_1A7178;
      goto LABEL_48;
    case 24:
      uint64_t v9 = (uint64_t *)sub_89A0(0x18uLL);
      uint64_t result = (uint64_t)sub_1066C(v9, v17);
      double v11 = off_1A72B0;
      goto LABEL_48;
    case 25:
      uint64_t v9 = (uint64_t *)sub_89A0(0x18uLL);
      uint64_t result = (uint64_t)sub_1066C(v9, v17);
      double v11 = off_1A73E8;
      goto LABEL_48;
    case 28:
      uint64_t v9 = (uint64_t *)sub_89A0(0x18uLL);
      uint64_t result = (uint64_t)sub_1066C(v9, v17);
      double v11 = off_1A7790;
      goto LABEL_48;
    case 29:
      uint64_t v9 = (uint64_t *)sub_89A0(0x18uLL);
      uint64_t result = (uint64_t)sub_1066C(v9, v17);
      double v11 = off_1A78C8;
      goto LABEL_48;
    case 30:
      uint64_t v9 = (uint64_t *)sub_89A0(0x18uLL);
      uint64_t result = (uint64_t)sub_1066C(v9, v17);
      double v11 = off_1A7A00;
      goto LABEL_48;
    case 31:
      uint64_t v9 = (uint64_t *)sub_89A0(0x20uLL);
      uint64_t result = (uint64_t)sub_18488(v9, v17);
      double v11 = off_1A7B38;
LABEL_48:
      uint64_t *v9 = (uint64_t)v11;
LABEL_49:
      *a4 = v9;
      break;
    case 32:
      long long v12 = sub_89A0(0x28uLL);
      sub_19318((uint64_t)v12, v17);
    case 33:
      uint64_t v13 = sub_89A0(0x28uLL);
      sub_19318((uint64_t)v13, v17);
    case 34:
      v14 = sub_89A0(0x28uLL);
      sub_19318((uint64_t)v14, v17);
    case 35:
      v16 = sub_89A0(0x28uLL);
      sub_19318((uint64_t)v16, v17);
    default:
      v15 = *(uint64_t (**)(void))(*(void *)a1 + 272);
      uint64_t result = v15();
      break;
  }
  return result;
}

void sub_D72C(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *sub_D850(uint64_t *a1, uint64_t *a2)
{
  uint64_t result = sub_1066C(a1, a2);
  uint64_t *result = (uint64_t)off_1A5F30;
  return result;
}

uint64_t *sub_D884(uint64_t *a1, uint64_t *a2)
{
  uint64_t result = sub_1066C(a1, a2);
  uint64_t *result = (uint64_t)off_1A6068;
  return result;
}

uint64_t *sub_D8B8(uint64_t *a1, uint64_t *a2)
{
  uint64_t result = sub_1066C(a1, a2);
  uint64_t *result = (uint64_t)off_1A61A0;
  return result;
}

uint64_t *sub_D8EC(uint64_t *a1, uint64_t *a2)
{
  uint64_t result = sub_1066C(a1, a2);
  uint64_t *result = (uint64_t)off_1A62D8;
  return result;
}

uint64_t *sub_D920(uint64_t *a1, uint64_t *a2)
{
  uint64_t result = sub_1066C(a1, a2);
  uint64_t *result = (uint64_t)off_1A6410;
  return result;
}

uint64_t *sub_D954(uint64_t *a1, uint64_t *a2)
{
  uint64_t result = sub_1066C(a1, a2);
  uint64_t *result = (uint64_t)off_1A6548;
  return result;
}

uint64_t *sub_D988(uint64_t *a1, uint64_t *a2)
{
  uint64_t result = sub_1066C(a1, a2);
  uint64_t *result = (uint64_t)&off_1A5918;
  return result;
}

uint64_t *sub_D9BC(uint64_t *a1, uint64_t *a2)
{
  uint64_t result = sub_1066C(a1, a2);
  uint64_t *result = (uint64_t)&off_1A56A8;
  return result;
}

uint64_t *sub_D9F0(uint64_t *a1, uint64_t *a2)
{
  uint64_t result = sub_1066C(a1, a2);
  uint64_t *result = (uint64_t)&off_1A57E0;
  return result;
}

uint64_t *sub_DA24(uint64_t *a1, uint64_t *a2)
{
  uint64_t result = sub_1066C(a1, a2);
  uint64_t *result = (uint64_t)off_1A5A50;
  return result;
}

uint64_t *sub_DA58(uint64_t *a1, uint64_t *a2)
{
  uint64_t result = sub_1066C(a1, a2);
  uint64_t *result = (uint64_t)off_1A5B88;
  return result;
}

uint64_t *sub_DA8C(uint64_t *a1, uint64_t *a2)
{
  uint64_t result = sub_1066C(a1, a2);
  uint64_t *result = (uint64_t)off_1A5CC0;
  return result;
}

uint64_t *sub_DAC0(uint64_t *a1, uint64_t *a2)
{
  uint64_t result = sub_1066C(a1, a2);
  uint64_t *result = (uint64_t)off_1A6680;
  return result;
}

uint64_t *sub_DAF4(uint64_t *a1, uint64_t *a2)
{
  uint64_t result = sub_1066C(a1, a2);
  uint64_t *result = (uint64_t)off_1A67B8;
  return result;
}

uint64_t *sub_DB28(uint64_t *a1, uint64_t *a2)
{
  uint64_t result = sub_1066C(a1, a2);
  uint64_t *result = (uint64_t)off_1A68F0;
  return result;
}

uint64_t *sub_DB5C(uint64_t *a1, uint64_t *a2)
{
  uint64_t result = sub_1066C(a1, a2);
  uint64_t *result = (uint64_t)off_1A6A28;
  return result;
}

uint64_t *sub_DB90(uint64_t *a1, uint64_t *a2)
{
  uint64_t result = sub_1066C(a1, a2);
  uint64_t *result = (uint64_t)off_1A6B60;
  return result;
}

uint64_t *sub_DBC4(uint64_t *a1, uint64_t *a2)
{
  uint64_t result = sub_1066C(a1, a2);
  uint64_t *result = (uint64_t)off_1A6C98;
  return result;
}

uint64_t *sub_DBF8(uint64_t *a1, uint64_t *a2)
{
  uint64_t result = sub_1066C(a1, a2);
  uint64_t *result = (uint64_t)&off_1A6DD0;
  return result;
}

uint64_t *sub_DC2C(uint64_t *a1, uint64_t *a2)
{
  uint64_t result = sub_1066C(a1, a2);
  uint64_t *result = (uint64_t)&off_1A6F08;
  return result;
}

uint64_t *sub_DC60(uint64_t *a1, uint64_t *a2)
{
  uint64_t result = sub_1066C(a1, a2);
  uint64_t *result = (uint64_t)&off_1A7040;
  return result;
}

uint64_t *sub_DC94(uint64_t *a1, uint64_t *a2)
{
  uint64_t result = sub_1066C(a1, a2);
  uint64_t *result = (uint64_t)off_1A7178;
  return result;
}

uint64_t *sub_DCC8(uint64_t *a1, uint64_t *a2)
{
  uint64_t result = sub_1066C(a1, a2);
  uint64_t *result = (uint64_t)off_1A72B0;
  return result;
}

uint64_t *sub_DCFC(uint64_t *a1, uint64_t *a2)
{
  uint64_t result = sub_1066C(a1, a2);
  uint64_t *result = (uint64_t)off_1A73E8;
  return result;
}

uint64_t *sub_DD34(uint64_t *a1, uint64_t *a2)
{
  uint64_t result = sub_1066C(a1, a2);
  uint64_t *result = (uint64_t)off_1A7790;
  return result;
}

uint64_t *sub_DD68(uint64_t *a1, uint64_t *a2)
{
  uint64_t result = sub_1066C(a1, a2);
  uint64_t *result = (uint64_t)off_1A78C8;
  return result;
}

uint64_t *sub_DD9C(uint64_t *a1, uint64_t *a2)
{
  uint64_t result = sub_1066C(a1, a2);
  uint64_t *result = (uint64_t)off_1A7A00;
  return result;
}

void *sub_DDD0(void *a1, void *a2)
{
  uint64_t result = sub_18488(a1, a2);
  void *result = off_1A7B38;
  return result;
}

void sub_DE04(uint64_t a1, void *a2)
{
}

void sub_DE38(uint64_t a1, void *a2)
{
}

void sub_DE6C(uint64_t a1, void *a2)
{
}

void sub_DEA0(uint64_t a1, void *a2)
{
}

void *sub_DED4(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  if ((!a3 || !a4) && (a2 > 0x15 || ((1 << a2) & 0x220004) == 0)) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 272))(a1, 21, -1, -1);
  }
  switch(a2)
  {
    case 2u:
      if (!a4) {
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 272))(a1, 21, -1, -1);
      }
      uint64_t v8 = sub_89A0(0x18uLL);
      sub_10788(v8, a4);
      uint64_t v9 = off_1A5CC0;
      goto LABEL_36;
    case 3u:
      uint64_t v8 = sub_89A0(0x20uLL);
      sub_1B2FC(v8, a3, a4);
      uint64_t v9 = off_1A8150;
      goto LABEL_36;
    case 4u:
      uint64_t v8 = sub_89A0(0x20uLL);
      sub_1B2FC(v8, a3, a4);
      uint64_t v9 = off_1A8290;
      goto LABEL_36;
    case 5u:
      uint64_t v8 = sub_89A0(0x20uLL);
      sub_1B2FC(v8, a3, a4);
      uint64_t v9 = off_1A83D0;
      goto LABEL_36;
    case 6u:
      uint64_t v8 = sub_89A0(0x20uLL);
      sub_1B2FC(v8, a3, a4);
      uint64_t v9 = off_1A8510;
      goto LABEL_36;
    case 7u:
      uint64_t v8 = sub_89A0(0x20uLL);
      sub_1B2FC(v8, a3, a4);
      uint64_t v9 = off_1A8650;
      goto LABEL_36;
    case 8u:
      uint64_t v8 = sub_89A0(0x20uLL);
      sub_1B2FC(v8, a3, a4);
      uint64_t v9 = off_1A8790;
      goto LABEL_36;
    case 9u:
      uint64_t v8 = sub_89A0(0x20uLL);
      sub_1B2FC(v8, a3, a4);
      uint64_t v9 = off_1A88D0;
      goto LABEL_36;
    case 0xAu:
      uint64_t v8 = sub_89A0(0x20uLL);
      sub_1B2FC(v8, a3, a4);
      uint64_t v9 = off_1A8A10;
      goto LABEL_36;
    case 0xBu:
      uint64_t v8 = sub_89A0(0x20uLL);
      sub_1B2FC(v8, a3, a4);
      uint64_t v9 = off_1A8B50;
      goto LABEL_36;
    case 0xCu:
      uint64_t v8 = sub_89A0(0x20uLL);
      sub_1B2FC(v8, a3, a4);
      uint64_t v9 = off_1A8C90;
      goto LABEL_36;
    case 0xDu:
      uint64_t v8 = sub_89A0(0x20uLL);
      sub_1B2FC(v8, a3, a4);
      uint64_t v9 = off_1A8DD0;
      goto LABEL_36;
    case 0xEu:
      uint64_t v8 = sub_89A0(0x20uLL);
      sub_1B2FC(v8, a3, a4);
      uint64_t v9 = off_1A8F10;
      goto LABEL_36;
    case 0xFu:
      uint64_t v8 = sub_89A0(0x20uLL);
      sub_1B2FC(v8, a3, a4);
      uint64_t v9 = off_1A9050;
      goto LABEL_36;
    case 0x10u:
      uint64_t v8 = sub_89A0(0x20uLL);
      sub_1B2FC(v8, a3, a4);
      uint64_t v9 = off_1A9190;
      goto LABEL_36;
    case 0x11u:
      if (!a4) {
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 272))(a1, 21, -1, -1);
      }
      uint64_t v8 = sub_89A0(0x18uLL);
      sub_10788(v8, a4);
      uint64_t v9 = off_1A7520;
      goto LABEL_36;
    case 0x12u:
      uint64_t v8 = sub_89A0(0x20uLL);
      sub_1B2FC(v8, a3, a4);
      uint64_t v9 = off_1A92D0;
      goto LABEL_36;
    case 0x13u:
      uint64_t v8 = sub_89A0(0x20uLL);
      sub_1B2FC(v8, a3, a4);
      uint64_t v9 = off_1A9410;
      goto LABEL_36;
    case 0x14u:
      uint64_t v8 = sub_89A0(0x20uLL);
      sub_1B2FC(v8, a3, a4);
      uint64_t v9 = off_1A9550;
      goto LABEL_36;
    case 0x15u:
      if (!a4) {
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 272))(a1, 21, -1, -1);
      }
      uint64_t v8 = sub_89A0(0x18uLL);
      sub_10788(v8, a4);
      uint64_t v9 = off_1A7658;
      goto LABEL_36;
    case 0x16u:
      uint64_t v8 = sub_89A0(0x20uLL);
      sub_1B2FC(v8, a3, a4);
      uint64_t v9 = off_1A9818;
LABEL_36:
      void *v8 = v9;
      break;
    case 0x17u:
      uint64_t v8 = sub_89A0(0x20uLL);
      sub_25768(v8, a3, a4);
      break;
    default:
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 272))(a1, 26, -1, -1);
      uint64_t v8 = 0;
      break;
  }
  return v8;
}

void sub_E4F4(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void *sub_E5B8(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = sub_1B2FC(a1, a2, a3);
  void *result = off_1A8790;
  return result;
}

void *sub_E5EC(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = sub_1B2FC(a1, a2, a3);
  void *result = off_1A88D0;
  return result;
}

void *sub_E620(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = sub_1B2FC(a1, a2, a3);
  void *result = off_1A8A10;
  return result;
}

void *sub_E654(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = sub_1B2FC(a1, a2, a3);
  void *result = off_1A8B50;
  return result;
}

void *sub_E688(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = sub_1B2FC(a1, a2, a3);
  void *result = off_1A8C90;
  return result;
}

void *sub_E6BC(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = sub_1B2FC(a1, a2, a3);
  void *result = off_1A8DD0;
  return result;
}

void *sub_E6F0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = sub_1B2FC(a1, a2, a3);
  void *result = off_1A8F10;
  return result;
}

void *sub_E724(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = sub_1B2FC(a1, a2, a3);
  void *result = off_1A9050;
  return result;
}

void *sub_E758(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = sub_1B2FC(a1, a2, a3);
  void *result = off_1A9190;
  return result;
}

void *sub_E78C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = sub_1B2FC(a1, a2, a3);
  void *result = off_1A92D0;
  return result;
}

void *sub_E7C0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = sub_1B2FC(a1, a2, a3);
  void *result = off_1A9410;
  return result;
}

void *sub_E7F4(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = sub_1B2FC(a1, a2, a3);
  void *result = off_1A9550;
  return result;
}

void *sub_E82C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = sub_1B2FC(a1, a2, a3);
  void *result = off_1A9818;
  return result;
}

uint64_t *sub_E860(uint64_t a1, long long *a2, uint64_t a3, uint64_t **a4)
{
  uint64_t v5 = *((void *)a2 + 3);
  v13[2] = *((void *)a2 + 2);
  v13[3] = v5;
  long long v6 = *a2;
  v13[0] = *(void *)a2;
  long long v14 = v6;
  uint64_t v7 = *(void *)(a3 + 8);
  uint64_t v15 = v7 - 1;
  uint64_t v16 = v5;
  v13[1] = v7 + *(int *)(a3 + 16);
  switch(*(_DWORD *)a3)
  {
    case 2:
      uint64_t v9 = (uint64_t *)sub_89A0(0x18uLL);
      uint64_t result = sub_1066C(v9, v13);
      double v11 = off_1A5CC0;
      goto LABEL_31;
    case 3:
      uint64_t v9 = (uint64_t *)sub_89A0(0x20uLL);
      uint64_t result = sub_1B164(v9, (uint64_t *)&v14, (uint64_t)v13);
      double v11 = off_1A8150;
      goto LABEL_31;
    case 4:
      uint64_t v9 = (uint64_t *)sub_89A0(0x20uLL);
      uint64_t result = sub_1B164(v9, (uint64_t *)&v14, (uint64_t)v13);
      double v11 = off_1A8290;
      goto LABEL_31;
    case 5:
      uint64_t v9 = (uint64_t *)sub_89A0(0x20uLL);
      uint64_t result = sub_1B164(v9, (uint64_t *)&v14, (uint64_t)v13);
      double v11 = off_1A83D0;
      goto LABEL_31;
    case 6:
      uint64_t v9 = (uint64_t *)sub_89A0(0x20uLL);
      uint64_t result = sub_1B164(v9, (uint64_t *)&v14, (uint64_t)v13);
      double v11 = off_1A8510;
      goto LABEL_31;
    case 7:
      uint64_t v9 = (uint64_t *)sub_89A0(0x20uLL);
      uint64_t result = sub_1B164(v9, (uint64_t *)&v14, (uint64_t)v13);
      double v11 = off_1A8650;
      goto LABEL_31;
    case 8:
      uint64_t v9 = (uint64_t *)sub_89A0(0x20uLL);
      uint64_t result = sub_1B164(v9, (uint64_t *)&v14, (uint64_t)v13);
      double v11 = off_1A8790;
      goto LABEL_31;
    case 9:
      uint64_t v9 = (uint64_t *)sub_89A0(0x20uLL);
      uint64_t result = sub_1B164(v9, (uint64_t *)&v14, (uint64_t)v13);
      double v11 = off_1A88D0;
      goto LABEL_31;
    case 0xA:
      uint64_t v9 = (uint64_t *)sub_89A0(0x20uLL);
      uint64_t result = sub_1B164(v9, (uint64_t *)&v14, (uint64_t)v13);
      double v11 = off_1A8A10;
      goto LABEL_31;
    case 0xB:
      uint64_t v9 = (uint64_t *)sub_89A0(0x20uLL);
      uint64_t result = sub_1B164(v9, (uint64_t *)&v14, (uint64_t)v13);
      double v11 = off_1A8B50;
      goto LABEL_31;
    case 0xC:
      uint64_t v9 = (uint64_t *)sub_89A0(0x20uLL);
      uint64_t result = sub_1B164(v9, (uint64_t *)&v14, (uint64_t)v13);
      double v11 = off_1A8C90;
      goto LABEL_31;
    case 0xD:
      uint64_t v9 = (uint64_t *)sub_89A0(0x20uLL);
      uint64_t result = sub_1B164(v9, (uint64_t *)&v14, (uint64_t)v13);
      double v11 = off_1A8DD0;
      goto LABEL_31;
    case 0xE:
      uint64_t v9 = (uint64_t *)sub_89A0(0x20uLL);
      uint64_t result = sub_1B164(v9, (uint64_t *)&v14, (uint64_t)v13);
      double v11 = off_1A8F10;
      goto LABEL_31;
    case 0xF:
      uint64_t v9 = (uint64_t *)sub_89A0(0x20uLL);
      uint64_t result = sub_1B164(v9, (uint64_t *)&v14, (uint64_t)v13);
      double v11 = off_1A9050;
      goto LABEL_31;
    case 0x10:
      uint64_t v9 = (uint64_t *)sub_89A0(0x20uLL);
      uint64_t result = sub_1B164(v9, (uint64_t *)&v14, (uint64_t)v13);
      double v11 = off_1A9190;
      goto LABEL_31;
    case 0x11:
      if (((*(uint64_t (**)(uint64_t, long long *))(*(void *)a1 + 248))(a1, &v14) & 1) == 0)
      {
        (*(void (**)(uint64_t, long long *))(*(void *)a1 + 280))(a1, &v14);
        (*(void (**)(uint64_t, uint64_t, void, void))(*(void *)a1 + 272))(a1, 23, *((void *)&v14 + 1) - v14, v15 - v14);
      }
      uint64_t v9 = (uint64_t *)sub_89A0(0x18uLL);
      uint64_t result = sub_1066C(v9, v13);
      double v11 = off_1A7520;
      goto LABEL_31;
    case 0x12:
      uint64_t v9 = (uint64_t *)sub_89A0(0x20uLL);
      uint64_t result = sub_1B164(v9, (uint64_t *)&v14, (uint64_t)v13);
      double v11 = off_1A92D0;
      goto LABEL_31;
    case 0x13:
      uint64_t v9 = (uint64_t *)sub_89A0(0x20uLL);
      uint64_t result = sub_1B164(v9, (uint64_t *)&v14, (uint64_t)v13);
      double v11 = off_1A9410;
      goto LABEL_31;
    case 0x14:
      uint64_t v9 = (uint64_t *)sub_89A0(0x20uLL);
      uint64_t result = sub_1B164(v9, (uint64_t *)&v14, (uint64_t)v13);
      double v11 = off_1A9550;
      goto LABEL_31;
    case 0x15:
      if (((*(uint64_t (**)(uint64_t, long long *))(*(void *)a1 + 248))(a1, &v14) & 1) == 0)
      {
        (*(void (**)(uint64_t, long long *))(*(void *)a1 + 280))(a1, &v14);
        (*(void (**)(uint64_t, uint64_t, void, void))(*(void *)a1 + 272))(a1, 23, *((void *)&v14 + 1) - v14, v15 - v14);
      }
      uint64_t v9 = (uint64_t *)sub_89A0(0x18uLL);
      uint64_t result = sub_1066C(v9, v13);
      double v11 = off_1A7658;
      goto LABEL_31;
    case 0x16:
      uint64_t v9 = (uint64_t *)sub_89A0(0x20uLL);
      uint64_t result = sub_1B164(v9, (uint64_t *)&v14, (uint64_t)v13);
      double v11 = off_1A9818;
LABEL_31:
      uint64_t *v9 = (uint64_t)v11;
      goto LABEL_32;
    case 0x17:
      uint64_t v9 = (uint64_t *)sub_89A0(0x20uLL);
      uint64_t result = sub_2558C(v9, (uint64_t *)&v14, (const double *)v13);
LABEL_32:
      *a4 = v9;
      break;
    default:
      long long v12 = *(uint64_t (**)(void))(*(void *)a1 + 272);
      uint64_t result = (uint64_t *)v12();
      break;
  }
  return result;
}

void sub_EEEC(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *sub_EFB0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = sub_1B164(a1, a2, a3);
  uint64_t *result = (uint64_t)off_1A8150;
  return result;
}

uint64_t *sub_EFE4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = sub_1B164(a1, a2, a3);
  uint64_t *result = (uint64_t)off_1A8290;
  return result;
}

uint64_t *sub_F018(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = sub_1B164(a1, a2, a3);
  uint64_t *result = (uint64_t)off_1A83D0;
  return result;
}

uint64_t *sub_F04C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = sub_1B164(a1, a2, a3);
  uint64_t *result = (uint64_t)off_1A8510;
  return result;
}

uint64_t *sub_F080(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = sub_1B164(a1, a2, a3);
  uint64_t *result = (uint64_t)off_1A8650;
  return result;
}

uint64_t *sub_F0B4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = sub_1B164(a1, a2, a3);
  uint64_t *result = (uint64_t)off_1A8790;
  return result;
}

uint64_t *sub_F0E8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = sub_1B164(a1, a2, a3);
  uint64_t *result = (uint64_t)off_1A88D0;
  return result;
}

uint64_t *sub_F11C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = sub_1B164(a1, a2, a3);
  uint64_t *result = (uint64_t)off_1A8A10;
  return result;
}

uint64_t *sub_F150(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = sub_1B164(a1, a2, a3);
  uint64_t *result = (uint64_t)off_1A8B50;
  return result;
}

uint64_t *sub_F184(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = sub_1B164(a1, a2, a3);
  uint64_t *result = (uint64_t)off_1A8C90;
  return result;
}

uint64_t *sub_F1B8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = sub_1B164(a1, a2, a3);
  uint64_t *result = (uint64_t)off_1A8DD0;
  return result;
}

uint64_t *sub_F1EC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = sub_1B164(a1, a2, a3);
  uint64_t *result = (uint64_t)off_1A8F10;
  return result;
}

uint64_t *sub_F220(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = sub_1B164(a1, a2, a3);
  uint64_t *result = (uint64_t)off_1A9050;
  return result;
}

uint64_t *sub_F254(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = sub_1B164(a1, a2, a3);
  uint64_t *result = (uint64_t)off_1A9190;
  return result;
}

uint64_t *sub_F288(uint64_t *a1, uint64_t *a2)
{
  uint64_t result = sub_1066C(a1, a2);
  uint64_t *result = (uint64_t)off_1A7520;
  return result;
}

uint64_t *sub_F2BC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = sub_1B164(a1, a2, a3);
  uint64_t *result = (uint64_t)off_1A92D0;
  return result;
}

uint64_t *sub_F2F0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = sub_1B164(a1, a2, a3);
  uint64_t *result = (uint64_t)off_1A9410;
  return result;
}

uint64_t *sub_F324(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = sub_1B164(a1, a2, a3);
  uint64_t *result = (uint64_t)off_1A9550;
  return result;
}

uint64_t *sub_F358(uint64_t *a1, uint64_t *a2)
{
  uint64_t result = sub_1066C(a1, a2);
  uint64_t *result = (uint64_t)off_1A7658;
  return result;
}

uint64_t *sub_F390(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = sub_1B164(a1, a2, a3);
  uint64_t *result = (uint64_t)off_1A9818;
  return result;
}

uint64_t sub_F3C4(uint64_t a1, void *a2, unsigned __int8 *a3)
{
  long long v6 = (char *)a3;
  do
  {
    __darwin_ct_rune_t v8 = *--v6;
    __darwin_ct_rune_t v7 = v8;
    if (v8 < 0) {
      __uint32_t v9 = __maskrune(v7, 0x4000uLL);
    }
    else {
      __uint32_t v9 = _DefaultRuneLocale.__runetype[v7] & 0x4000;
    }
    unint64_t v10 = a2[1];
    if (v9) {
      BOOL v11 = (unint64_t)v6 > v10;
    }
    else {
      BOOL v11 = 0;
    }
  }
  while (v11);
  if ((unint64_t)v6 < v10)
  {
    int v12 = *a3;
    if (v12 == 45 || v12 == 43)
    {
      uint64_t v13 = a3;
      do
      {
        __darwin_ct_rune_t v15 = (char)*++v13;
        __darwin_ct_rune_t v14 = v15;
        if (v15 < 0) {
          __uint32_t v16 = __maskrune(v14, 0x4000uLL);
        }
        else {
          __uint32_t v16 = _DefaultRuneLocale.__runetype[v14] & 0x4000;
        }
        if (v16) {
          BOOL v17 = (unint64_t)v13 > a2[2];
        }
        else {
          BOOL v17 = 1;
        }
      }
      while (!v17);
      __darwin_ct_rune_t v18 = (char)*v13;
      if (v18 < 0)
      {
        if (!__maskrune(v18, 0x500uLL))
        {
LABEL_32:
          int v22 = *v13;
          if (v22 != 46 && v22 != 40) {
            goto LABEL_35;
          }
        }
      }
      else if ((_DefaultRuneLocale.__runetype[v18] & 0x500) == 0)
      {
        goto LABEL_32;
      }
      if ((unint64_t)v13 <= a2[2]) {
        return 1;
      }
LABEL_35:
      (*(void (**)(uint64_t, uint64_t, unsigned __int8 *, unsigned __int8 *))(*(void *)a1 + 272))(a1, 23, &a3[-*a2], &a3[-*a2]);
      return 1;
    }
    (*(void (**)(uint64_t, uint64_t, unsigned __int8 *, unsigned __int8 *))(*(void *)a1 + 272))(a1, 23, &a3[-*a2], &a3[-*a2]);
    return 0;
  }
  int v19 = *v6;
  uint64_t result = 1;
  if (v19 > 93)
  {
    if (v19 > 123)
    {
      if (v19 != 124 && v19 != 126) {
        return 0;
      }
      return result;
    }
    if (v19 == 94) {
      return result;
    }
    if (v19 != 101) {
      return 0;
    }
  }
  else
  {
    uint64_t v21 = (v19 - 9);
    if (v21 > 0x3C) {
      return 0;
    }
    if (((1 << v21) & 0x380056B1800013) != 0) {
      return result;
    }
    if (v21 != 60) {
      return 0;
    }
  }
  v23 = v6 - 1;
  if ((unint64_t)(v6 - 1) < v10) {
    return 0;
  }
  do
  {
    v24 = v23;
    __darwin_ct_rune_t v25 = *v23;
    if (v25 < 0)
    {
      __uint32_t v26 = __maskrune(v25, 0x4000uLL);
      unint64_t v10 = a2[1];
    }
    else
    {
      __uint32_t v26 = _DefaultRuneLocale.__runetype[v25] & 0x4000;
    }
    v23 = v24 - 1;
    if (v26) {
      BOOL v27 = (unint64_t)v24 >= v10;
    }
    else {
      BOOL v27 = 0;
    }
  }
  while (v27);
  if ((unint64_t)v24 >= v10)
  {
    for (i = v24; (unint64_t)i >= a2[1]; --i)
    {
      __darwin_ct_rune_t v29 = *i;
      __uint32_t v30 = v29 < 0 ? __maskrune(v29, 0x500uLL) : _DefaultRuneLocale.__runetype[v29] & 0x500;
      int v31 = *i;
      if (!v30 && !memchr("._[]", *i, 5uLL)) {
        break;
      }
      if ((v31 & 0x80) != 0 || v31 != 46 && (_DefaultRuneLocale.__runetype[v31] & 0x400) == 0) {
        return 0;
      }
    }
  }
  v32 = a3;
  do
  {
    __darwin_ct_rune_t v34 = (char)*++v32;
    __darwin_ct_rune_t v33 = v34;
    if (v34 < 0) {
      __uint32_t v35 = __maskrune(v33, 0x4000uLL);
    }
    else {
      __uint32_t v35 = _DefaultRuneLocale.__runetype[v33] & 0x4000;
    }
    if (v35) {
      BOOL v36 = (unint64_t)v32 > a2[2];
    }
    else {
      BOOL v36 = 1;
    }
  }
  while (!v36);
  __darwin_ct_rune_t v37 = (char)*v32;
  if (v37 < 0) {
    __uint32_t v38 = __maskrune(v37, 0x500uLL);
  }
  else {
    __uint32_t v38 = _DefaultRuneLocale.__runetype[v37] & 0x500;
  }
  if (!v38 && *v32 != 46 || (unint64_t)v32 > a2[2]) {
    (*(void (**)(uint64_t, uint64_t, unsigned __int8 *, unsigned __int8 *))(*(void *)a1 + 272))(a1, 23, &a3[-*a2], &a3[-*a2]);
  }
  return 2;
}

uint64_t sub_F75C(uint64_t a1, void *a2, uint64_t a3)
{
  long long v6 = (char *)a2[1];
  if ((unint64_t)v6 <= a2[2])
  {
    do
    {
      __darwin_ct_rune_t v7 = *v6;
      if (v7 < 0)
      {
        if (__maskrune(v7, 0x4000uLL))
        {
LABEL_4:
          __darwin_ct_rune_t v8 = v6;
          __uint32_t v9 = v6;
          do
          {
            unint64_t v10 = v9;
            BOOL v11 = v8;
            if ((unint64_t)v9 >= a2[2]) {
              break;
            }
            ++v9;
            __darwin_ct_rune_t v12 = v10[1];
            __uint32_t v13 = v12 < 0 ? __maskrune(v12, 0x4000uLL) : _DefaultRuneLocale.__runetype[v12] & 0x4000;
            __darwin_ct_rune_t v8 = v11 + 1;
          }
          while (v13);
          (*(void (**)(uint64_t, uint64_t, char *, char *))(*(void *)a1 + 272))(a1, 22, &v6[-*a2], &v11[-*a2]);
          goto LABEL_13;
        }
      }
      else if ((_DefaultRuneLocale.__runetype[v7] & 0x4000) != 0)
      {
        goto LABEL_4;
      }
      unint64_t v10 = v6;
LABEL_13:
      long long v6 = v10 + 1;
    }
    while ((unint64_t)(v10 + 1) <= a2[2]);
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, void *, uint64_t))(*(void *)a1 + 168))(a1, a2, a3);
  if (!result)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, void *, uint64_t))(*(void *)a1 + 176))(a1, a2, a3);
    if (!result)
    {
      __darwin_ct_rune_t v15 = sub_89A0(0x28uLL);
      sub_2AF84(v15, (uint64_t)a2);
    }
  }
  return result;
}

void sub_F8F4(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_F90C(uint64_t a1, void *a2)
{
  unint64_t v2 = a2[1];
  if (v2 > a2[2]) {
    return 0;
  }
  uint64_t v5 = 0;
  unint64_t v6 = 0;
  int v7 = 0;
  int v8 = 0;
  do
  {
    int v9 = *(char *)v2;
    if (v9 == 41)
    {
      if (v7 == 1)
      {
        ++v8;
        unint64_t v6 = v2;
      }
      if (v7 <= 0) {
        (*(void (**)(uint64_t, uint64_t, unint64_t, unint64_t))(*(void *)a1 + 272))(a1, 24, v2 - *a2, v2 - *a2);
      }
      --v7;
    }
    else if (v9 == 40)
    {
      if (!v8 || v7)
      {
        unint64_t v10 = (char *)v2;
      }
      else
      {
        unint64_t v10 = (char *)(v2 + 1);
        uint64_t v11 = (v2 << 48) - (*a2 << 48) + 0x1000000000000;
        do
        {
          int v12 = *--v10;
          v11 -= 0x1000000000000;
        }
        while (v12 != 41);
        (*(void (**)(uint64_t, uint64_t, uint64_t, void))(*(void *)a1 + 272))(a1, 22, v11 >> 48, (__int16)(v2 - *a2));
      }
      ++v7;
      if (!v5) {
        uint64_t v5 = v10;
      }
      unint64_t v2 = (unint64_t)v10;
    }
    ++v2;
    unint64_t v13 = a2[2];
  }
  while (v2 <= v13);
  if (v7 >= 1)
  {
    (*(void (**)(uint64_t, uint64_t, char *, char *))(*(void *)a1 + 272))(a1, 24, &v5[-*a2], &v5[-*a2]);
    unint64_t v13 = a2[2];
  }
  if (v6 != v13 || !v5)
  {
    if (v6) {
      (*(void (**)(uint64_t, uint64_t, unint64_t, unint64_t))(*(void *)a1 + 272))(a1, 23, v6 - *a2, v13 - *a2);
    }
    return 0;
  }
  __darwin_ct_rune_t v14 = (const char *)a2[1];
  if (v6 - (unint64_t)v14 + 1 < 6) {
    size_t v15 = v6 - (void)v14 + 1;
  }
  else {
    size_t v15 = 6;
  }
  strncpy(__dst, v14, v15);
  uint64_t v16 = 0;
  while (1)
  {
    __darwin_ct_rune_t v17 = __toupper(__dst[v16]);
    __dst[v16] = v17;
    if (v17 << 24 == 671088640) {
      break;
    }
    if ((v17 << 24) <= 0x7F000000)
    {
      if ((_DefaultRuneLocale.__runetype[(char)v17] & 0x4000) != 0) {
        break;
      }
    }
    else if (__maskrune((char)v17, 0x4000uLL))
    {
      break;
    }
    if (++v16 == 6) {
      goto LABEL_41;
    }
  }
  __dst[v16] = 0;
  if (v16 <= 4) {
    bzero(&__dst[v16 + 1], (4 - v16) + 1);
  }
LABEL_41:
  for (uint64_t i = 1; i != 36; ++i)
  {
    if (!strcmp(__dst, (&off_1EFB30)[i])) {
      break;
    }
  }
  return i;
}

void *sub_FC04@<X0>(void *result@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  *(_WORD *)(a3 + 20) = 15;
  *(_DWORD *)a3 = 0;
  uint64_t v5 = (unsigned char *)a2[1];
  unint64_t v4 = a2[2];
  *(void *)(a3 + 8) = v5;
  *(_DWORD *)(a3 + 16) = 1;
  if ((unint64_t)v5 > v4) {
    return result;
  }
  int v7 = result;
  uint64_t v8 = 0;
  int v9 = v5;
  while (1)
  {
    int v10 = (char)*v5;
    if (!*v5) {
      break;
    }
    uint64_t v11 = (v10 - 33);
    if (v11 > 0x3D) {
      goto LABEL_18;
    }
    if (((1 << (v10 - 33)) & 0x200000007A005631) == 0)
    {
      if (v11 == 7)
      {
        if (!v8) {
          int v9 = v5;
        }
        uint64_t v12 = (v8 + 1);
        goto LABEL_12;
      }
      if (v11 == 8)
      {
        uint64_t v12 = (v8 - 1);
        if ((int)v8 <= 0) {
          uint64_t result = (void *)(*(uint64_t (**)(void *, uint64_t, unsigned char *, unsigned char *))(*v7 + 272))(v7, 24, &v5[-*a2], &v5[-*a2]);
        }
        goto LABEL_12;
      }
LABEL_18:
      if (v10 != 126 && v10 != 124) {
        goto LABEL_7;
      }
    }
    if (!v8)
    {
      uint64_t result = (*(void *(**)(int *__return_ptr, void *, void *, unsigned char *))(*v7 + 160))(&v16, v7, a2, v5);
      uint64_t v22 = v17;
      int v23 = v18;
      int v13 = v19;
      if (v16)
      {
        __int16 v14 = v20;
        if (v20 <= *(__int16 *)(a3 + 20))
        {
          __int16 v15 = v21;
          *(_DWORD *)a3 = v16;
          *(void *)(a3 + 4) = v22;
          *(_DWORD *)(a3 + 12) = v23;
          *(_DWORD *)(a3 + 16) = v13;
          *(_WORD *)(a3 + 20) = v14;
          *(_WORD *)(a3 + 22) = v15;
        }
      }
      uint64_t v12 = 0;
      uint64_t v5 = &v5[v13 - 1];
      goto LABEL_12;
    }
LABEL_7:
    uint64_t v12 = v8;
LABEL_12:
    ++v5;
    uint64_t v8 = v12;
    if ((unint64_t)v5 > a2[2]) {
      goto LABEL_25;
    }
  }
  LODWORD(v12) = v8;
LABEL_25:
  if (v12) {
    return (void *)(*(uint64_t (**)(void *, uint64_t, unsigned char *, unsigned char *))(*v7 + 272))(v7, 24, &v9[-*a2], &v9[-*a2]);
  }
  return result;
}

BOOL sub_FE6C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(char **)(a2 + 8);
  for (unint64_t i = *(void *)(a2 + 16); (unint64_t)v3 <= i; ++v3)
  {
    __darwin_ct_rune_t v5 = *v3;
    if (v5 < 0)
    {
      int v6 = __maskrune(v5, 0x4000uLL);
      unint64_t i = *(void *)(a2 + 16);
      if (!v6) {
        return (unint64_t)v3 > i;
      }
    }
    else if ((_DefaultRuneLocale.__runetype[v5] & 0x4000) == 0)
    {
      return (unint64_t)v3 > i;
    }
  }
  return (unint64_t)v3 > i;
}

uint64_t sub_FEE8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v7 = *a2;
  uint64_t v6 = a2[1];
  uint64_t v8 = a2[2];
  (*(void (**)(uint64_t *))(*a1 + 280))(a1);
  if (a2[1] <= (unint64_t)a2[2])
  {
    (*(void (**)(void *__return_ptr, uint64_t *, uint64_t *))(*a1 + 240))(v13, a1, a2);
    uint64_t v11 = *a1;
    if (LODWORD(v13[0]))
    {
      return (*(uint64_t (**)(uint64_t *, uint64_t *, void *, uint64_t))(v11 + 208))(a1, a2, v13, a3);
    }
    else
    {
      uint64_t v12 = (*(uint64_t (**)(uint64_t *, uint64_t *))(v11 + 232))(a1, a2);
      if (v12)
      {
        if (v12 == -1) {
          return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*a1 + 272))(a1, 23, a2[1] - *a2, a2[2] - *a2);
        }
        else {
          return (*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t, uint64_t))(*a1 + 192))(a1, a2, v12, a3);
        }
      }
      else
      {
        return (*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(*a1 + 224))(a1, a2, a3);
      }
    }
  }
  else
  {
    int v9 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*a1 + 272);
    return v9(a1, 21, v6 - v7, v8 - v7);
  }
}

uint64_t sub_10120(uint64_t a1, uint64_t a2)
{
  for (unint64_t i = *(char **)(a2 + 8); ; *(void *)(a2 + 8) = i)
  {
    __darwin_ct_rune_t v4 = *i;
    if (v4 < 0)
    {
      uint64_t result = __maskrune(v4, 0x4000uLL);
      unint64_t i = *(char **)(a2 + 8);
    }
    else
    {
      uint64_t result = _DefaultRuneLocale.__runetype[v4] & 0x4000;
    }
    uint64_t v6 = *(char **)(a2 + 16);
    if (!result || i > v6) {
      break;
    }
    ++i;
  }
  if (i <= v6)
  {
    do
    {
      __darwin_ct_rune_t v8 = *v6;
      if (v8 < 0)
      {
        uint64_t result = __maskrune(v8, 0x4000uLL);
        if (!result) {
          return result;
        }
      }
      else
      {
        uint64_t result = _DefaultRuneLocale.__runetype[v8] & 0x4000;
        if (!result) {
          return result;
        }
      }
      unint64_t v9 = *(void *)(a2 + 8);
      uint64_t v6 = (char *)(*(void *)(a2 + 16) - 1);
      *(void *)(a2 + 16) = v6;
    }
    while ((unint64_t)v6 >= v9);
  }
  return result;
}

void sub_101D0(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  LODWORD(xmmword_1F1288) = a2;
  *((void *)&xmmword_1F1288 + 1) = a3;
  qword_1F1298 = a4;
  exception = __cxa_allocate_exception(0x18uLL);
  uint64_t v5 = qword_1F1298;
  *(_OWORD *)exception = xmmword_1F1288;
  exception[2] = v5;
}

uint64_t sub_10218(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = 0;
LABEL_2:
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 264))(a1, a2);
  unint64_t v6 = *(void *)(a2 + 8);
  uint64_t v7 = *(char **)(a2 + 16);
  if (v6 <= (unint64_t)v7)
  {
    __darwin_ct_rune_t v8 = 0;
    unint64_t v9 = 0;
    for (unint64_t i = *(char **)(a2 + 8); i <= v7; ++i)
    {
      int v11 = *i;
      if (v11 == 41)
      {
        if (!--v4 && !v8)
        {
          uint64_t v4 = 0;
          __darwin_ct_rune_t v8 = i;
          if (i == v7 && v9 == (char *)v6)
          {
            uint64_t v4 = 0;
            *(void *)(a2 + 8) = v6 + 1;
            *(void *)(a2 + 16) = i - 1;
            goto LABEL_2;
          }
        }
      }
      else
      {
        if (v9) {
          uint64_t v12 = v9;
        }
        else {
          uint64_t v12 = i;
        }
        if (v11 == 40)
        {
          unint64_t v9 = v12;
          ++v4;
        }
      }
    }
  }
  return result;
}

float sub_1030C(float (****a1)(void))
{
  float v2 = (**a1[2])(a1[2]);
  if (v2 <= 0.0) {
    ((void (*)(float (****)(void), uint64_t, uint64_t, uint64_t))(*a1)[34])(a1, 4, -1, -1);
  }
  return mathParser::log<float>(v2);
}

uint64_t sub_103B8(uint64_t a1, int a2)
{
  LODWORD(v2) = a2;
  uint64_t v3 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16));
  uint64_t v4 = v3;
  if (v3) {
    BOOL v5 = (int)v2 < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    uint64_t v2 = v2;
    unint64_t v6 = (float *)v3;
    do
    {
      *unint64_t v6 = mathParser::log<float>(*v6);
      ++v6;
      --v2;
    }
    while (v2);
  }
  return v4;
}

uint64_t sub_10438(uint64_t a1, unsigned char *a2, int a3)
{
  LODWORD(v3) = a3;
  uint64_t v5 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16));
  uint64_t v6 = v5;
  if (v5) {
    BOOL v7 = (int)v3 < 1;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    uint64_t v3 = v3;
    __darwin_ct_rune_t v8 = (float *)v5;
    do
    {
      if (!*a2)
      {
        if (*v8 <= 0.0) {
          *a2 = 4;
        }
        else {
          float *v8 = mathParser::log<float>(*v8);
        }
      }
      ++v8;
      ++a2;
      --v3;
    }
    while (v3);
  }
  return v6;
}

uint64_t sub_104E8()
{
  return 1;
}

void *sub_104F0(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 112))(*(void *)(a1 + 16));
  uint64_t v3 = sub_89A0(0x20uLL);
  uint64_t v4 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 120))(*(void *)(a1 + 16));
  sub_1B2FC(v3, v2, v4);
  void *v3 = off_1A8510;
  return v3;
}

void sub_105B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9, uint64_t a10)
{
  int v13 = v11;
  if (v13) {
    free(v13);
  }
  if (a2 == 1)
  {
    __int16 v15 = __cxa_begin_catch(exception_object);
    long long v17 = *(_OWORD *)v15;
    uint64_t v18 = *((void *)v15 + 2);
    if (v10) {
      (*(void (**)(uint64_t))(*(void *)v10 + 152))(v10);
    }
    exception = __cxa_allocate_exception(0x18uLL);
    *(_OWORD *)exception = v17;
    exception[2] = v18;
  }
  _Unwind_Resume(exception_object);
}

uint64_t *sub_1066C(uint64_t *a1, uint64_t *a2)
{
  a1[2] = 0;
  uint64_t v3 = a1 + 2;
  *a1 = (uint64_t)off_1A9ED8;
  a1[1] = 0;
  sub_FEE8(a1, a2, (uint64_t)(a1 + 2));
  if (*v3) {
    *(void *)(*v3 + 8) = a1;
  }
  return a1;
}

void *sub_10788(void *result, uint64_t a2)
{
  uint64_t *result = off_1A9ED8;
  result[1] = 0;
  if (!a2)
  {
    LODWORD(xmmword_1F1288) = 21;
    *((void *)&xmmword_1F1288 + 1) = -1;
    qword_1F1298 = -1;
    exception = __cxa_allocate_exception(0x18uLL);
    uint64_t v3 = qword_1F1298;
    *(_OWORD *)exception = xmmword_1F1288;
    exception[2] = v3;
  }
  result[2] = a2;
  *(void *)(a2 + 8) = result;
  return result;
}

void sub_1081C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  *a10 = off_1A5578;
  a10[1] = 0;
  _Unwind_Resume(a1);
}

float sub_10840(float (****a1)(void))
{
  float v2 = (**a1[2])(a1[2]);
  if (v2 <= 0.0) {
    ((void (*)(float (****)(void), uint64_t, uint64_t, uint64_t))(*a1)[34])(a1, 3, -1, -1);
  }
  return mathParser::log10<float>(v2);
}

uint64_t sub_108EC(uint64_t a1, int a2)
{
  LODWORD(v2) = a2;
  uint64_t v3 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16));
  uint64_t v4 = v3;
  if (v3) {
    BOOL v5 = (int)v2 < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    uint64_t v2 = v2;
    uint64_t v6 = (float *)v3;
    do
    {
      *uint64_t v6 = mathParser::log10<float>(*v6);
      ++v6;
      --v2;
    }
    while (v2);
  }
  return v4;
}

uint64_t sub_1096C(uint64_t a1, unsigned char *a2, int a3)
{
  LODWORD(v3) = a3;
  uint64_t v5 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16));
  uint64_t v6 = v5;
  if (v5) {
    BOOL v7 = (int)v3 < 1;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    uint64_t v3 = v3;
    __darwin_ct_rune_t v8 = (float *)v5;
    do
    {
      if (!*a2)
      {
        if (*v8 <= 0.0) {
          *a2 = 3;
        }
        else {
          float *v8 = mathParser::log10<float>(*v8);
        }
      }
      ++v8;
      ++a2;
      --v3;
    }
    while (v3);
  }
  return v6;
}

uint64_t sub_10A1C()
{
  return 2;
}

void *sub_10A24(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_89A0(0x18uLL);
  *uint64_t v4 = off_1AA280;
  v4[1] = 0;
  *((_DWORD *)v4 + 4) = 1075010958;
  uint64_t v5 = sub_89A0(0x20uLL);
  uint64_t v6 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 120))(*(void *)(a1 + 16));
  sub_1B2FC(v5, v6, (uint64_t)v4);
  *uint64_t v5 = off_1A83D0;
  uint64_t v7 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 16) + 112))(*(void *)(a1 + 16), a2);
  __darwin_ct_rune_t v8 = sub_89A0(0x20uLL);
  sub_1B2FC(v8, v7, (uint64_t)v5);
  void *v8 = off_1A8510;
  return v8;
}

void sub_10B7C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, long long a11, uint64_t a12)
{
  int v16 = v14;
  if (v16) {
    free(v16);
  }
  if (a2 == 1)
  {
    uint64_t v18 = __cxa_begin_catch(exception_object);
    long long v20 = *(_OWORD *)v18;
    uint64_t v21 = *((void *)v18 + 2);
    if (v13) {
      (*(void (**)(uint64_t))(*(void *)v13 + 152))(v13);
    }
    if (v12) {
      (*(void (**)(uint64_t))(*(void *)v12 + 152))(v12);
    }
    exception = __cxa_allocate_exception(0x18uLL);
    *(_OWORD *)exception = v20;
    exception[2] = v21;
  }
  _Unwind_Resume(exception_object);
}

float sub_10C88(uint64_t a1)
{
  (***(void (****)(void))(a1 + 16))(*(void *)(a1 + 16));
  return mathParser::exp<float>(v1);
}

uint64_t sub_10CD4(uint64_t a1, int a2)
{
  LODWORD(v2) = a2;
  uint64_t v3 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16));
  uint64_t v4 = v3;
  if (v3) {
    BOOL v5 = (int)v2 < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    uint64_t v2 = v2;
    uint64_t v6 = (float *)v3;
    do
    {
      *uint64_t v6 = mathParser::exp<float>(*v6);
      ++v6;
      --v2;
    }
    while (v2);
  }
  return v4;
}

uint64_t sub_10D54(uint64_t a1, unsigned __int8 *a2, int a3)
{
  LODWORD(v3) = a3;
  uint64_t v5 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16));
  uint64_t v6 = v5;
  if (v5) {
    BOOL v7 = (int)v3 < 1;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    uint64_t v3 = v3;
    __darwin_ct_rune_t v8 = (float *)v5;
    do
    {
      if (!*a2++) {
        float *v8 = mathParser::exp<float>(*v8);
      }
      ++v8;
      --v3;
    }
    while (v3);
  }
  return v6;
}

uint64_t sub_10DE4()
{
  return 3;
}

void *sub_10DEC(void **a1)
{
  uint64_t v2 = (*(uint64_t (**)(void *))(*a1[2] + 112))(a1[2]);
  uint64_t v3 = sub_89A0(0x20uLL);
  uint64_t v4 = ((uint64_t (*)(void **))(*a1)[15])(a1);
  sub_1B2FC(v3, v4, v2);
  void *v3 = off_1A83D0;
  return v3;
}

void sub_10EB4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9, uint64_t a10)
{
  if (v11) {
    free(v11);
  }
  if (a2 == 1)
  {
    __int16 v14 = __cxa_begin_catch(exception_object);
    long long v16 = *(_OWORD *)v14;
    uint64_t v17 = *((void *)v14 + 2);
    if (v10) {
      (*(void (**)(uint64_t))(*(void *)v10 + 152))(v10);
    }
    exception = __cxa_allocate_exception(0x18uLL);
    *(_OWORD *)exception = v16;
    exception[2] = v17;
  }
  _Unwind_Resume(exception_object);
}

float sub_10F64(uint64_t a1)
{
  (***(void (****)(void))(a1 + 16))(*(void *)(a1 + 16));
  return mathParser::fabs<float>(v1);
}

uint64_t sub_10FB0(uint64_t a1, int a2)
{
  LODWORD(v2) = a2;
  uint64_t v3 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16));
  uint64_t v4 = v3;
  if (v3) {
    BOOL v5 = (int)v2 < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    uint64_t v2 = v2;
    uint64_t v6 = (float *)v3;
    do
    {
      *uint64_t v6 = mathParser::fabs<float>(*v6);
      ++v6;
      --v2;
    }
    while (v2);
  }
  return v4;
}

uint64_t sub_11030(uint64_t a1, unsigned __int8 *a2, int a3)
{
  LODWORD(v3) = a3;
  uint64_t v5 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16));
  uint64_t v6 = v5;
  if (v5) {
    BOOL v7 = (int)v3 < 1;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    uint64_t v3 = v3;
    __darwin_ct_rune_t v8 = (float *)v5;
    do
    {
      if (!*a2++) {
        float *v8 = mathParser::fabs<float>(*v8);
      }
      ++v8;
      --v3;
    }
    while (v3);
  }
  return v6;
}

uint64_t sub_110C0()
{
  return 4;
}

float sub_110C8(float (****a1)(void))
{
  float v2 = (**a1[2])(a1[2]);
  if (v2 < 0.0) {
    ((void (*)(float (****)(void), uint64_t, uint64_t, uint64_t))(*a1)[34])(a1, 2, -1, -1);
  }
  return mathParser::sqrt<float>(v2);
}

uint64_t sub_11174(uint64_t a1, int a2)
{
  LODWORD(v2) = a2;
  uint64_t v3 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16));
  uint64_t v4 = v3;
  if (v3) {
    BOOL v5 = (int)v2 < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    uint64_t v2 = v2;
    uint64_t v6 = (float *)v3;
    do
    {
      *uint64_t v6 = mathParser::sqrt<float>(*v6);
      ++v6;
      --v2;
    }
    while (v2);
  }
  return v4;
}

uint64_t sub_111F4(uint64_t a1, unsigned char *a2, int a3)
{
  LODWORD(v3) = a3;
  uint64_t v5 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16));
  uint64_t v6 = v5;
  if (v5) {
    BOOL v7 = (int)v3 < 1;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    uint64_t v3 = v3;
    __darwin_ct_rune_t v8 = (float *)v5;
    do
    {
      if (!*a2)
      {
        if (*v8 >= 0.0) {
          float *v8 = mathParser::sqrt<float>(*v8);
        }
        else {
          *a2 = 2;
        }
      }
      ++v8;
      ++a2;
      --v3;
    }
    while (v3);
  }
  return v6;
}

uint64_t sub_112A4()
{
  return 5;
}

void *sub_112AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_89A0(0x18uLL);
  uint64_t v5 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 120))(*(void *)(a1 + 16));
  sub_10788(v4, v5);
  *uint64_t v4 = off_1A5B88;
  uint64_t v6 = sub_89A0(0x20uLL);
  BOOL v7 = sub_89A0(0x18uLL);
  *BOOL v7 = off_1AA280;
  v7[1] = 0;
  *((_DWORD *)v7 + 4) = 0x40000000;
  sub_1B2FC(v6, (uint64_t)v4, (uint64_t)v7);
  *uint64_t v6 = off_1A83D0;
  uint64_t v8 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 16) + 112))(*(void *)(a1 + 16), a2);
  unint64_t v9 = sub_89A0(0x20uLL);
  sub_1B2FC(v9, v8, (uint64_t)v6);
  void *v9 = off_1A8510;
  return v9;
}

void sub_11430(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9, uint64_t a10)
{
  if (v10) {
    free(v10);
  }
  if (a2 == 1)
  {
    __int16 v15 = __cxa_begin_catch(exception_object);
    long long v17 = *(_OWORD *)v15;
    uint64_t v18 = *((void *)v15 + 2);
    if (v11) {
      (*(void (**)(uint64_t))(*(void *)v11 + 152))(v11);
    }
    if (v12) {
      (*(void (**)(uint64_t))(*(void *)v12 + 152))(v12);
    }
    exception = __cxa_allocate_exception(0x18uLL);
    *(_OWORD *)exception = v17;
    exception[2] = v18;
  }
  _Unwind_Resume(exception_object);
}

float sub_11554(uint64_t a1)
{
  return -(***(float (****)(void))(a1 + 16))(*(void *)(a1 + 16));
}

float sub_11594(uint64_t a1, int a2)
{
  uint64_t v3 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16));
  if (v3) {
    BOOL v5 = a2 < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    uint64_t v6 = a2;
    BOOL v7 = (float *)v3;
    do
    {
      float result = -*v7;
      *v7++ = result;
      --v6;
    }
    while (v6);
  }
  return result;
}

uint64_t sub_11604(uint64_t a1, unsigned __int8 *a2, int a3)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16));
  if (result) {
    BOOL v6 = a3 < 1;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    uint64_t v7 = a3;
    uint64_t v8 = (float *)result;
    do
    {
      if (!*a2++) {
        float *v8 = -*v8;
      }
      ++v8;
      --v7;
    }
    while (v7);
  }
  return result;
}

uint64_t sub_11684()
{
  return 6;
}

void *sub_1168C(uint64_t a1)
{
  uint64_t v1 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 112))(*(void *)(a1 + 16));
  uint64_t v2 = sub_89A0(0x18uLL);
  sub_10788(v2, v1);
  *uint64_t v2 = off_1A5CC0;
  return v2;
}

void sub_11720(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9, uint64_t a10)
{
  uint64_t v13 = v11;
  if (v13) {
    free(v13);
  }
  if (a2 == 1)
  {
    __int16 v15 = __cxa_begin_catch(exception_object);
    long long v17 = *(_OWORD *)v15;
    uint64_t v18 = *((void *)v15 + 2);
    if (v10) {
      (*(void (**)(uint64_t))(*(void *)v10 + 152))(v10);
    }
    exception = __cxa_allocate_exception(0x18uLL);
    *(_OWORD *)exception = v17;
    exception[2] = v18;
  }
  _Unwind_Resume(exception_object);
}

float sub_117D4(uint64_t a1)
{
  uint64_t v2 = *(float (****)(void))(a1 + 16);
  if (v2) {
    float v3 = (**v2)(v2);
  }
  else {
    float v3 = *(float *)(a1 + 24);
  }
  return (float)(v3 * (float)rand()) * 4.6566e-10;
}

uint64_t sub_11840(uint64_t a1, uint64_t a2)
{
  int v2 = a2;
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3) {
    operator new[]();
  }
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v3 + 8))(v3, a2);
  if (v4 && v2 >= 1)
  {
    uint64_t v5 = 0;
    uint64_t v6 = 4 * v2;
    do
    {
      *(float *)(v4 + v5) = *(float *)(v4 + v5) * (float)((float)rand() * 4.6566e-10);
      v5 += 4;
    }
    while (v6 != v5);
  }
  return v4;
}

uint64_t sub_1194C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3 = a3;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4) {
    operator new[]();
  }
  uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v4 + 16))(v4, a2, a3);
  if (v6 && v3 >= 1)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      if (!*(unsigned char *)(a2 + i)) {
        *(float *)(v6 + 4 * i) = *(float *)(v6 + 4 * i) * (float)((float)rand() * 4.6566e-10);
      }
    }
  }
  return v6;
}

uint64_t sub_11A64()
{
  return 7;
}

uint64_t sub_11A6C()
{
  return 13;
}

uint64_t sub_11A78(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 16);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 56))();
  }
  return result;
}

uint64_t sub_11AA8()
{
  return 0;
}

void *sub_11AB0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    int v3 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v2 + 120))(v2);
  }
  else
  {
    int v3 = sub_89A0(0x18uLL);
    int v4 = *(_DWORD *)(a1 + 24);
    void *v3 = off_1AA280;
    v3[1] = 0;
    *((_DWORD *)v3 + 4) = v4;
  }
  uint64_t v5 = sub_89A0(0x20uLL);
  sub_11EFC((uint64_t)v5, v3);
  return v5;
}

void sub_11B4C(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_11B64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    BOOL v3 = *(void *)(a1 + 16) == a2;
  }
  else {
    BOOL v3 = 0;
  }
  uint64_t v4 = v3;
  if (v3)
  {
    (*(void (**)(uint64_t))(*(void *)a2 + 152))(a2);
    *(void *)(a1 + 16) = a3;
    *(void *)(a3 + 8) = a1;
  }
  return v4;
}

uint64_t sub_11BD8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 16);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 72))();
  }
  return result;
}

uint64_t sub_11C08(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 16);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 80))();
  }
  return result;
}

uint64_t sub_11C38(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 16);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 88))();
  }
  return result;
}

void sub_11C6C(void *a1)
{
  uint64_t v2 = a1[2];
  if (v2) {
    BOOL v3 = (const char *)(*(uint64_t (**)(uint64_t))(*(void *)v2 + 104))(v2);
  }
  else {
    BOOL v3 = 0;
  }
  uint64_t v4 = (&off_1EFB30)[(*(int (**)(void *))(*a1 + 288))(a1)];
  if (v3) {
    strlen(v3);
  }
  strlen(v4);
  operator new[]();
}

uint64_t sub_11D98()
{
  return 1;
}

uint64_t sub_11DA0()
{
  return 0;
}

uint64_t sub_11DA8(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = off_1A5DF8;
  *(void *)(a1 + 8) = 0;
  sub_10218(a1, a2);
  if (*(void *)(a2 + 8) <= *(void *)(a2 + 16))
  {
    uint64_t v4 = (float (****)(void))(a1 + 16);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)a1 + 256))(a1, a2, a1 + 16);
    if (*(void *)(a1 + 16)
      && (*(unsigned int (**)(void))(**(void **)(a1 + 16) + 40))(*(void *)(a1 + 16)))
    {
      *(float *)(a1 + 24) = (***v4)();
      uint64_t v5 = *(void *)(a1 + 16);
      if (v5) {
        (*(void (**)(uint64_t))(*(void *)v5 + 152))(v5);
      }
      *uint64_t v4 = 0;
    }
  }
  else
  {
    *(void *)(a1 + 16) = 0;
    *(_DWORD *)(a1 + 24) = 1065353216;
  }
  return a1;
}

void sub_11EDC(_Unwind_Exception *a1)
{
  void *v1 = off_1A5578;
  v1[1] = 0;
  _Unwind_Resume(a1);
}

uint64_t sub_11EFC(uint64_t a1, void *a2)
{
  *(void *)a1 = off_1A5DF8;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = a2;
  if (a2)
  {
    a2[1] = a1;
    if ((*(unsigned int (**)(void *))(*a2 + 40))(a2))
    {
      *(float *)(a1 + 24) = (***(float (****)(void))(a1 + 16))(*(void *)(a1 + 16));
      uint64_t v3 = *(void *)(a1 + 16);
      if (v3) {
        (*(void (**)(uint64_t))(*(void *)v3 + 152))(v3);
      }
      *(void *)(a1 + 16) = 0;
    }
  }
  else
  {
    *(_DWORD *)(a1 + 24) = 1065353216;
  }
  return a1;
}

void sub_11FDC(_Unwind_Exception *a1)
{
  void *v1 = off_1A5578;
  v1[1] = 0;
  _Unwind_Resume(a1);
}

void *sub_11FFC(void *a1)
{
  *a1 = off_1A5DF8;
  uint64_t v2 = a1[2];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 152))(v2);
  }
  *a1 = off_1A5578;
  a1[1] = 0;
  return a1;
}

void sub_12084(_Unwind_Exception *a1)
{
  void *v1 = off_1A5578;
  v1[1] = 0;
  _Unwind_Resume(a1);
}

void sub_120A8(void *a1)
{
  sub_11FFC(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_120F0(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

float sub_12108(uint64_t a1)
{
  (***(void (****)(void))(a1 + 16))(*(void *)(a1 + 16));
  return mathParser::sin<float>(v1);
}

uint64_t sub_12154(uint64_t a1, int a2)
{
  LODWORD(v2) = a2;
  uint64_t v3 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16));
  uint64_t v4 = v3;
  if (v3) {
    BOOL v5 = (int)v2 < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    uint64_t v2 = v2;
    uint64_t v6 = (float *)v3;
    do
    {
      *uint64_t v6 = mathParser::sin<float>(*v6);
      ++v6;
      --v2;
    }
    while (v2);
  }
  return v4;
}

uint64_t sub_121D4(uint64_t a1, unsigned __int8 *a2, int a3)
{
  LODWORD(v3) = a3;
  uint64_t v5 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16));
  uint64_t v6 = v5;
  if (v5) {
    BOOL v7 = (int)v3 < 1;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    uint64_t v3 = v3;
    uint64_t v8 = (float *)v5;
    do
    {
      if (!*a2++) {
        float *v8 = mathParser::sin<float>(*v8);
      }
      ++v8;
      --v3;
    }
    while (v3);
  }
  return v6;
}

uint64_t sub_12264()
{
  return 8;
}

void *sub_1226C(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 112))(*(void *)(a1 + 16));
  uint64_t v3 = sub_89A0(0x18uLL);
  uint64_t v4 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 120))(*(void *)(a1 + 16));
  sub_10788(v3, v4);
  void *v3 = off_1A6068;
  uint64_t v5 = sub_89A0(0x20uLL);
  sub_1B2FC(v5, v2, (uint64_t)v3);
  *uint64_t v5 = off_1A83D0;
  return v5;
}

void sub_1237C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9, uint64_t a10)
{
  __int16 v14 = v12;
  if (v14) {
    free(v14);
  }
  if (a2 == 1)
  {
    long long v16 = __cxa_begin_catch(exception_object);
    long long v18 = *(_OWORD *)v16;
    uint64_t v19 = *((void *)v16 + 2);
    if (v11) {
      (*(void (**)(uint64_t))(*(void *)v11 + 152))(v11);
    }
    if (v10) {
      (*(void (**)(uint64_t))(*(void *)v10 + 152))(v10);
    }
    exception = __cxa_allocate_exception(0x18uLL);
    *(_OWORD *)exception = v18;
    exception[2] = v19;
  }
  _Unwind_Resume(exception_object);
}

float sub_1247C(uint64_t a1)
{
  (***(void (****)(void))(a1 + 16))(*(void *)(a1 + 16));
  return mathParser::cos<float>(v1);
}

uint64_t sub_124C8(uint64_t a1, int a2)
{
  LODWORD(v2) = a2;
  uint64_t v3 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16));
  uint64_t v4 = v3;
  if (v3) {
    BOOL v5 = (int)v2 < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    uint64_t v2 = v2;
    uint64_t v6 = (float *)v3;
    do
    {
      *uint64_t v6 = mathParser::cos<float>(*v6);
      ++v6;
      --v2;
    }
    while (v2);
  }
  return v4;
}

uint64_t sub_12548(uint64_t a1, unsigned __int8 *a2, int a3)
{
  LODWORD(v3) = a3;
  uint64_t v5 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16));
  uint64_t v6 = v5;
  if (v5) {
    BOOL v7 = (int)v3 < 1;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    uint64_t v3 = v3;
    uint64_t v8 = (float *)v5;
    do
    {
      if (!*a2++) {
        float *v8 = mathParser::cos<float>(*v8);
      }
      ++v8;
      --v3;
    }
    while (v3);
  }
  return v6;
}

uint64_t sub_125D8()
{
  return 9;
}

void *sub_125E0(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 112))(*(void *)(a1 + 16));
  uint64_t v3 = sub_89A0(0x18uLL);
  uint64_t v4 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 120))(*(void *)(a1 + 16));
  sub_10788(v3, v4);
  void *v3 = off_1A5F30;
  uint64_t v5 = sub_89A0(0x18uLL);
  sub_10788(v5, (uint64_t)v3);
  *uint64_t v5 = off_1A5CC0;
  uint64_t v6 = sub_89A0(0x20uLL);
  sub_1B2FC(v6, v2, (uint64_t)v5);
  *uint64_t v6 = off_1A83D0;
  return v6;
}

void sub_12728(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9, uint64_t a10)
{
  if (v11) {
    free(v11);
  }
  if (a2 == 1)
  {
    __int16 v15 = __cxa_begin_catch(exception_object);
    long long v17 = *(_OWORD *)v15;
    uint64_t v18 = *((void *)v15 + 2);
    if (v12) {
      (*(void (**)(uint64_t))(*(void *)v12 + 152))(v12);
    }
    if (v10) {
      (*(void (**)(uint64_t))(*(void *)v10 + 152))(v10);
    }
    exception = __cxa_allocate_exception(0x18uLL);
    *(_OWORD *)exception = v17;
    exception[2] = v18;
  }
  _Unwind_Resume(exception_object);
}

float sub_12840(float (****a1)(void))
{
  float v2 = (**a1[2])(a1[2]);
  if (mathParser::isValueFallOnSinCosZeroCycle<float>(90, v2)) {
    ((void (*)(float (****)(void), uint64_t, uint64_t, uint64_t))(*a1)[34])(a1, 12, -1, -1);
  }
  return mathParser::tan<float>(v2);
}

uint64_t sub_128F0(void **a1, int a2)
{
  LODWORD(v2) = a2;
  uint64_t v4 = (*(uint64_t (**)(void *))(*a1[2] + 8))(a1[2]);
  uint64_t v5 = v4;
  if (v4) {
    BOOL v6 = (int)v2 < 1;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    uint64_t v2 = v2;
    BOOL v7 = (float *)v4;
    do
    {
      if (mathParser::isValueFallOnSinCosZeroCycle<float>(90, *v7)) {
        ((void (*)(void **, uint64_t, uint64_t, uint64_t))(*a1)[34])(a1, 12, -1, -1);
      }
      *BOOL v7 = mathParser::tan<float>(*v7);
      ++v7;
      --v2;
    }
    while (v2);
  }
  return v5;
}

uint64_t sub_129C0(uint64_t a1, unsigned char *a2, int a3)
{
  LODWORD(v3) = a3;
  uint64_t v5 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16));
  uint64_t v6 = v5;
  if (v5) {
    BOOL v7 = (int)v3 < 1;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    uint64_t v3 = v3;
    uint64_t v8 = (float *)v5;
    do
    {
      if (!*a2)
      {
        if (mathParser::isValueFallOnSinCosZeroCycle<float>(90, *v8)) {
          *a2 = 12;
        }
        else {
          float *v8 = mathParser::tan<float>(*v8);
        }
      }
      ++v8;
      ++a2;
      --v3;
    }
    while (v3);
  }
  return v6;
}

uint64_t sub_12A78()
{
  return 10;
}

void *sub_12A80(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 112))(*(void *)(a1 + 16));
  uint64_t v3 = sub_89A0(0x18uLL);
  uint64_t v4 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 120))(*(void *)(a1 + 16));
  sub_10788(v3, v4);
  void *v3 = off_1A62D8;
  uint64_t v5 = sub_89A0(0x20uLL);
  uint64_t v6 = sub_89A0(0x18uLL);
  *uint64_t v6 = off_1AA280;
  v6[1] = 0;
  *((_DWORD *)v6 + 4) = 0x40000000;
  sub_1B2FC(v5, (uint64_t)v3, (uint64_t)v6);
  *uint64_t v5 = off_1A8790;
  BOOL v7 = sub_89A0(0x20uLL);
  sub_1B2FC(v7, v2, (uint64_t)v5);
  *BOOL v7 = off_1A83D0;
  return v7;
}

void sub_12BFC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9, uint64_t a10)
{
  if (v11) {
    free(v11);
  }
  if (a2 == 1)
  {
    __int16 v15 = __cxa_begin_catch(exception_object);
    long long v17 = *(_OWORD *)v15;
    uint64_t v18 = *((void *)v15 + 2);
    if (v12) {
      (*(void (**)(uint64_t))(*(void *)v12 + 152))(v12);
    }
    if (v10) {
      (*(void (**)(uint64_t))(*(void *)v10 + 152))(v10);
    }
    exception = __cxa_allocate_exception(0x18uLL);
    *(_OWORD *)exception = v17;
    exception[2] = v18;
  }
  _Unwind_Resume(exception_object);
}

float sub_12D14(float (****a1)(void))
{
  float v2 = (**a1[2])(a1[2]);
  if (mathParser::isValueFallOnSinCosZeroCycle<float>(90, v2)) {
    ((void (*)(float (****)(void), uint64_t, uint64_t, uint64_t))(*a1)[34])(a1, 14, -1, -1);
  }
  return 1.0 / mathParser::cos<float>(v2);
}

uint64_t sub_12DC0(void **a1, int a2)
{
  LODWORD(v2) = a2;
  uint64_t v4 = (*(uint64_t (**)(void *))(*a1[2] + 8))(a1[2]);
  uint64_t v5 = v4;
  if (v4) {
    BOOL v6 = (int)v2 < 1;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    uint64_t v2 = v2;
    BOOL v7 = (float *)v4;
    do
    {
      if (mathParser::isValueFallOnSinCosZeroCycle<float>(90, *v7)) {
        ((void (*)(void **, uint64_t, uint64_t, uint64_t))(*a1)[34])(a1, 14, -1, -1);
      }
      *BOOL v7 = 1.0 / mathParser::cos<float>(*v7);
      ++v7;
      --v2;
    }
    while (v2);
  }
  return v5;
}

uint64_t sub_12EA0(uint64_t a1, unsigned char *a2, int a3)
{
  LODWORD(v3) = a3;
  uint64_t v5 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16));
  uint64_t v6 = v5;
  if (v5) {
    BOOL v7 = (int)v3 < 1;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    uint64_t v3 = v3;
    uint64_t v8 = (float *)v5;
    do
    {
      if (!*a2)
      {
        if (mathParser::isValueFallOnSinCosZeroCycle<float>(90, *v8)) {
          *a2 = 14;
        }
        else {
          float *v8 = 1.0 / mathParser::cos<float>(*v8);
        }
      }
      ++v8;
      ++a2;
      --v3;
    }
    while (v3);
  }
  return v6;
}

uint64_t sub_12F68()
{
  return 11;
}

void *sub_12F70(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 112))(*(void *)(a1 + 16));
  uint64_t v3 = sub_89A0(0x18uLL);
  uint64_t v4 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 120))(*(void *)(a1 + 16));
  sub_10788(v3, v4);
  void *v3 = off_1A62D8;
  uint64_t v5 = sub_89A0(0x20uLL);
  sub_1B2FC(v5, v2, (uint64_t)v3);
  *uint64_t v5 = off_1A83D0;
  uint64_t v6 = sub_89A0(0x18uLL);
  uint64_t v7 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 120))(*(void *)(a1 + 16));
  sub_10788(v6, v7);
  *uint64_t v6 = off_1A61A0;
  uint64_t v8 = sub_89A0(0x20uLL);
  sub_1B2FC(v8, (uint64_t)v5, (uint64_t)v6);
  void *v8 = off_1A83D0;
  return v8;
}

void sub_13120(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, long long a11, uint64_t a12)
{
  if (v12) {
    free(v12);
  }
  if (a2 == 1)
  {
    long long v17 = __cxa_begin_catch(exception_object);
    long long v19 = *(_OWORD *)v17;
    uint64_t v20 = *((void *)v17 + 2);
    if (v13) {
      (*(void (**)(uint64_t))(*(void *)v13 + 152))(v13);
    }
    if (v14) {
      (*(void (**)(uint64_t))(*(void *)v14 + 152))(v14);
    }
    exception = __cxa_allocate_exception(0x18uLL);
    *(_OWORD *)exception = v19;
    exception[2] = v20;
  }
  _Unwind_Resume(exception_object);
}

float sub_1325C(float (****a1)(void))
{
  float v2 = (**a1[2])(a1[2]);
  if (mathParser::isValueFallOnSinCosZeroCycle<float>(180, v2)) {
    ((void (*)(float (****)(void), uint64_t, uint64_t, uint64_t))(*a1)[34])(a1, 15, -1, -1);
  }
  return 1.0 / mathParser::sin<float>(v2);
}

uint64_t sub_13308(void **a1, int a2)
{
  LODWORD(v2) = a2;
  uint64_t v4 = (*(uint64_t (**)(void *))(*a1[2] + 8))(a1[2]);
  uint64_t v5 = v4;
  if (v4) {
    BOOL v6 = (int)v2 < 1;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    uint64_t v2 = v2;
    uint64_t v7 = (float *)v4;
    do
    {
      if (mathParser::isValueFallOnSinCosZeroCycle<float>(180, *v7)) {
        ((void (*)(void **, uint64_t, uint64_t, uint64_t))(*a1)[34])(a1, 15, -1, -1);
      }
      *uint64_t v7 = 1.0 / mathParser::sin<float>(*v7);
      ++v7;
      --v2;
    }
    while (v2);
  }
  return v5;
}

uint64_t sub_133E8(uint64_t a1, unsigned char *a2, int a3)
{
  LODWORD(v3) = a3;
  uint64_t v5 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16));
  uint64_t v6 = v5;
  if (v5) {
    BOOL v7 = (int)v3 < 1;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    uint64_t v3 = v3;
    uint64_t v8 = (float *)v5;
    do
    {
      if (!*a2)
      {
        if (mathParser::isValueFallOnSinCosZeroCycle<float>(180, *v8)) {
          *a2 = 15;
        }
        else {
          float *v8 = 1.0 / mathParser::sin<float>(*v8);
        }
      }
      ++v8;
      ++a2;
      --v3;
    }
    while (v3);
  }
  return v6;
}

uint64_t sub_134B0()
{
  return 12;
}

void *sub_134B8(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 112))(*(void *)(a1 + 16));
  uint64_t v3 = sub_89A0(0x18uLL);
  uint64_t v4 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 120))(*(void *)(a1 + 16));
  sub_10788(v3, v4);
  void *v3 = off_1A6410;
  uint64_t v5 = sub_89A0(0x20uLL);
  sub_1B2FC(v5, v2, (uint64_t)v3);
  *uint64_t v5 = off_1A83D0;
  uint64_t v6 = sub_89A0(0x18uLL);
  uint64_t v7 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 120))(*(void *)(a1 + 16));
  sub_10788(v6, v7);
  *uint64_t v6 = off_1A6548;
  uint64_t v8 = sub_89A0(0x20uLL);
  sub_1B2FC(v8, (uint64_t)v5, (uint64_t)v6);
  void *v8 = off_1A83D0;
  unint64_t v9 = sub_89A0(0x18uLL);
  sub_10788(v9, (uint64_t)v8);
  void *v9 = off_1A5CC0;
  return v9;
}

void sub_136A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9, uint64_t a10)
{
  if (v11) {
    free(v11);
  }
  if (a2 == 1)
  {
    __int16 v15 = __cxa_begin_catch(exception_object);
    long long v17 = *(_OWORD *)v15;
    uint64_t v18 = *((void *)v15 + 2);
    if (v12) {
      (*(void (**)(uint64_t))(*(void *)v12 + 152))(v12);
    }
    if (v10) {
      (*(void (**)(uint64_t))(*(void *)v10 + 152))(v10);
    }
    exception = __cxa_allocate_exception(0x18uLL);
    *(_OWORD *)exception = v17;
    exception[2] = v18;
  }
  _Unwind_Resume(exception_object);
}

float sub_137F8(float (****a1)(void))
{
  float v2 = (**a1[2])(a1[2]);
  if (mathParser::isValueFallOnSinCosZeroCycle<float>(180, v2)) {
    ((void (*)(float (****)(void), uint64_t, uint64_t, uint64_t))(*a1)[34])(a1, 13, -1, -1);
  }
  return 1.0 / mathParser::tan<float>(v2);
}

uint64_t sub_138A4(void **a1, int a2)
{
  LODWORD(v2) = a2;
  uint64_t v4 = (*(uint64_t (**)(void *))(*a1[2] + 8))(a1[2]);
  uint64_t v5 = v4;
  if (v4) {
    BOOL v6 = (int)v2 < 1;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    uint64_t v2 = v2;
    uint64_t v7 = (float *)v4;
    do
    {
      if (mathParser::isValueFallOnSinCosZeroCycle<float>(180, *v7)) {
        ((void (*)(void **, uint64_t, uint64_t, uint64_t))(*a1)[34])(a1, 13, -1, -1);
      }
      *uint64_t v7 = 1.0 / mathParser::tan<float>(*v7);
      ++v7;
      --v2;
    }
    while (v2);
  }
  return v5;
}

uint64_t sub_13984(uint64_t a1, unsigned char *a2, int a3)
{
  LODWORD(v3) = a3;
  uint64_t v5 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16));
  uint64_t v6 = v5;
  if (v5) {
    BOOL v7 = (int)v3 < 1;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    uint64_t v3 = v3;
    uint64_t v8 = (float *)v5;
    do
    {
      if (!*a2)
      {
        if (mathParser::isValueFallOnSinCosZeroCycle<float>(180, *v8)) {
          *a2 = 13;
        }
        else {
          float *v8 = 1.0 / mathParser::tan<float>(*v8);
        }
      }
      ++v8;
      ++a2;
      --v3;
    }
    while (v3);
  }
  return v6;
}

uint64_t sub_13A4C()
{
  return 13;
}

void *sub_13A54(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 112))(*(void *)(a1 + 16));
  uint64_t v3 = sub_89A0(0x18uLL);
  uint64_t v4 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 120))(*(void *)(a1 + 16));
  sub_10788(v3, v4);
  void *v3 = off_1A6410;
  uint64_t v5 = sub_89A0(0x20uLL);
  uint64_t v6 = sub_89A0(0x18uLL);
  *uint64_t v6 = off_1AA280;
  v6[1] = 0;
  *((_DWORD *)v6 + 4) = 0x40000000;
  sub_1B2FC(v5, (uint64_t)v3, (uint64_t)v6);
  *uint64_t v5 = off_1A8790;
  BOOL v7 = sub_89A0(0x20uLL);
  sub_1B2FC(v7, v2, (uint64_t)v5);
  *BOOL v7 = off_1A83D0;
  uint64_t v8 = sub_89A0(0x18uLL);
  sub_10788(v8, (uint64_t)v7);
  void *v8 = off_1A5CC0;
  return v8;
}

void sub_13C08(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9, uint64_t a10)
{
  if (v10) {
    free(v10);
  }
  if (a2 == 1)
  {
    uint64_t v14 = __cxa_begin_catch(exception_object);
    long long v16 = *(_OWORD *)v14;
    uint64_t v17 = *((void *)v14 + 2);
    if (v11) {
      (*(void (**)(uint64_t))(*(void *)v11 + 152))(v11);
    }
    exception = __cxa_allocate_exception(0x18uLL);
    *(_OWORD *)exception = v16;
    exception[2] = v17;
  }
  _Unwind_Resume(exception_object);
}

float sub_13D44(float (****a1)(void))
{
  float v2 = (**a1[2])(a1[2]);
  if (v2 > 1.0 || v2 < -1.0) {
    ((void (*)(float (****)(void), uint64_t, uint64_t, uint64_t))(*a1)[34])(a1, 6, -1, -1);
  }
  return mathParser::asin<float>(v2);
}

uint64_t sub_13DFC(uint64_t a1, int a2)
{
  LODWORD(v2) = a2;
  uint64_t v3 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16));
  uint64_t v4 = v3;
  if (v3) {
    BOOL v5 = (int)v2 < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    uint64_t v2 = v2;
    uint64_t v6 = (float *)v3;
    do
    {
      *uint64_t v6 = mathParser::asin<float>(*v6);
      ++v6;
      --v2;
    }
    while (v2);
  }
  return v4;
}

uint64_t sub_13E7C(uint64_t a1, unsigned char *a2, int a3)
{
  LODWORD(v3) = a3;
  uint64_t v5 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16));
  uint64_t v6 = v5;
  if (v5) {
    BOOL v7 = (int)v3 < 1;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    uint64_t v3 = v3;
    uint64_t v8 = (float *)v5;
    do
    {
      if (!*a2)
      {
        float v9 = *v8;
        if (*v8 > 1.0 || v9 < -1.0) {
          *a2 = 6;
        }
        else {
          float *v8 = mathParser::asin<float>(v9);
        }
      }
      ++v8;
      ++a2;
      --v3;
    }
    while (v3);
  }
  return v6;
}

uint64_t sub_13F40()
{
  return 14;
}

void *sub_13F48(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_89A0(0x20uLL);
  uint64_t v5 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 120))(*(void *)(a1 + 16));
  uint64_t v6 = sub_89A0(0x18uLL);
  *uint64_t v6 = off_1AA280;
  v6[1] = 0;
  *((_DWORD *)v6 + 4) = 0x40000000;
  sub_1B2FC(v4, v5, (uint64_t)v6);
  *uint64_t v4 = off_1A8790;
  BOOL v7 = sub_89A0(0x20uLL);
  uint64_t v8 = sub_89A0(0x18uLL);
  void *v8 = off_1AA280;
  v8[1] = 0;
  *((_DWORD *)v8 + 4) = 1065353216;
  sub_1B2FC(v7, (uint64_t)v8, (uint64_t)v4);
  *BOOL v7 = off_1A8290;
  float v9 = sub_89A0(0x18uLL);
  sub_10788(v9, (uint64_t)v7);
  void *v9 = off_1A5B88;
  uint64_t v10 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 16) + 112))(*(void *)(a1 + 16), a2);
  uint64_t v11 = sub_89A0(0x20uLL);
  sub_1B2FC(v11, v10, (uint64_t)v9);
  *uint64_t v11 = off_1A8510;
  return v11;
}

void sub_14138(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9, uint64_t a10)
{
  if (v12) {
    free(v12);
  }
  if (a2 == 1)
  {
    __int16 v15 = __cxa_begin_catch(exception_object);
    long long v17 = *(_OWORD *)v15;
    uint64_t v18 = *((void *)v15 + 2);
    if (v10) {
      (*(void (**)(uint64_t))(*(void *)v10 + 152))(v10);
    }
    if (v11) {
      (*(void (**)(uint64_t))(*(void *)v11 + 152))(v11);
    }
    exception = __cxa_allocate_exception(0x18uLL);
    *(_OWORD *)exception = v17;
    exception[2] = v18;
  }
  _Unwind_Resume(exception_object);
}

float sub_14278(float (****a1)(void))
{
  float v2 = (**a1[2])(a1[2]);
  if (v2 > 1.0 || v2 < -1.0) {
    ((void (*)(float (****)(void), uint64_t, uint64_t, uint64_t))(*a1)[34])(a1, 7, -1, -1);
  }
  return mathParser::acos<float>(v2);
}

uint64_t sub_14330(uint64_t a1, int a2)
{
  LODWORD(v2) = a2;
  uint64_t v3 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16));
  uint64_t v4 = v3;
  if (v3) {
    BOOL v5 = (int)v2 < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    uint64_t v2 = v2;
    uint64_t v6 = (float *)v3;
    do
    {
      *uint64_t v6 = mathParser::acos<float>(*v6);
      ++v6;
      --v2;
    }
    while (v2);
  }
  return v4;
}

uint64_t sub_143B0(uint64_t a1, unsigned char *a2, int a3)
{
  LODWORD(v3) = a3;
  uint64_t v5 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16));
  uint64_t v6 = v5;
  if (v5) {
    BOOL v7 = (int)v3 < 1;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    uint64_t v3 = v3;
    uint64_t v8 = (float *)v5;
    do
    {
      if (!*a2)
      {
        float v9 = *v8;
        if (*v8 > 1.0 || v9 < -1.0) {
          *a2 = 7;
        }
        else {
          float *v8 = mathParser::acos<float>(v9);
        }
      }
      ++v8;
      ++a2;
      --v3;
    }
    while (v3);
  }
  return v6;
}

uint64_t sub_14474()
{
  return 15;
}

void *sub_1447C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_89A0(0x20uLL);
  uint64_t v5 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 120))(*(void *)(a1 + 16));
  uint64_t v6 = sub_89A0(0x18uLL);
  *uint64_t v6 = off_1AA280;
  v6[1] = 0;
  *((_DWORD *)v6 + 4) = 0x40000000;
  sub_1B2FC(v4, v5, (uint64_t)v6);
  *uint64_t v4 = off_1A8790;
  BOOL v7 = sub_89A0(0x20uLL);
  uint64_t v8 = sub_89A0(0x18uLL);
  void *v8 = off_1AA280;
  v8[1] = 0;
  *((_DWORD *)v8 + 4) = 1065353216;
  sub_1B2FC(v7, (uint64_t)v8, (uint64_t)v4);
  *BOOL v7 = off_1A8290;
  float v9 = sub_89A0(0x18uLL);
  sub_10788(v9, (uint64_t)v7);
  void *v9 = off_1A5B88;
  uint64_t v10 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 16) + 112))(*(void *)(a1 + 16), a2);
  uint64_t v11 = sub_89A0(0x18uLL);
  sub_10788(v11, v10);
  *uint64_t v11 = off_1A5CC0;
  uint64_t v12 = sub_89A0(0x20uLL);
  sub_1B2FC(v12, (uint64_t)v11, (uint64_t)v9);
  *uint64_t v12 = off_1A8510;
  return v12;
}

void sub_146A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9, uint64_t a10)
{
  if (v11) {
    free(v11);
  }
  if (a2 == 1)
  {
    __int16 v15 = __cxa_begin_catch(exception_object);
    long long v17 = *(_OWORD *)v15;
    uint64_t v18 = *((void *)v15 + 2);
    if (v10) {
      (*(void (**)(uint64_t))(*(void *)v10 + 152))(v10);
    }
    if (v12) {
      (*(void (**)(uint64_t))(*(void *)v12 + 152))(v12);
    }
    exception = __cxa_allocate_exception(0x18uLL);
    *(_OWORD *)exception = v17;
    exception[2] = v18;
  }
  _Unwind_Resume(exception_object);
}

float sub_14800(uint64_t a1)
{
  (***(void (****)(void))(a1 + 16))(*(void *)(a1 + 16));
  return mathParser::atan<float>(v1);
}

uint64_t sub_1484C(uint64_t a1, int a2)
{
  LODWORD(v2) = a2;
  uint64_t v3 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16));
  uint64_t v4 = v3;
  if (v3) {
    BOOL v5 = (int)v2 < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    uint64_t v2 = v2;
    uint64_t v6 = (float *)v3;
    do
    {
      *uint64_t v6 = mathParser::atan<float>(*v6);
      ++v6;
      --v2;
    }
    while (v2);
  }
  return v4;
}

uint64_t sub_148CC(uint64_t a1, unsigned __int8 *a2, int a3)
{
  LODWORD(v3) = a3;
  uint64_t v5 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16));
  uint64_t v6 = v5;
  if (v5) {
    BOOL v7 = (int)v3 < 1;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    uint64_t v3 = v3;
    uint64_t v8 = (float *)v5;
    do
    {
      if (!*a2++) {
        float *v8 = mathParser::atan<float>(*v8);
      }
      ++v8;
      --v3;
    }
    while (v3);
  }
  return v6;
}

uint64_t sub_1495C()
{
  return 16;
}

void *sub_14964(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_89A0(0x20uLL);
  uint64_t v5 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 120))(*(void *)(a1 + 16));
  uint64_t v6 = sub_89A0(0x18uLL);
  *uint64_t v6 = off_1AA280;
  v6[1] = 0;
  *((_DWORD *)v6 + 4) = 0x40000000;
  sub_1B2FC(v4, v5, (uint64_t)v6);
  *uint64_t v4 = off_1A8790;
  BOOL v7 = sub_89A0(0x20uLL);
  uint64_t v8 = sub_89A0(0x18uLL);
  void *v8 = off_1AA280;
  v8[1] = 0;
  *((_DWORD *)v8 + 4) = 1065353216;
  sub_1B2FC(v7, (uint64_t)v8, (uint64_t)v4);
  *BOOL v7 = off_1A8150;
  uint64_t v9 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 16) + 112))(*(void *)(a1 + 16), a2);
  uint64_t v10 = sub_89A0(0x20uLL);
  sub_1B2FC(v10, v9, (uint64_t)v7);
  *uint64_t v10 = off_1A8510;
  return v10;
}

void sub_14B1C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9, uint64_t a10)
{
  if (v10) {
    free(v10);
  }
  if (a2 == 1)
  {
    __int16 v15 = __cxa_begin_catch(exception_object);
    long long v17 = *(_OWORD *)v15;
    uint64_t v18 = *((void *)v15 + 2);
    if (v12) {
      (*(void (**)(uint64_t))(*(void *)v12 + 152))(v12);
    }
    if (v11) {
      (*(void (**)(uint64_t))(*(void *)v11 + 152))(v11);
    }
    exception = __cxa_allocate_exception(0x18uLL);
    *(_OWORD *)exception = v17;
    exception[2] = v18;
  }
  _Unwind_Resume(exception_object);
}

float sub_14C40(float (****a1)(void))
{
  float v2 = (**a1[2])(a1[2]);
  if (v2 < 1.0 && v2 > -1.0) {
    ((void (*)(float (****)(void), uint64_t, uint64_t, uint64_t))(*a1)[34])(a1, 8, -1, -1);
  }
  return mathParser::acos<float>(1.0 / v2);
}

uint64_t sub_14CF8(uint64_t a1, int a2)
{
  LODWORD(v2) = a2;
  uint64_t v3 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16));
  uint64_t v4 = v3;
  if (v3) {
    BOOL v5 = (int)v2 < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    uint64_t v2 = v2;
    uint64_t v6 = (float *)v3;
    do
    {
      *uint64_t v6 = mathParser::acos<float>(1.0 / *v6);
      ++v6;
      --v2;
    }
    while (v2);
  }
  return v4;
}

uint64_t sub_14D88(uint64_t a1, unsigned char *a2, int a3)
{
  LODWORD(v3) = a3;
  uint64_t v5 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16));
  uint64_t v6 = v5;
  if (v5) {
    BOOL v7 = (int)v3 < 1;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    uint64_t v3 = v3;
    uint64_t v8 = (float *)v5;
    do
    {
      if (!*a2)
      {
        float v9 = *v8;
        if (*v8 < 1.0 && v9 > -1.0) {
          *a2 = 8;
        }
        else {
          float *v8 = mathParser::acos<float>(1.0 / v9);
        }
      }
      ++v8;
      ++a2;
      --v3;
    }
    while (v3);
  }
  return v6;
}

uint64_t sub_14E50()
{
  return 17;
}

void *sub_14E58(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_89A0(0x20uLL);
  uint64_t v5 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 120))(*(void *)(a1 + 16));
  uint64_t v6 = sub_89A0(0x18uLL);
  *uint64_t v6 = off_1AA280;
  v6[1] = 0;
  *((_DWORD *)v6 + 4) = 0x40000000;
  sub_1B2FC(v4, v5, (uint64_t)v6);
  *uint64_t v4 = off_1A8790;
  BOOL v7 = sub_89A0(0x20uLL);
  uint64_t v8 = sub_89A0(0x18uLL);
  void *v8 = off_1AA280;
  v8[1] = 0;
  *((_DWORD *)v8 + 4) = 1065353216;
  sub_1B2FC(v7, (uint64_t)v4, (uint64_t)v8);
  *BOOL v7 = off_1A8290;
  float v9 = sub_89A0(0x18uLL);
  sub_10788(v9, (uint64_t)v7);
  void *v9 = off_1A5B88;
  uint64_t v10 = sub_89A0(0x20uLL);
  uint64_t v11 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 120))(*(void *)(a1 + 16));
  sub_1B2FC(v10, v11, (uint64_t)v9);
  *uint64_t v10 = off_1A83D0;
  uint64_t v12 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 16) + 112))(*(void *)(a1 + 16), a2);
  uint64_t v13 = sub_89A0(0x20uLL);
  sub_1B2FC(v13, v12, (uint64_t)v10);
  *uint64_t v13 = off_1A8510;
  return v13;
}

void sub_150B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9, uint64_t a10)
{
  if (v10) {
    free(v10);
  }
  if (a2 == 1)
  {
    __int16 v15 = __cxa_begin_catch(exception_object);
    long long v17 = *(_OWORD *)v15;
    uint64_t v18 = *((void *)v15 + 2);
    if (v12) {
      (*(void (**)(uint64_t))(*(void *)v12 + 152))(v12);
    }
    if (v11) {
      (*(void (**)(uint64_t))(*(void *)v11 + 152))(v11);
    }
    exception = __cxa_allocate_exception(0x18uLL);
    *(_OWORD *)exception = v17;
    exception[2] = v18;
  }
  _Unwind_Resume(exception_object);
}

float sub_151F4(float (****a1)(void))
{
  float v2 = (**a1[2])(a1[2]);
  if (v2 <= 1.0 && v2 >= -1.0) {
    ((void (*)(float (****)(void), uint64_t, uint64_t, uint64_t))(*a1)[34])(a1, 9, -1, -1);
  }
  return mathParser::asin<float>(1.0 / v2);
}

uint64_t sub_152AC(uint64_t a1, int a2)
{
  LODWORD(v2) = a2;
  uint64_t v3 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16));
  uint64_t v4 = v3;
  if (v3) {
    BOOL v5 = (int)v2 < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    uint64_t v2 = v2;
    uint64_t v6 = (float *)v3;
    do
    {
      *uint64_t v6 = mathParser::asin<float>(1.0 / *v6);
      ++v6;
      --v2;
    }
    while (v2);
  }
  return v4;
}

uint64_t sub_1533C(uint64_t a1, unsigned char *a2, int a3)
{
  LODWORD(v3) = a3;
  uint64_t v5 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16));
  uint64_t v6 = v5;
  if (v5) {
    BOOL v7 = (int)v3 < 1;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    uint64_t v3 = v3;
    uint64_t v8 = (float *)v5;
    do
    {
      if (!*a2)
      {
        float v9 = *v8;
        if (*v8 < 1.0 && v9 > -1.0) {
          *a2 = 9;
        }
        else {
          float *v8 = mathParser::asin<float>(1.0 / v9);
        }
      }
      ++v8;
      ++a2;
      --v3;
    }
    while (v3);
  }
  return v6;
}

uint64_t sub_15404()
{
  return 18;
}

void *sub_1540C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_89A0(0x20uLL);
  uint64_t v5 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 120))(*(void *)(a1 + 16));
  uint64_t v6 = sub_89A0(0x18uLL);
  *uint64_t v6 = off_1AA280;
  v6[1] = 0;
  *((_DWORD *)v6 + 4) = 0x40000000;
  sub_1B2FC(v4, v5, (uint64_t)v6);
  *uint64_t v4 = off_1A8790;
  BOOL v7 = sub_89A0(0x20uLL);
  uint64_t v8 = sub_89A0(0x18uLL);
  void *v8 = off_1AA280;
  v8[1] = 0;
  *((_DWORD *)v8 + 4) = 1065353216;
  sub_1B2FC(v7, (uint64_t)v4, (uint64_t)v8);
  *BOOL v7 = off_1A8290;
  float v9 = sub_89A0(0x18uLL);
  sub_10788(v9, (uint64_t)v7);
  void *v9 = off_1A5B88;
  uint64_t v10 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 16) + 112))(*(void *)(a1 + 16), a2);
  uint64_t v11 = sub_89A0(0x18uLL);
  sub_10788(v11, v10);
  *uint64_t v11 = off_1A5CC0;
  uint64_t v12 = sub_89A0(0x20uLL);
  sub_1B2FC(v12, (uint64_t)v11, (uint64_t)v9);
  *uint64_t v12 = off_1A8510;
  return v12;
}

void sub_15634(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9, uint64_t a10)
{
  if (v11) {
    free(v11);
  }
  if (a2 == 1)
  {
    __int16 v15 = __cxa_begin_catch(exception_object);
    long long v17 = *(_OWORD *)v15;
    uint64_t v18 = *((void *)v15 + 2);
    if (v10) {
      (*(void (**)(uint64_t))(*(void *)v10 + 152))(v10);
    }
    if (v12) {
      (*(void (**)(uint64_t))(*(void *)v12 + 152))(v12);
    }
    exception = __cxa_allocate_exception(0x18uLL);
    *(_OWORD *)exception = v17;
    exception[2] = v18;
  }
  _Unwind_Resume(exception_object);
}

float sub_15790(float (****a1)(void))
{
  float v2 = (**a1[2])(a1[2]);
  if (v2 == 0.0) {
    ((void (*)(float (****)(void), uint64_t, uint64_t, uint64_t))(*a1)[34])(a1, 10, -1, -1);
  }
  return mathParser::atan<float>(1.0 / v2);
}

uint64_t sub_15840(uint64_t a1, int a2)
{
  LODWORD(v2) = a2;
  uint64_t v3 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16));
  uint64_t v4 = v3;
  if (v3) {
    BOOL v5 = (int)v2 < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    uint64_t v2 = v2;
    uint64_t v6 = (float *)v3;
    do
    {
      *uint64_t v6 = mathParser::atan<float>(1.0 / *v6);
      ++v6;
      --v2;
    }
    while (v2);
  }
  return v4;
}

uint64_t sub_158D0(uint64_t a1, unsigned char *a2, int a3)
{
  LODWORD(v3) = a3;
  uint64_t v5 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16));
  uint64_t v6 = v5;
  if (v5) {
    BOOL v7 = (int)v3 < 1;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    uint64_t v3 = v3;
    uint64_t v8 = (float *)v5;
    do
    {
      if (!*a2)
      {
        if (*v8 == 0.0) {
          *a2 = 10;
        }
        else {
          float *v8 = mathParser::atan<float>(1.0 / *v8);
        }
      }
      ++v8;
      ++a2;
      --v3;
    }
    while (v3);
  }
  return v6;
}

uint64_t sub_15990()
{
  return 19;
}

void *sub_15998(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_89A0(0x20uLL);
  uint64_t v5 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 120))(*(void *)(a1 + 16));
  uint64_t v6 = sub_89A0(0x18uLL);
  *uint64_t v6 = off_1AA280;
  v6[1] = 0;
  *((_DWORD *)v6 + 4) = 0x40000000;
  sub_1B2FC(v4, v5, (uint64_t)v6);
  *uint64_t v4 = off_1A8790;
  BOOL v7 = sub_89A0(0x20uLL);
  uint64_t v8 = sub_89A0(0x18uLL);
  void *v8 = off_1AA280;
  v8[1] = 0;
  *((_DWORD *)v8 + 4) = 1065353216;
  sub_1B2FC(v7, (uint64_t)v4, (uint64_t)v8);
  *BOOL v7 = off_1A8150;
  uint64_t v9 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 16) + 112))(*(void *)(a1 + 16), a2);
  uint64_t v10 = sub_89A0(0x18uLL);
  sub_10788(v10, v9);
  *uint64_t v10 = off_1A5CC0;
  uint64_t v11 = sub_89A0(0x20uLL);
  sub_1B2FC(v11, (uint64_t)v10, (uint64_t)v7);
  *uint64_t v11 = off_1A8510;
  return v11;
}

void sub_15B88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9, uint64_t a10)
{
  if (v12) {
    free(v12);
  }
  if (a2 == 1)
  {
    __int16 v15 = __cxa_begin_catch(exception_object);
    long long v17 = *(_OWORD *)v15;
    uint64_t v18 = *((void *)v15 + 2);
    if (v11) {
      (*(void (**)(uint64_t))(*(void *)v11 + 152))(v11);
    }
    if (v10) {
      (*(void (**)(uint64_t))(*(void *)v10 + 152))(v10);
    }
    exception = __cxa_allocate_exception(0x18uLL);
    *(_OWORD *)exception = v17;
    exception[2] = v18;
  }
  _Unwind_Resume(exception_object);
}

float sub_15CC8(uint64_t a1)
{
  (***(void (****)(void))(a1 + 16))(*(void *)(a1 + 16));
  return mathParser::sinh<float>(v1);
}

uint64_t sub_15D14(uint64_t a1, int a2)
{
  LODWORD(v2) = a2;
  uint64_t v3 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16));
  uint64_t v4 = v3;
  if (v3) {
    BOOL v5 = (int)v2 < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    uint64_t v2 = v2;
    uint64_t v6 = (float *)v3;
    do
    {
      *uint64_t v6 = mathParser::sinh<float>(*v6);
      ++v6;
      --v2;
    }
    while (v2);
  }
  return v4;
}

uint64_t sub_15D94(uint64_t a1, unsigned __int8 *a2, int a3)
{
  LODWORD(v3) = a3;
  uint64_t v5 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16));
  uint64_t v6 = v5;
  if (v5) {
    BOOL v7 = (int)v3 < 1;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    uint64_t v3 = v3;
    uint64_t v8 = (float *)v5;
    do
    {
      if (!*a2++) {
        float *v8 = mathParser::sinh<float>(*v8);
      }
      ++v8;
      --v3;
    }
    while (v3);
  }
  return v6;
}

uint64_t sub_15E24()
{
  return 20;
}

void *sub_15E2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_89A0(0x18uLL);
  uint64_t v5 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 120))(*(void *)(a1 + 16));
  sub_10788(v4, v5);
  *uint64_t v4 = &off_1A6F08;
  uint64_t v6 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 16) + 112))(*(void *)(a1 + 16), a2);
  BOOL v7 = sub_89A0(0x20uLL);
  sub_1B2FC(v7, v6, (uint64_t)v4);
  *BOOL v7 = off_1A83D0;
  return v7;
}

void sub_15F44(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9, uint64_t a10)
{
  uint64_t v14 = v12;
  if (v14) {
    free(v14);
  }
  if (a2 == 1)
  {
    long long v16 = __cxa_begin_catch(exception_object);
    long long v18 = *(_OWORD *)v16;
    uint64_t v19 = *((void *)v16 + 2);
    if (v10) {
      (*(void (**)(uint64_t))(*(void *)v10 + 152))(v10);
    }
    if (v11) {
      (*(void (**)(uint64_t))(*(void *)v11 + 152))(v11);
    }
    exception = __cxa_allocate_exception(0x18uLL);
    *(_OWORD *)exception = v18;
    exception[2] = v19;
  }
  _Unwind_Resume(exception_object);
}

float sub_16050(uint64_t a1)
{
  (***(void (****)(void))(a1 + 16))(*(void *)(a1 + 16));
  return mathParser::cosh<float>(v1);
}

uint64_t sub_1609C(uint64_t a1, int a2)
{
  LODWORD(v2) = a2;
  uint64_t v3 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16));
  uint64_t v4 = v3;
  if (v3) {
    BOOL v5 = (int)v2 < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    uint64_t v2 = v2;
    uint64_t v6 = (float *)v3;
    do
    {
      *uint64_t v6 = mathParser::cosh<float>(*v6);
      ++v6;
      --v2;
    }
    while (v2);
  }
  return v4;
}

uint64_t sub_1611C(uint64_t a1, unsigned __int8 *a2, int a3)
{
  LODWORD(v3) = a3;
  uint64_t v5 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16));
  uint64_t v6 = v5;
  if (v5) {
    BOOL v7 = (int)v3 < 1;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    uint64_t v3 = v3;
    uint64_t v8 = (float *)v5;
    do
    {
      if (!*a2++) {
        float *v8 = mathParser::cosh<float>(*v8);
      }
      ++v8;
      --v3;
    }
    while (v3);
  }
  return v6;
}

uint64_t sub_161AC()
{
  return 21;
}

void *sub_161B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_89A0(0x18uLL);
  uint64_t v5 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 120))(*(void *)(a1 + 16));
  sub_10788(v4, v5);
  *uint64_t v4 = &off_1A6DD0;
  uint64_t v6 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 16) + 112))(*(void *)(a1 + 16), a2);
  BOOL v7 = sub_89A0(0x20uLL);
  sub_1B2FC(v7, v6, (uint64_t)v4);
  *BOOL v7 = off_1A83D0;
  return v7;
}

void sub_162CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9, uint64_t a10)
{
  uint64_t v14 = v12;
  if (v14) {
    free(v14);
  }
  if (a2 == 1)
  {
    long long v16 = __cxa_begin_catch(exception_object);
    long long v18 = *(_OWORD *)v16;
    uint64_t v19 = *((void *)v16 + 2);
    if (v10) {
      (*(void (**)(uint64_t))(*(void *)v10 + 152))(v10);
    }
    if (v11) {
      (*(void (**)(uint64_t))(*(void *)v11 + 152))(v11);
    }
    exception = __cxa_allocate_exception(0x18uLL);
    *(_OWORD *)exception = v18;
    exception[2] = v19;
  }
  _Unwind_Resume(exception_object);
}

float sub_163D8(float (****a1)(void))
{
  float v2 = (**a1[2])(a1[2]);
  if (mathParser::cosh<float>(v2) == 0.0) {
    ((void (*)(float (****)(void), uint64_t, uint64_t, uint64_t))(*a1)[34])(a1, 16, -1, -1);
  }
  return mathParser::tanh<float>(v2);
}

uint64_t sub_16488(uint64_t a1, int a2)
{
  LODWORD(v2) = a2;
  uint64_t v3 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16));
  uint64_t v4 = v3;
  if (v3) {
    BOOL v5 = (int)v2 < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    uint64_t v2 = v2;
    uint64_t v6 = (float *)v3;
    do
    {
      *uint64_t v6 = mathParser::tanh<float>(*v6);
      ++v6;
      --v2;
    }
    while (v2);
  }
  return v4;
}

uint64_t sub_16508(uint64_t a1, unsigned char *a2, int a3)
{
  LODWORD(v3) = a3;
  uint64_t v5 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16));
  uint64_t v6 = v5;
  if (v5) {
    BOOL v7 = (int)v3 < 1;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    uint64_t v3 = v3;
    uint64_t v8 = (float *)v5;
    do
    {
      if (!*a2)
      {
        if (mathParser::cosh<float>(*v8) == 0.0) {
          *a2 = 16;
        }
        else {
          float *v8 = mathParser::tanh<float>(*v8);
        }
      }
      ++v8;
      ++a2;
      --v3;
    }
    while (v3);
  }
  return v6;
}

uint64_t sub_165C0()
{
  return 22;
}

void *sub_165C8(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 112))(*(void *)(a1 + 16));
  uint64_t v3 = sub_89A0(0x18uLL);
  uint64_t v4 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 120))(*(void *)(a1 + 16));
  sub_10788(v3, v4);
  void *v3 = off_1A7178;
  uint64_t v5 = sub_89A0(0x20uLL);
  uint64_t v6 = sub_89A0(0x18uLL);
  *uint64_t v6 = off_1AA280;
  v6[1] = 0;
  *((_DWORD *)v6 + 4) = 0x40000000;
  sub_1B2FC(v5, (uint64_t)v3, (uint64_t)v6);
  *uint64_t v5 = off_1A8790;
  BOOL v7 = sub_89A0(0x20uLL);
  sub_1B2FC(v7, v2, (uint64_t)v5);
  *BOOL v7 = off_1A83D0;
  return v7;
}

void sub_16744(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9, uint64_t a10)
{
  if (v11) {
    free(v11);
  }
  if (a2 == 1)
  {
    __int16 v15 = __cxa_begin_catch(exception_object);
    long long v17 = *(_OWORD *)v15;
    uint64_t v18 = *((void *)v15 + 2);
    if (v12) {
      (*(void (**)(uint64_t))(*(void *)v12 + 152))(v12);
    }
    if (v10) {
      (*(void (**)(uint64_t))(*(void *)v10 + 152))(v10);
    }
    exception = __cxa_allocate_exception(0x18uLL);
    *(_OWORD *)exception = v17;
    exception[2] = v18;
  }
  _Unwind_Resume(exception_object);
}

float sub_1685C(float (****a1)(void))
{
  float v2 = (**a1[2])(a1[2]);
  if (mathParser::cosh<float>(v2) == 0.0) {
    ((void (*)(float (****)(void), uint64_t, uint64_t, uint64_t))(*a1)[34])(a1, 17, -1, -1);
  }
  return 1.0 / mathParser::cosh<float>(v2);
}

uint64_t sub_16908(uint64_t a1, int a2)
{
  LODWORD(v2) = a2;
  uint64_t v3 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16));
  uint64_t v4 = v3;
  if (v3) {
    BOOL v5 = (int)v2 < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    uint64_t v2 = v2;
    uint64_t v6 = (float *)v3;
    do
    {
      *uint64_t v6 = 1.0 / mathParser::cosh<float>(*v6);
      ++v6;
      --v2;
    }
    while (v2);
  }
  return v4;
}

uint64_t sub_16998(uint64_t a1, unsigned char *a2, int a3)
{
  LODWORD(v3) = a3;
  uint64_t v5 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16));
  uint64_t v6 = v5;
  if (v5) {
    BOOL v7 = (int)v3 < 1;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    uint64_t v3 = v3;
    uint64_t v8 = (float *)v5;
    do
    {
      if (!*a2)
      {
        float v9 = mathParser::cosh<float>(*v8);
        if (v9 == 0.0) {
          *a2 = 17;
        }
        else {
          float *v8 = 1.0 / v9;
        }
      }
      ++v8;
      ++a2;
      --v3;
    }
    while (v3);
  }
  return v6;
}

uint64_t sub_16A58()
{
  return 23;
}

void *sub_16A60(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 112))(*(void *)(a1 + 16));
  uint64_t v3 = sub_89A0(0x18uLL);
  uint64_t v4 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 120))(*(void *)(a1 + 16));
  sub_10788(v3, v4);
  void *v3 = off_1A7178;
  uint64_t v5 = sub_89A0(0x20uLL);
  sub_1B2FC(v5, v2, (uint64_t)v3);
  *uint64_t v5 = off_1A83D0;
  uint64_t v6 = sub_89A0(0x18uLL);
  uint64_t v7 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 120))(*(void *)(a1 + 16));
  sub_10788(v6, v7);
  *uint64_t v6 = &off_1A7040;
  uint64_t v8 = sub_89A0(0x20uLL);
  sub_1B2FC(v8, (uint64_t)v5, (uint64_t)v6);
  void *v8 = off_1A83D0;
  return v8;
}

void sub_16C10(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, long long a11, uint64_t a12)
{
  if (v12) {
    free(v12);
  }
  if (a2 == 1)
  {
    long long v17 = __cxa_begin_catch(exception_object);
    long long v19 = *(_OWORD *)v17;
    uint64_t v20 = *((void *)v17 + 2);
    if (v13) {
      (*(void (**)(uint64_t))(*(void *)v13 + 152))(v13);
    }
    if (v14) {
      (*(void (**)(uint64_t))(*(void *)v14 + 152))(v14);
    }
    exception = __cxa_allocate_exception(0x18uLL);
    *(_OWORD *)exception = v19;
    exception[2] = v20;
  }
  _Unwind_Resume(exception_object);
}

float sub_16D4C(float (****a1)(void))
{
  float v2 = (**a1[2])(a1[2]);
  if (mathParser::sinh<float>(v2) == 0.0) {
    ((void (*)(float (****)(void), uint64_t, uint64_t, uint64_t))(*a1)[34])(a1, 18, -1, -1);
  }
  return 1.0 / mathParser::sinh<float>(v2);
}

uint64_t sub_16DF8(uint64_t a1, int a2)
{
  LODWORD(v2) = a2;
  uint64_t v3 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16));
  uint64_t v4 = v3;
  if (v3) {
    BOOL v5 = (int)v2 < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    uint64_t v2 = v2;
    uint64_t v6 = (float *)v3;
    do
    {
      *uint64_t v6 = 1.0 / mathParser::sinh<float>(*v6);
      ++v6;
      --v2;
    }
    while (v2);
  }
  return v4;
}

uint64_t sub_16E88(uint64_t a1, unsigned char *a2, int a3)
{
  LODWORD(v3) = a3;
  uint64_t v5 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16));
  uint64_t v6 = v5;
  if (v5) {
    BOOL v7 = (int)v3 < 1;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    uint64_t v3 = v3;
    uint64_t v8 = (float *)v5;
    do
    {
      if (!*a2)
      {
        float v9 = mathParser::sinh<float>(*v8);
        if (v9 == 0.0) {
          *a2 = 18;
        }
        else {
          float *v8 = 1.0 / v9;
        }
      }
      ++v8;
      ++a2;
      --v3;
    }
    while (v3);
  }
  return v6;
}

uint64_t sub_16F48()
{
  return 24;
}

void *sub_16F50(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 112))(*(void *)(a1 + 16));
  uint64_t v3 = sub_89A0(0x18uLL);
  uint64_t v4 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 120))(*(void *)(a1 + 16));
  sub_10788(v3, v4);
  void *v3 = off_1A72B0;
  uint64_t v5 = sub_89A0(0x20uLL);
  sub_1B2FC(v5, v2, (uint64_t)v3);
  *uint64_t v5 = off_1A83D0;
  uint64_t v6 = sub_89A0(0x18uLL);
  uint64_t v7 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 120))(*(void *)(a1 + 16));
  sub_10788(v6, v7);
  *uint64_t v6 = off_1A73E8;
  uint64_t v8 = sub_89A0(0x20uLL);
  sub_1B2FC(v8, (uint64_t)v5, (uint64_t)v6);
  void *v8 = off_1A83D0;
  float v9 = sub_89A0(0x18uLL);
  sub_10788(v9, (uint64_t)v8);
  void *v9 = off_1A5CC0;
  return v9;
}

void sub_17140(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9, uint64_t a10)
{
  if (v11) {
    free(v11);
  }
  if (a2 == 1)
  {
    __int16 v15 = __cxa_begin_catch(exception_object);
    long long v17 = *(_OWORD *)v15;
    uint64_t v18 = *((void *)v15 + 2);
    if (v12) {
      (*(void (**)(uint64_t))(*(void *)v12 + 152))(v12);
    }
    if (v10) {
      (*(void (**)(uint64_t))(*(void *)v10 + 152))(v10);
    }
    exception = __cxa_allocate_exception(0x18uLL);
    *(_OWORD *)exception = v17;
    exception[2] = v18;
  }
  _Unwind_Resume(exception_object);
}

float sub_17290(float (****a1)(void))
{
  float v2 = (**a1[2])(a1[2]);
  if (mathParser::tanh<float>(v2) == 0.0) {
    ((void (*)(float (****)(void), uint64_t, uint64_t, uint64_t))(*a1)[34])(a1, 19, -1, -1);
  }
  return 1.0 / mathParser::tanh<float>(v2);
}

uint64_t sub_1733C(uint64_t a1, int a2)
{
  LODWORD(v2) = a2;
  uint64_t v3 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16));
  uint64_t v4 = v3;
  if (v3) {
    BOOL v5 = (int)v2 < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    uint64_t v2 = v2;
    uint64_t v6 = (float *)v3;
    do
    {
      *uint64_t v6 = 1.0 / mathParser::tanh<float>(*v6);
      ++v6;
      --v2;
    }
    while (v2);
  }
  return v4;
}

uint64_t sub_173CC(uint64_t a1, unsigned char *a2, int a3)
{
  LODWORD(v3) = a3;
  uint64_t v5 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16));
  uint64_t v6 = v5;
  if (v5) {
    BOOL v7 = (int)v3 < 1;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    uint64_t v3 = v3;
    uint64_t v8 = (float *)v5;
    do
    {
      if (!*a2)
      {
        float v9 = mathParser::tanh<float>(*v8);
        if (v9 == 0.0) {
          *a2 = 19;
        }
        else {
          float *v8 = 1.0 / v9;
        }
      }
      ++v8;
      ++a2;
      --v3;
    }
    while (v3);
  }
  return v6;
}

uint64_t sub_1748C()
{
  return 25;
}

void *sub_17494(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 112))(*(void *)(a1 + 16));
  uint64_t v3 = sub_89A0(0x18uLL);
  sub_10788(v3, v2);
  void *v3 = off_1A5CC0;
  uint64_t v4 = sub_89A0(0x18uLL);
  uint64_t v5 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 120))(*(void *)(a1 + 16));
  sub_10788(v4, v5);
  *uint64_t v4 = off_1A72B0;
  uint64_t v6 = sub_89A0(0x20uLL);
  BOOL v7 = sub_89A0(0x18uLL);
  *BOOL v7 = off_1AA280;
  v7[1] = 0;
  *((_DWORD *)v7 + 4) = 0x40000000;
  sub_1B2FC(v6, (uint64_t)v4, (uint64_t)v7);
  *uint64_t v6 = off_1A8790;
  uint64_t v8 = sub_89A0(0x20uLL);
  sub_1B2FC(v8, (uint64_t)v3, (uint64_t)v6);
  void *v8 = off_1A83D0;
  return v8;
}

void sub_17648(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, long long a11, uint64_t a12)
{
  if (v13) {
    free(v13);
  }
  if (a2 == 1)
  {
    long long v17 = __cxa_begin_catch(exception_object);
    long long v19 = *(_OWORD *)v17;
    uint64_t v20 = *((void *)v17 + 2);
    if (v14) {
      (*(void (**)(uint64_t))(*(void *)v14 + 152))(v14);
    }
    if (v12) {
      (*(void (**)(uint64_t))(*(void *)v12 + 152))(v12);
    }
    exception = __cxa_allocate_exception(0x18uLL);
    *(_OWORD *)exception = v19;
    exception[2] = v20;
  }
  _Unwind_Resume(exception_object);
}

float sub_1778C(uint64_t a1)
{
  BOOL v1 = (***(float (****)(void))(a1 + 16))(*(void *)(a1 + 16)) == 0.0;
  float result = 0.0;
  if (v1) {
    return 1.0;
  }
  return result;
}

uint64_t sub_177D8(uint64_t a1, int a2)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16));
  if (result) {
    BOOL v4 = a2 < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    uint64_t v5 = a2;
    uint64_t v6 = (float *)result;
    do
    {
      if (*v6 == 0.0) {
        float v7 = 1.0;
      }
      else {
        float v7 = 0.0;
      }
      *v6++ = v7;
      --v5;
    }
    while (v5);
  }
  return result;
}

uint64_t sub_17854(uint64_t a1, unsigned __int8 *a2, int a3)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16));
  if (result) {
    BOOL v6 = a3 < 1;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    uint64_t v7 = a3;
    uint64_t v8 = (float *)result;
    do
    {
      if (!*a2++)
      {
        if (*v8 == 0.0) {
          float v10 = 1.0;
        }
        else {
          float v10 = 0.0;
        }
        float *v8 = v10;
      }
      ++v8;
      --v7;
    }
    while (v7);
  }
  return result;
}

uint64_t sub_178E0()
{
  return 26;
}

float sub_178E8(uint64_t a1)
{
  return (float)~(uint64_t)(***(float (****)(void))(a1 + 16))(*(void *)(a1 + 16));
}

float sub_17930(uint64_t a1, int a2)
{
  uint64_t v3 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16));
  if (v3) {
    BOOL v5 = a2 < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    uint64_t v6 = a2;
    uint64_t v7 = (float *)v3;
    do
    {
      float result = (float)~(uint64_t)*v7;
      *v7++ = result;
      --v6;
    }
    while (v6);
  }
  return result;
}

uint64_t sub_179A8(uint64_t a1, unsigned __int8 *a2, int a3)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16));
  if (result) {
    BOOL v6 = a3 < 1;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    uint64_t v7 = a3;
    uint64_t v8 = (float *)result;
    do
    {
      if (!*a2++) {
        float *v8 = (float)~(uint64_t)*v8;
      }
      ++v8;
      --v7;
    }
    while (v7);
  }
  return result;
}

uint64_t sub_17A30()
{
  return 27;
}

float sub_17A38(uint64_t a1)
{
  (***(void (****)(void))(a1 + 16))(*(void *)(a1 + 16));
  return mathParser::ceil<float>(v1);
}

uint64_t sub_17A84(uint64_t a1, int a2)
{
  LODWORD(v2) = a2;
  uint64_t v3 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16));
  uint64_t v4 = v3;
  if (v3) {
    BOOL v5 = (int)v2 < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    uint64_t v2 = v2;
    BOOL v6 = (float *)v3;
    do
    {
      *BOOL v6 = mathParser::ceil<float>(*v6);
      ++v6;
      --v2;
    }
    while (v2);
  }
  return v4;
}

uint64_t sub_17B04(uint64_t a1, unsigned __int8 *a2, int a3)
{
  LODWORD(v3) = a3;
  uint64_t v5 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16));
  uint64_t v6 = v5;
  if (v5) {
    BOOL v7 = (int)v3 < 1;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    uint64_t v3 = v3;
    uint64_t v8 = (float *)v5;
    do
    {
      if (!*a2++) {
        float *v8 = mathParser::ceil<float>(*v8);
      }
      ++v8;
      --v3;
    }
    while (v3);
  }
  return v6;
}

uint64_t sub_17B94()
{
  return 28;
}

float sub_17B9C(uint64_t a1)
{
  (***(void (****)(void))(a1 + 16))(*(void *)(a1 + 16));
  return mathParser::round<float>(v1);
}

uint64_t sub_17BE8(uint64_t a1, int a2)
{
  LODWORD(v2) = a2;
  uint64_t v3 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16));
  uint64_t v4 = v3;
  if (v3) {
    BOOL v5 = (int)v2 < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    uint64_t v2 = v2;
    uint64_t v6 = (float *)v3;
    do
    {
      *uint64_t v6 = mathParser::round<float>(*v6);
      ++v6;
      --v2;
    }
    while (v2);
  }
  return v4;
}

uint64_t sub_17C68(uint64_t a1, unsigned __int8 *a2, int a3)
{
  LODWORD(v3) = a3;
  uint64_t v5 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16));
  uint64_t v6 = v5;
  if (v5) {
    BOOL v7 = (int)v3 < 1;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    uint64_t v3 = v3;
    uint64_t v8 = (float *)v5;
    do
    {
      if (!*a2++) {
        float *v8 = mathParser::round<float>(*v8);
      }
      ++v8;
      --v3;
    }
    while (v3);
  }
  return v6;
}

uint64_t sub_17CF8()
{
  return 29;
}

float sub_17D00(uint64_t a1)
{
  (***(void (****)(void))(a1 + 16))(*(void *)(a1 + 16));
  return mathParser::floor<float>(v1);
}

uint64_t sub_17D4C(uint64_t a1, int a2)
{
  LODWORD(v2) = a2;
  uint64_t v3 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16));
  uint64_t v4 = v3;
  if (v3) {
    BOOL v5 = (int)v2 < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    uint64_t v2 = v2;
    uint64_t v6 = (float *)v3;
    do
    {
      *uint64_t v6 = mathParser::floor<float>(*v6);
      ++v6;
      --v2;
    }
    while (v2);
  }
  return v4;
}

uint64_t sub_17DCC(uint64_t a1, unsigned __int8 *a2, int a3)
{
  LODWORD(v3) = a3;
  uint64_t v5 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16));
  uint64_t v6 = v5;
  if (v5) {
    BOOL v7 = (int)v3 < 1;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    uint64_t v3 = v3;
    uint64_t v8 = (float *)v5;
    do
    {
      if (!*a2++) {
        float *v8 = mathParser::floor<float>(*v8);
      }
      ++v8;
      --v3;
    }
    while (v3);
  }
  return v6;
}

uint64_t sub_17E5C()
{
  return 30;
}

float sub_17E64(uint64_t a1)
{
  float v2 = (***(float (****)(void))(a1 + 16))(*(void *)(a1 + 16));
  float v3 = (***(float (****)(void))(a1 + 24))(*(void *)(a1 + 24));
  return mathParser::atan2<float>(v2, v3);
}

uint64_t sub_17EF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16));
  uint64_t v5 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 8))(*(void *)(a1 + 24), a2);
  uint64_t v6 = v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    if ((int)a2 >= 1)
    {
      uint64_t v9 = 0;
      uint64_t v10 = 4 * a2;
      do
      {
        *(float *)(v4 + v9) = mathParser::atan2<float>(*(float *)(v4 + v9), *(float *)(v6 + v9));
        v9 += 4;
      }
      while (v10 != v9);
    }
    goto LABEL_13;
  }
  if (v4) {
    operator delete[]();
  }
  uint64_t result = 0;
  if (v6) {
LABEL_13:
  }
    operator delete[]();
  return result;
}

uint64_t sub_18000(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16));
  uint64_t v7 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 24) + 16))(*(void *)(a1 + 24), a2, a3);
  uint64_t v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    if ((int)a3 >= 1)
    {
      uint64_t v11 = 0;
      do
      {
        if (!*(unsigned char *)(a2 + v11)) {
          *(float *)(v6 + 4 * v11) = mathParser::atan2<float>(*(float *)(v6 + 4 * v11), *(float *)(v8 + 4 * v11));
        }
        ++v11;
      }
      while (a3 != v11);
    }
    goto LABEL_15;
  }
  if (v6) {
    operator delete[]();
  }
  uint64_t result = 0;
  if (v8) {
LABEL_15:
  }
    operator delete[]();
  return result;
}

uint64_t sub_18120()
{
  return 31;
}

void *sub_18128(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_89A0(0x20uLL);
  uint64_t v5 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 120))(*(void *)(a1 + 16));
  uint64_t v6 = (*(uint64_t (**)(void))(**(void **)(a1 + 24) + 120))(*(void *)(a1 + 24));
  sub_1B2FC(v4, v5, v6);
  *uint64_t v4 = off_1A8510;
  uint64_t v7 = sub_89A0(0x20uLL);
  uint64_t v8 = sub_89A0(0x18uLL);
  void *v8 = off_1AA280;
  v8[1] = 0;
  *((_DWORD *)v8 + 4) = 0x40000000;
  sub_1B2FC(v7, (uint64_t)v4, (uint64_t)v8);
  *uint64_t v7 = off_1A8790;
  BOOL v9 = sub_89A0(0x20uLL);
  uint64_t v10 = sub_89A0(0x18uLL);
  *uint64_t v10 = off_1AA280;
  v10[1] = 0;
  *((_DWORD *)v10 + 4) = 1065353216;
  sub_1B2FC(v9, (uint64_t)v10, (uint64_t)v7);
  void *v9 = off_1A8150;
  uint64_t v11 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 16) + 112))(*(void *)(a1 + 16), a2);
  uint64_t v12 = sub_89A0(0x20uLL);
  sub_1B2FC(v12, v11, (uint64_t)v9);
  *uint64_t v12 = off_1A8510;
  return v12;
}

void sub_18348(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9, uint64_t a10)
{
  if (v12) {
    free(v12);
  }
  if (a2 == 1)
  {
    __int16 v15 = __cxa_begin_catch(exception_object);
    long long v17 = *(_OWORD *)v15;
    uint64_t v18 = *((void *)v15 + 2);
    if (v10) {
      (*(void (**)(uint64_t))(*(void *)v10 + 152))(v10);
    }
    if (v11) {
      (*(void (**)(uint64_t))(*(void *)v11 + 152))(v11);
    }
    exception = __cxa_allocate_exception(0x18uLL);
    *(_OWORD *)exception = v17;
    exception[2] = v18;
  }
  _Unwind_Resume(exception_object);
}

void *sub_18488(void *a1, void *a2)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = off_1AA010;
  a1[3] = 0;
  uint64_t v4 = a1 + 3;
  sub_10218((uint64_t)a1, (uint64_t)a2);
  uint64_t v6 = (char *)a2[1];
  uint64_t v5 = (char *)a2[2];
  if (v6 != v5)
  {
    int v7 = 0;
    uint64_t v8 = a2[1];
    while (1)
    {
      int v9 = *v6;
      if (v9 == 40)
      {
        uint64_t v11 = 0;
        ++v7;
      }
      else if (v9 == 41)
      {
        int v12 = v7 - 1;
        if (v7 <= 0)
        {
          (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*a1 + 272))(a1, 24, v8 - *a2, v8 - *a2);
          uint64_t v11 = 0;
          uint64_t v5 = (char *)a2[2];
        }
        else
        {
          uint64_t v11 = 0;
        }
        int v7 = v12;
      }
      else
      {
        if (v7 >= 2) {
          uint64_t v10 = 0;
        }
        else {
          uint64_t v10 = v6;
        }
        if (v9 == 44) {
          uint64_t v11 = v10;
        }
        else {
          uint64_t v11 = 0;
        }
        if (v11)
        {
LABEL_19:
          uint64_t v6 = (char *)a2[1];
          goto LABEL_21;
        }
      }
      ++v6;
      ++v8;
      if (v6 == v5) {
        goto LABEL_19;
      }
    }
  }
  uint64_t v11 = 0;
  uint64_t v5 = (char *)a2[1];
LABEL_21:
  if (v11 == v6)
  {
    (*(void (**)(void *, uint64_t, char *, char *))(*a1 + 272))(a1, 21, &v6[-*a2], &v6[-*a2]);
    uint64_t v5 = (char *)a2[2];
  }
  if (v11 == v5)
  {
    (*(void (**)(void *, uint64_t, char *, char *))(*a1 + 272))(a1, 21, &v11[-*a2], &v11[-*a2]);
    uint64_t v5 = (char *)a2[2];
  }
  uint64_t v13 = v11;
  if (v11 != v5)
  {
    uint64_t v14 = v11 + 2;
    uint64_t v13 = v11;
    do
    {
      int v15 = *++v13;
      if (v15 == 44)
      {
        (*(void (**)(void *, uint64_t, char *, char *))(*a1 + 272))(a1, 29, &v14[-*a2], &v5[-*a2]);
        uint64_t v5 = (char *)a2[2];
      }
      ++v14;
    }
    while (v13 != v5);
  }
  uint64_t v16 = a2[3];
  v21[2] = v13;
  v21[3] = v16;
  long long v17 = *(_OWORD *)a2;
  v21[0] = *a2;
  long long v22 = v17;
  int v23 = v11 - 1;
  uint64_t v24 = v16;
  v21[1] = v11 + 1;
  v20[0] = 0;
  (*(void (**)(void *, long long *, uint64_t *))(*a1 + 256))(a1, &v22, v20);
  if (v20[0]) {
    a1[2] = v20[0];
  }
  (*(void (**)(void *, void *, void *))(*a1 + 256))(a1, v21, v4);
  uint64_t v18 = a1[2];
  if (v18) {
    *(void *)(v18 + 8) = a1;
  }
  if (*v4) {
    *(void *)(*v4 + 8) = a1;
  }
  return a1;
}

void sub_187A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9, uint64_t a10)
{
  if (a2 == 1)
  {
    uint64_t v13 = __cxa_begin_catch(a1);
    long long v17 = *(_OWORD *)v13;
    uint64_t v18 = *((void *)v13 + 2);
    uint64_t v14 = v10[2];
    if (v14) {
      (*(void (**)(uint64_t))(*(void *)v14 + 152))(v14);
    }
    v10[2] = 0;
    uint64_t v15 = v10[3];
    if (v15) {
      (*(void (**)(uint64_t))(*(void *)v15 + 152))(v15);
    }
    *uint64_t v11 = 0;
    exception = __cxa_allocate_exception(0x18uLL);
    *(_OWORD *)exception = v17;
    exception[2] = v18;
  }
  sub_2A818(v10);
  _Unwind_Resume(a1);
}

void *sub_18880(void *a1, uint64_t a2, uint64_t a3)
{
  *sub_10788(a1, a2) = off_1AA010;
  if (!a3)
  {
    LODWORD(xmmword_1F1288) = 21;
    *((void *)&xmmword_1F1288 + 1) = -1;
    qword_1F1298 = -1;
    exception = __cxa_allocate_exception(0x18uLL);
    uint64_t v7 = qword_1F1298;
    *(_OWORD *)exception = xmmword_1F1288;
    exception[2] = v7;
  }
  a1[3] = a3;
  *(void *)(a3 + 8) = a1;
  return a1;
}

void sub_18918(_Unwind_Exception *a1)
{
  sub_2A818(v1);
  _Unwind_Resume(a1);
}

float sub_18930(uint64_t a1)
{
  if (!*(void *)(a1 + 32)) {
    return 0.0;
  }
  if (*(int *)(a1 + 24) < 1) {
    return INFINITY;
  }
  uint64_t v2 = 0;
  float v3 = INFINITY;
  do
  {
    uint64_t v4 = *(float (****)(void))(*(void *)(a1 + 32) + 8 * v2);
    if (v4)
    {
      float v5 = (**v4)(v4);
      if (v5 < v3) {
        float v3 = v5;
      }
    }
    ++v2;
  }
  while (v2 < *(int *)(a1 + 24));
  return v3;
}

uint64_t sub_189DC(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a1 + 32)) {
    return 0;
  }
  int v4 = *(_DWORD *)(a1 + 24);
  if (v4 >= 1)
  {
    uint64_t v5 = 0;
    while (1)
    {
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8 * v5);
      if (v6)
      {
        uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v6 + 8))(v6, a2);
        if (v7)
        {
          LODWORD(v5) = v5 + 1;
          int v4 = *(_DWORD *)(a1 + 24);
          goto LABEL_12;
        }
        int v4 = *(_DWORD *)(a1 + 24);
      }
      if (++v5 >= v4)
      {
        uint64_t v7 = 0;
        goto LABEL_12;
      }
    }
  }
  uint64_t v7 = 0;
  LODWORD(v5) = 0;
LABEL_12:
  if ((int)v5 < v4)
  {
    uint64_t v5 = v5;
    do
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8 * v5);
      if (v8)
      {
        uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v8 + 8))(v8, a2);
        if (v9)
        {
          if ((int)a2 >= 1)
          {
            uint64_t v10 = a2;
            uint64_t v11 = (float *)v7;
            int v12 = (float *)v9;
            do
            {
              if (*v11 > *v12) {
                *uint64_t v11 = *v12;
              }
              ++v12;
              ++v11;
              --v10;
            }
            while (v10);
          }
          operator delete[]();
        }
      }
      ++v5;
    }
    while (v5 < *(int *)(a1 + 24));
  }
  return v7;
}

void sub_18B48(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9, uint64_t a10)
{
  if (a2 == 1)
  {
    uint64_t v10 = __cxa_begin_catch(exception_object);
    long long v12 = *(_OWORD *)v10;
    uint64_t v13 = *((void *)v10 + 2);
    exception = __cxa_allocate_exception(0x18uLL);
    *(_OWORD *)exception = v12;
    exception[2] = v13;
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_18BD4(uint64_t a1, unsigned char *a2, uint64_t a3)
{
  if (!*(void *)(a1 + 32)) {
    return 0;
  }
  int v6 = *(_DWORD *)(a1 + 24);
  if (v6 >= 1)
  {
    uint64_t v7 = 0;
    while (1)
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8 * v7);
      if (v8)
      {
        uint64_t v9 = (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(*(void *)v8 + 16))(v8, a2, a3);
        if (v9)
        {
          LODWORD(v7) = v7 + 1;
          int v6 = *(_DWORD *)(a1 + 24);
          goto LABEL_12;
        }
        int v6 = *(_DWORD *)(a1 + 24);
      }
      if (++v7 >= v6)
      {
        uint64_t v9 = 0;
        goto LABEL_12;
      }
    }
  }
  uint64_t v9 = 0;
  LODWORD(v7) = 0;
LABEL_12:
  if ((int)v7 < v6)
  {
    uint64_t v7 = v7;
    do
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8 * v7);
      if (v10)
      {
        uint64_t v11 = (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(*(void *)v10 + 16))(v10, a2, a3);
        if (v11)
        {
          if ((int)a3 >= 1)
          {
            uint64_t v12 = a3;
            uint64_t v13 = (float *)v9;
            uint64_t v14 = (float *)v11;
            uint64_t v15 = a2;
            do
            {
              if (*v13 > *v14 && !*v15) {
                *uint64_t v13 = *v14;
              }
              ++v15;
              ++v14;
              ++v13;
              --v12;
            }
            while (v12);
          }
          operator delete[]();
        }
      }
      ++v7;
    }
    while (v7 < *(int *)(a1 + 24));
  }
  return v9;
}

void sub_18D5C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9, uint64_t a10)
{
  if (a2 == 1)
  {
    uint64_t v10 = __cxa_begin_catch(exception_object);
    long long v12 = *(_OWORD *)v10;
    uint64_t v13 = *((void *)v10 + 2);
    exception = __cxa_allocate_exception(0x18uLL);
    *(_OWORD *)exception = v12;
    exception[2] = v13;
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_18DE8()
{
  return 32;
}

uint64_t sub_18DF0(uint64_t a1)
{
  return 0;
}

void sub_18E40(uint64_t a1)
{
  sub_1912C((void *)a1);
  if (!*(void *)(a1 + 32) || *(int *)(a1 + 24) < 1) {
    return;
  }
  uint64_t v2 = 0;
  float v3 = 0;
  int v4 = 0;
  float v5 = 0.0;
  do
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8 * v2);
    if (!v6 || !(*(unsigned int (**)(uint64_t))(*(void *)v6 + 40))(v6)) {
      goto LABEL_15;
    }
    uint64_t v7 = *(float (****)(void))(*(void *)(a1 + 32) + 8 * v2);
    float v8 = (**v7)(v7);
    float v9 = v8;
    if (!v3)
    {
      int v4 = v2;
      float v3 = v7;
      goto LABEL_16;
    }
    uint64_t v10 = *(void *)(a1 + 32);
    if (v8 >= v5)
    {
      uint64_t v12 = *(void *)(v10 + 8 * v2);
      if (v12)
      {
        (*(void (**)(uint64_t))(*(void *)v12 + 152))(v12);
        uint64_t v10 = *(void *)(a1 + 32);
      }
      *(void *)(v10 + 8 * v2) = 0;
LABEL_15:
      float v9 = v5;
      goto LABEL_16;
    }
    uint64_t v11 = *(void *)(v10 + 8 * v4);
    if (v11)
    {
      (*(void (**)(uint64_t))(*(void *)v11 + 152))(v11);
      uint64_t v10 = *(void *)(a1 + 32);
    }
    *(void *)(v10 + 8 * v4) = 0;
    float v3 = *(float (****)(void))(*(void *)(a1 + 32) + 8 * v2);
    int v4 = v2;
LABEL_16:
    ++v2;
    uint64_t v13 = *(int *)(a1 + 24);
    float v5 = v9;
  }
  while (v2 < v13);
  if ((int)v13 >= 1)
  {
    int v14 = 0;
    uint64_t v15 = *(unsigned int *)(a1 + 24);
    uint64_t v16 = *(void **)(a1 + 32);
    do
    {
      if (!*v16++) {
        ++v14;
      }
      --v15;
    }
    while (v15);
    if (v14) {
      operator new[]();
    }
    if (v13 == 1)
    {
      uint64_t v18 = *(void **)(a1 + 32);
      if (*v18)
      {
        if (*(void *)(a1 + 8))
        {
          *uint64_t v18 = 0;
          (*(void (**)(void, uint64_t))(**(void **)(a1 + 8) + 64))(*(void *)(a1 + 8), a1);
          if (*(void *)(a1 + 32)) {
            operator delete[]();
          }
          *(void *)(a1 + 32) = 0;
          *(void *)(a1 + 8) = 0;
          long long v19 = *(void (**)(uint64_t))(*(void *)a1 + 152);
          v19(a1);
        }
      }
    }
  }
}

void *sub_1912C(void *result)
{
  if (result[4])
  {
    float v1 = result;
    if (*((int *)result + 6) >= 1)
    {
      uint64_t v2 = 0;
      do
      {
        uint64_t result = *(void **)(v1[4] + 8 * v2);
        if (result)
        {
          (*(void (**)(void *))(*result + 96))(result);
          uint64_t v3 = *(void *)(v1[4] + 8 * v2);
          uint64_t result = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v3 + 40))(v3);
          if (result)
          {
            uint64_t v4 = *(void *)(v1[4] + 8 * v2);
            uint64_t result = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v4 + 24))(v4);
            if (!result)
            {
              float v5 = *(float (****)(void))(v1[4] + 8 * v2);
              float v6 = (**v5)(v5);
              uint64_t v7 = v1[4];
              uint64_t v8 = *(void *)(v7 + 8 * v2);
              *(void *)(v7 + 8 * v2) = 0;
              uint64_t result = sub_89A0(0x18uLL);
              uint64_t *result = off_1AA280;
              result[1] = 0;
              *((float *)result + 4) = v6;
              *(void *)(v1[4] + 8 * v2) = result;
              uint64_t v9 = *(void *)(v1[4] + 8 * v2);
              if (v9) {
                *(void *)(v9 + 8) = v1;
              }
              if (v8) {
                uint64_t result = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v8 + 152))(v8);
              }
            }
          }
        }
        ++v2;
      }
      while (v2 < *((int *)v1 + 6));
    }
  }
  return result;
}

void sub_19304(_Unwind_Exception *a1)
{
}

void sub_19318(uint64_t a1, void *a2)
{
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = off_1AA148;
  *(_DWORD *)(a1 + 24) = 1;
  *(void *)(a1 + 32) = 0;
  sub_10218(a1, (uint64_t)a2);
  uint64_t v4 = (char *)a2[2];
  if ((char *)a2[1] != v4)
  {
    uint64_t v5 = 0;
    float v6 = (char *)a2[1];
    uint64_t v7 = v6;
    do
    {
      int v8 = *v7;
      if (v8 == 40)
      {
        uint64_t v10 = (v5 + 1);
      }
      else if (v8 == 41)
      {
        uint64_t v10 = (v5 - 1);
        if ((int)v5 <= 0)
        {
          (*(void (**)(uint64_t, uint64_t, char *, char *))(*(void *)a1 + 272))(a1, 24, &v6[-*a2], &v6[-*a2]);
          uint64_t v4 = (char *)a2[2];
        }
      }
      else if (v8 == 44 && v5 == 0)
      {
        uint64_t v10 = 0;
        ++*(_DWORD *)(a1 + 24);
      }
      else
      {
        uint64_t v10 = v5;
      }
      ++v7;
      ++v6;
      uint64_t v5 = v10;
    }
    while (v7 != v4);
  }
  operator new[]();
}

void sub_196B8(_Unwind_Exception *a1)
{
  sub_2A818(v1);
  _Unwind_Resume(a1);
}

void sub_197B0(uint64_t a1, int a2, void *a3)
{
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = off_1AA148;
  *(_DWORD *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  if (a2 >= 1)
  {
    int v3 = 0;
    uint64_t v4 = a2;
    do
    {
      if (*a3) {
        *(_DWORD *)(a1 + 24) = ++v3;
      }
      ++a3;
      --v4;
    }
    while (v4);
  }
  operator new[]();
}

void sub_198A0(_Unwind_Exception *a1)
{
  sub_2A818(v1);
  _Unwind_Resume(a1);
}

float sub_198B8(uint64_t a1)
{
  if (!*(void *)(a1 + 32)) {
    return 0.0;
  }
  if (*(int *)(a1 + 24) < 1) {
    return -INFINITY;
  }
  uint64_t v2 = 0;
  float v3 = -INFINITY;
  do
  {
    uint64_t v4 = *(float (****)(void))(*(void *)(a1 + 32) + 8 * v2);
    if (v4)
    {
      float v5 = (**v4)(v4);
      if (v5 > v3) {
        float v3 = v5;
      }
    }
    ++v2;
  }
  while (v2 < *(int *)(a1 + 24));
  return v3;
}

uint64_t sub_19964(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a1 + 32)) {
    return 0;
  }
  int v4 = *(_DWORD *)(a1 + 24);
  if (v4 >= 1)
  {
    uint64_t v5 = 0;
    while (1)
    {
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8 * v5);
      if (v6)
      {
        uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v6 + 8))(v6, a2);
        if (v7)
        {
          LODWORD(v5) = v5 + 1;
          int v4 = *(_DWORD *)(a1 + 24);
          goto LABEL_12;
        }
        int v4 = *(_DWORD *)(a1 + 24);
      }
      if (++v5 >= v4)
      {
        uint64_t v7 = 0;
        goto LABEL_12;
      }
    }
  }
  uint64_t v7 = 0;
  LODWORD(v5) = 0;
LABEL_12:
  if ((int)v5 < v4)
  {
    uint64_t v5 = v5;
    do
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8 * v5);
      if (v8)
      {
        uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v8 + 8))(v8, a2);
        if (v9)
        {
          if ((int)a2 >= 1)
          {
            uint64_t v10 = a2;
            uint64_t v11 = (float *)v7;
            uint64_t v12 = (float *)v9;
            do
            {
              if (*v11 < *v12) {
                *uint64_t v11 = *v12;
              }
              ++v12;
              ++v11;
              --v10;
            }
            while (v10);
          }
          operator delete[]();
        }
      }
      ++v5;
    }
    while (v5 < *(int *)(a1 + 24));
  }
  return v7;
}

void sub_19AD0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9, uint64_t a10)
{
  if (a2 == 1)
  {
    uint64_t v10 = __cxa_begin_catch(exception_object);
    long long v12 = *(_OWORD *)v10;
    uint64_t v13 = *((void *)v10 + 2);
    exception = __cxa_allocate_exception(0x18uLL);
    *(_OWORD *)exception = v12;
    exception[2] = v13;
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_19B5C(uint64_t a1, unsigned char *a2, uint64_t a3)
{
  if (!*(void *)(a1 + 32)) {
    return 0;
  }
  int v6 = *(_DWORD *)(a1 + 24);
  if (v6 >= 1)
  {
    uint64_t v7 = 0;
    while (1)
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8 * v7);
      if (v8)
      {
        uint64_t v9 = (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(*(void *)v8 + 16))(v8, a2, a3);
        if (v9)
        {
          LODWORD(v7) = v7 + 1;
          int v6 = *(_DWORD *)(a1 + 24);
          goto LABEL_12;
        }
        int v6 = *(_DWORD *)(a1 + 24);
      }
      if (++v7 >= v6)
      {
        uint64_t v9 = 0;
        goto LABEL_12;
      }
    }
  }
  uint64_t v9 = 0;
  LODWORD(v7) = 0;
LABEL_12:
  if ((int)v7 < v6)
  {
    uint64_t v7 = v7;
    do
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8 * v7);
      if (v10)
      {
        uint64_t v11 = (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(*(void *)v10 + 16))(v10, a2, a3);
        if (v11)
        {
          if ((int)a3 >= 1)
          {
            uint64_t v12 = a3;
            uint64_t v13 = (float *)v9;
            int v14 = (float *)v11;
            uint64_t v15 = a2;
            do
            {
              if (*v13 < *v14 && !*v15) {
                *uint64_t v13 = *v14;
              }
              ++v15;
              ++v14;
              ++v13;
              --v12;
            }
            while (v12);
          }
          operator delete[]();
        }
      }
      ++v7;
    }
    while (v7 < *(int *)(a1 + 24));
  }
  return v9;
}

void sub_19CE4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9, uint64_t a10)
{
  if (a2 == 1)
  {
    uint64_t v10 = __cxa_begin_catch(exception_object);
    long long v12 = *(_OWORD *)v10;
    uint64_t v13 = *((void *)v10 + 2);
    exception = __cxa_allocate_exception(0x18uLL);
    *(_OWORD *)exception = v12;
    exception[2] = v13;
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_19D70()
{
  return 33;
}

uint64_t sub_19D78(uint64_t a1)
{
  return 0;
}

void sub_19DC8(uint64_t a1)
{
  sub_1912C((void *)a1);
  if (!*(void *)(a1 + 32)) {
    return;
  }
  if (*(int *)(a1 + 24) < 1)
  {
LABEL_30:
    *(_DWORD *)(a1 + 24) = 0;
    return;
  }
  uint64_t v2 = 0;
  float v3 = 0;
  int v4 = 0;
  float v5 = 0.0;
  do
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8 * v2);
    if (!v6 || !(*(unsigned int (**)(uint64_t))(*(void *)v6 + 40))(v6)) {
      goto LABEL_15;
    }
    uint64_t v7 = *(float (****)(void))(*(void *)(a1 + 32) + 8 * v2);
    float v8 = (**v7)(v7);
    float v9 = v8;
    if (!v3)
    {
      int v4 = v2;
      float v3 = v7;
      goto LABEL_16;
    }
    uint64_t v10 = *(void *)(a1 + 32);
    if (v8 <= v5)
    {
      uint64_t v12 = *(void *)(v10 + 8 * v2);
      if (v12)
      {
        (*(void (**)(uint64_t))(*(void *)v12 + 152))(v12);
        uint64_t v10 = *(void *)(a1 + 32);
      }
      *(void *)(v10 + 8 * v2) = 0;
LABEL_15:
      float v9 = v5;
      goto LABEL_16;
    }
    uint64_t v11 = *(void *)(v10 + 8 * v4);
    if (v11)
    {
      (*(void (**)(uint64_t))(*(void *)v11 + 152))(v11);
      uint64_t v10 = *(void *)(a1 + 32);
    }
    *(void *)(v10 + 8 * v4) = 0;
    float v3 = *(float (****)(void))(*(void *)(a1 + 32) + 8 * v2);
    int v4 = v2;
LABEL_16:
    ++v2;
    uint64_t v13 = *(int *)(a1 + 24);
    float v5 = v9;
  }
  while (v2 < v13);
  if ((int)v13 < 1) {
    goto LABEL_30;
  }
  uint64_t v14 = 0;
  int v15 = 0;
  uint64_t v16 = 8 * *(unsigned int *)(a1 + 24);
  do
  {
    uint64_t v17 = *(void *)(a1 + 32);
    uint64_t v18 = *(void *)(v17 + v14);
    if (v18) {
      *(void *)(v17 + 8 * v15++) = v18;
    }
    v14 += 8;
  }
  while (v16 != v14);
  *(_DWORD *)(a1 + 24) = v15;
  if (v15 == 1)
  {
    long long v19 = *(void **)(a1 + 32);
    if (*v19)
    {
      if (*(void *)(a1 + 8))
      {
        *long long v19 = 0;
        (*(void (**)(void, uint64_t))(**(void **)(a1 + 8) + 64))(*(void *)(a1 + 8), a1);
        if (*(void *)(a1 + 32)) {
          operator delete[]();
        }
        *(void *)(a1 + 32) = 0;
        *(void *)(a1 + 8) = 0;
        uint64_t v20 = *(void (**)(uint64_t))(*(void *)a1 + 152);
        v20(a1);
      }
    }
  }
}

void sub_1A03C(uint64_t a1)
{
  float v1 = *(void (*****)(void))(a1 + 32);
  if (v1)
  {
    (***v1)();
    (***(void (****)(void))(*(void *)(a1 + 32) + 8))();
    (***(void (****)(void))(*(void *)(a1 + 32) + 16))();
    (***(void (****)(void))(*(void *)(a1 + 32) + 24))();
    (***(void (****)(void))(*(void *)(a1 + 32) + 32))();
    (***(float (****)(void))(*(void *)(a1 + 32) + 40))();
  }
}

uint64_t sub_1A21C()
{
  return 34;
}

void sub_1A224(uint64_t a1, int a2, void *a3)
{
}

void sub_1A258(uint64_t a1)
{
  float v1 = *(void (*****)(void))(a1 + 32);
  if (v1)
  {
    (***v1)();
    (***(void (****)(void))(*(void *)(a1 + 32) + 8))();
    (***(void (****)(void))(*(void *)(a1 + 32) + 16))();
    (***(float (****)(void))(*(void *)(a1 + 32) + 24))();
  }
}

uint64_t sub_1A3E8()
{
  return 35;
}

void sub_1A3F0(uint64_t a1, int a2, void *a3)
{
}

float sub_1A424(uint64_t a1)
{
  float v2 = (***(float (****)(void))(a1 + 16))(*(void *)(a1 + 16));
  return v2 + (***(float (****)(void))(a1 + 24))(*(void *)(a1 + 24));
}

uint64_t sub_1A4A4(uint64_t a1, uint64_t a2)
{
  int v4 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 24))(*(void *)(a1 + 16));
  uint64_t v5 = **(void **)(a1 + 24);
  if (v4)
  {
    uint64_t v6 = (*(uint64_t (**)(void))(v5 + 8))();
    if (v6)
    {
      (***(void (****)(void))(a1 + 16))(*(void *)(a1 + 16));
      if ((int)a2 >= 1)
      {
        uint64_t v8 = 0;
        do
        {
          *(float *)(v6 + v8) = v7 + *(float *)(v6 + v8);
          v8 += 4;
        }
        while (4 * a2 != v8);
      }
    }
    return v6;
  }
  if ((*(unsigned int (**)(void))(v5 + 24))())
  {
    uint64_t v6 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16), a2);
    if (v6)
    {
      (***(void (****)(void))(a1 + 24))(*(void *)(a1 + 24));
      if ((int)a2 >= 1)
      {
        uint64_t v10 = 0;
        do
        {
          *(float *)(v6 + v10) = v9 + *(float *)(v6 + v10);
          v10 += 4;
        }
        while (4 * a2 != v10);
      }
    }
    return v6;
  }
  uint64_t v11 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 8))(*(void *)(a1 + 24), a2);
  uint64_t v12 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16), a2);
  if (v12) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13)
  {
    if ((int)a2 >= 1)
    {
      uint64_t v14 = 0;
      do
      {
        *(float *)(v12 + v14) = *(float *)(v11 + v14) + *(float *)(v12 + v14);
        v14 += 4;
      }
      while (4 * a2 != v14);
    }
    goto LABEL_25;
  }
  if (v12) {
    operator delete[]();
  }
  uint64_t v6 = 0;
  if (v11) {
LABEL_25:
  }
    operator delete[]();
  return v6;
}

uint64_t sub_1A71C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 24))(*(void *)(a1 + 16));
  uint64_t v7 = **(void **)(a1 + 24);
  if (v6)
  {
    uint64_t v8 = (*(uint64_t (**)(void))(v7 + 16))();
    if (v8)
    {
      (***(void (****)(void))(a1 + 16))(*(void *)(a1 + 16));
      if ((int)a3 >= 1)
      {
        uint64_t v10 = 0;
        do
        {
          if (!*(unsigned char *)(a2 + v10)) {
            *(float *)(v8 + 4 * v10) = v9 + *(float *)(v8 + 4 * v10);
          }
          ++v10;
        }
        while (a3 != v10);
      }
    }
    return v8;
  }
  if ((*(unsigned int (**)(void))(v7 + 24))())
  {
    uint64_t v8 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16), a2, a3);
    if (v8)
    {
      (***(void (****)(void))(a1 + 24))(*(void *)(a1 + 24));
      if ((int)a3 >= 1)
      {
        uint64_t v12 = 0;
        do
        {
          if (!*(unsigned char *)(a2 + v12)) {
            *(float *)(v8 + 4 * v12) = v11 + *(float *)(v8 + 4 * v12);
          }
          ++v12;
        }
        while (a3 != v12);
      }
    }
    return v8;
  }
  uint64_t v13 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 24) + 16))(*(void *)(a1 + 24), a2, a3);
  uint64_t v14 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16), a2, a3);
  if (v14) {
    BOOL v15 = v13 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (!v15)
  {
    if ((int)a3 >= 1)
    {
      uint64_t v16 = 0;
      do
      {
        if (!*(unsigned char *)(a2 + v16)) {
          *(float *)(v14 + 4 * v16) = *(float *)(v13 + 4 * v16) + *(float *)(v14 + 4 * v16);
        }
        ++v16;
      }
      while (a3 != v16);
    }
    goto LABEL_31;
  }
  if (v14) {
    operator delete[]();
  }
  uint64_t v8 = 0;
  if (v13) {
LABEL_31:
  }
    operator delete[]();
  return v8;
}

uint64_t sub_1A9C8()
{
  return 3;
}

void *sub_1A9D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 112))(*(void *)(a1 + 16));
  uint64_t v5 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 112))(*(void *)(a1 + 24), a2);
  int v6 = sub_89A0(0x20uLL);
  sub_1B2FC(v6, v4, v5);
  *int v6 = off_1A8150;
  return v6;
}

void sub_1AAB0(_Unwind_Exception *exception_object, int a2)
{
  int v6 = v4;
  if (v6) {
    free(v6);
  }
  if (a2 == 1)
  {
    __cxa_begin_catch(exception_object);
    if (v2) {
      (*(void (**)(uint64_t))(*(void *)v2 + 152))(v2);
    }
    if (v3) {
      (*(void (**)(uint64_t))(*(void *)v3 + 152))(v3);
    }
    __cxa_end_catch();
    JUMPOUT(0x1AA98);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1AB64(uint64_t a1)
{
  sub_1AE64(a1);
  if ((*(unsigned int (**)(void))(**(void **)(a1 + 16) + 40))(*(void *)(a1 + 16))
    && (***(float (****)(void))(a1 + 16))(*(void *)(a1 + 16)) == 0.0
    && *(void *)(a1 + 8))
  {
    uint64_t v2 = *(void **)(a1 + 24);
LABEL_9:
    uint64_t v3 = *(uint64_t (**)(uint64_t, void *))(*(void *)a1 + 296);
    uint64_t v4 = a1;
    goto LABEL_12;
  }
  if ((*(unsigned int (**)(void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24))
    && (***(float (****)(void))(a1 + 24))(*(void *)(a1 + 24)) == 0.0
    && *(void *)(a1 + 8))
  {
    uint64_t v2 = *(void **)(a1 + 16);
    goto LABEL_9;
  }
  uint64_t result = (*(uint64_t (**)(void, void))(**(void **)(a1 + 16) + 136))(*(void *)(a1 + 16), *(void *)(a1 + 24));
  if (!result) {
    return result;
  }
  int v6 = sub_89A0(0x18uLL);
  *int v6 = off_1AA280;
  v6[1] = 0;
  *((_DWORD *)v6 + 4) = 0x40000000;
  uint64_t v7 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 120))(*(void *)(a1 + 16));
  uint64_t v8 = sub_89A0(0x20uLL);
  sub_1B2FC(v8, (uint64_t)v6, v7);
  void *v8 = off_1A83D0;
  uint64_t v3 = *(uint64_t (**)(uint64_t, void *))(*(void *)a1 + 296);
  uint64_t v4 = a1;
  uint64_t v2 = v8;
LABEL_12:
  return v3(v4, v2);
}

void sub_1ADAC(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  if (v18) {
    free(v18);
  }
  __cxa_begin_catch(a1);
  (*(void (**)(uint64_t))(*(void *)v16 + 152))(v16);
  if (v17) {
    (*(void (**)(uint64_t))(*(void *)v17 + 152))(v17);
  }
  __cxa_end_catch();
}

void sub_1AE50(_Unwind_Exception *a1)
{
}

float *sub_1AE64(uint64_t a1)
{
  (*(void (**)(void))(**(void **)(a1 + 16) + 96))(*(void *)(a1 + 16));
  if ((*(unsigned int (**)(void))(**(void **)(a1 + 16) + 40))(*(void *)(a1 + 16))
    && !(*(unsigned int (**)(void))(**(void **)(a1 + 16) + 24))(*(void *)(a1 + 16)))
  {
    float v2 = (***(float (****)(void))(a1 + 16))(*(void *)(a1 + 16));
    uint64_t v3 = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = 0;
    uint64_t v4 = (float *)sub_89A0(0x18uLL);
    *(void *)uint64_t v4 = off_1AA280;
    *((void *)v4 + 1) = 0;
    v4[4] = v2;
    *(void *)(a1 + 16) = v4;
    if (v3)
    {
      (*(void (**)(uint64_t))(*(void *)v3 + 152))(v3);
      uint64_t v4 = *(float **)(a1 + 16);
    }
    *((void *)v4 + 1) = a1;
  }
  (*(void (**)(void))(**(void **)(a1 + 24) + 96))(*(void *)(a1 + 24));
  uint64_t result = (float *)(*(uint64_t (**)(void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24));
  if (result)
  {
    uint64_t result = (float *)(*(uint64_t (**)(void))(**(void **)(a1 + 24) + 24))(*(void *)(a1 + 24));
    if (!result)
    {
      float v6 = (***(float (****)(void))(a1 + 24))(*(void *)(a1 + 24));
      uint64_t v7 = *(void *)(a1 + 24);
      *(void *)(a1 + 24) = 0;
      uint64_t result = (float *)sub_89A0(0x18uLL);
      *(void *)uint64_t result = off_1AA280;
      *((void *)result + 1) = 0;
      result[4] = v6;
      *(void *)(a1 + 24) = result;
      if (v7)
      {
        (*(void (**)(uint64_t))(*(void *)v7 + 152))(v7);
        uint64_t result = *(float **)(a1 + 24);
      }
      *((void *)result + 1) = a1;
    }
  }
  return result;
}

void sub_1B0B4(void *a1)
{
  __cxa_begin_catch(a1);
  uint64_t v3 = *(void *)(v1 + 24);
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 152))(v3);
  }
  *(void *)(v1 + 24) = v2;
  __cxa_end_catch();
}

void sub_1B108(_Unwind_Exception *a1)
{
}

uint64_t *sub_1B164(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  a1[2] = 0;
  uint64_t v5 = a1 + 2;
  *a1 = (uint64_t)off_1AA520;
  a1[1] = 0;
  a1[3] = 0;
  float v6 = a1 + 3;
  sub_FEE8(a1, a2, (uint64_t)(a1 + 2));
  (*(void (**)(uint64_t *, uint64_t, uint64_t *))(*a1 + 256))(a1, a3, v6);
  if (*v5) {
    *(void *)(*v5 + 8) = a1;
  }
  if (*v6) {
    *(void *)(*v6 + 8) = a1;
  }
  return a1;
}

void *sub_1B2FC(void *result, uint64_t a2, uint64_t a3)
{
  float *result = off_1AA520;
  result[1] = 0;
  if (!a2 || !a3)
  {
    LODWORD(xmmword_1F1288) = 21;
    *((void *)&xmmword_1F1288 + 1) = -1;
    qword_1F1298 = -1;
    exception = __cxa_allocate_exception(0x18uLL);
    uint64_t v4 = qword_1F1298;
    *(_OWORD *)exception = xmmword_1F1288;
    exception[2] = v4;
  }
  result[2] = a2;
  result[3] = a3;
  *(void *)(a2 + 8) = result;
  *(void *)(a3 + 8) = result;
  return result;
}

void sub_1B398(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  *a10 = off_1A5578;
  a10[1] = 0;
  _Unwind_Resume(a1);
}

float sub_1B3BC(uint64_t a1)
{
  float v2 = (***(float (****)(void))(a1 + 16))(*(void *)(a1 + 16));
  return v2 - (***(float (****)(void))(a1 + 24))(*(void *)(a1 + 24));
}

uint64_t sub_1B43C(uint64_t a1, uint64_t a2)
{
  int v4 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 24))(*(void *)(a1 + 16));
  uint64_t v5 = **(void **)(a1 + 24);
  if (v4)
  {
    uint64_t v6 = (*(uint64_t (**)(void))(v5 + 8))();
    if (v6)
    {
      (***(void (****)(void))(a1 + 16))(*(void *)(a1 + 16));
      if ((int)a2 >= 1)
      {
        uint64_t v8 = 0;
        do
        {
          *(float *)(v6 + v8) = v7 - *(float *)(v6 + v8);
          v8 += 4;
        }
        while (4 * a2 != v8);
      }
    }
    return v6;
  }
  if ((*(unsigned int (**)(void))(v5 + 24))())
  {
    uint64_t v6 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16), a2);
    if (v6)
    {
      (***(void (****)(void))(a1 + 24))(*(void *)(a1 + 24));
      if ((int)a2 >= 1)
      {
        uint64_t v10 = 0;
        do
        {
          *(float *)(v6 + v10) = *(float *)(v6 + v10) - v9;
          v10 += 4;
        }
        while (4 * a2 != v10);
      }
    }
    return v6;
  }
  uint64_t v11 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 8))(*(void *)(a1 + 24), a2);
  uint64_t v12 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16), a2);
  if (v12) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13)
  {
    if ((int)a2 >= 1)
    {
      uint64_t v14 = 0;
      do
      {
        *(float *)(v12 + v14) = *(float *)(v12 + v14) - *(float *)(v11 + v14);
        v14 += 4;
      }
      while (4 * a2 != v14);
    }
    goto LABEL_25;
  }
  if (v12) {
    operator delete[]();
  }
  uint64_t v6 = 0;
  if (v11) {
LABEL_25:
  }
    operator delete[]();
  return v6;
}

uint64_t sub_1B6B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 24))(*(void *)(a1 + 16));
  uint64_t v7 = **(void **)(a1 + 24);
  if (v6)
  {
    uint64_t v8 = (*(uint64_t (**)(void))(v7 + 16))();
    if (v8)
    {
      (***(void (****)(void))(a1 + 16))(*(void *)(a1 + 16));
      if ((int)a3 >= 1)
      {
        uint64_t v10 = 0;
        do
        {
          if (!*(unsigned char *)(a2 + v10)) {
            *(float *)(v8 + 4 * v10) = v9 - *(float *)(v8 + 4 * v10);
          }
          ++v10;
        }
        while (a3 != v10);
      }
    }
    return v8;
  }
  if ((*(unsigned int (**)(void))(v7 + 24))())
  {
    uint64_t v8 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16), a2, a3);
    if (v8)
    {
      (***(void (****)(void))(a1 + 24))(*(void *)(a1 + 24));
      if ((int)a3 >= 1)
      {
        uint64_t v12 = 0;
        do
        {
          if (!*(unsigned char *)(a2 + v12)) {
            *(float *)(v8 + 4 * v12) = *(float *)(v8 + 4 * v12) - v11;
          }
          ++v12;
        }
        while (a3 != v12);
      }
    }
    return v8;
  }
  uint64_t v13 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 24) + 16))(*(void *)(a1 + 24), a2, a3);
  uint64_t v14 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16), a2, a3);
  if (v14) {
    BOOL v15 = v13 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (!v15)
  {
    if ((int)a3 >= 1)
    {
      uint64_t v16 = 0;
      do
      {
        if (!*(unsigned char *)(a2 + v16)) {
          *(float *)(v14 + 4 * v16) = *(float *)(v14 + 4 * v16) - *(float *)(v13 + 4 * v16);
        }
        ++v16;
      }
      while (a3 != v16);
    }
    goto LABEL_31;
  }
  if (v14) {
    operator delete[]();
  }
  uint64_t v8 = 0;
  if (v13) {
LABEL_31:
  }
    operator delete[]();
  return v8;
}

uint64_t sub_1B960()
{
  return 4;
}

void *sub_1B968(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 112))(*(void *)(a1 + 16));
  uint64_t v5 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 112))(*(void *)(a1 + 24), a2);
  int v6 = sub_89A0(0x20uLL);
  sub_1B2FC(v6, v4, v5);
  *int v6 = off_1A8290;
  return v6;
}

void sub_1BA48(_Unwind_Exception *exception_object, int a2)
{
  int v6 = v4;
  if (v6) {
    free(v6);
  }
  if (a2 == 1)
  {
    __cxa_begin_catch(exception_object);
    if (v2) {
      (*(void (**)(uint64_t))(*(void *)v2 + 152))(v2);
    }
    if (v3) {
      (*(void (**)(uint64_t))(*(void *)v3 + 152))(v3);
    }
    __cxa_end_catch();
    JUMPOUT(0x1BA30);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1BAFC(void *a1)
{
  sub_1AE64((uint64_t)a1);
  if ((*(unsigned int (**)(void))(*(void *)a1[2] + 40))(a1[2])
    && (**(float (***)(void))a1[2])(a1[2]) == 0.0
    && a1[1])
  {
    uint64_t v2 = a1[3];
    a1[3] = 0;
    uint64_t v3 = sub_89A0(0x18uLL);
    sub_10788(v3, v2);
    void *v3 = off_1A5CC0;
    return (*(uint64_t (**)(void *, void *))(*a1 + 296))(a1, v3);
  }
  else if ((*(unsigned int (**)(void))(*(void *)a1[3] + 40))(a1[3]) {
         && (**(float (***)(void))a1[3])(a1[3]) == 0.0
  }
         && a1[1])
  {
    uint64_t v5 = a1[2];
    int v6 = *(uint64_t (**)(void *, uint64_t))(*a1 + 296);
    return v6(a1, v5);
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(void, void))(*(void *)a1[3] + 136))(a1[3], a1[2]);
    if (result)
    {
      uint64_t v7 = sub_89A0(0x18uLL);
      *uint64_t v7 = off_1AA280;
      v7[1] = 0;
      *((_DWORD *)v7 + 4) = 0;
      return (*(uint64_t (**)(void *))(*a1 + 296))(a1);
    }
  }
  return result;
}

void sub_1BD38(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  if (v16) {
    free(v16);
  }
  __cxa_begin_catch(a1);
  *(void *)(v14 + 24) = v15;
  if (v15) {
    *(void *)(v15 + 8) = v14;
  }
  __cxa_end_catch();
}

float sub_1BD8C(uint64_t a1)
{
  float v2 = (***(float (****)(void))(a1 + 16))(*(void *)(a1 + 16));
  return v2 * (***(float (****)(void))(a1 + 24))(*(void *)(a1 + 24));
}

uint64_t sub_1BE0C(uint64_t a1, uint64_t a2)
{
  int v4 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 24))(*(void *)(a1 + 16));
  uint64_t v5 = **(void **)(a1 + 24);
  if (v4)
  {
    uint64_t v6 = (*(uint64_t (**)(void))(v5 + 8))();
    if (v6)
    {
      (***(void (****)(void))(a1 + 16))(*(void *)(a1 + 16));
      if ((int)a2 >= 1)
      {
        uint64_t v8 = 0;
        do
        {
          *(float *)(v6 + v8) = v7 * *(float *)(v6 + v8);
          v8 += 4;
        }
        while (4 * a2 != v8);
      }
    }
    return v6;
  }
  if ((*(unsigned int (**)(void))(v5 + 24))())
  {
    uint64_t v6 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16), a2);
    if (v6)
    {
      (***(void (****)(void))(a1 + 24))(*(void *)(a1 + 24));
      if ((int)a2 >= 1)
      {
        uint64_t v10 = 0;
        do
        {
          *(float *)(v6 + v10) = v9 * *(float *)(v6 + v10);
          v10 += 4;
        }
        while (4 * a2 != v10);
      }
    }
    return v6;
  }
  uint64_t v11 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 8))(*(void *)(a1 + 24), a2);
  uint64_t v12 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16), a2);
  if (v12) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13)
  {
    if ((int)a2 >= 1)
    {
      uint64_t v14 = 0;
      do
      {
        *(float *)(v12 + v14) = *(float *)(v11 + v14) * *(float *)(v12 + v14);
        v14 += 4;
      }
      while (4 * a2 != v14);
    }
    goto LABEL_25;
  }
  if (v12) {
    operator delete[]();
  }
  uint64_t v6 = 0;
  if (v11) {
LABEL_25:
  }
    operator delete[]();
  return v6;
}

uint64_t sub_1C084(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 24))(*(void *)(a1 + 16));
  uint64_t v7 = **(void **)(a1 + 24);
  if (v6)
  {
    uint64_t v8 = (*(uint64_t (**)(void))(v7 + 16))();
    if (v8)
    {
      (***(void (****)(void))(a1 + 16))(*(void *)(a1 + 16));
      if ((int)a3 >= 1)
      {
        uint64_t v10 = 0;
        do
        {
          if (!*(unsigned char *)(a2 + v10)) {
            *(float *)(v8 + 4 * v10) = v9 * *(float *)(v8 + 4 * v10);
          }
          ++v10;
        }
        while (a3 != v10);
      }
    }
    return v8;
  }
  if ((*(unsigned int (**)(void))(v7 + 24))())
  {
    uint64_t v8 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16), a2, a3);
    if (v8)
    {
      (***(void (****)(void))(a1 + 24))(*(void *)(a1 + 24));
      if ((int)a3 >= 1)
      {
        uint64_t v12 = 0;
        do
        {
          if (!*(unsigned char *)(a2 + v12)) {
            *(float *)(v8 + 4 * v12) = v11 * *(float *)(v8 + 4 * v12);
          }
          ++v12;
        }
        while (a3 != v12);
      }
    }
    return v8;
  }
  uint64_t v13 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 24) + 16))(*(void *)(a1 + 24), a2, a3);
  uint64_t v14 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16), a2, a3);
  if (v14) {
    BOOL v15 = v13 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (!v15)
  {
    if ((int)a3 >= 1)
    {
      uint64_t v16 = 0;
      do
      {
        if (!*(unsigned char *)(a2 + v16)) {
          *(float *)(v14 + 4 * v16) = *(float *)(v13 + 4 * v16) * *(float *)(v14 + 4 * v16);
        }
        ++v16;
      }
      while (a3 != v16);
    }
    goto LABEL_31;
  }
  if (v14) {
    operator delete[]();
  }
  uint64_t v8 = 0;
  if (v13) {
LABEL_31:
  }
    operator delete[]();
  return v8;
}

uint64_t sub_1C330()
{
  return 5;
}

uint64_t sub_1C338(uint64_t a1)
{
  if ((*(unsigned int (**)(void))(**(void **)(a1 + 16) + 40))(*(void *)(a1 + 16))
    && (***(float (****)(void))(a1 + 16))(*(void *)(a1 + 16)) == 0.0
    || (*(unsigned int (**)(void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24))
    && (***(float (****)(void))(a1 + 24))(*(void *)(a1 + 24)) == 0.0)
  {
    return 1;
  }
  return sub_1C434(a1);
}

uint64_t sub_1C434(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2) {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 40))(v2) & 1;
  }
  else {
    uint64_t result = 1;
  }
  uint64_t v4 = *(void *)(a1 + 24);
  if (v4) {
    BOOL v5 = result == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5) {
    return (*(uint64_t (**)(void))(*(void *)v4 + 40))(*(void *)(a1 + 24)) & 1;
  }
  return result;
}

void *sub_1C4C8(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 112))(*(void *)(a1 + 16));
  uint64_t v4 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 112))(*(void *)(a1 + 24), a2);
  uint64_t v5 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 120))(*(void *)(a1 + 16));
  uint64_t v6 = (*(uint64_t (**)(void))(**(void **)(a1 + 24) + 120))(*(void *)(a1 + 24));
  uint64_t v7 = sub_89A0(0x20uLL);
  sub_1B2FC(v7, v12, v6);
  *uint64_t v7 = off_1A83D0;
  uint64_t v8 = v4;
  float v9 = sub_89A0(0x20uLL);
  sub_1B2FC(v9, v5, v8);
  void *v9 = off_1A83D0;
  uint64_t v10 = sub_89A0(0x20uLL);
  sub_1B2FC(v10, (uint64_t)v7, (uint64_t)v9);
  *uint64_t v10 = off_1A8150;
  return v10;
}

void sub_1C718(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, long long a13, uint64_t a14)
{
  if (v15) {
    free(v15);
  }
  if (a2 == 1)
  {
    long long v19 = __cxa_begin_catch(exception_object);
    long long v21 = *(_OWORD *)v19;
    uint64_t v22 = *((void *)v19 + 2);
    if (v14) {
      (*(void (**)(uint64_t))(*(void *)v14 + 152))(v14);
    }
    if (v16) {
      (*(void (**)(uint64_t))(*(void *)v16 + 152))(v16);
    }
    exception = __cxa_allocate_exception(0x18uLL);
    *(_OWORD *)exception = v21;
    exception[2] = v22;
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1C924(uint64_t a1)
{
  sub_1AE64(a1);
  if ((*(unsigned int (**)(void))(**(void **)(a1 + 16) + 40))(*(void *)(a1 + 16))
    && *(void *)(a1 + 8))
  {
    float v2 = (***(float (****)(void))(a1 + 16))(*(void *)(a1 + 16));
    if (v2 == 0.0)
    {
LABEL_4:
      uint64_t v3 = sub_89A0(0x18uLL);
      void *v3 = off_1AA280;
      v3[1] = 0;
      *((_DWORD *)v3 + 4) = 0;
      return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296))(a1);
    }
    if (v2 == 1.0)
    {
      uint64_t v5 = *(void *)(a1 + 24);
LABEL_12:
      uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 296);
      return v7(a1, v5);
    }
  }
  if ((*(unsigned int (**)(void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24))
    && *(void *)(a1 + 8))
  {
    float v6 = (***(float (****)(void))(a1 + 24))(*(void *)(a1 + 24));
    if (v6 == 0.0) {
      goto LABEL_4;
    }
    if (v6 == 1.0)
    {
      uint64_t v5 = *(void *)(a1 + 16);
      goto LABEL_12;
    }
  }
  uint64_t result = (*(uint64_t (**)(void, void))(**(void **)(a1 + 16) + 136))(*(void *)(a1 + 16), *(void *)(a1 + 24));
  if (result)
  {
    uint64_t v8 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 120))(*(void *)(a1 + 16));
    float v9 = sub_89A0(0x18uLL);
    void *v9 = off_1AA280;
    v9[1] = 0;
    *((_DWORD *)v9 + 4) = 0x40000000;
    uint64_t v10 = sub_89A0(0x20uLL);
    sub_1B2FC(v10, v8, (uint64_t)v9);
    *uint64_t v10 = off_1A8790;
    return (*(uint64_t (**)(uint64_t, void *))(*(void *)a1 + 296))(a1, v10);
  }
  return result;
}

void sub_1CC80(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  if (v20) {
    free(v20);
  }
  __cxa_begin_catch(a1);
  if (v18) {
    (*(void (**)(uint64_t))(*(void *)v18 + 152))(v18);
  }
  if (v19) {
    (*(void (**)(uint64_t))(*(void *)v19 + 152))(v19);
  }
  __cxa_end_catch();
}

void sub_1CD74()
{
}

float sub_1CD88(float (****a1)(void))
{
  float v2 = (**a1[3])(a1[3]);
  if (v2 == 0.0) {
    ((void (*)(float (****)(void), uint64_t, float (****)(void), uint64_t))(*a1)[34])(a1, 1, a1, -1);
  }
  return (**a1[2])(a1[2]) / v2;
}

uint64_t sub_1CE4C(uint64_t a1, uint64_t a2)
{
  int v4 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 24))(*(void *)(a1 + 16));
  uint64_t v5 = **(void **)(a1 + 24);
  if (v4)
  {
    uint64_t v6 = (*(uint64_t (**)(void))(v5 + 8))();
    if (v6)
    {
      (***(void (****)(void))(a1 + 16))(*(void *)(a1 + 16));
      if ((int)a2 >= 1)
      {
        uint64_t v8 = 0;
        do
        {
          *(float *)(v6 + v8) = v7 / *(float *)(v6 + v8);
          v8 += 4;
        }
        while (4 * a2 != v8);
      }
    }
    return v6;
  }
  if ((*(unsigned int (**)(void))(v5 + 24))())
  {
    uint64_t v6 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16), a2);
    if (v6)
    {
      (***(void (****)(void))(a1 + 24))(*(void *)(a1 + 24));
      if ((int)a2 >= 1)
      {
        uint64_t v10 = 0;
        do
        {
          *(float *)(v6 + v10) = *(float *)(v6 + v10) / v9;
          v10 += 4;
        }
        while (4 * a2 != v10);
      }
    }
    return v6;
  }
  uint64_t v11 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 8))(*(void *)(a1 + 24), a2);
  uint64_t v12 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16), a2);
  if (v12) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13)
  {
    if ((int)a2 >= 1)
    {
      uint64_t v14 = 0;
      do
      {
        *(float *)(v12 + v14) = *(float *)(v12 + v14) / *(float *)(v11 + v14);
        v14 += 4;
      }
      while (4 * a2 != v14);
    }
    goto LABEL_25;
  }
  if (v12) {
    operator delete[]();
  }
  uint64_t v6 = 0;
  if (v11) {
LABEL_25:
  }
    operator delete[]();
  return v6;
}

uint64_t sub_1D0C4(uint64_t a1, unsigned char *a2, uint64_t a3)
{
  int v6 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 24))(*(void *)(a1 + 16));
  uint64_t v7 = **(void **)(a1 + 24);
  if (v6)
  {
    uint64_t v8 = (*(uint64_t (**)(void))(v7 + 16))();
    if (v8)
    {
      (***(void (****)(void))(a1 + 16))(*(void *)(a1 + 16));
      if ((int)a3 >= 1)
      {
        uint64_t v10 = 0;
        do
        {
          if (!a2[v10])
          {
            float v11 = *(float *)(v8 + 4 * v10);
            if (v11 == 0.0) {
              a2[v10] = 1;
            }
            else {
              *(float *)(v8 + 4 * v10) = v9 / v11;
            }
          }
          ++v10;
        }
        while (a3 != v10);
      }
    }
  }
  else if ((*(unsigned int (**)(void))(v7 + 24))())
  {
    uint64_t v8 = (*(uint64_t (**)(void, unsigned char *, uint64_t))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16), a2, a3);
    if (v8)
    {
      float v12 = (***(float (****)(void))(a1 + 24))(*(void *)(a1 + 24));
      if (v12 == 0.0)
      {
        if ((int)a3 >= 1) {
          memset(a2, 1, a3);
        }
      }
      else if ((int)a3 >= 1)
      {
        uint64_t v13 = 0;
        do
        {
          if (!a2[v13]) {
            *(float *)(v8 + 4 * v13) = *(float *)(v8 + 4 * v13) / v12;
          }
          ++v13;
        }
        while (a3 != v13);
      }
    }
  }
  else
  {
    uint64_t v14 = (*(uint64_t (**)(void, unsigned char *, uint64_t))(**(void **)(a1 + 24) + 16))(*(void *)(a1 + 24), a2, a3);
    uint64_t v15 = (*(uint64_t (**)(void, unsigned char *, uint64_t))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16), a2, a3);
    if (v15) {
      BOOL v16 = v14 == 0;
    }
    else {
      BOOL v16 = 1;
    }
    if (!v16)
    {
      if ((int)a3 >= 1)
      {
        uint64_t v17 = (float *)v14;
        uint64_t v18 = (float *)v15;
        uint64_t v19 = a3;
        do
        {
          if (!*a2)
          {
            if (*v17 == 0.0) {
              *a2 = 1;
            }
            else {
              *uint64_t v18 = *v18 / *v17;
            }
          }
          ++v18;
          ++v17;
          ++a2;
          --v19;
        }
        while (v19);
      }
      operator delete[]();
    }
    if (v15) {
      operator delete[]();
    }
    if (v14) {
      operator delete[]();
    }
    return 0;
  }
  return v8;
}

uint64_t sub_1D3D8()
{
  return 6;
}

uint64_t sub_1D3E0(uint64_t a1)
{
  if ((*(unsigned int (**)(void))(**(void **)(a1 + 16) + 40))(*(void *)(a1 + 16))
    && (***(float (****)(void))(a1 + 16))(*(void *)(a1 + 16)) == 0.0)
  {
    return 1;
  }
  return sub_1C434(a1);
}

void *sub_1D480(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 112))(*(void *)(a1 + 16));
  uint64_t v4 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 112))(*(void *)(a1 + 24), a2);
  uint64_t v5 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 120))(*(void *)(a1 + 16));
  uint64_t v6 = (*(uint64_t (**)(void))(**(void **)(a1 + 24) + 120))(*(void *)(a1 + 24));
  uint64_t v7 = (*(uint64_t (**)(void))(**(void **)(a1 + 24) + 120))(*(void *)(a1 + 24));
  uint64_t v8 = sub_89A0(0x20uLL);
  float v9 = sub_89A0(0x18uLL);
  void *v9 = off_1AA280;
  v9[1] = 0;
  *((_DWORD *)v9 + 4) = 0x40000000;
  sub_1B2FC(v8, v7, (uint64_t)v9);
  void *v8 = off_1A8790;
  uint64_t v10 = sub_89A0(0x20uLL);
  sub_1B2FC(v10, v16, v6);
  *uint64_t v10 = off_1A83D0;
  uint64_t v11 = v4;
  float v12 = sub_89A0(0x20uLL);
  sub_1B2FC(v12, v5, v11);
  *float v12 = off_1A83D0;
  uint64_t v13 = sub_89A0(0x20uLL);
  sub_1B2FC(v13, (uint64_t)v10, (uint64_t)v12);
  *uint64_t v13 = off_1A8290;
  uint64_t v14 = sub_89A0(0x20uLL);
  sub_1B2FC(v14, (uint64_t)v13, (uint64_t)v8);
  void *v14 = off_1A8510;
  return v14;
}

void sub_1D810(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, long long a19, uint64_t a20)
{
  if (v21) {
    free(v21);
  }
  if (a2 == 1)
  {
    int v23 = __cxa_begin_catch(exception_object);
    long long v26 = *(_OWORD *)v23;
    uint64_t v27 = *((void *)v23 + 2);
    if (v20) {
      (*(void (**)(uint64_t))(*(void *)v20 + 152))(v20);
    }
    if (a15) {
      (*(void (**)(void *))(*(void *)a15 + 152))(a15);
    }
    exception = __cxa_allocate_exception(0x18uLL);
    *(_OWORD *)exception = v26;
    exception[2] = v27;
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DAE8(uint64_t a1)
{
  sub_1AE64(a1);
  if ((*(unsigned int (**)(void))(**(void **)(a1 + 16) + 40))(*(void *)(a1 + 16))
    && (***(float (****)(void))(a1 + 16))(*(void *)(a1 + 16)) == 0.0)
  {
    float v2 = sub_89A0(0x18uLL);
    *float v2 = off_1AA280;
    v2[1] = 0;
    *((_DWORD *)v2 + 4) = 0;
    return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296))(a1);
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(void, void))(**(void **)(a1 + 16) + 136))(*(void *)(a1 + 16), *(void *)(a1 + 24));
    if (result)
    {
      uint64_t v4 = sub_89A0(0x18uLL);
      *uint64_t v4 = off_1AA280;
      v4[1] = 0;
      *((_DWORD *)v4 + 4) = 1065353216;
      return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296))(a1);
    }
  }
  return result;
}

void sub_1DC54(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
}

float sub_1DC78(float (****a1)(void))
{
  float v2 = (**a1[3])(a1[3]);
  if (v2 == 0.0) {
    ((void (*)(float (****)(void), uint64_t, uint64_t, uint64_t))(*a1)[34])(a1, 1, -1, -1);
  }
  return (float)((uint64_t)(**a1[2])(a1[2]) % (uint64_t)v2);
}

uint64_t sub_1DD4C(uint64_t a1, uint64_t a2)
{
  int v4 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 24))(*(void *)(a1 + 16));
  uint64_t v5 = **(void **)(a1 + 24);
  if (v4)
  {
    uint64_t v6 = (*(uint64_t (**)(void))(v5 + 8))();
    if (v6)
    {
      (***(void (****)(void))(a1 + 16))(*(void *)(a1 + 16));
      if ((int)a2 >= 1)
      {
        uint64_t v8 = 0;
        do
        {
          *(float *)(v6 + v8) = (float)((uint64_t)v7 % (uint64_t)*(float *)(v6 + v8));
          v8 += 4;
        }
        while (4 * a2 != v8);
      }
    }
    return v6;
  }
  if ((*(unsigned int (**)(void))(v5 + 24))())
  {
    uint64_t v6 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16), a2);
    if (v6)
    {
      (***(void (****)(void))(a1 + 24))(*(void *)(a1 + 24));
      if ((int)a2 >= 1)
      {
        uint64_t v10 = 0;
        do
        {
          *(float *)(v6 + v10) = (float)((uint64_t)*(float *)(v6 + v10) % (uint64_t)v9);
          v10 += 4;
        }
        while (4 * a2 != v10);
      }
    }
    return v6;
  }
  uint64_t v11 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 8))(*(void *)(a1 + 24), a2);
  uint64_t v12 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16), a2);
  if (v12) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13)
  {
    if ((int)a2 >= 1)
    {
      uint64_t v14 = 0;
      do
      {
        *(float *)(v12 + v14) = (float)((uint64_t)*(float *)(v12 + v14) % (uint64_t)*(float *)(v11 + v14));
        v14 += 4;
      }
      while (4 * a2 != v14);
    }
    goto LABEL_25;
  }
  if (v12) {
    operator delete[]();
  }
  uint64_t v6 = 0;
  if (v11) {
LABEL_25:
  }
    operator delete[]();
  return v6;
}

uint64_t sub_1DFF4(uint64_t a1, unsigned char *a2, uint64_t a3)
{
  int v6 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 24))(*(void *)(a1 + 16));
  uint64_t v7 = **(void **)(a1 + 24);
  if (v6)
  {
    uint64_t v8 = (*(uint64_t (**)(void))(v7 + 16))();
    if (v8)
    {
      (***(void (****)(void))(a1 + 16))(*(void *)(a1 + 16));
      if ((int)a3 >= 1)
      {
        uint64_t v10 = 0;
        uint64_t v11 = (uint64_t)v9;
        do
        {
          if (!a2[v10])
          {
            float v12 = *(float *)(v8 + 4 * v10);
            if (v12 == 0.0) {
              a2[v10] = 1;
            }
            else {
              *(float *)(v8 + 4 * v10) = (float)(v11 % (uint64_t)v12);
            }
          }
          ++v10;
        }
        while (a3 != v10);
      }
    }
  }
  else if ((*(unsigned int (**)(void))(v7 + 24))())
  {
    uint64_t v8 = (*(uint64_t (**)(void, unsigned char *, uint64_t))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16), a2, a3);
    if (v8)
    {
      float v13 = (***(float (****)(void))(a1 + 24))(*(void *)(a1 + 24));
      if (v13 == 0.0)
      {
        if ((int)a3 >= 1) {
          memset(a2, 1, a3);
        }
      }
      else if ((int)a3 >= 1)
      {
        uint64_t v14 = 0;
        do
        {
          if (!a2[v14]) {
            *(float *)(v8 + 4 * v14) = (float)((uint64_t)*(float *)(v8 + 4 * v14) % (uint64_t)v13);
          }
          ++v14;
        }
        while (a3 != v14);
      }
    }
  }
  else
  {
    uint64_t v15 = (*(uint64_t (**)(void, unsigned char *, uint64_t))(**(void **)(a1 + 24) + 16))(*(void *)(a1 + 24), a2, a3);
    uint64_t v16 = (*(uint64_t (**)(void, unsigned char *, uint64_t))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16), a2, a3);
    if (v16) {
      BOOL v17 = v15 == 0;
    }
    else {
      BOOL v17 = 1;
    }
    if (!v17)
    {
      if ((int)a3 >= 1)
      {
        uint64_t v18 = (float *)v15;
        uint64_t v19 = (float *)v16;
        uint64_t v20 = a3;
        do
        {
          if (!*a2)
          {
            if (*v18 == 0.0) {
              *a2 = 1;
            }
            else {
              *uint64_t v19 = (float)((uint64_t)*v19 % (uint64_t)*v18);
            }
          }
          ++v19;
          ++v18;
          ++a2;
          --v20;
        }
        while (v20);
      }
      operator delete[]();
    }
    if (v16) {
      operator delete[]();
    }
    if (v15) {
      operator delete[]();
    }
    return 0;
  }
  return v8;
}

uint64_t sub_1E338()
{
  return 7;
}

uint64_t sub_1E340(uint64_t a1)
{
  sub_1AE64(a1);
  uint64_t result = (*(uint64_t (**)(void, void))(**(void **)(a1 + 16) + 136))(*(void *)(a1 + 16), *(void *)(a1 + 24));
  if (result)
  {
    uint64_t v3 = sub_89A0(0x18uLL);
    void *v3 = off_1AA280;
    v3[1] = 0;
    *((_DWORD *)v3 + 4) = 0;
    return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296))(a1);
  }
  return result;
}

void sub_1E3EC(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
}

double sub_1E40C(uint64_t a1)
{
  float v2 = (***(float (****)(void))(a1 + 16))(*(void *)(a1 + 16));
  float v3 = (***(float (****)(void))(a1 + 24))(*(void *)(a1 + 24));
  if (v2 <= 0.0)
  {
    double result = 0.0;
    if (v2 != 0.0)
    {
      double result = pow(v2, (double)(int)v3);
      *(float *)&double result = result;
    }
  }
  else
  {
    *(float *)&double result = powf(v2, v3);
  }
  return result;
}

char *sub_1E4D4(uint64_t a1, uint64_t a2)
{
  int v4 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 24))(*(void *)(a1 + 16));
  uint64_t v5 = **(void **)(a1 + 24);
  if (v4)
  {
    int v6 = (char *)(*(uint64_t (**)(void))(v5 + 8))();
    if (v6)
    {
      float v7 = (***(float (****)(void))(a1 + 16))(*(void *)(a1 + 16));
      float v8 = v7;
      if (v7 <= 0.0)
      {
        if (v7 == 0.0)
        {
          if ((int)a2 >= 1) {
            bzero(v6, 4 * a2);
          }
        }
        else if ((int)a2 >= 1)
        {
          uint64_t v21 = 0;
          long double v22 = v7;
          uint64_t v23 = 4 * a2;
          do
          {
            float v24 = pow(v22, (double)(uint64_t)*(float *)&v6[v21]);
            *(float *)&v6[v21] = v24;
            v21 += 4;
          }
          while (v23 != v21);
        }
      }
      else if ((int)a2 >= 1)
      {
        uint64_t v9 = 0;
        uint64_t v10 = 4 * a2;
        do
        {
          *(float *)&v6[v9] = powf(v8, *(float *)&v6[v9]);
          v9 += 4;
        }
        while (v10 != v9);
      }
    }
    return v6;
  }
  if ((*(unsigned int (**)(void))(v5 + 24))())
  {
    int v6 = (char *)(*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16), a2);
    if (!v6) {
      return v6;
    }
    (***(void (****)(void))(a1 + 24))(*(void *)(a1 + 24));
    if ((int)a2 < 1) {
      return v6;
    }
    float v12 = v11;
    uint64_t v13 = 0;
    double v14 = (double)(uint64_t)v11;
    uint64_t v15 = 4 * a2;
    while (1)
    {
      float v16 = *(float *)&v6[v13];
      if (v16 > 0.0) {
        break;
      }
      if (v16 < 0.0)
      {
        float v17 = pow(v16, v14);
        goto LABEL_16;
      }
LABEL_17:
      v13 += 4;
      if (v15 == v13) {
        return v6;
      }
    }
    float v17 = powf(v16, v12);
LABEL_16:
    *(float *)&v6[v13] = v17;
    goto LABEL_17;
  }
  uint64_t v18 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 8))(*(void *)(a1 + 24), a2);
  uint64_t v19 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16), a2);
  if (v19) {
    BOOL v20 = v18 == 0;
  }
  else {
    BOOL v20 = 1;
  }
  if (!v20)
  {
    if ((int)a2 < 1) {
LABEL_44:
    }
      operator delete[]();
    a2 = a2;
    __darwin_ct_rune_t v25 = (float *)v19;
    long long v26 = (float *)v18;
    while (1)
    {
      float v27 = *v25;
      if (*v25 > 0.0) {
        break;
      }
      if (*v25 < 0.0)
      {
        float v28 = pow(v27, (double)(uint64_t)*v26);
        goto LABEL_42;
      }
LABEL_43:
      ++v26;
      ++v25;
      if (!--a2) {
        goto LABEL_44;
      }
    }
    float v28 = powf(v27, *v26);
LABEL_42:
    *__darwin_ct_rune_t v25 = v28;
    goto LABEL_43;
  }
  if (v19) {
    operator delete[]();
  }
  if (v18) {
    operator delete[]();
  }
  return 0;
}

uint64_t sub_1E838(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 24))(*(void *)(a1 + 16));
  uint64_t v7 = **(void **)(a1 + 24);
  if (v6)
  {
    uint64_t v8 = (*(uint64_t (**)(void))(v7 + 16))();
    if (v8)
    {
      float v9 = (***(float (****)(void))(a1 + 16))(*(void *)(a1 + 16));
      float v10 = v9;
      if (v9 <= 0.0)
      {
        if (v9 == 0.0)
        {
          if ((int)a3 >= 1)
          {
            uint64_t v18 = 0;
            do
            {
              if (!*(unsigned char *)(a2 + v18)) {
                *(_DWORD *)(v8 + 4 * v18) = 0;
              }
              ++v18;
            }
            while (a3 != v18);
          }
        }
        else if ((int)a3 >= 1)
        {
          uint64_t v23 = 0;
          long double v24 = v9;
          do
          {
            if (!*(unsigned char *)(a2 + v23))
            {
              float v25 = pow(v24, (double)(uint64_t)*(float *)(v8 + 4 * v23));
              *(float *)(v8 + 4 * v23) = v25;
            }
            ++v23;
          }
          while (a3 != v23);
        }
      }
      else if ((int)a3 >= 1)
      {
        uint64_t v11 = 0;
        do
        {
          if (!*(unsigned char *)(a2 + v11)) {
            *(float *)(v8 + 4 * v11) = powf(v10, *(float *)(v8 + 4 * v11));
          }
          ++v11;
        }
        while (a3 != v11);
      }
    }
    return v8;
  }
  if ((*(unsigned int (**)(void))(v7 + 24))())
  {
    uint64_t v8 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16), a2, a3);
    if (!v8) {
      return v8;
    }
    (***(void (****)(void))(a1 + 24))(*(void *)(a1 + 24));
    if ((int)a3 < 1) {
      return v8;
    }
    float v13 = v12;
    uint64_t v14 = 0;
    double v15 = (double)(uint64_t)v12;
    while (1)
    {
      if (!*(unsigned char *)(a2 + v14))
      {
        float v16 = *(float *)(v8 + 4 * v14);
        if (v16 > 0.0)
        {
          float v17 = powf(v16, v13);
LABEL_19:
          *(float *)(v8 + 4 * v14) = v17;
          goto LABEL_20;
        }
        if (v16 < 0.0)
        {
          float v17 = pow(v16, v15);
          goto LABEL_19;
        }
      }
LABEL_20:
      if (a3 == ++v14) {
        return v8;
      }
    }
  }
  uint64_t v19 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 24) + 16))(*(void *)(a1 + 24), a2, a3);
  uint64_t v20 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16), a2, a3);
  uint64_t v21 = v20;
  if (v20) {
    BOOL v22 = v19 == 0;
  }
  else {
    BOOL v22 = 1;
  }
  if (!v22)
  {
    if ((int)a3 >= 1)
    {
      for (uint64_t i = 0; a3 != i; ++i)
      {
        if (!*(unsigned char *)(a2 + i))
        {
          float v27 = *(float *)(v21 + 4 * i);
          if (v27 > 0.0)
          {
            float v28 = powf(v27, *(float *)(v19 + 4 * i));
LABEL_51:
            *(float *)(v21 + 4 * i) = v28;
            continue;
          }
          if (v27 < 0.0)
          {
            float v28 = pow(v27, (double)(uint64_t)*(float *)(v19 + 4 * i));
            goto LABEL_51;
          }
        }
      }
    }
LABEL_53:
    operator delete[]();
  }
  if (v20) {
    operator delete[]();
  }
  uint64_t v8 = 0;
  if (v19) {
    goto LABEL_53;
  }
  return v8;
}

uint64_t sub_1EBCC()
{
  return 8;
}

uint64_t sub_1EBD4(uint64_t a1)
{
  if ((*(unsigned int (**)(void))(**(void **)(a1 + 16) + 40))(*(void *)(a1 + 16))
    && ((***(float (****)(void))(a1 + 16))(*(void *)(a1 + 16)) == 1.0
     || (***(float (****)(void))(a1 + 16))(*(void *)(a1 + 16)) == 0.0)
    || (*(unsigned int (**)(void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24))
    && (***(float (****)(void))(a1 + 24))(*(void *)(a1 + 24)) == 0.0)
  {
    return 1;
  }
  return sub_1C434(a1);
}

void *sub_1ED04(uint64_t a1, uint64_t a2)
{
  uint64_t v31 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 112))(*(void *)(a1 + 16));
  uint64_t v3 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 120))(*(void *)(a1 + 16));
  uint64_t v4 = (*(uint64_t (**)(void))(**(void **)(a1 + 24) + 120))(*(void *)(a1 + 24));
  uint64_t v28 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 112))(*(void *)(a1 + 24), a2);
  __uint32_t v30 = sub_89A0(0x18uLL);
  *__uint32_t v30 = off_1AA280;
  v30[1] = 0;
  *((_DWORD *)v30 + 4) = 1065353216;
  uint64_t v5 = sub_89A0(0x20uLL);
  uint64_t v26 = v3;
  uint64_t v27 = v4;
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 120))(v4);
  sub_1B2FC(v5, v6, (uint64_t)v30);
  *uint64_t v5 = off_1A8290;
  uint64_t v7 = sub_89A0(0x20uLL);
  uint64_t v8 = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 120))(v3);
  sub_1B2FC(v7, v8, (uint64_t)v5);
  *uint64_t v7 = off_1A8790;
  float v9 = sub_89A0(0x20uLL);
  uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 120))(v4);
  sub_1B2FC(v9, v10, (uint64_t)v7);
  void *v9 = off_1A83D0;
  uint64_t v11 = sub_89A0(0x20uLL);
  uint64_t v12 = (*(uint64_t (**)(uint64_t))(*(void *)v31 + 120))(v31);
  sub_1B2FC(v11, v12, (uint64_t)v9);
  *uint64_t v11 = off_1A83D0;
  uint64_t v13 = v3;
  uint64_t v14 = sub_89A0(0x18uLL);
  uint64_t v15 = (*(uint64_t (**)(uint64_t))(*(void *)v13 + 120))(v13);
  sub_10788(v14, v15);
  void *v14 = &off_1A57E0;
  float v16 = sub_89A0(0x20uLL);
  uint64_t v17 = (*(uint64_t (**)(uint64_t))(*(void *)v13 + 120))(v13);
  sub_1B2FC(v16, v17, (uint64_t)v14);
  void *v16 = off_1A8790;
  uint64_t v18 = sub_89A0(0x20uLL);
  uint64_t v19 = (*(uint64_t (**)(uint64_t))(*(void *)v28 + 120))(v28);
  sub_1B2FC(v18, v19, (uint64_t)v16);
  *uint64_t v18 = off_1A83D0;
  uint64_t v20 = sub_89A0(0x20uLL);
  uint64_t v21 = (*(uint64_t (**)(uint64_t))(*(void *)v13 + 120))(v13);
  uint64_t v22 = (*(uint64_t (**)(uint64_t))(*(void *)v27 + 120))(v27);
  sub_1B2FC(v20, v21, v22);
  *uint64_t v20 = off_1A8790;
  uint64_t v23 = sub_89A0(0x20uLL);
  sub_1B2FC(v23, (uint64_t)v20, (uint64_t)v18);
  void *v23 = off_1A83D0;
  long double v24 = sub_89A0(0x20uLL);
  sub_1B2FC(v24, (uint64_t)v11, (uint64_t)v23);
  void *v24 = off_1A8150;
  (*(void (**)(uint64_t))(*(void *)v26 + 152))(v26);
  (*(void (**)(uint64_t))(*(void *)v27 + 152))(v27);
  (*(void (**)(uint64_t))(*(void *)v31 + 152))(v31);
  (*(void (**)(uint64_t))(*(void *)v28 + 152))(v28);
  return v24;
}

void sub_1F404(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, long long a15, uint64_t a16)
{
  if (v16) {
    free(v16);
  }
  if (a2 == 1)
  {
    uint64_t v19 = __cxa_begin_catch(exception_object);
    long long v22 = *(_OWORD *)v19;
    uint64_t v23 = *((void *)v19 + 2);
    if (a10) {
      (*(void (**)(uint64_t))(*(void *)a10 + 152))(a10);
    }
    if (a11) {
      (*(void (**)(uint64_t))(*(void *)a11 + 152))(a11);
    }
    if (a14) {
      (*(void (**)(uint64_t))(*(void *)a14 + 152))(a14);
    }
    if (a12) {
      (*(void (**)(uint64_t))(*(void *)a12 + 152))(a12);
    }
    if (a13) {
      (*(void (**)(void *))(*(void *)a13 + 152))(a13);
    }
    if (v17) {
      (*(void (**)(uint64_t))(*(void *)v17 + 152))(v17);
    }
    exception = __cxa_allocate_exception(0x18uLL);
    *(_OWORD *)exception = v22;
    exception[2] = v23;
  }
  _Unwind_Resume(exception_object);
}

void sub_1F690(void *a1)
{
  sub_1AE64((uint64_t)a1);
  if ((*(unsigned int (**)(void))(*(void *)a1[2] + 40))(a1[2])
    && ((**(float (***)(void))a1[2])(a1[2]) == 1.0
     || (**(float (***)(void))a1[2])(a1[2]) == 0.0))
  {
    float v2 = (float *)sub_89A0(0x18uLL);
    float v3 = (**(float (***)(void))a1[2])(a1[2]);
    *(void *)float v2 = off_1AA280;
    *((void *)v2 + 1) = 0;
    v2[4] = v3;
    (*(void (**)(void *, float *))(*a1 + 296))(a1, v2);
  }
  else if ((*(unsigned int (**)(void))(*(void *)a1[3] + 40))(a1[3]) {
         && (**(float (***)(void))a1[3])(a1[3]) == 0.0)
  }
  {
    uint64_t v4 = sub_89A0(0x18uLL);
    *uint64_t v4 = off_1AA280;
    v4[1] = 0;
    *((_DWORD *)v4 + 4) = 1065353216;
    (*(void (**)(void *))(*a1 + 296))(a1);
  }
  else if ((*(unsigned int (**)(void))(*(void *)a1[3] + 40))(a1[3]) {
         && (**(float (***)(void))a1[3])(a1[3]) == 1.0)
  }
  {
    uint64_t v5 = a1[2];
    uint64_t v6 = *(void (**)(void *, uint64_t))(*a1 + 296);
    v6(a1, v5);
  }
}

void sub_1F93C(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
}

void sub_1F97C(uint64_t a1)
{
}

uint64_t sub_1FA08(uint64_t a1, uint64_t a2)
{
  int v4 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 24))(*(void *)(a1 + 16));
  uint64_t v5 = **(void **)(a1 + 24);
  if (v4)
  {
    uint64_t v6 = (*(uint64_t (**)(void))(v5 + 8))();
    if (v6)
    {
      (***(void (****)(void))(a1 + 16))(*(void *)(a1 + 16));
      if ((int)a2 >= 1)
      {
        uint64_t v8 = 0;
        do
        {
          if (v7 >= *(float *)(v6 + v8)) {
            float v9 = 0.0;
          }
          else {
            float v9 = 1.0;
          }
          *(float *)(v6 + v8) = v9;
          v8 += 4;
        }
        while (4 * a2 != v8);
      }
    }
    return v6;
  }
  if ((*(unsigned int (**)(void))(v5 + 24))())
  {
    uint64_t v6 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16), a2);
    if (v6)
    {
      (***(void (****)(void))(a1 + 24))(*(void *)(a1 + 24));
      if ((int)a2 >= 1)
      {
        uint64_t v11 = 0;
        do
        {
          if (*(float *)(v6 + v11) >= v10) {
            float v12 = 0.0;
          }
          else {
            float v12 = 1.0;
          }
          *(float *)(v6 + v11) = v12;
          v11 += 4;
        }
        while (4 * a2 != v11);
      }
    }
    return v6;
  }
  uint64_t v13 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 8))(*(void *)(a1 + 24), a2);
  uint64_t v14 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16), a2);
  if (v14) {
    BOOL v15 = v13 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (!v15)
  {
    if ((int)a2 >= 1)
    {
      uint64_t v16 = 0;
      do
      {
        if (*(float *)(v14 + v16) >= *(float *)(v13 + v16)) {
          float v17 = 0.0;
        }
        else {
          float v17 = 1.0;
        }
        *(float *)(v14 + v16) = v17;
        v16 += 4;
      }
      while (4 * a2 != v16);
    }
    goto LABEL_34;
  }
  if (v14) {
    operator delete[]();
  }
  uint64_t v6 = 0;
  if (v13) {
LABEL_34:
  }
    operator delete[]();
  return v6;
}

uint64_t sub_1FCA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 24))(*(void *)(a1 + 16));
  uint64_t v7 = **(void **)(a1 + 24);
  if (v6)
  {
    uint64_t v8 = (*(uint64_t (**)(void))(v7 + 16))();
    if (v8)
    {
      (***(void (****)(void))(a1 + 16))(*(void *)(a1 + 16));
      if ((int)a3 >= 1)
      {
        uint64_t v10 = 0;
        do
        {
          if (!*(unsigned char *)(a2 + v10))
          {
            if (v9 >= *(float *)(v8 + 4 * v10)) {
              float v11 = 0.0;
            }
            else {
              float v11 = 1.0;
            }
            *(float *)(v8 + 4 * v10) = v11;
          }
          ++v10;
        }
        while (a3 != v10);
      }
    }
    return v8;
  }
  if ((*(unsigned int (**)(void))(v7 + 24))())
  {
    uint64_t v8 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16), a2, a3);
    if (v8)
    {
      (***(void (****)(void))(a1 + 24))(*(void *)(a1 + 24));
      if ((int)a3 >= 1)
      {
        uint64_t v13 = 0;
        do
        {
          if (!*(unsigned char *)(a2 + v13))
          {
            if (*(float *)(v8 + 4 * v13) >= v12) {
              float v14 = 0.0;
            }
            else {
              float v14 = 1.0;
            }
            *(float *)(v8 + 4 * v13) = v14;
          }
          ++v13;
        }
        while (a3 != v13);
      }
    }
    return v8;
  }
  uint64_t v15 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 24) + 16))(*(void *)(a1 + 24), a2, a3);
  uint64_t v16 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16), a2, a3);
  if (v16) {
    BOOL v17 = v15 == 0;
  }
  else {
    BOOL v17 = 1;
  }
  if (!v17)
  {
    if ((int)a3 >= 1)
    {
      uint64_t v18 = 0;
      do
      {
        if (!*(unsigned char *)(a2 + v18))
        {
          if (*(float *)(v16 + 4 * v18) >= *(float *)(v15 + 4 * v18)) {
            float v19 = 0.0;
          }
          else {
            float v19 = 1.0;
          }
          *(float *)(v16 + 4 * v18) = v19;
        }
        ++v18;
      }
      while (a3 != v18);
    }
    goto LABEL_40;
  }
  if (v16) {
    operator delete[]();
  }
  uint64_t v8 = 0;
  if (v15) {
LABEL_40:
  }
    operator delete[]();
  return v8;
}

uint64_t sub_1FF74()
{
  return 9;
}

uint64_t sub_1FF7C(uint64_t a1)
{
  sub_1AE64(a1);
  uint64_t result = (*(uint64_t (**)(void, void))(**(void **)(a1 + 16) + 136))(*(void *)(a1 + 16), *(void *)(a1 + 24));
  if (result)
  {
    float v3 = sub_89A0(0x18uLL);
    void *v3 = off_1AA280;
    v3[1] = 0;
    *((_DWORD *)v3 + 4) = 0;
    return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296))(a1);
  }
  return result;
}

void sub_20028(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
}

void sub_20048(uint64_t a1)
{
}

uint64_t sub_200D4(uint64_t a1, uint64_t a2)
{
  int v4 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 24))(*(void *)(a1 + 16));
  uint64_t v5 = **(void **)(a1 + 24);
  if (v4)
  {
    uint64_t v6 = (*(uint64_t (**)(void))(v5 + 8))();
    if (v6)
    {
      (***(void (****)(void))(a1 + 16))(*(void *)(a1 + 16));
      if ((int)a2 >= 1)
      {
        uint64_t v8 = 0;
        do
        {
          if (v7 <= *(float *)(v6 + v8)) {
            float v9 = 0.0;
          }
          else {
            float v9 = 1.0;
          }
          *(float *)(v6 + v8) = v9;
          v8 += 4;
        }
        while (4 * a2 != v8);
      }
    }
    return v6;
  }
  if ((*(unsigned int (**)(void))(v5 + 24))())
  {
    uint64_t v6 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16), a2);
    if (v6)
    {
      (***(void (****)(void))(a1 + 24))(*(void *)(a1 + 24));
      if ((int)a2 >= 1)
      {
        uint64_t v11 = 0;
        do
        {
          if (*(float *)(v6 + v11) <= v10) {
            float v12 = 0.0;
          }
          else {
            float v12 = 1.0;
          }
          *(float *)(v6 + v11) = v12;
          v11 += 4;
        }
        while (4 * a2 != v11);
      }
    }
    return v6;
  }
  uint64_t v13 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 8))(*(void *)(a1 + 24), a2);
  uint64_t v14 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16), a2);
  if (v14) {
    BOOL v15 = v13 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (!v15)
  {
    if ((int)a2 >= 1)
    {
      uint64_t v16 = 0;
      do
      {
        if (*(float *)(v14 + v16) <= *(float *)(v13 + v16)) {
          float v17 = 0.0;
        }
        else {
          float v17 = 1.0;
        }
        *(float *)(v14 + v16) = v17;
        v16 += 4;
      }
      while (4 * a2 != v16);
    }
    goto LABEL_34;
  }
  if (v14) {
    operator delete[]();
  }
  uint64_t v6 = 0;
  if (v13) {
LABEL_34:
  }
    operator delete[]();
  return v6;
}

uint64_t sub_20370(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 24))(*(void *)(a1 + 16));
  uint64_t v7 = **(void **)(a1 + 24);
  if (v6)
  {
    uint64_t v8 = (*(uint64_t (**)(void))(v7 + 16))();
    if (v8)
    {
      (***(void (****)(void))(a1 + 16))(*(void *)(a1 + 16));
      if ((int)a3 >= 1)
      {
        uint64_t v10 = 0;
        do
        {
          if (!*(unsigned char *)(a2 + v10))
          {
            if (v9 <= *(float *)(v8 + 4 * v10)) {
              float v11 = 0.0;
            }
            else {
              float v11 = 1.0;
            }
            *(float *)(v8 + 4 * v10) = v11;
          }
          ++v10;
        }
        while (a3 != v10);
      }
    }
    return v8;
  }
  if ((*(unsigned int (**)(void))(v7 + 24))())
  {
    uint64_t v8 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16), a2, a3);
    if (v8)
    {
      (***(void (****)(void))(a1 + 24))(*(void *)(a1 + 24));
      if ((int)a3 >= 1)
      {
        uint64_t v13 = 0;
        do
        {
          if (!*(unsigned char *)(a2 + v13))
          {
            if (*(float *)(v8 + 4 * v13) <= v12) {
              float v14 = 0.0;
            }
            else {
              float v14 = 1.0;
            }
            *(float *)(v8 + 4 * v13) = v14;
          }
          ++v13;
        }
        while (a3 != v13);
      }
    }
    return v8;
  }
  uint64_t v15 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 24) + 16))(*(void *)(a1 + 24), a2, a3);
  uint64_t v16 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16), a2, a3);
  if (v16) {
    BOOL v17 = v15 == 0;
  }
  else {
    BOOL v17 = 1;
  }
  if (!v17)
  {
    if ((int)a3 >= 1)
    {
      uint64_t v18 = 0;
      do
      {
        if (!*(unsigned char *)(a2 + v18))
        {
          if (*(float *)(v16 + 4 * v18) <= *(float *)(v15 + 4 * v18)) {
            float v19 = 0.0;
          }
          else {
            float v19 = 1.0;
          }
          *(float *)(v16 + 4 * v18) = v19;
        }
        ++v18;
      }
      while (a3 != v18);
    }
    goto LABEL_40;
  }
  if (v16) {
    operator delete[]();
  }
  uint64_t v8 = 0;
  if (v15) {
LABEL_40:
  }
    operator delete[]();
  return v8;
}

uint64_t sub_20640()
{
  return 10;
}

uint64_t sub_20648(uint64_t a1)
{
  sub_1AE64(a1);
  uint64_t result = (*(uint64_t (**)(void, void))(**(void **)(a1 + 16) + 136))(*(void *)(a1 + 16), *(void *)(a1 + 24));
  if (result)
  {
    float v3 = sub_89A0(0x18uLL);
    void *v3 = off_1AA280;
    v3[1] = 0;
    *((_DWORD *)v3 + 4) = 0;
    return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296))(a1);
  }
  return result;
}

void sub_206F4(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
}

void sub_20714(uint64_t a1)
{
}

uint64_t sub_207A0(uint64_t a1, uint64_t a2)
{
  int v4 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 24))(*(void *)(a1 + 16));
  uint64_t v5 = **(void **)(a1 + 24);
  if (v4)
  {
    uint64_t v6 = (*(uint64_t (**)(void))(v5 + 8))();
    if (v6)
    {
      (***(void (****)(void))(a1 + 16))(*(void *)(a1 + 16));
      if ((int)a2 >= 1)
      {
        uint64_t v8 = 0;
        do
        {
          if (v7 == *(float *)(v6 + v8)) {
            float v9 = 1.0;
          }
          else {
            float v9 = 0.0;
          }
          *(float *)(v6 + v8) = v9;
          v8 += 4;
        }
        while (4 * a2 != v8);
      }
    }
    return v6;
  }
  if ((*(unsigned int (**)(void))(v5 + 24))())
  {
    uint64_t v6 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16), a2);
    if (v6)
    {
      (***(void (****)(void))(a1 + 24))(*(void *)(a1 + 24));
      if ((int)a2 >= 1)
      {
        uint64_t v11 = 0;
        do
        {
          if (*(float *)(v6 + v11) == v10) {
            float v12 = 1.0;
          }
          else {
            float v12 = 0.0;
          }
          *(float *)(v6 + v11) = v12;
          v11 += 4;
        }
        while (4 * a2 != v11);
      }
    }
    return v6;
  }
  uint64_t v13 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 8))(*(void *)(a1 + 24), a2);
  uint64_t v14 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16), a2);
  if (v14) {
    BOOL v15 = v13 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (!v15)
  {
    if ((int)a2 >= 1)
    {
      uint64_t v16 = 0;
      do
      {
        if (*(float *)(v14 + v16) == *(float *)(v13 + v16)) {
          float v17 = 1.0;
        }
        else {
          float v17 = 0.0;
        }
        *(float *)(v14 + v16) = v17;
        v16 += 4;
      }
      while (4 * a2 != v16);
    }
    goto LABEL_34;
  }
  if (v14) {
    operator delete[]();
  }
  uint64_t v6 = 0;
  if (v13) {
LABEL_34:
  }
    operator delete[]();
  return v6;
}

uint64_t sub_20A3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 24))(*(void *)(a1 + 16));
  uint64_t v7 = **(void **)(a1 + 24);
  if (v6)
  {
    uint64_t v8 = (*(uint64_t (**)(void))(v7 + 16))();
    if (v8)
    {
      (***(void (****)(void))(a1 + 16))(*(void *)(a1 + 16));
      if ((int)a3 >= 1)
      {
        uint64_t v10 = 0;
        do
        {
          if (!*(unsigned char *)(a2 + v10))
          {
            if (v9 == *(float *)(v8 + 4 * v10)) {
              float v11 = 1.0;
            }
            else {
              float v11 = 0.0;
            }
            *(float *)(v8 + 4 * v10) = v11;
          }
          ++v10;
        }
        while (a3 != v10);
      }
    }
    return v8;
  }
  if ((*(unsigned int (**)(void))(v7 + 24))())
  {
    uint64_t v8 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16), a2, a3);
    if (v8)
    {
      (***(void (****)(void))(a1 + 24))(*(void *)(a1 + 24));
      if ((int)a3 >= 1)
      {
        uint64_t v13 = 0;
        do
        {
          if (!*(unsigned char *)(a2 + v13))
          {
            if (*(float *)(v8 + 4 * v13) == v12) {
              float v14 = 1.0;
            }
            else {
              float v14 = 0.0;
            }
            *(float *)(v8 + 4 * v13) = v14;
          }
          ++v13;
        }
        while (a3 != v13);
      }
    }
    return v8;
  }
  uint64_t v15 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 24) + 16))(*(void *)(a1 + 24), a2, a3);
  uint64_t v16 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16), a2, a3);
  if (v16) {
    BOOL v17 = v15 == 0;
  }
  else {
    BOOL v17 = 1;
  }
  if (!v17)
  {
    if ((int)a3 >= 1)
    {
      uint64_t v18 = 0;
      do
      {
        if (!*(unsigned char *)(a2 + v18))
        {
          if (*(float *)(v16 + 4 * v18) == *(float *)(v15 + 4 * v18)) {
            float v19 = 1.0;
          }
          else {
            float v19 = 0.0;
          }
          *(float *)(v16 + 4 * v18) = v19;
        }
        ++v18;
      }
      while (a3 != v18);
    }
    goto LABEL_40;
  }
  if (v16) {
    operator delete[]();
  }
  uint64_t v8 = 0;
  if (v15) {
LABEL_40:
  }
    operator delete[]();
  return v8;
}

uint64_t sub_20D0C()
{
  return 11;
}

uint64_t sub_20D14(uint64_t a1)
{
  sub_1AE64(a1);
  uint64_t result = (*(uint64_t (**)(void, void))(**(void **)(a1 + 16) + 136))(*(void *)(a1 + 16), *(void *)(a1 + 24));
  if (result)
  {
    float v3 = sub_89A0(0x18uLL);
    void *v3 = off_1AA280;
    v3[1] = 0;
    *((_DWORD *)v3 + 4) = 1065353216;
    return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296))(a1);
  }
  return result;
}

void sub_20DC4(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
}

void sub_20DE4(uint64_t a1)
{
}

uint64_t sub_20E70(uint64_t a1, uint64_t a2)
{
  int v4 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 24))(*(void *)(a1 + 16));
  uint64_t v5 = **(void **)(a1 + 24);
  if (v4)
  {
    uint64_t v6 = (*(uint64_t (**)(void))(v5 + 8))();
    if (v6)
    {
      (***(void (****)(void))(a1 + 16))(*(void *)(a1 + 16));
      if ((int)a2 >= 1)
      {
        uint64_t v8 = 0;
        do
        {
          if (v7 == *(float *)(v6 + v8)) {
            float v9 = 0.0;
          }
          else {
            float v9 = 1.0;
          }
          *(float *)(v6 + v8) = v9;
          v8 += 4;
        }
        while (4 * a2 != v8);
      }
    }
    return v6;
  }
  if ((*(unsigned int (**)(void))(v5 + 24))())
  {
    uint64_t v6 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16), a2);
    if (v6)
    {
      (***(void (****)(void))(a1 + 24))(*(void *)(a1 + 24));
      if ((int)a2 >= 1)
      {
        uint64_t v11 = 0;
        do
        {
          if (*(float *)(v6 + v11) == v10) {
            float v12 = 0.0;
          }
          else {
            float v12 = 1.0;
          }
          *(float *)(v6 + v11) = v12;
          v11 += 4;
        }
        while (4 * a2 != v11);
      }
    }
    return v6;
  }
  uint64_t v13 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 8))(*(void *)(a1 + 24), a2);
  uint64_t v14 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16), a2);
  if (v14) {
    BOOL v15 = v13 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (!v15)
  {
    if ((int)a2 >= 1)
    {
      uint64_t v16 = 0;
      do
      {
        if (*(float *)(v14 + v16) == *(float *)(v13 + v16)) {
          float v17 = 0.0;
        }
        else {
          float v17 = 1.0;
        }
        *(float *)(v14 + v16) = v17;
        v16 += 4;
      }
      while (4 * a2 != v16);
    }
    goto LABEL_34;
  }
  if (v14) {
    operator delete[]();
  }
  uint64_t v6 = 0;
  if (v13) {
LABEL_34:
  }
    operator delete[]();
  return v6;
}

uint64_t sub_2110C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 24))(*(void *)(a1 + 16));
  uint64_t v7 = **(void **)(a1 + 24);
  if (v6)
  {
    uint64_t v8 = (*(uint64_t (**)(void))(v7 + 16))();
    if (v8)
    {
      (***(void (****)(void))(a1 + 16))(*(void *)(a1 + 16));
      if ((int)a3 >= 1)
      {
        uint64_t v10 = 0;
        do
        {
          if (!*(unsigned char *)(a2 + v10))
          {
            if (v9 == *(float *)(v8 + 4 * v10)) {
              float v11 = 0.0;
            }
            else {
              float v11 = 1.0;
            }
            *(float *)(v8 + 4 * v10) = v11;
          }
          ++v10;
        }
        while (a3 != v10);
      }
    }
    return v8;
  }
  if ((*(unsigned int (**)(void))(v7 + 24))())
  {
    uint64_t v8 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16), a2, a3);
    if (v8)
    {
      (***(void (****)(void))(a1 + 24))(*(void *)(a1 + 24));
      if ((int)a3 >= 1)
      {
        uint64_t v13 = 0;
        do
        {
          if (!*(unsigned char *)(a2 + v13))
          {
            if (*(float *)(v8 + 4 * v13) == v12) {
              float v14 = 0.0;
            }
            else {
              float v14 = 1.0;
            }
            *(float *)(v8 + 4 * v13) = v14;
          }
          ++v13;
        }
        while (a3 != v13);
      }
    }
    return v8;
  }
  uint64_t v15 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 24) + 16))(*(void *)(a1 + 24), a2, a3);
  uint64_t v16 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16), a2, a3);
  if (v16) {
    BOOL v17 = v15 == 0;
  }
  else {
    BOOL v17 = 1;
  }
  if (!v17)
  {
    if ((int)a3 >= 1)
    {
      uint64_t v18 = 0;
      do
      {
        if (!*(unsigned char *)(a2 + v18))
        {
          if (*(float *)(v16 + 4 * v18) == *(float *)(v15 + 4 * v18)) {
            float v19 = 0.0;
          }
          else {
            float v19 = 1.0;
          }
          *(float *)(v16 + 4 * v18) = v19;
        }
        ++v18;
      }
      while (a3 != v18);
    }
    goto LABEL_40;
  }
  if (v16) {
    operator delete[]();
  }
  uint64_t v8 = 0;
  if (v15) {
LABEL_40:
  }
    operator delete[]();
  return v8;
}

uint64_t sub_213DC()
{
  return 12;
}

uint64_t sub_213E4(uint64_t a1)
{
  sub_1AE64(a1);
  uint64_t result = (*(uint64_t (**)(void, void))(**(void **)(a1 + 16) + 136))(*(void *)(a1 + 16), *(void *)(a1 + 24));
  if (result)
  {
    float v3 = sub_89A0(0x18uLL);
    void *v3 = off_1AA280;
    v3[1] = 0;
    *((_DWORD *)v3 + 4) = 0;
    return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296))(a1);
  }
  return result;
}

void sub_21490(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
}

void sub_214B0(uint64_t a1)
{
}

uint64_t sub_2153C(uint64_t a1, uint64_t a2)
{
  int v4 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 24))(*(void *)(a1 + 16));
  uint64_t v5 = **(void **)(a1 + 24);
  if (v4)
  {
    uint64_t v6 = (*(uint64_t (**)(void))(v5 + 8))();
    if (v6)
    {
      (***(void (****)(void))(a1 + 16))(*(void *)(a1 + 16));
      if ((int)a2 >= 1)
      {
        uint64_t v8 = 0;
        do
        {
          if (v7 <= *(float *)(v6 + v8)) {
            float v9 = 1.0;
          }
          else {
            float v9 = 0.0;
          }
          *(float *)(v6 + v8) = v9;
          v8 += 4;
        }
        while (4 * a2 != v8);
      }
    }
    return v6;
  }
  if ((*(unsigned int (**)(void))(v5 + 24))())
  {
    uint64_t v6 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16), a2);
    if (v6)
    {
      (***(void (****)(void))(a1 + 24))(*(void *)(a1 + 24));
      if ((int)a2 >= 1)
      {
        uint64_t v11 = 0;
        do
        {
          if (*(float *)(v6 + v11) <= v10) {
            float v12 = 1.0;
          }
          else {
            float v12 = 0.0;
          }
          *(float *)(v6 + v11) = v12;
          v11 += 4;
        }
        while (4 * a2 != v11);
      }
    }
    return v6;
  }
  uint64_t v13 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 8))(*(void *)(a1 + 24), a2);
  uint64_t v14 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16), a2);
  if (v14) {
    BOOL v15 = v13 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (!v15)
  {
    if ((int)a2 >= 1)
    {
      uint64_t v16 = 0;
      do
      {
        if (*(float *)(v14 + v16) <= *(float *)(v13 + v16)) {
          float v17 = 1.0;
        }
        else {
          float v17 = 0.0;
        }
        *(float *)(v14 + v16) = v17;
        v16 += 4;
      }
      while (4 * a2 != v16);
    }
    goto LABEL_34;
  }
  if (v14) {
    operator delete[]();
  }
  uint64_t v6 = 0;
  if (v13) {
LABEL_34:
  }
    operator delete[]();
  return v6;
}

uint64_t sub_217D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 24))(*(void *)(a1 + 16));
  uint64_t v7 = **(void **)(a1 + 24);
  if (v6)
  {
    uint64_t v8 = (*(uint64_t (**)(void))(v7 + 16))();
    if (v8)
    {
      (***(void (****)(void))(a1 + 16))(*(void *)(a1 + 16));
      if ((int)a3 >= 1)
      {
        uint64_t v10 = 0;
        do
        {
          if (!*(unsigned char *)(a2 + v10))
          {
            if (v9 <= *(float *)(v8 + 4 * v10)) {
              float v11 = 1.0;
            }
            else {
              float v11 = 0.0;
            }
            *(float *)(v8 + 4 * v10) = v11;
          }
          ++v10;
        }
        while (a3 != v10);
      }
    }
    return v8;
  }
  if ((*(unsigned int (**)(void))(v7 + 24))())
  {
    uint64_t v8 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16), a2, a3);
    if (v8)
    {
      (***(void (****)(void))(a1 + 24))(*(void *)(a1 + 24));
      if ((int)a3 >= 1)
      {
        uint64_t v13 = 0;
        do
        {
          if (!*(unsigned char *)(a2 + v13))
          {
            if (*(float *)(v8 + 4 * v13) <= v12) {
              float v14 = 1.0;
            }
            else {
              float v14 = 0.0;
            }
            *(float *)(v8 + 4 * v13) = v14;
          }
          ++v13;
        }
        while (a3 != v13);
      }
    }
    return v8;
  }
  uint64_t v15 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 24) + 16))(*(void *)(a1 + 24), a2, a3);
  uint64_t v16 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16), a2, a3);
  if (v16) {
    BOOL v17 = v15 == 0;
  }
  else {
    BOOL v17 = 1;
  }
  if (!v17)
  {
    if ((int)a3 >= 1)
    {
      uint64_t v18 = 0;
      do
      {
        if (!*(unsigned char *)(a2 + v18))
        {
          if (*(float *)(v16 + 4 * v18) <= *(float *)(v15 + 4 * v18)) {
            float v19 = 1.0;
          }
          else {
            float v19 = 0.0;
          }
          *(float *)(v16 + 4 * v18) = v19;
        }
        ++v18;
      }
      while (a3 != v18);
    }
    goto LABEL_40;
  }
  if (v16) {
    operator delete[]();
  }
  uint64_t v8 = 0;
  if (v15) {
LABEL_40:
  }
    operator delete[]();
  return v8;
}

uint64_t sub_21AA8()
{
  return 13;
}

uint64_t sub_21AB0(uint64_t a1)
{
  sub_1AE64(a1);
  uint64_t result = (*(uint64_t (**)(void, void))(**(void **)(a1 + 16) + 136))(*(void *)(a1 + 16), *(void *)(a1 + 24));
  if (result)
  {
    float v3 = sub_89A0(0x18uLL);
    void *v3 = off_1AA280;
    v3[1] = 0;
    *((_DWORD *)v3 + 4) = 1065353216;
    return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296))(a1);
  }
  return result;
}

void sub_21B60(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
}

void sub_21B80(uint64_t a1)
{
}

uint64_t sub_21C0C(uint64_t a1, uint64_t a2)
{
  int v4 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 24))(*(void *)(a1 + 16));
  uint64_t v5 = **(void **)(a1 + 24);
  if (v4)
  {
    uint64_t v6 = (*(uint64_t (**)(void))(v5 + 8))();
    if (v6)
    {
      (***(void (****)(void))(a1 + 16))(*(void *)(a1 + 16));
      if ((int)a2 >= 1)
      {
        uint64_t v8 = 0;
        do
        {
          if (v7 >= *(float *)(v6 + v8)) {
            float v9 = 1.0;
          }
          else {
            float v9 = 0.0;
          }
          *(float *)(v6 + v8) = v9;
          v8 += 4;
        }
        while (4 * a2 != v8);
      }
    }
    return v6;
  }
  if ((*(unsigned int (**)(void))(v5 + 24))())
  {
    uint64_t v6 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16), a2);
    if (v6)
    {
      (***(void (****)(void))(a1 + 24))(*(void *)(a1 + 24));
      if ((int)a2 >= 1)
      {
        uint64_t v11 = 0;
        do
        {
          if (*(float *)(v6 + v11) >= v10) {
            float v12 = 1.0;
          }
          else {
            float v12 = 0.0;
          }
          *(float *)(v6 + v11) = v12;
          v11 += 4;
        }
        while (4 * a2 != v11);
      }
    }
    return v6;
  }
  uint64_t v13 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 8))(*(void *)(a1 + 24), a2);
  uint64_t v14 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16), a2);
  if (v14) {
    BOOL v15 = v13 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (!v15)
  {
    if ((int)a2 >= 1)
    {
      uint64_t v16 = 0;
      do
      {
        if (*(float *)(v14 + v16) >= *(float *)(v13 + v16)) {
          float v17 = 1.0;
        }
        else {
          float v17 = 0.0;
        }
        *(float *)(v14 + v16) = v17;
        v16 += 4;
      }
      while (4 * a2 != v16);
    }
    goto LABEL_34;
  }
  if (v14) {
    operator delete[]();
  }
  uint64_t v6 = 0;
  if (v13) {
LABEL_34:
  }
    operator delete[]();
  return v6;
}

uint64_t sub_21EA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 24))(*(void *)(a1 + 16));
  uint64_t v7 = **(void **)(a1 + 24);
  if (v6)
  {
    uint64_t v8 = (*(uint64_t (**)(void))(v7 + 16))();
    if (v8)
    {
      (***(void (****)(void))(a1 + 16))(*(void *)(a1 + 16));
      if ((int)a3 >= 1)
      {
        uint64_t v10 = 0;
        do
        {
          if (!*(unsigned char *)(a2 + v10))
          {
            if (v9 >= *(float *)(v8 + 4 * v10)) {
              float v11 = 1.0;
            }
            else {
              float v11 = 0.0;
            }
            *(float *)(v8 + 4 * v10) = v11;
          }
          ++v10;
        }
        while (a3 != v10);
      }
    }
    return v8;
  }
  if ((*(unsigned int (**)(void))(v7 + 24))())
  {
    uint64_t v8 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16), a2, a3);
    if (v8)
    {
      (***(void (****)(void))(a1 + 24))(*(void *)(a1 + 24));
      if ((int)a3 >= 1)
      {
        uint64_t v13 = 0;
        do
        {
          if (!*(unsigned char *)(a2 + v13))
          {
            if (*(float *)(v8 + 4 * v13) >= v12) {
              float v14 = 1.0;
            }
            else {
              float v14 = 0.0;
            }
            *(float *)(v8 + 4 * v13) = v14;
          }
          ++v13;
        }
        while (a3 != v13);
      }
    }
    return v8;
  }
  uint64_t v15 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 24) + 16))(*(void *)(a1 + 24), a2, a3);
  uint64_t v16 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16), a2, a3);
  if (v16) {
    BOOL v17 = v15 == 0;
  }
  else {
    BOOL v17 = 1;
  }
  if (!v17)
  {
    if ((int)a3 >= 1)
    {
      uint64_t v18 = 0;
      do
      {
        if (!*(unsigned char *)(a2 + v18))
        {
          if (*(float *)(v16 + 4 * v18) >= *(float *)(v15 + 4 * v18)) {
            float v19 = 1.0;
          }
          else {
            float v19 = 0.0;
          }
          *(float *)(v16 + 4 * v18) = v19;
        }
        ++v18;
      }
      while (a3 != v18);
    }
    goto LABEL_40;
  }
  if (v16) {
    operator delete[]();
  }
  uint64_t v8 = 0;
  if (v15) {
LABEL_40:
  }
    operator delete[]();
  return v8;
}

uint64_t sub_22178()
{
  return 14;
}

uint64_t sub_22180(uint64_t a1)
{
  sub_1AE64(a1);
  uint64_t result = (*(uint64_t (**)(void, void))(**(void **)(a1 + 16) + 136))(*(void *)(a1 + 16), *(void *)(a1 + 24));
  if (result)
  {
    float v3 = sub_89A0(0x18uLL);
    void *v3 = off_1AA280;
    v3[1] = 0;
    *((_DWORD *)v3 + 4) = 1065353216;
    return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 296))(a1);
  }
  return result;
}

void sub_22230(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
}

double sub_22250(uint64_t a1)
{
  if ((***(float (****)(void))(a1 + 16))(*(void *)(a1 + 16)) == 0.0) {
    return 0.0;
  }
  float v2 = (***(float (****)(void))(a1 + 24))(*(void *)(a1 + 24));
  LODWORD(result) = 1.0;
  if (v2 == 0.0) {
    return 0.0;
  }
  return result;
}

char *sub_222DC(uint64_t a1, uint64_t a2)
{
  int v4 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 24))(*(void *)(a1 + 16));
  uint64_t v5 = **(void **)(a1 + 24);
  if (v4)
  {
    int v6 = (char *)(*(uint64_t (**)(void))(v5 + 8))();
    if (!v6) {
      return v6;
    }
    if ((***(float (****)(void))(a1 + 16))(*(void *)(a1 + 16)) != 0.0)
    {
      if ((int)a2 >= 1)
      {
        uint64_t v7 = 0;
        do
        {
          if (*(float *)&v6[v7] == 0.0) {
            float v8 = 0.0;
          }
          else {
            float v8 = 1.0;
          }
          *(float *)&v6[v7] = v8;
          v7 += 4;
        }
        while (4 * a2 != v7);
      }
      return v6;
    }
    goto LABEL_14;
  }
  if ((*(unsigned int (**)(void))(v5 + 24))())
  {
    int v6 = (char *)(*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16), a2);
    if (!v6) {
      return v6;
    }
    if ((***(float (****)(void))(a1 + 24))(*(void *)(a1 + 24)) == 0.0)
    {
LABEL_14:
      if ((int)a2 >= 1) {
        bzero(v6, 4 * a2);
      }
      return v6;
    }
    if ((int)a2 >= 1)
    {
      uint64_t v16 = 0;
      do
      {
        if (*(float *)&v6[v16] == 0.0) {
          float v17 = 0.0;
        }
        else {
          float v17 = 1.0;
        }
        *(float *)&v6[v16] = v17;
        v16 += 4;
      }
      while (4 * a2 != v16);
    }
  }
  else
  {
    uint64_t v9 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 8))(*(void *)(a1 + 24), a2);
    uint64_t v10 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16), a2);
    if (v10) {
      BOOL v11 = v9 == 0;
    }
    else {
      BOOL v11 = 1;
    }
    if (!v11)
    {
      if ((int)a2 >= 1)
      {
        uint64_t v12 = a2;
        uint64_t v13 = (float *)v10;
        float v14 = (float *)v9;
        do
        {
          if (*v13 == 0.0 || (float v15 = 1.0, *v14 == 0.0)) {
            float v15 = 0.0;
          }
          *v13++ = v15;
          ++v14;
          --v12;
        }
        while (v12);
      }
      operator delete[]();
    }
    if (v10) {
      operator delete[]();
    }
    if (v9) {
      operator delete[]();
    }
    return 0;
  }
  return v6;
}

uint64_t sub_225BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 24))(*(void *)(a1 + 16));
  uint64_t v7 = **(void **)(a1 + 24);
  if (v6)
  {
    uint64_t v8 = (*(uint64_t (**)(void))(v7 + 16))();
    if (v8)
    {
      if ((***(float (****)(void))(a1 + 16))(*(void *)(a1 + 16)) == 0.0)
      {
        if ((int)a3 >= 1)
        {
          uint64_t v9 = 0;
          do
          {
            if (!*(unsigned char *)(a2 + v9)) {
              *(_DWORD *)(v8 + 4 * v9) = 0;
            }
            ++v9;
          }
          while (a3 != v9);
        }
      }
      else if ((int)a3 >= 1)
      {
        uint64_t v11 = 0;
        do
        {
          if (!*(unsigned char *)(a2 + v11))
          {
            if (*(float *)(v8 + 4 * v11) == 0.0) {
              float v12 = 0.0;
            }
            else {
              float v12 = 1.0;
            }
            *(float *)(v8 + 4 * v11) = v12;
          }
          ++v11;
        }
        while (a3 != v11);
      }
    }
    return v8;
  }
  if ((*(unsigned int (**)(void))(v7 + 24))())
  {
    uint64_t v8 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16), a2, a3);
    if (v8)
    {
      if ((***(float (****)(void))(a1 + 24))(*(void *)(a1 + 24)) == 0.0)
      {
        if ((int)a3 >= 1)
        {
          uint64_t v10 = 0;
          do
          {
            if (!*(unsigned char *)(a2 + v10)) {
              *(_DWORD *)(v8 + 4 * v10) = 0;
            }
            ++v10;
          }
          while (a3 != v10);
        }
      }
      else if ((int)a3 >= 1)
      {
        uint64_t v18 = 0;
        do
        {
          if (!*(unsigned char *)(a2 + v18))
          {
            if (*(float *)(v8 + 4 * v18) == 0.0) {
              float v19 = 0.0;
            }
            else {
              float v19 = 1.0;
            }
            *(float *)(v8 + 4 * v18) = v19;
          }
          ++v18;
        }
        while (a3 != v18);
      }
    }
    return v8;
  }
  uint64_t v13 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 24) + 16))(*(void *)(a1 + 24), a2, a3);
  uint64_t v14 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16), a2, a3);
  if (v14) {
    BOOL v15 = v13 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (!v15)
  {
    if ((int)a3 >= 1)
    {
      uint64_t v16 = 0;
      do
      {
        if (!*(unsigned char *)(a2 + v16))
        {
          if (*(float *)(v14 + 4 * v16) == 0.0 || (float v17 = 1.0, *(float *)(v13 + 4 * v16) == 0.0)) {
            float v17 = 0.0;
          }
          *(float *)(v14 + 4 * v16) = v17;
        }
        ++v16;
      }
      while (a3 != v16);
    }
    goto LABEL_45;
  }
  if (v14) {
    operator delete[]();
  }
  uint64_t v8 = 0;
  if (v13) {
LABEL_45:
  }
    operator delete[]();
  return v8;
}

uint64_t sub_228FC()
{
  return 15;
}

uint64_t sub_22904(uint64_t a1)
{
  if ((*(unsigned int (**)(void))(**(void **)(a1 + 16) + 40))(*(void *)(a1 + 16))
    && (***(float (****)(void))(a1 + 16))(*(void *)(a1 + 16)) == 0.0
    || (*(unsigned int (**)(void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24))
    && (***(float (****)(void))(a1 + 24))(*(void *)(a1 + 24)) == 0.0)
  {
    return 1;
  }
  return sub_1C434(a1);
}

void sub_22A00(uint64_t a1)
{
  sub_1AE64(a1);
  if ((*(unsigned int (**)(void))(**(void **)(a1 + 16) + 40))(*(void *)(a1 + 16)))
  {
    if ((***(float (****)(void))(a1 + 16))(*(void *)(a1 + 16)) == 0.0)
    {
      float v2 = sub_89A0(0x18uLL);
      *float v2 = off_1AA280;
      v2[1] = 0;
      *((_DWORD *)v2 + 4) = 0;
    }
    else
    {
      if (!(*(unsigned int (**)(void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24))) {
        return;
      }
      float v2 = sub_89A0(0x18uLL);
      float v4 = (**(float (***)(uint64_t))a1)(a1);
      *float v2 = off_1AA280;
      v2[1] = 0;
      *((float *)v2 + 4) = v4;
    }
    (*(void (**)(uint64_t, void *))(*(void *)a1 + 296))(a1, v2);
  }
  else if ((*(unsigned int (**)(void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24)))
  {
    if ((***(float (****)(void))(a1 + 24))(*(void *)(a1 + 24)) == 0.0)
    {
      float v3 = sub_89A0(0x18uLL);
      void *v3 = off_1AA280;
      v3[1] = 0;
      *((_DWORD *)v3 + 4) = 0;
      (*(void (**)(uint64_t))(*(void *)a1 + 296))(a1);
    }
  }
}

void sub_22C30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  if (v14) {
    free(v14);
  }
  if (a2 != 1) {
    _Unwind_Resume(a1);
  }
  __cxa_begin_catch(a1);
  __cxa_end_catch();
}

float sub_22C94(uint64_t a1)
{
  float v2 = 1.0;
  if ((***(float (****)(void))(a1 + 16))(*(void *)(a1 + 16)) == 0.0
    && (***(float (****)(void))(a1 + 24))(*(void *)(a1 + 24)) == 0.0)
  {
    return 0.0;
  }
  return v2;
}

char *sub_22D28(uint64_t a1, uint64_t a2)
{
  int v4 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 24))(*(void *)(a1 + 16));
  uint64_t v5 = **(void **)(a1 + 24);
  if (v4)
  {
    int v6 = (char *)(*(uint64_t (**)(void))(v5 + 8))();
    if (!v6) {
      return v6;
    }
    if ((***(float (****)(void))(a1 + 16))(*(void *)(a1 + 16)) == 0.0)
    {
      if ((int)a2 >= 1)
      {
        uint64_t v7 = 0;
        do
        {
          if (*(float *)&v6[v7] == 0.0) {
            float v8 = 0.0;
          }
          else {
            float v8 = 1.0;
          }
          *(float *)&v6[v7] = v8;
          v7 += 4;
        }
        while (4 * a2 != v7);
      }
      return v6;
    }
    goto LABEL_14;
  }
  if ((*(unsigned int (**)(void))(v5 + 24))())
  {
    int v6 = (char *)(*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16), a2);
    if (!v6) {
      return v6;
    }
    if ((***(float (****)(void))(a1 + 24))(*(void *)(a1 + 24)) != 0.0)
    {
LABEL_14:
      if ((int)a2 >= 1) {
        memset_pattern16(v6, &unk_164F20, 4 * a2);
      }
      return v6;
    }
    if ((int)a2 >= 1)
    {
      uint64_t v16 = 0;
      do
      {
        if (*(float *)&v6[v16] == 0.0) {
          float v17 = 0.0;
        }
        else {
          float v17 = 1.0;
        }
        *(float *)&v6[v16] = v17;
        v16 += 4;
      }
      while (4 * a2 != v16);
    }
  }
  else
  {
    uint64_t v9 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 8))(*(void *)(a1 + 24), a2);
    uint64_t v10 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16), a2);
    if (v10) {
      BOOL v11 = v9 == 0;
    }
    else {
      BOOL v11 = 1;
    }
    if (!v11)
    {
      if ((int)a2 >= 1)
      {
        uint64_t v12 = a2;
        uint64_t v13 = (float *)v10;
        uint64_t v14 = (float *)v9;
        do
        {
          float v15 = 1.0;
          if (*v13 == 0.0 && *v14 == 0.0) {
            float v15 = 0.0;
          }
          *v13++ = v15;
          ++v14;
          --v12;
        }
        while (v12);
      }
      operator delete[]();
    }
    if (v10) {
      operator delete[]();
    }
    if (v9) {
      operator delete[]();
    }
    return 0;
  }
  return v6;
}

uint64_t sub_23010(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 24))(*(void *)(a1 + 16));
  uint64_t v7 = **(void **)(a1 + 24);
  if (v6)
  {
    uint64_t v8 = (*(uint64_t (**)(void))(v7 + 16))();
    if (v8)
    {
      if ((***(float (****)(void))(a1 + 16))(*(void *)(a1 + 16)) == 0.0)
      {
        if ((int)a3 >= 1)
        {
          uint64_t v11 = 0;
          do
          {
            if (!*(unsigned char *)(a2 + v11))
            {
              if (*(float *)(v8 + 4 * v11) == 0.0) {
                float v12 = 0.0;
              }
              else {
                float v12 = 1.0;
              }
              *(float *)(v8 + 4 * v11) = v12;
            }
            ++v11;
          }
          while (a3 != v11);
        }
      }
      else if ((int)a3 >= 1)
      {
        uint64_t v9 = 0;
        do
        {
          if (!*(unsigned char *)(a2 + v9)) {
            *(_DWORD *)(v8 + 4 * v9) = 1065353216;
          }
          ++v9;
        }
        while (a3 != v9);
      }
    }
    return v8;
  }
  if ((*(unsigned int (**)(void))(v7 + 24))())
  {
    uint64_t v8 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16), a2, a3);
    if (v8)
    {
      if ((***(float (****)(void))(a1 + 24))(*(void *)(a1 + 24)) == 0.0)
      {
        if ((int)a3 >= 1)
        {
          uint64_t v18 = 0;
          do
          {
            if (!*(unsigned char *)(a2 + v18))
            {
              if (*(float *)(v8 + 4 * v18) == 0.0) {
                float v19 = 0.0;
              }
              else {
                float v19 = 1.0;
              }
              *(float *)(v8 + 4 * v18) = v19;
            }
            ++v18;
          }
          while (a3 != v18);
        }
      }
      else if ((int)a3 >= 1)
      {
        uint64_t v10 = 0;
        do
        {
          if (!*(unsigned char *)(a2 + v10)) {
            *(_DWORD *)(v8 + 4 * v10) = 1065353216;
          }
          ++v10;
        }
        while (a3 != v10);
      }
    }
    return v8;
  }
  uint64_t v13 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 24) + 16))(*(void *)(a1 + 24), a2, a3);
  uint64_t v14 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16), a2, a3);
  if (v14) {
    BOOL v15 = v13 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (!v15)
  {
    if ((int)a3 >= 1)
    {
      uint64_t v16 = 0;
      do
      {
        if (!*(unsigned char *)(a2 + v16))
        {
          float v17 = 1.0;
          if (*(float *)(v14 + 4 * v16) == 0.0 && *(float *)(v13 + 4 * v16) == 0.0) {
            float v17 = 0.0;
          }
          *(float *)(v14 + 4 * v16) = v17;
        }
        ++v16;
      }
      while (a3 != v16);
    }
    goto LABEL_45;
  }
  if (v14) {
    operator delete[]();
  }
  uint64_t v8 = 0;
  if (v13) {
LABEL_45:
  }
    operator delete[]();
  return v8;
}

uint64_t sub_23358()
{
  return 16;
}

uint64_t sub_23360(uint64_t a1)
{
  if ((*(unsigned int (**)(void))(**(void **)(a1 + 16) + 40))(*(void *)(a1 + 16))
    && (***(float (****)(void))(a1 + 16))(*(void *)(a1 + 16)) != 0.0
    || (*(unsigned int (**)(void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24))
    && (***(float (****)(void))(a1 + 24))(*(void *)(a1 + 24)) != 0.0)
  {
    return 1;
  }
  return sub_1C434(a1);
}

void sub_2345C(uint64_t a1)
{
  sub_1AE64(a1);
  if ((*(unsigned int (**)(void))(**(void **)(a1 + 16) + 40))(*(void *)(a1 + 16)))
  {
    if ((***(float (****)(void))(a1 + 16))(*(void *)(a1 + 16)) != 0.0) {
      goto LABEL_9;
    }
    if (!(*(unsigned int (**)(void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24))) {
      return;
    }
    if ((***(float (****)(void))(a1 + 24))(*(void *)(a1 + 24)) == 0.0)
    {
      float v2 = (float *)sub_89A0(0x18uLL);
      float v3 = 0.0;
    }
    else
    {
LABEL_9:
      float v2 = (float *)sub_89A0(0x18uLL);
      float v3 = 1.0;
    }
    *(void *)float v2 = off_1AA280;
    *((void *)v2 + 1) = 0;
    v2[4] = v3;
    (*(void (**)(uint64_t))(*(void *)a1 + 296))(a1);
  }
  else if ((*(unsigned int (**)(void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24)))
  {
    if ((***(float (****)(void))(a1 + 24))(*(void *)(a1 + 24)) != 0.0)
    {
      int v4 = sub_89A0(0x18uLL);
      *int v4 = off_1AA280;
      v4[1] = 0;
      *((_DWORD *)v4 + 4) = 1065353216;
      (*(void (**)(uint64_t))(*(void *)a1 + 296))(a1);
    }
  }
}

void sub_2366C(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
}

float sub_23690(uint64_t a1)
{
  uint64_t v2 = (uint64_t)(***(float (****)(void))(a1 + 16))(*(void *)(a1 + 16));
  return (float)((uint64_t)(***(float (****)(void))(a1 + 24))(*(void *)(a1 + 24)) & (unint64_t)v2);
}

uint64_t sub_23710(uint64_t a1, uint64_t a2)
{
  int v4 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 24))(*(void *)(a1 + 16));
  uint64_t v5 = **(void **)(a1 + 24);
  if (v4)
  {
    uint64_t v6 = (*(uint64_t (**)(void))(v5 + 8))();
    if (v6)
    {
      (***(void (****)(void))(a1 + 16))(*(void *)(a1 + 16));
      if ((int)a2 >= 1)
      {
        uint64_t v8 = 0;
        do
        {
          *(float *)(v6 + v8) = (float)((uint64_t)*(float *)(v6 + v8) & (unint64_t)(uint64_t)v7);
          v8 += 4;
        }
        while (4 * a2 != v8);
      }
    }
    return v6;
  }
  if ((*(unsigned int (**)(void))(v5 + 24))())
  {
    uint64_t v6 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16), a2);
    if (v6)
    {
      (***(void (****)(void))(a1 + 24))(*(void *)(a1 + 24));
      if ((int)a2 >= 1)
      {
        uint64_t v10 = 0;
        do
        {
          *(float *)(v6 + v10) = (float)((uint64_t)*(float *)(v6 + v10) & (unint64_t)(uint64_t)v9);
          v10 += 4;
        }
        while (4 * a2 != v10);
      }
    }
    return v6;
  }
  uint64_t v11 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 8))(*(void *)(a1 + 24), a2);
  uint64_t v12 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16), a2);
  if (v12) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13)
  {
    if ((int)a2 >= 1)
    {
      uint64_t v14 = 0;
      do
      {
        *(float *)(v12 + v14) = (float)((uint64_t)*(float *)(v11 + v14) & (unint64_t)(uint64_t)*(float *)(v12 + v14));
        v14 += 4;
      }
      while (4 * a2 != v14);
    }
    goto LABEL_25;
  }
  if (v12) {
    operator delete[]();
  }
  uint64_t v6 = 0;
  if (v11) {
LABEL_25:
  }
    operator delete[]();
  return v6;
}

uint64_t sub_239AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 24))(*(void *)(a1 + 16));
  uint64_t v7 = **(void **)(a1 + 24);
  if (v6)
  {
    uint64_t v8 = (*(uint64_t (**)(void))(v7 + 16))();
    if (v8)
    {
      (***(void (****)(void))(a1 + 16))(*(void *)(a1 + 16));
      if ((int)a3 >= 1)
      {
        uint64_t v10 = 0;
        do
        {
          if (!*(unsigned char *)(a2 + v10)) {
            *(float *)(v8 + 4 * v10) = (float)((uint64_t)*(float *)(v8 + 4 * v10) & (unint64_t)(uint64_t)v9);
          }
          ++v10;
        }
        while (a3 != v10);
      }
    }
    return v8;
  }
  if ((*(unsigned int (**)(void))(v7 + 24))())
  {
    uint64_t v8 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16), a2, a3);
    if (v8)
    {
      (***(void (****)(void))(a1 + 24))(*(void *)(a1 + 24));
      if ((int)a3 >= 1)
      {
        uint64_t v12 = 0;
        do
        {
          if (!*(unsigned char *)(a2 + v12)) {
            *(float *)(v8 + 4 * v12) = (float)((uint64_t)*(float *)(v8 + 4 * v12) & (unint64_t)(uint64_t)v11);
          }
          ++v12;
        }
        while (a3 != v12);
      }
    }
    return v8;
  }
  uint64_t v13 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 24) + 16))(*(void *)(a1 + 24), a2, a3);
  uint64_t v14 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16), a2, a3);
  if (v14) {
    BOOL v15 = v13 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (!v15)
  {
    if ((int)a3 >= 1)
    {
      uint64_t v16 = 0;
      do
      {
        if (!*(unsigned char *)(a2 + v16)) {
          *(float *)(v14 + 4 * v16) = (float)((uint64_t)*(float *)(v13 + 4 * v16) & (unint64_t)(uint64_t)*(float *)(v14 + 4 * v16));
        }
        ++v16;
      }
      while (a3 != v16);
    }
    goto LABEL_31;
  }
  if (v14) {
    operator delete[]();
  }
  uint64_t v8 = 0;
  if (v13) {
LABEL_31:
  }
    operator delete[]();
  return v8;
}

uint64_t sub_23C7C()
{
  return 18;
}

uint64_t sub_23C84(uint64_t a1)
{
  if ((*(unsigned int (**)(void))(**(void **)(a1 + 16) + 40))(*(void *)(a1 + 16))
    && (***(float (****)(void))(a1 + 16))(*(void *)(a1 + 16)) == 0.0
    || (*(unsigned int (**)(void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24))
    && (***(float (****)(void))(a1 + 24))(*(void *)(a1 + 24)) == 0.0)
  {
    return 1;
  }
  return sub_1C434(a1);
}

void sub_23D80(uint64_t a1)
{
  sub_1AE64(a1);
  uint64_t v2 = (void *)(a1 + 16);
  uint64_t v3 = a1 + 24;
  if ((*(unsigned int (**)(void, void))(**(void **)(a1 + 16) + 136))(*(void *)(a1 + 16), *(void *)(a1 + 24)))
  {
    goto LABEL_2;
  }
  if ((*(unsigned int (**)(void))(*(void *)*v2 + 40))() && (**(float (***)(void))*v2)() == 0.0
    || (*(unsigned int (**)(void))(**(void **)v3 + 40))() && (***(float (****)(void))v3)() == 0.0)
  {
    int v4 = sub_89A0(0x18uLL);
    *int v4 = off_1AA280;
    v4[1] = 0;
    *((_DWORD *)v4 + 4) = 0;
    (*(void (**)(uint64_t))(*(void *)a1 + 296))(a1);
  }
  else
  {
    if ((*(unsigned int (**)(void))(*(void *)*v2 + 40))() && (**(float (***)(void))*v2)() == -1.0)
    {
LABEL_2:
      uint64_t v2 = (void *)(a1 + 24);
LABEL_3:
      (*(void (**)(uint64_t, void))(*(void *)a1 + 296))(a1, *v2);
      return;
    }
    if ((*(unsigned int (**)(void))(**(void **)v3 + 40))() && (***(float (****)(void))v3)() == -1.0) {
      goto LABEL_3;
    }
  }
}

void sub_23FF8(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
}

float sub_2401C(uint64_t a1)
{
  uint64_t v2 = (uint64_t)(***(float (****)(void))(a1 + 16))(*(void *)(a1 + 16));
  return (float)((uint64_t)(***(float (****)(void))(a1 + 24))(*(void *)(a1 + 24)) | v2);
}

uint64_t sub_2409C(uint64_t a1, uint64_t a2)
{
  int v4 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 24))(*(void *)(a1 + 16));
  uint64_t v5 = **(void **)(a1 + 24);
  if (v4)
  {
    uint64_t v6 = (*(uint64_t (**)(void))(v5 + 8))();
    if (v6)
    {
      (***(void (****)(void))(a1 + 16))(*(void *)(a1 + 16));
      if ((int)a2 >= 1)
      {
        uint64_t v8 = 0;
        do
        {
          *(float *)(v6 + v8) = (float)((uint64_t)*(float *)(v6 + v8) | (unint64_t)(uint64_t)v7);
          v8 += 4;
        }
        while (4 * a2 != v8);
      }
    }
    return v6;
  }
  if ((*(unsigned int (**)(void))(v5 + 24))())
  {
    uint64_t v6 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16), a2);
    if (v6)
    {
      (***(void (****)(void))(a1 + 24))(*(void *)(a1 + 24));
      if ((int)a2 >= 1)
      {
        uint64_t v10 = 0;
        do
        {
          *(float *)(v6 + v10) = (float)((uint64_t)*(float *)(v6 + v10) | (unint64_t)(uint64_t)v9);
          v10 += 4;
        }
        while (4 * a2 != v10);
      }
    }
    return v6;
  }
  uint64_t v11 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 8))(*(void *)(a1 + 24), a2);
  uint64_t v12 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16), a2);
  if (v12) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13)
  {
    if ((int)a2 >= 1)
    {
      uint64_t v14 = 0;
      do
      {
        *(float *)(v12 + v14) = (float)((uint64_t)*(float *)(v11 + v14) | (unint64_t)(uint64_t)*(float *)(v12 + v14));
        v14 += 4;
      }
      while (4 * a2 != v14);
    }
    goto LABEL_25;
  }
  if (v12) {
    operator delete[]();
  }
  uint64_t v6 = 0;
  if (v11) {
LABEL_25:
  }
    operator delete[]();
  return v6;
}

uint64_t sub_24338(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 24))(*(void *)(a1 + 16));
  uint64_t v7 = **(void **)(a1 + 24);
  if (v6)
  {
    uint64_t v8 = (*(uint64_t (**)(void))(v7 + 16))();
    if (v8)
    {
      (***(void (****)(void))(a1 + 16))(*(void *)(a1 + 16));
      if ((int)a3 >= 1)
      {
        uint64_t v10 = 0;
        do
        {
          if (!*(unsigned char *)(a2 + v10)) {
            *(float *)(v8 + 4 * v10) = (float)((uint64_t)*(float *)(v8 + 4 * v10) | (unint64_t)(uint64_t)v9);
          }
          ++v10;
        }
        while (a3 != v10);
      }
    }
    return v8;
  }
  if ((*(unsigned int (**)(void))(v7 + 24))())
  {
    uint64_t v8 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16), a2, a3);
    if (v8)
    {
      (***(void (****)(void))(a1 + 24))(*(void *)(a1 + 24));
      if ((int)a3 >= 1)
      {
        uint64_t v12 = 0;
        do
        {
          if (!*(unsigned char *)(a2 + v12)) {
            *(float *)(v8 + 4 * v12) = (float)((uint64_t)*(float *)(v8 + 4 * v12) | (unint64_t)(uint64_t)v11);
          }
          ++v12;
        }
        while (a3 != v12);
      }
    }
    return v8;
  }
  uint64_t v13 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 24) + 16))(*(void *)(a1 + 24), a2, a3);
  uint64_t v14 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16), a2, a3);
  if (v14) {
    BOOL v15 = v13 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (!v15)
  {
    if ((int)a3 >= 1)
    {
      uint64_t v16 = 0;
      do
      {
        if (!*(unsigned char *)(a2 + v16)) {
          *(float *)(v14 + 4 * v16) = (float)((uint64_t)*(float *)(v13 + 4 * v16) | (unint64_t)(uint64_t)*(float *)(v14 + 4 * v16));
        }
        ++v16;
      }
      while (a3 != v16);
    }
    goto LABEL_31;
  }
  if (v14) {
    operator delete[]();
  }
  uint64_t v8 = 0;
  if (v13) {
LABEL_31:
  }
    operator delete[]();
  return v8;
}

uint64_t sub_24608()
{
  return 19;
}

uint64_t sub_24610(uint64_t a1)
{
  if ((*(unsigned int (**)(void))(**(void **)(a1 + 16) + 40))(*(void *)(a1 + 16))
    && (***(float (****)(void))(a1 + 16))(*(void *)(a1 + 16)) == -1.0
    || (*(unsigned int (**)(void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24))
    && (***(float (****)(void))(a1 + 24))(*(void *)(a1 + 24)) == -1.0)
  {
    return 1;
  }
  return sub_1C434(a1);
}

void sub_24714(uint64_t a1)
{
  sub_1AE64(a1);
  uint64_t v2 = (void *)(a1 + 16);
  if ((*(unsigned int (**)(void))(**(void **)(a1 + 16) + 40))(*(void *)(a1 + 16))
    && (**(float (***)(void))*v2)() == -1.0)
  {
    uint64_t v3 = (float *)sub_89A0(0x18uLL);
    (***(void (****)(void))(a1 + 24))(*(void *)(a1 + 24));
LABEL_7:
    *(void *)uint64_t v3 = off_1AA280;
    *((void *)v3 + 1) = 0;
    v3[4] = v4;
    (*(void (**)(uint64_t, float *))(*(void *)a1 + 296))(a1, v3);
    return;
  }
  uint64_t v5 = a1 + 24;
  if ((*(unsigned int (**)(void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24))
    && (***(float (****)(void))v5)() == -1.0)
  {
    uint64_t v3 = (float *)sub_89A0(0x18uLL);
    float v4 = (**(float (***)(void))*v2)();
    goto LABEL_7;
  }
  if ((*(unsigned int (**)(void))(*(void *)*v2 + 40))() && (**(float (***)(void))*v2)() == 0.0)
  {
    uint64_t v2 = (void *)(a1 + 24);
LABEL_13:
    (*(void (**)(uint64_t, void))(*(void *)a1 + 296))(a1, *v2);
    return;
  }
  if ((*(unsigned int (**)(void))(**(void **)v5 + 40))() && (***(float (****)(void))v5)() == 0.0) {
    goto LABEL_13;
  }
}

void sub_249C0(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  if (v14) {
    free(v14);
  }
  __cxa_begin_catch(a1);
  __cxa_end_catch();
}

float sub_24A04(uint64_t a1)
{
  uint64_t v2 = (uint64_t)(***(float (****)(void))(a1 + 16))(*(void *)(a1 + 16));
  return (float)((uint64_t)(***(float (****)(void))(a1 + 24))(*(void *)(a1 + 24)) ^ v2);
}

uint64_t sub_24A84(uint64_t a1, uint64_t a2)
{
  int v4 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 24))(*(void *)(a1 + 16));
  uint64_t v5 = **(void **)(a1 + 24);
  if (v4)
  {
    uint64_t v6 = (*(uint64_t (**)(void))(v5 + 8))();
    if (v6)
    {
      (***(void (****)(void))(a1 + 16))(*(void *)(a1 + 16));
      if ((int)a2 >= 1)
      {
        uint64_t v8 = 0;
        do
        {
          *(float *)(v6 + v8) = (float)((uint64_t)*(float *)(v6 + v8) ^ (unint64_t)(uint64_t)v7);
          v8 += 4;
        }
        while (4 * a2 != v8);
      }
    }
    return v6;
  }
  if ((*(unsigned int (**)(void))(v5 + 24))())
  {
    uint64_t v6 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16), a2);
    if (v6)
    {
      (***(void (****)(void))(a1 + 24))(*(void *)(a1 + 24));
      if ((int)a2 >= 1)
      {
        uint64_t v10 = 0;
        do
        {
          *(float *)(v6 + v10) = (float)((uint64_t)*(float *)(v6 + v10) ^ (unint64_t)(uint64_t)v9);
          v10 += 4;
        }
        while (4 * a2 != v10);
      }
    }
    return v6;
  }
  uint64_t v11 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 8))(*(void *)(a1 + 24), a2);
  uint64_t v12 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16), a2);
  if (v12) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13)
  {
    if ((int)a2 >= 1)
    {
      uint64_t v14 = 0;
      do
      {
        *(float *)(v12 + v14) = (float)((uint64_t)*(float *)(v11 + v14) ^ (unint64_t)(uint64_t)*(float *)(v12 + v14));
        v14 += 4;
      }
      while (4 * a2 != v14);
    }
    goto LABEL_25;
  }
  if (v12) {
    operator delete[]();
  }
  uint64_t v6 = 0;
  if (v11) {
LABEL_25:
  }
    operator delete[]();
  return v6;
}

uint64_t sub_24D20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 24))(*(void *)(a1 + 16));
  uint64_t v7 = **(void **)(a1 + 24);
  if (v6)
  {
    uint64_t v8 = (*(uint64_t (**)(void))(v7 + 16))();
    if (v8)
    {
      (***(void (****)(void))(a1 + 16))(*(void *)(a1 + 16));
      if ((int)a3 >= 1)
      {
        uint64_t v10 = 0;
        do
        {
          if (!*(unsigned char *)(a2 + v10)) {
            *(float *)(v8 + 4 * v10) = (float)((uint64_t)*(float *)(v8 + 4 * v10) ^ (unint64_t)(uint64_t)v9);
          }
          ++v10;
        }
        while (a3 != v10);
      }
    }
    return v8;
  }
  if ((*(unsigned int (**)(void))(v7 + 24))())
  {
    uint64_t v8 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16), a2, a3);
    if (v8)
    {
      (***(void (****)(void))(a1 + 24))(*(void *)(a1 + 24));
      if ((int)a3 >= 1)
      {
        uint64_t v12 = 0;
        do
        {
          if (!*(unsigned char *)(a2 + v12)) {
            *(float *)(v8 + 4 * v12) = (float)((uint64_t)*(float *)(v8 + 4 * v12) ^ (unint64_t)(uint64_t)v11);
          }
          ++v12;
        }
        while (a3 != v12);
      }
    }
    return v8;
  }
  uint64_t v13 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 24) + 16))(*(void *)(a1 + 24), a2, a3);
  uint64_t v14 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16), a2, a3);
  if (v14) {
    BOOL v15 = v13 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (!v15)
  {
    if ((int)a3 >= 1)
    {
      uint64_t v16 = 0;
      do
      {
        if (!*(unsigned char *)(a2 + v16)) {
          *(float *)(v14 + 4 * v16) = (float)((uint64_t)*(float *)(v13 + 4 * v16) ^ (unint64_t)(uint64_t)*(float *)(v14 + 4 * v16));
        }
        ++v16;
      }
      while (a3 != v16);
    }
    goto LABEL_31;
  }
  if (v14) {
    operator delete[]();
  }
  uint64_t v8 = 0;
  if (v13) {
LABEL_31:
  }
    operator delete[]();
  return v8;
}

uint64_t sub_24FF0()
{
  return 20;
}

void sub_24FF8(void **a1)
{
  sub_1AE64((uint64_t)a1);
  uint64_t v2 = a1 + 2;
  if ((*(unsigned int (**)(void *))(*a1[2] + 40))(a1[2]) && (**(float (***)(void))*v2)() == 0.0)
  {
    uint64_t v2 = a1 + 3;
LABEL_6:
    ((void (*)(void **, void))(*a1)[37])(a1, *v2);
    return;
  }
  if ((*(unsigned int (**)(void *))(*a1[3] + 40))(a1[3])
    && (*(float (**)(void *))*a1[3])(a1[3]) == 0.0)
  {
    goto LABEL_6;
  }
}

void sub_25114(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
}

uint64_t sub_25134(uint64_t a1)
{
  (***(float (****)(void))(a1 + 16))(*(void *)(a1 + 16));
  uint64_t v2 = *(uint64_t (**)(void))(**(void **)(a1 + 24) + 304);
  return v2();
}

uint64_t sub_251CC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(**(void **)(a1 + 24) + 312))(*(void *)(a1 + 24), *(void *)(a1 + 16), a2);
}

uint64_t sub_25204(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t))(**(void **)(a1 + 24) + 320))(*(void *)(a1 + 24), *(void *)(a1 + 16), a2, a3);
}

uint64_t sub_25240()
{
  return 23;
}

void *sub_25248(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 120))(*(void *)(a1 + 16));
  uint64_t v5 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 112))(*(void *)(a1 + 24), a2);
  int v6 = sub_89A0(0x20uLL);
  sub_25768(v6, v4, v5);
  return v6;
}

void sub_2530C(_Unwind_Exception *exception_object, int a2)
{
  int v6 = v4;
  if (v6) {
    free(v6);
  }
  if (a2 == 1)
  {
    __cxa_begin_catch(exception_object);
    if (v2) {
      (*(void (**)(uint64_t))(*(void *)v2 + 152))(v2);
    }
    if (v3) {
      (*(void (**)(uint64_t))(*(void *)v3 + 152))(v3);
    }
    __cxa_end_catch();
    JUMPOUT(0x252F4);
  }
  _Unwind_Resume(exception_object);
}

void *sub_253C0(uint64_t a1)
{
  sub_1AE64(a1);
  double result = *(void **)(a1 + 24);
  if (result)
  {
    if (result)
    {
      uint64_t v3 = result;
      if ((*(unsigned int (**)(void))(**(void **)(a1 + 16) + 40))(*(void *)(a1 + 16))
        && (uint64_t v4 = *(void *)(a1 + 8)) != 0)
      {
        BOOL v5 = (***(float (****)(void))(a1 + 16))(*(void *)(a1 + 16)) == 0.0;
        v6.n128_u64[0] = 0;
        if (!v5) {
          v6.n128_f32[0] = 1.0;
        }
        uint64_t v7 = *(uint64_t (**)(void *, uint64_t, __n128))(*(void *)v3 + 328);
        return (void *)v7(v3, v4, v6);
      }
      else
      {
        double result = (void *)(*(uint64_t (**)(void *))(*(void *)v3 + 336))(v3);
        if (result)
        {
          uint64_t v9 = *(void *)(a1 + 8);
          uint64_t v10 = *(uint64_t (**)(void *, uint64_t, __n128))(*(void *)v3 + 328);
          v8.n128_u32[0] = 1.0;
          return (void *)v10(v3, v9, v8);
        }
      }
    }
  }
  return result;
}

uint64_t *sub_2558C(uint64_t *a1, uint64_t *a2, const double *a3)
{
  BOOL v5 = sub_1B164(a1, a2, (uint64_t)a3);
  *BOOL v5 = (uint64_t)off_1A96C0;
  __n128 v6 = (const void *)v5[3];
  if (!v6
  {
    LODWORD(xmmword_1F1288) = 28;
    int64x2_t v9 = (int64x2_t)vld1q_dup_f64(a3);
    __n128 v8 = (int64x2_t *)(a3 + 1);
    *(long long *)((char *)&xmmword_1F1288 + 8) = (__int128)vsubq_s64(*v8, v9);
    exception = __cxa_allocate_exception(0x18uLL);
    uint64_t v11 = qword_1F1298;
    *(_OWORD *)exception = xmmword_1F1288;
    exception[2] = v11;
  }
  return a1;
}

void sub_25674(_Unwind_Exception *a1)
{
  sub_2568C(v1);
  _Unwind_Resume(a1);
}

void *sub_2568C(void *a1)
{
  *a1 = off_1AA520;
  uint64_t v3 = a1 + 2;
  uint64_t v2 = a1[2];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 152))(v2);
  }
  uint64_t v4 = a1[3];
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 152))(v4);
  }
  void *v3 = 0;
  v3[1] = 0;
  *a1 = off_1A5578;
  a1[1] = 0;
  return a1;
}

void sub_25748(_Unwind_Exception *a1)
{
  void *v1 = off_1A5578;
  v1[1] = 0;
  _Unwind_Resume(a1);
}

void *sub_25768(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = sub_1B2FC(a1, a2, a3);
  *uint64_t v4 = off_1A96C0;
  BOOL v5 = (const void *)v4[3];
  if (!v5
  {
    LODWORD(xmmword_1F1288) = 28;
    *((void *)&xmmword_1F1288 + 1) = -1;
    qword_1F1298 = -1;
    exception = __cxa_allocate_exception(0x18uLL);
    uint64_t v8 = qword_1F1298;
    *(_OWORD *)exception = xmmword_1F1288;
    exception[2] = v8;
  }
  return a1;
}

void sub_2583C(_Unwind_Exception *a1)
{
  sub_2568C(v1);
  _Unwind_Resume(a1);
}

double sub_25854(uint64_t a1)
{
  return 0.0;
}

uint64_t sub_258A4(uint64_t a1, int a2)
{
  uint64_t v2 = 16;
  if (!a2) {
    uint64_t v2 = 24;
  }
  return (***(uint64_t (****)(void))(a1 + v2))(*(void *)(a1 + v2));
}

uint64_t sub_258DC()
{
  return 0;
}

uint64_t sub_258E4()
{
  return 0;
}

uint64_t sub_258EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a2 + 8))(a2, a3);
  if (v5)
  {
    __n128 v6 = (float *)v5;
    int v7 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 24))(*(void *)(a1 + 16));
    uint64_t v8 = **(void **)(a1 + 24);
    if (v7)
    {
      uint64_t v9 = (*(uint64_t (**)(void))(v8 + 8))();
      if (v9)
      {
        (***(void (****)(void))(a1 + 16))(*(void *)(a1 + 16));
        if ((int)a3 >= 1)
        {
          uint64_t v11 = 0;
          do
          {
            if (v6[v11] != 0.0) {
              *(_DWORD *)(v9 + v11 * 4) = v10;
            }
            ++v11;
          }
          while (a3 != v11);
        }
      }
    }
    else
    {
      int v12 = (*(uint64_t (**)(void))(v8 + 24))();
      uint64_t v13 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16), a3);
      uint64_t v14 = (_DWORD *)v13;
      if (!v12)
      {
        uint64_t v17 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 8))(*(void *)(a1 + 24), a3);
        if (v14) {
          BOOL v18 = v17 == 0;
        }
        else {
          BOOL v18 = 1;
        }
        if (!v18)
        {
          if ((int)a3 >= 1)
          {
            float v19 = v6;
            uint64_t v20 = (_DWORD *)v17;
            uint64_t v21 = v14;
            uint64_t v22 = a3;
            do
            {
              if (*v19 != 0.0) {
                *uint64_t v21 = *v20;
              }
              ++v21;
              ++v20;
              ++v19;
              --v22;
            }
            while (v22);
          }
          operator delete[]();
        }
        operator delete[]();
      }
      if (v13)
      {
        (***(void (****)(void))(a1 + 24))(*(void *)(a1 + 24));
        if ((int)a3 >= 1)
        {
          uint64_t v16 = 0;
          do
          {
            if (v6[v16] == 0.0) {
              v14[v16] = v15;
            }
            ++v16;
          }
          while (a3 != v16);
        }
      }
    }
    operator delete[]();
  }
  return 0;
}

uint64_t sub_25BD0(uint64_t a1, unsigned char *a2, int a3)
{
  if (a3 >= 1)
  {
    uint64_t v3 = a3;
    do
    {
      if (!*a2) {
        *a2 = -2;
      }
      ++a2;
      --v3;
    }
    while (v3);
  }
  return 0;
}

uint64_t sub_25C00(uint64_t a1, unsigned char *a2, int a3)
{
  if (a3 >= 1)
  {
    uint64_t v3 = a3;
    do
    {
      if (!*a2) {
        *a2 = -2;
      }
      ++a2;
      --v3;
    }
    while (v3);
  }
  return 0;
}

uint64_t sub_25C30(uint64_t a1, uint64_t a2, unsigned __int8 *a3, uint64_t a4)
{
  uint64_t v5 = a3;
  uint64_t v7 = (*(uint64_t (**)(uint64_t, unsigned __int8 *, uint64_t))(*(void *)a2 + 16))(a2, a3, a4);
  if (v7)
  {
    uint64_t v8 = (float *)v7;
    int v9 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 24))(*(void *)(a1 + 16));
    uint64_t v10 = **(void **)(a1 + 24);
    if (v9)
    {
      uint64_t v11 = (*(uint64_t (**)(void))(v10 + 16))();
      if (v11)
      {
        (***(void (****)(void))(a1 + 16))(*(void *)(a1 + 16));
        if ((int)a4 >= 1)
        {
          uint64_t v13 = 0;
          do
          {
            if (!v5[v13] && v8[v13] != 0.0) {
              *(_DWORD *)(v11 + 4 * v13) = v12;
            }
            ++v13;
          }
          while (a4 != v13);
        }
      }
    }
    else
    {
      int v14 = (*(uint64_t (**)(void))(v10 + 24))();
      uint64_t v15 = (*(uint64_t (**)(void, unsigned __int8 *, uint64_t))(**(void **)(a1 + 16) + 16))(*(void *)(a1 + 16), v5, a4);
      uint64_t v16 = (_DWORD *)v15;
      if (!v14)
      {
        uint64_t v19 = (*(uint64_t (**)(void, unsigned __int8 *, uint64_t))(**(void **)(a1 + 24) + 16))(*(void *)(a1 + 24), v5, a4);
        if (v16) {
          BOOL v20 = v19 == 0;
        }
        else {
          BOOL v20 = 1;
        }
        if (!v20)
        {
          if ((int)a4 >= 1)
          {
            uint64_t v21 = v8;
            uint64_t v22 = (_DWORD *)v19;
            uint64_t v23 = v16;
            uint64_t v24 = a4;
            do
            {
              int v25 = *v5++;
              if (!v25 && *v21 != 0.0) {
                _DWORD *v23 = *v22;
              }
              ++v23;
              ++v22;
              ++v21;
              --v24;
            }
            while (v24);
          }
          operator delete[]();
        }
        operator delete[]();
      }
      if (v15)
      {
        (***(void (****)(void))(a1 + 24))(*(void *)(a1 + 24));
        if ((int)a4 >= 1)
        {
          uint64_t v18 = 0;
          do
          {
            if (!v5[v18] && v8[v18] == 0.0) {
              v16[v18] = v17;
            }
            ++v18;
          }
          while (a4 != v18);
        }
      }
    }
    operator delete[]();
  }
  return 0;
}

uint64_t sub_25F40()
{
  return 22;
}

uint64_t sub_25F48(uint64_t a1, uint64_t a2, float a3)
{
  if (a3 == 0.0) {
    uint64_t v3 = 24;
  }
  else {
    uint64_t v3 = 16;
  }
  uint64_t v4 = *(void *)(a1 + v3);
  *(void *)(a1 + v3) = 0;
  return (*(uint64_t (**)(uint64_t, void, uint64_t))(*(void *)a2 + 64))(a2, *(void *)(a1 + 8), v4);
}

uint64_t sub_25FF0()
{
  return 0;
}

uint64_t sub_25FF8(uint64_t a1)
{
  return (*(unsigned __int8 (**)(void, void))(**(void **)(a1 + 16) + 136))(*(void *)(a1 + 16), *(void *)(a1 + 24));
}

void *sub_2603C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 112))(*(void *)(a1 + 16));
  uint64_t v5 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 112))(*(void *)(a1 + 24), a2);
  __n128 v6 = sub_89A0(0x20uLL);
  sub_1B2FC(v6, v4, v5);
  *__n128 v6 = off_1A9818;
  return v6;
}

void sub_2611C(_Unwind_Exception *exception_object, int a2)
{
  __n128 v6 = v4;
  if (v6) {
    free(v6);
  }
  if (a2 == 1)
  {
    __cxa_begin_catch(exception_object);
    if (v2) {
      (*(void (**)(uint64_t))(*(void *)v2 + 152))(v2);
    }
    if (v3) {
      (*(void (**)(uint64_t))(*(void *)v3 + 152))(v3);
    }
    __cxa_end_catch();
    JUMPOUT(0x26104);
  }
  _Unwind_Resume(exception_object);
}

void *sub_261D0(void *a1)
{
  sub_1AE64((uint64_t)a1);
  uint64_t v2 = (const void *)a1[1];
  if (!v2
  {
    uint64_t v4 = *(uint64_t (**)(void *, uint64_t, uint64_t, uint64_t))(*a1 + 272);
    return (void *)v4(a1, 27, -1, -1);
  }
  return result;
}

uint64_t sub_26294(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 40))();
}

uint64_t sub_262BC()
{
  return 13;
}

uint64_t sub_262C8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 56))();
}

BOOL sub_262F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 16);
  if (v4 == a2)
  {
    if (a2) {
      (*(void (**)(uint64_t))(*(void *)a2 + 152))(a2);
    }
    *(void *)(a1 + 16) = a3;
    *(void *)(a3 + 8) = a1;
  }
  return v4 == a2;
}

uint64_t sub_26368(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 72))();
}

uint64_t sub_26390(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 80))();
}

uint64_t sub_263B8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 88))();
}

float *sub_263E0(uint64_t a1)
{
  double result = *(float **)(a1 + 16);
  if (result)
  {
    (*(void (**)(float *))(*(void *)result + 96))(result);
    double result = (float *)(*(uint64_t (**)(void))(**(void **)(a1 + 16) + 40))(*(void *)(a1 + 16));
    if (result)
    {
      double result = (float *)(*(uint64_t (**)(void))(**(void **)(a1 + 16) + 24))(*(void *)(a1 + 16));
      if (!result)
      {
        float v3 = (***(float (****)(void))(a1 + 16))(*(void *)(a1 + 16));
        uint64_t v4 = *(void *)(a1 + 16);
        *(void *)(a1 + 16) = 0;
        double result = (float *)sub_89A0(0x18uLL);
        result[4] = v3;
        *(void *)(a1 + 16) = result;
        *(void *)double result = off_1AA280;
        *((void *)result + 1) = a1;
        if (v4) {
          return (float *)(*(uint64_t (**)(uint64_t))(*(void *)v4 + 152))(v4);
        }
      }
    }
  }
  return result;
}

void sub_26518(void *a1)
{
  __cxa_begin_catch(a1);
  uint64_t v3 = *(void *)(v1 + 16);
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 152))(v3);
  }
  *(void *)(v1 + 16) = v2;
  __cxa_end_catch();
}

void sub_2656C(_Unwind_Exception *a1)
{
}

void sub_26580(void **a1)
{
  uint64_t v2 = (const char *)(*(uint64_t (**)(void *))(*a1[2] + 104))(a1[2]);
  uint64_t v3 = (&off_1EFB30)[((int (*)(void **))(*a1)[36])(a1)];
  strlen(v2);
  strlen(v3);
  operator new[]();
}

uint64_t sub_2667C(void **a1)
{
  (*(void (**)(void *))(*a1[2] + 120))(a1[2]);
  uint64_t v2 = ((uint64_t (*)(void **))(*a1)[36])(a1);
  return ((uint64_t (*)(void **, uint64_t))(*a1)[23])(a1, v2);
}

uint64_t sub_267D4(void **a1, void *a2)
{
  if (!a1) {
    __cxa_bad_typeid();
  }
  if (!sub_B9B4(*(*a1 - 1), *(void *)(*a2 - 8))) {
    return 1;
  }
  if (!v4) {
    return 1;
  }
  uint64_t v5 = v4;
  if (((unsigned int (*)(void **))(*a1)[5])(a1)
    && (*(unsigned int (**)(void *))(*(void *)v5 + 40))(v5))
  {
    float v6 = ((float (*)(void **))**a1)(a1);
    return v6 != (**(float (***)(void *))v5)(v5);
  }
  int v8 = ((uint64_t (*)(void **))(*a1)[5])(a1);
  if (v8 != (*(unsigned int (**)(void *))(*(void *)v5 + 40))(v5)) {
    return 1;
  }
  int v9 = *(uint64_t (**)(void))(*a1[2] + 128);
  return v9();
}

uint64_t sub_269F0(void **a1, void *a2)
{
  if (!a1) {
    __cxa_bad_typeid();
  }
  uint64_t result = sub_B9B4(*(*a1 - 1), *(void *)(*a2 - 8));
  if (result)
  {
    if (result)
    {
      uint64_t v5 = result;
      if (((unsigned int (*)(void **))(*a1)[5])(a1)
        && (*(unsigned int (**)(uint64_t))(*(void *)v5 + 40))(v5))
      {
        float v6 = ((float (*)(void **))**a1)(a1);
        return v6 == (**(float (***)(uint64_t))v5)(v5);
      }
      else
      {
        int v7 = ((uint64_t (*)(void **))(*a1)[5])(a1);
        if (v7 == (*(unsigned int (**)(uint64_t))(*(void *)v5 + 40))(v5))
        {
          int v8 = *(uint64_t (**)(void))(*a1[2] + 136);
          return v8();
        }
        else
        {
          return 0;
        }
      }
    }
  }
  return result;
}

void sub_26C10(void *a1)
{
  sub_2A818(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_26C58(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_26C74(void *a1)
{
  sub_2A818(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_26CBC(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_26CD8(void *a1)
{
  sub_2A818(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_26D20(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_26D3C(void *a1)
{
  sub_2A818(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_26D84(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_26DA0(void *a1)
{
  sub_2A818(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_26DE8(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_26E04(void *a1)
{
  sub_2A818(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_26E4C(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_26E68(void *a1)
{
  sub_2A818(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_26EB0(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_26ECC(void *a1)
{
  sub_2A818(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_26F14(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_26F30(void *a1)
{
  sub_2A818(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_26F78(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_26F94(void *a1)
{
  sub_2A818(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_26FDC(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_26FF8(void *a1)
{
  sub_2A818(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_27040(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_2705C(void *a1)
{
  sub_2A818(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_270A4(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_270C0(void *a1)
{
  sub_2A818(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_27108(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_27124(void *a1)
{
  sub_2A818(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_2716C(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_27188(void *a1)
{
  sub_2A818(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_271D0(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_271EC(void *a1)
{
  sub_2A818(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_27234(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_27250(void *a1)
{
  sub_2A818(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_27298(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_272B4(void *a1)
{
  sub_2A818(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_272FC(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_27318(void *a1)
{
  sub_2A818(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_27360(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_2737C(void *a1)
{
  sub_2A818(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_273C4(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_273E0(void *a1)
{
  sub_2A818(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_27428(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_27444(void *a1)
{
  sub_2A818(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_2748C(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_274A8(void *a1)
{
  sub_2A818(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_274F0(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_2750C(void *a1)
{
  sub_2A818(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_27554(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_27570(void *a1)
{
  sub_2A818(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_275B8(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_275D4(void *a1)
{
  sub_2A818(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_2761C(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_27638(void *a1)
{
  sub_2A818(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_27680(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_2769C(void *a1)
{
  sub_2A818(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_276E4(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_27700(void *a1)
{
  sub_2A818(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_27748(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_27760(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2) {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 40))(v2) & 1;
  }
  else {
    uint64_t result = 1;
  }
  uint64_t v4 = *(void *)(a1 + 24);
  if (v4) {
    BOOL v5 = result == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5) {
    return (*(uint64_t (**)(void))(*(void *)v4 + 40))(*(void *)(a1 + 24)) & 1;
  }
  return result;
}

BOOL sub_277F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 16);
  BOOL result = 1;
  if (!v4 || !(*(unsigned int (**)(uint64_t, uint64_t))(*(void *)v4 + 56))(v4, a2))
  {
    uint64_t v5 = *(void *)(a1 + 24);
    if (!v5 || !(*(unsigned int (**)(uint64_t, uint64_t))(*(void *)v5 + 56))(v5, a2)) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_2788C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)(a1 + 16);
  if (*(void *)(a1 + 16) != a2)
  {
    uint64_t v5 = (void *)(a1 + 24);
    if (*(void *)(a1 + 24) != a2) {
      return 0;
    }
  }
  if (a2) {
    (*(void (**)(uint64_t))(*(void *)a2 + 152))(a2);
  }
  *uint64_t v5 = a3;
  *(void *)(a3 + 8) = a1;
  return 1;
}

uint64_t sub_27918(uint64_t a1)
{
  (*(void (**)(void))(**(void **)(a1 + 16) + 72))(*(void *)(a1 + 16));
  uint64_t v2 = *(uint64_t (**)(void))(**(void **)(a1 + 24) + 72);
  return v2();
}

uint64_t sub_279AC(uint64_t a1)
{
  (*(void (**)(void))(**(void **)(a1 + 16) + 80))(*(void *)(a1 + 16));
  uint64_t v2 = *(uint64_t (**)(void))(**(void **)(a1 + 24) + 80);
  return v2();
}

uint64_t sub_27A40(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)v3 + 88))(v3, a2);
  }
  uint64_t result = *(void *)(a1 + 24);
  if (result)
  {
    uint64_t v5 = *(uint64_t (**)(void))(*(void *)result + 88);
    return v5();
  }
  return result;
}

float *sub_27ADC(uint64_t a1)
{
  (*(void (**)(void))(**(void **)(a1 + 16) + 96))(*(void *)(a1 + 16));
  if ((*(unsigned int (**)(void))(**(void **)(a1 + 16) + 40))(*(void *)(a1 + 16)))
  {
    if (!(*(unsigned int (**)(void))(**(void **)(a1 + 16) + 24))(*(void *)(a1 + 16)))
    {
      float v2 = (***(float (****)(void))(a1 + 16))(*(void *)(a1 + 16));
      uint64_t v3 = *(void *)(a1 + 16);
      *(void *)(a1 + 16) = 0;
      uint64_t v4 = (float *)sub_89A0(0x18uLL);
      v4[4] = v2;
      *(void *)(a1 + 16) = v4;
      *(void *)uint64_t v4 = off_1AA280;
      *((void *)v4 + 1) = a1;
      if (v3) {
        (*(void (**)(uint64_t))(*(void *)v3 + 152))(v3);
      }
    }
  }
  (*(void (**)(void))(**(void **)(a1 + 24) + 96))(*(void *)(a1 + 24));
  uint64_t result = (float *)(*(uint64_t (**)(void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24));
  if (result)
  {
    uint64_t result = (float *)(*(uint64_t (**)(void))(**(void **)(a1 + 24) + 24))(*(void *)(a1 + 24));
    if (!result)
    {
      float v6 = (***(float (****)(void))(a1 + 24))(*(void *)(a1 + 24));
      uint64_t v7 = *(void *)(a1 + 24);
      *(void *)(a1 + 24) = 0;
      uint64_t result = (float *)sub_89A0(0x18uLL);
      result[4] = v6;
      *(void *)(a1 + 24) = result;
      *(void *)uint64_t result = off_1AA280;
      *((void *)result + 1) = a1;
      if (v7) {
        return (float *)(*(uint64_t (**)(uint64_t))(*(void *)v7 + 152))(v7);
      }
    }
  }
  return result;
}

void sub_27D1C(void *a1)
{
  __cxa_begin_catch(a1);
  uint64_t v3 = *(void *)(v1 + 24);
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 152))(v3);
  }
  *(void *)(v1 + 24) = v2;
  __cxa_end_catch();
}

void sub_27D70(_Unwind_Exception *a1)
{
}

void sub_27DCC(void **a1)
{
  uint64_t v2 = (const char *)(*(uint64_t (**)(void *))(*a1[2] + 104))(a1[2]);
  uint64_t v3 = (const char *)(*(uint64_t (**)(void *))(*a1[3] + 104))(a1[3]);
  uint64_t v4 = (&off_1EFB30)[((int (*)(void **))(*a1)[36])(a1)];
  strlen(v2);
  strlen(v3);
  strlen(v4);
  operator new[]();
}

uint64_t sub_27F38(void *a1)
{
  uint64_t v2 = a1[2];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 120))(v2);
  }
  uint64_t v3 = a1[3];
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 120))(v3);
  }
  uint64_t v4 = (*(uint64_t (**)(void *))(*a1 + 288))(a1);
  return (*(uint64_t (**)(void *, uint64_t))(*a1 + 184))(a1, v4);
}

BOOL sub_28100(void **a1, void *a2)
{
  if (!a1) {
    __cxa_bad_typeid();
  }
  if (!sub_B9B4(*(*a1 - 1), *(void *)(*a2 - 8))) {
    return 1;
  }
  if (!v4) {
    return 1;
  }
  uint64_t v5 = v4;
  if (((unsigned int (*)(void **))(*a1)[5])(a1)
    && (*(unsigned int (**)(void *))(*v5 + 40))(v5))
  {
    float v6 = ((float (*)(void **))**a1)(a1);
    BOOL v7 = v6 == (*(float (**)(void *))*v5)(v5);
    return !v7;
  }
  int v8 = ((uint64_t (*)(void **))(*a1)[5])(a1);
  if (v8 != (*(unsigned int (**)(void *))(*v5 + 40))(v5)
    || (*(unsigned int (**)(void *, void))(*a1[2] + 128))(a1[2], v5[2]))
  {
    return 1;
  }
  BOOL v7 = (*(unsigned int (**)(void *, void))(*a1[3] + 128))(a1[3], v5[3]) == 0;
  return !v7;
}

uint64_t sub_28334(void **a1, void *a2)
{
  if (!a1) {
    __cxa_bad_typeid();
  }
  uint64_t result = sub_B9B4(*(*a1 - 1), *(void *)(*a2 - 8));
  if (result)
  {
    if (result)
    {
      uint64_t v5 = (void *)result;
      if (((unsigned int (*)(void **))(*a1)[5])(a1)
        && (*(unsigned int (**)(void *))(*v5 + 40))(v5))
      {
        float v6 = ((float (*)(void **))**a1)(a1);
        return v6 == (*(float (**)(void *))*v5)(v5);
      }
      else
      {
        int v7 = ((uint64_t (*)(void **))(*a1)[5])(a1);
        if (v7 == (*(unsigned int (**)(void *))(*v5 + 40))(v5))
        {
          uint64_t result = (*(uint64_t (**)(void *, void))(*a1[2] + 136))(a1[2], v5[2]);
          if (result) {
            return (*(unsigned int (**)(void *, void))(*a1[3] + 136))(a1[3], v5[3]) != 0;
          }
        }
        else
        {
          return 0;
        }
      }
    }
  }
  return result;
}

void sub_28570(void *a1)
{
  sub_2A9A8(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_285B8(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_285D0(uint64_t a1)
{
  if (!*(void *)(a1 + 32)) {
    return 1;
  }
  int v2 = *(_DWORD *)(a1 + 24);
  if (v2 < 1) {
    return 1;
  }
  uint64_t v3 = 0;
  do
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8 * v3);
    if (v4)
    {
      uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4) & 1;
      int v2 = *(_DWORD *)(a1 + 24);
    }
    else
    {
      uint64_t result = 1;
    }
    ++v3;
  }
  while (v3 < v2 && result);
  return result;
}

uint64_t sub_28660(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a1 + 32)) {
    return 0;
  }
  int v3 = *(_DWORD *)(a1 + 24);
  if (v3 < 1) {
    return 0;
  }
  uint64_t v5 = 0;
  while (1)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8 * v5);
    if (v6) {
      break;
    }
LABEL_7:
    if (++v5 >= v3) {
      return 0;
    }
  }
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(*(void *)v6 + 56))(v6, a2))
  {
    int v3 = *(_DWORD *)(a1 + 24);
    goto LABEL_7;
  }
  return 1;
}

BOOL sub_286F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3 = *(void **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  unint64_t v5 = *(unsigned int *)(a1 + 24);
  if ((int)v5 < 1) {
    return 0;
  }
  if (*v3 != a2)
  {
    unint64_t v7 = 0;
    while (v5 - 1 != v7)
    {
      uint64_t v8 = v3[++v7];
      if (v8 == a2)
      {
        BOOL v9 = v7 < v5;
        if (a2) {
          goto LABEL_11;
        }
        goto LABEL_12;
      }
    }
    return 0;
  }
  unint64_t v7 = 0;
  BOOL v9 = 1;
  if (a2)
  {
LABEL_11:
    (*(void (**)(uint64_t))(*(void *)a2 + 152))(a2);
    int v3 = *(void **)(a1 + 32);
  }
LABEL_12:
  v3[v7] = a3;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8 * v7) + 8) = a1;
  return v9;
}

uint64_t sub_287CC(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (*(void *)(result + 32))
  {
    uint64_t v3 = result;
    int v4 = *(_DWORD *)(result + 24);
    if (v4 >= 1)
    {
      for (uint64_t i = 0; i < v4; ++i)
      {
        uint64_t result = *(void *)(*(void *)(v3 + 32) + 8 * i);
        if (result)
        {
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)result + 72))(result, a2, a3);
          int v4 = *(_DWORD *)(v3 + 24);
        }
      }
    }
  }
  return result;
}

uint64_t sub_2885C(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (*(void *)(result + 32))
  {
    uint64_t v3 = result;
    int v4 = *(_DWORD *)(result + 24);
    if (v4 >= 1)
    {
      for (uint64_t i = 0; i < v4; ++i)
      {
        uint64_t result = *(void *)(*(void *)(v3 + 32) + 8 * i);
        if (result)
        {
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)result + 80))(result, a2, a3);
          int v4 = *(_DWORD *)(v3 + 24);
        }
      }
    }
  }
  return result;
}

uint64_t sub_288EC(uint64_t result, uint64_t a2)
{
  if (*(void *)(result + 32))
  {
    uint64_t v2 = result;
    int v3 = *(_DWORD *)(result + 24);
    if (v3 >= 1)
    {
      for (uint64_t i = 0; i < v3; ++i)
      {
        uint64_t result = *(void *)(*(void *)(v2 + 32) + 8 * i);
        if (result)
        {
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)result + 88))(result, a2);
          int v3 = *(_DWORD *)(v2 + 24);
        }
      }
    }
  }
  return result;
}

void sub_28974(uint64_t a1)
{
  int v2 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 288))(a1);
  size_t v3 = strlen((&off_1EFB30)[v2]) + 3;
  int v4 = *(_DWORD *)(a1 + 24);
  __chkstk_darwin();
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFF0);
  if (v5 >= 0x200) {
    size_t v7 = 512;
  }
  else {
    size_t v7 = v5;
  }
  bzero((char *)&v11 - ((v5 + 15) & 0xFFFFFFFF0), v7);
  if (v4 >= 1)
  {
    uint64_t v8 = 0;
    do
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8 * v8);
      uint64_t v10 = (const char *)(*(uint64_t (**)(uint64_t))(*(void *)v9 + 104))(v9);
      v3 += strlen(v10) + 2;
      *(void *)&v6[8 * v8++] = v10;
    }
    while (v8 < *(int *)(a1 + 24));
  }
  operator new[]();
}

void sub_28B9C()
{
}

void sub_28CD8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, long long a11, uint64_t a12)
{
  if (a2 == 1)
  {
    int v14 = __cxa_begin_catch(exception_object);
    long long v19 = *(_OWORD *)v14;
    uint64_t v20 = *((void *)v14 + 2);
    if (v13)
    {
      int v15 = *(_DWORD *)(v12 + 24);
      if (v15 >= 1)
      {
        for (uint64_t i = 0; i < v15; ++i)
        {
          uint64_t v17 = *(void *)(v13 + 8 * i);
          if (v17)
          {
            (*(void (**)(uint64_t))(*(void *)v17 + 152))(v17);
            int v15 = *(_DWORD *)(v12 + 24);
          }
        }
      }
      operator delete[]();
    }
    exception = __cxa_allocate_exception(0x18uLL);
    *(_OWORD *)exception = v19;
    exception[2] = v20;
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_28DAC(void *a1, void *a2)
{
  if (a1 != a2)
  {
    if (!a1) {
      __cxa_bad_typeid();
    }
    if (!sub_B9B4(*(void *)(*a1 - 8), *(void *)(*a2 - 8))) {
      return 1;
    }
    if (!v4) {
      return 1;
    }
    unint64_t v5 = v4;
    if (*((_DWORD *)a1 + 6) != *((_DWORD *)v4 + 6) || (a1[4] == 0) != (v4[4] == 0)) {
      return 1;
    }
    if ((*(unsigned int (**)(void *))(*a1 + 40))(a1)
      && (*(unsigned int (**)(void *))(*v5 + 40))(v5))
    {
      float v6 = (*(float (**)(void *))*a1)(a1);
      return v6 != (*(float (**)(void *))*v5)(v5);
    }
    int v8 = (*(uint64_t (**)(void *))(*a1 + 40))(a1);
    if (v8 != (*(unsigned int (**)(void *))(*v5 + 40))(v5)) {
      return 1;
    }
    if (a1[4])
    {
      int v9 = *((_DWORD *)a1 + 6);
      if (v9 >= 1)
      {
        uint64_t v10 = 0;
        while (1)
        {
          uint64_t v11 = *(void *)(a1[4] + 8 * v10);
          if ((v11 == 0) != (*(void *)(v5[4] + 8 * v10) == 0)) {
            break;
          }
          if (v11)
          {
            if ((*(unsigned int (**)(uint64_t))(*(void *)v11 + 128))(v11)) {
              return 1;
            }
            int v9 = *((_DWORD *)a1 + 6);
          }
          BOOL result = 0;
          if (++v10 >= v9) {
            return result;
          }
        }
        return 1;
      }
    }
  }
  return 0;
}

uint64_t sub_29040(uint64_t a1, void *a2)
{
  if ((void *)a1 == a2) {
    return 1;
  }
  if (!a1) {
    __cxa_bad_typeid();
  }
  uint64_t result = sub_B9B4(*(void *)(*(void *)a1 - 8), *(void *)(*a2 - 8));
  if (result)
  {
    if (result)
    {
      unint64_t v5 = (void *)result;
      if (*(_DWORD *)(a1 + 24) != *(_DWORD *)(result + 24)
        || (*(void *)(a1 + 32) == 0) != (*(void *)(result + 32) == 0))
      {
        return 0;
      }
      if ((*(unsigned int (**)(uint64_t))(*(void *)a1 + 40))(a1)
        && (*(unsigned int (**)(void *))(*v5 + 40))(v5))
      {
        float v6 = (**(float (***)(uint64_t))a1)(a1);
        return v6 == (*(float (**)(void *))*v5)(v5);
      }
      int v7 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 40))(a1);
      if (v7 != (*(unsigned int (**)(void *))(*v5 + 40))(v5)) {
        return 0;
      }
      if (*(void *)(a1 + 32))
      {
        int v8 = *(_DWORD *)(a1 + 24);
        if (v8 >= 1)
        {
          uint64_t v9 = 0;
          while (1)
          {
            uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8 * v9);
            if ((v10 == 0) != (*(void *)(v5[4] + 8 * v9) == 0)) {
              break;
            }
            if (v10)
            {
              if ((*(unsigned int (**)(uint64_t))(*(void *)v10 + 128))(v10)) {
                return 0;
              }
              int v8 = *(_DWORD *)(a1 + 24);
            }
            ++v9;
            uint64_t result = 1;
            if (v9 >= v8) {
              return result;
            }
          }
          return 0;
        }
      }
      return 1;
    }
  }
  return result;
}

void sub_292D8(void *a1)
{
  sub_2AAA4((uint64_t)a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_29320(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_2933C(void *a1)
{
  sub_2AAA4((uint64_t)a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_29384(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_2939C()
{
  return 0;
}

uint64_t sub_293A4()
{
  return 0;
}

uint64_t sub_293B0(uint64_t a1)
{
  return 0;
}

void sub_29404(void *a1)
{
  sub_2AAA4((uint64_t)a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_2944C(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_29468(void *a1)
{
  sub_2AAA4((uint64_t)a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_294B0(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_294C8(uint64_t a1)
{
  return (__int16)word_1649A8[(*(unsigned int (**)(uint64_t))(*(void *)a1 + 288))(a1)];
}

BOOL sub_29514(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 16);
  BOOL result = 1;
  if (!v4 || !(*(unsigned int (**)(uint64_t, uint64_t))(*(void *)v4 + 56))(v4, a2))
  {
    uint64_t v5 = *(void *)(a1 + 24);
    if (!v5 || !(*(unsigned int (**)(uint64_t, uint64_t))(*(void *)v5 + 56))(v5, a2)) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_295AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)(a1 + 16);
  if (*(void *)(a1 + 16) != a2)
  {
    uint64_t v5 = (void *)(a1 + 24);
    if (*(void *)(a1 + 24) != a2) {
      return 0;
    }
  }
  if (a2) {
    (*(void (**)(uint64_t))(*(void *)a2 + 152))(a2);
  }
  *uint64_t v5 = a3;
  *(void *)(a3 + 8) = a1;
  return 1;
}

uint64_t sub_29638(uint64_t a1)
{
  (*(void (**)(void))(**(void **)(a1 + 16) + 72))(*(void *)(a1 + 16));
  int v2 = *(uint64_t (**)(void))(**(void **)(a1 + 24) + 72);
  return v2();
}

uint64_t sub_296CC(uint64_t a1)
{
  (*(void (**)(void))(**(void **)(a1 + 16) + 80))(*(void *)(a1 + 16));
  int v2 = *(uint64_t (**)(void))(**(void **)(a1 + 24) + 80);
  return v2();
}

uint64_t sub_29760(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)v3 + 88))(v3, a2);
  }
  uint64_t result = *(void *)(a1 + 24);
  if (result)
  {
    uint64_t v5 = *(uint64_t (**)(void))(*(void *)result + 88);
    return v5();
  }
  return result;
}

void sub_297FC(void **a1)
{
  int v2 = (const char *)(*(uint64_t (**)(void *))(*a1[2] + 104))(a1[2]);
  uint64_t v3 = (const char *)(*(uint64_t (**)(void *))(*a1[3] + 104))(a1[3]);
  uint64_t v4 = (&off_1EFA70)[((unsigned int (*)(void **))(*a1)[36])(a1)];
  uint64_t v5 = a1[2];
  if (v5) {
  float v6 = a1[3];
  }
  if (v6) {
  strlen(v2);
  }
  strlen(v3);
  strlen(v4);
  operator new[]();
}

uint64_t sub_29A68(void **a1)
{
  uint64_t v2 = (*(uint64_t (**)(void *))(*a1[2] + 120))(a1[2]);
  uint64_t v3 = (*(uint64_t (**)(void *))(*a1[3] + 120))(a1[3]);
  uint64_t v4 = ((uint64_t (*)(void **))(*a1)[36])(a1);
  return ((uint64_t (*)(void **, uint64_t, uint64_t, uint64_t))(*a1)[25])(a1, v4, v2, v3);
}

uint64_t sub_29C38(void *a1, void *a2)
{
  if (!a1) {
    __cxa_bad_typeid();
  }
  if (!sub_B9B4(*(void *)(*a1 - 8), *(void *)(*a2 - 8))) {
    return 1;
  }
  if ((*(unsigned int (**)(void *))(*a1 + 40))(a1)
    && (*(unsigned int (**)(void *))(*v4 + 40))(v4))
  {
    float v5 = (*(float (**)(void *))*a1)(a1);
    return v5 != (*(float (**)(void *))*v4)(v4);
  }
  uint64_t v7 = a1[2];
  if ((v7 == 0) != (v4[2] == 0)) {
    return 1;
  }
  if ((*(unsigned int (**)(uint64_t))(*(void *)v7 + 128))(v7)) {
    return 1;
  }
  uint64_t v8 = a1[3];
  if ((v8 == 0) != (v4[3] == 0)) {
    return 1;
  }
  uint64_t v9 = *(uint64_t (**)(void))(*(void *)v8 + 128);
  return v9();
}

uint64_t sub_29E48(void *a1, void *a2)
{
  if (!a1) {
    __cxa_bad_typeid();
  }
  uint64_t result = sub_B9B4(*(void *)(*a1 - 8), *(void *)(*a2 - 8));
  if (result)
  {
    if ((*(unsigned int (**)(void *))(*a1 + 40))(a1)
      && (*(unsigned int (**)(void *))(*v5 + 40))(v5))
    {
      float v6 = (*(float (**)(void *))*a1)(a1);
      return v6 == (*(float (**)(void *))*v5)(v5);
    }
    else
    {
      uint64_t v7 = a1[2];
      if ((v7 == 0) != (v5[2] == 0)) {
        return 0;
      }
      if ((*(unsigned int (**)(uint64_t))(*(void *)v7 + 128))(v7)) {
        return 0;
      }
      uint64_t v8 = a1[3];
      if ((v8 == 0) != (v5[3] == 0))
      {
        return 0;
      }
      else
      {
        uint64_t v9 = *(uint64_t (**)(void))(*(void *)v8 + 136);
        return v9();
      }
    }
  }
  return result;
}

void sub_2A05C(void *a1)
{
  sub_2568C(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_2A0A4(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_2A0BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (void *)(a1 + 16);
  if (*(void *)(a1 + 16) == a2 || (uint64_t v2 = (void *)(a1 + 24), *(void *)(a1 + 24) == a2)) {
    *uint64_t v2 = 0;
  }
  return (*(uint64_t (**)(void))(**(void **)(a1 + 8) + 64))();
}

void sub_2A114(void *a1)
{
  sub_2568C(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_2A15C(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_2A178(void *a1)
{
  sub_2568C(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_2A1C0(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_2A1DC(void *a1)
{
  sub_2568C(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_2A224(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_2A240(void *a1)
{
  sub_2568C(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_2A288(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_2A2A4(void *a1)
{
  sub_2568C(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_2A2EC(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_2A308(void *a1)
{
  sub_2568C(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_2A350(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_2A36C(void *a1)
{
  sub_2568C(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_2A3B4(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_2A3D0(void *a1)
{
  sub_2568C(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_2A418(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_2A434(void *a1)
{
  sub_2568C(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_2A47C(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_2A498(void *a1)
{
  sub_2568C(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_2A4E0(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_2A4FC(void *a1)
{
  sub_2568C(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_2A544(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_2A560(void *a1)
{
  sub_2568C(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_2A5A8(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_2A5C4(void *a1)
{
  sub_2568C(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_2A60C(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_2A628(void *a1)
{
  sub_2568C(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_2A670(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_2A68C(void *a1)
{
  sub_2568C(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_2A6D4(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_2A6F0(void *a1)
{
  sub_2568C(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_2A738(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_2A754(void *a1)
{
  sub_2568C(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_2A79C(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_2A7B8(void *a1)
{
  sub_2568C(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_2A800(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void *sub_2A818(void *a1)
{
  *a1 = off_1A9ED8;
  uint64_t v2 = a1[2];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 152))(v2);
  }
  a1[1] = 0;
  a1[2] = 0;
  *a1 = off_1A5578;
  return a1;
}

void sub_2A8A4(_Unwind_Exception *a1)
{
  void *v1 = off_1A5578;
  v1[1] = 0;
  _Unwind_Resume(a1);
}

uint64_t sub_2A8C4(uint64_t a1)
{
  return (***(uint64_t (****)(void))(a1 + 16))(*(void *)(a1 + 16));
}

uint64_t sub_2A8EC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 8))();
}

uint64_t sub_2A914(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 16))();
}

void sub_2A940(void *a1)
{
  sub_2A818(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_2A988(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_2A9A0()
{
  return 0;
}

void *sub_2A9A8(void *a1)
{
  *a1 = off_1AA010;
  uint64_t v2 = a1[3];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 152))(v2);
  }
  a1[3] = 0;
  return sub_2A818(a1);
}

void sub_2AA28(_Unwind_Exception *a1)
{
  sub_2A818(v1);
  _Unwind_Resume(a1);
}

void sub_2AA44(void *a1)
{
  sub_2A9A8(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_2AA8C(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

void *sub_2AAA4(uint64_t a1)
{
  *(void *)a1 = off_1AA148;
  if (*(void *)(a1 + 32))
  {
    int v2 = *(_DWORD *)(a1 + 24);
    if (v2 < 1) {
      goto LABEL_8;
    }
    for (uint64_t i = 0; i < v2; ++i)
    {
      uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8 * i);
      if (v4)
      {
        (*(void (**)(uint64_t))(*(void *)v4 + 152))(v4);
        int v2 = *(_DWORD *)(a1 + 24);
      }
    }
    if (*(void *)(a1 + 32)) {
LABEL_8:
    }
      operator delete[]();
    *(void *)(a1 + 32) = 0;
  }
  *(_DWORD *)(a1 + 24) = 0;
  return sub_2A818((void *)a1);
}

void sub_2AB70(_Unwind_Exception *a1)
{
  sub_2A818(v1);
  _Unwind_Resume(a1);
}

void sub_2AB8C(void *a1)
{
  sub_2AAA4((uint64_t)a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_2ABD4(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

float sub_2ABEC(uint64_t a1)
{
  return *(float *)(a1 + 16);
}

void sub_2ABF4()
{
}

void sub_2AC58()
{
}

uint64_t sub_2ACF8()
{
  return 1;
}

uint64_t sub_2AD00()
{
  return 1;
}

uint64_t sub_2AD08()
{
  return 15;
}

uint64_t sub_2AD10()
{
  return 0;
}

void sub_2AD20()
{
}

void *sub_2AD28()
{
  uint64_t result = sub_89A0(0x18uLL);
  void *result = off_1AA280;
  result[1] = 0;
  *((_DWORD *)result + 4) = 0;
  return result;
}

float sub_2AD64(uint64_t a1)
{
  int v2 = (float *)sub_89A0(0x18uLL);
  float result = *(float *)(a1 + 16);
  *(void *)int v2 = off_1AA280;
  *((void *)v2 + 1) = 0;
  v2[4] = result;
  return result;
}

BOOL sub_2ADB0(float (***a1)(void), void *lpsrc)
{
  if (!v3) {
    return 1;
  }
  uint64_t v4 = v3;
  float v5 = (**a1)(a1);
  return v5 != (**v4)(v4);
}

float (***sub_2AE8C(float (***a1)(void), void *lpsrc))(void)
{
  if (result)
  {
    uint64_t v4 = result;
    float v5 = (**a1)(a1);
    return (float (***)(void))(v5 == (**v4)(v4));
  }
  return result;
}

void *sub_2AF60(void *result)
{
  void *result = off_1A5578;
  result[1] = 0;
  return result;
}

void sub_2AF84(void *a1, uint64_t a2)
{
  *a1 = off_1AA3C8;
  a1[1] = 0;
  a1[2] = *(void *)(a2 + 24);
  operator new[]();
}

void sub_2B060(_Unwind_Exception *a1)
{
  void *v1 = off_1A5578;
  v1[1] = 0;
  _Unwind_Resume(a1);
}

uint64_t sub_2B080(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(**(void **)(a1 + 16) + 320))(*(void *)(a1 + 16), *(unsigned int *)(a1 + 24));
}

uint64_t sub_2B0B8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(**(void **)(a1 + 16) + 368))(*(void *)(a1 + 16), *(unsigned int *)(a1 + 24), a2);
}

uint64_t sub_2B124(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(**(void **)(a1 + 16) + 368))(*(void *)(a1 + 16), *(unsigned int *)(a1 + 24));
}

uint64_t sub_2B1B4()
{
  return 1;
}

uint64_t sub_2B1BC()
{
  return 0;
}

uint64_t sub_2B1C4()
{
  return 15;
}

BOOL sub_2B1CC(uint64_t a1, char *__s1)
{
  return __s1 && strcmp(__s1, *(const char **)(a1 + 32)) == 0;
}

uint64_t sub_2B208()
{
  return 0;
}

uint64_t sub_2B210(uint64_t a1, char *__s2, uint64_t a3)
{
  if (!__s2) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 272))(a1, 20, -1, -1);
  }
  uint64_t result = strcmp(*(const char **)(a1 + 32), __s2);
  if (!result)
  {
    uint64_t v7 = *(unsigned int *)(a1 + 24);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)a1 + 80);
    return v8(a1, v7, a3);
  }
  return result;
}

uint64_t *sub_2B2DC(uint64_t *result, int a2, uint64_t *lpsrc)
{
  if (lpsrc != result)
  {
    uint64_t v3 = result;
    if (*((_DWORD *)result + 6) == a2)
    {
      uint64_t v5 = *lpsrc;
      if (v6) {
        uint64_t v7 = (*(uint64_t (**)(void *))(*(void *)v6 + 288))(v6);
      }
      else {
        uint64_t v7 = (*(uint64_t (**)(uint64_t *))(v5 + 120))(lpsrc);
      }
      uint64_t v8 = v7;
      uint64_t v9 = v3[1];
      if (v9
        && (uint64_t v10 = v3[2], (*(unsigned int (**)(uint64_t, uint64_t *, uint64_t))(*(void *)v9 + 64))(v9, v3, v8)))
      {
        uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)v8 + 88);
        return (uint64_t *)v11(v8, v10);
      }
      else
      {
        uint64_t v12 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*v3 + 272);
        return (uint64_t *)v12(v3, 21, -1, -1);
      }
    }
  }
  return result;
}

uint64_t sub_2B48C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 16) = a2;
  if (a2)
  {
    uint64_t v2 = result;
    uint64_t result = (*(uint64_t (**)(uint64_t, void))(*(void *)a2 + 424))(a2, *(void *)(result + 32));
    *(_DWORD *)(v2 + 24) = result;
  }
  return result;
}

void sub_2B4F4(uint64_t a1)
{
}

float *sub_2B548(void *a1, char *__s2)
{
  if (!__s2 || (uint64_t v4 = (const char *)a1[4]) == 0)
  {
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*a1 + 272))(a1, 21, -1, -1);
    uint64_t v4 = (const char *)a1[4];
  }
  int v5 = strcmp(v4, __s2);
  uint64_t result = (float *)sub_89A0(0x18uLL);
  *(void *)uint64_t result = off_1AA280;
  *((void *)result + 1) = 0;
  float v7 = 0.0;
  if (!v5) {
    float v7 = 1.0;
  }
  result[4] = v7;
  return result;
}

void sub_2B5FC(uint64_t a1)
{
  uint64_t v2 = sub_89A0(0x28uLL);
  sub_2B934(v2, *(char **)(a1 + 32));
}

void sub_2B634(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_2B64C(uint64_t a1, void *a2)
{
  if (!a1) {
    __cxa_bad_typeid();
  }
  if (!sub_B9B4(*(void *)(*(void *)a1 - 8), *(void *)(*a2 - 8))) {
    return 1;
  }
  if (!v4) {
    return 1;
  }
  int v5 = v4;
  unint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 288))(a1);
  unint64_t v7 = (*(uint64_t (**)(void *))(*(void *)v5 + 288))(v5);
  if (v6 | v7)
  {
    if ((v6 == 0) != (v7 != 0)) {
      return strcmp((const char *)v6, (const char *)v7) != 0;
    }
    return 1;
  }
  return 0;
}

uint64_t sub_2B79C(uint64_t a1, void *a2)
{
  if (!a1) {
    __cxa_bad_typeid();
  }
  uint64_t result = sub_B9B4(*(void *)(*(void *)a1 - 8), *(void *)(*a2 - 8));
  if (result)
  {
    if (result)
    {
      uint64_t v5 = result;
      unint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 288))(a1);
      unint64_t v7 = (*(uint64_t (**)(uint64_t))(*(void *)v5 + 288))(v5);
      if (v6 | v7) {
        return (v6 == 0) != (v7 != 0) && strcmp((const char *)v6, (const char *)v7) == 0;
      }
      else {
        return 1;
      }
    }
  }
  return result;
}

void sub_2B8F0(void *a1)
{
  uint64_t v1 = sub_2B9E0(a1);
  if (v1)
  {
    free(v1);
  }
}

uint64_t sub_2B924(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

uint64_t sub_2B92C(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

void sub_2B934(void *a1, char *__s)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = off_1AA3C8;
  strlen(__s);
  operator new[]();
}

void sub_2B9C0(_Unwind_Exception *a1)
{
  void *v1 = off_1A5578;
  v1[1] = 0;
  _Unwind_Resume(a1);
}

void *sub_2B9E0(void *result)
{
  float *result = off_1AA3C8;
  if (result[4]) {
    operator delete[]();
  }
  result[4] = 0;
  float *result = off_1A5578;
  result[1] = 0;
  return result;
}

double sub_2BA5C()
{
  return 0.0;
}

void sub_2BA68(void *a1)
{
  sub_2568C(a1);
  if (a1)
  {
    free(a1);
  }
}

void sub_2BAB0(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_2BAC8()
{
  return 0;
}

uint64_t sub_2C1A8(uint64_t a1)
{
  unint64_t v6 = +[EAGLContext currentContext];
  uint64_t v2 = v6;
  if (v6 != [*(id *)(*(void *)(a1 + 32) + 24) glContext]) {
    +[EAGLContext setCurrentContext:](EAGLContext, "setCurrentContext:", [*(id *)(*(void *)(a1 + 32) + 24) glContext]);
  }
  glPixelStorei(0xD05u, 4);
  glReadPixels(0, 0, (int)*(double *)(*(void *)(a1 + 32) + 40), (int)*(double *)(*(void *)(a1 + 32) + 48), 0x1908u, 0x1401u, *(GLvoid **)(a1 + 40));
  glFinish();
  uint64_t v3 = +[EAGLContext currentContext];
  uint64_t v4 = v6;
  if (v3 != v6)
  {
    uint64_t v3 = (EAGLContext *)+[EAGLContext setCurrentContext:v6];
    uint64_t v4 = v6;
  }
  return _objc_release_x1(v3, v4);
}

void sub_2C73C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2C8BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2CB28(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2CDD8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2CF5C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2D0B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2D790(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_3147C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_31CC8(_Unwind_Exception *exception_object)
{
}

void sub_31F00(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_31F68(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_31FEC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_32154(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_32228(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_32358(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_3252C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_325F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_329C4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_32A98(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_32B68(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_32BE4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_32C88(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_32D4C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_333C0(_Unwind_Exception *exception_object)
{
}

void sub_33788(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_337F0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_33960(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_33D74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_34034(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_3428C(_Unwind_Exception *exception_object)
{
}

void sub_34388(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sortSlidesByUsage1(void *a1, void *a2, unsigned char *a3)
{
  if (a3) {
    BOOL v5 = *a3 != 0;
  }
  else {
    BOOL v5 = 1;
  }
  id v6 = [a1 overallUsageCounter];
  id v7 = [a2 overallUsageCounter];
  if ((uint64_t)v6 < (uint64_t)v7)
  {
    BOOL v8 = !v5;
    uint64_t v9 = -1;
    goto LABEL_8;
  }
  if ((uint64_t)v7 < (uint64_t)v6)
  {
    BOOL v8 = !v5;
    uint64_t v9 = 1;
LABEL_8:
    if (v8) {
      return (id)-v9;
    }
    else {
      return (id)v9;
    }
  }
  id v11 = [a1 path];
  id v12 = [a2 path];
  return [v11 compare:v12];
}

void sub_34768(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_347D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_3C438(uint64_t a1)
{
  uint64_t v1 = *(unsigned char **)(a1 + 32);
  if (v1[57]) {
    return [v1 resumeSlideshow];
  }
  else {
    return [v1 pauseSlideshow];
  }
}

unsigned char *sub_3C504(uint64_t a1)
{
  uint64_t result = *(unsigned char **)(a1 + 32);
  if (result[57])
  {
    [result willChangeValueForKey:@"slideshowIsPlaying"];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "sublayers", 0);
    id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          BOOL v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
          if (v8 != *(void **)(*(void *)(*(void *)(a1 + 32) + 40) + 304)
            && [*(id *)(*((void *)&v10 + 1) + 8 * i) isActivated])
          {
            objc_msgSend(objc_msgSend(v8, "clock"), "resumeOnNextUpdate");
          }
        }
        id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }
    id v9 = [*(id *)(a1 + 32) renderingDelegate];
    if (objc_opt_respondsToSelector()) {
      [v9 resumeMusic];
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 57) = 0;
    return [*(id *)(a1 + 32) didChangeValueForKey:@"slideshowIsPlaying"];
  }
  return result;
}

unsigned char *sub_3C740(uint64_t a1)
{
  uint64_t result = *(unsigned char **)(a1 + 32);
  if (!result[57])
  {
    [result willChangeValueForKey:@"slideshowIsPlaying"];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "sublayers", 0);
    id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          BOOL v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
          if (v8 != *(void **)(*(void *)(*(void *)(a1 + 32) + 40) + 304)
            && [*(id *)(*((void *)&v10 + 1) + 8 * i) isActivated])
          {
            objc_msgSend(objc_msgSend(v8, "clock"), "pauseOnNextUpdate");
          }
        }
        id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }
    id v9 = [*(id *)(a1 + 32) renderingDelegate];
    if (objc_opt_respondsToSelector()) {
      [v9 pauseMusic];
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 57) = 1;
    return [*(id *)(a1 + 32) didChangeValueForKey:@"slideshowIsPlaying"];
  }
  return result;
}

id sub_3C9E4(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 16) isPreactivated])
  {
    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
    objc_msgSend(objc_msgSend(v2, "clock"), "externalTime");
    objc_msgSend(v2, "prerenderForTime:inContext:withArguments:", *(void *)(*(void *)(*(void *)(a1 + 32) + 40) + 8), *(void *)(*(void *)(*(void *)(a1 + 32) + 40) + 120));
    id v3 = [*(id *)(a1 + 32) _layerForPlugObjectID:*(void *)(*(void *)(*(void *)(a1 + 32) + 40) + 296)];
    double v4 = *(double *)(a1 + 40);
    [v3 timeIn];
    objc_msgSend(objc_msgSend(v3, "clock"), "setContainerTime:", v4 - v5);
    [v3 resyncToSerializer];
    id result = [*(id *)(a1 + 32) requestRenderingOnChanges];
    if (result)
    {
      id v7 = *(void **)(a1 + 32);
      return [v7 requestRendering:0];
    }
  }
  else
  {
    double v8 = *(double *)(a1 + 40);
    id v9 = *(void **)(a1 + 32);
    return [v9 setTime:v8];
  }
  return result;
}

uint64_t sub_3CC10(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(result + 40);
  if (!*(void *)(v3 + 352))
  {
    id v4 = [(id)result _layerForPlugObjectID:*(void *)(v3 + 296)];
    objc_opt_class();
    uint64_t result = objc_opt_isKindOfClass();
    if (result)
    {
      [v4 jumpToNextMarker:0];
      uint64_t result = (uint64_t)[*(id *)(a1 + 32) requestRenderingOnChanges];
      if (result)
      {
        double v5 = *(void **)(a1 + 32);
        return (uint64_t)[v5 requestRendering:0];
      }
    }
  }
  return result;
}

uint64_t sub_3CD58(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(result + 40);
  if (!*(void *)(v3 + 352))
  {
    id v4 = [(id)result _layerForPlugObjectID:*(void *)(v3 + 296)];
    objc_opt_class();
    uint64_t result = objc_opt_isKindOfClass();
    if (result)
    {
      [v4 jumpToPreviousMarker:0];
      uint64_t result = (uint64_t)[*(id *)(a1 + 32) requestRenderingOnChanges];
      if (result)
      {
        double v5 = *(void **)(a1 + 32);
        return (uint64_t)[v5 requestRendering:0];
      }
    }
  }
  return result;
}

uint64_t sub_3CEA4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(result + 40);
  if (!*(void *)(v3 + 352))
  {
    id v4 = [(id)result _layerForPlugObjectID:*(void *)(v3 + 296)];
    objc_opt_class();
    uint64_t result = objc_opt_isKindOfClass();
    if (result)
    {
      [v4 gotoMoreSlidesWithAction:0 backwards:0 animate:*(unsigned __int8 *)(a1 + 40) canCatchCurrentTransition:0];
      uint64_t result = (uint64_t)[*(id *)(a1 + 32) requestRenderingOnChanges];
      if (result)
      {
        double v5 = *(void **)(a1 + 32);
        return (uint64_t)[v5 requestRendering:0];
      }
    }
  }
  return result;
}

uint64_t sub_3CFFC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(result + 40);
  if (!*(void *)(v3 + 352))
  {
    id v4 = [(id)result _layerForPlugObjectID:*(void *)(v3 + 296)];
    objc_opt_class();
    uint64_t result = objc_opt_isKindOfClass();
    if (result)
    {
      [v4 gotoMoreSlidesWithAction:0 backwards:1 animate:*(unsigned __int8 *)(a1 + 40) canCatchCurrentTransition:0];
      uint64_t result = (uint64_t)[*(id *)(a1 + 32) requestRenderingOnChanges];
      if (result)
      {
        double v5 = *(void **)(a1 + 32);
        return (uint64_t)[v5 requestRendering:0];
      }
    }
  }
  return result;
}

void *sub_3D150(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 32);
  if (*(void *)(result[5] + 352))
  {
    [result willGoToPreviousOrNextFocusedSlide:1 withAction:0 animate:0];
    [*(id *)(a1 + 32) prerenderWithPassParameters:0];
    if ([*(id *)(*(void *)(*(void *)(a1 + 32) + 40) + 352) isInZoomMode]) {
      [*(id *)(a1 + 32) exitSlideZoomMode:0];
    }
    [*(id *)(a1 + 32) didGoToPreviousOrNextFocusedSlide:1 withAction:0];
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 40) + 352) setIsTransitioning:0];
    uint64_t result = [*(id *)(a1 + 32) requestRenderingOnChanges];
    if (result)
    {
      uint64_t v3 = *(void **)(a1 + 32);
      return [v3 requestRendering:0];
    }
  }
  return result;
}

void *sub_3D2CC(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 32);
  if (*(void *)(result[5] + 352))
  {
    [result willGoToPreviousOrNextFocusedSlide:0 withAction:0 animate:0];
    [*(id *)(a1 + 32) prerenderWithPassParameters:0];
    if ([*(id *)(*(void *)(*(void *)(a1 + 32) + 40) + 352) isInZoomMode]) {
      [*(id *)(a1 + 32) exitSlideZoomMode:0];
    }
    [*(id *)(a1 + 32) didGoToPreviousOrNextFocusedSlide:0 withAction:0];
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 40) + 352) setIsTransitioning:0];
    uint64_t result = [*(id *)(a1 + 32) requestRenderingOnChanges];
    if (result)
    {
      uint64_t v3 = *(void **)(a1 + 32);
      return [v3 requestRendering:0];
    }
  }
  return result;
}

id sub_3DC98(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) slideZoomStart:a2];
}

id sub_3DCA4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) slideZoomUpdate:a2];
}

id sub_3DCB0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) slideZoomEnd:a2];
}

id sub_3DCBC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) slideZoomCancel:a2];
}

id sub_3DCC8(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) enterSlideZoomMode];
  id v4 = *(void **)(a1 + 32);
  return [v4 slideZoomStart:a2];
}

id sub_3DD0C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) slideZoomUpdate:a2];
}

id sub_3DD18(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) slideZoomEnd:a2];
}

id sub_3DD24(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) slideZoomCancel:a2];
}

id sub_3DD30(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) focusedTransitionStart:a2];
}

id sub_3DD3C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) focusedTransitionUpdate:a2];
}

id sub_3DD48(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) focusedTransitionEnd:a2];
}

id sub_3DD54(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) focusedTransitionCancel:a2];
}

double sub_3DD60(uint64_t a1, uint64_t a2)
{
  id v4 = objc_alloc_init(MRSlideFocusState);
  -[MRSlideFocusState setDelegate:](v4, "setDelegate:", [*(id *)(a1 + 32) superlayer]);
  [(MRSlideFocusState *)v4 setSlideID:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) enterSlideFocusModeWithState:v4 animate:a2];
  double v6 = v5;

  return v6;
}

id sub_3DDE0(uint64_t a1)
{
  return [*(id *)(a1 + 32) defaultPauseResumeOnTap:0];
}

id sub_3DDEC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) slideshowTransitionStart:a2];
}

id sub_3DDF8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) slideshowTransitionUpdate:a2];
}

id sub_3DE04(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) slideshowTransitionEnd:a2];
}

id sub_3DE10(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) slideshowTransitionCancel:a2];
}

id sub_3DE1C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) slideshowTransitionStart:a2];
}

id sub_3DE28(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) slideshowTransitionUpdate:a2];
}

id sub_3DE34(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) slideshowTransitionEnd:a2];
}

id sub_3DE40(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) slideshowTransitionCancel:a2];
}

void sub_3E880(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_3F2C8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_3F2E0(uint64_t a1, uint64_t a2)
{
}

void sub_3F2F0(uint64_t a1)
{
}

id sub_3F2FC(uint64_t a1)
{
  id result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "sublayerHitAtPoint:onlyIfHitElement:localPoint:", *(unsigned __int8 *)(a1 + 72), *(void *)(a1 + 64), *(double *)(a1 + 48), *(double *)(a1 + 56));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

void sub_41264(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_415EC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_42D28(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_43124(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_43260(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_432F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_43390(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_43428(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_434FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_435D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_43BA0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_43C24(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_43C9C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_449D4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_44A3C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_44B84(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void MyCGImageBufferReleaseCallback(int a1, void *a2)
{
  if (a2) {
    free(a2);
  }
}

void PerformSynchronouslyOnRenderQueue(NSObject *a1, uint64_t a2)
{
  if (dispatch_get_specific(sRenderDispatchQueueSpecificKey))
  {
    id v4 = *(void (**)(uint64_t))(a2 + 16);
    v4(a2);
  }
  else
  {
    double v5 = dispatch_semaphore_create(0);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_4B640;
    v7[3] = &unk_1AAAD8;
    v7[4] = v5;
    v7[5] = a2;
    dispatch_block_t v6 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_DETACHED, QOS_CLASS_USER_INITIATED, 0, v7);
    dispatch_async(a1, v6);
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v5);
    _Block_release(v6);
  }
}

intptr_t sub_4B640(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v2);
}

void PerformAsynchronouslyOnRenderQueueIfNotOnRenderQueue(NSObject *a1, void *a2)
{
  if (dispatch_get_specific(sRenderDispatchQueueSpecificKey))
  {
    id v4 = (void (*)(void *))a2[2];
    v4(a2);
  }
  else
  {
    dispatch_async(a1, a2);
  }
}

void sub_4BDF4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_r_pause");
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)v2[2];
  if (v3)
  {
    if ([v3 isActivated]) {
      [*(id *)(*(void *)(a1 + 32) + 16) deactivate];
    }
    if ([*(id *)(*(void *)(a1 + 32) + 16) isPreactivated]) {
      [*(id *)(*(void *)(a1 + 32) + 16) depreactivate:0];
    }
    [*(id *)(*(void *)(a1 + 32) + 16) cleanup];

    *(void *)(*(void *)(a1 + 32) + 16) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 32) + 40) + 304) = 0;

    *(void *)(*(void *)(*(void *)(a1 + 32) + 40) + 312) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 32) + 40) + 320) = 0;

    *(void *)(*(void *)(*(void *)(a1 + 32) + 40) + 328) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 32) + 40) + 336) = 0;

    *(void *)(*(void *)(*(void *)(a1 + 32) + 40) + 296) = 0;
    uint64_t v2 = *(void **)(a1 + 32);
  }
  id v4 = *(void **)(v2[5] + 8);
  if (v4)
  {
    [v4 purgeResources:1];
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 40) + 1008) releaseByUser];
    *(void *)(*(void *)(*(void *)(a1 + 32) + 40) + 1008) = 0;
    objc_msgSend(+[MRShaderManager sharedManager](MRShaderManager, "sharedManager"), "forgetContext:", *(void *)(*(void *)(*(void *)(a1 + 32) + 40) + 8));
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 40) + 8) cleanup];

    *(void *)(*(void *)(*(void *)(a1 + 32) + 40) + 8) = 0;
    uint64_t v2 = *(void **)(a1 + 32);
  }
  double v5 = (void *)v2[1];
  if (v5)
  {
    objc_msgSend(v5, "removeObserver:forKeyPath:");
    [*(id *)(*(void *)(a1 + 32) + 8) removeObserver:*(void *)(a1 + 32) forKeyPath:@"fadeInDuration"];
    [*(id *)(*(void *)(a1 + 32) + 8) removeObserver:*(void *)(a1 + 32) forKeyPath:@"fadeOutDuration"];

    *(void *)(*(void *)(a1 + 32) + 8) = 0;
  }
}

void sub_4C104(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  if (*(unsigned char *)(v2 + 141))
  {
    if (v3 || !*(void *)(*(void *)(v2 + 40) + 8)) {
      return;
    }
  }
  else if (v3)
  {
    if (v3 == [*(id *)(*(void *)(v2 + 40) + 8) glContext]) {
      return;
    }
    uint64_t v2 = *(void *)(a1 + 32);
  }
  [(id)v2 setScreenBurnTest:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(double *)(*(void *)(v4 + 40) + 240) > 0.0)
  {
    objc_msgSend((id)v4, "_r_endMorphing");
    uint64_t v4 = *(void *)(a1 + 32);
  }
  if (*(void *)(v4 + 16))
  {
    unsigned int v5 = [*(id *)(v4 + 16) isPreactivated];
    uint64_t v4 = *(void *)(a1 + 32);
    if (v5)
    {
      if (*(void *)(*(void *)(v4 + 40) + 296)) {
        [(id)v4 currentSlideshowTime];
      }
      else {
        [(id)v4 time];
      }
      objc_msgSend(*(id *)(a1 + 32), "_r_setTime:isResyncing:", 0);
      if ([*(id *)(*(void *)(a1 + 32) + 16) isActivated]) {
        [*(id *)(*(void *)(a1 + 32) + 16) deactivate];
      }
      [*(id *)(*(void *)(a1 + 32) + 16) depreactivate:0];
      uint64_t v4 = *(void *)(a1 + 32);
    }
  }
  *(CGSize *)(v4 + 24) = CGSizeZero;
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 40);
  if (*(void *)(v6 + 8))
  {
    [*(id *)(v6 + 1008) releaseByUser];
    *(void *)(*(void *)(*(void *)(a1 + 32) + 40) + 1008) = 0;
    objc_msgSend(+[MRShaderManager sharedManager](MRShaderManager, "sharedManager"), "forgetContext:", *(void *)(*(void *)(*(void *)(a1 + 32) + 40) + 8));
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 40) + 8) cleanup];

    *(void *)(*(void *)(*(void *)(a1 + 32) + 40) + 8) = 0;
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 40);
  }

  *(void *)(*(void *)(*(void *)(a1 + 32) + 40) + 1016) = 0;
  if (*(void *)(a1 + 40))
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 40) + 8) = -[MRContext initWithEAGLContext:andAssetManager:]([MRContext alloc], "initWithEAGLContext:andAssetManager:", *(void *)(a1 + 40), [*(id *)(a1 + 32) assetManagementDelegate]);
    id v7 = *(void **)(*(void *)(a1 + 32) + 16);
    if (v7)
    {
      [v7 preactivate];
      [*(id *)(a1 + 32) _time];
      objc_msgSend(objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "clock"), "setContainerTime:", v8);
      id v9 = *(void **)(*(void *)(a1 + 32) + 16);
      [v9 activate];
    }
  }
}

MRLayerParallelizer *sub_4C3BC(uint64_t a1)
{
  id result = *(MRLayerParallelizer **)(a1 + 32);
  if (!BYTE5(result->super.mPersistentState) || !*(void *)(a1 + 40) && result->super.mSuperlayer)
  {
    [(MRLayerParallelizer *)result _r_pause];
    [*(id *)(a1 + 32) setScreenBurnTest:0];
    id v3 = *(id **)(a1 + 32);
    if (v3[2])
    {
      if ([v3[2] isActivated]) {
        [*(id *)(*(void *)(a1 + 32) + 16) deactivate];
      }
      if ([*(id *)(*(void *)(a1 + 32) + 16) isPreactivated]) {
        [*(id *)(*(void *)(a1 + 32) + 16) depreactivate:0];
      }
      [*(id *)(*(void *)(a1 + 32) + 16) cleanup];

      *(void *)(*(void *)(a1 + 32) + 16) = 0;
      *(void *)(*(void *)(*(void *)(a1 + 32) + 40) + 304) = 0;

      *(void *)(*(void *)(*(void *)(a1 + 32) + 40) + 312) = 0;
      *(void *)(*(void *)(*(void *)(a1 + 32) + 40) + 320) = 0;

      *(void *)(*(void *)(*(void *)(a1 + 32) + 40) + 328) = 0;
      *(void *)(*(void *)(*(void *)(a1 + 32) + 40) + 336) = 0;

      *(void *)(*(void *)(*(void *)(a1 + 32) + 40) + 296) = 0;
      id v3 = *(id **)(a1 + 32);
    }
    [v3 willChangeValueForKey:@"montage"];
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 8);
    if (v4)
    {
      objc_msgSend(v4, "removeObserver:forKeyPath:");
      [*(id *)(*(void *)(a1 + 32) + 8) removeObserver:*(void *)(a1 + 32) forKeyPath:@"fadeInDuration"];
      [*(id *)(*(void *)(a1 + 32) + 8) removeObserver:*(void *)(a1 + 32) forKeyPath:@"fadeOutDuration"];

      *(void *)(*(void *)(a1 + 32) + 8) = 0;
    }
    *(void *)(*(void *)(a1 + 32) + 8) = *(id *)(a1 + 40);
    [*(id *)(a1 + 32) didChangeValueForKey:@"montage"];
    id result = *(MRLayerParallelizer **)(*(void *)(a1 + 32) + 8);
    if (result)
    {
      -[MRLayerParallelizer addObserver:forKeyPath:options:context:](result, "addObserver:forKeyPath:options:context:");
      [*(id *)(*(void *)(a1 + 32) + 8) addObserver:*(void *)(a1 + 32) forKeyPath:@"fadeInDuration" options:0 context:0];
      [*(id *)(*(void *)(a1 + 32) + 8) addObserver:*(void *)(a1 + 32) forKeyPath:@"fadeOutDuration" options:0 context:0];
      [*(id *)(a1 + 32) resetFadeInAndOut];
      objc_msgSend(*(id *)(a1 + 32), "_r_setTime:isResyncing:", 0, 0.0);
      objc_msgSend(objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "rootPlug"), "setLoopDuration:", 1.0e100);
      id result = -[MRLayerParallelizer initWithPlug:andParameters:inSuperlayer:]([MRLayerParallelizer alloc], "initWithPlug:andParameters:inSuperlayer:", [*(id *)(*(void *)(a1 + 32) + 8) rootPlug], *(void *)(*(void *)(a1 + 32) + 200), 0);
      *(void *)(*(void *)(a1 + 32) + 16) = result;
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(v5 + 40);
      if (*(void *)(v6 + 8))
      {
        [*(id *)(v5 + 16) updateGeometry];
        [*(id *)(*(void *)(a1 + 32) + 16) preactivate];
        id result = (MRLayerParallelizer *)[*(id *)(*(void *)(a1 + 32) + 16) activate];
        uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 40);
      }
      *(unsigned char *)(v6 + 211) = 1;
    }
  }
  return result;
}

id sub_4C7A0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_r_syncIsPlayingToOuter");
}

id sub_4C838(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_r_syncIsPlayingToOuter");
}

id sub_4CDBC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_r_renderWithPassParameters:", &off_1BBC58);
}

id sub_4CE48(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_r_renderWithPassParameters:", &off_1BBC80);
}

id sub_4CF98(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v4[0] = @"forceRendering";
  v4[1] = @"thumbnailPolicy";
  v5[0] = &__kCFBooleanTrue;
  v5[1] = +[NSNumber numberWithInt:1];
  id result = objc_msgSend(v2, "_r_renderWithPassParameters:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v5, v4, 2));
  if (*(unsigned char *)(a1 + 48)) {
    return (id)dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
  return result;
}

id sub_4D190(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_r_stopRenderTimer");
}

id sub_4D2E0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_r_updateTimeWithDisplayLinkTimestamp:", *(double *)(a1 + 40));
}

id sub_4D368(uint64_t a1)
{
  id result = *(id *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  if (result == (id)v3[8])
  {
    [result targetTimestamp];
    objc_msgSend(v3, "_r_updateTimeWithDisplayLinkTimestamp:");
    uint64_t v4 = *(void **)(a1 + 40);
    return objc_msgSend(v4, "_r_renderWithPassParameters:", 0);
  }
  return result;
}

void sub_4D5FC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

id sub_4D614(uint64_t a1)
{
  id result = objc_msgSend(*(id *)(a1 + 32), "_r_prerenderWithPassParameters:", *(void *)(a1 + 40));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (_BYTE)result;
  return result;
}

id sub_4DEF0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_r_render");
}

id sub_4F6B0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_r_syncTimeToOuter");
}

double *sub_4FA2C(double *result)
{
  uint64_t v1 = *((void *)result + 4);
  if (!*(unsigned char *)(v1 + 141))
  {
    *(double *)(v1 + 192) = result[5];
    if (*(void *)(*((void *)result + 4) + 64)) {
      return (double *)[*(id *)(*((void *)result + 4) + 64) setPreferredFramesPerSecond:llround(1.0 / result[5])];
    }
  }
  return result;
}

void sub_4FB18(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 141))
  {
    *(unsigned char *)(*(void *)(v1 + 40) + 209) = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 40) + 210) = 0;
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(v3 + 40);
    *(_OWORD *)(v3 + 24) = *(_OWORD *)(a1 + 40);
    *(_OWORD *)(v4 + 216) = *(_OWORD *)(a1 + 40);
    id v5 = [*(id *)(*(void *)(a1 + 32) + 8) layouts];
    uint64_t v8 = 0;
    id v9 = &v8;
    uint64_t v10 = 0x2020000000;
    char v11 = 0;
    v7[0] = 0;
    v7[1] = v7;
    v7[2] = 0x2020000000;
    v7[3] = 0x408F400000000000;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_4FC64;
    v6[3] = &unk_1AAB78;
    v6[4] = *(void *)(a1 + 32);
    v6[5] = v7;
    v6[6] = &v8;
    [v5 enumerateObjectsUsingBlock:v6];
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 40) + 120) setCurrentLayoutIndex:*((unsigned __int8 *)v9 + 24)];
    _Block_object_dispose(v7, 8);
    _Block_object_dispose(&v8, 8);
  }
}

void sub_4FC40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_4FC64(void *a1, void *a2, char a3)
{
  unsigned __int8 v6 = [a2 isEqualToString:@"3x2"];
  double v7 = 1.5;
  if ((v6 & 1) == 0)
  {
    if (objc_msgSend(a2, "isEqualToString:", @"2x3", 1.5))
    {
      double v7 = 0.666666667;
    }
    else if ([a2 isEqualToString:@"4x3"])
    {
      double v7 = 1.33333333;
    }
    else
    {
      unsigned __int8 v8 = [a2 isEqualToString:@"3x4"];
      double v7 = 0.75;
      if ((v8 & 1) == 0)
      {
        if (objc_msgSend(a2, "isEqualToString:", @"16x9", 0.75))
        {
          double v7 = 1.77777778;
        }
        else
        {
          unsigned __int8 v9 = [a2 isEqualToString:@"9x16"];
          double v7 = 0.5625;
          if ((v9 & 1) == 0)
          {
            NSLog(@"Unsupported aspect ratio!!!", 0.5625);
            double v7 = 1.0;
          }
        }
      }
    }
  }
  double v10 = vabdd_f64(*(double *)(a1[4] + 24) / *(double *)(a1[4] + 32), v7);
  if (v10 < *(double *)(*(void *)(a1[5] + 8) + 24))
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = a3;
    *(double *)(*(void *)(a1[5] + 8) + 24) = v10;
  }
}

__n128 sub_4FE34(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 141))
  {
    *(unsigned char *)(*(void *)(v1 + 40) + 210) = 1;
    __n128 result = *(__n128 *)(a1 + 40);
    *(__n128 *)(*(void *)(*(void *)(a1 + 32) + 40) + 216) = result;
  }
  return result;
}

__n128 sub_4FF20(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 141))
  {
    __n128 result = *(__n128 *)(a1 + 40);
    *(__n128 *)(*(void *)(v1 + 40) + 104) = result;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 40) + 209) = 1;
  }
  return result;
}

uint64_t sub_4FFFC(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 141))
  {
    *(unsigned char *)(*(void *)(v1 + 40) + 264) = (*(_DWORD *)(result + 40) - 1) < 4;
    *(_DWORD *)(*(void *)(result + 32) + 152) = *(_DWORD *)(result + 40);
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 40) + 209) = 1;
  }
  return result;
}

void *sub_501C8(void *result)
{
  uint64_t v1 = result[4];
  if (!*(unsigned char *)(v1 + 141)) {
    return [*(id *)(*(void *)(v1 + 40) + 120) setCurrentLayoutIndex:*((unsigned __int8 *)result + 40)];
  }
  return result;
}

void sub_502A0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 141))
  {
    if (*(_DWORD *)(a1 + 40) == 1 || *(_DWORD *)(v2 + 148) == 1)
    {
      [(id)v2 willChangeValueForKey:@"isOffscreen"];
      int v3 = 1;
    }
    else
    {
      int v3 = 0;
    }
    double v4 = MRGetCurrentTime();
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 40);
    double v6 = *(double *)(v5 + 152);
    double v7 = v4 - v6;
    double v8 = -1.0 - (v6 - v4 * 2.0);
    if (v7 < 1.0) {
      double v4 = v8;
    }
    *(double *)(v5 + 152) = v4;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 40) + 144) = *(_DWORD *)(*(void *)(a1 + 32) + 148);
    *(_DWORD *)(*(void *)(a1 + 32) + 148) = *(_DWORD *)(a1 + 40);
    if (v3)
    {
      unsigned __int8 v9 = *(void **)(a1 + 32);
      [v9 didChangeValueForKey:@"isOffscreen"];
    }
  }
}

id sub_50408(id result)
{
  uint64_t v1 = *((void *)result + 4);
  if (!*(unsigned char *)(v1 + 141))
  {
    uint64_t v2 = result;
    objc_storeWeak((id *)(v1 + 160), *((id *)result + 5));
    uint64_t v3 = v2[5];
    double v4 = *(void **)(*(void *)(v2[4] + 40) + 8);
    return [v4 setAssetManager:v3];
  }
  return result;
}

uint64_t sub_50534(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 141))
  {
    __n128 result = (uint64_t)objc_msgSend(*(id *)(v1 + 16), "sublayerForPlugObjectID:recursive:", objc_msgSend(*(id *)(result + 40), "objectID"), 1);
    if (result)
    {
      uint64_t v2 = (void *)result;
      objc_opt_class();
      __n128 result = objc_opt_isKindOfClass();
      if (result)
      {
        return (uint64_t)[v2 gotoNextSublayer:0 animate:1];
      }
    }
  }
  return result;
}

uint64_t sub_5063C(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 141))
  {
    __n128 result = (uint64_t)objc_msgSend(*(id *)(v1 + 16), "sublayerForPlugObjectID:recursive:", objc_msgSend(*(id *)(result + 40), "objectID"), 1);
    if (result)
    {
      uint64_t v2 = (void *)result;
      objc_opt_class();
      __n128 result = objc_opt_isKindOfClass();
      if (result)
      {
        return (uint64_t)[v2 gotoPreviousSublayer:0 animate:1];
      }
    }
  }
  return result;
}

void sub_507C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_507E0(uint64_t a1, uint64_t a2)
{
}

void sub_507F0(uint64_t a1)
{
}

uint64_t sub_507FC(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 141))
  {
    uint64_t v2 = result;
    __n128 result = (uint64_t)objc_msgSend(*(id *)(v1 + 16), "sublayerForPlugObjectID:recursive:", objc_msgSend(*(id *)(result + 40), "objectID"), 1);
    if (result)
    {
      uint64_t v3 = (void *)result;
      objc_opt_class();
      __n128 result = objc_opt_isKindOfClass();
      if (result)
      {
        __n128 result = (uint64_t)objc_msgSend(objc_msgSend(v3, "currentSublayer"), "plugAsHaven");
        *(void *)(*(void *)(*(void *)(v2 + 48) + 8) + 40) = result;
      }
    }
  }
  return result;
}

void sub_50964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_5097C(void *result)
{
  uint64_t v1 = result[4];
  if (!*(unsigned char *)(v1 + 141))
  {
    uint64_t v2 = result;
    [*(id *)(v1 + 8) lock];
    *(void *)(*(void *)(v2[5] + 8) + 40) = [*(id *)(v2[4] + 16) _currentState];
    [*(id *)(v2[4] + 8) unlock];
    uint64_t v3 = (void *)v2[4];
    double v4 = *(void **)(*(void *)(v2[5] + 8) + 40);
    [v3 _time];
    uint64_t v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    return [v4 setObject:v5 forKey:@"time"];
  }
  return result;
}

id sub_50A9C(id result)
{
  uint64_t v1 = (unsigned char *)*((void *)result + 4);
  if (!v1[141])
  {
    uint64_t v2 = result;
    objc_msgSend(objc_msgSend(*((id *)result + 5), "objectForKey:", @"time"), "doubleValue");
    objc_msgSend(v1, "_r_setTime:isResyncing:", 0);
    [*(id *)(*(void *)(v2[4] + 40) + 120) setForcedState:v2[5]];
    __n128 result = (id)v2[4];
    if (*((unsigned char *)result + 134))
    {
      return [result requestRendering:0];
    }
  }
  return result;
}

void *sub_50CE0(void *result)
{
  uint64_t v1 = result[4];
  if (!*(unsigned char *)(v1 + 141))
  {
    uint64_t v2 = result;
    [*(id *)(v1 + 8) lock];
    [*(id *)(*(void *)(v2[4] + 40) + 376) nearingEndForSerializer:v2[5]];
    uint64_t v3 = *(void **)(v2[4] + 8);
    return [v3 unlock];
  }
  return result;
}

void *sub_50DCC(void *result)
{
  uint64_t v1 = result[4];
  if (!*(unsigned char *)(v1 + 141))
  {
    uint64_t v2 = result;
    [*(id *)(v1 + 8) lock];
    [*(id *)(*(void *)(v2[4] + 40) + 376) effect:v2[5] requestedNumberOfSlides:v2[6] firstSlideIndexStillNeeded:v2[7]];
    uint64_t v3 = *(void **)(v2[4] + 8);
    return [v3 unlock];
  }
  return result;
}

id sub_51008(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_r_beginMorphingToAspectRatio:andOrientation:withDuration:", *(unsigned int *)(a1 + 56), *(double *)(a1 + 40), *(double *)(a1 + 48));
}

id sub_510B4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_r_endMorphing");
}

void getMem(void *a1, void *a2)
{
  long long v13 = 0u;
  memset(v14, 0, sizeof(v14));
  long long v11 = 0u;
  *(_OWORD *)host_info_out = 0u;
  *(_OWORD *)unsigned __int8 v9 = 0u;
  long long v10 = 0u;
  mach_msg_type_number_t host_info_outCnt = 15;
  mach_port_t v4 = mach_host_self();
  mach_error_t v5 = host_statistics(v4, 2, host_info_out, &host_info_outCnt);
  if (v5) {
    mach_error("can't get host_vm_info???\n", v5);
  }
  mach_msg_type_number_t host_info_outCnt = 12;
  mach_port_t v6 = mach_host_self();
  mach_error_t v7 = host_info(v6, 1, v9, &host_info_outCnt);
  if (v7) {
    mach_error("can't get host_basic_info???\n", v7);
  }
  *a2 = vm_page_size * host_info_out[0];
  *a1 = *((void *)&v11 + 1);
}

void sub_52D64(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_53194(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_534E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_534FC(uint64_t a1, uint64_t a2)
{
}

void sub_5350C(uint64_t a1)
{
}

uint64_t sub_53518(uint64_t a1, void *a2)
{
  mach_port_t v4 = *(void **)(a1 + 32);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (v4 == a2)
  {
    if ((isKindOfClass & 1) == 0) {
      [*(id *)(a1 + 40) _undimAllLayersInLayer:*(void *)(a1 + 32)];
    }
    uint64_t v6 = 0;
  }
  else if (isKindOfClass)
  {
    uint64_t v6 = 1;
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = objc_msgSend(a2, "sublayers", 0);
    id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v15;
      int v11 = 1;
      do
      {
        for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          if ([*(id *)(*((void *)&v14 + 1) + 8 * i) isActivated]) {
            v11 &= (*(uint64_t (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) + 16))();
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
    else
    {
      LOBYTE(v11) = 1;
    }
    uint64_t v6 = v11 & 1;
  }
  [a2 setIsDimmed:v6];
  return v6;
}

void sub_53768(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_53780(uint64_t a1, void *a2)
{
  [a2 setIsDimmed:0];
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if ((result & 1) == 0)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v5 = objc_msgSend(a2, "sublayers", 0);
    uint64_t result = (uint64_t)[v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (result)
    {
      uint64_t v6 = result;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v5);
          }
          (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 16))();
          ++v8;
        }
        while (v6 != v8);
        uint64_t result = (uint64_t)[v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
        uint64_t v6 = result;
      }
      while (result);
    }
  }
  return result;
}

unsigned char *sub_53938(uint64_t a1)
{
  uint64_t result = *(unsigned char **)(a1 + 32);
  if (!result[141]) {
    return [result _dimLayersExceptForPathTo:*(void *)(a1 + 40)];
  }
  return result;
}

id sub_539E0(uint64_t a1)
{
  id result = *(id *)(a1 + 32);
  if (!*((unsigned char *)result + 141)) {
    return [result _undimAllLayersInLayer:*((void *)result + 2)];
  }
  return result;
}

void *sub_53FF4(void *result)
{
  uint64_t v1 = result[4];
  if (!*(unsigned char *)(v1 + 141))
  {
    uint64_t v2 = result;
    *(unsigned char *)(*(void *)(v1 + 40) + 392) = *((unsigned char *)result + 40);
    uint64_t v3 = *(void *)(result[4] + 40);
    if (*(unsigned char *)(v3 + 392))
    {
      *(void *)(v3 + 400) = 0;
    }
    else
    {
      [*(id *)(v3 + 408) cleanup];
      [*(id *)(*(void *)(v2[4] + 40) + 408) releaseByUser];
      *(void *)(*(void *)(v2[4] + 40) + 408) = 0;
      [*(id *)(*(void *)(v2[4] + 40) + 416) cleanup];
      id result = [*(id *)(*(void *)(v2[4] + 40) + 416) releaseByUser];
      *(void *)(*(void *)(v2[4] + 40) + 416) = 0;
    }
  }
  return result;
}

id sub_54A64(uint64_t a1)
{
  for (uint64_t i = 320; i != 344; i += 8)
    id result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 40) + i) setAssetPath:0 ofSlide:@"image0"];
  return result;
}

void sub_54D24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_54D3C(uint64_t a1)
{
  id result = objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "_layerForPlugObjectID:", *(void *)(*(void *)(*(void *)(a1 + 32) + 40) + 296)), "currentSublayer"), "currentSlideInfoForElement:", *(void *)(a1 + 40));
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
  return result;
}

void sub_54E58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_54E70(uint64_t a1)
{
  id result = objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "_layerForPlugObjectID:", *(void *)(*(void *)(*(void *)(a1 + 32) + 40) + 296)), "currentSublayer"), "currentSlideInfos");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

id sub_54F28(uint64_t a1)
{
  uint64_t v2 = +[NSNotificationCenter defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  return [(NSNotificationCenter *)v2 postNotificationName:v3 object:v4];
}

void sub_551E4(uint64_t a1, int a2)
{
  uint64_t state64 = 0;
  uint64_t state = notify_get_state(a2, &state64);
  if (state)
  {
    NSLog(@"notify_get_state failed (%u) for kOSThermalNotificationPressureLevelName", state);
  }
  else
  {
    notify_suspend(a2);
    uint64_t v6 = state64;
    NSLog(@"OS thermal pressure level changed to %d", state64);
    [*(id *)(a1 + 32) _adaptToPressureLevel:v6];
    notify_resume(a2);
  }
}

void sub_586CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_58D6C(id a1, MRLayer *a2, unint64_t a3, BOOL *a4)
{
  if ([(MRLayer *)a2 isPreactivated])
  {
    [(MRLayer *)a2 synchronizeTime];
  }
}

id sub_58E30(uint64_t a1, void *a2)
{
  id result = [a2 isPreactivated];
  if (result)
  {
    objc_msgSend(objc_msgSend(a2, "plugAsParallel"), "aspectRatioForParentAspectRatio:", *(double *)(a1 + 32));
    return objc_msgSend(a2, "beginMorphingToAspectRatio:withDuration:");
  }
  return result;
}

void sub_58EAC(id a1, MRLayer *a2, unint64_t a3, BOOL *a4)
{
  if ([(MRLayer *)a2 isPreactivated])
  {
    [(MRLayer *)a2 endMorphing];
  }
}

id sub_58FA4(uint64_t a1, void *a2)
{
  id result = [a2 isPreactivated];
  if (result)
  {
    double v5 = *(double *)(a1 + 32);
    [a2 timeIn];
    double v7 = v5 - v6;
    return [a2 setDuration:v7];
  }
  return result;
}

void sub_59108(id a1, MRLayer *a2, unint64_t a3, BOOL *a4)
{
  if ([(MRLayer *)a2 isActivated])
  {
    [(MRLayer *)a2 deactivate];
  }
}

id sub_59200(uint64_t a1, void *a2)
{
  id result = [a2 isPreactivated];
  if (result)
  {
    [*(id *)(a1 + 32) _unobserveSublayerOnDepreactivate:a2];
    uint64_t v5 = *(unsigned __int8 *)(a1 + 40);
    return [a2 depreactivate:v5];
  }
  return result;
}

void sub_59E1C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_5A088(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_5A238(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_5A318(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_5A4B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_5B384(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_5BBB8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

int64_t sub_5BC08(id a1, MRLayer *a2, MRLayer *a3)
{
  unsigned int v4 = [(MCPlugParallel *)[(MRLayer *)a2 plugAsParallel] zIndex];
  unsigned int v5 = [(MCPlugParallel *)[(MRLayer *)a3 plugAsParallel] zIndex];
  if (v4 < v5) {
    return -1;
  }
  else {
    return v5 < v4;
  }
}

void sub_5BD2C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_5BDF0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

double mathParser::deg2rad<double>(double a1)
{
  return a1 * 3.14159265 / 180.0;
}

double mathParser::rad2deg<double>(double a1)
{
  return a1 * 180.0 / 3.14159265;
}

double mathParser::sin<double>(double a1)
{
  return sin(a1 * 3.14159265 / 180.0);
}

double mathParser::cos<double>(double a1)
{
  return cos(a1 * 3.14159265 / 180.0);
}

double mathParser::tan<double>(double a1)
{
  return tan(a1 * 3.14159265 / 180.0);
}

double mathParser::sqrt<double>(double a1)
{
  return sqrt(a1);
}

double mathParser::fabs<double>(double a1)
{
  return fabs(a1);
}

long double mathParser::asin<double>(long double a1)
{
  return asin(a1) * 180.0 / 3.14159265;
}

long double mathParser::acos<double>(long double a1)
{
  return acos(a1) * 180.0 / 3.14159265;
}

long double mathParser::atan<double>(long double a1)
{
  return atan(a1) * 180.0 / 3.14159265;
}

double mathParser::ceil<double>(double a1)
{
  return ceil(a1);
}

double mathParser::round<double>(double a1)
{
  return round(a1);
}

double mathParser::floor<double>(double a1)
{
  return floor(a1);
}

long double mathParser::atan2<double>(long double a1, long double a2)
{
  return atan2(a1, a2) * 180.0 / 3.14159265;
}

float mathParser::deg2rad<float>(float a1)
{
  return (float)(a1 * 3.1416) / 180.0;
}

float mathParser::rad2deg<float>(float a1)
{
  return (float)(a1 * 180.0) / 3.14159265;
}

float mathParser::sin<float>(float a1)
{
  return sinf((float)(a1 * 3.1416) / 180.0);
}

float mathParser::cos<float>(float a1)
{
  return cosf((float)(a1 * 3.1416) / 180.0);
}

float mathParser::tan<float>(float a1)
{
  return tanf((float)(a1 * 3.1416) / 180.0);
}

float mathParser::sqrt<float>(float a1)
{
  return sqrtf(a1);
}

float mathParser::fabs<float>(float a1)
{
  return fabsf(a1);
}

float mathParser::asin<float>(float a1)
{
  return (float)(asinf(a1) * 180.0) / 3.14159265;
}

float mathParser::acos<float>(float a1)
{
  return (float)(acosf(a1) * 180.0) / 3.14159265;
}

float mathParser::atan<float>(float a1)
{
  return (float)(atanf(a1) * 180.0) / 3.14159265;
}

float mathParser::ceil<float>(float a1)
{
  return ceilf(a1);
}

float mathParser::round<float>(float a1)
{
  return roundf(a1);
}

float mathParser::floor<float>(float a1)
{
  return floorf(a1);
}

float mathParser::atan2<float>(float a1, float a2)
{
  return (float)(atan2f(a1, a2) * 180.0) / 3.14159265;
}

void mathParser::number2cString<double>()
{
}

void mathParser::number2cString<float>()
{
}

BOOL mathParser::isValueFallOnSinCosZeroCycle<double>(int a1, long double a2)
{
  if (a1 == 90) {
    return fmod(a2 / 90.0, 2.0) == 1.0;
  }
  else {
    return fmod(a2, (double)a1) == 0.0;
  }
}

BOOL mathParser::isValueFallOnSinCosZeroCycle<float>(int a1, float a2)
{
  if (a1 == 90) {
    return fmodf(a2 / 90.0, 2.0) == 1.0;
  }
  else {
    return fmodf(a2, (float)a1) == 0.0;
  }
}

void sub_5D31C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_5F4A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  objc_sync_exit(v15);
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_5F4C8(uint64_t a1, uint64_t a2)
{
}

void sub_5F4D8(uint64_t a1)
{
}

id sub_5F4E4(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id result = objc_msgSend(objc_msgSend(objc_msgSend(a2, "plugAsHaven"), "idInSupercontainer"), "isEqualToString:", *(void *)(a1 + 32));
  *a4 = (_BYTE)result;
  if (result) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = a2;
  }
  return result;
}

void sub_5F650(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_5F7EC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_603D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_60564(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_60630(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_60700(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_60A6C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_61B28(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_6362C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_63718(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_6383C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_639A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_63A7C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_651B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_655D4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_65644(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_67250(_Unwind_Exception *exception_object)
{
}

void sub_674B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_67520(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_67658(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_67750(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_677F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_67860(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_678E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_67A4C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_67BB0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_67C84(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_67DA8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_68018(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_68120(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_68684(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_68948(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_689E8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_68B48(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_6961C(id a1)
{
  if (qword_1F1320 != -1) {
    dispatch_once(&qword_1F1320, &stru_1AAEC8);
  }
}

void sub_69644(id a1)
{
}

void sub_698C4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_698DC(uint64_t a1, unsigned char *a2, float a3)
{
  float v5 = a3 * 0.1 + 0.0;
  uint64_t result = (*(uint64_t (**)(float))(*(void *)(a1 + 32) + 16))(v5);
  *a2 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

uint64_t sub_69944(uint64_t a1, unsigned char *a2, float a3)
{
  float v5 = a3 * 0.1 + 0.0;
  uint64_t result = (*(uint64_t (**)(float))(*(void *)(a1 + 32) + 16))(v5);
  *a2 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

uint64_t sub_699AC(uint64_t a1, unsigned char *a2, float a3)
{
  float v5 = a3 * 0.1 + 0.0;
  uint64_t result = (*(uint64_t (**)(float))(*(void *)(a1 + 32) + 16))(v5);
  *a2 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

id sub_6B128(uint64_t a1, uint64_t a2, void *a3)
{
  if ([a3 attributedText])
  {
    id v6 = [a3 attributedText];
  }
  else
  {
    id result = [a3 text];
    if (!result) {
      return result;
    }
    id v6 = [a3 text];
  }
  id v8 = v6;
  long long v9 = *(void **)(a1 + 32);
  return [v9 setObject:v8 forKeyedSubscript:a2];
}

id sub_6B248(uint64_t a1, uint64_t a2, void *a3)
{
  id result = [a3 duration];
  if (v7 >= 0.0)
  {
    [a3 duration];
    id v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    long long v9 = *(void **)(a1 + 32);
    return [v9 setObject:v8 forKeyedSubscript:a2];
  }
  return result;
}

void sub_6B328(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_6B538(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_6B590(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_6B608(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_6B6A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_6B770(uint64_t a1, void *a2)
{
  objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"offset"), "CGPointValue");
  objc_msgSend(a2, "setOffset:");
  return [a2 setScale:1.0];
}

id sub_6B9B0(uint64_t a1, void *a2)
{
  return [a2 updateWithText:*(void *)(a1 + 32)];
}

void sub_6C25C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_6C2CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_70330(_Unwind_Exception *exception_object)
{
}

void sub_706F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_707F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_70874(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_70A0C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_70BB0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_70DC0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_71060(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_7152C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_7185C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_71B5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_71DC4(_Unwind_Exception *exception_object)
{
}

void sub_71E64(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_71F50(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_71FC8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_72160(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_72304(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_72840(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_72C24(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_72F38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_73198(_Unwind_Exception *exception_object)
{
}

void sub_73220(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_732F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_733C4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_73424(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_734AC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_7377C(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_73958(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_739F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_73AAC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_73B74(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_73C28(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_73CC8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_78898(uint64_t a1)
{
  +[CATransaction begin];
  [*(id *)(*(void *)(a1 + 32) + 8) bounds];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "setFrame:");
  +[CATransaction commit];
  [*(id *)(*(void *)(a1 + 32) + 48) warmupRenderer];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_78974;
  block[3] = &unk_1AAFE8;
  char v4 = *(unsigned char *)(a1 + 48);
  long long v3 = *(_OWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_78974(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_789F4;
  v2[3] = &unk_1AAFE8;
  char v3 = *(unsigned char *)(a1 + 48);
  return [*(id *)(a1 + 32) enterMarimbaWithDuration:v2 andCompletionBlock:0.5];
}

uint64_t sub_789F4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    [*(id *)(*(void *)(a1 + 32) + 48) play];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    char v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t sub_78BB8(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 41) = 1;
  *(void *)(*(void *)(a1 + 32) + 32) = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 42)) {
    [*(id *)(v2 + 24) setHidden:1];
  }
  if ([+[NSUserDefaults standardUserDefaults] objectForKey:@"touchVisualFeedback"])
  {
    BOOL v3 = [+[NSUserDefaults standardUserDefaults] BOOLForKey:@"touchVisualFeedback"];
  }
  else
  {
    BOOL v3 = 0;
  }
  objc_msgSend(objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "renderer"), "setDisplaysTouchVisualFeedback:", v3);
  if ([+[NSUserDefaults standardUserDefaults] objectForKey:@"MRDisplaysPlayingIDs"])
  {
    BOOL v4 = [+[NSUserDefaults standardUserDefaults] BOOLForKey:@"MRDisplaysPlayingIDs"];
  }
  else
  {
    BOOL v4 = 0;
  }
  objc_msgSend(objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "renderer"), "setDisplaysPlayingIDs:", v4);
  if ([+[NSUserDefaults standardUserDefaults] objectForKey:@"MRDisplaysFPS"])
  {
    BOOL v5 = [+[NSUserDefaults standardUserDefaults] BOOLForKey:@"MRDisplaysFPS"];
  }
  else
  {
    BOOL v5 = 0;
  }
  objc_msgSend(objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "renderer"), "setDisplaysFPS:", v5);
  [*(id *)(*(void *)(a1 + 32) + 8) setUserInteractionEnabled:1];
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 0;
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

id sub_79160(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) setHidden:0];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  return [v2 setAlpha:1.0];
}

id sub_791B4(uint64_t a1)
{
  return [*(id *)(a1 + 32) hideHUD];
}

id sub_792B4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) setAlpha:0.0];
}

void *sub_792CC(void *result)
{
  uint64_t v1 = result[4];
  if (!*(void *)(v1 + 32)) {
    return [*(id *)(v1 + 24) setHidden:1];
  }
  return result;
}

void sub_7AEC0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_7AFF4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_7B0E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_7B190(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_83888(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_83948(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_839C0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_83A7C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_83E84(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL MCStringToVector@<W0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  BOOL v3 = +[NSScanner scannerWithString:](NSScanner, "scannerWithString:", objc_msgSend(a1, "stringByTrimmingCharactersInSet:", +[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", @"[] {},()")));
  uint64_t v4 = 0;
  uint64_t v5 = a2 + 4;
  do
  {
    BOOL result = [(NSScanner *)v3 isAtEnd];
    if (result) {
      break;
    }
    ++v4;
    [(NSScanner *)v3 scanFloat:v5];
    BOOL result = [(NSScanner *)v3 scanString:@"," intoString:0];
    v5 += 4;
  }
  while (v4 != 4);
  *(unsigned char *)a2 = v4;
  return result;
}

CFStringRef MCVectorToString(uint64_t a1)
{
  switch(*(unsigned char *)a1)
  {
    case 1:
      CFStringRef result = +[NSString stringWithFormat:@"[%f]", *(float *)(a1 + 4), v2, v3, v4];
      break;
    case 2:
      CFStringRef result = +[NSString stringWithFormat:@"[%f %f]", *(float *)(a1 + 4), *(float *)(a1 + 8), v3, v4];
      break;
    case 3:
      CFStringRef result = +[NSString stringWithFormat:@"[%f %f %f]", *(float *)(a1 + 4), *(float *)(a1 + 8), *(float *)(a1 + 12), v4];
      break;
    case 4:
      CFStringRef result = +[NSString stringWithFormat:@"[%f %f %f %f]", *(float *)(a1 + 4), *(float *)(a1 + 8), *(float *)(a1 + 12), *(float *)(a1 + 16)];
      break;
    default:
      CFStringRef result = @"[]";
      break;
  }
  return result;
}

void sub_85478(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(v10);
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_8563C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_856DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_858E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_85A78(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_85CA8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_85EC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
}

void sub_8649C(_Unwind_Exception *exception_object)
{
}

void sub_866B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_86748(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_868BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_868D0(uint64_t a1, void *a2, void *a3)
{
  +[MCAnimationPathKeyframed timeForKeyframe:a2 withPlugTiming:*(void *)(a1 + 32)];
  double v7 = v6;
  +[MCAnimationPathKeyframed timeForKeyframe:a3 withPlugTiming:*(void *)(a1 + 32)];
  if (v7 < v8) {
    return -1;
  }
  if (v7 > v8) {
    return 1;
  }
  objc_opt_class();
  double v10 = 0.0;
  double v11 = 0.0;
  if (objc_opt_isKindOfClass())
  {
    [a2 duration];
    double v11 = v12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [a3 duration];
    double v10 = v13;
  }
  if (v11 > v10) {
    return 1;
  }
  else {
    return -1;
  }
}

uint64_t sub_869AC(uint64_t a1, void *a2, void *a3)
{
  +[MCAnimationPathKeyframed timeForKeyframe:a2 withPlugTiming:*(void *)(a1 + 32)];
  double v7 = v6;
  +[MCAnimationPathKeyframed timeForKeyframe:a3 withPlugTiming:*(void *)(a1 + 32)];
  if (v7 < v8) {
    return -1;
  }
  if (v7 > v8) {
    return 1;
  }
  objc_opt_class();
  double v10 = 0.0;
  double v11 = 0.0;
  if (objc_opt_isKindOfClass())
  {
    [a2 duration];
    double v11 = v12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [a3 duration];
    double v10 = v13;
  }
  if (v11 > v10) {
    return 1;
  }
  else {
    return -1;
  }
}

id TimeForKeyframeAttributesInPlug(id result, uint64_t a2, void *a3)
{
  if (a3)
  {
    if ((int)result > 100)
    {
      switch(result)
      {
        case 'e':
          return [a3 phaseInDuration];
        case 'f':
LABEL_19:
          [a3 phaseInDuration];
          [a3 loopDuration];
          return [a3 numberOfLoops];
        case 'g':
          return [a3 fullDuration];
      }
    }
    else
    {
      switch((int)result)
      {
        case 0:
          return [a3 fullDuration];
        case 1:
          return [a3 phaseInDuration];
        case 2:
          return [a3 phaseInDuration];
        case 3:
        case 4:
          goto LABEL_19;
        case 5:
          [a3 phaseInDuration];
          [a3 loopDuration];
          [a3 numberOfLoops];
          goto LABEL_15;
        case 6:
          [a3 fullDuration];
LABEL_15:
          CFStringRef result = [a3 phaseOutDuration];
          break;
        case 7:
          CFStringRef result = [a3 fullDuration];
          break;
        default:
          return result;
      }
    }
  }
  return result;
}

void sub_86EF0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_86FE0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_87180(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id *ValueFromBezierPath(id *result, double *a2, double a3, double a4, double a5, uint64_t a6, uint64_t a7)
{
  if (a5 >= 0.0 && a7 >= 2)
  {
    double v7 = a2[1];
    if (v7 >= a5)
    {
      double v9 = *a2;
      uint64_t v10 = 1;
      return (id *)[result[v10 - 1] evaluatAtTime:(a5 - v9) / (v7 - v9)];
    }
    else
    {
      uint64_t v8 = 0;
      while (a7 - 2 != v8)
      {
        double v9 = v7;
        double v7 = a2[v8++ + 2];
        if (v7 >= a5)
        {
          uint64_t v10 = v8 + 1;
          return (id *)[result[v10 - 1] evaluatAtTime:(a5 - v9) / (v7 - v9)];
        }
      }
    }
  }
  return result;
}

CGFloat CGRectFromCAMLString(void *a1)
{
  if (a1)
  {
    CGPoint origin = (CGPoint)0;
    CGSize v4 = (CGSize)0;
    sscanf((const char *)[a1 UTF8String], "%lf %lf %lf %lf", &origin, &origin.y, &v4, &v4.height);
  }
  else
  {
    CGSize size = CGRectZero.size;
    CGPoint origin = CGRectZero.origin;
    CGSize v4 = size;
  }
  return origin.x;
}

CGFloat CGPointFromCAMLString(void *a1)
{
  if (a1)
  {
    CGPoint v2 = (CGPoint)0;
    sscanf((const char *)[a1 UTF8String], "%lf %lf", &v2, &v2.y);
  }
  else
  {
    CGPoint v2 = CGPointZero;
  }
  return v2.x;
}

BOOL IsZRotationCAMLString(void *a1)
{
  [a1 rangeOfString:@","];
  return v1 == 0;
}

double NewZRotationFromCAMLString(void *a1)
{
  double v2 = 0.0;
  if (!a1) {
    return 0.0;
  }
  sscanf((const char *)[a1 UTF8String], "rotate(%lfdeg)", &v2);
  return v2;
}

void *NewRotationFromCAMLString(void *a1)
{
  double v2 = malloc_type_malloc(0x20uLL, 0x100004000313F17uLL);
  if (a1)
  {
    [a1 rangeOfString:@","];
    if (v3)
    {
      sscanf((const char *)[a1 UTF8String], "rotate(%lfdeg, %lf, %lf, %lf)", v2, v2 + 1, v2 + 2, v2 + 3);
    }
    else
    {
      v2[1] = 0;
      v2[2] = 0;
      uint64_t v5 = 0;
      sscanf((const char *)[a1 UTF8String], "rotate(%lfdeg)", &v5);
      *double v2 = v5;
      v2[3] = 0x3FF0000000000000;
    }
  }
  return v2;
}

char *NewTranslationFromCAMLString(void *a1)
{
  double v2 = (char *)malloc_type_malloc(0x18uLL, 0x100004000313F17uLL);
  if (a1) {
    sscanf((const char *)[a1 UTF8String], "translate(%lf, %lf, %lf)", v2, v2 + 8, v2 + 16);
  }
  return v2;
}

char *NewScaleFromCAMLString(void *a1)
{
  double v2 = (char *)malloc_type_malloc(0x18uLL, 0x100004000313F17uLL);
  if (a1) {
    sscanf((const char *)[a1 UTF8String], "scale(%lf, %lf, %lf)", v2, v2 + 8, v2 + 16);
  }
  return v2;
}

uint64_t MainProgressCallback(uint64_t a1, double a2, double a3, double a4)
{
  LODWORD(a3) = *(_DWORD *)(a1 + 16);
  LODWORD(a4) = *(_DWORD *)(a1 + 20);
  return (*(uint64_t (**)(void, double))a1)(*(void *)(a1 + 8), (a2 + (double)*(unint64_t *)&a3 * 100.0) / (double)*(unint64_t *)&a4);
}

void sub_89040(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_890B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_898D8()
{
}

void sub_89EF8()
{
}

void sub_8A710(_Unwind_Exception *exception_object)
{
}

void sub_8A8F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_8A988(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_8AA30(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_8ABBC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_8AC30(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_8AC9C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_8AD60(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_8BD38(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_8C0D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_8D968(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

int64_t sub_8D9F8(NSIndexSet *self, SEL a2, int64_t a3)
{
  int64_t v5 = [(NSIndexSet *)self firstIndex];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL && a3)
  {
    int64_t v6 = a3 - 1;
    do
    {
      int64_t v7 = v6;
      int64_t v5 = [(NSIndexSet *)self indexGreaterThanIndex:v5];
      if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      int64_t v6 = v7 - 1;
    }
    while (v7);
  }
  return v5;
}

NSIndexSet *__cdecl sub_8DA68(NSIndexSet *self, SEL a2, int64_t a3)
{
  int64_t v5 = (NSIndexSet *)+[NSMutableIndexSet indexSet];
  NSUInteger v6 = [(NSIndexSet *)self firstIndex];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (NSUInteger i = v6; i != 0x7FFFFFFFFFFFFFFFLL; NSUInteger i = [(NSIndexSet *)self indexGreaterThanIndex:i])
      [(NSIndexSet *)v5 addIndex:i + a3];
  }
  return v5;
}

NSIndexSet *__cdecl sub_8DAEC(NSIndexSet *self, SEL a2, int64_t a3)
{
  int64_t v5 = (NSIndexSet *)+[NSMutableIndexSet indexSet];
  NSUInteger v6 = [(NSIndexSet *)self firstIndex];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (int64_t i = v6; i != 0x7FFFFFFFFFFFFFFFLL; int64_t i = [(NSIndexSet *)self indexGreaterThanIndex:i])
    {
      if (i <= a3) {
        [(NSIndexSet *)v5 addIndex:i];
      }
    }
  }
  return v5;
}

void sub_90B90(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_90C1C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_90C9C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_90D30(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_91C24(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_91C94(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_9395C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_939CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_93FC0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_94BA8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_94C18(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL NSStringHasPrefix(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (!v4) {
    return 1;
  }
  size_t v5 = v4;
  if ([a1 characterAtIndex:0] != *__s) {
    return 0;
  }
  uint64_t v6 = 1;
  do
  {
    unint64_t v7 = v6;
    if (v5 == v6) {
      break;
    }
    unsigned int v8 = [a1 characterAtIndex:v6];
    uint64_t v6 = v7 + 1;
  }
  while (v8 == __s[v7]);
  return v7 >= v5;
}

BOOL NSStringIsEqual(void *a1, id a2)
{
  return objc_msgSend(a1, "cStringUsingEncoding:", objc_msgSend(a1, "fastestEncoding")) == a2;
}

BOOL NSStringHasSuffix(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  size_t v5 = (char *)[a1 length];
  if (!v4) {
    return 1;
  }
  uint64_t v6 = &v5[-v4];
  if ([a1 characterAtIndex:&v5[-v4]] != *__s) {
    return 0;
  }
  uint64_t v7 = 1;
  do
  {
    size_t v8 = v7;
    if (v4 == v7) {
      break;
    }
    unsigned int v9 = [a1 characterAtIndex:&v6[v7]];
    uint64_t v7 = v8 + 1;
  }
  while (v9 == __s[v8]);
  return v8 >= v4;
}

NSString *ImageKey(int64_t a1)
{
  if (a1 <= 14) {
    return (NSString *)*(&off_1AB2E8 + a1);
  }
  qmemcpy(__s, "image", 5);
  AppendIntToString(a1, __s, 5uLL);
  return +[NSString stringWithCString:__s encoding:1];
}

NSString *NSStringWithInteger(const char *a1, unint64_t a2)
{
  strlen(a1);
  __strncpy_chk();
  size_t v4 = strlen(a1);
  AppendIntToString(a2, __s, v4);
  return +[NSString stringWithCString:__s encoding:1];
}

char *AppendIntToString(unint64_t a1, char *__s, size_t a3)
{
  size_t v3 = a3;
  size_t v5 = __s;
  do
  {
    v5[a3] = a0123456789[a1 % 0xA];
    ++v5;
    BOOL v6 = a1 > 9;
    a1 /= 0xAuLL;
  }
  while (v6);
  v5[a3] = 0;
  for (size_t i = strlen(__s) - 1; v3 < i; --i)
  {
    char v8 = __s[v3] ^ __s[i];
    __s[v3] = v8;
    char v9 = __s[i] ^ v8;
    __s[i] = v9;
    __s[v3++] ^= v9;
  }
  return __s;
}

void *NSIntegerFromString(void *result, unint64_t a2)
{
  if (result)
  {
    size_t v3 = (const char *)objc_msgSend(result, "cStringUsingEncoding:", objc_msgSend(result, "fastestEncoding"));
    size_t v4 = strlen(v3);
    size_t v5 = v4 - a2;
    if (v4 <= a2) {
      size_t v5 = 0;
    }
    else {
      memcpy(__dst, &v3[a2], v5);
    }
    __dst[v5] = 0;
    return (void *)atoi(__dst);
  }
  return result;
}

double Spline1(double result, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  if (a3 != a2 || a4 != a5 || a6 != a7 || a8 != a9)
  {
    double v20 = 0.25;
    double v21 = 0.5;
    double v22 = 0.5;
    while (1)
    {
      double v23 = v21 * (v21 * v21);
      double v24 = v21 * 3.0;
      double v25 = v22 * (v21 * (v21 * 3.0));
      double v26 = v22 * (v22 * v24);
      double v27 = v22 * (v22 * v22);
      double v28 = v25 * a3 + v23 * a2 + v26 * a4 + v27 * a5;
      if (v28 == result) {
        break;
      }
      double v29 = -v20;
      if (v28 <= result) {
        double v29 = v20;
      }
      double v22 = v22 + v29;
      double v21 = 1.0 - v22;
      double v20 = v20 * 0.5;
      if (v20 <= 0.0000610351562)
      {
        double v23 = v21 * (v21 * v21);
        double v30 = v21 * 3.0;
        double v25 = v22 * (v21 * (v21 * 3.0));
        double v26 = v22 * (v22 * v30);
        double v27 = v22 * (v22 * v22);
        return v25 * a7 + v23 * a6 + v26 * a8 + v27 * a9;
      }
    }
    return v25 * a7 + v23 * a6 + v26 * a8 + v27 * a9;
  }
  return result;
}

double ValueForScalarAnimationPath(void *a1, void *a2, void *a3, void *a4, double a5, double a6)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = [a1 animationPaths];
    unsigned int v13 = objc_msgSend(objc_msgSend(a1, "combineOperation"), "isEqualToString:", @"mul");
    long long v99 = 0u;
    long long v100 = 0u;
    if (v13) {
      double v14 = 1.0;
    }
    else {
      double v14 = 0.0;
    }
    long long v101 = 0uLL;
    long long v102 = 0uLL;
    id v15 = [v12 countByEnumeratingWithState:&v99 objects:v103 count:16];
    if (v15)
    {
      id v16 = v15;
      int v17 = 0;
      uint64_t v18 = *(void *)v100;
      double v19 = v14;
      do
      {
        for (size_t i = 0; i != v16; size_t i = (char *)i + 1)
        {
          if (*(void *)v100 != v18) {
            objc_enumerationMutation(v12);
          }
          double v21 = *(void **)(*((void *)&v99 + 1) + 8 * i);
          v17 |= [v21 isTriggered] ^ 1;
          double v22 = ValueForScalarAnimationPath(v21, a2, a3, a4, a5, v14);
          double v23 = v19 * v22;
          double v24 = v19 + v22;
          if (v13) {
            double v19 = v23;
          }
          else {
            double v19 = v24;
          }
        }
        id v16 = [v12 countByEnumeratingWithState:&v99 objects:v103 count:16];
      }
      while (v16);
      if (v17) {
        return v19;
      }
    }
    else
    {
      double v19 = v14;
    }
    if (v13) {
      return v19 * a6;
    }
    else {
      return v19 + a6;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (!qword_1F1358) {
      qword_1F1358 = (uint64_t)objc_alloc_init((Class)NSMutableDictionary);
    }
    id v25 = [a1 expression];
    double v26 = (MUMathExpressionFloatBased *)[(id)qword_1F1358 objectForKey:v25];
    if (v26)
    {
      double v27 = v26;
      [(MUMathExpressionFloatBased *)v26 resetAllVariables];
    }
    else
    {
      v42 = [[MUMathExpressionFloatBased alloc] initWithString:v25 error:0];
      double v19 = a6;
      if (!v42) {
        return v19;
      }
      double v27 = v42;
      [(id)qword_1F1358 setObject:v42 forKey:v25];
    }
    [a3 applyToMathExpression:v27 atTime:a5];
    *(float *)&double v43 = a5;
    [(MUMathExpressionFloatBased *)v27 setValue:@"_time" forVariable:v43];
    [(MUMathExpressionFloatBased *)v27 evaluate];
    return v41;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    double v19 = 0.0;
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return v19;
    }
    [a1 computeValueForTime:a3 withContext:a5];
    return v41;
  }
  id v28 = [a1 orderedKeyframesWithPlugTiming:a2];
  double v29 = (char *)[v28 count];
  unsigned int v30 = [a1 isTriggered];
  if (!v30)
  {
    a4 = 0;
    id v39 = 0;
    id v40 = 0;
    if (v29) {
      goto LABEL_48;
    }
    return a6;
  }
  id v31 = objc_msgSend(objc_msgSend(a1, "key"), "rangeOfString:", @":");
  id v32 = [a1 key];
  id v33 = v32;
  if (v31 != (id)0x7FFFFFFFFFFFFFFFLL) {
    id v33 = [v32 substringToIndex:v31];
  }
  if (!a4 || (id v34 = [a4 objectForKey:v33], (a4 = v34) == 0))
  {
    id v39 = 0;
    id v40 = 0;
    a5 = -1.0;
    if (v29) {
      goto LABEL_48;
    }
    return a6;
  }
  id v35 = [v34 action];
  [v35 time];
  a5 = a5 - v36;
  [a4 rearmIfNeededWithDefaultValue:a6];
  a6 = v37;
  id v38 = [v35 states];
  if ([v38 count]) {
    id v39 = v38;
  }
  else {
    id v39 = 0;
  }
  id v40 = [a4 animationAttributes];
  if (![v40 count]) {
    id v40 = 0;
  }
  if (!v29) {
    return a6;
  }
LABEL_48:
  if (a5 <= 0.0) {
    char v44 = v30;
  }
  else {
    char v44 = 0;
  }
  if (v44) {
    return a6;
  }
  if (v29 == (unsigned char *)&dword_0 + 1) {
    char v45 = v30;
  }
  else {
    char v45 = 1;
  }
  if (a5 <= 0.0 || (v45 & 1) == 0)
  {
    id v53 = [v28 objectAtIndex:0];
LABEL_66:
    id v51 = v53;
    id v52 = 0;
    goto LABEL_71;
  }
  [a2 fullDuration];
  if (a5 >= v46)
  {
    id v53 = [v28 lastObject];
    goto LABEL_66;
  }
  uint64_t v47 = v30 ^ 1;
  if ((unint64_t)v29 <= v47)
  {
LABEL_63:
    id v51 = [v28 lastObject];
    id v52 = 0;
  }
  else
  {
    unsigned int v48 = v47 + 1;
    while (1)
    {
      +[MCAnimationPathKeyframed timeForKeyframe:withPlugTiming:](MCAnimationPathKeyframed, "timeForKeyframe:withPlugTiming:", [v28 objectAtIndex:v47], a2);
      if (a5 <= v49) {
        break;
      }
      uint64_t v47 = v48;
      if ((unint64_t)v29 <= v48++) {
        goto LABEL_63;
      }
    }
    if (v48 == 1) {
      id v51 = 0;
    }
    else {
      id v51 = [v28 objectAtIndex:v48 - 2];
    }
    id v52 = [v28 objectAtIndex:v47];
  }
LABEL_71:
  if (!v51)
  {
    double v55 = 0.0;
    double v19 = a6;
    goto LABEL_102;
  }
  +[MCAnimationPathKeyframed timeForKeyframe:v51 withPlugTiming:a2];
  double v55 = v54;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [v51 value];
    double v19 = v64;
    goto LABEL_102;
  }
  id v98 = v39;
  [v51 timeOffset];
  [v51 duration];
  TimeForKeyframeAttributesInPlug([v51 timeOffsetKind], 0, a2);
  double v57 = v56;
  BOOL v58 = a5 < v56 && a5 >= v55;
  id v59 = [v51 function];
  if (v59)
  {
    id v60 = v59;
    id v61 = (id)qword_1F1358;
    if (!qword_1F1358)
    {
      id v61 = objc_alloc_init((Class)NSMutableDictionary);
      qword_1F1358 = (uint64_t)v61;
    }
    v62 = (MUMathExpressionFloatBased *)[v61 objectForKey:v60];
    if (v62)
    {
      v63 = v62;
      [(MUMathExpressionFloatBased *)v62 resetAllVariables];
    }
    else
    {
      v65 = [[MUMathExpressionFloatBased alloc] initWithString:v60 error:0];
      if (!v65)
      {
        double v19 = a6;
        id v39 = v98;
        goto LABEL_101;
      }
      v63 = v65;
      [(id)qword_1F1358 setObject:v65 forKey:v60];
    }
    id v66 = [v51 functionParameters];
    id v39 = v98;
    if (v66) {
      [(MUMathExpressionFloatBased *)v63 setVariableValues:v66];
    }
    if (a3) {
      [a3 applyToMathExpression:v63 atTime:a5];
    }
    if (v98) {
      [(MUMathExpressionFloatBased *)v63 setVariableValues:v98];
    }
    if (v40) {
      [(MUMathExpressionFloatBased *)v63 setVariableValues:v40];
    }
    double v67 = 0.0;
    if (a5 > v55)
    {
      double v67 = 1.0;
      if (a5 < v57) {
        double v67 = (a5 - v55) / (v57 - v55);
      }
    }
    [v51 innerEaseInControl];
    double v69 = v68;
    [v51 innerEaseOutControl];
    double v71 = Spline1(v67, 0.0, v69, v70 + 1.0, 1.0, 0.0, 0.0, 1.0, 1.0);
    [v51 functionTimeFactor];
    double v73 = v72;
    [v51 functionTimeOffset];
    double v75 = v74 + v71 * v73;
    *(float *)&double v75 = v75;
    [(MUMathExpressionFloatBased *)v63 setValue:@"time" forVariable:v75];
    if (v30)
    {
      *(float *)&double v76 = a6;
      [(MUMathExpressionFloatBased *)v63 setValue:@"startValue" forVariable:v76];
    }
    [(MUMathExpressionFloatBased *)v63 evaluate];
    double v19 = v77;
LABEL_101:
    if (v58) {
      goto LABEL_128;
    }
    goto LABEL_102;
  }
  double v19 = a6;
  if (v58) {
    goto LABEL_128;
  }
LABEL_102:
  if (!v52) {
    goto LABEL_128;
  }
  +[MCAnimationPathKeyframed timeForKeyframe:v52 withPlugTiming:a2];
  double v79 = v78;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [v52 value];
LABEL_123:
    a6 = v85;
    goto LABEL_124;
  }
  id v80 = [v52 function];
  if (v80)
  {
    id v81 = v80;
    id v82 = (id)qword_1F1358;
    if (!qword_1F1358)
    {
      id v82 = objc_alloc_init((Class)NSMutableDictionary);
      qword_1F1358 = (uint64_t)v82;
    }
    v83 = (MUMathExpressionFloatBased *)[v82 objectForKey:v81];
    if (v83)
    {
      v84 = v83;
      [(MUMathExpressionFloatBased *)v83 resetAllVariables];
LABEL_112:
      id v87 = [v52 functionParameters];
      if (v87) {
        [(MUMathExpressionFloatBased *)v84 setVariableValues:v87];
      }
      if (a3) {
        [a3 applyToMathExpression:v84 atTime:a5];
      }
      if (v39) {
        [(MUMathExpressionFloatBased *)v84 setVariableValues:v39];
      }
      if (v40) {
        [(MUMathExpressionFloatBased *)v84 setVariableValues:v40];
      }
      [v52 functionTimeOffset];
      *(float *)&double v88 = v88;
      [(MUMathExpressionFloatBased *)v84 setValue:@"time" forVariable:v88];
      if (v30)
      {
        *(float *)&double v89 = a6;
        [(MUMathExpressionFloatBased *)v84 setValue:@"startValue" forVariable:v89];
      }
      [(MUMathExpressionFloatBased *)v84 evaluate];
      goto LABEL_123;
    }
    v86 = [[MUMathExpressionFloatBased alloc] initWithString:v81 error:0];
    if (v86)
    {
      v84 = v86;
      [(id)qword_1F1358 setObject:v86 forKey:v81];

      goto LABEL_112;
    }
  }
LABEL_124:
  double v90 = v79 - v55;
  double v91 = (a5 - v55) / (v79 - v55);
  [v51 postControl];
  double v93 = v92;
  [v52 preControl];
  double v95 = v55 + Spline1(v91, 0.0, v93, v94 + 1.0, 1.0, 0.0, 0.0, 1.0, 1.0) * v90 - v55;
  if (v95 <= 0.0) {
    double v96 = 0.0;
  }
  else {
    double v96 = v95 / v90;
  }
  double v19 = v19 + (a6 - v19) * v96;
LABEL_128:
  if (a4) {
    [a4 setLastValue:v19];
  }
  return v19;
}

uint64_t MRIsAppleTV()
{
  if (qword_1F1368 != -1) {
    dispatch_once(&qword_1F1368, &stru_1AB360);
  }
  return byte_1F1360;
}

void sub_9B9A8(id a1)
{
  size_t size = 0;
  *(void *)size_t v4 = 0x100000006;
  sysctl(v4, 2u, 0, &size, 0, 0);
  uint64_t v1 = malloc_type_malloc(size, 0x5D23A4ABuLL);
  sysctl(v4, 2u, v1, &size, 0, 0);
  double v2 = +[NSString stringWithCString:v1 encoding:1];
  free(v1);
  byte_1F1360 = [(NSString *)v2 hasPrefix:@"AppleTV"];
}

int *MRMatrix_Identity()
{
  if (*(float *)&dword_1F1370 == 0.0)
  {
    unk_1F1394 = 0u;
    *(_OWORD *)&dword_1F1384 = 0u;
    unk_1F13A4 = 0;
    unk_1F1374 = 0u;
    dword_1F13AC = 1065353216;
    dword_1F1398 = 1065353216;
    dword_1F1384 = 1065353216;
    dword_1F1370 = 1065353216;
  }
  return &dword_1F1370;
}

double MRMatrix_Clear(uint64_t a1)
{
  double result = 0.0;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 60) = 1065353216;
  *(_DWORD *)(a1 + 40) = 1065353216;
  *(_DWORD *)(a1 + 20) = 1065353216;
  *(_DWORD *)a1 = 1065353216;
  return result;
}

uint64_t MRMatrix_SetDiagonal(uint64_t result, float a2, float a3, float a4)
{
  *(_OWORD *)double result = 0u;
  *(_OWORD *)(result + 16) = 0u;
  *(_OWORD *)(result + 32) = 0u;
  *(_OWORD *)(result + 48) = 0u;
  *(float *)double result = a2;
  *(float *)(result + 20) = a3;
  *(float *)(result + 40) = a4;
  *(_DWORD *)(result + 60) = 1065353216;
  return result;
}

float MRMatrix_SetRotationFromAnglesYXZDeg(uint64_t a1, float a2, float a3, float a4)
{
  float v4 = a3 * 0.0174532925;
  float v5 = a2 * 0.0174532925;
  float v6 = a4 * 0.0174532925;
  return MRMatrix_SetRotationFromAnglesYXZRad(a1, v5, v4, v6);
}

float MRMatrix_SetRotationFromAnglesYXZRad(uint64_t a1, float a2, float a3, float a4)
{
  __float2 v8 = __sincosf_stret(a3);
  if (a3 == 0.0) {
    float cosval = 1.0;
  }
  else {
    float cosval = v8.__cosval;
  }
  if (a3 == 0.0) {
    float sinval = 0.0;
  }
  else {
    float sinval = v8.__sinval;
  }
  __float2 v11 = __sincosf_stret(a2);
  BOOL v12 = a2 == 0.0;
  if (a2 == 0.0) {
    float v13 = 1.0;
  }
  else {
    float v13 = v11.__cosval;
  }
  if (v12) {
    float v14 = 0.0;
  }
  else {
    float v14 = v11.__sinval;
  }
  __float2 v17 = __sincosf_stret(a4);
  float v16 = v17.__cosval;
  float v15 = v17.__sinval;
  if (a4 == 0.0)
  {
    float v16 = 1.0;
    float v15 = 0.0;
  }
  *(float *)a1 = (float)((float)(v14 * sinval) * v15) + (float)(v13 * v16);
  *(float *)(a1 + 4) = cosval * v15;
  *(float *)(a1 + 8) = (float)((float)(v13 * sinval) * v15) - (float)(v14 * v16);
  *(_DWORD *)(a1 + 12) = 0;
  *(float *)(a1 + 16) = (float)((float)(v14 * sinval) * v16) - (float)(v13 * v15);
  *(float *)(a1 + 20) = cosval * v16;
  *(float *)(a1 + 24) = (float)((float)(v13 * sinval) * v16) + (float)(v14 * v15);
  *(_DWORD *)(a1 + 28) = 0;
  *(float *)(a1 + 32) = v14 * cosval;
  *(float *)(a1 + 36) = -sinval;
  float result = v13 * cosval;
  *(float *)(a1 + 40) = v13 * cosval;
  *(void *)(a1 + 52) = 0;
  *(void *)(a1 + 44) = 0;
  *(_DWORD *)(a1 + 60) = 1065353216;
  return result;
}

float MRMatrix_SetRotationFromAnglesXYZDeg(uint64_t a1, float a2, float a3, float a4)
{
  float v4 = a2 * 0.0174532925;
  float v5 = a3 * 0.0174532925;
  float v6 = a4 * 0.0174532925;
  return MRMatrix_SetRotationFromAnglesXYZRad(a1, v4, v5, v6);
}

float MRMatrix_SetRotationFromAnglesXYZRad(uint64_t a1, float a2, float a3, float a4)
{
  __float2 v8 = __sincosf_stret(a2);
  if (a2 == 0.0) {
    float cosval = 1.0;
  }
  else {
    float cosval = v8.__cosval;
  }
  if (a2 == 0.0) {
    float sinval = 0.0;
  }
  else {
    float sinval = v8.__sinval;
  }
  __float2 v11 = __sincosf_stret(a3);
  BOOL v12 = a3 == 0.0;
  if (a3 == 0.0) {
    float v13 = 1.0;
  }
  else {
    float v13 = v11.__cosval;
  }
  if (v12) {
    float v14 = 0.0;
  }
  else {
    float v14 = v11.__sinval;
  }
  __float2 v17 = __sincosf_stret(a4);
  float v16 = v17.__cosval;
  float v15 = v17.__sinval;
  if (a4 == 0.0)
  {
    float v16 = 1.0;
    float v15 = 0.0;
  }
  *(float *)a1 = v13 * v16;
  *(float *)(a1 + 4) = (float)(cosval * v15) + (float)((float)(sinval * v14) * v16);
  *(float *)(a1 + 8) = (float)(sinval * v15) - (float)((float)(cosval * v14) * v16);
  *(_DWORD *)(a1 + 12) = 0;
  *(float *)(a1 + 16) = -(float)(v13 * v15);
  *(float *)(a1 + 20) = (float)(cosval * v16) - (float)((float)(sinval * v14) * v15);
  *(float *)(a1 + 24) = (float)(sinval * v16) + (float)((float)(cosval * v14) * v15);
  *(_DWORD *)(a1 + 28) = 0;
  *(float *)(a1 + 32) = v14;
  *(float *)(a1 + 36) = -(float)(sinval * v13);
  float result = cosval * v13;
  *(float *)(a1 + 40) = cosval * v13;
  *(void *)(a1 + 52) = 0;
  *(void *)(a1 + 44) = 0;
  *(_DWORD *)(a1 + 60) = 1065353216;
  return result;
}

float MRMatrix_Translate(float *a1, float a2, float a3, float a4)
{
  float v4 = a1[13] + a3;
  a1[12] = a1[12] + a2;
  a1[13] = v4;
  float result = a1[14] + a4;
  a1[14] = result;
  return result;
}

float32_t MRMatrix_Scale(float32x2_t *a1, float32x2_t a2, float32_t a3, float a4)
{
  a2.f32[1] = a3;
  *a1 = vmul_f32(*a1, a2);
  a1[1].f32[0] = a1[1].f32[0] * a4;
  a1[2] = vmul_f32(a1[2], a2);
  a1[3].f32[0] = a1[3].f32[0] * a4;
  a1[4] = vmul_f32(a1[4], a2);
  a1[5].f32[0] = a1[5].f32[0] * a4;
  a1[6] = vmul_f32(a1[6], a2);
  float32_t result = a1[7].f32[0] * a4;
  a1[7].f32[0] = result;
  return result;
}

double MRMatrix_PreMultiply(float *a1, uint64_t a2)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  MRMatrix_MultiplyWithMatrix(a1, (float *)a2, (float *)&v6);
  long long v3 = v7;
  *(_OWORD *)a2 = v6;
  *(_OWORD *)(a2 + 16) = v3;
  double result = *(double *)&v8;
  long long v5 = v9;
  *(_OWORD *)(a2 + 32) = v8;
  *(_OWORD *)(a2 + 48) = v5;
  return result;
}

float MRMatrix_MultiplyWithMatrix(float *a1, float *a2, float *a3)
{
  *a3 = (float)((float)((float)(a1[1] * a2[4]) + (float)(*a1 * *a2)) + (float)(a1[2] * a2[8])) + (float)(a1[3] * a2[12]);
  a3[1] = (float)((float)((float)(a1[1] * a2[5]) + (float)(*a1 * a2[1])) + (float)(a1[2] * a2[9]))
        + (float)(a1[3] * a2[13]);
  a3[2] = (float)((float)((float)(a1[1] * a2[6]) + (float)(*a1 * a2[2])) + (float)(a1[2] * a2[10]))
        + (float)(a1[3] * a2[14]);
  a3[3] = (float)((float)((float)(a1[1] * a2[7]) + (float)(*a1 * a2[3])) + (float)(a1[2] * a2[11]))
        + (float)(a1[3] * a2[15]);
  a3[4] = (float)((float)((float)(a1[5] * a2[4]) + (float)(a1[4] * *a2)) + (float)(a1[6] * a2[8]))
        + (float)(a1[7] * a2[12]);
  a3[5] = (float)((float)((float)(a1[5] * a2[5]) + (float)(a1[4] * a2[1])) + (float)(a1[6] * a2[9]))
        + (float)(a1[7] * a2[13]);
  a3[6] = (float)((float)((float)(a1[5] * a2[6]) + (float)(a1[4] * a2[2])) + (float)(a1[6] * a2[10]))
        + (float)(a1[7] * a2[14]);
  a3[7] = (float)((float)((float)(a1[5] * a2[7]) + (float)(a1[4] * a2[3])) + (float)(a1[6] * a2[11]))
        + (float)(a1[7] * a2[15]);
  a3[8] = (float)((float)((float)(a1[9] * a2[4]) + (float)(a1[8] * *a2)) + (float)(a1[10] * a2[8]))
        + (float)(a1[11] * a2[12]);
  a3[9] = (float)((float)((float)(a1[9] * a2[5]) + (float)(a1[8] * a2[1])) + (float)(a1[10] * a2[9]))
        + (float)(a1[11] * a2[13]);
  a3[10] = (float)((float)((float)(a1[9] * a2[6]) + (float)(a1[8] * a2[2])) + (float)(a1[10] * a2[10]))
         + (float)(a1[11] * a2[14]);
  a3[11] = (float)((float)((float)(a1[9] * a2[7]) + (float)(a1[8] * a2[3])) + (float)(a1[10] * a2[11]))
         + (float)(a1[11] * a2[15]);
  a3[12] = (float)((float)((float)(a1[13] * a2[4]) + (float)(a1[12] * *a2)) + (float)(a1[14] * a2[8]))
         + (float)(a1[15] * a2[12]);
  a3[13] = (float)((float)((float)(a1[13] * a2[5]) + (float)(a1[12] * a2[1])) + (float)(a1[14] * a2[9]))
         + (float)(a1[15] * a2[13]);
  a3[14] = (float)((float)((float)(a1[13] * a2[6]) + (float)(a1[12] * a2[2])) + (float)(a1[14] * a2[10]))
         + (float)(a1[15] * a2[14]);
  float result = (float)((float)((float)(a1[13] * a2[7]) + (float)(a1[12] * a2[3])) + (float)(a1[14] * a2[11]))
         + (float)(a1[15] * a2[15]);
  a3[15] = result;
  return result;
}

double MRMatrix_PostMultiply(uint64_t a1, float *a2)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  MRMatrix_MultiplyWithMatrix((float *)a1, a2, (float *)&v6);
  long long v3 = v7;
  *(_OWORD *)a1 = v6;
  *(_OWORD *)(a1 + 16) = v3;
  double result = *(double *)&v8;
  long long v5 = v9;
  *(_OWORD *)(a1 + 32) = v8;
  *(_OWORD *)(a1 + 48) = v5;
  return result;
}

float MRMatrix_TransformVector(float *a1, float *a2, float *a3)
{
  double v3 = *a2;
  double v4 = a2[1];
  double v5 = a2[2];
  float v6 = v4 * a1[4] + *a1 * v3 + a1[8] * v5 + a1[12];
  *a3 = v6;
  float v7 = v4 * a1[5] + a1[1] * v3 + a1[9] * v5 + a1[13];
  a3[1] = v7;
  float v8 = v4 * a1[6] + a1[2] * v3 + a1[10] * v5 + a1[14];
  a3[2] = v8;
  float result = v4 * a1[7] + a1[3] * v3 + a1[11] * v5 + a1[15];
  a3[3] = result;
  return result;
}

float MRMatrix_RotateVector(float *a1, float *a2, uint64_t a3)
{
  double v3 = *a2;
  double v4 = a2[1];
  double v5 = a2[2];
  float v6 = v4 * a1[4] + *a1 * v3 + a1[8] * v5;
  *(float *)a3 = v6;
  float v7 = v4 * a1[5] + a1[1] * v3 + a1[9] * v5;
  *(float *)(a3 + 4) = v7;
  float result = v4 * a1[6] + a1[2] * v3 + a1[10] * v5;
  *(float *)(a3 + 8) = result;
  *(_DWORD *)(a3 + 12) = 1065353216;
  return result;
}

void MRMatrix_ConcatenateWithMatrix(float *a1, float *a2, uint64_t a3)
{
  *(_DWORD *)(a3 + 44) = 0;
  *(_DWORD *)(a3 + 28) = 0;
  *(_DWORD *)(a3 + 12) = 0;
  *(_DWORD *)(a3 + 60) = 1065353216;
}

double MRMatrix_Determinant(float *a1)
{
  float v1 = a1[1];
  float v3 = a1[4];
  float v2 = a1[5];
  float v4 = *a1 * v2;
  float v5 = a1[10];
  float v6 = a1[11];
  float v7 = a1[6];
  float v8 = a1[7];
  float v9 = *a1 * v7;
  float v11 = a1[12];
  float v10 = a1[13];
  float v13 = a1[14];
  float v12 = a1[15];
  float v14 = *a1 * v8;
  float v16 = a1[8];
  float v15 = a1[9];
  float v17 = v1 * v3;
  float v18 = v7 * v1;
  float v19 = (float)((float)((float)((float)((float)(v9 * v6) * v10) + (float)((float)(v4 * v5) * v12))
                      + (float)((float)(v14 * v15) * v13))
              + (float)((float)(v6 * (float)(v1 * v3)) * v13))
      + (float)((float)((float)(v7 * v1) * v16) * v12);
  float v20 = v8 * v1;
  float v21 = a1[2];
  float v22 = a1[3];
  float v23 = v8 * v21;
  return (float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v19 + (float)((float)(v5 * v20) * v11)) + (float)((float)(v15 * (float)(v3 * v21)) * v12)) + (float)((float)(v6 * (float)(v2 * v21)) * v11)) + (float)((float)(v16 * v23) * v10)) + (float)((float)(v5 * (float)(v3 * v22)) * v10)) + (float)((float)(v16 * (float)(v2 * v22)) * v13)) + (float)((float)(v15 * (float)(v7 * v22)) * v11)) + (float)((float)-(float)(v4 * v6) * v13))
                                                                                               + (float)((float)-(float)(v9 * v15) * v12))
                                                                                       + (float)((float)-(float)(v14 * v5)
                                                                                               * v10))
                                                                               + (float)((float)-(float)(v17 * v5) * v12))
                                                                       + (float)((float)-(float)(v18 * v6) * v11))
                                                               + (float)((float)-(float)(v20 * v16) * v13))
                                                       + (float)((float)-(float)((float)(v3 * v21) * v6) * v10))
                                               + (float)((float)-(float)((float)(v2 * v21) * v16) * v12))
                                       + (float)((float)-(float)(v23 * v15) * v11))
                               + (float)((float)-(float)((float)(v3 * v22) * v15) * v13))
                       + (float)((float)-(float)((float)(v2 * v22) * v5) * v11))
               + (float)((float)-(float)((float)(v7 * v22) * v16) * v10));
}

BOOL MRMatrix_Invert(float *a1, float *a2)
{
  *(double *)&uint64_t v4 = MRMatrix_Determinant(a1);
  if (*(double *)&v4 != 0.0)
  {
    uint64_t v5 = 0;
    *a2 = (float)((float)((float)((float)((float)((float)(a1[6] * a1[11]) * a1[13])
                                        + (float)((float)(a1[5] * a1[10]) * a1[15]))
                                + (float)((float)(a1[7] * a1[9]) * a1[14]))
                        + (float)((float)-(float)(a1[5] * a1[11]) * a1[14]))
                + (float)((float)-(float)(a1[6] * a1[9]) * a1[15]))
        + (float)((float)-(float)(a1[7] * a1[10]) * a1[13]);
    a2[1] = (float)((float)((float)((float)((float)((float)(a1[2] * a1[9]) * a1[15])
                                          + (float)((float)(a1[1] * a1[11]) * a1[14]))
                                  + (float)((float)(a1[3] * a1[10]) * a1[13]))
                          + (float)((float)-(float)(a1[1] * a1[10]) * a1[15]))
                  + (float)((float)-(float)(a1[2] * a1[11]) * a1[13]))
          + (float)((float)-(float)(a1[3] * a1[9]) * a1[14]);
    a2[2] = (float)((float)((float)((float)((float)((float)(a1[2] * a1[7]) * a1[13])
                                          + (float)((float)(a1[1] * a1[6]) * a1[15]))
                                  + (float)((float)(a1[3] * a1[5]) * a1[14]))
                          + (float)((float)-(float)(a1[1] * a1[7]) * a1[14]))
                  + (float)((float)-(float)(a1[2] * a1[5]) * a1[15]))
          + (float)((float)-(float)(a1[3] * a1[6]) * a1[13]);
    a2[3] = (float)((float)((float)((float)((float)((float)(a1[2] * a1[5]) * a1[11])
                                          + (float)((float)(a1[1] * a1[7]) * a1[10]))
                                  + (float)((float)(a1[3] * a1[6]) * a1[9]))
                          + (float)((float)-(float)(a1[1] * a1[6]) * a1[11]))
                  + (float)((float)-(float)(a1[2] * a1[7]) * a1[9]))
          + (float)((float)-(float)(a1[3] * a1[5]) * a1[10]);
    a2[4] = (float)((float)((float)((float)((float)((float)(a1[6] * a1[8]) * a1[15])
                                          + (float)((float)(a1[4] * a1[11]) * a1[14]))
                                  + (float)((float)(a1[7] * a1[10]) * a1[12]))
                          + (float)((float)-(float)(a1[4] * a1[10]) * a1[15]))
                  + (float)((float)-(float)(a1[6] * a1[11]) * a1[12]))
          + (float)((float)-(float)(a1[7] * a1[8]) * a1[14]);
    a2[5] = (float)((float)((float)((float)((float)((float)(a1[2] * a1[11]) * a1[12])
                                          + (float)((float)(*a1 * a1[10]) * a1[15]))
                                  + (float)((float)(a1[3] * a1[8]) * a1[14]))
                          + (float)((float)-(float)(*a1 * a1[11]) * a1[14]))
                  + (float)((float)-(float)(a1[2] * a1[8]) * a1[15]))
          + (float)((float)-(float)(a1[3] * a1[10]) * a1[12]);
    a2[6] = (float)((float)((float)((float)((float)((float)(a1[2] * a1[4]) * a1[15])
                                          + (float)((float)(*a1 * a1[7]) * a1[14]))
                                  + (float)((float)(a1[3] * a1[6]) * a1[12]))
                          + (float)((float)-(float)(*a1 * a1[6]) * a1[15]))
                  + (float)((float)-(float)(a1[2] * a1[7]) * a1[12]))
          + (float)((float)-(float)(a1[3] * a1[4]) * a1[14]);
    a2[7] = (float)((float)((float)((float)((float)((float)(a1[2] * a1[7]) * a1[8])
                                          + (float)((float)(*a1 * a1[6]) * a1[11]))
                                  + (float)((float)(a1[3] * a1[4]) * a1[10]))
                          + (float)((float)-(float)(*a1 * a1[7]) * a1[10]))
                  + (float)((float)-(float)(a1[2] * a1[4]) * a1[11]))
          + (float)((float)-(float)(a1[3] * a1[6]) * a1[8]);
    a2[8] = (float)((float)((float)((float)((float)((float)(a1[5] * a1[11]) * a1[12])
                                          + (float)((float)(a1[4] * a1[9]) * a1[15]))
                                  + (float)((float)(a1[7] * a1[8]) * a1[13]))
                          + (float)((float)-(float)(a1[4] * a1[11]) * a1[13]))
                  + (float)((float)-(float)(a1[5] * a1[8]) * a1[15]))
          + (float)((float)-(float)(a1[7] * a1[9]) * a1[12]);
    a2[9] = (float)((float)((float)((float)((float)((float)(a1[1] * a1[8]) * a1[15])
                                          + (float)((float)(*a1 * a1[11]) * a1[13]))
                                  + (float)((float)(a1[3] * a1[9]) * a1[12]))
                          + (float)((float)-(float)(*a1 * a1[9]) * a1[15]))
                  + (float)((float)-(float)(a1[1] * a1[11]) * a1[12]))
          + (float)((float)-(float)(a1[3] * a1[8]) * a1[13]);
    a2[10] = (float)((float)((float)((float)((float)((float)(a1[1] * a1[7]) * a1[12])
                                           + (float)((float)(*a1 * a1[5]) * a1[15]))
                                   + (float)((float)(a1[3] * a1[4]) * a1[13]))
                           + (float)((float)-(float)(*a1 * a1[7]) * a1[13]))
                   + (float)((float)-(float)(a1[1] * a1[4]) * a1[15]))
           + (float)((float)-(float)(a1[3] * a1[5]) * a1[12]);
    a2[11] = (float)((float)((float)((float)((float)((float)(a1[1] * a1[4]) * a1[11])
                                           + (float)((float)(*a1 * a1[7]) * a1[9]))
                                   + (float)((float)(a1[3] * a1[5]) * a1[8]))
                           + (float)((float)-(float)(*a1 * a1[5]) * a1[11]))
                   + (float)((float)-(float)(a1[1] * a1[7]) * a1[8]))
           + (float)((float)-(float)(a1[3] * a1[4]) * a1[9]);
    a2[12] = (float)((float)((float)((float)((float)((float)(a1[5] * a1[8]) * a1[14])
                                           + (float)((float)(a1[4] * a1[10]) * a1[13]))
                                   + (float)((float)(a1[6] * a1[9]) * a1[12]))
                           + (float)((float)-(float)(a1[4] * a1[9]) * a1[14]))
                   + (float)((float)-(float)(a1[5] * a1[10]) * a1[12]))
           + (float)((float)-(float)(a1[6] * a1[8]) * a1[13]);
    a2[13] = (float)((float)((float)((float)((float)((float)(a1[1] * a1[10]) * a1[12])
                                           + (float)((float)(*a1 * a1[9]) * a1[14]))
                                   + (float)((float)(a1[2] * a1[8]) * a1[13]))
                           + (float)((float)-(float)(*a1 * a1[10]) * a1[13]))
                   + (float)((float)-(float)(a1[1] * a1[8]) * a1[14]))
           + (float)((float)-(float)(a1[2] * a1[9]) * a1[12]);
    a2[14] = (float)((float)((float)((float)((float)((float)(a1[1] * a1[4]) * a1[14])
                                           + (float)((float)(*a1 * a1[6]) * a1[13]))
                                   + (float)((float)(a1[2] * a1[5]) * a1[12]))
                           + (float)((float)-(float)(*a1 * a1[5]) * a1[14]))
                   + (float)((float)-(float)(a1[1] * a1[6]) * a1[12]))
           + (float)((float)-(float)(a1[2] * a1[4]) * a1[13]);
    a2[15] = (float)((float)((float)((float)((float)((float)(a1[1] * a1[6]) * a1[8])
                                           + (float)((float)(*a1 * a1[5]) * a1[10]))
                                   + (float)((float)(a1[2] * a1[4]) * a1[9]))
                           + (float)((float)-(float)(*a1 * a1[6]) * a1[9]))
                   + (float)((float)-(float)(a1[1] * a1[4]) * a1[10]))
           + (float)((float)-(float)(a1[2] * a1[5]) * a1[8]);
    float64x2_t v6 = (float64x2_t)vdupq_lane_s64(v4, 0);
    do
    {
      *(float32x4_t *)&a2[v5] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vdivq_f64(vcvtq_f64_f32(*(float32x2_t *)&a2[v5]), v6)), vdivq_f64(vcvt_hight_f64_f32(*(float32x4_t *)&a2[v5]), v6));
      v5 += 4;
    }
    while (v5 != 16);
  }
  return *(double *)&v4 != 0.0;
}

float MRMatrix_Frustum(uint64_t a1, float a2, float a3, float a4, float a5, float a6, float a7)
{
  *(_DWORD *)(a1 + 60) = 0;
  *(void *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 52) = 0;
  *(void *)(a1 + 12) = 0;
  *(void *)(a1 + 4) = 0;
  *(void *)(a1 + 44) = 3212836864;
  float v7 = a2 + a3;
  float v8 = a3 - a2;
  float v9 = v7 / v8;
  float v10 = a4 + a5;
  float v11 = a5 - a4;
  *(float *)(a1 + 32) = v9;
  *(float *)(a1 + 36) = v10 / v11;
  float v12 = a7 - a6;
  *(float *)(a1 + 40) = (float)-(float)(a6 + a7) / (float)(a7 - a6);
  double v13 = a6;
  float v14 = a7 * -2.0 * v13 / v12;
  *(float *)(a1 + 56) = v14;
  float v15 = (v13 + v13) / v8;
  *(float *)a1 = v15;
  float result = (v13 + v13) / v11;
  *(float *)(a1 + 20) = result;
  return result;
}

double MRMatrix_ProjectPoint(float *a1, double a2, double a3)
{
  float v3 = a2;
  float v4 = a3;
  v8[0] = v3;
  v8[1] = v4;
  uint64_t v9 = 0x3F80000000000000;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  MRMatrix_TransformVector(a1, v8, (float *)&v6);
  return (float)(*(float *)&v6 / *((float *)&v7 + 1));
}

double MRMatrix_UnprojectPoint(float *a1, double a2, double a3)
{
  float v4 = a2;
  float v5 = a3;
  v14[0] = v4;
  v14[1] = v5;
  uint64_t v15 = 0x3F80000000000000;
  float32x2_t v12 = 0;
  uint64_t v13 = 0;
  MRMatrix_TransformVector(a1, v14, (float *)&v12);
  v6.i32[0] = HIDWORD(v13);
  if (*((float *)&v13 + 1) != 0.0)
  {
    float32x2_t v12 = vdiv_f32(v12, (float32x2_t)vdup_lane_s32(v6, 0));
    *(float *)&uint64_t v13 = *(float *)&v13 / *((float *)&v13 + 1);
  }
  float32x2_t v10 = 0;
  uint64_t v11 = 0;
  LODWORD(v15) = -1073741824;
  MRMatrix_TransformVector(a1, v14, (float *)&v10);
  v7.i32[0] = HIDWORD(v11);
  if (*((float *)&v11 + 1) == 0.0)
  {
    v7.i32[0] = v11;
  }
  else
  {
    float32x2_t v10 = vdiv_f32(v10, (float32x2_t)vdup_lane_s32(v7, 0));
    *(float *)v7.i32 = *(float *)&v11 / *((float *)&v11 + 1);
  }
  if (*(float *)v7.i32 == *(float *)&v13)
  {
    v8.i32[0] = v10.i32[0];
    v8.f32[1] = -v10.f32[1];
  }
  else
  {
    *(float *)v7.i32 = *(float *)v7.i32 - *(float *)&v13;
    float32x2_t v8 = vsub_f32(v12, vdiv_f32(vmul_n_f32(vsub_f32(v10, v12), *(float *)&v13), (float32x2_t)vdup_lane_s32(v7, 0)));
  }
  *(void *)&double result = *(_OWORD *)&vcvtq_f64_f32(v8);
  return result;
}

double MRCGPointRotatedByDegrees(double a1, double a2, float a3)
{
  float v5 = a3 * 0.0174532925;
  __float2 v6 = __sincosf_stret(v5);
  return a1 * v6.__cosval - a2 * v6.__sinval;
}

double MRCGPointRotatedByRadians(double a1, double a2, float a3)
{
  __float2 v5 = __sincosf_stret(a3);
  return a1 * v5.__cosval - a2 * v5.__sinval;
}

double Spline(int a1, double *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, double a8)
{
  if (*a2 >= a8) {
    return *(double *)a5;
  }
  uint64_t v8 = (a1 - 1);
  if (a2[v8] <= a8) {
    return *(double *)(a5 + 8 * v8);
  }
  unsigned int v9 = -1;
  do
  {
    uint64_t v10 = v9 + 2;
    double v11 = a2[v10];
    ++v9;
  }
  while (v11 <= a8);
  if (a6) {
    uint64_t v12 = a6;
  }
  else {
    uint64_t v12 = a5;
  }
  double v13 = *(double *)(v12 + 8 * v10);
  if (a7) {
    uint64_t v14 = a7;
  }
  else {
    uint64_t v14 = a5;
  }
  return Spline1(a8, a2[v9], *(double *)(a3 + 8 * v10), *(double *)(a4 + 8 * v9), v11, *(double *)(a5 + 8 * v9), v13, *(double *)(v14 + 8 * v9), *(double *)(a5 + 8 * v10));
}

CGImageRef CreateResizedCGImage(CGImage *a1, CGFloat a2, CGFloat a3)
{
  ColorSpace = CGImageGetColorSpace(a1);
  CGImageAlphaInfo AlphaInfo = CGImageGetAlphaInfo(a1);
  if (AlphaInfo == kCGImageAlphaNone)
  {
    if (CGColorSpaceGetModel(ColorSpace) == kCGColorSpaceModelRGB) {
      CGImageAlphaInfo AlphaInfo = kCGImageAlphaNoneSkipLast;
    }
    else {
      CGImageAlphaInfo AlphaInfo = kCGImageAlphaNone;
    }
  }
  if (AlphaInfo == kCGImageAlphaLast) {
    int v8 = 1;
  }
  else {
    int v8 = AlphaInfo;
  }
  if (v8 == 4) {
    int v9 = 2;
  }
  else {
    int v9 = v8;
  }
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  size_t NumberOfComponents = CGColorSpaceGetNumberOfComponents(DeviceRGB);
  if (v9) {
    size_t v12 = NumberOfComponents + 1;
  }
  else {
    size_t v12 = NumberOfComponents;
  }
  double v13 = CGBitmapContextCreate(0, (unint64_t)a2, (unint64_t)a3, 8uLL, v12 * (int)a2, DeviceRGB, v9 | 0x4000u);
  CGColorSpaceRelease(DeviceRGB);
  if (!v13) {
    return 0;
  }
  CGContextSetInterpolationQuality(v13, kCGInterpolationHigh);
  v16.origin.x = 0.0;
  v16.origin.y = 0.0;
  v16.size.width = a2;
  v16.size.height = a3;
  CGContextDrawImage(v13, v16, a1);
  CGImageRef Image = CGBitmapContextCreateImage(v13);
  CGContextRelease(v13);
  return Image;
}

double MRGetCurrentTime()
{
  uint64_t v0 = mach_absolute_time();
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  return (double)(v0 * info.numer / info.denom) * 0.000000001;
}

int64_t sub_9CF14(NSIndexSet *self, SEL a2, int64_t a3)
{
  int64_t v5 = [(NSIndexSet *)self firstIndex];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL && a3)
  {
    int64_t v6 = a3 - 1;
    do
    {
      int64_t v7 = v6;
      int64_t v5 = [(NSIndexSet *)self indexGreaterThanIndex:v5];
      if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      int64_t v6 = v7 - 1;
    }
    while (v7);
  }
  return v5;
}

double MRFitInToAspectRatio(double result, double a2, double a3)
{
  if (result >= a2 * a3) {
    return a2 * a3;
  }
  return result;
}

double MRFitOutToAspectRatio(double result, double a2, double a3)
{
  if (result <= a2 * a3) {
    return a2 * a3;
  }
  return result;
}

uint64_t MRBreakOnTrue(uint64_t a1)
{
  if (a1) {
    NSLog(@"BreakOnTrue!!!");
  }
  return a1;
}

uint64_t _good_rand(uint64_t a1)
{
  uint64_t v1 = 123459876;
  if (a1) {
    uint64_t v1 = a1;
  }
  uint64_t v2 = 16807 * (v1 % 127773) - 2836 * (v1 / 127773);
  if (v2 >= 0) {
    return v2;
  }
  else {
    return v2 + 0x7FFFFFFF;
  }
}

void sub_9D43C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_9D4AC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_A183C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "creationDateForPath:", a2), "timeIntervalSinceReferenceDate");
  double v6 = v5;
  objc_msgSend(objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "creationDateForPath:", a3), "timeIntervalSinceReferenceDate");
  if (v6 >= v7) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = -1;
  }
  if (v6 > v7) {
    return 1;
  }
  else {
    return v8;
  }
}

void sub_A1B28(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_A1B40(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(*(void *)(a1 + 32) + 16) regionsOfInterestForPath:a2 detect:0];
  CGFloat x = CGRectZero.origin.x;
  CGFloat y = CGRectZero.origin.y;
  CGFloat width = CGRectZero.size.width;
  CGFloat height = CGRectZero.size.height;
  id v9 = [v4 count];
  uint64_t v10 = (uint64_t)v9;
  if (v4) {
    BOOL v11 = (uint64_t)v9 < 2;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    int v12 = 1;
    double v13 = height;
    double v14 = width;
    CGFloat rect1_8 = y;
    CGFloat rect1_24 = CGRectZero.origin.x;
    goto LABEL_29;
  }
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v15 = [v4 countByEnumeratingWithState:&v68 objects:v72 count:16];
  if (!v15)
  {
    BOOL v17 = 1;
    double v13 = height;
    double v14 = width;
    double v19 = y;
    goto LABEL_28;
  }
  id v16 = v15;
  BOOL v17 = 1;
  uint64_t v18 = *(void *)v69;
  double v13 = height;
  double v14 = width;
  double v19 = y;
  do
  {
    float v20 = 0;
    double v21 = v14;
    double v22 = v19;
    do
    {
      CGFloat rect1_24a = x;
      CGFloat v23 = v22;
      CGFloat v24 = v21;
      if (*(void *)v69 != v18) {
        objc_enumerationMutation(v4);
      }
      CGRect v73 = CGRectFromString((NSString *)[*(id *)(*((void *)&v68 + 1) + 8 * (void)v20) objectForKey:kMPMetaDataRegionOfInterestBounds]);
      CGFloat rect1_8a = v73.origin.y;
      CGFloat rect1_16 = v73.origin.x;
      double v25 = v73.size.width;
      double v26 = v73.size.height;
      v73.origin.CGFloat x = CGRectZero.origin.x;
      v73.origin.CGFloat y = y;
      v73.size.CGFloat width = width;
      v73.size.CGFloat height = height;
      v78.origin.CGFloat x = rect1_24a;
      v78.origin.CGFloat y = v23;
      v78.size.CGFloat width = v24;
      v78.size.CGFloat height = v13;
      if (!CGRectEqualToRect(v73, v78) && v17)
      {
        v74.origin.CGFloat y = rect1_8a;
        v74.origin.CGFloat x = rect1_16;
        v74.size.CGFloat width = v25;
        v74.size.CGFloat height = v26;
        CGRect v75 = CGRectInset(v74, -0.05, -0.05);
        v79.origin.CGFloat x = rect1_24a;
        v79.origin.CGFloat y = v23;
        v79.size.CGFloat width = v24;
        v79.size.CGFloat height = v13;
        BOOL v17 = CGRectIntersectsRect(v75, v79);
      }
      if (v25 == 0.0)
      {
        double v21 = v24;
        double v22 = v23;
LABEL_20:
        CGFloat x = rect1_24a;
        goto LABEL_21;
      }
      double v21 = v24;
      double v22 = v23;
      if (v26 == 0.0) {
        goto LABEL_20;
      }
      CGFloat v27 = rect1_24a;
      double v28 = v13;
      v80.origin.CGFloat x = CGRectZero.origin.x;
      v80.origin.CGFloat y = y;
      v80.size.CGFloat width = width;
      v80.size.CGFloat height = height;
      if (CGRectEqualToRect(*(CGRect *)(&v22 - 1), v80))
      {
        double v21 = v25;
        double v22 = rect1_8a;
        CGFloat x = rect1_16;
        double v13 = v26;
      }
      else
      {
        v76.origin.CGFloat y = rect1_8a;
        v76.origin.CGFloat x = rect1_16;
        v76.size.CGFloat width = v25;
        v76.size.CGFloat height = v26;
        v81.origin.CGFloat x = CGRectZero.origin.x;
        v81.origin.CGFloat y = y;
        v81.size.CGFloat width = width;
        v81.size.CGFloat height = height;
        BOOL v29 = CGRectEqualToRect(v76, v81);
        double v21 = v24;
        double v22 = v23;
        CGFloat x = rect1_24a;
        if (!v29)
        {
          CGFloat v30 = rect1_24a;
          double v31 = v13;
          v82.origin.CGFloat y = rect1_8a;
          v82.origin.CGFloat x = rect1_16;
          v82.size.CGFloat width = v25;
          v82.size.CGFloat height = v26;
          *(CGRect *)(&v22 - 1) = CGRectUnion(*(CGRect *)(&v22 - 1), v82);
          CGFloat x = v32;
          double v13 = v33;
        }
      }
LABEL_21:
      float v20 = (char *)v20 + 1;
    }
    while (v16 != v20);
    double v19 = v22;
    double v14 = v21;
    id v34 = [v4 countByEnumeratingWithState:&v68 objects:v72 count:16];
    id v16 = v34;
  }
  while (v34);
LABEL_28:
  CGFloat rect1_24 = x;
  CGFloat rect1_8 = v19;
  int v12 = v17;
LABEL_29:
  [*(id *)(*(void *)(a1 + 32) + 16) resolutionForPath:a2];
  double v36 = v35;
  double v38 = v37;
  double v39 = v35 / v37;
  v77.origin.CGFloat x = rect1_24;
  v83.origin.CGFloat x = CGRectZero.origin.x;
  v77.origin.CGFloat y = rect1_8;
  v77.size.CGFloat width = v14;
  v77.size.CGFloat height = v13;
  v83.origin.CGFloat y = y;
  v83.size.CGFloat width = width;
  v83.size.CGFloat height = height;
  BOOL v40 = CGRectEqualToRect(v77, v83);
  double v41 = v13;
  if (v40) {
    double v42 = v39;
  }
  else {
    double v42 = v14 * v36 / (v13 * v38);
  }
  BOOL v43 = v38 * (v41 * v14 / v36) <= 0.9 || v10 <= 1;
  unsigned int rect1_16a = v12;
  if (v43 && ((double v44 = v42 / v39, v39 > 1.0) || v44 <= 6.0)) {
    BOOL v45 = v44 < 0.165 && v39 > 1.0;
  }
  else {
    BOOL v45 = 1;
  }
  int v46 = *(unsigned __int8 *)(a1 + 48);
  if (*(unsigned char *)(a1 + 48))
  {
    if (v10 == 1
      || v42 <= 1.0 && (v42 != 0.0 ? (BOOL v47 = v39 <= 1.0) : (BOOL v47 = 1), !v47 ? (v48 = v10 < 4) : (v48 = 0), v48))
    {
      uint64_t v49 = 1;
    }
    else
    {
      BOOL v50 = v39 <= 1.0;
      if (v42 <= 1.0) {
        BOOL v50 = 0;
      }
      if (v42 == 0.0) {
        BOOL v50 = 0;
      }
      uint64_t v49 = v10 < 4 && v50;
    }
  }
  else
  {
    uint64_t v49 = 0;
  }
  uint64_t rect1_24b = a2;
  id v51 = [*(id *)(*(void *)(a1 + 32) + 16) isMovieAtPath:a2];
  if (v51) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  if (v39 >= 0.5) {
    uint64_t v52 = v39 > 2.0;
  }
  else {
    uint64_t v52 = 2;
  }
  if (!v46) {
    double v42 = v39;
  }
  id rect1_8b = objc_alloc((Class)NSMutableDictionary);
  rect1 = +[NSNumber numberWithBool:v49];
  *(float *)&double v53 = v39;
  double v54 = +[NSNumber numberWithFloat:v53];
  double v55 = +[NSNumber numberWithBool:v45];
  double v56 = +[NSNumber numberWithBool:v51];
  *(float *)&double v57 = v42;
  id v58 = objc_msgSend(rect1_8b, "initWithObjectsAndKeys:", rect1, @"canSwitch", v54, @"imageAspectRatio", v55, @"fullOfFaces", v56, @"isMovie", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v57), @"aspectRatio", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", rect1_16a), @"intersects", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v39 > 1.0), @"fitsInExtraWide", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v52), @"panoramaType", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v4, "count")),
          @"roiCount",
          0);
  [*(id *)(*(void *)(a1 + 32) + 48) lock];
  [*(id *)(*(void *)(a1 + 32) + 40) setObject:v58 forKey:rect1_24b];
  [*(id *)(*(void *)(a1 + 32) + 48) unlock];
}

BOOL MPShouldPanPanorama2(double a1, double a2)
{
  BOOL v2 = a1 < 1.0;
  double v3 = a1 / a2;
  double v4 = a2 / a1;
  if (!v2) {
    double v4 = v3;
  }
  return v4 >= 1.1;
}

void sub_B4338(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_B43A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_B6288(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_B6318(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_B6BE8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void convertToGreyScaleGCD(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3, size_t a4)
{
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_B6D28;
  block[3] = &unk_1AB3D0;
  void block[4] = a3;
  block[5] = a1;
  block[6] = a2;
  dispatch_apply(a4, global_queue, block);
}

void *sub_B6D28(void *result, uint64_t a2)
{
  unint64_t v2 = result[4];
  if (v2)
  {
    uint64_t v3 = 0;
    unsigned int v4 = 1;
    do
    {
      uint64_t v5 = v3 + v2 * a2;
      *(unsigned char *)(result[6] + v5) = (unsigned __int16)(77 * *(unsigned __int8 *)(result[5] + 4 * v5)
                                                    + 151 * *(unsigned __int8 *)(result[5] + 4 * v5 + 1)
                                                    + 28 * *(unsigned __int8 *)(result[5] + 4 * v5 + 2)) >> 8;
      uint64_t v3 = v4;
      unint64_t v2 = result[4];
    }
    while (v2 > v4++);
  }
  return result;
}

uint64_t convertToGreyScaleNoGCD(uint64_t result, unsigned __int8 *a2, unint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v4 = 0;
    for (i = 0; i < a4; uint64_t v4 = ++i)
    {
      if (a3)
      {
        uint64_t v6 = 0;
        double v7 = (unsigned __int8 *)(result + 4 * a3 * v4);
        do
        {
          a2[v6++] = (unsigned __int16)(77 * *v7 + 151 * v7[1] + 28 * v7[2]) >> 8;
          v7 += 4;
        }
        while (a3 > v6);
        a2 += v6;
      }
    }
  }
  return result;
}

void sub_B7C10(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_B7F90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id obj)
{
}

void sub_B8188(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sortByLocalizedName(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  if (a3) {
    BOOL v3 = *a3 == 0;
  }
  else {
    BOOL v3 = 0;
  }
  uint64_t result = (uint64_t)objc_msgSend(objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "localizedNameForStyleID:", a1), "localizedCaseInsensitiveCompare:", objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "localizedNameForStyleID:", a2));
  if (v3)
  {
    if (result == -1)
    {
      return 1;
    }
    else if (result == 1)
    {
      return -1;
    }
  }
  return result;
}

void sub_B9960(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_B99D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

float *SetLightingColors(float *result, float *a2, float a3)
{
  float v3 = a2[1];
  float v4 = a2[4] - v3;
  float v5 = a2[2];
  float v6 = a2[8] - v5;
  float v7 = a2[7] - v3;
  float v8 = a2[5] - v5;
  float v9 = (float)(v4 * v6) - (float)(v7 * v8);
  float v10 = a2[6] - *a2;
  float v11 = a2[3] - *a2;
  float v12 = (float)(v8 * v10) - (float)(v6 * v11);
  float v13 = (float)(v11 * v7) - (float)(v10 * v4);
  float v14 = sqrtf((float)((float)(v12 * v12) + (float)(v9 * v9)) + (float)(v13 * v13));
  float v15 = fabs((float)((float)((float)(v3 * v12) + (float)(v9 * *a2)) + (float)(v13 * (float)(v5 + -5.0)))/ (float)(sqrtf((float)((float)(v3 * v3) + (float)(*a2 * *a2)) + (float)((float)(v5 + -5.0) * (float)(v5 + -5.0)))* v14))* a3;
  result[1] = v15;
  result[2] = v15;
  unsigned char *result = v15;
  float v16 = fabs((float)((float)((float)(v12 * a2[4]) + (float)(v9 * a2[3])) + (float)(v13 * (float)(a2[5] + -5.0)))/ (float)(v14* sqrtf((float)((float)(a2[4] * a2[4]) + (float)(a2[3] * a2[3]))+ (float)((float)(a2[5] + -5.0) * (float)(a2[5] + -5.0)))))* a3;
  result[5] = v16;
  result[6] = v16;
  result[4] = v16;
  float v17 = fabs((float)((float)((float)(v12 * a2[7]) + (float)(v9 * a2[6])) + (float)(v13 * (float)(a2[8] + -5.0)))/ (float)(v14* sqrtf((float)((float)(a2[7] * a2[7]) + (float)(a2[6] * a2[6]))+ (float)((float)(a2[8] + -5.0) * (float)(a2[8] + -5.0)))))* a3;
  result[9] = v17;
  result[10] = v17;
  result[8] = v17;
  float v18 = fabs((float)((float)((float)(v12 * a2[10]) + (float)(v9 * a2[9])) + (float)(v13 * (float)(a2[11] + -5.0)))/ (float)(v14* sqrtf((float)((float)(a2[10] * a2[10]) + (float)(a2[9] * a2[9]))+ (float)((float)(a2[11] + -5.0) * (float)(a2[11] + -5.0)))))* a3;
  result[13] = v18;
  result[14] = v18;
  result[15] = a3;
  result[11] = a3;
  result[12] = v18;
  result[7] = a3;
  result[3] = a3;
  return result;
}

float SetLightingColors2D(uint64_t a1, float *a2, float a3)
{
  double v3 = a3 * 5.0;
  float v4 = v3 / sqrtf((float)((float)(a2[1] * a2[1]) + (float)(*a2 * *a2)) + 25.0);
  *(float *)(a1 + 4) = v4;
  *(float *)(a1 + 8) = v4;
  *(float *)a1 = v4;
  float v5 = v3 / sqrtf((float)((float)(a2[3] * a2[3]) + (float)(a2[2] * a2[2])) + 25.0);
  *(float *)(a1 + 20) = v5;
  *(float *)(a1 + 24) = v5;
  *(float *)(a1 + 16) = v5;
  float v6 = v3 / sqrtf((float)((float)(a2[5] * a2[5]) + (float)(a2[4] * a2[4])) + 25.0);
  *(float *)(a1 + 36) = v6;
  *(float *)(a1 + 40) = v6;
  *(float *)(a1 + 32) = v6;
  float result = v3 / sqrtf((float)((float)(a2[7] * a2[7]) + (float)(a2[6] * a2[6])) + 25.0);
  *(float *)(a1 + 52) = result;
  *(float *)(a1 + 56) = result;
  *(float *)(a1 + 48) = result;
  *(_DWORD *)(a1 + 60) = 1065353216;
  *(_DWORD *)(a1 + 44) = 1065353216;
  *(_DWORD *)(a1 + 28) = 1065353216;
  *(_DWORD *)(a1 + 12) = 1065353216;
  return result;
}

id RenderPatchworkWithMesh(void *a1, unsigned __int16 *a2, void *a3)
{
  float v5 = &selRef_sortPatchworkAscendingVertical_;
  if (*((unsigned char *)a2 + 2)) {
    float v5 = &selRef_sortPatchworkAscendingHorizontal_;
  }
  id v6 = [a1 sortedArrayUsingSelector:*v5];
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id obj = v6;
  id result = [v6 countByEnumeratingWithState:&v70 objects:v95 count:16];
  if (result)
  {
    id v8 = result;
    char v64 = 0;
    uint64_t v9 = *(void *)v71;
    CFStringRef v10 = @"rectangle";
    while (1)
    {
      float v11 = 0;
      do
      {
        if (*(void *)v71 != v9) {
          objc_enumerationMutation(obj);
        }
        float v12 = *(void **)(*((void *)&v70 + 1) + 8 * (void)v11);
        objc_msgSend(objc_msgSend(v12, "objectForKey:", v10), "CGRectValue");
        double v14 = v13;
        double v16 = v15;
        double v18 = v17;
        double v20 = v19;
        double v21 = v17 / v19;
        objc_msgSend(objc_msgSend(v12, "objectForKey:", @"referenceAspectRatio"), "floatValue");
        if (v22 == 0.0) {
          double v23 = v21;
        }
        else {
          double v23 = v22;
        }
        float v24 = v14;
        float v25 = v14 + v18;
        float v26 = v16;
        float v27 = v16 + v20;
        float v28 = 2.0 / v18;
        float v29 = v23 * v28;
        if (v23 >= v21)
        {
          float v30 = 2.0 / v20;
          float v31 = v30 / v23;
          float v28 = v31;
        }
        float v67 = v14;
        float v68 = v28;
        if (v23 >= v21) {
          float v32 = 2.0 / v20;
        }
        else {
          float v32 = v29;
        }
        float v65 = v32;
        float v66 = v14 + v18;
        if (v23 >= v21) {
          float v33 = v21 / v23;
        }
        else {
          float v33 = 1.0;
        }
        if (v23 >= v21) {
          float v34 = 1.0;
        }
        else {
          float v34 = v23 / v21;
        }
        if (*((unsigned char *)a2 + 2)) {
          float v35 = v24;
        }
        else {
          float v35 = v26;
        }
        if (*((unsigned char *)a2 + 2)) {
          float v36 = v25;
        }
        else {
          float v36 = v27;
        }
        if (*((float *)a2 + 1) < v36)
        {
          id v37 = v8;
          CFStringRef v38 = v10;
          id v39 = [v12 objectForKey:@"image"];
          [v39 setClampMode:2];
          char v69 = 0;
          *(float *)&double v40 = v23;
          [v39 setOnContext:a3 onTextureUnit:0 withReferenceAspectRatio:&v69 state:v40];
          uint64_t v41 = 0;
          uint64_t v42 = *a2 - 1;
          uint64_t v43 = 10;
          while (v42 != v41)
          {
            ++v41;
            float v44 = *(float *)&a2[v43];
            v43 += 8;
            if (v44 > v35)
            {
              uint64_t v42 = v41 - 1;
              break;
            }
          }
          BOOL v45 = &a2[8 * v42];
          if (v35 >= *((float *)v45 + 1)) {
            float v46 = v35;
          }
          else {
            float v46 = *((float *)v45 + 1);
          }
          unsigned __int8 v47 = objc_msgSend(objc_msgSend(v12, "objectForKey:", @"needsBlend"), "BOOLValue");
          if (v64)
          {
            if (v47)
            {
              char v64 = 1;
              goto LABEL_44;
            }
            uint64_t v48 = 0;
LABEL_42:
            v64 ^= 1u;
            [a3 blend:v48];
          }
          else
          {
            if (v47)
            {
              uint64_t v48 = 2;
              goto LABEL_42;
            }
            char v64 = 0;
          }
LABEL_44:
          uint64_t v49 = (uint64_t)&a2[8 * v42 + 8];
          uint64_t v50 = v42 - 1;
          do
          {
            if (++v50 >= (unint64_t)(*a2 - 1)) {
              break;
            }
            float v51 = v46;
            float v52 = *(float *)(v49 + 4);
            if (v36 >= v52) {
              float v46 = *(float *)(v49 + 4);
            }
            else {
              float v46 = v36;
            }
            if (!*(unsigned char *)v49)
            {
              float v53 = *(float *)(v49 - 12);
              if (vabds_f32(v52, v53) > 0.00001)
              {
                float v54 = (float)(v51 - v53) / (float)(v52 - v53);
                float v55 = (float)(v52 - v46) / (float)(v52 - v53);
                float v56 = *(float *)(v49 - 8);
                float v57 = *(float *)(v49 - 4);
                float v58 = *(float *)(v49 + 8);
                float v59 = *(float *)(v49 + 12);
                float v60 = v56 + (float)((float)(v58 - v56) * v54);
                float v61 = v58 + (float)((float)(v56 - v58) * v55);
                float v62 = v59 + (float)((float)(v57 - v59) * v55);
                if (*((unsigned char *)a2 + 2))
                {
                  float v83 = v60;
                  float v84 = v26;
                  float v85 = v57 + (float)((float)(v59 - v57) * v54);
                  float v86 = v61;
                  float v87 = v26;
                  float v88 = v62;
                  float v89 = v60;
                  float v90 = v27;
                  float v91 = v85;
                  float v92 = v61;
                  float v93 = v27;
                  float v94 = v62;
                  float v75 = (float)((float)(v51 - v35) * v68) - v33;
                  float v76 = -v34;
                  float v77 = (float)((float)(v46 - v35) * v68) - v33;
                  float v78 = -v34;
                  float v79 = v75;
                  float v80 = v34;
                  float v81 = v77;
                  float v82 = v34;
                }
                else
                {
                  float v83 = v67;
                  float v84 = v60;
                  float v85 = v57 + (float)((float)(v59 - v57) * v54);
                  float v86 = v67;
                  float v87 = v61;
                  float v88 = v62;
                  float v89 = v66;
                  float v90 = v60;
                  float v91 = v85;
                  float v92 = v66;
                  float v93 = v61;
                  float v94 = v62;
                  float v75 = -v33;
                  float v76 = (float)((float)(v51 - v35) * v65) - v34;
                  float v77 = -v33;
                  float v78 = (float)((float)(v46 - v35) * v65) - v34;
                  float v79 = v33;
                  float v80 = v76;
                  float v81 = v33;
                  float v82 = v78;
                }
                SetLightingColors(v74, &v83, *(float *)[a3 foreColor]);
                [a3 setShader:@"ColoredTexture"];
                [a3 setVertex3DPointer:&v83];
                [a3 setTextureCoordinatesPointer:&v75 onTextureUnit:0];
                [a3 setColorsPointer:v74];
                [a3 drawTriangleStripFromOffset:0 count:4];
                [a3 unsetColorsPointer];
                [a3 unsetTextureCoordinatesPointerOnTextureUnit:0];
                [a3 unsetVertexPointer];
                [a3 unsetShader];
              }
            }
            v49 += 16;
          }
          while (v46 < v36);
          [v39 unsetOnContext:a3 onTextureUnit:0 state:&v69];
          CFStringRef v10 = v38;
          id v8 = v37;
        }
        float v11 = (char *)v11 + 1;
      }
      while (v11 != v8);
      id result = [obj countByEnumeratingWithState:&v70 objects:v95 count:16];
      id v8 = result;
      if (!result)
      {
        if (v64) {
          return [a3 blend:0];
        }
        return result;
      }
    }
  }
  return result;
}

id RenderPatchworkWithMeshInverted(void *a1, unsigned __int16 *a2, void *a3)
{
  float v5 = &selRef_sortPatchworkDescendingVertical_;
  if (*((unsigned char *)a2 + 2)) {
    float v5 = &selRef_sortPatchworkDescendingHorizontal_;
  }
  id v6 = [a1 sortedArrayUsingSelector:*v5];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id obj = v6;
  id result = [v6 countByEnumeratingWithState:&v71 objects:v96 count:16];
  if (result)
  {
    id v8 = result;
    char v65 = 0;
    uint64_t v9 = *(void *)v72;
    v63 = a2 + 2;
    double v10 = 2.0;
    while (1)
    {
      float v11 = 0;
      do
      {
        if (*(void *)v72 != v9) {
          objc_enumerationMutation(obj);
        }
        float v12 = *(void **)(*((void *)&v71 + 1) + 8 * (void)v11);
        objc_msgSend(objc_msgSend(v12, "objectForKey:", @"rectangle", v63), "CGRectValue");
        double v14 = v13;
        double v16 = v15;
        double v18 = v17;
        double v20 = v19;
        double v21 = v17 / v19;
        objc_msgSend(objc_msgSend(v12, "objectForKey:", @"referenceAspectRatio"), "floatValue");
        if (v22 == 0.0) {
          double v23 = v21;
        }
        else {
          double v23 = v22;
        }
        float v24 = v14;
        float v25 = v14 + v18;
        float v26 = v16;
        float v27 = v16 + v20;
        if (v23 >= v21)
        {
          float v30 = v10 / v20;
          float v31 = v30 / v23;
          float v32 = v31;
        }
        else
        {
          float v32 = v10 / v18;
        }
        if (v23 >= v21)
        {
          float v33 = v10 / v20;
        }
        else
        {
          float v28 = v10 / v18;
          float v29 = v23 * v28;
          float v33 = v29;
        }
        float v66 = v33;
        float v67 = v24;
        if (v23 >= v21) {
          float v34 = v21 / v23;
        }
        else {
          float v34 = 1.0;
        }
        float v68 = v32;
        float v69 = v34;
        if (v23 >= v21) {
          float v35 = 1.0;
        }
        else {
          float v35 = v23 / v21;
        }
        if (*((unsigned char *)a2 + 2)) {
          float v36 = v24;
        }
        else {
          float v36 = v26;
        }
        if (*((unsigned char *)a2 + 2)) {
          float v37 = v25;
        }
        else {
          float v37 = v27;
        }
        uint64_t v38 = *a2;
        int v39 = v38 - 1;
        if (*(float *)&a2[8 * v38 - 6] > v36)
        {
          id v40 = v8;
          id v41 = [v12 objectForKey:@"image"];
          [v41 setClampMode:2];
          char v70 = 0;
          *(float *)&double v42 = v23;
          [v41 setOnContext:a3 onTextureUnit:0 withReferenceAspectRatio:&v70 state:v42];
          uint64_t v43 = (float *)&a2[8 * v39 - 6];
          while (1)
          {
            LODWORD(v38) = v38 - 1;
            if ((int)v38 < 1) {
              break;
            }
            float v44 = *v43;
            v43 -= 4;
            if (v44 < v37) {
              goto LABEL_35;
            }
          }
          LODWORD(v38) = v39 & (v39 >> 31);
LABEL_35:
          BOOL v45 = &a2[8 * (int)v38];
          if (v37 >= *((float *)v45 + 1)) {
            float v46 = *((float *)v45 + 1);
          }
          else {
            float v46 = v37;
          }
          unsigned __int8 v47 = objc_msgSend(objc_msgSend(v12, "objectForKey:", @"needsBlend"), "BOOLValue");
          if (v65)
          {
            if (v47)
            {
              char v65 = 1;
              goto LABEL_46;
            }
            uint64_t v48 = 0;
LABEL_44:
            v65 ^= 1u;
            [a3 blend:v48];
          }
          else
          {
            if (v47)
            {
              uint64_t v48 = 1;
              goto LABEL_44;
            }
            char v65 = 0;
          }
LABEL_46:
          int v49 = v38 + 1;
          uint64_t v50 = &v63[8 * v38];
          do
          {
            if (--v49 < 1) {
              break;
            }
            float v51 = v46;
            float v52 = *((float *)v50 - 4);
            if (v36 >= v52) {
              float v46 = v36;
            }
            else {
              float v46 = *((float *)v50 - 4);
            }
            if (!*((unsigned char *)v50 + 12))
            {
              float v53 = *(float *)v50;
              if (vabds_f32(*(float *)v50, v52) > 0.00001)
              {
                float v54 = v53 - v52;
                float v55 = (float)(v46 - v52) / (float)(v53 - v52);
                float v56 = (float)(v53 - v51) / v54;
                float v57 = *((float *)v50 - 3);
                float v58 = *((float *)v50 - 2);
                float v59 = *((float *)v50 + 1);
                float v60 = *((float *)v50 + 2);
                float v61 = v57 + (float)((float)(v59 - v57) * v55);
                float v62 = v59 + (float)((float)(v57 - v59) * v56);
                if (*((unsigned char *)a2 + 2))
                {
                  float v84 = v61;
                  float v85 = v26;
                  float v86 = v58 + (float)((float)(v60 - v58) * v55);
                  float v87 = v62;
                  float v88 = v26;
                  float v89 = v60 + (float)((float)(v58 - v60) * v56);
                  float v90 = v61;
                  float v91 = v27;
                  float v92 = v86;
                  float v93 = v62;
                  float v94 = v27;
                  float v95 = v89;
                  float v76 = (float)((float)(v46 - v36) * v68) - v69;
                  float v77 = -v35;
                  float v78 = (float)((float)(v51 - v36) * v68) - v69;
                  float v79 = -v35;
                  float v80 = v76;
                  float v81 = v35;
                  float v82 = v78;
                  float v83 = v35;
                }
                else
                {
                  float v84 = v67;
                  float v85 = v61;
                  float v86 = v58 + (float)((float)(v60 - v58) * v55);
                  float v87 = v67;
                  float v88 = v62;
                  float v89 = v60 + (float)((float)(v58 - v60) * v56);
                  float v90 = v25;
                  float v91 = v61;
                  float v92 = v86;
                  float v93 = v25;
                  float v94 = v62;
                  float v95 = v89;
                  float v76 = -v69;
                  float v77 = (float)((float)(v46 - v36) * v66) - v35;
                  float v78 = -v69;
                  float v79 = (float)((float)(v51 - v36) * v66) - v35;
                  float v80 = v69;
                  float v81 = v77;
                  float v82 = v69;
                  float v83 = v79;
                }
                SetLightingColors(v75, &v84, *(float *)[a3 foreColor]);
                [a3 setShader:@"ColoredTexture"];
                [a3 setVertex3DPointer:&v84];
                [a3 setTextureCoordinatesPointer:&v76 onTextureUnit:0];
                [a3 setColorsPointer:v75];
                [a3 drawTriangleStripFromOffset:0 count:4];
                [a3 unsetColorsPointer];
                [a3 unsetTextureCoordinatesPointerOnTextureUnit:0];
                [a3 unsetVertexPointer];
                [a3 unsetShader];
              }
            }
            v50 -= 8;
          }
          while (v46 > v36);
          [v41 unsetOnContext:a3 onTextureUnit:0 state:&v70];
          id v8 = v40;
          double v10 = 2.0;
        }
        float v11 = (char *)v11 + 1;
      }
      while (v11 != v8);
      id result = [obj countByEnumeratingWithState:&v71 objects:v96 count:16];
      id v8 = result;
      if (!result)
      {
        if (v65) {
          return [a3 blend:0];
        }
        return result;
      }
    }
  }
  return result;
}

float *Antialias1D(uint64_t a1, uint64_t a2, uint64_t a3, float *a4, uint64_t a5, float a6, float a7)
{
  float v7 = a4[5];
  float v9 = a4[2];
  float v8 = a4[3];
  float v10 = *a4;
  if (v8 == *a4)
  {
    float v11 = vabds_f32(a4[4], a4[1]);
    float v12 = a4[6] - v10;
    uint64_t v13 = 9;
  }
  else
  {
    float v11 = vabds_f32(v8, v10);
    float v10 = a4[1];
    float v12 = a4[7] - v10;
    uint64_t v13 = 10;
  }
  float v14 = fabsf(v12);
  float v15 = 0.0;
  float v16 = 0.0;
  if ((float)(v7 - v9) != 0.0)
  {
    float v17 = vabds_f32(v7, v9);
    float v18 = fabsf(a4[v13]);
    float v19 = v17 + v17;
    float v20 = v11 / (float)(fabsf(v10) + 1.0);
    if (v20 < v17) {
      float v20 = v17;
    }
    float v15 = v19 / v20;
    float v21 = v11 / (float)(v18 + 1.0);
    if (v21 >= v17) {
      float v17 = v21;
    }
    float v16 = v19 / v17;
  }
  float v22 = v14 * a6;
  float v23 = (float)((float)(v15 * 0.6) + 0.25) / (float)(v14 * a6);
  for (uint64_t i = 6; i != 12; ++i)
  {
    float v25 = (float *)(a1 + i * 4);
    *(v25 - 6) = a4[i - 6] - (float)((float)(a4[i] - a4[i - 6]) * v23);
    v25[12] = a4[i]
            + (float)((float)((float)(a4[i] - a4[i - 6]) * (float)(a4[i] - a4[i - 6]))
                    * (float)((float)((float)(v16 * 0.6) + 0.25) / v22));
    *float v25 = a4[i - 6];
    v25[6] = a4[i];
  }
  uint64_t v26 = 0;
  uint64_t v27 = a5 + 16;
  do
  {
    float v28 = (_DWORD *)(a2 + 16 + v26);
    *(v28 - 4) = *(_DWORD *)(a5 + v26);
    v28[8] = *(_DWORD *)(v27 + v26);
    *float v28 = *(_DWORD *)(a5 + v26);
    v28[4] = *(_DWORD *)(v27 + v26);
    v26 += 4;
  }
  while (v26 != 16);
  *(_OWORD *)(a3 + 96) = 0u;
  *(_OWORD *)(a3 + 112) = 0u;
  *(_OWORD *)(a3 + 64) = 0u;
  *(_OWORD *)(a3 + 80) = 0u;
  *(_OWORD *)(a3 + 48) = 0u;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  return SetLightingColors((float *)(a3 + 32), a4, a7);
}

void DoWobble(float *a1, float *a2, double a3)
{
  if (a3 > 1.0) {
    a3 = 1.0;
  }
  float v4 = a3 * (a3 + a3 * 1.33333337 * a3 + 0.666666687) * 1.33333337;
  *a1 = v4;
  float v5 = (a3 + 0.5) * 3.14159274;
  float v6 = sqrt((float)((float)(sinf(v5) + 1.0) * 0.5)) + 0.00001;
  if (v4 > 0.0) {
    float v6 = (float)(sinf(v4 * 3.1416) * v6) / (float)(v4 + (float)((float)(v4 * 0.5) * v4));
  }
  *a2 = v6;
}

void DoWobbleSlow(float *a1, float *a2, double a3)
{
  if (a3 > 1.0) {
    a3 = 1.0;
  }
  float v4 = a3 * (a3 + a3 * 0.666666687 * a3 + 1.33333337) * 1.33333337;
  *a1 = v4;
  float v5 = (a3 + 0.5) * 3.14159274;
  float v6 = sqrt((float)((float)(sinf(v5) + 1.0) * 0.5)) + 0.00001;
  if (v4 <= 0.0) {
    float v7 = v6 * 3.1416;
  }
  else {
    float v7 = (float)(sinf(v4 * 3.1416) * v6) / (float)(v4 + (float)((float)(v4 * 0.5) * v4));
  }
  *a2 = v7;
}

float32x4_t MyGLRectFromString(void *a1, float32x4_t *a2)
{
  if (a1)
  {
    float64x2_t v15 = 0u;
    float64x2_t v16 = 0u;
    sscanf((const char *)[a1 UTF8String], "{{%lf, %lf}, {%lf, %lf}}", &v15, &v15.f64[1], &v16, &v16.f64[1]);
    __asm { FMOV            V2.2D, #0.5 }
    float64x2_t v8 = vmulq_f64(v16, _Q2);
    *(float32x2_t *)&_Q2.f64[0] = vcvt_f32_f64(v8);
    float64x2_t v9 = vcvtq_f64_f32(*(float32x2_t *)&_Q2.f64[0]);
    float32x4_t v10 = vcvt_hight_f32_f64(*(int32x2_t *)&_Q2.f64[0], v8);
    float64x2_t v11 = vaddq_f64(v15, v9);
    float32x4_t v12 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v11), v11);
    float32x4_t result = vmlaq_f32(v12, *a2, v10);
    float32x4_t v14 = vmlaq_f32(v12, a2[1], v10);
    *a2 = result;
    a2[1] = v14;
  }
  return result;
}

void sub_BF01C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_BF5F0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_BFA54(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_BFB60(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL TrianglesAreDisjoint(double *a1, double *a2)
{
  double v3 = *a1;
  double v2 = a1[1];
  double v4 = a1[2];
  double v5 = a1[3];
  double v6 = v5 - v2;
  double v7 = *a1 - v4;
  double v8 = v4 * v2 - *a1 * v5;
  double v9 = a1[4];
  double v10 = a1[5];
  double v11 = v8 + v7 * v10 + (v5 - v2) * v9;
  double v12 = *a2;
  double v13 = a2[1];
  if (v11 * (v8 + v7 * v13 + (v5 - v2) * *a2) <= 0.0
    && v11 * (v8 + v7 * a2[3] + v6 * a2[2]) <= 0.0
    && v11 * (v8 + v7 * a2[5] + v6 * a2[4]) <= 0.0)
  {
    return 1;
  }
  double v14 = v10 - v5;
  double v15 = v4 - v9;
  double v16 = v9 * v5 - v4 * v10;
  double v17 = v2 * (v4 - v9) + (v10 - v5) * v3 + v16;
  if (v17 * (v16 + (v4 - v9) * v13 + (v10 - v5) * v12) <= 0.0
    && v17 * (v16 + v15 * a2[3] + v14 * a2[2]) <= 0.0
    && v17 * (v16 + v15 * a2[5] + v14 * a2[4]) <= 0.0)
  {
    return 1;
  }
  double v18 = v2 - v10;
  double v19 = v9 - v3;
  double v20 = v3 * v10 - v9 * v2;
  double v21 = v20 + v5 * (v9 - v3) + v18 * v4;
  return v21 * (v20 + (v9 - v3) * v13 + v18 * v12) <= 0.0
      && v21 * (v20 + v19 * a2[3] + v18 * a2[2]) <= 0.0
      && v21 * (v20 + v19 * a2[5] + v18 * a2[4]) <= 0.0;
}

BOOL PointsAreEqual(double *a1, double *a2)
{
  return vabdd_f64(*a1, *a2) < 0.00001 && vabdd_f64(a1[1], a2[1]) < 0.00001;
}

BOOL TrianglesAreEqual(double *a1, double *a2)
{
  double v2 = *a1;
  double v3 = *a2;
  if ((vabdd_f64(*a1, *a2) >= 0.00001 || vabdd_f64(a1[1], a2[1]) >= 0.00001)
    && (vabdd_f64(a1[2], v3) >= 0.00001 || vabdd_f64(a1[3], a2[1]) >= 0.00001)
    && (vabdd_f64(a1[4], v3) >= 0.00001 || vabdd_f64(a1[5], a2[1]) >= 0.00001))
  {
    return 0;
  }
  double v4 = a2[2];
  if ((vabdd_f64(v2, v4) >= 0.00001 || vabdd_f64(a1[1], a2[3]) >= 0.00001)
    && (vabdd_f64(a1[2], v4) >= 0.00001 || vabdd_f64(a1[3], a2[3]) >= 0.00001)
    && (vabdd_f64(a1[4], v4) >= 0.00001 || vabdd_f64(a1[5], a2[3]) >= 0.00001))
  {
    return 0;
  }
  double v5 = a2[4];
  if (vabdd_f64(v2, v5) < 0.00001 && vabdd_f64(a1[1], a2[5]) < 0.00001
    || vabdd_f64(a1[2], v5) < 0.00001 && vabdd_f64(a1[3], a2[5]) < 0.00001)
  {
    return 1;
  }
  return vabdd_f64(a1[4], v5) < 0.00001 && vabdd_f64(a1[5], a2[5]) < 0.00001;
}

uint64_t SortByAngleAndDistance(uint64_t a1, unsigned int *a2, unsigned int *a3)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *a3;
  double v5 = *(double *)(a1 + 8 * v3);
  double v6 = *(double *)(a1 + 8 * v4);
  if ((*(unsigned char *)(a1 + 144 + v4) & *(unsigned char *)(a1 + 144 + v3)) != 0 && fabs(vabdd_f64(v5, v6) + -3.14159274) > 1.0)
  {
    double v7 = *(double *)(a1 + 72 + 8 * v3);
    double v8 = *(double *)(a1 + 72 + 8 * v4);
    if (v7 < v8) {
      unsigned int v9 = 1;
    }
    else {
      unsigned int v9 = -1;
    }
    if (v7 >= v8) {
      unsigned int v10 = 1;
    }
    else {
      unsigned int v10 = -1;
    }
    if (v5 > 3.14160274) {
      return v10;
    }
    else {
      return v9;
    }
  }
  else if (v5 >= v6)
  {
    return 1;
  }
  else
  {
    return 0xFFFFFFFFLL;
  }
}

void sub_CC124(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_CC1D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_CC35C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_CC410(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_CC8E8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_CCBE0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_CCC88(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_CE7B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_CE86C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_CF184(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_CF244(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

double randomFloatInRange(double a1, double a2)
{
  return a1 + (double)random() * 4.65661287e-10 * (a2 - a1);
}

uint64_t sortRectangles1(void *a1, void *a2, int *a3)
{
  if (a3)
  {
    int v4 = *a3;
    [a1 CGRectValue];
    double v6 = v5;
    double v8 = v7;
    [a2 CGRectValue];
    switch(v4)
    {
      case 3:
        BOOL v11 = v8 < v10;
        BOOL v12 = v8 <= v10;
        goto LABEL_9;
      case 2:
        BOOL v14 = v8 < v10;
        BOOL v15 = v8 <= v10;
        goto LABEL_16;
      case 1:
        BOOL v11 = v6 < v9;
        BOOL v12 = v6 <= v9;
LABEL_9:
        uint64_t v16 = v11;
        if (v12) {
          return v16;
        }
        else {
          return -1;
        }
    }
  }
  else
  {
    [a1 CGRectValue];
    double v6 = v13;
    [a2 CGRectValue];
  }
  BOOL v14 = v6 < v9;
  BOOL v15 = v6 <= v9;
LABEL_16:
  uint64_t v18 = !v15;
  if (v14) {
    return -1;
  }
  else {
    return v18;
  }
}

double FloorRect(double a1)
{
  float v1 = a1;
  return floorf(v1);
}

double CenterRectOverPoint(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5)
{
  double Width = CGRectGetWidth(*(CGRect *)&a1);
  v12.origin.CGFloat x = a1;
  v12.origin.CGFloat y = a2;
  v12.size.CGFloat width = a3;
  v12.size.CGFloat height = a4;
  CGRectGetHeight(v12);
  return a5 - Width * 0.5;
}

double CenterRectOverRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  v19.origin.CGFloat x = a5;
  v19.origin.CGFloat y = a6;
  v19.size.CGFloat width = a7;
  v19.size.CGFloat height = a8;
  double MidX = CGRectGetMidX(v19);
  v20.origin.CGFloat x = a5;
  v20.origin.CGFloat y = a6;
  v20.size.CGFloat width = a7;
  v20.size.CGFloat height = a8;
  CGRectGetMidY(v20);
  v21.origin.CGFloat x = a1;
  v21.origin.CGFloat y = a2;
  v21.size.CGFloat width = a3;
  v21.size.CGFloat height = a4;
  double Width = CGRectGetWidth(v21);
  v22.origin.CGFloat x = a1;
  v22.origin.CGFloat y = a2;
  v22.size.CGFloat width = a3;
  v22.size.CGFloat height = a4;
  CGRectGetHeight(v22);
  return MidX - Width * 0.5;
}

void sub_D6464(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_D7468(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_D7ADC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_D7D64(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_D8540(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_D8C10(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_DC738(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_DC988(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_DCA30(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_DCB80(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_DCE70(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_DCEC4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_DD498(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  objc_sync_exit(v15);
  _Unwind_Resume(a1);
}

void sub_DD538(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_DD5E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

MRImage *_GetImage(void *a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, double a7, double a8, double a9)
{
  id v18 = [a1 imageManager];
  unsigned __int8 v19 = [a1 isEmbeddedAsset];
  if (v19) {
    id v20 = 0;
  }
  else {
    id v20 = objc_msgSend(objc_msgSend(v18, "baseContext"), "assetManager");
  }
  [a1 originalSize];
  double v22 = v21;
  double v24 = v23;
  if ((a5 & 1) == 0)
  {
    id v33 = objc_msgSend(objc_msgSend(v18, "baseContext"), "clippedSizeWithSize:", a7, a8);
    double v34 = a8 * (double)v33;
    double v35 = a7 * (double)HIDWORD(v33);
    BOOL v36 = v34 < v35;
    double v37 = v34 / a7;
    double v38 = v35 / a8;
    if (v36) {
      double v39 = v38;
    }
    else {
      double v39 = (double)v33;
    }
    if (v36) {
      double v40 = (double)HIDWORD(v33);
    }
    else {
      double v40 = v37;
    }
    id v25 = [a1 path];
    unsigned __int8 v80 = 0;
    if (v19)
    {
      id v41 = v18;
      id v26 = 0;
LABEL_35:
      id v43 = v25;
      goto LABEL_36;
    }
    goto LABEL_25;
  }
  id v25 = [a1 path];
  unsigned __int8 v80 = 0;
  if ((v19 & 1) == 0)
  {
    double v40 = 256.0;
    double v39 = 256.0;
LABEL_25:
    id v75 = v25;
    double v42 = (CGImage *)objc_msgSend(v20, "CGImageForAssetAtPath:andSize:orientation:thumbnailIfPossible:now:", v25, &v80, a5, a6, v39, v40);
    id v26 = 0;
    if (v42) {
      goto LABEL_77;
    }
    goto LABEL_26;
  }
  id v26 = objc_msgSend(-[NSArray lastObject](NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1), "lastObject"), "stringByAppendingPathComponent:", @"com.apple.iLifeSlideshow/Thumbnail Cache");
  if (!v26)
  {
    id v41 = v18;
    double v40 = 256.0;
    double v39 = 256.0;
    goto LABEL_35;
  }
  id v71 = v20;
  unsigned int v72 = a2;
  id v75 = v25;
  id v27 = [v25 pathComponents];
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v28 = [v27 countByEnumeratingWithState:&v76 objects:v81 count:16];
  if (v28)
  {
    id v29 = v28;
    id v70 = v18;
    int v73 = a4;
    uint64_t v30 = *(void *)v77;
    while (2)
    {
      for (uint64_t i = 0; i != v29; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v77 != v30) {
          objc_enumerationMutation(v27);
        }
        float v32 = *(void **)(*((void *)&v76 + 1) + 8 * i);
        if ([v32 rangeOfString:@".mrb"] != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          if (v32) {
            id v26 = [v26 stringByAppendingPathComponent:v32];
          }
          goto LABEL_30;
        }
      }
      id v29 = [v27 countByEnumeratingWithState:&v76 objects:v81 count:16];
      if (v29) {
        continue;
      }
      break;
    }
LABEL_30:
    a4 = v73;
    id v18 = v70;
  }
  id v20 = v71;
  [+[NSFileManager defaultManager] createDirectoryAtPath:v26 withIntermediateDirectories:1 attributes:0 error:0];
  id v26 = objc_msgSend(v26, "stringByAppendingPathComponent:", objc_msgSend(v27, "lastObject"));
  if (![+[NSFileManager defaultManager] fileExistsAtPath:v26])
  {
    NSLog(@"Creating thumbnail at path %@ for path %@", v26, v75);
    double v39 = 256.0;
    double v40 = 256.0;
    a2 = v72;
    if (v19) {
      goto LABEL_27;
    }
    goto LABEL_73;
  }
  double v40 = 256.0;
  double v42 = (CGImage *)objc_msgSend(v18, "CGImageWithPath:withOriginalSize:forSize:orientation:", v26, &v80, 256.0, 256.0, 256.0, 256.0);
  double v39 = 256.0;
  a2 = v72;
  if (v42) {
    goto LABEL_77;
  }
LABEL_26:
  if (v19)
  {
LABEL_27:
    id v41 = v18;
    id v25 = v75;
    goto LABEL_35;
  }
LABEL_73:
  int v74 = a4;
  int v59 = a3;
  id v25 = v75;
  if (objc_opt_respondsToSelector())
  {
    id v60 = objc_msgSend(v20, "dataForAssetAtPath:andSize:", v75, v39, v40);
    if (v60)
    {
      id v61 = v60;
      [a1 isSupportedMovie];
      id v41 = v18;
      double v42 = (CGImage *)objc_msgSend(v18, "CGImageWithData:withOriginalSize:forSize:orientation:", v61, &v80, v22, v24, v39, v40);
      a3 = v59;
      a4 = v74;
      if (!v42) {
        goto LABEL_76;
      }
      goto LABEL_53;
    }
  }
  id v41 = v18;
  id v43 = objc_msgSend(v20, "absolutePathForAssetAtPath:andSize:", v75, v39, v40);
  a4 = v74;
LABEL_36:
  if (![a1 isSupportedMovie] || !v43)
  {
    if (!v43) {
      goto LABEL_88;
    }
    id v75 = v25;
LABEL_52:
    double v42 = (CGImage *)objc_msgSend(v41, "CGImageWithPath:withOriginalSize:forSize:orientation:", v43, &v80, v22, v24, v39, v40);
    if (!v42) {
      goto LABEL_76;
    }
LABEL_53:
    if (v26)
    {
      CGImageAlphaInfo AlphaInfo = CGImageGetAlphaInfo(v42);
      float v53 = +[UIImage imageWithCGImage:v42];
      id v18 = v41;
      if (AlphaInfo - 1 > 3) {
        float v54 = UIImageJPEGRepresentation(v53, 0.9);
      }
      else {
        float v54 = UIImagePNGRepresentation(v53);
      }
      [(NSData *)v54 writeToFile:v26 atomically:0];
      if (a5) {
        goto LABEL_78;
      }
      goto LABEL_40;
    }
LABEL_76:
    id v18 = v41;
    if (v42)
    {
LABEL_77:
      if (a5) {
        goto LABEL_78;
      }
LABEL_40:
      double Width = (double)CGImageGetWidth(v42);
      size_t Height = CGImageGetHeight(v42);
      double v47 = (double)Height;
      if (v80 <= 4u) {
        double v48 = Width;
      }
      else {
        double v48 = (double)Height;
      }
      if (v80 > 4u) {
        double v47 = Width;
      }
      double v49 = a8 * v48;
      double v50 = a8 * v48 / a7 - v47;
      double v51 = a7 * v47 / v48;
      if (v47 > a8) {
        double v50 = v51 - a8;
      }
      if (fabs(v50) >= 2.0)
      {
        if (v48 >= a7 * 1.5)
        {
          if (a7 * v47 <= v49)
          {
            double v48 = v49 / v47;
            double v51 = a8;
            a7 = v49 / v47;
          }
          else
          {
            double v48 = a7;
            a8 = v51;
          }
LABEL_58:
          id v55 = objc_msgSend(objc_msgSend(v18, "baseContext"), "clippedSizeWithSize:", v48, v51);
          if (v80 <= 4u) {
            unsigned int v56 = v55;
          }
          else {
            unsigned int v56 = HIDWORD(v55);
          }
          if (v80 <= 4u) {
            uint64_t v57 = HIDWORD(v55);
          }
          else {
            uint64_t v57 = v55;
          }
          if (a4)
          {
            unsigned int v58 = 1 << vcvtpd_u64_f64(log2((double)v56 * 0.8));
            uint64_t v57 = (1 << vcvtpd_u64_f64(log2((double)v57 * 0.8)));
          }
          else
          {
            unsigned int v58 = (v56 + 15) & 0xFFFFFFF0;
          }
          goto LABEL_79;
        }
      }
      else if (a7 <= v48)
      {
        double v48 = v39;
        double v51 = v40;
        goto LABEL_58;
      }
      double v51 = v47;
      goto LABEL_58;
    }
LABEL_88:
    char v65 = 0;
    goto LABEL_87;
  }
  id v75 = v25;
  float v44 = (CGImage *)objc_msgSend(v41, "CGImageWithMoviePath:withOriginalSize:forSize:atTime:orientation:", v43, &v80, v22, v24, v39, v40, a9);
  if (!v44) {
    goto LABEL_52;
  }
  double v42 = v44;
  id v18 = v41;
  if ((a5 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_78:
  unsigned int v58 = 256;
  uint64_t v57 = 256;
LABEL_79:
  float v62 = [MRTextureSource alloc];
  v63 = [(MRTextureSource *)v62 initWithCGImage:v42 textureSize:v58 | (unint64_t)(v57 << 32) orientation:v80 imageManager:v18 monochromatic:a2];
  *((unsigned char *)[(MRTextureSource *)v63 textureOptions] + 5) = a4;
  if (a5)
  {
    [(MRTextureSource *)v63 setWantsSharedTexture:1];
    id v64 = v75;
  }
  else
  {
    id v64 = v75;
    if (a3) {
      [(MRTextureSource *)v63 generateMipmap];
    }
  }
  char v65 = -[MRImage initWithTextureSource:andSize:]([MRImage alloc], "initWithTextureSource:andSize:", v63, a7, a8);

  if (a5) {
    float v66 = +[NSString stringWithFormat:@"Marimba '%@' Thumbnail", v64, v68, v69];
  }
  else {
    float v66 = +[NSString stringWithFormat:@"Marimba '%@' %dx%d", v64, (int)a7, (int)a8];
  }
  [(MRImage *)v65 setLabel:v66];
LABEL_87:
  [(MRImage *)v65 texture];
  return v65;
}

void sub_DDDCC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_DDF2C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_DE1C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_DE3F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_DE524(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_DE700(uint64_t a1)
{
  [*(id *)(a1 + 32) cancelPendingPrerolls];
  [*(id *)(a1 + 40) cancelPendingSeeks];
  [*(id *)(a1 + 32) setRate:0.0];
  [*(id *)(a1 + 40) removeOutput:*(void *)(a1 + 48)];

  double v2 = *(const void **)(a1 + 56);
  if (v2)
  {
    CFRelease(v2);
  }
}

char *sub_DE894(uint64_t a1)
{
  double v2 = *(void **)(*(void *)(a1 + 32) + 72);
  CMTimeMake(&v6, (uint64_t)(*(double *)(a1 + 40) * 1000000.0), 1000000);
  [v2 seekToTime:&v6];
  uint64_t v3 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v3 + 140))
  {
    [*(id *)(v3 + 72) pause];
    uint64_t v3 = *(void *)(a1 + 32);
  }
  float32x4_t result = (char *)[*(id *)(v3 + 72) rate];
  if (v5 == 0.0)
  {
    float32x4_t result = (char *)[*(id *)(*(void *)(a1 + 32) + 72) status];
    if (result == (unsigned char *)&dword_0 + 1) {
      return (char *)[*(id *)(*(void *)(a1 + 32) + 88) requestNotificationOfMediaDataChangeWithAdvanceInterval:0.0];
    }
  }
  return result;
}

char *sub_DEA04(uint64_t a1, double a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  LODWORD(a2) = 1.0;
  if (!*(unsigned char *)(v3 + 140)) {
    *(float *)&a2 = 0.0;
  }
  [*(id *)(v3 + 72) setRate:a2];
  float32x4_t result = (char *)[*(id *)(*(void *)(a1 + 32) + 72) rate];
  if (v5 == 0.0)
  {
    float32x4_t result = (char *)[*(id *)(*(void *)(a1 + 32) + 72) status];
    if (result == (unsigned char *)&dword_0 + 1)
    {
      CMTime v6 = *(void **)(*(void *)(a1 + 32) + 88);
      return (char *)[v6 requestNotificationOfMediaDataChangeWithAdvanceInterval:0.0];
    }
  }
  return result;
}

id sub_DEBA0(uint64_t a1)
{
  id result = [*(id *)(*(void *)(a1 + 32) + 72) rate];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(float *)&v3 > 0.0;
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v4 + 140) && !*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    float v5 = *(void **)(v4 + 72);
    LODWORD(v3) = 1.0;
    return [v5 setRate:v3];
  }
  return result;
}

id sub_DEDC8(double *a1)
{
  double v2 = (void *)*((void *)a1 + 4);
  uint64_t v1 = *((void *)a1 + 5);
  double v3 = a1[7];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  void v5[2] = sub_DEE44;
  v5[3] = &unk_1AA6F8;
  *(double *)&v5[4] = a1[6];
  return [v2 _finishLoadingAsset:v1 forTime:v5 completion:v3];
}

intptr_t sub_DEE44(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_DEF08(uint64_t a1)
{
  [*(id *)(a1 + 32) _finishLoadingAsset:*(void *)(a1 + 40) andVideoTrack:*(void *)(a1 + 48) forTime:*(double *)(a1 + 64)];
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    double v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void sub_DF6E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_DF71C(uint64_t a1, uint64_t a2)
{
}

void sub_DF72C(uint64_t a1)
{
}

void sub_DF738(uint64_t a1)
{
  double v2 = *(double *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 32);
  BOOL v4 = v2 >= 0.0 && v2 < *(double *)(v3 + 104);
  *(unsigned char *)(v3 + 140) &= v4;
  *(unsigned char *)(*(void *)(a1 + 32) + 137) = 0;
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(void *)(v5 + 40))
  {
    CMTime v6 = *(void **)(v5 + 88);
    *(_OWORD *)buffer = *(_OWORD *)(a1 + 56);
    uint64_t v21 = *(void *)(a1 + 72);
    if (![v6 hasNewPixelBufferForItemTime:buffer]) {
      goto LABEL_14;
    }
    goto LABEL_10;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  double v8 = *(void **)(*(void *)(a1 + 32) + 88);
  *(_OWORD *)buffer = *(_OWORD *)(a1 + 56);
  uint64_t v21 = *(void *)(a1 + 72);
  if ([v8 hasNewPixelBufferForItemTime:buffer])
  {
LABEL_10:
    double v10 = *(void **)(*(void *)(a1 + 32) + 88);
    *(_OWORD *)buffer = *(_OWORD *)(a1 + 56);
    uint64_t v21 = *(void *)(a1 + 72);
    BOOL v11 = (__CVBuffer *)[v10 copyPixelBufferForItemTime:buffer itemTimeForDisplay:0];
    if (v11)
    {
      CGRect v12 = v11;
      double v13 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      if (v13) {
        [v13 releaseByUser];
      }
      unsigned int Width = CVPixelBufferGetWidth(v12);
      unsigned int Height = CVPixelBufferGetHeight(v12);
      CVOpenGLESTextureCacheFlush(*(CVOpenGLESTextureCacheRef *)(*(void *)(a1 + 32) + 112), 0);
      buffer[0] = 0;
      CVOpenGLESTextureCacheCreateTextureFromImage(kCFAllocatorDefault, *(CVOpenGLESTextureCacheRef *)(*(void *)(a1 + 32) + 112), v12, 0, 0xDE1u, 6408, Width, Height, 0x80E1u, 0x1401u, 0, buffer);
      uint64_t v16 = [MRTextureSource alloc];
      double v17 = -[MRTextureSource initWithCVTexture:size:orientation:imageManager:monochromatic:](v16, "initWithCVTexture:size:orientation:imageManager:monochromatic:", buffer[0], Width | ((unint64_t)Height << 32), *(unsigned __int8 *)(*(void *)(a1 + 32) + 136), [*(id *)(*(void *)(a1 + 32) + 48) imageManager], 0);
      CVBufferRelease(buffer[0]);
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = -[MRImage initWithTextureSource:andSize:]([MRImage alloc], "initWithTextureSource:andSize:", v17, *(double *)(*(void *)(a1 + 32) + 16), *(double *)(*(void *)(a1 + 32) + 24));

      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setLabel:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Marimba '%@' %dx%d %f", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "path"), (int)*(double *)(*(void *)(a1 + 32) + 16), (int)*(double *)(*(void *)(a1 + 32) + 24), *(void *)(a1 + 48))];
      CFRelease(v12);
    }
    goto LABEL_14;
  }
  while (CFAbsoluteTimeGetCurrent() - Current < 1.0)
  {
    usleep(0x4E20u);
    double v9 = *(void **)(*(void *)(a1 + 32) + 88);
    *(_OWORD *)buffer = *(_OWORD *)(a1 + 56);
    uint64_t v21 = *(void *)(a1 + 72);
    if ([v9 hasNewPixelBufferForItemTime:buffer]) {
      goto LABEL_10;
    }
  }
LABEL_14:
  id v18 = *(void **)(*(void *)(a1 + 32) + 72);
  if (v18) {
    [v18 currentTime];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  *(Float64 *)(*(void *)(a1 + 32) + 32) = CMTimeGetSeconds(&time);
}

void sub_DFEC4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_E0070(double *a1)
{
  double v2 = (void *)*((void *)a1 + 4);
  uint64_t v1 = *((void *)a1 + 5);
  double v3 = a1[7];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  void v5[2] = sub_E00EC;
  v5[3] = &unk_1AA6F8;
  *(double *)&v5[4] = a1[6];
  return [v2 _finishLoadingAsset:v1 forTime:v5 completion:v3];
}

intptr_t sub_E00EC(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_E01B0(uint64_t a1)
{
  [*(id *)(a1 + 32) _finishLoadingAsset:*(void *)(a1 + 40) andVideoTrack:*(void *)(a1 + 48) forTime:*(double *)(a1 + 64)];
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    double v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void sub_E0908(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_E1148(_Unwind_Exception *exception_object)
{
}

void sub_E1574(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_E161C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_E1684(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_E17F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_E1C54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_E1F18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_E2110(_Unwind_Exception *exception_object)
{
}

void sub_E2270(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_E2454(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_EB2F0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_EB744(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_EBA3C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_EBC1C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

double StretchRectangle(double *a1, char a2, double a3, double a4)
{
  float v4 = a3 / a4;
  double v5 = a1[1];
  float v6 = *a1;
  int v7 = a2 & 3;
  if (v7 == 3)
  {
    float v6 = v4 * v6;
  }
  else
  {
    if (v7 == 2)
    {
      double v8 = v6 + -1.0;
      double v9 = v4;
      double v10 = 1.0;
    }
    else
    {
      if (v7 != 1) {
        goto LABEL_8;
      }
      double v8 = v6 + 1.0;
      double v9 = v4;
      double v10 = -1.0;
    }
    float v6 = v10 + v8 * v9;
  }
LABEL_8:
  double v11 = v5 * a3;
  float v12 = *a1 + a1[2];
  int v13 = a2 & 0xC;
  if (v13 == 12)
  {
    float v15 = v4 * v12;
  }
  else
  {
    double v14 = v12;
    if (v13 == 8)
    {
      float v15 = (v14 + -1.0) * v4 + 1.0;
    }
    else
    {
      float v15 = (v14 + 1.0) * v4 + -1.0;
      if (v13 != 4) {
        float v15 = *a1 + a1[2];
      }
    }
  }
  double v16 = (v5 + a1[3]) * a3;
  float v17 = a4 / a3;
  float v18 = v11;
  int v19 = a2 & 0x30;
  if (v19 == 48)
  {
    float v18 = v17 * v18;
  }
  else
  {
    if (v19 == 32)
    {
      double v20 = v18 + -1.0;
      double v21 = v17;
      double v22 = 1.0;
    }
    else
    {
      if (v19 != 16) {
        goto LABEL_22;
      }
      double v20 = v18 + 1.0;
      double v21 = v17;
      double v22 = -1.0;
    }
    float v18 = v22 + v20 * v21;
  }
LABEL_22:
  float v23 = v16;
  int v24 = a2 & 0xC0;
  switch(v24)
  {
    case 192:
      float v23 = v17 * v23;
      break;
    case 128:
      double v25 = v23 + -1.0;
      double v26 = v17;
      double v27 = 1.0;
      goto LABEL_28;
    case 64:
      double v25 = v23 + 1.0;
      double v26 = v17;
      double v27 = -1.0;
LABEL_28:
      float v23 = v27 + v25 * v26;
      break;
  }
  *a1 = v6;
  a1[1] = v18 / a4;
  double result = (float)(v23 - v18) / a4;
  a1[2] = (float)(v15 - v6);
  a1[3] = result;
  return result;
}

id ComputeAnimationTimeBounds(void *a1, double *a2)
{
  id v3 = +[NSMutableArray array];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v4 = [a1 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v4)
  {
    id v5 = v4;
    CFStringRef v6 = @"subEffectID";
    CFStringRef v7 = @"unload";
    uint64_t v8 = *(void *)v44;
    do
    {
      double v9 = 0;
      do
      {
        if (*(void *)v44 != v8) {
          objc_enumerationMutation(a1);
        }
        double v10 = *(void **)(*((void *)&v43 + 1) + 8 * (void)v9);
        id v11 = [v10 objectForKey:v6];
        if (([v11 hasSuffix:@"still"] & 1) == 0
          && ([v11 isEqualToString:v7] & 1) == 0)
        {
          CFStringRef v12 = v6;
          int v13 = a1;
          CFStringRef v14 = v7;
          objc_msgSend(objc_msgSend(v10, "objectForKey:", @"startTime"), "doubleValue");
          double v16 = v15;
          objc_msgSend(objc_msgSend(v10, "objectForKey:", @"duration"), "doubleValue");
          double v18 = v16 + v17;
          int v19 = (char *)[v3 count];
          if (!v19) {
            goto LABEL_14;
          }
          double v20 = v19;
          double v21 = 0;
          char v22 = 1;
          while (1)
          {
            objc_msgSend(objc_msgSend(v3, "objectAtIndex:", v21), "doubleValue");
            if (v16 < v23) {
              break;
            }
            ++v21;
            v22 ^= 1u;
            if (v20 == v21) {
              goto LABEL_14;
            }
          }
          if (v20 == v21)
          {
LABEL_14:
            objc_msgSend(v3, "addObject:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v16));
            objc_msgSend(v3, "addObject:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v18));
LABEL_15:
            CFStringRef v7 = v14;
            a1 = v13;
            CFStringRef v6 = v12;
            goto LABEL_16;
          }
          if (v22)
          {
            objc_msgSend(objc_msgSend(v3, "objectAtIndex:", v21), "doubleValue");
            double v25 = v24;
            double v26 = +[NSNumber numberWithDouble:v16];
            if (v18 < v25)
            {
              [v3 insertObject:v26 atIndex:v21];
              objc_msgSend(v3, "insertObject:atIndex:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v18), v21);
              goto LABEL_15;
            }
            [v3 replaceObjectAtIndex:v21++ withObject:v26];
          }
          if (v21 < v20)
          {
            char v27 = 0;
            BOOL v42 = (((_BYTE)v20 + ~(_BYTE)v21) & 1) == 0;
            while (1)
            {
              objc_msgSend(objc_msgSend(v3, "objectAtIndex:", v21), "doubleValue");
              if (v18 < v28) {
                break;
              }
              [v3 removeObjectAtIndex:v21];
              --v20;
              v27 ^= 1u;
              if (v21 >= v20)
              {
                char v27 = v42;
                break;
              }
            }
            if (v27) {
              objc_msgSend(v3, "insertObject:atIndex:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v18), v21);
            }
          }
          CFStringRef v7 = v14;
          a1 = v13;
          CFStringRef v6 = v12;
          if ([v3 count]) {
            NSLog(@"Odd number of bounds on Origami effect, trouble ahead.\n");
          }
        }
LABEL_16:
        double v9 = (char *)v9 + 1;
      }
      while (v9 != v5);
      id v29 = [a1 countByEnumeratingWithState:&v43 objects:v47 count:16];
      id v5 = v29;
    }
    while (v29);
  }
  id v30 = [v3 count];
  if (v30)
  {
    unint64_t v31 = (unint64_t)v30;
    uint64_t v32 = 0;
    int v33 = 0;
    double v34 = 0.0;
    double v35 = -1.0;
    do
    {
      objc_msgSend(objc_msgSend(v3, "objectAtIndex:", v32), "doubleValue");
      double v37 = v36;
      objc_msgSend(objc_msgSend(v3, "objectAtIndex:", v33 + 1), "doubleValue");
      double v39 = v38;
      if (vabdd_f64(v37, v35) < 0.00001)
      {
        objc_msgSend(v3, "removeObjectsAtIndexes:", +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v33 - 1, 2));
        v33 -= 2;
        v31 -= 2;
      }
      double v34 = v34 + v39 - v37;
      v33 += 2;
      uint64_t v32 = v33;
      double v35 = v39;
    }
    while (v31 > v33);
  }
  else
  {
    double v34 = 0.0;
  }
  if (a2) {
    *a2 = v34;
  }
  return v3;
}

id StretchTime(void *a1, double a2, double a3)
{
  id result = [a1 count];
  double v7 = 0.0;
  if (result)
  {
    double v8 = 0.0;
    if (a2 > 0.0)
    {
      unint64_t v9 = (unint64_t)result;
      uint64_t v10 = 0;
      unsigned int v11 = 2;
      do
      {
        double v12 = v7;
        objc_msgSend(objc_msgSend(a1, "objectAtIndex:", v10), "doubleValue");
        double v14 = v13;
        id result = objc_msgSend(objc_msgSend(a1, "objectAtIndex:", v11 - 1), "doubleValue");
        if (v14 <= a2) {
          double v15 = v14;
        }
        else {
          double v15 = a2;
        }
        double v16 = v8 + (v15 - v12) * a3;
        if (v7 <= a2) {
          double v17 = v7;
        }
        else {
          double v17 = a2;
        }
        double v8 = v16 + v17 - v14;
        if (v9 <= v11) {
          break;
        }
        uint64_t v10 = v11;
        v11 += 2;
      }
      while (v7 < a2);
    }
  }
  return result;
}

id sub_100838(uint64_t a1, uint64_t a2)
{
  id result = [*(id *)(a1 + 32) currentSlideInfoForElement:a2];
  if (result)
  {
    id v5 = result;
    id result = [result scale];
    if (v6 > 0.0)
    {
      id result = [v5 index];
      if ((unint64_t)result < *(void *)(a1 + 48))
      {
        double v7 = *(void **)(a1 + 40);
        return [v7 setObject:v5 forKey:a2];
      }
    }
  }
  return result;
}

void sub_106E50(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_106F10(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_110D3C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMarimbaDocument];
}

id sub_110EB4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMarimbaDocument];
}

id sub_110FE0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMarimbaDocument];
}

id sub_111370(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMarimbaDocument];
}

id sub_111460(uint64_t a1)
{
  return [*(id *)(a1 + 32) becomeReady];
}

void sub_111944(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_111964(uint64_t a1)
{
  return [*(id *)(a1 + 32) warmup:1];
}

void sub_111ADC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_111AF8(uint64_t a1)
{
  return [*(id *)(a1 + 32) warmup:0];
}

void sub_111BE4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1120C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_112174(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  double v2 = (char *)[*(id *)(*(void *)(a1 + 32) + 176) numberOfMediaItems];
  uint64_t v3 = *(void *)(a1 + 32);
  if ((unint64_t)&v2[-*(void *)(v3 + 184)] > 0x63)
  {
    uint64_t v5 = 100;
  }
  else
  {
    id v4 = [*(id *)(v3 + 176) numberOfMediaItems];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v5 = (uint64_t)v4 - *(void *)(v3 + 184);
  }
  id v6 = objc_msgSend(*(id *)(v3 + 176), "mediaURLsAtIndexes:", +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:"));
  objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "mediaURLs"), "addObjectsFromArray:", v6);
  id v7 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v5];
  uint64_t v24 = v5;
  id v8 = objc_msgSend(objc_msgSend(*(id *)(*(void *)(a1 + 32) + 104), "mediaProperties"), "mutableCopy");
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v9 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v6);
        }
        double v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v13 = [*(id *)(a1 + 32) _mediaPropertiesForMediaURL:v12];
        if (v13)
        {
          id v14 = [v12 absoluteString];
          [v8 setObject:v13 forKey:v14];
          [v7 addObject:v14];
        }
      }
      id v9 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v9);
  }
  [*(id *)(*(void *)(a1 + 32) + 104) setMediaProperties:v8];
  [*(id *)(*(void *)(a1 + 32) + 112) setMediaProperties:v8];

  uint64_t v15 = *(void *)(a1 + 32);
  if (*(void *)(v15 + 184))
  {
    objc_msgSend(+[MPAuthoringController sharedController](MPAuthoringController, "sharedController"), "cleanup");
    id v16 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:*(void *)(*(void *)(a1 + 32) + 120)];
    double v17 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(objc_msgSend(*(id *)(*(void *)(a1 + 32) + 104), "videoPaths"), "count"));
    [v16 setObject:v17 forKey:kMPAuthoringLiveSlideIndex];
    objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "contentView"), "bounds");
    if (v18 >= v19) {
      double v20 = v18 / v19;
    }
    else {
      double v20 = v19 / v18;
    }
    objc_msgSend(+[MPCropController sharedController](MPCropController, "sharedController"), "setDelegate:", *(void *)(a1 + 32));
    double v21 = +[NSNumber numberWithDouble:v20];
    [v16 setObject:v21 forKey:kMPAuthoringAspectRatio];
    [*(id *)(*(void *)(a1 + 32) + 104) addVideoPaths:v7];
    [*(id *)(*(void *)(a1 + 32) + 104) setDocumentAttribute:v16 forKey:kMPDocumentAuthoringOptions];
    char v22 = +[NSNumber numberWithDouble:1.0 / v20];
    [v16 setObject:v22 forKey:kMPAuthoringAspectRatio];
    [*(id *)(*(void *)(a1 + 32) + 112) addVideoPaths:v7];
    [*(id *)(*(void *)(a1 + 32) + 112) setDocumentAttribute:v16 forKey:kMPDocumentAuthoringOptions];

    objc_msgSend(+[MPCropController sharedController](MPCropController, "sharedController"), "setDelegate:", 0);
    objc_msgSend(+[MPAuthoringController sharedController](MPAuthoringController, "sharedController"), "cleanup");
  }
  else
  {
    [*(id *)(v15 + 104) setVideoPaths:v7];
    [*(id *)(*(void *)(a1 + 32) + 112) setVideoPaths:v7];
    [*(id *)(a1 + 32) _updateMarimbaDocument];
  }

  *(void *)(*(void *)(a1 + 32) + 184) += v24;
  return objc_sync_exit(obj);
}

void sub_11254C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
}

void sub_112694(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_1126A8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 96);
  if (*(unsigned char *)(v2 + 168)) {
    BOOL v4 = *(unsigned __int8 *)(a1 + 40) != 0;
  }
  else {
    BOOL v4 = 0;
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_11274C;
  v6[3] = &unk_1AA6F8;
  v6[4] = v2;
  return [v3 warmupAndPlay:v4 completionBlock:v6];
}

id sub_11274C(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 216) setHidden:*(unsigned __int8 *)(*(void *)(a1 + 32) + 168)];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 becomeReady];
}

void sub_11286C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_112880(uint64_t a1)
{
  [*(id *)(a1 + 32) becomeReady];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 216);
  return [v2 setHidden:1];
}

void sub_112924(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_112B98(uint64_t a1, int a2)
{
  if (a2)
  {
    if ((objc_msgSend(objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "marimbaLayer"), "isPlaying") & 1) == 0)
    {
      uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 96);
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_112C8C;
      v6[3] = &unk_1AB6C8;
      v6[4] = *(void *)(a1 + 40);
      return [v5 warmupAndPlay:1 completionBlock:v6];
    }
    id result = *(id *)(a1 + 40);
    if (!result) {
      return result;
    }
    BOOL v4 = (uint64_t (*)(void))*((void *)result + 2);
  }
  else
  {
    id result = *(id *)(a1 + 40);
    if (!result) {
      return result;
    }
    BOOL v4 = (uint64_t (*)(void))*((void *)result + 2);
  }
  return (id)v4();
}

uint64_t sub_112C8C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

unint64_t ExifOrientationForPlatformImageOrientation(unint64_t a1)
{
  unint64_t v1 = 0x705040206080301uLL >> (8 * a1);
  if (a1 >= 8) {
    LOBYTE(v1) = 0;
  }
  return v1 & 0xF;
}

void sub_1135E0(id a1, NSString *a2, BOOL a3, JSValue *a4)
{
  BOOL v5 = a3;
  id v7 = [(JSValue *)+[JSContext currentThis] toObject];
  if ([(NSString *)a2 isEqualToString:@"title"])
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_113788;
    void v13[3] = &unk_1AB038;
    uint64_t v13[4] = a4;
    id v8 = v13;
    id v9 = v7;
    uint64_t v10 = 0;
  }
  else
  {
    if ([(NSString *)a2 hasPrefix:@"media-"])
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_113810;
      v12[3] = &unk_1AB038;
      v12[4] = a4;
      objc_msgSend(v7, "navigateToMediaWithIndex:animated:completion:", -[NSString intValue](-[NSString substringFromIndex:](a2, "substringFromIndex:", 6), "intValue"), v5, v12);
      return;
    }
    uint64_t v10 = [[(NSString *)a2 substringFromIndex:5] intValue];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_113898;
    v11[3] = &unk_1AB038;
    v11[4] = a4;
    id v8 = v11;
    id v9 = v7;
  }
  [v9 navigateToTextWithIndex:v10 animated:v5 completion:v8];
}

id sub_113788(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  BOOL v4 = +[NSNumber numberWithBool:a2];
  return objc_msgSend(v2, "callWithArguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v4, 1));
}

id sub_113810(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  BOOL v4 = +[NSNumber numberWithBool:a2];
  return objc_msgSend(v2, "callWithArguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v4, 1));
}

id sub_113898(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  BOOL v4 = +[NSNumber numberWithBool:a2];
  return objc_msgSend(v2, "callWithArguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v4, 1));
}

void sub_113920(id a1, JSValue *a2)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1139A8;
  v2[3] = &unk_1AB038;
  void v2[4] = a2;
  objc_msgSend(-[JSValue toObject](+[JSContext currentThis](JSContext, "currentThis"), "toObject"), "_restartSlideshowWithCompletion:", v2);
}

id sub_1139A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  BOOL v4 = +[NSNumber numberWithBool:a2];
  return objc_msgSend(v2, "callWithArguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v4, 1));
}

void sub_113A30(id a1, BOOL a2, JSValue *a3)
{
  BOOL v3 = a2;
  id v4 = objc_msgSend(-[JSValue toObject](+[JSContext currentThis](JSContext, "currentThis", a3), "toObject"), "marimbaLayer");
  [v4 gotoNextSlide:v3];
}

void sub_113A78(id a1, BOOL a2, JSValue *a3)
{
  BOOL v3 = a2;
  id v4 = objc_msgSend(-[JSValue toObject](+[JSContext currentThis](JSContext, "currentThis", a3), "toObject"), "marimbaLayer");
  [v4 gotoPreviousSlide:v3];
}

void sub_1180E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_11816C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1181EC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_118270(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

double RectToFitInRect(double a1, double a2, double a3, double a4, double a5)
{
  if (a3 / a5 >= a4) {
    double v5 = a4;
  }
  else {
    double v5 = a3 / a5;
  }
  return (a3 - v5 * a5) * 0.5;
}

void sub_11D2EC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_11D3E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_121220(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1212D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_121A48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(v10);
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_121C0C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_121CAC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_121EB0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_122048(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_122278(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_122498(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
}

void sub_122740(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_12291C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1229BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_122A70(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_122B38(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_122BEC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_122C8C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_1243D8(id *a1)
{
  [a1[4] startTime];
  double v3 = v2;
  [a1[4] duration];
  double v5 = v3 + v4;
  [a1[4] outroTransitionDuration];
  double v7 = v5 - v6;
  unsigned int v8 = [a1[5] isPlaying];
  if (v8) {
    [a1[5] pause];
  }
  [a1[5] time];
  double v10 = v9;
  id v11 = objc_msgSend(objc_msgSend(a1[5], "document"), "montage");
  id v12 = objc_msgSend(objc_alloc((Class)NSIndexSet), "initWithIndexesInRange:", 0, (char *)objc_msgSend(a1[4], "index") + 1);
  [v11 lock];
  [a1[6] removeEffectContainersAtIndices:v12];
  [v11 unlock];

  id result = [a1[5] setTime:v10 - v7];
  if (v8)
  {
    id v14 = a1[5];
    return [v14 play];
  }
  return result;
}

void sub_125C44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_125C5C(uint64_t a1, uint64_t a2)
{
}

void sub_125C6C(uint64_t a1)
{
}

uint64_t sub_125C78(uint64_t a1, void *a2)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v4 = [a2 sublayers];
    uint64_t result = (uint64_t)[v4 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (result)
    {
      uint64_t v6 = result;
      uint64_t v7 = *(void *)v18;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v4);
          }
          (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 16))();
          ++v8;
        }
        while (v6 != v8);
        uint64_t result = (uint64_t)[v4 countByEnumeratingWithState:&v17 objects:v22 count:16];
        uint64_t v6 = result;
      }
      while (result);
    }
  }
  else
  {
    objc_opt_class();
    uint64_t result = objc_opt_isKindOfClass();
    if (result)
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v9 = objc_msgSend(objc_msgSend(a2, "slideProvidersForElementIDs", 0), "objectEnumerator");
      uint64_t result = (uint64_t)[v9 countByEnumeratingWithState:&v13 objects:v21 count:16];
      if (result)
      {
        uint64_t v10 = result;
        uint64_t v11 = *(void *)v14;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v14 != v11) {
              objc_enumerationMutation(v9);
            }
            [*(id *)(*((void *)&v13 + 1) + 8 * v12++) beginLiveUpdate];
          }
          while (v10 != v12);
          uint64_t result = (uint64_t)[v9 countByEnumeratingWithState:&v13 objects:v21 count:16];
          uint64_t v10 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

void sub_125FF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_126008(uint64_t a1, void *a2)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v4 = [a2 sublayers];
    uint64_t result = (uint64_t)[v4 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (result)
    {
      uint64_t v6 = result;
      uint64_t v7 = *(void *)v18;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v4);
          }
          (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 16))();
          ++v8;
        }
        while (v6 != v8);
        uint64_t result = (uint64_t)[v4 countByEnumeratingWithState:&v17 objects:v22 count:16];
        uint64_t v6 = result;
      }
      while (result);
    }
  }
  else
  {
    objc_opt_class();
    uint64_t result = objc_opt_isKindOfClass();
    if (result)
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v9 = objc_msgSend(objc_msgSend(a2, "slideProvidersForElementIDs", 0), "objectEnumerator");
      uint64_t result = (uint64_t)[v9 countByEnumeratingWithState:&v13 objects:v21 count:16];
      if (result)
      {
        uint64_t v10 = result;
        uint64_t v11 = *(void *)v14;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v14 != v11) {
              objc_enumerationMutation(v9);
            }
            [*(id *)(*((void *)&v13 + 1) + 8 * v12++) endLiveUpdate];
          }
          while (v10 != v12);
          uint64_t result = (uint64_t)[v9 countByEnumeratingWithState:&v13 objects:v21 count:16];
          uint64_t v10 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

void sub_12696C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_126BC4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_126CAC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_126E18(uint64_t a1)
{
  [*(id *)(a1 + 32) updateFramebuffer];
  double v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[2];
  return [v2 updateSizeOfRenderer:v3];
}

id sub_127028(uint64_t a1)
{
  [*(id *)(a1 + 32) updateFramebuffer];
  double v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[2];
  return [v2 updateSizeOfRenderer:v3];
}

id sub_127144(uint64_t a1)
{
  [*(id *)(a1 + 32) updateFramebuffer];
  double v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[2];
  return [v2 updateSizeOfRenderer:v3];
}

void sub_127CEC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_127FD0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v2 == *(void *)(v3 + 24))
    {
      int v5 = 0;
      id v4 = 0;
    }
    else
    {
      id v4 = [*(id *)(v3 + 16) currentStateForMontageSwap];
      int v5 = 1;
    }
  }
  else
  {
    int v5 = 0;
    id v4 = 0;
  }
  [*(id *)(*(void *)(a1 + 40) + 16) beginMorphingToAspectRatio:0 andOrientation:*(double *)(a1 + 48) withDuration:*(double *)(a1 + 56)];
  id result = [*(id *)(a1 + 40) updateSizeOfRenderer:*(void *)(*(void *)(a1 + 40) + 16)];
  if (v5)
  {
    [+[NSNotificationCenter defaultCenter] removeObserver:*(void *)(a1 + 40)];

    *(void *)(*(void *)(a1 + 40) + 24) = *(id *)(a1 + 32);
    [*(id *)(*(void *)(a1 + 40) + 16) setAssetManagementDelegate:*(void *)(*(void *)(a1 + 40) + 24)];
    [*(id *)(*(void *)(a1 + 40) + 16) setFeatureDelegate:*(void *)(*(void *)(a1 + 40) + 24)];
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 16), "swapMontage:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 24), "montage"));
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 16), "setTransitionLayerPlugObjectID:", objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(*(void *)(a1 + 40) + 24), "mainLayers"), "lastObject"), "plug"), "objectID"));
    [+[NSNotificationCenter defaultCenter] addObserver:*(void *)(a1 + 40) selector:"didLiveChanged:" name:@"kMPAuthoringLiveDidChangeNotification" object:*(void *)(*(void *)(a1 + 40) + 24)];
    [+[NSNotificationCenter defaultCenter] addObserver:*(void *)(a1 + 40) selector:"didAddEffects:" name:@"kMPAuthoringLiveDidAddEffectsNotification" object:*(void *)(*(void *)(a1 + 40) + 24)];
    [+[NSNotificationCenter defaultCenter] addObserver:*(void *)(a1 + 40) selector:"didApplyStyle:" name:@"kMPAuthoringDidFinishApplyingStyleNotification" object:*(void *)(*(void *)(a1 + 40) + 24)];
    uint64_t v7 = *(void *)(a1 + 40);
    if (*(unsigned char *)(v7 + 96))
    {
      uint64_t v8 = +[NSNotificationCenter defaultCenter];
      [(NSNotificationCenter *)v8 addObserver:*(void *)(a1 + 40) selector:"_slideDidAppear:" name:kMRNotificationSlideIsOn object:0];
      uint64_t v7 = *(void *)(a1 + 40);
    }
    [*(id *)(v7 + 16) applyStateForMontageSwap:v4];
    id result = [*(id *)(*(void *)(a1 + 40) + 24) detectFacesInBackground];
    if (result)
    {
      id v9 = *(void **)(a1 + 40);
      return [v9 setupFaceDetection];
    }
  }
  return result;
}

id sub_128390(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) isPlaying];
  if (v2) {
    [*(id *)(a1 + 32) pause];
  }
  id v3 = objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "document"), "montage");
  [v3 lock];
  [*(id *)(a1 + 32) relativeTime];
  double v5 = v4;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 24);
  [*(id *)(v6 + 16) size];
  double v9 = v8;
  [*(id *)(*(void *)(a1 + 32) + 16) size];
  [v7 aspectRatioDidChange:v9 / v10 atTime:v5];
  double v12 = v11;
  [v3 unlock];
  id result = [*(id *)(a1 + 32) setTime:v12];
  if (v2)
  {
    long long v14 = *(void **)(a1 + 32);
    return [v14 play];
  }
  return result;
}

id sub_129C24(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = (void *)v6[3];
  unint64_t v8 = v6[8];
  unint64_t v9 = v8 >> 28;
  if (v7)
  {
    unint64_t v10 = (v8 >> 24) & 0xF;
    if (v9 <= v10) {
      goto LABEL_13;
    }
    unint64_t v11 = v10 + 1;
  }
  else
  {
    unint64_t v11 = 0;
  }
  *(void *)(*(void *)(a1 + 32) + 24) = malloc_type_calloc(v9 + 1, 8uLL, 0x80040B8603338uLL);
  *(void *)(*(void *)(a1 + 32) + 64) = *(void *)(*(void *)(a1 + 32) + 64) & 0xFFFFFFFFF0FFFFFFLL | ((unint64_t)(*(void *)(*(void *)(a1 + 32) + 64) >> 28) << 24);
  uint64_t v12 = 8 * v11;
  if (v7)
  {
    memcpy(*(void **)(*(void *)(a1 + 32) + 24), v7, 8 * v11);
    free(v7);
  }
  if (v11)
  {
    long long v13 = *(double **)(*(void *)(*(void *)(a1 + 32) + 24) + 8 * (v11 - 1));
    double v14 = v13[3];
    double v15 = v13[4];
    double v17 = v13[5];
    uint64_t v16 = *((void *)v13 + 6);
    id v18 = [v13 asset];
    id v19 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 24) + 8 * (v11 - 1)) kenBurnsType];
  }
  else
  {
    id v18 = 0;
    id v19 = 0;
    uint64_t v16 = 0;
    double v14 = 0.5;
    double v17 = 1.0;
    double v15 = 0.5;
  }
  uint64_t v6 = *(void **)(a1 + 32);
  if (((v6[8] >> 24) & 0xFuLL) >= v11)
  {
    do
    {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 24) + v12) = objc_alloc_init(MCSlideAsset);
      uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 32) + 24) + v12);
      *(double *)(v20 + 24) = v14;
      *(double *)(v20 + 32) = v15;
      *(double *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 24) + v12) + 40) = v17;
      *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 24) + v12) + 48) = v16;
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 24) + v12) setAsset:v18];
      [v18 addSlide:*(void *)(a1 + 32)];
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 24) + v12) setKenBurnsType:v19];
      LODWORD(v11) = v11 + 1;
      uint64_t v6 = *(void **)(a1 + 32);
      v12 += 8;
    }
    while (((v6[8] >> 24) & 0xFuLL) >= v11);
  }
  uint64_t v7 = (void *)v6[3];
LABEL_13:
  double v21 = (double *)*((void *)v7 + a3);
  if ([v6 isSnapshot]) {
    char v22 = +[MCObject objectWithImprint:andMontage:](MCObject, "objectWithImprint:andMontage:", [a2 objectForKey:@"asset"], *(void *)(a1 + 40));
  }
  else {
    char v22 = (MCObject *)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "videoAssetForObjectID:", objc_msgSend(a2, "objectForKey:", @"assetID"));
  }
  double v23 = v22;
  if (v22) {
    [(MCObject *)v22 addSlide:*(void *)(a1 + 32)];
  }
  [v21 setAsset:v23];
  objc_msgSend(v21, "setKenBurnsType:", objc_msgSend(a2, "objectForKey:", @"kenBurnsType"));
  id v24 = [a2 objectForKey:@"centerX"];
  double v25 = 0.5;
  double v26 = 0.5;
  if (v24)
  {
    [v24 floatValue];
    double v26 = v27;
  }
  id v28 = [a2 objectForKey:@"centerY"];
  if (v28)
  {
    [v28 floatValue];
    double v25 = v29;
  }
  v21[3] = v26;
  void v21[4] = v25;
  id v30 = [a2 objectForKey:@"scale"];
  if (v30)
  {
    [v30 floatValue];
    double v32 = v31;
  }
  else
  {
    double v32 = 1.0;
  }
  id result = [a2 objectForKey:@"rotation"];
  if (result)
  {
    id result = [result floatValue];
    double v35 = v34;
  }
  else
  {
    double v35 = 0.0;
  }
  v21[5] = v32;
  v21[6] = v35;
  return result;
}

void sub_12A100(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_12A7E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_12AA6C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_12AB70(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_12ADE4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_12B4E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_12B644(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_12B6C0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_12B760(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_12B8A0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_12B974(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_12B9F0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_12BA94(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_12BFB4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_12C4A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(v10);
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_12C66C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_12C70C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_12C910(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_12CAA8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_12CCD8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_12CEF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
}

void sub_12D1D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_12D45C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_12D500(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_12D5A0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_12D820(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_12DAAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(v10);
  _Unwind_Resume(a1);
}

void sub_12DCC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_12DF14(_Unwind_Exception *exception_object)
{
}

id sub_12E7D8(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id result = [*(id *)(*(void *)(a1 + 40) + 24) currentItem];
  if (v2 != result)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    double v5 = *(void **)(*(void *)(a1 + 40) + 24);
    return [v5 replaceCurrentItemWithPlayerItem:v4];
  }
  return result;
}

id sub_12E9EC(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id result = [*(id *)(*(void *)(a1 + 40) + 24) currentItem];
  if (v2 != result)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    double v5 = *(void **)(*(void *)(a1 + 40) + 24);
    return [v5 replaceCurrentItemWithPlayerItem:v4];
  }
  return result;
}

uint64_t sortSlidesByCaptureDate1(void *a1, void *a2, unsigned char *a3)
{
  if (a3) {
    BOOL v4 = *a3 != 0;
  }
  else {
    BOOL v4 = 1;
  }
  objc_msgSend(objc_msgSend(a1, "captureDate"), "timeIntervalSinceReferenceDate");
  double v6 = v5;
  objc_msgSend(objc_msgSend(a2, "captureDate"), "timeIntervalSinceReferenceDate");
  uint64_t v8 = 1;
  if (!v4) {
    uint64_t v8 = -1;
  }
  if (v7 >= v6) {
    uint64_t v8 = 0;
  }
  uint64_t v9 = -1;
  if (!v4) {
    uint64_t v9 = 1;
  }
  if (v6 < v7) {
    return v9;
  }
  else {
    return v8;
  }
}

uint64_t sortSlidesByUserDefinedOrder1(void *a1, void *a2)
{
  id v3 = [a1 index];
  id v4 = [a2 index];
  if ((uint64_t)v3 < (uint64_t)v4) {
    return -1;
  }
  else {
    return (uint64_t)v4 < (uint64_t)v3;
  }
}

void sub_130434(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_130508(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_130584(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_13060C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1307C0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_130B9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(v10);
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_130D60(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_130E00(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_131004(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_13119C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1313CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1315EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
}

id sub_131AB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [*(id *)(a1 + 32) objectForKey:@"positionX"];
  double v6 = 0.0;
  double v7 = 0.0;
  if (v5)
  {
    [v5 floatValue];
    double v7 = v8;
  }
  id v9 = [*(id *)(a1 + 32) objectForKey:@"positionY"];
  if (v9)
  {
    [v9 floatValue];
    double v6 = v10;
  }
  uint64_t v11 = *(void *)(a1 + 40);
  int v12 = *(_DWORD *)(v11 + 24);
  uint64_t v13 = *(void *)(v11 + 88);
  double v14 = (double *)(v13 + 48 * a3);
  double v15 = (double *)(v13 + 72 * a3);
  if ((v12 & 0x40) == 0) {
    double v15 = v14;
  }
  *double v15 = v7;
  v15[1] = v6;
  id v16 = [*(id *)(a1 + 32) objectForKey:@"width"];
  double v17 = 2.0;
  double v18 = 2.0;
  if (v16)
  {
    [v16 floatValue];
    double v18 = v19;
  }
  id v20 = [*(id *)(a1 + 32) objectForKey:@"height"];
  if (v20)
  {
    [v20 floatValue];
    double v17 = v21;
  }
  uint64_t v22 = *(void *)(a1 + 40);
  int v23 = *(_DWORD *)(v22 + 24);
  uint64_t v24 = *(void *)(v22 + 88);
  uint64_t v25 = v24 + 48 * a3 + 16;
  double v26 = (double *)(v24 + 72 * a3 + 16);
  if ((v23 & 0x40) == 0) {
    double v26 = (double *)v25;
  }
  *double v26 = v18;
  v26[1] = v17;
  id v27 = [*(id *)(a1 + 32) objectForKey:@"scale"];
  if (v27)
  {
    [v27 floatValue];
    double v29 = v28;
  }
  else
  {
    double v29 = 1.0;
  }
  uint64_t v30 = *(void *)(a1 + 40);
  int v31 = *(_DWORD *)(v30 + 24);
  uint64_t v32 = *(void *)(v30 + 88);
  uint64_t v33 = v32 + 48 * a3 + 40;
  float v34 = (double *)(v32 + 72 * a3 + 40);
  if ((v31 & 0x40) == 0) {
    float v34 = (double *)v33;
  }
  *float v34 = v29;
  id result = [*(id *)(a1 + 32) objectForKey:@"rotationZ"];
  if (result)
  {
    id result = [result floatValue];
    double v37 = v36;
  }
  else
  {
    double v37 = 0.0;
  }
  uint64_t v38 = *(void *)(a1 + 40);
  int v39 = *(_DWORD *)(v38 + 24);
  uint64_t v40 = *(void *)(v38 + 88);
  uint64_t v41 = v40 + 48 * a3 + 32;
  BOOL v42 = (double *)(v40 + 72 * a3 + 32);
  if ((v39 & 0x40) == 0) {
    BOOL v42 = (double *)v41;
  }
  double *v42 = v37;
  if ((*(unsigned char *)(*(void *)(a1 + 40) + 24) & 0x40) != 0)
  {
    id v43 = [*(id *)(a1 + 32) objectForKey:@"positionZ"];
    double v44 = 0.0;
    double v45 = 0.0;
    if (v43)
    {
      objc_msgSend(v43, "floatValue", 0.0);
      double v45 = v46;
    }
    *(double *)(*(void *)(*(void *)(a1 + 40) + 88) + 72 * a3 + 48) = v45;
    id v47 = [*(id *)(a1 + 32) objectForKey:@"rotationX"];
    if (v47)
    {
      [v47 floatValue];
      double v44 = v48;
    }
    *(double *)(*(void *)(*(void *)(a1 + 40) + 88) + 72 * a3 + 56) = v44;
    id result = [*(id *)(a1 + 32) objectForKey:@"rotationY"];
    if (result)
    {
      id result = [result floatValue];
      double v50 = v49;
    }
    else
    {
      double v50 = 0.0;
    }
    *(double *)(*(void *)(*(void *)(a1 + 40) + 88) + 72 * a3 + 64) = v50;
  }
  return result;
}

uint64_t sub_1396B4(void *a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  double v6 = __cxa_begin_catch(a1);
  long long v7 = *(_OWORD *)v6;
  *(void *)(a3 + 16) = v6[2];
  *(_OWORD *)a3 = v7;
  uint64_t result = *a4;
  if (*a4)
  {
    operator delete();
  }
  return result;
}

CGAffineTransform *__cdecl CATransform3DGetAffineTransform(CGAffineTransform *__return_ptr retstr, CATransform3D *t)
{
  return _CATransform3DGetAffineTransform(retstr, t);
}

CATransform3D *__cdecl CATransform3DMakeAffineTransform(CATransform3D *__return_ptr retstr, CGAffineTransform *m)
{
  return _CATransform3DMakeAffineTransform(retstr, m);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

CFAttributedStringRef CFAttributedStringCreateWithSubstring(CFAllocatorRef alloc, CFAttributedStringRef aStr, CFRange range)
{
  return _CFAttributedStringCreateWithSubstring(alloc, aStr, range);
}

CFTypeRef CFAttributedStringGetAttribute(CFAttributedStringRef aStr, CFIndex loc, CFStringRef attrName, CFRange *effectiveRange)
{
  return _CFAttributedStringGetAttribute(aStr, loc, attrName, effectiveRange);
}

void CFAttributedStringSetAttribute(CFMutableAttributedStringRef aStr, CFRange range, CFStringRef attrName, CFTypeRef value)
{
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return _CFErrorCopyDescription(err);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return _CFRunLoopRunInMode(mode, seconds, returnAfterSourceHandled);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return _CFUUIDCreate(alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return _CFUUIDCreateString(alloc, uuid);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return _CGAffineTransformMakeRotation(retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformScale(retstr, t, sx, sy);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return _CGBitmapContextCreate(data, width, height, bitsPerComponent, bytesPerRow, space, bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return _CGBitmapContextCreateImage(context);
}

CGImageAlphaInfo CGBitmapContextGetAlphaInfo(CGContextRef context)
{
  return _CGBitmapContextGetAlphaInfo(context);
}

size_t CGBitmapContextGetBitsPerPixel(CGContextRef context)
{
  return _CGBitmapContextGetBitsPerPixel(context);
}

size_t CGBitmapContextGetBytesPerRow(CGContextRef context)
{
  return _CGBitmapContextGetBytesPerRow(context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return _CGBitmapContextGetData(context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return _CGBitmapContextGetHeight(context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return _CGBitmapContextGetWidth(context);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return _CGColorCreate(space, components);
}

CGColorRef CGColorCreateCopy(CGColorRef color)
{
  return _CGColorCreateCopy(color);
}

BOOL CGColorEqualToColor(CGColorRef color1, CGColorRef color2)
{
  return _CGColorEqualToColor(color1, color2);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return _CGColorGetComponents(color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return _CGColorGetNumberOfComponents(color);
}

void CGColorRelease(CGColorRef color)
{
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return _CGColorRetain(color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return _CGColorSpaceCreateDeviceGray();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return _CGColorSpaceCreateDeviceRGB();
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return _CGColorSpaceGetModel(space);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return _CGColorSpaceGetNumberOfComponents(space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

CGColorSpaceRef CGColorSpaceRetain(CGColorSpaceRef space)
{
  return _CGColorSpaceRetain(space);
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextRelease(CGContextRef c)
{
}

CGContextRef CGContextRetain(CGContextRef c)
{
  return _CGContextRetain(c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetAllowsAntialiasing(CGContextRef c, BOOL allowsAntialiasing)
{
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetShadowWithColor(CGContextRef c, CGSize offset, CGFloat blur, CGColorRef color)
{
}

void CGContextSetShouldSmoothFonts(CGContextRef c, BOOL shouldSmoothFonts)
{
}

void CGContextSetStrokeColor(CGContextRef c, const CGFloat *components)
{
}

void CGContextSetStrokeColorSpace(CGContextRef c, CGColorSpaceRef space)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetTextPosition(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

void CGContextStrokeRect(CGContextRef c, CGRect rect)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return _CGDataProviderCreateWithData(info, data, size, releaseData);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return _CGImageCreate(width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, bitmapInfo, provider, decode, shouldInterpolate, intent);
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return _CGImageGetAlphaInfo(image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return _CGImageGetBitsPerComponent(image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return _CGImageGetBitsPerPixel(image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return _CGImageGetColorSpace(image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return _CGImageGetHeight(image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return _CGImageGetWidth(image);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return _CGImageRetain(image);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return _CGImageSourceCopyPropertiesAtIndex(isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return _CGImageSourceCreateImageAtIndex(isrc, index, options);
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return _CGImageSourceCreateThumbnailAtIndex(isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return _CGImageSourceCreateWithData(data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return _CGImageSourceCreateWithURL(url, options);
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return _CGPathCreateMutable();
}

CGRect CGPathGetBoundingBox(CGPathRef path)
{
  return _CGPathGetBoundingBox(path);
}

void CGPathRelease(CGPathRef path)
{
}

CGPoint CGPointFromString(NSString *string)
{
  CGPoint v3 = _CGPointFromString(string);
  double y = v3.y;
  double x = v3.x;
  result.double y = y;
  result.double x = x;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return _CGRectContainsPoint(rect, point);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return _CGRectContainsRect(rect1, rect2);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return _CGRectEqualToRect(rect1, rect2);
}

CGRect CGRectFromString(NSString *string)
{
  return _CGRectFromString(string);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  return _CGRectIntersection(r1, r2);
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return _CGRectIntersectsRect(rect1, rect2);
}

BOOL CGRectIsNull(CGRect rect)
{
  return _CGRectIsNull(rect);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  return _CGRectUnion(r1, r2);
}

CGSize CGSizeFromString(NSString *string)
{
  CGSize v3 = _CGSizeFromString(string);
  double height = v3.height;
  double width = v3.width;
  result.double height = height;
  result.double width = width;
  return result;
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return _CMSampleBufferGetImageBuffer(sbuf);
}

OSStatus CMSampleBufferGetSampleTimingInfo(CMSampleBufferRef sbuf, CMItemIndex sampleIndex, CMSampleTimingInfo *timingInfoOut)
{
  return _CMSampleBufferGetSampleTimingInfo(sbuf, sampleIndex, timingInfoOut);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  return _CMTimeGetSeconds(time);
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return _CMTimeMake(retstr, value, timescale);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return _CMTimeRangeMake(retstr, start, duration);
}

CFStringRef CTFontCopyDisplayName(CTFontRef font)
{
  return _CTFontCopyDisplayName(font);
}

CFStringRef CTFontCopyFamilyName(CTFontRef font)
{
  return _CTFontCopyFamilyName(font);
}

CFStringRef CTFontCopyPostScriptName(CTFontRef font)
{
  return _CTFontCopyPostScriptName(font);
}

CTFontRef CTFontCreateWithName(CFStringRef name, CGFloat size, const CGAffineTransform *matrix)
{
  return _CTFontCreateWithName(name, size, matrix);
}

CGFloat CTFontGetSize(CTFontRef font)
{
  return _CTFontGetSize(font);
}

CGFloat CTFontGetXHeight(CTFontRef font)
{
  return _CTFontGetXHeight(font);
}

BOOL CTFontManagerRegisterFontsForURL(CFURLRef fontURL, CTFontManagerScope scope, CFErrorRef *error)
{
  return _CTFontManagerRegisterFontsForURL(fontURL, scope, error);
}

BOOL CTFontManagerUnregisterFontsForURL(CFURLRef fontURL, CTFontManagerScope scope, CFErrorRef *error)
{
  return _CTFontManagerUnregisterFontsForURL(fontURL, scope, error);
}

void CTFrameDraw(CTFrameRef frame, CGContextRef context)
{
}

void CTFrameGetLineOrigins(CTFrameRef frame, CFRange range, CGPoint *origins)
{
}

CFArrayRef CTFrameGetLines(CTFrameRef frame)
{
  return _CTFrameGetLines(frame);
}

CGPathRef CTFrameGetPath(CTFrameRef frame)
{
  return _CTFrameGetPath(frame);
}

CFRange CTFrameGetVisibleStringRange(CTFrameRef frame)
{
  CFRange VisibleStringRange = _CTFrameGetVisibleStringRange(frame);
  CFIndex length = VisibleStringRange.length;
  CFIndex location = VisibleStringRange.location;
  result.CFIndex length = length;
  result.CFIndex location = location;
  return result;
}

CTFrameRef CTFramesetterCreateFrame(CTFramesetterRef framesetter, CFRange stringRange, CGPathRef path, CFDictionaryRef frameAttributes)
{
  return _CTFramesetterCreateFrame(framesetter, stringRange, path, frameAttributes);
}

CTFramesetterRef CTFramesetterCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return _CTFramesetterCreateWithAttributedString(attrString);
}

CFIndex CTLineGetGlyphCount(CTLineRef line)
{
  return _CTLineGetGlyphCount(line);
}

CFArrayRef CTLineGetGlyphRuns(CTLineRef line)
{
  return _CTLineGetGlyphRuns(line);
}

CGRect CTLineGetImageBounds(CTLineRef line, CGContextRef context)
{
  return _CTLineGetImageBounds(line, context);
}

CGFloat CTLineGetOffsetForStringIndex(CTLineRef line, CFIndex charIndex, CGFloat *secondaryOffset)
{
  return _CTLineGetOffsetForStringIndex(line, charIndex, secondaryOffset);
}

CFRange CTLineGetStringRange(CTLineRef line)
{
  CFRange StringRange = _CTLineGetStringRange(line);
  CFIndex length = StringRange.length;
  CFIndex location = StringRange.location;
  result.CFIndex length = length;
  result.CFIndex location = location;
  return result;
}

double CTLineGetTrailingWhitespaceWidth(CTLineRef line)
{
  return _CTLineGetTrailingWhitespaceWidth(line);
}

double CTLineGetTypographicBounds(CTLineRef line, CGFloat *ascent, CGFloat *descent, CGFloat *leading)
{
  return _CTLineGetTypographicBounds(line, ascent, descent, leading);
}

CTParagraphStyleRef CTParagraphStyleCreate(const CTParagraphStyleSetting *settings, size_t settingCount)
{
  return _CTParagraphStyleCreate(settings, settingCount);
}

BOOL CTParagraphStyleGetValueForSpecifier(CTParagraphStyleRef paragraphStyle, CTParagraphStyleSpecifier spec, size_t valueBufferSize, void *valueBuffer)
{
  return _CTParagraphStyleGetValueForSpecifier(paragraphStyle, spec, valueBufferSize, valueBuffer);
}

CFDictionaryRef CTRunGetAttributes(CTRunRef run)
{
  return _CTRunGetAttributes(run);
}

CFIndex CTRunGetGlyphCount(CTRunRef run)
{
  return _CTRunGetGlyphCount(run);
}

CGRect CTRunGetImageBounds(CTRunRef run, CGContextRef context, CFRange range)
{
  return _CTRunGetImageBounds(run, context, range);
}

CTRunStatus CTRunGetStatus(CTRunRef run)
{
  return _CTRunGetStatus(run);
}

void CTRunGetStringIndices(CTRunRef run, CFRange range, CFIndex *buffer)
{
}

const CFIndex *__cdecl CTRunGetStringIndicesPtr(CTRunRef run)
{
  return _CTRunGetStringIndicesPtr(run);
}

CFRange CTRunGetStringRange(CTRunRef run)
{
  CFRange StringRange = _CTRunGetStringRange(run);
  CFIndex length = StringRange.length;
  CFIndex location = StringRange.location;
  result.CFIndex length = length;
  result.CFIndex location = location;
  return result;
}

double CTRunGetTypographicBounds(CTRunRef run, CFRange range, CGFloat *ascent, CGFloat *descent, CGFloat *leading)
{
  return _CTRunGetTypographicBounds(run, range, ascent, descent, leading);
}

void CVBufferRelease(CVBufferRef buffer)
{
}

CVBufferRef CVBufferRetain(CVBufferRef buffer)
{
  return _CVBufferRetain(buffer);
}

CVReturn CVOpenGLESTextureCacheCreate(CFAllocatorRef allocator, CFDictionaryRef cacheAttributes, CVEAGLContext eaglContext, CFDictionaryRef textureAttributes, CVOpenGLESTextureCacheRef *cacheOut)
{
  return _CVOpenGLESTextureCacheCreate(allocator, cacheAttributes, eaglContext, textureAttributes, cacheOut);
}

CVReturn CVOpenGLESTextureCacheCreateTextureFromImage(CFAllocatorRef allocator, CVOpenGLESTextureCacheRef textureCache, CVImageBufferRef sourceImage, CFDictionaryRef textureAttributes, GLenum target, GLint internalFormat, GLsizei width, GLsizei height, GLenum format, GLenum type, size_t planeIndex, CVOpenGLESTextureRef *textureOut)
{
  return _CVOpenGLESTextureCacheCreateTextureFromImage(allocator, textureCache, sourceImage, textureAttributes, target, internalFormat, width, height, format, type, planeIndex, textureOut);
}

void CVOpenGLESTextureCacheFlush(CVOpenGLESTextureCacheRef textureCache, CVOptionFlags options)
{
}

GLuint CVOpenGLESTextureGetName(CVOpenGLESTextureRef image)
{
  return _CVOpenGLESTextureGetName(image);
}

GLenum CVOpenGLESTextureGetTarget(CVOpenGLESTextureRef image)
{
  return _CVOpenGLESTextureGetTarget(image);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetBaseAddress(pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetBytesPerRow(pixelBuffer);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetHeight(pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetPixelFormatType(pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetWidth(pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return _CVPixelBufferLockBaseAddress(pixelBuffer, lockFlags);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return _CVPixelBufferRetain(texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return _CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags);
}

id NSAllocateObject(Class aClass, NSUInteger extraBytes, NSZone *zone)
{
  return _NSAllocateObject(aClass, extraBytes, zone);
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSRange v4 = _NSIntersectionRange(range1, range2);
  NSUInteger length = v4.length;
  NSUInteger location = v4.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

void NSLog(NSString *format, ...)
{
}

NSRange NSRangeFromString(NSString *aString)
{
  NSRange v3 = _NSRangeFromString(aString);
  NSUInteger length = v3.length;
  NSUInteger location = v3.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return _NSSearchPathForDirectoriesInDomains(directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return _NSStringFromCGPoint(point);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return _NSStringFromCGRect(rect);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return _NSStringFromCGSize(size);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t OFCGImageCreateWithURL()
{
  return _OFCGImageCreateWithURL();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return _UIImageJPEGRepresentation(image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return _UIImagePNGRepresentation(image);
}

Boolean UTTypeConformsTo(CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return _UTTypeConformsTo(inUTI, inConformsToUTI);
}

CFStringRef UTTypeCreatePreferredIdentifierForTag(CFStringRef inTagClass, CFStringRef inTag, CFStringRef inConformingToUTI)
{
  return _UTTypeCreatePreferredIdentifierForTag(inTagClass, inTag, inConformingToUTI);
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

void std::terminate(void)
{
}

void operator delete[]()
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

void operator new()
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

void __cxa_bad_typeid(void)
{
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)___dynamic_cast(lpsrc, lpstype, lpdtype, s2d);
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return ___maskrune(a1, a2);
}

uint64_t __memset_chk()
{
  return ___memset_chk();
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

uint64_t __strncpy_chk()
{
  return ___strncpy_chk();
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return ___toupper(a1);
}

long double acos(long double __x)
{
  return _acos(__x);
}

float acosf(float a1)
{
  return _acosf(a1);
}

uint32_t arc4random(void)
{
  return _arc4random();
}

long double asin(long double __x)
{
  return _asin(__x);
}

float asinf(float a1)
{
  return _asinf(a1);
}

long double atan(long double __x)
{
  return _atan(__x);
}

long double atan2(long double __y, long double __x)
{
  return _atan2(__y, __x);
}

float atan2f(float a1, float a2)
{
  return _atan2f(a1, a2);
}

float atanf(float a1)
{
  return _atanf(a1);
}

int atoi(const char *a1)
{
  return _atoi(a1);
}

void bzero(void *a1, size_t a2)
{
}

long double cos(long double __x)
{
  return _cos(__x);
}

float cosf(float a1)
{
  return _cosf(a1);
}

long double cosh(long double __x)
{
  return _cosh(__x);
}

float coshf(float a1)
{
  return _coshf(a1);
}

char *__cdecl ctime(const time_t *a1)
{
  return _ctime(a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
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

long double exp(long double __x)
{
  return _exp(__x);
}

float exp2f(float a1)
{
  return _exp2f(a1);
}

float expf(float a1)
{
  return _expf(a1);
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

int fflush(FILE *a1)
{
  return _fflush(a1);
}

long double fmod(long double __x, long double __y)
{
  return _fmod(__x, __y);
}

float fmodf(float a1, float a2)
{
  return _fmodf(a1, a2);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

int fputs(const char *a1, FILE *a2)
{
  return _fputs(a1, a2);
}

void free(void *a1)
{
}

void glActiveTexture(GLenum texture)
{
}

void glAttachShader(GLuint program, GLuint shader)
{
}

void glBindAttribLocation(GLuint program, GLuint index, const GLchar *name)
{
}

void glBindBuffer(GLenum target, GLuint buffer)
{
}

void glBindFramebuffer(GLenum target, GLuint framebuffer)
{
}

void glBindRenderbuffer(GLenum target, GLuint renderbuffer)
{
}

void glBindTexture(GLenum target, GLuint texture)
{
}

void glBlendFunc(GLenum sfactor, GLenum dfactor)
{
}

void glBlendFuncSeparate(GLenum srcRGB, GLenum dstRGB, GLenum srcAlpha, GLenum dstAlpha)
{
}

void glBufferData(GLenum target, GLsizeiptr size, const GLvoid *data, GLenum usage)
{
}

GLenum glCheckFramebufferStatus(GLenum target)
{
  return _glCheckFramebufferStatus(target);
}

void glClear(GLbitfield mask)
{
}

void glClearColor(GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha)
{
}

void glCompileShader(GLuint shader)
{
}

void glCopyTexSubImage2D(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint x, GLint y, GLsizei width, GLsizei height)
{
}

GLuint glCreateProgram(void)
{
  return _glCreateProgram();
}

GLuint glCreateShader(GLenum type)
{
  return _glCreateShader(type);
}

void glCullFace(GLenum mode)
{
}

void glDeleteBuffers(GLsizei n, const GLuint *buffers)
{
}

void glDeleteFramebuffers(GLsizei n, const GLuint *framebuffers)
{
}

void glDeleteProgram(GLuint program)
{
}

void glDeleteRenderbuffers(GLsizei n, const GLuint *renderbuffers)
{
}

void glDeleteShader(GLuint shader)
{
}

void glDeleteTextures(GLsizei n, const GLuint *textures)
{
}

void glDepthMask(GLBOOLean flag)
{
}

void glDetachShader(GLuint program, GLuint shader)
{
}

void glDisable(GLenum cap)
{
}

void glDisableVertexAttribArray(GLuint index)
{
}

void glDrawArrays(GLenum mode, GLint first, GLsizei count)
{
}

void glDrawElements(GLenum mode, GLsizei count, GLenum type, const GLvoid *indices)
{
}

void glEnable(GLenum cap)
{
}

void glEnableVertexAttribArray(GLuint index)
{
}

void glFinish(void)
{
}

void glFlush(void)
{
}

void glFramebufferRenderbuffer(GLenum target, GLenum attachment, GLenum renderbuffertarget, GLuint renderbuffer)
{
}

void glFramebufferTexture2D(GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level)
{
}

void glFrontFace(GLenum mode)
{
}

void glGenBuffers(GLsizei n, GLuint *buffers)
{
}

void glGenFramebuffers(GLsizei n, GLuint *framebuffers)
{
}

void glGenRenderbuffers(GLsizei n, GLuint *renderbuffers)
{
}

void glGenTextures(GLsizei n, GLuint *textures)
{
}

void glGenerateMipmap(GLenum target)
{
}

int glGetAttribLocation(GLuint program, const GLchar *name)
{
  return _glGetAttribLocation(program, name);
}

GLenum glGetError(void)
{
  return _glGetError();
}

void glGetFramebufferAttachmentParameteriv(GLenum target, GLenum attachment, GLenum pname, GLint *params)
{
}

void glGetIntegerv(GLenum pname, GLint *params)
{
}

void glGetRenderbufferParameteriv(GLenum target, GLenum pname, GLint *params)
{
}

int glGetUniformLocation(GLuint program, const GLchar *name)
{
  return _glGetUniformLocation(program, name);
}

void glLabelObjectEXT(GLenum type, GLuint object, GLsizei length, const GLchar *label)
{
}

void glLinkProgram(GLuint program)
{
}

void glPixelStorei(GLenum pname, GLint param)
{
}

void glReadPixels(GLint x, GLint y, GLsizei width, GLsizei height, GLenum format, GLenum type, GLvoid *pixels)
{
}

void glRenderbufferStorage(GLenum target, GLenum internalformat, GLsizei width, GLsizei height)
{
}

void glScissor(GLint x, GLint y, GLsizei width, GLsizei height)
{
}

void glShaderSource(GLuint shader, GLsizei count, const GLchar *const *string, const GLint *length)
{
}

void glTexImage2D(GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLint border, GLenum format, GLenum type, const GLvoid *pixels)
{
}

void glTexParameteri(GLenum target, GLenum pname, GLint param)
{
}

void glTexSubImage2D(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLenum type, const GLvoid *pixels)
{
}

void glUniform1f(GLint location, GLfloat x)
{
}

void glUniform1i(GLint location, GLint x)
{
}

void glUniform2f(GLint location, GLfloat x, GLfloat y)
{
}

void glUniform2fv(GLint location, GLsizei count, const GLfloat *v)
{
}

void glUniform3f(GLint location, GLfloat x, GLfloat y, GLfloat z)
{
}

void glUniform3fv(GLint location, GLsizei count, const GLfloat *v)
{
}

void glUniform4f(GLint location, GLfloat x, GLfloat y, GLfloat z, GLfloat w)
{
}

void glUniform4fv(GLint location, GLsizei count, const GLfloat *v)
{
}

void glUniformMatrix3fv(GLint location, GLsizei count, GLBOOLean transpose, const GLfloat *value)
{
}

void glUniformMatrix4fv(GLint location, GLsizei count, GLBOOLean transpose, const GLfloat *value)
{
}

void glUseProgram(GLuint program)
{
}

void glVertexAttribPointer(GLuint indx, GLint size, GLenum type, GLBOOLean normalized, GLsizei stride, const GLvoid *ptr)
{
}

void glViewport(GLint x, GLint y, GLsizei width, GLsizei height)
{
}

kern_return_t host_info(host_t host, host_flavor_t flavor, host_info_t host_info_out, mach_msg_type_number_t *host_info_outCnt)
{
  return _host_info(host, flavor, host_info_out, host_info_outCnt);
}

kern_return_t host_statistics(host_t host_priv, host_flavor_t flavor, host_info_t host_info_out, mach_msg_type_number_t *host_info_outCnt)
{
  return _host_statistics(host_priv, flavor, host_info_out, host_info_outCnt);
}

long double log(long double __x)
{
  return _log(__x);
}

long double log10(long double __x)
{
  return _log10(__x);
}

float log10f(float a1)
{
  return _log10f(a1);
}

long double log2(long double __x)
{
  return _log2(__x);
}

float logf(float a1)
{
  return _logf(a1);
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

void mach_error(const char *str, mach_error_t error_value)
{
}

mach_port_t mach_host_self(void)
{
  return _mach_host_self();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
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

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return _notify_register_check(name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

uint32_t notify_resume(int token)
{
  return _notify_resume(token);
}

uint32_t notify_suspend(int token)
{
  return _notify_suspend(token);
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

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_loadWeak(id *location)
{
  return _objc_loadWeak(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

long double pow(long double __x, long double __y)
{
  return _pow(__x, __y);
}

float powf(float a1, float a2)
{
  return _powf(a1, a2);
}

int pthread_setname_np(const char *a1)
{
  return _pthread_setname_np(a1);
}

void qsort_r(void *__base, size_t __nel, size_t __width, void *a4, int (__cdecl *__compar)(void *, const void *, const void *))
{
}

int rand(void)
{
  return _rand();
}

uint64_t random(void)
{
  return _random();
}

long double sin(long double __x)
{
  return _sin(__x);
}

float sinf(float a1)
{
  return _sinf(a1);
}

long double sinh(long double __x)
{
  return _sinh(__x);
}

float sinhf(float a1)
{
  return _sinhf(a1);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return _sprintf(a1, a2);
}

void srand(unsigned int a1)
{
}

void srandom(unsigned int a1)
{
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
}

char *__cdecl strcat(char *__s1, const char *__s2)
{
  return _strcat(__s1, __s2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return _strcpy(__dst, __src);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return _strncpy(__dst, __src, __n);
}

double strtod_l(const char *a1, char **a2, locale_t a3)
{
  return _strtod_l(a1, a2, a3);
}

float strtof_l(const char *a1, char **a2, locale_t a3)
{
  return _strtof_l(a1, a2, a3);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

long double tan(long double __x)
{
  return _tan(__x);
}

float tanf(float a1)
{
  return _tanf(a1);
}

long double tanh(long double __x)
{
  return _tanh(__x);
}

float tanhf(float a1)
{
  return _tanhf(a1);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return [a1 CGPath];
}

id objc_msgSend_CGPointValue(void *a1, const char *a2, ...)
{
  return [a1 CGPointValue];
}

id objc_msgSend_CGRectValue(void *a1, const char *a2, ...)
{
  return [a1 CGRectValue];
}

id objc_msgSend_CGSizeValue(void *a1, const char *a2, ...)
{
  return [a1 CGSizeValue];
}

id objc_msgSend_CIColorString(void *a1, const char *a2, ...)
{
  return [a1 CIColorString];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_URLByResolvingSymlinksInPath(void *a1, const char *a2, ...)
{
  return [a1 URLByResolvingSymlinksInPath];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__cleanup(void *a1, const char *a2, ...)
{
  return [a1 _cleanup];
}

id objc_msgSend__cleanupGestureRecognizers(void *a1, const char *a2, ...)
{
  return [a1 _cleanupGestureRecognizers];
}

id objc_msgSend__cleanupProviders(void *a1, const char *a2, ...)
{
  return [a1 _cleanupProviders];
}

id objc_msgSend__cleanupSwingTimings(void *a1, const char *a2, ...)
{
  return [a1 _cleanupSwingTimings];
}

id objc_msgSend__commitOuterToInner(void *a1, const char *a2, ...)
{
  return [a1 _commitOuterToInner];
}

id objc_msgSend__computeProjectionMatrixWithOrientationCorrection(void *a1, const char *a2, ...)
{
  return [a1 _computeProjectionMatrixWithOrientationCorrection];
}

id objc_msgSend__createExtraSublayer(void *a1, const char *a2, ...)
{
  return [a1 _createExtraSublayer];
}

id objc_msgSend__createSlideFocusLayer(void *a1, const char *a2, ...)
{
  return [a1 _createSlideFocusLayer];
}

id objc_msgSend__currentEffectContainer(void *a1, const char *a2, ...)
{
  return [a1 _currentEffectContainer];
}

id objc_msgSend__currentEffectLayer(void *a1, const char *a2, ...)
{
  return [a1 _currentEffectLayer];
}

id objc_msgSend__currentState(void *a1, const char *a2, ...)
{
  return [a1 _currentState];
}

id objc_msgSend__displayHitZonesVisualFeedback(void *a1, const char *a2, ...)
{
  return [a1 _displayHitZonesVisualFeedback];
}

id objc_msgSend__displayIsPreloadingImages(void *a1, const char *a2, ...)
{
  return [a1 _displayIsPreloadingImages];
}

id objc_msgSend__displayPlayingIDs(void *a1, const char *a2, ...)
{
  return [a1 _displayPlayingIDs];
}

id objc_msgSend__displayTouchVisualFeedback(void *a1, const char *a2, ...)
{
  return [a1 _displayTouchVisualFeedback];
}

id objc_msgSend__doActions(void *a1, const char *a2, ...)
{
  return [a1 _doActions];
}

id objc_msgSend__durationDictionaryForGuidelines(void *a1, const char *a2, ...)
{
  return [a1 _durationDictionaryForGuidelines];
}

id objc_msgSend__effectAttributes(void *a1, const char *a2, ...)
{
  return [a1 _effectAttributes];
}

id objc_msgSend__executeLayerCommandQueue(void *a1, const char *a2, ...)
{
  return [a1 _executeLayerCommandQueue];
}

id objc_msgSend__firstEffectContainer(void *a1, const char *a2, ...)
{
  return [a1 _firstEffectContainer];
}

id objc_msgSend__getInterestingTimesForSublayerControl(void *a1, const char *a2, ...)
{
  return [a1 _getInterestingTimesForSublayerControl];
}

id objc_msgSend__hideTextWhileEditing(void *a1, const char *a2, ...)
{
  return [a1 _hideTextWhileEditing];
}

id objc_msgSend__initCouchPotatoSettings(void *a1, const char *a2, ...)
{
  return [a1 _initCouchPotatoSettings];
}

id objc_msgSend__initTemplates(void *a1, const char *a2, ...)
{
  return [a1 _initTemplates];
}

id objc_msgSend__isMadeOpaqueBySublayers(void *a1, const char *a2, ...)
{
  return [a1 _isMadeOpaqueBySublayers];
}

id objc_msgSend__isNative3D(void *a1, const char *a2, ...)
{
  return [a1 _isNative3D];
}

id objc_msgSend__isPaused(void *a1, const char *a2, ...)
{
  return [a1 _isPaused];
}

id objc_msgSend__mainLayerIndex(void *a1, const char *a2, ...)
{
  return [a1 _mainLayerIndex];
}

id objc_msgSend__marimbaViewCommonInit(void *a1, const char *a2, ...)
{
  return [a1 _marimbaViewCommonInit];
}

id objc_msgSend__maxLinesForCurrentEditingTextElement(void *a1, const char *a2, ...)
{
  return [a1 _maxLinesForCurrentEditingTextElement];
}

id objc_msgSend__maxSizeForCurrentEditingTextElement(void *a1, const char *a2, ...)
{
  return [a1 _maxSizeForCurrentEditingTextElement];
}

id objc_msgSend__observePlug(void *a1, const char *a2, ...)
{
  return [a1 _observePlug];
}

id objc_msgSend__observePlugOnPreactivate(void *a1, const char *a2, ...)
{
  return [a1 _observePlugOnPreactivate];
}

id objc_msgSend__postProcess(void *a1, const char *a2, ...)
{
  return [a1 _postProcess];
}

id objc_msgSend__rebuildAudio(void *a1, const char *a2, ...)
{
  return [a1 _rebuildAudio];
}

id objc_msgSend__rebuildEffect(void *a1, const char *a2, ...)
{
  return [a1 _rebuildEffect];
}

id objc_msgSend__removeExtraSublayer(void *a1, const char *a2, ...)
{
  return [a1 _removeExtraSublayer];
}

id objc_msgSend__renderer(void *a1, const char *a2, ...)
{
  return [a1 _renderer];
}

id objc_msgSend__rendererSize(void *a1, const char *a2, ...)
{
  return [a1 _rendererSize];
}

id objc_msgSend__resetVariableIndicies(void *a1, const char *a2, ...)
{
  return [a1 _resetVariableIndicies];
}

id objc_msgSend__scale(void *a1, const char *a2, ...)
{
  return [a1 _scale];
}

id objc_msgSend__sendCancelActions(void *a1, const char *a2, ...)
{
  return [a1 _sendCancelActions];
}

id objc_msgSend__sendEndActions(void *a1, const char *a2, ...)
{
  return [a1 _sendEndActions];
}

id objc_msgSend__sendStartActions(void *a1, const char *a2, ...)
{
  return [a1 _sendStartActions];
}

id objc_msgSend__sendUpdateActions(void *a1, const char *a2, ...)
{
  return [a1 _sendUpdateActions];
}

id objc_msgSend__setupSwingTimings(void *a1, const char *a2, ...)
{
  return [a1 _setupSwingTimings];
}

id objc_msgSend__sizeToRendererAt(void *a1, const char *a2, ...)
{
  return [a1 _sizeToRendererAt];
}

id objc_msgSend__startMonitoringThermalPressureLevelChanges(void *a1, const char *a2, ...)
{
  return [a1 _startMonitoringThermalPressureLevelChanges];
}

id objc_msgSend__stopMonitoringThermalPressureLevelChanges(void *a1, const char *a2, ...)
{
  return [a1 _stopMonitoringThermalPressureLevelChanges];
}

id objc_msgSend__subtitleDictionaryForGuidelines(void *a1, const char *a2, ...)
{
  return [a1 _subtitleDictionaryForGuidelines];
}

id objc_msgSend__time(void *a1, const char *a2, ...)
{
  return [a1 _time];
}

id objc_msgSend__transitionAttributes(void *a1, const char *a2, ...)
{
  return [a1 _transitionAttributes];
}

id objc_msgSend__unalteredTime(void *a1, const char *a2, ...)
{
  return [a1 _unalteredTime];
}

id objc_msgSend__unload(void *a1, const char *a2, ...)
{
  return [a1 _unload];
}

id objc_msgSend__unobservePlug(void *a1, const char *a2, ...)
{
  return [a1 _unobservePlug];
}

id objc_msgSend__unobservePlugOnDepreactivate(void *a1, const char *a2, ...)
{
  return [a1 _unobservePlugOnDepreactivate];
}

id objc_msgSend__updateEffectAttributes(void *a1, const char *a2, ...)
{
  return [a1 _updateEffectAttributes];
}

id objc_msgSend__updateEffectTiming(void *a1, const char *a2, ...)
{
  return [a1 _updateEffectTiming];
}

id objc_msgSend__updateMarimbaDocument(void *a1, const char *a2, ...)
{
  return [a1 _updateMarimbaDocument];
}

id objc_msgSend__updateSelectionLayer(void *a1, const char *a2, ...)
{
  return [a1 _updateSelectionLayer];
}

id objc_msgSend__updateSlides(void *a1, const char *a2, ...)
{
  return [a1 _updateSlides];
}

id objc_msgSend__updateSublayersOrdering(void *a1, const char *a2, ...)
{
  return [a1 _updateSublayersOrdering];
}

id objc_msgSend__updateSynopsisGuideline(void *a1, const char *a2, ...)
{
  return [a1 _updateSynopsisGuideline];
}

id objc_msgSend__updateTexts(void *a1, const char *a2, ...)
{
  return [a1 _updateTexts];
}

id objc_msgSend__updateTiming(void *a1, const char *a2, ...)
{
  return [a1 _updateTiming];
}

id objc_msgSend_abort(void *a1, const char *a2, ...)
{
  return [a1 abort];
}

id objc_msgSend_absolutePath(void *a1, const char *a2, ...)
{
  return [a1 absolutePath];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return [a1 action];
}

id objc_msgSend_actionGroup(void *a1, const char *a2, ...)
{
  return [a1 actionGroup];
}

id objc_msgSend_actionIfFalse(void *a1, const char *a2, ...)
{
  return [a1 actionIfFalse];
}

id objc_msgSend_actionIfTrue(void *a1, const char *a2, ...)
{
  return [a1 actionIfTrue];
}

id objc_msgSend_actionKey(void *a1, const char *a2, ...)
{
  return [a1 actionKey];
}

id objc_msgSend_actions(void *a1, const char *a2, ...)
{
  return [a1 actions];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_addSlide(void *a1, const char *a2, ...)
{
  return [a1 addSlide];
}

id objc_msgSend_affineTransform(void *a1, const char *a2, ...)
{
  return [a1 affineTransform];
}

id objc_msgSend_allConstraints(void *a1, const char *a2, ...)
{
  return [a1 allConstraints];
}

id objc_msgSend_allEffectContainers(void *a1, const char *a2, ...)
{
  return [a1 allEffectContainers];
}

id objc_msgSend_allFrameIDs(void *a1, const char *a2, ...)
{
  return [a1 allFrameIDs];
}

id objc_msgSend_allItems(void *a1, const char *a2, ...)
{
  return [a1 allItems];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allMediaURLs(void *a1, const char *a2, ...)
{
  return [a1 allMediaURLs];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allSlides(void *a1, const char *a2, ...)
{
  return [a1 allSlides];
}

id objc_msgSend_allSlidesSortedByUsage(void *a1, const char *a2, ...)
{
  return [a1 allSlidesSortedByUsage];
}

id objc_msgSend_allSlidesSortedChronologically(void *a1, const char *a2, ...)
{
  return [a1 allSlidesSortedChronologically];
}

id objc_msgSend_allSongs(void *a1, const char *a2, ...)
{
  return [a1 allSongs];
}

id objc_msgSend_allUsageCounts(void *a1, const char *a2, ...)
{
  return [a1 allUsageCounts];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_alwaysLookupAbsolutePaths(void *a1, const char *a2, ...)
{
  return [a1 alwaysLookupAbsolutePaths];
}

id objc_msgSend_alwaysNotifies(void *a1, const char *a2, ...)
{
  return [a1 alwaysNotifies];
}

id objc_msgSend_animatedKey(void *a1, const char *a2, ...)
{
  return [a1 animatedKey];
}

id objc_msgSend_animatedParent(void *a1, const char *a2, ...)
{
  return [a1 animatedParent];
}

id objc_msgSend_animationAttributes(void *a1, const char *a2, ...)
{
  return [a1 animationAttributes];
}

id objc_msgSend_animationKey(void *a1, const char *a2, ...)
{
  return [a1 animationKey];
}

id objc_msgSend_animationPath(void *a1, const char *a2, ...)
{
  return [a1 animationPath];
}

id objc_msgSend_animationPaths(void *a1, const char *a2, ...)
{
  return [a1 animationPaths];
}

id objc_msgSend_animationTriggers(void *a1, const char *a2, ...)
{
  return [a1 animationTriggers];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_applyFormattedAttributes(void *a1, const char *a2, ...)
{
  return [a1 applyFormattedAttributes];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_aspectRatio(void *a1, const char *a2, ...)
{
  return [a1 aspectRatio];
}

id objc_msgSend_asset(void *a1, const char *a2, ...)
{
  return [a1 asset];
}

id objc_msgSend_assetKeyDelegate(void *a1, const char *a2, ...)
{
  return [a1 assetKeyDelegate];
}

id objc_msgSend_assetLogging(void *a1, const char *a2, ...)
{
  return [a1 assetLogging];
}

id objc_msgSend_assetManagementDelegate(void *a1, const char *a2, ...)
{
  return [a1 assetManagementDelegate];
}

id objc_msgSend_assetManager(void *a1, const char *a2, ...)
{
  return [a1 assetManager];
}

id objc_msgSend_assetPath(void *a1, const char *a2, ...)
{
  return [a1 assetPath];
}

id objc_msgSend_assetTrack(void *a1, const char *a2, ...)
{
  return [a1 assetTrack];
}

id objc_msgSend_attributedString(void *a1, const char *a2, ...)
{
  return [a1 attributedString];
}

id objc_msgSend_attributedText(void *a1, const char *a2, ...)
{
  return [a1 attributedText];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return [a1 attributes];
}

id objc_msgSend_audioDuckInDuration(void *a1, const char *a2, ...)
{
  return [a1 audioDuckInDuration];
}

id objc_msgSend_audioDuckLevel(void *a1, const char *a2, ...)
{
  return [a1 audioDuckLevel];
}

id objc_msgSend_audioDuckOutDuration(void *a1, const char *a2, ...)
{
  return [a1 audioDuckOutDuration];
}

id objc_msgSend_audioFadeInDuration(void *a1, const char *a2, ...)
{
  return [a1 audioFadeInDuration];
}

id objc_msgSend_audioFadeOutDuration(void *a1, const char *a2, ...)
{
  return [a1 audioFadeOutDuration];
}

id objc_msgSend_audioPaths(void *a1, const char *a2, ...)
{
  return [a1 audioPaths];
}

id objc_msgSend_audioPlaylist(void *a1, const char *a2, ...)
{
  return [a1 audioPlaylist];
}

id objc_msgSend_audioPlaylistCreateIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 audioPlaylistCreateIfNeeded];
}

id objc_msgSend_audioPriority(void *a1, const char *a2, ...)
{
  return [a1 audioPriority];
}

id objc_msgSend_audioVolume(void *a1, const char *a2, ...)
{
  return [a1 audioVolume];
}

id objc_msgSend_authoredDocument(void *a1, const char *a2, ...)
{
  return [a1 authoredDocument];
}

id objc_msgSend_authoredVersionInfo(void *a1, const char *a2, ...)
{
  return [a1 authoredVersionInfo];
}

id objc_msgSend_authoringOptions(void *a1, const char *a2, ...)
{
  return [a1 authoringOptions];
}

id objc_msgSend_autoAdjustDuration(void *a1, const char *a2, ...)
{
  return [a1 autoAdjustDuration];
}

id objc_msgSend_avPlayer(void *a1, const char *a2, ...)
{
  return [a1 avPlayer];
}

id objc_msgSend_avPlayerItem(void *a1, const char *a2, ...)
{
  return [a1 avPlayerItem];
}

id objc_msgSend_backColor(void *a1, const char *a2, ...)
{
  return [a1 backColor];
}

id objc_msgSend_backgroundAudioID(void *a1, const char *a2, ...)
{
  return [a1 backgroundAudioID];
}

id objc_msgSend_backgroundCGColor(void *a1, const char *a2, ...)
{
  return [a1 backgroundCGColor];
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return [a1 backgroundColor];
}

id objc_msgSend_bailTimeWatcher(void *a1, const char *a2, ...)
{
  return [a1 bailTimeWatcher];
}

id objc_msgSend_baseContext(void *a1, const char *a2, ...)
{
  return [a1 baseContext];
}

id objc_msgSend_batchModifyCount(void *a1, const char *a2, ...)
{
  return [a1 batchModifyCount];
}

id objc_msgSend_becomeReady(void *a1, const char *a2, ...)
{
  return [a1 becomeReady];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return [a1 begin];
}

id objc_msgSend_beginLiveUpdate(void *a1, const char *a2, ...)
{
  return [a1 beginLiveUpdate];
}

id objc_msgSend_blackCGColor(void *a1, const char *a2, ...)
{
  return [a1 blackCGColor];
}

id objc_msgSend_block(void *a1, const char *a2, ...)
{
  return [a1 block];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_borderColor(void *a1, const char *a2, ...)
{
  return [a1 borderColor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cacheAbsolutePathOverride(void *a1, const char *a2, ...)
{
  return [a1 cacheAbsolutePathOverride];
}

id objc_msgSend_cacheText(void *a1, const char *a2, ...)
{
  return [a1 cacheText];
}

id objc_msgSend_cachedAbsolutePaths(void *a1, const char *a2, ...)
{
  return [a1 cachedAbsolutePaths];
}

id objc_msgSend_cachedAbsoluteStillPaths(void *a1, const char *a2, ...)
{
  return [a1 cachedAbsoluteStillPaths];
}

id objc_msgSend_cachedActionableLayers(void *a1, const char *a2, ...)
{
  return [a1 cachedActionableLayers];
}

id objc_msgSend_cachedPathLock(void *a1, const char *a2, ...)
{
  return [a1 cachedPathLock];
}

id objc_msgSend_cameraCaptureSession(void *a1, const char *a2, ...)
{
  return [a1 cameraCaptureSession];
}

id objc_msgSend_canInteract(void *a1, const char *a2, ...)
{
  return [a1 canInteract];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_cancelAllOperations(void *a1, const char *a2, ...)
{
  return [a1 cancelAllOperations];
}

id objc_msgSend_cancelLoading(void *a1, const char *a2, ...)
{
  return [a1 cancelLoading];
}

id objc_msgSend_cancelPendingPrerolls(void *a1, const char *a2, ...)
{
  return [a1 cancelPendingPrerolls];
}

id objc_msgSend_cancelPendingSeeks(void *a1, const char *a2, ...)
{
  return [a1 cancelPendingSeeks];
}

id objc_msgSend_caption(void *a1, const char *a2, ...)
{
  return [a1 caption];
}

id objc_msgSend_captureDate(void *a1, const char *a2, ...)
{
  return [a1 captureDate];
}

id objc_msgSend_caresAboutForeColor(void *a1, const char *a2, ...)
{
  return [a1 caresAboutForeColor];
}

id objc_msgSend_caresAboutNormal(void *a1, const char *a2, ...)
{
  return [a1 caresAboutNormal];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return [a1 center];
}

id objc_msgSend_centerX(void *a1, const char *a2, ...)
{
  return [a1 centerX];
}

id objc_msgSend_centerY(void *a1, const char *a2, ...)
{
  return [a1 centerY];
}

id objc_msgSend_centroid(void *a1, const char *a2, ...)
{
  return [a1 centroid];
}

id objc_msgSend_check(void *a1, const char *a2, ...)
{
  return [a1 check];
}

id objc_msgSend_checkForMaxFontSize(void *a1, const char *a2, ...)
{
  return [a1 checkForMaxFontSize];
}

id objc_msgSend_checkForPlacesLabel(void *a1, const char *a2, ...)
{
  return [a1 checkForPlacesLabel];
}

id objc_msgSend_clampMode(void *a1, const char *a2, ...)
{
  return [a1 clampMode];
}

id objc_msgSend_cleaningUp(void *a1, const char *a2, ...)
{
  return [a1 cleaningUp];
}

id objc_msgSend_cleanup(void *a1, const char *a2, ...)
{
  return [a1 cleanup];
}

id objc_msgSend_cleanupClusters(void *a1, const char *a2, ...)
{
  return [a1 cleanupClusters];
}

id objc_msgSend_clearAllItems(void *a1, const char *a2, ...)
{
  return [a1 clearAllItems];
}

id objc_msgSend_clearAllPools(void *a1, const char *a2, ...)
{
  return [a1 clearAllPools];
}

id objc_msgSend_clearCache(void *a1, const char *a2, ...)
{
  return [a1 clearCache];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_clearIgnoreIndices(void *a1, const char *a2, ...)
{
  return [a1 clearIgnoreIndices];
}

id objc_msgSend_clearPool(void *a1, const char *a2, ...)
{
  return [a1 clearPool];
}

id objc_msgSend_clearROICache(void *a1, const char *a2, ...)
{
  return [a1 clearROICache];
}

id objc_msgSend_clearVars(void *a1, const char *a2, ...)
{
  return [a1 clearVars];
}

id objc_msgSend_clientObject(void *a1, const char *a2, ...)
{
  return [a1 clientObject];
}

id objc_msgSend_clipsContainer(void *a1, const char *a2, ...)
{
  return [a1 clipsContainer];
}

id objc_msgSend_clock(void *a1, const char *a2, ...)
{
  return [a1 clock];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_collectionView(void *a1, const char *a2, ...)
{
  return [a1 collectionView];
}

id objc_msgSend_colorSpace(void *a1, const char *a2, ...)
{
  return [a1 colorSpace];
}

id objc_msgSend_combineOperation(void *a1, const char *a2, ...)
{
  return [a1 combineOperation];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return [a1 commit];
}

id objc_msgSend_commitShaderChange(void *a1, const char *a2, ...)
{
  return [a1 commitShaderChange];
}

id objc_msgSend_condition(void *a1, const char *a2, ...)
{
  return [a1 condition];
}

id objc_msgSend_configureActions(void *a1, const char *a2, ...)
{
  return [a1 configureActions];
}

id objc_msgSend_configureTarget(void *a1, const char *a2, ...)
{
  return [a1 configureTarget];
}

id objc_msgSend_container(void *a1, const char *a2, ...)
{
  return [a1 container];
}

id objc_msgSend_containerLock(void *a1, const char *a2, ...)
{
  return [a1 containerLock];
}

id objc_msgSend_containerTime(void *a1, const char *a2, ...)
{
  return [a1 containerTime];
}

id objc_msgSend_contentScaleFactor(void *a1, const char *a2, ...)
{
  return [a1 contentScaleFactor];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_contentsScale(void *a1, const char *a2, ...)
{
  return [a1 contentsScale];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return [a1 context];
}

id objc_msgSend_controlsLayersTime(void *a1, const char *a2, ...)
{
  return [a1 controlsLayersTime];
}

id objc_msgSend_convertFromEffectContainerToParallelizer(void *a1, const char *a2, ...)
{
  return [a1 convertFromEffectContainerToParallelizer];
}

id objc_msgSend_convertFromParallelizerToEffectContainer(void *a1, const char *a2, ...)
{
  return [a1 convertFromParallelizerToEffectContainer];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_copyForPreloading(void *a1, const char *a2, ...)
{
  return [a1 copyForPreloading];
}

id objc_msgSend_copyNextSampleBuffer(void *a1, const char *a2, ...)
{
  return [a1 copyNextSampleBuffer];
}

id objc_msgSend_couchModeLoops(void *a1, const char *a2, ...)
{
  return [a1 couchModeLoops];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_countOfActions(void *a1, const char *a2, ...)
{
  return [a1 countOfActions];
}

id objc_msgSend_countOfActiveTouches(void *a1, const char *a2, ...)
{
  return [a1 countOfActiveTouches];
}

id objc_msgSend_countOfAnimationPaths(void *a1, const char *a2, ...)
{
  return [a1 countOfAnimationPaths];
}

id objc_msgSend_countOfEffectContainers(void *a1, const char *a2, ...)
{
  return [a1 countOfEffectContainers];
}

id objc_msgSend_countOfEffects(void *a1, const char *a2, ...)
{
  return [a1 countOfEffects];
}

id objc_msgSend_countOfFilters(void *a1, const char *a2, ...)
{
  return [a1 countOfFilters];
}

id objc_msgSend_countOfLayers(void *a1, const char *a2, ...)
{
  return [a1 countOfLayers];
}

id objc_msgSend_countOfLayouts(void *a1, const char *a2, ...)
{
  return [a1 countOfLayouts];
}

id objc_msgSend_countOfPlugs(void *a1, const char *a2, ...)
{
  return [a1 countOfPlugs];
}

id objc_msgSend_countOfSlides(void *a1, const char *a2, ...)
{
  return [a1 countOfSlides];
}

id objc_msgSend_countOfSongs(void *a1, const char *a2, ...)
{
  return [a1 countOfSongs];
}

id objc_msgSend_countOfTexts(void *a1, const char *a2, ...)
{
  return [a1 countOfTexts];
}

id objc_msgSend_countOfVertices(void *a1, const char *a2, ...)
{
  return [a1 countOfVertices];
}

id objc_msgSend_countOfWords(void *a1, const char *a2, ...)
{
  return [a1 countOfWords];
}

id objc_msgSend_createEffectContainer(void *a1, const char *a2, ...)
{
  return [a1 createEffectContainer];
}

id objc_msgSend_createNavigatorContainer(void *a1, const char *a2, ...)
{
  return [a1 createNavigatorContainer];
}

id objc_msgSend_createParallelizerContainer(void *a1, const char *a2, ...)
{
  return [a1 createParallelizerContainer];
}

id objc_msgSend_createSerializerContainer(void *a1, const char *a2, ...)
{
  return [a1 createSerializerContainer];
}

id objc_msgSend_createTextsWithDefaultStrings(void *a1, const char *a2, ...)
{
  return [a1 createTextsWithDefaultStrings];
}

id objc_msgSend_creationDate(void *a1, const char *a2, ...)
{
  return [a1 creationDate];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentContext(void *a1, const char *a2, ...)
{
  return [a1 currentContext];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentDuckLevel(void *a1, const char *a2, ...)
{
  return [a1 currentDuckLevel];
}

id objc_msgSend_currentFocusedSlideAsset(void *a1, const char *a2, ...)
{
  return [a1 currentFocusedSlideAsset];
}

id objc_msgSend_currentItem(void *a1, const char *a2, ...)
{
  return [a1 currentItem];
}

id objc_msgSend_currentLayoutIndex(void *a1, const char *a2, ...)
{
  return [a1 currentLayoutIndex];
}

id objc_msgSend_currentLoopIndex(void *a1, const char *a2, ...)
{
  return [a1 currentLoopIndex];
}

id objc_msgSend_currentRotation(void *a1, const char *a2, ...)
{
  return [a1 currentRotation];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_currentScale(void *a1, const char *a2, ...)
{
  return [a1 currentScale];
}

id objc_msgSend_currentSlide(void *a1, const char *a2, ...)
{
  return [a1 currentSlide];
}

id objc_msgSend_currentSlideInfo(void *a1, const char *a2, ...)
{
  return [a1 currentSlideInfo];
}

id objc_msgSend_currentSlideInfos(void *a1, const char *a2, ...)
{
  return [a1 currentSlideInfos];
}

id objc_msgSend_currentSlides(void *a1, const char *a2, ...)
{
  return [a1 currentSlides];
}

id objc_msgSend_currentSlideshowTime(void *a1, const char *a2, ...)
{
  return [a1 currentSlideshowTime];
}

id objc_msgSend_currentStateForMontageSwap(void *a1, const char *a2, ...)
{
  return [a1 currentStateForMontageSwap];
}

id objc_msgSend_currentStyle(void *a1, const char *a2, ...)
{
  return [a1 currentStyle];
}

id objc_msgSend_currentSublayer(void *a1, const char *a2, ...)
{
  return [a1 currentSublayer];
}

id objc_msgSend_currentThis(void *a1, const char *a2, ...)
{
  return [a1 currentThis];
}

id objc_msgSend_currentTime(void *a1, const char *a2, ...)
{
  return [a1 currentTime];
}

id objc_msgSend_currentTranslation(void *a1, const char *a2, ...)
{
  return [a1 currentTranslation];
}

id objc_msgSend_dataSource(void *a1, const char *a2, ...)
{
  return [a1 dataSource];
}

id objc_msgSend_dayOfYearClusters(void *a1, const char *a2, ...)
{
  return [a1 dayOfYearClusters];
}

id objc_msgSend_deactivate(void *a1, const char *a2, ...)
{
  return [a1 deactivate];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultKenBurnsType(void *a1, const char *a2, ...)
{
  return [a1 defaultKenBurnsType];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultString(void *a1, const char *a2, ...)
{
  return [a1 defaultString];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_delegateIsTransitioningToo(void *a1, const char *a2, ...)
{
  return [a1 delegateIsTransitioningToo];
}

id objc_msgSend_demolish(void *a1, const char *a2, ...)
{
  return [a1 demolish];
}

id objc_msgSend_demolishActions(void *a1, const char *a2, ...)
{
  return [a1 demolishActions];
}

id objc_msgSend_demolishAnimationPaths(void *a1, const char *a2, ...)
{
  return [a1 demolishAnimationPaths];
}

id objc_msgSend_demolishFilters(void *a1, const char *a2, ...)
{
  return [a1 demolishFilters];
}

id objc_msgSend_dependsOnFingerPosition(void *a1, const char *a2, ...)
{
  return [a1 dependsOnFingerPosition];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_destroyFramebuffer(void *a1, const char *a2, ...)
{
  return [a1 destroyFramebuffer];
}

id objc_msgSend_detectFacesInBackground(void *a1, const char *a2, ...)
{
  return [a1 detectFacesInBackground];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dimensionalMode(void *a1, const char *a2, ...)
{
  return [a1 dimensionalMode];
}

id objc_msgSend_disableFadeInAndOut(void *a1, const char *a2, ...)
{
  return [a1 disableFadeInAndOut];
}

id objc_msgSend_disarm(void *a1, const char *a2, ...)
{
  return [a1 disarm];
}

id objc_msgSend_displayDuration(void *a1, const char *a2, ...)
{
  return [a1 displayDuration];
}

id objc_msgSend_displayLinkTimestamp(void *a1, const char *a2, ...)
{
  return [a1 displayLinkTimestamp];
}

id objc_msgSend_displayStartTime(void *a1, const char *a2, ...)
{
  return [a1 displayStartTime];
}

id objc_msgSend_displayTime(void *a1, const char *a2, ...)
{
  return [a1 displayTime];
}

id objc_msgSend_displayedEffectContainers(void *a1, const char *a2, ...)
{
  return [a1 displayedEffectContainers];
}

id objc_msgSend_displaysTouchVisualFeedback(void *a1, const char *a2, ...)
{
  return [a1 displaysTouchVisualFeedback];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return [a1 distantFuture];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return [a1 distantPast];
}

id objc_msgSend_document(void *a1, const char *a2, ...)
{
  return [a1 document];
}

id objc_msgSend_documentLayerGroup(void *a1, const char *a2, ...)
{
  return [a1 documentLayerGroup];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_drain(void *a1, const char *a2, ...)
{
  return [a1 drain];
}

id objc_msgSend_duckInDuration(void *a1, const char *a2, ...)
{
  return [a1 duckInDuration];
}

id objc_msgSend_duckInTime(void *a1, const char *a2, ...)
{
  return [a1 duckInTime];
}

id objc_msgSend_duckLevel(void *a1, const char *a2, ...)
{
  return [a1 duckLevel];
}

id objc_msgSend_duckOutDuration(void *a1, const char *a2, ...)
{
  return [a1 duckOutDuration];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return [a1 duration];
}

id objc_msgSend_durationIsDefined(void *a1, const char *a2, ...)
{
  return [a1 durationIsDefined];
}

id objc_msgSend_durationPadding(void *a1, const char *a2, ...)
{
  return [a1 durationPadding];
}

id objc_msgSend_easeIn(void *a1, const char *a2, ...)
{
  return [a1 easeIn];
}

id objc_msgSend_easeOut(void *a1, const char *a2, ...)
{
  return [a1 easeOut];
}

id objc_msgSend_editedElement(void *a1, const char *a2, ...)
{
  return [a1 editedElement];
}

id objc_msgSend_editingDelegate(void *a1, const char *a2, ...)
{
  return [a1 editingDelegate];
}

id objc_msgSend_effect(void *a1, const char *a2, ...)
{
  return [a1 effect];
}

id objc_msgSend_effectAttributes(void *a1, const char *a2, ...)
{
  return [a1 effectAttributes];
}

id objc_msgSend_effectAuthoredAttributes(void *a1, const char *a2, ...)
{
  return [a1 effectAuthoredAttributes];
}

id objc_msgSend_effectAuthoredSlideCount(void *a1, const char *a2, ...)
{
  return [a1 effectAuthoredSlideCount];
}

id objc_msgSend_effectContainer(void *a1, const char *a2, ...)
{
  return [a1 effectContainer];
}

id objc_msgSend_effectContainers(void *a1, const char *a2, ...)
{
  return [a1 effectContainers];
}

id objc_msgSend_effectID(void *a1, const char *a2, ...)
{
  return [a1 effectID];
}

id objc_msgSend_effectLayer(void *a1, const char *a2, ...)
{
  return [a1 effectLayer];
}

id objc_msgSend_effectPresetID(void *a1, const char *a2, ...)
{
  return [a1 effectPresetID];
}

id objc_msgSend_effectTiming(void *a1, const char *a2, ...)
{
  return [a1 effectTiming];
}

id objc_msgSend_effects(void *a1, const char *a2, ...)
{
  return [a1 effects];
}

id objc_msgSend_elementID(void *a1, const char *a2, ...)
{
  return [a1 elementID];
}

id objc_msgSend_endLiveUpdate(void *a1, const char *a2, ...)
{
  return [a1 endLiveUpdate];
}

id objc_msgSend_endMorphing(void *a1, const char *a2, ...)
{
  return [a1 endMorphing];
}

id objc_msgSend_endMovingCurrentSublayer(void *a1, const char *a2, ...)
{
  return [a1 endMovingCurrentSublayer];
}

id objc_msgSend_endPanoramaPanning(void *a1, const char *a2, ...)
{
  return [a1 endPanoramaPanning];
}

id objc_msgSend_endTransitionToSublayer(void *a1, const char *a2, ...)
{
  return [a1 endTransitionToSublayer];
}

id objc_msgSend_enterSlideZoomMode(void *a1, const char *a2, ...)
{
  return [a1 enterSlideZoomMode];
}

id objc_msgSend_evaluate(void *a1, const char *a2, ...)
{
  return [a1 evaluate];
}

id objc_msgSend_exitSlideFocusMode(void *a1, const char *a2, ...)
{
  return [a1 exitSlideFocusMode];
}

id objc_msgSend_expression(void *a1, const char *a2, ...)
{
  return [a1 expression];
}

id objc_msgSend_externalTime(void *a1, const char *a2, ...)
{
  return [a1 externalTime];
}

id objc_msgSend_fadeInDuration(void *a1, const char *a2, ...)
{
  return [a1 fadeInDuration];
}

id objc_msgSend_fadeOutDuration(void *a1, const char *a2, ...)
{
  return [a1 fadeOutDuration];
}

id objc_msgSend_fastestEncoding(void *a1, const char *a2, ...)
{
  return [a1 fastestEncoding];
}

id objc_msgSend_featureDelegate(void *a1, const char *a2, ...)
{
  return [a1 featureDelegate];
}

id objc_msgSend_fileURL(void *a1, const char *a2, ...)
{
  return [a1 fileURL];
}

id objc_msgSend_filter0(void *a1, const char *a2, ...)
{
  return [a1 filter0];
}

id objc_msgSend_filter1(void *a1, const char *a2, ...)
{
  return [a1 filter1];
}

id objc_msgSend_filter2(void *a1, const char *a2, ...)
{
  return [a1 filter2];
}

id objc_msgSend_filter3(void *a1, const char *a2, ...)
{
  return [a1 filter3];
}

id objc_msgSend_filterAttributes(void *a1, const char *a2, ...)
{
  return [a1 filterAttributes];
}

id objc_msgSend_filterID(void *a1, const char *a2, ...)
{
  return [a1 filterID];
}

id objc_msgSend_filters(void *a1, const char *a2, ...)
{
  return [a1 filters];
}

id objc_msgSend_filtersNearest(void *a1, const char *a2, ...)
{
  return [a1 filtersNearest];
}

id objc_msgSend_findMaxDuration(void *a1, const char *a2, ...)
{
  return [a1 findMaxDuration];
}

id objc_msgSend_findMinDuration(void *a1, const char *a2, ...)
{
  return [a1 findMinDuration];
}

id objc_msgSend_finishLogging(void *a1, const char *a2, ...)
{
  return [a1 finishLogging];
}

id objc_msgSend_firstIndex(void *a1, const char *a2, ...)
{
  return [a1 firstIndex];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_flush(void *a1, const char *a2, ...)
{
  return [a1 flush];
}

id objc_msgSend_forcedState(void *a1, const char *a2, ...)
{
  return [a1 forcedState];
}

id objc_msgSend_foreColor(void *a1, const char *a2, ...)
{
  return [a1 foreColor];
}

id objc_msgSend_foreColorIsOpaqueWhite(void *a1, const char *a2, ...)
{
  return [a1 foreColorIsOpaqueWhite];
}

id objc_msgSend_formattedAttributes(void *a1, const char *a2, ...)
{
  return [a1 formattedAttributes];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_frameAttributes(void *a1, const char *a2, ...)
{
  return [a1 frameAttributes];
}

id objc_msgSend_frameID(void *a1, const char *a2, ...)
{
  return [a1 frameID];
}

id objc_msgSend_freezesSizeOfImageRequests(void *a1, const char *a2, ...)
{
  return [a1 freezesSizeOfImageRequests];
}

id objc_msgSend_fullDebugLog(void *a1, const char *a2, ...)
{
  return [a1 fullDebugLog];
}

id objc_msgSend_fullDuration(void *a1, const char *a2, ...)
{
  return [a1 fullDuration];
}

id objc_msgSend_function(void *a1, const char *a2, ...)
{
  return [a1 function];
}

id objc_msgSend_functionParameters(void *a1, const char *a2, ...)
{
  return [a1 functionParameters];
}

id objc_msgSend_functionTimeFactor(void *a1, const char *a2, ...)
{
  return [a1 functionTimeFactor];
}

id objc_msgSend_functionTimeOffset(void *a1, const char *a2, ...)
{
  return [a1 functionTimeOffset];
}

id objc_msgSend_generateMipmap(void *a1, const char *a2, ...)
{
  return [a1 generateMipmap];
}

id objc_msgSend_generatesMipmap(void *a1, const char *a2, ...)
{
  return [a1 generatesMipmap];
}

id objc_msgSend_gestureRecognizers(void *a1, const char *a2, ...)
{
  return [a1 gestureRecognizers];
}

id objc_msgSend_getRandomIndex(void *a1, const char *a2, ...)
{
  return [a1 getRandomIndex];
}

id objc_msgSend_glContext(void *a1, const char *a2, ...)
{
  return [a1 glContext];
}

id objc_msgSend_guidelineAuthoringAttributedTitle(void *a1, const char *a2, ...)
{
  return [a1 guidelineAuthoringAttributedTitle];
}

id objc_msgSend_guidelineAuthoringInteractiveTransitionSettings(void *a1, const char *a2, ...)
{
  return [a1 guidelineAuthoringInteractiveTransitionSettings];
}

id objc_msgSend_guidelineAuthoringMediaAttributes(void *a1, const char *a2, ...)
{
  return [a1 guidelineAuthoringMediaAttributes];
}

id objc_msgSend_guidelineAuthoringTitle(void *a1, const char *a2, ...)
{
  return [a1 guidelineAuthoringTitle];
}

id objc_msgSend_guidelineAuthoringUserAudioItems(void *a1, const char *a2, ...)
{
  return [a1 guidelineAuthoringUserAudioItems];
}

id objc_msgSend_guidelineAuthoringUserMediaItems(void *a1, const char *a2, ...)
{
  return [a1 guidelineAuthoringUserMediaItems];
}

id objc_msgSend_hasAudio(void *a1, const char *a2, ...)
{
  return [a1 hasAudio];
}

id objc_msgSend_hasBeenHidden(void *a1, const char *a2, ...)
{
  return [a1 hasBeenHidden];
}

id objc_msgSend_hasCustomTiming(void *a1, const char *a2, ...)
{
  return [a1 hasCustomTiming];
}

id objc_msgSend_hasEnded(void *a1, const char *a2, ...)
{
  return [a1 hasEnded];
}

id objc_msgSend_hasKenBurns(void *a1, const char *a2, ...)
{
  return [a1 hasKenBurns];
}

id objc_msgSend_hasMipmap(void *a1, const char *a2, ...)
{
  return [a1 hasMipmap];
}

id objc_msgSend_hasMovie(void *a1, const char *a2, ...)
{
  return [a1 hasMovie];
}

id objc_msgSend_hasMovies(void *a1, const char *a2, ...)
{
  return [a1 hasMovies];
}

id objc_msgSend_hasSlides(void *a1, const char *a2, ...)
{
  return [a1 hasSlides];
}

id objc_msgSend_hasSomethingToRender(void *a1, const char *a2, ...)
{
  return [a1 hasSomethingToRender];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_height(void *a1, const char *a2, ...)
{
  return [a1 height];
}

id objc_msgSend_hitBlob(void *a1, const char *a2, ...)
{
  return [a1 hitBlob];
}

id objc_msgSend_hourOfYearClusters(void *a1, const char *a2, ...)
{
  return [a1 hourOfYearClusters];
}

id objc_msgSend_idInSupercontainer(void *a1, const char *a2, ...)
{
  return [a1 idInSupercontainer];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_ignoredIndices(void *a1, const char *a2, ...)
{
  return [a1 ignoredIndices];
}

id objc_msgSend_ignoresBackgroundAudio(void *a1, const char *a2, ...)
{
  return [a1 ignoresBackgroundAudio];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_imageAspectRatio(void *a1, const char *a2, ...)
{
  return [a1 imageAspectRatio];
}

id objc_msgSend_imageCounts(void *a1, const char *a2, ...)
{
  return [a1 imageCounts];
}

id objc_msgSend_imageGLContext(void *a1, const char *a2, ...)
{
  return [a1 imageGLContext];
}

id objc_msgSend_imageManager(void *a1, const char *a2, ...)
{
  return [a1 imageManager];
}

id objc_msgSend_imagePreloadingBegan(void *a1, const char *a2, ...)
{
  return [a1 imagePreloadingBegan];
}

id objc_msgSend_imagePreloadingEnded(void *a1, const char *a2, ...)
{
  return [a1 imagePreloadingEnded];
}

id objc_msgSend_imageSizeScript(void *a1, const char *a2, ...)
{
  return [a1 imageSizeScript];
}

id objc_msgSend_imprint(void *a1, const char *a2, ...)
{
  return [a1 imprint];
}

id objc_msgSend_imprintsForActions(void *a1, const char *a2, ...)
{
  return [a1 imprintsForActions];
}

id objc_msgSend_imprintsForAnimationPaths(void *a1, const char *a2, ...)
{
  return [a1 imprintsForAnimationPaths];
}

id objc_msgSend_imprintsForFilters(void *a1, const char *a2, ...)
{
  return [a1 imprintsForFilters];
}

id objc_msgSend_index(void *a1, const char *a2, ...)
{
  return [a1 index];
}

id objc_msgSend_indexPath(void *a1, const char *a2, ...)
{
  return [a1 indexPath];
}

id objc_msgSend_indexSet(void *a1, const char *a2, ...)
{
  return [a1 indexSet];
}

id objc_msgSend_info(void *a1, const char *a2, ...)
{
  return [a1 info];
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return [a1 infoDictionary];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_initFromScratch(void *a1, const char *a2, ...)
{
  return [a1 initFromScratch];
}

id objc_msgSend_initSnapshot(void *a1, const char *a2, ...)
{
  return [a1 initSnapshot];
}

id objc_msgSend_initialImage(void *a1, const char *a2, ...)
{
  return [a1 initialImage];
}

id objc_msgSend_initialState(void *a1, const char *a2, ...)
{
  return [a1 initialState];
}

id objc_msgSend_initialTransitionAttributes(void *a1, const char *a2, ...)
{
  return [a1 initialTransitionAttributes];
}

id objc_msgSend_initialTransitionDuration(void *a1, const char *a2, ...)
{
  return [a1 initialTransitionDuration];
}

id objc_msgSend_initialTransitionID(void *a1, const char *a2, ...)
{
  return [a1 initialTransitionID];
}

id objc_msgSend_innerEaseInControl(void *a1, const char *a2, ...)
{
  return [a1 innerEaseInControl];
}

id objc_msgSend_innerEaseOutControl(void *a1, const char *a2, ...)
{
  return [a1 innerEaseOutControl];
}

id objc_msgSend_innerPath(void *a1, const char *a2, ...)
{
  return [a1 innerPath];
}

id objc_msgSend_innerState(void *a1, const char *a2, ...)
{
  return [a1 innerState];
}

id objc_msgSend_insertingInCollection(void *a1, const char *a2, ...)
{
  return [a1 insertingInCollection];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_interactionDelegate(void *a1, const char *a2, ...)
{
  return [a1 interactionDelegate];
}

id objc_msgSend_interactiveTransitionProgressThreshold(void *a1, const char *a2, ...)
{
  return [a1 interactiveTransitionProgressThreshold];
}

id objc_msgSend_interactiveTransitionTrackingBoxRadius(void *a1, const char *a2, ...)
{
  return [a1 interactiveTransitionTrackingBoxRadius];
}

id objc_msgSend_interactiveTransitionVelocityThreshold(void *a1, const char *a2, ...)
{
  return [a1 interactiveTransitionVelocityThreshold];
}

id objc_msgSend_introDuration(void *a1, const char *a2, ...)
{
  return [a1 introDuration];
}

id objc_msgSend_introTransitionDuration(void *a1, const char *a2, ...)
{
  return [a1 introTransitionDuration];
}

id objc_msgSend_invalidResult(void *a1, const char *a2, ...)
{
  return [a1 invalidResult];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invalidateLayout(void *a1, const char *a2, ...)
{
  return [a1 invalidateLayout];
}

id objc_msgSend_invoke(void *a1, const char *a2, ...)
{
  return [a1 invoke];
}

id objc_msgSend_isAboutToPlay(void *a1, const char *a2, ...)
{
  return [a1 isAboutToPlay];
}

id objc_msgSend_isAbsolutePath(void *a1, const char *a2, ...)
{
  return [a1 isAbsolutePath];
}

id objc_msgSend_isActivated(void *a1, const char *a2, ...)
{
  return [a1 isActivated];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return [a1 isActive];
}

id objc_msgSend_isAdhocLayer(void *a1, const char *a2, ...)
{
  return [a1 isAdhocLayer];
}

id objc_msgSend_isAlphaFriendly(void *a1, const char *a2, ...)
{
  return [a1 isAlphaFriendly];
}

id objc_msgSend_isAtEnd(void *a1, const char *a2, ...)
{
  return [a1 isAtEnd];
}

id objc_msgSend_isAudioLayer(void *a1, const char *a2, ...)
{
  return [a1 isAudioLayer];
}

id objc_msgSend_isAuthoring(void *a1, const char *a2, ...)
{
  return [a1 isAuthoring];
}

id objc_msgSend_isDimmed(void *a1, const char *a2, ...)
{
  return [a1 isDimmed];
}

id objc_msgSend_isDocumentLayerGroup(void *a1, const char *a2, ...)
{
  return [a1 isDocumentLayerGroup];
}

id objc_msgSend_isEmbeddedAsset(void *a1, const char *a2, ...)
{
  return [a1 isEmbeddedAsset];
}

id objc_msgSend_isEmpty(void *a1, const char *a2, ...)
{
  return [a1 isEmpty];
}

id objc_msgSend_isExporting(void *a1, const char *a2, ...)
{
  return [a1 isExporting];
}

id objc_msgSend_isFBO(void *a1, const char *a2, ...)
{
  return [a1 isFBO];
}

id objc_msgSend_isFlatAndSquare(void *a1, const char *a2, ...)
{
  return [a1 isFlatAndSquare];
}

id objc_msgSend_isFlipped(void *a1, const char *a2, ...)
{
  return [a1 isFlipped];
}

id objc_msgSend_isForExport(void *a1, const char *a2, ...)
{
  return [a1 isForExport];
}

id objc_msgSend_isGoingToNext(void *a1, const char *a2, ...)
{
  return [a1 isGoingToNext];
}

id objc_msgSend_isInBatchModify(void *a1, const char *a2, ...)
{
  return [a1 isInBatchModify];
}

id objc_msgSend_isInInteractiveMode(void *a1, const char *a2, ...)
{
  return [a1 isInInteractiveMode];
}

id objc_msgSend_isInPhaseOut(void *a1, const char *a2, ...)
{
  return [a1 isInPhaseOut];
}

id objc_msgSend_isInUse(void *a1, const char *a2, ...)
{
  return [a1 isInUse];
}

id objc_msgSend_isInZoomMode(void *a1, const char *a2, ...)
{
  return [a1 isInZoomMode];
}

id objc_msgSend_isInfinite(void *a1, const char *a2, ...)
{
  return [a1 isInfinite];
}

id objc_msgSend_isLive(void *a1, const char *a2, ...)
{
  return [a1 isLive];
}

id objc_msgSend_isLoaded(void *a1, const char *a2, ...)
{
  return [a1 isLoaded];
}

id objc_msgSend_isMain(void *a1, const char *a2, ...)
{
  return [a1 isMain];
}

id objc_msgSend_isMonochromatic(void *a1, const char *a2, ...)
{
  return [a1 isMonochromatic];
}

id objc_msgSend_isNative3D(void *a1, const char *a2, ...)
{
  return [a1 isNative3D];
}

id objc_msgSend_isOffscreen(void *a1, const char *a2, ...)
{
  return [a1 isOffscreen];
}

id objc_msgSend_isOpaque(void *a1, const char *a2, ...)
{
  return [a1 isOpaque];
}

id objc_msgSend_isPaused(void *a1, const char *a2, ...)
{
  return [a1 isPaused];
}

id objc_msgSend_isPlaying(void *a1, const char *a2, ...)
{
  return [a1 isPlaying];
}

id objc_msgSend_isPowerOfTwo(void *a1, const char *a2, ...)
{
  return [a1 isPowerOfTwo];
}

id objc_msgSend_isPreactivated(void *a1, const char *a2, ...)
{
  return [a1 isPreactivated];
}

id objc_msgSend_isPremultiplied(void *a1, const char *a2, ...)
{
  return [a1 isPremultiplied];
}

id objc_msgSend_isRandom(void *a1, const char *a2, ...)
{
  return [a1 isRandom];
}

id objc_msgSend_isReadyToTransitionToNextSublayer(void *a1, const char *a2, ...)
{
  return [a1 isReadyToTransitionToNextSublayer];
}

id objc_msgSend_isRetainedByEffectLayer(void *a1, const char *a2, ...)
{
  return [a1 isRetainedByEffectLayer];
}

id objc_msgSend_isRetainedBySlideProvider(void *a1, const char *a2, ...)
{
  return [a1 isRetainedBySlideProvider];
}

id objc_msgSend_isRetainedByTransitioner(void *a1, const char *a2, ...)
{
  return [a1 isRetainedByTransitioner];
}

id objc_msgSend_isScheduledForDestruction(void *a1, const char *a2, ...)
{
  return [a1 isScheduledForDestruction];
}

id objc_msgSend_isSecondary(void *a1, const char *a2, ...)
{
  return [a1 isSecondary];
}

id objc_msgSend_isSelected(void *a1, const char *a2, ...)
{
  return [a1 isSelected];
}

id objc_msgSend_isShared(void *a1, const char *a2, ...)
{
  return [a1 isShared];
}

id objc_msgSend_isSnapshot(void *a1, const char *a2, ...)
{
  return [a1 isSnapshot];
}

id objc_msgSend_isSplit(void *a1, const char *a2, ...)
{
  return [a1 isSplit];
}

id objc_msgSend_isStill(void *a1, const char *a2, ...)
{
  return [a1 isStill];
}

id objc_msgSend_isSupportedMovie(void *a1, const char *a2, ...)
{
  return [a1 isSupportedMovie];
}

id objc_msgSend_isSuspended(void *a1, const char *a2, ...)
{
  return [a1 isSuspended];
}

id objc_msgSend_isTransitionConnected(void *a1, const char *a2, ...)
{
  return [a1 isTransitionConnected];
}

id objc_msgSend_isTransitioning(void *a1, const char *a2, ...)
{
  return [a1 isTransitioning];
}

id objc_msgSend_isTriggered(void *a1, const char *a2, ...)
{
  return [a1 isTriggered];
}

id objc_msgSend_jumpedBackInTime(void *a1, const char *a2, ...)
{
  return [a1 jumpedBackInTime];
}

id objc_msgSend_kenBurnsType(void *a1, const char *a2, ...)
{
  return [a1 kenBurnsType];
}

id objc_msgSend_key(void *a1, const char *a2, ...)
{
  return [a1 key];
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return [a1 keyEnumerator];
}

id objc_msgSend_keyedLayers(void *a1, const char *a2, ...)
{
  return [a1 keyedLayers];
}

id objc_msgSend_keyframe(void *a1, const char *a2, ...)
{
  return [a1 keyframe];
}

id objc_msgSend_keyframes(void *a1, const char *a2, ...)
{
  return [a1 keyframes];
}

id objc_msgSend_keywordClusters(void *a1, const char *a2, ...)
{
  return [a1 keywordClusters];
}

id objc_msgSend_kineticFriction(void *a1, const char *a2, ...)
{
  return [a1 kineticFriction];
}

id objc_msgSend_lastIndex(void *a1, const char *a2, ...)
{
  return [a1 lastIndex];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_lastSlideChange(void *a1, const char *a2, ...)
{
  return [a1 lastSlideChange];
}

id objc_msgSend_lastSlideUsed(void *a1, const char *a2, ...)
{
  return [a1 lastSlideUsed];
}

id objc_msgSend_latitude(void *a1, const char *a2, ...)
{
  return [a1 latitude];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layerID(void *a1, const char *a2, ...)
{
  return [a1 layerID];
}

id objc_msgSend_layerKeyDictionary(void *a1, const char *a2, ...)
{
  return [a1 layerKeyDictionary];
}

id objc_msgSend_layers(void *a1, const char *a2, ...)
{
  return [a1 layers];
}

id objc_msgSend_layersCanPositionZIndex(void *a1, const char *a2, ...)
{
  return [a1 layersCanPositionZIndex];
}

id objc_msgSend_layouts(void *a1, const char *a2, ...)
{
  return [a1 layouts];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_letterCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 letterCharacterSet];
}

id objc_msgSend_linearScaleAtStart(void *a1, const char *a2, ...)
{
  return [a1 linearScaleAtStart];
}

id objc_msgSend_liveIndex(void *a1, const char *a2, ...)
{
  return [a1 liveIndex];
}

id objc_msgSend_liveLock(void *a1, const char *a2, ...)
{
  return [a1 liveLock];
}

id objc_msgSend_localAspectRatio(void *a1, const char *a2, ...)
{
  return [a1 localAspectRatio];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return [a1 location];
}

id objc_msgSend_locationClusters(void *a1, const char *a2, ...)
{
  return [a1 locationClusters];
}

id objc_msgSend_locationInSlideAtStart(void *a1, const char *a2, ...)
{
  return [a1 locationInSlideAtStart];
}

id objc_msgSend_locationInViewAtStart(void *a1, const char *a2, ...)
{
  return [a1 locationInViewAtStart];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_logRenderingTimes(void *a1, const char *a2, ...)
{
  return [a1 logRenderingTimes];
}

id objc_msgSend_longitude(void *a1, const char *a2, ...)
{
  return [a1 longitude];
}

id objc_msgSend_loopDuration(void *a1, const char *a2, ...)
{
  return [a1 loopDuration];
}

id objc_msgSend_loopingMode(void *a1, const char *a2, ...)
{
  return [a1 loopingMode];
}

id objc_msgSend_lowestDisplayTime(void *a1, const char *a2, ...)
{
  return [a1 lowestDisplayTime];
}

id objc_msgSend_magFilter(void *a1, const char *a2, ...)
{
  return [a1 magFilter];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainDuration(void *a1, const char *a2, ...)
{
  return [a1 mainDuration];
}

id objc_msgSend_mainLayers(void *a1, const char *a2, ...)
{
  return [a1 mainLayers];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_marimbaInteractivityIsEnabled(void *a1, const char *a2, ...)
{
  return [a1 marimbaInteractivityIsEnabled];
}

id objc_msgSend_marimbaLayer(void *a1, const char *a2, ...)
{
  return [a1 marimbaLayer];
}

id objc_msgSend_masterClock(void *a1, const char *a2, ...)
{
  return [a1 masterClock];
}

id objc_msgSend_maxDimension(void *a1, const char *a2, ...)
{
  return [a1 maxDimension];
}

id objc_msgSend_maxNumberOfLines(void *a1, const char *a2, ...)
{
  return [a1 maxNumberOfLines];
}

id objc_msgSend_maxNumberOfSlides(void *a1, const char *a2, ...)
{
  return [a1 maxNumberOfSlides];
}

id objc_msgSend_mcAction(void *a1, const char *a2, ...)
{
  return [a1 mcAction];
}

id objc_msgSend_mediaProperties(void *a1, const char *a2, ...)
{
  return [a1 mediaProperties];
}

id objc_msgSend_mediaType(void *a1, const char *a2, ...)
{
  return [a1 mediaType];
}

id objc_msgSend_mediaURLs(void *a1, const char *a2, ...)
{
  return [a1 mediaURLs];
}

id objc_msgSend_mergedSettings(void *a1, const char *a2, ...)
{
  return [a1 mergedSettings];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return [a1 metadata];
}

id objc_msgSend_minFilter(void *a1, const char *a2, ...)
{
  return [a1 minFilter];
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return [a1 minute];
}

id objc_msgSend_minuteOfYearClusters(void *a1, const char *a2, ...)
{
  return [a1 minuteOfYearClusters];
}

id objc_msgSend_mipmapFiltersNearest(void *a1, const char *a2, ...)
{
  return [a1 mipmapFiltersNearest];
}

id objc_msgSend_mode(void *a1, const char *a2, ...)
{
  return [a1 mode];
}

id objc_msgSend_modelViewMatrix(void *a1, const char *a2, ...)
{
  return [a1 modelViewMatrix];
}

id objc_msgSend_monochromaticColorSpace(void *a1, const char *a2, ...)
{
  return [a1 monochromaticColorSpace];
}

id objc_msgSend_montage(void *a1, const char *a2, ...)
{
  return [a1 montage];
}

id objc_msgSend_monthClusters(void *a1, const char *a2, ...)
{
  return [a1 monthClusters];
}

id objc_msgSend_monthOfYearClusters(void *a1, const char *a2, ...)
{
  return [a1 monthOfYearClusters];
}

id objc_msgSend_motions(void *a1, const char *a2, ...)
{
  return [a1 motions];
}

id objc_msgSend_moveToNextEffectContainer(void *a1, const char *a2, ...)
{
  return [a1 moveToNextEffectContainer];
}

id objc_msgSend_moveToPreviousEffectContainer(void *a1, const char *a2, ...)
{
  return [a1 moveToPreviousEffectContainer];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_naturalSize(void *a1, const char *a2, ...)
{
  return [a1 naturalSize];
}

id objc_msgSend_naturalTimeScale(void *a1, const char *a2, ...)
{
  return [a1 naturalTimeScale];
}

id objc_msgSend_navigatorKey(void *a1, const char *a2, ...)
{
  return [a1 navigatorKey];
}

id objc_msgSend_nearestLayer(void *a1, const char *a2, ...)
{
  return [a1 nearestLayer];
}

id objc_msgSend_nearestLayerGroup(void *a1, const char *a2, ...)
{
  return [a1 nearestLayerGroup];
}

id objc_msgSend_nearestPlug(void *a1, const char *a2, ...)
{
  return [a1 nearestPlug];
}

id objc_msgSend_needsActionConfigure(void *a1, const char *a2, ...)
{
  return [a1 needsActionConfigure];
}

id objc_msgSend_needsParallelizer(void *a1, const char *a2, ...)
{
  return [a1 needsParallelizer];
}

id objc_msgSend_needsUpdate(void *a1, const char *a2, ...)
{
  return [a1 needsUpdate];
}

id objc_msgSend_newColorSpaceForDevice(void *a1, const char *a2, ...)
{
  return [a1 newColorSpaceForDevice];
}

id objc_msgSend_newImageIsAvailable(void *a1, const char *a2, ...)
{
  return [a1 newImageIsAvailable];
}

id objc_msgSend_newlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 newlineCharacterSet];
}

id objc_msgSend_nextAvailableSlideIndex(void *a1, const char *a2, ...)
{
  return [a1 nextAvailableSlideIndex];
}

id objc_msgSend_nextAvailableTextIndex(void *a1, const char *a2, ...)
{
  return [a1 nextAvailableTextIndex];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_nextSlideID(void *a1, const char *a2, ...)
{
  return [a1 nextSlideID];
}

id objc_msgSend_nextSlideInfo(void *a1, const char *a2, ...)
{
  return [a1 nextSlideInfo];
}

id objc_msgSend_nextSublayer(void *a1, const char *a2, ...)
{
  return [a1 nextSublayer];
}

id objc_msgSend_nextTransition(void *a1, const char *a2, ...)
{
  return [a1 nextTransition];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_numberOfLines(void *a1, const char *a2, ...)
{
  return [a1 numberOfLines];
}

id objc_msgSend_numberOfLinesForTruncatedText(void *a1, const char *a2, ...)
{
  return [a1 numberOfLinesForTruncatedText];
}

id objc_msgSend_numberOfLoops(void *a1, const char *a2, ...)
{
  return [a1 numberOfLoops];
}

id objc_msgSend_numberOfMediaItems(void *a1, const char *a2, ...)
{
  return [a1 numberOfMediaItems];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 objectEnumerator];
}

id objc_msgSend_objectID(void *a1, const char *a2, ...)
{
  return [a1 objectID];
}

id objc_msgSend_observer(void *a1, const char *a2, ...)
{
  return [a1 observer];
}

id objc_msgSend_offsetType(void *a1, const char *a2, ...)
{
  return [a1 offsetType];
}

id objc_msgSend_opacity(void *a1, const char *a2, ...)
{
  return [a1 opacity];
}

id objc_msgSend_operation(void *a1, const char *a2, ...)
{
  return [a1 operation];
}

id objc_msgSend_operationQueueConcurrentOperationCount(void *a1, const char *a2, ...)
{
  return [a1 operationQueueConcurrentOperationCount];
}

id objc_msgSend_operations(void *a1, const char *a2, ...)
{
  return [a1 operations];
}

id objc_msgSend_opusKitBundle(void *a1, const char *a2, ...)
{
  return [a1 opusKitBundle];
}

id objc_msgSend_orderedAndPrioritizedSlideClusters(void *a1, const char *a2, ...)
{
  return [a1 orderedAndPrioritizedSlideClusters];
}

id objc_msgSend_orderedKeyframes(void *a1, const char *a2, ...)
{
  return [a1 orderedKeyframes];
}

id objc_msgSend_orderedPlugs(void *a1, const char *a2, ...)
{
  return [a1 orderedPlugs];
}

id objc_msgSend_orderedRandomTransitions(void *a1, const char *a2, ...)
{
  return [a1 orderedRandomTransitions];
}

id objc_msgSend_orderedSlides(void *a1, const char *a2, ...)
{
  return [a1 orderedSlides];
}

id objc_msgSend_orderedSongs(void *a1, const char *a2, ...)
{
  return [a1 orderedSongs];
}

id objc_msgSend_orderedVideoPaths(void *a1, const char *a2, ...)
{
  return [a1 orderedVideoPaths];
}

id objc_msgSend_organizeRandomTransitions(void *a1, const char *a2, ...)
{
  return [a1 organizeRandomTransitions];
}

id objc_msgSend_orientation(void *a1, const char *a2, ...)
{
  return [a1 orientation];
}

id objc_msgSend_originalSize(void *a1, const char *a2, ...)
{
  return [a1 originalSize];
}

id objc_msgSend_outerLayer(void *a1, const char *a2, ...)
{
  return [a1 outerLayer];
}

id objc_msgSend_outroDuration(void *a1, const char *a2, ...)
{
  return [a1 outroDuration];
}

id objc_msgSend_outroTransitionDuration(void *a1, const char *a2, ...)
{
  return [a1 outroTransitionDuration];
}

id objc_msgSend_overallUsageCounter(void *a1, const char *a2, ...)
{
  return [a1 overallUsageCounter];
}

id objc_msgSend_page(void *a1, const char *a2, ...)
{
  return [a1 page];
}

id objc_msgSend_parameters(void *a1, const char *a2, ...)
{
  return [a1 parameters];
}

id objc_msgSend_parent(void *a1, const char *a2, ...)
{
  return [a1 parent];
}

id objc_msgSend_parentContainer(void *a1, const char *a2, ...)
{
  return [a1 parentContainer];
}

id objc_msgSend_parentDocument(void *a1, const char *a2, ...)
{
  return [a1 parentDocument];
}

id objc_msgSend_parentEffect(void *a1, const char *a2, ...)
{
  return [a1 parentEffect];
}

id objc_msgSend_parentHelper(void *a1, const char *a2, ...)
{
  return [a1 parentHelper];
}

id objc_msgSend_parentLayer(void *a1, const char *a2, ...)
{
  return [a1 parentLayer];
}

id objc_msgSend_parentMainDuration(void *a1, const char *a2, ...)
{
  return [a1 parentMainDuration];
}

id objc_msgSend_parentPhaseInDuration(void *a1, const char *a2, ...)
{
  return [a1 parentPhaseInDuration];
}

id objc_msgSend_parentPhaseOutDuration(void *a1, const char *a2, ...)
{
  return [a1 parentPhaseOutDuration];
}

id objc_msgSend_parentPlaylist(void *a1, const char *a2, ...)
{
  return [a1 parentPlaylist];
}

id objc_msgSend_parentSlide(void *a1, const char *a2, ...)
{
  return [a1 parentSlide];
}

id objc_msgSend_parentSubtitleEffect(void *a1, const char *a2, ...)
{
  return [a1 parentSubtitleEffect];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return [a1 pathComponents];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_pause(void *a1, const char *a2, ...)
{
  return [a1 pause];
}

id objc_msgSend_pauseMusic(void *a1, const char *a2, ...)
{
  return [a1 pauseMusic];
}

id objc_msgSend_pauseOnNextUpdate(void *a1, const char *a2, ...)
{
  return [a1 pauseOnNextUpdate];
}

id objc_msgSend_pauseSlideshow(void *a1, const char *a2, ...)
{
  return [a1 pauseSlideshow];
}

id objc_msgSend_persistentState(void *a1, const char *a2, ...)
{
  return [a1 persistentState];
}

id objc_msgSend_phase(void *a1, const char *a2, ...)
{
  return [a1 phase];
}

id objc_msgSend_phaseInDuration(void *a1, const char *a2, ...)
{
  return [a1 phaseInDuration];
}

id objc_msgSend_phaseOutDuration(void *a1, const char *a2, ...)
{
  return [a1 phaseOutDuration];
}

id objc_msgSend_pixelFormat(void *a1, const char *a2, ...)
{
  return [a1 pixelFormat];
}

id objc_msgSend_pixelSize(void *a1, const char *a2, ...)
{
  return [a1 pixelSize];
}

id objc_msgSend_play(void *a1, const char *a2, ...)
{
  return [a1 play];
}

id objc_msgSend_player(void *a1, const char *a2, ...)
{
  return [a1 player];
}

id objc_msgSend_playerHint(void *a1, const char *a2, ...)
{
  return [a1 playerHint];
}

id objc_msgSend_plug(void *a1, const char *a2, ...)
{
  return [a1 plug];
}

id objc_msgSend_plugAsHaven(void *a1, const char *a2, ...)
{
  return [a1 plugAsHaven];
}

id objc_msgSend_plugAsParallel(void *a1, const char *a2, ...)
{
  return [a1 plugAsParallel];
}

id objc_msgSend_plugAsSerial(void *a1, const char *a2, ...)
{
  return [a1 plugAsSerial];
}

id objc_msgSend_plugID(void *a1, const char *a2, ...)
{
  return [a1 plugID];
}

id objc_msgSend_plugin(void *a1, const char *a2, ...)
{
  return [a1 plugin];
}

id objc_msgSend_plugs(void *a1, const char *a2, ...)
{
  return [a1 plugs];
}

id objc_msgSend_point(void *a1, const char *a2, ...)
{
  return [a1 point];
}

id objc_msgSend_pointerValue(void *a1, const char *a2, ...)
{
  return [a1 pointerValue];
}

id objc_msgSend_poolInfo(void *a1, const char *a2, ...)
{
  return [a1 poolInfo];
}

id objc_msgSend_pooledClasses(void *a1, const char *a2, ...)
{
  return [a1 pooledClasses];
}

id objc_msgSend_position(void *a1, const char *a2, ...)
{
  return [a1 position];
}

id objc_msgSend_postControl(void *a1, const char *a2, ...)
{
  return [a1 postControl];
}

id objc_msgSend_posterTime(void *a1, const char *a2, ...)
{
  return [a1 posterTime];
}

id objc_msgSend_preControl(void *a1, const char *a2, ...)
{
  return [a1 preControl];
}

id objc_msgSend_preactivate(void *a1, const char *a2, ...)
{
  return [a1 preactivate];
}

id objc_msgSend_preactivatesWithParent(void *a1, const char *a2, ...)
{
  return [a1 preactivatesWithParent];
}

id objc_msgSend_predicate(void *a1, const char *a2, ...)
{
  return [a1 predicate];
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return [a1 preferredLanguages];
}

id objc_msgSend_preferredTransform(void *a1, const char *a2, ...)
{
  return [a1 preferredTransform];
}

id objc_msgSend_prefix(void *a1, const char *a2, ...)
{
  return [a1 prefix];
}

id objc_msgSend_preloadQueue(void *a1, const char *a2, ...)
{
  return [a1 preloadQueue];
}

id objc_msgSend_prepareMode(void *a1, const char *a2, ...)
{
  return [a1 prepareMode];
}

id objc_msgSend_presentation(void *a1, const char *a2, ...)
{
  return [a1 presentation];
}

id objc_msgSend_presentationViewController(void *a1, const char *a2, ...)
{
  return [a1 presentationViewController];
}

id objc_msgSend_presentationViewScale(void *a1, const char *a2, ...)
{
  return [a1 presentationViewScale];
}

id objc_msgSend_preservesAspectRatio(void *a1, const char *a2, ...)
{
  return [a1 preservesAspectRatio];
}

id objc_msgSend_presetID(void *a1, const char *a2, ...)
{
  return [a1 presetID];
}

id objc_msgSend_previousSlideID(void *a1, const char *a2, ...)
{
  return [a1 previousSlideID];
}

id objc_msgSend_previousSlideInfo(void *a1, const char *a2, ...)
{
  return [a1 previousSlideInfo];
}

id objc_msgSend_previousTransition(void *a1, const char *a2, ...)
{
  return [a1 previousTransition];
}

id objc_msgSend_prioritizedSlideClustersDictionary(void *a1, const char *a2, ...)
{
  return [a1 prioritizedSlideClustersDictionary];
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return [a1 priority];
}

id objc_msgSend_processAudioObjects(void *a1, const char *a2, ...)
{
  return [a1 processAudioObjects];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_processorCount(void *a1, const char *a2, ...)
{
  return [a1 processorCount];
}

id objc_msgSend_producerIdentifier(void *a1, const char *a2, ...)
{
  return [a1 producerIdentifier];
}

id objc_msgSend_program(void *a1, const char *a2, ...)
{
  return [a1 program];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return [a1 progress];
}

id objc_msgSend_projectionMatrix(void *a1, const char *a2, ...)
{
  return [a1 projectionMatrix];
}

id objc_msgSend_propertiesLock(void *a1, const char *a2, ...)
{
  return [a1 propertiesLock];
}

id objc_msgSend_proxyForSlide(void *a1, const char *a2, ...)
{
  return [a1 proxyForSlide];
}

id objc_msgSend_purge(void *a1, const char *a2, ...)
{
  return [a1 purge];
}

id objc_msgSend_purgeResources(void *a1, const char *a2, ...)
{
  return [a1 purgeResources];
}

id objc_msgSend_pzr(void *a1, const char *a2, ...)
{
  return [a1 pzr];
}

id objc_msgSend_queuePriority(void *a1, const char *a2, ...)
{
  return [a1 queuePriority];
}

id objc_msgSend_randomInt(void *a1, const char *a2, ...)
{
  return [a1 randomInt];
}

id objc_msgSend_rate(void *a1, const char *a2, ...)
{
  return [a1 rate];
}

id objc_msgSend_rating(void *a1, const char *a2, ...)
{
  return [a1 rating];
}

id objc_msgSend_recognize(void *a1, const char *a2, ...)
{
  return [a1 recognize];
}

id objc_msgSend_reconfigureLoopingMode(void *a1, const char *a2, ...)
{
  return [a1 reconfigureLoopingMode];
}

id objc_msgSend_reconfigureSlides(void *a1, const char *a2, ...)
{
  return [a1 reconfigureSlides];
}

id objc_msgSend_reconnectAll(void *a1, const char *a2, ...)
{
  return [a1 reconnectAll];
}

id objc_msgSend_reconnectAllTransitions(void *a1, const char *a2, ...)
{
  return [a1 reconnectAllTransitions];
}

id objc_msgSend_reconnectTransition(void *a1, const char *a2, ...)
{
  return [a1 reconnectTransition];
}

id objc_msgSend_recordsTime(void *a1, const char *a2, ...)
{
  return [a1 recordsTime];
}

id objc_msgSend_referenceCounter(void *a1, const char *a2, ...)
{
  return [a1 referenceCounter];
}

id objc_msgSend_referencingPlug(void *a1, const char *a2, ...)
{
  return [a1 referencingPlug];
}

id objc_msgSend_regionsOfInterest(void *a1, const char *a2, ...)
{
  return [a1 regionsOfInterest];
}

id objc_msgSend_relativeTime(void *a1, const char *a2, ...)
{
  return [a1 relativeTime];
}

id objc_msgSend_releaseByUser(void *a1, const char *a2, ...)
{
  return [a1 releaseByUser];
}

id objc_msgSend_releaseResources(void *a1, const char *a2, ...)
{
  return [a1 releaseResources];
}

id objc_msgSend_reloadBundles(void *a1, const char *a2, ...)
{
  return [a1 reloadBundles];
}

id objc_msgSend_removeAllAnimations(void *a1, const char *a2, ...)
{
  return [a1 removeAllAnimations];
}

id objc_msgSend_removeAllEffectContainers(void *a1, const char *a2, ...)
{
  return [a1 removeAllEffectContainers];
}

id objc_msgSend_removeAllEffects(void *a1, const char *a2, ...)
{
  return [a1 removeAllEffects];
}

id objc_msgSend_removeAllFilters(void *a1, const char *a2, ...)
{
  return [a1 removeAllFilters];
}

id objc_msgSend_removeAllIndexes(void *a1, const char *a2, ...)
{
  return [a1 removeAllIndexes];
}

id objc_msgSend_removeAllLayers(void *a1, const char *a2, ...)
{
  return [a1 removeAllLayers];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeAllSecondarySlides(void *a1, const char *a2, ...)
{
  return [a1 removeAllSecondarySlides];
}

id objc_msgSend_removeAllSingleSlideClusters(void *a1, const char *a2, ...)
{
  return [a1 removeAllSingleSlideClusters];
}

id objc_msgSend_removeAllSlides(void *a1, const char *a2, ...)
{
  return [a1 removeAllSlides];
}

id objc_msgSend_removeAllSongs(void *a1, const char *a2, ...)
{
  return [a1 removeAllSongs];
}

id objc_msgSend_removeAllTexts(void *a1, const char *a2, ...)
{
  return [a1 removeAllTexts];
}

id objc_msgSend_removeAllTouches(void *a1, const char *a2, ...)
{
  return [a1 removeAllTouches];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_removeImages(void *a1, const char *a2, ...)
{
  return [a1 removeImages];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return [a1 removeLastObject];
}

id objc_msgSend_removingFromCollection(void *a1, const char *a2, ...)
{
  return [a1 removingFromCollection];
}

id objc_msgSend_renderDispatchQueue(void *a1, const char *a2, ...)
{
  return [a1 renderDispatchQueue];
}

id objc_msgSend_renderer(void *a1, const char *a2, ...)
{
  return [a1 renderer];
}

id objc_msgSend_renderingDelegate(void *a1, const char *a2, ...)
{
  return [a1 renderingDelegate];
}

id objc_msgSend_renderingState(void *a1, const char *a2, ...)
{
  return [a1 renderingState];
}

id objc_msgSend_requestRenderingOnChanges(void *a1, const char *a2, ...)
{
  return [a1 requestRenderingOnChanges];
}

id objc_msgSend_requiredTouchCount(void *a1, const char *a2, ...)
{
  return [a1 requiredTouchCount];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_resetAllUsageCounters(void *a1, const char *a2, ...)
{
  return [a1 resetAllUsageCounters];
}

id objc_msgSend_resetAllVariables(void *a1, const char *a2, ...)
{
  return [a1 resetAllVariables];
}

id objc_msgSend_resetCachedTimes(void *a1, const char *a2, ...)
{
  return [a1 resetCachedTimes];
}

id objc_msgSend_resetDuration(void *a1, const char *a2, ...)
{
  return [a1 resetDuration];
}

id objc_msgSend_resetFadeInAndOut(void *a1, const char *a2, ...)
{
  return [a1 resetFadeInAndOut];
}

id objc_msgSend_resetStartTimes(void *a1, const char *a2, ...)
{
  return [a1 resetStartTimes];
}

id objc_msgSend_resetsTimeOnTrigger(void *a1, const char *a2, ...)
{
  return [a1 resetsTimeOnTrigger];
}

id objc_msgSend_resignReady(void *a1, const char *a2, ...)
{
  return [a1 resignReady];
}

id objc_msgSend_resolution(void *a1, const char *a2, ...)
{
  return [a1 resolution];
}

id objc_msgSend_resolutionIfEmbeddedAsset(void *a1, const char *a2, ...)
{
  return [a1 resolutionIfEmbeddedAsset];
}

id objc_msgSend_resolvedTarget(void *a1, const char *a2, ...)
{
  return [a1 resolvedTarget];
}

id objc_msgSend_resourcePath(void *a1, const char *a2, ...)
{
  return [a1 resourcePath];
}

id objc_msgSend_resourceURL(void *a1, const char *a2, ...)
{
  return [a1 resourceURL];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_resumeMusic(void *a1, const char *a2, ...)
{
  return [a1 resumeMusic];
}

id objc_msgSend_resumeOnNextUpdate(void *a1, const char *a2, ...)
{
  return [a1 resumeOnNextUpdate];
}

id objc_msgSend_resumeSlideshow(void *a1, const char *a2, ...)
{
  return [a1 resumeSlideshow];
}

id objc_msgSend_resyncAudioItem(void *a1, const char *a2, ...)
{
  return [a1 resyncAudioItem];
}

id objc_msgSend_resyncToSerializer(void *a1, const char *a2, ...)
{
  return [a1 resyncToSerializer];
}

id objc_msgSend_retainByUser(void *a1, const char *a2, ...)
{
  return [a1 retainByUser];
}

id objc_msgSend_retainCount(void *a1, const char *a2, ...)
{
  return [a1 retainCount];
}

id objc_msgSend_retainedByUserBlackImage(void *a1, const char *a2, ...)
{
  return [a1 retainedByUserBlackImage];
}

id objc_msgSend_retainedByUserCurrentImage(void *a1, const char *a2, ...)
{
  return [a1 retainedByUserCurrentImage];
}

id objc_msgSend_retainedByUserImage(void *a1, const char *a2, ...)
{
  return [a1 retainedByUserImage];
}

id objc_msgSend_retainedContext(void *a1, const char *a2, ...)
{
  return [a1 retainedContext];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 reverseObjectEnumerator];
}

id objc_msgSend_rootMediaFeeder(void *a1, const char *a2, ...)
{
  return [a1 rootMediaFeeder];
}

id objc_msgSend_rootPlug(void *a1, const char *a2, ...)
{
  return [a1 rootPlug];
}

id objc_msgSend_rotation(void *a1, const char *a2, ...)
{
  return [a1 rotation];
}

id objc_msgSend_rotationAngle(void *a1, const char *a2, ...)
{
  return [a1 rotationAngle];
}

id objc_msgSend_roundMinuteToNearstFifteen(void *a1, const char *a2, ...)
{
  return [a1 roundMinuteToNearstFifteen];
}

id objc_msgSend_roundMinuteToNearstFive(void *a1, const char *a2, ...)
{
  return [a1 roundMinuteToNearstFive];
}

id objc_msgSend_roundedFifteenMinuteOfYearClusters(void *a1, const char *a2, ...)
{
  return [a1 roundedFifteenMinuteOfYearClusters];
}

id objc_msgSend_roundedFiveMinuteOfYearClusters(void *a1, const char *a2, ...)
{
  return [a1 roundedFiveMinuteOfYearClusters];
}

id objc_msgSend_scalar(void *a1, const char *a2, ...)
{
  return [a1 scalar];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_scaleMainDuration(void *a1, const char *a2, ...)
{
  return [a1 scaleMainDuration];
}

id objc_msgSend_scheduleForDestruction(void *a1, const char *a2, ...)
{
  return [a1 scheduleForDestruction];
}

id objc_msgSend_score(void *a1, const char *a2, ...)
{
  return [a1 score];
}

id objc_msgSend_screen(void *a1, const char *a2, ...)
{
  return [a1 screen];
}

id objc_msgSend_seal(void *a1, const char *a2, ...)
{
  return [a1 seal];
}

id objc_msgSend_secondarySlides(void *a1, const char *a2, ...)
{
  return [a1 secondarySlides];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return [a1 section];
}

id objc_msgSend_selfIsPaused(void *a1, const char *a2, ...)
{
  return [a1 selfIsPaused];
}

id objc_msgSend_sendLiveNotification(void *a1, const char *a2, ...)
{
  return [a1 sendLiveNotification];
}

id objc_msgSend_sender(void *a1, const char *a2, ...)
{
  return [a1 sender];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setDefaults(void *a1, const char *a2, ...)
{
  return [a1 setDefaults];
}

id objc_msgSend_setupDocumentLayerGroup(void *a1, const char *a2, ...)
{
  return [a1 setupDocumentLayerGroup];
}

id objc_msgSend_setupLayerGroups(void *a1, const char *a2, ...)
{
  return [a1 setupLayerGroups];
}

id objc_msgSend_shader(void *a1, const char *a2, ...)
{
  return [a1 shader];
}

id objc_msgSend_shaderArguments(void *a1, const char *a2, ...)
{
  return [a1 shaderArguments];
}

id objc_msgSend_shaderID(void *a1, const char *a2, ...)
{
  return [a1 shaderID];
}

id objc_msgSend_shaderIsSet(void *a1, const char *a2, ...)
{
  return [a1 shaderIsSet];
}

id objc_msgSend_shadowOffset(void *a1, const char *a2, ...)
{
  return [a1 shadowOffset];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedController(void *a1, const char *a2, ...)
{
  return [a1 sharedController];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_sharegroup(void *a1, const char *a2, ...)
{
  return [a1 sharegroup];
}

id objc_msgSend_shouldBeParallelizer(void *a1, const char *a2, ...)
{
  return [a1 shouldBeParallelizer];
}

id objc_msgSend_shouldBePlaying(void *a1, const char *a2, ...)
{
  return [a1 shouldBePlaying];
}

id objc_msgSend_showDisplayStartTime(void *a1, const char *a2, ...)
{
  return [a1 showDisplayStartTime];
}

id objc_msgSend_showDisplayTime(void *a1, const char *a2, ...)
{
  return [a1 showDisplayTime];
}

id objc_msgSend_showDuration(void *a1, const char *a2, ...)
{
  return [a1 showDuration];
}

id objc_msgSend_showTime(void *a1, const char *a2, ...)
{
  return [a1 showTime];
}

id objc_msgSend_showTimeScript(void *a1, const char *a2, ...)
{
  return [a1 showTimeScript];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sizeOfContext(void *a1, const char *a2, ...)
{
  return [a1 sizeOfContext];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_sizingMode(void *a1, const char *a2, ...)
{
  return [a1 sizingMode];
}

id objc_msgSend_skinFriction(void *a1, const char *a2, ...)
{
  return [a1 skinFriction];
}

id objc_msgSend_skipsAnimations(void *a1, const char *a2, ...)
{
  return [a1 skipsAnimations];
}

id objc_msgSend_slide(void *a1, const char *a2, ...)
{
  return [a1 slide];
}

id objc_msgSend_slideCenterAtStart(void *a1, const char *a2, ...)
{
  return [a1 slideCenterAtStart];
}

id objc_msgSend_slideCount(void *a1, const char *a2, ...)
{
  return [a1 slideCount];
}

id objc_msgSend_slideID(void *a1, const char *a2, ...)
{
  return [a1 slideID];
}

id objc_msgSend_slideInfo(void *a1, const char *a2, ...)
{
  return [a1 slideInfo];
}

id objc_msgSend_slideInformation(void *a1, const char *a2, ...)
{
  return [a1 slideInformation];
}

id objc_msgSend_slideInfosForCurrentElements(void *a1, const char *a2, ...)
{
  return [a1 slideInfosForCurrentElements];
}

id objc_msgSend_slideProvidersForElementIDs(void *a1, const char *a2, ...)
{
  return [a1 slideProvidersForElementIDs];
}

id objc_msgSend_slideRotationAtStart(void *a1, const char *a2, ...)
{
  return [a1 slideRotationAtStart];
}

id objc_msgSend_slideScaleAtStart(void *a1, const char *a2, ...)
{
  return [a1 slideScaleAtStart];
}

id objc_msgSend_slides(void *a1, const char *a2, ...)
{
  return [a1 slides];
}

id objc_msgSend_slideshowIsPlaying(void *a1, const char *a2, ...)
{
  return [a1 slideshowIsPlaying];
}

id objc_msgSend_slideshowShouldWrap(void *a1, const char *a2, ...)
{
  return [a1 slideshowShouldWrap];
}

id objc_msgSend_snapshot(void *a1, const char *a2, ...)
{
  return [a1 snapshot];
}

id objc_msgSend_song(void *a1, const char *a2, ...)
{
  return [a1 song];
}

id objc_msgSend_songs(void *a1, const char *a2, ...)
{
  return [a1 songs];
}

id objc_msgSend_sourceLayer(void *a1, const char *a2, ...)
{
  return [a1 sourceLayer];
}

id objc_msgSend_specialRelease(void *a1, const char *a2, ...)
{
  return [a1 specialRelease];
}

id objc_msgSend_specialRetain(void *a1, const char *a2, ...)
{
  return [a1 specialRetain];
}

id objc_msgSend_specificObject(void *a1, const char *a2, ...)
{
  return [a1 specificObject];
}

id objc_msgSend_spline(void *a1, const char *a2, ...)
{
  return [a1 spline];
}

id objc_msgSend_stampTime(void *a1, const char *a2, ...)
{
  return [a1 stampTime];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startFrame(void *a1, const char *a2, ...)
{
  return [a1 startFrame];
}

id objc_msgSend_startLogging(void *a1, const char *a2, ...)
{
  return [a1 startLogging];
}

id objc_msgSend_startPlug(void *a1, const char *a2, ...)
{
  return [a1 startPlug];
}

id objc_msgSend_startPlugID(void *a1, const char *a2, ...)
{
  return [a1 startPlugID];
}

id objc_msgSend_startReading(void *a1, const char *a2, ...)
{
  return [a1 startReading];
}

id objc_msgSend_startTime(void *a1, const char *a2, ...)
{
  return [a1 startTime];
}

id objc_msgSend_startTimeIsDefined(void *a1, const char *a2, ...)
{
  return [a1 startTimeIsDefined];
}

id objc_msgSend_startsPaused(void *a1, const char *a2, ...)
{
  return [a1 startsPaused];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stateKey(void *a1, const char *a2, ...)
{
  return [a1 stateKey];
}

id objc_msgSend_states(void *a1, const char *a2, ...)
{
  return [a1 states];
}

id objc_msgSend_staticFriction(void *a1, const char *a2, ...)
{
  return [a1 staticFriction];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_statusBarOrientation(void *a1, const char *a2, ...)
{
  return [a1 statusBarOrientation];
}

id objc_msgSend_stillTime(void *a1, const char *a2, ...)
{
  return [a1 stillTime];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_stopTime(void *a1, const char *a2, ...)
{
  return [a1 stopTime];
}

id objc_msgSend_storedCalendar(void *a1, const char *a2, ...)
{
  return [a1 storedCalendar];
}

id objc_msgSend_storedFormatter(void *a1, const char *a2, ...)
{
  return [a1 storedFormatter];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stringAttributes(void *a1, const char *a2, ...)
{
  return [a1 stringAttributes];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingPathExtension];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_stringWithNewUUID(void *a1, const char *a2, ...)
{
  return [a1 stringWithNewUUID];
}

id objc_msgSend_styleID(void *a1, const char *a2, ...)
{
  return [a1 styleID];
}

id objc_msgSend_sublayers(void *a1, const char *a2, ...)
{
  return [a1 sublayers];
}

id objc_msgSend_supercontainer(void *a1, const char *a2, ...)
{
  return [a1 supercontainer];
}

id objc_msgSend_superlayer(void *a1, const char *a2, ...)
{
  return [a1 superlayer];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return [a1 superview];
}

id objc_msgSend_supportedResolutions(void *a1, const char *a2, ...)
{
  return [a1 supportedResolutions];
}

id objc_msgSend_supportsChapters(void *a1, const char *a2, ...)
{
  return [a1 supportsChapters];
}

id objc_msgSend_supportsDirectionOverride(void *a1, const char *a2, ...)
{
  return [a1 supportsDirectionOverride];
}

id objc_msgSend_supportsDynamicExpansion(void *a1, const char *a2, ...)
{
  return [a1 supportsDynamicExpansion];
}

id objc_msgSend_supportsEffectTiming(void *a1, const char *a2, ...)
{
  return [a1 supportsEffectTiming];
}

id objc_msgSend_suspended(void *a1, const char *a2, ...)
{
  return [a1 suspended];
}

id objc_msgSend_synchronizeTime(void *a1, const char *a2, ...)
{
  return [a1 synchronizeTime];
}

id objc_msgSend_tapCount(void *a1, const char *a2, ...)
{
  return [a1 tapCount];
}

id objc_msgSend_targetObject(void *a1, const char *a2, ...)
{
  return [a1 targetObject];
}

id objc_msgSend_targetObjectID(void *a1, const char *a2, ...)
{
  return [a1 targetObjectID];
}

id objc_msgSend_targetTimestamp(void *a1, const char *a2, ...)
{
  return [a1 targetTimestamp];
}

id objc_msgSend_temporaryUniforms(void *a1, const char *a2, ...)
{
  return [a1 temporaryUniforms];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_textCount(void *a1, const char *a2, ...)
{
  return [a1 textCount];
}

id objc_msgSend_texts(void *a1, const char *a2, ...)
{
  return [a1 texts];
}

id objc_msgSend_textsForElementIDs(void *a1, const char *a2, ...)
{
  return [a1 textsForElementIDs];
}

id objc_msgSend_texture(void *a1, const char *a2, ...)
{
  return [a1 texture];
}

id objc_msgSend_texture0ClampsToBorder(void *a1, const char *a2, ...)
{
  return [a1 texture0ClampsToBorder];
}

id objc_msgSend_texture1ClampsToBorder(void *a1, const char *a2, ...)
{
  return [a1 texture1ClampsToBorder];
}

id objc_msgSend_textureName(void *a1, const char *a2, ...)
{
  return [a1 textureName];
}

id objc_msgSend_textureOptions(void *a1, const char *a2, ...)
{
  return [a1 textureOptions];
}

id objc_msgSend_textureTarget(void *a1, const char *a2, ...)
{
  return [a1 textureTarget];
}

id objc_msgSend_textureUnitsAreBound(void *a1, const char *a2, ...)
{
  return [a1 textureUnitsAreBound];
}

id objc_msgSend_thumbnail(void *a1, const char *a2, ...)
{
  return [a1 thumbnail];
}

id objc_msgSend_thumbnailIsOK(void *a1, const char *a2, ...)
{
  return [a1 thumbnailIsOK];
}

id objc_msgSend_thumbnailPolicy(void *a1, const char *a2, ...)
{
  return [a1 thumbnailPolicy];
}

id objc_msgSend_time(void *a1, const char *a2, ...)
{
  return [a1 time];
}

id objc_msgSend_timeFirstAtRestValue(void *a1, const char *a2, ...)
{
  return [a1 timeFirstAtRestValue];
}

id objc_msgSend_timeIn(void *a1, const char *a2, ...)
{
  return [a1 timeIn];
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

id objc_msgSend_timeOffset(void *a1, const char *a2, ...)
{
  return [a1 timeOffset];
}

id objc_msgSend_timeOffsetKind(void *a1, const char *a2, ...)
{
  return [a1 timeOffsetKind];
}

id objc_msgSend_timeQuantum(void *a1, const char *a2, ...)
{
  return [a1 timeQuantum];
}

id objc_msgSend_timeWasSet(void *a1, const char *a2, ...)
{
  return [a1 timeWasSet];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_titleEffect(void *a1, const char *a2, ...)
{
  return [a1 titleEffect];
}

id objc_msgSend_toObject(void *a1, const char *a2, ...)
{
  return [a1 toObject];
}

id objc_msgSend_touches(void *a1, const char *a2, ...)
{
  return [a1 touches];
}

id objc_msgSend_tracks(void *a1, const char *a2, ...)
{
  return [a1 tracks];
}

id objc_msgSend_tracksInParent(void *a1, const char *a2, ...)
{
  return [a1 tracksInParent];
}

id objc_msgSend_transform(void *a1, const char *a2, ...)
{
  return [a1 transform];
}

id objc_msgSend_transition(void *a1, const char *a2, ...)
{
  return [a1 transition];
}

id objc_msgSend_transitionAttributes(void *a1, const char *a2, ...)
{
  return [a1 transitionAttributes];
}

id objc_msgSend_transitionDestinationPlugID(void *a1, const char *a2, ...)
{
  return [a1 transitionDestinationPlugID];
}

id objc_msgSend_transitionDuration(void *a1, const char *a2, ...)
{
  return [a1 transitionDuration];
}

id objc_msgSend_transitionID(void *a1, const char *a2, ...)
{
  return [a1 transitionID];
}

id objc_msgSend_transitionLayerPlugObjectID(void *a1, const char *a2, ...)
{
  return [a1 transitionLayerPlugObjectID];
}

id objc_msgSend_transitionPresetID(void *a1, const char *a2, ...)
{
  return [a1 transitionPresetID];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_typicalSlideBatchSize(void *a1, const char *a2, ...)
{
  return [a1 typicalSlideBatchSize];
}

id objc_msgSend_undoManager(void *a1, const char *a2, ...)
{
  return [a1 undoManager];
}

id objc_msgSend_uniqueURL(void *a1, const char *a2, ...)
{
  return [a1 uniqueURL];
}

id objc_msgSend_unload(void *a1, const char *a2, ...)
{
  return [a1 unload];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_unsetColorsPointer(void *a1, const char *a2, ...)
{
  return [a1 unsetColorsPointer];
}

id objc_msgSend_unsetInSpriteCoordinatesPointer(void *a1, const char *a2, ...)
{
  return [a1 unsetInSpriteCoordinatesPointer];
}

id objc_msgSend_unsetShader(void *a1, const char *a2, ...)
{
  return [a1 unsetShader];
}

id objc_msgSend_unsetVertexPointer(void *a1, const char *a2, ...)
{
  return [a1 unsetVertexPointer];
}

id objc_msgSend_unsignedCharValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedCharValue];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_updateClusterRatings(void *a1, const char *a2, ...)
{
  return [a1 updateClusterRatings];
}

id objc_msgSend_updateFramebuffer(void *a1, const char *a2, ...)
{
  return [a1 updateFramebuffer];
}

id objc_msgSend_updateGLContext(void *a1, const char *a2, ...)
{
  return [a1 updateGLContext];
}

id objc_msgSend_updateGeometry(void *a1, const char *a2, ...)
{
  return [a1 updateGeometry];
}

id objc_msgSend_updateInSpriteCoordinates(void *a1, const char *a2, ...)
{
  return [a1 updateInSpriteCoordinates];
}

id objc_msgSend_updateMainDuration(void *a1, const char *a2, ...)
{
  return [a1 updateMainDuration];
}

id objc_msgSend_updateRatingsForDayOfYearClusters(void *a1, const char *a2, ...)
{
  return [a1 updateRatingsForDayOfYearClusters];
}

id objc_msgSend_updateRatingsForHourOfYearClusters(void *a1, const char *a2, ...)
{
  return [a1 updateRatingsForHourOfYearClusters];
}

id objc_msgSend_updateRatingsForKeywordClusters(void *a1, const char *a2, ...)
{
  return [a1 updateRatingsForKeywordClusters];
}

id objc_msgSend_updateRatingsForMinuteOfYearClusters(void *a1, const char *a2, ...)
{
  return [a1 updateRatingsForMinuteOfYearClusters];
}

id objc_msgSend_updateRatingsForMonthClusters(void *a1, const char *a2, ...)
{
  return [a1 updateRatingsForMonthClusters];
}

id objc_msgSend_updateRatingsForMonthOfYearClusters(void *a1, const char *a2, ...)
{
  return [a1 updateRatingsForMonthOfYearClusters];
}

id objc_msgSend_updateRatingsForRoundedFifteenMinuteOfYearClusters(void *a1, const char *a2, ...)
{
  return [a1 updateRatingsForRoundedFifteenMinuteOfYearClusters];
}

id objc_msgSend_updateRatingsForRoundedFiveMinuteOfYearClusters(void *a1, const char *a2, ...)
{
  return [a1 updateRatingsForRoundedFiveMinuteOfYearClusters];
}

id objc_msgSend_updateRatingsForYearClusters(void *a1, const char *a2, ...)
{
  return [a1 updateRatingsForYearClusters];
}

id objc_msgSend_updateShadowPath(void *a1, const char *a2, ...)
{
  return [a1 updateShadowPath];
}

id objc_msgSend_updateSizes(void *a1, const char *a2, ...)
{
  return [a1 updateSizes];
}

id objc_msgSend_updateTiming(void *a1, const char *a2, ...)
{
  return [a1 updateTiming];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}

id objc_msgSend_usableSlideClusters(void *a1, const char *a2, ...)
{
  return [a1 usableSlideClusters];
}

id objc_msgSend_usageCountDescription(void *a1, const char *a2, ...)
{
  return [a1 usageCountDescription];
}

id objc_msgSend_useContext(void *a1, const char *a2, ...)
{
  return [a1 useContext];
}

id objc_msgSend_usedAllPaths(void *a1, const char *a2, ...)
{
  return [a1 usedAllPaths];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_userProvidedClusters(void *a1, const char *a2, ...)
{
  return [a1 userProvidedClusters];
}

id objc_msgSend_usesBackgroundColorAsBorderColor(void *a1, const char *a2, ...)
{
  return [a1 usesBackgroundColorAsBorderColor];
}

id objc_msgSend_usesMipmap(void *a1, const char *a2, ...)
{
  return [a1 usesMipmap];
}

id objc_msgSend_usesPowerOfTwo(void *a1, const char *a2, ...)
{
  return [a1 usesPowerOfTwo];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_uuidSeed(void *a1, const char *a2, ...)
{
  return [a1 uuidSeed];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_values(void *a1, const char *a2, ...)
{
  return [a1 values];
}

id objc_msgSend_vector(void *a1, const char *a2, ...)
{
  return [a1 vector];
}

id objc_msgSend_vertexAttributes(void *a1, const char *a2, ...)
{
  return [a1 vertexAttributes];
}

id objc_msgSend_vertices(void *a1, const char *a2, ...)
{
  return [a1 vertices];
}

id objc_msgSend_videoDuration(void *a1, const char *a2, ...)
{
  return [a1 videoDuration];
}

id objc_msgSend_videoPaths(void *a1, const char *a2, ...)
{
  return [a1 videoPaths];
}

id objc_msgSend_volume(void *a1, const char *a2, ...)
{
  return [a1 volume];
}

id objc_msgSend_vram(void *a1, const char *a2, ...)
{
  return [a1 vram];
}

id objc_msgSend_waitUntilAllOperationsAreFinished(void *a1, const char *a2, ...)
{
  return [a1 waitUntilAllOperationsAreFinished];
}

id objc_msgSend_wantsMipmap(void *a1, const char *a2, ...)
{
  return [a1 wantsMipmap];
}

id objc_msgSend_wantsMonochromatic(void *a1, const char *a2, ...)
{
  return [a1 wantsMonochromatic];
}

id objc_msgSend_wantsPowerOfTwo(void *a1, const char *a2, ...)
{
  return [a1 wantsPowerOfTwo];
}

id objc_msgSend_warmupRenderer(void *a1, const char *a2, ...)
{
  return [a1 warmupRenderer];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceAndNewlineCharacterSet];
}

id objc_msgSend_width(void *a1, const char *a2, ...)
{
  return [a1 width];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}

id objc_msgSend_wrapS(void *a1, const char *a2, ...)
{
  return [a1 wrapS];
}

id objc_msgSend_wrapT(void *a1, const char *a2, ...)
{
  return [a1 wrapT];
}

id objc_msgSend_xPosition(void *a1, const char *a2, ...)
{
  return [a1 xPosition];
}

id objc_msgSend_xRotationAngle(void *a1, const char *a2, ...)
{
  return [a1 xRotationAngle];
}

id objc_msgSend_yPosition(void *a1, const char *a2, ...)
{
  return [a1 yPosition];
}

id objc_msgSend_yRotationAngle(void *a1, const char *a2, ...)
{
  return [a1 yRotationAngle];
}

id objc_msgSend_yearClusters(void *a1, const char *a2, ...)
{
  return [a1 yearClusters];
}

id objc_msgSend_zIndex(void *a1, const char *a2, ...)
{
  return [a1 zIndex];
}

id objc_msgSend_zOrderedPlugs(void *a1, const char *a2, ...)
{
  return [a1 zOrderedPlugs];
}

id objc_msgSend_zPosition(void *a1, const char *a2, ...)
{
  return [a1 zPosition];
}