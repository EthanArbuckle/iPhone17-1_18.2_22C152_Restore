void sub_3BC0(int a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  char **v7;
  int v8;
  char *v9;
  int *v10;
  char *v11;
  int *v12;
  void *v13;
  char **v14;
  size_t v15;
  int v16;
  int v17;

  v3 = a2;
  v4 = 0;
  v5 = 0;
  do
  {
    v6 = v3;
    if (a1 || !LOBYTE((&off_14A98)[v4 + 2])) {
      v7 = &(&off_14A98)[3 * v5 + 1];
    }
    else {
      v7 = (char **)((char *)&off_14A98 + 8 * v4 + 12);
    }
    v8 = *(_DWORD *)v7;
    v16 = 0;
    v17 = v8;
    v15 = 4;
    if (sysctlbyname((&off_14A98)[v4], &v16, &v15, 0, 0))
    {
      if (*__error() == 2) {
        goto LABEL_12;
      }
      v9 = (&off_14A98)[v4];
      v10 = __error();
      +[NSString stringWithFormat:@"Could not check for sysctl %s: %s", v9, strerror(*v10)];
      goto LABEL_11;
    }
    if (sysctlbyname((&off_14A98)[v4], &v16, &v15, &v17, 4uLL))
    {
      v11 = (&off_14A98)[v4];
      v12 = __error();
      +[NSString stringWithFormat:@"Could not write sysctl %s: %s", v11, strerror(*v12)];
      v13 = LABEL_11:;
      [v6 failWithReason:v13];

      goto LABEL_12;
    }
    v14 = &(&off_14A98)[v4];
    if (a1)
    {
      if (!*((unsigned char *)v14 + 16))
      {
        *((_DWORD *)&off_14A98 + 2 * v4 + 3) = v16;
        *((unsigned char *)v14 + 16) = 1;
      }
    }
    else
    {
      *((unsigned char *)v14 + 16) = 0;
    }
LABEL_12:

    ++v5;
    v4 += 3;
  }
  while (v4 != 15);
}

BOOL sub_3DA0(io_registry_entry_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (IOObjectConformsTo(a1, "AppleIntelFramebuffer"))
  {
    BOOL v6 = 1;
  }
  else
  {
    io_iterator_t iterator = 0;
    if (IORegistryEntryGetChildIterator(a1, "IOService", &iterator))
    {
      [v5 failWithReason:@"Could not query io registry for graphics"];
      BOOL v6 = 0;
    }
    else
    {
      uint64_t v7 = (a2 + 1);
      do
      {
        uint64_t v8 = IOIteratorNext(iterator);
        BOOL v6 = v8 != 0;
        if (!v8) {
          break;
        }
        io_object_t v9 = v8;
        int v10 = sub_3DA0(v8, v7, v5);
        IOObjectRelease(v9);
      }
      while (!v10);
      IOObjectRelease(iterator);
    }
  }

  return v6;
}

void sub_3EF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_439C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23,uint64_t a24,char a25)
{
  _Block_object_dispose(&a16, 8);
  if (__p)
  {
    a23 = (uint64_t)__p;
    operator delete(__p);
  }
  _Block_object_dispose(&a25, 8);
  sub_5D6C(v25);
  _Unwind_Resume(a1);
}

uint64_t sub_4420(uint64_t a1, uint64_t a2)
{
  return sub_5998(a1 + 48, a2 + 48);
}

void *sub_442C(uint64_t a1)
{
  return sub_5D6C((void *)(a1 + 48));
}

__n128 sub_4434(__n128 *a1, __n128 *a2)
{
  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  __n128 result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void sub_4458(uint64_t a1)
{
  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

void sub_4470(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v4 = sub_4580(a2, a3, *(void *)(*(void *)(a1 + 32) + 8) + 48, 1);
  if (v4)
  {
    int v5 = v4;
    BOOL v6 = *(void **)(*(void *)(a1 + 40) + 8);
    uint64_t v7 = (char *)v6[7];
    unint64_t v8 = v6[8];
    if ((unint64_t)v7 >= v8)
    {
      int v10 = (char *)v6[6];
      uint64_t v11 = (v7 - v10) >> 2;
      if ((unint64_t)(v11 + 1) >> 62) {
        sub_6CD4();
      }
      unint64_t v12 = v8 - (void)v10;
      unint64_t v13 = (uint64_t)(v8 - (void)v10) >> 1;
      if (v13 <= v11 + 1) {
        unint64_t v13 = v11 + 1;
      }
      if (v12 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v14 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v14 = v13;
      }
      if (v14)
      {
        v15 = (char *)sub_6D7C((uint64_t)(v6 + 8), v14);
        int v10 = (char *)v6[6];
        uint64_t v7 = (char *)v6[7];
      }
      else
      {
        v15 = 0;
      }
      v16 = &v15[4 * v11];
      v17 = &v15[4 * v14];
      *(_DWORD *)v16 = v5;
      io_object_t v9 = v16 + 4;
      while (v7 != v10)
      {
        int v18 = *((_DWORD *)v7 - 1);
        v7 -= 4;
        *((_DWORD *)v16 - 1) = v18;
        v16 -= 4;
      }
      v6[6] = v16;
      v6[7] = v9;
      v6[8] = v17;
      if (v10) {
        operator delete(v10);
      }
    }
    else
    {
      *(_DWORD *)uint64_t v7 = v4;
      io_object_t v9 = v7 + 4;
    }
    v6[7] = v9;
  }
}

uint64_t sub_4580(uint64_t a1, uint64_t a2, unint64_t a3, int a4)
{
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x4812000000;
  v36 = sub_5E20;
  v37 = sub_5E44;
  v38 = "";
  v40 = 0;
  uint64_t v41 = 0;
  __p = 0;
  CSSymbolOwnerForeachSegment();
  uint64_t v6 = v34[6];
  uint64_t v7 = v34[7];
  if (v6 == v7)
  {
    uint64_t v15 = 0;
  }
  else
  {
    unsigned int v8 = sub_8170((_DWORD *)a3, v6, (v7 - v6) >> 2);
    Name = (const char *)CSSymbolOwnerGetName();
    unsigned int v10 = sub_62F8(Name, (void *)a3);
    uint64_t Architecture = CSSymbolOwnerGetArchitecture();
    unsigned int v12 = 0;
    if (a4)
    {
      unsigned int v32 = 0;
      if (Architecture)
      {
        unint64_t v13 = CSSymbolOwnerGetArchitecture();
        unsigned int v32 = sub_6344(v13, a3);
        FamilyName = (const char *)CSArchitectureGetFamilyName();
        unsigned int v12 = sub_62F8(FamilyName, (void *)a3);
      }
    }
    else
    {
      unsigned int v32 = 0;
    }
    CFUUIDBytes = (const unsigned __int8 *)CSSymbolOwnerGetCFUUIDBytes();
    memset(out, 0, 37);
    uuid_unparse(CFUUIDBytes, out);
    size_t v17 = strlen(out);
    unsigned int v18 = sub_88B8((void *)a3, out, v17);
    Path = (const char *)CSSymbolOwnerGetPath();
    unsigned int v20 = sub_62F8(Path, (void *)a3);
    unsigned int v31 = v8;
    Version = (const char *)CSSymbolOwnerGetVersion();
    unsigned int v22 = sub_62F8(Version, (void *)a3);
    sub_65F8(a3);
    *(unsigned char *)(a3 + 70) = 1;
    int v23 = *(_DWORD *)(a3 + 32);
    int v24 = *(_DWORD *)(a3 + 48);
    int v25 = *(_DWORD *)(a3 + 40);
    sub_696C((_DWORD *)a3, 4, v18);
    sub_696C((_DWORD *)a3, 6, v20);
    if (a4)
    {
      sub_696C((_DWORD *)a3, 12, v32);
      sub_696C((_DWORD *)a3, 14, v12);
    }
    sub_696C((_DWORD *)a3, 16, v10);
    sub_696C((_DWORD *)a3, 22, v22);
    unsigned int v26 = sub_6AFC(a3, v23 - v24 + v25);
    sub_65F8(a3);
    *(unsigned char *)(a3 + 70) = 1;
    int v27 = *(_DWORD *)(a3 + 32);
    int v28 = *(_DWORD *)(a3 + 48);
    int v29 = *(_DWORD *)(a3 + 40);
    sub_87CC(a3, 4, 1, 0);
    sub_696C((_DWORD *)a3, 6, v26);
    sub_696C((_DWORD *)a3, 8, v31);
    sub_6624(a3, 10, 0, -1);
    uint64_t v15 = sub_6AFC(a3, v27 - v28 + v29);
  }
  _Block_object_dispose(&v33, 8);
  if (__p)
  {
    v40 = __p;
    operator delete(__p);
  }
  return v15;
}

void sub_48E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23)
{
  if (__p)
  {
    a23 = (uint64_t)__p;
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_493C(_DWORD *a1, uint64_t a2, uint64_t a3)
{
  sub_8098((uint64_t)a1, a3, 4uLL);
  if (a3)
  {
    uint64_t v6 = a2 - 4;
    uint64_t v7 = a3;
    do
    {
      uint64_t v8 = v7 - 1;
      int v9 = sub_6A50(a1, *(_DWORD *)(v6 + 4 * v7));
      sub_6AA4((uint64_t)a1, v9);
      uint64_t v7 = v8;
    }
    while (v8);
  }

  return sub_8104((uint64_t)a1, a3);
}

uint64_t sub_49C0(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 71)) {
    sub_D02C();
  }
  uint64_t result = *(void *)(a1 + 48);
  if (!result) {
    sub_D058();
  }
  return result;
}

void sub_4D00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,void *__p,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a17, 8);
  sub_B348(v38);
  _Block_object_dispose(&a28, 8);
  if (__p)
  {
    a35 = (uint64_t)__p;
    operator delete(__p);
  }
  _Block_object_dispose(&a37, 8);
  sub_5D6C(v37);
  _Unwind_Resume(a1);
}

__n128 sub_4D6C(__n128 *a1, __n128 *a2)
{
  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  __n128 result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void sub_4D90(uint64_t a1)
{
  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

uint64_t sub_4DA8(uint64_t a1, uint64_t a2)
{
  return sub_9CB8(a1 + 48, (uint64_t *)(a2 + 48));
}

uint64_t sub_4DB4(uint64_t a1)
{
  return sub_B348(a1 + 48);
}

void sub_4DBC(void *a1, uint64_t a2)
{
  *(void *)uu = 0;
  uint64_t v23 = 0;
  dyld_shared_cache_copy_uuid();
  memset(out, 0, 37);
  uuid_unparse(uu, out);
  sub_B294(__p, out);
  if (!sub_ACA8((void *)(*(void *)(a1[4] + 8) + 48), (unsigned __int8 *)__p))
  {
    int v4 = sub_4F98(a2, *(void *)(a1[5] + 8) + 48);
    int v5 = v4;
    if (v4)
    {
      uint64_t v6 = *(void **)(a1[6] + 8);
      uint64_t v7 = (char *)v6[7];
      unint64_t v8 = v6[8];
      if ((unint64_t)v7 >= v8)
      {
        unsigned int v10 = (char *)v6[6];
        uint64_t v11 = (v7 - v10) >> 2;
        if ((unint64_t)(v11 + 1) >> 62) {
          sub_6CD4();
        }
        unint64_t v12 = v8 - (void)v10;
        unint64_t v13 = (uint64_t)(v8 - (void)v10) >> 1;
        if (v13 <= v11 + 1) {
          unint64_t v13 = v11 + 1;
        }
        if (v12 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v14 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v14 = v13;
        }
        if (v14)
        {
          uint64_t v15 = (char *)sub_6D7C((uint64_t)(v6 + 8), v14);
          unsigned int v10 = (char *)v6[6];
          uint64_t v7 = (char *)v6[7];
        }
        else
        {
          uint64_t v15 = 0;
        }
        v16 = &v15[4 * v11];
        size_t v17 = &v15[4 * v14];
        *(_DWORD *)v16 = v5;
        int v9 = v16 + 4;
        while (v7 != v10)
        {
          int v18 = *((_DWORD *)v7 - 1);
          v7 -= 4;
          *((_DWORD *)v16 - 1) = v18;
          v16 -= 4;
        }
        v6[6] = v16;
        v6[7] = v9;
        v6[8] = v17;
        if (v10) {
          operator delete(v10);
        }
      }
      else
      {
        *(_DWORD *)uint64_t v7 = v4;
        int v9 = v7 + 4;
      }
      v6[7] = v9;
      sub_B3D0(*(void *)(a1[4] + 8) + 48, (unsigned __int8 *)__p, (uint64_t)__p);
    }
  }
  if (v20 < 0) {
    operator delete(__p[0]);
  }
}

void sub_4F70(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_4F98(uint64_t a1, unint64_t a2)
{
  *(void *)uu = 0;
  uint64_t v29 = 0;
  dyld_shared_cache_copy_uuid();
  memset(out, 0, 37);
  uuid_unparse(uu, out);
  uint64_t base_address = dyld_shared_cache_get_base_address();
  size_t v4 = strlen(out);
  unsigned int v5 = sub_89AC(a2, out, v4);
  sub_65F8(a2);
  *(unsigned char *)(a2 + 70) = 1;
  int v6 = *(_DWORD *)(a2 + 32);
  int v7 = *(_DWORD *)(a2 + 48);
  int v8 = *(_DWORD *)(a2 + 40);
  sub_696C((_DWORD *)a2, 4, v5);
  sub_6624(a2, 20, base_address, -1);
  unsigned int v9 = sub_6AFC(a2, v6 - v7 + v8);
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x4812000000;
  v21 = sub_4434;
  unsigned int v22 = sub_4458;
  uint64_t v23 = "";
  int v25 = 0;
  uint64_t v26 = 0;
  __p = 0;
  dyld_shared_cache_for_each_image();
  uint64_t v10 = v19[7] - v19[6];
  if (v10) {
    uint64_t v11 = (void *)v19[6];
  }
  else {
    uint64_t v11 = &flatbuffers::data<flatbuffers::Offset<FlatbufferSymbols::SymbolOwner>,std::allocator<flatbuffers::Offset<FlatbufferSymbols::SymbolOwner>>>(std::vector<flatbuffers::Offset<FlatbufferSymbols::SymbolOwner>> const&)::t;
  }
  unsigned int v12 = sub_493C((_DWORD *)a2, (uint64_t)v11, v10 >> 2);
  sub_65F8(a2);
  *(unsigned char *)(a2 + 70) = 1;
  int v13 = *(_DWORD *)(a2 + 32);
  int v14 = *(_DWORD *)(a2 + 48);
  int v15 = *(_DWORD *)(a2 + 40);
  sub_87CC(a2, 4, 3, 0);
  sub_696C((_DWORD *)a2, 6, v9);
  sub_696C((_DWORD *)a2, 8, v12);
  uint64_t v16 = sub_6AFC(a2, v13 - v14 + v15);
  _Block_object_dispose(&v18, 8);
  if (__p)
  {
    int v25 = __p;
    operator delete(__p);
  }
  return v16;
}

void sub_51FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23)
{
  if (__p)
  {
    a23 = (uint64_t)__p;
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_54DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23,uint64_t a24,char a25)
{
  _Block_object_dispose(&a16, 8);
  if (__p)
  {
    a23 = (uint64_t)__p;
    operator delete(__p);
  }
  _Block_object_dispose(&a25, 8);
  sub_5D6C(v25);
  _Unwind_Resume(a1);
}

void sub_5534(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v4 = sub_5640(a2, a3, *(void *)(*(void *)(a1 + 32) + 8) + 48);
  if (v4)
  {
    int v5 = v4;
    int v6 = *(void **)(*(void *)(a1 + 40) + 8);
    int v7 = (char *)v6[7];
    unint64_t v8 = v6[8];
    if ((unint64_t)v7 >= v8)
    {
      uint64_t v10 = (char *)v6[6];
      uint64_t v11 = (v7 - v10) >> 2;
      if ((unint64_t)(v11 + 1) >> 62) {
        sub_6CD4();
      }
      unint64_t v12 = v8 - (void)v10;
      unint64_t v13 = (uint64_t)(v8 - (void)v10) >> 1;
      if (v13 <= v11 + 1) {
        unint64_t v13 = v11 + 1;
      }
      if (v12 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v14 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v14 = v13;
      }
      if (v14)
      {
        int v15 = (char *)sub_6D7C((uint64_t)(v6 + 8), v14);
        uint64_t v10 = (char *)v6[6];
        int v7 = (char *)v6[7];
      }
      else
      {
        int v15 = 0;
      }
      uint64_t v16 = &v15[4 * v11];
      size_t v17 = &v15[4 * v14];
      *(_DWORD *)uint64_t v16 = v5;
      unsigned int v9 = v16 + 4;
      while (v7 != v10)
      {
        int v18 = *((_DWORD *)v7 - 1);
        v7 -= 4;
        *((_DWORD *)v16 - 1) = v18;
        v16 -= 4;
      }
      v6[6] = v16;
      v6[7] = v9;
      v6[8] = v17;
      if (v10) {
        operator delete(v10);
      }
    }
    else
    {
      *(_DWORD *)int v7 = v4;
      unsigned int v9 = v7 + 4;
    }
    v6[7] = v9;
  }
}

uint64_t sub_5640(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t SharedCacheUUID = CSSymbolicatorGetSharedCacheUUID();
  if (!SharedCacheUUID) {
    return 0;
  }
  int v5 = (const unsigned __int8 *)SharedCacheUUID;
  unint64_t Architecture = CSSymbolicatorGetArchitecture();
  memset(dst, 0, sizeof(dst));
  uuid_copy(dst, v5);
  memset(out, 0, 37);
  uuid_unparse(dst, out);
  size_t v7 = strlen(out);
  unsigned int v8 = sub_89AC(a3, out, v7);
  LODWORD(v5) = sub_6344(Architecture, a3);
  FamilyName = (const char *)CSArchitectureGetFamilyName();
  size_t v10 = strlen(FamilyName);
  LODWORD(FamilyName) = sub_88B8((void *)a3, FamilyName, v10);
  sub_65F8(a3);
  *(unsigned char *)(a3 + 70) = 1;
  int v11 = *(_DWORD *)(a3 + 32);
  int v12 = *(_DWORD *)(a3 + 48);
  int v13 = *(_DWORD *)(a3 + 40);
  sub_696C((_DWORD *)a3, 4, v8);
  sub_696C((_DWORD *)a3, 12, v5);
  sub_696C((_DWORD *)a3, 14, FamilyName);
  unsigned int v14 = sub_6AFC(a3, v11 - v12 + v13);
  uint64_t v23 = 0;
  int v24 = &v23;
  uint64_t v25 = 0x4812000000;
  uint64_t v26 = sub_4434;
  int v27 = sub_4458;
  int v28 = "";
  v30 = 0;
  uint64_t v31 = 0;
  __p = 0;
  CSSymbolicatorForeachSymbolOwnerAtTime();
  uint64_t v15 = v24[7] - v24[6];
  if (v15) {
    uint64_t v16 = (void *)v24[6];
  }
  else {
    uint64_t v16 = &flatbuffers::data<flatbuffers::Offset<FlatbufferSymbols::SymbolOwner>,std::allocator<flatbuffers::Offset<FlatbufferSymbols::SymbolOwner>>>(std::vector<flatbuffers::Offset<FlatbufferSymbols::SymbolOwner>> const&)::t;
  }
  unsigned int v17 = sub_493C((_DWORD *)a3, (uint64_t)v16, v15 >> 2);
  sub_65F8(a3);
  *(unsigned char *)(a3 + 70) = 1;
  int v18 = *(_DWORD *)(a3 + 32);
  int v19 = *(_DWORD *)(a3 + 48);
  int v20 = *(_DWORD *)(a3 + 40);
  sub_87CC(a3, 4, 3, 0);
  sub_696C((_DWORD *)a3, 6, v14);
  sub_696C((_DWORD *)a3, 8, v17);
  uint64_t v21 = sub_6AFC(a3, v18 - v19 + v20);
  _Block_object_dispose(&v23, 8);
  if (__p)
  {
    v30 = __p;
    operator delete(__p);
  }
  return v21;
}

void sub_5914(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23)
{
  if (__p)
  {
    a23 = (uint64_t)__p;
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_5998(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 0;
  *(_OWORD *)(a1 + 16) = xmmword_E450;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 1;
  *(_WORD *)(a1 + 80) = 256;
  *(void *)(a1 + 88) = 0;
  sub_5A04(a1, a2);
  return a1;
}

void sub_59F0(_Unwind_Exception *a1)
{
  sub_5B20(v1);
  _Unwind_Resume(a1);
}

uint64_t *sub_5A04(uint64_t a1, uint64_t a2)
{
  __n128 result = sub_5AAC((uint64_t *)a1, (uint64_t *)a2);
  int v5 = *(_DWORD *)(a1 + 64);
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  *(_DWORD *)(a2 + 64) = v5;
  LOWORD(v5) = *(_WORD *)(a1 + 68);
  *(_WORD *)(a1 + 68) = *(_WORD *)(a2 + 68);
  *(_WORD *)(a2 + 68) = v5;
  LOBYTE(v5) = *(unsigned char *)(a1 + 70);
  *(unsigned char *)(a1 + 70) = *(unsigned char *)(a2 + 70);
  *(unsigned char *)(a2 + 70) = v5;
  LOBYTE(v5) = *(unsigned char *)(a1 + 71);
  *(unsigned char *)(a1 + 71) = *(unsigned char *)(a2 + 71);
  *(unsigned char *)(a2 + 71) = v5;
  uint64_t v6 = *(void *)(a1 + 72);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a2 + 72) = v6;
  LOBYTE(v6) = *(unsigned char *)(a1 + 80);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(unsigned char *)(a2 + 80) = v6;
  LOBYTE(v6) = *(unsigned char *)(a1 + 81);
  *(unsigned char *)(a1 + 81) = *(unsigned char *)(a2 + 81);
  *(unsigned char *)(a2 + 81) = v6;
  uint64_t v7 = *(void *)(a1 + 88);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a2 + 88) = v7;
  return result;
}

uint64_t *sub_5AAC(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *result;
  *__n128 result = *a2;
  *a2 = v2;
  LOBYTE(v2) = *((unsigned char *)result + 8);
  *((unsigned char *)result + 8) = *((unsigned char *)a2 + 8);
  *((unsigned char *)a2 + 8) = v2;
  uint64_t v3 = result[2];
  result[2] = a2[2];
  a2[2] = v3;
  uint64_t v4 = result[3];
  result[3] = a2[3];
  a2[3] = v4;
  uint64_t v5 = result[4];
  uint64_t v6 = result[5];
  uint64_t v7 = a2[5];
  result[4] = a2[4];
  result[5] = v7;
  a2[4] = v5;
  a2[5] = v6;
  uint64_t v8 = result[6];
  result[6] = a2[6];
  a2[6] = v8;
  uint64_t v9 = result[7];
  result[7] = a2[7];
  a2[7] = v9;
  return result;
}

void *sub_5B20(void *a1)
{
  if (*((unsigned char *)a1 + 8) && *a1) {
    (*(void (**)(void))(*(void *)*a1 + 8))(*a1);
  }
  *a1 = 0;
  *((unsigned char *)a1 + 8) = 0;
  return a1;
}

void *sub_5B88(void *result)
{
  v1 = result;
  if (result[5])
  {
    uint64_t v2 = *result;
    if (!*v1) {
      operator delete[]();
    }
    __n128 result = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v2 + 24))(v2);
  }
  v1[5] = 0;
  return result;
}

void sub_5C28(void *a1)
{
}

void sub_5C3C(uint64_t a1, uint64_t a2)
{
  if (a2) {
    operator delete[]();
  }
}

void sub_5C60()
{
}

void sub_5C74()
{
}

char *sub_5C8C(uint64_t a1, char *a2, unint64_t a3, unint64_t a4, size_t a5, size_t a6)
{
  if (a4 <= a3) {
    sub_D084();
  }
  int v12 = (char *)(*(uint64_t (**)(uint64_t, unint64_t))(*(void *)a1 + 16))(a1, a4);
  memcpy(&v12[a4 - a5], &a2[a3 - a5], a5);
  memcpy(v12, a2, a6);
  (*(void (**)(uint64_t, char *, unint64_t))(*(void *)a1 + 24))(a1, a2, a3);
  return v12;
}

void *sub_5D6C(void *a1)
{
  uint64_t v1 = a1[11];
  if (v1)
  {
    sub_5DCC(a1[11], *(void **)(v1 + 8));
    operator delete();
  }

  return sub_5B20(a1);
}

void sub_5DCC(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_5DCC(a1, *a2);
    sub_5DCC(a1, a2[1]);
    operator delete(a2);
  }
}

__n128 sub_5E20(__n128 *a1, __n128 *a2)
{
  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  __n128 result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void sub_5E44(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

void sub_5E5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v4 = sub_5F60(a2, a3, *(void *)(a1 + 40));
  if (v4)
  {
    int v5 = v4;
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 8);
    uint64_t v7 = (char *)v6[7];
    unint64_t v8 = v6[8];
    if ((unint64_t)v7 >= v8)
    {
      size_t v10 = (char *)v6[6];
      uint64_t v11 = (v7 - v10) >> 2;
      if ((unint64_t)(v11 + 1) >> 62) {
        sub_6CD4();
      }
      unint64_t v12 = v8 - (void)v10;
      unint64_t v13 = (uint64_t)(v8 - (void)v10) >> 1;
      if (v13 <= v11 + 1) {
        unint64_t v13 = v11 + 1;
      }
      if (v12 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v14 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v14 = v13;
      }
      if (v14)
      {
        uint64_t v15 = (char *)sub_6D7C((uint64_t)(v6 + 8), v14);
        size_t v10 = (char *)v6[6];
        uint64_t v7 = (char *)v6[7];
      }
      else
      {
        uint64_t v15 = 0;
      }
      uint64_t v16 = &v15[4 * v11];
      unsigned int v17 = &v15[4 * v14];
      *(_DWORD *)uint64_t v16 = v5;
      uint64_t v9 = v16 + 4;
      while (v7 != v10)
      {
        int v18 = *((_DWORD *)v7 - 1);
        v7 -= 4;
        *((_DWORD *)v16 - 1) = v18;
        v16 -= 4;
      }
      v6[6] = v16;
      v6[7] = v9;
      v6[8] = v17;
      if (v10) {
        operator delete(v10);
      }
    }
    else
    {
      *(_DWORD *)uint64_t v7 = v4;
      uint64_t v9 = v7 + 4;
    }
    v6[7] = v9;
  }
}

uint64_t sub_5F60(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x4812000000;
  v42 = sub_63D8;
  v43 = sub_63FC;
  v44 = "";
  v46 = 0;
  uint64_t v47 = 0;
  __p = 0;
  uint64_t v33 = _NSConcreteStackBlock;
  uint64_t v34 = 3221225472;
  uint64_t v35 = sub_6414;
  v36 = &unk_105A0;
  v37 = &v39;
  unint64_t v38 = a3;
  CSSegmentForeachSection();
  uint64_t v4 = v40[6];
  uint64_t v5 = v40[7];
  if (v4 == v5) {
    unsigned int v6 = 0;
  }
  else {
    unsigned int v6 = sub_6DE8((_DWORD *)a3, v4, (v5 - v4) >> 2);
  }
  Name = (char *)CSRegionGetName();
  if (Name)
  {
    sub_B294(v48, " SEGMENT");
    unsigned int v31 = v6;
    sub_B294(&v32, Name);
    int64_t size = HIBYTE(v32.__r_.__value_.__r.__words[2]);
    if ((v32.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v9 = &v32;
    }
    else {
      uint64_t v9 = (std::string *)v32.__r_.__value_.__r.__words[0];
    }
    unsigned __int8 v10 = v49;
    if ((v49 & 0x80u) == 0) {
      uint64_t v11 = v48;
    }
    else {
      uint64_t v11 = (void **)v48[0];
    }
    if ((v49 & 0x80u) == 0) {
      int64_t v12 = v49;
    }
    else {
      int64_t v12 = (int64_t)v48[1];
    }
    if (v12)
    {
      if ((v32.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        int64_t size = v32.__r_.__value_.__l.__size_;
      }
      if (size >= v12)
      {
        unint64_t v13 = (char *)v9 + size;
        int v14 = *(char *)v11;
        uint64_t v15 = v9;
        do
        {
          int64_t v16 = size - v12;
          if (v16 == -1) {
            break;
          }
          unsigned int v17 = (char *)memchr(v15, v14, v16 + 1);
          if (!v17) {
            break;
          }
          int v18 = v17;
          if (!memcmp(v17, v11, v12))
          {
            if (v18 != v13)
            {
              std::string::size_type v19 = v18 - (char *)v9;
              if (v18 - (char *)v9 != -1) {
                goto LABEL_26;
              }
            }
            break;
          }
          uint64_t v15 = (std::string *)(v18 + 1);
          int64_t size = v13 - (v18 + 1);
        }
        while (size >= v12);
      }
    }
    else
    {
      std::string::size_type v19 = 0;
LABEL_26:
      std::string::erase(&v32, v19, v12);
      unsigned __int8 v10 = v49;
    }
    if ((v10 & 0x80) != 0) {
      operator delete(v48[0]);
    }
    unsigned int v6 = v31;
  }
  else
  {
    sub_B294(&v32, (char *)&unk_E955);
  }
  if ((v32.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    int v20 = &v32;
  }
  else {
    int v20 = (std::string *)v32.__r_.__value_.__r.__words[0];
  }
  if ((v32.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v21 = HIBYTE(v32.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v21 = v32.__r_.__value_.__l.__size_;
  }
  unsigned int v22 = sub_88B8((void *)a3, v20, v21);
  uint64_t Range = CSRegionGetRange();
  uint64_t v25 = v24;
  sub_65F8(a3);
  *(unsigned char *)(a3 + 70) = 1;
  int v26 = *(_DWORD *)(a3 + 32);
  int v27 = *(_DWORD *)(a3 + 48);
  int v28 = *(_DWORD *)(a3 + 40);
  sub_6624(a3, 6, Range, -1);
  sub_6624(a3, 8, v25, 0);
  sub_696C((_DWORD *)a3, 4, v22);
  sub_696C((_DWORD *)a3, 22, v6);
  uint64_t v29 = sub_6AFC(a3, v26 - v27 + v28);
  if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v32.__r_.__value_.__l.__data_);
  }
  _Block_object_dispose(&v39, 8);
  if (__p)
  {
    v46 = __p;
    operator delete(__p);
  }
  return v29;
}

void sub_627C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29,uint64_t a30)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v30 - 89) < 0) {
    operator delete(*(void **)(v30 - 112));
  }
  _Block_object_dispose(&a23, 8);
  if (a29)
  {
    a30 = (uint64_t)a29;
    operator delete(a29);
  }
  _Unwind_Resume(a1);
}

const char *sub_62F8(const char *result, void *a2)
{
  if (result)
  {
    uint64_t v3 = result;
    size_t v4 = strlen(result);
    return (const char *)sub_88B8(a2, v3, v4);
  }
  return result;
}

uint64_t sub_6344(unint64_t a1, unint64_t a2)
{
  int v3 = a1;
  unint64_t v4 = HIDWORD(a1);
  sub_65F8(a2);
  *(unsigned char *)(a2 + 70) = 1;
  int v5 = *(_DWORD *)(a2 + 32) - *(_DWORD *)(a2 + 48) + *(_DWORD *)(a2 + 40);
  sub_69C0(a2, 6, v3, 0);
  sub_69C0(a2, 8, v4, 0);

  return sub_6AFC(a2, v5);
}

__n128 sub_63D8(__n128 *a1, __n128 *a2)
{
  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  __n128 result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void sub_63FC(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

void sub_6414(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v4 = sub_6518(a2, a3, *(void *)(a1 + 40));
  if (v4)
  {
    int v5 = v4;
    unsigned int v6 = *(void **)(*(void *)(a1 + 32) + 8);
    uint64_t v7 = (char *)v6[7];
    unint64_t v8 = v6[8];
    if ((unint64_t)v7 >= v8)
    {
      unsigned __int8 v10 = (char *)v6[6];
      uint64_t v11 = (v7 - v10) >> 2;
      if ((unint64_t)(v11 + 1) >> 62) {
        sub_6CD4();
      }
      unint64_t v12 = v8 - (void)v10;
      unint64_t v13 = (uint64_t)(v8 - (void)v10) >> 1;
      if (v13 <= v11 + 1) {
        unint64_t v13 = v11 + 1;
      }
      if (v12 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v14 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v14 = v13;
      }
      if (v14)
      {
        uint64_t v15 = (char *)sub_6D7C((uint64_t)(v6 + 8), v14);
        unsigned __int8 v10 = (char *)v6[6];
        uint64_t v7 = (char *)v6[7];
      }
      else
      {
        uint64_t v15 = 0;
      }
      int64_t v16 = &v15[4 * v11];
      unsigned int v17 = &v15[4 * v14];
      *(_DWORD *)int64_t v16 = v5;
      uint64_t v9 = v16 + 4;
      while (v7 != v10)
      {
        int v18 = *((_DWORD *)v7 - 1);
        v7 -= 4;
        *((_DWORD *)v16 - 1) = v18;
        v16 -= 4;
      }
      v6[6] = v16;
      v6[7] = v9;
      v6[8] = v17;
      if (v10) {
        operator delete(v10);
      }
    }
    else
    {
      *(_DWORD *)uint64_t v7 = v4;
      uint64_t v9 = v7 + 4;
    }
    v6[7] = v9;
  }
}

uint64_t sub_6518(uint64_t a1, uint64_t a2, unint64_t a3)
{
  Name = (const char *)CSRegionGetName();
  size_t v5 = strlen(Name);
  LODWORD(Name) = sub_88B8((void *)a3, Name, v5);
  uint64_t Range = CSRegionGetRange();
  uint64_t v8 = v7;
  sub_65F8(a3);
  *(unsigned char *)(a3 + 70) = 1;
  int v9 = *(_DWORD *)(a3 + 32) - *(_DWORD *)(a3 + 48) + *(_DWORD *)(a3 + 40);
  sub_6624(a3, 6, Range, -1);
  sub_6624(a3, 8, v8, 0);
  sub_696C((_DWORD *)a3, 4, Name);

  return sub_6AFC(a3, v9);
}

uint64_t sub_65F8(uint64_t result)
{
  if (*(unsigned char *)(result + 70)) {
    sub_D0DC();
  }
  if (*(_DWORD *)(result + 64)) {
    sub_D0B0();
  }
  return result;
}

unint64_t sub_6624(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 != a4 || *(unsigned char *)(result + 80))
  {
    unsigned int v6 = sub_66B4(result, a3);
    __n128 result = sub_6790(v5, 8uLL);
    **(void **)(v5 + 56) = v6 | (unint64_t)(a2 << 32);
    *(void *)(v5 + 56) += 8;
    ++*(_DWORD *)(v5 + 64);
    unsigned int v7 = *(unsigned __int16 *)(v5 + 68);
    if (v7 <= a2) {
      LOWORD(v7) = a2;
    }
    *(_WORD *)(v5 + 68) = v7;
  }
  return result;
}

uint64_t sub_66B4(uint64_t a1, uint64_t a2)
{
  sub_670C(a1, 8uLL);
  int v4 = (void *)(*(void *)(a1 + 48) - sub_6790(a1, 8uLL));
  *(void *)(a1 + 48) = v4;
  *int v4 = a2;
  return (*(_DWORD *)(a1 + 32) - v4 + *(_DWORD *)(a1 + 40));
}

unint64_t sub_670C(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 72) < a2) {
    *(void *)(a1 + 72) = a2;
  }
  return sub_6740(a1, (a2 - 1) & -(uint64_t)(*(_DWORD *)(a1 + 32) - *(_DWORD *)(a1 + 48) + *(_DWORD *)(a1 + 40)));
}

unint64_t sub_6740(uint64_t a1, unint64_t a2)
{
  unint64_t result = sub_6790(a1, a2);
  *(void *)(a1 + 48) -= result;
  if (a2)
  {
    uint64_t v5 = 0;
    do
      *(unsigned char *)(*(void *)(a1 + 48) + v5++) = 0;
    while (a2 != v5);
  }
  return result;
}

unint64_t sub_6790(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = *(void *)(a1 + 48);
  unint64_t v3 = *(void *)(a1 + 56);
  if (v2 < v3 || (unint64_t v5 = *(void *)(a1 + 40), v3 < v5)) {
    sub_D108();
  }
  if (v2 - v3 < a2)
  {
    sub_6808((uint64_t *)a1, a2);
    unint64_t v5 = *(void *)(a1 + 40);
    unint64_t v2 = *(void *)(a1 + 48);
  }
  if ((*(_DWORD *)(a1 + 32) - v2 + v5) >= 0x7FFFFFFF) {
    sub_D134();
  }
  return a2;
}

char *sub_6808(uint64_t *a1, unint64_t a2)
{
  unint64_t v5 = a1[4];
  int v4 = (char *)a1[5];
  unsigned int v6 = &v4[v5 - a1[6]];
  uint64_t v7 = a1[7] - (void)v4;
  if (v5) {
    unint64_t v8 = v5 >> 1;
  }
  else {
    unint64_t v8 = a1[2];
  }
  if (v8 > a2) {
    a2 = v8;
  }
  unint64_t v9 = (a1[3] + v5 + a2 - 1) & -a1[3];
  a1[4] = v9;
  uint64_t v10 = *a1;
  if (v4)
  {
    if (v10)
    {
      unint64_t result = (char *)(*(uint64_t (**)(uint64_t))(*(void *)v10 + 32))(v10);
    }
    else
    {
      unint64_t v13 = off_10548;
      unint64_t result = sub_5C8C((uint64_t)&v13, v4, v5, v9, v6, v7);
    }
  }
  else
  {
    if (!v10)
    {
      unint64_t v13 = off_10548;
      operator new[]();
    }
    unint64_t result = (char *)(*(uint64_t (**)(uint64_t, unint64_t))(*(void *)v10 + 16))(v10, v9);
  }
  unint64_t v12 = &result[a1[4] - v6];
  a1[5] = (uint64_t)result;
  a1[6] = (uint64_t)v12;
  a1[7] = (uint64_t)&result[v7];
  return result;
}

_DWORD *sub_696C(_DWORD *result, uint64_t a2, unsigned int a3)
{
  if (a3)
  {
    unint64_t v4 = (unint64_t)result;
    int v5 = sub_6A50(result, a3);
    return (_DWORD *)sub_69C0(v4, a2, v5, 0);
  }
  return result;
}

unint64_t sub_69C0(unint64_t result, uint64_t a2, int a3, int a4)
{
  uint64_t v5 = result;
  if (a3 != a4 || *(unsigned char *)(result + 80))
  {
    unsigned int v6 = sub_6AA4(result, a3);
    unint64_t result = sub_6790(v5, 8uLL);
    **(void **)(v5 + 56) = v6 | (unint64_t)(a2 << 32);
    *(void *)(v5 + 56) += 8;
    ++*(_DWORD *)(v5 + 64);
    unsigned int v7 = *(unsigned __int16 *)(v5 + 68);
    if (v7 <= a2) {
      LOWORD(v7) = a2;
    }
    *(_WORD *)(v5 + 68) = v7;
  }
  return result;
}

uint64_t sub_6A50(_DWORD *a1, unsigned int a2)
{
  sub_670C((uint64_t)a1, 4uLL);
  if (!a2 || (v4 = a1[8] - a1[12] + a1[10], BOOL v5 = v4 >= a2, v6 = v4 - a2, !v5)) {
    sub_D160();
  }
  return v6 + 4;
}

uint64_t sub_6AA4(uint64_t a1, int a2)
{
  sub_670C(a1, 4uLL);
  unsigned int v4 = (_DWORD *)(*(void *)(a1 + 48) - sub_6790(a1, 4uLL));
  *(void *)(a1 + 48) = v4;
  *unsigned int v4 = a2;
  return (*(_DWORD *)(a1 + 32) - v4 + *(_DWORD *)(a1 + 40));
}

uint64_t sub_6AFC(uint64_t a1, int a2)
{
  if (!*(unsigned char *)(a1 + 70)) {
    sub_D18C();
  }
  uint64_t v4 = sub_6AA4(a1, 0);
  if ((unsigned __int16)(*(_WORD *)(a1 + 68) + 2) <= 4u) {
    unint64_t v5 = 4;
  }
  else {
    unint64_t v5 = (unsigned __int16)(*(_WORD *)(a1 + 68) + 2);
  }
  *(_WORD *)(a1 + 68) = v5;
  unsigned int v6 = (void *)(*(void *)(a1 + 48) - sub_6790(a1, v5));
  *(void *)(a1 + 48) = v6;
  bzero(v6, v5);
  unsigned __int16 v7 = v4 - a2;
  if ((v4 - a2) >= 0x10000) {
    sub_D1B8();
  }
  unint64_t v8 = *(unsigned __int16 **)(a1 + 48);
  if (!v8) {
    sub_D058();
  }
  v8[1] = v7;
  *unint64_t v8 = *(_WORD *)(a1 + 68);
  unint64_t v9 = *(void *)(a1 + 56);
  if (!v9) {
    sub_D1E4();
  }
  uint64_t v10 = *(unsigned int *)(a1 + 64);
  unint64_t v11 = v9 - 8 * v10;
  if (v10)
  {
    unint64_t v12 = (int *)(v9 - 8 * v10);
    do
    {
      uint64_t v13 = *((unsigned __int16 *)v12 + 2);
      if (*(unsigned __int16 *)((char *)v8 + v13)) {
        sub_D23C();
      }
      int v14 = *v12;
      v12 += 2;
      *(unsigned __int16 *)((char *)v8 + v13) = v4 - v14;
    }
    while ((unint64_t)v12 < v9);
  }
  *(void *)(a1 + 56) = v11;
  *(_DWORD *)(a1 + 64) = 0;
  *(_WORD *)(a1 + 68) = 0;
  uint64_t v16 = *(void *)(a1 + 32);
  unint64_t v15 = *(void *)(a1 + 40);
  int v17 = v16 - v8 + v15;
  if (*(unsigned char *)(a1 + 81))
  {
    if (!v15) {
      sub_D210();
    }
    if (v15 < v11)
    {
      size_t v18 = *v8;
      uint64_t v19 = v15 + v16;
      int v20 = *(unsigned int **)(a1 + 40);
      while (1)
      {
        uint64_t v21 = *v20;
        if (v18 == *(unsigned __int16 *)(v19 - v21) && !memcmp((const void *)(v19 - v21), v8, v18)) {
          break;
        }
        if ((unint64_t)++v20 >= v11)
        {
          int v17 = v16 - v8 + v15;
          goto LABEL_21;
        }
      }
      unint64_t v8 = (unsigned __int16 *)((char *)v8 + (v16 - v8 + v15 - v4));
      *(void *)(a1 + 48) = v8;
      int v17 = v21;
    }
  }
LABEL_21:
  if (v17 == v16 + v15 - v8)
  {
    sub_6790(a1, 4uLL);
    unsigned int v22 = *(_DWORD **)(a1 + 56);
    *unsigned int v22 = v17;
    *(void *)(a1 + 56) = v22 + 1;
    uint64_t v16 = *(void *)(a1 + 32);
    unint64_t v15 = *(void *)(a1 + 40);
  }
  *(_DWORD *)(v15 + v16 - v4) = v17 - v4;
  *(unsigned char *)(a1 + 70) = 0;
  return v4;
}

void sub_6CD4()
{
}

void sub_6CEC(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_6D48(exception, a1);
}

void sub_6D34(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_6D48(std::logic_error *a1, const char *a2)
{
  unint64_t result = std::logic_error::logic_error(a1, a2);
  return result;
}

void *sub_6D7C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    sub_6DB4();
  }
  return operator new(4 * a2);
}

void sub_6DB4()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

uint64_t sub_6DE8(_DWORD *a1, uint64_t a2, unint64_t a3)
{
  unsigned int v6 = (unsigned int *)(a2 + 4 * a3);
  uint64_t v10 = a1;
  unint64_t v7 = 126 - 2 * __clz(a3);
  if (a3) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  sub_6E5C(a2, v6, (uint64_t)&v10, v8, 1);
  return sub_493C(a1, a2, a3);
}

uint64_t sub_6E5C(uint64_t result, unsigned int *a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v10 = (unsigned int *)result;
LABEL_2:
  unint64_t v11 = v10;
LABEL_3:
  uint64_t v12 = 1 - a4;
  while (1)
  {
    uint64_t v10 = v11;
    uint64_t v13 = v12;
    uint64_t v14 = (char *)a2 - (char *)v11;
    unint64_t v15 = a2 - v11;
    if (!(!v6 & v5))
    {
      switch(v15)
      {
        case 0uLL:
        case 1uLL:
          return result;
        case 2uLL:
          uint64_t v23 = *(void *)(*(void *)a3 + 40) + *(void *)(*(void *)a3 + 32);
          unint64_t result = sub_79D8((int *)(v23 - *(a2 - 1)), (int *)(v23 - *v11));
          if (result)
          {
            unsigned int v24 = *v11;
            *unint64_t v11 = *(a2 - 1);
            *(a2 - 1) = v24;
          }
          break;
        case 3uLL:
          unint64_t result = sub_73E8(v11, v11 + 1, a2 - 1, a3);
          break;
        case 4uLL:
          unint64_t result = sub_7A34(v11, v11 + 1, v11 + 2, a2 - 1, a3);
          break;
        case 5uLL:
          unint64_t result = sub_7B18(v11, v11 + 1, v11 + 2, v11 + 3, a2 - 1, a3);
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
        return (uint64_t)sub_7C34(v11, a2, a2, a3);
      }
      return result;
    }
    unint64_t v16 = v15 >> 1;
    int v17 = &v11[v15 >> 1];
    if ((unint64_t)v14 >= 0x201)
    {
      sub_73E8(v11, &v11[v15 >> 1], a2 - 1, a3);
      sub_73E8(v11 + 1, v17 - 1, a2 - 2, a3);
      sub_73E8(v11 + 2, &v11[v16 + 1], a2 - 3, a3);
      sub_73E8(v17 - 1, v17, &v11[v16 + 1], a3);
      unsigned int v18 = *v11;
      *unint64_t v11 = *v17;
      unsigned int *v17 = v18;
      if (a5) {
        goto LABEL_14;
      }
    }
    else
    {
      sub_73E8(&v11[v15 >> 1], v11, a2 - 1, a3);
      if (a5) {
        goto LABEL_14;
      }
    }
    uint64_t v19 = *(void *)(*(void *)a3 + 40) + *(void *)(*(void *)a3 + 32);
    if (!sub_79D8((int *)(v19 - *(v11 - 1)), (int *)(v19 - *v11)))
    {
      unint64_t result = (uint64_t)sub_7518(v11, a2, a3);
      unint64_t v11 = (unsigned int *)result;
      goto LABEL_19;
    }
LABEL_14:
    int v20 = (unsigned int *)sub_767C((int *)v11, (int *)a2, a3);
    if ((v21 & 1) == 0) {
      goto LABEL_17;
    }
    BOOL v22 = sub_77D8(v11, v20, a3);
    unint64_t v11 = v20 + 1;
    unint64_t result = sub_77D8(v20 + 1, a2, a3);
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
LABEL_17:
      unint64_t result = sub_6E5C(v10, v20, a3, -v13, a5 & 1);
      unint64_t v11 = v20 + 1;
LABEL_19:
      a5 = 0;
      a4 = -v13;
      goto LABEL_3;
    }
  }
  if (a5)
  {
    return (uint64_t)sub_7244(v11, a2, a3);
  }
  else
  {
    return (uint64_t)sub_732C(v11, a2, a3);
  }
}

unsigned int *sub_7244(unsigned int *result, unsigned int *a2, uint64_t a3)
{
  if (result != a2)
  {
    uint64_t v4 = result;
    char v5 = result + 1;
    if (result + 1 != a2)
    {
      uint64_t v7 = 0;
      uint64_t v8 = result;
      do
      {
        uint64_t v10 = *v8;
        uint64_t v9 = v8[1];
        uint64_t v8 = v5;
        uint64_t v11 = *(void *)(*(void *)a3 + 40) + *(void *)(*(void *)a3 + 32);
        unint64_t result = (unsigned int *)sub_79D8((int *)(v11 - v9), (int *)(v11 - v10));
        if (result)
        {
          uint64_t v12 = *v8;
          uint64_t v13 = v7;
          while (1)
          {
            *(_DWORD *)((char *)v4 + v13 + 4) = *(_DWORD *)((char *)v4 + v13);
            if (!v13) {
              break;
            }
            uint64_t v14 = *(void *)(*(void *)a3 + 40) + *(void *)(*(void *)a3 + 32);
            unint64_t result = (unsigned int *)sub_79D8((int *)(v14 - v12), (int *)(v14 - *(unsigned int *)((char *)v4 + v13 - 4)));
            v13 -= 4;
            if ((result & 1) == 0)
            {
              unint64_t v15 = (_DWORD *)((char *)v4 + v13 + 4);
              goto LABEL_10;
            }
          }
          unint64_t v15 = v4;
LABEL_10:
          _DWORD *v15 = v12;
        }
        char v5 = v8 + 1;
        v7 += 4;
      }
      while (v8 + 1 != a2);
    }
  }
  return result;
}

unsigned int *sub_732C(unsigned int *result, unsigned int *a2, uint64_t a3)
{
  if (result != a2)
  {
    uint64_t v4 = result;
    for (i = result + 1; v4 + 1 != a2; i = v4 + 1)
    {
      uint64_t v8 = *v4;
      uint64_t v7 = v4[1];
      uint64_t v4 = i;
      uint64_t v9 = *(void *)(*(void *)a3 + 40) + *(void *)(*(void *)a3 + 32);
      unint64_t result = (unsigned int *)sub_79D8((int *)(v9 - v7), (int *)(v9 - v8));
      if (result)
      {
        uint64_t v10 = *v4;
        uint64_t v11 = v4;
        do
        {
          uint64_t v12 = v11;
          unsigned int v13 = *--v11;
          *uint64_t v12 = v13;
          uint64_t v14 = *(void *)(*(void *)a3 + 40) + *(void *)(*(void *)a3 + 32);
          unint64_t result = (unsigned int *)sub_79D8((int *)(v14 - v10), (int *)(v14 - *(v12 - 2)));
        }
        while ((result & 1) != 0);
        *uint64_t v11 = v10;
      }
    }
  }
  return result;
}

uint64_t sub_73E8(unsigned int *a1, unsigned int *a2, unsigned int *a3, uint64_t a4)
{
  uint64_t v8 = *(void *)(*(void *)a4 + 40) + *(void *)(*(void *)a4 + 32);
  BOOL v9 = sub_79D8((int *)(v8 - *a2), (int *)(v8 - *a1));
  uint64_t v10 = *(void *)(*(void *)a4 + 40) + *(void *)(*(void *)a4 + 32);
  uint64_t result = sub_79D8((int *)(v10 - *a3), (int *)(v10 - *a2));
  if (!v9)
  {
    if (!result) {
      return result;
    }
    unsigned int v13 = *a2;
    *a2 = *a3;
    *a3 = v13;
    uint64_t v14 = *(void *)(*(void *)a4 + 40) + *(void *)(*(void *)a4 + 32);
    if (!sub_79D8((int *)(v14 - *a2), (int *)(v14 - *a1))) {
      return 1;
    }
    unsigned int v15 = *a1;
    *a1 = *a2;
    *a2 = v15;
    return 2;
  }
  uint64_t v12 = *a1;
  if (!result)
  {
    *a1 = *a2;
    *a2 = v12;
    uint64_t v16 = *(void *)(*(void *)a4 + 40) + *(void *)(*(void *)a4 + 32);
    if (!sub_79D8((int *)(v16 - *a3), (int *)(v16 - v12))) {
      return 1;
    }
    unsigned int v17 = *a2;
    *a2 = *a3;
    *a3 = v17;
    return 2;
  }
  *a1 = *a3;
  *a3 = v12;
  return 1;
}

unsigned int *sub_7518(unsigned int *a1, unsigned int *a2, uint64_t a3)
{
  uint64_t v4 = a2;
  uint64_t v6 = *a1;
  uint64_t v7 = *(void *)(*(void *)a3 + 40) + *(void *)(*(void *)a3 + 32);
  if (sub_79D8((int *)(v7 - v6), (int *)(v7 - *(a2 - 1))))
  {
    uint64_t v8 = a1;
    do
    {
      unsigned int v9 = v8[1];
      ++v8;
      uint64_t v10 = *(void *)(*(void *)a3 + 40) + *(void *)(*(void *)a3 + 32);
    }
    while (!sub_79D8((int *)(v10 - v6), (int *)(v10 - v9)));
  }
  else
  {
    uint64_t v11 = a1 + 1;
    do
    {
      uint64_t v8 = v11;
      if (v11 >= v4) {
        break;
      }
      uint64_t v12 = *(void *)(*(void *)a3 + 40) + *(void *)(*(void *)a3 + 32);
      ++v11;
    }
    while (!sub_79D8((int *)(v12 - v6), (int *)(v12 - *v8)));
  }
  if (v8 < v4)
  {
    do
    {
      unsigned int v13 = *--v4;
      uint64_t v14 = *(void *)(*(void *)a3 + 40) + *(void *)(*(void *)a3 + 32);
    }
    while (sub_79D8((int *)(v14 - v6), (int *)(v14 - v13)));
  }
  while (v8 < v4)
  {
    unsigned int v15 = *v8;
    *uint64_t v8 = *v4;
    *uint64_t v4 = v15;
    do
    {
      unsigned int v16 = v8[1];
      ++v8;
      uint64_t v17 = *(void *)(*(void *)a3 + 40) + *(void *)(*(void *)a3 + 32);
    }
    while (!sub_79D8((int *)(v17 - v6), (int *)(v17 - v16)));
    do
    {
      unsigned int v18 = *--v4;
      uint64_t v19 = *(void *)(*(void *)a3 + 40) + *(void *)(*(void *)a3 + 32);
    }
    while (sub_79D8((int *)(v19 - v6), (int *)(v19 - v18)));
  }
  if (v8 - 1 != a1) {
    *a1 = *(v8 - 1);
  }
  *(v8 - 1) = v6;
  return v8;
}

int *sub_767C(int *a1, int *a2, uint64_t a3)
{
  uint64_t v6 = 0;
  uint64_t v7 = *a1;
  do
    uint64_t v8 = *(void *)(*(void *)a3 + 40) + *(void *)(*(void *)a3 + 32);
  while (sub_79D8((int *)(v8 - a1[++v6]), (int *)(v8 - v7)));
  uint64_t v10 = &a1[v6];
  uint64_t v11 = &a1[v6 - 1];
  if (v6 == 1)
  {
    do
    {
      if (v10 >= a2) {
        break;
      }
      unsigned int v14 = *--a2;
      uint64_t v15 = *(void *)(*(void *)a3 + 40) + *(void *)(*(void *)a3 + 32);
    }
    while (!sub_79D8((int *)(v15 - v14), (int *)(v15 - v7)));
  }
  else
  {
    do
    {
      unsigned int v12 = *--a2;
      uint64_t v13 = *(void *)(*(void *)a3 + 40) + *(void *)(*(void *)a3 + 32);
    }
    while (!sub_79D8((int *)(v13 - v12), (int *)(v13 - v7)));
  }
  if (v10 < a2)
  {
    unsigned int v16 = &a1[v6];
    uint64_t v17 = a2;
    do
    {
      int v18 = *v16;
      int *v16 = *v17;
      int *v17 = v18;
      do
      {
        unsigned int v19 = v16[1];
        ++v16;
        uint64_t v20 = *(void *)(*(void *)a3 + 40) + *(void *)(*(void *)a3 + 32);
      }
      while (sub_79D8((int *)(v20 - v19), (int *)(v20 - v7)));
      do
      {
        unsigned int v21 = *--v17;
        uint64_t v22 = *(void *)(*(void *)a3 + 40) + *(void *)(*(void *)a3 + 32);
      }
      while (!sub_79D8((int *)(v22 - v21), (int *)(v22 - v7)));
    }
    while (v16 < v17);
    uint64_t v11 = v16 - 1;
  }
  if (v11 != a1) {
    *a1 = *v11;
  }
  *uint64_t v11 = v7;
  return v11;
}

BOOL sub_77D8(unsigned int *a1, unsigned int *a2, uint64_t a3)
{
  uint64_t v6 = a2 - a1;
  BOOL result = 1;
  switch(v6)
  {
    case 0:
    case 1:
      return result;
    case 2:
      uint64_t v8 = *(void *)(*(void *)a3 + 40) + *(void *)(*(void *)a3 + 32);
      if (sub_79D8((int *)(v8 - *(a2 - 1)), (int *)(v8 - *a1)))
      {
        unsigned int v9 = *a1;
        *a1 = *(a2 - 1);
        *(a2 - 1) = v9;
      }
      return 1;
    case 3:
      sub_73E8(a1, a1 + 1, a2 - 1, a3);
      return 1;
    case 4:
      sub_7A34(a1, a1 + 1, a1 + 2, a2 - 1, a3);
      return 1;
    case 5:
      sub_7B18(a1, a1 + 1, a1 + 2, a1 + 3, a2 - 1, a3);
      return 1;
    default:
      uint64_t v10 = a1 + 2;
      sub_73E8(a1, a1 + 1, a1 + 2, a3);
      uint64_t v11 = a1 + 3;
      if (a1 + 3 == a2) {
        return 1;
      }
      uint64_t v12 = 0;
      int v13 = 0;
      break;
  }
  while (1)
  {
    uint64_t v14 = *(void *)(*(void *)a3 + 40) + *(void *)(*(void *)a3 + 32);
    if (sub_79D8((int *)(v14 - *v11), (int *)(v14 - *v10)))
    {
      uint64_t v15 = *v11;
      uint64_t v16 = v12;
      while (1)
      {
        *(unsigned int *)((char *)a1 + v16 + 12) = *(unsigned int *)((char *)a1 + v16 + 8);
        if (v16 == -8) {
          break;
        }
        uint64_t v17 = *(void *)(*(void *)a3 + 40) + *(void *)(*(void *)a3 + 32);
        BOOL v18 = sub_79D8((int *)(v17 - v15), (int *)(v17 - *(unsigned int *)((char *)a1 + v16 + 4)));
        v16 -= 4;
        if (!v18)
        {
          unsigned int v19 = (unsigned int *)((char *)a1 + v16 + 12);
          goto LABEL_12;
        }
      }
      unsigned int v19 = a1;
LABEL_12:
      unsigned int *v19 = v15;
      if (++v13 == 8) {
        return v11 + 1 == a2;
      }
    }
    uint64_t v10 = v11;
    v12 += 4;
    if (++v11 == a2) {
      return 1;
    }
  }
}

BOOL sub_79D8(int *a1, int *a2)
{
  unint64_t v2 = (unsigned __int16 *)((char *)a1 - *a1);
  if (*v2 >= 7u && (uint64_t v3 = v2[3]) != 0) {
    unint64_t v4 = *(void *)((char *)a1 + v3);
  }
  else {
    unint64_t v4 = -1;
  }
  char v5 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v5 >= 7u && (uint64_t v6 = v5[3]) != 0) {
    unint64_t v7 = *(void *)((char *)a2 + v6);
  }
  else {
    unint64_t v7 = -1;
  }
  return v4 < v7;
}

BOOL sub_7A34(unsigned int *a1, unsigned int *a2, unsigned int *a3, unsigned int *a4, uint64_t a5)
{
  sub_73E8(a1, a2, a3, a5);
  uint64_t v10 = *(void *)(*(void *)a5 + 40) + *(void *)(*(void *)a5 + 32);
  BOOL result = sub_79D8((int *)(v10 - *a4), (int *)(v10 - *a3));
  if (result)
  {
    unsigned int v12 = *a3;
    *a3 = *a4;
    *a4 = v12;
    uint64_t v13 = *(void *)(*(void *)a5 + 40) + *(void *)(*(void *)a5 + 32);
    BOOL result = sub_79D8((int *)(v13 - *a3), (int *)(v13 - *a2));
    if (result)
    {
      unsigned int v14 = *a2;
      *a2 = *a3;
      *a3 = v14;
      uint64_t v15 = *(void *)(*(void *)a5 + 40) + *(void *)(*(void *)a5 + 32);
      BOOL result = sub_79D8((int *)(v15 - *a2), (int *)(v15 - *a1));
      if (result)
      {
        unsigned int v16 = *a1;
        *a1 = *a2;
        *a2 = v16;
      }
    }
  }
  return result;
}

BOOL sub_7B18(unsigned int *a1, unsigned int *a2, unsigned int *a3, unsigned int *a4, unsigned int *a5, uint64_t a6)
{
  sub_7A34(a1, a2, a3, a4, a6);
  uint64_t v12 = *(void *)(*(void *)a6 + 40) + *(void *)(*(void *)a6 + 32);
  BOOL result = sub_79D8((int *)(v12 - *a5), (int *)(v12 - *a4));
  if (result)
  {
    unsigned int v14 = *a4;
    *a4 = *a5;
    *a5 = v14;
    uint64_t v15 = *(void *)(*(void *)a6 + 40) + *(void *)(*(void *)a6 + 32);
    BOOL result = sub_79D8((int *)(v15 - *a4), (int *)(v15 - *a3));
    if (result)
    {
      unsigned int v16 = *a3;
      *a3 = *a4;
      *a4 = v16;
      uint64_t v17 = *(void *)(*(void *)a6 + 40) + *(void *)(*(void *)a6 + 32);
      BOOL result = sub_79D8((int *)(v17 - *a3), (int *)(v17 - *a2));
      if (result)
      {
        unsigned int v18 = *a2;
        *a2 = *a3;
        *a3 = v18;
        uint64_t v19 = *(void *)(*(void *)a6 + 40) + *(void *)(*(void *)a6 + 32);
        BOOL result = sub_79D8((int *)(v19 - *a2), (int *)(v19 - *a1));
        if (result)
        {
          unsigned int v20 = *a1;
          *a1 = *a2;
          *a2 = v20;
        }
      }
    }
  }
  return result;
}

unsigned int *sub_7C34(unsigned int *a1, unsigned int *a2, unsigned int *a3, uint64_t a4)
{
  if (a1 != a2)
  {
    uint64_t v8 = (char *)a2 - (char *)a1;
    uint64_t v9 = a2 - a1;
    if ((char *)a2 - (char *)a1 >= 5)
    {
      unint64_t v10 = (unint64_t)(v9 - 2) >> 1;
      unint64_t v11 = v10 + 1;
      uint64_t v12 = &a1[v10];
      do
      {
        sub_7D9C((BOOL)a1, a4, v9, v12--);
        --v11;
      }
      while (v11);
    }
    uint64_t v13 = a2;
    if (a2 != a3)
    {
      unsigned int v14 = a2;
      do
      {
        uint64_t v15 = *(void *)(*(void *)a4 + 40) + *(void *)(*(void *)a4 + 32);
        if (sub_79D8((int *)(v15 - *v14), (int *)(v15 - *a1)))
        {
          unsigned int v16 = *v14;
          *unsigned int v14 = *a1;
          *a1 = v16;
          sub_7D9C((BOOL)a1, a4, v9, a1);
        }
        ++v14;
      }
      while (v14 != a3);
      uint64_t v13 = a3;
    }
    if (v8 >= 5)
    {
      uint64_t v17 = (unint64_t)v8 >> 2;
      unsigned int v18 = a2 - 1;
      do
      {
        unsigned int v19 = *a1;
        unsigned int v20 = sub_7F14(a1, a4, v17);
        if (v18 == v20)
        {
          *unsigned int v20 = v19;
        }
        else
        {
          *unsigned int v20 = *v18;
          *unsigned int v18 = v19;
          sub_7FD4((BOOL)a1, (uint64_t)(v20 + 1), a4, v20 + 1 - a1);
        }
        --v18;
      }
      while (v17-- > 2);
    }
    return v13;
  }
  return a3;
}

BOOL sub_7D9C(BOOL result, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  unint64_t v4 = a3 - 2;
  if (a3 >= 2)
  {
    char v5 = a4;
    BOOL v6 = result;
    int64_t v7 = v4 >> 1;
    if ((uint64_t)(v4 >> 1) >= ((uint64_t)a4 - result) >> 2)
    {
      uint64_t v10 = ((uint64_t)a4 - result) >> 1;
      uint64_t v11 = v10 + 1;
      uint64_t v12 = (unsigned int *)(result + 4 * (v10 + 1));
      uint64_t v13 = v10 + 2;
      if (v10 + 2 < a3)
      {
        uint64_t v14 = *(void *)(*(void *)a2 + 40) + *(void *)(*(void *)a2 + 32);
        if (sub_79D8((int *)(v14 - *v12), (int *)(v14 - v12[1])))
        {
          ++v12;
          uint64_t v11 = v13;
        }
      }
      uint64_t v15 = *(void *)(*(void *)a2 + 40) + *(void *)(*(void *)a2 + 32);
      BOOL result = sub_79D8((int *)(v15 - *v12), (int *)(v15 - *v5));
      if (!result)
      {
        uint64_t v21 = *v5;
        do
        {
          unsigned int v16 = v5;
          char v5 = v12;
          _DWORD *v16 = *v12;
          if (v7 < v11) {
            break;
          }
          uint64_t v17 = (2 * v11) | 1;
          uint64_t v12 = (unsigned int *)(v6 + 4 * v17);
          uint64_t v18 = 2 * v11 + 2;
          if (v18 < a3)
          {
            uint64_t v19 = *(void *)(*(void *)a2 + 40) + *(void *)(*(void *)a2 + 32);
            if (sub_79D8((int *)(v19 - *v12), (int *)(v19 - v12[1])))
            {
              ++v12;
              uint64_t v17 = v18;
            }
          }
          uint64_t v20 = *(void *)(*(void *)a2 + 40) + *(void *)(*(void *)a2 + 32);
          BOOL result = sub_79D8((int *)(v20 - *v12), (int *)(v20 - v21));
          uint64_t v11 = v17;
        }
        while (!result);
        *char v5 = v21;
      }
    }
  }
  return result;
}

unsigned int *sub_7F14(_DWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = 0;
  uint64_t v7 = a3 - 2;
  if (a3 < 2) {
    uint64_t v7 = a3 - 1;
  }
  uint64_t v8 = v7 >> 1;
  do
  {
    uint64_t v9 = &a1[v6 + 1];
    uint64_t v10 = (2 * v6) | 1;
    uint64_t v11 = 2 * v6 + 2;
    if (v11 < a3)
    {
      uint64_t v12 = *(void *)(*(void *)a2 + 40) + *(void *)(*(void *)a2 + 32);
      if (sub_79D8((int *)(v12 - *v9), (int *)(v12 - v9[1])))
      {
        ++v9;
        uint64_t v10 = v11;
      }
    }
    *a1 = *v9;
    a1 = v9;
    uint64_t v6 = v10;
  }
  while (v10 <= v8);
  return v9;
}

BOOL sub_7FD4(BOOL result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4 - 2;
  if (a4 >= 2)
  {
    BOOL v6 = result;
    unint64_t v7 = v4 >> 1;
    uint64_t v8 = (_DWORD *)(result + 4 * (v4 >> 1));
    uint64_t v9 = (_DWORD *)(a2 - 4);
    uint64_t v10 = *(void *)(*(void *)a3 + 40) + *(void *)(*(void *)a3 + 32);
    BOOL result = sub_79D8((int *)(v10 - *v8), (int *)(v10 - *(unsigned int *)(a2 - 4)));
    if (result)
    {
      uint64_t v11 = *v9;
      do
      {
        uint64_t v12 = v9;
        uint64_t v9 = v8;
        *uint64_t v12 = *v8;
        if (!v7) {
          break;
        }
        unint64_t v7 = (v7 - 1) >> 1;
        uint64_t v8 = (_DWORD *)(v6 + 4 * v7);
        uint64_t v13 = *(void *)(*(void *)a3 + 40) + *(void *)(*(void *)a3 + 32);
        BOOL result = sub_79D8((int *)(v13 - *v8), (int *)(v13 - v11));
      }
      while (result);
      *uint64_t v9 = v11;
    }
  }
  return result;
}

unint64_t sub_8098(uint64_t a1, uint64_t a2, unint64_t a3)
{
  sub_65F8(a1);
  *(unsigned char *)(a1 + 70) = 1;
  uint64_t v6 = a3 * a2;
  sub_8138(a1, v6, 4uLL);

  return sub_8138(a1, v6, a3);
}

uint64_t sub_8104(uint64_t a1, int a2)
{
  if (!*(unsigned char *)(a1 + 70)) {
    sub_D268();
  }
  *(unsigned char *)(a1 + 70) = 0;

  return sub_6AA4(a1, a2);
}

unint64_t sub_8138(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (*(void *)(a1 + 72) < a3) {
    *(void *)(a1 + 72) = a3;
  }
  return sub_6740(a1, (a3 - 1) & (-a2 - (*(_DWORD *)(a1 + 32) - *(_DWORD *)(a1 + 48) + *(_DWORD *)(a1 + 40))));
}

uint64_t sub_8170(_DWORD *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = (unsigned int *)(a2 + 4 * a3);
  uint64_t v10 = a1;
  unint64_t v7 = 126 - 2 * __clz(a3);
  if (a3) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  sub_81E4(a2, v6, (uint64_t)&v10, v8, 1);
  return sub_493C(a1, a2, a3);
}

uint64_t sub_81E4(uint64_t result, unsigned int *a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v10 = (unsigned int *)result;
LABEL_2:
  uint64_t v11 = v10;
LABEL_3:
  uint64_t v12 = 1 - a4;
  while (1)
  {
    uint64_t v10 = v11;
    uint64_t v13 = v12;
    uint64_t v14 = (char *)a2 - (char *)v11;
    unint64_t v15 = a2 - v11;
    if (!(!v6 & v5))
    {
      switch(v15)
      {
        case 0uLL:
        case 1uLL:
          return result;
        case 2uLL:
          uint64_t v23 = *(void *)(*(void *)a3 + 40) + *(void *)(*(void *)a3 + 32);
          BOOL result = sub_79D8((int *)(v23 - *(a2 - 1)), (int *)(v23 - *v11));
          if (result)
          {
            unsigned int v24 = *v11;
            *uint64_t v11 = *(a2 - 1);
            *(a2 - 1) = v24;
          }
          break;
        case 3uLL:
          BOOL result = sub_73E8(v11, v11 + 1, a2 - 1, a3);
          break;
        case 4uLL:
          BOOL result = sub_7A34(v11, v11 + 1, v11 + 2, a2 - 1, a3);
          break;
        case 5uLL:
          BOOL result = sub_7B18(v11, v11 + 1, v11 + 2, v11 + 3, a2 - 1, a3);
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
        return (uint64_t)sub_7C34(v11, a2, a2, a3);
      }
      return result;
    }
    unint64_t v16 = v15 >> 1;
    uint64_t v17 = &v11[v15 >> 1];
    if ((unint64_t)v14 >= 0x201)
    {
      sub_73E8(v11, &v11[v15 >> 1], a2 - 1, a3);
      sub_73E8(v11 + 1, v17 - 1, a2 - 2, a3);
      sub_73E8(v11 + 2, &v11[v16 + 1], a2 - 3, a3);
      sub_73E8(v17 - 1, v17, &v11[v16 + 1], a3);
      unsigned int v18 = *v11;
      *uint64_t v11 = *v17;
      unsigned int *v17 = v18;
      if (a5) {
        goto LABEL_14;
      }
    }
    else
    {
      sub_73E8(&v11[v15 >> 1], v11, a2 - 1, a3);
      if (a5) {
        goto LABEL_14;
      }
    }
    uint64_t v19 = *(void *)(*(void *)a3 + 40) + *(void *)(*(void *)a3 + 32);
    if (!sub_79D8((int *)(v19 - *(v11 - 1)), (int *)(v19 - *v11)))
    {
      BOOL result = (uint64_t)sub_7518(v11, a2, a3);
      uint64_t v11 = (unsigned int *)result;
      goto LABEL_19;
    }
LABEL_14:
    uint64_t v20 = (unsigned int *)sub_767C((int *)v11, (int *)a2, a3);
    if ((v21 & 1) == 0) {
      goto LABEL_17;
    }
    BOOL v22 = sub_85CC(v11, v20, a3);
    uint64_t v11 = v20 + 1;
    BOOL result = sub_85CC(v20 + 1, a2, a3);
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
LABEL_17:
      BOOL result = sub_81E4(v10, v20, a3, -v13, a5 & 1);
      uint64_t v11 = v20 + 1;
LABEL_19:
      a5 = 0;
      a4 = -v13;
      goto LABEL_3;
    }
  }
  if (a5)
  {
    return (uint64_t)sub_7244(v11, a2, a3);
  }
  else
  {
    return (uint64_t)sub_732C(v11, a2, a3);
  }
}

BOOL sub_85CC(unsigned int *a1, unsigned int *a2, uint64_t a3)
{
  uint64_t v6 = a2 - a1;
  BOOL result = 1;
  switch(v6)
  {
    case 0:
    case 1:
      return result;
    case 2:
      uint64_t v8 = *(void *)(*(void *)a3 + 40) + *(void *)(*(void *)a3 + 32);
      if (sub_79D8((int *)(v8 - *(a2 - 1)), (int *)(v8 - *a1)))
      {
        unsigned int v9 = *a1;
        *a1 = *(a2 - 1);
        *(a2 - 1) = v9;
      }
      return 1;
    case 3:
      sub_73E8(a1, a1 + 1, a2 - 1, a3);
      return 1;
    case 4:
      sub_7A34(a1, a1 + 1, a1 + 2, a2 - 1, a3);
      return 1;
    case 5:
      sub_7B18(a1, a1 + 1, a1 + 2, a1 + 3, a2 - 1, a3);
      return 1;
    default:
      uint64_t v10 = a1 + 2;
      sub_73E8(a1, a1 + 1, a1 + 2, a3);
      uint64_t v11 = a1 + 3;
      if (a1 + 3 == a2) {
        return 1;
      }
      uint64_t v12 = 0;
      int v13 = 0;
      break;
  }
  while (1)
  {
    uint64_t v14 = *(void *)(*(void *)a3 + 40) + *(void *)(*(void *)a3 + 32);
    if (sub_79D8((int *)(v14 - *v11), (int *)(v14 - *v10)))
    {
      uint64_t v15 = *v11;
      uint64_t v16 = v12;
      while (1)
      {
        *(unsigned int *)((char *)a1 + v16 + 12) = *(unsigned int *)((char *)a1 + v16 + 8);
        if (v16 == -8) {
          break;
        }
        uint64_t v17 = *(void *)(*(void *)a3 + 40) + *(void *)(*(void *)a3 + 32);
        BOOL v18 = sub_79D8((int *)(v17 - v15), (int *)(v17 - *(unsigned int *)((char *)a1 + v16 + 4)));
        v16 -= 4;
        if (!v18)
        {
          uint64_t v19 = (unsigned int *)((char *)a1 + v16 + 12);
          goto LABEL_12;
        }
      }
      uint64_t v19 = a1;
LABEL_12:
      unsigned int *v19 = v15;
      if (++v13 == 8) {
        return v11 + 1 == a2;
      }
    }
    uint64_t v10 = v11;
    v12 += 4;
    if (++v11 == a2) {
      return 1;
    }
  }
}

unint64_t sub_87CC(unint64_t result, uint64_t a2, int a3, int a4)
{
  uint64_t v5 = result;
  if (a3 != a4 || *(unsigned char *)(result + 80))
  {
    unsigned int v6 = sub_885C(result, a3);
    BOOL result = sub_6790(v5, 8uLL);
    **(void **)(v5 + 56) = v6 | (unint64_t)(a2 << 32);
    *(void *)(v5 + 56) += 8;
    ++*(_DWORD *)(v5 + 64);
    unsigned int v7 = *(unsigned __int16 *)(v5 + 68);
    if (v7 <= a2) {
      LOWORD(v7) = a2;
    }
    *(_WORD *)(v5 + 68) = v7;
  }
  return result;
}

uint64_t sub_885C(uint64_t a1, char a2)
{
  sub_670C(a1, 1uLL);
  unint64_t v4 = (unsigned char *)(*(void *)(a1 + 48) - sub_6790(a1, 1uLL));
  *(void *)(a1 + 48) = v4;
  *unint64_t v4 = a2;
  return (*(_DWORD *)(a1 + 32) - *(_DWORD *)(a1 + 48) + *(_DWORD *)(a1 + 40));
}

uint64_t sub_88B8(void *a1, const void *a2, unint64_t a3)
{
  if (!a1[11]) {
    operator new();
  }
  uint64_t v5 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v6 = a1[4];
  unsigned int v11 = sub_89AC((uint64_t)a1, a2, a3);
  uint64_t v7 = sub_8A54(a1[11], &v11);
  uint64_t v8 = (uint64_t **)a1[11];
  if (v8 + 1 == (uint64_t **)v7)
  {
    unsigned int v9 = &v11;
    sub_8B8C(v8, &v11, &v11);
  }
  else
  {
    a1[6] += *((_DWORD *)a1 + 8) + v4 - (v6 + v5 + a1[6]) + *((_DWORD *)a1 + 10);
    unsigned int v9 = (unsigned int *)(v7 + 28);
  }
  return *v9;
}

uint64_t sub_89AC(uint64_t a1, const void *a2, unint64_t a3)
{
  sub_65F8(a1);
  sub_8138(a1, a3 + 1, 4uLL);
  uint64_t v6 = (unsigned char *)(*(void *)(a1 + 48) - sub_6790(a1, 1uLL));
  *(void *)(a1 + 48) = v6;
  *uint64_t v6 = 0;
  if (a3)
  {
    uint64_t v7 = (void *)(*(void *)(a1 + 48) - sub_6790(a1, a3));
    *(void *)(a1 + 48) = v7;
    memcpy(v7, a2, a3);
  }
  sub_6AA4(a1, a3);
  return (*(_DWORD *)(a1 + 32) - *(_DWORD *)(a1 + 48) + *(_DWORD *)(a1 + 40));
}

uint64_t sub_8A54(uint64_t a1, unsigned int *a2)
{
  uint64_t v4 = a1 + 8;
  uint64_t v5 = sub_8AF0(a1, a2, *(void *)(a1 + 8), a1 + 8);
  if (v4 == v5) {
    return v4;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(*(void *)(a1 + 24) + 40) + *(void *)(*(void *)(a1 + 24) + 32);
  uint64_t v8 = (unsigned int *)(v7 - *a2);
  uint64_t v9 = *(unsigned int *)(v6 + 28);
  unsigned int v12 = *v8;
  uint64_t v10 = v8 + 1;
  unsigned int v11 = v12;
  unsigned int v13 = *(_DWORD *)(v7 - v9);
  size_t v14 = v13 >= v12 ? v11 : v13;
  int v15 = memcmp(v10, (const void *)(v7 - v9 + 4), v14);
  BOOL v16 = v11 < v13;
  if (v15) {
    BOOL v16 = v15 < 0;
  }
  if (v16) {
    return v4;
  }
  return v6;
}

uint64_t sub_8AF0(uint64_t a1, unsigned int *a2, uint64_t a3, uint64_t a4)
{
  if (a3)
  {
    uint64_t v5 = a3;
    uint64_t v6 = *(void *)(*(void *)(a1 + 24) + 40) + *(void *)(*(void *)(a1 + 24) + 32);
    uint64_t v7 = *a2;
    uint64_t v8 = (const void *)(v6 - v7 + 4);
    unsigned int v9 = *(_DWORD *)(v6 - v7);
    do
    {
      uint64_t v10 = *(unsigned int *)(v5 + 28);
      unsigned int v11 = *(_DWORD *)(v6 - v10);
      if (v9 >= v11) {
        size_t v12 = v11;
      }
      else {
        size_t v12 = v9;
      }
      int v13 = memcmp((const void *)(v6 - v10 + 4), v8, v12);
      BOOL v14 = v11 < v9;
      if (v13) {
        BOOL v14 = v13 < 0;
      }
      BOOL v15 = !v14;
      if (v14) {
        BOOL v16 = (uint64_t *)(v5 + 8);
      }
      else {
        BOOL v16 = (uint64_t *)v5;
      }
      if (v15) {
        a4 = v5;
      }
      uint64_t v5 = *v16;
    }
    while (*v16);
  }
  return a4;
}

uint64_t *sub_8B8C(uint64_t **a1, unsigned int *a2, _DWORD *a3)
{
  uint64_t v5 = (void **)sub_8C10((uint64_t)a1, &v9, a2);
  uint64_t v6 = (uint64_t *)*v5;
  if (!*v5)
  {
    uint64_t v7 = (uint64_t **)v5;
    uint64_t v6 = (uint64_t *)operator new(0x20uLL);
    *((_DWORD *)v6 + 7) = *a3;
    sub_8D10(a1, v9, v7, v6);
  }
  return v6;
}

void *sub_8C10(uint64_t a1, void *a2, unsigned int *a3)
{
  uint64_t v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 24) + 40) + *(void *)(*(void *)(a1 + 24) + 32);
    uint64_t v7 = (unsigned int *)(v6 - *a3);
    unsigned int v10 = *v7;
    uint64_t v8 = v7 + 1;
    unsigned int v9 = v10;
    do
    {
      while (1)
      {
        unsigned int v11 = (void *)v4;
        uint64_t v12 = *(unsigned int *)(v4 + 28);
        int v13 = (const void *)(v6 - v12 + 4);
        unsigned int v14 = *(_DWORD *)(v6 - v12);
        if (v14 >= v9) {
          size_t v15 = v9;
        }
        else {
          size_t v15 = v14;
        }
        int v16 = memcmp(v8, (const void *)(v6 - v12 + 4), v15);
        BOOL v17 = v9 < v14;
        if (v16) {
          BOOL v17 = v16 < 0;
        }
        if (!v17) {
          break;
        }
        uint64_t v4 = *v11;
        uint64_t v5 = v11;
        if (!*v11) {
          goto LABEL_17;
        }
      }
      int v18 = memcmp(v13, v8, v15);
      BOOL v19 = v14 < v9;
      if (v18) {
        BOOL v19 = v18 < 0;
      }
      if (!v19) {
        break;
      }
      uint64_t v5 = v11 + 1;
      uint64_t v4 = v11[1];
    }
    while (v4);
  }
  else
  {
    unsigned int v11 = (void *)(a1 + 8);
  }
LABEL_17:
  *a2 = v11;
  return v5;
}

uint64_t *sub_8D10(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
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
  BOOL result = sub_8D68(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *sub_8D68(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      unint64_t v2 = (uint64_t *)a2[2];
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
            unsigned int v9 = (uint64_t **)a2[2];
          }
          else
          {
            unsigned int v9 = (uint64_t **)v2[1];
            unsigned int v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              uint64_t v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *unsigned int v9 = v2;
            v2[2] = (uint64_t)v9;
            uint64_t v3 = v9[2];
            unint64_t v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          *uint64_t v3 = v13;
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
        unint64_t v2 = (uint64_t *)v3[1];
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

uint64_t sub_8F00(uint64_t a1, unsigned int a2, const char *a3, int a4)
{
  BOOL v8 = a3 != 0;
  sub_65F8(a1);
  *(void *)(a1 + 56) = *(void *)(a1 + 40);
  uint64_t v9 = 4;
  if (a4) {
    uint64_t v9 = 8;
  }
  sub_8138(a1, v9 + 4 * v8, *(void *)(a1 + 72));
  if (a3)
  {
    if (strlen(a3) != 4) {
      sub_D294();
    }
    unsigned int v10 = (_DWORD *)(*(void *)(a1 + 48) - sub_6790(a1, 4uLL));
    *(void *)(a1 + 48) = v10;
    *unsigned int v10 = *(_DWORD *)a3;
  }
  int v11 = sub_6A50((_DWORD *)a1, a2);
  uint64_t result = sub_6AA4(a1, v11);
  if (a4) {
    uint64_t result = sub_6AA4(a1, *(_DWORD *)(a1 + 32) - *(_DWORD *)(a1 + 48) + *(_DWORD *)(a1 + 40));
  }
  *(unsigned char *)(a1 + 71) = 1;
  return result;
}

void sub_8FE8(uint64_t a1, uint64_t a2)
{
  int v3 = sub_90E8(a2, *(void *)(a1 + 40));
  if (v3)
  {
    int v4 = v3;
    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 8);
    int v6 = (char *)v5[7];
    unint64_t v7 = v5[8];
    if ((unint64_t)v6 >= v7)
    {
      uint64_t v9 = (char *)v5[6];
      uint64_t v10 = (v6 - v9) >> 2;
      if ((unint64_t)(v10 + 1) >> 62) {
        sub_6CD4();
      }
      unint64_t v11 = v7 - (void)v9;
      unint64_t v12 = (uint64_t)(v7 - (void)v9) >> 1;
      if (v12 <= v10 + 1) {
        unint64_t v12 = v10 + 1;
      }
      if (v11 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v13 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v13 = v12;
      }
      if (v13)
      {
        unsigned int v14 = (char *)sub_6D7C((uint64_t)(v5 + 8), v13);
        uint64_t v9 = (char *)v5[6];
        int v6 = (char *)v5[7];
      }
      else
      {
        unsigned int v14 = 0;
      }
      size_t v15 = &v14[4 * v10];
      int v16 = &v14[4 * v13];
      *(_DWORD *)size_t v15 = v4;
      BOOL v8 = v15 + 4;
      while (v6 != v9)
      {
        int v17 = *((_DWORD *)v6 - 1);
        v6 -= 4;
        *((_DWORD *)v15 - 1) = v17;
        v15 -= 4;
      }
      v5[6] = v15;
      v5[7] = v8;
      v5[8] = v16;
      if (v9) {
        operator delete(v9);
      }
    }
    else
    {
      *(_DWORD *)int v6 = v3;
      BOOL v8 = v6 + 4;
    }
    v5[7] = v8;
  }
}

uint64_t sub_90E8(uint64_t a1, unint64_t a2)
{
  *(void *)uu = 0;
  uint64_t v64 = 0;
  if (!dyld_image_copy_uuid()) {
    return 0;
  }
  memset(out, 0, 37);
  uuid_unparse(uu, out);
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x3812000000;
  v58 = sub_9604;
  v59 = nullsub_2;
  v60 = "";
  int v61 = 0;
  uint64_t v48 = 0;
  unsigned __int8 v49 = &v48;
  uint64_t v50 = 0x3812000000;
  v51 = sub_9614;
  v52 = nullsub_3;
  v53 = "";
  int v54 = 0;
  uint64_t v41 = _NSConcreteStackBlock;
  uint64_t v42 = 3221225472;
  v43 = sub_9624;
  v44 = &unk_105F0;
  v46 = &v48;
  unint64_t v47 = a2;
  v45 = &v55;
  dyld_image_content_for_segment();
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x5812000000;
  v36 = sub_968C;
  memset(v38, 0, sizeof(v38));
  v37 = sub_9698;
  uint64_t v39 = 0;
  int v40 = 1065353216;
  int v28 = _NSConcreteStackBlock;
  uint64_t v29 = 3221225472;
  uint64_t v30 = sub_96A0;
  unsigned int v31 = &unk_10618;
  std::string v32 = &v33;
  dyld_image_for_each_section_info();
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x4812000000;
  BOOL v22 = sub_5E20;
  uint64_t v23 = sub_5E44;
  unsigned int v24 = "";
  int v26 = 0;
  uint64_t v27 = 0;
  __p = 0;
  dyld_image_for_each_segment_info();
  sub_B134((uint64_t)(v34 + 6));
  uint64_t v3 = v20[6];
  uint64_t v4 = v20[7];
  if (v3 == v4)
  {
    uint64_t v17 = 0;
  }
  else
  {
    unsigned int v5 = sub_8170((_DWORD *)a2, v3, (v4 - v3) >> 2);
    installname = (const char *)dyld_image_get_installname();
    unsigned int v7 = sub_62F8(installname, (void *)a2);
    size_t v8 = strlen(out);
    unsigned int v9 = sub_88B8((void *)a2, out, v8);
    sub_65F8(a2);
    *(unsigned char *)(a2 + 70) = 1;
    int v10 = *(_DWORD *)(a2 + 32);
    int v11 = *(_DWORD *)(a2 + 48);
    int v12 = *(_DWORD *)(a2 + 40);
    sub_696C((_DWORD *)a2, 4, v9);
    sub_696C((_DWORD *)a2, 6, v7);
    sub_696C((_DWORD *)a2, 12, *((_DWORD *)v56 + 12));
    sub_696C((_DWORD *)a2, 14, *((_DWORD *)v49 + 12));
    unsigned int v13 = sub_6AFC(a2, v10 - v11 + v12);
    sub_65F8(a2);
    *(unsigned char *)(a2 + 70) = 1;
    int v14 = *(_DWORD *)(a2 + 32);
    int v15 = *(_DWORD *)(a2 + 48);
    int v16 = *(_DWORD *)(a2 + 40);
    sub_87CC(a2, 4, 1, 0);
    sub_696C((_DWORD *)a2, 6, v13);
    sub_696C((_DWORD *)a2, 8, v5);
    sub_87CC(a2, 14, 1, 0);
    sub_6624(a2, 10, 0, -1);
    uint64_t v17 = sub_6AFC(a2, v14 - v15 + v16);
  }
  _Block_object_dispose(&v19, 8);
  if (__p)
  {
    int v26 = __p;
    operator delete(__p);
  }
  _Block_object_dispose(&v33, 8);
  sub_9D28((uint64_t)&v38[8]);
  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v55, 8);
  return v17;
}

void sub_9580(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *__p,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  _Block_object_dispose(&a17, 8);
  if (__p)
  {
    a24 = (uint64_t)__p;
    operator delete(__p);
  }
  _Block_object_dispose(&a31, 8);
  sub_9D28(v49);
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose((const void *)(v50 - 216), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_9604(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(result + 48) = *(_DWORD *)(a2 + 48);
  return result;
}

uint64_t sub_9614(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(result + 48) = *(_DWORD *)(a2 + 48);
  return result;
}

const char *sub_9624(const char *result, uint64_t a2)
{
  if (a2)
  {
    unint64_t v2 = result;
    *(_DWORD *)(*(void *)(*((void *)result + 4) + 8) + 48) = sub_6344(*(unsigned int *)(a2 + 4) | ((unint64_t)(*(_DWORD *)(a2 + 8) & 0xFFFFFF) << 32), *((void *)result + 6));
    FamilyName = (const char *)CSArchitectureGetFamilyName();
    uint64_t result = sub_62F8(FamilyName, *((void **)v2 + 6));
    *(_DWORD *)(*(void *)(*((void *)v2 + 5) + 8) + 48) = result;
  }
  return result;
}

uint64_t sub_968C(uint64_t a1, uint64_t a2)
{
  return sub_9CB8(a1 + 48, (uint64_t *)(a2 + 48));
}

uint64_t sub_9698(uint64_t a1)
{
  return sub_9D28(a1 + 48);
}

void sub_96A0(uint64_t a1, char *a2, char *a3, uint64_t a4, uint64_t a5)
{
  if (a2 && a5)
  {
    v16[0] = a4;
    v16[1] = a5;
    if (a3) {
      unsigned int v7 = a3;
    }
    else {
      unsigned int v7 = (char *)&unk_E955;
    }
    sub_B294(__p, v7);
    uint64_t v8 = *(void *)(a1 + 32);
    *(_OWORD *)uint64_t v17 = *(_OWORD *)__p;
    uint64_t v18 = v15;
    uint64_t v9 = *(void *)(v8 + 8);
    sub_B294(__p, a2);
    uint64_t v19 = __p;
    int v10 = sub_9DF0(v9 + 48, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (long long **)&v19);
    int v11 = (uint64_t *)(v10 + 40);
    unint64_t v12 = *((void *)v10 + 6);
    if (v12 >= *((void *)v10 + 7))
    {
      uint64_t v13 = sub_A8FC(v11, (uint64_t)v16);
    }
    else
    {
      sub_A890((uint64_t)v11, (uint64_t)v16);
      uint64_t v13 = v12 + 40;
    }
    *((void *)v10 + 6) = v13;
    if (SHIBYTE(v15) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v18) < 0) {
      operator delete(v17[0]);
    }
  }
}

void sub_9790(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a22 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_97C4(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  if (!a2 || !a4) {
    return;
  }
  int v54 = 0;
  uint64_t v55 = 0;
  v53 = 0;
  uint64_t v8 = *(void *)(a1[4] + 8);
  sub_B294(__p, a2);
  uint64_t v9 = sub_ACA8((void *)(v8 + 48), (unsigned __int8 *)__p);
  int v10 = v9;
  if ((SBYTE7(v50) & 0x80000000) == 0)
  {
    if (!v9) {
      goto LABEL_33;
    }
LABEL_7:
    uint64_t v48 = a3;
    memset(v52, 0, sizeof(v52));
    sub_ADAC(v52, *((long long **)v10 + 5), *((long long **)v10 + 6), 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((void *)v10 + 6) - *((void *)v10 + 5)) >> 3));
    uint64_t v11 = *((void *)v10 + 5);
    for (uint64_t i = *((void *)v10 + 6); v11 != i; v11 += 40)
    {
      *(_OWORD *)__p = *(_OWORD *)v11;
      if (*(char *)(v11 + 39) < 0)
      {
        sub_B07C(&v50, *(void **)(v11 + 16), *(void *)(v11 + 24));
      }
      else
      {
        long long v13 = *(_OWORD *)(v11 + 16);
        uint64_t v51 = *(void *)(v11 + 32);
        long long v50 = v13;
      }
      int v14 = sub_9BEC((uint64_t)__p, a1[6]);
      int v15 = v14;
      if (v14)
      {
        int v16 = v54;
        if (v54 >= v55)
        {
          uint64_t v18 = (char *)v53;
          uint64_t v19 = (v54 - (unsigned char *)v53) >> 2;
          unint64_t v20 = v19 + 1;
          if ((unint64_t)(v19 + 1) >> 62) {
            sub_6CD4();
          }
          uint64_t v21 = v55 - (unsigned char *)v53;
          if ((v55 - (unsigned char *)v53) >> 1 > v20) {
            unint64_t v20 = v21 >> 1;
          }
          if ((unint64_t)v21 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v22 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v22 = v20;
          }
          if (v22)
          {
            uint64_t v23 = (char *)sub_6D7C((uint64_t)&v55, v22);
            uint64_t v18 = (char *)v53;
            int v16 = v54;
          }
          else
          {
            uint64_t v23 = 0;
          }
          unsigned int v24 = &v23[4 * v19];
          *(_DWORD *)unsigned int v24 = v15;
          uint64_t v17 = v24 + 4;
          while (v16 != v18)
          {
            int v25 = *((_DWORD *)v16 - 1);
            v16 -= 4;
            *((_DWORD *)v24 - 1) = v25;
            v24 -= 4;
          }
          v53 = v24;
          int v54 = v17;
          uint64_t v55 = &v23[4 * v22];
          if (v18) {
            operator delete(v18);
          }
        }
        else
        {
          *(_DWORD *)int v54 = v14;
          uint64_t v17 = v16 + 4;
        }
        int v54 = v17;
      }
      if (SHIBYTE(v51) < 0) {
        operator delete((void *)v50);
      }
    }
    __p[0] = v52;
    sub_AFD8((void ***)__p);
    a3 = v48;
    goto LABEL_33;
  }
  operator delete(__p[0]);
  if (v10) {
    goto LABEL_7;
  }
LABEL_33:
  if (v53 == v54) {
    unsigned int v26 = 0;
  }
  else {
    unsigned int v26 = sub_6DE8((_DWORD *)a1[6], (uint64_t)v53, (v54 - (unsigned char *)v53) >> 2);
  }
  size_t v27 = strlen(a2);
  unsigned int v28 = sub_88B8((void *)a1[6], a2, v27);
  unint64_t v29 = a1[6];
  sub_65F8(v29);
  *(unsigned char *)(v29 + 70) = 1;
  int v30 = *(_DWORD *)(v29 + 32);
  int v31 = *(_DWORD *)(v29 + 48);
  int v32 = *(_DWORD *)(v29 + 40);
  sub_6624(v29, 6, a3, -1);
  sub_6624(v29, 8, a4, 0);
  sub_696C((_DWORD *)v29, 4, v28);
  sub_696C((_DWORD *)v29, 22, v26);
  int v33 = sub_6AFC(v29, v30 - v31 + v32);
  int v34 = v33;
  if (v33)
  {
    uint64_t v35 = *(void **)(a1[5] + 8);
    v36 = (char *)v35[7];
    unint64_t v37 = v35[8];
    if ((unint64_t)v36 >= v37)
    {
      uint64_t v39 = (char *)v35[6];
      uint64_t v40 = (v36 - v39) >> 2;
      if ((unint64_t)(v40 + 1) >> 62) {
        sub_6CD4();
      }
      unint64_t v41 = v37 - (void)v39;
      unint64_t v42 = (uint64_t)(v37 - (void)v39) >> 1;
      if (v42 <= v40 + 1) {
        unint64_t v42 = v40 + 1;
      }
      if (v41 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v43 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v43 = v42;
      }
      if (v43)
      {
        v44 = (char *)sub_6D7C((uint64_t)(v35 + 8), v43);
        uint64_t v39 = (char *)v35[6];
        v36 = (char *)v35[7];
      }
      else
      {
        v44 = 0;
      }
      v45 = &v44[4 * v40];
      v46 = &v44[4 * v43];
      *(_DWORD *)v45 = v34;
      unint64_t v38 = v45 + 4;
      while (v36 != v39)
      {
        int v47 = *((_DWORD *)v36 - 1);
        v36 -= 4;
        *((_DWORD *)v45 - 1) = v47;
        v45 -= 4;
      }
      v35[6] = v45;
      v35[7] = v38;
      v35[8] = v46;
      if (v39) {
        operator delete(v39);
      }
    }
    else
    {
      *(_DWORD *)v36 = v33;
      unint64_t v38 = v36 + 4;
    }
    v35[7] = v38;
  }
  if (v53)
  {
    int v54 = (char *)v53;
    operator delete(v53);
  }
}

void sub_9B70(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,void *__p,uint64_t a27)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_9BEC(uint64_t a1, unint64_t a2)
{
  int v4 = *(char *)(a1 + 39);
  if (v4 >= 0) {
    unsigned int v5 = (const void *)(a1 + 16);
  }
  else {
    unsigned int v5 = *(const void **)(a1 + 16);
  }
  if (v4 >= 0) {
    unint64_t v6 = *(unsigned __int8 *)(a1 + 39);
  }
  else {
    unint64_t v6 = *(void *)(a1 + 24);
  }
  unsigned int v7 = sub_88B8((void *)a2, v5, v6);
  sub_65F8(a2);
  *(unsigned char *)(a2 + 70) = 1;
  int v8 = *(_DWORD *)(a2 + 32) - *(_DWORD *)(a2 + 48) + *(_DWORD *)(a2 + 40);
  sub_6624(a2, 6, *(void *)a1, -1);
  sub_6624(a2, 8, *(void *)(a1 + 8), 0);
  sub_696C((_DWORD *)a2, 4, v7);

  return sub_6AFC(a2, v8);
}

uint64_t sub_9CB8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a2 = 0;
  *(void *)uint64_t result = v2;
  *(void *)(result + 8) = a2[1];
  a2[1] = 0;
  uint64_t v5 = a2[2];
  uint64_t v3 = a2 + 2;
  uint64_t v4 = v5;
  *(void *)(result + 16) = v5;
  uint64_t v6 = v3[1];
  *(void *)(result + 24) = v6;
  *(_DWORD *)(result + 32) = *((_DWORD *)v3 + 4);
  if (v6)
  {
    unint64_t v7 = *(void *)(v4 + 8);
    unint64_t v8 = *(void *)(result + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        v7 %= v8;
      }
    }
    else
    {
      v7 &= v8 - 1;
    }
    *(void *)(v2 + 8 * v7) = result + 16;
    *uint64_t v3 = 0;
    v3[1] = 0;
  }
  return result;
}

uint64_t sub_9D28(uint64_t a1)
{
  sub_9D64(a1, *(void **)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void sub_9D64(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    do
    {
      uint64_t v3 = (void *)*v2;
      sub_9DA8((uint64_t)(v2 + 2));
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

void sub_9DA8(uint64_t a1)
{
  uint64_t v2 = (void **)(a1 + 24);
  sub_AFD8(&v2);
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
}

unsigned __int8 *sub_9DF0(uint64_t a1, unsigned __int8 *a2, uint64_t a3, long long **a4)
{
  unint64_t v8 = (void *)(a1 + 24);
  unint64_t v9 = sub_A098(a1 + 24, (uint64_t)a2);
  unint64_t v10 = v9;
  unint64_t v11 = *(void *)(a1 + 8);
  if (v11)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    unint64_t v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v4 = v9;
      if (v9 >= v11) {
        unint64_t v4 = v9 % v11;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v9;
    }
    int v14 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v4);
    if (v14)
    {
      for (uint64_t i = *v14; i; uint64_t i = *(unsigned __int8 **)i)
      {
        unint64_t v16 = *((void *)i + 1);
        if (v16 == v10)
        {
          if (sub_A544(a1 + 32, i + 16, a2)) {
            return i;
          }
        }
        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11) {
              v16 %= v11;
            }
          }
          else
          {
            v16 &= v11 - 1;
          }
          if (v16 != v4) {
            break;
          }
        }
      }
    }
  }
  uint64_t v17 = operator new(0x40uLL);
  v29[0] = v17;
  v29[1] = a1 + 16;
  void *v17 = 0;
  v17[1] = v10;
  uint64_t v18 = *a4;
  long long v19 = **a4;
  v17[4] = *((void *)*a4 + 2);
  *((_OWORD *)v17 + 1) = v19;
  *((void *)v18 + 1) = 0;
  *((void *)v18 + 2) = 0;
  *(void *)uint64_t v18 = 0;
  v17[6] = 0;
  v17[7] = 0;
  v17[5] = 0;
  char v30 = 1;
  float v20 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v21 = *(float *)(a1 + 32);
  if (!v11 || (float)(v21 * (float)v11) < v20)
  {
    BOOL v22 = 1;
    if (v11 >= 3) {
      BOOL v22 = (v11 & (v11 - 1)) != 0;
    }
    unint64_t v23 = v22 | (2 * v11);
    unint64_t v24 = vcvtps_u32_f32(v20 / v21);
    if (v23 <= v24) {
      size_t v25 = v24;
    }
    else {
      size_t v25 = v23;
    }
    sub_A5EC(a1, v25);
    unint64_t v11 = *(void *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11) {
        unint64_t v4 = v10 % v11;
      }
      else {
        unint64_t v4 = v10;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v10;
    }
  }
  unsigned int v26 = *(void **)(*(void *)a1 + 8 * v4);
  if (v26)
  {
    *(void *)v29[0] = *v26;
    *unsigned int v26 = v29[0];
  }
  else
  {
    *(void *)v29[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v29[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v29[0])
    {
      unint64_t v27 = *(void *)(*(void *)v29[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v27 >= v11) {
          v27 %= v11;
        }
      }
      else
      {
        v27 &= v11 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v27) = v29[0];
    }
  }
  uint64_t i = (unsigned __int8 *)v29[0];
  v29[0] = 0;
  ++*v8;
  sub_A838((uint64_t)v29, 0);
  return i;
}

void sub_A080(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_A838((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

unint64_t sub_A098(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v3 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v3 = v2;
  }
  return sub_A0D8((uint64_t)&v5, (uint64_t *)a2, v3);
}

unint64_t sub_A0D8(uint64_t a1, uint64_t *a2, unint64_t a3)
{
  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      uint64_t v4 = *(uint64_t *)((char *)a2 + a3 - 48);
      uint64_t v5 = *(uint64_t *)((char *)a2 + a3 - 40);
      uint64_t v6 = *(uint64_t *)((char *)a2 + a3 - 24);
      uint64_t v8 = *(uint64_t *)((char *)a2 + a3 - 64);
      uint64_t v7 = *(uint64_t *)((char *)a2 + a3 - 56);
      uint64_t v9 = *(uint64_t *)((char *)a2 + a3 - 16);
      uint64_t v10 = *(uint64_t *)((char *)a2 + a3 - 8);
      unint64_t v11 = v7 + v9;
      unint64_t v12 = 0x9DDFEA08EB382D69
          * (v6 ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))) >> 47) ^ (0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))));
      unint64_t v13 = 0x9DDFEA08EB382D69 * (v12 ^ (v12 >> 47));
      unint64_t v14 = v8 + a3 + v7 + v4;
      uint64_t v15 = v14 + v5;
      unint64_t v16 = __ROR8__(v14, 44) + v8 + a3 + __ROR8__(v5 + v8 + a3 - 0x622015F714C7D297 * (v12 ^ (v12 >> 47)), 21);
      uint64_t v17 = v7 + v9 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      uint64_t v18 = v17 + v6 + v9;
      uint64_t v19 = __ROR8__(v18, 44);
      uint64_t v20 = v18 + v10;
      uint64_t v21 = v19 + v17 + __ROR8__(v17 + v5 + v10, 21);
      uint64_t v23 = *a2;
      BOOL v22 = a2 + 4;
      unint64_t v24 = v23 - 0x4B6D499041670D8DLL * v5;
      uint64_t v25 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        uint64_t v26 = *(v22 - 3);
        uint64_t v27 = v24 + v15 + v11 + v26;
        uint64_t v28 = v22[2];
        uint64_t v29 = v22[3];
        uint64_t v30 = v22[1];
        unint64_t v11 = v30 + v15 - 0x4B6D499041670D8DLL * __ROR8__(v11 + v16 + v28, 42);
        uint64_t v31 = v13 + v20;
        uint64_t v32 = *(v22 - 2);
        uint64_t v33 = *(v22 - 1);
        uint64_t v34 = *(v22 - 4) - 0x4B6D499041670D8DLL * v16;
        uint64_t v35 = v34 + v20 + v33;
        uint64_t v36 = v34 + v26 + v32;
        uint64_t v15 = v36 + v33;
        uint64_t v37 = __ROR8__(v36, 44) + v34;
        unint64_t v38 = (0xB492B66FBE98F273 * __ROR8__(v27, 37)) ^ v21;
        unint64_t v24 = 0xB492B66FBE98F273 * __ROR8__(v31, 33);
        unint64_t v16 = v37 + __ROR8__(v35 + v38, 21);
        unint64_t v39 = v24 + v21 + *v22;
        uint64_t v20 = v39 + v30 + v28 + v29;
        uint64_t v21 = __ROR8__(v39 + v30 + v28, 44) + v39 + __ROR8__(v11 + v32 + v39 + v29, 21);
        v22 += 8;
        unint64_t v13 = v38;
        v25 += 64;
      }
      while (v25);
      unint64_t v40 = v24
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) ^ ((0x9DDFEA08EB382D69 * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) >> 47));
      unint64_t v41 = 0x9DDFEA08EB382D69
          * (v40 ^ (v38
                  - 0x4B6D499041670D8DLL * (v11 ^ (v11 >> 47))
                  - 0x622015F714C7D297
                  * ((0x9DDFEA08EB382D69
                    * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) ^ ((0x9DDFEA08EB382D69 * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) >> 47))));
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) ^ ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) >> 47));
    }
    else
    {
      return sub_A484(a2, a3);
    }
  }
  else if (a3 > 0x10)
  {
    return sub_A3D8(a2, a3);
  }
  else
  {
    return sub_A2E0(a2, a3);
  }
}

unint64_t sub_A2E0(_DWORD *a1, unint64_t a2)
{
  if (a2 < 9)
  {
    if (a2 < 4)
    {
      unint64_t result = 0x9AE16A3B2F90404FLL;
      if (a2)
      {
        unint64_t v8 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                      * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v8 ^ (v8 >> 47));
      }
    }
    else
    {
      uint64_t v6 = *(unsigned int *)((char *)a1 + a2 - 4);
      unint64_t v7 = 0x9DDFEA08EB382D69 * (((8 * *a1) + a2) ^ v6);
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) >> 47));
    }
  }
  else
  {
    uint64_t v3 = *(void *)((char *)a1 + a2 - 8);
    uint64_t v4 = __ROR8__(v3 + a2, a2);
    return (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)))) >> 47))) ^ v3;
  }
  return result;
}

unint64_t sub_A3D8(void *a1, uint64_t a2)
{
  uint64_t v2 = a1[1];
  unint64_t v3 = 0xB492B66FBE98F273 * *a1;
  uint64_t v4 = __ROR8__(0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8), 30) + __ROR8__(v3 - v2, 43);
  unint64_t v5 = v3 + a2 + __ROR8__(v2 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8);
  unint64_t v6 = 0x9DDFEA08EB382D69 * (v5 ^ (v4 - 0x3C5A37A36834CED9 * *(void *)((char *)a1 + a2 - 16)));
  return 0x9DDFEA08EB382D69
       * ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) ^ ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) >> 47));
}

unint64_t sub_A484(void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)((char *)a1 + a2 - 16);
  uint64_t v3 = *a1 - 0x3C5A37A36834CED9 * (v2 + a2);
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = __ROR8__(v3 + v4, 52);
  uint64_t v7 = v3 + a1[1];
  uint64_t v8 = __ROR8__(v7, 7);
  uint64_t v9 = v7 + v5;
  uint64_t v10 = *(void *)((char *)a1 + a2 - 32) + v5;
  uint64_t v11 = v8 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v2 + a2), 37) + v6 + __ROR8__(v9, 31);
  uint64_t v12 = *(void *)((char *)a1 + a2 - 24) + v10 + v2;
  unint64_t v13 = 0xC3A5C85C97CB3127 * (v12 + *(void *)((char *)a1 + a2 - 8) + v4 + v11)
      - 0x651E95C4D06FBFB1
      * (v9
       + v4
       + __ROR8__(v10, 37)
       + __ROR8__(*(void *)((char *)a1 + a2 - 24) + v10, 7)
       + __ROR8__(*(void *)((char *)a1 + a2 - 8) + v4 + v10, 52)
       + __ROR8__(v12, 31));
  return 0x9AE16A3B2F90404FLL
       * ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) ^ ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) >> 47));
}

uint64_t sub_A544(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  uint64_t v3 = a3;
  uint64_t v4 = a2[23];
  if ((v4 & 0x80u) == 0) {
    uint64_t v5 = a2[23];
  }
  else {
    uint64_t v5 = *((void *)a2 + 1);
  }
  uint64_t v6 = a3[23];
  int v7 = (char)v6;
  if ((v6 & 0x80u) != 0) {
    uint64_t v6 = *((void *)a3 + 1);
  }
  if (v5 != v6) {
    return 0;
  }
  if (v7 < 0) {
    uint64_t v3 = *(unsigned __int8 **)a3;
  }
  if ((v4 & 0x80) != 0) {
    return memcmp(*(const void **)a2, v3, *((void *)a2 + 1)) == 0;
  }
  if (!a2[23]) {
    return 1;
  }
  uint64_t v8 = v4 - 1;
  do
  {
    int v10 = *a2++;
    int v9 = v10;
    int v12 = *v3++;
    int v11 = v12;
    BOOL v14 = v8-- != 0;
    uint64_t result = v9 == v11;
  }
  while (v9 == v11 && v14);
  return result;
}

void sub_A5EC(uint64_t a1, size_t __n)
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
      sub_A6DC(a1, prime);
    }
  }
}

void sub_A6DC(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      sub_6DB4();
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
      int v11 = (void *)*v7;
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
            *int v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            int v11 = v7;
          }
          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          int v11 = (void *)*v11;
          unint64_t v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    int v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

void sub_A838(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      sub_9DA8((uint64_t)v2 + 16);
    }
    operator delete(v2);
  }
}

unsigned char *sub_A890(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 8);
  *(_OWORD *)uint64_t v3 = *(_OWORD *)a2;
  uint64_t result = (unsigned char *)(v3 + 16);
  if (*(char *)(a2 + 39) < 0)
  {
    uint64_t result = sub_B07C(result, *(void **)(a2 + 16), *(void *)(a2 + 24));
  }
  else
  {
    long long v5 = *(_OWORD *)(a2 + 16);
    *(void *)(v3 + 32) = *(void *)(a2 + 32);
    *(_OWORD *)uint64_t result = v5;
  }
  *(void *)(a1 + 8) = v3 + 40;
  return result;
}

void sub_A8F4(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t sub_A8FC(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xCCCCCCCCCCCCCCCDLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0x666666666666666) {
    sub_6CD4();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xCCCCCCCCCCCCCCCDLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x333333333333333) {
    unint64_t v9 = 0x666666666666666;
  }
  else {
    unint64_t v9 = v5;
  }
  uint64_t v19 = a1 + 2;
  if (v9) {
    int v10 = (char *)sub_AAA4(v7, v9);
  }
  else {
    int v10 = 0;
  }
  int v11 = &v10[40 * v4];
  v16[0] = v10;
  v16[1] = v11;
  uint64_t v17 = v11;
  uint64_t v18 = &v10[40 * v9];
  *(_OWORD *)int v11 = *(_OWORD *)a2;
  unint64_t v12 = v11 + 16;
  if (*(char *)(a2 + 39) < 0)
  {
    sub_B07C(v12, *(void **)(a2 + 16), *(void *)(a2 + 24));
    int v11 = v17;
  }
  else
  {
    long long v13 = *(_OWORD *)(a2 + 16);
    *((void *)v11 + 4) = *(void *)(a2 + 32);
    *(_OWORD *)unint64_t v12 = v13;
  }
  uint64_t v17 = v11 + 40;
  sub_AA2C(a1, v16);
  uint64_t v14 = a1[1];
  sub_AC18((uint64_t)v16);
  return v14;
}

void sub_AA18(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_AC18((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_AA2C(uint64_t *a1, void *a2)
{
  uint64_t result = sub_AAEC((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

void *sub_AAA4(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667) {
    sub_6DB4();
  }
  return operator new(40 * a2);
}

uint64_t sub_AAEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v14 = a6;
  *((void *)&v14 + 1) = a7;
  long long v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    uint64_t v9 = a6;
  }
  else
  {
    do
    {
      *(_OWORD *)(v7 - 40) = *(_OWORD *)(a3 - 40);
      long long v8 = *(_OWORD *)(a3 - 24);
      *(void *)(v7 - 8) = *(void *)(a3 - 8);
      *(_OWORD *)(v7 - 24) = v8;
      *(void *)(a3 - 24) = 0;
      *(void *)(a3 - 16) = 0;
      *(void *)(a3 - 8) = 0;
      uint64_t v7 = *((void *)&v14 + 1) - 40;
      *((void *)&v14 + 1) -= 40;
      a3 -= 40;
    }
    while (a3 != a5);
    uint64_t v9 = v14;
  }
  char v12 = 1;
  sub_AB98((uint64_t)v11);
  return v9;
}

uint64_t sub_AB98(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_ABD0(a1);
  }
  return a1;
}

void sub_ABD0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 39) < 0) {
      operator delete(*(void **)(v1 + 16));
    }
    v1 += 40;
  }
}

uint64_t sub_AC18(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_AC50(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      uint64_t v5 = v2 - 40;
      *(void *)(a1 + 16) = v2 - 40;
      if (*(char *)(v2 - 1) < 0)
      {
        operator delete(*(void **)(v2 - 24));
        uint64_t v5 = *(void *)(a1 + 16);
      }
      uint64_t v2 = v5;
    }
    while (v5 != a2);
  }
}

unsigned __int8 *sub_ACA8(void *a1, unsigned __int8 *a2)
{
  unint64_t v4 = sub_A098((uint64_t)(a1 + 3), (uint64_t)a2);
  int8x8_t v5 = (int8x8_t)a1[1];
  if (!*(void *)&v5) {
    return 0;
  }
  unint64_t v6 = v4;
  uint8x8_t v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  unint64_t v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    unint64_t v9 = v4;
    if (v4 >= *(void *)&v5) {
      unint64_t v9 = v4 % *(void *)&v5;
    }
  }
  else
  {
    unint64_t v9 = (*(void *)&v5 - 1) & v4;
  }
  int v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10) {
    return 0;
  }
  int v11 = *v10;
  if (*v10)
  {
    uint64_t v12 = (uint64_t)(a1 + 4);
    do
    {
      unint64_t v13 = *((void *)v11 + 1);
      if (v13 == v6)
      {
        if (sub_A544(v12, v11 + 16, a2)) {
          return v11;
        }
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(void *)&v5) {
            v13 %= *(void *)&v5;
          }
        }
        else
        {
          v13 &= *(void *)&v5 - 1;
        }
        if (v13 != v9) {
          return 0;
        }
      }
      int v11 = *(unsigned __int8 **)v11;
    }
    while (v11);
  }
  return v11;
}

void *sub_ADAC(void *result, long long *a2, long long *a3, unint64_t a4)
{
  if (a4)
  {
    unint64_t v6 = result;
    sub_AE34(result, a4);
    uint64_t result = (void *)sub_AE88((uint64_t)(v6 + 2), a2, a3, v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_AE14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  sub_AFD8(&a9);
  _Unwind_Resume(a1);
}

char *sub_AE34(void *a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667) {
    sub_6CD4();
  }
  uint64_t result = (char *)sub_AAA4((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[40 * v4];
  return result;
}

uint64_t sub_AE88(uint64_t a1, long long *a2, long long *a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v13 = a4;
  uint64_t v14 = a4;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  char v12 = 0;
  if (a2 != a3)
  {
    unint64_t v6 = a2 + 1;
    do
    {
      *(_OWORD *)uint64_t v4 = *(v6 - 1);
      uint8x8_t v7 = (unsigned char *)(v4 + 16);
      if (*((char *)v6 + 23) < 0)
      {
        sub_B07C(v7, *(void **)v6, *((void *)v6 + 1));
        uint64_t v4 = v14;
      }
      else
      {
        long long v8 = *v6;
        *(void *)(v4 + 32) = *((void *)v6 + 2);
        *(_OWORD *)uint8x8_t v7 = v8;
      }
      uint64_t v9 = v6 - 1;
      v4 += 40;
      uint64_t v14 = v4;
      unint64_t v6 = (long long *)((char *)v6 + 40);
    }
    while ((long long *)((char *)v9 + 40) != a3);
  }
  char v12 = 1;
  sub_AF58((uint64_t)v11);
  return v4;
}

void sub_AF44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_AF58(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_AF90(a1);
  }
  return a1;
}

void sub_AF90(uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 16);
  uint64_t v2 = **(void **)(a1 + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 - 1) < 0) {
      operator delete(*(void **)(v1 - 24));
    }
    v1 -= 40;
  }
}

void sub_AFD8(void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    sub_B02C((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void sub_B02C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 40)
  {
    if (*(char *)(i - 1) < 0) {
      operator delete(*(void **)(i - 24));
    }
  }
  a1[1] = v2;
}

void *sub_B07C(unsigned char *__dst, void *__src, unint64_t a3)
{
  int8x8_t v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8) {
      sub_B11C();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    long long v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000;
    *int8x8_t v5 = v8;
    int8x8_t v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }

  return memmove(v5, __src, a3 + 1);
}

void sub_B11C()
{
}

void sub_B134(uint64_t a1)
{
  if (*(void *)(a1 + 24))
  {
    sub_9D64(a1, *(void **)(a1 + 16));
    *(void *)(a1 + 16) = 0;
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2)
    {
      for (uint64_t i = 0; i != v2; ++i)
        *(void *)(*(void *)a1 + 8 * i) = 0;
    }
    *(void *)(a1 + 24) = 0;
  }
}

void sub_B18C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v4 = sub_4580(a2, a3, *(void *)(a1 + 40), 0);
  if (v4)
  {
    int v5 = v4;
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 8);
    uint64_t v7 = (char *)v6[7];
    unint64_t v8 = v6[8];
    if ((unint64_t)v7 >= v8)
    {
      uint64_t v10 = (char *)v6[6];
      uint64_t v11 = (v7 - v10) >> 2;
      if ((unint64_t)(v11 + 1) >> 62) {
        sub_6CD4();
      }
      unint64_t v12 = v8 - (void)v10;
      unint64_t v13 = (uint64_t)(v8 - (void)v10) >> 1;
      if (v13 <= v11 + 1) {
        unint64_t v13 = v11 + 1;
      }
      if (v12 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v14 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v14 = v13;
      }
      if (v14)
      {
        uint64_t v15 = (char *)sub_6D7C((uint64_t)(v6 + 8), v14);
        uint64_t v10 = (char *)v6[6];
        uint64_t v7 = (char *)v6[7];
      }
      else
      {
        uint64_t v15 = 0;
      }
      unint64_t v16 = &v15[4 * v11];
      uint64_t v17 = &v15[4 * v14];
      *(_DWORD *)unint64_t v16 = v5;
      uint64_t v9 = v16 + 4;
      while (v7 != v10)
      {
        int v18 = *((_DWORD *)v7 - 1);
        v7 -= 4;
        *((_DWORD *)v16 - 1) = v18;
        v16 -= 4;
      }
      v6[6] = v16;
      v6[7] = v9;
      v6[8] = v17;
      if (v10) {
        operator delete(v10);
      }
    }
    else
    {
      *(_DWORD *)uint64_t v7 = v4;
      uint64_t v9 = v7 + 4;
    }
    v6[7] = v9;
  }
}

void *sub_B294(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_B11C();
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

uint64_t sub_B348(uint64_t a1)
{
  sub_B384(a1, *(void ***)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void sub_B384(int a1, void **__p)
{
  if (__p)
  {
    uint64_t v2 = __p;
    do
    {
      uint64_t v3 = (void **)*v2;
      if (*((char *)v2 + 39) < 0) {
        operator delete(v2[2]);
      }
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

unsigned __int8 *sub_B3D0(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v7 = (void *)(a1 + 24);
  unint64_t v8 = sub_A098(a1 + 24, (uint64_t)a2);
  unint64_t v9 = v8;
  unint64_t v10 = *(void *)(a1 + 8);
  if (v10)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    unint64_t v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v3 = v8;
      if (v8 >= v10) {
        unint64_t v3 = v8 % v10;
      }
    }
    else
    {
      unint64_t v3 = (v10 - 1) & v8;
    }
    unint64_t v13 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v3);
    if (v13)
    {
      for (uint64_t i = *v13; i; uint64_t i = *(unsigned __int8 **)i)
      {
        unint64_t v15 = *((void *)i + 1);
        if (v15 == v9)
        {
          if (sub_A544(a1 + 32, i + 16, a2)) {
            return i;
          }
        }
        else
        {
          if (v12 > 1)
          {
            if (v15 >= v10) {
              v15 %= v10;
            }
          }
          else
          {
            v15 &= v10 - 1;
          }
          if (v15 != v3) {
            break;
          }
        }
      }
    }
  }
  sub_B650(a1, v9, a3, (uint64_t)v25);
  float v16 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v17 = *(float *)(a1 + 32);
  if (!v10 || (float)(v17 * (float)v10) < v16)
  {
    BOOL v18 = 1;
    if (v10 >= 3) {
      BOOL v18 = (v10 & (v10 - 1)) != 0;
    }
    unint64_t v19 = v18 | (2 * v10);
    unint64_t v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20) {
      size_t v21 = v20;
    }
    else {
      size_t v21 = v19;
    }
    sub_A5EC(a1, v21);
    unint64_t v10 = *(void *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10) {
        unint64_t v3 = v9 % v10;
      }
      else {
        unint64_t v3 = v9;
      }
    }
    else
    {
      unint64_t v3 = (v10 - 1) & v9;
    }
  }
  BOOL v22 = *(void **)(*(void *)a1 + 8 * v3);
  if (v22)
  {
    *(void *)v25[0] = *v22;
    *BOOL v22 = v25[0];
  }
  else
  {
    *(void *)v25[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v25[0];
    *(void *)(*(void *)a1 + 8 * v3) = a1 + 16;
    if (*(void *)v25[0])
    {
      unint64_t v23 = *(void *)(*(void *)v25[0] + 8);
      if ((v10 & (v10 - 1)) != 0)
      {
        if (v23 >= v10) {
          v23 %= v10;
        }
      }
      else
      {
        v23 &= v10 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v23) = v25[0];
    }
  }
  uint64_t i = (unsigned __int8 *)v25[0];
  ++*v7;
  return i;
}

void sub_B62C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p) {
    sub_B6F4((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_B650@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  unint64_t v8 = operator new(0x28uLL);
  *(void *)(a4 + 8) = v7;
  *(void *)a4 = v8;
  *(unsigned char *)(a4 + 16) = 0;
  *unint64_t v8 = 0;
  v8[1] = a2;
  uint64_t result = v8 + 2;
  if (*(char *)(a3 + 23) < 0)
  {
    uint64_t result = sub_B07C(result, *(void **)a3, *(void *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)uint64_t result = *(_OWORD *)a3;
    result[2] = *(void *)(a3 + 16);
  }
  *(unsigned char *)(a4 + 16) = 1;
  return result;
}

void sub_B6D8(_Unwind_Exception *a1)
{
  void *v1 = 0;
  sub_B6F4(v3, v2);
  _Unwind_Resume(a1);
}

void sub_B6F4(uint64_t a1, void **__p)
{
  if (*(unsigned char *)(a1 + 8))
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

id _signpostSpecPathsForURL(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    char v27 = 0;
    uint64_t v2 = +[NSFileManager defaultManager];
    uint64_t v3 = [v1 path];
    if ([v2 fileExistsAtPath:v3 isDirectory:&v27])
    {
      if (v27)
      {
        id v26 = 0;
        size_t v4 = [v2 contentsOfDirectoryAtURL:v1 includingPropertiesForKeys:0 options:0 error:&v26];
        id v5 = v26;
        uint64_t v6 = v5;
        uint64_t v7 = &__NSArray0__struct;
        if (v4 && !v5 && [v4 count])
        {
          unint64_t v20 = v3;
          size_t v21 = v2;
          uint64_t v7 = +[NSMutableArray array];
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          unint64_t v19 = v4;
          id v8 = v4;
          id v9 = [v8 countByEnumeratingWithState:&v22 objects:v28 count:16];
          if (v9)
          {
            id v10 = v9;
            uint64_t v11 = *(void *)v23;
            do
            {
              for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
              {
                if (*(void *)v23 != v11) {
                  objc_enumerationMutation(v8);
                }
                unint64_t v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
                unint64_t v14 = [v13 pathExtension];
                if (([v14 isEqualToString:@"plist"] & 1) != 0
                  || [v14 isEqualToString:@"json"])
                {
                  unint64_t v15 = +[NSURL URLByResolvingAliasFileAtURL:v13 options:768 error:0];
                  float v16 = v15;
                  if (v15)
                  {
                    float v17 = [v15 path];
                    [v7 addObject:v17];
                  }
                }
              }
              id v10 = [v8 countByEnumeratingWithState:&v22 objects:v28 count:16];
            }
            while (v10);
          }

          uint64_t v2 = v21;
          size_t v4 = v19;
          uint64_t v3 = v20;
          uint64_t v6 = 0;
        }
      }
      else
      {
        uint64_t v29 = v3;
        uint64_t v7 = +[NSArray arrayWithObjects:&v29 count:1];
      }
    }
    else
    {
      uint64_t v7 = &__NSArray0__struct;
    }
  }
  else
  {
    uint64_t v7 = &__NSArray0__struct;
  }

  return v7;
}

id _deserializeSignpostSpecs(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[NSArray arrayWithContentsOfFile:v1];
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = v2;
    goto LABEL_15;
  }
  uint64_t v5 = +[NSDictionary dictionaryWithContentsOfFile:v1];
  uint64_t v6 = (void *)v5;
  if (!v5)
  {
    uint64_t v7 = +[NSData dataWithContentsOfFile:v1];
    if (v7)
    {
      id v8 = +[NSJSONSerialization JSONObjectWithData:v7 options:0 error:0];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = v8;
LABEL_10:
        id v4 = v9;

LABEL_13:
        goto LABEL_14;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v11 = v8;
        id v9 = +[NSArray arrayWithObjects:&v11 count:1];
        goto LABEL_10;
      }
    }
    id v4 = 0;
    goto LABEL_13;
  }
  uint64_t v12 = v5;
  id v4 = +[NSArray arrayWithObjects:&v12 count:1];
LABEL_14:

LABEL_15:

  return v4;
}

uint64_t sub_CD9C(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 41) = 1;
  return result;
}

void sub_D02C()
{
}

void sub_D058()
{
}

void sub_D084()
{
}

void sub_D0B0()
{
}

void sub_D0DC()
{
}

void sub_D108()
{
  __assert_rtn("ensure_space", "flatbuffers.h", 986, "cur_ >= scratch_ && scratch_ >= buf_");
}

void sub_D134()
{
}

void sub_D160()
{
  __assert_rtn("ReferTo", "flatbuffers.h", 1415, "off && off <= GetSize()");
}

void sub_D18C()
{
}

void sub_D1B8()
{
}

void sub_D1E4()
{
}

void sub_D210()
{
}

void sub_D23C()
{
}

void sub_D268()
{
}

void sub_D294()
{
  __assert_rtn("Finish", "flatbuffers.h", 2149, "strlen(file_identifier) == kFileIdentifierLength");
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return _CFAutorelease(arg);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return _CFPropertyListCreateData(allocator, propertyList, format, options, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

uint64_t CSArchitectureGetFamilyName()
{
  return _CSArchitectureGetFamilyName();
}

uint64_t CSIsNull()
{
  return _CSIsNull();
}

uint64_t CSRegionGetName()
{
  return _CSRegionGetName();
}

uint64_t CSRegionGetRange()
{
  return _CSRegionGetRange();
}

uint64_t CSRelease()
{
  return _CSRelease();
}

uint64_t CSSegmentForeachSection()
{
  return _CSSegmentForeachSection();
}

uint64_t CSSymbolOwnerForeachSegment()
{
  return _CSSymbolOwnerForeachSegment();
}

uint64_t CSSymbolOwnerGetArchitecture()
{
  return _CSSymbolOwnerGetArchitecture();
}

uint64_t CSSymbolOwnerGetCFUUIDBytes()
{
  return _CSSymbolOwnerGetCFUUIDBytes();
}

uint64_t CSSymbolOwnerGetName()
{
  return _CSSymbolOwnerGetName();
}

uint64_t CSSymbolOwnerGetPath()
{
  return _CSSymbolOwnerGetPath();
}

uint64_t CSSymbolOwnerGetVersion()
{
  return _CSSymbolOwnerGetVersion();
}

uint64_t CSSymbolicatorCreateWithMachKernel()
{
  return _CSSymbolicatorCreateWithMachKernel();
}

uint64_t CSSymbolicatorForeachSharedCache()
{
  return _CSSymbolicatorForeachSharedCache();
}

uint64_t CSSymbolicatorForeachSymbolOwnerAtTime()
{
  return _CSSymbolicatorForeachSymbolOwnerAtTime();
}

uint64_t CSSymbolicatorGetAOutSymbolOwner()
{
  return _CSSymbolicatorGetAOutSymbolOwner();
}

uint64_t CSSymbolicatorGetArchitecture()
{
  return _CSSymbolicatorGetArchitecture();
}

uint64_t CSSymbolicatorGetSharedCacheUUID()
{
  return _CSSymbolicatorGetSharedCacheUUID();
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return _IOObjectConformsTo(object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperties(entry, properties, allocator, options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

kern_return_t IORegistryEntryGetChildIterator(io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return _IORegistryEntryGetChildIterator(entry, plane, iterator);
}

kern_return_t IORegistryEntryGetLocationInPlane(io_registry_entry_t entry, const io_name_t plane, io_name_t location)
{
  return _IORegistryEntryGetLocationInPlane(entry, plane, location);
}

kern_return_t IORegistryEntryGetNameInPlane(io_registry_entry_t entry, const io_name_t plane, io_name_t name)
{
  return _IORegistryEntryGetNameInPlane(entry, plane, name);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return _IORegistryEntryGetRegistryEntryID(entry, entryID);
}

io_registry_entry_t IORegistryGetRootEntry(mach_port_t mainPort)
{
  return _IORegistryGetRootEntry(mainPort);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return _IOServiceGetMatchingServices(mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _IOObjectGetClass(io_object_t object, io_name_t className)
{
  return __IOObjectGetClass(object, className);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

size_t std::__next_prime(size_t __n)
{
  return std::__next_prime(__n);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return std::string::erase(this, __pos, __n);
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
  return ___cxa_allocate_exception(thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return ___error();
}

uint64_t ats_configure_postprocessing_with_config()
{
  return _ats_configure_postprocessing_with_config();
}

uint64_t ats_will_start_tracing()
{
  return _ats_will_start_tracing();
}

void bzero(void *a1, size_t a2)
{
}

uint64_t dyld_for_each_installed_shared_cache()
{
  return _dyld_for_each_installed_shared_cache();
}

uint64_t dyld_image_content_for_segment()
{
  return _dyld_image_content_for_segment();
}

uint64_t dyld_image_copy_uuid()
{
  return _dyld_image_copy_uuid();
}

uint64_t dyld_image_for_each_section_info()
{
  return _dyld_image_for_each_section_info();
}

uint64_t dyld_image_for_each_segment_info()
{
  return _dyld_image_for_each_segment_info();
}

uint64_t dyld_image_get_installname()
{
  return _dyld_image_get_installname();
}

uint64_t dyld_shared_cache_copy_uuid()
{
  return _dyld_shared_cache_copy_uuid();
}

uint64_t dyld_shared_cache_for_each_image()
{
  return _dyld_shared_cache_for_each_image();
}

uint64_t dyld_shared_cache_get_base_address()
{
  return _dyld_shared_cache_get_base_address();
}

uint64_t ktrace_chunk_tag()
{
  return _ktrace_chunk_tag();
}

uint64_t ktrace_config_kdebug_get_debugid_enabled()
{
  return _ktrace_config_kdebug_get_debugid_enabled();
}

uint64_t ktrace_events_single()
{
  return _ktrace_events_single();
}

uint64_t ktrace_file_append_chunk()
{
  return _ktrace_file_append_chunk();
}

uint64_t ktrace_file_append_data()
{
  return _ktrace_file_append_data();
}

uint64_t ktrace_file_append_finish()
{
  return _ktrace_file_append_finish();
}

uint64_t ktrace_file_append_start()
{
  return _ktrace_file_append_start();
}

uint64_t ktrace_file_earliest_continuous_time()
{
  return _ktrace_file_earliest_continuous_time();
}

uint64_t ktrace_file_earliest_timestamp()
{
  return _ktrace_file_earliest_timestamp();
}

uint64_t ktrace_file_earliest_walltime()
{
  return _ktrace_file_earliest_walltime();
}

uint64_t ktrace_set_thread_groups_enabled()
{
  return _ktrace_set_thread_groups_enabled();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return _mach_error_string(error_value);
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

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

void objc_enumerationMutation(id obj)
{
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

void objc_storeStrong(id *location, id obj)
{
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

id objc_msgSend__serializeIOMFBAGXServices(void *a1, const char *a2, ...)
{
  return [a1 _serializeIOMFBAGXServices];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_disableGFXTracingIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 disableGFXTracingIfNeeded];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_secondsFromGMT(void *a1, const char *a2, ...)
{
  return [a1 secondsFromGMT];
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return [a1 systemTimeZone];
}

id objc_msgSend_warnWithMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "warnWithMessage:");
}