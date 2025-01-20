uint64_t sub_10000492C()
{
  uint64_t vars8;

  qword_1000A5F10 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

id sub_100004D18()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_1000A5F20;
  uint64_t v7 = qword_1000A5F20;
  if (!qword_1000A5F20)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100006030;
    v3[3] = &unk_10008CD18;
    v3[4] = &v4;
    sub_100006030((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_100004DE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100004E8C(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v4 = 0;
  unsigned __int8 v2 = [v1 _onQueue_refreshPersonaInformationWithError:&v4];
  id v3 = v4;
  if ((v2 & 1) == 0 && (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)) {
    MOLogWrite();
  }
}

void sub_100004FA0(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v4 = 0;
  unsigned __int8 v2 = [v1 _onQueue_refreshPersonaInformationWithError:&v4];
  id v3 = v4;
  if ((v2 & 1) == 0 && (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)) {
    MOLogWrite();
  }
}

void sub_1000050B4(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v4 = 0;
  unsigned __int8 v2 = [v1 _onQueue_refreshPersonaInformationWithError:&v4];
  id v3 = v4;
  if ((v2 & 1) == 0 && (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)) {
    MOLogWrite();
  }
}

void sub_1000052D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000052F8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100005308(uint64_t a1)
{
}

void sub_100005310(uint64_t a1)
{
  unsigned __int8 v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v3 + 40);
  unsigned int v4 = [v2 _onQueue_refreshPersonaInformationWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    v5 = [*(id *)(a1 + 32) personaAttributesMap];
    uint64_t v6 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];

    if (v6)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
    else
    {
      uint64_t v8 = sub_100014A08((uint64_t)"-[MIUserManagement isKnownPersonaUniqueString:error:]_block_invoke", 173, MIInstallerErrorDomain, 4, 0, 0, @"Client provided persona %@ is not among available personas on the system", v7, *(void *)(a1 + 40));
      uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
      v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;
    }
  }
}

void sub_10000557C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1000055A0(void *a1)
{
  unsigned __int8 v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v3 + 40);
  unsigned int v4 = [v2 _onQueue_refreshPersonaInformationWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    v5 = (void *)a1[4];
    uint64_t v6 = (void *)v5[3];
    if (v6)
    {
      id v7 = v6;
      id v8 = [v5 personaAttributesMap];
      uint64_t v9 = [v8 objectForKeyedSubscript:v7];
      uint64_t v10 = [v9 bundleIDs];
      uint64_t v11 = *(void *)(a1[6] + 8);
      v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;
    }
    else
    {
      id v8 = 0;
      uint64_t v13 = objc_opt_new();
      uint64_t v14 = *(void *)(a1[6] + 8);
      uint64_t v9 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
  }
}

void sub_1000058F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_100005928(uint64_t a1)
{
  unsigned __int8 v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id v11 = *(id *)(v3 + 40);
  unsigned __int8 v4 = [v2 _onQueue_refreshPersonaInformationWithError:&v11];
  objc_storeStrong((id *)(v3 + 40), v11);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    v5 = [*(id *)(a1 + 32) personaAttributesMap];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100005A1C;
    v8[3] = &unk_10008CCC8;
    id v6 = *(id *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 64);
    id v9 = v6;
    uint64_t v10 = v7;
    [v5 enumerateKeysAndObjectsUsingBlock:v8];
  }
}

void sub_100005A1C(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v10 = a2;
  id v8 = a3;
  if (((unint64_t)[v8 personaType] & 0xFFFFFFFFFFFFFFFBLL) == 2)
  {
    id v9 = [v8 bundleIDs];
    if ([v9 containsObject:*(void *)(a1 + 32)])
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
      if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) >= 7) {
        MOLogWrite();
      }
      *a4 = 1;
    }
  }
}

void sub_100005E50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_100005E74(uint64_t a1)
{
  unsigned __int8 v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v3 + 40);
  unsigned int v4 = [v2 _onQueue_refreshPersonaInformationWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    v5 = [*(id *)(a1 + 32) personaAttributesMap];
    id v6 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];

    if (v6)
    {
      id v8 = [v6 bundleIDs];
      id v9 = [v8 copy];
      uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
      id v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;
    }
    else
    {
      uint64_t v12 = sub_100014A08((uint64_t)"-[MIUserManagement bundleIDsAssociatedWithPersonaUniqueString:error:]_block_invoke", 294, MIInstallerErrorDomain, 4, *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40), 0, @"Failed to find persona %@ when checking associated bundleIDs for it", v7, *(void *)(a1 + 40));
      uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
      id v8 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;
    }
  }
}

Class sub_100006030(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_1000A5F28)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_10000615C;
    v3[4] = &unk_10008CC28;
    void v3[5] = v3;
    long long v4 = off_10008CD38;
    uint64_t v5 = 0;
    qword_1000A5F28 = _sl_dlopen();
  }
  if (!qword_1000A5F28) {
    sub_1000584C8(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("UMUserManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_100058548();
  }
  qword_1000A5F20 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_10000615C()
{
  uint64_t result = _sl_dlopen();
  qword_1000A5F28 = result;
  return result;
}

id sub_1000067D8()
{
  uint64_t path = container_error_get_path();
  if (path)
  {
    id v1 = +[NSString stringWithFileSystemRepresentation:path];
  }
  else
  {
    id v1 = @"Failed to read container error path";
  }
  NSErrorUserInfoKey v4 = NSFilePathErrorKey;
  uint64_t v5 = v1;
  unsigned __int8 v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

__CFString *sub_100006A0C()
{
  v0 = (void *)container_copy_unlocalized_description();
  if (v0)
  {
    id v1 = +[NSString stringWithUTF8String:v0];
  }
  else
  {
    id v1 = @"<No container description>";
  }
  free(v0);

  return v1;
}

void sub_100007ABC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
}

uint64_t sub_100007B14(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100007B24(uint64_t a1)
{
}

uint64_t sub_100007B2C(uint64_t a1, uint64_t a2)
{
  id v11 = 0;
  id v5 = [objc_alloc((Class)objc_opt_class()) initWithContainer:a2 error:&v11];
  id v6 = v11;
  id v7 = v11;
  if (v5)
  {
    uint64_t v8 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
    {
      uint64_t v10 = sub_100006A0C();
      MOLogWrite();
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v6);
    uint64_t v8 = 0;
  }

  return v8;
}

void sub_100007EB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100007EC8(uint64_t a1, uint64_t a2)
{
  return 1;
}

uint64_t sub_100008B10(const char *a1)
{
  size_t size = 0;
  uint64_t v15 = 0;
  int v2 = open(a1, 256);
  if (v2 < 0)
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
    {
      id v6 = __error();
      strerror(*v6);
      MOLogWrite();
    }
    NSErrorUserInfoKey v4 = 0;
    goto LABEL_12;
  }
  int v3 = v2;
  if (fgetxattr(v2, "com.apple.installd.hidden_archs_fat_header", 0, 0, 0, 0) != -1)
  {
    if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 5) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if (sub_100058138(v3, &v15, &size))
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
    {
      id v7 = __error();
      strerror(*v7);
      MOLogWrite();
    }
    uint64_t v5 = 0;
    NSErrorUserInfoKey v4 = 0;
    goto LABEL_32;
  }
  if (size)
  {
    NSErrorUserInfoKey v4 = malloc_type_malloc(size, 0x87799A7EuLL);
    *__error() = 0;
    size_t v8 = size;
    if (v8 != pread(v3, v4, size, 0))
    {
      if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3) {
        goto LABEL_31;
      }
      goto LABEL_30;
    }
    close(v3);
    int v9 = open(a1, 258);
    if ((v9 & 0x80000000) == 0)
    {
      int v3 = v9;
      if (fsetxattr(v9, "com.apple.installd.hidden_archs_fat_header", v4, size, 0, 2))
      {
        if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3) {
          goto LABEL_31;
        }
      }
      else
      {
        *__error() = 0;
        size_t v13 = size;
        if (v13 == pwrite(v3, v15, size, 0))
        {
          if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) >= 7) {
            MOLogWrite();
          }
          goto LABEL_7;
        }
        if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3)
        {
LABEL_31:
          uint64_t v5 = 0;
          goto LABEL_32;
        }
      }
LABEL_30:
      uint64_t v10 = __error();
      strerror(*v10);
      MOLogWrite();
      goto LABEL_31;
    }
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
    {
      uint64_t v12 = __error();
      strerror(*v12);
      MOLogWrite();
    }
LABEL_12:
    uint64_t v5 = 0;
    goto LABEL_33;
  }
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) < 7) {
    goto LABEL_6;
  }
LABEL_5:
  MOLogWrite();
LABEL_6:
  NSErrorUserInfoKey v4 = 0;
LABEL_7:
  uint64_t v5 = 1;
LABEL_32:
  close(v3);
LABEL_33:
  if (v15) {
    free(v15);
  }
  if (v4) {
    free(v4);
  }
  return v5;
}

uint64_t sub_100008EE8(const char *a1, char *a2, unsigned char *a3)
{
  *a3 = 0;
  int v5 = open(a1, 256);
  if ((v5 & 0x80000000) == 0)
  {
    int v6 = v5;
    ssize_t v7 = fgetxattr(v5, "com.apple.installd.hidden_archs_fat_header", 0, 0, 0, 0);
    if (v7 < 0)
    {
      if (*__error() == 93)
      {
        int v9 = 0;
        goto LABEL_17;
      }
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
      {
        uint64_t v16 = __error();
        strerror(*v16);
        MOLogWrite();
      }
LABEL_32:
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
        MOLogWrite();
      }
      int v9 = 0;
LABEL_36:
      uint64_t v14 = 0;
LABEL_37:
      int v12 = v6;
      goto LABEL_38;
    }
    size_t v8 = v7;
    int v9 = malloc_type_malloc(v7, 0x2907A5C4uLL);
    ssize_t v10 = fgetxattr(v6, "com.apple.installd.hidden_archs_fat_header", v9, v8, 0, 0);
    if (v10 < 0)
    {
      if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3)
      {
LABEL_27:
        if (v9) {
          free(v9);
        }
        goto LABEL_32;
      }
      uint64_t v15 = __error();
      strerror(*v15);
    }
    else
    {
      if (v8 == v10)
      {
        if (v8)
        {
          int v11 = mkstemp(a2);
          if (v11 != -1)
          {
            int v12 = v11;
            if (fcopyfile(v6, v11, 0, 0xAu))
            {
              if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3) {
                goto LABEL_53;
              }
            }
            else
            {
              *__error() = 0;
              if (v8 == pwrite(v12, v9, v8, 0))
              {
                if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) >= 7) {
                  MOLogWrite();
                }
                uint64_t v14 = 1;
                *a3 = 1;
LABEL_54:
                close(v6);
                if (v12 < 0)
                {
LABEL_39:
                  if (v9) {
                    free(v9);
                  }
                  return v14;
                }
LABEL_38:
                close(v12);
                goto LABEL_39;
              }
              if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3)
              {
LABEL_53:
                uint64_t v14 = 0;
                goto LABEL_54;
              }
            }
            v19 = __error();
            strerror(*v19);
            MOLogWrite();
            goto LABEL_53;
          }
          if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
          {
            v18 = __error();
            strerror(*v18);
            MOLogWrite();
          }
          goto LABEL_36;
        }
LABEL_17:
        if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) >= 7) {
          MOLogWrite();
        }
        uint64_t v14 = 1;
        goto LABEL_37;
      }
      if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3) {
        goto LABEL_27;
      }
    }
    MOLogWrite();
    goto LABEL_27;
  }
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
  {
    size_t v13 = __error();
    strerror(*v13);
    MOLogWrite();
  }
  return 0;
}

uint64_t sub_10000930C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, CFErrorRef *a10)
{
  uint64_t v10 = __chkstk_darwin();
  CFArrayRef v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v25 = (char *)v10;
  bzero(to, 0x400uLL);
  bzero(v283, 0x400uLL);
  bzero(&v281, 0x410uLL);
  v280[0] = v25;
  v280[1] = 0;
  v26 = fts_open_b(v280, 85, &stru_10008CDC0);
  if (!v26)
  {
    v41 = __error();
    strerror(*v41);
    CFErrorRef v46 = sub_10000A9AC("hardlink_copy_hierarchy", 746, v42, v43, 0, v44, @"fts_open of %s failed: %s", v45, (char)v25);
    goto LABEL_24;
  }
  v27 = v26;
  if (!v22)
  {
    bzero(cf, 0x400uLL);
    if ((unint64_t)__strlcpy_chk() < 0x400)
    {
      LOWORD(v245.st_dev) = 0;
      *(void *)__str = 0;
      if ((sub_10000AD9C((const char *)cf, v283, (mode_t *)&v245, (CFErrorRef *)__str) & 1) == 0)
      {
        CFErrorRef v46 = sub_10000A9AC("hardlink_copy_hierarchy", 786, v55, v56, *(const void **)__str, v57, @"Failed to realpath parent of %s", v58, (char)cf);
        CFErrorRef v64 = *(CFErrorRef *)__str;
        if (!*(void *)__str) {
          goto LABEL_23;
        }
        goto LABEL_22;
      }
      if (!LOWORD(v245.st_dev) || (v245.st_dev & 0xF000) == 0x4000)
      {
        v83 = 0;
        BOOL v244 = 0;
        goto LABEL_41;
      }
      CFErrorRef v54 = sub_10000A9AC("hardlink_copy_hierarchy", 792, v55, v56, 0, v57, @"Entity exists at %s but it's not a directory", v58, (char)v283);
      goto LABEL_14;
    }
    CFStringRef v51 = @"Destination path was too long";
    int v52 = 779;
LABEL_13:
    CFErrorRef v54 = sub_10000A9AC("hardlink_copy_hierarchy", v52, v47, v48, 0, v49, v51, v50, (char)fts_path);
LABEL_14:
    CFErrorRef v46 = v54;
    goto LABEL_23;
  }
  if (!realpath_DARWIN_EXTSN(v24, v283))
  {
    v53 = __error();
    strerror(*v53);
    LOBYTE(fts_path) = (_BYTE)v24;
    CFStringRef v51 = @"realpath of '%s' failed at element '%s': %s";
    int v52 = 752;
    goto LABEL_13;
  }
  memset(&v245, 0, sizeof(v245));
  int v28 = open(v22, 256);
  if (v28 < 0)
  {
    v59 = __error();
    strerror(*v59);
    CFErrorRef v36 = sub_10000A9AC("open_delta_manifest", 416, v60, v61, 0, v62, @"Could not open %s: %s", v63, (char)v22);
LABEL_20:
    CFErrorRef v46 = sub_10000A9AC("hardlink_copy_hierarchy", 758, v37, v38, v36, v39, @"Failed to open manifest %s", v40, (char)v22);
    if (v36)
    {
      CFErrorRef v64 = v36;
LABEL_22:
      CFRelease(v64);
    }
LABEL_23:
    fts_close(v27);
    goto LABEL_24;
  }
  int v29 = v28;
  if (fstat(v28, &v245))
  {
    v30 = __error();
    strerror(*v30);
    CFErrorRef v35 = sub_10000A9AC("open_delta_manifest", 421, v31, v32, 0, v33, @"Could not stat %s: %s", v34, (char)v22);
LABEL_7:
    CFErrorRef v36 = v35;
LABEL_8:
    close(v29);
    goto LABEL_20;
  }
  v66 = mmap(0, v245.st_size, 1, 1026, v29, 0);
  if (v66 == (void *)-1)
  {
    v160 = __error();
    strerror(*v160);
    CFErrorRef v35 = sub_10000A9AC("open_delta_manifest", 435, v161, v162, 0, v163, @"Failed to map file at %s; error %s",
            v164,
            (char)v22);
    goto LABEL_7;
  }
  v243 = v66;
  if (madvise(v66, v245.st_size, 2) && (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3))
  {
    v67 = __error();
    LOBYTE(fts_path) = strerror(*v67);
    MOLogWrite();
  }
  v68 = malloc_type_calloc(1uLL, 0x18uLL, 0x1010040113C0ABBuLL);
  if (!v68)
  {
    CFErrorRef v36 = sub_10000A9AC("open_delta_manifest", 446, v69, v70, 0, v71, @"Failed to allocate command stream object", v72, (char)fts_path);
    munmap(v243, v245.st_size);
    goto LABEL_8;
  }
  v73 = v68;
  void *v68 = v243;
  v68[1] = v245.st_size;
  v68[2] = 0;
  long long v323 = 0u;
  long long v322 = 0u;
  long long v321 = 0u;
  long long v320 = 0u;
  long long v319 = 0u;
  long long v318 = 0u;
  long long v317 = 0u;
  long long v316 = 0u;
  long long v315 = 0u;
  long long v314 = 0u;
  long long v313 = 0u;
  long long v312 = 0u;
  long long v311 = 0u;
  long long v310 = 0u;
  long long v309 = 0u;
  long long v308 = 0u;
  long long v307 = 0u;
  long long v306 = 0u;
  long long v305 = 0u;
  long long v304 = 0u;
  long long v303 = 0u;
  long long v302 = 0u;
  long long v301 = 0u;
  long long v300 = 0u;
  long long v299 = 0u;
  long long v298 = 0u;
  long long v297 = 0u;
  long long v296 = 0u;
  long long v295 = 0u;
  long long v294 = 0u;
  long long v293 = 0u;
  *(_OWORD *)cf = 0u;
  long long v278 = 0u;
  long long v279 = 0u;
  long long v276 = 0u;
  long long v277 = 0u;
  long long v274 = 0u;
  long long v275 = 0u;
  long long v272 = 0u;
  long long v273 = 0u;
  long long v270 = 0u;
  long long v271 = 0u;
  long long v268 = 0u;
  long long v269 = 0u;
  long long v266 = 0u;
  long long v267 = 0u;
  long long v264 = 0u;
  long long v265 = 0u;
  long long v262 = 0u;
  long long v263 = 0u;
  long long v260 = 0u;
  long long v261 = 0u;
  long long v258 = 0u;
  long long v259 = 0u;
  long long v256 = 0u;
  long long v257 = 0u;
  long long v254 = 0u;
  long long v255 = 0u;
  long long v252 = 0u;
  long long v253 = 0u;
  long long v250 = 0u;
  long long v251 = 0u;
  *(_OWORD *)__str = 0u;
  long long v249 = 0u;
  __int16 v247 = 0;
  int v246 = 0;
  __int16 v291 = 0;
  uint64_t v290 = 0;
  if ((sub_10000B0D8(v68, 0, (uint64_t)&v246, 6uLL) & 1) == 0)
  {
    CFStringRef v165 = @"Failed to read magic";
    int v166 = 299;
LABEL_155:
    CFErrorRef v78 = sub_10000A9AC("validate_stream", v166, v74, v75, 0, v76, v165, v77, (char)fts_path);
    goto LABEL_156;
  }
  if (v246 ^ 0x44617069 | v247)
  {
    CFErrorRef v78 = sub_10000A9AC("validate_stream", 305, v74, v75, 0, v76, @"Stream had invalid magic: %s", v77, (char)&v246);
LABEL_156:
    CFErrorRef v167 = v78;
LABEL_157:
    CFErrorRef v36 = sub_10000A9AC("open_delta_manifest", 456, v79, v80, v167, v81, @"Invalid manifest file at %s", v82, (char)v22);
    if (v167) {
      CFRelease(v167);
    }
    munmap(v243, v245.st_size);
    free(v73);
    goto LABEL_8;
  }
  if ((sub_10000B0D8(v73, 0, (uint64_t)&v290, 0xAuLL) & 1) == 0)
  {
    CFStringRef v165 = @"Failed to read version from manifest header";
    int v166 = 310;
    goto LABEL_155;
  }
  uint64_t v169 = strtol((const char *)&v290, 0, 10);
  if ((unint64_t)(v169 - 4) <= 0xFFFFFFFFFFFFFFFCLL)
  {
    CFErrorRef v78 = sub_10000A9AC("validate_stream", 318, v170, v171, 0, v172, @"Manifest had invalid version: %ld; expected 1, 2, or 3",
            v173,
            v169);
    goto LABEL_156;
  }
  uint64_t v242 = v169;
  if ((sub_10000B0D8(v73, 0, (uint64_t)cf, 0x200uLL) & 1) == 0)
  {
    CFStringRef v165 = @"Failed to read manifest source version";
    int v166 = 323;
    goto LABEL_155;
  }
  v240 = v73;
  if (v20) {
    v176 = v18;
  }
  else {
    v176 = "";
  }
  if (v20) {
    v177 = v20;
  }
  else {
    v177 = "0";
  }
  if (v20) {
    v178 = " ";
  }
  else {
    v178 = "";
  }
  if (v176) {
    v179 = v176;
  }
  else {
    v179 = "";
  }
  if (snprintf(__str, 0x200uLL, "%s%s%s", v177, v178, v179) > 0x1FF)
  {
    CFErrorRef v184 = sub_10000A9AC("validate_stream", 350, v180, v181, 0, v182, @"Incoming expected source version string \"%s%s%s\" was too long", v183, (char)v177);
LABEL_227:
    CFErrorRef v167 = v184;
LABEL_228:
    v73 = v240;
    goto LABEL_157;
  }
  for (i = __str; *i == 10; ++i)
  {
    char *i = 32;
LABEL_223:
    ;
  }
  if (*i) {
    goto LABEL_223;
  }
  if (strcmp(__str, (const char *)cf))
  {
    fts_uint64_t path = (std::__fs::filesystem::path *)cf;
    CFStringRef v206 = @"Got manifest for version \"%s\", but expected version \"%s\"";
    int v207 = 357;
    goto LABEL_226;
  }
  if (v242 < 2) {
    goto LABEL_249;
  }
  char v289 = 0;
  long long v288 = 0u;
  long long v287 = 0u;
  long long v286 = 0u;
  *(_OWORD *)v285 = 0u;
  if (!sub_10000B0D8(v240, 0, (uint64_t)v285, 0x41uLL))
  {
    CFStringRef v206 = @"Failed to read stream";
    int v207 = 375;
LABEL_226:
    CFErrorRef v184 = sub_10000A9AC("validate_stream", v207, v202, v203, 0, v204, v206, v205, (char)fts_path);
    goto LABEL_227;
  }
  if (!v16)
  {
    CFStringRef v206 = @"expected_infoplisthash is NULL";
    int v207 = 371;
    goto LABEL_226;
  }
  if (memcmp(v16, v285, 0x41uLL))
  {
    CFStringRef v206 = @"Compare of info plist hash failed";
    int v207 = 367;
    goto LABEL_226;
  }
  if ((unint64_t)v242 >= 3)
  {
    v285[0] = 0;
    if ((sub_10000B150(v240, v12, (CFErrorRef *)v285) & 1) == 0)
    {
      CFErrorRef v167 = sub_10000A9AC("validate_stream", 384, v225, v226, v285[0], v227, @"Failed to validate supported devices", v228, (char)fts_path);
      if (v285[0]) {
        CFRelease(v285[0]);
      }
      goto LABEL_228;
    }
  }
LABEL_249:
  close(v29);
  cf[0] = 0;
  if ((sub_10000AB3C(v240, &v281, (CFErrorRef *)cf, v229, v230, v231, v232, v233) & 1) == 0)
  {
    CFErrorRef v46 = sub_10000A9AC("hardlink_copy_hierarchy", 765, v234, v235, cf[0], v236, @"Failed to read first manifest command", v237, (char)fts_path);
    if (cf[0]) {
      CFRelease(cf[0]);
    }
    char v168 = 0;
    int v112 = -1;
    v83 = (void **)v240;
    goto LABEL_235;
  }
  BOOL v244 = v281 != 120;
  v83 = (void **)v240;
LABEL_41:
  size_t v84 = strlen(v25);
  v85 = fts_read(v27);
  if (!v85)
  {
    uint64_t v241 = 0;
LABEL_161:
    if (v22 && v281 != 120)
    {
      CFErrorRef v128 = sub_10000A9AC("hardlink_copy_hierarchy", 1110, v86, v87, 0, v89, @"Got done processing bundle but there were still commands remaining in manifest.", v91, (char)fts_path);
      goto LABEL_233;
    }
    CFErrorRef v46 = 0;
    if (a9) {
      *a9 = v241 << 9;
    }
    int v112 = -1;
    char v168 = 1;
    if (!v83) {
      goto LABEL_236;
    }
LABEL_235:
    munmap(*v83, (size_t)v83[1]);
    free(v83);
    goto LABEL_236;
  }
  v92 = v85;
  v239 = v83;
  uint64_t v241 = 0;
  while (1)
  {
    to[0].__pn_.__r_.__value_.__s.__data_[0] = 0;
    unsigned int fts_info = v92->fts_info;
    if (fts_info > 0xD || ((1 << fts_info) & 0x314A) == 0)
    {
      v98 = 0;
      int v99 = 0;
    }
    else
    {
      v95 = &v92->fts_path[v84];
      int v97 = *v95;
      v96 = v95 + 1;
      if (v97 == 47) {
        v98 = v96;
      }
      else {
        v98 = &v92->fts_path[v84];
      }
      if (fts_info != 6 && v244 && !sub_10000A89C(v282, v98))
      {
        if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) >= 7)
        {
          LOBYTE(fts_path) = v281;
          MOLogWrite();
        }
        int v99 = 1;
      }
      else
      {
        int v99 = 0;
      }
      unsigned int fts_info = v92->fts_info;
    }
    switch(fts_info)
    {
      case 1u:
        if (v99 && (v281 == 45 || v281 == 43))
        {
          if (fts_set(v27, v92, 4))
          {
            v214 = __error();
            strerror(*v214);
            CFErrorRef v128 = sub_10000A9AC("hardlink_copy_hierarchy", 1012, v215, v216, 0, v217, @"Failed to skip directory %s: %s", v218, (char)v98);
            goto LABEL_233;
          }
          if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) >= 7)
          {
            LOBYTE(fts_path) = (_BYTE)v98;
            MOLogWrite();
          }
LABEL_139:
          cf[0] = 0;
          if (sub_10000AB3C(v83, &v281, (CFErrorRef *)cf, v87, v88, v89, v90, v91))
          {
            if (v281 == 120)
            {
              if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) >= 7) {
                MOLogWrite();
              }
              BOOL v244 = 0;
            }
            goto LABEL_145;
          }
          CFErrorRef v174 = sub_10000A9AC("hardlink_copy_hierarchy", 1094, v151, v152, cf[0], v153, @"Failed to read next manifest command", v154, (char)fts_path);
          goto LABEL_171;
        }
        *(_WORD *)__str = 0;
        cf[0] = 0;
        if ((sub_10000AF64(v283, v98, (char *)to, (mode_t *)__str, (CFErrorRef *)cf) & 1) == 0)
        {
          CFErrorRef v174 = sub_10000A9AC("hardlink_copy_hierarchy", 1023, v123, v87, cf[0], v89, @"Failed to make dest path for directory %s", v91, (char)v98);
          goto LABEL_171;
        }
        if (*(_WORD *)__str && (*(_WORD *)__str & 0xF000) != 0x4000)
        {
          CFErrorRef v128 = sub_10000A9AC("hardlink_copy_hierarchy", 1030, v123, v87, 0, v89, @"Non-directory entity with mode 0%o exists at directory location in dest path %s", v91, __str[0]);
          goto LABEL_233;
        }
        if (*(_WORD *)__str)
        {
          if (*(unsigned __int16 *)__str != (v92->fts_statp->st_mode | 0x80)
            && chmod((const char *)to, v92->fts_statp->st_mode | 0x80))
          {
            v224 = __error();
            strerror(*v224);
            CFErrorRef v128 = sub_10000A9AC("hardlink_copy_hierarchy", 1043, v124, v125, 0, v126, @"Failed to make destination directory \"%s\" writable: %s", v127, (char)to);
LABEL_233:
            CFErrorRef v46 = v128;
            goto LABEL_234;
          }
        }
        else
        {
          if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) >= 7)
          {
            fts_uint64_t path = to;
            MOLogWrite();
          }
          if (mkdir((const char *)to, v92->fts_statp->st_mode | 0x80))
          {
            v219 = __error();
            strerror(*v219);
            CFErrorRef v128 = sub_10000A9AC("hardlink_copy_hierarchy", 1038, v220, v221, 0, v222, @"mkdir of '%s' failed: %s", v223, (char)to);
            goto LABEL_233;
          }
        }
        goto LABEL_138;
      case 3u:
      case 8u:
        if (v281 == 94) {
          int v100 = v99;
        }
        else {
          int v100 = 0;
        }
        if (v100 != 1)
        {
          if (v99 && (v281 == 45 || v281 == 43))
          {
            if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) >= 7)
            {
              LOBYTE(fts_path) = (_BYTE)v98;
              MOLogWrite();
            }
          }
          else
          {
            *(_WORD *)__str = 0;
            cf[0] = 0;
            if ((sub_10000AF64(v283, v98, (char *)to, (mode_t *)__str, (CFErrorRef *)cf) & 1) == 0)
            {
              CFErrorRef v174 = sub_10000A9AC("hardlink_copy_hierarchy", 975, v129, v130, cf[0], v131, @"Failed to make dest path for file %s", v132, (char)v98);
LABEL_171:
              CFErrorRef v46 = v174;
              CFTypeRef v175 = cf[0];
              if (!cf[0]) {
                goto LABEL_234;
              }
LABEL_201:
              CFRelease(v175);
              goto LABEL_234;
            }
            if (*(_WORD *)__str)
            {
              CFErrorRef v128 = sub_10000A9AC("hardlink_copy_hierarchy", 982, v129, v130, 0, v131, @"Entity with mode 0%o exists at file location in dest path %s", v132, __str[0]);
              goto LABEL_233;
            }
            if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) >= 7)
            {
              fts_uint64_t path = (std::__fs::filesystem::path *)v92->fts_path;
              MOLogWrite();
            }
            if (link(v92->fts_path, (const char *)to))
            {
              if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
              {
                v133 = v92->fts_path;
                v134 = __error();
                strerror(*v134);
                LOBYTE(fts_path) = (_BYTE)v133;
                v83 = v239;
                MOLogWrite();
              }
              if (copyfile(v92->fts_path, (const char *)to, 0, 0xC000Fu))
              {
                v208 = v92->fts_path;
                v209 = __error();
                strerror(*v209);
                CFErrorRef v128 = sub_10000A9AC("hardlink_copy_hierarchy", 991, v210, v211, 0, v212, @"copyfile of %s to %s failed: %s", v213, (char)v208);
                goto LABEL_233;
              }
            }
          }
          goto LABEL_137;
        }
        LOWORD(v285[0]) = 0;
        bzero(cf, 0x400uLL);
        *(void *)&v245.st_dev = 0;
        if ((sub_10000AF64(v283, v98, (char *)to, (mode_t *)v285, (CFErrorRef *)&v245) & 1) == 0)
        {
          CFErrorRef v46 = sub_10000A9AC("hardlink_copy_hierarchy", 882, v101, v102, *(const void **)&v245.st_dev, v103, @"Failed to make dest path for file %s", v104, (char)v98);
          CFTypeRef v175 = *(CFTypeRef *)&v245.st_dev;
          if (!*(void *)&v245.st_dev) {
            goto LABEL_234;
          }
          goto LABEL_201;
        }
        size_t v105 = v84;
        mode_t v106 = (mode_t)v285[0];
        if (!LOWORD(v285[0]))
        {
          CFErrorRef v128 = sub_10000A9AC("hardlink_copy_hierarchy", 889, v101, v102, 0, v103, @"Entity does not exist at file location in dest path %s", v104, (char)to);
          goto LABEL_233;
        }
        if (snprintf((char *)cf, 0x400uLL, "%s.XXXXXX", (const char *)to) >= 0x400)
        {
          CFErrorRef v128 = sub_10000A9AC("hardlink_copy_hierarchy", 894, v107, v108, 0, v109, @"failed to make newfile path: %s.XXXXXXX", v110, (char)to);
          goto LABEL_233;
        }
        int v111 = mkstemp((char *)cf);
        if (v111 == -1)
        {
          v186 = __error();
          strerror(*v186);
          CFErrorRef v128 = sub_10000A9AC("hardlink_copy_hierarchy", 899, v187, v188, 0, v189, @"mktemp failed for %s : %s", v190, (char)cf);
          goto LABEL_233;
        }
        int v112 = v111;
        v113 = v92->fts_path;
        bzero(__str, 0x400uLL);
        if (v14 && !sub_10000A89C(v113, v14))
        {
          if (snprintf(__str, 0x400uLL, "%s.XXXXXX", (const char *)to) >= 0x400)
          {
            CFErrorRef v46 = sub_10000A9AC("hardlink_copy_hierarchy", 914, v137, v138, 0, v139, @"failed to make newfile path: %s.XXXXXXX", v140, (char)to);
            goto LABEL_212;
          }
          LOBYTE(v290) = 0;
          if (!sub_100008EE8(v14, __str, &v290))
          {
            CFStringRef v193 = @"Failed to create hidden archs executable";
            int v194 = 920;
LABEL_207:
            CFErrorRef v191 = sub_10000A9AC("hardlink_copy_hierarchy", v194, v141, v142, 0, v143, v193, v144, (char)fts_path);
LABEL_208:
            CFErrorRef v46 = v191;
            goto LABEL_211;
          }
          BOOL v114 = (_BYTE)v290 != 0;
          if ((_BYTE)v290) {
            v113 = __str;
          }
        }
        else
        {
          BOOL v114 = 0;
        }
        if (sub_100054788(v113, (const char *)to, v112))
        {
          CFErrorRef v191 = sub_10000A9AC("hardlink_copy_hierarchy", 934, v145, v146, 0, v147, @"patch_file failed for:\n\t%s\n\t%s\n\t%s", v148, (char)v113);
          goto LABEL_208;
        }
        if (fchmod(v112, v106))
        {
          v192 = __error();
          fts_uint64_t path = (std::__fs::filesystem::path *)cf;
          strerror(*v192);
          CFStringRef v193 = @"chmod failed for %s : %s";
          int v194 = 939;
          goto LABEL_207;
        }
        close(v112);
        rename((const std::__fs::filesystem::path *)cf, to, v149);
        if (v150)
        {
          v195 = __error();
          strerror(*v195);
          CFErrorRef v46 = sub_10000A9AC("hardlink_copy_hierarchy", 948, v196, v197, 0, v198, @"rename of %s to %s failed: %s", v199, (char)cf);
          int v112 = -1;
LABEL_211:
          v83 = v239;
LABEL_212:
          char v168 = 0;
          if (v83) {
            goto LABEL_235;
          }
          goto LABEL_236;
        }
        if (v114) {
          unlink(v113);
        }
        v83 = v239;
        size_t v84 = v105;
LABEL_137:
        v241 += v92->fts_statp->st_blocks;
LABEL_138:
        if (v99) {
          goto LABEL_139;
        }
LABEL_145:
        v92 = fts_read(v27);
        if (!v92) {
          goto LABEL_161;
        }
        break;
      case 4u:
      case 7u:
      case 0xAu:
        CFErrorRef v128 = sub_10000A9AC("hardlink_copy_hierarchy", 1078, v86, v87, 0, v89, @"FTS in %s returned an error %d for path '%s'", v91, (char)"hardlink_copy_hierarchy");
        goto LABEL_233;
      case 6u:
        LOWORD(cf[0]) = 0;
        if (!sub_10000AF64(v283, v98, (char *)to, (mode_t *)cf, 0)) {
          goto LABEL_138;
        }
        if (((uint64_t)cf[0] & 0xF000) == 0x4000 && (int st_mode = v92->fts_statp->st_mode, st_mode != LOWORD(cf[0])))
        {
          if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) >= 7)
          {
            fts_uint64_t path = to;
            MOLogWrite();
            LOWORD(st_mode) = v92->fts_statp->st_mode;
          }
          if (chmod((const char *)to, st_mode))
          {
            v155 = __error();
            strerror(*v155);
            CFErrorRef v128 = sub_10000A9AC("hardlink_copy_hierarchy", 1060, v156, v157, 0, v158, @"chmod of '%s' failed: %s", v159, (char)to);
            goto LABEL_233;
          }
        }
        else if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) >= 7)
        {
          LOBYTE(fts_path) = cf[0];
          MOLogWrite();
        }
        goto LABEL_138;
      case 0xCu:
      case 0xDu:
        if (v99 && (v281 == 43 || v281 == 45)) {
          goto LABEL_137;
        }
        LOWORD(v245.st_dev) = 0;
        *(void *)__str = 0;
        if (sub_10000AF64(v283, v98, (char *)to, (mode_t *)&v245, (CFErrorRef *)__str))
        {
          if (LOWORD(v245.st_dev))
          {
            CFErrorRef v128 = sub_10000A9AC("hardlink_copy_hierarchy", 855, v115, v116, 0, v117, @"Entity with mode 0%o exists at symlink location in dest path %s", v118, v245.st_dev);
            goto LABEL_233;
          }
          uint64_t v119 = qword_1000A60B8;
          if (qword_1000A60B8)
          {
            p_fts_uint64_t path = (const char **)&v92->fts_path;
            v120 = v92->fts_path;
            if (*(int *)(qword_1000A60B8 + 44) <= 6
              || (fts_uint64_t path = (std::__fs::filesystem::path *)v92->fts_path,
                  MOLogWrite(),
                  uint64_t v119 = qword_1000A60B8,
                  v120 = *p_fts_path,
                  qword_1000A60B8))
            {
              if (*(int *)(v119 + 44) >= 7)
              {
                LOBYTE(fts_path) = (_BYTE)v120;
                MOLogWrite();
              }
            }
          }
          else
          {
            p_fts_uint64_t path = (const char **)&v92->fts_path;
            v120 = v92->fts_path;
          }
          ssize_t v135 = readlink(v120, (char *)cf, 0x400uLL);
          if (v135 < 0)
          {
            if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
            {
LABEL_198:
              v185 = __error();
              strerror(*v185);
              MOLogWrite();
            }
LABEL_199:
            CFErrorRef v128 = sub_10000A9AC("hardlink_copy_hierarchy", 862, v136, v87, 0, v89, @"Failed to copy symlink %s to %s", v91, (char)*p_fts_path);
            goto LABEL_233;
          }
          *((unsigned char *)cf + v135) = 0;
          if (symlink((const char *)cf, (const char *)to))
          {
            if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
              goto LABEL_198;
            }
            goto LABEL_199;
          }
          goto LABEL_137;
        }
        CFErrorRef v46 = sub_10000A9AC("hardlink_copy_hierarchy", 848, v115, v116, *(const void **)__str, v117, @"Failed to make dest path for symlink %s", v118, (char)v98);
        CFTypeRef v175 = *(CFTypeRef *)__str;
        if (*(void *)__str) {
          goto LABEL_201;
        }
LABEL_234:
        char v168 = 0;
        int v112 = -1;
        if (v83) {
          goto LABEL_235;
        }
LABEL_236:
        fts_close(v27);
        if ((v112 & 0x80000000) == 0) {
          close(v112);
        }
        if (v168) {
          return 1;
        }
LABEL_24:
        if (a10)
        {
          uint64_t result = 0;
          *a10 = v46;
        }
        else
        {
          if (v46) {
            CFRelease(v46);
          }
          return 0;
        }
        return result;
      default:
        goto LABEL_138;
    }
  }
}

int sub_10000A888(id a1, const _ftsent **a2, const _ftsent **a3)
{
  return sub_10000A89C((*a2)->fts_name, (*a3)->fts_name);
}

uint64_t sub_10000A89C(char *cStr, const char *a2)
{
  CFStringRef v3 = CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x8000100u);
  CFStringRef v4 = CFStringCreateWithCString(kCFAllocatorDefault, a2, 0x8000100u);
  bzero(buffer, 0x400uLL);
  bzero(__s2, 0x400uLL);
  if (!CFStringGetFileSystemRepresentation(v3, buffer, 1024)
    || !CFStringGetFileSystemRepresentation(v4, __s2, 1024))
  {
    uint64_t v5 = 0xFFFFFFFFLL;
    if (!v3) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v5 = strcmp(buffer, __s2);
  if (v3) {
LABEL_6:
  }
    CFRelease(v3);
LABEL_7:
  if (v4) {
    CFRelease(v4);
  }
  return v5;
}

CFErrorRef sub_10000A9AC(const char *a1, int a2, uint64_t a3, uint64_t a4, const void *a5, uint64_t a6, const __CFString *a7, uint64_t a8, char a9)
{
  int valuePtr = a2;
  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFStringRef v13 = CFStringCreateWithCString(0, a1, 0x8000100u);
  CFDictionaryAddValue(Mutable, @"FunctionName", v13);
  if (v13) {
    CFRelease(v13);
  }
  CFNumberRef v14 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionaryAddValue(Mutable, @"SourceFileLine", v14);
  if (v14) {
    CFRelease(v14);
  }
  if (a5) {
    CFDictionaryAddValue(Mutable, kCFErrorUnderlyingErrorKey, a5);
  }
  CFStringRef v15 = CFStringCreateWithFormatAndArguments(0, 0, a7, &a9);
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
    MOLogWrite();
  }
  CFDictionaryAddValue(Mutable, kCFErrorLocalizedDescriptionKey, v15);
  if (v15) {
    CFRelease(v15);
  }
  CFErrorRef v16 = CFErrorCreate(0, @"MIInstallerDeltaErrorDomain", 1, Mutable);
  if (Mutable) {
    CFRelease(Mutable);
  }
  return v16;
}

uint64_t sub_10000AB3C(void *a1, unsigned __int8 *a2, CFErrorRef *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = a1[1];
  uint64_t v8 = a1[2];
  if (v8 >= v9) {
    sub_1000585C4();
  }
  if (v8 + 1 >= v9)
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
    {
      LOBYTE(v31) = 1;
      MOLogWrite();
    }
    CFStringRef v26 = @"Failed to read command from manifest";
    int v27 = 508;
  }
  else
  {
    int v13 = *(unsigned __int8 *)(*a1 + v8);
    *a2 = v13;
    ++a1[2];
    BOOL v14 = (v13 - 43) > 0x33 || ((1 << (v13 - 43)) & 0x8000000040005) == 0;
    if (v14 && v13 != 120)
    {
      CFErrorRef v28 = sub_10000A9AC("read_next_manifest_command", 514, (uint64_t)a3, a4, 0, a6, @"Stream had invalid command: %hhu", a8, v13);
      goto LABEL_26;
    }
    char v15 = sub_10000B0D8(a1, 1, (uint64_t)(a2 + 1), 0x400uLL);
    int v20 = *a2;
    if ((v15 & 1) == 0)
    {
      CFErrorRef v28 = sub_10000A9AC("read_next_manifest_command", 520, v16, v17, 0, v18, @"Failed to read arg1 of command %hhu", v19, *a2);
      goto LABEL_26;
    }
    if (v20 != 61) {
      goto LABEL_12;
    }
    *(void *)__str = 0;
    uint64_t v33 = 0;
    char v35 = 0;
    uint64_t v34 = 0;
    if ((sub_10000B0D8(a1, 1, (uint64_t)__str, 0x19uLL) & 1) == 0)
    {
      CFErrorRef v28 = sub_10000A9AC("read_next_manifest_command", 528, v21, v22, 0, v23, @"Failed to read arg2 of command %hhu", v24, *a2);
      goto LABEL_26;
    }
    uint64_t v25 = strtoll(__str, 0, 10);
    *((void *)a2 + 129) = v25;
    if (v25)
    {
      int v20 = *a2;
LABEL_12:
      if (v20 != 120 || !strncmp((const char *)a2 + 1, "EOF", 3uLL)) {
        return 1;
      }
      CFStringRef v26 = @"Got malformed EOF marker";
      int v27 = 542;
      goto LABEL_25;
    }
    uint64_t v31 = __str;
    CFStringRef v26 = @"Invalid touch time \"%s\" found for path \"%s\"";
    int v27 = 535;
  }
LABEL_25:
  CFErrorRef v28 = sub_10000A9AC("read_next_manifest_command", v27, (uint64_t)a3, a4, 0, a6, v26, a8, (char)v31);
LABEL_26:
  if (a3)
  {
    uint64_t v29 = 0;
    *a3 = v28;
  }
  else
  {
    if (v28) {
      CFRelease(v28);
    }
    return 0;
  }
  return v29;
}

uint64_t sub_10000AD9C(const char *a1, char *a2, mode_t *a3, CFErrorRef *a4)
{
  size_t v8 = strlen(a1);
  size_t v13 = v8 - 1;
  if (a1[v8 - 1] == 47)
  {
    a1[v13] = 0;
    size_t v13 = v8 - 2;
  }
  if ((v13 & 0x8000000000000000) != 0)
  {
LABEL_6:
    char v30 = (char)a1;
    CFStringRef v14 = @"Failed to find parent of '%s'";
    int v15 = 588;
LABEL_7:
    CFErrorRef v16 = sub_10000A9AC("realpath_parent_no_symlink", v15, v9, v10, 0, v11, v14, v12, v30);
    goto LABEL_8;
  }
  while (a1[v13] != 47)
  {
    if (&a1[--v13] < a1) {
      goto LABEL_6;
    }
  }
  if (v13)
  {
    uint64_t v18 = (char *)&a1[v13];
    a1[v13] = 0;
    if (!realpath_DARWIN_EXTSN(a1, a2))
    {
      uint64_t v24 = __error();
      strerror(*v24);
      CFErrorRef v16 = sub_10000A9AC("realpath_parent_no_symlink", 599, v25, v26, 0, v27, @"realpath of '%s' failed at element '%s': %s", v28, (char)a1);
      char *v18 = 47;
      if (a4) {
        goto LABEL_9;
      }
      goto LABEL_18;
    }
    char *v18 = 47;
    if (strlcat(a2, v18, 0x400uLL) >= 0x400)
    {
      CFStringRef v14 = @"Path was too long";
      int v15 = 608;
      goto LABEL_7;
    }
  }
  else
  {
    strlcpy(a2, a1, 0x400uLL);
  }
  memset(&v31, 0, sizeof(v31));
  if (lstat(a2, &v31))
  {
    mode_t st_mode = 0;
LABEL_23:
    *a3 = st_mode;
    return 1;
  }
  mode_t st_mode = v31.st_mode;
  if ((v31.st_mode & 0xF000) != 0xA000) {
    goto LABEL_23;
  }
  CFErrorRef v16 = sub_10000A9AC("realpath_parent_no_symlink", 618, v19, v20, 0, v21, @"Found symlink at destination path \"%s\"; this is not allowed.",
          v22,
          (char)a2);
LABEL_8:
  if (a4)
  {
LABEL_9:
    uint64_t v17 = 0;
    *a4 = v16;
    return v17;
  }
LABEL_18:
  if (v16) {
    CFRelease(v16);
  }
  return 0;
}

uint64_t sub_10000AF64(const char *a1, const char *a2, char *a3, mode_t *a4, CFErrorRef *a5)
{
  bzero(__str, 0x400uLL);
  if (snprintf(__str, 0x400uLL, "%s/%s", a1, a2) < 0x400)
  {
    CFTypeRef cf = 0;
    if ((sub_10000AD9C(__str, a3, a4, (CFErrorRef *)&cf) & 1) == 0)
    {
      CFErrorRef v23 = sub_10000A9AC("make_and_check_dest_path", 701, v15, v16, cf, v17, @"Failed to realpath parent of %s", v18, (char)__str);
      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0;
      }
      goto LABEL_7;
    }
    if (!sub_10000A89C(__str, a3)) {
      return 1;
    }
    CFErrorRef v14 = sub_10000A9AC("make_and_check_dest_path", 709, v19, v20, 0, v21, @"realpath'd destpath '%s' is different from non-realpath '%s'", v22, (char)a3);
  }
  else
  {
    CFErrorRef v14 = sub_10000A9AC("make_and_check_dest_path", 695, v10, v11, 0, v12, @"Dest path '%s/%s' was too long", v13, (char)a1);
  }
  CFErrorRef v23 = v14;
LABEL_7:
  if (a5)
  {
    uint64_t result = 0;
    *a5 = v23;
  }
  else
  {
    if (v23) {
      CFRelease(v23);
    }
    return 0;
  }
  return result;
}

uint64_t sub_10000B0D8(void *a1, int a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4 = a1[2];
  if (v4 >= a1[1]) {
    sub_1000585F0();
  }
  if (!a4) {
    return 0;
  }
  unint64_t v5 = 0;
  while (1)
  {
    int v6 = *(unsigned __int8 *)(*a1 + v4);
    a1[2] = v4 + 1;
    int v7 = v6 == 9 ? a2 : 0;
    if (v6 == 10 || v7 != 0) {
      break;
    }
    *(unsigned char *)(a3 + v5++) = v6;
    uint64_t v4 = a1[2];
    if (v4 >= a1[1] || v5 >= a4) {
      return 0;
    }
  }
  *(unsigned char *)(a3 + v5) = 0;
  return 1;
}

uint64_t sub_10000B150(void *a1, const __CFArray *a2, CFErrorRef *a3)
{
  uint64_t v10 = malloc_type_calloc(1uLL, 0x800uLL, 0x30FCD377uLL);
  if (!v10)
  {
    CFStringRef v32 = @"Failed to malloc buffer for line";
    int v33 = 200;
LABEL_23:
    CFErrorRef v34 = sub_10000A9AC("validate_supported_devices", v33, v6, v7, 0, v8, v32, v9, v42);
    free(v10);
    goto LABEL_24;
  }
  if ((sub_10000B0D8(a1, 0, (uint64_t)v10, 0x800uLL) & 1) == 0)
  {
    CFStringRef v32 = @"Failed to read supported devices from stream";
    int v33 = 205;
    goto LABEL_23;
  }
  if (!*v10)
  {
    if (!a2)
    {
      free(v10);
      return 1;
    }
    CFStringRef v32 = @"Existing app lists supported devices but there were none in the manifest";
    int v33 = 211;
    goto LABEL_23;
  }
  CFStringRef v11 = CFStringCreateWithCString(kCFAllocatorDefault, v10, 0x8000100u);
  if (!v11)
  {
    CFStringRef v32 = @"Failed to create patch supported devices string";
    int v33 = 222;
    goto LABEL_23;
  }
  CFStringRef v12 = v11;
  CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(kCFAllocatorDefault, v11, @" ");
  CFArrayRef v18 = ArrayBySeparatingStrings;
  if (!ArrayBySeparatingStrings || !CFArrayGetCount(ArrayBySeparatingStrings))
  {
    CFErrorRef v36 = sub_10000A9AC("validate_supported_devices", 228, v14, v15, 0, v16, @"Failed to split patch supported devices string", v17, v42);
LABEL_32:
    CFErrorRef v34 = v36;
    free(v10);
    char v37 = 0;
    Mutable = 0;
    uint64_t v20 = 0;
    goto LABEL_42;
  }
  if (!a2)
  {
    CFErrorRef v36 = sub_10000A9AC("validate_supported_devices", 234, v14, v15, 0, v16, @"Target app had no supported devices but patch did: %@", v17, (char)v18);
    goto LABEL_32;
  }
  CFStringRef v43 = v12;
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  uint64_t v20 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  uint64_t Count = CFArrayGetCount(a2);
  uint64_t v22 = CFArrayGetCount(v18);
  if (Count >= 1)
  {
    for (CFIndex i = 0; i != Count; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a2, i);
      v44.location = 0;
      v44.length = v22;
      if (!CFArrayContainsValue(v18, v44, ValueAtIndex)) {
        CFArrayAppendValue(Mutable, ValueAtIndex);
      }
    }
  }
  if (v22 >= 1)
  {
    for (CFIndex j = 0; j != v22; ++j)
    {
      uint64_t v26 = CFArrayGetValueAtIndex(v18, j);
      v45.location = 0;
      v45.length = Count;
      if (!CFArrayContainsValue(a2, v45, v26)) {
        CFArrayAppendValue(v20, v26);
      }
    }
  }
  if (Mutable && CFArrayGetCount(Mutable))
  {
    CFErrorRef v31 = sub_10000A9AC("validate_supported_devices", 242, v27, v28, 0, v29, @"Expected supported devices had devices that were not in patch: %@", v30, (char)Mutable);
  }
  else
  {
    if (!v20 || !CFArrayGetCount(v20))
    {
      CFErrorRef v34 = 0;
      char v37 = 1;
      goto LABEL_41;
    }
    CFErrorRef v31 = sub_10000A9AC("validate_supported_devices", 247, v38, v39, 0, v40, @"Patch listed devices that were not in expected supported devices: %@", v41, (char)v20);
  }
  CFErrorRef v34 = v31;
  char v37 = 0;
LABEL_41:
  CFStringRef v12 = v43;
  free(v10);
LABEL_42:
  CFRelease(v12);
  if (v18) {
    CFRelease(v18);
  }
  if (v20) {
    CFRelease(v20);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v37) {
    return 1;
  }
LABEL_24:
  if (a3)
  {
    uint64_t result = 0;
    *a3 = v34;
  }
  else
  {
    if (v34) {
      CFRelease(v34);
    }
    return 0;
  }
  return result;
}

id sub_10000B4BC()
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000A5F30);
  WeakRetained = objc_loadWeakRetained(&qword_1000A5F38);
  if (!WeakRetained)
  {
    WeakRetained = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MobileInstallationHelperServiceProtocol];
    objc_storeWeak(&qword_1000A5F38, WeakRetained);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000A5F30);

  return WeakRetained;
}

id sub_10000B544()
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000A5F40);
  WeakRetained = objc_loadWeakRetained(&qword_1000A5F48);
  if (!WeakRetained)
  {
    WeakRetained = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MobileInstallerDelegateProtocol];
    objc_storeWeak(&qword_1000A5F48, WeakRetained);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000A5F40);

  return WeakRetained;
}

id sub_10000B5CC()
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000A5F50);
  WeakRetained = objc_loadWeakRetained(&qword_1000A5F58);
  if (!WeakRetained)
  {
    WeakRetained = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MobileInstallerProtocol];
    id v1 = ICLKnownBundleRecordClasses();
    int v2 = [v1 setByAddingObject:objc_opt_class()];

    uint64_t v3 = objc_opt_class();
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, v4, v5, objc_opt_class(), 0);
    [WeakRetained setClasses:v6 forSelector:"checkCapabilities:withOptions:completion:" argumentIndex:0 ofReply:0];

    uint64_t v7 = objc_opt_class();
    uint64_t v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, objc_opt_class(), 0);
    [WeakRetained setClasses:v8 forSelector:"uninstallIdentifiers:withOptions:completion:" argumentIndex:0 ofReply:1];

    [WeakRetained setClasses:v2 forSelector:"installURL:identity:targetingDomain:options:returningResultInfo:completion:" argumentIndex:1 ofReply:1];
    [WeakRetained setClasses:v2 forSelector:"fetchInfoForContainerizedAppWithIdentity:inDomain:options:completion:" argumentIndex:0 ofReply:1];
    [WeakRetained setClasses:v2 forSelector:"fetchInfoForFrameworkAtURL:options:completion:" argumentIndex:0 ofReply:1];
    [WeakRetained setClasses:v2 forSelector:"cancelUpdateForStagedUUID:completion:" argumentIndex:0 ofReply:1];
    [WeakRetained setClasses:v2 forSelector:"finalizeStagedInstallForUUID:returningResultInfo:completion:" argumentIndex:1 ofReply:1];
    objc_storeWeak(&qword_1000A5F58, WeakRetained);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000A5F50);

  return WeakRetained;
}

void sub_10000B858(id a1)
{
  qword_1000A5F60 = objc_alloc_init(MIIPAPatcherFileManager);

  _objc_release_x1();
}

void sub_10000C7B0(id a1)
{
  id v1 = (void *)qword_1000A5F70;
  qword_1000A5F70 = (uint64_t)&off_100096F88;
}

uint64_t sub_10000EB14()
{
  if (qword_1000A5F88 != -1) {
    dispatch_once(&qword_1000A5F88, &stru_10008CEA0);
  }
  return dword_1000A5F80;
}

void sub_10000EB58(id a1)
{
  id v1 = +[UMUserManager sharedManager];
  int v2 = [v1 currentUser];
  dword_1000A5F80 = [v2 uid];

  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5) {
    MOLogWrite();
  }
}

id sub_10000EBF4()
{
  v0 = +[UMUserManager sharedManager];
  id v1 = [v0 allUsers];

  return v1;
}

id sub_10000EC48()
{
  if (qword_1000A5F98 != -1) {
    dispatch_once(&qword_1000A5F98, &stru_10008CEC0);
  }
  v0 = (void *)qword_1000A5F90;

  return v0;
}

void sub_10000EC9C(id a1)
{
  uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.installd.LaunchServicesRegistrationQueue", v3);
  int v2 = (void *)qword_1000A5F90;
  qword_1000A5F90 = (uint64_t)v1;
}

id sub_10000ED00(void *a1)
{
  dispatch_queue_t v1 = a1;
  int v2 = 0;
  unint64_t v3 = 0;
  while (1)
  {
    uint64_t v4 = v1[2](v1);

    if (!v4) {
      break;
    }
    uint64_t v5 = [v4 domain];
    if ([v5 isEqualToString:NSCocoaErrorDomain] && objc_msgSend(v4, "code") == (id)4097)
    {

      if (v3 >= 5) {
        break;
      }
    }
    else
    {
      uint64_t v6 = [v4 domain];
      if (![v6 isEqualToString:NSCocoaErrorDomain]
        || [v4 code] != (id)4099)
      {

        break;
      }

      if (v3 > 4) {
        break;
      }
    }
    ++v3;
    int v2 = v4;
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
    {
      uint64_t v8 = v4;
      MOLogWrite();
    }
    sleep(1u);
  }

  return v4;
}

void sub_10000EE74(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = a2;
  id v13 = a1;
  id v14 = objc_alloc_init((Class)SDRDiagnosticReporter);
  uint64_t v15 = [v14 signatureWithDomain:v13 type:v12 subType:v11 subtypeContext:v10 detectedProcess:@"installd" triggerThresholdValues:0];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000F028;
  v18[3] = &unk_10008CEE8;
  id v16 = v15;
  id v19 = v16;
  id v17 = v9;
  id v20 = v17;
  if (([v14 snapshotWithSignature:v16 delay:0 events:v17 payload:0 actions:v18 reply:0.0] & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_10005861C((uint64_t)v16);
    }
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
      MOLogWrite();
    }
  }
}

uint64_t sub_10000F028(uint64_t a1, void *a2)
{
  uint64_t v5 = [a2 objectForKeyedSubscript:kSymptomDiagnosticReplySuccess];
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    unsigned int v2 = [v5 BOOLValue];
    uint64_t v3 = qword_1000A60B8;
    if (v2)
    {
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
LABEL_9:
      }
        uint64_t v3 = MOLogWrite();
    }
    else if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
    {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v3 = qword_1000A60B8;
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
      goto LABEL_9;
    }
  }

  return _objc_release_x2(v3);
}

void sub_10000F42C(void *a1)
{
  id v1 = a1;
  if ([v1 isTransient])
  {
    unsigned int v2 = [v1 identifier];
    id v5 = 0;
    unsigned __int8 v3 = [v1 removeUnderlyingContainerWaitingForDeletion:0 error:&v5];
    id v4 = v5;
    if (v3)
    {
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) < 7) {
        goto LABEL_9;
      }
    }
    else if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3)
    {
      goto LABEL_9;
    }
    MOLogWrite();
LABEL_9:
  }
}

void sub_100011580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v12 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000115B0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000115C0(uint64_t a1)
{
}

void sub_1000115C8(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[5];
  id v9 = 0;
  uint64_t v4 = +[MILaunchServicesOperationManager registerInstalledInfo:v2 forIdentity:v3 inDomain:1 error:&v9];
  id v5 = v9;
  id v6 = v9;
  uint64_t v7 = *(void *)(a1[6] + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v4;

  if (!*(void *)(*(void *)(a1[6] + 8) + 40)) {
    objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), v5);
  }
}

uint64_t sub_1000118A4()
{
  qword_1000A5FA0 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

id sub_100011B34()
{
  v0 = +[MIDaemonConfiguration sharedInstance];
  id v1 = [v0 dataDirectory];
  uint64_t v2 = [v1 URLByAppendingPathComponent:@"DiskImageMountPaths.plist" isDirectory:0];

  return v2;
}

id sub_100011BAC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onQueue_configureMountInfoForPaths:*(void *)(a1 + 40)];
}

void sub_100011D30(uint64_t a1)
{
  id v17 = objc_opt_new();
  uint64_t v2 = +[MIFileManager defaultManager];
  uint64_t v3 = +[MIDaemonConfiguration sharedInstance];
  unsigned int v4 = [v3 hasInternalContent];

  if (v4)
  {
    uint64_t v16 = a1;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v5 = +[MIDaemonConfiguration sharedInstance];
    id v6 = [v5 developerDirectories];

    id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v19;
      do
      {
        for (CFIndex i = 0; i != v8; CFIndex i = (char *)i + 1)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if ([v2 itemExistsAtURL:v11])
          {
            uint64_t v12 = +[MIDaemonConfiguration sharedInstance];
            id v13 = [v11 URLByAppendingPathComponent:@"Applications" isDirectory:1];
            id v14 = [v12 _bundleIDMapForAppsInDirectory:v13];
            uint64_t v15 = [v11 path];
            [v17 setObject:v14 forKeyedSubscript:v15];
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }

    a1 = v16;
  }
  [*(id *)(a1 + 32) setMountInfo:v17];
  [*(id *)(a1 + 32) _onQueue_saveMountPaths];
}

void sub_100012400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100012418(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) mountInfo];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v3) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

id sub_100012554(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = [*(id *)(a1 + 32) mountInfo];
  [v3 setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];

  unsigned int v4 = *(void **)(a1 + 32);

  return [v4 _onQueue_saveMountPaths];
}

void sub_10001269C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000126B4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) mountInfo];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v3)
  {
    unsigned int v4 = [*(id *)(a1 + 32) mountInfo];
    [v4 removeObjectForKey:*(void *)(a1 + 40)];

    [*(id *)(a1 + 32) _onQueue_saveMountPaths];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

void sub_1000127F0(uint64_t a1)
{
}

void sub_100012884(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

void sub_1000129E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000129FC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) pendingMountPath];
  if (v2 && [*(id *)(a1 + 40) hasPrefix:v2]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    uint64_t v3 = [*(id *)(a1 + 32) mountInfo];
    id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v9;
      while (2)
      {
        for (CFIndex i = 0; i != v5; CFIndex i = (char *)i + 1)
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          if ([*(id *)(a1 + 40) hasPrefix:*(void *)(*((void *)&v8 + 1) + 8 * i)])
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
            goto LABEL_15;
          }
        }
        id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_15:
  }
}

void sub_100012C60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100012C78(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100012C88(uint64_t a1)
{
}

void sub_100012C90(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) mountInfo];
  uint64_t v2 = [v6 allKeys];
  uint64_t v3 = +[NSSet setWithArray:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_100012E4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100012E64(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) mountInfo];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100012F08;
  v5[3] = &unk_10008CFD8;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 enumerateKeysAndObjectsUsingBlock:v5];
}

void sub_100012F08(uint64_t a1, uint64_t a2, void *a3, char *a4)
{
  id v6 = [a3 objectForKeyedSubscript:*(void *)(a1 + 32)];
  if (v6)
  {
    long long v11 = v6;
    id v7 = [v6 copy];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    long long v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    id v6 = v11;
    char v10 = 1;
  }
  else
  {
    char v10 = 0;
  }
  *a4 = v10;
}

void sub_100013074(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001308C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) mountInfo];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100013130;
  v5[3] = &unk_10008CFD8;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 enumerateKeysAndObjectsUsingBlock:v5];
}

void sub_100013130(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = [a3 objectForKeyedSubscript:*(void *)(a1 + 32)];

  if (v6)
  {
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    *a4 = 0;
  }
}

void sub_100013274(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) mountInfo];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100013314;
  v3[3] = &unk_10008D000;
  id v4 = *(id *)(a1 + 40);
  [v2 enumerateKeysAndObjectsUsingBlock:v3];
}

void sub_100013314(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = [a3 allKeys];
  [v5 addObjectsFromArray:v6];

  *a4 = 0;
}

uint64_t sub_100013558(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 pathExtension];
  if ([v4 isEqualToString:@"app"])
  {
    id v53 = 0;
    id v5 = +[MIExecutableBundle bundleForURL:v3 error:&v53];
    id v6 = v53;
    id v7 = v6;
    if (!v5)
    {
      if (sub_100014BE0(v6) || qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3) {
        goto LABEL_30;
      }
      uint64_t v8 = [v3 path];
      MOLogWrite();
LABEL_29:

LABEL_30:
      goto LABEL_31;
    }
    uint64_t v8 = [v5 identifier];
    long long v9 = +[MIGlobalConfiguration sharedInstance];
    char v10 = [v9 primaryPersonaString];
    id v52 = v7;
    long long v11 = +[MILaunchServicesDatabaseGatherer entryForBundle:v5 inContainer:0 forPersona:v10 withError:&v52];
    id v12 = v52;

    if (v11)
    {
      id v13 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];

      if (!v13)
      {
        uint64_t v39 = v12;
        long long v18 = objc_opt_new();
        CFRange v44 = v8;
        [*(id *)(a1 + 32) setObject:v18 forKeyedSubscript:v8];
        char v35 = v18;
        char v42 = v11;
        [v18 addObject:v11];
        long long v19 = objc_opt_new();
        uint64_t v40 = v5;
        long long v20 = [v5 infoPlistSubset];
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        uint64_t v37 = a1;
        id v21 = *(id *)(a1 + 40);
        id v22 = [v21 countByEnumeratingWithState:&v48 objects:v54 count:16];
        if (v22)
        {
          id v23 = v22;
          uint64_t v24 = *(void *)v49;
          do
          {
            for (CFIndex i = 0; i != v23; CFIndex i = (char *)i + 1)
            {
              if (*(void *)v49 != v24) {
                objc_enumerationMutation(v21);
              }
              uint64_t v26 = *(void *)(*((void *)&v48 + 1) + 8 * i);
              uint64_t v27 = [v20 objectForKeyedSubscript:v26];
              [v19 setObject:v27 forKeyedSubscript:v26];
            }
            id v23 = [v21 countByEnumeratingWithState:&v48 objects:v54 count:16];
          }
          while (v23);
        }

        [v19 setObject:v3 forKeyedSubscript:@"com.apple.MobileInstallation.bundleURL"];
        id v28 = [v19 copy];
        [*(id *)(v37 + 48) setObject:v28 forKeyedSubscript:v44];

        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472;
        v46[2] = sub_100013AA4;
        v46[3] = &unk_10008D028;
        id v38 = v35;
        id v47 = v38;
        uint64_t v29 = objc_retainBlock(v46);
        uint64_t v30 = +[MIGlobalConfiguration sharedInstance];
        CFErrorRef v31 = [v30 primaryPersonaString];
        id v45 = v39;
        CFErrorRef v36 = v29;
        int v33 = v29;
        id v5 = v40;
        LOBYTE(v28) = +[MILaunchServicesDatabaseGatherer enumerateAppExtensionsInBundle:v40 forPersona:v31 updatingAppExtensionParentID:0 ensureAppExtensionsAreExecutable:0 installProfiles:0 error:&v45 enumerator:v33];
        id v7 = v45;

        if ((v28 & 1) == 0 && (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)) {
          MOLogWrite();
        }

        long long v11 = v42;
        uint64_t v8 = v44;
        goto LABEL_28;
      }
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
      {
        id v14 = [v5 identifier];
        [v11 bundleURL];
        uint64_t v15 = v43 = v8;
        [v15 path];
        uint64_t v16 = v41 = v11;
        id v17 = [v5 bundleURL];
        [v17 path];
        v34 = id v7 = v12;
        MOLogWrite();

        long long v11 = v41;
        uint64_t v8 = v43;

LABEL_28:
        goto LABEL_29;
      }
    }
    else if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
    {
      MOLogWrite();
    }
    id v7 = v12;
    goto LABEL_28;
  }
LABEL_31:

  return 1;
}

id sub_100013AA4(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObject:];
}

void sub_100013BAC(uint64_t a1)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100013C50;
  v4[3] = &unk_10008D078;
  uint64_t v2 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v2 enumerateKeysAndObjectsUsingBlock:v4];
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
  }
}

void sub_100013C50(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) >= 7)
  {
    id v13 = v7;
    MOLogWrite();
  }
  long long v9 = +[MILaunchServicesOperationManager instanceForCurrentUser];
  uint64_t v10 = *(void *)(a1 + 32);
  id v14 = 0;
  long long v11 = [v9 registerInstalledInfo:v8 onMountPoint:v10 forAppBundleID:v7 error:&v14];
  id v12 = v14;

  if (v11)
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5) {
LABEL_10:
    }
      MOLogWrite();
  }
  else if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
  {
    goto LABEL_10;
  }
  *a4 = 0;
}

void sub_100013E6C(uint64_t a1)
{
  uint64_t v2 = +[MIFileManager defaultManager];
  uint64_t v3 = *(void *)(a1 + 32);
  id v17 = 0;
  id v4 = [v2 realPathForURL:v3 allowNonExistentPathComponents:0 isDirectory:1 error:&v17];
  id v5 = v17;

  if (v4)
  {
    id v6 = [v4 path];
    if ([*(id *)(a1 + 40) _isKnownPath:v6])
    {
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5) {
        MOLogWrite();
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48));
    }
    else
    {
      [*(id *)(a1 + 40) _setPendingMountPath:v6];
      long long v11 = *(void **)(a1 + 40);
      id v12 = [v4 URLByAppendingPathComponent:@"Applications" isDirectory:1];
      id v16 = 0;
      id v13 = [v11 _onQueue_scanApps:v12 returnMapInfo:&v16];
      id v14 = v16;

      if ([v13 count])
      {
        if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
        {
          uint64_t v15 = v6;
          MOLogWrite();
        }
        [*(id *)(a1 + 40) _addMountPath:v6 withInfo:v14, v15];
        [*(id *)(a1 + 40) _clearPendingMountPath];
        [*(id *)(a1 + 40) _onQueue_registerDiscoveredAppEntries:v13 onMountPoint:v4 completion:*(void *)(a1 + 48)];
      }
      else
      {
        if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
        {
          uint64_t v15 = v6;
          MOLogWrite();
        }
        [*(id *)(a1 + 40) _clearPendingMountPath:v15];
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      }
    }
  }
  else
  {
    id v7 = (void *)MIInstallerErrorDomain;
    id v8 = [*(id *)(a1 + 32) path];
    uint64_t v10 = sub_100014A08((uint64_t)"-[MIDiskImageManager registerContentsAtMountPoint:completion:]_block_invoke", 409, v7, 25, v5, 0, @"Failed to realpath image mount %@", v9, (uint64_t)v8);

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v5 = (id)v10;
  }
}

void sub_1000141B4(uint64_t a1)
{
  uint64_t v2 = +[MIFileManager defaultManager];
  uint64_t v3 = *(void *)(a1 + 32);
  id v13 = 0;
  id v4 = [v2 realPathForURL:v3 allowNonExistentPathComponents:0 isDirectory:1 error:&v13];
  id v5 = v13;

  if (v4)
  {
    id v6 = [v4 path];
    if ([*(id *)(a1 + 40) _isKnownPath:v6])
    {
      id v7 = *(void **)(a1 + 40);
      id v8 = [v4 URLByAppendingPathComponent:@"Applications" isDirectory:1];
      id v12 = 0;
      uint64_t v9 = [v7 _onQueue_scanApps:v8 returnMapInfo:&v12];
      id v10 = v12;

      if ([v9 count])
      {
        if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
        {
          long long v11 = v6;
          MOLogWrite();
        }
        [*(id *)(a1 + 40) _onQueue_registerDiscoveredAppEntries:v9 onMountPoint:v4 completion:0];
      }
      else if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
      {
        MOLogWrite();
      }

      goto LABEL_18;
    }
    if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 5)
    {
LABEL_18:

      goto LABEL_19;
    }
LABEL_13:
    MOLogWrite();
    goto LABEL_18;
  }
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
  {
    id v6 = [*(id *)(a1 + 32) path];
    goto LABEL_13;
  }
LABEL_19:
}

void sub_1000144A8(id *a1)
{
  uint64_t v2 = +[MIFileManager defaultManager];
  id v3 = a1[4];
  id v15 = 0;
  id v4 = [v2 realPathForURL:v3 allowNonExistentPathComponents:0 isDirectory:1 error:&v15];
  id v5 = v15;

  if (v4)
  {
    id v6 = [v4 path];
    if ([a1[5] _removeMountPath:v6])
    {
      id v7 = [a1[5] lsRegisterQueue];
      id v12 = v4;
      id v13 = v6;
      id v14 = a1[6];
      MIRunTransactionalTask();
    }
    else
    {
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5) {
        MOLogWrite();
      }
      (*((void (**)(id))a1[6] + 2))(a1[6]);
    }
  }
  else
  {
    id v8 = (void *)MIInstallerErrorDomain;
    uint64_t v9 = [a1[4] path];
    uint64_t v11 = sub_100014A08((uint64_t)"-[MIDiskImageManager unregisterContentsAtMountPoint:completion:]_block_invoke", 481, v8, 25, v5, 0, @"Failed to realpath image mount %@", v10, (uint64_t)v9);

    (*((void (**)(void))a1[6] + 2))();
    id v5 = (id)v11;
  }
}

void sub_1000146B8(void *a1)
{
  uint64_t v2 = +[MILaunchServicesOperationManager instanceForCurrentUser];
  uint64_t v3 = a1[4];
  id v8 = 0;
  unsigned __int8 v4 = [v2 unregisterAppsAtMountPoint:v3 error:&v8];
  id v5 = v8;

  if ((v4 & 1) == 0)
  {
    uint64_t v7 = sub_100014A08((uint64_t)"-[MIDiskImageManager unregisterContentsAtMountPoint:completion:]_block_invoke_2", 499, MIInstallerErrorDomain, 4, v5, 0, @"Unregistering applications failed for mount point %@", v6, a1[5]);

    id v5 = (id)v7;
  }
  (*(void (**)(void))(a1[6] + 16))();
}

id sub_10001482C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8)
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (v17) {
    id v19 = [v17 mutableCopy];
  }
  else {
    id v19 = (id)objc_opt_new();
  }
  long long v20 = v19;
  if (v18)
  {
    id v21 = [objc_alloc((Class)NSString) initWithFormat:v18 arguments:a8];
    [v20 setObject:v21 forKeyedSubscript:NSLocalizedDescriptionKey];
  }
  if (v16) {
    [v20 setObject:v16 forKeyedSubscript:NSUnderlyingErrorKey];
  }
  id v22 = +[NSString stringWithUTF8String:a1];
  [v20 setObject:v22 forKeyedSubscript:MIFunctionNameErrorKey];

  id v23 = +[NSNumber numberWithInt:a2];
  [v20 setObject:v23 forKeyedSubscript:MISourceFileLineErrorKey];

  uint64_t v24 = +[NSError errorWithDomain:v15 code:a4 userInfo:v20];

  return v24;
}

id sub_1000149C8(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = sub_10001482C(a1, a2, a3, a4, a5, a6, a7, (uint64_t)&a9);

  return v9;
}

id sub_100014A08(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = sub_100014A48(a1, a2, a3, a4, a5, a6, a7, (uint64_t)&a9);

  return v9;
}

id sub_100014A48(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8)
{
  id v15 = a5;
  id v16 = sub_10001482C(a1, a2, a3, a4, v15, a6, a7, a8);
  id v17 = [v16 userInfo];
  id v18 = [v17 objectForKeyedSubscript:NSLocalizedDescriptionKey];

  if (v15)
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
    {
      id v19 = [v15 domain];
      [v15 code];
      long long v20 = [v15 userInfo];
      id v22 = [v20 objectForKeyedSubscript:NSLocalizedDescriptionKey];
      MOLogWrite();
    }
  }
  else if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
  {
    MOLogWrite();
  }

  return v16;
}

BOOL sub_100014BE0(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 domain];
  uint64_t v3 = MIInstallerErrorDomain;
  if ([v2 isEqualToString:MIInstallerErrorDomain] && objc_msgSend(v1, "code") == (id)12)
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [v1 domain];
    if ([v5 isEqualToString:v3] && objc_msgSend(v1, "code") == (id)11)
    {
      BOOL v4 = 1;
    }
    else
    {
      uint64_t v6 = [v1 domain];
      if ([v6 isEqualToString:v3]) {
        BOOL v4 = [v1 code] == (id)35;
      }
      else {
        BOOL v4 = 0;
      }
    }
  }

  return v4;
}

__CFString *sub_100014CCC()
{
  uint64_t v0 = container_error_copy_unlocalized_description();
  if (v0)
  {
    id v1 = (void *)v0;
    uint64_t v2 = +[NSString stringWithUTF8String:v0];
    free(v1);
  }
  else
  {
    uint64_t v2 = @"(container_error_copy_unlocalized_description returned NULL)";
  }

  return v2;
}

id sub_100014D34(void *a1, id a2)
{
  id v3 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    a2 = [v3 BOOLValue];
  }

  return a2;
}

uint64_t sub_100014D8C(void *a1)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v1 = a1;
  uint64_t v2 = (char *)[v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      id v5 = 0;
      do
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v6 = 0;
          goto LABEL_11;
        }
        ++v5;
      }
      while (v3 != v5);
      id v3 = (char *)[v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  uint64_t v6 = 1;
LABEL_11:

  return v6;
}

id sub_100014E98(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v1 count]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = v1;
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (CFIndex i = 0; i != v5; CFIndex i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if (objc_opt_isKindOfClass()) {
          [v2 addObject:v8];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  id v9 = [v2 copy];

  return v9;
}

uint64_t sub_100014FF4(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  uint64_t v9 = 0;
  long long v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000150D4;
  v8[3] = &unk_10008D0F0;
  void v8[4] = &v9;
  v8[5] = a2;
  v8[6] = a3;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];
  uint64_t v6 = *((unsigned __int8 *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v6;
}

void sub_1000150BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000150D4(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  id v7 = a3;
  if (a1[5] && (objc_opt_isKindOfClass() & 1) == 0 || a1[6] && (objc_opt_isKindOfClass() & 1) == 0)
  {
    *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 0;
    *a4 = 1;
  }
}

id sub_100015170(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v2 = v1;
    }
    else
    {
      id v2 = +[NSString stringWithFormat:@"%@", v1];
    }
    id v3 = v2;
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

id sub_100015200(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (sub_100014D8C(v1))
      {
        id v2 = v1;
LABEL_7:
        id v3 = v2;
        goto LABEL_12;
      }
    }
    else
    {
      if (objc_opt_isKindOfClass())
      {
        id v6 = v1;
        id v2 = +[NSArray arrayWithObjects:&v6 count:1];
        goto LABEL_7;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v4 = [v1 allObjects];
        if (sub_100014D8C(v4)) {
          id v3 = v4;
        }
        else {
          id v3 = 0;
        }

        goto LABEL_12;
      }
    }
  }
  id v3 = 0;
LABEL_12:

  return v3;
}

BOOL sub_100015338(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  BOOL v6 = (v3 != 0) == (v4 != 0) && (!v3 || !v4 || [v3 isEqual:v4]);

  return v6;
}

void sub_100015974(id a1, NSError *a2)
{
  id v2 = a2;
  uint64_t v3 = qword_1000A60B8;
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
  {
    id v4 = v2;
    uint64_t v3 = MOLogWrite();
    id v2 = v4;
  }

  _objc_release_x1(v3, v2);
}

void sub_100015B7C(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
  {
    id v3 = v4;
    MOLogWrite();
  }
  [*(id *)(a1 + 32) invalidate:v3];
}

void sub_100015CA8(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
  {
    id v3 = v4;
    MOLogWrite();
  }
  [*(id *)(a1 + 32) invalidate:v3];
}

uint64_t sub_100015E1C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10001632C()
{
}

void sub_1000163F4()
{
}

uint64_t sub_100016400(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), *(void *)(a1 + 32) != 0);
}

uint64_t sub_1000164F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(unsigned char *)(a1 + 40)) {
    a3 = 0;
  }
  return (*(uint64_t (**)(void, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, a3);
}

void sub_100016754(_Unwind_Exception *a1)
{
}

void sub_100016784()
{
}

void sub_100016824()
{
}

id sub_100016830(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = [v3 xpcConnection];
  id v7 = v5;
  if (!v5)
  {
    uint64_t v9 = sub_100014A08((uint64_t)"_ValidateMIAllowedSPIEntitlement", 192, MIInstallerErrorDomain, 2, 0, &off_100097920, @"XPCConnection object was nil so failing entitlement check", v6, v14);
    goto LABEL_12;
  }
  id v8 = [v5 valueForEntitlement:@"com.apple.private.mobileinstall.allowedSPI"];
  if (!v8) {
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (([v8 isEqualToString:v4] & 1) == 0)
    {
LABEL_10:
      long long v10 = (void *)MIInstallerErrorDomain;
      uint64_t v11 = [v3 clientName];
      uint64_t v9 = sub_100014A08((uint64_t)"_ValidateMIAllowedSPIEntitlement", 190, v10, 2, 0, &off_1000978F8, @"Process %@ is required to have an entitlement named \"%@\" with an array containing \"%@\" to call the MobileInstallation SPI.", v12, (uint64_t)v11);

      goto LABEL_11;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ([v8 containsObject:v4] & 1) == 0) {
      goto LABEL_10;
    }
  }
  uint64_t v9 = 0;
LABEL_11:

LABEL_12:

  return v9;
}

void sub_10001739C()
{
}

void sub_1000174D8(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x100017450);
  }
  JUMPOUT(0x1000174ECLL);
}

uint64_t sub_1000174F4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100017504(uint64_t a1)
{
}

void sub_10001750C(uint64_t a1)
{
  uint64_t v11 = *(void *)(a1 + 32);
  id v2 = +[NSArray arrayWithObjects:&v11 count:1];
  id v3 = [*(id *)(a1 + 40) identity];
  id v4 = [*(id *)(a1 + 40) domain];
  id v10 = 0;
  uint64_t v5 = +[MILaunchServicesOperationManager registerInstalledInfo:v2 forIdentity:v3 inDomain:v4 error:&v10];
  id v6 = v10;
  id v7 = v10;
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v6);
  }
}

id sub_100017A04(void *a1)
{
  id v1 = a1;
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

id sub_100017A60(void *a1)
{
  id v1 = [a1 xpcConnection];
  id v2 = v1;
  if (v1)
  {
    id v3 = [v1 valueForEntitlement:@"com.apple.private.installcoordinationd.daemon"];
    id v4 = sub_100014D34(v3, 0);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

id sub_100017D94()
{
  if (qword_1000A5FB8 != -1) {
    dispatch_once(&qword_1000A5FB8, &stru_10008D3C0);
  }
  uint64_t v0 = (void *)qword_1000A5FB0;

  return v0;
}

id sub_100017DE8(int a1)
{
  id v2 = +[MIDaemonConfiguration sharedInstance];
  unsigned int v3 = [v2 installQOSOverride];

  if (v3)
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5) {
      MOLogWrite();
    }
    intptr_t v4 = v3;
  }
  else if (a1)
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5) {
      MOLogWrite();
    }
    intptr_t v4 = 25;
  }
  else
  {
    intptr_t v4 = 17;
  }
  uint64_t v5 = dispatch_get_global_queue(v4, 0);

  return v5;
}

intptr_t sub_100017EDC(uint64_t a1)
{
  [*(id *)(a1 + 32) _doInstallationForURL:*(void *)(a1 + 40) identity:*(void *)(a1 + 48) domain:*(void *)(a1 + 80) options:*(void *)(a1 + 56) operationType:*(void *)(a1 + 88) completion:*(void *)(a1 + 72)];
  id v2 = *(NSObject **)(a1 + 64);

  return dispatch_semaphore_signal(v2);
}

uint64_t sub_100017F28(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, 0, *(void *)(a1 + 32));
}

void sub_1000182E0()
{
}

void sub_1000183A0()
{
}

uint64_t sub_1000183AC(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

intptr_t sub_1000186FC(uint64_t a1)
{
  [*(id *)(a1 + 32) _stageURL:*(void *)(a1 + 40) identity:*(void *)(a1 + 48) domain:*(void *)(a1 + 80) options:*(void *)(a1 + 56) completion:*(void *)(a1 + 72)];
  id v2 = *(NSObject **)(a1 + 64);

  return dispatch_semaphore_signal(v2);
}

uint64_t sub_100018744(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void sub_100018C48()
{
}

void sub_100018D0C()
{
}

uint64_t sub_100018D18(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), *(void *)(a1 + 32) != 0);
}

void sub_10001901C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000190C8;
  v4[3] = &unk_10008D210;
  id v5 = *(id *)(a1 + 56);
  char v6 = *(unsigned char *)(a1 + 64);
  [v2 _finalizeStagedUpdateForUUID:v3 completion:v4];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

uint64_t sub_1000190C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(unsigned char *)(a1 + 40)) {
    a3 = 0;
  }
  return (*(uint64_t (**)(void, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, a3);
}

uint64_t sub_1000190E8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, 0, *(void *)(a1 + 32));
}

uint64_t sub_1000191B4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100019578()
{
}

void sub_100019630()
{
}

uint64_t sub_10001963C(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), *(void *)(a1 + 32) != 0);
}

void sub_100019CB8()
{
}

void sub_100019D6C()
{
}

uint64_t sub_100019D78(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t sub_100019EB4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001A0D4()
{
}

void sub_10001A190()
{
}

void sub_10001A3B0()
{
}

void sub_10001A468()
{
}

void sub_10001A6B4()
{
}

void sub_10001A770()
{
}

void sub_10001A9D4(_Unwind_Exception *a1)
{
}

void sub_10001A9EC(uint64_t a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  JUMPOUT(0x10001AAA0);
}

#error "10001AA70: call analysis failed (funcsize=37)"

void sub_10001AA8C(_Unwind_Exception *a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x10001AA08);
  }
  _Unwind_Resume(a1);
}

void sub_10001B054(uint64_t a1)
{
  id v1 = *(void **)(a1 + 40);
  id v2 = *(void **)(a1 + 48);
  id v3 = *(id *)(a1 + 32);
  id v4 = v1;
  id v5 = v2;
  [v3 xpcConnection];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100022AC0;
  v36[3] = &unk_10008D428;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v37 = v6;
  id v7 = objc_retainBlock(v36);
  uint64_t v8 = +[MIDaemonConfiguration sharedInstance];
  uint64_t v9 = [v8 dataDirectory];
  id v10 = [v9 URLByAppendingPathComponent:@"LastLaunchServicesMap.plist"];

  uint64_t v11 = +[MIFileManager defaultManager];
  [v11 removeItemAtURL:v10 error:0];

  sub_100016830(v3, @"EnumerateInstalledAppsForLaunchServices");
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    char v13 = 0;
  }
  else if (v4 {
         && ((objc_opt_class(), id v14 = v4, (objc_opt_isKindOfClass() & 1) == 0)
  }
           ? (id v15 = 0)
           : (id v15 = v14),
             v14,
             v15,
             !v15))
  {
    char v13 = 0;
    sub_100014A08((uint64_t)"_DoEnumerationOfInstalledAppsWithOptions", 1327, MIInstallerErrorDomain, 25, 0, 0, @"Options provided was not a dictionary", v16, (uint64_t)v27);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
    {
      uint64_t v27 = [v3 clientName];
      id v29 = v4;
      MOLogWrite();
    }
    id v17 = [v4 objectForKeyedSubscript:@"UserRequestedAppDBRebuild" v27, v29];
    unsigned int v18 = sub_100014D34(v17, 0);

    if (v18)
    {
      v30[0] = 1;
      if ((container_invalidate_code_signing_cache() & 1) == 0
        && (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3))
      {
        uint64_t v28 = v30[0];
        MOLogWrite();
      }
    }
    id v19 = [v4 objectForKeyedSubscript:@"OnlyScanPluginsUnderFrameworks" v28];
    unsigned int v20 = sub_100014D34(v19, 0);

    if (v20)
    {
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5) {
        MOLogWrite();
      }
      uint64_t v21 = 1;
    }
    else
    {
      uint64_t v21 = 0;
    }
    sub_100055710();
    char v13 = 1;
    id v22 = [objc_alloc((Class)MILaunchServicesDatabaseGatherer) initWithOptions:v21 enumerator:v7];
    id v35 = 0;
    [v22 performGatherWithError:&v35];
    id v12 = v35;
  }
  if (v13) {
    sub_100055718();
  }
  [v3 sendDelegateMessagesComplete];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100022BCC;
  v30[3] = &unk_10008D450;
  id v23 = v3;
  id v31 = v23;
  id v24 = v4;
  id v32 = v24;
  id v25 = v5;
  id v34 = v25;
  id v26 = v12;
  id v33 = v26;
  [v23 _callBlockAfterDelegateMessagesSend:"com.apple.installd.enumerate-installed-apps-complete" dispatchBlock:v30];
}

void sub_10001B4C0()
{
}

void sub_10001B590()
{
}

void sub_10001BA88()
{
}

void sub_10001BB50()
{
}

void sub_10001BB5C(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v12];

  if (v6)
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
    {
      id v7 = [[*(id *)(a1 + 32) objectForKeyedSubscript:v12, v12];
      uint64_t v8 = [v7 bundleURL];
      uint64_t v9 = [v8 path];
      id v10 = [v5 bundleURL];
      uint64_t v11 = [v10 path];
      MOLogWrite();
    }
  }
  else
  {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v12];
    [*(id *)(a1 + 40) addObject:v5];
  }
}

void sub_10001C054()
{
}

void sub_10001C114()
{
}

void sub_10001CBFC()
{
}

void sub_10001CD04()
{
}

void sub_10001CD10(uint64_t a1)
{
  id v2 = +[LSApplicationWorkspace defaultWorkspace];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = objc_opt_new();
  id v5 = objc_opt_new();
  id v6 = [*(id *)(a1 + 40) legacySinfInfoDictionary];
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v7 + 40);
  LOBYTE(v3) = [v2 updateSINFMetadataForApplicationWithIdentifier:v3 operationUUID:v4 requestContext:v5 parsedSINFInfo:v6 saveObserver:0 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
}

void sub_10001D478()
{
}

void sub_10001D550()
{
}

void sub_10001D55C(uint64_t a1)
{
  id v2 = +[LSApplicationWorkspace defaultWorkspace];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = objc_opt_new();
  id v5 = objc_opt_new();
  id v6 = [*(id *)(a1 + 40) dictionaryRepresentation];
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v7 + 40);
  LOBYTE(v3) = [v2 updateiTunesMetadataForApplicationWithIdentifier:v3 operationUUID:v4 requestContext:v5 metadataPlist:v6 saveObserver:0 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
}

void sub_10001D870()
{
}

void sub_10001D92C()
{
}

void sub_10001DCD8()
{
}

void sub_10001DD88()
{
}

void sub_10001E080()
{
}

void sub_10001E130()
{
}

void sub_10001E39C()
{
}

void sub_10001E44C()
{
}

void sub_10001E708(_Unwind_Exception *a1)
{
}

void sub_10001E720(uint64_t a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  JUMPOUT(0x10001E7D0);
}

#error "10001E79C: call analysis failed (funcsize=36)"

void sub_10001E7BC(_Unwind_Exception *a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x10001E738);
  }
  _Unwind_Resume(a1);
}

void sub_10001ED3C()
{
}

void sub_10001EE10()
{
}

void sub_10001EE1C(void *a1)
{
  id v2 = +[LSApplicationWorkspace defaultWorkspace];
  uint64_t v3 = a1[4];
  id v4 = objc_opt_new();
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[8];
  uint64_t v7 = a1[9];
  uint64_t v8 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v8 + 40);
  LOBYTE(v3) = [v2 updatePlaceholderMetadataForApplicationWithIdentifier:v3 operationUUID:v4 requestContext:v5 installType:v6 failure:v7 saveObserver:0 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v3;
}

void sub_10001F388()
{
}

void sub_10001F454()
{
}

void sub_10001F7C4()
{
}

void sub_10001F880()
{
}

void sub_10001F994()
{
}

void sub_10001FA4C()
{
}

void sub_10001FD24()
{
}

void sub_10001FDE0()
{
}

void sub_100020478()
{
}

void sub_100020494(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = [*(id *)(a1 + 56) domain];
  id v11 = 0;
  uint64_t v6 = +[MILaunchServicesOperationManager registerInstalledInfo:v2 forAppBundleID:v3 personas:v4 inDomain:v5 error:&v11];
  id v7 = v11;
  id v8 = v11;
  uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;

  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v7);
  }
}

void sub_100020BE0()
{
}

void sub_100021120()
{
}

void sub_1000211D8()
{
}

void sub_100021394()
{
}

void sub_10002144C(_Unwind_Exception *a1)
{
}

void sub_100021DCC()
{
}

void sub_100021DD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100021E04(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
      MOLogWrite();
    }
  }
  else
  {
    id v7 = objc_opt_new();
    id v8 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 40)];
    [v7 setTargetUserID:v8];

    uint64_t v9 = +[LSApplicationWorkspace defaultWorkspace];
    id v10 = [v5 legacyRecordDictionary];
    unsigned int v20 = v10;
    id v11 = +[NSArray arrayWithObjects:&v20 count:1];
    id v19 = 0;
    unsigned __int8 v12 = [v9 registerApplicationForRebuildWithInfoDictionaries:v11 requestContext:v7 registrationError:&v19];
    id v13 = v19;
    id v14 = v19;

    if (v12)
    {
      if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) >= 7) {
        MOLogWrite();
      }
    }
    else
    {
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
      {
        unsigned int v18 = [v5 bundleIdentifier];
        MOLogWrite();
      }
      uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v17 = *(void *)(v15 + 40);
      uint64_t v16 = (id *)(v15 + 40);
      if (!v17) {
        objc_storeStrong(v16, v13);
      }
    }
  }
}

void sub_10002231C()
{
}

void sub_1000223E4()
{
}

void sub_10002298C()
{
}

void sub_100022998(_Unwind_Exception *a1)
{
}

void sub_100022A00(id a1)
{
  id v3 = +[MIDaemonConfiguration sharedInstance];
  dispatch_semaphore_t v1 = dispatch_semaphore_create((intptr_t)[v3 nSimultaneousInstallations]);
  uint64_t v2 = (void *)qword_1000A5FB0;
  qword_1000A5FB0 = (uint64_t)v1;
}

void sub_100022A5C(id a1)
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.mobileinstallation.enumeration", v3);
  uint64_t v2 = (void *)qword_1000A5FC8;
  qword_1000A5FC8 = (uint64_t)v1;
}

void sub_100022AC0(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v8 = [v4 remoteObjectProxyWithErrorHandler:&stru_10008D400];
  id v7 = [v6 legacyRecordDictionary];

  [v8 enumerateAppDictionary:v7 error:v5];
}

void sub_100022B5C(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = qword_1000A60B8;
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
  {
    uint64_t v4 = v2;
    uint64_t v3 = MOLogWrite();
    uint64_t v2 = v4;
  }

  _objc_release_x1(v3, v2);
}

uint64_t sub_100022BCC(uint64_t a1)
{
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
  {
    uint64_t v4 = [*(id *)(a1 + 32) clientName];
    MOLogWrite();
  }
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v2();
}

uint64_t sub_1000233A4()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v1 = qword_1000A5FD0;
  qword_1000A5FD0 = (uint64_t)v0;

  return _objc_release_x1(v0, v1);
}

void sub_1000239A0()
{
}

void sub_1000257D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000257FC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10002580C(uint64_t a1)
{
}

uint64_t sub_100025814(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3 == 4)
  {
    id v7 = [v5 pathExtension];
    if ([v7 isEqualToString:@"app"])
    {
      id v33 = 0;
      id v8 = +[MIExecutableBundle bundleForURL:v6 error:&v33];
      id v9 = v33;
      if (!v8)
      {
        if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
          MOLogWrite();
        }
        uint64_t v24 = *(void *)(*(void *)(a1 + 56) + 8);
        id v25 = *(void **)(v24 + 40);
        *(void *)(v24 + 40) = v9;

        goto LABEL_20;
      }
      id v10 = [v8 identifier];
      if ([v10 isEqualToString:*(void *)(a1 + 32)])
      {
        uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
        id v14 = *(void **)(v11 + 40);
        uint64_t v13 = (id *)(v11 + 40);
        unsigned __int8 v12 = v14;
        if (v14)
        {
          id v32 = (void *)MIInstallerErrorDomain;
          uint64_t v15 = *(void *)(a1 + 32);
          uint64_t v16 = [v12 bundleURL];
          uint64_t v17 = [v16 lastPathComponent];
          id v31 = [v6 lastPathComponent];
          uint64_t v19 = sub_100014A08((uint64_t)"-[MIInstaller _bundleInDirectory:withBundleID:error:]_block_invoke", 437, v32, 181, 0, &off_100097998, @"Multiple .app bundles with the bundle ID \"%@\" were found within the installable: both \"%@\" and \"%@\" have this bundle ID.", v18, v15);
          uint64_t v20 = *(void *)(*(void *)(a1 + 56) + 8);
          uint64_t v21 = *(void **)(v20 + 40);
          *(void *)(v20 + 40) = v19;

LABEL_20:
          uint64_t v22 = 0;
LABEL_28:

          goto LABEL_29;
        }
        objc_storeStrong(v13, v8);
      }
      else
      {
        if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
        {
          id v26 = [v6 lastPathComponent];
          [*(id *)(a1 + 40) path];
          v30 = id v29 = v10;
          uint64_t v28 = v26;
          MOLogWrite();
        }
        [*(id *)(a1 + 48) addObject:v10, v28, v29, v30];
      }
    }
    else
    {
      if ([v7 isEqualToString:@"bundle"])
      {
        if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 5) {
          goto LABEL_27;
        }
      }
      else if (![v7 isEqualToString:@"vpnplugin"] {
             || qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 5)
      }
      {
        goto LABEL_27;
      }
      id v23 = [v6 path];
      MOLogWrite();
    }
LABEL_27:
    uint64_t v22 = 1;
    goto LABEL_28;
  }
  uint64_t v22 = 1;
LABEL_29:

  return v22;
}

void sub_100027504(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100027524(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3 == 8)
  {
    id v7 = [v5 pathExtension];
    if ([v7 isEqualToString:@"mobileprovision"]
      && (uint64_t v8 = MIInstallProfileAtURL(), MIIsFatalMISProfileInstallationError()))
    {
      id v9 = (void *)MIInstallerErrorDomain;
      v20[0] = @"LegacyErrorString";
      v20[1] = MILibMISErrorNumberKey;
      v21[0] = @"ApplicationVerificationFailed";
      id v10 = +[NSNumber numberWithInt:v8];
      v21[1] = v10;
      uint64_t v11 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
      unsigned __int8 v12 = [*(id *)(a1 + 32) installURL];
      uint64_t v19 = MIErrorStringForMISError();
      uint64_t v14 = sub_100014A08((uint64_t)"-[MIInstaller _installProvisioningProfilesAtStagingRootWithError:]_block_invoke", 887, v9, 13, 0, v11, @"Failed to install local provisioning profile at staging root for %@ : 0x%08x (%@)", v13, (uint64_t)v12);
      uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;

      uint64_t v17 = 0;
    }
    else
    {
      uint64_t v17 = 1;
    }
  }
  else
  {
    uint64_t v17 = 1;
  }

  return v17;
}

void sub_1000284D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 152), 8);
  _Unwind_Resume(a1);
}

id sub_100028504(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _fireCallbackWithStatus:a2 percentComplete:a3];
}

void sub_100028514(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  id v6 = 0;
  unsigned __int8 v3 = [v2 performLaunchServicesRegistrationWithError:&v6];
  id v4 = v6;
  id v5 = v6;
  if ((v3 & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), v4);
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

void sub_100029808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v16 - 176), 8);
  _Unwind_Resume(a1);
}

id sub_100029848(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _fireCallbackWithStatus:a2 percentComplete:a3];
}

void sub_100029858(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  id v6 = 0;
  unsigned __int8 v3 = [v2 performLaunchServicesRegistrationWithError:&v6];
  id v4 = v6;
  id v5 = v6;
  if ((v3 & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), v4);
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

void sub_100029A80(id a1)
{
  os_log_t v1 = os_log_create("com.apple.installd", "Signpost");
  uint64_t v2 = qword_1000A5FE0;
  qword_1000A5FE0 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

uint64_t start()
{
  +[NSError _setFileNameLocalizationEnabled:0];
  uint64_t v1 = os_transaction_create();
  if (mach_timebase_info((mach_timebase_info_t)&qword_1000A60C0))
  {
    syslog(3, "Failed to get timebase info\n");
    qword_1000A60C0 = (uint64_t)&_mh_execute_header;
  }
  signal(15, (void (__cdecl *)(int))1);
  uint64_t v2 = dispatch_get_global_queue(21, 0);
  unsigned __int8 v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v2);
  dispatch_source_set_event_handler(v3, &stru_10008D520);
  int v97 = v3;
  dispatch_activate(v3);
  id v4 = +[MIFileManager defaultManager];
  memset(&v105, 0, sizeof(v105));
  id v5 = +[MIDaemonConfiguration sharedInstance];
  id v6 = [v5 installdPath];

  id v7 = v6;
  v98 = v2;
  if (stat((const char *)[v7 fileSystemRepresentation], &v105))
  {
    int v8 = *__error();
    id v9 = [v7 URLByDeletingLastPathComponent];
    id v10 = [v4 debugDescriptionForItemAtURL:v9];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_1000589E0(v7, v8, (uint64_t)v10);
    }
  }
  else
  {
    int st_mode = v105.st_mode;
    if ((v105.st_mode & 0xF000) != 0x4000 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_100058944(v7, st_mode);
    }
    unsigned __int8 v12 = +[MIDaemonConfiguration sharedInstance];
    unsigned int v13 = [v12 uid];

    if (v13 != v105.st_uid && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_1000588A8(v7);
    }
    uint64_t v14 = +[MIDaemonConfiguration sharedInstance];
    unsigned int v15 = [v14 gid];

    if (v15 != v105.st_gid && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_10005880C(v7);
    }
    if ((st_mode & 0xFFF) != 0x1ED && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_100058770(v7);
    }
  }
  int v99 = v0;

  uint64_t v16 = +[MIDaemonConfiguration sharedInstance];
  uint64_t v17 = [v16 currentUserDataDirectory];

  if (!v17) {
    sub_100058754();
  }
  uint64_t v18 = +[MIDaemonConfiguration sharedInstance];
  uint64_t v19 = [v18 installdLibraryPath];
  sub_10002B134(v4, v19, 0);

  uint64_t v20 = +[MIDaemonConfiguration sharedInstance];
  uint64_t v21 = [v20 logDirectory];
  sub_10002B134(v4, v21, 1);

  uint64_t v22 = +[MIDaemonConfiguration sharedInstance];
  id v23 = [v22 dataDirectory];
  sub_10002B134(v4, v23, 0);

  uint64_t v24 = +[MIDaemonConfiguration sharedInstance];
  id v25 = [v24 backedUpStateDirectory];
  sub_10002B134(v4, v25, 0);

  id v26 = +[MIDaemonConfiguration sharedInstance];
  uint64_t v27 = [v26 cachesDirectory];
  sub_10002B134(v4, v27, 0);

  uint64_t v28 = +[MIDaemonConfiguration sharedInstance];
  id v29 = [v28 journalStorageBaseURL];
  sub_10002B134(v4, v29, 0);

  uint64_t v30 = +[MIDaemonConfiguration sharedInstance];
  id v31 = [v30 launchServicesOperationStorageBaseURL];
  sub_10002B134(v4, v31, 0);

  id v32 = +[MIDaemonConfiguration sharedInstance];
  id v33 = [v32 logDirectory];
  id v34 = [v33 URLByAppendingPathComponent:@"mobile_installation.log" isDirectory:0];

  id v35 = sem_open("installd.firstboot_check", 0);
  CFErrorRef v36 = v35;
  if (v35 != (sem_t *)-1)
  {
    sem_close(v35);
LABEL_31:
    id v42 = 0;
    goto LABEL_32;
  }
  id v37 = +[MIDaemonConfiguration sharedInstance];
  id v38 = [v37 roleUserMigrationMarkerFilePath];
  unsigned int v39 = [v4 itemDoesNotExistAtURL:v38];

  if (!v39) {
    goto LABEL_31;
  }
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5) {
    MOLogWrite();
  }
  uint64_t v40 = +[MIHelperServiceClient sharedInstance];
  id v104 = 0;
  unsigned __int8 v41 = [v40 migrateMobileContentWithError:&v104];
  id v42 = v104;

  if ((v41 & 1) == 0)
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
    {
      id v91 = v42;
      MOLogWrite();
    }

    goto LABEL_31;
  }
LABEL_32:
  v96 = (void *)v1;
  qword_1000A60B8 = MOLogOpen();
  if (!qword_1000A60B8) {
    syslog(3, "Failed to set up rotating logs at path %s", (const char *)[v34 fileSystemRepresentation]);
  }
  CFStringRef v43 = +[MIDaemonConfiguration sharedInstance];
  [v43 allowsInternalSecurityPolicy];

  id v44 = v34;
  [v44 fileSystemRepresentation];
  MOLogEnableDiskLogging();
  ICLSetLoggingHandle();
  id v45 = +[MIHelperServiceClient sharedInstance];
  id v103 = v42;
  unsigned __int8 v46 = [v45 wipeStagingRootAndSetUpPerUserDataDirWithError:&v103];
  id v47 = v103;

  if ((v46 & 1) == 0)
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
    {
      id v92 = v47;
      MOLogWrite();
    }

    id v47 = 0;
  }
  long long v48 = +[MIDaemonConfiguration sharedInstance];
  uint64_t v49 = [v48 stagingRootForSystemContent];
  sub_10002B134(v4, (void *)v49, 1);

  long long v50 = +[MIGlobalConfiguration sharedInstance];
  LOBYTE(v49) = [v50 isSharediPad];

  if ((v49 & 1) == 0)
  {
    long long v51 = +[MIDaemonConfiguration sharedInstance];
    id v52 = [v51 currentUserJournalStorageBaseURL];
    sub_10002B134(v4, v52, 0);

    id v53 = +[MIDaemonConfiguration sharedInstance];
    CFErrorRef v54 = [v53 currentUserLaunchServicesOperationStorageBaseURL];
    sub_10002B134(v4, v54, 0);
  }
  LOBYTE(v105.st_dev) = 0;
  uint64_t v55 = +[MITestManager sharedInstance];
  id v102 = v47;
  unsigned int v56 = [v55 isRunningInTestMode:&v105 outError:&v102];
  id v57 = v102;

  if (v56 && LOBYTE(v105.st_dev))
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5) {
      MOLogWrite();
    }
    sub_10002B250(0);
  }
  if (+[ICLFeatureFlags transientBundleCleanupEnabled])
  {
    id v101 = v57;
    unsigned __int8 v58 = +[MIBundleContainer purgeTransientBundleContainersWithError:&v101];
    id v59 = v101;

    if (v58)
    {
      id v57 = v59;
    }
    else
    {
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
      {
        v93 = (const char *)v59;
        MOLogWrite();
      }

      id v57 = 0;
    }
  }
  if (v36 != (sem_t *)-1)
  {
    id v60 = v57;
LABEL_73:
    uint64_t v81 = &BZ2_bzRead_ptr;
    goto LABEL_74;
  }
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5) {
    MOLogWrite();
  }
  uint64_t v61 = +[MIDaemonConfiguration sharedInstance];
  uint64_t v62 = [v61 lastBuildInfoFileURL];

  v100[1] = 0;
  int v63 = MIIsBuildUpgrade();
  id v64 = 0;
  if (v63)
  {
    uint64_t v65 = +[MIContainerLinkManager sharedInstanceForDomain:2];
    if (!v65
      || (v66 = (void *)v65,
          +[MIContainerLinkManager sharedInstanceForDomain:3], v67 = objc_claimAutoreleasedReturnValue(), v67, v66, !v67))
    {
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
        MOLogWrite();
      }
    }
    v68 = +[MIDaemonConfiguration sharedInstance];
    uint64_t v69 = [v68 dataDirectory];
    uint64_t v70 = [v69 URLByAppendingPathComponent:@"DeveloperDiskImageInfo.plist" isDirectory:0];
    [v4 removeItemAtURL:v70 error:0];

    uint64_t v71 = +[MIDaemonConfiguration sharedInstance];
    uint64_t v72 = [v71 dataDirectory];
    v73 = [v72 URLByAppendingPathComponent:@"DiskImagesInfo.plist" isDirectory:0];
    [v4 removeItemAtURL:v73 error:0];

    uint64_t v74 = +[MIKeychainAccessGroupTracker sharedTracker];
    [v74 reconcile];

    uint64_t v75 = +[MIDaemonConfiguration sharedInstance];
    uint64_t v76 = [(id)v75 dataDirectory];
    uint64_t v77 = [v76 URLByAppendingPathComponent:@"ArchivedApplications.plist" isDirectory:0];
    [v4 removeItemAtURL:v77 error:0];

    v100[0] = v57;
    LOBYTE(v75) = +[MIObsoleteUpgradeCleaner cleanUpgradesWithError:v100];
    id v60 = v100[0];

    if ((v75 & 1) == 0 && (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3))
    {
      id v94 = v60;
      MOLogWrite();
    }
    sub_10002B250(v64);
    MIRecordCurrentBuildVersion();
    id v0 = v99;
  }
  else
  {
    id v60 = v57;
  }
  CFErrorRef v78 = +[MIUninstalledAppList sharedList];
  [v78 preflightUninstalledMap];

  uint64_t v79 = +[MIDiskImageManager sharedInstance];
  [v79 resetMountPaths];

  uint64_t v80 = sem_open("installd.firstboot_check", 512, 256, 0, v96);
  if (v80 != (sem_t *)-1)
  {
    sem_close(v80);
    goto LABEL_73;
  }
  uint64_t v81 = &BZ2_bzRead_ptr;
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
  {
    uint64_t v90 = __error();
    v93 = "installd.firstboot_check";
    v95 = strerror(*v90);
    MOLogWrite();
  }
LABEL_74:
  uint64_t v82 = [v81[324] sharedInstance:v93, v95];
  unsigned __int8 v83 = [v82 isSharediPad];

  if (v83)
  {
    size_t v84 = 0;
  }
  else
  {
    size_t v84 = +[MILaunchServicesOperationManager instanceForSystemSharedContent];
  }
  v85 = +[MILaunchServicesOperationManager instanceForCurrentUser];
  if (v36 == (sem_t *)-1)
  {
    [v84 purge];
    [v85 purge];
  }
  else
  {
    [v84 reconcile];
    [v85 reconcile];
  }
  uint64_t v86 = +[MIJournal sharedInstance];
  [v86 reconcile];
  id v87 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.mobile.installd"];
  uint64_t v88 = objc_opt_new();
  [v87 setDelegate:v88];
  [v87 resume];

  CFRunLoopRun();

  return 0;
}

void sub_10002B0E0(id a1)
{
  uint64_t v1 = qword_1000A60B8;
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5) {
    uint64_t v1 = MOLogWrite();
  }

  _xpc_transaction_exit_clean(v1);
}

void sub_10002B134(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  id v12 = 0;
  unsigned __int8 v7 = [v5 createDirectoryAtURL:v6 withIntermediateDirectories:a3 mode:493 class:4 error:&v12];
  id v8 = v12;
  id v9 = v8;
  if (v7) {
    goto LABEL_9;
  }
  id v10 = [v8 domain];
  if ([v10 isEqualToString:NSPOSIXErrorDomain])
  {
    id v11 = [v9 code];

    if (v11 == (id)28)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
        sub_100058AB4(v6, (uint64_t)v9, v5);
      }
      goto LABEL_9;
    }
  }
  else
  {
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
    sub_100058B74(v6, (uint64_t)v9, v5);
  }
LABEL_9:
}

void sub_10002B250(void *a1)
{
  id v1 = a1;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
      MOLogWrite();
    }
    goto LABEL_65;
  }
  uint64_t v70 = objc_opt_new();
  uint64_t v2 = objc_opt_new();
  unsigned __int8 v3 = objc_opt_new();
  id v4 = +[MIGlobalConfiguration sharedInstance];
  unsigned __int8 v5 = [v4 isSharediPad];

  if (v5) {
    goto LABEL_64;
  }
  id v6 = &BZ2_bzRead_ptr;
  unsigned __int8 v7 = +[MIDaemonConfiguration sharedInstance];
  unsigned int v8 = [v7 wasErroneousContainerCleanupDone];

  id v90 = 0;
  uint64_t v9 = +[MIContainer containersWithClass:1 error:&v90];
  id v10 = v90;
  v68 = v3;
  id v57 = (void *)v9;
  if (!v9)
  {
    if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3) {
      goto LABEL_58;
    }
    uint64_t v52 = (uint64_t)v10;
LABEL_57:
    MOLogWrite();
LABEL_58:
    id obj = 0;
    goto LABEL_59;
  }
  id v11 = +[UMUserManager sharedManager];
  id v89 = v10;
  id v12 = [v11 listAllPersonaAttributesWithError:&v89];
  id v56 = v89;

  if (!v12)
  {
    if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3)
    {
      id obj = 0;
      id v10 = v56;
      goto LABEL_59;
    }
    id v10 = v56;
    uint64_t v52 = (uint64_t)v56;
    goto LABEL_57;
  }
  unsigned int v54 = v8;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id obj = v12;
  id v13 = [obj countByEnumeratingWithState:&v85 objects:v96 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v86;
    do
    {
      for (CFIndex i = 0; i != v14; CFIndex i = (char *)i + 1)
      {
        if (*(void *)v86 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void **)(*((void *)&v85 + 1) + 8 * i);
        if ([v17 isDataSeparatedPersona])
        {
          uint64_t v18 = [v17 userPersonaBundleIDList];
          [v2 addObjectsFromArray:v18];

          uint64_t v19 = [v17 userPersonaUniqueString];
          [v70 addObject:v19];
        }
      }
      id v14 = [obj countByEnumeratingWithState:&v85 objects:v96 count:16];
    }
    while (v14);
  }

  if (![v70 count])
  {
    uint64_t v44 = 1;
    id v10 = v56;
    id v6 = &BZ2_bzRead_ptr;
    goto LABEL_63;
  }
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id v58 = v57;
  uint64_t v55 = (uint64_t)v1;
  id v62 = [v58 countByEnumeratingWithState:&v81 objects:v95 count:16];
  if (!v62)
  {
    uint64_t v69 = 0;
    uint64_t v20 = v3;
    goto LABEL_68;
  }
  uint64_t v69 = 0;
  uint64_t v61 = *(void *)v82;
  uint64_t v20 = v3;
  id v59 = v2;
  do
  {
    for (CFIndex j = 0; j != v62; CFIndex j = (char *)j + 1)
    {
      if (*(void *)v82 != v61) {
        objc_enumerationMutation(v58);
      }
      uint64_t v22 = *(void **)(*((void *)&v81 + 1) + 8 * (void)j);
      uint64_t v24 = [v22 identifier];
      id v80 = 0;
      id v25 = +[MIContainer allContainersForAllPersonasForIdentifier:v24 options:2 error:&v80];
      id v26 = v80;
      uint64_t v27 = v26;
      if (v25)
      {
        id v63 = v26;
        v66 = v23;
        v67 = j;
        uint64_t v65 = v24;
        unsigned int v28 = [v2 containsObject:v24];
        long long v76 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        id v64 = v25;
        id v29 = v25;
        id v30 = [v29 countByEnumeratingWithState:&v76 objects:v94 count:16];
        if (!v30) {
          goto LABEL_41;
        }
        id v31 = v30;
        uint64_t v32 = *(void *)v77;
        while (1)
        {
          for (k = 0; k != v31; k = (char *)k + 1)
          {
            if (*(void *)v77 != v32) {
              objc_enumerationMutation(v29);
            }
            id v34 = *(void **)(*((void *)&v76 + 1) + 8 * (void)k);
            id v35 = [v34 personaUniqueString:v52];
            unsigned int v36 = [v70 containsObject:v35];

            if (v28 != v36)
            {
              id v37 = v34;
              id v38 = [v37 containerURL];
              unsigned __int8 v92 = 0;
              unsigned int v39 = +[MIHelperServiceClient sharedInstance];
              id v40 = [v37 containerClass];
              id v91 = 0;
              unsigned __int8 v41 = [v39 dataContainer:v38 ofContainerType:v40 isEmpty:&v92 error:&v91];
              id v42 = v91;

              if (v41)
              {
                int v43 = v92;

                uint64_t v20 = v68;
                if (!v43) {
                  goto LABEL_34;
                }
              }
              else
              {
                if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
                {
                  uint64_t v52 = (uint64_t)v37;
                  id v53 = v42;
                  MOLogWrite();
                }

                uint64_t v20 = v68;
LABEL_34:
                if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
                {
                  uint64_t v52 = (uint64_t)v37;
                  MOLogWrite();
                }
                ++v69;
              }
              [v20 addObject:v37, v52, v53];
              continue;
            }
          }
          id v31 = [v29 countByEnumeratingWithState:&v76 objects:v94 count:16];
          if (!v31)
          {
LABEL_41:

            uint64_t v2 = v59;
            id v23 = v66;
            CFIndex j = v67;
            id v25 = v64;
            uint64_t v24 = v65;
            uint64_t v27 = v63;
            goto LABEL_45;
          }
        }
      }
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
      {
        uint64_t v52 = (uint64_t)v24;
        id v53 = v26;
        MOLogWrite();
      }
LABEL_45:
    }
    id v62 = [v58 countByEnumeratingWithState:&v81 objects:v95 count:16];
  }
  while (v62);
LABEL_68:

  if (![v20 count])
  {
    id v10 = v56;
    id v6 = &BZ2_bzRead_ptr;
LABEL_90:
    if (v69)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
        sub_100058C34(v69);
      }
      id v1 = (id)v55;
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
      {
        uint64_t v52 = v69;
        MOLogWrite();
      }
      uint64_t v44 = 1;
    }
    else
    {
      uint64_t v44 = 1;
      id v1 = (id)v55;
    }
    goto LABEL_63;
  }
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v46 = v20;
  id v47 = [v46 countByEnumeratingWithState:&v72 objects:v93 count:16];
  if (v47)
  {
    id v48 = v47;
    uint64_t v49 = *(void *)v73;
    do
    {
      for (m = 0; m != v48; m = (char *)m + 1)
      {
        if (*(void *)v73 != v49) {
          objc_enumerationMutation(v46);
        }
        if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
        {
          uint64_t v52 = *(void *)(*((void *)&v72 + 1) + 8 * (void)m);
          MOLogWrite();
        }
      }
      id v48 = [v46 countByEnumeratingWithState:&v72 objects:v93 count:16];
    }
    while (v48);
  }

  id v1 = (id)v55;
  id v6 = &BZ2_bzRead_ptr;
  unsigned int v8 = v54;
  if (v54)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_100058CC8(v55);
    }
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
    {
      uint64_t v52 = v55;
      MOLogWrite();
    }
  }
  id v71 = v56;
  unsigned __int8 v51 = +[MIContainer removeContainers:waitForDeletion:error:](MIContainer, "removeContainers:waitForDeletion:error:", v46, 0, &v71, v52);
  id v10 = v71;

  if (v51) {
    goto LABEL_90;
  }
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
  {
    uint64_t v52 = (uint64_t)v10;
    MOLogWrite();
  }
LABEL_59:
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
  {
    uint64_t v52 = v8;
    MOLogWrite();
  }
  uint64_t v44 = 0;
LABEL_63:
  id v45 = [v6[320] sharedInstance:v52];
  [v45 setErroneousContainerCleanupDone:v44];

  unsigned __int8 v3 = v68;
LABEL_64:

LABEL_65:
}

void sub_10002BB90(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0x18u);
}

uint64_t sub_10002BC60()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v1 = qword_1000A5FF0;
  qword_1000A5FF0 = (uint64_t)v0;

  return _objc_release_x1(v0, v1);
}

uint64_t sub_10002C368(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3 == 8
    && ([v5 pathExtension],
        unsigned __int8 v7 = objc_claimAutoreleasedReturnValue(),
        unsigned int v8 = [v7 isEqualToString:@"plist"],
        v7,
        v8))
  {
    id v20 = 0;
    uint64_t v9 = +[NSData dataWithContentsOfURL:v6 options:3 error:&v20];
    id v10 = v20;
    if (v9)
    {
      uint64_t v11 = *(void *)(a1 + 32);
      id v19 = v10;
      id v12 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v11 fromData:v9 error:&v19];
      id v13 = v19;

      id v14 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
      if (v12)
      {
        uint64_t v15 = v14();
      }
      else
      {
        v14();
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
          sub_100058F5C(v6);
        }
        if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
        {
          uint64_t v18 = [v6 path];
          MOLogWrite();
        }
        uint64_t v15 = *(unsigned char *)(a1 + 48) != 0;
      }

      id v10 = v13;
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
        sub_100058EC4(v6);
      }
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
      {
        uint64_t v17 = [v6 path];
        MOLogWrite();
      }
      uint64_t v15 = *(unsigned char *)(a1 + 48) != 0;
    }
  }
  else
  {
    uint64_t v15 = 1;
  }

  return v15;
}

BOOL sub_10002C668(id a1, MIJournalEntry *a2, NSError *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (v4)
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
    {
      uint64_t v15 = v4;
      MOLogWrite();
    }
    id v16 = 0;
    unsigned __int8 v6 = -[MIJournalEntry finalizeWithError:](v4, "finalizeWithError:", &v16, v15);
    id v7 = v16;
    if ((v6 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
        sub_100058FF4((uint64_t)v4, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
      }
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
        MOLogWrite();
      }
    }
  }
  return 1;
}

void sub_10002C888(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002C8A0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10002C8B0(uint64_t a1)
{
}

uint64_t sub_10002C8B8(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v5 = [v4 uniqueIdentifier];
  unsigned int v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }

  return v6 ^ 1;
}

void sub_10002CA80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002CA98(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (a2) {
    [*(id *)(a1 + 32) addObject:a2];
  }
  else {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }

  return 1;
}

void sub_10002CB40(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0x20u);
}

uint64_t sub_10002CB5C()
{
  id v0 = +[MIGlobalConfiguration sharedInstance];
  uint64_t v1 = [v0 migrationPlistURL];
  uint64_t v2 = MIIsBuildUpgrade() ^ 1;

  return v2;
}

void sub_10002D8A0(_Unwind_Exception *a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x10002D818);
  }
  _Unwind_Resume(a1);
}

void sub_10002D8BC(uint64_t a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  JUMPOUT(0x10002D8C8);
}

void sub_10002DC78(id a1)
{
  uint64_t v1 = objc_alloc_init(MISystemAppMigrationState);
  uint64_t v2 = qword_1000A6008;
  qword_1000A6008 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

void sub_10002DD4C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 8))
  {
    *(unsigned char *)(v1 + 8) = *(unsigned char *)(a1 + 40);
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5) {
      MOLogWrite();
    }
    unsigned __int8 v3 = +[MIDaemonConfiguration sharedInstance];
    id v4 = [v3 migrationPlistURL];
    MIRecordCurrentBuildVersion();

    id v5 = [*(id *)(a1 + 32) blockArray];

    if (v5)
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      id v6 = [*(id *)(a1 + 32) blockArray];
      id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v12;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v12 != v9) {
              objc_enumerationMutation(v6);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * (void)v10) + 16))();
            uint64_t v10 = (char *)v10 + 1;
          }
          while (v8 != v10);
          id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v8);
      }

      [*(id *)(a1 + 32) setBlockArray:0];
    }
  }
}

void sub_10002DFA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002DFBC(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

void sub_10002E084(uint64_t a1)
{
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (v2[8])
  {
    unsigned __int8 v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
  else
  {
    id v4 = [v2 blockArray];

    if (v4
      || (id v5 = objc_alloc_init((Class)NSMutableArray),
          [*(id *)(a1 + 32) setBlockArray:v5],
          v5,
          [*(id *)(a1 + 32) blockArray],
          id v6 = objc_claimAutoreleasedReturnValue(),
          v6,
          v6))
    {
      id v11 = [*(id *)(a1 + 32) blockArray];
      id v8 = objc_retainBlock(*(id *)(a1 + 40));
      [v11 addObject:v8];
    }
    else
    {
      uint64_t v9 = *(void *)(a1 + 40);
      sub_100014A08((uint64_t)"-[MISystemAppMigrationState waitForSystemAppMigrationToComplete:]_block_invoke", 118, MIInstallerErrorDomain, 4, 0, 0, @"Failed to create an array", v7, v10);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id))(v9 + 16))(v9, v11);
    }
  }
}

void sub_10002E2BC(id a1, NSString *a2, NSDictionary *a3, BOOL *a4)
{
  id v6 = a2;
  uint64_t v7 = a3;
  *a4 = 0;
  id v8 = v6;
  id v42 = 0;
  uint64_t v9 = +[MIBundleContainer appBundleContainerWithIdentifier:v8 createIfNeeded:0 created:0 error:&v42];
  id v10 = v42;
  id v11 = v10;
  if (v9)
  {
    long long v12 = [(NSDictionary *)v7 objectForKeyedSubscript:kCFBundleVersionKey];
    objc_opt_class();
    id v13 = v12;
    if (objc_opt_isKindOfClass()) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }

    if (!v14)
    {
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
        MOLogWrite();
      }
      goto LABEL_47;
    }
    uint64_t v17 = [v9 bundle];

    if (!v17)
    {
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
      {
        id v23 = [v9 containerURL];
        id v34 = [v23 path];
        MOLogWrite();
      }
      goto LABEL_47;
    }
    uint64_t v18 = [v9 bundle];
    id v19 = [v18 infoPlistSubset];
    id v20 = [v19 objectForKeyedSubscript:kCFBundleVersionKey];
    objc_opt_class();
    id v21 = v20;
    if (objc_opt_isKindOfClass()) {
      id v22 = v21;
    }
    else {
      id v22 = 0;
    }

    if (v22)
    {
      if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) >= 7)
      {
        uint64_t v24 = [v9 containerURL];
        [v24 path];
        id v38 = v22;
        id v40 = v14;
        v36 = id v33 = v8;
        MOLogWrite();
      }
      id v25 = [v22 compare:v14 options:64 range:v33];
      if (v25 == (id)-1) {
        goto LABEL_35;
      }
      id v26 = v25;
      uint64_t v27 = +[MIDaemonConfiguration sharedInstance];
      unsigned __int8 v28 = [v27 allowsInternalSecurityPolicy];
      if (!v26 && (v28 & 1) == 0)
      {

        goto LABEL_35;
      }
      id v29 = +[MIDaemonConfiguration sharedInstance];
      unsigned int v30 = [v29 allowsInternalSecurityPolicy];

      if (v30)
      {
LABEL_35:
        if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
        {
          id v37 = v22;
          id v39 = v14;
          id v35 = v8;
          MOLogWrite();
        }
        id v41 = v11;
        unsigned __int8 v31 = [v9 removeUnderlyingContainerWaitingForDeletion:0 error:&v41 v35, v37, v39];
        id v32 = v41;

        if ((v31 & 1) == 0 && (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)) {
          MOLogWrite();
        }
        id v11 = v32;
        goto LABEL_46;
      }
      if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 5)
      {
LABEL_46:

LABEL_47:
        goto LABEL_48;
      }
    }
    else if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3)
    {
      goto LABEL_46;
    }
    MOLogWrite();
    goto LABEL_46;
  }
  uint64_t v15 = [v10 domain];
  if ([v15 isEqualToString:MIContainerManagerErrorDomain])
  {
    id v16 = [v11 code];

    if (v16 == (id)21) {
      goto LABEL_48;
    }
  }
  else
  {
  }
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
    MOLogWrite();
  }
LABEL_48:
}

id sub_10002F2C4()
{
  id v0 = +[MIDaemonConfiguration sharedInstance];
  uint64_t v1 = [v0 dataDirectory];
  uint64_t v2 = [v1 URLByAppendingPathComponent:@"LinkedParentBundles.plist" isDirectory:0];

  return v2;
}

id sub_10002F33C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onQueue_migratePlaygroundsBundleMetadata];
}

uint64_t sub_10002F3E4()
{
  id v0 = [objc_alloc((Class)objc_opt_class()) initWithDomain:2];
  uint64_t v1 = qword_1000A6018;
  qword_1000A6018 = (uint64_t)v0;

  return _objc_release_x1(v0, v1);
}

uint64_t sub_10002F4C8()
{
  id v0 = [objc_alloc((Class)objc_opt_class()) initWithDomain:3];
  uint64_t v1 = qword_1000A6028;
  qword_1000A6028 = (uint64_t)v0;

  return _objc_release_x1(v0, v1);
}

void sub_100030430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100030454(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100030464(uint64_t a1)
{
}

void sub_10003046C(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  id obj = 0;
  unsigned __int8 v5 = [v2 _onQueue_isValidLinkForParent:v3 toChild:v4 error:&obj];
  id v6 = obj;
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v5;
  objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), v6);
}

void sub_100030668(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_10003068C(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  id obj = 0;
  unsigned __int8 v5 = [v2 _onQueue_updateLinkForParent:v3 toChild:v4 operationType:0 error:&obj];
  id v6 = obj;
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v5;
  objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), v6);
}

void sub_10003088C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1000308B0(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  id obj = 0;
  unsigned __int8 v5 = [v2 _onQueue_updateLinkForParent:v3 toChild:v4 operationType:1 error:&obj];
  id v6 = obj;
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v5;
  objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), v6);
}

void sub_100030EC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_100030EE4(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v10 = 0;
  uint64_t v4 = [v2 _onQueue_childrenForParentBundleID:v3 error:&v10];
  id v5 = v10;
  uint64_t v6 = *(void *)(a1[6] + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v4;

  uint64_t v8 = *(void *)(a1[7] + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
}

void sub_100031260(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_100031284(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id obj = 0;
  unsigned __int8 v4 = [v2 _onQueue_removeParent:v3 error:&obj];
  id v5 = obj;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v4;
  objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), v5);
}

void sub_100031370(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void _MILogTransactionStep(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  uint64_t v17 = v16;
  switch(a2)
  {
    case 1:
      uint64_t v18 = "Start";
      if (!v16) {
        goto LABEL_15;
      }
      break;
    case 2:
      if (!v16)
      {
        id v19 = "Fail";
        if (a3) {
          id v19 = "Success";
        }
        if ((unint64_t)(a1 - 1) > 0xD) {
          id v20 = "Unknown";
        }
        else {
          id v20 = off_10008D6A8[a1 - 1];
        }
        +[NSString stringWithFormat:@"%s (%s) : %s", v19, "End", v20, 0];
        goto LABEL_21;
      }
      break;
    case 3:
      uint64_t v18 = "Start (Asynch)";
      if (!v16) {
        goto LABEL_15;
      }
      break;
    default:
      uint64_t v18 = "Unknown Phase";
      if (!v16)
      {
LABEL_15:
        if ((unint64_t)(a1 - 1) > 0xD) {
          id v22 = "Unknown";
        }
        else {
          id v22 = off_10008D6A8[a1 - 1];
        }
        +[NSString stringWithFormat:@"%s : %s", v18, v22, v24, 0];
LABEL_21:
        id v21 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
      break;
  }
  id v21 = [objc_alloc((Class)NSString) initWithFormat:v16 arguments:&a9];
LABEL_22:
  id v23 = v21;
  +[AITransactionLog logStep:a1 byParty:7 phase:a2 success:a3 forBundleID:v14 persona:v15 description:v21];
}

__CFString *sub_1000329FC(unint64_t a1)
{
  if (a1 >= 9)
  {
    uint64_t v1 = +[NSString stringWithFormat:@"Unknown phase: %lu", a1];
  }
  else
  {
    uint64_t v1 = off_10008D718[a1];
  }

  return v1;
}

void sub_1000375CC(void *a1)
{
  id v1 = a1;
  uint64_t v2 = qword_1000A60B8;
  id v3 = v1;
  if (!v1)
  {
LABEL_5:
    if (!v2) {
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
  {
    MOLogWrite();
    uint64_t v2 = qword_1000A60B8;
    goto LABEL_5;
  }
LABEL_6:
  if (*(int *)(v2 + 44) >= 7) {
    MOLogWrite();
  }
LABEL_8:
  notify_post("com.apple.mobile.application_deletion_complete");
}

void sub_100038EE8(_Unwind_Exception *a1)
{
}

uint64_t sub_1000390A0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000390B0(uint64_t a1)
{
}

void sub_1000390B8(uint64_t a1)
{
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = *(id *)(a1 + 32);
  id v2 = [obj countByEnumeratingWithState:&v48 objects:v58 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v49;
    uint64_t v40 = kMIUninstallParallelPlaceholderKey;
    uint64_t v41 = *(void *)v49;
    do
    {
      id v5 = 0;
      id v42 = v3;
      do
      {
        if (*(void *)v49 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v48 + 1) + 8 * (void)v5);
        uint64_t v7 = [v6 bundleIdentifier:v38, v39];
        uint64_t v8 = [*(id *)(a1 + 40) objectForKeyedSubscript:v7];
        uint64_t v9 = v8;
        if (v8)
        {
          if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
          {
            [v8 path];
            v39 = id v38 = v7;
            MOLogWrite();
          }
          id v10 = +[MILaunchServicesOperationManager instanceForCurrentUser];
          uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
          id v47 = *(id *)(v11 + 40);
          long long v12 = [v10 registerInstalledInfoForBuiltInAppAtURL:v9 error:&v47];
          objc_storeStrong((id *)(v11 + 40), v47);

          if (!v12)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
            {
              id v34 = [v9 path];
              uint64_t v35 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
              *(_DWORD *)buf = 136315650;
              id v53 = "-[MIUninstaller performUninstallationByRevokingTemporaryReference:error:]_block_invoke";
              __int16 v54 = 2112;
              uint64_t v55 = v34;
              __int16 v56 = 2112;
              uint64_t v57 = v35;
              _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: Failed to re-register built-in app at %@ : %@", buf, 0x20u);
            }
            if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
            {
              id v38 = [v9 path];
              id v39 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
              MOLogWrite();
            }
            *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
          }
          goto LABEL_55;
        }
        if (![v6 doesNotHaveBundleContainer])
        {
          if ([v6 hasParallelPlaceholder])
          {
            id v14 = v7;
            id v15 = &__kCFBooleanTrue;
            goto LABEL_24;
          }
          unsigned int v16 = [v6 isPlaceholder];
          id v14 = v7;
          if (v16)
          {
            id v15 = &__kCFBooleanTrue;
            uint64_t v17 = &__kCFBooleanFalse;
          }
          else
          {
            id v15 = &__kCFBooleanFalse;
LABEL_24:
            uint64_t v17 = &__kCFBooleanTrue;
          }
          uint64_t v13 = +[LSPrecondition registrationStatePreconditionForBundleWithIdentifier:v14 placeholderInstalled:v15 fullApplicationInstalled:v17];
          goto LABEL_26;
        }
        uint64_t v13 = +[LSPrecondition emptyPrecondition];
LABEL_26:
        uint64_t v44 = (void *)v13;
        if ([v6 isLinked])
        {
          unsigned int v18 = 0;
          uint64_t v19 = 3;
        }
        else
        {
          id v20 = [*(id *)(a1 + 48) options];
          id v21 = [v20 objectForKeyedSubscript:@"UninstallPlaceholdersOnly"];
          unsigned __int8 v22 = [v21 isEqual:&__kCFBooleanTrue];

          if (v22)
          {
            unsigned int v18 = 1;
            uint64_t v19 = 1;
          }
          else
          {
            id v23 = [*(id *)(a1 + 48) options];
            uint64_t v24 = [v23 objectForKeyedSubscript:v40];
            unsigned int v18 = [v24 isEqual:&__kCFBooleanTrue];

            if (v18) {
              uint64_t v19 = 4;
            }
            else {
              uint64_t v19 = 3;
            }
          }
        }
        int v25 = sub_10000EB14();
        if (+[ICLFeatureFlags appReferencesEnabled])
        {
          id v26 = +[MIGlobalConfiguration sharedInstance];
          unsigned __int8 v27 = [v26 isSharediPad];

          if ((v27 & 1) == 0)
          {
            if (v25)
            {
              if ([v6 isLastReference])
              {
                if ([*(id *)(a1 + 56) containsObject:v7])
                {
                  unsigned __int8 v28 = +[MILaunchServicesOperationManager instanceForSystemSharedContent];
                  uint64_t v29 = *(void *)(*(void *)(a1 + 64) + 8);
                  id v46 = *(id *)(v29 + 40);
                  unsigned __int8 v30 = [v28 unregisterAppForBundleID:v7 inDomain:1 operationType:v19 precondition:v44 error:&v46];
                  objc_storeStrong((id *)(v29 + 40), v46);

                  if ((v30 & 1) == 0)
                  {
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
                    {
                      uint64_t v37 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
                      *(_DWORD *)buf = 136315650;
                      id v53 = "-[MIUninstaller performUninstallationByRevokingTemporaryReference:error:]_block_invoke";
                      __int16 v54 = 2112;
                      uint64_t v55 = v7;
                      __int16 v56 = 2112;
                      uint64_t v57 = v37;
                      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: Failed to unregister record for %@ in system domain: %@", buf, 0x20u);
                    }
                    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
                    {
                      id v38 = v7;
                      id v39 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
                      MOLogWrite();
                    }
                    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
                  }
                }
              }
            }
          }
        }
        if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)
          && (v18 | [v6 isLastReference]) == 1)
        {
          unsigned __int8 v31 = +[MILaunchServicesOperationManager instanceForCurrentUser];
          uint64_t v32 = *(void *)(*(void *)(a1 + 64) + 8);
          id v45 = *(id *)(v32 + 40);
          unsigned __int8 v33 = [v31 unregisterAppForBundleID:v7 inDomain:1 operationType:v19 precondition:v44 error:&v45];
          objc_storeStrong((id *)(v32 + 40), v45);

          if ((v33 & 1) == 0)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
            {
              uint64_t v36 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
              *(_DWORD *)buf = 136315650;
              id v53 = "-[MIUninstaller performUninstallationByRevokingTemporaryReference:error:]_block_invoke";
              __int16 v54 = 2112;
              uint64_t v55 = v7;
              __int16 v56 = 2112;
              uint64_t v57 = v36;
              _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: Failed to unregister record for %@ in user domain: %@", buf, 0x20u);
            }
            if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
            {
              id v38 = v7;
              id v39 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
              MOLogWrite();
            }
            *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
          }
        }

        uint64_t v4 = v41;
        id v3 = v42;
LABEL_55:

        id v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [obj countByEnumeratingWithState:&v48 objects:v58 count:16];
    }
    while (v3);
  }
}

uint64_t sub_10003982C@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2112;
  *(void *)(a2 + 14) = result;
  *(_WORD *)(a2 + 22) = 2112;
  return result;
}

uint64_t sub_1000398E4()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v1 = qword_1000A6038;
  qword_1000A6038 = (uint64_t)v0;

  return _objc_release_x1(v0, v1);
}

void sub_100039990(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100039BF0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v4 - 56));
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100039C30(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidateObject];
}

void sub_100039C70(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidateObject];
}

void sub_100039F98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100039FB0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100039FC0(uint64_t a1)
{
}

void sub_100039FC8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
    MOLogWrite();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_10003A044(uint64_t a1, void *a2)
{
}

void sub_10003A1A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10003A1BC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
    MOLogWrite();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_10003A238(uint64_t a1, void *a2)
{
}

void sub_10003A488(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v13 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_10003A4B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
    MOLogWrite();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_10003A534(void *a1, void *a2, char a3, void *a4)
{
  id v9 = a2;
  id v8 = a4;
  objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a4);
  if (!v8)
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = a3;
  }
}

void sub_10003A75C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10003A774(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
    MOLogWrite();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_10003A7F0(uint64_t a1, void *a2)
{
}

void sub_10003A9A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10003A9C0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
    MOLogWrite();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_10003AA3C(uint64_t a1, void *a2)
{
}

void sub_10003AC0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10003AC30(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
    MOLogWrite();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_10003ACAC(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void sub_10003AED8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_10003AEFC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
    MOLogWrite();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_10003AF78(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

void sub_10003B1F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_10003B214(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
    MOLogWrite();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_10003B290(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (!v4) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

uint64_t sub_10003B3C0()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v1 = qword_1000A6040;
  qword_1000A6040 = (uint64_t)v0;

  return _objc_release_x1(v0, v1);
}

id sub_10003B554(uint64_t a1)
{
  return [*(id *)(a1 + 32) setRefs:0];
}

void sub_10003B6D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10003B6F0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10003B700(uint64_t a1)
{
}

uint64_t sub_10003B708(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3 == 4)
  {
    id v7 = [v5 pathExtension];
    unsigned int v8 = [v7 isEqualToString:@"app"];

    if (v8)
    {
      id v9 = +[MIFileManager defaultManager];
      id v19 = 0;
      id v10 = [v9 insecureCachedAppIdentifierIfValidatedByFreeProfileForBundle:v6 error:&v19];
      id v11 = v19;

      if (v10)
      {
        long long v12 = [*(id *)(a1 + 32) refs];
        [v12 addObject:v10];
      }
      else
      {
        uint64_t v14 = [v11 domain];
        if ([v14 isEqualToString:NSPOSIXErrorDomain])
        {
          id v15 = [v11 code];

          if (v15 == (id)93) {
            goto LABEL_12;
          }
        }
        else
        {
        }
        uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
        id v17 = v11;
        long long v12 = *(void **)(v16 + 40);
        *(void *)(v16 + 40) = v17;
      }

LABEL_12:
      uint64_t v13 = 0;
      goto LABEL_13;
    }
  }
  uint64_t v13 = 1;
LABEL_13:

  return v13;
}

void sub_10003BA00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10003BA18(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  id v8 = 0;
  id v4 = [v3 _onQueue_addAppIdentifierIfCachedOnContainer:a2 error:&v8];
  id v5 = v8;
  id v6 = v8;
  if ((v4 & 1) == 0) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v5);
  }

  return v4;
}

void sub_10003BF40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_10003BF64(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v5 + 40);
  unsigned __int8 v6 = [v2 _onQueue_addReferenceForApplicationIdentifier:v3 bundle:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v6;
}

void sub_10003C3D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10003C3F4(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  unsigned __int8 v5 = [v2 _onQueue_removeReferenceForBundle:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v5;
}

uint64_t sub_10003D2D8()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v1 = qword_1000A6050;
  qword_1000A6050 = (uint64_t)v0;

  return _objc_release_x1(v0, v1);
}

BOOL sub_10003D6AC()
{
  memset(&v2, 0, sizeof(v2));
  BOOL result = 0;
  if (!lstat("/var/mobile/Library/ApplicationSync", &v2))
  {
    __darwin_time_t tv_sec = v2.st_mtimespec.tv_sec;
    if (tv_sec > time(0) - 31536000) {
      return 1;
    }
  }
  return result;
}

void sub_10003D82C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10003D844(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10003D854(uint64_t a1)
{
}

uint64_t sub_10003D85C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _onQueue_uninstalledList];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return _objc_release_x1(v2, v4);
}

void sub_10003D964(uint64_t a1)
{
  [*(id *)(a1 + 32) _onQueue_uninstalledList];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = +[NSDate dateWithTimeIntervalSinceNow:0.0];
  [v3 setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];

  [*(id *)(a1 + 32) _onQueue_setUninstalledList:v3];
}

void sub_10003DA9C(uint64_t a1)
{
  [*(id *)(a1 + 32) _onQueue_uninstalledList];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 removeObjectsForKeys:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _onQueue_setUninstalledList:v2];
}

void sub_10003DE04(void *a1)
{
  id v1 = a1;
  char v12 = 0;
  if (![v1 isTransient])
  {
    id v5 = 0;
    goto LABEL_18;
  }
  id v11 = 0;
  unsigned __int8 v2 = [v1 isStagedUpdateContainer:&v12 withError:&v11];
  id v3 = v11;
  uint64_t v4 = v3;
  if ((v2 & 1) == 0)
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
    {
      id v8 = v1;
      id v9 = v3;
      MOLogWrite();
    }
    char v12 = 0;
LABEL_10:
    unsigned __int8 v6 = [v1 identifier:v8, v9];
    id v10 = v4;
    unsigned __int8 v7 = [v1 removeUnderlyingContainerWaitingForDeletion:0 error:&v10];
    id v5 = v10;

    if (v7)
    {
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) < 7) {
        goto LABEL_17;
      }
    }
    else if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3)
    {
      goto LABEL_17;
    }
    MOLogWrite();
LABEL_17:

    goto LABEL_18;
  }
  if (!v12) {
    goto LABEL_10;
  }
  id v5 = v3;
LABEL_18:
}

void sub_1000432E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a64, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100043340(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100043350(uint64_t a1)
{
}

uint64_t sub_100043358(uint64_t a1, void *a2)
{
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  id v3 = a2;
  [v3 fileSystemRepresentation];
  char v4 = MIMachOFileIterateImageVersions();
  id v5 = 0;
  unsigned __int8 v6 = v5;
  if ((v4 & 1) == 0)
  {
    uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
    id v16 = v5;
    id v10 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v16;
    goto LABEL_5;
  }
  if (!*((unsigned char *)v19 + 24))
  {
    unsigned __int8 v7 = [v3 path];
    id v8 = [*(id *)(a1 + 32) bundleURL];
    id v9 = [v8 path];
    id v10 = [v7 substringFromIndex:[v9 length]];

    uint64_t v12 = sub_100014A08((uint64_t)"-[MIInstallableBundle _performBrowserAppEntitlementAndArchitectureValidationForSigningInfo:error:]_block_invoke", 1698, MIInstallerErrorDomain, 202, 0, 0, @"\"%@\" is not built for the ARM64e architecture. The ARM64e architecture is required for all components of a browser app.", v11, (uint64_t)v10);
    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

LABEL_5:
  }
  _Block_object_dispose(&v18, 8);

  return 1;
}

void sub_100043504(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100043520(uint64_t a1, int a2, int a3)
{
  BOOL v4 = a2 == 16777228 && (a3 & 0xFFFFFF) == 2;
  uint64_t result = !v4;
  if (v4) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return result;
}

uint64_t sub_1000437DC(void *a1)
{
  id v1 = a1;
  if (sub_10004C680(v1))
  {
    uint64_t v2 = 1;
  }
  else if (sub_10004C690(v1))
  {
    uint64_t v2 = (uint64_t)sub_10004C6EC(v1);
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t sub_100045C50(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  unsigned __int8 v7 = [v5 bundleTypeDescription];
  unsigned int v8 = [v5 bundleType];
  if (v8 - 1 < 5 || v8 == 9)
  {

    unsigned __int8 v7 = @"app";
  }
  if (sub_10004D2B8(v6))
  {
    id v10 = (void *)MIInstallerErrorDomain;
    uint64_t v11 = [v5 relativePath];
    sub_100014A08((uint64_t)"_ValidateBundleDoesNotHaveBrowserExtensionEntitlements", 1779, v10, 205, 0, 0, @"The %@ at \"%@\" has the entitlement \"%@\", which is only allowed on app extensions targeting the extension point \"%@\".", v12, (uint64_t)v7);
  }
  else if (sub_10004D2A8(v6))
  {
    uint64_t v13 = (void *)MIInstallerErrorDomain;
    uint64_t v11 = [v5 relativePath];
    sub_100014A08((uint64_t)"_ValidateBundleDoesNotHaveBrowserExtensionEntitlements", 1784, v13, 205, 0, 0, @"The %@ at \"%@\" has the entitlement \"%@\", which is only allowed on app extensions targeting the extension point \"%@\".", v14, (uint64_t)v7);
  }
  else
  {
    if (!sub_10004D298(v6))
    {
      id v17 = 0;
      uint64_t v18 = 1;
      goto LABEL_17;
    }
    uint64_t v15 = (void *)MIInstallerErrorDomain;
    uint64_t v11 = [v5 relativePath];
    sub_100014A08((uint64_t)"_ValidateBundleDoesNotHaveBrowserExtensionEntitlements", 1789, v15, 205, 0, 0, @"The %@ at \"%@\" has the entitlement \"%@\", which is only allowed on app extensions targeting the extension point \"%@\".", v16, (uint64_t)v7);
  }
  id v17 = (id)objc_claimAutoreleasedReturnValue();

  if (a3)
  {
    id v17 = v17;
    uint64_t v18 = 0;
    *a3 = v17;
  }
  else
  {
    uint64_t v18 = 0;
  }
LABEL_17:

  return v18;
}

uint64_t sub_100045E34(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  unsigned __int8 v7 = [v5 bundleTypeDescription];
  if (sub_10004D278(v6))
  {
    unsigned int v8 = (void *)MIInstallerErrorDomain;
    id v9 = [v5 relativePath];
    sub_100014A08((uint64_t)"_ValidateBundleDoesNotHaveBrowserAppEntitlements", 1809, v8, 204, 0, 0, @"The %@ at \"%@\" has the %@\" entitlement, which is only allowed on the browser app itself.", v10, (uint64_t)v7);
  }
  else
  {
    if (!sub_10004D288(v6))
    {
      id v13 = 0;
      uint64_t v14 = 1;
      goto LABEL_9;
    }
    uint64_t v11 = (void *)MIInstallerErrorDomain;
    id v9 = [v5 relativePath];
    sub_100014A08((uint64_t)"_ValidateBundleDoesNotHaveBrowserAppEntitlements", 1815, v11, 213, 0, 0, @"The %@ at \"%@\" has the %@\" entitlement, which is only allowed on the app itself.", v12, (uint64_t)v7);
  }
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  if (a3)
  {
    id v13 = v13;
    uint64_t v14 = 0;
    *a3 = v13;
  }
  else
  {
    uint64_t v14 = 0;
  }
LABEL_9:

  return v14;
}

uint64_t sub_10004B334()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v1 = qword_1000A6060;
  qword_1000A6060 = (uint64_t)v0;

  return _objc_release_x1(v0, v1);
}

void sub_10004B5E4()
{
}

void sub_10004B9EC()
{
}

void sub_10004BFD4(_Unwind_Exception *a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x10004BF4CLL);
  }
  _Unwind_Resume(a1);
}

void sub_10004BFF0(uint64_t a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  JUMPOUT(0x10004BFFCLL);
}

id sub_10004C454(void *a1, void *a2, id a3)
{
  id v5 = a2;
  if (a1)
  {
    id v6 = [a1 objectForKeyedSubscript:v5];
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        a3 = [v6 BOOLValue];
      }
      else if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) >= 7)
      {
        MOLogWrite();
      }
    }
    else
    {
      a3 = 0;
    }
  }
  else
  {
    a3 = 0;
  }

  return a3;
}

uint64_t sub_10004C548(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = a2;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        if (sub_10004C454(v5, *(void **)(*((void *)&v13 + 1) + 8 * (void)v10), a3))
        {
          uint64_t v11 = 1;
          goto LABEL_11;
        }
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  uint64_t v11 = 0;
LABEL_11:

  return v11;
}

id sub_10004C670(void *a1)
{
  return sub_10004C454(a1, @"com.apple.private.mobileinstall.upgrade-enabled", 0);
}

id sub_10004C680(void *a1)
{
  return sub_10004C454(a1, @"com.apple.private.security.container-required", (id)1);
}

id sub_10004C690(void *a1)
{
  return sub_10004C454(a1, @"com.apple.private.security.no-container", 0);
}

id sub_10004C6A0(void *a1)
{
  return sub_10004C454(a1, @"com.apple.private.security.no-sandbox", 0);
}

BOOL sub_10004C6B0(void *a1)
{
  uint64_t v1 = [a1 objectForKeyedSubscript:@"seatbelt-profiles"];
  BOOL v2 = v1 != 0;

  return v2;
}

id sub_10004C6EC(void *a1)
{
  return sub_10004C454(a1, @"platform-application", 0);
}

id sub_10004C6FC(void *a1)
{
  return sub_10004C454(a1, @"com.apple.security.system-container", 0);
}

id sub_10004C70C(void *a1)
{
  return sub_10004C454(a1, @"com.apple.private.mobileinstall.xpc-services-enabled", 0);
}

id sub_10004C71C(void *a1)
{
  return sub_10004C454(a1, @"com.apple.private.security.system-application", 0);
}

id sub_10004C72C(void *a1)
{
  return sub_10004C454(a1, @"com.apple.private.webkit.pushbundle", 0);
}

id sub_10004C73C(void *a1)
{
  return sub_10004C454(a1, @"com.apple.developer.marketplace.app-installation", 0);
}

id sub_10004C74C(void *a1)
{
  uint64_t v1 = [a1 URLByAppendingPathComponent:@"PlaceholderEntitlements.plist" isDirectory:0];
  BOOL v2 = +[NSDictionary dictionaryWithContentsOfURL:v1];

  return v2;
}

id sub_10004C7B0(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [a1 URLByAppendingPathComponent:@"PlaceholderEntitlements.plist" isDirectory:0];
  id v7 = [v5 MI_writeToURL:v6 format:200 options:268435457 error:a3];

  return v7;
}

id sub_10004C82C(void *a1)
{
  return sub_10004C838(a1, @"com.apple.security.application-groups");
}

id sub_10004C838(void *a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [a1 objectForKeyedSubscript:v3];
  if (!v4) {
    goto LABEL_14;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  if (isKindOfClass)
  {
    if (sub_100014D8C(v4))
    {
      id v6 = v4;
LABEL_7:
      id v7 = +[NSSet setWithArray:v6];
      id v8 = [v7 allObjects];

      goto LABEL_16;
    }
    if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3) {
      goto LABEL_14;
    }
LABEL_13:
    MOLogWrite();
LABEL_14:
    id v6 = 0;
    goto LABEL_15;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  uint64_t v10 = v4;
  id v6 = +[NSArray arrayWithObjects:&v10 count:1];
  if (v6) {
    goto LABEL_7;
  }
LABEL_15:
  id v8 = 0;
LABEL_16:

  return v8;
}

BOOL sub_10004C9EC(void *a1)
{
  uint64_t v1 = sub_10004C838(a1, @"com.apple.security.application-groups");
  BOOL v2 = v1 != 0;

  return v2;
}

id sub_10004CA28(void *a1)
{
  id v1 = a1;
  BOOL v2 = sub_10004C838(v1, @"com.apple.security.system-groups");
  id v3 = v2;
  if (!v2 || ![v2 count])
  {
    uint64_t v4 = sub_10004C838(v1, @"com.apple.security.system-group-containers");

    id v3 = (void *)v4;
  }

  return v3;
}

BOOL sub_10004CAB0(void *a1)
{
  id v1 = sub_10004CA28(a1);
  BOOL v2 = v1 != 0;

  return v2;
}

id sub_10004CAE4(void *a1)
{
  return sub_10004C454(a1, @"com.apple.developer.on-demand-install-capable", 0);
}

id sub_10004CAF4(void *a1)
{
  id v1 = [a1 objectForKeyedSubscript:@"com.apple.developer.parent-application-identifiers"];
  objc_opt_class();
  id v2 = v1;
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  if (v3 && (objc_opt_class(), sub_100014D8C(v3))) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

id sub_10004CBB0(void *a1)
{
  id v1 = [a1 objectForKeyedSubscript:@"application-identifier"];
  objc_opt_class();
  id v2 = v1;
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

id sub_10004CC30(void *a1)
{
  id v1 = [a1 objectForKeyedSubscript:@"previous-application-identifiers"];
  objc_opt_class();
  id v2 = sub_100015200(v1);

  return v2;
}

id sub_10004CC98(void *a1)
{
  return sub_10004C454(a1, @"beta-reports-active", 0);
}

id sub_10004CCA8(void *a1)
{
  id v1 = [a1 objectForKeyedSubscript:@"keychain-access-groups"];
  objc_opt_class();
  id v2 = v1;
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  if (v3 && (objc_opt_class(), sub_100014D8C(v3))) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

id sub_10004CD64(void *a1)
{
  return sub_10004C454(a1, @"com.apple.developer.swift-playgrounds-app", 0);
}

id sub_10004CD74(void *a1)
{
  id v1 = [a1 objectForKeyedSubscript:@"com.apple.developer.app-management-domain"];
  objc_opt_class();
  id v2 = v1;
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

uint64_t sub_10004CDF4(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (v1)
  {
    if ([v1 hasPrefix:@"swift-playgrounds"])
    {
      uint64_t v3 = 2;
    }
    else if ([v2 isEqualToString:@"com.apple.WebKit.PushBundles"])
    {
      uint64_t v3 = 3;
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  else
  {
    uint64_t v3 = 1;
  }

  return v3;
}

uint64_t sub_10004CE64(void *a1)
{
  id v1 = sub_10004CD74(a1);
  uint64_t v2 = sub_10004CDF4(v1);

  return v2;
}

id sub_10004CE9C(void *a1)
{
  id v1 = [a1 objectForKeyedSubscript:@"com.apple.developer.networking.networkextension"];
  objc_opt_class();
  id v2 = v1;
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  if (v3 && (objc_opt_class(), sub_100014D8C(v3))) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

id sub_10004CF58(void *a1)
{
  id v1 = [a1 objectForKeyedSubscript:@"com.apple.developer.associated-appclip-app-identifiers"];
  objc_opt_class();
  id v2 = v1;
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  if (v3 && (objc_opt_class(), sub_100014D8C(v3))) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

id sub_10004D014(void *a1)
{
  return sub_10004C454(a1, @"com.apple.developer.driverkit", 0);
}

id sub_10004D024(void *a1)
{
  id v1 = a1;
  id v2 = [v1 objectForKeyedSubscript:@"com.apple.developer.default-data-protection"];
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  if (!v4)
  {
    id v5 = [v1 objectForKeyedSubscript:@"data-protection-class"];
    objc_opt_class();
    id v6 = v5;
    id v4 = (objc_opt_isKindOfClass() & 1) != 0 ? v6 : 0;

    if (!v4)
    {
      id v7 = [v1 objectForKeyedSubscript:@"DataProtectionClass"];
      objc_opt_class();
      id v8 = v7;
      if (objc_opt_isKindOfClass()) {
        id v4 = v8;
      }
      else {
        id v4 = 0;
      }
    }
  }

  return v4;
}

id sub_10004D168(void *a1)
{
  id v1 = [a1 objectForKeyedSubscript:@"com.apple.developer.default-data-protection-if-available"];
  objc_opt_class();
  id v2 = v1;
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  if (v3)
  {
    id v4 = v2;
  }
  else
  {
    objc_opt_class();
    id v5 = v2;
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }

    if (v6)
    {
      id v7 = v5;
      objc_opt_class();
      sub_100014E98(v7);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v4 = 0;
    }
  }

  return v4;
}

id sub_10004D278(void *a1)
{
  return sub_10004C454(a1, @"com.apple.developer.web-browser-engine.host", 0);
}

id sub_10004D288(void *a1)
{
  return sub_10004C454(a1, @"com.apple.developer.embedded-web-browser-engine", 0);
}

id sub_10004D298(void *a1)
{
  return sub_10004C454(a1, @"com.apple.developer.web-browser-engine.rendering", 0);
}

id sub_10004D2A8(void *a1)
{
  return sub_10004C454(a1, @"com.apple.developer.web-browser-engine.networking", 0);
}

id sub_10004D2B8(void *a1)
{
  return sub_10004C454(a1, @"com.apple.developer.web-browser-engine.webcontent", 0);
}

id sub_10004D2C8(void *a1)
{
  id v1 = [a1 objectForKeyedSubscript:@"com.apple.developer.memory.transfer-accept"];
  objc_opt_class();
  id v2 = v1;
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

id sub_10004D348(void *a1)
{
  id v1 = [a1 objectForKeyedSubscript:@"com.apple.developer.memory.transfer-send"];
  objc_opt_class();
  id v2 = v1;
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

id sub_10004D3C8(void *a1)
{
  return sub_10004C454(a1, @"com.apple.developer.web-browser", 0);
}

id sub_10004D3D8(void *a1)
{
  return sub_10004C454(a1, @"com.apple.developer.browser.app-installation", 0);
}

void sub_10004ECDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

uint64_t sub_10004ED18(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10004ED28(uint64_t a1)
{
}

uint64_t sub_10004ED30(uint64_t a1, void *a2, int a3)
{
  id v6 = a2;
  if (a3 == 4)
  {
    id v7 = objc_alloc((Class)NSUUID);
    id v8 = [v6 lastPathComponent];
    id v9 = [v7 initWithUUIDString:v8];

    if (v9)
    {
      uint64_t v10 = *(void **)(a1 + 32);
      id v16 = 0;
      uint64_t v11 = [v10 modificationDateForURL:v6 error:&v16];
      id v12 = v16;
      if (v11)
      {
        if ([v11 compare:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)] == (id)1)
        {
          if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
            [*(id *)(a1 + 40) addObject:];
          }
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v11);
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
        }
        else
        {
          [*(id *)(a1 + 40) addObject:v6];
        }
      }
      else if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
      {
        long long v15 = [v6 path];
        MOLogWrite();
      }
    }
    else if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
    {
      long long v14 = [v6 path];
      MOLogWrite();
    }
  }

  return 1;
}

void sub_10004F59C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_10004F5C4(uint64_t a1, uint64_t a2, int a3)
{
  if (a3 == 8) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return a3 != 8;
}

uint64_t sub_10004FCCC(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3 == 8)
  {
    id v7 = [v5 pathExtension];
    unsigned __int8 v8 = [v7 isEqualToString:@"plist"];

    if (v8)
    {
      id v13 = 0;
      id v9 = [(id)objc_opt_class() _operationFromURL:v6 error:&v13];
      id v10 = v13;
      if (v9)
      {
        [*(id *)(a1 + 32) addObject:v9];
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
          sub_100059D74(v6);
        }
        if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
        {
          id v12 = [v6 path];
          MOLogWrite();
        }
      }

      goto LABEL_14;
    }
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
    {
      id v10 = [v6 lastPathComponent];
      MOLogWrite();
LABEL_14:
    }
  }

  return 1;
}

int64_t sub_10004FE54(id a1, MILaunchServicesOperation *a2, MILaunchServicesOperation *a3)
{
  id v4 = a3;
  unint64_t v5 = [(MILaunchServicesOperation *)a2 serialNumber];
  unint64_t v6 = [(MILaunchServicesOperation *)v4 serialNumber];

  if (v5 >= v6) {
    int64_t v7 = 0;
  }
  else {
    int64_t v7 = -1;
  }
  if (v5 > v6) {
    return 1;
  }
  else {
    return v7;
  }
}

void sub_100051490(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

id sub_1000514CC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _lsApplicationWorkspaceInstance];
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v13 = 0;
  uint64_t v7 = [v2 registerContainerizedApplicationWithInfoDictionaries:v5 operationUUID:v3 requestContext:v4 saveObserver:v6 registrationError:&v13];
  id v8 = v13;
  uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;

  id v11 = 0;
  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)) {
    id v11 = v8;
  }

  return v11;
}

void sub_1000517AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1000517D0(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  uint64_t v6 = a1[8];
  uint64_t v7 = a1[11];
  id v13 = 0;
  uint64_t v8 = [v2 _onQueue_registerApplicationInfo:v3 onMountPoint:v4 forAppBundleID:v5 domain:v7 personas:v6 error:&v13];
  id v9 = v13;
  id v10 = v13;
  uint64_t v11 = *(void *)(a1[9] + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v8;

  if (!*(void *)(*(void *)(a1[9] + 8) + 40)) {
    objc_storeStrong((id *)(*(void *)(a1[10] + 8) + 40), v9);
  }
}

void sub_1000521CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000521EC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _lsApplicationWorkspaceInstance];
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v12 = 0;
  unsigned __int8 v8 = [v2 setPersonaUniqueStrings:v6 forApplicationWithBundleIdentifier:v3 operationUUID:v4 requestContext:v5 saveObserver:v7 error:&v12];
  id v9 = v12;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v8;

  id v10 = 0;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)) {
    id v10 = v9;
  }

  return v10;
}

void sub_10005244C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_100052470(void *a1)
{
  uint64_t v3 = a1 + 6;
  uint64_t v2 = a1[6];
  uint64_t v4 = (void *)a1[4];
  uint64_t v5 = *(v3 - 1);
  uint64_t v6 = v3[3];
  id v13 = 0;
  unsigned __int8 v7 = [v4 _onQueue_setPersonaUniqueStrings:v5 forAppBundleID:v2 inDomain:v6 error:&v13];
  id v8 = v13;
  id v9 = v13;
  *(unsigned char *)(*(void *)(v3[1] + 8) + 24) = v7;
  if (!*(unsigned char *)(*(void *)(v3[1] + 8) + 24))
  {
    uint64_t v11 = a1[8];
    uint64_t v10 = (uint64_t)(a1 + 8);
    objc_storeStrong((id *)(*(void *)(v11 + 8) + 40), v8);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_10005A12C(v3, (uint64_t)(v3 + 3), v10);
    }
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
    {
      id v12 = MIStringForInstallationDomain();
      MOLogWrite();
    }
  }
}

void sub_100052868(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100052888(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _lsApplicationWorkspaceInstance];
  uint64_t v3 = *(unsigned int *)(a1 + 80);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v13 = 0;
  unsigned __int8 v9 = [v2 unregisterContainerizedApplicationWithBundleIdentifier:v7 operationUUID:v4 unregistrationOperation:v3 precondition:v5 requestContext:v6 saveObserver:v8 unregistrationError:&v13];
  id v10 = v13;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v9;

  id v11 = 0;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)) {
    id v11 = v10;
  }

  return v11;
}

void sub_100052D70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_100052DA4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(unsigned int *)(a1 + 80);
  uint64_t v6 = *(void *)(a1 + 72);
  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v7 + 40);
  unsigned __int8 v8 = [v2 _onQueue_unregisterAppForBundleID:v3 domain:v6 operationType:v5 precondition:v4 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v8;
}

void sub_100053208(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10005322C(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v7 = 0;
  unsigned __int8 v4 = [v2 _onQueue_unregisterApplicationsAtMountPoint:v3 error:&v7];
  id v5 = v7;
  id v6 = v7;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v4;
  if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
    objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), v5);
  }
}

id sub_100053370(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onQueue_removePendingLaunchServicesOperationForUUID:*(void *)(a1 + 40) dueToLSSave:1];
}

id sub_100053460(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onQueue_handleLaunchServicesOperationFailureForUUID:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

void sub_10005351C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

uint64_t sub_100053644()
{
  id v0 = [objc_alloc((Class)objc_opt_class()) initForInstallationDomain:2];
  uint64_t v1 = (void *)qword_1000A6080;
  qword_1000A6080 = (uint64_t)v0;

  id v2 = [objc_alloc((Class)objc_opt_class()) initForInstallationDomain:3];
  uint64_t v3 = qword_1000A6088;
  qword_1000A6088 = (uint64_t)v2;

  return _objc_release_x1(v2, v3);
}

uint64_t sub_100053AE8()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v1 = qword_1000A6098;
  qword_1000A6098 = (uint64_t)v0;

  return _objc_release_x1(v0, v1);
}

uint64_t sub_100053EA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  long long v37 = 0u;
  long long v38 = 0u;
  unint64_t buf = 0;
  unint64_t v35 = 0;
  uint64_t v36 = 0;
  if ((*(uint64_t (**)(uint64_t, uint64_t, long long *, uint64_t, void))(a3 + 16))(a3, 3, &v37, 32, 0) != 32)
  {
    if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3) {
      return 0;
    }
LABEL_34:
    unsigned __int8 v27 = __error();
    strerror(*v27);
LABEL_37:
    MOLogWrite();
    return 0;
  }
  if ((void)v37 != 0x3034464649445342)
  {
    if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3) {
      return 0;
    }
    goto LABEL_37;
  }
  uint64_t v9 = sub_100054520(a3, 4, a4, 32);
  if (!v9)
  {
    if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3) {
      return 0;
    }
    goto LABEL_34;
  }
  id v10 = v9;
  id v11 = sub_100054520(a3, 5, a4, *((void *)&v37 + 1) + 32);
  if (!v11)
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
    {
      uint64_t v29 = __error();
      strerror(*v29);
      MOLogWrite();
    }
    uint64_t v26 = 0;
    goto LABEL_84;
  }
  id v12 = v11;
  id v13 = sub_100054520(a3, 6, a4, *((void *)&v37 + 1) + v38 + 32);
  if (!v13)
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
    {
      unsigned __int8 v30 = __error();
      strerror(*v30);
      MOLogWrite();
    }
    uint64_t v26 = 0;
    goto LABEL_83;
  }
  uint64_t v14 = v13;
  long long v15 = malloc_type_malloc(0x10000uLL, 0xBA17AE47uLL);
  if (!v15)
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
    {
      unsigned __int8 v31 = __error();
      strerror(*v31);
      MOLogWrite();
    }
    uint64_t v26 = 0;
    goto LABEL_82;
  }
  id v16 = v15;
  id v17 = malloc_type_malloc(0x10000uLL, 0xCE350E8DuLL);
  if (!v17)
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
    {
      uint64_t v32 = __error();
      strerror(*v32);
      MOLogWrite();
    }
    uint64_t v26 = 0;
    goto LABEL_81;
  }
  uint64_t v18 = v17;
  if (!*((void *)&v38 + 1))
  {
    uint64_t v26 = 1;
    goto LABEL_80;
  }
  unint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v33 = (uint64_t)v12;
  while (1)
  {
    if (sub_1000546B8((uint64_t)v10, &buf, 24) != 24)
    {
      if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3) {
        goto LABEL_79;
      }
      goto LABEL_78;
    }
    if (v36 < 0) {
      uint64_t v36 = -(v36 & 0x7FFFFFFFFFFFFFFFLL);
    }
    unint64_t v21 = buf;
    if (buf) {
      break;
    }
LABEL_23:
    unint64_t v24 = v35;
    if (v35)
    {
      while (1)
      {
        uint64_t v25 = v24 >= 0x10000 ? 0x10000 : v24;
        if (v25 != (int)sub_1000546B8((uint64_t)v14, v18, v25)) {
          break;
        }
        if ((*(uint64_t (**)(uint64_t, uint64_t, void *, uint64_t, unint64_t))(a5 + 16))(a5, 2, v18, v25, v19) != v25)
        {
          id v12 = (void *)v33;
          if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3) {
            goto LABEL_79;
          }
          goto LABEL_78;
        }
        v19 += v25;
        v24 -= v25;
        if (!v24) {
          goto LABEL_30;
        }
      }
      id v12 = (void *)v33;
      if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3) {
        goto LABEL_79;
      }
LABEL_78:
      MOLogWrite();
LABEL_79:
      uint64_t v26 = 0;
      goto LABEL_80;
    }
LABEL_30:
    v20 += v36;
    uint64_t v26 = 1;
    id v12 = (void *)v33;
    if (v19 >= *((void *)&v38 + 1)) {
      goto LABEL_80;
    }
  }
  while (1)
  {
    if (v21 >= 0x10000) {
      uint64_t v22 = 0x10000;
    }
    else {
      uint64_t v22 = v21;
    }
    if ((*(uint64_t (**)(uint64_t, uint64_t, unsigned char *, uint64_t, uint64_t))(a1 + 16))(a1, 1, v16, v22, v20) != v22)
    {
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
        goto LABEL_68;
      }
      goto LABEL_69;
    }
    if (v22 != (int)sub_1000546B8(v33, v18, v22))
    {
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
        goto LABEL_68;
      }
      goto LABEL_69;
    }
    uint64_t v23 = 0;
    do
    {
      *((unsigned char *)v18 + v23) += v16[v23];
      ++v23;
    }
    while (v22 != v23);
    if ((*(uint64_t (**)(uint64_t, uint64_t, void *, uint64_t, unint64_t))(a5 + 16))(a5, 2, v18, v22, v19) != v22)break; {
    v20 += v22;
    }
    v19 += v22;
    v21 -= v22;
    if (!v21) {
      goto LABEL_23;
    }
  }
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
LABEL_68:
  }
    MOLogWrite();
LABEL_69:
  uint64_t v26 = 0;
  id v12 = (void *)v33;
LABEL_80:
  free(v18);
LABEL_81:
  free(v16);
LABEL_82:
  sub_100054734(v14);
LABEL_83:
  sub_100054734(v12);
LABEL_84:
  sub_100054734(v10);
  return v26;
}

void *sub_100054520(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  int bzerror = 0;
  unsigned __int8 v8 = malloc_type_calloc(1uLL, 0x30uLL, 0x10A0040A4FBEE0AuLL);
  uint64_t v9 = v8;
  if (!v8)
  {
    if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3) {
      goto LABEL_14;
    }
LABEL_12:
    id v12 = __error();
    strerror(*v12);
LABEL_13:
    MOLogWrite();
LABEL_14:
    sub_100054734(v9);
    return 0;
  }
  *(_DWORD *)unsigned __int8 v8 = a2;
  v8[1] = a3;
  v8[2] = a4;
  v8[3] = a1;
  id v10 = funopen(v8, (int (__cdecl *)(void *, char *, int))sub_100054ADC, 0, 0, 0);
  v9[4] = v10;
  if (!v10)
  {
    if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  id v11 = BZ2_bzReadOpen(&bzerror, v10, 0, 0, 0, 0);
  v9[5] = v11;
  if (!v11)
  {
    if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  return v9;
}

uint64_t sub_1000546B8(uint64_t a1, void *buf, int len)
{
  int bzerror = 0;
  uint64_t result = BZ2_bzRead(&bzerror, *(BZFILE **)(a1 + 40), buf, len);
  if ((bzerror & 0xFFFFFFFB) != 0)
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
      MOLogWrite();
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

void sub_100054734(void *a1)
{
  int bzerror = 0;
  if (a1)
  {
    id v2 = (BZFILE *)a1[5];
    if (v2) {
      BZ2_bzReadClose(&bzerror, v2);
    }
    uint64_t v3 = (FILE *)a1[4];
    if (v3) {
      fclose(v3);
    }
    free(a1);
  }
}

uint64_t sub_100054788(const char *a1, const char *a2, int a3)
{
  memset(&v22, 0, sizeof(v22));
  memset(&v21, 0, sizeof(v21));
  int v5 = open(a1, 256);
  if (v5 != -1)
  {
    int v6 = v5;
    if (fstat(v5, &v22) == -1)
    {
      if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3) {
        goto LABEL_17;
      }
    }
    else
    {
      int v7 = open(a2, 256);
      if (v7 != -1)
      {
        int v8 = v7;
        if (fstat(v7, &v21) == -1)
        {
          if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3) {
            goto LABEL_24;
          }
          id v13 = __error();
          strerror(*v13);
        }
        else
        {
          v19[0] = _NSConcreteStackBlock;
          v19[1] = 0x40000000;
          v19[2] = sub_100054AA0;
          v19[3] = &unk_10008DAD8;
          int v20 = v6;
          v17[0] = _NSConcreteStackBlock;
          v17[1] = 0x40000000;
          v17[2] = sub_100054AB4;
          v17[3] = &unk_10008DAF8;
          int v18 = v8;
          v15[0] = _NSConcreteStackBlock;
          v15[1] = 0x40000000;
          v15[2] = sub_100054AC8;
          v15[3] = &unk_10008DB18;
          int v16 = a3;
          if (sub_100053EA8((uint64_t)v19, v9, (uint64_t)v17, v21.st_size, (uint64_t)v15))
          {
            uint64_t v10 = 0;
LABEL_25:
            close(v8);
            goto LABEL_26;
          }
          if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3)
          {
LABEL_24:
            uint64_t v10 = 0xFFFFFFFFLL;
            goto LABEL_25;
          }
        }
        MOLogWrite();
        goto LABEL_24;
      }
      if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3)
      {
LABEL_17:
        uint64_t v10 = 0xFFFFFFFFLL;
LABEL_26:
        close(v6);
        return v10;
      }
    }
    id v12 = __error();
    strerror(*v12);
    MOLogWrite();
    goto LABEL_17;
  }
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
  {
    id v11 = __error();
    strerror(*v11);
    MOLogWrite();
  }
  return 0xFFFFFFFFLL;
}

ssize_t sub_100054AA0(uint64_t a1, int a2, void *__buf, size_t __nbyte, off_t a5)
{
  return pread(*(_DWORD *)(a1 + 32), __buf, __nbyte, a5);
}

ssize_t sub_100054AB4(uint64_t a1, int a2, void *__buf, size_t __nbyte, off_t a5)
{
  return pread(*(_DWORD *)(a1 + 32), __buf, __nbyte, a5);
}

ssize_t sub_100054AC8(uint64_t a1, int a2, void *__buf, size_t __nbyte, off_t a5)
{
  return pwrite(*(_DWORD *)(a1 + 32), __buf, __nbyte, a5);
}

uint64_t sub_100054ADC(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 24) + 16))();
  if (result == -1) {
    return 0xFFFFFFFFLL;
  }
  *(void *)(a1 + 16) += result;
  return result;
}

void sub_100054F80(const void *a1)
{
}

void sub_100054F88(const void *a1)
{
}

void sub_100054F90(const void *a1, int a2)
{
  CFTypeID v4 = CFGetTypeID(a1);
  if (CFArrayGetTypeID() == v4)
  {
    CFArrayRef MutableCopy = CFArrayCreateMutableCopy(0, 0, (CFArrayRef)a1);
    v10.length = CFArrayGetCount(MutableCopy);
    v10.location = 0;
    CFArraySortValues(MutableCopy, v10, (CFComparatorFunction)sub_10005520C, 0);
    CFMutableSetRef Mutable = CFSetCreateMutable(kCFAllocatorDefault, 0, &kCFTypeSetCallBacks);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100055834;
    v7[3] = &unk_10008DB58;
    v7[4] = Mutable;
    char v8 = a2;
    sub_1000552A0(MutableCopy, v7);
    CFRelease(MutableCopy);
    CFRelease(Mutable);
  }
  else
  {
    if (CFStringGetTypeID() != v4) {
      sub_10005A4AC();
    }
    sub_100055894(a1, a2);
  }
}

void sub_1000550DC(const void *a1)
{
  CFTypeID v2 = CFGetTypeID(a1);
  if (CFArrayGetTypeID() == v2)
  {
    CFArrayRef MutableCopy = CFArrayCreateMutableCopy(0, 0, (CFArrayRef)a1);
    v7.length = CFArrayGetCount(MutableCopy);
    v7.location = 0;
    CFArraySortValues(MutableCopy, v7, (CFComparatorFunction)sub_10005520C, (void *)1);
    CFMutableSetRef Mutable = CFSetCreateMutable(kCFAllocatorDefault, 0, &kCFTypeSetCallBacks);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100055318;
    v5[3] = &unk_10008DB38;
    void v5[4] = Mutable;
    sub_1000552A0(MutableCopy, v5);
    CFRelease(MutableCopy);
    CFRelease(Mutable);
  }
  else
  {
    if (CFStringGetTypeID() != v2) {
      sub_10005A4F0();
    }
    sub_100055374(a1);
  }
}

CFComparisonResult sub_10005520C(const __CFString *a1, const __CFString *a2, uint64_t a3)
{
  CFTypeID TypeID = CFStringGetTypeID();
  if (TypeID != CFGetTypeID(a1)) {
    return 0;
  }
  CFTypeID v7 = CFStringGetTypeID();
  if (v7 != CFGetTypeID(a2)) {
    return 0;
  }
  CFComparisonResult result = CFStringCompare(a1, a2, 0);
  uint64_t v9 = 1;
  if (result == kCFCompareGreaterThan) {
    uint64_t v10 = -1;
  }
  else {
    uint64_t v10 = result;
  }
  if (result != kCFCompareLessThan) {
    uint64_t v9 = v10;
  }
  if (a3) {
    return v9;
  }
  return result;
}

void sub_1000552A0(const __CFArray *a1, void *a2)
{
  if (a1)
  {
    id context = a2;
    v5.length = CFArrayGetCount(a1);
    v5.location = 0;
    CFArrayApplyFunction(a1, v5, (CFArrayApplierFunction)sub_100055A84, context);
  }
}

void sub_100055318(uint64_t a1, const void *a2)
{
  if (!CFSetContainsValue(*(CFSetRef *)(a1 + 32), a2))
  {
    sub_100055374(a2);
    CFTypeID v4 = *(__CFSet **)(a1 + 32);
    CFSetAddValue(v4, a2);
  }
}

uint64_t sub_100055374(const void *a1)
{
  pthread_mutex_lock(&stru_1000A5DF8);
  uint64_t result = qword_1000A5EF8;
  if (!qword_1000A5EF8) {
    goto LABEL_31;
  }
  uint64_t result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)qword_1000A5EF8, a1);
  if (!result) {
    goto LABEL_31;
  }
  uint64_t v3 = result;
  if (!*(_DWORD *)(result + 208)) {
    goto LABEL_31;
  }
  if (*(_DWORD *)(result + 208) == -1)
  {
    int v5 = -1;
    atomic_compare_exchange_strong((atomic_uint *volatile)(result + 208), (unsigned int *)&v5, 0);
    if (v5 != -1 || dword_1000A5F08 || !dword_1000A5F04) {
      goto LABEL_31;
    }
    int v6 = dword_1000A5F04 - 1;
    dword_1000A5F04 = v6;
    if (dword_1000A5F00 | v6)
    {
      BOOL v7 = 1;
      if (v6) {
        goto LABEL_19;
      }
    }
    else
    {
      pthread_cond_signal(&stru_1000A5E38);
      BOOL v7 = dword_1000A5F08 != -1;
      if (dword_1000A5F04) {
        goto LABEL_19;
      }
    }
    if (v7) {
      pthread_cond_broadcast(&stru_1000A5E68);
    }
  }
  else
  {
    if ((int)atomic_fetch_add((atomic_uint *volatile)(result + 208), 0xFFFFFFFF) <= 0) {
      goto LABEL_31;
    }
    if (dword_1000A5F08 < 0) {
      goto LABEL_31;
    }
    int v4 = dword_1000A5F00;
    if (!dword_1000A5F00) {
      goto LABEL_31;
    }
    --dword_1000A5F00;
    if (!((v4 - 1) | dword_1000A5F04 | dword_1000A5F08)) {
      pthread_cond_signal(&stru_1000A5E38);
    }
  }
LABEL_19:
  --*(void *)(v3 + 200);
  pthread_rwlock_unlock((pthread_rwlock_t *)v3);
  if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) >= 7) {
    MOLogWrite();
  }
  if (*(void *)(v3 + 200)) {
    goto LABEL_28;
  }
  uint64_t result = qword_1000A60B8;
  if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) >= 7) {
    uint64_t result = MOLogWrite();
  }
  if (*(_DWORD *)(v3 + 208))
  {
LABEL_31:
    __break(1u);
    return result;
  }
  pthread_rwlock_destroy((pthread_rwlock_t *)v3);
  free((void *)v3);
  CFDictionaryRemoveValue((CFMutableDictionaryRef)qword_1000A5EF8, a1);
LABEL_28:

  return pthread_mutex_unlock(&stru_1000A5DF8);
}

uint64_t sub_100055588()
{
  return sub_100055590(0);
}

uint64_t sub_100055590(char a1)
{
  if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) >= 7) {
    MOLogWrite();
  }
  pthread_mutex_lock(&stru_1000A5DF8);
  if (a1)
  {
    if (dword_1000A5F00) {
      BOOL v2 = 0;
    }
    else {
      BOOL v2 = dword_1000A5F04 == 0;
    }
    if (!v2 || dword_1000A5F08 != 0)
    {
      do
      {
        pthread_cond_wait(&stru_1000A5E38, &stru_1000A5DF8);
        if (dword_1000A5F00) {
          BOOL v4 = 0;
        }
        else {
          BOOL v4 = dword_1000A5F04 == 0;
        }
      }
      while (!v4 || dword_1000A5F08 != 0);
    }
    int v6 = -1;
  }
  else
  {
    int v8 = dword_1000A5F04;
    for (int i = dword_1000A5F08; v8 || i == -1; int i = dword_1000A5F08)
    {
      pthread_cond_wait(&stru_1000A5E68, &stru_1000A5DF8);
      int v8 = dword_1000A5F04;
    }
    int v6 = i + 1;
  }
  dword_1000A5F08 = v6;
  if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) >= 7) {
    MOLogWrite();
  }

  return pthread_mutex_unlock(&stru_1000A5DF8);
}

uint64_t sub_100055710()
{
  return sub_100055590(1);
}

uint64_t sub_10005571C()
{
  uint64_t result = pthread_mutex_lock(&stru_1000A5DF8);
  if (dword_1000A5F08 == -1)
  {
    dword_1000A5F08 = 0;
    pthread_cond_signal(&stru_1000A5E38);
    pthread_cond_broadcast(&stru_1000A5E68);
    pthread_cond_broadcast(&stru_1000A5E98);
    pthread_cond_broadcast(&stru_1000A5EC8);
  }
  else
  {
    if (dword_1000A5F08 <= 0)
    {
      __break(1u);
      return result;
    }
    int v1 = dword_1000A5F08 - 1;
    dword_1000A5F08 = v1;
    if (!v1)
    {
      pthread_cond_broadcast(&stru_1000A5E98);
      int v1 = dword_1000A5F08;
    }
    if (dword_1000A5F00) {
      BOOL v2 = 0;
    }
    else {
      BOOL v2 = dword_1000A5F04 == 0;
    }
    if (v2 && v1 == 0) {
      pthread_cond_signal(&stru_1000A5E38);
    }
  }
  pthread_mutex_unlock(&stru_1000A5DF8);
  uint64_t result = qword_1000A60B8;
  if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) >= 7)
  {
    return MOLogWrite();
  }
  return result;
}

void sub_100055834(uint64_t a1, const void *a2)
{
  if (!CFSetContainsValue(*(CFSetRef *)(a1 + 32), a2))
  {
    sub_100055894(a2, *(unsigned __int8 *)(a1 + 40));
    BOOL v4 = *(__CFSet **)(a1 + 32);
    CFSetAddValue(v4, a2);
  }
}

uint64_t sub_100055894(const void *a1, int a2)
{
  pthread_mutex_lock(&stru_1000A5DF8);
  int v4 = dword_1000A5F08;
  if (a2)
  {
    while (dword_1000A5F08)
      pthread_cond_wait(&stru_1000A5E98, &stru_1000A5DF8);
    ++dword_1000A5F04;
  }
  else
  {
    while (v4 == -1)
    {
      pthread_cond_wait(&stru_1000A5EC8, &stru_1000A5DF8);
      int v4 = dword_1000A5F08;
    }
    ++dword_1000A5F00;
  }
  if (!qword_1000A5EF8)
  {
    qword_1000A5EF8 = (uint64_t)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, 0);
    goto LABEL_12;
  }
  Value = (void *)CFDictionaryGetValue((CFDictionaryRef)qword_1000A5EF8, a1);
  if (!Value)
  {
LABEL_12:
    int v6 = malloc_type_malloc(0xD8uLL, 0x1000040E7203D26uLL);
    pthread_rwlock_init((pthread_rwlock_t *)v6, 0);
    *((void *)v6 + 25) = 1;
    *((_DWORD *)v6 + 52) = 0;
    CFDictionarySetValue((CFMutableDictionaryRef)qword_1000A5EF8, a1, v6);
    goto LABEL_13;
  }
  int v6 = Value;
  ++*((void *)Value + 25);
LABEL_13:
  pthread_mutex_unlock(&stru_1000A5DF8);
  if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) >= 7) {
    MOLogWrite();
  }
  BOOL v7 = (pthread_rwlock_t *)v6;
  if (!a2) {
    goto LABEL_19;
  }
  BOOL v7 = (pthread_rwlock_t *)pthread_rwlock_wrlock((pthread_rwlock_t *)v6);
  int v8 = 0;
  atomic_compare_exchange_strong((atomic_uint *volatile)v6 + 52, (unsigned int *)&v8, 0xFFFFFFFF);
  if (v8)
  {
    do
    {
      __break(1u);
LABEL_19:
      LODWORD(v7) = pthread_rwlock_rdlock(v7);
    }
    while ((atomic_fetch_add((atomic_uint *volatile)v6 + 52, 1u) & 0x80000000) != 0);
  }
  uint64_t result = qword_1000A60B8;
  if (qword_1000A60B8)
  {
    if (*(int *)(qword_1000A60B8 + 44) >= 7) {
      return MOLogWrite();
    }
  }
  return result;
}

void sub_100055A84(uint64_t a1, id a2)
{
  uint64_t v3 = (void (**)(id, void))objc_retainBlock(a2);
  v3[2](v3, a1);
}

uint64_t sub_100055B7C()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v1 = qword_1000A60A8;
  qword_1000A60A8 = (uint64_t)v0;

  return _objc_release_x1(v0, v1);
}

void sub_100056E14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100056E3C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100056E4C(uint64_t a1)
{
}

uint64_t sub_100056E54(uint64_t a1, void *a2, int a3, unsigned char *a4)
{
  id v7 = a2;
  int v8 = v7;
  if (a3 != 4)
  {
    int v10 = *(_DWORD *)(a1 + 48);
    if (v10 == 1)
    {
      a4 = [v7 lastPathComponent];
      if ([a4 isEqualToString:@"TemporaryAppReferences"])
      {

LABEL_13:
        uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
        id obj = *(id *)(v13 + 40);
        a4 = +[MIAppReferenceMetadata referenceMetadataFromURL:v8 error:&obj];
        objc_storeStrong((id *)(v13 + 40), obj);
        if (!a4)
        {
          uint64_t v9 = 0;
          goto LABEL_20;
        }
        uint64_t v14 = [a4 personas];
        id v15 = [v14 count];

        if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
        {
          int v16 = [a4 personas];
          int v18 = [v8 path];
          MOLogWrite();
        }
        *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v15;
        goto LABEL_18;
      }
      if (*(_DWORD *)(a1 + 48) != 2)
      {
LABEL_18:

        goto LABEL_19;
      }
    }
    else if (v10 != 2)
    {
      goto LABEL_19;
    }
    id v11 = [v8 lastPathComponent];
    unsigned int v12 = [v11 isEqualToString:@"AppReferences"];

    if (v10 == 1)
    {

      if ((v12 & 1) == 0) {
        goto LABEL_19;
      }
    }
    else if (!v12)
    {
LABEL_19:
      uint64_t v9 = 1;
      goto LABEL_20;
    }
    goto LABEL_13;
  }
  uint64_t v9 = 1;
  *a4 = 1;
LABEL_20:

  return v9;
}

uint64_t sub_100057B10(int a1, void *a2, size_t *a3, int a4)
{
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  if (!a2 || !a3)
  {
LABEL_13:
    *__error() = 22;
    return 0xFFFFFFFFLL;
  }
  *a2 = 0;
  *a3 = 0;
  if (!sub_100057C04(a1, (uint64_t)&v9))
  {
    if ((v9 & 0x3E) != 0x2E) {
      return 0;
    }
    if (v10 < 2)
    {
      if (HIDWORD(v10) == HIDWORD(v9) - 1) {
        return sub_1000580B4(HIDWORD(v10), a2, a3);
      }
      if (a4) {
        return sub_100057F9C(a1, a2, a3, HIDWORD(v9), SHIDWORD(v10));
      }
      syslog(3, "arm64 slice at index %u, not last (nfat_arch = %u)\n");
    }
    else
    {
      syslog(3, "too many (%u) arm64 slices\n");
    }
    goto LABEL_13;
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_100057C04(int a1, uint64_t a2)
{
  fat_header fat_header = 0;
  memset(&v21, 0, sizeof(v21));
  memset(&v20, 0, sizeof(v20));
  *(void *)a2 = 0;
  *(void *)(a2 + _Block_object_dispose(&STACK[0x2B0], 8) = 0;
  uint64_t result = fstat(a1, &v20);
  if (result != -1)
  {
    if (sub_1000583D4(a1, &fat_header, 8uLL, 0))
    {
      if (fat_header.magic != -1095041334) {
        return 0;
      }
      swap_fat_header(&fat_header, NX_LittleEndian);
      uint32_t nfat_arch = fat_header.nfat_arch;
      *(_DWORD *)(a2 + 4) = fat_header.nfat_arch;
      if (sub_100058420(a1, nfat_arch, &v21))
      {
        if (v21.cputype == 16777228)
        {
          long long v18 = 0u;
          long long v19 = 0u;
          if (v20.st_size > v21.offset && v21.size >= 0x1C && v20.st_size >= v21.size + v21.offset && v21.align <= 0x40)
          {
            if (v21.size + (unint64_t)v21.offset > 0x1F)
            {
              if (sub_1000583D4(a1, &v18, 0x20uLL, v21.offset) && v18 == -17958193 && HIDWORD(v18) == 2)
              {
                *(_DWORD *)a2 |= 0x10u;
                ++fat_header.nfat_arch;
              }
            }
            else
            {
              *__error() = 34;
            }
          }
        }
        if (fat_header.nfat_arch)
        {
          int v6 = 0;
          while (1)
          {
            if (!sub_100058420(a1, v6, &v21)) {
              return 0xFFFFFFFFLL;
            }
            if (v21.cputype == 12)
            {
              *(_DWORD *)a2 |= 2u;
              int v7 = 1;
            }
            else
            {
              int v7 = 0;
              if (v21.cputype == 16777228)
              {
                *(_DWORD *)a2 |= 4u;
                ++*(_DWORD *)(a2 + 8);
                *(_DWORD *)(a2 + 12) = v6;
              }
            }
            long long v18 = 0u;
            long long v19 = 0u;
            if (v21.size + (unint64_t)v21.offset <= 0x1F)
            {
              *__error() = 34;
              return 0xFFFFFFFFLL;
            }
            if (!sub_1000583D4(a1, &v18, 0x20uLL, v21.offset)) {
              return 0xFFFFFFFFLL;
            }
            if (v18 == -17958193) {
              break;
            }
            if (v18 == -17958194)
            {
              int v8 = HIDWORD(v18);
              int v9 = v19;
              uint64_t v10 = 28;
              uint64_t v11 = 28;
              goto LABEL_29;
            }
            syslog(5, "ignoring slice with magic %08x\n", v18);
LABEL_47:
            if (++v6 >= fat_header.nfat_arch) {
              return 0;
            }
          }
          int v8 = HIDWORD(v18);
          int v9 = v19;
          uint64_t v10 = 32;
          uint64_t v11 = 32;
LABEL_29:
          if (v8 == 2)
          {
            *(_DWORD *)a2 |= 0x20u;
            uint64_t v11 = v10;
          }
          if (v7)
          {
            if (v9)
            {
              while (1)
              {
                uint64_t v17 = 0;
                BOOL v12 = sub_100058474(a1, &v17, 8uLL, v11, v21.offset, v21.size);
                BOOL v13 = v12;
                if (!v12) {
                  goto LABEL_42;
                }
                if (v17 == 37) {
                  break;
                }
                v11 += HIDWORD(v17);
                if (!--v9) {
                  goto LABEL_36;
                }
              }
              uint64_t v15 = 0;
              uint64_t v16 = 0;
              if (!sub_100058474(a1, &v15, 0x10uLL, v11, v21.offset, v21.size))
              {
LABEL_42:
                int v14 = 1;
                goto LABEL_43;
              }
              if (WORD1(v16) <= 6u) {
                *(_DWORD *)a2 |= 8u;
              }
            }
            else
            {
LABEL_36:
              BOOL v13 = 0;
            }
            int v14 = 6;
LABEL_43:
            if (v14 != 6 || v13)
            {
              if (v14 != 6) {
                return 0xFFFFFFFFLL;
              }
            }
            else
            {
              *(_DWORD *)a2 |= 8u;
            }
          }
          goto LABEL_47;
        }
        return 0;
      }
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t sub_100057F9C(int a1, void *a2, size_t *a3, unsigned int a4, int a5)
{
  if (a4 >= 0x401)
  {
    int v5 = __error();
    int v6 = 22;
LABEL_7:
    int *v5 = v6;
    return 0xFFFFFFFFLL;
  }
  size_t v12 = 20 * a4 + 8;
  BOOL v13 = malloc_type_malloc(v12, 0x63868CB2uLL);
  if (!v13)
  {
    int v5 = __error();
    int v6 = 12;
    goto LABEL_7;
  }
  int v14 = v13;
  if (sub_1000583D4(a1, v13, v12, 0))
  {
    uint64_t result = 0;
    uint64_t v16 = &v14[5 * a4 - 3];
    int v17 = v16[4];
    long long v18 = &v14[5 * a5 + 2];
    long long v19 = *(_OWORD *)v18;
    v16[4] = v18[4];
    long long v20 = *(_OWORD *)v16;
    *(_OWORD *)uint64_t v16 = v19;
    *(_OWORD *)long long v18 = v20;
    void v18[4] = v17;
    v14[1] = bswap32(a4 - 1);
    *a2 = v14;
    *a3 = v12;
    return result;
  }
  free(v14);
  return 0xFFFFFFFFLL;
}

uint64_t sub_1000580B4(unsigned int a1, void *a2, void *a3)
{
  int v6 = malloc_type_malloc(8uLL, 0x100004000313F17uLL);
  if (v6)
  {
    int v7 = v6;
    uint64_t result = 0;
    *int v7 = -1095041334;
    v7[1] = bswap32(a1);
    *a2 = v7;
    *a3 = 8;
  }
  else
  {
    *__error() = 12;
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t sub_100058138(int a1, void *a2, void *a3)
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  if (!a2 || !a3)
  {
LABEL_11:
    *__error() = 22;
    return 0xFFFFFFFFLL;
  }
  *a2 = 0;
  *a3 = 0;
  if (!sub_100057C04(a1, (uint64_t)&v6))
  {
    if ((~v6 & 0x3E) != 0) {
      return 0;
    }
    if (v7 < 2)
    {
      if (HIDWORD(v7) == HIDWORD(v6)) {
        return sub_1000580B4(HIDWORD(v7) + 1, a2, a3);
      }
      syslog(3, "arm64 slice at index %u, not last (uint32_t nfat_arch = %u)\n");
    }
    else
    {
      syslog(3, "too many (%u) arm64 slices\n");
    }
    goto LABEL_11;
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_100058200(char *a1, int a2, unsigned char *a3)
{
  return sub_100058210(a1, 1, a2, a3);
}

uint64_t sub_100058210(char *a1, int a2, int a3, unsigned char *a4)
{
  size_t v20 = 0;
  fat_arch v21 = 0;
  if (a4) {
    *a4 = 0;
  }
  int v8 = open(a1, 256);
  int v9 = v8;
  if (v8 == -1)
  {
    uint64_t v10 = __error();
    uint64_t v11 = strerror(*v10);
    syslog(3, "Could not open %s for reading: %s", a1, v11);
    goto LABEL_11;
  }
  if (a2)
  {
    if (!sub_100057B10(v8, &v21, &v20, a3)) {
      goto LABEL_12;
    }
LABEL_11:
    uint64_t v12 = 0xFFFFFFFFLL;
    goto LABEL_23;
  }
  if (a3) {
    syslog(4, "allow_reorder not allowed for unhiding");
  }
  if (sub_100058138(v9, &v21, &v20)) {
    goto LABEL_11;
  }
LABEL_12:
  if (v20)
  {
    close(v9);
    int v13 = open(a1, 258);
    int v9 = v13;
    if (v13 == -1)
    {
      int v17 = __error();
      strerror(*v17);
      syslog(3, "Could not open %s for writing: %s");
    }
    else
    {
      size_t v14 = v20;
      ssize_t v15 = pwrite(v13, v21, v20, 0);
      ssize_t v16 = v15;
      if (v15 != v14 && v15 != -1) {
        *__error() = 5;
      }
      if (v16 == v14)
      {
        if (a4)
        {
          uint64_t v12 = 0;
          *a4 = 1;
          goto LABEL_23;
        }
      }
      else
      {
        long long v18 = __error();
        strerror(*v18);
        syslog(3, "Could not write new header to executable: %s");
      }
    }
  }
  uint64_t v12 = 0;
LABEL_23:
  if (v21) {
    free(v21);
  }
  if (v9 != -1) {
    close(v9);
  }
  return v12;
}

uint64_t sub_1000583C4(char *a1, unsigned char *a2)
{
  return sub_100058210(a1, 0, 0, a2);
}

BOOL sub_1000583D4(int a1, void *a2, size_t a3, off_t a4)
{
  ssize_t v5 = pread(a1, a2, a3, a4);
  ssize_t v6 = v5;
  if (v5 != a3 && v5 != -1) {
    *__error() = 5;
  }
  return v6 == a3;
}

BOOL sub_100058420(int a1, int a2, fat_arch *a3)
{
  BOOL v4 = sub_1000583D4(a1, a3, 0x14uLL, 20 * a2 + 8);
  if (v4) {
    swap_fat_arch(a3, 1u, NX_LittleEndian);
  }
  return v4;
}

BOOL sub_100058474(int a1, void *a2, size_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a4 < 0 || (uint64_t)(a4 + a3) > a6 + a5)
  {
    *__error() = 34;
    return 0;
  }
  else
  {
    off_t v7 = a5 + a4;
    return sub_1000583D4(a1, a2, a3, v7);
  }
}

void sub_1000584C8(void *a1)
{
  BOOL v2 = +[NSAssertionHandler currentHandler];
  uint64_t v3 = +[NSString stringWithUTF8String:"void *UserManagementLibrary(void)"];
  [v2 handleFailureInFunction:v3 file:@"ICLSoftLinking.h" lineNumber:38 description:@"%s" *a1];

  __break(1u);
}

void sub_100058548()
{
  id v0 = +[NSAssertionHandler currentHandler];
  uint64_t v1 = +[NSString stringWithUTF8String:"Class getUMUserManagerClass(void)_block_invoke"];
  [v0 handleFailureInFunction:v1 file:@"ICLSoftLinking.h" lineNumber:39 description:@"Unable to find class %s", "UMUserManager"];

  __break(1u);
}

void sub_1000585C4()
{
}

void sub_1000585F0()
{
}

void sub_10005861C(uint64_t a1)
{
  int v1 = 136315394;
  BOOL v2 = "MIReportIssueUsingAutoBugCapture";
  __int16 v3 = 2112;
  uint64_t v4 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: Failed to report using ABC with signature: %@", (uint8_t *)&v1, 0x16u);
}

void sub_1000586B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315906;
  uint64_t v4 = "-[MIInstaller removeAndReportAbandonedContainersWithIncorrectPersonaForBundleContainer:withError:]";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  __int16 v9 = 2112;
  uint64_t v10 = a3;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: App %@ already has a data container with persona %@ but this installation request came for a different persona, %@. Apps may not be installed for multiple personas simultaneously. Deleting abandoned containers.", (uint8_t *)&v3, 0x2Au);
}

void sub_100058754()
{
}

void sub_100058770(void *a1)
{
  int v1 = [a1 path];
  sub_10002BBAC();
  sub_10002BB90((void *)&_mh_execute_header, &_os_log_default, v2, "Daemon's home directory at %@ should have perms 0%ho, but found 0%ho", v3, v4, v5, v6, v7);
}

void sub_10005880C(void *a1)
{
  int v1 = [a1 path];
  sub_10002BB50();
  sub_10002BB90((void *)&_mh_execute_header, &_os_log_default, v2, "Daemon's home directory at %@ should have gid %u, but found %u", v3, v4, v5, v6, v7);
}

void sub_1000588A8(void *a1)
{
  int v1 = [a1 path];
  sub_10002BB50();
  sub_10002BB90((void *)&_mh_execute_header, &_os_log_default, v2, "Daemon's home directory at %@ should be owned by uid %u, but found %u", v3, v4, v5, v6, v7);
}

void sub_100058944(void *a1, int a2)
{
  uint64_t v3 = [a1 path];
  sub_10002BBAC();
  int v5 = a2;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Daemon's home directory at %@ was not a directory; found mode: 0%ho",
    v4,
    0x12u);
}

void sub_1000589E0(void *a1, int a2, uint64_t a3)
{
  int v5 = [a1 path];
  int v6 = 138413058;
  uint8_t v7 = v5;
  __int16 v8 = 1024;
  int v9 = a2;
  __int16 v10 = 2080;
  uint64_t v11 = strerror(a2);
  __int16 v12 = 2112;
  uint64_t v13 = a3;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Failed to stat daemon's home directory at %@ : %d (%s); parentInfo: %@",
    (uint8_t *)&v6,
    0x26u);
}

void sub_100058AB4(void *a1, uint64_t a2, void *a3)
{
  uint64_t v4 = [a1 URLByDeletingLastPathComponent];
  int v5 = [a3 debugDescriptionForItemAtURL:v4];
  sub_10002BB70();
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "No space to create directory at \"%@\": %@; parentInfo: %@",
    v6,
    0x20u);
}

void sub_100058B74(void *a1, uint64_t a2, void *a3)
{
  uint64_t v4 = [a1 URLByDeletingLastPathComponent];
  int v5 = [a3 debugDescriptionForItemAtURL:v4];
  sub_10002BB70();
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Failed to create directory at \"%@\": %@; parentInfo: %@",
    v6,
    0x20u);
}

void sub_100058C34(uint64_t a1)
{
  int v1 = 136315394;
  uint64_t v2 = "_CleanUpErroneousDataContainers";
  __int16 v3 = 2048;
  uint64_t v4 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: Found %lu erroneous containers containing user data", (uint8_t *)&v1, 0x16u);
}

void sub_100058CC8(uint64_t a1)
{
  int v1 = 136315394;
  uint64_t v2 = "_CleanUpErroneousDataContainers";
  __int16 v3 = 2112;
  uint64_t v4 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: Found unexpected erroneous containers after upgrading from %@", (uint8_t *)&v1, 0x16u);
}

void sub_100058D5C(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 path];
  v3[0] = 136315906;
  sub_10002CB00();
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: Failed to write journal entry for %@ to %@ : %@", (uint8_t *)v3, 0x2Au);
}

void sub_100058E10(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 path];
  v3[0] = 136315906;
  sub_10002CB00();
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: Failed to remove journal entry for %@ from %@ : %@", (uint8_t *)v3, 0x2Au);
}

void sub_100058EC4(void *a1)
{
  int v1 = [a1 path];
  sub_10002CB24();
  sub_10002CB40((void *)&_mh_execute_header, &_os_log_default, v2, "%s: Failed to read journal entry data from %@ : %@", v3, v4, v5, v6, 2u);
}

void sub_100058F5C(void *a1)
{
  int v1 = [a1 path];
  sub_10002CB24();
  sub_10002CB40((void *)&_mh_execute_header, &_os_log_default, v2, "%s: Failed to unarchive journal entry data from %@ : %@", v3, v4, v5, v6, 2u);
}

void sub_100058FF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100059084()
{
  sub_10003138C();
  sub_100031370((void *)&_mh_execute_header, &_os_log_default, v0, "Failed to add Swift Playgrounds to linked parent bundle ID list: %@", v1, v2, v3, v4, v5);
}

void sub_1000590F4()
{
  sub_10003138C();
  sub_100031370((void *)&_mh_execute_header, &_os_log_default, v0, "Failed to locate bundle container for Swift Playgrounds: %@", v1, v2, v3, v4, v5);
}

void sub_100059164()
{
  sub_10003138C();
  sub_100031370((void *)&_mh_execute_header, &_os_log_default, v0, "Failed to read bundle metadata for Swift Playgrounds: %@", v1, v2, v3, v4, v5);
}

void sub_1000591D4()
{
  sub_10003138C();
  sub_100031370((void *)&_mh_execute_header, &_os_log_default, v0, "Failed to scan for bundle containers: %@", v1, v2, v3, v4, v5);
}

void sub_100059244()
{
  sub_10003138C();
  sub_100031370((void *)&_mh_execute_header, &_os_log_default, v0, "Failed to save updated bundle metadata on Swift Playgrounds container: %@", v1, v2, v3, v4, v5);
}

void sub_1000592B4()
{
  sub_10003138C();
  sub_100031370((void *)&_mh_execute_header, &_os_log_default, v0, "Failed to query bundle containers with %@", v1, v2, v3, v4, v5);
}

void sub_100059324()
{
  sub_100031398();
  uint64_t v2 = v0;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Failed to read bundle metadata for %@: %@", v1, 0x16u);
}

void sub_1000593A4(void *a1, uint64_t a2)
{
  uint64_t v3 = [a1 path];
  sub_100031398();
  uint64_t v5 = a2;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Failed to read linked parent bundles file at %@ : %@", v4, 0x16u);
}

void sub_100059440()
{
  sub_10003138C();
  sub_100031370((void *)&_mh_execute_header, &_os_log_default, v0, "Linked child bundle IDs on disk and in memory are not the same for %@", v1, v2, v3, v4, v5);
}

void sub_1000594B0()
{
  v3[0] = 136315906;
  sub_100034F44();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  __int16 v6 = v0;
  uint64_t v7 = v2;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: Failed to recover install for %@/%@ : %@", (uint8_t *)v3, 0x2Au);
}

void sub_100059548(void *a1, uint64_t a2)
{
  uint64_t v3 = [a1 identity];
  v4[0] = 136315650;
  sub_100034F44();
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: Failed to replay journal entry for %@ after %lu attempts", (uint8_t *)v4, 0x20u);
}

void sub_1000595F8(void *a1, _DWORD *a2, void *a3)
{
  *a2 = 136315650;
  sub_10003982C((uint64_t)a1, (uint64_t)a2, (uint64_t)"-[MIUninstaller performUninstallationByRevokingTemporaryReference:error:]");
  *(void *)(v5 + 24) = @"ParallelPlaceholderOnlyIfExists";
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: Process %@ is using an unsupported key: %@", v6, 0x20u);
}

void sub_100059670(void *a1, _DWORD *a2, void *a3)
{
  *a2 = 136315650;
  sub_10003982C((uint64_t)a1, (uint64_t)a2, (uint64_t)"-[MIUninstaller performUninstallationByRevokingTemporaryReference:error:]");
  *(void *)(v5 + 24) = @"Placeholder";
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: Process %@ is using an unsupported key: %@", v6, 0x20u);
}

void sub_1000596E8()
{
  sub_100053500();
  sub_10002CB40((void *)&_mh_execute_header, &_os_log_default, v0, "%s: Failed to register installation record in system domain for %@ : %@", v1, v2, v3, v4, 2u);
}

void sub_100059764()
{
  int v0 = 136315138;
  uint64_t v1 = "+[MILaunchServicesOperationManager instanceForSystemSharedContent]";
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: System Shared instance is not valid in a Shared iPad configuration.", (uint8_t *)&v0, 0xCu);
}

void sub_1000597EC()
{
  sub_100053500();
  sub_10002CB40((void *)&_mh_execute_header, &_os_log_default, v0, "%s: LaunchServices reported failure when saving LS operation UUID %@ : %@", v1, v2, v3, v4, 2u);
}

void sub_100059868()
{
  sub_100034F44();
  sub_10005351C((void *)&_mh_execute_header, &_os_log_default, v0, "%s: Failed to rename identified most recent instance dir: %@", v1, v2, v3, v4, 2u);
}

void sub_1000598E4()
{
  sub_100034F44();
  sub_10005351C((void *)&_mh_execute_header, &_os_log_default, v0, "%s: Failed to re-create operation storage base: %@", v1, v2, v3, v4, 2u);
}

void sub_100059960()
{
  sub_100034F44();
  sub_10005351C((void *)&_mh_execute_header, &_os_log_default, v0, "%s: Failed to clear out LS operation storage base dir: %@", v1, v2, v3, v4, 2u);
}

void sub_1000599DC()
{
  sub_100034F44();
  sub_10005351C((void *)&_mh_execute_header, &_os_log_default, v0, "%s: Failed to move operation storage base to look aside: %@", v1, v2, v3, v4, 2u);
}

void sub_100059A58()
{
  sub_100034F44();
  sub_10005351C((void *)&_mh_execute_header, &_os_log_default, v0, "%s: Failed to remove lookaside directory: %@", v1, v2, v3, v4, 2u);
}

void sub_100059AD4()
{
  int v0 = 136315138;
  uint64_t v1 = "-[MILaunchServicesOperationManager _setUpLookAsideAtDirAndFindMostRecentInstance:]";
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: Failed to locate most recent instance dir in LS operation lookaside dir; purging state",
    (uint8_t *)&v0,
    0xCu);
}

void sub_100059B5C()
{
  sub_100034F44();
  sub_10005351C((void *)&_mh_execute_header, &_os_log_default, v0, "%s: Failed to clear out old content in storage base: %@", v1, v2, v3, v4, 2u);
}

void sub_100059BD8(void *a1)
{
  uint64_t v1 = [a1 path];
  sub_10002CB24();
  sub_10002CB40((void *)&_mh_execute_header, &_os_log_default, v2, "%s: Failed to write previous attempts file to %@ : %@", v3, v4, v5, v6, 2u);
}

void sub_100059C70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
}

void sub_100059CF8()
{
  sub_100034F44();
  sub_10005351C((void *)&_mh_execute_header, &_os_log_default, v0, "%s: Failed to write new count to previous reconcile attempts count: %@", v1, v2, v3, v4, 2u);
}

void sub_100059D74(void *a1)
{
  uint64_t v1 = [a1 path];
  sub_10002CB24();
  sub_10002CB40((void *)&_mh_execute_header, &_os_log_default, v2, "%s: Failed to unarchive operation data from %@ : %@", v3, v4, v5, v6, 2u);
}

void sub_100059E0C()
{
  sub_100034F44();
  sub_10005351C((void *)&_mh_execute_header, &_os_log_default, v0, "%s: Failed to remove lookaside storage base: %@", v1, v2, v3, v4, 2u);
}

void sub_100059E88(void *a1)
{
  uint64_t v1 = [a1 path];
  sub_10002CB24();
  sub_10002CB40((void *)&_mh_execute_header, &_os_log_default, v2, "%s: Failed to purge registration dir at %@ : %@", v3, v4, v5, v6, 2u);
}

void sub_100059F20(void *a1)
{
  uint64_t v1 = [a1 path];
  sub_10002CB24();
  sub_10002CB40((void *)&_mh_execute_header, &_os_log_default, v2, "%s: Failed to purge registration lookaside dir at %@ : %@", v3, v4, v5, v6, 2u);
}

void sub_100059FB8()
{
  sub_100053500();
  sub_10002CB40((void *)&_mh_execute_header, &_os_log_default, v0, "%s: Failed to push persona unique strings for %@ to LaunchServices: %@", v1, v2, v3, v4, 2u);
}

void sub_10005A034()
{
  sub_100053500();
  sub_10002CB40((void *)&_mh_execute_header, &_os_log_default, v0, "%s: Failed to write journal operation %@ : %@", v1, v2, v3, v4, 2u);
}

void sub_10005A0B0()
{
  sub_100053500();
  sub_10002CB40((void *)&_mh_execute_header, &_os_log_default, v0, "%s: Failed to write journal operation %@ : %@", v1, v2, v3, v4, 2u);
}

void sub_10005A12C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *a1;
  uint64_t v5 = MIStringForInstallationDomain();
  uint64_t v6 = *(void *)(*(void *)(*(void *)a3 + 8) + 40);
  int v7 = 136315906;
  __int16 v8 = "-[MILaunchServicesOperationManager setPersonaUniqueStrings:forAppBundleID:inDomain:error:]_block_invoke";
  __int16 v9 = 2112;
  uint64_t v10 = v4;
  __int16 v11 = 2112;
  __int16 v12 = v5;
  __int16 v13 = 2112;
  uint64_t v14 = v6;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: Failed to set persona unique strings for %@/%@ : %@", (uint8_t *)&v7, 0x2Au);
}

void sub_10005A208()
{
  sub_100053500();
  sub_10002CB40((void *)&_mh_execute_header, &_os_log_default, v0, "%s: Failed to write journal operation %@ : %@", v1, v2, v3, v4, 2u);
}

void sub_10005A284(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = *(void *)(*(void *)a2 + 40);
  int v4 = 136315906;
  uint64_t v5 = "-[MILaunchServicesOperationManager unregisterAppForBundleID:inDomain:operationType:precondition:error:]";
  __int16 v6 = 2112;
  uint64_t v7 = a1;
  __int16 v8 = 1024;
  int v9 = a3;
  __int16 v10 = 2112;
  uint64_t v11 = v3;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: Successfully registered the record for %@ from on-disk state after failing to unregister (Operation type %d) due to precondition validation failure %@", (uint8_t *)&v4, 0x26u);
}

void sub_10005A334()
{
  sub_100053500();
  sub_10002CB40((void *)&_mh_execute_header, &_os_log_default, v0, "%s: Failed to register information for %@ after precondition validation failure : %@", v1, v2, v3, v4, 2u);
}

void sub_10005A3B0(uint64_t a1, void *a2, uint64_t a3, uint8_t *buf)
{
  *(_DWORD *)unint64_t buf = 136315906;
  *(void *)(buf + 4) = "-[MILaunchServicesOperationManager unregisterAppForBundleID:inDomain:operationType:precondition:error:]";
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a1;
  *((_WORD *)buf + 11) = 2112;
  *((void *)buf + 3) = a2;
  *((_WORD *)buf + 16) = 2112;
  *(void *)(buf + 34) = a3;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: Failed to unregister record for %@ in domain %@ : %@", buf, 0x2Au);
}

void sub_10005A430()
{
  sub_100053500();
  sub_10002CB40((void *)&_mh_execute_header, &_os_log_default, v0, "%s: Failed to write journal operation %@ : %@", v1, v2, v3, v4, 2u);
}

void sub_10005A4AC()
{
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) > 2) {
    MOLogWrite();
  }
  abort();
}

void sub_10005A4F0()
{
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) > 2) {
    MOLogWrite();
  }
  abort();
}

void sub_10005A534(void *a1)
{
  uint64_t v1 = [a1 path];
  int v2 = 136315394;
  uint64_t v3 = "-[MIAppReferenceManager _updateReferenceAtURL:byAddingPersonaUniqueString:resultingPersonaUniqueStrings:error:]";
  __int16 v4 = 2112;
  uint64_t v5 = v1;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: Unexpectedly found no personas in : %@", (uint8_t *)&v2, 0x16u);
}

int BZ2_bzRead(int *bzerror, BZFILE *b, void *buf, int len)
{
  return _BZ2_bzRead(bzerror, b, buf, len);
}

void BZ2_bzReadClose(int *bzerror, BZFILE *b)
{
}

BZFILE *__cdecl BZ2_bzReadOpen(int *bzerror, FILE *f, int verbosity, int small, void *unused, int nUnused)
{
  return _BZ2_bzReadOpen(bzerror, f, verbosity, small, unused, nUnused);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return _CFArrayContainsValue(theArray, range, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return _CFArrayCreateMutableCopy(allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
{
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return _CFErrorCreate(allocator, domain, code, userInfo);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopRun(void)
{
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return _CFSetContainsValue(theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return _CFSetCreateMutable(allocator, capacity, callBacks);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return _CFStringCreateArrayBySeparatingStrings(alloc, theString, separatorString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return _CFStringCreateWithFormatAndArguments(alloc, formatOptions, format, arguments);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return _CFStringGetFileSystemRepresentation(string, buffer, maxBufLen);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

uint64_t DMIsMigrationNeeded()
{
  return _DMIsMigrationNeeded();
}

uint64_t DirectoryPatch()
{
  return _DirectoryPatch();
}

uint64_t ICLKnownBundleRecordClasses()
{
  return _ICLKnownBundleRecordClasses();
}

uint64_t ICLSetLoggingHandle()
{
  return _ICLSetLoggingHandle();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MIAssertHighResourceUsage()
{
  return _MIAssertHighResourceUsage();
}

uint64_t MIClearResourceAssertion()
{
  return _MIClearResourceAssertion();
}

uint64_t MICopyProcessNameForPid()
{
  return _MICopyProcessNameForPid();
}

uint64_t MICreateSHA256Digest()
{
  return _MICreateSHA256Digest();
}

uint64_t MIDistributorTypeIsThirdParty()
{
  return _MIDistributorTypeIsThirdParty();
}

uint64_t MIErrorStringForMISError()
{
  return _MIErrorStringForMISError();
}

uint64_t MIInstallProfileAtURL()
{
  return _MIInstallProfileAtURL();
}

uint64_t MIInstallProfileWithData()
{
  return _MIInstallProfileWithData();
}

uint64_t MIIsBuildUpgrade()
{
  return _MIIsBuildUpgrade();
}

uint64_t MIIsFatalMISProfileInstallationError()
{
  return _MIIsFatalMISProfileInstallationError();
}

uint64_t MIIsValidInstallationDomain()
{
  return _MIIsValidInstallationDomain();
}

uint64_t MIMachOFileIterateImageVersions()
{
  return _MIMachOFileIterateImageVersions();
}

uint64_t MIMachOFileMatchesMyArchitecture()
{
  return _MIMachOFileMatchesMyArchitecture();
}

uint64_t MIRecordCurrentBuildVersion()
{
  return _MIRecordCurrentBuildVersion();
}

uint64_t MIRunTransactionalTask()
{
  return _MIRunTransactionalTask();
}

uint64_t MIStringForInstallationDomain()
{
  return _MIStringForInstallationDomain();
}

uint64_t MIUninstallProfilesForAppIdentifier()
{
  return _MIUninstallProfilesForAppIdentifier();
}

uint64_t MOLogEnableDiskLogging()
{
  return _MOLogEnableDiskLogging();
}

uint64_t MOLogOpen()
{
  return _MOLogOpen();
}

uint64_t MOLogWrite()
{
  return _MOLogWrite();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t SZArchiverCreateStreamableZip()
{
  return _SZArchiverCreateStreamableZip();
}

uint64_t SecItemDeleteKeychainItemsForAppClip()
{
  return _SecItemDeleteKeychainItemsForAppClip();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return __CFXPCCreateXPCObjectFromCFObject();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

uint64_t _os_crash()
{
  return __os_crash();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

void abort(void)
{
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return _audit_token_to_pid(atoken);
}

void bzero(void *a1, size_t a2)
{
}

int chmod(const char *a1, mode_t a2)
{
  return _chmod(a1, a2);
}

int close(int a1)
{
  return _close(a1);
}

int closedir(DIR *a1)
{
  return _closedir(a1);
}

uint64_t container_copy_object()
{
  return _container_copy_object();
}

uint64_t container_copy_unlocalized_description()
{
  return _container_copy_unlocalized_description();
}

uint64_t container_delete_all_container_content()
{
  return _container_delete_all_container_content();
}

uint64_t container_disk_usage()
{
  return _container_disk_usage();
}

uint64_t container_error_copy_unlocalized_description()
{
  return _container_error_copy_unlocalized_description();
}

uint64_t container_error_free()
{
  return _container_error_free();
}

uint64_t container_error_get_path()
{
  return _container_error_get_path();
}

uint64_t container_error_get_posix_errno()
{
  return _container_error_get_posix_errno();
}

uint64_t container_error_get_type()
{
  return _container_error_get_type();
}

uint64_t container_free_array_of_containers()
{
  return _container_free_array_of_containers();
}

uint64_t container_free_object()
{
  return _container_free_object();
}

uint64_t container_get_class()
{
  return _container_get_class();
}

uint64_t container_get_error_description()
{
  return _container_get_error_description();
}

uint64_t container_get_identifier()
{
  return _container_get_identifier();
}

uint64_t container_get_info_value_for_key()
{
  return _container_get_info_value_for_key();
}

uint64_t container_get_path()
{
  return _container_get_path();
}

uint64_t container_get_persona_unique_string()
{
  return _container_get_persona_unique_string();
}

uint64_t container_invalidate_code_signing_cache()
{
  return _container_invalidate_code_signing_cache();
}

uint64_t container_is_equal()
{
  return _container_is_equal();
}

uint64_t container_is_new()
{
  return _container_is_new();
}

uint64_t container_is_transient()
{
  return _container_is_transient();
}

uint64_t container_operation_delete_array()
{
  return _container_operation_delete_array();
}

uint64_t container_operation_delete_reclaim_disk_space()
{
  return _container_operation_delete_reclaim_disk_space();
}

uint64_t container_query_create()
{
  return _container_query_create();
}

uint64_t container_query_create_from_container()
{
  return _container_query_create_from_container();
}

uint64_t container_query_free()
{
  return _container_query_free();
}

uint64_t container_query_get_last_error()
{
  return _container_query_get_last_error();
}

uint64_t container_query_get_single_result()
{
  return _container_query_get_single_result();
}

uint64_t container_query_iterate_results_sync()
{
  return _container_query_iterate_results_sync();
}

uint64_t container_query_operation_set_flags()
{
  return _container_query_operation_set_flags();
}

uint64_t container_query_set_class()
{
  return _container_query_set_class();
}

uint64_t container_query_set_group_identifiers()
{
  return _container_query_set_group_identifiers();
}

uint64_t container_query_set_identifiers()
{
  return _container_query_set_identifiers();
}

uint64_t container_query_set_include_other_owners()
{
  return _container_query_set_include_other_owners();
}

uint64_t container_query_set_persona_unique_string()
{
  return _container_query_set_persona_unique_string();
}

uint64_t container_query_set_transient()
{
  return _container_query_set_transient();
}

uint64_t container_recreate_structure()
{
  return _container_recreate_structure();
}

uint64_t container_regenerate_uuid()
{
  return _container_regenerate_uuid();
}

uint64_t container_replace()
{
  return _container_replace();
}

uint64_t container_serialize_copy_deserialized_reference()
{
  return _container_serialize_copy_deserialized_reference();
}

uint64_t container_serialize_copy_serialized_reference()
{
  return _container_serialize_copy_serialized_reference();
}

uint64_t container_set_info_value()
{
  return _container_set_info_value();
}

uint64_t container_subdirectories_for_class()
{
  return _container_subdirectories_for_class();
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return _copyfile(from, to, state, flags);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
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

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void exit(int a1)
{
}

int fchmod(int a1, mode_t a2)
{
  return _fchmod(a1, a2);
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

int fcopyfile(int from_fd, int to_fd, copyfile_state_t a3, copyfile_flags_t flags)
{
  return _fcopyfile(from_fd, to_fd, a3, flags);
}

ssize_t fgetxattr(int fd, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return _fgetxattr(fd, name, value, size, position, options);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

void free(void *a1)
{
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return _fsetxattr(fd, name, value, size, position, options);
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

int fts_close(FTS *a1)
{
  return _fts_close(a1);
}

FTS *__cdecl fts_open_b(char *const *a1, int a2, void *a3)
{
  return _fts_open_b(a1, a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return _fts_read(a1);
}

int fts_set(FTS *a1, FTSENT *a2, int a3)
{
  return _fts_set(a1, a2, a3);
}

FILE *__cdecl funopen(const void *a1, int (__cdecl *a2)(void *, char *, int), int (__cdecl *a3)(void *, const char *, int), fpos_t (__cdecl *a4)(void *, fpos_t, int), int (__cdecl *a5)(void *))
{
  return _funopen(a1, a2, a3, a4, a5);
}

pid_t getpid(void)
{
  return _getpid();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return _getxattr(path, name, value, size, position, options);
}

int link(const char *a1, const char *a2)
{
  return _link(a1, a2);
}

int lstat(const char *a1, stat *a2)
{
  return _lstat(a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

int madvise(void *a1, size_t a2, int a3)
{
  return _madvise(a1, a2, a3);
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

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

int mkstemp(char *a1)
{
  return _mkstemp(a1);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return _mmap(a1, a2, a3, a4, a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return _munmap(a1, a2);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
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

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return _opendir(a1);
}

uint64_t os_eligibility_get_domain_answer()
{
  return _os_eligibility_get_domain_answer();
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return _pread(__fd, __buf, __nbyte, a4);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return _pthread_cond_broadcast(a1);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return _pthread_cond_signal(a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return _pthread_cond_wait(a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  return _pthread_rwlock_destroy(a1);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return _pthread_rwlock_init(a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return _pthread_rwlock_rdlock(a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return _pthread_rwlock_unlock(a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return _pthread_rwlock_wrlock(a1);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return _pwrite(__fd, __buf, __nbyte, a4);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return _readdir(a1);
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return _readlink(a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

int removexattr(const char *path, const char *name, int options)
{
  return _removexattr(path, name, options);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int sem_close(sem_t *a1)
{
  return _sem_close(a1);
}

sem_t *sem_open(const char *a1, int a2, ...)
{
  return _sem_open(a1, a2);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return _strlcat(__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return _strlcpy(__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return _strtoll(__str, __endptr, __base);
}

void swap_fat_arch(fat_arch *fat_archs, uint32_t nfat_arch, NXByteOrder target_byte_order)
{
}

void swap_fat_header(fat_header *fat_header, NXByteOrder target_byte_order)
{
}

int symlink(const char *a1, const char *a2)
{
  return _symlink(a1, a2);
}

void syslog(int a1, const char *a2, ...)
{
}

time_t time(time_t *a1)
{
  return _time(a1);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return _xpc_array_create(objects, count);
}

xpc_object_t xpc_string_create(const char *string)
{
  return _xpc_string_create(string);
}

id objc_msgSend_ICLUninstallRecord(void *a1, const char *a2, ...)
{
  return [a1 ICLUninstallRecord];
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

id objc_msgSend__appReferenceManagerInstance(void *a1, const char *a2, ...)
{
  return [a1 _appReferenceManagerInstance];
}

id objc_msgSend__builtInAppUpgradeFailureError(void *a1, const char *a2, ...)
{
  return [a1 _builtInAppUpgradeFailureError];
}

id objc_msgSend__clearPendingMountPath(void *a1, const char *a2, ...)
{
  return [a1 _clearPendingMountPath];
}

id objc_msgSend__containerLinkManager(void *a1, const char *a2, ...)
{
  return [a1 _containerLinkManager];
}

id objc_msgSend__containerProtectionManager(void *a1, const char *a2, ...)
{
  return [a1 _containerProtectionManager];
}

id objc_msgSend__createJournalEntry(void *a1, const char *a2, ...)
{
  return [a1 _createJournalEntry];
}

id objc_msgSend__diskImageManagerInstance(void *a1, const char *a2, ...)
{
  return [a1 _diskImageManagerInstance];
}

id objc_msgSend__freeProfileValidatedAppTracker(void *a1, const char *a2, ...)
{
  return [a1 _freeProfileValidatedAppTracker];
}

id objc_msgSend__helperServiceClient(void *a1, const char *a2, ...)
{
  return [a1 _helperServiceClient];
}

id objc_msgSend__initializeMountInfoFromStorage(void *a1, const char *a2, ...)
{
  return [a1 _initializeMountInfoFromStorage];
}

id objc_msgSend__installationJournalOperationType(void *a1, const char *a2, ...)
{
  return [a1 _installationJournalOperationType];
}

id objc_msgSend__invalidateObject(void *a1, const char *a2, ...)
{
  return [a1 _invalidateObject];
}

id objc_msgSend__journalInstance(void *a1, const char *a2, ...)
{
  return [a1 _journalInstance];
}

id objc_msgSend__keychainAccessGroupTracker(void *a1, const char *a2, ...)
{
  return [a1 _keychainAccessGroupTracker];
}

id objc_msgSend__lsApplicationWorkspaceInstance(void *a1, const char *a2, ...)
{
  return [a1 _lsApplicationWorkspaceInstance];
}

id objc_msgSend__mapPath(void *a1, const char *a2, ...)
{
  return [a1 _mapPath];
}

id objc_msgSend__noLongerPresentAppExtensionDataContainers(void *a1, const char *a2, ...)
{
  return [a1 _noLongerPresentAppExtensionDataContainers];
}

id objc_msgSend__privateContainerManager(void *a1, const char *a2, ...)
{
  return [a1 _privateContainerManager];
}

id objc_msgSend__purgeJournalEntry(void *a1, const char *a2, ...)
{
  return [a1 _purgeJournalEntry];
}

id objc_msgSend__sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 _sharedConnection];
}

id objc_msgSend__sharedContainerManager(void *a1, const char *a2, ...)
{
  return [a1 _sharedContainerManager];
}

id objc_msgSend__systemAppState(void *a1, const char *a2, ...)
{
  return [a1 _systemAppState];
}

id objc_msgSend__uninstalledAppList(void *a1, const char *a2, ...)
{
  return [a1 _uninstalledAppList];
}

id objc_msgSend__updateContainerStatePostCommit(void *a1, const char *a2, ...)
{
  return [a1 _updateContainerStatePostCommit];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allUsers(void *a1, const char *a2, ...)
{
  return [a1 allUsers];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_allowDeletableSystemApps(void *a1, const char *a2, ...)
{
  return [a1 allowDeletableSystemApps];
}

id objc_msgSend_allowLocalProvisioned(void *a1, const char *a2, ...)
{
  return [a1 allowLocalProvisioned];
}

id objc_msgSend_allowPatchWithoutSinf(void *a1, const char *a2, ...)
{
  return [a1 allowPatchWithoutSinf];
}

id objc_msgSend_allowsInternalSecurityPolicy(void *a1, const char *a2, ...)
{
  return [a1 allowsInternalSecurityPolicy];
}

id objc_msgSend_alternateIconName(void *a1, const char *a2, ...)
{
  return [a1 alternateIconName];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_appExtensionBundles(void *a1, const char *a2, ...)
{
  return [a1 appExtensionBundles];
}

id objc_msgSend_appExtensionDataContainers(void *a1, const char *a2, ...)
{
  return [a1 appExtensionDataContainers];
}

id objc_msgSend_appReferencesEnabled(void *a1, const char *a2, ...)
{
  return [a1 appReferencesEnabled];
}

id objc_msgSend_attemptCount(void *a1, const char *a2, ...)
{
  return [a1 attemptCount];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_autoInstallOverride(void *a1, const char *a2, ...)
{
  return [a1 autoInstallOverride];
}

id objc_msgSend_backedUpStateDirectory(void *a1, const char *a2, ...)
{
  return [a1 backedUpStateDirectory];
}

id objc_msgSend_blockArray(void *a1, const char *a2, ...)
{
  return [a1 blockArray];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_builtInApplicationBundleIDs(void *a1, const char *a2, ...)
{
  return [a1 builtInApplicationBundleIDs];
}

id objc_msgSend_builtInFrameworkBundleIDs(void *a1, const char *a2, ...)
{
  return [a1 builtInFrameworkBundleIDs];
}

id objc_msgSend_bundle(void *a1, const char *a2, ...)
{
  return [a1 bundle];
}

id objc_msgSend_bundleContainer(void *a1, const char *a2, ...)
{
  return [a1 bundleContainer];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_bundleIDs(void *a1, const char *a2, ...)
{
  return [a1 bundleIDs];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bundleName(void *a1, const char *a2, ...)
{
  return [a1 bundleName];
}

id objc_msgSend_bundleRecordsToRegister(void *a1, const char *a2, ...)
{
  return [a1 bundleRecordsToRegister];
}

id objc_msgSend_bundleShortVersion(void *a1, const char *a2, ...)
{
  return [a1 bundleShortVersion];
}

id objc_msgSend_bundleShortVersionString(void *a1, const char *a2, ...)
{
  return [a1 bundleShortVersionString];
}

id objc_msgSend_bundleSigningInfo(void *a1, const char *a2, ...)
{
  return [a1 bundleSigningInfo];
}

id objc_msgSend_bundleType(void *a1, const char *a2, ...)
{
  return [a1 bundleType];
}

id objc_msgSend_bundleTypeDescription(void *a1, const char *a2, ...)
{
  return [a1 bundleTypeDescription];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return [a1 bundleURL];
}

id objc_msgSend_bundleVersion(void *a1, const char *a2, ...)
{
  return [a1 bundleVersion];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cachesDirectory(void *a1, const char *a2, ...)
{
  return [a1 cachesDirectory];
}

id objc_msgSend_calcDynamic(void *a1, const char *a2, ...)
{
  return [a1 calcDynamic];
}

id objc_msgSend_calcShared(void *a1, const char *a2, ...)
{
  return [a1 calcShared];
}

id objc_msgSend_calcStatic(void *a1, const char *a2, ...)
{
  return [a1 calcStatic];
}

id objc_msgSend_callStackSymbols(void *a1, const char *a2, ...)
{
  return [a1 callStackSymbols];
}

id objc_msgSend_cfBundleShortVersion(void *a1, const char *a2, ...)
{
  return [a1 cfBundleShortVersion];
}

id objc_msgSend_cfBundleVersion(void *a1, const char *a2, ...)
{
  return [a1 cfBundleVersion];
}

id objc_msgSend_client(void *a1, const char *a2, ...)
{
  return [a1 client];
}

id objc_msgSend_clientName(void *a1, const char *a2, ...)
{
  return [a1 clientName];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_codeInfoIdentifier(void *a1, const char *a2, ...)
{
  return [a1 codeInfoIdentifier];
}

id objc_msgSend_codeSignatureVerificationState(void *a1, const char *a2, ...)
{
  return [a1 codeSignatureVerificationState];
}

id objc_msgSend_codeSignerType(void *a1, const char *a2, ...)
{
  return [a1 codeSignerType];
}

id objc_msgSend_codeSigningEnforcementIsDisabled(void *a1, const char *a2, ...)
{
  return [a1 codeSigningEnforcementIsDisabled];
}

id objc_msgSend_commandLineArgs(void *a1, const char *a2, ...)
{
  return [a1 commandLineArgs];
}

id objc_msgSend_companionAppIdentifier(void *a1, const char *a2, ...)
{
  return [a1 companionAppIdentifier];
}

id objc_msgSend_compatibilityLinkDestination(void *a1, const char *a2, ...)
{
  return [a1 compatibilityLinkDestination];
}

id objc_msgSend_containerClass(void *a1, const char *a2, ...)
{
  return [a1 containerClass];
}

id objc_msgSend_containerURL(void *a1, const char *a2, ...)
{
  return [a1 containerURL];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_coreServicesAppBundleIDToInfoMap(void *a1, const char *a2, ...)
{
  return [a1 coreServicesAppBundleIDToInfoMap];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_currentUser(void *a1, const char *a2, ...)
{
  return [a1 currentUser];
}

id objc_msgSend_currentUserDataDirectory(void *a1, const char *a2, ...)
{
  return [a1 currentUserDataDirectory];
}

id objc_msgSend_currentUserJournalStorageBaseURL(void *a1, const char *a2, ...)
{
  return [a1 currentUserJournalStorageBaseURL];
}

id objc_msgSend_currentUserLaunchServicesOperationLookAsideStorageBaseURL(void *a1, const char *a2, ...)
{
  return [a1 currentUserLaunchServicesOperationLookAsideStorageBaseURL];
}

id objc_msgSend_currentUserLaunchServicesOperationStorageBaseURL(void *a1, const char *a2, ...)
{
  return [a1 currentUserLaunchServicesOperationStorageBaseURL];
}

id objc_msgSend_dataContainer(void *a1, const char *a2, ...)
{
  return [a1 dataContainer];
}

id objc_msgSend_dataDirectory(void *a1, const char *a2, ...)
{
  return [a1 dataDirectory];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_destURL(void *a1, const char *a2, ...)
{
  return [a1 destURL];
}

id objc_msgSend_developerDirectories(void *a1, const char *a2, ...)
{
  return [a1 developerDirectories];
}

id objc_msgSend_deviceHasPersonas(void *a1, const char *a2, ...)
{
  return [a1 deviceHasPersonas];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_diskUsage(void *a1, const char *a2, ...)
{
  return [a1 diskUsage];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return [a1 distantPast];
}

id objc_msgSend_distributorID(void *a1, const char *a2, ...)
{
  return [a1 distributorID];
}

id objc_msgSend_distributorInfo(void *a1, const char *a2, ...)
{
  return [a1 distributorInfo];
}

id objc_msgSend_distributorIsFirstPartyApple(void *a1, const char *a2, ...)
{
  return [a1 distributorIsFirstPartyApple];
}

id objc_msgSend_distributorIsThirdParty(void *a1, const char *a2, ...)
{
  return [a1 distributorIsThirdParty];
}

id objc_msgSend_distributorNameForCurrentLocale(void *a1, const char *a2, ...)
{
  return [a1 distributorNameForCurrentLocale];
}

id objc_msgSend_distributorType(void *a1, const char *a2, ...)
{
  return [a1 distributorType];
}

id objc_msgSend_doesNotHaveBundleContainer(void *a1, const char *a2, ...)
{
  return [a1 doesNotHaveBundleContainer];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_driverKitExtensionBundles(void *a1, const char *a2, ...)
{
  return [a1 driverKitExtensionBundles];
}

id objc_msgSend_effectiveGroupIdentifier(void *a1, const char *a2, ...)
{
  return [a1 effectiveGroupIdentifier];
}

id objc_msgSend_effectiveUserIdentifier(void *a1, const char *a2, ...)
{
  return [a1 effectiveUserIdentifier];
}

id objc_msgSend_eligibilityOperationType(void *a1, const char *a2, ...)
{
  return [a1 eligibilityOperationType];
}

id objc_msgSend_embeddedWatchApp(void *a1, const char *a2, ...)
{
  return [a1 embeddedWatchApp];
}

id objc_msgSend_emptyPrecondition(void *a1, const char *a2, ...)
{
  return [a1 emptyPrecondition];
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return [a1 encodedData];
}

id objc_msgSend_entitlements(void *a1, const char *a2, ...)
{
  return [a1 entitlements];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_executableURL(void *a1, const char *a2, ...)
{
  return [a1 executableURL];
}

id objc_msgSend_existingBundleContainer(void *a1, const char *a2, ...)
{
  return [a1 existingBundleContainer];
}

id objc_msgSend_existingBundleShortVersion(void *a1, const char *a2, ...)
{
  return [a1 existingBundleShortVersion];
}

id objc_msgSend_existingBundleVersion(void *a1, const char *a2, ...)
{
  return [a1 existingBundleVersion];
}

id objc_msgSend_extensionPointIdentifier(void *a1, const char *a2, ...)
{
  return [a1 extensionPointIdentifier];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_finishDecoding(void *a1, const char *a2, ...)
{
  return [a1 finishDecoding];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_fmWrite(void *a1, const char *a2, ...)
{
  return [a1 fmWrite];
}

id objc_msgSend_frameworkBundles(void *a1, const char *a2, ...)
{
  return [a1 frameworkBundles];
}

id objc_msgSend_geoJSONData(void *a1, const char *a2, ...)
{
  return [a1 geoJSONData];
}

id objc_msgSend_gid(void *a1, const char *a2, ...)
{
  return [a1 gid];
}

id objc_msgSend_hasInternalContent(void *a1, const char *a2, ...)
{
  return [a1 hasInternalContent];
}

id objc_msgSend_hasParallelPlaceholder(void *a1, const char *a2, ...)
{
  return [a1 hasParallelPlaceholder];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_hostVersion(void *a1, const char *a2, ...)
{
  return [a1 hostVersion];
}

id objc_msgSend_iTunesArtworkData(void *a1, const char *a2, ...)
{
  return [a1 iTunesArtworkData];
}

id objc_msgSend_iTunesMetadata(void *a1, const char *a2, ...)
{
  return [a1 iTunesMetadata];
}

id objc_msgSend_iTunesMetadataURL(void *a1, const char *a2, ...)
{
  return [a1 iTunesMetadataURL];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_identifierLocked(void *a1, const char *a2, ...)
{
  return [a1 identifierLocked];
}

id objc_msgSend_identifiers(void *a1, const char *a2, ...)
{
  return [a1 identifiers];
}

id objc_msgSend_identifiersMap(void *a1, const char *a2, ...)
{
  return [a1 identifiersMap];
}

id objc_msgSend_identities(void *a1, const char *a2, ...)
{
  return [a1 identities];
}

id objc_msgSend_identity(void *a1, const char *a2, ...)
{
  return [a1 identity];
}

id objc_msgSend_infoPlistHash(void *a1, const char *a2, ...)
{
  return [a1 infoPlistHash];
}

id objc_msgSend_infoPlistHashAlgorithm(void *a1, const char *a2, ...)
{
  return [a1 infoPlistHashAlgorithm];
}

id objc_msgSend_infoPlistSubset(void *a1, const char *a2, ...)
{
  return [a1 infoPlistSubset];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_installIntent(void *a1, const char *a2, ...)
{
  return [a1 installIntent];
}

id objc_msgSend_installOperationType(void *a1, const char *a2, ...)
{
  return [a1 installOperationType];
}

id objc_msgSend_installOptions(void *a1, const char *a2, ...)
{
  return [a1 installOptions];
}

id objc_msgSend_installQOSOverride(void *a1, const char *a2, ...)
{
  return [a1 installQOSOverride];
}

id objc_msgSend_installSessionID(void *a1, const char *a2, ...)
{
  return [a1 installSessionID];
}

id objc_msgSend_installTargetType(void *a1, const char *a2, ...)
{
  return [a1 installTargetType];
}

id objc_msgSend_installTypeSummaryString(void *a1, const char *a2, ...)
{
  return [a1 installTypeSummaryString];
}

id objc_msgSend_installURL(void *a1, const char *a2, ...)
{
  return [a1 installURL];
}

id objc_msgSend_installationBlacklist(void *a1, const char *a2, ...)
{
  return [a1 installationBlacklist];
}

id objc_msgSend_installationDomain(void *a1, const char *a2, ...)
{
  return [a1 installationDomain];
}

id objc_msgSend_installationRequestorAuditToken(void *a1, const char *a2, ...)
{
  return [a1 installationRequestorAuditToken];
}

id objc_msgSend_installdLibraryPath(void *a1, const char *a2, ...)
{
  return [a1 installdLibraryPath];
}

id objc_msgSend_installdPath(void *a1, const char *a2, ...)
{
  return [a1 installdPath];
}

id objc_msgSend_installedDistributorID(void *a1, const char *a2, ...)
{
  return [a1 installedDistributorID];
}

id objc_msgSend_instanceForCurrentUser(void *a1, const char *a2, ...)
{
  return [a1 instanceForCurrentUser];
}

id objc_msgSend_instanceForSystemSharedContent(void *a1, const char *a2, ...)
{
  return [a1 instanceForSystemSharedContent];
}

id objc_msgSend_instanceID(void *a1, const char *a2, ...)
{
  return [a1 instanceID];
}

id objc_msgSend_instanceStorageBaseURL(void *a1, const char *a2, ...)
{
  return [a1 instanceStorageBaseURL];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_internalAppBundleIDToInfoMap(void *a1, const char *a2, ...)
{
  return [a1 internalAppBundleIDToInfoMap];
}

id objc_msgSend_internalQueue(void *a1, const char *a2, ...)
{
  return [a1 internalQueue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invalidateCache(void *a1, const char *a2, ...)
{
  return [a1 invalidateCache];
}

id objc_msgSend_isDataSeparatedPersona(void *a1, const char *a2, ...)
{
  return [a1 isDataSeparatedPersona];
}

id objc_msgSend_isDeveloperInstall(void *a1, const char *a2, ...)
{
  return [a1 isDeveloperInstall];
}

id objc_msgSend_isEnterprisePersona(void *a1, const char *a2, ...)
{
  return [a1 isEnterprisePersona];
}

id objc_msgSend_isExtensionBasedWatchKitApp(void *a1, const char *a2, ...)
{
  return [a1 isExtensionBasedWatchKitApp];
}

id objc_msgSend_isExtensionlessWatchKitApp(void *a1, const char *a2, ...)
{
  return [a1 isExtensionlessWatchKitApp];
}

id objc_msgSend_isLastReference(void *a1, const char *a2, ...)
{
  return [a1 isLastReference];
}

id objc_msgSend_isLaunchProhibited(void *a1, const char *a2, ...)
{
  return [a1 isLaunchProhibited];
}

id objc_msgSend_isLinked(void *a1, const char *a2, ...)
{
  return [a1 isLinked];
}

id objc_msgSend_isLocked(void *a1, const char *a2, ...)
{
  return [a1 isLocked];
}

id objc_msgSend_isPersonalPersona(void *a1, const char *a2, ...)
{
  return [a1 isPersonalPersona];
}

id objc_msgSend_isPlaceholder(void *a1, const char *a2, ...)
{
  return [a1 isPlaceholder];
}

id objc_msgSend_isPlaceholderInstall(void *a1, const char *a2, ...)
{
  return [a1 isPlaceholderInstall];
}

id objc_msgSend_isRemovableSystemApp(void *a1, const char *a2, ...)
{
  return [a1 isRemovableSystemApp];
}

id objc_msgSend_isSharediPad(void *a1, const char *a2, ...)
{
  return [a1 isSharediPad];
}

id objc_msgSend_isSystemAppInstall(void *a1, const char *a2, ...)
{
  return [a1 isSystemAppInstall];
}

id objc_msgSend_isSystemPersona(void *a1, const char *a2, ...)
{
  return [a1 isSystemPersona];
}

id objc_msgSend_isTransient(void *a1, const char *a2, ...)
{
  return [a1 isTransient];
}

id objc_msgSend_isUserInitiated(void *a1, const char *a2, ...)
{
  return [a1 isUserInitiated];
}

id objc_msgSend_isWatchApp(void *a1, const char *a2, ...)
{
  return [a1 isWatchApp];
}

id objc_msgSend_isWatchKitExtension(void *a1, const char *a2, ...)
{
  return [a1 isWatchKitExtension];
}

id objc_msgSend_isWatchOnlyApp(void *a1, const char *a2, ...)
{
  return [a1 isWatchOnlyApp];
}

id objc_msgSend_journalEntry(void *a1, const char *a2, ...)
{
  return [a1 journalEntry];
}

id objc_msgSend_journalEntryClasses(void *a1, const char *a2, ...)
{
  return [a1 journalEntryClasses];
}

id objc_msgSend_journalEntryID(void *a1, const char *a2, ...)
{
  return [a1 journalEntryID];
}

id objc_msgSend_journalPhase(void *a1, const char *a2, ...)
{
  return [a1 journalPhase];
}

id objc_msgSend_journalStorageBase(void *a1, const char *a2, ...)
{
  return [a1 journalStorageBase];
}

id objc_msgSend_journalStorageBaseURL(void *a1, const char *a2, ...)
{
  return [a1 journalStorageBaseURL];
}

id objc_msgSend_lastBuildInfoFileURL(void *a1, const char *a2, ...)
{
  return [a1 lastBuildInfoFileURL];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_launchServicesOperationLookAsideStorageBaseURL(void *a1, const char *a2, ...)
{
  return [a1 launchServicesOperationLookAsideStorageBaseURL];
}

id objc_msgSend_launchServicesOperationStorageBaseURL(void *a1, const char *a2, ...)
{
  return [a1 launchServicesOperationStorageBaseURL];
}

id objc_msgSend_launchWarningData(void *a1, const char *a2, ...)
{
  return [a1 launchWarningData];
}

id objc_msgSend_legacyRecordDictionary(void *a1, const char *a2, ...)
{
  return [a1 legacyRecordDictionary];
}

id objc_msgSend_legacySinfInfoDictionary(void *a1, const char *a2, ...)
{
  return [a1 legacySinfInfoDictionary];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_linkToParentBundleID(void *a1, const char *a2, ...)
{
  return [a1 linkToParentBundleID];
}

id objc_msgSend_linkedChildBundleIDs(void *a1, const char *a2, ...)
{
  return [a1 linkedChildBundleIDs];
}

id objc_msgSend_linkedParentBundleID(void *a1, const char *a2, ...)
{
  return [a1 linkedParentBundleID];
}

id objc_msgSend_listQueue(void *a1, const char *a2, ...)
{
  return [a1 listQueue];
}

id objc_msgSend_localSigningIsUnrestricted(void *a1, const char *a2, ...)
{
  return [a1 localSigningIsUnrestricted];
}

id objc_msgSend_lockedIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 lockedIdentifiers];
}

id objc_msgSend_logDirectory(void *a1, const char *a2, ...)
{
  return [a1 logDirectory];
}

id objc_msgSend_lookAsideStorageBaseURL(void *a1, const char *a2, ...)
{
  return [a1 lookAsideStorageBaseURL];
}

id objc_msgSend_lsInstallType(void *a1, const char *a2, ...)
{
  return [a1 lsInstallType];
}

id objc_msgSend_lsRegisterQueue(void *a1, const char *a2, ...)
{
  return [a1 lsRegisterQueue];
}

id objc_msgSend_manifestURL(void *a1, const char *a2, ...)
{
  return [a1 manifestURL];
}

id objc_msgSend_manifestVersion(void *a1, const char *a2, ...)
{
  return [a1 manifestVersion];
}

id objc_msgSend_mcmContainer(void *a1, const char *a2, ...)
{
  return [a1 mcmContainer];
}

id objc_msgSend_migrationPlistURL(void *a1, const char *a2, ...)
{
  return [a1 migrationPlistURL];
}

id objc_msgSend_minimumWatchOSVersionIsPreV6(void *a1, const char *a2, ...)
{
  return [a1 minimumWatchOSVersionIsPreV6];
}

id objc_msgSend_mountInfo(void *a1, const char *a2, ...)
{
  return [a1 mountInfo];
}

id objc_msgSend_mountInfoAccessQueue(void *a1, const char *a2, ...)
{
  return [a1 mountInfoAccessQueue];
}

id objc_msgSend_mountPoint(void *a1, const char *a2, ...)
{
  return [a1 mountPoint];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_nSimultaneousInstallations(void *a1, const char *a2, ...)
{
  return [a1 nSimultaneousInstallations];
}

id objc_msgSend_needsDataContainer(void *a1, const char *a2, ...)
{
  return [a1 needsDataContainer];
}

id objc_msgSend_needsSinf(void *a1, const char *a2, ...)
{
  return [a1 needsSinf];
}

id objc_msgSend_noLongerPresentAppExtensionDataContainers(void *a1, const char *a2, ...)
{
  return [a1 noLongerPresentAppExtensionDataContainers];
}

id objc_msgSend_onlyV1(void *a1, const char *a2, ...)
{
  return [a1 onlyV1];
}

id objc_msgSend_operationType(void *a1, const char *a2, ...)
{
  return [a1 operationType];
}

id objc_msgSend_operationUUID(void *a1, const char *a2, ...)
{
  return [a1 operationUUID];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return [a1 options];
}

id objc_msgSend_packageFormat(void *a1, const char *a2, ...)
{
  return [a1 packageFormat];
}

id objc_msgSend_parallelPlaceholderURL(void *a1, const char *a2, ...)
{
  return [a1 parallelPlaceholderURL];
}

id objc_msgSend_parentBundleID(void *a1, const char *a2, ...)
{
  return [a1 parentBundleID];
}

id objc_msgSend_parentToLinkedChildrenMap(void *a1, const char *a2, ...)
{
  return [a1 parentToLinkedChildrenMap];
}

id objc_msgSend_patchType(void *a1, const char *a2, ...)
{
  return [a1 patchType];
}

id objc_msgSend_patchTypeName(void *a1, const char *a2, ...)
{
  return [a1 patchTypeName];
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

id objc_msgSend_pendingMountPath(void *a1, const char *a2, ...)
{
  return [a1 pendingMountPath];
}

id objc_msgSend_pendingOperations(void *a1, const char *a2, ...)
{
  return [a1 pendingOperations];
}

id objc_msgSend_percentComplete(void *a1, const char *a2, ...)
{
  return [a1 percentComplete];
}

id objc_msgSend_personaAttributesMap(void *a1, const char *a2, ...)
{
  return [a1 personaAttributesMap];
}

id objc_msgSend_personaGenerationIdentifier(void *a1, const char *a2, ...)
{
  return [a1 personaGenerationIdentifier];
}

id objc_msgSend_personaType(void *a1, const char *a2, ...)
{
  return [a1 personaType];
}

id objc_msgSend_personaUniqueString(void *a1, const char *a2, ...)
{
  return [a1 personaUniqueString];
}

id objc_msgSend_personaUniqueStrings(void *a1, const char *a2, ...)
{
  return [a1 personaUniqueStrings];
}

id objc_msgSend_personas(void *a1, const char *a2, ...)
{
  return [a1 personas];
}

id objc_msgSend_placeholderOnly(void *a1, const char *a2, ...)
{
  return [a1 placeholderOnly];
}

id objc_msgSend_plistRepresentation(void *a1, const char *a2, ...)
{
  return [a1 plistRepresentation];
}

id objc_msgSend_preflightAndPatchTime(void *a1, const char *a2, ...)
{
  return [a1 preflightAndPatchTime];
}

id objc_msgSend_preflightUninstalledMap(void *a1, const char *a2, ...)
{
  return [a1 preflightUninstalledMap];
}

id objc_msgSend_preservePlaceholderAsParallel(void *a1, const char *a2, ...)
{
  return [a1 preservePlaceholderAsParallel];
}

id objc_msgSend_primaryPersonaString(void *a1, const char *a2, ...)
{
  return [a1 primaryPersonaString];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_profileValidationType(void *a1, const char *a2, ...)
{
  return [a1 profileValidationType];
}

id objc_msgSend_progressBlock(void *a1, const char *a2, ...)
{
  return [a1 progressBlock];
}

id objc_msgSend_provisioningProfileInstallFailureIsFatal(void *a1, const char *a2, ...)
{
  return [a1 provisioningProfileInstallFailureIsFatal];
}

id objc_msgSend_provisioningProfiles(void *a1, const char *a2, ...)
{
  return [a1 provisioningProfiles];
}

id objc_msgSend_purge(void *a1, const char *a2, ...)
{
  return [a1 purge];
}

id objc_msgSend_q(void *a1, const char *a2, ...)
{
  return [a1 q];
}

id objc_msgSend_receipt(void *a1, const char *a2, ...)
{
  return [a1 receipt];
}

id objc_msgSend_reconcile(void *a1, const char *a2, ...)
{
  return [a1 reconcile];
}

id objc_msgSend_recordPromise(void *a1, const char *a2, ...)
{
  return [a1 recordPromise];
}

id objc_msgSend_referenceStorageURL(void *a1, const char *a2, ...)
{
  return [a1 referenceStorageURL];
}

id objc_msgSend_refs(void *a1, const char *a2, ...)
{
  return [a1 refs];
}

id objc_msgSend_relativePath(void *a1, const char *a2, ...)
{
  return [a1 relativePath];
}

id objc_msgSend_releaseTerminationAssertion(void *a1, const char *a2, ...)
{
  return [a1 releaseTerminationAssertion];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeSinf(void *a1, const char *a2, ...)
{
  return [a1 removeSinf];
}

id objc_msgSend_requireEligibilityChecksForAppsInDevelopment(void *a1, const char *a2, ...)
{
  return [a1 requireEligibilityChecksForAppsInDevelopment];
}

id objc_msgSend_resetMountPaths(void *a1, const char *a2, ...)
{
  return [a1 resetMountPaths];
}

id objc_msgSend_resultDict(void *a1, const char *a2, ...)
{
  return [a1 resultDict];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_roleUserMigrationMarkerFilePath(void *a1, const char *a2, ...)
{
  return [a1 roleUserMigrationMarkerFilePath];
}

id objc_msgSend_rootSinfURL(void *a1, const char *a2, ...)
{
  return [a1 rootSinfURL];
}

id objc_msgSend_sendDelegateMessagesComplete(void *a1, const char *a2, ...)
{
  return [a1 sendDelegateMessagesComplete];
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return [a1 serialNumber];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedList(void *a1, const char *a2, ...)
{
  return [a1 sharedList];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_sharedTracker(void *a1, const char *a2, ...)
{
  return [a1 sharedTracker];
}

id objc_msgSend_shouldModifyExistingContainers(void *a1, const char *a2, ...)
{
  return [a1 shouldModifyExistingContainers];
}

id objc_msgSend_shouldPersist(void *a1, const char *a2, ...)
{
  return [a1 shouldPersist];
}

id objc_msgSend_sinfData(void *a1, const char *a2, ...)
{
  return [a1 sinfData];
}

id objc_msgSend_sinfDataType(void *a1, const char *a2, ...)
{
  return [a1 sinfDataType];
}

id objc_msgSend_stagedJournalEntryUniqueID(void *a1, const char *a2, ...)
{
  return [a1 stagedJournalEntryUniqueID];
}

id objc_msgSend_stagingRoot(void *a1, const char *a2, ...)
{
  return [a1 stagingRoot];
}

id objc_msgSend_stagingRootForSystemContent(void *a1, const char *a2, ...)
{
  return [a1 stagingRootForSystemContent];
}

id objc_msgSend_stagingRootURL(void *a1, const char *a2, ...)
{
  return [a1 stagingRootURL];
}

id objc_msgSend_stagingTime(void *a1, const char *a2, ...)
{
  return [a1 stagingTime];
}

id objc_msgSend_stagingURL(void *a1, const char *a2, ...)
{
  return [a1 stagingURL];
}

id objc_msgSend_standardInfoMapInfoPlistKeys(void *a1, const char *a2, ...)
{
  return [a1 standardInfoMapInfoPlistKeys];
}

id objc_msgSend_stashMode(void *a1, const char *a2, ...)
{
  return [a1 stashMode];
}

id objc_msgSend_stashedContainer(void *a1, const char *a2, ...)
{
  return [a1 stashedContainer];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_storageBaseURL(void *a1, const char *a2, ...)
{
  return [a1 storageBaseURL];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringByStandardizingPath(void *a1, const char *a2, ...)
{
  return [a1 stringByStandardizingPath];
}

id objc_msgSend_supportedDevices(void *a1, const char *a2, ...)
{
  return [a1 supportedDevices];
}

id objc_msgSend_systemAppBundleIDToInfoMap(void *a1, const char *a2, ...)
{
  return [a1 systemAppBundleIDToInfoMap];
}

id objc_msgSend_systemAppMigrationComplete(void *a1, const char *a2, ...)
{
  return [a1 systemAppMigrationComplete];
}

id objc_msgSend_systemAppMigrationStateQueue(void *a1, const char *a2, ...)
{
  return [a1 systemAppMigrationStateQueue];
}

id objc_msgSend_systemAppPlaceholderBundleIDs(void *a1, const char *a2, ...)
{
  return [a1 systemAppPlaceholderBundleIDs];
}

id objc_msgSend_systemAppsDirectory(void *a1, const char *a2, ...)
{
  return [a1 systemAppsDirectory];
}

id objc_msgSend_targetUID(void *a1, const char *a2, ...)
{
  return [a1 targetUID];
}

id objc_msgSend_targets(void *a1, const char *a2, ...)
{
  return [a1 targets];
}

id objc_msgSend_targetsBrowserExtensionPoint(void *a1, const char *a2, ...)
{
  return [a1 targetsBrowserExtensionPoint];
}

id objc_msgSend_terminationAssertionReleased(void *a1, const char *a2, ...)
{
  return [a1 terminationAssertionReleased];
}

id objc_msgSend_testFileSentinelForSyncURL(void *a1, const char *a2, ...)
{
  return [a1 testFileSentinelForSyncURL];
}

id objc_msgSend_testOverrides(void *a1, const char *a2, ...)
{
  return [a1 testOverrides];
}

id objc_msgSend_testOverridesEnabled(void *a1, const char *a2, ...)
{
  return [a1 testOverridesEnabled];
}

id objc_msgSend_toolArch(void *a1, const char *a2, ...)
{
  return [a1 toolArch];
}

id objc_msgSend_toolBuiltWithSDKVersion(void *a1, const char *a2, ...)
{
  return [a1 toolBuiltWithSDKVersion];
}

id objc_msgSend_toolBuiltWithXcodeVersion(void *a1, const char *a2, ...)
{
  return [a1 toolBuiltWithXcodeVersion];
}

id objc_msgSend_toolVersion(void *a1, const char *a2, ...)
{
  return [a1 toolVersion];
}

id objc_msgSend_transientBundleCleanupEnabled(void *a1, const char *a2, ...)
{
  return [a1 transientBundleCleanupEnabled];
}

id objc_msgSend_twoStageAppInstallEnabled(void *a1, const char *a2, ...)
{
  return [a1 twoStageAppInstallEnabled];
}

id objc_msgSend_uiSupportedDevices(void *a1, const char *a2, ...)
{
  return [a1 uiSupportedDevices];
}

id objc_msgSend_uid(void *a1, const char *a2, ...)
{
  return [a1 uid];
}

id objc_msgSend_uninstalledDictionary(void *a1, const char *a2, ...)
{
  return [a1 uninstalledDictionary];
}

id objc_msgSend_uninstalledList(void *a1, const char *a2, ...)
{
  return [a1 uninstalledList];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifier];
}

id objc_msgSend_uniqueInstallID(void *a1, const char *a2, ...)
{
  return [a1 uniqueInstallID];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_updatedBundleShortVersion(void *a1, const char *a2, ...)
{
  return [a1 updatedBundleShortVersion];
}

id objc_msgSend_updatedBundleVersion(void *a1, const char *a2, ...)
{
  return [a1 updatedBundleVersion];
}

id objc_msgSend_upgradingBuiltInAppAtURL(void *a1, const char *a2, ...)
{
  return [a1 upgradingBuiltInAppAtURL];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userPersonaBundleIDList(void *a1, const char *a2, ...)
{
  return [a1 userPersonaBundleIDList];
}

id objc_msgSend_userPersonaType(void *a1, const char *a2, ...)
{
  return [a1 userPersonaType];
}

id objc_msgSend_userPersonaUniqueString(void *a1, const char *a2, ...)
{
  return [a1 userPersonaUniqueString];
}

id objc_msgSend_verificationTime(void *a1, const char *a2, ...)
{
  return [a1 verificationTime];
}

id objc_msgSend_waitForDeletion(void *a1, const char *a2, ...)
{
  return [a1 waitForDeletion];
}

id objc_msgSend_waitingTime(void *a1, const char *a2, ...)
{
  return [a1 waitingTime];
}

id objc_msgSend_wasErroneousContainerCleanupDone(void *a1, const char *a2, ...)
{
  return [a1 wasErroneousContainerCleanupDone];
}

id objc_msgSend_watchKitAppExecutableHash(void *a1, const char *a2, ...)
{
  return [a1 watchKitAppExecutableHash];
}

id objc_msgSend_watchKitAppRunsIndependentlyOfCompanion(void *a1, const char *a2, ...)
{
  return [a1 watchKitAppRunsIndependentlyOfCompanion];
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceAndNewlineCharacterSet];
}

id objc_msgSend_xpcConnection(void *a1, const char *a2, ...)
{
  return [a1 xpcConnection];
}

id objc_msgSend_xpcServiceBundles(void *a1, const char *a2, ...)
{
  return [a1 xpcServiceBundles];
}

id objc_msgSend_xpcServiceBundlesEnabled(void *a1, const char *a2, ...)
{
  return [a1 xpcServiceBundlesEnabled];
}