void sub_100002388(uint64_t a1, unint64_t a2, const char *a3, int a4)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  char *v8;
  unsigned int v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unsigned char *v13;
  int v14;
  NSObject *v15;
  size_t v16;
  void *v17;
  const std::locale::facet *v18;
  BOOL v19;
  const char *v20;
  int v21;
  uint8_t buf[4];
  char *v24;
  char __str[256];

  v5 = a1;
  v20 = a3;
  v21 = a1;
  do
  {
    v6 = 16;
    if (a2 < 0x10) {
      v6 = a2;
    }
    if (v6 <= 1) {
      v7 = 1;
    }
    else {
      v7 = v6;
    }
    if (!a2) {
      break;
    }
    v8 = a3 ? &__str[snprintf(__str, 0x100uLL, "%s ", a3)] : __str;
    v9 = v7 - 1;
    v10 = 0;
    v11 = &v8[snprintf(v8, 0x100uLL, "%08x: ", v5 - v21)];
    do
    {
      v11 += snprintf(v11, 0x100uLL, "%02x ", *(unsigned __int8 *)(v5 + v10));
      if (v10 == 7) {
        *(_WORD *)v11++ = 32;
      }
      ++v10;
    }
    while (v7 != v10);
    if (v7 <= 0xF)
    {
      do
      {
        *(_DWORD *)v11 = 2105376;
        if (v9 == 6)
        {
          *(_WORD *)(v11 + 3) = 32;
          v11 += 4;
        }
        else
        {
          v11 += 3;
        }
        ++v9;
      }
      while (v9 < 0xF);
    }
    v12 = 0;
    *(_DWORD *)v11 = 2128928;
    v13 = v11 + 3;
    do
    {
      v14 = *(unsigned __int8 *)(v5 + v12);
      if ((v14 - 33) >= 0x5E) {
        LOBYTE(v14) = 46;
      }
      *v13 = v14;
      v13[1] = 0;
      if (v12 == 7)
      {
        *(_WORD *)(v13 + 1) = 32;
        v13 += 2;
      }
      else
      {
        ++v13;
      }
      ++v12;
    }
    while (v7 != v12);
    if (a4)
    {
      v15 = _AFKUserLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v24 = __str;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
      }
    }
    else
    {
      v16 = strlen(__str);
      v17 = sub_100002674(&std::cout, (uint64_t)__str, v16);
      std::ios_base::getloc((const std::ios_base *)((char *)v17 + *(void *)(*v17 - 24)));
      v18 = std::locale::use_facet((const std::locale *)buf, &std::ctype<char>::id);
      ((void (*)(const std::locale::facet *, uint64_t))v18->__vftable[2].~facet_0)(v18, 10);
      std::locale::~locale((std::locale *)buf);
      std::ostream::put();
      std::ostream::flush();
    }
    v5 += v12;
    v19 = a2 > 0xF;
    a2 -= 16;
    a3 = v20;
  }
  while (v19);
}

void sub_100002658(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, std::locale a17)
{
}

void *sub_100002674(void *a1, uint64_t a2, uint64_t a3)
{
  std::ostream::sentry::sentry();
  if (v13)
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      v10 = std::locale::use_facet(&v14, &std::ctype<char>::id);
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
    if (!sub_100002818(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  std::ostream::sentry::~sentry();
  return a1;
}

void sub_1000027B0(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  std::ostream::sentry::~sentry();
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x100002790);
}

void sub_100002804(_Unwind_Exception *a1)
{
}

uint64_t sub_100002818(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
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
      sub_1000029B4(__p, v12, __c);
      char v13 = v18 >= 0 ? __p : (void **)__p[0];
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

void sub_100002984(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000029A0(void *a1)
{
}

void *sub_1000029B4(void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    sub_100002A60();
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

void sub_100002A60()
{
}

void sub_100002A78(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_100002AD4(exception, a1);
}

void sub_100002AC0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_100002AD4(std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  return result;
}

uint64_t sub_100002B08(uint64_t **a1)
{
  sub_100005E98(__p, "FILENAME");
  uint64_t v11 = __p;
  int v2 = *((_DWORD *)sub_100005F80(a1, (const void **)__p, (uint64_t)&unk_10000A130, (_OWORD **)&v11) + 14);
  if (v10 < 0)
  {
    operator delete(__p[0]);
    if (v2) {
      goto LABEL_3;
    }
LABEL_5:
    v3 = v7;
    sub_1000064AC((uint64_t *)v7, (const void ***)a1);
    uint64_t v4 = sub_100002DBC(v7);
    goto LABEL_6;
  }
  if (!v2) {
    goto LABEL_5;
  }
LABEL_3:
  v3 = v8;
  sub_1000064AC((uint64_t *)v8, (const void ***)a1);
  uint64_t v4 = sub_100002C08(v8);
LABEL_6:
  uint64_t v5 = v4;
  sub_100006C78((uint64_t)v3, v3[1]);
  return v5;
}

void sub_100002BC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, void *a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
}

uint64_t sub_100002C08(uint64_t **a1)
{
  sub_100005E98(__p, "FILENAME");
  uint64_t v15 = __p;
  int v2 = sub_100005F80(a1, (const void **)__p, (uint64_t)&unk_10000A130, (_OWORD **)&v15);
  sub_100004C1C((int *)v2 + 14, 3u);
  v3 = v2 + 4;
  if (*((char *)v2 + 87) < 0) {
    v3 = (void *)*v3;
  }
  uint64_t v4 = +[NSString stringWithUTF8String:v3];
  uint64_t v5 = +[NSData dataWithContentsOfFile:v4];

  if (v14 < 0) {
    operator delete(__p[0]);
  }
  id v12 = 0;
  uint64_t v6 = +[NSPropertyListSerialization propertyListWithData:v5 options:0 format:0 error:&v12];
  id v7 = v12;
  size_t v8 = v7;
  if (v7)
  {
    NSLog(@"ERROR! NSPropertyListSerialization:%@\n", v7);
LABEL_10:
    uint64_t v9 = 1;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v10 = objc_opt_class();
    NSLog(@"ERROR! Unexpected type:%@\n", v10);
    goto LABEL_10;
  }
  sub_100003CD0(v6);
  uint64_t v9 = 0;
LABEL_11:

  return v9;
}

void sub_100002D78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100002DBC(uint64_t **a1)
{
  v73 = objc_opt_new();
  v74 = objc_opt_new();
  uint64_t v92 = 0;
  v93 = &v92;
  uint64_t v94 = 0x2020000000;
  uint64_t v95 = 0;
  sub_100005E98(__p, "--hex");
  v88[0] = __p;
  int v2 = (int *)sub_100005F80(a1, (const void **)__p, (uint64_t)&unk_10000A130, (_OWORD **)v88);
  sub_100004C1C(v2 + 14, 1u);
  int v3 = *((unsigned __int8 *)v2 + 64);
  if (v91 < 0) {
    operator delete(__p[0]);
  }
  if (v3) {
    byte_100010208 = 1;
  }
  sub_100005E98(__p, "--archive");
  v88[0] = __p;
  uint64_t v4 = (int *)sub_100005F80(a1, (const void **)__p, (uint64_t)&unk_10000A130, (_OWORD **)v88);
  sub_100004C1C(v4 + 14, 1u);
  int v5 = *((unsigned __int8 *)v4 + 64);
  if (v91 < 0) {
    operator delete(__p[0]);
  }
  sub_100005E98(__p, "--format");
  v88[0] = __p;
  int v6 = *((_DWORD *)sub_100005F80(a1, (const void **)__p, (uint64_t)&unk_10000A130, (_OWORD **)v88) + 14);
  if (v91 < 0)
  {
    operator delete(__p[0]);
    if (!v6)
    {
LABEL_25:
      uint64_t v14 = 100;
      goto LABEL_26;
    }
  }
  else if (!v6)
  {
    goto LABEL_25;
  }
  sub_100005E98(__p, "--format");
  v88[0] = __p;
  id v7 = sub_100005F80(a1, (const void **)__p, (uint64_t)&unk_10000A130, (_OWORD **)v88);
  sub_100004C1C((int *)v7 + 14, 3u);
  size_t v8 = (unsigned __int16 *)(v7 + 4);
  int v9 = *((char *)v7 + 87);
  if (v9 < 0)
  {
    if (*((void *)v7 + 9) != 3)
    {
LABEL_22:
      BOOL v13 = 0;
      goto LABEL_23;
    }
    size_t v8 = *(unsigned __int16 **)v8;
  }
  else if (v9 != 3)
  {
    goto LABEL_22;
  }
  int v10 = *v8;
  int v11 = *((unsigned __int8 *)v8 + 2);
  BOOL v13 = v10 == 28024 && v11 == 108;
LABEL_23:
  if (v91 < 0)
  {
    operator delete(__p[0]);
    if (v13) {
      goto LABEL_25;
    }
  }
  else if (v13)
  {
    goto LABEL_25;
  }
  sub_100005E98(__p, "--format");
  v88[0] = __p;
  v19 = sub_100005F80(a1, (const void **)__p, (uint64_t)&unk_10000A130, (_OWORD **)v88);
  sub_100004C1C((int *)v19 + 14, 3u);
  v20 = (unsigned __int16 *)(v19 + 4);
  int v21 = *((char *)v19 + 87);
  if (v21 < 0)
  {
    if (*((void *)v19 + 9) != 3)
    {
LABEL_62:
      BOOL v33 = 0;
      goto LABEL_63;
    }
    v20 = *(unsigned __int16 **)v20;
  }
  else if (v21 != 3)
  {
    goto LABEL_62;
  }
  int v30 = *v20;
  int v31 = *((unsigned __int8 *)v20 + 2);
  BOOL v33 = v30 == 26978 && v31 == 110;
LABEL_63:
  if (v91 < 0)
  {
    operator delete(__p[0]);
    if (v33) {
      goto LABEL_65;
    }
LABEL_67:
    v34 = @"ERROR! Unknown plist format. Options are xml, bin";
    goto LABEL_163;
  }
  if (!v33) {
    goto LABEL_67;
  }
LABEL_65:
  uint64_t v14 = 200;
LABEL_26:
  uint64_t v75 = v14;
  sub_100005E98(__p, "--protocol");
  v88[0] = __p;
  int v15 = *((_DWORD *)sub_100005F80(a1, (const void **)__p, (uint64_t)&unk_10000A130, (_OWORD **)v88) + 14);
  if (v91 < 0)
  {
    operator delete(__p[0]);
    if (!v15) {
      goto LABEL_86;
    }
LABEL_30:
    sub_100005E98(__p, "--protocol");
    v88[0] = __p;
    v16 = (int *)sub_100005F80(a1, (const void **)__p, (uint64_t)&unk_10000A130, (_OWORD **)v88);
    sub_100004C1C(v16 + 14, 3u);
    v17 = v16 + 16;
    int v18 = *((char *)v16 + 87);
    if (v18 < 0)
    {
      if (*((void *)v16 + 9) != 6)
      {
LABEL_45:
        BOOL v25 = 0;
        goto LABEL_46;
      }
      v17 = *(_OWORD **)v17;
    }
    else if (v18 != 6)
    {
      goto LABEL_45;
    }
    int v22 = *(_DWORD *)v17;
    int v23 = *((unsigned __int16 *)v17 + 2);
    BOOL v25 = v22 == 1701999731 && v23 == 28001;
LABEL_46:
    if (v91 < 0)
    {
      operator delete(__p[0]);
      if (v25)
      {
LABEL_48:
        int v26 = 2;
        if (!v5) {
          goto LABEL_98;
        }
        goto LABEL_87;
      }
    }
    else if (v25)
    {
      goto LABEL_48;
    }
    sub_100005E98(__p, "--protocol");
    v88[0] = __p;
    v27 = sub_100005F80(a1, (const void **)__p, (uint64_t)&unk_10000A130, (_OWORD **)v88);
    sub_100004C1C((int *)v27 + 14, 3u);
    v28 = v27 + 4;
    int v29 = *((char *)v27 + 87);
    if (v29 < 0)
    {
      if (*((void *)v27 + 9) != 4)
      {
LABEL_71:
        BOOL v35 = 0;
LABEL_72:
        if (v91 < 0)
        {
          operator delete(__p[0]);
          if (v35)
          {
LABEL_74:
            int v26 = 1;
            if (!v5) {
              goto LABEL_98;
            }
            goto LABEL_87;
          }
        }
        else if (v35)
        {
          goto LABEL_74;
        }
        sub_100005E98(__p, "--protocol");
        v88[0] = __p;
        v36 = sub_100005F80(a1, (const void **)__p, (uint64_t)&unk_10000A130, (_OWORD **)v88);
        sub_100004C1C((int *)v36 + 14, 3u);
        v37 = v36 + 4;
        int v38 = *((char *)v36 + 87);
        if (v38 < 0)
        {
          if (*((void *)v36 + 9) != 4)
          {
LABEL_83:
            BOOL v39 = 0;
            goto LABEL_84;
          }
          v37 = (void *)*v37;
        }
        else if (v38 != 4)
        {
          goto LABEL_83;
        }
        BOOL v39 = *(_DWORD *)v37 == 1869903201;
LABEL_84:
        if (v91 < 0)
        {
          operator delete(__p[0]);
          if (v39) {
            goto LABEL_86;
          }
        }
        else if (v39)
        {
          goto LABEL_86;
        }
        v34 = @"ERROR! Unknown registry collection protocol.";
LABEL_163:
        id v43 = 0;
        NSLog(&v34->isa);
        uint64_t v53 = 1;
        v52 = 0;
        goto LABEL_164;
      }
      v28 = (void *)*v28;
    }
    else if (v29 != 4)
    {
      goto LABEL_71;
    }
    BOOL v35 = *(_DWORD *)v28 == 1886221668;
    goto LABEL_72;
  }
  if (v15) {
    goto LABEL_30;
  }
LABEL_86:
  int v26 = 0;
  if (!v5) {
    goto LABEL_98;
  }
LABEL_87:
  sub_100005E98(__p, "--path");
  v88[0] = __p;
  int v40 = *((_DWORD *)sub_100005F80(a1, (const void **)__p, (uint64_t)&unk_10000A130, (_OWORD **)v88) + 14);
  if (v91 < 0)
  {
    operator delete(__p[0]);
    if (v40) {
      goto LABEL_89;
    }
LABEL_98:
    id v43 = 0;
    goto LABEL_99;
  }
  if (!v40) {
    goto LABEL_98;
  }
LABEL_89:
  sub_100005E98(__p, "--path");
  v88[0] = __p;
  v41 = sub_100005F80(a1, (const void **)__p, (uint64_t)&unk_10000A130, (_OWORD **)v88);
  sub_100004C1C((int *)v41 + 14, 3u);
  v42 = v41 + 4;
  if (*((char *)v41 + 87) < 0) {
    v42 = (void *)*v42;
  }
  id v43 = +[NSString stringWithCString:v42 encoding:1];
  if (v91 < 0) {
    operator delete(__p[0]);
  }
  v44 = +[NSFileManager defaultManager];
  v45 = [v44 contentsOfDirectoryAtPath:v43 error:0];
  v46 = v45;
  if (!v45)
  {
    NSLog(@"contentsOfDirectoryAtPath returned nil");
    exit(1);
  }
  if (![v45 count]) {
    NSLog(@"contentsOfDirectoryAtPath no files ");
  }

LABEL_99:
  sub_100005E98(__p, "--buffer");
  v88[0] = __p;
  if (!*((_DWORD *)sub_100005F80(a1, (const void **)__p, (uint64_t)&unk_10000A130, (_OWORD **)v88) + 14))
  {
    int v48 = 0;
    goto LABEL_108;
  }
  sub_100005E98(v88, "--buffer");
  v96 = v88;
  v47 = (int *)sub_100005F80(a1, (const void **)v88, (uint64_t)&unk_10000A130, (_OWORD **)&v96);
  sub_100004C1C(v47 + 14, 3u);
  if (*((char *)v47 + 87) < 0)
  {
    if (*((void *)v47 + 9)) {
      goto LABEL_102;
    }
  }
  else if (*((unsigned char *)v47 + 87))
  {
LABEL_102:
    int v48 = 1;
    goto LABEL_106;
  }
  int v48 = 0;
LABEL_106:
  if (v89 < 0) {
    operator delete(v88[0]);
  }
LABEL_108:
  if ((v91 & 0x80000000) == 0)
  {
    if (v48) {
      goto LABEL_110;
    }
LABEL_115:
    uint64_t v51 = 0x100000;
    unint64_t v50 = 0x400000;
    goto LABEL_116;
  }
  operator delete(__p[0]);
  if (!v48) {
    goto LABEL_115;
  }
LABEL_110:
  sub_100005E98(__p, "--buffer");
  v88[0] = __p;
  v49 = sub_100005F80(a1, (const void **)__p, (uint64_t)&unk_10000A130, (_OWORD **)v88);
  sub_100004C1C((int *)v49 + 14, 3u);
  unint64_t v50 = std::stoul((const std::string *)(v49 + 4), 0, 0);
  if (v91 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v51 = v50;
  if (v50)
  {
LABEL_116:
    sub_100005E98(__p, "--matching");
    v88[0] = __p;
    int v54 = *((_DWORD *)sub_100005F80(a1, (const void **)__p, (uint64_t)&unk_10000A130, (_OWORD **)v88) + 14);
    if (v91 < 0)
    {
      operator delete(__p[0]);
      if (v54) {
        goto LABEL_118;
      }
    }
    else if (v54)
    {
LABEL_118:
      NSLog(@"ERROR! '--matching' not allowed");
LABEL_119:
      v52 = 0;
      goto LABEL_136;
    }
    sub_100005E98(__p, "--role");
    v88[0] = __p;
    int v55 = *((_DWORD *)sub_100005F80(a1, (const void **)__p, (uint64_t)&unk_10000A130, (_OWORD **)v88) + 14);
    if (v91 < 0) {
      operator delete(__p[0]);
    }
    if (!v55) {
      goto LABEL_119;
    }
    sub_100005E98(__p, "--role");
    v88[0] = __p;
    v56 = sub_100005F80(a1, (const void **)__p, (uint64_t)&unk_10000A130, (_OWORD **)v88);
    sub_100004C1C((int *)v56 + 14, 3u);
    v57 = v56 + 4;
    if (*((char *)v56 + 87) < 0) {
      v57 = (void *)*v57;
    }
    v58 = +[NSString stringWithCString:v57 encoding:1];
    if (v91 < 0) {
      operator delete(__p[0]);
    }
    v59 = +[NSMutableDictionary dictionaryWithObject:&__kCFBooleanTrue forKey:@"system-service"];
    CFMutableDictionaryRef v60 = IOServiceMatching("AFKEndpointInterface");
    if (([v58 isEqualToString:@"all"] & 1) == 0) {
      [v59 setObject:v58 forKey:@"role"];
    }
    [(__CFDictionary *)v60 setObject:v59 forKey:@"IOPropertyMatch"];
    sub_100005E98(__p, "--name");
    v88[0] = __p;
    int v61 = *((_DWORD *)sub_100005F80(a1, (const void **)__p, (uint64_t)&unk_10000A130, (_OWORD **)v88) + 14);
    if (v91 < 0)
    {
      operator delete(__p[0]);
      if (!v61)
      {
LABEL_135:
        v52 = v60;

LABEL_136:
        v80[0] = _NSConcreteStackBlock;
        v80[1] = 3221225472;
        v80[2] = sub_100003D68;
        v80[3] = &unk_10000C530;
        v84 = &v92;
        uint64_t v85 = v51;
        int v87 = v26;
        unint64_t v86 = v50;
        id v43 = v43;
        id v81 = v43;
        id v62 = v74;
        id v82 = v62;
        id v63 = v73;
        id v83 = v63;
        sub_10000748C(v52, v80);
        if (v93[3])
        {
          if (![v62 count] && !objc_msgSend(v63, "count")) {
            goto LABEL_156;
          }
          if (v5)
          {
            if ([v62 count] || objc_msgSend(v63, "count"))
            {
              if ([v62 count])
              {
                long long v78 = 0u;
                long long v79 = 0u;
                long long v76 = 0u;
                long long v77 = 0u;
                id v64 = v62;
                id v65 = [v64 countByEnumeratingWithState:&v76 objects:v97 count:16];
                if (v65)
                {
                  uint64_t v66 = *(void *)v77;
                  while (2)
                  {
                    for (i = 0; i != v65; i = (char *)i + 1)
                    {
                      if (*(void *)v77 != v66) {
                        objc_enumerationMutation(v64);
                      }
                      id v68 = *(id *)(*((void *)&v76 + 1) + 8 * i);
                      v69 = [v43 stringByAppendingFormat:@"/%s.plist", [v68 UTF8String]];
                      v70 = [v64 objectForKeyedSubscript:v68];
                      int v71 = sub_100004B18(v70, v69, v75);

                      if (v71)
                      {
                        uint64_t v53 = 1;
                        goto LABEL_158;
                      }
                    }
                    id v65 = [v64 countByEnumeratingWithState:&v76 objects:v97 count:16];
                    if (v65) {
                      continue;
                    }
                    break;
                  }
                }
                uint64_t v53 = 0;
LABEL_158:
              }
              else
              {
                uint64_t v53 = sub_100004B18(v63, @"/dev/stdout", v75);
              }
              goto LABEL_160;
            }
            goto LABEL_156;
          }
          if (![v63 count])
          {
LABEL_156:
            uint64_t v53 = 1;
            goto LABEL_160;
          }
          sub_100003CD0(v63);
        }
        else
        {
          NSLog(@"WARNING! No AppleFirmwareKit IOP matched.");
        }
        uint64_t v53 = 0;
LABEL_160:

        goto LABEL_164;
      }
    }
    else if (!v61)
    {
      goto LABEL_135;
    }
    NSLog(@"ERROR! '--name' not allowed");
    goto LABEL_135;
  }
  NSLog(@"ERROR! Failed to parse buffer size.");
  v52 = 0;
  uint64_t v53 = 1;
LABEL_164:

  _Block_object_dispose(&v92, 8);
  return v53;
}

void sub_100003A68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,void *a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,void *a33,uint64_t a34,int a35,__int16 a36,char a37,char a38,void *__p,uint64_t a40,int a41,__int16 a42,char a43,char a44,char a45)
{
  _Block_object_dispose(&a45, 8);
  _Unwind_Resume(a1);
}

void sub_100003CD0(void *a1)
{
  id v2 = a1;
  v1 = [v2 objectForKeyedSubscript:@"class"];

  if (v1) {
    sub_1000051F0(v2, 0, 0, 0);
  }
  else {
    [v2 enumerateKeysAndObjectsUsingBlock:&stru_10000C660];
  }
}

void sub_100003D54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100003D68(uint64_t a1, uint64_t entry)
{
  uint64_t entryID = 0;
  unint64_t v3 = *(void *)(a1 + 64);
  ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  IORegistryEntryGetRegistryEntryID(entry, &entryID);
  CFProperty = (void *)IORegistryEntryCreateCFProperty(entry, @"role", 0, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = CFProperty;
  }
  else {
    id v5 = 0;
  }
  CFTypeRef v6 = IORegistryEntryCreateCFProperty(entry, @"compartment", 0, 0);

  id v7 = (void *)v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v51 = +[NSString stringWithFormat:@"%@_%@", v5, v6];
  }
  else
  {
    uint64_t v51 = v5;
  }
  size_t v8 = (void *)IORegistryEntryCreateCFProperty(entry, @"reg-stream-block-size", 0, 0);

  int v9 = *(_DWORD *)(a1 + 80);
  if (v9 != 2)
  {
    if (v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      id v50 = (id)IORegistryEntryCreateCFProperty(entry, @"reg-size-inc", 0, 0);

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v17 = v50;
        unsigned int v18 = [v17 unsignedIntValue];
        unsigned int v19 = [v17 unsignedIntValue];

        unint64_t v3 = v18;
        uint64_t v20 = v19;
      }
      else
      {
        uint64_t v20 = 0x100000;
      }
      uint64_t v52 = v20;
      while (v3 <= *(void *)(a1 + 72))
      {
        int v21 = +[AFKEndpointInterface withService:entry];
        dispatch_semaphore_t v22 = dispatch_semaphore_create(0);
        uint64_t v73 = 0;
        v74 = &v73;
        uint64_t v75 = 0x3032000000;
        long long v76 = sub_100004D2C;
        long long v77 = sub_100004D3C;
        id v78 = 0;
        uint64_t v56 = 0;
        v57 = &v56;
        uint64_t v58 = 0x2020000000;
        LODWORD(v59) = 0;
        dispatch_queue_t v23 = dispatch_queue_create("afkregistry", 0);
        [v21 setDispatchQueue:v23];
        uint64_t v66 = _NSConcreteStackBlock;
        uint64_t v67 = 3221225472;
        uint64_t v68 = (uint64_t)sub_10000517C;
        v69 = (uint64_t (*)(uint64_t, uint64_t))&unk_10000C620;
        int v71 = &v73;
        v72 = &v56;
        v24 = v22;
        v70 = (void (*)(uint64_t))v24;
        [v21 setResponseHandler:&v66];
        [v21 activate:1];
        LODWORD(v86) = 0;
        LODWORD(v49) = 2;
        id v25 = [v21 enqueueCommand:128 timestamp:mach_continuous_time() inputBuffer:0 inputBufferSize:0 outputPayloadSize:v3 context:&v86 options:v49];
        *((_DWORD *)v57 + 6) = v25;
        if (v25)
        {
          NSLog(@"enqueueCommand:%x", v25);
        }
        else if (dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL))
        {
          *((_DWORD *)v57 + 6) = -536870186;
        }
        [v21 cancel];
        uint64_t v26 = *((int *)v57 + 6);
        if (v26 || (int v29 = (void *)v74[5]) == 0)
        {
          v81[0] = NSDebugDescriptionErrorKey;
          v82[0] = @"Did not receive registry dump AFK Endpoint Interface";
          v27 = +[NSDictionary dictionaryWithObjects:v82 forKeys:v81 count:1];
          id v28 = +[NSError errorWithDomain:@"com.apple.afktool" code:v26 userInfo:v27];

          int v29 = (void *)v74[5];
        }
        else
        {
          id v28 = 0;
        }
        v79[0] = 0;
        int v30 = (char *)[v29 bytes];
        CFMutableDictionaryRef v31 = sub_1000073EC(v30, (unint64_t)[(id)v74[5] length], kCFAllocatorDefault, 0, v79);
        if (!v31)
        {
          uint64_t v62 = 0;
          IORegistryEntryGetRegistryEntryID(entry, &v62);
          NSLog(@"ERROR! Unserialize registry dump for service:0x%llx error:%@", v62, v79[0]);
        }

        _Block_object_dispose(&v56, 8);
        _Block_object_dispose(&v73, 8);

        id v32 = v28;
        if (v32)
        {
          BOOL v33 = v32;
          NSLog(@"ERROR! Registry dump for service:0x%llx error:%@ buffer:%zu", entryID, v32, v3);
          if ([v33 code] == (id)-536870211) {
            goto LABEL_51;
          }
        }
        v3 += v52;
        if (v31)
        {
          BOOL v33 = 0;
          goto LABEL_52;
        }
      }
      BOOL v33 = 0;
      CFMutableDictionaryRef v31 = 0;
      goto LABEL_55;
    }
  }
  id v50 = v8;
  [v50 unsignedIntValue];
  uint64_t v10 = entryID;
  uint64_t v85 = AFKEndpointInterfaceEnsureReportDeliveryKey;
  unint64_t v86 = &off_10000CE80;
  int v11 = +[NSDictionary dictionaryWithObjects:&v86 forKeys:&v85 count:1];
  id v12 = +[AFKEndpointInterface withService:entry properties:v11];

  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
  uint64_t v66 = 0;
  uint64_t v67 = (uint64_t)&v66;
  uint64_t v68 = 0x3032000000;
  v69 = sub_100004D2C;
  v70 = sub_100004D3C;
  int v71 = (uint64_t *)objc_alloc_init((Class)NSMutableArray);
  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x3032000000;
  long long v76 = sub_100004D2C;
  long long v77 = sub_100004D3C;
  id v78 = 0;
  uint64_t v62 = 0;
  id v63 = &v62;
  uint64_t v64 = 0x2020000000;
  int v65 = 0;
  dispatch_queue_t v14 = dispatch_queue_create("afkregistry", 0);
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x3032000000;
  v59 = sub_100004D2C;
  CFMutableDictionaryRef v60 = sub_100004D3C;
  id v61 = 0;
  [v12 setDispatchQueue:v14];
  v82[0] = _NSConcreteStackBlock;
  v82[1] = 3221225472;
  v82[2] = sub_100004D44;
  v82[3] = &unk_10000C558;
  v84 = &v62;
  int v15 = v13;
  id v83 = v15;
  [v12 setResponseHandler:v82];
  v81[0] = _NSConcreteStackBlock;
  v81[1] = 3221225472;
  v81[2] = sub_100004D58;
  v81[3] = &unk_10000C580;
  v81[4] = &v56;
  v81[5] = &v66;
  [v12 setReportHandler:v81];
  [v12 activate:1];
  int v55 = 0;
  LODWORD(v49) = 0;
  id v16 = [v12 enqueueCommand:129 timestamp:mach_continuous_time() inputBuffer:0 inputBufferSize:0 outputPayloadSize:16 context:&v55 options:v49];
  *((_DWORD *)v63 + 6) = v16;
  if (v16)
  {
    NSLog(@"enqueueCommand:%x", v16);
  }
  else if (dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL))
  {
    *((_DWORD *)v63 + 6) = -536870186;
  }
  [v12 cancel];
  int v34 = *((_DWORD *)v63 + 6);
  if (!v34)
  {
    if ([*(id *)(v67 + 40) count])
    {
      for (unint64_t i = 0; ; ++i)
      {
        id v38 = [*(id *)(v67 + 40) count];
        BOOL v39 = *(void **)(v67 + 40);
        if (i >= (unint64_t)v38)
        {
          v79[0] = _NSConcreteStackBlock;
          v79[1] = 3221225472;
          v79[2] = sub_100004E50;
          v79[3] = &unk_10000C5F8;
          v79[4] = &v73;
          v79[5] = &v66;
          [v39 enumerateObjectsUsingBlock:v79];
          CFMutableDictionaryRef v31 = (CFMutableDictionaryRef)(id)v74[5];
          goto LABEL_47;
        }
        int v40 = [v39 objectAtIndexedSubscript:i];
        v79[0] = 0;
        id v41 = v40;
        CFMutableDictionaryRef v42 = sub_1000073EC((char *)[v41 bytes], (unint64_t)[v41 length], kCFAllocatorDefault, 0, v79);
        if (!v42) {
          break;
        }
        [*(id *)(v67 + 40) setObject:v42 atIndexedSubscript:i];
      }
      id v43 = v41;
      sub_100002388([v43 bytes], [v43 length], "AFKReg Failed", 1);
      v44 = _AFKUserLog();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT)) {
        sub_100009108(v10, v44);
      }

      CFMutableDictionaryRef v31 = (CFMutableDictionaryRef)*(id *)(v67 + 40);
LABEL_47:
      id v36 = 0;
      goto LABEL_48;
    }
    int v34 = *((_DWORD *)v63 + 6);
  }
  NSErrorUserInfoKey v80 = NSDebugDescriptionErrorKey;
  v79[0] = @"Did not receive registry dump AFK Endpoint Interface";
  BOOL v35 = +[NSDictionary dictionaryWithObjects:v79 forKeys:&v80 count:1];
  id v36 = +[NSError errorWithDomain:@"com.apple.afktool" code:v34 userInfo:v35];

  CFMutableDictionaryRef v31 = 0;
LABEL_48:

  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(&v73, 8);

  _Block_object_dispose(&v66, 8);
  id v45 = v36;
  BOOL v33 = v45;
  if (v45) {
    NSLog(@"ERROR! Registry dump for service:0x%llx error:%@", entryID, v45);
  }

LABEL_51:
  if (!v31)
  {
LABEL_55:
    v46 = v50;
    goto LABEL_58;
  }
LABEL_52:
  v46 = v50;
  if (*(void *)(a1 + 32))
  {
    if (v51) {
      [*(id *)(a1 + 40) setObject:v31 forKeyedSubscript:];
    }
    else {
      NSLog(@"ERROR! no role:0x%llx", entryID);
    }
  }
  else
  {
    v47 = *(void **)(a1 + 48);
    int v48 = +[NSString stringWithFormat:@"0x%llx", entryID];
    [v47 setObject:v31 forKeyedSubscript:v48];
  }
LABEL_58:
}

void sub_100004964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,id a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,id a45)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a40, 8);

  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100004B18(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = [objc_alloc((Class)NSOutputStream) initToFileAtPath:v6 append:1];
  [v7 open];
  id v11 = 0;
  +[NSPropertyListSerialization writePropertyList:v5 toStream:v7 format:a3 options:0 error:&v11];
  id v8 = v11;
  [v7 close];
  if (v8)
  {
    NSLog(@"ERROR! Unable to write registry output, serialization error: %@", v8);
    uint64_t v9 = 1;
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

void sub_100004BF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

int *sub_100004C1C(int *result, unsigned int a2)
{
  if (*result != a2)
  {
    unint64_t v3 = result;
    sub_100005E98(&v8, "Illegal cast to ");
    if (a2 > 4) {
      uint64_t v4 = "unknown";
    }
    else {
      uint64_t v4 = off_10000C6B0[a2];
    }
    std::string::append(&v8, v4);
    std::string::append(&v8, "; type is actually ");
    uint64_t v5 = *v3;
    if (v5 > 4) {
      id v6 = "unknown";
    }
    else {
      id v6 = off_10000C6B0[v5];
    }
    std::string::append(&v8, v6);
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, &v8);
  }
  return result;
}

void sub_100004D00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  __cxa_free_exception(v15);
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_100004D2C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100004D3C(uint64_t a1)
{
}

intptr_t sub_100004D44(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a4;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100004D58(uint64_t a1, void *a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v16 = a2;
  if (a3 == 130)
  {
    if (a6)
    {
      uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      if (!v10)
      {
        id v11 = [objc_alloc((Class)NSMutableData) initWithCapacity:a6];
        uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
        dispatch_semaphore_t v13 = *(void **)(v12 + 40);
        *(void *)(v12 + 40) = v11;

        uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      }
      [v10 appendBytes:a5 length:a6];
    }
    else
    {
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
      uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
      int v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = 0;
    }
  }
}

void sub_100004E3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100004E50(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"class"];
  if ([v5 isEqual:@"AFKRootService"]) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
  id v6 = [v4 objectForKeyedSubscript:@"children"];
  if (v6)
  {
    id v7 = objc_alloc_init((Class)NSMutableArray);
    uint64_t v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    id v11 = sub_100004FD4;
    uint64_t v12 = &unk_10000C5D0;
    uint64_t v14 = *(void *)(a1 + 40);
    id v8 = v7;
    id v13 = v8;
    [v6 enumerateObjectsUsingBlock:&v9];
    [v4 setObject:v8 forKeyedSubscript:@"children" v9, v10, v11, v12];
  }
}

void sub_100004F8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_100004FD4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000050B4;
  v6[3] = &unk_10000C5A8;
  id v7 = v3;
  id v8 = *(id *)(a1 + 32);
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v6];
}

void sub_100005094(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1000050B4(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = *(void **)(a1 + 32);
  id v9 = v6;
  id v8 = [v6 objectForKeyedSubscript:@"id"];
  LODWORD(v7) = [v7 isEqual:v8];

  if (v7)
  {
    [*(id *)(a1 + 40) addObject:v9];
    *a4 = 1;
  }
}

void sub_100005154(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

intptr_t sub_10000517C(void *a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a4)
  {
    *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = a4;
  }
  else
  {
    uint64_t v8 = +[NSData dataWithBytes:a6 length:a7];
    uint64_t v9 = *(void *)(a1[5] + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  id v11 = a1[4];

  return dispatch_semaphore_signal(v11);
}

void sub_1000051F0(void *a1, int a2, int a3, unint64_t a4)
{
  id v7 = a1;
  BOOL v35 = [v7 objectForKeyedSubscript:@"children"];
  uint64_t v8 = [v35 objectEnumerator];
  uint64_t v9 = [v8 nextObject];
  unint64_t v10 = (1 << a3) | a4;
  if (!a2) {
    unint64_t v10 = ~(1 << a3) & a4;
  }
  id v11 = (void *)v9;
  uint64_t v12 = v10 & ~(2 << a3);
  uint64_t v13 = v10 | (2 << a3);
  if (v9) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = v12;
  }
  id v15 = v7;
  id v16 = [v15 objectForKeyedSubscript:@"properties"];
  id v17 = [v16 objectForKeyedSubscript:@"name"];

  if (a3)
  {
    int v18 = 0;
    do
    {
      if ((v14 & (1 << v18)) != 0) {
        printf("| ");
      }
      else {
        printf("  ");
      }
      ++v18;
    }
    while (a3 != v18);
  }
  printf("+-o ");
  id v19 = v17;
  printf("%s", (const char *)[v19 UTF8String]);
  printf("  <class ");
  id v33 = [v15 objectForKeyedSubscript:@"class"];
  int v34 = v19;
  printf("%s", (const char *)[v33 UTF8String]);
  uint64_t v20 = [v15 objectForKeyedSubscript:@"id"];
  printf(", id 0x%llx", [v20 longLongValue]);
  int v21 = [v15 objectForKeyedSubscript:@"state"];
  id v36 = v20;
  unsigned __int8 v22 = [v21 longLongValue];

  dispatch_queue_t v23 = "";
  v24 = "!";
  if ((v22 & 0x20) != 0) {
    id v25 = "";
  }
  else {
    id v25 = "!";
  }
  if ((v22 & 8) != 0) {
    v24 = "";
  }
  if (v22) {
    dispatch_queue_t v23 = "in";
  }
  printf(", %sregistered, %sterminated, %sactive", v25, v24, v23);
  puts(">");
  unsigned int v26 = 0;
  uint64_t v27 = (a3 + 1);
  do
  {
    if ((v14 & (1 << v26)) != 0) {
      printf("| ");
    }
    else {
      printf("  ");
    }
    ++v26;
  }
  while (v26 <= v27);
  puts("{");
  id v28 = [v15 objectForKeyedSubscript:@"properties"];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3321888768;
  v37[2] = sub_100005738;
  v37[3] = &unk_10000C680;
  id v29 = v15;
  id v38 = v29;
  int v39 = a3;
  uint64_t v40 = v14;
  [v28 enumerateKeysAndObjectsUsingBlock:v37];
  unsigned int v30 = 0;
  do
  {
    if ((v14 & (1 << v30)) != 0) {
      printf("| ");
    }
    else {
      printf("  ");
    }
    ++v30;
  }
  while (v30 <= v27);
  puts("}");
  unsigned int v31 = 0;
  do
  {
    if ((v14 & (1 << v31)) != 0) {
      printf("| ");
    }
    else {
      printf("  ");
    }
    ++v31;
  }
  while (v31 <= v27);
  putchar(10);

  while (v11)
  {
    id v32 = v11;
    id v11 = [v8 nextObject];

    sub_1000051F0(v32, v11 != 0, v27, v14);
  }
}

void sub_100005608(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22)
{
  _Unwind_Resume(a1);
}

void sub_1000056B4(id a1, id a2, id a3, BOOL *a4)
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    sub_1000051F0(v4, 0, 0, 0);
  }
}

void sub_100005724(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100005738(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v14 = a2;
  id v7 = a3;
  *a4 = 0;
  if (([v14 isEqualToString:@"children"] & 1) == 0)
  {
    uint64_t v8 = (__CFString *)v14;
    uint64_t v9 = (__CFString *)v7;
    unsigned int v10 = 0;
    int v11 = *(_DWORD *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    unsigned int v13 = v11 + 1;
    do
    {
      if ((v12 & (1 << v10)) != 0) {
        printf("| ");
      }
      else {
        printf("  ");
      }
      ++v10;
    }
    while (v10 <= v13);
    printf("  ");
    sub_1000058C0(v8);
    printf(" = ");
    sub_1000058C0(v9);
    putchar(10);
  }
}

void sub_100005858(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

__n128 sub_100005880(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 32) = *(id *)(a2 + 32);
  __n128 result = *(__n128 *)(a2 + 40);
  *(__n128 *)(a1 + 40) = result;
  return result;
}

void sub_1000058B8(uint64_t a1)
{
}

void sub_1000058C0(const __CFString *a1)
{
  CFTypeID v2 = CFGetTypeID(a1);
  if (v2 == CFArrayGetTypeID())
  {
    char context = 1;
    CFIndex Count = CFArrayGetCount((CFArrayRef)a1);
    putchar(40);
    v24.location = 0;
    v24.length = Count;
    CFArrayApplyFunction((CFArrayRef)a1, v24, (CFArrayApplierFunction)sub_100005DA0, &context);
    int v4 = 41;
LABEL_3:
    putchar(v4);
    return;
  }
  if (v2 == CFBooleanGetTypeID())
  {
    if (CFBooleanGetValue((CFBooleanRef)a1)) {
      id v5 = "Yes";
    }
    else {
      id v5 = "No";
    }
LABEL_9:
    printf(v5);
    return;
  }
  if (v2 == CFDataGetTypeID())
  {
    putchar(60);
    CFIndex Length = CFDataGetLength((CFDataRef)a1);
    BytePtr = CFDataGetBytePtr((CFDataRef)a1);
    if (Length >= 1)
    {
      CFIndex v8 = 0;
      unsigned int v9 = 0;
      unsigned int v10 = 0;
LABEL_15:
      if (BytePtr[v8]) {
        BOOL v11 = v8 < Length;
      }
      else {
        BOOL v11 = 0;
      }
      if (!v11) {
        goto LABEL_39;
      }
      while (1)
      {
        uint64_t v12 = BytePtr[v8];
        if ((char)BytePtr[v8] < 0)
        {
          if (__maskrune(v12, 0x40000uLL))
          {
LABEL_22:
            ++v10;
            goto LABEL_26;
          }
        }
        else if ((_DefaultRuneLocale.__runetype[v12] & 0x40000) != 0)
        {
          goto LABEL_22;
        }
        if ((char)BytePtr[v8] > -2)
        {
          if (BytePtr[v8]) {
            goto LABEL_39;
          }
          if (++v8 >= Length) {
            goto LABEL_39;
          }
          goto LABEL_15;
        }
        ++v9;
LABEL_26:
        if (Length == ++v8)
        {
          CFIndex v8 = Length;
          goto LABEL_39;
        }
      }
    }
    unsigned int v10 = 0;
    unsigned int v9 = 0;
    CFIndex v8 = 0;
LABEL_39:
    BOOL v14 = v9 > v10 >> 2 || Length == 1;
    if ((v14 | byte_100010208)) {
      CFIndex v15 = 0;
    }
    else {
      CFIndex v15 = v8;
    }
    if (v10 && v15 >= Length)
    {
      if (Length >= 1)
      {
        int v16 = 0;
        for (uint64_t i = 0; i != Length; ++i)
        {
          if (BytePtr[i])
          {
            if (!v16)
            {
              if (i) {
                printf(",\"");
              }
              else {
                putchar(34);
              }
              int v16 = 1;
            }
            int v18 = BytePtr[i];
          }
          else
          {
            if (v16 != 1) {
              goto LABEL_66;
            }
            int v16 = 0;
            int v18 = 34;
          }
          putchar(v18);
        }
        if (v16 == 1) {
          putchar(34);
        }
      }
    }
    else if (Length >= 1)
    {
      do
      {
        int v19 = *BytePtr++;
        printf("%02x", v19);
        --Length;
      }
      while (Length);
    }
LABEL_66:
    putchar(62);
  }
  else
  {
    if (v2 == CFDictionaryGetTypeID())
    {
      char v21 = 1;
      putchar(123);
      CFDictionaryApplyFunction((CFDictionaryRef)a1, (CFDictionaryApplierFunction)sub_100005DEC, &v21);
      int v4 = 125;
      goto LABEL_3;
    }
    if (v2 == CFNumberGetTypeID())
    {
      uint64_t valuePtr = 0;
      if (CFNumberGetValue((CFNumberRef)a1, kCFNumberLongLongType, &valuePtr))
      {
        if (byte_100010208) {
          printf("0x%qx");
        }
        else {
          printf("%qu");
        }
      }
    }
    else if (v2 == CFSetGetTypeID())
    {
      sub_100005C84((const __CFSet *)a1);
    }
    else
    {
      if (v2 != CFStringGetTypeID())
      {
        id v5 = "<unknown object>";
        goto LABEL_9;
      }
      sub_100005CE0(a1);
    }
  }
}

uint64_t sub_100005C84(const __CFSet *a1)
{
  char context = 1;
  putchar(91);
  CFSetApplyFunction(a1, (CFSetApplierFunction)sub_100005E4C, &context);
  return putchar(93);
}

void sub_100005CE0(const __CFString *a1)
{
  CStringPtr = CFStringGetCStringPtr(a1, 0);
  if (CStringPtr)
  {
    printf("\"%s\"", CStringPtr);
  }
  else
  {
    CFIndex v3 = CFStringGetLength(a1) + 1;
    int v4 = (char *)malloc_type_malloc(v3, 0x4A2F5AA8uLL);
    if (v4)
    {
      id v5 = v4;
      if (CFStringGetCString(a1, v4, v3, 0)) {
        printf("\"%s\"", v5);
      }
      free(v5);
    }
  }
}

uint64_t sub_100005DA0(uint64_t a1, unsigned char *a2)
{
  if (*a2) {
    *a2 = 0;
  }
  else {
    putchar(44);
  }

  return sub_1000058C0(a1);
}

uint64_t sub_100005DEC(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  if (*a3) {
    *a3 = 0;
  }
  else {
    putchar(44);
  }
  sub_1000058C0(a1);
  putchar(61);

  return sub_1000058C0(a2);
}

uint64_t sub_100005E4C(uint64_t a1, unsigned char *a2)
{
  if (*a2) {
    *a2 = 0;
  }
  else {
    putchar(44);
  }

  return sub_1000058C0(a1);
}

void *sub_100005E98(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_100002A60();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    id v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    id v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void sub_100005F4C()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

_OWORD *sub_100005F80(uint64_t **a1, const void **a2, uint64_t a3, _OWORD **a4)
{
  id v6 = (void **)sub_100006044((uint64_t)a1, &v14, a2);
  uint64_t v7 = *v6;
  if (!*v6)
  {
    uint64_t v8 = (uint64_t **)v6;
    uint64_t v7 = operator new(0x58uLL);
    v12[1] = a1 + 1;
    unsigned int v9 = *a4;
    uint64_t v10 = *((void *)*a4 + 2);
    v7[2] = **a4;
    *((void *)v7 + 6) = v10;
    v9[1] = 0;
    v9[2] = 0;
    *unsigned int v9 = 0;
    *((_DWORD *)v7 + 14) = 0;
    char v13 = 1;
    sub_1000060E4(a1, v14, v8, (uint64_t *)v7);
    v12[0] = 0;
    sub_100006340((uint64_t)v12, 0);
  }
  return v7;
}

void *sub_100006044(uint64_t a1, void *a2, const void **a3)
{
  size_t v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4)
  {
    uint64_t v7 = a1 + 16;
    do
    {
      while (1)
      {
        uint64_t v8 = (void *)v4;
        unsigned int v9 = (const void **)(v4 + 32);
        if (!sub_10000613C(v7, a3, (const void **)(v4 + 32))) {
          break;
        }
        uint64_t v4 = *v8;
        size_t v5 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (!sub_10000613C(v7, v9, a3)) {
        break;
      }
      size_t v5 = v8 + 1;
      uint64_t v4 = v8[1];
    }
    while (v4);
  }
  else
  {
    uint64_t v8 = (void *)(a1 + 8);
  }
LABEL_10:
  *a2 = v8;
  return v5;
}

uint64_t *sub_1000060E4(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  size_t v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  __n128 result = sub_1000061A8(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

BOOL sub_10000613C(uint64_t a1, const void **a2, const void **a3)
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
    id v6 = a2;
  }
  else {
    id v6 = *a2;
  }
  if (v3 >= 0) {
    size_t v7 = *((unsigned __int8 *)a3 + 23);
  }
  else {
    size_t v7 = (size_t)a3[1];
  }
  if (v3 >= 0) {
    uint64_t v8 = a3;
  }
  else {
    uint64_t v8 = *a3;
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

uint64_t *sub_1000061A8(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      CFTypeID v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      int v3 = (uint64_t *)v2[2];
      int v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (int v8 = *(unsigned __int8 *)(v7 + 24), v5 = (unsigned char *)(v7 + 24), v8))
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
            *size_t v9 = v2;
            v2[2] = (uint64_t)v9;
            int v3 = v9[2];
            CFTypeID v2 = (uint64_t *)*v3;
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
      else if (!v4 || (int v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          *CFTypeID v2 = v11;
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
        CFTypeID v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        *CFTypeID v2 = (uint64_t)v3;
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

void sub_100006340(uint64_t a1, uint64_t a2)
{
  CFTypeID v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      sub_100006398((uint64_t)v2 + 32);
    }
    operator delete(v2);
  }
}

void sub_100006398(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 24);
  if (v2 == 4)
  {
    int v3 = (void **)(a1 + 32);
    sub_100006408(&v3);
  }
  else if (v2 == 3 && *(char *)(a1 + 55) < 0)
  {
    operator delete(*(void **)(a1 + 32));
  }
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
}

void sub_100006408(void ***a1)
{
  int v2 = *a1;
  if (*v2)
  {
    sub_10000645C((uint64_t *)v2);
    int v3 = **a1;
    operator delete(v3);
  }
}

void sub_10000645C(uint64_t *a1)
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

uint64_t *sub_1000064AC(uint64_t *a1, const void ***a2)
{
  a1[2] = 0;
  a1[1] = 0;
  *a1 = (uint64_t)(a1 + 1);
  sub_100006504(a1, *a2, a2 + 1);
  return a1;
}

void sub_1000064EC(_Unwind_Exception *a1)
{
  sub_100006C78(v1, *(void **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *sub_100006504(uint64_t *result, const void **a2, const void ***a3)
{
  if (a2 != (const void **)a3)
  {
    int v4 = a2;
    size_t v5 = (uint64_t **)result;
    int v6 = result + 1;
    do
    {
      __n128 result = sub_100006590(v5, v6, v4 + 4, (long long *)v4 + 2);
      uint64_t v7 = (const void **)v4[1];
      if (v7)
      {
        do
        {
          int v8 = (const void ***)v7;
          uint64_t v7 = (const void **)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          int v8 = (const void ***)v4[2];
          BOOL v9 = *v8 == v4;
          int v4 = (const void **)v8;
        }
        while (!v9);
      }
      int v4 = (const void **)v8;
    }
    while (v8 != a3);
  }
  return result;
}

uint64_t *sub_100006590(uint64_t **a1, uint64_t *a2, const void **a3, long long *a4)
{
  int v6 = sub_100006628(a1, a2, &v12, &v11, a3);
  uint64_t v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    int v8 = (uint64_t **)v6;
    sub_1000067D4((uint64_t)a1, a4, (uint64_t)v10);
    sub_1000060E4(a1, (uint64_t)v12, v8, v10[0]);
    uint64_t v7 = v10[0];
    v10[0] = 0;
    sub_100006340((uint64_t)v10, 0);
  }
  return v7;
}

const void **sub_100006628(void *a1, uint64_t *a2, const void ***a3, uint64_t *a4, const void **a5)
{
  BOOL v9 = (const void **)(a1 + 1);
  if (a1 + 1 != a2 && !sub_10000613C((uint64_t)(a1 + 2), a5, (const void **)a2 + 4))
  {
    if (!sub_10000613C((uint64_t)(a1 + 2), (const void **)a2 + 4, a5))
    {
      *a3 = (const void **)a2;
      *a4 = (uint64_t)a2;
      return (const void **)a4;
    }
    a4 = a2 + 1;
    uint64_t v13 = a2[1];
    if (v13)
    {
      uint64_t v14 = (const void **)a2[1];
      do
      {
        CFIndex v15 = v14;
        uint64_t v14 = (const void **)*v14;
      }
      while (v14);
    }
    else
    {
      int v18 = (const void **)a2;
      do
      {
        CFIndex v15 = (const void **)v18[2];
        BOOL v17 = *v15 == v18;
        int v18 = v15;
      }
      while (!v17);
    }
    if (v15 != v9)
    {
      if (!sub_10000613C((uint64_t)(a1 + 2), a5, v15 + 4)) {
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
    uint64_t v12 = (const void **)a2;
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
  uint64_t v11 = (const void **)*a2;
  if (*a2)
  {
    do
    {
      uint64_t v12 = v11;
      uint64_t v11 = (const void **)v11[1];
    }
    while (v11);
  }
  else
  {
    int v16 = a2;
    do
    {
      uint64_t v12 = (const void **)v16[2];
      BOOL v17 = *v12 == v16;
      int v16 = (uint64_t *)v12;
    }
    while (v17);
  }
  if (sub_10000613C((uint64_t)(a1 + 2), v12 + 4, a5)) {
    goto LABEL_16;
  }
LABEL_28:

  return (const void **)sub_100006044((uint64_t)a1, a3, a5);
}

char *sub_1000067D4@<X0>(uint64_t a1@<X0>, long long *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  int v6 = (char *)operator new(0x58uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 16) = 0;
  __n128 result = sub_100006840(v6 + 32, a2);
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

void sub_100006828(_Unwind_Exception *a1)
{
  sub_100006340(v1, 0);
  _Unwind_Resume(a1);
}

char *sub_100006840(char *__dst, long long *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    sub_10000695C(__dst, *(void **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    *((void *)__dst + 2) = *((void *)a2 + 2);
    *(_OWORD *)__dst = v4;
  }
  int v5 = *((_DWORD *)a2 + 6);
  *((_DWORD *)__dst + 6) = v5;
  int v6 = __dst + 32;
  switch(v5)
  {
    case 1:
      *int v6 = *((unsigned char *)a2 + 32);
      break;
    case 2:
      *(void *)int v6 = *((void *)a2 + 4);
      break;
    case 3:
      if (*((char *)a2 + 55) < 0)
      {
        sub_10000695C(v6, *((void **)a2 + 4), *((void *)a2 + 5));
      }
      else
      {
        long long v7 = a2[2];
        *((void *)__dst + 6) = *((void *)a2 + 6);
        *(_OWORD *)int v6 = v7;
      }
      break;
    case 4:
      *(void *)int v6 = 0;
      *((void *)__dst + 5) = 0;
      *((void *)__dst + 6) = 0;
      sub_1000069FC(v6, *((long long **)a2 + 4), *((long long **)a2 + 5), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a2 + 5) - *((void *)a2 + 4)) >> 3));
      break;
    default:
      return __dst;
  }
  return __dst;
}

void sub_100006930(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void *sub_10000695C(unsigned char *__dst, void *__src, unint64_t a3)
{
  int v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8) {
      sub_100002A60();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    int v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000;
    *int v5 = v8;
    int v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }

  return memmove(v5, __src, a3 + 1);
}

char *sub_1000069FC(char *result, long long *a2, long long *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    sub_100006A84(result, a4);
    __n128 result = sub_100006B38((uint64_t)(v6 + 16), a2, a3, *((char **)v6 + 1));
    *((void *)v6 + 1) = result;
  }
  return result;
}

void sub_100006A64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  sub_100006408(&a9);
  _Unwind_Resume(a1);
}

char *sub_100006A84(void *a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    sub_100006AD8();
  }
  __n128 result = (char *)sub_100006AF0((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void sub_100006AD8()
{
}

void *sub_100006AF0(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    sub_100005F4C();
  }
  return operator new(24 * a2);
}

char *sub_100006B38(uint64_t a1, long long *a2, long long *a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v11 = __dst;
  uint64_t v12 = __dst;
  v9[0] = a1;
  v9[1] = &v11;
  v9[2] = &v12;
  char v10 = 0;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        sub_10000695C(v4, *(void **)v6, *((void *)v6 + 1));
        uint64_t v4 = v12;
      }
      else
      {
        long long v7 = *v6;
        *((void *)v4 + 2) = *((void *)v6 + 2);
        *(_OWORD *)uint64_t v4 = v7;
      }
      uint64_t v6 = (long long *)((char *)v6 + 24);
      v4 += 24;
      uint64_t v12 = v4;
    }
    while (v6 != a3);
  }
  char v10 = 1;
  sub_100006BF8((uint64_t)v9);
  return v4;
}

void sub_100006BE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_100006BF8(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_100006C30(a1);
  }
  return a1;
}

void sub_100006C30(uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 16);
  uint64_t v2 = **(void **)(a1 + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 - 1) < 0) {
      operator delete(*(void **)(v1 - 24));
    }
    v1 -= 24;
  }
}

void sub_100006C78(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_100006C78(a1, *a2);
    sub_100006C78(a1, a2[1]);
    sub_100006398((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

CFMutableDictionaryRef sub_100006CD4(char *__s2, unint64_t a2, const __CFAllocator *a3, uint64_t a4, void *a5)
{
  if (a5) {
    *a5 = 0;
  }
  CFMutableDictionaryRef v6 = 0;
  if (a2 < 4 || (__s2 & 3) != 0) {
    return v6;
  }
  if (*__s2 == 212)
  {
    unint64_t v52 = a2 >> 2;
    long long v7 = malloc_type_calloc(a2 >> 2, 8uLL, 0xC0040B8AA526DuLL);
  }
  else
  {
    if (strcmp(byte_10000A134, __s2)) {
      return 0;
    }
    unint64_t v52 = 0;
    long long v7 = 0;
  }
  CFStringRef v69 = 0;
  CFMutableDictionaryRef v6 = 0;
  int v8 = 0;
  uint64_t v9 = 0;
  CFStringRef v10 = 0;
  uint64_t v53 = 0;
  unsigned int v57 = 0;
  uint64_t v54 = 0;
  int v55 = 0;
  unsigned int v70 = 0;
  uint64_t v68 = 0;
  __src = 0;
  uint64_t v58 = __s2;
  int v71 = __s2 + 4;
  BOOL v56 = v7 != 0;
  uint64_t v11 = 4;
  v59 = v7;
LABEL_11:
  uint64_t v12 = v6;
  uint64_t v66 = v9;
  uint64_t v67 = v8;
  while (2)
  {
    CFStringRef v63 = v10;
    unint64_t v13 = v11 + 4;
    if (v11 + 4 > a2) {
      goto LABEL_93;
    }
    CFMutableDictionaryRef v6 = 0;
    uint64_t v14 = v71 + 4;
    int v15 = *(_DWORD *)v71;
    int v16 = *(_DWORD *)v71 & 0x7F000000;
    CFIndex v17 = *(_DWORD *)v71 & 0xFFFFFFLL;
    uint64_t v18 = (v17 + 3) >> 2;
    theSet = v12;
    switch((v16 - 0x1000000) >> 24)
    {
      case 0u:
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(a3, v17, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        CFMutableDictionaryRef v65 = 0;
        CFMutableDictionaryRef v6 = 0;
        BOOL v20 = v17 != 0;
        id v61 = Mutable;
        goto LABEL_17;
      case 1u:
        CFMutableDictionaryRef Mutable = CFArrayCreateMutable(a3, v17, &kCFTypeArrayCallBacks);
        id v61 = 0;
        CFMutableDictionaryRef v6 = 0;
        BOOL v20 = v17 != 0;
        CFMutableDictionaryRef v65 = Mutable;
        goto LABEL_17;
      case 2u:
        CFMutableDictionaryRef Mutable = CFSetCreateMutable(a3, v17, &kCFTypeSetCallBacks);
        CFMutableDictionaryRef v6 = Mutable;
        id v61 = 0;
        CFMutableDictionaryRef v65 = 0;
        BOOL v20 = v17 != 0;
LABEL_17:
        CFStringRef v10 = (const __CFString *)Mutable;
        BOOL v21 = v56;
        goto LABEL_37;
      case 3u:
        unint64_t v13 = v11 + 12;
        if (v11 + 12 > a2) {
          goto LABEL_93;
        }
        if (v17 < 0x21) {
          CFNumberType v22 = kCFNumberSInt32Type;
        }
        else {
          CFNumberType v22 = kCFNumberSInt64Type;
        }
        CFStringRef v10 = (const __CFString *)CFNumberCreate(a3, v22, v14);
        id v61 = 0;
        CFMutableDictionaryRef v65 = 0;
        CFMutableDictionaryRef v6 = 0;
        BOOL v20 = 0;
        BOOL v21 = 0;
        uint64_t v14 = v71 + 12;
        goto LABEL_37;
      case 7u:
        if (!v17) {
          goto LABEL_93;
        }
        LODWORD(v17) = v17 - 1;
        goto LABEL_25;
      case 8u:
LABEL_25:
        v13 += 4 * v18;
        if (v13 > a2) {
          goto LABEL_93;
        }
        CFIndex v23 = v17;
        if (v16 == 0x8000000)
        {
          if (v14[v17]) {
            goto LABEL_93;
          }
        }
        CFStringRef v10 = CFStringCreateWithBytes(a3, (const UInt8 *)v14, v17, 0x8000100u, 0);
        if (!v10)
        {
          CFStringRef v10 = CFStringCreateWithBytes(a3, (const UInt8 *)v14, v23, 0, 0);
          CStringPtr = CFStringGetCStringPtr(v10, 0);
          syslog(3, "FIXME: IOUnserialize has detected a string that is not valid UTF-8, \"%s\".", CStringPtr);
        }
LABEL_32:
        id v61 = 0;
        CFMutableDictionaryRef v65 = 0;
        CFMutableDictionaryRef v6 = 0;
        BOOL v20 = 0;
        BOOL v21 = 0;
        v14 += 4 * v18;
LABEL_37:
        unsigned int v25 = v70;
        uint64_t v26 = v68;
        if (!v10) {
          goto LABEL_93;
        }
        if (v70 < v68)
        {
          uint64_t v27 = __src;
LABEL_46:
          char v29 = 0;
          *(void *)&v27[8 * v25] = v10;
          int v28 = 1;
          uint64_t v68 = v26;
          __src = v27;
          long long v7 = v59;
          goto LABEL_47;
        }
        if (BYTE3(v68))
        {
          int v28 = 0;
          char v29 = 1;
          goto LABEL_47;
        }
        uint64_t v26 = (v68 + 64);
        unsigned int v30 = (char *)malloc_type_malloc(8 * v26, 0xC0040B8AA526DuLL);
        if (v30)
        {
          uint64_t v27 = v30;
          if (__src)
          {
            memmove(v30, __src, 8 * v68);
            free(__src);
          }
          unsigned int v25 = v70;
          goto LABEL_46;
        }
        int v28 = 0;
        char v29 = 1;
        long long v7 = v59;
        unsigned int v25 = v70;
LABEL_47:
        unsigned int v31 = v65;
        if (v7) {
          v7[(v71 - v58) >> 2] = v10;
        }
        if (v29) {
          goto LABEL_92;
        }
        unsigned int v32 = v25 + 1;
        if (v21)
        {
          uint64_t v11 = v13 + 4;
          if (v13 + 4 > a2)
          {
            unsigned int v70 = v32;
LABEL_92:
            CFRelease(v10);
LABEL_93:
            CFMutableDictionaryRef v6 = 0;
            goto LABEL_94;
          }
          int v71 = v14 + 4;
          int v28 = 1;
        }
        else
        {
LABEL_61:
          uint64_t v11 = v13;
          int v71 = v14;
        }
        CFStringRef v34 = v69;
        unsigned int v70 = v32;
        if (v66)
        {
          if (v69)
          {
            if (v10 != (const __CFString *)v66) {
              CFDictionarySetValue(v66, v69, v10);
            }
            CFStringRef v34 = 0;
          }
          else
          {
            CFTypeID TypeID = CFStringGetTypeID();
            CFStringRef v34 = v10;
            BOOL v36 = TypeID == CFGetTypeID(v10);
            long long v7 = v59;
            if (!v36) {
              goto LABEL_93;
            }
          }
        }
        else if (v67)
        {
          CFArrayAppendValue(v67, v10);
        }
        else if (theSet)
        {
          CFSetAddValue(theSet, v10);
        }
        else
        {
          unint64_t v37 = (unint64_t)v53 | (unint64_t)v63;
          uint64_t v53 = (__CFString *)v10;
          if (v37) {
            goto LABEL_93;
          }
        }
        if (!v28) {
          goto LABEL_93;
        }
        CFStringRef v69 = v34;
        if (v20)
        {
          uint64_t v12 = v6;
          uint64_t v9 = v61;
          uint64_t v66 = v61;
          uint64_t v67 = v31;
          if (v15 < 0) {
            continue;
          }
          unsigned int v43 = v57 + 1;
          if (v57 + 1 >= v54)
          {
            if (WORD1(v54)) {
              goto LABEL_93;
            }
            uint64_t v45 = (v54 + 64);
            v46 = malloc_type_malloc(8 * v45, 0xC0040B8AA526DuLL);
            if (!v46) {
              goto LABEL_93;
            }
            v44 = v46;
            if (v55)
            {
              memmove(v46, v55, 8 * v54);
              free(v55);
            }
          }
          else
          {
            v44 = v55;
            uint64_t v45 = v54;
          }
          int v8 = v31;
          ++v57;
          v44[v43] = v63;
          uint64_t v54 = v45;
          int v55 = v44;
          goto LABEL_11;
        }
        CFStringRef v10 = v63;
        uint64_t v12 = theSet;
        if ((v15 & 0x80000000) == 0) {
          continue;
        }
        unsigned int v38 = v57;
        if (v57)
        {
          CFStringRef v10 = (const __CFString *)*((void *)v55 + v57--);
          CFTypeID v39 = CFGetTypeID(*((CFTypeRef *)v55 + v38));
          CFTypeID v40 = CFDictionaryGetTypeID();
          uint64_t v12 = 0;
          uint64_t v66 = (__CFDictionary *)v10;
          uint64_t v67 = 0;
          if (v39 != v40)
          {
            CFTypeID v41 = CFArrayGetTypeID();
            uint64_t v12 = 0;
            uint64_t v66 = 0;
            uint64_t v67 = (__CFArray *)v10;
            if (v39 != v41)
            {
              CFTypeID v42 = CFSetGetTypeID();
              uint64_t v66 = 0;
              uint64_t v67 = 0;
              CFMutableDictionaryRef v6 = 0;
              uint64_t v12 = (__CFSet *)v10;
              if (v39 != v42) {
                goto LABEL_94;
              }
            }
          }
          continue;
        }
        CFMutableDictionaryRef v6 = (CFMutableDictionaryRef)v53;
LABEL_94:
        if (v68)
        {
          unsigned int v47 = v6 != 0;
          int v48 = v70 - v47;
          if (v70 > v47)
          {
            uint64_t v49 = (const void **)&__src[8 * (v6 != 0)];
            do
            {
              uint64_t v50 = *v49++;
              CFRelease(v50);
              --v48;
            }
            while (v48);
          }
          free(__src);
        }
        if (v54) {
          free(v55);
        }
        if (v7) {
          free(v7);
        }
        return v6;
      case 9u:
        v13 += 4 * v18;
        if (v13 > a2) {
          goto LABEL_93;
        }
        CFStringRef v10 = (const __CFString *)CFDataCreate(a3, (const UInt8 *)v14, v17);
        goto LABEL_32;
      case 0xAu:
        if (v17) {
          CFStringRef v10 = (const __CFString *)kCFBooleanTrue;
        }
        else {
          CFStringRef v10 = (const __CFString *)kCFBooleanFalse;
        }
        CFRetain(v10);
        id v61 = 0;
        CFMutableDictionaryRef v65 = 0;
        CFMutableDictionaryRef v6 = 0;
        BOOL v20 = 0;
        BOOL v21 = 0;
        goto LABEL_37;
      case 0xBu:
        if (v7)
        {
          unsigned int v32 = v70;
          if (v52 <= v17) {
            goto LABEL_93;
          }
          id v33 = (const __CFString **)&v7[v17];
        }
        else
        {
          unsigned int v32 = v70;
          if (v17 >= v70) {
            goto LABEL_93;
          }
          id v33 = (const __CFString **)&__src[8 * v17];
        }
        CFMutableDictionaryRef v6 = 0;
        CFStringRef v10 = *v33;
        if (!*v33) {
          goto LABEL_94;
        }
        BOOL v20 = 0;
        int v28 = 1;
        unsigned int v31 = 0;
        id v61 = 0;
        goto LABEL_61;
      default:
        goto LABEL_94;
    }
  }
}

CFMutableDictionaryRef sub_1000073EC(char *__s2, unint64_t a2, const __CFAllocator *a3, uint64_t a4, void *a5)
{
  if (a5) {
    *a5 = 0;
  }
  if (!__s2 || a2 < 4 || (a4 & 1) == 0 && strcmp(byte_10000A134, __s2) && *__s2 != 212) {
    return 0;
  }

  return sub_100006CD4(__s2, a2, a3, a4, a5);
}

uint64_t sub_10000748C(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = a2;
  io_iterator_t existing = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t MatchingServices = IOServiceGetMatchingServices(kIOMainPortDefault, (CFDictionaryRef)v3, &existing);
    if (MatchingServices)
    {
      NSLog(@"Matching returned error: %d", MatchingServices);
      uint64_t v6 = 0;
      goto LABEL_22;
    }
    while (1)
    {
      uint64_t v13 = IOIteratorNext(existing);
      if (!v13) {
        break;
      }
      v4[2](v4, v13);
      IOObjectRelease(v13);
    }
    IOObjectRelease(existing);
LABEL_19:
    uint64_t v6 = 1;
    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_19;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v3;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      CFStringRef v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = IOServiceGetMatchingServices(kIOMainPortDefault, (CFDictionaryRef)*(id *)(*((void *)&v15 + 1) + 8 * (void)v10), &existing);
        if (v11)
        {
          NSLog(@"Matching returned error: %d", v11);
          uint64_t v6 = 0;
          goto LABEL_21;
        }
        while (1)
        {
          uint64_t v12 = IOIteratorNext(existing);
          if (!v12) {
            break;
          }
          v4[2](v4, v12);
          IOObjectRelease(v12);
        }
        IOObjectRelease(existing);
        CFStringRef v10 = (char *)v10 + 1;
      }
      while (v10 != v8);
      id v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  uint64_t v6 = 1;
LABEL_21:

LABEL_22:
  return v6;
}

void sub_1000076D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100007714(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (a2) {
    BOOL v4 = v3 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4) {
    int v5 = &off_10000CE98;
  }
  else {
    int v5 = v3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v5 longLongValue];
    if (a2 == 16) {
      CFStringRef v7 = @"%#llx";
    }
    else {
      CFStringRef v7 = @"%lld";
    }
    uint64_t v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v6);
  }
  else
  {
    uint64_t v8 = +[NSString stringWithFormat:@"%@", v5];
  }
  uint64_t v9 = (void *)v8;

  return v9;
}

void sub_1000077F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100007804(uint64_t *a1)
{
  if (*((char *)a1 + 23) >= 0) {
    uint64_t v1 = a1;
  }
  else {
    uint64_t v1 = (uint64_t *)*a1;
  }
  uint64_t v2 = +[NSMutableString stringWithUTF8String:v1];
  id v29 = 0;
  id v3 = +[NSRegularExpression regularExpressionWithPattern:@"0[xX][0-9a-f]+" options:1 error:&v29];
  id v4 = v29;
  int v5 = 0;
  id v6 = 0;
  while (1)
  {
    CFStringRef v7 = [v3 firstMatchInString:v2 options:0 range:NSMakeRange([v2 length] - [v6 length], [v6 length])];

    if (!v7) {
      break;
    }
    id v8 = [v7 range];
    CFStringRef v10 = [v2 substringWithRange:v8, v9];
    uint64_t v11 = +[NSScanner scannerWithString:v10];

    uint64_t v28 = 0;
    [v11 scanHexLongLong:&v28];
    uint64_t v12 = +[NSString stringWithFormat:@"%llu", v28];
    id v13 = [v7 range];
    [v2 replaceCharactersInRange:v13 withString:v14];
    long long v15 = (char *)[v7 range];
    id v6 = &v15[(void)[v12 length]];

    int v5 = v7;
  }

  if (!v2 || ![v2 length])
  {
    long long v17 = 0;
    goto LABEL_19;
  }
  long long v16 = [v2 substringToIndex:1];
  if ([v16 isEqual:@"["])
  {

    goto LABEL_13;
  }
  long long v18 = [v2 substringToIndex:1];
  unsigned int v19 = [v18 isEqual:@"{"];

  if (v19)
  {
LABEL_13:
    BOOL v20 = [v2 dataUsingEncoding:4];
    id v27 = 0;
    BOOL v21 = +[NSJSONSerialization JSONObjectWithData:v20 options:1 error:&v27];
    id v22 = v27;

    long long v17 = v21;
    if (!v22) {
      goto LABEL_19;
    }
    goto LABEL_16;
  }
  id v22 = 0;
  BOOL v21 = 0;
LABEL_16:
  CFIndex v23 = [v2 dataUsingEncoding:4];
  id v26 = 0;
  long long v17 = +[NSPropertyListSerialization propertyListWithData:v23 options:0 format:0 error:&v26];
  id v24 = v26;

  if (v24) {
    NSLog(@"ERROR! Failed to parse property string [%@] JSON error: %@ Plist error: %@", v2, v22, v24);
  }

LABEL_19:

  return v17;
}

void sub_100007B28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100007BBC(unsigned __int8 **a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  if (v1 == *a1)
  {
    id v7 = 0;
  }
  else
  {
    uint64_t v4 = 0;
    do
    {
      if ((char)v2[23] < 0) {
        unint64_t v5 = *((void *)v2 + 1);
      }
      else {
        unint64_t v5 = v2[23];
      }
      v4 += (v5 >> 1) + (v5 & 1);
      v2 += 24;
    }
    while (v2 != v1);
    id v6 = objc_opt_new();
    [v6 setLength:v4];
    id v7 = v6;
    id v8 = [v7 mutableBytes];
    uint64_t v9 = *a1;
    CFStringRef v10 = a1[1];
    if (*a1 != v10)
    {
      uint64_t v11 = 0;
      do
      {
        if ((char)v9[23] < 0) {
          uint64_t v12 = *((void *)v9 + 1);
        }
        else {
          LODWORD(v12) = v9[23];
        }
        uint64_t v13 = (v12 - 1);
        if ((int)v12 >= 1)
        {
          unsigned int v14 = v12 + 1;
          while (1)
          {
            unsigned int v15 = v14 - 2;
            if (v14 == 2) {
              break;
            }
            long long v16 = v9;
            if ((char)v9[23] < 0) {
              long long v16 = *(unsigned __int8 **)v9;
            }
            int v17 = v16[v13];
            unsigned int v18 = v17 - 97;
            char v19 = v17 + 9;
            if ((v17 - 65) < 6) {
              LOBYTE(v17) = v17 + 9;
            }
            if (v18 <= 5) {
              LOBYTE(v17) = v19;
            }
            BOOL v20 = v9;
            if ((char)v9[23] < 0) {
              BOOL v20 = *(unsigned __int8 **)v9;
            }
            char v21 = v17 & 0xF;
            int v22 = v20[v14 - 3];
            unsigned int v23 = v22 - 97;
            char v24 = v22 + 9;
            if ((v22 - 65) < 6) {
              LOBYTE(v22) = v22 + 9;
            }
            if (v23 <= 5) {
              LOBYTE(v22) = v24;
            }
            v8[v11++] = v21 | (16 * v22);
            v13 -= 2;
            unsigned int v14 = v15;
            if (v15 <= 1) {
              goto LABEL_36;
            }
          }
          unsigned int v25 = v9;
          if ((char)v9[23] < 0) {
            unsigned int v25 = *(unsigned __int8 **)v9;
          }
          int v26 = *v25;
          unsigned int v27 = v26 - 97;
          char v28 = v26 + 9;
          if ((v26 - 65) < 6) {
            LOBYTE(v26) = v26 + 9;
          }
          if (v27 <= 5) {
            LOBYTE(v26) = v28;
          }
          v8[v11++] = v26 & 0xF;
        }
LABEL_36:
        v9 += 24;
      }
      while (v9 != v10);
    }
  }

  return v7;
}

void sub_100007D6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100007D80(const char *a1, unint64_t a2, int a3)
{
  CFStringRef errorString = 0;
  if (a2)
  {
    if (a3 == 2)
    {
      sub_100002388((uint64_t)a1, a2, 0, 0);
      return;
    }
    uint64_t v4 = (void *)IOCFUnserializeWithSize(a1, a2, kCFAllocatorDefault, 0, &errorString);
    unint64_t v5 = v4;
    if (v4)
    {
      switch(a3)
      {
        case 0:
          id v13 = 0;
          uint64_t v9 = +[NSPropertyListSerialization dataWithPropertyList:v4 format:100 options:0 error:&v13];
          id v7 = v13;
          if (v9) {
            printf("%.*s", (int)[v9 length], (const char *)[v9 bytes]);
          }
          else {
            NSLog(@"ERROR! Unable to convert to xml\n");
          }

          goto LABEL_26;
        case 1:
          if (+[NSJSONSerialization isValidJSONObject:v4])
          {
            CFStringRef v10 = +[NSJSONSerialization dataWithJSONObject:v5 options:1 error:0];
            uint64_t v11 = v10;
            if (v10)
            {
              unsigned int v12 = [v10 length];
              id v7 = v11;
              printf("%.*s\n", v12, (const char *)[v7 bytes]);
LABEL_26:

              break;
            }
          }
          NSLog(@"ERROR! Unable to convert to json\n");
          break;
        case 3:
          id v6 = [v4 description];
          id v7 = v6;
          if (v6) {
            id v8 = (const char *)[v6 UTF8String];
          }
          else {
            id v8 = "(blank)";
          }
          puts(v8);
          goto LABEL_26;
      }
    }
    else
    {
      NSLog(@"ERROR! Unable to unserialize object\n");
    }

    return;
  }

  puts("(blank)");
}

void sub_100007F94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100007FD0(io_registry_entry_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    CFProperty = (void *)IORegistryEntryCreateCFProperty(a1, @"role", 0, 0);
    CFStringRef v10 = CFProperty;
    v11[0] = @"IOPropertyMatch";
    CFStringRef v9 = @"role";
    id v8 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    v12[0] = v8;
    v12[1] = @"md-allocator";
    v11[1] = @"IOPropertyExistsMatch";
    v11[2] = @"IOProviderClass";
    void v12[2] = @"AFKMemoryDescriptorManager";
    id v5 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];
  }
  sub_10000748C(v5, v6);
}

void sub_1000080F8(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

uint64_t sub_100008138(uint64_t **a1)
{
  uint64_t v24 = 0;
  unsigned int v25 = &v24;
  uint64_t v26 = 0x2020000000;
  int v27 = 0;
  sub_100005E98(__p, "--matching");
  char v28 = __p;
  int v2 = *((_DWORD *)sub_100005F80(a1, (const void **)__p, (uint64_t)&unk_10000A130, (_OWORD **)&v28) + 14);
  if ((v23 & 0x80000000) == 0)
  {
    if (v2) {
      goto LABEL_3;
    }
LABEL_6:
    sub_100005E98(__p, "--role");
    char v28 = __p;
    int v5 = *((_DWORD *)sub_100005F80(a1, (const void **)__p, (uint64_t)&unk_10000A130, (_OWORD **)&v28) + 14);
    if (v23 < 0)
    {
      operator delete(__p[0]);
      if (v5)
      {
LABEL_8:
        sub_100005E98(__p, "--role");
        char v28 = __p;
        id v6 = sub_100005F80(a1, (const void **)__p, (uint64_t)&unk_10000A130, (_OWORD **)&v28);
        sub_100004C1C((int *)v6 + 14, 3u);
        id v7 = v6 + 4;
        if (*((char *)v6 + 87) < 0) {
          id v7 = (void *)*v7;
        }
        id v8 = +[NSString stringWithCString:v7 encoding:1];
        if (v23 < 0) {
          operator delete(__p[0]);
        }
        uint64_t v4 = IOServiceMatching("AFKEndpointInterface");
        CFStringRef v9 = +[NSMutableDictionary dictionaryWithObject:v8 forKey:@"role"];
        sub_100005E98(__p, "--name");
        char v28 = __p;
        int v10 = *((_DWORD *)sub_100005F80(a1, (const void **)__p, (uint64_t)&unk_10000A130, (_OWORD **)&v28) + 14);
        if (v23 < 0)
        {
          operator delete(__p[0]);
          if (v10) {
            goto LABEL_14;
          }
        }
        else if (v10)
        {
LABEL_14:
          sub_100005E98(__p, "--name");
          char v28 = __p;
          uint64_t v11 = sub_100005F80(a1, (const void **)__p, (uint64_t)&unk_10000A130, (_OWORD **)&v28);
          sub_100004C1C((int *)v11 + 14, 3u);
          unsigned int v12 = v11 + 4;
          if (*((char *)v11 + 87) < 0) {
            unsigned int v12 = (void *)*v12;
          }
          id v13 = +[NSString stringWithCString:v12 encoding:1];
          if (v23 < 0) {
            operator delete(__p[0]);
          }
          [v4 setObject:v13 forKey:@"IONameMatch"];

          goto LABEL_23;
        }
        [v9 setObject:&__kCFBooleanTrue forKey:@"system-service"];
LABEL_23:
        [v4 setObject:v9 forKey:@"IOPropertyMatch"];

        goto LABEL_24;
      }
    }
    else if (v5)
    {
      goto LABEL_8;
    }
    uint64_t v4 = 0;
    goto LABEL_24;
  }
  operator delete(__p[0]);
  if (!v2) {
    goto LABEL_6;
  }
LABEL_3:
  sub_100005E98(__p, "--matching");
  char v28 = __p;
  id v3 = sub_100005F80(a1, (const void **)__p, (uint64_t)&unk_10000A130, (_OWORD **)&v28);
  sub_100004C1C((int *)v3 + 14, 3u);
  uint64_t v4 = sub_100007804((uint64_t *)v3 + 8);
  if (v23 < 0) {
    operator delete(__p[0]);
  }
LABEL_24:
  sub_100005E98(__p, "FILENAME");
  char v28 = __p;
  int v14 = *((_DWORD *)sub_100005F80(a1, (const void **)__p, (uint64_t)&unk_10000A130, (_OWORD **)&v28) + 14);
  if (v23 < 0)
  {
    operator delete(__p[0]);
    if (v14) {
      goto LABEL_26;
    }
  }
  else if (v14)
  {
LABEL_26:
    sub_100005E98(__p, "FILENAME");
    char v28 = __p;
    unsigned int v15 = sub_100005F80(a1, (const void **)__p, (uint64_t)&unk_10000A130, (_OWORD **)&v28);
    sub_100004C1C((int *)v15 + 14, 3u);
    long long v16 = v15 + 4;
    if (*((char *)v15 + 87) < 0) {
      long long v16 = (void *)*v16;
    }
    if (v23 < 0) {
      operator delete(__p[0]);
    }
    BOOL v17 = 0;
    goto LABEL_35;
  }
  sub_100005E98(__p, "--reset");
  char v28 = __p;
  BOOL v17 = *((_DWORD *)sub_100005F80(a1, (const void **)__p, (uint64_t)&unk_10000A130, (_OWORD **)&v28) + 14) != 0;
  if (v23 < 0) {
    operator delete(__p[0]);
  }
  long long v16 = 0;
LABEL_35:
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000086BC;
  v20[3] = &unk_10000C6E0;
  BOOL v21 = v17;
  v20[4] = &v24;
  v20[5] = v16;
  sub_10000748C(v4, v20);
  uint64_t v18 = *((unsigned int *)v25 + 6);
  _Block_object_dispose(&v24, 8);

  return v18;
}

void sub_1000085F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,char a22)
{
  _Block_object_dispose(&a22, 8);
  _Unwind_Resume(a1);
}

BOOL sub_1000086BC(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 48)) {
    BOOL result = sub_100008714(a2);
  }
  else {
    BOOL result = sub_100008988(a2, *(void *)(a1 + 40));
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= result;
  return result;
}

BOOL sub_100008714(uint64_t a1)
{
  uint64_t v19 = AFKEndpointInterfaceDataQueueSizeKey;
  BOOL v20 = &off_10000CEB0;
  int v2 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  id v3 = +[AFKEndpointInterface withService:a1 properties:v2];

  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x2020000000;
  int v18 = 0;
  dispatch_queue_t v5 = dispatch_queue_create("afktool", 0);
  [v3 setDispatchQueue:v5];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  void v12[2] = sub_100008D40;
  void v12[3] = &unk_10000C558;
  int v14 = &v15;
  id v6 = v4;
  id v13 = v6;
  [v3 setResponseHandler:v12];
  [v3 activate:1];
  int v11 = 0;
  LODWORD(v10) = 0;
  uint64_t v7 = (uint64_t)[v3 enqueueCommand:213 timestamp:mach_continuous_time() inputBuffer:0 inputBufferSize:0 outputPayloadSize:16 context:&v11 options:v10];
  *((_DWORD *)v16 + 6) = v7;
  if (v7) {
    goto LABEL_5;
  }
  if (dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL))
  {
    uint64_t v7 = 3758097110;
    *((_DWORD *)v16 + 6) = -536870186;
LABEL_5:
    NSLog(@"ERROR!enqueueCommand:%x", v7);
    goto LABEL_6;
  }
  uint64_t v7 = *((unsigned int *)v16 + 6);
  if (v7) {
    goto LABEL_5;
  }
LABEL_6:
  [v3 cancel];
  BOOL v8 = *((_DWORD *)v16 + 6) != 0;

  _Block_object_dispose(&v15, 8);
  return v8;
}

void sub_10000892C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, ...)
{
  va_start(va, a10);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_100008988(uint64_t a1, uint64_t a2)
{
  uint64_t v29 = AFKEndpointInterfaceDataQueueSizeKey;
  unsigned int v30 = &off_10000CEB0;
  dispatch_semaphore_t v4 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
  dispatch_queue_t v5 = +[AFKEndpointInterface withService:a1 properties:v4];

  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  int v28 = 0;
  dispatch_queue_t v7 = dispatch_queue_create("afktool", 0);
  id v8 = objc_alloc_init((Class)NSMutableData);
  [v5 setDispatchQueue:v7];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100008D54;
  v22[3] = &unk_10000C558;
  uint64_t v24 = &v25;
  CFStringRef v9 = v6;
  char v23 = v9;
  [v5 setResponseHandler:v22];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100008D68;
  v20[3] = &unk_10000C708;
  id v10 = v8;
  id v21 = v10;
  [v5 setReportHandler:v20];
  [v5 activate:1];
  int v19 = 0;
  LODWORD(v17) = 0;
  id v11 = [v5 enqueueCommand:211 timestamp:mach_continuous_time() inputBuffer:0 inputBufferSize:0 outputPayloadSize:16 context:&v19 options:v17];
  *((_DWORD *)v26 + 6) = v11;
  if (v11)
  {
    NSLog(@"ERROR!enqueueCommand:%x", v11);
  }
  else if (dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL))
  {
    NSLog(@"ERROR!enqueueCommand: timeout");
    *((_DWORD *)v26 + 6) = -536870186;
  }
  else
  {
    unsigned int v12 = +[NSString stringWithUTF8String:a2];
    id v18 = 0;
    unsigned __int8 v13 = [v10 writeToFile:v12 options:1 error:&v18];
    id v14 = v18;

    if ((v13 & 1) == 0)
    {
      NSLog(@"ERROR! Saving codecoverage data to file:%@", v14);
      *((_DWORD *)v26 + 6) = -536870212;
    }
  }
  [v5 cancel];
  BOOL v15 = *((_DWORD *)v26 + 6) != 0;

  _Block_object_dispose(&v25, 8);
  return v15;
}

void sub_100008CB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, ...)
{
  va_start(va, a16);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_100008D40(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a4;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t sub_100008D54(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a4;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id *sub_100008D68(id *result, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a3 == 212) {
    return (id *)[result[4] appendBytes:a5 length:a6];
  }
  return result;
}

uint64_t start(int a1, uint64_t a2)
{
  sub_100005E98(v13, "Usage: afktool (--help | -v...)\n  afktool registry (--role=<role> [--name=<name>] | --matching=<matching>) [-x]  [--archive [--format=<fmt>] [--path=<dir>]] [--buffer=<size>]\n\nOptions:\n  -r --role=<role>           IOP  role\n  -a --archive               Archive output\n  -x --hex                   Output numbers as hexidecimal. This option does not apply when creating an archive from ioreg.\n  --buffer=<value>           The size of the command buffer to use. By default this is 64KB.\n  -f --format=<fmt>          Archive or response output format (xml,bin)\n  -p --path=<dir>            Save output to files at this path instead of stdout (1 file per role)\n  -m --matching=<matching>   Service matching dictionary in json or xml format");
  v11[0] = 0;
  v11[1] = 0;
  uint64_t v12 = 0;
  sub_100008FCC(v11, (char **)(a2 + 8), (char **)(a2 + 8 * a1), (8 * a1 - 8) >> 3);
  sub_100005E98(__p, "AppleFirmwareKit ToolvRC_ProjectBuildVersion Nov 10 2024 02:15:35");
  docopt::docopt();
  if (v10 < 0) {
    operator delete(__p[0]);
  }
  __p[0] = v11;
  sub_100006408((void ***)__p);
  if (v14 < 0) {
    operator delete(v13[0]);
  }
  sub_100005E98(v13, "registry");
  v11[0] = v13;
  if (*((_DWORD *)sub_100005F80(v15, (const void **)v13, (uint64_t)&unk_10000A130, (_OWORD **)v11) + 14))
  {
    sub_100005E98(v11, "registry");
    __p[0] = v11;
    dispatch_semaphore_t v4 = (int *)sub_100005F80(v15, (const void **)v11, (uint64_t)&unk_10000A130, (_OWORD **)__p);
    sub_100004C1C(v4 + 14, 1u);
    BOOL v5 = *((unsigned char *)v4 + 64) != 0;
    if (SHIBYTE(v12) < 0) {
      operator delete(v11[0]);
    }
  }
  else
  {
    BOOL v5 = 0;
  }
  if (v14 < 0)
  {
    operator delete(v13[0]);
    if (v5) {
      goto LABEL_11;
    }
LABEL_13:
    uint64_t v6 = 1;
    goto LABEL_14;
  }
  if (!v5) {
    goto LABEL_13;
  }
LABEL_11:
  sub_1000064AC((uint64_t *)v8, (const void ***)v15);
  uint64_t v6 = sub_100002B08(v8);
  sub_100006C78((uint64_t)v8, v8[1]);
LABEL_14:
  sub_100006C78((uint64_t)v15, v15[1]);
  return v6;
}

void sub_100008F38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  sub_100006C78((uint64_t)&a9, a10);
  sub_100006C78(v26 - 48, *(void **)(v26 - 40));
  _Unwind_Resume(a1);
}

void *sub_100008FCC(void *result, char **a2, char **a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    sub_100006A84(result, a4);
    BOOL result = sub_100009054((uint64_t)(v6 + 2), a2, a3, (void *)v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_100009034(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  sub_100006408(&a9);
  _Unwind_Resume(a1);
}

void *sub_100009054(uint64_t a1, char **a2, char **a3, void *a4)
{
  dispatch_semaphore_t v4 = a4;
  uint64_t v10 = a4;
  id v11 = a4;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  char v9 = 0;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      sub_100005E98(v4, *v6++);
      dispatch_semaphore_t v4 = v11 + 3;
      v11 += 3;
    }
    while (v6 != a3);
  }
  char v9 = 1;
  sub_100006BF8((uint64_t)v8);
  return v4;
}

void sub_1000090E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_100009108(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "0x%llx: AFKIOCFUnserializeWithSize failed", (uint8_t *)&v2, 0xCu);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
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

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return _CFSetCreateMutable(allocator, capacity, callBacks);
}

CFTypeID CFSetGetTypeID(void)
{
  return _CFSetGetTypeID();
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return _CFStringCreateWithBytes(alloc, bytes, numBytes, encoding, isExternalRepresentation);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

CFTypeRef IOCFUnserializeWithSize(const char *buffer, size_t bufferSize, CFAllocatorRef allocator, CFOptionFlags options, CFStringRef *errorString)
{
  return _IOCFUnserializeWithSize(buffer, bufferSize, allocator, options, errorString);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return _IORegistryEntryGetRegistryEntryID(entry, entryID);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return _IOServiceGetMatchingServices(mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

void NSLog(NSString *format, ...)
{
}

uint64_t _AFKUserLog()
{
  return __AFKUserLog();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t docopt::docopt()
{
  return docopt::docopt();
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

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return std::runtime_error::runtime_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return std::string::append(this, __s);
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

unint64_t std::stoul(const std::string *__str, size_t *__idx, int __base)
{
  return std::stoul(__str, __idx, __base);
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
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

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
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

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return ___maskrune(a1, a2);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
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

void exit(int a1)
{
}

void free(void *a1)
{
}

uint64_t mach_continuous_time(void)
{
  return _mach_continuous_time();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
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

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int putchar(int a1)
{
  return _putchar(a1);
}

int puts(const char *a1)
{
  return _puts(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

void syslog(int a1, const char *a2, ...)
{
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return [a1 close];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 objectEnumerator];
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return [a1 open];
}

id objc_msgSend_range(void *a1, const char *a2, ...)
{
  return [a1 range];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return [a1 writeToFile:x0 options:x1 error:x2];
}